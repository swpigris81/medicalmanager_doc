drop table if exists tbl_cus_relatives;

/*==============================================================*/
/* Table: tbl_cus_relatives                                     */
/*==============================================================*/
create table tbl_cus_relatives
(
   id                   bigint not null auto_increment comment '主键',
   cus_id               bigint comment '客户ID',
   relatives_name       varchar(32) comment '亲属名称',
   relatives_relation   varchar(16) comment '亲属关系（父亲、母亲、女儿等）',
   phone                varchar(11) comment '手机号',
   small_image_url      varchar(32) comment '小头像',
   big_image_url        varchar(32) comment '大头像',
   age                  int comment '年龄',
   height               varchar(32) comment '身高',
   weight               varchar(32) comment '体重',
   constellation        varchar(32) comment '星座',
   remark               varchar(128) comment '备注',
   birthday             varchar(8) comment '生日',
   primary key (id)
);

alter table tbl_cus_relatives comment '客户亲属表';


drop table if exists tbl_cus_device;
/*==============================================================*/
/* Table: tbl_cus_device                                        */
/*==============================================================*/
create table tbl_cus_device
(
   ID                   bigint not null auto_increment comment '自增主键',
   DEVICE_NO            varchar(64) comment '设备编号',
   MACHINE_CODE_ID      bigint comment '机器码id（非机器码）',
   OPEN_FLAG            varchar(1) comment '开通标识（Y开通，N-未开通）',
   INSERT_FLAG          varchar(1) comment '插入标识（Y插入，N-未插入）',
   ALARM_FLAG           varchar(1) comment '报警标识（Y报警，N-未报警）',
   OPEN_TIME            varchar(19) comment '开通时间',
   USE_ID               bigint comment '使用人ID',
   OPEN_ID              bigint comment '开通人',
   REMARK               varchar(128) comment '备注',
   primary key (ID)
);
alter table tbl_cus_device comment '设备管理';


drop table if exists tbl_fund_balance;
/*==============================================================*/
/* Table: tbl_fund_balance                                      */
/*==============================================================*/
create table tbl_fund_balance
(
   cus_id               bigint not null comment '客户id，主键',
   balance              bigint comment '余额',
   update_time          varchar(19) comment '更新时间',
   remark               varchar(128) comment '备注',
   primary key (cus_id)
);
alter table tbl_fund_balance comment '余额信息';


drop table if exists tbl_cus_address;
/*==============================================================*/
/* Table: tbl_cus_address                                       */
/*==============================================================*/
create table tbl_cus_address
(
   id                   bigint not null auto_increment comment '自增主键',
   cus_id               bigint comment '客户id',
   receiver             varchar(32) comment '收货人姓名',
   phone                varchar(15) comment '联系电话',
   backup_phone         varchar(15) comment '备用电话',
   zip_code             varchar(6) comment '邮编',
   address              varchar(128) comment '收货地址',
   default_flag         varchar(1) comment '是否默认（Y默认收货地址，N-不是默认收货地址）',
   create_time          varchar(19) comment '创建时间',
   remark               varchar(256) comment '备注',
   primary key (id)
);
alter table tbl_cus_address comment '收货地址管理';


drop table if exists tbl_fund_withdraw_acc;
/*==============================================================*/
/* Table: tbl_fund_withdraw_acc                                 */
/*==============================================================*/
create table tbl_fund_withdraw_acc
(
   id                   bigint not null auto_increment comment '自增主键',
   cus_id               bigint comment '客户id',
   acc_type             varchar(2) comment '账户类型（0-支付宝，1-财付通，3-微信，4银行卡）',
   open_bank            varchar(128) comment '开户行',
   acc_name             varchar(64) comment '账户名',
   acc_no               varchar(64) comment '账号（支付宝等保存账号，银行卡保存卡号）',
   default_flag         varchar(1) comment '是否默认提现账户（Y-是，N-否）',
   create_time          varchar(19) comment '创建时间',
   remark               varchar(256) comment '备注',
   primary key (id)
);
alter table tbl_fund_withdraw_acc comment '提现账户设置';


drop table if exists TBL_FUND_WITHDRAW_TURNOVER;
/*==============================================================*/
/* Table: TBL_FUND_WITHDRAW_TURNOVER                            */
/*==============================================================*/
create table TBL_FUND_WITHDRAW_TURNOVER
(
   ID                   bigint not null auto_increment comment '主键',
   CUST_ID              char(10),
   CUST_NAME            varchar(50) comment '用户名',
   CUST_MOBILE          varchar(20) comment '手机号',
   NAME                 varchar(20) comment '姓名',
   WITHDRAW_ACCOUNT     varchar(32) comment '提现账号',
   WITHDRAW_BANK        varchar(100) comment '提现银行',
   BRANCH_BANK          varchar(100) comment '银行支行',
   WITHDRAW_AMOUNT      decimal(12,2) comment '提现金额',
   WITHDRAW_TIME        varchar(20) comment '提现时间',
   WITHDRAW_STATUS      varchar(2) comment '状态00-未提现01-已提现',
   ACCOUNT_ID           bigint comment '账号id',
   primary key (ID)
);
alter table TBL_FUND_WITHDRAW_TURNOVER comment '提现流水';


