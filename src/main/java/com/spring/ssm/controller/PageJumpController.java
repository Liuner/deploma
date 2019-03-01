package com.spring.ssm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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

    @RequestMapping("/index")
    public String indexJump(){
        //return  "indexpage";
//        return "imitationDemo";
        return "register";
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "redirect:page/index";
    }

    @RequestMapping("/personal")
    public String userInfomation(){
        return  "page_personal";
    }

    @RequestMapping("/login")
    public ModelAndView login(HttpServletRequest request) {
        ModelAndView retPage = new ModelAndView();
        retPage.setViewName("loginPage");
        return retPage;
    }

}
