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
    <script  src="${pageContext.request.contextPath}/js/adminHead.js"></script>
</head>
<body>

<button type="button" class="btn btn-default" style="float: right ;margin-top: 85px;margin-right: 5px" id="addBut" >添加图书类别</button>
<button type="button" class="btn btn-default" style="float: right ;margin-top: 85px;margin-right: 5px" id="deleteButs" >一键删除</button>

<form action="${pageContext.request.contextPath}/admin/deleteClassInfo" style="margin-top: 10px" id="deleteForm">
    <table class="table table-hover">
        <tr>
            <th><input type="checkbox" id="firstCb" ></th>
            <th>类别ID</th>
            <th>类名</th>
            <th>操作</th>
        </tr>
        <c:forEach var="classInfo" items="${classInfos}" varStatus="s">
            <tr>
                <td><input type="checkbox" name="allCb" value="${classInfo.cid}"></td>
                <td>${classInfo.cid}</td>
                <td>${classInfo.cname}</td>

                <td>
                    <div class="btn-group" role="group" aria-label="...">
                        <button type="button" class="btn btn-default" onclick="updateClassInfo(${classInfo.cid})">编辑</button>
                        <button type="button" class="btn btn-default" onclick="deleteByCid(${classInfo.cid})">删除</button>
                    </div>
                </td>
            </tr>
        </c:forEach>
    </table>

</form>



<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

<script>
    $("#nowName").html("${login.username}")
    $("#nowId").html("${login.id}")
    $("#nowRelName").html("${login.username}")

    /*全选全不选*/
    var allCbs=$("[name='allCb']");
    $("#firstCb").click(function () {
        for (var i=0;i<allCbs.length;i++){
            allCbs[i].checked=this.checked;
        }
    })
    /*编辑类方法*/
    function updateClassInfo(cid) {
        if (confirm("您确定要编辑该内容吗")){
            location.href="${pageContext.request.contextPath}/admin/updateClassInfoFirst?cid="+cid;
        }
    }
    $("#addBut").click(function () {
        if (confirm("您确定要添加类别吗")){
            location.href="${pageContext.request.contextPath}/admin/addClassInfoFirst";
        }
    })

    /*删除方法*/
    function deleteByCid(cid) {
            if (confirm("您确定要删除吗")){
                location.href="${pageContext.request.contextPath}/admin/deleteClassInfo?cid="+cid;
            }
    }
    /*总删除按钮*/
    $("#deleteButs").click(function () {
        if (confirm("您确定要全部删除吗")) {
            var flag = false;
            /*判断有没有选中条目*/
            for (var i = 0; i < allCbs.length; i++) {
                if (allCbs[i].checked) {
                    /*有选中书籍*/
                    flag = true;
                    break;
                }
            }
            if (flag) {
                /*提交表单*/
                $("#deleteForm").submit();
            }
        }

    })
</script>

</body>
</html>