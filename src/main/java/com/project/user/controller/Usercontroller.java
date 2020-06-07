package com.project.user.controller;

import com.project.booking.entity.BookingWithBLOBs;
import com.project.booking.service.BookingService;
import com.project.common.utils.ApiResult;
import com.project.common.utils.DateForString;
import com.project.instrument.entity.InstrumentWithBLOBs;
import com.project.instrument.service.InstrumentService;
import com.project.user.entity.User;
import com.project.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;

import static com.project.common.utils.DateForString.DateToString;
import static com.project.common.utils.MD5Utils.checkPassword;
import static com.project.common.utils.MD5Utils.encrptyPassword;

@Controller
@RequestMapping("admin")
public class Usercontroller {

    @Autowired
    private InstrumentService instrumentService;
    @Autowired
    private BookingService bookingService;
    @Autowired
    private UserService userService;
    @RequestMapping
    public String admin(){
        return "admin";
 }
    /**
    *@Description:专管员登录查询自己管理的仪器有哪些预约单
    */
    @RequestMapping("/selectByBooking")
    @ResponseBody
    public ApiResult<List<BookingWithBLOBs>> selectByBooking(HttpServletRequest request){

        ApiResult<List<BookingWithBLOBs>> resp = new ApiResult<>();
        int id = Integer.parseInt(request.getParameter("id"));
       User user = (User) request.getSession().getAttribute("user");
        List<InstrumentWithBLOBs> instruments = instrumentService.selectByUserId(user.getId());
        List<BookingWithBLOBs> bookingWithBLOBs = new ArrayList<>();
        for (InstrumentWithBLOBs instrument : instruments){
            List<BookingWithBLOBs> bsList =  bookingService.selectByInsName(instrument.getInsName(),id);
            for (BookingWithBLOBs booking :bsList){
                booking.setStatTime(DateToString(booking.getBookingStartTime()));
                booking.setEndTime(DateToString(booking.getBookingStopTime()));
                bookingWithBLOBs.add(booking);
            }
        }
        resp.setData(bookingWithBLOBs);
        return resp;
    }
        /**
        *@Description:专管员同意或者拒绝预约单的申请
        */
    @RequestMapping("/updateByPrimaryKeySelective")
    @ResponseBody
    public ApiResult<String> updateByPrimaryKeySelective(HttpServletRequest request){
        DateForString dateForString = new DateForString();
        ApiResult<String> resp = new ApiResult<>();
        BookingWithBLOBs booking = new BookingWithBLOBs();
        int tableId = Integer.parseInt(request.getParameter("tid"));
        int id = Integer.parseInt(request.getParameter("id"));
            booking.setId(tableId);
            booking.setModify( request.getParameter("modify"));
            booking.setAuditing(id);
            bookingService.updateByPrimaryKeySelective(booking);

        resp.setMessage("操作成功");
        return resp;
    }
    /**
     *@Description:查询是否第一次登陆，如果第一次登陆的话，要求其改密码
     */
    @RequestMapping("/first")
    @ResponseBody
    public ApiResult<Integer> frist(HttpServletRequest request){
        ApiResult<Integer> resp = new ApiResult<>();
        User user = (User) request.getSession().getAttribute("user");
        User user1 =  userService.selectByAerification(user.getId());
        resp.setMessage("操作成功");
        resp.setData(user1.getVerification());
        return resp;
    }

    /**
     *@Description:修改密码
     */
    @RequestMapping("/modify")
    @ResponseBody
    public ApiResult<String> Modify(HttpServletRequest request) throws UnsupportedEncodingException, NoSuchAlgorithmException {
        ApiResult<String> resp = new ApiResult<>();
        String oldPwd =request.getParameter("oldPwd");
        String pwd =request.getParameter("password");
        User user = (User) request.getSession().getAttribute("user");
        if  (checkPassword(oldPwd,user.getPassword())) {
            user.setPassword(encrptyPassword(pwd));
            user.setVerification(1);
            userService.updateByPrimaryKeySelective(user);
            request.getSession().setAttribute("user", user);
            resp.setMessage("操作成功");
        }
        return resp;
    }

    @RequestMapping("/cancel")
    public String cancel(HttpServletRequest request){
        HttpSession session = request.getSession(false);
        session.removeAttribute("user");
        //request.removeAttribute("id");
        return "/login";
    }

    @RequestMapping("/real")
    @ResponseBody
    public ApiResult<Integer> real(HttpServletRequest request){
        ApiResult<Integer> resp  = new ApiResult<>();
        User user = (User) request.getSession().getAttribute("user");
        resp.setMessage("操作成功");
        resp.setData(user.getRoleId());
        return  resp;
    }
}
