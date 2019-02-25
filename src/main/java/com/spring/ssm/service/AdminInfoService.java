package com.spring.ssm.service;

import com.spring.ssm.service.Bo.AdminInfoReqBo;
import com.spring.ssm.service.Bo.AdminInfoRspBo;

import java.util.List;

/**
 * @ClassName: AdminInfoService
 * @Description：管理员信息表服务
 * @Author: liuguisheng
 * @Date: 2019/2/11 19:05:42
 * @Copyright:2019 www.tydic.com Inc. All rights reserved.
 * 注意：本内容仅限于北京天源迪科信息技术有限公司内部传阅，禁止外泄以及用于其他商业目的
 */
public interface AdminInfoService {


    /**
     * 描述: 添加管理员信息
     * @param: [reqBo]
     * @return: com.spring.ssm.service.Bo.AdminInfoRspBo
     */
    AdminInfoRspBo createAdminInfo(AdminInfoReqBo reqBo);

    /**
     * 描述: 根据id查询管理员信息
     * @param: [id]
     * @return: com.spring.ssm.service.Bo.AdminInfoRspBo
     */
    AdminInfoRspBo queryAdminInfoById(Long id);

    /**
     * 描述: 查询所有管理员信息
     * @param:
     * @return: java.util.List<com.spring.ssm.service.Bo.AdminInfoRspBo>
     */
    List<AdminInfoRspBo> queryAdminInfo();

    /**
     * 描述: 更新管理员信息
     * @param: [reqBo]
     * @return: com.spring.ssm.service.Bo.AdminInfoRspBo
     */
    AdminInfoRspBo updateAdminInfo(AdminInfoReqBo reqBo);

    /**
     * 描述: 删除管理员信息
     * @param: [id]
     * @return: com.spring.ssm.service.Bo.AdminInfoRspBo
     */
    AdminInfoRspBo deleteAdminInfo(Long id);
}