drop table if exists tbl_help_record;
/*==============================================================*/
/* Table: tbl_help_record                                       */
/*==============================================================*/
create table tbl_help_record
(
   id                   bigint not null auto_increment,
   cus_phone            varchar(15) comment '呼救方手机号码',
   cus_id               bigint comment '呼救方ID',
   rescue_id            bigint comment '救援方ID',
   rescue_name          varchar(256) comment '救援方名称（120中心或者医院）',
   ambulance_id         bigint comment '急救车ID',
   ambulance_no         varchar(64) comment '急救车车牌号',
   rescue_state         varchar(1) comment '救援方评价状态（Y已评价，N未评价）',
   ambulance_state      varchar(1) comment '急救车评价状态（Y已评价，N未评价）',
   rescue_evaluation_id bigint comment '救援方评价id',
   ambulance_evaluation_id bigint comment '车牌号评价id',
   primary key (id)
);
alter table tbl_help_record comment '求救记录';

drop table if exists TBL_ALARM_TASK;

/*==============================================================*/
/* Table: TBL_ALARM_TASK                                        */
/*==============================================================*/
create table TBL_ALARM_TASK
(
   ID                   bigint not null auto_increment,
   ALARM_ID             bigint,
   CENTER_ID            bigint,
   AMBULANCE_ID         bigint,
   TASK_STATUS          varchar(10) comment '00待接，01已接，02已完成，03未完成',
   TASK_REASON          varchar(100),
   DISTRIBUTE_TIME      varchar(20),
   TASK_TIME            varchar(20),
   DEAL_TIME            varchar(20),
   primary key (ID)
);

alter table TBL_ALARM_TASK comment '报警任务表';

drop table if exists TBL_RESERVE_PLAN;

/*==============================================================*/
/* Table: TBL_RESERVE_PLAN                                      */
/*==============================================================*/
create table TBL_RESERVE_PLAN
(
   ID                   bigint not null auto_increment comment '主键',
   CUS_ID               bigint,
   TITLE                varchar(50),
   EDITOR               varchar(20),
   EDIT_TIME            varchar(20),
   CONTENT              varchar(500),
   CHECK_STATUS         varchar(2) comment '00待审核，01审核通过，02审核拒绝',
   CHECK_TIME           varchar(20),
   AUDITOR              varchar(10),
   primary key (ID)
);

alter table TBL_RESERVE_PLAN comment '预案信息表';

drop table if exists TBL_MESSAGE_CENTER;

/*==============================================================*/
/* Table: TBL_MESSAGE_CENTER                                    */
/*==============================================================*/
create table TBL_MESSAGE_CENTER
(
   ID                   bigint not null auto_increment,
   客户id                 bigint,
   MESSAGE_TITLE        varchar(20),
   MESSAGE_TIME         varchar(20),
   MESSAGE_CONTENT      varchar(500),
   IS_READ              varchar(2) comment 'Y是，N否',
	 PRIMARY KEY (ID)
);

alter table TBL_MESSAGE_CENTER comment '消息中心';

drop table if exists TBL_EVALUATE_INFO;

/*==============================================================*/
/* Table: TBL_EVALUATE_INFO                                     */
/*==============================================================*/
create table TBL_EVALUATE_INFO
(
   ID                   bigint not null auto_increment,
   CUST_ID              bigint,
   EVALUATED_ID         bigint,
   EVALUATE_TIME        varchar(20),
   EVALUATE_STAR        varchar(2) comment '保存为数字，1星存为1,2星为2，以此类推',
   EVALUATE_CONTENT     varchar(100),
   primary key (ID)
);

alter table TBL_EVALUATE_INFO comment '用户评价信息表';


drop table if exists tbl_propa_news;
/*==============================================================*/
/* Table: tbl_propa_news                                        */
/*==============================================================*/
create table tbl_propa_news
(
   id                   bigint not null auto_increment,
   title                varchar(2) comment '标题',
   classify             varchar(2) comment '分类',
   publish_time         varchar(19) comment '发布时间',
   views                int comment '浏览量',
   img_url              varchar(64) comment '图片地址',
   content              varchar(2048) comment '内容',
   remark               varchar(128) comment '备注',
   primary key (id)
);
alter table tbl_propa_news comment '资讯';


drop table if exists tbl_cus_medical_records_visit;
/*==============================================================*/
/* Table: tbl_cus_medical_records_visit                         */
/*==============================================================*/
create table tbl_cus_medical_records_visit
(
   id                   bigint not null auto_increment,
   record_id            bigint comment '病历id',
   visit_cus_id         bigint comment '访问病历者id',
   primary key (id)
);
alter table tbl_cus_medical_records_visit comment '用户病历访问关系';



drop table if exists tbl_cus_invitation;

/*==============================================================*/
/* Table: tbl_cus_invitation                                    */
/*==============================================================*/
create table tbl_cus_invitation
(
   id                   bigint not null auto_increment comment '自增主键id',
   cus_id               bigint comment '新注册客户id',
   invitation_code      varchar(10) comment '客户输入的邀请码',
   remark               varchar(128) comment '备注',
   back_cash_flag       varchar(1) comment '给邀请人返现标识（Y-已返现，N-未返现）',
   back_cash_time       varchar(19) comment '返现时间',
   primary key (id)
);

alter table tbl_cus_invitation comment '邀请管理';


drop table if exists tbl_fund_balance_seq;

/*==============================================================*/
/* Table: tbl_fund_balance_seq                                  */
/*==============================================================*/
create table tbl_fund_balance_seq
(
   id                   bigint not null auto_increment comment '自增主键',
   cus_id               bigint comment '用户id',
   debit_credit         varchar(1) comment '收支标识（0收入借，1支出贷）',
   change_amount        bigint comment '变动金额（单位分）',
   change_time          varchar(19) comment '变动时间',
   change_des           varchar(256) comment '变动描述',
   remark               varchar(512) comment '备注',
   recommend_flag       varchar(1) comment '是否推荐费（Y-是，N-否）',
   primary key (id)
);

alter table tbl_fund_balance_seq comment '余额变动流水';
