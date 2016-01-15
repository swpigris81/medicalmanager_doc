DROP TABLE IF EXISTS tbl_stat_general;

/*==============================================================*/
/* Table: tbl_stat_general                                      */
/*==============================================================*/
CREATE TABLE tbl_stat_general
(
   general_stat_item_key varchar(32) NOT NULL COMMENT '统计项key，主键',
   general_stat_value   bigint COMMENT '统计项值',
   general_stat_item    varchar(128) COMMENT '统计项名称',
   PRIMARY KEY (general_stat_item_key)
);
ALTER TABLE tbl_stat_general COMMENT '综合统计';

DELETE FROM `tbl_stat_general`;

INSERT INTO tbl_stat_general(general_stat_item_key,general_stat_value,general_stat_item) 
VALUES 	('CustomType01', '0', '老人端注册统计'),
		('CustomType02', '0', '亲属端注册统计'),
		('CustomType03', '0', '急救车注册统计'),
		('CustomType04', '0', '120中心注册统计'),
		('RechargeType00', '0', '急救车充值统计'),
		('RechargeType01', '0', '120中心充值统计'),
		('RechargeType02', '0', '其他充值统计'),
		('HardwareOpen00', '0', '智能硬件开通统计'),
		('CustomType0401', '0', '120中心开通统计'),
		('CustomType0301', '0', '急救车开通统计'),
		('Sales00', '0', '销售统计'),
		('Recommend00', '0', '推荐费统计'),
		('WithdrawType00', '0', '提现统计');
