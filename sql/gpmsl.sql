/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 8.0.32 : Database - gpms
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`gpms` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `gpms`;

/*Table structure for table `basic_department` */

DROP TABLE IF EXISTS `basic_department`;

CREATE TABLE `basic_department` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint NOT NULL COMMENT '父id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '部门名称',
  `leader` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '负责人',
  `phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '联系电话',
  `enabled` tinyint(1) NOT NULL COMMENT '是否启用',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '修改人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `basic_department` */

insert  into `basic_department`(`id`,`parent_id`,`name`,`leader`,`phone`,`enabled`,`create_time`,`update_time`,`create_by`,`update_by`) values 
(1,0,'董事会','yongoe','10086',1,'2023-01-01 00:00:00','2023-01-01 00:00:00','yongoe','yongoe'),
(2,1,'销售部门','yongoe','10086',1,'2023-01-01 00:00:00','2023-01-01 00:00:00','yongoe','yongoe'),
(3,1,'研发部门','yongoe','10086',1,'2023-01-01 00:00:00','2023-01-01 00:00:00','yongoe','yongoe'),
(4,1,'行政部门','yongoe','10086',1,'2023-01-01 00:00:00','2023-01-01 00:00:00','yongoe','yongoe');

/*Table structure for table `basic_dict` */

DROP TABLE IF EXISTS `basic_dict`;

CREATE TABLE `basic_dict` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '字典名称',
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '字典类型',
  `remark` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '修改人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `basic_dict` */

insert  into `basic_dict`(`id`,`name`,`type`,`remark`,`create_time`,`update_time`,`create_by`,`update_by`) values 
(1,'技术',NULL,NULL,'2024-04-15 15:08:03','2024-04-15 15:08:03','yongoe','yongoe'),
(2,'启动方式',NULL,NULL,'2024-04-15 15:59:40','2024-04-15 15:59:40','yongoe','yongoe');

/*Table structure for table `basic_dict_data` */

DROP TABLE IF EXISTS `basic_dict_data`;

CREATE TABLE `basic_dict_data` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `dict_id` bigint NOT NULL COMMENT '字典id',
  `dict_key` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '字典键',
  `dict_value` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '字典值',
  `color` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '颜色',
  `sort` int NOT NULL COMMENT '字典顺序',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '修改人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `basic_dict_data` */

insert  into `basic_dict_data`(`id`,`dict_id`,`dict_key`,`dict_value`,`color`,`sort`,`create_time`,`update_time`,`create_by`,`update_by`) values 
(1,1,'springboot2','1','rgba(255, 69, 0, 1)',10,'2024-04-15 15:08:26','2024-04-16 14:33:54','yongoe','yongoe'),
(2,1,'vue2','3','rgba(255, 215, 0, 1)',8,'2024-04-15 15:08:35','2024-04-16 14:34:00','yongoe','yongoe'),
(3,1,'vue3','4','rgba(144, 238, 144, 1)',7,'2024-04-15 15:08:42','2024-04-16 14:34:04','yongoe','yongoe'),
(4,1,'springmvc','5','rgba(0, 206, 209, 1)',0,'2024-04-15 15:08:49','2024-04-16 14:34:07','yongoe','yongoe'),
(5,1,'jsp','6','rgba(30, 144, 255, 1)',0,'2024-04-15 15:08:56','2024-04-16 14:34:10','yongoe','yongoe'),
(6,1,'html','7','rgba(255, 69, 0, 0.68)',0,'2024-04-15 15:09:05','2024-04-16 14:34:13','yongoe','yongoe'),
(7,1,'springboot3','2','rgba(255, 140, 0, 1)',9,'2024-04-15 15:22:50','2024-04-16 14:33:57','yongoe','yongoe'),
(8,2,'Springboot','1','rgba(30, 144, 255, 1)',0,'2024-04-15 15:59:49','2024-04-16 14:51:20','yongoe','yongoe'),
(9,2,'Tomcat','2','rgba(30, 144, 255, 1)',0,'2024-04-15 16:00:04','2024-04-16 14:50:42','yongoe','yongoe'),
(10,2,'Node','3','rgba(30, 144, 255, 1)',0,'2024-04-15 16:00:14','2024-04-16 14:50:47','yongoe','yongoe'),
(11,2,'无','4','rgba(30, 144, 255, 1)',0,'2024-04-15 16:00:25','2024-04-16 14:34:29','yongoe','yongoe');

/*Table structure for table `basic_letter` */

DROP TABLE IF EXISTS `basic_letter`;

CREATE TABLE `basic_letter` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `addresser_id` bigint NOT NULL COMMENT '发件人id',
  `addresser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '发件人',
  `addressee_id` bigint NOT NULL COMMENT '收件人id',
  `addressee` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '收件人',
  `title` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标题',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '内容',
  `state` tinyint(1) NOT NULL COMMENT '状态',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '修改人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `basic_letter` */

