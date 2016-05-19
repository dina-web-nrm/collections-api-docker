-- MySQL dump 10.13  Distrib 5.7.12, for Linux (x86_64)
--
-- Host: localhost    Database: keycloak
-- ------------------------------------------------------
-- Server version	5.7.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ADMIN_EVENT_ENTITY`
--

DROP TABLE IF EXISTS `ADMIN_EVENT_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ADMIN_EVENT_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `ADMIN_EVENT_TIME` bigint(20) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `OPERATION_TYPE` varchar(255) DEFAULT NULL,
  `AUTH_REALM_ID` varchar(255) DEFAULT NULL,
  `AUTH_CLIENT_ID` varchar(255) DEFAULT NULL,
  `AUTH_USER_ID` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `RESOURCE_PATH` varchar(2550) DEFAULT NULL,
  `REPRESENTATION` text,
  `ERROR` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ADMIN_EVENT_ENTITY`
--

LOCK TABLES `ADMIN_EVENT_ENTITY` WRITE;
/*!40000 ALTER TABLE `ADMIN_EVENT_ENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `ADMIN_EVENT_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATION_EXECUTION`
--

DROP TABLE IF EXISTS `AUTHENTICATION_EXECUTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AUTHENTICATION_EXECUTION` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `AUTHENTICATOR` varchar(36) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `FLOW_ID` varchar(36) DEFAULT NULL,
  `REQUIREMENT` int(11) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `AUTHENTICATOR_FLOW` bit(1) NOT NULL DEFAULT b'0',
  `AUTH_FLOW_ID` varchar(36) DEFAULT NULL,
  `AUTH_CONFIG` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_AUTH_EXEC_REALM` (`REALM_ID`),
  KEY `FK_AUTH_EXEC_FLOW` (`FLOW_ID`),
  CONSTRAINT `FK_AUTH_EXEC_FLOW` FOREIGN KEY (`FLOW_ID`) REFERENCES `AUTHENTICATION_FLOW` (`ID`),
  CONSTRAINT `FK_AUTH_EXEC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATION_EXECUTION`
--

LOCK TABLES `AUTHENTICATION_EXECUTION` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATION_EXECUTION` DISABLE KEYS */;
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('03cf165d-87ab-4c4a-adba-17654f49b689',NULL,'reset-password','dina','8d3c4efc-c755-4486-9f22-a88d7268ec95',0,30,'\0',NULL,NULL),('0bb397d7-b8c9-4701-8958-41490ce19463',NULL,'direct-grant-validate-password','dina','23d63549-518f-4fdd-b9b0-2ba51b5e93cb',0,20,'\0',NULL,NULL),('10ac804b-8065-4f82-8580-5e32b62c3df3',NULL,'auth-username-password-form','dina','dc9ad8cb-7865-4ee7-91b1-bc483c2c8c8c',0,10,'\0',NULL,NULL),('1eb1d941-c2ea-4f99-9132-73b71f65bf06',NULL,'registration-page-form','master','16b2551d-e699-4798-abe9-6c379b053c70',0,10,'','34ec12ee-d730-4db1-8b22-20a51e9b6543',NULL),('1f3dcb8d-bdbd-4d2c-9e0d-40224e664cf5',NULL,'direct-grant-validate-username','master','cc476618-fcc5-4d49-873e-15d397a0de08',0,10,'\0',NULL,NULL),('20fe314a-cdf7-41e9-887f-f367fd0ad3ad',NULL,'client-jwt','master','6a88241d-3d91-402d-a5f4-e13171da62b0',2,20,'\0',NULL,NULL),('252c4aa8-bba2-4f1d-969c-20c48ca776a1',NULL,'reset-credentials-choose-user','master','56e7915e-0649-4448-b926-3f8fc5a38772',0,10,'\0',NULL,NULL),('32cddc0f-304d-44bc-813e-10efe148adc8',NULL,'direct-grant-validate-otp','master','cc476618-fcc5-4d49-873e-15d397a0de08',1,30,'\0',NULL,NULL),('36890ed8-430e-4fbd-b0e8-bea729623cb9',NULL,'registration-user-creation','master','34ec12ee-d730-4db1-8b22-20a51e9b6543',0,20,'\0',NULL,NULL),('434c2f03-033b-4580-a209-88a0d4d94f44',NULL,'registration-recaptcha-action','dina','939e83bc-fa6d-40f8-8404-c795fd55e94e',3,60,'\0',NULL,NULL),('46ea5a94-b937-41ec-9e1b-1f245407a75d',NULL,'auth-cookie','master','2939d483-9312-4479-b5a8-f497ac5c091b',2,10,'\0',NULL,NULL),('4f4402c1-8914-481a-aaa4-3a54d3ef40b8',NULL,NULL,'master','2939d483-9312-4479-b5a8-f497ac5c091b',2,30,'','82942ba9-35b6-41c1-adb5-faed83d2cc3e',NULL),('522697f9-8600-46cc-a979-4b7c52a62b46',NULL,'registration-profile-action','master','34ec12ee-d730-4db1-8b22-20a51e9b6543',0,40,'\0',NULL,NULL),('5843dd0c-4e9b-4a05-91c2-73dec0df48d3',NULL,'auth-otp-form','master','82942ba9-35b6-41c1-adb5-faed83d2cc3e',1,20,'\0',NULL,NULL),('63d035f0-fc0a-4c1c-994f-2f1faf266254',NULL,'auth-spnego','master','2939d483-9312-4479-b5a8-f497ac5c091b',3,20,'\0',NULL,NULL),('668aa354-965f-41f5-b298-87d04710a4c1',NULL,'reset-otp','master','56e7915e-0649-4448-b926-3f8fc5a38772',1,40,'\0',NULL,NULL),('682d6878-7b52-4b6d-b7c4-c617046ff701',NULL,'client-secret','dina','1ea83140-b616-4970-8ae2-5518c86e7ed8',2,10,'\0',NULL,NULL),('6db547eb-8f4e-4dcd-82d9-da478d04ed06',NULL,'auth-username-password-form','master','82942ba9-35b6-41c1-adb5-faed83d2cc3e',0,10,'\0',NULL,NULL),('769a951e-2dd6-447b-bd3d-9c7690fa5d56',NULL,'direct-grant-validate-password','master','cc476618-fcc5-4d49-873e-15d397a0de08',0,20,'\0',NULL,NULL),('77b61b3a-9ce8-4580-b772-dddac863b97b',NULL,'registration-user-creation','dina','939e83bc-fa6d-40f8-8404-c795fd55e94e',0,20,'\0',NULL,NULL),('8a65ef55-2703-42ec-a593-dcef17c1c3e3',NULL,NULL,'dina','740a4983-a368-4ca0-a82b-4b7b2b58a943',2,30,'','dc9ad8cb-7865-4ee7-91b1-bc483c2c8c8c',NULL),('94b31ac6-1427-4f5e-adb9-39a4bfc5f126',NULL,'registration-profile-action','dina','939e83bc-fa6d-40f8-8404-c795fd55e94e',0,40,'\0',NULL,NULL),('97a6a3df-bec3-4ec8-99a5-4ed9fffa1bb1',NULL,'reset-credential-email','master','56e7915e-0649-4448-b926-3f8fc5a38772',0,20,'\0',NULL,NULL),('9863123f-18d3-4ada-a5ac-fe69e9ee7172',NULL,'auth-otp-form','dina','dc9ad8cb-7865-4ee7-91b1-bc483c2c8c8c',1,20,'\0',NULL,NULL),('9d5add11-b393-4146-87cd-1db8ba467028',NULL,'client-jwt','dina','1ea83140-b616-4970-8ae2-5518c86e7ed8',2,20,'\0',NULL,NULL),('a4416230-d58e-4204-918e-4db3c4fa0e97',NULL,'reset-otp','dina','8d3c4efc-c755-4486-9f22-a88d7268ec95',1,40,'\0',NULL,NULL),('af1b0363-8ab3-4f6b-b4e0-5b7e688d72b5',NULL,'direct-grant-validate-otp','dina','23d63549-518f-4fdd-b9b0-2ba51b5e93cb',1,30,'\0',NULL,NULL),('b2ebd10e-2668-4613-b590-cc6564ba59d3',NULL,'registration-password-action','master','34ec12ee-d730-4db1-8b22-20a51e9b6543',0,50,'\0',NULL,NULL),('b75ad7d6-a381-4296-bf35-ee4e3f6450f0',NULL,'registration-password-action','dina','939e83bc-fa6d-40f8-8404-c795fd55e94e',0,50,'\0',NULL,NULL),('ba2f9168-ca0f-4256-9ce6-4d8336b22d9a',NULL,'reset-credential-email','dina','8d3c4efc-c755-4486-9f22-a88d7268ec95',0,20,'\0',NULL,NULL),('c5a87ec2-99ee-4b64-b1e9-b889ef8da3fb',NULL,'registration-page-form','dina','24e4ec44-cf49-4c8c-bf6e-6c86159eb471',0,10,'','939e83bc-fa6d-40f8-8404-c795fd55e94e',NULL),('c8aaa871-7a56-4e6a-89d8-6fa5148c6270',NULL,'registration-recaptcha-action','master','34ec12ee-d730-4db1-8b22-20a51e9b6543',3,60,'\0',NULL,NULL),('d601b613-1f5a-4040-9536-a28838cca4c6',NULL,'auth-spnego','dina','740a4983-a368-4ca0-a82b-4b7b2b58a943',3,20,'\0',NULL,NULL),('dcb9828d-5f27-43fa-a08f-0b109698a92c',NULL,'client-secret','master','6a88241d-3d91-402d-a5f4-e13171da62b0',2,10,'\0',NULL,NULL),('e08f1a94-0958-46ec-a576-69e8d3a6d25c',NULL,'reset-password','master','56e7915e-0649-4448-b926-3f8fc5a38772',0,30,'\0',NULL,NULL),('e48c9511-5568-47d6-88e5-4581995851af',NULL,'direct-grant-validate-username','dina','23d63549-518f-4fdd-b9b0-2ba51b5e93cb',0,10,'\0',NULL,NULL),('eebdb9d0-b907-451b-a132-ef67cb7494d8',NULL,'auth-cookie','dina','740a4983-a368-4ca0-a82b-4b7b2b58a943',2,10,'\0',NULL,NULL),('f4b07697-bc43-4ea7-ab05-5aeed556f7e3',NULL,'reset-credentials-choose-user','dina','8d3c4efc-c755-4486-9f22-a88d7268ec95',0,10,'\0',NULL,NULL);
/*!40000 ALTER TABLE `AUTHENTICATION_EXECUTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATION_FLOW`
--

DROP TABLE IF EXISTS `AUTHENTICATION_FLOW`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AUTHENTICATION_FLOW` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_ID` varchar(36) NOT NULL DEFAULT 'basic-flow',
  `TOP_LEVEL` bit(1) NOT NULL DEFAULT b'0',
  `BUILT_IN` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`),
  KEY `FK_AUTH_FLOW_REALM` (`REALM_ID`),
  CONSTRAINT `FK_AUTH_FLOW_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATION_FLOW`
--

LOCK TABLES `AUTHENTICATION_FLOW` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATION_FLOW` DISABLE KEYS */;
INSERT INTO `AUTHENTICATION_FLOW` VALUES ('16b2551d-e699-4798-abe9-6c379b053c70','registration','registration flow','master','basic-flow','',''),('1ea83140-b616-4970-8ae2-5518c86e7ed8','clients','Base authentication for clients','dina','client-flow','',''),('23d63549-518f-4fdd-b9b0-2ba51b5e93cb','direct grant','OpenID Connect Resource Owner Grant','dina','basic-flow','',''),('24e4ec44-cf49-4c8c-bf6e-6c86159eb471','registration','registration flow','dina','basic-flow','',''),('2939d483-9312-4479-b5a8-f497ac5c091b','browser','browser based authentication','master','basic-flow','',''),('34ec12ee-d730-4db1-8b22-20a51e9b6543','registration form','registration form','master','form-flow','\0',''),('56e7915e-0649-4448-b926-3f8fc5a38772','reset credentials','Reset credentials for a user if they forgot their password or something','master','basic-flow','',''),('6a88241d-3d91-402d-a5f4-e13171da62b0','clients','Base authentication for clients','master','client-flow','',''),('740a4983-a368-4ca0-a82b-4b7b2b58a943','browser','browser based authentication','dina','basic-flow','',''),('82942ba9-35b6-41c1-adb5-faed83d2cc3e','forms','Username, password, otp and other auth forms.','master','basic-flow','\0',''),('8d3c4efc-c755-4486-9f22-a88d7268ec95','reset credentials','Reset credentials for a user if they forgot their password or something','dina','basic-flow','',''),('939e83bc-fa6d-40f8-8404-c795fd55e94e','registration form','registration form','dina','form-flow','\0',''),('cc476618-fcc5-4d49-873e-15d397a0de08','direct grant','OpenID Connect Resource Owner Grant','master','basic-flow','',''),('dc9ad8cb-7865-4ee7-91b1-bc483c2c8c8c','forms','Username, password, otp and other auth forms.','dina','basic-flow','\0','');
/*!40000 ALTER TABLE `AUTHENTICATION_FLOW` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATOR_CONFIG`
--

DROP TABLE IF EXISTS `AUTHENTICATOR_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AUTHENTICATOR_CONFIG` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_AUTH_REALM` (`REALM_ID`),
  CONSTRAINT `FK_AUTH_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATOR_CONFIG`
--

LOCK TABLES `AUTHENTICATOR_CONFIG` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATOR_CONFIG_ENTRY`
--

DROP TABLE IF EXISTS `AUTHENTICATOR_CONFIG_ENTRY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AUTHENTICATOR_CONFIG_ENTRY` (
  `AUTHENTICATOR_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`AUTHENTICATOR_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATOR_CONFIG_ENTRY`
--

LOCK TABLES `AUTHENTICATOR_CONFIG_ENTRY` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG_ENTRY` DISABLE KEYS */;
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG_ENTRY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT`
--

DROP TABLE IF EXISTS `CLIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT` (
  `ID` varchar(36) NOT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `FULL_SCOPE_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int(11) DEFAULT NULL,
  `PUBLIC_CLIENT` bit(1) NOT NULL DEFAULT b'0',
  `SECRET` varchar(255) DEFAULT NULL,
  `BASE_URL` varchar(255) DEFAULT NULL,
  `BEARER_ONLY` bit(1) NOT NULL DEFAULT b'0',
  `MANAGEMENT_URL` varchar(255) DEFAULT NULL,
  `SURROGATE_AUTH_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  `DIRECT_GRANTS_ONLY` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) DEFAULT NULL,
  `PROTOCOL` varchar(255) DEFAULT NULL,
  `NODE_REREG_TIMEOUT` int(11) DEFAULT '0',
  `FRONTCHANNEL_LOGOUT` bit(1) NOT NULL DEFAULT b'0',
  `CONSENT_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  `NAME` varchar(255) DEFAULT NULL,
  `SERVICE_ACCOUNTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `CLIENT_AUTHENTICATOR_TYPE` varchar(255) DEFAULT NULL,
  `ROOT_URL` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_B71CJLBENV945RB6GCON438AT` (`REALM_ID`,`CLIENT_ID`),
  CONSTRAINT `FK_P56CTINXXB9GSK57FO49F9TAC` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT`
--

LOCK TABLES `CLIENT` WRITE;
/*!40000 ALTER TABLE `CLIENT` DISABLE KEYS */;
INSERT INTO `CLIENT` VALUES ('01c31bbd-1152-436d-b224-554479b6d23a','','\0','security-admin-console',0,'','5f28c78a-8425-4200-9b87-877dfc45f8b9','/auth/admin/master/console/index.html','\0',NULL,'\0','\0','master',NULL,0,'\0','\0','${client_security-admin-console}','\0','client-secret',NULL,NULL),('0e43972d-ab4c-40b1-a473-dffa1345210d','','','collections',0,'\0','2b787af8-540d-4551-81d7-ff7e414b241c',NULL,'',NULL,'\0','\0','dina','openid-connect',-1,'\0','\0','collections','\0','client-secret',NULL,'dina collection management api'),('1b078076-bde9-4030-b3ce-fdded3a9f5db','','\0','account',0,'\0','7488f216-12eb-4e22-8750-29437c66b8bb','/auth/realms/master/account','\0',NULL,'\0','\0','master',NULL,0,'\0','\0','${client_account}','\0','client-secret',NULL,NULL),('46c5db86-8f66-47a7-bb6d-7a920a804d7b','','','master-realm',0,'\0','9e3fae78-d703-4b68-b333-20a35aaf67c7',NULL,'',NULL,'\0','\0','master',NULL,0,'\0','\0','master Realm','\0','client-secret',NULL,NULL),('958151d1-bef5-423d-bde0-01fb9d8e0c3c','','\0','account',0,'\0','49bf0ff7-f3c4-4c04-8608-788a82d0a883','/auth/realms/dina/account','\0',NULL,'\0','\0','dina',NULL,0,'\0','\0','${client_account}','\0','client-secret',NULL,NULL),('a8052be8-34bd-4b5e-a077-94f1562c3ee6','','','dina-rest',0,'','4df33981-2752-44c6-92be-b5418dbe5e75',NULL,'\0',NULL,'\0','','dina','openid-connect',-1,'\0','\0','dina rest endpoint','\0','client-secret',NULL,'The dina rest endpoint to retrieve token'),('a8668963-14d2-4564-a001-137e9fa67084','','','dina-realm',0,'\0','d3dd5550-1454-40ed-8649-3c94ec349296',NULL,'',NULL,'\0','\0','master',NULL,0,'\0','\0','dina Realm','\0','client-secret',NULL,NULL),('b43c2f96-3d6f-487a-a6e0-95e438729d9d','','\0','broker',0,'\0','9d0aeb62-f102-4f79-a437-d09521a305f1',NULL,'\0',NULL,'\0','\0','dina',NULL,0,'\0','\0','${client_broker}','\0','client-secret',NULL,NULL),('e079390c-5e68-47ff-bc83-62aa6348dc8b','','\0','realm-management',0,'\0','6d650a3d-8078-47ac-b014-2e4823e3592b',NULL,'',NULL,'\0','\0','dina',NULL,0,'\0','\0','${client_realm-management}','\0','client-secret',NULL,NULL),('f28e2ec7-8aab-439e-8bf1-c594720f46ff','','\0','broker',0,'\0','5c3ae3d6-c3a3-4ea9-bae7-c4ace4d2edad',NULL,'\0',NULL,'\0','\0','master',NULL,0,'\0','\0','${client_broker}','\0','client-secret',NULL,NULL),('f507af43-5e48-4267-804e-5af7b0cac5ca','','\0','security-admin-console',0,'','b7daae28-c14a-460b-b693-bda50a1b1d63','/auth/admin/dina/console/index.html','\0',NULL,'\0','\0','dina',NULL,0,'\0','\0','${client_security-admin-console}','\0','client-secret',NULL,NULL);
/*!40000 ALTER TABLE `CLIENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_ATTRIBUTES`
--

DROP TABLE IF EXISTS `CLIENT_ATTRIBUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_ATTRIBUTES` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(2048) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`NAME`),
  CONSTRAINT `FK3C47C64BEACCA966` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_ATTRIBUTES`
