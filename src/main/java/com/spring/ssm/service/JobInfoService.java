package com.spring.ssm.service;

import com.spring.ssm.service.bo.JobInfoReqBo;
import com.spring.ssm.service.bo.JobInfoRspBo;

import java.util.List;

/**
 * @ClassName: JobInfoService
 * @Description：操作职位信息表
 * @Author: liuguisheng
 * @Date: 2019/3/8 16:49:54
 * @Copyright:2019 www.tydic.com Inc. All rights reserved.
 * 注意：本内容仅限于北京天源迪科信息技术有限公司内部传阅，禁止外泄以及用于其他商业目的
 */
public interface JobInfoService {
    /**
     * add info
     */
    JobInfoRspBo createJobInfo(JobInfoReqBo reqBo);

    /**
     * delete info
     */
    JobInfoRspBo deleteJobInfo(Long id);

    /**
     * query info by id
     */
    JobInfoRspBo queryJobInfoById(Long id);

    /**
     * query info by selective
     */
    List<JobInfoRspBo> queryJobInfoBySelective(JobInfoReqBo reqBo);

    /**
     * update info
     */
    JobInfoRspBo updateJobInfo(JobInfoReqBo reqBo);
}
