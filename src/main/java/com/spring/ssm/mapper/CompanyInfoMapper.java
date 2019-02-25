package com.spring.ssm.mapper;

import com.spring.ssm.dto.CompanyInfoPo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @ClassName: CompanyInfoMapper
 * @Description：公司用户信息表 mapper
 * @Author: liuguisheng
 * @Date: 2019/2/7 15:04:57
 * @Copyright:2019 www.tydic.com Inc. All rights reserved.
 * 注意：本内容仅限于北京天源迪科信息技术有限公司内部传阅，禁止外泄以及用于其他商业目的
 */
@Repository
public interface CompanyInfoMapper {

    /**
     * add company Info
     */
    int createComInfo(CompanyInfoPo companyInfoPo);

    /**
     * select company Info by id
     */
    CompanyInfoPo selectComInfoById(@Param(value = "id") Long id);

    /**
     * select company Info
     */
    List<CompanyInfoPo> selectAllComInfo();

    /**
     * updata company Info by id
     */
    int updateComInfoById(CompanyInfoPo companyInfoPo);

    /**
     * delete company Info by id
     */
    int deleteComInfoById(@Param(value="id")Long id);

}
