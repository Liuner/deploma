package com.spring.ssm.service;

import com.spring.ssm.service.bo.RelGeneralJobCompanyListRspBo;
import com.spring.ssm.service.bo.RelGeneralJobCompanyReqBo;
import com.spring.ssm.service.bo.RelGeneralJobCompanyRspBo;

/**
 * @ClassName: RelGeneralJobCompanyService
 * @Description：普通用户 职位 公司 关系表 服务
 * @Author: liuguisheng
 * @Date: 2019/3/23 12:59:05
 */
public interface RelGeneralJobCompanyService {

    /**
     * add relInfo
     */
    RelGeneralJobCompanyRspBo createRelInfo(RelGeneralJobCompanyReqBo reqBo);

    /**
     *delete relInfo
     */
    RelGeneralJobCompanyRspBo deleteRelInfoById(Long id);

    /**
     * update relInfo
     */
    RelGeneralJobCompanyRspBo updateRelInfo(RelGeneralJobCompanyReqBo reqBo);

    /**
     * query relInfo by id
     */
    RelGeneralJobCompanyRspBo queryRelInfoById(RelGeneralJobCompanyReqBo reqBo);

    /**
     * query relinfolist by selective
     */
    RelGeneralJobCompanyListRspBo qyeryRelInfoList(RelGeneralJobCompanyReqBo reqBo);
}
