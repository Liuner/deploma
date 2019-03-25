package com.spring.ssm.service.bo;

import java.util.List;

/**
 * @ClassName: RelGeneralJobCompanyListRspBo
 * @Description：关系表 列表查询 出参
 * @Author: liuguisheng
 * @Date: 2019/3/25 10:49:30
 * @Copyright:2019 www.tydic.com Inc. All rights reserved.
 * 注意：本内容仅限于北京天源迪科信息技术有限公司内部传阅，禁止外泄以及用于其他商业目的
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
