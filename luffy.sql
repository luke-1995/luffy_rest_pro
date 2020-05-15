/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50728
Source Host           : localhost:3306
Source Database       : luffy

Target Server Type    : MYSQL
Target Server Version : 50728
File Encoding         : 65001

Date: 2020-03-31 20:18:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_group_permissions`
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
-- Table structure for `auth_permission`
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
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8;

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
INSERT INTO `auth_permission` VALUES ('25', 'Can add icon', '7', 'add_icon');
INSERT INTO `auth_permission` VALUES ('26', 'Can change icon', '7', 'change_icon');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete icon', '7', 'delete_icon');
INSERT INTO `auth_permission` VALUES ('28', 'Can view icon', '7', 'view_icon');
INSERT INTO `auth_permission` VALUES ('29', 'Can add permission', '8', 'add_permission');
INSERT INTO `auth_permission` VALUES ('30', 'Can change permission', '8', 'change_permission');
INSERT INTO `auth_permission` VALUES ('31', 'Can delete permission', '8', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('32', 'Can view permission', '8', 'view_permission');
INSERT INTO `auth_permission` VALUES ('33', 'Can add role', '9', 'add_role');
INSERT INTO `auth_permission` VALUES ('34', 'Can change role', '9', 'change_role');
INSERT INTO `auth_permission` VALUES ('35', 'Can delete role', '9', 'delete_role');
INSERT INTO `auth_permission` VALUES ('36', 'Can view role', '9', 'view_role');
INSERT INTO `auth_permission` VALUES ('37', 'Can add user info', '10', 'add_userinfo');
INSERT INTO `auth_permission` VALUES ('38', 'Can change user info', '10', 'change_userinfo');
INSERT INTO `auth_permission` VALUES ('39', 'Can delete user info', '10', 'delete_userinfo');
INSERT INTO `auth_permission` VALUES ('40', 'Can view user info', '10', 'view_userinfo');
INSERT INTO `auth_permission` VALUES ('41', 'Can add first menu', '11', 'add_firstmenu');
INSERT INTO `auth_permission` VALUES ('42', 'Can change first menu', '11', 'change_firstmenu');
INSERT INTO `auth_permission` VALUES ('43', 'Can delete first menu', '11', 'delete_firstmenu');
INSERT INTO `auth_permission` VALUES ('44', 'Can view first menu', '11', 'view_firstmenu');
INSERT INTO `auth_permission` VALUES ('45', 'Can add teacher-学生跟进表', '12', 'add_studentrecord');
INSERT INTO `auth_permission` VALUES ('46', 'Can change teacher-学生跟进表', '12', 'change_studentrecord');
INSERT INTO `auth_permission` VALUES ('47', 'Can delete teacher-学生跟进表', '12', 'delete_studentrecord');
INSERT INTO `auth_permission` VALUES ('48', 'Can view teacher-学生跟进表', '12', 'view_studentrecord');
INSERT INTO `auth_permission` VALUES ('49', 'Can add 学生-问题表', '13', 'add_question');
INSERT INTO `auth_permission` VALUES ('50', 'Can change 学生-问题表', '13', 'change_question');
INSERT INTO `auth_permission` VALUES ('51', 'Can delete 学生-问题表', '13', 'delete_question');
INSERT INTO `auth_permission` VALUES ('52', 'Can view 学生-问题表', '13', 'view_question');
INSERT INTO `auth_permission` VALUES ('53', 'Can add teacher-作业提交记录表', '14', 'add_homeworkrecord');
INSERT INTO `auth_permission` VALUES ('54', 'Can change teacher-作业提交记录表', '14', 'change_homeworkrecord');
INSERT INTO `auth_permission` VALUES ('55', 'Can delete teacher-作业提交记录表', '14', 'delete_homeworkrecord');
INSERT INTO `auth_permission` VALUES ('56', 'Can view teacher-作业提交记录表', '14', 'view_homeworkrecord');
INSERT INTO `auth_permission` VALUES ('57', 'Can add teacher-作业表', '15', 'add_homework');
INSERT INTO `auth_permission` VALUES ('58', 'Can change teacher-作业表', '15', 'change_homework');
INSERT INTO `auth_permission` VALUES ('59', 'Can delete teacher-作业表', '15', 'delete_homework');
INSERT INTO `auth_permission` VALUES ('60', 'Can view teacher-作业表', '15', 'view_homework');
INSERT INTO `auth_permission` VALUES ('61', 'Can add student-价格策略表', '16', 'add_pricepolicy');
INSERT INTO `auth_permission` VALUES ('62', 'Can change student-价格策略表', '16', 'change_pricepolicy');
INSERT INTO `auth_permission` VALUES ('63', 'Can delete student-价格策略表', '16', 'delete_pricepolicy');
INSERT INTO `auth_permission` VALUES ('64', 'Can view student-价格策略表', '16', 'view_pricepolicy');
INSERT INTO `auth_permission` VALUES ('65', 'Can add student-课程详细表', '17', 'add_coursedetail');
INSERT INTO `auth_permission` VALUES ('66', 'Can change student-课程详细表', '17', 'change_coursedetail');
INSERT INTO `auth_permission` VALUES ('67', 'Can delete student-课程详细表', '17', 'delete_coursedetail');
INSERT INTO `auth_permission` VALUES ('68', 'Can view student-课程详细表', '17', 'view_coursedetail');
INSERT INTO `auth_permission` VALUES ('69', 'Can add student-学位课程表', '18', 'add_degreecourse');
INSERT INTO `auth_permission` VALUES ('70', 'Can change student-学位课程表', '18', 'change_degreecourse');
INSERT INTO `auth_permission` VALUES ('71', 'Can delete student-学位课程表', '18', 'delete_degreecourse');
INSERT INTO `auth_permission` VALUES ('72', 'Can view student-学位课程表', '18', 'view_degreecourse');
INSERT INTO `auth_permission` VALUES ('73', 'Can add student-课程章节表', '19', 'add_coursechapter');
INSERT INTO `auth_permission` VALUES ('74', 'Can change student-课程章节表', '19', 'change_coursechapter');
INSERT INTO `auth_permission` VALUES ('75', 'Can delete student-课程章节表', '19', 'delete_coursechapter');
INSERT INTO `auth_permission` VALUES ('76', 'Can view student-课程章节表', '19', 'view_coursechapter');
INSERT INTO `auth_permission` VALUES ('77', 'Can add student-课程表', '20', 'add_course');
INSERT INTO `auth_permission` VALUES ('78', 'Can change student-课程表', '20', 'change_course');
INSERT INTO `auth_permission` VALUES ('79', 'Can delete student-课程表', '20', 'delete_course');
INSERT INTO `auth_permission` VALUES ('80', 'Can view student-课程表', '20', 'view_course');
INSERT INTO `auth_permission` VALUES ('81', 'Can add student-课程课时表', '21', 'add_coursesection');
INSERT INTO `auth_permission` VALUES ('82', 'Can change student-课程课时表', '21', 'change_coursesection');
INSERT INTO `auth_permission` VALUES ('83', 'Can delete student-课程课时表', '21', 'delete_coursesection');
INSERT INTO `auth_permission` VALUES ('84', 'Can view student-课程课时表', '21', 'view_coursesection');
INSERT INTO `auth_permission` VALUES ('85', 'Can add student-课程分类表', '22', 'add_category');
INSERT INTO `auth_permission` VALUES ('86', 'Can change student-课程分类表', '22', 'change_category');
INSERT INTO `auth_permission` VALUES ('87', 'Can delete student-课程分类表', '22', 'delete_category');
INSERT INTO `auth_permission` VALUES ('88', 'Can view student-课程分类表', '22', 'view_category');
INSERT INTO `auth_permission` VALUES ('89', 'Can add student-购物车表', '23', 'add_shoppingcart');
INSERT INTO `auth_permission` VALUES ('90', 'Can change student-购物车表', '23', 'change_shoppingcart');
INSERT INTO `auth_permission` VALUES ('91', 'Can delete student-购物车表', '23', 'delete_shoppingcart');
INSERT INTO `auth_permission` VALUES ('92', 'Can view student-购物车表', '23', 'view_shoppingcart');
INSERT INTO `auth_permission` VALUES ('93', 'Can add student-优惠券生成规则记录', '24', 'add_coupon');
INSERT INTO `auth_permission` VALUES ('94', 'Can change student-优惠券生成规则记录', '24', 'change_coupon');
INSERT INTO `auth_permission` VALUES ('95', 'Can delete student-优惠券生成规则记录', '24', 'delete_coupon');
INSERT INTO `auth_permission` VALUES ('96', 'Can view student-优惠券生成规则记录', '24', 'view_coupon');
INSERT INTO `auth_permission` VALUES ('97', 'Can add student-订单表', '25', 'add_order');
INSERT INTO `auth_permission` VALUES ('98', 'Can change student-订单表', '25', 'change_order');
INSERT INTO `auth_permission` VALUES ('99', 'Can delete student-订单表', '25', 'delete_order');
INSERT INTO `auth_permission` VALUES ('100', 'Can view student-订单表', '25', 'view_order');
INSERT INTO `auth_permission` VALUES ('101', 'Can add student-贝里交易记录', '26', 'add_transactionrecord');
INSERT INTO `auth_permission` VALUES ('102', 'Can change student-贝里交易记录', '26', 'change_transactionrecord');
INSERT INTO `auth_permission` VALUES ('103', 'Can delete student-贝里交易记录', '26', 'delete_transactionrecord');
INSERT INTO `auth_permission` VALUES ('104', 'Can view student-贝里交易记录', '26', 'view_transactionrecord');
INSERT INTO `auth_permission` VALUES ('105', 'Can add student-订单详细', '27', 'add_orderdetail');
INSERT INTO `auth_permission` VALUES ('106', 'Can change student-订单详细', '27', 'change_orderdetail');
INSERT INTO `auth_permission` VALUES ('107', 'Can delete student-订单详细', '27', 'delete_orderdetail');
INSERT INTO `auth_permission` VALUES ('108', 'Can view student-订单详细', '27', 'view_orderdetail');
INSERT INTO `auth_permission` VALUES ('109', 'Can add student-用户优惠券领取使用记录表', '28', 'add_couponrecord');
INSERT INTO `auth_permission` VALUES ('110', 'Can change student-用户优惠券领取使用记录表', '28', 'change_couponrecord');
INSERT INTO `auth_permission` VALUES ('111', 'Can delete student-用户优惠券领取使用记录表', '28', 'delete_couponrecord');
INSERT INTO `auth_permission` VALUES ('112', 'Can view student-用户优惠券领取使用记录表', '28', 'view_couponrecord');
INSERT INTO `auth_permission` VALUES ('113', 'Can add study course', '29', 'add_studycourse');
INSERT INTO `auth_permission` VALUES ('114', 'Can change study course', '29', 'change_studycourse');
INSERT INTO `auth_permission` VALUES ('115', 'Can delete study course', '29', 'delete_studycourse');
INSERT INTO `auth_permission` VALUES ('116', 'Can view study course', '29', 'view_studycourse');
INSERT INTO `auth_permission` VALUES ('117', 'Can add manager--咨询文章表', '30', 'add_article');
INSERT INTO `auth_permission` VALUES ('118', 'Can change manager--咨询文章表', '30', 'change_article');
INSERT INTO `auth_permission` VALUES ('119', 'Can delete manager--咨询文章表', '30', 'delete_article');
INSERT INTO `auth_permission` VALUES ('120', 'Can view manager--咨询文章表', '30', 'view_article');
INSERT INTO `auth_permission` VALUES ('121', 'Can add rbac-api权限表', '31', 'add_apipermission');
INSERT INTO `auth_permission` VALUES ('122', 'Can change rbac-api权限表', '31', 'change_apipermission');
INSERT INTO `auth_permission` VALUES ('123', 'Can delete rbac-api权限表', '31', 'delete_apipermission');
INSERT INTO `auth_permission` VALUES ('124', 'Can view rbac-api权限表', '31', 'view_apipermission');

-- ----------------------------
-- Table structure for `auth_user`
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
INSERT INTO `auth_user` VALUES ('1', 'pbkdf2_sha256$180000$VBRMPbdvtzZj$+FcLrQiSiIJhOLfh/uvTUehWvrBpbm3Jhlvcv1uWISI=', '2020-03-27 10:50:15.236756', '1', 'alex', '', '', '', '1', '1', '2020-03-05 22:06:06.832048');

-- ----------------------------
-- Table structure for `auth_user_groups`
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
-- Table structure for `auth_user_user_permissions`
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
-- Table structure for `django_admin_log`
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
) ENGINE=InnoDB AUTO_INCREMENT=210 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES ('1', '2020-03-05 22:06:34.433885', '1', 'a', '2', '[{\"changed\": {\"fields\": [\"\\u51fa\\u4efb\\u7684\\u89d2\\u8272\"]}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('2', '2020-03-05 22:06:39.976543', '2', 'b', '2', '[{\"changed\": {\"fields\": [\"\\u51fa\\u4efb\\u7684\\u89d2\\u8272\"]}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('3', '2020-03-06 10:19:39.643800', '1', 'Permission object (1)', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('4', '2020-03-06 10:20:15.152083', '2', 'Permission object (2)', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('5', '2020-03-06 10:21:34.186811', '3', 'Permission object (3)', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('6', '2020-03-06 10:22:05.821661', '4', 'Permission object (4)', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('7', '2020-03-06 10:25:42.292153', '4', '超级管理员', '2', '[{\"changed\": {\"fields\": [\"\\u6240\\u62e5\\u6709\\u7684\\u7684\\u6743\\u9650\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('8', '2020-03-06 10:25:58.517003', '2', '讲师', '2', '[{\"changed\": {\"fields\": [\"\\u6240\\u62e5\\u6709\\u7684\\u7684\\u6743\\u9650\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('9', '2020-03-06 13:25:55.415124', '1', '销售', '2', '[{\"changed\": {\"fields\": [\"\\u6240\\u62e5\\u6709\\u7684\\u7684\\u6743\\u9650\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('10', '2020-03-07 15:11:59.802084', '5', '菜单列表', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('11', '2020-03-07 15:12:21.798315', '4', '超级管理员', '2', '[{\"changed\": {\"fields\": [\"\\u6240\\u62e5\\u6709\\u7684\\u7684\\u6743\\u9650\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('12', '2020-03-13 10:50:23.988523', '4', 'd', '2', '[{\"changed\": {\"fields\": [\"\\u51fa\\u4efb\\u7684\\u89d2\\u8272\"]}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('13', '2020-03-13 10:50:35.902443', '4', 'd', '2', '[{\"changed\": {\"fields\": [\"Student\"]}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('14', '2020-03-13 12:33:08.163126', '4', 'd', '2', '[{\"changed\": {\"fields\": [\"Teacher\"]}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('15', '2020-03-13 12:33:20.321207', '5', 'f', '2', '[{\"changed\": {\"fields\": [\"Teacher\"]}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('16', '2020-03-13 14:18:37.304725', '5', 'f', '2', '[{\"changed\": {\"fields\": [\"Teacher\"]}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('17', '2020-03-13 19:51:57.705480', '1', 'Question object (1)', '1', '[{\"added\": {}}]', '13', '1');
INSERT INTO `django_admin_log` VALUES ('18', '2020-03-14 10:47:45.217027', '1', '我是作业标题', '1', '[{\"added\": {}}]', '15', '1');
INSERT INTO `django_admin_log` VALUES ('19', '2020-03-14 10:55:49.847366', '1', 'HomeworkRecord object (1)', '1', '[{\"added\": {}}]', '14', '1');
INSERT INTO `django_admin_log` VALUES ('20', '2020-03-14 10:59:37.863690', '1', 'HomeworkRecord object (1)', '2', '[{\"changed\": {\"fields\": [\"\\u4f5c\\u4e1a\\u6587\\u4ef6\"]}}]', '14', '1');
INSERT INTO `django_admin_log` VALUES ('21', '2020-03-14 11:15:30.030601', '1', 'HomeworkRecord object (1)', '2', '[{\"changed\": {\"fields\": [\"\\u4f5c\\u4e1a\\u72b6\\u6001\"]}}]', '14', '1');
INSERT INTO `django_admin_log` VALUES ('22', '2020-03-14 22:51:30.907955', '1', 'HomeworkRecord object (1)', '2', '[{\"changed\": {\"fields\": [\"\\u6279\\u6539\\u8fc7\\u7a0b\"]}}]', '14', '1');
INSERT INTO `django_admin_log` VALUES ('23', '2020-03-15 11:55:12.507675', '1', 'python', '1', '[{\"added\": {}}]', '22', '1');
INSERT INTO `django_admin_log` VALUES ('24', '2020-03-15 11:55:22.245564', '2', 'Linux', '1', '[{\"added\": {}}]', '22', '1');
INSERT INTO `django_admin_log` VALUES ('25', '2020-03-15 11:58:23.585662', '1', '我是课程名称', '1', '[{\"added\": {}}]', '20', '1');
INSERT INTO `django_admin_log` VALUES ('26', '2020-03-15 15:53:16.723786', '1', '我是课程名称', '1', '[{\"added\": {}}]', '17', '1');
INSERT INTO `django_admin_log` VALUES ('27', '2020-03-15 15:57:17.478841', '1', '我是课程名称(1天)7.0', '1', '[{\"added\": {}}]', '16', '1');
INSERT INTO `django_admin_log` VALUES ('28', '2020-03-16 09:50:36.036246', '2', 'ShoppingCart object (2)', '1', '[{\"added\": {}}]', '23', '1');
INSERT INTO `django_admin_log` VALUES ('29', '2020-03-16 18:20:44.540317', '2', '我是课程名称(1周)14.0', '1', '[{\"added\": {}}]', '16', '1');
INSERT INTO `django_admin_log` VALUES ('30', '2020-03-17 10:48:01.406244', '1', '通用券(课程优惠卷名称)', '1', '[{\"added\": {}}]', '24', '1');
INSERT INTO `django_admin_log` VALUES ('31', '2020-03-17 10:49:28.160541', '2', '通用券(全局优惠卷名称)', '1', '[{\"added\": {}}]', '24', '1');
INSERT INTO `django_admin_log` VALUES ('32', '2020-03-17 10:49:38.105620', '1', '通用券(课程优惠卷名称)', '2', '[{\"changed\": {\"fields\": [\"\\u7b49\\u503c\\u8d27\\u5e01\"]}}]', '24', '1');
INSERT INTO `django_admin_log` VALUES ('33', '2020-03-17 10:51:15.721281', '1', 'a-xxxxxx-0', '1', '[{\"added\": {}}]', '28', '1');
INSERT INTO `django_admin_log` VALUES ('34', '2020-03-17 10:51:52.742560', '2', 'a-oooooo-0', '1', '[{\"added\": {}}]', '28', '1');
INSERT INTO `django_admin_log` VALUES ('35', '2020-03-17 18:18:38.672197', '3', '通用券(课程优惠卷2)', '1', '[{\"added\": {}}]', '24', '1');
INSERT INTO `django_admin_log` VALUES ('36', '2020-03-17 18:19:54.278268', '4', '通用券(全局优惠卷2)', '1', '[{\"added\": {}}]', '24', '1');
INSERT INTO `django_admin_log` VALUES ('37', '2020-03-17 18:30:34.384684', '3', 'a-xxxx22222-0', '1', '[{\"added\": {}}]', '28', '1');
INSERT INTO `django_admin_log` VALUES ('38', '2020-03-17 18:31:20.904540', '4', 'a-oooo2222-0', '1', '[{\"added\": {}}]', '28', '1');
INSERT INTO `django_admin_log` VALUES ('39', '2020-03-18 08:36:00.115370', '1', '通用券(课程优惠卷名称)', '2', '[{\"changed\": {\"fields\": [\"\\u7b49\\u503c\\u8d27\\u5e01\"]}}]', '24', '1');
INSERT INTO `django_admin_log` VALUES ('40', '2020-03-18 09:06:41.127677', '3', '通用券(课程优惠卷2)', '2', '[{\"changed\": {\"fields\": [\"\\u6298\\u6263\\u767e\\u5206\\u6bd4\"]}}]', '24', '1');
INSERT INTO `django_admin_log` VALUES ('41', '2020-03-18 10:07:49.738135', '1', '通用券(课程优惠卷名称)', '2', '[{\"changed\": {\"fields\": [\"\\u6700\\u4f4e\\u6d88\\u8d39\"]}}]', '24', '1');
INSERT INTO `django_admin_log` VALUES ('42', '2020-03-18 10:21:12.519791', '2', '通用券(全局优惠卷名称)', '2', '[{\"changed\": {\"fields\": [\"\\u6700\\u4f4e\\u6d88\\u8d39\"]}}]', '24', '1');
INSERT INTO `django_admin_log` VALUES ('43', '2020-03-18 10:29:13.331613', '2', '通用券(全局优惠卷名称)', '2', '[{\"changed\": {\"fields\": [\"\\u6298\\u6263\\u767e\\u5206\\u6bd4\"]}}]', '24', '1');
INSERT INTO `django_admin_log` VALUES ('44', '2020-03-18 13:05:23.165698', '1', 'a', '2', '[{\"changed\": {\"fields\": [\"\\u8d1d\\u91cc\\u4f59\\u989d\"]}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('45', '2020-03-18 17:02:26.165859', '3', '折扣券(课程优惠卷2)', '2', '[{\"changed\": {\"fields\": [\"\\u5238\\u7c7b\\u578b\", \"\\u7b49\\u503c\\u8d27\\u5e01\"]}}]', '24', '1');
INSERT INTO `django_admin_log` VALUES ('46', '2020-03-18 17:03:01.164548', '2', '通用券(全局优惠卷名称)', '2', '[{\"changed\": {\"fields\": [\"\\u7b49\\u503c\\u8d27\\u5e01\", \"\\u6298\\u6263\\u767e\\u5206\\u6bd4\", \"\\u6700\\u4f4e\\u6d88\\u8d39\"]}}]', '24', '1');
INSERT INTO `django_admin_log` VALUES ('47', '2020-03-18 17:09:02.966003', '2', '通用券(全局优惠卷名称)', '2', '[{\"changed\": {\"fields\": [\"\\u7b49\\u503c\\u8d27\\u5e01\", \"\\u6298\\u6263\\u767e\\u5206\\u6bd4\"]}}]', '24', '1');
INSERT INTO `django_admin_log` VALUES ('48', '2020-03-18 17:09:27.614194', '4', '满减券(全局优惠卷2)', '2', '[{\"changed\": {\"fields\": [\"\\u5238\\u7c7b\\u578b\", \"\\u7b49\\u503c\\u8d27\\u5e01\", \"\\u6700\\u4f4e\\u6d88\\u8d39\"]}}]', '24', '1');
INSERT INTO `django_admin_log` VALUES ('49', '2020-03-19 08:40:27.644664', '4', '满减券(全局优惠卷2)', '2', '[{\"changed\": {\"fields\": [\"\\u7b49\\u503c\\u8d27\\u5e01\"]}}]', '24', '1');
INSERT INTO `django_admin_log` VALUES ('50', '2020-03-19 08:46:16.019563', '4', '折扣券(全局优惠卷2)', '2', '[{\"changed\": {\"fields\": [\"\\u5238\\u7c7b\\u578b\", \"\\u7b49\\u503c\\u8d27\\u5e01\", \"\\u6298\\u6263\\u767e\\u5206\\u6bd4\", \"\\u6700\\u4f4e\\u6d88\\u8d39\"]}}]', '24', '1');
INSERT INTO `django_admin_log` VALUES ('51', '2020-03-19 14:41:18.309506', '1', '557ab82b-f2d3-4bf9-8422-f2282889d188', '2', '[{\"changed\": {\"fields\": [\"\\u72b6\\u6001\"]}}]', '25', '1');
INSERT INTO `django_admin_log` VALUES ('52', '2020-03-20 18:38:26.378779', '1', '我是第一章', '1', '[{\"added\": {}}]', '19', '1');
INSERT INTO `django_admin_log` VALUES ('53', '2020-03-20 18:38:44.119481', '2', '我是第二章', '1', '[{\"added\": {}}]', '19', '1');
INSERT INTO `django_admin_log` VALUES ('54', '2020-03-20 18:59:45.666768', '1', '我是作业标题', '2', '[{\"changed\": {\"fields\": [\"\\u4f5c\\u4e1a\\u5185\\u5bb9\", \"\\u8bfe\\u7a0b\\u7ae0\\u8282\"]}}]', '15', '1');
INSERT INTO `django_admin_log` VALUES ('55', '2020-03-20 19:00:09.090687', '2', '我是作业标题2', '1', '[{\"added\": {}}]', '15', '1');
INSERT INTO `django_admin_log` VALUES ('56', '2020-03-20 21:23:04.695327', '2', '我是作业标题2', '2', '[{\"changed\": {\"fields\": [\"\\u8bfe\\u7a0b\\u7ae0\\u8282\"]}}]', '15', '1');
INSERT INTO `django_admin_log` VALUES ('57', '2020-03-20 21:23:14.947625', '2', '我是作业标题2', '2', '[{\"changed\": {\"fields\": [\"\\u8bfe\\u7a0b\\u7ae0\\u8282\"]}}]', '15', '1');
INSERT INTO `django_admin_log` VALUES ('58', '2020-03-20 22:43:20.166666', '2', 'HomeworkRecord object (2)', '2', '[{\"changed\": {\"fields\": [\"\\u4f5c\\u4e1a\"]}}]', '14', '1');
INSERT INTO `django_admin_log` VALUES ('59', '2020-03-21 09:34:41.848746', '2', 'HomeworkRecord object (2)', '2', '[{\"changed\": {\"fields\": [\"\\u4f5c\\u4e1a\\u6587\\u4ef6\"]}}]', '14', '1');
INSERT INTO `django_admin_log` VALUES ('60', '2020-03-21 09:37:17.230307', '2', 'HomeworkRecord object (2)', '2', '[{\"changed\": {\"fields\": [\"\\u4f5c\\u4e1a\\u6587\\u4ef6\"]}}]', '14', '1');
INSERT INTO `django_admin_log` VALUES ('61', '2020-03-21 09:38:22.505090', '2', 'HomeworkRecord object (2)', '2', '[{\"changed\": {\"fields\": [\"\\u4f5c\\u4e1a\\u6587\\u4ef6\"]}}]', '14', '1');
INSERT INTO `django_admin_log` VALUES ('62', '2020-03-21 09:39:16.419835', '2', 'HomeworkRecord object (2)', '2', '[{\"changed\": {\"fields\": [\"\\u4f5c\\u4e1a\\u6587\\u4ef6\"]}}]', '14', '1');
INSERT INTO `django_admin_log` VALUES ('63', '2020-03-21 09:40:35.287422', '2', 'HomeworkRecord object (2)', '2', '[{\"changed\": {\"fields\": [\"\\u4f5c\\u4e1a\\u6587\\u4ef6\"]}}]', '14', '1');
INSERT INTO `django_admin_log` VALUES ('64', '2020-03-21 09:43:15.997536', '2', 'HomeworkRecord object (2)', '2', '[{\"changed\": {\"fields\": [\"\\u4f5c\\u4e1a\\u6587\\u4ef6\"]}}]', '14', '1');
INSERT INTO `django_admin_log` VALUES ('65', '2020-03-21 09:44:32.531299', '2', 'HomeworkRecord object (2)', '2', '[{\"changed\": {\"fields\": [\"\\u4f5c\\u4e1a\\u6587\\u4ef6\"]}}]', '14', '1');
INSERT INTO `django_admin_log` VALUES ('66', '2020-03-21 09:46:36.571312', '2', 'HomeworkRecord object (2)', '2', '[{\"changed\": {\"fields\": [\"\\u4f5c\\u4e1a\\u6587\\u4ef6\"]}}]', '14', '1');
INSERT INTO `django_admin_log` VALUES ('67', '2020-03-21 09:57:32.590892', '2', 'HomeworkRecord object (2)', '2', '[{\"changed\": {\"fields\": [\"\\u4f5c\\u4e1a\\u6587\\u4ef6\"]}}]', '14', '1');
INSERT INTO `django_admin_log` VALUES ('68', '2020-03-21 10:00:04.372276', '2', 'HomeworkRecord object (2)', '2', '[{\"changed\": {\"fields\": [\"\\u4f5c\\u4e1a\\u6587\\u4ef6\"]}}]', '14', '1');
INSERT INTO `django_admin_log` VALUES ('69', '2020-03-21 10:58:14.757603', '2', 'HomeworkRecord object (2)', '2', '[{\"changed\": {\"fields\": [\"\\u4f5c\\u4e1a\\u6587\\u4ef6\"]}}]', '14', '1');
INSERT INTO `django_admin_log` VALUES ('70', '2020-03-21 11:00:38.672814', '2', 'HomeworkRecord object (2)', '2', '[{\"changed\": {\"fields\": [\"\\u4f5c\\u4e1a\\u6587\\u4ef6\"]}}]', '14', '1');
INSERT INTO `django_admin_log` VALUES ('71', '2020-03-21 11:06:06.220072', '2', 'HomeworkRecord object (2)', '2', '[{\"changed\": {\"fields\": [\"\\u4f5c\\u4e1a\\u6587\\u4ef6\"]}}]', '14', '1');
INSERT INTO `django_admin_log` VALUES ('72', '2020-03-21 11:07:25.833441', '2', 'HomeworkRecord object (2)', '2', '[{\"changed\": {\"fields\": [\"\\u5b66\\u751f\\u6210\\u7ee9\"]}}]', '14', '1');
INSERT INTO `django_admin_log` VALUES ('73', '2020-03-21 11:36:27.949462', '2', 'HomeworkRecord object (2)', '2', '[{\"changed\": {\"fields\": [\"\\u5b66\\u751f\\u8bc4\\u4ef7\"]}}]', '14', '1');
INSERT INTO `django_admin_log` VALUES ('74', '2020-03-21 22:29:33.561833', '1', '我是课程名称 - 我是第一章-我是第一章--第一课时', '1', '[{\"added\": {}}]', '21', '1');
INSERT INTO `django_admin_log` VALUES ('75', '2020-03-21 23:16:04.542406', '2', '我是课程名称 - 我是第一章-我是第一章--第二课时', '1', '[{\"added\": {}}]', '21', '1');
INSERT INTO `django_admin_log` VALUES ('76', '2020-03-22 13:14:28.484613', '1', 'a', '2', '[{\"changed\": {\"fields\": [\"\\u51fa\\u4efb\\u7684\\u89d2\\u8272\"]}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('77', '2020-03-24 17:26:40.558447', '9', '课程', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('78', '2020-03-24 17:30:15.424507', '10', '视频', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('79', '2020-03-24 17:30:38.703898', '9', '课程', '2', '[{\"changed\": {\"fields\": [\"\\u7ec4\\u4ef6\\u540d\\u79f0\"]}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('80', '2020-03-24 17:32:19.679759', '11', '作业', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('81', '2020-03-24 17:33:02.134350', '11', '作业', '2', '[{\"changed\": {\"fields\": [\"\\u4fa7\\u8fb9\\u680f\\u662f\\u5426\\u51fa\\u73b0\"]}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('82', '2020-03-24 17:33:57.157942', '4', '超级管理员', '2', '[{\"changed\": {\"fields\": [\"\\u6240\\u62e5\\u6709\\u7684\\u7684\\u6743\\u9650\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('83', '2020-03-24 17:41:48.213558', '10', '视频', '2', '[{\"changed\": {\"fields\": [\"\\u4fa7\\u8fb9\\u680f\\u662f\\u5426\\u9690\\u85cf\"]}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('84', '2020-03-24 17:41:54.956008', '11', '作业', '2', '[{\"changed\": {\"fields\": [\"\\u4fa7\\u8fb9\\u680f\\u662f\\u5426\\u9690\\u85cf\"]}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('85', '2020-03-24 17:42:20.663259', '4', '支付中心', '2', '[{\"changed\": {\"fields\": [\"\\u4fa7\\u8fb9\\u680f\\u662f\\u5426\\u9690\\u85cf\"]}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('86', '2020-03-24 17:44:12.388324', '9', '课程', '2', '[{\"changed\": {\"fields\": [\"\\u4fa7\\u8fb9\\u680f\\u662f\\u5426\\u9690\\u85cf\"]}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('87', '2020-03-24 17:51:05.874377', '12', '跟进学生记录', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('88', '2020-03-24 17:53:08.786244', '13', '学生的所有跟进记录', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('89', '2020-03-24 17:54:03.706257', '14', '批改作业', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('90', '2020-03-24 17:55:52.055528', '15', '回复学生问题', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('91', '2020-03-24 17:56:50.730801', '4', '超级管理员', '2', '[{\"changed\": {\"fields\": [\"\\u6240\\u62e5\\u6709\\u7684\\u7684\\u6743\\u9650\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('92', '2020-03-24 18:17:05.554370', '14', '批改作业', '2', '[{\"changed\": {\"fields\": [\"\\u542b\\u6b63\\u5219\\u7684URL\"]}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('93', '2020-03-24 18:39:22.410925', '16', '查看报表', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('94', '2020-03-24 18:40:24.019281', '17', '分配学员', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('95', '2020-03-24 18:41:28.442261', '18', '资讯文章列表', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('96', '2020-03-24 18:42:17.851058', '19', '添加文章', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('97', '2020-03-24 18:43:30.923414', '20', '编辑文章', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('98', '2020-03-24 18:44:50.614608', '21', '追踪学员进度', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('99', '2020-03-24 18:45:34.213704', '22', '导师跟进管理', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('100', '2020-03-24 18:46:33.002380', '23', '订单管理', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('101', '2020-03-24 18:46:46.624009', '23', '订单管理', '2', '[{\"changed\": {\"fields\": [\"\\u4e00\\u7ea7\\u83dc\\u5355\"]}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('102', '2020-03-24 18:47:15.585592', '4', '超级管理员', '2', '[{\"changed\": {\"fields\": [\"\\u6240\\u62e5\\u6709\\u7684\\u7684\\u6743\\u9650\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('103', '2020-03-24 19:03:13.976993', '24', '课程详情', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('104', '2020-03-24 23:47:19.663892', '4', '超级管理员', '2', '[{\"changed\": {\"fields\": [\"\\u6240\\u62e5\\u6709\\u7684\\u7684\\u6743\\u9650\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('105', '2020-03-25 00:19:06.273581', '1', 'a', '2', '[{\"changed\": {\"fields\": [\"Teacher\"]}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('106', '2020-03-25 08:28:16.516359', '26', '课程列表', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('107', '2020-03-25 08:28:30.203350', '4', '超级管理员', '2', '[{\"changed\": {\"fields\": [\"\\u6240\\u62e5\\u6709\\u7684\\u7684\\u6743\\u9650\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('108', '2020-03-26 09:15:51.398331', '1', '购物车列表', '1', '[{\"added\": {}}]', '31', '1');
INSERT INTO `django_admin_log` VALUES ('109', '2020-03-26 09:16:31.097667', '2', '添加购物车', '1', '[{\"added\": {}}]', '31', '1');
INSERT INTO `django_admin_log` VALUES ('110', '2020-03-26 09:17:04.341731', '2', '添加购物车', '2', '[{\"changed\": {\"fields\": [\"\\u8bf7\\u6c42\\u65b9\\u5f0f\"]}}]', '31', '1');
INSERT INTO `django_admin_log` VALUES ('111', '2020-03-26 09:17:25.296089', '3', '修改购物车', '1', '[{\"added\": {}}]', '31', '1');
INSERT INTO `django_admin_log` VALUES ('112', '2020-03-26 09:17:49.510742', '4', '删除购物车', '1', '[{\"added\": {}}]', '31', '1');
INSERT INTO `django_admin_log` VALUES ('113', '2020-03-26 09:22:16.010779', '4', '超级管理员', '2', '[{\"changed\": {\"fields\": [\"Api\\u6743\\u9650\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('114', '2020-03-26 16:43:01.880312', '5', '我的教室列表', '1', '[{\"added\": {}}]', '31', '1');
INSERT INTO `django_admin_log` VALUES ('115', '2020-03-26 16:45:52.580261', '6', '学习进度', '1', '[{\"added\": {}}]', '31', '1');
INSERT INTO `django_admin_log` VALUES ('116', '2020-03-26 16:46:14.835140', '4', '超级管理员', '2', '[{\"changed\": {\"fields\": [\"Api\\u6743\\u9650\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('117', '2020-03-26 17:04:37.300143', '6', '学习进度', '2', '[{\"changed\": {\"fields\": [\"\\u542b\\u6b63\\u5219\\u7684URL\"]}}]', '31', '1');
INSERT INTO `django_admin_log` VALUES ('118', '2020-03-26 17:08:38.577588', '6', '学习进度', '2', '[{\"changed\": {\"fields\": [\"\\u542b\\u6b63\\u5219\\u7684URL\"]}}]', '31', '1');
INSERT INTO `django_admin_log` VALUES ('119', '2020-03-26 17:14:39.643531', '6', '学习进度', '2', '[{\"changed\": {\"fields\": [\"\\u542b\\u6b63\\u5219\\u7684URL\"]}}]', '31', '1');
INSERT INTO `django_admin_log` VALUES ('120', '2020-03-26 17:18:16.107343', '7', '路飞课程', '1', '[{\"added\": {}}]', '31', '1');
INSERT INTO `django_admin_log` VALUES ('121', '2020-03-26 17:19:01.888772', '8', '路飞课程详情', '1', '[{\"added\": {}}]', '31', '1');
INSERT INTO `django_admin_log` VALUES ('122', '2020-03-26 17:19:40.362597', '9', '课程分类', '1', '[{\"added\": {}}]', '31', '1');
INSERT INTO `django_admin_log` VALUES ('123', '2020-03-26 19:08:54.606483', '10', '作业列表', '1', '[{\"added\": {}}]', '31', '1');
INSERT INTO `django_admin_log` VALUES ('124', '2020-03-26 19:09:28.309757', '11', '上传作业(修改作业)', '1', '[{\"added\": {}}]', '31', '1');
INSERT INTO `django_admin_log` VALUES ('125', '2020-03-26 19:14:03.204784', '12', '订单列表', '1', '[{\"added\": {}}]', '31', '1');
INSERT INTO `django_admin_log` VALUES ('126', '2020-03-26 19:14:33.229299', '13', '订单支付', '1', '[{\"added\": {}}]', '31', '1');
INSERT INTO `django_admin_log` VALUES ('127', '2020-03-26 19:15:50.581150', '14', '提交支付请求', '1', '[{\"added\": {}}]', '31', '1');
INSERT INTO `django_admin_log` VALUES ('128', '2020-03-26 19:16:34.407908', '14', '提交支付请求(核对并生成订单)', '2', '[{\"changed\": {\"fields\": [\"\\u6807\\u9898\"]}}]', '31', '1');
INSERT INTO `django_admin_log` VALUES ('129', '2020-03-26 19:20:07.105382', '15', '视频课时列表', '1', '[{\"added\": {}}]', '31', '1');
INSERT INTO `django_admin_log` VALUES ('130', '2020-03-26 19:21:06.273598', '16', '结算列表', '1', '[{\"added\": {}}]', '31', '1');
INSERT INTO `django_admin_log` VALUES ('131', '2020-03-26 19:22:22.141876', '17', '增加结算中心', '1', '[{\"added\": {}}]', '31', '1');
INSERT INTO `django_admin_log` VALUES ('132', '2020-03-26 19:22:59.201523', '18', '修改结算中心(优惠卷)', '1', '[{\"added\": {}}]', '31', '1');
INSERT INTO `django_admin_log` VALUES ('133', '2020-03-26 19:23:40.831881', '1', '购物车中心', '2', '[{\"changed\": {\"fields\": [\"\\u6807\\u9898\"]}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('134', '2020-03-26 19:24:25.230706', '19', '购物车列表', '1', '[{\"added\": {}}]', '31', '1');
INSERT INTO `django_admin_log` VALUES ('135', '2020-03-26 19:24:46.514592', '20', '增加购物车', '1', '[{\"added\": {}}]', '31', '1');
INSERT INTO `django_admin_log` VALUES ('136', '2020-03-26 19:25:34.317793', '21', '修改购物车(更改价格策略)', '1', '[{\"added\": {}}]', '31', '1');
INSERT INTO `django_admin_log` VALUES ('137', '2020-03-26 19:25:59.448869', '22', '删除购物车', '1', '[{\"added\": {}}]', '31', '1');
INSERT INTO `django_admin_log` VALUES ('138', '2020-03-26 19:26:53.012233', '25', '提问题中心', '2', '[{\"changed\": {\"fields\": [\"\\u6807\\u9898\"]}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('139', '2020-03-26 19:27:22.780272', '23', '提问题列表', '1', '[{\"added\": {}}]', '31', '1');
INSERT INTO `django_admin_log` VALUES ('140', '2020-03-26 19:27:59.939131', '24', '增加问题', '1', '[{\"added\": {}}]', '31', '1');
INSERT INTO `django_admin_log` VALUES ('141', '2020-03-26 19:29:14.237472', '25', '修改问题', '1', '[{\"added\": {}}]', '31', '1');
INSERT INTO `django_admin_log` VALUES ('142', '2020-03-26 19:29:55.451583', '26', '删除问题', '1', '[{\"added\": {}}]', '31', '1');
INSERT INTO `django_admin_log` VALUES ('143', '2020-03-26 19:32:09.609953', '27', '学生列表(导师查看学生记录)', '1', '[{\"added\": {}}]', '31', '1');
INSERT INTO `django_admin_log` VALUES ('144', '2020-03-26 19:33:47.409059', '28', '跟进学生记录列表', '1', '[{\"added\": {}}]', '31', '1');
INSERT INTO `django_admin_log` VALUES ('145', '2020-03-26 19:33:59.044801', '12', '跟进学生记录中心', '2', '[{\"changed\": {\"fields\": [\"\\u6807\\u9898\"]}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('146', '2020-03-26 19:34:46.365947', '29', '增加跟进学生记录', '1', '[{\"added\": {}}]', '31', '1');
INSERT INTO `django_admin_log` VALUES ('147', '2020-03-26 19:35:56.931877', '30', '修改学生跟进记录', '1', '[{\"added\": {}}]', '31', '1');
INSERT INTO `django_admin_log` VALUES ('148', '2020-03-26 19:36:58.485640', '31', '删除跟进学生记录', '1', '[{\"added\": {}}]', '31', '1');
INSERT INTO `django_admin_log` VALUES ('149', '2020-03-26 19:37:51.485206', '15', '回复学生问题中心', '2', '[{\"changed\": {\"fields\": [\"\\u6807\\u9898\"]}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('150', '2020-03-26 19:39:05.196036', '32', '回复学生问题列表(导师查看)', '1', '[{\"added\": {}}]', '31', '1');
INSERT INTO `django_admin_log` VALUES ('151', '2020-03-26 19:39:49.815714', '33', '回复学生问题', '1', '[{\"added\": {}}]', '31', '1');
INSERT INTO `django_admin_log` VALUES ('152', '2020-03-26 19:40:38.900748', '14', '批改作业中心', '2', '[{\"changed\": {\"fields\": [\"\\u6807\\u9898\"]}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('153', '2020-03-26 19:41:04.665642', '34', '批改作业列表', '1', '[{\"added\": {}}]', '31', '1');
INSERT INTO `django_admin_log` VALUES ('154', '2020-03-27 08:57:26.519922', '35', '上传批改作业', '1', '[{\"added\": {}}]', '31', '1');
INSERT INTO `django_admin_log` VALUES ('155', '2020-03-27 09:07:44.211405', '10', '视频', '2', '[{\"changed\": {\"fields\": [\"\\u542b\\u6b63\\u5219\\u7684URL\"]}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('156', '2020-03-27 09:13:08.477098', '10', '视频', '2', '[{\"changed\": {\"fields\": [\"\\u542b\\u6b63\\u5219\\u7684URL\"]}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('157', '2020-03-27 09:13:45.286255', '10', '视频', '2', '[{\"changed\": {\"fields\": [\"\\u542b\\u6b63\\u5219\\u7684URL\"]}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('158', '2020-03-27 09:24:09.314489', '10', '视频', '2', '[{\"changed\": {\"fields\": [\"\\u542b\\u6b63\\u5219\\u7684URL\"]}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('159', '2020-03-27 09:25:23.079396', '10', '视频', '2', '[{\"changed\": {\"fields\": [\"\\u542b\\u6b63\\u5219\\u7684URL\"]}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('160', '2020-03-27 09:27:17.421123', '4', '支付中心', '2', '[{\"changed\": {\"fields\": [\"\\u542b\\u6b63\\u5219\\u7684URL\"]}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('161', '2020-03-27 09:44:27.653642', '11', '作业', '2', '[{\"changed\": {\"fields\": [\"\\u542b\\u6b63\\u5219\\u7684URL\"]}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('162', '2020-03-27 09:44:44.430566', '13', '学生的所有跟进记录', '2', '[{\"changed\": {\"fields\": [\"\\u542b\\u6b63\\u5219\\u7684URL\"]}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('163', '2020-03-27 09:45:42.766049', '20', '编辑文章', '2', '[{\"changed\": {\"fields\": [\"\\u542b\\u6b63\\u5219\\u7684URL\"]}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('164', '2020-03-27 09:48:58.306018', '24', '课程详情', '2', '[{\"changed\": {\"fields\": [\"\\u542b\\u6b63\\u5219\\u7684URL\"]}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('165', '2020-03-27 10:44:17.087658', '1', 'HomeworkRecord object (1)', '2', '[{\"changed\": {\"fields\": [\"\\u4f5c\\u4e1a\\u6587\\u4ef6\"]}}]', '14', '1');
INSERT INTO `django_admin_log` VALUES ('166', '2020-03-27 10:49:08.139310', '36', '作业上传(学生)', '1', '[{\"added\": {}}]', '31', '1');
INSERT INTO `django_admin_log` VALUES ('167', '2020-03-27 10:50:50.115577', '11', '修改作业(评价作业)', '2', '[{\"changed\": {\"fields\": [\"\\u6807\\u9898\"]}}]', '31', '1');
INSERT INTO `django_admin_log` VALUES ('168', '2020-03-27 10:53:48.959320', '18', '资讯文章中心', '2', '[{\"changed\": {\"fields\": [\"\\u6807\\u9898\"]}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('169', '2020-03-27 10:54:07.774939', '19', '添加文章视图', '2', '[{\"changed\": {\"fields\": [\"\\u6807\\u9898\"]}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('170', '2020-03-27 10:54:18.782812', '20', '编辑文章视图', '2', '[{\"changed\": {\"fields\": [\"\\u6807\\u9898\"]}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('171', '2020-03-27 10:55:28.479657', '37', '文章咨询列表', '1', '[{\"added\": {}}]', '31', '1');
INSERT INTO `django_admin_log` VALUES ('172', '2020-03-27 10:56:17.444812', '38', '增加文章', '1', '[{\"added\": {}}]', '31', '1');
INSERT INTO `django_admin_log` VALUES ('173', '2020-03-27 10:58:14.849225', '39', '单个文章', '1', '[{\"added\": {}}]', '31', '1');
INSERT INTO `django_admin_log` VALUES ('174', '2020-03-27 10:58:52.958752', '40', '编译文章', '1', '[{\"added\": {}}]', '31', '1');
INSERT INTO `django_admin_log` VALUES ('175', '2020-03-27 10:59:28.820744', '41', '删除文章', '1', '[{\"added\": {}}]', '31', '1');
INSERT INTO `django_admin_log` VALUES ('176', '2020-03-27 11:01:26.338101', '26', '课程菜单', '2', '[{\"changed\": {\"fields\": [\"\\u6807\\u9898\"]}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('177', '2020-03-27 11:02:00.784226', '42', '课程列表', '1', '[{\"added\": {}}]', '31', '1');
INSERT INTO `django_admin_log` VALUES ('178', '2020-03-27 11:02:31.193189', '43', '增加课程', '1', '[{\"added\": {}}]', '31', '1');
INSERT INTO `django_admin_log` VALUES ('179', '2020-03-27 11:03:16.361422', '44', '修改课程', '1', '[{\"added\": {}}]', '31', '1');
INSERT INTO `django_admin_log` VALUES ('180', '2020-03-27 11:03:41.870656', '45', '删除课程', '1', '[{\"added\": {}}]', '31', '1');
INSERT INTO `django_admin_log` VALUES ('181', '2020-03-27 11:05:00.602447', '21', '追踪学员进度视图', '2', '[{\"changed\": {\"fields\": [\"\\u6807\\u9898\"]}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('182', '2020-03-27 11:12:57.539316', '46', '所有学生学习进度列表', '1', '[{\"added\": {}}]', '31', '1');
INSERT INTO `django_admin_log` VALUES ('183', '2020-03-27 11:15:25.320494', '47', '订单列表', '1', '[{\"added\": {}}]', '31', '1');
INSERT INTO `django_admin_log` VALUES ('184', '2020-03-27 11:15:46.288463', '48', '增加订单', '1', '[{\"added\": {}}]', '31', '1');
INSERT INTO `django_admin_log` VALUES ('185', '2020-03-27 11:16:06.270516', '49', '订单修改', '1', '[{\"added\": {}}]', '31', '1');
INSERT INTO `django_admin_log` VALUES ('186', '2020-03-27 11:16:15.594941', '49', '修改订单', '2', '[{\"changed\": {\"fields\": [\"\\u6807\\u9898\"]}}]', '31', '1');
INSERT INTO `django_admin_log` VALUES ('187', '2020-03-27 11:16:30.200290', '50', '删除订单', '1', '[{\"added\": {}}]', '31', '1');
INSERT INTO `django_admin_log` VALUES ('188', '2020-03-27 11:17:18.060459', '16', '查看报表视图', '2', '[{\"changed\": {\"fields\": [\"\\u6807\\u9898\"]}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('189', '2020-03-27 11:17:40.886336', '51', '报表列表', '1', '[{\"added\": {}}]', '31', '1');
INSERT INTO `django_admin_log` VALUES ('190', '2020-03-27 11:24:46.284807', '52', '导师跟进列表', '1', '[{\"added\": {}}]', '31', '1');
INSERT INTO `django_admin_log` VALUES ('191', '2020-03-27 11:26:22.667921', '17', '分配学员视图', '2', '[{\"changed\": {\"fields\": [\"\\u6807\\u9898\"]}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('192', '2020-03-27 11:27:06.074967', '53', '分配学员列表', '1', '[{\"added\": {}}]', '31', '1');
INSERT INTO `django_admin_log` VALUES ('193', '2020-03-27 11:28:10.709500', '54', '分配学员', '1', '[{\"added\": {}}]', '31', '1');
INSERT INTO `django_admin_log` VALUES ('194', '2020-03-27 13:12:06.357196', '5', 'xxxxxxxx', '1', '[{\"added\": {}}]', '25', '1');
INSERT INTO `django_admin_log` VALUES ('195', '2020-03-27 16:46:36.779310', '4', '超级管理员', '2', '[{\"changed\": {\"fields\": [\"Api\\u6743\\u9650\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('196', '2020-03-27 18:05:08.545503', '3', 'None(1个月)99.0', '1', '[{\"added\": {}}]', '16', '1');
INSERT INTO `django_admin_log` VALUES ('197', '2020-03-27 18:06:01.325255', '3', 'Linux课程(1个月)99.0', '2', '[{\"changed\": {\"fields\": [\"Object id\"]}}]', '16', '1');
INSERT INTO `django_admin_log` VALUES ('198', '2020-03-28 07:51:49.363359', '2', 'Linux课程', '1', '[{\"added\": {}}]', '17', '1');
INSERT INTO `django_admin_log` VALUES ('199', '2020-03-28 10:14:34.469846', '3', '学生', '2', '[{\"changed\": {\"fields\": [\"\\u6240\\u62e5\\u6709\\u7684\\u7684\\u6743\\u9650\", \"Api\\u6743\\u9650\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('200', '2020-03-28 14:42:49.118697', '1', '普通管理员', '2', '[{\"changed\": {\"fields\": [\"\\u89d2\\u8272\\u540d\\u79f0\", \"\\u6240\\u62e5\\u6709\\u7684\\u7684\\u6743\\u9650\", \"Api\\u6743\\u9650\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('201', '2020-03-28 14:44:47.407583', '2', '讲师', '2', '[{\"changed\": {\"fields\": [\"\\u6240\\u62e5\\u6709\\u7684\\u7684\\u6743\\u9650\", \"Api\\u6743\\u9650\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('202', '2020-03-28 14:45:30.674466', '2', 'b', '2', '[{\"changed\": {\"fields\": [\"\\u51fa\\u4efb\\u7684\\u89d2\\u8272\"]}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('203', '2020-03-28 14:45:39.594677', '3', 'c', '2', '[{\"changed\": {\"fields\": [\"\\u51fa\\u4efb\\u7684\\u89d2\\u8272\"]}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('204', '2020-03-29 11:51:58.189253', '4', 'Linux课程(12个月)199.0', '1', '[{\"added\": {}}]', '16', '1');
INSERT INTO `django_admin_log` VALUES ('205', '2020-03-31 20:01:35.148675', '30', '修改学生跟进记录', '2', '[{\"changed\": {\"fields\": [\"\\u8bf7\\u6c42\\u65b9\\u5f0f\"]}}]', '31', '1');
INSERT INTO `django_admin_log` VALUES ('206', '2020-03-31 20:17:02.933777', '4', '折扣券(全局优惠卷2)', '2', '[{\"changed\": {\"fields\": [\"\\u6709\\u6548\\u7ed3\\u675f\\u65f6\\u95f4\"]}}]', '24', '1');
INSERT INTO `django_admin_log` VALUES ('207', '2020-03-31 20:17:10.404750', '3', '折扣券(课程优惠卷2)', '2', '[{\"changed\": {\"fields\": [\"\\u6709\\u6548\\u7ed3\\u675f\\u65f6\\u95f4\"]}}]', '24', '1');
INSERT INTO `django_admin_log` VALUES ('208', '2020-03-31 20:17:18.634160', '2', '通用券(全局优惠卷名称)', '2', '[{\"changed\": {\"fields\": [\"\\u6709\\u6548\\u7ed3\\u675f\\u65f6\\u95f4\"]}}]', '24', '1');
INSERT INTO `django_admin_log` VALUES ('209', '2020-03-31 20:17:27.889746', '1', '通用券(课程优惠卷名称)', '2', '[{\"changed\": {\"fields\": [\"\\u6709\\u6548\\u7ed3\\u675f\\u65f6\\u95f4\"]}}]', '24', '1');

-- ----------------------------
-- Table structure for `django_content_type`
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('4', 'auth', 'user');
INSERT INTO `django_content_type` VALUES ('5', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('30', 'manager', 'article');
INSERT INTO `django_content_type` VALUES ('31', 'rbac', 'apipermission');
INSERT INTO `django_content_type` VALUES ('11', 'rbac', 'firstmenu');
INSERT INTO `django_content_type` VALUES ('7', 'rbac', 'icon');
INSERT INTO `django_content_type` VALUES ('8', 'rbac', 'permission');
INSERT INTO `django_content_type` VALUES ('9', 'rbac', 'role');
INSERT INTO `django_content_type` VALUES ('10', 'rbac', 'userinfo');
INSERT INTO `django_content_type` VALUES ('6', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('22', 'student', 'category');
INSERT INTO `django_content_type` VALUES ('24', 'student', 'coupon');
INSERT INTO `django_content_type` VALUES ('28', 'student', 'couponrecord');
INSERT INTO `django_content_type` VALUES ('20', 'student', 'course');
INSERT INTO `django_content_type` VALUES ('19', 'student', 'coursechapter');
INSERT INTO `django_content_type` VALUES ('17', 'student', 'coursedetail');
INSERT INTO `django_content_type` VALUES ('21', 'student', 'coursesection');
INSERT INTO `django_content_type` VALUES ('18', 'student', 'degreecourse');
INSERT INTO `django_content_type` VALUES ('25', 'student', 'order');
INSERT INTO `django_content_type` VALUES ('27', 'student', 'orderdetail');
INSERT INTO `django_content_type` VALUES ('16', 'student', 'pricepolicy');
INSERT INTO `django_content_type` VALUES ('13', 'student', 'question');
INSERT INTO `django_content_type` VALUES ('23', 'student', 'shoppingcart');
INSERT INTO `django_content_type` VALUES ('29', 'student', 'studycourse');
INSERT INTO `django_content_type` VALUES ('26', 'student', 'transactionrecord');
INSERT INTO `django_content_type` VALUES ('15', 'teacher', 'homework');
INSERT INTO `django_content_type` VALUES ('14', 'teacher', 'homeworkrecord');
INSERT INTO `django_content_type` VALUES ('12', 'teacher', 'studentrecord');

-- ----------------------------
-- Table structure for `django_migrations`
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2020-03-03 20:36:22.625289');
INSERT INTO `django_migrations` VALUES ('2', 'auth', '0001_initial', '2020-03-03 20:36:25.486384');
INSERT INTO `django_migrations` VALUES ('3', 'admin', '0001_initial', '2020-03-03 20:36:33.298999');
INSERT INTO `django_migrations` VALUES ('4', 'admin', '0002_logentry_remove_auto_add', '2020-03-03 20:36:36.158393');
INSERT INTO `django_migrations` VALUES ('5', 'admin', '0003_logentry_add_action_flag_choices', '2020-03-03 20:36:36.220893');
INSERT INTO `django_migrations` VALUES ('6', 'contenttypes', '0002_remove_content_type_name', '2020-03-03 20:36:37.502194');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0002_alter_permission_name_max_length', '2020-03-03 20:36:38.549026');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0003_alter_user_email_max_length', '2020-03-03 20:36:39.689680');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0004_alter_user_username_opts', '2020-03-03 20:36:39.799070');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0005_alter_user_last_login_null', '2020-03-03 20:36:40.658434');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0006_require_contenttypes_0002', '2020-03-03 20:36:40.705305');
INSERT INTO `django_migrations` VALUES ('12', 'auth', '0007_alter_validators_add_error_messages', '2020-03-03 20:36:40.814678');
INSERT INTO `django_migrations` VALUES ('13', 'auth', '0008_alter_user_username_max_length', '2020-03-03 20:36:41.752186');
INSERT INTO `django_migrations` VALUES ('14', 'auth', '0009_alter_user_last_name_max_length', '2020-03-03 20:36:42.705338');
INSERT INTO `django_migrations` VALUES ('15', 'auth', '0010_alter_group_name_max_length', '2020-03-03 20:36:43.799137');
INSERT INTO `django_migrations` VALUES ('16', 'auth', '0011_update_proxy_permissions', '2020-03-03 20:36:43.892838');
INSERT INTO `django_migrations` VALUES ('17', 'rbac', '0001_initial', '2020-03-03 20:36:46.955371');
INSERT INTO `django_migrations` VALUES ('18', 'rbac', '0002_firstmenu', '2020-03-03 20:36:56.002373');
INSERT INTO `django_migrations` VALUES ('19', 'rbac', '0003_auto_20200303_1832', '2020-03-03 20:36:57.267984');
INSERT INTO `django_migrations` VALUES ('20', 'rbac', '0004_auto_20200303_1834', '2020-03-03 20:37:00.283657');
INSERT INTO `django_migrations` VALUES ('21', 'rbac', '0005_auto_20200303_2036', '2020-03-03 20:37:01.408670');
INSERT INTO `django_migrations` VALUES ('22', 'sessions', '0001_initial', '2020-03-03 20:37:01.971176');
INSERT INTO `django_migrations` VALUES ('23', 'rbac', '0006_icon_title', '2020-03-04 13:34:27.757062');
INSERT INTO `django_migrations` VALUES ('24', 'rbac', '0007_auto_20200305_2149', '2020-03-05 21:49:15.013278');
INSERT INTO `django_migrations` VALUES ('25', 'rbac', '0008_auto_20200306_1008', '2020-03-06 10:08:13.396711');
INSERT INTO `django_migrations` VALUES ('26', 'rbac', '0009_permission_router_name', '2020-03-07 15:06:46.918023');
INSERT INTO `django_migrations` VALUES ('27', 'rbac', '0010_remove_firstmenu_icon', '2020-03-07 17:25:40.546019');
INSERT INTO `django_migrations` VALUES ('28', 'rbac', '0011_auto_20200308_1652', '2020-03-08 16:52:35.101651');
INSERT INTO `django_migrations` VALUES ('29', 'rbac', '0012_userinfo_shop_cart_num', '2020-03-11 08:41:39.294027');
INSERT INTO `django_migrations` VALUES ('30', 'teacher', '0001_initial', '2020-03-12 20:01:36.275724');
INSERT INTO `django_migrations` VALUES ('31', 'rbac', '0013_userinfo_student', '2020-03-13 10:49:01.164068');
INSERT INTO `django_migrations` VALUES ('32', 'rbac', '0014_auto_20200313_1226', '2020-03-13 12:26:34.377198');
INSERT INTO `django_migrations` VALUES ('33', 'rbac', '0015_auto_20200313_1228', '2020-03-13 12:28:33.505302');
INSERT INTO `django_migrations` VALUES ('34', 'rbac', '0016_auto_20200313_1232', '2020-03-13 12:32:31.103437');
INSERT INTO `django_migrations` VALUES ('35', 'student', '0001_initial', '2020-03-13 19:44:12.114682');
INSERT INTO `django_migrations` VALUES ('36', 'teacher', '0002_auto_20200313_1943', '2020-03-13 19:44:17.913883');
INSERT INTO `django_migrations` VALUES ('37', 'student', '0002_auto_20200314_0854', '2020-03-14 08:54:48.853908');
INSERT INTO `django_migrations` VALUES ('38', 'teacher', '0003_homework_homeworkrecord', '2020-03-14 09:39:55.887895');
INSERT INTO `django_migrations` VALUES ('39', 'teacher', '0004_auto_20200314_1053', '2020-03-14 10:53:29.929244');
INSERT INTO `django_migrations` VALUES ('40', 'teacher', '0005_auto_20200314_1055', '2020-03-14 10:55:32.804874');
INSERT INTO `django_migrations` VALUES ('41', 'student', '0003_auto_20200315_1039', '2020-03-15 10:39:31.793224');
INSERT INTO `django_migrations` VALUES ('42', 'student', '0004_shoppingcart', '2020-03-15 19:32:38.582214');
INSERT INTO `django_migrations` VALUES ('43', 'student', '0005_auto_20200315_2002', '2020-03-15 20:02:29.386245');
INSERT INTO `django_migrations` VALUES ('44', 'student', '0006_shoppingcart_price_policy', '2020-03-16 09:09:08.155087');
INSERT INTO `django_migrations` VALUES ('45', 'student', '0007_delete_shoppingcart', '2020-03-16 10:49:27.636231');
INSERT INTO `django_migrations` VALUES ('46', 'rbac', '0017_userinfo_balance', '2020-03-17 09:06:08.550925');
INSERT INTO `django_migrations` VALUES ('47', 'student', '0008_coupon_couponrecord_order_orderdetail_transactionrecord', '2020-03-17 09:06:12.195317');
INSERT INTO `django_migrations` VALUES ('48', 'student', '0009_auto_20200317_0905', '2020-03-17 09:06:27.936980');
INSERT INTO `django_migrations` VALUES ('49', 'rbac', '0018_auto_20200320_1132', '2020-03-20 11:32:49.629219');
INSERT INTO `django_migrations` VALUES ('50', 'student', '0010_auto_20200320_1132', '2020-03-20 11:32:51.803963');
INSERT INTO `django_migrations` VALUES ('51', 'student', '0011_studycourse', '2020-03-20 15:14:52.686306');
INSERT INTO `django_migrations` VALUES ('52', 'teacher', '0006_auto_20200320_1514', '2020-03-20 15:14:59.124602');
INSERT INTO `django_migrations` VALUES ('53', 'student', '0012_auto_20200320_1515', '2020-03-20 15:15:48.637784');
INSERT INTO `django_migrations` VALUES ('54', 'teacher', '0007_auto_20200320_1859', '2020-03-20 18:59:14.057677');
INSERT INTO `django_migrations` VALUES ('55', 'rbac', '0019_userinfo_date', '2020-03-22 12:47:11.136612');
INSERT INTO `django_migrations` VALUES ('56', 'rbac', '0020_auto_20200322_1248', '2020-03-22 12:48:58.278897');
INSERT INTO `django_migrations` VALUES ('57', 'manager', '0001_initial', '2020-03-22 19:09:09.522143');
INSERT INTO `django_migrations` VALUES ('58', 'manager', '0002_auto_20200322_1909', '2020-03-22 19:09:54.893161');
INSERT INTO `django_migrations` VALUES ('59', 'rbac', '0021_userinfo_learning_process', '2020-03-23 14:37:54.749206');
INSERT INTO `django_migrations` VALUES ('60', 'rbac', '0022_auto_20200323_1454', '2020-03-23 14:54:06.840824');
INSERT INTO `django_migrations` VALUES ('61', 'rbac', '0023_auto_20200324_1003', '2020-03-24 10:03:44.505658');
INSERT INTO `django_migrations` VALUES ('62', 'rbac', '0024_permission_hidden', '2020-03-24 10:32:03.769426');
INSERT INTO `django_migrations` VALUES ('63', 'rbac', '0025_auto_20200324_1334', '2020-03-24 13:34:27.622913');
INSERT INTO `django_migrations` VALUES ('64', 'rbac', '0026_auto_20200324_1345', '2020-03-24 13:45:29.459032');
INSERT INTO `django_migrations` VALUES ('65', 'rbac', '0027_auto_20200324_1615', '2020-03-24 16:15:17.403493');
INSERT INTO `django_migrations` VALUES ('66', 'rbac', '0028_auto_20200324_1741', '2020-03-24 17:41:25.990312');
INSERT INTO `django_migrations` VALUES ('67', 'student', '0013_auto_20200325_1604', '2020-03-25 16:04:44.797244');
INSERT INTO `django_migrations` VALUES ('68', 'rbac', '0029_apipermission', '2020-03-26 08:36:07.752300');
INSERT INTO `django_migrations` VALUES ('69', 'rbac', '0030_auto_20200326_0906', '2020-03-26 09:06:40.558659');
INSERT INTO `django_migrations` VALUES ('70', 'rbac', '0031_role_api_permissions', '2020-03-26 09:21:57.339250');
INSERT INTO `django_migrations` VALUES ('71', 'rbac', '0032_auto_20200326_1435', '2020-03-26 14:35:18.322568');
INSERT INTO `django_migrations` VALUES ('72', 'rbac', '0033_auto_20200326_1636', '2020-03-26 16:36:04.419337');
INSERT INTO `django_migrations` VALUES ('73', 'student', '0014_auto_20200327_1736', '2020-03-27 17:36:45.842050');

-- ----------------------------
-- Table structure for `django_session`
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
INSERT INTO `django_session` VALUES ('33exr3nekxm86il9b6iv26blbuk1hui4', 'MTgyOGM2M2NlNTk1NmMwZmRmNGYzZDhkODYyN2Q0MjBlNWFjMzNlNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0ZGIwYWEzYzcxM2QzM2ZiY2MyZmY1YTJmZTZlNGM3MWVlYWE5MWQ3In0=', '2020-03-27 10:49:28.498371');
INSERT INTO `django_session` VALUES ('c656v0n575r7v9e6jjbhavgm21deu9cf', 'MTgyOGM2M2NlNTk1NmMwZmRmNGYzZDhkODYyN2Q0MjBlNWFjMzNlNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0ZGIwYWEzYzcxM2QzM2ZiY2MyZmY1YTJmZTZlNGM3MWVlYWE5MWQ3In0=', '2020-03-19 22:06:15.143155');
INSERT INTO `django_session` VALUES ('dldjoowslls03mw5xmqgvi4jtdsieza2', 'MTgyOGM2M2NlNTk1NmMwZmRmNGYzZDhkODYyN2Q0MjBlNWFjMzNlNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0ZGIwYWEzYzcxM2QzM2ZiY2MyZmY1YTJmZTZlNGM3MWVlYWE5MWQ3In0=', '2020-04-10 10:50:15.352028');

-- ----------------------------
-- Table structure for `manager--资讯文章表`
-- ----------------------------
DROP TABLE IF EXISTS `manager--资讯文章表`;
CREATE TABLE `manager--资讯文章表` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `content` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `manager--咨询文章表_user_id_5d65c963_fk_rbac-用户表_id` (`user_id`),
  CONSTRAINT `manager--咨询文章表_user_id_5d65c963_fk_rbac-用户表_id` FOREIGN KEY (`user_id`) REFERENCES `rbac-用户表` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of manager--资讯文章表
-- ----------------------------
INSERT INTO `manager--资讯文章表` VALUES ('1', '标题', '2020-03-22 23:10:12.681683', '<p>内容11</p>', '1');

-- ----------------------------
-- Table structure for `rbac-api权限表`
-- ----------------------------
DROP TABLE IF EXISTS `rbac-api权限表`;
CREATE TABLE `rbac-api权限表` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) DEFAULT NULL,
  `url` varchar(128) DEFAULT NULL,
  `method` int(11) NOT NULL,
  `permission_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rbac-api权限表_permission_id_bd67cdc2_fk_rbac-权限表_id` (`permission_id`),
  CONSTRAINT `rbac-api权限表_permission_id_bd67cdc2_fk_rbac-权限表_id` FOREIGN KEY (`permission_id`) REFERENCES `rbac-权限表` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rbac-api权限表
-- ----------------------------
INSERT INTO `rbac-api权限表` VALUES ('1', '购物车列表', '/shopping_cart/', '1', '1');
INSERT INTO `rbac-api权限表` VALUES ('2', '添加购物车', '/shopping_cart/', '2', '1');
INSERT INTO `rbac-api权限表` VALUES ('3', '修改购物车', '/shopping_cart/', '3', '1');
INSERT INTO `rbac-api权限表` VALUES ('4', '删除购物车', '/shopping_cart/', '5', '1');
INSERT INTO `rbac-api权限表` VALUES ('5', '我的教室列表', '/classroom/', '1', '5');
INSERT INTO `rbac-api权限表` VALUES ('6', '学习进度', '/learning_progress/(\\d+)/', '4', '5');
INSERT INTO `rbac-api权限表` VALUES ('7', '路飞课程', '/course/', '1', '9');
INSERT INTO `rbac-api权限表` VALUES ('8', '路飞课程详情', '/course_detail/', '1', '24');
INSERT INTO `rbac-api权限表` VALUES ('9', '课程分类', '/category/', '1', '9');
INSERT INTO `rbac-api权限表` VALUES ('10', '作业列表', '/homework/(\\d+)/', '1', '11');
INSERT INTO `rbac-api权限表` VALUES ('11', '修改作业(评价作业)', '/homework/(\\d+)/', '3', '11');
INSERT INTO `rbac-api权限表` VALUES ('12', '订单列表', '/order/', '1', '3');
INSERT INTO `rbac-api权限表` VALUES ('13', '订单支付', '/order/', '3', '4');
INSERT INTO `rbac-api权限表` VALUES ('14', '提交支付请求(核对并生成订单)', '/payment/', '2', '2');
INSERT INTO `rbac-api权限表` VALUES ('15', '视频课时列表', '/section/(\\d+)/', '1', '10');
INSERT INTO `rbac-api权限表` VALUES ('16', '结算列表', '/settlement/', '1', '2');
INSERT INTO `rbac-api权限表` VALUES ('17', '增加结算中心', '/settlement/', '2', '2');
INSERT INTO `rbac-api权限表` VALUES ('18', '修改结算中心(优惠卷)', '/settlement/', '3', '2');
INSERT INTO `rbac-api权限表` VALUES ('19', '购物车列表', '/shopping_cart/', '1', '1');
INSERT INTO `rbac-api权限表` VALUES ('20', '增加购物车', '/shopping_cart/', '2', '1');
INSERT INTO `rbac-api权限表` VALUES ('21', '修改购物车(更改价格策略)', '/shopping_cart/', '3', '1');
INSERT INTO `rbac-api权限表` VALUES ('22', '删除购物车', '/shopping_cart/', '5', '1');
INSERT INTO `rbac-api权限表` VALUES ('23', '提问题列表', '/student_question/', '1', '25');
INSERT INTO `rbac-api权限表` VALUES ('24', '增加问题', '/student_question/', '2', '25');
INSERT INTO `rbac-api权限表` VALUES ('25', '修改问题', '/student_question/(\\d+)/', '4', '25');
INSERT INTO `rbac-api权限表` VALUES ('26', '删除问题', '/student_question/(\\d+)/', '5', '25');
INSERT INTO `rbac-api权限表` VALUES ('27', '学生列表(导师查看学生记录)', '/student_list/', '1', '13');
INSERT INTO `rbac-api权限表` VALUES ('28', '跟进学生记录列表', '/student_record_list/(\\d+)/', '1', '12');
INSERT INTO `rbac-api权限表` VALUES ('29', '增加跟进学生记录', '/student_record/', '2', '12');
INSERT INTO `rbac-api权限表` VALUES ('30', '修改学生跟进记录', '/student_record/(\\d+)/', '4', '12');
INSERT INTO `rbac-api权限表` VALUES ('31', '删除跟进学生记录', '/student_record/(\\d+)/', '5', '12');
INSERT INTO `rbac-api权限表` VALUES ('32', '回复学生问题列表(导师查看)', '/teacher_answer/', '1', '15');
INSERT INTO `rbac-api权限表` VALUES ('33', '回复学生问题', '/teacher_answer/(\\d+)/', '4', '15');
INSERT INTO `rbac-api权限表` VALUES ('34', '批改作业列表', '/teacher_correction/', '1', '14');
INSERT INTO `rbac-api权限表` VALUES ('35', '上传批改作业', '/correction_file/(\\d+)/', '2', '14');
INSERT INTO `rbac-api权限表` VALUES ('36', '作业上传(学生)', '/homework_file/(\\d+)/', '2', '11');
INSERT INTO `rbac-api权限表` VALUES ('37', '文章咨询列表', '/article/', '1', '18');
INSERT INTO `rbac-api权限表` VALUES ('38', '增加文章', '/article/', '2', '19');
INSERT INTO `rbac-api权限表` VALUES ('39', '单个文章', '/article/(\\d+)/', '1', '20');
INSERT INTO `rbac-api权限表` VALUES ('40', '编译文章', '/article/(\\d+)/', '4', '20');
INSERT INTO `rbac-api权限表` VALUES ('41', '删除文章', '/article/(\\d+)/', '5', '18');
INSERT INTO `rbac-api权限表` VALUES ('42', '课程列表', '/course_menu/', '1', '26');
INSERT INTO `rbac-api权限表` VALUES ('43', '增加课程', '/course_menu/', '2', '26');
INSERT INTO `rbac-api权限表` VALUES ('44', '修改课程', '/course_menu/(\\d+)/', '4', '26');
INSERT INTO `rbac-api权限表` VALUES ('45', '删除课程', '/course_menu/(\\d+)/', '5', '26');
INSERT INTO `rbac-api权限表` VALUES ('46', '所有学生学习进度列表', '/learning_progress/', '1', '21');
INSERT INTO `rbac-api权限表` VALUES ('47', '订单列表', '/order_menu/', '1', '23');
INSERT INTO `rbac-api权限表` VALUES ('48', '增加订单', '/order_menu/', '2', '23');
INSERT INTO `rbac-api权限表` VALUES ('49', '修改订单', '/order_menu/(\\d+)/', '4', '23');
INSERT INTO `rbac-api权限表` VALUES ('50', '删除订单', '/order_menu/(\\d+)/', '5', '23');
INSERT INTO `rbac-api权限表` VALUES ('51', '报表列表', '/report_forms/', '1', '16');
INSERT INTO `rbac-api权限表` VALUES ('52', '导师跟进列表', '/teacher_record/', '1', '22');
INSERT INTO `rbac-api权限表` VALUES ('53', '分配学员列表', '/dis_stu/', '1', '17');
INSERT INTO `rbac-api权限表` VALUES ('54', '分配学员', '/dis_stu/(\\d+)/', '4', '17');

-- ----------------------------
-- Table structure for `rbac-一级菜单表`
-- ----------------------------
DROP TABLE IF EXISTS `rbac-一级菜单表`;
CREATE TABLE `rbac-一级菜单表` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `component` varchar(32) DEFAULT NULL,
  `path` varchar(128) DEFAULT NULL,
  `redirect` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rbac-一级菜单表
-- ----------------------------
INSERT INTO `rbac-一级菜单表` VALUES ('1', '学生管理', 'layout', '/', '/home');
INSERT INTO `rbac-一级菜单表` VALUES ('2', '导师管理', 'layout', '/', '/home');
INSERT INTO `rbac-一级菜单表` VALUES ('3', '管理员管理', 'layout', '/', '/home');
INSERT INTO `rbac-一级菜单表` VALUES ('4', '学校管理', 'layout', '/', '/home');
INSERT INTO `rbac-一级菜单表` VALUES ('5', '作业管理', 'layout', '/', '/home');
INSERT INTO `rbac-一级菜单表` VALUES ('6', '测试', 'layout', '/', '/home');
INSERT INTO `rbac-一级菜单表` VALUES ('7', '测试1', 'layout', '/', '/home');

-- ----------------------------
-- Table structure for `rbac-权限表`
-- ----------------------------
DROP TABLE IF EXISTS `rbac-权限表`;
CREATE TABLE `rbac-权限表` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstmenu_id` int(11) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `parent_permission_id` int(11) DEFAULT NULL,
  `title` varchar(32) DEFAULT NULL,
  `path` varchar(128) DEFAULT NULL,
  `component` varchar(32) DEFAULT NULL,
  `hidden` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rbac_permission_firstmenu_id_71460ceb_fk_rbac_firstmenu_id` (`firstmenu_id`),
  KEY `rbac_permission_parent_permission_id_eab0f039_fk_rbac_perm` (`parent_permission_id`),
  CONSTRAINT `rbac_permission_firstmenu_id_71460ceb_fk_rbac_firstmenu_id` FOREIGN KEY (`firstmenu_id`) REFERENCES `rbac-一级菜单表` (`id`),
  CONSTRAINT `rbac_permission_parent_permission_id_eab0f039_fk_rbac_perm` FOREIGN KEY (`parent_permission_id`) REFERENCES `rbac-权限表` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rbac-权限表
-- ----------------------------
INSERT INTO `rbac-权限表` VALUES ('1', '1', 'shopping_cart', null, '购物车中心', '/shopping_cart', 'shopping/shopping_cart', '0');
INSERT INTO `rbac-权限表` VALUES ('2', '1', 'settlement', null, '结算中心', '/settlement', 'shopping/settlement', '0');
INSERT INTO `rbac-权限表` VALUES ('3', '1', 'order', null, '订单中心', '/order', 'order/order', '0');
INSERT INTO `rbac-权限表` VALUES ('4', '1', 'payment', null, '支付中心', '/payment/:actualTotal(\\d+)/:orderId(\\d+)', 'shopping/payment', '1');
INSERT INTO `rbac-权限表` VALUES ('5', '1', 'classroom', null, '我的教室', '/classroom', 'classroom/index', '0');
INSERT INTO `rbac-权限表` VALUES ('9', '1', 'course', null, '课程', '/course', 'course/course.vue', '0');
INSERT INTO `rbac-权限表` VALUES ('10', '1', 'video', null, '视频', '/vide/:cid(\\d+)', 'video/index', '1');
INSERT INTO `rbac-权限表` VALUES ('11', '1', 'homework', null, '作业', '/homework/:cid(\\d+)', 'homework/index', '1');
INSERT INTO `rbac-权限表` VALUES ('12', '2', 'student_list', null, '跟进学生记录中心', '/student_list', 'student_list/index', '0');
INSERT INTO `rbac-权限表` VALUES ('13', '2', 'student_record', null, '学生的所有跟进记录', '/student_record/:sid(\\d+)', 'student_record/index', '1');
INSERT INTO `rbac-权限表` VALUES ('14', '2', 'correction', null, '批改作业中心', '/homework/correction', 'homework/correction', '0');
INSERT INTO `rbac-权限表` VALUES ('15', '2', 'answer_question', null, '回复学生问题中心', '/student_question/answer', 'student_question/answer', '0');
INSERT INTO `rbac-权限表` VALUES ('16', '3', 'report_forms', null, '查看报表视图', '/report_forms', 'report_forms/index', '0');
INSERT INTO `rbac-权限表` VALUES ('17', '3', 'dis_stu', null, '分配学员视图', '/dis_stu', 'dis_stu/index', '0');
INSERT INTO `rbac-权限表` VALUES ('18', '3', 'article', null, '资讯文章中心', '/article', 'article/index', '0');
INSERT INTO `rbac-权限表` VALUES ('19', '3', 'article_add', null, '添加文章视图', '/article/add', 'article/add', '1');
INSERT INTO `rbac-权限表` VALUES ('20', '3', 'article_edit', null, '编辑文章视图', '/article/edit/:id(\\d+)', 'article/edit', '1');
INSERT INTO `rbac-权限表` VALUES ('21', '3', 'learning_progress', null, '追踪学员进度视图', '/learning_progress', 'learning_progress/index', '0');
INSERT INTO `rbac-权限表` VALUES ('22', '3', 'teacher_record', null, '导师跟进管理', '/teacher_record', 'teacher_record/index', '0');
INSERT INTO `rbac-权限表` VALUES ('23', '3', 'order_menu', null, '订单管理', '/order_menu', 'order/index', '0');
INSERT INTO `rbac-权限表` VALUES ('24', '1', 'course_detail', null, '课程详情', '/course/detail/:cid(\\d+)', 'course/CourseDetail', '1');
INSERT INTO `rbac-权限表` VALUES ('25', '1', 'student_question', null, '提问题中心', '/student_question', 'student_question/index', '0');
INSERT INTO `rbac-权限表` VALUES ('26', '3', 'course_menu', null, '课程菜单', '/course_menu', 'course/index', '0');

-- ----------------------------
-- Table structure for `rbac-用户表`
-- ----------------------------
DROP TABLE IF EXISTS `rbac-用户表`;
CREATE TABLE `rbac-用户表` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(64) DEFAULT NULL,
  `shop_cart_num` varchar(32) NOT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `balance` double NOT NULL,
  `date` datetime(6) NOT NULL,
  `learning_progress` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `rbac-用户表_teacher_id_23297eea_fk_rbac-用户表_id` (`teacher_id`),
  CONSTRAINT `rbac-用户表_teacher_id_23297eea_fk_rbac-用户表_id` FOREIGN KEY (`teacher_id`) REFERENCES `rbac-用户表` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rbac-用户表
-- ----------------------------
INSERT INTO `rbac-用户表` VALUES ('1', 'a', '123', '0', '2', '10', '2020-03-01 12:47:24.000000', '我是第二章');
INSERT INTO `rbac-用户表` VALUES ('2', 'b', '123', '0', null, '0', '2020-03-02 12:47:32.000000', null);
INSERT INTO `rbac-用户表` VALUES ('3', 'c', '123', '0', null, '0', '2020-03-03 12:47:37.000000', null);
INSERT INTO `rbac-用户表` VALUES ('4', 'd', '123', '0', null, '0', '2020-03-04 12:47:43.000000', null);
INSERT INTO `rbac-用户表` VALUES ('5', 'f', '123', '0', '1', '0', '2020-03-05 12:47:48.000000', null);

-- ----------------------------
-- Table structure for `rbac-用户表_roles`
-- ----------------------------
DROP TABLE IF EXISTS `rbac-用户表_roles`;
CREATE TABLE `rbac-用户表_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userinfo_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rbac_userinfo_roles_userinfo_id_role_id_aeda2126_uniq` (`userinfo_id`,`role_id`),
  KEY `rbac_userinfo_roles_role_id_7554e792_fk_rbac_role_id` (`role_id`),
  CONSTRAINT `rbac_userinfo_roles_role_id_7554e792_fk_rbac_role_id` FOREIGN KEY (`role_id`) REFERENCES `rbac-角色表` (`id`),
  CONSTRAINT `rbac_userinfo_roles_userinfo_id_2da02bea_fk_rbac_userinfo_id` FOREIGN KEY (`userinfo_id`) REFERENCES `rbac-用户表` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rbac-用户表_roles
-- ----------------------------
INSERT INTO `rbac-用户表_roles` VALUES ('1', '1', '1');
INSERT INTO `rbac-用户表_roles` VALUES ('2', '1', '2');
INSERT INTO `rbac-用户表_roles` VALUES ('9', '1', '3');
INSERT INTO `rbac-用户表_roles` VALUES ('4', '1', '4');
INSERT INTO `rbac-用户表_roles` VALUES ('6', '2', '2');
INSERT INTO `rbac-用户表_roles` VALUES ('10', '3', '1');
INSERT INTO `rbac-用户表_roles` VALUES ('8', '4', '2');
INSERT INTO `rbac-用户表_roles` VALUES ('7', '5', '3');

-- ----------------------------
-- Table structure for `rbac-角色表`
-- ----------------------------
DROP TABLE IF EXISTS `rbac-角色表`;
CREATE TABLE `rbac-角色表` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rbac-角色表
-- ----------------------------
INSERT INTO `rbac-角色表` VALUES ('1', '普通管理员');
INSERT INTO `rbac-角色表` VALUES ('2', '讲师');
INSERT INTO `rbac-角色表` VALUES ('3', '学生');
INSERT INTO `rbac-角色表` VALUES ('4', '超级管理员');

-- ----------------------------
-- Table structure for `rbac-角色表_api_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `rbac-角色表_api_permissions`;
CREATE TABLE `rbac-角色表_api_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `apipermission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rbac-角色表_api_permissions_role_id_apipermission_id_519817e6_uniq` (`role_id`,`apipermission_id`),
  KEY `rbac-角色表_api_permiss_apipermission_id_114ab253_fk_rbac-api权` (`apipermission_id`),
  CONSTRAINT `rbac-角色表_api_permiss_apipermission_id_114ab253_fk_rbac-api权` FOREIGN KEY (`apipermission_id`) REFERENCES `rbac-api权限表` (`id`),
  CONSTRAINT `rbac-角色表_api_permissions_role_id_32e7d696_fk_rbac-角色表_id` FOREIGN KEY (`role_id`) REFERENCES `rbac-角色表` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rbac-角色表_api_permissions
-- ----------------------------
INSERT INTO `rbac-角色表_api_permissions` VALUES ('82', '1', '37');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('83', '1', '38');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('84', '1', '39');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('85', '1', '40');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('86', '1', '41');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('87', '1', '42');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('88', '1', '43');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('89', '1', '44');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('90', '1', '45');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('91', '1', '46');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('92', '1', '47');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('93', '1', '48');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('94', '1', '49');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('95', '1', '50');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('96', '1', '51');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('97', '1', '52');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('98', '1', '53');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('99', '1', '54');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('104', '2', '27');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('105', '2', '28');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('106', '2', '29');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('107', '2', '30');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('108', '2', '31');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('100', '2', '32');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('101', '2', '33');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('102', '2', '34');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('103', '2', '35');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('55', '3', '1');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('56', '3', '2');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('57', '3', '3');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('58', '3', '4');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('59', '3', '5');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('60', '3', '6');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('61', '3', '7');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('62', '3', '8');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('63', '3', '9');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('64', '3', '10');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('65', '3', '11');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('66', '3', '12');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('67', '3', '13');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('68', '3', '14');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('69', '3', '15');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('70', '3', '16');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('71', '3', '17');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('72', '3', '18');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('73', '3', '19');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('74', '3', '20');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('75', '3', '21');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('76', '3', '22');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('77', '3', '23');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('78', '3', '24');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('79', '3', '25');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('80', '3', '26');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('81', '3', '36');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('1', '4', '1');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('2', '4', '2');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('3', '4', '3');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('4', '4', '4');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('5', '4', '5');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('6', '4', '6');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('7', '4', '7');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('8', '4', '8');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('9', '4', '9');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('10', '4', '10');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('11', '4', '11');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('12', '4', '12');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('13', '4', '13');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('14', '4', '14');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('15', '4', '15');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('16', '4', '16');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('17', '4', '17');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('18', '4', '18');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('19', '4', '19');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('20', '4', '20');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('21', '4', '21');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('22', '4', '22');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('23', '4', '23');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('24', '4', '24');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('25', '4', '25');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('26', '4', '26');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('27', '4', '27');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('28', '4', '28');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('29', '4', '29');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('30', '4', '30');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('31', '4', '31');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('32', '4', '32');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('33', '4', '33');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('34', '4', '34');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('35', '4', '35');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('36', '4', '36');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('37', '4', '37');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('38', '4', '38');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('39', '4', '39');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('40', '4', '40');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('41', '4', '41');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('42', '4', '42');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('43', '4', '43');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('44', '4', '44');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('45', '4', '45');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('46', '4', '46');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('47', '4', '47');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('48', '4', '48');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('49', '4', '49');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('50', '4', '50');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('51', '4', '51');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('52', '4', '52');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('53', '4', '53');
INSERT INTO `rbac-角色表_api_permissions` VALUES ('54', '4', '54');

-- ----------------------------
-- Table structure for `rbac-角色表_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `rbac-角色表_permissions`;
CREATE TABLE `rbac-角色表_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rbac_role_permissions_role_id_permission_id_d01303da_uniq` (`role_id`,`permission_id`),
  KEY `rbac_role_permission_permission_id_f5e1e866_fk_rbac_perm` (`permission_id`),
  CONSTRAINT `rbac_role_permission_permission_id_f5e1e866_fk_rbac_perm` FOREIGN KEY (`permission_id`) REFERENCES `rbac-权限表` (`id`),
  CONSTRAINT `rbac_role_permissions_role_id_d10416cb_fk_rbac_role_id` FOREIGN KEY (`role_id`) REFERENCES `rbac-角色表` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rbac-角色表_permissions
