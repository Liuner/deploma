<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Liugs
  Date: 2019/2/20
  Time: 18:09:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>

<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>

<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                        data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="/page/index"><i class="glyphicon glyphicon-globe">聚贤网</i></a>
            </div>

            <div class="collapsed navbar-collapse" id="bs-example-navbar-conllapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <c:choose>
                            <c:when test="${ sessionScope.CURR_USER != null }">
                                <ul id="logeArea" class="nav navbar-nav navbar-right">
                                    <li><a href="page_personal.jsp?usid=${CURR_USER.usid}">${CURR_USER.usname}</a></li>
                                    <li><a href="/page/logout">退出</a></li>
                                </ul>
                            </c:when>
                            <c:otherwise>
                                <ul id="loginArea" class="nav navbar-nav navbar-right">
                                    <li><a href="javascript:void(0)" data-toggle="modal"
                                           data-target="#loginModal" >登录</a>
                                    </li>
                                    <li><a href="javascript:void(0)" data-toggle="modal"
                                           data-target="#registerModal">注册</a>
                                    </li>
                                    <li><a href="javascript:void(0)" data-toggle="modal"
                                           data-target="#companyModal">企业用户</a>
                                    </li>
                                </ul>

                                <ul id="logedArea" class="nav navbar-nav navbar-right hide">
                                    <li><a id="loginUser" href="personal.do?usid=${CURR_USER.usid}">${CURR_USER.usname}</a></li>
                                    <li><a href="/page/logout" >退出</a></li>
                                </ul>
                            </c:otherwise>
                        </c:choose>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</nav>

<!--遮罩层开始-->
<!--登陆-->
<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content" style="background: rgba(255,255,255,0.2);">
            <div class="modal-header">

                <h2 id="title2" class="text-center tw-page-tag-white">聚贤网</h2>
                <h4 id="title3" class="text-center tw-page-tag-white">用户登录</h4>
                <br/>
                <div class="alert alert-danger hide" role="alert" id="errMsg">${errMsg}</div>
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <label for="usname" class="control-label tw-page-tag-white">用户名：</label>
                            <input type="text" class="form-control" name="usname"
                                   id="usname" placeholder="请输入用户名">
                        </div>
                        <div class="form-group">
                            <label for="uspassword" class="control-label tw-page-tag-white">密码：</label>
                            <input type="password" class="form-control" id="uspassword"
                                   name="uspassword" placeholder="请输入密码">
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <input type="submit" class="btn btn-primary" value="登录" id="btnLogin">
                    <input type="button" class="btn btn-default" data-dismiss="modal" value="取消">
                </div>
            </div>

        </div>
    </div>
</div>
<!--注册-->
<div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content" style="background: rgba(255,255,255,0.2);">
            <div class="modal-header">
                <h2 class="text-center tw-page-tag-white">聚贤网</h2>
                <h4 class="text-center tw-page-tag-white">用户注册</h4>
                <br/>
                <div class="alert alert-danger hide" role="alert" id="errRMsg">${errRMsg}</div>
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <label for="username1" class="control-label tw-page-tag-white">用户名：</label>
                            <input type="text" class="form-control" placeholder="请输入用户名"
                                   name="usname" id="username1">
                        </div>
                        <div class="form-group">
                            <label for="password1" class="control-label tw-page-tag-white">密码：</label>
                            <input type="password" class="form-control" id="password1" placeholder="请输入密码"
                                   name="uspassword">
                        </div>
                        <div class="form-group">
                            <label for="password2" class="control-label tw-page-tag-white">确认密码：</label>
                            <input type="password" class="form-control" id="password2" placeholder="请确认密码"
                                   name="password2">
                        </div>
                        <div class="form-group">
                            <label for="tel" class="control-label tw-page-tag-white">电话号码：</label>
                            <input type="text" class="form-control" id="tel" placeholder="请输入电话号码"
                                   name="ustel">
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <input type="submit" class="btn btn-primary" value="注册" id="btnRegister">
                    <input type="button" class="btn btn-default" data-dismiss="modal" value="取消">
                </div>
            </div>
        </div>
    </div>
</div>
<%--企业用户--%>
<div class="modal fade" id="companyModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content" style="background: rgba(255,255,255,0.2);">
            <div class="modal-header">

                <h2 id="title4" class="text-center tw-page-tag-white">聚贤网</h2>
                <h4 id="title5" class="text-center tw-page-tag-white">企业用户登录</h4>
                <br/>
                <div class="alert alert-danger hide" role="alert" id="errMsgs">${errMsg}</div>
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <label for="cpmusname" class="control-label tw-page-tag-white">用户名：</label>
                            <input type="text" class="form-control" name="cpmusname"
                                   id="cpmusname" placeholder="请输入用户名">
                        </div>
                        <div class="form-group">
                            <label for="cpmuspassword" class="control-label tw-page-tag-white">密码：</label>
                            <input type="password" class="form-control" id="cpmuspassword"
                                   name="cpmuspassword" placeholder="请输入密码">
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <input type="submit" class="btn btn-primary" value="登录" id="cpmbtnLogin">
                    <input type="button" class="btn btn-default" data-dismiss="modal" value="取消">
                </div>
            </div>

        </div>
    </div>
</div>
<!--遮罩层结束-->