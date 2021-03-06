package com.spring.ssm.controller;

import com.spring.ssm.Constracts.RspConstracts;
import com.spring.ssm.service.AdminInfoService;
import com.spring.ssm.service.ComInfoService;
import com.spring.ssm.service.JobInfoService;
import com.spring.ssm.service.UserInfoService;
import com.spring.ssm.service.bo.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @ClassName: PageJumpController
 * @Description：用于页面跳转的controller
 * @Author: liuguisheng
 * @Date: 2019/2/21 9:39:50
 */
@Controller
@RequestMapping("/page")
public class PageJumpController {
    private Logger LOG = LoggerFactory.getLogger(PageJumpController.class);
    private static final String SUCCESS = "0000";


    @Autowired
    private AdminInfoService adminInfoService;
    @Autowired
    private UserInfoService userInfoService;
    @Autowired
    private ComInfoService comInfoService;
    @Autowired
    private JobInfoService jobInfoService;
    /**
     * 重定向页面
     */
    @RequestMapping("/index")
    public String indexJump(){
        return "pageMain";
    }

    /**
     * tia
     */
    @RequestMapping("/demo")
    public ModelAndView login(HttpServletRequest request) {
        ModelAndView retPage = new ModelAndView();
        retPage.setViewName("Demo");
        return retPage;
    }

    /**
     * 登录测试controller
     */
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

    /**
     * 用户退出，返回到主界面
     */
    @RequestMapping("/loginOut")
    public String logout(HttpSession session){
        session.invalidate();
        return "pageMain";
    }

    /**
     * 跳转到登录页面
     */
    @RequestMapping("/login")
    public String login() {
        return "loginPage";
    }

    /**
     * 跳转到登录中
     */
    @RequestMapping("/logining")
    public String logining() {
        return "/lgs/loging";
    }

    /**
     * 跳转到注册页面
     */
    @RequestMapping("/register")
    public String register() {
        return "register";
    }

    /**
     * 跳转到个人主页
     */
    @RequestMapping("personalPage")
    public String personalPage(HttpSession session) {
        String type = session.getAttribute("TYPE").toString();
        if (RspConstracts.GENERAL.equals(type)) {
            return "/lgs/generalPage";
        }
        if (RspConstracts.COMPANY.equals(type)) {
            return "/lgs/companyPage";
        }
        if (RspConstracts.ADMIN.equals(type)) {
            return "/lgs/adminPage";
        }
        return null;
    }

    /**
     * 普通用户登录
     */
    @RequestMapping(value = "/generalLogin", method = RequestMethod.POST)
    @ResponseBody
    public UserInfoRspBo queryById(HttpSession session, UserInfoReqBo reqBo) {
        LOG.info("普通用户登录---Controller");
        UserInfoRspBo retBo = userInfoService.queryUserInfo(reqBo);
        if (retBo.getRespCode().equals(SUCCESS)) {
            session.setAttribute("ID", reqBo.getId());
            session.setAttribute("NAME", retBo.getName());
            session.setAttribute("TYPE", RspConstracts.GENERAL);
        }
        return retBo;
    }

    /**
     * 公司用户登录
     */
    @RequestMapping(value = "/companyLogin", method = RequestMethod.POST)
    @ResponseBody
    public CompanyInfoRspBo queryComById(HttpSession session, CompanyInfoReqBo reqBo) {
        LOG.info("公司用户登录---controller");
        //TODO 公司用户登录服务待实现
        CompanyInfoRspBo retBo = comInfoService.selectComInfo(reqBo);
        if (retBo.getRespCode().equals(SUCCESS)) {
            session.setAttribute("ID", retBo.getId());
            session.setAttribute("NAME", retBo.getName());
            session.setAttribute("TYPE", RspConstracts.COMPANY);
        }
        return retBo;
    }

    /**
     * 管理员登录
     */
    @RequestMapping(value = "/adminLogin", method = RequestMethod.POST)
    @ResponseBody
    public AdminInfoRspBo queryAdminbyId(HttpSession session, AdminInfoReqBo reqBo) {
        LOG.info("管理员登录---controller");
        AdminInfoRspBo retBo = adminInfoService.queryAdminInfo(reqBo);
        if (retBo.getRespCode().equals(SUCCESS)) {
            session.setAttribute("ID", retBo.getId());
            session.setAttribute("NAME", retBo.getName());
            session.setAttribute("TYPE", RspConstracts.ADMIN);
        }
        return retBo;
    }

    /**
     * 职位信息查询controller
     */
    @RequestMapping(value = "/queryJobInfo", method = RequestMethod.POST)
    @ResponseBody
    public List<JobInfoRspBo> queryJobInfo(JobInfoReqBo reqBo) {
        LOG.info("查询职位信息---controller");
        return jobInfoService.queryJobInfoBySelective(reqBo);
    }
}
