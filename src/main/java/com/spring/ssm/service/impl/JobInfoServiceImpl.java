package com.spring.ssm.service.impl;

import com.spring.ssm.Constracts.ExceptionConstract;
import com.spring.ssm.Constracts.RspConstracts;
import com.spring.ssm.Tool.BusiExcption;
import com.spring.ssm.dto.JobInfoPo;
import com.spring.ssm.mapper.JobInfoMapper;
import com.spring.ssm.service.JobInfoService;
import com.spring.ssm.service.bo.JobInfoReqBo;
import com.spring.ssm.service.bo.JobInfoRspBo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @ClassName: JobInfoServiceImpl
 * @Description：职位信息表操作 实现类
 * @Author: liuguisheng
 * @Date: 2019/3/8 16:54:07
 * @Copyright:2019 www.tydic.com Inc. All rights reserved.
 * 注意：本内容仅限于北京天源迪科信息技术有限公司内部传阅，禁止外泄以及用于其他商业目的
 */
@Service("jobInfoServiceImpl")
public class JobInfoServiceImpl implements JobInfoService {

    @Autowired
    private JobInfoMapper jobInfoMapper;

    private Logger LOG = LoggerFactory.getLogger(JobInfoServiceImpl.class);

    @Override
    public JobInfoRspBo createJobInfo(JobInfoReqBo reqBo) {
        LOG.info("进入职位信息添加服务");
        JobInfoRspBo retBo = new JobInfoRspBo();
        JobInfoPo po = new JobInfoPo();
        String validataStr = vlidataCreate(reqBo);
        if (!StringUtils.isEmpty(validataStr)) {
            retBo.setRespCode(RspConstracts.RSP_CODE_FAIL);
            retBo.setRespDesc(validataStr);
            return retBo;
        }
        BeanUtils.copyProperties(reqBo, po);
        transData(reqBo, po);

        int result;
        try {
            result = jobInfoMapper.insertJobInfo(po);
        } catch (Exception e) {
            LOG.error("调用mapper异常" + e);
            throw new BusiExcption(ExceptionConstract.JONINFO_EXCEPTION, "调用mapper异常" + e);
        }
        if (result < 0) {
            retBo.setRespCode(RspConstracts.RSP_CODE_FAIL);
            retBo.setRespDesc("未查询到匹配数据");
        } else  {
            retBo.setRespCode(RspConstracts.RSP_CODE_SUCCESS);
            retBo.setRespDesc(RspConstracts.RSP_DESC_SUCCESS);
        }
        return retBo;
    }

    @Override
    public JobInfoRspBo deleteJobInfo(JobInfoReqBo reqBo) {
        return null;
    }

    @Override
    public JobInfoRspBo queryJobInfoById(Long id) {
        return null;
    }

    @Override
    public List<JobInfoRspBo> queryJobInfoBySelective(JobInfoReqBo reqBo) {
        LOG.info("进入职位信息查询服务");
        List<JobInfoRspBo> retList = new ArrayList<>();
        List<JobInfoPo> jobInfoPoList = new ArrayList<>();

        JobInfoPo po = new JobInfoPo();
        //空串校验
        String vliEmptyStr = vliEmptyStrArg(reqBo, po);
        if (StringUtils.isEmpty(vliEmptyStr)) {
            BeanUtils.copyProperties(reqBo, po);
            //自定义特殊值传递方法
            transData(reqBo, po);
        }

        try {
            jobInfoPoList = jobInfoMapper.selectJobInfoBySelective(po);
        } catch (Exception e) {
            LOG.error("调用mapper查询数据错误" + e);
            throw new BusiExcption(ExceptionConstract.JONINFO_EXCEPTION, "调用mapper查询数据错误" + e);
        }
        if (!CollectionUtils.isEmpty(jobInfoPoList)) {
            for (JobInfoPo jobInfoPo : jobInfoPoList) {
                JobInfoRspBo bo = new JobInfoRspBo();
                BeanUtils.copyProperties(jobInfoPo, bo);
                bo.setId(jobInfoPo.getId() + "");
                bo.setNumber(jobInfoPo.getNumber() + "");
                bo.setDate(jobInfoPo.getDate() + "");
                bo.setRespCode(RspConstracts.RSP_CODE_SUCCESS);
                bo.setRespDesc(RspConstracts.RSP_DESC_SUCCESS);
                retList.add(bo);
            }
        }
        else {
            JobInfoRspBo bo = new JobInfoRspBo();
            bo.setRespCode(RspConstracts.RSP_CODE_FAIL);
            bo.setRespDesc("未查询到匹配的信息");
            retList.add(bo);
        }
        return retList;
    }

    @Override
    public JobInfoRspBo updateJobInfo(JobInfoReqBo reqBo) {
        return null;
    }

    /**
     * 描述: 特殊值传递
     * @param: [reqBo, po]
     * @return: void
     * @throws
     * @author: liuguisheng
     * @date:   2019/3/8 17:01:12
     */
    private void transData(JobInfoReqBo reqBo, JobInfoPo po) {
        if (!StringUtils.isEmpty(reqBo.getId())) {
            po.setId(Long.valueOf(reqBo.getId()));
        }
        if (!StringUtils.isEmpty(reqBo.getNumber())) {
            po.setNumber(Integer.valueOf(reqBo.getNumber()));
        }
        if (!StringUtils.isEmpty(reqBo.getDate())) {
            po.setDate(Long.valueOf(reqBo.getDate()));
        }
    }

    /**
     * 描述: 添加信息入参校验
     * @param: [reqBo]
     * @return: java.lang.String
     * @throws
     * @author: liuguisheng
     * @date:   2019/3/11 21:54:15
     */
    private String vlidataCreate(JobInfoReqBo reqBo) {
        if (reqBo == null) {
            return "入参对象不能为空";
        }
        if (StringUtils.isEmpty(reqBo.getPosition())) {
            return "职位名称不能为空";
        }
        if (StringUtils.isEmpty(reqBo.getCompany())) {
            return "公司名称不能为空";
        }
        if (StringUtils.isEmpty(reqBo.getLocal())) {
            return "工作地址不能为空";
        }
        if (StringUtils.isEmpty(reqBo.getSalary())) {
            return "薪酬不能为空";
        }
        if (StringUtils.isEmpty(reqBo.getNumber())) {
            return "招聘人数不能为空";
        }
        if (StringUtils.isEmpty(reqBo.getDate())) {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
            reqBo.setDate(dateFormat.format(new Date()));
        }
        return null;
    }

    /**
     * 描述: 空串校验
     * @param: [reqBo]
     * @return: java.lang.String
     * @throws
     * @author: liuguisheng
     * @date:   2019/3/13 22:58:40
     */
    private String vliEmptyStrArg(JobInfoReqBo reqBo, JobInfoPo po) {
        if (reqBo.getPosition() != "") {
            po.setPosition(reqBo.getPosition());
        }
        if (reqBo.getCompany() != "") {
            po.setCompany(reqBo.getCompany());
        }
        if (reqBo.getLocal() != "") {
            po.setLocal(reqBo.getLocal());
        }
        if (reqBo.getPosition() == "" || reqBo.getCompany() == "" || reqBo.getLocal() == "") {
            return "空串";
        }
        return null;
    }
}
