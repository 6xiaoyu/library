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
    <form action="${pageContext.request.contextPath}/admin/addClassInfo">
        <div class="form-group">
            <label for="cid">类别ID</label>
            <input type="text"  class="form-control" id="cid" name="cid" placeholder="请误输入已有图书ID或者不输入" onkeyup="value=value.replace(/[^bai(\d)]/g,'')">
        </div>
        <div class="form-group">
            <label for="cname">类名</label>
            <input type="text" class="form-control" id="cname" name="cname" placeholder="类名">
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