package com.spring.ssm.service.impl;

import com.spring.ssm.Constracts.RspConstracts;
import com.spring.ssm.dto.UserInfoPo;
import com.spring.ssm.mapper.UserInfoMapper;
import com.spring.ssm.service.Bo.UserInfoReqBo;
import com.spring.ssm.service.Bo.UserInfoRspBo;
import com.spring.ssm.service.UserInfoService;
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
 * @ClassName: UserInfoServiceImpl
 * @Description：普通用户信息表 服务实现
 * @Author: liuguisheng
 * @Date: 2019/2/2 12:48:04
 * @Copyright:2019 www.tydic.com Inc. All rights reserved.
 * 注意：本内容仅限于北京天源迪科信息技术有限公司内部传阅，禁止外泄以及用于其他商业目的
 */
@Service
public class UserInfoServiceImpl implements UserInfoService {
    private Logger LOG = LoggerFactory.getLogger(UserInfoServiceImpl.class);

    @Autowired
    private UserInfoMapper userInfoMapper;

    @Override
    public UserInfoRspBo queryUserInfoById(Long id) {
        LOG.info("进入queryUserInfoById服务");
        UserInfoRspBo retBo = new UserInfoRspBo();
        UserInfoPo userInfoPo = new UserInfoPo();
        try {
            userInfoPo = userInfoMapper.selectUserInfoById(id);
        } catch (Exception e) {
            LOG.error("调用mapper查询数据异常：" + e);
        }
        if (userInfoPo != null) {
            BeanUtils.copyProperties(userInfoPo, retBo);
            retBo.setRespCode(RspConstracts.RSP_CODE_SUCCESS);
            retBo.setRespDesc(RspConstracts.RSP_DESC_SUCCESS);
        } else {
            retBo.setRespCode(RspConstracts.RSP_CODE_FAIL);
            retBo.setRespDesc(RspConstracts.RSP_DESC_FAIL);
        }
        return retBo;
    }

    @Override
    public UserInfoRspBo queryUserInfoBySelective(UserInfoReqBo reqBo) {
        LOG.info("进入queryUserInfoBySelective服务");
        UserInfoRspBo retBo = new UserInfoRspBo();
        String validateStr = validataQryAtr(reqBo);
        if (!StringUtils.isEmpty(validateStr)) {
            retBo.setRespCode(RspConstracts.RSP_CODE_FAIL);
            retBo.setRespDesc(validateStr);
            return  retBo;
        }
        UserInfoPo userInfoPo = new UserInfoPo();
        BeanUtils.copyProperties(reqBo, userInfoPo);
        userInfoPo.setId(Long.valueOf(reqBo.getId()));
        try {
            userInfoPo = userInfoMapper.selectUserInfo(userInfoPo);
        } catch (Exception e) {
            LOG.error("调用mapper查询数据异常：" + e);
        }
        if (userInfoPo != null) {
            retBo.setName(userInfoPo.getName());
            retBo.setRespCode(RspConstracts.RSP_CODE_SUCCESS);
            retBo.setRespDesc(RspConstracts.RSP_DESC_SUCCESS);
        } else {
            retBo.setRespCode(RspConstracts.RSP_CODE_FAIL);
            retBo.setRespDesc("用户名或密码错误!!!");
        }
        return retBo;
    }

    @Override
    public List<UserInfoRspBo> queryInfo(UserInfoReqBo reqBo) {
        LOG.info("进入queryInfo服务");

        UserInfoPo userInfoPo = new UserInfoPo();
        BeanUtils.copyProperties(reqBo, userInfoPo);
        userInfoPo.setId(Long.valueOf(reqBo.getId()));

        List<UserInfoRspBo> userInfoRspBoList = new ArrayList<UserInfoRspBo>();
        List<UserInfoPo> userInfoPoList = userInfoMapper.selectUserInfoBySelective(userInfoPo);

        if (!CollectionUtils.isEmpty(userInfoPoList)) {
            for (UserInfoPo userInfo : userInfoPoList) {
                UserInfoRspBo bo = new UserInfoRspBo();
                BeanUtils.copyProperties(userInfo,  bo);
                userInfoRspBoList.add(bo);
            }
        }
        return userInfoRspBoList;
    }

    @Override
    public UserInfoRspBo addUserInfo(UserInfoReqBo reqBo) {
        LOG.info("进入addUserinfo服务");
        UserInfoRspBo retBo = new UserInfoRspBo();
        //入参校验
        String validataArgStr = validataArg(reqBo);
        if (!StringUtils.isEmpty(validataArgStr)) {
            LOG.error("入参校验失败：" + validataArgStr);
            retBo.setRespCode(RspConstracts.RSP_CODE_FAIL);
            retBo.setRespDesc("入参校验失败：" + validataArgStr);
        }

        UserInfoPo userInfoPo = new UserInfoPo();
        BeanUtils.copyProperties(reqBo, userInfoPo);
        int result = 0;
        try {
            result = userInfoMapper.addUserInfo(userInfoPo);
        } catch (Exception e) {
            LOG.error("调用mappert添加数据异常：" + e);
        }
        if (result == 0) {
            LOG.error("添加数据失败");
            retBo.setRespCode(RspConstracts.RSP_CODE_FAIL);
            retBo.setRespDesc(RspConstracts.RSP_DESC_FAIL);
            return retBo;
        }
        retBo.setId(userInfoPo.getId()+"");
        retBo.setRespCode(RspConstracts.RSP_CODE_SUCCESS);
        retBo.setRespDesc(RspConstracts.RSP_DESC_SUCCESS);
        return retBo;
    }

