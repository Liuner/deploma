package com.spring.ssm.service.impl;

import com.spring.ssm.Constracts.ExceptionConstract;
import com.spring.ssm.Constracts.RspConstracts;
import com.spring.ssm.Tool.BusiExcption;
import com.spring.ssm.dto.RelGeneralJobCompanyPo;
import com.spring.ssm.mapper.RelGeneralJobCompanyMapper;
import com.spring.ssm.service.RelGeneralJobCompanyService;
import com.spring.ssm.service.bo.RelGeneralJobCompanyReqBo;
import com.spring.ssm.service.bo.RelGeneralJobCompanyRspBo;
import org.joda.time.DateTime;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @ClassName: RelGeneralJobCompanyServiceImpl
 * @Description：普通用户 职位 公司 关系表 实现类
 * @Author: liuguisheng
 * @Date: 2019/3/23 13:11:36
 * @Copyright:2019 www.tydic.com Inc. All rights reserved.
 * 注意：本内容仅限于北京天源迪科信息技术有限公司内部传阅，禁止外泄以及用于其他商业目的
 */
@Service("relGeneralJobCompanyService")
public class RelGeneralJobCompanyServiceImpl implements RelGeneralJobCompanyService {

    @Autowired
    private RelGeneralJobCompanyMapper relGeneralJobCompanyMapper;

    private Logger LOG = LoggerFactory.getLogger(RelGeneralJobCompanyServiceImpl.class);

    @Override
    public RelGeneralJobCompanyRspBo createRelInfo(RelGeneralJobCompanyReqBo reqBo) {
        return null;
    }

    @Override
    public RelGeneralJobCompanyRspBo deleteRelInfo(RelGeneralJobCompanyReqBo reqBo) {
        return null;
    }

    @Override
    public RelGeneralJobCompanyRspBo updateRelInfo(RelGeneralJobCompanyReqBo reqBo) {
        return null;
    }

    @Override
    public RelGeneralJobCompanyRspBo queryRelInfoById(RelGeneralJobCompanyReqBo reqBo) {
        return null;
    }

    @Override
    public List<RelGeneralJobCompanyRspBo> queryRelInfoBySelective(RelGeneralJobCompanyReqBo reqBo) {
        LOG.info("进入职位关系表查询服务");
        List<RelGeneralJobCompanyRspBo> retList = new ArrayList<>();
        RelGeneralJobCompanyPo po = new RelGeneralJobCompanyPo();

        //自定义值传递方法
        String massage = valueTrans(reqBo, po);
        if (!StringUtils.isEmpty(massage)) {
            RelGeneralJobCompanyRspBo retBo = new RelGeneralJobCompanyRspBo();
            retBo.setRespCode(RspConstracts.RSP_CODE_FAIL);
            retBo.setRespDesc(massage);
            retList.add(retBo);
            return retList;
        }
        // 调用mapper
        List<RelGeneralJobCompanyPo> poList;
        try {
            poList = relGeneralJobCompanyMapper.queryRelInfoBySelective(po);
        } catch (Exception e) {
            LOG.error("调用mapper异常" + e);
            throw new BusiExcption(ExceptionConstract.REL_INFO_EXCEPTION, "调用mapper异常" + e);
        }
        if (!CollectionUtils.isEmpty(poList)) {
            for (RelGeneralJobCompanyPo relPo : poList) {
                RelGeneralJobCompanyRspBo retBo = new RelGeneralJobCompanyRspBo();
                BeanUtils.copyProperties(relPo, retBo);
                retBo.setId(relPo.getId()+"");
                retBo.setGeneralId(relPo.getGeneralId()+"");
                retBo.setCompanyId(relPo.getCompanyId()+"");
                retBo.setResumeId(relPo.getResumeId()+"");
                retBo.setJobId(relPo.getJobId()+"");
                retBo.setDate(new DateTime(relPo.getDate()).toString("yyyyMMdd"));
                retBo.setRespCode(RspConstracts.RSP_CODE_SUCCESS);
                retBo.setRespDesc(RspConstracts.RSP_DESC_SUCCESS);
                retList.add(retBo);
            }
        } else{
            RelGeneralJobCompanyRspBo retBo = new RelGeneralJobCompanyRspBo();
            retBo.setRespCode(RspConstracts.RSP_CODE_FAIL);
            retBo.setRespDesc("未查询到相匹配的信息");
            retList.add(retBo);
        }
        return retList;
    }

    /**
     * 描述: 自定义值传递方法
     * @param: [reqBo, po]
     * @return: void
     * @author: liuguisheng
     * @date:   2019/3/23 13:21:13
     */
    private String valueTrans(RelGeneralJobCompanyReqBo reqBo, RelGeneralJobCompanyPo po) {
        BeanUtils.copyProperties(reqBo, po);
        if (!StringUtils.isEmpty(reqBo.getId())) {
            try {
                po.setId(Long.valueOf(reqBo.getId()));
            } catch (NumberFormatException e) {
                return "编号ID只能为纯数字";
            }
        }
        if (!StringUtils.isEmpty(reqBo.getGeneralId())) {
            try {
                po.setGeneralId(Long.valueOf(reqBo.getGeneralId()));
            } catch (NumberFormatException e) {
                return "求职者ID只能为纯数字";
            }
        }
        if (!StringUtils.isEmpty(reqBo.getCompanyId())) {
            try {
                po.setCompanyId(Long.valueOf(reqBo.getCompanyId()));
            } catch (NumberFormatException e) {
                return "公司ID只能为纯数字";
            }
        }
        if (!StringUtils.isEmpty(reqBo.getJobId())) {
            try {
                po.setJobId(Long.valueOf(reqBo.getJobId()));
            } catch (NumberFormatException e) {
                return "职位ID只能为纯数字";
            }
        }
        if (!StringUtils.isEmpty(reqBo.getDate())) {
            DateFormat fmt = new SimpleDateFormat("yyyyMMdd");
            try {
                Date date = fmt.parse(reqBo.getDate());
            } catch (ParseException e) {
                return "时间格式错误";
            }
        }
        if (!StringUtils.isEmpty(reqBo.getResumeId())) {
            try {
                po.setResumeId(Long.valueOf(reqBo.getResumeId()));
            } catch (NumberFormatException e) {
                return "简历ID只能为纯数字";
            }
        }
        return null;
    }
}
