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
    <script type="text/javascript" src="/static/js/jquery-3.3.1.js"></script>
</head>
<body>
<div class="header">
    <%--<div class="nag">--%>
        <%--<div class="in">--%>
        <%--<span class="gp">|</span>--%>
        <%--<span class="tl">欢迎登录</span>--%>
        <%--<p class="nlink">--%>
            <%--<a href="/WEB-INF/jsp/imitationDemo.jsp">首页</a>--%>
        <%--</p>--%>
        <%--</div>--%>
    <%--</div>--%>
</div>

<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Deploma</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="#">Home</a></li>
                <li><a href="#about">About</a></li>
                <li><a href="#contact">Contact</a></li>
            </ul>
            <ul class="nav navbar-nav" style="float: right">
                <c:choose>
                    <c:when test="${ sessionScope.NAME != null }">
                        <li><a href="#">${ sessionScope.NAME}</a></li>
                        <li><a href="${pageContext.request.contextPath}/page/loginOut">Exit</a></li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="">Register</a></li>
                        <li><a href="">Exit</a></li>
                    </c:otherwise>
                </c:choose>

            </ul>
        </div><!--/.nav-collapse -->
    </div>
</nav>
<div class="container">

    <form class="form-signin" type="post" href="http://localhost:8088/demo/createAdminInfo">
        <h2 class="form-signin-heading">Please sign in</h2>
        <%--<label for="inputEmail" class="sr-only">Email address</label>--%>
        <%--<input type="email" id="inputEmail" class="form-control" placeholder="Email address" required autofocus>--%>
        <%--<label for="inputPassword" class="sr-only">Password</label>--%>
        <%--<input type="password" id="inputPassword" class="form-control" placeholder="Password" required>--%>
        <%----------------------------------------------------------------------------------------------------------%>
        <label for="inputName" class="sr-only">Name</label>
        <input type="text" id="inputName" class="form-control" placeholder="Name" required>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="text" id="inputPassword" class="form-control" placeholder="Password" required>
        <label for="inputPhone" class="sr-only">Phone</label>
        <input type="text" id="inputPhone" class="form-control" placeholder="Phone" required>
        <label for="inputSex" class="sr-only">Sex</label>
        <input type="text" id="inputSex" class="form-control" placeholder="Sex" required>
        <label for="inputAge" class="sr-only">Age</label>
        <input type="text" id="inputAge" class="form-control" placeholder="Age" required>
        <%-----------------------------------------------------------------------------------------------------------%>
        <div class="checkbox">
            <label>
                <input type="checkbox" value="remember-me"> Remember me
            </label>
        </div>
        <div class="login_div">
            <button class="btn btn-lg btn-primary btn-block" type="button" id="register_admin">Sign in</button>
        </div>
        <div class="login_div">
            <button class="btn btn-lg btn-primary btn-block" type="button" id="query_admin">query</button>
        </div>
    </form>
</div>
<script type="text/javascript">
    $('#register_admin').on('click', function () {
        $.ajax({
            url:'http://localhost:8088/demo/createAdminInfo',
            type:'POST',
            dataType:'json',
            data:{
                name:$('#inputName').val(),
                password:$('#inputPassword').val(),
                phone:$('#inputPhone').val(),
                sex:$('#inputSex').val(),
                age:$('#inputAge').val()
            },
            // success:function(result) {
            //     <!-- 处理后端返回的数据 -->
            //     var message= JSON.stringify(result);
            //     //alert("查询成功" + message);
            //     var name = JSON.stringify(name, result.name);
            //     alert(name);
            // },
            // error:function(result){
            //     var message= JSON.stringify(result);
            //     $("#select-box").html("查询失败" + message);
            // }
        })
    });
    $('#query_admin').click(function(){
        $.ajax({
            url:'http://localhost:8088/demo/queryAdminInfo',
            type:'POST',
            data:{
            },
            success: function (result) {
                jsonData = JSON.parse(result);
                alert(jsonData);
                for (x in jsonData) {
                    for (y in jsonData.data) {
                        alert(y);
                        alert(jsonData.age);
                        alert(jsonData.name);
                    }
                }
            }
        });
    });
</script>
</body>
</html>

