<nav class="navbar navbar-default">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="success.jsp">图书管理系统</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <!-- Single button -->
                <div class="btn-group">
                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        图书管理 <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu">
                        <li><a href="#">图书列表</a></li>
                        <li><a href="#">分类管理</a></li>
                    </ul>
                </div>

                <li><a href="#">读者列表 <span class="sr-only">(current)</span></a></li>
                <li><a href="#">借阅管理</a></li>
                <li><a href="#">修改密码</a></li>

            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#"><span id="nowName"></span></a></li>
                <li><a href="#">退出</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">个人信息 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">编号信息:<span id="nowAge"></span></a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">姓名:<span id="nowRelName"></span></a></li>
                    </ul>
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>