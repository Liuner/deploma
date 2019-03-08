package com.spring.ssm.service.bo;

import java.io.Serializable;

/**
 * @ClassName: BaseRspBo
 * @Description：BaseRsp(这里用一句话描述这个类的作用)
 * @Author: liuguisheng
 * @Date: 2019/2/1 16:07:38
 * @Copyright:2019 www.tydic.com Inc. All rights reserved.
 * 注意：本内容仅限于北京天源迪科信息技术有限公司内部传阅，禁止外泄以及用于其他商业目的
 */
public class BaseRspBo implements Serializable {

    private static final long serialVersionUID = -881879393929171923L;

    private String RespCode;

    private String RespDesc;

    public String getRespCode() {
        return this.RespCode;
    }

    public void setRespCode(String RespCode) {
        this.RespCode = RespCode;
    }

    public String getRespDesc() {
        return this.RespDesc;
    }

    public void setRespDesc(String RespDesc) {
        this.RespDesc = RespDesc;
    }

    @Override
    public String toString() {
        return "BaseRspBo{" +
                "RespCode='" + RespCode + '\'' +
                ", RespDesc='" + RespDesc + '\'' +
                '}';
    }
}