-- ----------------------------
INSERT INTO `rbac-角色表_permissions` VALUES ('45', '1', '16');
INSERT INTO `rbac-角色表_permissions` VALUES ('46', '1', '17');
INSERT INTO `rbac-角色表_permissions` VALUES ('47', '1', '18');
INSERT INTO `rbac-角色表_permissions` VALUES ('48', '1', '19');
INSERT INTO `rbac-角色表_permissions` VALUES ('49', '1', '20');
INSERT INTO `rbac-角色表_permissions` VALUES ('50', '1', '21');
INSERT INTO `rbac-角色表_permissions` VALUES ('51', '1', '22');
INSERT INTO `rbac-角色表_permissions` VALUES ('52', '1', '23');
INSERT INTO `rbac-角色表_permissions` VALUES ('53', '1', '26');
INSERT INTO `rbac-角色表_permissions` VALUES ('54', '2', '12');
INSERT INTO `rbac-角色表_permissions` VALUES ('55', '2', '13');
INSERT INTO `rbac-角色表_permissions` VALUES ('56', '2', '14');
INSERT INTO `rbac-角色表_permissions` VALUES ('57', '2', '15');
INSERT INTO `rbac-角色表_permissions` VALUES ('16', '3', '1');
INSERT INTO `rbac-角色表_permissions` VALUES ('37', '3', '2');
INSERT INTO `rbac-角色表_permissions` VALUES ('17', '3', '3');
INSERT INTO `rbac-角色表_permissions` VALUES ('38', '3', '4');
INSERT INTO `rbac-角色表_permissions` VALUES ('39', '3', '5');
INSERT INTO `rbac-角色表_permissions` VALUES ('40', '3', '9');
INSERT INTO `rbac-角色表_permissions` VALUES ('41', '3', '10');
INSERT INTO `rbac-角色表_permissions` VALUES ('42', '3', '11');
INSERT INTO `rbac-角色表_permissions` VALUES ('43', '3', '24');
INSERT INTO `rbac-角色表_permissions` VALUES ('44', '3', '25');
INSERT INTO `rbac-角色表_permissions` VALUES ('1', '4', '1');
INSERT INTO `rbac-角色表_permissions` VALUES ('2', '4', '2');
INSERT INTO `rbac-角色表_permissions` VALUES ('3', '4', '3');
INSERT INTO `rbac-角色表_permissions` VALUES ('4', '4', '4');
INSERT INTO `rbac-角色表_permissions` VALUES ('18', '4', '5');
INSERT INTO `rbac-角色表_permissions` VALUES ('19', '4', '9');
INSERT INTO `rbac-角色表_permissions` VALUES ('20', '4', '10');
INSERT INTO `rbac-角色表_permissions` VALUES ('21', '4', '11');
INSERT INTO `rbac-角色表_permissions` VALUES ('22', '4', '12');
INSERT INTO `rbac-角色表_permissions` VALUES ('23', '4', '13');
INSERT INTO `rbac-角色表_permissions` VALUES ('24', '4', '14');
INSERT INTO `rbac-角色表_permissions` VALUES ('25', '4', '15');
INSERT INTO `rbac-角色表_permissions` VALUES ('26', '4', '16');
INSERT INTO `rbac-角色表_permissions` VALUES ('27', '4', '17');
INSERT INTO `rbac-角色表_permissions` VALUES ('28', '4', '18');
INSERT INTO `rbac-角色表_permissions` VALUES ('29', '4', '19');
INSERT INTO `rbac-角色表_permissions` VALUES ('30', '4', '20');
INSERT INTO `rbac-角色表_permissions` VALUES ('31', '4', '21');
INSERT INTO `rbac-角色表_permissions` VALUES ('32', '4', '22');
INSERT INTO `rbac-角色表_permissions` VALUES ('33', '4', '23');
INSERT INTO `rbac-角色表_permissions` VALUES ('34', '4', '24');
INSERT INTO `rbac-角色表_permissions` VALUES ('35', '4', '25');
INSERT INTO `rbac-角色表_permissions` VALUES ('36', '4', '26');

