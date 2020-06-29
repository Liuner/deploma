package com.spring.ssm.service.bo;

import java.util.List;

/**
 * @ClassName: ResumeListRspBo
 * @Description：简历信息表 列表查询服务(这里用一句话描述这个类的作用)
 * @Author: liuguisheng
 * @Date: 2019/3/25 16:39:32
 */
public class ResumeListRspBo extends BaseRspBo{

    private static final long serialVersionUID = 747931062323617052L;

    private List<ResumeRspBo> rows;

    /**
     * 获取:rows
     *
     * @return rows
     **/
    public List<ResumeRspBo> getRows() {
        return rows;
    }

    /**
     * 设置:rows
     *
     * @param rows
     **/
    public void setRows(List<ResumeRspBo> rows) {
        this.rows = rows;
    }

    @Override
    public String toString() {
        return "ResumeListRspBo{" +
                "rows=" + rows +
                super.toString() +
                '}';
    }
}
