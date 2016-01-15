drop table if exists TBL_BRAND;

/*==============================================================*/
/* Table: TBL_BRAND                                             */
/*==============================================================*/
create table TBL_BRAND
(
   NO                   bigint not null auto_increment comment '主键',
   BRAND_NAME           varchar(20),
   REMARK               varchar(50),
   CREATE_TIME          varchar(20),
   primary key (NO)
);
drop table if exists TBL_PRODUCT;

/*==============================================================*/
/* Table: TBL_PRODUCT                                           */
/*==============================================================*/
create table TBL_PRODUCT
(
   PRODUCT_ID           bigint not null auto_increment comment '主键',
   BRAND_NO             bigint,
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


drop table if exists TBL_ORDER;

/*==============================================================*/
/* Table: TBL_ORDER                                             */
/*==============================================================*/
create table TBL_ORDER
(
   ORDER_NUMBER         bigint not null auto_increment,
   BRAND_NO             bigint,
   BRAND_NAME           varchar(20),
   PRODUCT_ID           bigint,
   NUMBER               bigint,
   PRODUCT_NO           varchar(20),
   USER_ID              bigint,
   PHONE_NUMBER         int(11),
   RECEIVE_ADDRESS      varchar(50),
   IS_PAY               varchar(2) comment 'Y已付款，N未付款（默认）',
   IS_DELIVERY          varchar(2) comment 'Y已发货，N未发货（默认）',
   ORDER_TIME           varchar(20),
   primary key (ORDER_NUMBER)
);



/*==============================================================*/
/* Table: TBL_DELIVER_PRODUCT                                   */
/*==============================================================*/
create table TBL_DELIVER_PRODUCT
(
   ID                   bigint not null auto_increment comment '主键',
   ORDER_NUMBER         bigint,
   USER_NAME            varchar(20),
   PRODUCT_NO           bigint,
   NUMBER               bigint,
   PHONE_NUMBER         bigint(11),
   DELIVER_REMARK       varchar(100),
   EXPRESS              varchar(20),
   EXPRESS_NO           bigint,
   DELIVER_TIME         varchar(20),
   EXPRESS_ID           bigint,
   primary key (ID)
);



/*==============================================================*/
/* Table: TBL_EXPRESS                                           */
/*==============================================================*/
create table TBL_EXPRESS
(
   ID                   bigint not null auto_increment comment '主键',
   EXPRESS_NAME         varchar(10),
   primary key (ID)
);
      drop table if exists TBL_MACHINE_CODE;

/*==============================================================*/
/* Table: TBL_MACHINE_CODE                                      */
/*==============================================================*/
create table TBL_MACHINE_CODE
(
   ID                   bigint not null auto_increment comment '主键',
   CODE                 varchar(20),
   USE_STATUS           varchar(2) comment 'Y已使用，N未使用（默认）',
   CREATE_TIME          varchar(20),
   primary key (ID)
);
      drop table if exists TBL_MACHINE_USE;

/*==============================================================*/
/* Table: TBL_MACHINE_USE                                       */
/*==============================================================*/
create table TBL_MACHINE_USE
(
   ID                   bigint not null auto_increment comment '主键',
   OPEN_TIME            varchar(20),
   USER_ID              bigint,
   USER_NAME            varchar(20),
   PHONE_NUMBER         varchar(11),
   MACHINE_ID           bigint,
   MACHINE_CODE         varchar(20),
   REMARK               varchar(50),
   primary key (ID)
);

alter table TBL_MACHINE_USE comment '机器码使用信息表';



/*==============================================================*/
/* Table: TBL_SYS_RECEIVABLES                                   */
/*==============================================================*/
create table TBL_SYS_RECEIVABLES
(
   ID                   bigint not null auto_increment comment '主键',
   ALIPAY_NAME          varchar(20),
   ALIPAY_ACCOUNT       varchar(50),
   PUBLIC_ACCOUNT_COMPANY varchar(50),
   PUBLIC_ACCOUNT       varchar(50),
   PUBLIC_ACCOUNT_BANK  varchar(20),
   PERSON_NAME          varchar(20),
   PERSON_ACCOUNT       varchar(50),
   PERSON_ACCOUNT_BANK  varchar(20),
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
   PARAM_NAME           varchar(20),
   PARAM_TYLE           varchar(2) comment 'a01老人端注册送,a02老人端邀请送,a03亲属端注册送a04亲属端邀请送,a05急救车注册送,a06急救车邀请送,a07:120中心注册送,a08:120中心邀请送,a09老人端被邀请人购买多少个产品给邀请人返现a10亲属端被邀请人购买多少个产品给邀请人返现a11急救车被邀请人充值多少给邀请人返现a12:120中心被邀请人充值多少给邀请人返现a13急救车月使用费a14:120中心省级月使用费a15:120中心市级月使用费a16：120中心县级月使用费，a17老人端最低提现金额，a18亲属端最低提现金额，a19:急救车端最低提现金额，a20:120中心最低提现金额',
   PARAM_VALUE          varchar(20),
   RECHARGE             varchar(10) comment '只针对月使用费时使用，其余为空',
   FREE                 varchar(10) comment '只针对月使用费时使用，其余为空',
   primary key (ID)
);

alter table TBL_SYS_INFO comment '系统信息设置表';
      drop table if exists TBL_CUS_BASIC_INFO;

/*==============================================================*/
/* Table: TBL_CUS_PHONE_CHANGE_APPLY                            */
/*==============================================================*/
create table TBL_CUS_PHONE_CHANGE_APPLY
(
   ID                   bigint not null comment '主键',
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


      