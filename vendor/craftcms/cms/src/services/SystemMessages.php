<?php
/**
 * @link https://craftcms.com/
 * @copyright Copyright (c) Pixel & Tonic, Inc.
 * @license https://craftcms.github.io/license/
 */

namespace craft\services;

use Craft;
use craft\db\Query;
use craft\db\Table;
use craft\enums\CmsEdition;
use craft\events\RegisterEmailMessagesEvent;
use craft\helpers\ArrayHelper;
use craft\models\SystemMessage;
use craft\records\SystemMessage as EmailMessageRecord;
use yii\base\Component;
use yii\db\Expression;

/**
 * System Messages service.
 *
 * An instance of the service is available via [[\craft\base\ApplicationTrait::getSystemMessages()|`Craft::$app->getSystemMessages()`]].
 *
 * @author Pixel & Tonic, Inc. <support@pixelandtonic.com>
 * @since 3.0.0
 */
class SystemMessages extends Component
{
    /**
     * @event RegisterEmailMessagesEvent The event that is triggered when registering system messages.
     *
     * ```php
     * use craft\base\Event;
     * use craft\events\RegisterEmailMessagesEvent;
     * use craft\services\SystemMessages;
     *
     * Event::on(
     *     SystemMessages::class,
     *     SystemMessages::EVENT_REGISTER_MESSAGES,
     *     function(RegisterEmailMessagesEvent $event) {
     *         $event->messages[] = [
     *             'key' => 'account_approved',
     *             'heading' => 'When a member’s account is approved',
     *             'subject' => 'Your account is approved!',
     *             'body' => "Hey {{user.friendlyName|e}},\n\nYour account with {{systemName}} has been approved by {{approver}}!",
     *         ];
     *     },
     * );
     * ```
     *
     * Once a system message is registered, it will be editable from the System Messages utility.
     *
     * System messages can be sent via [[\craft\mail\Mailer::composeFromKey()]]:
     *
     * ```php
     * Craft::$app->getMailer()
     *    ->composeFromKey('account_approved', [
     *        'approver' => $approver->friendlyName,
     *    ])
     *    ->setTo($user)
     *    ->send();
     * ```
     */
    public const EVENT_REGISTER_MESSAGES = 'registerMessages';

    /**
     * @var SystemMessage[]|null
     */
    private ?array $_defaultMessages = null;

    /**
     * Returns all of the default system email messages, without subject/body overrides.
     *
     * @return SystemMessage[]
     */
    public function getAllDefaultMessages(): array
    {
        if (isset($this->_defaultMessages)) {
            return $this->_defaultMessages;
        }

        // If the current language isn't one of the site's languages, switch to the primary site's language
        $language = Craft::$app->language;
        $i18n = Craft::$app->getI18n();
        if (!in_array($language, $i18n->getSiteLocaleIds())) {
            Craft::$app->language = Craft::$app->getSites()->getPrimarySite()->language;
        }

        $messages = [
            [
                'key' => 'account_activation',
                'heading' => Craft::t('app', 'account_activation_heading'),
                'subject' => Craft::t('app', 'account_activation_subject'),
                'body' => Craft::t('app', 'account_activation_body'),
            ],
            [
                'key' => 'verify_new_email',
                'heading' => Craft::t('app', 'verify_new_email_heading'),
                'subject' => Craft::t('app', 'verify_new_email_subject'),
                'body' => Craft::t('app', 'verify_new_email_body'),
            ],
            [
                'key' => 'forgot_password',
                'heading' => Craft::t('app', 'forgot_password_heading'),
                'subject' => Craft::t('app', 'forgot_password_subject'),
                'body' => Craft::t('app', 'forgot_password_body'),
            ],
            [
                'key' => 'test_email',
                'heading' => Craft::t('app', 'test_email_heading'),
                'subject' => Craft::t('app', 'test_email_subject'),
                'body' => Craft::t('app', 'test_email_body'),
            ],
        ];

        // Fire a 'registerMessages' event
        if ($this->hasEventHandlers(self::EVENT_REGISTER_MESSAGES)) {
            $event = new RegisterEmailMessagesEvent(['messages' => $messages]);
            $this->trigger(self::EVENT_REGISTER_MESSAGES, $event);
            $messages = $event->messages;
        }

        // Sort them all by key
        $messages = ArrayHelper::index($messages, 'key');

        // Make sure they're SystemMessage objects
        foreach ($messages as $key => $message) {
            if (is_array($message)) {
                $messages[$key] = new SystemMessage($message);
            }
        }

        // Put the original language back
        Craft::$app->language = $language;

        return $this->_defaultMessages = $messages;
    }

