/*
Navicat MySQL Data Transfer

Source Server         : 本地虚拟机
Source Server Version : 50728
Source Host           : 192.168.0.8:3306
Source Database       : laravue

Target Server Type    : MYSQL
Target Server Version : 50728
File Encoding         : 65001

Date: 2019-12-05 15:44:50
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `company`
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL COMMENT '公司',
  `logo` varchar(255) DEFAULT NULL COMMENT '公司logo图片',
  `phone` varchar(255) DEFAULT NULL COMMENT '公司电话',
  `address` varchar(255) DEFAULT NULL COMMENT '公司地址',
  `super_status` tinyint(3) DEFAULT '0' COMMENT '超级管理员。1表示超级管理，0表示客户',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='公司';

-- ----------------------------
-- Records of company
-- ----------------------------
INSERT INTO `company` VALUES ('1', '百度', '323', '13888888888', '广州', '1', '2019-12-03 03:53:51', '2019-12-04 08:12:03');
INSERT INTO `company` VALUES ('2', 'ali', '阿里巴巴', '13666666666', '杭州', '1', null, null);

-- ----------------------------
-- Table structure for `failed_jobs`
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for `migrations`
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('1', '2014_10_12_000000_create_users_table', '1');
INSERT INTO `migrations` VALUES ('2', '2014_10_12_100000_create_password_resets_table', '1');
INSERT INTO `migrations` VALUES ('3', '2019_03_16_102314_add_simple_role_to_user_table', '1');
INSERT INTO `migrations` VALUES ('4', '2019_04_20_125200_create_permission_tables', '1');
INSERT INTO `migrations` VALUES ('5', '2019_04_20_130706_setup_role_permissions', '1');
INSERT INTO `migrations` VALUES ('6', '2019_08_19_000000_create_failed_jobs_table', '1');

-- ----------------------------
-- Table structure for `model_has_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE `model_has_permissions` (
  `permission_id` int(10) unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of model_has_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `model_has_roles`
-- ----------------------------
DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE `model_has_roles` (
  `role_id` int(10) unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of model_has_roles
-- ----------------------------
INSERT INTO `model_has_roles` VALUES ('1', 'App\\Laravue\\Models\\User', '1');
INSERT INTO `model_has_roles` VALUES ('2', 'App\\Laravue\\Models\\User', '2');
INSERT INTO `model_has_roles` VALUES ('3', 'App\\Laravue\\Models\\User', '3');
INSERT INTO `model_has_roles` VALUES ('4', 'App\\Laravue\\Models\\User', '4');
INSERT INTO `model_has_roles` VALUES ('5', 'App\\Laravue\\Models\\User', '5');
INSERT INTO `model_has_roles` VALUES ('5', 'App\\Laravue\\Models\\User', '6');
INSERT INTO `model_has_roles` VALUES ('4', 'App\\Laravue\\Models\\User', '7');
INSERT INTO `model_has_roles` VALUES ('2', 'App\\Laravue\\Models\\User', '8');
INSERT INTO `model_has_roles` VALUES ('3', 'App\\Laravue\\Models\\User', '9');
INSERT INTO `model_has_roles` VALUES ('2', 'App\\Laravue\\Models\\User', '10');
INSERT INTO `model_has_roles` VALUES ('3', 'App\\Laravue\\Models\\User', '11');
INSERT INTO `model_has_roles` VALUES ('2', 'App\\Laravue\\Models\\User', '12');
INSERT INTO `model_has_roles` VALUES ('2', 'App\\Laravue\\Models\\User', '13');
INSERT INTO `model_has_roles` VALUES ('3', 'App\\Laravue\\Models\\User', '14');
INSERT INTO `model_has_roles` VALUES ('5', 'App\\Laravue\\Models\\User', '15');
INSERT INTO `model_has_roles` VALUES ('2', 'App\\Laravue\\Models\\User', '16');
INSERT INTO `model_has_roles` VALUES ('4', 'App\\Laravue\\Models\\User', '17');
INSERT INTO `model_has_roles` VALUES ('5', 'App\\Laravue\\Models\\User', '18');
INSERT INTO `model_has_roles` VALUES ('4', 'App\\Laravue\\Models\\User', '19');
INSERT INTO `model_has_roles` VALUES ('3', 'App\\Laravue\\Models\\User', '20');
INSERT INTO `model_has_roles` VALUES ('2', 'App\\Laravue\\Models\\User', '21');
INSERT INTO `model_has_roles` VALUES ('4', 'App\\Laravue\\Models\\User', '22');
INSERT INTO `model_has_roles` VALUES ('3', 'App\\Laravue\\Models\\User', '23');
INSERT INTO `model_has_roles` VALUES ('5', 'App\\Laravue\\Models\\User', '24');
INSERT INTO `model_has_roles` VALUES ('3', 'App\\Laravue\\Models\\User', '25');
INSERT INTO `model_has_roles` VALUES ('3', 'App\\Laravue\\Models\\User', '26');
INSERT INTO `model_has_roles` VALUES ('3', 'App\\Laravue\\Models\\User', '27');
INSERT INTO `model_has_roles` VALUES ('2', 'App\\Laravue\\Models\\User', '28');
INSERT INTO `model_has_roles` VALUES ('3', 'App\\Laravue\\Models\\User', '29');
INSERT INTO `model_has_roles` VALUES ('3', 'App\\Laravue\\Models\\User', '30');
INSERT INTO `model_has_roles` VALUES ('2', 'App\\Laravue\\Models\\User', '31');
INSERT INTO `model_has_roles` VALUES ('2', 'App\\Laravue\\Models\\User', '32');
INSERT INTO `model_has_roles` VALUES ('4', 'App\\Laravue\\Models\\User', '33');
INSERT INTO `model_has_roles` VALUES ('4', 'App\\Laravue\\Models\\User', '34');
INSERT INTO `model_has_roles` VALUES ('3', 'App\\Laravue\\Models\\User', '35');
INSERT INTO `model_has_roles` VALUES ('4', 'App\\Laravue\\Models\\User', '36');
INSERT INTO `model_has_roles` VALUES ('5', 'App\\Laravue\\Models\\User', '37');
INSERT INTO `model_has_roles` VALUES ('5', 'App\\Laravue\\Models\\User', '38');
INSERT INTO `model_has_roles` VALUES ('2', 'App\\Laravue\\Models\\User', '39');
INSERT INTO `model_has_roles` VALUES ('3', 'App\\Laravue\\Models\\User', '40');
INSERT INTO `model_has_roles` VALUES ('2', 'App\\Laravue\\Models\\User', '41');
INSERT INTO `model_has_roles` VALUES ('5', 'App\\Laravue\\Models\\User', '42');
INSERT INTO `model_has_roles` VALUES ('5', 'App\\Laravue\\Models\\User', '43');
INSERT INTO `model_has_roles` VALUES ('3', 'App\\Laravue\\Models\\User', '44');
INSERT INTO `model_has_roles` VALUES ('4', 'App\\Laravue\\Models\\User', '45');
INSERT INTO `model_has_roles` VALUES ('5', 'App\\Laravue\\Models\\User', '46');
INSERT INTO `model_has_roles` VALUES ('2', 'App\\Laravue\\Models\\User', '47');
INSERT INTO `model_has_roles` VALUES ('4', 'App\\Laravue\\Models\\User', '48');
INSERT INTO `model_has_roles` VALUES ('5', 'App\\Laravue\\Models\\User', '49');
INSERT INTO `model_has_roles` VALUES ('2', 'App\\Laravue\\Models\\User', '50');
INSERT INTO `model_has_roles` VALUES ('4', 'App\\Laravue\\Models\\User', '51');
INSERT INTO `model_has_roles` VALUES ('3', 'App\\Laravue\\Models\\User', '52');
INSERT INTO `model_has_roles` VALUES ('5', 'App\\Laravue\\Models\\User', '53');
INSERT INTO `model_has_roles` VALUES ('3', 'App\\Laravue\\Models\\User', '54');
INSERT INTO `model_has_roles` VALUES ('4', 'App\\Laravue\\Models\\User', '55');

-- ----------------------------
-- Table structure for `password_resets`
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for `permissions`
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO `permissions` VALUES ('1', '1', 'view menu element ui', 'api', '2019-12-03 03:53:51', '2019-12-03 03:53:51');
INSERT INTO `permissions` VALUES ('2', '1', 'view menu permission', 'api', '2019-12-03 03:53:51', '2019-12-03 03:53:51');
INSERT INTO `permissions` VALUES ('3', '1', 'view menu components', 'api', '2019-12-03 03:53:51', '2019-12-03 03:53:51');
INSERT INTO `permissions` VALUES ('4', '1', 'view menu charts', 'api', '2019-12-03 03:53:51', '2019-12-03 03:53:51');
INSERT INTO `permissions` VALUES ('5', '1', 'view menu nested routes', 'api', '2019-12-03 03:53:51', '2019-12-03 03:53:51');
INSERT INTO `permissions` VALUES ('6', '1', 'view menu table', 'api', '2019-12-03 03:53:51', '2019-12-03 03:53:51');
INSERT INTO `permissions` VALUES ('7', '1', '管理员管理', 'api', '2019-12-03 03:53:51', '2019-12-03 03:53:51');
INSERT INTO `permissions` VALUES ('8', '1', 'view menu theme', 'api', '2019-12-03 03:53:51', '2019-12-03 03:53:51');
INSERT INTO `permissions` VALUES ('9', '1', 'view menu clipboard', 'api', '2019-12-03 03:53:51', '2019-12-03 03:53:51');
INSERT INTO `permissions` VALUES ('10', '1', 'view menu excel', 'api', '2019-12-03 03:53:51', '2019-12-03 03:53:51');
INSERT INTO `permissions` VALUES ('11', '1', 'view menu zip', 'api', '2019-12-03 03:53:51', '2019-12-03 03:53:51');
INSERT INTO `permissions` VALUES ('12', '1', 'view menu pdf', 'api', '2019-12-03 03:53:52', '2019-12-03 03:53:52');
INSERT INTO `permissions` VALUES ('13', '1', 'view menu i18n', 'api', '2019-12-03 03:53:52', '2019-12-03 03:53:52');
INSERT INTO `permissions` VALUES ('14', '1', '用户管理', 'api', '2019-12-03 03:53:52', '2019-12-03 03:53:52');
INSERT INTO `permissions` VALUES ('15', '1', 'manage article', 'api', '2019-12-03 03:53:52', '2019-12-03 03:53:52');
INSERT INTO `permissions` VALUES ('16', '1', '权限管理', 'api', '2019-12-03 03:53:52', '2019-12-03 03:53:52');
INSERT INTO `permissions` VALUES ('17', '1', '公司管理', 'api', '2019-12-03 03:53:52', '2019-12-03 03:53:52');
INSERT INTO `permissions` VALUES ('18', '1', '角色管理', 'api', '2019-12-03 03:53:52', '2019-12-03 03:53:52');

-- ----------------------------
-- Table structure for `role_has_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE `role_has_permissions` (
  `company_id` int(10) DEFAULT NULL,
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of role_has_permissions
-- ----------------------------
INSERT INTO `role_has_permissions` VALUES ('1', '1', '1');
INSERT INTO `role_has_permissions` VALUES ('1', '1', '2');
INSERT INTO `role_has_permissions` VALUES ('1', '1', '3');
INSERT INTO `role_has_permissions` VALUES ('1', '1', '4');
INSERT INTO `role_has_permissions` VALUES ('1', '1', '5');
INSERT INTO `role_has_permissions` VALUES ('1', '2', '1');
INSERT INTO `role_has_permissions` VALUES ('1', '2', '2');
INSERT INTO `role_has_permissions` VALUES ('1', '2', '3');
INSERT INTO `role_has_permissions` VALUES ('1', '2', '4');
INSERT INTO `role_has_permissions` VALUES ('1', '2', '5');
INSERT INTO `role_has_permissions` VALUES ('1', '3', '1');
INSERT INTO `role_has_permissions` VALUES ('1', '3', '2');
INSERT INTO `role_has_permissions` VALUES ('1', '3', '3');
INSERT INTO `role_has_permissions` VALUES ('1', '4', '1');
INSERT INTO `role_has_permissions` VALUES ('1', '4', '2');
INSERT INTO `role_has_permissions` VALUES ('1', '4', '3');
INSERT INTO `role_has_permissions` VALUES ('1', '5', '1');
INSERT INTO `role_has_permissions` VALUES ('1', '5', '2');
INSERT INTO `role_has_permissions` VALUES ('1', '5', '3');
INSERT INTO `role_has_permissions` VALUES ('1', '6', '1');
INSERT INTO `role_has_permissions` VALUES ('1', '6', '2');
INSERT INTO `role_has_permissions` VALUES ('1', '6', '3');
INSERT INTO `role_has_permissions` VALUES ('1', '7', '1');
INSERT INTO `role_has_permissions` VALUES ('1', '7', '2');
INSERT INTO `role_has_permissions` VALUES ('1', '7', '3');
INSERT INTO `role_has_permissions` VALUES ('1', '8', '1');
INSERT INTO `role_has_permissions` VALUES ('1', '8', '2');
INSERT INTO `role_has_permissions` VALUES ('1', '8', '3');
INSERT INTO `role_has_permissions` VALUES ('1', '9', '1');
INSERT INTO `role_has_permissions` VALUES ('1', '9', '2');
INSERT INTO `role_has_permissions` VALUES ('1', '9', '3');
INSERT INTO `role_has_permissions` VALUES ('1', '10', '1');
INSERT INTO `role_has_permissions` VALUES ('1', '10', '2');
INSERT INTO `role_has_permissions` VALUES ('1', '10', '3');
INSERT INTO `role_has_permissions` VALUES ('1', '11', '1');
INSERT INTO `role_has_permissions` VALUES ('1', '11', '2');
INSERT INTO `role_has_permissions` VALUES ('1', '11', '3');
INSERT INTO `role_has_permissions` VALUES ('1', '12', '1');
INSERT INTO `role_has_permissions` VALUES ('1', '12', '2');
INSERT INTO `role_has_permissions` VALUES ('1', '12', '3');
INSERT INTO `role_has_permissions` VALUES ('1', '13', '1');
INSERT INTO `role_has_permissions` VALUES ('1', '13', '2');
INSERT INTO `role_has_permissions` VALUES ('1', '13', '3');
INSERT INTO `role_has_permissions` VALUES ('1', '14', '1');
INSERT INTO `role_has_permissions` VALUES ('1', '14', '2');
INSERT INTO `role_has_permissions` VALUES ('1', '15', '1');
INSERT INTO `role_has_permissions` VALUES ('1', '15', '2');
INSERT INTO `role_has_permissions` VALUES ('1', '15', '3');
INSERT INTO `role_has_permissions` VALUES ('1', '16', '1');
INSERT INTO `role_has_permissions` VALUES ('1', '17', '1');
INSERT INTO `role_has_permissions` VALUES ('1', '18', '1');

-- ----------------------------
-- Table structure for `roles`
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('1', '1', 'admin', 'api', '2019-12-03 03:53:51', '2019-12-03 03:53:51');
INSERT INTO `roles` VALUES ('2', '1', 'manager', 'api', '2019-12-03 03:53:51', '2019-12-03 03:53:51');
INSERT INTO `roles` VALUES ('3', '1', 'editor', 'api', '2019-12-03 03:53:51', '2019-12-03 03:53:51');
INSERT INTO `roles` VALUES ('4', '1', 'user', 'api', '2019-12-03 03:53:51', '2019-12-03 03:53:51');
INSERT INTO `roles` VALUES ('5', '1', 'visitor', 'api', '2019-12-03 03:53:51', '2019-12-03 03:53:51');

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL COMMENT '公司id',
  `role_id` int(11) DEFAULT NULL COMMENT '角色id',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '管理员名',
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '头像地址',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '邮箱',
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '电话',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL COMMENT '用户状态 1启用 0禁用',
  `super_status` tinyint(1) DEFAULT '0' COMMENT '是否超级管理员 1是0否',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='管理员表';

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', '1', '1', 'Admin', null, 'admin@laravue.dev', null, null, '$2y$10$Iu8txCPGUjCA5jitMmkn4OrMdWgeL17IJph657CS6w1DCwX9GGo8.', null, '2019-12-03 03:53:53', '2019-12-03 03:53:53', '1', '1');
INSERT INTO `users` VALUES ('2', '1', '2', 'Manager', null, 'manager@laravue.dev', null, null, '$2y$10$KFNymCp/.YGCPnkGt5jSyuxd882xaJIdi8mW/LYdPkx9846hifzV.', null, '2019-12-03 03:53:53', '2019-12-03 03:53:53', '1', '0');
INSERT INTO `users` VALUES ('3', '1', '3', 'Editor', null, 'editor@laravue.dev', null, null, '$2y$10$MBOMUccYArFRsmWP1.Q8V.7MeBu4MGhZhP8dAx3iZAGzXN/Nqkjd6', null, '2019-12-03 03:53:53', '2019-12-03 03:53:53', '1', '0');
INSERT INTO `users` VALUES ('4', '1', '4', 'User', null, 'user@laravue.dev', null, null, '$2y$10$1oWtrXYUl8mvJ9ahu8eOlejBxPxoAWKwKrAtHRQ/uQmh/ifvRyaOa', null, '2019-12-03 03:53:53', '2019-12-03 03:53:53', '1', '0');
INSERT INTO `users` VALUES ('5', '1', '5', 'Visitor', null, 'visitor@laravue.dev', null, null, '$2y$10$hGf/pEkcdm9aGsILMAF4.e42mlthEYNnUSL560B4P37ob4/SKFqj6', null, '2019-12-03 03:53:53', '2019-12-03 03:53:53', '1', '0');
INSERT INTO `users` VALUES ('6', '1', '2', 'Adriana C. Ocampo Uria', null, 'adriana.c..ocampo.uria@laravue.dev', null, null, '$2y$10$5t8qQM9jCLI9XkrFaH82COo/Z5jVjMjuFQp9vbZeINqPisTNjbam2', null, '2019-12-03 03:53:53', '2019-12-03 03:53:53', '1', '0');
INSERT INTO `users` VALUES ('7', '1', '2', 'Albert Einstein', null, 'albert.einstein@laravue.dev', null, null, '$2y$10$N7e5oSRD9ZTmr8TWMShP0OhSl17NVP10Q4viHMFe07IU2N781T3GW', null, '2019-12-03 03:53:54', '2019-12-03 03:53:54', '1', '0');
INSERT INTO `users` VALUES ('8', '1', '2', 'Anna K. Behrensmeyer', null, 'anna.k..behrensmeyer@laravue.dev', null, null, '$2y$10$mnlxyQr6fVNJDf/HM8vAFOJU8Btg66vpXuUfkxR1sG2yFSD6OrOhm', null, '2019-12-03 03:53:54', '2019-12-03 03:53:54', '1', '0');
INSERT INTO `users` VALUES ('9', '1', '2', 'Blaise Pascal', null, 'blaise.pascal@laravue.dev', null, null, '$2y$10$ynEshNF2.0Z7ZBhM/gEm/OKbM5nRMgnwn5zjlPTNJpsC7qyVFUw66', null, '2019-12-03 03:53:54', '2019-12-03 03:53:54', '1', '0');
INSERT INTO `users` VALUES ('10', '1', null, 'Caroline Herschel', null, 'caroline.herschel@laravue.dev', null, null, '$2y$10$04Lju8a.wqSh2t6rB97koeQi.C.sOLACi3fXan9vfFuZAznfFPP9C', null, '2019-12-03 03:53:54', '2019-12-03 03:53:54', '1', '0');
INSERT INTO `users` VALUES ('11', '1', null, 'Cecilia Payne-Gaposchkin', null, 'cecilia.payne-gaposchkin@laravue.dev', null, null, '$2y$10$yYKWaUkN.gUzcCqnJgNVrO9sjWhrDHHouRULsN4w6K6JtjNReH4uu', null, '2019-12-03 03:53:54', '2019-12-03 03:53:54', '1', '0');
INSERT INTO `users` VALUES ('12', '1', null, 'Chien-Shiung Wu', null, 'chien-shiung.wu@laravue.dev', null, null, '$2y$10$FJJm3E1HkkdlFCqYRUQwXuEluZiFHqxI2epC9SXr87kH4Fo35cZuO', null, '2019-12-03 03:53:54', '2019-12-03 03:53:54', '1', '0');
INSERT INTO `users` VALUES ('13', null, null, 'Dorothy Hodgkin', null, 'dorothy.hodgkin@laravue.dev', null, null, '$2y$10$Yda9zC8xwgqNGzPWVrqCVuFNTCu44rIe5hF7hCVIfxbHe9WEDScmC', null, '2019-12-03 03:53:54', '2019-12-03 03:53:54', '1', '0');
INSERT INTO `users` VALUES ('14', null, null, 'Edmond Halley', null, 'edmond.halley@laravue.dev', null, null, '$2y$10$SzFWP4n3JVaX0ebbJRd4U./Bzxpb7.yg8MvxiDPwYU774xDeDdOg6', null, '2019-12-03 03:53:54', '2019-12-03 03:53:54', '1', '0');
INSERT INTO `users` VALUES ('15', null, null, 'Edwin Powell Hubble', null, 'edwin.powell.hubble@laravue.dev', null, null, '$2y$10$uEYfl4D1wsrXDl.hM0QMEeK70oezV600cc/2BW.KwTHy1bFWrvXYC', null, '2019-12-03 03:53:55', '2019-12-03 03:53:55', '1', '0');
INSERT INTO `users` VALUES ('16', null, null, 'Elizabeth Blackburn', null, 'elizabeth.blackburn@laravue.dev', null, null, '$2y$10$/lQ4Iir.dAuJXvLULdtzFelK/i2TNj2h1YlM3lD6hzKnzB5XyXPDe', null, '2019-12-03 03:53:55', '2019-12-03 03:53:55', '1', '0');
INSERT INTO `users` VALUES ('17', null, null, 'Enrico Fermi', null, 'enrico.fermi@laravue.dev', null, null, '$2y$10$amEiOtCiDxGtlJLtFQ/VKODP822TIIGZy.cFeF.NZiAD7SLGxp8Pa', null, '2019-12-03 03:53:55', '2019-12-03 03:53:55', '1', '0');
INSERT INTO `users` VALUES ('18', null, null, 'Erwin Schroedinger', null, 'erwin.schroedinger@laravue.dev', null, null, '$2y$10$do0lN0l1l6RHM92Fw/ZiLe.YuB/9G7RzVtMYVLn1tTm7wCQpbyAYG', null, '2019-12-03 03:53:55', '2019-12-03 03:53:55', '1', '0');
INSERT INTO `users` VALUES ('19', null, null, 'Flossie Wong-Staal', null, 'flossie.wong-staal@laravue.dev', null, null, '$2y$10$cOnDNhJNvR2hHjNUu9AOVe6A0lvS5.rTGnbOLLqGO6w1SO5OiK.VC', null, '2019-12-03 03:53:55', '2019-12-03 03:53:55', '1', '0');
INSERT INTO `users` VALUES ('20', null, null, 'Frieda Robscheit-Robbins', null, 'frieda.robscheit-robbins@laravue.dev', null, null, '$2y$10$lFfvGPeYUCiin6KovWu0b.Sl7.He8cUyYNnuYPYexO2MBCddZupJC', null, '2019-12-03 03:53:55', '2019-12-03 03:53:55', '1', '0');
INSERT INTO `users` VALUES ('21', null, null, 'Geraldine Seydoux', null, 'geraldine.seydoux@laravue.dev', null, null, '$2y$10$8a9ZXllDAXHhwp6nEKLXLuhmEwxyIuc0pjGSHONel0uTMxokh70bO', null, '2019-12-03 03:53:55', '2019-12-03 03:53:55', '1', '0');
INSERT INTO `users` VALUES ('22', null, null, 'Gertrude B. Elion', null, 'gertrude.b..elion@laravue.dev', null, null, '$2y$10$hxRt2YwjYSYyKl3IIavBMO0rD.rN.QZn.Bks5RSwwQaTaULtek1pW', null, '2019-12-03 03:53:55', '2019-12-03 03:53:55', '1', '0');
INSERT INTO `users` VALUES ('23', null, null, 'Ingrid Daubechies', null, 'ingrid.daubechies@laravue.dev', null, null, '$2y$10$q66Ll9FUvrwojPHp7l0YTu8.f0TFW40cD9W.q8HDrqDFXWhdKo.4y', null, '2019-12-03 03:53:56', '2019-12-03 03:53:56', '1', '0');
INSERT INTO `users` VALUES ('24', null, null, 'Jacqueline K. Barton', null, 'jacqueline.k..barton@laravue.dev', null, null, '$2y$10$w1IPOTZlLWWI3zbUxcxNneS/Pvi2GLL4dqrz2NhTBeNeQej06/7hq', null, '2019-12-03 03:53:56', '2019-12-03 03:53:56', null, '0');
INSERT INTO `users` VALUES ('25', null, null, 'Jane Goodall', null, 'jane.goodall@laravue.dev', null, null, '$2y$10$ArP9r3EbZUPZq58lVfpqW.CjHN6lIWeYxdG1lyOkX2acRm1W24JCu', null, '2019-12-03 03:53:56', '2019-12-03 03:53:56', null, '0');
INSERT INTO `users` VALUES ('26', null, null, 'Jocelyn Bell Burnell', null, 'jocelyn.bell.burnell@laravue.dev', null, null, '$2y$10$fmGEaxhhKUeYY.JKZIHplOehjiYkg40Sj7qNh8h5a3XdcErSvDKKi', null, '2019-12-03 03:53:56', '2019-12-03 03:53:56', null, '0');
INSERT INTO `users` VALUES ('27', null, null, 'Johannes Kepler', null, 'johannes.kepler@laravue.dev', null, null, '$2y$10$nKlz9Sl3tszxu/8AWR70qec9BQCXQBcuv/IHCtnbW8rsioSoUjABS', null, '2019-12-03 03:53:56', '2019-12-03 03:53:56', null, '0');
INSERT INTO `users` VALUES ('28', null, null, 'Lene Vestergaard Hau', null, 'lene.vestergaard.hau@laravue.dev', null, null, '$2y$10$l7jcEXz86gg9XR7B6MminufDqhDBsWQbdexG/TQFZEJyYtM3LENtC', null, '2019-12-03 03:53:56', '2019-12-03 03:53:56', null, '0');
INSERT INTO `users` VALUES ('29', null, null, 'Lise Meitner', null, 'lise.meitner@laravue.dev', null, null, '$2y$10$4WxlVPretEYvFPfhOiIazOfqa8q6QRpZ7HTXxnBN1IF1SRHYM2zE6', null, '2019-12-03 03:53:56', '2019-12-03 03:53:56', null, '0');
INSERT INTO `users` VALUES ('30', null, null, 'Lord Kelvin', null, 'lord.kelvin@laravue.dev', null, null, '$2y$10$kwexTqk/XUMVDUh/uczaD.u6qTGKQ7ah9.gFTRCnCNuZyVCBbUBUG', null, '2019-12-03 03:53:56', '2019-12-03 03:53:56', null, '0');
INSERT INTO `users` VALUES ('31', null, null, 'Maria Mitchell', null, 'maria.mitchell@laravue.dev', null, null, '$2y$10$N/oWgxuIbVQd5QMj5Uyp8uz5P.2JJ5z5xP7/Df42yIjqKqc6c0sxG', null, '2019-12-03 03:53:57', '2019-12-03 03:53:57', null, '0');
INSERT INTO `users` VALUES ('32', null, null, 'Marie Curie', null, 'marie.curie@laravue.dev', null, null, '$2y$10$1Y43UPYo8VMfld9x30favOjjO92ECHtJM9HQNgI3Gy6r9uBwp4Gei', null, '2019-12-03 03:53:57', '2019-12-03 03:53:57', null, '0');
INSERT INTO `users` VALUES ('33', null, null, 'Max Born', null, 'max.born@laravue.dev', null, null, '$2y$10$iSUxMzp7tL0LwfeicfUn6OL/3VF7a5xhFLdk8MhdnOX5tMFsA5L5S', null, '2019-12-03 03:53:57', '2019-12-03 03:53:57', null, '0');
INSERT INTO `users` VALUES ('34', null, null, 'Max Planck', null, 'max.planck@laravue.dev', null, null, '$2y$10$VhlMl1N7lu8pzDOx5iaA2O8tjI5IRc11UOVC2rGyGX.YIuTXEBMu2', null, '2019-12-03 03:53:57', '2019-12-03 03:53:57', null, '0');
INSERT INTO `users` VALUES ('35', null, null, 'Melissa Franklin', null, 'melissa.franklin@laravue.dev', null, null, '$2y$10$qFMJRJBr.eSTp/T4jP1I6.tzmfZlCc/ZeQVWSOb1BlCDgKKWX51VC', null, '2019-12-03 03:53:57', '2019-12-03 03:53:57', null, '0');
INSERT INTO `users` VALUES ('36', null, null, 'Michael Faraday', null, 'michael.faraday@laravue.dev', null, null, '$2y$10$ziVHW7AayMWrjxDPsKYSwOACLv.LipeoflM.Fg5FhkBcQnb9E3Ffq', null, '2019-12-03 03:53:57', '2019-12-03 03:53:57', null, '0');
INSERT INTO `users` VALUES ('37', null, null, 'Mildred S. Dresselhaus', null, 'mildred.s..dresselhaus@laravue.dev', null, null, '$2y$10$DFT2.NjqDEgAYIVyf24A2eXn5MajtR2mUgwICE.HgZTOidDtLSDKq', null, '2019-12-03 03:53:58', '2019-12-03 03:53:58', null, '0');
INSERT INTO `users` VALUES ('38', null, null, 'Nicolaus Copernicus', null, 'nicolaus.copernicus@laravue.dev', null, null, '$2y$10$..Vdy6lu6NzUn9LjcPKyHues4gBJ5.V5hyUW3gsAzlHCE3frkIf9i', null, '2019-12-03 03:53:58', '2019-12-03 03:53:58', null, '0');
INSERT INTO `users` VALUES ('39', null, null, 'Niels Bohr', null, 'niels.bohr@laravue.dev', null, null, '$2y$10$vew4cnxZFp11Ri9mDbUJkuU86KlRbq95A5QhqgLdBhfOl18vPgFba', null, '2019-12-03 03:53:58', '2019-12-03 03:53:58', null, '0');
INSERT INTO `users` VALUES ('40', null, null, 'Patricia S. Goldman-Rakic', null, 'patricia.s..goldman-rakic@laravue.dev', null, null, '$2y$10$hfKiY37pbnb5WwJ/Hlgy9uL.c1L4dARNR5m6fxv.IYLqJqdvnqVae', null, '2019-12-03 03:53:58', '2019-12-03 03:53:58', null, '0');
INSERT INTO `users` VALUES ('41', null, null, 'Patty Jo Watson', null, 'patty.jo.watson@laravue.dev', null, null, '$2y$10$4RTwN/FdWhSp2G0nNkayneRraAW.b6dk70VoTBGNf/fFuHh2cBXGu', null, '2019-12-03 03:53:58', '2019-12-03 03:53:58', null, '0');
INSERT INTO `users` VALUES ('42', null, null, 'Polly Matzinger', null, 'polly.matzinger@laravue.dev', null, null, '$2y$10$rS4FB.I0P.sx8AH2.Z2Y8.VE7Zmn6212zZT6sb/fUR71McEnYUXgO', null, '2019-12-03 03:53:58', '2019-12-03 03:53:58', null, '0');
INSERT INTO `users` VALUES ('43', null, null, 'Richard Phillips Feynman', null, 'richard.phillips.feynman@laravue.dev', null, null, '$2y$10$8So73U46il3ANlUw5OS3GO3q88UlcxcIVurhHyzk16ZdsJVfADDJK', null, '2019-12-03 03:53:58', '2019-12-03 03:53:58', null, '0');
INSERT INTO `users` VALUES ('44', null, null, 'Rita Levi-Montalcini', null, 'rita.levi-montalcini@laravue.dev', null, null, '$2y$10$XV2hZnSDJXucG0X5SmjPH.43MvT2XFP72Y9i4NWXBJ778ZA5cg.F.', null, '2019-12-03 03:53:58', '2019-12-03 03:53:58', null, '0');
INSERT INTO `users` VALUES ('45', null, null, 'Rosalind Franklin', null, 'rosalind.franklin@laravue.dev', null, null, '$2y$10$y/7JJ3/QMpffLo6GtATFs.FENZshZXkrV3U2u.Vuyy523E/5f8BFG', null, '2019-12-03 03:53:58', '2019-12-03 03:53:58', null, '0');
INSERT INTO `users` VALUES ('46', null, null, 'Ruzena Bajcsy', null, 'ruzena.bajcsy@laravue.dev', null, null, '$2y$10$xrimzZ039.GCIQJ93wDC8.cW9a9oXWeIjgzgznys4ylduBh2mji9S', null, '2019-12-03 03:53:59', '2019-12-03 03:53:59', null, '0');
INSERT INTO `users` VALUES ('47', null, null, 'Sarah Boysen', null, 'sarah.boysen@laravue.dev', null, null, '$2y$10$3RWHyhe9fSzCsAXhMkYvj.TnrEgbpXAEp8QyPoN2/mZahGGyLFPLu', null, '2019-12-03 03:53:59', '2019-12-03 03:53:59', null, '0');
INSERT INTO `users` VALUES ('48', null, null, 'Shannon W. Lucid', null, 'shannon.w..lucid@laravue.dev', null, null, '$2y$10$KiPrpKLzNBlSeLVu6yIoZOs7FRMFv22ObbWoC0YAXWJQGVv7GEHVe', null, '2019-12-03 03:53:59', '2019-12-03 03:53:59', null, '0');
INSERT INTO `users` VALUES ('49', null, null, 'Shirley Ann Jackson', null, 'shirley.ann.jackson@laravue.dev', null, null, '$2y$10$NA/EE66Mg8NM4zj.1R1iEu8eNz7fX2vaUB4Yluk3G88m.U/fj1xFW', null, '2019-12-03 03:53:59', '2019-12-03 03:53:59', null, '0');
INSERT INTO `users` VALUES ('50', null, null, 'Sir Ernest Rutherford', null, 'sir.ernest.rutherford@laravue.dev', null, null, '$2y$10$kJlO9JAvJ8S/E/ZxNrSno.hTQkSEznxm.OSVjFU0ShoJ.pgBDM5wa', null, '2019-12-03 03:53:59', '2019-12-03 03:53:59', null, '0');
INSERT INTO `users` VALUES ('51', null, null, 'Sir Isaac Newton', null, 'sir.isaac.newton@laravue.dev', null, null, '$2y$10$HZNEZ5Ao4cbTYrhcaHaYhOvsp9cghVF0PUqPmm9o.BKkNGPNd28n2', null, '2019-12-03 03:53:59', '2019-12-03 03:53:59', null, '0');
INSERT INTO `users` VALUES ('52', null, null, 'Stephen Hawking', null, 'stephen.hawking@laravue.dev', null, null, '$2y$10$OGWcOjT6vaRsuyZBcSHEbuOlyFWcZC/Hhn270rju8pWtZ/7GBcW66', null, '2019-12-03 03:53:59', '2019-12-03 03:53:59', null, '0');
INSERT INTO `users` VALUES ('53', null, null, 'Werner Karl Heisenberg', null, 'werner.karl.heisenberg@laravue.dev', null, null, '$2y$10$Woyj3Pr6BgjQeIPqKpi1YeSk/Ch8YLFy.8T9tvBW/5jG.iPdXo/A.', null, '2019-12-03 03:54:00', '2019-12-03 03:54:00', null, '0');
INSERT INTO `users` VALUES ('54', null, null, 'Wilhelm Conrad Roentgen', null, 'wilhelm.conrad.roentgen@laravue.dev', null, null, '$2y$10$KEpw9wihlm.v2Q9ubMB4dOGihY6sNNORBfe1EVvLTsu.Z5HqQ5vIO', null, '2019-12-03 03:54:00', '2019-12-03 03:54:00', null, '0');
INSERT INTO `users` VALUES ('55', null, null, 'Wolfgang Ernst Pauli', null, 'wolfgang.ernst.pauli@laravue.dev', null, null, '$2y$10$cqPcBss1hOQnyvSvjRpSX.S4WwiLpdwfvQ8VfZjYMoaYVBnQgVCbG', null, '2019-12-03 03:54:00', '2019-12-03 03:54:00', null, '0');
