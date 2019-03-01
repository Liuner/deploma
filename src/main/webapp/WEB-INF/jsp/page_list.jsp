<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>知天易-文章列表</title>
    <%--<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/cjy/css3/bootstrap.min.css">--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/cjy/css3/pagelist.css">
    <!--
    <link href="${pageContext.request.contextPath}/static/css/cjy/css3/bootstrap.css" rel="stylesheet" type="text/css">
    -->
    <link href="${pageContext.request.contextPath}/static/css/cj/bootstrap.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/static/css/cj/addstyle.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/static/css/cj/addtype.css" rel="stylesheet" type="text/css">
    </head>

<body id="bg">
    <jsp:include page="head1.jsp"></jsp:include>
    <div class="container">
        <div class="col-md-3  ">
            <div class="leftsidebar_box" style="background: rgba(0,0,0,0.4);">
                <div class="line"></div>
                <dl class="system_log">
                    <dt>天体物理学<img src="${pageContext.request.contextPath}/static/images/cjy/left/select_xl01.png"></dt>
                    <dd class="first_dd"><a href="searchbyclass.do?pclass=2">红移</a></dd>
                    <dd><a href="searchbyclass.do?pclass=3">引力波</a></dd>
                    <dd><a href="searchbyclass.do?pclass=4">暗物质</a></dd>
                    <dd><a href="searchbyclass.do?pclass=5">时空扭曲</a></dd>
                    <dd><a href="searchbyclass.do?pclass=6">相对论</a></dd>
                    <dd><a href="searchbyclass.do?pclass=7">量子力学</a></dd>
                    <dd><a href="searchbyclass.do?pclass=8">正反粒子</a></dd>
                </dl>

                <dl class="custom">
                    <dt>恒星<img src="${pageContext.request.contextPath}/static/images/cjy/left/select_xl01.png"></dt>
                    <dd class="first_dd"><a href="#">日冕</a></dd>
                    <dd><a href="#">黑子</a></dd>
                    <dd><a href="#">日珥</a></dd>
                    <dd><a href="#">光斑</a></dd>
                    <dd><a href="#">耀斑</a></dd>
                    <dd><a href="#">日全食</a></dd>
                    <dd><a href="#">日偏食</a></dd>
                </dl>

                <dl class="channel">
                    <dt>行星<img src="${pageContext.request.contextPath}/static/images/cjy/left/select_xl01.png"></dt>
                    <dd class="first_dd"><a href="#">僵尸行星</a></dd>
                    <dd><a href="#">流浪行星</a></dd>
                    <dd><a href="#">类地行星</a></dd>
                    <dd><a href="#">卫星</a></dd>
                </dl>

                <dl class="app">
                    <dt>黑洞<img src="${pageContext.request.contextPath}/static/images/cjy/left/select_xl01.png"></dt>
                    <dd class="first_dd"><a href="#">视界</a></dd>
                    <dd><a href="#">奇点</a></dd>
                </dl>

                <dl class="cloud">
                    <dt>彗星<img src="${pageContext.request.contextPath}/static/images/cjy/left/select_xl01.png"></dt>
                    <dd class="first_dd"><a href="#">周期彗星</a></dd>
                    <dd class="first_dd"><a href="#">非周期彗星</a></dd>
                </dl>

                <dl class="syetem_management">
                    <dt>星象<img src="${pageContext.request.contextPath}/static/images/cjy/left/select_xl01.png"></dt>
                    <dd class="first_dd"><a href="#">椭圆星系</a></dd>
                    <dd><a href="#">星爆星系</a></dd>
                    <dd><a href="#">螺旋星系</a></dd>
                    <dd><a href="#">漩涡星系</a></dd>
                    <dd><a href="#">棒旋星系</a></dd>
                    <dd><a href="#">矮星系</a></dd>
                    <dd><a href="#">不规则星系</a></dd>
                </dl>

                <dl class="source">
                    <dt>星云<img src="${pageContext.request.contextPath}/static/images/cjy/left/select_xl01.png"></dt>
                    <dd class="first_dd"><a href="#">发射星云</a></dd>
                    <dd><a href="#">反射星云</a></dd>
                    <dd><a href="#">暗星云</a></dd>
                </dl>

                <dl class="statistics">
                    <dt>类星体<img src="${pageContext.request.contextPath}/static/images/cjy/left/select_xl01.png"></dt>
                    <dd class="first_dd"><a href="#">等待探索...</a></dd>
                </dl>

            </div>

        </div>

        <div class="col-md-9">
            <div style="height: 650px;">

            <c:forEach items="${PAGE_LIST}" var="item">
            <div class="media">
              <div class="media-left media-top" style="height: 125px;">
                <a href="#"><img src="${pageContext.request.contextPath}/static/images/cjy/test/${item.ppicurl}" class="media-object" style="width:200px;height: 120px"></a>
              </div>
              <div class="media-body tw-page-tag-white" style="background: rgba(0,0,0,0.2);">
                <a href="pageContext.do?pid=${item.pid}"><h4 class="media-heading tw-page-tag-white">${item.phead}</h4></a>
                <p>${item.psummary}</p>
                  <!--添加新内容-->
              </div>
            </div>
            <hr>
            </c:forEach>

                </div>
              <ul class="pagination">
                <li><a href="#" style="color: #fff;background: rgba(255,255,255,0.3)">&laquo;</a></li>
                <li id="changePageName1" class="active"><a style="color: #fff;background:rgba(255,255,255,0.3)" href="searchByPage.do?countNum=1&plike=${plike}&pclass=${pclass}">1</a></li>
                  <c:forEach items="${requestScope.PAGING}" var="pcount">
                <li id="changePageName${pcount}"><a style="color: #fff;background: rgba(255,255,255,0.3)" href="searchByPage.do?countNum=${pcount}&plike=${plike}&pclass=${pclass}">${pcount}</a></li>
                  </c:forEach>

                <li><a style="color: #fff;background: rgba(255,255,255,0.3)" href="#">&raquo;</a></li>
            </ul>
          </div>

          
    </div>


    <%--<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/cjy/jquery/jquery.js"></script>--%>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/cjy/jquery/jquery.min.js"></script>
    <%--<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/cjy/js/js3/bootstrap.min.js"></script>--%>
    <script type="text/javascript">
        $(".leftsidebar_box dt").css({ "background": "rgba(0,0,0,0.2)"  });
        $(".leftsidebar_box dt img").attr("src", "${pageContext.request.contextPath}/static/images/cjy/left/select_xl01.png");
        $(function () {
            $(".leftsidebar_box dd").hide();
            $(".leftsidebar_box dt").click(function () {
                $(".leftsidebar_box dt").css({ "background": "rgba(0,0,0,0.2)" })
                $(this).css({ "background": "rgba(255,255,255,0.2)"  });
                $(this).parent().find('dd').removeClass("menu_chioce");
                $(".leftsidebar_box dt img").attr("src", "${pageContext.request.contextPath}/static/images/cjy/left/select_xl01.png");
                $(this).parent().find('img').attr("src", "${pageContext.request.contextPath}/static/images/cjy/left/select_xl.png");
                $(".menu_chioce").slideUp();
                $(this).parent().find('dd').slideToggle();
                $(this).parent().find('dd').addClass("menu_chioce");
            });
        });
    </script>

    <div style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';">

    </div>
    <jsp:include page="footer.jsp"></jsp:include>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/type.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/cj/bootstrap.js"></script>
</body>

</html>