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
<jsp:include page="/WEB-INF/jsp/lgs/pageHead.jsp" />
<div class="wrap">
    <ul class="tabs group">
        <li><a class="active" href="#/general">GENERAL</a></li>
        <li id="companyLi"><a href="#/company">COMPANY</a></li>
        <li><a href="#/admin">ADMIN</a></li>
    </ul>

    <div id="content">
        <%--------------------------------------------general-------------------------------------------%>
        <form id="general" class="form-signin" type="post">
            <label for="generalId" class="sr-only">Name</label>
            <input type="text" id="generalId" class="form-control" placeholder="ID" required>

            <div class="input-group">
                <span id="passwordSpan">
                    <label for="generalPassword" class="sr-only">Password</label>
                    <input type="password" id="generalPassword" class="form-control" placeholder="Password" required>
                </span>
                <span class="input-group-btn">
                    <button class="btn btn-default"  style="height: 34px;" type="button" id="showPwd">
                        <span class=" glyphicon glyphicon-eye-open" aria-hidden="true"></span>
                    </button>
                </span>
            </div>

            <div class="login_div">
                <button class="btn btn-lg btn-primary btn-block" style="margin-top: 10px" type="button" id="login_general">LOGIN</button>
            </div>
        </form>

        <%--------------------------------------------Company-------------------------------------------%>
        <form id="company" class="form-signin" type="post" style="display:none">
            <label for="cmpId" class="sr-only">CompanyName</label>
            <input type="text" id="cmpId" class="form-control" placeholder="ID" required>

            <div class="input-group">
                <span id="comPwdSpan">
                    <label for="cmpPassword" class="sr-only">Password</label>
                    <input type="password" id="cmpPassword" class="form-control" placeholder="Password" required>
                </span>
                <span class="input-group-btn">
                    <button class="btn btn-default"  style="height: 34px;" type="button" id="showComPwd">
                        <span class=" glyphicon glyphicon-eye-open" aria-hidden="true"></span>
                    </button>
                </span>
            </div>

            <div class="login_div">
                <button class="btn btn-lg btn-primary btn-block" style="margin-top: 10px" type="button" id="login_company">LOGIN</button>
            </div>
        </form>

        <%--------------------------------------------Admin-------------------------------------------%>
        <form id="admin" class="form-signin" type="post" style="display:none">
            <label for="adminId" class="sr-only">Name</label>
            <input type="text" id="adminId" class="form-control" placeholder="ID" required>

            <div class="input-group">
                <span id="adminPwdSpan">
                    <label for="adminPwd" class="sr-only">Password</label>
                    <input type="password" id="adminPwd" class="form-control" placeholder="Password" required>
                </span>
                <span class="input-group-btn">
                    <button class="btn btn-default"  style="height: 34px;" type="button" id="showAdminPwd">
                        <span class=" glyphicon glyphicon-eye-open" aria-hidden="true"></span>
                    </button>
                </span>
            </div>

            <div class="login_div">
                <button class="btn btn-lg btn-primary btn-block" style="margin-top: 10px" type="button" id="login_admin">LOGIN</button>
            </div>
        </form>
        <%--------------------------------------------END-------------------------------------------%>
    </div>

</div>

<script type="text/javascript" src="/static/js/index.js"></script>
<script type="text/javascript" src="/static/js/jquery.min.js"></script>

<script type="text/javascript">
    // -----------------------------GeneralRegister---------------------------------------
    $('#login_general').on('click', function () {
        var id = $('#generalId').val();
        var password = $('#generalPassword').val();
        if (id === "") {
            alert("Please Enter The ID！！！");
            return false;
        }
        if (password === "") {
            alert("Please Enter The Password！！！");
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
                if (returnData.respCode === respCode) {
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
    $('#login_company').on('click', function () {
        var id = $('#cmpId').val();
        var password = $('#cmpPassword').val();
        if (id === "") {
            alert("Please Enter The ID！！！");
            return false;
        }
        if (password === "") {
            alert("Please Enter The Password！！！");
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
                if (returnData.respCode === respCode) {
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
    $('#login_admin').on('click', function () {
        var id = $('#adminId').val();
        var password = $('#adminPwd').val();
        console.log("管理员登录")
        if (id === "") {
            alert("Please Enter The ID！！！");
            return false;
        }
        if (password === "") {
            alert("Please Enter The Password！！！");
            return false;
        }
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
                if (returnData.respCode === respCode) {
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

    //密码明文显示
    window.onload = function() {
        var btn=document.getElementById("showPwd");
        var pass=document.getElementById("generalPassword");
        var comBtn = document.getElementById("showComPwd");
        var comPwd = document.getElementById("cmpPassword");
        var adminBtn = document.getElementById("showAdminPwd");
        var adminPwd=document.getElementById("adminPwd");
        btn.onmousedown=function(){
            pass.type="text"
        };
        btn.onmouseup=btn.onmouseout=function(){
            pass.type="password"
        };
        comBtn.onmousedown=function(){
            comPwd.type="text"
        };
        comBtn.onmouseup=btn.onmouseout=function(){
            comPwd.type="password"
        };
        adminBtn.onmousedown=function(){
            adminPwd.type="text"
        };
        adminBtn.onmouseup=btn.onmouseout=function(){
            adminPwd.type="password"
        }
    };
</script>
</body>
</html>
