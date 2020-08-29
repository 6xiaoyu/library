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
<form class="navbar-form navbar-left" role="search" style="margin-left: 5%;margin-top: 5px" action="${pageContext.request.contextPath}/admin/findByPage">
    <div class="form-group" style="margin-right: 50px">
        <input type="text" class="form-control" placeholder="请输入书名作者" name="bookName" value="${bookName}">
        <input type="text" class="form-control" placeholder="请输入作者" name="bookAuthor" value="${bookAuthor}" style="margin-left: 5px">
    </div>
    <%--<!-- 样式1 -->--%>
    <select class="form-control" name="cid">
        <option value="">请选择类别</option>
        <c:forEach items="${classInfos}" var="classInfo" >
            <option value="${classInfo.cid}">${classInfo.cname}</option>
        </c:forEach>
    </select>
    <button type="submit" class="btn btn-default" >搜索</button>
</form>

<button type="button" class="btn btn-default" style="float: right ;margin-top: 85px;margin-right: 5px" id="addBut" >添加图书</button>
<button type="button" class="btn btn-default" style="float: right ;margin-top: 85px;margin-right: 5px" id="deleteButs" >一键删除</button>

<form action="${pageContext.request.contextPath}/admin/deleteBook" style="margin-top: 10px" id="deleteForm">
    <table class="table table-hover">
        <tr>
            <th><input type="checkbox" id="firstCb" ></th>
            <th>书本编号</th>
            <th>书名</th>
            <th>作者</th>
            <th>出版社</th>
            <th>ISBN</th>
            <th>出版日期</th>
            <th>库存</th>
            <th>价格</th>
            <th>操作</th>
        </tr>
        <c:forEach var="book" items="${bpb.list}" varStatus="s">
            <tr>
                <td><input type="checkbox" name="allCb" value="${book.bookId}"></td>
                <td>${book.bookId}</td>
                <td onclick="info('${book.introduction}')">${book.name}</td>
                <td>${book.author}</td>
                <td>${book.publish}</td>
                <td>${book.ISBN}</td>
                <td>${book.pubDate}</td>
                <td>${book.stock}</td>
                <td>${book.price}￥</td>
                <td>
                    <div class="btn-group" role="group" aria-label="...">
                        <button type="button" class="btn btn-default" onclick="updateBookInfo(${book.bookId})">编辑</button>
                        <button type="button" class="btn btn-default" onclick="deleteByBid(${book.bookId})">删除</button>
                    </div>
                </td>
            </tr>
        </c:forEach>
    </table>

</form>

