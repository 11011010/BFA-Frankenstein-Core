/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


replace  into `account`(`id`,`username`,`salt`,`verifier`,`session_key_auth`,`session_key_bnet`,`sha_pass_hash`,`v`,`s`,`email`,`joindate`,`last_ip`,`failed_logins`,`locked`,`lock_country`,`last_login`,`online`,`EXPANSION`,`mutetime`,`locale`,`os`,`recruiter`,`recruiter_rewarded`,`battlenet_account`,`battlenet_index`,`mutereason`,`muteby`,`AtAuthFlag`,`coins`,`hwid`,`reg_mail`,`last_attempt_ip`) values 
(1,'1#1','˚wÉà™óód%’Ï∏€\'†@_O#êVà˜9…˛åK','ˇ\Zö7éÂQ\\Vì0·v_¨Îëòa›V~‚Ui',NULL,NULL,'','dummy value, use `verifier` instead','dummy value, use `salt` instead','GM@GM','2021-01-01 00:00:00','127.0.0.1',0,0,'00','0000-00-00 00:00:00',0,8,0,0,'',0,0,1,1,'','',0,999999,0,'GM@GM','127.0.0.1');

replace  into `account_access`(`id`,`gmlevel`,`RealmID`) values 
(1,3,-1);

replace  into `battlenet_accounts`(`id`,`email`,`sha_pass_hash`,`joindate`,`last_ip`,`failed_logins`,`locked`,`lock_country`,`last_login`,`online`,`locale`,`os`,`LastCharacterUndelete`,`LoginTicket`,`LoginTicketExpiry`,`balans`) values 
(1,'GM@GM','586EF64D6BCF71292B55C8805E465172D876E0C79968F925A0DCE5D9B4BAA492','2020-08-18 20:09:45','127.0.0.1',0,0,'00',NULL,0,0,'',0,NULL,NULL,0);

replace  into `realmcharacters`(`realmid`,`acctid`,`numchars`) values 
(1,1,0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

