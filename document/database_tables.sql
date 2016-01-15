drop table if exists TBL_FIND_PASSWORD;

/*==============================================================*/
/* Table: TBL_FIND_PASSWORD                                     */
/*==============================================================*/
create table TBL_FIND_PASSWORD
(
   ID                   bigint not null auto_increment comment 'ID',
   USER_ID              bigint comment '用户主键',
   USER_CODE            varchar(50) comment '用户登录名',
   CHECK_CODE           varchar(500) comment '找回密码密文',
   CREATE_OPER          varchar(50) comment '创建人',
   CREATE_DATE          varchar(8) comment '创建日期',
   CREATE_TIME          varchar(6) comment '创建时间',
   MODIFY_OPER          varchar(50) comment '修改人',
   MODIFY_DATE          varchar(8) comment '修改日期',
   MODIFY_TIME          varchar(6) comment '修改时间',
   REMARK               varchar(500) comment '备注',
   primary key (ID)
);

alter table TBL_FIND_PASSWORD comment '找回密码';

drop table if exists TBL_USER;

/*==============================================================*/
/* Table: TBL_USER                                              */
/*==============================================================*/
create table TBL_USER
(
   ID                   bigint not null auto_increment comment 'ID',
   USER_CODE            varchar(50) comment '用户登录名',
   USER_NAME            varchar(50) comment '用户名称',
   USER_MOBILE          varchar(20) comment '手机号',
   USER_UNIT            varchar(100) comment '单位',
   USER_PROVINCE        varchar(100) comment '省份',
   USER_CITY            varchar(100) comment '市',
   USER_EMAIL           varchar(50) comment '邮箱地址',
   CREATE_OPER          varchar(50) comment '创建人',
   CREATE_DATE          varchar(8) comment '创建日期',
   CREATE_TIME          varchar(6) comment '创建时间',
   MODIFY_OPER          varchar(50) comment '修改人',
   MODIFY_DATE          varchar(8) comment '修改日期',
   MODIFY_TIME          varchar(6) comment '修改时间',
   REMARK               varchar(500) comment '备注',
   LAST_LOGIN_TIME      varchar(20) comment '上次登录时间',
   LAST_LOGIN_IP        varchar(100) comment '上次登录IP',
   CURRENT_STATUS       varchar(2) comment '当前状态:00-正常09-禁用',
   primary key (ID)
);

alter table TBL_USER comment '用户';


drop table if exists TBL_USER_ROLE;

/*==============================================================*/
/* Table: TBL_USER_ROLE                                         */
/*==============================================================*/
create table TBL_USER_ROLE
(
   ID                   bigint not null auto_increment comment 'ID',
   USER_ID              bigint comment '用户主键',
   USER_CODE            varchar(50) comment '用户登录名',
   ROLE_ID              bigint comment '角色主键',
   USER_TYPE            varchar(2) comment '用户类型：1-后台管理人员2-微信关注人员3-微信注册会员',
   CREATE_OPER          varchar(50) comment '创建人',
   CREATE_DATE          varchar(8) comment '创建日期',
   CREATE_TIME          varchar(6) comment '创建时间',
   MODIFY_OPER          varchar(50) comment '修改人',
   MODIFY_DATE          varchar(8) comment '修改日期',
   MODIFY_TIME          varchar(6) comment '修改时间',
   REMARK               varchar(500) comment '备注',
   primary key (ID)
);

alter table TBL_USER_ROLE comment '用户角色';

drop table if exists TBL_ROLE;

/*==============================================================*/
/* Table: TBL_ROLE                                              */
/*==============================================================*/
create table TBL_ROLE
(
   ROLE_ID              bigint not null auto_increment comment 'ID',
   ROLE_NAME            varchar(50) comment '角色名称',
   CREATE_OPER          varchar(50) comment '创建人',
   CREATE_DATE          varchar(8) comment '创建日期',
   CREATE_TIME          varchar(6) comment '创建时间',
   MODIFY_OPER          varchar(50) comment '修改人',
   MODIFY_DATE          varchar(8) comment '修改日期',
   MODIFY_TIME          varchar(6) comment '修改时间',
   REMARK               varchar(500) comment '备注',
   primary key (ROLE_ID)
);

alter table TBL_ROLE comment '角色';


drop table if exists TBL_USER_SECRET;

/*==============================================================*/
/* Table: TBL_USER_SECRET                                       */
/*==============================================================*/
create table TBL_USER_SECRET
(
   ID                   bigint not null auto_increment comment 'ID',
   USER_ID              bigint comment '用户主键',
   USER_CODE            varchar(50) comment '用户登录名',
   USER_PASSWORD        varchar(100) comment '用户登录密码',
   USER_PROTECT_QUESTION varchar(100) comment '用户密码保护问题',
   USER_PROTECT_ANSWER  varchar(100) comment '用户密码保护答案',
   CREATE_OPER          varchar(50) comment '创建人',
   CREATE_DATE          varchar(8) comment '创建日期',
   CREATE_TIME          varchar(6) comment '创建时间',
   MODIFY_OPER          varchar(50) comment '修改人',
   MODIFY_DATE          varchar(8) comment '修改日期',
   MODIFY_TIME          varchar(6) comment '修改时间',
   REMARK               varchar(500) comment '备注',
   primary key (ID)
);

