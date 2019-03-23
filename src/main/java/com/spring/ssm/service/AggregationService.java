package com.spring.ssm.service;

import com.spring.ssm.service.bo.JobInfoRspBo;

import java.util.List;

/**
 * @ClassName: AggregationService
 * @Description：聚合服务
 * @Author: liuguisheng
 * @Date: 2019/3/23 15:22:56
 * @Copyright:2019 www.tydic.com Inc. All rights reserved.
 * 注意：本内容仅限于北京天源迪科信息技术有限公司内部传阅，禁止外泄以及用于其他商业目的
 */
public interface AggregationService {
    /**
     * 用户查看已投递职位信息
     * 用户id->关系表->职位id->职位信息
     */
    List<JobInfoRspBo> scanJobList(Long id);
}
