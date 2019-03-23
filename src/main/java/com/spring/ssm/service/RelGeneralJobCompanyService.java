package com.spring.ssm.service;

import com.spring.ssm.service.bo.RelGeneralJobCompanyReqBo;
import com.spring.ssm.service.bo.RelGeneralJobCompanyRspBo;

import java.util.List;

/**
 * @ClassName: RelGeneralJobCompanyService
 * @Description：普通用户 职位 公司 关系表 服务
 * @Author: liuguisheng
 * @Date: 2019/3/23 12:59:05
 * @Copyright:2019 www.tydic.com Inc. All rights reserved.
 * 注意：本内容仅限于北京天源迪科信息技术有限公司内部传阅，禁止外泄以及用于其他商业目的
 */
public interface RelGeneralJobCompanyService {

    /**
     * add relInfo
     */
    RelGeneralJobCompanyRspBo createRelInfo(RelGeneralJobCompanyReqBo reqBo);

    /**
     *delete relInfo
     */
    RelGeneralJobCompanyRspBo deleteRelInfo(RelGeneralJobCompanyReqBo reqBo);

    /**
     * update relInfo
     */
    RelGeneralJobCompanyRspBo updateRelInfo(RelGeneralJobCompanyReqBo reqBo);

    /**
     * query relInfo by id
     */
    RelGeneralJobCompanyRspBo queryRelInfoById(RelGeneralJobCompanyReqBo reqBo);

    /**
     * query relInfo by selective
     */
    List<RelGeneralJobCompanyRspBo> queryRelInfoBySelective(RelGeneralJobCompanyReqBo reqBo);
}
