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
    <script type="text/javascript" src="/static/js/jquery-3.3.1.js"></script>
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
                        <input type="text" class="form-control input-search" id="search" placeholder="Search">
                        <button type="submit" class="btn btn-danger btn-search">BEGIN</button>
                </div>
            </form>
        </div>

        <!---------------------- Table ---------------------->
        <table class="table" id="job-table">
            <tr class="info"><th>POSITION</th><th>COMPANY</th><th>LOCAL</th><th>SALARY</th><th>NUMBER</th><th>DATE</th><th>OPERATION</th></tr>
            <tr>
                <td>软件工程师</td>
                <td>阿里巴巴</td>
                <td>重庆市渝北区</td>
                <td>8-9K</td>
                <td>10人</td>
                <td>2019-01-21</td>
                <td>投递</td>
            </tr>
            <tr>
                <td>软件工程师</td>
                <td>阿里巴巴</td>
                <td>重庆市渝北区</td>
                <td>8-9K</td>
                <td>10人</td>
                <td>2019-01-21</td>
                <td>投递</td>
            </tr>

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
        <nav aria-label="Page navigation" style="text-align: center">
            <ul class="pagination">
                <li>
                    <a href="#" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
                <li><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li>
                    <a href="#" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </ul>
        </nav>
    </div>
<%------------------------------------------------------------------------------------%>
<script language="JavaScript">
    var url = "${pageContext.request.contextPath}/demo/queryAdminInfoBySelective";
    $(document).ready(function(){
        $.ajax({
            url:url,
            type:'POST',
            dataType:'JSON',
            data:{
                id:$('#search').val()
            },
            success: function (data) {
                var obj = '';
                var dataList = eval(data);
                for (var i in dataList) {
                    obj = obj + '<tr>';
                    obj +='<td>' + dataList[i].name + '</td>';
                    obj +='<td>' + dataList[i].name + '</td>';
                    obj +='<td>' + dataList[i].name + '</td>';
                    obj +='<td>' + dataList[i].name + '</td>';
                    obj +='<td>' + dataList[i].name + '</td>';
                    obj +='<td>' + dataList[i].name + '</td>';
                    obj +='<td>' + dataList[i].name + '</td>';
                    obj = obj + '</tr>';
                }
                $('#job-table').append(obj);
            },
            error: function () {
                alert();
            }
        });
    });
</script>
</body>
</html>

