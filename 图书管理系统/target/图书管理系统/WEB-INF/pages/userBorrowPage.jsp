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
    <script  src="${pageContext.request.contextPath}/js/userHead.js"></script>

</head>
<body>
<form class="navbar-form navbar-left" role="search" style="margin-left: 5%;margin-top: 5px" action="${pageContext.request.contextPath}/user/findBorrowedByPage">
    <div class="form-group" style="margin-right: 50px">
        <input type="text" class="form-control" placeholder="请输入图书DI" name="bookId" value="${bookId}">
    </div>
    <!-- 样式1 -->
    <select class="form-control" name="state">
        <option value="">请选择归还状态</option>
        <option value="0">未还</option>
        <option value="1">已还</option>
        <option value="2">待处理</option>
    </select>
    <button type="submit" class="btn btn-default" >搜索</button>
</form>


<form action="#" style="margin-top: 10px" id="borrowForm">
    <table class="table table-hover">
        <tr>
            <th><input type="checkbox" id="firstCb" ></th>
            <th>借阅号</th>
            <th>图书ID</th>
            <th>图书名称</th>
            <th>借阅时间</th>
            <th>最晚归还时间</th>
            <th>产生罚款</th>
            <th>当前状态</th>
        </tr>
        <c:forEach var="borrow" items="${rpb.list}" varStatus="s">
            <tr>
                <td><input type="checkbox" name="allCb" value="${borrow.bookId}"></td>
                <td>${borrow.sernum}</td>
                <td>${borrow.bookId}</td>
                <td>${borrow.bookNames}</td>
                <td>${borrow.date}</td>
                <td>${borrow.backDate}</td>
                <td>${borrow.fine}￥</td>
                <td>
                    <c:choose>
                        <c:when test="${borrow.state==0}">
                            <a  class="btn already" href="javascript:ret(${borrow.bookId})" ><i class="glyphicon glyphicon-heart-empty"></i>未还</a>
                        </c:when>
                        <c:when test="${borrow.state==1}">
                            <a  class="btn already" disabled="disabled"><i class="glyphicon glyphicon-heart-empty"></i>已还</a>
                        </c:when>
                        <c:when test="${borrow.state==2}">
                            <a  class="btn already" disabled="disabled" ><i class="glyphicon glyphicon-heart-empty"></i>待处理</a>
                        </c:when>
                    </c:choose>

                </td>
            </tr>
        </c:forEach>
    </table>

</form>

