/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 50721
 Source Host           : localhost:3306
 Source Schema         : zyzx_cy

 Target Server Type    : MySQL
 Target Server Version : 50721
 File Encoding         : 65001

 Date: 29/03/2020 17:20:42
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_bidding
-- ----------------------------
DROP TABLE IF EXISTS `t_bidding`;
CREATE TABLE `t_bidding` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `computer_mac` varchar(30) NOT NULL,
  `machine_mac` varchar(30) NOT NULL,
  `machine_sn` varchar(60) NOT NULL,
  `s_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1-启用;2-禁用',
  `create_time` timestamp NULL DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE_COMPUTER_MACH` (`computer_mac`,`machine_sn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='1-启用; 2-禁用';

-- ----------------------------
-- Table structure for t_computer
-- ----------------------------
DROP TABLE IF EXISTS `t_computer`;
CREATE TABLE `t_computer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `mac` varchar(30) NOT NULL,
  `remark` varchar(100) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE_MAC` (`mac`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_machine
-- ----------------------------
DROP TABLE IF EXISTS `t_machine`;
CREATE TABLE `t_machine` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `mac` varchar(30) DEFAULT NULL,
  `sn` varchar(60) NOT NULL,
  `name` varchar(60) NOT NULL,
  `remark` varchar(100) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT NULL,
  `udate_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE_SN` (`sn`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_user_info
-- ----------------------------
DROP TABLE IF EXISTS `t_user_info`;
CREATE TABLE `t_user_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `busi_code` varchar(30) NOT NULL COMMENT '业务编码:COMPARE_RESULT_RETURN',
  `source_code` varchar(8) NOT NULL COMMENT '请求接入源',
  `target_code` varchar(8) NOT NULL COMMENT '落地接入源',
  `version` varchar(20) NOT NULL COMMENT '报文版本:默认1.0',
  `card_id` varchar(50) DEFAULT NULL COMMENT '身份证编号:H1/R2/P2才支持，需申 请 ',
  `id_no` varchar(30) DEFAULT NULL COMMENT '身份证号码',
  `id_doc_name` varchar(60) DEFAULT NULL COMMENT '身份证姓名',
  `id_doc_addr` varchar(255) DEFAULT NULL COMMENT '身份证地址',
  `gen_cd` varchar(4) DEFAULT NULL COMMENT '性别:男/女',
  `ethnic_nm` varchar(30) DEFAULT NULL COMMENT '民族',
  `birth_date` varchar(15) DEFAULT NULL COMMENT '出生日期',
  `sgnisu_brnch_nm` varchar(255) DEFAULT NULL COMMENT '签发机构',
  `cred_eff_date` varchar(15) DEFAULT NULL COMMENT '证件生效日期',
  `credInvld_date` varchar(15) DEFAULT NULL COMMENT '证件过期日期',
  `result_type` varchar(2) DEFAULT NULL COMMENT '比对结果\n0不一致，1一致 \n组件类型为1.标准组 件,2.自动查验组件,3. 无证查验组件时，必传 ',
  `detail_reason` varchar(30) DEFAULT NULL COMMENT '比对结果描述',
  `sn` varchar(60) DEFAULT NULL COMMENT '设备编号',
  `user_nm` varchar(30) DEFAULT NULL COMMENT '登录账号',
  `transaction_id` varchar(60) DEFAULT NULL COMMENT '客户流水号',
  `swft_no` varchar(60) DEFAULT NULL COMMENT '在线流水号',
  `component_type` varchar(2) DEFAULT NULL COMMENT '组件类型\n枚举类型: \n1.标准组件 (onceCompare); 2.自动查验组件 (compare); 3.无证查验组件 (noIdCardCompare) ; \n4.识读身份证组件 (readIdCard) ',
  `type` varchar(2) DEFAULT NULL COMMENT '证件类型\n00:大陆居民身份证 16:港澳居民居住证 17:台湾居民居住证 ',
  `pass_number` varchar(60) DEFAULT NULL COMMENT '通行证号码',
  `number_of_issue` varchar(10) DEFAULT NULL COMMENT '签发次数',
  `foreigner_name` varchar(100) DEFAULT NULL COMMENT '外国人姓名',
  `valid_status` tinyint(2) DEFAULT NULL COMMENT '是否已验证:1-待验证; 2已验证; 3-验证异常; 4: HIS未请求',
  `create_time` timestamp NULL DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS = 1;
