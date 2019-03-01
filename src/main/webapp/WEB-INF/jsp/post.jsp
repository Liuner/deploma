<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>发表文章</title>
    <%--<link href="${pageContext.request.contextPath}/static/css/cjy/css3/bootstrap.css"	 rel="stylesheet" type="text/css">--%>
    <link href="${pageContext.request.contextPath}/static/css/cj/bootstrap.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/static/css/cj/addstyle.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/static/css/cj/addtype.css" rel="stylesheet" type="text/css">
    <style>
        .form-group input{
            background:rgba(255,255,255,0.4);
        }
        .form-group textarea{
            background:rgba(255,255,255,0.4);
        }

        .btn-primary{
            float: right;
        }
        .list-group a{
            text-align: center;
        }
    </style>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/ke/themes/default/default.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/ke/plugins/code/prettify.css" />
    <script charset="utf-8" src="${pageContext.request.contextPath}/static/ke/kindeditor-all.js"></script>
    <script charset="utf-8" src="${pageContext.request.contextPath}/static/ke/lang/zh-CN.js"></script>
    <script charset="utf-8" src="${pageContext.request.contextPath}/static/ke/plugins/code/prettify.js"></script>

</head>
<body>
        <jsp:include page="head1.jsp"></jsp:include>
        <div class="container">
                <div class="row">
                        <div class="col-md-2">

                            </div>
                    <div class="col-md-8">
                        <<br/>
                        <h3 class="tw-page-tag-white text-center">发表文章</h3>
                        <br/>
                        <form class="form-horizontal" action="addpageinfomation.do?usid=${CURR_USER.usid}" method="post" enctype="multipart/form-data" id="pageAddForm">
                          <div class="form-group">
                            <label for="input11" class="col-sm-2 control-label tw-page-tag-white">标题</label>
                            <div class="col-sm-8">
                              <input type="text" class="form-control" name="thead" placeholder="请输入标题" id="input11" value="${FAILALL.thead}">
                            </div>
                          </div>
                          <div class="form-group">
                                <label for="input12" class="col-sm-2 control-label tw-page-tag-white">选择图片</label>
                                <div class="col-sm-8">
                                        <input type="file" name="file" id="input12" class="tw-page-tag-white">
                                </div>
                              </div>
                          
                          <div class="form-group">
                                <label for="input13" class="col-sm-2 control-label tw-page-tag-white">文章摘要</label>
                                <div class="col-sm-8">
                                  <input type="text" class="form-control" name="tsummary" placeholder="请输入文章摘要内容" id="input13" value="${FAILALL.tsummary}">
                                </div>
                              </div>
                          <div class="form-group">
                            <label for="input14" class="col-sm-2 control-label tw-page-tag-white">内容</label>
                            <div class="col-sm-8">
                              <textarea class="form-control" rows="20" name="detail" id="input14">${FAILALL.detail}</textarea>
                            </div>
                          </div>

                            <div class="form-group">
                                <label for="itemCategory" class="col-sm-2 control-label">分类</label>
                                <div class="col-sm-5">
                                    <select id="itemCategory" class="form-control" name="tid" >
                                        <c:forEach items="${TYPE_LIST}" var="ca">
                                            <option value="${ca.tid}">${ca.tname}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>

                          <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-8">
                              <button type="submit" class="btn btn-primary">发表</button>
                            </div>
                          </div>
                        </form>
                        
                    </div>
                </div>
            </div>
        <jsp:include page="footer.jsp"></jsp:include>
            <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/cjy/js/jquery-3.3.1.js"></script>
        <script type="text/javascript">
            $(".search-type").hide();
            $(".thesearch").hide();
        </script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/cjy/js/js3/usecheck.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/cjy/js/js3/bootstrap.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/type.js"></script>

        <script>
            KindEditor.ready(function(K) {
                var editor1 = K.create('textarea[name="detail"]', {
                    cssPath : '${pageContext.request.contextPath}/static/ke/plugins/code/prettify.css',
                    uploadJson : '${pageContext.request.contextPath}/ke/uploadJson.do',
                    fileManagerJson : '${pageContext.request.contextPath}/ke/fileManage.do',
                    allowFileManager : true,
                    afterCreate : function() {
                        var self = this;
                        K.ctrl(document, 13, function() {
                            self.sync();
                            document.forms['pageAddForm'].submit();
                        });
                        K.ctrl(self.edit.doc, 13, function() {
                            self.sync();
                            document.forms['pageAddForm'].submit();
                        });
                    }
                });
                prettyPrint();
            });
        </script>
</body>
</html>