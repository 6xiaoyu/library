<%--
Created by IntelliJ IDEA.
User: gxy
Date: 2020/7/16
Time: 22:39
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"  %>

<html>
<head>
    <meta charset="utf-8">
    <title>注册页面</title>

<style>
    *{
        margin: 0px;
        padding: 0px;
        box-sizing: border-box;
    }
    body{
        background: url("images/bg.png") no-repeat center ;
        padding-top: 150px;
    }
    .rg_right p a {
        color:pink;
    }
    .rg_layout{
        width: 900px;
        height: 500px;
        border: 8px solid #EEEEEE;
        background-color: white;
        /*让div水平居中*/
        margin: auto;
    }

    .rg_left{
        /*border: 1px solid red;*/
        float: left;
        margin: 15px;
    }
    .rg_left > p:first-child{
        color:#FFD026;
        font-size: 20px;
    }

    .rg_left > p:last-child{
        color:#A6A6A6;
        font-size: 20px;

    }


    .rg_center{
        float: left;
       /* border: 1px solid red;*/

    }

    .rg_right{
        /*border: 1px solid red;*/
        float: right;
        margin: 15px;
    }

    .rg_right > p:first-child{
        font-size: 15px;

    }
    .rg_right p a {
        color:pink;
    }

    .td_left{
        width: 100px;
        text-align: right;
        height: 45px;
    }
    .td_right{
        padding-left: 50px ;
    }
    .error{
        color: red;
    }

    #username,#password,#email,#name,#tel,#birthday,#checkCode{
        width: 251px;
        height: 32px;
        border: 1px solid #A6A6A6 ;
        /*设置边框圆角*/
        border-radius: 5px;
        padding-left: 10px;
    }
    #checkCode{
        width: 251px;
        height: 32px;
        margin-bottom: 15px;
    }



    #sub{
        width: 150px;
        height: 40px;
        background-color: #FFD026;
        border: 1px solid #FFD026 ;

    }
    #td_sub{
        padding-left: 150px;
    }


</style>
    <script src="${pageContext.request.contextPath}/js/ac.js"></script>
</head>
<body>

<div class="rg_layout">
    <div class="rg_left">
        <p>新用户注册</p>
        <p>USER REGISTER</p>

    </div>

    <div class="rg_center">
        <div class="rg_form">
            <!--定义表单 form-->
            <form action="user/reg" method="post" id="form">
                <table>
                    <tr>
                        <td class="td_left"><label for="username">用户名</label></td>
                        <td class="td_right">
                            <input type="text" name="username" id="username" placeholder="请输入用户名">
                            <span id="s_username" class="error"></span>
                        </td>

                    </tr>

                    <tr>
                        <td class="td_left"><label for="password">密码</label></td>
                        <td class="td_right">
                            <input type="password" name="password" id="password" placeholder="请输入密码">
                            <span id="s_password" class="error"></span>
                        </td>
                    </tr>


                    <tr>
                        <td class="td_left"><label for="email">Email</label></td>
                        <td class="td_right"><input type="email" name="email" id="email" placeholder="请输入邮箱"></td>
                    </tr>

                    <tr>
                        <td class="td_left"><label for="name">姓名</label></td>
                        <td class="td_right"><input type="text" name="relname" id="name" placeholder="请输入姓名"></td>
                    </tr>

                    <tr>
                        <td class="td_left"><label for="tel">手机号</label></td>
                        <td class="td_right"><input type="text" name="phone" id="tel" placeholder="请输入手机号"></td>
                    </tr>

                    <tr>
                        <td class="td_left"><label>性别</label></td>
                        <td class="td_right">
                            <input type="radio" name="sex" value="male" checked> 男
                            <input type="radio" name="sex" value="female"> 女
                        </td>
                    </tr>

                    <tr>
                        <td class="td_left"><label for="birthday">出生日期</label></td>
                        <td class="td_right"><input type="date" name="birthday" id="birthday" placeholder="请输入出生日期"></td>
                    </tr>

                    <tr>
                        <td class="td_left"><label for="checkCode" >验证码</label></td>
                        <td class="td_right"><input type="text"  id="checkCode" placeholder="请输入验证码(区分大小写)">
                            <canvas id="canvas" width="100" height="43" onclick="dj()"
                                    style="border: 1px solid #ccc;
                                    border-radius: 5px;"></canvas>
                            <span id="s_check" class="error"></span>
                        </td>
                    </tr>


                    <tr>
                        <td colspan="2"  id="td_sub"><input type="submit" id="sub" value="注册"></td>

                    </tr>
                </table>

            </form>


        </div>

    </div>

    <div class="rg_right">
        <p>已有账号?<a href="login.jsp" >立即登录</a></p>
    </div>
</div>


    <script>
        dj();
    var form = document.getElementById("form");
    form.onsubmit=function () {
            /*if(checkAc()){
                return  checkUsername()&&checkPassword();
            }else{
                var s_check=document.getElementById("s_check");
                s_check.innerHTML="验证码有误";
                return false;
            }*/
        return  checkUsername()&&checkPassword()&&checkAc();
    }
    document.getElementById("username").onblur=checkUsername;
    document.getElementById("password").onblur=checkPassword;
    document.getElementById("checkCode").onblur=checkAc;
    function checkUsername() {
        var username = document.getElementById("username").value;
        var reg_username=/^\w{6,12}$/;
        var flag=reg_username.test(username);
        var s_username = document.getElementById("s_username");

        if (flag) {
            //对勾
            s_username.innerHTML="<img src='images/gou.png' width='35' height='25'>";

        } else {
            //提示红色警号 用户名有误
            s_username.innerHTML="用户名格式有误";


        }
        return flag;
    }
    function checkPassword() {
        var password = document.getElementById("password").value;
        var reg_password=/^\w{6,12}$/;
        var flag=reg_password.test(password);
        var s_password = document.getElementById("s_password");
        if (flag) {
            //对勾
            s_password.innerHTML="<img src='images/gou.png' width='35' height='25'>";

        } else {
            //提示红色警号 用户名有误
            s_password.innerHTML="用户名格式有误";


        }
        return flag;
    }






</script>
</body>
</html>