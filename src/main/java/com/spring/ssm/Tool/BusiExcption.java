package com.spring.ssm.Tool;

/**
 * @ClassName: BusiExcption
 * @Description：异常
 * @Author: liuguisheng
 * @Date: 2019/3/6 13:37:54
 * @Copyright:2019 www.tydic.com Inc. All rights reserved.
 * 注意：本内容仅限于北京天源迪科信息技术有限公司内部传阅，禁止外泄以及用于其他商业目的
 */
public class  BusiExcption extends RuntimeException {
    private static final long serialVersionUID = -1814155355569144196L;
    private String msgCode;
    private String[] args;

    public String getMsgCode() {
        return this.msgCode;
    }

    public String[] getArgs() {
        return this.args;
    }

    public String getMsgInfo() {
        return this.getMessage();
    }

    public BusiExcption(String msgId, String message) {
        super(message);
        this.msgCode = msgId;
    }

    public BusiExcption(String msgId, String message, Throwable cause) {
        super(message, cause);
        this.args = new String[1];
        this.args[0] = message;
        this.msgCode = msgId;
    }
}