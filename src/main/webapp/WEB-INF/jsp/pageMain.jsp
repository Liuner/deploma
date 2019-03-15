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
<jsp:include page="/WEB-INF/jsp/ke/pageHead.jsp"/>
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


<%-----------------------------------Table-Area----------------------------------%>
<div class="panel panel-default panel-self">
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
    <%-----------pageloding----------%>
    $(document).ready(function() {
        $.ajax({
            url: url,
            type: 'POST',
            dataType: 'JSON',
            data: {},
            success: function (data) {
                showData(data)
            },
            error: function () {
                alert("服务器休息呢!别吵吵!!!");
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
        $('#position_value').val('');
        $('#company_value').val('');
        $('#local_value').val('');
    });

    function showData(data) {
        var obj = '';
        var send = '<button type="button" class="btn btn-danger btn-search">' +'SEND' +'</button>';
        var dataList = eval(data);
        if (dataList[0].respCode === "8888") {
            alert(dataList[0].respDesc);
            location.reload();
        }
        $('#job-table tr:gt(0)').remove();
        for (var i in dataList) {
            obj = obj + '<tr class="table_info_tr">';
            obj +='<td>' + dataList[i].position + '</td>';
            obj +='<td>' + dataList[i].company + '</td>';
            obj +='<td>' + dataList[i].local + '</td>';
            obj +='<td>' + dataList[i].salary +"K"+ '</td>';
            obj +='<td>' + dataList[i].number + '</td>';
            obj +='<td>' + dataList[i].date + '</td>';
            obj +='<td>' + send + '</td>';
            obj = obj + '</tr>';
        }
        $('#job-table').append(obj);
    }

</script>
</body>
</html>