-- ----------------------------
-- Table structure for `student-价格策略表`
-- ----------------------------
DROP TABLE IF EXISTS `student-价格策略表`;
CREATE TABLE `student-价格策略表` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(10) unsigned NOT NULL,
  `valid_period` smallint(6) NOT NULL,
  `price` double NOT NULL,
  `content_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `student-价格策略表_content_type_id_object_i_d5192510_uniq` (`content_type_id`,`object_id`,`valid_period`),
  CONSTRAINT `student-价格策略表_content_type_id_c164d623_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student-价格策略表
-- ----------------------------
INSERT INTO `student-价格策略表` VALUES ('1', '1', '1', '7', '20');
INSERT INTO `student-价格策略表` VALUES ('2', '1', '7', '14', '20');
INSERT INTO `student-价格策略表` VALUES ('3', '3', '30', '99', '20');
INSERT INTO `student-价格策略表` VALUES ('4', '3', '210', '199', '20');

-- ----------------------------
-- Table structure for `student-优惠券生成规则记录`
-- ----------------------------
DROP TABLE IF EXISTS `student-优惠券生成规则记录`;
CREATE TABLE `student-优惠券生成规则记录` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `brief` longtext,
  `coupon_type` smallint(6) NOT NULL,
  `money_equivalent_value` int(11) DEFAULT NULL,
  `off_percent` smallint(5) unsigned DEFAULT NULL,
  `minimum_consume` int(10) unsigned DEFAULT NULL,
  `object_id` int(10) unsigned DEFAULT NULL,
  `open_date` date NOT NULL,
  `close_date` date NOT NULL,
  `valid_begin_date` date DEFAULT NULL,
  `valid_end_date` date DEFAULT NULL,
  `coupon_valid_days` int(10) unsigned DEFAULT NULL,
  `date` datetime(6) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `13. 优惠券生成规则记录_content_type_id_8e18a379_fk_django_content_type_id` (`content_type_id`),
  CONSTRAINT `13. 优惠券生成规则记录_content_type_id_8e18a379_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student-优惠券生成规则记录
-- ----------------------------
INSERT INTO `student-优惠券生成规则记录` VALUES ('1', '课程优惠卷名称', '我是课程优惠卷介绍', '0', '1000', '100', '90', '1', '2020-03-05', '2020-03-31', '2020-03-16', '2030-03-26', '10', '2020-03-17 10:48:01.141663', '20');
INSERT INTO `student-优惠券生成规则记录` VALUES ('2', '全局优惠卷名称', '我是全局优惠卷', '0', '2', '100', '0', null, '2020-03-10', '2020-03-26', '2020-03-16', '2030-03-26', '10', '2020-03-17 10:49:28.069067', null);
INSERT INTO `student-优惠券生成规则记录` VALUES ('3', '课程优惠卷2', '我是课程优惠卷2', '2', '0', '80', '0', '1', '2020-03-10', '2020-03-25', '2020-03-16', '2030-03-26', '10', '2020-03-17 18:18:38.264293', '20');
INSERT INTO `student-优惠券生成规则记录` VALUES ('4', '全局优惠卷2', '我是全局优惠卷2', '2', '0', '90', '0', null, '2020-03-14', '2020-03-25', '2020-03-16', '2030-03-26', '10', '2020-03-17 18:19:54.142705', null);

-- ----------------------------
-- Table structure for `student-学位课程表`
-- ----------------------------
DROP TABLE IF EXISTS `student-学位课程表`;
CREATE TABLE `student-学位课程表` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student-学位课程表
-- ----------------------------

-- ----------------------------
-- Table structure for `student-用户优惠券领取使用记录表`
-- ----------------------------
DROP TABLE IF EXISTS `student-用户优惠券领取使用记录表`;
CREATE TABLE `student-用户优惠券领取使用记录表` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(64) NOT NULL,
  `status` smallint(6) NOT NULL,
  `get_time` datetime(6) NOT NULL,
  `used_time` datetime(6) DEFAULT NULL,
  `account_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `number` (`number`),
  KEY `14. 用户优惠券领取使用记录表_account_id_0a75bf05_fk_rbac-用户表_id` (`account_id`),
  KEY `14. 用户优惠券领取使用记录表_coupon_id_fd3a911d_fk_13. 优惠券生成规则记录_id` (`coupon_id`),
  KEY `14. 用户优惠券领取使用记录表_order_id_35a3a333_fk_15. 订单表_id` (`order_id`),
  CONSTRAINT `14. 用户优惠券领取使用记录表_account_id_0a75bf05_fk_rbac-用户表_id` FOREIGN KEY (`account_id`) REFERENCES `rbac-用户表` (`id`),
  CONSTRAINT `14. 用户优惠券领取使用记录表_coupon_id_fd3a911d_fk_13. 优惠券生成规则记录_id` FOREIGN KEY (`coupon_id`) REFERENCES `student-优惠券生成规则记录` (`id`),
  CONSTRAINT `14. 用户优惠券领取使用记录表_order_id_35a3a333_fk_15. 订单表_id` FOREIGN KEY (`order_id`) REFERENCES `student-订单表` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student-用户优惠券领取使用记录表
