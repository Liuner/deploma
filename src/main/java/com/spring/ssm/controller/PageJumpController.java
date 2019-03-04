package com.spring.ssm.controller;

import com.spring.ssm.service.AdminInfoService;
import com.spring.ssm.service.Bo.AdminInfoRspBo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * @ClassName: PageJumpController
 * @Description：用于页面跳转的controller
 * @Author: liuguisheng
 * @Date: 2019/2/21 9:39:54
 * @Copyright:2019 www.tydic.com Inc. All rights reserved.
 * 注意：本内容仅限于北京天源迪科信息技术有限公司内部传阅，禁止外泄以及用于其他商业目的
 */
@Controller
@RequestMapping("/page")
public class PageJumpController {

    @Autowired
    private AdminInfoService adminInfoService;

    @RequestMapping("/index")
    public String indexJump(){
        //return  "indexpage";
//        return "imitationDemo";
        return "register";
    }

    @RequestMapping("/personal")
    public String userInfomation(){
        return  "page_personal";
    }

    @RequestMapping("/login")
    public ModelAndView login(HttpServletRequest request) {
        ModelAndView retPage = new ModelAndView();
        retPage.setViewName("loginDemo");
        return retPage;
    }

    @RequestMapping(value = "/loginDemo", method = RequestMethod.POST)
    @ResponseBody
    public boolean loginDemo(HttpSession session, Long id){
        AdminInfoRspBo rsp = adminInfoService.queryAdminInfoById(id);
        if (rsp.getRespCode() == "0000") {
            session.setAttribute("NAME", rsp.getName());
            return true;
        }
        return false;
    }

    @RequestMapping("/loginOut")
    public String logout(HttpSession session){
        session.invalidate();
        return "register";
    }

}
