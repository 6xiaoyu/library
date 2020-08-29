package vip.qicp.gggxy.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import vip.qicp.gggxy.domain.*;
import vip.qicp.gggxy.service.BookInfoService;
import vip.qicp.gggxy.service.BorrowService;
import vip.qicp.gggxy.service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.ParseException;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    UserService userService;
    @Autowired
    BookInfoService bookInfoService;
    @Autowired
    BorrowService borrowService;
    @Autowired(required = false)
    private HttpSession sellerSession;

    /**
     * 注册功能
     * @param user
     * @param response
     * @return
     * @throws IOException
     */
    @RequestMapping("/reg")
    public String reg(User user, HttpServletResponse response) throws IOException {
        System.out.println(user);
        String strBry=user.getBirthday();
        String now = new Date().toString();
        if ("".equals(strBry)){
            user.setBirthday(null);
        }else if (strBry!=null&&strBry.length()>0){
            int nowT = Integer.parseInt(now.substring(24, 28));
            int bry = Integer.parseInt(strBry.substring(0, 4));
            user.setAge(nowT - bry);
        }
        response.setCharacterEncoding("UTF-8");
        System.out.println(user);
        userService.insert(user);
        return "redirect:/login.jsp";
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
    public String findByPage(Integer row, Integer currentPage, String bookName, String bookAuthor,Integer cid, Model model){
        //加载书籍类别
        List<ClassInfo> classInfos = bookInfoService.findClassInfos();
        model.addAttribute("classInfos",classInfos);
        //System.out.println(ids+"hhhhhhhhhhhhhhhhhhh哈哈哈哈哈啊啊啊");
        model.addAttribute("cid",cid);
        /**
         * 分页复杂查询
         */
        if (row==null||"".equals(row)){
            row=10;
        }
        if (currentPage==null||"".equals(currentPage)){
            currentPage=1;
        }
        //调用service
        PageBean<BookInfo> booksByPage = bookInfoService.findBooksByPage(row, currentPage,bookName,bookAuthor,cid);
        System.out.println(booksByPage);
        //回显功能
        model.addAttribute("bookName",bookName);
        model.addAttribute("bookAuthor",bookAuthor);

        /**
         * 判断是否借阅
         *
         * */
        //获取uid
        User login =(User) sellerSession.getAttribute("login");
        Integer uid=login.getUid();
        //根据uid查bookid
        List<Integer> bookIds=borrowService.findBookIdByUid(uid);
        //判断记录中借阅书籍是否大于5
        int bThan=bookIds.size();
        model.addAttribute("bThan",bThan);
        //对比list中的bookI和查出来的bookId如果一样设isBorrow为true
        for (BookInfo bookInfo:booksByPage.getList()){
            bookInfo.setBorrow(false);
            for (Integer bookId:bookIds){
                if (bookId.intValue()==bookInfo.getBookId().intValue()){
                    bookInfo.setBorrow(true);
                    //System.out.println(bookInfo.isBorrow()+"哈啊啊");
                    break;
                }
            }
        }
        //存入
        model.addAttribute("bpb",booksByPage);
        return "userPage";
    }

    /**
     * 借阅功能
     * @param allCb
     * @param bid
     * @return
     */
    @RequestMapping("/borrow")
    public String borrow(Integer[] allCb,Integer bid,Integer currentPage){
        if (currentPage==null){
            currentPage=1;
        }
        //获取登入uid
        User login =(User) sellerSession.getAttribute("login");
        Integer uid=login.getUid();
        if (bid!=null){
            if (borrowService.findByUidAndBookId(uid,bid)){
                //保存插入借阅的记录
                borrowService.save(uid,bid);
                //减少书的数量
                bookInfoService.bookNumDown(bid);
            }
        }
        if (allCb!=null){
            for (Integer Cb:allCb){
                if (borrowService.findByUidAndBookId(uid,Cb)) {
                    //保存插入借阅的记录
                    borrowService.save(uid, Cb);
                    //减少书的数量
                    bookInfoService.bookNumDown(Cb);
                }
            }
        }
        return "forward:findByPage?currentPage="+currentPage;
    }

    /**
     * 分页复杂查询借阅记录
     * @return
     */
    @RequestMapping("/findBorrowedByPage")
    public String borrowedRecord(Integer row, Integer currentPage,Integer bookId,Integer state,Model model) throws ParseException {
        /**
         * 分页复杂查询
         */
        //获取uid
        User login =(User) sellerSession.getAttribute("login");
        Integer uid=login.getUid();
        if (row==null||"".equals(row)){
            row=10;
        }
        if (currentPage==null||"".equals(currentPage)){
            currentPage=1;
        }
        PageBean<UserBook> borrowByPage = borrowService.findBorrowByPage(row, currentPage, bookId, state,uid);
        model.addAttribute("rpb",borrowByPage);
        //回显功能
        model.addAttribute("bookId",bookId);
        model.addAttribute("state",state);
        return "userBorrowPage";
    }


    /**
     * 还书功能
     * @param bid
     * @return
     */
    @RequestMapping("/returnBook")
    public String returnBook(Integer bid,Integer currentPage){
        if (currentPage==null){
            currentPage=1;
        }
        //获取登入uid
        User login =(User) sellerSession.getAttribute("login");
        Integer uid=login.getUid();
        if (bid!=null){
            //修改state状态为2记录
            borrowService.updateState(uid,bid);
        }

        return "forward:findBorrowedByPage?currentPage="+currentPage;
    }
}
