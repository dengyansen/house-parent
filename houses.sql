/*
Navicat MySQL Data Transfer

Source Server         : dev开发练习
Source Server Version : 50731
Source Host           : 111.231.108.113:3306
Source Database       : houses

Target Server Type    : MYSQL
Target Server Version : 50731
File Encoding         : 65001

Date: 2020-09-23 23:55:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for agency
-- ----------------------------
DROP TABLE IF EXISTS `agency`;
CREATE TABLE `agency` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '经纪机构名称',
  `address` varchar(255) NOT NULL COMMENT '地址',
  `phone` varchar(20) NOT NULL DEFAULT '' COMMENT '手机',
  `email` varchar(25) NOT NULL DEFAULT '',
  `about_us` varchar(100) NOT NULL DEFAULT '' COMMENT '描述',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '电话',
  `web_site` varchar(20) NOT NULL DEFAULT '' COMMENT '网站',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='经纪机构表';

-- ----------------------------
-- Table structure for blog
-- ----------------------------
DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tags` varchar(20) NOT NULL DEFAULT '' COMMENT '标签',
  `content` text NOT NULL COMMENT '内容',
  `create_time` datetime NOT NULL DEFAULT '2020-09-22 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `cat` int(11) NOT NULL DEFAULT '0' COMMENT '分类',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='博客表';

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) NOT NULL DEFAULT '' COMMENT '评论内容',
  `house_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '房屋id',
  `create_time` datetime NOT NULL DEFAULT '2020-09-22 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `blog_id` int(11) NOT NULL DEFAULT '0' COMMENT '博客id',
  `type` tinyint(4) NOT NULL DEFAULT '0',
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评论表';

-- ----------------------------
-- Table structure for community
-- ----------------------------
DROP TABLE IF EXISTS `community`;
CREATE TABLE `community` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `city_code` varchar(11) NOT NULL DEFAULT '' COMMENT '城市编码',
  `city_name` varchar(11) NOT NULL DEFAULT '' COMMENT '城市名称',
  `name` varchar(11) NOT NULL DEFAULT '' COMMENT '小区名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='小区表';

-- ----------------------------
-- Table structure for house
-- ----------------------------
DROP TABLE IF EXISTS `house`;
CREATE TABLE `house` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `name` varchar(20) NOT NULL DEFAULT '',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1-销售 2-出租',
  `price` int(11) NOT NULL DEFAULT '0' COMMENT '单位元，价格',
  `images` varchar(1024) NOT NULL DEFAULT '' COMMENT '房屋图片',
  `area` int(11) NOT NULL DEFAULT '0' COMMENT '面积',
  `beds` int(11) NOT NULL DEFAULT '0' COMMENT '卧室的数量',
  `baths` int(11) NOT NULL DEFAULT '0' COMMENT '卫生间的数量',
  `rating` double NOT NULL DEFAULT '0' COMMENT '评分',
  `remarks` varchar(512) NOT NULL COMMENT '房产的描述',
  `properties` varchar(255) NOT NULL DEFAULT '0' COMMENT '房产属性',
  `floor_plan` varchar(255) NOT NULL COMMENT '户型图',
  `tags` varchar(255) NOT NULL DEFAULT '0' COMMENT '标签',
  `create_time` datetime NOT NULL DEFAULT '2020-09-22 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `city_id` int(11) NOT NULL DEFAULT '0' COMMENT '城市id',
  `community_id` int(11) NOT NULL DEFAULT '0' COMMENT '校区id',
  `address` varchar(255) NOT NULL,
  `state` tinyint(1) NOT NULL COMMENT '1上架 2 下架',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='房产表';

-- ----------------------------
-- Table structure for house_msg
-- ----------------------------
DROP TABLE IF EXISTS `house_msg`;
CREATE TABLE `house_msg` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `msg` varchar(255) NOT NULL DEFAULT '' COMMENT '消息',
  `create_time` datetime NOT NULL DEFAULT '2020-09-22 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `agent_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '经纪人id',
  `house_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '房屋id',
  `user_name` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '用户名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='房产信息表';

-- ----------------------------
-- Table structure for house_user
-- ----------------------------
DROP TABLE IF EXISTS `house_user`;
CREATE TABLE `house_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `house_id` int(11) NOT NULL DEFAULT '0' COMMENT '房屋id',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `create_time` datetime NOT NULL DEFAULT '2020-09-22 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1售卖 2收藏',
  PRIMARY KEY (`id`),
  UNIQUE KEY `houseid_user_id` (`house_id`,`user_id`,`type`) USING BTREE COMMENT '房产用户表'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='房产信息表';

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(25) NOT NULL DEFAULT '' COMMENT '姓名',
  `phone` varchar(13) NOT NULL,
  `email` varchar(50) NOT NULL DEFAULT '' COMMENT '电子邮箱',
  `aboutme` varchar(255) NOT NULL DEFAULT '' COMMENT '自我介绍',
  `passwd` varchar(255) NOT NULL DEFAULT '' COMMENT '通过md5加密的密码',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '头像图片',
  `type` varchar(255) NOT NULL DEFAULT '0' COMMENT '1 普通用户 2经纪人',
  `create_time` datetime NOT NULL DEFAULT '2020-09-22 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `enable` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1 启用 0 停用',
  `agency_id` int(11) NOT NULL DEFAULT '0' COMMENT '所属经纪机构',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
