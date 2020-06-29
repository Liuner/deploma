package com.spring.ssm.Tool;

/**
 * @ClassName: BusiExcption
 * @Description：异常
 * @Author: liuguisheng
 * @Date: 2019/3/6 13:37:54
 */
public class  BusiExcption extends RuntimeException {
    public static final ThreadLocal<BusiExcption> MQ_THREAD_EXCEPTION = new ThreadLocal();
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
        MQ_THREAD_EXCEPTION.set(this);
    }

    public BusiExcption(String msgId, String message, Throwable cause) {
        super(message, cause);
        this.args = new String[1];
        this.args[0] = message;
        this.msgCode = msgId;
        MQ_THREAD_EXCEPTION.set(this);
    }
}
