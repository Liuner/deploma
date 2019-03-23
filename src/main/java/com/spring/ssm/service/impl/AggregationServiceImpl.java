package com.spring.ssm.service.impl;

import com.spring.ssm.Constracts.RspConstracts;
import com.spring.ssm.service.AggregationService;
import com.spring.ssm.service.JobInfoService;
import com.spring.ssm.service.RelGeneralJobCompanyService;
import com.spring.ssm.service.bo.JobInfoRspBo;
import com.spring.ssm.service.bo.RelGeneralJobCompanyReqBo;
import com.spring.ssm.service.bo.RelGeneralJobCompanyRspBo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.List;

/**
 * @ClassName: AggregationServiceImpl
 * @Description：聚合服务实现
 * @Author: liuguisheng
 * @Date: 2019/3/23 15:27:39
 * @Copyright:2019 www.tydic.com Inc. All rights reserved.
 * 注意：本内容仅限于北京天源迪科信息技术有限公司内部传阅，禁止外泄以及用于其他商业目的
 */
@Service("AggregationService")
public class AggregationServiceImpl implements AggregationService {

    @Autowired
    private RelGeneralJobCompanyService relGeneralJobCompanyService;
    @Autowired
    private JobInfoService jobInfoService;

    private Logger LOG = LoggerFactory.getLogger(AggregationServiceImpl.class);

    @Override
    public List<JobInfoRspBo> scanJobList(Long id) {
        LOG.info("用户id->关系表->职位id->职位信息");

        List<JobInfoRspBo> retInfoList = new ArrayList<>();
        RelGeneralJobCompanyReqBo relReqBo = new RelGeneralJobCompanyReqBo();
        if (StringUtils.isEmpty(id)) {
            JobInfoRspBo jobInfoRspBo = new JobInfoRspBo();
            jobInfoRspBo.setRespCode(RspConstracts.RSP_CODE_FAIL);
            jobInfoRspBo.setRespDesc("入参id不能为空");
            retInfoList.add(jobInfoRspBo);
            return retInfoList;
        }
        relReqBo.setGeneralId(id.toString());
        List<RelGeneralJobCompanyRspBo> relRspList = relGeneralJobCompanyService.queryRelInfoBySelective(relReqBo);
        //未查询到信息 返回提示
        if (CollectionUtils.isEmpty(relRspList)) {
            LOG.error("在关系表未查询到信息");
            JobInfoRspBo jobInfoRspBo = new JobInfoRspBo();
            jobInfoRspBo.setRespCode(RspConstracts.RSP_CODE_FAIL);
            jobInfoRspBo.setRespDesc("在关系表未查询到信息");
            retInfoList.add(jobInfoRspBo);
            return retInfoList;
        }
        for (RelGeneralJobCompanyRspBo relRspBo : relRspList) {
            Long jobId = Long.valueOf(relRspBo.getJobId());
            JobInfoRspBo jobInfoRspBo = jobInfoService.queryJobInfoById(jobId);
            if (jobInfoRspBo != null) {
                retInfoList.add(jobInfoRspBo);
            }
        }
        if (CollectionUtils.isEmpty(retInfoList)) {
            JobInfoRspBo jobInfoRspBo = new JobInfoRspBo();
            jobInfoRspBo.setRespCode(RspConstracts.RSP_CODE_FAIL);
            jobInfoRspBo.setRespDesc("在职位表未查询到信息");
            retInfoList.add(jobInfoRspBo);
        }
        return retInfoList;
    }
}
