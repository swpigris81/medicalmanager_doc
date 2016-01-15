
/**
 * 系统项目名称
 * com.medical.manager.system.web.action
 * SysAdministrativeHandler.java
 * 
 * 2015年12月3日-下午5:04:30
 * 2015
 * 
 */
 
package com.medical.manager.system.web.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSON;
import com.medical.manager.common.web.action.BaseHandler;
import com.medical.manager.system.web.model.TblSysCity;
import com.medical.manager.system.web.service.ISysAdministrativeService;


/**
 * 
 * SysAdministrativeHandler 省市区划
 * 
 * 2015年12月3日 下午5:04:30
 * 
 * @version 1.0.0
 * 
 */
@Controller
@RequestMapping("/administrative")
public class SysAdministrativeHandler extends BaseHandler {
    private Logger logger = Logger.getLogger(SysAdministrativeHandler.class);
    @Resource
    private ISysAdministrativeService sysAdministrativeService;
    /**
     * searchCityByProvice 通过省查询市
     * (这里描述这个方法适用条件 – 可选)
     * @param response 响应
     * @param provinceid 省ID
     * @exception 
     * @since  1.0.0
     */
    @RequestMapping("searchCityByProvice.do")
    public void searchCityByProvice(HttpServletResponse response, Integer provinceid){
        logger.info("通过省查询市");
        List<TblSysCity> cityList = sysAdministrativeService.findCityByProvinceid(provinceid);
        writeMsg(response, JSON.toJSONString(cityList));
    }
}
