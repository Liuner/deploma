<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>欢迎页</title>
    <link rel="stylesheet" href="static/css/Demo.css">
</head>
<body>
（这是一个maven下搭建的一个最基本的ssm框架） <br/>
<a href="${pageContext.request.contextPath}/demo/queryUserInfo">进入主页面</a>
<a href="${pageContext.request.contextPath}/demo/queryUserInfo">啦啦啦</a>

<button onclick="fun()">显示全部</button>
<script>
    function fun() {
        window.location.href="loginDemo";
    }
</script>
<p>ssm外置样式测试</p>
</body>
</html>
