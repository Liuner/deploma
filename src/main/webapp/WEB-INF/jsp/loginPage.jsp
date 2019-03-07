<%--
  Created by IntelliJ IDEA.
  User: Tannin
  Date: 2019/2/26
  Time: 21:44:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>>
<html>
<head>
    <title>欢迎登录</title>
    <link rel="stylesheet" type="text/css" href="/static/css/Demo.css">
    <link rel="stylesheet" type="text/css" href="/static/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="/static/css/pretty-checkbox.min.css"/>
    <%--<script type="text/javascript" src="/static/js/jquery-3.3.1.js"></script>--%>
    <script type="text/javascript" src="/static/js/bootstrap.js"></script>
</head>
<body>
    <jsp:include page="/WEB-INF/jsp/ke/pageHead.jsp"></jsp:include>
<%------------------------------------------------------------------------------------%>
    <div class="panel panel-default panel-self">

        <!-- ---------------------Title------------------- -->
        <div class="panel-heading panel-heading-self">
            <label>JOB INFORMATION</label>
        </div>

        <%---- -------------------Search--------------------%>
        <div class="navbar-right">
            <form class="navbar-form">
                <div class="form-group">
                        <input type="text" class="form-control input-search" placeholder="Search">
                        <button type="submit" class="btn btn-danger btn-search">BEGIN</button>
                </div>
            </form>
        </div>

        <!---------------------- Table ---------------------->
        <table class="table">
            <tr class="info"><th>POSITION</th><th>COMPANY</th><th>LOCAL</th><th>SALARY</th><th>DATE</th><th>OPERATION</th></tr>

            <c:forEach items="${itemList}" var="item">
                <tr>
                    <td>${item.id}</td>
                    <td>${item.name}</td>
                    <td>${item.category.name}</td>
                    <td><img width="150" src="${pageContext.request.contextPath}/attached/items/${item.picUrl}"></td>
                    <td>${item.price}</td>
                    <td>
                        <a class="btn btn-primary btn-xs" href="${pageContext.request.contextPath}/admin/item/edit.do?id=${item.id}" >修改</a>
                        <a data-toggle="modal" data-target="#myAlert"
                           data-uid="${item.id }"
                           class="btn btn-danger btn-xs" href="#" >删除</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
<%------------------------------------------------------------------------------------%>
</body>
</html>