-- ----------------------------
INSERT INTO `student-用户优惠券领取使用记录表` VALUES ('1', 'xxxxxx', '0', '2020-03-16 10:51:00.000000', null, '1', '1', null);
INSERT INTO `student-用户优惠券领取使用记录表` VALUES ('2', 'oooooo', '0', '2020-03-16 10:51:00.000000', null, '1', '2', null);
INSERT INTO `student-用户优惠券领取使用记录表` VALUES ('3', 'xxxx22222', '0', '2020-03-16 18:30:00.000000', null, '1', '3', null);
INSERT INTO `student-用户优惠券领取使用记录表` VALUES ('4', 'oooo2222', '0', '2020-03-16 18:31:00.000000', null, '1', '4', null);

-- ----------------------------
-- Table structure for `student-订单表`
-- ----------------------------
DROP TABLE IF EXISTS `student-订单表`;
CREATE TABLE `student-订单表` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_type` smallint(6) NOT NULL,
  `payment_number` varchar(128) DEFAULT NULL,
  `order_number` varchar(128) NOT NULL,
  `actual_amount` double NOT NULL,
  `status` smallint(6) NOT NULL,
  `date` datetime(6) NOT NULL,
  `pay_time` datetime(6) DEFAULT NULL,
  `cancel_time` datetime(6) DEFAULT NULL,
  `account_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_number` (`order_number`),
  KEY `15. 订单表_account_id_4ce30dc3_fk_rbac-用户表_id` (`account_id`),
  CONSTRAINT `15. 订单表_account_id_4ce30dc3_fk_rbac-用户表_id` FOREIGN KEY (`account_id`) REFERENCES `rbac-用户表` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student-订单表
-- ----------------------------
INSERT INTO `student-订单表` VALUES ('3', '0', '3170226370222', 'c836d1ac-748b-4098-843a-1a908129b49595', '7', '0', '2020-03-20 17:38:36.032930', '2020-03-20 17:42:39.558138', null, '1');
INSERT INTO `student-订单表` VALUES ('5', '0', null, 'xxxxxxxx', '99', '1', '2020-03-27 13:12:06.259092', null, null, '1');
INSERT INTO `student-订单表` VALUES ('6', '0', '2275930976', 'b6aa7630-efca-426a-ab2c-2727597aef4f', '7', '0', '2020-03-27 17:21:30.486555', '2020-03-27 17:21:56.122613', null, '1');

-- ----------------------------
-- Table structure for `student-订单详细`
-- ----------------------------
DROP TABLE IF EXISTS `student-订单详细`;
CREATE TABLE `student-订单详细` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(10) unsigned NOT NULL,
  `original_price` double NOT NULL,
  `price` double NOT NULL,
  `valid_period_display` varchar(32) NOT NULL,
  `valid_period` int(10) unsigned NOT NULL,
  `memo` varchar(255) DEFAULT NULL,
  `content_type_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `16. 订单详细_content_type_id_9380cdeb_fk_django_content_type_id` (`content_type_id`),
  KEY `16. 订单详细_order_id_31a3c61f_fk_15. 订单表_id` (`order_id`),
  CONSTRAINT `16. 订单详细_content_type_id_9380cdeb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `16. 订单详细_order_id_31a3c61f_fk_15. 订单表_id` FOREIGN KEY (`order_id`) REFERENCES `student-订单表` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student-订单详细
-- ----------------------------
INSERT INTO `student-订单详细` VALUES ('3', '1', '7', '7', '1天', '1', null, '20', '3');
INSERT INTO `student-订单详细` VALUES ('4', '1', '7', '7', '1天', '1', null, '20', '6');

-- ----------------------------
-- Table structure for `student-课程分类表`
-- ----------------------------
DROP TABLE IF EXISTS `student-课程分类表`;
CREATE TABLE `student-课程分类表` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student-课程分类表
-- ----------------------------
INSERT INTO `student-课程分类表` VALUES ('2', 'Linux');
INSERT INTO `student-课程分类表` VALUES ('1', 'python');

-- ----------------------------
-- Table structure for `student-课程章节表`
-- ----------------------------
DROP TABLE IF EXISTS `student-课程章节表`;
CREATE TABLE `student-课程章节表` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chapter` smallint(6) NOT NULL,
  `title` varchar(32) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `student-课程章节表_course_id_chapter_fa375a27_uniq` (`course_id`,`chapter`),
  CONSTRAINT `student-课程章节表_course_id_bea07642_fk_student-课程表_id` FOREIGN KEY (`course_id`) REFERENCES `student-课程表` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student-课程章节表
