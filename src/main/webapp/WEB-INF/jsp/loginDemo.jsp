<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>>
<html>
<head>
    <title>欢迎登录</title>
    <link rel="stylesheet" type="text/css" href="/static/css/Demo.css">
    <link rel="stylesheet" type="text/css" href="/static/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="/static/css/pretty-checkbox.min.css"/>
    <script type="text/javascript" src="/static/js/jquery-3.3.1.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/jsp/ke/pageHead.jsp"></jsp:include>

<div class="container">

    <form class="form-signin" type="post" href="http://localhost:8088/demo/queryUserInfoById">
        <h2 class="form-signin-heading">Please sign in</h2>
        <label for="inputId" class="sr-only">Name</label>
        <c:choose>
            <c:when test="${ sessionScope.ID != null }">
                <input type="text" id="inputId" class="form-control" placeholder="Name" value="${sessionScope.ID}" required>
                <% session.invalidate(); %>
            </c:when>
            <c:otherwise>
                <input type="text" id="inputId" class="form-control" placeholder="Name" required>
            </c:otherwise>
        </c:choose>

        <label for="inputPassword" class="sr-only">Password</label>
        <input type="text" id="inputPassword" class="form-control" placeholder="Password" required>

        <div class="pretty p-switch p-fill">
            <input type="radio" name="user_type" id="general" value="general"/>
            <div class="state p-success">
                <label for="general">GENERAL</label>
            </div>
        </div>
        <div class="pretty p-switch p-fill">
            <input type="radio" name="user_type" id="company" value="company"/>
            <div class="state p-success">
                <label for="general">COMPANY</label>
            </div>
        </div>
        <div class="pretty p-switch p-fill">
            <input type="radio" name="user_type" id="admin" value="admin"/>
            <div class="state p-success">
                <label for="general">ADMIN</label>
            </div>
        </div>
        <%----------------------------------radio--------------------------------------------%>

        <div class="login_div">
            <button class="btn btn-lg btn-primary btn-block" style="margin-top: 10px" type="button" id="login">Sign in</button>
        </div>
    </form>
</div>
<script type="text/javascript">
    $('#login').on('click', function () {
        <%-----------------------------添加判断开始-----------------------------------%>
        var name = $('#inputId').val();
        var pwd = $('#inputPassword').val();
        if (name == null || name == "") {
            alert("请输入用户ID!!!");
            location.reload();
            return false;
        }
        if (pwd == null || pwd == "") {
            alert("请输入密码!!!");
            return false;
        }
        <%-----------------------------添加判断结束-----------------------------------%>
        var type = $('input[name=user_type][type=radio]:checked').val();
        var url;
        if (type === 'general')
            url = "${pageContext.request.contextPath}/page/generalLogin";
        else if(type === 'company')
            url = "${pageContext.request.contextPath}/page/companyLogin";
        else if(type === 'admin')
            url = "${pageContext.request.contextPath}/page/adminLogin";
        else {
            alert("请选择用户类型");
            return false;
        }
        $.ajax({
            url:url,
            type:'POST',
            dataType:'json',
            data:{
                id:name,
                password:pwd,
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
                alert("服务器休息呢，别吵吵!!!");
                location.reload();
            }
        });
    });
</script>
</body>
</html>