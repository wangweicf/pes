-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.7.14-log


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema ehdb
--

CREATE DATABASE IF NOT EXISTS ehdb;
USE ehdb;

--
-- Definition of table `attract_point`
--

DROP TABLE IF EXISTS `attract_point`;
CREATE TABLE `attract_point` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL COMMENT '编号',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='亮点';

--
-- Dumping data for table `attract_point`
--

/*!40000 ALTER TABLE `attract_point` DISABLE KEYS */;
/*!40000 ALTER TABLE `attract_point` ENABLE KEYS */;


--
-- Definition of table `cat_event`
--

DROP TABLE IF EXISTS `cat_event`;
CREATE TABLE `cat_event` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL COMMENT '内容',
  `action_date` datetime NOT NULL COMMENT '报警时间',
  `status` varchar(45) NOT NULL COMMENT '状态',
  `event_type` varchar(45) NOT NULL COMMENT '时间类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cat_event`
--

/*!40000 ALTER TABLE `cat_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `cat_event` ENABLE KEYS */;


--
-- Definition of table `company`
--

DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `display_name` varchar(255) DEFAULT NULL COMMENT '公司名称',
  `user_name` varchar(255) DEFAULT NULL COMMENT '名称',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `staff_scope` int(11) DEFAULT NULL COMMENT '人员规模',
  `biz_catalog` varchar(255) DEFAULT NULL COMMENT '商业类型',
  `address` varchar(255) DEFAULT NULL COMMENT '公司注册地址',
  `institutional_investor` varchar(255) DEFAULT NULL COMMENT '投资机构',
  `dc` varchar(255) DEFAULT NULL COMMENT '公司描述',
  `is_verified` varchar(255) DEFAULT NULL COMMENT '是否审核通过',
  `verified_time` datetime DEFAULT NULL COMMENT '审核时间',
  `is_newer` varchar(255) DEFAULT NULL COMMENT '是否新用户',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `tel` varchar(255) DEFAULT NULL COMMENT '电话',
  `mail` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `logo_url` varchar(255) DEFAULT NULL COMMENT 'logo图片地址',
  `discount` varchar(255) DEFAULT NULL COMMENT '付费比例',
  `remark` varchar(255) DEFAULT NULL COMMENT '标注',
  `is_valid` varchar(255) DEFAULT NULL COMMENT '是否可用',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_username` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='雇主';

--
-- Dumping data for table `company`
--

/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` (`id`,`display_name`,`user_name`,`password`,`staff_scope`,`biz_catalog`,`address`,`institutional_investor`,`dc`,`is_verified`,`verified_time`,`is_newer`,`created_at`,`tel`,`mail`,`logo_url`,`discount`,`remark`,`is_valid`) VALUES 
 (1,'雇主','admin','admin',3000,'1','上海南京路','1','投资旅游公司','1','2017-09-09 00:00:00','1',NULL,'13774236428','911172595@qq.com',NULL,NULL,'test','1');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;


--
-- Definition of table `company_account`
--

DROP TABLE IF EXISTS `company_account`;
CREATE TABLE `company_account` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL COMMENT '公司id',
  `amount` decimal(8,2) DEFAULT NULL COMMENT '总金额',
  `avaliable_amount` decimal(8,2) DEFAULT NULL COMMENT '可用余额',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `is_valid` varchar(255) DEFAULT NULL COMMENT '是否可用',
  `account_type` varchar(255) DEFAULT NULL COMMENT '账户类型',
  `version` varchar(255) DEFAULT NULL COMMENT '版本',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_company_at` (`company_id`,`account_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公司资金账户';

--
-- Dumping data for table `company_account`
--

/*!40000 ALTER TABLE `company_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `company_account` ENABLE KEYS */;


--
-- Definition of table `company_account_transaction`
--

DROP TABLE IF EXISTS `company_account_transaction`;
CREATE TABLE `company_account_transaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) unsigned DEFAULT NULL COMMENT '公司id',
  `series_number` varchar(255) DEFAULT NULL COMMENT '序列号',
  `direction` varchar(255) DEFAULT NULL COMMENT '资金方向',
  `amount` decimal(8,2) DEFAULT NULL COMMENT '资金金额',
  `pre_amount` decimal(8,2) DEFAULT NULL COMMENT '前置资金金额',
  `post_amount` decimal(8,2) DEFAULT NULL COMMENT '后置资金金额',
  `action_date` datetime DEFAULT NULL COMMENT '时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `account_type` varchar(255) DEFAULT NULL COMMENT '账户类型',
  `account_id` int(11) DEFAULT NULL COMMENT '账户id',
  `biz_type` varchar(255) DEFAULT NULL COMMENT '业务类型',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_sn` (`series_number`),
  KEY `Index_company` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `company_account_transaction`