-- ----------------------------
INSERT INTO `student-课程章节表` VALUES ('1', '1', '我是第一章', '1');
INSERT INTO `student-课程章节表` VALUES ('2', '2', '我是第二章', '1');

-- ----------------------------
-- Table structure for `student-课程表`
-- ----------------------------
DROP TABLE IF EXISTS `student-课程表`;
CREATE TABLE `student-课程表` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `course_img` varchar(100) DEFAULT NULL,
  `course_type` smallint(6) NOT NULL,
  `brief` varchar(1024) NOT NULL,
  `status` smallint(6) NOT NULL,
  `pub_date` date DEFAULT NULL,
  `order` int(11) NOT NULL,
  `study_num` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `degree_course_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`),
  KEY `student-课程表_degree_course_id_fd7c35b9_fk_student-学位课程表_id` (`degree_course_id`),
  KEY `student-课程表_category_id_2e82999a_fk_student-课程分类表_id` (`category_id`),
  CONSTRAINT `student-课程表_category_id_2e82999a_fk_student-课程分类表_id` FOREIGN KEY (`category_id`) REFERENCES `student-课程分类表` (`id`),
  CONSTRAINT `student-课程表_degree_course_id_fd7c35b9_fk_student-学位课程表_id` FOREIGN KEY (`degree_course_id`) REFERENCES `student-学位课程表` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student-课程表
