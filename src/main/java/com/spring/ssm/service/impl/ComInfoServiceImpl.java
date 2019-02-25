package com.spring.ssm.service.impl;

import com.spring.ssm.Constracts.RspConstracts;
import com.spring.ssm.dto.CompanyInfoPo;
import com.spring.ssm.mapper.CompanyInfoMapper;
import com.spring.ssm.service.Bo.CompanyInfoReqBo;
import com.spring.ssm.service.Bo.CompanyInfoRspBo;
import com.spring.ssm.service.ComInfoService;
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
 * @ClassName: ComInfoServiceImpl
 * @Description：公司用户信息服务 实现
 * @Author: liuguisheng
 * @Date: 2019/2/7 21:30:11
 * @Copyright:2019 www.tydic.com Inc. All rights reserved.
 * 注意：本内容仅限于北京天源迪科信息技术有限公司内部传阅，禁止外泄以及用于其他商业目的
 */
@Service("comInfoService")
public class ComInfoServiceImpl implements ComInfoService {

    private Logger LOG = LoggerFactory.getLogger(ComInfoServiceImpl.class);

    @Autowired
    private CompanyInfoMapper companyInfoMapper;

    @Override
    public CompanyInfoRspBo createComInfo(CompanyInfoReqBo reqBo) {
        LOG.info("添加公司用户信息");
        CompanyInfoRspBo retBo = new CompanyInfoRspBo();

        String validataArgStr = validataArg(reqBo);
        if (!StringUtils.isEmpty(validataArgStr)) {
            LOG.error("入参校验失败：" + validataArgStr);
            retBo.setRespCode(RspConstracts.RSP_CODE_FAIL);
            retBo.setRespDesc(validataArgStr);
            return retBo;
        }
        CompanyInfoPo companyInfoPo = new CompanyInfoPo();
        BeanUtils.copyProperties(reqBo, companyInfoPo);
        DateFormat fmt = new SimpleDateFormat("yyyyMMdd");
        Date date = null;
        try {
            date = fmt.parse(reqBo.getDate());
        } catch (ParseException e) {
            e.printStackTrace();
        }
        companyInfoPo.setDate(date);
        int result = 0;
        try {
            result = companyInfoMapper.createComInfo(companyInfoPo);
        } catch (Exception e) {
            LOG.error("调用mapper添加信息失败：" + e);
        }
        if (result == 0) {
            LOG.error("添加信息失败");
            retBo.setRespCode(RspConstracts.RSP_CODE_FAIL);
            retBo.setRespDesc(RspConstracts.RSP_DESC_FAIL);
            return retBo;
        }
        retBo.setRespCode(RspConstracts.RSP_CODE_SUCCESS);
        retBo.setRespDesc(RspConstracts.RSP_DESC_SUCCESS);
        return retBo;
    }

    @Override
    public CompanyInfoRspBo selectComInfoById(Long id) {
        LOG.info("查询公司用户信息");
        CompanyInfoRspBo retBo = new CompanyInfoRspBo();
        if (StringUtils.isEmpty(id)) {
            LOG.error("id不能为空");
            retBo.setRespCode(RspConstracts.RSP_CODE_FAIL);
            retBo.setRespDesc("id不能为空");
            return retBo;
        }
        CompanyInfoPo companyInfoPo = null;
        try {
            companyInfoPo = companyInfoMapper.selectComInfoById(id);
        } catch (Exception e) {
            LOG.error("调用mapper查询信息失败");
        }
        if (companyInfoPo == null) {
            LOG.error("调用mapper查询返回为空");
            retBo.setRespCode(RspConstracts.RSP_CODE_FAIL);
            retBo.setRespDesc(RspConstracts.RSP_DESC_FAIL);
            return retBo;
        }
        BeanUtils.copyProperties(companyInfoPo, retBo);
        retBo.setRespCode(RspConstracts.RSP_CODE_SUCCESS);
        retBo.setRespDesc(RspConstracts.RSP_DESC_SUCCESS);
        return retBo;
    }

