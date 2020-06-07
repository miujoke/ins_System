package com.project.common.utils;

import com.project.booking.entity.BookingWithBLOBs;
import freemarker.template.Configuration;
import freemarker.template.Template;

import java.io.*;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class WordTest {
    private Configuration configuration = null;
    public WordTest() {
                 configuration = new Configuration();
                 configuration.setDefaultEncoding("UTF-8");
                 }

    public  String createWord(BookingWithBLOBs booking, String username) {
        DateForString dateForString = new DateForString();
        Map<String, Object> dataMap = new HashMap<String, Object>();

        if(booking.getId()!=null)
            dataMap.put("id",booking.getId());
        else
            dataMap.put("id","");
        if(booking.getProName()!=null)
           dataMap.put("pro_name",booking.getProName());
        else
            dataMap.put("pro_name"," ");
        if(booking.getProSource()!=null)
           dataMap.put("pro_source",booking.getProSource());
        else
            dataMap.put("pro_source"," ");
        if(booking.getProNumber()!=null)
            dataMap.put("pro_number",booking.getProNumber());
        else
            dataMap.put("pro_number"," ");
        if(booking.getProPerson()!=null)
           dataMap.put("pro_person",booking.getProPerson());
        else
            dataMap.put("pro_person"," ");
        if(booking.getProPersonMobile()!=null)
           dataMap.put("pro_person_mobile",booking.getProPersonMobile());
        else
            dataMap.put("pro_person_mobile"," ");
        if(booking.getBookingPerson()!=null)
           dataMap.put("booking_person",booking.getBookingPerson());
        else
            dataMap.put("booking_person"," ");
        if(booking.getProPersonMobile()!=null)
           dataMap.put("booking_person_mobile",booking.getProPersonMobile());
        else
            dataMap.put("booking_person_mobile"," ");
        if(booking.getInsName()!=null)
           dataMap.put("ins_name",booking.getInsName());
        else
            dataMap.put("ins_name"," ");
        if(booking.getSample()!=null)
           dataMap.put("sample",booking.getSample());
        else
            dataMap.put("sample"," ");
        if(booking.getBookingEvent()!=null)
           dataMap.put("booking_event",booking.getBookingEvent());
        else
            dataMap.put("booking_event"," ");
        if(booking.getBookingPersonNumber()!=null)
           dataMap.put("booking_person_number",booking.getBookingPersonNumber());
        else
            dataMap.put("pro_name"," ");
        if(booking.getBookingOperationSkill()!=null)
           dataMap.put("booking_operation_skill",booking.getBookingOperationSkill());
        else
            dataMap.put("pro_name"," ");
        if(booking.getBookingStartTime()!=null && booking.getBookingStopTime()!=null){
           String booking_start_time = dateForString.DateToString(booking.getBookingStartTime())+dateForString.DateToString(booking.getBookingStopTime()) ;
           dataMap.put("booking_start_time",booking_start_time);}
        else
            dataMap.put("booking_start_time"," ");
        if(booking.getFeeScale()!=null)
           dataMap.put("fee_scale",booking.getFeeScale());
        else
            dataMap.put("fee_scale"," ");
        if(booking.getFeeSource()!=null)
           dataMap.put("fee_source",booking.getFeeSource());
        else
            dataMap.put("fee_source"," ");

        try {
        configuration.setDirectoryForTemplateLoading(new File("D:/bookings/"));

            Template template =  configuration.getTemplate("booking.ftl"); //framemaker.ftl为要装载的模板

          // configuration.setClassForTemplateLoading(this.getClass(), "/word");

              // Template template = configuration.getTemplate("booking.ftl");
            Date date = new Date();
            String pathname = "D:/booking-doc/"+username+date.getTime()+".doc";
               File outfile = new File(pathname);
               Writer out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(outfile),"UTF-8"));
               template.process(dataMap,out);
                out.close();
                return pathname;
           } catch (Exception e) {
               e.printStackTrace();
           }



    return "错误";
    }
}
