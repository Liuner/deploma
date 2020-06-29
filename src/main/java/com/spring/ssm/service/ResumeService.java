package com.spring.ssm.service;

import com.spring.ssm.service.bo.ResumeListRspBo;
import com.spring.ssm.service.bo.ResumeReqBo;
import com.spring.ssm.service.bo.ResumeRspBo;

/**
 * @ClassName: ResumeService
 * @Description：简历信息表服务
 * @Author: liuguisheng
 * @Date: 2019/3/25 16:32:16
 */
public interface ResumeService {
    /**
     * add resumeInfo
     */
    ResumeRspBo createResumeInfo(ResumeReqBo reqBo);

    /**
     * delete resumeInfo
     */
    ResumeRspBo deleteResumeInfo(ResumeReqBo reqBo);

    /**
     * update resumeInfo
     */
    ResumeRspBo updateResumeInfo(ResumeReqBo reqBo);

    /**
     * query resumeInfo
     */
    ResumeListRspBo qryResumeInfo(ResumeReqBo reqBo);

    /**
     * query resumeInfo by selective
     */
    ResumeRspBo qryResumeInfoById(Long id);
}
