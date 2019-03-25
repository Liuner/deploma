package com.spring.ssm.mapper;

import com.spring.ssm.dto.ResumePo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @ClassName: ResumeMapper
 * @Description：简历信息表 mapper
 * @Author: liuguisheng
 * @Date: 2019/3/25 15:57:40
 * @Copyright:2019 www.tydic.com Inc. All rights reserved.
 * 注意：本内容仅限于北京天源迪科信息技术有限公司内部传阅，禁止外泄以及用于其他商业目的
 */
@Repository
public interface ResumeMapper {
    /**
     * add resume info
     */
    int createResumeInfo(ResumePo po);

    /**
     * delete resume info
     */
    int deleteResumeInfo(@Param(value = "id") Long id);

    /**
     * update resume info
     */
    int updateResumeInfo(ResumePo po);

    /**
     * selecte resume info by id
     */
    List<ResumePo> qryResumeInfo(ResumePo po);
}
