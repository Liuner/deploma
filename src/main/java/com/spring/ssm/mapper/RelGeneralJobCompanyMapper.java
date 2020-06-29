package com.spring.ssm.mapper;

import com.spring.ssm.dto.RelGeneralJobCompanyPo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @ClassName: RelGeneralJobCompanyMapper
 * @Description：普通用户 职位 公司 关系表 Mapper
 * @Author: liuguisheng
 * @Date: 2019/3/23 9:18:40
 */
@Repository
public interface RelGeneralJobCompanyMapper {

    /**
     * add
     */
    int createRelInfo(RelGeneralJobCompanyPo po);

    /**
     * delete by id
     */
    int deleteRelInfo(@Param(value = "id")Long id);

    /**
     * update  更新
     */
    int updateRelInfo(RelGeneralJobCompanyPo po);

    /**
     * query info by id
     */
    RelGeneralJobCompanyPo queryRelInfoById(@Param(value = "id")Long id);

    /**
     * query info by selective
     */
    List<RelGeneralJobCompanyPo> queryRelInfoBySelective(RelGeneralJobCompanyPo po);
}
