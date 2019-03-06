<%--
  Created by IntelliJ IDEA.
  User: Tannin
  Date: 2019/2/25
  Time: 22:48:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册界面</title>
    <link rel="stylesheet" type="text/css" href="/static/css/Demo.css">
    <link rel="stylesheet" type="text/css" href="/static/css/bootstrap.css">
    <script type="text/javascript" src="/static/js/jquery-3.3.1.js"></script>
    <link rel="stylesheet" type="text/css" href="/static/css/bootstrap.css">
    <script type="text/javascript" src="/static/js/jquery-3.3.1.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/jsp/ke/pageHead.jsp"></jsp:include>
<div class="container">
    <form class="form-signin" type="post" href="http://localhost:8088/demo/createAdminInfo">
        <h2 class="form-signin-heading">Please input details</h2>

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
                <input type="radio"  name="userType" value="general"> GENERAL
                <input type="radio"  name="userType" value="company"> COMPANY
            </label>
        </div>
        <div class="login_div">
            <button class="btn btn-lg btn-primary btn-block" type="button" id="register">REGISTER</button>
        </div>
    </form>
</div>
<script type="text/javascript">
    $('#register').on('click', function () {
        $.ajax({
            url:'http://localhost:8088/page/loginDemo',
            type:'POST',
            dataType:'json',
            data:{
                id:$('#inputName').val(),
                // password:$('#password').val()
            },
            success:
            function (result) {
                if (result) {
                    window.location.href='/page/index';
                }
                else {
                    alert("登录失败，账号或密码错误！");
                    location.reload();
                }
            },
            error :
            function () {
                alert("链接服务器失败！");
                location.reload();
            }
        });

    })
</script>
</body>
</html>
