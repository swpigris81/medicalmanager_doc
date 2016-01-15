/*该表中尚未有新数据，故如此*/
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
   PAY_TIME             varchar(20) comment '付款时间',
   DELIVERY_TIME        varchar(20) comment '发货时间',
   ORDER_AMOUNT         bigint comment '订单金额',
   REMARK               varchar(256),
   primary key (ORDER_NUMBER)
);
