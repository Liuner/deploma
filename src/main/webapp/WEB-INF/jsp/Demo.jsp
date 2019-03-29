<%--
  Created by IntelliJ IDEA.
  User: Tannin
  Date: 2019/2/26
  Time: 21:44:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>>
<html>
<head>
    <title>Deploma</title>
    <link rel="stylesheet" type="text/css" href="/static/css/Demo.css">
    <link rel="stylesheet" type="text/css" href="/static/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="/static/css/pretty-checkbox.min.css"/>
    <script type="text/javascript" src="/static/js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="/static/js/bootstrap.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/jsp/lgs/pageHead.jsp"/>
<%---------------------------------------Search-Area------------------------------------%>
<div class="panel panel-default panel-self">
    <div class="panel-heading panel-heading-selft">
        <form class="navbar-form" style="text-align: center">
            <div class="form-group">
                <span style="font-weight:bold">职位:</span>
                <input type="text" class="form-control input-search" id= "position_value" placeholder="POSITION">
                <span style="font-weight:bold">公司:</span>
                <input type="text" class="form-control input-search" id= "company_value" placeholder="COMPANY">
                <span style="font-weight:bold">工作地点:</span>
                <input type="text" class="form-control input-search" id= "local_value" placeholder="LOCAL">
                <button type="button" class=" btn btn-danger btn-search" id="search">BEGIN</button>
            </div>
        </form>
    </div>
</div>


    <%--------------------------------------------------Table-Area----------------------------------------------------%>
<div class="panel panel-default panel-self">
    <%-----------------------------------------------------Modal------------------------------------------------------%>
    <%---------------------------------------------- 添加信息模态框（Modal）---------------------------------------------%>
    <div class="modal fade" id="post_dev" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel">
                        请确认相关信息
                    </h4>
                </div>
                <div class="modal-body" id="positionInfo">
                    <label for="position" class="sr-only">Position</label>
                    <input type="text" id="position" class="form-control" placeholder="Position" disabled>

                    <label for="company" class="sr-only">Company</label>
                    <input type="text" id="company" class="form-control" placeholder="Company" disabled>

                    <label for="resumeSelect" class="sr-only">Resume</label>
                    <select class="form-control" id="resumeSelect">
                        <option value="1">first</option>
                    </select>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" id="cancel">取消</button>
                    <button type="button" class="btn btn-primary" id="release">提交</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
    <!-- ---------------------Title------------------- -->
    <div class="panel-heading panel-heading-self">
        <label>JOB INFORMATION</label>
    </div>

    <!---------------------- Table ---------------------->
    <table class="table" id="job-table">
        <thead>
        <tr class="info table_info_th"><th>POSITION</th><th>COMPANY</th><th>LOCAL</th><th>SALARY</th><th>NUMBER</th><th>DATE</th><th>OPERATION</th></tr>
        </thead>
    </table>
    <nav aria-label="Page navigation" style="text-align: center">
        <ul class="pagination">
            <li>
                <a href="#" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                </a>
            </li>
            <li><a href="#">1</a></li>
            <li><a href="#">2</a></li>
            <li><a href="#">3</a></li>
            <li><a href="#">4</a></li>
            <li><a href="#">5</a></li>
            <li>
                <a href="#" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>
        </ul>
    </nav>