--

/*!40000 ALTER TABLE `company_account_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `company_account_transaction` ENABLE KEYS */;


--
-- Definition of table `company_address`
--

DROP TABLE IF EXISTS `company_address`;
CREATE TABLE `company_address` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `is_default` int(1) unsigned DEFAULT NULL COMMENT '是否默认',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `company_id` int(11) DEFAULT NULL COMMENT '公司id',
  PRIMARY KEY (`id`),
  KEY `Index_company` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公司地址';

--
-- Dumping data for table `company_address`
--

/*!40000 ALTER TABLE `company_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `company_address` ENABLE KEYS */;


--
-- Definition of table `company_manager`
--

DROP TABLE IF EXISTS `company_manager`;
CREATE TABLE `company_manager` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL COMMENT '公司id',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `title` varchar(255) DEFAULT NULL COMMENT '职位',
  `dc` varchar(255) DEFAULT NULL COMMENT '描述',
  `is_header` varchar(255) DEFAULT NULL COMMENT '是否header',
  `pic_url` varchar(255) DEFAULT NULL COMMENT '图片地址',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `Index_company` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公司管理者';

--
-- Dumping data for table `company_manager`
--

/*!40000 ALTER TABLE `company_manager` DISABLE KEYS */;
/*!40000 ALTER TABLE `company_manager` ENABLE KEYS */;


--
-- Definition of table `company_qualification`
--

DROP TABLE IF EXISTS `company_qualification`;
CREATE TABLE `company_qualification` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `pic_url` varchar(255) DEFAULT NULL COMMENT '图片地址',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `company_id` int(11) DEFAULT NULL COMMENT '公司id',
  PRIMARY KEY (`id`),
  KEY `Index_company` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公司取得证书';

--
-- Dumping data for table `company_qualification`
--

/*!40000 ALTER TABLE `company_qualification` DISABLE KEYS */;
/*!40000 ALTER TABLE `company_qualification` ENABLE KEYS */;


--
-- Definition of table `company_statistics`
--

DROP TABLE IF EXISTS `company_statistics`;
CREATE TABLE `company_statistics` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL COMMENT '公司id',
  `jd_count` int(11) DEFAULT NULL COMMENT '共发布jd个数',
  `candidate_count` int(11) DEFAULT NULL COMMENT '入职人个数',
  `offer_count` int(11) DEFAULT NULL COMMENT '发出offer个数',
  `paid_amount` decimal(8,2) DEFAULT NULL COMMENT '已付资金汇总',
  `version` varchar(255) DEFAULT NULL COMMENT '版本',
  `charge_amount` decimal(8,2) DEFAULT NULL COMMENT '共充值金额',
  PRIMARY KEY (`id`),
  KEY `Index_company` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公司汇总';

--
-- Dumping data for table `company_statistics`
--

/*!40000 ALTER TABLE `company_statistics` DISABLE KEYS */;
/*!40000 ALTER TABLE `company_statistics` ENABLE KEYS */;


--
-- Definition of table `hunter`
--

DROP TABLE IF EXISTS `hunter`;
CREATE TABLE `hunter` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `hunter_company_id` int(11) unsigned DEFAULT NULL COMMENT '公司名称',
  `user_name` varchar(255) DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `sex` varchar(255) DEFAULT NULL COMMENT '性别',
  `identification_card` varchar(255) DEFAULT NULL COMMENT '身份证',
  `age` int(11) DEFAULT NULL,
  `workyear` int(11) unsigned DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `is_verified` varchar(255) DEFAULT NULL COMMENT '是否审核通过',
  `verified_time` datetime DEFAULT NULL COMMENT '审核时间',
  `remar` varchar(255) DEFAULT NULL COMMENT '标注',
  `is_valid` varchar(255) DEFAULT NULL COMMENT '是否可用',
  `is_newer` varchar(255) DEFAULT NULL COMMENT '是否新用户',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `tel` varchar(255) DEFAULT NULL COMMENT '电话',
  `mail` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `pic_url` varchar(255) DEFAULT NULL COMMENT '图片地址',
  `login_time` datetime DEFAULT NULL COMMENT '最近一次登录时间',
  `star_level` varchar(255) DEFAULT NULL COMMENT '积分层级',
  `active_level` varchar(255) DEFAULT NULL COMMENT '活跃度',
  `status` varchar(255) DEFAULT NULL COMMENT '在职状态',
  `display_name` varchar(255) DEFAULT NULL COMMENT '名字',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_username` (`user_name`),
  KEY `Index_hc` (`hunter_company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='猎头';

