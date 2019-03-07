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
<div class="header">
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

    <form class="form-signin" type="post" href="http://localhost:8088/page/generalLogin">
        <h2 class="form-signin-heading">Please sign in</h2>
        <%----------------------------------------------------------------------------------------------------------%>
        <label for="inputName" class="sr-only">Name</label>
        <input type="text" id="inputName" class="form-control" placeholder="Name" required>
        <label for="password" class="sr-only">Password</label>
        <input type="text" id="password" class="form-control" placeholder="Password" required>
        <label for="inputPhone" class="sr-only">Phone</label>
        <input type="text" id="inputPhone" class="form-control" placeholder="Phone" required>
        <label for="inputSex" class="sr-only">Sex</label>
        <input type="text" id="inputSex" class="form-control" placeholder="Sex" required>
        <label for="inputAge" class="sr-only">Age</label>
        <input type="text" id="inputAge" class="form-control" placeholder="Age" required>
        <%-----------------------------------------------------------------------------------------------------------%>
        <div class="login_div">
            <button class="btn btn-lg btn-primary btn-block" type="submit" id="query_admin">query</button>
        </div>
    </form>

    <form class="form-signin">
        <h2 class="form-signin-heading">Please sign in</h2>
        <label for="inputEmail" class="sr-only">Email address</label>
        <input type="email" id="inputEmail" class="form-control" placeholder="Email address" required autofocus>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" id="inputPassword" class="form-control" placeholder="Password" required>
        <div class="checkbox">
            <label>
                <input type="checkbox" value="remember-me"> Remember me
            </label>
        </div>

        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign</button>
    </form>
    <div class="pretty p-icon p-round p-plain p-smooth">
        <input type="radio" name="plain">
        <div class="state p-success-o">
            <i class="icon mdi mdi-heart"></i>
            <label>In relationship</label>
        </div>
    </div>
</div>

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
            success:function () {
                
            }
        })
    });
    $('#query_admin').click(function(){

    });
</script>
</body>
</html>