/*Table structure for table `basic_position` */

DROP TABLE IF EXISTS `basic_position`;

CREATE TABLE `basic_position` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '职位',
  `enabled` tinyint(1) NOT NULL COMMENT '是否启用',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '修改人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `basic_position` */

insert  into `basic_position`(`id`,`name`,`enabled`,`create_time`,`update_time`,`create_by`,`update_by`) values 
(1,'首席执行官(CEO)',1,'2023-01-01 00:00:00','2023-01-01 00:00:00','yongoe','yongoe'),
(2,'首席财务官(CFO)',1,'2023-01-01 00:00:00','2023-01-01 00:00:00','yongoe','yongoe'),
(3,'首席运营官(COO)',1,'2023-01-01 00:00:00','2023-01-01 00:00:00','yongoe','yongoe'),
(4,'首席技术官(CTO)',1,'2023-01-01 00:00:00','2023-01-01 00:00:00','yongoe','yongoe');

/*Table structure for table `sys_config` */

DROP TABLE IF EXISTS `sys_config`;

CREATE TABLE `sys_config` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `config_key` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '键',
  `config_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '值',
  `remark` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '修改人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`config_key`) COMMENT 'key'
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `sys_config` */

/*Table structure for table `sys_log` */

DROP TABLE IF EXISTS `sys_log`;

CREATE TABLE `sys_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户',
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '类型',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '标题',
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '详情',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '修改人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=178 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `sys_log` */

/*Table structure for table `sys_menu` */

DROP TABLE IF EXISTS `sys_menu`;

CREATE TABLE `sys_menu` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint NOT NULL COMMENT '父id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '菜单名',
  `type` int NOT NULL COMMENT '类型',
  `url` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '接口路径',
  `component` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '组件位置',
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '图标',
  `sort` int NOT NULL COMMENT '顺序',
  `keep_alive` tinyint(1) NOT NULL COMMENT '是否缓存',
  `is_show` tinyint(1) NOT NULL COMMENT '是否显示',
  `enabled` tinyint(1) NOT NULL COMMENT '是否启用',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '修改人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `sys_menu` */

insert  into `sys_menu`(`id`,`parent_id`,`name`,`type`,`url`,`component`,`icon`,`sort`,`keep_alive`,`is_show`,`enabled`,`create_time`,`update_time`,`create_by`,`update_by`) values 
(1,0,'系统管理',1,'','','fa fa-cog',0,0,1,1,'2023-01-01 00:00:00','2023-01-01 00:00:00','yongoe','yongoe'),
(2,0,'基础信息',1,'','','fa fa-table',0,0,1,1,'2023-01-01 00:00:00','2023-01-01 00:00:00','yongoe','yongoe'),
(3,1,'用户管理',2,'/system/user/**','/system/User','',0,0,1,1,'2023-01-01 00:00:00','2023-01-01 00:00:00','yongoe','yongoe'),
(4,1,'角色管理',2,'/system/role/**','/system/Role','',0,0,1,1,'2023-01-01 00:00:00','2023-01-01 00:00:00','yongoe','yongoe'),
(5,1,'菜单管理',2,'/system/menu/**','/system/Menu','',0,0,1,1,'2023-01-01 00:00:00','2023-01-01 00:00:00','yongoe','yongoe'),
(6,1,'系统配置',2,'/system/config/**','/system/Config','',0,0,1,1,'2023-01-01 00:00:00','2023-01-01 00:00:00','yongoe','yongoe'),
(7,2,'部门',2,'/basic/department/**','/basic/Department','',0,0,1,1,'2023-01-01 00:00:00','2023-01-01 00:00:00','yongoe','yongoe'),
(8,2,'职位',2,'/basic/position/**','/basic/Position','',0,0,1,1,'2023-01-01 00:00:00','2023-01-01 00:00:00','yongoe','yongoe'),
(9,2,'数据字典',2,'/basic/dict/**','/basic/Dict','',0,0,1,1,'2023-01-01 00:00:00','2023-01-01 00:00:00','yongoe','yongoe'),
(10,2,'数据字典-数据',2,'/basic/dict/data/**','/basic/DictData','',0,0,0,1,'2023-01-01 00:00:00','2023-01-01 00:00:00','yongoe','yongoe'),
(11,1,'系统日志',2,'/system/log/**','/system/Log','',0,0,1,1,'2023-09-19 05:51:08','2023-09-19 05:51:08','yongoe','yongoe'),
(100,0,'项目管理',2,'','/gpms/Project','fa fa-internet-explorer',5,0,1,1,'2024-04-15 07:04:11','2024-04-16 10:38:22','yongoe','yongoe'),
(102,100,'增',3,'/gpms/project/add','','',0,0,1,1,'2024-04-15 07:04:11','2024-04-15 07:04:11','yongoe','yongoe'),
(103,100,'改',3,'/gpms/project/update','','',0,0,1,1,'2024-04-15 07:04:11','2024-04-15 07:04:11','yongoe','yongoe'),
(104,100,'删',3,'/gpms/project/delete/*','','',0,0,1,1,'2024-04-15 07:04:11','2024-04-15 07:04:11','yongoe','yongoe'),
(105,0,'详情',2,NULL,'/gpms/Details','el-icon-folder-opened',2,0,0,1,'2024-04-16 10:06:08','2024-04-16 10:38:27','yongoe','yongoe');

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色代码',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '中文名',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '修改人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `sys_role` */

