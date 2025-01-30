/*
 Navicat Premium Data Transfer

 Source Server         : Nelisa Farma
 Source Server Type    : MySQL
 Source Server Version : 80030
 Source Host           : localhost:3306
 Source Schema         : nelisa

 Target Server Type    : MySQL
 Target Server Version : 80030
 File Encoding         : 65001

 Date: 17/01/2025 11:07:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for adms_cads_usuarios
-- ----------------------------
DROP TABLE IF EXISTS `adms_cads_usuarios`;
CREATE TABLE `adms_cads_usuarios`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `env_email_conf` int NOT NULL,
  `adms_niveis_acesso_id` int NOT NULL,
  `adms_sits_usuario_id` int NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = FIXED;

-- ----------------------------
-- Records of adms_cads_usuarios
-- ----------------------------
INSERT INTO `adms_cads_usuarios` VALUES (1, 2, 5, 3, '2018-06-23 00:00:00', '2018-06-29 22:24:18');

-- ----------------------------
-- Table structure for adms_confs_emails
-- ----------------------------
DROP TABLE IF EXISTS `adms_confs_emails`;
CREATE TABLE `adms_confs_emails`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(220) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `email` varchar(220) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `host` varchar(220) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `usuario` varchar(220) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `senha` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `smtpsecure` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `porta` int NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of adms_confs_emails
-- ----------------------------
INSERT INTO `adms_confs_emails` VALUES (1, '', '', '', '', '', '', 547, '2018-06-23 00:00:00', '2018-06-29 19:12:47');

-- ----------------------------
-- Table structure for adms_cors
-- ----------------------------
DROP TABLE IF EXISTS `adms_cors`;
CREATE TABLE `adms_cors`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `cor` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 10 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of adms_cors
-- ----------------------------
INSERT INTO `adms_cors` VALUES (1, 'Azul', 'primary', '2018-05-23 00:00:00', '2018-06-29 20:06:34');
INSERT INTO `adms_cors` VALUES (2, 'Cinza', 'secondary', '2018-05-23 00:00:00', NULL);
INSERT INTO `adms_cors` VALUES (3, 'Verde', 'success', '2018-05-23 00:00:00', NULL);
INSERT INTO `adms_cors` VALUES (4, 'Vermelho', 'danger', '2018-05-23 00:00:00', NULL);
INSERT INTO `adms_cors` VALUES (5, 'Laranjado', 'warning', '2018-05-23 00:00:00', NULL);
INSERT INTO `adms_cors` VALUES (6, 'Azul claro', 'info', '2018-05-23 00:00:00', NULL);
INSERT INTO `adms_cors` VALUES (7, 'Claro', 'light', '2018-05-23 00:00:00', NULL);
INSERT INTO `adms_cors` VALUES (8, 'Cinza escuro', 'dark', '2018-05-23 00:00:00', NULL);

-- ----------------------------
-- Table structure for adms_grps_pgs
-- ----------------------------
DROP TABLE IF EXISTS `adms_grps_pgs`;
CREATE TABLE `adms_grps_pgs`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ordem` int NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 11 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of adms_grps_pgs
-- ----------------------------
INSERT INTO `adms_grps_pgs` VALUES (1, 'Listar', 1, '2018-05-23 00:00:00', '2018-06-29 21:36:41');
INSERT INTO `adms_grps_pgs` VALUES (2, 'Cadastrar', 2, '2018-05-23 00:00:00', '2018-06-29 22:30:06');
INSERT INTO `adms_grps_pgs` VALUES (3, 'Editar', 3, '2018-05-23 00:00:00', '2018-06-29 22:30:06');
INSERT INTO `adms_grps_pgs` VALUES (4, 'Apagar', 4, '2018-05-23 00:00:00', NULL);
INSERT INTO `adms_grps_pgs` VALUES (5, 'Visualizar', 5, '2018-05-23 00:00:00', NULL);
INSERT INTO `adms_grps_pgs` VALUES (6, 'Outros', 6, '2018-05-23 00:00:00', NULL);
INSERT INTO `adms_grps_pgs` VALUES (7, 'Acesso', 7, '2018-05-23 00:00:00', '2018-06-29 21:35:16');
INSERT INTO `adms_grps_pgs` VALUES (8, 'Alterar Ordem', 8, '2018-06-23 00:00:00', '2018-06-29 21:35:16');

-- ----------------------------
-- Table structure for adms_menus
-- ----------------------------
DROP TABLE IF EXISTS `adms_menus`;
CREATE TABLE `adms_menus`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(220) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `icone` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ordem` int NOT NULL,
  `adms_sit_id` int NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 492 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of adms_menus
-- ----------------------------
INSERT INTO `adms_menus` VALUES (1, 'Principal', 'fas fa-tachometer-alt', 1, 1, '2018-05-23 00:00:00', '2021-10-15 12:47:37');
INSERT INTO `adms_menus` VALUES (2, 'Usuário', 'fas fa-user', 34, 1, '2018-05-23 00:00:00', '2025-01-17 10:41:48');
INSERT INTO `adms_menus` VALUES (3, 'Sair', 'fas fa-sign-out-alt', 35, 1, '2018-06-23 00:00:00', '2025-01-17 10:41:45');
INSERT INTO `adms_menus` VALUES (4, 'Configuração', 'fas fa-cogs', 32, 1, '2018-06-23 00:00:00', '2025-01-17 10:42:08');
INSERT INTO `adms_menus` VALUES (42, 'Registar Dados', 'fas fa-edit', 25, 1, '2021-11-16 13:12:10', '2021-12-13 08:39:41');
INSERT INTO `adms_menus` VALUES (489, 'Estatísticas', 'fas fa-list', 29, 1, '2022-07-17 17:47:40', '2022-07-17 17:50:19');
INSERT INTO `adms_menus` VALUES (46, 'Consultas Médicas', 'fas fa-edit', 26, 1, '2022-04-14 10:09:46', '2022-04-14 10:10:46');
INSERT INTO `adms_menus` VALUES (47, 'Agendamentos', 'fas fa-edit', 27, 0, '0000-00-00 00:00:00', NULL);
INSERT INTO `adms_menus` VALUES (48, 'Relatórios', 'fas fa-print', 28, 1, '2022-07-06 10:04:18', '2022-07-06 10:17:13');
INSERT INTO `adms_menus` VALUES (490, 'Médico', 'fas fa-user', 33, 1, '2022-09-27 13:25:30', '2025-01-17 10:41:52');
INSERT INTO `adms_menus` VALUES (491, 'Registar Venda', 'fas fa-edit', 31, 1, '2024-12-25 14:53:20', '2025-01-17 10:42:08');

-- ----------------------------
-- Table structure for adms_nivacs_pgs
-- ----------------------------
DROP TABLE IF EXISTS `adms_nivacs_pgs`;
CREATE TABLE `adms_nivacs_pgs`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `permissao` int NOT NULL,
  `ordem` int NOT NULL,
  `dropdown` int NOT NULL DEFAULT 2,
  `lib_menu` int NOT NULL DEFAULT 2,
  `adms_menu_id` int NOT NULL DEFAULT 4,
  `adms_niveis_acesso_id` int NOT NULL,
  `adms_pagina_id` int NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2018 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = FIXED;

-- ----------------------------
-- Records of adms_nivacs_pgs
-- ----------------------------
INSERT INTO `adms_nivacs_pgs` VALUES (1, 1, 1, 2, 1, 1, 1, 1, '2018-05-23 00:00:00', '2019-01-28 09:56:38');
INSERT INTO `adms_nivacs_pgs` VALUES (2, 1, 2, 1, 1, 2, 1, 2, '2018-05-23 00:00:00', '2018-06-25 12:52:11');
INSERT INTO `adms_nivacs_pgs` VALUES (3, 1, 4, 2, 1, 3, 1, 4, '2018-05-23 00:00:00', '2019-02-06 11:51:08');
INSERT INTO `adms_nivacs_pgs` VALUES (4, 1, 5, 2, 2, 4, 1, 5, '2018-05-23 00:00:00', '2021-11-29 10:30:05');
INSERT INTO `adms_nivacs_pgs` VALUES (5, 1, 6, 1, 2, 2, 1, 7, '2018-06-23 00:00:00', '2018-06-25 11:19:17');
INSERT INTO `adms_nivacs_pgs` VALUES (6, 1, 7, 2, 2, 2, 1, 9, '2018-06-23 00:00:00', '2018-06-25 11:19:16');
INSERT INTO `adms_nivacs_pgs` VALUES (7, 1, 8, 2, 2, 2, 1, 10, '2018-06-23 00:00:00', '2019-01-30 08:39:38');
INSERT INTO `adms_nivacs_pgs` VALUES (8, 1, 9, 2, 2, 2, 1, 11, '2018-06-23 00:00:00', '2018-06-25 11:19:13');
INSERT INTO `adms_nivacs_pgs` VALUES (9, 1, 10, 2, 2, 2, 1, 12, '2018-06-23 00:00:00', '2019-01-28 11:56:29');
INSERT INTO `adms_nivacs_pgs` VALUES (10, 1, 11, 2, 2, 2, 1, 13, '2018-06-23 00:00:00', '2018-06-28 16:22:00');
INSERT INTO `adms_nivacs_pgs` VALUES (11, 1, 12, 2, 2, 2, 1, 14, '2018-06-23 00:00:00', '2018-06-25 11:50:15');
INSERT INTO `adms_nivacs_pgs` VALUES (12, 1, 13, 2, 2, 2, 1, 15, '2018-06-23 00:00:00', '2018-06-25 11:50:15');
INSERT INTO `adms_nivacs_pgs` VALUES (13, 1, 15, 2, 2, 2, 1, 16, '2018-06-23 00:00:00', '2018-06-25 11:57:33');
INSERT INTO `adms_nivacs_pgs` VALUES (25, 1, 3, 1, 1, 2, 1, 17, '2018-06-23 00:00:00', '2019-02-06 11:50:54');
INSERT INTO `adms_nivacs_pgs` VALUES (26, 1, 14, 2, 2, 2, 1, 18, '2018-06-23 00:00:00', '2018-06-25 11:57:33');
INSERT INTO `adms_nivacs_pgs` VALUES (27, 1, 16, 2, 2, 2, 1, 19, '2018-06-23 00:00:00', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (28, 1, 17, 2, 2, 2, 1, 20, '2018-06-23 00:00:00', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (29, 1, 18, 2, 2, 2, 1, 21, '2018-06-23 00:00:00', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (30, 1, 19, 2, 2, 2, 1, 22, '2018-06-23 00:00:00', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (37, 1, 20, 1, 1, 4, 1, 23, '2018-06-23 00:00:00', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (38, 1, 21, 2, 2, 4, 1, 24, '2018-06-23 00:00:00', '2019-01-28 09:50:18');
INSERT INTO `adms_nivacs_pgs` VALUES (39, 1, 22, 2, 2, 4, 1, 25, '2018-06-22 14:25:21', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (44, 1, 23, 2, 2, 4, 1, 26, '2018-06-22 14:43:47', '2019-01-28 09:49:33');
INSERT INTO `adms_nivacs_pgs` VALUES (49, 1, 24, 2, 2, 4, 1, 27, '2018-06-22 19:17:43', '2019-01-28 09:49:43');
INSERT INTO `adms_nivacs_pgs` VALUES (54, 1, 25, 2, 2, 4, 1, 28, '2018-06-24 11:59:53', '2019-01-28 09:50:34');
INSERT INTO `adms_nivacs_pgs` VALUES (59, 1, 26, 2, 2, 4, 1, 29, '2018-06-24 12:52:42', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (67, 1, 27, 2, 2, 4, 1, 30, '2018-06-25 09:48:29', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (72, 1, 28, 2, 2, 4, 1, 31, '2018-06-25 10:24:39', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (77, 1, 29, 2, 2, 4, 1, 32, '2018-06-25 10:56:36', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (82, 1, 30, 2, 2, 4, 1, 33, '2018-06-26 12:23:37', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (87, 1, 31, 2, 2, 4, 1, 3, '2018-06-26 13:10:37', '2019-01-28 09:54:57');
INSERT INTO `adms_nivacs_pgs` VALUES (88, 1, 32, 2, 2, 4, 1, 6, '2018-06-26 13:10:37', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (89, 1, 33, 2, 2, 4, 1, 8, '2018-06-26 13:10:37', '2019-01-28 09:53:47');
INSERT INTO `adms_nivacs_pgs` VALUES (166, 1, 34, 2, 2, 4, 1, 34, '2018-06-28 16:11:35', '2019-01-28 09:54:15');
INSERT INTO `adms_nivacs_pgs` VALUES (171, 1, 35, 1, 1, 4, 1, 35, '2018-06-28 16:40:32', '2019-01-28 09:54:22');
INSERT INTO `adms_nivacs_pgs` VALUES (172, 1, 36, 2, 2, 4, 1, 36, '2018-06-28 16:40:32', '2019-01-28 09:52:42');
INSERT INTO `adms_nivacs_pgs` VALUES (173, 1, 37, 2, 2, 4, 1, 37, '2018-06-28 16:40:32', '2019-01-28 09:52:48');
INSERT INTO `adms_nivacs_pgs` VALUES (174, 1, 38, 2, 2, 4, 1, 38, '2018-06-28 16:40:32', '2019-01-28 09:52:50');
INSERT INTO `adms_nivacs_pgs` VALUES (175, 1, 39, 2, 2, 4, 1, 39, '2018-06-28 16:40:32', '2019-01-28 09:52:56');
INSERT INTO `adms_nivacs_pgs` VALUES (176, 1, 40, 2, 2, 4, 1, 40, '2018-06-28 16:40:32', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (201, 1, 41, 1, 1, 4, 1, 41, '2018-06-29 18:33:56', '2018-06-29 18:34:12');
INSERT INTO `adms_nivacs_pgs` VALUES (206, 1, 42, 1, 1, 4, 1, 42, '2018-06-29 18:56:15', '2018-06-29 18:56:30');
INSERT INTO `adms_nivacs_pgs` VALUES (211, 1, 43, 1, 1, 4, 1, 43, '2018-06-29 19:32:21', '2018-06-29 19:32:33');
INSERT INTO `adms_nivacs_pgs` VALUES (216, 1, 44, 2, 2, 4, 1, 44, '2018-06-29 19:50:19', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (221, 1, 45, 2, 2, 4, 1, 45, '2018-06-29 19:59:53', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (226, 1, 46, 2, 2, 4, 1, 46, '2018-06-29 20:09:35', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (231, 1, 47, 2, 2, 4, 1, 47, '2018-06-29 20:17:36', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (236, 1, 48, 1, 1, 4, 1, 48, '2018-06-29 20:29:31', '2018-06-29 20:29:45');
INSERT INTO `adms_nivacs_pgs` VALUES (241, 1, 49, 2, 2, 4, 1, 49, '2018-06-29 20:40:11', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (246, 1, 50, 2, 2, 4, 1, 50, '2018-06-29 20:58:30', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (251, 1, 51, 2, 2, 4, 1, 51, '2018-06-29 21:08:41', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (256, 1, 52, 2, 2, 4, 1, 52, '2018-06-29 21:19:34', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (261, 1, 53, 2, 2, 4, 1, 53, '2018-06-29 21:31:23', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (266, 1, 54, 1, 1, 4, 1, 54, '2018-06-29 21:40:39', '2018-06-29 21:40:53');
INSERT INTO `adms_nivacs_pgs` VALUES (271, 1, 55, 2, 2, 4, 1, 55, '2018-06-29 21:50:13', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (276, 1, 56, 2, 2, 4, 1, 56, '2018-06-29 22:13:11', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (281, 1, 57, 2, 2, 4, 1, 57, '2018-06-29 22:21:25', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (286, 1, 58, 2, 2, 4, 1, 58, '2018-06-29 22:26:52', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (291, 1, 59, 2, 2, 4, 1, 59, '2018-06-29 22:38:00', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (296, 1, 60, 1, 1, 4, 1, 60, '2018-06-29 22:48:28', '2018-06-29 22:53:30');
INSERT INTO `adms_nivacs_pgs` VALUES (301, 1, 61, 2, 2, 4, 1, 61, '2018-06-29 23:04:17', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (306, 1, 62, 2, 2, 4, 1, 62, '2018-06-29 23:11:35', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (311, 1, 63, 2, 2, 4, 1, 63, '2018-06-29 23:20:52', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (316, 1, 64, 2, 2, 4, 1, 64, '2018-06-29 23:27:34', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (321, 1, 65, 1, 1, 4, 1, 65, '2018-06-29 23:44:50', '2018-06-29 23:45:00');
INSERT INTO `adms_nivacs_pgs` VALUES (326, 1, 66, 2, 2, 4, 1, 66, '2018-06-29 23:53:53', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (331, 1, 67, 2, 2, 4, 1, 67, '2018-06-29 23:57:43', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (336, 1, 68, 2, 2, 4, 1, 68, '2018-06-30 00:03:44', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (341, 1, 69, 2, 2, 4, 1, 69, '2018-06-30 00:09:08', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (346, 1, 70, 1, 1, 4, 1, 70, '2018-06-30 00:22:52', '2018-06-30 00:23:08');
INSERT INTO `adms_nivacs_pgs` VALUES (351, 1, 71, 2, 2, 4, 1, 71, '2018-06-30 00:35:47', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (356, 1, 72, 2, 2, 4, 1, 72, '2018-06-30 00:41:58', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (361, 1, 73, 2, 2, 4, 1, 73, '2018-06-30 00:47:33', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (366, 1, 74, 2, 2, 4, 1, 74, '2018-06-30 00:53:21', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (426, 1, 77, 2, 2, 4, 1, 86, '2019-03-21 08:56:24', '2019-04-01 13:01:07');
INSERT INTO `adms_nivacs_pgs` VALUES (826, 1, 16, 2, 2, 4, 2, 16, '2019-06-25 14:51:17', '2021-05-04 13:42:25');
INSERT INTO `adms_nivacs_pgs` VALUES (858, 2, 48, 2, 2, 4, 2, 48, '2019-06-25 14:51:17', '2020-02-17 10:31:23');
INSERT INTO `adms_nivacs_pgs` VALUES (431, 1, 78, 2, 2, 4, 1, 87, '2019-03-21 10:16:45', '2019-04-01 13:01:07');
INSERT INTO `adms_nivacs_pgs` VALUES (842, 2, 32, 2, 2, 4, 2, 32, '2019-06-25 14:51:17', '2020-02-17 10:31:23');
INSERT INTO `adms_nivacs_pgs` VALUES (436, 1, 79, 2, 2, 4, 1, 88, '2019-03-21 12:00:56', '2019-04-01 13:01:07');
INSERT INTO `adms_nivacs_pgs` VALUES (825, 1, 15, 2, 2, 4, 2, 15, '2019-06-25 14:51:17', '2021-05-04 13:42:15');
INSERT INTO `adms_nivacs_pgs` VALUES (857, 2, 47, 2, 2, 4, 2, 47, '2019-06-25 14:51:17', '2020-02-17 10:31:23');
INSERT INTO `adms_nivacs_pgs` VALUES (841, 2, 31, 2, 2, 4, 2, 31, '2019-06-25 14:51:17', '2020-02-17 10:31:23');
INSERT INTO `adms_nivacs_pgs` VALUES (824, 1, 14, 2, 2, 4, 2, 14, '2019-06-25 14:51:17', '2021-05-04 13:42:36');
INSERT INTO `adms_nivacs_pgs` VALUES (856, 2, 46, 2, 2, 4, 2, 46, '2019-06-25 14:51:17', '2020-02-17 10:31:23');
INSERT INTO `adms_nivacs_pgs` VALUES (451, 1, 82, 2, 2, 4, 1, 91, '2019-03-25 14:17:33', '2019-04-01 13:01:07');
INSERT INTO `adms_nivacs_pgs` VALUES (840, 2, 30, 2, 2, 4, 2, 30, '2019-06-25 14:51:17', '2020-02-17 10:31:23');
INSERT INTO `adms_nivacs_pgs` VALUES (823, 1, 13, 2, 2, 4, 2, 13, '2019-06-25 14:51:17', '2021-05-04 13:42:31');
INSERT INTO `adms_nivacs_pgs` VALUES (855, 2, 45, 2, 2, 4, 2, 45, '2019-06-25 14:51:17', '2020-02-17 10:31:23');
INSERT INTO `adms_nivacs_pgs` VALUES (839, 2, 29, 2, 2, 4, 2, 29, '2019-06-25 14:51:17', '2020-02-17 10:31:23');
INSERT INTO `adms_nivacs_pgs` VALUES (466, 1, 85, 2, 2, 4, 1, 94, '2019-03-27 14:41:23', '2019-04-01 13:01:07');
INSERT INTO `adms_nivacs_pgs` VALUES (822, 1, 12, 2, 2, 4, 2, 12, '2019-06-25 14:51:17', '2021-05-04 13:42:32');
INSERT INTO `adms_nivacs_pgs` VALUES (854, 2, 44, 2, 2, 4, 2, 44, '2019-06-25 14:51:17', '2020-02-17 10:31:23');
INSERT INTO `adms_nivacs_pgs` VALUES (471, 1, 86, 2, 2, 4, 1, 95, '2019-03-27 14:42:08', '2019-04-01 13:01:07');
INSERT INTO `adms_nivacs_pgs` VALUES (838, 2, 28, 2, 2, 4, 2, 28, '2019-06-25 14:51:17', '2020-02-17 10:31:23');
INSERT INTO `adms_nivacs_pgs` VALUES (476, 1, 87, 2, 2, 4, 1, 96, '2019-03-27 14:43:08', '2019-04-01 13:01:07');
INSERT INTO `adms_nivacs_pgs` VALUES (821, 1, 11, 2, 2, 4, 2, 11, '2019-06-25 14:51:17', '2021-05-04 13:42:33');
INSERT INTO `adms_nivacs_pgs` VALUES (853, 2, 43, 2, 2, 4, 2, 43, '2019-06-25 14:51:17', '2020-02-17 10:31:23');
INSERT INTO `adms_nivacs_pgs` VALUES (837, 2, 27, 2, 2, 4, 2, 27, '2019-06-25 14:51:17', '2020-02-17 10:31:23');
INSERT INTO `adms_nivacs_pgs` VALUES (481, 1, 88, 2, 2, 4, 1, 97, '2019-03-27 14:44:29', '2019-04-01 13:01:07');
INSERT INTO `adms_nivacs_pgs` VALUES (820, 1, 10, 2, 2, 4, 2, 10, '2019-06-25 14:51:17', '2021-05-04 13:41:59');
INSERT INTO `adms_nivacs_pgs` VALUES (852, 2, 42, 2, 2, 4, 2, 42, '2019-06-25 14:51:17', '2020-02-17 10:31:23');
INSERT INTO `adms_nivacs_pgs` VALUES (836, 2, 26, 2, 2, 4, 2, 26, '2019-06-25 14:51:17', '2020-02-17 10:31:23');
INSERT INTO `adms_nivacs_pgs` VALUES (819, 1, 9, 1, 1, 2, 2, 9, '2019-06-25 14:51:17', '2022-09-27 13:29:52');
INSERT INTO `adms_nivacs_pgs` VALUES (851, 2, 41, 2, 2, 4, 2, 41, '2019-06-25 14:51:17', '2020-02-17 10:31:23');
INSERT INTO `adms_nivacs_pgs` VALUES (835, 2, 25, 2, 2, 4, 2, 25, '2019-06-25 14:51:17', '2020-02-17 10:31:23');
INSERT INTO `adms_nivacs_pgs` VALUES (818, 1, 8, 2, 2, 4, 2, 8, '2019-06-25 14:51:17', '2020-02-17 10:31:23');
INSERT INTO `adms_nivacs_pgs` VALUES (850, 2, 40, 2, 2, 4, 2, 40, '2019-06-25 14:51:17', '2020-02-17 10:31:23');
INSERT INTO `adms_nivacs_pgs` VALUES (834, 2, 24, 2, 2, 4, 2, 24, '2019-06-25 14:51:17', '2020-02-17 10:31:23');
INSERT INTO `adms_nivacs_pgs` VALUES (817, 1, 7, 2, 2, 4, 2, 7, '2019-06-25 14:51:17', '2020-02-17 10:31:23');
INSERT INTO `adms_nivacs_pgs` VALUES (849, 2, 39, 2, 2, 4, 2, 39, '2019-06-25 14:51:17', '2020-02-17 10:31:23');
INSERT INTO `adms_nivacs_pgs` VALUES (833, 2, 23, 2, 2, 4, 2, 23, '2019-06-25 14:51:17', '2020-02-17 10:31:23');
INSERT INTO `adms_nivacs_pgs` VALUES (816, 1, 6, 2, 2, 4, 2, 6, '2019-06-25 14:51:17', '2020-02-17 10:31:23');
INSERT INTO `adms_nivacs_pgs` VALUES (848, 2, 38, 2, 2, 4, 2, 38, '2019-06-25 14:51:17', '2020-02-17 10:31:23');
INSERT INTO `adms_nivacs_pgs` VALUES (832, 2, 22, 2, 2, 4, 2, 22, '2019-06-25 14:51:17', '2020-02-17 10:31:23');
INSERT INTO `adms_nivacs_pgs` VALUES (815, 1, 5, 2, 2, 4, 2, 5, '2019-06-25 14:51:17', '2020-02-17 10:31:23');
INSERT INTO `adms_nivacs_pgs` VALUES (847, 2, 37, 2, 2, 4, 2, 37, '2019-06-25 14:51:17', '2020-02-17 10:31:23');
INSERT INTO `adms_nivacs_pgs` VALUES (831, 2, 21, 2, 2, 4, 2, 21, '2019-06-25 14:51:17', '2020-02-17 10:31:23');
INSERT INTO `adms_nivacs_pgs` VALUES (814, 1, 4, 2, 1, 3, 2, 4, '2019-06-25 14:51:17', '2022-09-27 13:05:03');
INSERT INTO `adms_nivacs_pgs` VALUES (846, 2, 36, 2, 2, 4, 2, 36, '2019-06-25 14:51:17', '2020-02-17 10:31:23');
INSERT INTO `adms_nivacs_pgs` VALUES (830, 2, 20, 2, 2, 4, 2, 20, '2019-06-25 14:51:17', '2020-02-17 10:31:23');
INSERT INTO `adms_nivacs_pgs` VALUES (813, 1, 3, 2, 2, 4, 2, 3, '2019-06-25 14:51:17', '2020-02-17 10:31:23');
INSERT INTO `adms_nivacs_pgs` VALUES (845, 2, 35, 2, 2, 4, 2, 35, '2019-06-25 14:51:17', '2020-02-17 10:31:23');
INSERT INTO `adms_nivacs_pgs` VALUES (829, 2, 19, 2, 2, 4, 2, 19, '2019-06-25 14:51:17', '2020-02-17 10:31:23');
INSERT INTO `adms_nivacs_pgs` VALUES (601, 1, 111, 2, 2, 4, 1, 121, '2019-04-15 10:21:45', '2021-02-16 11:33:07');
INSERT INTO `adms_nivacs_pgs` VALUES (812, 1, 2, 2, 2, 2, 2, 2, '2019-06-25 14:51:17', '2022-09-27 13:28:56');
INSERT INTO `adms_nivacs_pgs` VALUES (844, 2, 34, 2, 2, 4, 2, 34, '2019-06-25 14:51:17', '2020-02-17 10:31:23');
INSERT INTO `adms_nivacs_pgs` VALUES (828, 2, 18, 2, 2, 4, 2, 18, '2019-06-25 14:51:17', '2020-02-17 10:31:23');
INSERT INTO `adms_nivacs_pgs` VALUES (811, 1, 1, 2, 1, 1, 2, 1, '2019-06-25 14:51:17', '2020-02-17 10:31:23');
INSERT INTO `adms_nivacs_pgs` VALUES (843, 2, 33, 2, 2, 4, 2, 33, '2019-06-25 14:51:17', '2020-02-17 10:31:23');
INSERT INTO `adms_nivacs_pgs` VALUES (827, 2, 17, 2, 2, 4, 2, 17, '2019-06-25 14:51:17', '2020-02-17 10:31:23');
INSERT INTO `adms_nivacs_pgs` VALUES (1505, 2, 109, 2, 2, 4, 11, 190, '2021-04-28 14:01:31', '2021-04-28 14:52:28');
INSERT INTO `adms_nivacs_pgs` VALUES (859, 2, 49, 2, 2, 4, 2, 49, '2019-06-25 14:51:17', '2020-02-17 10:31:23');
INSERT INTO `adms_nivacs_pgs` VALUES (860, 2, 50, 2, 2, 4, 2, 50, '2019-06-25 14:51:17', '2020-02-17 10:31:23');
INSERT INTO `adms_nivacs_pgs` VALUES (861, 2, 51, 2, 2, 4, 2, 51, '2019-06-25 14:51:17', '2020-02-17 10:31:23');
INSERT INTO `adms_nivacs_pgs` VALUES (862, 2, 52, 2, 2, 4, 2, 52, '2019-06-25 14:51:17', '2020-02-17 10:31:23');
INSERT INTO `adms_nivacs_pgs` VALUES (863, 2, 53, 2, 2, 4, 2, 53, '2019-06-25 14:51:17', '2020-02-17 10:31:23');
INSERT INTO `adms_nivacs_pgs` VALUES (864, 2, 54, 2, 2, 4, 2, 54, '2019-06-25 14:51:17', '2020-02-17 10:31:23');
INSERT INTO `adms_nivacs_pgs` VALUES (865, 2, 55, 2, 2, 4, 2, 55, '2019-06-25 14:51:17', '2020-02-17 10:31:23');
INSERT INTO `adms_nivacs_pgs` VALUES (866, 2, 56, 2, 2, 4, 2, 56, '2019-06-25 14:51:17', '2020-02-17 10:31:23');
INSERT INTO `adms_nivacs_pgs` VALUES (867, 2, 57, 2, 2, 4, 2, 57, '2019-06-25 14:51:17', '2020-02-17 10:31:23');
INSERT INTO `adms_nivacs_pgs` VALUES (868, 2, 58, 2, 2, 4, 2, 58, '2019-06-25 14:51:17', '2020-02-17 10:31:23');
INSERT INTO `adms_nivacs_pgs` VALUES (869, 2, 59, 2, 2, 4, 2, 59, '2019-06-25 14:51:17', '2020-02-17 10:31:23');
INSERT INTO `adms_nivacs_pgs` VALUES (870, 2, 60, 2, 2, 4, 2, 60, '2019-06-25 14:51:17', '2020-02-17 10:31:23');
INSERT INTO `adms_nivacs_pgs` VALUES (871, 2, 61, 2, 2, 4, 2, 61, '2019-06-25 14:51:17', '2020-02-17 10:31:23');
INSERT INTO `adms_nivacs_pgs` VALUES (872, 2, 62, 2, 2, 4, 2, 62, '2019-06-25 14:51:17', '2020-02-17 10:31:23');
INSERT INTO `adms_nivacs_pgs` VALUES (873, 2, 63, 2, 2, 4, 2, 63, '2019-06-25 14:51:17', '2020-02-17 10:31:23');
INSERT INTO `adms_nivacs_pgs` VALUES (874, 2, 64, 2, 2, 4, 2, 64, '2019-06-25 14:51:17', '2020-02-17 10:31:23');
INSERT INTO `adms_nivacs_pgs` VALUES (875, 2, 65, 2, 2, 4, 2, 65, '2019-06-25 14:51:17', '2020-02-17 10:31:23');
INSERT INTO `adms_nivacs_pgs` VALUES (876, 2, 66, 2, 2, 4, 2, 66, '2019-06-25 14:51:17', '2020-02-17 10:31:23');
INSERT INTO `adms_nivacs_pgs` VALUES (877, 2, 67, 2, 2, 4, 2, 67, '2019-06-25 14:51:17', '2020-02-17 10:31:23');
INSERT INTO `adms_nivacs_pgs` VALUES (878, 2, 68, 2, 2, 4, 2, 68, '2019-06-25 14:51:17', '2020-02-17 10:31:23');
INSERT INTO `adms_nivacs_pgs` VALUES (879, 2, 69, 2, 2, 4, 2, 69, '2019-06-25 14:51:17', '2020-02-17 10:31:23');
INSERT INTO `adms_nivacs_pgs` VALUES (880, 2, 70, 2, 2, 4, 2, 70, '2019-06-25 14:51:17', '2020-02-17 10:31:23');
INSERT INTO `adms_nivacs_pgs` VALUES (881, 2, 71, 2, 2, 4, 2, 71, '2019-06-25 14:51:17', '2020-02-17 10:31:23');
INSERT INTO `adms_nivacs_pgs` VALUES (882, 2, 72, 2, 2, 4, 2, 72, '2019-06-25 14:51:17', '2020-02-17 10:31:23');
INSERT INTO `adms_nivacs_pgs` VALUES (883, 2, 73, 2, 2, 4, 2, 73, '2019-06-25 14:51:17', '2020-02-17 10:31:23');
INSERT INTO `adms_nivacs_pgs` VALUES (884, 2, 74, 2, 2, 4, 2, 74, '2019-06-25 14:51:17', '2020-02-17 10:31:23');
INSERT INTO `adms_nivacs_pgs` VALUES (1506, 2, 109, 2, 2, 38, 12, 190, '2021-04-28 14:01:31', '2021-05-04 14:49:07');
INSERT INTO `adms_nivacs_pgs` VALUES (1466, 2, 99, 2, 2, 4, 12, 180, '2021-02-17 11:06:50', '2021-04-28 14:52:28');
INSERT INTO `adms_nivacs_pgs` VALUES (1465, 2, 99, 2, 2, 4, 11, 180, '2021-02-17 11:06:50', '2021-05-04 15:04:33');
INSERT INTO `adms_nivacs_pgs` VALUES (1462, 2, 98, 2, 2, 4, 12, 179, '2021-02-17 10:07:20', '2021-04-28 14:52:28');
INSERT INTO `adms_nivacs_pgs` VALUES (1461, 2, 98, 2, 2, 33, 11, 179, '2021-02-17 10:07:20', '2021-06-23 12:37:23');
INSERT INTO `adms_nivacs_pgs` VALUES (1474, 2, 101, 2, 2, 4, 12, 182, '2021-02-19 09:11:38', '2021-05-04 14:55:22');
INSERT INTO `adms_nivacs_pgs` VALUES (1473, 2, 101, 2, 2, 4, 11, 182, '2021-02-19 09:11:38', '2021-05-04 15:02:16');
INSERT INTO `adms_nivacs_pgs` VALUES (1458, 1, 97, 1, 1, 33, 12, 178, '2021-02-17 09:46:31', '2021-05-04 14:57:17');
INSERT INTO `adms_nivacs_pgs` VALUES (1457, 1, 97, 1, 1, 33, 11, 178, '2021-02-17 09:46:31', '2021-05-04 15:04:06');
INSERT INTO `adms_nivacs_pgs` VALUES (1470, 2, 100, 2, 2, 4, 12, 181, '2021-02-19 08:40:54', '2021-05-04 14:55:24');
INSERT INTO `adms_nivacs_pgs` VALUES (1469, 2, 100, 2, 2, 4, 11, 181, '2021-02-19 08:40:54', '2021-05-04 15:02:15');
INSERT INTO `adms_nivacs_pgs` VALUES (1454, 1, 96, 2, 2, 4, 12, 177, '2021-02-17 08:23:57', '2021-05-04 15:00:20');
INSERT INTO `adms_nivacs_pgs` VALUES (1453, 2, 96, 2, 2, 4, 11, 177, '2021-02-17 08:23:57', '2021-05-04 15:03:41');
INSERT INTO `adms_nivacs_pgs` VALUES (1176, 1, 112, 1, 1, 9, 1, 148, '2020-06-23 21:56:31', '2021-04-28 13:33:45');
INSERT INTO `adms_nivacs_pgs` VALUES (1177, 1, 75, 1, 1, 9, 2, 148, '2020-06-23 21:56:31', '2021-04-28 13:33:45');
INSERT INTO `adms_nivacs_pgs` VALUES (1212, 2, 83, 2, 2, 4, 2, 161, '2020-10-05 09:36:20', '2021-04-28 13:33:45');
INSERT INTO `adms_nivacs_pgs` VALUES (1211, 1, 120, 2, 2, 4, 1, 161, '2020-10-05 09:36:20', '2021-04-28 13:33:45');
INSERT INTO `adms_nivacs_pgs` VALUES (1182, 1, 113, 2, 2, 4, 1, 150, '2020-06-27 21:33:57', '2021-04-28 13:33:45');
INSERT INTO `adms_nivacs_pgs` VALUES (1183, 2, 76, 2, 2, 4, 2, 150, '2020-06-27 21:33:57', '2021-04-28 13:33:45');
INSERT INTO `adms_nivacs_pgs` VALUES (1189, 2, 77, 2, 2, 4, 2, 152, '2020-07-07 03:58:08', '2021-04-28 13:33:45');
INSERT INTO `adms_nivacs_pgs` VALUES (1188, 1, 114, 2, 2, 4, 1, 152, '2020-07-07 03:58:08', '2021-04-28 13:33:45');
INSERT INTO `adms_nivacs_pgs` VALUES (1191, 1, 115, 2, 2, 4, 1, 153, '2020-07-07 08:45:45', '2021-04-28 13:33:45');
INSERT INTO `adms_nivacs_pgs` VALUES (1192, 2, 78, 2, 2, 4, 2, 153, '2020-07-07 08:45:45', '2021-04-28 13:33:45');
INSERT INTO `adms_nivacs_pgs` VALUES (1194, 1, 116, 2, 2, 4, 1, 154, '2020-07-07 10:10:43', '2021-04-28 13:33:45');
INSERT INTO `adms_nivacs_pgs` VALUES (1195, 2, 79, 2, 2, 4, 2, 154, '2020-07-07 10:10:43', '2021-04-28 13:33:45');
INSERT INTO `adms_nivacs_pgs` VALUES (1201, 1, 80, 2, 2, 4, 2, 156, '2020-07-07 12:15:19', '2021-04-28 13:33:45');
INSERT INTO `adms_nivacs_pgs` VALUES (1200, 1, 117, 2, 2, 4, 1, 156, '2020-07-07 12:15:19', '2021-04-28 13:33:45');
INSERT INTO `adms_nivacs_pgs` VALUES (1478, 2, 102, 2, 2, 4, 12, 183, '2021-02-19 10:20:50', '2021-04-28 14:52:28');
INSERT INTO `adms_nivacs_pgs` VALUES (1477, 2, 102, 2, 2, 4, 11, 183, '2021-02-19 10:20:50', '2021-04-28 14:52:28');
INSERT INTO `adms_nivacs_pgs` VALUES (1208, 1, 81, 1, 1, 33, 2, 159, '2020-08-10 10:54:51', '2021-04-28 13:33:45');
INSERT INTO `adms_nivacs_pgs` VALUES (1207, 1, 118, 1, 1, 33, 1, 159, '2020-08-10 10:54:51', '2021-04-28 13:33:45');
INSERT INTO `adms_nivacs_pgs` VALUES (1209, 1, 119, 2, 1, 31, 1, 160, '2020-09-08 11:09:20', '2021-04-28 13:33:45');
INSERT INTO `adms_nivacs_pgs` VALUES (1210, 1, 82, 2, 1, 31, 2, 160, '2020-09-08 11:09:20', '2021-04-28 13:33:45');
INSERT INTO `adms_nivacs_pgs` VALUES (1220, 1, 85, 2, 1, 33, 2, 165, '2021-02-12 16:37:16', '2021-05-04 13:45:11');
INSERT INTO `adms_nivacs_pgs` VALUES (1219, 1, 122, 1, 1, 33, 1, 165, '2021-02-12 16:37:16', '2021-04-28 13:33:45');
INSERT INTO `adms_nivacs_pgs` VALUES (1218, 1, 84, 2, 1, 33, 2, 164, '2021-02-12 16:16:21', '2021-05-04 13:44:57');
INSERT INTO `adms_nivacs_pgs` VALUES (1217, 1, 121, 1, 1, 33, 1, 164, '2021-02-12 16:16:21', '2021-04-28 13:33:45');
INSERT INTO `adms_nivacs_pgs` VALUES (1221, 1, 123, 2, 2, 4, 1, 166, '2021-02-12 16:55:08', '2021-04-28 13:33:45');
INSERT INTO `adms_nivacs_pgs` VALUES (1222, 1, 86, 2, 2, 4, 2, 166, '2021-02-12 16:55:08', '2021-05-04 13:46:14');
INSERT INTO `adms_nivacs_pgs` VALUES (1223, 1, 124, 2, 2, 4, 1, 167, '2021-02-12 17:35:12', '2021-04-28 13:33:45');
INSERT INTO `adms_nivacs_pgs` VALUES (1224, 1, 87, 2, 2, 4, 2, 167, '2021-02-12 17:35:12', '2021-05-04 13:46:19');
INSERT INTO `adms_nivacs_pgs` VALUES (1225, 1, 125, 2, 2, 4, 1, 168, '2021-02-12 17:46:30', '2021-04-28 13:33:45');
INSERT INTO `adms_nivacs_pgs` VALUES (1226, 1, 88, 2, 2, 4, 2, 168, '2021-02-12 17:46:30', '2021-05-04 13:46:22');
INSERT INTO `adms_nivacs_pgs` VALUES (1227, 1, 126, 2, 2, 4, 1, 169, '2021-02-12 17:50:43', '2021-04-28 13:33:45');
INSERT INTO `adms_nivacs_pgs` VALUES (1228, 1, 89, 2, 2, 4, 2, 169, '2021-02-12 17:50:43', '2021-05-04 13:46:25');
INSERT INTO `adms_nivacs_pgs` VALUES (1229, 1, 127, 1, 1, 37, 1, 170, '2021-02-12 17:53:11', '2021-04-28 13:33:45');
INSERT INTO `adms_nivacs_pgs` VALUES (1230, 1, 90, 2, 1, 37, 2, 170, '2021-02-12 17:53:11', '2021-05-04 13:46:46');
INSERT INTO `adms_nivacs_pgs` VALUES (1231, 1, 128, 1, 1, 37, 1, 171, '2021-02-12 17:55:25', '2021-04-28 13:33:45');
INSERT INTO `adms_nivacs_pgs` VALUES (1232, 1, 91, 2, 1, 37, 2, 171, '2021-02-12 17:55:25', '2021-05-04 13:46:59');
INSERT INTO `adms_nivacs_pgs` VALUES (1233, 1, 129, 1, 1, 37, 1, 172, '2021-02-12 17:57:17', '2021-04-28 13:33:45');
INSERT INTO `adms_nivacs_pgs` VALUES (1234, 2, 92, 2, 2, 4, 2, 172, '2021-02-12 17:57:17', '2021-04-28 13:33:45');
INSERT INTO `adms_nivacs_pgs` VALUES (1235, 1, 130, 2, 2, 38, 1, 173, '2021-02-12 18:06:23', '2021-08-30 13:49:34');
INSERT INTO `adms_nivacs_pgs` VALUES (1236, 1, 93, 2, 1, 33, 2, 173, '2021-02-12 18:06:23', '2021-05-04 13:48:09');
INSERT INTO `adms_nivacs_pgs` VALUES (1237, 1, 131, 2, 2, 37, 1, 174, '2021-02-12 18:12:34', '2021-09-09 15:41:00');
INSERT INTO `adms_nivacs_pgs` VALUES (1238, 2, 94, 2, 2, 4, 2, 174, '2021-02-12 18:12:34', '2021-04-28 13:33:45');
INSERT INTO `adms_nivacs_pgs` VALUES (1239, 1, 132, 1, 1, 33, 1, 175, '2021-02-12 18:18:28', '2021-04-28 13:33:45');
INSERT INTO `adms_nivacs_pgs` VALUES (1240, 2, 95, 2, 2, 4, 2, 175, '2021-02-12 18:18:28', '2021-04-28 13:33:45');
INSERT INTO `adms_nivacs_pgs` VALUES (1511, 1, 5, 2, 1, 3, 13, 4, '2021-05-04 12:45:26', '2022-09-23 11:40:50');
INSERT INTO `adms_nivacs_pgs` VALUES (1510, 1, 4, 2, 2, 4, 13, 3, '2021-05-04 12:45:26', '2021-05-04 15:07:22');
INSERT INTO `adms_nivacs_pgs` VALUES (1243, 1, 1, 2, 1, 1, 11, 1, '2021-02-16 08:58:14', '2021-02-17 08:50:00');
INSERT INTO `adms_nivacs_pgs` VALUES (1244, 2, 2, 2, 2, 4, 11, 2, '2021-02-16 08:58:14', '2021-02-16 09:32:35');
INSERT INTO `adms_nivacs_pgs` VALUES (1245, 1, 3, 2, 2, 4, 11, 3, '2021-02-16 08:58:14', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1246, 1, 4, 2, 2, 4, 11, 4, '2021-02-16 08:58:14', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1247, 2, 5, 2, 2, 4, 11, 5, '2021-02-16 08:58:14', '2021-05-04 14:20:54');
INSERT INTO `adms_nivacs_pgs` VALUES (1248, 2, 6, 2, 2, 4, 11, 6, '2021-02-16 08:58:14', '2021-06-23 12:42:24');
INSERT INTO `adms_nivacs_pgs` VALUES (1249, 2, 7, 2, 2, 4, 11, 7, '2021-02-16 08:58:14', '2021-06-23 12:42:25');
INSERT INTO `adms_nivacs_pgs` VALUES (1250, 2, 8, 2, 2, 4, 11, 8, '2021-02-16 08:58:14', '2021-06-23 12:42:28');
INSERT INTO `adms_nivacs_pgs` VALUES (1251, 1, 9, 1, 1, 4, 11, 9, '2021-02-16 08:58:14', '2021-05-04 15:00:45');
INSERT INTO `adms_nivacs_pgs` VALUES (1252, 1, 10, 2, 2, 4, 11, 10, '2021-02-16 08:58:14', '2021-03-05 17:05:42');
INSERT INTO `adms_nivacs_pgs` VALUES (1253, 1, 11, 2, 2, 4, 11, 11, '2021-02-16 08:58:14', '2021-03-05 17:05:47');
INSERT INTO `adms_nivacs_pgs` VALUES (1254, 2, 12, 2, 2, 4, 11, 12, '2021-02-16 08:58:14', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1255, 2, 13, 2, 2, 4, 11, 13, '2021-02-16 08:58:14', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1256, 2, 14, 2, 2, 4, 11, 14, '2021-02-16 08:58:14', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1257, 2, 15, 2, 2, 4, 11, 15, '2021-02-16 08:58:14', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1258, 2, 16, 2, 2, 4, 11, 16, '2021-02-16 08:58:14', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1259, 2, 17, 2, 2, 4, 11, 17, '2021-02-16 08:58:14', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1260, 2, 18, 2, 2, 4, 11, 18, '2021-02-16 08:58:14', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1261, 2, 19, 2, 2, 4, 11, 19, '2021-02-16 08:58:14', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1262, 2, 20, 2, 2, 4, 11, 20, '2021-02-16 08:58:14', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1263, 2, 21, 2, 2, 4, 11, 21, '2021-02-16 08:58:14', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1264, 2, 22, 2, 2, 4, 11, 22, '2021-02-16 08:58:14', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1265, 2, 23, 2, 2, 4, 11, 23, '2021-02-16 08:58:14', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1266, 2, 24, 2, 2, 4, 11, 24, '2021-02-16 08:58:14', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1267, 2, 25, 2, 2, 4, 11, 25, '2021-02-16 08:58:14', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1268, 2, 26, 2, 2, 4, 11, 26, '2021-02-16 08:58:14', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1269, 2, 27, 2, 2, 4, 11, 27, '2021-02-16 08:58:14', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1270, 2, 28, 2, 2, 4, 11, 28, '2021-02-16 08:58:14', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1271, 2, 29, 2, 2, 4, 11, 29, '2021-02-16 08:58:14', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1272, 2, 30, 2, 2, 4, 11, 30, '2021-02-16 08:58:14', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1273, 2, 31, 2, 2, 4, 11, 31, '2021-02-16 08:58:14', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1274, 2, 32, 2, 2, 4, 11, 32, '2021-02-16 08:58:14', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1275, 2, 33, 2, 2, 4, 11, 33, '2021-02-16 08:58:14', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1276, 2, 34, 2, 2, 4, 11, 34, '2021-02-16 08:58:14', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1277, 2, 35, 2, 2, 4, 11, 35, '2021-02-16 08:58:14', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1278, 2, 36, 2, 2, 4, 11, 36, '2021-02-16 08:58:14', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1279, 2, 37, 2, 2, 4, 11, 37, '2021-02-16 08:58:14', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1280, 2, 38, 2, 2, 4, 11, 38, '2021-02-16 08:58:14', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1281, 2, 39, 2, 2, 4, 11, 39, '2021-02-16 08:58:14', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1282, 2, 40, 2, 2, 4, 11, 40, '2021-02-16 08:58:14', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1283, 2, 41, 2, 2, 4, 11, 41, '2021-02-16 08:58:14', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1284, 2, 42, 2, 2, 4, 11, 42, '2021-02-16 08:58:14', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1285, 2, 43, 2, 2, 4, 11, 43, '2021-02-16 08:58:14', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1286, 2, 44, 2, 2, 4, 11, 44, '2021-02-16 08:58:14', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1287, 2, 45, 2, 2, 4, 11, 45, '2021-02-16 08:58:14', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1288, 2, 46, 2, 2, 4, 11, 46, '2021-02-16 08:58:14', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1289, 2, 47, 2, 2, 4, 11, 47, '2021-02-16 08:58:14', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1290, 2, 48, 2, 2, 4, 11, 48, '2021-02-16 08:58:14', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1291, 2, 49, 2, 2, 4, 11, 49, '2021-02-16 08:58:14', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1292, 2, 50, 2, 2, 4, 11, 50, '2021-02-16 08:58:14', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1293, 2, 51, 2, 2, 4, 11, 51, '2021-02-16 08:58:14', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1294, 2, 52, 2, 2, 4, 11, 52, '2021-02-16 08:58:14', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1295, 2, 53, 2, 2, 4, 11, 53, '2021-02-16 08:58:14', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1296, 2, 54, 2, 2, 4, 11, 54, '2021-02-16 08:58:14', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1297, 2, 55, 2, 2, 4, 11, 55, '2021-02-16 08:58:14', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1298, 2, 56, 2, 2, 4, 11, 56, '2021-02-16 08:58:14', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1299, 2, 57, 2, 2, 4, 11, 57, '2021-02-16 08:58:14', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1300, 2, 58, 2, 2, 4, 11, 58, '2021-02-16 08:58:14', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1301, 2, 59, 2, 2, 4, 11, 59, '2021-02-16 08:58:14', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1302, 2, 60, 2, 2, 4, 11, 60, '2021-02-16 08:58:14', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1303, 2, 61, 2, 2, 4, 11, 61, '2021-02-16 08:58:14', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1304, 2, 62, 2, 2, 4, 11, 62, '2021-02-16 08:58:14', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1305, 2, 63, 2, 2, 4, 11, 63, '2021-02-16 08:58:14', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1306, 2, 64, 2, 2, 4, 11, 64, '2021-02-16 08:58:14', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1307, 2, 65, 2, 2, 4, 11, 65, '2021-02-16 08:58:14', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1308, 2, 66, 2, 2, 4, 11, 66, '2021-02-16 08:58:14', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1309, 2, 67, 2, 2, 4, 11, 67, '2021-02-16 08:58:14', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1310, 2, 68, 2, 2, 4, 11, 68, '2021-02-16 08:58:14', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1311, 2, 69, 2, 2, 4, 11, 69, '2021-02-16 08:58:14', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1312, 2, 70, 2, 2, 4, 11, 70, '2021-02-16 08:58:14', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1313, 2, 71, 2, 2, 4, 11, 71, '2021-02-16 08:58:14', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1314, 2, 72, 2, 2, 4, 11, 72, '2021-02-16 08:58:14', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1315, 2, 73, 2, 2, 4, 11, 73, '2021-02-16 08:58:14', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1316, 2, 74, 2, 2, 4, 11, 74, '2021-02-16 08:58:14', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1504, 2, 109, 2, 2, 4, 2, 190, '2021-04-28 14:01:31', '2021-04-28 14:52:28');
INSERT INTO `adms_nivacs_pgs` VALUES (1464, 2, 99, 2, 2, 4, 2, 180, '2021-02-17 11:06:50', '2021-04-28 14:52:28');
INSERT INTO `adms_nivacs_pgs` VALUES (1460, 1, 98, 2, 1, 38, 2, 179, '2021-02-17 10:07:20', '2021-05-04 13:49:39');
INSERT INTO `adms_nivacs_pgs` VALUES (1472, 1, 101, 2, 2, 4, 2, 182, '2021-02-19 09:11:38', '2021-05-04 13:50:17');
INSERT INTO `adms_nivacs_pgs` VALUES (1456, 2, 97, 2, 2, 4, 2, 178, '2021-02-17 09:46:31', '2021-04-28 14:52:28');
INSERT INTO `adms_nivacs_pgs` VALUES (1468, 2, 100, 2, 2, 4, 2, 181, '2021-02-19 08:40:54', '2021-04-28 14:52:28');
INSERT INTO `adms_nivacs_pgs` VALUES (1452, 2, 96, 2, 2, 4, 2, 177, '2021-02-17 08:23:57', '2021-04-28 14:52:28');
INSERT INTO `adms_nivacs_pgs` VALUES (1324, 2, 75, 2, 2, 4, 11, 148, '2021-02-16 08:58:14', '2021-04-28 13:33:45');
INSERT INTO `adms_nivacs_pgs` VALUES (1325, 2, 76, 2, 2, 4, 11, 161, '2021-02-16 08:58:14', '2021-04-28 13:33:45');
INSERT INTO `adms_nivacs_pgs` VALUES (1326, 2, 77, 2, 2, 4, 11, 150, '2021-02-16 08:58:14', '2021-04-28 13:33:45');
INSERT INTO `adms_nivacs_pgs` VALUES (1327, 2, 78, 2, 2, 4, 11, 152, '2021-02-16 08:58:14', '2021-04-28 13:33:45');
INSERT INTO `adms_nivacs_pgs` VALUES (1328, 2, 79, 2, 2, 4, 11, 153, '2021-02-16 08:58:14', '2021-04-28 13:33:45');
INSERT INTO `adms_nivacs_pgs` VALUES (1329, 2, 80, 2, 2, 4, 11, 154, '2021-02-16 08:58:14', '2021-04-28 13:33:45');
INSERT INTO `adms_nivacs_pgs` VALUES (1330, 2, 81, 2, 2, 4, 11, 156, '2021-02-16 08:58:14', '2021-04-28 13:33:45');
INSERT INTO `adms_nivacs_pgs` VALUES (1476, 2, 102, 2, 2, 4, 2, 183, '2021-02-19 10:20:50', '2021-04-28 14:52:28');
INSERT INTO `adms_nivacs_pgs` VALUES (1332, 2, 82, 2, 2, 4, 11, 159, '2021-02-16 08:58:14', '2021-04-28 13:33:45');
INSERT INTO `adms_nivacs_pgs` VALUES (1333, 1, 83, 2, 2, 4, 11, 160, '2021-02-16 08:58:14', '2021-04-28 13:33:45');
INSERT INTO `adms_nivacs_pgs` VALUES (1334, 2, 84, 2, 2, 33, 11, 165, '2021-02-16 08:58:14', '2021-05-20 16:59:06');
INSERT INTO `adms_nivacs_pgs` VALUES (1335, 2, 85, 2, 2, 4, 11, 166, '2021-02-16 08:58:14', '2021-04-28 13:33:45');
INSERT INTO `adms_nivacs_pgs` VALUES (1336, 2, 86, 2, 2, 4, 11, 164, '2021-02-16 08:58:14', '2021-04-28 13:33:45');
INSERT INTO `adms_nivacs_pgs` VALUES (1337, 2, 87, 2, 2, 4, 11, 167, '2021-02-16 08:58:14', '2021-04-28 13:33:45');
INSERT INTO `adms_nivacs_pgs` VALUES (1338, 2, 88, 2, 2, 4, 11, 168, '2021-02-16 08:58:14', '2021-04-28 13:33:45');
INSERT INTO `adms_nivacs_pgs` VALUES (1339, 2, 89, 2, 2, 4, 11, 169, '2021-02-16 08:58:14', '2021-04-28 13:33:45');
INSERT INTO `adms_nivacs_pgs` VALUES (1340, 2, 90, 2, 2, 4, 11, 170, '2021-02-16 08:58:14', '2021-04-28 13:33:45');
INSERT INTO `adms_nivacs_pgs` VALUES (1341, 2, 91, 2, 2, 4, 11, 171, '2021-02-16 08:58:14', '2021-04-28 13:33:45');
INSERT INTO `adms_nivacs_pgs` VALUES (1342, 2, 92, 2, 2, 4, 11, 172, '2021-02-16 08:58:14', '2021-04-28 13:33:45');
INSERT INTO `adms_nivacs_pgs` VALUES (1343, 2, 93, 2, 2, 33, 11, 173, '2021-02-16 08:58:14', '2021-05-04 15:02:44');
INSERT INTO `adms_nivacs_pgs` VALUES (1344, 2, 94, 2, 2, 37, 11, 174, '2021-02-16 08:58:14', '2021-05-04 15:03:20');
INSERT INTO `adms_nivacs_pgs` VALUES (1345, 1, 95, 1, 1, 33, 11, 175, '2021-02-16 08:58:14', '2021-05-04 14:23:36');
INSERT INTO `adms_nivacs_pgs` VALUES (1509, 2, 3, 2, 2, 4, 13, 2, '2021-05-04 12:45:26', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1347, 1, 1, 2, 1, 1, 12, 1, '2021-02-16 11:20:38', '2021-02-17 08:51:49');
INSERT INTO `adms_nivacs_pgs` VALUES (1348, 2, 2, 2, 2, 4, 12, 2, '2021-02-16 11:20:38', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1349, 1, 3, 2, 2, 4, 12, 3, '2021-02-16 11:20:38', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1350, 1, 4, 2, 2, 4, 12, 4, '2021-02-16 11:20:38', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1351, 2, 5, 2, 2, 4, 12, 5, '2021-02-16 11:20:38', '2021-05-04 14:52:29');
INSERT INTO `adms_nivacs_pgs` VALUES (1352, 1, 6, 2, 2, 4, 12, 6, '2021-02-16 11:20:38', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1353, 1, 7, 2, 2, 4, 12, 7, '2021-02-16 11:20:38', '2021-02-16 11:42:45');
INSERT INTO `adms_nivacs_pgs` VALUES (1354, 1, 8, 2, 2, 4, 12, 8, '2021-02-16 11:20:38', '2021-02-16 11:42:13');
INSERT INTO `adms_nivacs_pgs` VALUES (1355, 1, 9, 1, 1, 4, 12, 9, '2021-02-16 11:20:38', '2021-02-16 11:43:03');
INSERT INTO `adms_nivacs_pgs` VALUES (1356, 1, 10, 1, 1, 4, 12, 10, '2021-02-16 11:20:38', '2021-02-16 11:43:06');
INSERT INTO `adms_nivacs_pgs` VALUES (1357, 2, 11, 2, 2, 4, 12, 11, '2021-02-16 11:20:38', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1358, 2, 12, 2, 2, 4, 12, 12, '2021-02-16 11:20:38', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1359, 2, 13, 2, 2, 4, 12, 13, '2021-02-16 11:20:38', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1360, 2, 14, 2, 2, 4, 12, 14, '2021-02-16 11:20:38', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1361, 2, 15, 2, 2, 4, 12, 15, '2021-02-16 11:20:38', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1362, 2, 16, 2, 2, 4, 12, 16, '2021-02-16 11:20:38', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1363, 2, 17, 2, 2, 4, 12, 17, '2021-02-16 11:20:38', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1364, 2, 18, 2, 2, 4, 12, 18, '2021-02-16 11:20:38', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1365, 2, 19, 2, 2, 4, 12, 19, '2021-02-16 11:20:38', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1366, 2, 20, 2, 2, 4, 12, 20, '2021-02-16 11:20:38', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1367, 2, 21, 2, 2, 4, 12, 21, '2021-02-16 11:20:38', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1368, 2, 22, 2, 2, 4, 12, 22, '2021-02-16 11:20:38', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1369, 2, 23, 2, 2, 4, 12, 23, '2021-02-16 11:20:38', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1370, 2, 24, 2, 2, 4, 12, 24, '2021-02-16 11:20:38', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1371, 2, 25, 2, 2, 4, 12, 25, '2021-02-16 11:20:38', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1372, 2, 26, 2, 2, 4, 12, 26, '2021-02-16 11:20:38', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1373, 2, 27, 2, 2, 4, 12, 27, '2021-02-16 11:20:38', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1374, 2, 28, 2, 2, 4, 12, 28, '2021-02-16 11:20:38', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1375, 2, 29, 2, 2, 4, 12, 29, '2021-02-16 11:20:38', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1376, 2, 30, 2, 2, 4, 12, 30, '2021-02-16 11:20:38', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1377, 2, 31, 2, 2, 4, 12, 31, '2021-02-16 11:20:38', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1378, 2, 32, 2, 2, 4, 12, 32, '2021-02-16 11:20:38', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1379, 2, 33, 2, 2, 4, 12, 33, '2021-02-16 11:20:38', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1380, 2, 34, 2, 2, 4, 12, 34, '2021-02-16 11:20:38', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1381, 2, 35, 2, 2, 4, 12, 35, '2021-02-16 11:20:38', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1382, 2, 36, 2, 2, 4, 12, 36, '2021-02-16 11:20:38', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1383, 2, 37, 2, 2, 4, 12, 37, '2021-02-16 11:20:38', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1384, 2, 38, 2, 2, 4, 12, 38, '2021-02-16 11:20:38', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1385, 2, 39, 2, 2, 4, 12, 39, '2021-02-16 11:20:38', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1386, 2, 40, 2, 2, 4, 12, 40, '2021-02-16 11:20:38', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1387, 2, 41, 2, 2, 4, 12, 41, '2021-02-16 11:20:38', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1388, 2, 42, 2, 2, 4, 12, 42, '2021-02-16 11:20:38', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1389, 2, 43, 2, 2, 4, 12, 43, '2021-02-16 11:20:38', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1390, 2, 44, 2, 2, 4, 12, 44, '2021-02-16 11:20:38', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1391, 2, 45, 2, 2, 4, 12, 45, '2021-02-16 11:20:38', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1392, 2, 46, 2, 2, 4, 12, 46, '2021-02-16 11:20:38', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1393, 2, 47, 2, 2, 4, 12, 47, '2021-02-16 11:20:38', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1394, 2, 48, 2, 2, 4, 12, 48, '2021-02-16 11:20:38', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1395, 2, 49, 2, 2, 4, 12, 49, '2021-02-16 11:20:38', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1396, 2, 50, 2, 2, 4, 12, 50, '2021-02-16 11:20:38', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1397, 2, 51, 2, 2, 4, 12, 51, '2021-02-16 11:20:38', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1398, 2, 52, 2, 2, 4, 12, 52, '2021-02-16 11:20:38', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1399, 2, 53, 2, 2, 4, 12, 53, '2021-02-16 11:20:38', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1400, 2, 54, 2, 2, 4, 12, 54, '2021-02-16 11:20:38', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1401, 2, 55, 2, 2, 4, 12, 55, '2021-02-16 11:20:38', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1402, 2, 56, 2, 2, 4, 12, 56, '2021-02-16 11:20:38', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1403, 2, 57, 2, 2, 4, 12, 57, '2021-02-16 11:20:38', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1404, 2, 58, 2, 2, 4, 12, 58, '2021-02-16 11:20:38', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1405, 2, 59, 2, 2, 4, 12, 59, '2021-02-16 11:20:38', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1406, 2, 60, 2, 2, 4, 12, 60, '2021-02-16 11:20:38', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1407, 2, 61, 2, 2, 4, 12, 61, '2021-02-16 11:20:38', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1408, 2, 62, 2, 2, 4, 12, 62, '2021-02-16 11:20:38', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1409, 2, 63, 2, 2, 4, 12, 63, '2021-02-16 11:20:38', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1410, 2, 64, 2, 2, 4, 12, 64, '2021-02-16 11:20:38', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1411, 2, 65, 2, 2, 4, 12, 65, '2021-02-16 11:20:38', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1412, 2, 66, 2, 2, 4, 12, 66, '2021-02-16 11:20:38', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1413, 2, 67, 2, 2, 4, 12, 67, '2021-02-16 11:20:38', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1414, 2, 68, 2, 2, 4, 12, 68, '2021-02-16 11:20:38', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1415, 2, 69, 2, 2, 4, 12, 69, '2021-02-16 11:20:38', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1416, 2, 70, 2, 2, 4, 12, 70, '2021-02-16 11:20:38', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1417, 2, 71, 2, 2, 4, 12, 71, '2021-02-16 11:20:38', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1418, 2, 72, 2, 2, 4, 12, 72, '2021-02-16 11:20:38', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1419, 2, 73, 2, 2, 4, 12, 73, '2021-02-16 11:20:38', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1420, 2, 74, 2, 2, 4, 12, 74, '2021-02-16 11:20:38', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1503, 1, 146, 2, 2, 4, 1, 190, '2021-04-28 14:01:31', '2021-04-28 14:52:28');
INSERT INTO `adms_nivacs_pgs` VALUES (1463, 1, 136, 2, 2, 4, 1, 180, '2021-02-17 11:06:50', '2021-04-28 14:52:28');
INSERT INTO `adms_nivacs_pgs` VALUES (1459, 1, 135, 1, 1, 38, 1, 179, '2021-02-17 10:07:20', '2021-04-28 14:52:28');
INSERT INTO `adms_nivacs_pgs` VALUES (1471, 1, 138, 2, 2, 4, 1, 182, '2021-02-19 09:11:38', '2021-04-28 14:52:28');
INSERT INTO `adms_nivacs_pgs` VALUES (1455, 1, 134, 1, 1, 33, 1, 178, '2021-02-17 09:46:31', '2021-04-28 14:52:28');
INSERT INTO `adms_nivacs_pgs` VALUES (1467, 1, 137, 2, 2, 4, 1, 181, '2021-02-19 08:40:54', '2021-04-28 14:52:28');
INSERT INTO `adms_nivacs_pgs` VALUES (1451, 1, 133, 2, 2, 4, 1, 177, '2021-02-17 08:23:57', '2021-04-28 14:52:28');
INSERT INTO `adms_nivacs_pgs` VALUES (1428, 2, 75, 2, 2, 4, 12, 148, '2021-02-16 11:20:38', '2021-04-28 13:33:45');
INSERT INTO `adms_nivacs_pgs` VALUES (1429, 2, 76, 2, 2, 4, 12, 161, '2021-02-16 11:20:38', '2021-04-28 13:33:45');
INSERT INTO `adms_nivacs_pgs` VALUES (1430, 2, 77, 2, 2, 4, 12, 150, '2021-02-16 11:20:38', '2021-04-28 13:33:45');
INSERT INTO `adms_nivacs_pgs` VALUES (1431, 1, 78, 2, 2, 4, 12, 152, '2021-02-16 11:20:38', '2021-04-28 13:33:45');
INSERT INTO `adms_nivacs_pgs` VALUES (1432, 1, 79, 2, 2, 4, 12, 153, '2021-02-16 11:20:38', '2021-04-28 13:33:45');
INSERT INTO `adms_nivacs_pgs` VALUES (1433, 1, 80, 2, 2, 4, 12, 154, '2021-02-16 11:20:38', '2021-04-28 13:33:45');
INSERT INTO `adms_nivacs_pgs` VALUES (1434, 1, 81, 2, 2, 4, 12, 156, '2021-02-16 11:20:38', '2021-04-28 13:33:45');
INSERT INTO `adms_nivacs_pgs` VALUES (1475, 1, 139, 2, 2, 4, 1, 183, '2021-02-19 10:20:50', '2021-04-28 14:52:28');
INSERT INTO `adms_nivacs_pgs` VALUES (1436, 1, 82, 2, 2, 4, 12, 159, '2021-02-16 11:20:38', '2021-04-28 13:33:45');
INSERT INTO `adms_nivacs_pgs` VALUES (1437, 2, 83, 2, 2, 4, 12, 160, '2021-02-16 11:20:38', '2021-04-28 13:33:45');
INSERT INTO `adms_nivacs_pgs` VALUES (1438, 2, 84, 2, 2, 33, 12, 165, '2021-02-16 11:20:38', '2021-05-20 16:59:39');
INSERT INTO `adms_nivacs_pgs` VALUES (1439, 2, 85, 2, 2, 4, 12, 166, '2021-02-16 11:20:38', '2021-04-28 13:33:45');
INSERT INTO `adms_nivacs_pgs` VALUES (1440, 2, 86, 2, 2, 4, 12, 164, '2021-02-16 11:20:38', '2021-04-28 13:33:45');
INSERT INTO `adms_nivacs_pgs` VALUES (1441, 2, 87, 2, 2, 4, 12, 167, '2021-02-16 11:20:38', '2021-04-28 13:33:45');
INSERT INTO `adms_nivacs_pgs` VALUES (1442, 2, 88, 2, 2, 4, 12, 168, '2021-02-16 11:20:38', '2021-04-28 13:33:45');
INSERT INTO `adms_nivacs_pgs` VALUES (1443, 2, 89, 2, 2, 4, 12, 169, '2021-02-16 11:20:38', '2021-04-28 13:33:45');
INSERT INTO `adms_nivacs_pgs` VALUES (1444, 2, 90, 2, 2, 4, 12, 170, '2021-02-16 11:20:38', '2021-04-28 13:33:45');
INSERT INTO `adms_nivacs_pgs` VALUES (1445, 2, 91, 2, 2, 4, 12, 171, '2021-02-16 11:20:38', '2021-04-28 13:33:45');
INSERT INTO `adms_nivacs_pgs` VALUES (1446, 1, 92, 1, 1, 37, 12, 172, '2021-02-16 11:20:38', '2021-05-04 15:00:16');
INSERT INTO `adms_nivacs_pgs` VALUES (1447, 1, 93, 1, 1, 33, 12, 173, '2021-02-16 11:20:38', '2021-05-04 14:46:07');
INSERT INTO `adms_nivacs_pgs` VALUES (1448, 2, 94, 2, 2, 4, 12, 174, '2021-02-16 11:20:38', '2021-05-04 14:57:26');
INSERT INTO `adms_nivacs_pgs` VALUES (1449, 1, 95, 1, 1, 33, 12, 175, '2021-02-16 11:20:38', '2021-05-04 14:31:49');
INSERT INTO `adms_nivacs_pgs` VALUES (1508, 1, 2, 2, 1, 1, 13, 1, '2021-05-04 12:45:26', '2022-09-23 11:40:09');
INSERT INTO `adms_nivacs_pgs` VALUES (1479, 1, 140, 2, 2, 4, 1, 184, '2021-02-19 19:49:41', '2021-04-28 14:52:28');
INSERT INTO `adms_nivacs_pgs` VALUES (1480, 1, 103, 2, 2, 4, 2, 184, '2021-02-19 19:49:41', '2021-05-04 13:49:49');
INSERT INTO `adms_nivacs_pgs` VALUES (1481, 2, 103, 2, 2, 4, 11, 184, '2021-02-19 19:49:41', '2021-04-28 14:52:28');
INSERT INTO `adms_nivacs_pgs` VALUES (1482, 2, 103, 2, 2, 4, 12, 184, '2021-02-19 19:49:41', '2021-04-28 14:52:28');
INSERT INTO `adms_nivacs_pgs` VALUES (1483, 1, 141, 2, 2, 4, 1, 185, '2021-02-21 13:53:24', '2021-04-28 14:52:28');
INSERT INTO `adms_nivacs_pgs` VALUES (1484, 1, 104, 2, 2, 4, 2, 185, '2021-02-21 13:53:24', '2021-05-04 13:49:53');
INSERT INTO `adms_nivacs_pgs` VALUES (1485, 2, 104, 2, 2, 4, 11, 185, '2021-02-21 13:53:24', '2021-04-28 14:52:28');
INSERT INTO `adms_nivacs_pgs` VALUES (1486, 2, 104, 2, 2, 4, 12, 185, '2021-02-21 13:53:24', '2021-04-28 14:52:28');
INSERT INTO `adms_nivacs_pgs` VALUES (1487, 1, 142, 2, 2, 4, 1, 186, '2021-02-21 19:56:08', '2021-04-28 14:52:28');
INSERT INTO `adms_nivacs_pgs` VALUES (1488, 2, 105, 2, 2, 4, 2, 186, '2021-02-21 19:56:08', '2021-04-28 14:52:28');
INSERT INTO `adms_nivacs_pgs` VALUES (1489, 2, 105, 2, 2, 4, 11, 186, '2021-02-21 19:56:08', '2021-04-28 14:52:28');
INSERT INTO `adms_nivacs_pgs` VALUES (1490, 2, 105, 2, 2, 4, 12, 186, '2021-02-21 19:56:08', '2021-04-28 14:52:28');
INSERT INTO `adms_nivacs_pgs` VALUES (1491, 1, 143, 2, 1, 40, 1, 187, '2021-03-10 13:34:37', '2021-09-06 13:09:48');
INSERT INTO `adms_nivacs_pgs` VALUES (1492, 1, 106, 2, 1, 40, 2, 187, '2021-03-10 13:34:37', '2021-05-04 13:50:37');
INSERT INTO `adms_nivacs_pgs` VALUES (1493, 1, 106, 1, 1, 40, 11, 187, '2021-03-10 13:34:37', '2021-05-04 15:01:39');
INSERT INTO `adms_nivacs_pgs` VALUES (1494, 1, 106, 1, 1, 33, 12, 187, '2021-03-10 13:34:37', '2021-05-04 14:50:15');
INSERT INTO `adms_nivacs_pgs` VALUES (1495, 1, 144, 2, 2, 39, 1, 188, '2021-03-12 14:13:43', '2021-04-28 14:52:28');
INSERT INTO `adms_nivacs_pgs` VALUES (1496, 2, 107, 2, 2, 4, 2, 188, '2021-03-12 14:13:43', '2021-04-28 14:52:28');
INSERT INTO `adms_nivacs_pgs` VALUES (1497, 2, 107, 2, 2, 4, 11, 188, '2021-03-12 14:13:43', '2021-04-28 14:52:28');
INSERT INTO `adms_nivacs_pgs` VALUES (1498, 2, 107, 2, 2, 4, 12, 188, '2021-03-12 14:13:43', '2021-04-28 14:52:28');
INSERT INTO `adms_nivacs_pgs` VALUES (1499, 1, 145, 1, 2, 39, 1, 189, '2021-03-16 14:31:16', '2021-09-06 13:09:50');
INSERT INTO `adms_nivacs_pgs` VALUES (1500, 1, 108, 2, 1, 38, 2, 189, '2021-03-16 14:31:16', '2021-05-04 13:50:55');
INSERT INTO `adms_nivacs_pgs` VALUES (1501, 2, 108, 2, 2, 4, 11, 189, '2021-03-16 14:31:16', '2021-04-28 14:52:28');
INSERT INTO `adms_nivacs_pgs` VALUES (1502, 2, 108, 2, 2, 4, 12, 189, '2021-03-16 14:31:16', '2021-04-28 14:52:28');
INSERT INTO `adms_nivacs_pgs` VALUES (1507, 2, 1, 2, 2, 4, 13, 190, '2021-04-28 14:01:31', '2021-05-04 13:25:27');
INSERT INTO `adms_nivacs_pgs` VALUES (1512, 2, 6, 2, 2, 4, 13, 5, '2021-05-04 12:45:26', '2021-05-04 13:25:31');
INSERT INTO `adms_nivacs_pgs` VALUES (1513, 2, 7, 2, 2, 4, 13, 6, '2021-05-04 12:45:26', '2021-05-04 17:09:34');
INSERT INTO `adms_nivacs_pgs` VALUES (1514, 2, 8, 2, 2, 2, 13, 7, '2021-05-04 12:45:26', '2021-05-04 17:09:31');
INSERT INTO `adms_nivacs_pgs` VALUES (1515, 1, 9, 2, 2, 2, 13, 8, '2021-05-04 12:45:26', '2021-05-04 17:09:39');
INSERT INTO `adms_nivacs_pgs` VALUES (1516, 1, 10, 1, 1, 2, 13, 9, '2021-05-04 12:45:26', '2021-05-04 17:09:14');
INSERT INTO `adms_nivacs_pgs` VALUES (1517, 1, 11, 2, 2, 4, 13, 10, '2021-05-04 12:45:26', '2022-09-23 18:19:17');
INSERT INTO `adms_nivacs_pgs` VALUES (1518, 1, 12, 1, 1, 2, 13, 11, '2021-05-04 12:45:26', '2021-05-04 17:09:50');
INSERT INTO `adms_nivacs_pgs` VALUES (1519, 2, 13, 2, 2, 4, 13, 12, '2021-05-04 12:45:26', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1520, 2, 14, 2, 2, 4, 13, 13, '2021-05-04 12:45:26', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1521, 2, 15, 2, 2, 4, 13, 14, '2021-05-04 12:45:26', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1522, 2, 16, 2, 2, 4, 13, 15, '2021-05-04 12:45:26', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1523, 2, 17, 2, 2, 4, 13, 16, '2021-05-04 12:45:26', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1524, 2, 18, 2, 2, 4, 13, 17, '2021-05-04 12:45:26', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1525, 2, 19, 2, 2, 4, 13, 18, '2021-05-04 12:45:26', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1526, 2, 20, 2, 2, 4, 13, 19, '2021-05-04 12:45:26', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1527, 2, 21, 2, 2, 4, 13, 20, '2021-05-04 12:45:26', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1528, 2, 22, 2, 2, 4, 13, 21, '2021-05-04 12:45:26', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1529, 2, 23, 2, 2, 4, 13, 22, '2021-05-04 12:45:26', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1530, 2, 24, 2, 2, 4, 13, 23, '2021-05-04 12:45:26', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1531, 2, 25, 2, 2, 4, 13, 24, '2021-05-04 12:45:26', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1532, 2, 26, 2, 2, 4, 13, 25, '2021-05-04 12:45:26', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1533, 2, 27, 2, 2, 4, 13, 26, '2021-05-04 12:45:26', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1534, 2, 28, 2, 2, 4, 13, 27, '2021-05-04 12:45:26', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1535, 2, 29, 2, 2, 4, 13, 28, '2021-05-04 12:45:26', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1536, 2, 30, 2, 2, 4, 13, 29, '2021-05-04 12:45:26', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1537, 2, 31, 2, 2, 4, 13, 30, '2021-05-04 12:45:26', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1538, 2, 32, 2, 2, 4, 13, 31, '2021-05-04 12:45:26', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1539, 2, 33, 2, 2, 4, 13, 32, '2021-05-04 12:45:26', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1540, 2, 34, 2, 2, 4, 13, 33, '2021-05-04 12:45:26', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1541, 2, 35, 2, 2, 4, 13, 34, '2021-05-04 12:45:26', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1542, 2, 36, 2, 2, 4, 13, 35, '2021-05-04 12:45:26', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1543, 2, 37, 2, 2, 4, 13, 36, '2021-05-04 12:45:26', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1544, 2, 38, 2, 2, 4, 13, 37, '2021-05-04 12:45:26', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1545, 2, 39, 2, 2, 4, 13, 38, '2021-05-04 12:45:26', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1546, 2, 40, 2, 2, 4, 13, 39, '2021-05-04 12:45:26', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1547, 2, 41, 2, 2, 4, 13, 40, '2021-05-04 12:45:26', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1548, 2, 42, 2, 2, 4, 13, 41, '2021-05-04 12:45:26', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1549, 2, 43, 2, 2, 4, 13, 42, '2021-05-04 12:45:26', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1550, 2, 44, 2, 2, 4, 13, 43, '2021-05-04 12:45:26', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1551, 2, 45, 2, 2, 4, 13, 44, '2021-05-04 12:45:26', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1552, 2, 46, 2, 2, 4, 13, 45, '2021-05-04 12:45:26', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1553, 2, 47, 2, 2, 4, 13, 46, '2021-05-04 12:45:26', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1554, 2, 48, 2, 2, 4, 13, 47, '2021-05-04 12:45:26', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1555, 2, 49, 2, 2, 4, 13, 48, '2021-05-04 12:45:26', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1556, 2, 50, 2, 2, 4, 13, 49, '2021-05-04 12:45:26', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1557, 2, 51, 2, 2, 4, 13, 50, '2021-05-04 12:45:26', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1558, 2, 52, 2, 2, 4, 13, 51, '2021-05-04 12:45:26', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1559, 2, 53, 2, 2, 4, 13, 52, '2021-05-04 12:45:26', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1560, 2, 54, 2, 2, 4, 13, 53, '2021-05-04 12:45:26', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1561, 2, 55, 2, 2, 4, 13, 54, '2021-05-04 12:45:26', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1562, 2, 56, 2, 2, 4, 13, 55, '2021-05-04 12:45:26', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1563, 2, 57, 2, 2, 4, 13, 56, '2021-05-04 12:45:26', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1564, 2, 58, 2, 2, 4, 13, 57, '2021-05-04 12:45:26', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1565, 2, 59, 2, 2, 4, 13, 58, '2021-05-04 12:45:26', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1566, 2, 60, 2, 2, 4, 13, 59, '2021-05-04 12:45:26', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1567, 2, 61, 2, 2, 4, 13, 60, '2021-05-04 12:45:26', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1568, 2, 62, 2, 2, 4, 13, 61, '2021-05-04 12:45:26', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1569, 2, 63, 2, 2, 4, 13, 62, '2021-05-04 12:45:26', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1570, 2, 64, 2, 2, 4, 13, 63, '2021-05-04 12:45:26', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1571, 2, 65, 2, 2, 4, 13, 64, '2021-05-04 12:45:26', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1572, 2, 66, 2, 2, 4, 13, 65, '2021-05-04 12:45:26', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1573, 2, 67, 2, 2, 4, 13, 66, '2021-05-04 12:45:26', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1574, 2, 68, 2, 2, 4, 13, 67, '2021-05-04 12:45:26', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1575, 2, 69, 2, 2, 4, 13, 68, '2021-05-04 12:45:26', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1576, 2, 70, 2, 2, 4, 13, 69, '2021-05-04 12:45:26', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1577, 2, 71, 2, 2, 4, 13, 70, '2021-05-04 12:45:26', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1578, 2, 72, 2, 2, 4, 13, 71, '2021-05-04 12:45:26', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1579, 2, 73, 2, 2, 4, 13, 72, '2021-05-04 12:45:26', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1580, 2, 74, 2, 2, 4, 13, 73, '2021-05-04 12:45:26', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1581, 2, 75, 2, 2, 4, 13, 74, '2021-05-04 12:45:26', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1582, 2, 76, 2, 2, 4, 13, 177, '2021-05-04 12:45:26', '2021-05-04 17:06:14');
INSERT INTO `adms_nivacs_pgs` VALUES (1583, 2, 77, 2, 2, 4, 13, 178, '2021-05-04 12:45:26', '2021-05-04 14:34:27');
INSERT INTO `adms_nivacs_pgs` VALUES (1584, 1, 78, 1, 1, 33, 13, 179, '2021-05-04 12:45:26', '2021-05-04 17:06:21');
INSERT INTO `adms_nivacs_pgs` VALUES (1585, 1, 79, 2, 2, 4, 13, 180, '2021-05-04 12:45:26', '2021-05-04 14:35:00');
INSERT INTO `adms_nivacs_pgs` VALUES (1586, 2, 80, 2, 2, 4, 13, 181, '2021-05-04 12:45:26', '2021-05-04 14:34:55');
INSERT INTO `adms_nivacs_pgs` VALUES (1587, 2, 81, 2, 2, 4, 13, 182, '2021-05-04 12:45:26', '2021-05-04 17:06:09');
INSERT INTO `adms_nivacs_pgs` VALUES (1588, 2, 82, 2, 2, 4, 13, 183, '2021-05-04 12:45:26', '2021-05-04 14:35:34');
INSERT INTO `adms_nivacs_pgs` VALUES (1589, 2, 83, 2, 2, 4, 13, 184, '2021-05-04 12:45:26', '2021-05-04 14:35:32');
INSERT INTO `adms_nivacs_pgs` VALUES (1590, 2, 84, 2, 2, 4, 13, 185, '2021-05-04 12:45:26', '2021-05-04 14:35:25');
INSERT INTO `adms_nivacs_pgs` VALUES (1591, 2, 85, 2, 2, 4, 13, 186, '2021-05-04 12:45:26', '2021-05-04 14:35:22');
INSERT INTO `adms_nivacs_pgs` VALUES (1592, 2, 86, 2, 2, 4, 13, 165, '2021-05-04 12:45:26', '2021-05-04 14:35:14');
INSERT INTO `adms_nivacs_pgs` VALUES (1593, 2, 87, 2, 2, 4, 13, 166, '2021-05-04 12:45:26', '2021-05-04 14:35:42');
INSERT INTO `adms_nivacs_pgs` VALUES (1594, 2, 88, 2, 2, 4, 13, 164, '2021-05-04 12:45:26', '2021-05-04 14:35:46');
INSERT INTO `adms_nivacs_pgs` VALUES (1595, 2, 89, 2, 2, 4, 13, 167, '2021-05-04 12:45:26', '2021-05-04 14:35:51');
INSERT INTO `adms_nivacs_pgs` VALUES (1596, 2, 90, 2, 2, 4, 13, 168, '2021-05-04 12:45:26', '2021-05-04 14:35:53');
INSERT INTO `adms_nivacs_pgs` VALUES (1597, 2, 91, 2, 2, 4, 13, 169, '2021-05-04 12:45:26', '2021-05-04 13:32:38');
INSERT INTO `adms_nivacs_pgs` VALUES (1598, 2, 92, 2, 2, 4, 13, 170, '2021-05-04 12:45:26', '2021-05-04 13:32:40');
INSERT INTO `adms_nivacs_pgs` VALUES (1599, 2, 93, 2, 2, 4, 13, 171, '2021-05-04 12:45:26', '2021-05-04 13:32:29');
INSERT INTO `adms_nivacs_pgs` VALUES (1600, 2, 94, 2, 2, 4, 13, 172, '2021-05-04 12:45:26', '2021-05-04 13:32:33');
INSERT INTO `adms_nivacs_pgs` VALUES (1601, 1, 95, 1, 1, 33, 13, 173, '2021-05-04 12:45:26', '2021-05-04 14:36:16');
INSERT INTO `adms_nivacs_pgs` VALUES (1602, 2, 96, 2, 2, 4, 13, 174, '2021-05-04 12:45:26', '2021-05-04 13:32:46');
INSERT INTO `adms_nivacs_pgs` VALUES (1603, 2, 97, 2, 2, 33, 13, 175, '2021-05-04 12:45:26', '2021-05-04 17:05:06');
INSERT INTO `adms_nivacs_pgs` VALUES (1604, 1, 98, 1, 1, 38, 13, 187, '2021-05-04 12:45:26', '2021-05-04 14:36:45');
INSERT INTO `adms_nivacs_pgs` VALUES (1605, 2, 99, 2, 2, 4, 13, 188, '2021-05-04 12:45:26', '2021-05-04 17:05:32');
INSERT INTO `adms_nivacs_pgs` VALUES (1606, 2, 100, 2, 2, 38, 13, 189, '2021-05-04 12:45:26', '2021-05-04 17:05:40');
INSERT INTO `adms_nivacs_pgs` VALUES (1607, 1, 1, 2, 1, 1, 14, 1, '2021-05-04 14:33:22', '2021-05-18 18:33:53');
INSERT INTO `adms_nivacs_pgs` VALUES (1608, 2, 2, 2, 2, 4, 14, 2, '2021-05-04 14:33:22', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1609, 1, 3, 2, 2, 4, 14, 3, '2021-05-04 14:33:22', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1610, 1, 4, 2, 2, 3, 14, 4, '2021-05-04 14:33:22', '2021-05-18 18:31:47');
INSERT INTO `adms_nivacs_pgs` VALUES (1611, 2, 5, 2, 2, 4, 14, 5, '2021-05-04 14:33:22', '2021-05-04 14:37:53');
INSERT INTO `adms_nivacs_pgs` VALUES (1612, 2, 6, 2, 2, 4, 14, 6, '2021-05-04 14:33:22', '2021-05-18 18:27:36');
INSERT INTO `adms_nivacs_pgs` VALUES (1613, 2, 7, 2, 2, 4, 14, 7, '2021-05-04 14:33:22', '2021-05-18 18:27:41');
INSERT INTO `adms_nivacs_pgs` VALUES (1614, 2, 8, 2, 2, 4, 14, 8, '2021-05-04 14:33:22', '2021-05-18 18:29:20');
INSERT INTO `adms_nivacs_pgs` VALUES (1615, 1, 9, 1, 1, 4, 14, 9, '2021-05-04 14:33:22', '2021-05-18 18:26:43');
INSERT INTO `adms_nivacs_pgs` VALUES (1616, 2, 10, 2, 2, 4, 14, 10, '2021-05-04 14:33:22', '2021-05-18 18:29:40');
INSERT INTO `adms_nivacs_pgs` VALUES (1617, 2, 11, 2, 2, 4, 14, 11, '2021-05-04 14:33:22', '2021-05-18 18:29:02');
INSERT INTO `adms_nivacs_pgs` VALUES (1618, 2, 12, 2, 2, 4, 14, 12, '2021-05-04 14:33:22', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1619, 2, 13, 2, 2, 4, 14, 13, '2021-05-04 14:33:22', '2021-05-18 18:28:55');
INSERT INTO `adms_nivacs_pgs` VALUES (1620, 2, 14, 2, 2, 4, 14, 14, '2021-05-04 14:33:22', '2021-05-18 18:28:53');
INSERT INTO `adms_nivacs_pgs` VALUES (1621, 2, 15, 2, 2, 4, 14, 15, '2021-05-04 14:33:22', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1622, 2, 16, 2, 2, 4, 14, 16, '2021-05-04 14:33:22', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1623, 2, 17, 2, 2, 4, 14, 17, '2021-05-04 14:33:22', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1624, 2, 18, 2, 2, 4, 14, 18, '2021-05-04 14:33:22', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1625, 2, 19, 2, 2, 4, 14, 19, '2021-05-04 14:33:22', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1626, 2, 20, 2, 2, 4, 14, 20, '2021-05-04 14:33:22', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1627, 2, 21, 2, 2, 4, 14, 21, '2021-05-04 14:33:22', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1628, 2, 22, 2, 2, 4, 14, 22, '2021-05-04 14:33:22', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1629, 2, 23, 2, 2, 4, 14, 23, '2021-05-04 14:33:22', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1630, 2, 24, 2, 2, 4, 14, 24, '2021-05-04 14:33:22', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1631, 2, 25, 2, 2, 4, 14, 25, '2021-05-04 14:33:22', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1632, 2, 26, 2, 2, 4, 14, 26, '2021-05-04 14:33:22', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1633, 2, 27, 2, 2, 4, 14, 27, '2021-05-04 14:33:22', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1634, 2, 28, 2, 2, 4, 14, 28, '2021-05-04 14:33:22', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1635, 2, 29, 2, 2, 4, 14, 29, '2021-05-04 14:33:22', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1636, 2, 30, 2, 2, 4, 14, 30, '2021-05-04 14:33:22', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1637, 2, 31, 2, 2, 4, 14, 31, '2021-05-04 14:33:22', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1638, 2, 32, 2, 2, 4, 14, 32, '2021-05-04 14:33:22', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1639, 2, 33, 2, 2, 4, 14, 33, '2021-05-04 14:33:22', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1640, 2, 34, 2, 2, 4, 14, 34, '2021-05-04 14:33:22', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1641, 2, 35, 2, 2, 4, 14, 35, '2021-05-04 14:33:22', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1642, 2, 36, 2, 2, 4, 14, 36, '2021-05-04 14:33:22', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1643, 2, 37, 2, 2, 4, 14, 37, '2021-05-04 14:33:22', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1644, 2, 38, 2, 2, 4, 14, 38, '2021-05-04 14:33:22', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1645, 2, 39, 2, 2, 4, 14, 39, '2021-05-04 14:33:22', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1646, 2, 40, 2, 2, 4, 14, 40, '2021-05-04 14:33:22', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1647, 2, 41, 2, 2, 4, 14, 41, '2021-05-04 14:33:22', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1648, 2, 42, 2, 2, 4, 14, 42, '2021-05-04 14:33:22', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1649, 2, 43, 2, 2, 4, 14, 43, '2021-05-04 14:33:22', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1650, 2, 44, 2, 2, 4, 14, 44, '2021-05-04 14:33:22', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1651, 2, 45, 2, 2, 4, 14, 45, '2021-05-04 14:33:22', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1652, 2, 46, 2, 2, 4, 14, 46, '2021-05-04 14:33:22', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1653, 2, 47, 2, 2, 4, 14, 47, '2021-05-04 14:33:22', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1654, 2, 48, 2, 2, 4, 14, 48, '2021-05-04 14:33:22', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1655, 2, 49, 2, 2, 4, 14, 49, '2021-05-04 14:33:22', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1656, 2, 50, 2, 2, 4, 14, 50, '2021-05-04 14:33:22', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1657, 2, 51, 2, 2, 4, 14, 51, '2021-05-04 14:33:22', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1658, 2, 52, 2, 2, 4, 14, 52, '2021-05-04 14:33:22', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1659, 2, 53, 2, 2, 4, 14, 53, '2021-05-04 14:33:22', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1660, 2, 54, 2, 2, 4, 14, 54, '2021-05-04 14:33:22', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1661, 2, 55, 2, 2, 4, 14, 55, '2021-05-04 14:33:22', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1662, 2, 56, 2, 2, 4, 14, 56, '2021-05-04 14:33:22', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1663, 2, 57, 2, 2, 4, 14, 57, '2021-05-04 14:33:22', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1664, 2, 58, 2, 2, 4, 14, 58, '2021-05-04 14:33:22', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1665, 2, 59, 2, 2, 4, 14, 59, '2021-05-04 14:33:22', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1666, 2, 60, 2, 2, 4, 14, 60, '2021-05-04 14:33:22', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1667, 2, 61, 2, 2, 4, 14, 61, '2021-05-04 14:33:22', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1668, 2, 62, 2, 2, 4, 14, 62, '2021-05-04 14:33:22', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1669, 2, 63, 2, 2, 4, 14, 63, '2021-05-04 14:33:22', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1670, 2, 64, 2, 2, 4, 14, 64, '2021-05-04 14:33:22', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1671, 2, 65, 2, 2, 4, 14, 65, '2021-05-04 14:33:22', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1672, 2, 66, 2, 2, 4, 14, 66, '2021-05-04 14:33:22', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1673, 2, 67, 2, 2, 4, 14, 67, '2021-05-04 14:33:22', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1674, 2, 68, 2, 2, 4, 14, 68, '2021-05-04 14:33:22', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1675, 2, 69, 2, 2, 4, 14, 69, '2021-05-04 14:33:22', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1676, 2, 70, 2, 2, 4, 14, 70, '2021-05-04 14:33:22', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1677, 2, 71, 2, 2, 4, 14, 71, '2021-05-04 14:33:22', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1678, 2, 72, 2, 2, 4, 14, 72, '2021-05-04 14:33:22', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1679, 2, 73, 2, 2, 4, 14, 73, '2021-05-04 14:33:22', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1680, 2, 74, 2, 2, 4, 14, 74, '2021-05-04 14:33:22', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1681, 2, 75, 2, 2, 4, 14, 190, '2021-05-04 14:33:22', '2021-05-04 14:38:23');
INSERT INTO `adms_nivacs_pgs` VALUES (1682, 2, 76, 2, 2, 4, 14, 177, '2021-05-04 14:33:22', '2021-05-04 14:38:25');
INSERT INTO `adms_nivacs_pgs` VALUES (1683, 2, 77, 2, 2, 4, 14, 178, '2021-05-04 14:33:22', '2021-05-04 14:38:27');
INSERT INTO `adms_nivacs_pgs` VALUES (1684, 2, 78, 2, 2, 4, 14, 179, '2021-05-04 14:33:22', '2021-05-04 14:38:29');
INSERT INTO `adms_nivacs_pgs` VALUES (1685, 2, 79, 2, 2, 4, 14, 180, '2021-05-04 14:33:22', '2021-05-04 14:38:32');
INSERT INTO `adms_nivacs_pgs` VALUES (1686, 2, 80, 2, 2, 4, 14, 181, '2021-05-04 14:33:22', '2021-05-04 14:38:35');
INSERT INTO `adms_nivacs_pgs` VALUES (1687, 2, 81, 2, 2, 4, 14, 182, '2021-05-04 14:33:22', '2021-05-04 14:38:40');
INSERT INTO `adms_nivacs_pgs` VALUES (1688, 2, 82, 2, 2, 4, 14, 183, '2021-05-04 14:33:22', '2021-05-04 14:38:43');
INSERT INTO `adms_nivacs_pgs` VALUES (1689, 2, 83, 2, 2, 4, 14, 184, '2021-05-04 14:33:22', '2021-05-04 14:38:46');
INSERT INTO `adms_nivacs_pgs` VALUES (1690, 2, 84, 2, 2, 4, 14, 185, '2021-05-04 14:33:22', '2021-05-04 14:38:48');
INSERT INTO `adms_nivacs_pgs` VALUES (1691, 2, 85, 2, 2, 4, 14, 186, '2021-05-04 14:33:22', '2021-05-04 14:38:53');
INSERT INTO `adms_nivacs_pgs` VALUES (1692, 2, 86, 2, 2, 4, 14, 165, '2021-05-04 14:33:22', '2021-05-04 14:38:57');
INSERT INTO `adms_nivacs_pgs` VALUES (1693, 2, 87, 2, 2, 4, 14, 166, '2021-05-04 14:33:22', '2021-05-04 14:39:05');
INSERT INTO `adms_nivacs_pgs` VALUES (1694, 2, 88, 2, 2, 4, 14, 164, '2021-05-04 14:33:22', '2021-05-04 14:39:07');
INSERT INTO `adms_nivacs_pgs` VALUES (1695, 2, 89, 2, 2, 4, 14, 167, '2021-05-04 14:33:22', '2021-05-04 14:39:08');
INSERT INTO `adms_nivacs_pgs` VALUES (1696, 2, 90, 2, 2, 4, 14, 168, '2021-05-04 14:33:22', '2021-05-04 14:39:10');
INSERT INTO `adms_nivacs_pgs` VALUES (1697, 2, 91, 2, 2, 4, 14, 169, '2021-05-04 14:33:22', '2021-05-04 14:39:15');
INSERT INTO `adms_nivacs_pgs` VALUES (1698, 2, 92, 2, 2, 4, 14, 170, '2021-05-04 14:33:22', '2021-05-04 14:39:18');
INSERT INTO `adms_nivacs_pgs` VALUES (1699, 2, 93, 2, 2, 4, 14, 171, '2021-05-04 14:33:22', '2021-05-04 14:39:19');
INSERT INTO `adms_nivacs_pgs` VALUES (1700, 2, 94, 2, 2, 4, 14, 172, '2021-05-04 14:33:22', '2021-05-04 14:39:21');
INSERT INTO `adms_nivacs_pgs` VALUES (1701, 2, 95, 2, 2, 4, 14, 173, '2021-05-04 14:33:22', '2021-05-04 14:39:23');
INSERT INTO `adms_nivacs_pgs` VALUES (1702, 2, 96, 2, 2, 4, 14, 174, '2021-05-04 14:33:22', '2021-05-04 14:39:24');
INSERT INTO `adms_nivacs_pgs` VALUES (1703, 2, 97, 2, 2, 4, 14, 175, '2021-05-04 14:33:22', '2021-05-04 14:39:28');
INSERT INTO `adms_nivacs_pgs` VALUES (1704, 2, 98, 2, 2, 4, 14, 187, '2021-05-04 14:33:22', '2021-05-04 14:39:30');
INSERT INTO `adms_nivacs_pgs` VALUES (1705, 2, 99, 2, 2, 4, 14, 188, '2021-05-04 14:33:22', '2021-05-18 18:30:12');
INSERT INTO `adms_nivacs_pgs` VALUES (1706, 1, 100, 1, 1, 39, 14, 189, '2021-05-04 14:33:22', '2021-05-18 18:25:47');
INSERT INTO `adms_nivacs_pgs` VALUES (1707, 1, 148, 2, 2, 4, 1, 191, '2021-06-03 18:29:17', '2021-07-05 13:20:51');
INSERT INTO `adms_nivacs_pgs` VALUES (1708, 2, 110, 2, 2, 4, 2, 191, '2021-06-03 18:29:17', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1709, 2, 110, 2, 2, 4, 11, 191, '2021-06-03 18:29:17', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1710, 2, 110, 2, 2, 4, 12, 191, '2021-06-03 18:29:17', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1711, 2, 101, 2, 2, 4, 13, 191, '2021-06-03 18:29:17', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1712, 2, 101, 2, 2, 4, 14, 191, '2021-06-03 18:29:17', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1713, 1, 147, 1, 1, 31, 1, 192, '2021-07-05 13:18:21', '2021-07-05 13:21:29');
INSERT INTO `adms_nivacs_pgs` VALUES (1714, 2, 111, 2, 2, 4, 2, 192, '2021-07-05 13:18:21', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1715, 2, 111, 2, 2, 4, 11, 192, '2021-07-05 13:18:21', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1716, 2, 111, 2, 2, 4, 12, 192, '2021-07-05 13:18:21', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1717, 2, 102, 2, 2, 4, 13, 192, '2021-07-05 13:18:21', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1718, 2, 102, 2, 2, 4, 14, 192, '2021-07-05 13:18:21', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1719, 1, 149, 2, 2, 4, 1, 193, '2021-07-13 13:21:17', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1720, 2, 112, 2, 2, 4, 2, 193, '2021-07-13 13:21:17', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1721, 2, 112, 2, 2, 4, 11, 193, '2021-07-13 13:21:17', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1722, 2, 112, 2, 2, 4, 12, 193, '2021-07-13 13:21:17', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1723, 2, 103, 2, 2, 4, 13, 193, '2021-07-13 13:21:17', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1724, 2, 103, 2, 2, 4, 14, 193, '2021-07-13 13:21:17', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1725, 1, 150, 1, 1, 32, 1, 194, '2021-08-02 13:00:14', '2021-08-02 13:01:48');
INSERT INTO `adms_nivacs_pgs` VALUES (1726, 2, 113, 2, 2, 4, 2, 194, '2021-08-02 13:00:14', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1727, 2, 113, 2, 2, 4, 11, 194, '2021-08-02 13:00:14', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1728, 2, 113, 2, 2, 4, 12, 194, '2021-08-02 13:00:14', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1729, 2, 104, 2, 2, 4, 13, 194, '2021-08-02 13:00:14', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1730, 2, 104, 2, 2, 4, 14, 194, '2021-08-02 13:00:14', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1824, 2, 115, 2, 2, 4, 2, 212, '2022-04-11 14:59:44', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1823, 1, 153, 2, 2, 42, 1, 212, '2022-04-11 14:59:44', '2025-01-10 13:24:14');
INSERT INTO `adms_nivacs_pgs` VALUES (1822, 2, 105, 2, 2, 4, 13, 211, '2022-03-07 01:49:34', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1821, 2, 114, 2, 2, 42, 2, 211, '2022-03-07 01:49:34', '2025-01-17 10:31:42');
INSERT INTO `adms_nivacs_pgs` VALUES (1820, 1, 152, 2, 2, 42, 1, 211, '2022-03-07 01:49:34', '2025-01-10 13:24:18');
INSERT INTO `adms_nivacs_pgs` VALUES (1736, 2, 105, 2, 2, 4, 14, 195, '2021-11-16 13:08:39', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1829, 1, 155, 2, 2, 42, 1, 214, '2022-04-11 16:28:21', '2025-01-10 13:24:08');
INSERT INTO `adms_nivacs_pgs` VALUES (1828, 2, 107, 2, 2, 4, 13, 213, '2022-04-11 15:56:16', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1827, 2, 116, 2, 2, 4, 2, 213, '2022-04-11 15:56:16', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1826, 1, 154, 2, 2, 42, 1, 213, '2022-04-11 15:56:16', '2025-01-10 13:24:12');
INSERT INTO `adms_nivacs_pgs` VALUES (1825, 2, 106, 2, 2, 4, 13, 212, '2022-04-11 14:59:44', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1742, 2, 106, 2, 2, 4, 14, 196, '2021-11-19 10:08:51', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1834, 2, 109, 2, 2, 4, 13, 215, '2022-04-14 10:00:13', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1833, 2, 118, 2, 2, 4, 2, 215, '2022-04-14 10:00:13', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1832, 1, 156, 2, 2, 46, 1, 215, '2022-04-14 10:00:13', '2025-01-10 13:24:04');
INSERT INTO `adms_nivacs_pgs` VALUES (1831, 2, 108, 2, 2, 4, 13, 214, '2022-04-11 16:28:21', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1830, 2, 117, 2, 2, 42, 2, 214, '2022-04-11 16:28:21', '2025-01-17 10:31:54');
INSERT INTO `adms_nivacs_pgs` VALUES (1748, 2, 107, 2, 2, 4, 14, 197, '2021-11-22 09:51:06', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1760, 2, 108, 2, 2, 4, 14, 199, '2021-11-29 11:29:18', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1835, 1, 157, 2, 2, 47, 1, 216, '2022-06-09 10:39:21', '2025-01-10 13:23:33');
INSERT INTO `adms_nivacs_pgs` VALUES (1836, 2, 119, 2, 2, 47, 2, 216, '2022-06-09 10:39:21', '2025-01-17 10:32:03');
INSERT INTO `adms_nivacs_pgs` VALUES (1837, 2, 110, 2, 2, 4, 13, 216, '2022-06-09 10:39:21', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1838, 1, 158, 2, 2, 46, 1, 217, '2022-06-09 12:23:43', '2024-12-24 08:25:36');
INSERT INTO `adms_nivacs_pgs` VALUES (1839, 2, 120, 2, 2, 4, 2, 217, '2022-06-09 12:23:43', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1844, 1, 160, 2, 2, 42, 1, 219, '2022-06-13 18:55:17', '2025-01-10 13:23:41');
INSERT INTO `adms_nivacs_pgs` VALUES (1843, 2, 112, 2, 2, 4, 13, 218, '2022-06-13 18:25:28', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1842, 2, 121, 2, 2, 4, 2, 218, '2022-06-13 18:25:28', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1841, 1, 159, 2, 2, 46, 1, 218, '2022-06-13 18:25:28', '2025-01-10 13:23:37');
INSERT INTO `adms_nivacs_pgs` VALUES (1840, 2, 111, 2, 2, 4, 13, 217, '2022-06-09 12:23:43', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1766, 2, 109, 2, 2, 4, 14, 200, '2021-12-02 09:21:45', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1849, 2, 114, 2, 2, 4, 13, 220, '2022-06-14 11:20:40', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1848, 2, 123, 2, 2, 4, 2, 220, '2022-06-14 11:20:40', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1847, 1, 161, 2, 2, 47, 1, 220, '2022-06-14 11:20:40', '2025-01-10 13:23:44');
INSERT INTO `adms_nivacs_pgs` VALUES (1846, 2, 113, 2, 2, 4, 13, 219, '2022-06-13 18:55:17', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1845, 2, 122, 2, 2, 42, 2, 219, '2022-06-13 18:55:17', '2025-01-17 10:31:27');
INSERT INTO `adms_nivacs_pgs` VALUES (1772, 2, 110, 2, 2, 4, 14, 201, '2021-12-02 10:16:03', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1854, 1, 163, 2, 2, 48, 1, 222, '2022-07-06 09:51:29', '2025-01-10 13:23:52');
INSERT INTO `adms_nivacs_pgs` VALUES (1853, 1, 1, 2, 2, 4, 15, 221, '2022-06-27 11:51:54', '2022-09-20 17:43:03');
INSERT INTO `adms_nivacs_pgs` VALUES (1852, 2, 115, 2, 2, 4, 13, 221, '2022-06-27 11:51:54', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1851, 2, 124, 2, 2, 4, 2, 221, '2022-06-27 11:51:54', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1850, 1, 162, 2, 2, 4, 1, 221, '2022-06-27 11:51:54', '2024-12-24 08:25:24');
INSERT INTO `adms_nivacs_pgs` VALUES (1778, 2, 111, 2, 2, 4, 14, 202, '2021-12-07 12:50:01', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1859, 2, 126, 2, 2, 4, 2, 223, '2022-07-06 11:03:59', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1858, 1, 164, 2, 2, 4, 1, 223, '2022-07-06 11:03:59', '2024-12-24 08:25:20');
INSERT INTO `adms_nivacs_pgs` VALUES (1857, 1, 2, 2, 2, 4, 15, 222, '2022-07-06 09:51:29', '2022-09-20 17:43:04');
INSERT INTO `adms_nivacs_pgs` VALUES (1856, 2, 116, 2, 2, 4, 13, 222, '2022-07-06 09:51:29', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1855, 2, 125, 2, 2, 4, 2, 222, '2022-07-06 09:51:29', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1784, 2, 112, 2, 2, 4, 14, 203, '2021-12-13 10:18:38', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1864, 2, 118, 2, 2, 4, 13, 224, '2022-07-17 17:46:26', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1863, 2, 127, 2, 2, 4, 2, 224, '2022-07-17 17:46:26', '2022-09-29 21:42:36');
INSERT INTO `adms_nivacs_pgs` VALUES (1862, 1, 165, 2, 2, 489, 1, 224, '2022-07-17 17:46:26', '2025-01-10 13:23:57');
INSERT INTO `adms_nivacs_pgs` VALUES (1861, 1, 3, 2, 2, 4, 15, 223, '2022-07-06 11:03:59', '2022-09-20 17:43:05');
INSERT INTO `adms_nivacs_pgs` VALUES (1860, 2, 117, 2, 2, 4, 13, 223, '2022-07-06 11:03:59', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1865, 1, 4, 2, 2, 4, 15, 224, '2022-07-17 17:46:26', '2022-09-20 17:43:07');
INSERT INTO `adms_nivacs_pgs` VALUES (1866, 1, 166, 2, 2, 4, 1, 225, '2022-09-13 12:49:54', '2024-12-24 08:25:13');
INSERT INTO `adms_nivacs_pgs` VALUES (1867, 1, 128, 2, 2, 4, 2, 225, '2022-09-13 12:49:54', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1868, 1, 119, 2, 2, 4, 13, 225, '2022-09-13 12:49:54', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1869, 1, 5, 2, 2, 4, 15, 225, '2022-09-13 12:49:54', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1870, 1, 6, 2, 1, 1, 15, 1, '2022-09-13 13:10:19', '2022-09-21 09:38:35');
INSERT INTO `adms_nivacs_pgs` VALUES (1871, 1, 7, 2, 2, 4, 15, 2, '2022-09-13 13:10:19', '2022-09-20 17:43:11');
INSERT INTO `adms_nivacs_pgs` VALUES (1872, 1, 8, 2, 2, 4, 15, 3, '2022-09-13 13:10:19', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1873, 1, 9, 2, 1, 3, 15, 4, '2022-09-13 13:10:19', '2022-09-23 11:41:48');
INSERT INTO `adms_nivacs_pgs` VALUES (1874, 1, 10, 2, 2, 4, 15, 5, '2022-09-13 13:10:19', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1875, 1, 11, 2, 2, 4, 15, 6, '2022-09-13 13:10:19', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1876, 1, 12, 2, 2, 4, 15, 7, '2022-09-13 13:10:19', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1877, 1, 13, 2, 2, 4, 15, 8, '2022-09-13 13:10:19', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1878, 1, 14, 2, 2, 4, 15, 9, '2022-09-13 13:10:19', '2022-09-20 17:43:25');
INSERT INTO `adms_nivacs_pgs` VALUES (1879, 1, 15, 2, 2, 4, 15, 10, '2022-09-13 13:10:19', '2022-09-20 17:43:27');
INSERT INTO `adms_nivacs_pgs` VALUES (1880, 1, 16, 2, 2, 4, 15, 11, '2022-09-13 13:10:19', '2022-09-20 17:43:29');
INSERT INTO `adms_nivacs_pgs` VALUES (1881, 1, 17, 2, 2, 4, 15, 12, '2022-09-13 13:10:19', '2022-09-20 17:43:32');
INSERT INTO `adms_nivacs_pgs` VALUES (1882, 1, 18, 2, 2, 4, 15, 13, '2022-09-13 13:10:19', '2022-09-20 17:43:35');
INSERT INTO `adms_nivacs_pgs` VALUES (1883, 1, 19, 2, 2, 4, 15, 14, '2022-09-13 13:10:19', '2022-09-20 17:43:38');
INSERT INTO `adms_nivacs_pgs` VALUES (1884, 1, 20, 2, 2, 4, 15, 15, '2022-09-13 13:10:19', '2022-09-20 17:43:42');
INSERT INTO `adms_nivacs_pgs` VALUES (1885, 2, 21, 2, 2, 4, 15, 16, '2022-09-13 13:10:19', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1886, 2, 22, 2, 2, 4, 15, 17, '2022-09-13 13:10:19', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1887, 2, 23, 2, 2, 4, 15, 18, '2022-09-13 13:10:19', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1888, 2, 24, 2, 2, 4, 15, 19, '2022-09-13 13:10:19', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1889, 2, 25, 2, 2, 4, 15, 20, '2022-09-13 13:10:19', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1890, 2, 26, 2, 2, 4, 15, 21, '2022-09-13 13:10:19', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1891, 2, 27, 2, 2, 4, 15, 22, '2022-09-13 13:10:19', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1892, 2, 28, 2, 2, 4, 15, 23, '2022-09-13 13:10:19', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1893, 2, 29, 2, 2, 4, 15, 24, '2022-09-13 13:10:19', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1894, 2, 30, 2, 2, 4, 15, 25, '2022-09-13 13:10:19', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1895, 2, 31, 2, 2, 4, 15, 26, '2022-09-13 13:10:19', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1896, 2, 32, 2, 2, 4, 15, 27, '2022-09-13 13:10:19', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1897, 2, 33, 2, 2, 4, 15, 28, '2022-09-13 13:10:19', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1898, 2, 34, 2, 2, 4, 15, 29, '2022-09-13 13:10:19', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1899, 2, 35, 2, 2, 4, 15, 30, '2022-09-13 13:10:19', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1900, 2, 36, 2, 2, 4, 15, 31, '2022-09-13 13:10:19', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1901, 2, 37, 2, 2, 4, 15, 32, '2022-09-13 13:10:19', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1902, 2, 38, 2, 2, 4, 15, 33, '2022-09-13 13:10:19', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1903, 2, 39, 2, 2, 4, 15, 34, '2022-09-13 13:10:19', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1904, 2, 40, 2, 2, 4, 15, 35, '2022-09-13 13:10:19', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1905, 2, 41, 2, 2, 4, 15, 36, '2022-09-13 13:10:19', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1906, 2, 42, 2, 2, 4, 15, 37, '2022-09-13 13:10:19', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1907, 2, 43, 2, 2, 4, 15, 38, '2022-09-13 13:10:19', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1908, 2, 44, 2, 2, 4, 15, 39, '2022-09-13 13:10:19', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1909, 2, 45, 2, 2, 4, 15, 40, '2022-09-13 13:10:19', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1910, 2, 46, 2, 2, 4, 15, 41, '2022-09-13 13:10:19', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1911, 2, 47, 2, 2, 4, 15, 42, '2022-09-13 13:10:19', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1912, 2, 48, 2, 2, 4, 15, 43, '2022-09-13 13:10:19', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1913, 2, 49, 2, 2, 4, 15, 44, '2022-09-13 13:10:19', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1914, 2, 50, 2, 2, 4, 15, 45, '2022-09-13 13:10:19', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1915, 2, 51, 2, 2, 4, 15, 46, '2022-09-13 13:10:19', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1916, 2, 52, 2, 2, 4, 15, 47, '2022-09-13 13:10:19', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1917, 2, 53, 2, 2, 4, 15, 48, '2022-09-13 13:10:19', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1918, 2, 54, 2, 2, 4, 15, 49, '2022-09-13 13:10:19', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1919, 2, 55, 2, 2, 4, 15, 50, '2022-09-13 13:10:19', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1920, 2, 56, 2, 2, 4, 15, 51, '2022-09-13 13:10:19', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1921, 2, 57, 2, 2, 4, 15, 52, '2022-09-13 13:10:19', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1922, 2, 58, 2, 2, 4, 15, 53, '2022-09-13 13:10:19', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1923, 2, 59, 2, 2, 4, 15, 54, '2022-09-13 13:10:19', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1924, 2, 60, 2, 2, 4, 15, 55, '2022-09-13 13:10:19', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1925, 2, 61, 2, 2, 4, 15, 56, '2022-09-13 13:10:19', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1926, 2, 62, 2, 2, 4, 15, 57, '2022-09-13 13:10:19', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1927, 2, 63, 2, 2, 4, 15, 58, '2022-09-13 13:10:19', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1928, 2, 64, 2, 2, 4, 15, 59, '2022-09-13 13:10:19', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1929, 2, 65, 2, 2, 4, 15, 60, '2022-09-13 13:10:19', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1930, 2, 66, 2, 2, 4, 15, 61, '2022-09-13 13:10:19', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1931, 2, 67, 2, 2, 4, 15, 62, '2022-09-13 13:10:19', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1932, 2, 68, 2, 2, 4, 15, 63, '2022-09-13 13:10:19', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1933, 2, 69, 2, 2, 4, 15, 64, '2022-09-13 13:10:19', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1934, 2, 70, 2, 2, 4, 15, 65, '2022-09-13 13:10:19', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1935, 2, 71, 2, 2, 4, 15, 66, '2022-09-13 13:10:19', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1936, 2, 72, 2, 2, 4, 15, 67, '2022-09-13 13:10:19', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1937, 2, 73, 2, 2, 4, 15, 68, '2022-09-13 13:10:19', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1938, 2, 74, 2, 2, 4, 15, 69, '2022-09-13 13:10:19', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1939, 2, 75, 2, 2, 4, 15, 70, '2022-09-13 13:10:19', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1940, 2, 76, 2, 2, 4, 15, 71, '2022-09-13 13:10:19', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1941, 2, 77, 2, 2, 4, 15, 72, '2022-09-13 13:10:19', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1942, 2, 78, 2, 2, 4, 15, 73, '2022-09-13 13:10:19', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1943, 2, 79, 2, 2, 4, 15, 74, '2022-09-13 13:10:19', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1944, 1, 80, 2, 2, 4, 15, 211, '2022-09-13 13:10:19', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1945, 2, 81, 2, 2, 4, 15, 212, '2022-09-13 13:10:19', '2022-09-20 17:16:26');
INSERT INTO `adms_nivacs_pgs` VALUES (1946, 2, 82, 2, 2, 4, 15, 213, '2022-09-13 13:10:19', '2022-09-20 17:16:30');
INSERT INTO `adms_nivacs_pgs` VALUES (1947, 2, 83, 2, 2, 4, 15, 214, '2022-09-13 13:10:19', '2022-09-20 17:16:36');
INSERT INTO `adms_nivacs_pgs` VALUES (1948, 1, 84, 1, 1, 46, 15, 215, '2022-09-13 13:10:19', '2022-09-20 17:17:04');
INSERT INTO `adms_nivacs_pgs` VALUES (1949, 1, 85, 2, 2, 4, 15, 216, '2022-09-13 13:10:19', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1950, 1, 86, 2, 2, 4, 15, 217, '2022-09-13 13:10:19', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1951, 2, 87, 2, 2, 46, 15, 218, '2022-09-13 13:10:19', '2022-09-28 09:03:32');
INSERT INTO `adms_nivacs_pgs` VALUES (1952, 2, 88, 2, 2, 4, 15, 219, '2022-09-13 13:10:19', '2022-09-20 17:41:02');
INSERT INTO `adms_nivacs_pgs` VALUES (1953, 1, 89, 2, 2, 4, 15, 220, '2022-09-13 13:10:19', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1954, 1, 167, 2, 2, 4, 1, 226, '2022-09-20 19:07:55', '2024-12-24 08:25:00');
INSERT INTO `adms_nivacs_pgs` VALUES (1955, 1, 168, 2, 2, 4, 1, 227, '2022-09-20 19:07:55', '2024-12-24 08:24:58');
INSERT INTO `adms_nivacs_pgs` VALUES (1956, 1, 129, 2, 2, 4, 2, 226, '2022-09-20 19:07:55', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1957, 1, 130, 2, 2, 4, 2, 227, '2022-09-20 19:07:55', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1958, 1, 120, 2, 2, 4, 13, 226, '2022-09-20 19:07:55', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1959, 1, 121, 2, 2, 4, 13, 227, '2022-09-20 19:07:55', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1960, 1, 90, 2, 2, 4, 15, 226, '2022-09-20 19:07:55', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1961, 1, 91, 2, 2, 4, 15, 227, '2022-09-20 19:07:55', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1962, 1, 169, 2, 2, 4, 1, 228, '2022-09-23 18:18:31', '2024-12-24 08:24:55');
INSERT INTO `adms_nivacs_pgs` VALUES (1963, 2, 131, 2, 2, 4, 2, 228, '2022-09-23 18:18:31', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1964, 1, 122, 2, 2, 46, 13, 228, '2022-09-23 18:18:31', '2025-01-10 19:18:37');
INSERT INTO `adms_nivacs_pgs` VALUES (1965, 2, 92, 2, 2, 4, 15, 228, '2022-09-23 18:18:31', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1966, 1, 170, 2, 2, 4, 1, 229, '2022-09-27 13:23:12', '2024-12-24 08:24:53');
INSERT INTO `adms_nivacs_pgs` VALUES (1967, 2, 132, 2, 2, 490, 2, 229, '2022-09-27 13:23:12', '2025-01-17 10:30:52');
INSERT INTO `adms_nivacs_pgs` VALUES (1968, 2, 123, 2, 2, 4, 13, 229, '2022-09-27 13:23:12', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1969, 2, 93, 2, 2, 4, 15, 229, '2022-09-27 13:23:12', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1970, 1, 171, 2, 2, 4, 1, 230, '2022-09-28 08:27:40', '2024-12-24 08:24:52');
INSERT INTO `adms_nivacs_pgs` VALUES (1971, 2, 133, 2, 2, 46, 2, 230, '2022-09-28 08:27:40', '2025-01-17 10:30:41');
INSERT INTO `adms_nivacs_pgs` VALUES (1972, 2, 124, 2, 2, 4, 13, 230, '2022-09-28 08:27:40', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1973, 2, 94, 2, 2, 4, 15, 230, '2022-09-28 08:27:40', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1974, 1, 172, 2, 2, 4, 1, 231, '2022-09-28 09:02:35', '2024-12-24 08:24:50');
INSERT INTO `adms_nivacs_pgs` VALUES (1975, 2, 134, 2, 2, 4, 2, 231, '2022-09-28 09:02:35', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1976, 2, 125, 2, 2, 4, 13, 231, '2022-09-28 09:02:35', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1977, 1, 95, 1, 1, 46, 15, 231, '2022-09-28 09:02:35', '2022-09-28 09:03:07');
INSERT INTO `adms_nivacs_pgs` VALUES (1978, 1, 173, 2, 2, 4, 1, 232, '2022-09-29 09:17:20', '2024-12-24 08:24:47');
INSERT INTO `adms_nivacs_pgs` VALUES (1979, 2, 135, 2, 2, 489, 2, 232, '2022-09-29 09:17:20', '2025-01-17 10:30:31');
INSERT INTO `adms_nivacs_pgs` VALUES (1980, 2, 126, 2, 2, 4, 13, 232, '2022-09-29 09:17:20', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1981, 2, 96, 2, 2, 4, 15, 232, '2022-09-29 09:17:20', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1982, 1, 174, 2, 2, 4, 1, 233, '2022-09-29 20:06:30', '2024-12-24 08:24:46');
INSERT INTO `adms_nivacs_pgs` VALUES (1983, 2, 136, 2, 2, 4, 2, 233, '2022-09-29 20:06:30', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1984, 1, 127, 2, 2, 4, 13, 233, '2022-09-29 20:06:30', '2022-09-29 20:06:44');
INSERT INTO `adms_nivacs_pgs` VALUES (1985, 2, 97, 2, 2, 4, 15, 233, '2022-09-29 20:06:30', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1986, 1, 175, 2, 2, 4, 1, 234, '2022-09-29 22:40:23', '2024-12-24 08:24:43');
INSERT INTO `adms_nivacs_pgs` VALUES (1987, 2, 137, 2, 2, 489, 2, 234, '2022-09-29 22:40:23', '2025-01-17 10:30:18');
INSERT INTO `adms_nivacs_pgs` VALUES (1988, 2, 128, 2, 2, 4, 13, 234, '2022-09-29 22:40:23', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1989, 2, 98, 2, 2, 4, 15, 234, '2022-09-29 22:40:23', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1990, 1, 151, 1, 1, 42, 1, 235, '2024-12-23 19:33:21', '2025-01-10 13:24:30');
INSERT INTO `adms_nivacs_pgs` VALUES (1991, 1, 138, 1, 1, 42, 2, 235, '2024-12-23 19:33:21', '2025-01-09 15:54:46');
INSERT INTO `adms_nivacs_pgs` VALUES (1992, 1, 129, 1, 1, 42, 13, 235, '2024-12-23 19:33:21', '2025-01-10 19:18:30');
INSERT INTO `adms_nivacs_pgs` VALUES (1993, 2, 99, 2, 2, 4, 15, 235, '2024-12-23 19:33:21', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1994, 1, 176, 2, 1, 491, 1, 236, '2024-12-25 14:52:10', '2024-12-25 14:54:20');
INSERT INTO `adms_nivacs_pgs` VALUES (1995, 1, 139, 2, 1, 491, 2, 236, '2024-12-25 14:52:10', '2025-01-17 10:41:18');
INSERT INTO `adms_nivacs_pgs` VALUES (1996, 1, 130, 2, 1, 491, 13, 236, '2024-12-25 14:52:10', '2025-01-10 19:42:16');
INSERT INTO `adms_nivacs_pgs` VALUES (1997, 2, 100, 2, 2, 4, 15, 236, '2024-12-25 14:52:10', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1998, 1, 177, 1, 1, 48, 1, 237, '2025-01-06 09:02:50', '2025-01-06 09:04:21');
INSERT INTO `adms_nivacs_pgs` VALUES (1999, 2, 140, 2, 2, 4, 2, 237, '2025-01-06 09:02:50', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (2000, 2, 131, 2, 2, 4, 13, 237, '2025-01-06 09:02:50', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (2001, 2, 101, 2, 2, 4, 15, 237, '2025-01-06 09:02:50', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (2002, 1, 178, 1, 1, 48, 1, 238, '2025-01-06 21:35:50', '2025-01-06 21:36:38');
INSERT INTO `adms_nivacs_pgs` VALUES (2003, 2, 141, 2, 2, 4, 2, 238, '2025-01-06 21:35:50', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (2004, 2, 132, 2, 2, 4, 13, 238, '2025-01-06 21:35:50', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (2005, 2, 102, 2, 2, 4, 15, 238, '2025-01-06 21:35:50', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (2006, 1, 179, 1, 1, 48, 1, 239, '2025-01-07 10:23:14', '2025-01-07 10:23:46');
INSERT INTO `adms_nivacs_pgs` VALUES (2007, 1, 142, 1, 1, 48, 2, 239, '2025-01-07 10:23:14', '2025-01-09 15:53:23');
INSERT INTO `adms_nivacs_pgs` VALUES (2008, 1, 133, 2, 2, 4, 13, 239, '2025-01-07 10:23:14', '2025-01-10 19:17:59');
INSERT INTO `adms_nivacs_pgs` VALUES (2009, 2, 103, 2, 2, 4, 15, 239, '2025-01-07 10:23:14', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (2010, 1, 180, 1, 1, 42, 1, 240, '2025-01-10 09:21:15', '2025-01-10 09:22:52');
INSERT INTO `adms_nivacs_pgs` VALUES (2011, 1, 143, 1, 1, 42, 2, 240, '2025-01-10 09:21:15', '2025-01-17 10:29:22');
INSERT INTO `adms_nivacs_pgs` VALUES (2012, 1, 134, 1, 1, 42, 13, 240, '2025-01-10 09:21:15', '2025-01-10 19:17:58');
INSERT INTO `adms_nivacs_pgs` VALUES (2013, 2, 104, 2, 2, 4, 15, 240, '2025-01-10 09:21:15', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (2014, 1, 181, 1, 1, 42, 1, 241, '2025-01-10 09:22:22', '2025-01-10 09:22:43');
INSERT INTO `adms_nivacs_pgs` VALUES (2015, 1, 144, 1, 1, 42, 2, 241, '2025-01-10 09:22:22', '2025-01-17 10:38:18');
INSERT INTO `adms_nivacs_pgs` VALUES (2016, 1, 135, 1, 1, 42, 13, 241, '2025-01-10 09:22:22', '2025-01-10 19:17:50');
INSERT INTO `adms_nivacs_pgs` VALUES (2017, 2, 105, 2, 2, 4, 15, 241, '2025-01-10 09:22:22', NULL);

-- ----------------------------
-- Table structure for adms_niveis_acessos
-- ----------------------------
DROP TABLE IF EXISTS `adms_niveis_acessos`;
CREATE TABLE `adms_niveis_acessos`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ordem` int NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 16 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of adms_niveis_acessos
-- ----------------------------
INSERT INTO `adms_niveis_acessos` VALUES (1, 'Super Administrador', 1, '2018-05-23 00:00:00', '2018-06-20 19:16:20');
INSERT INTO `adms_niveis_acessos` VALUES (2, 'Administrador', 2, '2018-05-23 00:00:00', '2021-02-16 08:57:30');
INSERT INTO `adms_niveis_acessos` VALUES (15, 'Paciente', 6, '2022-06-20 11:21:34', NULL);
INSERT INTO `adms_niveis_acessos` VALUES (13, 'Médico', 5, '2021-03-16 13:13:17', '2022-09-22 11:14:53');

-- ----------------------------
-- Table structure for adms_paginas
-- ----------------------------
DROP TABLE IF EXISTS `adms_paginas`;
CREATE TABLE `adms_paginas`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `controller` varchar(220) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `metodo` varchar(220) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `menu_controller` varchar(220) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `menu_metodo` varchar(220) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `nome_pagina` varchar(220) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `obs` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `lib_pub` int NOT NULL DEFAULT 2,
  `icone` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `adms_grps_pg_id` int NOT NULL,
  `adms_tps_pg_id` int NOT NULL,
  `adms_sits_pg_id` int NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 242 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of adms_paginas
-- ----------------------------
INSERT INTO `adms_paginas` VALUES (1, 'Home', 'index', 'home', 'index', 'Dashboard', 'PÃ¡gina inicial do sistema administrativo             ', 2, 'fas fa-tachometer-alt', 1, 1, 1, '2018-05-23 00:00:00', '2018-06-25 11:27:06');
INSERT INTO `adms_paginas` VALUES (2, 'Usuarios', 'listar', 'usuarios', 'listar', 'Usuários', 'Pagina para listar os usuÃ¡rios                                ', 2, 'fas fa-users', 1, 1, 1, '2018-05-23 00:00:00', '2019-01-28 14:38:21');
INSERT INTO `adms_paginas` VALUES (3, 'Login', 'acesso', 'login', 'acesso', 'Acesso', 'PÃ¡gina de login                ', 1, '', 7, 1, 1, '2018-05-23 00:00:00', '2018-06-25 11:29:15');
INSERT INTO `adms_paginas` VALUES (4, 'Login', 'logout', 'login', 'logout', 'Sair ', 'PÃ¡gina para sair do administrativo                                                ', 1, '', 7, 1, 1, '2018-05-23 00:00:00', '2021-01-20 20:09:52');
INSERT INTO `adms_paginas` VALUES (5, 'NovoUsuario', 'novoUsuario', 'novo-usuario', 'novo-usuario', 'Novo Usuário', 'PÃ¡gina para cadastrar novo usuÃ¡rio na pagina de login                                                ', 1, '', 2, 1, 1, '2018-05-23 00:00:00', '2018-06-25 11:29:38');
INSERT INTO `adms_paginas` VALUES (6, 'Confirmar', 'confirmarEmail', 'confirmar', 'confirmar-email', 'Confirmar e-mail', 'PÃ¡gina para confirmar e-mail                ', 1, '', 7, 1, 1, '2018-06-23 00:00:00', '2018-06-25 11:29:56');
INSERT INTO `adms_paginas` VALUES (7, 'EsqueceuSenha', 'esqueceuSenha', 'esqueceu-senha', 'esqueceu-senha', 'Esqueceu a senha', 'PÃ¡gina para recuperar a senha                ', 1, '', 7, 1, 1, '2018-06-23 00:00:00', '2018-06-25 11:30:08');
INSERT INTO `adms_paginas` VALUES (8, 'AtualSenha', 'atualSenha', 'atual-senha', 'atual-senha', 'Atualizar a senha', 'PÃ¡gina para atualizar a senha                ', 1, '', 7, 1, 1, '2018-06-23 00:00:00', '2018-06-25 11:30:22');
INSERT INTO `adms_paginas` VALUES (9, 'VerPerfil', 'perfil', 'ver-perfil', 'perfil', 'Ver Perfil', 'PÃ¡gina para o usuÃ¡rio ver o seu perfil                ', 2, '', 5, 1, 1, '2018-06-23 00:00:00', '2018-06-25 11:33:03');
INSERT INTO `adms_paginas` VALUES (10, 'AlterarSenha', 'altSenha', 'alterar-senha', 'alt-senha', 'Alterar Senha', 'PÃ¡gina para o prÃ³prio usuÃ¡rio alterar a sua senha                ', 2, '', 3, 1, 1, '2018-06-23 00:00:00', '2018-06-25 11:32:45');
INSERT INTO `adms_paginas` VALUES (11, 'EditarPerfil', 'altPerfil', 'editar-perfil', 'alt-perfil', 'Editar Perfil', 'PÃ¡gina para o prÃ³prio usuÃ¡rio editar os dados do seu perfil                ', 2, '', 3, 1, 1, '2018-06-23 00:00:00', '2018-06-25 11:33:41');
INSERT INTO `adms_paginas` VALUES (12, 'VerUsuario', 'verUsuario', 'ver-usuario', 'ver-usuario', 'Ver Usuário', 'PÃ¡gina para ver detalhes do usuÃ¡rio                ', 2, '', 5, 1, 1, '2018-06-23 00:00:00', '2018-06-25 11:31:52');
INSERT INTO `adms_paginas` VALUES (13, 'EditarSenha', 'editSenha', 'editar-senha', 'edit-senha', 'Editar Senha', 'PÃ¡gina para o administrador altera a senha do usuÃ¡rio.                ', 2, '', 3, 1, 1, '2018-06-23 00:00:00', '2018-06-25 11:31:09');
INSERT INTO `adms_paginas` VALUES (14, 'EditarUsuario', 'editUsuario', 'editar-usuario', 'edit-usuario', 'Editar Usuário', 'PÃ¡gina para editar os dados do usuÃ¡rio                ', 2, '', 3, 1, 1, '2018-06-23 00:00:00', '2018-06-25 11:31:33');
INSERT INTO `adms_paginas` VALUES (15, 'CadastrarUsuario', 'cadUsuario', 'cadastrar-usuario', 'cad-usuario', 'Cadastrar Usuário', 'PÃ¡gina para cadastrar novo usuÃ¡rio                ', 2, '', 2, 1, 1, '2018-06-23 00:00:00', '2018-06-25 11:34:31');
INSERT INTO `adms_paginas` VALUES (16, 'ApagarUsuario', 'apagarUsuario', 'apagar-usuario', 'apagar-usuario', 'Apagar Usuário', 'PÃ¡gina para apagar usuÃ¡rio                ', 2, '', 4, 1, 1, '2018-06-23 00:00:00', '2018-06-25 11:34:49');
INSERT INTO `adms_paginas` VALUES (17, 'NivelAcesso', 'listar', 'nivel-acesso', 'listar', 'Nível de Acesso', 'PÃ¡gina para listar nÃ­vel de acesso                ', 2, 'fas fa-key', 1, 1, 1, '2018-06-23 00:00:00', '2018-06-25 11:35:16');
INSERT INTO `adms_paginas` VALUES (18, 'CadastrarNivAc', 'cadNivAc', 'cadastrar-niv-ac', 'cad-niv-ac', 'Cadastrar Nível de Acesso', 'PÃ¡gina para cadastrar nÃ­vel de acesso                ', 2, '', 2, 1, 1, '2018-06-23 00:00:00', '2018-06-25 11:35:40');
INSERT INTO `adms_paginas` VALUES (19, 'VerNivAc', 'VerNivAc', 'ver-niv-ac', 'ver-niv-ac', 'Detalhes do Nível de Acesso', 'PÃ¡gina para ver detalhes do nÃ­vel de acesso                ', 2, '', 5, 1, 1, '2018-06-23 00:00:00', '2018-06-25 11:36:05');
INSERT INTO `adms_paginas` VALUES (20, 'EditarNivAc', 'editNivAc', 'editar-niv-ac', 'edit-niv-ac', 'Editar Nível de Acesso', 'PÃ¡gina para editar nÃ­vel de acesso                ', 2, '', 3, 1, 1, '2018-06-23 00:00:00', '2018-06-25 11:36:30');
INSERT INTO `adms_paginas` VALUES (21, 'ApagarNivAc', 'apagarNivAc', 'apagar-niv-ac', 'apagar-niv-ac', 'Apagar Nível de Acesso', 'PÃ¡gina para apagar nÃ­vel de acesso                ', 2, '', 4, 1, 1, '2018-06-23 00:00:00', '2018-06-25 11:36:56');
INSERT INTO `adms_paginas` VALUES (22, 'AltOrdemNivAc', 'altOrdemNivAc', 'alt-ordem-niv-ac', 'alt-ordem-niv-ac', 'Alterar ordem nível de acesso', 'PÃ¡gina para alterar ordem do nÃ­vel de acesso                ', 2, '', 8, 1, 1, '2018-06-23 00:00:00', '2018-06-25 11:37:24');
INSERT INTO `adms_paginas` VALUES (23, 'Pagina', 'listar', 'pagina', 'listar', 'Listar Páginas', 'PÃ¡gina para listar as paginas do administrativo                ', 2, 'fas fa-file-alt', 1, 1, 1, '2018-06-23 00:00:00', '2018-06-25 11:37:43');
INSERT INTO `adms_paginas` VALUES (24, 'CadastrarPagina', 'cadPagina', 'cadastrar-pagina', 'cad-pagina', 'Cadastrar Pagina', 'FormulÃ¡rio para cadastrar pagina                ', 2, '', 2, 1, 1, '2018-06-23 00:00:00', '2018-06-25 11:37:59');
INSERT INTO `adms_paginas` VALUES (25, 'VerPagina', 'verPagina', 'ver-pagina', 'ver-pagina', 'Visualizar Página', 'PÃ¡gina para ver detalhes da pÃ¡gina', 2, '', 5, 1, 1, '2018-06-22 14:25:21', NULL);
INSERT INTO `adms_paginas` VALUES (26, 'EditarPagina', 'editPagina', 'editar-pagina', 'edit-pagina', 'Editar Página', 'FormulÃ¡rio para editar a pÃ¡gina                                                                                ', 2, '', 3, 1, 1, '2018-06-22 14:43:47', '2018-06-22 15:40:01');
INSERT INTO `adms_paginas` VALUES (27, 'ApagarPagina', 'apagarPagina', 'apagar-pagina', 'apagar-pagina', 'Apagar Página', 'PÃ¡gina para apagar pÃ¡gina                ', 2, '', 4, 1, 1, '2018-06-22 19:17:43', NULL);
INSERT INTO `adms_paginas` VALUES (28, 'Permissoes', 'listar', 'permissoes', 'listar', 'Permissão', 'PÃ¡gina para listar as permissÃµes do nÃ­vel de acesso                ', 2, '', 1, 1, 1, '2018-06-24 11:59:53', NULL);
INSERT INTO `adms_paginas` VALUES (29, 'LibPermi', 'libPermi', 'lib-permi', 'lib-permi', 'Liberar Permissão', 'PÃ¡gina para liberar permissÃ£o                                ', 2, '', 3, 1, 1, '2018-06-24 12:52:42', '2018-06-24 12:54:14');
INSERT INTO `adms_paginas` VALUES (30, 'LibMenu', 'libMenu', 'lib-menu', 'lib-menu', 'Liberar no menu', 'PÃ¡gina para liberar ou bloquear a pÃ¡gina no menu                ', 2, '', 3, 1, 1, '2018-06-25 09:48:29', NULL);
INSERT INTO `adms_paginas` VALUES (31, 'LibDropdown', 'libDropdown', 'lib-dropdown', 'lib-dropdown', 'Liberar Dropdown', 'PÃ¡gina para liberar ou bloquear a pÃ¡gina a ser apresentado como dropdown no menu                ', 2, '', 3, 1, 1, '2018-06-25 10:24:39', '2018-06-25 10:29:10');
INSERT INTO `adms_paginas` VALUES (32, 'AltOrdemMenu', 'altOrdemMenu', 'alt-ordem-menu', 'alt-ordem-menu', 'Alterar Ordem Menu', 'PÃ¡gina para alterar a ordem das pÃ¡ginas no menu                ', 2, '', 3, 1, 1, '2018-06-25 10:56:36', NULL);
INSERT INTO `adms_paginas` VALUES (33, 'SincroPgNivAc', 'sincroPgNivAc', 'sincro-pg-niv-ac', 'sincro-pg-niv-ac', 'Sincronizar Permissões', 'PÃ¡gina para sincronizar as permissÃµes de acesso a cada nÃ­vel de acesso para as pÃ¡ginas do sistema.                ', 2, '', 3, 1, 1, '2018-06-26 12:23:37', NULL);
INSERT INTO `adms_paginas` VALUES (34, 'EditarNivAcPgMenu', 'editNivAcPgMenu', 'editar-niv-ac-pg-menu', 'edit-niv-ac-pg-menu', 'Editar Item de Menu da Página', 'FormulÃ¡rio para editar o item de menu que a pÃ¡gina pertence para um determinado nÃ­vel de acesso', 2, '', 3, 1, 1, '2018-06-28 16:11:35', NULL);
INSERT INTO `adms_paginas` VALUES (35, 'Menu', 'listar', 'menu', 'listar', 'Itens de Menu', 'Listar os itens do menu', 2, 'fab fa-elementor', 1, 1, 1, '2018-06-28 01:05:34', NULL);
INSERT INTO `adms_paginas` VALUES (36, 'CadastrarMenu', 'cadMenu', 'cadastrar-menu', 'cad-menu', 'Cadastrar Item de Menu', 'FormulÃ¡rio para cadastrar item de menu', 2, '', 2, 1, 1, '2018-06-28 01:20:26', NULL);
INSERT INTO `adms_paginas` VALUES (37, 'VerMenu', 'verMenu', 'ver-menu', 'ver-menu', 'Ver item de menu', 'PÃ¡gina para ver detalhes do item de menu', 2, '', 5, 1, 1, '2018-06-28 01:23:25', NULL);
INSERT INTO `adms_paginas` VALUES (38, 'EditarMenu', 'editMenu', 'editar-menu', 'edit-menu', 'Editar item de menu', 'FormulÃ¡rio para editar o item de menu', 2, '', 3, 1, 1, '2018-06-28 01:32:29', NULL);
INSERT INTO `adms_paginas` VALUES (39, 'ApagarMenu', 'apagarMenu', 'apagar-menu', 'apagar-menu', 'Apagar Item de Menu', 'PÃ¡gina para apagar item de menu', 2, '', 4, 1, 1, '2018-06-28 01:44:13', NULL);
INSERT INTO `adms_paginas` VALUES (40, 'AltOrdemItemMenu', 'altOrdemItemMenu', 'alt-ordem-item-menu', 'alt-ordem-item-menu', 'Alterar Ordem Item de Menu', 'PÃ¡gina para alterar a ordem do itens no menu', 2, '', 8, 1, 1, '2018-06-28 01:58:16', NULL);
INSERT INTO `adms_paginas` VALUES (41, 'EditarFormCadUsuario', 'editFormCadUsuario', 'editar-form-cad-usuario', 'edit-form-cad-usuario', 'Cadastro de Login', 'FormulÃ¡rio para editar as informaÃ§Ãµes do formulÃ¡rio cadastrar usuÃ¡rio na pÃ¡gina de login                ', 2, 'fas fa-edit', 3, 1, 1, '2018-06-29 18:33:56', '2018-06-29 18:35:03');
INSERT INTO `adms_paginas` VALUES (42, 'EditarConfEmail', 'editConfEmail', 'editar-conf-email', 'edit-conf-email', 'Configuração de E-mail', 'FormulÃ¡rio para editar as configuraÃ§Ã£o do servidor de envio de e-mail', 2, 'fas fa-at', 2, 1, 1, '2018-06-29 18:56:15', NULL);
INSERT INTO `adms_paginas` VALUES (43, 'Cor', 'listar', 'cor', 'listar', 'Cores', 'Listar as cores dos botÃµes                                                                                ', 2, 'fas fa-tint', 1, 1, 1, '2018-06-29 19:32:21', '2018-06-29 19:45:56');
INSERT INTO `adms_paginas` VALUES (44, 'VerCor', 'verCor', 'ver-cor', 'ver-cor', 'Ver Cores', 'PÃ¡gina para ver detalhes da cor do botÃ£o', 2, '', 5, 1, 1, '2018-06-29 19:50:19', NULL);
INSERT INTO `adms_paginas` VALUES (45, 'EditarCor', 'editCor', 'editar-cor', 'edit-cor', 'Editar a Cor', 'FormulÃ¡rio para editar as cores dos botÃµes', 2, '', 3, 1, 1, '2018-06-29 19:59:53', NULL);
INSERT INTO `adms_paginas` VALUES (46, 'CadastrarCor', 'cadCor', 'cadastrar-cor', 'cad-cor', 'Cadastrar Cor', 'FormulÃ¡rio para cadastrar a cor do botÃ£o', 2, '', 2, 1, 1, '2018-06-29 20:09:35', NULL);
INSERT INTO `adms_paginas` VALUES (47, 'ApagarCor', 'apagarCor', 'apagar-cor', 'apagar-cor', 'Apagar a Cor', 'PÃ¡gina para apagar a cor do botÃ£o', 2, '', 4, 1, 1, '2018-06-29 20:17:36', NULL);
INSERT INTO `adms_paginas` VALUES (48, 'GrupoPg', 'listar', 'grupo-pg', 'listar', 'Grupo de Página', 'Listar os grupos das pÃ¡ginas', 2, 'fas fa-file-alt', 1, 1, 1, '2018-06-29 20:29:31', NULL);
INSERT INTO `adms_paginas` VALUES (49, 'VerGrupoPg', 'verGrupoPg', 'ver-grupo-pg', 'ver-grupo-pg', 'Ver Grupo de Página', 'PÃ¡gina para ver detalhes do grupo de pÃ¡gina', 2, '', 5, 1, 1, '2018-06-29 20:40:11', NULL);
INSERT INTO `adms_paginas` VALUES (50, 'CadastrarGrupoPg', 'cadGrupoPg', 'cadastrar-grupo-pg', 'cad-grupo-pg', 'Cadastro Grupo de Página', 'FormulÃ¡rio para cadastrar novo grupo de pÃ¡gina', 2, '', 2, 1, 1, '2018-06-29 20:58:30', NULL);
INSERT INTO `adms_paginas` VALUES (51, 'EditarGrupoPg', 'editGrupoPg', 'editar-grupo-pg', 'edit-grupo-pg', 'Editar grupo de pág.', 'FormulÃ¡rio para editar os dados do grupo de pÃ¡gina                ', 2, '', 3, 1, 1, '2018-06-29 21:08:41', '2019-06-27 16:09:34');
INSERT INTO `adms_paginas` VALUES (52, 'ApagarGrupoPg', 'apagarGrupoPg', 'apagar-grupo-pg', 'apagar-grupo-pg', 'Apagar grupo de pág.', 'PÃ¡gina para apagar grupo de pÃ¡gina                ', 2, '', 4, 1, 1, '2018-06-29 21:19:33', '2019-06-27 16:09:04');
INSERT INTO `adms_paginas` VALUES (53, 'AltOrdemGrupoPg', 'altOrdemGrupoPg', 'alt-ordem-grupo-pg', 'alt-ordem-grupo-pg', 'Alterar ordem grupo pág.', 'Altera a ordem do grupo de pÃ¡gina                ', 2, '', 8, 1, 1, '2018-06-29 21:31:23', '2019-06-27 16:08:36');
INSERT INTO `adms_paginas` VALUES (54, 'TipoPg', 'listar', 'tipo-pg', 'listar', 'Tipo de página', 'Listar os tipos de pÃ¡ginas                ', 2, 'fas fa-list-ol', 1, 1, 1, '2018-06-29 21:40:39', '2019-06-27 16:08:02');
INSERT INTO `adms_paginas` VALUES (55, 'CadastrarTipoPg', 'cadTipoPg', 'cadastrar-tipo-pg', 'cad-tipo-pg', 'Cadastrar tipo de página', 'FormulÃ¡rio para cadastrar o tipo de pÃ¡gina                ', 2, '', 2, 1, 1, '2018-06-29 21:50:13', '2019-06-27 16:07:40');
INSERT INTO `adms_paginas` VALUES (56, 'EditarTipoPg', 'editTipoPg', 'editar-tipo-pg', 'edit-tipo-pg', 'Editar tipo de página', 'FormulÃ¡rio para editar o tipo de pÃ¡gina                ', 2, '', 3, 1, 1, '2018-06-29 22:13:11', '2019-06-27 16:06:17');
INSERT INTO `adms_paginas` VALUES (57, 'VerTipoPg', 'verTipoPg', 'ver-tipo-pg', 'ver-tipo-pg', 'Ver tipo de página', 'PÃ¡gina para ver detalhes do tipo de pÃ¡gina                ', 2, '', 5, 1, 1, '2018-06-29 22:21:25', '2019-06-27 16:00:38');
INSERT INTO `adms_paginas` VALUES (58, 'ApagarTipoPg', 'apagarTipoPg', 'apagar-tipo-pg', 'apagar-tipo-pg', 'Apagar tipo de página', 'PÃ¡gina para apagar o tipo de pÃ¡gina                ', 2, '', 4, 1, 1, '2018-06-29 22:26:52', '2019-06-27 15:59:53');
INSERT INTO `adms_paginas` VALUES (59, 'AltOrdemTipoPg', 'altOrdemTipoPg', 'alt-ordem-tipo-pg', 'alt-ordem-tipo-pg', 'Alterar ordem tipo página', 'PÃ¡gina para alterar a ordem do tipo de pÃ¡ginas                                                        ', 2, '', 8, 1, 1, '2018-06-29 22:38:00', '2019-06-27 16:06:55');
INSERT INTO `adms_paginas` VALUES (60, 'Situacao', 'listar', 'situacao', 'listar', 'Situação', 'PÃ¡gina para listar as situaÃ§Ãµes                ', 2, 'fas fa-exclamation-triangle', 1, 1, 1, '2018-06-29 22:48:28', '2018-06-29 22:53:17');
INSERT INTO `adms_paginas` VALUES (61, 'VerSit', 'verSit', 'ver-sit', 'ver-sit', 'Ver situação', 'PÃ¡gina para ver detalhes da situaÃ§Ã£o                ', 2, '', 5, 1, 1, '2018-06-29 23:04:17', '2019-06-27 15:58:32');
INSERT INTO `adms_paginas` VALUES (62, 'CadastrarSit', 'cadSit', 'cadastrar-sit', 'cad-sit', 'Cadastrar situação', 'FormulÃ¡rio para cadastrar situaÃ§Ã£o                ', 2, '', 2, 1, 1, '2018-06-29 23:11:35', '2019-06-27 15:58:09');
INSERT INTO `adms_paginas` VALUES (63, 'EditarSit', 'editSit', 'editar-sit', 'edit-sit', 'Editar a situação', 'FormulÃ¡rio para editar a situaÃ§Ã£o', 2, '', 3, 1, 1, '2018-06-29 23:20:52', NULL);
INSERT INTO `adms_paginas` VALUES (64, 'ApagarSit', 'apagarSit', 'apagar-sit', 'apagar-sit', 'Apagar situação', 'PÃ¡gina para apagar situaÃ§Ã£o                ', 2, '', 3, 1, 1, '2018-06-29 23:27:34', '2019-06-27 15:57:48');
INSERT INTO `adms_paginas` VALUES (65, 'SituacaoUser', 'listar', 'situacao-user', 'listar', 'Situação dos usuários', 'Listar as situaÃ§Ã£o de usuÃ¡rio                                ', 2, 'far fa-id-badge', 1, 1, 1, '2018-06-29 23:44:50', '2019-06-27 15:57:24');
INSERT INTO `adms_paginas` VALUES (66, 'VerSitUser', 'verSitUser', 'ver-sit-user', 'ver-sit-user', 'Ver situação de usuário', 'PÃ¡gina para ver detalhes da situaÃ§Ã£o de usuÃ¡rio                ', 2, '', 5, 1, 1, '2018-06-29 23:53:53', '2019-06-27 15:57:00');
INSERT INTO `adms_paginas` VALUES (67, 'CadastrarSitUser', 'cadSitUser', 'cadastrar-sit-user', 'cad-sit-user', 'Cadastrar situação de usuário', 'PÃ¡gina para cadastrar situaÃ§Ã£o de usuÃ¡rio                ', 2, '', 2, 1, 1, '2018-06-29 23:57:43', '2019-06-27 15:56:22');
INSERT INTO `adms_paginas` VALUES (68, 'EditarSitUser', 'editSitUser', 'editar-sit-user', 'edit-sit-user', 'Editar situação de usuário', 'FormulÃ¡rio para editar situaÃ§Ã£o de usuÃ¡rio                ', 2, '', 3, 1, 1, '2018-06-30 00:03:44', '2019-06-27 15:55:59');
INSERT INTO `adms_paginas` VALUES (69, 'ApagarSitUser', 'apagarSitUser', 'apagar-sit-user', 'apagar-sit-user', 'Apagar situação de usuário', 'PÃ¡gina para apagar situaÃ§Ã£o de usuÃ¡rio                ', 2, '', 4, 1, 1, '2018-06-30 00:09:08', '2019-06-27 15:55:37');
INSERT INTO `adms_paginas` VALUES (70, 'SituacaoPg', 'listar', 'situacao-pg', 'listar', 'Situação de página', 'Listar as situaÃ§Ãµes de pÃ¡ginas                                                ', 2, 'fas fa-exclamation', 1, 1, 1, '2018-06-30 00:22:52', '2019-06-27 15:55:19');
INSERT INTO `adms_paginas` VALUES (71, 'VerSitPg', 'verSitPg', 'ver-sit-pg', 'ver-sit-pg', 'Ver situação de página', 'PÃ¡gina para ver detalhes da situaÃ§Ã£o de pÃ¡gina                      ', 2, '', 5, 1, 1, '2018-06-30 00:35:47', '2019-06-27 15:53:02');
INSERT INTO `adms_paginas` VALUES (72, 'CadastrarSitPg', 'cadSitPg', 'cadastrar-sit-pg', 'cad-sit-pg', 'Cadastrar situação de página', 'FormulÃ¡rio para cadastrar situaÃ§Ã£o de pÃ¡gina                ', 2, '', 2, 1, 1, '2018-06-30 00:41:58', '2019-06-27 15:52:37');
INSERT INTO `adms_paginas` VALUES (73, 'EditarSitPg', 'editSitPg', 'editar-sit-pg', 'edit-sit-pg', 'Editar situação de página', 'FormulÃ¡rio para editar situaÃ§Ã£o de pÃ¡gina                ', 2, '', 3, 1, 1, '2018-06-30 00:47:33', '2018-06-30 00:47:57');
INSERT INTO `adms_paginas` VALUES (74, 'ApagarSitPg', 'apagarSitPg', 'apagar-sit-pg', 'apagar-sit-pg', 'Apagar situação de página', 'PÃ¡gina para apagar situaÃ§Ã£o de pÃ¡gina                ', 2, '', 4, 1, 1, '2018-06-30 00:53:21', '2019-06-27 15:52:09');
INSERT INTO `adms_paginas` VALUES (211, 'controlePaciente', 'registarPaciente', 'controlePaciente', 'registarPaciente', 'Registar Paciente', '                ok', 1, 'fas fa-user', 2, 1, 1, '2022-03-07 01:49:33', NULL);
INSERT INTO `adms_paginas` VALUES (212, 'controlePaciente', 'registarUnidadeHospitalar', 'controlePaciente', 'registarUnidadeHospitalar', 'Registar Unidade Hospitalar', '                ok', 1, 'fas fa-edit', 2, 1, 1, '2022-04-11 14:59:44', NULL);
INSERT INTO `adms_paginas` VALUES (213, 'controlePaciente', 'registarTipoUnidadeHospitalar', 'controlePaciente', 'registarTipoUnidadeHospitalar', 'Registar Tipo de Unidade Hospitalar  ', 'ok                ', 1, 'fas fa-edit', 2, 1, 1, '2022-04-11 15:56:16', NULL);
INSERT INTO `adms_paginas` VALUES (214, 'controlePaciente', 'registarEspecialidade', 'controlePaciente', 'registarEspecialidade', 'Registar Especialidade', '                ok', 1, 'fas fa-edit', 2, 1, 1, '2022-04-11 16:28:21', NULL);
INSERT INTO `adms_paginas` VALUES (215, 'controleConsulta', 'listAgendamento', 'controleConsulta', 'listAgendamento', 'Marcar Consulta', 'ok                                ', 1, 'fas fa-edit', 2, 1, 1, '2022-04-14 10:00:13', '2022-09-21 09:36:25');
INSERT INTO `adms_paginas` VALUES (216, 'controleConsulta', 'registarAgendamento', 'controleConsulta', 'registarAgendamento', 'Agendar Consulta', '                ok                                ', 1, 'fas fa-edit', 2, 1, 1, '2022-06-09 10:39:21', '2022-06-09 12:00:48');
INSERT INTO `adms_paginas` VALUES (217, 'controleConsulta', 'remarcConsulta', 'controleConsulta', 'marcConsulta', 'Remarcar consulta', 'ok                                                ', 1, '', 2, 1, 1, '2022-06-09 12:23:43', '2022-06-28 08:24:24');
INSERT INTO `adms_paginas` VALUES (218, 'controleConsulta', 'listMarcacao', 'controleConsulta', 'listMarcacao', 'Listar Marcações', 'ok                                ', 1, 'fas fa-list', 2, 1, 1, '2022-06-13 18:25:28', '2022-06-13 18:26:25');
INSERT INTO `adms_paginas` VALUES (219, 'controlePaciente', 'atribEspUH', 'controlePaciente', 'atribEspUH', 'Atribuir Especialidade', 'ok                ', 1, 'fas fa-edit', 2, 1, 1, '2022-06-13 18:55:17', NULL);
INSERT INTO `adms_paginas` VALUES (220, 'controleConsulta', 'listAgendamento', 'controleConsulta', 'listAgendamento', 'Listar Agendamentos', '      ok          ', 1, 'fas fa-list', 1, 1, 1, '2022-06-14 11:20:40', NULL);
INSERT INTO `adms_paginas` VALUES (221, 'controleConsulta', 'cancelarConsulta', 'controleConsulta', 'cancelarConsulta', 'Cancelar Consulta', 'ok                ', 1, 'fas fa-edit', 3, 1, 1, '2022-06-27 11:51:54', NULL);
INSERT INTO `adms_paginas` VALUES (222, 'controleConsulta', 'relatorioConsulta', 'controleConsulta', 'relatorioConsulta', 'Relatório de consultas', ' ok               ', 1, 'fas fa-list', 1, 1, 1, '2022-07-06 09:51:29', NULL);
INSERT INTO `adms_paginas` VALUES (223, 'ControllerRequisicao', 'ReciveRequest', 'ControllerRequisicao', 'ReciveRequest', 'Request', 'Incoming request', 1, '-', 6, 1, 1, '2022-07-06 11:03:59', NULL);
INSERT INTO `adms_paginas` VALUES (224, 'controleConsulta', 'estatisticaConsultas', 'controleConsulta', 'estatisticaConsultas', 'Estatística de consultas', '                ok                                                ', 1, 'fas fa-list', 1, 1, 1, '2022-07-17 17:46:26', '2022-07-17 17:49:47');
INSERT INTO `adms_paginas` VALUES (225, 'Login', 'registo_fora', 'Login', 'registo_fora', 'registo_fora', '                pagina que permite registar usuario desde fora', 1, '-', 2, 1, 1, '2022-09-13 12:49:54', NULL);
INSERT INTO `adms_paginas` VALUES (226, 'Login', 'registar_out', 'Login', 'registar_out', 'Registar_out', 'Registar fora', 1, NULL, 0, 0, 0, '0000-00-00 00:00:00', NULL);
INSERT INTO `adms_paginas` VALUES (227, 'Login', 'registar_out', 'Login', 'registar_out', 'Registar_out', 'Registar fora', 1, NULL, 7, 1, 1, '2022-09-19 09:21:36', NULL);
INSERT INTO `adms_paginas` VALUES (228, 'controleConsulta', 'listMarcacaoMedico', 'controleConsulta', 'listMarcacaoMedico', 'As minhas consultas', '               ok                 ', 1, 'fas fa-list', 1, 1, 1, '2022-09-23 18:18:31', '2022-09-29 19:33:41');
INSERT INTO `adms_paginas` VALUES (229, 'Usuarios', 'listarUh', 'Usuarios', 'listarUh', 'Registar usuário médico', '       ok                                         ', 1, 'fas fa-edit', 2, 1, 1, '2022-09-27 13:23:12', '2022-09-27 13:28:23');
INSERT INTO `adms_paginas` VALUES (230, 'controleConsulta', 'listMarcacaoUH', 'controleConsulta', 'listMarcacaoUH', 'Consultas marcadas', ' ok               ', 1, 'fas fa-list', 1, 1, 1, '2022-09-28 08:27:40', NULL);
INSERT INTO `adms_paginas` VALUES (231, 'controleConsulta', 'listMarcacaoPaciente', 'controleConsulta', 'listMarcacaoPaciente', 'Consultas Marcadas', ' ok               ', 1, 'fas fa-list', 1, 1, 1, '2022-09-28 09:02:35', NULL);
INSERT INTO `adms_paginas` VALUES (232, 'controleConsulta', 'estatisticaMarcacaoUH', 'controleConsulta', 'estatisticaMarcacaoUH', 'Estatística de Consultas', 'ok                ', 1, 'fas fa-list', 1, 1, 1, '2022-09-29 09:17:20', NULL);
INSERT INTO `adms_paginas` VALUES (233, 'controleConsulta', 'confirmarPresenca', 'controleConsulta', 'confirmarPresenca', 'Confirmar presença', ' ok               ', 1, '-', 3, 1, 1, '2022-09-29 20:06:30', NULL);
INSERT INTO `adms_paginas` VALUES (234, 'controleConsulta', 'graficoEstatistico', 'controleConsulta', 'graficoEstatistico', 'Estatística por gráfico', '  ok              ', 1, 'fas fa-list', 5, 1, 1, '2022-09-29 22:40:23', NULL);
INSERT INTO `adms_paginas` VALUES (235, 'controleProduto', 'registarProduto', 'controleProduto', 'registarProduto', 'Registar Produto', 'Registar Produto                ', 1, 'fas fa-edit', 2, 1, 1, '2024-12-23 19:33:21', NULL);
INSERT INTO `adms_paginas` VALUES (236, 'controleVendas', 'registarVenda', 'controleVendas', 'registarVenda', 'Registar Venda', '   Registar Venda                                                             ', 1, 'fas fa-edit', 2, 1, 1, '2024-12-25 14:52:10', '2024-12-25 15:07:50');
INSERT INTO `adms_paginas` VALUES (239, 'controleVendas', 'relatVendas', 'controleVendas', 'relatVendas', 'Relatório das vendas', ' Relatório das vendas                            ', 1, 'fas fa-list', 1, 1, 1, '2025-01-07 10:23:14', '2025-01-07 10:25:03');
INSERT INTO `adms_paginas` VALUES (240, 'controllerAdministracao', 'registarFabricante', 'controllerAdministracao', 'registarFabricante', 'Registar Fabricante', 'Registo de fabricante                ', 1, 'fas fa-edit', 2, 1, 1, '2025-01-10 09:21:15', NULL);
INSERT INTO `adms_paginas` VALUES (241, 'controllerAdministracao', 'registarFornecedor', 'controllerAdministracao', 'registarFornecedor', 'Registar Fornecedor', '  Registar Fornecedor              ', 1, 'fas fa-edit', 2, 1, 1, '2025-01-10 09:22:22', NULL);

-- ----------------------------
-- Table structure for adms_sits
-- ----------------------------
DROP TABLE IF EXISTS `adms_sits`;
CREATE TABLE `adms_sits`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `adms_cor_id` int NULL DEFAULT NULL,
  `created` datetime NULL DEFAULT NULL,
  `modified` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of adms_sits
-- ----------------------------
INSERT INTO `adms_sits` VALUES (1, 'Ativo', 3, NULL, NULL);
INSERT INTO `adms_sits` VALUES (2, 'Inativo', 4, NULL, NULL);
INSERT INTO `adms_sits` VALUES (3, 'Analise', 5, NULL, NULL);

-- ----------------------------
-- Table structure for adms_sits_pgs
-- ----------------------------
DROP TABLE IF EXISTS `adms_sits_pgs`;
CREATE TABLE `adms_sits_pgs`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `cor` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of adms_sits_pgs
-- ----------------------------
INSERT INTO `adms_sits_pgs` VALUES (1, 'Ativo', 'success', '2018-03-23 00:00:00', NULL);
INSERT INTO `adms_sits_pgs` VALUES (2, 'Inativo', 'danger', '2018-03-23 00:00:00', NULL);
INSERT INTO `adms_sits_pgs` VALUES (3, 'Analise', 'primary', '2018-03-23 00:00:00', NULL);

-- ----------------------------
-- Table structure for adms_sits_usuarios
-- ----------------------------
DROP TABLE IF EXISTS `adms_sits_usuarios`;
CREATE TABLE `adms_sits_usuarios`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(220) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `adms_cor_id` int NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 8 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of adms_sits_usuarios
-- ----------------------------
INSERT INTO `adms_sits_usuarios` VALUES (1, 'Ativo', 3, '2018-05-23 00:00:00', NULL);
INSERT INTO `adms_sits_usuarios` VALUES (2, 'Inativo', 5, '2018-05-23 00:00:00', NULL);
INSERT INTO `adms_sits_usuarios` VALUES (3, 'Aguardando confirmação', 1, '2018-05-23 00:00:00', '2018-06-30 00:32:45');
INSERT INTO `adms_sits_usuarios` VALUES (4, 'Spam', 4, '2018-06-30 00:17:08', '2019-01-28 13:12:06');

-- ----------------------------
-- Table structure for adms_sitsold
-- ----------------------------
DROP TABLE IF EXISTS `adms_sitsold`;
CREATE TABLE `adms_sitsold`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `adms_cor_id` int NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of adms_sitsold
-- ----------------------------

-- ----------------------------
-- Table structure for adms_tps_pgs
-- ----------------------------
DROP TABLE IF EXISTS `adms_tps_pgs`;
CREATE TABLE `adms_tps_pgs`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `nome` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `obs` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ordem` int NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of adms_tps_pgs
-- ----------------------------
INSERT INTO `adms_tps_pgs` VALUES (1, 'adms', 'Administrativo', 'Core do Administrativo', 1, '2018-05-23 00:00:00', '2018-06-29 22:41:45');

-- ----------------------------
-- Table structure for adms_usuarios
-- ----------------------------
DROP TABLE IF EXISTS `adms_usuarios`;
CREATE TABLE `adms_usuarios`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(220) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `apelido` varchar(220) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `adms_niveis_acesso_id` int NOT NULL,
  `email` varchar(220) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `usuario` varchar(220) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `senha` varchar(220) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `recuperar_senha` varchar(220) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `conf_email` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `imagem` varchar(220) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `adms_sits_usuario_id` int NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NULL DEFAULT NULL,
  `id_uh` int NULL DEFAULT NULL,
  `pessoa_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 131 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of adms_usuarios
-- ----------------------------
INSERT INTO `adms_usuarios` VALUES (101, 'Isaias Bianda', 'Moises', 1, 'isaias@isaias.ibm.ao', 'isaias', '$2y$10$eJbUOHPsiqtawtBEeI.c6Oi89fQoTLSwRFC6EKj0DaK7frDYa2ANy', NULL, NULL, '', 1, '2022-01-27 07:54:49', NULL, 1, NULL);
INSERT INTO `adms_usuarios` VALUES (112, 'Pascoal', 'Cardoso', 1, 'pascoal@cardoso.ao', 'pascoal', '$10$.QAdLZhD2sFg4sx1c/T7Dujg9QlCHW6xYu//d4UNh2.F7HNbFbPki', NULL, NULL, NULL, 1, '2022-09-20 19:41:39', NULL, NULL, NULL);
INSERT INTO `adms_usuarios` VALUES (110, 'Tabita', 'Moises', 15, 'dasaad@tasha.com', 'sarita', '$2y$10$rlxw4pVGwShmrdINdcLIUO4yvPC/5JC3dzxAs2/UPvvog5Hs25gMS', NULL, NULL, '', 1, '2022-09-20 19:17:49', NULL, NULL, NULL);
INSERT INTO `adms_usuarios` VALUES (109, 'Sara', 'Moises', 1, 'sara@tabita.ao', 'tabita', '$10$rlxw4pVGwShmrdINdcLIUO4yvPC/5JC3dzxAs2/UPvvog5Hs25gMS', NULL, NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL);
INSERT INTO `adms_usuarios` VALUES (113, 'Adriano', 'Manuel', 1, 'adm@aat.com', 'adriano', '$2y$10$eJbUOHPsiqtawtBEeI.c6Oi89fQoTLSwRFC6EKj0DaK7frDYa2ANy', NULL, NULL, NULL, 1, '2022-09-20 19:50:01', NULL, NULL, NULL);
INSERT INTO `adms_usuarios` VALUES (128, 'Arlete', 'Luemba', 15, 'arlete@gmail.com', 'arlete', '$2y$10$YKj1hc9lQhT33KHjz/bhBe/xsuNi33OprExmAVY1On4HqmtOMhkae', NULL, NULL, NULL, 0, '0000-00-00 00:00:00', NULL, NULL, 46);
INSERT INTO `adms_usuarios` VALUES (115, 'Angela', 'Moises', 15, 'engisais@man.com', 'angela', 'dc72a933916ab141527fce2bbdfbd6cf', NULL, NULL, NULL, 0, '0000-00-00 00:00:00', NULL, NULL, NULL);
INSERT INTO `adms_usuarios` VALUES (119, 'Jaimito', 'jaimito', 15, 'jaimitos@ti.co.ao', 'jaimito', '$2y$10$mKSCxMm2tWQZ0PbbhbZ5xumlbl2xZqRRvLqd1E7XUYnxJy5PRzcQK', NULL, NULL, NULL, 0, '0000-00-00 00:00:00', NULL, NULL, 26);
INSERT INTO `adms_usuarios` VALUES (121, 'Nelson', 'Moises', 2, 'nelson@gmail.com', 'nelson', '$2y$10$I9SrtWX4ksk6Wu40FFM9b.vXyjLOvjLQQEjgP7SY5b/kMcYHH223O', NULL, NULL, '', 1, '2022-09-27 13:02:06', NULL, 4, 31);
INSERT INTO `adms_usuarios` VALUES (129, 'Jacinto', 'Diogo', 2, 'jacintocalunga@gmail.com', 'calunga', '$2y$10$s6CrsqB4knlODVN2.2tbH.dwrjb3kOY9Iyuz3t/UEaPOZD1K0U7Di', NULL, NULL, '', 1, '2025-01-09 15:52:46', NULL, NULL, NULL);
INSERT INTO `adms_usuarios` VALUES (130, 'Antónia Pegado', 'Pegado', 13, 'antoniapegado2022@gmail.com', 'pegado', '$2y$10$kvsiGz77kR2SJ598UnQnc.xrwL22IcfMhgnt9vW/nMgCex1I/XkvW', NULL, NULL, '', 1, '2025-01-10 19:20:36', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for tb_agendamento
-- ----------------------------
DROP TABLE IF EXISTS `tb_agendamento`;
CREATE TABLE `tb_agendamento`  (
  `id_agendamento` int NOT NULL AUTO_INCREMENT,
  `id_especialidade` int NULL DEFAULT NULL,
  `id_uh` int NULL DEFAULT NULL,
  `data_agendamento` date NULL DEFAULT NULL,
  `limite` int NULL DEFAULT NULL,
  `id_usuario` int NULL DEFAULT NULL,
  `created` datetime NULL DEFAULT NULL,
  `limite_atual` int NULL DEFAULT NULL,
  `hora_consulta` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `id_medico` int NULL DEFAULT NULL,
  PRIMARY KEY (`id_agendamento`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_agendamento
-- ----------------------------
INSERT INTO `tb_agendamento` VALUES (1, 1, 1, '2022-11-13', 10, 101, '2022-06-09 11:54:04', NULL, '01:20', 1);
INSERT INTO `tb_agendamento` VALUES (2, 1, 1, '2022-12-17', 16, 101, '2022-06-09 12:01:09', NULL, '15:00', 2);
INSERT INTO `tb_agendamento` VALUES (3, 2, 2, '2022-12-31', 13, 101, '2022-06-09 12:46:06', NULL, '01:32', 2);
INSERT INTO `tb_agendamento` VALUES (4, 1, 1, '2022-10-31', 14, 101, '2022-06-09 12:46:22', NULL, '11:00', 1);
INSERT INTO `tb_agendamento` VALUES (5, 1, 1, '2022-11-29', 32, 101, '2022-06-21 11:10:37', NULL, '13:00', 1);
INSERT INTO `tb_agendamento` VALUES (6, 1, 1, '2022-10-08', 8, 101, '2022-06-21 11:36:35', NULL, '13:38', 2);
INSERT INTO `tb_agendamento` VALUES (7, 1, 1, '2022-11-08', 8, 101, '2022-06-21 11:36:35', NULL, '12:37', 1);
INSERT INTO `tb_agendamento` VALUES (8, 1, 1, '2022-11-08', 8, 101, '2022-06-21 11:36:35', NULL, '16:41', 1);
INSERT INTO `tb_agendamento` VALUES (9, 1, 1, '2022-10-27', 9, 101, '2022-06-21 11:40:55', NULL, '11:40', 2);
INSERT INTO `tb_agendamento` VALUES (10, 1, 1, '2022-12-27', 9, 101, '2022-06-21 11:40:56', NULL, '12:41', 2);
INSERT INTO `tb_agendamento` VALUES (11, 1, 1, '2022-11-27', 9, 101, '2022-06-21 11:40:56', NULL, '13:40', 1);
INSERT INTO `tb_agendamento` VALUES (12, 1, 1, '2022-12-27', 9, 101, '2022-06-21 11:40:56', NULL, '14:30', 1);
INSERT INTO `tb_agendamento` VALUES (13, 1, 1, '2022-11-27', 9, 101, '2022-06-21 11:40:56', NULL, '15:00', 2);
INSERT INTO `tb_agendamento` VALUES (14, 2, 1, '2022-12-07', 4, 101, '2022-06-21 11:43:36', NULL, '12:43', 2);
INSERT INTO `tb_agendamento` VALUES (15, 2, 1, '2022-11-07', 4, 101, '2022-06-21 11:43:36', NULL, '11:43', 1);
INSERT INTO `tb_agendamento` VALUES (16, 2, 1, '2022-11-07', 4, 101, '2022-06-21 11:43:36', NULL, '13:45', 2);
INSERT INTO `tb_agendamento` VALUES (17, 1, 1, '2022-10-07', 4, 101, '2022-06-21 11:43:36', NULL, '12:44', 1);
INSERT INTO `tb_agendamento` VALUES (18, 2, 1, '2022-10-07', 4, 101, '2022-06-21 11:43:36', NULL, '15:47', 1);
INSERT INTO `tb_agendamento` VALUES (19, 1, 1, '2022-10-07', 4, 101, '2022-06-21 11:43:36', NULL, '16:48', 2);
INSERT INTO `tb_agendamento` VALUES (20, 2, 1, '2022-11-02', 18, 101, '2022-06-21 11:45:49', NULL, '12:45', 1);
INSERT INTO `tb_agendamento` VALUES (21, 2, 1, '2022-10-02', 18, 101, '2022-06-21 11:45:50', NULL, '11:44', 1);
INSERT INTO `tb_agendamento` VALUES (22, 2, 1, '2022-11-02', 18, 101, '2022-06-21 11:45:50', NULL, '11:50', 2);
INSERT INTO `tb_agendamento` VALUES (23, 2, 1, '2022-10-02', 18, 101, '2022-06-21 11:45:50', NULL, '13:47', 1);
INSERT INTO `tb_agendamento` VALUES (24, 2, 1, '2022-11-02', 18, 101, '2022-06-21 11:45:50', NULL, '14:48', 1);
INSERT INTO `tb_agendamento` VALUES (25, 2, 1, '2022-08-02', 18, 101, '2022-06-21 11:45:50', NULL, '15:51', 1);
INSERT INTO `tb_agendamento` VALUES (26, 1, 1, '2022-07-02', 18, 101, '2022-06-21 11:45:50', NULL, '15:45', 1);
INSERT INTO `tb_agendamento` VALUES (27, 2, 1, '2022-08-02', 18, 101, '2022-06-21 11:45:50', NULL, '17:54', 2);
INSERT INTO `tb_agendamento` VALUES (28, 2, 1, '2022-07-02', 18, 101, '2022-06-21 11:45:50', NULL, '17:49', 1);
INSERT INTO `tb_agendamento` VALUES (29, 2, 1, '2022-08-02', 18, 101, '2022-06-21 11:45:50', NULL, '18:50', 2);
INSERT INTO `tb_agendamento` VALUES (30, 2, 1, '2022-08-02', 18, 101, '2022-06-21 11:45:50', NULL, '19:50', 1);
INSERT INTO `tb_agendamento` VALUES (31, 1, 1, '2023-02-01', 32, 101, '2022-06-21 22:36:24', NULL, '23:40', 1);
INSERT INTO `tb_agendamento` VALUES (32, 1, 1, '2023-02-01', 32, 101, '2022-06-21 22:36:26', NULL, '23:37', 1);
INSERT INTO `tb_agendamento` VALUES (33, 1, 1, '2023-02-01', 32, 101, '2022-06-21 22:36:26', NULL, '00:38', 1);
INSERT INTO `tb_agendamento` VALUES (34, 2, 1, '2023-07-12', 4, 101, '2022-06-21 22:41:20', NULL, '23:41', 1);
INSERT INTO `tb_agendamento` VALUES (35, 2, 1, '2023-07-12', 4, 101, '2022-06-21 22:41:21', NULL, '00:43', 1);
INSERT INTO `tb_agendamento` VALUES (36, 2, 1, '2023-07-12', 4, 101, '2022-06-21 22:41:21', NULL, '23:42', 2);
INSERT INTO `tb_agendamento` VALUES (37, 2, 1, '2023-07-12', 4, 101, '2022-06-21 22:41:21', NULL, '23:46', 1);
INSERT INTO `tb_agendamento` VALUES (38, 2, 1, '2022-08-03', 4, 101, '2022-06-21 23:03:55', NULL, '01:05', 2);
INSERT INTO `tb_agendamento` VALUES (39, 2, 1, '2022-08-03', 4, 101, '2022-06-21 23:03:55', NULL, '02:06', 1);
INSERT INTO `tb_agendamento` VALUES (40, 2, 1, '2022-08-03', 4, 101, '2022-06-21 23:03:55', NULL, '02:05', 2);
INSERT INTO `tb_agendamento` VALUES (41, 1, 1, '2022-10-21', 34, 101, '2022-06-21 23:06:15', NULL, '02:08', 1);
INSERT INTO `tb_agendamento` VALUES (42, 1, 1, '2022-07-21', 34, 101, '2022-06-21 23:06:16', NULL, '01:07', 1);
INSERT INTO `tb_agendamento` VALUES (43, 1, 1, '2022-07-21', 34, 101, '2022-06-21 23:06:16', NULL, '01:10', 1);
INSERT INTO `tb_agendamento` VALUES (44, 1, 1, '2022-06-30', 3123, 101, '2022-06-21 23:16:58', NULL, '00:18', 2);
INSERT INTO `tb_agendamento` VALUES (45, 1, 1, '2022-06-30', 3123, 101, '2022-06-21 23:16:59', NULL, '01:18', 1);
INSERT INTO `tb_agendamento` VALUES (46, 1, 1, '2022-06-30', 3123, 101, '2022-06-21 23:16:59', NULL, '02:19', 2);
INSERT INTO `tb_agendamento` VALUES (47, 1, 1, '2022-06-30', 3123, 101, '2022-06-21 23:16:59', NULL, '02:22', 2);
INSERT INTO `tb_agendamento` VALUES (48, 1, 1, '2022-06-30', 3123, 101, '2022-06-21 23:16:59', NULL, '04:18', 1);
INSERT INTO `tb_agendamento` VALUES (49, 1, 1, '2022-06-30', 3123, 101, '2022-06-21 23:16:59', NULL, '03:19', 1);
INSERT INTO `tb_agendamento` VALUES (50, 1, 1, '2023-04-26', 5, 101, '2022-06-28 21:44:19', NULL, '08:45', 1);
INSERT INTO `tb_agendamento` VALUES (51, 1, 1, '2023-04-26', 5, 101, '2022-06-28 21:44:19', NULL, '00:44', 2);
INSERT INTO `tb_agendamento` VALUES (52, 1, 1, '2023-04-26', 5, 101, '2022-06-28 21:44:19', NULL, '23:45', 1);
INSERT INTO `tb_agendamento` VALUES (53, 1, 1, '2023-04-26', 5, 101, '2022-06-28 21:44:19', NULL, '01:45', 1);
INSERT INTO `tb_agendamento` VALUES (54, 1, 1, '2023-04-26', 5, 101, '2022-06-28 21:44:19', NULL, '01:45', 1);
INSERT INTO `tb_agendamento` VALUES (55, 2, 1, '2022-10-18', NULL, 101, '2022-07-05 12:16:27', NULL, '15:18', 1);
INSERT INTO `tb_agendamento` VALUES (56, 2, 1, '2022-10-18', NULL, 101, '2022-07-05 12:16:27', NULL, '13:16', 1);
INSERT INTO `tb_agendamento` VALUES (57, 2, 1, '2022-10-18', NULL, 101, '2022-07-05 12:16:28', NULL, '16:19', 2);
INSERT INTO `tb_agendamento` VALUES (58, 2, 1, '2022-10-18', NULL, 101, '2022-07-05 12:16:28', NULL, '18:21', 1);
INSERT INTO `tb_agendamento` VALUES (59, 1, 1, '2022-07-20', NULL, 101, '2022-07-05 12:27:19', NULL, '14:31', 2);
INSERT INTO `tb_agendamento` VALUES (60, 1, 1, '2022-07-20', NULL, 101, '2022-07-05 12:32:20', NULL, '14:31', 2);
INSERT INTO `tb_agendamento` VALUES (61, 1, 1, '2022-07-08', NULL, 101, '2022-07-05 12:40:01', NULL, '13:37', 1);
INSERT INTO `tb_agendamento` VALUES (64, 1, 1, '2022-10-25', NULL, 101, '2022-07-05 13:57:55', NULL, '15:58', 2);
INSERT INTO `tb_agendamento` VALUES (65, 1, 1, '2022-10-25', NULL, 101, '2022-07-05 13:57:55', NULL, '15:00', 2);
INSERT INTO `tb_agendamento` VALUES (66, 1, 1, '2022-10-25', NULL, 101, '2022-07-05 13:57:55', NULL, '16:00', 2);
INSERT INTO `tb_agendamento` VALUES (67, 1, 1, '2022-10-25', NULL, 101, '2022-07-05 13:57:56', NULL, '16:18', 2);
INSERT INTO `tb_agendamento` VALUES (68, 1, 1, '2022-10-25', NULL, 101, '2022-07-05 13:57:56', NULL, '16:48', 2);
INSERT INTO `tb_agendamento` VALUES (69, 1, 1, '2022-10-25', NULL, 101, '2022-07-05 13:57:56', NULL, '17:00', 2);
INSERT INTO `tb_agendamento` VALUES (70, 1, 1, '2022-10-25', NULL, 101, '2022-07-05 13:57:56', NULL, '17:20', 2);
INSERT INTO `tb_agendamento` VALUES (71, 1, 1, '2022-10-25', NULL, 101, '2022-07-05 13:57:56', NULL, '17:40', 2);
INSERT INTO `tb_agendamento` VALUES (72, 1, 1, '2022-10-25', NULL, 101, '2022-07-05 13:57:56', NULL, '18:00', 2);
INSERT INTO `tb_agendamento` VALUES (73, 1, 1, '2022-10-25', NULL, 101, '2022-07-05 13:57:56', NULL, '18:20', 2);
INSERT INTO `tb_agendamento` VALUES (74, 2, 1, '2022-11-05', NULL, 101, '2022-09-13 10:56:28', NULL, '12:55', 1);
INSERT INTO `tb_agendamento` VALUES (75, 2, 1, '2022-11-05', NULL, 101, '2022-09-13 10:56:28', NULL, '13:56', 1);
INSERT INTO `tb_agendamento` VALUES (76, 2, 1, '2022-11-05', NULL, 101, '2022-09-13 10:56:28', NULL, '14:00', 1);
INSERT INTO `tb_agendamento` VALUES (77, 2, 1, '2022-11-05', NULL, 101, '2022-09-13 10:56:28', NULL, '15:00', 1);
INSERT INTO `tb_agendamento` VALUES (78, 2, 1, '2022-11-05', NULL, 101, '2022-09-13 10:56:29', NULL, '16:00', 1);
INSERT INTO `tb_agendamento` VALUES (79, 2, 1, '2022-11-05', NULL, 101, '2022-09-13 10:56:29', NULL, '18:00', 1);
INSERT INTO `tb_agendamento` VALUES (80, 2, 1, '2022-10-06', NULL, 101, '2022-09-13 11:02:31', NULL, '14:01', 1);
INSERT INTO `tb_agendamento` VALUES (81, 2, 1, '2022-10-06', NULL, 101, '2022-09-13 11:02:31', NULL, '15:06', 1);
INSERT INTO `tb_agendamento` VALUES (82, 2, 1, '2022-10-06', NULL, 101, '2022-09-13 11:02:31', NULL, '15:50', 1);
INSERT INTO `tb_agendamento` VALUES (83, 2, 1, '2022-10-06', NULL, 101, '2022-09-13 11:02:32', NULL, '16:10', 1);
INSERT INTO `tb_agendamento` VALUES (84, 2, 1, '2022-10-06', NULL, 101, '2022-09-13 11:02:32', NULL, '16:30', 1);
INSERT INTO `tb_agendamento` VALUES (85, 4, 5, '2022-12-20', NULL, 122, '2022-09-27 19:00:38', NULL, '08:20', 12);
INSERT INTO `tb_agendamento` VALUES (86, 4, 5, '2022-12-20', NULL, 122, '2022-09-27 19:00:39', NULL, '09:00', 12);
INSERT INTO `tb_agendamento` VALUES (87, 4, 5, '2022-12-20', NULL, 122, '2022-09-27 19:00:39', NULL, '10:00', 12);
INSERT INTO `tb_agendamento` VALUES (88, 4, 5, '2022-12-20', NULL, 122, '2022-09-27 19:00:39', NULL, '11:00', 12);
INSERT INTO `tb_agendamento` VALUES (89, 4, 5, '2022-12-20', NULL, 122, '2022-09-27 19:00:39', NULL, '12:00', 12);
INSERT INTO `tb_agendamento` VALUES (90, 4, 5, '2022-12-20', NULL, 122, '2022-09-27 19:00:40', NULL, '13:00', 12);
INSERT INTO `tb_agendamento` VALUES (91, 4, 5, '2022-12-20', NULL, 122, '2022-09-27 19:00:40', NULL, '14:00', 12);
INSERT INTO `tb_agendamento` VALUES (92, 4, 5, '2022-12-20', NULL, 122, '2022-09-27 19:00:40', NULL, '15:00', 12);
INSERT INTO `tb_agendamento` VALUES (93, 4, 5, '2022-12-20', NULL, 122, '2022-09-27 19:00:40', NULL, '16:00', 12);
INSERT INTO `tb_agendamento` VALUES (94, 4, 5, '2022-12-20', NULL, 122, '2022-09-27 19:00:40', NULL, '17:00', 12);
INSERT INTO `tb_agendamento` VALUES (95, 4, 5, '2022-12-20', NULL, 122, '2022-09-27 19:04:59', NULL, '08:00', 13);
INSERT INTO `tb_agendamento` VALUES (96, 4, 5, '2022-12-20', NULL, 122, '2022-09-27 19:05:00', NULL, '09:00', 13);
INSERT INTO `tb_agendamento` VALUES (97, 4, 5, '2022-12-20', NULL, 122, '2022-09-27 19:05:00', NULL, '10:00', 13);
INSERT INTO `tb_agendamento` VALUES (98, 4, 5, '2022-12-20', NULL, 122, '2022-09-27 19:05:01', NULL, '11:00', 13);
INSERT INTO `tb_agendamento` VALUES (99, 4, 5, '2022-12-20', NULL, 122, '2022-09-27 19:05:01', NULL, '12:00', 13);
INSERT INTO `tb_agendamento` VALUES (100, 4, 5, '2022-12-20', NULL, 122, '2022-09-27 19:05:01', NULL, '13:00', 13);
INSERT INTO `tb_agendamento` VALUES (101, 2, 5, '2022-11-14', NULL, 122, '2022-09-28 08:48:05', NULL, '08:00', 14);
INSERT INTO `tb_agendamento` VALUES (102, 2, 5, '2022-11-14', NULL, 122, '2022-09-28 08:48:05', NULL, '09:00', 14);
INSERT INTO `tb_agendamento` VALUES (103, 2, 5, '2022-11-14', NULL, 122, '2022-09-28 08:48:05', NULL, '10:00', 14);
INSERT INTO `tb_agendamento` VALUES (104, 2, 5, '2022-11-14', NULL, 122, '2022-09-28 08:48:05', NULL, '11:00', 14);
INSERT INTO `tb_agendamento` VALUES (105, 2, 5, '2022-11-14', NULL, 122, '2022-09-28 08:48:05', NULL, '12:00', 14);
INSERT INTO `tb_agendamento` VALUES (106, 2, 5, '2022-11-14', NULL, 122, '2022-09-28 08:48:05', NULL, '13:00', 14);
INSERT INTO `tb_agendamento` VALUES (107, 2, 5, '2022-11-14', NULL, 122, '2022-09-28 08:48:05', NULL, '14:00', 14);
INSERT INTO `tb_agendamento` VALUES (108, 2, 5, '2022-11-14', NULL, 122, '2022-09-28 08:48:06', NULL, '15:00', 14);
INSERT INTO `tb_agendamento` VALUES (109, 2, 5, '2022-11-14', NULL, 122, '2022-09-28 08:48:06', NULL, '16:00', 14);
INSERT INTO `tb_agendamento` VALUES (110, 2, 5, '2022-11-14', NULL, 122, '2022-09-28 08:48:06', NULL, '17:00', 14);

-- ----------------------------
-- Table structure for tb_categorias_produto
-- ----------------------------
DROP TABLE IF EXISTS `tb_categorias_produto`;
CREATE TABLE `tb_categorias_produto`  (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `descricao` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_categoria`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_categorias_produto
-- ----------------------------
INSERT INTO `tb_categorias_produto` VALUES (13, 'Medicamentos', 'Inclui todos os medicamentos, como comprimidos, xaropes e injetáveis', '2024-12-23 19:48:00', '2024-12-23 19:48:00');
INSERT INTO `tb_categorias_produto` VALUES (14, 'Higiene e Cuidados Pessoais', 'Produtos para higiene pessoal e cuidados diários', '2024-12-23 19:48:00', '2024-12-23 19:48:00');
INSERT INTO `tb_categorias_produto` VALUES (15, 'Cosméticos e Maquiagem', 'Produtos para beleza e estética', '2024-12-23 19:48:00', '2024-12-23 19:48:00');
INSERT INTO `tb_categorias_produto` VALUES (16, 'Suplementos e Vitaminas', 'Polivitamínicos, minerais e suplementos alimentares', '2024-12-23 19:48:00', '2024-12-23 19:48:00');
INSERT INTO `tb_categorias_produto` VALUES (17, 'Produtos Naturais', 'Produtos fitoterápicos e naturais para saúde', '2024-12-23 19:48:00', '2024-12-23 19:48:00');
INSERT INTO `tb_categorias_produto` VALUES (18, 'Materiais de Primeiros Socorros', 'Itens para tratamentos imediatos de lesões', '2024-12-23 19:48:00', '2024-12-23 19:48:00');
INSERT INTO `tb_categorias_produto` VALUES (19, 'Equipamentos Médicos', 'Equipamentos como medidores de glicose e aparelhos de pressão', '2024-12-23 19:48:00', '2024-12-23 19:48:00');
INSERT INTO `tb_categorias_produto` VALUES (20, 'Cuidados com Bebês', 'Produtos destinados a cuidados com recém-nascidos e bebês', '2024-12-23 19:48:00', '2024-12-23 19:48:00');
INSERT INTO `tb_categorias_produto` VALUES (21, 'Saúde e Bem-Estar', 'Produtos para suporte ortopédico e cuidados gerais', '2024-12-23 19:48:00', '2024-12-23 19:48:00');
INSERT INTO `tb_categorias_produto` VALUES (22, 'Limpeza Doméstica', 'Produtos para higienização do ambiente', '2024-12-23 19:48:00', '2024-12-23 19:48:00');
INSERT INTO `tb_categorias_produto` VALUES (23, 'Alimentos e Bebidas Especiais', 'Produtos dietéticos e funcionais', '2024-12-23 19:48:00', '2024-12-23 19:48:00');
INSERT INTO `tb_categorias_produto` VALUES (24, 'Produtos Veterinários', 'Medicamentos e acessórios para animais', '2024-12-23 19:48:00', '2024-12-23 19:48:00');
INSERT INTO `tb_categorias_produto` VALUES (25, 'Outros Produtos Diversos', 'Itens variados como testes rápidos e óculos de leitura', '2024-12-23 19:48:00', '2024-12-23 19:48:00');

-- ----------------------------
-- Table structure for tb_clientes
-- ----------------------------
DROP TABLE IF EXISTS `tb_clientes`;
CREATE TABLE `tb_clientes`  (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `telefone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_cliente`) USING BTREE,
  UNIQUE INDEX `email`(`email` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_clientes
-- ----------------------------

-- ----------------------------
-- Table structure for tb_detalhes_pagamento
-- ----------------------------
DROP TABLE IF EXISTS `tb_detalhes_pagamento`;
CREATE TABLE `tb_detalhes_pagamento`  (
  `id_detalhe_pagamento` int NOT NULL AUTO_INCREMENT,
  `id_pagamento` int NOT NULL,
  `id_forma_pagamento` int NOT NULL,
  `valor_pagamento` decimal(10, 2) NOT NULL,
  `id_usuario` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_detalhe_pagamento`) USING BTREE,
  INDEX `fk_pagamento`(`id_pagamento` ASC) USING BTREE,
  INDEX `fk_forma_pagamento`(`id_forma_pagamento` ASC) USING BTREE,
  CONSTRAINT `fk_forma_pagamento` FOREIGN KEY (`id_forma_pagamento`) REFERENCES `tb_formas_pagamento` (`id_forma_pagamento`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `fk_pagamento` FOREIGN KEY (`id_pagamento`) REFERENCES `tb_pagamento_venda` (`id_pagamento`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_detalhes_pagamento
-- ----------------------------
INSERT INTO `tb_detalhes_pagamento` VALUES (1, 198, 1, 5000.00, 130, '2025-01-13 12:33:52');
INSERT INTO `tb_detalhes_pagamento` VALUES (2, 199, 1, 5000.00, 130, '2025-01-13 12:33:52');
INSERT INTO `tb_detalhes_pagamento` VALUES (3, 200, 1, 5000.00, 130, '2025-01-13 12:33:52');

-- ----------------------------
-- Table structure for tb_especialidade
-- ----------------------------
DROP TABLE IF EXISTS `tb_especialidade`;
CREATE TABLE `tb_especialidade`  (
  `id_especialidade` int NOT NULL AUTO_INCREMENT,
  `designacao_especialidade` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `cod_usuario` int NULL DEFAULT NULL,
  `created` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id_especialidade`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_especialidade
-- ----------------------------
INSERT INTO `tb_especialidade` VALUES (1, 'Clínica Geral', NULL, NULL);
INSERT INTO `tb_especialidade` VALUES (2, 'Estomatologia', NULL, NULL);
INSERT INTO `tb_especialidade` VALUES (3, 'Otorrinolaringologia', NULL, NULL);
INSERT INTO `tb_especialidade` VALUES (4, 'Urologia', NULL, NULL);
INSERT INTO `tb_especialidade` VALUES (5, 'Ginecologia', NULL, NULL);
INSERT INTO `tb_especialidade` VALUES (6, 'Ginecologia Obstetrícia', NULL, NULL);
INSERT INTO `tb_especialidade` VALUES (7, 'Oftalmologia', NULL, NULL);
INSERT INTO `tb_especialidade` VALUES (8, 'Nefrologia', NULL, NULL);
INSERT INTO `tb_especialidade` VALUES (9, 'UTI', NULL, NULL);
INSERT INTO `tb_especialidade` VALUES (10, 'Gastroenterologia', NULL, NULL);
INSERT INTO `tb_especialidade` VALUES (11, 'Pedriatria', NULL, NULL);
INSERT INTO `tb_especialidade` VALUES (12, 'Psiquiatria', NULL, NULL);
INSERT INTO `tb_especialidade` VALUES (13, 'Neurologia', NULL, NULL);
INSERT INTO `tb_especialidade` VALUES (14, 'Fisioterapia', NULL, NULL);
INSERT INTO `tb_especialidade` VALUES (15, 'Dermatologia', NULL, NULL);
INSERT INTO `tb_especialidade` VALUES (16, 'Angiologia', NULL, NULL);
INSERT INTO `tb_especialidade` VALUES (17, 'Cardiologia', NULL, NULL);
INSERT INTO `tb_especialidade` VALUES (18, 'Geriatria', NULL, NULL);
INSERT INTO `tb_especialidade` VALUES (19, 'Endoscopia', NULL, NULL);
INSERT INTO `tb_especialidade` VALUES (20, 'Infectologia', NULL, NULL);
INSERT INTO `tb_especialidade` VALUES (21, 'Mastologia', NULL, NULL);
INSERT INTO `tb_especialidade` VALUES (22, 'Medicina Legal', NULL, NULL);
INSERT INTO `tb_especialidade` VALUES (23, 'Psicologia', 101, '2022-04-11 16:48:59');
INSERT INTO `tb_especialidade` VALUES (24, 'Cinesioterapia', 101, '2022-04-11 16:50:02');

-- ----------------------------
-- Table structure for tb_estado_civil
-- ----------------------------
DROP TABLE IF EXISTS `tb_estado_civil`;
CREATE TABLE `tb_estado_civil`  (
  `id_estado_civil` int NOT NULL AUTO_INCREMENT,
  `estado_civil` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_estado_civil`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_estado_civil
-- ----------------------------
INSERT INTO `tb_estado_civil` VALUES (1, 'Solteiro (a)');
INSERT INTO `tb_estado_civil` VALUES (2, 'Casado (a)');
INSERT INTO `tb_estado_civil` VALUES (3, 'Divorciado (a)');
INSERT INTO `tb_estado_civil` VALUES (4, 'Viúvo (a)');

-- ----------------------------
-- Table structure for tb_estado_marcacao
-- ----------------------------
DROP TABLE IF EXISTS `tb_estado_marcacao`;
CREATE TABLE `tb_estado_marcacao`  (
  `id_estado_marcacao` int NOT NULL AUTO_INCREMENT,
  `estado_marcacao` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_estado_marcacao`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_estado_marcacao
-- ----------------------------
INSERT INTO `tb_estado_marcacao` VALUES (1, 'Realizada');
INSERT INTO `tb_estado_marcacao` VALUES (2, 'Em espera');
INSERT INTO `tb_estado_marcacao` VALUES (3, 'Cancelada');
INSERT INTO `tb_estado_marcacao` VALUES (4, 'Não realizada');

-- ----------------------------
-- Table structure for tb_estoque
-- ----------------------------
DROP TABLE IF EXISTS `tb_estoque`;
CREATE TABLE `tb_estoque`  (
  `id_estoque` int NOT NULL AUTO_INCREMENT,
  `id_produto` int NOT NULL,
  `quantidade` int NOT NULL,
  `id_fornecedor` int NOT NULL,
  `data_entrada` date NOT NULL,
  `data_validade` date NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_estoque`) USING BTREE,
  INDEX `id_produto`(`id_produto` ASC) USING BTREE,
  INDEX `id_fornecedor_2`(`id_fornecedor` ASC) USING BTREE,
  INDEX `id_fornecedor`(`id_fornecedor` ASC) USING BTREE,
  CONSTRAINT `tb_estoque_ibfk_1` FOREIGN KEY (`id_produto`) REFERENCES `tb_produtos` (`id_produto`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tb_estoque_ibfk_2` FOREIGN KEY (`id_fornecedor`) REFERENCES `tb_fornecedores` (`id_fornecedor`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_estoque
-- ----------------------------

-- ----------------------------
-- Table structure for tb_fabricante
-- ----------------------------
DROP TABLE IF EXISTS `tb_fabricante`;
CREATE TABLE `tb_fabricante`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome_fabricante` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_pais_fabricante` int NULL DEFAULT NULL,
  `id_user` int NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_fabricante
-- ----------------------------
INSERT INTO `tb_fabricante` VALUES (1, 'Índia', NULL, 130, '2025-01-10 21:01:57');
INSERT INTO `tb_fabricante` VALUES (2, 'Portugal', NULL, 130, '2025-01-10 21:02:06');

-- ----------------------------
-- Table structure for tb_formas_pagamento
-- ----------------------------
DROP TABLE IF EXISTS `tb_formas_pagamento`;
CREATE TABLE `tb_formas_pagamento`  (
  `id_forma_pagamento` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `descricao` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_forma_pagamento`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_formas_pagamento
-- ----------------------------
INSERT INTO `tb_formas_pagamento` VALUES (1, 'Dinheiro', NULL, '2024-12-23 18:12:46', '2024-12-27 16:00:36');
INSERT INTO `tb_formas_pagamento` VALUES (2, 'Cartão Multicaixa', NULL, '2024-12-23 18:13:18', '2024-12-27 16:00:46');
INSERT INTO `tb_formas_pagamento` VALUES (3, 'Transferência bancária', NULL, '2024-12-23 18:13:46', '2024-12-23 18:14:33');

-- ----------------------------
-- Table structure for tb_fornecedores
-- ----------------------------
DROP TABLE IF EXISTS `tb_fornecedores`;
CREATE TABLE `tb_fornecedores`  (
  `id_fornecedor` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `telefone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `endereco` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_user` int NOT NULL,
  `nif` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_fornecedor`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_fornecedores
-- ----------------------------
INSERT INTO `tb_fornecedores` VALUES (4, 'Lua Farma', '926593000', 'palanca@luacomercio.com', 'palanca', '2025-01-10 20:47:24', '2025-01-10 19:47:24', 130, '2405257912');
INSERT INTO `tb_fornecedores` VALUES (5, 'Vitacare Farma', '925363956', 'vita@gmail.com', 'Viana', '2025-01-10 20:48:49', '2025-01-10 19:48:49', 130, '5420007126');
INSERT INTO `tb_fornecedores` VALUES (6, 'Africa Pharmacy Limitada', '928883355', 'africa@gmail.com', 'Palanca', '2025-01-10 20:50:22', '2025-01-10 19:50:22', 130, '000000000');
INSERT INTO `tb_fornecedores` VALUES (7, 'Trucare', '926124234', 'palanca@trucare.co.ao', 'Palanca', '2025-01-10 20:51:29', '2025-01-10 19:51:29', 130, '5884036305');
INSERT INTO `tb_fornecedores` VALUES (8, 'Aarnex Farmácia', '927362564', 'pharma.palanca@aarnex.com', 'Palanca', '2025-01-10 20:53:20', '2025-01-10 19:53:20', 130, '5417539660');
INSERT INTO `tb_fornecedores` VALUES (9, 'Amaldina Comércio Geral', '931118866', 'amaldina@gmail.com', 'Palanca', '2025-01-10 20:54:27', '2025-01-10 19:54:27', 130, '00000000');
INSERT INTO `tb_fornecedores` VALUES (10, 'Alcista International Lda', '943766987', 'alcista@gmail.com', 'Palanca', '2025-01-10 20:55:18', '2025-01-10 19:55:18', 130, '5001016415');

-- ----------------------------
-- Table structure for tb_funcionario
-- ----------------------------
DROP TABLE IF EXISTS `tb_funcionario`;
CREATE TABLE `tb_funcionario`  (
  `id_funcionario` int NOT NULL AUTO_INCREMENT,
  `cod_pessoa` int NULL DEFAULT NULL,
  `cod_funcao` int NULL DEFAULT NULL,
  `id_uh` int NULL DEFAULT NULL,
  PRIMARY KEY (`id_funcionario`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_funcionario
-- ----------------------------

-- ----------------------------
-- Table structure for tb_item_venda
-- ----------------------------
DROP TABLE IF EXISTS `tb_item_venda`;
CREATE TABLE `tb_item_venda`  (
  `id_item_venda` int NOT NULL AUTO_INCREMENT,
  `id_venda` int NOT NULL,
  `id_produto` int NOT NULL,
  `quantidade` int NOT NULL,
  `preco_unitario` decimal(10, 2) NOT NULL,
  `subtotal` decimal(10, 2) NOT NULL,
  `id_usuario` int NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id_item_venda`) USING BTREE,
  INDEX `id_venda`(`id_venda` ASC) USING BTREE,
  INDEX `id_produto`(`id_produto` ASC) USING BTREE,
  CONSTRAINT `tb_item_venda_ibfk_1` FOREIGN KEY (`id_venda`) REFERENCES `venda` (`id_venda`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `tb_item_venda_ibfk_2` FOREIGN KEY (`id_produto`) REFERENCES `tb_produtos` (`id_produto`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_item_venda
-- ----------------------------
INSERT INTO `tb_item_venda` VALUES (1, 159, 13, 1, 2000.00, 2000.00, 130, '2025-01-13 12:33:52', NULL);
INSERT INTO `tb_item_venda` VALUES (2, 159, 14, 1, 2000.00, 2000.00, 130, '2025-01-13 12:33:52', NULL);
INSERT INTO `tb_item_venda` VALUES (3, 159, 15, 1, 850.00, 850.00, 130, '2025-01-13 12:33:52', NULL);

-- ----------------------------
-- Table structure for tb_localidade_uh
-- ----------------------------
DROP TABLE IF EXISTS `tb_localidade_uh`;
CREATE TABLE `tb_localidade_uh`  (
  `id_localidade` int NOT NULL AUTO_INCREMENT,
  `id_provincia` int NULL DEFAULT NULL,
  `id_municipio` int NULL DEFAULT NULL,
  `Localidade` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `id_uh` int NULL DEFAULT NULL,
  PRIMARY KEY (`id_localidade`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_localidade_uh
-- ----------------------------

-- ----------------------------
-- Table structure for tb_marcacao
-- ----------------------------
DROP TABLE IF EXISTS `tb_marcacao`;
CREATE TABLE `tb_marcacao`  (
  `id_marcacao` int NOT NULL AUTO_INCREMENT,
  `id_paciente` int NULL DEFAULT NULL,
  `id_agendamento` int NULL DEFAULT NULL,
  `data_marcacao` datetime NULL DEFAULT NULL,
  `id_usuario` int NULL DEFAULT NULL,
  `updated` datetime NULL DEFAULT NULL,
  `estado_marcacao` int NULL DEFAULT NULL,
  `obs` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_marcacao`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_marcacao
-- ----------------------------
INSERT INTO `tb_marcacao` VALUES (2, 1, 3, '2022-06-14 12:50:41', 101, NULL, 2, NULL);
INSERT INTO `tb_marcacao` VALUES (19, 1, 5, NULL, 117, '2022-09-29 22:17:43', 4, NULL);
INSERT INTO `tb_marcacao` VALUES (29, 2, 48, '2022-06-30 10:12:11', 117, '2022-09-29 22:08:45', 1, NULL);
INSERT INTO `tb_marcacao` VALUES (40, 1, 2, '2022-06-30 21:11:26', 101, NULL, 1, NULL);
INSERT INTO `tb_marcacao` VALUES (41, 15, 46, '2022-06-30 21:11:37', 101, NULL, 1, NULL);
INSERT INTO `tb_marcacao` VALUES (42, 1, 47, '2022-06-30 21:11:49', 101, NULL, 2, NULL);
INSERT INTO `tb_marcacao` VALUES (43, 1, 22, '2022-07-05 12:24:04', 101, NULL, 1, NULL);
INSERT INTO `tb_marcacao` VALUES (93, 101, 7, '2022-07-07 09:07:40', 101, NULL, 2, NULL);
INSERT INTO `tb_marcacao` VALUES (94, 101, 8, '2022-07-07 09:09:47', 101, NULL, 2, NULL);
INSERT INTO `tb_marcacao` VALUES (95, 101, 27, '2022-07-07 09:10:36', 101, NULL, 1, NULL);
INSERT INTO `tb_marcacao` VALUES (96, 101, 6, '2022-07-07 09:13:39', 101, NULL, 1, NULL);
INSERT INTO `tb_marcacao` VALUES (97, 101, 61, '2022-07-07 09:14:11', 101, NULL, 4, NULL);
INSERT INTO `tb_marcacao` VALUES (98, 101, 60, '2022-07-07 09:15:12', 101, NULL, 1, NULL);
INSERT INTO `tb_marcacao` VALUES (99, 101, 42, '2022-07-07 09:15:33', 101, NULL, 1, NULL);
INSERT INTO `tb_marcacao` VALUES (100, 101, 16, '2022-07-07 09:15:59', 101, NULL, 1, NULL);
INSERT INTO `tb_marcacao` VALUES (101, 101, 41, '2022-07-07 09:18:41', 101, NULL, 2, NULL);
INSERT INTO `tb_marcacao` VALUES (102, 101, 43, '2022-07-07 09:19:16', 101, NULL, 1, NULL);
INSERT INTO `tb_marcacao` VALUES (103, 101, 29, '2022-07-07 14:05:32', 101, NULL, 1, NULL);
INSERT INTO `tb_marcacao` VALUES (104, 101, 17, '2022-07-14 11:05:19', 101, NULL, 1, NULL);
INSERT INTO `tb_marcacao` VALUES (105, 101, 68, '2022-07-14 11:07:47', 101, NULL, 1, NULL);
INSERT INTO `tb_marcacao` VALUES (106, 101, 52, '2022-07-19 14:02:08', 101, NULL, 2, NULL);
INSERT INTO `tb_marcacao` VALUES (107, 101, 12, '2022-07-19 14:11:58', 101, NULL, 2, NULL);
INSERT INTO `tb_marcacao` VALUES (108, 101, 10, '2022-07-19 14:12:24', 101, NULL, 2, NULL);
INSERT INTO `tb_marcacao` VALUES (109, 101, 11, '2022-07-19 14:20:02', 101, NULL, 2, NULL);
INSERT INTO `tb_marcacao` VALUES (110, 101, 32, '2022-07-19 14:20:42', 101, NULL, 2, NULL);
INSERT INTO `tb_marcacao` VALUES (111, 101, 31, '2022-07-19 14:34:18', 101, NULL, 4, NULL);
INSERT INTO `tb_marcacao` VALUES (112, 101, 51, '2022-07-19 14:34:45', 101, NULL, 2, NULL);
INSERT INTO `tb_marcacao` VALUES (113, 101, 50, '2022-07-19 14:35:10', 101, NULL, 2, NULL);
INSERT INTO `tb_marcacao` VALUES (114, 101, 56, '2022-07-19 14:35:39', 101, NULL, 2, NULL);
INSERT INTO `tb_marcacao` VALUES (115, 101, 67, '2022-07-19 14:36:10', 101, NULL, 2, NULL);
INSERT INTO `tb_marcacao` VALUES (116, 101, 69, '2022-07-19 14:36:58', 101, NULL, 2, NULL);
INSERT INTO `tb_marcacao` VALUES (117, 101, 70, '2022-07-19 14:45:41', 101, NULL, 2, NULL);
INSERT INTO `tb_marcacao` VALUES (118, 101, 66, '2022-07-19 14:47:00', 101, NULL, 4, NULL);
INSERT INTO `tb_marcacao` VALUES (119, 101, 65, '2022-07-19 14:49:10', 101, NULL, 2, NULL);
INSERT INTO `tb_marcacao` VALUES (120, 30, 54, '2022-09-13 10:16:18', 30, NULL, 2, NULL);
INSERT INTO `tb_marcacao` VALUES (121, 30, 9, '2022-09-13 10:20:40', 30, NULL, 4, NULL);
INSERT INTO `tb_marcacao` VALUES (122, 30, 15, '2022-09-13 10:37:23', 30, NULL, 2, NULL);
INSERT INTO `tb_marcacao` VALUES (123, 30, 33, '2022-09-13 10:38:22', 30, NULL, 2, NULL);
INSERT INTO `tb_marcacao` VALUES (124, 101, 75, '2022-09-13 11:03:43', 101, NULL, 2, NULL);
INSERT INTO `tb_marcacao` VALUES (125, 101, 76, '2022-09-13 11:06:48', 101, NULL, 2, NULL);
INSERT INTO `tb_marcacao` VALUES (126, 114, 78, '2022-09-21 09:39:26', 114, NULL, 2, NULL);
INSERT INTO `tb_marcacao` VALUES (133, 15, 53, NULL, 114, '2022-09-22 09:12:43', 4, NULL);
INSERT INTO `tb_marcacao` VALUES (137, 15, 57, '2022-09-23 17:11:18', 114, NULL, 2, NULL);
INSERT INTO `tb_marcacao` VALUES (139, 18, 83, '2022-09-23 17:22:39', 119, NULL, 4, NULL);
INSERT INTO `tb_marcacao` VALUES (145, 18, 89, '2022-09-27 21:57:10', 119, NULL, 2, NULL);
INSERT INTO `tb_marcacao` VALUES (146, 19, 103, '2022-09-28 08:53:12', 128, NULL, 2, NULL);
INSERT INTO `tb_marcacao` VALUES (147, 19, 105, '2022-09-29 13:44:55', 128, NULL, 4, NULL);
INSERT INTO `tb_marcacao` VALUES (148, 19, 110, '2022-09-29 13:45:17', 128, NULL, 2, NULL);
INSERT INTO `tb_marcacao` VALUES (149, 19, 97, '2022-09-29 13:48:09', 128, NULL, 2, NULL);

-- ----------------------------
-- Table structure for tb_medico
-- ----------------------------
DROP TABLE IF EXISTS `tb_medico`;
CREATE TABLE `tb_medico`  (
  `id_medico` int NOT NULL AUTO_INCREMENT,
  `cod_pessoa` int NULL DEFAULT NULL,
  `num_ordem` int NULL DEFAULT NULL,
  `Nome_Completo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `cod_usuario` int NULL DEFAULT NULL,
  `created` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id_medico`) USING BTREE,
  INDEX `cod_pessoa`(`cod_pessoa` ASC) USING BTREE,
  CONSTRAINT `tb_medico_ibfk_1` FOREIGN KEY (`cod_pessoa`) REFERENCES `tb_pessoa` (`Cod_Pessoa`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_medico
-- ----------------------------
INSERT INTO `tb_medico` VALUES (1, 13, 643, 'Tito Pedro', NULL, NULL);
INSERT INTO `tb_medico` VALUES (2, 14, 523, 'Pedro Dito', NULL, NULL);
INSERT INTO `tb_medico` VALUES (12, 43, 23120, 'Aguinaldo Aguin', 122, '2022-09-27 17:57:53');
INSERT INTO `tb_medico` VALUES (13, 44, 23012, 'Aurelio Aur', 122, '2022-09-27 18:03:51');
INSERT INTO `tb_medico` VALUES (14, 45, 23012, 'Edmundo Joaquim', 122, '2022-09-28 08:45:40');

-- ----------------------------
-- Table structure for tb_medico_especialidade
-- ----------------------------
DROP TABLE IF EXISTS `tb_medico_especialidade`;
CREATE TABLE `tb_medico_especialidade`  (
  `id_medico_especialidade` int NOT NULL AUTO_INCREMENT,
  `id_medico` int NULL DEFAULT NULL,
  `id_especialidade` int NULL DEFAULT NULL,
  `cod_usuario` int NULL DEFAULT NULL,
  `created` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id_medico_especialidade`) USING BTREE,
  INDEX `id_medico`(`id_medico` ASC) USING BTREE,
  INDEX `id_especialidade`(`id_especialidade` ASC) USING BTREE,
  CONSTRAINT `tb_medico_especialidade_ibfk_1` FOREIGN KEY (`id_medico`) REFERENCES `tb_medico` (`id_medico`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tb_medico_especialidade_ibfk_2` FOREIGN KEY (`id_especialidade`) REFERENCES `tb_especialidade` (`id_especialidade`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_medico_especialidade
-- ----------------------------
INSERT INTO `tb_medico_especialidade` VALUES (1, 1, 1, NULL, NULL);
INSERT INTO `tb_medico_especialidade` VALUES (2, 1, 2, NULL, NULL);
INSERT INTO `tb_medico_especialidade` VALUES (3, 2, 1, NULL, NULL);
INSERT INTO `tb_medico_especialidade` VALUES (4, 2, 1, NULL, NULL);
INSERT INTO `tb_medico_especialidade` VALUES (11, 12, 4, 122, '2022-09-27 17:57:53');
INSERT INTO `tb_medico_especialidade` VALUES (12, 13, 4, 122, '2022-09-27 18:03:51');
INSERT INTO `tb_medico_especialidade` VALUES (13, 14, 2, 122, '2022-09-28 08:45:41');

-- ----------------------------
-- Table structure for tb_medico_uh
-- ----------------------------
DROP TABLE IF EXISTS `tb_medico_uh`;
CREATE TABLE `tb_medico_uh`  (
  `id_medico_uh` int NOT NULL AUTO_INCREMENT,
  `id_medico` int NULL DEFAULT NULL,
  `id_uh` int NULL DEFAULT NULL,
  `cod_usuario` int NULL DEFAULT NULL,
  `created` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id_medico_uh`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_medico_uh
-- ----------------------------
INSERT INTO `tb_medico_uh` VALUES (1, 1, 1, NULL, NULL);
INSERT INTO `tb_medico_uh` VALUES (2, 2, 1, NULL, NULL);
INSERT INTO `tb_medico_uh` VALUES (3, 1, 2, NULL, NULL);
INSERT INTO `tb_medico_uh` VALUES (4, 2, 2, NULL, NULL);
INSERT INTO `tb_medico_uh` VALUES (5, 12, 5, 122, '2022-09-27 00:00:00');
INSERT INTO `tb_medico_uh` VALUES (6, 13, 5, 122, '2022-09-27 18:03:51');
INSERT INTO `tb_medico_uh` VALUES (7, 14, 5, 122, '2022-09-28 08:45:41');

-- ----------------------------
-- Table structure for tb_municipio
-- ----------------------------
DROP TABLE IF EXISTS `tb_municipio`;
CREATE TABLE `tb_municipio`  (
  `cod_municipio` int NOT NULL AUTO_INCREMENT,
  `designacao_municipio` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `cod_provincia` int NOT NULL,
  PRIMARY KEY (`cod_municipio`) USING BTREE,
  INDEX `Cod_Provincia`(`cod_provincia` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tb_municipio
-- ----------------------------
INSERT INTO `tb_municipio` VALUES (1, 'Ambriz', 1);
INSERT INTO `tb_municipio` VALUES (2, 'Dande', 1);
INSERT INTO `tb_municipio` VALUES (3, 'Dembos', 1);
INSERT INTO `tb_municipio` VALUES (4, 'Bula Atumba', 1);
INSERT INTO `tb_municipio` VALUES (5, 'Nambuangongo', 1);
INSERT INTO `tb_municipio` VALUES (6, 'Pango Aluquem', 1);
INSERT INTO `tb_municipio` VALUES (7, 'Balombo', 2);
INSERT INTO `tb_municipio` VALUES (8, 'Baia Farta', 2);
INSERT INTO `tb_municipio` VALUES (9, 'Benguela', 2);
INSERT INTO `tb_municipio` VALUES (10, 'Bocoio', 2);
INSERT INTO `tb_municipio` VALUES (11, 'Caimbambo', 2);
INSERT INTO `tb_municipio` VALUES (12, 'Catumbela', 2);
INSERT INTO `tb_municipio` VALUES (13, 'Chongoroi', 2);
INSERT INTO `tb_municipio` VALUES (14, 'Cubal', 2);
INSERT INTO `tb_municipio` VALUES (15, 'Ganda', 2);
INSERT INTO `tb_municipio` VALUES (16, 'Lobito', 2);
INSERT INTO `tb_municipio` VALUES (17, 'Andulo', 3);
INSERT INTO `tb_municipio` VALUES (18, 'Camacupa', 3);
INSERT INTO `tb_municipio` VALUES (19, 'Catabola', 3);
INSERT INTO `tb_municipio` VALUES (20, 'Chinguar', 3);
INSERT INTO `tb_municipio` VALUES (21, 'Chitembo', 3);
INSERT INTO `tb_municipio` VALUES (22, 'Cuemba', 3);
INSERT INTO `tb_municipio` VALUES (23, 'Cunhinga', 3);
INSERT INTO `tb_municipio` VALUES (24, 'Kuito', 3);
INSERT INTO `tb_municipio` VALUES (25, 'Nharea', 3);
INSERT INTO `tb_municipio` VALUES (26, 'Belize', 4);
INSERT INTO `tb_municipio` VALUES (27, 'Buco-Zau', 4);
INSERT INTO `tb_municipio` VALUES (28, 'Cabinda', 4);
INSERT INTO `tb_municipio` VALUES (29, 'Cacongo', 4);
INSERT INTO `tb_municipio` VALUES (30, 'Cahama', 5);
INSERT INTO `tb_municipio` VALUES (31, 'Cuanhama', 5);
INSERT INTO `tb_municipio` VALUES (32, 'Curoca', 5);
INSERT INTO `tb_municipio` VALUES (33, 'Cuvelay', 5);
INSERT INTO `tb_municipio` VALUES (34, 'Namacunde', 5);
INSERT INTO `tb_municipio` VALUES (35, 'Ombadja', 5);
INSERT INTO `tb_municipio` VALUES (36, 'Bailundo', 6);
INSERT INTO `tb_municipio` VALUES (37, 'Catchiungo', 6);
INSERT INTO `tb_municipio` VALUES (38, 'CaÃ¡la', 6);
INSERT INTO `tb_municipio` VALUES (39, 'Ekunha', 6);
INSERT INTO `tb_municipio` VALUES (40, 'Huambo', 6);
INSERT INTO `tb_municipio` VALUES (41, 'Londuimbale', 6);
INSERT INTO `tb_municipio` VALUES (42, 'Longongo', 6);
INSERT INTO `tb_municipio` VALUES (43, 'Mungo', 6);
INSERT INTO `tb_municipio` VALUES (44, 'Tchicala-Tcholoanga', 6);
INSERT INTO `tb_municipio` VALUES (45, 'Tchindjenje', 6);
INSERT INTO `tb_municipio` VALUES (46, 'Ucuma', 6);
INSERT INTO `tb_municipio` VALUES (47, 'Caconda', 7);
INSERT INTO `tb_municipio` VALUES (48, 'Cacula', 7);
INSERT INTO `tb_municipio` VALUES (49, 'Caluquembe', 7);
INSERT INTO `tb_municipio` VALUES (50, 'Chiange', 7);
INSERT INTO `tb_municipio` VALUES (51, 'Chibia', 7);
INSERT INTO `tb_municipio` VALUES (52, 'Chicomba', 7);
INSERT INTO `tb_municipio` VALUES (53, 'Chipindo', 7);
INSERT INTO `tb_municipio` VALUES (54, 'Humpata', 7);
INSERT INTO `tb_municipio` VALUES (55, 'Jamba', 7);
INSERT INTO `tb_municipio` VALUES (56, 'Kuvango', 7);
INSERT INTO `tb_municipio` VALUES (57, 'Lubango', 7);
INSERT INTO `tb_municipio` VALUES (58, 'Matala', 7);
INSERT INTO `tb_municipio` VALUES (59, 'Quilengues', 7);
INSERT INTO `tb_municipio` VALUES (60, 'Quipungo', 7);
INSERT INTO `tb_municipio` VALUES (61, 'Calai', 8);
INSERT INTO `tb_municipio` VALUES (62, 'Cuangar', 8);
INSERT INTO `tb_municipio` VALUES (63, 'Cuchi', 8);
INSERT INTO `tb_municipio` VALUES (64, 'Cuito Cuanavale', 8);
INSERT INTO `tb_municipio` VALUES (65, 'Dirico', 8);
INSERT INTO `tb_municipio` VALUES (66, 'Longa', 8);
INSERT INTO `tb_municipio` VALUES (67, 'Mavinga', 8);
INSERT INTO `tb_municipio` VALUES (68, 'Menongue', 8);
INSERT INTO `tb_municipio` VALUES (69, 'Rivungo', 8);
INSERT INTO `tb_municipio` VALUES (70, 'Ambaca', 9);
INSERT INTO `tb_municipio` VALUES (71, 'Banga', 9);
INSERT INTO `tb_municipio` VALUES (72, 'Bolongongo', 9);
INSERT INTO `tb_municipio` VALUES (73, 'Cambambe', 9);
INSERT INTO `tb_municipio` VALUES (74, 'Cazengo', 9);
INSERT INTO `tb_municipio` VALUES (75, 'Golungo Alto', 9);
INSERT INTO `tb_municipio` VALUES (76, 'Gonguembo', 9);
INSERT INTO `tb_municipio` VALUES (77, 'Lucala', 9);
INSERT INTO `tb_municipio` VALUES (78, 'Quiculungo', 9);
INSERT INTO `tb_municipio` VALUES (79, 'Samba Caju', 9);
INSERT INTO `tb_municipio` VALUES (80, 'Amboim', 10);
INSERT INTO `tb_municipio` VALUES (81, 'Cassongue', 10);
INSERT INTO `tb_municipio` VALUES (82, 'Conda', 10);
INSERT INTO `tb_municipio` VALUES (83, 'Ebo', 10);
INSERT INTO `tb_municipio` VALUES (84, 'Libolo', 10);
INSERT INTO `tb_municipio` VALUES (85, 'Mussende', 10);
INSERT INTO `tb_municipio` VALUES (86, 'Porto Amboim', 10);
INSERT INTO `tb_municipio` VALUES (87, 'Quibala', 10);
INSERT INTO `tb_municipio` VALUES (88, 'Quilenda', 10);
INSERT INTO `tb_municipio` VALUES (89, 'Seles', 10);
INSERT INTO `tb_municipio` VALUES (90, 'Sumbe', 10);
INSERT INTO `tb_municipio` VALUES (91, 'Waku Kungo', 10);
INSERT INTO `tb_municipio` VALUES (92, 'Belas', 11);
INSERT INTO `tb_municipio` VALUES (93, 'Cacuaco', 11);
INSERT INTO `tb_municipio` VALUES (94, 'Cazenga', 11);
INSERT INTO `tb_municipio` VALUES (95, 'Icolo e Bengo', 11);
INSERT INTO `tb_municipio` VALUES (96, 'Luanda', 11);
INSERT INTO `tb_municipio` VALUES (97, 'QuiÃ§ama', 11);
INSERT INTO `tb_municipio` VALUES (98, 'Kilamba Kiaxi', 11);
INSERT INTO `tb_municipio` VALUES (99, 'Talatona', 11);
INSERT INTO `tb_municipio` VALUES (100, 'Viana', 11);
INSERT INTO `tb_municipio` VALUES (101, 'Cambulo', 12);
INSERT INTO `tb_municipio` VALUES (102, 'Capenda-Camulemba', 12);
INSERT INTO `tb_municipio` VALUES (103, 'Caungula', 12);
INSERT INTO `tb_municipio` VALUES (104, 'Chitato (Tchitato)', 12);
INSERT INTO `tb_municipio` VALUES (105, 'Cuango', 12);
INSERT INTO `tb_municipio` VALUES (106, 'Cuilo', 12);
INSERT INTO `tb_municipio` VALUES (107, 'LÃ³vua', 12);
INSERT INTO `tb_municipio` VALUES (108, 'Lubalo', 12);
INSERT INTO `tb_municipio` VALUES (109, 'Lucapa', 12);
INSERT INTO `tb_municipio` VALUES (110, 'XÃ¡ Muteba', 12);
INSERT INTO `tb_municipio` VALUES (111, 'Cacolo', 13);
INSERT INTO `tb_municipio` VALUES (112, 'Dala', 13);
INSERT INTO `tb_municipio` VALUES (113, 'Muconda', 13);
INSERT INTO `tb_municipio` VALUES (114, 'Saurimo', 13);
INSERT INTO `tb_municipio` VALUES (115, 'Cacuso', 14);
INSERT INTO `tb_municipio` VALUES (116, 'Calandula', 14);
INSERT INTO `tb_municipio` VALUES (117, 'Cambundi-Catembo', 14);
INSERT INTO `tb_municipio` VALUES (118, 'Cangandala', 14);
INSERT INTO `tb_municipio` VALUES (119, 'Caombo', 14);
INSERT INTO `tb_municipio` VALUES (120, 'Cuaba Nzogo', 14);
INSERT INTO `tb_municipio` VALUES (121, 'Cunda-Diaza', 14);
INSERT INTO `tb_municipio` VALUES (122, 'Luquembo', 14);
INSERT INTO `tb_municipio` VALUES (123, 'Malange', 14);
INSERT INTO `tb_municipio` VALUES (124, 'Marimba', 14);
INSERT INTO `tb_municipio` VALUES (125, 'Massango', 14);
INSERT INTO `tb_municipio` VALUES (126, 'Caculama-Mucari', 14);
INSERT INTO `tb_municipio` VALUES (127, 'Quela', 14);
INSERT INTO `tb_municipio` VALUES (128, 'Quirima', 14);
INSERT INTO `tb_municipio` VALUES (129, 'Alto Zambeze', 15);
INSERT INTO `tb_municipio` VALUES (130, 'Bundas', 15);
INSERT INTO `tb_municipio` VALUES (131, 'Camanongue', 15);
INSERT INTO `tb_municipio` VALUES (132, 'Cameia', 15);
INSERT INTO `tb_municipio` VALUES (133, 'Luau', 15);
INSERT INTO `tb_municipio` VALUES (134, 'Lucano', 15);
INSERT INTO `tb_municipio` VALUES (135, 'Luchazes', 15);
INSERT INTO `tb_municipio` VALUES (136, 'Luena', 15);
INSERT INTO `tb_municipio` VALUES (137, 'Moxico', 15);
INSERT INTO `tb_municipio` VALUES (138, 'Bibala', 16);
INSERT INTO `tb_municipio` VALUES (139, 'Camulo', 16);
INSERT INTO `tb_municipio` VALUES (140, 'Namibe', 16);
INSERT INTO `tb_municipio` VALUES (141, 'TÃ´mbua', 16);
INSERT INTO `tb_municipio` VALUES (142, 'Virei', 16);
INSERT INTO `tb_municipio` VALUES (143, 'Alto Cauale', 17);
INSERT INTO `tb_municipio` VALUES (144, 'AmbuÃ­la', 17);
INSERT INTO `tb_municipio` VALUES (145, 'Bembe', 17);
INSERT INTO `tb_municipio` VALUES (146, 'Buengas', 17);
INSERT INTO `tb_municipio` VALUES (147, 'Bungo', 17);
INSERT INTO `tb_municipio` VALUES (148, 'Damba', 17);
INSERT INTO `tb_municipio` VALUES (149, 'Macocola', 17);
INSERT INTO `tb_municipio` VALUES (150, 'Mucaba', 17);
INSERT INTO `tb_municipio` VALUES (151, 'Negage', 17);
INSERT INTO `tb_municipio` VALUES (152, 'Puri', 17);
INSERT INTO `tb_municipio` VALUES (153, 'Quimbele', 17);
INSERT INTO `tb_municipio` VALUES (154, 'Quitexe', 17);
INSERT INTO `tb_municipio` VALUES (155, 'Sanza Pombo', 17);
INSERT INTO `tb_municipio` VALUES (156, 'Songo', 17);
INSERT INTO `tb_municipio` VALUES (157, 'Uige', 17);
INSERT INTO `tb_municipio` VALUES (158, 'Maquela do Zombo', 17);
INSERT INTO `tb_municipio` VALUES (159, 'Cuimba', 18);
INSERT INTO `tb_municipio` VALUES (160, 'M\'Banza Kongo', 18);
INSERT INTO `tb_municipio` VALUES (161, 'Noqui', 18);
INSERT INTO `tb_municipio` VALUES (162, 'N\'Zeto', 18);
INSERT INTO `tb_municipio` VALUES (163, 'Soyo', 18);
INSERT INTO `tb_municipio` VALUES (164, 'Tomboco', 18);
INSERT INTO `tb_municipio` VALUES (165, 'Ndalatando', 9);
INSERT INTO `tb_municipio` VALUES (166, 'Rangel', 11);
INSERT INTO `tb_municipio` VALUES (167, 'Sambizanga', 11);
INSERT INTO `tb_municipio` VALUES (168, 'Ingombota', 11);
INSERT INTO `tb_municipio` VALUES (169, 'Gabela', 10);
INSERT INTO `tb_municipio` VALUES (170, 'Xangongo', 5);
INSERT INTO `tb_municipio` VALUES (171, 'Cahama', 5);
INSERT INTO `tb_municipio` VALUES (172, 'Icolo e Bengo', 1);
INSERT INTO `tb_municipio` VALUES (173, 'Caxito', 1);
INSERT INTO `tb_municipio` VALUES (174, 'Bula Atumba', 1);
INSERT INTO `tb_municipio` VALUES (176, 'Huambo', 6);
INSERT INTO `tb_municipio` VALUES (177, 'Gabela', 10);
INSERT INTO `tb_municipio` VALUES (178, 'Cangola', 17);
INSERT INTO `tb_municipio` VALUES (179, 'Milunga', 17);
INSERT INTO `tb_municipio` VALUES (180, 'Maianga', 11);
INSERT INTO `tb_municipio` VALUES (181, 'Samba', 11);
INSERT INTO `tb_municipio` VALUES (182, 'Dondo', 9);
INSERT INTO `tb_municipio` VALUES (183, 'Ongiva', 5);
INSERT INTO `tb_municipio` VALUES (184, 'Desconhecido', 20);

-- ----------------------------
-- Table structure for tb_nacionalidade
-- ----------------------------
DROP TABLE IF EXISTS `tb_nacionalidade`;
CREATE TABLE `tb_nacionalidade`  (
  `id_nacionalidade` int NOT NULL AUTO_INCREMENT,
  `designacao_nacionalidade` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_nacionalidade`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_nacionalidade
-- ----------------------------

-- ----------------------------
-- Table structure for tb_paciente
-- ----------------------------
DROP TABLE IF EXISTS `tb_paciente`;
CREATE TABLE `tb_paciente`  (
  `id_paciente` int NOT NULL AUTO_INCREMENT,
  `cod_pessoa` int NULL DEFAULT NULL,
  `cod_usuario` int NULL DEFAULT NULL,
  `created` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id_paciente`) USING BTREE,
  INDEX `cod_pessoa`(`cod_pessoa` ASC) USING BTREE,
  CONSTRAINT `tb_paciente_ibfk_1` FOREIGN KEY (`cod_pessoa`) REFERENCES `tb_pessoa` (`Cod_Pessoa`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_paciente
-- ----------------------------
INSERT INTO `tb_paciente` VALUES (1, 7, 101, '2022-04-11 14:45:12');
INSERT INTO `tb_paciente` VALUES (2, 8, 101, '2022-04-23 17:25:02');
INSERT INTO `tb_paciente` VALUES (3, 9, 101, '2022-04-23 17:36:10');
INSERT INTO `tb_paciente` VALUES (4, 10, 101, '2022-04-23 17:36:57');
INSERT INTO `tb_paciente` VALUES (5, 11, 101, '2022-06-14 13:27:24');
INSERT INTO `tb_paciente` VALUES (6, 12, 101, '2022-06-19 13:01:10');
INSERT INTO `tb_paciente` VALUES (10, 18, NULL, '2022-09-20 17:10:34');
INSERT INTO `tb_paciente` VALUES (11, 19, NULL, '2022-09-20 17:11:26');
INSERT INTO `tb_paciente` VALUES (12, 20, NULL, '2022-09-20 17:12:24');
INSERT INTO `tb_paciente` VALUES (13, 21, NULL, '2022-09-20 17:12:44');
INSERT INTO `tb_paciente` VALUES (14, 22, NULL, '2022-09-20 17:36:28');
INSERT INTO `tb_paciente` VALUES (15, 23, NULL, '2022-09-20 20:32:22');
INSERT INTO `tb_paciente` VALUES (16, 24, NULL, '2022-09-20 20:41:32');
INSERT INTO `tb_paciente` VALUES (18, 26, NULL, '2022-09-23 16:41:57');
INSERT INTO `tb_paciente` VALUES (19, 46, NULL, '2022-09-28 08:51:59');

-- ----------------------------
-- Table structure for tb_pagamento_venda
-- ----------------------------
DROP TABLE IF EXISTS `tb_pagamento_venda`;
CREATE TABLE `tb_pagamento_venda`  (
  `id_pagamento` int NOT NULL AUTO_INCREMENT,
  `id_venda` int NOT NULL,
  `valor_total` decimal(10, 2) NULL DEFAULT NULL,
  `valor_pago` decimal(10, 2) NOT NULL,
  `troco` decimal(10, 2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_usuario` int NULL DEFAULT NULL,
  PRIMARY KEY (`id_pagamento`) USING BTREE,
  INDEX `id_venda`(`id_venda` ASC) USING BTREE,
  CONSTRAINT `tb_pagamento_venda_ibfk_1` FOREIGN KEY (`id_venda`) REFERENCES `venda` (`id_venda`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_pagamento_venda
-- ----------------------------
INSERT INTO `tb_pagamento_venda` VALUES (198, 159, 4850.00, 5000.00, 150.00, '2025-01-13 12:33:52', 130);
INSERT INTO `tb_pagamento_venda` VALUES (199, 159, 4850.00, 5000.00, 150.00, '2025-01-13 12:33:52', 130);
INSERT INTO `tb_pagamento_venda` VALUES (200, 159, 4850.00, 5000.00, 150.00, '2025-01-13 12:33:52', 130);

-- ----------------------------
-- Table structure for tb_pessoa
-- ----------------------------
DROP TABLE IF EXISTS `tb_pessoa`;
CREATE TABLE `tb_pessoa`  (
  `Cod_Pessoa` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(256) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Apelido` varchar(256) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Nome_Do_Pai` varchar(256) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Nome_Da_Mae` varchar(256) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Cod_Nacionalidade` int NOT NULL,
  `Cod_Provincia` int NOT NULL,
  `Cod_Municipio` int NOT NULL,
  `Data_Nascimento` date NOT NULL,
  `Cod_Sexo` int NOT NULL,
  `Cod_Estado_Civil` int NOT NULL,
  `Cod_Tipo_Documento` int NOT NULL,
  `Numero_Documento` varchar(256) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Data_Validade_Documento` date NOT NULL,
  `Altura` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Telefone` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Email` varchar(256) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `cod_usuario` int NULL DEFAULT NULL,
  `created` datetime NULL DEFAULT NULL,
  `modified` datetime NULL DEFAULT NULL,
  `endereco_morada` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Cod_Pessoa`) USING BTREE,
  INDEX `tb_pessoa_ibfk_2`(`Cod_Sexo` ASC) USING BTREE,
  INDEX `Cod_Estado_Civil`(`Cod_Estado_Civil` ASC) USING BTREE,
  INDEX `tb_pessoa_ibfk_1`(`Cod_Tipo_Documento` ASC) USING BTREE,
  INDEX `tb_pessoa_ibfk_4`(`Cod_Municipio` ASC) USING BTREE,
  INDEX `tb_pessoa_ibfk_5`(`Cod_Provincia` ASC) USING BTREE,
  INDEX `tb_pessoa_ibfk_6`(`Cod_Nacionalidade` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tb_pessoa
-- ----------------------------
INSERT INTO `tb_pessoa` VALUES (7, 'Jose Manuel', 'PEdro', '', '', 0, 1, 0, '2020-07-07', 1, 0, 1, '000989563LA021', '0000-00-00', '', '232434325', 'd50913@alunos.uevora.pt', 101, '2022-04-11 14:45:12', NULL, NULL);
INSERT INTO `tb_pessoa` VALUES (8, 'Manuel Pedro', 'Dito', '', '', 0, 2, 0, '1990-04-23', 1, 0, 1, '002355465LA023', '0000-00-00', '', '985265486', 'd50913@alunos.uevora.pt', 101, '2022-04-23 17:25:02', NULL, NULL);
INSERT INTO `tb_pessoa` VALUES (9, 'Manuel Miguel', 'Pedro', '', '', 0, 1, 0, '2021-03-03', 1, 0, 1, '000253654HO033', '0000-00-00', '', '927192392', 'd50913@alunos.uevora.pt', 101, '2022-04-23 17:36:09', NULL, NULL);
INSERT INTO `tb_pessoa` VALUES (10, 'Manuela', 'Filipe', '', '', 0, 4, 0, '2021-03-03', 2, 0, 1, '011345375', '0000-00-00', '', '927192392', 'd50913@alunos.uevora.pt', 101, '2022-04-23 17:36:57', NULL, NULL);
INSERT INTO `tb_pessoa` VALUES (11, 'Angela Manuel', 'Moises', '', '', 0, 1, 0, '2022-01-12', 2, 0, 1, '0098534la008', '0000-00-00', '', '944459828', 'placidom1@hotmail.com', 101, '2022-06-14 13:27:24', NULL, NULL);
INSERT INTO `tb_pessoa` VALUES (12, 'Pedro Lima', 'Jose', '', '', 0, 1, 82, '2021-11-29', 1, 0, 1, '00098796la0923', '0000-00-00', '', '222352342', 'adssf@agora.com', 101, '2022-06-19 13:01:10', NULL, 'cwntro da cidade em direcção a leste');
INSERT INTO `tb_pessoa` VALUES (13, 'Tito', 'Pedro', '', '', 0, 0, 3, '0000-00-00', 0, 0, 0, '', '0000-00-00', '', '', '', NULL, NULL, NULL, NULL);
INSERT INTO `tb_pessoa` VALUES (14, 'Pedro', 'Dito', '', '', 0, 0, 2, '0000-00-00', 0, 0, 0, '', '0000-00-00', '', '', '', NULL, NULL, NULL, NULL);
INSERT INTO `tb_pessoa` VALUES (18, 'Oliveira', 'Manuel', '', '', 0, 0, 1, '2023-01-01', 1, 0, 1, 'tyty', '0000-00-00', '', '9786655', 'dgfdb', NULL, '2022-09-20 17:10:34', NULL, 'treer');
INSERT INTO `tb_pessoa` VALUES (19, 'Oliveira', 'Manuel', '', '', 0, 0, 1, '2023-01-01', 1, 0, 1, 'tyty', '0000-00-00', '', '9786655', 'dgfdb', NULL, '2022-09-20 17:11:26', NULL, 'treer');
INSERT INTO `tb_pessoa` VALUES (20, 'Mauricio Pedro', 'Filipe', '', '', 0, 0, 1, '2023-01-01', 1, 0, 1, 'jkshj', '0000-00-00', '', '9983427', 'sjsghjh', NULL, '2022-09-20 17:12:24', NULL, 'jbshb');
INSERT INTO `tb_pessoa` VALUES (21, 'Mauricio Pedro', 'Filipe', '', '', 0, 0, 1, '2023-01-01', 1, 0, 1, 'jkshj', '0000-00-00', '', '9983427', 'sjsghjh', NULL, '2022-09-20 17:12:43', NULL, 'jbshb');
INSERT INTO `tb_pessoa` VALUES (22, 'Sara Tabita', 'Moises', '', '', 0, 0, 1, '2018-04-06', 2, 0, 1, '0949347892346938', '0000-00-00', '', '923232323', 'sara@tabita.ao', NULL, '2022-09-20 17:36:28', NULL, 'Luanda');
INSERT INTO `tb_pessoa` VALUES (23, 'Arlete', 'Luemba', '', '', 0, 0, 1, '2022-01-01', 2, 0, 1, 'w2e23', '0000-00-00', '', '9887771881', 'ajhjhd@sk.com', NULL, '2022-09-20 20:32:22', NULL, 'wsqwdwd');
INSERT INTO `tb_pessoa` VALUES (24, 'Angela', 'Moises', '', '', 0, 0, 1, '2022-01-01', 2, 0, 1, '123', '0000-00-00', '', '923929292', 'engisais@man.com', NULL, '2022-09-20 20:41:32', NULL, 'qwqwd');
INSERT INTO `tb_pessoa` VALUES (26, 'Jaimito', 'jaimito', '', '', 0, 0, 1, '2022-09-15', 1, 0, 1, '409349ao2083', '0000-00-00', '', '90867590', 'jaimitos@ti.co.ao', NULL, '2022-09-23 16:41:57', NULL, 'dweterdfs');
INSERT INTO `tb_pessoa` VALUES (31, 'Nelson', 'Moises', '', '', 0, 0, 0, '0000-00-00', 0, 0, 1, '000978956LA023', '0000-00-00', '', '', 'nelson@gmail.com', 101, '2022-09-27 13:02:05', NULL, NULL);
INSERT INTO `tb_pessoa` VALUES (32, 'Osvaldo', 'Osvaldo', '', '', 0, 0, 0, '0000-00-00', 0, 0, 1, '0023145LA012', '0000-00-00', '', '', 'osvaldo@gmail.com', 101, '2022-09-27 13:02:59', NULL, NULL);
INSERT INTO `tb_pessoa` VALUES (43, 'Aguinaldo', 'Aguin', '', '', 0, 0, 96, '2022-09-08', 1, 0, 1, '00231253LA023', '0000-00-00', '', '923561232', 'aguinaldo@gmail.com', 122, '2022-09-27 17:57:53', NULL, 'Luanda Sul');
INSERT INTO `tb_pessoa` VALUES (44, 'Aurelio', 'Aur', '', '', 0, 0, 96, '2022-06-08', 1, 0, 1, '00231415LA032', '0000-00-00', '', '923561410', 'aurelio@gmail.com', 122, '2022-09-27 18:03:50', NULL, 'Luanda Norte');
INSERT INTO `tb_pessoa` VALUES (45, 'Edmundo', 'Joaquim', '', '', 0, 0, 96, '2022-06-08', 1, 0, 1, '000231514LA012', '0000-00-00', '', '925141020', 'edmundo@gmail.com', 122, '2022-09-28 08:45:40', NULL, 'Luanda 21 de Janeiro');
INSERT INTO `tb_pessoa` VALUES (46, 'Arlete', 'Luemba', '', '', 0, 0, 1, '2022-06-01', 1, 0, 1, '00232125LA023', '0000-00-00', '', '923562100', 'arlete@gmail.com', NULL, '2022-09-28 08:51:59', NULL, 'Maianga 21 de Janeiro');

-- ----------------------------
-- Table structure for tb_pessoa_copy1
-- ----------------------------
DROP TABLE IF EXISTS `tb_pessoa_copy1`;
CREATE TABLE `tb_pessoa_copy1`  (
  `Cod_Pessoa` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(256) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Apelido` varchar(256) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Nome_Do_Pai` varchar(256) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Nome_Da_Mae` varchar(256) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Cod_Nacionalidade` int NOT NULL,
  `Cod_Provincia` int NOT NULL,
  `Cod_Municipio` int NOT NULL,
  `Data_Nascimento` date NOT NULL,
  `Cod_Sexo` int NOT NULL,
  `Cod_Estado_Civil` int NOT NULL,
  `Cod_Tipo_Documento` int NOT NULL,
  `Numero_Documento` varchar(256) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Data_Validade_Documento` date NOT NULL,
  `Altura` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Telefone` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Email` varchar(256) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `cod_usuario` int NULL DEFAULT NULL,
  `created` datetime NULL DEFAULT NULL,
  `modified` datetime NULL DEFAULT NULL,
  `endereco_morada` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Cod_Pessoa`) USING BTREE,
  INDEX `tb_pessoa_ibfk_2`(`Cod_Sexo` ASC) USING BTREE,
  INDEX `Cod_Estado_Civil`(`Cod_Estado_Civil` ASC) USING BTREE,
  INDEX `tb_pessoa_ibfk_1`(`Cod_Tipo_Documento` ASC) USING BTREE,
  INDEX `tb_pessoa_ibfk_4`(`Cod_Municipio` ASC) USING BTREE,
  INDEX `tb_pessoa_ibfk_5`(`Cod_Provincia` ASC) USING BTREE,
  INDEX `tb_pessoa_ibfk_6`(`Cod_Nacionalidade` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tb_pessoa_copy1
-- ----------------------------
INSERT INTO `tb_pessoa_copy1` VALUES (7, 'Jose Manuel', 'PEdro', '', '', 0, 1, 0, '2020-07-07', 1, 0, 1, '000989563LA021', '0000-00-00', '', '232434325', 'd50913@alunos.uevora.pt', 101, '2022-04-11 14:45:12', NULL, NULL);
INSERT INTO `tb_pessoa_copy1` VALUES (8, 'Manuel Pedro', 'Dito', '', '', 0, 2, 0, '1990-04-23', 1, 0, 1, '002355465LA023', '0000-00-00', '', '985265486', 'd50913@alunos.uevora.pt', 101, '2022-04-23 17:25:02', NULL, NULL);
INSERT INTO `tb_pessoa_copy1` VALUES (9, 'Manuel Miguel', 'Pedro', '', '', 0, 1, 0, '2021-03-03', 1, 0, 1, '000253654HO033', '0000-00-00', '', '927192392', 'd50913@alunos.uevora.pt', 101, '2022-04-23 17:36:09', NULL, NULL);
INSERT INTO `tb_pessoa_copy1` VALUES (10, 'Manuela', 'Filipe', '', '', 0, 4, 0, '2021-03-03', 2, 0, 1, '011345375', '0000-00-00', '', '927192392', 'd50913@alunos.uevora.pt', 101, '2022-04-23 17:36:57', NULL, NULL);
INSERT INTO `tb_pessoa_copy1` VALUES (11, 'Angela Manuel', 'Moises', '', '', 0, 1, 0, '2022-01-12', 2, 0, 1, '0098534la008', '0000-00-00', '', '944459828', 'placidom1@hotmail.com', 101, '2022-06-14 13:27:24', NULL, NULL);
INSERT INTO `tb_pessoa_copy1` VALUES (12, 'Pedro Lima', 'Jose', '', '', 0, 1, 82, '2021-11-29', 1, 0, 1, '00098796la0923', '0000-00-00', '', '222352342', 'adssf@agora.com', 101, '2022-06-19 13:01:10', NULL, 'cwntro da cidade em direcção a leste');
INSERT INTO `tb_pessoa_copy1` VALUES (13, 'Tito', 'Pedro', '', '', 0, 0, 3, '0000-00-00', 0, 0, 0, '', '0000-00-00', '', '', '', NULL, NULL, NULL, NULL);
INSERT INTO `tb_pessoa_copy1` VALUES (14, 'Pedro', 'Dito', '', '', 0, 0, 2, '0000-00-00', 0, 0, 0, '', '0000-00-00', '', '', '', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for tb_produtos
-- ----------------------------
DROP TABLE IF EXISTS `tb_produtos`;
CREATE TABLE `tb_produtos`  (
  `id_produto` int NOT NULL AUTO_INCREMENT,
  `nome_produto` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `descricao_produto` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `id_categoria` int NOT NULL,
  `tipo` enum('Comprimido','Xarope','Pomada','Cosmético','Outro') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `preco_compra` decimal(10, 2) NOT NULL,
  `preco_venda` decimal(10, 2) NOT NULL,
  `quantidade_estoque` int NOT NULL DEFAULT 0,
  `id_status` enum('Disponível','Indisponível') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'Disponível',
  `id_forncedor` int NULL DEFAULT NULL,
  `data_fabrico` date NULL DEFAULT NULL,
  `data_validade` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_user` int NULL DEFAULT NULL,
  `id_tipo_produto` int NOT NULL,
  `peso_volume` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `quantidade_pacote` int NOT NULL,
  `id_fabricante` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `bar_code` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id_produto`) USING BTREE,
  UNIQUE INDEX `Codigo de barra`(`bar_code` ASC) USING BTREE,
  INDEX `id_categoria`(`id_categoria` ASC) USING BTREE,
  CONSTRAINT `tb_produtos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `tb_categorias_produto` (`id_categoria`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_produtos
-- ----------------------------
INSERT INTO `tb_produtos` VALUES (12, 'Gravi-Naus', 'para nauseas', 13, 'Comprimido', 92.00, 200.00, 30, 'Disponível', 7, '2022-05-05', '2025-04-04', '2025-01-10 21:16:56', '2025-01-10 20:16:56', 130, 1, NULL, 6, '', 6290360150895);
INSERT INTO `tb_produtos` VALUES (13, 'Ben-u-ron 500 mg', 'analgesico antipiretico', 13, 'Comprimido', 1335.00, 2000.00, 3, 'Disponível', 8, '2024-01-11', '2027-11-11', '2025-01-10 21:25:09', '2025-01-13 12:33:52', 130, 1, NULL, 10, '', 3854585);
INSERT INTO `tb_produtos` VALUES (14, 'Betussin', 'Tosse, dores no corpo, febre, congestão nasal, congestão no peito', 13, 'Comprimido', 1276.00, 2000.00, 4, 'Disponível', 4, '2024-02-01', '2027-01-30', '2025-01-10 21:30:44', '2025-01-13 12:33:52', 130, 2, NULL, 1, '', 8906117735953);
INSERT INTO `tb_produtos` VALUES (15, 'Scorvitex (Vitamina C) 100 ml', 'imunidade das células', 13, 'Comprimido', 572.00, 850.00, 9, 'Disponível', 4, '2024-04-01', '2026-03-03', '2025-01-10 21:38:50', '2025-01-13 12:33:52', 130, 2, NULL, 1, '', 8906117736189);
INSERT INTO `tb_produtos` VALUES (16, 'Mycozema', 'creme antibiótico dermatite', 13, 'Comprimido', 860.00, 1300.00, 10, 'Disponível', 9, '2024-01-05', '2028-01-04', '2025-01-13 14:19:45', '2025-01-13 13:19:45', 130, 4, NULL, 1, '', 904086400469);
INSERT INTO `tb_produtos` VALUES (17, 'Dolaren Plus', 'analgésico', 13, 'Comprimido', 356.00, 550.00, 20, 'Disponível', 9, '2023-01-10', '2026-01-09', '2025-01-13 14:29:21', '2025-01-13 13:29:21', 130, 1, NULL, 1, '', 8900643325167);
INSERT INTO `tb_produtos` VALUES (18, 'Dolaren Rápido', 'analgésico antipirético', 13, 'Comprimido', 252.00, 400.00, 20, 'Disponível', 9, '2023-01-05', '2026-01-04', '2025-01-13 14:33:53', '2025-01-13 13:33:53', 130, 1, NULL, 1, '', 8906043325150);
INSERT INTO `tb_produtos` VALUES (19, 'Mucoril xarope', 'expectorante', 13, 'Comprimido', 1050.00, 1700.00, 10, 'Disponível', 9, '2024-01-03', '2027-01-02', '2025-01-13 14:38:25', '2025-01-13 13:38:25', 130, 2, NULL, 1, '', 5700);
INSERT INTO `tb_produtos` VALUES (20, 'Dolaren Plus Gel', 'Balsamo', 13, 'Comprimido', 780.00, 1200.00, 10, 'Disponível', 9, '2023-01-04', '2026-01-03', '2025-01-13 14:41:43', '2025-01-13 13:41:43', 130, 4, NULL, 1, '', 8904086400810);
INSERT INTO `tb_produtos` VALUES (21, 'Dolaren Gel', 'Balsamo', 13, 'Comprimido', 660.00, 1000.00, 10, 'Disponível', 9, '2023-01-04', '2026-01-09', '2025-01-13 14:44:07', '2025-01-13 13:44:07', 130, 4, NULL, 1, '', 8904086400803);
INSERT INTO `tb_produtos` VALUES (22, 'Simba Kof xarope', 'Expectorante', 13, 'Comprimido', 860.00, 1300.00, 10, 'Disponível', 9, '2024-01-07', '2027-01-05', '2025-01-13 14:46:35', '2025-01-13 13:46:35', 130, 2, NULL, 1, '', 8906046110661);
INSERT INTO `tb_produtos` VALUES (23, 'Ibunal Forte', 'anti enflamatorio analgésico', 13, 'Comprimido', 337.00, 550.00, 20, 'Disponível', 9, '2024-02-03', '2028-01-02', '2025-01-13 14:51:44', '2025-01-13 13:51:44', 130, 1, NULL, 1, '', 18904086402132);
INSERT INTO `tb_produtos` VALUES (24, 'Bronex criança xarope', 'Expectorante', 13, 'Comprimido', 450.00, 1000.00, 5, 'Disponível', 8, '2024-01-07', '2027-01-06', '2025-01-13 15:00:57', '2025-01-13 14:00:57', 130, 2, NULL, 1, '', 18904286615103);
INSERT INTO `tb_produtos` VALUES (25, 'Fluconazol 150mg', 'antifugico', 13, 'Comprimido', 125.00, 300.00, 10, 'Disponível', 8, '2024-01-07', '2027-01-06', '2025-01-13 15:14:35', '2025-01-13 14:14:35', 130, 1, NULL, 1, '', 38904286620415);
INSERT INTO `tb_produtos` VALUES (26, 'Februx ibuprofeno', 'analgésico', 13, 'Comprimido', 330.00, 700.00, 10, 'Disponível', 8, '2024-01-06', '2027-01-05', '2025-01-13 15:18:49', '2025-01-13 14:18:49', 130, 2, NULL, 1, '', 18904286601625);
INSERT INTO `tb_produtos` VALUES (27, 'C8 comprimido', 'para fome', 13, 'Comprimido', 35.00, 200.00, 50, 'Disponível', 8, '2024-01-08', '2027-01-07', '2025-01-13 15:26:40', '2025-01-13 14:26:40', 130, 1, NULL, 1, '', 18904286622828);
INSERT INTO `tb_produtos` VALUES (28, 'Fasnexkit', 'antifugico', 13, 'Comprimido', 890.00, 1500.00, 5, 'Disponível', 8, '2024-01-08', '2027-01-07', '2025-01-13 15:30:13', '2025-01-13 14:30:13', 130, 1, NULL, 1, '', 18904286626086);
INSERT INTO `tb_produtos` VALUES (29, 'Leite de Magnesio', 'antiácido', 13, 'Comprimido', 590.00, 1200.00, 5, 'Disponível', 8, '2024-01-07', '2027-01-06', '2025-01-13 15:34:02', '2025-01-13 14:34:02', 130, 2, NULL, 1, '', 18904286608426);
INSERT INTO `tb_produtos` VALUES (30, 'vitamina B6 comprimido', 'para nauseas', 13, 'Comprimido', 95.00, 250.00, 30, 'Disponível', 8, '2024-01-06', '2027-01-05', '2025-01-13 15:38:50', '2025-01-13 14:38:50', 130, 1, NULL, 1, '', 1890486614922);
INSERT INTO `tb_produtos` VALUES (31, 'Vitamina c fervescente', 'imunidade', 13, 'Comprimido', 1950.00, 3500.00, 2, 'Disponível', 8, '2024-01-07', '2027-01-06', '2025-01-13 15:43:42', '2025-01-13 14:43:42', 130, 1, NULL, 1, '', 18904286612560);
INSERT INTO `tb_produtos` VALUES (32, 'Vitamina c fervescente/zinco', 'imunidade', 13, 'Comprimido', 1800.00, 3500.00, 1, 'Disponível', 8, '2024-01-07', '2027-01-06', '2025-01-13 15:46:35', '2025-01-13 14:46:35', 130, 1, NULL, 1, '', 18904286621166);
INSERT INTO `tb_produtos` VALUES (33, 'Vitamina B6 xarope', 'náusea', 13, 'Comprimido', 340.00, 700.00, 5, 'Disponível', 8, '2024-01-06', '2027-01-05', '2025-01-13 15:52:58', '2025-01-13 14:52:58', 130, 2, NULL, 1, '', 18904286606590);
INSERT INTO `tb_produtos` VALUES (34, 'Ranitidina 150mg', 'antiácido', 13, 'Comprimido', 135.00, 300.00, 10, 'Disponível', 8, '2023-01-12', '2026-01-11', '2025-01-13 15:56:54', '2025-01-13 14:56:54', 130, 1, NULL, 1, '', 18904286609324);
INSERT INTO `tb_produtos` VALUES (35, 'Ranitidina 300mg', 'antiácido', 13, 'Comprimido', 240.00, 400.00, 10, 'Disponível', 8, '2023-01-09', '2026-01-08', '2025-01-13 16:00:15', '2025-01-13 15:00:15', 130, 1, NULL, 1, '', 18904286638584);
INSERT INTO `tb_produtos` VALUES (37, 'Bebe gel indiano', 'laxante', 13, 'Comprimido', 396.00, 1000.00, 12, 'Disponível', 8, '2024-01-07', '2027-01-06', '2025-01-13 19:23:17', '2025-01-13 18:23:17', 130, 7, NULL, 1, '', 18904286636816);
INSERT INTO `tb_produtos` VALUES (38, 'sabonete de enxofre indiano', 'Dérmica', 14, 'Comprimido', 600.00, 1100.00, 4, 'Disponível', 8, '2024-01-08', '2027-01-07', '2025-01-13 19:27:04', '2025-01-13 18:27:04', 130, 7, NULL, 1, '', 18904286610900);
INSERT INTO `tb_produtos` VALUES (39, 'sabonete de glicerina indiano', 'dérmico', 14, 'Comprimido', 600.00, 1100.00, 4, 'Disponível', 8, '2024-01-08', '2027-01-07', '2025-01-13 19:35:21', '2025-01-13 18:35:21', 130, 7, NULL, 1, '', 18904286609799);
INSERT INTO `tb_produtos` VALUES (40, 'Água oxigenada', 'uso externo', 14, 'Comprimido', 465.00, 850.00, 3, 'Disponível', 8, '2023-01-24', '2026-08-01', '2025-01-13 19:41:13', '2025-01-13 18:41:13', 130, 7, NULL, 1, '', 24048);
INSERT INTO `tb_produtos` VALUES (41, 'vaselina pura', 'lubrificação', 14, 'Comprimido', 396.00, 700.00, 4, 'Disponível', 8, '2024-02-07', '2027-01-06', '2025-01-13 19:45:57', '2025-01-13 18:45:57', 130, 7, NULL, 1, '', 8904286622548);
INSERT INTO `tb_produtos` VALUES (42, 'Omeprazol 40mg indiano', 'antiácido', 13, 'Comprimido', 210.00, 350.00, 10, 'Disponível', 8, '2023-01-11', '2026-01-10', '2025-01-13 19:55:34', '2025-01-13 18:55:34', 130, 1, NULL, 1, '', 18904286639406);
INSERT INTO `tb_produtos` VALUES (43, 'paracetamol 125mg xarope', 'analgésico', 13, 'Comprimido', 310.00, 700.00, 5, 'Disponível', 8, '2024-01-07', '2027-01-06', '2025-01-13 19:58:11', '2025-01-13 18:58:11', 130, 2, NULL, 1, '', 18904286610245);
INSERT INTO `tb_produtos` VALUES (44, 'paracetamol 250mg xarope indiano', 'analgésico', 13, 'Comprimido', 360.00, 850.00, 5, 'Disponível', 8, '2024-01-07', '2027-01-06', '2025-01-13 20:00:04', '2025-01-13 19:00:04', 130, 2, NULL, 1, '', 18904286617619);
INSERT INTO `tb_produtos` VALUES (45, 'Trancozema', 'DÉRMICA', 14, 'Comprimido', 435.00, 1000.00, 36, 'Disponível', 8, '2024-01-07', '2026-01-12', '2025-01-13 20:04:33', '2025-01-13 19:04:33', 130, 4, NULL, 1, '', 1008904182620198);
INSERT INTO `tb_produtos` VALUES (46, 'Trancozema Sabonete', 'dérmica', 14, 'Comprimido', 500.00, 1000.00, 20, 'Disponível', 8, '2024-01-06', '2027-01-05', '2025-01-13 20:07:01', '2025-01-13 19:07:01', 130, 4, NULL, 1, '', 18904182620577);
INSERT INTO `tb_produtos` VALUES (47, 'mama tenho fome cp', 'estimulante de apetite', 13, 'Comprimido', 150.00, 300.00, 30, 'Disponível', 8, '2023-05-01', '2026-11-11', '2025-01-13 20:11:00', '2025-01-13 19:11:00', 130, 1, NULL, 1, '', 8904182613510);
INSERT INTO `tb_produtos` VALUES (48, 'c4', 'estimulante de apetite', 13, 'Comprimido', 40.00, 150.00, 50, 'Disponível', 5, '2022-01-09', '2025-01-08', '2025-01-13 20:26:02', '2025-01-13 19:26:02', 130, 1, NULL, 1, '', 18904182603426);
INSERT INTO `tb_produtos` VALUES (49, 'Dexacort cp indiano', 'ANTI Inflamatorio', 13, 'Comprimido', 60.00, 200.00, 50, 'Disponível', 5, '2024-01-07', '2027-01-06', '2025-01-13 20:36:52', '2025-01-13 19:36:52', 130, 1, NULL, 1, '', 18904182604171);
INSERT INTO `tb_produtos` VALUES (50, 'Mascara', 'Proteção facial', 14, 'Comprimido', 32.00, 100.00, 100, 'Disponível', 8, '2024-03-03', '2029-02-02', '2025-01-16 19:20:08', '2025-01-16 18:20:09', 129, 7, NULL, 50, '', 18904286618944);
INSERT INTO `tb_produtos` VALUES (51, 'Dipirona', 'Alivio da dor', 13, 'Comprimido', 180.00, 300.00, 50, 'Disponível', 8, '2024-08-08', '2024-07-07', '2025-01-16 19:26:56', '2025-01-16 18:26:56', 129, 6, NULL, 1, '', 18904286643212);
INSERT INTO `tb_produtos` VALUES (52, 'Yodafar', 'Para gestante', 13, 'Comprimido', 5345.00, 8000.00, 2, 'Disponível', 8, '2024-01-01', '2027-11-11', '2025-01-16 19:48:38', '2025-01-16 18:48:38', 129, 1, NULL, 25, '', 84700066079);
INSERT INTO `tb_produtos` VALUES (53, 'Lauroderme', 'Assadura', 14, 'Comprimido', 6965.00, 10500.00, 1, 'Disponível', 8, '2025-01-16', '2028-02-02', '2025-01-16 20:13:06', '2025-01-16 19:13:06', 129, 4, NULL, 1, '', 3395894);
INSERT INTO `tb_produtos` VALUES (54, 'Eritromecina', 'Inflamação', 13, 'Comprimido', 450.00, 700.00, 10, 'Disponível', 8, '2023-02-02', '2026-01-01', '2025-01-16 20:19:00', '2025-01-16 19:19:00', 129, 1, NULL, 10, '', 18904286609652);
INSERT INTO `tb_produtos` VALUES (55, 'Azitromecina', 'para infecção', 13, 'Comprimido', 1945.00, 2950.00, 1, 'Disponível', 8, '2025-01-16', '2026-04-04', '2025-01-16 20:24:20', '2025-01-16 19:24:20', 129, 1, NULL, 3, '', 10249405649829);
INSERT INTO `tb_produtos` VALUES (56, 'Amoxaxiclina 500mg', 'antibiotico', 13, 'Comprimido', 572.00, 900.00, 12, 'Disponível', 8, '2025-01-16', '2025-09-09', '2025-01-16 20:29:45', '2025-01-16 19:29:45', 129, 1, NULL, 4, '', 5819008);
INSERT INTO `tb_produtos` VALUES (57, 'Triplexil', 'alergia', 15, 'Comprimido', 3835.00, 5750.00, 2, 'Disponível', 8, '2025-01-16', '2027-08-08', '2025-01-16 20:33:23', '2025-01-16 19:33:23', 129, 4, NULL, 1, '', 5603690000838);
INSERT INTO `tb_produtos` VALUES (58, 'Penicilina 125mg', 'infecção', 13, 'Comprimido', 540.00, 900.00, 5, 'Disponível', 8, '2024-01-01', '2026-12-12', '2025-01-16 20:37:33', '2025-01-16 19:37:33', 129, 2, NULL, 1, '', 18904286634258);
INSERT INTO `tb_produtos` VALUES (59, 'Penicilina250mg', 'infecção', 13, 'Comprimido', 690.00, 1100.00, 5, 'Disponível', 8, '2024-03-03', '2027-02-02', '2025-01-16 20:39:55', '2025-01-16 19:39:55', 129, 2, NULL, 1, '', 18904288620787);
INSERT INTO `tb_produtos` VALUES (60, 'Amoxaciclina e clavunato', 'infecção', 13, 'Comprimido', 775.00, 1200.00, 5, 'Disponível', 8, '2024-07-07', '2027-06-06', '2025-01-16 20:44:17', '2025-01-16 19:44:17', 129, 2, NULL, 1, '', 18904286608693);
INSERT INTO `tb_produtos` VALUES (61, 'Amoxaciclina e clavunato250/62.5mg', 'infec', 13, 'Comprimido', 1150.00, 1740.00, 5, 'Disponível', 8, '2024-07-07', '2027-06-06', '2025-01-16 20:47:02', '2025-01-16 19:47:02', 129, 2, NULL, 1, '', 18904286608686);
INSERT INTO `tb_produtos` VALUES (62, 'Ciprofloxacina250mg', 'febretifoide', 13, 'Comprimido', 675.00, 1300.00, 5, 'Disponível', 8, '2024-05-05', '2027-04-04', '2025-01-16 20:53:26', '2025-01-16 19:53:26', 129, 2, NULL, 1, '', 18804288609812);
INSERT INTO `tb_produtos` VALUES (63, 'Ambroxol30mg', 'para tosse', 13, 'Comprimido', 540.00, 900.00, 5, 'Disponível', 8, '2027-03-03', '2027-03-03', '2025-01-16 20:56:05', '2025-01-16 19:56:05', 129, 2, NULL, 1, '', 18904286612409);
INSERT INTO `tb_produtos` VALUES (64, 'Ambroxol 15mg', 'tosse', 13, 'Comprimido', 475.00, 800.00, 5, 'Disponível', 8, '2024-07-07', '2027-06-06', '2025-01-16 20:58:48', '2025-01-16 19:58:48', 129, 2, NULL, 1, '', 18904286612416);
INSERT INTO `tb_produtos` VALUES (65, 'Clorofenamina 4mg', 'Antialergico', 13, 'Comprimido', 35.00, 100.00, 30, 'Disponível', 8, '2024-04-04', '2027-03-03', '2025-01-16 21:02:31', '2025-01-16 20:02:31', 129, 1, NULL, 10, '', 18984288606318);
INSERT INTO `tb_produtos` VALUES (66, 'Buscopan 10mg', 'Dor de barriga', 13, 'Comprimido', 416.00, 700.00, 6, 'Disponível', 8, '2024-02-02', '2027-01-01', '2025-01-16 21:11:18', '2025-01-16 20:11:18', 129, 1, NULL, 10, '', 18904286600758);
INSERT INTO `tb_produtos` VALUES (67, 'Buscopan 10+500mg', 'dor', 13, 'Comprimido', 441.00, 700.00, 6, 'Disponível', 8, '2024-02-02', '2027-02-02', '2025-01-16 21:15:40', '2025-01-16 20:15:40', 129, 1, NULL, 10, '', 18904286632001);
INSERT INTO `tb_produtos` VALUES (68, 'Cefalexina 500mg', 'para infecção', 13, 'Comprimido', 580.00, 900.00, 12, 'Disponível', 8, '2024-01-01', '2027-01-01', '2025-01-16 21:19:24', '2025-01-16 20:19:24', 129, 1, NULL, 10, '', 7987378882289);
INSERT INTO `tb_produtos` VALUES (69, 'Bissacodil 5mg', 'Rexante', 13, 'Comprimido', 59.00, 100.00, 30, 'Disponível', 8, '2023-07-07', '2026-06-06', '2025-01-16 21:23:24', '2025-01-16 20:23:24', 129, 1, NULL, 10, '', 6290360152073);
INSERT INTO `tb_produtos` VALUES (70, 'Solução Vaginal', 'lavagem intima', 14, 'Comprimido', 2700.00, 4500.00, 3, 'Disponível', 8, '2024-07-07', '2027-06-06', '2025-01-16 21:27:58', '2025-01-16 20:27:58', 129, 7, NULL, 1, '', 18904286621234);
INSERT INTO `tb_produtos` VALUES (71, 'Clotrimazol ovulos Vaginal bp100mg', 'antibiotico', 14, 'Comprimido', 320.00, 500.00, 10, 'Disponível', 8, '2024-07-07', '2027-06-06', '2025-01-16 21:32:30', '2025-01-16 20:32:30', 129, 7, NULL, 1, '', 18904286612034);
INSERT INTO `tb_produtos` VALUES (72, 'Metronidazol vaginal óvulos 500mg', 'Óvulos', 14, 'Comprimido', 370.00, 600.00, 10, 'Disponível', 8, '2024-04-04', '2027-03-03', '2025-01-16 21:36:02', '2025-01-16 20:36:02', 129, 7, NULL, 1, '', 18904286610542);
INSERT INTO `tb_produtos` VALUES (73, 'Óvulos vaginais', 'Óvulos', 14, 'Comprimido', 590.00, 900.00, 10, 'Disponível', 8, '0024-05-05', '2027-04-04', '2025-01-16 21:38:49', '2025-01-16 20:38:49', 129, 7, NULL, 1, '', 18904288606675);
INSERT INTO `tb_produtos` VALUES (74, 'Luvas', 'protecção', 25, 'Comprimido', 35.00, 200.00, 200, 'Disponível', 4, '2024-10-16', '2029-10-15', '2025-01-16 21:48:42', '2025-01-16 20:48:42', 129, 7, NULL, 1, '', 212030486);
INSERT INTO `tb_produtos` VALUES (76, 'Cotrimoxazol 480mg', 'antibiotico', 13, 'Comprimido', 299.00, 450.00, 250, 'Disponível', 8, '2024-09-09', '2026-08-08', '2025-01-16 22:05:46', '2025-01-16 21:05:46', 129, 1, NULL, 10, '', 6290360153971);
INSERT INTO `tb_produtos` VALUES (77, 'Cloridrato de pseudoefedrina+cloridrato de triprolidina', 'antibiotico', 13, 'Comprimido', 2700.00, 4000.00, 1, 'Disponível', 8, '2025-01-16', '2027-02-02', '2025-01-16 22:08:35', '2025-01-16 21:08:35', 129, 2, NULL, 1, '', 8559104);
INSERT INTO `tb_produtos` VALUES (78, 'Metocloramida', 'antibiotico', 13, 'Comprimido', 62.00, 150.00, 100, 'Disponível', 8, '2023-09-09', '2026-08-08', '2025-01-16 22:11:48', '2025-01-16 21:11:48', 129, 1, NULL, 10, '', 62900360154084);
INSERT INTO `tb_produtos` VALUES (79, 'Azitromicina 500mg', 'infecção', 13, 'Comprimido', 620.00, 950.00, 10, 'Disponível', 8, '2024-05-05', '0026-02-04', '2025-01-16 22:15:29', '2025-01-16 21:15:29', 129, 1, NULL, 3, '', 26290360151285);
INSERT INTO `tb_produtos` VALUES (80, 'Óvulos metronidazol 500mg', 'Óvulos', 14, 'Comprimido', 6400.00, 9500.00, 1, 'Disponível', 8, '2028-01-16', '2028-04-04', '2025-01-16 22:19:20', '2025-01-16 21:19:20', 129, 7, NULL, 1, '', 9267401);
INSERT INTO `tb_produtos` VALUES (81, 'Penicilina injetavel 2.4mega', 'infecção', 13, 'Comprimido', 268.00, 400.00, 25, 'Disponível', 8, '2024-06-06', '2027-05-05', '2025-01-16 22:23:50', '2025-01-16 21:23:50', 129, 6, NULL, 1, '', 8907821106923);
INSERT INTO `tb_produtos` VALUES (82, 'Salbumol 2mg', 'Tosse', 13, 'Comprimido', 65.00, 150.00, 500, 'Disponível', 8, '2023-10-10', '2026-09-09', '2025-01-17 08:59:27', '2025-01-17 07:59:27', 129, 1, NULL, 10, '', 6290360154299);
INSERT INTO `tb_produtos` VALUES (83, 'Salbumol 4mg', 'Tosse', 13, 'Comprimido', 80.00, 150.00, 500, 'Disponível', 8, '2024-07-01', '2027-06-01', '2025-01-17 09:13:31', '2025-01-17 08:13:31', 129, 1, NULL, 10, '', 6290360154305);
INSERT INTO `tb_produtos` VALUES (84, 'Vitamina C Injetavel 500mg', 'antibiotico', 13, 'Comprimido', 69.00, 150.00, 100, 'Disponível', 8, '2024-06-01', '2027-05-01', '2025-01-17 09:18:11', '2025-01-17 08:18:11', 129, 6, NULL, 1, '', 8904232737951);
INSERT INTO `tb_produtos` VALUES (85, 'Ampicilina Injetavel 1gram', 'antibiotico', 13, 'Comprimido', 240.00, 400.00, 50, 'Disponível', 8, '2024-03-01', '2027-02-01', '2025-01-17 09:21:42', '2025-01-17 08:21:42', 129, 6, NULL, 1, '', 8904206224623);
INSERT INTO `tb_produtos` VALUES (86, 'Amoxaciclina injetavel 1g', 'antibiotico', 13, 'Comprimido', 220.00, 350.00, 50, 'Disponível', 8, '2024-06-01', '2027-05-01', '2025-01-17 09:25:01', '2025-01-17 08:25:01', 129, 6, NULL, 1, '', 8904206224616);
INSERT INTO `tb_produtos` VALUES (87, 'Fortifed procaina penicilina injetavel 1mega', 'antibiotico', 13, 'Comprimido', 220.00, 350.00, 50, 'Disponível', 8, '2023-03-01', '2026-08-01', '2025-01-17 09:28:04', '2025-01-17 08:28:04', 129, 6, NULL, 1, '', 89042327373954);
INSERT INTO `tb_produtos` VALUES (88, 'Ciproheptadina com multivitamina 20çl', 'vitamina', 13, 'Comprimido', 1100.00, 1650.00, 5, 'Disponível', 5, '2024-03-03', '2026-05-01', '2025-01-17 09:52:24', '2025-01-17 08:52:24', 129, 2, NULL, 1, '', 22222222222);
INSERT INTO `tb_produtos` VALUES (89, 'ciproheptadinaBP 4mg', 'multivitana', 13, 'Comprimido', 133.00, 200.00, 15, 'Disponível', 5, '2022-09-01', '2025-08-01', '2025-01-17 10:19:21', '2025-01-17 09:19:21', 129, 1, NULL, 10, '', 18904182604426);
INSERT INTO `tb_produtos` VALUES (91, 'Dexametazona 0,5mg', 'multivitana', 13, 'Comprimido', 60.00, 150.00, 50, 'Disponível', 5, '2024-07-01', '2027-06-01', '2025-01-17 10:26:22', '2025-01-17 09:26:22', 129, 1, NULL, 10, '', 3333333333);
INSERT INTO `tb_produtos` VALUES (92, 'Multivitamina', 'multivitana', 13, 'Comprimido', 60.00, 200.00, 50, 'Disponível', 5, '2024-04-01', '2027-03-01', '2025-01-17 10:30:34', '2025-01-17 09:30:34', 129, 1, NULL, 10, '', 8904232761383);
INSERT INTO `tb_produtos` VALUES (93, 'Trancozema 30g', 'tirar manchas', 15, 'Comprimido', 416.00, 700.00, 24, 'Disponível', 5, '2024-07-01', '2026-12-01', '2025-01-17 10:41:27', '2025-01-17 09:41:27', 129, 4, NULL, 1, '', 8904182620198);
INSERT INTO `tb_produtos` VALUES (94, 'Vitamina C500mg', 'vitamina', 13, 'Comprimido', 199.00, 350.00, 100, 'Disponível', 7, '2024-07-01', '2027-06-01', '2025-01-17 10:59:31', '2025-01-17 09:59:31', 129, 1, NULL, 10, '', 8904232760362);
INSERT INTO `tb_produtos` VALUES (95, 'Clorafenicol 250mg', 'antibiotico', 13, 'Comprimido', 175.00, 300.00, 100, 'Disponível', 7, '2024-06-01', '2027-05-01', '2025-01-17 11:03:57', '2025-01-17 10:03:57', 129, 3, NULL, 10, '', 6290360154565);
INSERT INTO `tb_produtos` VALUES (96, 'Iodopovidona 10%', 'limpeza feridas', 18, 'Comprimido', 879.00, 1350.00, 5, 'Disponível', 7, '2025-01-17', '2027-06-01', '2025-01-17 11:09:19', '2025-01-17 10:09:19', 129, 7, NULL, 1, '', 5600341000452);
INSERT INTO `tb_produtos` VALUES (97, 'Acido folico 5mg', 'gravidas', 13, 'Comprimido', 52.00, 200.00, 100, 'Disponível', 7, '2024-06-01', '2027-05-01', '2025-01-17 11:27:48', '2025-01-17 10:27:48', 129, 1, NULL, 10, '', 6290360152134);
INSERT INTO `tb_produtos` VALUES (98, 'Adesivo', 'cobrir ferimentos', 14, 'Comprimido', 345.00, 700.00, 12, 'Disponível', 7, '2024-06-01', '2029-05-01', '2025-01-17 11:30:29', '2025-01-17 10:30:29', 129, 7, NULL, 1, '', 8904206238804);
INSERT INTO `tb_produtos` VALUES (99, 'Álcool 70%', 'desinfetação', 14, 'Comprimido', 500.00, 900.00, 6, 'Disponível', 7, '2024-12-01', '2027-11-01', '2025-01-17 11:36:52', '2025-01-17 10:36:52', 129, 7, NULL, 1, '', 8904206223756);
INSERT INTO `tb_produtos` VALUES (100, 'Alivio 100ml', 'tosse', 13, 'Comprimido', 370.00, 700.00, 10, 'Disponível', 7, '2024-02-01', '2027-01-01', '2025-01-17 11:56:35', '2025-01-17 10:56:35', 129, 2, NULL, 1, '', 6290360150444);
INSERT INTO `tb_produtos` VALUES (101, 'Amoxaciclina 125mg', 'antibiotico', 13, 'Comprimido', 495.00, 800.00, 10, 'Disponível', 7, '2024-02-01', '2026-01-01', '2025-01-17 12:00:25', '2025-01-17 11:00:25', 129, 2, NULL, 1, '', 6290360151397);
INSERT INTO `tb_produtos` VALUES (102, 'Amoxaciclina 250mg', 'antibiotico', 13, 'Comprimido', 510.00, 850.00, 10, 'Disponível', 7, '2024-03-01', '2026-02-01', '2025-01-17 12:03:53', '2025-01-17 11:03:53', 129, 2, NULL, 1, '', 6290360151403);

-- ----------------------------
-- Table structure for tb_provincia
-- ----------------------------
DROP TABLE IF EXISTS `tb_provincia`;
CREATE TABLE `tb_provincia`  (
  `cod_provincia` int NOT NULL AUTO_INCREMENT,
  `designacao_provincia` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `cod_pais` int NOT NULL,
  PRIMARY KEY (`cod_provincia`) USING BTREE,
  INDEX `cod_pais`(`cod_pais` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tb_provincia
-- ----------------------------

-- ----------------------------
-- Table structure for tb_sexo
-- ----------------------------
DROP TABLE IF EXISTS `tb_sexo`;
CREATE TABLE `tb_sexo`  (
  `id_sexo` int NOT NULL AUTO_INCREMENT,
  `designacao_sexo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_sexo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_sexo
-- ----------------------------
INSERT INTO `tb_sexo` VALUES (1, 'Masculino');
INSERT INTO `tb_sexo` VALUES (2, 'Feminino');

-- ----------------------------
-- Table structure for tb_status
-- ----------------------------
DROP TABLE IF EXISTS `tb_status`;
CREATE TABLE `tb_status`  (
  `id_status` int NOT NULL AUTO_INCREMENT,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_status
-- ----------------------------
INSERT INTO `tb_status` VALUES (1, 'Disponível');
INSERT INTO `tb_status` VALUES (2, 'Indisponível');

-- ----------------------------
-- Table structure for tb_tipo_documento
-- ----------------------------
DROP TABLE IF EXISTS `tb_tipo_documento`;
CREATE TABLE `tb_tipo_documento`  (
  `id_tipo_documento` int NOT NULL AUTO_INCREMENT,
  `designacao_tipo_doc` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_tipo_documento`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_tipo_documento
-- ----------------------------
INSERT INTO `tb_tipo_documento` VALUES (1, 'Bilhete de Identidade');
INSERT INTO `tb_tipo_documento` VALUES (2, 'Passaporte');
INSERT INTO `tb_tipo_documento` VALUES (3, 'Cédula Pessoal');
INSERT INTO `tb_tipo_documento` VALUES (4, 'Cartão de Residência');
INSERT INTO `tb_tipo_documento` VALUES (5, 'Outro');

-- ----------------------------
-- Table structure for tb_tipo_produto
-- ----------------------------
DROP TABLE IF EXISTS `tb_tipo_produto`;
CREATE TABLE `tb_tipo_produto`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `descrição` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_tipo_produto
-- ----------------------------
INSERT INTO `tb_tipo_produto` VALUES (1, 'Comprimitos', '2025-01-05 16:34:35', 0);
INSERT INTO `tb_tipo_produto` VALUES (2, 'Xarope', '2025-01-05 16:34:35', 0);
INSERT INTO `tb_tipo_produto` VALUES (3, 'Cápsula', '2025-01-05 16:34:35', 0);
INSERT INTO `tb_tipo_produto` VALUES (4, 'Pomada', '2025-01-05 16:34:35', 0);
INSERT INTO `tb_tipo_produto` VALUES (5, 'Supositório', '2025-01-05 17:13:04', 0);
INSERT INTO `tb_tipo_produto` VALUES (6, 'Injetável', '2025-01-05 17:13:04', 0);
INSERT INTO `tb_tipo_produto` VALUES (7, 'Outro', '2025-01-05 21:31:35', 0);

-- ----------------------------
-- Table structure for tb_tipo_uh
-- ----------------------------
DROP TABLE IF EXISTS `tb_tipo_uh`;
CREATE TABLE `tb_tipo_uh`  (
  `id_tipo_uh` int NOT NULL AUTO_INCREMENT,
  `designacao_tipo_uh` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `cod_usuario` int NULL DEFAULT NULL,
  `created` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id_tipo_uh`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_tipo_uh
-- ----------------------------
INSERT INTO `tb_tipo_uh` VALUES (1, 'Hospital Público', NULL, NULL);
INSERT INTO `tb_tipo_uh` VALUES (2, 'Clínica', NULL, NULL);
INSERT INTO `tb_tipo_uh` VALUES (3, 'Centro Médico', NULL, NULL);
INSERT INTO `tb_tipo_uh` VALUES (4, 'Consultório médico', NULL, NULL);
INSERT INTO `tb_tipo_uh` VALUES (5, 'Consultório Dentário', 101, '2022-04-11 16:09:14');

-- ----------------------------
-- Table structure for tb_u_e_o
-- ----------------------------
DROP TABLE IF EXISTS `tb_u_e_o`;
CREATE TABLE `tb_u_e_o`  (
  `cod_unidade` int NOT NULL AUTO_INCREMENT,
  `designacao_unidade` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `cod_ramo` int NOT NULL,
  `cod_regiao` int NOT NULL,
  `created` datetime NOT NULL,
  `abreviatura` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`cod_unidade`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tb_u_e_o
-- ----------------------------
INSERT INTO `tb_u_e_o` VALUES (1, 'GAB.CEMGFAA', 1, 11, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (2, 'GAB.CEMGAdjunto para Educação Patriotica', 1, 11, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (3, 'GAB.CEMG Adjunto Area Operativa', 1, 11, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (4, 'GAB. Conselheiros', 1, 11, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (5, 'Triunal Supremo', 1, 11, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (6, 'Procuradoria', 1, 11, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (7, 'Inspecção EMG', 1, 11, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (8, 'GAB.VCEMG para Logistica', 1, 11, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (9, 'GAB.VCEMG para Area Social', 1, 11, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (10, 'CSDM- Conselho Superior de Disciplina Miliatr', 1, 11, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (11, 'DPEP- Direcção Principal de Educação Patriotica', 1, 11, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (12, 'DPPO- Direcção Principal de Planeamento e Organiza', 1, 11, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (13, 'DPPQ- Direcção Principal de Pessoal e Quadros', 1, 11, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (14, 'DPPTE- Direcção Principal de Preparação de Tropas ', 1, 11, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (15, 'DPO- Direcção Principal de Operações', 1, 11, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (16, 'DSGCM', 1, 11, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (17, 'DPAT- Direcção Principal de Armamento e Tecnica', 1, 11, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (18, 'ESG- Escola Superior de Guerras', 1, 11, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (19, 'DSS- Direcção de Serviços de Saúde', 1, 11, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (20, 'HMP- Hospital Militar Principal', 1, 11, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (21, 'DPL- Direcção Principal de Logistica', 1, 11, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (22, 'BCA Numero 2', 1, 11, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (23, 'BCA Numero 3', 1, 11, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (24, 'DAF- Direcção de Administração e Finanças', 1, 11, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (25, 'DPJM- Direcção da Policia Judiciaria Militar', 1, 11, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (26, 'DPM- Direcção da Policia Militar', 1, 11, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (27, 'DSP- Direcção dos Serviços Penitenciario', 1, 11, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (28, 'Direcção de Telecomunicações', 1, 11, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (29, 'Centro Permanente de Telecomunicações', 1, 11, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (30, 'Centro de Correiro Militar', 1, 11, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (31, 'Deposito de Materia de Telecomunicações', 1, 11, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (32, '6 Direcção', 1, 11, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (33, 'ISTM- Instituto Tecnico Superior Militar', 1, 11, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (34, 'DOI- Direcção de Organização e Infraestrutura', 1, 11, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (35, 'Direcção de Guerra Psicologica', 1, 11, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (36, 'GICI- Gabinete de Intercambio', 1, 11, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (37, 'DEIM', 1, 11, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (38, 'Museu Central das FAA', 1, 11, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (39, 'Gabinete Juridico', 1, 11, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (40, 'DI- Direcção de Informática', 1, 11, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (41, 'UA- Unidade de Apoio', 1, 11, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (42, 'Arquivo Geral das FAA', 1, 11, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (43, 'BRIFE- Brigada de Forças Especiais ', 1, 11, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (44, 'EFFE- Escola de Formação de Forças Especiais', 1, 11, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (45, 'Estado-Maior General', 1, 11, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (46, 'Comando da Regiao Militar de Luanda', 1, 11, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (47, 'Brigada de Apoio Tactico Operacional (BATOP)', 1, 11, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (48, 'Regimento de Destinacao  Especial', 1, 11, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (49, 'Colegio Militar', 1, 11, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (50, 'Escola de Especialistas Menores de Logistica', 1, 11, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (51, 'Presidio Militar', 1, 11, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (52, 'Centro Permanente de Telecomunicacoes', 1, 11, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (53, 'Centro de Criptologia', 1, 11, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (54, 'Centro de Radio Escuta', 1, 11, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (55, 'Junta Medica Militar Central', 1, 11, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (56, 'Laboratorio Militar de Produtos Quimicos e Farma', 1, 11, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (57, 'Centro Militar de Higiene e Epidemiologia', 1, 11, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (58, 'Farmacia Central', 1, 11, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (59, 'BCA Numero 1', 1, 11, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (60, 'Batalhao de Transporte Rodoviario', 1, 11, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (61, 'Batalhaoo de Apoio Medico', 1, 11, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (62, 'Unidade Penitencia¡ria de Prisao Preventiva', 1, 11, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (63, 'Unidade de Cuidados Continuados da Regiao Militar', 1, 11, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (64, 'Laboratorio Central de Metrologia', 1, 11, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (65, 'Regimento de Policia Militar', 1, 11, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (66, 'Comando e Estado-Maior do Exercito', 2, 12, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (67, 'Comando da Servidao Militar de Maria Teresa', 2, 12, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (68, 'Campo Militar do Grafanil', 2, 12, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (69, '101- Brigada de Tanques', 2, 12, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (70, 'Brigada de Artilharia de Campanha', 2, 12, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (71, 'Regimento de Defesa Antiaerea', 2, 12, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (72, 'Regimento de Engenharia de Construcao', 2, 12, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (73, 'Regimento de Engenharia', 2, 12, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (74, 'Banda de Musica das Forcas Armadas', 2, 12, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (75, 'Centro de Criptologia', 2, 12, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (76, 'Centro de Classificacao e Selecao', 2, 12, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (77, 'Companhia de Serviao de Pessoal', 2, 12, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (78, 'Museu do Exercito', 2, 12, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (79, 'Messe Central do Exercito', 2, 12, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (80, 'Clube Central do Exercito', 2, 12, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (81, 'Regimento de Manutencao de Armamento e Tecnica', 2, 12, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (82, 'Oficinas Gerais de Reparacao', 2, 12, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (83, 'Batalhao de Operacoes de Manutencao de Paz', 2, 12, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (84, 'Batalhao de Telecomunicacoes', 2, 12, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (85, 'Batalhao de Inteligencia Militar Operativa', 2, 12, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (86, 'Batalhaoo de Inteligencia Radiotecnica e Guerra ', 2, 12, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (87, 'Batalhao de Protecao Nuclear, Biologico e Qua', 2, 12, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (88, 'Base de Reparacao Geral de Armamento, Artilharia', 2, 12, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (89, 'Deposito Central de Abastecimento (Luanda)', 2, 12, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (90, 'Deposito Central de Abastecimento (Lobito)', 2, 12, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (91, 'Deposito Central de Abastecimento (Namibe)', 2, 12, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (92, 'Clinica do Exercito', 2, 12, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (93, 'Deposito Principal de Material de Guerra', 2, 12, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (94, 'Servicos Funerarios Centrais das FAA', 2, 12, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (95, 'Academia do Exercito', 2, 12, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (96, 'Instituto Superior do Exercito', 2, 12, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (97, 'Escola Inter-armas de Oficiais (Ntola)', 2, 12, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (98, 'Escola Inter-armas de Sargentos', 2, 12, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (99, 'Escola de Formacao de Condutores', 2, 12, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (100, 'Escola Pratica de Saude', 2, 12, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (101, 'Escola Pratica de Armamento e Electromecanica', 2, 12, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (102, 'Escola de Especializacao de Artilharia e DAA', 2, 12, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (103, 'Escola Pratica de Construcao', 2, 12, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (104, 'Centro de Instrucao de Tropas (Santa Eulilia)', 2, 12, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (105, 'Centro de Instrucao de Tropas (Luena)', 2, 12, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (106, 'Centro de Instrucaode Tropas (Matala)', 2, 12, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (107, 'Poligono Central do Exercito', 2, 12, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (108, 'Comando do 1º Corpo de Exercito', 2, 12, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (109, 'Comando do 2º Corpo de Exercito', 2, 12, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (110, 'Comando da Regiao Militar Cabinda', 2, 1, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (111, 'Grupo de Artilharia de Campanha', 2, 1, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (112, 'Grupo de Defesa Antiaerea', 2, 1, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (113, 'Companhia de Engenharia e Sapadores', 2, 1, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (114, 'Companhia de Reconhecimento', 2, 1, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (115, 'Companhia de Telecomunicacoes', 2, 1, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (116, 'Companhia de Logistica', 2, 1, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (117, 'Companhia de Manutencao', 2, 1, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (118, 'Companhia de Policia Militar', 2, 1, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (119, 'Hospital Militar Regional', 2, 1, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (120, 'Deposito de Material de Guerra', 2, 1, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (121, 'Deposito Regional de Produtos Quimicos e Farmacia', 2, 1, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (122, 'Poligono de Instrucao Inter-armas', 2, 1, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (123, 'Banda de Musica', 2, 1, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (124, 'Unidade de Prisao Preventiva', 2, 1, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (125, '1ª Divisao de Infantaria', 2, 1, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (126, 'Comando da 1ª Divisao de Infantaria', 2, 1, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (127, '10ª Brigada de Infantaria Motorizada', 2, 1, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (128, '11ª Brigada de Infantaria', 2, 1, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (129, '12ª Brigada de Infantaria', 2, 1, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (130, 'Regimento de Artilharia de Campanha', 2, 1, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (131, 'Regimento de Defesa Antiaerea', 2, 1, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (132, 'Grupo de Artilharia Anti-tanque', 2, 1, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (134, 'Batalhao de Engenharia e Sapadores', 2, 1, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (135, 'Batalhao de Protecao Nuclear, Biologica e Qua', 2, 1, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (136, 'Batalhao de Logistica', 2, 1, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (137, 'Batalhao de Reparacao', 2, 1, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (138, 'Batalhao Medico', 2, 1, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (139, 'Deposito de Material de Guerra', 2, 1, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (140, 'Companhia de Comando e Servisos', 2, 1, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (141, 'Comando da Regiao Militar Norte', 2, 2, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (142, '20ª Brigada de Infantaria Motorizada', 2, 2, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (143, '51ª Brigada de Infantaria', 2, 2, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (144, '70ª Brigada de Infantaria Motorizada', 2, 2, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (145, 'Grupo de Artilharia de Campanha', 2, 2, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (146, 'Grupo de Defesa Antiaerea', 2, 2, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (147, 'Batalhao de Engenharia e Sapadores', 2, 2, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (148, 'Companhia de Reconhecimento', 2, 2, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (149, 'Companhia de Telecomunicacoes', 2, 2, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (151, 'Batalhao de Manutencao de Armamento e Tecnica', 2, 2, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (152, 'Batalhao de Policia Militar', 2, 2, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (153, 'Enfermaria Militar Regional', 2, 2, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (154, 'Deposito de Material de Guerra', 2, 2, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (156, 'PolÃ­gono de Instrucao Inter-armas', 2, 2, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (157, 'Banda de Musica', 2, 2, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (158, 'Unidade de Prisao Preventiva', 2, 2, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (159, '2ª Divisao de Infantaria', 2, 2, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (160, 'Comando da 2ª Divisao de Infantaria', 2, 2, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (161, '22ª Brigada de Infantaria', 2, 2, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (162, '42ª Brigada de Infantaria', 2, 2, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (163, '52ª Brigada de Infantaria', 2, 2, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (164, '71ª Brigada de Infantaria', 2, 2, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (165, 'Regimento de Artilharia de Campanha', 2, 2, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (166, 'Regimento de Defesa Antiaerea', 2, 2, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (167, 'Grupo de Artilharia Anti-tanque', 2, 2, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (175, 'Companhia de Comando e Servisos', 2, 2, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (176, 'Comando da Regiao Militar Leste', 2, 3, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (177, '30ª Brigada de Infantaria Motorizada', 2, 3, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (178, '62ª Brigada de Infantaria', 2, 3, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (179, '72ª Brigada de Infantaria Motorizada', 2, 3, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (180, 'Grupo de Artilharia de Campanha', 2, 3, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (181, 'Grupo de Defesa Antiaerea', 2, 3, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (183, 'Companhia de Reconhecimento', 2, 3, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (184, 'Companhia de Telecomunicacoes', 2, 3, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (192, 'Presidio Militar do Luena', 2, 3, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (193, '3ª Divisao de Infantaria', 2, 3, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (194, 'Comando da 3ª Divisao de Infantaria', 2, 3, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (195, '31ª Brigada de Infantaria', 2, 3, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (196, '32ª Brigada de Infantaria', 2, 3, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (197, '75ª Brigada de Infantaria Motorizada', 2, 3, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (198, 'Regimento de Artilharia de Campanha', 2, 3, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (199, 'Regimento de Defesa AntiaÃ©rea', 2, 3, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (200, 'Grupo de Artilharia AntÃ­-tanque', 2, 3, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (208, 'Companhia de Comando e Servicos', 2, 3, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (209, 'Comando da Regiao Militar Centro', 2, 4, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (210, '73ª Brigada de Infantaria Motorizada', 2, 4, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (211, '74ª Brigada de Infantaria Motorizada', 2, 4, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (212, 'Grupo de Artilharia de Campanha', 2, 4, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (215, 'Companhia de Reconhecimento', 2, 4, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (222, 'Poligono de Instrucao Inter-armas', 2, 4, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (224, 'Presidio Militar do Huambo', 2, 4, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (225, '4ª Divisaoo de Infantaria', 2, 4, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (226, 'Comando da 4ª Divisao de Infantaria', 2, 4, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (227, '40ª Brigada de Infantaria', 2, 4, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (228, '41ª Brigada de Infantaria Motorizada', 2, 4, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (229, 'Regimento de Artilharia de Campanha', 2, 4, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (231, 'Grupo de Artilharia Anti-tanque', 2, 4, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (233, 'Batalhao de Engenharia e Sapadores', 2, 4, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (240, 'Comando da Regiao Militar Sul', 2, 5, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (241, 'Grupo de Artilharia de Campanha', 2, 5, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (242, 'Grupo de Defesa Antiaerea', 2, 5, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (243, 'Batalhao de Engenharia e Sapadores', 2, 5, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (244, 'Companhia de Reconhecimento', 2, 5, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (245, 'Companhia de Telecomunicacoes', 2, 5, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (249, 'Hospital Militar Regional', 2, 5, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (254, '5ª Divisao de Infantaria', 2, 5, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (255, 'Comando da 5ª Divisao de Infantaria', 2, 5, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (256, '21ª Brigada de Infantaria', 2, 5, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (257, '50ª Brigada de Infantaria Motorizada', 2, 5, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (258, 'Regimento de Artilharia de Campanha', 2, 5, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (259, 'Regimento de Defesa Antiaerea', 2, 5, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (269, '6ª Divisao de Infantaria', 2, 5, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (270, 'Comando da 6ª Divisao de Infantaria', 2, 5, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (271, '60ª Brigada de Infantaria Motorizada', 2, 5, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (272, '61ª Brigada de Infantaria Motorizada', 2, 5, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (273, 'Regimento de Artilharia de Campanha', 2, 5, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (284, 'Comando e Estado-Maior da Forca aerea', 3, 10, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (285, 'Centro de Criptologia da Forca aerea', 3, 10, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (286, 'Deposito Central de Abastecimento', 3, 10, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (287, 'Brigada de Engenharia de Aerodromo', 3, 10, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (288, 'Esquadra Independente de Helicopteros', 3, 10, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (289, 'Esquadra de Reconhecimento e Assalto', 3, 10, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (290, 'Centro de Psicologia', 3, 10, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (291, 'Clinica da Forca aerea', 3, 10, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (292, 'Centro de Medicina Aeronatica', 3, 10, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (293, 'Laboratorio Central de Combustiveis e Lubrificante', 3, 10, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (294, 'Centro Principal de Telecomunicacoess da Forca aer', 3, 10, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (295, 'Banda de Musica', 3, 10, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (296, 'Museu da Forca aerea', 3, 10, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (297, 'Companhia de Servisos de Pessoal', 3, 10, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (298, 'Companhia de Transportes', 3, 10, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (299, 'Centro de Uniformizacao e Treino', 3, 10, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (300, 'Deposito Central de Material', 3, 10, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (301, 'Messe Central da Forca aerea', 3, 10, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (302, 'Instituto Superior da Forca aerea', 3, 10, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (303, 'Academia Militar da Forca aerea', 3, 10, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (304, 'Escola Militar de Aeronatica', 3, 10, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (305, 'Escola de Armas e Servisos da Forca aerea', 3, 10, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (306, 'Centro de Instrucao de Tropas da Forca aerea', 3, 10, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (307, 'Oficina de Reparacao  Auto', 3, 10, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (308, 'Oficinas Gerais de Reparacao Tecnica de DAA e T', 3, 10, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (309, 'Oficina de Manutencao Tecnica de Aviacao', 3, 10, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (310, 'Comando e Estado-Maior da Regiao aerea Norte', 3, 6, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (311, 'Comando Operacional de Aviacao de Transporte \"CO', 3, 6, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (312, 'Regimento Aereo de Helicopteros', 3, 6, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (313, 'Regimento de Defesa Antiaerea (Luanda)', 3, 6, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (314, 'Regimento de Defesa Antiaerea (Cabinda)', 3, 6, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (315, 'Regimento de Defesa Antiaerea (Soyo)', 3, 6, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (316, 'Regimento de Tropas Radiotecnico', 3, 6, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (317, 'Grupo Independente de Defesa Antiaerea (Capanda)', 3, 6, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (318, 'Grupo Independente de Defesa Antiaerea (Dundo)', 3, 6, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (319, 'Grupo Independente de Defesa Antiaerea (Saurimo)', 3, 6, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (320, 'Grupo Independente de Defesa Antiaerea (Luena)', 3, 6, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (321, 'Base aerea (Luanda)', 3, 6, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (322, 'Base aerea (Saurimo)', 3, 6, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (323, 'Base aerea  (Nzeto)', 3, 6, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (324, 'aerea dromo de Manobra (Luena)', 3, 6, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (325, 'aerea dromo de Manobra (Cabinda)', 3, 6, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (326, 'aerea dromo de Manobra (Malanje)', 3, 6, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (327, 'aerea dromo de Manobra (Cazombo)', 3, 6, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (328, 'Batalhao de Engenharia de aereadromos', 3, 6, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (329, 'Centro de TelecomunicaÃ§Ãµes da Regiao aerea ', 3, 6, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (330, 'Enfermaria Regional', 3, 6, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (331, 'Messe Regional', 3, 6, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (332, 'Comando e Estado-Maior da Regiao aerea  Sul', 3, 7, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (333, 'Regimento aerea  de CaÃ§a', 3, 7, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (334, 'Regimento aerea  de Casa Bombardeiro', 3, 7, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (335, 'Regimento de Defesa Antiaerea  (Lobito)', 3, 7, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (336, 'Regimento de Defesa Antiaerea  (Lubango)', 3, 7, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (337, 'Regimento de Defesa Antiaerea  (Namibe)', 3, 7, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (338, 'Regimento de Tropas Radiotecnico', 3, 7, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (339, 'Grupo Independente de Defesa Antiaerea  (Cahama)', 3, 7, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (340, 'Grupo Independente de Defesa Antiaerea  (Menongue)', 3, 7, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (341, 'aerea dromo de Manobra (Huambo)', 3, 7, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (342, 'aerea dromo de Manobra (Menongue)', 3, 7, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (343, 'aerea dromo de Manobra (Namibe)', 3, 7, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (344, 'aerea dromo de Manobra (Cahama)', 3, 7, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (345, 'Batalhao de Engenharia de aereadromos', 3, 7, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (346, 'Centro de Telecomunicacoes da Regiao aerea ', 3, 7, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (347, 'Enfermaria Regional', 3, 7, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (348, 'Messe Regional', 3, 7, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (349, 'Comando e Estado-Maior da Marinha de Guerra', 4, 10, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (350, 'Esquadra Naval Operacional', 4, 10, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (351, 'Brigada de Fuzileiros Navais', 4, 10, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (352, 'Brigada de Navios de Luanda', 4, 10, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (353, 'Esquadrilha Independente de Submarinos', 4, 10, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (354, 'Esquadrilha Independente de Navios Hidrografia', 4, 10, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (355, 'Esquadrilha Independente de Navios de Reconhecimen', 4, 10, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (356, 'Esquadra de AviaÃ§Ã£o Naval', 4, 10, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (357, 'Centro de Telecomunicacoes da Marinha', 4, 10, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (358, 'Centro de Criptologia da Marinha', 4, 10, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (359, 'Oficina de Armamento Submarino', 4, 10, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (360, 'Oficina de MÃ­sseis', 4, 10, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (361, 'Companhia de Transporte', 4, 10, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (362, 'Deposito Central de Abastecimento', 4, 10, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (363, 'Unidade Naval de Destinacao Especial', 4, 10, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (364, 'Clinica da Marinha', 4, 10, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (365, 'Estaleiro Naval', 4, 10, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (366, 'Estaleiro de Engenharia e Infra-estruturas', 4, 10, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (367, 'Banda de Musica', 4, 10, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (368, 'Museu da Marinha de Guerra', 4, 10, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (369, 'Instituto Superior da Marinha de Guerra', 4, 10, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (370, 'Academia Naval', 4, 10, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (371, 'Escola de Especialistas Navais', 4, 10, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (372, 'Escola de Fuzileiros Navais', 4, 10, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (373, 'Escola de Oficiais da Marinha de Guerra', 4, 10, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (374, 'Escola de Tecnologias Navais', 4, 10, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (375, 'Comando da Regiao Naval Norte', 4, 8, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (376, 'Comando Naval Cabinda', 4, 8, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (377, 'Base Naval Norte (Kinkakala)', 4, 8, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (378, 'Brigada de Navios do Soyo', 4, 8, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (379, 'Esquadrilha de Navios e Lanchas de Patrulha e Fisc', 4, 8, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (380, 'Base Costeira (Cabinda)', 4, 8, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (381, 'Base Costeira (Soyo)', 4, 8, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (382, 'Regimento de Defesa Costeira', 4, 8, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (383, 'Centro Fixo de Telecomunicacoes', 4, 8, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (384, 'Centro de Inteligencia Radio-ElectrÃ³nica', 4, 8, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (385, 'Batalhao Radiotecnico de Observacao Costeira', 4, 8, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (386, 'Companhia de ProtecÃ§Ã£o Nuclear, BiolÃ³gica e QuÃ', 4, 8, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (387, 'Unidade de Mergulhadores (Kinkakala)', 4, 8, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (388, 'Banda de Musica', 4, 8, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (389, 'Enfermaria Militar', 4, 8, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (390, 'Comando da Regiao Naval Sul', 4, 9, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (391, 'Base Naval Sul (Namibe)', 4, 9, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (392, 'Brigada de Navios do Namibe', 4, 9, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (393, 'Base Costeira (Lobito)', 4, 9, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (394, 'Base de Manobra (BaÃ­a dos Tigres)', 4, 9, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (395, 'Regimento de Defesa Costeira (Namibe)', 4, 9, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (396, 'Centro Fixo de TelecomunicaÃ§Ãµes', 4, 9, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (397, 'Centro de InteligÃªncia Radio-ElectrÃ³nica', 4, 9, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (398, 'BatalhÃ£o Radiotecnico de ObservaÃ§Ã£o Costeira', 4, 9, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (399, 'Companhia de Protecao Nuclear, Biologica e QuÃ', 4, 9, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (400, 'Unidade de Mergulhadores (Namibe)', 4, 9, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (402, 'Enfermaria Militar', 4, 9, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (403, 'Batalhao de logistica', 2, 2, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (404, 'Batalhao de Inteligencia Militar Operativa', 2, 2, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (405, 'Batalhao de Engenharia e Sapadores', 2, 2, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (406, 'Batalhao de Protecao Nuclear, Bioligica e Qui', 2, 2, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (407, 'Batalhao de Reparacao', 2, 2, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (408, 'Batalhao Medico', 2, 2, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (409, 'Deposito de Material de Guerra', 2, 2, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (410, 'Batalhao de Engenharia e Sapadores', 2, 3, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (412, 'Batalhao de Logistica', 2, 3, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (413, 'Batalhao de Manutencao de Armamento e Teccnica', 2, 3, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (414, 'Batalhao de Policia Militar', 2, 3, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (416, 'Deposito de Material de Guerra', 2, 3, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (417, 'Deposito Regional de Produtos Quimicos e Farmacia', 2, 3, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (418, 'Poligono de Instrucao Inter-armas', 2, 3, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (419, 'Banda de Musica', 2, 3, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (420, 'Batalhao de Inteligencia Militar Operativa', 2, 3, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (421, 'Batalhao de Engenharia e Sapadores', 2, 3, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (422, 'Batalhao de Protecao Nuclear, Bioligica e Quimica', 2, 3, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (423, 'Batalhao de Logistica', 2, 3, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (424, 'Batalhao de Reparacao', 2, 3, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (425, 'Batalhao Medico', 2, 3, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (426, 'Deposito de Material de Guerra', 2, 3, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (427, 'Grupo de Defesa Antiaerea', 2, 4, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (429, 'Batalhao de Engenharia e Sapadores', 2, 4, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (430, 'Companhia de Telecomunicacoes', 2, 4, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (431, 'Batalhao de Logistica', 2, 4, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (432, 'Batalhao de Manutencao de Armamento e Teccnica', 2, 4, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (433, 'Batalhao de Policia Militar', 2, 4, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (434, 'Deposito de Material de Guerra', 2, 4, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (435, 'Deposito Regional de Produtos Quimicos e Farmacia', 2, 4, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (436, 'Banda de Musica', 2, 4, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (437, 'Regimento de Defesa Antiaerea', 2, 4, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (438, 'Batalhao  de Inteligencia Militar Operativa', 2, 4, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (439, 'Batalhao  de Protecao Nuclear, Bioligica e Quimico', 2, 4, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (440, 'Batalhao  de Logistica', 2, 4, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (441, 'Batalhao  de Reparacao', 2, 4, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (442, 'Batalhao  Medico', 2, 4, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (445, 'Deposito de Material de Guerra', 2, 4, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (446, 'Companhia de Comando e Servisos', 2, 4, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (447, 'Batalhao de Logistica', 2, 5, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (448, 'Batalhao de Manutencao de Armamento e Tecnica', 2, 5, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (449, 'Batalhao de Policia Militar', 2, 5, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (450, 'Deposito de Material de Guerra', 2, 5, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (451, 'Deposito Regional de Produtos Quimicos e Farmacia', 2, 5, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (452, 'Poligono de Instrucao Inter-armas', 2, 5, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (453, 'Banda de Musica', 2, 5, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (454, 'Grupo de Artilharia Anti-tanque', 2, 5, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (456, 'Batalhao de Inteligencia Militar Operativa', 2, 5, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (458, 'Batalhao de Engenharia e Sapadores', 2, 5, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (459, 'Batalhao de Protecao Nuclear, Bioligica e Quimica', 2, 5, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (460, 'Batalhao de Logistica', 2, 5, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (461, 'Batalhao de Reparacao', 2, 5, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (462, 'Batalhao  Medico', 2, 5, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (463, 'Deposito de Material de Guerra', 2, 5, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (464, 'Companhia de Comando e Servisos', 2, 5, '0000-00-00 00:00:00', '');
INSERT INTO `tb_u_e_o` VALUES (465, 'Regimento de Defesa Antiaerea', 2, 5, '0000-00-00 00:00:00', '');

-- ----------------------------
-- Table structure for tb_uh
-- ----------------------------
DROP TABLE IF EXISTS `tb_uh`;
CREATE TABLE `tb_uh`  (
  `id_uh` int NOT NULL AUTO_INCREMENT,
  `designacao_uh` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `id_tipo_uh` int NULL DEFAULT NULL,
  `cod_usuario` int NULL DEFAULT NULL,
  `created` datetime NULL DEFAULT NULL,
  `id_municipio` int NULL DEFAULT NULL,
  `endereco_completo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `telefone` int NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_uh`) USING BTREE,
  INDEX `id_tipo_uh`(`id_tipo_uh` ASC) USING BTREE,
  CONSTRAINT `tb_uh_ibfk_1` FOREIGN KEY (`id_tipo_uh`) REFERENCES `tb_tipo_uh` (`id_tipo_uh`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_uh
-- ----------------------------
INSERT INTO `tb_uh` VALUES (1, 'Clínica Sagrada Esperança', 2, 101, '0000-00-00 00:00:00', 3, 'Rua do mercado verde', 222543231, NULL);
INSERT INTO `tb_uh` VALUES (2, 'Hospital Pediátrico David Bernardino', NULL, NULL, NULL, 2, 'Avenida 31 bairro Zau', 222536789, NULL);
INSERT INTO `tb_uh` VALUES (3, 'Hospital Josina Machel \"Maria Pia\"', NULL, NULL, NULL, 2, 'Estrada direita do Tembo', 923494949, NULL);
INSERT INTO `tb_uh` VALUES (4, 'Clica UGS', 2, 101, '2022-06-14 16:30:06', 1, 'Vilaa nova de almad', 912232221, NULL);
INSERT INTO `tb_uh` VALUES (5, 'Clínica Castelo', 2, 101, '2022-06-19 12:48:12', 181, 'Avenida 21 de Janeiro bairro Morro Bento', 222324323, 'clicaste@castelo.ao');

-- ----------------------------
-- Table structure for tb_uh_esp
-- ----------------------------
DROP TABLE IF EXISTS `tb_uh_esp`;
CREATE TABLE `tb_uh_esp`  (
  `id_uh_esp` int NOT NULL AUTO_INCREMENT,
  `id_uh` int NULL DEFAULT NULL,
  `id_esp` int NULL DEFAULT NULL,
  `cod_usuario` int NULL DEFAULT NULL,
  `created` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id_uh_esp`) USING BTREE,
  INDEX `id_uh`(`id_uh` ASC) USING BTREE,
  INDEX `id_esp`(`id_esp` ASC) USING BTREE,
  INDEX `id_municipio`(`cod_usuario` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_uh_esp
-- ----------------------------
INSERT INTO `tb_uh_esp` VALUES (2, 1, 1, 1, NULL);
INSERT INTO `tb_uh_esp` VALUES (3, 1, 2, 1, NULL);
INSERT INTO `tb_uh_esp` VALUES (4, 2, 1, 2, NULL);
INSERT INTO `tb_uh_esp` VALUES (5, 2, 3, 1, NULL);
INSERT INTO `tb_uh_esp` VALUES (6, 1, 13, 101, '2022-06-14 00:44:40');
INSERT INTO `tb_uh_esp` VALUES (7, 2, 13, 101, '2022-06-14 00:44:47');
INSERT INTO `tb_uh_esp` VALUES (8, 2, 13, 101, '2022-06-14 00:44:52');
INSERT INTO `tb_uh_esp` VALUES (9, 2, 12, 101, '2022-06-14 00:51:55');
INSERT INTO `tb_uh_esp` VALUES (10, 3, 13, 101, '2022-06-14 00:52:12');
INSERT INTO `tb_uh_esp` VALUES (11, 3, 16, 101, '2022-06-19 13:02:22');
INSERT INTO `tb_uh_esp` VALUES (12, 1, 7, 101, '2022-06-30 13:20:24');
INSERT INTO `tb_uh_esp` VALUES (13, 1, 17, 101, '2022-06-30 13:20:31');
INSERT INTO `tb_uh_esp` VALUES (14, 3, 17, 101, '2022-06-30 13:20:38');
INSERT INTO `tb_uh_esp` VALUES (15, 3, 6, 101, '2022-06-30 13:20:53');
INSERT INTO `tb_uh_esp` VALUES (16, 5, 4, 101, '2022-06-30 13:21:00');
INSERT INTO `tb_uh_esp` VALUES (17, 2, 2, 101, '2022-06-30 13:21:10');
INSERT INTO `tb_uh_esp` VALUES (18, 1, 13, 101, '2022-06-30 13:21:18');
INSERT INTO `tb_uh_esp` VALUES (19, 5, 7, 101, '2022-09-27 14:46:38');
INSERT INTO `tb_uh_esp` VALUES (20, 4, 8, 101, '2022-09-27 14:48:54');
INSERT INTO `tb_uh_esp` VALUES (22, 4, 3, 101, '2022-09-27 18:16:43');
INSERT INTO `tb_uh_esp` VALUES (23, 5, 2, 101, '2022-09-28 08:43:24');
INSERT INTO `tb_uh_esp` VALUES (24, 5, 17, 122, '2022-09-29 21:46:19');
INSERT INTO `tb_uh_esp` VALUES (25, 5, 8, 122, '2022-09-29 21:47:24');
INSERT INTO `tb_uh_esp` VALUES (26, 1, 4, 122, '2022-09-29 21:52:32');
INSERT INTO `tb_uh_esp` VALUES (27, 3, 8, 122, '2022-09-29 21:53:28');
INSERT INTO `tb_uh_esp` VALUES (28, 5, 14, 122, '2022-09-29 21:54:52');
INSERT INTO `tb_uh_esp` VALUES (29, 4, 19, 122, '2022-09-29 21:55:10');

-- ----------------------------
-- Table structure for tb_venda
-- ----------------------------
DROP TABLE IF EXISTS `tb_venda`;
CREATE TABLE `tb_venda`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `total` float NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_venda
-- ----------------------------

-- ----------------------------
-- Table structure for venda
-- ----------------------------
DROP TABLE IF EXISTS `venda`;
CREATE TABLE `venda`  (
  `id_venda` int NOT NULL AUTO_INCREMENT,
  `data_venda` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `total` decimal(10, 2) NOT NULL,
  `status` enum('Finalizada','Cancelada') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'Finalizada',
  `observacao` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`id_venda`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 159 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of venda
-- ----------------------------
INSERT INTO `venda` VALUES (157, '2025-01-10 20:01:05', 4850.00, 'Finalizada', NULL);
INSERT INTO `venda` VALUES (158, '2025-01-13 12:01:26', 400.00, 'Finalizada', NULL);
INSERT INTO `venda` VALUES (159, '2025-01-13 12:01:52', 4850.00, 'Finalizada', NULL);

SET FOREIGN_KEY_CHECKS = 1;
