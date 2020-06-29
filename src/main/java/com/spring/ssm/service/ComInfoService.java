package com.spring.ssm.service;

import com.spring.ssm.service.bo.CompanyInfoReqBo;
import com.spring.ssm.service.bo.CompanyInfoRspBo;

import java.util.List;

/**
 * @ClassName: ComInfoService
 * @Description：公司用户信息服务
 * @Author: liuguisheng
 * @Date: 2019/2/7 21:24:32
 */
public interface ComInfoService {
    /**
     * 添加用户信息
     */
    CompanyInfoRspBo createComInfo(CompanyInfoReqBo reqBo);

    /**
     * 根据id查询用户信息
     */
    CompanyInfoRspBo selectComInfoById(Long id);

    /**
     * 查询所有信息
     */
    List<CompanyInfoRspBo> selectComInfoBySelective(CompanyInfoReqBo reqBo);

    /**
     * 查询用户信息，ID，Password
     */
    CompanyInfoRspBo selectComInfo(CompanyInfoReqBo reqBo);

    /**
     * 根据id更新用户信息
     */
    CompanyInfoRspBo updateComInfoById(CompanyInfoReqBo reqBo);

    /**
     * 根据id删除用户信息
     */
    CompanyInfoRspBo deleteComInfo(Long id);
}
