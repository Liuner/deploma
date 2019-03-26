package com.spring.ssm.service.impl;

import com.spring.ssm.Constracts.ExceptionConstract;
import com.spring.ssm.Constracts.RspConstracts;
import com.spring.ssm.Tool.BusiExcption;
import com.spring.ssm.dto.RelGeneralJobCompanyPo;
import com.spring.ssm.mapper.RelGeneralJobCompanyMapper;
import com.spring.ssm.service.RelGeneralJobCompanyService;
import com.spring.ssm.service.bo.RelGeneralJobCompanyListRspBo;
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
        LOG.info("进入职位关系表新增服务");
        RelGeneralJobCompanyRspBo retBo = new RelGeneralJobCompanyRspBo();
        //入参校验
        String validataStr = validataCreate(reqBo);
        if (!StringUtils.isEmpty(validataStr)) {
            retBo.setRespCode(RspConstracts.RSP_CODE_FAIL);
            retBo.setRespDesc("入参校验失败：" + validataStr);
            return retBo;
        }
        RelGeneralJobCompanyPo po = new RelGeneralJobCompanyPo();
        this.valueTrans(reqBo, po);
        //flag 默认为0 ， 0 未读  1 已读 2 邀请面试
        po.setFlag("0");

        //date 为系统当前时间
        DateFormat dfm = new SimpleDateFormat("yyyyMMdd");
        try {
            po.setDate(dfm.parse(dfm.format(new Date())));
        } catch (ParseException e) {
            LOG.error("设置默认时间异常：" + e);
            throw new BusiExcption(ExceptionConstract.REL_INFO_EXCEPTION, "设置默认时间异常：" + e);
        }
        //调用mapper
        int result;
        try {
            result = relGeneralJobCompanyMapper.createRelInfo(po);
        } catch (Exception e) {
            LOG.error("调用mapper异常：" + e);
            throw new BusiExcption(ExceptionConstract.REL_INFO_EXCEPTION, "调用mapper异常：" + e);
        }
        if (result > 0) {
            retBo.setRespCode(RspConstracts.RSP_CODE_SUCCESS);
            retBo.setRespDesc(RspConstracts.RSP_DESC_SUCCESS);
        } else {
            LOG.error("调用mapper添加数据失败");
            retBo.setRespCode(RspConstracts.RSP_CODE_FAIL);
            retBo.setRespDesc("调用mapper添加数据失败");
        }
        return retBo;
    }

    @Override
    public RelGeneralJobCompanyRspBo deleteRelInfoById(Long id) {
        LOG.info("进入职位关系表删除服务");
        RelGeneralJobCompanyRspBo retBo = new RelGeneralJobCompanyRspBo();

        if (StringUtils.isEmpty(id)) {
            retBo.setRespCode(RspConstracts.RSP_CODE_FAIL);
            retBo.setRespDesc("入参校验失败：id不能为空");
            return retBo;
        }
        int result;
        try {
            result = relGeneralJobCompanyMapper.deleteRelInfo(id);
        } catch (Exception e) {
            LOG.error("调用mapper删除异常：" + e);
            throw new BusiExcption(ExceptionConstract.REL_INFO_EXCEPTION, "调用mapper删除异常：" + e);
        }
        if (result > 1) {
            retBo.setRespCode(RspConstracts.RSP_CODE_SUCCESS);
            retBo.setRespDesc(RspConstracts.RSP_DESC_SUCCESS);
        } else {
            retBo.setRespCode(RspConstracts.RSP_CODE_FAIL);
            retBo.setRespDesc(RspConstracts.RSP_DESC_FAIL);
        }
        return retBo;
    }

    @Override
    public RelGeneralJobCompanyRspBo updateRelInfo(RelGeneralJobCompanyReqBo reqBo) {
        LOG.info("进入职位关系表更新服务");
        RelGeneralJobCompanyRspBo retBo = new RelGeneralJobCompanyRspBo();
        //入参校验
        if (StringUtils.isEmpty(reqBo.getId())) {
            retBo.setRespCode(RspConstracts.RSP_CODE_FAIL);
            retBo.setRespDesc("入参校验失败：id不能为空" );
            return retBo;
        }
        RelGeneralJobCompanyPo po = new RelGeneralJobCompanyPo();
        this.valueTrans(reqBo, po);

        int result;
        try {
            result = relGeneralJobCompanyMapper.updateRelInfo(po);
        } catch (Exception e) {
            LOG.error("调用mapper更新数据异常：" + e);
            throw new BusiExcption(ExceptionConstract.REL_INFO_EXCEPTION, "调用mapper更新数据异常：" + e);
        }

        if (result > 0) {
            retBo.setRespCode(RspConstracts.RSP_CODE_SUCCESS);
            retBo.setRespDesc(RspConstracts.RSP_DESC_SUCCESS);
        } else {
            retBo.setRespCode(RspConstracts.RSP_CODE_FAIL);
            retBo.setRespDesc("更新数据失败！！！");
        }
        return retBo;
    }

    @Override
    public RelGeneralJobCompanyRspBo queryRelInfoById(RelGeneralJobCompanyReqBo reqBo) {
        return null;
    }

    @Override
    public RelGeneralJobCompanyListRspBo qyeryRelInfoList(RelGeneralJobCompanyReqBo reqBo) {
        LOG.info("进入职位关系表 列表查询服务");
        RelGeneralJobCompanyListRspBo retBo = new RelGeneralJobCompanyListRspBo();

        List<RelGeneralJobCompanyRspBo> retList = new ArrayList<>();
        RelGeneralJobCompanyPo po = new RelGeneralJobCompanyPo();

        //自定义值传递方法
        String massage = valueTrans(reqBo, po);
        if (!StringUtils.isEmpty(massage)) {
            retBo.setRespCode(RspConstracts.RSP_CODE_FAIL);
            retBo.setRespDesc(massage);
            return retBo;
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
                RelGeneralJobCompanyRspBo bo = new RelGeneralJobCompanyRspBo();
                BeanUtils.copyProperties(relPo, bo);
                bo.setId(relPo.getId()+"");
                bo.setGeneralId(relPo.getGeneralId()+"");
                bo.setCompanyId(relPo.getCompanyId()+"");
                bo.setResumeId(relPo.getResumeId()+"");
                bo.setJobId(relPo.getJobId()+"");
                bo.setDate(new DateTime(relPo.getDate()).toString("yyyyMMdd"));
                bo.setFlag(relPo.getFlag());
                bo.setRespCode(RspConstracts.RSP_CODE_SUCCESS);
                bo.setRespDesc(RspConstracts.RSP_DESC_SUCCESS);
                retList.add(bo);
            }
            retBo.setRow(retList);
            retBo.setRespCode(RspConstracts.RSP_CODE_SUCCESS);
            retBo.setRespDesc(RspConstracts.RSP_DESC_SUCCESS);
        } else{
            retBo.setRespCode(RspConstracts.RSP_CODE_FAIL);
            retBo.setRespDesc("未查询到相匹配的信息");
        }
        return retBo;
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
                po.setDate(fmt.parse(reqBo.getDate()));
            } catch (ParseException e) {
                return "时间格式错误，正确格式：yyyyMMdd";
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

    /**
     * 描述: 新增 入参校验
     * @param: [reqBo]
     * @return: java.lang.String
     * @author: liuguisheng
     * @date:   2019/3/25 9:03:34
     */
    private String validataCreate(RelGeneralJobCompanyReqBo reqBo) {
        if (reqBo == null) {
            return "入参对象不能为空！";
        }
        if (StringUtils.isEmpty(reqBo.getGeneralId())) {
            return "普通用户ID不能为空";
        }
        if (StringUtils.isEmpty(reqBo.getCompanyId())) {
            return "公司用户ID不能为空";
        }
        if (StringUtils.isEmpty(reqBo.getJobId())) {
            return "职位ID不能为空";
        }
        if (StringUtils.isEmpty(reqBo.getResumeId())) {
            return "简历ID不能为空";
        }
        if (StringUtils.isEmpty(reqBo.getPosition())) {
            return "职位描述不能为空";
        }
        /**
         * date 取当前系统时间， flag 默认为0， id 自动生成
         */
        return null;
    }
}
