package com.spring.ssm.service.impl;


import com.spring.ssm.Constracts.ExceptionConstract;
import com.spring.ssm.Constracts.RspConstracts;
import com.spring.ssm.Tool.BusiExcption;
import com.spring.ssm.dto.AdminInfoPo;
import com.spring.ssm.mapper.AdminInfoMapper;
import com.spring.ssm.service.AdminInfoService;
import com.spring.ssm.service.bo.AdminInfoReqBo;
import com.spring.ssm.service.bo.AdminInfoRspBo;
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
 * @ClassName: AdminInfoServiceImpl
 * @Description：管理员信息表服务 实现类
 * @Author: liuguisheng
 * @Date: 2019/2/11 19:17:46
 * @Copyright:2019 www.tydic.com Inc. All rights reserved.
 * 注意：本内容仅限于北京天源迪科信息技术有限公司内部传阅，禁止外泄以及用于其他商业目的
 */
@Service("adminInfoService")
public class AdminInfoServiceImpl implements AdminInfoService {
    private Logger LOG = LoggerFactory.getLogger(AdminInfoServiceImpl.class);

    @Autowired
    private AdminInfoMapper adminInfoMapper;

    @Override
    public AdminInfoRspBo createAdminInfo(AdminInfoReqBo reqBo) {
        LOG.info("进入管理员添加服务");
        AdminInfoRspBo retBo = new AdminInfoRspBo();

        String valitdataArgStr = validataArg(reqBo);
        if (!StringUtils.isEmpty(valitdataArgStr)) {
            LOG.error("入参校验失败：" + valitdataArgStr);
            retBo.setRespCode(RspConstracts.RSP_CODE_FAIL);
            retBo.setRespDesc("入参校验失败：" + valitdataArgStr);
            return retBo;
        }

        AdminInfoPo adminInfoPo = new AdminInfoPo();
        BeanUtils.copyProperties(reqBo, adminInfoPo);
        int result = 0;
        try {
            result = adminInfoMapper.createAdminInfo(adminInfoPo);
        } catch (Exception e) {
            LOG.error("调用mapper添加数据异常：" + e);
        }
        if (result == 0) {
            LOG.error("添加信息失败");
            retBo.setRespCode(RspConstracts.RSP_CODE_FAIL);
            retBo.setRespDesc(RspConstracts.RSP_DESC_FAIL);
            return retBo;
        }
        retBo.setId(adminInfoPo.getId()+ "");
        retBo.setRespCode(RspConstracts.RSP_CODE_SUCCESS);
        retBo.setRespDesc(RspConstracts.RSP_DESC_SUCCESS);
        return  retBo;
    }

    @Override
    public AdminInfoRspBo queryAdminInfoById(Long id) {
        LOG.info("进入根据Id查询管理员信息服务");
        LOG.info("id=" + id);
        AdminInfoRspBo retBo = new AdminInfoRspBo();
        if (StringUtils.isEmpty(id)) {
            LOG.error("id不能为空");
            retBo.setRespCode(RspConstracts.RSP_CODE_FAIL);
            retBo.setRespDesc("id不能为空");
            return retBo;
        }
        AdminInfoPo adminInfoPo = null;
        try {
            adminInfoPo = adminInfoMapper.selectAdminInfoById(id);
        } catch (Exception e) {
            LOG.error("调用mapper根据查询管理员信息失败：" + e);
        }
        if (adminInfoPo == null) {
            LOG.error("调用mapper查询返回的结果为空");
            retBo.setRespCode(RspConstracts.RSP_CODE_FAIL);
            retBo.setRespDesc(RspConstracts.RSP_DESC_FAIL);
            return retBo;
        }
        BeanUtils.copyProperties(adminInfoPo, retBo);
        retBo.setId(adminInfoPo.getId()+"");
        retBo.setPassword(adminInfoPo.getPassword());
        retBo.setRespCode(RspConstracts.RSP_CODE_SUCCESS);
        retBo.setRespDesc(RspConstracts.RSP_DESC_SUCCESS);
        return retBo;
    }

