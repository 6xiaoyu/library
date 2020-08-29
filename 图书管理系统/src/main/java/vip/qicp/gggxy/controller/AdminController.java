package vip.qicp.gggxy.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import vip.qicp.gggxy.domain.*;
import vip.qicp.gggxy.service.AdminService;
import vip.qicp.gggxy.service.BookInfoService;
import vip.qicp.gggxy.service.BorrowService;
import vip.qicp.gggxy.service.ClassInfoService;
import vip.qicp.gggxy.service.impl.UserServiceImpl;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    AdminService adminService;
    @Autowired
    UserServiceImpl userService;
    @Autowired
    BookInfoService bookInfoService;
    @Autowired
    BorrowService borrowService;
    @Autowired
    ClassInfoService classInfoService;
    @Autowired(required = false)
    private HttpSession sellerSession;
    //图书类别
    List<ClassInfo> classInfos;

    @RequestMapping("/login")
    public String login(){
        List<Admin> admins = adminService.findAll();
        System.out.println(admins);
        return "userPage";
    }

    /**
     * 展示查询分页功能
     * @param row
     * @param currentPage
     * @param bookName
     * @param bookAuthor
     * @param model
     * @return
     */
    @RequestMapping("/findByPage")
    public String findByPage(Integer row, Integer currentPage, String bookName, String bookAuthor,Integer cid, Model model) {
        //加载书籍类别
        classInfos = bookInfoService.findClassInfos();
        model.addAttribute("classInfos", classInfos);
        model.addAttribute("cid", cid);
        /**
         * 分页复杂查询
         */
        if (row == null || "".equals(row)) {
            row = 10;
        }
        if (currentPage == null || "".equals(currentPage)) {
            currentPage = 1;
        }
        //调用service
        PageBean<BookInfo> booksByPage = bookInfoService.findBooksByPage(row, currentPage, bookName, bookAuthor, cid);
        System.out.println(booksByPage);
        //回显功能
        model.addAttribute("bookName", bookName);
        model.addAttribute("bookAuthor", bookAuthor);
        //存入
        model.addAttribute("bpb",booksByPage);
        return "adminPage";
    }


    /**
     * 借阅功能
     * @param allCb
     * @param bid
     * @return
     */
    @RequestMapping("/deleteBook")
    public String borrow(Integer[] allCb,Integer bid,Integer currentPage,Model model){
        if (currentPage==null){
            currentPage=1;
        }
        bookInfoService.deleteBookById(bid,allCb);
        return "forward:findByPage?currentPage="+currentPage;
    }

    /**
     * 图书编辑功能中转
     * @param bid
     * @return
     * */
    @RequestMapping("/updateBookInfoFirst")
    public String updateBookInfoFirst(Integer bid,Integer currentPage,Model model){
        if (currentPage==null){
            currentPage=1;
        }
        model.addAttribute("classInfos", classInfos);
        model.addAttribute("bid", bid);
        model.addAttribute("currentPage", currentPage);
        return "updateBookInfo";
    }

    /**
     * 图书编辑功能
     * @return
     * */
    @RequestMapping("/updateBookInfo")
    public String updateBookInfo(Integer currentPage,BookInfo bookInfo){
        if (bookInfo.getPubDate()==""){
            bookInfo.setPubDate(null);
        }
        bookInfoService.updateBookInfoByBookId(bookInfo);
        return "redirect:/admin/findByPage?currentPage"+currentPage;
    }

    /**
     * 图书添加功能
     * @return
     * */
    @RequestMapping("/addBookInfo")
    public String addBookInfo(BookInfo bookInfo){
        if (bookInfo.getPubDate()==""){
            bookInfo.setPubDate(null);
        }
        bookInfoService.addBookInfoByBookId(bookInfo);
        return "redirect:/admin/findByPage";
    }
    /**
     * 图书添加功能中转
     * @return
     * */
    @RequestMapping("/addBookInfoFirst")
    public String addBookInfoFirst(Model model){
        model.addAttribute("classInfos", classInfos);
        return "addBookInfo";
    }

    /**
     * 书类管理
     * @param model
     * @return
     */
    @RequestMapping("/classManage")
    public String classManage(Model model){
        classInfos = bookInfoService.findClassInfos();
        model.addAttribute("classInfos",classInfos);
        return "classManage";
    }


    /**
     * 删除类别
     * @param model
     * @param allCb
     * @param cid
     * @return
     */
    @RequestMapping("/deleteClassInfo")
    public String deleteClassInfo(Model model,Integer[] allCb,Integer cid){
        classInfoService.deleteByCid(allCb,cid);
        classInfos = bookInfoService.findClassInfos();
        model.addAttribute("classInfos",classInfos);
        return "classManage";
    }

    /**
     * 添加类中转
     * @return
     */
    @RequestMapping("/addClassInfoFirst")
    public String addClassInfoFirst(){

        return "addClassInfo";
    }

    /**
     * 添加类
     * @return
     */
    @RequestMapping("/addClassInfo")
    public String addClassInfo(ClassInfo classInfo,Model model){
        classInfoService.addClassInfo(classInfo);
        classInfos = bookInfoService.findClassInfos();
        model.addAttribute("classInfos",classInfos);
        return "classManage";
    }

    /**
     * 更新类中转
     * @return
     */
    @RequestMapping("/updateClassInfoFirst")
    public String updateClassInfoFirst(Integer cid,Model model){
        model.addAttribute("cid",cid);
        return "updateClassInfo";
    }

    /**
     * 更新类
     * @return
     */
    @RequestMapping("/updateClassInfo")
    public String updateClassInfo(ClassInfo classInfo,Model model){
        classInfoService.updateClassInfo(classInfo);
        classInfos = bookInfoService.findClassInfos();
        model.addAttribute("classInfos",classInfos);
        return "classManage";
    }


    /**
     * 查询用户的分页查询
     * @param row
     * @param currentPage
     * @param username
     * @param uid
     * @param model
     * @return
     */
    @RequestMapping("/findUserByPage")
    public String findUserByPage(Integer row, Integer currentPage,  String username,Integer uid, Model model) {
        /**
         * 分页复杂查询
         */
        if (row == null || "".equals(row)) {
            row = 10;
        }
        if (currentPage == null || "".equals(currentPage)) {
            currentPage = 1;
        }
        //调用service
        PageBean<User> usersByPage = userService.findUsersByPage(row, currentPage, username,uid);
        System.out.println(usersByPage);
        //回显功能
        model.addAttribute("username", username);
        model.addAttribute("uid", uid);
        //存入
        model.addAttribute("upb",usersByPage);
        return "userManage";
    }


    /**
     * 删除用户
     * @param uid
     * @return
     */
    @RequestMapping("/deleteUser")
    public String deleteUser(Integer uid,String currentPage){
         userService.deleteUserByUid(uid);
        return "redirect:findUserByPage?currentPage="+currentPage;
    }

    /**
     * 添加用户中转
     * @return
     */
    @RequestMapping("/addUserFirst")
    public String addUserFirst(){

        return "addUser";
    }

    /**
     * 添加用户
     * @return
     */
    @RequestMapping("/addUser")
    public String addUser(User user){
        if (user.getBirthday()==""){
            user.setBirthday(null);
        }
        userService.addUser(user);
        return "redirect:findUserByPage";
    }


    /**
     * 用户编辑功能中转
     * @param uid
     * @return
     * */
    @RequestMapping("/updateUserFirst")
    public String updateUserFirst(Integer uid,Integer currentPage,Model model){
        if (currentPage==null){
            currentPage=1;
        }
        model.addAttribute("uid", uid);
        model.addAttribute("currentPage", currentPage);
        return "updateUser";
    }

    /**
     * 用户编辑功能
     * @return
     * */
    @RequestMapping("/updateUser")
    public String updateUser(Integer currentPage,User user){
        if (user.getBirthday()==""){
            user.setBirthday(null);
        }
        userService.updateUserByUid(user);
        return "redirect:/admin/findUserByPage?currentPage"+currentPage;
    }

    /**
     * 分页查询管理员借阅记录
     * @param uid
     * @param bookId
     * @return
     */
    @RequestMapping("/findAdminBorrowByPage")
    public String findAdminBorrowByPage(Integer currentPage,Integer row,Integer uid,Integer bookId,Integer state,Model model){
        if (row==null||"".equals(row)){
            row=10;
        }
        if (currentPage==null||"".equals(currentPage)){
            currentPage=1;
        }

        PageBean<UserBook> borrowByPage = borrowService.findAdminBorrowByPage(currentPage,row,uid,bookId,state);
        model.addAttribute("rpb",borrowByPage);
        //回显功能
        model.addAttribute("uid",uid);
        model.addAttribute("bookId",bookId);
        model.addAttribute("state",state);

        return "adminBorrowManage";
    }

    /**
     * 管理员确认归还
     * @param allCb
     * @return
     */
    @RequestMapping("/backBook")
    public String backBook(Integer[] allCb,Integer sernum,Integer currentPage){
        if (currentPage==null){
            currentPage=1;
        }

        if (sernum!=null){
                //更改状态为1
                borrowService.updateStateTo1(sernum);
                //添加书的数量
                bookInfoService.bookNumUp(sernum);

        }
        if (allCb!=null){
            for (Integer Cb:allCb){
                    //更改状态为1
                borrowService.updateStateTo1(Cb);
                    //添加书的数量
                bookInfoService.bookNumUp(Cb);

            }
        }
        return "forward:findAdminBorrowByPage?currentPage="+currentPage;
    }
}