--
-- Dumping data for table `hunter`
--

/*!40000 ALTER TABLE `hunter` DISABLE KEYS */;
/*!40000 ALTER TABLE `hunter` ENABLE KEYS */;


--
-- Definition of table `hunter_company`
--

DROP TABLE IF EXISTS `hunter_company`;
CREATE TABLE `hunter_company` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `display_name` varchar(255) DEFAULT NULL COMMENT '公司名称',
  `user_name` varchar(255) DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `dc` varchar(255) DEFAULT NULL COMMENT '公司描述',
  `is_verified` varchar(255) DEFAULT NULL COMMENT '是否审核通过',
  `verified_time` datetime DEFAULT NULL COMMENT '审核时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '标注',
  `is_valid` varchar(255) DEFAULT NULL COMMENT '是否可用',
  `is_newer` varchar(255) DEFAULT NULL COMMENT '是否新用户',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `tel` varchar(255) DEFAULT NULL COMMENT '电话',
  `mail` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `logo_url` varchar(255) DEFAULT NULL COMMENT 'logo图片地址',
  `is_qualification_complete` varchar(255) DEFAULT NULL COMMENT '三证合一',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_username` (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='猎企';

--
-- Dumping data for table `hunter_company`
--

/*!40000 ALTER TABLE `hunter_company` DISABLE KEYS */;
/*!40000 ALTER TABLE `hunter_company` ENABLE KEYS */;


--
-- Definition of table `hunter_company_qualification`
--

DROP TABLE IF EXISTS `hunter_company_qualification`;
CREATE TABLE `hunter_company_qualification` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `pic_url` varchar(255) DEFAULT NULL COMMENT '图片地址',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `hunter_company_id` int(11) DEFAULT NULL COMMENT '公司id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公司取得证书';

--
-- Dumping data for table `hunter_company_qualification`
--

/*!40000 ALTER TABLE `hunter_company_qualification` DISABLE KEYS */;
/*!40000 ALTER TABLE `hunter_company_qualification` ENABLE KEYS */;


--
-- Definition of table `hunter_statistics`
--

DROP TABLE IF EXISTS `hunter_statistics`;
CREATE TABLE `hunter_statistics` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `hunter_id` int(11) DEFAULT NULL COMMENT '猎头id',
  `dispatch_count` int(11) DEFAULT NULL COMMENT '被分配次数',
  `onsite_rate` decimal(8,2) DEFAULT NULL COMMENT '面试率',
  `offered_rate` decimal(8,2) DEFAULT NULL COMMENT '成功率',
  `recommend_count` int(11) DEFAULT NULL COMMENT '推荐简历次数',
  `version` varchar(255) DEFAULT NULL COMMENT '版本',
  PRIMARY KEY (`id`),
  KEY `Index_hunter` (`hunter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='猎头基本信息汇总';

--
-- Dumping data for table `hunter_statistics`
--

/*!40000 ALTER TABLE `hunter_statistics` DISABLE KEYS */;
/*!40000 ALTER TABLE `hunter_statistics` ENABLE KEYS */;


--
-- Definition of table `industry_function`
--

DROP TABLE IF EXISTS `industry_function`;
CREATE TABLE `industry_function` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `code` varchar(255) DEFAULT NULL COMMENT '编号',
  `is_valid` varchar(255) DEFAULT NULL COMMENT '是否可用',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `type` varchar(255) DEFAULT NULL COMMENT '类型',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='行业职能';

--
-- Dumping data for table `industry_function`
--

/*!40000 ALTER TABLE `industry_function` DISABLE KEYS */;
/*!40000 ALTER TABLE `industry_function` ENABLE KEYS */;