alter table TBL_USER_SECRET comment '用户密码';


drop table if exists TBL_MENU;

/*==============================================================*/
/* Table: TBL_MENU                                              */
/*==============================================================*/
create table TBL_MENU
(
   MENU_ID              bigint not null auto_increment comment 'ID',
   MENU_NAME            varchar(50) comment '菜单名称',
   MENU_URL             varchar(500) comment '菜单访问路径',
   PARENT_ID            bigint comment '上级菜单ID',
   IS_SHOW              varchar(1) comment '是否显示0-否1-是',
   MENU_LEVEL           varchar(1) comment '菜单级别0-菜单级别1-按钮级别',
   CREATE_OPER          varchar(50) comment '创建人',
   CREATE_DATE          varchar(8) comment '创建日期',
   CREATE_TIME          varchar(6) comment '创建时间',
   MODIFY_OPER          varchar(50) comment '修改人',
   MODIFY_DATE          varchar(8) comment '修改日期',
   MODIFY_TIME          varchar(6) comment '修改时间',
   REMARK               varchar(500) comment '备注',
   primary key (MENU_ID)
);

alter table TBL_MENU comment '菜单';


drop table if exists TBL_ROLE_AUTHORITY;

/*==============================================================*/
/* Table: TBL_ROLE_AUTHORITY                                    */
/*==============================================================*/
create table TBL_ROLE_AUTHORITY
(
   ID                   bigint not null auto_increment comment 'ID',
   ROLE_ID              bigint comment '角色ID',
   MENU_ID              bigint comment '菜单ID',
   CREATE_OPER          varchar(50) comment '创建人',
   CREATE_DATE          varchar(8) comment '创建日期',
   CREATE_TIME          varchar(6) comment '创建时间',
   MODIFY_OPER          varchar(50) comment '修改人',
   MODIFY_DATE          varchar(8) comment '修改日期',
   MODIFY_TIME          varchar(6) comment '修改时间',
   REMARK               varchar(500) comment '备注',
   primary key (ID)
);

alter table TBL_ROLE_AUTHORITY comment '角色权限';

drop table if exists TBL_PRODUCT;

drop table if exists TBL_PRODUCT;

/*==============================================================*/
/* Table: TBL_PRODUCT                                           */
/*==============================================================*/
create table TBL_PRODUCT
(
   PRODUCT_ID           bigint not null auto_increment comment '主键',
   BRAND_NO             bigint,
   BRAND_IMG            varchar(1000),
   PRODUCT_NO           varchar(50),
   INVENTORY_NUM        bigint,
   LOAD_CAPACITY        double,
   FREIGHT              decimal(8,2),
   IS_INVOICE           char(2) comment 'Y有，N无（默认）',
   DISCOUNT_PRICE       decimal(12,2),
   MARKET_PRICE         decimal(12,2),
   INTRODUCTION         longtext,
   IS_MINUS_INVENTORY   char(2) comment 'Y减（默认），N不减',
   ADD_TIME             varchar(20),
   primary key (PRODUCT_ID)
);

alter table TBL_PRODUCT comment '商品';

drop table if exists TBL_BRAND;

/*==============================================================*/
/* Table: TBL_BRAND                                             */
/*==============================================================*/
create table TBL_BRAND
(
   NO                   bigint not null auto_increment comment '主键',
   BRAND_NAME           varchar(20) comment '品牌名称',
   REMARK               varchar(50) comment '备注',
   CREATE_TIME          varchar(20) comment '创建时间',
   primary key (NO)
);

alter table TBL_BRAND comment '品牌';
drop table if exists TBL_MACHINE_CODE;

/*==============================================================*/
/* Table: TBL_MACHINE_CODE                                      */
/*==============================================================*/
create table TBL_MACHINE_CODE
(
   ID                   bigint not null auto_increment comment '主键',
   CODE                 varchar(20) comment '机器码',
   USE_STATUS           varchar(2) comment 'Y已使用，N未使用（默认）',
   CREATE_TIME          varchar(20) comment '创建时间',
   primary key (ID)
);

alter table TBL_MACHINE_CODE comment '机器码';


drop table if exists TBL_MACHINE_USE;

/*==============================================================*/
/* Table: TBL_MACHINE_USE                                       */
/*==============================================================*/
create table TBL_MACHINE_USE
(
   ID                   bigint not null auto_increment comment '主键',
   OPEN_TIME            varchar(20) comment '开通时间',
   USER_ID              bigint comment '用户ID',
   USER_NAME            varchar(20) comment '用户名',
   PHONE_NUMBER         varchar(11) comment '手机号码',
   MACHINE_ID           bigint comment '机器码编号',
   MACHINE_CODE         varchar(20) comment '机器码',
   REMARK               varchar(50) comment '备注',
   primary key (ID)
);

alter table TBL_MACHINE_USE comment '机器码使用信息表';

drop table if exists TBL_EXPRESS;

