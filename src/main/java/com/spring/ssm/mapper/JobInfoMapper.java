package com.spring.ssm.mapper;

import com.spring.ssm.Tool.Page;
import com.spring.ssm.dto.JobInfoPo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface JobInfoMapper {
    /**
     * delete jobInfo
     */
    int deleteJobInfoById(@Param(value = "id") Long id);

    /**
     * add jobInfo
     */
    int insertJobInfo(JobInfoPo record);

    /**
     * query jobInfo By Id
     */
    JobInfoPo selectJobInfoById(@Param(value = "id") Long id);

    /**
     * query JobInfo By Selective
     */
    List<JobInfoPo> selectJobInfoBySelective(JobInfoPo po);

    /**
     * update jobInfoBySelective
     */
    int updateJobInfoBySelective(JobInfoPo record);

    /**
     * select with page
     */
    List<JobInfoPo> selectWithPage(JobInfoPo jobInfoPo, Page<JobInfoPo> jobInfoPoPage);
}