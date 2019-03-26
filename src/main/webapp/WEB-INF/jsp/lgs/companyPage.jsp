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
                <li class="btn-li"><button class="btn-tool" id="companyInfo">Company Information</button></li>
                <li class="btn-li"><button class="btn-tool" id="positionManage">Position Manage</button></li>
                <li class="btn-li"><button class="btn-tool" id="resumeInfo">Received Resume</button></li>
            </ul>
        </div>
        <%------------------------------------------------company Information----------------------------------------------------------%>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <div id="infoTable" class="table-responsive">
                <h1 class="sub-header">Company Information</h1>
                <table class="table table-striped" id="companyInfo_table">
                    <thead>
                    <tr class="info table_info_th"><th>NAME</th><th>E-MAIL</th><th>CITY</th>
                        <th>RELEASE-DATE</th><th>NATURE</th><th>NUMBER</th><th>POSITION</th></tr>
                    </thead>
                </table>
            </div>
            <%------------------------------------------------Position Management----------------------------------------------------------%>
            <div id="jobTable" class="table-responsive">
                <h1 class="sub-header">Position Manage</h1>
                <button type="button" class="btn add-btn btn-search" style="margin: 10px" id="add"> ADD </button>
                <table class="table table-striped" id="positionManage_table">
                    <thead>
                    <tr class="info table_info_th"><th>POSITION</th><th>COMPANY</th><th>LOCAL</th><th>SALARY</th>
                        <th>NUMBER</th><th>POST-DATE</th><th>OPERATION</th></tr>
                    </thead>
                </table>
            </div>
            <%------------------------------------------------Check Out Resunme Info-----------------------------------------------------%>
            <div id="resumeTable" class="table-responsive">
                <h1 class="sub-header">Received Resume</h1>
                <table class="table table-striped" id="resumeInfo_table">
                    <thead>
                    <tr class="info table_info_th"><th>NAME</th><th>AGE</th><th>SEX</th><th>PHONE</th>
                        <th>E_MAIL</th><th>LOCAL</th><th>MAJOR</th><th>FAVRITE</th><th>SLARAY</th>
                        <th>DELIVERY-TIME</th><th>INTENTION-JOB</th><th>REMARK</th></tr>
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

    $('#companyInfo').on('click', function () {
        $('#infoTable').show();
        $('#resumeTable').hide();
        $('#jobTable').hide();
        query();
    });

    $('#positionManage').on('click', function () {
        $('#infoTable').hide();
        $('#resumeTable').hide();
        $('#jobTable').show();
        qryJobInfo();
    });

    $('#resumeInfo').on('click', function () {
        $('#infoTable').hide();
        $('#jobTable').hide();
        $('#resumeTable').show();
        qryReceiveResume();
    });

    function query() {
        var id = "${sessionScope.ID}";
        console.log("sessionStorage.id="+id);
        $.ajax({
            url:"${pageContext.request.contextPath}/demo/queryComInfoById",
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

    function qryJobInfo() {
        var id = "${sessionScope.ID}";
        $.ajax({
            url:"${pageContext.request.contextPath}/demo/queryJobInfoBySelective",
            type:'POST',
            dataType:'JSON',
            data:{
                companyId:id
            },
            success:function (resultData) {
                var obj = '';
                var change = '<button type="button" class="btn btn-danger btn-search" id="change">' +'CHANGE' +'</button>';
                var remove = '<button type="button" class="btn btn-danger btn-search" id="delete">' +'DELETE' +'</button>';
                var dataList = eval(resultData);
                if (dataList[0].respCode === "8888") {
                    alert(dataList[0].respDesc);
                }
                $('#positionManage_table tr:gt(0)').remove();
                for (var i in dataList) {
                    var time = timeTrans(dataList[i].date);
                    obj = obj + '<tr class="table_info_tr" id='+ dataList[i].id +'>';
                    obj += '<td>' + dataList[i].position + '</td>';
                    obj += '<td>' + dataList[i].company + '</td>';
                    obj += '<td>' + dataList[i].local + '</td>';
                    obj += '<td>' + dataList[i].salary + '</td>';
                    obj += '<td>' + dataList[i].number + '</td>';
                    obj += '<td>' + time + '</td>';
                    obj +='<td>' + change + remove + '</td>';
                }
                $('#positionManage_table').append(obj);
            },
            error:function () {
                alert("服务器休息呢！别吵吵！！！")
            }
        })
    }

    function qryReceiveResume() {
        var id = "${sessionScope.ID}";
        $.ajax({
            url:"${pageContext.request.contextPath}/demo/qryReceivedResumeInfo",
            type:'POST',
            dataType:'JSON',
            data:{
                id:2000001
            },
            success:function (resultData) {
                var obj = '';
                var dataList = eval(resultData);
                if (dataList[0].respCode === "8888") {
                    alert(dataList[0].respDesc);
                    location.reload();
                }
                $('#resumeInfo_table tr:gt(0)').remove();
                console.log(dataList);
                for (var i in dataList) {
                    //转换时间格式
                    console.log(dataList[i]);
                    var time = timeTrans(dataList[i].postDate);
                    var favrite = dataList[i].favrite;
                    if (favrite == null || favrite === "") {
                        favrite = "--";
                    }
                    obj = obj + '<tr class="table_info_tr" id='+dataList[i]+'>';
                    obj += '<td>' + dataList[i].name + '</td>';
                    obj += '<td>' + dataList[i].age + '</td>';
                    obj += '<td>' + dataList[i].sex + '</td>';
                    obj += '<td>' + dataList[i].phone + '</td>';
                    obj += '<td>' + dataList[i].eMail + '</td>';
                    obj += '<td>' + dataList[i].local + '</td>';
                    obj += '<td>' + dataList[i].major + '</td>';
                    obj += '<td>' + favrite + '</td>';
                    obj += '<td>' + dataList[i].slaray + '</td>';
                    obj += '<td>' + time + '</td>';
                    obj += '<td>' + dataList[i].intentionJob + '</td>';
                    obj += '<td>' + dataList[i].remark + '</td>';
                }
                $('#resumeInfo_table').append(obj);
            },
            error: function () {
                alert("服务器休息呢！别吵吵！！！")
            }
        })
    }

    function timeTrans(value) {
        var dateString = value;
        var pattern = /(\d{4})(\d{2})(\d{2})/;
        return dateString.replace(pattern, '$1年$2月$3日');
    }

    function showData(resultData) {
        var obj = '';
        var change = '<button type="button" class="btn btn-danger btn-search" id="change">' +'CHANGE' +'</button>';
        var remove = '<button type="button" class="btn btn-danger btn-search" id="delete">' +'DELETE' +'</button>';
        var data = eval(resultData);
        if (data.respCode === "8888") {
            alert(data.respDesc);
        }
        var time = timeTrans(data.date);
        $('#companyInfo_table tr:gt(0)').remove();
        obj = obj + '<tr class="table_info_tr" id='+ data.id +'>';
        obj += '<td>' + data.name + '</td>';
        obj += '<td>' + data.e_maile + '</td>';
        obj += '<td>' + data.city + '</td>';
        obj += '<td>' + time + '</td>';
        obj += '<td>' + data.nature + '</td>';
        obj += '<td>' + data.number + '</td>';
        obj +='<td>' + change + remove + '</td>';
        $('#companyInfo_table').append(obj);
    }

    $(document).on('click', '#change', function () {
        var id=$(this).parents("tr").attr("id");

        console.log("点击事件："+id);
    })

    $(document).on('click', '#delete', function () {
        var id = $(this).parents("tr").attr("id");
        console.log(id);
        $.ajax({
            url:"${pageContext.request.contextPath}/demo/deleteJobInfo",
            type:'POST',
            dataType:'JSON',
            data:{
                id:id
            },
            success: function (resultData) {
                if (resultData.respCode === "0000") {
                    alert("删除成功");
                    location.reload();
                }
                else {
                    alert(resultData.respDesc);
                }
            },
            error: function () {
                alert("服务器睡觉了吧 (>_<) ")
            }
        })
    })

</script>
</body>
</html>