-- ----------------------------
INSERT INTO `student-课程表` VALUES ('1', '我是课程名称', 'course/2020-03/PY12x_1566529821.1110113.png', '0', '我是课程简介', '0', null, '1', '1000000', '1', null);
INSERT INTO `student-课程表` VALUES ('3', 'Linux课程', 'course/2020-03/img1_1570601309.1430533_k8loimF.png', '0', 'linux课程简介', '0', null, '2', '999999999', '2', null);

-- ----------------------------
-- Table structure for `student-课程详细表`
-- ----------------------------
DROP TABLE IF EXISTS `student-课程详细表`;
CREATE TABLE `student-课程详细表` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hours` int(11) NOT NULL,
  `video_brief_link` varchar(255) DEFAULT NULL,
  `summary` longtext NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_id` (`course_id`),
  CONSTRAINT `student-课程详细表_course_id_1708a130_fk_student-课程表_id` FOREIGN KEY (`course_id`) REFERENCES `student-课程表` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student-课程详细表
-- ----------------------------
INSERT INTO `student-课程详细表` VALUES ('1', '7', null, '我是课程概述', '1');
INSERT INTO `student-课程详细表` VALUES ('2', '7', null, 'linux课程', '3');

-- ----------------------------
-- Table structure for `student-课程详细表_recommend_courses`
-- ----------------------------
DROP TABLE IF EXISTS `student-课程详细表_recommend_courses`;
CREATE TABLE `student-课程详细表_recommend_courses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coursedetail_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `student-课程详细表_recommend__coursedetail_id_course_i_a21fc652_uniq` (`coursedetail_id`,`course_id`),
  KEY `student-课程详细表_recomm_course_id_ef002de8_fk_student-课` (`course_id`),
  CONSTRAINT `student-课程详细表_recomm_course_id_ef002de8_fk_student-课` FOREIGN KEY (`course_id`) REFERENCES `student-课程表` (`id`),
  CONSTRAINT `student-课程详细表_recomm_coursedetail_id_0341ce69_fk_student-课` FOREIGN KEY (`coursedetail_id`) REFERENCES `student-课程详细表` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student-课程详细表_recommend_courses
-- ----------------------------
INSERT INTO `student-课程详细表_recommend_courses` VALUES ('1', '1', '1');
INSERT INTO `student-课程详细表_recommend_courses` VALUES ('2', '2', '3');

-- ----------------------------
-- Table structure for `student-课程课时表`
-- ----------------------------
DROP TABLE IF EXISTS `student-课程课时表`;
CREATE TABLE `student-课程课时表` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `section_order` smallint(6) NOT NULL,
  `free_trail` tinyint(1) NOT NULL,
  `section_type` smallint(6) NOT NULL,
  `section_link` varchar(255) DEFAULT NULL,
  `chapter_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `student-课程课时表_chapter_id_section_link_991a9aef_uniq` (`chapter_id`,`section_link`),
  CONSTRAINT `student-课程课时表_chapter_id_571b1567_fk_student-课程章节表_id` FOREIGN KEY (`chapter_id`) REFERENCES `student-课程章节表` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student-课程课时表
