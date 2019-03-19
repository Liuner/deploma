<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <title>Dashboard Template for Bootstrap</title>
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
                <li class="btn-li"><button class="btn-tool" id="jobInfo">Posted position</button></li>
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
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>Header</th>
                        <th>Header</th>
                        <th>Header</th>
                        <th>Header</th>
                    </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
            <%------------------------------------------------Check Out Job Vacancies-----------------------------------------------------%>
            <div id="jobTable" class="table-responsive">
                <h1 class="sub-header">Posted position</h1>
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>Header</th>
                        <th>Header</th>
                        <th>Header</th>
                        <th>Header</th>
                    </tr>
                    </thead>
                    <tbody>
                    </tbody>
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
    });

    $('#jobInfo').on('click', function () {
        $('#infoTable').hide();
        $('#resumeTable').hide();
        $('#jobTable').show();
    });

    function query() {
        $.ajax({
            url:"${pageContext.request.contextPath}/demo/queryUserInfo",
            type:'POST',
            dataType:'JSON',
            data:{
                id:"1000001"
            },
            success:function (resultData) {
                showData(resultData);
            },
            error:function () {
                alert("服务器休息呢！别吵吵！！！");
            }
        })
    }
    function showData(resultData) {
        var obj = '';
        var change = '<button type="button" class="btn btn-danger btn-search">' +'CHANGE' +'</button>';
        var remove = '<button type="button" class="btn btn-danger btn-search">' +'DELETE' +'</button>';
        var dataList = eval(resultData);
        if (dataList[0].respCode === "8888") {
            alert(dataList[0].respDesc);
            location.reload();
        }
        $('#personInfo_table tr:gt(0)').remove();
        for (var i in dataList) {
            obj = obj + '<tr class="table_info_tr">';
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
</script>
</body>
</html>
