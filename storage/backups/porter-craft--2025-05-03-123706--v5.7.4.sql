-- MySQL dump 10.13  Distrib 8.0.40, for Linux (x86_64)
--
-- Host: db    Database: db
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `id` int NOT NULL,
  `primaryOwnerId` int DEFAULT NULL,
  `fieldId` int DEFAULT NULL,
  `countryCode` varchar(255) NOT NULL,
  `administrativeArea` varchar(255) DEFAULT NULL,
  `locality` varchar(255) DEFAULT NULL,
  `dependentLocality` varchar(255) DEFAULT NULL,
  `postalCode` varchar(255) DEFAULT NULL,
  `sortingCode` varchar(255) DEFAULT NULL,
  `addressLine1` varchar(255) DEFAULT NULL,
  `addressLine2` varchar(255) DEFAULT NULL,
  `addressLine3` varchar(255) DEFAULT NULL,
  `organization` varchar(255) DEFAULT NULL,
  `organizationTaxId` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ofxucafkhpbclbehsouadhaicjqrqwibbedi` (`primaryOwnerId`),
  CONSTRAINT `fk_ofxucafkhpbclbehsouadhaicjqrqwibbedi` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tzphwowgodqhovcntcvjqxptxixmbysbdjae` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `pluginId` int DEFAULT NULL,
  `heading` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT '1',
  `dateRead` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_eyqscxrsnmtptzvxjcrdspjjzhqcdbqceefk` (`userId`,`unread`,`dateRead`,`dateCreated`),
  KEY `idx_epcpimgcbvgkdxlpmcfgwvjvpqfeuohqkaeh` (`dateRead`),
  KEY `fk_cziblcjvdeparfrccrusggulmrgelxuadcml` (`pluginId`),
  CONSTRAINT `fk_cziblcjvdeparfrccrusggulmrgelxuadcml` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_lwdrfyhfuzmtfvnakjmritfhyvhguoqdsswj` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assetindexdata`
--

DROP TABLE IF EXISTS `assetindexdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assetindexdata` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sessionId` int NOT NULL,
  `volumeId` int NOT NULL,
  `uri` text,
  `size` bigint unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `isDir` tinyint(1) DEFAULT '0',
  `recordId` int DEFAULT NULL,
  `isSkipped` tinyint(1) DEFAULT '0',
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_opebdrnhztklclqhavpyprthewkzooxceuww` (`sessionId`,`volumeId`),
  KEY `idx_raknuxbfyjjplbkfpyrxnzhisrszcnfchhof` (`volumeId`),
  CONSTRAINT `fk_gxfadxluoksinmjqfzxgjnqxlxyqefodfwjs` FOREIGN KEY (`sessionId`) REFERENCES `assetindexingsessions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pqxnihtcvvrdveyobfefgmatsortswgsdqsi` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assetindexingsessions`
--

DROP TABLE IF EXISTS `assetindexingsessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assetindexingsessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `indexedVolumes` text,
  `totalEntries` int DEFAULT NULL,
  `processedEntries` int NOT NULL DEFAULT '0',
  `cacheRemoteImages` tinyint(1) DEFAULT NULL,
  `listEmptyFolders` tinyint(1) DEFAULT '0',
  `isCli` tinyint(1) DEFAULT '0',
  `actionRequired` tinyint(1) DEFAULT '0',
  `processIfRootEmpty` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assets` (
  `id` int NOT NULL,
  `volumeId` int DEFAULT NULL,
  `folderId` int NOT NULL,
  `uploaderId` int DEFAULT NULL,
  `filename` varchar(255) NOT NULL,
  `kind` varchar(50) NOT NULL DEFAULT 'unknown',
  `alt` text,
  `width` int unsigned DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `size` bigint unsigned DEFAULT NULL,
  `focalPoint` varchar(13) DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_cgrknwwngjitdzbkbdcnokisnvqbhmgwycyz` (`filename`,`folderId`),
  KEY `idx_watwnqunsbiyawpcnqixkwzkxwspunrnduvy` (`folderId`),
  KEY `idx_ryxlewbdsjycmllnejcerhzifblyfcwlqpsp` (`volumeId`),
  KEY `fk_zmlnbaspioinbfcitqrmlvliqwhghdiwdraf` (`uploaderId`),
  CONSTRAINT `fk_gmxxfbdkhmmhwolfdhptvemxtigzrdkcyhwb` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_hywunjlxifzebgewjddvgvutsxgelmlwgycc` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_utupfjryrgtvmnasdkkklgbpodgnattkbwol` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zmlnbaspioinbfcitqrmlvliqwhghdiwdraf` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assets_sites`
--

DROP TABLE IF EXISTS `assets_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assets_sites` (
  `assetId` int NOT NULL,
  `siteId` int NOT NULL,
  `alt` text,
  PRIMARY KEY (`assetId`,`siteId`),
  KEY `fk_zgtzjqkpxbwheqazwykzgxsxzgeczxgkujax` (`siteId`),
  CONSTRAINT `fk_xpymrttqucsthmwcxxjmtvmrvrnjjxzrjycl` FOREIGN KEY (`assetId`) REFERENCES `assets` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zgtzjqkpxbwheqazwykzgxsxzgeczxgkujax` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `authenticator`
--

DROP TABLE IF EXISTS `authenticator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authenticator` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `auth2faSecret` varchar(255) DEFAULT NULL,
  `oldTimestamp` int unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_fvwysosviaalyegcewcaybksmfjaubbhatrb` (`userId`),
  CONSTRAINT `fk_fvwysosviaalyegcewcaybksmfjaubbhatrb` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bulkopevents`
--

DROP TABLE IF EXISTS `bulkopevents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bulkopevents` (
  `key` char(10) NOT NULL,
  `senderClass` varchar(255) NOT NULL,
  `eventName` varchar(255) NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`key`,`senderClass`,`eventName`),
  KEY `idx_fdkitpyfjplavosititqozlgmddavyfncrax` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `parentId` int DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_vdpuxyfmqmfvkalihmckdceodzhkjqhqfnyl` (`groupId`),
  KEY `fk_suwcczdhvplcjxdeyqlbgpxtbfzlocnhlhzn` (`parentId`),
  CONSTRAINT `fk_pqycztecesuzlceoburqwcemjbdgoqeeuins` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pzdiuwihkithaoywkwdbhgcosiqwzwximauj` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_suwcczdhvplcjxdeyqlbgpxtbfzlocnhlhzn` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups`
--

DROP TABLE IF EXISTS `categorygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorygroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ltzxzcqakrrretzwlrjotzjuhrrgogxerdgk` (`name`),
  KEY `idx_rdftxjpyfllfshdnbicsfpschjspfuqrjxzs` (`handle`),
  KEY `idx_adlvxzxiotsadpuiaojuoeoyeoimwnoiemid` (`structureId`),
  KEY `idx_acbdvmrnohmltzxxasyhtjjmblswnbhjaugu` (`fieldLayoutId`),
  KEY `idx_szgzydvpdltbhwpdibrsbpyvmnojaubqqkbp` (`dateDeleted`),
  CONSTRAINT `fk_ibxpylsoeozqawspdahznkidrnkpjxkpiaqe` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_wvlvkkjvmhbdhusdwnhxnkwajehtqvvzpons` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups_sites`
--

DROP TABLE IF EXISTS `categorygroups_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorygroups_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `siteId` int NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_islvkodyvgskedpnduaunaetsvkrsywmzdzu` (`groupId`,`siteId`),
  KEY `idx_nfqduholtxjotvcyysurxfbkzjxnikrpqols` (`siteId`),
  CONSTRAINT `fk_bxkxzclvlqrlovmlnuehgchcxxvewzpopwzb` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_sihutsthdosvavfziveubvicuzqwbxdummua` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changedattributes`
--

DROP TABLE IF EXISTS `changedattributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `changedattributes` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `attribute` varchar(255) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `idx_bzrpvqjnsammukkyfyihjoikyxuvwasfhajb` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_desutjpqcaekfkcxowezvkmzdrzdpnfbbnkw` (`siteId`),
  KEY `fk_yudxpdohpadgwemwiuyxqfuzejzqcuscjvha` (`userId`),
  CONSTRAINT `fk_desutjpqcaekfkcxowezvkmzdrzdpnfbbnkw` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_qxfxhvjjloifayhzqicnrfguujmwcujjtfqk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_yudxpdohpadgwemwiuyxqfuzejzqcuscjvha` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changedfields`
--

DROP TABLE IF EXISTS `changedfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `changedfields` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `fieldId` int NOT NULL,
  `layoutElementUid` char(36) NOT NULL DEFAULT '0',
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`,`layoutElementUid`),
  KEY `idx_bhezabuauzydwezuznogmgssnihnnacfwbty` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_qmsufcpougxuzykazhalzyyndxldrchheuoy` (`siteId`),
  KEY `fk_rbsyuaphwfoypiavgdufqeapckhifykcexyw` (`fieldId`),
  KEY `fk_eapnwjowtnwmncldazehvwlgehhsjykpmkoh` (`userId`),
  CONSTRAINT `fk_eapnwjowtnwmncldazehvwlgehhsjykpmkoh` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_ijovjzsmfnvisimlqjgcqfeumhcgguegbgfe` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_qmsufcpougxuzykazhalzyyndxldrchheuoy` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_rbsyuaphwfoypiavgdufqeapckhifykcexyw` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `craftidtokens`
--

DROP TABLE IF EXISTS `craftidtokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `craftidtokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `accessToken` text NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_bogcvafoqtkyexxkzqaebznibdhdtxbthvqx` (`userId`),
  CONSTRAINT `fk_bogcvafoqtkyexxkzqaebznibdhdtxbthvqx` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deprecationerrors`
--

DROP TABLE IF EXISTS `deprecationerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deprecationerrors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint unsigned DEFAULT NULL,
  `message` text,
  `traces` json DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_dpwjnisfgycnsxmborfkypqvmbnuludruwaw` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `drafts`
--

DROP TABLE IF EXISTS `drafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drafts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int DEFAULT NULL,
  `creatorId` int DEFAULT NULL,
  `provisional` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `notes` text,
  `trackChanges` tinyint(1) NOT NULL DEFAULT '0',
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_srcorvdbwhncthxepnpclkbukowxzjgxezcu` (`creatorId`,`provisional`),
  KEY `idx_qggnzcdprvgtzfvsojvzfrfougdngacnmajf` (`saved`),
  KEY `fk_behorjvjrwjvblnyacfewinzcvkkhfonixhr` (`canonicalId`),
  CONSTRAINT `fk_behorjvjrwjvblnyacfewinzcvkkhfonixhr` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xrihmqwwqghtripnzsmjubbirzdcbucskaye` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elementactivity`
--

DROP TABLE IF EXISTS `elementactivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elementactivity` (
  `elementId` int NOT NULL,
  `userId` int NOT NULL,
  `siteId` int NOT NULL,
  `draftId` int DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`elementId`,`userId`,`type`),
  KEY `idx_gvtocmymwdzjjgwnduqmlniocaerbaafccbc` (`elementId`,`timestamp`,`userId`),
  KEY `fk_ruzbbqszotfwqqckkoonfvwntfdppdmvbasg` (`userId`),
  KEY `fk_riuewljnlwhdhtndtvkrjeqvjcektcnglikp` (`siteId`),
  KEY `fk_ybcbfrdodwfnvocvinaiwpzmbhewvxuajzcj` (`draftId`),
  CONSTRAINT `fk_gjgxkumwikwqtunzgmscrmliwqoqettmnsro` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_riuewljnlwhdhtndtvkrjeqvjcektcnglikp` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ruzbbqszotfwqqckkoonfvwntfdppdmvbasg` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ybcbfrdodwfnvocvinaiwpzmbhewvxuajzcj` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements`
--

DROP TABLE IF EXISTS `elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int DEFAULT NULL,
  `draftId` int DEFAULT NULL,
  `revisionId` int DEFAULT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateLastMerged` datetime DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_upeinmmshcbthmqrgskirdzjqdvdldzkdlrt` (`dateDeleted`),
  KEY `idx_dllnvkvzxiehgadjyecuszkcaxlovhtbzthj` (`fieldLayoutId`),
  KEY `idx_jsdfffzcmawjqqsftovzcixloshozykatcql` (`type`),
  KEY `idx_sxsowvsavsesjuwcwocrhmpwmozpbsmnrrqk` (`enabled`),
  KEY `idx_ingpqhztjvkbwitzepecipvxhazvbwrupejv` (`canonicalId`),
  KEY `idx_etueravhdepfzpvnwuaobsmrtksvxtalpkfb` (`archived`,`dateCreated`),
  KEY `idx_pakfitavknxoyywkspvxuadoordtehrelelo` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`),
  KEY `idx_ahmwhgguwdpuoknqwtrxzoodcmnvikctykpx` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`,`enabled`),
  KEY `fk_oakwsolvelvcptpfdbfbjclrtmktirqnwkqg` (`draftId`),
  KEY `fk_locqdgllycstqgcrzobniotqjotngomqhawr` (`revisionId`),
  CONSTRAINT `fk_locqdgllycstqgcrzobniotqjotngomqhawr` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_oakwsolvelvcptpfdbfbjclrtmktirqnwkqg` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_puierjhwijevpjwvbuylazxnvuknltixepid` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_slmbythigsrwdjxoffmlptxyopgzwsimxjxg` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements_bulkops`
--

DROP TABLE IF EXISTS `elements_bulkops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elements_bulkops` (
  `elementId` int NOT NULL,
  `key` char(10) NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`elementId`,`key`),
  KEY `idx_bobnsenhaftqpbcpjmxejzrcdkpaiwvtfzzc` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements_owners`
