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
<jsp:include page="/WEB-INF/jsp/ke/pageHead.jsp"></jsp:include>
<%--<nav class="navbar navbar-inverse navbar-fixed-top">--%>
    <%--<div class="container">--%>
        <%--<div class="navbar-header">--%>
            <%--<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">--%>
                <%--<span class="sr-only">Toggle navigation</span>--%>
                <%--<span class="icon-bar"></span>--%>
                <%--<span class="icon-bar"></span>--%>
                <%--<span class="icon-bar"></span>--%>
            <%--</button>--%>
            <%--<a class="navbar-brand" href="#">Deploma</a>--%>
        <%--</div>--%>
        <%--<div id="navbar" class="collapse navbar-collapse">--%>
            <%--<ul class="nav navbar-nav">--%>
                <%--<li class="active"><a href="#">Home</a></li>--%>
                <%--<li><a href="#about">About</a></li>--%>
                <%--<li><a href="#contact">Contact</a></li>--%>
            <%--</ul>--%>
            <%--<ul class="nav navbar-nav" style="float: right">--%>
                <%--<c:choose>--%>
                    <%--<c:when test="${ sessionScope.NAME != null }">--%>
                        <%--<li><a href="#">${ sessionScope.NAME}</a></li>--%>
                        <%--<li><a href="${pageContext.request.contextPath}/page/loginOut">Exit</a></li>--%>
                    <%--</c:when>--%>
                    <%--<c:otherwise>--%>
                        <%--<li><a href="">Login</a></li>--%>
                        <%--<li><a href="">Register</a></li>--%>
                    <%--</c:otherwise>--%>
                <%--</c:choose>--%>

            <%--</ul>--%>
        <%--</div><!--/.nav-collapse -->--%>
    <%--</div>--%>
<%--</nav>--%>
<div class="container">

    <form class="form-signin" type="post" href="http://localhost:8088/demo/queryUserInfoById">
        <h2 class="form-signin-heading">Please sign in</h2>
        <label for="inputName" class="sr-only">Name</label>
        <input type="text" id="inputName" class="form-control" placeholder="Name" required>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="text" id="inputPassword" class="form-control" placeholder="Password" required>
        <%-----------------------------------------------------------------------------------------------------------%>
        <div class="checkbox">
            <label>
                <input type="checkbox" value="remember-me"> Remember me
            </label>
            <label>
                <input type="radio" name="user_type" value="general"> general
                <input type="radio" name="user_type" value="company"> company
            </label>
        </div>
        <div class="login_div">
            <button class="btn btn-lg btn-primary btn-block" type="button" id="login">Sign in</button>
        </div>
    </form>
</div>
<script type="text/javascript">
    $('#login').on('click', function () {
        var type = $('input[name=user_type][type=radio]:checked').val();
        alert(type);
        var url;
        if (type === 'general')
            url = "${pageContext.request.contextPath}/demo/queryUserInfoById";
        else
            url = "${pageContext.request.contextPath}/demo/queryComInfoById";
        $.ajax({
            url:url,
            type:'POST',
            dataType:'json',
            data:{
                id:$('#inputName').val(),
                // password:$('#inputPassword').val(),
                // phone:$('#inputPhone').val(),
                // sex:$('#inputSex').val(),
                // age:$('#inputAge').val()
            },
        });
    });
</script>
</body>
</html>