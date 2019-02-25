package com.spring.ssm.mapper;

import com.spring.ssm.dto.UserInfoPo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @ClassName: UserInfoMapper
 * @Description：普通用户信息表 mapper
 * @Author: liuguisheng
 * @Date: 2019/2/2 11:31:38
 * @Copyright:2019 www.tydic.com Inc. All rights reserved.
 * 注意：本内容仅限于北京天源迪科信息技术有限公司内部传阅，禁止外泄以及用于其他商业目的
 */
@Repository
public interface UserInfoMapper {
    /**
     * add userInfo
     */
    int addUserInfo(UserInfoPo userInfoPo);

    /**
     *  select all userInfo
     */
     List<UserInfoPo> selectAllUserInfo();

     /**
     *select userInfo by id
     */

    UserInfoPo selectUserInfoById(@Param(value="id")Long id);

    /**
     * update userInfo
     */
    int updateUserInfo(UserInfoPo userInfoPo);

    /**
     * delete userInfo by Id
     */
    int deleteUserInfoById(@Param(value="id")Long id);

}