--

DROP TABLE IF EXISTS `elements_owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elements_owners` (
  `elementId` int NOT NULL,
  `ownerId` int NOT NULL,
  `sortOrder` smallint unsigned NOT NULL,
  PRIMARY KEY (`elementId`,`ownerId`),
  KEY `fk_itsqobvnopzrdvkpeimtpthytksfcxonahbp` (`ownerId`),
  CONSTRAINT `fk_itsqobvnopzrdvkpeimtpthytksfcxonahbp` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tfeskinrhzjjpvpoopnrgiqbzxhfztiwuftr` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements_sites`
--

DROP TABLE IF EXISTS `elements_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elements_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `content` json DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_unjurararusccoovbefnfhtrvfmdqfpygdhe` (`elementId`,`siteId`),
  KEY `idx_hshrpbrvnrlsckmkitjbpxjpanytzjyzkubd` (`siteId`),
  KEY `idx_rbojbevqmlruxtvpkvcwgqbexqhxufdmvoyc` (`title`,`siteId`),
  KEY `idx_zlrnvqnueducraoavogrjfraulhtoafmxgkd` (`slug`,`siteId`),
  KEY `idx_rirvvzdejqwsvycxdcqhzodsufqrasyxktep` (`enabled`),
  KEY `idx_qjilxygdqevrjuvmzzztkqqcpuxjdhnqhekg` (`uri`,`siteId`),
  CONSTRAINT `fk_rjwxtwvunymldlgrtliryjfairdlgsclvons` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tmskphxxgfdxvhnsgbydjlzmdzhtrhrglpwe` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entries`
--

DROP TABLE IF EXISTS `entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entries` (
  `id` int NOT NULL,
  `sectionId` int DEFAULT NULL,
  `parentId` int DEFAULT NULL,
  `primaryOwnerId` int DEFAULT NULL,
  `fieldId` int DEFAULT NULL,
  `typeId` int NOT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `status` enum('live','pending','expired') NOT NULL DEFAULT 'live',
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `deletedWithSection` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_czkpagcgndkvxmjulxwndfdpmbcloxkckxag` (`postDate`),
  KEY `idx_kmhjankbyuvsaoqsvnwstcbpabafcyzwcbzz` (`expiryDate`),
  KEY `idx_qxqhlzszwduzusqowwdusqnytnajuroiadfh` (`status`),
  KEY `idx_tkzdtmpfpbnwwgcawhcmizspgfhhzjfhpvos` (`sectionId`),
  KEY `idx_xkujeypkxcuuahgvwalvpwotvwhhgbruydot` (`typeId`),
  KEY `idx_kmliqapykdfxrzojtksvaakuhvppnxslshxi` (`primaryOwnerId`),
  KEY `idx_nibwhwyhwmtuecvdkgbbsevnoiilqpyndpcl` (`fieldId`),
  KEY `fk_smlkqfcqnajwnvywgsdowlwnotcqaxypipkl` (`parentId`),
  CONSTRAINT `fk_ofettjdntafzblutkghfyesvlohpddtxfofo` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qjqvvuebqqcsutkoesnuzevpfllnenjxoqqm` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_smlkqfcqnajwnvywgsdowlwnotcqaxypipkl` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_taokivwkjtxjjbidoewlgmlpylzsmixfsbxx` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ylefaijzgsofoojvybdwmhbvdtfmvjwmfmsz` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yrdeaphbeigjirssllcoepgoahsjinzovuhd` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entries_authors`
--

DROP TABLE IF EXISTS `entries_authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entries_authors` (
  `entryId` int NOT NULL,
  `authorId` int NOT NULL,
  `sortOrder` smallint unsigned NOT NULL,
  PRIMARY KEY (`entryId`,`authorId`),
  KEY `idx_bsbldrsacjmluydoqmpzzxfowrztqscdraou` (`authorId`),
  KEY `idx_dhpcssejssghcqdbpvjawhvwchzklnctttcb` (`entryId`,`sortOrder`),
  CONSTRAINT `fk_edodiympqkukxwjbvddrmbgnuotqszuggbzm` FOREIGN KEY (`entryId`) REFERENCES `entries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qkzdfyjlqbmmtcwsiviuiafprnnvladswgcz` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entrytypes`
--

DROP TABLE IF EXISTS `entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrytypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text,
  `titleFormat` varchar(255) DEFAULT NULL,
  `showSlugField` tinyint(1) DEFAULT '1',
  `slugTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `slugTranslationKeyFormat` text,
  `showStatusField` tinyint(1) DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_pbrknjmjxzidplpzxvrpgdslmxtnscuvlagf` (`fieldLayoutId`),
  KEY `idx_eodgwzepxskgaqbekptnnudogmcgldoflgoe` (`dateDeleted`),
  CONSTRAINT `fk_mftkahkjivrvrpivlydzijbqzlbsutnmkltb` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayouts`
--

DROP TABLE IF EXISTS `fieldlayouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fieldlayouts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `config` json DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ztxaikbpabjbbdhwxdfhbbeqohmivgcbkfhf` (`dateDeleted`),
  KEY `idx_ilhrxdkpfnmmfmtravyeuidcuyddsgelddpb` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `handle` varchar(64) NOT NULL,
  `context` varchar(255) NOT NULL DEFAULT 'global',
  `columnSuffix` char(8) DEFAULT NULL,
  `instructions` text,
  `searchable` tinyint(1) NOT NULL DEFAULT '1',
  `translationMethod` varchar(255) NOT NULL DEFAULT 'none',
  `translationKeyFormat` text,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_aortwcarvusemzsnvnvmrlpztrstxcgmsjyy` (`handle`,`context`),
  KEY `idx_dnnielcvzrbtppiwterjvynaupdzdenknoun` (`context`),
  KEY `idx_fshhjvjonwqxhymikgfpynyqosugcwuxnaqb` (`dateDeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `globalsets`
--

DROP TABLE IF EXISTS `globalsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `globalsets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_tjtyztdgmalpdufaplcifssduviwiicqtteo` (`name`),
  KEY `idx_wptpzfkneidsrqrsggarjhrvlafvzzungbjq` (`handle`),
  KEY `idx_ghuqvkrwkgqcetiekkydhprrspwfrimhfacu` (`fieldLayoutId`),
  KEY `idx_dolfywrqhhzwvifrkixulwuegorkvuqjuitm` (`sortOrder`),
  CONSTRAINT `fk_svkvvxooyuogykhbfzgixdrdhmglqkliyoes` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_ylmsaifgdnzdfjqoxmfkxrmyuprpngbltttf` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqlschemas`
--

DROP TABLE IF EXISTS `gqlschemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gqlschemas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `scope` json DEFAULT NULL,
  `isPublic` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqltokens`
--

DROP TABLE IF EXISTS `gqltokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gqltokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `accessToken` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_jzggidnzocemuscvwalqnkxwdhqgwvvflwle` (`accessToken`),
  UNIQUE KEY `idx_cecdwjmlhqyawmexdxtfqzicvlhqlcpfrjwr` (`name`),
  KEY `fk_hwxiuvjxfaivlrkmyaibmcqzoywwwrunexgx` (`schemaId`),
  CONSTRAINT `fk_hwxiuvjxfaivlrkmyaibmcqzoywwwrunexgx` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imagetransformindex`
--

DROP TABLE IF EXISTS `imagetransformindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagetransformindex` (
  `id` int NOT NULL AUTO_INCREMENT,
  `assetId` int NOT NULL,
  `transformer` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `transformString` varchar(255) NOT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `error` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_eulujbseopbxojhtkwghmexmcyuqxtvpixdm` (`assetId`,`transformString`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imagetransforms`
--

DROP TABLE IF EXISTS `imagetransforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagetransforms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `mode` enum('stretch','fit','crop','letterbox') NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') NOT NULL DEFAULT 'center-center',
  `width` int unsigned DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `quality` int DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') NOT NULL DEFAULT 'none',
  `fill` varchar(11) DEFAULT NULL,
  `upscale` tinyint(1) NOT NULL DEFAULT '1',
  `parameterChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ypkccelnyrhlvibsguxjbxkxjypxrwkxoszt` (`name`),
  KEY `idx_zhbglqksdfvfiwnbtatpknbpibmiglshaswx` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `configVersion` char(12) NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `track` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_flllgybfzoildrhvtpehwnokwahfqzwopjqx` (`track`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plugins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_auntucpmbvymtlruvamzkzajevecokptjskm` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `projectconfig`
--

DROP TABLE IF EXISTS `projectconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projectconfig` (
  `path` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `queue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text,
  `timePushed` int NOT NULL,
  `ttr` int NOT NULL,
  `delay` int NOT NULL DEFAULT '0',
  `priority` int unsigned NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int DEFAULT NULL,
  `progress` smallint NOT NULL DEFAULT '0',
  `progressLabel` varchar(255) DEFAULT NULL,
  `attempt` int DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text,
  PRIMARY KEY (`id`),
  KEY `idx_pyodqidqtijqwucxtoqkhhylakphlyeqhrce` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `idx_yrsmbblqmpbybcoumgrxjpeqsnilfqfkknhw` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recoverycodes`
--

DROP TABLE IF EXISTS `recoverycodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recoverycodes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `recoveryCodes` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relations`
--

DROP TABLE IF EXISTS `relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `relations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldId` int NOT NULL,
  `sourceId` int NOT NULL,
  `sourceSiteId` int DEFAULT NULL,
  `targetId` int NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_wdsotnzvghdinllzwcwxolxzrndcawehigaz` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `idx_lvibpmntpnpikyoqcaapnkzwuodwpykfphjv` (`sourceId`),
  KEY `idx_liiamrhilidzxobwtgojjjdcizefswmckmni` (`targetId`),
  KEY `idx_skfxchvyfgatkgitvrjdqsacyirxrfjlljog` (`sourceSiteId`),
  CONSTRAINT `fk_dpheyzvezlrkommicjwxhzkupubixbyeayzn` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_kbaaoaqlgehnfnuckamlktnzjzfoulnceedw` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wnnwdpeevskdzumkmvpujxdegqpnxrshphjz` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `resourcepaths`
--

DROP TABLE IF EXISTS `resourcepaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `revisions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int NOT NULL,
  `creatorId` int DEFAULT NULL,
  `num` int NOT NULL,
  `notes` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_hjpgigkknysmpwaymmkqjbwjbhpmroaxadjd` (`canonicalId`,`num`),
  KEY `fk_cxtypucxxuuvfeqbttvdhtddqkbrtwwzzhwn` (`creatorId`),
  CONSTRAINT `fk_cxtypucxxuuvfeqbttvdhtddqkbrtwwzzhwn` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_ntilpyzlcgolmjatvoidohjjupoxjuztthxu` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `searchindex`
--

DROP TABLE IF EXISTS `searchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `searchindex` (
  `elementId` int NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int NOT NULL,
  `siteId` int NOT NULL,
  `keywords` text NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `idx_dsmiqmpawxvbpfhcfftnnmxjglmtwqumdyro` (`keywords`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `searchindexqueue`
--

DROP TABLE IF EXISTS `searchindexqueue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `searchindexqueue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `reserved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ouoelsqjhncbaeqdbakisiisneocbxvefbwp` (`elementId`,`siteId`,`reserved`),
  CONSTRAINT `fk_aoymkukfwtrlhmpjkhdyxlzvddcufwdoglww` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `searchindexqueue_fields`
--

DROP TABLE IF EXISTS `searchindexqueue_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `searchindexqueue_fields` (
  `jobId` int NOT NULL,
  `fieldHandle` varchar(255) NOT NULL,
  PRIMARY KEY (`jobId`,`fieldHandle`),
  UNIQUE KEY `idx_lstyesnsjgrmbwvmnbwjtrynoquavxnzypkh` (`jobId`,`fieldHandle`),
  CONSTRAINT `fk_nwfzrdqpdcdvovyozodoccnxuhefqtlssuee` FOREIGN KEY (`jobId`) REFERENCES `searchindexqueue` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` enum('single','channel','structure') NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `maxAuthors` smallint unsigned DEFAULT NULL,
  `propagationMethod` varchar(255) NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `previewTargets` json DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_marsgqrejdlqurbzypelirnforgedpkkpoat` (`handle`),
  KEY `idx_qpurhmxddcpwgouwxynhsfbprdccyvqfscoc` (`name`),
  KEY `idx_sqxpysqkbfogufrzvbomiqldoznrszllftqr` (`structureId`),
  KEY `idx_lkqkbenmqwipwyegsacvzczvpodjtpiioqcu` (`dateDeleted`),
  CONSTRAINT `fk_ghzjhavfktzmhwqwyrarncodkbxemtwtbwad` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections_entrytypes`
--

DROP TABLE IF EXISTS `sections_entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections_entrytypes` (
  `sectionId` int NOT NULL,
  `typeId` int NOT NULL,
  `sortOrder` smallint unsigned NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `handle` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sectionId`,`typeId`),
  KEY `fk_zqqrogjuwkggshoyekbqbpoacpbpmcflucld` (`typeId`),
  CONSTRAINT `fk_rgmnwxiwaloyycnzshakypxmnzjrognrztwz` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zqqrogjuwkggshoyekbqbpoacpbpmcflucld` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections_sites`
--

DROP TABLE IF EXISTS `sections_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sectionId` int NOT NULL,
  `siteId` int NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_pszfgitmdydawdedrcqhmzpasidqpvrfbmyk` (`sectionId`,`siteId`),
  KEY `idx_iaxebdoxdoyokxnakjplkyqyxzixkuuotzdz` (`siteId`),
  CONSTRAINT `fk_nxralvxhrkvscrphzaczfunhcxuffpnspupf` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tpfydayzathzoqiduogrmxulkecaxhxgnfds` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sequences`
--

DROP TABLE IF EXISTS `sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sequences` (
  `name` varchar(255) NOT NULL,
  `next` int unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `token` char(100) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_xqhtwwcxhfyvsokfvxyqgreyzpgbbrcgfzka` (`uid`),
  KEY `idx_marxqddplicyyotzebzhqhqovqmgnoemgpww` (`token`),
  KEY `idx_popvujrinfgvoibvrpakfapydlrxwxjxilzd` (`dateUpdated`),
  KEY `idx_djprgxpgwaurqrkakfzcexslfqgeywinbcom` (`userId`),
  CONSTRAINT `fk_fxzhkfjlblcvbgzvnpozkkeenfvhwzaatgom` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shunnedmessages`
--

DROP TABLE IF EXISTS `shunnedmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shunnedmessages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `message` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_icmyhfuymzdjxxagoicjkuayjmmlbsfitvbh` (`userId`,`message`),
  CONSTRAINT `fk_xdbldaswfjwahemcgughbshlhriokxojfgrj` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sitegroups`
--

DROP TABLE IF EXISTS `sitegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sitegroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_frlknfidggiewqgkbfukugquzfpgvcudczgp` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` varchar(255) NOT NULL DEFAULT 'true',
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `language` varchar(255) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_fljoxqhjdbbgvvrilfuinbxcapjxzolunlvp` (`dateDeleted`),
  KEY `idx_xjzfexatjhgopykozozstvmbjlxeiabzemag` (`handle`),
  KEY `idx_vfkaqyjzmnyyqzclsgakusayffsftfvklbin` (`sortOrder`),
  KEY `fk_htwqyowsyotjxjifgqtojhbuajqsmcdsjkgl` (`groupId`),
  CONSTRAINT `fk_htwqyowsyotjxjifgqtojhbuajqsmcdsjkgl` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sso_identities`
--

DROP TABLE IF EXISTS `sso_identities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sso_identities` (
  `provider` varchar(255) NOT NULL,
  `identityId` varchar(255) NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`provider`,`identityId`,`userId`),
  KEY `fk_pjiqvwnchbivglspairuwtcxldbraouzkies` (`userId`),
  CONSTRAINT `fk_pjiqvwnchbivglspairuwtcxldbraouzkies` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structureelements`
--

DROP TABLE IF EXISTS `structureelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `structureelements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int NOT NULL,
  `elementId` int DEFAULT NULL,
  `root` int unsigned DEFAULT NULL,
  `lft` int unsigned NOT NULL,
  `rgt` int unsigned NOT NULL,
  `level` smallint unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_rbgilqjiramnojhfhhcbmqclcwwilfrgbnsx` (`structureId`,`elementId`),
  KEY `idx_iuyaugurmvynuaghfqewwojrktfyjkmdaxzk` (`root`),
  KEY `idx_ftxkvyqdniagbuxrculrclvvxpixfaqdevuy` (`lft`),
  KEY `idx_xigbqvvimziwemezyjuqzpvioqlfgkzwdyzo` (`rgt`),
  KEY `idx_apmjckuiqdwhhrfxaqvcytkrouknljncqcof` (`level`),
  KEY `idx_gdpfakfudoxonpcmvkunllxoqvjpcqdhlanp` (`elementId`),
  CONSTRAINT `fk_xxuemtrensmnljyhwwchcxuqyycuutcoqsyl` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structures`
--

DROP TABLE IF EXISTS `structures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `structures` (
  `id` int NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_jrceebxioupvjjcxebbewgyaxdqepziotdiu` (`dateDeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `systemmessages`
--

DROP TABLE IF EXISTS `systemmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `systemmessages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_jgsxkxlybevtfwfvjwhpjwuxovktrhsfixts` (`key`,`language`),
  KEY `idx_jqdfebejuiiccvkhzadlqfowitlwamysyqxx` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taggroups`
--

DROP TABLE IF EXISTS `taggroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taggroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_vuntwgpexmivsroyszyaqpcvqmfgelkeznbi` (`name`),
  KEY `idx_btrxpqwvbbuhzfrdvkfruzqfedbnuoweflmi` (`handle`),
  KEY `idx_pbklntfdljqnosshpdhagfmeoejtvdfgxvxk` (`dateDeleted`),
  KEY `fk_llhmyktjubpoyejutlvnflehgrypmpaxgafx` (`fieldLayoutId`),
  CONSTRAINT `fk_llhmyktjubpoyejutlvnflehgrypmpaxgafx` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_xwzrqpuxasvegbxiiedpklkjlcyjtklnzeve` (`groupId`),
  CONSTRAINT `fk_aphprkjsdwjocetaubszmosqjhnjsuudevwc` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_uugwlxfgbixzydmlbxfzozggfizimkczznlo` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` char(32) NOT NULL,
  `route` text,
  `usageLimit` tinyint unsigned DEFAULT NULL,
  `usageCount` tinyint unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_iorsfdivkuehtkcrwxhwbdrvvckybmnpfswk` (`token`),
  KEY `idx_gawdddnjffzvxgtafxpegyvnfrcddkqeoppk` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups`
--

DROP TABLE IF EXISTS `usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usergroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `description` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_zjzwjqesjfldwszzoksuvjdojxfewfklfimm` (`handle`),
  KEY `idx_ssxogetqkeethudmzthxmxcvgjbtahtzajdl` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups_users`
--

DROP TABLE IF EXISTS `usergroups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usergroups_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_zgpolqivlamvrmgyocthposwkptbohfwgubn` (`groupId`,`userId`),
  KEY `idx_ayetybhdlfuvfxvmwcfxsnbgdhlewycyfxoi` (`userId`),
  CONSTRAINT `fk_imxpejfrskuryqisatyucevhbnskqxoclbnn` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_unqcxhnkhqxdvkrrcnclmdkxeqwodowawigx` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions`
--

DROP TABLE IF EXISTS `userpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpermissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_lozgonjppoeajlsbspabtwllemqvnwxhwgoq` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_usergroups`
--

DROP TABLE IF EXISTS `userpermissions_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpermissions_usergroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permissionId` int NOT NULL,
  `groupId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ivjpgsrqdbifmzustqltbixkxgiszazhqoxl` (`permissionId`,`groupId`),
  KEY `idx_imurremrpggqobmvzjazkbbnyhvgdncpiqxw` (`groupId`),
  CONSTRAINT `fk_deafwemcvblxdaihvkispemiaocosjpbfyhv` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yzsaulxhricvomwqeupxknmnkrsddooxymdu` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_users`
--

DROP TABLE IF EXISTS `userpermissions_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpermissions_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permissionId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_jdzqgxeibxgtmbancvnzujkzkibpcwltihoj` (`permissionId`,`userId`),
  KEY `idx_upzepxidlgyqgdnuxtgznoedauptsgyrjcii` (`userId`),
  CONSTRAINT `fk_ukrtmfxwefxjyrjvoojtwkhliivuveoqmoho` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ytwjoqwlqornnvhflopovwxztdegcwjhpqhg` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpreferences`
--

DROP TABLE IF EXISTS `userpreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpreferences` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `preferences` json DEFAULT NULL,
  PRIMARY KEY (`userId`),
  CONSTRAINT `fk_jwbifupkujlrfdbavfnllvjqyfxaxresmunx` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL,
  `photoId` int DEFAULT NULL,
  `affiliatedSiteId` int DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `username` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_rpegwnnbzxcehrmlubdrdzbfcsthrxptzvyl` (`active`),
  KEY `idx_gifnhotwbrdrsvevaxnbcpzrtscsnvzchlsb` (`locked`),
  KEY `idx_jorowkaxiipkxheflrksbloorzfbnplaqbct` (`pending`),
  KEY `idx_utghkkokfhlxiemepibqjchxnfwqfvpgwqsi` (`suspended`),
  KEY `idx_brajwxthptylrfkxnlrrmwmymlfhimlcmqvc` (`verificationCode`),
  KEY `idx_fwebenddtsbubbysuvyqrbgpgeqczqdldbxq` (`email`),
  KEY `idx_vtwzxpbjrccbinlmuaqehjdvjxcpuhnozrfe` (`username`),
  KEY `fk_ntstkntyouaevzqorcihstuhxvkaiuztykag` (`photoId`),
  KEY `fk_hdrjwazbuovpjmeuysmeqiugjulhpjxpdooj` (`affiliatedSiteId`),
  CONSTRAINT `fk_hdrjwazbuovpjmeuysmeqiugjulhpjxpdooj` FOREIGN KEY (`affiliatedSiteId`) REFERENCES `sites` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_llrkoyrecmmflhlioeticguucngjrkqbcjvr` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ntstkntyouaevzqorcihstuhxvkaiuztykag` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumefolders`
--

DROP TABLE IF EXISTS `volumefolders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `volumefolders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parentId` int DEFAULT NULL,
  `volumeId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_haednzjosticgxxdonhhcwsykjthpmrneiqe` (`name`,`parentId`,`volumeId`),
  KEY `idx_vgypyzqdxbqewxkujildlfyoedhjbkeslovh` (`parentId`),
  KEY `idx_tgmviughwvtgzbuewzoztgdkyjhgfhvnydzy` (`volumeId`),
  CONSTRAINT `fk_ntvzpxuoypejvqzjqqxzvuenlgshtiaiwoke` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vawzicxpusbifhlfqxbzdjxipqhzaulxefrr` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumes`
--

DROP TABLE IF EXISTS `volumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `volumes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fs` varchar(255) NOT NULL,
  `subpath` varchar(255) DEFAULT NULL,
  `transformFs` varchar(255) DEFAULT NULL,
  `transformSubpath` varchar(255) DEFAULT NULL,
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text,
  `altTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `altTranslationKeyFormat` text,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_mfkdpqniywtadqnahxsjfpkmnaomkuvkymul` (`name`),
  KEY `idx_vsbmdcbzrxeuowakphwlwzzlfungttkglzfb` (`handle`),
  KEY `idx_lmejuevugwwirbyhsbmcwezdjsixxgfxdelq` (`fieldLayoutId`),
  KEY `idx_ohjclxymtfcuibvvizmilyguqhsgljcqhtze` (`dateDeleted`),
  CONSTRAINT `fk_elurbrdvzjrwkckdnsihbrfszoockjhloryd` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `webauthn`
--

DROP TABLE IF EXISTS `webauthn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `webauthn` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `credentialId` varchar(255) DEFAULT NULL,
  `credential` text,
  `credentialName` varchar(255) DEFAULT NULL,
  `dateLastUsed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_gmpskflqryehghyqrvnjfqqjxnmvntfutjmr` (`userId`),
  CONSTRAINT `fk_gmpskflqryehghyqrvnjfqqjxnmvntfutjmr` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `widgets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `colspan` tinyint DEFAULT NULL,
  `settings` json DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_fzfaaftdqgdfattctyezritfdndnwpqdfhun` (`userId`),
  CONSTRAINT `fk_ilmebixqtduioebaoywnqtbxwdypttdzptay` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-03 13:37:06
-- MySQL dump 10.13  Distrib 8.0.40, for Linux (x86_64)
--
-- Host: db    Database: db
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assetindexingsessions`
--

LOCK TABLES `assetindexingsessions` WRITE;
/*!40000 ALTER TABLE `assetindexingsessions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `assetindexingsessions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assets_sites`
--

LOCK TABLES `assets_sites` WRITE;
/*!40000 ALTER TABLE `assets_sites` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `assets_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `authenticator`
--

LOCK TABLES `authenticator` WRITE;
/*!40000 ALTER TABLE `authenticator` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `authenticator` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `bulkopevents`
--

LOCK TABLES `bulkopevents` WRITE;
/*!40000 ALTER TABLE `bulkopevents` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `bulkopevents` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups`
--

LOCK TABLES `categorygroups` WRITE;
/*!40000 ALTER TABLE `categorygroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categorygroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups_sites`
--

LOCK TABLES `categorygroups_sites` WRITE;
/*!40000 ALTER TABLE `categorygroups_sites` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categorygroups_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedattributes`
--

LOCK TABLES `changedattributes` WRITE;
/*!40000 ALTER TABLE `changedattributes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `changedattributes` VALUES (4,1,'slug','2025-05-03 12:19:42',0,1);
/*!40000 ALTER TABLE `changedattributes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedfields`
--

LOCK TABLES `changedfields` WRITE;
/*!40000 ALTER TABLE `changedfields` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `changedfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `craftidtokens`
--

LOCK TABLES `craftidtokens` WRITE;
/*!40000 ALTER TABLE `craftidtokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `craftidtokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `deprecationerrors`
--

LOCK TABLES `deprecationerrors` WRITE;
/*!40000 ALTER TABLE `deprecationerrors` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `deprecationerrors` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `drafts`
--

LOCK TABLES `drafts` WRITE;
/*!40000 ALTER TABLE `drafts` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `drafts` VALUES (1,NULL,1,0,'First draft',NULL,0,NULL,0),(2,NULL,1,0,'First draft',NULL,0,NULL,0);
/*!40000 ALTER TABLE `drafts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elementactivity`
--

LOCK TABLES `elementactivity` WRITE;
/*!40000 ALTER TABLE `elementactivity` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elementactivity` VALUES (4,1,1,NULL,'edit','2025-05-03 12:19:39'),(4,1,1,NULL,'save','2025-05-03 12:19:42');
/*!40000 ALTER TABLE `elementactivity` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements` VALUES (1,NULL,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2025-05-03 11:51:41','2025-05-03 11:51:41',NULL,NULL,NULL,'9d4c15fe-4385-4d92-9aac-2e1bf90ba79e'),(2,NULL,1,NULL,3,'craft\\elements\\Entry',1,0,'2025-05-03 12:06:43','2025-05-03 12:06:43',NULL,NULL,NULL,'c9b73470-01e7-48cf-9af5-eb95d219793c'),(3,NULL,2,NULL,3,'craft\\elements\\Entry',1,0,'2025-05-03 12:07:02','2025-05-03 12:07:02',NULL,NULL,NULL,'6f5ddcc5-d100-4e7b-8844-d3196ec11868'),(4,NULL,NULL,NULL,3,'craft\\elements\\Entry',1,0,'2025-05-03 12:17:57','2025-05-03 12:19:42',NULL,NULL,NULL,'315f59bd-e0e2-48ac-8f10-556355974cf6'),(5,4,NULL,1,3,'craft\\elements\\Entry',1,0,'2025-05-03 12:17:57','2025-05-03 12:17:57',NULL,NULL,NULL,'049a0202-091e-4b8e-bbfc-8e3caaddab3c'),(6,4,NULL,2,3,'craft\\elements\\Entry',1,0,'2025-05-03 12:19:02','2025-05-03 12:19:02',NULL,NULL,NULL,'dc4732ef-a43b-4677-bf62-235805ba9aad'),(8,4,NULL,3,3,'craft\\elements\\Entry',1,0,'2025-05-03 12:19:42','2025-05-03 12:19:42',NULL,NULL,NULL,'285301aa-20ac-4994-84c0-5799d25d707d'),(9,NULL,NULL,NULL,4,'craft\\elements\\Entry',1,0,'2025-05-03 12:29:52','2025-05-03 12:29:52',NULL,NULL,NULL,'90ce8160-cd64-42cf-9088-7ea8558da040'),(10,9,NULL,4,4,'craft\\elements\\Entry',1,0,'2025-05-03 12:29:52','2025-05-03 12:29:52',NULL,NULL,NULL,'79c1e2ea-0627-4573-8cdd-9407a13bfa55');
/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements_bulkops`
--

LOCK TABLES `elements_bulkops` WRITE;
/*!40000 ALTER TABLE `elements_bulkops` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `elements_bulkops` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements_owners`
--

LOCK TABLES `elements_owners` WRITE;
/*!40000 ALTER TABLE `elements_owners` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `elements_owners` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements_sites`
--

LOCK TABLES `elements_sites` WRITE;
/*!40000 ALTER TABLE `elements_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements_sites` VALUES (1,1,1,NULL,NULL,NULL,NULL,1,'2025-05-03 11:51:41','2025-05-03 11:51:41','ab79b39b-c691-4635-a0b4-6046b5ea1a3f'),(2,2,1,NULL,'__temp_pxzlpjnabjikamnwjejvvobpzwmiroonccre','porters/__temp_pxzlpjnabjikamnwjejvvobpzwmiroonccre',NULL,1,'2025-05-03 12:06:43','2025-05-03 12:06:43','54231bbd-c134-480b-9ed3-368f6173464d'),(3,3,1,NULL,'__temp_quwbzqbmymkojerbyjcikwtnqmbjiadkenac','porters/__temp_quwbzqbmymkojerbyjcikwtnqmbjiadkenac',NULL,1,'2025-05-03 12:07:02','2025-05-03 12:07:02','361a6a49-5785-4185-bf67-6a9754a9858b'),(4,4,1,'Porter','porter','porters/porter','{\"009018f1-2b1f-4378-b2a7-c2fbd98e5d5b\": \"One\"}',1,'2025-05-03 12:17:57','2025-05-03 12:18:09','cd850935-95c4-4562-b721-e0dd5f52425b'),(5,5,1,'Porter','porter','porters/porter','{\"009018f1-2b1f-4378-b2a7-c2fbd98e5d5b\": \"One\"}',1,'2025-05-03 12:17:57','2025-05-03 12:17:57','7b0dcdb1-169a-4566-87ff-8cf18526493d'),(6,6,1,'Porter','porter','porters/porter','{\"009018f1-2b1f-4378-b2a7-c2fbd98e5d5b\": \"One\"}',1,'2025-05-03 12:19:02','2025-05-03 12:19:02','bdee4810-af83-4be4-bed5-d2fedce4cfdc'),(8,8,1,'Porter','porter','porters/porter','{\"009018f1-2b1f-4378-b2a7-c2fbd98e5d5b\": \"One\"}',1,'2025-05-03 12:19:42','2025-05-03 12:19:42','f16206bc-50ca-414b-bb40-805b5a931d82'),(9,9,1,'Martin','martin','supervisors/martin','{\"ed5a6c88-1539-4eb5-852a-ea9a60a0a994\": \"Smith\"}',1,'2025-05-03 12:29:52','2025-05-03 12:29:52','cdba97f3-f58f-40fb-ac60-3be768e5ef19'),(10,10,1,'Martin','martin','supervisors/martin','{\"ed5a6c88-1539-4eb5-852a-ea9a60a0a994\": \"Smith\"}',1,'2025-05-03 12:29:52','2025-05-03 12:29:52','0fbca100-e61d-4916-a0f4-8a9c19aa3698');
/*!40000 ALTER TABLE `elements_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entries`
--

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entries` VALUES (2,3,NULL,NULL,NULL,3,'2025-05-03 12:06:43',NULL,'live',NULL,NULL,'2025-05-03 12:06:43','2025-05-03 12:06:43'),(3,3,NULL,NULL,NULL,3,'2025-05-03 12:07:02',NULL,'live',NULL,NULL,'2025-05-03 12:07:02','2025-05-03 12:07:02'),(4,3,NULL,NULL,NULL,3,'2025-05-03 12:17:00',NULL,'live',NULL,NULL,'2025-05-03 12:17:57','2025-05-03 12:17:57'),(5,3,NULL,NULL,NULL,3,'2025-05-03 12:17:00',NULL,'live',NULL,NULL,'2025-05-03 12:17:57','2025-05-03 12:17:57'),(6,3,NULL,NULL,NULL,3,'2025-05-03 12:17:00',NULL,'live',NULL,NULL,'2025-05-03 12:19:02','2025-05-03 12:19:02'),(8,3,NULL,NULL,NULL,3,'2025-05-03 12:17:00',NULL,'live',NULL,NULL,'2025-05-03 12:19:42','2025-05-03 12:19:42'),(9,4,NULL,NULL,NULL,4,'2025-05-03 12:29:00',NULL,'live',NULL,NULL,'2025-05-03 12:29:52','2025-05-03 12:29:52'),(10,4,NULL,NULL,NULL,4,'2025-05-03 12:29:00',NULL,'live',NULL,NULL,'2025-05-03 12:29:52','2025-05-03 12:29:52');
/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entries_authors`
--

LOCK TABLES `entries_authors` WRITE;
/*!40000 ALTER TABLE `entries_authors` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entries_authors` VALUES (2,1,1),(3,1,1),(4,1,1),(5,1,1),(6,1,1),(8,1,1),(9,1,1),(10,1,1);
/*!40000 ALTER TABLE `entries_authors` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entrytypes`
--

LOCK TABLES `entrytypes` WRITE;
/*!40000 ALTER TABLE `entrytypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entrytypes` VALUES (1,1,'Ent Buildings','entBuildings','building',NULL,1,'site',NULL,NULL,1,'site',NULL,1,'2025-05-03 11:56:16','2025-05-03 11:56:16',NULL,'a6ca13d7-bc6b-4c17-a310-b0fcaa34804d'),(2,2,'Ent Departments','entDepartments','phone-office',NULL,1,'site',NULL,NULL,1,'site',NULL,1,'2025-05-03 11:57:21','2025-05-03 11:57:21',NULL,'f5051ed3-2649-4f41-a303-9d3b06368f94'),(3,3,'Ent Porters','entPorters','person-walking-luggage',NULL,1,'site',NULL,'{fd_surname}',1,'site',NULL,1,'2025-05-03 11:59:15','2025-05-03 12:19:31',NULL,'fe915955-f57d-4ec4-bf9c-92c417a8e11d'),(4,4,'Ent Supervisors','entSupervisors','clipboard',NULL,1,'site',NULL,NULL,1,'site',NULL,1,'2025-05-03 12:21:38','2025-05-03 12:21:38',NULL,'0ddc1c53-595b-487f-8473-eece2e4861de');
/*!40000 ALTER TABLE `entrytypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayouts`
--

LOCK TABLES `fieldlayouts` WRITE;
/*!40000 ALTER TABLE `fieldlayouts` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayouts` VALUES (1,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"764fa209-1710-4061-adde-b5507d3af420\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"c69ae4d9-9663-40c1-ab14-bf600cda66c3\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": true, \"dateAdded\": \"2025-05-03T11:54:36+00:00\", \"inputType\": null, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": []}','2025-05-03 11:56:16','2025-05-03 11:56:16',NULL,'c1805f47-7d20-47d4-8ae0-99427a38111c'),(2,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"168c59fd-e818-45ec-811d-7d74774c9138\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"b4dd7357-e4b5-4c5f-bc44-a3942381aaed\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": true, \"dateAdded\": \"2025-05-03T11:55:35+00:00\", \"inputType\": null, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": []}','2025-05-03 11:57:21','2025-05-03 11:57:21',NULL,'0a3f4f6b-8ae9-41ea-b7d2-162fd7c07921'),(3,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"04bae4b1-aa27-456a-9da1-61199702ed14\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"0d77459c-6b5e-4021-827e-d60317e8df21\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": \"First Name\", \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": false, \"dateAdded\": \"2025-05-03T11:57:22+00:00\", \"inputType\": null, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"009018f1-2b1f-4378-b2a7-c2fbd98e5d5b\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Surname\", \"width\": 100, \"handle\": \"fd_surname\", \"warning\": null, \"fieldUid\": \"2327a6f6-417b-4334-b051-5d9d0a4d5c02\", \"required\": false, \"dateAdded\": \"2025-05-03T12:06:01+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": []}','2025-05-03 11:59:15','2025-05-03 12:06:01',NULL,'09150776-24e3-4670-96c5-1a820af33407'),(4,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"35320e1e-edb6-451c-b9d7-0c1328ea899c\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"f3cf744a-5f97-4ae2-bdab-5dc600b4f38b\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": \"First Name\", \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": false, \"dateAdded\": \"2025-05-03T12:19:16+00:00\", \"inputType\": null, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"ed5a6c88-1539-4eb5-852a-ea9a60a0a994\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Surname\", \"width\": 100, \"handle\": \"fd_surname\", \"warning\": null, \"fieldUid\": \"2327a6f6-417b-4334-b051-5d9d0a4d5c02\", \"required\": false, \"dateAdded\": \"2025-05-03T12:21:38+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": []}','2025-05-03 12:21:38','2025-05-03 12:21:38',NULL,'0309ad3a-9996-45ae-8320-9783e3b258ec');
/*!40000 ALTER TABLE `fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fields` VALUES (1,'Plain Text','fd_plainText','global',NULL,NULL,0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2025-05-03 12:05:24','2025-05-03 12:05:24',NULL,'2327a6f6-417b-4334-b051-5d9d0a4d5c02');
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `globalsets`
--

LOCK TABLES `globalsets` WRITE;
/*!40000 ALTER TABLE `globalsets` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `globalsets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gqlschemas`
--

LOCK TABLES `gqlschemas` WRITE;
/*!40000 ALTER TABLE `gqlschemas` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `gqlschemas` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gqltokens`
--

LOCK TABLES `gqltokens` WRITE;
/*!40000 ALTER TABLE `gqltokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `gqltokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `imagetransforms`
--

LOCK TABLES `imagetransforms` WRITE;
/*!40000 ALTER TABLE `imagetransforms` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `imagetransforms` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `info` VALUES (1,'5.7.4','5.7.0.3',0,'huiiculseebo','3@lgjjnythyj','2025-05-03 11:51:40','2025-05-03 12:21:43','1aaf0767-dd85-4fbf-a8d9-5070ca6ece57');
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `migrations` VALUES (1,'craft','Install','2025-05-03 11:51:41','2025-05-03 11:51:41','2025-05-03 11:51:41','26de1816-186e-4d0d-b270-bc4b66da603a'),(2,'craft','m221101_115859_create_entries_authors_table','2025-05-03 11:51:41','2025-05-03 11:51:41','2025-05-03 11:51:41','4e6b8e6c-50a3-428f-8ff5-8c243b23e80e'),(3,'craft','m221107_112121_add_max_authors_to_sections','2025-05-03 11:51:41','2025-05-03 11:51:41','2025-05-03 11:51:41','fb467340-d8b7-43f2-b7ca-e93b522e61f4'),(4,'craft','m221205_082005_translatable_asset_alt_text','2025-05-03 11:51:41','2025-05-03 11:51:41','2025-05-03 11:51:41','eef89dc3-85ab-4712-b0ee-86b90a4b447e'),(5,'craft','m230314_110309_add_authenticator_table','2025-05-03 11:51:41','2025-05-03 11:51:41','2025-05-03 11:51:41','8b1ac4ed-dadc-4176-988a-98e582376cf7'),(6,'craft','m230314_111234_add_webauthn_table','2025-05-03 11:51:41','2025-05-03 11:51:41','2025-05-03 11:51:41','1556e9aa-c12a-4bb5-8fbe-2e328875ee25'),(7,'craft','m230503_120303_add_recoverycodes_table','2025-05-03 11:51:41','2025-05-03 11:51:41','2025-05-03 11:51:41','eacd89fd-fca5-4402-b189-e22ca554515a'),(8,'craft','m230511_000000_field_layout_configs','2025-05-03 11:51:41','2025-05-03 11:51:41','2025-05-03 11:51:41','7a8593cc-9b8d-4a1d-baed-a292dc7d48d9'),(9,'craft','m230511_215903_content_refactor','2025-05-03 11:51:41','2025-05-03 11:51:41','2025-05-03 11:51:41','bea34736-79f7-4b08-9cef-15292ccf8b66'),(10,'craft','m230524_000000_add_entry_type_show_slug_field','2025-05-03 11:51:41','2025-05-03 11:51:41','2025-05-03 11:51:41','e9a1b409-1e81-42c4-90b3-86ee68bad37f'),(11,'craft','m230524_000001_entry_type_icons','2025-05-03 11:51:41','2025-05-03 11:51:41','2025-05-03 11:51:41','c410d649-4ca3-4695-a58d-f2be8b03730f'),(12,'craft','m230524_000002_entry_type_colors','2025-05-03 11:51:41','2025-05-03 11:51:41','2025-05-03 11:51:41','f8b3546d-74c2-4bff-9585-9394a88495a8'),(13,'craft','m230524_220029_global_entry_types','2025-05-03 11:51:41','2025-05-03 11:51:41','2025-05-03 11:51:41','70bbbe6c-f0a4-48fd-bdf4-a2f93fcaead9'),(14,'craft','m230531_123004_add_entry_type_show_status_field','2025-05-03 11:51:41','2025-05-03 11:51:41','2025-05-03 11:51:41','a3fe9914-468b-41de-ba39-71663d127243'),(15,'craft','m230607_102049_add_entrytype_slug_translation_columns','2025-05-03 11:51:41','2025-05-03 11:51:41','2025-05-03 11:51:41','bb409dfc-bf07-4652-9f93-34b2b095f0f0'),(16,'craft','m230616_173810_kill_field_groups','2025-05-03 11:51:41','2025-05-03 11:51:41','2025-05-03 11:51:41','da9ccb73-ef3d-458d-8d1f-23ae4edd2045'),(17,'craft','m230616_183820_remove_field_name_limit','2025-05-03 11:51:41','2025-05-03 11:51:41','2025-05-03 11:51:41','055e0879-7039-4f07-8786-2bc4ebf1d39b'),(18,'craft','m230617_070415_entrify_matrix_blocks','2025-05-03 11:51:41','2025-05-03 11:51:41','2025-05-03 11:51:41','c32c9079-4110-46ba-ab82-b3ecbd792ca1'),(19,'craft','m230710_162700_element_activity','2025-05-03 11:51:41','2025-05-03 11:51:41','2025-05-03 11:51:41','85b7e72f-9ba9-45fd-9d9b-d5a58af26fdd'),(20,'craft','m230820_162023_fix_cache_id_type','2025-05-03 11:51:41','2025-05-03 11:51:41','2025-05-03 11:51:41','95fe46e6-8e33-46ae-aa67-c41a6b488bbf'),(21,'craft','m230826_094050_fix_session_id_type','2025-05-03 11:51:41','2025-05-03 11:51:41','2025-05-03 11:51:41','dd991b17-3a6c-418e-ab56-2158d39e1a63'),(22,'craft','m230904_190356_address_fields','2025-05-03 11:51:41','2025-05-03 11:51:41','2025-05-03 11:51:41','05616c4f-95b3-4b47-a57e-0a138b088674'),(23,'craft','m230928_144045_add_subpath_to_volumes','2025-05-03 11:51:41','2025-05-03 11:51:41','2025-05-03 11:51:41','e442b5f8-7ec7-47da-bcf2-70cb5cd11485'),(24,'craft','m231013_185640_changedfields_amend_primary_key','2025-05-03 11:51:41','2025-05-03 11:51:41','2025-05-03 11:51:41','7eee2215-0c20-45d5-8eb8-3101110059a4'),(25,'craft','m231213_030600_element_bulk_ops','2025-05-03 11:51:41','2025-05-03 11:51:41','2025-05-03 11:51:41','05bfd85f-fde4-4114-84c5-a5c5f36319a1'),(26,'craft','m240129_150719_sites_language_amend_length','2025-05-03 11:51:41','2025-05-03 11:51:41','2025-05-03 11:51:41','dc08a146-9e8c-4c82-8541-7fec230d7f10'),(27,'craft','m240206_035135_convert_json_columns','2025-05-03 11:51:41','2025-05-03 11:51:41','2025-05-03 11:51:41','f7eecc1a-f978-4aae-bf78-a407243dff2d'),(28,'craft','m240207_182452_address_line_3','2025-05-03 11:51:41','2025-05-03 11:51:41','2025-05-03 11:51:41','0b910a30-e8d5-49a7-82df-4f8a608cea30'),(29,'craft','m240302_212719_solo_preview_targets','2025-05-03 11:51:41','2025-05-03 11:51:41','2025-05-03 11:51:41','ab06c0c3-d85a-4412-bf5c-1d3d28ee8215'),(30,'craft','m240619_091352_add_auth_2fa_timestamp','2025-05-03 11:51:41','2025-05-03 11:51:41','2025-05-03 11:51:41','b9938926-9401-41dc-ad0a-8cd335a51889'),(31,'craft','m240723_214330_drop_bulkop_fk','2025-05-03 11:51:41','2025-05-03 11:51:41','2025-05-03 11:51:41','cf585c17-034b-4c04-a9e8-cb2209a80eb8'),(32,'craft','m240731_053543_soft_delete_fields','2025-05-03 11:51:41','2025-05-03 11:51:41','2025-05-03 11:51:41','1c8a7897-c20a-4a55-9e01-ba062fe83bad'),(33,'craft','m240805_154041_sso_identities','2025-05-03 11:51:41','2025-05-03 11:51:41','2025-05-03 11:51:41','39ee9283-0e4a-461e-9080-4b6df49cf0b5'),(34,'craft','m240926_202248_track_entries_deleted_with_section','2025-05-03 11:51:41','2025-05-03 11:51:41','2025-05-03 11:51:41','c40e9970-1eb1-4663-8cc1-1a075fcad5bd'),(35,'craft','m241120_190905_user_affiliated_sites','2025-05-03 11:51:41','2025-05-03 11:51:41','2025-05-03 11:51:41','bf2fe0e5-7578-4e69-ae26-c0cb55449930'),(36,'craft','m241125_122914_add_viewUsers_permission','2025-05-03 11:51:41','2025-05-03 11:51:41','2025-05-03 11:51:41','842c7123-54ff-406c-8e8f-de84a6438fb0'),(37,'craft','m250119_135304_entry_type_overrides','2025-05-03 11:51:41','2025-05-03 11:51:41','2025-05-03 11:51:41','1790f8dc-19ef-4549-851d-d78bf3031973'),(38,'craft','m250206_135036_search_index_queue','2025-05-03 11:51:41','2025-05-03 11:51:41','2025-05-03 11:51:41','286c2f35-963c-4a1c-965f-f2de0a5e30f8'),(39,'craft','m250207_172349_bulkop_events','2025-05-03 11:51:41','2025-05-03 11:51:41','2025-05-03 11:51:41','8dc692b7-178a-469b-97db-ea626c369499'),(40,'craft','m250315_131608_unlimited_authors','2025-05-03 11:51:41','2025-05-03 11:51:41','2025-05-03 11:51:41','252f9491-f0a0-4b44-b247-8b88b316de9f'),(41,'craft','m250403_171253_static_statuses','2025-05-03 11:51:41','2025-05-03 11:51:41','2025-05-03 11:51:41','882d3f37-67b4-4afe-99f6-eaac2cb2935b');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `projectconfig`
--

LOCK TABLES `projectconfig` WRITE;
/*!40000 ALTER TABLE `projectconfig` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `projectconfig` VALUES ('dateModified','1746274903'),('email.fromEmail','\"access@hypha.media\"'),('email.fromName','\"Porter Craft\"'),('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.color','null'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elementCondition','null'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.0.autocapitalize','true'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.0.autocomplete','false'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.0.autocorrect','true'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.0.class','null'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.0.dateAdded','\"2025-05-03T12:19:16+00:00\"'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.0.disabled','false'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.0.elementCondition','null'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.0.id','null'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.0.includeInCards','false'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.0.inputType','null'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.0.instructions','null'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.0.label','\"First Name\"'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.0.max','null'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.0.min','null'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.0.name','null'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.0.orientation','null'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.0.placeholder','null'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.0.providesThumbs','false'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.0.readonly','false'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.0.required','false'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.0.size','null'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.0.step','null'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.0.tip','null'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.0.title','null'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.0.uid','\"f3cf744a-5f97-4ae2-bdab-5dc600b4f38b\"'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.0.userCondition','null'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.0.warning','null'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.0.width','100'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.1.dateAdded','\"2025-05-03T12:21:38+00:00\"'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.1.editCondition','null'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.1.elementCondition','null'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.1.fieldUid','\"2327a6f6-417b-4334-b051-5d9d0a4d5c02\"'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.1.handle','\"fd_surname\"'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.1.includeInCards','false'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.1.instructions','null'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.1.label','\"Surname\"'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.1.providesThumbs','false'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.1.required','false'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.1.tip','null'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.1.uid','\"ed5a6c88-1539-4eb5-852a-ea9a60a0a994\"'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.1.userCondition','null'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.1.warning','null'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.1.width','100'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.name','\"Content\"'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.uid','\"35320e1e-edb6-451c-b9d7-0c1328ea899c\"'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.userCondition','null'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.handle','\"entSupervisors\"'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.hasTitleField','true'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.icon','\"clipboard\"'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.name','\"Ent Supervisors\"'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.showSlugField','true'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.showStatusField','true'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.slugTranslationKeyFormat','null'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.slugTranslationMethod','\"site\"'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.titleFormat','null'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.titleTranslationKeyFormat','null'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.titleTranslationMethod','\"site\"'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.color','null'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.fieldLayouts.c1805f47-7d20-47d4-8ae0-99427a38111c.tabs.0.elementCondition','null'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.fieldLayouts.c1805f47-7d20-47d4-8ae0-99427a38111c.tabs.0.elements.0.autocapitalize','true'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.fieldLayouts.c1805f47-7d20-47d4-8ae0-99427a38111c.tabs.0.elements.0.autocomplete','false'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.fieldLayouts.c1805f47-7d20-47d4-8ae0-99427a38111c.tabs.0.elements.0.autocorrect','true'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.fieldLayouts.c1805f47-7d20-47d4-8ae0-99427a38111c.tabs.0.elements.0.class','null'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.fieldLayouts.c1805f47-7d20-47d4-8ae0-99427a38111c.tabs.0.elements.0.dateAdded','\"2025-05-03T11:54:36+00:00\"'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.fieldLayouts.c1805f47-7d20-47d4-8ae0-99427a38111c.tabs.0.elements.0.disabled','false'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.fieldLayouts.c1805f47-7d20-47d4-8ae0-99427a38111c.tabs.0.elements.0.elementCondition','null'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.fieldLayouts.c1805f47-7d20-47d4-8ae0-99427a38111c.tabs.0.elements.0.id','null'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.fieldLayouts.c1805f47-7d20-47d4-8ae0-99427a38111c.tabs.0.elements.0.includeInCards','false'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.fieldLayouts.c1805f47-7d20-47d4-8ae0-99427a38111c.tabs.0.elements.0.inputType','null'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.fieldLayouts.c1805f47-7d20-47d4-8ae0-99427a38111c.tabs.0.elements.0.instructions','null'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.fieldLayouts.c1805f47-7d20-47d4-8ae0-99427a38111c.tabs.0.elements.0.label','null'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.fieldLayouts.c1805f47-7d20-47d4-8ae0-99427a38111c.tabs.0.elements.0.max','null'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.fieldLayouts.c1805f47-7d20-47d4-8ae0-99427a38111c.tabs.0.elements.0.min','null'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.fieldLayouts.c1805f47-7d20-47d4-8ae0-99427a38111c.tabs.0.elements.0.name','null'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.fieldLayouts.c1805f47-7d20-47d4-8ae0-99427a38111c.tabs.0.elements.0.orientation','null'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.fieldLayouts.c1805f47-7d20-47d4-8ae0-99427a38111c.tabs.0.elements.0.placeholder','null'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.fieldLayouts.c1805f47-7d20-47d4-8ae0-99427a38111c.tabs.0.elements.0.providesThumbs','false'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.fieldLayouts.c1805f47-7d20-47d4-8ae0-99427a38111c.tabs.0.elements.0.readonly','false'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.fieldLayouts.c1805f47-7d20-47d4-8ae0-99427a38111c.tabs.0.elements.0.required','true'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.fieldLayouts.c1805f47-7d20-47d4-8ae0-99427a38111c.tabs.0.elements.0.size','null'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.fieldLayouts.c1805f47-7d20-47d4-8ae0-99427a38111c.tabs.0.elements.0.step','null'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.fieldLayouts.c1805f47-7d20-47d4-8ae0-99427a38111c.tabs.0.elements.0.tip','null'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.fieldLayouts.c1805f47-7d20-47d4-8ae0-99427a38111c.tabs.0.elements.0.title','null'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.fieldLayouts.c1805f47-7d20-47d4-8ae0-99427a38111c.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.fieldLayouts.c1805f47-7d20-47d4-8ae0-99427a38111c.tabs.0.elements.0.uid','\"c69ae4d9-9663-40c1-ab14-bf600cda66c3\"'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.fieldLayouts.c1805f47-7d20-47d4-8ae0-99427a38111c.tabs.0.elements.0.userCondition','null'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.fieldLayouts.c1805f47-7d20-47d4-8ae0-99427a38111c.tabs.0.elements.0.warning','null'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.fieldLayouts.c1805f47-7d20-47d4-8ae0-99427a38111c.tabs.0.elements.0.width','100'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.fieldLayouts.c1805f47-7d20-47d4-8ae0-99427a38111c.tabs.0.name','\"Content\"'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.fieldLayouts.c1805f47-7d20-47d4-8ae0-99427a38111c.tabs.0.uid','\"764fa209-1710-4061-adde-b5507d3af420\"'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.fieldLayouts.c1805f47-7d20-47d4-8ae0-99427a38111c.tabs.0.userCondition','null'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.handle','\"entBuildings\"'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.hasTitleField','true'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.icon','\"building\"'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.name','\"Ent Buildings\"'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.showSlugField','true'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.showStatusField','true'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.slugTranslationKeyFormat','null'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.slugTranslationMethod','\"site\"'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.titleFormat','null'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.titleTranslationKeyFormat','null'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.titleTranslationMethod','\"site\"'),('entryTypes.f5051ed3-2649-4f41-a303-9d3b06368f94.color','null'),('entryTypes.f5051ed3-2649-4f41-a303-9d3b06368f94.fieldLayouts.0a3f4f6b-8ae9-41ea-b7d2-162fd7c07921.tabs.0.elementCondition','null'),('entryTypes.f5051ed3-2649-4f41-a303-9d3b06368f94.fieldLayouts.0a3f4f6b-8ae9-41ea-b7d2-162fd7c07921.tabs.0.elements.0.autocapitalize','true'),('entryTypes.f5051ed3-2649-4f41-a303-9d3b06368f94.fieldLayouts.0a3f4f6b-8ae9-41ea-b7d2-162fd7c07921.tabs.0.elements.0.autocomplete','false'),('entryTypes.f5051ed3-2649-4f41-a303-9d3b06368f94.fieldLayouts.0a3f4f6b-8ae9-41ea-b7d2-162fd7c07921.tabs.0.elements.0.autocorrect','true'),('entryTypes.f5051ed3-2649-4f41-a303-9d3b06368f94.fieldLayouts.0a3f4f6b-8ae9-41ea-b7d2-162fd7c07921.tabs.0.elements.0.class','null'),('entryTypes.f5051ed3-2649-4f41-a303-9d3b06368f94.fieldLayouts.0a3f4f6b-8ae9-41ea-b7d2-162fd7c07921.tabs.0.elements.0.dateAdded','\"2025-05-03T11:55:35+00:00\"'),('entryTypes.f5051ed3-2649-4f41-a303-9d3b06368f94.fieldLayouts.0a3f4f6b-8ae9-41ea-b7d2-162fd7c07921.tabs.0.elements.0.disabled','false'),('entryTypes.f5051ed3-2649-4f41-a303-9d3b06368f94.fieldLayouts.0a3f4f6b-8ae9-41ea-b7d2-162fd7c07921.tabs.0.elements.0.elementCondition','null'),('entryTypes.f5051ed3-2649-4f41-a303-9d3b06368f94.fieldLayouts.0a3f4f6b-8ae9-41ea-b7d2-162fd7c07921.tabs.0.elements.0.id','null'),('entryTypes.f5051ed3-2649-4f41-a303-9d3b06368f94.fieldLayouts.0a3f4f6b-8ae9-41ea-b7d2-162fd7c07921.tabs.0.elements.0.includeInCards','false'),('entryTypes.f5051ed3-2649-4f41-a303-9d3b06368f94.fieldLayouts.0a3f4f6b-8ae9-41ea-b7d2-162fd7c07921.tabs.0.elements.0.inputType','null'),('entryTypes.f5051ed3-2649-4f41-a303-9d3b06368f94.fieldLayouts.0a3f4f6b-8ae9-41ea-b7d2-162fd7c07921.tabs.0.elements.0.instructions','null'),('entryTypes.f5051ed3-2649-4f41-a303-9d3b06368f94.fieldLayouts.0a3f4f6b-8ae9-41ea-b7d2-162fd7c07921.tabs.0.elements.0.label','null'),('entryTypes.f5051ed3-2649-4f41-a303-9d3b06368f94.fieldLayouts.0a3f4f6b-8ae9-41ea-b7d2-162fd7c07921.tabs.0.elements.0.max','null'),('entryTypes.f5051ed3-2649-4f41-a303-9d3b06368f94.fieldLayouts.0a3f4f6b-8ae9-41ea-b7d2-162fd7c07921.tabs.0.elements.0.min','null'),('entryTypes.f5051ed3-2649-4f41-a303-9d3b06368f94.fieldLayouts.0a3f4f6b-8ae9-41ea-b7d2-162fd7c07921.tabs.0.elements.0.name','null'),('entryTypes.f5051ed3-2649-4f41-a303-9d3b06368f94.fieldLayouts.0a3f4f6b-8ae9-41ea-b7d2-162fd7c07921.tabs.0.elements.0.orientation','null'),('entryTypes.f5051ed3-2649-4f41-a303-9d3b06368f94.fieldLayouts.0a3f4f6b-8ae9-41ea-b7d2-162fd7c07921.tabs.0.elements.0.placeholder','null'),('entryTypes.f5051ed3-2649-4f41-a303-9d3b06368f94.fieldLayouts.0a3f4f6b-8ae9-41ea-b7d2-162fd7c07921.tabs.0.elements.0.providesThumbs','false'),('entryTypes.f5051ed3-2649-4f41-a303-9d3b06368f94.fieldLayouts.0a3f4f6b-8ae9-41ea-b7d2-162fd7c07921.tabs.0.elements.0.readonly','false'),('entryTypes.f5051ed3-2649-4f41-a303-9d3b06368f94.fieldLayouts.0a3f4f6b-8ae9-41ea-b7d2-162fd7c07921.tabs.0.elements.0.required','true'),('entryTypes.f5051ed3-2649-4f41-a303-9d3b06368f94.fieldLayouts.0a3f4f6b-8ae9-41ea-b7d2-162fd7c07921.tabs.0.elements.0.size','null'),('entryTypes.f5051ed3-2649-4f41-a303-9d3b06368f94.fieldLayouts.0a3f4f6b-8ae9-41ea-b7d2-162fd7c07921.tabs.0.elements.0.step','null'),('entryTypes.f5051ed3-2649-4f41-a303-9d3b06368f94.fieldLayouts.0a3f4f6b-8ae9-41ea-b7d2-162fd7c07921.tabs.0.elements.0.tip','null'),('entryTypes.f5051ed3-2649-4f41-a303-9d3b06368f94.fieldLayouts.0a3f4f6b-8ae9-41ea-b7d2-162fd7c07921.tabs.0.elements.0.title','null'),('entryTypes.f5051ed3-2649-4f41-a303-9d3b06368f94.fieldLayouts.0a3f4f6b-8ae9-41ea-b7d2-162fd7c07921.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.f5051ed3-2649-4f41-a303-9d3b06368f94.fieldLayouts.0a3f4f6b-8ae9-41ea-b7d2-162fd7c07921.tabs.0.elements.0.uid','\"b4dd7357-e4b5-4c5f-bc44-a3942381aaed\"'),('entryTypes.f5051ed3-2649-4f41-a303-9d3b06368f94.fieldLayouts.0a3f4f6b-8ae9-41ea-b7d2-162fd7c07921.tabs.0.elements.0.userCondition','null'),('entryTypes.f5051ed3-2649-4f41-a303-9d3b06368f94.fieldLayouts.0a3f4f6b-8ae9-41ea-b7d2-162fd7c07921.tabs.0.elements.0.warning','null'),('entryTypes.f5051ed3-2649-4f41-a303-9d3b06368f94.fieldLayouts.0a3f4f6b-8ae9-41ea-b7d2-162fd7c07921.tabs.0.elements.0.width','100'),('entryTypes.f5051ed3-2649-4f41-a303-9d3b06368f94.fieldLayouts.0a3f4f6b-8ae9-41ea-b7d2-162fd7c07921.tabs.0.name','\"Content\"'),('entryTypes.f5051ed3-2649-4f41-a303-9d3b06368f94.fieldLayouts.0a3f4f6b-8ae9-41ea-b7d2-162fd7c07921.tabs.0.uid','\"168c59fd-e818-45ec-811d-7d74774c9138\"'),('entryTypes.f5051ed3-2649-4f41-a303-9d3b06368f94.fieldLayouts.0a3f4f6b-8ae9-41ea-b7d2-162fd7c07921.tabs.0.userCondition','null'),('entryTypes.f5051ed3-2649-4f41-a303-9d3b06368f94.handle','\"entDepartments\"'),('entryTypes.f5051ed3-2649-4f41-a303-9d3b06368f94.hasTitleField','true'),('entryTypes.f5051ed3-2649-4f41-a303-9d3b06368f94.icon','\"phone-office\"'),('entryTypes.f5051ed3-2649-4f41-a303-9d3b06368f94.name','\"Ent Departments\"'),('entryTypes.f5051ed3-2649-4f41-a303-9d3b06368f94.showSlugField','true'),('entryTypes.f5051ed3-2649-4f41-a303-9d3b06368f94.showStatusField','true'),('entryTypes.f5051ed3-2649-4f41-a303-9d3b06368f94.slugTranslationKeyFormat','null'),('entryTypes.f5051ed3-2649-4f41-a303-9d3b06368f94.slugTranslationMethod','\"site\"'),('entryTypes.f5051ed3-2649-4f41-a303-9d3b06368f94.titleFormat','null'),('entryTypes.f5051ed3-2649-4f41-a303-9d3b06368f94.titleTranslationKeyFormat','null'),('entryTypes.f5051ed3-2649-4f41-a303-9d3b06368f94.titleTranslationMethod','\"site\"'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.color','null'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elementCondition','null'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.0.autocapitalize','true'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.0.autocomplete','false'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.0.autocorrect','true'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.0.class','null'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.0.dateAdded','\"2025-05-03T11:57:22+00:00\"'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.0.disabled','false'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.0.elementCondition','null'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.0.id','null'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.0.includeInCards','false'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.0.inputType','null'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.0.instructions','null'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.0.label','\"First Name\"'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.0.max','null'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.0.min','null'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.0.name','null'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.0.orientation','null'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.0.placeholder','null'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.0.providesThumbs','false'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.0.readonly','false'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.0.required','false'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.0.size','null'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.0.step','null'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.0.tip','null'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.0.title','null'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.0.uid','\"0d77459c-6b5e-4021-827e-d60317e8df21\"'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.0.userCondition','null'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.0.warning','null'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.0.width','100'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.1.dateAdded','\"2025-05-03T12:06:01+00:00\"'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.1.editCondition','null'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.1.elementCondition','null'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.1.fieldUid','\"2327a6f6-417b-4334-b051-5d9d0a4d5c02\"'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.1.handle','\"fd_surname\"'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.1.includeInCards','false'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.1.instructions','null'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.1.label','\"Surname\"'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.1.providesThumbs','false'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.1.required','false'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.1.tip','null'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.1.uid','\"009018f1-2b1f-4378-b2a7-c2fbd98e5d5b\"'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.1.userCondition','null'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.1.warning','null'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.1.width','100'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.name','\"Content\"'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.uid','\"04bae4b1-aa27-456a-9da1-61199702ed14\"'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.userCondition','null'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.handle','\"entPorters\"'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.hasTitleField','true'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.icon','\"person-walking-luggage\"'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.name','\"Ent Porters\"'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.showSlugField','true'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.showStatusField','true'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.slugTranslationKeyFormat','null'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.slugTranslationMethod','\"site\"'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.titleFormat','\"{fd_surname}\"'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.titleTranslationKeyFormat','null'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.titleTranslationMethod','\"site\"'),('fields.2327a6f6-417b-4334-b051-5d9d0a4d5c02.columnSuffix','null'),('fields.2327a6f6-417b-4334-b051-5d9d0a4d5c02.handle','\"fd_plainText\"'),('fields.2327a6f6-417b-4334-b051-5d9d0a4d5c02.instructions','null'),('fields.2327a6f6-417b-4334-b051-5d9d0a4d5c02.name','\"Plain Text\"'),('fields.2327a6f6-417b-4334-b051-5d9d0a4d5c02.searchable','false'),('fields.2327a6f6-417b-4334-b051-5d9d0a4d5c02.settings.byteLimit','null'),('fields.2327a6f6-417b-4334-b051-5d9d0a4d5c02.settings.charLimit','null'),('fields.2327a6f6-417b-4334-b051-5d9d0a4d5c02.settings.code','false'),('fields.2327a6f6-417b-4334-b051-5d9d0a4d5c02.settings.initialRows','4'),('fields.2327a6f6-417b-4334-b051-5d9d0a4d5c02.settings.multiline','false'),('fields.2327a6f6-417b-4334-b051-5d9d0a4d5c02.settings.placeholder','null'),('fields.2327a6f6-417b-4334-b051-5d9d0a4d5c02.settings.uiMode','\"normal\"'),('fields.2327a6f6-417b-4334-b051-5d9d0a4d5c02.translationKeyFormat','null'),('fields.2327a6f6-417b-4334-b051-5d9d0a4d5c02.translationMethod','\"none\"'),('fields.2327a6f6-417b-4334-b051-5d9d0a4d5c02.type','\"craft\\\\fields\\\\PlainText\"'),('meta.__names__.0ddc1c53-595b-487f-8473-eece2e4861de','\"Ent Supervisors\"'),('meta.__names__.2327a6f6-417b-4334-b051-5d9d0a4d5c02','\"Plain Text\"'),('meta.__names__.5f52388b-f9f4-4132-81c1-55802c67d8cc','\"Buildings\"'),('meta.__names__.6a92aa12-7350-4d77-a9af-a478cee25845','\"Porter Craft\"'),('meta.__names__.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d','\"Ent Buildings\"'),('meta.__names__.b1d95329-57ac-49cf-90d7-b40a1bdbcd01','\"Porters\"'),('meta.__names__.ceac8342-76fb-422f-a0a3-efb6a2e94704','\"Departments\"'),('meta.__names__.ebb3dbd8-552b-48fb-aebb-0c13143be157','\"Porter Craft\"'),('meta.__names__.f44b07d1-48b3-48fe-8bfe-f8f12f5ed053','\"Supervisors\"'),('meta.__names__.f5051ed3-2649-4f41-a303-9d3b06368f94','\"Ent Departments\"'),('meta.__names__.fe915955-f57d-4ec4-bf9c-92c417a8e11d','\"Ent Porters\"'),('sections.5f52388b-f9f4-4132-81c1-55802c67d8cc.defaultPlacement','\"end\"'),('sections.5f52388b-f9f4-4132-81c1-55802c67d8cc.enableVersioning','true'),('sections.5f52388b-f9f4-4132-81c1-55802c67d8cc.entryTypes.0.uid','\"a6ca13d7-bc6b-4c17-a310-b0fcaa34804d\"'),('sections.5f52388b-f9f4-4132-81c1-55802c67d8cc.handle','\"buildings\"'),('sections.5f52388b-f9f4-4132-81c1-55802c67d8cc.maxAuthors','1'),('sections.5f52388b-f9f4-4132-81c1-55802c67d8cc.name','\"Buildings\"'),('sections.5f52388b-f9f4-4132-81c1-55802c67d8cc.previewTargets.0.__assoc__.0.0','\"label\"'),('sections.5f52388b-f9f4-4132-81c1-55802c67d8cc.previewTargets.0.__assoc__.0.1','\"Primary entry page\"'),('sections.5f52388b-f9f4-4132-81c1-55802c67d8cc.previewTargets.0.__assoc__.1.0','\"urlFormat\"'),('sections.5f52388b-f9f4-4132-81c1-55802c67d8cc.previewTargets.0.__assoc__.1.1','\"{url}\"'),('sections.5f52388b-f9f4-4132-81c1-55802c67d8cc.previewTargets.0.__assoc__.2.0','\"refresh\"'),('sections.5f52388b-f9f4-4132-81c1-55802c67d8cc.previewTargets.0.__assoc__.2.1','\"1\"'),('sections.5f52388b-f9f4-4132-81c1-55802c67d8cc.propagationMethod','\"all\"'),('sections.5f52388b-f9f4-4132-81c1-55802c67d8cc.siteSettings.6a92aa12-7350-4d77-a9af-a478cee25845.enabledByDefault','true'),('sections.5f52388b-f9f4-4132-81c1-55802c67d8cc.siteSettings.6a92aa12-7350-4d77-a9af-a478cee25845.hasUrls','true'),('sections.5f52388b-f9f4-4132-81c1-55802c67d8cc.siteSettings.6a92aa12-7350-4d77-a9af-a478cee25845.template','\"buildings/_entry.twig\"'),('sections.5f52388b-f9f4-4132-81c1-55802c67d8cc.siteSettings.6a92aa12-7350-4d77-a9af-a478cee25845.uriFormat','\"buildings/{slug}\"'),('sections.5f52388b-f9f4-4132-81c1-55802c67d8cc.type','\"channel\"'),('sections.b1d95329-57ac-49cf-90d7-b40a1bdbcd01.defaultPlacement','\"end\"'),('sections.b1d95329-57ac-49cf-90d7-b40a1bdbcd01.enableVersioning','true'),('sections.b1d95329-57ac-49cf-90d7-b40a1bdbcd01.entryTypes.0.uid','\"fe915955-f57d-4ec4-bf9c-92c417a8e11d\"'),('sections.b1d95329-57ac-49cf-90d7-b40a1bdbcd01.handle','\"porters\"'),('sections.b1d95329-57ac-49cf-90d7-b40a1bdbcd01.maxAuthors','1'),('sections.b1d95329-57ac-49cf-90d7-b40a1bdbcd01.name','\"Porters\"'),('sections.b1d95329-57ac-49cf-90d7-b40a1bdbcd01.previewTargets.0.__assoc__.0.0','\"label\"'),('sections.b1d95329-57ac-49cf-90d7-b40a1bdbcd01.previewTargets.0.__assoc__.0.1','\"Primary entry page\"'),('sections.b1d95329-57ac-49cf-90d7-b40a1bdbcd01.previewTargets.0.__assoc__.1.0','\"urlFormat\"'),('sections.b1d95329-57ac-49cf-90d7-b40a1bdbcd01.previewTargets.0.__assoc__.1.1','\"{url}\"'),('sections.b1d95329-57ac-49cf-90d7-b40a1bdbcd01.previewTargets.0.__assoc__.2.0','\"refresh\"'),('sections.b1d95329-57ac-49cf-90d7-b40a1bdbcd01.previewTargets.0.__assoc__.2.1','\"1\"'),('sections.b1d95329-57ac-49cf-90d7-b40a1bdbcd01.propagationMethod','\"all\"'),('sections.b1d95329-57ac-49cf-90d7-b40a1bdbcd01.siteSettings.6a92aa12-7350-4d77-a9af-a478cee25845.enabledByDefault','true'),('sections.b1d95329-57ac-49cf-90d7-b40a1bdbcd01.siteSettings.6a92aa12-7350-4d77-a9af-a478cee25845.hasUrls','true'),('sections.b1d95329-57ac-49cf-90d7-b40a1bdbcd01.siteSettings.6a92aa12-7350-4d77-a9af-a478cee25845.template','\"porters/_entry.twig\"'),('sections.b1d95329-57ac-49cf-90d7-b40a1bdbcd01.siteSettings.6a92aa12-7350-4d77-a9af-a478cee25845.uriFormat','\"porters/{slug}\"'),('sections.b1d95329-57ac-49cf-90d7-b40a1bdbcd01.structure.maxLevels','1'),('sections.b1d95329-57ac-49cf-90d7-b40a1bdbcd01.structure.uid','\"a210ba69-a5b6-41ee-85e4-be3c257b2891\"'),('sections.b1d95329-57ac-49cf-90d7-b40a1bdbcd01.type','\"structure\"'),('sections.ceac8342-76fb-422f-a0a3-efb6a2e94704.defaultPlacement','\"end\"'),('sections.ceac8342-76fb-422f-a0a3-efb6a2e94704.enableVersioning','true'),('sections.ceac8342-76fb-422f-a0a3-efb6a2e94704.entryTypes.0.uid','\"f5051ed3-2649-4f41-a303-9d3b06368f94\"'),('sections.ceac8342-76fb-422f-a0a3-efb6a2e94704.handle','\"departments\"'),('sections.ceac8342-76fb-422f-a0a3-efb6a2e94704.maxAuthors','1'),('sections.ceac8342-76fb-422f-a0a3-efb6a2e94704.name','\"Departments\"'),('sections.ceac8342-76fb-422f-a0a3-efb6a2e94704.previewTargets.0.__assoc__.0.0','\"label\"'),('sections.ceac8342-76fb-422f-a0a3-efb6a2e94704.previewTargets.0.__assoc__.0.1','\"Primary entry page\"'),('sections.ceac8342-76fb-422f-a0a3-efb6a2e94704.previewTargets.0.__assoc__.1.0','\"urlFormat\"'),('sections.ceac8342-76fb-422f-a0a3-efb6a2e94704.previewTargets.0.__assoc__.1.1','\"{url}\"'),('sections.ceac8342-76fb-422f-a0a3-efb6a2e94704.previewTargets.0.__assoc__.2.0','\"refresh\"'),('sections.ceac8342-76fb-422f-a0a3-efb6a2e94704.previewTargets.0.__assoc__.2.1','\"1\"'),('sections.ceac8342-76fb-422f-a0a3-efb6a2e94704.propagationMethod','\"all\"'),('sections.ceac8342-76fb-422f-a0a3-efb6a2e94704.siteSettings.6a92aa12-7350-4d77-a9af-a478cee25845.enabledByDefault','true'),('sections.ceac8342-76fb-422f-a0a3-efb6a2e94704.siteSettings.6a92aa12-7350-4d77-a9af-a478cee25845.hasUrls','true'),('sections.ceac8342-76fb-422f-a0a3-efb6a2e94704.siteSettings.6a92aa12-7350-4d77-a9af-a478cee25845.template','\"departments/_entry.twig\"'),('sections.ceac8342-76fb-422f-a0a3-efb6a2e94704.siteSettings.6a92aa12-7350-4d77-a9af-a478cee25845.uriFormat','\"departments/{slug}\"'),('sections.ceac8342-76fb-422f-a0a3-efb6a2e94704.type','\"channel\"'),('sections.f44b07d1-48b3-48fe-8bfe-f8f12f5ed053.defaultPlacement','\"end\"'),('sections.f44b07d1-48b3-48fe-8bfe-f8f12f5ed053.enableVersioning','true'),('sections.f44b07d1-48b3-48fe-8bfe-f8f12f5ed053.entryTypes.0.uid','\"0ddc1c53-595b-487f-8473-eece2e4861de\"'),('sections.f44b07d1-48b3-48fe-8bfe-f8f12f5ed053.handle','\"supervisors\"'),('sections.f44b07d1-48b3-48fe-8bfe-f8f12f5ed053.maxAuthors','1'),('sections.f44b07d1-48b3-48fe-8bfe-f8f12f5ed053.name','\"Supervisors\"'),('sections.f44b07d1-48b3-48fe-8bfe-f8f12f5ed053.previewTargets.0.__assoc__.0.0','\"label\"'),('sections.f44b07d1-48b3-48fe-8bfe-f8f12f5ed053.previewTargets.0.__assoc__.0.1','\"Primary entry page\"'),('sections.f44b07d1-48b3-48fe-8bfe-f8f12f5ed053.previewTargets.0.__assoc__.1.0','\"urlFormat\"'),('sections.f44b07d1-48b3-48fe-8bfe-f8f12f5ed053.previewTargets.0.__assoc__.1.1','\"{url}\"'),('sections.f44b07d1-48b3-48fe-8bfe-f8f12f5ed053.previewTargets.0.__assoc__.2.0','\"refresh\"'),('sections.f44b07d1-48b3-48fe-8bfe-f8f12f5ed053.previewTargets.0.__assoc__.2.1','\"1\"'),('sections.f44b07d1-48b3-48fe-8bfe-f8f12f5ed053.propagationMethod','\"all\"'),('sections.f44b07d1-48b3-48fe-8bfe-f8f12f5ed053.siteSettings.6a92aa12-7350-4d77-a9af-a478cee25845.enabledByDefault','true'),('sections.f44b07d1-48b3-48fe-8bfe-f8f12f5ed053.siteSettings.6a92aa12-7350-4d77-a9af-a478cee25845.hasUrls','true'),('sections.f44b07d1-48b3-48fe-8bfe-f8f12f5ed053.siteSettings.6a92aa12-7350-4d77-a9af-a478cee25845.template','\"supervisors/_entry.twig\"'),('sections.f44b07d1-48b3-48fe-8bfe-f8f12f5ed053.siteSettings.6a92aa12-7350-4d77-a9af-a478cee25845.uriFormat','\"supervisors/{slug}\"'),('sections.f44b07d1-48b3-48fe-8bfe-f8f12f5ed053.type','\"channel\"'),('siteGroups.ebb3dbd8-552b-48fb-aebb-0c13143be157.name','\"Porter Craft\"'),('sites.6a92aa12-7350-4d77-a9af-a478cee25845.baseUrl','\"$PRIMARY_SITE_URL\"'),('sites.6a92aa12-7350-4d77-a9af-a478cee25845.handle','\"default\"'),('sites.6a92aa12-7350-4d77-a9af-a478cee25845.hasUrls','true'),('sites.6a92aa12-7350-4d77-a9af-a478cee25845.language','\"en-GB\"'),('sites.6a92aa12-7350-4d77-a9af-a478cee25845.name','\"Porter Craft\"'),('sites.6a92aa12-7350-4d77-a9af-a478cee25845.primary','true'),('sites.6a92aa12-7350-4d77-a9af-a478cee25845.siteGroup','\"ebb3dbd8-552b-48fb-aebb-0c13143be157\"'),('sites.6a92aa12-7350-4d77-a9af-a478cee25845.sortOrder','1'),('system.edition','\"solo\"'),('system.live','true'),('system.name','\"Porter Craft\"'),('system.schemaVersion','\"5.7.0.3\"'),('system.timeZone','\"America/Los_Angeles\"'),('users.allowPublicRegistration','false'),('users.defaultGroup','null'),('users.photoSubpath','null'),('users.photoVolumeUid','null'),('users.require2fa','false'),('users.requireEmailVerification','true');
/*!40000 ALTER TABLE `projectconfig` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `queue`
--

LOCK TABLES `queue` WRITE;
/*!40000 ALTER TABLE `queue` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `queue` VALUES (16,'queue',_binary 'O:31:\"craft\\queue\\jobs\\PruneRevisions\":7:{s:11:\"description\";N;s:30:\"\0craft\\queue\\BaseJob\0_progress\";i:0;s:35:\"\0craft\\queue\\BaseJob\0_progressLabel\";N;s:11:\"elementType\";s:20:\"craft\\elements\\Entry\";s:11:\"canonicalId\";i:9;s:6:\"siteId\";i:1;s:12:\"maxRevisions\";N;}','t9n:[\"app\",\"Pruning extra revisions\"]',1746275392,300,0,2049,NULL,NULL,0,NULL,NULL,0,NULL,NULL),(17,'queue',_binary 'O:34:\"craft\\queue\\jobs\\UpdateSearchIndex\":8:{s:11:\"description\";N;s:30:\"\0craft\\queue\\BaseJob\0_progress\";i:0;s:35:\"\0craft\\queue\\BaseJob\0_progressLabel\";N;s:11:\"elementType\";s:20:\"craft\\elements\\Entry\";s:9:\"elementId\";i:9;s:6:\"siteId\";i:1;s:12:\"fieldHandles\";N;s:6:\"queued\";b:1;}','t9n:[\"app\",\"Updating search indexes\"]',1746275392,300,0,2048,NULL,NULL,0,NULL,NULL,0,NULL,NULL);
/*!40000 ALTER TABLE `queue` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `recoverycodes`
--

LOCK TABLES `recoverycodes` WRITE;
/*!40000 ALTER TABLE `recoverycodes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `recoverycodes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `relations`
--

LOCK TABLES `relations` WRITE;
/*!40000 ALTER TABLE `relations` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `relations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `revisions` VALUES (1,4,1,1,NULL),(2,4,1,2,''),(3,4,1,3,'Applied “Draft 1”'),(4,9,1,1,NULL);
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `searchindex`
--

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `searchindex` VALUES (1,'email',0,1,' access hypha media '),(1,'firstname',0,1,''),(1,'fullname',0,1,''),(1,'lastname',0,1,''),(1,'slug',0,1,''),(1,'username',0,1,' admin '),(2,'slug',0,1,' temp pxzlpjnabjikamnwjejvvobpzwmiroonccre '),(2,'title',0,1,''),(3,'slug',0,1,' temp quwbzqbmymkojerbyjcikwtnqmbjiadkenac '),(3,'title',0,1,''),(4,'slug',0,1,' porter '),(4,'title',0,1,' porter ');
/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `searchindexqueue`
--

LOCK TABLES `searchindexqueue` WRITE;
/*!40000 ALTER TABLE `searchindexqueue` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `searchindexqueue` VALUES (6,9,1,0);
/*!40000 ALTER TABLE `searchindexqueue` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `searchindexqueue_fields`
--

LOCK TABLES `searchindexqueue_fields` WRITE;
/*!40000 ALTER TABLE `searchindexqueue_fields` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `searchindexqueue_fields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections` VALUES (1,NULL,'Buildings','buildings','channel',1,1,'all','end','[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]','2025-05-03 11:56:20','2025-05-03 11:56:20',NULL,'5f52388b-f9f4-4132-81c1-55802c67d8cc'),(2,NULL,'Departments','departments','channel',1,1,'all','end','[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]','2025-05-03 11:57:24','2025-05-03 11:57:24',NULL,'ceac8342-76fb-422f-a0a3-efb6a2e94704'),(3,1,'Porters','porters','structure',1,1,'all','end','[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]','2025-05-03 11:59:26','2025-05-03 11:59:26',NULL,'b1d95329-57ac-49cf-90d7-b40a1bdbcd01'),(4,NULL,'Supervisors','supervisors','channel',1,1,'all','end','[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]','2025-05-03 12:21:43','2025-05-03 12:21:43',NULL,'f44b07d1-48b3-48fe-8bfe-f8f12f5ed053');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections_entrytypes`
--

LOCK TABLES `sections_entrytypes` WRITE;
/*!40000 ALTER TABLE `sections_entrytypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections_entrytypes` VALUES (1,1,1,NULL,NULL),(2,2,1,NULL,NULL),(3,3,1,NULL,NULL),(4,4,1,NULL,NULL);
/*!40000 ALTER TABLE `sections_entrytypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections_sites`
--

LOCK TABLES `sections_sites` WRITE;
/*!40000 ALTER TABLE `sections_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections_sites` VALUES (1,1,1,1,'buildings/{slug}','buildings/_entry.twig',1,'2025-05-03 11:56:20','2025-05-03 11:56:20','070007aa-0930-4d0b-8e4f-170e8806e5e5'),(2,2,1,1,'departments/{slug}','departments/_entry.twig',1,'2025-05-03 11:57:24','2025-05-03 11:57:24','038b7e4d-1d1d-41b8-a64c-e14e9cf4d35e'),(3,3,1,1,'porters/{slug}','porters/_entry.twig',1,'2025-05-03 11:59:26','2025-05-03 11:59:26','3f74fee0-b21f-4f3a-9451-7dbbfd283ebf'),(4,4,1,1,'supervisors/{slug}','supervisors/_entry.twig',1,'2025-05-03 12:21:43','2025-05-03 12:21:43','5903f5e0-4a91-47f3-8b92-081c6f3de3b3');
/*!40000 ALTER TABLE `sections_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sequences`
--

LOCK TABLES `sequences` WRITE;
/*!40000 ALTER TABLE `sequences` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sequences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `shunnedmessages`
--

LOCK TABLES `shunnedmessages` WRITE;
/*!40000 ALTER TABLE `shunnedmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `shunnedmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sitegroups`
--

LOCK TABLES `sitegroups` WRITE;
/*!40000 ALTER TABLE `sitegroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sitegroups` VALUES (1,'Porter Craft','2025-05-03 11:51:41','2025-05-03 11:51:41',NULL,'ebb3dbd8-552b-48fb-aebb-0c13143be157');
/*!40000 ALTER TABLE `sitegroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sites` VALUES (1,1,1,'true','Porter Craft','default','en-GB',1,'$PRIMARY_SITE_URL',1,'2025-05-03 11:51:41','2025-05-03 11:51:41',NULL,'6a92aa12-7350-4d77-a9af-a478cee25845');
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sso_identities`
--

LOCK TABLES `sso_identities` WRITE;
/*!40000 ALTER TABLE `sso_identities` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sso_identities` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structureelements`
--

LOCK TABLES `structureelements` WRITE;
/*!40000 ALTER TABLE `structureelements` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `structureelements` VALUES (1,1,NULL,1,1,8,0,'2025-05-03 12:06:43','2025-05-03 12:17:57','65347286-eb29-4cdd-b2fe-2356b4d177af'),(2,1,2,1,2,3,1,'2025-05-03 12:06:43','2025-05-03 12:06:43','c6dc4784-cf3f-417f-a02b-c8006f760e72'),(3,1,3,1,4,5,1,'2025-05-03 12:07:02','2025-05-03 12:07:02','aa59e3ba-2e1c-4a17-abe0-8641f148b62e'),(4,1,4,1,6,7,1,'2025-05-03 12:17:57','2025-05-03 12:17:57','ed5428a6-ed89-46a5-a70d-6a22d0ef1189');
/*!40000 ALTER TABLE `structureelements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structures`
--

LOCK TABLES `structures` WRITE;
/*!40000 ALTER TABLE `structures` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `structures` VALUES (1,1,'2025-05-03 11:59:26','2025-05-03 11:59:26',NULL,'a210ba69-a5b6-41ee-85e4-be3c257b2891');
/*!40000 ALTER TABLE `structures` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `systemmessages`
--

LOCK TABLES `systemmessages` WRITE;
/*!40000 ALTER TABLE `systemmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `systemmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `taggroups`
--

LOCK TABLES `taggroups` WRITE;
/*!40000 ALTER TABLE `taggroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `taggroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups`
--

LOCK TABLES `usergroups` WRITE;
/*!40000 ALTER TABLE `usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups_users`
--

LOCK TABLES `usergroups_users` WRITE;
/*!40000 ALTER TABLE `usergroups_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `usergroups_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions`
--

LOCK TABLES `userpermissions` WRITE;
/*!40000 ALTER TABLE `userpermissions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_usergroups`
--

LOCK TABLES `userpermissions_usergroups` WRITE;
/*!40000 ALTER TABLE `userpermissions_usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions_usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_users`
--

LOCK TABLES `userpermissions_users` WRITE;
/*!40000 ALTER TABLE `userpermissions_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpreferences`
--

LOCK TABLES `userpreferences` WRITE;
/*!40000 ALTER TABLE `userpreferences` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `userpreferences` VALUES (1,'{\"locale\": null, \"language\": \"en-GB\", \"useShapes\": false, \"weekStartDay\": \"1\", \"underlineLinks\": false, \"disableAutofocus\": \"\", \"profileTemplates\": false, \"showFieldHandles\": true, \"showExceptionView\": false, \"notificationDuration\": \"5000\", \"enableDebugToolbarForCp\": false, \"enableDebugToolbarForSite\": false}');
/*!40000 ALTER TABLE `userpreferences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `users` VALUES (1,NULL,NULL,1,0,0,0,1,'admin',NULL,NULL,NULL,'access@hypha.media','$2y$13$k/yD7LQoJqt9FTuV4BuHFe4zCcoHjGFK7g2nt.zfWynKpBIPTCtGO','2025-05-03 11:54:04',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'2025-05-03 11:51:41','2025-05-03 11:51:41','2025-05-03 11:54:04');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumefolders`
--

LOCK TABLES `volumefolders` WRITE;
/*!40000 ALTER TABLE `volumefolders` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `volumefolders` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumes`
--

LOCK TABLES `volumes` WRITE;
/*!40000 ALTER TABLE `volumes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `volumes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `webauthn`
--

LOCK TABLES `webauthn` WRITE;
/*!40000 ALTER TABLE `webauthn` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `webauthn` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `widgets` VALUES (1,1,'craft\\widgets\\RecentEntries',1,NULL,'{\"limit\": 10, \"siteId\": 1, \"section\": \"*\"}',1,'2025-05-03 11:54:04','2025-05-03 11:54:04','cf1a6fb8-68b5-477f-8ffb-e882d1fe8f63'),(2,1,'craft\\widgets\\CraftSupport',2,NULL,'[]',1,'2025-05-03 11:54:04','2025-05-03 11:54:04','bba53ab7-644a-47d3-b109-9a9be992b902'),(3,1,'craft\\widgets\\Updates',3,NULL,'[]',1,'2025-05-03 11:54:04','2025-05-03 11:54:04','bed1a7b6-460a-4470-89ef-38841513ec87'),(4,1,'craft\\widgets\\Feed',4,NULL,'{\"url\": \"https://craftcms.com/news.rss\", \"limit\": 5, \"title\": \"Craft News\"}',1,'2025-05-03 11:54:04','2025-05-03 11:54:04','1e864965-4229-4d49-aa04-8414d75a65ca');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping routines for database 'db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-03 13:37:06
