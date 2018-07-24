﻿# Host: localhost  (Version: 5.5.53)
# Date: 2018-07-25 00:16:12
# Generator: MySQL-Front 5.3  (Build 4.234)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "blog_admin_app"
#

DROP TABLE IF EXISTS `blog_admin_app`;
CREATE TABLE `blog_admin_app` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `app_id` varchar(50) NOT NULL DEFAULT '' COMMENT '应用id',
  `app_secret` varchar(50) NOT NULL DEFAULT '' COMMENT '应用密码',
  `app_name` varchar(50) NOT NULL DEFAULT '' COMMENT '应用名称',
  `app_status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '应用状态：0表示禁用，1表示启用',
  `app_info` tinytext COMMENT '应用说明',
  `app_api` text COMMENT '当前应用允许请求的全部API接口',
  `app_group` varchar(128) NOT NULL DEFAULT 'default' COMMENT '当前应用所属的应用组唯一标识',
  `app_addTime` int(11) NOT NULL DEFAULT '0' COMMENT '应用创建时间',
  `app_api_show` text COMMENT '前台样式显示所需数据格式',
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_id` (`app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='appId和appSecret表';

#
# Data for table "blog_admin_app"
#


#
# Structure for table "blog_admin_app_group"
#

DROP TABLE IF EXISTS `blog_admin_app_group`;
CREATE TABLE `blog_admin_app_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL DEFAULT '' COMMENT '组名称',
  `description` text COMMENT '组说明',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '组状态',
  `hash` varchar(128) NOT NULL DEFAULT '' COMMENT '组标识',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='应用组，目前只做管理使用，没有实际权限控制';

#
# Data for table "blog_admin_app_group"
#


#
# Structure for table "blog_admin_auth_group"
#

DROP TABLE IF EXISTS `blog_admin_auth_group`;
CREATE TABLE `blog_admin_auth_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '组名称',
  `description` varchar(50) DEFAULT '' COMMENT '组描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '组状态：为1正常，为0禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='权限组';

#
# Data for table "blog_admin_auth_group"
#


#
# Structure for table "blog_admin_auth_group_access"
#

DROP TABLE IF EXISTS `blog_admin_auth_group_access`;
CREATE TABLE `blog_admin_auth_group_access` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL,
  `groupId` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户和组的对应关系';

#
# Data for table "blog_admin_auth_group_access"
#


#
# Structure for table "blog_admin_auth_rule"
#

DROP TABLE IF EXISTS `blog_admin_auth_rule`;
CREATE TABLE `blog_admin_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `url` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一标识',
  `groupId` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '权限所属组的ID',
  `auth` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '权限数值',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态：为1正常，为0禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='权限细节';

#
# Data for table "blog_admin_auth_rule"
#


#
# Structure for table "blog_admin_fields"
#

DROP TABLE IF EXISTS `blog_admin_fields`;
CREATE TABLE `blog_admin_fields` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fieldName` varchar(50) NOT NULL DEFAULT '' COMMENT '字段名称',
  `hash` varchar(50) NOT NULL DEFAULT '' COMMENT '对应接口的唯一标识',
  `dataType` tinyint(2) NOT NULL DEFAULT '0' COMMENT '数据类型，来源于DataType类库',
  `default` varchar(500) NOT NULL DEFAULT '' COMMENT '默认值',
  `isMust` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否必须 0为不必须，1为必须',
  `range` varchar(500) NOT NULL DEFAULT '' COMMENT '范围，Json字符串，根据数据类型有不一样的含义',
  `info` varchar(500) NOT NULL DEFAULT '' COMMENT '字段说明',
  `type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '字段用处：0为request，1为response',
  `showName` varchar(50) NOT NULL DEFAULT '' COMMENT 'wiki显示用字段',
  PRIMARY KEY (`id`),
  KEY `hash` (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用于保存各个API的字段规则';

#
# Data for table "blog_admin_fields"
#


#
# Structure for table "blog_admin_group"
#

DROP TABLE IF EXISTS `blog_admin_group`;
CREATE TABLE `blog_admin_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL DEFAULT '' COMMENT '组名称',
  `description` text COMMENT '组说明',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '组状态',
  `hash` varchar(64) NOT NULL DEFAULT '' COMMENT '组唯一标识',
  `addTime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updateTime` int(11) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `image` varchar(256) DEFAULT NULL COMMENT '分组封面图',
  `hot` int(11) NOT NULL DEFAULT '0' COMMENT '分组热度',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='接口组管理';

#
# Data for table "blog_admin_group"
#

INSERT INTO `blog_admin_group` VALUES (1,'默认分组','默认分组',1,'default',0,0,'',0);

#
# Structure for table "blog_admin_list"
#

DROP TABLE IF EXISTS `blog_admin_list`;
CREATE TABLE `blog_admin_list` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `apiClass` varchar(50) NOT NULL DEFAULT '' COMMENT 'api索引，保存了类和方法',
  `hash` varchar(50) NOT NULL DEFAULT '' COMMENT 'api唯一标识',
  `accessToken` tinyint(2) NOT NULL DEFAULT '1' COMMENT '是否需要认证AccessToken 1：需要，0：不需要',
  `needLogin` tinyint(2) NOT NULL DEFAULT '1' COMMENT '是否需要认证用户token  1：需要 0：不需要',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT 'API状态：0表示禁用，1表示启用',
  `method` tinyint(2) NOT NULL DEFAULT '2' COMMENT '请求方式0：不限1：Post，2：Get',
  `info` varchar(500) DEFAULT '' COMMENT 'api中文说明',
  `isTest` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否是测试模式：0:生产模式，1：测试模式',
  `returnStr` text COMMENT '返回数据示例',
  `groupHash` varchar(64) NOT NULL DEFAULT 'default' COMMENT '当前接口所属的接口分组',
  PRIMARY KEY (`id`),
  UNIQUE KEY `hash` (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用于维护接口信息';

#
# Data for table "blog_admin_list"
#


#
# Structure for table "blog_admin_menu"
#

DROP TABLE IF EXISTS `blog_admin_menu`;
CREATE TABLE `blog_admin_menu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '菜单名',
  `fid` int(11) NOT NULL COMMENT '父级菜单ID',
  `url` varchar(50) NOT NULL DEFAULT '' COMMENT '链接',
  `auth` tinyint(2) NOT NULL DEFAULT '0' COMMENT '访客权限',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `hide` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否显示',
  `icon` varchar(50) NOT NULL DEFAULT '' COMMENT '菜单图标',
  `level` tinyint(2) NOT NULL DEFAULT '0' COMMENT '菜单认证等级',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COMMENT='目录信息';

#
# Data for table "blog_admin_menu"
#

INSERT INTO `blog_admin_menu` VALUES (1,'用户登录',0,'admin/Login/index',0,0,0,'',0),(2,'用户登出',0,'admin/Login/logout',0,0,0,'',0),(3,'系统管理',0,'',0,1,0,'',0),(4,'菜单维护',3,'',0,1,0,'',0),(5,'菜单状态修改',4,'admin/Menu/changeStatus',0,0,0,'',0),(6,'新增菜单',4,'admin/Menu/add',0,0,0,'',0),(7,'编辑菜单',4,'admin/Menu/edit',0,0,0,'',0),(8,'菜单删除',4,'admin/Menu/del',0,0,0,'',0),(9,'用户管理',3,'',0,2,0,'',0),(10,'获取当前组的全部用户',9,'admin/User/getUsers',0,0,0,'',0),(11,'用户状态修改',9,'admin/User/changeStatus',0,0,0,'',0),(12,'新增用户',9,'admin/User/add',0,0,0,'',0),(13,'用户编辑',9,'admin/User/edit',0,0,0,'',0),(14,'用户删除',9,'admin/User/del',0,0,0,'',0),(15,'权限管理',3,'',0,3,0,'',0),(16,'权限组状态编辑',15,'admin/Auth/changeStatus',0,0,0,'',0),(17,'从指定组中删除指定用户',15,'admin/Auth/delMember',0,0,0,'',0),(18,'新增权限组',15,'admin/Auth/add',0,0,0,'',0),(19,'权限组编辑',15,'admin/Auth/edit',0,0,0,'',0),(20,'删除权限组',15,'admin/Auth/del',0,0,0,'',0),(21,'获取全部已开放的可选组',15,'admin/Auth/getGroups',0,0,0,'',0),(22,'获取组所有的权限列表',15,'admin/Auth/getRuleList',0,0,0,'',0),(23,'应用接入',0,'',0,2,0,'',0),(24,'应用管理',23,'',0,0,0,'',0),(25,'应用状态编辑',24,'admin/App/changeStatus',0,0,0,'',0),(26,'获取AppId,AppSecret,接口列表,应用接口权限细节',24,'admin/App/getAppInfo',0,0,0,'',0),(27,'新增应用',24,'admin/App/add',0,0,0,'',0),(28,'编辑应用',24,'admin/App/edit',0,0,0,'',0),(29,'删除应用',24,'admin/App/del',0,0,0,'',0),(30,'接口管理',0,'',0,3,0,'',0),(31,'接口维护',30,'',0,0,0,'',0),(32,'接口状态编辑',31,'admin/InterfaceList/changeStatus',0,0,0,'',0),(33,'获取接口唯一标识',31,'admin/InterfaceList/getHash',0,0,0,'',0),(34,'添加接口',31,'admin/InterfaceList/add',0,0,0,'',0),(35,'编辑接口',31,'admin/InterfaceList/edit',0,0,0,'',0),(36,'删除接口',31,'admin/InterfaceList/del',0,0,0,'',0),(37,'获取接口请求字段',31,'admin/Fields/request',0,0,0,'',0),(38,'获取接口返回字段',31,'admin/Fields/response',0,0,0,'',0),(39,'添加接口字段',31,'admin/Fields/add',0,0,0,'',0),(40,'上传接口返回字段',31,'admin/Fields/upload',0,0,0,'',0),(41,'编辑接口字段',31,'admin/Fields/edit',0,0,0,'',0),(42,'删除接口字段',31,'admin/Fields/del',0,0,0,'',0),(43,'接口分组',30,'',0,1,0,'',0),(44,'添加接口组',43,'admin/InterfaceGroup/add',0,0,0,'',0),(45,'编辑接口组',43,'admin/InterfaceGroup/edit',0,0,0,'',0),(46,'删除接口组',43,'admin/InterfaceGroup/del',0,0,0,'',0),(47,'获取全部有效的接口组',43,'admin/InterfaceGroup/getAll',0,0,0,'',0),(48,'接口组状态维护',43,'admin/InterfaceGroup/changeStatus',0,0,0,'',0),(49,'应用分组',23,'',0,1,0,'',0),(50,'添加应用组',49,'admin/AppGroup/add',0,0,0,'',0),(51,'编辑应用组',49,'admin/AppGroup/edit',0,0,0,'',0),(52,'删除应用组',49,'admin/AppGroup/del',0,0,0,'',0),(53,'获取全部可用应用组',49,'admin/AppGroup/getAll',0,0,0,'',0),(54,'应用组状态编辑',49,'admin/AppGroup/changeStatus',0,0,0,'',0),(55,'菜单列表',4,'admin/Menu/index',0,0,0,'',0),(56,'用户列表',9,'admin/User/index',0,0,0,'',0),(57,'权限列表',15,'admin/Auth/index',0,0,0,'',0),(58,'应用列表',24,'admin/App/index',0,0,0,'',0),(59,'应用分组列表',49,'admin/AppGroup/index',0,0,0,'',0),(60,'接口列表',31,'admin/InterfaceList/index',0,0,0,'',0),(61,'接口分组列表',43,'admin/InterfaceGroup/index',0,0,0,'',0),(62,'日志管理',3,'',0,4,0,'',0),(63,'获取操作日志列表',62,'admin/Log/index',0,0,0,'',0),(64,'删除单条日志记录',62,'admin/Log/del',0,0,0,'',0),(65,'刷新路由',31,'admin/InterfaceList/refresh',0,0,0,'',0),(67,'文件上传',0,'admin/Index/upload',0,0,0,'',0),(68,'更新个人信息',9,'admin/User/own',0,0,0,'',0),(69,'刷新AppSecret',24,'admin/App/refreshAppSecret',0,0,0,'',0);

#
# Structure for table "blog_admin_user"
#

DROP TABLE IF EXISTS `blog_admin_user`;
CREATE TABLE `blog_admin_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(64) NOT NULL DEFAULT '' COMMENT '用户昵称',
  `password` char(32) NOT NULL DEFAULT '' COMMENT '用户密码',
  `regTime` int(10) NOT NULL DEFAULT '0' COMMENT '注册时间',
  `regIp` bigint(11) NOT NULL COMMENT '注册IP',
  `updateTime` int(10) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '账号状态 0封号 1正常',
  `openId` varchar(100) DEFAULT NULL COMMENT '三方登录唯一ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='管理员认证信息';

#
# Data for table "blog_admin_user"
#

INSERT INTO `blog_admin_user` VALUES (1,'root','root','912601e4ad1b308c9ae41877cf6ca754',1519453594,3663623043,1524152828,1,NULL);

#
# Structure for table "blog_admin_user_action"
#

DROP TABLE IF EXISTS `blog_admin_user_action`;
CREATE TABLE `blog_admin_user_action` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `actionName` varchar(50) NOT NULL DEFAULT '' COMMENT '行为名称',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '操作用户ID',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '用户昵称',
  `addTime` int(11) NOT NULL DEFAULT '0' COMMENT '操作时间',
  `data` text COMMENT '用户提交的数据',
  `url` varchar(200) NOT NULL DEFAULT '' COMMENT '操作URL',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COMMENT='用户操作日志';

#
# Data for table "blog_admin_user_action"
#

INSERT INTO `blog_admin_user_action` VALUES (1,'菜单列表',1,'root',1532366802,'[]','admin/Menu/index'),(2,'用户列表',1,'root',1532366805,'{\"page\":\"1\",\"size\":\"10\",\"type\":\"\",\"keywords\":\"\",\"status\":\"\"}','admin/User/index'),(3,'菜单列表',1,'root',1532366806,'[]','admin/Menu/index'),(4,'用户列表',1,'root',1532366808,'{\"page\":\"1\",\"size\":\"10\",\"type\":\"\",\"keywords\":\"\",\"status\":\"\"}','admin/User/index'),(5,'权限列表',1,'root',1532366811,'{\"page\":\"1\",\"size\":\"10\",\"keywords\":\"\",\"status\":\"\"}','admin/Auth/index'),(6,'获取操作日志列表',1,'root',1532366812,'{\"page\":\"1\",\"size\":\"10\",\"type\":\"\",\"keywords\":\"\"}','admin/Log/index'),(7,'应用分组列表',1,'root',1532366816,'{\"page\":\"1\",\"size\":\"10\",\"type\":\"\",\"keywords\":\"\",\"status\":\"\"}','admin/AppGroup/index'),(8,'应用列表',1,'root',1532366817,'{\"page\":\"1\",\"size\":\"10\",\"type\":\"\",\"keywords\":\"\",\"status\":\"\"}','admin/App/index'),(9,'接口分组列表',1,'root',1532366820,'{\"page\":\"1\",\"size\":\"10\",\"type\":\"\",\"keywords\":\"\",\"status\":\"\"}','admin/InterfaceGroup/index'),(10,'接口列表',1,'root',1532366821,'{\"page\":\"1\",\"size\":\"10\",\"type\":\"\",\"keywords\":\"\",\"status\":\"\"}','admin/InterfaceList/index'),(11,'获取全部有效的接口组',1,'root',1532366821,'[]','admin/InterfaceGroup/getAll'),(12,'获取全部有效的接口组',1,'root',1532366823,'[]','admin/InterfaceGroup/getAll'),(13,'获取接口唯一标识',1,'root',1532366826,'[]','admin/InterfaceList/getHash'),(14,'菜单列表',1,'root',1532366842,'[]','admin/Menu/index'),(15,'应用分组列表',1,'root',1532366845,'{\"page\":\"1\",\"size\":\"10\",\"type\":\"\",\"keywords\":\"\",\"status\":\"\"}','admin/AppGroup/index'),(16,'应用列表',1,'root',1532366846,'{\"page\":\"1\",\"size\":\"10\",\"type\":\"\",\"keywords\":\"\",\"status\":\"\"}','admin/App/index'),(17,'菜单列表',1,'root',1532366847,'[]','admin/Menu/index'),(18,'用户列表',1,'root',1532366857,'{\"page\":\"1\",\"size\":\"10\",\"type\":\"\",\"keywords\":\"\",\"status\":\"\"}','admin/User/index'),(19,'权限列表',1,'root',1532366859,'{\"page\":\"1\",\"size\":\"10\",\"keywords\":\"\",\"status\":\"\"}','admin/Auth/index'),(20,'获取操作日志列表',1,'root',1532366860,'{\"page\":\"1\",\"size\":\"10\",\"type\":\"\",\"keywords\":\"\"}','admin/Log/index'),(21,'获取全部可用应用组',1,'root',1532366864,'[]','admin/AppGroup/getAll'),(22,'获取AppId,AppSecret,接口列表,应用接口权限细节',1,'root',1532366864,'[]','admin/App/getAppInfo'),(23,'获取接口唯一标识',1,'root',1532366870,'[]','admin/InterfaceList/getHash'),(24,'获取当前组的全部用户',1,'root',1532446718,'{\"token\":\"e364b35c5d81de8f8da62e5b21fd1adc\"}','admin/User/getUsers'),(25,'获取当前组的全部用户',1,'root',1532446730,'[]','admin/User/getUsers');

#
# Structure for table "blog_admin_user_data"
#

DROP TABLE IF EXISTS `blog_admin_user_data`;
CREATE TABLE `blog_admin_user_data` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `loginTimes` int(11) NOT NULL DEFAULT '0' COMMENT '账号登录次数',
  `lastLoginIp` bigint(11) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `lastLoginTime` int(11) NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `uid` varchar(11) NOT NULL DEFAULT '' COMMENT '用户ID',
  `headImg` text COMMENT '用户头像',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='管理员数据表';

#
# Data for table "blog_admin_user_data"
#

INSERT INTO `blog_admin_user_data` VALUES (1,49,2130706433,1532446496,'1','https://apic.douyucdn.cn/upload/avatar/006/29/44/20_avatar_middle.jpg');