<nav style="float: bottom;margin-left: 20px">
    <ul class="pagination pagination-lg" >
        <%--如果有条数--%>
        <c:if test="${bpb.totalCount>0}">

            <%--首页--%>
            <li><a href="${pageContext.request.contextPath}/admin/findByPage?currentPage=1&bookName=${bookName}&bookAuthor=${bookAuthor}&cid=${cid}" aria-label="Previous"><span aria-hidden="true">首页</span></a></li>
            <%--上一页--%>
            <c:if test="${bpb.currentPage<=1}">
                <li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
            </c:if>
            <c:if test="${bpb.currentPage>1}">
                <li ><a href="${pageContext.request.contextPath}/admin/findByPage?currentPage=${bpb.currentPage-1}&bookName=${bookName}&bookAuthor=${bookAuthor}&cid=${cid}" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
            </c:if>


            <%--如果总页码《10--%>
            <c:if test="${bpb.totalPage<=10}">
                <c:forEach begin="1" end="${bpb.totalPage}" step="1" var="i">
                    <%--页码--%>
                    <c:if test="${bpb.currentPage==i}">
                        <li class="active"><a href="${pageContext.request.contextPath}/admin/findByPage?currentPage=${i}&bookName=${bookName}&bookAuthor=${bookAuthor}&cid=${cid}">${i}</a></li>
                    </c:if>
                    <c:if test="${bpb.currentPage!=i}">
                        <li><a href="${pageContext.request.contextPath}/admin/findByPage?currentPage=${i}&bookName=${bookName}&bookAuthor=${bookAuthor}&cid=${cid}">${i}</a></li>
                    </c:if>
                </c:forEach>
            </c:if>
            <%--如果大于10--%>
            <c:if test="${bpb.totalPage>10}">
                <c:if test="${bpb.currentPage-5>=1 and bpb.currentPage+4<=bpb.totalPage}">
                    <c:forEach begin="${bpb.currentPage-5}" end="${bpb.currentPage+4}" step="1" var="i">
                        <%--页码--%>
                        <c:if test="${bpb.currentPage==i}">
                            <li class="active"><a href="${pageContext.request.contextPath}/admin/findByPage?currentPage=${i}&bookName=${bookName}&bookAuthor=${bookAuthor}&cid=${cid}">${i}</a></li>
                        </c:if>
                        <c:if test="${bpb.currentPage!=i}">
                            <li><a href="${pageContext.request.contextPath}/admin/findByPage?currentPage=${i}&bookName=${bookName}&bookAuthor=${bookAuthor}&cid=${cid}">${i}</a></li>
                        </c:if>
                    </c:forEach>
                </c:if>
                <c:if test="${bpb.currentPage-5<1}">
                    <c:forEach begin="1" end="10" step="1" var="i">
                        <%--页码--%>
                        <c:if test="${bpb.currentPage==i}">
                            <li class="active"><a href="${pageContext.request.contextPath}/admin/findByPage?currentPage=${i}&bookName=${bookName}&bookAuthor=${bookAuthor}&cid=${cid}">${i}</a></li>
                        </c:if>
                        <c:if test="${bpb.currentPage!=i}">
                            <li><a href="${pageContext.request.contextPath}/admin/findByPage?currentPage=${i}&bookName=${bookName}&bookAuthor=${bookAuthor}&cid=${cid}">${i}</a></li>
                        </c:if>
                    </c:forEach>
                </c:if>
                <c:if test="${bpb.currentPage+4>bpb.totalPage}">
                    <c:forEach begin="${bpb.totalPage-9}" end="${bpb.totalPage}" step="1" var="i">
                        <%--页码--%>
                        <c:if test="${bpb.currentPage==i}">
                            <li class="active"><a href="${pageContext.request.contextPath}/admin/findByPage?currentPage=${i}&bookName=${bookName}&bookAuthor=${bookAuthor}&cid=${cid}">${i}</a></li>
                        </c:if>
                        <c:if test="${bpb.currentPage!=i}">
                            <li><a href="${pageContext.request.contextPath}/admin/findByPage?currentPage=${i}&bookName=${bookName}&bookAuthor=${bookAuthor}&cid=${cid}">${i}</a></li>
                        </c:if>
                    </c:forEach>
                </c:if>
            </c:if>


            <%--下一页--%>
            <c:if test="${bpb.currentPage>=bpb.totalPage}">
                <li class="disabled"><a href="#" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
            </c:if>
            <c:if test="${bpb.currentPage<bpb.totalPage}">
                <li ><a href="${pageContext.request.contextPath}/admin/findByPage?currentPage=${bpb.currentPage+1}&bookName=${bookName}&bookAuthor=${bookAuthor}&cid=${cid}" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
            </c:if>
            <%--尾页--%>
            <li><a href="${pageContext.request.contextPath}/admin/findByPage?currentPage=${bpb.totalPage}&bookName=${bookName}&bookAuthor=${bookAuthor}&cid=${cid}" aria-label="Next"><span aria-hidden="true">尾页</span></a></li>


        </c:if>

        <li><span>共${bpb.totalCount}条记录</span>
        <li><span>共${bpb.totalPage}页</span></li>
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
    /*弹出书籍内容*/
    function info(v) {
        alert(v);
    }
    /*全选全不选*/
    var allCbs=$("[name='allCb']");
    $("#firstCb").click(function () {
        for (var i=0;i<allCbs.length;i++){
            allCbs[i].checked=this.checked;
        }
    })
    /*编辑图书方法*/
    function updateBookInfo(bid) {
        if (confirm("您确定要编辑该内容吗")){
            location.href="${pageContext.request.contextPath}/admin/updateBookInfoFirst?bid="+bid+"&currentPage=${bpb.currentPage}";
        }
    }
    $("#addBut").click(function () {
        if (confirm("您确定要添加书籍吗")){
            location.href="${pageContext.request.contextPath}/admin/addBookInfoFirst";
        }
    })

    /*删除方法*/
    function deleteByBid(bid) {
            if (confirm("您确定要删除吗")){
                location.href="${pageContext.request.contextPath}/admin/deleteBook?bid="+bid+"&currentPage=${bpb.currentPage}";
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