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
     * selecte resume info
     */
    List<ResumePo> qryResumeInfo(ResumePo po);

    /**
     * select resume info by if
     */
    ResumePo qryResumeInfoById(@Param(value = "id")Long id);
}
