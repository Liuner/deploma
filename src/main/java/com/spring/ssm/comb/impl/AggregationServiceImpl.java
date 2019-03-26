package com.spring.ssm.comb.impl;


import com.spring.ssm.Constracts.RspConstracts;
import com.spring.ssm.comb.AggregationService;
import com.spring.ssm.comb.bo.QueryReceviedResumeRspBo;
import com.spring.ssm.comb.bo.QurySendedRspBo;
import com.spring.ssm.service.JobInfoService;
import com.spring.ssm.service.RelGeneralJobCompanyService;
import com.spring.ssm.service.ResumeService;
import com.spring.ssm.service.bo.*;
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
 * @ClassName: AggregationServiceImpl
 * @Description：聚合服务实现
 * @Author: liuguisheng
 * @Date: 2019/3/23 15:27:39
 * @Copyright:2019 www.tydic.com Inc. All rights reserved.
 * 注意：本内容仅限于北京天源迪科信息技术有限公司内部传阅，禁止外泄以及用于其他商业目的
 */
@Service("aggregationService")
public class AggregationServiceImpl implements AggregationService {

    @Autowired
    private RelGeneralJobCompanyService relGeneralJobCompanyService;
    @Autowired
    private JobInfoService jobInfoService;
    @Autowired
    private ResumeService resumeService;

    private Logger LOG = LoggerFactory.getLogger(AggregationServiceImpl.class);
    private static final String SUCCESS = "0000";

    @Override
    public List<QurySendedRspBo> qrySendedJobInfo(Long id) {
        LOG.info("用户id->关系表->职位id->职位信息");
        //出参list
        List<QurySendedRspBo> rutList = new ArrayList<>();

        if (StringUtils.isEmpty(id)) {
            QurySendedRspBo sendedRspBo = new QurySendedRspBo();
            sendedRspBo.setRespCode(RspConstracts.RSP_CODE_FAIL);
            sendedRspBo.setRespDesc("入参id不能为空");
            rutList.add(sendedRspBo);
            return rutList;
        }
        //关系表入参
        RelGeneralJobCompanyReqBo relReqBo = new RelGeneralJobCompanyReqBo();
        relReqBo.setGeneralId(id.toString());
        //查询关系表
        RelGeneralJobCompanyListRspBo relRspBo = relGeneralJobCompanyService.qyeryRelInfoList(relReqBo);

        if (!relRspBo.getRespCode().equals(SUCCESS) || CollectionUtils.isEmpty(relRspBo.getRow())) {
            LOG.error("在关系表未查询到信息");
            QurySendedRspBo sendedRspBo = new QurySendedRspBo();
            sendedRspBo.setRespCode(RspConstracts.RSP_CODE_FAIL);
            sendedRspBo.setRespDesc("在关系表未查询到信息");
            rutList.add(sendedRspBo);
            return rutList;
        }
        //遍历获取到的关系信息集合，获取相关职位ID
        List<RelGeneralJobCompanyRspBo> rows = relRspBo.getRow();
        for (RelGeneralJobCompanyRspBo bo : rows) {
            //查询职位信息表
             Long jobId = Long.valueOf(bo.getJobId());
             JobInfoRspBo jobInfoRspBo = jobInfoService.queryJobInfoById(jobId);
             if (jobInfoRspBo.getRespCode().equals(SUCCESS)) {
                 QurySendedRspBo sendedRspBo = new QurySendedRspBo();
                 BeanUtils.copyProperties(jobInfoRspBo, sendedRspBo);
                 sendedRspBo.setFlag(bo.getFlag());
                 rutList.add(sendedRspBo);
             }
        }
        if (CollectionUtils.isEmpty(rutList)) {
            QurySendedRspBo sendedRspBo = new QurySendedRspBo();
            sendedRspBo.setRespCode(RspConstracts.RSP_CODE_FAIL);
            sendedRspBo.setRespDesc("在职位表未查询到信息");
            rutList.add(sendedRspBo);
        }
        return rutList;
    }

    @Override
    public List<QueryReceviedResumeRspBo> qryReceivedGeneralInfo(Long id) {
        LOG.info("公司用户id->关系表->简历id->已投递用户简历");
        //出参
        List<QueryReceviedResumeRspBo> retList = new ArrayList<>();
        //入参校验
        if (StringUtils.isEmpty(id)) {
            QueryReceviedResumeRspBo respBo = new QueryReceviedResumeRspBo();
            respBo.setRespCode(RspConstracts.RSP_CODE_FAIL);
            respBo.setRespDesc("入参校验失败：id不能为空");
            retList.add(respBo);
            return  retList;
        }
        //关系表入参
        RelGeneralJobCompanyReqBo relReqBo = new RelGeneralJobCompanyReqBo();
        relReqBo.setCompanyId(id.toString());
        //查询关系表
        RelGeneralJobCompanyListRspBo relRspList = relGeneralJobCompanyService.qyeryRelInfoList(relReqBo);
        //校验查询结果
        if (!relRspList.getRespCode().equals(SUCCESS) || CollectionUtils.isEmpty(relRspList.getRow())) {
            LOG.error("关系表中查询数据为空");
            QueryReceviedResumeRspBo respBo = new QueryReceviedResumeRspBo();
            respBo.setRespCode(RspConstracts.RSP_CODE_FAIL);
            respBo.setRespDesc("关系表中查询数据为空");
            retList.add(respBo);
            return retList;
        }
        //遍历关系表结果集合，查询简历信息
        List<RelGeneralJobCompanyRspBo> rows = relRspList.getRow();
        for (RelGeneralJobCompanyRspBo relBo : rows) {
            Long resumeId = Long.valueOf(relBo.getResumeId());
            ResumeRspBo resumeBo = resumeService.qryResumeInfoById(resumeId);
            if (resumeBo.getRespCode().equals(SUCCESS)) {
                QueryReceviedResumeRspBo rspBo = new QueryReceviedResumeRspBo();
                BeanUtils.copyProperties(resumeBo, rspBo);
                rspBo.setRelInfoId(relBo.getId());
                rspBo.setPostDate(relBo.getDate());
                rspBo.setIntentionJob(relBo.getPosition());
                retList.add(rspBo);
            }
        }
        if (CollectionUtils.isEmpty(retList)) {
            QueryReceviedResumeRspBo rspBo = new QueryReceviedResumeRspBo();
            rspBo.setRespCode(RspConstracts.RSP_CODE_FAIL);
            rspBo.setRespDesc("在简历表中未查询到数据");
            retList.add(rspBo);
        }
        return retList;
    }
}