--
-- Definition of table `jd`
--

DROP TABLE IF EXISTS `jd`;
CREATE TABLE `jd` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL COMMENT '公司id',
  `name` varchar(255) DEFAULT NULL COMMENT '职位名称',
  `open_desc` varchar(255) DEFAULT NULL COMMENT '开放说明',
  `min_salary` int(11) DEFAULT NULL COMMENT '年薪最低',
  `max_salary` int(11) DEFAULT NULL COMMENT '年薪最高',
  `required_count` int(11) DEFAULT NULL COMMENT '招聘人数',
  `subordinates_count` int(11) DEFAULT NULL COMMENT '下级人数',
  `department` varchar(255) DEFAULT NULL COMMENT '部门',
  `chief` varchar(255) DEFAULT NULL COMMENT '上级',
  `province_code` varchar(45) DEFAULT NULL COMMENT '省份',
  `city_code` varchar(255) DEFAULT NULL COMMENT '城市',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `dc` varchar(255) DEFAULT NULL COMMENT '描述',
  `required_desc` varchar(255) DEFAULT NULL COMMENT '任职要求',
  `educational_limit` varchar(45) DEFAULT NULL COMMENT '教育要求',
  `workyear_limit` varchar(255) DEFAULT NULL COMMENT '工龄要求',
  `age_limit` varchar(255) DEFAULT NULL COMMENT '年龄要求',
  `sex_limit` varchar(255) DEFAULT NULL COMMENT '性别要求',
  `language_limit` varchar(255) DEFAULT NULL COMMENT '语言要求',
  `certificate_limit` varchar(255) DEFAULT NULL COMMENT '证书要求',
  `onsite_ops` varchar(255) DEFAULT NULL COMMENT '面试ops',
  `onsite_desc` varchar(255) DEFAULT NULL COMMENT '面试描述',
  `onsite_remote_support` varchar(255) DEFAULT NULL COMMENT '是否支持远程面试',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `publish_at` datetime DEFAULT NULL COMMENT '发布时间',
  `status` varchar(255) DEFAULT NULL COMMENT '状态（生效、下架）',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `code` varchar(255) DEFAULT NULL,
  `open_at` datetime DEFAULT NULL COMMENT '开放时间',
  `st_fee` decimal(8,2) DEFAULT NULL COMMENT '总服务费',
  `advanced_st_fee` decimal(8,2) DEFAULT NULL COMMENT '预收服务费',
  `deduction_st_fee` decimal(8,2) DEFAULT NULL COMMENT '抵扣服务费',
  `urgency` varchar(45) DEFAULT NULL COMMENT '紧急度',
  PRIMARY KEY (`id`),
  KEY `Index_company_status` (`company_id`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jd`
--

/*!40000 ALTER TABLE `jd` DISABLE KEYS */;
/*!40000 ALTER TABLE `jd` ENABLE KEYS */;


--
-- Definition of table `jd_attract_point`
--

DROP TABLE IF EXISTS `jd_attract_point`;
CREATE TABLE `jd_attract_point` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `jd_id` int(11) DEFAULT NULL,
  `attract_point_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  PRIMARY KEY (`id`),
  KEY `Index_jd` (`jd_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='简历亮点';

--
-- Dumping data for table `jd_attract_point`
--

/*!40000 ALTER TABLE `jd_attract_point` DISABLE KEYS */;
/*!40000 ALTER TABLE `jd_attract_point` ENABLE KEYS */;


--
-- Definition of table `jd_industry_relation`
--

DROP TABLE IF EXISTS `jd_industry_relation`;
CREATE TABLE `jd_industry_relation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `jd_id` int(11) DEFAULT NULL,
  `industry_function_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `type` varchar(255) DEFAULT NULL COMMENT '类型',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  PRIMARY KEY (`id`),
  KEY `Index_jd` (`jd_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jd_industry_relation`
--

/*!40000 ALTER TABLE `jd_industry_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `jd_industry_relation` ENABLE KEYS */;


--
-- Definition of table `jd_statistics`
--

DROP TABLE IF EXISTS `jd_statistics`;
CREATE TABLE `jd_statistics` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `jd_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL COMMENT '公司id',
  `required_count` int(11) DEFAULT NULL COMMENT '招聘人数',
  `offer_count` int(11) DEFAULT NULL COMMENT '发出offer个数',
  `onbord_count` int(11) DEFAULT NULL COMMENT '实际入职人数',
  `version` varchar(255) DEFAULT NULL COMMENT '版本',
  `recommend_record_count` int(11) DEFAULT NULL COMMENT '收到推荐个数',
  `onsite_count` int(11) DEFAULT NULL COMMENT '参加面试人数',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_jd` (`jd_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='jd基本信息汇总';

--
-- Dumping data for table `jd_statistics`
--

/*!40000 ALTER TABLE `jd_statistics` DISABLE KEYS */;
/*!40000 ALTER TABLE `jd_statistics` ENABLE KEYS */;


--
-- Definition of table `message_record`
--

DROP TABLE IF EXISTS `message_record`;
CREATE TABLE `message_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content` varchar(255) NOT NULL COMMENT '内容',
  `tel` varchar(45) NOT NULL COMMENT '电话号码',
  `message_type` varchar(45) NOT NULL COMMENT '短信类型',
  `user_id` int(11) DEFAULT NULL COMMENT '接收人账号id',
  `user_type` varchar(45) DEFAULT NULL COMMENT '接收人类型',
  `remark` varchar(255) DEFAULT NULL COMMENT '标注',
  `action_date` datetime NOT NULL COMMENT '发送时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='发送的短信记录';

--
-- Dumping data for table `message_record`
--

/*!40000 ALTER TABLE `message_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `message_record` ENABLE KEYS */;


--
-- Definition of table `message_strategy`
--

DROP TABLE IF EXISTS `message_strategy`;
CREATE TABLE `message_strategy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `limit_date` varchar(45) NOT NULL COMMENT '日期',
  `total_count` int(11) NOT NULL COMMENT '当天可发送总条数',
  `sended_count` int(11) NOT NULL COMMENT '当天已发送条数',
  `message_type` varchar(45) NOT NULL COMMENT '短信类型',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_limit` (`limit_date`,`message_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='短信发送疲劳策略';

--
-- Dumping data for table `message_strategy`
--

/*!40000 ALTER TABLE `message_strategy` DISABLE KEYS */;
/*!40000 ALTER TABLE `message_strategy` ENABLE KEYS */;


--
-- Definition of table `onsite_record`
--

DROP TABLE IF EXISTS `onsite_record`;
CREATE TABLE `onsite_record` (
  `hunter_company_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '猎企id',
  `hunter_id` int(11) DEFAULT NULL COMMENT '猎头id',
  `company_id` int(11) DEFAULT NULL COMMENT '雇主id',
  `jd_id` int(11) DEFAULT NULL,
  `recommend_record_id` int(11) DEFAULT NULL COMMENT '推荐记录id',
  `status` varchar(255) DEFAULT NULL COMMENT '状态',
  `remark` varchar(255) DEFAULT NULL COMMENT '标注',
  `step` varchar(255) DEFAULT NULL COMMENT '进度',
  `action_date` datetime DEFAULT NULL COMMENT '发生时间',
  `offer_amount` decimal(8,2) DEFAULT NULL COMMENT 'offer金额',
  `offer_amount_unit` decimal(8,2) DEFAULT NULL COMMENT 'offer单位',
  `onsite_type` varchar(45) DEFAULT NULL COMMENT '面试类型',
  PRIMARY KEY (`hunter_company_id`),
  KEY `Index_rr` (`recommend_record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='面试记录';

--
-- Dumping data for table `onsite_record`
--

/*!40000 ALTER TABLE `onsite_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `onsite_record` ENABLE KEYS */;


--
-- Definition of table `perference_city`
--

DROP TABLE IF EXISTS `perference_city`;
CREATE TABLE `perference_city` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `hunter_id` int(11) DEFAULT NULL,
  `city_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_hunter` (`hunter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `perference_city`
--

/*!40000 ALTER TABLE `perference_city` DISABLE KEYS */;
/*!40000 ALTER TABLE `perference_city` ENABLE KEYS */;


--
-- Definition of table `perference_jd_industry_function`
--

DROP TABLE IF EXISTS `perference_jd_industry_function`;
CREATE TABLE `perference_jd_industry_function` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `hunter_id` int(11) unsigned DEFAULT NULL,
  `jd_industry_function_id` int(11) unsigned DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_hunter` (`hunter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `perference_jd_industry_function`
--

/*!40000 ALTER TABLE `perference_jd_industry_function` DISABLE KEYS */;
/*!40000 ALTER TABLE `perference_jd_industry_function` ENABLE KEYS */;


--
-- Definition of table `pt_account`
--

DROP TABLE IF EXISTS `pt_account`;
CREATE TABLE `pt_account` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `amount` decimal(8,2) DEFAULT NULL COMMENT '总金额',
  `is_valid` varchar(255) DEFAULT NULL COMMENT '是否可用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资金账户';

--
-- Dumping data for table `pt_account`
--

/*!40000 ALTER TABLE `pt_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `pt_account` ENABLE KEYS */;


--
-- Definition of table `pt_account_transaction`
--

DROP TABLE IF EXISTS `pt_account_transaction`;
CREATE TABLE `pt_account_transaction` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pt_account_id` int(11) unsigned DEFAULT NULL COMMENT '公司id',
  `series_number` varchar(255) DEFAULT NULL COMMENT '序列号',
  `direction` varchar(255) DEFAULT NULL COMMENT '资金方向',
  `amount` decimal(8,2) DEFAULT NULL COMMENT '资金金额',
  `pre_amount` decimal(8,2) DEFAULT NULL COMMENT '前置资金金额',
  `post_amount` decimal(8,2) DEFAULT NULL COMMENT '后置资金金额',
  `action_date` datetime DEFAULT NULL COMMENT '时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `biz_type` varchar(255) DEFAULT NULL COMMENT '业务类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pt_account_transaction`
--

/*!40000 ALTER TABLE `pt_account_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `pt_account_transaction` ENABLE KEYS */;


--
-- Definition of table `pt_admin`
--

DROP TABLE IF EXISTS `pt_admin`;
CREATE TABLE `pt_admin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `display_name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `is_valid` varchar(255) DEFAULT NULL COMMENT '是否可用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='平台管理用户';

--
-- Dumping data for table `pt_admin`
--

/*!40000 ALTER TABLE `pt_admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `pt_admin` ENABLE KEYS */;


--
-- Definition of table `pt_collection_plan`
--

DROP TABLE IF EXISTS `pt_collection_plan`;
CREATE TABLE `pt_collection_plan` (
  `hunter_company_id` int(11) unsigned DEFAULT NULL COMMENT '猎企id',
  `hunter_id` int(11) DEFAULT NULL COMMENT '猎头id',
  `company_id` int(11) DEFAULT NULL COMMENT '雇主id',
  `jd_id` int(11) DEFAULT NULL,
  `recommend_record_id` int(11) DEFAULT NULL COMMENT '推荐记录id',
  `status` varchar(255) DEFAULT NULL COMMENT '支付状态',
  `remark` varchar(255) DEFAULT NULL COMMENT '标注',
  `version` varchar(255) DEFAULT NULL COMMENT '版本',
  `expected_date` datetime DEFAULT NULL COMMENT '预计收款时间',
  `amount` decimal(8,2) DEFAULT NULL COMMENT '总待收金额',
  `collected_amount` decimal(8,2) DEFAULT NULL COMMENT '已收金额',
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收款计划';

--
-- Dumping data for table `pt_collection_plan`
--

/*!40000 ALTER TABLE `pt_collection_plan` DISABLE KEYS */;
/*!40000 ALTER TABLE `pt_collection_plan` ENABLE KEYS */;


--
-- Definition of table `pt_collection_record`
--

DROP TABLE IF EXISTS `pt_collection_record`;
CREATE TABLE `pt_collection_record` (
  `hunter_company_id` int(11) unsigned DEFAULT NULL COMMENT '猎企id',
  `hunter_id` int(11) DEFAULT NULL COMMENT '猎头id',
  `company_id` int(11) DEFAULT NULL COMMENT '雇主id',
  `jd_id` int(11) DEFAULT NULL,
  `recommend_record_id` int(11) DEFAULT NULL COMMENT '推荐记录id',
  `collection_plan_id` int(11) DEFAULT NULL COMMENT '收款计划id',
  `remark` varchar(255) DEFAULT NULL COMMENT '标注',
  `collected_date` datetime DEFAULT NULL COMMENT '收款时间',
  `collected_amount` decimal(8,2) DEFAULT NULL COMMENT '已支付金额',
  `series_number` varchar(255) DEFAULT NULL COMMENT '资金序列号',
  `status` varchar(255) DEFAULT NULL COMMENT '已收',
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='已收记录';

--
-- Dumping data for table `pt_collection_record`
--

/*!40000 ALTER TABLE `pt_collection_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `pt_collection_record` ENABLE KEYS */;


--
-- Definition of table `pt_repayment_plan`
--

DROP TABLE IF EXISTS `pt_repayment_plan`;
CREATE TABLE `pt_repayment_plan` (
  `hunter_company_id` int(11) unsigned DEFAULT NULL COMMENT '猎企id',
  `hunter_id` int(11) DEFAULT NULL COMMENT '猎头id',
  `company_id` int(11) DEFAULT NULL COMMENT '雇主id',
  `jd_id` int(11) DEFAULT NULL,
  `recommend_record_id` int(11) DEFAULT NULL COMMENT '推荐记录id',
  `status` varchar(255) DEFAULT NULL COMMENT '支付状态',
  `remark` varchar(255) DEFAULT NULL COMMENT '标注',
  `version` varchar(255) DEFAULT NULL COMMENT '版本',
  `expected_date` datetime DEFAULT NULL COMMENT '预计支付时间',
  `amount` decimal(8,2) DEFAULT NULL COMMENT '总需要支付金额',
  `paid_amount` decimal(8,2) DEFAULT NULL COMMENT '已支付金额',
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='支付计划';

--
-- Dumping data for table `pt_repayment_plan`
--

/*!40000 ALTER TABLE `pt_repayment_plan` DISABLE KEYS */;
/*!40000 ALTER TABLE `pt_repayment_plan` ENABLE KEYS */;


--
-- Definition of table `pt_repayment_record`
--

DROP TABLE IF EXISTS `pt_repayment_record`;
CREATE TABLE `pt_repayment_record` (
  `hunter_company_id` int(11) unsigned DEFAULT NULL COMMENT '猎企id',
  `hunter_id` int(11) unsigned DEFAULT NULL COMMENT '猎头id',
  `company_id` int(11) unsigned DEFAULT NULL COMMENT '雇主id',
  `jd_id` int(11) unsigned DEFAULT NULL,
  `recommend_record_id` int(11) unsigned DEFAULT NULL COMMENT '推荐记录id',
  `repayment_plan_id` int(11) unsigned DEFAULT NULL COMMENT '支付计划id',
  `remark` varchar(255) DEFAULT NULL COMMENT '标注',
  `paid_date` datetime DEFAULT NULL COMMENT '支付时间',
  `paid_amount` decimal(8,2) DEFAULT NULL COMMENT '已支付金额',
  `series_number` varchar(255) DEFAULT NULL COMMENT '支付序列号',
  `status` varchar(255) DEFAULT NULL COMMENT '已支付||已开票',
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='支付记录';

--
-- Dumping data for table `pt_repayment_record`
--

/*!40000 ALTER TABLE `pt_repayment_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `pt_repayment_record` ENABLE KEYS */;


--
-- Definition of table `recommend_attract_point`
--

DROP TABLE IF EXISTS `recommend_attract_point`;
CREATE TABLE `recommend_attract_point` (
  `id` int(11) unsigned NOT NULL,
  `recommend_record_id` int(11) DEFAULT NULL,
  `attract_point_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='推荐亮点';

--
-- Dumping data for table `recommend_attract_point`
--

/*!40000 ALTER TABLE `recommend_attract_point` DISABLE KEYS */;
/*!40000 ALTER TABLE `recommend_attract_point` ENABLE KEYS */;


--
-- Definition of table `recommend_record`
--

DROP TABLE IF EXISTS `recommend_record`;
CREATE TABLE `recommend_record` (
  `hunter_company_id` int(11) unsigned DEFAULT NULL COMMENT '猎企id',
  `hunter_id` int(11) DEFAULT NULL COMMENT '猎头id',
  `company_id` int(11) DEFAULT NULL COMMENT '雇主id',
  `jd_id` int(11) DEFAULT NULL,
  `candidate_name` varchar(255) DEFAULT NULL COMMENT '职位名称',
  `expect_salary` int(11) DEFAULT NULL COMMENT '期望薪资',
  `age` int(11) DEFAULT NULL COMMENT '年龄',
  `educational` varchar(255) DEFAULT NULL COMMENT '学历',
  `company_name` varchar(255) DEFAULT NULL COMMENT '所在公司',
  `tel` varchar(255) DEFAULT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL COMMENT '候选人职位名称',
  `department` varchar(255) DEFAULT NULL COMMENT '候选人部门',
  `CV_url` varchar(255) DEFAULT NULL COMMENT '简历地址',
  `CV_location_type` varchar(255) DEFAULT NULL COMMENT '简历存放类型（本地internet）',
  `recommend_desc` varchar(255) DEFAULT NULL COMMENT '推荐描述',
  `workyear` int(11) DEFAULT NULL COMMENT '候选人工龄',
  `status` varchar(255) DEFAULT NULL COMMENT '状态\r\n(已推荐面试中\\不合适已发offer入职)',
  `remark` varchar(255) DEFAULT NULL COMMENT '标注',
  `paid_status` varchar(45) DEFAULT NULL COMMENT '雇主是否支付过佣金',
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='推荐记录';

--
-- Dumping data for table `recommend_record`
--

/*!40000 ALTER TABLE `recommend_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `recommend_record` ENABLE KEYS */;


--
-- Definition of table `repayment_plan`
--

DROP TABLE IF EXISTS `repayment_plan`;
CREATE TABLE `repayment_plan` (
  `hunter_company_id` int(11) unsigned DEFAULT NULL COMMENT '猎企id',
  `hunter_id` int(11) DEFAULT NULL COMMENT '猎头id',
  `company_id` int(11) DEFAULT NULL COMMENT '雇主id',
  `jd_id` int(11) DEFAULT NULL,
  `recommend_record_id` int(11) DEFAULT NULL COMMENT '推荐记录id',
  `status` varchar(255) DEFAULT NULL COMMENT '支付状态',
  `remark` varchar(255) DEFAULT NULL COMMENT '标注',
  `version` varchar(255) DEFAULT NULL COMMENT '版本',
  `expected_date` datetime DEFAULT NULL COMMENT '预计支付时间',
  `amount` decimal(8,2) DEFAULT NULL COMMENT '总需要支付金额',
  `paid_amount` decimal(8,2) DEFAULT NULL COMMENT '已支付金额',
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='支付计划';

--
-- Dumping data for table `repayment_plan`
--

/*!40000 ALTER TABLE `repayment_plan` DISABLE KEYS */;
/*!40000 ALTER TABLE `repayment_plan` ENABLE KEYS */;


--
-- Definition of table `repayment_record`
--

DROP TABLE IF EXISTS `repayment_record`;
CREATE TABLE `repayment_record` (
  `hunter_company_id` int(11) unsigned DEFAULT NULL COMMENT '猎企id',
  `hunter_id` int(11) DEFAULT NULL COMMENT '猎头id',
  `company_id` int(11) DEFAULT NULL COMMENT '雇主id',
  `jd_id` int(11) DEFAULT NULL,
  `recommend_record_id` int(11) DEFAULT NULL COMMENT '推荐记录id',
  `repayment_plan_id` int(11) DEFAULT NULL COMMENT '支付计划id',
  `remark` varchar(255) DEFAULT NULL COMMENT '标注',
  `paid_date` datetime DEFAULT NULL COMMENT '支付时间',
  `paid_amount` decimal(8,2) DEFAULT NULL COMMENT '已支付金额',
  `series_number` varchar(255) DEFAULT NULL COMMENT '支付序列号',
  `status` varchar(255) DEFAULT NULL COMMENT '已支付||已开票',
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='支付记录';

--
-- Dumping data for table `repayment_record`
--

/*!40000 ALTER TABLE `repayment_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `repayment_record` ENABLE KEYS */;


--
-- Definition of table `trace_log`
--

DROP TABLE IF EXISTS `trace_log`;
CREATE TABLE `trace_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `action_type` varchar(45) NOT NULL COMMENT '操作类型',
  `action_date` datetime NOT NULL COMMENT '发生时间',
  `user_id` int(11) DEFAULT NULL COMMENT '接收人账号id',
  `user_type` varchar(45) DEFAULT NULL COMMENT '接收人账号类型(平台|猎头|雇主|猎企)',
  `content` varchar(4255) DEFAULT NULL COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='操作日志';

--
-- Dumping data for table `trace_log`
--

/*!40000 ALTER TABLE `trace_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `trace_log` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