    @Override
    public List<CompanyInfoRspBo> selectComInfo() {
        LOG.info("进入selectComInfo服务");
        List<CompanyInfoRspBo> companyInfoRspBoList = new ArrayList<>();
        List<CompanyInfoPo> companyInfoPoList = companyInfoMapper.selectAllComInfo();

        if (!CollectionUtils.isEmpty(companyInfoPoList)) {
            for (CompanyInfoPo companyInfoPo : companyInfoPoList) {
                CompanyInfoRspBo bo = new CompanyInfoRspBo();
                BeanUtils.copyProperties(companyInfoPo, bo);
                companyInfoRspBoList.add(bo);
            }
        }
        return companyInfoRspBoList;
    }
    @Override
    public CompanyInfoRspBo updateComInfoById(CompanyInfoReqBo reqBo) {
        LOG.info("进入updateComInfo服务");
        CompanyInfoRspBo retBo = new CompanyInfoRspBo();
        if (StringUtils.isEmpty(reqBo.getId())) {
            LOG.error("入参对象属性id不能为空");
            retBo.setRespDesc("入参对象属性id不能为空");
            retBo.setRespCode(RspConstracts.RSP_CODE_FAIL);
            return retBo;
        }

        CompanyInfoPo companyInfoPo = new CompanyInfoPo();
        BeanUtils.copyProperties(reqBo ,companyInfoPo);
        int result = 0;
        try {
            result = companyInfoMapper.updateComInfoById(companyInfoPo);
        } catch (Exception e) {
            LOG.error("调用mapper更新数据异常:" + e);
        }
        if (result == 0) {
            LOG.error("更新数据失败");
            retBo.setRespCode(RspConstracts.RSP_CODE_FAIL);
            retBo.setRespDesc(RspConstracts.RSP_DESC_FAIL);
            return  retBo;
        }
        retBo.setRespCode(RspConstracts.RSP_CODE_SUCCESS);
        retBo.setRespDesc(RspConstracts.RSP_DESC_SUCCESS);
        return retBo;
    }
    @Override
    public CompanyInfoRspBo deleteComInfo(Long id) {
        LOG.info("进入delectComInfo服务");
        CompanyInfoRspBo retBo = new CompanyInfoRspBo();
        if (StringUtils.isEmpty(id)) {
            LOG.error("入参id不能为空");
            retBo.setRespCode(RspConstracts.RSP_CODE_FAIL);
            retBo.setRespDesc(RspConstracts.RSP_DESC_FAIL);
            return retBo;
        }
        int result = 0;
        try {
            result = companyInfoMapper.deleteComInfoById(id);
        } catch (Exception e) {
            LOG.error("调用mapper删除数据异常：" + e);
        }
        if (result == 0) {
            LOG.error("删除数据失败");
            retBo.setRespCode(RspConstracts.RSP_CODE_FAIL);
            retBo.setRespDesc(RspConstracts.RSP_DESC_FAIL);
            return retBo;
        }
        retBo.setRespDesc(RspConstracts.RSP_DESC_SUCCESS);
        retBo.setRespCode(RspConstracts.RSP_CODE_SUCCESS);
        return retBo;
    }

    /**
     * 描述: 添加 入参校验
     * @param: [CompanyInfoReqBo reqBo]
     * @return: java.lang.String
     * @throws
     * @author: liuguisheng
     * @date:   2019/2/7 21:37:29
     */
    private String validataArg(CompanyInfoReqBo reqBo) {
        if (reqBo == null) {
            return "入参对象不能为空";
        }
        if (StringUtils.isEmpty(reqBo.getName())) {
            return "入参对象属性name不能为空";
        }
        if (StringUtils.isEmpty(reqBo.getCity()))
        {
            return "入参对象属性city不能为空";
        }
        if (StringUtils.isEmpty(reqBo.getDate())) {
            return "入参对象属性date不能为空";
        }
        if (StringUtils.isEmpty(reqBo.getE_maile())) {
            return "入参对象属性e_maile不能为空";
        }
        if (StringUtils.isEmpty(reqBo.getNumber())) {
            return "入参对象属性number不能为空";
        }
        if (StringUtils.isEmpty(reqBo.getPassword())) {
            return "入参对象属性password不能为空";
        }
        return null;
    }
}
