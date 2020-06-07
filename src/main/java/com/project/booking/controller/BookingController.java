package com.project.booking.controller;

import com.project.booking.entity.BookingWithBLOBs;
import com.project.booking.service.BookingService;
import com.project.common.utils.ApiResult;
import com.project.common.utils.DateForString;
import com.project.user.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import static com.project.common.utils.BookingTime.bookingTime;
import static com.project.common.utils.DateForString.DateToString;
import static com.project.common.utils.DateForString.StringToDate;

@Controller
@RequestMapping("/booking")
public class BookingController {

    @Autowired
    private BookingService bookingService;


    @RequestMapping()
    public String index(){
        return "index";
    }


    /**
     *@Description: 教师填写预约表
     */
    @RequestMapping("/bookin")
    @ResponseBody
    public ApiResult<String> booking(HttpServletRequest request){
        ApiResult<String> resp = new ApiResult<>();
        BookingWithBLOBs booking = new BookingWithBLOBs();
        String str = request.getParameter("ins_name");
        booking.setInsName(str);
        booking.setProName(request.getParameter("pro_name"));
        booking.setProName(request.getParameter("pro_name"));
        booking.setProNumber(request.getParameter("pro_number"));
        booking.setProSource(request.getParameter("pro_source"));
        booking.setProPerson(request.getParameter("pro_person"));
        booking.setProPersonMobile(request.getParameter("pro_person_mobile"));
        booking.setBookingPersonMobile(request.getParameter("booking_person_mobile"));
        User user = (User) request.getSession().getAttribute("user");
        booking.setBookingPerson(user.getRealName());
        booking.setSample(request.getParameter("sample"));
        booking.setBookingEvent(request.getParameter("booking_event"));
        booking.setBookingPersonNumber(request.getParameter("booking_person_number"));
        booking.setFeeSource(request.getParameter("fee_source"));
        if(request.getParameter("booking_operation_skill").equals("是")){
            booking.setBookingOperationSkill(1);
        }else{
            booking.setBookingOperationSkill(0);
        }
        Date startTime = StringToDate(request.getParameter("booking_start_time"));
        Date endTime = StringToDate(request.getParameter("booking_stop_time"));
       if (startTime.getTime()>endTime.getTime()){
           Date date = startTime;
           startTime =endTime;
           endTime = date;
       }
        booking.setBookingStartTime(startTime);
        booking.setBookingStopTime(endTime);
        booking.setFeeScale(request.getParameter("fee_scale"));
        booking.setFeeSource(request.getParameter("fee_source"));
        booking.setAuditing(1);
        Date date = new Date();
        List<BookingWithBLOBs> bookingWithBLOBs = bookingService.selectforTime(str,date,1,2);
        if(bookingTime(bookingWithBLOBs,startTime,endTime)){
            bookingService.insertSelective(booking);
            resp.setMessage("操作成功");
        }else {
            resp.setMessage("所选的时间范围冲突，请重新申请");
        }
        return resp;
    }


/**
*@Description:教师查询自己的预约记录
*/
    @RequestMapping("myBooking")
    @ResponseBody
    public ApiResult<List<BookingWithBLOBs>> myBooking(HttpServletRequest request){
        ApiResult<List<BookingWithBLOBs>> resp = new ApiResult<>();
        int id = Integer.parseInt(request.getParameter("id"));
        User user = (User) request.getSession().getAttribute("user");
        List<BookingWithBLOBs> bookingWithBLOBs = bookingService.selectByperson(user.getRealName(),id);
        for (BookingWithBLOBs booking : bookingWithBLOBs){
            booking.setStatTime(DateToString(booking.getBookingStartTime()));
            booking.setEndTime(DateToString(booking.getBookingStopTime()));
        }
        resp.setData(bookingWithBLOBs);
        resp.setMessage("操作成功");
        return resp;
    }