insert  into `sys_role`(`id`,`code`,`name`,`create_time`,`update_time`,`create_by`,`update_by`) values 
(1,'admin','超级管理员','2023-01-01 00:00:00','2023-01-01 00:00:00','yongoe','yongoe'),
(2,'register','新用户','2023-01-01 00:00:00','2023-01-01 00:00:00','yongoe','yongoe');

/*Table structure for table `sys_role_menu` */

DROP TABLE IF EXISTS `sys_role_menu`;

CREATE TABLE `sys_role_menu` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint NOT NULL COMMENT '角色id',
  `menu_id` bigint NOT NULL COMMENT '菜单id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '修改人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `sys_role_menu` */

insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`,`create_time`,`update_time`,`create_by`,`update_by`) values 
(1,2,100,'2024-04-16 11:29:45','2024-04-16 11:29:45','yongoe','yongoe'),
(2,2,105,'2024-04-16 11:29:45','2024-04-16 11:29:45','yongoe','yongoe');

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `department_id` bigint DEFAULT NULL COMMENT '部门id',
  `position_id` bigint DEFAULT NULL COMMENT '职位id',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '账号',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '姓名',
  `avatar` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '头像',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '邮箱',
  `phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '联系电话',
  `remark` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `last_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '上次登录ip',
  `last_time` datetime DEFAULT NULL COMMENT '上次登录时间',
  `enabled` tinyint(1) NOT NULL COMMENT '是否启用',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '修改人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) COMMENT '用户名唯一'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `sys_user` */

insert  into `sys_user`(`id`,`department_id`,`position_id`,`username`,`password`,`name`,`avatar`,`email`,`phone`,`remark`,`last_ip`,`last_time`,`enabled`,`create_time`,`update_time`,`create_by`,`update_by`) values 
(1,1,1,'admin','111111','yongoe','/','121887765@qq.com','10086','无','127.0.0.1','2024-04-16 16:52:57',1,'2023-01-01 00:00:00','2024-04-16 16:52:57','yongoe','yongoe'),
(2,NULL,NULL,'anonymous','anonymous','匿名','/','12345@qq.com','12345',NULL,'127.0.0.1','2024-04-16 11:30:16',1,'2024-04-16 11:29:34','2024-04-16 11:30:16','yongoe','匿名');

/*Table structure for table `sys_user_auths` */

DROP TABLE IF EXISTS `sys_user_auths`;

CREATE TABLE `sys_user_auths` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL COMMENT '用户id',
  `login_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '登陆类型',
  `openid` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标识',
  `access_token` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '凭据',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '修改人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `sys_user_auths` */

/*Table structure for table `sys_user_role` */

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL COMMENT '用户id',
  `role_id` bigint NOT NULL COMMENT '角色id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '修改人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `sys_user_role` */

insert  into `sys_user_role`(`id`,`user_id`,`role_id`,`create_time`,`update_time`,`create_by`,`update_by`) values 
(1,1,1,'2023-01-01 00:00:00','2023-01-01 00:00:00','yongoe','yongoe'),
(2,2,2,'2024-04-16 11:29:34','2024-04-16 11:29:34','yongoe','yongoe');

/*Table structure for table `t_project` */

DROP TABLE IF EXISTS `t_project`;

CREATE TABLE `t_project` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '项目名',
  `project_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '项目代码',
  `run_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '启动方式',
  `technology` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '技术',
  `details` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '详情',
  `img` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'img',
  `state` tinyint(1) DEFAULT NULL COMMENT '运行状态',
  `login` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '账号密码',
  `url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '访问地址',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '修改人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`project_code`) COMMENT 'code'
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `t_project` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
