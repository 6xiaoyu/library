document.writeln("");
document.writeln("<nav class=\'navbar navbar-default\'>");
document.writeln("    <div class=\'container-fluid\'>");
document.writeln("        <!-- Brand and toggle get grouped for better mobile display -->");
document.writeln("        <div class=\'navbar-header\'>");
document.writeln("            <button type=\'button\' class=\'navbar-toggle collapsed\' data-toggle=\'collapse\' data-target=\'#bs-example-navbar-collapse-1\' aria-expanded=\'false\'>");
document.writeln("                <span class=\'sr-only\'>Toggle navigation</span>");
document.writeln("                <span class=\'icon-bar\'></span>");
document.writeln("                <span class=\'icon-bar\'></span>");
document.writeln("                <span class=\'icon-bar\'></span>");
document.writeln("            </button>");
document.writeln("            <a class=\'navbar-brand\' href=\'#\'>图书管理系统</a>");
document.writeln("        </div>");
document.writeln("");
document.writeln("        <!-- Collect the nav links, forms, and other content for toggling -->");
document.writeln("        <div class=\'collapse navbar-collapse\' id=\'bs-example-navbar-collapse-1\'>");
document.writeln("            <ul class=\'nav navbar-nav\'>");
document.writeln("                <li><a href=\'../../_war_exploded/user/findByPage\'>图书列表 <span class=\'sr-only\'>(current)</span></a></li>");
document.writeln("                <li><a href=\'../../_war_exploded/user/findBorrowedByPage\'>借阅记录</a></li>");
document.writeln("                <li><a href=\'../../_war_exploded/updateFirst\'>修改密码</a></li>");
document.writeln("");
document.writeln("            </ul>");
document.writeln("            <ul class=\'nav navbar-nav navbar-right\'>");
document.writeln("                <li><a href=\'#\'><span id=\'nowName\'></span></a></li>");
document.writeln("                <li><a href=\'../../_war_exploded/quit\'>退出</a></li>");
document.writeln("                <li class=\'dropdown\'>");
document.writeln("                    <a href=\'#\' class=\'dropdown-toggle\' data-toggle=\'dropdown\' role=\'button\' aria-haspopup=\'true\' aria-expanded=\'false\'>个人信息 <span class=\'caret\'></span></a>");
document.writeln("                    <ul class=\'dropdown-menu\'>");
document.writeln("                        <li><a href=\'#\'>年龄:<span id=\'nowAge\'></span></a></li>");
document.writeln("                        <li><a href=\'#\'>性别:<span id=\'nowSex\'></span></a></li>");
document.writeln("                        <li><a href=\'#\'>电话:<span id=\'nowPhone\'></span></a></li>");
document.writeln("                        <li role=\'separator\' class=\'divider\'></li>");
document.writeln("                        <li><a href=\'#\'>姓名:<span id=\'nowRelName\'></span></a></li>");
document.writeln("                    </ul>");
document.writeln("                </li>");
document.writeln("            </ul>");
document.writeln("        </div><!-- /.navbar-collapse -->");
document.writeln("    </div><!-- /.container-fluid -->");
document.writeln("</nav>");