    /**
    *@Description:教师修改自己的预约记录
    */
    @RequestMapping("/updateMyBooking")
    @ResponseBody
    public ApiResult<String> updateMyBooking(HttpServletRequest request){
        ApiResult<String> resp = new ApiResult<>();
        BookingWithBLOBs booking = new BookingWithBLOBs();
        DateForString dateForString = new DateForString();
        booking.setId(Integer.valueOf(request.getParameter("id")));
        booking.setInsName(request.getParameter("ins_name"));
        booking.setProName(request.getParameter("pro_name"));
        booking.setProNumber(request.getParameter("pro_number"));
        booking.setProSource(request.getParameter("pro_source"));
        booking.setProPerson(request.getParameter("pro_person"));
        booking.setProPersonMobile(request.getParameter("pro_person_mobile"));
        User user = (User) request.getSession().getAttribute("user");
        booking.setBookingPerson(user.getRealName());
        booking.setBookingPersonMobile(user.getMobile());
        booking.setSample(request.getParameter("sample"));
        booking.setBookingEvent(request.getParameter("booking_event"));
        booking.setBookingPersonNumber(request.getParameter("booking_person_number"));
        booking.setBookingOperationSkill(Integer.parseInt(request.getParameter("booking_operation_skill")));
        booking.setBookingStartTime(StringToDate(request.getParameter("booking_start_time")));
        booking.setBookingStopTime(StringToDate( request.getParameter("booking_stop_time")));
        booking.setFeeScale(request.getParameter("fee_scale"));
        booking.setFeeSource(request.getParameter("fee_source"));
        booking.setAuditing(1);
        bookingService.updateByPrimaryKeySelective(booking);
        resp.setMessage("操作成功");
        return resp;
    }
    /**
    *@Description:教师删除自己的预约表
    */
    @RequestMapping("/deletMyBooking")
    @ResponseBody
    public ApiResult<String> deletMyBooking(HttpServletRequest request){
        ApiResult<String> resp = new ApiResult<>();
        int id = Integer.valueOf(request.getParameter("id"));
        bookingService.deleteByPrimaryKey(id);
        resp.setMessage("操作成功");
        return resp;
    }
//    /**
//    *@Author: pan
//    *@Description:教师最终确认预约
//    *@Date: 上午 11:28 2019/4/19 0019
//    */
//    @RequestMapping("/agreebooing")
//    @ResponseBody
//    public ApiResult<String> agreebooing(HttpServletRequest request){
//        ApiResult<String> resp = new ApiResult<>();
//        int id = Integer.valueOf(request.getParameter("id"));
//        BookingWithBLOBs booking = new BookingWithBLOBs();
//        booking.setId(id);
//        booking.setAuditing(3);
//        bookingService.updateByPrimaryKeySelective(booking);
//        resp.setMessage("操作成功");
//        return resp;
//    }


    /****
     * 通过仪器预约id查询仪器预约单
     * **/

    @RequestMapping("/selectById")
    @ResponseBody
    public ApiResult<BookingWithBLOBs> selectById(HttpServletRequest request){
        ApiResult<BookingWithBLOBs> resp = new ApiResult<>();
        int id = Integer.valueOf(request.getParameter("id"));
        BookingWithBLOBs booking = bookingService.selectByPrimaryKey(id);
        booking.setStatTime(DateToString(booking.getBookingStartTime()));
        booking.setEndTime(DateToString(booking.getBookingStopTime()));
        resp.setData(booking);
        resp.setMessage("操作成功");
        return resp;
    }
    /**
     *@Description:返回每个仪器的所有预约时间
     */
    @RequestMapping("/selectforTime")
    @ResponseBody
    public ApiResult<List<BookingWithBLOBs>> selectforTime(HttpServletRequest request){
        ApiResult<List<BookingWithBLOBs>> resp = new ApiResult<>();
        String str = request.getParameter("ins_name");
        List<BookingWithBLOBs> bookings = new ArrayList<>();
        Date date = new Date();
        List<BookingWithBLOBs> bookingWithBLOBs = bookingService.selectforTime(str,date,1,2);
        for (BookingWithBLOBs booking : bookingWithBLOBs){
            BookingWithBLOBs booking1 = new BookingWithBLOBs();
            booking1.setStatTime(DateToString(booking.getBookingStartTime()));
            booking1.setEndTime(DateToString(booking.getBookingStopTime()));
            booking1.setInsName(booking.getInsName());
            bookings.add(booking1);
        }
        resp.setData(bookings);
        resp.setMessage("操作成功");
        return resp;
    }








}