/*==============================================================*/
/* Table: TBL_EXPRESS                                           */
/*==============================================================*/
create table TBL_EXPRESS
(
   ID                   bigint not null auto_increment comment '主键',
   EXPRESS_NAME         varchar(10) comment '快递名称',
   primary key (ID)
);

alter table TBL_EXPRESS comment '快递信息表';


drop table if exists TBL_DELIVER_PRODUCT;

/*==============================================================*/
/* Table: TBL_DELIVER_PRODUCT                                   */
/*==============================================================*/
create table TBL_DELIVER_PRODUCT
(
   ID                   bigint not null auto_increment comment '主键',
   ORDER_NUMBER         bigint comment '订单编号',
   USER_NAME            varchar(20) comment '用户名称',
   PRODUCT_NO           bigint comment '货号',
   NUMBER               bigint comment '数量',
   PHONE_NUMBER         bigint(11) comment '手机号码',
   DELIVER_REMARK       varchar(100) comment '发货备注',
   EXPRESS              varchar(20) comment '快递',
   EXPRESS_NO           bigint comment '快递单号',
   DELIVER_TIME         varchar(20) comment '发货时间',
   EXPRESS_ID           bigint comment '快递ID',
   primary key (ID)
);

alter table TBL_DELIVER_PRODUCT comment '发货信息表';


drop table if exists TBL_ORDER;

/*==============================================================*/
/* Table: TBL_ORDER                                             */
/*==============================================================*/
create table TBL_ORDER
(
   ORDER_NUMBER         bigint not null auto_increment comment '订单编号',
   BRAND_NO             bigint comment '品牌编号',
   BRAND_NAME           varchar(20) comment '品牌名称',
   PRODUCT_ID           bigint comment '商品ID',
   NUMBER               bigint comment '数量',
   PRODUCT_NO           varchar(20) comment '货号',
   USER_ID              bigint comment '用户ID',
   PHONE_NUMBER         int(11) comment '手机号码',
   RECEIVE_ADDRESS      varchar(50) comment '收货地址',
   IS_PAY               varchar(2) comment 'Y已付款，N未付款（默认）',
   IS_DELIVERY          varchar(2) comment 'Y已发货，N未发货（默认）',
   ORDER_TIME           varchar(20) comment '订单时间',
   primary key (ORDER_NUMBER)
);

alter table TBL_ORDER comment '订单表';

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


drop table if exists TBL_MESSAGE_CENTER;

/*==============================================================*/
/* Table: TBL_MESSAGE_CENTER                                    */
/*==============================================================*/
create table TBL_MESSAGE_CENTER
(
   ID                   bigint not null auto_increment,
   cusId                bigint comment '客户id',
   MESSAGE_TITLE        varchar(20) comment '消息标题',
   MESSAGE_TIME         varchar(20) comment '消息时间',
   MESSAGE_CONTENT      varchar(500) comment '消息内容',
   IS_READ              varchar(2) comment '是否阅读Y是，N否',
   primary key (ID)
);

alter table TBL_MESSAGE_CENTER comment '消息中心';

drop table if exists TBL_EVALUATE_INFO;

/*==============================================================*/
/* Table: TBL_EVALUATE_INFO                                     */
/*==============================================================*/
create table TBL_EVALUATE_INFO
(
   ID                   bigint not null auto_increment,
   CUST_ID              bigint comment '评价客户ID',
   EVALUATED_ID         bigint comment '被评价端ID',
   EVALUATE_TIME        varchar(20) comment '评价时间',
   EVALUATE_STAR        varchar(2) comment '评价星级保存为数字，1星存为1,2星为2，以此类推',
   EVALUATE_CONTENT     varchar(100) comment '评价内容',
   primary key (ID)
);

alter table TBL_EVALUATE_INFO comment '用户评价信息表';


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

drop table if exists TBL_CUS_BASIC_EXPAND;

