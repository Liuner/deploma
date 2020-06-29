package com.spring.ssm.service;

import com.spring.ssm.service.bo.AdminInfoReqBo;
import com.spring.ssm.service.bo.AdminInfoRspBo;

import java.util.List;

/**
 * @ClassName: AdminInfoService
 * @Description：管理员信息表服务
 * @Author: liuguisheng
 * @Date: 2019/2/11 19:05:42
 */
public interface AdminInfoService {


    /**
     * 描述: 添加管理员信息
     * @param: [reqBo]
     * @return: com.spring.ssm.service.bo.AdminInfoRspBo
     */
    AdminInfoRspBo createAdminInfo(AdminInfoReqBo reqBo);

    /**
     * 描述: 根据id查询管理员信息
     * @param: [id]
     * @return: com.spring.ssm.service.bo.AdminInfoRspBo
     */
    AdminInfoRspBo queryAdminInfoById(Long id);

    /**
     * 描述: 查询所有管理员信息
     * @param:
     * @return: java.util.List<com.spring.ssm.service.bo.AdminInfoRspBo>
     */
    List<AdminInfoRspBo> queryAdminInfoBySelective(AdminInfoReqBo reqBo);

    /**
     * 描述: 更新管理员信息
     * @param: [reqBo]
     * @return: com.spring.ssm.service.bo.AdminInfoRspBo
     */
    AdminInfoRspBo updateAdminInfo(AdminInfoReqBo reqBo);

    /**
     * 描述: 删除管理员信息
     * @param: [id]
     * @return: com.spring.ssm.service.bo.AdminInfoRspBo
     */
    AdminInfoRspBo deleteAdminInfo(Long id);

    /**
     * 描述: 用于登录的查询
     * @param reqBo
     * @return
     */
    AdminInfoRspBo queryAdminInfo(AdminInfoReqBo reqBo);
}