    @Override
    public List<AdminInfoRspBo> queryAdminInfoBySelective(AdminInfoReqBo reqBo) {
        LOG.info("进入查询管理员信息服务");
        List<AdminInfoRspBo> adminInfoRspBoList = new ArrayList<>();
        List<AdminInfoPo> adminInfoPoList = new ArrayList<>();
        AdminInfoPo po = new AdminInfoPo();
        BeanUtils.copyProperties(reqBo, po);
        if (!StringUtils.isEmpty(reqBo.getId())) {
            po.setId(Long.valueOf(reqBo.getId()));
        }
        try {
            adminInfoPoList = adminInfoMapper.selectAdminInfoBySelective(po);
        } catch (Exception e) {
            LOG.error("调用mapper查询所有管理员信息异常：" + e);
        }
        if (!CollectionUtils.isEmpty(adminInfoPoList)) {
            for (AdminInfoPo adminInfoPo : adminInfoPoList) {
                AdminInfoRspBo bo = new AdminInfoRspBo();
                BeanUtils.copyProperties(adminInfoPo, bo);
                bo.setId(adminInfoPo.getId()+"");
                bo.setPassword(adminInfoPo.getPassword());
                bo.setRespCode(RspConstracts.RSP_CODE_SUCCESS);
                bo.setRespDesc(RspConstracts.RSP_DESC_SUCCESS);
                adminInfoRspBoList.add(bo);
            }
        }
        else {
            AdminInfoRspBo bo = new AdminInfoRspBo();
            bo.setRespCode(RspConstracts.RSP_CODE_FAIL);
            bo.setRespDesc("未查询到匹配信息");
            adminInfoRspBoList.add(bo);
        }
        return adminInfoRspBoList;
    }

    @Override
    public AdminInfoRspBo updateAdminInfo(AdminInfoReqBo reqBo) {
        LOG.info("进入跟新管理员信息服务");
        AdminInfoRspBo retBo = new AdminInfoRspBo();
        AdminInfoPo adminInfoPo = new AdminInfoPo();
        if (StringUtils.isEmpty(reqBo.getId())) {
            LOG.error("id不能为空");
            retBo.setRespCode(RspConstracts.RSP_CODE_FAIL);
            retBo.setRespDesc(RspConstracts.RSP_DESC_FAIL);
            return  retBo;
        }
        String validataStr = validataArg(reqBo);
        if (!StringUtils.isEmpty(validataStr)) {
            LOG.error("入参校验失败");
            retBo.setRespCode(RspConstracts.RSP_CODE_FAIL);
            retBo.setRespDesc(validataStr);
            return retBo;
        }
        BeanUtils.copyProperties(reqBo, adminInfoPo);
        adminInfoPo.setId(Long.valueOf(reqBo.getId()));
        int result = 0;
        try {
            result = adminInfoMapper.updateAdminInfo(adminInfoPo);
        } catch (Exception e) {
            LOG.error("调用mapper更新管理员信息异常：" + e);
        }
        if (result == 0) {
            LOG.error("更新管理员信息失败");
            retBo.setRespCode(RspConstracts.RSP_CODE_FAIL);
            retBo.setRespDesc(RspConstracts.RSP_DESC_FAIL);
            return retBo;
        }
        retBo.setRespCode(RspConstracts.RSP_CODE_SUCCESS);
        retBo.setRespDesc(RspConstracts.RSP_DESC_SUCCESS);
        return retBo;
    }