/*==============================================================*/
/* Table: TBL_CUS_BASIC_EXPAND                                  */
/*==============================================================*/
create table TBL_CUS_BASIC_EXPAND
(
   ID                   bigint not null auto_increment,
   CUS_ID               bigint comment '客户ID(关联客户表中的ID)',
   UNIT_NAME            varchar(20) comment '单位名称',
   TOLL_LEVEL           varchar(2) comment '收费级别00省级 01市级 02县级',
   UNIT_ADDRESS         varchar(100) comment '单位地址',
   TECHNICAL_PERSON     varchar(10) comment '技术负责人',
   CHECK_STATUS         varchar(2) comment '审核状态00待审核01审核通过02审核拒绝',
   CHECK_TIME           varchar(20) comment '审核时间',
   AUDIT                varchar(20) comment '审核人',
   AUTHENTICATION_AMOUNT decimal(12,2) comment '认证金额',
   USE_PROVINCE         varchar(10) comment '使用省份',
   USE_CITY             varchar(10) comment '使用城市',
   USE_COUNTY           varchar(10) comment '使用区域',
   BINDING_PHONE        varchar(20) comment '绑定手机号码',
   FIX_TELEPHONE        varchar(20) comment '固定电话',
   LEGAL_PERSON_CERTIFICATE varchar(200) comment '单位证明法人证书(存储路径)',
   ORGANIZATION_CERTIFICATE varchar(200) comment '组织机构证书(存储路径)',
   ACCOUNT_NAME         varchar(20) comment '账户全称',
   BANK_NAME            varchar(50) comment '开户行',
   BANK_BRANCH          varchar(50) comment '分行',
   ACCOUNT_NO           varchar(20) comment '账号',
   SUBMIT_CUST_ID       bigint comment '提交人',
   SUBMIT_CUST_NAME     varchar(20) comment '提交人姓名',
   SUBMIT_CUST_MOBILE   varchar(20) comment '提交人手机号',
   SUBMIT_TIME          varchar(20) comment '提交时间',
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


drop table if exists tbl_Center_police_info;

/*==============================================================*/
/* Table: tbl_Center_police_info                                */
/*==============================================================*/
create table tbl_Center_police_info
(
   ID                   bigint not null auto_increment comment '主键',
   name                 varchar(50) comment '姓名',
   WORK_NO              varchar(50) comment '工号',
   MOBILE_NO            varchar(50) comment '手机号',
   PASSWORD             varchar(500) comment '密码',
   CERTEN_ID            bigint comment '所属120中心-关联客户基本信息表中，类型为120中心的数据',
   USER_TYPE            varchar(2) comment '用户类型00-超级管理员01-管理员02-接警员',
   primary key (ID)
);

alter table tbl_Center_police_info comment '120中心人员信息';


drop table if exists TBL_CUST_RELATION;

/*==============================================================*/
/* Table: TBL_CUST_RELATION                                     */
/*==============================================================*/
create table TBL_CUST_RELATION
(
   ID                   bigint not null auto_increment comment '主键',
   CUST_ID              bigint comment '用户id',
   MOBILE_NO            varchar(20) comment '用户手机号',
   CUST_NAME            varchar(20) comment '用户姓名',
   CUST_TYPE            varchar(2) comment '01老人端，02亲属端，03急救车，04120中心',
   RELATION_ID          bigint comment '联系人ID',
   RELATION_MOBILE      varchar(20) comment '联系人手机号',
   RELATION_NAME        varchar(50) comment '联系人姓名',
   RELATION_TYPE        varchar(20) comment '01老人端，02亲属端，03急救车，04120中心',
   RELATION_STATUS      varchar(1) comment '状态0-未通过1-已通过',
   agree_flag           varchar(1) comment '同意添加标识(Y-同意，N-不同意)',
   allow_flag           varchar(1) comment '允许关系人访问标识(Y-允许，N-不允许)',
   allowed_flag         varchar(1) comment '被关系人允许访问标识(Y-允许，N-不允许)',
   primary key (ID)
);

alter table TBL_CUST_RELATION comment '关系人列表';


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


drop table if exists TBL_CUST_medical_records;

/*==============================================================*/
/* Table: TBL_CUST_medical_records                              */
/*==============================================================*/
create table TBL_CUST_medical_records
(
   ID                   bigint not null auto_increment comment '主键',
   cust_id              bigint comment '用户id',
   MOBILE_NO            varchar(20) comment '手机号',
   RECORD_NO            varchar(20) comment '病历编号',
   primary key (ID)
);

alter table TBL_CUST_medical_records comment '用户病历';

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
   head_img             varchar(100),
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
   HAS_SENT             varchar(1) comment '是否已发送过短信0-否1-是',
   ambulance_status     varchar(2) comment '00待命中，01休息',
   status_reason        varchar(10) comment '01车辆维修02其他任务03休假04换车
            可以保存多状态，以#号分隔，如01#02#03',
   year_score           int comment '年积分',
   score_year           varchar(10) comment '积分年份',
   invitation_code      varchar(12) comment '邀请码',
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
   USER_NAME            varchar(10) comment '用户名',
   REAL_NAME            varchar(10) comment '真实姓名',
   ORIGINAL_PHONE       varchar(11) comment '原手机号码',
   NEW_PHONE            varchar(11) comment '新手机号码',
   RECHARGE_AMOUNT      decimal(12,2) comment '充值金额',
   APPLY_TIME           varchar(20) comment '申请时间',
   APPLY_STATUS         varchar(2) comment '00待审核，01审核通过，02审核拒绝',
   APPLY_REASON         varchar(500) comment '申请原因',
   AUDIT                varchar(10) comment '审核人',
   primary key (ID)
);

alter table TBL_CUS_PHONE_CHANGE_APPLY comment '手机变更申请';


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


drop table if exists TBL_AMBULANCE_CENTER;

/*==============================================================*/
/* Table: TBL_AMBULANCE_CENTER                                  */
/*==============================================================*/
create table TBL_AMBULANCE_CENTER
(
   ID                   bigint not null auto_increment,
   CUS_ID               bigint comment '急救车ID',
   CENTER_ID            bigint comment '120中心ID',
   primary key (ID)
);

alter table TBL_AMBULANCE_CENTER comment '急救车120中心关系表';

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

drop table if exists TBL_ALARM_TASK;

