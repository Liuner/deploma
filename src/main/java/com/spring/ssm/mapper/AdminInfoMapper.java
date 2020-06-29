package com.spring.ssm.mapper;

import com.spring.ssm.dto.AdminInfoPo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;


/**
 * @ClassName: AdminInfoMapper
 * @Description：管理员信息表mapper
 * @Author: liuguisheng
 * @Date: 2019/2/11 18:13:23
 */
@Repository
public interface AdminInfoMapper {
    /**
     * add admin Info
     */
    int createAdminInfo(AdminInfoPo Po);

    /**
     * delete admin Info
     */
    int deleteAdminInfoById(@Param(value = "id")Long id);

    /**
     * query Admin Info
     */
    AdminInfoPo selectAdminInfoById(@Param(value = "id") Long id);

    /**
     * query Admin Info By Selective
     */
    List<AdminInfoPo> selectAdminInfoBySelective(AdminInfoPo po);

    /**
     * query Admin Info By id and password
     */
    AdminInfoPo selectAdminInfo(AdminInfoPo po);

    /**
     * update admin Info by id
     */
    int updateAdminInfo(AdminInfoPo Po);
}
