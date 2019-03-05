package com.spring.ssm.controller;

import com.spring.ssm.service.AdminInfoService;
import com.spring.ssm.service.Bo.*;
import com.spring.ssm.service.ComInfoService;
import com.spring.ssm.service.UserInfoService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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

    @Autowired
    private UserInfoService userInfoService;
    @Autowired
    private ComInfoService comInfoService;
    @Autowired
    private AdminInfoService adminInfoService;


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
        return userInfoService.queryInfo(reqBo);
    }

    @RequestMapping(value = "/createUserInfo", method = RequestMethod.POST)
    @ResponseBody
    public UserInfoRspBo createTest(UserInfoReqBo reqBo) {
        LOG.info("addUserInfo-Controller");
        return userInfoService.addUserInfo(reqBo);
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
    public CompanyInfoRspBo createComInfo(CompanyInfoReqBo reqBo) {
        LOG.info("createCompanyInfo-controller");
        return comInfoService.createComInfo(reqBo);
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
    public List<CompanyInfoRspBo> queryAllInfo() {
        LOG.info("queryAllComInfo-controller");
        return comInfoService.selectComInfo();
    }

    @RequestMapping(value = "/deleteComInfoById", method = RequestMethod.POST)
    @ResponseBody
    public CompanyInfoRspBo deleteComInfoById(Long id) {
        LOG.info("deleteComInfoById-controller");
        return comInfoService.deleteComInfo(id);
    }

    @RequestMapping(value = "/createAdminInfo", method = RequestMethod.POST)
    @ResponseBody
    public AdminInfoRspBo createInfo(AdminInfoReqBo reqBo) {
        LOG.info("createAdminInfo - controller");
        return adminInfoService.createAdminInfo(reqBo);
    }

    @RequestMapping(value = "/queryAdminInfoById", method = RequestMethod.POST)
    @ResponseBody
    public AdminInfoRspBo queryAdminInfoById(Long id) {
        LOG.info("queryAdminInfoById - controller");
        return adminInfoService.queryAdminInfoById(id);
    }

    @RequestMapping(value = "/queryAdminInfo", method = RequestMethod.POST)
    @ResponseBody
    public List<AdminInfoRspBo> queryAdminInfo() {
        LOG.info("queryAdminInfo - controller");
        return adminInfoService.queryAdminInfo();
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
}
