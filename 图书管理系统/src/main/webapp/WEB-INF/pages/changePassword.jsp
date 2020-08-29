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
<form id="form" action="${pageContext.request.contextPath}/update">
    <div class="form-group">
        <label for="password1">原始密码</label>
        <input type="password" class="form-control" id="password1" placeholder="Password" name="password1">
        <span id="s_password1" style="color: red"></span>
    </div>
    <div class="form-group">
        <label for="password2">密码</label>
        <input type="password" class="form-control" id="password2" placeholder="Password" name="password2">
        <span id="s_password2" style="color: red"></span>
    </div>
    <button type="submit" class="btn btn-default">修改密码</button>
</form>


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


    var form = document.getElementById("form");
    form.onsubmit=function () {
        return  checkPassword1()&&checkPassword2();
    }

    function checkPassword1() {
        var flag=false;
        var password1 = document.getElementById("password1").value;
        if (password1==${login.password}){
            flag=true;
        }
        var s_password1 = document.getElementById("s_password1");
        if (flag) {
            //对勾
            s_password1.innerHTML="<img src='${pageContext.request.contextPath}/images/gou.png' width='35' height='25'>";

        } else {
            //提示红色警号 用户名有误
            s_password1.innerHTML="原始密码有误";


        }
        return flag;
    }
    function checkPassword2() {
        var password2 = document.getElementById("password2").value;
        var reg_password2=/^\w{6,12}$/;
        var flag=reg_password2.test(password2);
        var s_password2 = document.getElementById("s_password2");
        if (flag) {
            //对勾
            s_password2.innerHTML="<img src='../../images/gou.png' width='35' height='25'>";

        } else {
            //提示红色警号 用户名有误
            s_password2.innerHTML="密码格式有误";


        }
        return flag;
    }
</script>

</body>
</html>