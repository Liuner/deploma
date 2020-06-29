package com.spring.ssm.service.bo;

import java.util.List;

/**
 * @ClassName: RelGeneralJobCompanyListRspBo
 * @Description：关系表 列表查询 出参
 * @Author: liuguisheng
 * @Date: 2019/3/25 10:49:30
 */
public class RelGeneralJobCompanyListRspBo extends BaseRspBo {

    private static final long serialVersionUID = -1106119270936259371L;

    private List<RelGeneralJobCompanyRspBo> row;

    /**
     * 获取:row
     *
     * @return row
     **/
    public List<RelGeneralJobCompanyRspBo> getRow() {
        return row;
    }

    /**
     * 设置:row
     *
     * @param row
     **/
    public void setRow(List<RelGeneralJobCompanyRspBo> row) {
        this.row = row;
    }

    @Override
    public String toString() {
        return "RelGeneralJobCompanyListRspBo{" +
                "row=" + row +
                super.toString() +
                '}';
    }
}
