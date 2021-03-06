package com.spring.ssm.controller;

import com.spring.ssm.Tool.RspPage;
import com.spring.ssm.comb.AggregationService;
import com.spring.ssm.comb.bo.QueryReceviedResumeRspBo;
import com.spring.ssm.comb.bo.QurySendedRspBo;
import com.spring.ssm.service.*;
import com.spring.ssm.service.bo.*;
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
    @Autowired
    private RelGeneralJobCompanyService relGeneralJobCompanyService;
    @Autowired
    private AggregationService aggregationService;
    @Autowired
    private ResumeService resumeService;
    @Autowired
    private TestPage testPage;

    @RequestMapping(value = "/queryUserInfoById", method = RequestMethod.POST)
    @ResponseBody
    public UserInfoRspBo queryById(Long id) {
        LOG.info("queryUserInfoById-Controller");
        return userInfoService.queryUserInfoById(id);
    }

    @RequestMapping(value = "/queryUserInfo", method = RequestMethod.POST)
    @ResponseBody
    public List<UserInfoRspBo> query(UserInfoReqBo reqBo) {
        LOG.info("queryUserInfo-Controller");
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
    @RequestMapping(value = "/queryRelInfo", method = RequestMethod.POST)
    @ResponseBody
    public RelGeneralJobCompanyListRspBo qeuryRelInfo(RelGeneralJobCompanyReqBo reqBo) {
        LOG.info("queryRelIfo - controller");
        return relGeneralJobCompanyService.qyeryRelInfoList(reqBo);
    }
    @RequestMapping(value = "/generalQueryJobInfo", method = RequestMethod.POST)
    @ResponseBody
    public List<QurySendedRspBo> generalQueryJobInfo(Long id) {
        LOG.info("generalQueryJobInfo - controller");
        return aggregationService.qrySendedJobInfo(id);
    }

    @RequestMapping(value = "/deleteJobInfo", method = RequestMethod.POST)
    @ResponseBody
    public JobInfoRspBo deleteJobInfo(Long id) {
        LOG.info("deleteJobInfo - controller");
        return jobInfoService.deleteJobInfo(id);
    }

    @RequestMapping(value = "/qryJobInfoById", method = RequestMethod.POST)
    @ResponseBody
    public JobInfoRspBo qryJobInfoById(Long id) {
        LOG.info("qryJobInfoById - controller");
        return jobInfoService.queryJobInfoById(id);
    }

    @RequestMapping(value = "/updateJobInfo", method = RequestMethod.POST)
    @ResponseBody
    public JobInfoRspBo updateJobInfo(JobInfoReqBo reqBo) {
        LOG.info("updateJobInfo - controller");
        return jobInfoService.updateJobInfo(reqBo);
    }

    @RequestMapping(value = "/createRelInfo", method = RequestMethod.POST)
    @ResponseBody
    public RelGeneralJobCompanyRspBo createRelInfo(RelGeneralJobCompanyReqBo reqBo) {
        LOG.info("createRelInfo - controller");
        return relGeneralJobCompanyService.createRelInfo(reqBo);
    }

    @RequestMapping(value = "/updateRelInfo", method = RequestMethod.POST)
    @ResponseBody
    public RelGeneralJobCompanyRspBo updateRelInfo(RelGeneralJobCompanyReqBo reqBo) {
        LOG.info("updateRelInfo - controller");
        return relGeneralJobCompanyService.updateRelInfo(reqBo);
    }

    @RequestMapping(value = "/deleteRelInfo", method = RequestMethod.POST)
    @ResponseBody
    public RelGeneralJobCompanyRspBo deleteRelInfo(Long id) {
        LOG.info("updateRelInfo - controller");
        return relGeneralJobCompanyService.deleteRelInfoById(id);
    }

    @RequestMapping(value = "/qryResumeInfo", method = RequestMethod.POST)
    @ResponseBody
    public ResumeListRspBo qryResumeInfo(ResumeReqBo reqBo) {
        LOG.info("qryResumeInfo - controller");
        return resumeService.qryResumeInfo(reqBo);
    }

    @RequestMapping(value = "/createResumeInfo", method = RequestMethod.POST)
    @ResponseBody
    public ResumeRspBo createResumeInfo(ResumeReqBo reqBo) {
        LOG.info("createResumeInfo - controller");
        return resumeService.createResumeInfo(reqBo);
    }

    @RequestMapping(value = "/deleteResumeInfo", method = RequestMethod.POST)
    @ResponseBody
    public ResumeRspBo deleteResumeInfo(ResumeReqBo reqBo) {
        LOG.info("createResumeInfo - controller");
        return resumeService.deleteResumeInfo(reqBo);
    }

    @RequestMapping(value = "/updateResumeInfo", method = RequestMethod.POST)
    @ResponseBody
    public ResumeRspBo updateResumeInfo(ResumeReqBo reqBo) {
        LOG.info("createResumeInfo - controller");
        return resumeService.updateResumeInfo(reqBo);
    }

    @RequestMapping(value = "/qryReceivedResumeInfo", method = RequestMethod.POST)
    @ResponseBody
    public List<QueryReceviedResumeRspBo> qryReceivedResumeInfo(Long id) {
        LOG.info("qryReceivedGeneralInfo - controller");
        return aggregationService.qryReceivedGeneralInfo(id);
    }

    //分页测试controller
    @RequestMapping(value = "/qryJobInfoWithPage", method = RequestMethod.POST)
    @ResponseBody
    public RspPage<JobInfoRspPage> qryJobInfoWithPage(JobInfoReqPage reqBo) {
        LOG.info("qryJobInfoWithPage - controller:" + reqBo);
        return testPage.getJobInfoPage(reqBo);
    }
}
