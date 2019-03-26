<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>>
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
                <table class="table table-striped" id="personInfo_table">
                    <thead>
                    <tr class="info table_info_th"><th>NAME</th><th>AGE</th><th>SEX</th><th>PHONE</th>
                        <th>E-MAIL</th><th>ID-NUMBER</th><th>LOCAL</th><th>STATUS</th><th>OPERATION</th></tr>
                    </thead>
                </table>
            </div>
            <%------------------------------------------------Resume Management----------------------------------------------------------%>
            <div id="resumeTable" class="table-responsive">
                <h1 class="sub-header">Resume Management</h1>
                <table class="table table-striped" id="resume_table">
                    <thead>
                    <tr class="info table_info_th"><th>NAME</th><th>AGE</th><th>SEX</th><th>PHONE</th>
                        <th>E_MAIL</th><th>LOCAL</th><th>MAJOR</th><th>FAVRITE</th><th>SLARAY</th><th>REMARK</th><th>OPTIONS</th></tr>
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

    $('#change').on('click', function () {
        console.log("更改用户信息");
    });

    $('#delete').on('click', function () {
        console.log("删除用户信息");
    });

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
                var change = '<button type="button" class="btn btn-danger btn-search" id="change">' +'CHANGE' +'</button>';
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

    function timeTrans(value) {
        var dateString = value;
        var pattern = /(\d{4})(\d{2})(\d{2})/;
        var formatedDate = dateString.replace(pattern, '$1年$2月$3日');
        return formatedDate;
    }

    function showData(resultData) {
        var obj = '';
        var change = '<button type="button" class="btn btn-danger btn-search" id="change">' +'CHANGE' +'</button>';
        var remove = '<button type="button" class="btn btn-danger btn-search" id="delete">' +'DELETE' +'</button>';
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
            obj += '<td>' + dataList[i].status + '</td>';
            obj +='<td>' + change + remove + '</td>';
        }
        $('#personInfo_table').append(obj);
    }

    $(document).on('click', '#change', function () {
        //var id=$(this).parents("tr").find("td").eq(0).text(); //得到用户名
        var id=$(this).parents("tr").attr("id");
        console.log("点击事件："+id);

    })

</script>
</body>
</html>