-- ----------------------------
INSERT INTO `student-课程课时表` VALUES ('1', '我是第一章--第一课时', '1', '1', '2', '88083abbf5535a4d7b4d8614427559e0_8', '1');
INSERT INTO `student-课程课时表` VALUES ('2', '我是第一章--第二课时', '2', '1', '2', '46c10ad8d2e78b60bd61bc3abebee22f_4', '1');

-- ----------------------------
-- Table structure for `student-贝里交易记录`
-- ----------------------------
DROP TABLE IF EXISTS `student-贝里交易记录`;
CREATE TABLE `student-贝里交易记录` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` double NOT NULL,
  `balance` double NOT NULL,
  `transaction_type` smallint(6) NOT NULL,
  `transaction_number` varchar(128) NOT NULL,
  `date` datetime(6) NOT NULL,
  `memo` varchar(128) DEFAULT NULL,
  `account_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `transaction_number` (`transaction_number`),
  KEY `17. 贝里交易记录_account_id_0daf432a_fk_rbac-用户表_id` (`account_id`),
  CONSTRAINT `17. 贝里交易记录_account_id_0daf432a_fk_rbac-用户表_id` FOREIGN KEY (`account_id`) REFERENCES `rbac-用户表` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student-贝里交易记录
-- ----------------------------