    /**
     * Returns a default system email messages by its key, without subject/body overrides.
     *
     * @param string $key
     * @return SystemMessage|null
     */
    public function getDefaultMessage(string $key): ?SystemMessage
    {
        return $this->getAllDefaultMessages()[$key] ?? null;
    }

    /**
     * Returns all of the system email messages in a given language, with subject/body overrides.
     *
     * @param string|null $language
     * @return SystemMessage[]
     */
    public function getAllMessages(?string $language = null): array
    {
        if ($language === null) {
            $language = Craft::$app->getSites()->getPrimarySite()->language;
        }

        // Start with the defaults
        $defaults = $this->getAllDefaultMessages();

        // Fetch any custom messages
        $overrides = $this->_createMessagesQuery()
            ->where(['language' => $language])
            ->all();

        // Combine them to create the final messages array
        $messages = [];

        foreach ($defaults as $key => $default) {
            $message = clone $default;

            // Has it been overridden?
            if (isset($overrides[$key])) {
                $message->subject = $overrides[$key]['subject'];
                $message->body = $overrides[$key]['body'];
            }

            $messages[] = $message;
        }

        return $messages;
    }

    /**
     * Returns a system email messages in a given language by its key, with subject/body overrides.
     *
     * @param string $key
     * @param string|null $language
     * @return SystemMessage|null
     */
    public function getMessage(string $key, ?string $language = null): ?SystemMessage
    {
        // Get the default message (and ensure $key is valid)
        if (($default = $this->getDefaultMessage($key)) === null) {
            return null;
        }

        $message = clone $default;

        if ($language === null) {
            $language = Craft::$app->getSites()->getPrimarySite()->language;
        }

        if (($pos = strpos($language, '-')) !== false) {
            $languageId = substr($language, 0, $pos);
        } else {
            $languageId = $language;
        }

        if (Craft::$app->edition->value >= CmsEdition::Pro->value) {
            // Fetch the customization (if there is one)
            $override = $this->_createMessagesQuery()
                ->select(['subject', 'body'])
                ->where(['key' => $key])
                ->andWhere([
                    'or',
                    ['language' => [$language, $languageId]],
                    ['like', 'language', "$languageId%", false],
                ])
                ->orderBy(new Expression('case when ([[language]] = :language) then 0 when ([[language]] = :languageId) then 1 else 2 end', [
                    'language' => $language,
                    'languageId' => $languageId,
                ]))
                ->one();

            if ($override) {
                $message->subject = $override['subject'];
                $message->body = $override['body'];
            }
        }

        return $message;
    }

    /**
     * Saves the subject/body overrides for a system email message.
     *
     * @param SystemMessage $message
     * @param string|null $language
     * @return bool
     */
    public function saveMessage(SystemMessage $message, ?string $language = null): bool
    {
        $record = $this->_getMessageRecord($message->key, $language);

        $record->subject = $message->subject;
        $record->body = $message->body;

        if ($record->save()) {
            return true;
        }

        $message->addErrors($record->getErrors());

        return false;
    }

    /**
     * Returns a new Query prepped to return system email messages from the DB.
     *
     * @return Query
     */
    private function _createMessagesQuery(): Query
    {
        return (new Query())
            ->select(['key', 'subject', 'body'])
            ->from([Table::SYSTEMMESSAGES])
            ->indexBy('key');
    }

    /**
     * Gets a message record by its key.
     *
     * @param string $key
     * @param string $language
     * @return EmailMessageRecord
     */
    private function _getMessageRecord(string $key, string $language): EmailMessageRecord
    {
        $record = EmailMessageRecord::findOne([
            'key' => $key,
            'language' => $language,
        ]);

        if (!$record) {
            $record = new EmailMessageRecord();
            $record->key = $key;
            $record->language = $language;
        }

        return $record;
    }
}
