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
<form class="navbar-form navbar-left" role="search" style="margin-left: 5%;margin-top: 5px" action="${pageContext.request.contextPath}/admin/findUserByPage">
    <div class="form-group" style="margin-right: 50px">
        <input type="text" class="form-control" placeholder="请输入用户ID" name="uid" value="${uid}" style="margin-left: 5px">
        <input type="text" class="form-control" placeholder="请输入用户名" name="username" value="${username}">
    </div>

    <button type="submit" class="btn btn-default" >搜索</button>
</form>

<button type="button" class="btn btn-default" style="float: right ;margin-top: 85px;margin-right: 5px" id="addBut" >添加用户</button>


<form  style="margin-top: 10px" >
    <table class="table table-hover">
        <tr>
            <th><input type="checkbox" id="firstCb" ></th>
            <th>用户ID</th>
            <th>用户名</th>
            <th>真实姓名</th>
            <th>年龄</th>
            <th>邮箱</th>
            <th>电话</th>
            <th>性别</th>
            <th>生日</th>


            <th>操作</th>
        </tr>
        <c:forEach var="user" items="${upb.list}" varStatus="s">
            <tr>
                <td><input type="checkbox" name="allCb" value="${user.uid}"></td>
                <td>${user.uid}</td>
                <td>${user.username}</td>
                <td>${user.relname}</td>
                <td>${user.age}</td>
                <td>${user.email}</td>
                <td>${user.phone}</td>
                <td>${user.sex}</td>
                <td>${user.birthday}</td>

                <td>
                    <div class="btn-group" role="group" aria-label="...">
                        <button type="button" class="btn btn-default" onclick="updateUser(${user.uid})">编辑</button>
                        <button type="button" class="btn btn-default" onclick="deleteByUid(${user.uid})">删除</button>
                    </div>
                </td>
            </tr>
        </c:forEach>
    </table>

</form>

<nav style="float: bottom;margin-left: 20px">
    <ul class="pagination pagination-lg" >
        <%--如果有条数--%>
        <c:if test="${upb.totalCount>0}">

            <%--首页--%>
            <li><a href="${pageContext.request.contextPath}/admin/findUserByPage?currentPage=1&uid=${uid}&username=${username}" aria-label="Previous"><span aria-hidden="true">首页</span></a></li>
            <%--上一页--%>
            <c:if test="${upb.currentPage<=1}">
                <li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
            </c:if>
            <c:if test="${upb.currentPage>1}">
                <li ><a href="${pageContext.request.contextPath}/admin/findUserByPage?currentPage=${upb.currentPage-1}&uid=${uid}&username=${username}" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
            </c:if>


            <%--如果总页码《10--%>
            <c:if test="${upb.totalPage<=10}">
                <c:forEach begin="1" end="${upb.totalPage}" step="1" var="i">
                    <%--页码--%>
                    <c:if test="${upb.currentPage==i}">
                        <li class="active"><a href="${pageContext.request.contextPath}/admin/findUserByPage?currentPage=${i}&uid=${uid}&username=${username}">${i}</a></li>
                    </c:if>
                    <c:if test="${upb.currentPage!=i}">
                        <li><a href="${pageContext.request.contextPath}/admin/findUserByPage?currentPage=${i}&uid=${uid}&username=${username}">${i}</a></li>
                    </c:if>
                </c:forEach>
            </c:if>
            <%--如果大于10--%>
            <c:if test="${upb.totalPage>10}">
                <c:if test="${upb.currentPage-5>=1 and upb.currentPage+4<=upb.totalPage}">
                    <c:forEach begin="${upb.currentPage-5}" end="${upb.currentPage+4}" step="1" var="i">
                        <%--页码--%>
                        <c:if test="${upb.currentPage==i}">
                            <li class="active"><a href="${pageContext.request.contextPath}/admin/findUserByPage?currentPage=${i}&uid=${uid}&username=${username}">${i}</a></li>
                        </c:if>
                        <c:if test="${upb.currentPage!=i}">
                            <li><a href="${pageContext.request.contextPath}/admin/findUserByPage?currentPage=${i}&uid=${uid}&username=${username}">${i}</a></li>
                        </c:if>
                    </c:forEach>
                </c:if>
                <c:if test="${upb.currentPage-5<1}">
                    <c:forEach begin="1" end="10" step="1" var="i">
                        <%--页码--%>
                        <c:if test="${upb.currentPage==i}">
                            <li class="active"><a href="${pageContext.request.contextPath}/admin/findUserByPage?currentPage=${i}&uid=${uid}&username=${username}">${i}</a></li>
                        </c:if>
                        <c:if test="${upb.currentPage!=i}">
                            <li><a href="${pageContext.request.contextPath}/admin/findUserByPage?currentPage=${i}&uid=${uid}&username=${username}">${i}</a></li>
                        </c:if>
                    </c:forEach>
                </c:if>
                <c:if test="${upb.currentPage+4>upb.totalPage}">
                    <c:forEach begin="${upb.totalPage-9}" end="${upb.totalPage}" step="1" var="i">
                        <%--页码--%>
                        <c:if test="${upb.currentPage==i}">
                            <li class="active"><a href="${pageContext.request.contextPath}/admin/findUserByPage?currentPage=${i}&uid=${uid}&username=${username}">${i}</a></li>
                        </c:if>
                        <c:if test="${upb.currentPage!=i}">
                            <li><a href="${pageContext.request.contextPath}/admin/findUserByPage?currentPage=${i}&uid=${uid}&username=${username}">${i}</a></li>
                        </c:if>
                    </c:forEach>
                </c:if>
            </c:if>


            <%--下一页--%>
            <c:if test="${upb.currentPage>=upb.totalPage}">
                <li class="disabled"><a href="#" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
            </c:if>
            <c:if test="${upb.currentPage<upb.totalPage}">
                <li ><a href="${pageContext.request.contextPath}/admin/findUserByPage?currentPage=${upb.currentPage+1}&uid=${uid}&username=${username}" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
            </c:if>
            <%--尾页--%>
            <li><a href="${pageContext.request.contextPath}/admin/findUserByPage?currentPage=${upb.totalPage}&uid=${uid}&username=${username}" aria-label="Next"><span aria-hidden="true">尾页</span></a></li>


        </c:if>

        <li><span>共${upb.totalCount}条记录</span>
        <li><span>共${upb.totalPage}页</span></li>
    </ul>

</nav>

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
    /*编辑用户方法*/
    function updateUser(uid) {
        if (confirm("您确定要编辑该用户吗")){
            location.href="${pageContext.request.contextPath}/admin/updateUserFirst?uid="+uid+"&currentPage=${upb.currentPage}";
        }
    }
    $("#addBut").click(function () {
        if (confirm("您确定要添加用户吗")){
            location.href="${pageContext.request.contextPath}/admin/addUserFirst";
        }
    })

    /*删除方法*/
    function deleteByUid(uid) {
            if (confirm("您确定要删除吗,请确定该用户没有存在借书")){
                location.href="${pageContext.request.contextPath}/admin/deleteUser?uid="+uid+"&currentPage=${upb.currentPage}";
            }
    }

</script>

</body>
</html>