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
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=250 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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

-- Dump completed on 2025-05-04 17:30:32
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
INSERT INTO `changedattributes` VALUES (4,1,'slug','2025-05-03 12:19:42',0,1),(23,1,'postDate','2025-05-03 14:23:15',0,1),(23,1,'slug','2025-05-03 14:22:43',0,1),(23,1,'title','2025-05-03 14:22:43',0,1),(23,1,'uri','2025-05-03 14:22:43',0,1),(24,1,'postDate','2025-05-03 14:22:20',0,1),(24,1,'slug','2025-05-03 14:22:48',0,1),(24,1,'status','2025-05-03 14:22:20',0,1),(24,1,'title','2025-05-03 14:22:50',0,1),(25,1,'postDate','2025-05-03 14:22:51',0,1),(25,1,'slug','2025-05-03 14:23:01',0,1),(25,1,'status','2025-05-03 14:22:51',0,1),(25,1,'title','2025-05-03 14:23:01',0,1),(26,1,'postDate','2025-05-03 14:23:05',0,1),(26,1,'slug','2025-05-03 14:23:08',0,1),(26,1,'status','2025-05-03 14:23:05',0,1),(26,1,'title','2025-05-03 14:23:08',0,1),(31,1,'postDate','2025-05-03 14:29:42',0,1),(31,1,'slug','2025-05-03 14:29:41',0,1),(31,1,'title','2025-05-03 14:29:41',0,1),(31,1,'uri','2025-05-03 14:29:41',0,1),(37,1,'postDate','2025-05-03 14:39:07',0,1),(37,1,'slug','2025-05-03 14:38:48',0,1),(37,1,'title','2025-05-03 14:38:48',0,1),(37,1,'uri','2025-05-03 14:38:48',0,1),(39,1,'postDate','2025-05-03 14:39:50',0,1),(39,1,'slug','2025-05-03 14:39:29',0,1),(39,1,'title','2025-05-03 14:39:29',0,1),(39,1,'uri','2025-05-03 14:39:29',0,1),(42,1,'postDate','2025-05-04 14:11:46',0,1),(42,1,'status','2025-05-04 14:11:46',0,1),(42,1,'title','2025-05-04 14:11:47',0,1),(43,1,'postDate','2025-05-04 14:11:47',0,1),(43,1,'status','2025-05-04 14:11:47',0,1),(43,1,'title','2025-05-04 14:11:47',0,1),(45,1,'postDate','2025-05-04 14:12:28',0,1),(45,1,'slug','2025-05-04 14:12:28',0,1),(45,1,'title','2025-05-04 14:12:28',0,1),(45,1,'uri','2025-05-04 14:12:28',0,1),(47,1,'postDate','2025-05-04 14:13:23',0,1),(47,1,'slug','2025-05-04 14:13:23',0,1),(47,1,'title','2025-05-04 14:13:23',0,1),(47,1,'uri','2025-05-04 14:13:23',0,1),(49,1,'postDate','2025-05-04 14:13:28',0,1),(49,1,'slug','2025-05-04 14:13:28',0,1),(49,1,'title','2025-05-04 14:13:34',0,1),(49,1,'uri','2025-05-04 14:13:28',0,1),(52,1,'postDate','2025-05-04 14:13:53',0,1),(52,1,'slug','2025-05-04 14:13:53',0,1),(52,1,'title','2025-05-04 14:13:53',0,1),(52,1,'uri','2025-05-04 14:13:53',0,1),(54,1,'postDate','2025-05-04 14:14:05',0,1),(54,1,'slug','2025-05-04 14:14:05',0,1),(54,1,'title','2025-05-04 14:14:05',0,1),(54,1,'uri','2025-05-04 14:14:05',0,1),(56,1,'postDate','2025-05-04 14:14:37',0,1),(56,1,'slug','2025-05-04 14:14:37',0,1),(56,1,'title','2025-05-04 14:14:37',0,1),(56,1,'uri','2025-05-04 14:14:37',0,1),(58,1,'postDate','2025-05-04 14:14:46',0,1),(58,1,'slug','2025-05-04 14:14:46',0,1),(58,1,'title','2025-05-04 14:14:46',0,1),(58,1,'uri','2025-05-04 14:14:46',0,1),(60,1,'postDate','2025-05-04 14:24:47',0,1),(60,1,'slug','2025-05-04 14:24:47',0,1),(60,1,'title','2025-05-04 14:24:47',0,1),(60,1,'uri','2025-05-04 14:24:47',0,1),(62,1,'postDate','2025-05-04 14:25:00',0,1),(62,1,'slug','2025-05-04 14:25:00',0,1),(62,1,'title','2025-05-04 14:25:00',0,1),(62,1,'uri','2025-05-04 14:25:00',0,1),(64,1,'postDate','2025-05-04 14:25:06',0,1),(64,1,'slug','2025-05-04 14:25:06',0,1),(64,1,'title','2025-05-04 14:25:06',0,1),(64,1,'uri','2025-05-04 14:25:06',0,1),(66,1,'postDate','2025-05-04 14:25:31',0,1),(66,1,'slug','2025-05-04 14:25:28',0,1),(66,1,'title','2025-05-04 14:25:28',0,1),(66,1,'uri','2025-05-04 14:25:28',0,1),(68,1,'postDate','2025-05-04 14:25:38',0,1),(68,1,'slug','2025-05-04 14:25:38',0,1),(68,1,'title','2025-05-04 14:25:38',0,1),(68,1,'uri','2025-05-04 14:25:38',0,1),(88,1,'postDate','2025-05-04 15:36:25',0,1),(88,1,'slug','2025-05-04 15:36:24',0,1),(88,1,'title','2025-05-04 15:36:24',0,1),(88,1,'uri','2025-05-04 15:36:24',0,1),(90,1,'postDate','2025-05-04 15:36:33',0,1),(90,1,'slug','2025-05-04 15:36:33',0,1),(90,1,'title','2025-05-04 15:36:33',0,1),(90,1,'uri','2025-05-04 15:36:33',0,1),(92,1,'postDate','2025-05-04 15:36:44',0,1),(92,1,'slug','2025-05-04 15:36:43',0,1),(92,1,'title','2025-05-04 15:36:43',0,1),(92,1,'uri','2025-05-04 15:36:43',0,1),(94,1,'postDate','2025-05-04 15:36:50',0,1),(94,1,'slug','2025-05-04 15:36:50',0,1),(94,1,'title','2025-05-04 15:36:50',0,1),(94,1,'uri','2025-05-04 15:36:50',0,1),(96,1,'postDate','2025-05-04 15:36:57',0,1),(96,1,'slug','2025-05-04 15:36:57',0,1),(96,1,'title','2025-05-04 15:36:57',0,1),(96,1,'uri','2025-05-04 15:36:57',0,1),(98,1,'postDate','2025-05-04 15:37:04',0,1),(98,1,'slug','2025-05-04 15:37:04',0,1),(98,1,'title','2025-05-04 15:37:04',0,1),(98,1,'uri','2025-05-04 15:37:04',0,1),(100,1,'postDate','2025-05-04 15:37:11',0,1),(100,1,'slug','2025-05-04 15:37:11',0,1),(100,1,'title','2025-05-04 15:37:11',0,1),(100,1,'uri','2025-05-04 15:37:11',0,1),(102,1,'postDate','2025-05-04 15:37:19',0,1),(102,1,'slug','2025-05-04 15:37:19',0,1),(102,1,'title','2025-05-04 15:37:26',0,1),(102,1,'uri','2025-05-04 15:37:19',0,1),(106,1,'postDate','2025-05-04 15:37:43',0,1),(106,1,'slug','2025-05-04 15:37:41',0,1),(106,1,'title','2025-05-04 15:37:41',0,1),(106,1,'uri','2025-05-04 15:37:41',0,1),(108,1,'postDate','2025-05-04 15:37:51',0,1),(108,1,'slug','2025-05-04 15:37:51',0,1),(108,1,'title','2025-05-04 15:37:51',0,1),(108,1,'uri','2025-05-04 15:37:51',0,1),(110,1,'postDate','2025-05-04 15:38:02',0,1),(110,1,'slug','2025-05-04 15:38:02',0,1),(110,1,'title','2025-05-04 15:38:02',0,1),(110,1,'uri','2025-05-04 15:38:02',0,1),(112,1,'postDate','2025-05-04 15:38:09',0,1),(112,1,'slug','2025-05-04 15:38:09',0,1),(112,1,'title','2025-05-04 15:38:09',0,1),(112,1,'uri','2025-05-04 15:38:09',0,1);
/*!40000 ALTER TABLE `changedattributes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedfields`
--

LOCK TABLES `changedfields` WRITE;
/*!40000 ALTER TABLE `changedfields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `changedfields` VALUES (23,1,4,'a6604d2f-7828-4a76-a6ae-e168d866c08a','2025-05-03 14:23:08',0,1),(23,1,6,'76ea19c6-28d9-4b14-94f5-3ab7c2a8c91a','2025-05-04 14:12:14',0,1),(33,1,5,'8d09367d-1648-4d83-a9eb-d760a064854d','2025-05-03 14:32:10',0,1),(37,1,6,'76ea19c6-28d9-4b14-94f5-3ab7c2a8c91a','2025-05-03 14:39:06',0,1),(39,1,6,'76ea19c6-28d9-4b14-94f5-3ab7c2a8c91a','2025-05-03 14:39:48',0,1),(42,1,6,'76ea19c6-28d9-4b14-94f5-3ab7c2a8c91a','2025-05-04 14:11:47',0,1),(43,1,6,'76ea19c6-28d9-4b14-94f5-3ab7c2a8c91a','2025-05-04 14:11:47',0,1);
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
INSERT INTO `drafts` VALUES (1,NULL,1,0,'First draft',NULL,0,NULL,1),(2,NULL,1,0,'First draft',NULL,0,NULL,1),(9,31,1,1,'Draft 1','',1,NULL,1),(10,NULL,1,0,'First draft',NULL,0,NULL,0);
/*!40000 ALTER TABLE `drafts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elementactivity`
--

LOCK TABLES `elementactivity` WRITE;
/*!40000 ALTER TABLE `elementactivity` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elementactivity` VALUES (4,1,1,NULL,'edit','2025-05-03 12:19:39'),(4,1,1,NULL,'save','2025-05-03 12:19:42'),(23,1,1,NULL,'edit','2025-05-04 14:11:47'),(23,1,1,NULL,'save','2025-05-04 14:12:14'),(31,1,1,NULL,'edit','2025-05-03 14:32:13'),(31,1,1,NULL,'save','2025-05-03 14:29:42'),(37,1,1,NULL,'save','2025-05-03 14:39:07'),(39,1,1,NULL,'save','2025-05-03 14:39:50'),(45,1,1,NULL,'save','2025-05-04 14:12:28'),(47,1,1,NULL,'save','2025-05-04 14:13:23'),(49,1,1,NULL,'save','2025-05-04 14:13:34'),(52,1,1,NULL,'save','2025-05-04 14:13:53'),(54,1,1,NULL,'save','2025-05-04 14:14:05'),(56,1,1,NULL,'save','2025-05-04 14:14:37'),(58,1,1,NULL,'save','2025-05-04 14:14:46'),(60,1,1,NULL,'save','2025-05-04 14:24:47'),(62,1,1,NULL,'save','2025-05-04 14:25:00'),(64,1,1,NULL,'save','2025-05-04 14:25:06'),(66,1,1,NULL,'save','2025-05-04 14:25:31'),(68,1,1,NULL,'save','2025-05-04 14:25:38'),(88,1,1,NULL,'save','2025-05-04 15:36:25'),(90,1,1,NULL,'save','2025-05-04 15:36:33'),(92,1,1,NULL,'save','2025-05-04 15:36:44'),(94,1,1,NULL,'save','2025-05-04 15:36:50'),(96,1,1,NULL,'save','2025-05-04 15:36:57'),(98,1,1,NULL,'save','2025-05-04 15:37:04'),(100,1,1,NULL,'save','2025-05-04 15:37:11'),(102,1,1,NULL,'edit','2025-05-04 15:37:25'),(102,1,1,NULL,'save','2025-05-04 15:37:26'),(106,1,1,NULL,'save','2025-05-04 15:37:43'),(108,1,1,NULL,'save','2025-05-04 15:37:51'),(110,1,1,NULL,'save','2025-05-04 15:38:02'),(112,1,1,NULL,'save','2025-05-04 15:38:09');
/*!40000 ALTER TABLE `elementactivity` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements` VALUES (1,NULL,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2025-05-03 11:51:41','2025-05-03 11:51:41',NULL,NULL,NULL,'9d4c15fe-4385-4d92-9aac-2e1bf90ba79e'),(2,NULL,1,NULL,3,'craft\\elements\\Entry',1,0,'2025-05-03 12:06:43','2025-05-03 12:06:43',NULL,NULL,NULL,'c9b73470-01e7-48cf-9af5-eb95d219793c'),(3,NULL,2,NULL,3,'craft\\elements\\Entry',1,0,'2025-05-03 12:07:02','2025-05-03 12:07:02',NULL,NULL,NULL,'6f5ddcc5-d100-4e7b-8844-d3196ec11868'),(4,NULL,NULL,NULL,3,'craft\\elements\\Entry',1,0,'2025-05-03 12:17:57','2025-05-03 12:19:42',NULL,NULL,NULL,'315f59bd-e0e2-48ac-8f10-556355974cf6'),(5,4,NULL,1,3,'craft\\elements\\Entry',1,0,'2025-05-03 12:17:57','2025-05-03 12:17:57',NULL,NULL,NULL,'049a0202-091e-4b8e-bbfc-8e3caaddab3c'),(6,4,NULL,2,3,'craft\\elements\\Entry',1,0,'2025-05-03 12:19:02','2025-05-03 12:19:02',NULL,NULL,NULL,'dc4732ef-a43b-4677-bf62-235805ba9aad'),(8,4,NULL,3,3,'craft\\elements\\Entry',1,0,'2025-05-03 12:19:42','2025-05-03 12:19:42',NULL,NULL,NULL,'285301aa-20ac-4994-84c0-5799d25d707d'),(9,NULL,NULL,NULL,4,'craft\\elements\\Entry',1,0,'2025-05-03 12:29:52','2025-05-03 12:29:52',NULL,NULL,NULL,'90ce8160-cd64-42cf-9088-7ea8558da040'),(10,9,NULL,4,4,'craft\\elements\\Entry',1,0,'2025-05-03 12:29:52','2025-05-03 12:29:52',NULL,NULL,NULL,'79c1e2ea-0627-4573-8cdd-9407a13bfa55'),(11,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2025-05-03 13:02:53','2025-05-03 13:02:53',NULL,NULL,NULL,'9c2ae53a-0117-4b99-bc7c-4a3949acf9c7'),(12,11,NULL,5,1,'craft\\elements\\Entry',1,0,'2025-05-03 13:02:53','2025-05-03 13:02:53',NULL,NULL,NULL,'1b50ff8a-ad1e-48fe-8e75-3016747a8d10'),(13,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2025-05-03 13:07:20','2025-05-03 13:07:20',NULL,NULL,NULL,'e4f6557b-c01a-4bf3-926d-b2f821ad6234'),(14,13,NULL,6,1,'craft\\elements\\Entry',1,0,'2025-05-03 13:07:20','2025-05-03 13:07:20',NULL,NULL,NULL,'517efa76-8d97-41a5-b81b-ddab75bbe7c5'),(15,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2025-05-03 13:08:52','2025-05-03 13:08:52',NULL,'2025-05-04 14:22:46',NULL,'24923974-41aa-410d-9c50-40fd873aeb4a'),(16,15,NULL,7,2,'craft\\elements\\Entry',1,0,'2025-05-03 13:08:52','2025-05-03 13:08:52',NULL,NULL,NULL,'b6bdd2ab-0ef5-46a1-9c5f-e807a6901b42'),(17,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2025-05-03 13:09:09','2025-05-03 13:09:09',NULL,'2025-05-04 14:22:46',NULL,'a3de55ff-0c47-4794-93f7-0b44b5967901'),(18,17,NULL,8,2,'craft\\elements\\Entry',1,0,'2025-05-03 13:09:09','2025-05-03 13:09:09',NULL,NULL,NULL,'da957c80-4b35-44a4-a635-437eef8b37c2'),(19,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2025-05-03 13:26:18','2025-05-03 13:26:36',NULL,'2025-05-03 13:26:36',NULL,'78a94ff6-75b2-4a34-9ce2-94bc38126be1'),(20,19,NULL,9,1,'craft\\elements\\Entry',1,0,'2025-05-03 13:26:18','2025-05-03 13:26:18',NULL,'2025-05-03 13:26:36',NULL,'bc767472-10b7-44ae-824f-f7c9dd37806a'),(21,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2025-05-03 14:04:55','2025-05-03 14:04:55',NULL,NULL,NULL,'5ff1d20b-b3a9-497d-8543-7fc52421731a'),(22,21,NULL,10,1,'craft\\elements\\Entry',1,0,'2025-05-03 14:04:55','2025-05-03 14:04:55',NULL,NULL,NULL,'3279c1e0-ba43-4382-9000-e8b7a2076cad'),(23,NULL,NULL,NULL,6,'craft\\elements\\Entry',1,0,'2025-05-03 14:22:12','2025-05-04 14:12:14',NULL,'2025-05-04 14:23:58',NULL,'c166fd96-14fa-4bb3-8e67-426560b22624'),(24,NULL,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2025-05-03 14:22:20','2025-05-03 14:23:08',NULL,'2025-05-03 14:37:12',NULL,'d5f4bd9c-edbe-4ab8-a68b-860d639c0adc'),(25,NULL,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2025-05-03 14:22:51','2025-05-03 14:23:08',NULL,'2025-05-03 14:37:12',NULL,'81e7e465-9111-4c92-94e5-7c249d2b0f68'),(26,NULL,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2025-05-03 14:23:05','2025-05-03 14:23:08',NULL,'2025-05-03 14:37:12',NULL,'fad49e27-1a61-408a-9340-6a11909f0794'),(27,23,NULL,11,6,'craft\\elements\\Entry',1,0,'2025-05-03 14:23:15','2025-05-03 14:23:15',NULL,NULL,NULL,'b2e8646b-66d0-473f-8768-bd65f6881e9e'),(28,24,NULL,12,5,'craft\\elements\\Entry',1,0,'2025-05-03 14:23:08','2025-05-03 14:23:15',NULL,NULL,NULL,'f229bb8c-2136-4b71-9f22-5830197f5798'),(29,25,NULL,13,5,'craft\\elements\\Entry',1,0,'2025-05-03 14:23:08','2025-05-03 14:23:15',NULL,NULL,NULL,'fbd46002-43b4-4483-8a1b-a24adbc66663'),(30,26,NULL,14,5,'craft\\elements\\Entry',1,0,'2025-05-03 14:23:08','2025-05-03 14:23:15',NULL,NULL,NULL,'f83152b1-0969-4c84-b7b5-4bf3ed3f4e20'),(31,NULL,NULL,NULL,7,'craft\\elements\\Entry',1,0,'2025-05-03 14:29:26','2025-05-03 14:29:42',NULL,'2025-05-03 14:33:44',NULL,'dde224d1-f628-40c2-9c8f-ac5b275ac1ae'),(32,31,NULL,15,7,'craft\\elements\\Entry',1,0,'2025-05-03 14:29:42','2025-05-03 14:29:42',NULL,NULL,NULL,'9c11ee2f-47f7-438f-beb1-5abbf75110b4'),(33,31,9,NULL,7,'craft\\elements\\Entry',1,0,'2025-05-03 14:32:10','2025-05-03 14:32:13',NULL,NULL,NULL,'1811cd42-6bc4-42c5-a169-723a32e14255'),(34,NULL,10,NULL,8,'craft\\elements\\Entry',1,0,'2025-05-03 14:32:10','2025-05-03 14:32:10',NULL,'2025-05-03 14:33:57',NULL,'f72fc586-7197-4f3b-b57f-5caa05287f89'),(36,23,NULL,16,6,'craft\\elements\\Entry',1,0,'2025-05-03 14:36:59','2025-05-03 14:37:00',NULL,NULL,NULL,'4e15e460-2fca-41eb-aaf7-71b9c21e916a'),(37,NULL,NULL,NULL,6,'craft\\elements\\Entry',1,0,'2025-05-03 14:38:44','2025-05-03 14:39:07',NULL,'2025-05-04 14:23:58',NULL,'f6143c8b-5e4f-4224-9c73-6ccf2f02bb58'),(38,37,NULL,17,6,'craft\\elements\\Entry',1,0,'2025-05-03 14:39:07','2025-05-03 14:39:07',NULL,NULL,NULL,'e7e69f54-e2c4-4be9-a2a2-589fe51e85dc'),(39,NULL,NULL,NULL,6,'craft\\elements\\Entry',1,0,'2025-05-03 14:39:22','2025-05-03 14:39:50',NULL,'2025-05-04 14:23:58',NULL,'3097f446-7bc6-4ae9-bd99-37b4320f0e76'),(40,39,NULL,18,6,'craft\\elements\\Entry',1,0,'2025-05-03 14:39:50','2025-05-03 14:39:50',NULL,NULL,NULL,'35e1bef2-478e-4e22-b36a-a8cce70fe282'),(42,NULL,NULL,NULL,6,'craft\\elements\\Entry',1,0,'2025-05-04 14:09:34','2025-05-04 14:11:47',NULL,NULL,NULL,'ce6ca66d-8e22-4240-b728-b8c81db441d9'),(43,NULL,NULL,NULL,6,'craft\\elements\\Entry',1,0,'2025-05-04 14:11:47','2025-05-04 14:11:47',NULL,'2025-05-04 14:23:58',NULL,'5a87a57e-c0bd-49a7-a85f-dc86337232a8'),(44,23,NULL,19,6,'craft\\elements\\Entry',1,0,'2025-05-04 14:12:14','2025-05-04 14:12:14',NULL,NULL,NULL,'1b9671ce-2a22-49bb-91dd-1fd80818529d'),(45,NULL,NULL,NULL,6,'craft\\elements\\Entry',1,0,'2025-05-04 14:12:23','2025-05-04 14:12:28',NULL,'2025-05-04 14:23:58',NULL,'25d1ea17-e07d-4b72-86aa-bd648ea0486d'),(46,45,NULL,20,6,'craft\\elements\\Entry',1,0,'2025-05-04 14:12:28','2025-05-04 14:12:28',NULL,NULL,NULL,'986f8754-aba9-4a1f-830a-6ac95b618157'),(47,NULL,NULL,NULL,6,'craft\\elements\\Entry',1,0,'2025-05-04 14:13:15','2025-05-04 14:13:23',NULL,'2025-05-04 14:23:58',NULL,'8b8fd31c-a4ec-435b-b337-e9540bf60ced'),(48,47,NULL,21,6,'craft\\elements\\Entry',1,0,'2025-05-04 14:13:23','2025-05-04 14:13:23',NULL,NULL,NULL,'42ea33d1-107d-4d44-a9e7-ff8bd181113d'),(49,NULL,NULL,NULL,6,'craft\\elements\\Entry',1,0,'2025-05-04 14:13:25','2025-05-04 14:13:34',NULL,'2025-05-04 14:23:58',NULL,'edc55f38-972f-42dc-b602-3484afdd4b11'),(50,49,NULL,22,6,'craft\\elements\\Entry',1,0,'2025-05-04 14:13:28','2025-05-04 14:13:28',NULL,NULL,NULL,'b0ce7238-1678-40d5-945a-c640ae3355f6'),(51,49,NULL,23,6,'craft\\elements\\Entry',1,0,'2025-05-04 14:13:34','2025-05-04 14:13:34',NULL,NULL,NULL,'9e9bb8aa-1e12-48db-af86-fdeb1f7ee70e'),(52,NULL,NULL,NULL,6,'craft\\elements\\Entry',1,0,'2025-05-04 14:13:49','2025-05-04 14:13:53',NULL,'2025-05-04 14:23:58',NULL,'cb96283f-301a-4dc7-b700-a10f613ef34a'),(53,52,NULL,24,6,'craft\\elements\\Entry',1,0,'2025-05-04 14:13:53','2025-05-04 14:13:53',NULL,NULL,NULL,'5eacabf1-8d7f-4d52-aa60-44e15dd7f75f'),(54,NULL,NULL,NULL,6,'craft\\elements\\Entry',1,0,'2025-05-04 14:14:01','2025-05-04 14:14:05',NULL,'2025-05-04 14:23:58',NULL,'39e05b7c-beae-49e9-b769-68289cf61666'),(55,54,NULL,25,6,'craft\\elements\\Entry',1,0,'2025-05-04 14:14:05','2025-05-04 14:14:05',NULL,NULL,NULL,'c3d94d30-36e4-45df-9596-cd51cc2e758b'),(56,NULL,NULL,NULL,6,'craft\\elements\\Entry',1,0,'2025-05-04 14:14:30','2025-05-04 14:14:37',NULL,'2025-05-04 14:23:58',NULL,'f7e10e64-e25f-41b6-95f5-3ba365eb5168'),(57,56,NULL,26,6,'craft\\elements\\Entry',1,0,'2025-05-04 14:14:37','2025-05-04 14:14:37',NULL,NULL,NULL,'934f6d80-9d57-409b-b644-f418d672c343'),(58,NULL,NULL,NULL,6,'craft\\elements\\Entry',1,0,'2025-05-04 14:14:40','2025-05-04 14:14:46',NULL,'2025-05-04 14:23:58',NULL,'00cfff01-4a26-464d-880d-77ed46e5f9d0'),(59,58,NULL,27,6,'craft\\elements\\Entry',1,0,'2025-05-04 14:14:46','2025-05-04 14:14:46',NULL,NULL,NULL,'ab91afd0-66fa-4ece-a1b8-f09d753555c0'),(60,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2025-05-04 14:24:43','2025-05-04 14:24:47',NULL,NULL,NULL,'c0100ab8-9e9f-46d4-9c60-a1e0810bf40b'),(61,60,NULL,28,1,'craft\\elements\\Entry',1,0,'2025-05-04 14:24:47','2025-05-04 14:24:47',NULL,NULL,NULL,'9a3073d1-5d90-408f-9ccd-72877f738066'),(62,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2025-05-04 14:24:49','2025-05-04 14:25:00',NULL,NULL,NULL,'e75b2dae-ebed-49c0-8f5e-2b05a52de754'),(63,62,NULL,29,1,'craft\\elements\\Entry',1,0,'2025-05-04 14:25:00','2025-05-04 14:25:00',NULL,NULL,NULL,'fe168086-5aea-4a48-b937-1c4371ea3820'),(64,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2025-05-04 14:25:02','2025-05-04 14:25:06',NULL,NULL,NULL,'f4375302-bc90-4019-8e45-c15bf09ee5fc'),(65,64,NULL,30,1,'craft\\elements\\Entry',1,0,'2025-05-04 14:25:06','2025-05-04 14:25:06',NULL,NULL,NULL,'fdfcd33c-8609-41ed-a944-98a7878e14d3'),(66,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2025-05-04 14:25:11','2025-05-04 14:25:31',NULL,NULL,NULL,'a777af1a-4d9a-4577-b6a7-d32e81c9f112'),(67,66,NULL,31,1,'craft\\elements\\Entry',1,0,'2025-05-04 14:25:31','2025-05-04 14:25:31',NULL,NULL,NULL,'b9d7f67c-b063-4b64-97ec-196e4aac3ecf'),(68,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2025-05-04 14:25:33','2025-05-04 14:25:38',NULL,NULL,NULL,'de7c5b4c-dea5-45b3-87a8-2dffed81e243'),(69,68,NULL,32,1,'craft\\elements\\Entry',1,0,'2025-05-04 14:25:38','2025-05-04 14:25:38',NULL,NULL,NULL,'91312ba9-af89-421b-ae42-b33374dd23da'),(70,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2025-05-04 14:43:46','2025-05-04 15:25:57',NULL,'2025-05-04 15:25:57',NULL,'e809d404-2011-4943-ac2c-1594433bdc5c'),(71,70,NULL,33,1,'craft\\elements\\Entry',1,0,'2025-05-04 14:43:46','2025-05-04 14:43:46',NULL,'2025-05-04 15:25:57',NULL,'9bf5f55e-c588-443c-b186-18a3502e339b'),(72,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2025-05-04 14:52:18','2025-05-04 15:25:57',NULL,'2025-05-04 15:25:57',NULL,'6b75a40b-5a4f-418b-80ae-ce5b5a4f6bb1'),(73,72,NULL,34,1,'craft\\elements\\Entry',1,0,'2025-05-04 14:52:18','2025-05-04 14:52:18',NULL,'2025-05-04 15:25:57',NULL,'653fc77e-f2da-403a-b228-69c97939c49c'),(74,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2025-05-04 15:15:21','2025-05-04 15:25:57',NULL,'2025-05-04 15:25:57',NULL,'021463f5-9de9-417f-90be-26ac19ade28d'),(75,74,NULL,35,1,'craft\\elements\\Entry',1,0,'2025-05-04 15:15:21','2025-05-04 15:15:21',NULL,'2025-05-04 15:25:57',NULL,'b730fbb6-0da3-4f2b-bc22-844daa3c313e'),(76,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2025-05-04 15:25:20','2025-05-04 15:25:57',NULL,'2025-05-04 15:25:57',NULL,'3b7c99a6-e23b-46ee-a8e2-cfe76baf9e94'),(77,76,NULL,36,1,'craft\\elements\\Entry',1,0,'2025-05-04 15:25:20','2025-05-04 15:25:21',NULL,'2025-05-04 15:25:57',NULL,'c3686b1e-331d-4613-b19b-31561070e2e0'),(78,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2025-05-04 15:28:45','2025-05-04 15:28:45',NULL,NULL,NULL,'0083efc5-28b3-47f8-b17a-cc9de177bba5'),(79,78,NULL,37,1,'craft\\elements\\Entry',1,0,'2025-05-04 15:28:45','2025-05-04 15:28:45',NULL,NULL,NULL,'c62d303c-88e8-4905-b38c-b290f63463aa'),(80,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2025-05-04 15:31:42','2025-05-04 15:31:42',NULL,NULL,NULL,'a52ce5b5-42b5-4364-af86-a660a5456229'),(81,80,NULL,38,1,'craft\\elements\\Entry',1,0,'2025-05-04 15:31:42','2025-05-04 15:31:42',NULL,NULL,NULL,'f0ba27ec-fddb-49fd-86d2-c130cf35bc1a'),(82,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2025-05-04 15:32:45','2025-05-04 15:32:45',NULL,NULL,NULL,'b0fc269d-da9a-4d38-8ee5-46416ba52a08'),(83,82,NULL,39,1,'craft\\elements\\Entry',1,0,'2025-05-04 15:32:45','2025-05-04 15:32:45',NULL,NULL,NULL,'fa41ba5e-7a9b-4284-9ead-70d93b744608'),(84,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2025-05-04 15:33:17','2025-05-04 15:33:17',NULL,NULL,NULL,'1b468589-16e9-431e-8ed2-b94c35ddce77'),(85,84,NULL,40,1,'craft\\elements\\Entry',1,0,'2025-05-04 15:33:17','2025-05-04 15:33:17',NULL,NULL,NULL,'95bea5b6-f384-424e-b9d6-79bc3dca8daa'),(86,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2025-05-04 15:35:41','2025-05-04 15:35:41',NULL,NULL,NULL,'83e493fb-9104-4151-a04c-9c9d73f9cc6d'),(87,86,NULL,41,1,'craft\\elements\\Entry',1,0,'2025-05-04 15:35:41','2025-05-04 15:35:41',NULL,NULL,NULL,'54a6d0b1-2f64-46a1-b2a4-b504bb7ffaa5'),(88,NULL,NULL,NULL,9,'craft\\elements\\Entry',1,0,'2025-05-04 15:36:18','2025-05-04 15:36:25',NULL,NULL,NULL,'ca7206a5-20c3-4d00-9b85-327121f0be83'),(89,88,NULL,42,9,'craft\\elements\\Entry',1,0,'2025-05-04 15:36:25','2025-05-04 15:36:25',NULL,NULL,NULL,'0a4a6367-2df8-47b7-b13b-876a119ae6bf'),(90,NULL,NULL,NULL,9,'craft\\elements\\Entry',1,0,'2025-05-04 15:36:27','2025-05-04 15:36:33',NULL,NULL,NULL,'8e196a23-4a74-4f53-86e5-f177a08968e5'),(91,90,NULL,43,9,'craft\\elements\\Entry',1,0,'2025-05-04 15:36:33','2025-05-04 15:36:33',NULL,NULL,NULL,'fded82fa-4527-4c83-af83-b09b17e1577c'),(92,NULL,NULL,NULL,9,'craft\\elements\\Entry',1,0,'2025-05-04 15:36:37','2025-05-04 15:36:44',NULL,NULL,NULL,'11ac1a3a-50b1-414b-8a34-c5404254171e'),(93,92,NULL,44,9,'craft\\elements\\Entry',1,0,'2025-05-04 15:36:44','2025-05-04 15:36:44',NULL,NULL,NULL,'95079ca3-c268-4e8b-b1a7-6cd60108bcae'),(94,NULL,NULL,NULL,9,'craft\\elements\\Entry',1,0,'2025-05-04 15:36:47','2025-05-04 15:36:50',NULL,NULL,NULL,'17395a78-927a-4861-bf14-db6e8d73864e'),(95,94,NULL,45,9,'craft\\elements\\Entry',1,0,'2025-05-04 15:36:50','2025-05-04 15:36:50',NULL,NULL,NULL,'508ac35d-44c6-49be-8252-b439f88e4789'),(96,NULL,NULL,NULL,9,'craft\\elements\\Entry',1,0,'2025-05-04 15:36:54','2025-05-04 15:36:57',NULL,NULL,NULL,'ddec3dbf-734a-43cd-a62e-721a905daa3b'),(97,96,NULL,46,9,'craft\\elements\\Entry',1,0,'2025-05-04 15:36:57','2025-05-04 15:36:57',NULL,NULL,NULL,'f4c6048d-52a1-43c2-a08b-d6178b9bada8'),(98,NULL,NULL,NULL,9,'craft\\elements\\Entry',1,0,'2025-05-04 15:37:02','2025-05-04 15:37:04',NULL,NULL,NULL,'930309e4-46b5-430a-ab1a-eca919b58a12'),(99,98,NULL,47,9,'craft\\elements\\Entry',1,0,'2025-05-04 15:37:04','2025-05-04 15:37:04',NULL,NULL,NULL,'db8bf754-c2ed-4293-a99d-1b2e63a5946d'),(100,NULL,NULL,NULL,9,'craft\\elements\\Entry',1,0,'2025-05-04 15:37:08','2025-05-04 15:37:11',NULL,NULL,NULL,'5906b355-62a7-49e7-bafa-6d8e855d316f'),(101,100,NULL,48,9,'craft\\elements\\Entry',1,0,'2025-05-04 15:37:11','2025-05-04 15:37:11',NULL,NULL,NULL,'d5f1acb7-eff4-40c7-be0e-26195c494079'),(102,NULL,NULL,NULL,9,'craft\\elements\\Entry',1,0,'2025-05-04 15:37:16','2025-05-04 15:37:26',NULL,NULL,NULL,'53427411-4f58-4eb9-8cba-91c051533bed'),(103,102,NULL,49,9,'craft\\elements\\Entry',1,0,'2025-05-04 15:37:19','2025-05-04 15:37:19',NULL,NULL,NULL,'35a325b7-44e0-4c01-a389-54d0f4d16283'),(105,102,NULL,50,9,'craft\\elements\\Entry',1,0,'2025-05-04 15:37:26','2025-05-04 15:37:26',NULL,NULL,NULL,'4e2110a3-9048-494b-83c7-13ea9dbbd57d'),(106,NULL,NULL,NULL,9,'craft\\elements\\Entry',1,0,'2025-05-04 15:37:36','2025-05-04 15:37:43',NULL,NULL,NULL,'bca4f8f9-47bd-4a5e-bee8-70c58d1cef38'),(107,106,NULL,51,9,'craft\\elements\\Entry',1,0,'2025-05-04 15:37:43','2025-05-04 15:37:43',NULL,NULL,NULL,'b96cc561-190b-4e9f-916f-f2372b268b77'),(108,NULL,NULL,NULL,9,'craft\\elements\\Entry',1,0,'2025-05-04 15:37:44','2025-05-04 15:37:51',NULL,NULL,NULL,'e92e5beb-9fca-4bd6-9859-ec0e06f23d6f'),(109,108,NULL,52,9,'craft\\elements\\Entry',1,0,'2025-05-04 15:37:51','2025-05-04 15:37:51',NULL,NULL,NULL,'e8ceadc8-dbe6-4fec-948c-47164509dbce'),(110,NULL,NULL,NULL,9,'craft\\elements\\Entry',1,0,'2025-05-04 15:37:59','2025-05-04 15:38:02',NULL,NULL,NULL,'ccf781af-e8b8-48dc-aad4-0102170b8fd2'),(111,110,NULL,53,9,'craft\\elements\\Entry',1,0,'2025-05-04 15:38:02','2025-05-04 15:38:02',NULL,NULL,NULL,'baffe7f7-1e87-477d-b0e0-58cd54b41ea4'),(112,NULL,NULL,NULL,9,'craft\\elements\\Entry',1,0,'2025-05-04 15:38:04','2025-05-04 15:38:09',NULL,NULL,NULL,'5ef9a50c-074d-4167-ad0c-c156e668290b'),(113,112,NULL,54,9,'craft\\elements\\Entry',1,0,'2025-05-04 15:38:09','2025-05-04 15:38:09',NULL,NULL,NULL,'ce40e540-9a7e-4871-99dd-4ac5209f5aaa'),(114,NULL,NULL,NULL,12,'craft\\elements\\Entry',1,0,'2025-05-04 15:57:44','2025-05-04 15:57:44',NULL,NULL,NULL,'5b84b37d-697d-4226-9d52-275dee5104d0'),(115,114,NULL,55,12,'craft\\elements\\Entry',1,0,'2025-05-04 15:57:44','2025-05-04 15:57:44',NULL,NULL,NULL,'db1cee2d-85c8-4de8-99c6-1fc5f1d8db39'),(116,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2025-05-04 16:22:01','2025-05-04 16:22:01',NULL,NULL,NULL,'971d9e63-1717-4920-817d-225339705dc2'),(117,116,NULL,56,1,'craft\\elements\\Entry',1,0,'2025-05-04 16:22:01','2025-05-04 16:22:01',NULL,NULL,NULL,'89911be5-b416-466d-b1e8-055fe103824f'),(118,NULL,NULL,NULL,3,'craft\\elements\\Entry',1,0,'2025-05-04 16:29:42','2025-05-04 16:29:42',NULL,NULL,NULL,'4ba9551e-4e53-488c-bc77-21b621b33990'),(119,118,NULL,57,3,'craft\\elements\\Entry',1,0,'2025-05-04 16:29:42','2025-05-04 16:29:42',NULL,NULL,NULL,'ab194acf-0dcf-43a8-99da-2992459a6499'),(120,NULL,NULL,NULL,3,'craft\\elements\\Entry',1,0,'2025-05-04 16:29:50','2025-05-04 16:29:50',NULL,NULL,NULL,'32192bca-1457-4621-a4b4-8145dee77141'),(121,120,NULL,58,3,'craft\\elements\\Entry',1,0,'2025-05-04 16:29:50','2025-05-04 16:29:50',NULL,NULL,NULL,'8d93e0e3-7128-4b90-a622-210ed83574c3'),(122,NULL,NULL,NULL,3,'craft\\elements\\Entry',1,0,'2025-05-04 16:29:56','2025-05-04 16:29:56',NULL,NULL,NULL,'92141985-de40-49ce-b782-23847af4f5ff'),(123,122,NULL,59,3,'craft\\elements\\Entry',1,0,'2025-05-04 16:29:56','2025-05-04 16:29:56',NULL,NULL,NULL,'b1fb1d64-66c7-4f3e-8bb5-86151ac36fcf');
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
INSERT INTO `elements_owners` VALUES (24,23,1),(25,23,2),(26,23,3),(28,27,1),(28,36,1),(29,27,2),(29,36,2),(30,27,3),(30,36,3),(34,33,1),(43,42,1);
/*!40000 ALTER TABLE `elements_owners` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements_sites`
--

LOCK TABLES `elements_sites` WRITE;
/*!40000 ALTER TABLE `elements_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements_sites` VALUES (1,1,1,NULL,NULL,NULL,NULL,1,'2025-05-03 11:51:41','2025-05-03 11:51:41','ab79b39b-c691-4635-a0b4-6046b5ea1a3f'),(2,2,1,NULL,'__temp_pxzlpjnabjikamnwjejvvobpzwmiroonccre','porters/__temp_pxzlpjnabjikamnwjejvvobpzwmiroonccre',NULL,1,'2025-05-03 12:06:43','2025-05-03 12:06:43','54231bbd-c134-480b-9ed3-368f6173464d'),(3,3,1,NULL,'__temp_quwbzqbmymkojerbyjcikwtnqmbjiadkenac','porters/__temp_quwbzqbmymkojerbyjcikwtnqmbjiadkenac',NULL,1,'2025-05-03 12:07:02','2025-05-03 12:07:02','361a6a49-5785-4185-bf67-6a9754a9858b'),(4,4,1,'Porter','porter','porters/porter','{\"009018f1-2b1f-4378-b2a7-c2fbd98e5d5b\": \"One\"}',1,'2025-05-03 12:17:57','2025-05-03 12:18:09','cd850935-95c4-4562-b721-e0dd5f52425b'),(5,5,1,'Porter','porter','porters/porter','{\"009018f1-2b1f-4378-b2a7-c2fbd98e5d5b\": \"One\"}',1,'2025-05-03 12:17:57','2025-05-03 12:17:57','7b0dcdb1-169a-4566-87ff-8cf18526493d'),(6,6,1,'Porter','porter','porters/porter','{\"009018f1-2b1f-4378-b2a7-c2fbd98e5d5b\": \"One\"}',1,'2025-05-03 12:19:02','2025-05-03 12:19:02','bdee4810-af83-4be4-bed5-d2fedce4cfdc'),(8,8,1,'Porter','porter','porters/porter','{\"009018f1-2b1f-4378-b2a7-c2fbd98e5d5b\": \"One\"}',1,'2025-05-03 12:19:42','2025-05-03 12:19:42','f16206bc-50ca-414b-bb40-805b5a931d82'),(9,9,1,'Martin','martin','supervisors/martin','{\"ed5a6c88-1539-4eb5-852a-ea9a60a0a994\": \"Smith\"}',1,'2025-05-03 12:29:52','2025-05-03 12:29:52','cdba97f3-f58f-40fb-ac60-3be768e5ef19'),(10,10,1,'Martin','martin','supervisors/martin','{\"ed5a6c88-1539-4eb5-852a-ea9a60a0a994\": \"Smith\"}',1,'2025-05-03 12:29:52','2025-05-03 12:29:52','0fbca100-e61d-4916-a0f4-8a9c19aa3698'),(11,11,1,'Hartshead','hartshead','buildings/hartshead',NULL,1,'2025-05-03 13:02:53','2025-05-04 14:23:45','31fc368a-92e3-4e85-b4ff-cbc845d1eb75'),(12,12,1,'Hartshead','hartshead','buildings/hartshead','{\"a947f0cd-b5ce-4e3b-b6cf-17b7e3abbbd6\": []}',1,'2025-05-03 13:02:53','2025-05-04 14:21:31','5d6d0b67-401d-4af6-97b7-1c63746e7fff'),(13,13,1,'Charlesworth','charlesworth','buildings/charlesworth',NULL,1,'2025-05-03 13:07:20','2025-05-04 14:23:45','742e14c7-6829-4f4f-a0dd-795ab79a0b5f'),(14,14,1,'Charlesworth','charlesworth','buildings/charlesworth','{\"a947f0cd-b5ce-4e3b-b6cf-17b7e3abbbd6\": []}',1,'2025-05-03 13:07:20','2025-05-04 14:21:31','f1305bc9-df90-4880-a1ea-143fe91355b3'),(15,15,1,'AMU','amu','departments/amu',NULL,1,'2025-05-03 13:08:52','2025-05-03 13:08:52','4254d857-4500-4371-a723-ae75a1703c9e'),(16,16,1,'AMU','amu','departments/amu',NULL,1,'2025-05-03 13:08:52','2025-05-03 13:08:52','1d32e060-44ab-4730-86ab-30ed11386e18'),(17,17,1,'Ward 27','ward-27','departments/ward-27',NULL,1,'2025-05-03 13:09:09','2025-05-03 13:09:09','995897b7-d24a-4a0c-95b3-8739e069fddf'),(18,18,1,'Ward 27','ward-27','departments/ward-27',NULL,1,'2025-05-03 13:09:09','2025-05-03 13:09:09','03de5f67-d446-44f2-8e97-4d304cdac381'),(19,19,1,'Charlesworth','charlesworth-2','buildings/charlesworth-2',NULL,1,'2025-05-03 13:26:18','2025-05-03 13:26:18','3efb4efc-0f7e-4cb2-8eea-7930747a5939'),(20,20,1,'Charlesworth','charlesworth-2','buildings/charlesworth-2',NULL,1,'2025-05-03 13:26:18','2025-05-03 13:26:18','1df48eff-beed-40e5-ae36-658606f8d08c'),(21,21,1,'Ladysmith','ladysmith','buildings/ladysmith',NULL,1,'2025-05-03 14:04:55','2025-05-04 14:23:45','b93f14bb-3f68-4a0a-835c-678e493d3473'),(22,22,1,'Ladysmith','ladysmith','buildings/ladysmith','{\"a947f0cd-b5ce-4e3b-b6cf-17b7e3abbbd6\": [17]}',1,'2025-05-03 14:04:55','2025-05-03 14:04:55','0c6fa5d4-e360-4327-bdea-1e398cd9bebf'),(23,23,1,'Patient Transfer','patient-transfer','task-types/patient-transfer',NULL,1,'2025-05-03 14:22:12','2025-05-04 14:12:14','f881f87c-f222-4e65-80c2-08f5a4103f8e'),(24,24,1,'Wheelchair','wheel',NULL,NULL,1,'2025-05-03 14:22:20','2025-05-03 14:22:50','d29b170f-d2f4-467c-a082-91f809890ef5'),(25,25,1,'Trolly','trolly',NULL,NULL,1,'2025-05-03 14:22:51','2025-05-03 14:23:01','8e913c8a-682d-46b2-843c-f00714f7dda5'),(26,26,1,'Bed','bed',NULL,NULL,1,'2025-05-03 14:23:05','2025-05-03 14:23:08','c54edc1b-5f48-492b-a768-b365a237851a'),(27,27,1,'Patient Transfer','patient-transfer','task-types/patient-transfer',NULL,1,'2025-05-03 14:23:15','2025-05-03 14:23:15','6fd4f94a-810a-439b-b32d-f293c79623a5'),(28,28,1,'Wheelchair','wheel',NULL,NULL,1,'2025-05-03 14:23:15','2025-05-03 14:23:15','49ac30d4-e64d-42eb-9b30-53cc84bd8710'),(29,29,1,'Trolly','trolly',NULL,NULL,1,'2025-05-03 14:23:15','2025-05-03 14:23:15','58671406-1192-46cf-91f9-e8b7123bc40e'),(30,30,1,'Bed','bed',NULL,NULL,1,'2025-05-03 14:23:15','2025-05-03 14:23:15','8209ab3c-2157-48cc-841d-cc5d26554a61'),(31,31,1,'Hartshead Building','hartshead-building','locations/hartshead-building',NULL,1,'2025-05-03 14:29:26','2025-05-03 14:29:41','7a857899-55be-4049-9651-e10b3c5467fe'),(32,32,1,'Hartshead Building','hartshead-building','locations/hartshead-building',NULL,1,'2025-05-03 14:29:42','2025-05-03 14:29:42','30a192cf-3c29-4d88-b248-211cb60da048'),(33,33,1,'Hartshead Building','hartshead-building','locations/hartshead-building',NULL,1,'2025-05-03 14:32:10','2025-05-03 14:32:10','e14346e8-7209-4957-9e1c-5de13cea1bfe'),(34,34,1,NULL,'__temp_zgilkcvmqgknhmndoyjhuocdywyafojqilea',NULL,NULL,1,'2025-05-03 14:32:10','2025-05-03 14:32:10','0ad67cb1-8a17-4a43-aeff-2b3c52dcf256'),(36,36,1,'Patient Transfer','patient-transfer','task-types/patient-transfer',NULL,1,'2025-05-03 14:37:00','2025-05-04 14:18:27','ef7fcd47-4105-4d3f-99c6-6d4bed1cf9c4'),(37,37,1,'Samples','samples','task-types/samples',NULL,1,'2025-05-03 14:38:44','2025-05-04 14:18:27','e19fc8c9-342c-4386-a68a-a1c2556e5d95'),(38,38,1,'Samples','samples','task-types/samples',NULL,1,'2025-05-03 14:39:07','2025-05-04 14:18:27','801f3dfb-f744-4464-827c-af0855028ca7'),(39,39,1,'Asset Movement','asset-movement','task-types/asset-movement',NULL,1,'2025-05-03 14:39:22','2025-05-04 14:18:27','13592c5d-29f2-46ea-901a-5c89f589d42f'),(40,40,1,'Asset Movement','asset-movement','task-types/asset-movement',NULL,1,'2025-05-03 14:39:50','2025-05-04 14:18:27','431a8e16-5b92-46f7-9430-7aad5a7898d1'),(42,42,1,NULL,'__temp_rrpdstqvbkxcqtmdlfzlqibhmyxasgqoqmus',NULL,NULL,1,'2025-05-04 14:09:34','2025-05-04 14:09:34','1e8095f4-0b3c-4f81-ab76-09afb5117778'),(43,43,1,NULL,'__temp_ffjzbavwnmvnudamlqpesbgwusjuzaxkyhtv',NULL,NULL,1,'2025-05-04 14:11:47','2025-05-04 14:11:47','326bf4b6-f100-4ecc-9c39-ad1658da39a7'),(44,44,1,'Patient Transfer','patient-transfer','task-types/patient-transfer',NULL,1,'2025-05-04 14:12:14','2025-05-04 14:12:14','b8dd5ac3-2e09-48fe-85b2-f0c3dfacfcba'),(45,45,1,'Bed','bed','task-types/bed',NULL,1,'2025-05-04 14:12:23','2025-05-04 14:18:27','de8cc56e-f15e-488d-86cf-7bec06c8600a'),(46,46,1,'Bed','bed','task-types/bed',NULL,1,'2025-05-04 14:12:28','2025-05-04 14:12:28','8f3529c7-39cf-4d94-bf36-f5358dd4cb47'),(47,47,1,'Wheelchair','wheelchair','task-types/wheelchair',NULL,1,'2025-05-04 14:13:15','2025-05-04 14:18:27','08501e41-244c-46df-a1e4-aa0f37d4a04b'),(48,48,1,'Wheelchair','wheelchair','task-types/wheelchair',NULL,1,'2025-05-04 14:13:23','2025-05-04 14:13:23','45ef3d49-bb4d-47d5-ae2e-198c251798a0'),(49,49,1,'Trolley','trolly','task-types/trolly',NULL,1,'2025-05-04 14:13:25','2025-05-04 14:18:27','b88f94a5-d28e-436c-b321-3b1e004e4151'),(50,50,1,'Trolly','trolly','task-types/trolly',NULL,1,'2025-05-04 14:13:28','2025-05-04 14:13:28','2f2c4d12-757c-45af-b540-9f7960ac4014'),(51,51,1,'Trolley','trolly','task-types/trolly',NULL,1,'2025-05-04 14:13:34','2025-05-04 14:13:34','824c2e4b-d56c-477a-bdeb-5f3c131255c9'),(52,52,1,'Blood','blood','task-types/blood',NULL,1,'2025-05-04 14:13:49','2025-05-04 14:18:27','9a9077d3-923a-4a18-8530-0da4b3b3ee44'),(53,53,1,'Blood','blood','task-types/blood',NULL,1,'2025-05-04 14:13:53','2025-05-04 14:13:53','997c87a9-f6b8-4535-a5b7-6a11c3b05afe'),(54,54,1,'Urine','urine','task-types/urine',NULL,1,'2025-05-04 14:14:01','2025-05-04 14:18:27','0239726f-9cc4-4521-a58b-48d4a9e536c2'),(55,55,1,'Urine','urine','task-types/urine',NULL,1,'2025-05-04 14:14:05','2025-05-04 14:14:05','ade1e6e0-6299-4008-8f0b-0f62285d06a0'),(56,56,1,'Gases','gases','task-types/gases',NULL,1,'2025-05-04 14:14:30','2025-05-04 14:14:37','9722d8e7-8dd1-495b-808b-2415e50ab3c0'),(57,57,1,'Gases','gases','task-types/gases',NULL,1,'2025-05-04 14:14:37','2025-05-04 14:14:37','53b515a8-1ba5-4d6b-a7f3-d0bc2be0fff5'),(58,58,1,'Oxygen E Size','oxygen-e-size','task-types/oxygen-e-size',NULL,1,'2025-05-04 14:14:40','2025-05-04 14:18:27','67d79976-62b5-45e4-8db6-39487e06b93c'),(59,59,1,'Oxygen E Size','oxygen-e-size','task-types/oxygen-e-size',NULL,1,'2025-05-04 14:14:46','2025-05-04 14:14:46','8447ff12-9a0b-4f2d-ae02-df62336b54cc'),(60,60,1,'AMU','amu','buildings/amu',NULL,1,'2025-05-04 14:24:43','2025-05-04 14:26:01','14ad0e29-59b6-48a2-83d7-e4114fa4533a'),(61,61,1,'AMU','amu','buildings/amu',NULL,1,'2025-05-04 14:24:47','2025-05-04 14:24:47','dcc75393-906e-434f-8edd-2fa6b844428d'),(62,62,1,'Ward 27','ward-27','buildings/ward-27',NULL,1,'2025-05-04 14:24:49','2025-05-04 14:25:58','6ae5334d-78b8-4105-b98f-3b8982633383'),(63,63,1,'Ward 27','ward-27','buildings/ward-27',NULL,1,'2025-05-04 14:25:00','2025-05-04 14:25:00','69fd6998-1e87-4843-a878-13499b07b264'),(64,64,1,'Ward 43','ward-43','buildings/ward-43',NULL,1,'2025-05-04 14:25:02','2025-05-04 14:26:03','77593ced-960c-4a1e-9468-2d092a8f74ee'),(65,65,1,'Ward 43','ward-43','buildings/ward-43',NULL,1,'2025-05-04 14:25:06','2025-05-04 14:25:06','8851354e-fbfc-4898-b587-e9923ec1a7a6'),(66,66,1,'Bereavement Center','bereavement-center','buildings/bereavement-center',NULL,1,'2025-05-04 14:25:11','2025-05-04 14:25:28','ddb148c0-2aca-4c31-8ce2-ef2930b9956d'),(67,67,1,'Bereavement Center','bereavement-center','buildings/bereavement-center',NULL,1,'2025-05-04 14:25:31','2025-05-04 14:25:31','4e1c35da-0518-4032-b66e-7c534ba4cf12'),(68,68,1,'Rose Cotage','rose-cotage','buildings/rose-cotage',NULL,1,'2025-05-04 14:25:33','2025-05-04 14:25:54','e4310766-5e84-46ad-bd25-59d9ea58b399'),(69,69,1,'Rose Cotage','rose-cotage','buildings/rose-cotage',NULL,1,'2025-05-04 14:25:38','2025-05-04 14:25:38','c612d9f8-51ff-47f6-b360-ee0e5a050636'),(70,70,1,'Test','test','buildings/test',NULL,1,'2025-05-04 14:43:46','2025-05-04 14:52:27','513636bd-975e-4b17-af95-ca30bd96fbd0'),(71,71,1,'Test','test','buildings/test',NULL,1,'2025-05-04 14:43:46','2025-05-04 14:43:46','740de699-199b-4304-8de1-416f5ecdcad4'),(72,72,1,'Test','test-2','buildings/test-2',NULL,1,'2025-05-04 14:52:18','2025-05-04 14:52:27','83e95aaf-703d-40bd-ba0e-7c9a785eab91'),(73,73,1,'Test','test-2','buildings/test-2',NULL,1,'2025-05-04 14:52:18','2025-05-04 14:52:18','8dfe4864-06da-45d0-a320-fd654d06626b'),(74,74,1,'Ward 31','ward-31','buildings/ward-31',NULL,1,'2025-05-04 15:15:21','2025-05-04 15:25:46','9d15c9fd-7cac-4535-80f6-d1cd12f6a705'),(75,75,1,'Ward 31','ward-31','buildings/ward-31',NULL,1,'2025-05-04 15:15:21','2025-05-04 15:15:21','25c1d9c6-c79b-460f-9647-395c5b21cdd1'),(76,76,1,'Ward 31','ward-31-2','buildings/ward-31-2',NULL,1,'2025-05-04 15:25:20','2025-05-04 15:25:46','d649e21b-3e8c-492c-8db5-113638beb222'),(77,77,1,'Ward 31','ward-31-2','buildings/ward-31-2',NULL,1,'2025-05-04 15:25:21','2025-05-04 15:25:21','4f264a4d-9580-4ed9-b5f1-af470abe9a73'),(78,78,1,'Ward 31','ward-31','buildings/ward-31',NULL,1,'2025-05-04 15:28:45','2025-05-04 15:32:03','3343591f-2ed0-44ff-9ad0-33510c7657f6'),(79,79,1,'Ward 31','ward-31','buildings/ward-31',NULL,1,'2025-05-04 15:28:45','2025-05-04 15:28:45','3c686d02-ac2a-4a68-bec0-b9fef0935210'),(80,80,1,'Ward 30','ward-30','buildings/ward-30',NULL,1,'2025-05-04 15:31:42','2025-05-04 15:32:03','7604276b-04c1-4196-ac2d-6da1180a1060'),(81,81,1,'Ward 30','ward-30','buildings/ward-30',NULL,1,'2025-05-04 15:31:42','2025-05-04 15:31:42','5147675b-4c9b-4cbc-ac3d-61de788173ed'),(82,82,1,'Ward 42','ward-42','buildings/ward-42',NULL,1,'2025-05-04 15:32:45','2025-05-04 15:36:19','8eaf90e0-eb4c-4069-a481-990ed047041c'),(83,83,1,'Ward 42','ward-42','buildings/ward-42',NULL,1,'2025-05-04 15:32:45','2025-05-04 15:32:45','dde1e65a-b735-4eef-b195-79731e6dff2e'),(84,84,1,'Ward 46','ward-46','buildings/ward-46',NULL,1,'2025-05-04 15:33:17','2025-05-04 15:36:19','a8ab04b1-fffb-4272-8d34-7fd6552fdf0c'),(85,85,1,'Ward 46','ward-46','buildings/ward-46',NULL,1,'2025-05-04 15:33:17','2025-05-04 15:33:17','8d1ad2eb-fba9-42ec-8095-378bab6b88da'),(86,86,1,'Ward 45','ward-45','buildings/ward-45',NULL,1,'2025-05-04 15:35:41','2025-05-04 15:36:19','2e81b873-3ea3-452e-8147-0f2cccbc97b5'),(87,87,1,'Ward 45','ward-45','buildings/ward-45',NULL,1,'2025-05-04 15:35:41','2025-05-04 15:35:41','e4e6d796-14c1-4064-9803-d7e9ba9bb093'),(88,88,1,'Samples','samples','task-types/samples',NULL,1,'2025-05-04 15:36:18','2025-05-04 15:36:24','ee65198e-6c78-4c01-b1fd-0aa1ae418efc'),(89,89,1,'Samples','samples','task-types/samples',NULL,1,'2025-05-04 15:36:25','2025-05-04 15:36:25','edacb49e-880a-4c3d-8cb0-9c7c352dc00a'),(90,90,1,'Patient Transfer','patient-transfer','task-types/patient-transfer',NULL,1,'2025-05-04 15:36:27','2025-05-04 15:36:33','62999b0d-0de7-422d-8c6c-89d9d48f6047'),(91,91,1,'Patient Transfer','patient-transfer','task-types/patient-transfer',NULL,1,'2025-05-04 15:36:33','2025-05-04 15:36:33','02eb3561-988f-4f67-8412-968fd0db9bd0'),(92,92,1,'Asset Movement','asset-movement','task-types/asset-movement',NULL,1,'2025-05-04 15:36:37','2025-05-04 15:36:43','ec7045f7-4cb4-450d-8756-e07231b5d840'),(93,93,1,'Asset Movement','asset-movement','task-types/asset-movement',NULL,1,'2025-05-04 15:36:44','2025-05-04 15:36:44','8f448f87-50e1-4a6f-afc1-53929ef842e1'),(94,94,1,'Blood','blood','task-types/blood',NULL,1,'2025-05-04 15:36:47','2025-05-04 15:36:53','bb8db63c-4e29-4baf-ae7c-86a8a46f2e3f'),(95,95,1,'Blood','blood','task-types/blood',NULL,1,'2025-05-04 15:36:50','2025-05-04 15:36:50','0b18e863-3807-413d-9cda-39afda7263d5'),(96,96,1,'Urine','urine','task-types/urine',NULL,1,'2025-05-04 15:36:54','2025-05-04 15:37:00','5c1bc395-2b70-4315-adef-20db510427b0'),(97,97,1,'Urine','urine','task-types/urine',NULL,1,'2025-05-04 15:36:57','2025-05-04 15:36:57','7b8b3bfa-3db9-4b50-abc0-d635d56e5403'),(98,98,1,'Bed','bed','task-types/bed',NULL,1,'2025-05-04 15:37:02','2025-05-04 15:37:07','f6bffa27-ed5c-4830-8449-d983d0ce6bbe'),(99,99,1,'Bed','bed','task-types/bed',NULL,1,'2025-05-04 15:37:04','2025-05-04 15:37:04','318ff394-a437-49dd-a113-bf944ab9afd8'),(100,100,1,'Chair','chair','task-types/chair',NULL,1,'2025-05-04 15:37:08','2025-05-04 15:37:32','76e482d1-31b9-4703-80d9-9bc2fd993e61'),(101,101,1,'Chair','chair','task-types/chair',NULL,1,'2025-05-04 15:37:11','2025-05-04 15:37:11','7ca8b591-177f-48b3-a6f8-c8581fd4b64e'),(102,102,1,'Trolley','trolly','task-types/trolly',NULL,1,'2025-05-04 15:37:16','2025-05-04 15:37:30','d1411650-3e37-49c2-a1d7-3104fffe000c'),(103,103,1,'Trolly','trolly','task-types/trolly',NULL,1,'2025-05-04 15:37:19','2025-05-04 15:37:19','16daf8f6-a074-47d1-a4d9-cfb10680d489'),(105,105,1,'Trolley','trolly','task-types/trolly',NULL,1,'2025-05-04 15:37:26','2025-05-04 15:37:26','4a715f6d-5d17-4220-a961-44bfc6f62375'),(106,106,1,'Gases','gases','task-types/gases',NULL,1,'2025-05-04 15:37:36','2025-05-04 15:37:41','fdde2a69-353f-4650-ab3c-46daf4122842'),(107,107,1,'Gases','gases','task-types/gases',NULL,1,'2025-05-04 15:37:43','2025-05-04 15:37:43','407e0fe8-ded5-46f2-a7cc-cdeda9e1f5f2'),(108,108,1,'Oxygen Size D','oxygen-size-d','task-types/oxygen-size-d',NULL,1,'2025-05-04 15:37:44','2025-05-04 15:37:55','eb2e399b-3598-4907-8727-6d7cd62fa45c'),(109,109,1,'Oxygen Size D','oxygen-size-d','task-types/oxygen-size-d',NULL,1,'2025-05-04 15:37:51','2025-05-04 15:37:51','2af9858d-2829-45ca-9475-1c28223e6095'),(110,110,1,'Adhoc','adhoc','task-types/adhoc',NULL,1,'2025-05-04 15:37:59','2025-05-04 15:38:02','b052d751-f690-4d72-a2c1-d507e02cab91'),(111,111,1,'Adhoc','adhoc','task-types/adhoc',NULL,1,'2025-05-04 15:38:02','2025-05-04 15:38:02','1c2c39a1-a152-438e-8971-f2fb6636b0f9'),(112,112,1,'Bed Pans','bed-pans','task-types/bed-pans',NULL,1,'2025-05-04 15:38:04','2025-05-04 15:38:13','35afe45f-c882-4cf3-9d55-f0793063a2bd'),(113,113,1,'Bed Pans','bed-pans','task-types/bed-pans',NULL,1,'2025-05-04 15:38:09','2025-05-04 15:38:09','5e060ee2-ed55-4f46-b315-8649fae99292'),(114,114,1,'Placenta','placenta','task-types/placenta',NULL,1,'2025-05-04 15:57:44','2025-05-04 15:58:33','53fd7ea2-1714-4c25-9b41-dcb2b6f2eae3'),(115,115,1,'Placenta','placenta','task-types/placenta',NULL,1,'2025-05-04 15:57:44','2025-05-04 15:57:44','e6fa964b-47f0-4870-a1e9-9244087f7f5d'),(116,116,1,'NICU','nicu','buildings/nicu',NULL,1,'2025-05-04 16:22:01','2025-05-04 16:29:20','0bfa9caf-615f-4639-add4-ebce9b044f7d'),(117,117,1,'NICU','nicu','buildings/nicu',NULL,1,'2025-05-04 16:22:01','2025-05-04 16:22:01','64dbc673-66ca-49b4-bce6-f3ddba7d6351'),(118,118,1,'Porter','porter-2','porters/porter-2','{\"009018f1-2b1f-4378-b2a7-c2fbd98e5d5b\": \"Two\"}',1,'2025-05-04 16:29:42','2025-05-04 16:29:42','8c3afbfd-81ba-4e35-8513-7af64536671c'),(119,119,1,'Porter','porter-2','porters/porter-2','{\"009018f1-2b1f-4378-b2a7-c2fbd98e5d5b\": \"Two\"}',1,'2025-05-04 16:29:42','2025-05-04 16:29:42','53344dd0-353b-4e23-9b81-e603902446cd'),(120,120,1,'Porter','porter-3','porters/porter-3','{\"009018f1-2b1f-4378-b2a7-c2fbd98e5d5b\": \"Three\"}',1,'2025-05-04 16:29:50','2025-05-04 16:29:50','8a8510f2-83f6-4d89-b1f3-4ad354027b6a'),(121,121,1,'Porter','porter-3','porters/porter-3','{\"009018f1-2b1f-4378-b2a7-c2fbd98e5d5b\": \"Three\"}',1,'2025-05-04 16:29:50','2025-05-04 16:29:50','bc8e83d2-9e1a-48b6-9874-428fe98b7f46'),(122,122,1,'Porter','porter-4','porters/porter-4','{\"009018f1-2b1f-4378-b2a7-c2fbd98e5d5b\": \"Four\"}',1,'2025-05-04 16:29:56','2025-05-04 16:29:56','50ac6949-176b-4c72-9871-9e59ab605d0d'),(123,123,1,'Porter','porter-4','porters/porter-4','{\"009018f1-2b1f-4378-b2a7-c2fbd98e5d5b\": \"Four\"}',1,'2025-05-04 16:29:56','2025-05-04 16:29:56','bd9f7736-83f4-48c7-83de-7fa979638c8b');
/*!40000 ALTER TABLE `elements_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entries`
--

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entries` VALUES (2,3,NULL,NULL,NULL,3,'2025-05-03 12:06:43',NULL,'live',NULL,NULL,'2025-05-03 12:06:43','2025-05-03 12:06:43'),(3,3,NULL,NULL,NULL,3,'2025-05-03 12:07:02',NULL,'live',NULL,NULL,'2025-05-03 12:07:02','2025-05-03 12:07:02'),(4,3,NULL,NULL,NULL,3,'2025-05-03 12:17:00',NULL,'live',NULL,NULL,'2025-05-03 12:17:57','2025-05-03 12:17:57'),(5,3,NULL,NULL,NULL,3,'2025-05-03 12:17:00',NULL,'live',NULL,NULL,'2025-05-03 12:17:57','2025-05-03 12:17:57'),(6,3,NULL,NULL,NULL,3,'2025-05-03 12:17:00',NULL,'live',NULL,NULL,'2025-05-03 12:19:02','2025-05-03 12:19:02'),(8,3,NULL,NULL,NULL,3,'2025-05-03 12:17:00',NULL,'live',NULL,NULL,'2025-05-03 12:19:42','2025-05-03 12:19:42'),(9,4,NULL,NULL,NULL,4,'2025-05-03 12:29:00',NULL,'live',NULL,NULL,'2025-05-03 12:29:52','2025-05-03 12:29:52'),(10,4,NULL,NULL,NULL,4,'2025-05-03 12:29:00',NULL,'live',NULL,NULL,'2025-05-03 12:29:52','2025-05-03 12:29:52'),(11,1,NULL,NULL,NULL,1,'2025-05-03 13:02:00',NULL,'live',NULL,NULL,'2025-05-03 13:02:53','2025-05-03 13:02:53'),(12,1,NULL,NULL,NULL,1,'2025-05-03 13:02:00',NULL,'live',NULL,NULL,'2025-05-03 13:02:53','2025-05-03 13:02:53'),(13,1,NULL,NULL,NULL,1,'2025-05-03 13:07:00',NULL,'live',NULL,NULL,'2025-05-03 13:07:20','2025-05-03 13:07:20'),(14,1,NULL,NULL,NULL,1,'2025-05-03 13:07:00',NULL,'live',NULL,NULL,'2025-05-03 13:07:20','2025-05-03 13:07:20'),(15,2,NULL,NULL,NULL,2,'2025-05-03 13:08:00',NULL,'live',NULL,1,'2025-05-03 13:08:52','2025-05-03 13:08:52'),(16,2,NULL,NULL,NULL,2,'2025-05-03 13:08:00',NULL,'live',NULL,NULL,'2025-05-03 13:08:52','2025-05-03 13:08:52'),(17,2,NULL,NULL,NULL,2,'2025-05-03 13:09:00',NULL,'live',NULL,1,'2025-05-03 13:09:09','2025-05-03 13:09:09'),(18,2,NULL,NULL,NULL,2,'2025-05-03 13:09:00',NULL,'live',NULL,NULL,'2025-05-03 13:09:09','2025-05-03 13:09:09'),(19,1,NULL,NULL,NULL,1,'2025-05-03 13:26:00',NULL,'live',0,0,'2025-05-03 13:26:18','2025-05-03 13:26:18'),(20,1,NULL,NULL,NULL,1,'2025-05-03 13:26:00',NULL,'live',NULL,NULL,'2025-05-03 13:26:18','2025-05-03 13:26:18'),(21,1,NULL,NULL,NULL,1,'2025-05-03 14:04:00',NULL,'live',NULL,NULL,'2025-05-03 14:04:55','2025-05-03 14:04:55'),(22,1,NULL,NULL,NULL,1,'2025-05-03 14:04:00',NULL,'live',NULL,NULL,'2025-05-03 14:04:55','2025-05-03 14:04:55'),(23,5,NULL,NULL,NULL,6,'2025-05-03 14:23:00',NULL,'live',1,NULL,'2025-05-03 14:22:12','2025-05-03 14:23:15'),(24,NULL,NULL,23,4,5,'2025-05-03 14:22:00',NULL,'live',1,NULL,'2025-05-03 14:22:20','2025-05-03 14:22:20'),(25,NULL,NULL,23,4,5,'2025-05-03 14:22:00',NULL,'live',1,NULL,'2025-05-03 14:22:51','2025-05-03 14:22:51'),(26,NULL,NULL,23,4,5,'2025-05-03 14:23:00',NULL,'live',1,NULL,'2025-05-03 14:23:05','2025-05-03 14:23:05'),(27,5,NULL,NULL,NULL,6,'2025-05-03 14:23:00',NULL,'live',NULL,NULL,'2025-05-03 14:23:15','2025-05-03 14:23:15'),(28,NULL,NULL,27,4,5,'2025-05-03 14:22:00',NULL,'live',NULL,NULL,'2025-05-03 14:23:15','2025-05-03 14:23:15'),(29,NULL,NULL,27,4,5,'2025-05-03 14:22:00',NULL,'live',NULL,NULL,'2025-05-03 14:23:15','2025-05-03 14:23:15'),(30,NULL,NULL,27,4,5,'2025-05-03 14:23:00',NULL,'live',NULL,NULL,'2025-05-03 14:23:15','2025-05-03 14:23:15'),(31,6,NULL,NULL,NULL,7,'2025-05-03 14:29:00',NULL,'live',NULL,1,'2025-05-03 14:29:26','2025-05-03 14:29:42'),(32,6,NULL,NULL,NULL,7,'2025-05-03 14:29:00',NULL,'live',NULL,NULL,'2025-05-03 14:29:42','2025-05-03 14:29:42'),(33,6,NULL,NULL,NULL,7,'2025-05-03 14:29:00',NULL,'live',NULL,NULL,'2025-05-03 14:32:10','2025-05-03 14:32:10'),(34,NULL,NULL,33,5,8,NULL,NULL,'pending',1,NULL,'2025-05-03 14:32:10','2025-05-03 14:32:10'),(36,5,NULL,NULL,NULL,6,'2025-05-03 14:23:00',NULL,'live',NULL,NULL,'2025-05-03 14:37:00','2025-05-03 14:37:00'),(37,5,NULL,NULL,NULL,6,'2025-05-03 14:39:00',NULL,'live',1,NULL,'2025-05-03 14:38:44','2025-05-03 14:39:07'),(38,5,NULL,NULL,NULL,6,'2025-05-03 14:39:00',NULL,'live',NULL,NULL,'2025-05-03 14:39:07','2025-05-03 14:39:07'),(39,5,NULL,NULL,NULL,6,'2025-05-03 14:39:00',NULL,'live',1,NULL,'2025-05-03 14:39:22','2025-05-03 14:39:50'),(40,5,NULL,NULL,NULL,6,'2025-05-03 14:39:00',NULL,'live',NULL,NULL,'2025-05-03 14:39:50','2025-05-03 14:39:50'),(43,NULL,NULL,42,6,6,'2025-05-04 14:11:00',NULL,'live',1,NULL,'2025-05-04 14:11:47','2025-05-04 14:11:47'),(44,5,NULL,NULL,NULL,6,'2025-05-03 14:23:00',NULL,'live',NULL,NULL,'2025-05-04 14:12:14','2025-05-04 14:12:14'),(45,5,NULL,NULL,NULL,6,'2025-05-04 14:12:00',NULL,'live',1,NULL,'2025-05-04 14:12:23','2025-05-04 14:12:28'),(46,5,NULL,NULL,NULL,6,'2025-05-04 14:12:00',NULL,'live',NULL,NULL,'2025-05-04 14:12:28','2025-05-04 14:12:28'),(47,5,NULL,NULL,NULL,6,'2025-05-04 14:13:00',NULL,'live',1,NULL,'2025-05-04 14:13:15','2025-05-04 14:13:23'),(48,5,NULL,NULL,NULL,6,'2025-05-04 14:13:00',NULL,'live',NULL,NULL,'2025-05-04 14:13:23','2025-05-04 14:13:23'),(49,5,NULL,NULL,NULL,6,'2025-05-04 14:13:00',NULL,'live',1,NULL,'2025-05-04 14:13:25','2025-05-04 14:13:28'),(50,5,NULL,NULL,NULL,6,'2025-05-04 14:13:00',NULL,'live',NULL,NULL,'2025-05-04 14:13:28','2025-05-04 14:13:28'),(51,5,NULL,NULL,NULL,6,'2025-05-04 14:13:00',NULL,'live',NULL,NULL,'2025-05-04 14:13:34','2025-05-04 14:13:34'),(52,5,NULL,NULL,NULL,6,'2025-05-04 14:13:00',NULL,'live',1,NULL,'2025-05-04 14:13:49','2025-05-04 14:13:53'),(53,5,NULL,NULL,NULL,6,'2025-05-04 14:13:00',NULL,'live',NULL,NULL,'2025-05-04 14:13:53','2025-05-04 14:13:53'),(54,5,NULL,NULL,NULL,6,'2025-05-04 14:14:00',NULL,'live',1,NULL,'2025-05-04 14:14:01','2025-05-04 14:14:05'),(55,5,NULL,NULL,NULL,6,'2025-05-04 14:14:00',NULL,'live',NULL,NULL,'2025-05-04 14:14:05','2025-05-04 14:14:05'),(56,5,NULL,NULL,NULL,6,'2025-05-04 14:14:00',NULL,'live',1,NULL,'2025-05-04 14:14:30','2025-05-04 14:14:37'),(57,5,NULL,NULL,NULL,6,'2025-05-04 14:14:00',NULL,'live',NULL,NULL,'2025-05-04 14:14:37','2025-05-04 14:14:37'),(58,5,NULL,NULL,NULL,6,'2025-05-04 14:14:00',NULL,'live',1,NULL,'2025-05-04 14:14:40','2025-05-04 14:14:46'),(59,5,NULL,NULL,NULL,6,'2025-05-04 14:14:00',NULL,'live',NULL,NULL,'2025-05-04 14:14:46','2025-05-04 14:14:46'),(60,1,NULL,NULL,NULL,1,'2025-05-04 14:24:00',NULL,'live',NULL,NULL,'2025-05-04 14:24:43','2025-05-04 14:24:47'),(61,1,NULL,NULL,NULL,1,'2025-05-04 14:24:00',NULL,'live',NULL,NULL,'2025-05-04 14:24:47','2025-05-04 14:24:47'),(62,1,NULL,NULL,NULL,1,'2025-05-04 14:25:00',NULL,'live',NULL,NULL,'2025-05-04 14:24:49','2025-05-04 14:25:00'),(63,1,NULL,NULL,NULL,1,'2025-05-04 14:25:00',NULL,'live',NULL,NULL,'2025-05-04 14:25:00','2025-05-04 14:25:00'),(64,1,NULL,NULL,NULL,1,'2025-05-04 14:25:00',NULL,'live',NULL,NULL,'2025-05-04 14:25:02','2025-05-04 14:25:06'),(65,1,NULL,NULL,NULL,1,'2025-05-04 14:25:00',NULL,'live',NULL,NULL,'2025-05-04 14:25:06','2025-05-04 14:25:06'),(66,1,NULL,NULL,NULL,1,'2025-05-04 14:25:00',NULL,'live',NULL,NULL,'2025-05-04 14:25:11','2025-05-04 14:25:31'),(67,1,NULL,NULL,NULL,1,'2025-05-04 14:25:00',NULL,'live',NULL,NULL,'2025-05-04 14:25:31','2025-05-04 14:25:31'),(68,1,NULL,NULL,NULL,1,'2025-05-04 14:25:00',NULL,'live',NULL,NULL,'2025-05-04 14:25:33','2025-05-04 14:25:38'),(69,1,NULL,NULL,NULL,1,'2025-05-04 14:25:00',NULL,'live',NULL,NULL,'2025-05-04 14:25:38','2025-05-04 14:25:38'),(70,1,NULL,NULL,NULL,1,'2025-05-04 14:43:00',NULL,'live',0,0,'2025-05-04 14:43:46','2025-05-04 14:43:46'),(71,1,NULL,NULL,NULL,1,'2025-05-04 14:43:00',NULL,'live',NULL,NULL,'2025-05-04 14:43:46','2025-05-04 14:43:46'),(72,1,NULL,NULL,NULL,1,'2025-05-04 14:52:00',NULL,'live',0,0,'2025-05-04 14:52:18','2025-05-04 14:52:18'),(73,1,NULL,NULL,NULL,1,'2025-05-04 14:52:00',NULL,'live',NULL,NULL,'2025-05-04 14:52:18','2025-05-04 14:52:18'),(74,1,NULL,NULL,NULL,1,'2025-05-04 15:15:00',NULL,'live',0,0,'2025-05-04 15:15:21','2025-05-04 15:15:21'),(75,1,NULL,NULL,NULL,1,'2025-05-04 15:15:00',NULL,'live',NULL,NULL,'2025-05-04 15:15:21','2025-05-04 15:15:21'),(76,1,NULL,NULL,NULL,1,'2025-05-04 15:25:00',NULL,'live',0,0,'2025-05-04 15:25:20','2025-05-04 15:25:20'),(77,1,NULL,NULL,NULL,1,'2025-05-04 15:25:00',NULL,'live',NULL,NULL,'2025-05-04 15:25:21','2025-05-04 15:25:21'),(78,1,NULL,NULL,NULL,1,'2025-05-04 15:28:00',NULL,'live',NULL,NULL,'2025-05-04 15:28:45','2025-05-04 15:28:45'),(79,1,NULL,NULL,NULL,1,'2025-05-04 15:28:00',NULL,'live',NULL,NULL,'2025-05-04 15:28:45','2025-05-04 15:28:45'),(80,1,NULL,NULL,NULL,1,'2025-05-04 15:31:00',NULL,'live',NULL,NULL,'2025-05-04 15:31:42','2025-05-04 15:31:42'),(81,1,NULL,NULL,NULL,1,'2025-05-04 15:31:00',NULL,'live',NULL,NULL,'2025-05-04 15:31:42','2025-05-04 15:31:42'),(82,1,NULL,NULL,NULL,1,'2025-05-04 15:32:00',NULL,'live',NULL,NULL,'2025-05-04 15:32:45','2025-05-04 15:32:45'),(83,1,NULL,NULL,NULL,1,'2025-05-04 15:32:00',NULL,'live',NULL,NULL,'2025-05-04 15:32:45','2025-05-04 15:32:45'),(84,1,NULL,NULL,NULL,1,'2025-05-04 15:33:00',NULL,'live',NULL,NULL,'2025-05-04 15:33:17','2025-05-04 15:33:17'),(85,1,NULL,NULL,NULL,1,'2025-05-04 15:33:00',NULL,'live',NULL,NULL,'2025-05-04 15:33:17','2025-05-04 15:33:17'),(86,1,NULL,NULL,NULL,1,'2025-05-04 15:35:00',NULL,'live',NULL,NULL,'2025-05-04 15:35:41','2025-05-04 15:35:41'),(87,1,NULL,NULL,NULL,1,'2025-05-04 15:35:00',NULL,'live',NULL,NULL,'2025-05-04 15:35:41','2025-05-04 15:35:41'),(88,5,NULL,NULL,NULL,9,'2025-05-04 15:36:00',NULL,'live',NULL,NULL,'2025-05-04 15:36:18','2025-05-04 15:36:25'),(89,5,NULL,NULL,NULL,9,'2025-05-04 15:36:00',NULL,'live',NULL,NULL,'2025-05-04 15:36:25','2025-05-04 15:36:25'),(90,5,NULL,NULL,NULL,9,'2025-05-04 15:36:00',NULL,'live',NULL,NULL,'2025-05-04 15:36:27','2025-05-04 15:36:33'),(91,5,NULL,NULL,NULL,9,'2025-05-04 15:36:00',NULL,'live',NULL,NULL,'2025-05-04 15:36:33','2025-05-04 15:36:33'),(92,5,NULL,NULL,NULL,9,'2025-05-04 15:36:00',NULL,'live',NULL,NULL,'2025-05-04 15:36:37','2025-05-04 15:36:44'),(93,5,NULL,NULL,NULL,9,'2025-05-04 15:36:00',NULL,'live',NULL,NULL,'2025-05-04 15:36:44','2025-05-04 15:36:44'),(94,5,NULL,NULL,NULL,9,'2025-05-04 15:36:00',NULL,'live',NULL,NULL,'2025-05-04 15:36:47','2025-05-04 15:36:50'),(95,5,NULL,NULL,NULL,9,'2025-05-04 15:36:00',NULL,'live',NULL,NULL,'2025-05-04 15:36:50','2025-05-04 15:36:50'),(96,5,NULL,NULL,NULL,9,'2025-05-04 15:36:00',NULL,'live',NULL,NULL,'2025-05-04 15:36:54','2025-05-04 15:36:57'),(97,5,NULL,NULL,NULL,9,'2025-05-04 15:36:00',NULL,'live',NULL,NULL,'2025-05-04 15:36:57','2025-05-04 15:36:57'),(98,5,NULL,NULL,NULL,9,'2025-05-04 15:37:00',NULL,'live',NULL,NULL,'2025-05-04 15:37:02','2025-05-04 15:37:04'),(99,5,NULL,NULL,NULL,9,'2025-05-04 15:37:00',NULL,'live',NULL,NULL,'2025-05-04 15:37:04','2025-05-04 15:37:04'),(100,5,NULL,NULL,NULL,9,'2025-05-04 15:37:00',NULL,'live',NULL,NULL,'2025-05-04 15:37:08','2025-05-04 15:37:11'),(101,5,NULL,NULL,NULL,9,'2025-05-04 15:37:00',NULL,'live',NULL,NULL,'2025-05-04 15:37:11','2025-05-04 15:37:11'),(102,5,NULL,NULL,NULL,9,'2025-05-04 15:37:00',NULL,'live',NULL,NULL,'2025-05-04 15:37:16','2025-05-04 15:37:19'),(103,5,NULL,NULL,NULL,9,'2025-05-04 15:37:00',NULL,'live',NULL,NULL,'2025-05-04 15:37:19','2025-05-04 15:37:19'),(105,5,NULL,NULL,NULL,9,'2025-05-04 15:37:00',NULL,'live',NULL,NULL,'2025-05-04 15:37:26','2025-05-04 15:37:26'),(106,5,NULL,NULL,NULL,9,'2025-05-04 15:37:00',NULL,'live',NULL,NULL,'2025-05-04 15:37:36','2025-05-04 15:37:43'),(107,5,NULL,NULL,NULL,9,'2025-05-04 15:37:00',NULL,'live',NULL,NULL,'2025-05-04 15:37:43','2025-05-04 15:37:43'),(108,5,NULL,NULL,NULL,9,'2025-05-04 15:37:00',NULL,'live',NULL,NULL,'2025-05-04 15:37:44','2025-05-04 15:37:51'),(109,5,NULL,NULL,NULL,9,'2025-05-04 15:37:00',NULL,'live',NULL,NULL,'2025-05-04 15:37:51','2025-05-04 15:37:51'),(110,5,NULL,NULL,NULL,9,'2025-05-04 15:38:00',NULL,'live',NULL,NULL,'2025-05-04 15:37:59','2025-05-04 15:38:02'),(111,5,NULL,NULL,NULL,9,'2025-05-04 15:38:00',NULL,'live',NULL,NULL,'2025-05-04 15:38:02','2025-05-04 15:38:02'),(112,5,NULL,NULL,NULL,9,'2025-05-04 15:38:00',NULL,'live',NULL,NULL,'2025-05-04 15:38:04','2025-05-04 15:38:09'),(113,5,NULL,NULL,NULL,9,'2025-05-04 15:38:00',NULL,'live',NULL,NULL,'2025-05-04 15:38:09','2025-05-04 15:38:09'),(114,5,NULL,NULL,NULL,12,'2025-05-04 15:57:00',NULL,'live',NULL,NULL,'2025-05-04 15:57:44','2025-05-04 15:57:44'),(115,5,NULL,NULL,NULL,12,'2025-05-04 15:57:00',NULL,'live',NULL,NULL,'2025-05-04 15:57:44','2025-05-04 15:57:44'),(116,1,NULL,NULL,NULL,1,'2025-05-04 16:22:00',NULL,'live',NULL,NULL,'2025-05-04 16:22:01','2025-05-04 16:22:01'),(117,1,NULL,NULL,NULL,1,'2025-05-04 16:22:00',NULL,'live',NULL,NULL,'2025-05-04 16:22:01','2025-05-04 16:22:01'),(118,3,NULL,NULL,NULL,3,'2025-05-04 16:29:00',NULL,'live',NULL,NULL,'2025-05-04 16:29:42','2025-05-04 16:29:42'),(119,3,NULL,NULL,NULL,3,'2025-05-04 16:29:00',NULL,'live',NULL,NULL,'2025-05-04 16:29:42','2025-05-04 16:29:42'),(120,3,NULL,NULL,NULL,3,'2025-05-04 16:29:00',NULL,'live',NULL,NULL,'2025-05-04 16:29:50','2025-05-04 16:29:50'),(121,3,NULL,NULL,NULL,3,'2025-05-04 16:29:00',NULL,'live',NULL,NULL,'2025-05-04 16:29:50','2025-05-04 16:29:50'),(122,3,NULL,NULL,NULL,3,'2025-05-04 16:29:00',NULL,'live',NULL,NULL,'2025-05-04 16:29:56','2025-05-04 16:29:56'),(123,3,NULL,NULL,NULL,3,'2025-05-04 16:29:00',NULL,'live',NULL,NULL,'2025-05-04 16:29:56','2025-05-04 16:29:56');
/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entries_authors`
--

LOCK TABLES `entries_authors` WRITE;
/*!40000 ALTER TABLE `entries_authors` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entries_authors` VALUES (2,1,1),(3,1,1),(4,1,1),(5,1,1),(6,1,1),(8,1,1),(9,1,1),(10,1,1),(11,1,1),(12,1,1),(13,1,1),(14,1,1),(15,1,1),(16,1,1),(17,1,1),(18,1,1),(19,1,1),(20,1,1),(21,1,1),(22,1,1),(23,1,1),(27,1,1),(31,1,1),(32,1,1),(33,1,1),(36,1,1),(37,1,1),(38,1,1),(39,1,1),(40,1,1),(44,1,1),(45,1,1),(46,1,1),(47,1,1),(48,1,1),(49,1,1),(50,1,1),(51,1,1),(52,1,1),(53,1,1),(54,1,1),(55,1,1),(56,1,1),(57,1,1),(58,1,1),(59,1,1),(60,1,1),(61,1,1),(62,1,1),(63,1,1),(64,1,1),(65,1,1),(66,1,1),(67,1,1),(68,1,1),(69,1,1),(70,1,1),(71,1,1),(72,1,1),(73,1,1),(74,1,1),(75,1,1),(76,1,1),(77,1,1),(78,1,1),(79,1,1),(80,1,1),(81,1,1),(82,1,1),(83,1,1),(84,1,1),(85,1,1),(86,1,1),(87,1,1),(88,1,1),(89,1,1),(90,1,1),(91,1,1),(92,1,1),(93,1,1),(94,1,1),(95,1,1),(96,1,1),(97,1,1),(98,1,1),(99,1,1),(100,1,1),(101,1,1),(102,1,1),(103,1,1),(105,1,1),(106,1,1),(107,1,1),(108,1,1),(109,1,1),(110,1,1),(111,1,1),(112,1,1),(113,1,1),(114,1,1),(115,1,1),(116,1,1),(117,1,1),(118,1,1),(119,1,1),(120,1,1),(121,1,1),(122,1,1),(123,1,1);
/*!40000 ALTER TABLE `entries_authors` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entrytypes`
--

LOCK TABLES `entrytypes` WRITE;
/*!40000 ALTER TABLE `entrytypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entrytypes` VALUES (1,1,'Ent Locations','entLocations','apartment',NULL,1,'site',NULL,NULL,1,'site',NULL,1,'2025-05-03 11:56:16','2025-05-04 14:58:32',NULL,'a6ca13d7-bc6b-4c17-a310-b0fcaa34804d'),(2,2,'Ent Departments','entDepartments','phone-office',NULL,1,'site',NULL,NULL,1,'site',NULL,1,'2025-05-03 11:57:21','2025-05-03 11:57:21','2025-05-04 14:22:54','f5051ed3-2649-4f41-a303-9d3b06368f94'),(3,3,'Ent Porters','entPorters','person-walking-luggage',NULL,1,'site',NULL,'{fd_surname}',1,'site',NULL,1,'2025-05-03 11:59:15','2025-05-03 12:19:31',NULL,'fe915955-f57d-4ec4-bf9c-92c417a8e11d'),(4,4,'Ent Supervisors','entSupervisors','clipboard',NULL,1,'site',NULL,NULL,1,'site',NULL,1,'2025-05-03 12:21:38','2025-05-03 12:21:38',NULL,'0ddc1c53-595b-487f-8473-eece2e4861de'),(5,5,'MX Task Types','mxTaskTypes','circle-check',NULL,1,'site',NULL,NULL,1,'site',NULL,1,'2025-05-03 14:21:43','2025-05-03 14:24:20','2025-05-03 14:37:12','5ee293b5-2932-4312-b446-c524f9c49ba3'),(6,6,'Ent Task Types','entTaskTypes','circle-check',NULL,1,'site',NULL,NULL,1,'site',NULL,1,'2025-05-03 14:22:01','2025-05-03 14:22:01','2025-05-04 14:23:58','cfd34809-4c28-4aeb-98fa-8fd478b892ab'),(7,7,'Ent Locations','entLocations','apartment',NULL,1,'site',NULL,NULL,1,'site',NULL,1,'2025-05-03 14:29:14','2025-05-03 14:29:14','2025-05-04 14:23:07','3020a852-3734-4792-a934-465d41a9fdf0'),(8,8,'MX Departments','mxDepartments','apartment',NULL,1,'site',NULL,NULL,1,'site',NULL,1,'2025-05-03 14:31:48','2025-05-03 14:31:48','2025-05-03 14:33:57','f4c80c9b-04e0-4b82-b12b-5deed653b381'),(9,9,'Task Categories','taskCategories','list',NULL,1,'site',NULL,NULL,1,'site',NULL,1,'2025-05-04 14:18:24','2025-05-04 14:58:10',NULL,'a029653d-b401-4157-b33a-c398463b10b2'),(10,10,'Task Types','taskTypes',NULL,NULL,1,'site',NULL,NULL,1,'site',NULL,1,'2025-05-04 14:18:58','2025-05-04 14:18:58','2025-05-04 14:23:51','13c3207d-7d33-48e9-b37f-b5791726f7ad'),(11,11,'Ent Departments','entDepartments','house',NULL,1,'site',NULL,NULL,1,'site',NULL,1,'2025-05-04 14:57:39','2025-05-04 14:58:42',NULL,'a77bbb05-d771-4014-ae5a-7e0b5e8be34b'),(12,12,'ENT Tasks','entTasks','check',NULL,1,'site',NULL,NULL,1,'site',NULL,1,'2025-05-04 15:52:11','2025-05-04 15:52:11',NULL,'1fefe862-852d-49ba-83cb-906b289365ac');
/*!40000 ALTER TABLE `entrytypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayouts`
--

LOCK TABLES `fieldlayouts` WRITE;
/*!40000 ALTER TABLE `fieldlayouts` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayouts` VALUES (1,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"764fa209-1710-4061-adde-b5507d3af420\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"c69ae4d9-9663-40c1-ab14-bf600cda66c3\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": true, \"dateAdded\": \"2025-05-03T11:54:36+00:00\", \"inputType\": null, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": []}','2025-05-03 11:56:16','2025-05-04 14:23:44',NULL,'c1805f47-7d20-47d4-8ae0-99427a38111c'),(2,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"168c59fd-e818-45ec-811d-7d74774c9138\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"b4dd7357-e4b5-4c5f-bc44-a3942381aaed\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": true, \"dateAdded\": \"2025-05-03T11:55:35+00:00\", \"inputType\": null, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"f81216a3-1ecc-426c-b014-e0a323c0a052\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"12e483f5-2e3d-4508-8d01-558050206ffe\", \"required\": false, \"dateAdded\": \"2025-05-03T13:13:52+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": []}','2025-05-03 11:57:21','2025-05-03 13:13:52','2025-05-04 14:22:54','0a3f4f6b-8ae9-41ea-b7d2-162fd7c07921'),(3,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"04bae4b1-aa27-456a-9da1-61199702ed14\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"0d77459c-6b5e-4021-827e-d60317e8df21\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": \"First Name\", \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": false, \"dateAdded\": \"2025-05-03T11:57:22+00:00\", \"inputType\": null, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"009018f1-2b1f-4378-b2a7-c2fbd98e5d5b\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Surname\", \"width\": 100, \"handle\": \"fd_surname\", \"warning\": null, \"fieldUid\": \"2327a6f6-417b-4334-b051-5d9d0a4d5c02\", \"required\": false, \"dateAdded\": \"2025-05-03T12:06:01+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": []}','2025-05-03 11:59:15','2025-05-03 12:06:01',NULL,'09150776-24e3-4670-96c5-1a820af33407'),(4,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"35320e1e-edb6-451c-b9d7-0c1328ea899c\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"f3cf744a-5f97-4ae2-bdab-5dc600b4f38b\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": \"First Name\", \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": false, \"dateAdded\": \"2025-05-03T12:19:16+00:00\", \"inputType\": null, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"ed5a6c88-1539-4eb5-852a-ea9a60a0a994\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Surname\", \"width\": 100, \"handle\": \"fd_surname\", \"warning\": null, \"fieldUid\": \"2327a6f6-417b-4334-b051-5d9d0a4d5c02\", \"required\": false, \"dateAdded\": \"2025-05-03T12:21:38+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": []}','2025-05-03 12:21:38','2025-05-03 12:21:38',NULL,'0309ad3a-9996-45ae-8320-9783e3b258ec'),(5,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"4480ac2c-cfc5-4835-b132-299332539515\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"bfeeae46-35ae-4396-9fa5-868164aa86da\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": \"Type\", \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": true, \"dateAdded\": \"2025-05-03T14:19:59+00:00\", \"inputType\": null, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": []}','2025-05-03 14:21:43','2025-05-03 14:24:20','2025-05-03 14:37:12','67f65cf4-9748-4723-9482-35595b09a627'),(6,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"ec93e2d8-e4a4-40e1-8acc-7cadbeff68b9\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"81f07ed7-1361-4a19-b775-44ba1c8640d8\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": \"Task Category\", \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": false, \"dateAdded\": \"2025-05-03T14:17:11+00:00\", \"inputType\": null, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"a6604d2f-7828-4a76-a6ae-e168d866c08a\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"926c9451-b01f-419d-8e5f-df54e83a44e4\", \"required\": false, \"dateAdded\": \"2025-05-03T14:22:01+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"76ea19c6-28d9-4b14-94f5-3ab7c2a8c91a\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"b9128e41-d3ab-4a44-b7c1-215cce7e79bb\", \"required\": false, \"dateAdded\": \"2025-05-03T14:36:22+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": []}','2025-05-03 14:22:01','2025-05-03 14:36:22','2025-05-04 14:23:58','f204493c-f3d9-4125-abe1-84c3b6d4d305'),(7,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"9e8b2d8a-a75a-46e6-a8cf-3898e55769b7\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"c553bc7d-dc4b-4b9c-85e7-48da691edc02\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": true, \"dateAdded\": \"2025-05-03T14:27:58+00:00\", \"inputType\": null, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"8d09367d-1648-4d83-a9eb-d760a064854d\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"a5d142a4-e455-4840-837d-102f7c4cc78c\", \"required\": false, \"dateAdded\": \"2025-05-03T14:32:00+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": []}','2025-05-03 14:29:14','2025-05-03 14:32:00','2025-05-04 14:23:07','93ec2811-a8a3-43e3-8c47-d3a5f86b73df'),(8,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"5b2816bb-62f8-4190-a1e7-668f10243504\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"073fb7f2-2153-4c4e-98c5-0f6e7300dbb9\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": \"Department\", \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": false, \"dateAdded\": \"2025-05-03T14:29:48+00:00\", \"inputType\": null, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": []}','2025-05-03 14:31:48','2025-05-03 14:31:48','2025-05-03 14:33:57','a0f01d6d-c05f-4094-8685-194410fceebd'),(9,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"3e3f9d86-7084-4296-993e-a1f437d98e36\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"54dcecea-2d33-48a4-860c-63214f99c312\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": true, \"dateAdded\": \"2025-05-04T14:17:14+00:00\", \"inputType\": null, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": []}','2025-05-04 14:18:24','2025-05-04 14:18:24',NULL,'d9d80786-cc00-4b78-935e-37137fc550d1'),(10,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"f9cc669d-4e71-4f55-a796-d05951362ef3\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"924943a5-2e9e-40db-8d01-58e386935497\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": true, \"dateAdded\": \"2025-05-04T14:17:48+00:00\", \"inputType\": null, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": []}','2025-05-04 14:18:58','2025-05-04 14:18:58','2025-05-04 14:23:51','9d7bacf4-3699-4020-ba91-2d010047389b'),(11,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"df6fcf85-c580-4960-9d3c-50bb8b8a45b3\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"2511979a-f4db-4257-a792-44fe9c640bc8\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": true, \"dateAdded\": \"2025-05-04T14:56:30+00:00\", \"inputType\": null, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": []}','2025-05-04 14:57:39','2025-05-04 14:57:39',NULL,'f82ffbf3-62ac-4d87-b915-c5e13b277e75'),(12,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"eba244e0-5462-4663-ad73-985abf92dc5d\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"9130a574-e4da-41e6-8c18-d8489699e6b4\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": true, \"dateAdded\": \"2025-05-04T15:50:56+00:00\", \"inputType\": null, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": []}','2025-05-04 15:52:11','2025-05-04 15:52:11',NULL,'36442561-db6c-4d0a-9af8-57caa6ae6875');
/*!40000 ALTER TABLE `fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fields` VALUES (1,'Plain Text','fd_plainText','global',NULL,NULL,0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2025-05-03 12:05:24','2025-05-03 12:05:24',NULL,'2327a6f6-417b-4334-b051-5d9d0a4d5c02'),(2,'Building','fd_entbuilding','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Entries','{\"allowSelfRelations\":false,\"branchLimit\":null,\"defaultPlacement\":\"end\",\"maintainHierarchy\":false,\"maxRelations\":1,\"minRelations\":null,\"selectionLabel\":null,\"showCardsInGrid\":false,\"showSiteMenu\":false,\"showUnpermittedEntries\":false,\"showUnpermittedSections\":false,\"sources\":[\"section:5f52388b-f9f4-4132-81c1-55802c67d8cc\"],\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2025-05-03 13:13:48','2025-05-03 13:13:48',NULL,'12e483f5-2e3d-4508-8d01-558050206ffe'),(3,'Departments','fd_entdepartments','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Entries','{\"allowSelfRelations\":false,\"branchLimit\":null,\"defaultPlacement\":\"end\",\"maintainHierarchy\":false,\"maxRelations\":null,\"minRelations\":null,\"selectionLabel\":null,\"showCardsInGrid\":false,\"showSiteMenu\":false,\"showUnpermittedEntries\":false,\"showUnpermittedSections\":false,\"sources\":[\"section:ceac8342-76fb-422f-a0a3-efb6a2e94704\"],\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2025-05-03 13:14:22','2025-05-03 13:14:22',NULL,'9b23eb2f-c8ff-451c-8081-3368f7e59312'),(4,'Task Types','mxTaskTypes','global',NULL,NULL,0,'site',NULL,'craft\\fields\\Matrix','{\"createButtonLabel\":\"New Type\",\"defaultIndexViewMode\":\"cards\",\"enableVersioning\":false,\"entryTypes\":[{\"uid\":\"5ee293b5-2932-4312-b446-c524f9c49ba3\",\"name\":\"MX Tasks\",\"handle\":\"mxTasks\"}],\"includeTableView\":false,\"maxEntries\":null,\"minEntries\":null,\"pageSize\":null,\"propagationKeyFormat\":null,\"propagationMethod\":\"all\",\"showCardsInGrid\":false,\"viewMode\":\"blocks\"}','2025-05-03 14:21:58','2025-05-03 14:26:28','2025-05-03 14:37:28','926c9451-b01f-419d-8e5f-df54e83a44e4'),(5,'Departments','mxDepartments','global',NULL,NULL,0,'site',NULL,'craft\\fields\\Matrix','{\"createButtonLabel\":\"Add Department\",\"defaultIndexViewMode\":\"cards\",\"enableVersioning\":false,\"entryTypes\":[{\"uid\":\"f4c80c9b-04e0-4b82-b12b-5deed653b381\"}],\"includeTableView\":false,\"maxEntries\":null,\"minEntries\":null,\"pageSize\":null,\"propagationKeyFormat\":null,\"propagationMethod\":\"all\",\"showCardsInGrid\":false,\"viewMode\":\"blocks\"}','2025-05-03 14:31:56','2025-05-03 14:32:55',NULL,'a5d142a4-e455-4840-837d-102f7c4cc78c'),(6,'Task Types','taskTypes','global',NULL,NULL,0,'site',NULL,'craft\\fields\\Matrix','{\"createButtonLabel\":null,\"defaultIndexViewMode\":\"cards\",\"enableVersioning\":false,\"entryTypes\":[{\"uid\":\"cfd34809-4c28-4aeb-98fa-8fd478b892ab\"}],\"includeTableView\":false,\"maxEntries\":null,\"minEntries\":null,\"pageSize\":null,\"propagationKeyFormat\":null,\"propagationMethod\":\"all\",\"showCardsInGrid\":false,\"viewMode\":\"blocks\"}','2025-05-03 14:36:19','2025-05-04 14:10:46','2025-05-04 14:12:03','b9128e41-d3ab-4a44-b7c1-215cce7e79bb');
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
INSERT INTO `info` VALUES (1,'5.7.4','5.7.0.3',0,'itzagdvmpeiv','3@nnwtmlmnuu','2025-05-03 11:51:40','2025-05-04 15:52:28','1aaf0767-dd85-4fbf-a8d9-5070ca6ece57');
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
INSERT INTO `projectconfig` VALUES ('dateModified','1746373948'),('elementSources.craft\\elements\\Entry.0.defaultSort.0','\"postDate\"'),('elementSources.craft\\elements\\Entry.0.defaultSort.1','\"desc\"'),('elementSources.craft\\elements\\Entry.0.defaultViewMode','\"\"'),('elementSources.craft\\elements\\Entry.0.disabled','false'),('elementSources.craft\\elements\\Entry.0.key','\"*\"'),('elementSources.craft\\elements\\Entry.0.tableAttributes.0','\"status\"'),('elementSources.craft\\elements\\Entry.0.tableAttributes.1','\"section\"'),('elementSources.craft\\elements\\Entry.0.tableAttributes.2','\"postDate\"'),('elementSources.craft\\elements\\Entry.0.tableAttributes.3','\"expiryDate\"'),('elementSources.craft\\elements\\Entry.0.tableAttributes.4','\"link\"'),('elementSources.craft\\elements\\Entry.0.type','\"native\"'),('elementSources.craft\\elements\\Entry.1.defaultSort.0','\"structure\"'),('elementSources.craft\\elements\\Entry.1.defaultSort.1','\"asc\"'),('elementSources.craft\\elements\\Entry.1.defaultViewMode','\"\"'),('elementSources.craft\\elements\\Entry.1.disabled','false'),('elementSources.craft\\elements\\Entry.1.key','\"section:5f52388b-f9f4-4132-81c1-55802c67d8cc\"'),('elementSources.craft\\elements\\Entry.1.tableAttributes.0','\"status\"'),('elementSources.craft\\elements\\Entry.1.type','\"native\"'),('elementSources.craft\\elements\\Entry.2.defaultSort.0','\"structure\"'),('elementSources.craft\\elements\\Entry.2.defaultSort.1','\"asc\"'),('elementSources.craft\\elements\\Entry.2.defaultViewMode','\"\"'),('elementSources.craft\\elements\\Entry.2.disabled','false'),('elementSources.craft\\elements\\Entry.2.key','\"section:69dbc207-8618-4a1c-8b63-1de6ba30badb\"'),('elementSources.craft\\elements\\Entry.2.tableAttributes.0','\"status\"'),('elementSources.craft\\elements\\Entry.2.tableAttributes.1','\"postDate\"'),('elementSources.craft\\elements\\Entry.2.tableAttributes.2','\"expiryDate\"'),('elementSources.craft\\elements\\Entry.2.tableAttributes.3','\"link\"'),('elementSources.craft\\elements\\Entry.2.type','\"native\"'),('elementSources.craft\\elements\\Entry.3.key','\"section:f44b07d1-48b3-48fe-8bfe-f8f12f5ed053\"'),('elementSources.craft\\elements\\Entry.3.type','\"native\"'),('elementSources.craft\\elements\\Entry.4.key','\"section:b1d95329-57ac-49cf-90d7-b40a1bdbcd01\"'),('elementSources.craft\\elements\\Entry.4.type','\"native\"'),('elementSources.craft\\elements\\Entry.5.key','\"section:ceac8342-76fb-422f-a0a3-efb6a2e94704\"'),('elementSources.craft\\elements\\Entry.5.type','\"native\"'),('email.fromEmail','\"access@hypha.media\"'),('email.fromName','\"Porter Craft\"'),('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.color','null'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elementCondition','null'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.0.autocapitalize','true'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.0.autocomplete','false'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.0.autocorrect','true'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.0.class','null'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.0.dateAdded','\"2025-05-03T12:19:16+00:00\"'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.0.disabled','false'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.0.elementCondition','null'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.0.id','null'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.0.includeInCards','false'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.0.inputType','null'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.0.instructions','null'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.0.label','\"First Name\"'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.0.max','null'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.0.min','null'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.0.name','null'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.0.orientation','null'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.0.placeholder','null'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.0.providesThumbs','false'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.0.readonly','false'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.0.required','false'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.0.size','null'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.0.step','null'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.0.tip','null'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.0.title','null'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.0.uid','\"f3cf744a-5f97-4ae2-bdab-5dc600b4f38b\"'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.0.userCondition','null'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.0.warning','null'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.0.width','100'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.1.dateAdded','\"2025-05-03T12:21:38+00:00\"'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.1.editCondition','null'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.1.elementCondition','null'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.1.fieldUid','\"2327a6f6-417b-4334-b051-5d9d0a4d5c02\"'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.1.handle','\"fd_surname\"'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.1.includeInCards','false'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.1.instructions','null'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.1.label','\"Surname\"'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.1.providesThumbs','false'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.1.required','false'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.1.tip','null'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.1.uid','\"ed5a6c88-1539-4eb5-852a-ea9a60a0a994\"'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.1.userCondition','null'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.1.warning','null'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.elements.1.width','100'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.name','\"Content\"'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.uid','\"35320e1e-edb6-451c-b9d7-0c1328ea899c\"'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.fieldLayouts.0309ad3a-9996-45ae-8320-9783e3b258ec.tabs.0.userCondition','null'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.handle','\"entSupervisors\"'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.hasTitleField','true'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.icon','\"clipboard\"'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.name','\"Ent Supervisors\"'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.showSlugField','true'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.showStatusField','true'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.slugTranslationKeyFormat','null'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.slugTranslationMethod','\"site\"'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.titleFormat','null'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.titleTranslationKeyFormat','null'),('entryTypes.0ddc1c53-595b-487f-8473-eece2e4861de.titleTranslationMethod','\"site\"'),('entryTypes.1fefe862-852d-49ba-83cb-906b289365ac.color','null'),('entryTypes.1fefe862-852d-49ba-83cb-906b289365ac.fieldLayouts.36442561-db6c-4d0a-9af8-57caa6ae6875.tabs.0.elementCondition','null'),('entryTypes.1fefe862-852d-49ba-83cb-906b289365ac.fieldLayouts.36442561-db6c-4d0a-9af8-57caa6ae6875.tabs.0.elements.0.autocapitalize','true'),('entryTypes.1fefe862-852d-49ba-83cb-906b289365ac.fieldLayouts.36442561-db6c-4d0a-9af8-57caa6ae6875.tabs.0.elements.0.autocomplete','false'),('entryTypes.1fefe862-852d-49ba-83cb-906b289365ac.fieldLayouts.36442561-db6c-4d0a-9af8-57caa6ae6875.tabs.0.elements.0.autocorrect','true'),('entryTypes.1fefe862-852d-49ba-83cb-906b289365ac.fieldLayouts.36442561-db6c-4d0a-9af8-57caa6ae6875.tabs.0.elements.0.class','null'),('entryTypes.1fefe862-852d-49ba-83cb-906b289365ac.fieldLayouts.36442561-db6c-4d0a-9af8-57caa6ae6875.tabs.0.elements.0.dateAdded','\"2025-05-04T15:50:56+00:00\"'),('entryTypes.1fefe862-852d-49ba-83cb-906b289365ac.fieldLayouts.36442561-db6c-4d0a-9af8-57caa6ae6875.tabs.0.elements.0.disabled','false'),('entryTypes.1fefe862-852d-49ba-83cb-906b289365ac.fieldLayouts.36442561-db6c-4d0a-9af8-57caa6ae6875.tabs.0.elements.0.elementCondition','null'),('entryTypes.1fefe862-852d-49ba-83cb-906b289365ac.fieldLayouts.36442561-db6c-4d0a-9af8-57caa6ae6875.tabs.0.elements.0.id','null'),('entryTypes.1fefe862-852d-49ba-83cb-906b289365ac.fieldLayouts.36442561-db6c-4d0a-9af8-57caa6ae6875.tabs.0.elements.0.includeInCards','false'),('entryTypes.1fefe862-852d-49ba-83cb-906b289365ac.fieldLayouts.36442561-db6c-4d0a-9af8-57caa6ae6875.tabs.0.elements.0.inputType','null'),('entryTypes.1fefe862-852d-49ba-83cb-906b289365ac.fieldLayouts.36442561-db6c-4d0a-9af8-57caa6ae6875.tabs.0.elements.0.instructions','null'),('entryTypes.1fefe862-852d-49ba-83cb-906b289365ac.fieldLayouts.36442561-db6c-4d0a-9af8-57caa6ae6875.tabs.0.elements.0.label','null'),('entryTypes.1fefe862-852d-49ba-83cb-906b289365ac.fieldLayouts.36442561-db6c-4d0a-9af8-57caa6ae6875.tabs.0.elements.0.max','null'),('entryTypes.1fefe862-852d-49ba-83cb-906b289365ac.fieldLayouts.36442561-db6c-4d0a-9af8-57caa6ae6875.tabs.0.elements.0.min','null'),('entryTypes.1fefe862-852d-49ba-83cb-906b289365ac.fieldLayouts.36442561-db6c-4d0a-9af8-57caa6ae6875.tabs.0.elements.0.name','null'),('entryTypes.1fefe862-852d-49ba-83cb-906b289365ac.fieldLayouts.36442561-db6c-4d0a-9af8-57caa6ae6875.tabs.0.elements.0.orientation','null'),('entryTypes.1fefe862-852d-49ba-83cb-906b289365ac.fieldLayouts.36442561-db6c-4d0a-9af8-57caa6ae6875.tabs.0.elements.0.placeholder','null'),('entryTypes.1fefe862-852d-49ba-83cb-906b289365ac.fieldLayouts.36442561-db6c-4d0a-9af8-57caa6ae6875.tabs.0.elements.0.providesThumbs','false'),('entryTypes.1fefe862-852d-49ba-83cb-906b289365ac.fieldLayouts.36442561-db6c-4d0a-9af8-57caa6ae6875.tabs.0.elements.0.readonly','false'),('entryTypes.1fefe862-852d-49ba-83cb-906b289365ac.fieldLayouts.36442561-db6c-4d0a-9af8-57caa6ae6875.tabs.0.elements.0.required','true'),('entryTypes.1fefe862-852d-49ba-83cb-906b289365ac.fieldLayouts.36442561-db6c-4d0a-9af8-57caa6ae6875.tabs.0.elements.0.size','null'),('entryTypes.1fefe862-852d-49ba-83cb-906b289365ac.fieldLayouts.36442561-db6c-4d0a-9af8-57caa6ae6875.tabs.0.elements.0.step','null'),('entryTypes.1fefe862-852d-49ba-83cb-906b289365ac.fieldLayouts.36442561-db6c-4d0a-9af8-57caa6ae6875.tabs.0.elements.0.tip','null'),('entryTypes.1fefe862-852d-49ba-83cb-906b289365ac.fieldLayouts.36442561-db6c-4d0a-9af8-57caa6ae6875.tabs.0.elements.0.title','null'),('entryTypes.1fefe862-852d-49ba-83cb-906b289365ac.fieldLayouts.36442561-db6c-4d0a-9af8-57caa6ae6875.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.1fefe862-852d-49ba-83cb-906b289365ac.fieldLayouts.36442561-db6c-4d0a-9af8-57caa6ae6875.tabs.0.elements.0.uid','\"9130a574-e4da-41e6-8c18-d8489699e6b4\"'),('entryTypes.1fefe862-852d-49ba-83cb-906b289365ac.fieldLayouts.36442561-db6c-4d0a-9af8-57caa6ae6875.tabs.0.elements.0.userCondition','null'),('entryTypes.1fefe862-852d-49ba-83cb-906b289365ac.fieldLayouts.36442561-db6c-4d0a-9af8-57caa6ae6875.tabs.0.elements.0.warning','null'),('entryTypes.1fefe862-852d-49ba-83cb-906b289365ac.fieldLayouts.36442561-db6c-4d0a-9af8-57caa6ae6875.tabs.0.elements.0.width','100'),('entryTypes.1fefe862-852d-49ba-83cb-906b289365ac.fieldLayouts.36442561-db6c-4d0a-9af8-57caa6ae6875.tabs.0.name','\"Content\"'),('entryTypes.1fefe862-852d-49ba-83cb-906b289365ac.fieldLayouts.36442561-db6c-4d0a-9af8-57caa6ae6875.tabs.0.uid','\"eba244e0-5462-4663-ad73-985abf92dc5d\"'),('entryTypes.1fefe862-852d-49ba-83cb-906b289365ac.fieldLayouts.36442561-db6c-4d0a-9af8-57caa6ae6875.tabs.0.userCondition','null'),('entryTypes.1fefe862-852d-49ba-83cb-906b289365ac.handle','\"entTasks\"'),('entryTypes.1fefe862-852d-49ba-83cb-906b289365ac.hasTitleField','true'),('entryTypes.1fefe862-852d-49ba-83cb-906b289365ac.icon','\"check\"'),('entryTypes.1fefe862-852d-49ba-83cb-906b289365ac.name','\"ENT Tasks\"'),('entryTypes.1fefe862-852d-49ba-83cb-906b289365ac.showSlugField','true'),('entryTypes.1fefe862-852d-49ba-83cb-906b289365ac.showStatusField','true'),('entryTypes.1fefe862-852d-49ba-83cb-906b289365ac.slugTranslationKeyFormat','null'),('entryTypes.1fefe862-852d-49ba-83cb-906b289365ac.slugTranslationMethod','\"site\"'),('entryTypes.1fefe862-852d-49ba-83cb-906b289365ac.titleFormat','null'),('entryTypes.1fefe862-852d-49ba-83cb-906b289365ac.titleTranslationKeyFormat','null'),('entryTypes.1fefe862-852d-49ba-83cb-906b289365ac.titleTranslationMethod','\"site\"'),('entryTypes.a029653d-b401-4157-b33a-c398463b10b2.color','null'),('entryTypes.a029653d-b401-4157-b33a-c398463b10b2.fieldLayouts.d9d80786-cc00-4b78-935e-37137fc550d1.tabs.0.elementCondition','null'),('entryTypes.a029653d-b401-4157-b33a-c398463b10b2.fieldLayouts.d9d80786-cc00-4b78-935e-37137fc550d1.tabs.0.elements.0.autocapitalize','true'),('entryTypes.a029653d-b401-4157-b33a-c398463b10b2.fieldLayouts.d9d80786-cc00-4b78-935e-37137fc550d1.tabs.0.elements.0.autocomplete','false'),('entryTypes.a029653d-b401-4157-b33a-c398463b10b2.fieldLayouts.d9d80786-cc00-4b78-935e-37137fc550d1.tabs.0.elements.0.autocorrect','true'),('entryTypes.a029653d-b401-4157-b33a-c398463b10b2.fieldLayouts.d9d80786-cc00-4b78-935e-37137fc550d1.tabs.0.elements.0.class','null'),('entryTypes.a029653d-b401-4157-b33a-c398463b10b2.fieldLayouts.d9d80786-cc00-4b78-935e-37137fc550d1.tabs.0.elements.0.dateAdded','\"2025-05-04T14:17:14+00:00\"'),('entryTypes.a029653d-b401-4157-b33a-c398463b10b2.fieldLayouts.d9d80786-cc00-4b78-935e-37137fc550d1.tabs.0.elements.0.disabled','false'),('entryTypes.a029653d-b401-4157-b33a-c398463b10b2.fieldLayouts.d9d80786-cc00-4b78-935e-37137fc550d1.tabs.0.elements.0.elementCondition','null'),('entryTypes.a029653d-b401-4157-b33a-c398463b10b2.fieldLayouts.d9d80786-cc00-4b78-935e-37137fc550d1.tabs.0.elements.0.id','null'),('entryTypes.a029653d-b401-4157-b33a-c398463b10b2.fieldLayouts.d9d80786-cc00-4b78-935e-37137fc550d1.tabs.0.elements.0.includeInCards','false'),('entryTypes.a029653d-b401-4157-b33a-c398463b10b2.fieldLayouts.d9d80786-cc00-4b78-935e-37137fc550d1.tabs.0.elements.0.inputType','null'),('entryTypes.a029653d-b401-4157-b33a-c398463b10b2.fieldLayouts.d9d80786-cc00-4b78-935e-37137fc550d1.tabs.0.elements.0.instructions','null'),('entryTypes.a029653d-b401-4157-b33a-c398463b10b2.fieldLayouts.d9d80786-cc00-4b78-935e-37137fc550d1.tabs.0.elements.0.label','null'),('entryTypes.a029653d-b401-4157-b33a-c398463b10b2.fieldLayouts.d9d80786-cc00-4b78-935e-37137fc550d1.tabs.0.elements.0.max','null'),('entryTypes.a029653d-b401-4157-b33a-c398463b10b2.fieldLayouts.d9d80786-cc00-4b78-935e-37137fc550d1.tabs.0.elements.0.min','null'),('entryTypes.a029653d-b401-4157-b33a-c398463b10b2.fieldLayouts.d9d80786-cc00-4b78-935e-37137fc550d1.tabs.0.elements.0.name','null'),('entryTypes.a029653d-b401-4157-b33a-c398463b10b2.fieldLayouts.d9d80786-cc00-4b78-935e-37137fc550d1.tabs.0.elements.0.orientation','null'),('entryTypes.a029653d-b401-4157-b33a-c398463b10b2.fieldLayouts.d9d80786-cc00-4b78-935e-37137fc550d1.tabs.0.elements.0.placeholder','null'),('entryTypes.a029653d-b401-4157-b33a-c398463b10b2.fieldLayouts.d9d80786-cc00-4b78-935e-37137fc550d1.tabs.0.elements.0.providesThumbs','false'),('entryTypes.a029653d-b401-4157-b33a-c398463b10b2.fieldLayouts.d9d80786-cc00-4b78-935e-37137fc550d1.tabs.0.elements.0.readonly','false'),('entryTypes.a029653d-b401-4157-b33a-c398463b10b2.fieldLayouts.d9d80786-cc00-4b78-935e-37137fc550d1.tabs.0.elements.0.required','true'),('entryTypes.a029653d-b401-4157-b33a-c398463b10b2.fieldLayouts.d9d80786-cc00-4b78-935e-37137fc550d1.tabs.0.elements.0.size','null'),('entryTypes.a029653d-b401-4157-b33a-c398463b10b2.fieldLayouts.d9d80786-cc00-4b78-935e-37137fc550d1.tabs.0.elements.0.step','null'),('entryTypes.a029653d-b401-4157-b33a-c398463b10b2.fieldLayouts.d9d80786-cc00-4b78-935e-37137fc550d1.tabs.0.elements.0.tip','null'),('entryTypes.a029653d-b401-4157-b33a-c398463b10b2.fieldLayouts.d9d80786-cc00-4b78-935e-37137fc550d1.tabs.0.elements.0.title','null'),('entryTypes.a029653d-b401-4157-b33a-c398463b10b2.fieldLayouts.d9d80786-cc00-4b78-935e-37137fc550d1.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.a029653d-b401-4157-b33a-c398463b10b2.fieldLayouts.d9d80786-cc00-4b78-935e-37137fc550d1.tabs.0.elements.0.uid','\"54dcecea-2d33-48a4-860c-63214f99c312\"'),('entryTypes.a029653d-b401-4157-b33a-c398463b10b2.fieldLayouts.d9d80786-cc00-4b78-935e-37137fc550d1.tabs.0.elements.0.userCondition','null'),('entryTypes.a029653d-b401-4157-b33a-c398463b10b2.fieldLayouts.d9d80786-cc00-4b78-935e-37137fc550d1.tabs.0.elements.0.warning','null'),('entryTypes.a029653d-b401-4157-b33a-c398463b10b2.fieldLayouts.d9d80786-cc00-4b78-935e-37137fc550d1.tabs.0.elements.0.width','100'),('entryTypes.a029653d-b401-4157-b33a-c398463b10b2.fieldLayouts.d9d80786-cc00-4b78-935e-37137fc550d1.tabs.0.name','\"Content\"'),('entryTypes.a029653d-b401-4157-b33a-c398463b10b2.fieldLayouts.d9d80786-cc00-4b78-935e-37137fc550d1.tabs.0.uid','\"3e3f9d86-7084-4296-993e-a1f437d98e36\"'),('entryTypes.a029653d-b401-4157-b33a-c398463b10b2.fieldLayouts.d9d80786-cc00-4b78-935e-37137fc550d1.tabs.0.userCondition','null'),('entryTypes.a029653d-b401-4157-b33a-c398463b10b2.handle','\"taskCategories\"'),('entryTypes.a029653d-b401-4157-b33a-c398463b10b2.hasTitleField','true'),('entryTypes.a029653d-b401-4157-b33a-c398463b10b2.icon','\"list\"'),('entryTypes.a029653d-b401-4157-b33a-c398463b10b2.name','\"Task Categories\"'),('entryTypes.a029653d-b401-4157-b33a-c398463b10b2.showSlugField','true'),('entryTypes.a029653d-b401-4157-b33a-c398463b10b2.showStatusField','true'),('entryTypes.a029653d-b401-4157-b33a-c398463b10b2.slugTranslationKeyFormat','null'),('entryTypes.a029653d-b401-4157-b33a-c398463b10b2.slugTranslationMethod','\"site\"'),('entryTypes.a029653d-b401-4157-b33a-c398463b10b2.titleFormat','null'),('entryTypes.a029653d-b401-4157-b33a-c398463b10b2.titleTranslationKeyFormat','null'),('entryTypes.a029653d-b401-4157-b33a-c398463b10b2.titleTranslationMethod','\"site\"'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.color','null'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.fieldLayouts.c1805f47-7d20-47d4-8ae0-99427a38111c.tabs.0.elementCondition','null'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.fieldLayouts.c1805f47-7d20-47d4-8ae0-99427a38111c.tabs.0.elements.0.autocapitalize','true'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.fieldLayouts.c1805f47-7d20-47d4-8ae0-99427a38111c.tabs.0.elements.0.autocomplete','false'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.fieldLayouts.c1805f47-7d20-47d4-8ae0-99427a38111c.tabs.0.elements.0.autocorrect','true'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.fieldLayouts.c1805f47-7d20-47d4-8ae0-99427a38111c.tabs.0.elements.0.class','null'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.fieldLayouts.c1805f47-7d20-47d4-8ae0-99427a38111c.tabs.0.elements.0.dateAdded','\"2025-05-03T11:54:36+00:00\"'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.fieldLayouts.c1805f47-7d20-47d4-8ae0-99427a38111c.tabs.0.elements.0.disabled','false'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.fieldLayouts.c1805f47-7d20-47d4-8ae0-99427a38111c.tabs.0.elements.0.elementCondition','null'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.fieldLayouts.c1805f47-7d20-47d4-8ae0-99427a38111c.tabs.0.elements.0.id','null'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.fieldLayouts.c1805f47-7d20-47d4-8ae0-99427a38111c.tabs.0.elements.0.includeInCards','false'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.fieldLayouts.c1805f47-7d20-47d4-8ae0-99427a38111c.tabs.0.elements.0.inputType','null'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.fieldLayouts.c1805f47-7d20-47d4-8ae0-99427a38111c.tabs.0.elements.0.instructions','null'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.fieldLayouts.c1805f47-7d20-47d4-8ae0-99427a38111c.tabs.0.elements.0.label','null'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.fieldLayouts.c1805f47-7d20-47d4-8ae0-99427a38111c.tabs.0.elements.0.max','null'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.fieldLayouts.c1805f47-7d20-47d4-8ae0-99427a38111c.tabs.0.elements.0.min','null'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.fieldLayouts.c1805f47-7d20-47d4-8ae0-99427a38111c.tabs.0.elements.0.name','null'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.fieldLayouts.c1805f47-7d20-47d4-8ae0-99427a38111c.tabs.0.elements.0.orientation','null'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.fieldLayouts.c1805f47-7d20-47d4-8ae0-99427a38111c.tabs.0.elements.0.placeholder','null'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.fieldLayouts.c1805f47-7d20-47d4-8ae0-99427a38111c.tabs.0.elements.0.providesThumbs','false'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.fieldLayouts.c1805f47-7d20-47d4-8ae0-99427a38111c.tabs.0.elements.0.readonly','false'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.fieldLayouts.c1805f47-7d20-47d4-8ae0-99427a38111c.tabs.0.elements.0.required','true'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.fieldLayouts.c1805f47-7d20-47d4-8ae0-99427a38111c.tabs.0.elements.0.size','null'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.fieldLayouts.c1805f47-7d20-47d4-8ae0-99427a38111c.tabs.0.elements.0.step','null'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.fieldLayouts.c1805f47-7d20-47d4-8ae0-99427a38111c.tabs.0.elements.0.tip','null'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.fieldLayouts.c1805f47-7d20-47d4-8ae0-99427a38111c.tabs.0.elements.0.title','null'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.fieldLayouts.c1805f47-7d20-47d4-8ae0-99427a38111c.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.fieldLayouts.c1805f47-7d20-47d4-8ae0-99427a38111c.tabs.0.elements.0.uid','\"c69ae4d9-9663-40c1-ab14-bf600cda66c3\"'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.fieldLayouts.c1805f47-7d20-47d4-8ae0-99427a38111c.tabs.0.elements.0.userCondition','null'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.fieldLayouts.c1805f47-7d20-47d4-8ae0-99427a38111c.tabs.0.elements.0.warning','null'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.fieldLayouts.c1805f47-7d20-47d4-8ae0-99427a38111c.tabs.0.elements.0.width','100'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.fieldLayouts.c1805f47-7d20-47d4-8ae0-99427a38111c.tabs.0.name','\"Content\"'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.fieldLayouts.c1805f47-7d20-47d4-8ae0-99427a38111c.tabs.0.uid','\"764fa209-1710-4061-adde-b5507d3af420\"'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.fieldLayouts.c1805f47-7d20-47d4-8ae0-99427a38111c.tabs.0.userCondition','null'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.handle','\"entLocations\"'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.hasTitleField','true'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.icon','\"apartment\"'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.name','\"Ent Locations\"'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.showSlugField','true'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.showStatusField','true'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.slugTranslationKeyFormat','null'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.slugTranslationMethod','\"site\"'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.titleFormat','null'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.titleTranslationKeyFormat','null'),('entryTypes.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d.titleTranslationMethod','\"site\"'),('entryTypes.a77bbb05-d771-4014-ae5a-7e0b5e8be34b.color','null'),('entryTypes.a77bbb05-d771-4014-ae5a-7e0b5e8be34b.fieldLayouts.f82ffbf3-62ac-4d87-b915-c5e13b277e75.tabs.0.elementCondition','null'),('entryTypes.a77bbb05-d771-4014-ae5a-7e0b5e8be34b.fieldLayouts.f82ffbf3-62ac-4d87-b915-c5e13b277e75.tabs.0.elements.0.autocapitalize','true'),('entryTypes.a77bbb05-d771-4014-ae5a-7e0b5e8be34b.fieldLayouts.f82ffbf3-62ac-4d87-b915-c5e13b277e75.tabs.0.elements.0.autocomplete','false'),('entryTypes.a77bbb05-d771-4014-ae5a-7e0b5e8be34b.fieldLayouts.f82ffbf3-62ac-4d87-b915-c5e13b277e75.tabs.0.elements.0.autocorrect','true'),('entryTypes.a77bbb05-d771-4014-ae5a-7e0b5e8be34b.fieldLayouts.f82ffbf3-62ac-4d87-b915-c5e13b277e75.tabs.0.elements.0.class','null'),('entryTypes.a77bbb05-d771-4014-ae5a-7e0b5e8be34b.fieldLayouts.f82ffbf3-62ac-4d87-b915-c5e13b277e75.tabs.0.elements.0.dateAdded','\"2025-05-04T14:56:30+00:00\"'),('entryTypes.a77bbb05-d771-4014-ae5a-7e0b5e8be34b.fieldLayouts.f82ffbf3-62ac-4d87-b915-c5e13b277e75.tabs.0.elements.0.disabled','false'),('entryTypes.a77bbb05-d771-4014-ae5a-7e0b5e8be34b.fieldLayouts.f82ffbf3-62ac-4d87-b915-c5e13b277e75.tabs.0.elements.0.elementCondition','null'),('entryTypes.a77bbb05-d771-4014-ae5a-7e0b5e8be34b.fieldLayouts.f82ffbf3-62ac-4d87-b915-c5e13b277e75.tabs.0.elements.0.id','null'),('entryTypes.a77bbb05-d771-4014-ae5a-7e0b5e8be34b.fieldLayouts.f82ffbf3-62ac-4d87-b915-c5e13b277e75.tabs.0.elements.0.includeInCards','false'),('entryTypes.a77bbb05-d771-4014-ae5a-7e0b5e8be34b.fieldLayouts.f82ffbf3-62ac-4d87-b915-c5e13b277e75.tabs.0.elements.0.inputType','null'),('entryTypes.a77bbb05-d771-4014-ae5a-7e0b5e8be34b.fieldLayouts.f82ffbf3-62ac-4d87-b915-c5e13b277e75.tabs.0.elements.0.instructions','null'),('entryTypes.a77bbb05-d771-4014-ae5a-7e0b5e8be34b.fieldLayouts.f82ffbf3-62ac-4d87-b915-c5e13b277e75.tabs.0.elements.0.label','null'),('entryTypes.a77bbb05-d771-4014-ae5a-7e0b5e8be34b.fieldLayouts.f82ffbf3-62ac-4d87-b915-c5e13b277e75.tabs.0.elements.0.max','null'),('entryTypes.a77bbb05-d771-4014-ae5a-7e0b5e8be34b.fieldLayouts.f82ffbf3-62ac-4d87-b915-c5e13b277e75.tabs.0.elements.0.min','null'),('entryTypes.a77bbb05-d771-4014-ae5a-7e0b5e8be34b.fieldLayouts.f82ffbf3-62ac-4d87-b915-c5e13b277e75.tabs.0.elements.0.name','null'),('entryTypes.a77bbb05-d771-4014-ae5a-7e0b5e8be34b.fieldLayouts.f82ffbf3-62ac-4d87-b915-c5e13b277e75.tabs.0.elements.0.orientation','null'),('entryTypes.a77bbb05-d771-4014-ae5a-7e0b5e8be34b.fieldLayouts.f82ffbf3-62ac-4d87-b915-c5e13b277e75.tabs.0.elements.0.placeholder','null'),('entryTypes.a77bbb05-d771-4014-ae5a-7e0b5e8be34b.fieldLayouts.f82ffbf3-62ac-4d87-b915-c5e13b277e75.tabs.0.elements.0.providesThumbs','false'),('entryTypes.a77bbb05-d771-4014-ae5a-7e0b5e8be34b.fieldLayouts.f82ffbf3-62ac-4d87-b915-c5e13b277e75.tabs.0.elements.0.readonly','false'),('entryTypes.a77bbb05-d771-4014-ae5a-7e0b5e8be34b.fieldLayouts.f82ffbf3-62ac-4d87-b915-c5e13b277e75.tabs.0.elements.0.required','true'),('entryTypes.a77bbb05-d771-4014-ae5a-7e0b5e8be34b.fieldLayouts.f82ffbf3-62ac-4d87-b915-c5e13b277e75.tabs.0.elements.0.size','null'),('entryTypes.a77bbb05-d771-4014-ae5a-7e0b5e8be34b.fieldLayouts.f82ffbf3-62ac-4d87-b915-c5e13b277e75.tabs.0.elements.0.step','null'),('entryTypes.a77bbb05-d771-4014-ae5a-7e0b5e8be34b.fieldLayouts.f82ffbf3-62ac-4d87-b915-c5e13b277e75.tabs.0.elements.0.tip','null'),('entryTypes.a77bbb05-d771-4014-ae5a-7e0b5e8be34b.fieldLayouts.f82ffbf3-62ac-4d87-b915-c5e13b277e75.tabs.0.elements.0.title','null'),('entryTypes.a77bbb05-d771-4014-ae5a-7e0b5e8be34b.fieldLayouts.f82ffbf3-62ac-4d87-b915-c5e13b277e75.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.a77bbb05-d771-4014-ae5a-7e0b5e8be34b.fieldLayouts.f82ffbf3-62ac-4d87-b915-c5e13b277e75.tabs.0.elements.0.uid','\"2511979a-f4db-4257-a792-44fe9c640bc8\"'),('entryTypes.a77bbb05-d771-4014-ae5a-7e0b5e8be34b.fieldLayouts.f82ffbf3-62ac-4d87-b915-c5e13b277e75.tabs.0.elements.0.userCondition','null'),('entryTypes.a77bbb05-d771-4014-ae5a-7e0b5e8be34b.fieldLayouts.f82ffbf3-62ac-4d87-b915-c5e13b277e75.tabs.0.elements.0.warning','null'),('entryTypes.a77bbb05-d771-4014-ae5a-7e0b5e8be34b.fieldLayouts.f82ffbf3-62ac-4d87-b915-c5e13b277e75.tabs.0.elements.0.width','100'),('entryTypes.a77bbb05-d771-4014-ae5a-7e0b5e8be34b.fieldLayouts.f82ffbf3-62ac-4d87-b915-c5e13b277e75.tabs.0.name','\"Content\"'),('entryTypes.a77bbb05-d771-4014-ae5a-7e0b5e8be34b.fieldLayouts.f82ffbf3-62ac-4d87-b915-c5e13b277e75.tabs.0.uid','\"df6fcf85-c580-4960-9d3c-50bb8b8a45b3\"'),('entryTypes.a77bbb05-d771-4014-ae5a-7e0b5e8be34b.fieldLayouts.f82ffbf3-62ac-4d87-b915-c5e13b277e75.tabs.0.userCondition','null'),('entryTypes.a77bbb05-d771-4014-ae5a-7e0b5e8be34b.handle','\"entDepartments\"'),('entryTypes.a77bbb05-d771-4014-ae5a-7e0b5e8be34b.hasTitleField','true'),('entryTypes.a77bbb05-d771-4014-ae5a-7e0b5e8be34b.icon','\"house\"'),('entryTypes.a77bbb05-d771-4014-ae5a-7e0b5e8be34b.name','\"Ent Departments\"'),('entryTypes.a77bbb05-d771-4014-ae5a-7e0b5e8be34b.showSlugField','true'),('entryTypes.a77bbb05-d771-4014-ae5a-7e0b5e8be34b.showStatusField','true'),('entryTypes.a77bbb05-d771-4014-ae5a-7e0b5e8be34b.slugTranslationKeyFormat','null'),('entryTypes.a77bbb05-d771-4014-ae5a-7e0b5e8be34b.slugTranslationMethod','\"site\"'),('entryTypes.a77bbb05-d771-4014-ae5a-7e0b5e8be34b.titleFormat','null'),('entryTypes.a77bbb05-d771-4014-ae5a-7e0b5e8be34b.titleTranslationKeyFormat','null'),('entryTypes.a77bbb05-d771-4014-ae5a-7e0b5e8be34b.titleTranslationMethod','\"site\"'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.color','null'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elementCondition','null'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.0.autocapitalize','true'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.0.autocomplete','false'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.0.autocorrect','true'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.0.class','null'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.0.dateAdded','\"2025-05-03T11:57:22+00:00\"'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.0.disabled','false'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.0.elementCondition','null'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.0.id','null'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.0.includeInCards','false'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.0.inputType','null'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.0.instructions','null'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.0.label','\"First Name\"'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.0.max','null'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.0.min','null'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.0.name','null'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.0.orientation','null'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.0.placeholder','null'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.0.providesThumbs','false'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.0.readonly','false'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.0.required','false'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.0.size','null'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.0.step','null'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.0.tip','null'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.0.title','null'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.0.uid','\"0d77459c-6b5e-4021-827e-d60317e8df21\"'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.0.userCondition','null'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.0.warning','null'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.0.width','100'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.1.dateAdded','\"2025-05-03T12:06:01+00:00\"'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.1.editCondition','null'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.1.elementCondition','null'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.1.fieldUid','\"2327a6f6-417b-4334-b051-5d9d0a4d5c02\"'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.1.handle','\"fd_surname\"'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.1.includeInCards','false'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.1.instructions','null'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.1.label','\"Surname\"'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.1.providesThumbs','false'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.1.required','false'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.1.tip','null'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.1.uid','\"009018f1-2b1f-4378-b2a7-c2fbd98e5d5b\"'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.1.userCondition','null'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.1.warning','null'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.elements.1.width','100'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.name','\"Content\"'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.uid','\"04bae4b1-aa27-456a-9da1-61199702ed14\"'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.fieldLayouts.09150776-24e3-4670-96c5-1a820af33407.tabs.0.userCondition','null'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.handle','\"entPorters\"'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.hasTitleField','true'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.icon','\"person-walking-luggage\"'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.name','\"Ent Porters\"'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.showSlugField','true'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.showStatusField','true'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.slugTranslationKeyFormat','null'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.slugTranslationMethod','\"site\"'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.titleFormat','\"{fd_surname}\"'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.titleTranslationKeyFormat','null'),('entryTypes.fe915955-f57d-4ec4-bf9c-92c417a8e11d.titleTranslationMethod','\"site\"'),('fields.12e483f5-2e3d-4508-8d01-558050206ffe.columnSuffix','null'),('fields.12e483f5-2e3d-4508-8d01-558050206ffe.handle','\"fd_entbuilding\"'),('fields.12e483f5-2e3d-4508-8d01-558050206ffe.instructions','null'),('fields.12e483f5-2e3d-4508-8d01-558050206ffe.name','\"Building\"'),('fields.12e483f5-2e3d-4508-8d01-558050206ffe.searchable','false'),('fields.12e483f5-2e3d-4508-8d01-558050206ffe.settings.allowSelfRelations','false'),('fields.12e483f5-2e3d-4508-8d01-558050206ffe.settings.branchLimit','null'),('fields.12e483f5-2e3d-4508-8d01-558050206ffe.settings.defaultPlacement','\"end\"'),('fields.12e483f5-2e3d-4508-8d01-558050206ffe.settings.maintainHierarchy','false'),('fields.12e483f5-2e3d-4508-8d01-558050206ffe.settings.maxRelations','1'),('fields.12e483f5-2e3d-4508-8d01-558050206ffe.settings.minRelations','null'),('fields.12e483f5-2e3d-4508-8d01-558050206ffe.settings.selectionLabel','null'),('fields.12e483f5-2e3d-4508-8d01-558050206ffe.settings.showCardsInGrid','false'),('fields.12e483f5-2e3d-4508-8d01-558050206ffe.settings.showSiteMenu','false'),('fields.12e483f5-2e3d-4508-8d01-558050206ffe.settings.showUnpermittedEntries','false'),('fields.12e483f5-2e3d-4508-8d01-558050206ffe.settings.showUnpermittedSections','false'),('fields.12e483f5-2e3d-4508-8d01-558050206ffe.settings.sources.0','\"section:5f52388b-f9f4-4132-81c1-55802c67d8cc\"'),('fields.12e483f5-2e3d-4508-8d01-558050206ffe.settings.targetSiteId','null'),('fields.12e483f5-2e3d-4508-8d01-558050206ffe.settings.validateRelatedElements','false'),('fields.12e483f5-2e3d-4508-8d01-558050206ffe.settings.viewMode','\"list\"'),('fields.12e483f5-2e3d-4508-8d01-558050206ffe.translationKeyFormat','null'),('fields.12e483f5-2e3d-4508-8d01-558050206ffe.translationMethod','\"none\"'),('fields.12e483f5-2e3d-4508-8d01-558050206ffe.type','\"craft\\\\fields\\\\Entries\"'),('fields.2327a6f6-417b-4334-b051-5d9d0a4d5c02.columnSuffix','null'),('fields.2327a6f6-417b-4334-b051-5d9d0a4d5c02.handle','\"fd_plainText\"'),('fields.2327a6f6-417b-4334-b051-5d9d0a4d5c02.instructions','null'),('fields.2327a6f6-417b-4334-b051-5d9d0a4d5c02.name','\"Plain Text\"'),('fields.2327a6f6-417b-4334-b051-5d9d0a4d5c02.searchable','false'),('fields.2327a6f6-417b-4334-b051-5d9d0a4d5c02.settings.byteLimit','null'),('fields.2327a6f6-417b-4334-b051-5d9d0a4d5c02.settings.charLimit','null'),('fields.2327a6f6-417b-4334-b051-5d9d0a4d5c02.settings.code','false'),('fields.2327a6f6-417b-4334-b051-5d9d0a4d5c02.settings.initialRows','4'),('fields.2327a6f6-417b-4334-b051-5d9d0a4d5c02.settings.multiline','false'),('fields.2327a6f6-417b-4334-b051-5d9d0a4d5c02.settings.placeholder','null'),('fields.2327a6f6-417b-4334-b051-5d9d0a4d5c02.settings.uiMode','\"normal\"'),('fields.2327a6f6-417b-4334-b051-5d9d0a4d5c02.translationKeyFormat','null'),('fields.2327a6f6-417b-4334-b051-5d9d0a4d5c02.translationMethod','\"none\"'),('fields.2327a6f6-417b-4334-b051-5d9d0a4d5c02.type','\"craft\\\\fields\\\\PlainText\"'),('fields.9b23eb2f-c8ff-451c-8081-3368f7e59312.columnSuffix','null'),('fields.9b23eb2f-c8ff-451c-8081-3368f7e59312.handle','\"fd_entdepartments\"'),('fields.9b23eb2f-c8ff-451c-8081-3368f7e59312.instructions','null'),('fields.9b23eb2f-c8ff-451c-8081-3368f7e59312.name','\"Departments\"'),('fields.9b23eb2f-c8ff-451c-8081-3368f7e59312.searchable','false'),('fields.9b23eb2f-c8ff-451c-8081-3368f7e59312.settings.allowSelfRelations','false'),('fields.9b23eb2f-c8ff-451c-8081-3368f7e59312.settings.branchLimit','null'),('fields.9b23eb2f-c8ff-451c-8081-3368f7e59312.settings.defaultPlacement','\"end\"'),('fields.9b23eb2f-c8ff-451c-8081-3368f7e59312.settings.maintainHierarchy','false'),('fields.9b23eb2f-c8ff-451c-8081-3368f7e59312.settings.maxRelations','null'),('fields.9b23eb2f-c8ff-451c-8081-3368f7e59312.settings.minRelations','null'),('fields.9b23eb2f-c8ff-451c-8081-3368f7e59312.settings.selectionLabel','null'),('fields.9b23eb2f-c8ff-451c-8081-3368f7e59312.settings.showCardsInGrid','false'),('fields.9b23eb2f-c8ff-451c-8081-3368f7e59312.settings.showSiteMenu','false'),('fields.9b23eb2f-c8ff-451c-8081-3368f7e59312.settings.showUnpermittedEntries','false'),('fields.9b23eb2f-c8ff-451c-8081-3368f7e59312.settings.showUnpermittedSections','false'),('fields.9b23eb2f-c8ff-451c-8081-3368f7e59312.settings.sources.0','\"section:ceac8342-76fb-422f-a0a3-efb6a2e94704\"'),('fields.9b23eb2f-c8ff-451c-8081-3368f7e59312.settings.targetSiteId','null'),('fields.9b23eb2f-c8ff-451c-8081-3368f7e59312.settings.validateRelatedElements','false'),('fields.9b23eb2f-c8ff-451c-8081-3368f7e59312.settings.viewMode','\"list\"'),('fields.9b23eb2f-c8ff-451c-8081-3368f7e59312.translationKeyFormat','null'),('fields.9b23eb2f-c8ff-451c-8081-3368f7e59312.translationMethod','\"none\"'),('fields.9b23eb2f-c8ff-451c-8081-3368f7e59312.type','\"craft\\\\fields\\\\Entries\"'),('fields.a5d142a4-e455-4840-837d-102f7c4cc78c.columnSuffix','null'),('fields.a5d142a4-e455-4840-837d-102f7c4cc78c.handle','\"mxDepartments\"'),('fields.a5d142a4-e455-4840-837d-102f7c4cc78c.instructions','null'),('fields.a5d142a4-e455-4840-837d-102f7c4cc78c.name','\"Departments\"'),('fields.a5d142a4-e455-4840-837d-102f7c4cc78c.searchable','false'),('fields.a5d142a4-e455-4840-837d-102f7c4cc78c.settings.createButtonLabel','\"Add Department\"'),('fields.a5d142a4-e455-4840-837d-102f7c4cc78c.settings.defaultIndexViewMode','\"cards\"'),('fields.a5d142a4-e455-4840-837d-102f7c4cc78c.settings.enableVersioning','false'),('fields.a5d142a4-e455-4840-837d-102f7c4cc78c.settings.includeTableView','false'),('fields.a5d142a4-e455-4840-837d-102f7c4cc78c.settings.maxEntries','null'),('fields.a5d142a4-e455-4840-837d-102f7c4cc78c.settings.minEntries','null'),('fields.a5d142a4-e455-4840-837d-102f7c4cc78c.settings.pageSize','null'),('fields.a5d142a4-e455-4840-837d-102f7c4cc78c.settings.propagationKeyFormat','null'),('fields.a5d142a4-e455-4840-837d-102f7c4cc78c.settings.propagationMethod','\"all\"'),('fields.a5d142a4-e455-4840-837d-102f7c4cc78c.settings.showCardsInGrid','false'),('fields.a5d142a4-e455-4840-837d-102f7c4cc78c.settings.viewMode','\"blocks\"'),('fields.a5d142a4-e455-4840-837d-102f7c4cc78c.translationKeyFormat','null'),('fields.a5d142a4-e455-4840-837d-102f7c4cc78c.translationMethod','\"site\"'),('fields.a5d142a4-e455-4840-837d-102f7c4cc78c.type','\"craft\\\\fields\\\\Matrix\"'),('graphql.publicToken.enabled','false'),('graphql.publicToken.expiryDate','null'),('meta.__names__.0ddc1c53-595b-487f-8473-eece2e4861de','\"Ent Supervisors\"'),('meta.__names__.12e483f5-2e3d-4508-8d01-558050206ffe','\"Building\"'),('meta.__names__.1fefe862-852d-49ba-83cb-906b289365ac','\"ENT Tasks\"'),('meta.__names__.2327a6f6-417b-4334-b051-5d9d0a4d5c02','\"Plain Text\"'),('meta.__names__.5f52388b-f9f4-4132-81c1-55802c67d8cc','\"Locations\"'),('meta.__names__.69dbc207-8618-4a1c-8b63-1de6ba30badb','\"Task Categories\"'),('meta.__names__.6a92aa12-7350-4d77-a9af-a478cee25845','\"Porter Craft\"'),('meta.__names__.9b23eb2f-c8ff-451c-8081-3368f7e59312','\"Departments\"'),('meta.__names__.a029653d-b401-4157-b33a-c398463b10b2','\"Task Categories\"'),('meta.__names__.a5d142a4-e455-4840-837d-102f7c4cc78c','\"Departments\"'),('meta.__names__.a6ca13d7-bc6b-4c17-a310-b0fcaa34804d','\"Ent Locations\"'),('meta.__names__.a77bbb05-d771-4014-ae5a-7e0b5e8be34b','\"Ent Departments\"'),('meta.__names__.b1d95329-57ac-49cf-90d7-b40a1bdbcd01','\"Porters\"'),('meta.__names__.ebb3dbd8-552b-48fb-aebb-0c13143be157','\"Porter Craft\"'),('meta.__names__.f44b07d1-48b3-48fe-8bfe-f8f12f5ed053','\"Supervisors\"'),('meta.__names__.fe915955-f57d-4ec4-bf9c-92c417a8e11d','\"Ent Porters\"'),('sections.5f52388b-f9f4-4132-81c1-55802c67d8cc.defaultPlacement','\"end\"'),('sections.5f52388b-f9f4-4132-81c1-55802c67d8cc.enableVersioning','true'),('sections.5f52388b-f9f4-4132-81c1-55802c67d8cc.entryTypes.0.uid','\"a77bbb05-d771-4014-ae5a-7e0b5e8be34b\"'),('sections.5f52388b-f9f4-4132-81c1-55802c67d8cc.entryTypes.1.uid','\"a6ca13d7-bc6b-4c17-a310-b0fcaa34804d\"'),('sections.5f52388b-f9f4-4132-81c1-55802c67d8cc.handle','\"locations\"'),('sections.5f52388b-f9f4-4132-81c1-55802c67d8cc.maxAuthors','1'),('sections.5f52388b-f9f4-4132-81c1-55802c67d8cc.name','\"Locations\"'),('sections.5f52388b-f9f4-4132-81c1-55802c67d8cc.previewTargets.0.__assoc__.0.0','\"label\"'),('sections.5f52388b-f9f4-4132-81c1-55802c67d8cc.previewTargets.0.__assoc__.0.1','\"Primary entry page\"'),('sections.5f52388b-f9f4-4132-81c1-55802c67d8cc.previewTargets.0.__assoc__.1.0','\"urlFormat\"'),('sections.5f52388b-f9f4-4132-81c1-55802c67d8cc.previewTargets.0.__assoc__.1.1','\"{url}\"'),('sections.5f52388b-f9f4-4132-81c1-55802c67d8cc.previewTargets.0.__assoc__.2.0','\"refresh\"'),('sections.5f52388b-f9f4-4132-81c1-55802c67d8cc.previewTargets.0.__assoc__.2.1','\"1\"'),('sections.5f52388b-f9f4-4132-81c1-55802c67d8cc.propagationMethod','\"all\"'),('sections.5f52388b-f9f4-4132-81c1-55802c67d8cc.siteSettings.6a92aa12-7350-4d77-a9af-a478cee25845.enabledByDefault','true'),('sections.5f52388b-f9f4-4132-81c1-55802c67d8cc.siteSettings.6a92aa12-7350-4d77-a9af-a478cee25845.hasUrls','true'),('sections.5f52388b-f9f4-4132-81c1-55802c67d8cc.siteSettings.6a92aa12-7350-4d77-a9af-a478cee25845.template','\"buildings/_entry.twig\"'),('sections.5f52388b-f9f4-4132-81c1-55802c67d8cc.siteSettings.6a92aa12-7350-4d77-a9af-a478cee25845.uriFormat','\"buildings/{slug}\"'),('sections.5f52388b-f9f4-4132-81c1-55802c67d8cc.structure.maxLevels','2'),('sections.5f52388b-f9f4-4132-81c1-55802c67d8cc.structure.uid','\"f45aa08e-b7fb-4c84-9451-139a3f043937\"'),('sections.5f52388b-f9f4-4132-81c1-55802c67d8cc.type','\"structure\"'),('sections.69dbc207-8618-4a1c-8b63-1de6ba30badb.defaultPlacement','\"end\"'),('sections.69dbc207-8618-4a1c-8b63-1de6ba30badb.enableVersioning','true'),('sections.69dbc207-8618-4a1c-8b63-1de6ba30badb.entryTypes.0.uid','\"1fefe862-852d-49ba-83cb-906b289365ac\"'),('sections.69dbc207-8618-4a1c-8b63-1de6ba30badb.entryTypes.1.uid','\"a029653d-b401-4157-b33a-c398463b10b2\"'),('sections.69dbc207-8618-4a1c-8b63-1de6ba30badb.handle','\"taskCategories\"'),('sections.69dbc207-8618-4a1c-8b63-1de6ba30badb.maxAuthors','1'),('sections.69dbc207-8618-4a1c-8b63-1de6ba30badb.name','\"Task Categories\"'),('sections.69dbc207-8618-4a1c-8b63-1de6ba30badb.previewTargets.0.__assoc__.0.0','\"label\"'),('sections.69dbc207-8618-4a1c-8b63-1de6ba30badb.previewTargets.0.__assoc__.0.1','\"Primary entry page\"'),('sections.69dbc207-8618-4a1c-8b63-1de6ba30badb.previewTargets.0.__assoc__.1.0','\"urlFormat\"'),('sections.69dbc207-8618-4a1c-8b63-1de6ba30badb.previewTargets.0.__assoc__.1.1','\"{url}\"'),('sections.69dbc207-8618-4a1c-8b63-1de6ba30badb.previewTargets.0.__assoc__.2.0','\"refresh\"'),('sections.69dbc207-8618-4a1c-8b63-1de6ba30badb.previewTargets.0.__assoc__.2.1','\"1\"'),('sections.69dbc207-8618-4a1c-8b63-1de6ba30badb.propagationMethod','\"all\"'),('sections.69dbc207-8618-4a1c-8b63-1de6ba30badb.siteSettings.6a92aa12-7350-4d77-a9af-a478cee25845.enabledByDefault','true'),('sections.69dbc207-8618-4a1c-8b63-1de6ba30badb.siteSettings.6a92aa12-7350-4d77-a9af-a478cee25845.hasUrls','true'),('sections.69dbc207-8618-4a1c-8b63-1de6ba30badb.siteSettings.6a92aa12-7350-4d77-a9af-a478cee25845.template','\"task-types/_entry.twig\"'),('sections.69dbc207-8618-4a1c-8b63-1de6ba30badb.siteSettings.6a92aa12-7350-4d77-a9af-a478cee25845.uriFormat','\"task-types/{slug}\"'),('sections.69dbc207-8618-4a1c-8b63-1de6ba30badb.structure.maxLevels','2'),('sections.69dbc207-8618-4a1c-8b63-1de6ba30badb.structure.uid','\"6d82f239-d875-460d-9894-247138a60268\"'),('sections.69dbc207-8618-4a1c-8b63-1de6ba30badb.type','\"structure\"'),('sections.b1d95329-57ac-49cf-90d7-b40a1bdbcd01.defaultPlacement','\"end\"'),('sections.b1d95329-57ac-49cf-90d7-b40a1bdbcd01.enableVersioning','true'),('sections.b1d95329-57ac-49cf-90d7-b40a1bdbcd01.entryTypes.0.uid','\"fe915955-f57d-4ec4-bf9c-92c417a8e11d\"'),('sections.b1d95329-57ac-49cf-90d7-b40a1bdbcd01.handle','\"porters\"'),('sections.b1d95329-57ac-49cf-90d7-b40a1bdbcd01.maxAuthors','1'),('sections.b1d95329-57ac-49cf-90d7-b40a1bdbcd01.name','\"Porters\"'),('sections.b1d95329-57ac-49cf-90d7-b40a1bdbcd01.previewTargets.0.__assoc__.0.0','\"label\"'),('sections.b1d95329-57ac-49cf-90d7-b40a1bdbcd01.previewTargets.0.__assoc__.0.1','\"Primary entry page\"'),('sections.b1d95329-57ac-49cf-90d7-b40a1bdbcd01.previewTargets.0.__assoc__.1.0','\"urlFormat\"'),('sections.b1d95329-57ac-49cf-90d7-b40a1bdbcd01.previewTargets.0.__assoc__.1.1','\"{url}\"'),('sections.b1d95329-57ac-49cf-90d7-b40a1bdbcd01.previewTargets.0.__assoc__.2.0','\"refresh\"'),('sections.b1d95329-57ac-49cf-90d7-b40a1bdbcd01.previewTargets.0.__assoc__.2.1','\"1\"'),('sections.b1d95329-57ac-49cf-90d7-b40a1bdbcd01.propagationMethod','\"all\"'),('sections.b1d95329-57ac-49cf-90d7-b40a1bdbcd01.siteSettings.6a92aa12-7350-4d77-a9af-a478cee25845.enabledByDefault','true'),('sections.b1d95329-57ac-49cf-90d7-b40a1bdbcd01.siteSettings.6a92aa12-7350-4d77-a9af-a478cee25845.hasUrls','true'),('sections.b1d95329-57ac-49cf-90d7-b40a1bdbcd01.siteSettings.6a92aa12-7350-4d77-a9af-a478cee25845.template','\"porters/_entry.twig\"'),('sections.b1d95329-57ac-49cf-90d7-b40a1bdbcd01.siteSettings.6a92aa12-7350-4d77-a9af-a478cee25845.uriFormat','\"porters/{slug}\"'),('sections.b1d95329-57ac-49cf-90d7-b40a1bdbcd01.type','\"channel\"'),('sections.f44b07d1-48b3-48fe-8bfe-f8f12f5ed053.defaultPlacement','\"end\"'),('sections.f44b07d1-48b3-48fe-8bfe-f8f12f5ed053.enableVersioning','true'),('sections.f44b07d1-48b3-48fe-8bfe-f8f12f5ed053.entryTypes.0.uid','\"0ddc1c53-595b-487f-8473-eece2e4861de\"'),('sections.f44b07d1-48b3-48fe-8bfe-f8f12f5ed053.handle','\"supervisors\"'),('sections.f44b07d1-48b3-48fe-8bfe-f8f12f5ed053.maxAuthors','1'),('sections.f44b07d1-48b3-48fe-8bfe-f8f12f5ed053.name','\"Supervisors\"'),('sections.f44b07d1-48b3-48fe-8bfe-f8f12f5ed053.previewTargets.0.__assoc__.0.0','\"label\"'),('sections.f44b07d1-48b3-48fe-8bfe-f8f12f5ed053.previewTargets.0.__assoc__.0.1','\"Primary entry page\"'),('sections.f44b07d1-48b3-48fe-8bfe-f8f12f5ed053.previewTargets.0.__assoc__.1.0','\"refresh\"'),('sections.f44b07d1-48b3-48fe-8bfe-f8f12f5ed053.previewTargets.0.__assoc__.1.1','\"1\"'),('sections.f44b07d1-48b3-48fe-8bfe-f8f12f5ed053.previewTargets.0.__assoc__.2.0','\"urlFormat\"'),('sections.f44b07d1-48b3-48fe-8bfe-f8f12f5ed053.previewTargets.0.__assoc__.2.1','\"{url}\"'),('sections.f44b07d1-48b3-48fe-8bfe-f8f12f5ed053.propagationMethod','\"all\"'),('sections.f44b07d1-48b3-48fe-8bfe-f8f12f5ed053.siteSettings.6a92aa12-7350-4d77-a9af-a478cee25845.enabledByDefault','true'),('sections.f44b07d1-48b3-48fe-8bfe-f8f12f5ed053.siteSettings.6a92aa12-7350-4d77-a9af-a478cee25845.hasUrls','true'),('sections.f44b07d1-48b3-48fe-8bfe-f8f12f5ed053.siteSettings.6a92aa12-7350-4d77-a9af-a478cee25845.template','\"supervisors/_entry.twig\"'),('sections.f44b07d1-48b3-48fe-8bfe-f8f12f5ed053.siteSettings.6a92aa12-7350-4d77-a9af-a478cee25845.uriFormat','\"supervisors/{slug}\"'),('sections.f44b07d1-48b3-48fe-8bfe-f8f12f5ed053.type','\"channel\"'),('siteGroups.ebb3dbd8-552b-48fb-aebb-0c13143be157.name','\"Porter Craft\"'),('sites.6a92aa12-7350-4d77-a9af-a478cee25845.baseUrl','\"$PRIMARY_SITE_URL\"'),('sites.6a92aa12-7350-4d77-a9af-a478cee25845.enabled','true'),('sites.6a92aa12-7350-4d77-a9af-a478cee25845.handle','\"default\"'),('sites.6a92aa12-7350-4d77-a9af-a478cee25845.hasUrls','true'),('sites.6a92aa12-7350-4d77-a9af-a478cee25845.language','\"en-GB\"'),('sites.6a92aa12-7350-4d77-a9af-a478cee25845.name','\"Porter Craft\"'),('sites.6a92aa12-7350-4d77-a9af-a478cee25845.primary','true'),('sites.6a92aa12-7350-4d77-a9af-a478cee25845.siteGroup','\"ebb3dbd8-552b-48fb-aebb-0c13143be157\"'),('sites.6a92aa12-7350-4d77-a9af-a478cee25845.sortOrder','1'),('system.edition','\"solo\"'),('system.live','true'),('system.name','\"Porter Craft\"'),('system.schemaVersion','\"5.7.0.3\"'),('system.timeZone','\"America/Los_Angeles\"'),('users.allowPublicRegistration','false'),('users.defaultGroup','null'),('users.photoSubpath','null'),('users.photoVolumeUid','null'),('users.require2fa','false'),('users.requireEmailVerification','true');
/*!40000 ALTER TABLE `projectconfig` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `queue`
--

LOCK TABLES `queue` WRITE;
/*!40000 ALTER TABLE `queue` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `queue` VALUES (244,'queue',_binary 'O:31:\"craft\\queue\\jobs\\PruneRevisions\":7:{s:11:\"description\";N;s:30:\"\0craft\\queue\\BaseJob\0_progress\";i:0;s:35:\"\0craft\\queue\\BaseJob\0_progressLabel\";N;s:11:\"elementType\";s:20:\"craft\\elements\\Entry\";s:11:\"canonicalId\";i:118;s:6:\"siteId\";i:1;s:12:\"maxRevisions\";N;}','t9n:[\"app\",\"Pruning extra revisions\"]',1746376182,300,0,2049,NULL,NULL,0,NULL,NULL,0,NULL,NULL),(245,'queue',_binary 'O:34:\"craft\\queue\\jobs\\UpdateSearchIndex\":8:{s:11:\"description\";N;s:30:\"\0craft\\queue\\BaseJob\0_progress\";i:0;s:35:\"\0craft\\queue\\BaseJob\0_progressLabel\";N;s:11:\"elementType\";s:20:\"craft\\elements\\Entry\";s:9:\"elementId\";i:118;s:6:\"siteId\";i:1;s:12:\"fieldHandles\";N;s:6:\"queued\";b:1;}','t9n:[\"app\",\"Updating search indexes\"]',1746376182,300,0,2048,NULL,NULL,0,NULL,NULL,0,NULL,NULL),(246,'queue',_binary 'O:31:\"craft\\queue\\jobs\\PruneRevisions\":7:{s:11:\"description\";N;s:30:\"\0craft\\queue\\BaseJob\0_progress\";i:0;s:35:\"\0craft\\queue\\BaseJob\0_progressLabel\";N;s:11:\"elementType\";s:20:\"craft\\elements\\Entry\";s:11:\"canonicalId\";i:120;s:6:\"siteId\";i:1;s:12:\"maxRevisions\";N;}','t9n:[\"app\",\"Pruning extra revisions\"]',1746376190,300,0,2049,NULL,NULL,0,NULL,NULL,0,NULL,NULL),(247,'queue',_binary 'O:34:\"craft\\queue\\jobs\\UpdateSearchIndex\":8:{s:11:\"description\";N;s:30:\"\0craft\\queue\\BaseJob\0_progress\";i:0;s:35:\"\0craft\\queue\\BaseJob\0_progressLabel\";N;s:11:\"elementType\";s:20:\"craft\\elements\\Entry\";s:9:\"elementId\";i:120;s:6:\"siteId\";i:1;s:12:\"fieldHandles\";N;s:6:\"queued\";b:1;}','t9n:[\"app\",\"Updating search indexes\"]',1746376190,300,0,2048,NULL,NULL,0,NULL,NULL,0,NULL,NULL),(248,'queue',_binary 'O:31:\"craft\\queue\\jobs\\PruneRevisions\":7:{s:11:\"description\";N;s:30:\"\0craft\\queue\\BaseJob\0_progress\";i:0;s:35:\"\0craft\\queue\\BaseJob\0_progressLabel\";N;s:11:\"elementType\";s:20:\"craft\\elements\\Entry\";s:11:\"canonicalId\";i:122;s:6:\"siteId\";i:1;s:12:\"maxRevisions\";N;}','t9n:[\"app\",\"Pruning extra revisions\"]',1746376196,300,0,2049,NULL,NULL,0,NULL,NULL,0,NULL,NULL),(249,'queue',_binary 'O:34:\"craft\\queue\\jobs\\UpdateSearchIndex\":8:{s:11:\"description\";N;s:30:\"\0craft\\queue\\BaseJob\0_progress\";i:0;s:35:\"\0craft\\queue\\BaseJob\0_progressLabel\";N;s:11:\"elementType\";s:20:\"craft\\elements\\Entry\";s:9:\"elementId\";i:122;s:6:\"siteId\";i:1;s:12:\"fieldHandles\";N;s:6:\"queued\";b:1;}','t9n:[\"app\",\"Updating search indexes\"]',1746376196,300,0,2048,NULL,NULL,0,NULL,NULL,0,NULL,NULL);
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
INSERT INTO `relations` VALUES (2,3,22,NULL,17,1,'2025-05-03 14:04:55','2025-05-03 14:04:55','291dc3dc-8fb9-43b1-a8e3-5e49e98b6624');
/*!40000 ALTER TABLE `relations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `revisions` VALUES (1,4,1,1,NULL),(2,4,1,2,''),(3,4,1,3,'Applied “Draft 1”'),(4,9,1,1,NULL),(5,11,1,1,NULL),(6,13,1,1,NULL),(7,15,1,1,NULL),(8,17,1,1,NULL),(9,19,1,1,NULL),(10,21,1,1,NULL),(11,23,1,1,''),(12,24,1,1,NULL),(13,25,1,1,NULL),(14,26,1,1,NULL),(15,31,1,1,''),(16,23,1,2,'Applied “Draft 1”'),(17,37,1,1,''),(18,39,1,1,''),(19,23,1,3,'Applied “Draft 1”'),(20,45,1,1,''),(21,47,1,1,''),(22,49,1,1,''),(23,49,1,2,''),(24,52,1,1,''),(25,54,1,1,''),(26,56,1,1,''),(27,58,1,1,''),(28,60,1,1,''),(29,62,1,1,''),(30,64,1,1,''),(31,66,1,1,''),(32,68,1,1,''),(33,70,1,1,NULL),(34,72,1,1,NULL),(35,74,1,1,NULL),(36,76,1,1,NULL),(37,78,1,1,NULL),(38,80,1,1,NULL),(39,82,1,1,NULL),(40,84,1,1,NULL),(41,86,1,1,NULL),(42,88,1,1,''),(43,90,1,1,''),(44,92,1,1,''),(45,94,1,1,''),(46,96,1,1,''),(47,98,1,1,''),(48,100,1,1,''),(49,102,1,1,''),(50,102,1,2,'Applied “Draft 1”'),(51,106,1,1,''),(52,108,1,1,''),(53,110,1,1,''),(54,112,1,1,''),(55,114,1,1,NULL),(56,116,1,1,NULL),(57,118,1,1,NULL),(58,120,1,1,NULL),(59,122,1,1,NULL);
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `searchindex`
--

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `searchindex` VALUES (1,'email',0,1,' access hypha media '),(1,'firstname',0,1,''),(1,'fullname',0,1,''),(1,'lastname',0,1,''),(1,'slug',0,1,''),(1,'username',0,1,' admin '),(2,'slug',0,1,' temp pxzlpjnabjikamnwjejvvobpzwmiroonccre '),(2,'title',0,1,''),(3,'slug',0,1,' temp quwbzqbmymkojerbyjcikwtnqmbjiadkenac '),(3,'title',0,1,''),(4,'slug',0,1,' porter '),(4,'title',0,1,' porter '),(9,'slug',0,1,' martin '),(9,'title',0,1,' martin '),(11,'slug',0,1,' hartshead '),(11,'title',0,1,' hartshead '),(13,'slug',0,1,' charlesworth '),(13,'title',0,1,' charlesworth '),(15,'slug',0,1,' amu '),(15,'title',0,1,' amu '),(17,'slug',0,1,' ward 27 '),(17,'title',0,1,' ward 27 '),(19,'slug',0,1,' charlesworth 2 '),(19,'title',0,1,' charlesworth '),(21,'slug',0,1,' ladysmith '),(21,'title',0,1,' ladysmith '),(23,'slug',0,1,' patient transfer '),(23,'title',0,1,' patient transfer '),(24,'slug',0,1,' wheel '),(24,'title',0,1,' wheelchair '),(25,'slug',0,1,' trolly '),(25,'title',0,1,' trolly '),(26,'slug',0,1,' bed '),(26,'title',0,1,' bed '),(31,'slug',0,1,' hartshead building '),(31,'title',0,1,' hartshead building '),(33,'slug',0,1,' hartshead building '),(33,'title',0,1,' hartshead building '),(34,'slug',0,1,' temp zgilkcvmqgknhmndoyjhuocdywyafojqilea '),(34,'title',0,1,''),(37,'slug',0,1,' samples '),(37,'title',0,1,' samples '),(39,'slug',0,1,' asset movement '),(39,'title',0,1,' asset movement '),(42,'slug',0,1,' temp rrpdstqvbkxcqtmdlfzlqibhmyxasgqoqmus '),(42,'title',0,1,''),(43,'slug',0,1,' temp ffjzbavwnmvnudamlqpesbgwusjuzaxkyhtv '),(43,'title',0,1,''),(45,'slug',0,1,' bed '),(45,'title',0,1,' bed '),(47,'slug',0,1,' wheelchair '),(47,'title',0,1,' wheelchair '),(49,'slug',0,1,' trolly '),(49,'title',0,1,' trolley '),(52,'slug',0,1,' blood '),(52,'title',0,1,' blood '),(54,'slug',0,1,' urine '),(54,'title',0,1,' urine '),(56,'slug',0,1,' gases '),(56,'title',0,1,' gases '),(58,'slug',0,1,' oxygen e size '),(58,'title',0,1,' oxygen e size '),(60,'slug',0,1,' amu '),(60,'title',0,1,' amu '),(62,'slug',0,1,' ward 27 '),(62,'title',0,1,' ward 27 '),(64,'slug',0,1,' ward 43 '),(64,'title',0,1,' ward 43 '),(66,'slug',0,1,' bereavement center '),(66,'title',0,1,' bereavement center '),(68,'slug',0,1,' rose cotage '),(68,'title',0,1,' rose cotage '),(70,'slug',0,1,' test '),(70,'title',0,1,' test '),(72,'slug',0,1,' test 2 '),(72,'title',0,1,' test '),(74,'slug',0,1,' ward 31 '),(74,'title',0,1,' ward 31 '),(76,'slug',0,1,' ward 31 2 '),(76,'title',0,1,' ward 31 '),(78,'slug',0,1,' ward 31 '),(78,'title',0,1,' ward 31 '),(80,'slug',0,1,' ward 30 '),(80,'title',0,1,' ward 30 '),(82,'slug',0,1,' ward 42 '),(82,'title',0,1,' ward 42 '),(84,'slug',0,1,' ward 46 '),(84,'title',0,1,' ward 46 '),(86,'slug',0,1,' ward 45 '),(86,'title',0,1,' ward 45 '),(88,'slug',0,1,' samples '),(88,'title',0,1,' samples '),(90,'slug',0,1,' patient transfer '),(90,'title',0,1,' patient transfer '),(92,'slug',0,1,' asset movement '),(92,'title',0,1,' asset movement '),(94,'slug',0,1,' blood '),(94,'title',0,1,' blood '),(96,'slug',0,1,' urine '),(96,'title',0,1,' urine '),(98,'slug',0,1,' bed '),(98,'title',0,1,' bed '),(100,'slug',0,1,' chair '),(100,'title',0,1,' chair '),(102,'slug',0,1,' trolly '),(102,'title',0,1,' trolley '),(106,'slug',0,1,' gases '),(106,'title',0,1,' gases '),(108,'slug',0,1,' oxygen size d '),(108,'title',0,1,' oxygen size d '),(110,'slug',0,1,' adhoc '),(110,'title',0,1,' adhoc '),(112,'slug',0,1,' bed pans '),(112,'title',0,1,' bed pans '),(114,'slug',0,1,' placenta '),(114,'title',0,1,' placenta '),(116,'slug',0,1,' nicu '),(116,'title',0,1,' nicu ');
/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `searchindexqueue`
--

LOCK TABLES `searchindexqueue` WRITE;
/*!40000 ALTER TABLE `searchindexqueue` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `searchindexqueue` VALUES (95,118,1,0),(96,120,1,0),(97,122,1,0);
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
INSERT INTO `sections` VALUES (1,4,'Locations','locations','structure',1,1,'all','end','[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]','2025-05-03 11:56:20','2025-05-04 14:21:45',NULL,'5f52388b-f9f4-4132-81c1-55802c67d8cc'),(2,2,'Departments','departments','structure',1,1,'all','end','[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]','2025-05-03 11:57:24','2025-05-03 13:11:21','2025-05-04 14:22:46','ceac8342-76fb-422f-a0a3-efb6a2e94704'),(3,NULL,'Porters','porters','channel',1,1,'all','end','[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]','2025-05-03 11:59:26','2025-05-04 14:24:27',NULL,'b1d95329-57ac-49cf-90d7-b40a1bdbcd01'),(4,NULL,'Supervisors','supervisors','channel',1,1,'all','end','[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]','2025-05-03 12:21:43','2025-05-03 12:21:43',NULL,'f44b07d1-48b3-48fe-8bfe-f8f12f5ed053'),(5,3,'Task Categories','taskCategories','structure',1,1,'all','end','[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]','2025-05-03 14:22:07','2025-05-04 14:18:27',NULL,'69dbc207-8618-4a1c-8b63-1de6ba30badb'),(6,NULL,'Locations','locations','channel',1,1,'all','end','[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]','2025-05-03 14:29:16','2025-05-03 14:29:16','2025-05-03 14:33:44','5b851e11-2990-4488-bab3-465638f8a521'),(7,NULL,'Taks Types','taksTypes','channel',1,1,'all','end','[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]','2025-05-04 14:19:03','2025-05-04 14:19:03','2025-05-04 14:19:59','1dfbcd1a-ba48-45e8-9607-00641b598059');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections_entrytypes`
--

LOCK TABLES `sections_entrytypes` WRITE;
/*!40000 ALTER TABLE `sections_entrytypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections_entrytypes` VALUES (1,1,2,NULL,NULL),(1,11,1,NULL,NULL),(2,2,1,NULL,NULL),(3,3,1,NULL,NULL),(4,4,1,NULL,NULL),(5,9,2,NULL,NULL),(5,12,1,NULL,NULL),(6,7,1,NULL,NULL),(7,10,1,NULL,NULL);
/*!40000 ALTER TABLE `sections_entrytypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections_sites`
--

LOCK TABLES `sections_sites` WRITE;
/*!40000 ALTER TABLE `sections_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections_sites` VALUES (1,1,1,1,'buildings/{slug}','buildings/_entry.twig',1,'2025-05-03 11:56:20','2025-05-03 11:56:20','070007aa-0930-4d0b-8e4f-170e8806e5e5'),(2,2,1,1,'departments/{slug}','departments/_entry.twig',1,'2025-05-03 11:57:24','2025-05-03 11:57:24','038b7e4d-1d1d-41b8-a64c-e14e9cf4d35e'),(3,3,1,1,'porters/{slug}','porters/_entry.twig',1,'2025-05-03 11:59:26','2025-05-03 11:59:26','3f74fee0-b21f-4f3a-9451-7dbbfd283ebf'),(4,4,1,1,'supervisors/{slug}','supervisors/_entry.twig',1,'2025-05-03 12:21:43','2025-05-03 12:21:43','5903f5e0-4a91-47f3-8b92-081c6f3de3b3'),(5,5,1,1,'task-types/{slug}','task-types/_entry.twig',1,'2025-05-03 14:22:07','2025-05-03 14:22:07','557d3b16-3518-4ea7-b519-56b3dac122d7'),(6,6,1,1,'locations/{slug}','locations/_entry.twig',1,'2025-05-03 14:29:16','2025-05-03 14:29:16','690c10c1-cf60-4511-8a9c-1a015f2d8682'),(7,7,1,1,'taks-types/{slug}','taks-types/_entry.twig',1,'2025-05-04 14:19:03','2025-05-04 14:19:03','1b48c149-dc6d-498c-9860-89110df6bfa7');
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
INSERT INTO `structureelements` VALUES (1,1,NULL,1,1,8,0,'2025-05-03 12:06:43','2025-05-03 12:17:57','65347286-eb29-4cdd-b2fe-2356b4d177af'),(2,1,2,1,2,3,1,'2025-05-03 12:06:43','2025-05-03 12:06:43','c6dc4784-cf3f-417f-a02b-c8006f760e72'),(3,1,3,1,4,5,1,'2025-05-03 12:07:02','2025-05-03 12:07:02','aa59e3ba-2e1c-4a17-abe0-8641f148b62e'),(4,1,4,1,6,7,1,'2025-05-03 12:17:57','2025-05-03 12:17:57','ed5428a6-ed89-46a5-a70d-6a22d0ef1189'),(5,2,NULL,5,1,6,0,'2025-05-03 13:11:21','2025-05-03 13:11:21','23a4bbce-c1a7-4ac3-9dfd-11147e87796d'),(6,2,15,5,2,3,1,'2025-05-03 13:11:21','2025-05-03 13:11:21','5d7b25b9-ca72-4140-9b6f-8dc76a005838'),(7,2,17,5,4,5,1,'2025-05-03 13:11:21','2025-05-03 13:11:21','7ba8135c-f76e-4f11-bb6f-b5ae909b5f07'),(8,3,NULL,8,1,48,0,'2025-05-03 14:22:12','2025-05-04 15:57:44','302f6c59-2eda-4b95-8dc1-ded6576e9ce4'),(9,3,23,8,2,9,1,'2025-05-03 14:22:12','2025-05-04 14:13:41','21b66b0a-1e6a-452e-bffb-ff9ebb568e35'),(10,3,37,8,10,15,1,'2025-05-03 14:38:44','2025-05-04 14:14:08','d66aa5aa-9d90-44bb-8137-7d415f813877'),(11,3,39,8,16,17,1,'2025-05-03 14:39:22','2025-05-04 14:14:08','96fca98d-7b42-4684-b897-9fde26658a2e'),(12,3,45,8,3,4,2,'2025-05-04 14:12:23','2025-05-04 14:12:32','dae8aa42-1725-4535-ba1e-1c135165b42f'),(13,3,47,8,5,6,2,'2025-05-04 14:13:15','2025-05-04 14:13:41','c2d43526-ea44-4f6e-8c62-763d3dac5dfa'),(14,3,49,8,7,8,2,'2025-05-04 14:13:25','2025-05-04 14:13:41','b7bd45b5-ce19-4a6d-9bf8-81c6044abdf3'),(15,3,52,8,11,12,2,'2025-05-04 14:13:49','2025-05-04 14:13:58','dc8b94a2-6294-4b91-b8a8-713e1a0a8059'),(16,3,54,8,13,14,2,'2025-05-04 14:14:01','2025-05-04 14:14:08','837bef4c-5fe4-4e03-a415-75395db16150'),(17,3,56,8,18,21,1,'2025-05-04 14:14:30','2025-05-04 14:14:51','018f22dd-b466-4b0e-8f25-64705e465c99'),(18,3,58,8,19,20,2,'2025-05-04 14:14:40','2025-05-04 14:14:51','cf444463-4331-42ba-894b-7e13f90057a7'),(19,4,NULL,19,1,30,0,'2025-05-04 14:21:31','2025-05-04 16:22:01','3d3a87a1-afe5-49a5-8792-33414db65076'),(20,4,11,19,2,5,1,'2025-05-04 14:21:31','2025-05-04 14:26:01','8ce67eef-ccaf-46ec-a46e-38cd032b0cbb'),(21,4,13,19,6,15,1,'2025-05-04 14:21:31','2025-05-04 16:22:01','d65fe728-4bf2-42be-bc40-0b644bcfdd61'),(22,4,21,19,16,25,1,'2025-05-04 14:21:31','2025-05-04 16:22:01','ad9c0e94-7fd6-485a-85a8-f8adb13e58d8'),(23,4,60,19,3,4,2,'2025-05-04 14:24:43','2025-05-04 14:26:01','c63e4e5e-eca8-42e2-9968-6c41940f2155'),(24,4,62,19,7,8,2,'2025-05-04 14:24:49','2025-05-04 14:26:01','5a2943a2-03d5-401a-adbc-547986e7588c'),(25,4,64,19,17,18,2,'2025-05-04 14:25:02','2025-05-04 16:22:01','4e87723d-4e48-4428-a253-7c853bf120c3'),(26,4,66,19,26,29,1,'2025-05-04 14:25:11','2025-05-04 16:22:01','18923e8a-7e16-40e6-a835-49941b633379'),(27,4,68,19,27,28,2,'2025-05-04 14:25:33','2025-05-04 16:22:01','65ecf69f-3ee7-43df-a3b3-80fafa6ac8b7'),(32,4,78,19,9,10,2,'2025-05-04 15:28:45','2025-05-04 15:28:45','28f3db8a-a46b-4919-8ebd-8f5893487691'),(33,4,80,19,11,12,2,'2025-05-04 15:31:42','2025-05-04 15:31:42','91d5e7ce-0d46-4758-ba6e-6b4164c86f1b'),(34,4,82,19,19,20,2,'2025-05-04 15:32:45','2025-05-04 16:22:01','cc60f6ce-1253-43c6-ae5a-854160cc88a3'),(35,4,84,19,21,22,2,'2025-05-04 15:33:17','2025-05-04 16:22:01','bacee70c-274b-45c2-8c44-5b646a595461'),(36,4,86,19,23,24,2,'2025-05-04 15:35:41','2025-05-04 16:22:01','24890148-f9d6-4a8e-aa68-dc7dc9412ae9'),(37,3,88,8,22,29,1,'2025-05-04 15:36:18','2025-05-04 15:57:44','1a326ebd-f421-4535-8555-f92290dbd0fc'),(38,3,90,8,30,37,1,'2025-05-04 15:36:27','2025-05-04 15:57:44','5c16de6e-dd3d-4b6c-9d7e-e636376393fb'),(39,3,92,8,38,39,1,'2025-05-04 15:36:37','2025-05-04 15:57:44','55a61c73-01e2-47c1-adb8-27164d504f9c'),(40,3,94,8,23,24,2,'2025-05-04 15:36:47','2025-05-04 15:36:53','f712907e-8cce-4058-8a96-18d0197e381a'),(41,3,96,8,25,26,2,'2025-05-04 15:36:54','2025-05-04 15:37:00','3ba77fd5-2b7d-4ed3-afca-333b197564e3'),(42,3,98,8,33,34,2,'2025-05-04 15:37:02','2025-05-04 15:57:44','b83dbe03-d33a-43df-a0c0-cc309236ab6a'),(43,3,100,8,31,32,2,'2025-05-04 15:37:08','2025-05-04 15:57:44','9ee57677-523f-4ba7-8da8-b3adffc142ec'),(44,3,102,8,35,36,2,'2025-05-04 15:37:16','2025-05-04 15:57:44','2807193e-9123-4980-b5f0-2df93c6e0b38'),(45,3,106,8,40,43,1,'2025-05-04 15:37:36','2025-05-04 15:57:44','3340c0d3-44bc-4ed6-9464-5206d99e1502'),(46,3,108,8,41,42,2,'2025-05-04 15:37:44','2025-05-04 15:57:44','31c47d44-799f-4c61-8359-8b169993bfda'),(47,3,110,8,44,47,1,'2025-05-04 15:37:59','2025-05-04 15:57:44','4c0470ed-8fb8-47a6-bb45-c5b260f759d8'),(48,3,112,8,45,46,2,'2025-05-04 15:38:04','2025-05-04 15:57:44','bb9f1178-5629-47a4-b578-4698ee990339'),(49,3,114,8,27,28,2,'2025-05-04 15:57:44','2025-05-04 15:57:44','5a17cbd0-d2e9-4bfd-be73-9772a9f5864e'),(50,4,116,19,13,14,2,'2025-05-04 16:22:01','2025-05-04 16:22:01','8a7d15ce-5d7a-4ff3-81e6-714bfaa0317f');
/*!40000 ALTER TABLE `structureelements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structures`
--

LOCK TABLES `structures` WRITE;
/*!40000 ALTER TABLE `structures` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `structures` VALUES (1,1,'2025-05-03 11:59:26','2025-05-03 11:59:26','2025-05-04 14:24:27','a210ba69-a5b6-41ee-85e4-be3c257b2891'),(2,1,'2025-05-03 13:11:21','2025-05-03 13:11:21','2025-05-04 14:22:46','a70677d6-0f63-414f-b972-139e2a624c48'),(3,2,'2025-05-03 14:22:07','2025-05-04 14:20:14',NULL,'6d82f239-d875-460d-9894-247138a60268'),(4,2,'2025-05-04 14:21:31','2025-05-04 14:21:31',NULL,'f45aa08e-b7fb-4c84-9451-139a3f043937');
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
INSERT INTO `users` VALUES (1,NULL,NULL,1,0,0,0,1,'admin',NULL,NULL,NULL,'access@hypha.media','$2y$13$k/yD7LQoJqt9FTuV4BuHFe4zCcoHjGFK7g2nt.zfWynKpBIPTCtGO','2025-05-04 16:29:19',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'2025-05-03 11:51:41','2025-05-03 11:51:41','2025-05-04 16:29:19');
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

-- Dump completed on 2025-05-04 17:30:32