/*==============================================================*/
/* Table: TBL_ALARM_TASK                                        */
/*==============================================================*/
create table TBL_ALARM_TASK
(
   ID                   bigint not null auto_increment,
   ALARM_ID             bigint comment '报警信息ID',
   CENTER_ID            bigint comment '120中心',
   AMBULANCE_ID         bigint comment '急救车ID',
   TASK_STATUS          varchar(10) comment '00待接，01已接，02已完成，03未完成',
   TASK_REASON          varchar(100) comment '任务原因',
   DISTRIBUTE_TIME      varchar(20) comment '派发时间',
   TASK_TIME            varchar(20) comment '接任务时间',
   DEAL_TIME            varchar(20) comment '处理时间',
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
   CUS_ID               bigint comment '客户ID',
   TITLE                varchar(50) comment '标题',
   EDITOR               varchar(20) comment '编辑人',
   EDIT_TIME            varchar(20) comment '编辑时间',
   CONTENT              varchar(500) comment '内容',
   CHECK_STATUS         varchar(2) comment '00待审核，01审核通过，02审核拒绝',
   CHECK_TIME           varchar(20) comment '审核时间',
   AUDITOR              varchar(10) comment '审核人',
   primary key (ID)
);

alter table TBL_RESERVE_PLAN comment '预案信息表';

drop table if exists TBL_ALARM_INFO;

/*==============================================================*/
/* Table: TBL_ALARM_INFO                                        */
/*==============================================================*/
create table TBL_ALARM_INFO
(
   ID                   bigint not null auto_increment comment '主键',
   MOBILE_NO            varchar(20) comment '手机号',
   ALARM_TIME           varchar(20) comment '报警时间',
   LINK_INFO            varchar(20) comment '联系人',
   ALARM_TITLE          varchar(50) comment '报警标题',
   ALARM_INFO           varchar(500) comment '求救信息',
   ALARM_ADDRESS        varchar(200) comment '地址',
   SAVE_NUM             int comment '救治人数',
   NEED_ANBULANCE_NUM   int comment '需要救护车数量',
   IS_ATTACK            varchar(1) comment '是否突发事件0-否1-是',
   IS_SPECIFY_HOS       varchar(1) comment '是否指定医院0-否1-是',
   incident_time        varchar(20) comment '事发时间',
   WAITING_ADD          varchar(200) comment '候车地点',
   BELONG_AREA          varchar(20) comment '所属片区',
   patient_name         varchar(20) comment '患者姓名',
   patient_sex          varchar(10) comment '患者性别',
   patient_age          int comment '患者年龄',
   patient_mobile       varchar(20) comment '患者电话',
   is_harass            varchar(1) comment '是否骚扰电话0-否1-是',
   POLICE_ID            bigint comment '接警人ID',
   POLICE_MOBILE        varchar(20) comment '接警人手机',
   POLICE_NAME          varchar(50) comment '接警人姓名',
   STATUS               varchar(2) comment '状态00-等待处理01-报警自挂02-出警反馈',
   PROVINCE             varchar(10) comment '报警所在省',
   CITY                 varchar(10) comment '报警所在市',
   TALK_TIME            bigint comment '通话时长',
   hospital             varchar(100) comment '收治医院',
   primary key (ID)
);

alter table TBL_ALARM_INFO comment '报警信息';


drop table if exists TBL_SCHEDULING_INFO;

/*==============================================================*/
/* Table: TBL_SCHEDULING_INFO                                   */
/*==============================================================*/
create table TBL_SCHEDULING_INFO
(
   ID                   bigint not null auto_increment comment '主键',
   ALARM_ID             bigint comment '警情信息主键',
   incident_TIME        varchar(20) comment '事发时间',
   SCHEDULING_PHONE     varchar(20) comment '调度电话',
   SCHEDULING_ORG       varchar(50) comment '调度单位',
   CALLING_NUMBER       varchar(20) comment '主叫号码',
   primary key (ID)
);

alter table TBL_SCHEDULING_INFO comment '调度信息';

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


drop table if exists TBL_propa_BLACK_LIST;

/*==============================================================*/
/* Table: TBL_propa_BLACK_LIST                                  */
/*==============================================================*/
create table TBL_propa_BLACK_LIST
(
   ID                   bigint not null auto_increment comment '主键',
   USER_NAME            varchar(100) comment '用户名',
   USER_MOBILE          varchar(50) comment '手机号',
   TYPE                 varchar(10) comment '类型',
   TYPE_NAME            varchar(50) comment '类型名称',
   REMARK               varchar(500) comment '备注',
   CREATE_OPER          varchar(50) comment '创建人',
   CREATE_DATE          varchar(8) comment '创建日期',
   CREATE_TIME          varchar(6) comment '创建时间',
   primary key (ID)
);

alter table TBL_propa_BLACK_LIST comment '黑名单';


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


drop table if exists TBL_propa_APP_SLIDE;

