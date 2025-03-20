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

 Date: 01/02/2025 18:26:55
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
) ENGINE = MyISAM AUTO_INCREMENT = 493 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of adms_menus
-- ----------------------------
INSERT INTO `adms_menus` VALUES (1, 'Principal', 'fas fa-tachometer-alt', 1, 1, '2018-05-23 00:00:00', '2021-10-15 12:47:37');
INSERT INTO `adms_menus` VALUES (2, 'Usuário', 'fas fa-user', 35, 1, '2018-05-23 00:00:00', '2025-01-21 15:54:43');
INSERT INTO `adms_menus` VALUES (3, 'Sair', 'fas fa-sign-out-alt', 36, 1, '2018-06-23 00:00:00', '2025-01-21 15:54:42');
INSERT INTO `adms_menus` VALUES (4, 'Configuração', 'fas fa-cogs', 33, 1, '2018-06-23 00:00:00', '2025-01-21 15:54:48');
INSERT INTO `adms_menus` VALUES (42, 'Registar Dados', 'fas fa-edit', 25, 1, '2021-11-16 13:12:10', '2021-12-13 08:39:41');
INSERT INTO `adms_menus` VALUES (489, 'Estatísticas', 'fas fa-list', 29, 1, '2022-07-17 17:47:40', '2022-07-17 17:50:19');
INSERT INTO `adms_menus` VALUES (46, 'Consultas Médicas', 'fas fa-edit', 26, 1, '2022-04-14 10:09:46', '2022-04-14 10:10:46');
INSERT INTO `adms_menus` VALUES (47, 'Agendamentos', 'fas fa-edit', 27, 0, '0000-00-00 00:00:00', NULL);
INSERT INTO `adms_menus` VALUES (48, 'Relatórios', 'fas fa-print', 28, 1, '2022-07-06 10:04:18', '2022-07-06 10:17:13');
INSERT INTO `adms_menus` VALUES (490, 'Médico', 'fas fa-user', 34, 1, '2022-09-27 13:25:30', '2025-01-21 15:54:46');
INSERT INTO `adms_menus` VALUES (491, 'Registar Venda', 'fas fa-edit', 31, 1, '2024-12-25 14:53:20', '2025-01-21 15:54:56');
INSERT INTO `adms_menus` VALUES (492, 'Estoque', 'fas fa-list', 32, 1, '2025-01-21 14:52:34', '2025-01-21 15:54:56');

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
) ENGINE = MyISAM AUTO_INCREMENT = 2022 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = FIXED;

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
INSERT INTO `adms_nivacs_pgs` VALUES (1984, 2, 127, 2, 2, 4, 13, 233, '2022-09-29 20:06:30', '2025-01-22 20:34:48');
INSERT INTO `adms_nivacs_pgs` VALUES (1985, 2, 97, 2, 2, 4, 15, 233, '2022-09-29 20:06:30', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1986, 1, 175, 2, 2, 4, 1, 234, '2022-09-29 22:40:23', '2024-12-24 08:24:43');
INSERT INTO `adms_nivacs_pgs` VALUES (1987, 2, 137, 2, 2, 489, 2, 234, '2022-09-29 22:40:23', '2025-01-17 10:30:18');
INSERT INTO `adms_nivacs_pgs` VALUES (1988, 2, 128, 2, 2, 4, 13, 234, '2022-09-29 22:40:23', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1989, 2, 98, 2, 2, 4, 15, 234, '2022-09-29 22:40:23', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (1990, 1, 151, 1, 1, 42, 1, 235, '2024-12-23 19:33:21', '2025-01-10 13:24:30');
INSERT INTO `adms_nivacs_pgs` VALUES (1991, 1, 138, 1, 1, 42, 2, 235, '2024-12-23 19:33:21', '2025-01-09 15:54:46');
INSERT INTO `adms_nivacs_pgs` VALUES (1992, 2, 129, 2, 2, 42, 13, 235, '2024-12-23 19:33:21', '2025-01-22 20:34:40');
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
INSERT INTO `adms_nivacs_pgs` VALUES (2008, 2, 133, 2, 2, 4, 13, 239, '2025-01-07 10:23:14', '2025-01-22 20:34:16');
INSERT INTO `adms_nivacs_pgs` VALUES (2009, 2, 103, 2, 2, 4, 15, 239, '2025-01-07 10:23:14', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (2010, 1, 180, 1, 1, 42, 1, 240, '2025-01-10 09:21:15', '2025-01-10 09:22:52');
INSERT INTO `adms_nivacs_pgs` VALUES (2011, 1, 143, 1, 1, 42, 2, 240, '2025-01-10 09:21:15', '2025-01-17 10:29:22');
INSERT INTO `adms_nivacs_pgs` VALUES (2012, 2, 134, 2, 2, 42, 13, 240, '2025-01-10 09:21:15', '2025-01-22 20:34:13');
INSERT INTO `adms_nivacs_pgs` VALUES (2013, 2, 104, 2, 2, 4, 15, 240, '2025-01-10 09:21:15', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (2014, 1, 181, 1, 1, 42, 1, 241, '2025-01-10 09:22:22', '2025-01-10 09:22:43');
INSERT INTO `adms_nivacs_pgs` VALUES (2015, 1, 144, 1, 1, 42, 2, 241, '2025-01-10 09:22:22', '2025-01-21 15:54:19');
INSERT INTO `adms_nivacs_pgs` VALUES (2016, 2, 135, 2, 2, 42, 13, 241, '2025-01-10 09:22:22', '2025-01-22 20:34:07');
INSERT INTO `adms_nivacs_pgs` VALUES (2017, 2, 105, 2, 2, 4, 15, 241, '2025-01-10 09:22:22', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (2018, 1, 182, 1, 1, 492, 1, 242, '2025-01-21 14:51:23', '2025-01-21 14:52:50');
INSERT INTO `adms_nivacs_pgs` VALUES (2019, 1, 145, 1, 1, 492, 2, 242, '2025-01-21 14:51:23', '2025-01-21 15:54:29');
INSERT INTO `adms_nivacs_pgs` VALUES (2020, 2, 136, 2, 2, 4, 13, 242, '2025-01-21 14:51:23', NULL);
INSERT INTO `adms_nivacs_pgs` VALUES (2021, 2, 106, 2, 2, 4, 15, 242, '2025-01-21 14:51:23', NULL);

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
) ENGINE = MyISAM AUTO_INCREMENT = 243 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = DYNAMIC;

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
INSERT INTO `adms_paginas` VALUES (242, 'controllerEstoque', 'listarEstoque', 'controllerEstoque', 'listarEstoque', 'Listar Estoque', ' ok               ', 1, 'fas fa-list', 1, 1, 1, '2025-01-21 14:51:23', NULL);

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
) ENGINE = MyISAM AUTO_INCREMENT = 133 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of adms_usuarios
-- ----------------------------
INSERT INTO `adms_usuarios` VALUES (101, 'Isaias Bianda', 'Moises', 1, 'isaias@isaias.ibm.ao', 'isaias', '$2y$10$eJbUOHPsiqtawtBEeI.c6Oi89fQoTLSwRFC6EKj0DaK7frDYa2ANy', NULL, NULL, '', 1, '2022-01-27 07:54:49', NULL, 1, NULL);
INSERT INTO `adms_usuarios` VALUES (121, 'Nelson', 'Moises', 2, 'nelson@gmail.com', 'nelson', '$2y$10$I9SrtWX4ksk6Wu40FFM9b.vXyjLOvjLQQEjgP7SY5b/kMcYHH223O', NULL, NULL, '', 1, '2022-09-27 13:02:06', NULL, 4, 31);
INSERT INTO `adms_usuarios` VALUES (129, 'Jacinto', 'Diogo', 2, 'jccalunga2@gmail.com', 'Kalunga', '$2y$10$92YCsxF5nmd/yXicMBit2eOJLwdy1iRjRzfVMiHZJFP3V49I6Mp8e', NULL, NULL, '1737560150480366124400463220297.jpg', 1, '2025-01-09 15:52:46', '2025-01-22 15:37:09', NULL, NULL);
INSERT INTO `adms_usuarios` VALUES (130, 'Antónia Pegado', 'Pegado', 2, 'antoniapegado2022@gmail.com', 'pegado', '$2y$10$kvsiGz77kR2SJ598UnQnc.xrwL22IcfMhgnt9vW/nMgCex1I/XkvW', NULL, NULL, '', 1, '2025-01-10 19:20:36', NULL, NULL, NULL);
INSERT INTO `adms_usuarios` VALUES (131, 'Flora Maiundo', 'Maiundo', 13, 'flora@gmail.com', 'flora', '$2y$10$XyhiA584kKvnAuaSIPHot.FDABdxKEyD0.p4H6JBkhM0Lsb.tIqxG', NULL, NULL, '', 1, '2025-01-22 20:32:33', '2025-01-22 21:46:45', NULL, NULL);
INSERT INTO `adms_usuarios` VALUES (132, 'Teresa Francisco', 'Francisco', 13, 'teresa@gmail.com', 'teresa', '$2y$10$h7lHrEHWtdD0kv71wHQJ9OzAjHp0jLE9p1v0EAHfb3bY1qzfKebuy', NULL, NULL, '', 1, '2025-01-22 20:33:18', '2025-01-25 07:47:14', NULL, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 111 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 620 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_detalhes_pagamento
-- ----------------------------
INSERT INTO `tb_detalhes_pagamento` VALUES (15, 221, 1, 1000.00, 101, '2025-01-23 20:54:51');
INSERT INTO `tb_detalhes_pagamento` VALUES (16, 222, 1, 1000.00, 101, '2025-01-23 20:54:51');
INSERT INTO `tb_detalhes_pagamento` VALUES (17, 223, 1, 1000.00, 130, '2025-01-23 21:04:54');
INSERT INTO `tb_detalhes_pagamento` VALUES (18, 224, 1, 5000.00, 131, '2025-01-24 06:47:03');
INSERT INTO `tb_detalhes_pagamento` VALUES (19, 225, 1, 5000.00, 131, '2025-01-24 06:47:03');
INSERT INTO `tb_detalhes_pagamento` VALUES (20, 226, 1, 5000.00, 131, '2025-01-24 06:47:03');
INSERT INTO `tb_detalhes_pagamento` VALUES (21, 227, 1, 200.00, 131, '2025-01-24 07:07:17');
INSERT INTO `tb_detalhes_pagamento` VALUES (22, 228, 1, 200.00, 131, '2025-01-24 07:26:51');
INSERT INTO `tb_detalhes_pagamento` VALUES (23, 228, 2, 700.00, 131, '2025-01-24 07:26:51');
INSERT INTO `tb_detalhes_pagamento` VALUES (24, 229, 1, 900.00, 131, '2025-01-24 09:03:56');
INSERT INTO `tb_detalhes_pagamento` VALUES (25, 229, 2, 700.00, 131, '2025-01-24 09:03:56');
INSERT INTO `tb_detalhes_pagamento` VALUES (26, 230, 1, 300.00, 131, '2025-01-24 09:08:48');
INSERT INTO `tb_detalhes_pagamento` VALUES (27, 230, 2, 700.00, 131, '2025-01-24 09:08:48');
INSERT INTO `tb_detalhes_pagamento` VALUES (28, 231, 2, 4000.00, 131, '2025-01-24 10:04:45');
INSERT INTO `tb_detalhes_pagamento` VALUES (29, 232, 2, 450.00, 131, '2025-01-24 10:55:16');
INSERT INTO `tb_detalhes_pagamento` VALUES (30, 233, 1, 2000.00, 131, '2025-01-24 12:52:53');
INSERT INTO `tb_detalhes_pagamento` VALUES (31, 233, 2, 450.00, 131, '2025-01-24 12:52:53');
INSERT INTO `tb_detalhes_pagamento` VALUES (32, 234, 1, 2000.00, 131, '2025-01-24 12:52:53');
INSERT INTO `tb_detalhes_pagamento` VALUES (33, 234, 2, 450.00, 131, '2025-01-24 12:52:53');
INSERT INTO `tb_detalhes_pagamento` VALUES (34, 235, 1, 2000.00, 131, '2025-01-24 12:52:53');
INSERT INTO `tb_detalhes_pagamento` VALUES (35, 235, 2, 450.00, 131, '2025-01-24 12:52:53');
INSERT INTO `tb_detalhes_pagamento` VALUES (36, 236, 1, 2000.00, 131, '2025-01-24 12:52:53');
INSERT INTO `tb_detalhes_pagamento` VALUES (37, 236, 2, 450.00, 131, '2025-01-24 12:52:53');
INSERT INTO `tb_detalhes_pagamento` VALUES (38, 237, 1, 5000.00, 131, '2025-01-24 15:53:59');
INSERT INTO `tb_detalhes_pagamento` VALUES (39, 238, 1, 1800.00, 131, '2025-01-24 16:37:25');
INSERT INTO `tb_detalhes_pagamento` VALUES (40, 239, 1, 1800.00, 131, '2025-01-24 16:37:25');
INSERT INTO `tb_detalhes_pagamento` VALUES (41, 240, 1, 1500.00, 131, '2025-01-24 17:11:06');
INSERT INTO `tb_detalhes_pagamento` VALUES (42, 241, 2, 7500.00, 129, '2025-01-24 18:22:43');
INSERT INTO `tb_detalhes_pagamento` VALUES (43, 242, 2, 7500.00, 129, '2025-01-24 18:22:43');
INSERT INTO `tb_detalhes_pagamento` VALUES (44, 243, 1, 700.00, 129, '2025-01-24 18:25:03');
INSERT INTO `tb_detalhes_pagamento` VALUES (45, 243, 2, 7500.00, 129, '2025-01-24 18:25:03');
INSERT INTO `tb_detalhes_pagamento` VALUES (46, 244, 1, 900.00, 129, '2025-01-24 18:26:56');
INSERT INTO `tb_detalhes_pagamento` VALUES (47, 244, 2, 7500.00, 129, '2025-01-24 18:26:56');
INSERT INTO `tb_detalhes_pagamento` VALUES (48, 245, 1, 4900.00, 129, '2025-01-24 18:30:13');
INSERT INTO `tb_detalhes_pagamento` VALUES (49, 245, 2, 7500.00, 129, '2025-01-24 18:30:13');
INSERT INTO `tb_detalhes_pagamento` VALUES (50, 246, 1, 200.00, 129, '2025-01-24 18:34:34');
INSERT INTO `tb_detalhes_pagamento` VALUES (51, 246, 2, 7500.00, 129, '2025-01-24 18:34:34');
INSERT INTO `tb_detalhes_pagamento` VALUES (52, 247, 1, 150.00, 129, '2025-01-24 18:35:46');
INSERT INTO `tb_detalhes_pagamento` VALUES (53, 247, 2, 7500.00, 129, '2025-01-24 18:35:46');
INSERT INTO `tb_detalhes_pagamento` VALUES (54, 248, 1, 200.00, 129, '2025-01-24 18:52:29');
INSERT INTO `tb_detalhes_pagamento` VALUES (55, 249, 1, 1500.00, 131, '2025-01-24 19:04:22');
INSERT INTO `tb_detalhes_pagamento` VALUES (56, 250, 1, 1500.00, 131, '2025-01-24 19:04:22');
INSERT INTO `tb_detalhes_pagamento` VALUES (57, 251, 1, 1500.00, 131, '2025-01-24 19:04:22');
INSERT INTO `tb_detalhes_pagamento` VALUES (58, 252, 2, 3400.00, 129, '2025-01-24 19:11:50');
INSERT INTO `tb_detalhes_pagamento` VALUES (59, 253, 2, 3400.00, 129, '2025-01-24 19:11:50');
INSERT INTO `tb_detalhes_pagamento` VALUES (60, 254, 2, 3400.00, 129, '2025-01-24 19:11:50');
INSERT INTO `tb_detalhes_pagamento` VALUES (61, 255, 2, 3400.00, 129, '2025-01-24 19:11:50');
INSERT INTO `tb_detalhes_pagamento` VALUES (62, 256, 1, 450.00, 131, '2025-01-24 19:20:34');
INSERT INTO `tb_detalhes_pagamento` VALUES (63, 257, 1, 450.00, 131, '2025-01-24 19:20:34');
INSERT INTO `tb_detalhes_pagamento` VALUES (64, 258, 2, 2700.00, 131, '2025-01-24 19:25:21');
INSERT INTO `tb_detalhes_pagamento` VALUES (65, 259, 2, 2700.00, 131, '2025-01-24 19:25:21');
INSERT INTO `tb_detalhes_pagamento` VALUES (66, 260, 1, 1500.00, 131, '2025-01-24 19:28:35');
INSERT INTO `tb_detalhes_pagamento` VALUES (67, 260, 2, 400.00, 131, '2025-01-24 19:28:35');
INSERT INTO `tb_detalhes_pagamento` VALUES (68, 261, 1, 1500.00, 131, '2025-01-24 19:28:35');
INSERT INTO `tb_detalhes_pagamento` VALUES (69, 261, 2, 400.00, 131, '2025-01-24 19:28:35');
INSERT INTO `tb_detalhes_pagamento` VALUES (70, 262, 1, 1850.00, 131, '2025-01-24 20:10:46');
INSERT INTO `tb_detalhes_pagamento` VALUES (71, 262, 2, 400.00, 131, '2025-01-24 20:10:46');
INSERT INTO `tb_detalhes_pagamento` VALUES (72, 263, 1, 1850.00, 131, '2025-01-24 20:10:46');
INSERT INTO `tb_detalhes_pagamento` VALUES (73, 263, 2, 400.00, 131, '2025-01-24 20:10:46');
INSERT INTO `tb_detalhes_pagamento` VALUES (74, 264, 1, 3200.00, 131, '2025-01-24 20:21:34');
INSERT INTO `tb_detalhes_pagamento` VALUES (75, 264, 2, 400.00, 131, '2025-01-24 20:21:34');
INSERT INTO `tb_detalhes_pagamento` VALUES (76, 265, 1, 150.00, 131, '2025-01-24 21:20:32');
INSERT INTO `tb_detalhes_pagamento` VALUES (77, 266, 1, 50.00, 131, '2025-01-24 21:23:26');
INSERT INTO `tb_detalhes_pagamento` VALUES (78, 267, 2, 1500.00, 131, '2025-01-25 06:27:48');
INSERT INTO `tb_detalhes_pagamento` VALUES (79, 268, 2, 1500.00, 131, '2025-01-25 06:27:48');
INSERT INTO `tb_detalhes_pagamento` VALUES (80, 269, 2, 1500.00, 131, '2025-01-25 06:27:48');
INSERT INTO `tb_detalhes_pagamento` VALUES (81, 270, 1, 500.00, 132, '2025-01-25 07:11:45');
INSERT INTO `tb_detalhes_pagamento` VALUES (82, 271, 1, 5000.00, 132, '2025-01-25 07:23:26');
INSERT INTO `tb_detalhes_pagamento` VALUES (83, 271, 3, 1500.00, 132, '2025-01-25 07:23:26');
INSERT INTO `tb_detalhes_pagamento` VALUES (84, 272, 1, 5000.00, 132, '2025-01-25 07:23:26');
INSERT INTO `tb_detalhes_pagamento` VALUES (85, 272, 3, 1500.00, 132, '2025-01-25 07:23:26');
INSERT INTO `tb_detalhes_pagamento` VALUES (86, 273, 1, 700.00, 132, '2025-01-25 07:30:08');
INSERT INTO `tb_detalhes_pagamento` VALUES (87, 274, 1, 700.00, 132, '2025-01-25 07:30:08');
INSERT INTO `tb_detalhes_pagamento` VALUES (88, 275, 1, 500.00, 132, '2025-01-25 07:32:25');
INSERT INTO `tb_detalhes_pagamento` VALUES (89, 276, 1, 1950.00, 132, '2025-01-25 08:41:29');
INSERT INTO `tb_detalhes_pagamento` VALUES (90, 277, 1, 1950.00, 132, '2025-01-25 08:41:29');
INSERT INTO `tb_detalhes_pagamento` VALUES (91, 278, 1, 1950.00, 132, '2025-01-25 08:41:29');
INSERT INTO `tb_detalhes_pagamento` VALUES (92, 279, 1, 1950.00, 132, '2025-01-25 08:41:29');
INSERT INTO `tb_detalhes_pagamento` VALUES (93, 280, 1, 1950.00, 132, '2025-01-25 09:06:57');
INSERT INTO `tb_detalhes_pagamento` VALUES (94, 281, 1, 550.00, 132, '2025-01-25 09:14:11');
INSERT INTO `tb_detalhes_pagamento` VALUES (95, 282, 2, 1000.00, 132, '2025-01-25 09:26:49');
INSERT INTO `tb_detalhes_pagamento` VALUES (96, 283, 2, 1000.00, 132, '2025-01-25 10:05:00');
INSERT INTO `tb_detalhes_pagamento` VALUES (97, 284, 1, 500.00, 132, '2025-01-25 10:07:21');
INSERT INTO `tb_detalhes_pagamento` VALUES (98, 285, 1, 300.00, 132, '2025-01-25 10:32:45');
INSERT INTO `tb_detalhes_pagamento` VALUES (99, 286, 1, 400.00, 132, '2025-01-25 11:29:08');
INSERT INTO `tb_detalhes_pagamento` VALUES (100, 287, 1, 400.00, 132, '2025-01-25 11:29:36');
INSERT INTO `tb_detalhes_pagamento` VALUES (101, 288, 2, 7750.00, 132, '2025-01-25 12:13:04');
INSERT INTO `tb_detalhes_pagamento` VALUES (102, 289, 2, 7750.00, 132, '2025-01-25 12:13:04');
INSERT INTO `tb_detalhes_pagamento` VALUES (103, 290, 2, 7750.00, 132, '2025-01-25 12:13:04');
INSERT INTO `tb_detalhes_pagamento` VALUES (104, 291, 2, 4000.00, 132, '2025-01-25 12:21:02');
INSERT INTO `tb_detalhes_pagamento` VALUES (105, 292, 1, 1000.00, 132, '2025-01-25 14:01:04');
INSERT INTO `tb_detalhes_pagamento` VALUES (106, 293, 1, 1000.00, 132, '2025-01-25 14:01:04');
INSERT INTO `tb_detalhes_pagamento` VALUES (107, 294, 1, 1000.00, 132, '2025-01-25 14:01:04');
INSERT INTO `tb_detalhes_pagamento` VALUES (108, 295, 1, 700.00, 132, '2025-01-25 14:55:51');
INSERT INTO `tb_detalhes_pagamento` VALUES (109, 296, 1, 700.00, 132, '2025-01-25 14:55:51');
INSERT INTO `tb_detalhes_pagamento` VALUES (110, 297, 2, 450.00, 132, '2025-01-25 15:26:24');
INSERT INTO `tb_detalhes_pagamento` VALUES (111, 298, 2, 450.00, 132, '2025-01-25 15:48:50');
INSERT INTO `tb_detalhes_pagamento` VALUES (112, 299, 1, 200.00, 132, '2025-01-25 15:49:47');
INSERT INTO `tb_detalhes_pagamento` VALUES (113, 300, 1, 2000.00, 132, '2025-01-25 17:12:05');
INSERT INTO `tb_detalhes_pagamento` VALUES (114, 301, 1, 2000.00, 132, '2025-01-25 17:12:05');
INSERT INTO `tb_detalhes_pagamento` VALUES (115, 302, 1, 2000.00, 132, '2025-01-25 17:12:05');
INSERT INTO `tb_detalhes_pagamento` VALUES (116, 303, 1, 2000.00, 132, '2025-01-25 17:12:05');
INSERT INTO `tb_detalhes_pagamento` VALUES (117, 304, 1, 2000.00, 132, '2025-01-25 17:12:42');
INSERT INTO `tb_detalhes_pagamento` VALUES (118, 304, 2, 700.00, 132, '2025-01-25 17:12:42');
INSERT INTO `tb_detalhes_pagamento` VALUES (120, 306, 1, 1600.00, 132, '2025-01-25 17:36:31');
INSERT INTO `tb_detalhes_pagamento` VALUES (121, 307, 1, 1600.00, 132, '2025-01-25 17:36:32');
INSERT INTO `tb_detalhes_pagamento` VALUES (122, 308, 1, 1600.00, 132, '2025-01-25 17:36:32');
INSERT INTO `tb_detalhes_pagamento` VALUES (123, 309, 1, 1600.00, 132, '2025-01-25 17:36:32');
INSERT INTO `tb_detalhes_pagamento` VALUES (124, 310, 1, 2550.00, 132, '2025-01-25 17:47:07');
INSERT INTO `tb_detalhes_pagamento` VALUES (125, 311, 1, 2550.00, 132, '2025-01-25 17:47:07');
INSERT INTO `tb_detalhes_pagamento` VALUES (126, 312, 1, 2550.00, 132, '2025-01-25 17:47:07');
INSERT INTO `tb_detalhes_pagamento` VALUES (127, 313, 1, 200.00, 101, '2025-01-25 18:04:23');
INSERT INTO `tb_detalhes_pagamento` VALUES (128, 314, 1, 400.00, 101, '2025-01-25 18:06:26');
INSERT INTO `tb_detalhes_pagamento` VALUES (129, 315, 1, 500.00, 101, '2025-01-25 18:22:33');
INSERT INTO `tb_detalhes_pagamento` VALUES (130, 316, 2, 950.00, 101, '2025-01-25 19:05:44');
INSERT INTO `tb_detalhes_pagamento` VALUES (131, 317, 2, 950.00, 101, '2025-01-25 19:05:44');
INSERT INTO `tb_detalhes_pagamento` VALUES (132, 318, 2, 950.00, 101, '2025-01-25 19:05:44');
INSERT INTO `tb_detalhes_pagamento` VALUES (133, 319, 2, 950.00, 101, '2025-01-25 19:05:45');
INSERT INTO `tb_detalhes_pagamento` VALUES (134, 320, 1, 5950.00, 101, '2025-01-25 19:22:04');
INSERT INTO `tb_detalhes_pagamento` VALUES (135, 321, 1, 5950.00, 101, '2025-01-25 19:22:04');
INSERT INTO `tb_detalhes_pagamento` VALUES (136, 322, 1, 5950.00, 101, '2025-01-25 19:22:04');
INSERT INTO `tb_detalhes_pagamento` VALUES (137, 323, 1, 1500.00, 132, '2025-01-25 19:48:38');
INSERT INTO `tb_detalhes_pagamento` VALUES (138, 324, 1, 1500.00, 132, '2025-01-25 19:48:38');
INSERT INTO `tb_detalhes_pagamento` VALUES (139, 325, 2, 1200.00, 132, '2025-01-25 20:08:41');
INSERT INTO `tb_detalhes_pagamento` VALUES (140, 326, 2, 1200.00, 132, '2025-01-25 20:08:41');
INSERT INTO `tb_detalhes_pagamento` VALUES (141, 327, 1, 300.00, 132, '2025-01-25 20:10:34');
INSERT INTO `tb_detalhes_pagamento` VALUES (142, 328, 1, 600.00, 132, '2025-01-25 20:49:52');
INSERT INTO `tb_detalhes_pagamento` VALUES (143, 329, 1, 400.00, 132, '2025-01-25 20:58:18');
INSERT INTO `tb_detalhes_pagamento` VALUES (144, 330, 1, 5000.00, 132, '2025-01-25 21:02:06');
INSERT INTO `tb_detalhes_pagamento` VALUES (145, 331, 1, 200.00, 0, '2025-01-26 06:48:34');
INSERT INTO `tb_detalhes_pagamento` VALUES (146, 332, 1, 400.00, 0, '2025-01-26 07:17:38');
INSERT INTO `tb_detalhes_pagamento` VALUES (147, 333, 1, 500.00, 0, '2025-01-26 08:28:20');
INSERT INTO `tb_detalhes_pagamento` VALUES (148, 334, 1, 1000.00, 0, '2025-01-26 08:53:15');
INSERT INTO `tb_detalhes_pagamento` VALUES (149, 335, 1, 500.00, 0, '2025-01-26 09:02:26');
INSERT INTO `tb_detalhes_pagamento` VALUES (150, 336, 1, 500.00, 0, '2025-01-26 09:06:41');
INSERT INTO `tb_detalhes_pagamento` VALUES (151, 337, 1, 700.00, 0, '2025-01-26 09:44:43');
INSERT INTO `tb_detalhes_pagamento` VALUES (152, 338, 1, 700.00, 0, '2025-01-26 09:44:43');
INSERT INTO `tb_detalhes_pagamento` VALUES (153, 339, 1, 1000.00, 130, '2025-01-26 14:30:47');
INSERT INTO `tb_detalhes_pagamento` VALUES (154, 340, 1, 1000.00, 130, '2025-01-26 14:30:47');
INSERT INTO `tb_detalhes_pagamento` VALUES (155, 341, 1, 500000.00, 129, '2025-01-26 16:20:04');
INSERT INTO `tb_detalhes_pagamento` VALUES (156, 342, 1, 500000.00, 129, '2025-01-26 16:20:04');
INSERT INTO `tb_detalhes_pagamento` VALUES (157, 343, 1, 500000.00, 129, '2025-01-26 16:20:04');
INSERT INTO `tb_detalhes_pagamento` VALUES (158, 344, 1, 500000.00, 129, '2025-01-26 16:20:04');
INSERT INTO `tb_detalhes_pagamento` VALUES (159, 345, 1, 500000.00, 129, '2025-01-26 16:20:04');
INSERT INTO `tb_detalhes_pagamento` VALUES (160, 346, 1, 500000.00, 129, '2025-01-26 16:20:04');
INSERT INTO `tb_detalhes_pagamento` VALUES (161, 347, 1, 500000.00, 129, '2025-01-26 16:20:04');
INSERT INTO `tb_detalhes_pagamento` VALUES (162, 348, 1, 500000.00, 129, '2025-01-26 16:20:04');
INSERT INTO `tb_detalhes_pagamento` VALUES (163, 349, 1, 500000.00, 129, '2025-01-26 16:20:04');
INSERT INTO `tb_detalhes_pagamento` VALUES (164, 350, 1, 500000.00, 129, '2025-01-26 16:20:04');
INSERT INTO `tb_detalhes_pagamento` VALUES (165, 351, 1, 500000.00, 129, '2025-01-26 16:20:04');
INSERT INTO `tb_detalhes_pagamento` VALUES (166, 352, 1, 500000.00, 129, '2025-01-26 16:20:04');
INSERT INTO `tb_detalhes_pagamento` VALUES (167, 353, 1, 500000.00, 129, '2025-01-26 16:20:04');
INSERT INTO `tb_detalhes_pagamento` VALUES (168, 354, 1, 500000.00, 129, '2025-01-26 16:20:04');
INSERT INTO `tb_detalhes_pagamento` VALUES (169, 355, 1, 500000.00, 129, '2025-01-26 16:20:04');
INSERT INTO `tb_detalhes_pagamento` VALUES (170, 356, 1, 500000.00, 129, '2025-01-26 16:20:04');
INSERT INTO `tb_detalhes_pagamento` VALUES (171, 357, 1, 500000.00, 129, '2025-01-26 16:20:04');
INSERT INTO `tb_detalhes_pagamento` VALUES (172, 358, 1, 500000.00, 129, '2025-01-26 16:20:04');
INSERT INTO `tb_detalhes_pagamento` VALUES (173, 359, 1, 500000.00, 129, '2025-01-26 16:20:04');
INSERT INTO `tb_detalhes_pagamento` VALUES (174, 360, 1, 500000.00, 129, '2025-01-26 16:20:04');
INSERT INTO `tb_detalhes_pagamento` VALUES (175, 361, 1, 500000.00, 129, '2025-01-26 16:20:04');
INSERT INTO `tb_detalhes_pagamento` VALUES (176, 362, 1, 500000.00, 129, '2025-01-26 16:20:04');
INSERT INTO `tb_detalhes_pagamento` VALUES (177, 363, 1, 500000.00, 129, '2025-01-26 16:20:04');
INSERT INTO `tb_detalhes_pagamento` VALUES (178, 364, 1, 500000.00, 129, '2025-01-26 16:20:04');
INSERT INTO `tb_detalhes_pagamento` VALUES (179, 365, 1, 500000.00, 129, '2025-01-26 16:20:04');
INSERT INTO `tb_detalhes_pagamento` VALUES (180, 366, 1, 500000.00, 129, '2025-01-26 16:20:04');
INSERT INTO `tb_detalhes_pagamento` VALUES (181, 367, 1, 500000.00, 129, '2025-01-26 16:20:04');
INSERT INTO `tb_detalhes_pagamento` VALUES (182, 368, 1, 500000.00, 129, '2025-01-26 16:20:04');
INSERT INTO `tb_detalhes_pagamento` VALUES (183, 369, 1, 500000.00, 129, '2025-01-26 16:20:04');
INSERT INTO `tb_detalhes_pagamento` VALUES (184, 370, 1, 500000.00, 129, '2025-01-26 16:20:04');
INSERT INTO `tb_detalhes_pagamento` VALUES (185, 371, 1, 500000.00, 129, '2025-01-26 16:20:04');
INSERT INTO `tb_detalhes_pagamento` VALUES (186, 372, 1, 500000.00, 129, '2025-01-26 16:20:04');
INSERT INTO `tb_detalhes_pagamento` VALUES (187, 373, 1, 500000.00, 129, '2025-01-26 16:20:04');
INSERT INTO `tb_detalhes_pagamento` VALUES (188, 374, 1, 500000.00, 129, '2025-01-26 16:20:04');
INSERT INTO `tb_detalhes_pagamento` VALUES (189, 375, 1, 500000.00, 129, '2025-01-26 16:20:04');
INSERT INTO `tb_detalhes_pagamento` VALUES (190, 376, 1, 500000.00, 129, '2025-01-26 16:20:04');
INSERT INTO `tb_detalhes_pagamento` VALUES (191, 377, 1, 500000.00, 129, '2025-01-26 16:20:04');
INSERT INTO `tb_detalhes_pagamento` VALUES (192, 378, 1, 500000.00, 129, '2025-01-26 16:20:04');
INSERT INTO `tb_detalhes_pagamento` VALUES (193, 379, 1, 500000.00, 129, '2025-01-26 16:20:04');
INSERT INTO `tb_detalhes_pagamento` VALUES (194, 380, 1, 500000.00, 129, '2025-01-26 16:20:04');
INSERT INTO `tb_detalhes_pagamento` VALUES (195, 381, 1, 500000.00, 129, '2025-01-26 16:20:04');
INSERT INTO `tb_detalhes_pagamento` VALUES (196, 382, 1, 500000.00, 129, '2025-01-26 16:20:04');
INSERT INTO `tb_detalhes_pagamento` VALUES (197, 383, 1, 500000.00, 129, '2025-01-26 16:20:04');
INSERT INTO `tb_detalhes_pagamento` VALUES (198, 384, 1, 500000.00, 129, '2025-01-26 16:20:04');
INSERT INTO `tb_detalhes_pagamento` VALUES (199, 385, 1, 700000.00, 129, '2025-01-26 17:36:31');
INSERT INTO `tb_detalhes_pagamento` VALUES (200, 386, 1, 700000.00, 129, '2025-01-26 17:36:31');
INSERT INTO `tb_detalhes_pagamento` VALUES (201, 387, 1, 700000.00, 129, '2025-01-26 17:36:31');
INSERT INTO `tb_detalhes_pagamento` VALUES (202, 388, 1, 700000.00, 129, '2025-01-26 17:36:31');
INSERT INTO `tb_detalhes_pagamento` VALUES (203, 389, 1, 700000.00, 129, '2025-01-26 17:36:31');
INSERT INTO `tb_detalhes_pagamento` VALUES (204, 390, 1, 700000.00, 129, '2025-01-26 17:36:31');
INSERT INTO `tb_detalhes_pagamento` VALUES (205, 391, 1, 700000.00, 129, '2025-01-26 17:36:31');
INSERT INTO `tb_detalhes_pagamento` VALUES (206, 392, 1, 700000.00, 129, '2025-01-26 17:36:31');
INSERT INTO `tb_detalhes_pagamento` VALUES (207, 393, 1, 700000.00, 129, '2025-01-26 17:36:31');
INSERT INTO `tb_detalhes_pagamento` VALUES (208, 394, 1, 700000.00, 129, '2025-01-26 17:36:31');
INSERT INTO `tb_detalhes_pagamento` VALUES (209, 395, 1, 700000.00, 129, '2025-01-26 17:36:31');
INSERT INTO `tb_detalhes_pagamento` VALUES (210, 396, 1, 700000.00, 129, '2025-01-26 17:36:31');
INSERT INTO `tb_detalhes_pagamento` VALUES (211, 397, 1, 700000.00, 129, '2025-01-26 17:36:31');
INSERT INTO `tb_detalhes_pagamento` VALUES (212, 398, 1, 700000.00, 129, '2025-01-26 17:36:31');
INSERT INTO `tb_detalhes_pagamento` VALUES (213, 399, 1, 700000.00, 129, '2025-01-26 17:36:31');
INSERT INTO `tb_detalhes_pagamento` VALUES (214, 400, 1, 700000.00, 129, '2025-01-26 17:36:31');
INSERT INTO `tb_detalhes_pagamento` VALUES (215, 401, 1, 700000.00, 129, '2025-01-26 17:36:31');
INSERT INTO `tb_detalhes_pagamento` VALUES (216, 402, 1, 700000.00, 129, '2025-01-26 17:36:31');
INSERT INTO `tb_detalhes_pagamento` VALUES (217, 403, 1, 700000.00, 129, '2025-01-26 17:36:31');
INSERT INTO `tb_detalhes_pagamento` VALUES (218, 404, 1, 700000.00, 129, '2025-01-26 17:36:31');
INSERT INTO `tb_detalhes_pagamento` VALUES (219, 405, 1, 700000.00, 129, '2025-01-26 17:36:32');
INSERT INTO `tb_detalhes_pagamento` VALUES (220, 406, 1, 700000.00, 129, '2025-01-26 17:36:32');
INSERT INTO `tb_detalhes_pagamento` VALUES (221, 407, 1, 700000.00, 129, '2025-01-26 17:36:32');
INSERT INTO `tb_detalhes_pagamento` VALUES (222, 408, 1, 700000.00, 129, '2025-01-26 17:36:32');
INSERT INTO `tb_detalhes_pagamento` VALUES (223, 409, 1, 700000.00, 129, '2025-01-26 17:36:32');
INSERT INTO `tb_detalhes_pagamento` VALUES (224, 410, 1, 700000.00, 129, '2025-01-26 17:36:32');
INSERT INTO `tb_detalhes_pagamento` VALUES (225, 411, 1, 700000.00, 129, '2025-01-26 17:36:32');
INSERT INTO `tb_detalhes_pagamento` VALUES (226, 412, 1, 700000.00, 129, '2025-01-26 17:36:32');
INSERT INTO `tb_detalhes_pagamento` VALUES (227, 413, 1, 700000.00, 129, '2025-01-26 17:36:32');
INSERT INTO `tb_detalhes_pagamento` VALUES (228, 414, 1, 700000.00, 129, '2025-01-26 17:36:32');
INSERT INTO `tb_detalhes_pagamento` VALUES (229, 415, 1, 700000.00, 129, '2025-01-26 17:36:32');
INSERT INTO `tb_detalhes_pagamento` VALUES (230, 416, 1, 700000.00, 129, '2025-01-26 17:36:32');
INSERT INTO `tb_detalhes_pagamento` VALUES (231, 417, 1, 700000.00, 129, '2025-01-26 17:36:32');
INSERT INTO `tb_detalhes_pagamento` VALUES (232, 418, 1, 700000.00, 129, '2025-01-26 17:36:32');
INSERT INTO `tb_detalhes_pagamento` VALUES (233, 419, 1, 700000.00, 129, '2025-01-26 17:36:32');
INSERT INTO `tb_detalhes_pagamento` VALUES (234, 420, 1, 700000.00, 129, '2025-01-26 17:36:32');
INSERT INTO `tb_detalhes_pagamento` VALUES (235, 421, 1, 700000.00, 129, '2025-01-26 17:36:32');
INSERT INTO `tb_detalhes_pagamento` VALUES (236, 422, 1, 700000.00, 129, '2025-01-26 17:36:32');
INSERT INTO `tb_detalhes_pagamento` VALUES (237, 423, 1, 700000.00, 129, '2025-01-26 17:36:32');
INSERT INTO `tb_detalhes_pagamento` VALUES (238, 424, 1, 700000.00, 129, '2025-01-26 17:36:32');
INSERT INTO `tb_detalhes_pagamento` VALUES (239, 425, 1, 700000.00, 129, '2025-01-26 17:36:32');
INSERT INTO `tb_detalhes_pagamento` VALUES (240, 426, 1, 700000.00, 129, '2025-01-26 17:36:32');
INSERT INTO `tb_detalhes_pagamento` VALUES (241, 427, 1, 700000.00, 129, '2025-01-26 17:36:32');
INSERT INTO `tb_detalhes_pagamento` VALUES (242, 428, 1, 700000.00, 129, '2025-01-26 17:36:32');
INSERT INTO `tb_detalhes_pagamento` VALUES (243, 429, 1, 700000.00, 129, '2025-01-26 17:36:32');
INSERT INTO `tb_detalhes_pagamento` VALUES (244, 430, 1, 700000.00, 129, '2025-01-26 17:36:32');
INSERT INTO `tb_detalhes_pagamento` VALUES (245, 431, 1, 700000.00, 129, '2025-01-26 17:36:32');
INSERT INTO `tb_detalhes_pagamento` VALUES (246, 432, 1, 700000.00, 129, '2025-01-26 17:36:32');
INSERT INTO `tb_detalhes_pagamento` VALUES (247, 433, 1, 700000.00, 129, '2025-01-26 17:36:32');
INSERT INTO `tb_detalhes_pagamento` VALUES (248, 434, 1, 700000.00, 129, '2025-01-26 17:36:32');
INSERT INTO `tb_detalhes_pagamento` VALUES (249, 435, 1, 700000.00, 129, '2025-01-26 17:36:32');
INSERT INTO `tb_detalhes_pagamento` VALUES (250, 436, 1, 700000.00, 129, '2025-01-26 17:36:32');
INSERT INTO `tb_detalhes_pagamento` VALUES (251, 437, 1, 700000.00, 129, '2025-01-26 17:36:32');
INSERT INTO `tb_detalhes_pagamento` VALUES (252, 438, 1, 700000.00, 129, '2025-01-26 17:36:32');
INSERT INTO `tb_detalhes_pagamento` VALUES (253, 439, 1, 700000.00, 129, '2025-01-26 17:36:32');
INSERT INTO `tb_detalhes_pagamento` VALUES (254, 440, 1, 700000.00, 129, '2025-01-26 17:36:32');
INSERT INTO `tb_detalhes_pagamento` VALUES (255, 441, 1, 700000.00, 129, '2025-01-26 17:36:32');
INSERT INTO `tb_detalhes_pagamento` VALUES (256, 442, 1, 700000.00, 129, '2025-01-26 17:36:32');
INSERT INTO `tb_detalhes_pagamento` VALUES (257, 443, 1, 700000.00, 129, '2025-01-26 17:36:32');
INSERT INTO `tb_detalhes_pagamento` VALUES (258, 444, 1, 700000.00, 129, '2025-01-26 17:36:32');
INSERT INTO `tb_detalhes_pagamento` VALUES (259, 445, 1, 700000.00, 129, '2025-01-26 17:36:32');
INSERT INTO `tb_detalhes_pagamento` VALUES (260, 446, 1, 700000.00, 129, '2025-01-26 17:36:32');
INSERT INTO `tb_detalhes_pagamento` VALUES (261, 447, 1, 500.00, 130, '2025-01-26 17:38:03');
INSERT INTO `tb_detalhes_pagamento` VALUES (262, 448, 1, 500.00, 130, '2025-01-26 17:56:02');
INSERT INTO `tb_detalhes_pagamento` VALUES (263, 449, 1, 300.00, 130, '2025-01-26 18:00:22');
INSERT INTO `tb_detalhes_pagamento` VALUES (264, 450, 1, 1200.00, 130, '2025-01-26 18:04:48');
INSERT INTO `tb_detalhes_pagamento` VALUES (265, 451, 1, 1200.00, 130, '2025-01-26 18:04:48');
INSERT INTO `tb_detalhes_pagamento` VALUES (269, 455, 1, 2000.00, 130, '2025-01-26 18:29:47');
INSERT INTO `tb_detalhes_pagamento` VALUES (270, 456, 1, 2000.00, 130, '2025-01-26 18:37:50');
INSERT INTO `tb_detalhes_pagamento` VALUES (276, 462, 1, 300.00, 131, '2025-01-27 16:46:31');
INSERT INTO `tb_detalhes_pagamento` VALUES (277, 463, 1, 5000.00, 131, '2025-01-27 17:02:20');
INSERT INTO `tb_detalhes_pagamento` VALUES (278, 464, 1, 5000.00, 131, '2025-01-27 17:02:20');
INSERT INTO `tb_detalhes_pagamento` VALUES (279, 465, 1, 5000.00, 131, '2025-01-27 17:02:20');
INSERT INTO `tb_detalhes_pagamento` VALUES (280, 466, 1, 5000.00, 131, '2025-01-27 17:02:20');
INSERT INTO `tb_detalhes_pagamento` VALUES (281, 467, 1, 500.00, 131, '2025-01-27 17:10:25');
INSERT INTO `tb_detalhes_pagamento` VALUES (282, 468, 1, 5000.00, 131, '2025-01-27 17:13:49');
INSERT INTO `tb_detalhes_pagamento` VALUES (283, 469, 1, 500.00, 131, '2025-01-27 17:20:26');
INSERT INTO `tb_detalhes_pagamento` VALUES (284, 470, 1, 200.00, 131, '2025-01-27 17:22:20');
INSERT INTO `tb_detalhes_pagamento` VALUES (285, 471, 1, 700.00, 131, '2025-01-27 17:29:25');
INSERT INTO `tb_detalhes_pagamento` VALUES (286, 472, 1, 700.00, 131, '2025-01-27 17:29:25');
INSERT INTO `tb_detalhes_pagamento` VALUES (287, 473, 1, 900.00, 131, '2025-01-27 17:40:30');
INSERT INTO `tb_detalhes_pagamento` VALUES (288, 474, 1, 2000.00, 131, '2025-01-27 17:46:08');
INSERT INTO `tb_detalhes_pagamento` VALUES (289, 475, 1, 500.00, 131, '2025-01-27 17:51:58');
INSERT INTO `tb_detalhes_pagamento` VALUES (290, 476, 1, 500.00, 131, '2025-01-27 18:02:56');
INSERT INTO `tb_detalhes_pagamento` VALUES (291, 477, 1, 200.00, 131, '2025-01-27 18:25:37');
INSERT INTO `tb_detalhes_pagamento` VALUES (292, 478, 1, 2000.00, 131, '2025-01-27 19:02:51');
INSERT INTO `tb_detalhes_pagamento` VALUES (293, 479, 1, 750.00, 131, '2025-01-27 19:05:59');
INSERT INTO `tb_detalhes_pagamento` VALUES (294, 480, 1, 1000.00, 131, '2025-01-27 19:11:39');
INSERT INTO `tb_detalhes_pagamento` VALUES (295, 481, 2, 1800.00, 131, '2025-01-27 19:49:28');
INSERT INTO `tb_detalhes_pagamento` VALUES (296, 482, 2, 1800.00, 131, '2025-01-27 19:49:28');
INSERT INTO `tb_detalhes_pagamento` VALUES (297, 483, 2, 1800.00, 131, '2025-01-27 19:49:28');
INSERT INTO `tb_detalhes_pagamento` VALUES (298, 484, 1, 500.00, 131, '2025-01-27 19:50:57');
INSERT INTO `tb_detalhes_pagamento` VALUES (299, 485, 1, 2000.00, 132, '2025-01-28 12:16:27');
INSERT INTO `tb_detalhes_pagamento` VALUES (300, 486, 2, 500.00, 132, '2025-01-28 12:54:43');
INSERT INTO `tb_detalhes_pagamento` VALUES (301, 487, 2, 5600.00, 132, '2025-01-28 14:09:46');
INSERT INTO `tb_detalhes_pagamento` VALUES (302, 488, 2, 5600.00, 132, '2025-01-28 14:09:46');
INSERT INTO `tb_detalhes_pagamento` VALUES (303, 489, 2, 5600.00, 132, '2025-01-28 14:09:46');
INSERT INTO `tb_detalhes_pagamento` VALUES (304, 490, 1, 400.00, 132, '2025-01-28 14:10:29');
INSERT INTO `tb_detalhes_pagamento` VALUES (305, 491, 2, 500.00, 0, '2025-01-28 17:03:58');
INSERT INTO `tb_detalhes_pagamento` VALUES (306, 492, 1, 400.00, 0, '2025-01-28 17:04:44');
INSERT INTO `tb_detalhes_pagamento` VALUES (307, 493, 1, 200.00, 0, '2025-01-28 17:13:05');
INSERT INTO `tb_detalhes_pagamento` VALUES (308, 494, 1, 200.00, 0, '2025-01-28 18:47:50');
INSERT INTO `tb_detalhes_pagamento` VALUES (309, 495, 1, 350.00, 0, '2025-01-28 19:02:51');
INSERT INTO `tb_detalhes_pagamento` VALUES (313, 499, 2, 700.00, 132, '2025-01-28 19:24:42');
INSERT INTO `tb_detalhes_pagamento` VALUES (315, 501, 1, 2000.00, 132, '2025-01-29 06:38:18');
INSERT INTO `tb_detalhes_pagamento` VALUES (316, 502, 1, 2000.00, 132, '2025-01-29 06:38:18');
INSERT INTO `tb_detalhes_pagamento` VALUES (317, 503, 1, 2000.00, 132, '2025-01-29 06:38:18');
INSERT INTO `tb_detalhes_pagamento` VALUES (318, 504, 1, 5000.00, 0, '2025-01-29 11:15:27');
INSERT INTO `tb_detalhes_pagamento` VALUES (319, 505, 1, 5000.00, 0, '2025-01-29 11:15:27');
INSERT INTO `tb_detalhes_pagamento` VALUES (320, 506, 1, 5000.00, 130, '2025-01-29 11:21:20');
INSERT INTO `tb_detalhes_pagamento` VALUES (321, 507, 1, 5000.00, 130, '2025-01-29 11:21:20');
INSERT INTO `tb_detalhes_pagamento` VALUES (322, 508, 1, 1000.00, 129, '2025-01-29 11:39:22');
INSERT INTO `tb_detalhes_pagamento` VALUES (323, 509, 1, 1000.00, 129, '2025-01-29 11:58:54');
INSERT INTO `tb_detalhes_pagamento` VALUES (324, 510, 1, 1000.00, 129, '2025-01-29 11:58:54');
INSERT INTO `tb_detalhes_pagamento` VALUES (325, 511, 1, 2000.00, 129, '2025-01-29 12:22:50');
INSERT INTO `tb_detalhes_pagamento` VALUES (326, 512, 1, 5000.00, 129, '2025-01-29 12:41:28');
INSERT INTO `tb_detalhes_pagamento` VALUES (327, 513, 2, 3250.00, 129, '2025-01-29 15:05:59');
INSERT INTO `tb_detalhes_pagamento` VALUES (328, 514, 2, 3250.00, 129, '2025-01-29 15:05:59');
INSERT INTO `tb_detalhes_pagamento` VALUES (329, 515, 2, 3250.00, 129, '2025-01-29 15:05:59');
INSERT INTO `tb_detalhes_pagamento` VALUES (330, 516, 2, 3250.00, 129, '2025-01-29 15:05:59');
INSERT INTO `tb_detalhes_pagamento` VALUES (331, 517, 2, 3250.00, 129, '2025-01-29 15:05:59');
INSERT INTO `tb_detalhes_pagamento` VALUES (332, 518, 2, 3250.00, 129, '2025-01-29 15:05:59');
INSERT INTO `tb_detalhes_pagamento` VALUES (333, 519, 2, 3250.00, 129, '2025-01-29 15:05:59');
INSERT INTO `tb_detalhes_pagamento` VALUES (334, 520, 1, 5000.00, 129, '2025-01-29 15:39:21');
INSERT INTO `tb_detalhes_pagamento` VALUES (335, 521, 1, 5000.00, 129, '2025-01-29 15:39:21');
INSERT INTO `tb_detalhes_pagamento` VALUES (336, 522, 1, 5000.00, 129, '2025-01-29 15:39:21');
INSERT INTO `tb_detalhes_pagamento` VALUES (337, 523, 1, 5000.00, 129, '2025-01-29 15:39:21');
INSERT INTO `tb_detalhes_pagamento` VALUES (338, 524, 1, 1000.00, 130, '2025-01-29 17:38:50');
INSERT INTO `tb_detalhes_pagamento` VALUES (339, 525, 2, 400.00, 130, '2025-01-29 17:52:56');
INSERT INTO `tb_detalhes_pagamento` VALUES (340, 526, 2, 1250.00, 130, '2025-01-29 18:09:14');
INSERT INTO `tb_detalhes_pagamento` VALUES (341, 527, 2, 1250.00, 130, '2025-01-29 18:09:14');
INSERT INTO `tb_detalhes_pagamento` VALUES (342, 528, 1, 450.00, 130, '2025-01-29 18:10:17');
INSERT INTO `tb_detalhes_pagamento` VALUES (343, 529, 1, 1500.00, 131, '2025-01-30 07:25:25');
INSERT INTO `tb_detalhes_pagamento` VALUES (344, 530, 1, 1500.00, 131, '2025-01-30 07:25:25');
INSERT INTO `tb_detalhes_pagamento` VALUES (345, 531, 1, 1500.00, 131, '2025-01-30 07:25:25');
INSERT INTO `tb_detalhes_pagamento` VALUES (346, 532, 1, 200.00, 131, '2025-01-30 07:44:25');
INSERT INTO `tb_detalhes_pagamento` VALUES (347, 533, 1, 5000.00, 131, '2025-01-30 09:37:57');
INSERT INTO `tb_detalhes_pagamento` VALUES (348, 534, 1, 5000.00, 131, '2025-01-30 09:37:57');
INSERT INTO `tb_detalhes_pagamento` VALUES (349, 535, 1, 5000.00, 131, '2025-01-30 09:37:57');
INSERT INTO `tb_detalhes_pagamento` VALUES (350, 536, 1, 1000.00, 131, '2025-01-30 11:26:10');
INSERT INTO `tb_detalhes_pagamento` VALUES (351, 537, 1, 1000.00, 131, '2025-01-30 11:26:10');
INSERT INTO `tb_detalhes_pagamento` VALUES (352, 538, 1, 250.00, 131, '2025-01-30 12:29:27');
INSERT INTO `tb_detalhes_pagamento` VALUES (353, 539, 1, 5000.00, 131, '2025-01-30 13:06:11');
INSERT INTO `tb_detalhes_pagamento` VALUES (354, 540, 1, 5000.00, 131, '2025-01-30 13:06:11');
INSERT INTO `tb_detalhes_pagamento` VALUES (355, 541, 1, 5000.00, 131, '2025-01-30 13:06:12');
INSERT INTO `tb_detalhes_pagamento` VALUES (356, 542, 1, 1000.00, 131, '2025-01-30 13:26:48');
INSERT INTO `tb_detalhes_pagamento` VALUES (357, 543, 1, 1500.00, 101, '2025-01-30 13:55:28');
INSERT INTO `tb_detalhes_pagamento` VALUES (358, 544, 1, 1500.00, 101, '2025-01-30 13:55:28');
INSERT INTO `tb_detalhes_pagamento` VALUES (359, 545, 1, 20500.00, 129, '2025-01-30 14:12:34');
INSERT INTO `tb_detalhes_pagamento` VALUES (360, 546, 1, 20500.00, 129, '2025-01-30 14:12:34');
INSERT INTO `tb_detalhes_pagamento` VALUES (361, 547, 1, 20500.00, 129, '2025-01-30 14:12:34');
INSERT INTO `tb_detalhes_pagamento` VALUES (362, 548, 1, 20500.00, 129, '2025-01-30 14:12:34');
INSERT INTO `tb_detalhes_pagamento` VALUES (363, 549, 1, 20500.00, 129, '2025-01-30 14:12:34');
INSERT INTO `tb_detalhes_pagamento` VALUES (364, 550, 1, 20500.00, 129, '2025-01-30 14:12:34');
INSERT INTO `tb_detalhes_pagamento` VALUES (365, 551, 1, 20500.00, 129, '2025-01-30 14:12:34');
INSERT INTO `tb_detalhes_pagamento` VALUES (366, 552, 1, 20500.00, 129, '2025-01-30 14:12:34');
INSERT INTO `tb_detalhes_pagamento` VALUES (367, 553, 1, 20500.00, 129, '2025-01-30 14:12:34');
INSERT INTO `tb_detalhes_pagamento` VALUES (368, 554, 1, 20500.00, 129, '2025-01-30 14:12:34');
INSERT INTO `tb_detalhes_pagamento` VALUES (369, 555, 1, 20500.00, 129, '2025-01-30 14:12:34');
INSERT INTO `tb_detalhes_pagamento` VALUES (370, 556, 1, 20500.00, 129, '2025-01-30 14:12:34');
INSERT INTO `tb_detalhes_pagamento` VALUES (371, 557, 1, 20500.00, 129, '2025-01-30 14:12:34');
INSERT INTO `tb_detalhes_pagamento` VALUES (372, 558, 1, 20500.00, 129, '2025-01-30 14:12:34');
INSERT INTO `tb_detalhes_pagamento` VALUES (373, 559, 1, 20500.00, 129, '2025-01-30 14:12:34');
INSERT INTO `tb_detalhes_pagamento` VALUES (374, 560, 1, 20500.00, 129, '2025-01-30 14:12:34');
INSERT INTO `tb_detalhes_pagamento` VALUES (375, 561, 1, 20500.00, 129, '2025-01-30 14:12:34');
INSERT INTO `tb_detalhes_pagamento` VALUES (376, 562, 1, 20500.00, 129, '2025-01-30 14:12:34');
INSERT INTO `tb_detalhes_pagamento` VALUES (377, 563, 1, 20500.00, 129, '2025-01-30 14:12:34');
INSERT INTO `tb_detalhes_pagamento` VALUES (378, 564, 1, 20500.00, 129, '2025-01-30 14:12:34');
INSERT INTO `tb_detalhes_pagamento` VALUES (379, 565, 1, 20500.00, 129, '2025-01-30 14:12:34');
INSERT INTO `tb_detalhes_pagamento` VALUES (380, 566, 1, 20500.00, 129, '2025-01-30 14:12:34');
INSERT INTO `tb_detalhes_pagamento` VALUES (381, 567, 1, 12300.00, 129, '2025-01-30 14:23:18');
INSERT INTO `tb_detalhes_pagamento` VALUES (382, 568, 1, 12300.00, 129, '2025-01-30 14:23:18');
INSERT INTO `tb_detalhes_pagamento` VALUES (383, 569, 1, 12300.00, 129, '2025-01-30 14:23:18');
INSERT INTO `tb_detalhes_pagamento` VALUES (384, 570, 1, 12300.00, 129, '2025-01-30 14:23:18');
INSERT INTO `tb_detalhes_pagamento` VALUES (385, 571, 1, 12300.00, 129, '2025-01-30 14:23:18');
INSERT INTO `tb_detalhes_pagamento` VALUES (386, 572, 1, 12300.00, 129, '2025-01-30 14:23:18');
INSERT INTO `tb_detalhes_pagamento` VALUES (387, 573, 1, 12300.00, 129, '2025-01-30 14:23:18');
INSERT INTO `tb_detalhes_pagamento` VALUES (388, 574, 1, 12300.00, 129, '2025-01-30 14:23:18');
INSERT INTO `tb_detalhes_pagamento` VALUES (389, 575, 1, 12300.00, 129, '2025-01-30 14:23:18');
INSERT INTO `tb_detalhes_pagamento` VALUES (390, 576, 1, 12300.00, 129, '2025-01-30 14:23:18');
INSERT INTO `tb_detalhes_pagamento` VALUES (391, 577, 1, 12300.00, 129, '2025-01-30 14:23:18');
INSERT INTO `tb_detalhes_pagamento` VALUES (392, 578, 1, 12300.00, 129, '2025-01-30 14:23:18');
INSERT INTO `tb_detalhes_pagamento` VALUES (393, 579, 1, 12300.00, 129, '2025-01-30 14:23:18');
INSERT INTO `tb_detalhes_pagamento` VALUES (394, 580, 1, 12300.00, 129, '2025-01-30 14:23:18');
INSERT INTO `tb_detalhes_pagamento` VALUES (395, 581, 1, 12300.00, 129, '2025-01-30 14:23:18');
INSERT INTO `tb_detalhes_pagamento` VALUES (396, 582, 1, 12300.00, 129, '2025-01-30 14:23:18');
INSERT INTO `tb_detalhes_pagamento` VALUES (397, 583, 1, 12300.00, 129, '2025-01-30 14:23:18');
INSERT INTO `tb_detalhes_pagamento` VALUES (398, 584, 1, 12300.00, 129, '2025-01-30 14:23:18');
INSERT INTO `tb_detalhes_pagamento` VALUES (399, 585, 1, 12300.00, 129, '2025-01-30 14:23:18');
INSERT INTO `tb_detalhes_pagamento` VALUES (400, 586, 1, 12300.00, 129, '2025-01-30 14:23:18');
INSERT INTO `tb_detalhes_pagamento` VALUES (401, 587, 1, 12300.00, 129, '2025-01-30 14:23:18');
INSERT INTO `tb_detalhes_pagamento` VALUES (402, 588, 1, 12300.00, 129, '2025-01-30 14:23:18');
INSERT INTO `tb_detalhes_pagamento` VALUES (403, 589, 1, 20600.00, 129, '2025-01-30 14:30:32');
INSERT INTO `tb_detalhes_pagamento` VALUES (404, 590, 1, 20600.00, 129, '2025-01-30 14:30:32');
INSERT INTO `tb_detalhes_pagamento` VALUES (405, 591, 1, 20600.00, 129, '2025-01-30 14:30:32');
INSERT INTO `tb_detalhes_pagamento` VALUES (406, 592, 1, 20600.00, 129, '2025-01-30 14:30:32');
INSERT INTO `tb_detalhes_pagamento` VALUES (407, 593, 1, 20600.00, 129, '2025-01-30 14:30:32');
INSERT INTO `tb_detalhes_pagamento` VALUES (408, 594, 1, 20600.00, 129, '2025-01-30 14:30:32');
INSERT INTO `tb_detalhes_pagamento` VALUES (409, 595, 1, 20600.00, 129, '2025-01-30 14:30:32');
INSERT INTO `tb_detalhes_pagamento` VALUES (410, 596, 1, 20600.00, 129, '2025-01-30 14:30:32');
INSERT INTO `tb_detalhes_pagamento` VALUES (411, 597, 1, 20600.00, 129, '2025-01-30 14:30:32');
INSERT INTO `tb_detalhes_pagamento` VALUES (412, 598, 1, 20600.00, 129, '2025-01-30 14:30:32');
INSERT INTO `tb_detalhes_pagamento` VALUES (413, 599, 1, 20600.00, 129, '2025-01-30 14:30:32');
INSERT INTO `tb_detalhes_pagamento` VALUES (414, 600, 1, 20600.00, 129, '2025-01-30 14:30:32');
INSERT INTO `tb_detalhes_pagamento` VALUES (415, 601, 1, 20600.00, 129, '2025-01-30 14:30:32');
INSERT INTO `tb_detalhes_pagamento` VALUES (416, 602, 1, 20600.00, 129, '2025-01-30 14:30:32');
INSERT INTO `tb_detalhes_pagamento` VALUES (417, 603, 1, 20600.00, 129, '2025-01-30 14:30:32');
INSERT INTO `tb_detalhes_pagamento` VALUES (418, 604, 1, 20600.00, 129, '2025-01-30 14:30:32');
INSERT INTO `tb_detalhes_pagamento` VALUES (419, 605, 1, 20600.00, 129, '2025-01-30 14:30:32');
INSERT INTO `tb_detalhes_pagamento` VALUES (420, 606, 1, 20600.00, 129, '2025-01-30 14:30:32');
INSERT INTO `tb_detalhes_pagamento` VALUES (421, 607, 1, 20600.00, 129, '2025-01-30 14:30:32');
INSERT INTO `tb_detalhes_pagamento` VALUES (422, 608, 1, 20600.00, 129, '2025-01-30 14:30:32');
INSERT INTO `tb_detalhes_pagamento` VALUES (423, 609, 1, 20600.00, 129, '2025-01-30 14:30:32');
INSERT INTO `tb_detalhes_pagamento` VALUES (424, 610, 1, 20600.00, 129, '2025-01-30 14:30:32');
INSERT INTO `tb_detalhes_pagamento` VALUES (425, 611, 1, 20600.00, 129, '2025-01-30 14:30:32');
INSERT INTO `tb_detalhes_pagamento` VALUES (426, 612, 1, 8800.00, 129, '2025-01-30 14:35:40');
INSERT INTO `tb_detalhes_pagamento` VALUES (427, 613, 1, 8800.00, 129, '2025-01-30 14:35:40');
INSERT INTO `tb_detalhes_pagamento` VALUES (428, 614, 1, 8800.00, 129, '2025-01-30 14:35:40');
INSERT INTO `tb_detalhes_pagamento` VALUES (429, 615, 1, 8800.00, 129, '2025-01-30 14:35:40');
INSERT INTO `tb_detalhes_pagamento` VALUES (430, 616, 1, 8800.00, 129, '2025-01-30 14:35:40');
INSERT INTO `tb_detalhes_pagamento` VALUES (431, 617, 1, 8800.00, 129, '2025-01-30 14:35:40');
INSERT INTO `tb_detalhes_pagamento` VALUES (432, 618, 1, 8800.00, 129, '2025-01-30 14:35:40');
INSERT INTO `tb_detalhes_pagamento` VALUES (433, 619, 1, 8800.00, 129, '2025-01-30 14:35:40');
INSERT INTO `tb_detalhes_pagamento` VALUES (434, 620, 1, 8800.00, 129, '2025-01-30 14:35:40');
INSERT INTO `tb_detalhes_pagamento` VALUES (435, 621, 1, 8800.00, 129, '2025-01-30 14:35:40');
INSERT INTO `tb_detalhes_pagamento` VALUES (436, 622, 1, 8800.00, 129, '2025-01-30 14:35:41');
INSERT INTO `tb_detalhes_pagamento` VALUES (437, 623, 1, 8800.00, 129, '2025-01-30 14:35:41');
INSERT INTO `tb_detalhes_pagamento` VALUES (438, 624, 1, 8800.00, 129, '2025-01-30 14:35:41');
INSERT INTO `tb_detalhes_pagamento` VALUES (439, 625, 1, 200.00, 131, '2025-01-30 14:39:31');
INSERT INTO `tb_detalhes_pagamento` VALUES (440, 626, 1, 27700.00, 129, '2025-01-30 14:49:31');
INSERT INTO `tb_detalhes_pagamento` VALUES (441, 627, 1, 27700.00, 129, '2025-01-30 14:49:31');
INSERT INTO `tb_detalhes_pagamento` VALUES (442, 628, 1, 27700.00, 129, '2025-01-30 14:49:31');
INSERT INTO `tb_detalhes_pagamento` VALUES (443, 629, 1, 27700.00, 129, '2025-01-30 14:49:31');
INSERT INTO `tb_detalhes_pagamento` VALUES (444, 630, 1, 27700.00, 129, '2025-01-30 14:49:31');
INSERT INTO `tb_detalhes_pagamento` VALUES (445, 631, 1, 27700.00, 129, '2025-01-30 14:49:31');
INSERT INTO `tb_detalhes_pagamento` VALUES (446, 632, 1, 27700.00, 129, '2025-01-30 14:49:31');
INSERT INTO `tb_detalhes_pagamento` VALUES (447, 633, 1, 27700.00, 129, '2025-01-30 14:49:31');
INSERT INTO `tb_detalhes_pagamento` VALUES (448, 634, 1, 27700.00, 129, '2025-01-30 14:49:31');
INSERT INTO `tb_detalhes_pagamento` VALUES (449, 635, 1, 27700.00, 129, '2025-01-30 14:49:31');
INSERT INTO `tb_detalhes_pagamento` VALUES (450, 636, 1, 27700.00, 129, '2025-01-30 14:49:31');
INSERT INTO `tb_detalhes_pagamento` VALUES (451, 637, 1, 27700.00, 129, '2025-01-30 14:49:31');
INSERT INTO `tb_detalhes_pagamento` VALUES (452, 638, 1, 27700.00, 129, '2025-01-30 14:49:31');
INSERT INTO `tb_detalhes_pagamento` VALUES (453, 639, 1, 27700.00, 129, '2025-01-30 14:49:31');
INSERT INTO `tb_detalhes_pagamento` VALUES (454, 640, 1, 27700.00, 129, '2025-01-30 14:49:31');
INSERT INTO `tb_detalhes_pagamento` VALUES (455, 641, 1, 27700.00, 129, '2025-01-30 14:49:31');
INSERT INTO `tb_detalhes_pagamento` VALUES (456, 642, 1, 27700.00, 129, '2025-01-30 14:49:31');
INSERT INTO `tb_detalhes_pagamento` VALUES (457, 643, 1, 27700.00, 129, '2025-01-30 14:49:31');
INSERT INTO `tb_detalhes_pagamento` VALUES (458, 644, 1, 27700.00, 129, '2025-01-30 14:49:31');
INSERT INTO `tb_detalhes_pagamento` VALUES (459, 645, 1, 27700.00, 129, '2025-01-30 14:49:31');
INSERT INTO `tb_detalhes_pagamento` VALUES (460, 646, 1, 27700.00, 129, '2025-01-30 14:49:31');
INSERT INTO `tb_detalhes_pagamento` VALUES (461, 647, 1, 27700.00, 129, '2025-01-30 14:49:31');
INSERT INTO `tb_detalhes_pagamento` VALUES (462, 648, 1, 27700.00, 129, '2025-01-30 14:49:31');
INSERT INTO `tb_detalhes_pagamento` VALUES (463, 649, 1, 27700.00, 129, '2025-01-30 14:49:31');
INSERT INTO `tb_detalhes_pagamento` VALUES (464, 650, 1, 27700.00, 129, '2025-01-30 14:49:31');
INSERT INTO `tb_detalhes_pagamento` VALUES (465, 651, 1, 40000.00, 129, '2025-01-30 15:01:53');
INSERT INTO `tb_detalhes_pagamento` VALUES (466, 652, 1, 40000.00, 129, '2025-01-30 15:01:53');
INSERT INTO `tb_detalhes_pagamento` VALUES (467, 653, 1, 40000.00, 129, '2025-01-30 15:01:53');
INSERT INTO `tb_detalhes_pagamento` VALUES (468, 654, 1, 40000.00, 129, '2025-01-30 15:01:53');
INSERT INTO `tb_detalhes_pagamento` VALUES (469, 655, 1, 40000.00, 129, '2025-01-30 15:01:53');
INSERT INTO `tb_detalhes_pagamento` VALUES (470, 656, 1, 40000.00, 129, '2025-01-30 15:01:53');
INSERT INTO `tb_detalhes_pagamento` VALUES (471, 657, 1, 40000.00, 129, '2025-01-30 15:01:53');
INSERT INTO `tb_detalhes_pagamento` VALUES (472, 658, 1, 40000.00, 129, '2025-01-30 15:01:53');
INSERT INTO `tb_detalhes_pagamento` VALUES (473, 659, 1, 40000.00, 129, '2025-01-30 15:01:53');
INSERT INTO `tb_detalhes_pagamento` VALUES (474, 660, 1, 40000.00, 129, '2025-01-30 15:01:53');
INSERT INTO `tb_detalhes_pagamento` VALUES (475, 661, 1, 40000.00, 129, '2025-01-30 15:01:53');
INSERT INTO `tb_detalhes_pagamento` VALUES (476, 662, 1, 40000.00, 129, '2025-01-30 15:01:53');
INSERT INTO `tb_detalhes_pagamento` VALUES (477, 663, 1, 40000.00, 129, '2025-01-30 15:01:53');
INSERT INTO `tb_detalhes_pagamento` VALUES (478, 664, 1, 40000.00, 129, '2025-01-30 15:01:53');
INSERT INTO `tb_detalhes_pagamento` VALUES (479, 665, 1, 40000.00, 129, '2025-01-30 15:01:53');
INSERT INTO `tb_detalhes_pagamento` VALUES (480, 666, 1, 40000.00, 129, '2025-01-30 15:01:53');
INSERT INTO `tb_detalhes_pagamento` VALUES (481, 667, 1, 40000.00, 129, '2025-01-30 15:01:53');
INSERT INTO `tb_detalhes_pagamento` VALUES (482, 668, 1, 40000.00, 129, '2025-01-30 15:01:53');
INSERT INTO `tb_detalhes_pagamento` VALUES (483, 669, 1, 40000.00, 129, '2025-01-30 15:01:53');
INSERT INTO `tb_detalhes_pagamento` VALUES (484, 670, 1, 40000.00, 129, '2025-01-30 15:01:53');
INSERT INTO `tb_detalhes_pagamento` VALUES (485, 671, 1, 40000.00, 129, '2025-01-30 15:01:53');
INSERT INTO `tb_detalhes_pagamento` VALUES (486, 672, 1, 40000.00, 129, '2025-01-30 15:01:53');
INSERT INTO `tb_detalhes_pagamento` VALUES (487, 673, 1, 40000.00, 129, '2025-01-30 15:01:53');
INSERT INTO `tb_detalhes_pagamento` VALUES (488, 674, 1, 40000.00, 129, '2025-01-30 15:01:53');
INSERT INTO `tb_detalhes_pagamento` VALUES (489, 675, 1, 40000.00, 129, '2025-01-30 15:01:53');
INSERT INTO `tb_detalhes_pagamento` VALUES (490, 676, 1, 40000.00, 129, '2025-01-30 15:01:53');
INSERT INTO `tb_detalhes_pagamento` VALUES (491, 677, 1, 40000.00, 129, '2025-01-30 15:01:53');
INSERT INTO `tb_detalhes_pagamento` VALUES (492, 678, 1, 40000.00, 129, '2025-01-30 15:01:53');
INSERT INTO `tb_detalhes_pagamento` VALUES (493, 679, 1, 40000.00, 129, '2025-01-30 15:01:53');
INSERT INTO `tb_detalhes_pagamento` VALUES (494, 680, 1, 40000.00, 129, '2025-01-30 15:01:53');
INSERT INTO `tb_detalhes_pagamento` VALUES (495, 681, 1, 40000.00, 129, '2025-01-30 15:01:53');
INSERT INTO `tb_detalhes_pagamento` VALUES (496, 682, 1, 40000.00, 129, '2025-01-30 15:01:53');
INSERT INTO `tb_detalhes_pagamento` VALUES (497, 683, 1, 40000.00, 129, '2025-01-30 15:01:53');
INSERT INTO `tb_detalhes_pagamento` VALUES (498, 684, 1, 40000.00, 129, '2025-01-30 15:01:53');
INSERT INTO `tb_detalhes_pagamento` VALUES (499, 685, 1, 40000.00, 129, '2025-01-30 15:01:53');
INSERT INTO `tb_detalhes_pagamento` VALUES (500, 686, 1, 19700.00, 129, '2025-01-30 15:11:24');
INSERT INTO `tb_detalhes_pagamento` VALUES (501, 687, 1, 19700.00, 129, '2025-01-30 15:11:24');
INSERT INTO `tb_detalhes_pagamento` VALUES (502, 688, 1, 19700.00, 129, '2025-01-30 15:11:24');
INSERT INTO `tb_detalhes_pagamento` VALUES (503, 689, 1, 19700.00, 129, '2025-01-30 15:11:24');
INSERT INTO `tb_detalhes_pagamento` VALUES (504, 690, 1, 19700.00, 129, '2025-01-30 15:11:24');
INSERT INTO `tb_detalhes_pagamento` VALUES (505, 691, 1, 19700.00, 129, '2025-01-30 15:11:24');
INSERT INTO `tb_detalhes_pagamento` VALUES (506, 692, 1, 19700.00, 129, '2025-01-30 15:11:24');
INSERT INTO `tb_detalhes_pagamento` VALUES (507, 693, 1, 19700.00, 129, '2025-01-30 15:11:24');
INSERT INTO `tb_detalhes_pagamento` VALUES (508, 694, 1, 19700.00, 129, '2025-01-30 15:11:24');
INSERT INTO `tb_detalhes_pagamento` VALUES (509, 695, 1, 19700.00, 129, '2025-01-30 15:11:24');
INSERT INTO `tb_detalhes_pagamento` VALUES (510, 696, 1, 19700.00, 129, '2025-01-30 15:11:24');
INSERT INTO `tb_detalhes_pagamento` VALUES (511, 697, 1, 19700.00, 129, '2025-01-30 15:11:24');
INSERT INTO `tb_detalhes_pagamento` VALUES (512, 698, 1, 19700.00, 129, '2025-01-30 15:11:24');
INSERT INTO `tb_detalhes_pagamento` VALUES (513, 699, 1, 19700.00, 129, '2025-01-30 15:11:24');
INSERT INTO `tb_detalhes_pagamento` VALUES (514, 700, 1, 19700.00, 129, '2025-01-30 15:11:24');
INSERT INTO `tb_detalhes_pagamento` VALUES (515, 701, 1, 19700.00, 129, '2025-01-30 15:11:24');
INSERT INTO `tb_detalhes_pagamento` VALUES (516, 702, 1, 19700.00, 129, '2025-01-30 15:11:24');
INSERT INTO `tb_detalhes_pagamento` VALUES (517, 703, 1, 19700.00, 129, '2025-01-30 15:11:24');
INSERT INTO `tb_detalhes_pagamento` VALUES (518, 704, 1, 13800.00, 129, '2025-01-30 15:17:31');
INSERT INTO `tb_detalhes_pagamento` VALUES (519, 705, 1, 13800.00, 129, '2025-01-30 15:17:31');
INSERT INTO `tb_detalhes_pagamento` VALUES (520, 706, 1, 13800.00, 129, '2025-01-30 15:17:31');
INSERT INTO `tb_detalhes_pagamento` VALUES (521, 707, 1, 13800.00, 129, '2025-01-30 15:17:31');
INSERT INTO `tb_detalhes_pagamento` VALUES (522, 708, 1, 13800.00, 129, '2025-01-30 15:17:31');
INSERT INTO `tb_detalhes_pagamento` VALUES (523, 709, 1, 13800.00, 129, '2025-01-30 15:17:31');
INSERT INTO `tb_detalhes_pagamento` VALUES (524, 710, 1, 13800.00, 129, '2025-01-30 15:17:31');
INSERT INTO `tb_detalhes_pagamento` VALUES (525, 711, 1, 13800.00, 129, '2025-01-30 15:17:31');
INSERT INTO `tb_detalhes_pagamento` VALUES (526, 712, 1, 13800.00, 129, '2025-01-30 15:17:31');
INSERT INTO `tb_detalhes_pagamento` VALUES (527, 713, 1, 13800.00, 129, '2025-01-30 15:17:31');
INSERT INTO `tb_detalhes_pagamento` VALUES (528, 714, 1, 13800.00, 129, '2025-01-30 15:17:31');
INSERT INTO `tb_detalhes_pagamento` VALUES (529, 715, 1, 13800.00, 129, '2025-01-30 15:17:31');
INSERT INTO `tb_detalhes_pagamento` VALUES (530, 716, 1, 13800.00, 129, '2025-01-30 15:17:31');
INSERT INTO `tb_detalhes_pagamento` VALUES (531, 717, 1, 13800.00, 129, '2025-01-30 15:17:31');
INSERT INTO `tb_detalhes_pagamento` VALUES (532, 718, 1, 13800.00, 129, '2025-01-30 15:17:31');
INSERT INTO `tb_detalhes_pagamento` VALUES (533, 719, 1, 13800.00, 129, '2025-01-30 15:17:31');
INSERT INTO `tb_detalhes_pagamento` VALUES (534, 720, 1, 13800.00, 129, '2025-01-30 15:17:31');
INSERT INTO `tb_detalhes_pagamento` VALUES (535, 721, 1, 13800.00, 129, '2025-01-30 15:17:31');
INSERT INTO `tb_detalhes_pagamento` VALUES (536, 722, 1, 13800.00, 129, '2025-01-30 15:17:31');
INSERT INTO `tb_detalhes_pagamento` VALUES (537, 723, 1, 3500.00, 129, '2025-01-30 15:19:40');
INSERT INTO `tb_detalhes_pagamento` VALUES (538, 724, 1, 3500.00, 129, '2025-01-30 15:19:40');
INSERT INTO `tb_detalhes_pagamento` VALUES (539, 725, 1, 3500.00, 129, '2025-01-30 15:19:40');
INSERT INTO `tb_detalhes_pagamento` VALUES (540, 726, 1, 3500.00, 129, '2025-01-30 15:19:40');
INSERT INTO `tb_detalhes_pagamento` VALUES (541, 727, 1, 3500.00, 129, '2025-01-30 15:19:40');
INSERT INTO `tb_detalhes_pagamento` VALUES (542, 728, 1, 3500.00, 129, '2025-01-30 15:19:40');
INSERT INTO `tb_detalhes_pagamento` VALUES (543, 729, 1, 3500.00, 129, '2025-01-30 15:19:40');
INSERT INTO `tb_detalhes_pagamento` VALUES (544, 730, 1, 3500.00, 129, '2025-01-30 15:19:40');
INSERT INTO `tb_detalhes_pagamento` VALUES (545, 731, 1, 3500.00, 129, '2025-01-30 15:19:40');
INSERT INTO `tb_detalhes_pagamento` VALUES (546, 732, 2, 3200.00, 131, '2025-01-30 15:39:47');
INSERT INTO `tb_detalhes_pagamento` VALUES (547, 733, 2, 3200.00, 131, '2025-01-30 15:39:47');
INSERT INTO `tb_detalhes_pagamento` VALUES (548, 734, 2, 3200.00, 131, '2025-01-30 15:39:47');
INSERT INTO `tb_detalhes_pagamento` VALUES (549, 735, 2, 3200.00, 131, '2025-01-30 15:39:47');
INSERT INTO `tb_detalhes_pagamento` VALUES (550, 736, 1, 2700.00, 131, '2025-01-30 16:21:56');
INSERT INTO `tb_detalhes_pagamento` VALUES (551, 737, 1, 2700.00, 131, '2025-01-30 16:21:57');
INSERT INTO `tb_detalhes_pagamento` VALUES (552, 738, 2, 3350.00, 131, '2025-01-30 16:26:08');
INSERT INTO `tb_detalhes_pagamento` VALUES (553, 739, 2, 3350.00, 131, '2025-01-30 16:26:08');
INSERT INTO `tb_detalhes_pagamento` VALUES (554, 740, 1, 1900.00, 131, '2025-01-30 16:30:01');
INSERT INTO `tb_detalhes_pagamento` VALUES (555, 741, 1, 1900.00, 131, '2025-01-30 16:30:01');
INSERT INTO `tb_detalhes_pagamento` VALUES (556, 742, 1, 1000.00, 131, '2025-01-30 17:47:03');
INSERT INTO `tb_detalhes_pagamento` VALUES (557, 743, 1, 500.00, 131, '2025-01-30 18:02:00');
INSERT INTO `tb_detalhes_pagamento` VALUES (558, 744, 1, 2000.00, 131, '2025-01-30 18:38:12');
INSERT INTO `tb_detalhes_pagamento` VALUES (559, 745, 1, 2000.00, 131, '2025-01-30 18:38:12');
INSERT INTO `tb_detalhes_pagamento` VALUES (560, 746, 1, 2000.00, 131, '2025-01-30 18:38:12');
INSERT INTO `tb_detalhes_pagamento` VALUES (561, 747, 1, 500.00, 131, '2025-01-30 18:42:39');
INSERT INTO `tb_detalhes_pagamento` VALUES (562, 748, 2, 18000.00, 131, '2025-01-30 18:54:45');
INSERT INTO `tb_detalhes_pagamento` VALUES (563, 749, 2, 18000.00, 131, '2025-01-30 18:54:45');
INSERT INTO `tb_detalhes_pagamento` VALUES (564, 750, 2, 18000.00, 131, '2025-01-30 18:54:46');
INSERT INTO `tb_detalhes_pagamento` VALUES (565, 751, 1, 450.00, 131, '2025-01-30 18:57:30');
INSERT INTO `tb_detalhes_pagamento` VALUES (566, 752, 1, 5000.00, 131, '2025-01-30 19:00:13');
INSERT INTO `tb_detalhes_pagamento` VALUES (567, 753, 1, 100.00, 131, '2025-01-30 19:01:22');
INSERT INTO `tb_detalhes_pagamento` VALUES (568, 754, 1, 1350.00, 131, '2025-01-30 19:42:41');
INSERT INTO `tb_detalhes_pagamento` VALUES (569, 755, 1, 1000.00, 132, '2025-01-31 08:53:50');
INSERT INTO `tb_detalhes_pagamento` VALUES (570, 756, 1, 1000.00, 132, '2025-01-31 08:53:50');
INSERT INTO `tb_detalhes_pagamento` VALUES (571, 757, 1, 900.00, 132, '2025-01-31 09:28:36');
INSERT INTO `tb_detalhes_pagamento` VALUES (572, 758, 1, 900.00, 132, '2025-01-31 09:28:36');
INSERT INTO `tb_detalhes_pagamento` VALUES (573, 759, 1, 3000.00, 132, '2025-01-31 09:37:27');
INSERT INTO `tb_detalhes_pagamento` VALUES (574, 760, 1, 3000.00, 132, '2025-01-31 09:37:27');
INSERT INTO `tb_detalhes_pagamento` VALUES (575, 761, 1, 3000.00, 132, '2025-01-31 09:37:27');
INSERT INTO `tb_detalhes_pagamento` VALUES (576, 762, 1, 500.00, 132, '2025-01-31 13:06:23');
INSERT INTO `tb_detalhes_pagamento` VALUES (577, 763, 1, 500.00, 132, '2025-01-31 13:06:23');
INSERT INTO `tb_detalhes_pagamento` VALUES (578, 764, 1, 500.00, 132, '2025-01-31 13:56:58');
INSERT INTO `tb_detalhes_pagamento` VALUES (579, 765, 1, 1700.00, 129, '2025-01-31 14:08:22');
INSERT INTO `tb_detalhes_pagamento` VALUES (580, 766, 1, 1700.00, 129, '2025-01-31 14:08:22');
INSERT INTO `tb_detalhes_pagamento` VALUES (581, 767, 1, 1700.00, 129, '2025-01-31 14:08:22');
INSERT INTO `tb_detalhes_pagamento` VALUES (582, 768, 1, 1700.00, 129, '2025-01-31 14:08:22');
INSERT INTO `tb_detalhes_pagamento` VALUES (583, 769, 1, 5500.00, 132, '2025-01-31 15:04:39');
INSERT INTO `tb_detalhes_pagamento` VALUES (584, 770, 1, 5500.00, 132, '2025-01-31 15:04:39');
INSERT INTO `tb_detalhes_pagamento` VALUES (585, 771, 1, 950.00, 132, '2025-01-31 16:32:56');
INSERT INTO `tb_detalhes_pagamento` VALUES (586, 772, 1, 950.00, 132, '2025-01-31 16:32:56');
INSERT INTO `tb_detalhes_pagamento` VALUES (587, 773, 1, 1000.00, 132, '2025-01-31 16:48:22');
INSERT INTO `tb_detalhes_pagamento` VALUES (588, 774, 3, 2300.00, 132, '2025-01-31 17:24:51');
INSERT INTO `tb_detalhes_pagamento` VALUES (589, 775, 3, 2300.00, 132, '2025-01-31 17:24:51');
INSERT INTO `tb_detalhes_pagamento` VALUES (590, 776, 1, 5000.00, 132, '2025-01-31 17:25:29');
INSERT INTO `tb_detalhes_pagamento` VALUES (591, 777, 1, 1000.00, 132, '2025-01-31 18:37:22');
INSERT INTO `tb_detalhes_pagamento` VALUES (592, 778, 1, 1000.00, 132, '2025-01-31 18:37:22');
INSERT INTO `tb_detalhes_pagamento` VALUES (593, 779, 1, 550.00, 132, '2025-01-31 18:42:54');
INSERT INTO `tb_detalhes_pagamento` VALUES (594, 780, 1, 550.00, 132, '2025-01-31 18:42:54');
INSERT INTO `tb_detalhes_pagamento` VALUES (595, 781, 1, 550.00, 132, '2025-01-31 18:42:54');
INSERT INTO `tb_detalhes_pagamento` VALUES (596, 782, 2, 1650.00, 132, '2025-01-31 18:47:46');
INSERT INTO `tb_detalhes_pagamento` VALUES (597, 783, 2, 1650.00, 132, '2025-01-31 18:47:46');
INSERT INTO `tb_detalhes_pagamento` VALUES (598, 784, 2, 1650.00, 132, '2025-01-31 18:47:46');
INSERT INTO `tb_detalhes_pagamento` VALUES (599, 785, 2, 1650.00, 132, '2025-01-31 18:47:46');
INSERT INTO `tb_detalhes_pagamento` VALUES (600, 786, 1, 500.00, 132, '2025-01-31 18:59:06');
INSERT INTO `tb_detalhes_pagamento` VALUES (601, 787, 1, 2000.00, 132, '2025-01-31 20:44:38');
INSERT INTO `tb_detalhes_pagamento` VALUES (602, 788, 1, 2000.00, 132, '2025-01-31 20:44:38');
INSERT INTO `tb_detalhes_pagamento` VALUES (603, 789, 1, 2000.00, 132, '2025-01-31 20:44:38');
INSERT INTO `tb_detalhes_pagamento` VALUES (604, 790, 1, 2000.00, 130, '2025-02-01 07:17:51');
INSERT INTO `tb_detalhes_pagamento` VALUES (605, 791, 1, 2000.00, 130, '2025-02-01 07:17:51');
INSERT INTO `tb_detalhes_pagamento` VALUES (606, 792, 1, 1000.00, 130, '2025-02-01 08:03:10');
INSERT INTO `tb_detalhes_pagamento` VALUES (607, 793, 1, 1000.00, 130, '2025-02-01 09:46:24');
INSERT INTO `tb_detalhes_pagamento` VALUES (608, 794, 1, 1000.00, 130, '2025-02-01 10:05:54');
INSERT INTO `tb_detalhes_pagamento` VALUES (609, 795, 1, 500.00, 130, '2025-02-01 11:22:49');
INSERT INTO `tb_detalhes_pagamento` VALUES (610, 796, 1, 500.00, 130, '2025-02-01 13:17:07');
INSERT INTO `tb_detalhes_pagamento` VALUES (611, 797, 1, 500.00, 130, '2025-02-01 13:17:07');
INSERT INTO `tb_detalhes_pagamento` VALUES (612, 798, 1, 200.00, 130, '2025-02-01 13:18:33');
INSERT INTO `tb_detalhes_pagamento` VALUES (613, 799, 1, 2650.00, 130, '2025-02-01 13:48:29');
INSERT INTO `tb_detalhes_pagamento` VALUES (614, 800, 1, 2650.00, 130, '2025-02-01 13:48:29');
INSERT INTO `tb_detalhes_pagamento` VALUES (615, 801, 1, 2650.00, 130, '2025-02-01 13:48:29');
INSERT INTO `tb_detalhes_pagamento` VALUES (616, 802, 1, 2000.00, 130, '2025-02-01 14:13:32');
INSERT INTO `tb_detalhes_pagamento` VALUES (617, 803, 1, 350.00, 130, '2025-02-01 15:21:37');
INSERT INTO `tb_detalhes_pagamento` VALUES (618, 804, 2, 1250.00, 130, '2025-02-01 16:58:26');
INSERT INTO `tb_detalhes_pagamento` VALUES (619, 805, 1, 1000.00, 130, '2025-02-01 17:05:20');

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
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

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
  `id` int NOT NULL AUTO_INCREMENT,
  `id_produto` int NOT NULL,
  `id_fornecedor` int NOT NULL,
  `id_fabricante` int NOT NULL,
  `lote` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `quantidade` int NOT NULL,
  `preco_compra` decimal(10, 2) NOT NULL,
  `data_validade` date NOT NULL,
  `data_entrada` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_produto`(`id_produto` ASC) USING BTREE,
  INDEX `id_fornecedor`(`id_fornecedor` ASC) USING BTREE,
  INDEX `id_fabricante`(`id_fabricante` ASC) USING BTREE,
  CONSTRAINT `tb_estoque_ibfk_1` FOREIGN KEY (`id_produto`) REFERENCES `tb_produtos` (`id_produto`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tb_estoque_ibfk_2` FOREIGN KEY (`id_fornecedor`) REFERENCES `tb_fornecedores` (`id_fornecedor`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tb_estoque_ibfk_3` FOREIGN KEY (`id_fabricante`) REFERENCES `tb_fabricante` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_fabricante
-- ----------------------------
INSERT INTO `tb_fabricante` VALUES (1, 'Índia', NULL, 130, '2025-01-10 21:01:57');
INSERT INTO `tb_fabricante` VALUES (2, 'Portugal', NULL, 130, '2025-01-10 21:02:06');
INSERT INTO `tb_fabricante` VALUES (3, 'Angola', NULL, 101, '2025-01-17 12:12:27');
INSERT INTO `tb_fabricante` VALUES (4, 'Dubai', NULL, 129, '2025-01-22 15:35:40');
INSERT INTO `tb_fabricante` VALUES (5, 'China', NULL, 129, '2025-01-22 15:35:49');
INSERT INTO `tb_fabricante` VALUES (6, 'França', NULL, 129, '2025-01-27 20:55:19');
INSERT INTO `tb_fabricante` VALUES (7, 'Suécia', NULL, 129, '2025-01-27 20:59:19');

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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

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
INSERT INTO `tb_fornecedores` VALUES (11, 'PRINCE FARMA', '949632345', 'info@princefarma.com', 'Rua Direita do Zango', '2025-01-21 17:09:01', '2025-01-21 16:09:01', 129, '5417070858');
INSERT INTO `tb_fornecedores` VALUES (12, 'GALF LDA', '929782479', 'palancagalf@gmail.com', 'Palanca', '2025-01-24 17:00:37', '2025-01-24 16:00:37', 129, '5121041276');
INSERT INTO `tb_fornecedores` VALUES (13, 'AFRICHAHEL FARMACIA LDA', '927362564', 'pharma.palamca@gmail.com', 'Palanca', '2025-01-24 17:04:14', '2025-01-24 16:04:14', 129, '5417539660');
INSERT INTO `tb_fornecedores` VALUES (14, 'MEDICURE FARMA LDA', '921757870', 'mULEMBA@MEDICUREFARMA.COM', 'MUlemba', '2025-01-24 17:59:47', '2025-01-24 16:59:47', 129, '5000734268');
INSERT INTO `tb_fornecedores` VALUES (15, 'BALAXI', '935402130', 'pharma.viana@balaxi.com', 'Estrada de Catete', '2025-01-27 20:04:41', '2025-01-27 19:04:41', 129, '5417381225');
INSERT INTO `tb_fornecedores` VALUES (16, 'MIA FARMA', '936187755', 'calemba2@miafarma.net', 'Calemba 2 Madeira', '2025-01-27 20:07:18', '2025-01-27 19:07:18', 129, '5000154962');

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

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
  CONSTRAINT `tb_item_venda_ibfk_1` FOREIGN KEY (`id_venda`) REFERENCES `venda` (`id_venda`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tb_item_venda_ibfk_2` FOREIGN KEY (`id_produto`) REFERENCES `tb_produtos` (`id_produto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 600 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_item_venda
-- ----------------------------
INSERT INTO `tb_item_venda` VALUES (15, 221, 318, 1, 250.00, 250.00, 101, '2025-01-23 20:54:51', NULL);
INSERT INTO `tb_item_venda` VALUES (16, 221, 210, 1, 700.00, 700.00, 101, '2025-01-23 20:54:51', NULL);
INSERT INTO `tb_item_venda` VALUES (17, 222, 137, 1, 300.00, 300.00, 130, '2025-01-23 21:04:54', NULL);
INSERT INTO `tb_item_venda` VALUES (18, 223, 68, 2, 900.00, 1800.00, 131, '2025-01-24 06:47:03', NULL);
INSERT INTO `tb_item_venda` VALUES (19, 223, 137, 2, 300.00, 600.00, 131, '2025-01-24 06:47:03', NULL);
INSERT INTO `tb_item_venda` VALUES (20, 223, 328, 5, 100.00, 500.00, 131, '2025-01-24 06:47:03', NULL);
INSERT INTO `tb_item_venda` VALUES (21, 224, 240, 1, 200.00, 200.00, 131, '2025-01-24 07:07:17', NULL);
INSERT INTO `tb_item_venda` VALUES (22, 225, 331, 1, 700.00, 700.00, 131, '2025-01-24 07:26:51', NULL);
INSERT INTO `tb_item_venda` VALUES (23, 226, 68, 1, 900.00, 900.00, 131, '2025-01-24 09:03:56', NULL);
INSERT INTO `tb_item_venda` VALUES (24, 227, 50, 3, 100.00, 300.00, 131, '2025-01-24 09:08:48', NULL);
INSERT INTO `tb_item_venda` VALUES (25, 228, 192, 1, 4000.00, 4000.00, 131, '2025-01-24 10:04:45', NULL);
INSERT INTO `tb_item_venda` VALUES (26, 229, 178, 1, 450.00, 450.00, 131, '2025-01-24 10:55:16', NULL);
INSERT INTO `tb_item_venda` VALUES (27, 230, 305, 1, 1000.00, 1000.00, 131, '2025-01-24 12:52:53', NULL);
INSERT INTO `tb_item_venda` VALUES (28, 230, 148, 2, 300.00, 600.00, 131, '2025-01-24 12:52:53', NULL);
INSERT INTO `tb_item_venda` VALUES (29, 230, 255, 1, 200.00, 200.00, 131, '2025-01-24 12:52:53', NULL);
INSERT INTO `tb_item_venda` VALUES (30, 230, 92, 1, 200.00, 200.00, 131, '2025-01-24 12:52:53', NULL);
INSERT INTO `tb_item_venda` VALUES (31, 231, 178, 2, 450.00, 900.00, 131, '2025-01-24 15:53:59', NULL);
INSERT INTO `tb_item_venda` VALUES (32, 232, 22, 1, 1300.00, 1300.00, 131, '2025-01-24 16:37:25', NULL);
INSERT INTO `tb_item_venda` VALUES (33, 232, 140, 1, 500.00, 500.00, 131, '2025-01-24 16:37:25', NULL);
INSERT INTO `tb_item_venda` VALUES (34, 233, 342, 3, 500.00, 1500.00, 131, '2025-01-24 17:11:06', NULL);
INSERT INTO `tb_item_venda` VALUES (35, 234, 223, 1, 6500.00, 6500.00, 129, '2025-01-24 18:22:43', NULL);
INSERT INTO `tb_item_venda` VALUES (36, 234, 323, 1, 1000.00, 1000.00, 129, '2025-01-24 18:22:43', NULL);
INSERT INTO `tb_item_venda` VALUES (37, 235, 117, 1, 700.00, 700.00, 129, '2025-01-24 18:25:03', NULL);
INSERT INTO `tb_item_venda` VALUES (38, 236, 302, 1, 900.00, 900.00, 129, '2025-01-24 18:26:56', NULL);
INSERT INTO `tb_item_venda` VALUES (39, 237, 86, 14, 350.00, 4900.00, 129, '2025-01-24 18:30:13', NULL);
INSERT INTO `tb_item_venda` VALUES (40, 238, 321, 1, 200.00, 200.00, 129, '2025-01-24 18:34:33', NULL);
INSERT INTO `tb_item_venda` VALUES (41, 239, 270, 1, 150.00, 150.00, 129, '2025-01-24 18:35:46', NULL);
INSERT INTO `tb_item_venda` VALUES (42, 240, 249, 4, 50.00, 200.00, 129, '2025-01-24 18:52:29', NULL);
INSERT INTO `tb_item_venda` VALUES (43, 241, 255, 3, 200.00, 600.00, 131, '2025-01-24 19:04:22', NULL);
INSERT INTO `tb_item_venda` VALUES (44, 241, 159, 1, 500.00, 500.00, 131, '2025-01-24 19:04:22', NULL);
INSERT INTO `tb_item_venda` VALUES (45, 241, 308, 2, 200.00, 400.00, 131, '2025-01-24 19:04:22', NULL);
INSERT INTO `tb_item_venda` VALUES (46, 242, 305, 1, 1000.00, 1000.00, 129, '2025-01-24 19:11:50', NULL);
INSERT INTO `tb_item_venda` VALUES (47, 242, 56, 1, 900.00, 900.00, 129, '2025-01-24 19:11:50', NULL);
INSERT INTO `tb_item_venda` VALUES (48, 242, 278, 1, 200.00, 200.00, 129, '2025-01-24 19:11:50', NULL);
INSERT INTO `tb_item_venda` VALUES (49, 242, 22, 1, 1300.00, 1300.00, 129, '2025-01-24 19:11:50', NULL);
INSERT INTO `tb_item_venda` VALUES (50, 243, 120, 1, 250.00, 250.00, 131, '2025-01-24 19:20:34', NULL);
INSERT INTO `tb_item_venda` VALUES (51, 243, 278, 1, 200.00, 200.00, 131, '2025-01-24 19:20:34', NULL);
INSERT INTO `tb_item_venda` VALUES (52, 244, 155, 10, 150.00, 1500.00, 131, '2025-01-24 19:25:21', NULL);
INSERT INTO `tb_item_venda` VALUES (53, 244, 268, 2, 600.00, 1200.00, 131, '2025-01-24 19:25:21', NULL);
INSERT INTO `tb_item_venda` VALUES (54, 245, 116, 1, 1600.00, 1600.00, 131, '2025-01-24 19:28:35', NULL);
INSERT INTO `tb_item_venda` VALUES (55, 245, 249, 6, 50.00, 300.00, 131, '2025-01-24 19:28:35', NULL);
INSERT INTO `tb_item_venda` VALUES (57, 246, 102, 1, 850.00, 850.00, 131, '2025-01-24 20:10:46', NULL);
INSERT INTO `tb_item_venda` VALUES (58, 247, 283, 1, 3200.00, 3200.00, 131, '2025-01-24 20:21:34', NULL);
INSERT INTO `tb_item_venda` VALUES (59, 248, 270, 1, 150.00, 150.00, 131, '2025-01-24 21:20:32', NULL);
INSERT INTO `tb_item_venda` VALUES (60, 249, 249, 1, 50.00, 50.00, 131, '2025-01-24 21:23:26', NULL);
INSERT INTO `tb_item_venda` VALUES (61, 250, 160, 1, 400.00, 400.00, 131, '2025-01-25 06:27:48', NULL);
INSERT INTO `tb_item_venda` VALUES (62, 250, 305, 1, 1000.00, 1000.00, 131, '2025-01-25 06:27:48', NULL);
INSERT INTO `tb_item_venda` VALUES (63, 250, 50, 1, 100.00, 100.00, 131, '2025-01-25 06:27:48', NULL);
INSERT INTO `tb_item_venda` VALUES (64, 251, 159, 1, 500.00, 500.00, 132, '2025-01-25 07:11:45', NULL);
INSERT INTO `tb_item_venda` VALUES (65, 252, 305, 1, 1000.00, 1000.00, 132, '2025-01-25 07:23:26', NULL);
INSERT INTO `tb_item_venda` VALUES (66, 252, 342, 1, 500.00, 500.00, 132, '2025-01-25 07:23:26', NULL);
INSERT INTO `tb_item_venda` VALUES (67, 253, 12, 1, 200.00, 200.00, 132, '2025-01-25 07:30:08', NULL);
INSERT INTO `tb_item_venda` VALUES (68, 253, 300, 1, 500.00, 500.00, 132, '2025-01-25 07:30:08', NULL);
INSERT INTO `tb_item_venda` VALUES (69, 254, 342, 1, 500.00, 500.00, 132, '2025-01-25 07:32:25', NULL);
INSERT INTO `tb_item_venda` VALUES (70, 255, 332, 2, 500.00, 1000.00, 132, '2025-01-25 08:41:29', NULL);
INSERT INTO `tb_item_venda` VALUES (71, 255, 243, 2, 200.00, 400.00, 132, '2025-01-25 08:41:29', NULL);
INSERT INTO `tb_item_venda` VALUES (72, 255, 256, 1, 350.00, 350.00, 132, '2025-01-25 08:41:29', NULL);
INSERT INTO `tb_item_venda` VALUES (73, 255, 278, 1, 200.00, 200.00, 132, '2025-01-25 08:41:29', NULL);
INSERT INTO `tb_item_venda` VALUES (74, 256, 17, 1, 550.00, 550.00, 132, '2025-01-25 09:06:57', NULL);
INSERT INTO `tb_item_venda` VALUES (75, 257, 17, 1, 550.00, 550.00, 132, '2025-01-25 09:14:11', NULL);
INSERT INTO `tb_item_venda` VALUES (76, 258, 215, 1, 1000.00, 1000.00, 132, '2025-01-25 09:26:49', NULL);
INSERT INTO `tb_item_venda` VALUES (77, 259, 159, 1, 500.00, 500.00, 132, '2025-01-25 10:05:00', NULL);
INSERT INTO `tb_item_venda` VALUES (78, 260, 159, 1, 500.00, 500.00, 132, '2025-01-25 10:07:21', NULL);
INSERT INTO `tb_item_venda` VALUES (79, 261, 177, 1, 300.00, 300.00, 132, '2025-01-25 10:32:45', NULL);
INSERT INTO `tb_item_venda` VALUES (80, 262, 338, 1, 400.00, 400.00, 132, '2025-01-25 11:29:08', NULL);
INSERT INTO `tb_item_venda` VALUES (81, 263, 338, 1, 400.00, 400.00, 132, '2025-01-25 11:29:36', NULL);
INSERT INTO `tb_item_venda` VALUES (82, 264, 222, 4, 1500.00, 6000.00, 132, '2025-01-25 12:13:04', NULL);
INSERT INTO `tb_item_venda` VALUES (83, 264, 105, 2, 450.00, 900.00, 132, '2025-01-25 12:13:04', NULL);
INSERT INTO `tb_item_venda` VALUES (84, 264, 291, 1, 850.00, 850.00, 132, '2025-01-25 12:13:04', NULL);
INSERT INTO `tb_item_venda` VALUES (85, 265, 272, 1, 4000.00, 4000.00, 132, '2025-01-25 12:21:02', NULL);
INSERT INTO `tb_item_venda` VALUES (86, 266, 310, 2, 250.00, 500.00, 132, '2025-01-25 14:01:04', NULL);
INSERT INTO `tb_item_venda` VALUES (87, 266, 329, 2, 100.00, 200.00, 132, '2025-01-25 14:01:04', NULL);
INSERT INTO `tb_item_venda` VALUES (88, 266, 51, 1, 300.00, 300.00, 132, '2025-01-25 14:01:04', NULL);
INSERT INTO `tb_item_venda` VALUES (89, 267, 300, 1, 500.00, 500.00, 132, '2025-01-25 14:55:51', NULL);
INSERT INTO `tb_item_venda` VALUES (90, 267, 255, 1, 200.00, 200.00, 132, '2025-01-25 14:55:51', NULL);
INSERT INTO `tb_item_venda` VALUES (91, 268, 105, 1, 450.00, 450.00, 132, '2025-01-25 15:26:24', NULL);
INSERT INTO `tb_item_venda` VALUES (92, 269, 105, 1, 450.00, 450.00, 132, '2025-01-25 15:48:50', NULL);
INSERT INTO `tb_item_venda` VALUES (93, 270, 278, 1, 200.00, 200.00, 132, '2025-01-25 15:49:47', NULL);
INSERT INTO `tb_item_venda` VALUES (94, 271, 76, 1, 450.00, 450.00, 132, '2025-01-25 17:12:05', NULL);
INSERT INTO `tb_item_venda` VALUES (95, 271, 94, 1, 350.00, 350.00, 132, '2025-01-25 17:12:05', NULL);
INSERT INTO `tb_item_venda` VALUES (96, 271, 49, 1, 200.00, 200.00, 132, '2025-01-25 17:12:05', NULL);
INSERT INTO `tb_item_venda` VALUES (97, 271, 45, 1, 1000.00, 1000.00, 132, '2025-01-25 17:12:05', NULL);
INSERT INTO `tb_item_venda` VALUES (98, 272, 117, 1, 700.00, 700.00, 132, '2025-01-25 17:12:42', NULL);
INSERT INTO `tb_item_venda` VALUES (100, 274, 190, 1, 350.00, 350.00, 132, '2025-01-25 17:36:31', NULL);
INSERT INTO `tb_item_venda` VALUES (101, 274, 178, 1, 450.00, 450.00, 132, '2025-01-25 17:36:31', NULL);
INSERT INTO `tb_item_venda` VALUES (102, 274, 82, 2, 150.00, 300.00, 132, '2025-01-25 17:36:32', NULL);
INSERT INTO `tb_item_venda` VALUES (103, 274, 159, 1, 500.00, 500.00, 132, '2025-01-25 17:36:32', NULL);
INSERT INTO `tb_item_venda` VALUES (104, 275, 96, 1, 1350.00, 1350.00, 132, '2025-01-25 17:47:07', NULL);
INSERT INTO `tb_item_venda` VALUES (105, 275, 46, 1, 1000.00, 1000.00, 132, '2025-01-25 17:47:07', NULL);
INSERT INTO `tb_item_venda` VALUES (106, 275, 329, 2, 100.00, 200.00, 132, '2025-01-25 17:47:07', NULL);
INSERT INTO `tb_item_venda` VALUES (107, 276, 97, 1, 200.00, 200.00, 101, '2025-01-25 18:04:23', NULL);
INSERT INTO `tb_item_venda` VALUES (108, 277, 97, 1, 200.00, 200.00, 101, '2025-01-25 18:06:26', NULL);
INSERT INTO `tb_item_venda` VALUES (109, 278, 221, 1, 500.00, 500.00, 101, '2025-01-25 18:22:33', NULL);
INSERT INTO `tb_item_venda` VALUES (110, 279, 114, 1, 450.00, 450.00, 101, '2025-01-25 19:05:44', NULL);
INSERT INTO `tb_item_venda` VALUES (111, 279, 119, 1, 100.00, 100.00, 101, '2025-01-25 19:05:44', NULL);
INSERT INTO `tb_item_venda` VALUES (112, 279, 51, 1, 300.00, 300.00, 101, '2025-01-25 19:05:44', NULL);
INSERT INTO `tb_item_venda` VALUES (113, 279, 329, 1, 100.00, 100.00, 101, '2025-01-25 19:05:45', NULL);
INSERT INTO `tb_item_venda` VALUES (114, 280, 278, 1, 200.00, 200.00, 101, '2025-01-25 19:22:04', NULL);
INSERT INTO `tb_item_venda` VALUES (115, 280, 23, 1, 550.00, 550.00, 101, '2025-01-25 19:22:04', NULL);
INSERT INTO `tb_item_venda` VALUES (116, 280, 176, 4, 1300.00, 5200.00, 101, '2025-01-25 19:22:04', NULL);
INSERT INTO `tb_item_venda` VALUES (117, 281, 255, 1, 200.00, 200.00, 132, '2025-01-25 19:48:38', NULL);
INSERT INTO `tb_item_venda` VALUES (118, 281, 22, 1, 1300.00, 1300.00, 132, '2025-01-25 19:48:38', NULL);
INSERT INTO `tb_item_venda` VALUES (119, 282, 99, 1, 900.00, 900.00, 132, '2025-01-25 20:08:41', NULL);
INSERT INTO `tb_item_venda` VALUES (120, 282, 205, 1, 300.00, 300.00, 132, '2025-01-25 20:08:41', NULL);
INSERT INTO `tb_item_venda` VALUES (121, 283, 205, 1, 300.00, 300.00, 132, '2025-01-25 20:10:34', NULL);
INSERT INTO `tb_item_venda` VALUES (122, 284, 343, 2, 300.00, 600.00, 132, '2025-01-25 20:49:52', NULL);
INSERT INTO `tb_item_venda` VALUES (123, 285, 338, 1, 400.00, 400.00, 132, '2025-01-25 20:58:18', NULL);
INSERT INTO `tb_item_venda` VALUES (124, 286, 344, 5, 850.00, 4250.00, 132, '2025-01-25 21:02:06', NULL);
INSERT INTO `tb_item_venda` VALUES (125, 287, 92, 1, 200.00, 200.00, 0, '2025-01-26 06:48:34', NULL);
INSERT INTO `tb_item_venda` VALUES (126, 288, 18, 1, 400.00, 400.00, 0, '2025-01-26 07:17:38', NULL);
INSERT INTO `tb_item_venda` VALUES (127, 289, 332, 1, 500.00, 500.00, 0, '2025-01-26 08:28:20', NULL);
INSERT INTO `tb_item_venda` VALUES (128, 290, 293, 1, 750.00, 750.00, 0, '2025-01-26 08:53:15', NULL);
INSERT INTO `tb_item_venda` VALUES (129, 291, 190, 1, 350.00, 350.00, 0, '2025-01-26 09:02:26', NULL);
INSERT INTO `tb_item_venda` VALUES (130, 292, 249, 3, 50.00, 150.00, 0, '2025-01-26 09:06:41', NULL);
INSERT INTO `tb_item_venda` VALUES (131, 293, 48, 2, 150.00, 300.00, 0, '2025-01-26 09:44:43', NULL);
INSERT INTO `tb_item_venda` VALUES (132, 293, 49, 2, 200.00, 400.00, 0, '2025-01-26 09:44:43', NULL);
INSERT INTO `tb_item_venda` VALUES (133, 294, 278, 1, 200.00, 200.00, 130, '2025-01-26 14:30:47', NULL);
INSERT INTO `tb_item_venda` VALUES (134, 294, 94, 1, 350.00, 350.00, 130, '2025-01-26 14:30:47', NULL);
INSERT INTO `tb_item_venda` VALUES (135, 295, 302, 3, 900.00, 2700.00, 129, '2025-01-26 16:20:04', NULL);
INSERT INTO `tb_item_venda` VALUES (136, 295, 255, 2, 200.00, 400.00, 129, '2025-01-26 16:20:04', NULL);
INSERT INTO `tb_item_venda` VALUES (137, 295, 94, 2, 350.00, 700.00, 129, '2025-01-26 16:20:04', NULL);
INSERT INTO `tb_item_venda` VALUES (138, 295, 190, 1, 350.00, 350.00, 129, '2025-01-26 16:20:04', NULL);
INSERT INTO `tb_item_venda` VALUES (139, 295, 120, 1, 250.00, 250.00, 129, '2025-01-26 16:20:04', NULL);
INSERT INTO `tb_item_venda` VALUES (140, 295, 160, 1, 400.00, 400.00, 129, '2025-01-26 16:20:04', NULL);
INSERT INTO `tb_item_venda` VALUES (141, 295, 159, 5, 500.00, 2500.00, 129, '2025-01-26 16:20:04', NULL);
INSERT INTO `tb_item_venda` VALUES (142, 295, 308, 3, 200.00, 600.00, 129, '2025-01-26 16:20:04', NULL);
INSERT INTO `tb_item_venda` VALUES (143, 295, 270, 1, 150.00, 150.00, 129, '2025-01-26 16:20:04', NULL);
INSERT INTO `tb_item_venda` VALUES (144, 295, 329, 13, 100.00, 1300.00, 129, '2025-01-26 16:20:04', NULL);
INSERT INTO `tb_item_venda` VALUES (145, 295, 332, 1, 500.00, 500.00, 129, '2025-01-26 16:20:04', NULL);
INSERT INTO `tb_item_venda` VALUES (146, 295, 189, 1, 850.00, 850.00, 129, '2025-01-26 16:20:04', NULL);
INSERT INTO `tb_item_venda` VALUES (147, 295, 237, 2, 1500.00, 3000.00, 129, '2025-01-26 16:20:04', NULL);
INSERT INTO `tb_item_venda` VALUES (148, 295, 18, 3, 400.00, 1200.00, 129, '2025-01-26 16:20:04', NULL);
INSERT INTO `tb_item_venda` VALUES (149, 295, 92, 1, 200.00, 200.00, 129, '2025-01-26 16:20:04', NULL);
INSERT INTO `tb_item_venda` VALUES (150, 295, 114, 2, 450.00, 900.00, 129, '2025-01-26 16:20:04', NULL);
INSERT INTO `tb_item_venda` VALUES (151, 295, 249, 8, 50.00, 400.00, 129, '2025-01-26 16:20:04', NULL);
INSERT INTO `tb_item_venda` VALUES (152, 295, 250, 7, 50.00, 350.00, 129, '2025-01-26 16:20:04', NULL);
INSERT INTO `tb_item_venda` VALUES (153, 295, 305, 1, 1000.00, 1000.00, 129, '2025-01-26 16:20:04', NULL);
INSERT INTO `tb_item_venda` VALUES (154, 295, 148, 2, 300.00, 600.00, 129, '2025-01-26 16:20:04', NULL);
INSERT INTO `tb_item_venda` VALUES (155, 295, 142, 3, 300.00, 900.00, 129, '2025-01-26 16:20:04', NULL);
INSERT INTO `tb_item_venda` VALUES (156, 295, 97, 4, 200.00, 800.00, 129, '2025-01-26 16:20:04', NULL);
INSERT INTO `tb_item_venda` VALUES (157, 295, 242, 1, 500.00, 500.00, 129, '2025-01-26 16:20:04', NULL);
INSERT INTO `tb_item_venda` VALUES (158, 295, 95, 1, 300.00, 300.00, 129, '2025-01-26 16:20:04', NULL);
INSERT INTO `tb_item_venda` VALUES (159, 295, 300, 1, 500.00, 500.00, 129, '2025-01-26 16:20:04', NULL);
INSERT INTO `tb_item_venda` VALUES (160, 295, 49, 1, 200.00, 200.00, 129, '2025-01-26 16:20:04', NULL);
INSERT INTO `tb_item_venda` VALUES (161, 295, 243, 2, 200.00, 400.00, 129, '2025-01-26 16:20:04', NULL);
INSERT INTO `tb_item_venda` VALUES (162, 295, 240, 1, 200.00, 200.00, 129, '2025-01-26 16:20:04', NULL);
INSERT INTO `tb_item_venda` VALUES (163, 295, 113, 12, 450.00, 5400.00, 129, '2025-01-26 16:20:04', NULL);
INSERT INTO `tb_item_venda` VALUES (164, 295, 79, 1, 950.00, 950.00, 129, '2025-01-26 16:20:04', NULL);
INSERT INTO `tb_item_venda` VALUES (165, 295, 278, 1, 200.00, 200.00, 129, '2025-01-26 16:20:04', NULL);
INSERT INTO `tb_item_venda` VALUES (166, 295, 123, 1, 400.00, 400.00, 129, '2025-01-26 16:20:04', NULL);
INSERT INTO `tb_item_venda` VALUES (167, 295, 106, 1, 1950.00, 1950.00, 129, '2025-01-26 16:20:04', NULL);
INSERT INTO `tb_item_venda` VALUES (168, 295, 42, 1, 350.00, 350.00, 129, '2025-01-26 16:20:04', NULL);
INSERT INTO `tb_item_venda` VALUES (169, 295, 185, 1, 500.00, 500.00, 129, '2025-01-26 16:20:04', NULL);
INSERT INTO `tb_item_venda` VALUES (170, 295, 119, 6, 100.00, 600.00, 129, '2025-01-26 16:20:04', NULL);
INSERT INTO `tb_item_venda` VALUES (171, 295, 328, 6, 100.00, 600.00, 129, '2025-01-26 16:20:04', NULL);
INSERT INTO `tb_item_venda` VALUES (172, 295, 202, 2, 1100.00, 2200.00, 129, '2025-01-26 16:20:04', NULL);
INSERT INTO `tb_item_venda` VALUES (173, 295, 28, 1, 2800.00, 2800.00, 129, '2025-01-26 16:20:04', NULL);
INSERT INTO `tb_item_venda` VALUES (174, 295, 223, 1, 6500.00, 6500.00, 129, '2025-01-26 16:20:04', NULL);
INSERT INTO `tb_item_venda` VALUES (175, 295, 13, 1, 2000.00, 2000.00, 129, '2025-01-26 16:20:04', NULL);
INSERT INTO `tb_item_venda` VALUES (176, 295, 14, 1, 2000.00, 2000.00, 129, '2025-01-26 16:20:04', NULL);
INSERT INTO `tb_item_venda` VALUES (177, 295, 280, 2, 100.00, 200.00, 129, '2025-01-26 16:20:04', NULL);
INSERT INTO `tb_item_venda` VALUES (178, 295, 205, 1, 300.00, 300.00, 129, '2025-01-26 16:20:04', NULL);
INSERT INTO `tb_item_venda` VALUES (179, 296, 347, 1, 1000.00, 1000.00, 129, '2025-01-26 17:36:31', NULL);
INSERT INTO `tb_item_venda` VALUES (180, 296, 105, 3, 450.00, 1350.00, 129, '2025-01-26 17:36:31', NULL);
INSERT INTO `tb_item_venda` VALUES (181, 296, 142, 1, 300.00, 300.00, 129, '2025-01-26 17:36:31', NULL);
INSERT INTO `tb_item_venda` VALUES (182, 296, 255, 4, 200.00, 800.00, 129, '2025-01-26 17:36:31', NULL);
INSERT INTO `tb_item_venda` VALUES (183, 296, 98, 2, 700.00, 1400.00, 129, '2025-01-26 17:36:31', NULL);
INSERT INTO `tb_item_venda` VALUES (184, 296, 250, 9, 50.00, 450.00, 129, '2025-01-26 17:36:31', NULL);
INSERT INTO `tb_item_venda` VALUES (185, 296, 249, 5, 50.00, 250.00, 129, '2025-01-26 17:36:31', NULL);
INSERT INTO `tb_item_venda` VALUES (186, 296, 328, 17, 100.00, 1700.00, 129, '2025-01-26 17:36:31', NULL);
INSERT INTO `tb_item_venda` VALUES (187, 296, 18, 1, 400.00, 400.00, 129, '2025-01-26 17:36:31', NULL);
INSERT INTO `tb_item_venda` VALUES (188, 296, 94, 7, 350.00, 2450.00, 129, '2025-01-26 17:36:31', NULL);
INSERT INTO `tb_item_venda` VALUES (189, 296, 308, 5, 200.00, 1000.00, 129, '2025-01-26 17:36:31', NULL);
INSERT INTO `tb_item_venda` VALUES (190, 296, 154, 2, 700.00, 1400.00, 129, '2025-01-26 17:36:31', NULL);
INSERT INTO `tb_item_venda` VALUES (191, 296, 22, 1, 1300.00, 1300.00, 129, '2025-01-26 17:36:31', NULL);
INSERT INTO `tb_item_venda` VALUES (192, 296, 159, 4, 500.00, 2000.00, 129, '2025-01-26 17:36:31', NULL);
INSERT INTO `tb_item_venda` VALUES (193, 296, 47, 1, 300.00, 300.00, 129, '2025-01-26 17:36:31', NULL);
INSERT INTO `tb_item_venda` VALUES (194, 296, 102, 1, 850.00, 850.00, 129, '2025-01-26 17:36:31', NULL);
INSERT INTO `tb_item_venda` VALUES (195, 296, 15, 1, 850.00, 850.00, 129, '2025-01-26 17:36:31', NULL);
INSERT INTO `tb_item_venda` VALUES (196, 296, 232, 1, 1500.00, 1500.00, 129, '2025-01-26 17:36:31', NULL);
INSERT INTO `tb_item_venda` VALUES (197, 296, 44, 2, 850.00, 1700.00, 129, '2025-01-26 17:36:31', NULL);
INSERT INTO `tb_item_venda` VALUES (198, 296, 251, 1, 850.00, 850.00, 129, '2025-01-26 17:36:31', NULL);
INSERT INTO `tb_item_venda` VALUES (199, 296, 318, 6, 250.00, 1500.00, 129, '2025-01-26 17:36:31', NULL);
INSERT INTO `tb_item_venda` VALUES (200, 296, 280, 5, 100.00, 500.00, 129, '2025-01-26 17:36:32', NULL);
INSERT INTO `tb_item_venda` VALUES (201, 296, 252, 1, 500.00, 500.00, 129, '2025-01-26 17:36:32', NULL);
INSERT INTO `tb_item_venda` VALUES (202, 296, 302, 2, 900.00, 1800.00, 129, '2025-01-26 17:36:32', NULL);
INSERT INTO `tb_item_venda` VALUES (203, 296, 268, 1, 600.00, 600.00, 129, '2025-01-26 17:36:32', NULL);
INSERT INTO `tb_item_venda` VALUES (204, 296, 30, 1, 250.00, 250.00, 129, '2025-01-26 17:36:32', NULL);
INSERT INTO `tb_item_venda` VALUES (205, 296, 29, 1, 1200.00, 1200.00, 129, '2025-01-26 17:36:32', NULL);
INSERT INTO `tb_item_venda` VALUES (206, 296, 246, 1, 850.00, 850.00, 129, '2025-01-26 17:36:32', NULL);
INSERT INTO `tb_item_venda` VALUES (207, 296, 330, 3, 350.00, 1050.00, 129, '2025-01-26 17:36:32', NULL);
INSERT INTO `tb_item_venda` VALUES (208, 296, 190, 1, 350.00, 350.00, 129, '2025-01-26 17:36:32', NULL);
INSERT INTO `tb_item_venda` VALUES (209, 296, 129, 1, 700.00, 700.00, 129, '2025-01-26 17:36:32', NULL);
INSERT INTO `tb_item_venda` VALUES (210, 296, 310, 9, 250.00, 2250.00, 129, '2025-01-26 17:36:32', NULL);
INSERT INTO `tb_item_venda` VALUES (211, 296, 322, 2, 200.00, 400.00, 129, '2025-01-26 17:36:32', NULL);
INSERT INTO `tb_item_venda` VALUES (212, 296, 343, 1, 300.00, 300.00, 129, '2025-01-26 17:36:32', NULL);
INSERT INTO `tb_item_venda` VALUES (213, 296, 258, 4, 100.00, 400.00, 129, '2025-01-26 17:36:32', NULL);
INSERT INTO `tb_item_venda` VALUES (214, 296, 320, 1, 700.00, 700.00, 129, '2025-01-26 17:36:32', NULL);
INSERT INTO `tb_item_venda` VALUES (215, 296, 317, 1, 750.00, 750.00, 129, '2025-01-26 17:36:32', NULL);
INSERT INTO `tb_item_venda` VALUES (216, 296, 288, 1, 1600.00, 1600.00, 129, '2025-01-26 17:36:32', NULL);
INSERT INTO `tb_item_venda` VALUES (217, 296, 144, 1, 200.00, 200.00, 129, '2025-01-26 17:36:32', NULL);
INSERT INTO `tb_item_venda` VALUES (218, 296, 182, 2, 2300.00, 4600.00, 129, '2025-01-26 17:36:32', NULL);
INSERT INTO `tb_item_venda` VALUES (219, 296, 79, 1, 950.00, 950.00, 129, '2025-01-26 17:36:32', NULL);
INSERT INTO `tb_item_venda` VALUES (220, 296, 262, 1, 250.00, 250.00, 129, '2025-01-26 17:36:32', NULL);
INSERT INTO `tb_item_venda` VALUES (221, 296, 239, 1, 700.00, 700.00, 129, '2025-01-26 17:36:32', NULL);
INSERT INTO `tb_item_venda` VALUES (222, 296, 197, 2, 750.00, 1500.00, 129, '2025-01-26 17:36:32', NULL);
INSERT INTO `tb_item_venda` VALUES (223, 296, 300, 3, 500.00, 1500.00, 129, '2025-01-26 17:36:32', NULL);
INSERT INTO `tb_item_venda` VALUES (224, 296, 117, 1, 700.00, 700.00, 129, '2025-01-26 17:36:32', NULL);
INSERT INTO `tb_item_venda` VALUES (225, 296, 166, 1, 150.00, 150.00, 129, '2025-01-26 17:36:32', NULL);
INSERT INTO `tb_item_venda` VALUES (226, 296, 107, 1, 300.00, 300.00, 129, '2025-01-26 17:36:32', NULL);
INSERT INTO `tb_item_venda` VALUES (227, 296, 332, 1, 500.00, 500.00, 129, '2025-01-26 17:36:32', NULL);
INSERT INTO `tb_item_venda` VALUES (228, 296, 278, 2, 200.00, 400.00, 129, '2025-01-26 17:36:32', NULL);
INSERT INTO `tb_item_venda` VALUES (229, 296, 240, 1, 200.00, 200.00, 129, '2025-01-26 17:36:32', NULL);
INSERT INTO `tb_item_venda` VALUES (230, 296, 235, 1, 500.00, 500.00, 129, '2025-01-26 17:36:32', NULL);
INSERT INTO `tb_item_venda` VALUES (231, 296, 27, 1, 200.00, 200.00, 129, '2025-01-26 17:36:32', NULL);
INSERT INTO `tb_item_venda` VALUES (232, 296, 114, 2, 450.00, 900.00, 129, '2025-01-26 17:36:32', NULL);
INSERT INTO `tb_item_venda` VALUES (233, 296, 168, 3, 1500.00, 4500.00, 129, '2025-01-26 17:36:32', NULL);
INSERT INTO `tb_item_venda` VALUES (234, 296, 202, 1, 1100.00, 1100.00, 129, '2025-01-26 17:36:32', NULL);
INSERT INTO `tb_item_venda` VALUES (235, 296, 263, 1, 1000.00, 1000.00, 129, '2025-01-26 17:36:32', NULL);
INSERT INTO `tb_item_venda` VALUES (236, 296, 19, 1, 1700.00, 1700.00, 129, '2025-01-26 17:36:32', NULL);
INSERT INTO `tb_item_venda` VALUES (237, 296, 39, 1, 1100.00, 1100.00, 129, '2025-01-26 17:36:32', NULL);
INSERT INTO `tb_item_venda` VALUES (238, 296, 205, 1, 300.00, 300.00, 129, '2025-01-26 17:36:32', NULL);
INSERT INTO `tb_item_venda` VALUES (239, 296, 95, 1, 300.00, 300.00, 129, '2025-01-26 17:36:32', NULL);
INSERT INTO `tb_item_venda` VALUES (240, 296, 178, 1, 450.00, 450.00, 129, '2025-01-26 17:36:32', NULL);
INSERT INTO `tb_item_venda` VALUES (241, 297, 250, 6, 50.00, 300.00, 130, '2025-01-26 17:38:03', NULL);
INSERT INTO `tb_item_venda` VALUES (242, 298, 338, 1, 400.00, 400.00, 130, '2025-01-26 17:56:02', NULL);
INSERT INTO `tb_item_venda` VALUES (243, 299, 95, 1, 300.00, 300.00, 130, '2025-01-26 18:00:22', NULL);
INSERT INTO `tb_item_venda` VALUES (244, 300, 67, 1, 700.00, 700.00, 130, '2025-01-26 18:04:48', NULL);
INSERT INTO `tb_item_venda` VALUES (245, 300, 105, 1, 450.00, 450.00, 130, '2025-01-26 18:04:48', NULL);
INSERT INTO `tb_item_venda` VALUES (249, 302, 159, 1, 500.00, 500.00, 130, '2025-01-26 18:29:47', NULL);
INSERT INTO `tb_item_venda` VALUES (250, 303, 129, 1, 700.00, 700.00, 130, '2025-01-26 18:37:50', NULL);
INSERT INTO `tb_item_venda` VALUES (256, 308, 148, 1, 300.00, 300.00, 131, '2025-01-27 16:46:31', NULL);
INSERT INTO `tb_item_venda` VALUES (257, 309, 68, 2, 900.00, 1800.00, 131, '2025-01-27 17:02:20', NULL);
INSERT INTO `tb_item_venda` VALUES (258, 309, 148, 2, 300.00, 600.00, 131, '2025-01-27 17:02:20', NULL);
INSERT INTO `tb_item_venda` VALUES (259, 309, 137, 1, 300.00, 300.00, 131, '2025-01-27 17:02:20', NULL);
INSERT INTO `tb_item_venda` VALUES (260, 309, 94, 1, 350.00, 350.00, 131, '2025-01-27 17:02:20', NULL);
INSERT INTO `tb_item_venda` VALUES (261, 310, 190, 1, 350.00, 350.00, 131, '2025-01-27 17:10:25', NULL);
INSERT INTO `tb_item_venda` VALUES (262, 311, 39, 1, 1100.00, 1100.00, 131, '2025-01-27 17:13:49', NULL);
INSERT INTO `tb_item_venda` VALUES (263, 312, 300, 1, 500.00, 500.00, 131, '2025-01-27 17:20:26', NULL);
INSERT INTO `tb_item_venda` VALUES (264, 313, 97, 1, 200.00, 200.00, 131, '2025-01-27 17:22:20', NULL);
INSERT INTO `tb_item_venda` VALUES (265, 314, 332, 1, 500.00, 500.00, 131, '2025-01-27 17:29:25', NULL);
INSERT INTO `tb_item_venda` VALUES (266, 314, 278, 1, 200.00, 200.00, 131, '2025-01-27 17:29:25', NULL);
INSERT INTO `tb_item_venda` VALUES (267, 315, 99, 1, 900.00, 900.00, 131, '2025-01-27 17:40:30', NULL);
INSERT INTO `tb_item_venda` VALUES (268, 316, 172, 1, 1550.00, 1550.00, 131, '2025-01-27 17:46:08', NULL);
INSERT INTO `tb_item_venda` VALUES (269, 317, 95, 1, 300.00, 300.00, 131, '2025-01-27 17:51:58', NULL);
INSERT INTO `tb_item_venda` VALUES (270, 318, 235, 1, 500.00, 500.00, 131, '2025-01-27 18:02:56', NULL);
INSERT INTO `tb_item_venda` VALUES (271, 319, 281, 2, 100.00, 200.00, 131, '2025-01-27 18:25:37', NULL);
INSERT INTO `tb_item_venda` VALUES (272, 320, 318, 1, 250.00, 250.00, 131, '2025-01-27 19:02:51', NULL);
INSERT INTO `tb_item_venda` VALUES (273, 321, 339, 1, 750.00, 750.00, 131, '2025-01-27 19:05:59', NULL);
INSERT INTO `tb_item_venda` VALUES (274, 322, 159, 1, 500.00, 500.00, 131, '2025-01-27 19:11:39', NULL);
INSERT INTO `tb_item_venda` VALUES (275, 323, 305, 1, 1000.00, 1000.00, 131, '2025-01-27 19:49:28', NULL);
INSERT INTO `tb_item_venda` VALUES (276, 323, 309, 1, 450.00, 450.00, 131, '2025-01-27 19:49:28', NULL);
INSERT INTO `tb_item_venda` VALUES (277, 323, 249, 7, 50.00, 350.00, 131, '2025-01-27 19:49:28', NULL);
INSERT INTO `tb_item_venda` VALUES (278, 324, 156, 1, 200.00, 200.00, 131, '2025-01-27 19:50:57', NULL);
INSERT INTO `tb_item_venda` VALUES (279, 325, 18, 1, 400.00, 400.00, 132, '2025-01-28 12:16:27', NULL);
INSERT INTO `tb_item_venda` VALUES (280, 326, 342, 1, 500.00, 500.00, 132, '2025-01-28 12:54:43', NULL);
INSERT INTO `tb_item_venda` VALUES (281, 327, 192, 1, 4000.00, 4000.00, 132, '2025-01-28 14:09:46', NULL);
INSERT INTO `tb_item_venda` VALUES (282, 327, 214, 1, 1000.00, 1000.00, 132, '2025-01-28 14:09:46', NULL);
INSERT INTO `tb_item_venda` VALUES (283, 327, 308, 3, 200.00, 600.00, 132, '2025-01-28 14:09:46', NULL);
INSERT INTO `tb_item_venda` VALUES (284, 328, 355, 1, 400.00, 400.00, 132, '2025-01-28 14:10:29', NULL);
INSERT INTO `tb_item_venda` VALUES (285, 329, 300, 1, 500.00, 500.00, 0, '2025-01-28 17:03:58', NULL);
INSERT INTO `tb_item_venda` VALUES (286, 330, 338, 1, 400.00, 400.00, 0, '2025-01-28 17:04:44', NULL);
INSERT INTO `tb_item_venda` VALUES (287, 331, 278, 1, 200.00, 200.00, 0, '2025-01-28 17:13:05', NULL);
INSERT INTO `tb_item_venda` VALUES (288, 332, 270, 1, 150.00, 150.00, 0, '2025-01-28 18:47:50', NULL);
INSERT INTO `tb_item_venda` VALUES (289, 333, 190, 1, 350.00, 350.00, 0, '2025-01-28 19:02:51', NULL);
INSERT INTO `tb_item_venda` VALUES (293, 337, 239, 1, 700.00, 700.00, 132, '2025-01-28 19:24:42', NULL);
INSERT INTO `tb_item_venda` VALUES (295, 339, 105, 1, 450.00, 450.00, 132, '2025-01-29 06:38:18', NULL);
INSERT INTO `tb_item_venda` VALUES (296, 339, 278, 1, 200.00, 200.00, 132, '2025-01-29 06:38:18', NULL);
INSERT INTO `tb_item_venda` VALUES (297, 339, 197, 1, 750.00, 750.00, 132, '2025-01-29 06:38:18', NULL);
INSERT INTO `tb_item_venda` VALUES (298, 340, 300, 1, 500.00, 500.00, 0, '2025-01-29 11:15:27', NULL);
INSERT INTO `tb_item_venda` VALUES (299, 340, 170, 1, 3000.00, 3000.00, 0, '2025-01-29 11:15:27', NULL);
INSERT INTO `tb_item_venda` VALUES (300, 341, 170, 1, 3000.00, 3000.00, 130, '2025-01-29 11:21:20', NULL);
INSERT INTO `tb_item_venda` VALUES (301, 341, 300, 1, 500.00, 500.00, 130, '2025-01-29 11:21:20', NULL);
INSERT INTO `tb_item_venda` VALUES (302, 342, 159, 1, 500.00, 500.00, 129, '2025-01-29 11:39:22', NULL);
INSERT INTO `tb_item_venda` VALUES (303, 343, 249, 4, 50.00, 200.00, 129, '2025-01-29 11:58:54', NULL);
INSERT INTO `tb_item_venda` VALUES (304, 343, 308, 1, 200.00, 200.00, 129, '2025-01-29 11:58:54', NULL);
INSERT INTO `tb_item_venda` VALUES (305, 344, 190, 2, 350.00, 700.00, 129, '2025-01-29 12:22:50', NULL);
INSERT INTO `tb_item_venda` VALUES (306, 345, 252, 1, 500.00, 500.00, 129, '2025-01-29 12:41:28', NULL);
INSERT INTO `tb_item_venda` VALUES (307, 346, 270, 1, 150.00, 150.00, 129, '2025-01-29 15:05:59', NULL);
INSERT INTO `tb_item_venda` VALUES (308, 346, 230, 1, 700.00, 700.00, 129, '2025-01-29 15:05:59', NULL);
INSERT INTO `tb_item_venda` VALUES (309, 346, 197, 1, 750.00, 750.00, 129, '2025-01-29 15:05:59', NULL);
INSERT INTO `tb_item_venda` VALUES (310, 346, 342, 1, 500.00, 500.00, 129, '2025-01-29 15:05:59', NULL);
INSERT INTO `tb_item_venda` VALUES (311, 346, 94, 1, 350.00, 350.00, 129, '2025-01-29 15:05:59', NULL);
INSERT INTO `tb_item_venda` VALUES (312, 346, 190, 1, 350.00, 350.00, 129, '2025-01-29 15:05:59', NULL);
INSERT INTO `tb_item_venda` VALUES (313, 346, 178, 1, 450.00, 450.00, 129, '2025-01-29 15:05:59', NULL);
INSERT INTO `tb_item_venda` VALUES (314, 347, 48, 1, 150.00, 150.00, 129, '2025-01-29 15:39:21', NULL);
INSERT INTO `tb_item_venda` VALUES (315, 347, 49, 1, 200.00, 200.00, 129, '2025-01-29 15:39:21', NULL);
INSERT INTO `tb_item_venda` VALUES (316, 347, 254, 1, 200.00, 200.00, 129, '2025-01-29 15:39:21', NULL);
INSERT INTO `tb_item_venda` VALUES (317, 347, 95, 1, 300.00, 300.00, 129, '2025-01-29 15:39:21', NULL);
INSERT INTO `tb_item_venda` VALUES (318, 348, 270, 2, 150.00, 300.00, 130, '2025-01-29 17:38:50', NULL);
INSERT INTO `tb_item_venda` VALUES (319, 349, 97, 2, 200.00, 400.00, 130, '2025-01-29 17:52:56', NULL);
INSERT INTO `tb_item_venda` VALUES (320, 350, 123, 1, 400.00, 400.00, 130, '2025-01-29 18:09:14', NULL);
INSERT INTO `tb_item_venda` VALUES (321, 350, 344, 1, 850.00, 850.00, 130, '2025-01-29 18:09:14', NULL);
INSERT INTO `tb_item_venda` VALUES (322, 351, 178, 1, 450.00, 450.00, 130, '2025-01-29 18:10:17', NULL);
INSERT INTO `tb_item_venda` VALUES (323, 352, 278, 2, 200.00, 400.00, 131, '2025-01-30 07:25:25', NULL);
INSERT INTO `tb_item_venda` VALUES (324, 352, 92, 1, 200.00, 200.00, 131, '2025-01-30 07:25:25', NULL);
INSERT INTO `tb_item_venda` VALUES (325, 352, 266, 1, 700.00, 700.00, 131, '2025-01-30 07:25:25', NULL);
INSERT INTO `tb_item_venda` VALUES (326, 353, 92, 1, 200.00, 200.00, 131, '2025-01-30 07:44:25', NULL);
INSERT INTO `tb_item_venda` VALUES (327, 354, 236, 1, 700.00, 700.00, 131, '2025-01-30 09:37:57', NULL);
INSERT INTO `tb_item_venda` VALUES (328, 354, 92, 1, 200.00, 200.00, 131, '2025-01-30 09:37:57', NULL);
INSERT INTO `tb_item_venda` VALUES (329, 354, 249, 2, 50.00, 100.00, 131, '2025-01-30 09:37:57', NULL);
INSERT INTO `tb_item_venda` VALUES (330, 355, 178, 1, 450.00, 450.00, 131, '2025-01-30 11:26:10', NULL);
INSERT INTO `tb_item_venda` VALUES (331, 355, 338, 1, 400.00, 400.00, 131, '2025-01-30 11:26:10', NULL);
INSERT INTO `tb_item_venda` VALUES (332, 356, 120, 1, 250.00, 250.00, 131, '2025-01-30 12:29:27', NULL);
INSERT INTO `tb_item_venda` VALUES (333, 357, 171, 2, 1000.00, 2000.00, 131, '2025-01-30 13:06:09', NULL);
INSERT INTO `tb_item_venda` VALUES (334, 357, 240, 3, 200.00, 600.00, 131, '2025-01-30 13:06:11', NULL);
INSERT INTO `tb_item_venda` VALUES (335, 357, 148, 2, 300.00, 600.00, 131, '2025-01-30 13:06:12', NULL);
INSERT INTO `tb_item_venda` VALUES (336, 358, 178, 1, 450.00, 450.00, 131, '2025-01-30 13:26:47', NULL);
INSERT INTO `tb_item_venda` VALUES (337, 359, 37, 1, 1000.00, 1000.00, 101, '2025-01-30 13:55:28', NULL);
INSERT INTO `tb_item_venda` VALUES (338, 359, 249, 1, 50.00, 50.00, 101, '2025-01-30 13:55:28', NULL);
INSERT INTO `tb_item_venda` VALUES (339, 360, 97, 1, 200.00, 200.00, 129, '2025-01-30 14:12:34', NULL);
INSERT INTO `tb_item_venda` VALUES (340, 360, 159, 2, 500.00, 1000.00, 129, '2025-01-30 14:12:34', NULL);
INSERT INTO `tb_item_venda` VALUES (341, 360, 278, 3, 200.00, 600.00, 129, '2025-01-30 14:12:34', NULL);
INSERT INTO `tb_item_venda` VALUES (342, 360, 105, 1, 450.00, 450.00, 129, '2025-01-30 14:12:34', NULL);
INSERT INTO `tb_item_venda` VALUES (343, 360, 322, 1, 200.00, 200.00, 129, '2025-01-30 14:12:34', NULL);
INSERT INTO `tb_item_venda` VALUES (344, 360, 252, 3, 500.00, 1500.00, 129, '2025-01-30 14:12:34', NULL);
INSERT INTO `tb_item_venda` VALUES (345, 360, 37, 1, 1000.00, 1000.00, 129, '2025-01-30 14:12:34', NULL);
INSERT INTO `tb_item_venda` VALUES (346, 360, 107, 1, 300.00, 300.00, 129, '2025-01-30 14:12:34', NULL);
INSERT INTO `tb_item_venda` VALUES (347, 360, 249, 5, 50.00, 250.00, 129, '2025-01-30 14:12:34', NULL);
INSERT INTO `tb_item_venda` VALUES (348, 360, 332, 1, 500.00, 500.00, 129, '2025-01-30 14:12:34', NULL);
INSERT INTO `tb_item_venda` VALUES (349, 360, 137, 1, 300.00, 300.00, 129, '2025-01-30 14:12:34', NULL);
INSERT INTO `tb_item_venda` VALUES (350, 360, 215, 1, 1000.00, 1000.00, 129, '2025-01-30 14:12:34', NULL);
INSERT INTO `tb_item_venda` VALUES (351, 360, 292, 1, 5100.00, 5100.00, 129, '2025-01-30 14:12:34', NULL);
INSERT INTO `tb_item_venda` VALUES (352, 360, 312, 4, 250.00, 1000.00, 129, '2025-01-30 14:12:34', NULL);
INSERT INTO `tb_item_venda` VALUES (353, 360, 42, 2, 350.00, 700.00, 129, '2025-01-30 14:12:34', NULL);
INSERT INTO `tb_item_venda` VALUES (354, 360, 46, 3, 1000.00, 3000.00, 129, '2025-01-30 14:12:34', NULL);
INSERT INTO `tb_item_venda` VALUES (355, 360, 15, 1, 850.00, 850.00, 129, '2025-01-30 14:12:34', NULL);
INSERT INTO `tb_item_venda` VALUES (356, 360, 305, 1, 1200.00, 1200.00, 129, '2025-01-30 14:12:34', NULL);
INSERT INTO `tb_item_venda` VALUES (357, 360, 156, 2, 200.00, 400.00, 129, '2025-01-30 14:12:34', NULL);
INSERT INTO `tb_item_venda` VALUES (358, 360, 270, 2, 150.00, 300.00, 129, '2025-01-30 14:12:34', NULL);
INSERT INTO `tb_item_venda` VALUES (359, 360, 328, 1, 100.00, 100.00, 129, '2025-01-30 14:12:34', NULL);
INSERT INTO `tb_item_venda` VALUES (360, 360, 262, 1, 250.00, 250.00, 129, '2025-01-30 14:12:34', NULL);
INSERT INTO `tb_item_venda` VALUES (361, 361, 312, 4, 250.00, 1000.00, 129, '2025-01-30 14:23:18', NULL);
INSERT INTO `tb_item_venda` VALUES (362, 361, 51, 1, 300.00, 300.00, 129, '2025-01-30 14:23:18', NULL);
INSERT INTO `tb_item_venda` VALUES (363, 361, 270, 1, 150.00, 150.00, 129, '2025-01-30 14:23:18', NULL);
INSERT INTO `tb_item_venda` VALUES (364, 361, 328, 4, 100.00, 400.00, 129, '2025-01-30 14:23:18', NULL);
INSERT INTO `tb_item_venda` VALUES (365, 361, 105, 1, 450.00, 450.00, 129, '2025-01-30 14:23:18', NULL);
INSERT INTO `tb_item_venda` VALUES (366, 361, 343, 1, 300.00, 300.00, 129, '2025-01-30 14:23:18', NULL);
INSERT INTO `tb_item_venda` VALUES (367, 361, 278, 2, 200.00, 400.00, 129, '2025-01-30 14:23:18', NULL);
INSERT INTO `tb_item_venda` VALUES (368, 361, 322, 1, 200.00, 200.00, 129, '2025-01-30 14:23:18', NULL);
INSERT INTO `tb_item_venda` VALUES (369, 361, 95, 3, 400.00, 1200.00, 129, '2025-01-30 14:23:18', NULL);
INSERT INTO `tb_item_venda` VALUES (370, 361, 94, 3, 350.00, 1050.00, 129, '2025-01-30 14:23:18', NULL);
INSERT INTO `tb_item_venda` VALUES (371, 361, 232, 1, 1500.00, 1500.00, 129, '2025-01-30 14:23:18', NULL);
INSERT INTO `tb_item_venda` VALUES (372, 361, 346, 2, 450.00, 900.00, 129, '2025-01-30 14:23:18', NULL);
INSERT INTO `tb_item_venda` VALUES (373, 361, 321, 1, 200.00, 200.00, 129, '2025-01-30 14:23:18', NULL);
INSERT INTO `tb_item_venda` VALUES (374, 361, 224, 1, 350.00, 350.00, 129, '2025-01-30 14:23:18', NULL);
INSERT INTO `tb_item_venda` VALUES (375, 361, 225, 1, 1000.00, 1000.00, 129, '2025-01-30 14:23:18', NULL);
INSERT INTO `tb_item_venda` VALUES (376, 361, 117, 1, 700.00, 700.00, 129, '2025-01-30 14:23:18', NULL);
INSERT INTO `tb_item_venda` VALUES (377, 361, 249, 4, 50.00, 200.00, 129, '2025-01-30 14:23:18', NULL);
INSERT INTO `tb_item_venda` VALUES (378, 361, 256, 1, 350.00, 350.00, 129, '2025-01-30 14:23:18', NULL);
INSERT INTO `tb_item_venda` VALUES (379, 361, 159, 1, 500.00, 500.00, 129, '2025-01-30 14:23:18', NULL);
INSERT INTO `tb_item_venda` VALUES (380, 361, 50, 5, 100.00, 500.00, 129, '2025-01-30 14:23:18', NULL);
INSERT INTO `tb_item_venda` VALUES (381, 361, 308, 1, 200.00, 200.00, 129, '2025-01-30 14:23:18', NULL);
INSERT INTO `tb_item_venda` VALUES (382, 361, 262, 1, 250.00, 250.00, 129, '2025-01-30 14:23:18', NULL);
INSERT INTO `tb_item_venda` VALUES (383, 362, 190, 1, 350.00, 350.00, 129, '2025-01-30 14:30:32', NULL);
INSERT INTO `tb_item_venda` VALUES (384, 362, 310, 10, 250.00, 2500.00, 129, '2025-01-30 14:30:32', NULL);
INSERT INTO `tb_item_venda` VALUES (385, 362, 328, 5, 100.00, 500.00, 129, '2025-01-30 14:30:32', NULL);
INSERT INTO `tb_item_venda` VALUES (386, 362, 105, 1, 450.00, 450.00, 129, '2025-01-30 14:30:32', NULL);
INSERT INTO `tb_item_venda` VALUES (387, 362, 92, 1, 200.00, 200.00, 129, '2025-01-30 14:30:32', NULL);
INSERT INTO `tb_item_venda` VALUES (388, 362, 159, 5, 500.00, 2500.00, 129, '2025-01-30 14:30:32', NULL);
INSERT INTO `tb_item_venda` VALUES (389, 362, 270, 2, 150.00, 300.00, 129, '2025-01-30 14:30:32', NULL);
INSERT INTO `tb_item_venda` VALUES (390, 362, 255, 5, 200.00, 1000.00, 129, '2025-01-30 14:30:32', NULL);
INSERT INTO `tb_item_venda` VALUES (391, 362, 302, 3, 1200.00, 3600.00, 129, '2025-01-30 14:30:32', NULL);
INSERT INTO `tb_item_venda` VALUES (392, 362, 120, 1, 250.00, 250.00, 129, '2025-01-30 14:30:32', NULL);
INSERT INTO `tb_item_venda` VALUES (393, 362, 136, 1, 700.00, 700.00, 129, '2025-01-30 14:30:32', NULL);
INSERT INTO `tb_item_venda` VALUES (394, 362, 308, 2, 200.00, 400.00, 129, '2025-01-30 14:30:32', NULL);
INSERT INTO `tb_item_venda` VALUES (395, 362, 148, 2, 300.00, 600.00, 129, '2025-01-30 14:30:32', NULL);
INSERT INTO `tb_item_venda` VALUES (396, 362, 240, 1, 200.00, 200.00, 129, '2025-01-30 14:30:32', NULL);
INSERT INTO `tb_item_venda` VALUES (397, 362, 243, 1, 200.00, 200.00, 129, '2025-01-30 14:30:32', NULL);
INSERT INTO `tb_item_venda` VALUES (398, 362, 178, 1, 450.00, 450.00, 129, '2025-01-30 14:30:32', NULL);
INSERT INTO `tb_item_venda` VALUES (399, 362, 278, 6, 200.00, 1200.00, 129, '2025-01-30 14:30:32', NULL);
INSERT INTO `tb_item_venda` VALUES (400, 362, 305, 1, 1200.00, 1200.00, 129, '2025-01-30 14:30:32', NULL);
INSERT INTO `tb_item_venda` VALUES (401, 362, 94, 1, 350.00, 350.00, 129, '2025-01-30 14:30:32', NULL);
INSERT INTO `tb_item_venda` VALUES (402, 362, 318, 1, 250.00, 250.00, 129, '2025-01-30 14:30:32', NULL);
INSERT INTO `tb_item_venda` VALUES (403, 362, 313, 8, 250.00, 2000.00, 129, '2025-01-30 14:30:32', NULL);
INSERT INTO `tb_item_venda` VALUES (404, 362, 99, 1, 900.00, 900.00, 129, '2025-01-30 14:30:32', NULL);
INSERT INTO `tb_item_venda` VALUES (405, 362, 252, 1, 500.00, 500.00, 129, '2025-01-30 14:30:32', NULL);
INSERT INTO `tb_item_venda` VALUES (406, 363, 302, 1, 1200.00, 1200.00, 129, '2025-01-30 14:35:40', NULL);
INSERT INTO `tb_item_venda` VALUES (407, 363, 190, 1, 350.00, 350.00, 129, '2025-01-30 14:35:40', NULL);
INSERT INTO `tb_item_venda` VALUES (408, 363, 270, 2, 150.00, 300.00, 129, '2025-01-30 14:35:40', NULL);
INSERT INTO `tb_item_venda` VALUES (409, 363, 328, 7, 100.00, 700.00, 129, '2025-01-30 14:35:40', NULL);
INSERT INTO `tb_item_venda` VALUES (410, 363, 94, 2, 350.00, 700.00, 129, '2025-01-30 14:35:40', NULL);
INSERT INTO `tb_item_venda` VALUES (411, 363, 343, 1, 300.00, 300.00, 129, '2025-01-30 14:35:40', NULL);
INSERT INTO `tb_item_venda` VALUES (412, 363, 312, 6, 250.00, 1500.00, 129, '2025-01-30 14:35:40', NULL);
INSERT INTO `tb_item_venda` VALUES (413, 363, 342, 1, 500.00, 500.00, 129, '2025-01-30 14:35:40', NULL);
INSERT INTO `tb_item_venda` VALUES (414, 363, 249, 1, 50.00, 50.00, 129, '2025-01-30 14:35:40', NULL);
INSERT INTO `tb_item_venda` VALUES (415, 363, 171, 1, 1000.00, 1000.00, 129, '2025-01-30 14:35:40', NULL);
INSERT INTO `tb_item_venda` VALUES (416, 363, 160, 1, 400.00, 400.00, 129, '2025-01-30 14:35:40', NULL);
INSERT INTO `tb_item_venda` VALUES (417, 363, 239, 1, 700.00, 700.00, 129, '2025-01-30 14:35:41', NULL);
INSERT INTO `tb_item_venda` VALUES (418, 363, 203, 1, 1100.00, 1100.00, 129, '2025-01-30 14:35:41', NULL);
INSERT INTO `tb_item_venda` VALUES (419, 364, 97, 1, 200.00, 200.00, 131, '2025-01-30 14:39:31', NULL);
INSERT INTO `tb_item_venda` VALUES (420, 365, 102, 2, 850.00, 1700.00, 129, '2025-01-30 14:49:31', NULL);
INSERT INTO `tb_item_venda` VALUES (421, 365, 244, 1, 700.00, 700.00, 129, '2025-01-30 14:49:31', NULL);
INSERT INTO `tb_item_venda` VALUES (422, 365, 255, 1, 200.00, 200.00, 129, '2025-01-30 14:49:31', NULL);
INSERT INTO `tb_item_venda` VALUES (423, 365, 315, 2, 850.00, 1700.00, 129, '2025-01-30 14:49:31', NULL);
INSERT INTO `tb_item_venda` VALUES (424, 365, 210, 1, 700.00, 700.00, 129, '2025-01-30 14:49:31', NULL);
INSERT INTO `tb_item_venda` VALUES (425, 365, 204, 1, 1100.00, 1100.00, 129, '2025-01-30 14:49:31', NULL);
INSERT INTO `tb_item_venda` VALUES (426, 365, 308, 1, 200.00, 200.00, 129, '2025-01-30 14:49:31', NULL);
INSERT INTO `tb_item_venda` VALUES (427, 365, 137, 1, 300.00, 300.00, 129, '2025-01-30 14:49:31', NULL);
INSERT INTO `tb_item_venda` VALUES (428, 365, 81, 1, 400.00, 400.00, 129, '2025-01-30 14:49:31', NULL);
INSERT INTO `tb_item_venda` VALUES (429, 365, 302, 3, 1200.00, 3600.00, 129, '2025-01-30 14:49:31', NULL);
INSERT INTO `tb_item_venda` VALUES (430, 365, 278, 5, 200.00, 1000.00, 129, '2025-01-30 14:49:31', NULL);
INSERT INTO `tb_item_venda` VALUES (431, 365, 92, 2, 200.00, 400.00, 129, '2025-01-30 14:49:31', NULL);
INSERT INTO `tb_item_venda` VALUES (432, 365, 305, 2, 1200.00, 2400.00, 129, '2025-01-30 14:49:31', NULL);
INSERT INTO `tb_item_venda` VALUES (433, 365, 215, 2, 1000.00, 2000.00, 129, '2025-01-30 14:49:31', NULL);
INSERT INTO `tb_item_venda` VALUES (434, 365, 318, 1, 250.00, 250.00, 129, '2025-01-30 14:49:31', NULL);
INSERT INTO `tb_item_venda` VALUES (435, 365, 321, 1, 200.00, 200.00, 129, '2025-01-30 14:49:31', NULL);
INSERT INTO `tb_item_venda` VALUES (436, 365, 240, 1, 200.00, 200.00, 129, '2025-01-30 14:49:31', NULL);
INSERT INTO `tb_item_venda` VALUES (437, 365, 322, 3, 200.00, 600.00, 129, '2025-01-30 14:49:31', NULL);
INSERT INTO `tb_item_venda` VALUES (438, 365, 57, 1, 5750.00, 5750.00, 129, '2025-01-30 14:49:31', NULL);
INSERT INTO `tb_item_venda` VALUES (439, 365, 249, 12, 50.00, 600.00, 129, '2025-01-30 14:49:31', NULL);
INSERT INTO `tb_item_venda` VALUES (440, 365, 159, 1, 500.00, 500.00, 129, '2025-01-30 14:49:31', NULL);
INSERT INTO `tb_item_venda` VALUES (441, 365, 96, 1, 1350.00, 1350.00, 129, '2025-01-30 14:49:31', NULL);
INSERT INTO `tb_item_venda` VALUES (442, 365, 331, 1, 700.00, 700.00, 129, '2025-01-30 14:49:31', NULL);
INSERT INTO `tb_item_venda` VALUES (443, 365, 178, 1, 450.00, 450.00, 129, '2025-01-30 14:49:31', NULL);
INSERT INTO `tb_item_venda` VALUES (444, 365, 117, 1, 700.00, 700.00, 129, '2025-01-30 14:49:31', NULL);
INSERT INTO `tb_item_venda` VALUES (445, 366, 136, 1, 700.00, 700.00, 129, '2025-01-30 15:01:53', NULL);
INSERT INTO `tb_item_venda` VALUES (446, 366, 50, 1, 100.00, 100.00, 129, '2025-01-30 15:01:53', NULL);
INSERT INTO `tb_item_venda` VALUES (447, 366, 309, 1, 450.00, 450.00, 129, '2025-01-30 15:01:53', NULL);
INSERT INTO `tb_item_venda` VALUES (448, 366, 120, 1, 250.00, 250.00, 129, '2025-01-30 15:01:53', NULL);
INSERT INTO `tb_item_venda` VALUES (449, 366, 76, 1, 450.00, 450.00, 129, '2025-01-30 15:01:53', NULL);
INSERT INTO `tb_item_venda` VALUES (450, 366, 255, 24, 200.00, 4800.00, 129, '2025-01-30 15:01:53', NULL);
INSERT INTO `tb_item_venda` VALUES (451, 366, 232, 1, 1500.00, 1500.00, 129, '2025-01-30 15:01:53', NULL);
INSERT INTO `tb_item_venda` VALUES (452, 366, 167, 1, 750.00, 750.00, 129, '2025-01-30 15:01:53', NULL);
INSERT INTO `tb_item_venda` VALUES (453, 366, 269, 1, 2600.00, 2600.00, 129, '2025-01-30 15:01:53', NULL);
INSERT INTO `tb_item_venda` VALUES (454, 366, 44, 1, 850.00, 850.00, 129, '2025-01-30 15:01:53', NULL);
INSERT INTO `tb_item_venda` VALUES (455, 366, 210, 1, 700.00, 700.00, 129, '2025-01-30 15:01:53', NULL);
INSERT INTO `tb_item_venda` VALUES (456, 366, 102, 1, 850.00, 850.00, 129, '2025-01-30 15:01:53', NULL);
INSERT INTO `tb_item_venda` VALUES (457, 366, 344, 1, 850.00, 850.00, 129, '2025-01-30 15:01:53', NULL);
INSERT INTO `tb_item_venda` VALUES (458, 366, 159, 3, 500.00, 1500.00, 129, '2025-01-30 15:01:53', NULL);
INSERT INTO `tb_item_venda` VALUES (459, 366, 302, 2, 1200.00, 2400.00, 129, '2025-01-30 15:01:53', NULL);
INSERT INTO `tb_item_venda` VALUES (460, 366, 94, 4, 350.00, 1400.00, 129, '2025-01-30 15:01:53', NULL);
INSERT INTO `tb_item_venda` VALUES (461, 366, 105, 4, 450.00, 1800.00, 129, '2025-01-30 15:01:53', NULL);
INSERT INTO `tb_item_venda` VALUES (462, 366, 137, 5, 300.00, 1500.00, 129, '2025-01-30 15:01:53', NULL);
INSERT INTO `tb_item_venda` VALUES (463, 366, 178, 3, 450.00, 1350.00, 129, '2025-01-30 15:01:53', NULL);
INSERT INTO `tb_item_venda` VALUES (464, 366, 236, 1, 700.00, 700.00, 129, '2025-01-30 15:01:53', NULL);
INSERT INTO `tb_item_venda` VALUES (465, 366, 249, 3, 50.00, 150.00, 129, '2025-01-30 15:01:53', NULL);
INSERT INTO `tb_item_venda` VALUES (466, 366, 160, 1, 400.00, 400.00, 129, '2025-01-30 15:01:53', NULL);
INSERT INTO `tb_item_venda` VALUES (467, 366, 17, 1, 550.00, 550.00, 129, '2025-01-30 15:01:53', NULL);
INSERT INTO `tb_item_venda` VALUES (468, 366, 222, 1, 1500.00, 1500.00, 129, '2025-01-30 15:01:53', NULL);
INSERT INTO `tb_item_venda` VALUES (469, 366, 20, 1, 1200.00, 1200.00, 129, '2025-01-30 15:01:53', NULL);
INSERT INTO `tb_item_venda` VALUES (470, 366, 346, 3, 450.00, 1350.00, 129, '2025-01-30 15:01:53', NULL);
INSERT INTO `tb_item_venda` VALUES (471, 366, 148, 3, 300.00, 900.00, 129, '2025-01-30 15:01:53', NULL);
INSERT INTO `tb_item_venda` VALUES (472, 366, 190, 1, 350.00, 350.00, 129, '2025-01-30 15:01:53', NULL);
INSERT INTO `tb_item_venda` VALUES (473, 366, 197, 1, 750.00, 750.00, 129, '2025-01-30 15:01:53', NULL);
INSERT INTO `tb_item_venda` VALUES (474, 366, 270, 2, 150.00, 300.00, 129, '2025-01-30 15:01:53', NULL);
INSERT INTO `tb_item_venda` VALUES (475, 366, 312, 4, 250.00, 1000.00, 129, '2025-01-30 15:01:53', NULL);
INSERT INTO `tb_item_venda` VALUES (476, 366, 62, 1, 1300.00, 1300.00, 129, '2025-01-30 15:01:53', NULL);
INSERT INTO `tb_item_venda` VALUES (477, 366, 194, 1, 4000.00, 4000.00, 129, '2025-01-30 15:01:53', NULL);
INSERT INTO `tb_item_venda` VALUES (478, 366, 95, 1, 400.00, 400.00, 129, '2025-01-30 15:01:53', NULL);
INSERT INTO `tb_item_venda` VALUES (479, 366, 224, 1, 350.00, 350.00, 129, '2025-01-30 15:01:53', NULL);
INSERT INTO `tb_item_venda` VALUES (480, 367, 50, 8, 100.00, 800.00, 129, '2025-01-30 15:11:24', NULL);
INSERT INTO `tb_item_venda` VALUES (481, 367, 159, 4, 500.00, 2000.00, 129, '2025-01-30 15:11:24', NULL);
INSERT INTO `tb_item_venda` VALUES (482, 367, 47, 1, 300.00, 300.00, 129, '2025-01-30 15:11:24', NULL);
INSERT INTO `tb_item_venda` VALUES (483, 367, 209, 1, 600.00, 600.00, 129, '2025-01-30 15:11:24', NULL);
INSERT INTO `tb_item_venda` VALUES (484, 367, 332, 2, 500.00, 1000.00, 129, '2025-01-30 15:11:24', NULL);
INSERT INTO `tb_item_venda` VALUES (485, 367, 278, 1, 200.00, 200.00, 129, '2025-01-30 15:11:24', NULL);
INSERT INTO `tb_item_venda` VALUES (486, 367, 222, 3, 1500.00, 4500.00, 129, '2025-01-30 15:11:24', NULL);
INSERT INTO `tb_item_venda` VALUES (487, 367, 371, 1, 3500.00, 3500.00, 129, '2025-01-30 15:11:24', NULL);
INSERT INTO `tb_item_venda` VALUES (488, 367, 308, 2, 200.00, 400.00, 129, '2025-01-30 15:11:24', NULL);
INSERT INTO `tb_item_venda` VALUES (489, 367, 68, 1, 900.00, 900.00, 129, '2025-01-30 15:11:24', NULL);
INSERT INTO `tb_item_venda` VALUES (490, 367, 137, 1, 300.00, 300.00, 129, '2025-01-30 15:11:24', NULL);
INSERT INTO `tb_item_venda` VALUES (491, 367, 299, 1, 900.00, 900.00, 129, '2025-01-30 15:11:24', NULL);
INSERT INTO `tb_item_venda` VALUES (492, 367, 37, 1, 1000.00, 1000.00, 129, '2025-01-30 15:11:24', NULL);
INSERT INTO `tb_item_venda` VALUES (493, 367, 242, 1, 500.00, 500.00, 129, '2025-01-30 15:11:24', NULL);
INSERT INTO `tb_item_venda` VALUES (494, 367, 117, 1, 700.00, 700.00, 129, '2025-01-30 15:11:24', NULL);
INSERT INTO `tb_item_venda` VALUES (495, 367, 249, 3, 50.00, 150.00, 129, '2025-01-30 15:11:24', NULL);
INSERT INTO `tb_item_venda` VALUES (496, 367, 45, 1, 1000.00, 1000.00, 129, '2025-01-30 15:11:24', NULL);
INSERT INTO `tb_item_venda` VALUES (497, 367, 79, 1, 950.00, 950.00, 129, '2025-01-30 15:11:24', NULL);
INSERT INTO `tb_item_venda` VALUES (498, 368, 321, 3, 200.00, 600.00, 129, '2025-01-30 15:17:31', NULL);
INSERT INTO `tb_item_venda` VALUES (499, 368, 148, 2, 300.00, 600.00, 129, '2025-01-30 15:17:31', NULL);
INSERT INTO `tb_item_venda` VALUES (500, 368, 318, 1, 250.00, 250.00, 129, '2025-01-30 15:17:31', NULL);
INSERT INTO `tb_item_venda` VALUES (501, 368, 222, 1, 1500.00, 1500.00, 129, '2025-01-30 15:17:31', NULL);
INSERT INTO `tb_item_venda` VALUES (502, 368, 255, 1, 200.00, 200.00, 129, '2025-01-30 15:17:31', NULL);
INSERT INTO `tb_item_venda` VALUES (503, 368, 278, 1, 200.00, 200.00, 129, '2025-01-30 15:17:31', NULL);
INSERT INTO `tb_item_venda` VALUES (504, 368, 94, 2, 350.00, 700.00, 129, '2025-01-30 15:17:31', NULL);
INSERT INTO `tb_item_venda` VALUES (505, 368, 295, 1, 200.00, 200.00, 129, '2025-01-30 15:17:31', NULL);
INSERT INTO `tb_item_venda` VALUES (506, 368, 23, 1, 550.00, 550.00, 129, '2025-01-30 15:17:31', NULL);
INSERT INTO `tb_item_venda` VALUES (507, 368, 14, 1, 2000.00, 2000.00, 129, '2025-01-30 15:17:31', NULL);
INSERT INTO `tb_item_venda` VALUES (508, 368, 332, 2, 500.00, 1000.00, 129, '2025-01-30 15:17:31', NULL);
INSERT INTO `tb_item_venda` VALUES (509, 368, 291, 1, 850.00, 850.00, 129, '2025-01-30 15:17:31', NULL);
INSERT INTO `tb_item_venda` VALUES (510, 368, 160, 1, 400.00, 400.00, 129, '2025-01-30 15:17:31', NULL);
INSERT INTO `tb_item_venda` VALUES (511, 368, 159, 2, 500.00, 1000.00, 129, '2025-01-30 15:17:31', NULL);
INSERT INTO `tb_item_venda` VALUES (512, 368, 342, 1, 500.00, 500.00, 129, '2025-01-30 15:17:31', NULL);
INSERT INTO `tb_item_venda` VALUES (513, 368, 252, 1, 500.00, 500.00, 129, '2025-01-30 15:17:31', NULL);
INSERT INTO `tb_item_venda` VALUES (514, 368, 189, 1, 850.00, 850.00, 129, '2025-01-30 15:17:31', NULL);
INSERT INTO `tb_item_venda` VALUES (515, 368, 154, 1, 700.00, 700.00, 129, '2025-01-30 15:17:31', NULL);
INSERT INTO `tb_item_venda` VALUES (516, 368, 305, 1, 1200.00, 1200.00, 129, '2025-01-30 15:17:31', NULL);
INSERT INTO `tb_item_venda` VALUES (517, 369, 255, 2, 200.00, 400.00, 129, '2025-01-30 15:19:40', NULL);
INSERT INTO `tb_item_venda` VALUES (518, 369, 159, 1, 500.00, 500.00, 129, '2025-01-30 15:19:40', NULL);
INSERT INTO `tb_item_venda` VALUES (519, 369, 308, 2, 200.00, 400.00, 129, '2025-01-30 15:19:40', NULL);
INSERT INTO `tb_item_venda` VALUES (520, 369, 92, 2, 200.00, 400.00, 129, '2025-01-30 15:19:40', NULL);
INSERT INTO `tb_item_venda` VALUES (521, 369, 318, 1, 250.00, 250.00, 129, '2025-01-30 15:19:40', NULL);
INSERT INTO `tb_item_venda` VALUES (522, 369, 210, 1, 700.00, 700.00, 129, '2025-01-30 15:19:40', NULL);
INSERT INTO `tb_item_venda` VALUES (523, 369, 156, 1, 200.00, 200.00, 129, '2025-01-30 15:19:40', NULL);
INSERT INTO `tb_item_venda` VALUES (524, 369, 249, 4, 50.00, 200.00, 129, '2025-01-30 15:19:40', NULL);
INSERT INTO `tb_item_venda` VALUES (525, 369, 137, 1, 300.00, 300.00, 129, '2025-01-30 15:19:40', NULL);
INSERT INTO `tb_item_venda` VALUES (526, 370, 68, 2, 900.00, 1800.00, 131, '2025-01-30 15:39:47', NULL);
INSERT INTO `tb_item_venda` VALUES (527, 370, 205, 1, 300.00, 300.00, 131, '2025-01-30 15:39:47', NULL);
INSERT INTO `tb_item_venda` VALUES (528, 370, 74, 2, 200.00, 400.00, 131, '2025-01-30 15:39:47', NULL);
INSERT INTO `tb_item_venda` VALUES (529, 370, 331, 1, 700.00, 700.00, 131, '2025-01-30 15:39:47', NULL);
INSERT INTO `tb_item_venda` VALUES (530, 371, 302, 1, 1200.00, 1200.00, 131, '2025-01-30 16:21:56', NULL);
INSERT INTO `tb_item_venda` VALUES (531, 371, 232, 1, 1500.00, 1500.00, 131, '2025-01-30 16:21:56', NULL);
INSERT INTO `tb_item_venda` VALUES (532, 372, 94, 1, 350.00, 350.00, 131, '2025-01-30 16:26:08', NULL);
INSERT INTO `tb_item_venda` VALUES (533, 372, 220, 1, 3000.00, 3000.00, 131, '2025-01-30 16:26:08', NULL);
INSERT INTO `tb_item_venda` VALUES (534, 373, 88, 1, 1650.00, 1650.00, 131, '2025-01-30 16:30:01', NULL);
INSERT INTO `tb_item_venda` VALUES (535, 373, 365, 1, 250.00, 250.00, 131, '2025-01-30 16:30:01', NULL);
INSERT INTO `tb_item_venda` VALUES (536, 374, 24, 1, 1000.00, 1000.00, 131, '2025-01-30 17:47:03', NULL);
INSERT INTO `tb_item_venda` VALUES (537, 375, 159, 1, 500.00, 500.00, 131, '2025-01-30 18:02:00', NULL);
INSERT INTO `tb_item_venda` VALUES (538, 376, 332, 1, 500.00, 500.00, 131, '2025-01-30 18:38:12', NULL);
INSERT INTO `tb_item_venda` VALUES (539, 376, 44, 1, 850.00, 850.00, 131, '2025-01-30 18:38:12', NULL);
INSERT INTO `tb_item_venda` VALUES (540, 376, 321, 1, 200.00, 200.00, 131, '2025-01-30 18:38:12', NULL);
INSERT INTO `tb_item_venda` VALUES (541, 377, 159, 1, 500.00, 500.00, 131, '2025-01-30 18:42:39', NULL);
INSERT INTO `tb_item_venda` VALUES (542, 378, 212, 3, 3500.00, 10500.00, 131, '2025-01-30 18:54:45', NULL);
INSERT INTO `tb_item_venda` VALUES (543, 378, 56, 4, 900.00, 3600.00, 131, '2025-01-30 18:54:45', NULL);
INSERT INTO `tb_item_venda` VALUES (544, 378, 106, 2, 1950.00, 3900.00, 131, '2025-01-30 18:54:45', NULL);
INSERT INTO `tb_item_venda` VALUES (545, 379, 178, 1, 450.00, 450.00, 131, '2025-01-30 18:57:30', NULL);
INSERT INTO `tb_item_venda` VALUES (546, 380, 239, 1, 700.00, 700.00, 131, '2025-01-30 19:00:12', NULL);
INSERT INTO `tb_item_venda` VALUES (547, 381, 249, 2, 50.00, 100.00, 131, '2025-01-30 19:01:22', NULL);
INSERT INTO `tb_item_venda` VALUES (548, 382, 96, 1, 1350.00, 1350.00, 131, '2025-01-30 19:42:41', NULL);
INSERT INTO `tb_item_venda` VALUES (549, 383, 50, 5, 100.00, 500.00, 132, '2025-01-31 08:53:49', NULL);
INSERT INTO `tb_item_venda` VALUES (550, 383, 159, 1, 500.00, 500.00, 132, '2025-01-31 08:53:50', NULL);
INSERT INTO `tb_item_venda` VALUES (551, 384, 122, 2, 400.00, 800.00, 132, '2025-01-31 09:28:36', NULL);
INSERT INTO `tb_item_venda` VALUES (552, 384, 329, 1, 100.00, 100.00, 132, '2025-01-31 09:28:36', NULL);
INSERT INTO `tb_item_venda` VALUES (553, 385, 76, 4, 450.00, 1800.00, 132, '2025-01-31 09:37:27', NULL);
INSERT INTO `tb_item_venda` VALUES (554, 385, 97, 3, 200.00, 600.00, 132, '2025-01-31 09:37:27', NULL);
INSERT INTO `tb_item_venda` VALUES (555, 385, 254, 3, 200.00, 600.00, 132, '2025-01-31 09:37:27', NULL);
INSERT INTO `tb_item_venda` VALUES (556, 386, 18, 1, 400.00, 400.00, 132, '2025-01-31 13:06:23', NULL);
INSERT INTO `tb_item_venda` VALUES (557, 386, 328, 1, 100.00, 100.00, 132, '2025-01-31 13:06:23', NULL);
INSERT INTO `tb_item_venda` VALUES (558, 387, 262, 1, 250.00, 250.00, 132, '2025-01-31 13:56:57', NULL);
INSERT INTO `tb_item_venda` VALUES (559, 388, 120, 1, 250.00, 250.00, 129, '2025-01-31 14:08:22', NULL);
INSERT INTO `tb_item_venda` VALUES (560, 388, 94, 1, 350.00, 350.00, 129, '2025-01-31 14:08:22', NULL);
INSERT INTO `tb_item_venda` VALUES (561, 388, 42, 1, 350.00, 350.00, 129, '2025-01-31 14:08:22', NULL);
INSERT INTO `tb_item_venda` VALUES (562, 388, 230, 1, 700.00, 700.00, 129, '2025-01-31 14:08:22', NULL);
INSERT INTO `tb_item_venda` VALUES (563, 389, 107, 10, 300.00, 3000.00, 132, '2025-01-31 15:04:39', NULL);
INSERT INTO `tb_item_venda` VALUES (564, 389, 123, 6, 400.00, 2400.00, 132, '2025-01-31 15:04:39', NULL);
INSERT INTO `tb_item_venda` VALUES (565, 390, 342, 1, 500.00, 500.00, 132, '2025-01-31 16:32:56', NULL);
INSERT INTO `tb_item_venda` VALUES (566, 390, 178, 1, 450.00, 450.00, 132, '2025-01-31 16:32:56', NULL);
INSERT INTO `tb_item_venda` VALUES (567, 391, 83, 1, 150.00, 150.00, 132, '2025-01-31 16:48:22', NULL);
INSERT INTO `tb_item_venda` VALUES (568, 392, 22, 1, 1300.00, 1300.00, 132, '2025-01-31 17:24:51', NULL);
INSERT INTO `tb_item_venda` VALUES (569, 392, 215, 1, 1000.00, 1000.00, 132, '2025-01-31 17:24:51', NULL);
INSERT INTO `tb_item_venda` VALUES (570, 393, 159, 1, 500.00, 500.00, 132, '2025-01-31 17:25:29', NULL);
INSERT INTO `tb_item_venda` VALUES (571, 394, 128, 1, 500.00, 500.00, 132, '2025-01-31 18:37:22', NULL);
INSERT INTO `tb_item_venda` VALUES (572, 394, 18, 1, 400.00, 400.00, 132, '2025-01-31 18:37:22', NULL);
INSERT INTO `tb_item_venda` VALUES (573, 395, 27, 1, 200.00, 200.00, 132, '2025-01-31 18:42:54', NULL);
INSERT INTO `tb_item_venda` VALUES (574, 395, 48, 1, 150.00, 150.00, 132, '2025-01-31 18:42:54', NULL);
INSERT INTO `tb_item_venda` VALUES (575, 395, 337, 1, 200.00, 200.00, 132, '2025-01-31 18:42:54', NULL);
INSERT INTO `tb_item_venda` VALUES (576, 396, 234, 1, 550.00, 550.00, 132, '2025-01-31 18:47:46', NULL);
INSERT INTO `tb_item_venda` VALUES (577, 396, 160, 1, 400.00, 400.00, 132, '2025-01-31 18:47:46', NULL);
INSERT INTO `tb_item_venda` VALUES (578, 396, 156, 1, 200.00, 200.00, 132, '2025-01-31 18:47:46', NULL);
INSERT INTO `tb_item_venda` VALUES (579, 396, 250, 10, 50.00, 500.00, 132, '2025-01-31 18:47:46', NULL);
INSERT INTO `tb_item_venda` VALUES (580, 397, 300, 1, 500.00, 500.00, 132, '2025-01-31 18:59:06', NULL);
INSERT INTO `tb_item_venda` VALUES (581, 398, 252, 1, 500.00, 500.00, 132, '2025-01-31 20:44:38', NULL);
INSERT INTO `tb_item_venda` VALUES (582, 398, 342, 1, 500.00, 500.00, 132, '2025-01-31 20:44:38', NULL);
INSERT INTO `tb_item_venda` VALUES (583, 398, 238, 1, 700.00, 700.00, 132, '2025-01-31 20:44:38', NULL);
INSERT INTO `tb_item_venda` VALUES (584, 399, 263, 1, 1000.00, 1000.00, 130, '2025-02-01 07:17:51', NULL);
INSERT INTO `tb_item_venda` VALUES (585, 399, 197, 1, 750.00, 750.00, 130, '2025-02-01 07:17:51', NULL);
INSERT INTO `tb_item_venda` VALUES (586, 400, 210, 1, 700.00, 700.00, 130, '2025-02-01 08:03:10', NULL);
INSERT INTO `tb_item_venda` VALUES (587, 401, 45, 1, 1000.00, 1000.00, 130, '2025-02-01 09:46:24', NULL);
INSERT INTO `tb_item_venda` VALUES (588, 402, 236, 1, 700.00, 700.00, 130, '2025-02-01 10:05:54', NULL);
INSERT INTO `tb_item_venda` VALUES (589, 403, 308, 1, 200.00, 200.00, 130, '2025-02-01 11:22:49', NULL);
INSERT INTO `tb_item_venda` VALUES (590, 404, 47, 1, 300.00, 300.00, 130, '2025-02-01 13:17:06', NULL);
INSERT INTO `tb_item_venda` VALUES (591, 404, 337, 1, 200.00, 200.00, 130, '2025-02-01 13:17:07', NULL);
INSERT INTO `tb_item_venda` VALUES (592, 405, 337, 1, 200.00, 200.00, 130, '2025-02-01 13:18:33', NULL);
INSERT INTO `tb_item_venda` VALUES (593, 406, 331, 1, 700.00, 700.00, 130, '2025-02-01 13:48:29', NULL);
INSERT INTO `tb_item_venda` VALUES (594, 406, 96, 1, 1350.00, 1350.00, 130, '2025-02-01 13:48:29', NULL);
INSERT INTO `tb_item_venda` VALUES (595, 406, 357, 1, 600.00, 600.00, 130, '2025-02-01 13:48:29', NULL);
INSERT INTO `tb_item_venda` VALUES (596, 407, 349, 1, 600.00, 600.00, 130, '2025-02-01 14:13:32', NULL);
INSERT INTO `tb_item_venda` VALUES (597, 408, 224, 1, 350.00, 350.00, 130, '2025-02-01 15:21:37', NULL);
INSERT INTO `tb_item_venda` VALUES (598, 409, 318, 5, 250.00, 1250.00, 130, '2025-02-01 16:58:26', NULL);
INSERT INTO `tb_item_venda` VALUES (599, 410, 318, 1, 250.00, 250.00, 130, '2025-02-01 17:05:20', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 150 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

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
-- Table structure for tb_movimentacoes_estoque
-- ----------------------------
DROP TABLE IF EXISTS `tb_movimentacoes_estoque`;
CREATE TABLE `tb_movimentacoes_estoque`  (
  `id_movimentacao` int NOT NULL AUTO_INCREMENT,
  `id_estoque` int NOT NULL,
  `id_tipo_movimentacao` int NOT NULL,
  `quantidade_movimentada` int NOT NULL,
  `preco_venda` decimal(10, 2) NOT NULL,
  `data_movimentacao` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `id_usuario` int NULL DEFAULT NULL,
  PRIMARY KEY (`id_movimentacao`) USING BTREE,
  INDEX `id_estoque`(`id_estoque` ASC) USING BTREE,
  INDEX `id_tipo_movimentacao`(`id_tipo_movimentacao` ASC) USING BTREE,
  CONSTRAINT `tb_movimentacoes_estoque_ibfk_1` FOREIGN KEY (`id_estoque`) REFERENCES `tb_estoque` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tb_movimentacoes_estoque_ibfk_2` FOREIGN KEY (`id_tipo_movimentacao`) REFERENCES `tb_tipos_movimentacao` (`id_tipo_movimentacao`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_movimentacoes_estoque
-- ----------------------------

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
) ENGINE = InnoDB AUTO_INCREMENT = 185 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 806 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_pagamento_venda
-- ----------------------------
INSERT INTO `tb_pagamento_venda` VALUES (221, 221, 950.00, 1000.00, 50.00, '2025-01-23 20:54:51', 101);
INSERT INTO `tb_pagamento_venda` VALUES (222, 221, 950.00, 1000.00, 50.00, '2025-01-23 20:54:51', 101);
INSERT INTO `tb_pagamento_venda` VALUES (223, 222, 300.00, 1000.00, 700.00, '2025-01-23 21:04:54', 130);
INSERT INTO `tb_pagamento_venda` VALUES (224, 223, 2900.00, 5000.00, 2100.00, '2025-01-24 06:47:03', 131);
INSERT INTO `tb_pagamento_venda` VALUES (225, 223, 2900.00, 5000.00, 2100.00, '2025-01-24 06:47:03', 131);
INSERT INTO `tb_pagamento_venda` VALUES (226, 223, 2900.00, 5000.00, 2100.00, '2025-01-24 06:47:03', 131);
INSERT INTO `tb_pagamento_venda` VALUES (227, 224, 200.00, 200.00, 0.00, '2025-01-24 07:07:17', 131);
INSERT INTO `tb_pagamento_venda` VALUES (228, 225, 700.00, 900.00, 200.00, '2025-01-24 07:26:51', 131);
INSERT INTO `tb_pagamento_venda` VALUES (229, 226, 900.00, 1600.00, 700.00, '2025-01-24 09:03:56', 131);
INSERT INTO `tb_pagamento_venda` VALUES (230, 227, 300.00, 1000.00, 700.00, '2025-01-24 09:08:48', 131);
INSERT INTO `tb_pagamento_venda` VALUES (231, 228, 4000.00, 4000.00, 0.00, '2025-01-24 10:04:45', 131);
INSERT INTO `tb_pagamento_venda` VALUES (232, 229, 450.00, 450.00, 0.00, '2025-01-24 10:55:16', 131);
INSERT INTO `tb_pagamento_venda` VALUES (233, 230, 2000.00, 2450.00, 450.00, '2025-01-24 12:52:53', 131);
INSERT INTO `tb_pagamento_venda` VALUES (234, 230, 2000.00, 2450.00, 450.00, '2025-01-24 12:52:53', 131);
INSERT INTO `tb_pagamento_venda` VALUES (235, 230, 2000.00, 2450.00, 450.00, '2025-01-24 12:52:53', 131);
INSERT INTO `tb_pagamento_venda` VALUES (236, 230, 2000.00, 2450.00, 450.00, '2025-01-24 12:52:53', 131);
INSERT INTO `tb_pagamento_venda` VALUES (237, 231, 900.00, 5000.00, 4100.00, '2025-01-24 15:53:59', 131);
INSERT INTO `tb_pagamento_venda` VALUES (238, 232, 1800.00, 1800.00, 0.00, '2025-01-24 16:37:25', 131);
INSERT INTO `tb_pagamento_venda` VALUES (239, 232, 1800.00, 1800.00, 0.00, '2025-01-24 16:37:25', 131);
INSERT INTO `tb_pagamento_venda` VALUES (240, 233, 1500.00, 1500.00, 0.00, '2025-01-24 17:11:06', 131);
INSERT INTO `tb_pagamento_venda` VALUES (241, 234, 7500.00, 7500.00, 0.00, '2025-01-24 18:22:43', 129);
INSERT INTO `tb_pagamento_venda` VALUES (242, 234, 7500.00, 7500.00, 0.00, '2025-01-24 18:22:43', 129);
INSERT INTO `tb_pagamento_venda` VALUES (243, 235, 700.00, 8200.00, 7500.00, '2025-01-24 18:25:03', 129);
INSERT INTO `tb_pagamento_venda` VALUES (244, 236, 900.00, 8400.00, 7500.00, '2025-01-24 18:26:56', 129);
INSERT INTO `tb_pagamento_venda` VALUES (245, 237, 4900.00, 12400.00, 7500.00, '2025-01-24 18:30:13', 129);
INSERT INTO `tb_pagamento_venda` VALUES (246, 238, 200.00, 7700.00, 7500.00, '2025-01-24 18:34:33', 129);
INSERT INTO `tb_pagamento_venda` VALUES (247, 239, 150.00, 7650.00, 7500.00, '2025-01-24 18:35:46', 129);
INSERT INTO `tb_pagamento_venda` VALUES (248, 240, 200.00, 200.00, 0.00, '2025-01-24 18:52:29', 129);
INSERT INTO `tb_pagamento_venda` VALUES (249, 241, 1500.00, 1500.00, 0.00, '2025-01-24 19:04:22', 131);
INSERT INTO `tb_pagamento_venda` VALUES (250, 241, 1500.00, 1500.00, 0.00, '2025-01-24 19:04:22', 131);
INSERT INTO `tb_pagamento_venda` VALUES (251, 241, 1500.00, 1500.00, 0.00, '2025-01-24 19:04:22', 131);
INSERT INTO `tb_pagamento_venda` VALUES (252, 242, 3400.00, 3400.00, 0.00, '2025-01-24 19:11:50', 129);
INSERT INTO `tb_pagamento_venda` VALUES (253, 242, 3400.00, 3400.00, 0.00, '2025-01-24 19:11:50', 129);
INSERT INTO `tb_pagamento_venda` VALUES (254, 242, 3400.00, 3400.00, 0.00, '2025-01-24 19:11:50', 129);
INSERT INTO `tb_pagamento_venda` VALUES (255, 242, 3400.00, 3400.00, 0.00, '2025-01-24 19:11:50', 129);
INSERT INTO `tb_pagamento_venda` VALUES (256, 243, 450.00, 450.00, 0.00, '2025-01-24 19:20:34', 131);
INSERT INTO `tb_pagamento_venda` VALUES (257, 243, 450.00, 450.00, 0.00, '2025-01-24 19:20:34', 131);
INSERT INTO `tb_pagamento_venda` VALUES (258, 244, 2700.00, 2700.00, 0.00, '2025-01-24 19:25:21', 131);
INSERT INTO `tb_pagamento_venda` VALUES (259, 244, 2700.00, 2700.00, 0.00, '2025-01-24 19:25:21', 131);
INSERT INTO `tb_pagamento_venda` VALUES (260, 245, 1900.00, 1900.00, 0.00, '2025-01-24 19:28:35', 131);
INSERT INTO `tb_pagamento_venda` VALUES (261, 245, 1900.00, 1900.00, 0.00, '2025-01-24 19:28:35', 131);
INSERT INTO `tb_pagamento_venda` VALUES (262, 246, 1850.00, 2250.00, 400.00, '2025-01-24 20:10:46', 131);
INSERT INTO `tb_pagamento_venda` VALUES (263, 246, 1850.00, 2250.00, 400.00, '2025-01-24 20:10:46', 131);
INSERT INTO `tb_pagamento_venda` VALUES (264, 247, 3200.00, 3600.00, 400.00, '2025-01-24 20:21:34', 131);
INSERT INTO `tb_pagamento_venda` VALUES (265, 248, 150.00, 150.00, 0.00, '2025-01-24 21:20:32', 131);
INSERT INTO `tb_pagamento_venda` VALUES (266, 249, 50.00, 50.00, 0.00, '2025-01-24 21:23:26', 131);
INSERT INTO `tb_pagamento_venda` VALUES (267, 250, 1500.00, 1500.00, 0.00, '2025-01-25 06:27:48', 131);
INSERT INTO `tb_pagamento_venda` VALUES (268, 250, 1500.00, 1500.00, 0.00, '2025-01-25 06:27:48', 131);
INSERT INTO `tb_pagamento_venda` VALUES (269, 250, 1500.00, 1500.00, 0.00, '2025-01-25 06:27:48', 131);
INSERT INTO `tb_pagamento_venda` VALUES (270, 251, 500.00, 500.00, 0.00, '2025-01-25 07:11:45', 132);
INSERT INTO `tb_pagamento_venda` VALUES (271, 252, 1500.00, 6500.00, 5000.00, '2025-01-25 07:23:26', 132);
INSERT INTO `tb_pagamento_venda` VALUES (272, 252, 1500.00, 6500.00, 5000.00, '2025-01-25 07:23:26', 132);
INSERT INTO `tb_pagamento_venda` VALUES (273, 253, 700.00, 700.00, 0.00, '2025-01-25 07:30:08', 132);
INSERT INTO `tb_pagamento_venda` VALUES (274, 253, 700.00, 700.00, 0.00, '2025-01-25 07:30:08', 132);
INSERT INTO `tb_pagamento_venda` VALUES (275, 254, 500.00, 500.00, 0.00, '2025-01-25 07:32:25', 132);
INSERT INTO `tb_pagamento_venda` VALUES (276, 255, 1950.00, 1950.00, 0.00, '2025-01-25 08:41:29', 132);
INSERT INTO `tb_pagamento_venda` VALUES (277, 255, 1950.00, 1950.00, 0.00, '2025-01-25 08:41:29', 132);
INSERT INTO `tb_pagamento_venda` VALUES (278, 255, 1950.00, 1950.00, 0.00, '2025-01-25 08:41:29', 132);
INSERT INTO `tb_pagamento_venda` VALUES (279, 255, 1950.00, 1950.00, 0.00, '2025-01-25 08:41:29', 132);
INSERT INTO `tb_pagamento_venda` VALUES (280, 256, 550.00, 1950.00, 1400.00, '2025-01-25 09:06:57', 132);
INSERT INTO `tb_pagamento_venda` VALUES (281, 257, 550.00, 550.00, 0.00, '2025-01-25 09:14:11', 132);
INSERT INTO `tb_pagamento_venda` VALUES (282, 258, 1000.00, 1000.00, 0.00, '2025-01-25 09:26:49', 132);
INSERT INTO `tb_pagamento_venda` VALUES (283, 259, 500.00, 1000.00, 500.00, '2025-01-25 10:05:00', 132);
INSERT INTO `tb_pagamento_venda` VALUES (284, 260, 500.00, 500.00, 0.00, '2025-01-25 10:07:21', 132);
INSERT INTO `tb_pagamento_venda` VALUES (285, 261, 300.00, 300.00, 0.00, '2025-01-25 10:32:45', 132);
INSERT INTO `tb_pagamento_venda` VALUES (286, 262, 400.00, 400.00, 0.00, '2025-01-25 11:29:08', 132);
INSERT INTO `tb_pagamento_venda` VALUES (287, 263, 400.00, 400.00, 0.00, '2025-01-25 11:29:36', 132);
INSERT INTO `tb_pagamento_venda` VALUES (288, 264, 7750.00, 7750.00, 0.00, '2025-01-25 12:13:04', 132);
INSERT INTO `tb_pagamento_venda` VALUES (289, 264, 7750.00, 7750.00, 0.00, '2025-01-25 12:13:04', 132);
INSERT INTO `tb_pagamento_venda` VALUES (290, 264, 7750.00, 7750.00, 0.00, '2025-01-25 12:13:04', 132);
INSERT INTO `tb_pagamento_venda` VALUES (291, 265, 4000.00, 4000.00, 0.00, '2025-01-25 12:21:02', 132);
INSERT INTO `tb_pagamento_venda` VALUES (292, 266, 1000.00, 1000.00, 0.00, '2025-01-25 14:01:04', 132);
INSERT INTO `tb_pagamento_venda` VALUES (293, 266, 1000.00, 1000.00, 0.00, '2025-01-25 14:01:04', 132);
INSERT INTO `tb_pagamento_venda` VALUES (294, 266, 1000.00, 1000.00, 0.00, '2025-01-25 14:01:04', 132);
INSERT INTO `tb_pagamento_venda` VALUES (295, 267, 700.00, 700.00, 0.00, '2025-01-25 14:55:51', 132);
INSERT INTO `tb_pagamento_venda` VALUES (296, 267, 700.00, 700.00, 0.00, '2025-01-25 14:55:51', 132);
INSERT INTO `tb_pagamento_venda` VALUES (297, 268, 450.00, 450.00, 0.00, '2025-01-25 15:26:24', 132);
INSERT INTO `tb_pagamento_venda` VALUES (298, 269, 450.00, 450.00, 0.00, '2025-01-25 15:48:50', 132);
INSERT INTO `tb_pagamento_venda` VALUES (299, 270, 200.00, 200.00, 0.00, '2025-01-25 15:49:47', 132);
INSERT INTO `tb_pagamento_venda` VALUES (300, 271, 2000.00, 2000.00, 0.00, '2025-01-25 17:12:05', 132);
INSERT INTO `tb_pagamento_venda` VALUES (301, 271, 2000.00, 2000.00, 0.00, '2025-01-25 17:12:05', 132);
INSERT INTO `tb_pagamento_venda` VALUES (302, 271, 2000.00, 2000.00, 0.00, '2025-01-25 17:12:05', 132);
INSERT INTO `tb_pagamento_venda` VALUES (303, 271, 2000.00, 2000.00, 0.00, '2025-01-25 17:12:05', 132);
INSERT INTO `tb_pagamento_venda` VALUES (304, 272, 700.00, 2700.00, 2000.00, '2025-01-25 17:12:42', 132);
INSERT INTO `tb_pagamento_venda` VALUES (306, 274, 1600.00, 1600.00, 0.00, '2025-01-25 17:36:31', 132);
INSERT INTO `tb_pagamento_venda` VALUES (307, 274, 1600.00, 1600.00, 0.00, '2025-01-25 17:36:32', 132);
INSERT INTO `tb_pagamento_venda` VALUES (308, 274, 1600.00, 1600.00, 0.00, '2025-01-25 17:36:32', 132);
INSERT INTO `tb_pagamento_venda` VALUES (309, 274, 1600.00, 1600.00, 0.00, '2025-01-25 17:36:32', 132);
INSERT INTO `tb_pagamento_venda` VALUES (310, 275, 2550.00, 2550.00, 0.00, '2025-01-25 17:47:07', 132);
INSERT INTO `tb_pagamento_venda` VALUES (311, 275, 2550.00, 2550.00, 0.00, '2025-01-25 17:47:07', 132);
INSERT INTO `tb_pagamento_venda` VALUES (312, 275, 2550.00, 2550.00, 0.00, '2025-01-25 17:47:07', 132);
INSERT INTO `tb_pagamento_venda` VALUES (313, 276, 200.00, 200.00, 0.00, '2025-01-25 18:04:23', 101);
INSERT INTO `tb_pagamento_venda` VALUES (314, 277, 200.00, 400.00, 200.00, '2025-01-25 18:06:26', 101);
INSERT INTO `tb_pagamento_venda` VALUES (315, 278, 500.00, 500.00, 0.00, '2025-01-25 18:22:33', 101);
INSERT INTO `tb_pagamento_venda` VALUES (316, 279, 950.00, 950.00, 0.00, '2025-01-25 19:05:44', 101);
INSERT INTO `tb_pagamento_venda` VALUES (317, 279, 950.00, 950.00, 0.00, '2025-01-25 19:05:44', 101);
INSERT INTO `tb_pagamento_venda` VALUES (318, 279, 950.00, 950.00, 0.00, '2025-01-25 19:05:44', 101);
INSERT INTO `tb_pagamento_venda` VALUES (319, 279, 950.00, 950.00, 0.00, '2025-01-25 19:05:45', 101);
INSERT INTO `tb_pagamento_venda` VALUES (320, 280, 5950.00, 5950.00, 0.00, '2025-01-25 19:22:04', 101);
INSERT INTO `tb_pagamento_venda` VALUES (321, 280, 5950.00, 5950.00, 0.00, '2025-01-25 19:22:04', 101);
INSERT INTO `tb_pagamento_venda` VALUES (322, 280, 5950.00, 5950.00, 0.00, '2025-01-25 19:22:04', 101);
INSERT INTO `tb_pagamento_venda` VALUES (323, 281, 1500.00, 1500.00, 0.00, '2025-01-25 19:48:38', 132);
INSERT INTO `tb_pagamento_venda` VALUES (324, 281, 1500.00, 1500.00, 0.00, '2025-01-25 19:48:38', 132);
INSERT INTO `tb_pagamento_venda` VALUES (325, 282, 1200.00, 1200.00, 0.00, '2025-01-25 20:08:41', 132);
INSERT INTO `tb_pagamento_venda` VALUES (326, 282, 1200.00, 1200.00, 0.00, '2025-01-25 20:08:41', 132);
INSERT INTO `tb_pagamento_venda` VALUES (327, 283, 300.00, 300.00, 0.00, '2025-01-25 20:10:34', 132);
INSERT INTO `tb_pagamento_venda` VALUES (328, 284, 600.00, 600.00, 0.00, '2025-01-25 20:49:52', 132);
INSERT INTO `tb_pagamento_venda` VALUES (329, 285, 400.00, 400.00, 0.00, '2025-01-25 20:58:18', 132);
INSERT INTO `tb_pagamento_venda` VALUES (330, 286, 4250.00, 5000.00, 750.00, '2025-01-25 21:02:06', 132);
INSERT INTO `tb_pagamento_venda` VALUES (331, 287, 200.00, 200.00, 0.00, '2025-01-26 06:48:34', 0);
INSERT INTO `tb_pagamento_venda` VALUES (332, 288, 400.00, 400.00, 0.00, '2025-01-26 07:17:38', 0);
INSERT INTO `tb_pagamento_venda` VALUES (333, 289, 500.00, 500.00, 0.00, '2025-01-26 08:28:20', 0);
INSERT INTO `tb_pagamento_venda` VALUES (334, 290, 750.00, 1000.00, 250.00, '2025-01-26 08:53:15', 0);
INSERT INTO `tb_pagamento_venda` VALUES (335, 291, 350.00, 500.00, 150.00, '2025-01-26 09:02:26', 0);
INSERT INTO `tb_pagamento_venda` VALUES (336, 292, 150.00, 500.00, 350.00, '2025-01-26 09:06:41', 0);
INSERT INTO `tb_pagamento_venda` VALUES (337, 293, 700.00, 700.00, 0.00, '2025-01-26 09:44:43', 0);
INSERT INTO `tb_pagamento_venda` VALUES (338, 293, 700.00, 700.00, 0.00, '2025-01-26 09:44:43', 0);
INSERT INTO `tb_pagamento_venda` VALUES (339, 294, 550.00, 1000.00, 450.00, '2025-01-26 14:30:47', 130);
INSERT INTO `tb_pagamento_venda` VALUES (340, 294, 550.00, 1000.00, 450.00, '2025-01-26 14:30:47', 130);
INSERT INTO `tb_pagamento_venda` VALUES (341, 295, 49100.00, 500000.00, 450900.00, '2025-01-26 16:20:04', 129);
INSERT INTO `tb_pagamento_venda` VALUES (342, 295, 49100.00, 500000.00, 450900.00, '2025-01-26 16:20:04', 129);
INSERT INTO `tb_pagamento_venda` VALUES (343, 295, 49100.00, 500000.00, 450900.00, '2025-01-26 16:20:04', 129);
INSERT INTO `tb_pagamento_venda` VALUES (344, 295, 49100.00, 500000.00, 450900.00, '2025-01-26 16:20:04', 129);
INSERT INTO `tb_pagamento_venda` VALUES (345, 295, 49100.00, 500000.00, 450900.00, '2025-01-26 16:20:04', 129);
INSERT INTO `tb_pagamento_venda` VALUES (346, 295, 49100.00, 500000.00, 450900.00, '2025-01-26 16:20:04', 129);
INSERT INTO `tb_pagamento_venda` VALUES (347, 295, 49100.00, 500000.00, 450900.00, '2025-01-26 16:20:04', 129);
INSERT INTO `tb_pagamento_venda` VALUES (348, 295, 49100.00, 500000.00, 450900.00, '2025-01-26 16:20:04', 129);
INSERT INTO `tb_pagamento_venda` VALUES (349, 295, 49100.00, 500000.00, 450900.00, '2025-01-26 16:20:04', 129);
INSERT INTO `tb_pagamento_venda` VALUES (350, 295, 49100.00, 500000.00, 450900.00, '2025-01-26 16:20:04', 129);
INSERT INTO `tb_pagamento_venda` VALUES (351, 295, 49100.00, 500000.00, 450900.00, '2025-01-26 16:20:04', 129);
INSERT INTO `tb_pagamento_venda` VALUES (352, 295, 49100.00, 500000.00, 450900.00, '2025-01-26 16:20:04', 129);
INSERT INTO `tb_pagamento_venda` VALUES (353, 295, 49100.00, 500000.00, 450900.00, '2025-01-26 16:20:04', 129);
INSERT INTO `tb_pagamento_venda` VALUES (354, 295, 49100.00, 500000.00, 450900.00, '2025-01-26 16:20:04', 129);
INSERT INTO `tb_pagamento_venda` VALUES (355, 295, 49100.00, 500000.00, 450900.00, '2025-01-26 16:20:04', 129);
INSERT INTO `tb_pagamento_venda` VALUES (356, 295, 49100.00, 500000.00, 450900.00, '2025-01-26 16:20:04', 129);
INSERT INTO `tb_pagamento_venda` VALUES (357, 295, 49100.00, 500000.00, 450900.00, '2025-01-26 16:20:04', 129);
INSERT INTO `tb_pagamento_venda` VALUES (358, 295, 49100.00, 500000.00, 450900.00, '2025-01-26 16:20:04', 129);
INSERT INTO `tb_pagamento_venda` VALUES (359, 295, 49100.00, 500000.00, 450900.00, '2025-01-26 16:20:04', 129);
INSERT INTO `tb_pagamento_venda` VALUES (360, 295, 49100.00, 500000.00, 450900.00, '2025-01-26 16:20:04', 129);
INSERT INTO `tb_pagamento_venda` VALUES (361, 295, 49100.00, 500000.00, 450900.00, '2025-01-26 16:20:04', 129);
INSERT INTO `tb_pagamento_venda` VALUES (362, 295, 49100.00, 500000.00, 450900.00, '2025-01-26 16:20:04', 129);
INSERT INTO `tb_pagamento_venda` VALUES (363, 295, 49100.00, 500000.00, 450900.00, '2025-01-26 16:20:04', 129);
INSERT INTO `tb_pagamento_venda` VALUES (364, 295, 49100.00, 500000.00, 450900.00, '2025-01-26 16:20:04', 129);
INSERT INTO `tb_pagamento_venda` VALUES (365, 295, 49100.00, 500000.00, 450900.00, '2025-01-26 16:20:04', 129);
INSERT INTO `tb_pagamento_venda` VALUES (366, 295, 49100.00, 500000.00, 450900.00, '2025-01-26 16:20:04', 129);
INSERT INTO `tb_pagamento_venda` VALUES (367, 295, 49100.00, 500000.00, 450900.00, '2025-01-26 16:20:04', 129);
INSERT INTO `tb_pagamento_venda` VALUES (368, 295, 49100.00, 500000.00, 450900.00, '2025-01-26 16:20:04', 129);
INSERT INTO `tb_pagamento_venda` VALUES (369, 295, 49100.00, 500000.00, 450900.00, '2025-01-26 16:20:04', 129);
INSERT INTO `tb_pagamento_venda` VALUES (370, 295, 49100.00, 500000.00, 450900.00, '2025-01-26 16:20:04', 129);
INSERT INTO `tb_pagamento_venda` VALUES (371, 295, 49100.00, 500000.00, 450900.00, '2025-01-26 16:20:04', 129);
INSERT INTO `tb_pagamento_venda` VALUES (372, 295, 49100.00, 500000.00, 450900.00, '2025-01-26 16:20:04', 129);
INSERT INTO `tb_pagamento_venda` VALUES (373, 295, 49100.00, 500000.00, 450900.00, '2025-01-26 16:20:04', 129);
INSERT INTO `tb_pagamento_venda` VALUES (374, 295, 49100.00, 500000.00, 450900.00, '2025-01-26 16:20:04', 129);
INSERT INTO `tb_pagamento_venda` VALUES (375, 295, 49100.00, 500000.00, 450900.00, '2025-01-26 16:20:04', 129);
INSERT INTO `tb_pagamento_venda` VALUES (376, 295, 49100.00, 500000.00, 450900.00, '2025-01-26 16:20:04', 129);
INSERT INTO `tb_pagamento_venda` VALUES (377, 295, 49100.00, 500000.00, 450900.00, '2025-01-26 16:20:04', 129);
INSERT INTO `tb_pagamento_venda` VALUES (378, 295, 49100.00, 500000.00, 450900.00, '2025-01-26 16:20:04', 129);
INSERT INTO `tb_pagamento_venda` VALUES (379, 295, 49100.00, 500000.00, 450900.00, '2025-01-26 16:20:04', 129);
INSERT INTO `tb_pagamento_venda` VALUES (380, 295, 49100.00, 500000.00, 450900.00, '2025-01-26 16:20:04', 129);
INSERT INTO `tb_pagamento_venda` VALUES (381, 295, 49100.00, 500000.00, 450900.00, '2025-01-26 16:20:04', 129);
INSERT INTO `tb_pagamento_venda` VALUES (382, 295, 49100.00, 500000.00, 450900.00, '2025-01-26 16:20:04', 129);
INSERT INTO `tb_pagamento_venda` VALUES (383, 295, 49100.00, 500000.00, 450900.00, '2025-01-26 16:20:04', 129);
INSERT INTO `tb_pagamento_venda` VALUES (384, 295, 49100.00, 500000.00, 450900.00, '2025-01-26 16:20:04', 129);
INSERT INTO `tb_pagamento_venda` VALUES (385, 296, 61550.00, 700000.00, 638450.00, '2025-01-26 17:36:31', 129);
INSERT INTO `tb_pagamento_venda` VALUES (386, 296, 61550.00, 700000.00, 638450.00, '2025-01-26 17:36:31', 129);
INSERT INTO `tb_pagamento_venda` VALUES (387, 296, 61550.00, 700000.00, 638450.00, '2025-01-26 17:36:31', 129);
INSERT INTO `tb_pagamento_venda` VALUES (388, 296, 61550.00, 700000.00, 638450.00, '2025-01-26 17:36:31', 129);
INSERT INTO `tb_pagamento_venda` VALUES (389, 296, 61550.00, 700000.00, 638450.00, '2025-01-26 17:36:31', 129);
INSERT INTO `tb_pagamento_venda` VALUES (390, 296, 61550.00, 700000.00, 638450.00, '2025-01-26 17:36:31', 129);
INSERT INTO `tb_pagamento_venda` VALUES (391, 296, 61550.00, 700000.00, 638450.00, '2025-01-26 17:36:31', 129);
INSERT INTO `tb_pagamento_venda` VALUES (392, 296, 61550.00, 700000.00, 638450.00, '2025-01-26 17:36:31', 129);
INSERT INTO `tb_pagamento_venda` VALUES (393, 296, 61550.00, 700000.00, 638450.00, '2025-01-26 17:36:31', 129);
INSERT INTO `tb_pagamento_venda` VALUES (394, 296, 61550.00, 700000.00, 638450.00, '2025-01-26 17:36:31', 129);
INSERT INTO `tb_pagamento_venda` VALUES (395, 296, 61550.00, 700000.00, 638450.00, '2025-01-26 17:36:31', 129);
INSERT INTO `tb_pagamento_venda` VALUES (396, 296, 61550.00, 700000.00, 638450.00, '2025-01-26 17:36:31', 129);
INSERT INTO `tb_pagamento_venda` VALUES (397, 296, 61550.00, 700000.00, 638450.00, '2025-01-26 17:36:31', 129);
INSERT INTO `tb_pagamento_venda` VALUES (398, 296, 61550.00, 700000.00, 638450.00, '2025-01-26 17:36:31', 129);
INSERT INTO `tb_pagamento_venda` VALUES (399, 296, 61550.00, 700000.00, 638450.00, '2025-01-26 17:36:31', 129);
INSERT INTO `tb_pagamento_venda` VALUES (400, 296, 61550.00, 700000.00, 638450.00, '2025-01-26 17:36:31', 129);
INSERT INTO `tb_pagamento_venda` VALUES (401, 296, 61550.00, 700000.00, 638450.00, '2025-01-26 17:36:31', 129);
INSERT INTO `tb_pagamento_venda` VALUES (402, 296, 61550.00, 700000.00, 638450.00, '2025-01-26 17:36:31', 129);
INSERT INTO `tb_pagamento_venda` VALUES (403, 296, 61550.00, 700000.00, 638450.00, '2025-01-26 17:36:31', 129);
INSERT INTO `tb_pagamento_venda` VALUES (404, 296, 61550.00, 700000.00, 638450.00, '2025-01-26 17:36:31', 129);
INSERT INTO `tb_pagamento_venda` VALUES (405, 296, 61550.00, 700000.00, 638450.00, '2025-01-26 17:36:31', 129);
INSERT INTO `tb_pagamento_venda` VALUES (406, 296, 61550.00, 700000.00, 638450.00, '2025-01-26 17:36:32', 129);
INSERT INTO `tb_pagamento_venda` VALUES (407, 296, 61550.00, 700000.00, 638450.00, '2025-01-26 17:36:32', 129);
INSERT INTO `tb_pagamento_venda` VALUES (408, 296, 61550.00, 700000.00, 638450.00, '2025-01-26 17:36:32', 129);
INSERT INTO `tb_pagamento_venda` VALUES (409, 296, 61550.00, 700000.00, 638450.00, '2025-01-26 17:36:32', 129);
INSERT INTO `tb_pagamento_venda` VALUES (410, 296, 61550.00, 700000.00, 638450.00, '2025-01-26 17:36:32', 129);
INSERT INTO `tb_pagamento_venda` VALUES (411, 296, 61550.00, 700000.00, 638450.00, '2025-01-26 17:36:32', 129);
INSERT INTO `tb_pagamento_venda` VALUES (412, 296, 61550.00, 700000.00, 638450.00, '2025-01-26 17:36:32', 129);
INSERT INTO `tb_pagamento_venda` VALUES (413, 296, 61550.00, 700000.00, 638450.00, '2025-01-26 17:36:32', 129);
INSERT INTO `tb_pagamento_venda` VALUES (414, 296, 61550.00, 700000.00, 638450.00, '2025-01-26 17:36:32', 129);
INSERT INTO `tb_pagamento_venda` VALUES (415, 296, 61550.00, 700000.00, 638450.00, '2025-01-26 17:36:32', 129);
INSERT INTO `tb_pagamento_venda` VALUES (416, 296, 61550.00, 700000.00, 638450.00, '2025-01-26 17:36:32', 129);
INSERT INTO `tb_pagamento_venda` VALUES (417, 296, 61550.00, 700000.00, 638450.00, '2025-01-26 17:36:32', 129);
INSERT INTO `tb_pagamento_venda` VALUES (418, 296, 61550.00, 700000.00, 638450.00, '2025-01-26 17:36:32', 129);
INSERT INTO `tb_pagamento_venda` VALUES (419, 296, 61550.00, 700000.00, 638450.00, '2025-01-26 17:36:32', 129);
INSERT INTO `tb_pagamento_venda` VALUES (420, 296, 61550.00, 700000.00, 638450.00, '2025-01-26 17:36:32', 129);
INSERT INTO `tb_pagamento_venda` VALUES (421, 296, 61550.00, 700000.00, 638450.00, '2025-01-26 17:36:32', 129);
INSERT INTO `tb_pagamento_venda` VALUES (422, 296, 61550.00, 700000.00, 638450.00, '2025-01-26 17:36:32', 129);
INSERT INTO `tb_pagamento_venda` VALUES (423, 296, 61550.00, 700000.00, 638450.00, '2025-01-26 17:36:32', 129);
INSERT INTO `tb_pagamento_venda` VALUES (424, 296, 61550.00, 700000.00, 638450.00, '2025-01-26 17:36:32', 129);
INSERT INTO `tb_pagamento_venda` VALUES (425, 296, 61550.00, 700000.00, 638450.00, '2025-01-26 17:36:32', 129);
INSERT INTO `tb_pagamento_venda` VALUES (426, 296, 61550.00, 700000.00, 638450.00, '2025-01-26 17:36:32', 129);
INSERT INTO `tb_pagamento_venda` VALUES (427, 296, 61550.00, 700000.00, 638450.00, '2025-01-26 17:36:32', 129);
INSERT INTO `tb_pagamento_venda` VALUES (428, 296, 61550.00, 700000.00, 638450.00, '2025-01-26 17:36:32', 129);
INSERT INTO `tb_pagamento_venda` VALUES (429, 296, 61550.00, 700000.00, 638450.00, '2025-01-26 17:36:32', 129);
INSERT INTO `tb_pagamento_venda` VALUES (430, 296, 61550.00, 700000.00, 638450.00, '2025-01-26 17:36:32', 129);
INSERT INTO `tb_pagamento_venda` VALUES (431, 296, 61550.00, 700000.00, 638450.00, '2025-01-26 17:36:32', 129);
INSERT INTO `tb_pagamento_venda` VALUES (432, 296, 61550.00, 700000.00, 638450.00, '2025-01-26 17:36:32', 129);
INSERT INTO `tb_pagamento_venda` VALUES (433, 296, 61550.00, 700000.00, 638450.00, '2025-01-26 17:36:32', 129);
INSERT INTO `tb_pagamento_venda` VALUES (434, 296, 61550.00, 700000.00, 638450.00, '2025-01-26 17:36:32', 129);
INSERT INTO `tb_pagamento_venda` VALUES (435, 296, 61550.00, 700000.00, 638450.00, '2025-01-26 17:36:32', 129);
INSERT INTO `tb_pagamento_venda` VALUES (436, 296, 61550.00, 700000.00, 638450.00, '2025-01-26 17:36:32', 129);
INSERT INTO `tb_pagamento_venda` VALUES (437, 296, 61550.00, 700000.00, 638450.00, '2025-01-26 17:36:32', 129);
INSERT INTO `tb_pagamento_venda` VALUES (438, 296, 61550.00, 700000.00, 638450.00, '2025-01-26 17:36:32', 129);
INSERT INTO `tb_pagamento_venda` VALUES (439, 296, 61550.00, 700000.00, 638450.00, '2025-01-26 17:36:32', 129);
INSERT INTO `tb_pagamento_venda` VALUES (440, 296, 61550.00, 700000.00, 638450.00, '2025-01-26 17:36:32', 129);
INSERT INTO `tb_pagamento_venda` VALUES (441, 296, 61550.00, 700000.00, 638450.00, '2025-01-26 17:36:32', 129);
INSERT INTO `tb_pagamento_venda` VALUES (442, 296, 61550.00, 700000.00, 638450.00, '2025-01-26 17:36:32', 129);
INSERT INTO `tb_pagamento_venda` VALUES (443, 296, 61550.00, 700000.00, 638450.00, '2025-01-26 17:36:32', 129);
INSERT INTO `tb_pagamento_venda` VALUES (444, 296, 61550.00, 700000.00, 638450.00, '2025-01-26 17:36:32', 129);
INSERT INTO `tb_pagamento_venda` VALUES (445, 296, 61550.00, 700000.00, 638450.00, '2025-01-26 17:36:32', 129);
INSERT INTO `tb_pagamento_venda` VALUES (446, 296, 61550.00, 700000.00, 638450.00, '2025-01-26 17:36:32', 129);
INSERT INTO `tb_pagamento_venda` VALUES (447, 297, 300.00, 500.00, 200.00, '2025-01-26 17:38:03', 130);
INSERT INTO `tb_pagamento_venda` VALUES (448, 298, 400.00, 500.00, 100.00, '2025-01-26 17:56:02', 130);
INSERT INTO `tb_pagamento_venda` VALUES (449, 299, 300.00, 300.00, 0.00, '2025-01-26 18:00:22', 130);
INSERT INTO `tb_pagamento_venda` VALUES (450, 300, 1150.00, 1200.00, 50.00, '2025-01-26 18:04:48', 130);
INSERT INTO `tb_pagamento_venda` VALUES (451, 300, 1150.00, 1200.00, 50.00, '2025-01-26 18:04:48', 130);
INSERT INTO `tb_pagamento_venda` VALUES (455, 302, 500.00, 2000.00, 1500.00, '2025-01-26 18:29:47', 130);
INSERT INTO `tb_pagamento_venda` VALUES (456, 303, 700.00, 2000.00, 1300.00, '2025-01-26 18:37:50', 130);
INSERT INTO `tb_pagamento_venda` VALUES (462, 308, 300.00, 300.00, 0.00, '2025-01-27 16:46:31', 131);
INSERT INTO `tb_pagamento_venda` VALUES (463, 309, 3050.00, 5000.00, 1950.00, '2025-01-27 17:02:20', 131);
INSERT INTO `tb_pagamento_venda` VALUES (464, 309, 3050.00, 5000.00, 1950.00, '2025-01-27 17:02:20', 131);
INSERT INTO `tb_pagamento_venda` VALUES (465, 309, 3050.00, 5000.00, 1950.00, '2025-01-27 17:02:20', 131);
INSERT INTO `tb_pagamento_venda` VALUES (466, 309, 3050.00, 5000.00, 1950.00, '2025-01-27 17:02:20', 131);
INSERT INTO `tb_pagamento_venda` VALUES (467, 310, 350.00, 500.00, 150.00, '2025-01-27 17:10:25', 131);
INSERT INTO `tb_pagamento_venda` VALUES (468, 311, 1100.00, 5000.00, 3900.00, '2025-01-27 17:13:49', 131);
INSERT INTO `tb_pagamento_venda` VALUES (469, 312, 500.00, 500.00, 0.00, '2025-01-27 17:20:26', 131);
INSERT INTO `tb_pagamento_venda` VALUES (470, 313, 200.00, 200.00, 0.00, '2025-01-27 17:22:20', 131);
INSERT INTO `tb_pagamento_venda` VALUES (471, 314, 700.00, 700.00, 0.00, '2025-01-27 17:29:25', 131);
INSERT INTO `tb_pagamento_venda` VALUES (472, 314, 700.00, 700.00, 0.00, '2025-01-27 17:29:25', 131);
INSERT INTO `tb_pagamento_venda` VALUES (473, 315, 900.00, 900.00, 0.00, '2025-01-27 17:40:30', 131);
INSERT INTO `tb_pagamento_venda` VALUES (474, 316, 1550.00, 2000.00, 450.00, '2025-01-27 17:46:08', 131);
INSERT INTO `tb_pagamento_venda` VALUES (475, 317, 300.00, 500.00, 200.00, '2025-01-27 17:51:58', 131);
INSERT INTO `tb_pagamento_venda` VALUES (476, 318, 500.00, 500.00, 0.00, '2025-01-27 18:02:56', 131);
INSERT INTO `tb_pagamento_venda` VALUES (477, 319, 200.00, 200.00, 0.00, '2025-01-27 18:25:37', 131);
INSERT INTO `tb_pagamento_venda` VALUES (478, 320, 250.00, 2000.00, 1750.00, '2025-01-27 19:02:51', 131);
INSERT INTO `tb_pagamento_venda` VALUES (479, 321, 750.00, 750.00, 0.00, '2025-01-27 19:05:59', 131);
INSERT INTO `tb_pagamento_venda` VALUES (480, 322, 500.00, 1000.00, 500.00, '2025-01-27 19:11:39', 131);
INSERT INTO `tb_pagamento_venda` VALUES (481, 323, 1800.00, 1800.00, 0.00, '2025-01-27 19:49:28', 131);
INSERT INTO `tb_pagamento_venda` VALUES (482, 323, 1800.00, 1800.00, 0.00, '2025-01-27 19:49:28', 131);
INSERT INTO `tb_pagamento_venda` VALUES (483, 323, 1800.00, 1800.00, 0.00, '2025-01-27 19:49:28', 131);
INSERT INTO `tb_pagamento_venda` VALUES (484, 324, 200.00, 500.00, 300.00, '2025-01-27 19:50:57', 131);
INSERT INTO `tb_pagamento_venda` VALUES (485, 325, 400.00, 2000.00, 1600.00, '2025-01-28 12:16:27', 132);
INSERT INTO `tb_pagamento_venda` VALUES (486, 326, 500.00, 500.00, 0.00, '2025-01-28 12:54:43', 132);
INSERT INTO `tb_pagamento_venda` VALUES (487, 327, 5600.00, 5600.00, 0.00, '2025-01-28 14:09:46', 132);
INSERT INTO `tb_pagamento_venda` VALUES (488, 327, 5600.00, 5600.00, 0.00, '2025-01-28 14:09:46', 132);
INSERT INTO `tb_pagamento_venda` VALUES (489, 327, 5600.00, 5600.00, 0.00, '2025-01-28 14:09:46', 132);
INSERT INTO `tb_pagamento_venda` VALUES (490, 328, 400.00, 400.00, 0.00, '2025-01-28 14:10:29', 132);
INSERT INTO `tb_pagamento_venda` VALUES (491, 329, 500.00, 500.00, 0.00, '2025-01-28 17:03:58', 0);
INSERT INTO `tb_pagamento_venda` VALUES (492, 330, 400.00, 400.00, 0.00, '2025-01-28 17:04:44', 0);
INSERT INTO `tb_pagamento_venda` VALUES (493, 331, 200.00, 200.00, 0.00, '2025-01-28 17:13:05', 0);
INSERT INTO `tb_pagamento_venda` VALUES (494, 332, 150.00, 200.00, 50.00, '2025-01-28 18:47:50', 0);
INSERT INTO `tb_pagamento_venda` VALUES (495, 333, 350.00, 350.00, 0.00, '2025-01-28 19:02:51', 0);
INSERT INTO `tb_pagamento_venda` VALUES (499, 337, 700.00, 700.00, 0.00, '2025-01-28 19:24:42', 132);
INSERT INTO `tb_pagamento_venda` VALUES (501, 339, 1400.00, 2000.00, 600.00, '2025-01-29 06:38:18', 132);
INSERT INTO `tb_pagamento_venda` VALUES (502, 339, 1400.00, 2000.00, 600.00, '2025-01-29 06:38:18', 132);
INSERT INTO `tb_pagamento_venda` VALUES (503, 339, 1400.00, 2000.00, 600.00, '2025-01-29 06:38:18', 132);
INSERT INTO `tb_pagamento_venda` VALUES (504, 340, 3500.00, 5000.00, 1500.00, '2025-01-29 11:15:27', 0);
INSERT INTO `tb_pagamento_venda` VALUES (505, 340, 3500.00, 5000.00, 1500.00, '2025-01-29 11:15:27', 0);
INSERT INTO `tb_pagamento_venda` VALUES (506, 341, 3500.00, 5000.00, 1500.00, '2025-01-29 11:21:20', 130);
INSERT INTO `tb_pagamento_venda` VALUES (507, 341, 3500.00, 5000.00, 1500.00, '2025-01-29 11:21:20', 130);
INSERT INTO `tb_pagamento_venda` VALUES (508, 342, 500.00, 1000.00, 500.00, '2025-01-29 11:39:22', 129);
INSERT INTO `tb_pagamento_venda` VALUES (509, 343, 400.00, 1000.00, 600.00, '2025-01-29 11:58:54', 129);
INSERT INTO `tb_pagamento_venda` VALUES (510, 343, 400.00, 1000.00, 600.00, '2025-01-29 11:58:54', 129);
INSERT INTO `tb_pagamento_venda` VALUES (511, 344, 700.00, 2000.00, 1300.00, '2025-01-29 12:22:50', 129);
INSERT INTO `tb_pagamento_venda` VALUES (512, 345, 500.00, 5000.00, 4500.00, '2025-01-29 12:41:28', 129);
INSERT INTO `tb_pagamento_venda` VALUES (513, 346, 3250.00, 3250.00, 0.00, '2025-01-29 15:05:59', 129);
INSERT INTO `tb_pagamento_venda` VALUES (514, 346, 3250.00, 3250.00, 0.00, '2025-01-29 15:05:59', 129);
INSERT INTO `tb_pagamento_venda` VALUES (515, 346, 3250.00, 3250.00, 0.00, '2025-01-29 15:05:59', 129);
INSERT INTO `tb_pagamento_venda` VALUES (516, 346, 3250.00, 3250.00, 0.00, '2025-01-29 15:05:59', 129);
INSERT INTO `tb_pagamento_venda` VALUES (517, 346, 3250.00, 3250.00, 0.00, '2025-01-29 15:05:59', 129);
INSERT INTO `tb_pagamento_venda` VALUES (518, 346, 3250.00, 3250.00, 0.00, '2025-01-29 15:05:59', 129);
INSERT INTO `tb_pagamento_venda` VALUES (519, 346, 3250.00, 3250.00, 0.00, '2025-01-29 15:05:59', 129);
INSERT INTO `tb_pagamento_venda` VALUES (520, 347, 850.00, 5000.00, 4150.00, '2025-01-29 15:39:21', 129);
INSERT INTO `tb_pagamento_venda` VALUES (521, 347, 850.00, 5000.00, 4150.00, '2025-01-29 15:39:21', 129);
INSERT INTO `tb_pagamento_venda` VALUES (522, 347, 850.00, 5000.00, 4150.00, '2025-01-29 15:39:21', 129);
INSERT INTO `tb_pagamento_venda` VALUES (523, 347, 850.00, 5000.00, 4150.00, '2025-01-29 15:39:21', 129);
INSERT INTO `tb_pagamento_venda` VALUES (524, 348, 300.00, 1000.00, 700.00, '2025-01-29 17:38:50', 130);
INSERT INTO `tb_pagamento_venda` VALUES (525, 349, 400.00, 400.00, 0.00, '2025-01-29 17:52:56', 130);
INSERT INTO `tb_pagamento_venda` VALUES (526, 350, 1250.00, 1250.00, 0.00, '2025-01-29 18:09:14', 130);
INSERT INTO `tb_pagamento_venda` VALUES (527, 350, 1250.00, 1250.00, 0.00, '2025-01-29 18:09:14', 130);
INSERT INTO `tb_pagamento_venda` VALUES (528, 351, 450.00, 450.00, 0.00, '2025-01-29 18:10:17', 130);
INSERT INTO `tb_pagamento_venda` VALUES (529, 352, 1300.00, 1500.00, 200.00, '2025-01-30 07:25:25', 131);
INSERT INTO `tb_pagamento_venda` VALUES (530, 352, 1300.00, 1500.00, 200.00, '2025-01-30 07:25:25', 131);
INSERT INTO `tb_pagamento_venda` VALUES (531, 352, 1300.00, 1500.00, 200.00, '2025-01-30 07:25:25', 131);
INSERT INTO `tb_pagamento_venda` VALUES (532, 353, 200.00, 200.00, 0.00, '2025-01-30 07:44:25', 131);
INSERT INTO `tb_pagamento_venda` VALUES (533, 354, 1000.00, 5000.00, 4000.00, '2025-01-30 09:37:57', 131);
INSERT INTO `tb_pagamento_venda` VALUES (534, 354, 1000.00, 5000.00, 4000.00, '2025-01-30 09:37:57', 131);
INSERT INTO `tb_pagamento_venda` VALUES (535, 354, 1000.00, 5000.00, 4000.00, '2025-01-30 09:37:57', 131);
INSERT INTO `tb_pagamento_venda` VALUES (536, 355, 850.00, 1000.00, 150.00, '2025-01-30 11:26:10', 131);
INSERT INTO `tb_pagamento_venda` VALUES (537, 355, 850.00, 1000.00, 150.00, '2025-01-30 11:26:10', 131);
INSERT INTO `tb_pagamento_venda` VALUES (538, 356, 250.00, 250.00, 0.00, '2025-01-30 12:29:27', 131);
INSERT INTO `tb_pagamento_venda` VALUES (539, 357, 3200.00, 5000.00, 1800.00, '2025-01-30 13:06:11', 131);
INSERT INTO `tb_pagamento_venda` VALUES (540, 357, 3200.00, 5000.00, 1800.00, '2025-01-30 13:06:11', 131);
INSERT INTO `tb_pagamento_venda` VALUES (541, 357, 3200.00, 5000.00, 1800.00, '2025-01-30 13:06:12', 131);
INSERT INTO `tb_pagamento_venda` VALUES (542, 358, 450.00, 1000.00, 550.00, '2025-01-30 13:26:48', 131);
INSERT INTO `tb_pagamento_venda` VALUES (543, 359, 1050.00, 1500.00, 450.00, '2025-01-30 13:55:28', 101);
INSERT INTO `tb_pagamento_venda` VALUES (544, 359, 1050.00, 1500.00, 450.00, '2025-01-30 13:55:28', 101);
INSERT INTO `tb_pagamento_venda` VALUES (545, 360, 20200.00, 20500.00, 300.00, '2025-01-30 14:12:34', 129);
INSERT INTO `tb_pagamento_venda` VALUES (546, 360, 20200.00, 20500.00, 300.00, '2025-01-30 14:12:34', 129);
INSERT INTO `tb_pagamento_venda` VALUES (547, 360, 20200.00, 20500.00, 300.00, '2025-01-30 14:12:34', 129);
INSERT INTO `tb_pagamento_venda` VALUES (548, 360, 20200.00, 20500.00, 300.00, '2025-01-30 14:12:34', 129);
INSERT INTO `tb_pagamento_venda` VALUES (549, 360, 20200.00, 20500.00, 300.00, '2025-01-30 14:12:34', 129);
INSERT INTO `tb_pagamento_venda` VALUES (550, 360, 20200.00, 20500.00, 300.00, '2025-01-30 14:12:34', 129);
INSERT INTO `tb_pagamento_venda` VALUES (551, 360, 20200.00, 20500.00, 300.00, '2025-01-30 14:12:34', 129);
INSERT INTO `tb_pagamento_venda` VALUES (552, 360, 20200.00, 20500.00, 300.00, '2025-01-30 14:12:34', 129);
INSERT INTO `tb_pagamento_venda` VALUES (553, 360, 20200.00, 20500.00, 300.00, '2025-01-30 14:12:34', 129);
INSERT INTO `tb_pagamento_venda` VALUES (554, 360, 20200.00, 20500.00, 300.00, '2025-01-30 14:12:34', 129);
INSERT INTO `tb_pagamento_venda` VALUES (555, 360, 20200.00, 20500.00, 300.00, '2025-01-30 14:12:34', 129);
INSERT INTO `tb_pagamento_venda` VALUES (556, 360, 20200.00, 20500.00, 300.00, '2025-01-30 14:12:34', 129);
INSERT INTO `tb_pagamento_venda` VALUES (557, 360, 20200.00, 20500.00, 300.00, '2025-01-30 14:12:34', 129);
INSERT INTO `tb_pagamento_venda` VALUES (558, 360, 20200.00, 20500.00, 300.00, '2025-01-30 14:12:34', 129);
INSERT INTO `tb_pagamento_venda` VALUES (559, 360, 20200.00, 20500.00, 300.00, '2025-01-30 14:12:34', 129);
INSERT INTO `tb_pagamento_venda` VALUES (560, 360, 20200.00, 20500.00, 300.00, '2025-01-30 14:12:34', 129);
INSERT INTO `tb_pagamento_venda` VALUES (561, 360, 20200.00, 20500.00, 300.00, '2025-01-30 14:12:34', 129);
INSERT INTO `tb_pagamento_venda` VALUES (562, 360, 20200.00, 20500.00, 300.00, '2025-01-30 14:12:34', 129);
INSERT INTO `tb_pagamento_venda` VALUES (563, 360, 20200.00, 20500.00, 300.00, '2025-01-30 14:12:34', 129);
INSERT INTO `tb_pagamento_venda` VALUES (564, 360, 20200.00, 20500.00, 300.00, '2025-01-30 14:12:34', 129);
INSERT INTO `tb_pagamento_venda` VALUES (565, 360, 20200.00, 20500.00, 300.00, '2025-01-30 14:12:34', 129);
INSERT INTO `tb_pagamento_venda` VALUES (566, 360, 20200.00, 20500.00, 300.00, '2025-01-30 14:12:34', 129);
INSERT INTO `tb_pagamento_venda` VALUES (567, 361, 12100.00, 12300.00, 200.00, '2025-01-30 14:23:18', 129);
INSERT INTO `tb_pagamento_venda` VALUES (568, 361, 12100.00, 12300.00, 200.00, '2025-01-30 14:23:18', 129);
INSERT INTO `tb_pagamento_venda` VALUES (569, 361, 12100.00, 12300.00, 200.00, '2025-01-30 14:23:18', 129);
INSERT INTO `tb_pagamento_venda` VALUES (570, 361, 12100.00, 12300.00, 200.00, '2025-01-30 14:23:18', 129);
INSERT INTO `tb_pagamento_venda` VALUES (571, 361, 12100.00, 12300.00, 200.00, '2025-01-30 14:23:18', 129);
INSERT INTO `tb_pagamento_venda` VALUES (572, 361, 12100.00, 12300.00, 200.00, '2025-01-30 14:23:18', 129);
INSERT INTO `tb_pagamento_venda` VALUES (573, 361, 12100.00, 12300.00, 200.00, '2025-01-30 14:23:18', 129);
INSERT INTO `tb_pagamento_venda` VALUES (574, 361, 12100.00, 12300.00, 200.00, '2025-01-30 14:23:18', 129);
INSERT INTO `tb_pagamento_venda` VALUES (575, 361, 12100.00, 12300.00, 200.00, '2025-01-30 14:23:18', 129);
INSERT INTO `tb_pagamento_venda` VALUES (576, 361, 12100.00, 12300.00, 200.00, '2025-01-30 14:23:18', 129);
INSERT INTO `tb_pagamento_venda` VALUES (577, 361, 12100.00, 12300.00, 200.00, '2025-01-30 14:23:18', 129);
INSERT INTO `tb_pagamento_venda` VALUES (578, 361, 12100.00, 12300.00, 200.00, '2025-01-30 14:23:18', 129);
INSERT INTO `tb_pagamento_venda` VALUES (579, 361, 12100.00, 12300.00, 200.00, '2025-01-30 14:23:18', 129);
INSERT INTO `tb_pagamento_venda` VALUES (580, 361, 12100.00, 12300.00, 200.00, '2025-01-30 14:23:18', 129);
INSERT INTO `tb_pagamento_venda` VALUES (581, 361, 12100.00, 12300.00, 200.00, '2025-01-30 14:23:18', 129);
INSERT INTO `tb_pagamento_venda` VALUES (582, 361, 12100.00, 12300.00, 200.00, '2025-01-30 14:23:18', 129);
INSERT INTO `tb_pagamento_venda` VALUES (583, 361, 12100.00, 12300.00, 200.00, '2025-01-30 14:23:18', 129);
INSERT INTO `tb_pagamento_venda` VALUES (584, 361, 12100.00, 12300.00, 200.00, '2025-01-30 14:23:18', 129);
INSERT INTO `tb_pagamento_venda` VALUES (585, 361, 12100.00, 12300.00, 200.00, '2025-01-30 14:23:18', 129);
INSERT INTO `tb_pagamento_venda` VALUES (586, 361, 12100.00, 12300.00, 200.00, '2025-01-30 14:23:18', 129);
INSERT INTO `tb_pagamento_venda` VALUES (587, 361, 12100.00, 12300.00, 200.00, '2025-01-30 14:23:18', 129);
INSERT INTO `tb_pagamento_venda` VALUES (588, 361, 12100.00, 12300.00, 200.00, '2025-01-30 14:23:18', 129);
INSERT INTO `tb_pagamento_venda` VALUES (589, 362, 20600.00, 20600.00, 0.00, '2025-01-30 14:30:32', 129);
INSERT INTO `tb_pagamento_venda` VALUES (590, 362, 20600.00, 20600.00, 0.00, '2025-01-30 14:30:32', 129);
INSERT INTO `tb_pagamento_venda` VALUES (591, 362, 20600.00, 20600.00, 0.00, '2025-01-30 14:30:32', 129);
INSERT INTO `tb_pagamento_venda` VALUES (592, 362, 20600.00, 20600.00, 0.00, '2025-01-30 14:30:32', 129);
INSERT INTO `tb_pagamento_venda` VALUES (593, 362, 20600.00, 20600.00, 0.00, '2025-01-30 14:30:32', 129);
INSERT INTO `tb_pagamento_venda` VALUES (594, 362, 20600.00, 20600.00, 0.00, '2025-01-30 14:30:32', 129);
INSERT INTO `tb_pagamento_venda` VALUES (595, 362, 20600.00, 20600.00, 0.00, '2025-01-30 14:30:32', 129);
INSERT INTO `tb_pagamento_venda` VALUES (596, 362, 20600.00, 20600.00, 0.00, '2025-01-30 14:30:32', 129);
INSERT INTO `tb_pagamento_venda` VALUES (597, 362, 20600.00, 20600.00, 0.00, '2025-01-30 14:30:32', 129);
INSERT INTO `tb_pagamento_venda` VALUES (598, 362, 20600.00, 20600.00, 0.00, '2025-01-30 14:30:32', 129);
INSERT INTO `tb_pagamento_venda` VALUES (599, 362, 20600.00, 20600.00, 0.00, '2025-01-30 14:30:32', 129);
INSERT INTO `tb_pagamento_venda` VALUES (600, 362, 20600.00, 20600.00, 0.00, '2025-01-30 14:30:32', 129);
INSERT INTO `tb_pagamento_venda` VALUES (601, 362, 20600.00, 20600.00, 0.00, '2025-01-30 14:30:32', 129);
INSERT INTO `tb_pagamento_venda` VALUES (602, 362, 20600.00, 20600.00, 0.00, '2025-01-30 14:30:32', 129);
INSERT INTO `tb_pagamento_venda` VALUES (603, 362, 20600.00, 20600.00, 0.00, '2025-01-30 14:30:32', 129);
INSERT INTO `tb_pagamento_venda` VALUES (604, 362, 20600.00, 20600.00, 0.00, '2025-01-30 14:30:32', 129);
INSERT INTO `tb_pagamento_venda` VALUES (605, 362, 20600.00, 20600.00, 0.00, '2025-01-30 14:30:32', 129);
INSERT INTO `tb_pagamento_venda` VALUES (606, 362, 20600.00, 20600.00, 0.00, '2025-01-30 14:30:32', 129);
INSERT INTO `tb_pagamento_venda` VALUES (607, 362, 20600.00, 20600.00, 0.00, '2025-01-30 14:30:32', 129);
INSERT INTO `tb_pagamento_venda` VALUES (608, 362, 20600.00, 20600.00, 0.00, '2025-01-30 14:30:32', 129);
INSERT INTO `tb_pagamento_venda` VALUES (609, 362, 20600.00, 20600.00, 0.00, '2025-01-30 14:30:32', 129);
INSERT INTO `tb_pagamento_venda` VALUES (610, 362, 20600.00, 20600.00, 0.00, '2025-01-30 14:30:32', 129);
INSERT INTO `tb_pagamento_venda` VALUES (611, 362, 20600.00, 20600.00, 0.00, '2025-01-30 14:30:32', 129);
INSERT INTO `tb_pagamento_venda` VALUES (612, 363, 8800.00, 8800.00, 0.00, '2025-01-30 14:35:40', 129);
INSERT INTO `tb_pagamento_venda` VALUES (613, 363, 8800.00, 8800.00, 0.00, '2025-01-30 14:35:40', 129);
INSERT INTO `tb_pagamento_venda` VALUES (614, 363, 8800.00, 8800.00, 0.00, '2025-01-30 14:35:40', 129);
INSERT INTO `tb_pagamento_venda` VALUES (615, 363, 8800.00, 8800.00, 0.00, '2025-01-30 14:35:40', 129);
INSERT INTO `tb_pagamento_venda` VALUES (616, 363, 8800.00, 8800.00, 0.00, '2025-01-30 14:35:40', 129);
INSERT INTO `tb_pagamento_venda` VALUES (617, 363, 8800.00, 8800.00, 0.00, '2025-01-30 14:35:40', 129);
INSERT INTO `tb_pagamento_venda` VALUES (618, 363, 8800.00, 8800.00, 0.00, '2025-01-30 14:35:40', 129);
INSERT INTO `tb_pagamento_venda` VALUES (619, 363, 8800.00, 8800.00, 0.00, '2025-01-30 14:35:40', 129);
INSERT INTO `tb_pagamento_venda` VALUES (620, 363, 8800.00, 8800.00, 0.00, '2025-01-30 14:35:40', 129);
INSERT INTO `tb_pagamento_venda` VALUES (621, 363, 8800.00, 8800.00, 0.00, '2025-01-30 14:35:40', 129);
INSERT INTO `tb_pagamento_venda` VALUES (622, 363, 8800.00, 8800.00, 0.00, '2025-01-30 14:35:41', 129);
INSERT INTO `tb_pagamento_venda` VALUES (623, 363, 8800.00, 8800.00, 0.00, '2025-01-30 14:35:41', 129);
INSERT INTO `tb_pagamento_venda` VALUES (624, 363, 8800.00, 8800.00, 0.00, '2025-01-30 14:35:41', 129);
INSERT INTO `tb_pagamento_venda` VALUES (625, 364, 200.00, 200.00, 0.00, '2025-01-30 14:39:31', 131);
INSERT INTO `tb_pagamento_venda` VALUES (626, 365, 27700.00, 27700.00, 0.00, '2025-01-30 14:49:31', 129);
INSERT INTO `tb_pagamento_venda` VALUES (627, 365, 27700.00, 27700.00, 0.00, '2025-01-30 14:49:31', 129);
INSERT INTO `tb_pagamento_venda` VALUES (628, 365, 27700.00, 27700.00, 0.00, '2025-01-30 14:49:31', 129);
INSERT INTO `tb_pagamento_venda` VALUES (629, 365, 27700.00, 27700.00, 0.00, '2025-01-30 14:49:31', 129);
INSERT INTO `tb_pagamento_venda` VALUES (630, 365, 27700.00, 27700.00, 0.00, '2025-01-30 14:49:31', 129);
INSERT INTO `tb_pagamento_venda` VALUES (631, 365, 27700.00, 27700.00, 0.00, '2025-01-30 14:49:31', 129);
INSERT INTO `tb_pagamento_venda` VALUES (632, 365, 27700.00, 27700.00, 0.00, '2025-01-30 14:49:31', 129);
INSERT INTO `tb_pagamento_venda` VALUES (633, 365, 27700.00, 27700.00, 0.00, '2025-01-30 14:49:31', 129);
INSERT INTO `tb_pagamento_venda` VALUES (634, 365, 27700.00, 27700.00, 0.00, '2025-01-30 14:49:31', 129);
INSERT INTO `tb_pagamento_venda` VALUES (635, 365, 27700.00, 27700.00, 0.00, '2025-01-30 14:49:31', 129);
INSERT INTO `tb_pagamento_venda` VALUES (636, 365, 27700.00, 27700.00, 0.00, '2025-01-30 14:49:31', 129);
INSERT INTO `tb_pagamento_venda` VALUES (637, 365, 27700.00, 27700.00, 0.00, '2025-01-30 14:49:31', 129);
INSERT INTO `tb_pagamento_venda` VALUES (638, 365, 27700.00, 27700.00, 0.00, '2025-01-30 14:49:31', 129);
INSERT INTO `tb_pagamento_venda` VALUES (639, 365, 27700.00, 27700.00, 0.00, '2025-01-30 14:49:31', 129);
INSERT INTO `tb_pagamento_venda` VALUES (640, 365, 27700.00, 27700.00, 0.00, '2025-01-30 14:49:31', 129);
INSERT INTO `tb_pagamento_venda` VALUES (641, 365, 27700.00, 27700.00, 0.00, '2025-01-30 14:49:31', 129);
INSERT INTO `tb_pagamento_venda` VALUES (642, 365, 27700.00, 27700.00, 0.00, '2025-01-30 14:49:31', 129);
INSERT INTO `tb_pagamento_venda` VALUES (643, 365, 27700.00, 27700.00, 0.00, '2025-01-30 14:49:31', 129);
INSERT INTO `tb_pagamento_venda` VALUES (644, 365, 27700.00, 27700.00, 0.00, '2025-01-30 14:49:31', 129);
INSERT INTO `tb_pagamento_venda` VALUES (645, 365, 27700.00, 27700.00, 0.00, '2025-01-30 14:49:31', 129);
INSERT INTO `tb_pagamento_venda` VALUES (646, 365, 27700.00, 27700.00, 0.00, '2025-01-30 14:49:31', 129);
INSERT INTO `tb_pagamento_venda` VALUES (647, 365, 27700.00, 27700.00, 0.00, '2025-01-30 14:49:31', 129);
INSERT INTO `tb_pagamento_venda` VALUES (648, 365, 27700.00, 27700.00, 0.00, '2025-01-30 14:49:31', 129);
INSERT INTO `tb_pagamento_venda` VALUES (649, 365, 27700.00, 27700.00, 0.00, '2025-01-30 14:49:31', 129);
INSERT INTO `tb_pagamento_venda` VALUES (650, 365, 27700.00, 27700.00, 0.00, '2025-01-30 14:49:31', 129);
INSERT INTO `tb_pagamento_venda` VALUES (651, 366, 40000.00, 40000.00, 0.00, '2025-01-30 15:01:53', 129);
INSERT INTO `tb_pagamento_venda` VALUES (652, 366, 40000.00, 40000.00, 0.00, '2025-01-30 15:01:53', 129);
INSERT INTO `tb_pagamento_venda` VALUES (653, 366, 40000.00, 40000.00, 0.00, '2025-01-30 15:01:53', 129);
INSERT INTO `tb_pagamento_venda` VALUES (654, 366, 40000.00, 40000.00, 0.00, '2025-01-30 15:01:53', 129);
INSERT INTO `tb_pagamento_venda` VALUES (655, 366, 40000.00, 40000.00, 0.00, '2025-01-30 15:01:53', 129);
INSERT INTO `tb_pagamento_venda` VALUES (656, 366, 40000.00, 40000.00, 0.00, '2025-01-30 15:01:53', 129);
INSERT INTO `tb_pagamento_venda` VALUES (657, 366, 40000.00, 40000.00, 0.00, '2025-01-30 15:01:53', 129);
INSERT INTO `tb_pagamento_venda` VALUES (658, 366, 40000.00, 40000.00, 0.00, '2025-01-30 15:01:53', 129);
INSERT INTO `tb_pagamento_venda` VALUES (659, 366, 40000.00, 40000.00, 0.00, '2025-01-30 15:01:53', 129);
INSERT INTO `tb_pagamento_venda` VALUES (660, 366, 40000.00, 40000.00, 0.00, '2025-01-30 15:01:53', 129);
INSERT INTO `tb_pagamento_venda` VALUES (661, 366, 40000.00, 40000.00, 0.00, '2025-01-30 15:01:53', 129);
INSERT INTO `tb_pagamento_venda` VALUES (662, 366, 40000.00, 40000.00, 0.00, '2025-01-30 15:01:53', 129);
INSERT INTO `tb_pagamento_venda` VALUES (663, 366, 40000.00, 40000.00, 0.00, '2025-01-30 15:01:53', 129);
INSERT INTO `tb_pagamento_venda` VALUES (664, 366, 40000.00, 40000.00, 0.00, '2025-01-30 15:01:53', 129);
INSERT INTO `tb_pagamento_venda` VALUES (665, 366, 40000.00, 40000.00, 0.00, '2025-01-30 15:01:53', 129);
INSERT INTO `tb_pagamento_venda` VALUES (666, 366, 40000.00, 40000.00, 0.00, '2025-01-30 15:01:53', 129);
INSERT INTO `tb_pagamento_venda` VALUES (667, 366, 40000.00, 40000.00, 0.00, '2025-01-30 15:01:53', 129);
INSERT INTO `tb_pagamento_venda` VALUES (668, 366, 40000.00, 40000.00, 0.00, '2025-01-30 15:01:53', 129);
INSERT INTO `tb_pagamento_venda` VALUES (669, 366, 40000.00, 40000.00, 0.00, '2025-01-30 15:01:53', 129);
INSERT INTO `tb_pagamento_venda` VALUES (670, 366, 40000.00, 40000.00, 0.00, '2025-01-30 15:01:53', 129);
INSERT INTO `tb_pagamento_venda` VALUES (671, 366, 40000.00, 40000.00, 0.00, '2025-01-30 15:01:53', 129);
INSERT INTO `tb_pagamento_venda` VALUES (672, 366, 40000.00, 40000.00, 0.00, '2025-01-30 15:01:53', 129);
INSERT INTO `tb_pagamento_venda` VALUES (673, 366, 40000.00, 40000.00, 0.00, '2025-01-30 15:01:53', 129);
INSERT INTO `tb_pagamento_venda` VALUES (674, 366, 40000.00, 40000.00, 0.00, '2025-01-30 15:01:53', 129);
INSERT INTO `tb_pagamento_venda` VALUES (675, 366, 40000.00, 40000.00, 0.00, '2025-01-30 15:01:53', 129);
INSERT INTO `tb_pagamento_venda` VALUES (676, 366, 40000.00, 40000.00, 0.00, '2025-01-30 15:01:53', 129);
INSERT INTO `tb_pagamento_venda` VALUES (677, 366, 40000.00, 40000.00, 0.00, '2025-01-30 15:01:53', 129);
INSERT INTO `tb_pagamento_venda` VALUES (678, 366, 40000.00, 40000.00, 0.00, '2025-01-30 15:01:53', 129);
INSERT INTO `tb_pagamento_venda` VALUES (679, 366, 40000.00, 40000.00, 0.00, '2025-01-30 15:01:53', 129);
INSERT INTO `tb_pagamento_venda` VALUES (680, 366, 40000.00, 40000.00, 0.00, '2025-01-30 15:01:53', 129);
INSERT INTO `tb_pagamento_venda` VALUES (681, 366, 40000.00, 40000.00, 0.00, '2025-01-30 15:01:53', 129);
INSERT INTO `tb_pagamento_venda` VALUES (682, 366, 40000.00, 40000.00, 0.00, '2025-01-30 15:01:53', 129);
INSERT INTO `tb_pagamento_venda` VALUES (683, 366, 40000.00, 40000.00, 0.00, '2025-01-30 15:01:53', 129);
INSERT INTO `tb_pagamento_venda` VALUES (684, 366, 40000.00, 40000.00, 0.00, '2025-01-30 15:01:53', 129);
INSERT INTO `tb_pagamento_venda` VALUES (685, 366, 40000.00, 40000.00, 0.00, '2025-01-30 15:01:53', 129);
INSERT INTO `tb_pagamento_venda` VALUES (686, 367, 19700.00, 19700.00, 0.00, '2025-01-30 15:11:24', 129);
INSERT INTO `tb_pagamento_venda` VALUES (687, 367, 19700.00, 19700.00, 0.00, '2025-01-30 15:11:24', 129);
INSERT INTO `tb_pagamento_venda` VALUES (688, 367, 19700.00, 19700.00, 0.00, '2025-01-30 15:11:24', 129);
INSERT INTO `tb_pagamento_venda` VALUES (689, 367, 19700.00, 19700.00, 0.00, '2025-01-30 15:11:24', 129);
INSERT INTO `tb_pagamento_venda` VALUES (690, 367, 19700.00, 19700.00, 0.00, '2025-01-30 15:11:24', 129);
INSERT INTO `tb_pagamento_venda` VALUES (691, 367, 19700.00, 19700.00, 0.00, '2025-01-30 15:11:24', 129);
INSERT INTO `tb_pagamento_venda` VALUES (692, 367, 19700.00, 19700.00, 0.00, '2025-01-30 15:11:24', 129);
INSERT INTO `tb_pagamento_venda` VALUES (693, 367, 19700.00, 19700.00, 0.00, '2025-01-30 15:11:24', 129);
INSERT INTO `tb_pagamento_venda` VALUES (694, 367, 19700.00, 19700.00, 0.00, '2025-01-30 15:11:24', 129);
INSERT INTO `tb_pagamento_venda` VALUES (695, 367, 19700.00, 19700.00, 0.00, '2025-01-30 15:11:24', 129);
INSERT INTO `tb_pagamento_venda` VALUES (696, 367, 19700.00, 19700.00, 0.00, '2025-01-30 15:11:24', 129);
INSERT INTO `tb_pagamento_venda` VALUES (697, 367, 19700.00, 19700.00, 0.00, '2025-01-30 15:11:24', 129);
INSERT INTO `tb_pagamento_venda` VALUES (698, 367, 19700.00, 19700.00, 0.00, '2025-01-30 15:11:24', 129);
INSERT INTO `tb_pagamento_venda` VALUES (699, 367, 19700.00, 19700.00, 0.00, '2025-01-30 15:11:24', 129);
INSERT INTO `tb_pagamento_venda` VALUES (700, 367, 19700.00, 19700.00, 0.00, '2025-01-30 15:11:24', 129);
INSERT INTO `tb_pagamento_venda` VALUES (701, 367, 19700.00, 19700.00, 0.00, '2025-01-30 15:11:24', 129);
INSERT INTO `tb_pagamento_venda` VALUES (702, 367, 19700.00, 19700.00, 0.00, '2025-01-30 15:11:24', 129);
INSERT INTO `tb_pagamento_venda` VALUES (703, 367, 19700.00, 19700.00, 0.00, '2025-01-30 15:11:24', 129);
INSERT INTO `tb_pagamento_venda` VALUES (704, 368, 13800.00, 13800.00, 0.00, '2025-01-30 15:17:31', 129);
INSERT INTO `tb_pagamento_venda` VALUES (705, 368, 13800.00, 13800.00, 0.00, '2025-01-30 15:17:31', 129);
INSERT INTO `tb_pagamento_venda` VALUES (706, 368, 13800.00, 13800.00, 0.00, '2025-01-30 15:17:31', 129);
INSERT INTO `tb_pagamento_venda` VALUES (707, 368, 13800.00, 13800.00, 0.00, '2025-01-30 15:17:31', 129);
INSERT INTO `tb_pagamento_venda` VALUES (708, 368, 13800.00, 13800.00, 0.00, '2025-01-30 15:17:31', 129);
INSERT INTO `tb_pagamento_venda` VALUES (709, 368, 13800.00, 13800.00, 0.00, '2025-01-30 15:17:31', 129);
INSERT INTO `tb_pagamento_venda` VALUES (710, 368, 13800.00, 13800.00, 0.00, '2025-01-30 15:17:31', 129);
INSERT INTO `tb_pagamento_venda` VALUES (711, 368, 13800.00, 13800.00, 0.00, '2025-01-30 15:17:31', 129);
INSERT INTO `tb_pagamento_venda` VALUES (712, 368, 13800.00, 13800.00, 0.00, '2025-01-30 15:17:31', 129);
INSERT INTO `tb_pagamento_venda` VALUES (713, 368, 13800.00, 13800.00, 0.00, '2025-01-30 15:17:31', 129);
INSERT INTO `tb_pagamento_venda` VALUES (714, 368, 13800.00, 13800.00, 0.00, '2025-01-30 15:17:31', 129);
INSERT INTO `tb_pagamento_venda` VALUES (715, 368, 13800.00, 13800.00, 0.00, '2025-01-30 15:17:31', 129);
INSERT INTO `tb_pagamento_venda` VALUES (716, 368, 13800.00, 13800.00, 0.00, '2025-01-30 15:17:31', 129);
INSERT INTO `tb_pagamento_venda` VALUES (717, 368, 13800.00, 13800.00, 0.00, '2025-01-30 15:17:31', 129);
INSERT INTO `tb_pagamento_venda` VALUES (718, 368, 13800.00, 13800.00, 0.00, '2025-01-30 15:17:31', 129);
INSERT INTO `tb_pagamento_venda` VALUES (719, 368, 13800.00, 13800.00, 0.00, '2025-01-30 15:17:31', 129);
INSERT INTO `tb_pagamento_venda` VALUES (720, 368, 13800.00, 13800.00, 0.00, '2025-01-30 15:17:31', 129);
INSERT INTO `tb_pagamento_venda` VALUES (721, 368, 13800.00, 13800.00, 0.00, '2025-01-30 15:17:31', 129);
INSERT INTO `tb_pagamento_venda` VALUES (722, 368, 13800.00, 13800.00, 0.00, '2025-01-30 15:17:31', 129);
INSERT INTO `tb_pagamento_venda` VALUES (723, 369, 3350.00, 3500.00, 150.00, '2025-01-30 15:19:40', 129);
INSERT INTO `tb_pagamento_venda` VALUES (724, 369, 3350.00, 3500.00, 150.00, '2025-01-30 15:19:40', 129);
INSERT INTO `tb_pagamento_venda` VALUES (725, 369, 3350.00, 3500.00, 150.00, '2025-01-30 15:19:40', 129);
INSERT INTO `tb_pagamento_venda` VALUES (726, 369, 3350.00, 3500.00, 150.00, '2025-01-30 15:19:40', 129);
INSERT INTO `tb_pagamento_venda` VALUES (727, 369, 3350.00, 3500.00, 150.00, '2025-01-30 15:19:40', 129);
INSERT INTO `tb_pagamento_venda` VALUES (728, 369, 3350.00, 3500.00, 150.00, '2025-01-30 15:19:40', 129);
INSERT INTO `tb_pagamento_venda` VALUES (729, 369, 3350.00, 3500.00, 150.00, '2025-01-30 15:19:40', 129);
INSERT INTO `tb_pagamento_venda` VALUES (730, 369, 3350.00, 3500.00, 150.00, '2025-01-30 15:19:40', 129);
INSERT INTO `tb_pagamento_venda` VALUES (731, 369, 3350.00, 3500.00, 150.00, '2025-01-30 15:19:40', 129);
INSERT INTO `tb_pagamento_venda` VALUES (732, 370, 3200.00, 3200.00, 0.00, '2025-01-30 15:39:47', 131);
INSERT INTO `tb_pagamento_venda` VALUES (733, 370, 3200.00, 3200.00, 0.00, '2025-01-30 15:39:47', 131);
INSERT INTO `tb_pagamento_venda` VALUES (734, 370, 3200.00, 3200.00, 0.00, '2025-01-30 15:39:47', 131);
INSERT INTO `tb_pagamento_venda` VALUES (735, 370, 3200.00, 3200.00, 0.00, '2025-01-30 15:39:47', 131);
INSERT INTO `tb_pagamento_venda` VALUES (736, 371, 2700.00, 2700.00, 0.00, '2025-01-30 16:21:56', 131);
INSERT INTO `tb_pagamento_venda` VALUES (737, 371, 2700.00, 2700.00, 0.00, '2025-01-30 16:21:56', 131);
INSERT INTO `tb_pagamento_venda` VALUES (738, 372, 3350.00, 3350.00, 0.00, '2025-01-30 16:26:08', 131);
INSERT INTO `tb_pagamento_venda` VALUES (739, 372, 3350.00, 3350.00, 0.00, '2025-01-30 16:26:08', 131);
INSERT INTO `tb_pagamento_venda` VALUES (740, 373, 1900.00, 1900.00, 0.00, '2025-01-30 16:30:01', 131);
INSERT INTO `tb_pagamento_venda` VALUES (741, 373, 1900.00, 1900.00, 0.00, '2025-01-30 16:30:01', 131);
INSERT INTO `tb_pagamento_venda` VALUES (742, 374, 1000.00, 1000.00, 0.00, '2025-01-30 17:47:03', 131);
INSERT INTO `tb_pagamento_venda` VALUES (743, 375, 500.00, 500.00, 0.00, '2025-01-30 18:02:00', 131);
INSERT INTO `tb_pagamento_venda` VALUES (744, 376, 1550.00, 2000.00, 450.00, '2025-01-30 18:38:12', 131);
INSERT INTO `tb_pagamento_venda` VALUES (745, 376, 1550.00, 2000.00, 450.00, '2025-01-30 18:38:12', 131);
INSERT INTO `tb_pagamento_venda` VALUES (746, 376, 1550.00, 2000.00, 450.00, '2025-01-30 18:38:12', 131);
INSERT INTO `tb_pagamento_venda` VALUES (747, 377, 500.00, 500.00, 0.00, '2025-01-30 18:42:39', 131);
INSERT INTO `tb_pagamento_venda` VALUES (748, 378, 18000.00, 18000.00, 0.00, '2025-01-30 18:54:45', 131);
INSERT INTO `tb_pagamento_venda` VALUES (749, 378, 18000.00, 18000.00, 0.00, '2025-01-30 18:54:45', 131);
INSERT INTO `tb_pagamento_venda` VALUES (750, 378, 18000.00, 18000.00, 0.00, '2025-01-30 18:54:46', 131);
INSERT INTO `tb_pagamento_venda` VALUES (751, 379, 450.00, 450.00, 0.00, '2025-01-30 18:57:30', 131);
INSERT INTO `tb_pagamento_venda` VALUES (752, 380, 700.00, 5000.00, 4300.00, '2025-01-30 19:00:13', 131);
INSERT INTO `tb_pagamento_venda` VALUES (753, 381, 100.00, 100.00, 0.00, '2025-01-30 19:01:22', 131);
INSERT INTO `tb_pagamento_venda` VALUES (754, 382, 1350.00, 1350.00, 0.00, '2025-01-30 19:42:41', 131);
INSERT INTO `tb_pagamento_venda` VALUES (755, 383, 1000.00, 1000.00, 0.00, '2025-01-31 08:53:50', 132);
INSERT INTO `tb_pagamento_venda` VALUES (756, 383, 1000.00, 1000.00, 0.00, '2025-01-31 08:53:50', 132);
INSERT INTO `tb_pagamento_venda` VALUES (757, 384, 900.00, 900.00, 0.00, '2025-01-31 09:28:36', 132);
INSERT INTO `tb_pagamento_venda` VALUES (758, 384, 900.00, 900.00, 0.00, '2025-01-31 09:28:36', 132);
INSERT INTO `tb_pagamento_venda` VALUES (759, 385, 3000.00, 3000.00, 0.00, '2025-01-31 09:37:27', 132);
INSERT INTO `tb_pagamento_venda` VALUES (760, 385, 3000.00, 3000.00, 0.00, '2025-01-31 09:37:27', 132);
INSERT INTO `tb_pagamento_venda` VALUES (761, 385, 3000.00, 3000.00, 0.00, '2025-01-31 09:37:27', 132);
INSERT INTO `tb_pagamento_venda` VALUES (762, 386, 500.00, 500.00, 0.00, '2025-01-31 13:06:23', 132);
INSERT INTO `tb_pagamento_venda` VALUES (763, 386, 500.00, 500.00, 0.00, '2025-01-31 13:06:23', 132);
INSERT INTO `tb_pagamento_venda` VALUES (764, 387, 250.00, 500.00, 250.00, '2025-01-31 13:56:57', 132);
INSERT INTO `tb_pagamento_venda` VALUES (765, 388, 1650.00, 1700.00, 50.00, '2025-01-31 14:08:22', 129);
INSERT INTO `tb_pagamento_venda` VALUES (766, 388, 1650.00, 1700.00, 50.00, '2025-01-31 14:08:22', 129);
INSERT INTO `tb_pagamento_venda` VALUES (767, 388, 1650.00, 1700.00, 50.00, '2025-01-31 14:08:22', 129);
INSERT INTO `tb_pagamento_venda` VALUES (768, 388, 1650.00, 1700.00, 50.00, '2025-01-31 14:08:22', 129);
INSERT INTO `tb_pagamento_venda` VALUES (769, 389, 5400.00, 5500.00, 100.00, '2025-01-31 15:04:39', 132);
INSERT INTO `tb_pagamento_venda` VALUES (770, 389, 5400.00, 5500.00, 100.00, '2025-01-31 15:04:39', 132);
INSERT INTO `tb_pagamento_venda` VALUES (771, 390, 950.00, 950.00, 0.00, '2025-01-31 16:32:56', 132);
INSERT INTO `tb_pagamento_venda` VALUES (772, 390, 950.00, 950.00, 0.00, '2025-01-31 16:32:56', 132);
INSERT INTO `tb_pagamento_venda` VALUES (773, 391, 150.00, 1000.00, 850.00, '2025-01-31 16:48:22', 132);
INSERT INTO `tb_pagamento_venda` VALUES (774, 392, 2300.00, 2300.00, 0.00, '2025-01-31 17:24:51', 132);
INSERT INTO `tb_pagamento_venda` VALUES (775, 392, 2300.00, 2300.00, 0.00, '2025-01-31 17:24:51', 132);
INSERT INTO `tb_pagamento_venda` VALUES (776, 393, 500.00, 5000.00, 4500.00, '2025-01-31 17:25:29', 132);
INSERT INTO `tb_pagamento_venda` VALUES (777, 394, 900.00, 1000.00, 100.00, '2025-01-31 18:37:22', 132);
INSERT INTO `tb_pagamento_venda` VALUES (778, 394, 900.00, 1000.00, 100.00, '2025-01-31 18:37:22', 132);
INSERT INTO `tb_pagamento_venda` VALUES (779, 395, 550.00, 550.00, 0.00, '2025-01-31 18:42:54', 132);
INSERT INTO `tb_pagamento_venda` VALUES (780, 395, 550.00, 550.00, 0.00, '2025-01-31 18:42:54', 132);
INSERT INTO `tb_pagamento_venda` VALUES (781, 395, 550.00, 550.00, 0.00, '2025-01-31 18:42:54', 132);
INSERT INTO `tb_pagamento_venda` VALUES (782, 396, 1650.00, 1650.00, 0.00, '2025-01-31 18:47:46', 132);
INSERT INTO `tb_pagamento_venda` VALUES (783, 396, 1650.00, 1650.00, 0.00, '2025-01-31 18:47:46', 132);
INSERT INTO `tb_pagamento_venda` VALUES (784, 396, 1650.00, 1650.00, 0.00, '2025-01-31 18:47:46', 132);
INSERT INTO `tb_pagamento_venda` VALUES (785, 396, 1650.00, 1650.00, 0.00, '2025-01-31 18:47:46', 132);
INSERT INTO `tb_pagamento_venda` VALUES (786, 397, 500.00, 500.00, 0.00, '2025-01-31 18:59:06', 132);
INSERT INTO `tb_pagamento_venda` VALUES (787, 398, 1700.00, 2000.00, 300.00, '2025-01-31 20:44:38', 132);
INSERT INTO `tb_pagamento_venda` VALUES (788, 398, 1700.00, 2000.00, 300.00, '2025-01-31 20:44:38', 132);
INSERT INTO `tb_pagamento_venda` VALUES (789, 398, 1700.00, 2000.00, 300.00, '2025-01-31 20:44:38', 132);
INSERT INTO `tb_pagamento_venda` VALUES (790, 399, 1750.00, 2000.00, 250.00, '2025-02-01 07:17:51', 130);
INSERT INTO `tb_pagamento_venda` VALUES (791, 399, 1750.00, 2000.00, 250.00, '2025-02-01 07:17:51', 130);
INSERT INTO `tb_pagamento_venda` VALUES (792, 400, 700.00, 1000.00, 300.00, '2025-02-01 08:03:10', 130);
INSERT INTO `tb_pagamento_venda` VALUES (793, 401, 1000.00, 1000.00, 0.00, '2025-02-01 09:46:24', 130);
INSERT INTO `tb_pagamento_venda` VALUES (794, 402, 700.00, 1000.00, 300.00, '2025-02-01 10:05:54', 130);
INSERT INTO `tb_pagamento_venda` VALUES (795, 403, 200.00, 500.00, 300.00, '2025-02-01 11:22:49', 130);
INSERT INTO `tb_pagamento_venda` VALUES (796, 404, 500.00, 500.00, 0.00, '2025-02-01 13:17:07', 130);
INSERT INTO `tb_pagamento_venda` VALUES (797, 404, 500.00, 500.00, 0.00, '2025-02-01 13:17:07', 130);
INSERT INTO `tb_pagamento_venda` VALUES (798, 405, 200.00, 200.00, 0.00, '2025-02-01 13:18:33', 130);
INSERT INTO `tb_pagamento_venda` VALUES (799, 406, 2650.00, 2650.00, 0.00, '2025-02-01 13:48:29', 130);
INSERT INTO `tb_pagamento_venda` VALUES (800, 406, 2650.00, 2650.00, 0.00, '2025-02-01 13:48:29', 130);
INSERT INTO `tb_pagamento_venda` VALUES (801, 406, 2650.00, 2650.00, 0.00, '2025-02-01 13:48:29', 130);
INSERT INTO `tb_pagamento_venda` VALUES (802, 407, 600.00, 2000.00, 1400.00, '2025-02-01 14:13:32', 130);
INSERT INTO `tb_pagamento_venda` VALUES (803, 408, 350.00, 350.00, 0.00, '2025-02-01 15:21:37', 130);
INSERT INTO `tb_pagamento_venda` VALUES (804, 409, 1250.00, 1250.00, 0.00, '2025-02-01 16:58:26', 130);
INSERT INTO `tb_pagamento_venda` VALUES (805, 410, 250.00, 1000.00, 750.00, '2025-02-01 17:05:20', 130);

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
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

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
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

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
  `id_fabricante` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
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
  `bar_code` bigint NULL DEFAULT NULL,
  `data_compra` date NULL DEFAULT NULL,
  PRIMARY KEY (`id_produto`) USING BTREE,
  UNIQUE INDEX `Codigo de barra`(`bar_code` ASC) USING BTREE,
  INDEX `id_categoria`(`id_categoria` ASC) USING BTREE,
  CONSTRAINT `tb_produtos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `tb_categorias_produto` (`id_categoria`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 378 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_produtos
-- ----------------------------
INSERT INTO `tb_produtos` VALUES (12, 'Gravi-Naus', '1', 'para nauseas', 13, 'Comprimido', 92.00, 200.00, 24, 'Disponível', 7, '2022-05-05', '2025-04-04', '2025-01-10 21:16:56', '2025-01-27 15:26:19', 130, 1, NULL, 6, 6290360150895, NULL);
INSERT INTO `tb_produtos` VALUES (13, 'Ben-u-ron 500 mg', '2', 'analgesico antipiretico', 13, 'Comprimido', 1335.00, 2000.00, 2, 'Disponível', 8, '2024-01-11', '2027-11-11', '2025-01-10 21:25:09', '2025-01-30 18:01:45', 130, 1, NULL, 10, 3854585, NULL);
INSERT INTO `tb_produtos` VALUES (14, 'Betussin', '1', 'Tosse, dores no corpo, febre, congestão nasal, congestão no peito', 13, 'Comprimido', 1276.00, 2000.00, 2, 'Disponível', 4, '2024-02-01', '2027-01-30', '2025-01-10 21:30:44', '2025-01-30 15:17:31', 130, 2, NULL, 1, 8906117735953, NULL);
INSERT INTO `tb_produtos` VALUES (15, 'Scorvitex (Vitamina C) 100 ml', '1', 'imunidade das células', 13, 'Comprimido', 572.00, 850.00, 5, 'Disponível', 4, '2024-04-01', '2026-03-03', '2025-01-10 21:38:50', '2025-01-30 14:12:34', 130, 2, NULL, 1, 8906117736189, NULL);
INSERT INTO `tb_produtos` VALUES (16, 'Mycozema', '1', 'creme antibiótico dermatite', 13, 'Comprimido', 860.00, 1300.00, 10, 'Disponível', 9, '2024-01-05', '2028-01-04', '2025-01-13 14:19:45', '2025-01-26 20:30:49', 130, 4, NULL, 1, 904086400469, NULL);
INSERT INTO `tb_produtos` VALUES (17, 'Dolaren Plus', '1', 'analgésico', 13, 'Comprimido', 356.00, 550.00, 16, 'Disponível', 9, '2023-01-10', '2026-01-09', '2025-01-13 14:29:21', '2025-01-30 15:01:53', 130, 1, NULL, 1, 8900643325167, NULL);
INSERT INTO `tb_produtos` VALUES (18, 'Dolaren Rápido', '1', 'analgésico antipirético', 13, 'Comprimido', 252.00, 400.00, 11, 'Disponível', 9, '2023-01-05', '2026-01-04', '2025-01-13 14:33:53', '2025-01-31 18:37:22', 130, 1, NULL, 1, 8906043325150, NULL);
INSERT INTO `tb_produtos` VALUES (19, 'Mucoril xarope', '1', 'expectorante', 13, 'Comprimido', 1050.00, 1700.00, 8, 'Disponível', 9, '2024-01-03', '2027-01-02', '2025-01-13 14:38:25', '2025-01-26 19:55:26', 130, 2, NULL, 1, 5700, NULL);
INSERT INTO `tb_produtos` VALUES (20, 'Dolaren Plus Gel', '1', 'Balsamo', 13, 'Comprimido', 780.00, 1200.00, 7, 'Disponível', 9, '2023-01-04', '2026-01-03', '2025-01-13 14:41:43', '2025-01-30 15:01:53', 130, 4, NULL, 1, 8904086400810, NULL);
INSERT INTO `tb_produtos` VALUES (21, 'Dolaren Gel', '1', 'Balsamo', 13, 'Comprimido', 660.00, 1000.00, 9, 'Disponível', 9, '2023-01-04', '2026-01-09', '2025-01-13 14:44:07', '2025-01-27 15:26:00', 130, 4, NULL, 1, 8904086400803, NULL);
INSERT INTO `tb_produtos` VALUES (22, 'Simba Kof xarope', '1', 'Expectorante', 13, 'Comprimido', 860.00, 1300.00, 6, 'Disponível', 9, '2024-01-07', '2027-01-05', '2025-01-13 14:46:35', '2025-01-31 17:24:51', 130, 2, NULL, 1, 8906046110661, NULL);
INSERT INTO `tb_produtos` VALUES (23, 'Ibunal Forte', '1', 'anti enflamatorio analgésico', 13, 'Comprimido', 337.00, 550.00, 18, 'Disponível', 9, '2024-02-03', '2028-01-02', '2025-01-13 14:51:44', '2025-01-30 15:17:31', 130, 1, NULL, 1, 18904086402132, NULL);
INSERT INTO `tb_produtos` VALUES (24, 'Bronex criança', '1', 'Expectorante', 13, 'Comprimido', 450.00, 1000.00, 4, 'Disponível', 8, '2024-01-07', '2027-01-06', '2025-01-13 15:00:57', '2025-01-30 17:47:03', 130, 2, NULL, 1, 18904286615103, NULL);
INSERT INTO `tb_produtos` VALUES (25, 'Fluconazol 150mg', '1', 'antifugico', 13, 'Comprimido', 125.00, 300.00, 10, 'Disponível', 8, '2024-01-07', '2027-01-06', '2025-01-13 15:14:35', '2025-01-26 19:55:42', 130, 1, NULL, 1, 38904286620415, NULL);
INSERT INTO `tb_produtos` VALUES (26, 'Februx ibuprofeno', '1', 'analgésico', 13, 'Comprimido', 330.00, 700.00, 10, 'Disponível', 8, '2024-01-06', '2027-01-05', '2025-01-13 15:18:49', '2025-01-26 19:56:10', 130, 2, NULL, 1, 18904286601625, NULL);
INSERT INTO `tb_produtos` VALUES (27, 'C8 comprimido', '1', 'para fome', 13, 'Comprimido', 35.00, 200.00, 48, 'Disponível', 8, '2024-01-08', '2027-01-07', '2025-01-13 15:26:40', '2025-01-31 18:42:54', 130, 1, NULL, 1, 18904286622828, NULL);
INSERT INTO `tb_produtos` VALUES (28, 'Fasnext kit', '1', 'antifugico', 13, 'Comprimido', 890.00, 1800.00, 4, 'Disponível', 8, '2024-01-08', '2027-01-07', '2025-01-13 15:30:13', '2025-01-26 19:56:16', 130, 1, NULL, 1, 18904286626086, NULL);
INSERT INTO `tb_produtos` VALUES (29, 'Leite de Magnesio', '1', 'antiácido', 13, 'Comprimido', 590.00, 1200.00, 4, 'Disponível', 8, '2024-01-07', '2027-01-06', '2025-01-13 15:34:02', '2025-01-26 19:56:17', 130, 2, NULL, 1, 18904286608426, NULL);
INSERT INTO `tb_produtos` VALUES (30, 'Vitamina B6 comprimido', '1', 'para nauseas', 13, 'Comprimido', 95.00, 250.00, 29, 'Disponível', 8, '2024-01-06', '2027-01-05', '2025-01-13 15:38:50', '2025-01-26 19:56:18', 130, 1, NULL, 1, 1890486614922, NULL);
INSERT INTO `tb_produtos` VALUES (31, 'Vitamina c fervescente', '1', 'imunidade', 13, 'Comprimido', 1950.00, 3500.00, 2, 'Disponível', 8, '2024-01-07', '2027-01-06', '2025-01-13 15:43:42', '2025-01-26 19:56:19', 130, 1, NULL, 1, 18904286612560, NULL);
INSERT INTO `tb_produtos` VALUES (32, 'Vitamina c fervescente/zinco', '1', 'imunidade', 13, 'Comprimido', 1800.00, 3500.00, 1, 'Disponível', 8, '2024-01-07', '2027-01-06', '2025-01-13 15:46:35', '2025-01-26 19:56:20', 130, 1, NULL, 1, 18904286621166, NULL);
INSERT INTO `tb_produtos` VALUES (33, 'Vitamina B6 xarope', '1', 'náusea', 13, 'Comprimido', 340.00, 700.00, 5, 'Disponível', 8, '2024-01-06', '2027-01-05', '2025-01-13 15:52:58', '2025-01-26 19:56:21', 130, 2, NULL, 1, 18904286606590, NULL);
INSERT INTO `tb_produtos` VALUES (34, 'Ranitidina 150mg', '1', 'antiácido', 13, 'Comprimido', 135.00, 300.00, 10, 'Disponível', 8, '2023-01-12', '2026-01-11', '2025-01-13 15:56:54', '2025-01-26 19:56:22', 130, 1, NULL, 1, 18904286609324, NULL);
INSERT INTO `tb_produtos` VALUES (35, 'Ranitidina 300mg', '1', 'antiácido', 13, 'Comprimido', 240.00, 400.00, 10, 'Disponível', 8, '2023-01-09', '2026-01-08', '2025-01-13 16:00:15', '2025-01-26 19:56:26', 130, 1, NULL, 1, 18904286638584, NULL);
INSERT INTO `tb_produtos` VALUES (37, 'Bebe gel indiano', '1', 'laxante', 13, 'Comprimido', 396.00, 1000.00, 9, 'Disponível', 8, '2024-01-07', '2027-01-06', '2025-01-13 19:23:17', '2025-01-30 15:11:24', 130, 7, NULL, 1, 18904286636816, NULL);
INSERT INTO `tb_produtos` VALUES (38, 'sabonete de enxofre ', '1', 'Dérmica', 14, 'Comprimido', 600.00, 1100.00, 4, 'Disponível', 8, '2024-01-08', '2027-01-07', '2025-01-13 19:27:04', '2025-01-26 19:56:38', 130, 7, NULL, 1, 18904286610900, NULL);
INSERT INTO `tb_produtos` VALUES (39, 'sabonete de glicerina ', '1', 'dérmico', 14, 'Comprimido', 600.00, 1100.00, 2, 'Disponível', 8, '2024-01-08', '2027-01-07', '2025-01-13 19:35:21', '2025-01-27 17:13:49', 130, 7, NULL, 1, 18904286609799, NULL);
INSERT INTO `tb_produtos` VALUES (40, 'Água oxigenada', '2', 'uso externo', 14, 'Comprimido', 465.00, 850.00, 3, 'Disponível', 8, '2023-01-24', '2026-08-01', '2025-01-13 19:41:13', '2025-01-26 19:56:45', 130, 7, NULL, 1, 24048, NULL);
INSERT INTO `tb_produtos` VALUES (41, 'vaselina pura', '1', 'lubrificação', 14, 'Comprimido', 396.00, 700.00, 4, 'Disponível', 8, '2024-02-07', '2027-01-06', '2025-01-13 19:45:57', '2025-01-26 19:56:47', 130, 7, NULL, 1, 8904286622548, NULL);
INSERT INTO `tb_produtos` VALUES (42, 'Omeprazol 40mg', '1', 'antiácido', 13, 'Comprimido', 210.00, 350.00, 6, 'Disponível', 8, '2023-01-11', '2026-01-10', '2025-01-13 19:55:34', '2025-01-31 14:08:22', 130, 1, NULL, 1, 18904286639406, NULL);
INSERT INTO `tb_produtos` VALUES (43, 'Paracetamol 125mg xarope', '1', 'analgésico', 13, 'Comprimido', 310.00, 700.00, 5, 'Disponível', 8, '2024-01-07', '2027-01-06', '2025-01-13 19:58:11', '2025-01-26 19:56:55', 130, 2, NULL, 1, 18904286610245, NULL);
INSERT INTO `tb_produtos` VALUES (44, 'Paracetamol 250mg xarope indiano', '1', 'analgésico', 13, 'Comprimido', 360.00, 850.00, 1, 'Disponível', 8, '2024-01-07', '2027-01-06', '2025-01-13 20:00:04', '2025-01-30 18:38:12', 130, 2, NULL, 1, 18904286617619, NULL);
INSERT INTO `tb_produtos` VALUES (45, 'Trancozema', '1', 'DÉRMICA', 14, 'Comprimido', 435.00, 1000.00, 33, 'Disponível', 8, '2024-01-07', '2026-01-12', '2025-01-13 20:04:33', '2025-02-01 09:46:24', 130, 4, NULL, 1, 1008904182620198, NULL);
INSERT INTO `tb_produtos` VALUES (46, 'Trancozema Sabonete', '1', 'dérmica', 14, 'Comprimido', 500.00, 1000.00, 16, 'Disponível', 8, '2024-01-06', '2027-01-05', '2025-01-13 20:07:01', '2025-01-30 14:12:34', 130, 4, NULL, 1, 18904182620577, NULL);
INSERT INTO `tb_produtos` VALUES (47, 'Mamã tenho fome cp', '1', 'estimulante de apetite', 13, 'Comprimido', 150.00, 300.00, 27, 'Disponível', 8, '2023-05-01', '2026-11-11', '2025-01-13 20:11:00', '2025-02-01 13:17:06', 130, 1, NULL, 1, 8904182613510, NULL);
INSERT INTO `tb_produtos` VALUES (48, 'c4', '1', 'estimulante de apetite', 13, 'Comprimido', 40.00, 150.00, 46, 'Disponível', 5, '2022-01-09', '2025-01-08', '2025-01-13 20:26:02', '2025-01-31 18:42:54', 130, 1, NULL, 1, 18904182603426, NULL);
INSERT INTO `tb_produtos` VALUES (49, 'Dexacort cp', '1', 'ANTI Inflamatorio', 13, 'Comprimido', 60.00, 200.00, 45, 'Disponível', 5, '2024-01-07', '2027-01-06', '2025-01-13 20:36:52', '2025-01-29 15:39:21', 130, 1, NULL, 1, 18904182604171, NULL);
INSERT INTO `tb_produtos` VALUES (50, 'Mascara', '1', 'Proteção facial', 14, 'Comprimido', 32.00, 100.00, 77, 'Disponível', 8, '2024-03-03', '2029-02-02', '2025-01-16 19:20:08', '2025-01-31 08:53:50', 129, 7, NULL, 50, 18904286618944, NULL);
INSERT INTO `tb_produtos` VALUES (51, 'Dipirona', '1', 'Alivio da dor', 13, 'Comprimido', 180.00, 300.00, 47, 'Disponível', 8, '2024-08-08', '2024-07-07', '2025-01-16 19:26:56', '2025-01-30 14:23:18', 129, 6, NULL, 1, 18904286643212, NULL);
INSERT INTO `tb_produtos` VALUES (52, 'Yodafar', '2', 'Para gestante', 13, 'Comprimido', 5345.00, 8000.00, 2, 'Disponível', 8, '2024-01-01', '2027-11-11', '2025-01-16 19:48:38', '2025-01-26 19:57:36', 129, 1, NULL, 25, 84700066079, NULL);
INSERT INTO `tb_produtos` VALUES (53, 'Lauroderme', '2', 'Assadura', 14, 'Comprimido', 6965.00, 10500.00, 1, 'Disponível', 8, '2025-01-16', '2028-02-02', '2025-01-16 20:13:06', '2025-01-26 19:57:38', 129, 4, NULL, 1, 3395894, NULL);
INSERT INTO `tb_produtos` VALUES (54, 'Eritromecina', '1', 'Inflamação', 13, 'Comprimido', 450.00, 700.00, 10, 'Disponível', 8, '2023-02-02', '2026-01-01', '2025-01-16 20:19:00', '2025-01-26 19:57:41', 129, 1, NULL, 10, 18904286609652, NULL);
INSERT INTO `tb_produtos` VALUES (55, 'Azitromecina', '2', 'para infecção', 13, 'Comprimido', 1945.00, 2950.00, 1, 'Disponível', 8, '2025-01-16', '2026-04-04', '2025-01-16 20:24:20', '2025-01-26 19:58:18', 129, 1, NULL, 3, 10249405649829, NULL);
INSERT INTO `tb_produtos` VALUES (56, 'Amoxicilina 500mg', '2', 'antibiotico', 13, 'Comprimido', 572.00, 900.00, 7, 'Disponível', 8, '2025-01-16', '2025-09-09', '2025-01-16 20:29:45', '2025-01-30 18:54:45', 129, 1, NULL, 4, 5819008, NULL);
INSERT INTO `tb_produtos` VALUES (57, 'Triplexil', '2', 'alergia', 15, 'Comprimido', 3835.00, 5750.00, 1, 'Disponível', 8, '2025-01-16', '2027-08-08', '2025-01-16 20:33:23', '2025-01-30 14:49:31', 129, 4, NULL, 1, 5603690000838, NULL);
INSERT INTO `tb_produtos` VALUES (58, 'Penicilina 125mg', '1', 'infecção', 13, 'Comprimido', 540.00, 900.00, 5, 'Disponível', 8, '2024-01-01', '2026-12-12', '2025-01-16 20:37:33', '2025-01-26 19:58:46', 129, 2, NULL, 1, 18904286634258, NULL);
INSERT INTO `tb_produtos` VALUES (59, 'Penicilina250mg', '1', 'infecção', 13, 'Comprimido', 690.00, 1100.00, 5, 'Disponível', 8, '2024-03-03', '2027-02-02', '2025-01-16 20:39:55', '2025-01-26 19:58:51', 129, 2, NULL, 1, 18904288620787, NULL);
INSERT INTO `tb_produtos` VALUES (60, 'Amoxicilina e clavulânico', '1', 'infecção', 13, 'Comprimido', 775.00, 1200.00, 5, 'Disponível', 8, '2024-07-07', '2027-06-06', '2025-01-16 20:44:17', '2025-01-30 17:51:23', 129, 2, NULL, 1, 18904286608693, NULL);
INSERT INTO `tb_produtos` VALUES (61, 'Amoxicilina e clavulânico 250/62.5mg', '1', 'infec', 13, 'Comprimido', 1150.00, 1740.00, 5, 'Disponível', 8, '2024-07-07', '2027-06-06', '2025-01-16 20:47:02', '2025-01-30 17:51:33', 129, 2, NULL, 1, 18904286608686, NULL);
INSERT INTO `tb_produtos` VALUES (62, 'Ciprofloxacina 250mg', '1', 'febretifoide', 13, 'Comprimido', 675.00, 1300.00, 4, 'Disponível', 8, '2024-05-05', '2027-04-04', '2025-01-16 20:53:26', '2025-01-30 15:01:53', 129, 2, NULL, 1, 18804288609812, NULL);
INSERT INTO `tb_produtos` VALUES (63, 'Ambroxol 30mg', '1', 'para tosse', 13, 'Comprimido', 540.00, 900.00, 5, 'Disponível', 8, '2027-03-03', '2027-03-03', '2025-01-16 20:56:05', '2025-01-26 20:00:43', 129, 2, NULL, 1, 18904286612409, NULL);
INSERT INTO `tb_produtos` VALUES (64, 'Ambroxol 15mg', '1', 'tosse', 13, 'Comprimido', 475.00, 800.00, 5, 'Disponível', 8, '2024-07-07', '2027-06-06', '2025-01-16 20:58:48', '2025-01-26 20:00:46', 129, 2, NULL, 1, 18904286612416, NULL);
INSERT INTO `tb_produtos` VALUES (65, 'Clorofenamina 4mg', '1', 'Antialergico', 13, 'Comprimido', 35.00, 100.00, 30, 'Disponível', 8, '2024-04-04', '2027-03-03', '2025-01-16 21:02:31', '2025-01-26 20:00:55', 129, 1, NULL, 10, 18984288606318, NULL);
INSERT INTO `tb_produtos` VALUES (66, 'Buscopan 10mg', '1', 'Dor de barriga', 13, 'Comprimido', 416.00, 700.00, 6, 'Disponível', 8, '2024-02-02', '2027-01-01', '2025-01-16 21:11:18', '2025-01-26 20:00:57', 129, 1, NULL, 10, 18904286600758, NULL);
INSERT INTO `tb_produtos` VALUES (67, 'Buscopan 10+500mg', '1', 'dor', 13, 'Comprimido', 441.00, 700.00, 5, 'Disponível', 8, '2024-02-02', '2027-02-02', '2025-01-16 21:15:40', '2025-01-26 20:00:58', 129, 1, NULL, 10, 18904286632001, NULL);
INSERT INTO `tb_produtos` VALUES (68, 'Cefalexina 500mg', '1', 'para infecção', 13, 'Comprimido', 580.00, 900.00, 5, 'Disponível', 8, '2024-01-01', '2027-01-01', '2025-01-16 21:19:24', '2025-01-30 15:39:47', 129, 1, NULL, 10, 7987378882289, NULL);
INSERT INTO `tb_produtos` VALUES (69, 'Bissacodil 5mg', '1', 'Rexante', 13, 'Comprimido', 59.00, 100.00, 30, 'Disponível', 8, '2023-07-07', '2026-06-06', '2025-01-16 21:23:24', '2025-01-26 20:01:00', 129, 1, NULL, 10, 6290360152073, NULL);
INSERT INTO `tb_produtos` VALUES (70, 'Betadine Vaginal (Vaginext)', '1', 'lavagem intima', 14, 'Comprimido', 2700.00, 4500.00, 3, 'Disponível', 8, '2024-07-07', '2027-06-06', '2025-01-16 21:27:58', '2025-01-26 20:01:01', 129, 7, NULL, 1, 18904286621234, NULL);
INSERT INTO `tb_produtos` VALUES (71, 'Clotrimazol ovulos Vaginal bp100mg', '1', 'antibiotico', 14, 'Comprimido', 320.00, 500.00, 10, 'Disponível', 8, '2024-07-07', '2027-06-06', '2025-01-16 21:32:30', '2025-01-26 20:01:02', 129, 7, NULL, 1, 18904286612034, NULL);
INSERT INTO `tb_produtos` VALUES (72, 'Metronidazol vaginal óvulos 500mg', '1', 'Óvulos', 14, 'Comprimido', 370.00, 600.00, 10, 'Disponível', 8, '2024-04-04', '2027-03-03', '2025-01-16 21:36:02', '2025-01-26 20:01:10', 129, 7, NULL, 1, 18904286610542, NULL);
INSERT INTO `tb_produtos` VALUES (73, 'Óvulos vaginais', '', 'Óvulos', 14, 'Comprimido', 590.00, 900.00, 10, 'Disponível', 8, '0024-05-05', '2027-04-04', '2025-01-16 21:38:49', '2025-01-16 20:38:49', 129, 7, NULL, 1, 18904288606675, NULL);
INSERT INTO `tb_produtos` VALUES (74, 'Luvas', '1', 'protecção', 25, 'Comprimido', 35.00, 200.00, 198, 'Disponível', 4, '2024-10-16', '2029-10-15', '2025-01-16 21:48:42', '2025-01-30 15:39:47', 129, 7, NULL, 1, 212030486, NULL);
INSERT INTO `tb_produtos` VALUES (76, 'Cotrimoxazol 480mg', '', 'antibiotico', 13, 'Comprimido', 299.00, 450.00, 244, 'Disponível', 8, '2024-09-09', '2026-08-08', '2025-01-16 22:05:46', '2025-01-31 09:37:27', 129, 1, NULL, 10, 6290360153971, NULL);
INSERT INTO `tb_produtos` VALUES (77, 'Cloridrato de pseudoefedrina+cloridrato de triprolidina', '', 'antibiotico', 13, 'Comprimido', 2700.00, 4000.00, 1, 'Disponível', 8, '2025-01-16', '2027-02-02', '2025-01-16 22:08:35', '2025-01-16 21:08:35', 129, 2, NULL, 1, 8559104, NULL);
INSERT INTO `tb_produtos` VALUES (78, 'Metocloramida', '', 'antibiotico', 13, 'Comprimido', 62.00, 150.00, 100, 'Disponível', 8, '2023-09-09', '2026-08-08', '2025-01-16 22:11:48', '2025-01-16 21:11:48', 129, 1, NULL, 10, 62900360154084, NULL);
INSERT INTO `tb_produtos` VALUES (79, 'Azitromicina 500mg', '', 'infecção', 13, 'Comprimido', 620.00, 950.00, 7, 'Disponível', 8, '2024-05-05', '0026-02-04', '2025-01-16 22:15:29', '2025-01-30 15:11:24', 129, 1, NULL, 3, 26290360151285, NULL);
INSERT INTO `tb_produtos` VALUES (80, 'Óvulos metronidazol 500mg', '', 'Óvulos', 14, 'Comprimido', 6400.00, 9500.00, 1, 'Disponível', 8, '2028-01-16', '2028-04-04', '2025-01-16 22:19:20', '2025-01-16 21:19:20', 129, 7, NULL, 1, 9267401, NULL);
INSERT INTO `tb_produtos` VALUES (81, 'Penicilina injetavel 2.4mega', '', 'infecção', 13, 'Comprimido', 268.00, 400.00, 24, 'Disponível', 8, '2024-06-06', '2027-05-05', '2025-01-16 22:23:50', '2025-01-30 14:49:31', 129, 6, NULL, 1, 8907821106923, NULL);
INSERT INTO `tb_produtos` VALUES (82, 'Salbumol 2mg', '', 'Tosse', 13, 'Comprimido', 65.00, 150.00, 498, 'Disponível', 8, '2023-10-10', '2026-09-09', '2025-01-17 08:59:27', '2025-01-25 17:36:32', 129, 1, NULL, 10, 6290360154299, NULL);
INSERT INTO `tb_produtos` VALUES (83, 'Salbumol 4mg', '', 'Tosse', 13, 'Comprimido', 80.00, 150.00, 499, 'Disponível', 8, '2024-07-01', '2027-06-01', '2025-01-17 09:13:31', '2025-01-31 16:48:22', 129, 1, NULL, 10, 6290360154305, NULL);
INSERT INTO `tb_produtos` VALUES (84, 'Vitamina C Injetavel 500mg', '', 'antibiotico', 13, 'Comprimido', 69.00, 150.00, 100, 'Disponível', 8, '2024-06-01', '2027-05-01', '2025-01-17 09:18:11', '2025-01-17 08:18:11', 129, 6, NULL, 1, 8904232737951, NULL);
INSERT INTO `tb_produtos` VALUES (85, 'Ampicilina Injetavel 1gram', '', 'antibiotico', 13, 'Comprimido', 240.00, 400.00, 50, 'Disponível', 8, '2024-03-01', '2027-02-01', '2025-01-17 09:21:42', '2025-01-17 08:21:42', 129, 6, NULL, 1, 8904206224623, NULL);
INSERT INTO `tb_produtos` VALUES (86, 'Amoxicilina injetavel 1g', '', 'antibiotico', 13, 'Comprimido', 220.00, 350.00, 36, 'Disponível', 8, '2024-06-01', '2027-05-01', '2025-01-17 09:25:01', '2025-01-30 17:51:45', 129, 6, NULL, 1, 8904206224616, NULL);
INSERT INTO `tb_produtos` VALUES (87, 'Fortifed procaina penicilina injetavel 1mega', '', 'antibiotico', 13, 'Comprimido', 220.00, 350.00, 50, 'Disponível', 8, '2023-03-01', '2026-08-01', '2025-01-17 09:28:04', '2025-01-17 08:28:04', 129, 6, NULL, 1, 89042327373954, NULL);
INSERT INTO `tb_produtos` VALUES (88, 'Ciproheptadina com multivitamina 20 cl', '', 'vitamina', 13, 'Comprimido', 1100.00, 1650.00, 4, 'Disponível', 5, '2024-03-03', '2026-05-01', '2025-01-17 09:52:24', '2025-01-30 16:30:01', 129, 2, NULL, 1, 22222222222, NULL);
INSERT INTO `tb_produtos` VALUES (89, 'ciproheptadina BP 4mg', '', 'multivitana', 13, 'Comprimido', 133.00, 200.00, 15, 'Disponível', 5, '2022-09-01', '2025-08-01', '2025-01-17 10:19:21', '2025-01-26 20:03:08', 129, 1, NULL, 10, 18904182604426, NULL);
INSERT INTO `tb_produtos` VALUES (91, 'Dexametazona 0,5mg', '', 'multivitana', 13, 'Comprimido', 60.00, 150.00, 50, 'Disponível', 5, '2024-07-01', '2027-06-01', '2025-01-17 10:26:22', '2025-01-26 20:03:14', 129, 1, NULL, 10, 3333333333, NULL);
INSERT INTO `tb_produtos` VALUES (92, 'Multivitamina', '', 'multivitana', 13, 'Comprimido', 60.00, 200.00, 39, 'Disponível', 5, '2024-04-01', '2027-03-01', '2025-01-17 10:30:34', '2025-01-30 15:19:40', 129, 1, NULL, 10, 8904232761383, NULL);
INSERT INTO `tb_produtos` VALUES (93, 'Trancozema 30g', '', 'tirar manchas', 15, 'Comprimido', 416.00, 700.00, 24, 'Disponível', 5, '2024-07-01', '2026-12-01', '2025-01-17 10:41:27', '2025-01-17 09:41:27', 129, 4, NULL, 1, 8904182620198, NULL);
INSERT INTO `tb_produtos` VALUES (94, 'Vitamina C 500mg', '', 'vitamina', 13, 'Comprimido', 199.00, 350.00, 73, 'Disponível', 7, '2024-07-01', '2027-06-01', '2025-01-17 10:59:31', '2025-01-31 14:08:22', 129, 1, NULL, 10, 8904232760362, NULL);
INSERT INTO `tb_produtos` VALUES (95, 'Clorafenicol 250mg', '', 'antibiotico', 13, 'Comprimido', 175.00, 400.00, 91, 'Disponível', 7, '2024-06-01', '2027-05-01', '2025-01-17 11:03:57', '2025-01-30 15:01:53', 129, 3, NULL, 10, 6290360154565, NULL);
INSERT INTO `tb_produtos` VALUES (96, 'Iodopovidona 10%', '', 'limpeza feridas', 18, 'Comprimido', 879.00, 1350.00, 1, 'Disponível', 7, '2025-01-17', '2027-06-01', '2025-01-17 11:09:19', '2025-02-01 13:48:29', 129, 7, NULL, 1, 5600341000452, NULL);
INSERT INTO `tb_produtos` VALUES (97, 'Acido folico 5mg', '', 'gravidas', 13, 'Comprimido', 52.00, 200.00, 85, 'Disponível', 7, '2024-06-01', '2027-05-01', '2025-01-17 11:27:48', '2025-01-31 09:37:27', 129, 1, NULL, 10, 6290360152134, NULL);
INSERT INTO `tb_produtos` VALUES (98, 'Adesivo', '', 'cobrir ferimentos', 14, 'Comprimido', 345.00, 700.00, 10, 'Disponível', 7, '2024-06-01', '2029-05-01', '2025-01-17 11:30:29', '2025-01-26 17:36:31', 129, 7, NULL, 1, 8904206238804, NULL);
INSERT INTO `tb_produtos` VALUES (99, 'Álcool 70%', '', 'desinfetação', 14, 'Comprimido', 500.00, 900.00, 3, 'Disponível', 7, '2024-12-01', '2027-11-01', '2025-01-17 11:36:52', '2025-01-30 14:30:32', 129, 7, NULL, 1, 8904206223756, NULL);
INSERT INTO `tb_produtos` VALUES (100, 'Alivio 100ml', '', 'tosse', 13, 'Comprimido', 370.00, 700.00, 10, 'Disponível', 7, '2024-02-01', '2027-01-01', '2025-01-17 11:56:35', '2025-01-17 10:56:35', 129, 2, NULL, 1, 6290360150444, NULL);
INSERT INTO `tb_produtos` VALUES (101, 'Amoxicilina 125mg', '', 'antibiotico', 13, 'Comprimido', 495.00, 800.00, 10, 'Disponível', 7, '2024-02-01', '2026-01-01', '2025-01-17 12:00:25', '2025-01-30 17:51:48', 129, 2, NULL, 1, 6290360151397, NULL);
INSERT INTO `tb_produtos` VALUES (102, 'Amoxicilina 250mg', '', 'antibiotico', 13, 'Comprimido', 510.00, 850.00, 5, 'Disponível', 7, '2024-03-01', '2026-02-01', '2025-01-17 12:03:53', '2025-01-30 17:51:49', 129, 2, NULL, 1, 6290360151403, NULL);
INSERT INTO `tb_produtos` VALUES (103, 'Suporte de cotovelo', '', 'suporte', 21, 'Comprimido', 525.00, 700.00, 3, 'Disponível', 7, '2022-04-01', '2025-03-01', '2025-01-17 12:09:01', '2025-01-17 11:09:01', 129, 7, NULL, 1, 89042062245500, NULL);
INSERT INTO `tb_produtos` VALUES (104, 'Suporte de mão', '', 'suporte', 21, 'Comprimido', 525.00, 700.00, 3, 'Disponível', 7, '2022-04-01', '2025-03-01', '2025-01-17 12:10:48', '2025-01-17 11:10:48', 129, 7, NULL, 1, 8907821019575, NULL);
INSERT INTO `tb_produtos` VALUES (105, 'Amoxicilina 500 mg', '', 'Antibiotico', 13, 'Comprimido', 285.00, 450.00, 986, 'Disponível', 7, '2024-02-01', '2027-02-01', '2025-01-17 12:20:55', '2025-01-30 17:51:51', 129, 3, NULL, 10, 6290360154138, NULL);
INSERT INTO `tb_produtos` VALUES (106, 'Aldomet', '', 'pressao arterial', 13, 'Comprimido', 1300.00, 1950.00, 3, 'Disponível', 7, '2024-01-11', '2026-01-11', '2025-01-17 12:40:25', '2025-01-30 18:54:46', 130, 1, NULL, 1, 8064857, NULL);
INSERT INTO `tb_produtos` VALUES (107, 'Aspirina cp 100mg indiano', '', 'pressão alta', 13, 'Comprimido', 140.00, 300.00, 38, 'Disponível', 7, '2024-02-05', '2027-01-04', '2025-01-17 13:12:12', '2025-01-31 15:04:39', 130, 1, NULL, 1, 6290360152066, NULL);
INSERT INTO `tb_produtos` VALUES (112, 'Azitromecina 500MG', '', 'antibiótico', 13, 'Comprimido', 620.00, 950.00, 20, 'Disponível', 5, '2024-01-05', '2026-01-04', '2025-01-17 13:21:08', '2025-01-17 12:21:08', 130, 1, NULL, 1, 2629036015128, NULL);
INSERT INTO `tb_produtos` VALUES (113, 'Ceftriaxona 1g', '', 'antibiótico', 13, 'Comprimido', 296.00, 450.00, 38, 'Disponível', 5, '2024-01-06', '2027-02-05', '2025-01-17 13:26:17', '2025-01-26 16:20:04', 130, 6, NULL, 1, 8904206223299, NULL);
INSERT INTO `tb_produtos` VALUES (114, 'CIPROFLOXACINA 500MG INDIANO', '', 'antibiótico', 13, 'Comprimido', 240.00, 450.00, 15, 'Disponível', 5, '2024-06-01', '2027-05-01', '2025-01-17 13:33:05', '2025-01-26 17:36:32', 130, 1, NULL, 1, 6290360152097, NULL);
INSERT INTO `tb_produtos` VALUES (115, 'Complexo b xarope basi', '', 'vitamina', 13, 'Comprimido', 1630.00, 3000.00, 2, 'Disponível', 5, '2023-04-01', '2026-03-01', '2025-01-17 13:38:02', '2025-01-17 12:38:02', 130, 2, NULL, 1, 735454787, NULL);
INSERT INTO `tb_produtos` VALUES (116, 'Daviclav 625mg', '', 'antibiótico', 13, 'Comprimido', 2100.00, 1600.00, 19, 'Disponível', 5, '2024-07-01', '2026-06-01', '2025-01-17 13:41:16', '2025-01-24 19:28:35', 130, 1, NULL, 2, 6290360154190, NULL);
INSERT INTO `tb_produtos` VALUES (117, 'Davimol gel forte', '', 'anti emflatorio', 13, 'Comprimido', 306.00, 700.00, 6, 'Disponível', 5, '2023-12-01', '2026-11-01', '2025-01-17 13:51:55', '2025-01-30 15:11:24', 130, 4, NULL, 1, 6290360150420, NULL);
INSERT INTO `tb_produtos` VALUES (118, 'Dexametasona ampola', '', 'anti alergico', 13, 'Comprimido', 42.00, 100.00, 100, 'Disponível', 5, '2024-02-01', '2027-02-01', '2025-01-17 14:07:19', '2025-01-26 20:03:52', 130, 6, NULL, 10, 8904232737326, NULL);
INSERT INTO `tb_produtos` VALUES (119, 'Diclofenac ampola', '', 'anti emflatorio', 13, 'Comprimido', 40.00, 100.00, 93, 'Disponível', 5, '2024-05-01', '2027-04-01', '2025-01-17 14:10:05', '2025-01-26 16:20:04', 130, 6, NULL, 10, 8904232737302, NULL);
INSERT INTO `tb_produtos` VALUES (120, 'Dipirona 500mg', '', 'analgesico', 13, 'Comprimido', 121.00, 250.00, 44, 'Disponível', 5, '2023-01-07', '2026-06-01', '2025-01-17 14:13:07', '2025-01-31 14:08:22', 130, 1, NULL, 1, 6290360154022, NULL);
INSERT INTO `tb_produtos` VALUES (121, 'Doxiciclina 100mg', '', 'antibiótico', 13, 'Comprimido', 125.00, 300.00, 30, 'Disponível', 5, '2023-06-01', '2026-05-01', '2025-01-17 14:16:13', '2025-01-26 20:03:59', 130, 3, NULL, 1, 8904206224159, NULL);
INSERT INTO `tb_produtos` VALUES (122, 'Enalapril 10mg indiano', '', 'pressão alta', 13, 'Comprimido', 155.00, 400.00, 28, 'Disponível', 5, '2024-05-01', '2027-04-01', '2025-01-17 14:21:01', '2025-01-31 09:28:36', 130, 1, NULL, 1, 6290360150253, NULL);
INSERT INTO `tb_produtos` VALUES (123, 'Enalapril 20 mg indiano', '', 'pressão alta', 13, 'Comprimido', 201.00, 400.00, 22, 'Disponível', 5, '2024-04-01', '2027-03-01', '2025-01-17 14:23:09', '2025-01-31 15:04:39', 130, 1, NULL, 1, 6290360150260, NULL);
INSERT INTO `tb_produtos` VALUES (124, 'Fluconazol 150mg', '', 'anti fugico', 13, 'Comprimido', 1350.00, 2000.00, 4, 'Disponível', 5, '2024-02-01', '2027-07-01', '2025-01-17 14:38:58', '2025-01-17 13:38:58', 130, 1, NULL, 2, 5722038, NULL);
INSERT INTO `tb_produtos` VALUES (125, 'Fluditec xarope crianca', '', 'tossico', 13, 'Comprimido', 2850.00, 4500.00, 2, 'Disponível', 5, '2024-05-01', '2026-04-01', '2025-01-17 14:42:35', '2025-01-17 13:42:35', 130, 2, NULL, 1, 3400970000685, NULL);
INSERT INTO `tb_produtos` VALUES (126, 'Folicil 5mg', '', 'para anemia', 13, 'Comprimido', 1100.00, 1700.00, 90, 'Disponível', 5, '2024-01-07', '2026-02-01', '2025-01-17 14:48:56', '2025-01-17 13:48:56', 130, 1, NULL, 1, 5790597, NULL);
INSERT INTO `tb_produtos` VALUES (127, 'furosemida 40mg sandoz', '', 'pressão alta', 13, 'Comprimido', 300.00, 1000.00, 12, 'Disponível', 5, '2024-02-01', '2026-09-01', '2025-01-17 14:51:50', '2025-01-17 13:51:50', 130, 1, NULL, 1, 5743984, NULL);
INSERT INTO `tb_produtos` VALUES (128, 'gentamicina oftalmica', '', 'oftamilca', 13, 'Comprimido', 210.00, 500.00, 24, 'Disponível', 5, '2023-10-01', '2025-09-01', '2025-01-17 14:56:05', '2025-01-31 18:37:22', 130, 7, NULL, 1, 6290360152271, NULL);
INSERT INTO `tb_produtos` VALUES (129, 'gentamicina oftalmica gota', '', 'oftamilca', 13, 'Comprimido', 250.00, 700.00, 8, 'Disponível', 5, '2024-07-01', '2026-06-01', '2025-01-17 14:58:29', '2025-01-26 18:37:50', 130, 7, NULL, 1, 6290360152264, NULL);
INSERT INTO `tb_produtos` VALUES (130, 'Gentamicina pomada', '', 'dermica', 13, 'Comprimido', 400.00, 700.00, 6, 'Disponível', 5, '2024-02-01', '2027-02-01', '2025-01-17 15:04:50', '2025-01-17 14:04:50', 130, 4, NULL, 1, 6290360151588, NULL);
INSERT INTO `tb_produtos` VALUES (131, 'gentamicina ampola', '', 'antibiótico', 13, 'Comprimido', 43.00, 100.00, 100, 'Disponível', 5, '2024-03-01', '2027-02-01', '2025-01-17 15:38:52', '2025-01-17 14:38:52', 130, 6, NULL, 10, 8904232737548, NULL);
INSERT INTO `tb_produtos` VALUES (134, 'gravi-nause', '', 'nausesias', 13, 'Comprimido', 156.00, 300.00, 30, 'Disponível', 5, '2022-02-01', '2025-04-01', '2025-01-17 15:47:05', '2025-01-17 14:47:05', 130, 1, NULL, 1, 629036015089, NULL);
INSERT INTO `tb_produtos` VALUES (135, 'Griseofulvina 500mg', '', 'antibiótico', 13, 'Comprimido', 470.00, 750.00, 10, 'Disponível', 5, '2023-07-01', '2026-06-01', '2025-01-17 15:49:27', '2025-01-17 14:49:27', 130, 1, NULL, 1, 6290360154107, NULL);
INSERT INTO `tb_produtos` VALUES (136, 'Griseofulvina pomada', '', 'anti-fugico', 13, 'Comprimido', 283.00, 700.00, 4, 'Disponível', 5, '2023-10-01', '2025-09-01', '2025-01-17 15:52:17', '2025-01-30 15:01:53', 130, 4, NULL, 1, 6290360151618, NULL);
INSERT INTO `tb_produtos` VALUES (137, 'ibuprofeno 400mg', '', 'anti emflatorio', 13, 'Comprimido', 126.00, 300.00, 37, 'Disponível', 5, '2022-11-01', '2025-10-01', '2025-01-17 15:54:57', '2025-01-30 15:19:40', 130, 1, NULL, 1, 6290360151731, NULL);
INSERT INTO `tb_produtos` VALUES (138, 'Hemorid comprimido', '', 'antibiótico', 13, 'Comprimido', 87.00, 350.00, 15, 'Disponível', 5, '2024-05-01', '2027-05-01', '2025-01-17 15:58:34', '2025-01-17 14:58:34', 130, 1, NULL, 1, 6290360150451, NULL);
INSERT INTO `tb_produtos` VALUES (140, 'Hemorid pomada', '', 'anti-fugico', 13, 'Comprimido', 266.00, 500.00, 5, 'Disponível', 5, '2024-04-01', '2027-05-01', '2025-01-17 16:03:46', '2025-01-24 16:37:25', 130, 4, NULL, 1, 629036015045, NULL);
INSERT INTO `tb_produtos` VALUES (141, 'Losartan 50+12.5', '', 'pressão alta', 13, 'Comprimido', 420.00, 700.00, 15, 'Disponível', 5, '2025-04-01', '2027-01-04', '2025-01-17 16:07:55', '2025-01-26 19:54:07', 130, 1, NULL, 1, 6290360150604, NULL);
INSERT INTO `tb_produtos` VALUES (142, 'Iodo indiano', '', 'sistema neurologico', 13, 'Comprimido', 140.00, 300.00, 21, 'Disponível', 5, '2023-01-10', '2026-01-09', '2025-01-17 16:11:22', '2025-01-26 20:04:21', 130, 1, NULL, 1, 6290360150659, NULL);
INSERT INTO `tb_produtos` VALUES (143, 'losartan 100mg', '1', 'pressão alta', 13, 'Comprimido', 297.00, 500.00, 30, 'Disponível', 5, '2024-01-04', '2027-03-01', '2025-01-17 16:24:23', '2025-01-26 19:54:51', 130, 1, NULL, 1, 6290360150598, NULL);
INSERT INTO `tb_produtos` VALUES (144, 'mebendazol 100mg', '1', 'parasita', 13, 'Comprimido', 132.00, 200.00, 24, 'Disponível', 5, '2022-11-01', '2025-01-10', '2025-01-17 16:27:44', '2025-01-26 20:05:11', 130, 1, NULL, 1, 18906045540206, NULL);
INSERT INTO `tb_produtos` VALUES (145, 'Mebendazol 100mg/5ml', '1', 'Desparasitante', 13, 'Comprimido', 330.00, 500.00, 10, 'Disponível', 7, '2024-02-01', '2027-01-01', '2025-01-17 18:40:51', '2025-01-26 20:05:14', 129, 2, NULL, 1, 6290360153018, NULL);
INSERT INTO `tb_produtos` VALUES (146, 'Magnavit', '1', 'Multi vitaminas e minerais', 13, 'Comprimido', 464.00, 850.00, 6, 'Disponível', 7, '2023-08-01', '2026-01-01', '2025-01-17 18:48:24', '2025-01-26 20:09:59', 129, 3, NULL, 15, 8904206212804, NULL);
INSERT INTO `tb_produtos` VALUES (147, 'Metoclopramida BP 10mg', '', 'Anti vomito', 13, 'Comprimido', 62.00, 150.00, 60, 'Disponível', 7, '2022-12-01', '2025-11-01', '2025-01-17 19:11:11', '2025-01-17 18:11:11', 129, 1, NULL, 10, 6290360154084, NULL);
INSERT INTO `tb_produtos` VALUES (148, 'Metronidazol 500mg', '', 'Anti protozoário, antibacteriano', 13, 'Comprimido', 128.00, 300.00, 484, 'Disponível', 7, '2024-07-01', '2025-05-01', '2025-01-17 19:18:26', '2025-01-30 15:17:31', 129, 1, NULL, 10, 6290360152158, NULL);
INSERT INTO `tb_produtos` VALUES (149, 'Microlax 270 mg', '', 'Latentes e crianças', 13, 'Comprimido', 1000.00, 1500.00, 6, 'Disponível', 7, '2024-06-03', '2029-01-01', '2025-01-17 19:42:23', '2025-01-17 18:42:23', 129, 4, NULL, 1, 5672688, NULL);
INSERT INTO `tb_produtos` VALUES (152, 'Norfloxacina Uroflox 400mg', '', 'Antibiótico usado pra infecções do trato urinário', 13, 'Comprimido', 1200.00, 2000.00, 4, 'Disponível', 7, '2025-01-18', '2027-03-01', '2025-01-18 07:45:15', '2025-01-18 06:45:15', 129, 1, NULL, 8, 3760319491162, NULL);
INSERT INTO `tb_produtos` VALUES (153, 'Penicilina 250mg', '', 'Antibiótico usado para infecções', 13, 'Comprimido', 200.00, 500.00, 10, 'Disponível', 7, '2024-01-01', '2025-12-12', '2025-01-18 08:41:35', '2025-01-18 07:41:35', 0, 1, NULL, 10, 6290360154237, NULL);
INSERT INTO `tb_produtos` VALUES (154, 'Penicilina 500 mg', '', 'Antibiótico usado para tratar infecções', 13, 'Comprimido', 430.00, 700.00, 7, 'Disponível', 7, '2023-07-01', '2025-06-01', '2025-01-18 08:48:02', '2025-01-30 15:17:31', 0, 1, NULL, 20, 62903360154220, NULL);
INSERT INTO `tb_produtos` VALUES (155, 'Prometazina injetável 2 ml', '', 'Anti histamínico, vômitos alergia', 13, 'Comprimido', 26.00, 150.00, 90, 'Disponível', 7, '2022-08-01', '2025-07-01', '2025-01-18 08:57:24', '2025-01-24 19:25:21', 0, 6, NULL, 1, 8904232737760, NULL);
INSERT INTO `tb_produtos` VALUES (156, 'Relief', '1', 'Analgésico indicado para dores', 13, 'Comprimido', 102.00, 200.00, 44, 'Disponível', 7, '2024-06-01', '2027-05-01', '2025-01-18 09:02:22', '2025-01-31 18:47:46', 0, 1, NULL, 10, 8907821045727, NULL);
INSERT INTO `tb_produtos` VALUES (158, 'SEKRROL AMBROXOL 15MG/5ML', '', 'Indicado para doenças pulmonares', 13, 'Comprimido', 2475.00, 3700.00, 2, 'Disponível', 7, '2022-12-01', '2025-12-01', '2025-01-18 09:14:21', '2025-01-18 08:14:21', 129, 2, NULL, 2, 5407003240436, NULL);
INSERT INTO `tb_produtos` VALUES (159, 'SOCOMOL', '1', 'Analgésico indicado para dores', 13, 'Comprimido', 300.00, 500.00, 20, 'Disponível', 7, '2024-07-01', '2027-06-01', '2025-01-18 09:23:50', '2025-01-31 17:25:29', 129, 1, NULL, 10, 8906043601100, NULL);
INSERT INTO `tb_produtos` VALUES (160, 'Tetraciclina 500 mg', '1', 'Antibiótico usado para infecções', 13, 'Comprimido', 260.00, 400.00, 94, 'Disponível', 7, '2024-06-01', '2027-05-01', '2025-01-18 09:32:48', '2025-01-31 18:47:46', 129, 1, NULL, 10, 6290360154121, NULL);
INSERT INTO `tb_produtos` VALUES (161, 'Tetraciclina 250 mg', '1', 'Antibiótico usado para infecções', 13, 'Comprimido', 110.00, 300.00, 100, 'Disponível', 7, '2024-07-01', '2027-06-01', '2025-01-18 09:35:31', '2025-01-26 20:04:54', 129, 1, NULL, 10, 6290360154572, NULL);
INSERT INTO `tb_produtos` VALUES (162, 'Vitamina B1+B6+B12 - 3 Fort', '', 'Vitaminas do começo B, atuam no metabolismo e regulam a energia', 13, 'Comprimido', 96.00, 300.00, 60, 'Disponível', 7, '2024-04-01', '2027-03-01', '2025-01-18 09:51:21', '2025-01-18 08:51:21', 129, 1, NULL, 10, 8904232739061, NULL);
INSERT INTO `tb_produtos` VALUES (163, 'Vitamina B complexo injetável 2 ml', '1', 'Para carência de vitamina B', 13, 'Comprimido', 30.00, 150.00, 100, 'Disponível', 7, '2023-09-01', '2026-08-01', '2025-01-18 10:00:16', '2025-01-26 20:05:06', 129, 6, NULL, 1, 8904206238767, NULL);
INSERT INTO `tb_produtos` VALUES (166, 'Vitamina B6 injetável 2ml', '', 'Vômitos', 13, 'Comprimido', 30.00, 150.00, 99, 'Disponível', 7, '2024-06-01', '2027-05-01', '2025-01-18 10:20:24', '2025-01-26 17:36:32', 0, 6, NULL, 1, 8904206224203, NULL);
INSERT INTO `tb_produtos` VALUES (167, 'Vitamina B complexo 100 ml', '', 'Paludismo', 13, 'Comprimido', 495.00, 750.00, 9, 'Disponível', 7, '2024-07-01', '2026-05-01', '2025-01-18 10:36:30', '2025-01-30 15:01:53', 129, 1, NULL, 1, 6290360152585, NULL);
INSERT INTO `tb_produtos` VALUES (168, 'Vicombil', '', 'Vitamina', 13, 'Comprimido', 900.00, 1500.00, 117, 'Disponível', 7, '2025-01-18', '2027-04-01', '2025-01-18 10:42:00', '2025-01-26 17:36:32', 129, 1, NULL, 6, 2496693, NULL);
INSERT INTO `tb_produtos` VALUES (169, 'Omeprazol 20mg Omex', '', 'Dor de estômago', 13, 'Comprimido', 150.00, 300.00, 30, 'Disponível', 8, '2023-03-01', '2026-02-01', '2025-01-19 19:17:18', '2025-01-19 18:17:18', 129, 3, NULL, 10, 18904286630700, NULL);
INSERT INTO `tb_produtos` VALUES (170, 'Sabonete de Glicerina', '', 'Sabonete', 14, 'Comprimido', 1915.00, 3000.00, 1, 'Disponível', 8, '2025-01-01', '2030-05-01', '2025-01-19 19:56:10', '2025-01-29 11:21:20', 0, 7, NULL, 1, 5603180000195, NULL);
INSERT INTO `tb_produtos` VALUES (171, 'IBUPROFENO 400MG', '', 'analgésico', 13, 'Comprimido', 630.50, 1000.00, 5, 'Disponível', 10, '2023-01-04', '2027-07-01', '2025-01-20 18:57:37', '2025-01-30 14:35:40', 130, 1, NULL, 1, 5772181, NULL);
INSERT INTO `tb_produtos` VALUES (172, 'Diclofenac 100mg portugueses', '', 'analgésico', 13, 'Comprimido', 986.00, 1550.00, 11, 'Disponível', 10, '2024-02-01', '2027-03-01', '2025-01-20 19:03:15', '2025-01-27 17:46:08', 130, 1, NULL, 1, 2785699, NULL);
INSERT INTO `tb_produtos` VALUES (173, 'agua digestiva', '', 'antiácido', 13, 'Comprimido', 320.00, 700.00, 5, 'Disponível', 10, '2023-06-01', '2026-05-01', '2025-01-20 19:06:43', '2025-01-20 18:06:43', 130, 2, NULL, 1, 8906061619743, NULL);
INSERT INTO `tb_produtos` VALUES (174, 'xilometazolina gota 0,5 fusylox', '', 'anti gripal', 13, 'Comprimido', 190.00, 700.00, 10, 'Disponível', 10, '2023-08-01', '2026-07-01', '2025-01-20 19:12:05', '2025-01-20 18:12:05', 130, 7, NULL, 1, 8906061619842, NULL);
INSERT INTO `tb_produtos` VALUES (175, 'xilometazolina gota 0,1 fusylox', '', 'anti alergico', 13, 'Comprimido', 270.00, 700.00, 10, 'Disponível', 10, '2023-08-01', '2026-07-01', '2025-01-20 19:14:57', '2025-01-20 18:14:57', 130, 7, NULL, 1, 8906061620091, NULL);
INSERT INTO `tb_produtos` VALUES (176, 'Daviclav (Amoxicilina e acido clavulanico 500mg/125mg)', '', 'antibiotico', 13, 'Comprimido', 825.00, 1300.00, 12, 'Disponível', 10, '2023-02-01', '2025-12-01', '2025-01-20 19:35:07', '2025-01-30 17:55:25', 130, 1, NULL, 1, 2562684, NULL);
INSERT INTO `tb_produtos` VALUES (177, 'Ampicilina 250 mg', '', 'Antibiótico', 13, 'Comprimido', 165.00, 300.00, 499, 'Disponível', 6, '2023-07-01', '2026-06-01', '2025-01-20 20:20:43', '2025-01-25 10:32:45', 129, 1, NULL, 10, 6971021487573, NULL);
INSERT INTO `tb_produtos` VALUES (178, 'Ampicilina 500 MG', '', 'Antibiótico', 13, 'Comprimido', 275.00, 450.00, 34, 'Disponível', 6, '2024-04-01', '2027-03-01', '2025-01-20 20:26:29', '2025-01-31 16:32:56', 129, 1, NULL, 10, 6971021480178, NULL);
INSERT INTO `tb_produtos` VALUES (179, 'Nimesulida 100mg', '', 'analgesico antipiretico', 13, 'Comprimido', 600.00, 1200.00, 8, 'Disponível', 10, '2023-02-01', '2029-03-01', '2025-01-20 20:36:23', '2025-01-20 19:36:23', 130, 1, NULL, 1, 5410089, NULL);
INSERT INTO `tb_produtos` VALUES (180, 'Apominon  xarope 125 MG', '', 'Antibiótico', 13, 'Comprimido', 1499.00, 2500.00, 2, 'Disponível', 6, '2022-12-01', '2025-11-01', '2025-01-20 20:37:40', '2025-01-20 19:37:40', 129, 2, NULL, 1, 5603690005659, NULL);
INSERT INTO `tb_produtos` VALUES (181, 'Apominon Xarope 250 MG5', '', 'Antibiótico', 13, 'Comprimido', 1499.00, 2500.00, 2, 'Disponível', 6, '2023-07-01', '2026-06-01', '2025-01-20 20:53:55', '2025-01-20 19:53:55', 129, 2, NULL, 1, 5603690005666, NULL);
INSERT INTO `tb_produtos` VALUES (182, 'ciprofloxacina 500mg sandoz', '', 'antibiotico', 13, 'Comprimido', 1362.00, 2300.00, 6, 'Disponível', 10, '2023-02-01', '2026-05-01', '2025-01-20 20:55:08', '2025-01-26 17:36:32', 130, 1, NULL, 1, 583448, NULL);
INSERT INTO `tb_produtos` VALUES (183, 'Metformina 1000mg', '', 'acucar no sague', 13, 'Comprimido', 466.00, 850.00, 12, 'Disponível', 10, '2024-02-01', '2028-12-01', '2025-01-20 20:57:46', '2025-01-20 19:57:46', 130, 1, NULL, 1, 5171533, NULL);
INSERT INTO `tb_produtos` VALUES (184, 'Apominon 500 MG comprimido', '', 'Antibiótico', 13, 'Comprimido', 1450.00, 2500.00, 4, 'Disponível', 6, '2022-06-01', '2025-05-01', '2025-01-20 21:00:38', '2025-01-20 20:00:38', 129, 1, NULL, 8, 5603690005642, NULL);
INSERT INTO `tb_produtos` VALUES (185, 'Metformina 500mg', '', 'acucar no sague', 13, 'Comprimido', 250.00, 500.00, 11, 'Disponível', 10, '2024-01-01', '2028-10-01', '2025-01-20 21:04:41', '2025-01-26 16:20:04', 130, 1, NULL, 1, 5171517, NULL);
INSERT INTO `tb_produtos` VALUES (186, 'captopril 25mg', '', 'acucar no sague', 13, 'Comprimido', 963.00, 1000.00, 18, 'Disponível', 10, '2024-02-01', '2027-05-01', '2025-01-20 21:08:20', '2025-01-20 20:08:20', 130, 1, NULL, 1, 5505094, NULL);
INSERT INTO `tb_produtos` VALUES (187, 'amlodipina 5mg sandoz', '', 'pressao', 13, 'Comprimido', 492.00, 800.00, 6, 'Disponível', 10, '2024-02-01', '2026-06-01', '2025-01-20 21:10:26', '2025-01-20 20:10:26', 130, 1, NULL, 1, 5999883, NULL);
INSERT INTO `tb_produtos` VALUES (188, 'atenolol10mg sandoz', '', 'pressao', 14, 'Comprimido', 650.00, 100.00, 6, 'Disponível', 10, '2024-02-01', '2028-05-01', '2025-01-20 21:12:07', '2025-01-20 20:12:07', 130, 1, NULL, 1, 5791181, NULL);
INSERT INTO `tb_produtos` VALUES (189, 'ANAFLAM xarope 60ml', '', 'Indicado para dor', 13, 'Comprimido', 450.00, 850.00, 8, 'Disponível', 6, '2024-08-01', '2027-07-01', '2025-01-20 21:31:39', '2025-01-30 15:17:31', 129, 2, NULL, 1, 8902292507613, NULL);
INSERT INTO `tb_produtos` VALUES (190, 'ANAFLAM comprimidos', '', 'Indicado para dor', 13, 'Comprimido', 200.00, 350.00, 18, 'Disponível', 6, '2024-07-01', '2027-06-01', '2025-01-20 21:35:56', '2025-01-30 15:01:53', 129, 1, NULL, 10, 8902292507545, NULL);
INSERT INTO `tb_produtos` VALUES (191, 'ADT 25mg', '', 'ansilitico', 13, 'Comprimido', 1433.00, 2500.00, 3, 'Disponível', 10, '2024-02-01', '2028-09-01', '2025-01-20 21:36:44', '2025-01-20 20:36:44', 130, 1, NULL, 1, 9076943, NULL);
INSERT INTO `tb_produtos` VALUES (192, 'Basiflux 1.6mg/ml xarope', '', 'Facilita a expectoração', 13, 'Comprimido', 2450.00, 4000.00, 0, 'Disponível', 6, '2023-09-01', '2026-08-01', '2025-01-20 21:41:56', '2025-01-28 14:09:46', 129, 2, NULL, 1, 5411566, NULL);
INSERT INTO `tb_produtos` VALUES (193, 'Risperidona 1mg', '', 'ansiolitico', 14, 'Comprimido', 925.00, 1500.00, 4, 'Disponível', 10, '2024-02-01', '2025-12-01', '2025-01-20 21:42:15', '2025-01-20 20:42:15', 130, 2, NULL, 1, 5507389, NULL);
INSERT INTO `tb_produtos` VALUES (194, 'Basiflux 0,8mg xarop', '', 'Facilita a expectoração', 13, 'Comprimido', 2450.00, 4000.00, 1, 'Disponível', 6, '2024-02-01', '2027-01-01', '2025-01-20 21:44:24', '2025-01-30 15:01:53', 129, 2, NULL, 1, 5145743, NULL);
INSERT INTO `tb_produtos` VALUES (195, 'vitamina b complexo xarope basi', '', 'vitamina', 13, 'Comprimido', 1840.00, 3000.00, 4, 'Disponível', 10, '2024-02-01', '2026-03-01', '2025-01-20 21:50:03', '2025-01-20 20:50:03', 130, 2, NULL, 1, 7354787, NULL);
INSERT INTO `tb_produtos` VALUES (196, 'CAL-D comprimido', '', 'Suplemento alimentar para baixo nível de cálcio', 16, 'Comprimido', 165.00, 400.00, 10, 'Disponível', 6, '2024-08-01', '2027-07-01', '2025-01-20 21:53:32', '2025-01-20 20:53:32', 129, 1, NULL, 10, 8902292003283, NULL);
INSERT INTO `tb_produtos` VALUES (197, 'Canderm 50G pô', '', 'Descamação, coceira..', 15, 'Comprimido', 350.00, 750.00, 4, 'Disponível', 6, '2024-07-01', '2027-06-01', '2025-01-20 22:00:39', '2025-02-01 07:17:51', 129, 7, NULL, 1, 8902292504445, NULL);
INSERT INTO `tb_produtos` VALUES (198, 'Nolotil 575mg', '', 'analgésico', 13, 'Comprimido', 1186.00, 2500.00, 12, 'Disponível', 10, '2024-02-01', '2026-05-01', '2025-01-20 22:03:45', '2025-01-20 21:03:45', 130, 3, NULL, 1, 95124334, NULL);
INSERT INTO `tb_produtos` VALUES (199, 'UL', '', 'gases', 13, 'Comprimido', 572.00, 900.00, 20, 'Disponível', 10, '2024-02-01', '2027-03-01', '2025-01-20 22:06:10', '2025-01-20 21:06:10', 130, 7, NULL, 1, 8615211, NULL);
INSERT INTO `tb_produtos` VALUES (200, 'TEOBEXIN 2 G', '', 'Anti', 13, 'Comprimido', 3082.00, 5000.00, 2, 'Disponível', 4, '2024-12-01', '2026-11-01', '2025-01-20 22:17:30', '2025-01-20 21:17:30', 129, 7, NULL, 1, 8906047261638, NULL);
INSERT INTO `tb_produtos` VALUES (201, 'metoclopramida', '', 'para nauseas', 13, 'Comprimido', 403.00, 1200.00, 12, 'Disponível', 10, '2024-01-01', '2029-04-01', '2025-01-20 22:20:52', '2025-01-20 21:20:52', 130, 1, NULL, 1, 289819, NULL);
INSERT INTO `tb_produtos` VALUES (202, 'soro cloreto de sodio infusao', '', 'reidratacao', 13, 'Comprimido', 550.00, 1100.00, 2, 'Disponível', 10, '2024-03-01', '2027-03-31', '2025-01-20 22:34:54', '2025-01-26 17:36:32', 130, 6, NULL, 1, 2403, NULL);
INSERT INTO `tb_produtos` VALUES (203, 'Lactato de Riger soro', '', 'REIDRATACAO', 13, 'Comprimido', 550.00, 1100.00, 4, 'Disponível', 10, '2024-03-01', '2027-03-31', '2025-01-20 22:39:40', '2025-01-30 14:35:41', 130, 6, NULL, 1, 240, NULL);
INSERT INTO `tb_produtos` VALUES (204, 'Dextrose soro', '', 'reidratacao', 13, 'Comprimido', 550.00, 1100.00, 4, 'Disponível', 10, '2024-04-01', '2027-03-01', '2025-01-20 22:41:37', '2025-01-30 14:49:31', 130, 6, NULL, 1, 401, NULL);
INSERT INTO `tb_produtos` VALUES (205, 'algodao embalado', '', 'septico', 25, 'Comprimido', 2550.00, 300.00, 28, 'Disponível', 10, '2023-12-01', '2028-12-31', '2025-01-20 22:45:00', '2025-01-30 15:39:47', 130, 7, NULL, 1, 321, NULL);
INSERT INTO `tb_produtos` VALUES (206, 'clorafenicol gota 0.5', '', 'antibiotico', 13, 'Comprimido', 190.00, 500.00, 10, 'Disponível', 10, '2024-08-01', '2027-07-01', '2025-01-20 22:48:47', '2025-01-20 21:48:47', 130, 7, NULL, 1, 1992, NULL);
INSERT INTO `tb_produtos` VALUES (207, 'Cetirizina 10mg sandoz', '', 'antialergico', 13, 'Comprimido', 825.00, 1300.00, 4, 'Disponível', 10, '2024-05-01', '2025-10-01', '2025-01-20 22:51:10', '2025-01-20 21:51:10', 130, 1, NULL, 1, 5386982, NULL);
INSERT INTO `tb_produtos` VALUES (208, 'Losartan 100mg indiano', '', 'pressao', 13, 'Comprimido', 145.00, 300.00, 20, 'Disponível', 10, '2024-04-01', '2027-03-31', '2025-01-21 09:48:12', '2025-01-21 08:48:12', 130, 1, NULL, 1, 2401, NULL);
INSERT INTO `tb_produtos` VALUES (209, 'Multivitamina gota indiano', '', 'imunidade das células', 13, 'Comprimido', 300.00, 600.00, 10, 'Disponível', 10, '2024-06-01', '2027-03-30', '2025-01-21 09:50:22', '2025-01-30 15:11:24', 130, 2, NULL, 1, 2406, NULL);
INSERT INTO `tb_produtos` VALUES (210, 'cotrimoxazol xarope indiano /fusotrim', '', 'antibiotico', 13, 'Comprimido', 345.00, 700.00, 6, 'Disponível', 10, '2024-06-01', '2027-03-30', '2025-01-21 09:53:28', '2025-02-01 08:03:10', 130, 2, NULL, 1, 2415, NULL);
INSERT INTO `tb_produtos` VALUES (211, 'buscopan injectavel /Hyscopan', '', 'ESPAMO', 13, 'Comprimido', 78.00, 200.00, 50, 'Disponível', 10, '2024-03-01', '2027-02-01', '2025-01-21 09:59:48', '2025-01-21 08:59:48', 130, 6, NULL, 1, 2702, NULL);
INSERT INTO `tb_produtos` VALUES (212, 'Folifer cp portugues', '', 'anemia', 13, 'Comprimido', 2166.00, 3500.00, 3, 'Disponível', 10, '2024-02-01', '2026-08-01', '2025-01-21 10:02:41', '2025-01-30 18:54:45', 130, 1, NULL, 1, 9689513, NULL);
INSERT INTO `tb_produtos` VALUES (213, 'Metformina 500mg indiano', '', 'acucar no sague', 13, 'Comprimido', 130.00, 300.00, 15, 'Disponível', 10, '2024-03-01', '2027-03-31', '2025-01-21 10:05:30', '2025-01-21 09:05:30', 130, 1, NULL, 1, 4, NULL);
INSERT INTO `tb_produtos` VALUES (214, 'clareniz gota adulto', '', 'alergia', 13, 'Comprimido', 650.00, 1000.00, 11, 'Disponível', 6, '2024-07-01', '2027-06-01', '2025-01-21 10:10:54', '2025-01-28 14:09:46', 130, 7, NULL, 1, 8902292004303, NULL);
INSERT INTO `tb_produtos` VALUES (215, 'Clarinez gota crianca', '', 'alergia', 13, 'Comprimido', 650.00, 1000.00, 6, 'Disponível', 6, '2024-09-01', '2027-08-01', '2025-01-21 10:12:34', '2025-01-31 17:24:51', 130, 7, NULL, 1, 108902292504292, NULL);
INSERT INTO `tb_produtos` VALUES (216, 'Dagesil gel', '', 'analgésico', 13, 'Comprimido', 1700.00, 3500.00, 3, 'Disponível', 6, '2023-09-01', '2026-09-01', '2025-01-21 10:14:36', '2025-01-21 09:14:36', 130, 4, NULL, 1, 501274, NULL);
INSERT INTO `tb_produtos` VALUES (217, 'Dimidon xarope 20MG', '', 'analgésico', 13, 'Comprimido', 2200.00, 3500.00, 1, 'Disponível', 6, '2023-08-01', '2026-07-01', '2025-01-21 10:16:20', '2025-01-21 09:16:20', 130, 2, NULL, 1, 5671367, NULL);
INSERT INTO `tb_produtos` VALUES (218, 'Dimidon 40mg xarope', '', 'analgésico', 13, 'Comprimido', 2000.00, 3500.00, 1, 'Disponível', 6, '2023-11-01', '2026-10-01', '2025-01-21 10:17:56', '2025-01-21 09:17:56', 130, 2, NULL, 1, 5671375, NULL);
INSERT INTO `tb_produtos` VALUES (219, 'Eficef 200mg', '', 'antibiotico', 13, 'Comprimido', 1090.00, 2000.00, 5, 'Disponível', 6, '2024-05-01', '2026-04-01', '2025-01-21 10:20:44', '2025-01-21 09:20:44', 130, 1, NULL, 1, 108902292003658, NULL);
INSERT INTO `tb_produtos` VALUES (220, 'Eficef 400mg', '', 'antibiotico', 13, 'Comprimido', 2000.00, 3000.00, 4, 'Disponível', 6, '2024-05-01', '2026-04-01', '2025-01-21 10:22:41', '2025-01-30 16:26:08', 130, 1, NULL, 1, 108902292003665, NULL);
INSERT INTO `tb_produtos` VALUES (221, 'Epiderm 15g', '', 'antibiotico', 13, 'Comprimido', 280.00, 500.00, 9, 'Disponível', 6, '2024-09-01', '2027-08-01', '2025-01-21 10:24:38', '2025-01-25 18:22:33', 130, 4, NULL, 10, 8902292103235, NULL);
INSERT INTO `tb_produtos` VALUES (222, 'Fluminoc 20/120 mg', '', 'anti paludico', 13, 'Comprimido', 875.00, 1500.00, 7, 'Disponível', 6, '2023-08-01', '2025-08-01', '2025-01-21 10:27:40', '2025-01-30 15:17:31', 130, 1, NULL, 1, 5649058, NULL);
INSERT INTO `tb_produtos` VALUES (223, 'Fluminoc 80/480 mg', '', 'anti paludico', 13, 'Comprimido', 4300.00, 6500.00, 0, 'Disponível', 6, '2024-06-01', '2026-06-01', '2025-01-21 10:29:36', '2025-01-26 16:20:04', 130, 1, NULL, 1, 5603690001620, NULL);
INSERT INTO `tb_produtos` VALUES (224, 'Germol sabonete', '', 'anti fugico', 14, 'Comprimido', 619.00, 350.00, 3, 'Disponível', 6, '2024-09-02', '2026-09-01', '2025-01-21 10:31:54', '2025-02-01 15:21:37', 130, 7, NULL, 1, 769503424804, NULL);
INSERT INTO `tb_produtos` VALUES (225, 'Germol liquido 100mg', '', 'antibiotico', 14, 'Comprimido', 619.00, 1000.00, 5, 'Disponível', 6, '2024-05-14', '2027-05-13', '2025-01-21 10:34:09', '2025-01-30 14:23:18', 130, 7, NULL, 1, 6298044147131, NULL);
INSERT INTO `tb_produtos` VALUES (226, 'Germol liquido 50ml', '', 'infecção', 14, 'Comprimido', 357.00, 700.00, 6, 'Disponível', 6, '2024-04-19', '2027-04-18', '2025-01-21 10:35:59', '2025-01-21 09:35:59', 130, 7, NULL, 1, 6298044147124, NULL);
INSERT INTO `tb_produtos` VALUES (227, 'Gogynax pomada 30g', '', 'anti fugico', 13, 'Comprimido', 600.00, 1000.00, 12, 'Disponível', 6, '2024-09-01', '2027-08-01', '2025-01-21 10:37:59', '2025-01-21 09:37:59', 130, 4, NULL, 1, 108902292500720, NULL);
INSERT INTO `tb_produtos` VALUES (228, 'Gogynax lavagem intima', '', 'infecção', 13, 'Comprimido', 950.00, 1500.00, 5, 'Disponível', 6, '2024-08-01', '2027-07-01', '2025-01-21 10:40:04', '2025-01-21 09:40:04', 130, 7, NULL, 1, 108902292003269, NULL);
INSERT INTO `tb_produtos` VALUES (229, 'Halibut pomada 150mg', '', 'asadora', 13, 'Comprimido', 3200.00, 5000.00, 1, 'Disponível', 6, '2024-02-01', '2027-04-01', '2025-01-21 10:41:46', '2025-01-21 09:41:46', 130, 4, NULL, 1, 3925799, NULL);
INSERT INTO `tb_produtos` VALUES (230, 'Rufenac gel30g', '', 'analgésico', 13, 'Comprimido', 340.00, 700.00, 10, 'Disponível', 6, '2024-06-01', '2027-05-01', '2025-01-21 10:44:14', '2025-01-31 14:08:22', 130, 4, NULL, 1, 108902292501345, NULL);
INSERT INTO `tb_produtos` VALUES (231, 'Hemoforce plus zinco', '', 'anemia', 13, 'Comprimido', 1000.00, 1500.00, 5, 'Disponível', 6, '2024-04-01', '2026-03-01', '2025-01-21 11:01:46', '2025-01-21 10:01:46', 130, 2, NULL, 1, 8902292504766, NULL);
INSERT INTO `tb_produtos` VALUES (232, 'Hemoforce xarope verde', '', 'anemia', 13, 'Comprimido', 1000.00, 1500.00, 1, 'Disponível', 6, '2024-04-01', '2026-09-01', '2025-01-21 11:20:13', '2025-01-30 16:21:56', 130, 2, NULL, 1, 8902292107561, NULL);
INSERT INTO `tb_produtos` VALUES (233, 'Ibucap', '', 'analgésico', 13, 'Comprimido', 102.00, 350.00, 50, 'Disponível', 6, '2024-06-01', '2027-05-01', '2025-01-21 11:22:20', '2025-01-21 10:22:20', 130, 3, NULL, 1, 8902292500799, NULL);
INSERT INTO `tb_produtos` VALUES (234, 'Ibucap forte', '', 'analgésico', 13, 'Comprimido', 255.00, 550.00, 19, 'Disponível', 6, '2024-07-01', '2027-06-01', '2025-01-21 11:24:50', '2025-01-31 18:47:46', 130, 3, NULL, 1, 8902292504391, NULL);
INSERT INTO `tb_produtos` VALUES (235, 'Ketazol pomada 15g', '', 'infecção', 13, 'Comprimido', 280.00, 500.00, 8, 'Disponível', 6, '2024-08-01', '2027-07-01', '2025-01-21 11:26:28', '2025-01-27 18:02:56', 130, 4, NULL, 1, 8902292502038, NULL);
INSERT INTO `tb_produtos` VALUES (236, 'Ketazol pomada 30g', '', 'infecção', 13, 'Comprimido', 450.00, 700.00, 9, 'Disponível', 6, '2024-04-01', '2027-06-01', '2025-01-21 11:28:12', '2025-02-01 10:05:54', 130, 4, NULL, 1, 8902292500898, NULL);
INSERT INTO `tb_produtos` VALUES (237, 'Ketazol shampo', '', 'anti fugico', 13, 'Comprimido', 950.00, 1500.00, 8, 'Disponível', 6, '2024-10-01', '2027-09-01', '2025-01-21 11:30:37', '2025-01-26 16:20:04', 130, 7, NULL, 1, 8902292702421, NULL);
INSERT INTO `tb_produtos` VALUES (238, 'Ketazol 200mg cp', '', 'anti fugico', 13, 'Comprimido', 10.00, 700.00, 9, 'Disponível', 6, '2024-05-01', '2027-04-01', '2025-01-21 11:32:59', '2025-01-31 20:44:38', 130, 1, NULL, 1, 108902292500904, NULL);
INSERT INTO `tb_produtos` VALUES (239, 'Leopardo vick', '', 'analgésico', 13, 'Comprimido', 380.00, 700.00, 8, 'Disponível', 6, '2024-09-01', '2026-08-01', '2025-01-21 11:36:03', '2025-01-30 19:00:13', 130, 4, NULL, 1, 8902292504513, NULL);
INSERT INTO `tb_produtos` VALUES (240, 'loprade comprimido', '', 'anti diarreico', 13, 'Comprimido', 34.00, 200.00, 67, 'Disponível', 6, '2024-04-01', '2027-03-01', '2025-01-21 11:45:12', '2025-01-30 14:49:31', 130, 1, NULL, 1, 8902292502045, NULL);
INSERT INTO `tb_produtos` VALUES (241, 'Magnavit cp', '', 'vitaminas', 13, 'Comprimido', 367.00, 850.00, 15, 'Disponível', 6, '2024-08-01', '2027-07-01', '2025-01-21 11:49:41', '2025-01-21 10:49:41', 130, 3, NULL, 1, 8902292501000, NULL);
INSERT INTO `tb_produtos` VALUES (242, 'Maladox cp', '', 'profilatico/malaria', 13, 'Comprimido', 305.00, 500.00, 48, 'Disponível', 6, '2024-07-01', '2027-06-01', '2025-01-21 11:54:56', '2025-01-30 15:11:24', 130, 1, NULL, 1, 8902292905662, NULL);
INSERT INTO `tb_produtos` VALUES (243, 'Metazol cp 250mg', '', 'antibiotico', 13, 'Comprimido', 64.00, 200.00, 70, 'Disponível', 6, '2024-05-01', '2027-04-01', '2025-01-21 11:56:57', '2025-01-30 14:30:32', 130, 1, NULL, 1, 6771021481090, NULL);
INSERT INTO `tb_produtos` VALUES (244, 'Neocin pomada', '', 'dermica', 13, 'Comprimido', 400.00, 700.00, 9, 'Disponível', 6, '2024-06-01', '2027-05-01', '2025-01-21 12:13:21', '2025-01-30 14:49:31', 130, 4, NULL, 1, 8902292701189, NULL);
INSERT INTO `tb_produtos` VALUES (245, 'Nitrofurantoina 100mg', '', 'antibiotico', 13, 'Comprimido', 205.00, 400.00, 20, 'Disponível', 6, '2023-07-01', '2026-06-01', '2025-01-21 12:26:11', '2025-01-21 11:26:11', 130, 1, NULL, 1, 8902292000275, NULL);
INSERT INTO `tb_produtos` VALUES (246, 'Polygel xarope', '', 'acido flautulencia', 13, 'Comprimido', 550.00, 850.00, 9, 'Disponível', 6, '2024-06-01', '2027-05-01', '2025-01-21 12:47:30', '2025-01-26 17:36:32', 130, 2, NULL, 1, 8902292103945, NULL);
INSERT INTO `tb_produtos` VALUES (247, 'Polygel saqueta', '', 'acidez flatulento', 13, 'Comprimido', 60.00, 200.00, 60, 'Disponível', 6, '2024-09-01', '2027-08-01', '2025-01-21 12:49:47', '2025-01-21 11:49:47', 130, 2, NULL, 1, 118902292002788, NULL);
INSERT INTO `tb_produtos` VALUES (248, 'Polygel comprimido', '', 'da acidez e flutulento', 13, 'Comprimido', 83.00, 200.00, 30, 'Disponível', 6, '2024-09-01', '2027-08-01', '2025-01-21 12:52:41', '2025-01-21 11:52:41', 130, 1, NULL, 1, 108902292502182, NULL);
INSERT INTO `tb_produtos` VALUES (249, 'shaltoux pastilha', '', 'gargata', 13, 'Comprimido', 16.00, 50.00, 131, 'Disponível', 6, '2024-07-01', '2027-06-01', '2025-01-21 13:02:26', '2025-01-30 19:01:22', 130, 7, NULL, 1, 108902292002798, NULL);
INSERT INTO `tb_produtos` VALUES (250, 'shaltoux pastilha mel', '', 'alivio a dor de gargata', 13, 'Comprimido', 19.00, 50.00, 64, 'Disponível', 6, '2024-05-01', '2027-04-01', '2025-01-21 13:05:36', '2025-01-31 18:47:46', 130, 7, NULL, 1, 8902292001555, NULL);
INSERT INTO `tb_produtos` VALUES (251, 'Shaltoux xarope expectorante', '', 'expectorante', 13, 'Comprimido', 550.00, 850.00, 9, 'Disponível', 6, '2024-08-01', '2027-07-01', '2025-01-21 13:19:54', '2025-01-26 17:36:31', 130, 2, NULL, 1, 108902292103976, NULL);
INSERT INTO `tb_produtos` VALUES (252, 'Sulfatrim forte', '', 'antibiotico', 13, 'Comprimido', 299.00, 500.00, 12, 'Disponível', 6, '2024-04-01', '2027-03-01', '2025-01-21 13:21:45', '2025-01-31 20:44:38', 130, 1, NULL, 1, 8902292501581, NULL);
INSERT INTO `tb_produtos` VALUES (253, 'sultrimix 240mg', '', 'antibiotico', 13, 'Comprimido', 3760.00, 5700.00, 1, 'Disponível', 6, '2022-12-01', '2025-11-01', '2025-01-21 13:23:34', '2025-01-21 12:23:34', 130, 2, NULL, 1, 5844162, NULL);
INSERT INTO `tb_produtos` VALUES (254, 'super apetite', '', 'para apetite', 13, 'Comprimido', 100.00, 200.00, 96, 'Disponível', 6, '2023-11-01', '2026-10-01', '2025-01-21 13:31:00', '2025-01-31 09:37:27', 130, 1, NULL, 2, 106156000376103, NULL);
INSERT INTO `tb_produtos` VALUES (255, 'tanzol 400mg comprimido', '', 'anti protozuario', 13, 'Comprimido', 95.00, 200.00, 15, 'Disponível', 6, '2024-07-01', '2027-06-01', '2025-01-21 13:34:07', '2025-01-30 15:19:40', 130, 1, NULL, 1, 108902292000183, NULL);
INSERT INTO `tb_produtos` VALUES (256, 'tanzol xarope', '', 'protozuario', 13, 'Comprimido', 185.00, 350.00, 23, 'Disponível', 6, '2024-06-01', '0027-05-01', '2025-01-21 13:37:19', '2025-01-30 14:23:18', 130, 2, NULL, 1, 108902292503950, NULL);
INSERT INTO `tb_produtos` VALUES (257, 'Voltaren 50mg', '', 'anti inflamatorio', 13, 'Comprimido', 1166.00, 2000.00, 6, 'Disponível', 6, '2024-04-01', '2026-10-01', '2025-01-21 13:41:03', '2025-01-21 12:41:03', 130, 1, NULL, 1, 9427831, NULL);
INSERT INTO `tb_produtos` VALUES (258, 'agua para injecao', '', 'distilada', 13, 'Comprimido', 28.00, 100.00, 96, 'Disponível', 6, '2024-01-01', '2027-12-01', '2025-01-21 13:43:14', '2025-01-26 17:36:32', 130, 7, NULL, 1, 111111, NULL);
INSERT INTO `tb_produtos` VALUES (259, 'Dagesil 50mg', '', 'anti inflamatorio', 13, 'Comprimido', 400.00, 1000.00, 4, 'Disponível', 6, '2023-02-01', '2025-11-01', '2025-01-21 13:47:12', '2025-01-21 12:47:12', 130, 1, NULL, 1, 5839063, NULL);
INSERT INTO `tb_produtos` VALUES (260, 'Loratadina 10mg', '', 'anti alergico', 13, 'Comprimido', 2550.00, 1950.00, 2, 'Disponível', 6, '2023-02-01', '2026-02-01', '2025-01-21 13:49:27', '2025-01-21 12:49:27', 130, 1, NULL, 1, 5100094, NULL);
INSERT INTO `tb_produtos` VALUES (261, 'Transpulmina pomada', '', 'pomada', 13, 'Comprimido', 6900.00, 10500.00, 1, 'Disponível', 6, '2024-02-01', '2028-04-01', '2025-01-21 13:51:27', '2025-01-21 12:51:27', 130, 4, NULL, 1, 9775411, NULL);
INSERT INTO `tb_produtos` VALUES (262, 'inalador', '', 'inalador', 13, 'Comprimido', 138.00, 250.00, 21, 'Disponível', 10, '2024-09-01', '2027-08-01', '2025-01-21 14:00:45', '2025-01-31 13:56:57', 130, 7, NULL, 1, 3252, NULL);
INSERT INTO `tb_produtos` VALUES (263, 'Cesabut 150g', '', 'fungico', 13, 'Comprimido', 538.00, 1000.00, 8, 'Disponível', 4, '2024-03-01', '2027-02-01', '2025-01-21 14:16:18', '2025-02-01 07:17:51', 130, 4, NULL, 1, 8906117735144, NULL);
INSERT INTO `tb_produtos` VALUES (264, 'Clindamecina 150mg', '', 'antibiotico', 13, 'Comprimido', 839.00, 2000.00, 4, 'Disponível', 4, '2024-07-01', '2026-12-01', '2025-01-21 14:23:35', '2025-01-21 13:23:35', 130, 3, NULL, 1, 8906117730354, NULL);
INSERT INTO `tb_produtos` VALUES (265, 'Clindamecina 300mg', '', 'antibiotico', 13, 'Comprimido', 1627.00, 2500.00, 4, 'Disponível', 4, '2024-09-01', '2027-02-01', '2025-01-21 14:32:31', '2025-01-21 13:32:31', 130, 3, NULL, 1, 8906117730514, NULL);
INSERT INTO `tb_produtos` VALUES (266, 'diclomex gel balsamo', '', 'analgésico', 13, 'Comprimido', 155.00, 700.00, 9, 'Disponível', 4, '2024-06-01', '2027-05-01', '2025-01-21 14:35:04', '2025-01-30 07:25:25', 130, 4, NULL, 1, 8906047263458, NULL);
INSERT INTO `tb_produtos` VALUES (267, 'Dilaclan 125mg xarope', '', 'antibiotico', 13, 'Comprimido', 1897.00, 3000.00, 3, 'Disponível', 4, '2023-03-01', '2026-02-01', '2025-01-21 14:39:15', '2025-01-21 13:39:15', 130, 2, NULL, 1, 5603690003945, NULL);
INSERT INTO `tb_produtos` VALUES (268, 'Hidrocortisona 5mg', '', 'alergias', 13, 'Comprimido', 338.00, 600.00, 7, 'Disponível', 4, '2024-02-01', '2027-02-01', '2025-01-21 14:41:51', '2025-01-30 17:59:00', 130, 1, NULL, 1, 8906047263519, NULL);
INSERT INTO `tb_produtos` VALUES (269, 'Flas ovulo vaginal', '', 'infecção', 13, 'Comprimido', 1725.00, 2600.00, 9, 'Disponível', 4, '2024-08-01', '2026-07-01', '2025-01-21 14:43:44', '2025-01-30 15:01:53', 130, 1, NULL, 1, 8904385512412, NULL);
INSERT INTO `tb_produtos` VALUES (270, 'Diclofenac 100mg', '1', 'inflamatorio', 13, 'Comprimido', 56.00, 200.00, 24, 'Disponível', 10, '2023-03-01', '2026-02-01', '2025-01-21 14:46:22', '2025-01-30 17:58:55', 130, 1, NULL, 1, 555, NULL);
INSERT INTO `tb_produtos` VALUES (271, 'Pro-Vital Materno', '', 'gravidez', 13, 'Comprimido', 1771.00, 4000.00, 5, 'Disponível', 4, '2024-08-01', '2026-07-01', '2025-01-21 14:48:39', '2025-01-21 13:48:39', 130, 1, NULL, 1, 8904385514065, NULL);
INSERT INTO `tb_produtos` VALUES (272, 'Pro-vital +50 Mulher', '', 'vitaminas', 13, 'Comprimido', 1978.00, 4000.00, 4, 'Disponível', 4, '2024-09-01', '2026-08-01', '2025-01-21 14:51:07', '2025-01-25 12:21:02', 130, 1, NULL, 1, 8904385516885, NULL);
INSERT INTO `tb_produtos` VALUES (273, 'vitamina c gota /scorvitex', '', 'vitamina', 13, 'Comprimido', 299.00, 600.00, 10, 'Disponível', 4, '2024-05-01', '2027-04-01', '2025-01-21 14:53:31', '2025-01-21 13:53:31', 130, 2, NULL, 1, 8906047260143, NULL);
INSERT INTO `tb_produtos` VALUES (274, 'Serloc  comprimido', '', 'analgésico', 13, 'Comprimido', 1403.00, 2000.00, 3, 'Disponível', 4, '2024-03-01', '2027-02-01', '2025-01-21 14:55:20', '2025-01-21 13:55:20', 130, 1, NULL, 1, 8906117730873, NULL);
INSERT INTO `tb_produtos` VALUES (276, 'Duphaston 10 mg', '', 'Indicado para gravidez', 13, 'Comprimido', 8990.00, 13500.00, 2, 'Disponível', 6, '2024-07-01', '2025-01-21', '2025-01-21 16:34:30', '2025-01-21 15:34:30', 129, 1, NULL, 20, 8002660026576, '2025-01-21');
INSERT INTO `tb_produtos` VALUES (277, 'Folifer + ácido indiano', '', 'Indicado para grávidas ou pacientes com anemia', 13, 'Comprimido', 49.00, 200.00, 40, 'Disponível', 6, '2024-05-01', '2027-04-01', '2025-01-21 16:44:02', '2025-01-21 15:44:02', 129, 1, NULL, 10, 18904286629902, '2025-01-21');
INSERT INTO `tb_produtos` VALUES (278, 'amidol (Paracetamol) 500mg', '', 'analgésico', 13, 'Comprimido', 47.00, 200.00, 43, 'Disponível', 6, '2024-07-01', '2027-06-01', '2025-01-21 16:48:03', '2025-01-30 15:17:31', 130, 1, NULL, 1, 697102148006, '2025-01-06');
INSERT INTO `tb_produtos` VALUES (279, 'Aminofilina 100 mg', '', 'Indicado para tratar Asma', 13, 'Comprimido', 99.00, 200.00, 30, 'Disponível', 8, '2024-01-01', '2026-12-01', '2025-01-21 16:50:56', '2025-01-21 15:50:56', 129, 1, NULL, 10, 18904286607238, '2025-01-21');
INSERT INTO `tb_produtos` VALUES (280, 'borboleta G23', '', 'agulha', 13, 'Comprimido', 31.00, 100.00, 93, 'Disponível', 4, '2024-02-04', '2029-02-01', '2025-01-21 16:52:47', '2025-01-26 17:36:32', 130, 7, NULL, 1, 0, '2025-01-07');
INSERT INTO `tb_produtos` VALUES (281, 'seringa 2ml', '', 'seringa', 13, 'Comprimido', 31.00, 100.00, 98, 'Disponível', 4, '2024-06-24', '2029-04-01', '2025-01-21 16:55:25', '2025-01-27 18:25:37', 130, 7, NULL, 1, 9999, '0005-01-07');
INSERT INTO `tb_produtos` VALUES (282, 'Amoxicilina + Ácido Clavulani 125mg+31,25mg', '', 'Antibiótico', 13, 'Comprimido', 1890.00, 2850.00, 2, 'Disponível', 11, '2025-01-21', '2025-10-01', '2025-01-21 17:21:41', '2025-01-30 17:49:30', 129, 2, NULL, 1, 2563088, '2025-01-21');
INSERT INTO `tb_produtos` VALUES (283, 'Amoxicilina 250 mg/5ml', '', 'Antibiótico', 13, 'Comprimido', 2110.00, 3200.00, 1, 'Disponível', 11, '2025-01-21', '2026-08-01', '2025-01-21 17:28:51', '2025-01-30 17:48:15', 129, 2, NULL, 1, 5022280, '2025-01-21');
INSERT INTO `tb_produtos` VALUES (284, 'Normegyl 200mg+200mg', '', 'antibiotico', 13, 'Comprimido', 852.00, 1300.00, 10, 'Disponível', 4, '0024-02-02', '0027-02-01', '2025-01-21 17:54:05', '2025-01-21 16:54:05', 130, 1, NULL, 10, 8906117730255, '2025-01-07');
INSERT INTO `tb_produtos` VALUES (285, 'Artesunato 120mg', '', 'Malária', 13, 'Comprimido', 1300.00, 1950.00, 2, 'Disponível', 11, '2024-02-01', '2026-01-01', '2025-01-21 17:56:35', '2025-01-21 16:56:35', 129, 6, NULL, 1, 6290360150758, '2025-01-21');
INSERT INTO `tb_produtos` VALUES (286, 'Artesunato 30mg injetável', '', 'Tratamento contra malária grave', 13, 'Comprimido', 700.00, 1200.00, 2, 'Disponível', 11, '2024-06-01', '2025-05-01', '2025-01-21 18:00:19', '2025-01-21 17:00:19', 129, 6, NULL, 1, 629036015130, '2025-01-21');
INSERT INTO `tb_produtos` VALUES (287, 'Artesunato injetável 60mg', '', 'Malária grave', 13, 'Comprimido', 990.00, 1500.00, 2, 'Disponível', 11, '2024-02-01', '2026-01-01', '2025-01-21 18:07:00', '2025-01-21 17:07:00', 129, 6, NULL, 1, 6290360150741, '2025-01-21');
INSERT INTO `tb_produtos` VALUES (288, 'Normegyl 100mg+100mg', '', 'antibiotico', 13, 'Comprimido', 1023.00, 1600.00, 4, 'Disponível', 4, '2024-07-01', '2027-06-01', '2025-01-21 18:07:59', '2025-01-26 17:36:32', 130, 2, NULL, 1, 8906117732594, '2027-06-01');
INSERT INTO `tb_produtos` VALUES (289, 'Artesunato injetável 180mg', '', 'Malária grave', 13, 'Comprimido', 1640.00, 2500.00, 2, 'Disponível', 11, '2024-07-01', '2026-06-01', '2025-01-21 18:11:08', '2025-01-21 17:11:08', 129, 6, NULL, 1, 6290360150772, '2025-01-21');
INSERT INTO `tb_produtos` VALUES (290, 'Artesunato pó injetável 240mg', '', 'Malária grave', 13, 'Comprimido', 1690.00, 2600.00, 2, 'Disponível', 11, '2024-02-01', '2026-01-01', '2025-01-21 18:14:01', '2025-01-21 17:14:01', 129, 6, NULL, 1, 6290360150789, '2025-01-21');
INSERT INTO `tb_produtos` VALUES (291, 'Mixacol 100ml', '1', 'Gripe', 13, 'Comprimido', 517.00, 850.00, 8, 'Disponível', 4, '2024-02-01', '2027-01-01', '2025-01-21 18:17:19', '2025-01-30 17:47:13', 130, 2, NULL, 1, 8906117730491, '2025-01-07');
INSERT INTO `tb_produtos` VALUES (292, 'Ben-u-ron xarope 40 mg/ml', '', 'Analgessico', 13, 'Comprimido', 3400.00, 5500.00, 1, 'Disponível', 11, '2025-01-21', '2026-10-01', '2025-01-21 18:24:15', '2025-01-30 17:42:57', 129, 2, NULL, 1, 8626507, '2025-01-21');
INSERT INTO `tb_produtos` VALUES (293, 'DAVITAMINA xarope 100ml', '1', 'Vitamina', 16, 'Comprimido', 440.00, 750.00, 9, 'Disponível', 11, '2024-07-01', '2026-06-01', '2025-01-21 18:48:05', '2025-01-30 17:46:55', 129, 2, NULL, 1, 6290360152578, '2025-01-21');
INSERT INTO `tb_produtos` VALUES (294, 'Ben-u-ron', '', 'analgésico', 13, 'Comprimido', 1185.00, 1800.00, 2, 'Disponível', 4, '2024-01-21', '2028-07-01', '2025-01-21 18:56:15', '2025-01-21 17:56:15', 130, 5, NULL, 4, 8168500, '2025-01-07');
INSERT INTO `tb_produtos` VALUES (295, 'Ibuprofeno 200 mg', '1', 'Analgéssico', 13, 'Comprimido', 84.00, 200.00, 11, 'Disponível', 11, '2024-01-01', '2026-12-01', '2025-01-21 18:59:34', '2025-01-30 17:46:51', 129, 1, NULL, 10, 6290360, '2025-01-21');
INSERT INTO `tb_produtos` VALUES (296, 'Protetor solar UVA+UVB', '', 'Para proteger do sol', 15, 'Comprimido', 2420.00, 3500.00, 1, 'Disponível', 11, '2024-07-01', '2027-07-01', '2025-01-21 19:12:13', '2025-01-21 18:12:13', 129, 7, NULL, 1, 6290361004814, '2025-01-21');
INSERT INTO `tb_produtos` VALUES (297, 'Termômetro Digital', '', 'Para medir temperatura', 18, 'Comprimido', 1200.00, 1800.00, 4, 'Disponível', 11, '2024-05-01', '2030-05-01', '2025-01-21 19:18:59', '2025-01-21 18:18:59', 129, 7, NULL, 1, 8904206224586, '2025-01-21');
INSERT INTO `tb_produtos` VALUES (298, 'Ben-u-ron 250mg', '', 'analgésico', 13, 'Comprimido', 1185.00, 1800.00, 4, 'Disponível', 4, '2024-01-21', '2028-05-01', '2025-01-21 19:21:09', '2025-01-21 18:21:09', 130, 5, NULL, 5, 8168518, '2025-01-07');
INSERT INTO `tb_produtos` VALUES (299, 'Repelente mosquito', '1', 'Anti mosquito', 21, 'Comprimido', 600.00, 900.00, 5, 'Disponível', 11, '2024-02-01', '2027-01-01', '2025-01-21 19:28:46', '2025-01-30 17:46:37', 129, 7, NULL, 1, 62903601504413, '2025-01-21');
INSERT INTO `tb_produtos` VALUES (300, 'Teste Gravidez', '1', 'Teste de gravidez', 21, 'Comprimido', 2990.00, 500.00, 4, 'Disponível', 4, '2024-01-09', '2027-08-01', '2025-01-21 19:45:57', '2025-01-31 18:59:06', 130, 7, NULL, 1, 8906047267135, '2025-01-07');
INSERT INTO `tb_produtos` VALUES (302, 'Cesartem 20/120 (24 comp.)', '1', 'Antipaludico', 13, 'Comprimido', 494.00, 1200.00, 4, 'Disponível', 4, '2024-03-01', '2026-02-01', '2025-01-21 20:07:26', '2025-01-30 17:46:27', 129, 1, NULL, 6, 8906117731993, '2025-01-21');
INSERT INTO `tb_produtos` VALUES (305, 'Cesartem 80/480 (6 comp.)', '1', 'Antipaludico', 13, 'Comprimido', 563.00, 1200.00, 9, 'Disponível', 4, '2024-06-01', '2026-05-01', '2025-01-21 20:14:03', '2025-01-30 17:46:34', 129, 1, NULL, 6, 8906117732617, '2025-01-07');
INSERT INTO `tb_produtos` VALUES (307, 'Teste de gravidez', '', 'Teste de gravidez', 21, 'Comprimido', 120.00, 250.00, 50, 'Disponível', 4, '2024-04-01', '2026-03-01', '2025-01-21 20:20:48', '2025-01-21 19:20:48', 130, 7, NULL, 1, 906047267135, '2025-01-07');
INSERT INTO `tb_produtos` VALUES (308, 'Mixakoff', '', 'Anti gripal', 13, 'Comprimido', 64.00, 200.00, 51, 'Disponível', 4, '2024-07-01', '2027-06-01', '2025-01-21 20:59:59', '2025-02-01 11:22:49', 130, 1, NULL, 4, 8906117730675, '2025-01-07');
INSERT INTO `tb_produtos` VALUES (309, 'Omeprazol 20mg', '', 'antiácido', 13, 'Comprimido', 280.00, 450.00, 18, 'Disponível', 4, '2025-04-01', '2026-03-01', '2025-01-21 21:13:42', '2025-01-30 15:01:53', 130, 3, NULL, 10, 8906117731238, '2025-01-07');
INSERT INTO `tb_produtos` VALUES (310, 'Artemether NC 80 mg', '', 'Anti malária', 13, 'Comprimido', 88.00, 250.00, 99, 'Disponível', 4, '2024-06-01', '2027-06-01', '2025-01-21 21:19:42', '2025-01-30 14:30:32', 129, 1, NULL, 1, 8906047261775, '2025-01-07');
INSERT INTO `tb_produtos` VALUES (311, 'Zentel 20mg', '', 'Disparazitante', 20, 'Comprimido', 3852.00, 5800.00, 1, 'Disponível', 4, '2024-01-21', '2027-03-01', '2025-01-21 21:23:41', '2025-01-21 20:23:41', 130, 2, NULL, 1, 8644906, '2025-01-07');
INSERT INTO `tb_produtos` VALUES (312, 'Artemether NC 40', '', 'Anti malária', 13, 'Comprimido', 98.00, 250.00, 102, 'Disponível', 4, '2024-07-01', '2027-07-01', '2025-01-21 21:27:59', '2025-01-30 15:01:53', 129, 6, NULL, 1, 8906047260648, '2025-01-07');
INSERT INTO `tb_produtos` VALUES (313, 'Artemether NC 20', '', 'Anti malária', 13, 'Comprimido', 92.00, 250.00, 112, 'Disponível', 4, '2024-06-07', '2027-07-07', '2025-01-21 21:32:55', '2025-01-30 14:30:32', 129, 6, NULL, 1, 80906047260631, '2025-01-21');
INSERT INTO `tb_produtos` VALUES (315, 'Neobac-Neomicina+Bacitracina', '', 'Infencção', 13, 'Comprimido', 525.00, 850.00, 8, 'Disponível', 4, '2024-07-01', '2025-06-01', '2025-01-21 21:43:16', '2025-01-30 14:49:31', 130, 4, NULL, 1, 8906117736271, '2025-01-07');
INSERT INTO `tb_produtos` VALUES (316, 'Nolotil', '', 'analgésico', 13, 'Comprimido', 938.00, 2500.00, 12, 'Disponível', 4, '2024-01-21', '2026-05-01', '2025-01-21 21:55:08', '2025-01-21 20:55:08', 130, 3, NULL, 5, 9512434, '2025-01-07');
INSERT INTO `tb_produtos` VALUES (317, 'Metronidazol 500mg/100ml Sol', '', 'Para tratar infecções pelvicas', 13, 'Comprimido', 437.00, 750.00, 19, 'Disponível', 4, '2024-02-01', '2027-02-01', '2025-01-22 10:26:37', '2025-01-26 17:36:32', 129, 7, NULL, 1, 6939364641236, '2025-01-07');
INSERT INTO `tb_produtos` VALUES (318, 'Soro oral sem sabor', '', 'Para reidratação', 16, 'Comprimido', 88.00, 250.00, 32, 'Disponível', 4, '2024-06-01', '2027-05-01', '2025-01-22 10:31:48', '2025-02-01 17:05:20', 129, 7, NULL, 1, 8906047263588, '2025-01-07');
INSERT INTO `tb_produtos` VALUES (320, 'Ciprofloxacina soro', '', 'antibiotico', 13, 'Comprimido', 368.00, 700.00, 19, 'Disponível', 4, '0023-02-10', '0026-02-09', '2025-01-22 10:36:46', '2025-01-26 17:36:32', 129, 7, NULL, 1, 8906047262284, '2025-01-07');
INSERT INTO `tb_produtos` VALUES (321, 'Soro oral sabor laranja', '', 'Para reidratação', 16, 'Comprimido', 79.00, 200.00, 43, 'Disponível', 4, '2024-06-01', '2027-05-01', '2025-01-22 10:39:35', '2025-01-30 18:38:12', 129, 7, NULL, 1, 906047263588, '2025-01-07');
INSERT INTO `tb_produtos` VALUES (322, 'Vitamina B complexo', '1', 'para nauseas', 16, 'Comprimido', 50.00, 200.00, 43, 'Disponível', 4, '2024-03-01', '2026-02-01', '2025-01-22 10:50:52', '2025-01-30 14:49:31', 129, 1, NULL, 10, 8906117730835, '2025-01-01');
INSERT INTO `tb_produtos` VALUES (323, 'Diclofenac 100mg supositório', '', 'Dor', 13, 'Comprimido', 535.00, 1000.00, 9, 'Disponível', 4, '2024-01-01', '2026-12-01', '2025-01-22 10:51:43', '2025-01-24 18:22:43', 129, 5, NULL, 5, 8906047265810, '2025-01-07');
INSERT INTO `tb_produtos` VALUES (326, 'Vitamina B Complexo', '1', 'para nauseas', 16, 'Comprimido', 345.00, 700.00, 10, 'Disponível', 4, '2024-01-09', '2026-01-08', '2025-01-22 11:09:10', '2025-01-26 20:12:57', 129, 2, NULL, 1, 8904474400385, '2025-01-07');
INSERT INTO `tb_produtos` VALUES (327, 'Flash Gyno 30mg', '', 'Cuidados íntimos', 14, 'Comprimido', 1069.00, 1800.00, 5, 'Disponível', 4, '2023-05-01', '2027-04-01', '2025-01-22 11:10:40', '2025-01-22 10:10:40', 129, 7, NULL, 1, 8906117737513, '2025-01-07');
INSERT INTO `tb_produtos` VALUES (328, 'Seringas descartável 5ml/CC', '', 'Seringas descartável', 18, 'Comprimido', 34.00, 100.00, 54, 'Disponível', 4, '2024-04-01', '2029-04-01', '2025-01-22 11:20:32', '2025-01-31 13:06:23', 129, 7, NULL, 1, 8904385516380, '2025-01-07');
INSERT INTO `tb_produtos` VALUES (329, 'Seringas 10ml', '', 'seringa 10ml', 19, 'Comprimido', 40.00, 100.00, 81, 'Disponível', 4, '2024-01-04', '2029-01-04', '2025-01-22 11:31:14', '2025-01-31 09:28:36', 129, 6, NULL, 1, 240411, '2025-01-07');
INSERT INTO `tb_produtos` VALUES (330, 'Sistema 1ml para soro', '', 'suporte', 19, 'Comprimido', 105.00, 350.00, 22, 'Disponível', 10, '2024-04-01', '2027-03-01', '2025-01-22 15:51:45', '2025-01-26 17:36:32', 129, 7, NULL, 1, 23232521, '2025-01-08');
INSERT INTO `tb_produtos` VALUES (331, 'Gaze', '', 'cobrir ferida', 18, 'Comprimido', 230.00, 700.00, 9, 'Disponível', 10, '2023-12-01', '2028-11-01', '2025-01-22 16:01:47', '2025-02-01 13:48:29', 129, 7, NULL, 1, 231211, '2025-01-08');
INSERT INTO `tb_produtos` VALUES (332, 'Cesartem 20/120 (6 comp.)', '', 'Coartem para crianças', 13, 'Comprimido', 147.00, 500.00, 68, 'Disponível', 4, '2024-08-01', '2026-07-01', '2025-01-22 19:53:21', '2025-01-30 18:38:12', 129, 1, NULL, 6, 8906117736653, '2025-01-07');
INSERT INTO `tb_produtos` VALUES (333, 'Varfine', '', 'anticoagulante', 13, 'Comprimido', 3070.00, 4900.00, 3, 'Disponível', 8, '2025-01-24', '2028-09-01', '2025-01-24 16:44:42', '2025-01-24 15:44:42', 129, 1, NULL, 20, 23005, '2025-01-24');
INSERT INTO `tb_produtos` VALUES (334, 'Ultraproct 1mg+40mg sup', '', 'Hemorroide', 13, 'Comprimido', 5725.00, 6600.00, 2, 'Disponível', 6, '2027-01-24', '2027-04-30', '2025-01-24 16:51:08', '2025-01-24 15:51:08', 129, 5, NULL, 5, 41266, '2025-01-24');
INSERT INTO `tb_produtos` VALUES (335, 'Cêgripe', '', 'para gripes', 13, 'Comprimido', 5700.00, 6500.00, 2, 'Disponível', 12, '2025-01-24', '2027-07-01', '2025-01-24 17:07:51', '2025-01-24 16:07:51', 129, 3, NULL, 10, 24056, '2025-01-24');
INSERT INTO `tb_produtos` VALUES (336, 'Ibuprofeno 600 mg', '', 'antiinflamatorio', 13, 'Comprimido', 627.00, 750.00, 12, 'Disponível', 12, '2025-01-24', '2026-07-01', '2025-01-24 17:20:31', '2025-01-24 16:20:31', 129, 1, NULL, 10, 23050, '2025-01-24');
INSERT INTO `tb_produtos` VALUES (337, 'Com-Com Multivitamina', '', 'Comprimidos multivitamínicps', 16, 'Comprimido', 99.00, 200.00, 27, 'Disponível', 12, '2025-12-01', '2025-11-01', '2025-01-24 17:24:59', '2025-02-01 13:18:33', 129, 1, NULL, 10, 12, '2025-01-25');
INSERT INTO `tb_produtos` VALUES (338, 'ZIBU PLUS', '', 'analgésico', 13, 'Comprimido', 209.00, 400.00, 5, 'Disponível', 12, '2025-07-01', '2027-06-01', '2025-01-24 17:29:45', '2025-01-30 11:26:10', 129, 1, NULL, 10, 24004, '2025-01-24');
INSERT INTO `tb_produtos` VALUES (339, 'Metronidazol xarope 125mg/5ml', '', 'espectoração', 13, 'Comprimido', 330.00, 750.00, 4, 'Disponível', 8, '2024-05-01', '2027-04-01', '2025-01-24 17:44:22', '2025-01-27 19:05:59', 129, 2, NULL, 1, 240510, '2025-01-24');
INSERT INTO `tb_produtos` VALUES (340, 'Metronidazol xarope 250mg/5ml', '', 'Suspensão', 13, 'Comprimido', 525.00, 1000.00, 5, 'Disponível', 8, '2024-09-01', '2027-08-01', '2025-01-24 17:54:49', '2025-01-24 16:54:49', 129, 2, NULL, 1, 18904286623764, '2025-01-24');
INSERT INTO `tb_produtos` VALUES (341, 'Exomol (Paracetamol) 40mg xarope', '', 'analgesico', 13, 'Comprimido', 1150.00, 2000.00, 3, 'Disponível', 14, '2025-01-24', '2026-01-01', '2025-01-24 18:03:43', '2025-01-26 19:28:24', 129, 2, NULL, 1, 3760319490271, '2025-01-24');
INSERT INTO `tb_produtos` VALUES (342, 'Exomol (Paracetamol) 500mg comprimido PT', '', 'analgesico', 13, 'Comprimido', 218.00, 500.00, 89, 'Disponível', 14, '2025-01-24', '2027-06-01', '2025-01-24 18:06:46', '2025-01-31 20:44:38', 129, 1, NULL, 10, 3766031990509, '2025-01-24');
INSERT INTO `tb_produtos` VALUES (343, 'Amoxicilina 250mg', '1', 'antibiotico', 13, 'Comprimido', 150.00, 300.00, 95, 'Disponível', 4, '2023-06-05', '2026-05-05', '2025-01-25 21:26:23', '2025-01-30 14:35:40', 101, 3, NULL, 10, 8907821084733, '2025-01-02');
INSERT INTO `tb_produtos` VALUES (344, 'Amlodipina 10mg', '2', 'Hipertensão', 13, 'Comprimido', 550.00, 850.00, 4, 'Disponível', 14, '2024-02-01', '2026-09-02', '2025-01-25 21:54:57', '2025-01-30 15:01:53', 101, 1, NULL, 10, 3760319490677, '2025-01-20');
INSERT INTO `tb_produtos` VALUES (346, 'Amoxicilina 500mg', '1', 'antibiotico', 13, 'Comprimido', 285.00, 450.00, 95, 'Disponível', 7, '2024-01-03', '2027-02-01', '2025-01-26 17:27:33', '2025-01-30 17:54:12', 129, 1, NULL, 1, 6290360154, '2025-01-06');
INSERT INTO `tb_produtos` VALUES (347, 'bronex xarope adulto', '1', 'anti tussico', 13, 'Comprimido', 450.00, 1000.00, 4, 'Disponível', 8, '2024-07-01', '2027-06-01', '2025-01-26 17:45:33', '2025-01-26 17:36:31', 129, 2, NULL, 1, 18904286615097, '2025-01-01');
INSERT INTO `tb_produtos` VALUES (348, 'OMERAP (omeprazol sódio 40mg)', '1', 'para injeção', 13, 'Comprimido', 500.00, 750.00, 10, 'Disponível', 15, '2024-05-01', '2026-10-01', '2025-01-27 20:17:31', '2025-01-27 19:17:31', 129, 1, NULL, 1, 8906101706563, '2025-01-27');
INSERT INTO `tb_produtos` VALUES (349, 'Hidrocortizona creme 15 G', '1', 'anti alergico', 13, 'Comprimido', 390.00, 600.00, 9, 'Disponível', 15, '2023-02-01', '2026-01-31', '2025-01-27 20:24:08', '2025-02-01 14:13:32', 129, 4, NULL, 10, 8906101701476, '2025-01-27');
INSERT INTO `tb_produtos` VALUES (350, 'Doxiciclina Português', '2', 'antibiótico', 13, 'Comprimido', 5778.00, 8700.00, 1, 'Disponível', 15, '2025-01-27', '2026-05-01', '2025-01-27 20:29:41', '2025-01-27 19:29:41', 129, 1, NULL, 16, 2302325, '2025-01-27');
INSERT INTO `tb_produtos` VALUES (351, 'Nistatina', '1', 'antifúngico', 13, 'Comprimido', 580.00, 900.00, 4, 'Disponível', 11, '2024-04-01', '2027-03-01', '2025-01-27 20:51:32', '2025-01-27 19:51:32', 129, 2, NULL, 4, 6290360152325, '2025-01-27');
INSERT INTO `tb_produtos` VALUES (352, 'Polygynax', '6', 'antiinfeccioso', 13, 'Comprimido', 3925.00, 5900.00, 2, 'Disponível', 11, '2024-07-01', '2026-07-01', '2025-01-27 20:58:21', '2025-01-27 19:58:21', 129, 3, NULL, 6, 3400970000968, '2025-01-27');
INSERT INTO `tb_produtos` VALUES (353, 'Rufenac  Spray', '1', 'Alivio da dor', 13, 'Comprimido', 790.00, 1200.00, 3, 'Disponível', 6, '2024-06-01', '2027-05-01', '2025-01-28 11:49:19', '2025-01-28 10:49:19', 129, 7, NULL, 1, 108902292107424, '2025-01-27');
INSERT INTO `tb_produtos` VALUES (354, 'Betasol Plus creme 15g', '1', 'infecções', 13, 'Comprimido', 225.00, 400.00, 10, 'Disponível', 6, '2023-08-01', '2026-07-01', '2025-01-28 11:55:08', '2025-01-28 10:55:08', 129, 4, NULL, 1, 8902292106748, '2025-01-27');
INSERT INTO `tb_produtos` VALUES (355, 'Betasol creme', '1', 'anti inflamatório', 13, 'Comprimido', 240.00, 400.00, 9, 'Disponível', 6, '2024-08-01', '2027-07-01', '2025-01-28 11:57:38', '2025-01-28 14:10:29', 129, 4, NULL, 1, 8902292501987, '2025-01-27');
INSERT INTO `tb_produtos` VALUES (356, 'Zyrext 1mg/ml', '1', 'Alivio dos sintomas nasais', 13, 'Comprimido', 500.00, 750.00, 3, 'Disponível', 8, '2023-03-01', '2026-02-01', '2025-01-28 12:07:06', '2025-01-28 11:07:06', 129, 2, NULL, 1, 18904286631318, '2025-01-27');
INSERT INTO `tb_produtos` VALUES (357, 'Penicilina pomada 20g', '1', 'antibiótico', 13, 'Comprimido', 375.00, 600.00, 9, 'Disponível', 8, '2024-05-01', '2027-04-01', '2025-01-28 12:16:48', '2025-02-01 13:48:29', 129, 4, NULL, 1, 18904286642451, '2025-01-27');
INSERT INTO `tb_produtos` VALUES (358, 'NYSTATIN pomada', '1', 'intimo', 13, 'Comprimido', 622.00, 1000.00, 6, 'Disponível', 8, '2023-07-01', '2027-06-01', '2025-01-28 12:19:41', '2025-01-28 11:19:41', 129, 4, NULL, 1, 18904286629452, '2025-01-27');
INSERT INTO `tb_produtos` VALUES (359, 'Haldolex Haloperidol BP 5mg', '1', 'antipsicótico', 13, 'Comprimido', 550.00, 900.00, 2, 'Disponível', 8, '2024-07-01', '2026-06-01', '2025-01-28 12:25:59', '2025-01-28 11:25:59', 129, 1, NULL, 30, 18904286614595, '2025-01-27');
INSERT INTO `tb_produtos` VALUES (360, 'Tinidazol BP 500mg', '1', 'combate os micro organismos', 13, 'Comprimido', 220.00, 350.00, 10, 'Disponível', 8, '2024-05-01', '2027-04-01', '2025-01-28 12:35:34', '2025-01-28 11:35:34', 129, 1, NULL, 4, 38904286608716, '2025-01-27');
INSERT INTO `tb_produtos` VALUES (361, 'Africox etoricoxibe 60mg', '1', 'osteoartrite', 13, 'Comprimido', 495.00, 800.00, 2, 'Disponível', 8, '2023-07-01', '2026-06-01', '2025-01-28 12:42:26', '2025-01-28 11:42:26', 129, 1, NULL, 10, 18904286637495, '2025-01-27');
INSERT INTO `tb_produtos` VALUES (362, 'Africox etoricoxibe 90mg', '1', 'osteoartrite', 13, 'Comprimido', 600.00, 950.00, 4, 'Disponível', 8, '2024-08-01', '2027-07-01', '2025-01-28 12:44:54', '2025-01-28 11:44:54', 129, 1, NULL, 10, 18904286636955, '2025-01-27');
INSERT INTO `tb_produtos` VALUES (363, 'SKDERM creme 30g', '1', 'antifungica', 13, 'Comprimido', 700.00, 1100.00, 5, 'Disponível', 8, '2023-08-01', '2026-07-01', '2025-01-28 12:50:48', '2025-01-28 11:50:48', 129, 4, NULL, 1, 23145, '2025-01-27');
INSERT INTO `tb_produtos` VALUES (364, 'Alivio pastilhas', '1', 'alivio da dor de garganta', 13, 'Comprimido', 83.00, 300.00, 25, 'Disponível', 11, '2022-10-01', '2025-09-01', '2025-01-28 12:59:06', '2025-01-28 11:59:06', 129, 7, NULL, 6, 6290360150710, '2025-01-27');
INSERT INTO `tb_produtos` VALUES (365, 'Balsamo Emami 4ml', '1', 'analgessico', 13, 'Comprimido', 125.00, 250.00, 11, 'Disponível', 8, '2023-03-01', '2026-02-01', '2025-01-28 13:06:35', '2025-01-30 16:30:01', 129, 4, NULL, 1, 28901248418045, '2025-01-27');
INSERT INTO `tb_produtos` VALUES (366, 'Ciprofloxacina Gotas 3mg/ml', '1', 'para olhos e ouvido', 13, 'Comprimido', 275.00, 450.00, 5, 'Disponível', 8, '2024-07-01', '2026-06-01', '2025-01-28 13:10:35', '2025-01-28 12:10:35', 129, 7, NULL, 1, 6290360152240, '2025-01-24');
INSERT INTO `tb_produtos` VALUES (367, 'Diclofenac de Sódio 1mg/ml', '1', 'para olhos', 13, 'Comprimido', 230.00, 350.00, 10, 'Disponível', 8, '2024-02-01', '2026-01-01', '2025-01-28 13:14:30', '2025-01-28 12:14:30', 129, 7, NULL, 1, 6290360152257, '2025-01-24');
INSERT INTO `tb_produtos` VALUES (368, 'Ômega 3', '1', 'suplementos', 16, 'Comprimido', 330.00, 600.00, 9, 'Disponível', 8, '2023-08-01', '2026-01-01', '2025-01-28 13:19:33', '2025-01-28 12:19:33', 129, 3, NULL, 10, 6290360152967, '2025-01-27');
INSERT INTO `tb_produtos` VALUES (369, 'Vitamina E 400 mg', '1', 'vitamina', 16, 'Comprimido', 285.00, 500.00, 10, 'Disponível', 8, '2024-02-01', '2026-07-01', '2025-01-28 13:28:42', '2025-01-28 12:28:42', 129, 3, NULL, 10, 8904206223282, '2025-01-27');
INSERT INTO `tb_produtos` VALUES (370, 'Vitamina A 10,000UPS', '1', 'vitamina', 16, 'Comprimido', 143.00, 250.00, 10, 'Disponível', 8, '2024-02-01', '2026-01-01', '2025-01-28 13:33:20', '2025-01-28 12:33:20', 129, 3, NULL, 10, 8904206238125, '2025-01-27');
INSERT INTO `tb_produtos` VALUES (371, 'Ambroxol Crianca/Flixil', '2', 'Expectorante', 13, 'Comprimido', 2200.00, 3500.00, 1, 'Disponível', 14, '2024-02-01', '2026-09-01', '2025-01-30 07:12:43', '2025-01-30 15:11:24', 130, 2, NULL, 1, 3760319490738, '2025-01-16');
INSERT INTO `tb_produtos` VALUES (372, 'Ambroxol Adulto / Flixidil', '2', 'Expectorante', 13, 'Comprimido', 2100.00, 3500.00, 2, 'Disponível', 14, '2024-02-01', '2026-09-01', '2025-01-30 07:14:59', '2025-01-30 06:14:59', 130, 2, NULL, 1, 3760319490745, '2025-01-16');
INSERT INTO `tb_produtos` VALUES (373, 'HIDROCLOROTIAZIDA 25 mg Índia', '1', 'Hipertensão', 13, 'Comprimido', 55.00, 300.00, 200, 'Disponível', 8, '2023-12-01', '2026-01-11', '2025-01-30 11:33:17', '2025-01-30 10:33:17', 129, 1, NULL, 10, 18904286808501, '2025-01-30');
INSERT INTO `tb_produtos` VALUES (374, 'Losartan 100mg+12.5mg plus', '2', 'anti hipertensivo', 13, 'Comprimido', 2200.00, 3300.00, 4, 'Disponível', 14, '2025-01-13', '2027-01-01', '2025-01-30 11:52:07', '2025-01-30 10:52:07', 129, 1, NULL, 14, 3760319490905, '2025-01-13');
INSERT INTO `tb_produtos` VALUES (375, 'Losartan Plus 50mg+12.5mg', '2', 'anti hipertensivo', 13, 'Comprimido', 1800.00, 2700.00, 4, 'Disponível', 14, '2025-01-13', '2027-01-01', '2025-01-30 11:56:04', '2025-01-30 10:56:04', 129, 1, NULL, 14, 3760319490899, '2025-01-13');
INSERT INTO `tb_produtos` VALUES (376, 'Losartan 100mg', '2', 'anti hipertensivo', 13, 'Comprimido', 1200.00, 1800.00, 4, 'Disponível', 14, '2025-01-13', '2027-01-01', '2025-01-30 11:59:21', '2025-01-30 10:59:21', 129, 1, NULL, 14, 3760319490929, '2025-01-13');
INSERT INTO `tb_produtos` VALUES (377, 'Losartan de potássio 50 mg', '2', 'anti hipertensivo', 13, 'Comprimido', 1200.00, 1700.00, 4, 'Disponível', 14, '2025-01-13', '2027-01-01', '2025-01-30 12:03:05', '2025-01-30 11:03:05', 129, 1, NULL, 14, 3760319490912, '2025-01-13');

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_tipo_produto
-- ----------------------------
INSERT INTO `tb_tipo_produto` VALUES (1, 'Comprimidos', '2025-01-05 16:34:35', 0);
INSERT INTO `tb_tipo_produto` VALUES (2, 'Xarope', '2025-01-05 16:34:35', 0);
INSERT INTO `tb_tipo_produto` VALUES (3, 'Cápsula', '2025-01-05 16:34:35', 0);
INSERT INTO `tb_tipo_produto` VALUES (4, 'Pomada', '2025-01-05 16:34:35', 0);
INSERT INTO `tb_tipo_produto` VALUES (5, 'Supositório', '2025-01-05 17:13:04', 0);
INSERT INTO `tb_tipo_produto` VALUES (6, 'Injetável', '2025-01-05 17:13:04', 0);
INSERT INTO `tb_tipo_produto` VALUES (7, 'Outro', '2025-01-05 21:31:35', 0);
INSERT INTO `tb_tipo_produto` VALUES (8, 'Óvulo', '2025-01-26 19:47:59', 101);
INSERT INTO `tb_tipo_produto` VALUES (9, 'Líquido', '2025-01-26 19:49:16', 101);

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
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_tipo_uh
-- ----------------------------
INSERT INTO `tb_tipo_uh` VALUES (1, 'Hospital Público', NULL, NULL);
INSERT INTO `tb_tipo_uh` VALUES (2, 'Clínica', NULL, NULL);
INSERT INTO `tb_tipo_uh` VALUES (3, 'Centro Médico', NULL, NULL);
INSERT INTO `tb_tipo_uh` VALUES (4, 'Consultório médico', NULL, NULL);
INSERT INTO `tb_tipo_uh` VALUES (5, 'Consultório Dentário', 101, '2022-04-11 16:09:14');

-- ----------------------------
-- Table structure for tb_tipos_movimentacao
-- ----------------------------
DROP TABLE IF EXISTS `tb_tipos_movimentacao`;
CREATE TABLE `tb_tipos_movimentacao`  (
  `id_tipo_movimentacao` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id_tipo_movimentacao`) USING BTREE,
  UNIQUE INDEX `descricao`(`descricao` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_tipos_movimentacao
-- ----------------------------
INSERT INTO `tb_tipos_movimentacao` VALUES (2, 'Ajuste');
INSERT INTO `tb_tipos_movimentacao` VALUES (4, 'Devolução');
INSERT INTO `tb_tipos_movimentacao` VALUES (3, 'Perda');
INSERT INTO `tb_tipos_movimentacao` VALUES (5, 'Uso Interno');
INSERT INTO `tb_tipos_movimentacao` VALUES (1, 'Venda');

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
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

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
-- Table structure for venda
-- ----------------------------
DROP TABLE IF EXISTS `venda`;
CREATE TABLE `venda`  (
  `id_venda` int NOT NULL AUTO_INCREMENT,
  `data_venda` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `total` decimal(10, 2) NOT NULL,
  `status` enum('Finalizada','Cancelada') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'Finalizada',
  `observacao` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `id_usuario` int NULL DEFAULT NULL,
  PRIMARY KEY (`id_venda`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 411 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of venda
-- ----------------------------
INSERT INTO `venda` VALUES (221, '2025-01-23 20:01:51', 950.00, 'Finalizada', NULL, NULL);
INSERT INTO `venda` VALUES (222, '2025-01-23 21:01:54', 300.00, 'Finalizada', NULL, NULL);
INSERT INTO `venda` VALUES (223, '2025-01-24 06:01:03', 2900.00, 'Finalizada', NULL, NULL);
INSERT INTO `venda` VALUES (224, '2025-01-24 07:01:16', 200.00, 'Finalizada', NULL, NULL);
INSERT INTO `venda` VALUES (225, '2025-01-24 07:01:51', 700.00, 'Finalizada', NULL, NULL);
INSERT INTO `venda` VALUES (226, '2025-01-24 09:01:56', 900.00, 'Finalizada', NULL, NULL);
INSERT INTO `venda` VALUES (227, '2025-01-24 09:01:48', 300.00, 'Finalizada', NULL, NULL);
INSERT INTO `venda` VALUES (228, '2025-01-24 10:01:44', 4000.00, 'Finalizada', NULL, NULL);
INSERT INTO `venda` VALUES (229, '2025-01-24 10:01:16', 450.00, 'Finalizada', NULL, NULL);
INSERT INTO `venda` VALUES (230, '2025-01-24 12:01:53', 2000.00, 'Finalizada', NULL, NULL);
INSERT INTO `venda` VALUES (231, '2025-01-24 15:01:59', 900.00, 'Finalizada', NULL, NULL);
INSERT INTO `venda` VALUES (232, '2025-01-24 16:01:25', 1800.00, 'Finalizada', NULL, NULL);
INSERT INTO `venda` VALUES (233, '2025-01-24 17:01:06', 1500.00, 'Finalizada', NULL, NULL);
INSERT INTO `venda` VALUES (234, '2025-01-24 18:01:43', 7500.00, 'Finalizada', NULL, NULL);
INSERT INTO `venda` VALUES (235, '2025-01-24 18:01:03', 700.00, 'Finalizada', NULL, NULL);
INSERT INTO `venda` VALUES (236, '2025-01-24 18:01:56', 900.00, 'Finalizada', NULL, NULL);
INSERT INTO `venda` VALUES (237, '2025-01-24 18:01:13', 4900.00, 'Finalizada', NULL, NULL);
INSERT INTO `venda` VALUES (238, '2025-01-24 18:01:33', 200.00, 'Finalizada', NULL, NULL);
INSERT INTO `venda` VALUES (239, '2025-01-24 18:01:46', 150.00, 'Finalizada', NULL, NULL);
INSERT INTO `venda` VALUES (240, '2025-01-24 18:01:28', 200.00, 'Finalizada', NULL, NULL);
INSERT INTO `venda` VALUES (241, '2025-01-24 19:01:22', 1500.00, 'Finalizada', NULL, NULL);
INSERT INTO `venda` VALUES (242, '2025-01-24 19:01:50', 3400.00, 'Finalizada', NULL, NULL);
INSERT INTO `venda` VALUES (243, '2025-01-24 19:01:34', 450.00, 'Finalizada', NULL, NULL);
INSERT INTO `venda` VALUES (244, '2025-01-24 19:01:21', 2700.00, 'Finalizada', NULL, NULL);
INSERT INTO `venda` VALUES (245, '2025-01-24 19:01:35', 1900.00, 'Finalizada', NULL, NULL);
INSERT INTO `venda` VALUES (246, '2025-01-24 20:01:46', 1850.00, 'Finalizada', NULL, NULL);
INSERT INTO `venda` VALUES (247, '2025-01-24 20:01:34', 3200.00, 'Finalizada', NULL, NULL);
INSERT INTO `venda` VALUES (248, '2025-01-24 21:01:31', 150.00, 'Finalizada', NULL, NULL);
INSERT INTO `venda` VALUES (249, '2025-01-24 21:01:26', 50.00, 'Finalizada', NULL, NULL);
INSERT INTO `venda` VALUES (250, '2025-01-25 06:01:48', 1500.00, 'Finalizada', NULL, NULL);
INSERT INTO `venda` VALUES (251, '2025-01-25 07:01:45', 500.00, 'Finalizada', NULL, NULL);
INSERT INTO `venda` VALUES (252, '2025-01-25 07:01:26', 1500.00, 'Finalizada', NULL, NULL);
INSERT INTO `venda` VALUES (253, '2025-01-25 07:01:08', 700.00, 'Finalizada', NULL, NULL);
INSERT INTO `venda` VALUES (254, '2025-01-25 07:01:25', 500.00, 'Finalizada', NULL, NULL);
INSERT INTO `venda` VALUES (255, '2025-01-25 08:01:29', 1950.00, 'Finalizada', NULL, NULL);
INSERT INTO `venda` VALUES (256, '2025-01-25 09:01:57', 550.00, 'Finalizada', NULL, NULL);
INSERT INTO `venda` VALUES (257, '2025-01-25 09:01:11', 550.00, 'Finalizada', NULL, NULL);
INSERT INTO `venda` VALUES (258, '2025-01-25 09:01:49', 1000.00, 'Finalizada', NULL, NULL);
INSERT INTO `venda` VALUES (259, '2025-01-25 10:01:00', 500.00, 'Finalizada', NULL, NULL);
INSERT INTO `venda` VALUES (260, '2025-01-25 10:01:21', 500.00, 'Finalizada', NULL, NULL);
INSERT INTO `venda` VALUES (261, '2025-01-25 10:01:45', 300.00, 'Finalizada', NULL, NULL);
INSERT INTO `venda` VALUES (262, '2025-01-25 11:01:08', 400.00, 'Finalizada', NULL, NULL);
INSERT INTO `venda` VALUES (263, '2025-01-25 11:01:36', 400.00, 'Finalizada', NULL, NULL);
INSERT INTO `venda` VALUES (264, '2025-01-25 12:01:04', 7750.00, 'Finalizada', NULL, NULL);
INSERT INTO `venda` VALUES (265, '2025-01-25 12:01:02', 4000.00, 'Finalizada', NULL, NULL);
INSERT INTO `venda` VALUES (266, '2025-01-25 14:01:03', 1000.00, 'Finalizada', NULL, NULL);
INSERT INTO `venda` VALUES (267, '2025-01-25 14:01:51', 700.00, 'Finalizada', NULL, NULL);
INSERT INTO `venda` VALUES (268, '2025-01-25 15:01:24', 450.00, 'Finalizada', NULL, NULL);
INSERT INTO `venda` VALUES (269, '2025-01-25 15:01:50', 450.00, 'Finalizada', NULL, NULL);
INSERT INTO `venda` VALUES (270, '2025-01-25 15:01:47', 200.00, 'Finalizada', NULL, NULL);
INSERT INTO `venda` VALUES (271, '2025-01-25 17:01:05', 2000.00, 'Finalizada', NULL, NULL);
INSERT INTO `venda` VALUES (272, '2025-01-25 17:01:42', 700.00, 'Finalizada', NULL, NULL);
INSERT INTO `venda` VALUES (274, '2025-01-25 17:01:31', 1600.00, 'Finalizada', NULL, NULL);
INSERT INTO `venda` VALUES (275, '2025-01-25 17:01:07', 2550.00, 'Finalizada', NULL, NULL);
INSERT INTO `venda` VALUES (276, '2025-01-25 18:01:23', 200.00, 'Finalizada', NULL, NULL);
INSERT INTO `venda` VALUES (277, '2025-01-25 18:01:26', 200.00, 'Finalizada', NULL, NULL);
INSERT INTO `venda` VALUES (278, '2025-01-25 18:01:33', 500.00, 'Finalizada', NULL, NULL);
INSERT INTO `venda` VALUES (279, '2025-01-25 19:01:44', 950.00, 'Finalizada', NULL, NULL);
INSERT INTO `venda` VALUES (280, '2025-01-25 19:01:04', 5950.00, 'Finalizada', NULL, NULL);
INSERT INTO `venda` VALUES (281, '2025-01-25 19:01:37', 1500.00, 'Finalizada', NULL, NULL);
INSERT INTO `venda` VALUES (282, '2025-01-25 20:01:41', 1200.00, 'Finalizada', NULL, NULL);
INSERT INTO `venda` VALUES (283, '2025-01-25 20:01:34', 300.00, 'Finalizada', NULL, NULL);
INSERT INTO `venda` VALUES (284, '2025-01-25 20:01:52', 600.00, 'Finalizada', NULL, NULL);
INSERT INTO `venda` VALUES (285, '2025-01-25 20:01:18', 400.00, 'Finalizada', NULL, NULL);
INSERT INTO `venda` VALUES (286, '2025-01-25 21:01:06', 4250.00, 'Finalizada', NULL, NULL);
INSERT INTO `venda` VALUES (287, '2025-01-26 06:01:34', 200.00, 'Finalizada', NULL, NULL);
INSERT INTO `venda` VALUES (288, '2025-01-26 07:01:38', 400.00, 'Finalizada', NULL, NULL);
INSERT INTO `venda` VALUES (289, '2025-01-26 08:01:20', 500.00, 'Finalizada', NULL, NULL);
INSERT INTO `venda` VALUES (290, '2025-01-26 08:01:15', 750.00, 'Finalizada', NULL, NULL);
INSERT INTO `venda` VALUES (291, '2025-01-26 09:01:26', 350.00, 'Finalizada', NULL, NULL);
INSERT INTO `venda` VALUES (292, '2025-01-26 09:01:41', 150.00, 'Finalizada', NULL, NULL);
INSERT INTO `venda` VALUES (293, '2025-01-26 09:01:43', 700.00, 'Finalizada', NULL, NULL);
INSERT INTO `venda` VALUES (294, '2025-01-26 14:01:47', 550.00, 'Finalizada', NULL, NULL);
INSERT INTO `venda` VALUES (295, '2025-01-26 16:01:04', 49100.00, 'Finalizada', NULL, NULL);
INSERT INTO `venda` VALUES (296, '2025-01-26 17:01:31', 61550.00, 'Finalizada', NULL, NULL);
INSERT INTO `venda` VALUES (297, '2025-01-26 17:01:02', 300.00, 'Finalizada', NULL, NULL);
INSERT INTO `venda` VALUES (298, '2025-01-26 17:01:02', 400.00, 'Finalizada', NULL, NULL);
INSERT INTO `venda` VALUES (299, '2025-01-26 18:01:22', 300.00, 'Finalizada', NULL, NULL);
INSERT INTO `venda` VALUES (300, '2025-01-26 18:01:48', 1150.00, 'Finalizada', NULL, NULL);
INSERT INTO `venda` VALUES (302, '2025-01-26 18:01:47', 500.00, 'Finalizada', NULL, NULL);
INSERT INTO `venda` VALUES (303, '2025-01-26 18:01:50', 700.00, 'Finalizada', NULL, NULL);
INSERT INTO `venda` VALUES (308, '2025-01-27 16:01:31', 300.00, 'Finalizada', NULL, 131);
INSERT INTO `venda` VALUES (309, '2025-01-27 17:01:20', 3050.00, 'Finalizada', NULL, 131);
INSERT INTO `venda` VALUES (310, '2025-01-27 17:01:25', 350.00, 'Finalizada', NULL, 131);
INSERT INTO `venda` VALUES (311, '2025-01-27 17:01:49', 1100.00, 'Finalizada', NULL, 131);
INSERT INTO `venda` VALUES (312, '2025-01-27 17:01:26', 500.00, 'Finalizada', NULL, 131);
INSERT INTO `venda` VALUES (313, '2025-01-27 17:01:20', 200.00, 'Finalizada', NULL, 131);
INSERT INTO `venda` VALUES (314, '2025-01-27 17:01:25', 700.00, 'Finalizada', NULL, 131);
INSERT INTO `venda` VALUES (315, '2025-01-27 17:01:30', 900.00, 'Finalizada', NULL, 131);
INSERT INTO `venda` VALUES (316, '2025-01-27 17:01:08', 1550.00, 'Finalizada', NULL, 131);
INSERT INTO `venda` VALUES (317, '2025-01-27 17:01:57', 300.00, 'Finalizada', NULL, 131);
INSERT INTO `venda` VALUES (318, '2025-01-27 18:01:56', 500.00, 'Finalizada', NULL, 131);
INSERT INTO `venda` VALUES (319, '2025-01-27 18:01:37', 200.00, 'Finalizada', NULL, 131);
INSERT INTO `venda` VALUES (320, '2025-01-27 19:01:51', 250.00, 'Finalizada', NULL, 131);
INSERT INTO `venda` VALUES (321, '2025-01-27 19:01:59', 750.00, 'Finalizada', NULL, 131);
INSERT INTO `venda` VALUES (322, '2025-01-27 19:01:39', 500.00, 'Finalizada', NULL, 131);
INSERT INTO `venda` VALUES (323, '2025-01-27 19:01:28', 1800.00, 'Finalizada', NULL, 131);
INSERT INTO `venda` VALUES (324, '2025-01-27 19:01:57', 200.00, 'Finalizada', NULL, 131);
INSERT INTO `venda` VALUES (325, '2025-01-28 12:01:27', 400.00, 'Finalizada', NULL, 132);
INSERT INTO `venda` VALUES (326, '2025-01-28 12:01:43', 500.00, 'Finalizada', NULL, 132);
INSERT INTO `venda` VALUES (327, '2025-01-28 14:01:46', 5600.00, 'Finalizada', NULL, 132);
INSERT INTO `venda` VALUES (328, '2025-01-28 14:01:29', 400.00, 'Finalizada', NULL, 132);
INSERT INTO `venda` VALUES (329, '2025-01-28 17:01:58', 500.00, 'Finalizada', NULL, 132);
INSERT INTO `venda` VALUES (330, '2025-01-28 17:01:44', 400.00, 'Finalizada', NULL, 132);
INSERT INTO `venda` VALUES (331, '2025-01-28 17:01:05', 200.00, 'Finalizada', NULL, 132);
INSERT INTO `venda` VALUES (332, '2025-01-28 18:01:50', 150.00, 'Finalizada', NULL, 132);
INSERT INTO `venda` VALUES (333, '2025-01-28 19:01:51', 350.00, 'Finalizada', NULL, 132);
INSERT INTO `venda` VALUES (337, '2025-01-28 19:01:42', 700.00, 'Finalizada', NULL, 132);
INSERT INTO `venda` VALUES (339, '2025-01-29 06:01:18', 1400.00, 'Finalizada', NULL, 132);
INSERT INTO `venda` VALUES (340, '2025-01-29 11:01:27', 3500.00, 'Finalizada', NULL, 130);
INSERT INTO `venda` VALUES (341, '2025-01-29 11:01:20', 3500.00, 'Finalizada', NULL, 130);
INSERT INTO `venda` VALUES (342, '2025-01-29 11:01:22', 500.00, 'Finalizada', NULL, 129);
INSERT INTO `venda` VALUES (343, '2025-01-29 11:01:54', 400.00, 'Finalizada', NULL, 129);
INSERT INTO `venda` VALUES (344, '2025-01-29 12:01:50', 700.00, 'Finalizada', NULL, 129);
INSERT INTO `venda` VALUES (345, '2025-01-29 12:01:28', 500.00, 'Finalizada', NULL, 129);
INSERT INTO `venda` VALUES (346, '2025-01-29 15:01:59', 3250.00, 'Finalizada', NULL, 129);
INSERT INTO `venda` VALUES (347, '2025-01-29 15:01:21', 850.00, 'Finalizada', NULL, 129);
INSERT INTO `venda` VALUES (348, '2025-01-29 17:01:49', 300.00, 'Finalizada', NULL, 130);
INSERT INTO `venda` VALUES (349, '2025-01-29 17:01:55', 400.00, 'Finalizada', NULL, 130);
INSERT INTO `venda` VALUES (350, '2025-01-29 18:01:14', 1250.00, 'Finalizada', NULL, 130);
INSERT INTO `venda` VALUES (351, '2025-01-29 18:01:17', 450.00, 'Finalizada', NULL, 130);
INSERT INTO `venda` VALUES (352, '2025-01-30 07:01:25', 1300.00, 'Finalizada', NULL, 131);
INSERT INTO `venda` VALUES (353, '2025-01-30 07:01:25', 200.00, 'Finalizada', NULL, 131);
INSERT INTO `venda` VALUES (354, '2025-01-30 09:01:57', 1000.00, 'Finalizada', NULL, 131);
INSERT INTO `venda` VALUES (355, '2025-01-30 11:01:10', 850.00, 'Finalizada', NULL, 131);
INSERT INTO `venda` VALUES (356, '2025-01-30 12:01:27', 250.00, 'Finalizada', NULL, 131);
INSERT INTO `venda` VALUES (357, '2025-01-30 13:01:09', 3200.00, 'Finalizada', NULL, 131);
INSERT INTO `venda` VALUES (358, '2025-01-30 13:01:47', 450.00, 'Finalizada', NULL, 131);
INSERT INTO `venda` VALUES (359, '2025-01-30 13:01:28', 1050.00, 'Finalizada', NULL, 101);
INSERT INTO `venda` VALUES (360, '2025-01-30 14:01:34', 20200.00, 'Finalizada', NULL, 129);
INSERT INTO `venda` VALUES (361, '2025-01-30 14:01:18', 12100.00, 'Finalizada', NULL, 129);
INSERT INTO `venda` VALUES (362, '2025-01-30 14:01:32', 20600.00, 'Finalizada', NULL, 129);
INSERT INTO `venda` VALUES (363, '2025-01-30 14:01:40', 8800.00, 'Finalizada', NULL, 129);
INSERT INTO `venda` VALUES (364, '2025-01-30 14:01:31', 200.00, 'Finalizada', NULL, 131);
INSERT INTO `venda` VALUES (365, '2025-01-30 14:01:30', 27700.00, 'Finalizada', NULL, 129);
INSERT INTO `venda` VALUES (366, '2025-01-30 15:01:52', 40000.00, 'Finalizada', NULL, 129);
INSERT INTO `venda` VALUES (367, '2025-01-30 15:01:24', 19700.00, 'Finalizada', NULL, 129);
INSERT INTO `venda` VALUES (368, '2025-01-30 15:01:31', 13800.00, 'Finalizada', NULL, 129);
INSERT INTO `venda` VALUES (369, '2025-01-30 15:01:40', 3350.00, 'Finalizada', NULL, 129);
INSERT INTO `venda` VALUES (370, '2025-01-30 15:01:47', 3200.00, 'Finalizada', NULL, 131);
INSERT INTO `venda` VALUES (371, '2025-01-30 16:01:56', 2700.00, 'Finalizada', NULL, 131);
INSERT INTO `venda` VALUES (372, '2025-01-30 16:01:08', 3350.00, 'Finalizada', NULL, 131);
INSERT INTO `venda` VALUES (373, '2025-01-30 16:01:01', 1900.00, 'Finalizada', NULL, 131);
INSERT INTO `venda` VALUES (374, '2025-01-30 17:01:03', 1000.00, 'Finalizada', NULL, 131);
INSERT INTO `venda` VALUES (375, '2025-01-30 18:01:00', 500.00, 'Finalizada', NULL, 131);
INSERT INTO `venda` VALUES (376, '2025-01-30 18:01:12', 1550.00, 'Finalizada', NULL, 131);
INSERT INTO `venda` VALUES (377, '2025-01-30 18:01:39', 500.00, 'Finalizada', NULL, 131);
INSERT INTO `venda` VALUES (378, '2025-01-30 18:01:44', 18000.00, 'Finalizada', NULL, 131);
INSERT INTO `venda` VALUES (379, '2025-01-30 18:01:30', 450.00, 'Finalizada', NULL, 131);
INSERT INTO `venda` VALUES (380, '2025-01-30 19:01:12', 700.00, 'Finalizada', NULL, 131);
INSERT INTO `venda` VALUES (381, '2025-01-30 19:01:21', 100.00, 'Finalizada', NULL, 131);
INSERT INTO `venda` VALUES (382, '2025-01-30 19:01:40', 1350.00, 'Finalizada', NULL, 131);
INSERT INTO `venda` VALUES (383, '2025-01-31 08:01:49', 1000.00, 'Finalizada', NULL, 132);
INSERT INTO `venda` VALUES (384, '2025-01-31 09:01:36', 900.00, 'Finalizada', NULL, 132);
INSERT INTO `venda` VALUES (385, '2025-01-31 09:01:27', 3000.00, 'Finalizada', NULL, 132);
INSERT INTO `venda` VALUES (386, '2025-01-31 13:01:23', 500.00, 'Finalizada', NULL, 132);
INSERT INTO `venda` VALUES (387, '2025-01-31 13:01:57', 250.00, 'Finalizada', NULL, 132);
INSERT INTO `venda` VALUES (388, '2025-01-31 14:01:22', 1650.00, 'Finalizada', NULL, 129);
INSERT INTO `venda` VALUES (389, '2025-01-31 15:01:39', 5400.00, 'Finalizada', NULL, 132);
INSERT INTO `venda` VALUES (390, '2025-01-31 16:01:56', 950.00, 'Finalizada', NULL, 132);
INSERT INTO `venda` VALUES (391, '2025-01-31 16:01:22', 150.00, 'Finalizada', NULL, 132);
INSERT INTO `venda` VALUES (392, '2025-01-31 17:01:51', 2300.00, 'Finalizada', NULL, 132);
INSERT INTO `venda` VALUES (393, '2025-01-31 17:01:29', 500.00, 'Finalizada', NULL, 132);
INSERT INTO `venda` VALUES (394, '2025-01-31 18:01:22', 900.00, 'Finalizada', NULL, 132);
INSERT INTO `venda` VALUES (395, '2025-01-31 18:01:54', 550.00, 'Finalizada', NULL, 132);
INSERT INTO `venda` VALUES (396, '2025-01-31 18:01:46', 1650.00, 'Finalizada', NULL, 132);
INSERT INTO `venda` VALUES (397, '2025-01-31 18:01:06', 500.00, 'Finalizada', NULL, 132);
INSERT INTO `venda` VALUES (398, '2025-01-31 20:01:38', 1700.00, 'Finalizada', NULL, 132);
INSERT INTO `venda` VALUES (399, '2025-02-01 07:02:51', 1750.00, 'Finalizada', NULL, 130);
INSERT INTO `venda` VALUES (400, '2025-02-01 08:02:10', 700.00, 'Finalizada', NULL, 130);
INSERT INTO `venda` VALUES (401, '2025-02-01 09:02:24', 1000.00, 'Finalizada', NULL, 130);
INSERT INTO `venda` VALUES (402, '2025-02-01 10:02:54', 700.00, 'Finalizada', NULL, 130);
INSERT INTO `venda` VALUES (403, '2025-02-01 11:02:49', 200.00, 'Finalizada', NULL, 130);
INSERT INTO `venda` VALUES (404, '2025-02-01 13:02:06', 500.00, 'Finalizada', NULL, 130);
INSERT INTO `venda` VALUES (405, '2025-02-01 13:02:33', 200.00, 'Finalizada', NULL, 130);
INSERT INTO `venda` VALUES (406, '2025-02-01 13:02:29', 2650.00, 'Finalizada', NULL, 130);
INSERT INTO `venda` VALUES (407, '2025-02-01 14:02:32', 600.00, 'Finalizada', NULL, 130);
INSERT INTO `venda` VALUES (408, '2025-02-01 15:02:37', 350.00, 'Finalizada', NULL, 130);
INSERT INTO `venda` VALUES (409, '2025-02-01 16:02:26', 1250.00, 'Finalizada', NULL, 130);
INSERT INTO `venda` VALUES (410, '2025-02-01 17:02:20', 250.00, 'Finalizada', NULL, 130);

SET FOREIGN_KEY_CHECKS = 1;
