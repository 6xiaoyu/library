<%--
Created by IntelliJ IDEA.
User: gxy
Date: 2020/7/16
Time: 22:39
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"  %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>图书管理系统首页</title>
    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->


</head>
<body>
<form id="form" action="${pageContext.request.contextPath}/admin/updateBookInfo">
    <input type="hidden" name="currentPage" value="${pageContext.request.getParameter("currentPage")}"/>
    <input type="hidden" name="bookId" value="${bid}"/>

    <div class="form-group">
        <label for="name">图书名称</label>
        <input type="text" class="form-control" id="name" placeholder="请输入名称" name="name">
    </div>
    <div class="form-group">
        <label for="author">作者</label>
        <input type="text" class="form-control" id="author" placeholder="请输入作者" name="author">
    </div>
    <div class="form-group">
        <label for="publish">出版社</label>
        <input type="text" class="form-control" id="publish" placeholder="请输入出版社" name="publish">
    </div>
    <div class="form-group">
        <label for="ISBN">ISBN</label>
        <input type="text" class="form-control" id="ISBN" placeholder="请输入ISBN" name="ISBN">
    </div>
    <div class="form-group">
        <label for="introduction">书籍详情</label>
        <textarea id="introduction" name="introduction" placeholder="请输入详细内容介绍"></textarea>
    </div>
    <div class="form-group">
        <label for="language">语言</label>
        <input type="text" class="form-control" id="language" placeholder="请输入语言" name="language">
    </div>
    <div class="form-group">
        <label for="price">价格</label>
        <input type="text" id="price" name="price" onkeyup="value=value.replace(/[^bai(\d)]/g,'')"/>
    </div>
    <div class="form-group">
        <label for="pubDate">出版日期</label>
        <input type="date" class="form-control" id="pubDate"  name="pubDate">
    </div>
    <div class="form-group">
        <%--<!-- 样式1 -->--%>
        <select class="form-control" name="cid">
            <option value="">请选择类别</option>
            <c:forEach items="${classInfos}" var="classInfo" >
                <option value="${classInfo.cid}">${classInfo.cname}</option>
            </c:forEach>
        </select>
    </div>
    <div class="form-group">
        <label for="stock">库存</label>
        <input type="text" id="stock" onkeyup="value=value.replace(/[^bai(\d)]/g,'')"/>
    </div>
    <button type="submit" class="btn btn-default">提交</button>
</form>


<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

<script>



</script>

</body>
</html>