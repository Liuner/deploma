<%--
  Created by IntelliJ IDEA.
  User: fish
  Date: 2018/12/20
  Time: 10:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.do"><i class="glyphicon glyphicon-globe"></i> 知天易</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <!--判断是否存在用户-->
                        <c:choose>
                            <c:when test="${ sessionScope.CURR_USER != null }">
                                <ul id="logedArea" class="nav navbar-nav navbar-right">
                                    <li><a href="personal.do?usid=${CURR_USER.usid}">${CURR_USER.usname}</a></li>
                                    <li><a href="logout.do" >退出</a></li>
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
                                </ul>

                                <ul id="logedArea" class="nav navbar-nav navbar-right hide">
                                    <li><a id="loginUser" href="personal.do?usid=${CURR_USER.usid}">${CURR_USER.usname}</a></li>
                                    <li><a href="logout.do" >退出</a></li>
                                </ul>
                            </c:otherwise>
                        </c:choose>

                    </li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </div>
    </div>
</nav>
<div class="search-type container">
    <ul class="nav nav-tabs" id="stype">
        <li role="presentation" class="active"><a href="#" onclick="choosetype(null)">全部</a></li>
        <li role="presentation"><a href="#" onclick="choosetype(1);">天体物理学</a></li>
        <li role="presentation"><a href="#" onclick="choosetype(12);">星云</a></li>
        <li role="presentation"><a href="#" onclick="choosetype(13);">星系</a></li>
        <li role="presentation"><a href="#" onclick="choosetype(14);">星象</a></li>
        <li role="presentation"><a href="#" onclick="choosetype(15);">奇观</a></li>
    </ul>
</div>

<div class="thesearch">
    <form action="search.do" method="post">
        <input type="text" class="form-control color-white" placeholder="请输入内容" name="searchLike">
        <input type="hidden" class="form-control color-white" name="pclass" value="" id="chooseclass">
        <input type="submit" class="btn btn-default color-white" value="搜索">
    </form>

</div>
<!--遮罩层开始-->
<!--登陆-->
<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content" style="background: rgba(255,255,255,0.2);">
            <div class="modal-header">

                <h2 id="title2" class="text-center tw-page-tag-white">知天易</h2>
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
                <h2 class="text-center tw-page-tag-white">知天易</h2>
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
<!--遮罩层结束-->