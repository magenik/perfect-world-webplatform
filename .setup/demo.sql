/*
Navicat MySQL Data Transfer

Source Server         : Bitnami Stack
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : demo_panel

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2015-01-19 20:46:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `auth`
-- ----------------------------
DROP TABLE IF EXISTS `auth`;
CREATE TABLE `auth` (
  `userid` int(11) NOT NULL DEFAULT '0',
  `zoneid` int(11) NOT NULL DEFAULT '0',
  `rid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`userid`,`zoneid`,`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth
-- ----------------------------

-- ----------------------------
-- Table structure for `forbid`
-- ----------------------------
DROP TABLE IF EXISTS `forbid`;
CREATE TABLE `forbid` (
  `userid` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `ctime` datetime NOT NULL,
  `forbid_time` int(11) NOT NULL DEFAULT '0',
  `reason` blob NOT NULL,
  `gmroleid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`userid`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of forbid
-- ----------------------------

-- ----------------------------
-- Table structure for `groups`
-- ----------------------------
DROP TABLE IF EXISTS `groups`;
CREATE TABLE `groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `permissions` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `groups_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of groups
-- ----------------------------

-- ----------------------------
-- Table structure for `iplimit`
-- ----------------------------
DROP TABLE IF EXISTS `iplimit`;
CREATE TABLE `iplimit` (
  `uid` int(11) NOT NULL DEFAULT '0',
  `ipaddr1` int(11) DEFAULT '0',
  `ipmask1` varchar(2) DEFAULT '',
  `ipaddr2` int(11) DEFAULT '0',
  `ipmask2` varchar(2) DEFAULT '',
  `ipaddr3` int(11) DEFAULT '0',
  `ipmask3` varchar(2) DEFAULT '',
  `enable` char(1) DEFAULT '',
  `lockstatus` char(1) DEFAULT '',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of iplimit
-- ----------------------------

-- ----------------------------
-- Table structure for `migrations`
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of migrations
-- ----------------------------

-- ----------------------------
-- Table structure for `point`
-- ----------------------------
DROP TABLE IF EXISTS `point`;
CREATE TABLE `point` (
  `uid` int(11) NOT NULL,
  `aid` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `zoneid` int(11) DEFAULT NULL,
  `zonelocalid` int(11) DEFAULT NULL,
  `accountstart` datetime DEFAULT NULL,
  `lastlogin` datetime DEFAULT NULL,
  `enddate` datetime DEFAULT NULL,
  PRIMARY KEY (`uid`,`aid`),
  KEY `point_aid_zoneid_index` (`aid`,`zoneid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of point
-- ----------------------------

-- ----------------------------
-- Table structure for `roles`
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `account_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `role_name` varchar(64) NOT NULL,
  `role_level` smallint(6) NOT NULL,
  `role_level2` smallint(6) NOT NULL,
  `role_race` tinyint(4) NOT NULL,
  `role_occupation` tinyint(4) NOT NULL,
  `role_gender` tinyint(4) NOT NULL,
  `role_spouse` int(11) NOT NULL,
  `faction_id` int(11) NOT NULL,
  `faction_name` varchar(64) NOT NULL,
  `faction_level` int(11) NOT NULL,
  `faction_domains` varchar(132) NOT NULL,
  `role_faction_rank` int(11) NOT NULL,
  `pvp_time` int(11) NOT NULL,
  `pvp_kills` int(11) NOT NULL,
  `pvp_deads` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of roles
-- ----------------------------

-- ----------------------------
-- Table structure for `throttle`
-- ----------------------------
DROP TABLE IF EXISTS `throttle`;
CREATE TABLE `throttle` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `attempts` int(11) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `banned` tinyint(1) NOT NULL DEFAULT '0',
  `last_attempt_at` timestamp NULL DEFAULT NULL,
  `suspended_at` timestamp NULL DEFAULT NULL,
  `banned_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `throttle_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of throttle
-- ----------------------------

-- ----------------------------
-- Table structure for `usecashlog`
-- ----------------------------
DROP TABLE IF EXISTS `usecashlog`;
CREATE TABLE `usecashlog` (
  `userid` int(11) NOT NULL DEFAULT '0',
  `zoneid` int(11) NOT NULL DEFAULT '0',
  `sn` int(11) DEFAULT '0',
  `aid` int(11) NOT NULL DEFAULT '0',
  `point` int(11) NOT NULL DEFAULT '0',
  `cash` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `creatime` datetime NOT NULL,
  `fintime` datetime NOT NULL,
  KEY `usecashlog_creatime_index` (`creatime`),
  KEY `usecashlog_userid_zoneid_sn_index` (`userid`,`zoneid`,`sn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of usecashlog
-- ----------------------------

-- ----------------------------
-- Table structure for `usecashnow`
-- ----------------------------
DROP TABLE IF EXISTS `usecashnow`;
CREATE TABLE `usecashnow` (
  `userid` int(11) NOT NULL DEFAULT '0',
  `zoneid` int(11) NOT NULL DEFAULT '0',
  `sn` int(11) NOT NULL DEFAULT '0',
  `aid` int(11) NOT NULL DEFAULT '0',
  `point` int(11) NOT NULL DEFAULT '0',
  `cash` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `creatime` datetime NOT NULL,
  PRIMARY KEY (`userid`,`zoneid`,`sn`),
  KEY `usecashnow_creatime_index` (`creatime`),
  KEY `usecashnow_status_index` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of usecashnow
-- ----------------------------

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '',
  `passwd` varchar(64) NOT NULL,
  `password` varchar(64) NOT NULL,
  `creatime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Prompt` varchar(32) NOT NULL DEFAULT '',
  `answer` varchar(32) NOT NULL DEFAULT '',
  `truename` varchar(32) NOT NULL DEFAULT '',
  `idnumber` varchar(32) NOT NULL DEFAULT '',
  `email` varchar(64) NOT NULL DEFAULT '',
  `mobilenumber` varchar(32) NOT NULL DEFAULT '',
  `province` varchar(32) NOT NULL DEFAULT '',
  `bio` text,
  `gender` varchar(32) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `pic` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `postal` varchar(255) DEFAULT NULL,
  `phonenumber` varchar(32) NOT NULL DEFAULT '',
  `birthday` datetime DEFAULT NULL,
  `qq` varchar(32) NOT NULL DEFAULT '',
  `now_sn` int(11) NOT NULL DEFAULT '0',
  `passwd2` varchar(64) DEFAULT NULL,
  `permissions` text,
  `activated` tinyint(1) NOT NULL DEFAULT '0',
  `activation_code` varchar(255) DEFAULT NULL,
  `activated_at` timestamp NULL DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `persist_code` varchar(255) DEFAULT NULL,
  `reset_password_code` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_name_unique` (`name`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_creatime_normal` (`creatime`),
  KEY `users_activation_code_index` (`activation_code`),
  KEY `users_reset_password_code_index` (`reset_password_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------

-- ----------------------------
-- Table structure for `users_groups`
-- ----------------------------
DROP TABLE IF EXISTS `users_groups`;
CREATE TABLE `users_groups` (
  `user_id` int(10) unsigned NOT NULL,
  `group_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_groups
-- ----------------------------

-- ----------------------------
-- Procedure structure for `acquireuserpasswd`
-- ----------------------------
DROP PROCEDURE IF EXISTS `acquireuserpasswd`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `acquireuserpasswd`(in name1 VARCHAR(64), out uid1 INTEGER, out passwd1 VARCHAR(64))
BEGIN
  DECLARE passwdtemp VARCHAR(64);
  START TRANSACTION;
    SELECT id, passwd INTO uid1, passwdtemp FROM users WHERE name = name1;
  COMMIT;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `addaccount`
-- ----------------------------
DROP PROCEDURE IF EXISTS `addaccount`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addaccount`(
  in name1 VARCHAR(64),
  in passwd1 VARCHAR(64)
)
BEGIN
  
   INSERT INTO account (id,name,passwd,creatime,usertype,now_sn) VALUES( '32', name1, passwd1, now(), '0', '0' );

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `addcash`
-- ----------------------------
DROP PROCEDURE IF EXISTS `addcash`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addcash`(
  in name1 varchar(32),
  in cash1 INTEGER
)
BEGIN
    DECLARE userid_old integer;
    DECLARE id_old integer;
    DECLARE zoneid_old integer;
    DECLARE now_sn_old integer;
    DECLARE aid_old integer;
    DECLARE point_old integer;
    DECLARE cash_old integer;
    DECLARE status_old integer;
    DECLARE createtime_old datetime;
    DECLARE cash2 integer;
    DECLARE exists1 integer;
    DECLARE rowcount INTEGER;
    SET zoneid_old = '1';
    SET aid_old = '23';
    SET point_old = '0';
    SET status_old = '3';
    SET createtime_old = NOW();
  START TRANSACTION;
  SELECT id, now_sn INTO id_old, now_sn_old FROM users WHERE name = name1;
    SET userid_old = id_old;
    SET now_sn_old = now_sn_old + 1;
    SET cash1 = cash1 * 2.5;
    
    SELECT userid,cash INTO userid_old, cash_old FROM usecashnow WHERE userid=userid_old;
    SET rowcount = FOUND_ROWS();
		IF rowcount = 1 THEN
			SET exists1 = 1;
    ELSE
		SET exists1 = 0;
	END IF;
    IF exists1 = 1 THEN
    	SET cash2 = cash_old + cash1;
    	UPDATE usecashnow SET cash=cash2 WHERE userid=userid_old;
    ELSE
    UPDATE users set now_sn = now_sn_old WHERE id = id_old;
    INSERT INTO usecashnow (userid, zoneid, sn, aid, point, cash, status, creatime) VALUES(userid_old, zoneid_old, now_sn_old, aid_old, point_old, cash1, status_old, createtime_old );
    END IF;
    COMMIT;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `addForbid`
-- ----------------------------
DROP PROCEDURE IF EXISTS `addForbid`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addForbid`(in userid1 INTEGER, in type1 INTEGER, in forbid_time1 INTEGER, in reason1 BINARY(255), in gmroleid1 INTEGER)
BEGIN
 DECLARE rowcount INTEGER;
  START TRANSACTION;
    UPDATE forbid SET ctime = now(), forbid_time = forbid_time1, reason = reason1, gmroleid = gmroleid1 WHERE userid = userid1 AND type = type1;
    SET rowcount = ROW_COUNT();
    IF rowcount = 0 THEN
      INSERT INTO forbid VALUES(userid1, type1, now(), forbid_time1, reason1, gmroleid);
    END IF;
  COMMIT;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `addGM`
-- ----------------------------
DROP PROCEDURE IF EXISTS `addGM`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addGM`(in userid INTEGER, in zoneid INTEGER)
BEGIN
  DECLARE x INTEGER;
  START TRANSACTION;
    SET x = 0;
    WHILE x < 12 DO
      INSERT INTO auth VALUES (userid, zoneid, x);
      SET x = x + 1;
    END WHILE;
    SET x = 100;
    WHILE x < 106 DO
      INSERT INTO auth VALUES (userid, zoneid, x);
      SET x = x + 1;
    END WHILE;
    SET x = 200;
    WHILE x < 215 DO
      INSERT INTO auth VALUES (userid, zoneid, x);
      SET x = x + 1;
    END WHILE;
    SET x = 500;
    WHILE x < 519 DO
      INSERT INTO auth VALUES (userid, zoneid, x);
      SET x = x + 1;
    END WHILE;
  COMMIT;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `addusecashnow`
-- ----------------------------
DROP PROCEDURE IF EXISTS `addusecashnow`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addusecashnow`(
	in userid1 integer,
	in zoneid1 integer,
	in aid1 integer,
	in cash1 integer,
  out error INTEGER
)
BEGIN

	DECLARE sn_old integer;
	DECLARE aid_old integer;
	DECLARE point_old integer;
	DECLARE cash_old integer;
	DECLARE status_old integer;
	DECLARE creatime_old datetime;
	DECLARE need_restore integer;
	DECLARE exists1 integer;
	DECLARE rowcount INTEGER;

	DECLARE status1 integer;
	DECLARE point1 integer;
	DECLARE sn integer;
	DECLARE error integer;
	
  START TRANSACTION;
	SET sn = 0;
	SET status1 = 1;
	SET point1 = cash1 * 90;
	UPDATE point SET time = time + point1 WHERE userid1 = uid AND aid1 = aid;

	SET error = 0;
	SET need_restore = 0;
	SELECT SQL_CALC_FOUND_ROWS  sn,aid,point,cash,status,creatime INTO sn_old, aid_old, point_old, cash_old, status_old, creatime_old FROM usecashnow WHERE userid=userid1 AND zoneid=zoneid1 AND sn>=0;

	SET rowcount = FOUND_ROWS();
	IF rowcount = 1 THEN
			SET exists1 = 1;
	ELSE
			SET exists1 = 0;
	END IF;

	IF status1 = 1 THEN
		IF exists1 = 0 THEN
			UPDATE point SET time=time-point1 WHERE userid1=uid AND aid1=aid AND time>=point1;
			SET rowcount = ROW_COUNT();
			IF rowcount = 1	THEN
				INSERT INTO usecashnow (userid, zoneid, sn, aid, point, cash, status, creatime) VALUES(userid1, zoneid1, sn, aid1, point1, cash1, status1, now() );
			ELSE
				INSERT INTO usecashnow SELECT userid1, zoneid1, IFNULL(min(sn),0)-1, aid1, point1, cash1, 0, getdate() FROM usecashnow WHERE userid=userid1 and zoneid=zoneid1 and 0>=sn;
				SET error = -8;
			END IF;
		ELSE
			INSERT INTO usecashnow SELECT userid1, zoneid1, IFNULL(min(sn),0)-1, aid1, point, cash1, 0, getdate() FROM usecashnow WHERE userid=userid1 and zoneid=zoneid1 and 0>=sn;
			SET error = -7;
		END IF;
	END IF;

	IF need_restore = 1	THEN
		UPDATE point SET time=time+point_old WHERE userid1=uid AND aid_old=aid;
		DELETE FROM usecashnow WHERE userid1=userid AND zoneid1=zoneid AND sn_old=sn;
		INSERT INTO usecashlog (userid, zoneid, sn, aid, point, cash, status, creatime, fintime) VALUES(userid1, zoneid1, sn_old, aid_old, point_old, cash_old, status1, creatime_old, now() );
	END IF;
	COMMIT;
	select error;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `adduserpoint`
-- ----------------------------
DROP PROCEDURE IF EXISTS `adduserpoint`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `adduserpoint`(in uid1 INTEGER, in aid1 INTEGER, in time1 INTEGER)
BEGIN
 DECLARE rowcount INTEGER;
 START TRANSACTION;
    UPDATE point SET time = IFNULL(time,0) + time1 WHERE uid1 = uid AND aid1 = aid;
    SET rowcount = ROW_COUNT();
    IF rowcount = 0 THEN
      INSERT INTO point (uid,aid,time,zoneid,zonelocalid,accountstart,lastlogin,enddate) VALUES (uid1,aid1,36000+time1, NULL, NULL, NULL, NULL, NULL);
    END IF;
  COMMIT;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `addUserPriv`
-- ----------------------------
DROP PROCEDURE IF EXISTS `addUserPriv`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addUserPriv`(in userid INTEGER, in zoneid INTEGER, in rid INTEGER)
BEGIN
  START TRANSACTION;
    INSERT INTO auth VALUES(userid, zoneid, rid);
  COMMIT;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `adduser_gamecp`
-- ----------------------------
DROP PROCEDURE IF EXISTS `adduser_gamecp`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `adduser_gamecp`(
	in name1 VARCHAR(32),
  in passwd1 VARCHAR(64),
  in password1 VARCHAR(64),
  in prompt1 VARCHAR(32),
  in answer1 VARCHAR(32),
  in truename1 VARCHAR(32),
  in idnumber1 VARCHAR(32),
  in email1 VARCHAR(64),
  in mobilenumber1 VARCHAR(32),
  in province1 VARCHAR(32),
  in bio1 LONGTEXT,  
  in gender1 VARCHAR(32), 
  in dob1 DATETIME,  
  in pic1 VARCHAR(255),
  in country1 VARCHAR(255),
  in state1 VARCHAR(255),
  in city1 VARCHAR(255),
  in address1 VARCHAR(255),
  in postal1 VARCHAR(255),
  in phonenumber1 VARCHAR(32),
  in birthday1 DATETIME,
  in createtime1 DATETIME,
  in qq1 VARCHAR(32),
  in now_sn1 VARCHAR(32),
  in passwd21 VARCHAR(64),
  in permissions1 LONGTEXT,
  in activation_code1 VARCHAR(255),
  in activated_at1 DATETIME,
  in last_login1 DATETIME,
  in persist_code1 VARCHAR(255),
  in reset_password_code1 VARCHAR(255),
  in first_name1 VARCHAR(255),
  in last_name1 VARCHAR(255),
  in created_at1 DATETIME,
  in updated_at1 DATETIME,
  in deleted_at1 DATETIME)
BEGIN
  DECLARE idtemp INTEGER;
    SELECT IFNULL(MAX(id), 16) + 16 INTO idtemp FROM users;
    INSERT INTO users (id,name,passwd,password,prompt,answer,truename,idnumber,email,mobilenumber,province,bio,gender,dob,pic,country,state,city,address,postal,phonenumber,birthday,creatime,qq,now_sn,passwd2,permissions,activation_code,activated_at,last_login,persist_code,reset_password_code,first_name,last_name,created_at,updated_at,deleted_at)
    
    VALUES( idtemp,name1,passwd1,password1,prompt1,answer1,truename1,idnumber1,email1,mobilenumber1,province1,bio1,gender1,dob1,pic1,country1,state1,city1,address1,postal1,phonenumber1,birthday1,createtime1,qq1,now_sn1,passwd21,permissions1,activation_code1,activated_at1,last_login1,persist_code1,reset_password_code1,first_name1,last_name1,created_at1,updated_at1,deleted_at1 );
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `changePasswd`
-- ----------------------------
DROP PROCEDURE IF EXISTS `changePasswd`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `changePasswd`(in name1 VARCHAR(64), in passwd1 VARCHAR(64), in hashedPw1 VARCHAR(64))
BEGIN
  START TRANSACTION;
    UPDATE users SET passwd = passwd1, hashedPw = hashedPw1 WHERE name = name1;
  COMMIT;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `changePasswd2`
-- ----------------------------
DROP PROCEDURE IF EXISTS `changePasswd2`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `changePasswd2`(in name1 VARCHAR(64), in passwd21 VARCHAR(64))
BEGIN
  START TRANSACTION;
    UPDATE users SET passwd2 = passwd21 WHERE name = name1;
  COMMIT;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `clearonlinerecords`
-- ----------------------------
DROP PROCEDURE IF EXISTS `clearonlinerecords`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `clearonlinerecords`(in zoneid1 INTEGER, in aid1 INTEGER)
BEGIN
  START TRANSACTION;
    UPDATE point SET zoneid = NULL, zonelocalid = NULL WHERE aid = aid1 AND zoneid = zoneid1;
  COMMIT;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `deleteTimeoutForbid`
-- ----------------------------
DROP PROCEDURE IF EXISTS `deleteTimeoutForbid`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteTimeoutForbid`(in userid1 INTEGER)
BEGIN
  START TRANSACTION;
    DELETE FROM forbid WHERE userid = userid1 AND timestampdiff(second, ctime, now()) > forbid_time;
  COMMIT;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `delUserPriv`
-- ----------------------------
DROP PROCEDURE IF EXISTS `delUserPriv`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delUserPriv`(in userid1 INTEGER, in zoneid1 INTEGER, in rid1 INTEGER, in deltype1 INTEGER)
BEGIN
START TRANSACTION;
  IF deltype1 = 0 THEN
    DELETE FROM auth WHERE userid = userid1 AND zoneid = zoneid1 AND rid = rid1;
  ELSE
    IF deltype1 = 1 THEN
      DELETE FROM auth WHERE userid = userid1 AND zoneid = zoneid1;
    ELSE
      IF deltype1 = 2 THEN
        DELETE FROM auth WHERE userid = userid1;
      END IF;
    END IF;
  END IF;
COMMIT;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `enableiplimit`
-- ----------------------------
DROP PROCEDURE IF EXISTS `enableiplimit`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `enableiplimit`(in uid1 INTEGER, in enable1 CHAR(1))
BEGIN
  DECLARE rowcount INTEGER;
  START TRANSACTION;
  UPDATE iplimit SET enable=enable1 WHERE uid=uid1;
  SET rowcount = ROW_COUNT();
  IF rowcount = 0 THEN
    INSERT INTO iplimit (uid,enable) VALUES (uid1,enable1);
  END IF;
  COMMIT;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `lockuser`
-- ----------------------------
DROP PROCEDURE IF EXISTS `lockuser`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `lockuser`(in uid1 INTEGER, in lockstatus1 CHAR(1))
BEGIN
  DECLARE rowcount INTEGER;
  START TRANSACTION;
  UPDATE iplimit SET lockstatus=lockstatus1 WHERE uid=uid1;
  SET rowcount = ROW_COUNT();
  IF rowcount = 0 THEN
    INSERT INTO iplimit (uid,lockstatus,enable) VALUES (uid1,lockstatus1,'t');
  END IF;
  COMMIT;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `recordoffline`
-- ----------------------------
DROP PROCEDURE IF EXISTS `recordoffline`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `recordoffline`(in uid1 INTEGER, in aid1 INTEGER, inout zoneid1 INTEGER, inout zonelocalid1 INTEGER, inout overwrite1 INTEGER)
BEGIN
  DECLARE rowcount INTEGER;
  START TRANSACTION;
    UPDATE point SET zoneid = NULL, zonelocalid = NULL WHERE uid = uid1 AND aid = aid1 AND zoneid = zoneid1;
    SET rowcount = ROW_COUNT();
    IF overwrite1 = rowcount THEN
      SELECT zoneid, zonelocalid INTO zoneid1, zonelocalid1 FROM point WHERE uid = uid1 AND aid = aid1;
    END IF;
  COMMIT;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `recordonline`
-- ----------------------------
DROP PROCEDURE IF EXISTS `recordonline`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `recordonline`(in uid1 INTEGER, in aid1 INTEGER, inout zoneid1 INTEGER, inout zonelocalid1 INTEGER, inout overwrite INTEGER)
BEGIN
  DECLARE tmp_zoneid INTEGER;
  DECLARE tmp_zonelocalid INTEGER;
  DECLARE rowcount INTEGER;
  START TRANSACTION;
    SELECT SQL_CALC_FOUND_ROWS zoneid, zonelocalid INTO tmp_zoneid, tmp_zonelocalid FROM point WHERE uid = uid1 and aid = aid1;
    SET rowcount = FOUND_ROWS();
    IF rowcount = 0 THEN
      INSERT INTO point (uid, aid, time, zoneid, zonelocalid, lastlogin) VALUES (uid1, aid1, 0, zoneid1, zonelocalid1, now());
    ELSE IF tmp_zoneid IS NULL OR overwrite = 1 THEN
      UPDATE point SET zoneid = zoneid1, zonelocalid = zonelocalid1, lastlogin = now() WHERE uid = uid1 AND aid = aid1;
    END IF;
    END IF;
    IF tmp_zoneid IS NULL THEN
      SET overwrite = 1;
    ELSE
      SET zoneid1 = tmp_zoneid;
      SET zonelocalid1 = tmp_zonelocalid;
    END IF;
  COMMIT;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `remaintime`
-- ----------------------------
DROP PROCEDURE IF EXISTS `remaintime`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `remaintime`(in uid1 INTEGER, in aid1 INTEGER, out remain INTEGER, out freetimeleft INTEGER)
BEGIN
  DECLARE enddate1 DATETIME;
  DECLARE now1 DATETIME;
  DECLARE rowcount INTEGER;
  START TRANSACTION;
  SET now1 = now();
  IF aid1 = 0 THEN
    SET remain = 86313600;
    SET enddate1 = date_add(now1, INTERVAL '30' DAY);
  ELSE
    SELECT time, IFNULL(enddate, now1) INTO remain, enddate1 FROM point WHERE uid = uid1 AND aid = aid1;
    SET rowcount = ROW_COUNT();
    IF rowcount = 0 THEN
      SET remain = 0;
      INSERT INTO point (uid,aid,time) VALUES (uid1, aid1, remain);
    END IF;
  END IF;
  SET freetimeleft = 0;
  IF enddate1 > now1 THEN
    SET freetimeleft = timestampdiff(second, now1, enddate1);
  END IF;
  COMMIT;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `setiplimit`
-- ----------------------------
DROP PROCEDURE IF EXISTS `setiplimit`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `setiplimit`(in uid1 INTEGER, in ipaddr11 INTEGER, in ipmask11 VARCHAR(2), in ipaddr21 INTEGER, in ipmask21 VARCHAR(2), in ipaddr31 INTEGER, in ipmask31 VARCHAR(2), in enable1 CHAR(1))
BEGIN
  DECLARE rowcount INTEGER;
  START TRANSACTION;
    UPDATE iplimit SET ipaddr1 = ipaddr11, ipmask1 = ipmask11, ipaddr2 = ipaddr21, ipmask2 = ipmask21, ipaddr3 = ipaddr31, ipmask3 = ipmask31 WHERE uid = uid1;
    SET rowcount = ROW_COUNT();
    IF rowcount = 0 THEN
      INSERT INTO iplimit (uid, ipaddr1, ipmask1, ipaddr2, ipmask2, ipaddr3, ipmask3, enable1) VALUES (uid1, ipaddr11, ipmask11, ipaddr21, ipmask21, ipaddr31, ipmask31,'t');
    END IF;
  COMMIT;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `updateUserInfo`
-- ----------------------------
DROP PROCEDURE IF EXISTS `updateUserInfo`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateUserInfo`(
  in name1 VARCHAR(32),
  in prompt1 VARCHAR(32),
  in answer1 VARCHAR(32),
  in truename1 VARCHAR(32),
  in idnumber1 VARCHAR(32),
  in email1 VARCHAR(32),
  in mobilenumber1 VARCHAR(32),
  in province1 VARCHAR(32),
  in city1 VARCHAR(32),
  in phonenumber1 VARCHAR(32),
  in address1 VARCHAR(32),
  in postalcode1 VARCHAR(32),
  in gender1 INTEGER,
  in birthday1 VARCHAR(32),
  in qq1 VARCHAR(32)
 )
BEGIN
  START TRANSACTION;
    UPDATE users SET prompt = prompt1, answer = answer1, truename = truename1, idnumber = idnumber1, email = email1, mobilenumber = mobilenumber1, province = province1, city = city1, phonenumber = phonenumber1, address = address1, postalcode = postalcode1, gender = gender1, birthday = birthda1, qq = qq1 WHERE name = name1;
  COMMIT;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `usecash`
-- ----------------------------
DROP PROCEDURE IF EXISTS `usecash`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usecash`(
  in userid1 INTEGER,
  in zoneid1 INTEGER,
  in sn1 INTEGER,
  in aid1 INTEGER,
  in point1 INTEGER,
  in cash1 INTEGER,
  in status1 INTEGER,
  out error INTEGER
)
BEGIN
DECLARE sn_old INTEGER;
DECLARE aid_old INTEGER;
DECLARE point_old INTEGER;
DECLARE cash_old INTEGER;
DECLARE status_old INTEGER;
DECLARE createtime_old DATETIME;
DECLARE time_old INTEGER;
DECLARE need_restore INTEGER;
DECLARE exists1 INTEGER;
DECLARE rowcount INTEGER;
START TRANSACTION;
  SET error = 0;
  SET need_restore = 0;
  SELECT SQL_CALC_FOUND_ROWS sn, aid, point, cash, status, creatime INTO sn_old, aid_old, point_old, cash_old, status_old, createtime_old FROM usecashnow WHERE userid = userid1 AND zoneid = zoneid1 AND sn >= 0;
  SET rowcount = FOUND_ROWS();
  IF rowcount = 1 THEN
    SET exists1 = 1;
  ELSE
    SET exists1 = 0;
  END IF;
  IF status1 = 0 THEN
    IF exists1 = 0 THEN
      SELECT aid, point INTO aid1, point1 FROM usecashnow WHERE userid = userid1 AND zoneid = zoneid1 AND sn = sn1;
      SET point1 = IFNULL(point1,0);
      UPDATE point SET time = time-point1 WHERE uid = userid1 AND aid = aid1 AND time >= point1;
      SET rowcount = ROW_COUNT();
      IF rowcount = 1 THEN
        UPDATE usecashnow SET sn = 0, status = 1 WHERE userid = userid1 AND zoneid = zoneid1 AND sn = sn1;
      ELSE
        SET error = -8;
      END IF;
    END IF;
  ELSE
    IF status1 = 1 THEN
      IF exists1 = 0 THEN
        UPDATE point SET time = time-point1 WHERE uid = userid1 AND aid = aid1 AND time >= point1;
        SET rowcount = ROW_COUNT();
        IF rowcount = 1 THEN
          INSERT INTO usecashnow (userid, zoneid, sn, aid, point, cash, status, creatime) VALUES (userid1, zoneid1, sn1, aid1, point1, cash1, status1, now());
        ELSE
          INSERT INTO usecashnow SELECT userid1, zoneid1, IFNULL(min(sn),0)-1, aid1, point1, cash1, 0, now() FROM usecashnow WHERE userid = userid1 AND zoneid = zoneid1 AND 0 >= sn;
          SET error = -8;
        END IF;
      ELSE
        INSERT INTO usecashnow SELECT userid1, zoneid1, IFNULL(min(sn),0)-1, aid1, point1, cash1, 0, now() FROM usecashnow WHERE userid = userid1 AND zoneid = zoneid1 AND 0 >= sn;
        SET error = -7;
      END IF;
    ELSE
      IF status1 = 2 THEN
        IF exists1 = 1 AND status_old = 1 AND sn_old = 0 THEN
          UPDATE usecashnow SET sn = sn1, status = status1 WHERE userid = userid1 AND zoneid = zoneid1 AND sn = sn_old;
        ELSE
          SET error = -9;
        END IF;
      ELSE
        IF status1 = 3 THEN
           IF exists1 = 1 AND status_old = 2 THEN
            UPDATE usecashnow SET status = status1 WHERE userid = userid1 AND zoneid = zoneid1 AND sn = sn_old;
           ELSE
            SET error = -10;
            END IF;
        ELSE
         IF status1 = 4 THEN
          IF exists1 = 1 THEN
            DELETE FROM usecashnow WHERE userid = userid1 AND zoneid = zoneid1 AND sn = sn_old;
            INSERT INTO usecashlog (userid, zoneid, sn, aid, point, cash, status, creatime, fintime) VALUES (userid1, zoneid1, sn_old, aid_old, point_old, cash_old, status1, createtime_old, now());
          END IF;
          IF NOT (exists1 = 1 AND status_old = 3) THEN
            SET error = -11;
          END IF;
        ELSE
          SET error = -12;
        END IF;
      END IF;
    END IF;
  END IF;
  END IF;
  IF need_restore = 1 THEN
    UPDATE point SET time = time+point_old WHERE uid = userid1 AND aid = aid_old;
    DELETE FROM usecashnow WHERE userid = userid1 AND zoneid = zoneid1 AND sn = sn_old;
    INSERT INTO usecashlog (userid, zoneid, sn, aid, point, cash, status, creatime, fintime) VALUES (userid1, zoneid1, sn_old, aid_old, point_old, cash_old, status1, createtime_old, now());
  END IF;
COMMIT;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `usecash_good`
-- ----------------------------
DROP PROCEDURE IF EXISTS `usecash_good`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usecash_good`(
  in userid1 INTEGER,
  in zoneid1 INTEGER,
  in sn1 INTEGER,
  in aid1 INTEGER,
  in point1 INTEGER,
  in cash1 INTEGER,
  in status1 INTEGER,
  out error INTEGER
)
BEGIN
	DECLARE sn_old integer;
	DECLARE aid_old integer;
	DECLARE point_old integer;
	DECLARE cash_old integer;
	DECLARE status_old integer;
	DECLARE createtime_old datetime;
	DECLARE need_restore integer;
	DECLARE exists1 integer;
    DECLARE rowcount INTEGER;
    START TRANSACTION;
	SET error = 0;
	SET need_restore = 0;
	SELECT sn,aid,point,cash,status,creatime INTO sn_old, aid_old, point_old, cash_old, status_old, createtime_old FROM usecashnow WHERE userid=userid1 AND zoneid=zoneid1 AND sn>=0;

	SET rowcount = FOUND_ROWS();
	IF rowcount = 1 THEN
		SET exists1 = 1;
	ELSE
		SET exists1 = 1;
	END IF;
	IF status1 = 0 THEN
		IF exists1 = 0 THEN
			SELECT sn,aid,point,cash,status,creatime INTO sn_old, aid_old, point_old, cash_old, status_old, createtime_old FROM usecashnow WHERE userid=userid1 AND zoneid=zoneid1 AND sn=sn1;
			SET rowcount = ROW_COUNT();
			IF rowcount = 1	THEN
				SET point_old = IFNULL(point_old,0);
				UPDATE point SET time=time-point_old WHERE uid=userid1 AND aid=aid_old AND time>=point_old;
				SET rowcount = ROW_COUNT();
				IF rowcount = 1	THEN
					DELETE FROM usecashnow WHERE userid=userid1 AND zoneid=zoneid1 AND sn=sn1;
					INSERT INTO usecashnow (userid, zoneid, sn, aid, point, cash, status, creatime) VALUES(userid1, zoneid1, 0, aid_old, point_old, cash_old, 1, createtime_old );
				ELSE
					SET error = -8;
				END IF;
			ELSE
				SET error = -12;
			END IF;
		ELSE
			SET error = -7;
		END IF;
	ELSE
		IF status1 = 1 THEN
			IF exists1 = 0 THEN
				UPDATE point SET time= time-point1 WHERE uid=userid1 AND aid=aid1 AND time>=point1;
				SET rowcount = ROW_COUNT();
				IF rowcount = 1 THEN
					INSERT INTO usecashnow (userid, zoneid, sn, aid, point, cash, status, creatime) VALUES(userid1, zoneid1, sn1, aid1, point1, cash1, status1, now() );
				ELSE
					INSERT INTO usecashnow SELECT userid1, zoneid1, IFNULL(min(sn),0)-1, aid1, point1, cash1, 0, now() FROM usecashnow WHERE userid=userid1 and zoneid=zoneid1 and 0>=sn;
					SET error = -8;
				END IF;
			ELSE
				INSERT INTO usecashnow SELECT userid1, zoneid1, IFNULL(min(sn),0)-1, aid1, point1, cash1, 0, now() FROM usecashnow WHERE userid=userid1 and zoneid=zoneid1 and 0>=sn;
				SET error = -7;
			END IF;
		ELSE
	 		IF status1 = 2 THEN
				IF exists1 = 1 AND status_old = 1 AND sn_old = 0 THEN
					DELETE FROM usecashnow WHERE userid=userid1 AND zoneid=zoneid1 AND sn=sn_old;
					INSERT INTO usecashnow (userid, zoneid, sn, aid, point, cash, status, creatime) VALUES(userid1, zoneid1, sn1, aid_old, point_old, cash_old, status1, createtime_old );
				ELSE
				SET error = -9;
				END IF;
			ELSE
	 			IF status1 = 3	THEN
					IF exists1 = 1 AND status_old = 2	THEN
				 		DELETE FROM usecashnow WHERE userid=userid1 AND zoneid=zoneid1 AND sn=sn_old;
						INSERT INTO usecashnow (userid, zoneid, sn, aid, point, cash, status, creatime) VALUES(userid1, zoneid1, sn_old, aid_old, point_old, cash_old, status1, createtime_old );
					ELSE
					SET error = -10;
					END IF;
	 			ELSE
	 			IF status1 = 4	THEN
					IF exists1 = 1 THEN
						DELETE FROM usecashnow WHERE userid=userid1 AND zoneid=zoneid1 AND sn=sn_old;
						INSERT INTO usecashlog (userid, zoneid, sn, aid, point, cash, status, creatime, fintime) VALUES(userid1, zoneid1, sn_old, aid_old, point_old, cash_old, status1, createtime_old, now() );
					END IF;
					IF NOT (exists1 = 1 AND status_old = 3)	THEN
       			SET error = -11;
    			END IF;
				ELSE
					SET error = -12;
				END IF;
 			END IF;
		END IF;
		END IF;
	END IF;
	IF need_restore = 1	THEN
		UPDATE point SET time=time+point_old WHERE uid=userid1 AND aid=aid_old;
		DELETE FROM usecashnow WHERE userid=userid1 AND zoneid=zoneid1 AND sn=sn_old;
		INSERT INTO usecashlog (userid, zoneid, sn, aid, point, cash, status, creatime, fintime) VALUES(userid1, zoneid1, sn_old, aid_old, point_old, cash_old, status1, createtime_old, now() );
	END IF;
	COMMIT;
    END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for `fn_varbintohexsubstring`
-- ----------------------------
DROP FUNCTION IF EXISTS `fn_varbintohexsubstring`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_varbintohexsubstring`(fsetprefix bit,pbinin varbinary(8000),startoffset int,cbytesin int) RETURNS varchar(4000) CHARSET latin1
    READS SQL DATA
BEGIN
  DECLARE pstrout VARCHAR(4000);
  DECLARE i int;
  DECLARE firstnibble int;
  DECLARE secondnibble int;
  DECLARE tempint int;
  DECLARE hexstring char( 16);
  BEGIN
    IF( pbinin IS NOT NULL) THEN
      SET i= 0, cbytesin= CASE WHEN( cbytesin> 0) THEN cbytesin ELSE LENGTH( pbinin) END,
         pstrout= CASE WHEN( fsetprefix= 1) THEN '0x'  ELSE ''  END,
         hexstring= '0123456789abcdef';
      IF((( cbytesin * 2) + 2> 4000) or( startoffset< 1)) THEN
        RETURN NULL;
      END IF;
      WHILE( i< cbytesin) DO
        SET tempint= ASCII( substring( pbinin, i + startoffset, 1));
        SET firstnibble= TRUNCATE((tempint / 16),0);
        SET secondnibble= tempint % 16;
        SET pstrout= CONCAT(pstrout ,cast( substring( hexstring,( firstnibble+1), 1) AS CHAR), cast( substring( hexstring,( secondnibble+1), 1) AS CHAR));
        SET i= i + 1;
      END WHILE;
      RETURN pstrout;
    END IF;
    RETURN NULL;
  END;
END
;;
DELIMITER ;
