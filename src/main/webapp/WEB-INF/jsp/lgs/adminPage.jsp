<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
    <title>Deploma</title>
    <link href="/static/css/Demo.css" rel="stylesheet">
    <link href="/static/css/bootstrap.css" rel="stylesheet">
    <link href="/static/css/dashboard.css" rel="stylesheet">

</head>

<body>
<jsp:include page="/WEB-INF/jsp/lgs/pageHead.jsp" />
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
            <ul class="nav nav-sidebar">
                <li class="active"><a href="#">TOOLBAR <span class="sr-only">(current)</span></a></li>
                <li class="btn-li"><button class="btn-tool" id="adminInfo">Admin Information</button></li>
                <li class="btn-li"><button class="btn-tool" id="generalInfo">General Manage</button></li>
                <li class="btn-li"><button class="btn-tool" id="companyInfo">Company Manage</button></li>
            </ul>
        </div>
        <%--------------------------------------------------------table-----------------------------------------------%>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <%------------------------------------------------Admin Information---------------------------------------%>
            <div id="adminTable" class="table-responsive">
                <h1 class="sub-header">Admin Information</h1>
                <%-------------------------------------------------------Modal-----------------------------------------------------------%>
                <div class="modal fade" id="adminInfo_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                    &times;
                                </button>
                                <h4 class="modal-title" id="companyInfoLabel">
                                    管理员信息
                                </h4>
                            </div>
                            <div class="modal-body" id="companyInfo_dev">
                                <label for="adminId" class="sr-only">ID</label>
                                <input type="text" id="adminId" class="form-control" placeholder="ID" disabled>

                                <label for="adminName" class="sr-only">Name</label>
                                <input type="text" id="adminName" class="form-control" placeholder="Name">

                                <label for="adminPwd" class="sr-only">Password</label>
                                <input type="text" id="adminPwd" class="form-control" placeholder="Password">

                                <label for="adminPhone" class="sr-only">Phone</label>
                                <input type="text" id="adminPhone" class="form-control" placeholder="Phone Number">

                                <label for="adminSex" class="sr-only">Sex</label>
                                <input type="text" id="adminSex" class="form-control" placeholder="Sex">

                                <label for="adminAge" class="sr-only">Phone</label>
                                <input type="text" id="adminAge" class="form-control" placeholder="Age">
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal" id="updateComCancel">取消</button>
                                <button type="button" class="btn btn-primary" id="updateAdmin">更新</button>
                            </div>
                        </div><!-- /.modal-content -->
                    </div><!-- /.modal -->
                </div>
                <%---------------------------------------------------------Table Area--------------------------------------------%>
                <table class="table table-striped" id="adminInfo_table">
                    <thead>
                    <tr class="info table_info_th"><th>NAME</th><th>PHONE</th><th>SEX</th><th>AGE</th><th>OPTION</th></tr>
                    </thead>
                </table>
            </div>

            <%------------------------------------------------General Manage------------------------------------------%>
            <div id="generalTable" class="table-responsive">
                <h1 class="sub-header">General Manage</h1>
                <form class="navbar-form" style="margin: 20px">
                    <div class="form-group">
                        <span style="font-weight:bold">用户名:</span>
                        <input type="text" class="form-control input-search" id= "searchName" placeholder="General Name">
                        <button type="button" class=" btn btn-danger btn-search" id="searchGeneral">BEGIN</button>
                    </div>
                </form>
                <%---------------------------------------------- 修改信息模态框（Modal）--------------------------------------------------------------%>
                <div class="modal fade" id="updateGeneralMadel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                    &times;
                                </button>
                                <h4 class="modal-title" id="ModalLabel">
                                    修改普通用户信息
                                </h4>
                            </div>
                            <div class="modal-body" id="general_dev">
                                <label for="generalId" class="sr-only">ID</label>
                                <input type="text" id="generalId" class="form-control" placeholder="ID" required disabled="disabled">

                                <label for="generalName" class="sr-only">NAME</label>
                                <input type="text" id="generalName" class="form-control" placeholder="Name" required>

                                <label for="generalPwd" class="sr-only">Passwrod</label>
                                <input type="text" id="generalPwd" class="form-control" placeholder="Password" required>

                                <label for="generalAge" class="sr-only">Local</label>
                                <input type="text" id="generalAge" class="form-control" placeholder="Age" required>

                                <label for="generalSex" class="sr-only">Salary</label>
                                <input type="text" id="generalSex" class="form-control" placeholder="Sex" required>

                                <label for="generalPhone" class="sr-only">Phone Number</label>
                                <input type="text" id="generalPhone" class="form-control" placeholder="Phone Number" required>

                                <label for="generalEmail" class="sr-only">E-Mail</label>
                                <input type="text" id="generalEmail" class="form-control" placeholder="E-Mail" required>

                                <label for="generalIdNumber" class="sr-only">ID-Number</label>
                                <input type="text" id="generalIdNumber" class="form-control" placeholder="ID-Number" required>

                                <label for="generalPhone" class="sr-only">Local</label>
                                <input type="text" id="generalLoal" class="form-control" placeholder="Local" required>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal" id="cancelGeneral">取消</button>
                                <button type="button" class="btn btn-primary" id="releaseGeneral">更新</button>
                            </div>
                        </div><!-- /.modal-content -->
                    </div><!-- /.modal -->
                </div>
                <%------------------------------------------------------Table区--------------------------------------------------------------%>
                <table class="table table-striped" id="general_table">
                    <thead>
                    <tr class="info table_info_th"><th>NAME</th><th>AGE</th><th>SEX</th><th>PHONE NUMBER</th>
                        <th>E-MAIL</th><th>ID-NUMBER</th><th>LOCAL</th><th>OPERATION</th></tr>
                    </thead>
                </table>
            </div>

            <%------------------------------------------------Company Manage------------------------------------------%>
            <div id="companyTable" class="table-responsive">
                <h1 class="sub-header">Company Manage</h1>
                <form class="navbar-form" style="margin: 20px">
                    <div class="form-group">
                        <span style="font-weight:bold">用户名:</span>
                        <input type="text" class="form-control input-search" id= "company" placeholder="Company Name">
                        <button type="button" class=" btn btn-danger btn-search" id="searchCompany">BEGIN</button>
                    </div>
                </form>
                <%---------------------------------------------- 修改信息模态框（Modal）--------------------------------------------------------------%>
                <div class="modal fade" id="updateCompanyMadel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                    &times;
                                </button>
                                <h4 class="modal-title" id="companyMadal">
                                    修改公司用户信息
                                </h4>
                            </div>
                            <div class="modal-body" id="company_dev">
                                <label for="companyId" class="sr-only">ID</label>
                                <input type="text" id="companyId" class="form-control" placeholder="ID" required disabled="disabled">

                                <label for="companyName" class="sr-only">NAME</label>
                                <input type="text" id="companyName" class="form-control" placeholder="Name" required>

                                <label for="companyPasword" class="sr-only">Password</label>
                                <input type="text" id="companyPasword" class="form-control" placeholder="Password" required>

                                <label for="companyEmail" class="sr-only">E-Mail</label>
                                <input type="text" id="companyEmail" class="form-control" placeholder="E-Mail" required>

                                <label for="companyCity" class="sr-only">City</label>
                                <input type="text" id="companyCity" class="form-control" placeholder="City" required>

                                <label for="companyData" class="sr-only">Rigster Date</label>
                                <input type="text" id="companyData" class="form-control" placeholder="Rigster Date" required>

                                <label for="companyNature" class="sr-only">Nature</label>
                                <input type="text" id="companyNature" class="form-control" placeholder="Nature" required>

                                <label for="companyNumber" class="sr-only">Company-Number</label>
                                <input type="text" id="companyNumber" class="form-control" placeholder="Company-Number" required>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal" id="companyCancel">取消</button>
                                <button type="button" class="btn btn-primary" id="releaseCompany">更新</button>
                            </div>
                        </div><!-- /.modal-content -->
                    </div><!-- /.modal -->
                </div>
                <%----------------------------------------------------Table Area---------------------------------------------------%>
                <table class="table table-striped" id="companyInfo_table">
                    <thead>
                    <tr class="info table_info_th"><th>NAME</th><th>E-MAIL</th><th>CITY</th><th>Register-Date</th>
                        <th>NATURE</th><th>NUMBER</th><th>OPTION</th></tr>
                    </thead>
                </table>
            </div>

        </div>
    </div>
