package com.spring.ssm.controller;

import com.spring.ssm.service.AdminInfoService;
import com.spring.ssm.service.JobInfoService;
import com.spring.ssm.service.bo.*;
import com.spring.ssm.service.ComInfoService;
import com.spring.ssm.service.UserInfoService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @ClassName: DemoController
 * @Description：Demo
 * @Author: liuguisheng
 * @Date: 2019/2/1 14:57:23
 * @Copyright:2019 www.tydic.com Inc. All rights reserved.
 * 注意：本内容仅限于北京天源迪科信息技术有限公司内部传阅，禁止外泄以及用于其他商业目的
 */
@Controller
@RequestMapping("/demo")
public class DemoController {
    Logger LOG = LoggerFactory.getLogger(DemoController.class);
    private static final String SUCCESS = "0000";

    @Autowired
    private UserInfoService userInfoService;
    @Autowired
    private ComInfoService comInfoService;
    @Autowired
    private AdminInfoService adminInfoService;
    @Autowired
    private JobInfoService jobInfoService;


    @RequestMapping(value = "/queryUserInfoById", method = RequestMethod.POST)
    @ResponseBody
    public UserInfoRspBo queryById(Long id) {
        LOG.info("queryUserInfoById-Controller");
        return userInfoService.queryUserInfoById(id);
    }

    @RequestMapping(value = "/queryUserInfo", method = RequestMethod.POST)
    @ResponseBody
    public List<UserInfoRspBo> query(UserInfoReqBo reqBo) {
        LOG.info("queryUserInfoById-Controller");
        return userInfoService.queryInfoBySelective(reqBo);
    }

    @RequestMapping(value = "/createUserInfo", method = RequestMethod.POST)
    @ResponseBody
    public UserInfoRspBo createTest(HttpSession session, UserInfoReqBo reqBo) {
        LOG.info("addUserInfo-Controller");
        UserInfoRspBo retBo = userInfoService.addUserInfo(reqBo);
        if (retBo.getRespCode().equals(SUCCESS)) {
            session.setAttribute("ID", retBo.getId());
        }
        return retBo;
    }

    @RequestMapping(value = "/updataUserInfo", method = RequestMethod.POST)
    @ResponseBody
    public UserInfoRspBo updateTest(UserInfoReqBo reqBo) {
        LOG.info("updataUserInfo-Controller");
        return userInfoService.updateUserInfoById(reqBo);
    }

    @RequestMapping(value = "/deleteUserInfo", method = RequestMethod.POST)
    @ResponseBody
    public UserInfoRspBo updateTest(Long id) {
        LOG.info("deleteUserInfo-Controller");
        return userInfoService.deleteUserInfoById(id);
    }

    @RequestMapping(value = "/createComInfo", method = RequestMethod.POST)
    @ResponseBody
    public CompanyInfoRspBo createComInfo(HttpSession session, CompanyInfoReqBo reqBo) {
        LOG.info("createCompanyInfo-controller");
        CompanyInfoRspBo retBo = comInfoService.createComInfo(reqBo);
        if (retBo.getRespCode().equals(SUCCESS)) {
            session.setAttribute("ID", retBo.getId());
        }
        return retBo;
    }

    @RequestMapping(value = "/queryComInfoById", method = RequestMethod.POST)
    @ResponseBody
    public CompanyInfoRspBo queryomInfoById(Long id) {
        LOG.info("queryComInfoById-controller");
        return comInfoService.selectComInfoById(id);
    }

    @RequestMapping(value = "/updateComInfoById", method = RequestMethod.POST)
    @ResponseBody
    public CompanyInfoRspBo queryomInfoById(CompanyInfoReqBo reqBo) {
        LOG.info("updateComInfoById-controller");
        return comInfoService.updateComInfoById(reqBo);
    }

    @RequestMapping(value = "/queryAllComInfo", method = RequestMethod.POST)
    @ResponseBody
    public List<CompanyInfoRspBo> queryAllInfo(CompanyInfoReqBo reqBo) {
        LOG.info("queryAllComInfo-controller");
        return comInfoService.selectComInfoBySelective(reqBo);
    }

    @RequestMapping(value = "/deleteComInfoById", method = RequestMethod.POST)
    @ResponseBody
    public CompanyInfoRspBo deleteComInfoById(Long id) {
        LOG.info("deleteComInfoById-controller");
        return comInfoService.deleteComInfo(id);
    }

    @RequestMapping(value = "/createAdminInfo", method = RequestMethod.POST)
    @ResponseBody
    public AdminInfoRspBo createInfo(HttpSession session, AdminInfoReqBo reqBo) {
        LOG.info("createAdminInfo - controller");
        AdminInfoRspBo retBo = adminInfoService.createAdminInfo(reqBo);
        if (retBo.getRespCode() == SUCCESS) {
            session.setAttribute("ID", retBo.getId());
        }
        return retBo;
    }

    @RequestMapping(value = "/queryAdminInfoById", method = RequestMethod.POST)
    @ResponseBody
    public AdminInfoRspBo queryAdminInfoById(Long id) {
        LOG.info("queryAdminInfoById - controller");
        return adminInfoService.queryAdminInfoById(id);
    }

    @RequestMapping(value = "/queryAdminInfoBySelective", method = RequestMethod.POST)
    @ResponseBody
    public List<AdminInfoRspBo> queryAdminInfoBySelective(AdminInfoReqBo reqBo) {
        LOG.info("queryAdminInfo - controller");
        return adminInfoService.queryAdminInfoBySelective(reqBo);
    }

    @RequestMapping(value = "/updateAdminInfo", method = RequestMethod.POST)
    @ResponseBody
    public AdminInfoRspBo updateAdminInfo(AdminInfoReqBo reqBo) {
        LOG.info("updateAdminInfo - controller");
        return adminInfoService.updateAdminInfo(reqBo);
    }

    @RequestMapping(value = "/deleteAdminInfo", method = RequestMethod.POST)
    @ResponseBody
    public AdminInfoRspBo deleteAdminInfo(Long id) {
        LOG.info("deleteAdminInfo - controller");
        return adminInfoService.deleteAdminInfo(id);
    }

    @RequestMapping(value = "/queryJobInfoBySelective", method = RequestMethod.POST)
    @ResponseBody
    public List<JobInfoRspBo> queryJobInfoBySelective(JobInfoReqBo reqBo) {
        LOG.info("queryJobInfo - controller");
        return jobInfoService.queryJobInfoBySelective(reqBo);
    }

    @RequestMapping(value = "/createJobInfo", method = RequestMethod.POST)
    @ResponseBody
    public JobInfoRspBo createJobInfo(JobInfoReqBo reqBo) {
        LOG.info("createJobInfo - controller");
        return jobInfoService.createJobInfo(reqBo);
    }
}
