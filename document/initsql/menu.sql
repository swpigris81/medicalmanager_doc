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
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8 COMMENT='菜单';

-- 正在导出表  manager.tbl_menu 的数据：~97 rows (大约)
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
	(37, 'APP首页幻灯片列表', '/appindex/slideList.do', 34, '0', '1', 'swpigris81', '20151204', '120157', 'swpigris81', '20151204', '120157', 'APP首页幻灯片列表'),
	(38, 'APP首页幻灯片上传', '/appindex/uploadImg.do', 34, '0', '1', 'swpigris81', '20151207', '094650', 'swpigris81', '20151207', '094650', 'APP首页幻灯片上传'),
	(39, '阅读站内信', '/messaging/readMessage.do', 27, '0', '1', 'swpigris81', '20151207', '094801', 'swpigris81', '20151207', '094801', '阅读站内信'),
	(40, '资金管理', 'funds', 1, '1', '0', 'swpigris81', '20151207', '114840', 'swpigris81', '20151207', '115251', ''),
	(41, '用户资金管理', '/funds/index.do', 40, '1', '0', 'swpigris81', '20151207', '114925', 'swpigris81', '20151207', '115301', '用户资金管理'),
	(42, '用户资金明细', '/funds/fundsList.do', 41, '0', '0', 'swpigris81', '20151207', '115025', 'swpigris81', '20151207', '115157', ''),
	(43, '提现管理', '/withdraw/index.do', 40, '1', '0', 'swpigris81', '20151207', '132147', 'swpigris81', '20151207', '132147', '提现管理'),
	(44, '提现列表', '/withdraw/withdrawList.do', 43, '0', '1', 'swpigris81', '20151207', '132210', 'swpigris81', '20151207', '132210', '提现列表'),
	(45, '保存提现信息', '/withdraw/saveWithdraw.do', 43, '0', '1', 'swpigris81', '20151207', '132232', 'swpigris81', '20151207', '132232', '保存提现信息'),
	(46, '充值管理', '/recharge/index.do', 40, '1', '0', 'swpigris81', '20151207', '135135', 'swpigris81', '20151207', '135135', '充值管理'),
	(47, '充值列表', '/recharge/rechargeList.do', 46, '0', '1', 'swpigris81', '20151207', '135159', 'swpigris81', '20151207', '135159', '充值列表'),
	(48, '导出充值记录', '/recharge/rechargeExport.do', 46, '0', '1', 'swpigris81', '20151207', '135959', 'swpigris81', '20151207', '135959', '导出充值记录'),
	(49, '提现导出', '/withdraw/withdrawExport.do', 43, '0', '1', 'swpigris81', '20151207', '153940', 'swpigris81', '20151207', '153940', '提现导出'),
	(50, '商品管理', 'product', 1, '1', '0', 'swpigris81', '20151207', '161509', 'swpigris81', '20151207', '161509', '商品管理'),
	(51, '品牌管理', '/product/brandIndex.do', 50, '1', '0', 'swpigris81', '20151207', '161527', 'swpigris81', '20151207', '161527', '品牌管理'),
	(52, '品牌列表', '/product/queryBrandList.do', 51, '0', '1', 'swpigris81', '20151207', '161544', 'swpigris81', '20151207', '161544', '品牌列表'),
	(53, '商品管理', '/product/productIndex.do', 50, '1', '0', 'swpigris81', '20151207', '161607', 'swpigris81', '20151207', '161607', '商品管理'),
	(54, '商品列表', '/product/queryProductList.do', 53, '0', '1', 'swpigris81', '20151207', '162132', 'swpigris81', '20151207', '162132', '商品列表'),
	(55, '新增/修改商品', '/product/saveOrUpdateProduct.do', 53, '0', '1', 'swpigris81', '20151207', '162151', 'swpigris81', '20151207', '162151', '新增/修改商品'),
	(56, '订单管理', '/order/orderIndex.do', 50, '1', '0', 'swpigris81', '20151207', '162211', 'swpigris81', '20151207', '162211', '订单管理'),
	(57, '订单列表', '/order/queryOrderList.do', 56, '0', '1', 'swpigris81', '20151207', '162233', 'swpigris81', '20151207', '162233', '订单列表'),
	(58, '发货', '/order/deliverProduct.do', 56, '0', '1', 'swpigris81', '20151207', '162300', 'swpigris81', '20151207', '162300', '发货'),
	(59, '机器码管理', '/machineCode/machineCodeIndex.do', 50, '1', '0', 'swpigris81', '20151207', '162321', 'swpigris81', '20151207', '162321', '机器码管理'),
	(60, '机器码列表', '/machineCode/queryMachineCodeList.do', 59, '0', '1', 'swpigris81', '20151207', '162337', 'swpigris81', '20151207', '162337', '机器码列表'),
	(61, '批量生成机器码', '/machineCode/produceMachineCodes.do', 59, '0', '1', 'swpigris81', '20151207', '162410', 'swpigris81', '20151207', '162410', '批量生成机器码'),
	(62, '机器码使用管理', '/machineCode/machineUseIndex.do', 50, '1', '0', 'swpigris81', '20151207', '162427', 'swpigris81', '20151207', '162427', '机器码使用管理'),
	(63, '机器码使用状态列表', '/machineCode/queryMachineUseList.do', 62, '0', '1', 'swpigris81', '20151207', '162444', 'swpigris81', '20151207', '162444', '机器码使用状态列表'),
	(64, '系统设置', 'systemset', 1, '1', '0', 'swpigris81', '20151207', '162501', 'swpigris81', '20151207', '162501', '系统设置'),
	(65, '收款账户设置', '/systemset/sysReceivablesIndex.do', 64, '1', '0', 'swpigris81', '20151207', '162521', 'swpigris81', '20151207', '162521', '收款账户设置'),
	(66, '保存/更新收款账户设置', '/systemset/saveOrUpdateSysReceivables.do', 65, '0', '1', 'swpigris81', '20151207', '162540', 'swpigris81', '20151207', '162540', '保存/更新收款账户设置'),
	(67, '系统设置', '/systemset/sysInfoIndex.do', 64, '1', '0', 'swpigris81', '20151207', '162557', 'swpigris81', '20151207', '162557', '系统设置'),
	(68, '保存系统设置信息', '/systemset/saveOrUpdateSysInfo.do', 67, '0', '1', 'swpigris81', '20151207', '162613', 'swpigris81', '20151207', '162613', '保存系统设置信息'),
	(69, '认证管理', 'authentiction', 1, '1', '0', 'swpigris81', '20151207', '162630', 'swpigris81', '20151207', '162630', '认证管理'),
	(70, '基本资料审核', '/authentiction/cusBasicInfoIndex.do', 69, '1', '0', 'swpigris81', '20151207', '162705', 'swpigris81', '20151207', '162705', '基本资料审核'),
	(71, '注册客户信息列表', '/authentiction/queryCusBasicExpandList.do', 70, '0', '1', 'swpigris81', '20151207', '162723', 'swpigris81', '20151207', '162723', '注册客户信息列表'),
	(72, '保存/更新客户审核资料', '/authentiction/saveOrUpdateCusBasicExpand.do', 70, '0', '1', 'swpigris81', '20151207', '162738', 'swpigris81', '20151207', '162738', '保存/更新客户审核资料'),
	(73, '审核客户基本资料', '/authentiction/checkCusBasicExpand.do', 70, '0', '1', 'swpigris81', '20151207', '162754', 'swpigris81', '20151207', '162754', '审核客户基本资料'),
	(74, '手机变更申请', '/authentiction/phoneChangeApplyIndex.do', 69, '1', '0', 'swpigris81', '20151207', '162822', 'swpigris81', '20151207', '163041', ''),
	(75, '查询手机变更申请列表', '/authentiction/queryPhoneChangeApplyList.do', 74, '0', '1', 'swpigris81', '20151207', '162844', 'swpigris81', '20151207', '162844', '查询手机变更申请列表'),
	(76, '审核手机变更申请', '/authentiction/checkPhoneChangeApply.do', 74, '0', '1', 'swpigris81', '20151207', '162901', 'swpigris81', '20151207', '162901', '审核手机变更申请'),
	(77, '初始化系统设置信息', '/systemset/initSysInfo.do', 67, '0', '1', 'swpigris81', '20151207', '162923', 'swpigris81', '20151207', '163932', ''),
	(78, '根据市查询区县', '/administrative/searchCountyByCity.do', 23, '0', '1', 'swpigris81', '20151207', '163010', 'swpigris81', '20151207', '163010', '根据市查询区县'),
	(79, '发货管理', '/order/deleverProductIndex.do', 50, '1', '0', 'swpigris81', '20151207', '163232', 'swpigris81', '20151207', '163232', '发货管理'),
	(80, '查询发货信息', '/order/queryDeliverProductList.do', 79, '0', '1', 'swpigris81', '20151207', '163249', 'swpigris81', '20151207', '163249', '查询发货信息'),
	(81, '客户管理', 'customer', 1, '1', '0', 'swpigris81', '20151207', '164738', 'swpigris81', '20151207', '164738', '客户管理'),
	(82, '用户基本信息管理', '/customer/basic/index.do', 81, '1', '0', 'swpigris81', '20151207', '164756', 'swpigris81', '20151207', '164756', '用户基本信息管理'),
	(83, '用户基本信息管理列表', '/customer/basic/queryBasicInfoList.do', 82, '0', '1', 'swpigris81', '20151207', '164846', 'swpigris81', '20151207', '165011', ''),
	(84, '用户基本信息管理修改', '/customer/basic/saveOrUpdate.do', 82, '0', '1', 'swpigris81', '20151207', '165003', 'swpigris81', '20151207', '165003', '用户基本信息管理修改'),
	(85, '用户积分管理', '/customer/score/index.do', 81, '1', '0', 'swpigris81', '20151207', '165027', 'swpigris81', '20151207', '165027', '用户积分管理'),
	(86, '用户积分管理列表', '/customer/score/queryScoreList.do', 85, '0', '1', 'swpigris81', '20151207', '165044', 'swpigris81', '20151207', '165044', '用户积分管理列表'),
	(87, '用户积分管理修改', '/customer/score/saveOrUpdate.do', 85, '0', '1', 'swpigris81', '20151207', '165057', 'swpigris81', '20151207', '165057', '用户积分管理修改'),
	(88, '未激活用户管理', '/customer/inactive/index.do', 81, '1', '0', 'swpigris81', '20151207', '165113', 'swpigris81', '20151207', '165113', '未激活用户管理'),
	(89, '未激活用户管理列表', '/customer/inactive/queryInactiveList.do', 88, '0', '1', 'swpigris81', '20151207', '165127', 'swpigris81', '20151207', '165127', '未激活用户管理列表'),
	(90, '未激活用户管理修改', '/customer/inactive/saveOrUpdate.do', 88, '0', '1', 'swpigris81', '20151207', '165205', 'swpigris81', '20151207', '165205', '未激活用户管理修改'),
	(91, '锁定用户管理', '/customer/lock/index.do', 81, '1', '0', 'swpigris81', '20151207', '165222', 'swpigris81', '20151207', '165222', '锁定用户管理'),
	(92, '锁定用户管理列表', '/customer/lock/queryLockList.do', 91, '0', '1', 'swpigris81', '20151207', '165236', 'swpigris81', '20151207', '165236', '锁定用户管理列表'),
	(93, '锁定用户管理列表修改', '/customer/lock/saveOrUpdate.do', 91, '0', '1', 'swpigris81', '20151207', '165254', 'swpigris81', '20151207', '165254', '锁定用户管理列表修改'),
	(94, '用户举报管理', '/customer/report/index.do', 81, '1', '0', 'swpigris81', '20151207', '165308', 'swpigris81', '20151207', '165308', '用户举报管理'),
	(95, '用户举报管理列表', '/customer/report/queryReportList.do', 94, '0', '1', 'swpigris81', '20151207', '165322', 'swpigris81', '20151207', '165322', '用户举报管理列表'),
	(96, '统计管理', 'stat', 1, '1', '0', 'swpigris81', '20151207', '165336', 'swpigris81', '20151207', '165336', '统计管理'),
	(97, '登录统计', '/stat/login/index.do', 96, '1', '0', 'swpigris81', '20151207', '165355', 'swpigris81', '20151207', '165355', '登录统计'),
	(98, '登录统计列表', '/stat/login/queryStatLoginList.do', 97, '0', '1', 'swpigris81', '20151207', '165413', 'swpigris81', '20151207', '165413', '登录统计列表'),
	(99, '综合统计', '/stat/general/index.do', 96, '1', '0', 'swpigris81', '20151208', '103346', 'swpigris81', '20151208', '103346', ''),
	(100, '综合统计列表', '/stat/general/queryGeneralStatList.do', 99, '0', '0', 'swpigris81', '20151208', '103318', 'swpigris81', '20151208', '103318', ''),
	(101, '综合统计导出', '/stat/general/exportGeneralStat.do', 99, '0', '1', 'swpigris81', '20151208', '103430', 'swpigris81', '20151208', '103430', ''),
	(102, '辖区报警数据统计', '/stat/alarm/index.do', 96, '1', '0', 'swpigris81', '20151208', '133727', 'swpigris81', '20151208', '133727', ''),
	(103, '辖区报警数据统计列表', '/stat/alarm/queryStatAreaAlarmList.do', 102, '0', '0', 'swpigris81', '20151208', '133800', 'swpigris81', '20151208', '133800', ''),
	(104, '辖区报警数据统计导出', '/stat/alarm/exportStatAreaAlarm.do', 102, '0', '1', 'swpigris81', '20151208', '133828', 'swpigris81', '20151208', '133828', '');
	
	
/*!40000 ALTER TABLE `tbl_menu` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