</div>

<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="/static/js/bootstrap.js"></script>
<script src="/static/js/jquery.min.js"></script>
<script src="/static/js/bootstrap.js"></script>
<script src="/static/js/jquery.min.js"></script>

<script type="text/javascript">
    $(document).ready(function() {
        $('#generalTable').hide();
        $('#companyTable').hide();
        query();
    });

    $('#adminInfo').on('click', function () {
        $('#adminTable').show();
        $('#generalTable').hide();
        $('#companyTable').hide();
        query();
    });

    $('#generalInfo').on('click', function () {
        $('#adminTable').hide();
        $('#companyTable').hide();
        $('#generalTable').show();
        qryGeneralInfo();
    });

    $('#companyInfo').on('click', function () {
        $('#adminTable').hide();
        $('#generalTable').hide();
        $('#companyTable').show();
        qryCompanyInfo();
    });

    //查询管理员信息
    function query() {
        var id = "${sessionScope.ID}";
        console.log("sessionStorage.id="+id);
        $.ajax({
            url:"${pageContext.request.contextPath}/demo/queryAdminInfoById",
            type:'POST',
            dataType:'JSON',
            data:{
                id:id
            },
            success:function (resultData) {
                showData(resultData);
            },
            error:function () {
                alert("服务器休息呢！别吵吵！！！");
            }
        })
    };

    //查询管理员信息
    function qryGeneralInfo(generalName) {
        var name = '';
        if (generalName !== '' || generalName !== null) {
            name = generalName;
        }
        $.ajax({
            url:"${pageContext.request.contextPath}/demo/queryUserInfo",
            type:'POST',
            dataType:'JSON',
            data:{
                name:name
            },
            success:function (resultData) {
                var obj = '';
                var change = '<button type="button" class="btn btn-danger btn-search" data-toggle="modal" data-target="#updateGeneralMadel" id="changeGeneral">' +'CHANGE' +'</button>';
                var remove = '<button type="button" class="btn btn-danger btn-search" id="deleteGeneralInfo">' +'DELETE' +'</button>';
                var dataList = eval(resultData);
                if (dataList[0].respCode === "8888") {
                    alert(dataList[0].respDesc);
                    location.reload();
                }
                $('#general_table tr:gt(0)').remove();
                for (var i in dataList) {
                    obj = obj + '<tr class="table_info_tr" id='+ dataList[i].id +'>';
                    obj += '<td>' + dataList[i].name + '</td>';
                    obj += '<td>' + dataList[i].age + '</td>';
                    obj += '<td>' + dataList[i].sex + '</td>';
                    obj += '<td>' + dataList[i].phone + '</td>';
                    obj += '<td>' + dataList[i].e_maile + '</td>';
                    obj += '<td>' + dataList[i].idNumber + '</td>';
                    obj += '<td>' + dataList[i].local + '</td>';
                    obj +='<td>' + change + remove + '</td>';
                }
                $('#general_table').append(obj);
            },
            error:function () {
                alert("服务器休息呢！别吵吵！！！")
            }
        });
    }

    //查询公司用户信息
    function qryCompanyInfo(companyName) {
        var name = '';
        if (companyName !== '' || companyName !== null) {
            name = companyName;
        }
        console.log(name);
        $.ajax({
            url:"${pageContext.request.contextPath}/demo/queryAllComInfo",
            type:'POST',
            dataType:'JSON',
            data:{
                name:name
            },
            success:function (resultData) {
                var obj = '';
                var dataList = eval(resultData);
                var change = '<button type="button" class="btn btn-danger btn-search" data-toggle="modal" data-target="#updateCompanyMadel" id="changeCom">' +'CHANGE' +'</button>';
                var remove = '<button type="button" class="btn btn-danger btn-search" id="deleteCom">' +'DELETE' +'</button>';
                if (dataList[0].respCode === "8888") {
                    alert(dataList[0].respDesc);
                    location.reload();
                }
                $('#companyInfo_table tr:gt(0)').remove();
                //console.log(dataList);
                for (var i in dataList) {
                    //转换时间格式
                    console.log(dataList[i]);
                    var time = timeTrans(dataList[i].date);
                    obj = obj + '<tr class="table_info_tr" id='+ dataList[i].id +'>';
                    obj += '<td>' + dataList[i].name + '</td>';
                    obj += '<td>' + dataList[i].e_maile + '</td>';
                    obj += '<td>' + dataList[i].city + '</td>';
                    obj += '<td>' + time + '</td>';
                    obj += '<td>' + dataList[i].nature + '</td>';
                    obj += '<td>' + dataList[i].number + '</td>';
                    obj += '<td>' + change + remove + '</td>';
                }
                $('#companyInfo_table').append(obj);
            },
            error: function () {
                alert("服务器休息呢！别吵吵！！！")
            }
        })
    }

    //转换时间格式
    function timeTrans(value) {
        var dateString = value;
        var pattern = /(\d{4})(\d{2})(\d{2})/;
        return dateString.replace(pattern, '$1年$2月$3日');
    }

    //输出数据到表格
    function showData(resultData) {
        var obj = '';
        var change = '<button type="button" class="btn btn-danger btn-search" data-toggle="modal" data-target="#adminInfo_modal" id="updateAdminInfo">' +'CHANGE' +'</button>';
        var data = eval(resultData);
        if (data.respCode === "8888") {
            alert(data.respDesc);
        }
        $('#adminInfo_table tr:gt(0)').remove();
        obj = obj + '<tr class="table_info_tr" id='+ data.id +'>';
        obj += '<td>' + data.name + '</td>';
        obj += '<td>' + data.phone + '</td>';
        obj += '<td>' + data.sex + '</td>';
        obj += '<td>' + data.age + '</td>';
        obj +='<td>' + change + '</td>';
        $('#adminInfo_table').append(obj);
        console.log(data);
    }

    //更新公司信息(填充模态框)------------------------------------------
    $(document).on('click', '#updateAdminInfo', function () {
        var id = "${sessionScope.ID}";
        $.ajax({
            url:"${pageContext.request.contextPath}/demo/queryAdminInfoById",
            type:'POST',
            dataType:'JSON',
            data:{
                id:id
            },
            success:function (resultData) {
                if (resultData.respCode === "0000") {
                    $('#adminId').val(resultData.id);
                    $('#adminName').val(resultData.name);
                    $('#adminPwd').val(resultData.password);
                    $('#adminPhone').val(resultData.phone);
                    $('#adminSex').val(resultData.sex);
                    $('#adminAge').val(resultData.age);
                } else {
                    alert("查询信息失败")
                }
            },
            error:function () {
                alert("服务器休息呢！别吵吵！！！");
            }
        });
    });
    //更新公司信息提交
    $('#updateAdmin').on('click', function () {
        var id = "${sessionScope.ID}";
        $.ajax({
            url:'${pageContext.request.contextPath}/demo/updateAdminInfo',
            type:'POST',
            dataType:'JSON',
            data:{
                id:id,
                name:$('#adminName').val(),
                password:$('#adminPwd').val(),
                phone:$('#adminPhone').val(),
                sex:$('#adminSex').val(),
                age:$('#adminAge').val(),
            },
            success: function (resultData) {
                if (resultData.respCode === "0000") {
                    alert("更新成功！！！");
                    location.reload();
                } else {
                    alert("更新失败：" + resultData.respDesc );
                }
            },
            error: function () {
                alert("服务器没睡醒！！！");
            }
        });
    });

    //更改普通用户信息(填充模态框)---------------------------------------
    $(document).on('click', '#changeGeneral', function () {
        var id=$(this).parents("tr").attr("id");
        $.ajax({
            url:"${pageContext.request.contextPath}/demo/queryUserInfoById",
            type:'POST',
            dataType:'JSON',
            data:{
                id:id
            },
            success:function (resultData) {
                console.log(resultData);
                if (resultData.respCode === "0000") {
                    $('#generalId').val(resultData.id);
                    $('#generalName').val(resultData.name);
                    $('#generalPwd').val(resultData.password);
                    $('#generalAge').val(resultData.age);
                    $('#generalSex').val(resultData.sex);
                    $('#generalPhone').val(resultData.phone);
                    $('#generalEmail').val(resultData.e_maile);
                    $('#generalIdNumber').val(resultData.idNumber);
                    $('#generalLoal').val(resultData.local);
                } else {
                    alert("查询信息失败")
                }
            },
            error:function () {
                alert("服务器未响应！！！")
            }
        });
        //console.log("点击事件："+id);
    });
    //更新提交
    $('#releaseGeneral').on('click', function () {
        $.ajax({
            url:"${pageContext.request.contextPath}/demo/updataUserInfo",
            type:'POST',
            dataType:'JSON',
            data:{
                id:$('#generalId').val(),
                name:$('#generalName').val(),
                password:$('#generalPwd').val(),
                age:$('#generalAge').val(),
                sex:$('#generalSex').val(),
                phone:$('#generalPhone').val(),
                e_maile:$('#generalEmail').val(),
                idNumber:$('#generalIdNumber').val(),
                local:$('#generalLoal').val()
            },
            success:function (resultData) {
                if (resultData.respCode === "0000") {
                    alert("更新成功！！！");
                    location.reload();
                } else {
                    alert("更新失败:" + resultData.respDesc);
                }
            },
            error:function () {
                alert("服务器不在线 (-_-)");
            }
        })
    });
    //删除普通用户信息
    $(document).on('click', '#deleteGeneralInfo', function () {
        var id = $(this).parents("tr").attr("id");
        console.log(id);
        $.ajax({
            url:"${pageContext.request.contextPath}/demo/deleteUserInfo",
            type:'POST',
            dataType:'JSON',
            data:{
                id:id
            },
            success: function (resultData) {
                if (resultData.respCode === "0000") {
                    alert("删除成功");
                    qryGeneralInfo();
                }
                else {
                    alert(resultData.respDesc);
                }
            },
            error: function () {
                alert("服务器睡觉了吧 (>_<) ")
            }
        })
    });

    //更改公司用户信息(填充模态框)----------------------------------------
    $(document).on('click', '#changeCom', function () {
        var id = $(this).parents("tr").attr("id");
        $.ajax({
            url:'${pageContext.request.contextPath}/demo/queryComInfoById',
            type:'POST',
            dataType:'JSON',
            data:{
                id:id
            },
            success:function (resultData) {
                if (resultData.respCode === "0000") {
                    $('#companyId').val(resultData.id);
                    $('#companyName').val(resultData.name);
                    $('#companyPasword').val(resultData.password);
                    $('#companyEmail').val(resultData.e_maile);
                    $('#companyCity').val(resultData.city);
                    $('#companyData').val(resultData.date);
                    $('#companyNature').val(resultData.nature);
                    $('#companyNumber').val(resultData.number);
                } else {
                    alert("查询失败");
                    location.reload();
                }
            },
            error:function () {
                alert("服务器不在线 (-_-)");
            }
        })
    });
    //提交更新
    $('#releaseCompany').on('click', function () {
        $.ajax({
            url:"${pageContext.request.contextPath}/demo/updateComInfoById",
            type:'POST',
            dataType:'JSON',
            data:{
                id:$('#companyId').val(),
                name:$('#companyName').val(),
                password:$('#companyPasword').val(),
                e_maile:$('#companyEmail').val(),
                city:$('#companyCity').val(),
                date:$('#companyData').val(),
                nature:$('#companyNature').val(),
                number:$('#companyNumber').val()
            },
            success:function (resultData) {
                if (resultData.respCode === "0000") {
                    alert("更新成功！！！");
                    location.reload();
                } else {
                    alert("更新失败:" + resultData.respDesc);
                }
            },
            error:function () {
                alert("服务器不在线 (-_-)");
            }
        })
    });
    //删除公司用户信息
    $(document).on('click', '#deleteCom', function () {
        var id = $(this).parents("tr").attr("id");
        console.log(id);
        $.ajax({
            url:"${pageContext.request.contextPath}/demo/deleteComInfoById",
            type:'POST',
            dataType:'JSON',
            data:{
                id:id
            },
            success: function (resultData) {
                if (resultData.respCode === "0000") {
                    alert("删除成功");
                    qryGeneralInfo();
                }
                else {
                    alert(resultData.respDesc);
                }
            },
            error: function () {
                alert("服务器睡觉了吧 (>_<) ")
            }
        })
    });

    // todo 普通用户搜索
    $('#searchGeneral').on('click', function () {
        var name = $('#searchName').val();
        // console.log("generalName"+name);
        qryGeneralInfo(name);
        $('#searchName').val('');
    });
    //todo  公司用户收索
    $('#searchCompany').on('click', function () {
        var name = $('#company').val();
        // console.log(name);
        qryCompanyInfo(name);
        $('#company').val('');
    })

</script>
</body>
</html>