<nav style="float: bottom;margin-left: 20px">
    <ul class="pagination pagination-lg" >

        <c:if test="${rpb.totalCount>0}">

            <%--首页--%>
            <li><a href="${pageContext.request.contextPath}/user/findBorrowedByPage?currentPage=1&bookId=${bookId}&state=${state}" aria-label="Previous"><span aria-hidden="true">首页</span></a></li>
            <%--上一页--%>
            <c:if test="${rpb.currentPage<=1}">
                <li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
            </c:if>
            <c:if test="${rpb.currentPage>1}">
                <li ><a href="${pageContext.request.contextPath}/user/findBorrowedByPage?currentPage=${rpb.currentPage-1}&bookId=${bookId}&state=${state}" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
            </c:if>


            <%--如果总页码《10--%>
            <c:if test="${rpb.totalPage<=10}">
                <c:forEach begin="1" end="${rpb.totalPage}" step="1" var="i">
                    <%--页码--%>
                    <c:if test="${rpb.currentPage==i}">
                        <li class="active"><a href="${pageContext.request.contextPath}/user/findBorrowedByPage?currentPage=${i}&bookId=${bookId}&state=${state}">${i}</a></li>
                    </c:if>
                    <c:if test="${rpb.currentPage!=i}">
                        <li><a href="${pageContext.request.contextPath}/user/findBorrowedByPage?currentPage=${i}&bookId=${bookId}&state=${state}">${i}</a></li>
                    </c:if>
                </c:forEach>
            </c:if>
            <%--如果大于10--%>
            <c:if test="${rpb.totalPage>10}">
                <c:if test="${rpb.currentPage-5>=1 and rpb.currentPage+4<=rpb.totalPage}">
                    <c:forEach begin="${rpb.currentPage-5}" end="${rpb.currentPage+4}" step="1" var="i">
                        <%--页码--%>
                        <c:if test="${rpb.currentPage==i}">
                            <li class="active"><a href="${pageContext.request.contextPath}/user/findBorrowedByPage?currentPage=${i}&bookId=${bookId}&state=${state}">${i}</a></li>
                        </c:if>
                        <c:if test="${rpb.currentPage!=i}">
                            <li><a href="${pageContext.request.contextPath}/user/findBorrowedByPage?currentPage=${i}&bookId=${bookId}&state=${state}">${i}</a></li>
                        </c:if>
                    </c:forEach>
                </c:if>
                <c:if test="${rpb.currentPage-5<1}">
                    <c:forEach begin="1" end="10" step="1" var="i">
                        <%--页码--%>
                        <c:if test="${rpb.currentPage==i}">
                            <li class="active"><a href="${pageContext.request.contextPath}/user/findBorrowedByPage?currentPage=${i}&bookId=${bookId}&state=${state}">${i}</a></li>
                        </c:if>
                        <c:if test="${rpb.currentPage!=i}">
                            <li><a href="${pageContext.request.contextPath}/user/findBorrowedByPage?currentPage=${i}&bookId=${bookId}&state=${state}">${i}</a></li>
                        </c:if>
                    </c:forEach>
                </c:if>
                <c:if test="${rpb.currentPage+4>rpb.totalPage}">
                    <c:forEach begin="${rpb.totalPage-9}" end="${rpb.totalPage}" step="1" var="i">
                        <%--页码--%>
                        <c:if test="${rpb.currentPage==i}">
                            <li class="active"><a href="${pageContext.request.contextPath}/user/findBorrowedByPage?currentPage=${i}&bookId=${bookId}&state=${state}">${i}</a></li>
                        </c:if>
                        <c:if test="${rpb.currentPage!=i}">
                            <li><a href="${pageContext.request.contextPath}/user/findBorrowedByPage?currentPage=${i}&bookId=${bookId}&state=${state}">${i}</a></li>
                        </c:if>
                    </c:forEach>
                </c:if>
            </c:if>


            <%--下一页--%>
            <c:if test="${rpb.currentPage>=rpb.totalPage}">
                <li class="disabled"><a href="#" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
            </c:if>
            <c:if test="${rpb.currentPage<rpb.totalPage}">
                <li ><a href="${pageContext.request.contextPath}/user/findBorrowedByPage?currentPage=${rpb.currentPage+1}&bookId=${bookId}&state=${state}" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
            </c:if>
            <%--尾页--%>
            <li><a href="${pageContext.request.contextPath}/user/findBorrowedByPage?currentPage=${rpb.totalPage}&bookId=${bookId}&state=${state}" aria-label="Next"><span aria-hidden="true">尾页</span></a></li>




        </c:if>


            <li><span>共${rpb.totalCount}条记录</span>
            <li><span>共${rpb.totalPage}页</span></li>
    </ul>

</nav>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

<script>
    /*展示用户信息*/
    $("#nowName").html("${login.username}")
    $("#nowAge").html("${login.age}")
    $("#nowSex").html("${login.sex}")
    $("#nowPhone").html("${login.phone}")
    $("#nowRelName").html("${login.relname}")

    /*全选全不选*/
    var allCbs=$("[name='allCb']");
    $("#firstCb").click(function () {
        for (var i=0;i<allCbs.length;i++){
            allCbs[i].checked=this.checked;
        }
    })

    /*还书方法*/
    function ret(bid) {
        if (confirm("您确定要还书吗")){
            location.href="${pageContext.request.contextPath}/user/returnBook?bid="+bid+"&currentPage=${rpb.currentPage}";
        }

    }



</script>

</body>
</html>