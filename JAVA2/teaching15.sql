/*
 Navicat Premium Data Transfer

 Source Server         : 172.18.187.231
 Source Server Type    : MySQL
 Source Server Version : 50715
 Source Host           : 172.18.187.231:53306
 Source Schema         : teaching13

 Target Server Type    : MySQL
 Target Server Version : 50715
 File Encoding         : 65001

 Date: 18/11/2017 17:17:20
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `num`(`num`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 389 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES (385, 'C160001', 'Web');
INSERT INTO `course` VALUES (386, 'C160002', 'Networking');
INSERT INTO `course` VALUES (387, 'C160003', 'DataStructure');
INSERT INTO `course` VALUES (388, 'C160004', 'Algorithm');

-- ----------------------------
-- Table structure for stu
-- ----------------------------
DROP TABLE IF EXISTS `stu`;
CREATE TABLE `stu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '001',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '111',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `num`(`num`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12347062 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stu
-- ----------------------------
INSERT INTO `stu` VALUES (12347054, '140001', 'Qian');
INSERT INTO `stu` VALUES (12347055, '140002', 'Li');
INSERT INTO `stu` VALUES (12347056, '140003', 'Wang');
INSERT INTO `stu` VALUES (12347057, '140004', 'Zhang');
INSERT INTO `stu` VALUES (12347058, '140005', 'Zhao');
INSERT INTO `stu` VALUES (12347059, '140006', 'Xu');
INSERT INTO `stu` VALUES (12347060, '140007', 'Liang');
INSERT INTO `stu` VALUES (12347061, '140008', 'Li');

-- ----------------------------
-- Table structure for transcript
-- ----------------------------
DROP TABLE IF EXISTS `transcript`;
CREATE TABLE `transcript`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `courseId` int(11) NULL DEFAULT NULL,
  `stuId` int(11) NULL DEFAULT NULL,
  `score` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fkCourseId`(`courseId`) USING BTREE,
  INDEX `fkStuId`(`stuId`) USING BTREE,
  CONSTRAINT `fkCourseId` FOREIGN KEY (`courseId`) REFERENCES `course` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `fkStuId` FOREIGN KEY (`stuId`) REFERENCES `stu` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of transcript
-- ----------------------------
INSERT INTO `transcript` VALUES (4, NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
