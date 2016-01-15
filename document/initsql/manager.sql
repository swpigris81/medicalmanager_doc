-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.6.25-log - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  9.2.0.4972
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 导出 manager 的数据库结构
CREATE DATABASE IF NOT EXISTS `manager` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `manager`;


-- 导出  表 manager.tbl_sys_area 结构
CREATE TABLE IF NOT EXISTS `tbl_sys_area` (
  `areaid` int(6) NOT NULL COMMENT '县区ID',
  `area` varchar(50) DEFAULT NULL COMMENT '县区名称',
  `cityid` int(6) DEFAULT NULL COMMENT '市ID',
  PRIMARY KEY (`areaid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='行政区域县区信息表';

-- 正在导出表  manager.tbl_sys_area 的数据：~0 rows (大约)
DELETE FROM `tbl_sys_area`;
/*!40000 ALTER TABLE `tbl_sys_area` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_sys_area` ENABLE KEYS */;


-- 导出  表 manager.tbl_sys_city 结构
CREATE TABLE IF NOT EXISTS `tbl_sys_city` (
  `cityid` int(6) NOT NULL COMMENT '城市ID',
  `provinceid` int(6) DEFAULT NULL COMMENT '省行政区划ID',
  `city` varchar(50) DEFAULT NULL COMMENT '城市名称',
  PRIMARY KEY (`cityid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='行政区域地州市信息表';

-- 正在导出表  manager.tbl_sys_city 的数据：~0 rows (大约)
DELETE FROM `tbl_sys_city`;
/*!40000 ALTER TABLE `tbl_sys_city` DISABLE KEYS */;
INSERT INTO `tbl_sys_city` (`cityid`, `provinceid`, `city`) VALUES
	(111234, 111111, '成都市'),
	(111235, 111111, '绵阳市');
/*!40000 ALTER TABLE `tbl_sys_city` ENABLE KEYS */;


-- 导出  表 manager.tbl_sys_province 结构
CREATE TABLE IF NOT EXISTS `tbl_sys_province` (
  `provinceid` int(6) NOT NULL COMMENT '省行政区划ID',
  `province` varchar(50) DEFAULT NULL COMMENT '省名称',
  PRIMARY KEY (`provinceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='行政区域省份信息表';

-- 正在导出表  manager.tbl_sys_province 的数据：~0 rows (大约)
DELETE FROM `tbl_sys_province`;
/*!40000 ALTER TABLE `tbl_sys_province` DISABLE KEYS */;
INSERT INTO `tbl_sys_province` (`provinceid`, `province`) VALUES
	(111111, '四川'),
	(222222, '广东');
/*!40000 ALTER TABLE `tbl_sys_province` ENABLE KEYS */;


-- 导出  表 manager.tbl_find_password 结构
CREATE TABLE IF NOT EXISTS `tbl_find_password` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `USER_ID` bigint(20) DEFAULT NULL COMMENT '用户主键',
  `USER_CODE` varchar(50) DEFAULT NULL COMMENT '用户登录名',
  `CHECK_CODE` varchar(500) DEFAULT NULL COMMENT '找回密码密文',
  `CREATE_OPER` varchar(50) DEFAULT NULL COMMENT '创建人',
  `CREATE_DATE` varchar(8) DEFAULT NULL COMMENT '创建日期',
  `CREATE_TIME` varchar(6) DEFAULT NULL COMMENT '创建时间',
  `MODIFY_OPER` varchar(50) DEFAULT NULL COMMENT '修改人',
  `MODIFY_DATE` varchar(8) DEFAULT NULL COMMENT '修改日期',
  `MODIFY_TIME` varchar(6) DEFAULT NULL COMMENT '修改时间',
  `REMARK` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='找回密码';

-- 正在导出表  manager.tbl_find_password 的数据：~0 rows (大约)
DELETE FROM `tbl_find_password`;
/*!40000 ALTER TABLE `tbl_find_password` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_find_password` ENABLE KEYS */;


-- 导出  表 manager.tbl_menu 结构
CREATE TABLE IF NOT EXISTS `tbl_menu` (
  `MENU_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `MENU_NAME` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `MENU_URL` varchar(500) DEFAULT NULL COMMENT '菜单访问路径',
  `PARENT_ID` bigint(20) DEFAULT NULL COMMENT '上级菜单ID',
  `IS_SHOW` varchar(1) DEFAULT NULL COMMENT '是否显示0-否1-是',
  `MENU_LEVEL` varchar(1) DEFAULT NULL COMMENT '菜单级别0-菜单级别1-按钮级别',
  `CREATE_OPER` varchar(50) DEFAULT NULL COMMENT '创建人',
  `CREATE_DATE` varchar(8) DEFAULT NULL COMMENT '创建日期',
  `CREATE_TIME` varchar(6) DEFAULT NULL COMMENT '创建时间',
  `MODIFY_OPER` varchar(50) DEFAULT NULL COMMENT '修改人',
  `MODIFY_DATE` varchar(8) DEFAULT NULL COMMENT '修改日期',
  `MODIFY_TIME` varchar(6) DEFAULT NULL COMMENT '修改时间',
  `REMARK` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`MENU_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='菜单';

-- 正在导出表  manager.tbl_menu 的数据：~21 rows (大约)
DELETE FROM `tbl_menu`;
/*!40000 ALTER TABLE `tbl_menu` DISABLE KEYS */;
INSERT INTO `tbl_menu` (`MENU_ID`, `MENU_NAME`, `MENU_URL`, `PARENT_ID`, `IS_SHOW`, `MENU_LEVEL`, `CREATE_OPER`, `CREATE_DATE`, `CREATE_TIME`, `MODIFY_OPER`, `MODIFY_DATE`, `MODIFY_TIME`, `REMARK`) VALUES
	(1, '后台管理系统', 'manager', NULL, '1', '0', 'swpigris81', '20150708', '130545', 'swpigris81', '20150708', '130545', '顶级菜单'),
	(2, '子菜单列表(必选)', '/menu/queryChildMenu.do', 1, '1', '1', 'swpigris81', '20150708', '130545', 'swpigris81', '20150708', '162707', '每个用户都必须有此菜单权限'),
	(3, '修改密码', '/user/modifyPassword.do', 1, '1', '1', 'swpigris81', '20150708', '130545', 'swpigris81', '20150708', '130545', '每个用户都需要有此菜单'),
	(4, '管理员管理', '/user/index.do', 21, '1', '0', 'swpigris81', '20150708', '130545', 'swpigris81', '20151204', '105348', ''),
	(5, '菜单管理', '/menu/index.do', 21, '1', '0', 'swpigris81', '20150708', '130545', 'swpigris81', '20150708', '162059', ''),
	(6, '菜单列表', '/menu/menuList.do', 5, '1', '1', 'swpigris81', '20150708', '130545', 'swpigris81', '20150721', '213840', ''),
	(7, '增加/修改菜单', '/menu/addMenu.do', 5, '1', '1', 'swpigris81', '20150708', '130545', 'swpigris81', '20150708', '131647', ''),
	(8, '管理组管理', '/role/index.do', 21, '1', '0', 'swpigris81', '20150708', '130545', 'swpigris81', '20151204', '105356', ''),
	(9, '角色列表', '/role/roleList.do', 8, '1', '1', 'swpigris81', '20150708', '130545', 'swpigris81', '20150721', '213843', ''),
	(10, '用户列表', '/user/userList.do', 4, '1', '1', 'swpigris81', '20150708', '130545', 'swpigris81', '20150721', '213854', ''),
	(11, '角色权限列表', '/role/roleAuthorityList.do', 8, '1', '1', 'swpigris81', '20150708', '130545', 'swpigris81', '20150708', '162815', ''),
	(12, '分配权限', '/role/saveAuthority.do', 8, '1', '1', 'swpigris81', '20150708', '130545', 'swpigris81', '20150721', '213847', ''),
	(13, '用户角色列表', '/user/userRoleList.do', 4, '1', '1', 'swpigris81', '20150708', '130545', 'swpigris81', '20150721', '213851', ''),
	(15, '删除菜单', '/menu/deleteMenu.do', 5, '1', '1', 'swpigris81', '20150708', '130545', 'swpigris81', '20150708', '130545', ''),
	(16, '增加/修改角色', '/role/saveRole.do', 8, '1', '1', 'swpigris81', '20150708', '134405', 'swpigris81', '20150708', '134405', '增加/修改角色'),
	(17, '删除角色', '/role/deleteRole.do', 8, '1', '1', 'swpigris81', '20150708', '141206', 'swpigris81', '20150708', '141206', ''),
	(18, '增加/修改用户', '/user/saveUser.do', 4, '1', '1', 'swpigris81', '20150708', '143949', 'swpigris81', '20150708', '143949', '增加/修改用户'),
	(19, '删除用户', '/user/deleteUser.do', 4, '1', '1', 'swpigris81', '20150708', '144116', 'swpigris81', '20150708', '144137', '删除用户'),
	(20, '增加/修改用户角色', '/user/saveUserRole.do', 4, '1', '1', 'swpigris81', '20150708', '160433', 'swpigris81', '20150708', '160433', '增加/修改用户角色'),
	(21, '权限管理', 'system', 1, '1', '0', 'swpigris81', '20150708', '162025', 'swpigris81', '20151204', '114933', ''),
	(22, '禁用管理员', '/user/invalidUser.do', 4, '1', '1', 'swpigris81', '20151203', '104718', 'swpigris81', '20151203', '104718', '禁用管理员'),
	(23, '省市管理', '/administrative', 21, '0', '0', 'swpigris81', '20151203', '170955', 'swpigris81', '20151203', '173440', ''),
	(24, '根据省查询市', '/administrative/searchCityByProvice.do', 23, '1', '1', 'swpigris81', '20151203', '171029', 'swpigris81', '20151203', '171029', '根据省查询市'),
	(25, '启用管理员', '/user/validUser.do', 4, '0', '1', 'swpigris81', '20151204', '113221', 'swpigris81', '20151204', '113221', '启用管理员'),
	(26, '宣传管理', 'propaganda', 1, '1', '0', 'swpigris81', '20151204', '115237', 'swpigris81', '20151204', '115237', '宣传管理'),
	(27, '站内信', '/messaging/index.do', 26, '1', '0', 'swpigris81', '20151204', '115336', 'swpigris81', '20151204', '115336', '站内信'),
	(28, '站内信列表', '/messaging/messageList.do', 27, '0', '1', 'swpigris81', '20151204', '115427', 'swpigris81', '20151204', '115427', '站内信列表'),
	(29, '发布站内信', '/messaging/sendMessage.do', 27, '0', '1', 'swpigris81', '20151204', '115456', 'swpigris81', '20151204', '115456', '发布站内信'),
	(30, '黑名单', '/blacklist/index.do', 26, '1', '0', 'swpigris81', '20151204', '115604', 'swpigris81', '20151204', '115604', '黑名单'),
	(31, '黑名单列表', '/blacklist/blackList.do', 30, '0', '1', 'swpigris81', '20151204', '115639', 'swpigris81', '20151204', '115639', '黑名单列表'),
	(32, '增加/修改黑名单', '/blacklist/saveBlacklist.do', 30, '0', '1', 'swpigris81', '20151204', '115712', 'swpigris81', '20151204', '115831', ''),
	(33, '删除黑名单', '/blacklist/deleteBlacklist.do', 30, '0', '1', 'swpigris81', '20151204', '115734', 'swpigris81', '20151204', '115734', '删除黑名单'),
	(34, 'APP首页幻灯片', '/appindex/index.do', 26, '1', '0', 'swpigris81', '20151204', '115952', 'swpigris81', '20151204', '115952', 'APP首页幻灯片'),
	(35, '新增/修改APP首页幻灯片', '/appindex/saveSlide.do', 34, '0', '1', 'swpigris81', '20151204', '120100', 'swpigris81', '20151204', '120100', '新增/修改APP首页幻灯片'),
	(36, '删除幻灯片', '/appindex/deleteSlide.do', 34, '0', '1', 'swpigris81', '20151204', '120122', 'swpigris81', '20151204', '120122', '删除幻灯片'),
	(37, 'APP首页幻灯片列表', '/appindex/slideList.do', 34, '0', '1', 'swpigris81', '20151204', '120157', 'swpigris81', '20151204', '120157', 'APP首页幻灯片列表');
/*!40000 ALTER TABLE `tbl_menu` ENABLE KEYS */;


-- 导出  表 manager.tbl_role 结构
CREATE TABLE IF NOT EXISTS `tbl_role` (
  `ROLE_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `ROLE_NAME` varchar(50) DEFAULT NULL COMMENT '角色名称',
  `CREATE_OPER` varchar(50) DEFAULT NULL COMMENT '创建人',
  `CREATE_DATE` varchar(8) DEFAULT NULL COMMENT '创建日期',
  `CREATE_TIME` varchar(6) DEFAULT NULL COMMENT '创建时间',
  `MODIFY_OPER` varchar(50) DEFAULT NULL COMMENT '修改人',
  `MODIFY_DATE` varchar(8) DEFAULT NULL COMMENT '修改日期',
  `MODIFY_TIME` varchar(6) DEFAULT NULL COMMENT '修改时间',
  `REMARK` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`ROLE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='角色';

-- 正在导出表  manager.tbl_role 的数据：~13 rows (大约)
DELETE FROM `tbl_role`;
/*!40000 ALTER TABLE `tbl_role` DISABLE KEYS */;
INSERT INTO `tbl_role` (`ROLE_ID`, `ROLE_NAME`, `CREATE_OPER`, `CREATE_DATE`, `CREATE_TIME`, `MODIFY_OPER`, `MODIFY_DATE`, `MODIFY_TIME`, `REMARK`) VALUES
	(1, '系统管理员', NULL, NULL, NULL, 'swpigris81', '20150708', '142550', '系统管理员（请勿删除）'),
	(14, '管理员', 'swpigris81', '20150708', '142637', 'swpigris81', '20150708', '142637', '管理员'),
	(15, '1', '1', NULL, NULL, NULL, NULL, NULL, NULL),
	(16, '2', '2', NULL, NULL, NULL, NULL, NULL, NULL),
	(17, '3', '3', NULL, NULL, NULL, NULL, NULL, NULL),
	(18, '4', '4', NULL, NULL, NULL, NULL, NULL, NULL),
	(19, '5', '5', NULL, NULL, NULL, NULL, NULL, NULL),
	(20, '6', '6', NULL, NULL, NULL, NULL, NULL, NULL),
	(21, '7', '7', NULL, NULL, NULL, NULL, NULL, NULL),
	(22, '8', '8', NULL, NULL, NULL, NULL, NULL, NULL),
	(23, '9', '9', NULL, NULL, NULL, NULL, NULL, NULL),
	(24, '10', '10', NULL, NULL, NULL, NULL, NULL, NULL),
	(25, '11', '11', NULL, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `tbl_role` ENABLE KEYS */;


-- 导出  表 manager.tbl_role_authority 结构
CREATE TABLE IF NOT EXISTS `tbl_role_authority` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `ROLE_ID` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `MENU_ID` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  `CREATE_OPER` varchar(50) DEFAULT NULL COMMENT '创建人',
  `CREATE_DATE` varchar(8) DEFAULT NULL COMMENT '创建日期',
  `CREATE_TIME` varchar(6) DEFAULT NULL COMMENT '创建时间',
  `MODIFY_OPER` varchar(50) DEFAULT NULL COMMENT '修改人',
  `MODIFY_DATE` varchar(8) DEFAULT NULL COMMENT '修改日期',
  `MODIFY_TIME` varchar(6) DEFAULT NULL COMMENT '修改时间',
  `REMARK` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1155 DEFAULT CHARSET=utf8 COMMENT='角色权限';

-- 正在导出表  manager.tbl_role_authority 的数据：~21 rows (大约)
DELETE FROM `tbl_role_authority`;
/*!40000 ALTER TABLE `tbl_role_authority` DISABLE KEYS */;
INSERT INTO `tbl_role_authority` (`ID`, `ROLE_ID`, `MENU_ID`, `CREATE_OPER`, `CREATE_DATE`, `CREATE_TIME`, `MODIFY_OPER`, `MODIFY_DATE`, `MODIFY_TIME`, `REMARK`) VALUES
	(1132, 1, 1, NULL, '20151203', '171039', NULL, '20151203', '171039', '角色权限修改'),
	(1133, 1, 2, NULL, '20151203', '171039', NULL, '20151203', '171039', '角色权限修改'),
	(1134, 1, 3, NULL, '20151203', '171039', NULL, '20151203', '171039', '角色权限修改'),
	(1135, 1, 21, NULL, '20151203', '171039', NULL, '20151203', '171039', '角色权限修改'),
	(1136, 1, 4, NULL, '20151203', '171039', NULL, '20151203', '171039', '角色权限修改'),
	(1137, 1, 10, NULL, '20151203', '171039', NULL, '20151203', '171039', '角色权限修改'),
	(1138, 1, 13, NULL, '20151203', '171039', NULL, '20151203', '171039', '角色权限修改'),
	(1139, 1, 18, NULL, '20151203', '171039', NULL, '20151203', '171039', '角色权限修改'),
	(1140, 1, 19, NULL, '20151203', '171039', NULL, '20151203', '171039', '角色权限修改'),
	(1141, 1, 20, NULL, '20151203', '171039', NULL, '20151203', '171039', '角色权限修改'),
	(1142, 1, 22, NULL, '20151203', '171039', NULL, '20151203', '171039', '角色权限修改'),
	(1143, 1, 5, NULL, '20151203', '171039', NULL, '20151203', '171039', '角色权限修改'),
	(1144, 1, 6, NULL, '20151203', '171039', NULL, '20151203', '171039', '角色权限修改'),
	(1145, 1, 7, NULL, '20151203', '171039', NULL, '20151203', '171039', '角色权限修改'),
	(1146, 1, 15, NULL, '20151203', '171039', NULL, '20151203', '171039', '角色权限修改'),
	(1147, 1, 8, NULL, '20151203', '171039', NULL, '20151203', '171039', '角色权限修改'),
	(1148, 1, 9, NULL, '20151203', '171039', NULL, '20151203', '171039', '角色权限修改'),
	(1149, 1, 11, NULL, '20151203', '171039', NULL, '20151203', '171039', '角色权限修改'),
	(1150, 1, 12, NULL, '20151203', '171039', NULL, '20151203', '171039', '角色权限修改'),
	(1151, 1, 16, NULL, '20151203', '171039', NULL, '20151203', '171039', '角色权限修改'),
	(1152, 1, 17, NULL, '20151203', '171039', NULL, '20151203', '171039', '角色权限修改'),
	(1153, 1, 23, NULL, '20151203', '171039', NULL, '20151203', '171039', '角色权限修改'),
	(1154, 1, 24, NULL, '20151203', '171039', NULL, '20151203', '171039', '角色权限修改');
/*!40000 ALTER TABLE `tbl_role_authority` ENABLE KEYS */;


-- 导出  表 manager.tbl_user 结构
CREATE TABLE IF NOT EXISTS `tbl_user` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `USER_CODE` varchar(50) DEFAULT NULL COMMENT '用户登录名',
  `USER_NAME` varchar(50) DEFAULT NULL COMMENT '用户名称',
  `USER_MOBILE` varchar(20) DEFAULT NULL COMMENT '手机号',
  `USER_EMAIL` varchar(50) DEFAULT NULL COMMENT '邮箱地址',
  `CREATE_OPER` varchar(50) DEFAULT NULL COMMENT '创建人',
  `CREATE_DATE` varchar(8) DEFAULT NULL COMMENT '创建日期',
  `CREATE_TIME` varchar(6) DEFAULT NULL COMMENT '创建时间',
  `MODIFY_OPER` varchar(50) DEFAULT NULL COMMENT '修改人',
  `MODIFY_DATE` varchar(8) DEFAULT NULL COMMENT '修改日期',
  `MODIFY_TIME` varchar(6) DEFAULT NULL COMMENT '修改时间',
  `REMARK` varchar(500) DEFAULT NULL COMMENT '备注',
  `USER_UNIT` varchar(100) DEFAULT NULL COMMENT '单位',
  `USER_PROVINCE` varchar(100) DEFAULT NULL COMMENT '省',
  `USER_CITY` varchar(100) DEFAULT NULL COMMENT '市',
  `LAST_LOGIN_TIME` varchar(20) DEFAULT NULL COMMENT '上次登录时间',
  `LAST_LOGIN_IP` varchar(100) DEFAULT NULL COMMENT '上次登录IP',
  `CURRENT_STATUS` varchar(2) DEFAULT NULL COMMENT '当前状态:00-正常09-禁用',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='用户';

-- 正在导出表  manager.tbl_user 的数据：~2 rows (大约)
DELETE FROM `tbl_user`;
/*!40000 ALTER TABLE `tbl_user` DISABLE KEYS */;
INSERT INTO `tbl_user` (`ID`, `USER_CODE`, `USER_NAME`, `USER_MOBILE`, `USER_EMAIL`, `CREATE_OPER`, `CREATE_DATE`, `CREATE_TIME`, `MODIFY_OPER`, `MODIFY_DATE`, `MODIFY_TIME`, `REMARK`, `USER_UNIT`, `USER_PROVINCE`, `USER_CITY`, `LAST_LOGIN_TIME`, `LAST_LOGIN_IP`, `CURRENT_STATUS`) VALUES
	(1, 'swpigris81', '代超', '13355555555', 'daichao@mfhcd.com', NULL, NULL, NULL, 'swpigris81', '20151203', '171926', '备注', '公司', '111111', '111235', '2015-12-03 15:45:03', NULL, '00'),
	(4, 'swpigris82', '姓名', '13333333333', NULL, 'swpigris81', '20151203', '130627', 'swpigris81', '20151203', '171911', NULL, '公司', '111111', '111234', NULL, NULL, '09'),
	(5, 'swpigris83', '姓名', '13333333333', NULL, 'swpigris81', '20151203', '171509', 'swpigris81', '20151203', '171509', NULL, '公司', '111111', '111234', NULL, NULL, '00');
/*!40000 ALTER TABLE `tbl_user` ENABLE KEYS */;


-- 导出  表 manager.tbl_user_role 结构
CREATE TABLE IF NOT EXISTS `tbl_user_role` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `USER_ID` bigint(20) DEFAULT NULL COMMENT '用户主键',
  `USER_CODE` varchar(50) DEFAULT NULL COMMENT '用户登录名',
  `ROLE_ID` bigint(20) DEFAULT NULL COMMENT '角色主键',
  `USER_TYPE` varchar(2) DEFAULT NULL COMMENT '用户类型',
  `CREATE_OPER` varchar(50) DEFAULT NULL COMMENT '创建人',
  `CREATE_DATE` varchar(8) DEFAULT NULL COMMENT '创建日期',
  `CREATE_TIME` varchar(6) DEFAULT NULL COMMENT '创建时间',
  `MODIFY_OPER` varchar(50) DEFAULT NULL COMMENT '修改人',
  `MODIFY_DATE` varchar(8) DEFAULT NULL COMMENT '修改日期',
  `MODIFY_TIME` varchar(6) DEFAULT NULL COMMENT '修改时间',
  `REMARK` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='用户角色';

-- 正在导出表  manager.tbl_user_role 的数据：~2 rows (大约)
DELETE FROM `tbl_user_role`;
/*!40000 ALTER TABLE `tbl_user_role` DISABLE KEYS */;
INSERT INTO `tbl_user_role` (`ID`, `USER_ID`, `USER_CODE`, `ROLE_ID`, `USER_TYPE`, `CREATE_OPER`, `CREATE_DATE`, `CREATE_TIME`, `MODIFY_OPER`, `MODIFY_DATE`, `MODIFY_TIME`, `REMARK`) VALUES
	(1, 1, 'swpigris81', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(4, 4, 'swpigris82', 1, NULL, 'swpigris81', '20151203', '130627', 'swpigris81', '20151203', '130627', '角色初始化'),
	(5, 5, 'swpigris83', 1, NULL, 'swpigris81', '20151203', '171509', 'swpigris81', '20151203', '171509', '角色初始化');
/*!40000 ALTER TABLE `tbl_user_role` ENABLE KEYS */;


-- 导出  表 manager.tbl_user_secret 结构
CREATE TABLE IF NOT EXISTS `tbl_user_secret` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `USER_ID` bigint(20) DEFAULT NULL COMMENT '用户主键',
  `USER_CODE` varchar(50) DEFAULT NULL COMMENT '用户登录名',
  `USER_PASSWORD` varchar(100) DEFAULT NULL COMMENT '用户登录密码',
  `USER_PROTECT_QUESTION` varchar(100) DEFAULT NULL COMMENT '用户密码保护问题',
  `USER_PROTECT_ANSWER` varchar(100) DEFAULT NULL COMMENT '用户密码保护答案',
  `CREATE_OPER` varchar(50) DEFAULT NULL COMMENT '创建人',
  `CREATE_DATE` varchar(8) DEFAULT NULL COMMENT '创建日期',
  `CREATE_TIME` varchar(6) DEFAULT NULL COMMENT '创建时间',
  `MODIFY_OPER` varchar(50) DEFAULT NULL COMMENT '修改人',
  `MODIFY_DATE` varchar(8) DEFAULT NULL COMMENT '修改日期',
  `MODIFY_TIME` varchar(6) DEFAULT NULL COMMENT '修改时间',
  `REMARK` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='用户密码';

-- 正在导出表  manager.tbl_user_secret 的数据：~2 rows (大约)
DELETE FROM `tbl_user_secret`;
/*!40000 ALTER TABLE `tbl_user_secret` DISABLE KEYS */;
INSERT INTO `tbl_user_secret` (`ID`, `USER_ID`, `USER_CODE`, `USER_PASSWORD`, `USER_PROTECT_QUESTION`, `USER_PROTECT_ANSWER`, `CREATE_OPER`, `CREATE_DATE`, `CREATE_TIME`, `MODIFY_OPER`, `MODIFY_DATE`, `MODIFY_TIME`, `REMARK`) VALUES
	(1, 1, 'swpigris81', '546bbbf35be6c68ea30e2af88783fd10', NULL, NULL, NULL, NULL, NULL, 'swpigris81', '20150706', '090431', NULL),
	(4, 4, 'swpigris82', '1946040e438a1923b23a6d0f1197c9c0', NULL, NULL, 'swpigris81', '20151203', '130627', 'swpigris81', '20151203', '130627', '密码初始化'),
	(5, 5, 'swpigris83', '6af8758ac1c4ee283aaf214fd23abfee', NULL, NULL, 'swpigris81', '20151203', '171509', 'swpigris81', '20151203', '171509', '密码初始化');
/*!40000 ALTER TABLE `tbl_user_secret` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;



-- 导出  表 manager.tbl_propa_app_slide 结构
CREATE TABLE IF NOT EXISTS `tbl_propa_app_slide` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `IMAGE_URL` varchar(255) DEFAULT NULL COMMENT '图片URL',
  `IMAGE_LOCATION` varchar(255) DEFAULT NULL COMMENT '图片所在服务器绝对路径',
  `TYPE` varchar(10) DEFAULT NULL COMMENT '类型',
  `USER_TYPE` varchar(10) DEFAULT NULL COMMENT '用户类型',
  `CREATE_OPER` varchar(50) DEFAULT NULL COMMENT '创建人',
  `CREATE_DATE` varchar(8) DEFAULT NULL COMMENT '创建日期',
  `CREATE_TIME` varchar(6) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='APP首页幻灯片';

-- 正在导出表  manager.tbl_propa_app_slide 的数据：~0 rows (大约)
DELETE FROM `tbl_propa_app_slide`;
/*!40000 ALTER TABLE `tbl_propa_app_slide` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_propa_app_slide` ENABLE KEYS */;


-- 导出  表 manager.tbl_propa_black_list 结构
CREATE TABLE IF NOT EXISTS `tbl_propa_black_list` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `USER_NAME` varchar(100) DEFAULT NULL COMMENT '用户名',
  `USER_MOBILE` varchar(50) DEFAULT NULL COMMENT '手机号',
  `TYPE` varchar(10) DEFAULT NULL COMMENT '类型',
  `TYPE_NAME` varchar(50) DEFAULT NULL COMMENT '类型名称',
  `REMARK` varchar(500) DEFAULT NULL COMMENT '备注',
  `CREATE_OPER` varchar(50) DEFAULT NULL COMMENT '创建人',
  `CREATE_DATE` varchar(8) DEFAULT NULL COMMENT '创建日期',
  `CREATE_TIME` varchar(6) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='黑名单';

-- 正在导出表  manager.tbl_propa_black_list 的数据：~0 rows (大约)
DELETE FROM `tbl_propa_black_list`;
/*!40000 ALTER TABLE `tbl_propa_black_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_propa_black_list` ENABLE KEYS */;

drop table if exists TBL_propa_SITE_MESSAGE;

/*==============================================================*/
/* Table: TBL_propa_SITE_MESSAGE                                */
/*==============================================================*/
create table TBL_propa_SITE_MESSAGE
(
   ID                   bigint not null auto_increment comment '主键',
   TITLE                varchar(100) comment '信息标题',
   SEND_OPER            varchar(100) comment '发送人',
   RECEIVE_OPER         varchar(100) comment '接收人',
   CONTENT              text comment '内容',
   PROVINCE             int comment '省份',
   PROVINCE_NAME        varchar(100) comment '省份名称',
   CITY                 int comment '市',
   CITY_NAME            varchar(100) comment '市名称',
   TYPE                 varchar(10) comment '类型',
   TYPE_NAME            varchar(100) comment '类型中文',
   CREATE_OPER          varchar(50) comment '创建人',
   CREATE_DATE          varchar(8) comment '创建日期',
   CREATE_TIME          varchar(6) comment '创建时间',
   STATUS               varchar(2) comment '状态00-未读01-已读',
   primary key (ID)
);

alter table TBL_propa_SITE_MESSAGE comment '站内信息';

/*!40000 ALTER TABLE `tbl_propa_site_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_propa_site_message` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
