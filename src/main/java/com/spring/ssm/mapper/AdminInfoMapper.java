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
 * @Copyright:2019 www.tydic.com Inc. All rights reserved.
 * 注意：本内容仅限于北京天源迪科信息技术有限公司内部传阅，禁止外泄以及用于其他商业目的
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
     * query Admin Info By Id
     */
    List<AdminInfoPo> selectAdminInfo();

    /**
     * update admin Info by id
     */
    int updateAdminInfo(AdminInfoPo Po);
}
