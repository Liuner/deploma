<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>欢迎注册</title>
    <link rel="stylesheet" type="text/css" href="/static/css/style.css">
    <link rel="stylesheet" type="text/css" href="/static/css/Demo.css">
    <link rel="stylesheet" type="text/css" href="/static/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="/static/css/pretty-checkbox.min.css">
    <script type="text/javascript" src="/static/js/jquery-3.3.1.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/jsp/lgs/pageHead.jsp"/>
<div class="wrap">
    <ul class="tabs group">
        <li><a class="active" href="#/one">GENERAL</a></li>
        <li><a href="#/two">COMPANY</a></li>
        <li><a href="#/three">ADMIN</a></li>
    </ul>

    <div id="content">
        <%--------------------------------------------general-------------------------------------------%>
        <form id="one" class="form-signin" type="post">
            <label for="generalName" class="sr-only">Name</label>
            <input type="text" id="generalName" class="form-control" placeholder="Name" required>

            <label for="generalPassword" class="sr-only">Phone</label>
            <input type="text" id="generalPassword" class="form-control" placeholder="Password" required>

            <label for="generalPhone" class="sr-only">Phone</label>
            <input type="text" id="generalPhone" class="form-control" placeholder="Phone" required>

            <label for="generalAge" class="sr-only">age</label>
            <input type="text" id="generalAge" class="form-control" placeholder="Age" required>

            <label for="generalEmail" class="sr-only">E-Mail</label>
            <input type="text" id="generalEmail" class="form-control" placeholder="E-Mail" required>

            <label for="generalNumber" class="sr-only">ID-Number</label>
            <input type="text" id="generalNumber" class="form-control" placeholder="ID-Number" required>

            <label for="generalLocal" class="sr-only">Local</label>
            <input type="text" id="generalLocal" class="form-control" placeholder="Local" required>

            <div class="pretty p-switch p-fill">
                <input type="radio" name="generalSex" id="generalNameMan" value="man"/>
                <div class="state p-success">
                    <label for="man">MAN</label>
                </div>
            </div>
            <div class="pretty p-switch p-fill">
                <input type="radio" name="generalSex" id="generalFemale" value="female"/>
                <div class="state p-success">
                    <label for="female">FEMALE</label>
                </div>
            </div>
            <div class="login_div">
                <button class="btn btn-lg btn-primary btn-block" style="margin-top: 10px" type="button" id="register_general">REGISTER</button>
            </div>
        </form>

        <%--------------------------------------------Company-------------------------------------------%>
        <form id="two" class="form-signin" type="post" style="display:none">
            <label for="cmpName" class="sr-only">CompanyName</label>
            <input type="text" id="cmpName" class="form-control" placeholder="CompanyName" required>

            <label for="cmpPassword" class="sr-only">Password</label>
            <input type="text" id="cmpPassword" class="form-control" placeholder="Password" required>

            <label for="cmpEmail" class="sr-only">E-Mail</label>
            <input type="text" id="cmpEmail" class="form-control" placeholder="E-MAIL" required>

            <label for="cmpCity" class="sr-only">City</label>
            <input type="text" id="cmpCity" class="form-control" placeholder="City" required>

            <label for="cmpNature" class="sr-only">Nature</label>
            <input type="text" id="cmpNature" class="form-control" placeholder="Nature" required>

            <label for="cmpNumber" class="sr-only">Number</label>
            <input type="text" id="cmpNumber" class="form-control" placeholder="Number" required>

            <label for="RegistrationDate" class="sr-only">RegistrationDate</label>
            <input type="text" id="RegistrationDate" class="form-control" placeholder="EXP:20190328" required>

            <div class="login_div">
                <button class="btn btn-lg btn-primary btn-block" style="margin-top: 10px" type="button" id="register_company">REGISTER</button>
            </div>
        </form>

        <%--------------------------------------------Admin-------------------------------------------%>
        <form id="three" class="form-signin" type="post" style="display:none">
            <label for="adminName" class="sr-only">Name</label>
            <input type="text" id="adminName" class="form-control" placeholder="Name" required>

            <label for="adminPwd" class="sr-only">Password</label>
            <input type="text" id="adminPwd" class="form-control" placeholder="Password" required>

            <label for="adminPhone" class="sr-only">Phone</label>
            <input type="text" id="adminPhone" class="form-control" placeholder="Phone" required>

            <label for="adminAge" class="sr-only">Age</label>
            <input type="text" id="adminAge" class="form-control" placeholder="Age" required>

            <div class="pretty p-switch p-fill">
                <input type="radio" name="adminSex" id="man" value="man"/>
                <div class="state p-success">
                    <label for="man">MAN</label>
                </div>
            </div>
            <div class="pretty p-switch p-fill">
                <input type="radio" name="adminSex" id="female" value="female"/>
                <div class="state p-success">
                    <label for="female">FEMALE</label>
                </div>
            </div>
            <div class="login_div">
                <button class="btn btn-lg btn-primary btn-block" style="margin-top: 10px" type="button" id="register_admin">REGISTER</button>
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
        var sex = $('input[name=generalSex][type=radio]:checked').val();
        $.ajax({
            url:'http://localhost:8088/demo/createUserInfo',
            type:'POST',
            dataType:'json',
            data:{
                name:$('#generalName').val(),
                password:$('#generalPassword').val(),
                phone:$('#generalPhone').val(),
                age:$('#generalAge').val(),
                e_maile:$('#generalEmail').val(),
                idNumber:$('#generalNumber').val(),
                local:$('#generalLocal').val(),
                sex:sex
            },
            success:function (returnData) {
                console.log(returnData);
                var respCode = "0000";
                if (returnData.respCode == respCode) {
                    alert("注册成功!!!" + "请牢记账号：" +  returnData.id);
                    window.location.href = "/page/login";
                } else {
                    alert("注册失败："+ returnData.respDesc);
                }
            },
            error:function () {
                alert("服务器休息呢，别吵吵!!!");
            }
        })
    });
    // --------------------------------CompanyRegister-----------------------------------------------------
    $('#register_company').on('click', function () {
        $.ajax({
            url:'http://localhost:8088/demo/createComInfo',
            type:'POST',
            dataType:'json',
            data:{
                name:$('#cmpName').val(),
                password:$('#cmpPassword').val(),
                e_maile:$('#cmpEmail').val(),
                city:$('#cmpCity').val(),
                nature:$('#cmpNature').val(),
                number:$('#cmpNumber').val(),
                date:$('#RegistrationDate').val()
            },
            success:function (returnData) {
                console.log(returnData);
                var respCode = "0000";
                if (returnData.respCode == respCode) {
                    alert("注册成功!!!" +"/n"+ "请牢记账号：" +  returnData.id);
                    window.location.href = "/page/login";
                } else {
                    alert("注册失败："+ returnData.respDesc);
                }
            },
            error:function () {
                alert("服务器休息呢，别吵吵!!!");
            }
        })
    });
    // ---------------------------------AdminRegister-----------------------------------------------------
    $('#register_admin').on('click', function () {
        var sex = $('input[name=adminSex][type=radio]:checked').val();
        console.log(sex);
        $.ajax({
            url:'http://localhost:8088/demo/createAdminInfo',
            type:'POST',
            dataType:'json',
            data:{
                name:$('#adminName').val(),
                password:$('#adminPwd').val(),
                phone:$('#adminPhone').val(),
                age:$('#adminAge').val(),
                sex:sex
            },
            success:function (resultData) {
                var respCode = "0000";
                if (resultData.respCode == respCode) {
                    alert("注册成功!!!" + "请牢记账号：" +  resultData.id);
                    window.location.href = "/page/login";
                } else {
                    alert("注册失败：" + resultData.respDesc);
                }
            },
            error:function () {
                alert("服务器休息呢，别吵吵!!!")
            }
        })
    })
</script>
</body>
</html>