-- ----------------------------
-- Table structure for `student-购买的课程记录`
-- ----------------------------
DROP TABLE IF EXISTS `student-购买的课程记录`;
CREATE TABLE `student-购买的课程记录` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_id` (`course_id`),
  UNIQUE KEY `student-购买的课程记录_course_id_account_id_3f105e48_uniq` (`course_id`,`account_id`),
  KEY `student_studycourse_account_id_260dcb34_fk_rbac-用户表_id` (`account_id`),
  CONSTRAINT `student_studycourse_account_id_260dcb34_fk_rbac-用户表_id` FOREIGN KEY (`account_id`) REFERENCES `rbac-用户表` (`id`),
  CONSTRAINT `student_studycourse_course_id_4aac22f4_fk_student-课程表_id` FOREIGN KEY (`course_id`) REFERENCES `student-课程表` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student-购买的课程记录
-- ----------------------------
INSERT INTO `student-购买的课程记录` VALUES ('1', '1', '1');

-- ----------------------------
-- Table structure for `teacher-作业提交记录表`
-- ----------------------------
DROP TABLE IF EXISTS `teacher-作业提交记录表`;
CREATE TABLE `teacher-作业提交记录表` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file` varchar(100) DEFAULT NULL,
  `homework_status` int(11) NOT NULL,
  `mark` int(10) unsigned DEFAULT NULL,
  `homework_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `correction_file` varchar(100) DEFAULT NULL,
  `comment` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `teacher-作业提交记录表_homework_id_12dc07eb_fk_teacher-作业表_id` (`homework_id`),
  KEY `teacher-作业提交记录表_student_id_89b7074f_fk_rbac-用户表_id` (`student_id`),
  CONSTRAINT `teacher-作业提交记录表_homework_id_12dc07eb_fk_teacher-作业表_id` FOREIGN KEY (`homework_id`) REFERENCES `teacher-作业表` (`id`),
  CONSTRAINT `teacher-作业提交记录表_student_id_89b7074f_fk_rbac-用户表_id` FOREIGN KEY (`student_id`) REFERENCES `rbac-用户表` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher-作业提交记录表
-- ----------------------------
INSERT INTO `teacher-作业提交记录表` VALUES ('1', 'homework/2020-03/20.txt', '3', null, '1', '5', 'correction/2020-03/20.txt', null);
INSERT INTO `teacher-作业提交记录表` VALUES ('2', 'homework/2020-03/17.txt', '3', '89', '2', '5', 'correction/2020-03/4444_G75bwmv.txt', '22222');
INSERT INTO `teacher-作业提交记录表` VALUES ('3', '', '1', null, '1', '1', '', null);
INSERT INTO `teacher-作业提交记录表` VALUES ('4', '', '1', null, '2', '1', '', null);

-- ----------------------------
-- Table structure for `teacher-作业表`
-- ----------------------------
DROP TABLE IF EXISTS `teacher-作业表`;
CREATE TABLE `teacher-作业表` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `content` varchar(500) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `chapter_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `teacher-作业表_chapter_id_59e5aa56_fk_student-课程章节表_id` (`chapter_id`),
  CONSTRAINT `teacher-作业表_chapter_id_59e5aa56_fk_student-课程章节表_id` FOREIGN KEY (`chapter_id`) REFERENCES `student-课程章节表` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher-作业表
-- ----------------------------
INSERT INTO `teacher-作业表` VALUES ('1', '我是作业标题', '我是作业内容1', '2020-03-14 10:47:45.110708', '1');
INSERT INTO `teacher-作业表` VALUES ('2', '我是作业标题2', '我是作业内容2', '2020-03-20 19:00:09.052513', '2');

-- ----------------------------
-- Table structure for `teacher-学生跟进表`
-- ----------------------------
DROP TABLE IF EXISTS `teacher-学生跟进表`;
CREATE TABLE `teacher-学生跟进表` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `note` longtext NOT NULL,
  `date` date NOT NULL,
  `student_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `teacher-学生跟进表_student_id_fe33082e_fk_rbac-用户表_id` (`student_id`),
  KEY `teacher-学生跟进表_teacher_id_fc7acac1_fk_rbac-用户表_id` (`teacher_id`),
  CONSTRAINT `teacher-学生跟进表_student_id_fe33082e_fk_rbac-用户表_id` FOREIGN KEY (`student_id`) REFERENCES `rbac-用户表` (`id`),
  CONSTRAINT `teacher-学生跟进表_teacher_id_fc7acac1_fk_rbac-用户表_id` FOREIGN KEY (`teacher_id`) REFERENCES `rbac-用户表` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher-学生跟进表
-- ----------------------------
INSERT INTO `teacher-学生跟进表` VALUES ('1', '第一次记录xxxx,jjjj111aaa', '2020-03-13', '5', '1');

-- ----------------------------
-- Table structure for `学生-问题表`
-- ----------------------------
DROP TABLE IF EXISTS `学生-问题表`;
CREATE TABLE `学生-问题表` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `content` varchar(500) DEFAULT NULL,
  `answer` varchar(500) DEFAULT NULL,
  `question_status` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `学生-问题表_student_id_e59d4d06_fk_rbac-用户表_id` (`student_id`),
  KEY `学生-问题表_teacher_id_c031ee32_fk_rbac-用户表_id` (`teacher_id`),
  CONSTRAINT `学生-问题表_student_id_e59d4d06_fk_rbac-用户表_id` FOREIGN KEY (`student_id`) REFERENCES `rbac-用户表` (`id`),
  CONSTRAINT `学生-问题表_teacher_id_c031ee32_fk_rbac-用户表_id` FOREIGN KEY (`teacher_id`) REFERENCES `rbac-用户表` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of 学生-问题表
-- ----------------------------
INSERT INTO `学生-问题表` VALUES ('1', '我是问题标题', '我是问题内容', '我的回答aaaaaaaaaaaa', '2', '5', '1');
INSERT INTO `学生-问题表` VALUES ('3', '我是问题1', '内容', null, '1', '1', '2');
