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

import java.util.ArrayList;
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
        return null;
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
        BeanUtils.copyProperties(reqBo, po);
        //自定义特殊值传递方法
        transData(reqBo, po);

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
}
