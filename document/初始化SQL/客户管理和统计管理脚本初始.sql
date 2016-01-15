drop table if exists TBL_CUS_BASIC_EXPAND;
/*==============================================================*/
/* Table: TBL_CUS_BASIC_EXPAND                                  */
/*==============================================================*/
create table TBL_CUS_BASIC_EXPAND
(
   ID                   bigint not null auto_increment,
   CUS_ID               bigint,
   UNIT_NAME            varchar(20),
   TOLL_LEVEL           varchar(2) comment '00省级 01市级 02县级',
   UNIT_ADDRESS         varchar(100),
   TECHNICAL_PERSON     varchar(10),
   CHECK_STATUS         varchar(2) comment '00待审核01审核通过02审核拒绝',
   CHECK_TIME           varchar(20),
   AUDIT                varchar(20),
   AUTHENTICATION_AMOUNT decimal(12,2),
   USE_PROVINCE         varchar(10),
   USE_CITY             varchar(10),
   USE_COUNTY           varchar(10),
   BINDING_PHONE        varchar(20),
   FIX_TELEPHONE        varchar(20),
   primary key (ID)
);
alter table TBL_CUS_BASIC_EXPAND comment '客户基本信息扩展表';


drop table if exists tbl_cus_login_seq;
/*==============================================================*/
/* Table: tbl_cus_login_seq                                     */
/*==============================================================*/
create table tbl_cus_login_seq
(
   id                   bigint not null auto_increment comment '自增主键',
   cus_id               bigint comment '登陆用户系统数据主键',
   login_time           varchar(32) comment '登陆时间',
   login_ip             varchar(32) comment '登陆ip',
   remark               varchar(256) comment '备注',
   primary key (id)
);
alter table tbl_cus_login_seq comment '客户登陆流水';


drop table if exists TBL_CUS_BASIC_INFO;
/*==============================================================*/
/* Table: TBL_CUS_BASIC_INFO                                    */
/*==============================================================*/
create table TBL_CUS_BASIC_INFO
(
   ID                   bigint not null auto_increment comment 'ID',
   nickname             varchar(64) comment '昵称',
   real_name            varchar(64) comment '真实姓名',
   phone                varchar(18) comment '手机号码',
   id_card_no           varchar(18) comment '身份证',
   cus_type             varchar(2) comment '01老人端02亲属端03急救车端04：120中心',
   province             varchar(6) comment '省份',
   city                 varchar(6) comment '市',
   county               varchar(6) comment '区',
   register_time        varchar(19) comment '注册时间',
   service_expire_time  varchar(19) comment '服务到期时间',
   credit_score         bigint comment '信用积分',
   last_login_ip        varchar(32) comment '最后登录IP',
   last_login_time      varchar(19) comment '最后登录时间',
   activation_flag      varchar(1) comment '激活标识（Y-激活，N-未激活）',
   activation_time      varchar(19) comment '激活时间',
   activation_user      varchar(64) comment '激活人',
   lock_flag            varchar(1) comment '锁定标识（Y-锁定，N-未锁定，已弃用）',
   lock_time            varchar(19) comment '锁定时间',
   lock_user            varchar(64) comment '锁定人',
   lock_expire_time     varchar(19) comment '锁定到期时间，超过该时间即表示已解锁',
   remark               varchar(512) comment '备注',
   update_user          varchar(64) comment '修改人',
   update_time          varchar(19) comment '修改时间',
   primary key (ID)
);
alter table TBL_CUS_BASIC_INFO comment '客户基本信息';


drop table if exists TBL_CUS_PHONE_CHANGE_APPLY;
/*==============================================================*/
/* Table: TBL_CUS_PHONE_CHANGE_APPLY                            */
/*==============================================================*/
create table TBL_CUS_PHONE_CHANGE_APPLY
(
   ID                   bigint not null auto_increment comment '主键',
   USER_NAME            varchar(10),
   REAL_NAME            varchar(10),
   ORIGINAL_PHONE       varchar(11),
   NEW_PHONE            varchar(11),
   RECHARGE_AMOUNT      decimal(12,2),
   APPLY_TIME           varchar(20),
   APPLY_STATUS         varchar(2) comment '00待审核，01审核通过，02审核拒绝',
   APPLY_REASON         varchar(500),
   AUDIT                varchar(10),
   primary key (ID)
);
alter table TBL_CUS_PHONE_CHANGE_APPLY comment '手机变更申请';


drop table if exists tbl_cus_report;
/*==============================================================*/
/* Table: tbl_cus_report                                        */
/*==============================================================*/
create table tbl_cus_report
(
   id                   bigint not null auto_increment comment '自增主键',
   informants           varchar(32) comment '举报人',
   reported             varchar(32) comment '被举报人',
   report_type          varchar(2) comment '举报类型：急救车00、120省级01、120市级02、120县级03、医院04、其他机构05、普通用户（老人端和亲属端）06',
   report_info          varchar(512) comment '举报内容',
   report_time          varchar(19) comment '举报时间',
   deal_status          varchar(2) comment '处理状态',
   deal_user            varchar(32) comment '处理人',
   deal_time            varchar(19) comment '处理时间',
   deal_info            varchar(256) comment '处理信息',
   remark               varchar(256) comment '备注',
   primary key (id)
);
alter table tbl_cus_report comment '客户举报管理';


drop table if exists tbl_stat_area_alarm;
/*==============================================================*/
/* Table: tbl_stat_area_alarm                                   */
/*==============================================================*/
create table tbl_stat_area_alarm
(
   id                   bigint not null auto_increment comment '主键',
   alarm_center         varchar(10) comment '报警中心',
   alarm_time           varchar(19) comment '报警时间',
   schedule_user        varchar(32) comment '调度员',
   phone                varchar(15) comment '电话号码',
   call_duration        int comment '通话时长',
   schedule_vehicle     varchar(64) comment '调度车辆',
   disease_type         varchar(2) comment '病情类型',
   hospital             varchar(64) comment '收治医院',
   track_info           varchar(256) comment '跟踪情况',
   remark               varchar(256) comment '备注',
   primary key (id)
);
alter table tbl_stat_area_alarm comment '辖区报警数据统计';


drop table if exists tbl_stat_general;
/*==============================================================*/
/* Table: tbl_stat_general                                      */
/*==============================================================*/
create table tbl_stat_general
(
   general_stat_item_key varchar(32) not null comment '统计项key，主键',
   general_stat_value   bigint comment '统计项值',
   general_stat_item    varchar(128) comment '统计项名称',
   primary key (general_stat_item_key)
);
alter table tbl_stat_general comment '综合统计';


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
   primary key (id)
);
alter table tbl_cus_invitation comment '邀请管理';



drop table if exists tbl_cus_invitation_code;
/*==============================================================*/
/* Table: tbl_cus_invitation_code                               */
/*==============================================================*/
create table tbl_cus_invitation_code
(
   id                   bigint not null auto_increment comment '主键自增id',
   cus_id               bigint comment '客户id',
   invitation_code      varchar(10) comment '邀请码',
   create_time          varchar(19) comment '创建时间',
   remark               varchar(128) comment '备注',
   primary key (id)
);
alter table tbl_cus_invitation_code comment '邀请码管理';
