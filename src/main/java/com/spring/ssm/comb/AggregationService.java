package com.spring.ssm.comb;

import com.spring.ssm.comb.bo.QueryReceviedResumeRspBo;
import com.spring.ssm.comb.bo.QurySendedRspBo;

import java.util.List;

/**
 * @ClassName: AggregationService
 * @Description：聚合服务
 * @Author: liuguisheng
 * @Date: 2019/3/23 15:22:56
 */
public interface AggregationService {
    /**
     * 用户查看已投递职位信息
     * 用户id->关系表->职位id->职位信息
     */
    List<QurySendedRspBo> qrySendedJobInfo(Long id);

    /**
     * 公司用户查看已收到的简历
     * 公司用户id->关系表->简历id->简历信息
     */
    List<QueryReceviedResumeRspBo> qryReceivedGeneralInfo(Long id);
}
