<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>倒计时自动跳转页面</title>
    <link rel="stylesheet" type="text/css" href="/static/css/Demo.css">
    <link rel="stylesheet" type="text/css" href="/static/css/bootstrap.css">
    <script type="text/javascript" src="/static/js/jquery-3.3.1.js"></script>
    <script>
        //定义函数myClose关闭当前窗口
        function myClose(){
            //将id为time的元素的内容转为整数，保存在变量n中
            var n=parseInt(time.innerHTML);
            n--;//将n-1
            //如果n==0,关闭页面
            //否则, 将关n+秒钟后自动闭，再保存回time的内容中
            if(n>0){
                time.innerHTML=n+"...秒钟后自动跳转到主页面！";
                timer=setTimeout(myClose,1000);
            }else{
                location.href='<%= request.getContextPath()%>/';
            }
        }
        var timer=null;
        //当页面加载后，启动周期性定时器，每个1秒执行myClose
        window.onload=function(){
            timer=setTimeout(myClose,1000);
        }
    </script>
</head>
<body>
<div class="logingPage" style="margin-top: 10%">
    <form style="padding-top: 30px; margin-right: 5px">
        <div class="login_div">
            <span id="time" class="prompt">5...秒钟后自动跳转到主页面！</span>
        </div>
        <div class="login_div">
            <button class="btn btn-primary" style="margin-top: 10px; float: right; border-radius: 6px" type="button"  id="back">BACK</button>
        </div>
        <div class="login_div">
            <button class="btn btn-primary" style="margin-top: 10px; float: right ; border-radius: 6px; margin-right: 10px" type="button"  id="jump">NOW</button>
        </div>
    </form>

    <script type="text/javascript">
        $('#jump').on('click', function () {
            window.location.href='/page/index';
        });
        $('#back').on('click', function () {
            window.history.go(-1);
        })
    </script>

</div>
</body>
</html>