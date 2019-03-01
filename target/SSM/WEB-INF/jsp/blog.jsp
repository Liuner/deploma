<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>文章详细</title>

    <!-- Bootstrap core CSS -->
    <%--<link href="${pageContext.request.contextPath}/static/css/cjy/bootstrap.min.css" rel="stylesheet">--%>

    <!-- Custom styles for this template -->
      <link href="${pageContext.request.contextPath}/static/css/cj/bootstrap.css" rel="stylesheet" type="text/css">
      <link href="${pageContext.request.contextPath}/static/css/cj/addstyle.css" rel="stylesheet" type="text/css">
      <link href="${pageContext.request.contextPath}/static/css/cj/addtype.css" rel="stylesheet" type="text/css">
  </head>

  <body>

    <!-- Navigation -->
<jsp:include page="head1.jsp"></jsp:include>

    <!-- Page Content -->
    <div class="container">

      <div class="row">

        <!-- Post Content Column -->
        <div class="col-lg-8">

          <!-- Title -->
          <h1 class="mt-4 tw-page-tag-white">${ONEPAGE.phead}</h1>

          <!-- Author -->
          <p class="lead tw-page-tag-white">
            作者：
            <a href="personal.do?usid=${CONTENTTEXT.cid}" class="tw-page-tag-white">${ONEPAGE.usname}</a>
          </p>

          <hr>

          <!-- Date/Time -->
            <p class="tw-page-tag-white">发表于 <fmt:formatDate value="${ONEPAGE.ptime}" pattern="yyyy-MM-dd"/></p>
            <%--2018 年 10 月 10日 上午10:00 --%>

          <hr>

          <!-- Preview Image -->
          <%--<img class="img-fluid rounded" src="${pageContext.request.contextPath}/static/images/cjy/test/${CONTENTTEXT.cpic}" alt="暂无图片" >--%>

          <%--<hr>--%>

          <!-- Post Content -->
          <div class="lead tw-page-tag-white">${CONTENTTEXT.tcontent}</div>

          <hr>

          <!-- Comments Form -->
          <div class="card my-4">
            <h5 class="card-header">评 论:</h5>
            <div class="card-body">
              <form>
                <div class="form-group">
                  <textarea class="form-control" rows="3"></textarea>
                </div>
                <button type="submit" class="btn btn-primary">发表</button>
              </form>
            </div>
          </div>

          <!-- Single Comment -->
          <div class="media mb-4">
            <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
            <div class="media-body tw-page-tag-white">
              <h5 class="mt-0 tw-page-tag-white">游客 一</h5>
              这里是内容！这里是内容！这里是内容！这里是内容！这里是内容！这里是内容！这里是内容！这里是内容！这里是内容！
            </div>
          </div>

          <!-- Comment with nested comments -->
          <div class="media mb-4">
            <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
            <div class="media-body tw-page-tag-white">
              <h5 class="mt-0 tw-page-tag-white">游客 二</h5>
              这里是内容！这里是内容！这里是内容！这里是内容！这里是内容！这里是内容！这里是内容！这里是内容！这里是内容！

              <div class="media mt-4">
                <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
                <div class="media-body tw-page-tag-white">
                  <h5 class="mt-0 tw-page-tag-white">游客 三</h5>
                  这里是内容！这里是内容！这里是内容！这里是内容！这里是内容！这里是内容！这里是内容！这里是内容！这里是内容！
                </div>
              </div>

              <div class="media mt-4">
                <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
                <div class="media-body tw-page-tag-white">
                  <h5 class="mt-0 tw-page-tag-white">游客 四</h5>
                  这里是内容！这里是内容！这里是内容！这里是内容！这里是内容！这里是内容！这里是内容！这里是内容！这里是内容！
                </div>
              </div>

            </div>
          </div>

        </div>

        <!-- Sidebar Widgets Column -->
        <div class="col-md-4">

          <!-- Search Widget -->
          <div class="card my-4">
            <h5 class="card-header">搜 索</h5>
            <div class="card-body">
              <div class="input-group">
                <input type="text" class="form-control" placeholder="关 键 字 ...">
                <span class="input-group-btn">
                  <button class="btn btn-secondary" type="button">Go!</button>
                </span>
              </div>
            </div>
          </div>

          <!-- Categories Widget -->
          <div class="card my-4">
            <h5 class="card-header">本文关键字</h5>
            <div class="card-body">
              <div class="row" style="padding: 0 10px">
                <p >${ONEPAGE.pkeyword}</p>
              </div>
            </div>
          </div>

          <!-- Side Widget -->
          <div class="card my-4">
            <h5 class="card-header">小 知 识</h5>
            <div class="card-body">
                ${ONEPAGE.psummary}
            </div>
          </div>

        </div>

      </div>
      <!-- /.row -->

    </div>
    <!-- /.container -->
    <jsp:include page="footer.jsp"></jsp:include>
    <!-- Footer -->


    <!-- Bootstrap core JavaScript -->
    <script src="${pageContext.request.contextPath}/static/js/cjy/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/cjy/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/type.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/cj/bootstrap.js"></script>
  </body>

</html>
