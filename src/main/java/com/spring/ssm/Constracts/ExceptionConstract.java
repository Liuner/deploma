package com.spring.ssm.Constracts;

/**
 * @ClassName: ExceptionConstract
 * @Description：异常常量
 * @Author: liuguisheng
 * @Date: 2019/3/6 13:31:45
 */
public class ExceptionConstract {
    /**普通用户数据操作异常*/
    public static final String USERINFO_EXCEPTION = "1001";

    /**公司用户数据操作异常*/
    public static final String COMPANY_EXCEPTION = "2002";

    /**管理员数据操作异常*/
    public static final String ADMIN_EXCEPTION = "3001";

    /**职位信息表操作异常*/
    public static final String JOBINFO_EXCEPTION = "4001";

    /**普通用户 职位 公司 关系表操作异常*/
    public static final String REL_INFO_EXCEPTION = "5001";

    /**简历信息表 操作异常*/
    public static final String RESUME_EXCEPTION = "6001";
}
