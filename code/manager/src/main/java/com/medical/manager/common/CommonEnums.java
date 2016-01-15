/**
 * 
 */
package com.medical.manager.common;

/**
 * 枚举类
 * @author jason
 *
 * 2015-12-1 下午3:33:33
 * 
 * @version 1.0.0
 */
public class CommonEnums {
    
    /**
     * 系统设置参数类型
     * @author jason
     *
     * 2015-12-1 下午3:36:36
     * 
     * @version 1.0.0
     */
    public static enum SystemParamType{
        OLD_PERSON_REGISTER("01", "老人端注册送"), 
        OLD_PERSON_INVITE("02", "老人端邀请送"),
        RELITIVE_REGISTER("03", "亲属端注册送"),
        RELITIVE_INVITE("04", "亲属端邀请送"),
        AMBULANCE_REGISTER("05", "急救车注册送"),
        AMBULANCE_INVITE("06", "急救车邀请送"),
        REGISTER_120("07", "120中心注册送"),
        INVITE_120("08", "120中心邀请送"),
        OLD_BACK_CASH("09", "老人端被邀请人购买多少个产品给邀请人返现"),
        RELITIVE_BACK_CASH("10", "亲属端被邀请人购买多少个产品给邀请人返现"),
        AMBULANCE_BACK_CASH("11", "急救车被邀请人充值多少给邀请人返现"),
        A120_BACK_CASH("12", "120中心被邀请人充值多少给邀请人返现"),
        AMBULANCE_MONTH_USE_COST("13", "急救车月使用费用"),
        A120_PROVINCE_MONTH_USE_COST("14", "120中心省级月使用费"),
        A120_CITY_MONTH_USE_COST("15", "120中心市级月使用费"),
        A120_COUNTY_MONTH_USE_COST("16", "120中心县级月使用费"),
        OLD_PERSON_CASH("17", "老人端最低提现金额"),
        RELITIVE_CASH("18", "亲属端最低提现金额"),
        AMBULANCE_CASH("19", "急救车端最低提现金额"),
        A120_CASH("20", "120最低提现金额");
        public String id, value;

        private SystemParamType(String id, String value) {
            this.id = id;
            this.value = value;
        }
        
        public static String keyOf(String id) {
            for (SystemParamType e : SystemParamType.values()) {
                if (e.id.equals(id))
                    return e.value;
            }
            return null;
        }
        
    }
    
    /**
     * 审核状态
     * @author jason
     *
     * 2015-12-1 下午3:58:48
     * 
     * @version 1.0.0
     */
    public static enum CheckStatus{
        AUDIT("00","待审核"),
        CHECK_PASS("01","审核通过"),
        CHECK_REJECT("02","审核拒绝");
        public String id, value;

        private CheckStatus(String id, String value) {
            this.id = id;
            this.value = value;
        }
        
    }
    
    /**
     * 客户类型
     * @author jason
     *
     * 2015-12-1 下午3:58:48
     * 
     * @version 1.0.0
     */
    public static enum CustomType{
        OLD_PERSON("01","老人端"),
        RELITIVE("02","亲属端"),
        AMBULANCE("03","急救车"),
        A120("04","120中心");
        public String id, value;

        private CustomType(String id, String value) {
            this.id = id;
            this.value = value;
        }
        
    }
    
    /**
     * 客户类型
     * @author jason
     *
     * 2015-12-1 下午3:58:48
     * 
     * @version 1.0.0
     */
    public static enum TblUserStatus{
        VALID("00","正常"),
        DELETED("09","禁用");
        public String id, value;

        private TblUserStatus(String id, String value) {
            this.id = id;
            this.value = value;
        }
        
    }

}
