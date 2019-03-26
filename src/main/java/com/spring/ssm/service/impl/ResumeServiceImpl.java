package com.spring.ssm.service.impl;

import com.spring.ssm.Constracts.ExceptionConstract;
import com.spring.ssm.Constracts.RspConstracts;
import com.spring.ssm.Tool.BusiExcption;
import com.spring.ssm.dto.ResumePo;
import com.spring.ssm.mapper.ResumeMapper;
import com.spring.ssm.service.ResumeService;
import com.spring.ssm.service.bo.ResumeListRspBo;
import com.spring.ssm.service.bo.ResumeReqBo;
import com.spring.ssm.service.bo.ResumeRspBo;
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
 * @ClassName: ResumeServiceImpl
 * @Description：简历信息表服务 实现类(这里用一句话描述这个类的作用)
 * @Author: liuguisheng
 * @Date: 2019/3/25 16:36:07
 * @Copyright:2019 www.tydic.com Inc. All rights reserved.
 * 注意：本内容仅限于北京天源迪科信息技术有限公司内部传阅，禁止外泄以及用于其他商业目的
 */
@Service("resumeService")
public class ResumeServiceImpl implements ResumeService {

    @Autowired
    private ResumeMapper resumeMapper;

    private Logger LOG = LoggerFactory.getLogger(ResumeServiceImpl.class);

    @Override
    public ResumeRspBo createResumeInfo(ResumeReqBo reqBo) {
        return null;
    }

    @Override
    public ResumeRspBo deleteResumeInfo(ResumeReqBo reqBo) {
        return null;
    }

    @Override
    public ResumeRspBo updateResumeInfo(ResumeReqBo reqBo) {
        return null;
    }

    @Override
    public ResumeListRspBo qryResumeInfo(ResumeReqBo reqBo) {
        LOG.info("进入简历信息查询服务");
        ResumeListRspBo retBo = new ResumeListRspBo();
        ResumePo reqpo = new ResumePo();
        //入参校验
        String validataStr = validaetaArg(reqBo, reqpo);
        if (!StringUtils.isEmpty(validataStr)) {
            retBo.setRespCode(RspConstracts.RSP_CODE_FAIL);
            retBo.setRespDesc(validataStr);
            return  retBo;
        }

        List<ResumePo> poList ;
        try {
            poList = resumeMapper.qryResumeInfo(reqpo);
        } catch (Exception e) {
            LOG.error("调用mapper查询异常：" + e);
            throw new BusiExcption(ExceptionConstract.RESUME_EXCEPTION, "调用mapper查询异常：" + e);
        }
        if (CollectionUtils.isEmpty(poList)) {
            retBo.setRespCode(RspConstracts.RSP_CODE_FAIL);
            retBo.setRespDesc("未查询到相匹配的数据");
            return retBo;
        }
        List<ResumeRspBo> rspList = new ArrayList<>();
        for (ResumePo po : poList) {
            ResumeRspBo bo = new ResumeRspBo();
            BeanUtils.copyProperties(po, bo);
            bo.setId(po.getId()+"");
            bo.setAge(po.getAge()+"");
            bo.setGeneralId(po.getGeneralId()+"");
            bo.setRespCode(RspConstracts.RSP_CODE_SUCCESS);
            bo.setRespDesc(RspConstracts.RSP_DESC_SUCCESS);
            rspList.add(bo);
        }
        retBo.setRespCode(RspConstracts.RSP_CODE_SUCCESS);
        retBo.setRespDesc(RspConstracts.RSP_DESC_SUCCESS);
        retBo.setRows(rspList);
        return retBo;
    }

    @Override
    public ResumeRspBo qryResumeInfoById(Long id) {
        LOG.info("qryResumeInfoById");
        ResumeRspBo retBo = new ResumeRspBo();

        if (StringUtils.isEmpty(id)) {
            retBo.setRespCode(RspConstracts.RSP_CODE_FAIL);
            retBo.setRespDesc("入参校验失败：id不能为空");
            return retBo;
        }

        ResumePo po;
        try {
            po = resumeMapper.qryResumeInfoById(id);
        } catch (Exception e) {
            LOG.info("调用mapper查询信息异常：" + e);
            throw new BusiExcption(ExceptionConstract.RESUME_EXCEPTION, "调用mapper查询信息异常：" + e);
        }
        if (po == null) {
            retBo.setRespCode(RspConstracts.RSP_CODE_FAIL);
            retBo.setRespDesc("未查询到相匹配的数据");
            return retBo;
        }
        BeanUtils.copyProperties(po, retBo);
        retBo.setGeneralId(po.getGeneralId()+"");
        retBo.setAge(po.getAge()+"");
        retBo.setRespCode(RspConstracts.RSP_CODE_SUCCESS);
        retBo.setRespDesc(RspConstracts.RSP_DESC_SUCCESS);
        return retBo;
    }

    /**
     * 描述: 入参校验 + 值传递
     * @param: [ResumeReqBo reqBo]
     * @return: java.lang.String
     * @throws
     * @author: liuguisheng
     * @date:   2019/3/25 17:31:02
     */
    private String validaetaArg(ResumeReqBo reqBo, ResumePo po) {
        if (reqBo == null) {
            return "入参对象不能为空";
        }
        if (StringUtils.isEmpty(reqBo.getId()) && StringUtils.isEmpty(reqBo.getGeneralId())) {
            return "请输入id";
        }
        if (!StringUtils.isEmpty(reqBo.getId())) {
            try {
                po.setId(Long.valueOf(reqBo.getId()));
            } catch (NumberFormatException e) {
                return "id必须为纯数字";
            }
        }
        if (!StringUtils.isEmpty(reqBo.getGeneralId())) {
            try {
                po.setGeneralId(Long.valueOf(reqBo.getGeneralId()));
            } catch (NumberFormatException e) {
                return "id必须为纯数字";
            }
        }
        return null;
    }
}
