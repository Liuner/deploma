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
 */
@Repository
public interface UserInfoMapper {
    /**
     * add userInfo
     */
    int addUserInfo(UserInfoPo userInfoPo);

    /**
     *  selectUserInfoBySelective
     */
     List<UserInfoPo> selectUserInfoBySelective(UserInfoPo userInfoPo);

     /**
     *select userInfo by id
     */

    UserInfoPo selectUserInfoById(@Param(value="id")Long id);

    /**
     * selectUserInfo
     */
    UserInfoPo selectUserInfo(UserInfoPo userInfoPo);

    /**
     * update userInfo
     */
    int updateUserInfo(UserInfoPo userInfoPo);

    /**
     * delete userInfo by Id
     */
    int deleteUserInfoById(@Param(value="id")Long id);

}
