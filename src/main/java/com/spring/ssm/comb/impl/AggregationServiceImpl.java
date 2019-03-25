package com.spring.ssm.comb.impl;


import com.spring.ssm.Constracts.RspConstracts;
import com.spring.ssm.comb.AggregationService;
import com.spring.ssm.comb.bo.QurySendedRspBo;
import com.spring.ssm.service.JobInfoService;
import com.spring.ssm.service.RelGeneralJobCompanyService;
import com.spring.ssm.service.bo.JobInfoRspBo;
import com.spring.ssm.service.bo.RelGeneralJobCompanyReqBo;
import com.spring.ssm.service.bo.RelGeneralJobCompanyRspBo;
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

    private Logger LOG = LoggerFactory.getLogger(AggregationServiceImpl.class);

    @Override
    public List<QurySendedRspBo> qrySendedJobInfo(Long id) {
        LOG.info("用户id->关系表->职位id->职位信息");
        //出参list
        List<QurySendedRspBo> rutList = new ArrayList<>();
        //关系表入参
        RelGeneralJobCompanyReqBo relReqBo = new RelGeneralJobCompanyReqBo();

        if (StringUtils.isEmpty(id)) {
            QurySendedRspBo sendedRspBo = new QurySendedRspBo();
            sendedRspBo.setRespCode(RspConstracts.RSP_CODE_FAIL);
            sendedRspBo.setRespDesc("入参id不能为空");
            rutList.add(sendedRspBo);
            return rutList;
        }
        relReqBo.setGeneralId(id.toString());
        //查询关系表
        List<RelGeneralJobCompanyRspBo> relRspList = relGeneralJobCompanyService.queryRelInfoBySelective(relReqBo);

        //未查询到信息 返回提示
        if (CollectionUtils.isEmpty(relRspList)) {
            LOG.error("在关系表未查询到信息");
            QurySendedRspBo sendedRspBo = new QurySendedRspBo();
            sendedRspBo.setRespCode(RspConstracts.RSP_CODE_FAIL);
            sendedRspBo.setRespDesc("在关系表未查询到信息");
            rutList.add(sendedRspBo);
            return rutList;
        }
        //遍历获取到的关系信息集合，获取相关职位ID
        for (RelGeneralJobCompanyRspBo relRspBo : relRspList) {
            Long jobId = Long.valueOf(relRspBo.getJobId());
            //查询职位信息表
            JobInfoRspBo jobInfoRspBo = jobInfoService.queryJobInfoById(jobId);
            if (jobInfoRspBo != null) {
                QurySendedRspBo sendedRspBo = new QurySendedRspBo();
                BeanUtils.copyProperties(jobInfoRspBo, sendedRspBo);
                sendedRspBo.setFlag(relRspBo.getFlag());
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
}