    @Override
    public UserInfoRspBo updateUserInfoById(UserInfoReqBo reqBo) {
        LOG.info("进入updataUserInfoById服务");
        UserInfoRspBo retBo = new UserInfoRspBo();
        if (StringUtils.isEmpty(reqBo.getId())) {
            LOG.error("入参对象属性id不能为空");
            retBo.setRespCode(RspConstracts.RSP_CODE_FAIL);
            retBo.setRespDesc("入参对象属性id不能为空");
            return retBo;
        }

        UserInfoPo userInfoPo = new UserInfoPo();
        BeanUtils.copyProperties(reqBo, userInfoPo);
        int result = 0;
        try {
            result = userInfoMapper.updateUserInfo(userInfoPo);
        } catch (Exception e) {
            LOG.error("调用mapper更新数据异常：" + e);
        }
        if (result == 0) {
            LOG.error("更新数据失败");
            retBo.setRespCode(RspConstracts.RSP_CODE_FAIL);
            retBo.setRespDesc(RspConstracts.RSP_DESC_FAIL);
            return retBo;
        }
        retBo.setRespCode(RspConstracts.RSP_CODE_SUCCESS);
        retBo.setRespDesc(RspConstracts.RSP_DESC_SUCCESS);
        return retBo;
    }

    @Override
    public UserInfoRspBo deleteUserInfoById(Long id) {
        LOG.info("进入deleteUserInfoById服务");
        UserInfoRspBo retBo = new UserInfoRspBo();
        if (StringUtils.isEmpty(id)) {
            LOG.error("入参id不能为空");
            retBo.setRespCode(RspConstracts.RSP_CODE_FAIL);
            retBo.setRespDesc("入参id不能为空");
            return retBo;
        }
        int result = 0;
        try {
            result = userInfoMapper.deleteUserInfoById(id);
        } catch (Exception e) {
            LOG.error("调用mapper删除数据失败");
        }
        if (result == 0) {
            retBo.setRespCode(RspConstracts.RSP_CODE_FAIL);
            retBo.setRespDesc(RspConstracts.RSP_DESC_FAIL);
            return retBo;
        }
        retBo.setRespDesc(RspConstracts.RSP_DESC_SUCCESS);
        retBo.setRespCode(RspConstracts.RSP_CODE_SUCCESS);
        return retBo;
    }

    /**
     * 描述: 入参校验
     * @param: [UserInfoReqBo reqBo]
     * @return: java.lang.String
     * @throws
     * @author: liuguisheng
     * @date:   2019/2/7 10:52:00
     */
    private String validataArg(UserInfoReqBo reqBo) {
        if (reqBo == null) {
            return "入参对象不能为空";
        }
        if (StringUtils.isEmpty(reqBo.getName())) {
            return "入参对象属性name不能为空";
        }
        if (StringUtils.isEmpty(reqBo.getPassword())) {
            return "入参对象属性password不能为空";
        }
        if (StringUtils.isEmpty(reqBo.getAge())) {
            return "入参对象属性age不能为空";
        }
        if (StringUtils.isEmpty(reqBo.getE_maile())) {
            return "入参对象属性e_maile不能为空";
        }
        if (StringUtils.isEmpty(reqBo.getIdNumber())) {
            return "入参对象属性idNumber不能为空";
        }
        if (StringUtils.isEmpty(reqBo.getPhone())) {
            return "入参对象属性phone不能为空";
        }
        if (StringUtils.isEmpty(reqBo.getLocal())) {
            return "入参对象属性local不能为空";
        }
        if (StringUtils.isEmpty(reqBo.getSex())) {
            return "入参对象属性sex不能为空";
        }
        if (StringUtils.isEmpty(reqBo.getStatus())) {
            return "入参对象属性status不能为空";
        }
        return null;
    }

    /**
     * 描述: 查询方法入参校验
     * @param: [reqBo]
     * @return: java.lang.String
     * @throws
     * @author: liuguisheng
     * @date:   2019/3/5 13:49:17
     */
    private String validataQryAtr(UserInfoReqBo reqBo) {
        if (reqBo == null) {
            return "入参对象不能为空";
        }
        if (StringUtils.isEmpty(reqBo.getId())) {
            return "用户ID不能为空";
        } else {
            try {
                Long.valueOf(reqBo.getId());
            } catch (NumberFormatException e) {
                return "用户ID为纯数字";
            }
        }
        if (StringUtils.isEmpty(reqBo.getPassword())) {
            return "密码不能为空";
        }
        return null;
    }
}
