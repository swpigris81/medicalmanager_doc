/**
 * 
 */
package com.medical.manager.product.web.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.Page;
import com.medical.manager.common.pager.PagerInfo;
import com.medical.manager.common.web.action.BaseHandler;
import com.medical.manager.product.web.model.TblMachineCode;
import com.medical.manager.product.web.model.TblMachineUse;
import com.medical.manager.product.web.service.IMachineCodeService;

/**
 * @author jason
 *
 * 2015-12-2 下午3:47:46
 * 
 * @version 1.0.0
 */
@Controller
@RequestMapping("/machineCode")
public class MachineCodeHandler extends BaseHandler {
    
    private static Logger logger=Logger.getLogger(MachineCodeHandler.class);
    
    @Resource
    private IMachineCodeService machineCodeService;
    
    /**
     * 跳转到机器码管理主页
     * @param session
     * @return
     */
    @RequestMapping("/machineCodeIndex.do")
    public String machineCodeIndex(HttpSession session){
    	String timeout=logginTimeOut(session);
    	if(timeout!=null){
    		return timeout;
    	}
    	return "product/machinecode/machineCodeIndex";
    }
    
    /**
     * 查询机器码
     * (这里描述这个方法适用条件 – 可选)
     * @param response
     * @param pageNum
     * @param pageSize
     * @param useStatus
     * @exception
     * @since 1.0.0
     */
    @RequestMapping("/queryMachineCodeList.do")
    public void queryMachineCodeList(HttpServletResponse response,Integer page,Integer rows,String useStatus){
        logger.info("查询机器码");
        try {
            List<TblMachineCode> machineCodes=this.machineCodeService.queryMachineCodeList(page,rows,useStatus);
            writeMsg(response, JSON.toJSONString(PagerInfo.converFromPage((Page<TblMachineCode>) machineCodes)));
        } catch (Exception e) {
            logger.error("查询机器码失败", e);
            writeFailMsg(response, "查询机器码失败");
        }
    }
    
    /**
     * 批量生成机器码
     * (这里描述这个方法适用条件 – 可选)
     * @param response
     * @exception
     * @since 1.0.0
     */
    @RequestMapping("/produceMachineCodes.do")
    public void produceMachineCodes(HttpServletResponse response,Integer number){
        logger.info("批量生成机器码");
        try {
            this.machineCodeService.produceMachineCodes(number);
            writeSuccessMsg(response, "批量生成机器码成功！");
        } catch (Exception e) {
            logger.error("批量生成机器码失败！", e);
            writeFailMsg(response, "批量生成机器码失败！");
        }
    }
    
    /**
     * 查询机器码使用状态
     * (这里描述这个方法适用条件 – 可选)
     * @param response
     * @param pageNum
     * @param pageSize
     * @param phoneNumber
     * @exception
     * @since 1.0.0
     */
    @RequestMapping("/queryMachineUseList.do")
    public void queryMachineUseList(HttpServletResponse response,Integer pageNum,Integer pageSize,String phoneNumber){
        logger.info("查询机器码使用状态");
        try {
            List<TblMachineUse> machineUses=this.machineCodeService.queryMachineUseList(pageNum,pageSize,phoneNumber);
            writeMsg(response, JSON.toJSONString(PagerInfo.converFromPage((Page<TblMachineUse>) machineUses)));
        } catch (Exception e) {
            logger.error("查询机器码使用状态失败！",e);
            writeFailMsg(response, "查询机器码使用状态失败");
        }
        
    }
    
}
