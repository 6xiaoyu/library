package vip.qicp.gggxy.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginIntercept implements HandlerInterceptor {
    /**
     * controller方法执行前，进行拦截的方法
     * return true放行
     * return false拦截
     * 可以使*/
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response,Object handler)throws Exception{
        HttpSession session= request.getSession();
        Object login = session.getAttribute("login");
        if (login!=null){
            return true;
        }else {
            session.setAttribute("login_error","请登入");
            response.sendRedirect(request.getContextPath()+"/login.jsp");
            return false;
        }

    }
}
