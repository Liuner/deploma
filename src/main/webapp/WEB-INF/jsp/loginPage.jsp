<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>欢迎登录</title>
    <link rel="stylesheet" type="text/css" href="/static/css/style.css">
    <link rel="stylesheet" type="text/css" href="/static/css/Demo.css">
    <link rel="stylesheet" type="text/css" href="/static/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="/static/css/pretty-checkbox.min.css">
    <script type="text/javascript" src="/static/js/jquery-3.3.1.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/jsp/ke/pageHead.jsp" />
<div class="wrap">
    <ul class="tabs group">
        <li><a class="active" href="#/general">GENERAL</a></li>
        <li><a href="#/company">COMPANY</a></li>
        <li><a href="#/admin">ADMIN</a></li>
    </ul>

    <div id="content">
        <%--------------------------------------------general-------------------------------------------%>
        <form id="general" class="form-signin" type="post">
            <label for="generalId" class="sr-only">Name</label>
            <input type="text" id="generalId" class="form-control" placeholder="ID" required>

            <label for="generalPassword" class="sr-only">Phone</label>
            <input type="text" id="generalPassword" class="form-control" placeholder="Password" required>

            <div class="login_div">
                <button class="btn btn-lg btn-primary btn-block" style="margin-top: 10px" type="button" id="register_general">LOGIN</button>
            </div>
        </form>

        <%--------------------------------------------Company-------------------------------------------%>
        <form id="company" class="form-signin" type="post" style="display:none">
            <label for="cmpId" class="sr-only">CompanyName</label>
            <input type="text" id="cmpId" class="form-control" placeholder="ID" required>

            <label for="cmpPassword" class="sr-only">Password</label>
            <input type="text" id="cmpPassword" class="form-control" placeholder="Password" required>

            <div class="login_div">
                <button class="btn btn-lg btn-primary btn-block" style="margin-top: 10px" type="button" id="register_company">LOGIN</button>
            </div>
        </form>

        <%--------------------------------------------Admin-------------------------------------------%>
        <form id="admin" class="form-signin" type="post" style="display:none">
            <label for="adminId" class="sr-only">Name</label>
            <input type="text" id="adminId" class="form-control" placeholder="ID" required>

            <label for="adminPwd" class="sr-only">Password</label>
            <input type="text" id="adminPwd" class="form-control" placeholder="Password" required>

            <div class="login_div">
                <button class="btn btn-lg btn-primary btn-block" style="margin-top: 10px" type="button" id="register_admin">LOGIN</button>
            </div>
        </form>
        <%--------------------------------------------END-------------------------------------------%>
    </div>

</div>

    <script type="text/javascript" src="/static/js/index.js"></script>
    <script type="text/javascript" src="/static/js/jquery.min.js"></script>

    <script type="text/javascript">
        // -----------------------------GeneralRegister---------------------------------------
        $('#register_general').on('click', function () {
            var id = $('#generalId').val();
            var password = $('#generalPassword').val();
            if (id == "") {
                alert("Please Enter The ID！！！");
                location.reload();
                return false;
            }
            if (password == "") {
                alert("Please Enter The Password！！！");
                location.reload();
                return false;
            }
            $.ajax({
                url:'${pageContext.request.contextPath}/page/generalLogin',
                type:'POST',
                dataType:'json',
                data:{
                    id:id,
                    password:password
                },
                success:function (returnData) {
                    console.log(returnData);
                    var respCode = "0000";
                    if (returnData.respCode == respCode) {
                        window.location.href = "/page/logining";
                    } else {
                        alert("登录失败："+ returnData.respDesc);
                        location.reload();
                    }
                },
                error:function () {
                    alert("服务器休息呢，别吵吵!!!");
                }
            })
        });
        // --------------------------------CompanyRegister-----------------------------------------------------
        $('#register_company').on('click', function () {
            var id = $('#cmpId').val();
            var password = $('#cmpPassword').val();
            if (id == "") {
                alert("Please Enter The ID！！！");
                location.reload();
                return false;
            }
            if (password == "") {
                alert("Please Enter The Password！！！");
                location.reload();
                return false;
            }
            $.ajax({
                url:'${pageContext.request.contextPath}/page/companyLogin',
                type:'POST',
                dataType:'json',
                data:{
                    id:id,
                    password:password
                },
                success:function (returnData) {
                    console.log(returnData);
                    var respCode = "0000";
                    if (returnData.respCode == respCode) {
                        window.location.href = "/page/logining";
                    } else {
                        alert("登录失败："+ returnData.respDesc);
                        location.reload();
                    }
                },
                error:function () {
                    alert("服务器休息呢，别吵吵!!!");
                }
            })
        });
        // ---------------------------------AdminRegister-----------------------------------------------------
        $('#register_admin').on('click', function () {
            var id = $('#adminId').val();
            var password = $('#adminPwd').val();
            if (id == "") {
                alert("Please Enter The ID！！！");
                location.reload();
                return false;
            }
            if (password == "") {
                alert("Please Enter The Password！！！");
                location.reload();
                return false;
            }
            console.log(sex);
            $.ajax({
                url:'${pageContext.request.contextPath}/page/adminLogin',
                type:'POST',
                dataType:'json',
                data:{
                    id:id,
                    password:password
                },
                success:function (returnData) {
                    console.log(returnData);
                    var respCode = "0000";
                    if (returnData.respCode == respCode) {
                        window.location.href = "/page/logining";
                    } else {
                        alert("登录失败："+ returnData.respDesc);
                        location.reload();
                    }
                },
                error:function () {
                    alert("服务器休息呢，别吵吵!!!");
                }
            })
        })
    </script>
</body>
</html>
