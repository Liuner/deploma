package com.spring.ssm.service;

import com.spring.ssm.service.bo.JobInfoReqBo;
import com.spring.ssm.service.bo.JobInfoRspBo;

import java.util.List;

/**
 * @ClassName: JobInfoService
 * @Description：操作职位信息表
 * @Author: liuguisheng
 * @Date: 2019/3/8 16:49:54
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