/*==============================================================*/
/* Table: TBL_propa_APP_SLIDE                                   */
/*==============================================================*/
create table TBL_propa_APP_SLIDE
(
   ID                   bigint not null auto_increment comment '主键',
   IMAGE_URL            varchar(255) comment '图片URL',
   IMAGE_LOCATION       varchar(255) comment '图片所在服务器绝对路径',
   TYPE                 varchar(10) comment '类型',
   USER_TYPE            varchar(10) comment '用户类型',
   CREATE_OPER          varchar(50) comment '创建人',
   CREATE_DATE          varchar(8) comment '创建日期',
   CREATE_TIME          varchar(6) comment '创建时间',
   primary key (ID)
);

alter table TBL_propa_APP_SLIDE comment 'APP首页幻灯片';


drop table if exists TBL_SYS_RECEIVABLES;

/*==============================================================*/
/* Table: TBL_SYS_RECEIVABLES                                   */
/*==============================================================*/
create table TBL_SYS_RECEIVABLES
(
   ID                   bigint not null auto_increment comment '主键',
   ALIPAY_NAME          varchar(20) comment '支付宝账号名称',
   ALIPAY_ACCOUNT       varchar(50) comment '支付宝账号',
   PUBLIC_ACCOUNT_COMPANY varchar(50) comment '对公账号公司名称',
   PUBLIC_ACCOUNT       varchar(50) comment '对公账户',
   PUBLIC_ACCOUNT_BANK  varchar(20) comment '对公账号开户行',
   PERSON_NAME          varchar(20) comment '个人账户用户名',
   PERSON_ACCOUNT       varchar(50) comment '个人账号',
   PERSON_ACCOUNT_BANK  varchar(20) comment '个人账户开户行',
   primary key (ID)
);

alter table TBL_SYS_RECEIVABLES comment '收款账号信息表';


drop table if exists TBL_SYS_INFO;

/*==============================================================*/
/* Table: TBL_SYS_INFO                                          */
/*==============================================================*/
create table TBL_SYS_INFO
(
   ID                   bigint not null auto_increment comment '主键',
   PARAM_NAME           varchar(20) comment '参数名称',
   PARAM_TYLE           varchar(2) comment 'a01老人端注册送,a02老人端邀请送,a03亲属端注册送a04亲属端邀请送,a05急救车注册送,a06急救车邀请送,a07:120中心注册送,a08:120中心邀请送,a09老人端被邀请人购买多少个产品给邀请人返现a10亲属端被邀请人购买多少个产品给邀请人返现a11急救车被邀请人充值多少给邀请人返现a12:120中心被邀请人充值多少给邀请人返现a13急救车月使用费a14:120中心省级月使用费a15:120中心市级月使用费a16：120中心县级月使用费，a17老人端最低提现金额，a18亲属端最低提现金额，a19:急救车端最低提现金额，a20:120中心最低提现金额',
   PARAM_VALUE          varchar(20) comment '参数值',
   RECHARGE             varchar(10) comment '只针对月使用费时使用，其余为空',
   FREE                 varchar(10) comment '只针对月使用费时使用，其余为空',
   primary key (ID)
);

alter table TBL_SYS_INFO comment '系统信息设置表';


drop table if exists tbl_sys_province;

/*==============================================================*/
/* Table: tbl_sys_province                                      */
/*==============================================================*/
create table tbl_sys_province
(
   provinceid           int(6) not null comment '省行政区划ID',
   province             VARCHAR(50) comment '省名称',
   primary key (provinceid)
);

alter table tbl_sys_province comment '行政区域省份信息表';


drop table if exists tbl_sys_city;

/*==============================================================*/
/* Table: tbl_sys_city                                          */
/*==============================================================*/
create table tbl_sys_city
(
   cityid               int(6) not null comment '城市ID',
   provinceid           int(6) comment '省行政区划ID',
   city                 varchar(50) comment '城市名称',
   primary key (cityid)
);

alter table tbl_sys_city comment '行政区域地州市信息表';


drop table if exists tbl_sys_area;

/*==============================================================*/
/* Table: tbl_sys_area                                          */
/*==============================================================*/
create table tbl_sys_area
(
   areaid               int(6) not null comment '县区ID',
   area                 varchar(50) comment '县区名称',
   cityid               int(6) comment '市ID',
   primary key (areaid)
);

alter table tbl_sys_area comment '行政区域县区信息表';

drop table if exists TBL_FUND_RECHARGE_TURNOVER;

/*==============================================================*/
/* Table: TBL_FUND_RECHARGE_TURNOVER                            */
/*==============================================================*/
create table TBL_FUND_RECHARGE_TURNOVER
(
   ID                   bigint not null auto_increment comment '主键',
   CUST_ID              bigint,
   CUST_NAME            varchar(50) comment '用户名',
   CUST_MOBILE          varchar(20) comment '手机号',
   RECHARGE_UNIT        varchar(256) comment '单位',
   RECHARGE_TYPE        varchar(20) comment '充值类型00-急救车01-120中心02-其他',
   RECHARGE_AMOUNT      decimal(12,2) comment '充值金额',
   RECEIPT_BANK_ACCOUNT varchar(20) comment '收款账户',
   RECHARGE_TIME        varchar(20) comment '充值时间',
   RECHANGE_MONTH       int,
   EXPIRE_DATE          varchar(20) comment '到期时间',
   RECHARGE_STATUS      varchar(2) comment '充值状态00-成功01-失败',
   RECHARGE_MODE        varchar(20) comment '充值方式00-手动充值01-自动充值',
   RECHARGE_REMARK      varchar(512) comment '备注',
   primary key (ID)
);

