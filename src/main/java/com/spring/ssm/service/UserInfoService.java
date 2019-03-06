package com.spring.ssm.service;

import com.spring.ssm.service.Bo.UserInfoReqBo;
import com.spring.ssm.service.Bo.UserInfoRspBo;

import java.util.List;

/**
 * @ClassName: UserInfoService
 * @Description：普通用户信息表 服务
 * @Author: liuguisheng
 * @Date: 2019/2/2 12:46:28
 * @Copyright:2019 www.tydic.com Inc. All rights reserved.
 * 注意：本内容仅限于北京天源迪科信息技术有限公司内部传阅，禁止外泄以及用于其他商业目的
 */
public interface UserInfoService {
    UserInfoRspBo queryUserInfoById(Long id);

    UserInfoRspBo queryUserInfo(UserInfoReqBo reqBo);

    List<UserInfoRspBo> queryInfoBySelective(UserInfoReqBo reqBo);

    UserInfoRspBo addUserInfo(UserInfoReqBo reqBo);

    UserInfoRspBo updateUserInfoById(UserInfoReqBo reqBo);

    UserInfoRspBo deleteUserInfoById(Long id);
}
