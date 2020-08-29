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
<form class="navbar-form navbar-left" role="search" style="margin-left: 5%;margin-top: 5px" action="${pageContext.request.contextPath}/user/findByPage">
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


<button type="button" class="btn btn-default" style="float: right ;margin-top: 85px;margin-right: 5px" id="borrowButs" >一键借阅</button>

<form action="${pageContext.request.contextPath}/user/borrow" style="margin-top: 10px" id="borrowForm">
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
            <th>状态</th>
        </tr>
        <c:forEach var="book" items="${bpb.list}" varStatus="s">
            <tr>
                <c:choose>
                    <c:when test="${book.stock==0 || book.borrow}">
                        <td><input type="checkbox" name="allCb" value="${book.bookId}" disabled="true"></td>
                    </c:when>
                    <c:otherwise>
                        <td><input type="checkbox" name="allCb" value="${book.bookId}"></td>
                    </c:otherwise>
                </c:choose>

                <td>${book.bookId}</td>
                <td onclick="info('${book.introduction}')">${book.name}</td>
                <td>${book.author}</td>
                <td>${book.publish}</td>
                <td>${book.ISBN}</td>
                <td>${book.pubDate}</td>
                <td>${book.stock}</td>
                <td>${book.price}￥</td>
                <td >
                    <c:if test="${book.stock!=0}">
                        <c:choose>
                            <c:when test="${book.borrow}">    <!--如果 -->
                                <a  class="btn already" disabled="disabled"><i class="glyphicon glyphicon-heart-empty"></i>已借阅</a>
                            </c:when>
                            <c:otherwise>  <!--否则 -->
                                <a class="btn" id="borrowBut" href="javascript:bor(${book.bookId})"><i class="glyphicon glyphicon-heart-empty"></i>借阅</a>
                            </c:otherwise>
                        </c:choose>
                    </c:if>

                    <c:if test="${book.stock==0}">
                    <a  class="btn already" disabled="disabled"><i class="glyphicon glyphicon-heart-empty"></i>已无</a>
                    </c:if>
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
            <li><a href="${pageContext.request.contextPath}/user/findByPage?currentPage=1&bookName=${bookName}&bookAuthor=${bookAuthor}&cid=${cid}" aria-label="Previous"><span aria-hidden="true">首页</span></a></li>
            <%--上一页--%>
            <c:if test="${bpb.currentPage<=1}">
                <li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
            </c:if>
            <c:if test="${bpb.currentPage>1}">
                <li ><a href="${pageContext.request.contextPath}/user/findByPage?currentPage=${bpb.currentPage-1}&bookName=${bookName}&bookAuthor=${bookAuthor}&cid=${cid}" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
            </c:if>


            <%--如果总页码《10--%>
            <c:if test="${bpb.totalPage<=10}">
                <c:forEach begin="1" end="${bpb.totalPage}" step="1" var="i">
                    <%--页码--%>
                    <c:if test="${bpb.currentPage==i}">
                        <li class="active"><a href="${pageContext.request.contextPath}/user/findByPage?currentPage=${i}&bookName=${bookName}&bookAuthor=${bookAuthor}&cid=${cid}">${i}</a></li>
                    </c:if>
                    <c:if test="${bpb.currentPage!=i}">
                        <li><a href="${pageContext.request.contextPath}/user/findByPage?currentPage=${i}&bookName=${bookName}&bookAuthor=${bookAuthor}&cid=${cid}">${i}</a></li>
                    </c:if>
                </c:forEach>
            </c:if>
            <%--如果大于10--%>
            <c:if test="${bpb.totalPage>10}">
                <c:if test="${bpb.currentPage-5>=1 and bpb.currentPage+4<=bpb.totalPage}">
                    <c:forEach begin="${bpb.currentPage-5}" end="${bpb.currentPage+4}" step="1" var="i">
                        <%--页码--%>
                        <c:if test="${bpb.currentPage==i}">
                            <li class="active"><a href="${pageContext.request.contextPath}/user/findByPage?currentPage=${i}&bookName=${bookName}&bookAuthor=${bookAuthor}&cid=${cid}">${i}</a></li>
                        </c:if>
                        <c:if test="${bpb.currentPage!=i}">
                            <li><a href="${pageContext.request.contextPath}/user/findByPage?currentPage=${i}&bookName=${bookName}&bookAuthor=${bookAuthor}&cid=${cid}">${i}</a></li>
                        </c:if>
                    </c:forEach>
                </c:if>
                <c:if test="${bpb.currentPage-5<1}">
                    <c:forEach begin="1" end="10" step="1" var="i">
                        <%--页码--%>
                        <c:if test="${bpb.currentPage==i}">
                            <li class="active"><a href="${pageContext.request.contextPath}/user/findByPage?currentPage=${i}&bookName=${bookName}&bookAuthor=${bookAuthor}&cid=${cid}">${i}</a></li>
                        </c:if>
                        <c:if test="${bpb.currentPage!=i}">
                            <li><a href="${pageContext.request.contextPath}/user/findByPage?currentPage=${i}&bookName=${bookName}&bookAuthor=${bookAuthor}&cid=${cid}">${i}</a></li>
                        </c:if>
                    </c:forEach>
                </c:if>
                <c:if test="${bpb.currentPage+4>bpb.totalPage}">
                    <c:forEach begin="${bpb.totalPage-9}" end="${bpb.totalPage}" step="1" var="i">
                        <%--页码--%>
                        <c:if test="${bpb.currentPage==i}">
                            <li class="active"><a href="${pageContext.request.contextPath}/user/findByPage?currentPage=${i}&bookName=${bookName}&bookAuthor=${bookAuthor}&cid=${cid}">${i}</a></li>
                        </c:if>
                        <c:if test="${bpb.currentPage!=i}">
                            <li><a href="${pageContext.request.contextPath}/user/findByPage?currentPage=${i}&bookName=${bookName}&bookAuthor=${bookAuthor}&cid=${cid}">${i}</a></li>
                        </c:if>
                    </c:forEach>
                </c:if>
            </c:if>


            <%--下一页--%>
            <c:if test="${bpb.currentPage>=bpb.totalPage}">
                <li class="disabled"><a href="#" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
            </c:if>
            <c:if test="${bpb.currentPage<bpb.totalPage}">
                <li ><a href="${pageContext.request.contextPath}/user/findByPage?currentPage=${bpb.currentPage+1}&bookName=${bookName}&bookAuthor=${bookAuthor}&cid=${cid}" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
            </c:if>
            <%--尾页--%>
            <li><a href="${pageContext.request.contextPath}/user/findByPage?currentPage=${bpb.totalPage}&bookName=${bookName}&bookAuthor=${bookAuthor}&cid=${cid}" aria-label="Next"><span aria-hidden="true">尾页</span></a></li>


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
    /*展示用户信息*/
    $("#nowName").html("${login.username}")
    $("#nowAge").html("${login.age}")
    $("#nowSex").html("${login.sex}")
    $("#nowPhone").html("${login.phone}")
    $("#nowRelName").html("${login.relname}")
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
    /*借阅方法*/
    function bor(bid) {
        if (${bThan>=5}){
            alert("您已经借阅5本书，已达上限");
        }else{
            if (confirm("您确定要借阅吗")){
                location.href="${pageContext.request.contextPath}/user/borrow?bid="+bid+"&currentPage=${bpb.currentPage}";
            }
        }

    }
    /*总借阅按钮*/
    $("#borrowButs").click(function () {

            if (confirm("您确定要全部借阅吗")) {
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
                    $("#borrowForm").submit();
                }
            }

    })



</script>

</body>
</html>