alter table TBL_FUND_RECHARGE_TURNOVER comment '充值流水';


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
-- 正在导出表  manager.tbl_menu 的数据：~108 rows (大约)
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
	(99, '新增快递', '/order/saveExpress.do', 56, '1', '1', 'swpigris81', '20151228', '105542', 'swpigris81', '20151228', '105542', ''),
	(100, '导出机器码', '/machineCode/machineCodeExport.do', 59, '1', '1', 'swpigris81', '20151228', '105623', 'swpigris81', '20151228', '105623', ''),
	(101, '导出商品', '/product/productExport.do', 53, '1', '1', 'swpigris81', '20151228', '105927', 'swpigris81', '20151228', '105927', ''),
	(102, '查询所有品牌', '/product/queryAllBrandList.do', 51, '1', '1', 'swpigris81', '20151228', '110202', 'swpigris81', '20151228', '110202', ''),
	(103, '保存/新增品牌', '/product/saveOrUpdateBrand.do', 51, '1', '1', 'swpigris81', '20151228', '110401', 'swpigris81', '20151228', '110401', ''),
	(104, '综合统计', '/stat/general/index.do', 96, '1', '0', 'swpigris81', '20151228', '110854', 'swpigris81', '20151228', '110854', ''),
	(105, '综合统计列表', '/stat/general/queryGeneralStatList.do', 104, '0', '0', 'swpigris81', '20151228', '110931', 'swpigris81', '20151228', '110931', ''),
	(106, '综合统计导出', '/stat/general/exportGeneralStat.do', 104, '0', '1', 'swpigris81', '20151228', '110954', 'swpigris81', '20151228', '110954', ''),
	(107, '辖区报警数据统计', '/stat/alarm/index.do', 96, '1', '0', 'swpigris81', '20151228', '111014', 'swpigris81', '20151228', '111014', ''),
	(108, '辖区报警数据统计列表', '/stat/alarm/queryStatAreaAlarmList.do', 107, '0', '0', 'swpigris81', '20151228', '111037', 'swpigris81', '20151228', '111037', ''),
	(109, '辖区报警数据统计导出', '/stat/alarm/exportStatAreaAlarm.do', 107, '0', '1', 'swpigris81', '20151228', '111058', 'swpigris81', '20151228', '111058', '');
/*!40000 ALTER TABLE `tbl_menu` ENABLE KEYS */;

-- 正在导出表  manager.tbl_role 的数据：~13 rows (大约)
DELETE FROM `tbl_role`;
/*!40000 ALTER TABLE `tbl_role` DISABLE KEYS */;
INSERT INTO `tbl_role` (`ROLE_ID`, `ROLE_NAME`, `CREATE_OPER`, `CREATE_DATE`, `CREATE_TIME`, `MODIFY_OPER`, `MODIFY_DATE`, `MODIFY_TIME`, `REMARK`) VALUES
	(1, '系统管理员', NULL, NULL, NULL, 'swpigris81', '20151228', '111130', '系统管理员（请勿删除）'),
	(14, '管理员', 'swpigris81', '20150708', '142637', 'swpigris81', '20151204', '111445', '管理员');
/*!40000 ALTER TABLE `tbl_role` ENABLE KEYS */;

