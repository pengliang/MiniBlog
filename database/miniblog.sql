-- phpMyAdmin SQL Dump
-- version 3.1.3.1
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2009 年 07 月 29 日 06:43
-- 服务器版本: 5.1.33
-- PHP 版本: 5.2.9

SET FOREIGN_KEY_CHECKS=0;

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

SET AUTOCOMMIT=0;
START TRANSACTION;

--
-- 数据库: `miniblog`
--

-- --------------------------------------------------------

--
-- 表的结构 `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dirname` varchar(20) COLLATE utf8_general_ci NOT NULL,
  `text` varchar(100) CHARACTER SET utf8 NOT NULL,
  `userId` bigint(20) NOT NULL,
  `date` int(20) DEFAULT NULL,
  `type` varchar(20) CHARACTER SET utf8 NOT NULL,
  `desc` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) TYPE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `comment`
--

DROP TABLE IF EXISTS `comment`;
CREATE TABLE IF NOT EXISTS `comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) NOT NULL,
  `email` varchar(50) COLLATE utf8_general_ci NOT NULL,
  `entryId` bigint(20) NOT NULL,
  `message` text COLLATE utf8_general_ci NOT NULL,
  `date` int(11) NOT NULL,
  `ip` varchar(20) COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) TYPE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `entry`
--

DROP TABLE IF EXISTS `entry`;
CREATE TABLE IF NOT EXISTS `entry` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8_general_ci NOT NULL,
  `content` text COLLATE utf8_general_ci NOT NULL,
  `date` int(11) NOT NULL,
  `authorId` bigint(20) NOT NULL,
  `authorName` varchar(20) COLLATE utf8_general_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `categoryId` bigint(20) NOT NULL,
  `ip` varchar(20) COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) TYPE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `entry_tag`
--

DROP TABLE IF EXISTS `entry_tag`;
CREATE TABLE IF NOT EXISTS `entry_tag` (
  `entryId` bigint(20) NOT NULL,
  `tagId` bigint(20) NOT NULL,
  UNIQUE KEY `entryId` (`entryId`,`tagId`)
) TYPE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- 表的结构 `locations`
--

DROP TABLE IF EXISTS `locations`;
CREATE TABLE IF NOT EXISTS `locations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_general_ci DEFAULT NULL,
  `lat` float(15,11) NOT NULL,
  `lng` float(15,11) NOT NULL,
  `userId` bigint(20) NOT NULL,
  `categoryId` bigint(20) DEFAULT NULL,
  `categoryName` varchar(100) COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
)TYPE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `photo`
--

DROP TABLE IF EXISTS `photo`;
CREATE TABLE IF NOT EXISTS `photo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_general_ci NOT NULL,
  `date` int(11) NOT NULL,
  `physical` text COLLATE utf8_general_ci NOT NULL,
  `categoryId` bigint(20) NOT NULL,
  `userId` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) TYPE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tag`
--

DROP TABLE IF EXISTS `tag`;
CREATE TABLE IF NOT EXISTS `tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `text` varchar(10) COLLATE utf8_general_ci NOT NULL,
  `userId` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) TYPE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `userinfo`
--

DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE IF NOT EXISTS `userinfo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(20) COLLATE utf8_general_ci NOT NULL,
  `user_pwd` varchar(20) COLLATE utf8_general_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_general_ci NOT NULL,
  `gender` tinyint(4) NOT NULL,
  `address` varchar(100) COLLATE utf8_general_ci DEFAULT NULL,
  `realname` varchar(50) COLLATE utf8_general_ci DEFAULT NULL,
  `birthday` int(11) DEFAULT NULL,
  `reg_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`user_name`,`email`)
) TYPE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci AUTO_INCREMENT=1 ;

SET FOREIGN_KEY_CHECKS=1;

COMMIT;