--

LOCK TABLES `CLIENT_ATTRIBUTES` WRITE;
/*!40000 ALTER TABLE `CLIENT_ATTRIBUTES` DISABLE KEYS */;
INSERT INTO `CLIENT_ATTRIBUTES` VALUES ('0e43972d-ab4c-40b1-a473-dffa1345210d','false','saml.assertion.signature'),('0e43972d-ab4c-40b1-a473-dffa1345210d','true','saml.authnstatement'),('0e43972d-ab4c-40b1-a473-dffa1345210d','false','saml.client.signature'),('0e43972d-ab4c-40b1-a473-dffa1345210d','false','saml.encrypt'),('0e43972d-ab4c-40b1-a473-dffa1345210d','false','saml.force.post.binding'),('0e43972d-ab4c-40b1-a473-dffa1345210d','false','saml.multivalued.roles'),('0e43972d-ab4c-40b1-a473-dffa1345210d','false','saml.server.signature'),('0e43972d-ab4c-40b1-a473-dffa1345210d','RSA_SHA256','saml.signature.algorithm'),('0e43972d-ab4c-40b1-a473-dffa1345210d','false','saml_force_name_id_format'),('0e43972d-ab4c-40b1-a473-dffa1345210d','username','saml_name_id_format'),('0e43972d-ab4c-40b1-a473-dffa1345210d','http://www.w3.org/2001/10/xml-exc-c14n#','saml_signature_canonicalization_method'),('a8052be8-34bd-4b5e-a077-94f1562c3ee6','false','saml.assertion.signature'),('a8052be8-34bd-4b5e-a077-94f1562c3ee6','true','saml.authnstatement'),('a8052be8-34bd-4b5e-a077-94f1562c3ee6','false','saml.client.signature'),('a8052be8-34bd-4b5e-a077-94f1562c3ee6','false','saml.encrypt'),('a8052be8-34bd-4b5e-a077-94f1562c3ee6','false','saml.force.post.binding'),('a8052be8-34bd-4b5e-a077-94f1562c3ee6','false','saml.multivalued.roles'),('a8052be8-34bd-4b5e-a077-94f1562c3ee6','false','saml.server.signature'),('a8052be8-34bd-4b5e-a077-94f1562c3ee6','RSA_SHA256','saml.signature.algorithm'),('a8052be8-34bd-4b5e-a077-94f1562c3ee6','false','saml_force_name_id_format'),('a8052be8-34bd-4b5e-a077-94f1562c3ee6','username','saml_name_id_format'),('a8052be8-34bd-4b5e-a077-94f1562c3ee6','http://www.w3.org/2001/10/xml-exc-c14n#','saml_signature_canonicalization_method');
/*!40000 ALTER TABLE `CLIENT_ATTRIBUTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_DEFAULT_ROLES`
--

DROP TABLE IF EXISTS `CLIENT_DEFAULT_ROLES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_DEFAULT_ROLES` (
  `CLIENT_ID` varchar(36) DEFAULT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  UNIQUE KEY `UK_8AELWNIBJI49AVXSRTUF6XJOW` (`ROLE_ID`),
  KEY `FK_NUILTS7KLWQW2H8M2B5JOYTKY` (`CLIENT_ID`),
  CONSTRAINT `FK_8AELWNIBJI49AVXSRTUF6XJOW` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`),
  CONSTRAINT `FK_NUILTS7KLWQW2H8M2B5JOYTKY` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_DEFAULT_ROLES`
--

LOCK TABLES `CLIENT_DEFAULT_ROLES` WRITE;
/*!40000 ALTER TABLE `CLIENT_DEFAULT_ROLES` DISABLE KEYS */;
INSERT INTO `CLIENT_DEFAULT_ROLES` VALUES ('1b078076-bde9-4030-b3ce-fdded3a9f5db','5b868f9d-c09a-406a-bc9b-42bd1722703f'),('1b078076-bde9-4030-b3ce-fdded3a9f5db','77372a92-58e2-474e-abac-b1beefb23f67'),('958151d1-bef5-423d-bde0-01fb9d8e0c3c','1e916926-8aaa-4ba3-bcaa-c796763a2eb6'),('958151d1-bef5-423d-bde0-01fb9d8e0c3c','46cf8cbd-d4a4-4943-8a1d-b12e8f842885');
/*!40000 ALTER TABLE `CLIENT_DEFAULT_ROLES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_IDENTITY_PROV_MAPPING`
--

DROP TABLE IF EXISTS `CLIENT_IDENTITY_PROV_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_IDENTITY_PROV_MAPPING` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `IDENTITY_PROVIDER_ID` varchar(36) NOT NULL,
  `RETRIEVE_TOKEN` bit(1) NOT NULL DEFAULT b'0',
  UNIQUE KEY `UK_7CAELWNIBJI49AVXSRTUF6XJ12` (`IDENTITY_PROVIDER_ID`,`CLIENT_ID`),
  KEY `FK_56ELWNIBJI49AVXSRTUF6XJ23` (`CLIENT_ID`),
  CONSTRAINT `FK_56ELWNIBJI49AVXSRTUF6XJ23` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`),
  CONSTRAINT `FK_7CELWNIBJI49AVXSRTUF6XJ12` FOREIGN KEY (`IDENTITY_PROVIDER_ID`) REFERENCES `IDENTITY_PROVIDER` (`INTERNAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_IDENTITY_PROV_MAPPING`
--

LOCK TABLES `CLIENT_IDENTITY_PROV_MAPPING` WRITE;
/*!40000 ALTER TABLE `CLIENT_IDENTITY_PROV_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_IDENTITY_PROV_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_NODE_REGISTRATIONS`
--

DROP TABLE IF EXISTS `CLIENT_NODE_REGISTRATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_NODE_REGISTRATIONS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` int(11) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`NAME`),
  CONSTRAINT `FK4129723BA992F594` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_NODE_REGISTRATIONS`
--

LOCK TABLES `CLIENT_NODE_REGISTRATIONS` WRITE;
/*!40000 ALTER TABLE `CLIENT_NODE_REGISTRATIONS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_NODE_REGISTRATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION`
--

DROP TABLE IF EXISTS `CLIENT_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_SESSION` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(36) DEFAULT NULL,
  `REDIRECT_URI` varchar(255) DEFAULT NULL,
  `STATE` varchar(255) DEFAULT NULL,
  `TIMESTAMP` int(11) DEFAULT NULL,
  `SESSION_ID` varchar(36) DEFAULT NULL,
  `AUTH_METHOD` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `AUTH_USER_ID` varchar(36) DEFAULT NULL,
  `CURRENT_ACTION` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_B4AO2VCVAT6UKAU74WBWTFQO1` (`SESSION_ID`),
  CONSTRAINT `FK_B4AO2VCVAT6UKAU74WBWTFQO1` FOREIGN KEY (`SESSION_ID`) REFERENCES `USER_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION`
--

LOCK TABLES `CLIENT_SESSION` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_AUTH_STATUS`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_AUTH_STATUS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_SESSION_AUTH_STATUS` (
  `AUTHENTICATOR` varchar(36) NOT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`AUTHENTICATOR`),
  CONSTRAINT `AUTH_STATUS_CONSTRAINT` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_AUTH_STATUS`
--

LOCK TABLES `CLIENT_SESSION_AUTH_STATUS` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_AUTH_STATUS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_AUTH_STATUS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_NOTE`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_SESSION_NOTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`NAME`),
  CONSTRAINT `FK5EDFB00FF51C2736` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_NOTE`
--

LOCK TABLES `CLIENT_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_PROT_MAPPER`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_PROT_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_SESSION_PROT_MAPPER` (
  `PROTOCOL_MAPPER_ID` varchar(36) NOT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`PROTOCOL_MAPPER_ID`),
  CONSTRAINT `FK_33A8SGQW18I532811V7O2DK89` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_PROT_MAPPER`
--

LOCK TABLES `CLIENT_SESSION_PROT_MAPPER` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_PROT_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_PROT_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_ROLE`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_SESSION_ROLE` (
  `ROLE_ID` varchar(255) NOT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`ROLE_ID`),
  CONSTRAINT `FK_11B7SGQW18I532811V7O2DV76` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_ROLE`
--

LOCK TABLES `CLIENT_SESSION_ROLE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_ROLE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_USER_SESSION_NOTE`
--

DROP TABLE IF EXISTS `CLIENT_USER_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_USER_SESSION_NOTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(2048) DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`NAME`),
  CONSTRAINT `FK_CL_USR_SES_NOTE` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_USER_SESSION_NOTE`
--

LOCK TABLES `CLIENT_USER_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `CLIENT_USER_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_USER_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPOSITE_ROLE`
--

DROP TABLE IF EXISTS `COMPOSITE_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `COMPOSITE_ROLE` (
  `COMPOSITE` varchar(36) NOT NULL,
  `CHILD_ROLE` varchar(36) NOT NULL,
  KEY `FK_A63WVEKFTU8JO1PNJ81E7MCE2` (`COMPOSITE`),
  KEY `FK_GR7THLLB9LU8Q4VQA4524JJY8` (`CHILD_ROLE`),
  CONSTRAINT `FK_A63WVEKFTU8JO1PNJ81E7MCE2` FOREIGN KEY (`COMPOSITE`) REFERENCES `KEYCLOAK_ROLE` (`ID`),
  CONSTRAINT `FK_GR7THLLB9LU8Q4VQA4524JJY8` FOREIGN KEY (`CHILD_ROLE`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPOSITE_ROLE`
--

LOCK TABLES `COMPOSITE_ROLE` WRITE;
/*!40000 ALTER TABLE `COMPOSITE_ROLE` DISABLE KEYS */;
INSERT INTO `COMPOSITE_ROLE` VALUES ('6e9e8c24-03de-43bc-8e1d-22cd2d142100','de857ec1-374b-4761-acc7-b8c4b60654f6'),('6e9e8c24-03de-43bc-8e1d-22cd2d142100','cb8fdb6a-c773-40cb-a4de-7006fa679c4c'),('6e9e8c24-03de-43bc-8e1d-22cd2d142100','e918ffef-0ccb-4e47-a943-bb73cedab781'),('6e9e8c24-03de-43bc-8e1d-22cd2d142100','6c826456-6a59-4dfc-888b-e1b7690861c5'),('6e9e8c24-03de-43bc-8e1d-22cd2d142100','aa664b9b-bc7a-499a-b14b-15b866f34f7a'),('6e9e8c24-03de-43bc-8e1d-22cd2d142100','f7236097-f420-48d6-8e20-0b4678d572d3'),('6e9e8c24-03de-43bc-8e1d-22cd2d142100','87c5a222-e79a-465a-bde6-9e7776cc629c'),('6e9e8c24-03de-43bc-8e1d-22cd2d142100','6d06ea50-7d81-4a60-8539-7c9604aed056'),('6e9e8c24-03de-43bc-8e1d-22cd2d142100','32f6159a-2b02-4a4e-8e76-9b7326007bd0'),('6e9e8c24-03de-43bc-8e1d-22cd2d142100','762b018f-150b-4be6-8c11-cf796daf1f37'),('6e9e8c24-03de-43bc-8e1d-22cd2d142100','71bf3d37-9fb3-4ed1-8e94-f1b316a77913'),('6e9e8c24-03de-43bc-8e1d-22cd2d142100','dd0d0c83-4cca-4db2-86e8-1e4c9fc3961d'),('6e9e8c24-03de-43bc-8e1d-22cd2d142100','a84fb7d4-5088-4001-baff-5f51cbd5dd82'),('6e9e8c24-03de-43bc-8e1d-22cd2d142100','e67781ec-7c5e-468b-b3d8-496a4ad19a00'),('6e9e8c24-03de-43bc-8e1d-22cd2d142100','bf5ac41d-1e27-4ba7-a877-dad7ed3d49df'),('6e9e8c24-03de-43bc-8e1d-22cd2d142100','24e66baa-dd9c-4753-9de3-c08de6ab6407'),('6e9e8c24-03de-43bc-8e1d-22cd2d142100','794bf02a-8c13-4115-a1d1-0120c454afab'),('6e9e8c24-03de-43bc-8e1d-22cd2d142100','47274323-f7c7-4226-894a-dafa9672ff91'),('6e9e8c24-03de-43bc-8e1d-22cd2d142100','3e3eec0c-0493-45f2-a665-c60bc6085d1a'),('6e9e8c24-03de-43bc-8e1d-22cd2d142100','184ed3ef-dfe1-4eb5-a324-479f52b64451'),('6e9e8c24-03de-43bc-8e1d-22cd2d142100','4153122d-fc17-40dc-8cf1-c8aecba18a2a'),('6e9e8c24-03de-43bc-8e1d-22cd2d142100','ea025088-e52f-4ff5-b6ac-795d99ab2474'),('6e9e8c24-03de-43bc-8e1d-22cd2d142100','21ec7614-53ef-4b1a-81cd-a26e61c54fa2'),('6e9e8c24-03de-43bc-8e1d-22cd2d142100','d7f5665f-df1e-4f37-821e-45a16b4037df'),('6e9e8c24-03de-43bc-8e1d-22cd2d142100','644ec330-f06c-4bcc-936c-05db90dfb66c'),('1b8979b0-1f83-4e50-a145-04a6e7552582','2021bc01-3975-4236-87ff-8b8bcccf7705'),('1b8979b0-1f83-4e50-a145-04a6e7552582','052aa75c-22a5-450d-8c1f-3f8e0270a319'),('1b8979b0-1f83-4e50-a145-04a6e7552582','ac8f4199-c9ad-4016-99ae-72b51b632c8c'),('1b8979b0-1f83-4e50-a145-04a6e7552582','9ca70f75-8525-42b4-abff-fcc7a391f18f'),('1b8979b0-1f83-4e50-a145-04a6e7552582','06ec9cce-2fae-47fb-9b9c-c7c492789c0e'),('1b8979b0-1f83-4e50-a145-04a6e7552582','1e167bae-8f61-4a3b-bc31-724ed9d6ac26'),('1b8979b0-1f83-4e50-a145-04a6e7552582','7bb0f51e-9ded-4c35-901d-cf3df6a00ed7'),('1b8979b0-1f83-4e50-a145-04a6e7552582','4924eb97-3023-4f8f-9340-95096d89b091'),('1b8979b0-1f83-4e50-a145-04a6e7552582','aa214ede-e018-4366-9797-31188b884cf4'),('1b8979b0-1f83-4e50-a145-04a6e7552582','693ef142-72ea-44df-a2e2-80f30ee794b4'),('1b8979b0-1f83-4e50-a145-04a6e7552582','17b5b2ef-e117-4563-88cf-cfec4d712fa1'),('1b8979b0-1f83-4e50-a145-04a6e7552582','2119529d-d4b1-4f15-8bfe-7b2bc2136e7f');
/*!40000 ALTER TABLE `COMPOSITE_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CREDENTIAL`
--

DROP TABLE IF EXISTS `CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CREDENTIAL` (
  `ID` varchar(36) NOT NULL,
  `DEVICE` varchar(255) DEFAULT NULL,
  `HASH_ITERATIONS` int(11) DEFAULT NULL,
  `SALT` blob,
  `TYPE` varchar(255) DEFAULT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(36) DEFAULT NULL,
  `CREATED_DATE` bigint(20) DEFAULT NULL,
  `COUNTER` int(11) DEFAULT '0',
  `DIGITS` int(11) DEFAULT '6',
  `PERIOD` int(11) DEFAULT '30',
  `ALGORITHM` varchar(36) DEFAULT 'HmacSHA1',
  PRIMARY KEY (`ID`),
  KEY `FK_PFYR0GLASQYL0DEI3KL69R6V0` (`USER_ID`),
  CONSTRAINT `FK_PFYR0GLASQYL0DEI3KL69R6V0` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CREDENTIAL`
--

LOCK TABLES `CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `CREDENTIAL` DISABLE KEYS */;
INSERT INTO `CREDENTIAL` VALUES ('31714aae-61cf-4014-9e24-7ce1af0068a6',NULL,1,'_ºn.\Ìc.\09TÕ¬Ã ’','password','2vBOSRUEpo0SjDK2Ufk47vG5VOkTZMsu6uW/jtvzXARvYcI79of+gQO06kMDZmoPR3cmYOxvBdVziqvrj1gHmw==','d6a4298b-37a1-4834-ba24-b157a0e08658',1463039999000,0,0,0,NULL);
/*!40000 ALTER TABLE `CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOG`
--

DROP TABLE IF EXISTS `DATABASECHANGELOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DATABASECHANGELOG` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOG`
--

LOCK TABLES `DATABASECHANGELOG` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOG` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOG` VALUES ('1.0.0.Final','sthorger@redhat.com','META-INF/jpa-changelog-1.0.0.Final.xml','2016-05-12 09:54:10',1,'EXECUTED','7:00a57f7a6fb456639b34e62972e0ec02','createTable (x29), addPrimaryKey (x21), addUniqueConstraint (x9), addForeignKeyConstraint (x32)','',NULL,'3.4.1',NULL,NULL),('1.1.0.Beta1','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Beta1.xml','2016-05-12 09:54:10',2,'EXECUTED','7:0310eb8ba07cec616460794d42ade0fa','delete (x3), createTable (x3), addColumn (x5), addPrimaryKey (x3), addForeignKeyConstraint (x3), customChange','',NULL,'3.4.1',NULL,NULL),('1.1.0.Final','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Final.xml','2016-05-12 09:54:10',3,'EXECUTED','7:5d25857e708c3233ef4439df1f93f012','renameColumn','',NULL,'3.4.1',NULL,NULL),('1.2.0.Beta1','psilva@redhat.com','META-INF/jpa-changelog-1.2.0.Beta1.xml','2016-05-12 09:54:11',4,'EXECUTED','7:c7a54a1041d58eb3817a4a883b4d4e84','delete (x4), createTable (x8), addColumn (x2), addPrimaryKey (x6), addForeignKeyConstraint (x9), addUniqueConstraint (x2), addColumn, dropForeignKeyConstraint (x2), dropUniqueConstraint, renameColumn (x3), addUniqueConstraint, addForeignKeyConstra...','',NULL,'3.4.1',NULL,NULL),('1.2.0.RC1','bburke@redhat.com','META-INF/jpa-changelog-1.2.0.CR1.xml','2016-05-12 09:54:11',5,'EXECUTED','7:0f08df48468428e0f30ee59a8ec01a41','delete (x5), createTable (x3), addColumn, createTable (x4), addPrimaryKey (x7), addForeignKeyConstraint (x6), renameColumn, addColumn (x2), update, dropColumn, dropForeignKeyConstraint, renameColumn, addForeignKeyConstraint, dropForeignKeyConstrai...','',NULL,'3.4.1',NULL,NULL),('1.2.0.Final','keycloak','META-INF/jpa-changelog-1.2.0.Final.xml','2016-05-12 09:54:11',6,'EXECUTED','7:a3377a2059aefbf3b90ebb4c4cc8e2ab','update (x3)','',NULL,'3.4.1',NULL,NULL),('1.3.0','bburke@redhat.com','META-INF/jpa-changelog-1.3.0.xml','2016-05-12 09:54:12',7,'EXECUTED','7:04c1dbedc2aa3e9756d1a1668e003451','delete (x6), createTable (x7), addColumn, createTable, addColumn (x2), update, dropDefaultValue, dropColumn, addColumn, update (x4), addPrimaryKey (x4), dropPrimaryKey, dropColumn, addPrimaryKey (x4), addForeignKeyConstraint (x8), dropDefaultValue...','',NULL,'3.4.1',NULL,NULL),('1.4.0','bburke@redhat.com','META-INF/jpa-changelog-1.4.0.xml','2016-05-12 09:54:12',8,'EXECUTED','7:36ef39ed560ad07062d956db861042ba','delete (x7), addColumn (x5), dropColumn, renameTable (x2), update (x10), createTable (x3), customChange, dropPrimaryKey, addPrimaryKey (x4), addForeignKeyConstraint (x2), dropColumn, addColumn','',NULL,'3.4.1',NULL,NULL),('1.5.0','bburke@redhat.com','META-INF/jpa-changelog-1.5.0.xml','2016-05-12 09:54:13',9,'EXECUTED','7:cf12b04b79bea5152f165eb41f3955f6','delete (x7), dropDefaultValue, dropColumn, addColumn (x3)','',NULL,'3.4.1',NULL,NULL),('1.6.1_from15','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2016-05-12 09:54:13',10,'EXECUTED','7:7e32c8f05c755e8675764e7d5f514509','addColumn (x3), createTable (x2), addPrimaryKey (x2)','',NULL,'3.4.1',NULL,NULL),('1.6.1_from16','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2016-05-12 09:54:13',11,'MARK_RAN','7:2fa220758991285312eb84f3b4ff5336','dropPrimaryKey (x2), addColumn, update, dropColumn, addColumn, update, dropColumn, addPrimaryKey (x2)','',NULL,'3.4.1',NULL,NULL),('1.6.1','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2016-05-12 09:54:13',12,'EXECUTED','7:d41d8cd98f00b204e9800998ecf8427e','Empty','',NULL,'3.4.1',NULL,NULL);
/*!40000 ALTER TABLE `DATABASECHANGELOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOGLOCK`
--

DROP TABLE IF EXISTS `DATABASECHANGELOGLOCK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DATABASECHANGELOGLOCK` (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOGLOCK`
--

LOCK TABLES `DATABASECHANGELOGLOCK` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOGLOCK` VALUES (1,'\0',NULL,NULL);
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EVENT_ENTITY`
--

DROP TABLE IF EXISTS `EVENT_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EVENT_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `DETAILS_JSON` varchar(2550) DEFAULT NULL,
  `ERROR` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `SESSION_ID` varchar(255) DEFAULT NULL,
  `EVENT_TIME` bigint(20) DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EVENT_ENTITY`
--

LOCK TABLES `EVENT_ENTITY` WRITE;
/*!40000 ALTER TABLE `EVENT_ENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `EVENT_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FEDERATED_IDENTITY`
--

DROP TABLE IF EXISTS `FEDERATED_IDENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FEDERATED_IDENTITY` (
  `IDENTITY_PROVIDER` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `FEDERATED_USER_ID` varchar(255) DEFAULT NULL,
  `FEDERATED_USERNAME` varchar(255) DEFAULT NULL,
  `TOKEN` text,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`),
  KEY `FK404288B92EF007A6` (`USER_ID`),
  CONSTRAINT `FK404288B92EF007A6` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FEDERATED_IDENTITY`
--

LOCK TABLES `FEDERATED_IDENTITY` WRITE;
/*!40000 ALTER TABLE `FEDERATED_IDENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `FEDERATED_IDENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_PROVIDERS`
--

DROP TABLE IF EXISTS `FED_PROVIDERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FED_PROVIDERS` (
  `REALM_ID` varchar(36) NOT NULL,
  `USERFEDERATIONPROVIDERS_ID` varchar(36) NOT NULL,
  UNIQUE KEY `UK_DCCIRJLIPU1478VQC89DID88C` (`USERFEDERATIONPROVIDERS_ID`),
  KEY `FK_213LYQ09FKXQ8K8NY8DY3737T` (`REALM_ID`),
  CONSTRAINT `FK_213LYQ09FKXQ8K8NY8DY3737T` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`),
  CONSTRAINT `FK_DCCIRJLIPU1478VQC89DID88C` FOREIGN KEY (`USERFEDERATIONPROVIDERS_ID`) REFERENCES `USER_FEDERATION_PROVIDER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_PROVIDERS`
--

LOCK TABLES `FED_PROVIDERS` WRITE;
/*!40000 ALTER TABLE `FED_PROVIDERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_PROVIDERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDENTITY_PROVIDER` (
  `INTERNAL_ID` varchar(36) NOT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `PROVIDER_ALIAS` varchar(255) DEFAULT NULL,
  `PROVIDER_ID` varchar(255) DEFAULT NULL,
  `STORE_TOKEN` bit(1) NOT NULL DEFAULT b'0',
  `AUTHENTICATE_BY_DEFAULT` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) DEFAULT NULL,
  `ADD_TOKEN_ROLE` bit(1) NOT NULL DEFAULT b'1',
  `TRUST_EMAIL` bit(1) NOT NULL DEFAULT b'0',
  `UPDATE_PROFILE_FIRST_LGN_MD` varchar(255) NOT NULL DEFAULT 'on',
  PRIMARY KEY (`INTERNAL_ID`),
  UNIQUE KEY `UK_2DAELWNIBJI49AVXSRTUF6XJ33` (`PROVIDER_ALIAS`,`REALM_ID`),
  KEY `FK2B4EBC52AE5C3B34` (`REALM_ID`),
  CONSTRAINT `FK2B4EBC52AE5C3B34` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER`
--

LOCK TABLES `IDENTITY_PROVIDER` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER_CONFIG`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDENTITY_PROVIDER_CONFIG` (
  `IDENTITY_PROVIDER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER_ID`,`NAME`),
  CONSTRAINT `FKDC4897CF864C4E43` FOREIGN KEY (`IDENTITY_PROVIDER_ID`) REFERENCES `IDENTITY_PROVIDER` (`INTERNAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER_CONFIG`
--

LOCK TABLES `IDENTITY_PROVIDER_CONFIG` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER_MAPPER`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDENTITY_PROVIDER_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `IDP_ALIAS` varchar(255) NOT NULL,
  `IDP_MAPPER_NAME` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_IDPM_REALM` (`REALM_ID`),
  CONSTRAINT `FK_IDPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER_MAPPER`
--

LOCK TABLES `IDENTITY_PROVIDER_MAPPER` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDP_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `IDP_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDP_MAPPER_CONFIG` (
  `IDP_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`IDP_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_IDPMCONFIG` FOREIGN KEY (`IDP_MAPPER_ID`) REFERENCES `IDENTITY_PROVIDER_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDP_MAPPER_CONFIG`
--

LOCK TABLES `IDP_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `IDP_MAPPER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDP_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KEYCLOAK_ROLE`
--

DROP TABLE IF EXISTS `KEYCLOAK_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KEYCLOAK_ROLE` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_REALM_CONSTRAINT` varchar(36) DEFAULT NULL,
  `CLIENT_ROLE` bit(1) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `CLIENT` varchar(36) DEFAULT NULL,
  `REALM` varchar(36) DEFAULT NULL,
  `SCOPE_PARAM_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_J3RWUVD56ONTGSUHOGM184WW2-2` (`NAME`,`CLIENT_REALM_CONSTRAINT`),
  KEY `FK_6VYQFE4CN4WLQ8R6KT5VDSJ5C` (`REALM`),
  KEY `FK_KJHO5LE2C0RAL09FL8CM9WFW9` (`CLIENT`),
  CONSTRAINT `FK_6VYQFE4CN4WLQ8R6KT5VDSJ5C` FOREIGN KEY (`REALM`) REFERENCES `REALM` (`ID`),
  CONSTRAINT `FK_KJHO5LE2C0RAL09FL8CM9WFW9` FOREIGN KEY (`CLIENT`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KEYCLOAK_ROLE`
--

LOCK TABLES `KEYCLOAK_ROLE` WRITE;
/*!40000 ALTER TABLE `KEYCLOAK_ROLE` DISABLE KEYS */;
INSERT INTO `KEYCLOAK_ROLE` VALUES ('052aa75c-22a5-450d-8c1f-3f8e0270a319','e079390c-5e68-47ff-bc83-62aa6348dc8b','','${role_view-realm}','view-realm','dina','e079390c-5e68-47ff-bc83-62aa6348dc8b',NULL,'\0'),('06ec9cce-2fae-47fb-9b9c-c7c492789c0e','e079390c-5e68-47ff-bc83-62aa6348dc8b','','${role_view-events}','view-events','dina','e079390c-5e68-47ff-bc83-62aa6348dc8b',NULL,'\0'),('0a86aee6-8956-459b-ae1f-e8e9d38897f4','dina','\0','${role_offline-access}','offline_access','dina',NULL,'dina',''),('0e385573-6085-438e-9369-ed99bbbed114','master','\0','${role_offline-access}','offline_access','master',NULL,'master',''),('17b5b2ef-e117-4563-88cf-cfec4d712fa1','e079390c-5e68-47ff-bc83-62aa6348dc8b','','${role_manage-identity-providers}','manage-identity-providers','dina','e079390c-5e68-47ff-bc83-62aa6348dc8b',NULL,'\0'),('184ed3ef-dfe1-4eb5-a324-479f52b64451','a8668963-14d2-4564-a001-137e9fa67084','','${role_manage-realm}','manage-realm','master','a8668963-14d2-4564-a001-137e9fa67084',NULL,'\0'),('1b8979b0-1f83-4e50-a145-04a6e7552582','e079390c-5e68-47ff-bc83-62aa6348dc8b','','${role_realm-admin}','realm-admin','dina','e079390c-5e68-47ff-bc83-62aa6348dc8b',NULL,'\0'),('1e167bae-8f61-4a3b-bc31-724ed9d6ac26','e079390c-5e68-47ff-bc83-62aa6348dc8b','','${role_view-identity-providers}','view-identity-providers','dina','e079390c-5e68-47ff-bc83-62aa6348dc8b',NULL,'\0'),('1e916926-8aaa-4ba3-bcaa-c796763a2eb6','958151d1-bef5-423d-bde0-01fb9d8e0c3c','','${role_manage-account}','manage-account','dina','958151d1-bef5-423d-bde0-01fb9d8e0c3c',NULL,'\0'),('2021bc01-3975-4236-87ff-8b8bcccf7705','e079390c-5e68-47ff-bc83-62aa6348dc8b','','${role_create-client}','create-client','dina','e079390c-5e68-47ff-bc83-62aa6348dc8b',NULL,'\0'),('2119529d-d4b1-4f15-8bfe-7b2bc2136e7f','e079390c-5e68-47ff-bc83-62aa6348dc8b','','${role_impersonation}','impersonation','dina','e079390c-5e68-47ff-bc83-62aa6348dc8b',NULL,'\0'),('21ec7614-53ef-4b1a-81cd-a26e61c54fa2','a8668963-14d2-4564-a001-137e9fa67084','','${role_manage-events}','manage-events','master','a8668963-14d2-4564-a001-137e9fa67084',NULL,'\0'),('24e66baa-dd9c-4753-9de3-c08de6ab6407','a8668963-14d2-4564-a001-137e9fa67084','','${role_view-users}','view-users','master','a8668963-14d2-4564-a001-137e9fa67084',NULL,'\0'),('32f6159a-2b02-4a4e-8e76-9b7326007bd0','46c5db86-8f66-47a7-bb6d-7a920a804d7b','','${role_manage-users}','manage-users','master','46c5db86-8f66-47a7-bb6d-7a920a804d7b',NULL,'\0'),('3b5a87d5-389a-4ec3-8cfd-03feff144a4d','f28e2ec7-8aab-439e-8bf1-c594720f46ff','','${role_read-token}','read-token','master','f28e2ec7-8aab-439e-8bf1-c594720f46ff',NULL,'\0'),('3e3eec0c-0493-45f2-a665-c60bc6085d1a','a8668963-14d2-4564-a001-137e9fa67084','','${role_view-identity-providers}','view-identity-providers','master','a8668963-14d2-4564-a001-137e9fa67084',NULL,'\0'),('4153122d-fc17-40dc-8cf1-c8aecba18a2a','a8668963-14d2-4564-a001-137e9fa67084','','${role_manage-users}','manage-users','master','a8668963-14d2-4564-a001-137e9fa67084',NULL,'\0'),('46cf8cbd-d4a4-4943-8a1d-b12e8f842885','958151d1-bef5-423d-bde0-01fb9d8e0c3c','','${role_view-profile}','view-profile','dina','958151d1-bef5-423d-bde0-01fb9d8e0c3c',NULL,'\0'),('47274323-f7c7-4226-894a-dafa9672ff91','a8668963-14d2-4564-a001-137e9fa67084','','${role_view-events}','view-events','master','a8668963-14d2-4564-a001-137e9fa67084',NULL,'\0'),('4924eb97-3023-4f8f-9340-95096d89b091','e079390c-5e68-47ff-bc83-62aa6348dc8b','','${role_manage-users}','manage-users','dina','e079390c-5e68-47ff-bc83-62aa6348dc8b',NULL,'\0'),('5b868f9d-c09a-406a-bc9b-42bd1722703f','1b078076-bde9-4030-b3ce-fdded3a9f5db','','${role_manage-account}','manage-account','master','1b078076-bde9-4030-b3ce-fdded3a9f5db',NULL,'\0'),('644ec330-f06c-4bcc-936c-05db90dfb66c','a8668963-14d2-4564-a001-137e9fa67084','','${role_impersonation}','impersonation','master','a8668963-14d2-4564-a001-137e9fa67084',NULL,'\0'),('693ef142-72ea-44df-a2e2-80f30ee794b4','e079390c-5e68-47ff-bc83-62aa6348dc8b','','${role_manage-events}','manage-events','dina','e079390c-5e68-47ff-bc83-62aa6348dc8b',NULL,'\0'),('6c826456-6a59-4dfc-888b-e1b7690861c5','46c5db86-8f66-47a7-bb6d-7a920a804d7b','','${role_view-users}','view-users','master','46c5db86-8f66-47a7-bb6d-7a920a804d7b',NULL,'\0'),('6d06ea50-7d81-4a60-8539-7c9604aed056','46c5db86-8f66-47a7-bb6d-7a920a804d7b','','${role_manage-realm}','manage-realm','master','46c5db86-8f66-47a7-bb6d-7a920a804d7b',NULL,'\0'),('6e9e8c24-03de-43bc-8e1d-22cd2d142100','master','\0','${role_admin}','admin','master',NULL,'master','\0'),('71bf3d37-9fb3-4ed1-8e94-f1b316a77913','46c5db86-8f66-47a7-bb6d-7a920a804d7b','','${role_manage-events}','manage-events','master','46c5db86-8f66-47a7-bb6d-7a920a804d7b',NULL,'\0'),('731462a8-65ef-4e43-942d-94bbb48265c3','b43c2f96-3d6f-487a-a6e0-95e438729d9d','','${role_read-token}','read-token','dina','b43c2f96-3d6f-487a-a6e0-95e438729d9d',NULL,'\0'),('762b018f-150b-4be6-8c11-cf796daf1f37','46c5db86-8f66-47a7-bb6d-7a920a804d7b','','${role_manage-clients}','manage-clients','master','46c5db86-8f66-47a7-bb6d-7a920a804d7b',NULL,'\0'),('77372a92-58e2-474e-abac-b1beefb23f67','1b078076-bde9-4030-b3ce-fdded3a9f5db','','${role_view-profile}','view-profile','master','1b078076-bde9-4030-b3ce-fdded3a9f5db',NULL,'\0'),('794bf02a-8c13-4115-a1d1-0120c454afab','a8668963-14d2-4564-a001-137e9fa67084','','${role_view-clients}','view-clients','master','a8668963-14d2-4564-a001-137e9fa67084',NULL,'\0'),('7bb0f51e-9ded-4c35-901d-cf3df6a00ed7','e079390c-5e68-47ff-bc83-62aa6348dc8b','','${role_manage-realm}','manage-realm','dina','e079390c-5e68-47ff-bc83-62aa6348dc8b',NULL,'\0'),('87c5a222-e79a-465a-bde6-9e7776cc629c','46c5db86-8f66-47a7-bb6d-7a920a804d7b','','${role_view-identity-providers}','view-identity-providers','master','46c5db86-8f66-47a7-bb6d-7a920a804d7b',NULL,'\0'),('9ca70f75-8525-42b4-abff-fcc7a391f18f','e079390c-5e68-47ff-bc83-62aa6348dc8b','','${role_view-clients}','view-clients','dina','e079390c-5e68-47ff-bc83-62aa6348dc8b',NULL,'\0'),('a84fb7d4-5088-4001-baff-5f51cbd5dd82','46c5db86-8f66-47a7-bb6d-7a920a804d7b','','${role_impersonation}','impersonation','master','46c5db86-8f66-47a7-bb6d-7a920a804d7b',NULL,'\0'),('aa214ede-e018-4366-9797-31188b884cf4','e079390c-5e68-47ff-bc83-62aa6348dc8b','','${role_manage-clients}','manage-clients','dina','e079390c-5e68-47ff-bc83-62aa6348dc8b',NULL,'\0'),('aa664b9b-bc7a-499a-b14b-15b866f34f7a','46c5db86-8f66-47a7-bb6d-7a920a804d7b','','${role_view-clients}','view-clients','master','46c5db86-8f66-47a7-bb6d-7a920a804d7b',NULL,'\0'),('ac8f4199-c9ad-4016-99ae-72b51b632c8c','e079390c-5e68-47ff-bc83-62aa6348dc8b','','${role_view-users}','view-users','dina','e079390c-5e68-47ff-bc83-62aa6348dc8b',NULL,'\0'),('bf5ac41d-1e27-4ba7-a877-dad7ed3d49df','a8668963-14d2-4564-a001-137e9fa67084','','${role_view-realm}','view-realm','master','a8668963-14d2-4564-a001-137e9fa67084',NULL,'\0'),('cb8fdb6a-c773-40cb-a4de-7006fa679c4c','46c5db86-8f66-47a7-bb6d-7a920a804d7b','','${role_create-client}','create-client','master','46c5db86-8f66-47a7-bb6d-7a920a804d7b',NULL,'\0'),('d7f5665f-df1e-4f37-821e-45a16b4037df','a8668963-14d2-4564-a001-137e9fa67084','','${role_manage-identity-providers}','manage-identity-providers','master','a8668963-14d2-4564-a001-137e9fa67084',NULL,'\0'),('dd0d0c83-4cca-4db2-86e8-1e4c9fc3961d','46c5db86-8f66-47a7-bb6d-7a920a804d7b','','${role_manage-identity-providers}','manage-identity-providers','master','46c5db86-8f66-47a7-bb6d-7a920a804d7b',NULL,'\0'),('de857ec1-374b-4761-acc7-b8c4b60654f6','master','\0','${role_create-realm}','create-realm','master',NULL,'master','\0'),('e67781ec-7c5e-468b-b3d8-496a4ad19a00','a8668963-14d2-4564-a001-137e9fa67084','','${role_create-client}','create-client','master','a8668963-14d2-4564-a001-137e9fa67084',NULL,'\0'),('e918ffef-0ccb-4e47-a943-bb73cedab781','46c5db86-8f66-47a7-bb6d-7a920a804d7b','','${role_view-realm}','view-realm','master','46c5db86-8f66-47a7-bb6d-7a920a804d7b',NULL,'\0'),('ea025088-e52f-4ff5-b6ac-795d99ab2474','a8668963-14d2-4564-a001-137e9fa67084','','${role_manage-clients}','manage-clients','master','a8668963-14d2-4564-a001-137e9fa67084',NULL,'\0'),('f7236097-f420-48d6-8e20-0b4678d572d3','46c5db86-8f66-47a7-bb6d-7a920a804d7b','','${role_view-events}','view-events','master','46c5db86-8f66-47a7-bb6d-7a920a804d7b',NULL,'\0');
/*!40000 ALTER TABLE `KEYCLOAK_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MIGRATION_MODEL`
--

DROP TABLE IF EXISTS `MIGRATION_MODEL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MIGRATION_MODEL` (
  `ID` varchar(36) NOT NULL,
  `VERSION` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MIGRATION_MODEL`
--

LOCK TABLES `MIGRATION_MODEL` WRITE;
/*!40000 ALTER TABLE `MIGRATION_MODEL` DISABLE KEYS */;
INSERT INTO `MIGRATION_MODEL` VALUES ('SINGLETON','1.6.0');
/*!40000 ALTER TABLE `MIGRATION_MODEL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OFFLINE_CLIENT_SESSION`
--

DROP TABLE IF EXISTS `OFFLINE_CLIENT_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OFFLINE_CLIENT_SESSION` (
  `CLIENT_SESSION_ID` varchar(36) NOT NULL,
  `USER_SESSION_ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(36) NOT NULL,
  `OFFLINE_FLAG` varchar(4) NOT NULL,
  `TIMESTAMP` int(11) DEFAULT NULL,
  `DATA` longtext,
  PRIMARY KEY (`CLIENT_SESSION_ID`,`OFFLINE_FLAG`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OFFLINE_CLIENT_SESSION`
--

LOCK TABLES `OFFLINE_CLIENT_SESSION` WRITE;
/*!40000 ALTER TABLE `OFFLINE_CLIENT_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `OFFLINE_CLIENT_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OFFLINE_USER_SESSION`
--

DROP TABLE IF EXISTS `OFFLINE_USER_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OFFLINE_USER_SESSION` (
  `USER_SESSION_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(36) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `LAST_SESSION_REFRESH` int(11) DEFAULT NULL,
  `OFFLINE_FLAG` varchar(4) NOT NULL,
  `DATA` longtext,
  PRIMARY KEY (`USER_SESSION_ID`,`OFFLINE_FLAG`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OFFLINE_USER_SESSION`
--

LOCK TABLES `OFFLINE_USER_SESSION` WRITE;
/*!40000 ALTER TABLE `OFFLINE_USER_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `OFFLINE_USER_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROTOCOL_MAPPER`
--

DROP TABLE IF EXISTS `PROTOCOL_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PROTOCOL_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `PROTOCOL` varchar(255) NOT NULL,
  `PROTOCOL_MAPPER_NAME` varchar(255) NOT NULL,
  `CONSENT_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  `CONSENT_TEXT` varchar(255) DEFAULT NULL,
  `CLIENT_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_PCM_REALM` (`CLIENT_ID`),
  CONSTRAINT `FK_PCM_REALM` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROTOCOL_MAPPER`
--

LOCK TABLES `PROTOCOL_MAPPER` WRITE;
/*!40000 ALTER TABLE `PROTOCOL_MAPPER` DISABLE KEYS */;
INSERT INTO `PROTOCOL_MAPPER` VALUES ('02561864-49d3-4ef2-acba-36a806fdd5a5','locale','openid-connect','oidc-usermodel-attribute-mapper','\0','${locale}','f507af43-5e48-4267-804e-5af7b0cac5ca'),('0302d86c-e2f1-43cf-b294-4004c00fc3b1','role list','saml','saml-role-list-mapper','\0',NULL,'46c5db86-8f66-47a7-bb6d-7a920a804d7b'),('036d1e39-b481-482a-9a9c-e860cf1008da','given name','openid-connect','oidc-usermodel-property-mapper','','${givenName}','0e43972d-ab4c-40b1-a473-dffa1345210d'),('0503f083-089b-431e-847d-21ddd542dfc7','username','openid-connect','oidc-usermodel-property-mapper','','${username}','01c31bbd-1152-436d-b224-554479b6d23a'),('05352eae-647b-4085-8c2b-efe393cd34b9','username','openid-connect','oidc-usermodel-property-mapper','','${username}','958151d1-bef5-423d-bde0-01fb9d8e0c3c'),('056a9993-92c6-4f73-82e2-ab16a2efa12a','full name','openid-connect','oidc-full-name-mapper','','${fullName}','a8052be8-34bd-4b5e-a077-94f1562c3ee6'),('0597eefa-2500-4a86-b412-114d63553900','username','openid-connect','oidc-usermodel-property-mapper','','${username}','f28e2ec7-8aab-439e-8bf1-c594720f46ff'),('0966ab0a-97f9-4f91-a0f0-8588983bcea6','given name','openid-connect','oidc-usermodel-property-mapper','','${givenName}','f28e2ec7-8aab-439e-8bf1-c594720f46ff'),('1010501d-81e4-4394-9073-dab5c5dbb2bc','family name','openid-connect','oidc-usermodel-property-mapper','','${familyName}','f507af43-5e48-4267-804e-5af7b0cac5ca'),('14bd0b2f-c8bb-414a-9d62-b2c511da7004','username','openid-connect','oidc-usermodel-property-mapper','','${username}','a8668963-14d2-4564-a001-137e9fa67084'),('1541dc55-c268-4612-b9cd-e1931a7181bc','role list','saml','saml-role-list-mapper','\0',NULL,'a8052be8-34bd-4b5e-a077-94f1562c3ee6'),('15ca7525-3a36-4c34-a2c7-47bbbf88099d','username','openid-connect','oidc-usermodel-property-mapper','','${username}','e079390c-5e68-47ff-bc83-62aa6348dc8b'),('19ae1cc3-031e-4dd9-8fee-573f18ad5d7f','family name','openid-connect','oidc-usermodel-property-mapper','','${familyName}','b43c2f96-3d6f-487a-a6e0-95e438729d9d'),('25bc5259-70d5-4de1-bb3a-3e26876948f0','given name','openid-connect','oidc-usermodel-property-mapper','','${givenName}','a8668963-14d2-4564-a001-137e9fa67084'),('28a88d2f-2a17-43b2-95c1-fdd419499f8a','family name','openid-connect','oidc-usermodel-property-mapper','','${familyName}','a8668963-14d2-4564-a001-137e9fa67084'),('2c3f6296-b615-4f40-84bd-ac8c883d93fe','role list','saml','saml-role-list-mapper','\0',NULL,'0e43972d-ab4c-40b1-a473-dffa1345210d'),('2cc79daa-5e90-4596-bd85-6060bbcdf133','email','openid-connect','oidc-usermodel-property-mapper','','${email}','a8052be8-34bd-4b5e-a077-94f1562c3ee6'),('3150f916-be02-4d55-85a3-4a42172daf54','role list','saml','saml-role-list-mapper','\0',NULL,'a8668963-14d2-4564-a001-137e9fa67084'),('34d82dd0-cee7-4069-af33-ec36f5bd70a2','username','openid-connect','oidc-usermodel-property-mapper','','${username}','f507af43-5e48-4267-804e-5af7b0cac5ca'),('3ef4104d-8dec-4392-beb3-7bfd78702357','username','openid-connect','oidc-usermodel-property-mapper','','${username}','b43c2f96-3d6f-487a-a6e0-95e438729d9d'),('461730cb-dad9-4ecb-9440-615828de1cf9','given name','openid-connect','oidc-usermodel-property-mapper','','${givenName}','e079390c-5e68-47ff-bc83-62aa6348dc8b'),('4793a4d4-bd8b-4a12-90fb-300afbb4ba87','role list','saml','saml-role-list-mapper','\0',NULL,'1b078076-bde9-4030-b3ce-fdded3a9f5db'),('4ac7b850-77de-40b6-9acc-83067c8d9c34','full name','openid-connect','oidc-full-name-mapper','','${fullName}','46c5db86-8f66-47a7-bb6d-7a920a804d7b'),('4cd5371c-3124-4194-b5c3-7a5a6a3f4a8f','family name','openid-connect','oidc-usermodel-property-mapper','','${familyName}','f28e2ec7-8aab-439e-8bf1-c594720f46ff'),('50b64910-3d7f-4d3e-9eec-b0071bcda675','username','openid-connect','oidc-usermodel-property-mapper','','${username}','1b078076-bde9-4030-b3ce-fdded3a9f5db'),('56222fde-f560-4434-b769-4f6e4bc106b9','full name','openid-connect','oidc-full-name-mapper','','${fullName}','b43c2f96-3d6f-487a-a6e0-95e438729d9d'),('5c63b1de-215e-460b-ac7c-ab8950d0505d','given name','openid-connect','oidc-usermodel-property-mapper','','${givenName}','b43c2f96-3d6f-487a-a6e0-95e438729d9d'),('5c74ec10-c527-44bb-a76e-bed617725034','username','openid-connect','oidc-usermodel-property-mapper','','${username}','a8052be8-34bd-4b5e-a077-94f1562c3ee6'),('66882b02-d6a2-4090-b848-f434be07f5f5','email','openid-connect','oidc-usermodel-property-mapper','','${email}','958151d1-bef5-423d-bde0-01fb9d8e0c3c'),('6e388eeb-8a45-4880-8b26-19fd3296a37f','full name','openid-connect','oidc-full-name-mapper','','${fullName}','958151d1-bef5-423d-bde0-01fb9d8e0c3c'),('73a7667f-518c-4af1-b3b6-99dc60fbc82c','email','openid-connect','oidc-usermodel-property-mapper','','${email}','a8668963-14d2-4564-a001-137e9fa67084'),('7836633c-e927-4507-8408-511ecd51874a','full name','openid-connect','oidc-full-name-mapper','','${fullName}','e079390c-5e68-47ff-bc83-62aa6348dc8b'),('7a6c8e77-efa9-40c4-8e98-55e4bf8112ed','given name','openid-connect','oidc-usermodel-property-mapper','','${givenName}','a8052be8-34bd-4b5e-a077-94f1562c3ee6'),('7b1c9ff2-98be-4abd-9c98-bf68fa4c4d21','role list','saml','saml-role-list-mapper','\0',NULL,'01c31bbd-1152-436d-b224-554479b6d23a'),('7cb37bb5-af92-42b2-8a3e-13050787139a','given name','openid-connect','oidc-usermodel-property-mapper','','${givenName}','46c5db86-8f66-47a7-bb6d-7a920a804d7b'),('7cdb527f-99d3-429b-89a2-6247e66d75aa','given name','openid-connect','oidc-usermodel-property-mapper','','${givenName}','1b078076-bde9-4030-b3ce-fdded3a9f5db'),('7d705d70-0bd6-4c6e-a28a-d04cf330e140','role list','saml','saml-role-list-mapper','\0',NULL,'958151d1-bef5-423d-bde0-01fb9d8e0c3c'),('8199b5d6-2e4b-4687-bde6-71e797ffa903','family name','openid-connect','oidc-usermodel-property-mapper','','${familyName}','e079390c-5e68-47ff-bc83-62aa6348dc8b'),('83d8c6a2-3f2a-4647-ad69-d340195130d3','email','openid-connect','oidc-usermodel-property-mapper','','${email}','1b078076-bde9-4030-b3ce-fdded3a9f5db'),('856c6c29-4d73-4057-86f3-4cf4279c432c','family name','openid-connect','oidc-usermodel-property-mapper','','${familyName}','0e43972d-ab4c-40b1-a473-dffa1345210d'),('89c4b2e0-2b2a-48a2-87b3-c0466cb3d432','full name','openid-connect','oidc-full-name-mapper','','${fullName}','0e43972d-ab4c-40b1-a473-dffa1345210d'),('937a6e73-e01b-4478-a30a-5a5e14c73fd6','email','openid-connect','oidc-usermodel-property-mapper','','${email}','e079390c-5e68-47ff-bc83-62aa6348dc8b'),('9467a215-f999-4323-a334-0e49acb3c0d0','family name','openid-connect','oidc-usermodel-property-mapper','','${familyName}','1b078076-bde9-4030-b3ce-fdded3a9f5db'),('9c7c04a3-b177-4952-bb82-2a69f3c6f517','full name','openid-connect','oidc-full-name-mapper','','${fullName}','01c31bbd-1152-436d-b224-554479b6d23a'),('9dacc5a4-d512-402a-b77a-077c7b0276cd','full name','openid-connect','oidc-full-name-mapper','','${fullName}','1b078076-bde9-4030-b3ce-fdded3a9f5db'),('9ff63032-fc8e-4f60-a4b2-4a61c3e8e9bd','role list','saml','saml-role-list-mapper','\0',NULL,'f28e2ec7-8aab-439e-8bf1-c594720f46ff'),('a04b0bba-6d24-4c3e-a796-1c076344887d','given name','openid-connect','oidc-usermodel-property-mapper','','${givenName}','01c31bbd-1152-436d-b224-554479b6d23a'),('a2421659-cd80-4156-93a3-99b6f170f61f','full name','openid-connect','oidc-full-name-mapper','','${fullName}','f507af43-5e48-4267-804e-5af7b0cac5ca'),('a2541051-bebf-41f2-83ec-c121a8d81e98','family name','openid-connect','oidc-usermodel-property-mapper','','${familyName}','01c31bbd-1152-436d-b224-554479b6d23a'),('a3d04fc1-0bc2-4c98-b4c7-c98af4f9bacf','username','openid-connect','oidc-usermodel-property-mapper','','${username}','46c5db86-8f66-47a7-bb6d-7a920a804d7b'),('a3db05b1-ed27-4ad0-b9e2-ba4d43a2dcb5','family name','openid-connect','oidc-usermodel-property-mapper','','${familyName}','a8052be8-34bd-4b5e-a077-94f1562c3ee6'),('a3e6c606-919d-453a-9c85-5037be1be068','family name','openid-connect','oidc-usermodel-property-mapper','','${familyName}','46c5db86-8f66-47a7-bb6d-7a920a804d7b'),('a592a640-05f4-4051-a48b-c31b0e076ec0','full name','openid-connect','oidc-full-name-mapper','','${fullName}','f28e2ec7-8aab-439e-8bf1-c594720f46ff'),('a6dabd18-bf61-4911-b592-d0774fcb11e1','given name','openid-connect','oidc-usermodel-property-mapper','','${givenName}','958151d1-bef5-423d-bde0-01fb9d8e0c3c'),('b0c8f2aa-55c1-49f9-96a5-9855aac535c3','email','openid-connect','oidc-usermodel-property-mapper','','${email}','0e43972d-ab4c-40b1-a473-dffa1345210d'),('b336f6ff-435a-43f1-ac87-92bdf03f2196','email','openid-connect','oidc-usermodel-property-mapper','','${email}','b43c2f96-3d6f-487a-a6e0-95e438729d9d'),('bdcb7a02-642e-4e7a-8a82-9d4ae45c168a','full name','openid-connect','oidc-full-name-mapper','','${fullName}','a8668963-14d2-4564-a001-137e9fa67084'),('c9f99979-8411-4250-89c0-5a732d8a6e18','role list','saml','saml-role-list-mapper','\0',NULL,'f507af43-5e48-4267-804e-5af7b0cac5ca'),('d366e7a2-1698-4885-b746-8c9190fac493','given name','openid-connect','oidc-usermodel-property-mapper','','${givenName}','f507af43-5e48-4267-804e-5af7b0cac5ca'),('d387c7dd-6c48-4c14-99e1-d959d33179db','family name','openid-connect','oidc-usermodel-property-mapper','','${familyName}','958151d1-bef5-423d-bde0-01fb9d8e0c3c'),('db4120da-465c-478c-a3d4-06f127e50a88','username','openid-connect','oidc-usermodel-property-mapper','','${username}','0e43972d-ab4c-40b1-a473-dffa1345210d'),('db81b0c6-7859-48c2-a813-cce020df4721','role list','saml','saml-role-list-mapper','\0',NULL,'b43c2f96-3d6f-487a-a6e0-95e438729d9d'),('dccb466e-2be2-4c10-a1ef-340090fd8094','email','openid-connect','oidc-usermodel-property-mapper','','${email}','f28e2ec7-8aab-439e-8bf1-c594720f46ff'),('e19180ec-6866-4d5b-8e5f-7fd950cf64ea','email','openid-connect','oidc-usermodel-property-mapper','','${email}','f507af43-5e48-4267-804e-5af7b0cac5ca'),('e4dd6ed0-a180-4ae6-b16f-114097dd921d','role list','saml','saml-role-list-mapper','\0',NULL,'e079390c-5e68-47ff-bc83-62aa6348dc8b'),('e630da2c-ab2e-4bbe-b5ca-a52152a68ffa','email','openid-connect','oidc-usermodel-property-mapper','','${email}','46c5db86-8f66-47a7-bb6d-7a920a804d7b'),('f945d385-05ff-4f68-bcaf-5b918423f296','email','openid-connect','oidc-usermodel-property-mapper','','${email}','01c31bbd-1152-436d-b224-554479b6d23a'),('f9ccd921-69fe-4a36-ac58-41024686c551','locale','openid-connect','oidc-usermodel-attribute-mapper','\0','${locale}','01c31bbd-1152-436d-b224-554479b6d23a');
/*!40000 ALTER TABLE `PROTOCOL_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROTOCOL_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `PROTOCOL_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PROTOCOL_MAPPER_CONFIG` (
  `PROTOCOL_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`PROTOCOL_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_PMCONFIG` FOREIGN KEY (`PROTOCOL_MAPPER_ID`) REFERENCES `PROTOCOL_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROTOCOL_MAPPER_CONFIG`
--

LOCK TABLES `PROTOCOL_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `PROTOCOL_MAPPER_CONFIG` DISABLE KEYS */;
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('02561864-49d3-4ef2-acba-36a806fdd5a5','true','access.token.claim'),('02561864-49d3-4ef2-acba-36a806fdd5a5','locale','claim.name'),('02561864-49d3-4ef2-acba-36a806fdd5a5','true','id.token.claim'),('02561864-49d3-4ef2-acba-36a806fdd5a5','String','jsonType.label'),('02561864-49d3-4ef2-acba-36a806fdd5a5','locale','user.attribute'),('0302d86c-e2f1-43cf-b294-4004c00fc3b1','Role','attribute.name'),('0302d86c-e2f1-43cf-b294-4004c00fc3b1','Basic','attribute.nameformat'),('0302d86c-e2f1-43cf-b294-4004c00fc3b1','false','single'),('036d1e39-b481-482a-9a9c-e860cf1008da','true','access.token.claim'),('036d1e39-b481-482a-9a9c-e860cf1008da','given_name','claim.name'),('036d1e39-b481-482a-9a9c-e860cf1008da','true','id.token.claim'),('036d1e39-b481-482a-9a9c-e860cf1008da','String','jsonType.label'),('036d1e39-b481-482a-9a9c-e860cf1008da','firstName','user.attribute'),('0503f083-089b-431e-847d-21ddd542dfc7','true','access.token.claim'),('0503f083-089b-431e-847d-21ddd542dfc7','preferred_username','claim.name'),('0503f083-089b-431e-847d-21ddd542dfc7','true','id.token.claim'),('0503f083-089b-431e-847d-21ddd542dfc7','String','jsonType.label'),('0503f083-089b-431e-847d-21ddd542dfc7','username','user.attribute'),('05352eae-647b-4085-8c2b-efe393cd34b9','true','access.token.claim'),('05352eae-647b-4085-8c2b-efe393cd34b9','preferred_username','claim.name'),('05352eae-647b-4085-8c2b-efe393cd34b9','true','id.token.claim'),('05352eae-647b-4085-8c2b-efe393cd34b9','String','jsonType.label'),('05352eae-647b-4085-8c2b-efe393cd34b9','username','user.attribute'),('056a9993-92c6-4f73-82e2-ab16a2efa12a','true','access.token.claim'),('056a9993-92c6-4f73-82e2-ab16a2efa12a','true','id.token.claim'),('0597eefa-2500-4a86-b412-114d63553900','true','access.token.claim'),('0597eefa-2500-4a86-b412-114d63553900','preferred_username','claim.name'),('0597eefa-2500-4a86-b412-114d63553900','true','id.token.claim'),('0597eefa-2500-4a86-b412-114d63553900','String','jsonType.label'),('0597eefa-2500-4a86-b412-114d63553900','username','user.attribute'),('0966ab0a-97f9-4f91-a0f0-8588983bcea6','true','access.token.claim'),('0966ab0a-97f9-4f91-a0f0-8588983bcea6','given_name','claim.name'),('0966ab0a-97f9-4f91-a0f0-8588983bcea6','true','id.token.claim'),('0966ab0a-97f9-4f91-a0f0-8588983bcea6','String','jsonType.label'),('0966ab0a-97f9-4f91-a0f0-8588983bcea6','firstName','user.attribute'),('1010501d-81e4-4394-9073-dab5c5dbb2bc','true','access.token.claim'),('1010501d-81e4-4394-9073-dab5c5dbb2bc','family_name','claim.name'),('1010501d-81e4-4394-9073-dab5c5dbb2bc','true','id.token.claim'),('1010501d-81e4-4394-9073-dab5c5dbb2bc','String','jsonType.label'),('1010501d-81e4-4394-9073-dab5c5dbb2bc','lastName','user.attribute'),('14bd0b2f-c8bb-414a-9d62-b2c511da7004','true','access.token.claim'),('14bd0b2f-c8bb-414a-9d62-b2c511da7004','preferred_username','claim.name'),('14bd0b2f-c8bb-414a-9d62-b2c511da7004','true','id.token.claim'),('14bd0b2f-c8bb-414a-9d62-b2c511da7004','String','jsonType.label'),('14bd0b2f-c8bb-414a-9d62-b2c511da7004','username','user.attribute'),('1541dc55-c268-4612-b9cd-e1931a7181bc','Role','attribute.name'),('1541dc55-c268-4612-b9cd-e1931a7181bc','Basic','attribute.nameformat'),('1541dc55-c268-4612-b9cd-e1931a7181bc','false','single'),('15ca7525-3a36-4c34-a2c7-47bbbf88099d','true','access.token.claim'),('15ca7525-3a36-4c34-a2c7-47bbbf88099d','preferred_username','claim.name'),('15ca7525-3a36-4c34-a2c7-47bbbf88099d','true','id.token.claim'),('15ca7525-3a36-4c34-a2c7-47bbbf88099d','String','jsonType.label'),('15ca7525-3a36-4c34-a2c7-47bbbf88099d','username','user.attribute'),('19ae1cc3-031e-4dd9-8fee-573f18ad5d7f','true','access.token.claim'),('19ae1cc3-031e-4dd9-8fee-573f18ad5d7f','family_name','claim.name'),('19ae1cc3-031e-4dd9-8fee-573f18ad5d7f','true','id.token.claim'),('19ae1cc3-031e-4dd9-8fee-573f18ad5d7f','String','jsonType.label'),('19ae1cc3-031e-4dd9-8fee-573f18ad5d7f','lastName','user.attribute'),('25bc5259-70d5-4de1-bb3a-3e26876948f0','true','access.token.claim'),('25bc5259-70d5-4de1-bb3a-3e26876948f0','given_name','claim.name'),('25bc5259-70d5-4de1-bb3a-3e26876948f0','true','id.token.claim'),('25bc5259-70d5-4de1-bb3a-3e26876948f0','String','jsonType.label'),('25bc5259-70d5-4de1-bb3a-3e26876948f0','firstName','user.attribute'),('28a88d2f-2a17-43b2-95c1-fdd419499f8a','true','access.token.claim'),('28a88d2f-2a17-43b2-95c1-fdd419499f8a','family_name','claim.name'),('28a88d2f-2a17-43b2-95c1-fdd419499f8a','true','id.token.claim'),('28a88d2f-2a17-43b2-95c1-fdd419499f8a','String','jsonType.label'),('28a88d2f-2a17-43b2-95c1-fdd419499f8a','lastName','user.attribute'),('2c3f6296-b615-4f40-84bd-ac8c883d93fe','Role','attribute.name'),('2c3f6296-b615-4f40-84bd-ac8c883d93fe','Basic','attribute.nameformat'),('2c3f6296-b615-4f40-84bd-ac8c883d93fe','false','single'),('2cc79daa-5e90-4596-bd85-6060bbcdf133','true','access.token.claim'),('2cc79daa-5e90-4596-bd85-6060bbcdf133','email','claim.name'),('2cc79daa-5e90-4596-bd85-6060bbcdf133','true','id.token.claim'),('2cc79daa-5e90-4596-bd85-6060bbcdf133','String','jsonType.label'),('2cc79daa-5e90-4596-bd85-6060bbcdf133','email','user.attribute'),('3150f916-be02-4d55-85a3-4a42172daf54','Role','attribute.name'),('3150f916-be02-4d55-85a3-4a42172daf54','Basic','attribute.nameformat'),('3150f916-be02-4d55-85a3-4a42172daf54','false','single'),('34d82dd0-cee7-4069-af33-ec36f5bd70a2','true','access.token.claim'),('34d82dd0-cee7-4069-af33-ec36f5bd70a2','preferred_username','claim.name'),('34d82dd0-cee7-4069-af33-ec36f5bd70a2','true','id.token.claim'),('34d82dd0-cee7-4069-af33-ec36f5bd70a2','String','jsonType.label'),('34d82dd0-cee7-4069-af33-ec36f5bd70a2','username','user.attribute'),('3ef4104d-8dec-4392-beb3-7bfd78702357','true','access.token.claim'),('3ef4104d-8dec-4392-beb3-7bfd78702357','preferred_username','claim.name'),('3ef4104d-8dec-4392-beb3-7bfd78702357','true','id.token.claim'),('3ef4104d-8dec-4392-beb3-7bfd78702357','String','jsonType.label'),('3ef4104d-8dec-4392-beb3-7bfd78702357','username','user.attribute'),('461730cb-dad9-4ecb-9440-615828de1cf9','true','access.token.claim'),('461730cb-dad9-4ecb-9440-615828de1cf9','given_name','claim.name'),('461730cb-dad9-4ecb-9440-615828de1cf9','true','id.token.claim'),('461730cb-dad9-4ecb-9440-615828de1cf9','String','jsonType.label'),('461730cb-dad9-4ecb-9440-615828de1cf9','firstName','user.attribute'),('4793a4d4-bd8b-4a12-90fb-300afbb4ba87','Role','attribute.name'),('4793a4d4-bd8b-4a12-90fb-300afbb4ba87','Basic','attribute.nameformat'),('4793a4d4-bd8b-4a12-90fb-300afbb4ba87','false','single'),('4ac7b850-77de-40b6-9acc-83067c8d9c34','true','access.token.claim'),('4ac7b850-77de-40b6-9acc-83067c8d9c34','true','id.token.claim'),('4cd5371c-3124-4194-b5c3-7a5a6a3f4a8f','true','access.token.claim'),('4cd5371c-3124-4194-b5c3-7a5a6a3f4a8f','family_name','claim.name'),('4cd5371c-3124-4194-b5c3-7a5a6a3f4a8f','true','id.token.claim'),('4cd5371c-3124-4194-b5c3-7a5a6a3f4a8f','String','jsonType.label'),('4cd5371c-3124-4194-b5c3-7a5a6a3f4a8f','lastName','user.attribute'),('50b64910-3d7f-4d3e-9eec-b0071bcda675','true','access.token.claim'),('50b64910-3d7f-4d3e-9eec-b0071bcda675','preferred_username','claim.name'),('50b64910-3d7f-4d3e-9eec-b0071bcda675','true','id.token.claim'),('50b64910-3d7f-4d3e-9eec-b0071bcda675','String','jsonType.label'),('50b64910-3d7f-4d3e-9eec-b0071bcda675','username','user.attribute'),('56222fde-f560-4434-b769-4f6e4bc106b9','true','access.token.claim'),('56222fde-f560-4434-b769-4f6e4bc106b9','true','id.token.claim'),('5c63b1de-215e-460b-ac7c-ab8950d0505d','true','access.token.claim'),('5c63b1de-215e-460b-ac7c-ab8950d0505d','given_name','claim.name'),('5c63b1de-215e-460b-ac7c-ab8950d0505d','true','id.token.claim'),('5c63b1de-215e-460b-ac7c-ab8950d0505d','String','jsonType.label'),('5c63b1de-215e-460b-ac7c-ab8950d0505d','firstName','user.attribute'),('5c74ec10-c527-44bb-a76e-bed617725034','true','access.token.claim'),('5c74ec10-c527-44bb-a76e-bed617725034','preferred_username','claim.name'),('5c74ec10-c527-44bb-a76e-bed617725034','true','id.token.claim'),('5c74ec10-c527-44bb-a76e-bed617725034','String','jsonType.label'),('5c74ec10-c527-44bb-a76e-bed617725034','username','user.attribute'),('66882b02-d6a2-4090-b848-f434be07f5f5','true','access.token.claim'),('66882b02-d6a2-4090-b848-f434be07f5f5','email','claim.name'),('66882b02-d6a2-4090-b848-f434be07f5f5','true','id.token.claim'),('66882b02-d6a2-4090-b848-f434be07f5f5','String','jsonType.label'),('66882b02-d6a2-4090-b848-f434be07f5f5','email','user.attribute'),('6e388eeb-8a45-4880-8b26-19fd3296a37f','true','access.token.claim'),('6e388eeb-8a45-4880-8b26-19fd3296a37f','true','id.token.claim'),('73a7667f-518c-4af1-b3b6-99dc60fbc82c','true','access.token.claim'),('73a7667f-518c-4af1-b3b6-99dc60fbc82c','email','claim.name'),('73a7667f-518c-4af1-b3b6-99dc60fbc82c','true','id.token.claim'),('73a7667f-518c-4af1-b3b6-99dc60fbc82c','String','jsonType.label'),('73a7667f-518c-4af1-b3b6-99dc60fbc82c','email','user.attribute'),('7836633c-e927-4507-8408-511ecd51874a','true','access.token.claim'),('7836633c-e927-4507-8408-511ecd51874a','true','id.token.claim'),('7a6c8e77-efa9-40c4-8e98-55e4bf8112ed','true','access.token.claim'),('7a6c8e77-efa9-40c4-8e98-55e4bf8112ed','given_name','claim.name'),('7a6c8e77-efa9-40c4-8e98-55e4bf8112ed','true','id.token.claim'),('7a6c8e77-efa9-40c4-8e98-55e4bf8112ed','String','jsonType.label'),('7a6c8e77-efa9-40c4-8e98-55e4bf8112ed','firstName','user.attribute'),('7b1c9ff2-98be-4abd-9c98-bf68fa4c4d21','Role','attribute.name'),('7b1c9ff2-98be-4abd-9c98-bf68fa4c4d21','Basic','attribute.nameformat'),('7b1c9ff2-98be-4abd-9c98-bf68fa4c4d21','false','single'),('7cb37bb5-af92-42b2-8a3e-13050787139a','true','access.token.claim'),('7cb37bb5-af92-42b2-8a3e-13050787139a','given_name','claim.name'),('7cb37bb5-af92-42b2-8a3e-13050787139a','true','id.token.claim'),('7cb37bb5-af92-42b2-8a3e-13050787139a','String','jsonType.label'),('7cb37bb5-af92-42b2-8a3e-13050787139a','firstName','user.attribute'),('7cdb527f-99d3-429b-89a2-6247e66d75aa','true','access.token.claim'),('7cdb527f-99d3-429b-89a2-6247e66d75aa','given_name','claim.name'),('7cdb527f-99d3-429b-89a2-6247e66d75aa','true','id.token.claim'),('7cdb527f-99d3-429b-89a2-6247e66d75aa','String','jsonType.label'),('7cdb527f-99d3-429b-89a2-6247e66d75aa','firstName','user.attribute'),('7d705d70-0bd6-4c6e-a28a-d04cf330e140','Role','attribute.name'),('7d705d70-0bd6-4c6e-a28a-d04cf330e140','Basic','attribute.nameformat'),('7d705d70-0bd6-4c6e-a28a-d04cf330e140','false','single'),('8199b5d6-2e4b-4687-bde6-71e797ffa903','true','access.token.claim'),('8199b5d6-2e4b-4687-bde6-71e797ffa903','family_name','claim.name'),('8199b5d6-2e4b-4687-bde6-71e797ffa903','true','id.token.claim'),('8199b5d6-2e4b-4687-bde6-71e797ffa903','String','jsonType.label'),('8199b5d6-2e4b-4687-bde6-71e797ffa903','lastName','user.attribute'),('83d8c6a2-3f2a-4647-ad69-d340195130d3','true','access.token.claim'),('83d8c6a2-3f2a-4647-ad69-d340195130d3','email','claim.name'),('83d8c6a2-3f2a-4647-ad69-d340195130d3','true','id.token.claim'),('83d8c6a2-3f2a-4647-ad69-d340195130d3','String','jsonType.label'),('83d8c6a2-3f2a-4647-ad69-d340195130d3','email','user.attribute'),('856c6c29-4d73-4057-86f3-4cf4279c432c','true','access.token.claim'),('856c6c29-4d73-4057-86f3-4cf4279c432c','family_name','claim.name'),('856c6c29-4d73-4057-86f3-4cf4279c432c','true','id.token.claim'),('856c6c29-4d73-4057-86f3-4cf4279c432c','String','jsonType.label'),('856c6c29-4d73-4057-86f3-4cf4279c432c','lastName','user.attribute'),('89c4b2e0-2b2a-48a2-87b3-c0466cb3d432','true','access.token.claim'),('89c4b2e0-2b2a-48a2-87b3-c0466cb3d432','true','id.token.claim'),('937a6e73-e01b-4478-a30a-5a5e14c73fd6','true','access.token.claim'),('937a6e73-e01b-4478-a30a-5a5e14c73fd6','email','claim.name'),('937a6e73-e01b-4478-a30a-5a5e14c73fd6','true','id.token.claim'),('937a6e73-e01b-4478-a30a-5a5e14c73fd6','String','jsonType.label'),('937a6e73-e01b-4478-a30a-5a5e14c73fd6','email','user.attribute'),('9467a215-f999-4323-a334-0e49acb3c0d0','true','access.token.claim'),('9467a215-f999-4323-a334-0e49acb3c0d0','family_name','claim.name'),('9467a215-f999-4323-a334-0e49acb3c0d0','true','id.token.claim'),('9467a215-f999-4323-a334-0e49acb3c0d0','String','jsonType.label'),('9467a215-f999-4323-a334-0e49acb3c0d0','lastName','user.attribute'),('9c7c04a3-b177-4952-bb82-2a69f3c6f517','true','access.token.claim'),('9c7c04a3-b177-4952-bb82-2a69f3c6f517','true','id.token.claim'),('9dacc5a4-d512-402a-b77a-077c7b0276cd','true','access.token.claim'),('9dacc5a4-d512-402a-b77a-077c7b0276cd','true','id.token.claim'),('9ff63032-fc8e-4f60-a4b2-4a61c3e8e9bd','Role','attribute.name'),('9ff63032-fc8e-4f60-a4b2-4a61c3e8e9bd','Basic','attribute.nameformat'),('9ff63032-fc8e-4f60-a4b2-4a61c3e8e9bd','false','single'),('a04b0bba-6d24-4c3e-a796-1c076344887d','true','access.token.claim'),('a04b0bba-6d24-4c3e-a796-1c076344887d','given_name','claim.name'),('a04b0bba-6d24-4c3e-a796-1c076344887d','true','id.token.claim'),('a04b0bba-6d24-4c3e-a796-1c076344887d','String','jsonType.label'),('a04b0bba-6d24-4c3e-a796-1c076344887d','firstName','user.attribute'),('a2421659-cd80-4156-93a3-99b6f170f61f','true','access.token.claim'),('a2421659-cd80-4156-93a3-99b6f170f61f','true','id.token.claim'),('a2541051-bebf-41f2-83ec-c121a8d81e98','true','access.token.claim'),('a2541051-bebf-41f2-83ec-c121a8d81e98','family_name','claim.name'),('a2541051-bebf-41f2-83ec-c121a8d81e98','true','id.token.claim'),('a2541051-bebf-41f2-83ec-c121a8d81e98','String','jsonType.label'),('a2541051-bebf-41f2-83ec-c121a8d81e98','lastName','user.attribute'),('a3d04fc1-0bc2-4c98-b4c7-c98af4f9bacf','true','access.token.claim'),('a3d04fc1-0bc2-4c98-b4c7-c98af4f9bacf','preferred_username','claim.name'),('a3d04fc1-0bc2-4c98-b4c7-c98af4f9bacf','true','id.token.claim'),('a3d04fc1-0bc2-4c98-b4c7-c98af4f9bacf','String','jsonType.label'),('a3d04fc1-0bc2-4c98-b4c7-c98af4f9bacf','username','user.attribute'),('a3db05b1-ed27-4ad0-b9e2-ba4d43a2dcb5','true','access.token.claim'),('a3db05b1-ed27-4ad0-b9e2-ba4d43a2dcb5','family_name','claim.name'),('a3db05b1-ed27-4ad0-b9e2-ba4d43a2dcb5','true','id.token.claim'),('a3db05b1-ed27-4ad0-b9e2-ba4d43a2dcb5','String','jsonType.label'),('a3db05b1-ed27-4ad0-b9e2-ba4d43a2dcb5','lastName','user.attribute'),('a3e6c606-919d-453a-9c85-5037be1be068','true','access.token.claim'),('a3e6c606-919d-453a-9c85-5037be1be068','family_name','claim.name'),('a3e6c606-919d-453a-9c85-5037be1be068','true','id.token.claim'),('a3e6c606-919d-453a-9c85-5037be1be068','String','jsonType.label'),('a3e6c606-919d-453a-9c85-5037be1be068','lastName','user.attribute'),('a592a640-05f4-4051-a48b-c31b0e076ec0','true','access.token.claim'),('a592a640-05f4-4051-a48b-c31b0e076ec0','true','id.token.claim'),('a6dabd18-bf61-4911-b592-d0774fcb11e1','true','access.token.claim'),('a6dabd18-bf61-4911-b592-d0774fcb11e1','given_name','claim.name'),('a6dabd18-bf61-4911-b592-d0774fcb11e1','true','id.token.claim'),('a6dabd18-bf61-4911-b592-d0774fcb11e1','String','jsonType.label'),('a6dabd18-bf61-4911-b592-d0774fcb11e1','firstName','user.attribute'),('b0c8f2aa-55c1-49f9-96a5-9855aac535c3','true','access.token.claim'),('b0c8f2aa-55c1-49f9-96a5-9855aac535c3','email','claim.name'),('b0c8f2aa-55c1-49f9-96a5-9855aac535c3','true','id.token.claim'),('b0c8f2aa-55c1-49f9-96a5-9855aac535c3','String','jsonType.label'),('b0c8f2aa-55c1-49f9-96a5-9855aac535c3','email','user.attribute'),('b336f6ff-435a-43f1-ac87-92bdf03f2196','true','access.token.claim'),('b336f6ff-435a-43f1-ac87-92bdf03f2196','email','claim.name'),('b336f6ff-435a-43f1-ac87-92bdf03f2196','true','id.token.claim'),('b336f6ff-435a-43f1-ac87-92bdf03f2196','String','jsonType.label'),('b336f6ff-435a-43f1-ac87-92bdf03f2196','email','user.attribute'),('bdcb7a02-642e-4e7a-8a82-9d4ae45c168a','true','access.token.claim'),('bdcb7a02-642e-4e7a-8a82-9d4ae45c168a','true','id.token.claim'),('c9f99979-8411-4250-89c0-5a732d8a6e18','Role','attribute.name'),('c9f99979-8411-4250-89c0-5a732d8a6e18','Basic','attribute.nameformat'),('c9f99979-8411-4250-89c0-5a732d8a6e18','false','single'),('d366e7a2-1698-4885-b746-8c9190fac493','true','access.token.claim'),('d366e7a2-1698-4885-b746-8c9190fac493','given_name','claim.name'),('d366e7a2-1698-4885-b746-8c9190fac493','true','id.token.claim'),('d366e7a2-1698-4885-b746-8c9190fac493','String','jsonType.label'),('d366e7a2-1698-4885-b746-8c9190fac493','firstName','user.attribute'),('d387c7dd-6c48-4c14-99e1-d959d33179db','true','access.token.claim'),('d387c7dd-6c48-4c14-99e1-d959d33179db','family_name','claim.name'),('d387c7dd-6c48-4c14-99e1-d959d33179db','true','id.token.claim'),('d387c7dd-6c48-4c14-99e1-d959d33179db','String','jsonType.label'),('d387c7dd-6c48-4c14-99e1-d959d33179db','lastName','user.attribute'),('db4120da-465c-478c-a3d4-06f127e50a88','true','access.token.claim'),('db4120da-465c-478c-a3d4-06f127e50a88','preferred_username','claim.name'),('db4120da-465c-478c-a3d4-06f127e50a88','true','id.token.claim'),('db4120da-465c-478c-a3d4-06f127e50a88','String','jsonType.label'),('db4120da-465c-478c-a3d4-06f127e50a88','username','user.attribute'),('db81b0c6-7859-48c2-a813-cce020df4721','Role','attribute.name'),('db81b0c6-7859-48c2-a813-cce020df4721','Basic','attribute.nameformat'),('db81b0c6-7859-48c2-a813-cce020df4721','false','single'),('dccb466e-2be2-4c10-a1ef-340090fd8094','true','access.token.claim'),('dccb466e-2be2-4c10-a1ef-340090fd8094','email','claim.name'),('dccb466e-2be2-4c10-a1ef-340090fd8094','true','id.token.claim'),('dccb466e-2be2-4c10-a1ef-340090fd8094','String','jsonType.label'),('dccb466e-2be2-4c10-a1ef-340090fd8094','email','user.attribute'),('e19180ec-6866-4d5b-8e5f-7fd950cf64ea','true','access.token.claim'),('e19180ec-6866-4d5b-8e5f-7fd950cf64ea','email','claim.name'),('e19180ec-6866-4d5b-8e5f-7fd950cf64ea','true','id.token.claim'),('e19180ec-6866-4d5b-8e5f-7fd950cf64ea','String','jsonType.label'),('e19180ec-6866-4d5b-8e5f-7fd950cf64ea','email','user.attribute'),('e4dd6ed0-a180-4ae6-b16f-114097dd921d','Role','attribute.name'),('e4dd6ed0-a180-4ae6-b16f-114097dd921d','Basic','attribute.nameformat'),('e4dd6ed0-a180-4ae6-b16f-114097dd921d','false','single'),('e630da2c-ab2e-4bbe-b5ca-a52152a68ffa','true','access.token.claim'),('e630da2c-ab2e-4bbe-b5ca-a52152a68ffa','email','claim.name'),('e630da2c-ab2e-4bbe-b5ca-a52152a68ffa','true','id.token.claim'),('e630da2c-ab2e-4bbe-b5ca-a52152a68ffa','String','jsonType.label'),('e630da2c-ab2e-4bbe-b5ca-a52152a68ffa','email','user.attribute'),('f945d385-05ff-4f68-bcaf-5b918423f296','true','access.token.claim'),('f945d385-05ff-4f68-bcaf-5b918423f296','email','claim.name'),('f945d385-05ff-4f68-bcaf-5b918423f296','true','id.token.claim'),('f945d385-05ff-4f68-bcaf-5b918423f296','String','jsonType.label'),('f945d385-05ff-4f68-bcaf-5b918423f296','email','user.attribute'),('f9ccd921-69fe-4a36-ac58-41024686c551','true','access.token.claim'),('f9ccd921-69fe-4a36-ac58-41024686c551','locale','claim.name'),('f9ccd921-69fe-4a36-ac58-41024686c551','true','id.token.claim'),('f9ccd921-69fe-4a36-ac58-41024686c551','String','jsonType.label'),('f9ccd921-69fe-4a36-ac58-41024686c551','locale','user.attribute');
/*!40000 ALTER TABLE `PROTOCOL_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM`
--

DROP TABLE IF EXISTS `REALM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM` (
  `ID` varchar(36) NOT NULL,
  `ACCESS_CODE_LIFESPAN` int(11) DEFAULT NULL,
  `USER_ACTION_LIFESPAN` int(11) DEFAULT NULL,
  `ACCESS_TOKEN_LIFESPAN` int(11) DEFAULT NULL,
  `ACCOUNT_THEME` varchar(255) DEFAULT NULL,
  `ADMIN_THEME` varchar(255) DEFAULT NULL,
  `EMAIL_THEME` varchar(255) DEFAULT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EVENTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EVENTS_EXPIRATION` bigint(20) DEFAULT NULL,
  `LOGIN_THEME` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int(11) DEFAULT NULL,
  `PASSWORD_POLICY` varchar(255) DEFAULT NULL,
  `PRIVATE_KEY` varchar(2048) DEFAULT NULL,
  `PUBLIC_KEY` varchar(2048) DEFAULT NULL,
  `REGISTRATION_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `REMEMBER_ME` bit(1) NOT NULL DEFAULT b'0',
  `RESET_PASSWORD_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `SOCIAL` bit(1) NOT NULL DEFAULT b'0',
  `SSL_REQUIRED` varchar(255) DEFAULT NULL,
  `SSO_IDLE_TIMEOUT` int(11) DEFAULT NULL,
  `SSO_MAX_LIFESPAN` int(11) DEFAULT NULL,
  `UPDATE_PROFILE_ON_SOC_LOGIN` bit(1) NOT NULL DEFAULT b'0',
  `VERIFY_EMAIL` bit(1) NOT NULL DEFAULT b'0',
  `MASTER_ADMIN_CLIENT` varchar(36) DEFAULT NULL,
  `CERTIFICATE` varchar(2048) DEFAULT NULL,
  `CODE_SECRET` varchar(255) DEFAULT NULL,
  `LOGIN_LIFESPAN` int(11) DEFAULT NULL,
  `INTERNATIONALIZATION_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DEFAULT_LOCALE` varchar(255) DEFAULT NULL,
  `REG_EMAIL_AS_USERNAME` bit(1) NOT NULL DEFAULT b'0',
  `ADMIN_EVENTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `ADMIN_EVENTS_DETAILS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EDIT_USERNAME_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `OTP_POLICY_COUNTER` int(11) DEFAULT '0',
  `OTP_POLICY_WINDOW` int(11) DEFAULT '1',
  `OTP_POLICY_PERIOD` int(11) DEFAULT '30',
  `OTP_POLICY_DIGITS` int(11) DEFAULT '6',
  `OTP_POLICY_ALG` varchar(36) DEFAULT 'HmacSHA1',
  `OTP_POLICY_TYPE` varchar(36) DEFAULT 'totp',
  `BROWSER_FLOW` varchar(36) DEFAULT NULL,
  `REGISTRATION_FLOW` varchar(36) DEFAULT NULL,
  `DIRECT_GRANT_FLOW` varchar(36) DEFAULT NULL,
  `RESET_CREDENTIALS_FLOW` varchar(36) DEFAULT NULL,
  `CLIENT_AUTH_FLOW` varchar(36) DEFAULT NULL,
  `OFFLINE_SESSION_IDLE_TIMEOUT` int(11) DEFAULT '0',
  `REVOKE_REFRESH_TOKEN` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_ORVSDMLA56612EAEFIQ6WL5OI` (`NAME`),
  KEY `FK_TRAF444KK6QRKMS7N56AIWQ5Y` (`MASTER_ADMIN_CLIENT`),
  CONSTRAINT `FK_TRAF444KK6QRKMS7N56AIWQ5Y` FOREIGN KEY (`MASTER_ADMIN_CLIENT`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM`
--

LOCK TABLES `REALM` WRITE;
/*!40000 ALTER TABLE `REALM` DISABLE KEYS */;
INSERT INTO `REALM` VALUES ('dina',60,300,300,NULL,NULL,NULL,'','\0',0,NULL,'dina',0,NULL,'MIIEowIBAAKCAQEAsAZ1vtpIZSCMw9M9bVcX7zLP1libLcQfMZUTE52kdpvwMH/6Vifs3hXcgb0E0DsWpD1jw+uO8eXq5emkHRflUbACNDfaufVSwksTEa5LDr2XSoWqj/eYkEttKzbJDCtb9l8d1Zi9fXGHCA4faIj1tvmMiyLrKnOaI19DZ47xEa/Cf3dTnsMR1vIh7KviHyot6Pm00/G/7dBugu8FgLlrcC/pz4FX9I6eW/li9r/CSIrHRfa/rGS0cgXGOi5k6pu1YnwinfAbkykXWyTAL9pwybzbNjDaq4kOWkzo/1eQ0hCujjU05oQGivuOFmaaeHIV2NAhusYAIJzE7m07U2b1twIDAQABAoIBAQCr/8PyF40B88pYVwMA4kdq3bWkdrQ7BhaM9mPLmRBpLXqHiaXtpdmYMLhktXQMnJBFMA9aE8R7rfPXcHOCUiUrqtace69oYcTaQU2Cy1JgNvWsRewh/QfAh1NHFKNjFsMnfE3EtxkBiHsvbc1W8e1XO4UPN7Geq5MD2UQd3tjEM90Tw53aQAHoMfJaNgJ9NZgv5CethxrDVRdQ3YxFb/KDrq67azB+RpplByX1qRXcRjjJYAyIs0y3ZosBdHVPzcQ8irwMUfwZvz4z503ug6v+xrSk/PoNdG9DfRqQC2BvqhcsZEpTyskCxQEU2JmTbo31wHZHpRwBp5E00KE1SXdhAoGBAPNt2dti+OkngChXP5MXBRYi2rqQvGh/ozwzWmZibKW7m7xkBrdCsbNojD2J266ydK50e8A/+JncPcRCoI/p6XXF1GMRbnYUxd1Tc61lMqaOwQt+s9M7q2i73GTd5WNQwdqFOt1e7ky/uLvpceQw4RZxEB+GsEcgxGZKTiBTBh6vAoGBALkdhngGtbLNcaky41z8lVtLvopi39rpGqkzUFqB1Pi7ibO1K+w8bqsmdj2n3iNQxGOjtEzSlArfIff5E0UOHbJPg2AfDSFE77QWx9xL9MxW4FN2uGnjh/uh0/oUfGbZ1EonrotGSosONpSzYaEyKZ8Z6iCiCbst1ellreJ1mht5AoGAUCcMg8M76DFcbmwD/9+lihth3+pGTzYvvmO+UVX5Jjz203owB+mK72LuQlkBH62c49Bw6uVlauvs3pF9osVHXMMN4qzbrT+7wtt2jFJ08gixIaLPfS75ipvIvuGdZS0zF0ulDTzzxAugvSbpnFRH2QbTYz4LDvCIGpI+1T/hFPsCgYASuh/uaI9dJVeITHOf5pWdhM4j5djLpqVh1KUeYuAOwbouifeFkJ+JhPyVRDQ+0l7rzZXh57O+XdBr67C9Xa43ab/aq4mCghzV1TAm4zBCs89B4lLJs5EALeDp/cSQCx1k2xrXUCceZjOzW2pXCmIXjGGZJ4tgekSXtgefT1Jl0QKBgEWsGNl41lOf+mdrnILFFxLaJQdRUj8RPQ6yk983UbTqk3UQ/VNNcMAM7GoJOihhh6J5rgFvLRHGyAc6FsM9BS+/ieSWqPGiE0M0C9oNmSVkKj2eo/PdDETXHRWK9H33HVlYHd/FcHXdq1kFfQPOZnaAzcmQfEOjgqc/LwRJaYGt','MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAsAZ1vtpIZSCMw9M9bVcX7zLP1libLcQfMZUTE52kdpvwMH/6Vifs3hXcgb0E0DsWpD1jw+uO8eXq5emkHRflUbACNDfaufVSwksTEa5LDr2XSoWqj/eYkEttKzbJDCtb9l8d1Zi9fXGHCA4faIj1tvmMiyLrKnOaI19DZ47xEa/Cf3dTnsMR1vIh7KviHyot6Pm00/G/7dBugu8FgLlrcC/pz4FX9I6eW/li9r/CSIrHRfa/rGS0cgXGOi5k6pu1YnwinfAbkykXWyTAL9pwybzbNjDaq4kOWkzo/1eQ0hCujjU05oQGivuOFmaaeHIV2NAhusYAIJzE7m07U2b1twIDAQAB','\0','\0','\0','\0','NONE',1800,36000,'\0','\0','a8668963-14d2-4564-a001-137e9fa67084','MIIClzCCAX8CBgFUwuXm7TANBgkqhkiG9w0BAQsFADAPMQ0wCwYDVQQDDARkaW5hMB4XDTE2MDUxODA4MDM0N1oXDTI2MDUxODA4MDUyN1owDzENMAsGA1UEAwwEZGluYTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBALAGdb7aSGUgjMPTPW1XF+8yz9ZYmy3EHzGVExOdpHab8DB/+lYn7N4V3IG9BNA7FqQ9Y8PrjvHl6uXppB0X5VGwAjQ32rn1UsJLExGuSw69l0qFqo/3mJBLbSs2yQwrW/ZfHdWYvX1xhwgOH2iI9bb5jIsi6ypzmiNfQ2eO8RGvwn93U57DEdbyIeyr4h8qLej5tNPxv+3QboLvBYC5a3Av6c+BV/SOnlv5Yva/wkiKx0X2v6xktHIFxjouZOqbtWJ8Ip3wG5MpF1skwC/acMm82zYw2quJDlpM6P9XkNIQro41NOaEBor7jhZmmnhyFdjQIbrGACCcxO5tO1Nm9bcCAwEAATANBgkqhkiG9w0BAQsFAAOCAQEANtA3UUSeDM6zvzaUEtD54ttRBXdzDVLCyU4rufV9HSn0hxgXkYXa+JYo0yevo42SI/Kli6ctXVFZgF9ZOLN0PHGmMeggqySiu0cSaiIljZ4yQNCYAQXdYCIzIA/rToCKz/O9x90g/Wqdxk6K0Ufw5qYUkWPcnZ4VlGB96LAtUoW23Sc4sH5WZIf/GO3XCIOiGD4onWdLrA3lIgGwowRzRK1irvRtqjRjYUGxcdqmp/nNidC14yalmKxZGBr0iWUXI7wT5pUymAeiZLh8bHBweK79Gypqv9aiSXTwD4c7HBClc+5mr+R542PrrFx2v0sKVE+2oVLPdZrmXLmnRGlTfw==','b6a9e9c5-0a71-4437-8b22-8c722698b8a9',1800,'\0',NULL,'\0','\0','\0','\0',0,1,30,6,'HmacSHA1','totp','740a4983-a368-4ca0-a82b-4b7b2b58a943','24e4ec44-cf49-4c8c-bf6e-6c86159eb471','23d63549-518f-4fdd-b9b0-2ba51b5e93cb','8d3c4efc-c755-4486-9f22-a88d7268ec95','1ea83140-b616-4970-8ae2-5518c86e7ed8',2592000,'\0'),('master',60,300,60,NULL,NULL,NULL,'','\0',0,NULL,'master',0,NULL,'MIIEowIBAAKCAQEAjt5CpKK4AUM08rIxXwgmkzzpycM9wjJ+qunEugm0uJzRLKd4glSlNWD4686jIGjWru8eH0qSpABAJi9eQ9auwNU44V3cjUCpDLfsIRN/p9DAk3TDqSXHkcg3Jjf0DG4cY5arWQnBA8yLv8/q7Nh2qR2Dlnf7Jn2dYZsORy0HO4H08WDf+zfK19mQT0MshTc8ferUG6fJ6DA3cQsT1NkpQvvR7AftxKq9mZhgt5f6yTThTmbLBp7F/W1t42PKB+ZbDdex+BneK/9K6bgK8/r0bd3U/ud5Fl1TIb505CDiDxog+9B7Nacg84VcXZjgo2/7tG/P6Qc/q6j21W0+UIOhsQIDAQABAoIBADt/amef8FtuPrW36gG2pkH5Qy+oZKbkWoYZFrmXYzDi9eXP1MsKL0c8nE2v35WWs5lksbm8V7d+9zgvz+UWme5qneaVLU2SGRTX37mioi4kLJ78KKPfvO4EYJtFABjRHneG/tL00fIgFC8MiryaJUimpu9aBjjwZUOJzHdt1C4+fifdwVvSKspmWNdlX16StTvhwhJ4jUnaZ6hcHpWB0C9LYX1zZMV3inDWo7gRvW4SU+xOFSGMTCDUhr8ABz8Sn3x8uvGXpugqqM9JI94PgCa/tIs6rGG0+FAW1B3zP7704F440eJa0Lxxq09gw4MBwiWhv5fGJmnM2wTJ6Q44WlUCgYEA47UOFhEORrVXk3KAN/AnUE1wqid9DEFynObIvw2VL1aMNcPrii/pu/p1ThAklthx8KNkQ+mA4hylMUCGhZj/N40Ocv8zCGxZMcYTrzygaxfhQ2yRl24HoJkocaU0+OuFCOplKY+HyCf9Tzet/oiAjiFBO1Kb1O+nkcAjgfS5HV8CgYEAoJ6h/4YMOh1DYqmfFvMyMqTjf49iuwChDnTgIFSkVjWaBuiXutnetnL+0xJnMS3o9MBqDognYEU2u89+uiDwqcggREmbvu3132rHMWlzrAw8Q24UtwrDEH+u7r5s+AD+XmCXaXGNVRGhqQT5r3dl05NQcsmimI3+2srSw+Okiu8CgYEAtxPXI37LD6a1puMkm9UGhtX8g5IERFpKoEQdmx58l/bp/EBtnEkxj+WrcvwfrviPg36bGs8exK1rU9IhVkDQ0gUjXOo6ScdzX0V2hiokgHZOszsTQ8E/eKwrjFPb51bVO3nZpDS2YwNj8tE9n6x4T84E+IFOsUGOZO0qn033l9kCgYB/MB6n8MYN3s5Vemv4CGxfniJoCGruGflvMS2pbF0VxyxI/DXqSEwLvdP74D7GuswVw6g4CajkmupUnmKDkUIBr++dI4ypDFX+rNc/UXm/a5Ds9GaC64q7reAgPbqcSG0k3ugHH1wDWQrihIYTZEDF4Yl63CBdHVQKfUGYzNKnEQKBgFMzJOlg9/WQs/sVEKXGSoSZltYvt5zq9se/S3WeW2No2xzeBBRsyl363qxINdQuMto5SBe1r/+59qrJm4YAsgqQnEnziBlvDRxqPVFCV2YSskqFZwUzqy22c6xkDMHMREPB0IQjWXY2K1S/V0Gu/Zic8SnSEtDDz1heflL9h1+/','MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAjt5CpKK4AUM08rIxXwgmkzzpycM9wjJ+qunEugm0uJzRLKd4glSlNWD4686jIGjWru8eH0qSpABAJi9eQ9auwNU44V3cjUCpDLfsIRN/p9DAk3TDqSXHkcg3Jjf0DG4cY5arWQnBA8yLv8/q7Nh2qR2Dlnf7Jn2dYZsORy0HO4H08WDf+zfK19mQT0MshTc8ferUG6fJ6DA3cQsT1NkpQvvR7AftxKq9mZhgt5f6yTThTmbLBp7F/W1t42PKB+ZbDdex+BneK/9K6bgK8/r0bd3U/ud5Fl1TIb505CDiDxog+9B7Nacg84VcXZjgo2/7tG/P6Qc/q6j21W0+UIOhsQIDAQAB','\0','\0','\0','\0','EXTERNAL',1800,36000,'\0','\0','46c5db86-8f66-47a7-bb6d-7a920a804d7b','MIICmzCCAYMCBgFUo/WNgzANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMTYwNTEyMDc1MjM5WhcNMjYwNTEyMDc1NDE5WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCO3kKkorgBQzTysjFfCCaTPOnJwz3CMn6q6cS6CbS4nNEsp3iCVKU1YPjrzqMgaNau7x4fSpKkAEAmL15D1q7A1TjhXdyNQKkMt+whE3+n0MCTdMOpJceRyDcmN/QMbhxjlqtZCcEDzIu/z+rs2HapHYOWd/smfZ1hmw5HLQc7gfTxYN/7N8rX2ZBPQyyFNzx96tQbp8noMDdxCxPU2SlC+9HsB+3Eqr2ZmGC3l/rJNOFOZssGnsX9bW3jY8oH5lsN17H4Gd4r/0rpuArz+vRt3dT+53kWXVMhvnTkIOIPGiD70Hs1pyDzhVxdmOCjb/u0b8/pBz+rqPbVbT5Qg6GxAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAEMn+DhTd098A87fLMUvQu5MMW4hTeWHuF26QdR5uP2zUG4R0qdz6dM73ZNRi+WRNSDY65pAkpc5+9FKX03T3YSwV7FuqLNxSHYPgVtWevp/He1P6UZnFovIVi8JkZYg7jinEtT4IiE+wJvWnRcuruZb8b022sHM3KWLSZCW+1aNG6Z5InrBtGg2eZW2eeAprMWNDIr215hH4lv/X4TvbDKLQDSs1guZD7C25r63nyBtK3XKFMA1rzuRbBxFso35eO0HW/w4T/aXQOneazJPiwsCgoGhi9uPOJ+BkdcYnS38tCLK7TwC4AvN65vJMOsCRdzvzzxUeq73c3FRKxJJHsQ=','b273f57c-d6fe-439b-8bf8-2e17f68117f1',1800,'\0',NULL,'\0','\0','\0','\0',0,1,30,6,'HmacSHA1','totp','2939d483-9312-4479-b5a8-f497ac5c091b','16b2551d-e699-4798-abe9-6c379b053c70','cc476618-fcc5-4d49-873e-15d397a0de08','56e7915e-0649-4448-b926-3f8fc5a38772','6a88241d-3d91-402d-a5f4-e13171da62b0',2592000,'\0');
/*!40000 ALTER TABLE `REALM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_ATTRIBUTE`
--

DROP TABLE IF EXISTS `REALM_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM_ATTRIBUTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`NAME`,`REALM_ID`),
  KEY `FK_8SHXD6L3E9ATQUKACXGPFFPTW` (`REALM_ID`),
  CONSTRAINT `FK_8SHXD6L3E9ATQUKACXGPFFPTW` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_ATTRIBUTE`
--

LOCK TABLES `REALM_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `REALM_ATTRIBUTE` DISABLE KEYS */;
INSERT INTO `REALM_ATTRIBUTE` VALUES ('bruteForceProtected','false','dina'),('bruteForceProtected','false','master'),('failureFactor','30','dina'),('failureFactor','30','master'),('maxDeltaTimeSeconds','43200','dina'),('maxDeltaTimeSeconds','43200','master'),('maxFailureWaitSeconds','900','dina'),('maxFailureWaitSeconds','900','master'),('minimumQuickLoginWaitSeconds','60','dina'),('minimumQuickLoginWaitSeconds','60','master'),('quickLoginCheckMilliSeconds','1000','dina'),('quickLoginCheckMilliSeconds','1000','master'),('waitIncrementSeconds','60','dina'),('waitIncrementSeconds','60','master'),('_browser_header.contentSecurityPolicy','frame-src \'self\'','dina'),('_browser_header.contentSecurityPolicy','frame-src \'self\'','master'),('_browser_header.xFrameOptions','SAMEORIGIN','dina'),('_browser_header.xFrameOptions','SAMEORIGIN','master');
/*!40000 ALTER TABLE `REALM_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_CLIENT`
--

DROP TABLE IF EXISTS `REALM_CLIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM_CLIENT` (
  `REALM_ID` varchar(36) DEFAULT NULL,
  `CLIENT_ID` varchar(36) DEFAULT NULL,
  UNIQUE KEY `UK_M6QGA3RFME47335JY8JXYXH3I` (`CLIENT_ID`),
  KEY `FK_M6QGA3RFME47335JY8JXYXH3I` (`REALM_ID`),
  CONSTRAINT `FK_93S3P0DIUXAWWQQSA528UBY2Q` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`),
  CONSTRAINT `FK_M6QGA3RFME47335JY8JXYXH3I` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_CLIENT`
--

LOCK TABLES `REALM_CLIENT` WRITE;
/*!40000 ALTER TABLE `REALM_CLIENT` DISABLE KEYS */;
INSERT INTO `REALM_CLIENT` VALUES ('master','01c31bbd-1152-436d-b224-554479b6d23a'),('master','1b078076-bde9-4030-b3ce-fdded3a9f5db'),('master','46c5db86-8f66-47a7-bb6d-7a920a804d7b'),('master','f28e2ec7-8aab-439e-8bf1-c594720f46ff'),('master','a8668963-14d2-4564-a001-137e9fa67084'),('dina','e079390c-5e68-47ff-bc83-62aa6348dc8b'),('dina','958151d1-bef5-423d-bde0-01fb9d8e0c3c'),('dina','b43c2f96-3d6f-487a-a6e0-95e438729d9d'),('dina','f507af43-5e48-4267-804e-5af7b0cac5ca'),('dina','a8052be8-34bd-4b5e-a077-94f1562c3ee6'),('dina','0e43972d-ab4c-40b1-a473-dffa1345210d');
/*!40000 ALTER TABLE `REALM_CLIENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_DEFAULT_ROLES`
--

DROP TABLE IF EXISTS `REALM_DEFAULT_ROLES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM_DEFAULT_ROLES` (
  `REALM_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  UNIQUE KEY `UK_H4WPD7W4HSOOLNI3H0SW7BTJE` (`ROLE_ID`),
  KEY `FK_EVUDB1PPW84OXFAX2DRS03ICC` (`REALM_ID`),
  CONSTRAINT `FK_EVUDB1PPW84OXFAX2DRS03ICC` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`),
  CONSTRAINT `FK_H4WPD7W4HSOOLNI3H0SW7BTJE` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_DEFAULT_ROLES`
--

LOCK TABLES `REALM_DEFAULT_ROLES` WRITE;
/*!40000 ALTER TABLE `REALM_DEFAULT_ROLES` DISABLE KEYS */;
INSERT INTO `REALM_DEFAULT_ROLES` VALUES ('dina','0a86aee6-8956-459b-ae1f-e8e9d38897f4'),('master','0e385573-6085-438e-9369-ed99bbbed114');
/*!40000 ALTER TABLE `REALM_DEFAULT_ROLES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_ENABLED_EVENT_TYPES`
--

DROP TABLE IF EXISTS `REALM_ENABLED_EVENT_TYPES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM_ENABLED_EVENT_TYPES` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  KEY `FK_H846O4H0W8EPX5NWEDRF5Y69J` (`REALM_ID`),
  CONSTRAINT `FK_H846O4H0W8EPX5NWEDRF5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_ENABLED_EVENT_TYPES`
--

LOCK TABLES `REALM_ENABLED_EVENT_TYPES` WRITE;
/*!40000 ALTER TABLE `REALM_ENABLED_EVENT_TYPES` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_ENABLED_EVENT_TYPES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_EVENTS_LISTENERS`
--

DROP TABLE IF EXISTS `REALM_EVENTS_LISTENERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM_EVENTS_LISTENERS` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  KEY `FK_H846O4H0W8EPX5NXEV9F5Y69J` (`REALM_ID`),
  CONSTRAINT `FK_H846O4H0W8EPX5NXEV9F5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_EVENTS_LISTENERS`
--

LOCK TABLES `REALM_EVENTS_LISTENERS` WRITE;
/*!40000 ALTER TABLE `REALM_EVENTS_LISTENERS` DISABLE KEYS */;
INSERT INTO `REALM_EVENTS_LISTENERS` VALUES ('master','jboss-logging'),('dina','jboss-logging');
/*!40000 ALTER TABLE `REALM_EVENTS_LISTENERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_REQUIRED_CREDENTIAL`
--

DROP TABLE IF EXISTS `REALM_REQUIRED_CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM_REQUIRED_CREDENTIAL` (
  `TYPE` varchar(255) NOT NULL,
  `FORM_LABEL` varchar(255) DEFAULT NULL,
  `INPUT` bit(1) NOT NULL DEFAULT b'0',
  `SECRET` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`TYPE`),
  CONSTRAINT `FK_5HG65LYBEVAVKQFKI3KPONH9V` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_REQUIRED_CREDENTIAL`
--

LOCK TABLES `REALM_REQUIRED_CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `REALM_REQUIRED_CREDENTIAL` DISABLE KEYS */;
INSERT INTO `REALM_REQUIRED_CREDENTIAL` VALUES ('password','password','','','dina'),('password','password','','','master');
/*!40000 ALTER TABLE `REALM_REQUIRED_CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_SMTP_CONFIG`
--

DROP TABLE IF EXISTS `REALM_SMTP_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM_SMTP_CONFIG` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`NAME`),
  CONSTRAINT `FK_70EJ8XDXGXD0B9HH6180IRR0O` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_SMTP_CONFIG`
--

LOCK TABLES `REALM_SMTP_CONFIG` WRITE;
/*!40000 ALTER TABLE `REALM_SMTP_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_SMTP_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_SUPPORTED_LOCALES`
--

DROP TABLE IF EXISTS `REALM_SUPPORTED_LOCALES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM_SUPPORTED_LOCALES` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  KEY `FK_SUPPORTED_LOCALES_REALM` (`REALM_ID`),
  CONSTRAINT `FK_SUPPORTED_LOCALES_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_SUPPORTED_LOCALES`
--

LOCK TABLES `REALM_SUPPORTED_LOCALES` WRITE;
/*!40000 ALTER TABLE `REALM_SUPPORTED_LOCALES` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_SUPPORTED_LOCALES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REDIRECT_URIS`
--

DROP TABLE IF EXISTS `REDIRECT_URIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REDIRECT_URIS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  KEY `FK_1BURS8PB4OUJ97H5WUPPAHV9F` (`CLIENT_ID`),
  CONSTRAINT `FK_1BURS8PB4OUJ97H5WUPPAHV9F` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REDIRECT_URIS`
--

LOCK TABLES `REDIRECT_URIS` WRITE;
/*!40000 ALTER TABLE `REDIRECT_URIS` DISABLE KEYS */;
INSERT INTO `REDIRECT_URIS` VALUES ('1b078076-bde9-4030-b3ce-fdded3a9f5db','/auth/realms/master/account/*'),('01c31bbd-1152-436d-b224-554479b6d23a','/auth/admin/master/console/*'),('958151d1-bef5-423d-bde0-01fb9d8e0c3c','/auth/realms/dina/account/*'),('f507af43-5e48-4267-804e-5af7b0cac5ca','/auth/admin/dina/console/*');
/*!40000 ALTER TABLE `REDIRECT_URIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIRED_ACTION_CONFIG`
--

DROP TABLE IF EXISTS `REQUIRED_ACTION_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REQUIRED_ACTION_CONFIG` (
  `REQUIRED_ACTION_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`REQUIRED_ACTION_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIRED_ACTION_CONFIG`
--

LOCK TABLES `REQUIRED_ACTION_CONFIG` WRITE;
/*!40000 ALTER TABLE `REQUIRED_ACTION_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `REQUIRED_ACTION_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIRED_ACTION_PROVIDER`
--

DROP TABLE IF EXISTS `REQUIRED_ACTION_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REQUIRED_ACTION_PROVIDER` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DEFAULT_ACTION` bit(1) NOT NULL DEFAULT b'0',
  `PROVIDER_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_REQ_ACT_REALM` (`REALM_ID`),
  CONSTRAINT `FK_REQ_ACT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIRED_ACTION_PROVIDER`
--

LOCK TABLES `REQUIRED_ACTION_PROVIDER` WRITE;
/*!40000 ALTER TABLE `REQUIRED_ACTION_PROVIDER` DISABLE KEYS */;
INSERT INTO `REQUIRED_ACTION_PROVIDER` VALUES ('1c9f2886-64d8-4036-8037-0afdb97a8ee7','terms_and_conditions','Terms and Conditions','master','\0','\0','terms_and_conditions'),('490890bf-e321-4eee-b779-8d7e768ac487','VERIFY_EMAIL','Verify Email','master','','\0','VERIFY_EMAIL'),('4b969774-3ad5-45f9-ac45-a4af144d0eef','terms_and_conditions','Terms and Conditions','dina','\0','\0','terms_and_conditions'),('8d73a7ba-4d0c-4ce3-9d6e-919ef84cf3b3','CONFIGURE_TOTP','Configure Totp','master','','\0','CONFIGURE_TOTP'),('b194beea-27f0-4090-9897-f3d81a8a9bf1','UPDATE_PASSWORD','Update Password','master','','\0','UPDATE_PASSWORD'),('bf263486-4a7d-47dd-90cd-2aa2205ca0ca','CONFIGURE_TOTP','Configure Totp','dina','','\0','CONFIGURE_TOTP'),('c25d89cd-31c2-4ad6-ad76-fb063223c631','UPDATE_PROFILE','Update Profile','dina','','\0','UPDATE_PROFILE'),('c57195d1-538c-4276-adfb-45e386632af8','VERIFY_EMAIL','Verify Email','dina','','\0','VERIFY_EMAIL'),('f72e0970-6d39-4232-b0c8-91605dbd2816','UPDATE_PASSWORD','Update Password','dina','','\0','UPDATE_PASSWORD'),('f8b19c92-82de-4723-8f0f-9579672ca4c2','UPDATE_PROFILE','Update Profile','master','','\0','UPDATE_PROFILE');
/*!40000 ALTER TABLE `REQUIRED_ACTION_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SCOPE_MAPPING`
--

DROP TABLE IF EXISTS `SCOPE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SCOPE_MAPPING` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`ROLE_ID`),
  KEY `FK_P3RH9GRKU11KQFRS4FLTT7RNQ` (`ROLE_ID`),
  CONSTRAINT `FK_OUSE064PLMLR732LXJCN1Q5F1` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`),
  CONSTRAINT `FK_P3RH9GRKU11KQFRS4FLTT7RNQ` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCOPE_MAPPING`
--

LOCK TABLES `SCOPE_MAPPING` WRITE;
/*!40000 ALTER TABLE `SCOPE_MAPPING` DISABLE KEYS */;
INSERT INTO `SCOPE_MAPPING` VALUES ('f507af43-5e48-4267-804e-5af7b0cac5ca','1b8979b0-1f83-4e50-a145-04a6e7552582'),('01c31bbd-1152-436d-b224-554479b6d23a','6e9e8c24-03de-43bc-8e1d-22cd2d142100');
/*!40000 ALTER TABLE `SCOPE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USERNAME_LOGIN_FAILURE`
--

DROP TABLE IF EXISTS `USERNAME_LOGIN_FAILURE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USERNAME_LOGIN_FAILURE` (
  `REALM_ID` varchar(36) NOT NULL,
  `USERNAME` varchar(200) NOT NULL,
  `FAILED_LOGIN_NOT_BEFORE` int(11) DEFAULT NULL,
  `LAST_FAILURE` bigint(20) DEFAULT NULL,
  `LAST_IP_FAILURE` varchar(255) DEFAULT NULL,
  `NUM_FAILURES` int(11) DEFAULT NULL,
  PRIMARY KEY (`REALM_ID`,`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USERNAME_LOGIN_FAILURE`
--

LOCK TABLES `USERNAME_LOGIN_FAILURE` WRITE;
/*!40000 ALTER TABLE `USERNAME_LOGIN_FAILURE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USERNAME_LOGIN_FAILURE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ATTRIBUTE`
--

DROP TABLE IF EXISTS `USER_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_ATTRIBUTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(36) NOT NULL,
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  PRIMARY KEY (`ID`),
  KEY `FK_5HRM2VLF9QL5FU043KQEPOVBR` (`USER_ID`),
  CONSTRAINT `FK_5HRM2VLF9QL5FU043KQEPOVBR` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ATTRIBUTE`
--

LOCK TABLES `USER_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `USER_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_CONSENT`
--

DROP TABLE IF EXISTS `USER_CONSENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_CONSENT` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_JKUWUVD56ONTGSUHOGM8UEWRT` (`CLIENT_ID`,`USER_ID`),
  KEY `FK_GRNTCSNT_USER` (`USER_ID`),
  CONSTRAINT `FK_GRNTCSNT_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_CONSENT`
--

LOCK TABLES `USER_CONSENT` WRITE;
/*!40000 ALTER TABLE `USER_CONSENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_CONSENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_CONSENT_PROT_MAPPER`
--

DROP TABLE IF EXISTS `USER_CONSENT_PROT_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_CONSENT_PROT_MAPPER` (
  `USER_CONSENT_ID` varchar(36) NOT NULL,
  `PROTOCOL_MAPPER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`PROTOCOL_MAPPER_ID`),
  CONSTRAINT `FK_GRNTCSNT_PRM_GR` FOREIGN KEY (`USER_CONSENT_ID`) REFERENCES `USER_CONSENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_CONSENT_PROT_MAPPER`
--

LOCK TABLES `USER_CONSENT_PROT_MAPPER` WRITE;
/*!40000 ALTER TABLE `USER_CONSENT_PROT_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_CONSENT_PROT_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_CONSENT_ROLE`
--

DROP TABLE IF EXISTS `USER_CONSENT_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_CONSENT_ROLE` (
  `USER_CONSENT_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`ROLE_ID`),
  CONSTRAINT `FK_GRNTCSNT_ROLE_GR` FOREIGN KEY (`USER_CONSENT_ID`) REFERENCES `USER_CONSENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_CONSENT_ROLE`
--

LOCK TABLES `USER_CONSENT_ROLE` WRITE;
/*!40000 ALTER TABLE `USER_CONSENT_ROLE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_CONSENT_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ENTITY`
--

DROP TABLE IF EXISTS `USER_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `EMAIL_CONSTRAINT` varchar(255) DEFAULT NULL,
  `EMAIL_VERIFIED` bit(1) NOT NULL DEFAULT b'0',
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `FEDERATION_LINK` varchar(255) DEFAULT NULL,
  `FIRST_NAME` varchar(255) DEFAULT NULL,
  `LAST_NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `TOTP` bit(1) NOT NULL DEFAULT b'0',
  `USERNAME` varchar(255) DEFAULT NULL,
  `CREATED_TIMESTAMP` bigint(20) DEFAULT NULL,
  `SERVICE_ACCOUNT_CLIENT_LINK` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_DYKN684SL8UP1CRFEI6ECKHD7` (`REALM_ID`,`EMAIL_CONSTRAINT`),
  UNIQUE KEY `UK_RU8TT6T700S9V50BU18WS5HA6` (`REALM_ID`,`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ENTITY`
--

LOCK TABLES `USER_ENTITY` WRITE;
/*!40000 ALTER TABLE `USER_ENTITY` DISABLE KEYS */;
INSERT INTO `USER_ENTITY` VALUES ('d6a4298b-37a1-4834-ba24-b157a0e08658',NULL,'ce28b21e-f823-4af1-b85b-460cc15a1f0d','\0','',NULL,NULL,NULL,'master','\0','admin',1463039659477,NULL);
/*!40000 ALTER TABLE `USER_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_CONFIG`
--

DROP TABLE IF EXISTS `USER_FEDERATION_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_FEDERATION_CONFIG` (
  `USER_FEDERATION_PROVIDER_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`USER_FEDERATION_PROVIDER_ID`,`NAME`),
  CONSTRAINT `FK_T13HPU1J94R2EBPEKR39X5EU5` FOREIGN KEY (`USER_FEDERATION_PROVIDER_ID`) REFERENCES `USER_FEDERATION_PROVIDER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_CONFIG`
--

LOCK TABLES `USER_FEDERATION_CONFIG` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_MAPPER`
--

DROP TABLE IF EXISTS `USER_FEDERATION_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_FEDERATION_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `FEDERATION_PROVIDER_ID` varchar(36) NOT NULL,
  `FEDERATION_MAPPER_TYPE` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_FEDMAPPERPM_REALM` (`REALM_ID`),
  KEY `FK_FEDMAPPERPM_FEDPRV` (`FEDERATION_PROVIDER_ID`),
  CONSTRAINT `FK_FEDMAPPERPM_FEDPRV` FOREIGN KEY (`FEDERATION_PROVIDER_ID`) REFERENCES `USER_FEDERATION_PROVIDER` (`ID`),
  CONSTRAINT `FK_FEDMAPPERPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_MAPPER`
--

LOCK TABLES `USER_FEDERATION_MAPPER` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `USER_FEDERATION_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_FEDERATION_MAPPER_CONFIG` (
  `USER_FEDERATION_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`USER_FEDERATION_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_FEDMAPPER_CFG` FOREIGN KEY (`USER_FEDERATION_MAPPER_ID`) REFERENCES `USER_FEDERATION_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_MAPPER_CONFIG`
--

LOCK TABLES `USER_FEDERATION_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_PROVIDER`
--

DROP TABLE IF EXISTS `USER_FEDERATION_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_FEDERATION_PROVIDER` (
  `ID` varchar(36) NOT NULL,
  `CHANGED_SYNC_PERIOD` int(11) DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  `FULL_SYNC_PERIOD` int(11) DEFAULT NULL,
  `LAST_SYNC` int(11) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `PROVIDER_NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_1FJ32F6PTOLW2QY60CD8N01E8` (`REALM_ID`),
  CONSTRAINT `FK_1FJ32F6PTOLW2QY60CD8N01E8` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_PROVIDER`
--

LOCK TABLES `USER_FEDERATION_PROVIDER` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_PROVIDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_REQUIRED_ACTION`
--

DROP TABLE IF EXISTS `USER_REQUIRED_ACTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_REQUIRED_ACTION` (
  `USER_ID` varchar(36) NOT NULL,
  `REQUIRED_ACTION` varchar(255) NOT NULL DEFAULT ' ',
  PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
  KEY `FK_6QJ3W1JW9CVAFHE19BWSIUVMD` (`USER_ID`),
  CONSTRAINT `FK_6QJ3W1JW9CVAFHE19BWSIUVMD` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_REQUIRED_ACTION`
--

LOCK TABLES `USER_REQUIRED_ACTION` WRITE;
/*!40000 ALTER TABLE `USER_REQUIRED_ACTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_REQUIRED_ACTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `USER_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_ROLE_MAPPING` (
  `ROLE_ID` varchar(255) NOT NULL,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  KEY `FK_C4FQV34P1MBYLLOXANG7B1Q3L` (`USER_ID`),
  CONSTRAINT `FK_C4FQV34P1MBYLLOXANG7B1Q3L` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ROLE_MAPPING`
--

LOCK TABLES `USER_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `USER_ROLE_MAPPING` DISABLE KEYS */;
INSERT INTO `USER_ROLE_MAPPING` VALUES ('0e385573-6085-438e-9369-ed99bbbed114','d6a4298b-37a1-4834-ba24-b157a0e08658'),('5b868f9d-c09a-406a-bc9b-42bd1722703f','d6a4298b-37a1-4834-ba24-b157a0e08658'),('6e9e8c24-03de-43bc-8e1d-22cd2d142100','d6a4298b-37a1-4834-ba24-b157a0e08658'),('77372a92-58e2-474e-abac-b1beefb23f67','d6a4298b-37a1-4834-ba24-b157a0e08658');
/*!40000 ALTER TABLE `USER_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_SESSION`
--

DROP TABLE IF EXISTS `USER_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_SESSION` (
  `ID` varchar(36) NOT NULL,
  `AUTH_METHOD` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `LAST_SESSION_REFRESH` int(11) DEFAULT NULL,
  `LOGIN_USERNAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `REMEMBER_ME` bit(1) NOT NULL DEFAULT b'0',
  `STARTED` int(11) DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  `USER_SESSION_STATE` int(11) DEFAULT NULL,
  `BROKER_SESSION_ID` varchar(255) DEFAULT NULL,
  `BROKER_USER_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_SESSION`
--

LOCK TABLES `USER_SESSION` WRITE;
/*!40000 ALTER TABLE `USER_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_SESSION_NOTE`
--

DROP TABLE IF EXISTS `USER_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_SESSION_NOTE` (
  `USER_SESSION` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(2048) DEFAULT NULL,
  PRIMARY KEY (`USER_SESSION`,`NAME`),
  CONSTRAINT `FK5EDFB00FF51D3472` FOREIGN KEY (`USER_SESSION`) REFERENCES `USER_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_SESSION_NOTE`
--

LOCK TABLES `USER_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `USER_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WEB_ORIGINS`
--

DROP TABLE IF EXISTS `WEB_ORIGINS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WEB_ORIGINS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  KEY `FK_LOJPHO213XCX4WNKOG82SSRFY` (`CLIENT_ID`),
  CONSTRAINT `FK_LOJPHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WEB_ORIGINS`
--

LOCK TABLES `WEB_ORIGINS` WRITE;
/*!40000 ALTER TABLE `WEB_ORIGINS` DISABLE KEYS */;
INSERT INTO `WEB_ORIGINS` VALUES ('a8052be8-34bd-4b5e-a077-94f1562c3ee6','*');
/*!40000 ALTER TABLE `WEB_ORIGINS` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-19 10:05:47
