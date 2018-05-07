/*
Navicat MySQL Data Transfer

Source Server         : test
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : zucc

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-05-06 09:37:29
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bbs_attachment
-- ----------------------------
DROP TABLE IF EXISTS `bbs_attachment`;
CREATE TABLE `bbs_attachment` (
  `AID` int(11) NOT NULL,
  `TID` int(11) NOT NULL,
  `AName` varchar(300) DEFAULT NULL,
  `AFilePath` varchar(300) DEFAULT NULL,
  `UID` int(11) NOT NULL,
  `ACreateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`AID`),
  KEY `TID` (`TID`),
  KEY `UID` (`UID`),
  CONSTRAINT `bbs_attachment_ibfk_1` FOREIGN KEY (`TID`) REFERENCES `bbs_topic` (`TID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `bbs_attachment_ibfk_2` FOREIGN KEY (`UID`) REFERENCES `bbs_user` (`UID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bbs_class
-- ----------------------------
DROP TABLE IF EXISTS `bbs_class`;
CREATE TABLE `bbs_class` (
  `SID` int(11) NOT NULL,
  `SName` varchar(300) DEFAULT NULL,
  `SIntro` varchar(500) DEFAULT NULL,
  `STopicCount` varchar(255) DEFAULT NULL,
  `UID` int(11) DEFAULT NULL,
  `SCreateTime` datetime DEFAULT NULL,
  `SClickCount` int(11) DEFAULT NULL,
  PRIMARY KEY (`SID`),
  KEY `UID` (`UID`),
  CONSTRAINT `bbs_class_ibfk_1` FOREIGN KEY (`UID`) REFERENCES `bbs_user` (`UID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bbs_replay
-- ----------------------------
DROP TABLE IF EXISTS `bbs_replay`;
CREATE TABLE `bbs_replay` (
  `RID` int(11) NOT NULL,
  `TID` int(11) NOT NULL,
  `RContent` varchar(300) DEFAULT NULL,
  `UID` int(11) NOT NULL,
  `ReplyLastTime` datetime DEFAULT NULL COMMENT '最后修改时间',
  `ReplyCreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`RID`),
  KEY `TID` (`TID`),
  KEY `UID` (`UID`),
  CONSTRAINT `bbs_replay_ibfk_1` FOREIGN KEY (`TID`) REFERENCES `bbs_topic` (`TID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `bbs_replay_ibfk_2` FOREIGN KEY (`UID`) REFERENCES `bbs_user` (`UID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bbs_topic
-- ----------------------------
DROP TABLE IF EXISTS `bbs_topic`;
CREATE TABLE `bbs_topic` (
  `TID` int(11) NOT NULL COMMENT 'ID标识',
  `SID` int(11) NOT NULL COMMENT '板块分类',
  `TTitle` varchar(300) DEFAULT NULL COMMENT '标题',
  `TContent` varchar(4000) DEFAULT NULL COMMENT '内容',
  `UID` int(11) DEFAULT NULL COMMENT '用户ID',
  `TCreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  `TSupportCount` int(11) DEFAULT NULL COMMENT '点赞数',
  PRIMARY KEY (`TID`),
  KEY `UID` (`UID`),
  CONSTRAINT `bbs_topic_ibfk_1` FOREIGN KEY (`UID`) REFERENCES `bbs_user` (`UID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bbs_topicstate
-- ----------------------------
DROP TABLE IF EXISTS `bbs_topicstate`;
CREATE TABLE `bbs_topicstate` (
  `TStateTypeID` int(11) NOT NULL,
  `TID` int(11) NOT NULL,
  `SortOrder` int(11) DEFAULT NULL,
  `StateCreate` datetime DEFAULT NULL,
  PRIMARY KEY (`TStateTypeID`),
  KEY `TID` (`TID`),
  CONSTRAINT `bbs_topicstate_ibfk_1` FOREIGN KEY (`TID`) REFERENCES `bbs_topic` (`TID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bbs_user
-- ----------------------------
DROP TABLE IF EXISTS `bbs_user`;
CREATE TABLE `bbs_user` (
  `UID` int(11) NOT NULL,
  `UName` varchar(100) NOT NULL,
  `UPassword` varchar(1000) NOT NULL,
  `UEmail` varchar(100) DEFAULT NULL,
  `UTopicCount` int(11) DEFAULT NULL,
  `UReplyCount` int(11) DEFAULT NULL,
  `UCreateTime` datetime DEFAULT NULL,
  `UserProfilePicture` varchar(1000) NOT NULL,
  `SName` varchar(1000) DEFAULT NULL,
  `TName` varchar(1000) DEFAULT NULL,
  `RName` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bbs_userpower
-- ----------------------------
DROP TABLE IF EXISTS `bbs_userpower`;
CREATE TABLE `bbs_userpower` (
  `UserTypeID` int(11) NOT NULL,
  `UserTypeName` varchar(20) NOT NULL,
  `UID` int(11) NOT NULL,
  PRIMARY KEY (`UserTypeID`),
  KEY `fk_UID` (`UID`),
  CONSTRAINT `fk_UID` FOREIGN KEY (`UID`) REFERENCES `bbs_user` (`UID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
