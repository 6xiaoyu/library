package vip.qicp.gggxy.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import vip.qicp.gggxy.domain.Admin;
import vip.qicp.gggxy.domain.User;
import vip.qicp.gggxy.service.AdminService;
import vip.qicp.gggxy.service.UserService;

import javax.servlet.http.HttpSession;

@Controller
@SessionAttributes(names={"login_error","login"},types = {String.class,Object.class})
public class LoginController {
    @Autowired
    UserService userService;
    @Autowired
    AdminService adminService;
    @Autowired(required = false)
    private HttpSession sellerSession;

    /**
     * 登入功能
     * @param user
     * @param admin
     * @param who
     * @param model
     * @return
     */
    @RequestMapping("/login")
    public String login(User user, Admin admin, String who, Model model,SessionStatus sessionStatus){
        if (sellerSession.getAttribute("login")==null){
            if (who!=null){
                if ("isUser".equals(who)){
                    System.out.println(user);
                    User login = userService.login(user);
                    if (login==null){
                        model.addAttribute("login_error","用户名或密码有误");
                        return "redirect:/login.jsp";
                    }
                    model.addAttribute("login",login);
                    return "redirect:user/findByPage";
                }else if ("isAdmin".equals(who)){
                    System.out.println(admin);
                    Admin login = adminService.login(admin);
                    if (login==null){
                        model.addAttribute("login_error","用户名或密码有误");
                        return "redirect:/login.jsp";
                    }
                    model.addAttribute("login",login);
                    return "redirect:admin/findByPage";
                }
            }
            return null;
        }else {
            model.addAttribute("login_error","已有用户登入，请退出");
            return "redirect:/login.jsp";
        }

    }


    /**
     * 退出功能
     * @param sessionStatus
     * @return
     */
    @RequestMapping("/quit")
    public String quit(SessionStatus sessionStatus){
        sellerSession.removeAttribute("login");
        sessionStatus.setComplete();
        return "redirect:/login.jsp";
    }

    /**
     * 修改密码中间转发
     * @return
     */
    @RequestMapping("/updateFirst")
    public String updateFirst(){
        return "changePassword";
    }

    /**
     * 修改密码功能
     * @param password2
     * @return
     */
    @RequestMapping("/update")
    public String update(String password2,SessionStatus sessionStatus){
        User login =(User) sellerSession.getAttribute("login");
        Integer uid=login.getUid();
        userService.changePassword(uid,password2);
        sellerSession.removeAttribute("login");
        sessionStatus.setComplete();
        return "redirect:/login.jsp";
    }


    /**
     * 修改密码中间转发
     * @return
     */
    @RequestMapping("/updateAdFirst")
    public String updateAdFirst(){
        return "changeAdPassword";
    }

    /**
     * 修改密码功能
     * @param password2
     * @return
     */
    @RequestMapping("/updateAd")
    public String updateAd(String password2,SessionStatus sessionStatus){
        Admin login =(Admin) sellerSession.getAttribute("login");
        Integer id=login.getId();
        adminService.changePassword(id,password2);
        sellerSession.removeAttribute("login");
        sessionStatus.setComplete();
        return "redirect:/login.jsp";
    }

}
