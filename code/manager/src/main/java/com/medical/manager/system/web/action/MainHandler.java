
/**
 * 系统项目名称
 * com.supermarket.system.web.action
 * MainHandler.java
 * 
 * 2015年7月3日-下午12:02:34
 * 2015版权所有
 * 
 */
 
package com.medical.manager.system.web.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.medical.manager.common.web.action.BaseHandler;
import com.medical.manager.system.web.model.TblUser;
import com.medical.manager.system.web.service.IMenuService;


/**
 * @description 
 * 
 * @time 2015年7月3日 下午12:02:34
 * @author Jason
 * @version 1.0.0
 * 
 */
@Controller
@RequestMapping("/main")
public class MainHandler extends BaseHandler {
    private Logger logger = Logger.getLogger(MainHandler.class);
    private static final String MAIN_PAGE = "main/index";
    @Resource
    private IMenuService menuService;
    /**
     * @description index 用户登录成功之后跳转到的主页
     * @param model 返回页面对象数据
     * @return String
     * @exception 
     * @author Jason
     * @since  1.0.0
     */
    @RequestMapping("index.do")
    public String index(HttpServletRequest request, Model model){
        TblUser user = (TblUser) request.getSession().getAttribute(SESSION_USER);
        if(user == null){
            logger.info("用户登录超时，重新登录！");
            return "redirect:/index.jsp";
        }
        //查询用户拥有的权限菜单(第一级菜单)
        List menuList = menuService.findFirstLevelMenuByUserCode(user.getUserCode());
        model.addAttribute("menuList", menuList);
        model.addAttribute("user", user);
        return MAIN_PAGE;
    }
    
}
