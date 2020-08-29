<%--
  Created by IntelliJ IDEA.
  User: gxy
  Date: 2020/5/24
  Time: 21:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
  <meta charset="utf-8">
  <title></title>
  <style type="text/css">
    .error{
      color: red;
    }
    * {
      margin: 0px;
    }

    #content {
      margin: 150px auto;
      width: 100%;
      height: 450px;
      border: 1px transparent solid;
      background-color: #21D4FD;
      background-image: linear-gradient(243deg, #21D4FD 0%, #B721FF 100%);
      background-image: -webkit-linear-gradient(243deg, #21D4FD 0%, #B721FF 100%);
      background-image: -moz-linear-gradient(243deg, #21D4FD 0%, #B721FF 100%);
      background-image: -o-linear-gradient(243deg, #21D4FD 0%, #B721FF 100%);
    }

    #box {
      margin: 50px auto;
      width: 30%;
      height: 360px;
      background-color: #fff;
      text-align: center;
      border-radius: 15px;
      border: 2px #fff solid;
      box-shadow: 10px 10px 5px #000000;
    }

    .title {
      line-height: 58px;
      margin-top: 20px;
      font-size: 36px;
      color: #000;
      height: 58px;
    }

    #box:hover {
      border: 2px #fff solid;
    }

    .input {
      margin-top: 20px;
    }

    input {
      margin-top: 5px;
      outline-style: none;
      border: 1px solid #ccc;
      border-radius: 3px;
      padding: 13px 14px;
      width: 70%;
      font-size: 14px;
      font-weight: 700;
      font-family: "Microsoft soft";
    }

    button {
      margin-top: 20px;
      border: none;
      color: #000;
      padding: 15px 32px;
      text-align: center;
      text-decoration: none;
      display: inline-block;
      font-size: 16px;
      border-radius: 15px;
      background-color: #CCCCCC;
    }
    button:hover{
      background-color: #B721FF;
      color: #fff;
    }
    #sub{
      margin-top: 25px;
    }
    #error{
      margin-top: 15px;
    }
    #reg{
      margin-top: 15px;

    }
    #reg p a {
      color:pink;

    }
  </style>
</head>
<body>
<form  action="login" method="post">
  <div id="content">
    <div id="box">
      <div class="title">Login</div>
      <div class="input">
        <input type="text" id="username" name="username" value="" placeholder="用户名" />
        <br>
        <input type="password" id="password" name="password" placeholder="密码" />
        <br>
        <label for="isUser" >User</label>
        <input type="radio" name="who" id="isUser" value="isUser" checked="checked" style="width: 15px;height: 15px" />
        <br>
        <label for="isAdmin">Admin</label>
        <input type="radio" name="who" id="isAdmin" value="isAdmin"  style="width: 15px;height: 15px"/>
        <br>
        <input type="submit" id="sub"  value="登入" >
      </div>
      <div id="error" class="error">${login_error}</div>
      <div id="reg">
        <p>未注册账号?<a target="_blank" href="reg.jsp">立即注册</a></p>
      </div>
    </div>
  </div>
</form>

</body>

</html>