-- 正在导出表  manager.tbl_role_authority 的数据：~111 rows (大约)
DELETE FROM `tbl_role_authority`;
/*!40000 ALTER TABLE `tbl_role_authority` DISABLE KEYS */;
INSERT INTO `tbl_role_authority` (`ID`, `ROLE_ID`, `MENU_ID`, `CREATE_OPER`, `CREATE_DATE`, `CREATE_TIME`, `MODIFY_OPER`, `MODIFY_DATE`, `MODIFY_TIME`, `REMARK`) VALUES
	(1155, 14, 1, NULL, '20151204', '111445', NULL, '20151204', '111445', '角色权限修改'),
	(1156, 14, 2, NULL, '20151204', '111445', NULL, '20151204', '111445', '角色权限修改'),
	(1157, 14, 3, NULL, '20151204', '111445', NULL, '20151204', '111445', '角色权限修改'),
	(1158, 14, 5, NULL, '20151204', '111445', NULL, '20151204', '111445', '角色权限修改'),
	(1159, 14, 6, NULL, '20151204', '111445', NULL, '20151204', '111445', '角色权限修改'),
	(1742, 1, 1, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1743, 1, 2, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1744, 1, 3, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1745, 1, 21, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1746, 1, 4, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1747, 1, 10, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1748, 1, 13, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1749, 1, 18, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1750, 1, 19, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1751, 1, 20, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1752, 1, 22, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1753, 1, 25, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1754, 1, 5, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1755, 1, 6, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1756, 1, 7, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1757, 1, 15, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1758, 1, 8, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1759, 1, 9, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1760, 1, 11, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1761, 1, 12, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1762, 1, 16, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1763, 1, 17, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1764, 1, 23, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1765, 1, 24, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1766, 1, 78, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1767, 1, 26, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1768, 1, 27, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1769, 1, 28, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1770, 1, 29, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1771, 1, 39, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1772, 1, 30, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1773, 1, 31, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1774, 1, 32, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1775, 1, 33, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1776, 1, 34, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1777, 1, 35, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1778, 1, 36, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1779, 1, 37, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1780, 1, 38, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1781, 1, 40, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1782, 1, 41, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1783, 1, 42, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1784, 1, 43, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1785, 1, 44, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1786, 1, 45, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1787, 1, 49, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1788, 1, 46, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1789, 1, 47, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1790, 1, 48, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1791, 1, 50, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1792, 1, 51, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1793, 1, 52, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1794, 1, 53, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1795, 1, 54, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1796, 1, 55, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1797, 1, 101, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1798, 1, 56, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1799, 1, 57, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1800, 1, 58, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1801, 1, 99, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1802, 1, 59, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1803, 1, 60, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1804, 1, 61, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1805, 1, 100, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1806, 1, 62, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1807, 1, 63, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1808, 1, 79, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1809, 1, 80, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1810, 1, 64, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1811, 1, 65, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1812, 1, 66, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1813, 1, 67, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1814, 1, 68, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1815, 1, 77, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1816, 1, 69, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1817, 1, 70, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1818, 1, 71, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1819, 1, 72, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1820, 1, 73, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1821, 1, 74, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1822, 1, 75, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1823, 1, 76, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1824, 1, 81, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1825, 1, 82, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1826, 1, 83, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1827, 1, 84, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1828, 1, 85, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1829, 1, 86, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1830, 1, 87, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1831, 1, 88, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1832, 1, 89, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1833, 1, 90, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1834, 1, 91, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1835, 1, 92, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1836, 1, 93, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1837, 1, 94, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1838, 1, 95, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1839, 1, 96, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1840, 1, 97, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1841, 1, 98, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1842, 1, 104, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1843, 1, 105, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1844, 1, 106, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1845, 1, 107, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1846, 1, 108, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改'),
	(1847, 1, 109, NULL, '20151228', '111130', NULL, '20151228', '111130', '角色权限修改');
/*!40000 ALTER TABLE `tbl_role_authority` ENABLE KEYS */;

-- 正在导出表  manager.tbl_user 的数据：~3 rows (大约)
DELETE FROM `tbl_user`;
/*!40000 ALTER TABLE `tbl_user` DISABLE KEYS */;
INSERT INTO `tbl_user` (`ID`, `USER_CODE`, `USER_NAME`, `USER_MOBILE`, `USER_EMAIL`, `CREATE_OPER`, `CREATE_DATE`, `CREATE_TIME`, `MODIFY_OPER`, `MODIFY_DATE`, `MODIFY_TIME`, `REMARK`, `USER_UNIT`, `USER_PROVINCE`, `USER_CITY`, `LAST_LOGIN_TIME`, `LAST_LOGIN_IP`, `CURRENT_STATUS`) VALUES
	(1, 'swpigris81', '代超', '13355555555', 'daichao@mfhcd.com', NULL, NULL, NULL, 'swpigris81', '20151203', '171926', '备注', '公司', '120000', '120100', '2015-12-22 13:59:40', NULL, '00');
/*!40000 ALTER TABLE `tbl_user` ENABLE KEYS */;

-- 正在导出表  manager.tbl_user_role 的数据：~3 rows (大约)
DELETE FROM `tbl_user_role`;
/*!40000 ALTER TABLE `tbl_user_role` DISABLE KEYS */;
INSERT INTO `tbl_user_role` (`ID`, `USER_ID`, `USER_CODE`, `ROLE_ID`, `USER_TYPE`, `CREATE_OPER`, `CREATE_DATE`, `CREATE_TIME`, `MODIFY_OPER`, `MODIFY_DATE`, `MODIFY_TIME`, `REMARK`) VALUES
	(1, 1, 'swpigris81', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `tbl_user_role` ENABLE KEYS */;

-- 正在导出表  manager.tbl_user_secret 的数据：~3 rows (大约)
DELETE FROM `tbl_user_secret`;
/*!40000 ALTER TABLE `tbl_user_secret` DISABLE KEYS */;
INSERT INTO `tbl_user_secret` (`ID`, `USER_ID`, `USER_CODE`, `USER_PASSWORD`, `USER_PROTECT_QUESTION`, `USER_PROTECT_ANSWER`, `CREATE_OPER`, `CREATE_DATE`, `CREATE_TIME`, `MODIFY_OPER`, `MODIFY_DATE`, `MODIFY_TIME`, `REMARK`) VALUES
	(1, 1, 'swpigris81', '546bbbf35be6c68ea30e2af88783fd10', NULL, NULL, NULL, NULL, NULL, 'swpigris81', '20150706', '090431', NULL);
/*!40000 ALTER TABLE `tbl_user_secret` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