    @Override
    public AdminInfoRspBo deleteAdminInfo(Long id) {
        LOG.info("进入根据id删除管理员信息服务");
        AdminInfoRspBo retBo = new AdminInfoRspBo();
        if (StringUtils.isEmpty(id)) {
            LOG.error("id不能为空");
            retBo.setRespCode(RspConstracts.RSP_CODE_FAIL);
            retBo.setRespDesc(RspConstracts.RSP_DESC_FAIL);
            return  retBo;
        }
        int result = 0;
        try {
            result = adminInfoMapper.deleteAdminInfoById(id);
        } catch (Exception e) {
            LOG.error("调用mapper删除管理员信息异常：" + e);
        }
        if (result == 0) {
            LOG.error("删除管理员信息失败");
            retBo.setRespCode(RspConstracts.RSP_CODE_FAIL);
            retBo.setRespDesc(RspConstracts.RSP_DESC_FAIL);
            return  retBo;
        }
        retBo.setRespCode(RspConstracts.RSP_CODE_SUCCESS);
        retBo.setRespDesc(RspConstracts.RSP_DESC_SUCCESS);
        return retBo;
    }

    @Override
    public AdminInfoRspBo queryAdminInfo(AdminInfoReqBo reqBo) {
        LOG.info("管理员登录查询服务");
        AdminInfoRspBo retBo = new AdminInfoRspBo();
        AdminInfoPo adminInfoPo = new AdminInfoPo();
        String validataStr = validataQry(reqBo);
        if (!StringUtils.isEmpty(validataStr)) {
            retBo.setRespCode(RspConstracts.RSP_CODE_FAIL);
            retBo.setRespDesc(validataStr);
            return retBo;
        }
        BeanUtils.copyProperties(reqBo, adminInfoPo);
        adminInfoPo.setId(Long.valueOf(reqBo.getId()));
        try {
            adminInfoPo = adminInfoMapper.selectAdminInfo(adminInfoPo);
        } catch (Exception e) {
            LOG.error("调用mapper查询数据异常" + e);
            throw new BusiExcption(ExceptionConstract.ADMIN_EXCEPTION, "调用mapper查询数据异常" + e);
        }
        if (adminInfoPo == null) {
            retBo.setRespCode(RspConstracts.RSP_CODE_FAIL);
            retBo.setRespDesc("用户名或密码错误");
            return retBo;
        }
        retBo.setId(adminInfoPo.getId()+"");
        retBo.setName(adminInfoPo.getName());
        retBo.setRespCode(RspConstracts.RSP_CODE_SUCCESS);
        retBo.setRespDesc(RspConstracts.RSP_DESC_SUCCESS);
        return retBo;
    }

    /**
     * 描述: 入参校验
     * @param: [reqBo]
     * @return: java.lang.String
     * @throws
     * @author: liuguisheng
     * @date:   2019/2/11 19:22:54
     */
    private String validataArg(AdminInfoReqBo reqBo) {
        if (reqBo == null) {
            return "入参对象不能为空";
        }
        if (StringUtils.isEmpty(reqBo.getName())) {
            return "name不能为空";
        }
        if (StringUtils.isEmpty(reqBo.getAge())) {
            return "age不能为空";
        }
        if (StringUtils.isEmpty(reqBo.getPassword())) {
            return "password不能为空";
        }
        if (StringUtils.isEmpty(reqBo.getPhone())) {
            return "phone number不能为空";
        }
        if (StringUtils.isEmpty(reqBo.getSex())) {
            return "sex不能为空";
        }
        return null;
    }

    /**
     * 描述: 登录查询入参校验
     * @param: [reqBo]
     * @return: java.lang.String
     * @throws
     * @author: liuguisheng
     * @date:   2019/3/7 21:23:40
     */
    private String validataQry(AdminInfoReqBo reqBo) {
        if (reqBo == null) {
            return "入参对象不能够为空";
        }
        if (StringUtils.isEmpty(reqBo.getId())) {
            return "用户ID不能为空";
        } else {
            try {
                Long.valueOf(reqBo.getId());
            } catch (NumberFormatException e) {
                return "用户ID必须为纯数字";
            }
        }
        if (StringUtils.isEmpty(reqBo.getPassword())) {
            return "用户密码不能为空";
        }
        return null;
    }
}
