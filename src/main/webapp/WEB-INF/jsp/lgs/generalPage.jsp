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
                <li class="btn-li"><button class="btn-tool" id="personInfo">Personal Information</button></li>
                <li class="btn-li"><button class="btn-tool" id="resumeManage">Resume Management</button></li>
                <li class="btn-li"><button class="btn-tool" id="jobInfo">Posted Position</button></li>
            </ul>
        </div>
        <%------------------------------------------------personal Information----------------------------------------------------------%>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <div id="infoTable" class="table-responsive">
                <h1 class="sub-header">Personal Information</h1>
                <%----------------------------------------------------Modal--------------------------------------------------------%>
                <div class="modal fade" id="updateInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                    &times;
                                </button>
                                <h4 class="modal-title" id="ModalLabel">
                                    用户信息
                                </h4>
                            </div>
                            <div class="modal-body" id="positionInfoU">
                                <label for="id" class="sr-only">ID</label>
                                <input type="text" id="id" class="form-control" placeholder="PostionID" required disabled="disabled">

                                <label for="name" class="sr-only">Name</label>
                                <input type="text" id="name" class="form-control" placeholder="Name" required>

                                <label for="age" class="sr-only">Age</label>
                                <input type="text" id="age" class="form-control" placeholder="Age">

                                <label for="sex" class="sr-only">Sex</label>
                                <input type="text" id="sex" class="form-control" placeholder="Sex" required>

                                <label for="phone" class="sr-only">Phone</label>
                                <input type="text" id="phone" class="form-control" placeholder="Phone" required>

                                <label for="e_maile" class="sr-only">E-mail</label>
                                <input type="text" id="e_maile" class="form-control" placeholder="E-mail" required>

                                <label for="idNumber" class="sr-only">ID_Number</label>
                                <input type="text" id="idNumber" class="form-control" placeholder="ID_Number" required>

                                <label for="local" class="sr-only">Local</label>
                                <input type="text" id="local" class="form-control" placeholder="Local" required>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal" id="cancel">取消</button>
                                <button type="button" class="btn btn-primary" id="submit">更新</button>
                            </div>
                        </div><!-- /.modal-content -->
                    </div><!-- /.modal -->
                </div>
                <%-------------------------------------------------------Table Area-----------------------------------------------%>
                <table class="table table-striped" id="personInfo_table">
                    <thead>
                    <tr class="info table_info_th"><th>NAME</th><th>AGE</th><th>SEX</th><th>PHONE</th>
                        <th>E-MAIL</th><th>ID-NUMBER</th><th>LOCAL</th><th>OPERATION</th></tr>
                    </thead>
                </table>
            </div>

            <%------------------------------------------------Resume Management----------------------------------------------------------%>
            <div id="resumeTable" class="table-responsive">
                <h1 class="sub-header">Resume Management</h1>
                <%-----------------------------------------------------Modal------------------------------------------------------------%>
                <button class="btn btn-danger btn-search add-btn" data-toggle="modal" data-target="#resume_dev" style="margin: 10px; margin-right: 20px">
                    ADD
                </button>
                <%---------------------------------------------- 添加信息模态框（Modal）--------------------------------------------------------------%>
                <div class="modal fade" id="resume_dev" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                    &times;
                                </button>
                                <h4 class="modal-title" id="myModalLabel">
                                    简历信息
                                </h4>
                            </div>
                            <div class="modal-body" id="positionInfo">
                                <label for="nameResume" class="sr-only">Name</label>
                                <input type="text" id="nameResume" class="form-control" placeholder="Name" required>

                                <label for="ageResume" class="sr-only">Age</label>
                                <input type="text" id="ageResume" class="form-control" placeholder="Age" required>

                                <label for="sexResume" class="sr-only">Sex</label>
                                <input type="text" id="sexResume" class="form-control" placeholder="Sex" required>

                                <label for="phoneResume" class="sr-only">Phone</label>
                                <input type="text" id="phoneResume" class="form-control" placeholder="Phone" required>

                                <label for="eMailResume" class="sr-only">E-Mail</label>
                                <input type="text" id="eMailResume" class="form-control" placeholder="E-Mail" required>

                                <label for="localResume" class="sr-only">Local</label>
                                <input type="text" id="localResume" class="form-control" placeholder="Local" required>

                                <label for="majorResume" class="sr-only">Major</label>
                                <input type="text" id="majorResume" class="form-control" placeholder="Major" required>

                                <label for="favriteResume" class="sr-only">Favrite</label>
                                <input type="text" id="favriteResume" class="form-control" placeholder="Favrite" required>

                                <label for="slarayResume" class="sr-only">Slaray</label>
                                <input type="text" id="slarayResume" class="form-control" placeholder="Slaray" required>

                                <label for="remarkResume" class="sr-only">Remark</label>
                                <input type="text" id="remarkResume" class="form-control" placeholder="Remark" required>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal" id="cancelResume">取消</button>
                                <button type="button" class="btn btn-primary" id="release">提交</button>
                            </div>
                        </div><!-- /.modal-content -->
                    </div><!-- /.modal -->
                </div>
                <%-------------------------------------------------------update Modal------------------------------------------------%>
                <div class="modal fade" id="update_dev" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                    &times;
                                </button>
                                <h4 class="modal-title" id="updateModalLabel">
                                    简历信息
                                </h4>
                            </div>
                            <div class="modal-body" id="updateInfo_dev">
                                <label for="idResumeU" class="sr-only">ID</label>
                                <input type="text" id="idResumeU" class="form-control" placeholder="ID" required disabled>

                                <label for="nameResumeU" class="sr-only">Name</label>
                                <input type="text" id="nameResumeU" class="form-control" placeholder="Name" required>

                                <label for="ageResumeU" class="sr-only">Age</label>
                                <input type="text" id="ageResumeU" class="form-control" placeholder="Age" required>

                                <label for="sexResumeU" class="sr-only">Sex</label>
                                <input type="text" id="sexResumeU" class="form-control" placeholder="Sex" required>

                                <label for="phoneResumeU" class="sr-only">Phone</label>
                                <input type="text" id="phoneResumeU" class="form-control" placeholder="Phone" required>

                                <label for="eMailResumeU" class="sr-only">E-Mail</label>
                                <input type="text" id="eMailResumeU" class="form-control" placeholder="E-Mail" required>

                                <label for="localResumeU" class="sr-only">Local</label>
                                <input type="text" id="localResumeU" class="form-control" placeholder="Local" required>

                                <label for="majorResumeU" class="sr-only">Major</label>
                                <input type="text" id="majorResumeU" class="form-control" placeholder="Major" required>

                                <label for="favriteResumeU" class="sr-only">Favrite</label>
                                <input type="text" id="favriteResumeU" class="form-control" placeholder="Favrite" required>

                                <label for="slarayResumeUU" class="sr-only">Slaray</label>
                                <input type="text" id="slarayResumeUU" class="form-control" placeholder="Slaray" required>

                                <label for="remarkResumeU" class="sr-only">Remark</label>
                                <input type="text" id="remarkResumeU" class="form-control" placeholder="Remark" required>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal" id="cancelUpdate">取消</button>
                                <button type="button" class="btn btn-primary" id="update">更新</button>
                            </div>
                        </div><!-- /.modal-content -->
                    </div><!-- /.modal -->
                </div>

                <%------------------------------------------------------Table-----------------------------------------------------------%>
                <table class="table table-striped" id="resume_table">
                    <thead>
                    <tr class="info table_info_th"><th>NAME</th><th>AGE</th><th>SEX</th><th>PHONE</th>
                        <th>E_MAIL</th><th>LOCAL</th><th>MAJOR</th><th>FAVRITE</th><th>SLARAY</th><th>REMARK</th><th style="min-width: 195px">OPTIONS</th></tr>
                    </thead>
                </table>
            </div>

            <%------------------------------------------------Check Out Job Vacancies-----------------------------------------------------%>
            <div id="jobTable" class="table-responsive">
                <h1 class="sub-header">Posted position</h1>
                <table class="table table-striped" id="sentJob_table">
                    <thead>
                    <tr class="info table_info_th"><th>POSITION</th><th>COMPANY</th><th>LOCAL</th><th>SALARY</th>
                        <th>NUMBER</th><th>POST-DATE</th><th>FLAG</th></tr>
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
        $('#jobTable').hide();
        $('#resumeTable').hide();
        query();
    });

    $('#personInfo').on('click', function () {
        $('#infoTable').show();
        $('#resumeTable').hide();
        $('#jobTable').hide();
        query();
    });

    $('#resumeManage').on('click', function () {
        $('#infoTable').hide();
        $('#jobTable').hide();
        $('#resumeTable').show();
        qryResume();
    });

    $('#jobInfo').on('click', function () {
        $('#infoTable').hide();
        $('#resumeTable').hide();
        $('#jobTable').show();
        qrySentJob();
    });
    //查询用户信息
    function query() {
        var id = "${sessionScope.ID}";
        $.ajax({
            url:"${pageContext.request.contextPath}/demo/queryUserInfo",
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
    }
    //查询简历信息
    function qryResume() {
        var id = "${sessionScope.ID}";
        $.ajax({
            url:"${pageContext.request.contextPath}/demo/qryResumeInfo",
            type:'POST',
            dataType:'JSON',
            data:{
                generalId:id
            },
            success:function (resultData) {
                var obj = '';
                var change = '<button type="button" class="btn btn-danger btn-search" data-toggle="modal" data-target="#update_dev" id="changeResume">' +'CHANGE' +'</button>';
                var remove = '<button type="button" class="btn btn-danger btn-search" id="delete">' +'DELETE' +'</button>';
                var data = eval(resultData);
                if (data.respCode === "8888") {
                    alert(data.respDesc);
                }
                var rows = data.rows;
                $('#resume_table tr:gt(0)').remove();
                for (var i in rows) {
                    var favtite =rows[i].favrite;
                    if (favtite == null || favtite == "") {
                        favtite = "-";
                    }
                    obj = obj + '<tr class="table_info_tr" id='+ rows[i].id +'>';
                    obj += '<td>' + rows[i].name + '</td>';
                    obj += '<td>' + rows[i].age + '</td>';
                    obj += '<td>' + rows[i].sex + '</td>';
                    obj += '<td>' + rows[i].phone + '</td>';
                    obj += '<td>' + rows[i].eMail + '</td>';
                    obj += '<td>' + rows[i].local + '</td>';
                    obj += '<td>' + rows[i].major + '</td>';
                    obj += '<td>' + favtite + '</td>';
                    obj += '<td>' + rows[i].slaray + '</td>';
                    obj += '<td>' + rows[i].remark + '</td>';
                    obj +='<td>' + change + remove + '</td>';
                }
                $('#resume_table').append(obj);
            },
            error:function () {
                alert("服务器休息呢！别吵吵！！！")
            }
        })
    }
    //查询已投递的职位及状态
    function qrySentJob() {
        var id = "${sessionScope.ID}";
        // console.log("ID" + a);
        $.ajax({
            url:"${pageContext.request.contextPath}/demo/generalQueryJobInfo",
            type:'POST',
            dataType:'JSON',
            data:{
                id:id
            },
            success:function (resultData) {
                var obj = '';
                var dataList = eval(resultData);
                if (dataList[0].respCode === "8888") {
                    alert(dataList[0].respDesc);
                    location.reload();
                }
                $('#sentJob_table tr:gt(0)').remove();
                var flagName = "";
                for (var i in dataList) {
                    var flag = dataList[i].flag;
                    // console.log(flag);
                    // console.log("dataList[i]:" + dataList[i].flag);
                    //翻译状态
                    if (flag === "0") {
                        flagName = "未读";
                    } else if (flag === "1") {
                        flagName = "已读";
                    } else {
                        flagName = "邀请面试";
                    }
                    //转换时间格式
                    var time = timeTrans(dataList[i].date);
                    obj = obj + '<tr class="table_info_tr" id='+ dataList[i] +'>';
                    obj += '<td>' + dataList[i].position + '</td>';
                    obj += '<td>' + dataList[i].company + '</td>';
                    obj += '<td>' + dataList[i].local + '</td>';
                    obj += '<td>' + dataList[i].salary + '</td>';
                    obj += '<td>' + dataList[i].number + '</td>';
                    obj += '<td>' + time + '</td>';
                    if (flag === "2") {
                        obj += '<td style="color: #f00">' + flagName + '</td>';
                    } else {
                        obj += '<td>' + flagName + '</td>';
                    }
                }
                $('#sentJob_table').append(obj);
            },
            error: function () {
                alert("服务器休息呢！别吵吵！！！")
            }
        })
    }
    //时间格式转换
    function timeTrans(value) {
        var dateString = value;
        var pattern = /(\d{4})(\d{2})(\d{2})/;
        var formatedDate = dateString.replace(pattern, '$1年$2月$3日');
        return formatedDate;
    }
    //输出用户数据到表格
    function showData(resultData) {
        var obj = '';
        var change = '<button type="button" class="btn btn-danger btn-search" data-toggle="modal" data-target="#updateInfo" id="change">' +'CHANGE' +'</button>';
        var dataList = eval(resultData);
        if (dataList[0].respCode === "8888") {
            alert(dataList[0].respDesc);
            location.reload();
        }
        $('#personInfo_table tr:gt(0)').remove();
        for (var i in dataList) {
            obj = obj + '<tr class="table_info_tr" id='+dataList[i].id+'>';
            obj += '<td>' + dataList[i].name + '</td>';
            obj += '<td>' + dataList[i].age + '</td>';
            obj += '<td>' + dataList[i].sex + '</td>';
            obj += '<td>' + dataList[i].phone + '</td>';
            obj += '<td>' + dataList[i].e_maile + '</td>';
            obj += '<td>' + dataList[i].idNumber + '</td>';
            obj += '<td>' + dataList[i].local + '</td>';
            obj +='<td>' + change + '</td>';
        }
        $('#personInfo_table').append(obj);
    }
    //清空输入框
    $('#cancel').on('click', function () {
        $("#updateInfo input").val("");
    });
    $('#cancelResume').on('click', function () {
        $('#resume_dev input').val("");
    });

    //更新用户信息
    $(document).on('click', '#change', function () {
        var id=$(this).parents("tr").attr("id");
        //console.log("点击事件："+id);
        $.ajax({
            url:"${pageContext.request.contextPath}/demo/queryUserInfoById",
            type:'POST',
            dataType:'JSON',
            data:{
                id:id
            },
            success:function (resultData) {
                if (resultData.respCode === "0000") {
                    $('#id').val(id);
                    $('#name').val(resultData.name);
                    $('#age').val(resultData.age);
                    $('#sex').val(resultData.sex);
                    $('#phone').val(resultData.phone);
                    $('#e_maile').val(resultData.e_maile);
                    $('#idNumber').val(resultData.idNumber);
                    $('#local').val(resultData.local);
                } else {
                    alert("查询信息失败：" + resultData.respDesc)
                }
            },
            error:function () {
                alert("服务器休息呢！别吵吵！！！");
            }
        })
    });
    //更新用户信息提交
    $('#submit').on('click', function () {
        var id = "${sessionScope.ID}";
        console.log("用户更新信息：" + id);
        $.ajax({
            url:"${pageContext.request.contextPath}/demo/updataUserInfo",
            type:'POST',
            dataType:'JSON',
            data:{
                id:id,
                name:$('#name').val(),
                age:$('#age').val(),
                sex:$('#sex').val(),
                phone:$('#phone').val(),
                e_maile:$('#e_maile').val(),
                idNumber:$('#idNumber').val(),
                local:$('#local').val()
            },
            success:function (resultData) {
                if (resultData.respCode === "0000") {
                    alert("更新成功");
                    location.reload();
                } else {
                    alert("更新失败：" + resultData.respDesc);
                }
            },
            error:function () {
                alert("服务器未响应！！！");
            }
        })
    });

    //新增简历信息
    $('#release').on('click', function () {
       var id = "${sessionScope.ID}"
       $.ajax({
           url:'${pageContext.request.contextPath}/demo/createResumeInfo',
           type:'POST',
           dataType:'JSON',
           data:{
               generalId:id,
               name:$('#nameResume').val(),
               age:$('#ageResume').val(),
               sex:$('#sexResume').val(),
               phone:$('#phoneResume').val(),
               eMail:$('#eMailResume').val(),
               local:$('#localResume').val(),
               major:$('#majorResume').val(),
               favrite:$('#favriteResume').val(),
               slaray:$('#slarayResume').val(),
               remark:$('#remarkResume').val()
           },
           success: function (resultData) {
               if (resultData.respCode === "0000") {
                   alert("添加成功");
                   location.reload();
               } else {
                   alert("添加失败：" + resultData.respDesc);
               }
           },
           error:function () {
               alert("服务器未响应");
           }
       })
    });
    //更新简历信息
    $(document).on('click', '#changeResume', function () {
        var id = $(this).parents("tr").attr("id");
        $.ajax({
            url:"${pageContext.request.contextPath}/demo/qryResumeInfo",
            type:'POST',
            dataType:'JSON',
            data:{
                id:id
            },
            success:function (resultData) {
                if (resultData.respCode === "0000") {
                    var rows = resultData.rows;
                    var slaray = rows[0].slaray;
                    slaray = slaray.substr(0,slaray.length);
                    $('#idResumeU').val(id);
                    $('#nameResumeU').val(rows[0].name);
                    $('#ageResumeU').val(rows[0].age);
                    $('#sexResumeU').val(rows[0].sex);
                    $('#phoneResumeU').val(rows[0].phone);
                    $('#eMailResumeU').val(rows[0].eMail);
                    $('#localResumeU').val(rows[0].local);
                    $('#majorResumeU').val(rows[0].major);
                    $('#favriteResumeU').val(rows[0].favrite);
                    $('#slarayResumeUU').val(slaray);
                    $('#remarkResumeU').val(rows[0].remark);
                } else {
                    alert("查询失败：" + resultData.respDesc);
                }
            },
            error:function () {
                alert("服务器休息呢！别吵吵！！！")
            }
        })
    })
    //更新简历信息提交
    $('#update').on('click', function () {
        var generalId = "${sessionScope.ID}";
        console.log(id);
        $.ajax({
            url:'${pageContext.request.contextPath}/demo/updateResumeInfo',
            type:'POST',
            dataType:'JSON',
            data:{
                id:$('#idResumeU').val(),
                generalId:generalId,
                name:$('#nameResumeU').val(),
                age:$('#ageResumeU').val(),
                sex:$('#sexResumeU').val(),
                phone:$('#phoneResumeU').val(),
                eMail:$('#eMailResumeU').val(),
                local:$('#localResumeU').val(),
                major:$('#majorResumeU').val(),
                favrite:$('#favriteResumeU').val(),
                slaray:$('#slarayResumeUU').val(),
                remark:$('#remarkResumeU').val()
            },
            success: function (resultData) {
                if (resultData.respCode === "0000") {
                    alert("更新成功");
                    location.reload();
                } else {
                    alert("更新失败：" + resultData.respDesc);
                }
            },
            error: function () {
                alert("服务器未响应");
            }
        })
    })

    //删除职位信息
    $(document).on('click', '#delete', function () {
        var id = $(this).parents("tr").attr("id");
        $.ajax({
            url:'${pageContext.request.contextPath}/demo/deleteResumeInfo',
            type:'POST',
            dataType:'JSON',
            data:{
                id:id
            },
            success:function (resultData) {
                if (resultData.respCode === "0000") {
                    alert("删除成功");
                    qryResume();
                } else {
                    alert("删除失败：" + resultData.respDesc);
                }
            },
            error: function () {
                alert("服务器未响应");
            }
        })
    })

</script>
</body>
</html>
