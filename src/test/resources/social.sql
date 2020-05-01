/*
 Navicat Premium Data Transfer

 Source Server         : Bonk
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : social

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 09/03/2020 18:23:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for audit_ncm_form
-- ----------------------------
DROP TABLE IF EXISTS `audit_ncm_form`;
CREATE TABLE `audit_ncm_form`  (
  `id` int(50) NOT NULL AUTO_INCREMENT COMMENT '已发送稽核通知案件管理表',
  `registration_of_cases_id` int(50) NULL DEFAULT NULL COMMENT '来案登记表ID',
  `application_materials_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申报材料url',
  `record` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '笔录',
  `state` int(50) NULL DEFAULT NULL COMMENT '申报材料状态（0：未申报，1：已申报）',
  `base_of_payment` int(50) NULL DEFAULT NULL COMMENT '缴费基数',
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_mysql500_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING HASH
) ENGINE = MEMORY AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_mysql500_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for case_management
-- ----------------------------
DROP TABLE IF EXISTS `case_management`;
CREATE TABLE `case_management`  (
  `id` int(50) NOT NULL AUTO_INCREMENT COMMENT '已核定缴费基数案件管理表',
  `registration_of_cases_id` int(50) NULL DEFAULT NULL COMMENT '来案登记表ID',
  `status` int(50) NULL DEFAULT NULL COMMENT '补缴通知书状态(0:未送达，1：已送达)',
  `service_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '送达时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of case_management
-- ----------------------------
INSERT INTO `case_management` VALUES (1, 1, 1, '2019-10-01');
INSERT INTO `case_management` VALUES (2, 2, 1, '2018-10-15');
INSERT INTO `case_management` VALUES (3, 12, 1, '2018-08-13');
INSERT INTO `case_management` VALUES (4, 6, 1, '2019-10-01');
INSERT INTO `case_management` VALUES (5, 11, 1, '2019-10-01');
INSERT INTO `case_management` VALUES (6, 32, 0, NULL);
INSERT INTO `case_management` VALUES (7, 36, 0, NULL);
INSERT INTO `case_management` VALUES (8, 35, 0, NULL);
INSERT INTO `case_management` VALUES (9, 37, 0, NULL);
INSERT INTO `case_management` VALUES (10, 40, 0, NULL);
INSERT INTO `case_management` VALUES (11, 44, 1, '2019-10-16');

-- ----------------------------
-- Table structure for change
-- ----------------------------
DROP TABLE IF EXISTS `changes`;
CREATE TABLE `changes`  (
  `id` int(50) NOT NULL AUTO_INCREMENT COMMENT '变更表',
  `change_operator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '变更操作人',
  `operation_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for new_case_management_form
-- ----------------------------
DROP TABLE IF EXISTS `new_case_management_form`;
CREATE TABLE `new_case_management_form`  (
  `id` int(50) NOT NULL AUTO_INCREMENT COMMENT '新立案件管理表',
  `registration_of_cases_id` int(50) NULL DEFAULT NULL COMMENT '来案登记表id',
  `state` int(50) NULL DEFAULT NULL COMMENT '通知书状态(0、未送达 1、已送达)',
  `service_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '送达时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of new_case_management_form
-- ----------------------------
INSERT INTO `new_case_management_form` VALUES (1, 1, 1, '2015-05-01');
INSERT INTO `new_case_management_form` VALUES (2, 2, 1, '2015-06-01');
INSERT INTO `new_case_management_form` VALUES (6, 6, 1, '2019-10-14');
INSERT INTO `new_case_management_form` VALUES (7, 11, 1, '2017-07-08');
INSERT INTO `new_case_management_form` VALUES (8, 12, 1, '2018-08-09');
INSERT INTO `new_case_management_form` VALUES (11, 10, 1, '2019-10-14');
INSERT INTO `new_case_management_form` VALUES (12, 17, 1, '2019-10-14');
INSERT INTO `new_case_management_form` VALUES (14, 18, 0, NULL);
INSERT INTO `new_case_management_form` VALUES (15, 29, 0, NULL);
INSERT INTO `new_case_management_form` VALUES (16, 36, 1, '2019-10-15');
INSERT INTO `new_case_management_form` VALUES (17, 42, 1, '2019-10-15');
INSERT INTO `new_case_management_form` VALUES (18, 44, 1, '2019-10-16');

-- ----------------------------
-- Table structure for notification_case_management
-- ----------------------------
DROP TABLE IF EXISTS `notification_case_management`;
CREATE TABLE `notification_case_management`  (
  `id` int(50) NOT NULL AUTO_INCREMENT COMMENT '已发送补缴通知案件管理表',
  `registration_of_cases_id` int(50) NULL DEFAULT NULL COMMENT '来案登记表ID',
  `state` int(50) NULL DEFAULT NULL COMMENT '补缴状态(0:未补缴，1：已补缴，2：提请处罚，3：银行待查)',
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notification_case_management
-- ----------------------------
INSERT INTO `notification_case_management` VALUES (1, 1, 3, '2019-10-09');
INSERT INTO `notification_case_management` VALUES (2, 12, 3, '2019-10-01');
INSERT INTO `notification_case_management` VALUES (3, 6, 3, '2019-10-14');
INSERT INTO `notification_case_management` VALUES (4, 11, 3, '2019-10-14');
INSERT INTO `notification_case_management` VALUES (5, 44, 1, NULL);
INSERT INTO `notification_case_management` VALUES (6, 2, 0, NULL);

-- ----------------------------
-- Table structure for organization
-- ----------------------------
DROP TABLE IF EXISTS `organization`;
CREATE TABLE `organization`  (
  `id` int(50) NOT NULL AUTO_INCREMENT COMMENT '组织机构表',
  `department_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门名称',
  `higher_authorities_id` int(50) NULL DEFAULT NULL COMMENT '上级部门ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of organization
-- ----------------------------
INSERT INTO `organization` VALUES (2, '稽核科', 1);
INSERT INTO `organization` VALUES (3, '办公室', 1);
INSERT INTO `organization` VALUES (6, '信息办公室', 1);

-- ----------------------------
-- Table structure for pending_bank_cases
-- ----------------------------
DROP TABLE IF EXISTS `pending_bank_cases`;
CREATE TABLE `pending_bank_cases`  (
  `id` int(50) NOT NULL AUTO_INCREMENT COMMENT '待查银行案件管理',
  `registration_of_cases_id` int(50) NULL DEFAULT NULL COMMENT '来案登记表ID',
  `pd_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请划拨时间',
  `state` int(50) NULL DEFAULT 2 COMMENT '划拨状态（0：划拨成功，1：划拨后仍为偿清',
  `have_money` int(1) NULL DEFAULT NULL COMMENT '银行有钱没钱（0:未确认，1：有，2：没有）',
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pending_bank_cases
-- ----------------------------
INSERT INTO `pending_bank_cases` VALUES (1, 1, NULL, 2, 2, NULL);
INSERT INTO `pending_bank_cases` VALUES (3, 12, '2019-10-14', 1, 1, NULL);
INSERT INTO `pending_bank_cases` VALUES (4, 6, '2019-10-16', 2, 1, NULL);
INSERT INTO `pending_bank_cases` VALUES (5, 11, '2019-10-14', 2, 0, NULL);

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限名称',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'url',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for post
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '岗位表主键ID',
  `post_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '岗位名称',
  `state` int(1) NULL DEFAULT 1 COMMENT '岗位状态（0：关闭，1：开启）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for post_role
-- ----------------------------
DROP TABLE IF EXISTS `post_role`;
CREATE TABLE `post_role`  (
  `post_id` int(11) NOT NULL COMMENT '岗位id',
  `role_id` int(11) NOT NULL COMMENT '角色Id',
  PRIMARY KEY (`post_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for registration_of_cases
-- ----------------------------
DROP TABLE IF EXISTS `registration_of_cases`;
CREATE TABLE `registration_of_cases`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '来案登记',
  `unit_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单位名称',
  `organizational_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组织机构代码',
  `name_of_the_complainant` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投诉人姓名',
  `id_card` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投诉人身份证号',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `account_character` int(2) NULL DEFAULT NULL COMMENT '户口性质 分为农业户口和非农业户口',
  `age` int(50) NULL DEFAULT NULL COMMENT '年龄',
  `sex` int(1) NULL DEFAULT NULL COMMENT '性别 分为男和女',
  `complaint_contents` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投诉内容',
  `name_of_registrant` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登记人姓名',
  `registration_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登记时间',
  `name_of_the_filer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '立案人姓名',
  `filing_month` int(50) NULL DEFAULT NULL COMMENT '立案月',
  `filing_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '立案时间',
  `approval_status` int(20) NULL DEFAULT NULL COMMENT '审批状态 (0：提交未审批，1：审批通过，2：审批未通过，3：结案归档,4:立案未提交);',
  `warning_time` int(11) NULL DEFAULT NULL COMMENT '预警时间',
  `number_of_auditors` int(50) NULL DEFAULT NULL COMMENT '审计人数',
  `audit_households` int(50) NULL DEFAULT NULL COMMENT '审计户数',
  `amount_paid` float(11, 2) NULL DEFAULT NULL COMMENT '补缴金额',
  `type_status` int(50) NULL DEFAULT NULL COMMENT '类型状态 (1、立案登记 2、日常审批 3、专项审批)',
  `maxtime` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of registration_of_cases
-- ----------------------------
INSERT INTO `registration_of_cases` VALUES (1, '北京中科软科技有限公司', '12345678-9', '张三', '123456789123456789', '15910470377', 0, 23, 1, '红苹果', '田七', '2015-04-23', '李四', 7, '2015-04-23', 3, 4, 3, 2, 2333.00, 0, 50);
INSERT INTO `registration_of_cases` VALUES (2, '北京用友科技有限公司', '43333333-1', '王五', '987654321987654321', '15396778848', 1, 32, 1, '好吃的西瓜', '李四', '2015-05-25', '李四', 5, '2015-05-23', 1, 264, 3, 2, 2000.00, 0, 50);
INSERT INTO `registration_of_cases` VALUES (6, '中国软件', '15546878-9', '晓明', '147852369963258741', '12345678965', 1, 35, 0, '原因', '李四', '2019-10-09', '李四', 10, '2019-10-09', 1, 2, 2, 2, 3200.00, 0, 50);
INSERT INTO `registration_of_cases` VALUES (7, '北京信达网络科技有限公司', '12345678', '董宏宇', '123456789876543221', '12345432845', 0, 20, 0, '发', '科比', '2019-10-08', '科比', 3, '2016-08-07', 3, 4, NULL, NULL, NULL, 0, 50);
INSERT INTO `registration_of_cases` VALUES (10, '阿里巴巴', '88888888', '码云', '123456789009876543', '12345678945', 1, 43, 0, '对方是个猪', '李四', '2019-10-10', '李四', 5, '2019-10-12', 1, 4, NULL, NULL, NULL, 0, 50);
INSERT INTO `registration_of_cases` VALUES (11, '百度', '15487958-1', '赵四', '147852369963258741', '12345678965', 0, 36, 1, '琴音', '李四', '2017-06-08', '李四', 6, '2017-06-08', 1, 4, 3, 2, 3200.00, 0, 50);
INSERT INTO `registration_of_cases` VALUES (12, '航天四创', '4587897-5', '王丰收', '159852357456852451', '12547896325', 1, 25, 0, '哈哈哈', '李四', '2018-07-09', '李四', 7, '2018-07-09', 1, 12, 3, 2, 2300.00, 0, 80);
INSERT INTO `registration_of_cases` VALUES (14, '广东话分隔符', '23456', '规范化的', '广东话', '23456', 0, 54, 0, '顺丰大概', '很高的', '2019-09-10', '格式', 6, '2019-10-12', 3, 24, NULL, NULL, NULL, 0, 50);
INSERT INTO `registration_of_cases` VALUES (15, '小米', '888888888888', '马伊利', '12345678765', '2345', 0, 45, 1, '的撒发噶', '王五', '2019-10-12', '王五', 5, '2019-10-12', 3, 0, NULL, NULL, NULL, 0, 50);
INSERT INTO `registration_of_cases` VALUES (17, '哈喽哈路', '77777777', '七酱', '123456789876543', '2345678', 0, 43, 0, '干活', '赵六', '2019-10-12', '赵六', 3, '2019-10-12', 1, 4, NULL, NULL, NULL, 0, 50);
INSERT INTO `registration_of_cases` VALUES (18, '哗啦啦', '111111111', '士大夫嘀咕嘀咕', '123456', '6742452', 0, 23, 0, '打法', '打法', '2019-10-12', '打法', 5, '2019-10-12', 1, 4, NULL, NULL, NULL, 0, 50);
INSERT INTO `registration_of_cases` VALUES (28, '爸爸', '8888', '陆哥', '888', '88', 0, 88, 0, '阿道夫', '大哥', '2019-10-12', '的', 10, '2019-10-12', 3, 0, NULL, NULL, NULL, 0, 50);
INSERT INTO `registration_of_cases` VALUES (29, '吼吼吼', '0000000', '打法', '74674', '234677', 0, 54, 0, '分公司', '给', '2019-10-14', '张三', 10, '2019-10-14', 1, 4, NULL, NULL, NULL, 0, 50);
INSERT INTO `registration_of_cases` VALUES (30, '嘻嘻嘻', '4557368', '共和', '1234565797', '7659', 1, 43, 0, '发噶', '哥回家', '2019-10-14', '张三', 10, '2019-10-14', 0, 4, NULL, NULL, NULL, 0, 50);
INSERT INTO `registration_of_cases` VALUES (31, '湖人', '666666666666666', '科比', '53657', '12', 0, 56, 0, '分公司', '全额付', '2019-10-14', NULL, 10, '2019-10-15', 3, 2, NULL, NULL, NULL, 0, 50);
INSERT INTO `registration_of_cases` VALUES (32, '河北钢铁', '1234567-8', '小武', '130485200906041932', '13027788889', 1, 20, 0, '困困困困困', '李四', '2019-10-15', NULL, NULL, '2019-10-15', 4, 2, 3, 2, 3000.00, 1, 50);
INSERT INTO `registration_of_cases` VALUES (33, '中国石油', '12345678-9', '小武', '130166497884521', '1567894', 0, 25, 0, '1111', '李四', '2019-10-15', NULL, NULL, '2019-10-15', 4, NULL, 3, 2, 2333.00, 1, 50);
INSERT INTO `registration_of_cases` VALUES (35, '伊莱克', '123456879', '大志', '123456789456123456', '123456789645', 0, 52, 0, '战争', '李四', '2019-10-15', NULL, NULL, '2019-10-15', 4, 2, 5, 2, 5000.00, 1, 50);
INSERT INTO `registration_of_cases` VALUES (36, '湖人', '01234567', '科比', '123456789009876543', '18123456789', 0, 32, 0, '啦啦啦', '魔术师', '2019-10-15', NULL, 10, '2019-10-15', 1, 2, NULL, NULL, NULL, 0, 50);
INSERT INTO `registration_of_cases` VALUES (37, '美利坚', '000000000', '小特', '000000000000000', '000000000', 1, 50, 0, 'zz', '李四', '2019-10-15', NULL, NULL, '2019-10-15', 4, 2, 9, 3, 30000.00, 2, 50);
INSERT INTO `registration_of_cases` VALUES (38, '澳大利亚', '123456667', '小澳', '111111111111111111', '11111111111', 0, 30, 1, 'jr', '李四', '2019-10-15', NULL, NULL, '2019-10-15', 4, NULL, 6, 5, 9000.00, 2, 50);
INSERT INTO `registration_of_cases` VALUES (39, '辉煌国际', '123456789', '小慧', '1345678974561235489', '12345678945613', 0, 34, 1, 'ms', '李四', '2019-10-15', NULL, NULL, '2019-10-15', 4, NULL, 5, 2, 5000.00, 2, 50);
INSERT INTO `registration_of_cases` VALUES (40, '六道口职业技术学校', '123456789', '清北', '1304567894561234568', '12345678963', 0, 34, 0, '嗯哼', '李四', '2019-10-15', NULL, NULL, '2019-10-15', 4, 2, 3, 2, 4000.00, 2, 50);
INSERT INTO `registration_of_cases` VALUES (41, '中国建设银行', '01234567', 'hello', '123456789012345678', '13745678909', 1, 45, 0, '大', '老大', '2019-10-15', NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, 0, 50);
INSERT INTO `registration_of_cases` VALUES (42, '76人', '00000000', '本西蒙斯', '12345678901234567x', '18345678909', 0, 43, 0, '噫嘘唏', '赵六', '2019-10-15', '王中强', 10, '2019-10-15', 1, 3, NULL, NULL, NULL, 0, 50);
INSERT INTO `registration_of_cases` VALUES (43, '中国光大银行', '01234567', '王琦', '123456789012345678', '13111111111', 0, 45, 0, 'fgh', '2b', '2019-10-15', '王中强', 10, '2019-10-15', 0, 3, NULL, NULL, NULL, 0, 50);
INSERT INTO `registration_of_cases` VALUES (44, '腾讯', '01234567', '马化腾', '123456789098765432', '15176783537', 0, 45, 0, '儿子', '马化腾他儿子', '2019-10-16', '王中强', 10, '2019-10-16', 3, 2, NULL, NULL, NULL, 0, 50);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色主键ID',
  `role_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色姓名',
  `role_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, 'ADMIN', '系统管理员');
INSERT INTO `role` VALUES (2, 'KEZHANG', '科长');
INSERT INTO `role` VALUES (3, 'KESHICAOZUO', '科室操作人员');
INSERT INTO `role` VALUES (4, 'ZHUREN', '办公室主任');
INSERT INTO `role` VALUES (5, 'BANGONGSHICAOZUO', '办公室操作人员');

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission`  (
  `role_id` int(11) NOT NULL COMMENT '角色Id',
  `permission_id` int(11) NOT NULL COMMENT '权限Id',
  PRIMARY KEY (`role_id`, `permission_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for special_audit_materials
-- ----------------------------
DROP TABLE IF EXISTS `special_audit_materials`;
CREATE TABLE `special_audit_materials`  (
  `id` int(50) NOT NULL AUTO_INCREMENT COMMENT '专项审计材料表',
  `registration_of_cases_id` int(50) NULL DEFAULT NULL COMMENT '来案登记表ID',
  `audit_report_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审计报告url',
  `state` int(50) NULL DEFAULT NULL COMMENT '审计报告状态（0：未上传，1：已上传）',
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of special_audit_materials
-- ----------------------------
INSERT INTO `special_audit_materials` VALUES (1, 32, 'D:\\IdeaProjects\\shebaojicha\\src\\main\\resources\\static\\file\\socialsecurityaudit34766.txt', 1, '2019-10-15');
INSERT INTO `special_audit_materials` VALUES (2, 35, 'D:\\IdeaProjects\\shebaojicha\\src\\main\\resources\\static\\file\\socialsecurityaudit79436.sql', 1, '2019-10-15');
INSERT INTO `special_audit_materials` VALUES (3, 37, 'D:\\IdeaProjects\\shebaojicha\\src\\main\\resources\\static\\file\\socialsecurityaudit59294.txt', 1, '2019-10-15');
INSERT INTO `special_audit_materials` VALUES (4, 40, 'D:\\IdeaProjects\\shebaojicha\\src\\main\\resources\\static\\file\\socialsecurityaudit10589.txt', 1, '2019-10-15');

-- ----------------------------
-- Table structure for termination_of_filing_form
-- ----------------------------
DROP TABLE IF EXISTS `termination_of_filing_form`;
CREATE TABLE `termination_of_filing_form`  (
  `id` int(50) NOT NULL AUTO_INCREMENT COMMENT '终止立案原因表',
  `registration_of_cases_id` int(50) NULL DEFAULT NULL COMMENT '来案登记表ID',
  `cause_of_action` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '案由',
  `reasons_for_termination` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '终止执行原因',
  `investigator_views` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '调查人意见',
  `responsible_opinions` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人意见',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of termination_of_filing_form
-- ----------------------------
INSERT INTO `termination_of_filing_form` VALUES (1, 14, '热问题吧', '公认为', '为', '他');
INSERT INTO `termination_of_filing_form` VALUES (2, 15, '面对疾风吧', '风墙太厚', '没意见', '没意见');
INSERT INTO `termination_of_filing_form` VALUES (3, 28, '2356', '13545', '265456', '2354');
INSERT INTO `termination_of_filing_form` VALUES (4, 31, '不可以', '不', '不', '不');

-- ----------------------------
-- Table structure for ultimate
-- ----------------------------
DROP TABLE IF EXISTS `ultimate`;
CREATE TABLE `ultimate`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '科长审核表',
  `unit_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单位名称',
  `organizational_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组织机构代码',
  `name_of_the_complainant` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投诉人姓名',
  `id_card` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投诉人身份证号',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `account_character` int(2) NULL DEFAULT NULL COMMENT '户口性质 分为农业户口和非农业户口',
  `age` int(50) NULL DEFAULT NULL COMMENT '年龄',
  `sex` int(1) NULL DEFAULT NULL COMMENT '性别 分为男和女',
  `complaint_contents` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投诉内容',
  `name_of_registrant` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登记人姓名',
  `registration_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登记时间',
  `name_of_the_filer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '立案人姓名',
  `filing_month` int(50) NULL DEFAULT NULL COMMENT '立案月',
  `filing_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '立案时间',
  `approval_status` int(20) NULL DEFAULT NULL COMMENT '审批状态 (0：提交未审批，1：审批通过，2：审批未通过，3：结案归档,4:立案未提交);',
  `warning_time` int(11) NULL DEFAULT NULL COMMENT '预警时间',
  `number_of_auditors` int(50) NULL DEFAULT NULL COMMENT '审计人数',
  `audit_households` int(50) NULL DEFAULT NULL COMMENT '审计户数',
  `amount_paid` float(11, 2) NULL DEFAULT NULL COMMENT '补缴金额',
  `type_status` int(50) NULL DEFAULT NULL COMMENT '类型状态 (1、立案登记 2、日常审批 3、专项审批)',
  `maxtime` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ultimate
-- ----------------------------
INSERT INTO `ultimate` VALUES (38, '猛龙', '07654323', '卡哇伊', '789065456789087665', '18765436789', 0, 43, 0, '翻盖手机', '党国会', '2019-10-14', NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户表主键ID',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户账号',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户密码',
  `real_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `department` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` int(1) NULL DEFAULT 1 COMMENT '状态（0：关闭，1：正常）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (3, 'lzr', '123456', '刘卓然', '1', NULL);
INSERT INTO `user` VALUES (4, 'ww', '123456', '王五', '3', NULL);
INSERT INTO `user` VALUES (5, 'zl', '123456', '赵六', '2', NULL);
INSERT INTO `user` VALUES (7, 'zs', '123456', '张三', '2', NULL);

-- ----------------------------
-- Table structure for user_post
-- ----------------------------
DROP TABLE IF EXISTS `user_post`;
CREATE TABLE `user_post`  (
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `post_id` int(11) NOT NULL COMMENT '岗位Id',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `userid` int(11) NOT NULL DEFAULT 0,
  `roleid` int(11) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (1, 1);
INSERT INTO `user_role` VALUES (7, 3);
INSERT INTO `user_role` VALUES (3, 1);
INSERT INTO `user_role` VALUES (3, 2);
INSERT INTO `user_role` VALUES (3, 3);
INSERT INTO `user_role` VALUES (3, 5);

-- ----------------------------
-- Table structure for workday_maintenance
-- ----------------------------
DROP TABLE IF EXISTS `workday_maintenance`;
CREATE TABLE `workday_maintenance`  (
  `id` int(50) NOT NULL AUTO_INCREMENT COMMENT '工作日维护表',
  `date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日期',
  `is_working_day` int(2) NULL DEFAULT NULL COMMENT '是否工作日（0：否，1：是）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