</div>
<%------------------------------------------------------------------------------------%>
<script language="JavaScript">
    var url = "${pageContext.request.contextPath}/page/queryJobInfo";
    var generalId = "${sessionScope.ID}";
    var jobId = null;
    <%-----------pageloding----------%>
    $(document).ready(function() {
        $.ajax({
            url: url,
            type: 'POST',
            dataType: 'JSON',
            data: {},
            success: function (data) {
                showData(data);
                queryResume(generalId);
            },
            error: function () {
                alert("服务器休息呢！别吵吵！！！");
            }
        });
    });

    <%--------search button---------%>
    $('#search').on('click', function() {
        var position_value = $('#position_value').val();
        var company_value = $('#company_value').val();
        var local_value = $('#local_value').val();
        $.ajax({
            url:url,
            type:'POST',
            dataType:'JSON',
            data:{
                position:position_value,
                company:company_value,
                local:local_value
            },
            success: function (data) {
                showData(data)
            },
            error: function () {
                alert("服务器休息呢!别吵吵!!!");
            }
        });
        $(position_value).val('');
        $(company_value).val('');
        $(local_value).val('');
    });

    //信息列表输出
    function showData(data) {
        var obj = '';
        var send = '<button type="button" class="btn btn-danger btn-search" data-toggle="modal" data-target="#post_dev" id="send">' +'SEND' +'</button>';
        var dataList = eval(data);
        if (dataList[0].respCode === "8888") {
            alert(dataList[0].respDesc);
            location.reload();
        }
        $('#job-table tr:gt(0)').remove();
        for (var i in dataList) {
            var date = timeTrans(dataList[i].date);
            obj = obj + '<tr class="table_info_tr" id='+ dataList[i].id +'>';
            obj +='<td>' + dataList[i].position + '</td>';
            obj +='<td>' + dataList[i].company + '</td>';
            obj +='<td>' + dataList[i].local + '</td>';
            obj +='<td>' + dataList[i].salary +"K"+ '</td>';
            obj +='<td>' + dataList[i].number + '人' + '</td>';
            obj +='<td>' + date + '</td>';
            obj +='<td>' + send + '</td>';
            obj = obj + '</tr>';
        }
        $('#job-table').append(obj);
    }

    //时间格式转换
    function timeTrans(value) {
        var dateString = value;
        var pattern = /(\d{4})(\d{2})(\d{2})/;
        var formatedDate = dateString.replace(pattern, '$1年$2月$3日');
        return formatedDate;
    }

    //send按钮事件，填充相关信息
    $(document).on('click', '#send', function () {
        if (generalId === "") {
            location.reload();
            alert("请登录");
            return false;
        }
        //判断是否是general
        if (!generalId.startsWith("1")) {
            alert("此功能只针对求职者");
            return false;
        }
        jobId = $(this).parents("tr").attr("id");
        // console.log("jobId:" + jobId);
        //获取companyId,并给input赋值
        var jobInfo = qeuryJobInfo(jobId);
        $('#position').val(jobInfo.position);
        $('#company').val(jobInfo.company);
    });

    //职位ID->职位信息
    function qeuryJobInfo(jobId) {
        var jobInfo = null;
        $.ajax({
            url:'${pageContext.request.contextPath}/demo/qryJobInfoById',
            type:'POST',
            dataType:'JSON',
            async:false,
            data: {
                id:jobId
            },
            success:function (resultData) {
                if (resultData.respCode === "0000") {
                    jobInfo = resultData;
                }
            }
        });
        return jobInfo;
    }

    //查询简历信息，填充下拉框
    function queryResume(generalId) {
        var resumeList = null;
        $.ajax({
            url:'${pageContext.request.contextPath}/demo/qryResumeInfo',
            type:'POST',
            dataType:'JSON',
            async:false,
            data:{
                generalId:generalId
            },
            success:function (resultData) {
                if (resultData.respCode === "0000") {
                    resumeList = resultData.rows;
                    //下拉框添加option
                    $('#resumeSelect option').remove();
                    for (var i = 0; i < resumeList.length;) {
                        //先创建好select里面的option元素
                        var option = document.createElement("option");
                        //转换DOM对象为JQ对象,好用JQ里面提供的方法 给option的value赋值
                        $(option).val(resumeList[i].id);
                        //给option的text赋值,这就是你点开下拉框能够看到的东西
                        $(option).text("简历" + ++i);
                        //获取select 下拉框对象,并将option添加进select
                        $('#resumeSelect').append(option);
                    }
                }
            },
            error: function () {
                alert("服务器无响应");
            }
        });
        return resumeList;
    }

    $('#release').on('click', function () {
        console.log("generalId:" + generalId);

        console.log("jobId:" + jobId);

        var job = qeuryJobInfo(jobId);
        console.log("companyId:" + job.companyId);

        var resumeId = $('#resumeSelect').select().val();
        console.log("resumeId:" + resumeId);
    })
</script>
</body>
</html>

