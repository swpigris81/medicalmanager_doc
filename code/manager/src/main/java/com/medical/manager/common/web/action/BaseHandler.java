
/**
 * 系统项目名称
 * com.supermarket.common.web.action
 * BaseHandler.java
 * 
 * 2015年7月2日-上午10:10:05
 * 2015版权所有
 * 
 */
 
package com.medical.manager.common.web.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.alibaba.fastjson.JSON;
import com.medical.manager.system.web.model.TblUser;


/**
 * @description 基础控制器
 * 
 * @time 2015年7月2日 上午10:10:05
 * @author Jason
 * @version 1.0.0
 * 
 */
public class BaseHandler {
    private Logger logger = Logger.getLogger(BaseHandler.class);
    /**
     * 后台管理人员登录之后的session
     */
    public static final String SESSION_USER = "SESSION_USER";
    /**
     * 前台微信用户登录之后的session
     */
    public static final String SESSION_WECHAT_USER = "SESSION_WECHAT_USER";
    
    /**
     * @description getSessionUser 获取Session中的用户
     * @param session
     * @return TblUser
     * @exception 
     * @author Jason
     * @since  1.0.0
     */
    public TblUser getSessionUser(HttpSession session){
        TblUser user = (TblUser) session.getAttribute(SESSION_USER);
        return user;
    }
    /**
     * getClientIp 获取客户端IP地址
     * (这里描述这个方法适用条件 – 可选)
     * @param request 客户端请求
     * @return String IP地址
     * @exception 
     * @since  1.0.0
     */
    public String getClientIp(HttpServletRequest request){
        if (request.getHeader("x-forwarded-for") == null) { 
            return request.getRemoteAddr(); 
        } 
        return request.getHeader("x-forwarded-for");  
    }
    
    /**
     * @description  登录超时返回首页
     * @param session
     * @return String
     * @exception 
     * @author Jason
     * @since  1.0.0
     */
    public String logginTimeOut(HttpSession session){
        TblUser user = (TblUser) session.getAttribute(SESSION_USER);
        if(user == null){
            logger.info("用户登录超时，重新登录！");
            return "redirect:/index.jsp";
        }
        return null;
    }
    
    
    /**
     * @description responseMsg 组织消息回复客户端
     * @param response 响应
     * @param map 消息对象
     * @return String
     * @exception 
     * @author Jason
     * @since  1.0.0
     */
    public void writeMsg(HttpServletResponse response, Map map){
        writeMsg(response, JSON.toJSONString(map));
    }
    /**
     * @description responseMsg 组织消息回复客户端
     * @param response 响应
     * @param map 消息对象
     * @return String
     * @exception 
     * @author Jason
     * @since  1.0.0
     */
    public void writeMsg(HttpServletResponse response, String msg){
        PrintWriter pw = null;
        try {
            logger.info("响应数据：" + msg);
            response.setContentType("text/html;charset=UTF-8");
            pw = response.getWriter();
            pw.write(msg);
        } catch (IOException e) {
            logger.error(e.getMessage(), e);
        }
        return;
    }
    
    /**
     * @description writeSuccessMsg 组织成功消息返回
     * @param response
     * @param msg 
     * @return void
     * @exception 
     * @author Jason
     * @since  1.0.0
     */
    public void writeSuccessMsg(HttpServletResponse response, String msg){
        Map map = new HashMap();
        map.put("success", "true");
        map.put("msg", msg);
        writeMsg(response, map);
    }
    
    /**
     * @description writeFailMsg 组织失败消息返回
     * @param response
     * @param msg 
     * @return void
     * @exception 
     * @author Jason
     * @since  1.0.0
     */
    public void writeFailMsg(HttpServletResponse response, String msg){
        Map map = new HashMap();
        map.put("success", "false");
        map.put("msg", msg);
        writeMsg(response, map);
    }
}
