package com.spring.ssm.service;

import com.spring.ssm.service.bo.UserInfoReqBo;
import com.spring.ssm.service.bo.UserInfoRspBo;

import java.util.List;

/**
 * @ClassName: UserInfoService
 * @Description：普通用户信息表 服务
 * @Author: liuguisheng
 * @Date: 2019/2/2 12:46:28
 */
public interface UserInfoService {
    UserInfoRspBo queryUserInfoById(Long id);

    UserInfoRspBo queryUserInfo(UserInfoReqBo reqBo);

    List<UserInfoRspBo> queryInfoBySelective(UserInfoReqBo reqBo);

    UserInfoRspBo addUserInfo(UserInfoReqBo reqBo);

    UserInfoRspBo updateUserInfoById(UserInfoReqBo reqBo);

    UserInfoRspBo deleteUserInfoById(Long id);
}
