/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50622
Source Host           : 127.0.0.1:3306
Source Database       : hotel

Target Server Type    : MYSQL
Target Server Version : 50622
File Encoding         : 65001

Date: 2022-03-22 14:10:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for accommodation
-- ----------------------------
DROP TABLE IF EXISTS `accommodation`;
CREATE TABLE `accommodation` (
  `入住时间` varchar(45) DEFAULT NULL,
  `id` int(11) NOT NULL,
  `客房编号` int(11) NOT NULL,
  `顾客id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `accommodation_客房编号_eb67e2dc_fk_room_房间号` (`客房编号`),
  KEY `accommodation_顾客id_62abfda5_fk_client_顾客id` (`顾客id`),
  CONSTRAINT `accommodation_客房编号_eb67e2dc_fk_room_房间号` FOREIGN KEY (`客房编号`) REFERENCES `room` (`房间号`),
  CONSTRAINT `accommodation_顾客id_62abfda5_fk_client_顾客id` FOREIGN KEY (`顾客id`) REFERENCES `client` (`顾客id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of accommodation
-- ----------------------------
INSERT INTO `accommodation` VALUES ('2022-3-22', '101', '1', '1');

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can view log entry', '1', 'view_logentry');
INSERT INTO `auth_permission` VALUES ('5', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('8', 'Can view permission', '2', 'view_permission');
INSERT INTO `auth_permission` VALUES ('9', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('11', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('12', 'Can view group', '3', 'view_group');
INSERT INTO `auth_permission` VALUES ('13', 'Can add user', '4', 'add_user');
INSERT INTO `auth_permission` VALUES ('14', 'Can change user', '4', 'change_user');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete user', '4', 'delete_user');
INSERT INTO `auth_permission` VALUES ('16', 'Can view user', '4', 'view_user');
INSERT INTO `auth_permission` VALUES ('17', 'Can add content type', '5', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('18', 'Can change content type', '5', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('19', 'Can delete content type', '5', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('20', 'Can view content type', '5', 'view_contenttype');
INSERT INTO `auth_permission` VALUES ('21', 'Can add session', '6', 'add_session');
INSERT INTO `auth_permission` VALUES ('22', 'Can change session', '6', 'change_session');
INSERT INTO `auth_permission` VALUES ('23', 'Can delete session', '6', 'delete_session');
INSERT INTO `auth_permission` VALUES ('24', 'Can view session', '6', 'view_session');
INSERT INTO `auth_permission` VALUES ('25', 'Can add accommodation', '7', 'add_accommodation');
INSERT INTO `auth_permission` VALUES ('26', 'Can change accommodation', '7', 'change_accommodation');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete accommodation', '7', 'delete_accommodation');
INSERT INTO `auth_permission` VALUES ('28', 'Can view accommodation', '7', 'view_accommodation');
INSERT INTO `auth_permission` VALUES ('29', 'Can add client', '8', 'add_client');
INSERT INTO `auth_permission` VALUES ('30', 'Can change client', '8', 'change_client');
INSERT INTO `auth_permission` VALUES ('31', 'Can delete client', '8', 'delete_client');
INSERT INTO `auth_permission` VALUES ('32', 'Can view client', '8', 'view_client');
INSERT INTO `auth_permission` VALUES ('33', 'Can add food', '9', 'add_food');
INSERT INTO `auth_permission` VALUES ('34', 'Can change food', '9', 'change_food');
INSERT INTO `auth_permission` VALUES ('35', 'Can delete food', '9', 'delete_food');
INSERT INTO `auth_permission` VALUES ('36', 'Can view food', '9', 'view_food');
INSERT INTO `auth_permission` VALUES ('37', 'Can add order', '10', 'add_order');
INSERT INTO `auth_permission` VALUES ('38', 'Can change order', '10', 'change_order');
INSERT INTO `auth_permission` VALUES ('39', 'Can delete order', '10', 'delete_order');
INSERT INTO `auth_permission` VALUES ('40', 'Can view order', '10', 'view_order');
INSERT INTO `auth_permission` VALUES ('41', 'Can add park', '11', 'add_park');
INSERT INTO `auth_permission` VALUES ('42', 'Can change park', '11', 'change_park');
INSERT INTO `auth_permission` VALUES ('43', 'Can delete park', '11', 'delete_park');
INSERT INTO `auth_permission` VALUES ('44', 'Can view park', '11', 'view_park');
INSERT INTO `auth_permission` VALUES ('45', 'Can add room', '12', 'add_room');
INSERT INTO `auth_permission` VALUES ('46', 'Can change room', '12', 'change_room');
INSERT INTO `auth_permission` VALUES ('47', 'Can delete room', '12', 'delete_room');
INSERT INTO `auth_permission` VALUES ('48', 'Can view room', '12', 'view_room');
INSERT INTO `auth_permission` VALUES ('49', 'Can add staff', '13', 'add_staff');
INSERT INTO `auth_permission` VALUES ('50', 'Can change staff', '13', 'change_staff');
INSERT INTO `auth_permission` VALUES ('51', 'Can delete staff', '13', 'delete_staff');
INSERT INTO `auth_permission` VALUES ('52', 'Can view staff', '13', 'view_staff');
INSERT INTO `auth_permission` VALUES ('53', 'Can add vip', '14', 'add_vip');
INSERT INTO `auth_permission` VALUES ('54', 'Can change vip', '14', 'change_vip');
INSERT INTO `auth_permission` VALUES ('55', 'Can delete vip', '14', 'delete_vip');
INSERT INTO `auth_permission` VALUES ('56', 'Can view vip', '14', 'view_vip');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES ('1', 'pbkdf2_sha256$120000$Sso8xWqv7WUU$YwCS3yM1ucajK8jENIQfTaOh5gLxbSyQvDPUhARxLEo=', '2022-03-22 05:57:25.450008', '1', 'admin', '', '', '123@qq.com', '1', '1', '2022-03-22 05:47:09.487388');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for client
-- ----------------------------
DROP TABLE IF EXISTS `client`;
CREATE TABLE `client` (
  `顾客id` int(11) NOT NULL AUTO_INCREMENT,
  `姓名` varchar(45) DEFAULT NULL,
  `身份证号` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`顾客id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of client
-- ----------------------------
INSERT INTO `client` VALUES ('1', '赵四', '231012341234567890');

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES ('1', '2022-03-22 05:57:59.100730', '1', 'Vip object (1)', '1', '[{\"added\": {}}]', '14', '1');
INSERT INTO `django_admin_log` VALUES ('2', '2022-03-22 05:58:32.913980', '1', 'Park object (1)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('3', '2022-03-22 05:59:24.059057', '1', 'Room object (1)', '1', '[{\"added\": {}}]', '12', '1');
INSERT INTO `django_admin_log` VALUES ('4', '2022-03-22 05:59:47.670863', '1', 'Room object (1)', '2', '[]', '12', '1');
INSERT INTO `django_admin_log` VALUES ('5', '2022-03-22 06:01:48.842735', '1', 'Client object (1)', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('6', '2022-03-22 06:02:25.695448', '1', 'Food object (1)', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('7', '2022-03-22 06:02:53.655545', '101', 'Order object (101)', '1', '[{\"added\": {}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('8', '2022-03-22 06:09:30.199351', '101', '客房订单管理', '1', '[{\"added\": {}}]', '7', '1');

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('4', 'auth', 'user');
INSERT INTO `django_content_type` VALUES ('5', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('7', 'hotelapp', 'accommodation');
INSERT INTO `django_content_type` VALUES ('8', 'hotelapp', 'client');
INSERT INTO `django_content_type` VALUES ('9', 'hotelapp', 'food');
INSERT INTO `django_content_type` VALUES ('10', 'hotelapp', 'order');
INSERT INTO `django_content_type` VALUES ('11', 'hotelapp', 'park');
INSERT INTO `django_content_type` VALUES ('12', 'hotelapp', 'room');
INSERT INTO `django_content_type` VALUES ('13', 'hotelapp', 'staff');
INSERT INTO `django_content_type` VALUES ('14', 'hotelapp', 'vip');
INSERT INTO `django_content_type` VALUES ('6', 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2022-03-21 12:39:46.358777');
INSERT INTO `django_migrations` VALUES ('2', 'auth', '0001_initial', '2022-03-21 12:39:47.243488');
INSERT INTO `django_migrations` VALUES ('3', 'admin', '0001_initial', '2022-03-21 12:39:47.468309');
INSERT INTO `django_migrations` VALUES ('4', 'admin', '0002_logentry_remove_auto_add', '2022-03-21 12:39:47.481960');
INSERT INTO `django_migrations` VALUES ('5', 'admin', '0003_logentry_add_action_flag_choices', '2022-03-21 12:39:47.496090');
INSERT INTO `django_migrations` VALUES ('6', 'contenttypes', '0002_remove_content_type_name', '2022-03-21 12:39:47.628961');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0002_alter_permission_name_max_length', '2022-03-21 12:39:47.703590');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0003_alter_user_email_max_length', '2022-03-21 12:39:47.783079');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0004_alter_user_username_opts', '2022-03-21 12:39:47.796093');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0005_alter_user_last_login_null', '2022-03-21 12:39:47.867664');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0006_require_contenttypes_0002', '2022-03-21 12:39:47.875785');
INSERT INTO `django_migrations` VALUES ('12', 'auth', '0007_alter_validators_add_error_messages', '2022-03-21 12:39:47.889429');
INSERT INTO `django_migrations` VALUES ('13', 'auth', '0008_alter_user_username_max_length', '2022-03-21 12:39:47.966852');
INSERT INTO `django_migrations` VALUES ('14', 'auth', '0009_alter_user_last_name_max_length', '2022-03-21 12:39:48.045694');
INSERT INTO `django_migrations` VALUES ('15', 'hotelapp', '0001_initial', '2022-03-21 12:39:48.054417');
INSERT INTO `django_migrations` VALUES ('16', 'hotelapp', '0002_auto_20220321_2039', '2022-03-21 12:39:49.548506');
INSERT INTO `django_migrations` VALUES ('17', 'sessions', '0001_initial', '2022-03-21 12:39:49.636921');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('fge7n7xfn9o5lxnisrg4i2hvs81ab3g7', 'YjA1YjBmMzIyYWM1MDA4Y2Q5MWNiYjRmMzQ1YzhmMDJjZTgyOTNmNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2YTAxZDQzMmFmYzA0ZjA3ZjdjZjQ1OWQzYzgwMTViMDA5ZGYzNzVhIiwiX21lbnVzIjoiW3tcIm5hbWVcIjogXCJIb3RlbGFwcFwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCIsIFwibW9kZWxzXCI6IFt7XCJuYW1lXCI6IFwiXFx1NGYxYVxcdTU0NThcXHU0ZmUxXFx1NjA2ZlxcdTdiYTFcXHU3NDA2XCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIiwgXCJ1cmxcIjogXCIvYWRtaW4vaG90ZWxhcHAvdmlwL1wiLCBcImFkZFVybFwiOiBcIi9hZG1pbi9ob3RlbGFwcC92aXAvYWRkL1wiLCBcImJyZWFkY3J1bWJzXCI6IFt7XCJuYW1lXCI6IFwiSG90ZWxhcHBcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifSwge1wibmFtZVwiOiBcIlxcdTRmMWFcXHU1NDU4XFx1NGZlMVxcdTYwNmZcXHU3YmExXFx1NzQwNlwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCJ9XSwgXCJlaWRcIjogMTAwMn0sIHtcIm5hbWVcIjogXCJcXHU1MDVjXFx1OGY2NlxcdTU3M2FcXHU3YmExXFx1NzQwNlwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCIsIFwidXJsXCI6IFwiL2FkbWluL2hvdGVsYXBwL3BhcmsvXCIsIFwiYWRkVXJsXCI6IFwiL2FkbWluL2hvdGVsYXBwL3BhcmsvYWRkL1wiLCBcImJyZWFkY3J1bWJzXCI6IFt7XCJuYW1lXCI6IFwiSG90ZWxhcHBcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifSwge1wibmFtZVwiOiBcIlxcdTUwNWNcXHU4ZjY2XFx1NTczYVxcdTdiYTFcXHU3NDA2XCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIn1dLCBcImVpZFwiOiAxMDAzfSwge1wibmFtZVwiOiBcIlxcdTU0NThcXHU1ZGU1XFx1NGZlMVxcdTYwNmZcXHU3YmExXFx1NzQwNlwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCIsIFwidXJsXCI6IFwiL2FkbWluL2hvdGVsYXBwL3N0YWZmL1wiLCBcImFkZFVybFwiOiBcIi9hZG1pbi9ob3RlbGFwcC9zdGFmZi9hZGQvXCIsIFwiYnJlYWRjcnVtYnNcIjogW3tcIm5hbWVcIjogXCJIb3RlbGFwcFwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCJ9LCB7XCJuYW1lXCI6IFwiXFx1NTQ1OFxcdTVkZTVcXHU0ZmUxXFx1NjA2ZlxcdTdiYTFcXHU3NDA2XCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIn1dLCBcImVpZFwiOiAxMDA0fSwge1wibmFtZVwiOiBcIlxcdTViYTJcXHU2MjNmXFx1NGZlMVxcdTYwNmZcXHU3YmExXFx1NzQwNlwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCIsIFwidXJsXCI6IFwiL2FkbWluL2hvdGVsYXBwL3Jvb20vXCIsIFwiYWRkVXJsXCI6IFwiL2FkbWluL2hvdGVsYXBwL3Jvb20vYWRkL1wiLCBcImJyZWFkY3J1bWJzXCI6IFt7XCJuYW1lXCI6IFwiSG90ZWxhcHBcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifSwge1wibmFtZVwiOiBcIlxcdTViYTJcXHU2MjNmXFx1NGZlMVxcdTYwNmZcXHU3YmExXFx1NzQwNlwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCJ9XSwgXCJlaWRcIjogMTAwNX0sIHtcIm5hbWVcIjogXCJcXHU1YmEyXFx1NjIzZlxcdThiYTJcXHU1MzU1XFx1N2JhMVxcdTc0MDZcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwiLCBcInVybFwiOiBcIi9hZG1pbi9ob3RlbGFwcC9hY2NvbW1vZGF0aW9uL1wiLCBcImFkZFVybFwiOiBcIi9hZG1pbi9ob3RlbGFwcC9hY2NvbW1vZGF0aW9uL2FkZC9cIiwgXCJicmVhZGNydW1ic1wiOiBbe1wibmFtZVwiOiBcIkhvdGVsYXBwXCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIn0sIHtcIm5hbWVcIjogXCJcXHU1YmEyXFx1NjIzZlxcdThiYTJcXHU1MzU1XFx1N2JhMVxcdTc0MDZcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifV0sIFwiZWlkXCI6IDEwMDZ9LCB7XCJuYW1lXCI6IFwiXFx1OTg3ZVxcdTViYTJcXHU3YmExXFx1NzQwNlwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCIsIFwidXJsXCI6IFwiL2FkbWluL2hvdGVsYXBwL2NsaWVudC9cIiwgXCJhZGRVcmxcIjogXCIvYWRtaW4vaG90ZWxhcHAvY2xpZW50L2FkZC9cIiwgXCJicmVhZGNydW1ic1wiOiBbe1wibmFtZVwiOiBcIkhvdGVsYXBwXCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIn0sIHtcIm5hbWVcIjogXCJcXHU5ODdlXFx1NWJhMlxcdTdiYTFcXHU3NDA2XCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIn1dLCBcImVpZFwiOiAxMDA3fSwge1wibmFtZVwiOiBcIlxcdTk5MTBcXHU1Mzg1XFx1N2JhMVxcdTc0MDZcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwiLCBcInVybFwiOiBcIi9hZG1pbi9ob3RlbGFwcC9mb29kL1wiLCBcImFkZFVybFwiOiBcIi9hZG1pbi9ob3RlbGFwcC9mb29kL2FkZC9cIiwgXCJicmVhZGNydW1ic1wiOiBbe1wibmFtZVwiOiBcIkhvdGVsYXBwXCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIn0sIHtcIm5hbWVcIjogXCJcXHU5OTEwXFx1NTM4NVxcdTdiYTFcXHU3NDA2XCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIn1dLCBcImVpZFwiOiAxMDA4fSwge1wibmFtZVwiOiBcIlxcdTk5MTBcXHU1Mzg1XFx1OGJhMlxcdTUzNTVcXHU3YmExXFx1NzQwNlwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCIsIFwidXJsXCI6IFwiL2FkbWluL2hvdGVsYXBwL29yZGVyL1wiLCBcImFkZFVybFwiOiBcIi9hZG1pbi9ob3RlbGFwcC9vcmRlci9hZGQvXCIsIFwiYnJlYWRjcnVtYnNcIjogW3tcIm5hbWVcIjogXCJIb3RlbGFwcFwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCJ9LCB7XCJuYW1lXCI6IFwiXFx1OTkxMFxcdTUzODVcXHU4YmEyXFx1NTM1NVxcdTdiYTFcXHU3NDA2XCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIn1dLCBcImVpZFwiOiAxMDA5fV0sIFwiZWlkXCI6IDEwMDF9LCB7XCJuYW1lXCI6IFwiXFx1OGJhNFxcdThiYzFcXHU1NDhjXFx1NjM4OFxcdTY3NDNcIiwgXCJpY29uXCI6IFwiZmFzIGZhLXNoaWVsZC1hbHRcIiwgXCJtb2RlbHNcIjogW3tcIm5hbWVcIjogXCJcXHU3NTI4XFx1NjIzN1wiLCBcImljb25cIjogXCJmYXIgZmEtdXNlclwiLCBcInVybFwiOiBcIi9hZG1pbi9hdXRoL3VzZXIvXCIsIFwiYWRkVXJsXCI6IFwiL2FkbWluL2F1dGgvdXNlci9hZGQvXCIsIFwiYnJlYWRjcnVtYnNcIjogW3tcIm5hbWVcIjogXCJcXHU4YmE0XFx1OGJjMVxcdTU0OGNcXHU2Mzg4XFx1Njc0M1wiLCBcImljb25cIjogXCJmYXMgZmEtc2hpZWxkLWFsdFwifSwge1wibmFtZVwiOiBcIlxcdTc1MjhcXHU2MjM3XCIsIFwiaWNvblwiOiBcImZhciBmYS11c2VyXCJ9XSwgXCJlaWRcIjogMTAxMX0sIHtcIm5hbWVcIjogXCJcXHU3ZWM0XCIsIFwiaWNvblwiOiBcImZhcyBmYS11c2Vycy1jb2dcIiwgXCJ1cmxcIjogXCIvYWRtaW4vYXV0aC9ncm91cC9cIiwgXCJhZGRVcmxcIjogXCIvYWRtaW4vYXV0aC9ncm91cC9hZGQvXCIsIFwiYnJlYWRjcnVtYnNcIjogW3tcIm5hbWVcIjogXCJcXHU4YmE0XFx1OGJjMVxcdTU0OGNcXHU2Mzg4XFx1Njc0M1wiLCBcImljb25cIjogXCJmYXMgZmEtc2hpZWxkLWFsdFwifSwge1wibmFtZVwiOiBcIlxcdTdlYzRcIiwgXCJpY29uXCI6IFwiZmFzIGZhLXVzZXJzLWNvZ1wifV0sIFwiZWlkXCI6IDEwMTJ9XSwgXCJlaWRcIjogMTAxMH1dIn0=', '2022-04-05 06:09:11.603463');

-- ----------------------------
-- Table structure for food
-- ----------------------------
DROP TABLE IF EXISTS `food`;
CREATE TABLE `food` (
  `菜品编号` int(11) NOT NULL,
  `菜名` varchar(45) NOT NULL,
  `价格` varchar(45) NOT NULL,
  `厨师id` int(11) NOT NULL,
  PRIMARY KEY (`菜品编号`),
  KEY `food_厨师id_1eda2d69_fk_staff_员工id` (`厨师id`),
  CONSTRAINT `food_厨师id_1eda2d69_fk_staff_员工id` FOREIGN KEY (`厨师id`) REFERENCES `staff` (`员工id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of food
-- ----------------------------
INSERT INTO `food` VALUES ('1', '红烧肉', '38', '101');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `桌号` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `服务员编号` int(11) NOT NULL,
  `菜品编号` int(11) NOT NULL,
  `顾客编号` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_服务员编号_0debb5b8_fk_staff_员工id` (`服务员编号`),
  KEY `order_菜品编号_6da89f1d_fk_food_菜品编号` (`菜品编号`),
  KEY `order_顾客编号_45bccbd4_fk_client_顾客id` (`顾客编号`),
  CONSTRAINT `order_服务员编号_0debb5b8_fk_staff_员工id` FOREIGN KEY (`服务员编号`) REFERENCES `staff` (`员工id`),
  CONSTRAINT `order_菜品编号_6da89f1d_fk_food_菜品编号` FOREIGN KEY (`菜品编号`) REFERENCES `food` (`菜品编号`),
  CONSTRAINT `order_顾客编号_45bccbd4_fk_client_顾客id` FOREIGN KEY (`顾客编号`) REFERENCES `client` (`顾客id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('1', '101', '101', '1', '1');

-- ----------------------------
-- Table structure for park
-- ----------------------------
DROP TABLE IF EXISTS `park`;
CREATE TABLE `park` (
  `车位编号` int(11) NOT NULL,
  `当前状态` varchar(45) NOT NULL,
  `车辆牌号` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`车位编号`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of park
-- ----------------------------
INSERT INTO `park` VALUES ('1', '空闲', '黑A12345');

-- ----------------------------
-- Table structure for room
-- ----------------------------
DROP TABLE IF EXISTS `room`;
CREATE TABLE `room` (
  `房间号` int(11) NOT NULL,
  `客房类型` varchar(45) NOT NULL,
  `价格` int(11) NOT NULL,
  `负责人编号` int(11) NOT NULL,
  PRIMARY KEY (`房间号`),
  KEY `room_负责人编号_2dabc7af_fk_staff_员工id` (`负责人编号`),
  CONSTRAINT `room_负责人编号_2dabc7af_fk_staff_员工id` FOREIGN KEY (`负责人编号`) REFERENCES `staff` (`员工id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of room
-- ----------------------------
INSERT INTO `room` VALUES ('1', '标准间', '188', '101');

-- ----------------------------
-- Table structure for staff
-- ----------------------------
DROP TABLE IF EXISTS `staff`;
CREATE TABLE `staff` (
  `员工id` int(11) NOT NULL AUTO_INCREMENT,
  `姓名` varchar(45) NOT NULL,
  `职务` varchar(45) NOT NULL,
  `月薪` varchar(45) NOT NULL,
  `工龄` varchar(45) NOT NULL,
  PRIMARY KEY (`员工id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of staff
-- ----------------------------
INSERT INTO `staff` VALUES ('101', '王百万', '总经理', '12000', '12');

-- ----------------------------
-- Table structure for vip
-- ----------------------------
DROP TABLE IF EXISTS `vip`;
CREATE TABLE `vip` (
  `会员编号` int(11) NOT NULL AUTO_INCREMENT,
  `姓名` varchar(45) NOT NULL,
  `会员等级` varchar(45) NOT NULL,
  `联系方式` varchar(45) NOT NULL,
  PRIMARY KEY (`会员编号`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vip
-- ----------------------------
INSERT INTO `vip` VALUES ('1', '刘能', '2', '18312345678');
