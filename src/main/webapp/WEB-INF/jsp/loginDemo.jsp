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
            url = "${pageContext.request.contextPath}/page/generalLogin";
        else
            url = "${pageContext.request.contextPath}/demo/queryComInfoById";
        $.ajax({
            url:url,
            type:'POST',
            dataType:'json',
            data:{
                id:$('#inputName').val(),
                password:$('#inputPassword').val(),
            },
            success: function (returnData) {
                console.log(returnData);
                var respCode = "0000";
                if (returnData.respCode == respCode) {
                    //alert("查询成功");
                   window.location.href = "/page/index";
                }
                else{
                    alert(returnData.respDesc);
                    location.reload();
                }
            },
            error: function () {
                alert("服务器休息呢，别吵吵!!!")
            }
        });
    });
</script>
</body>
</html>