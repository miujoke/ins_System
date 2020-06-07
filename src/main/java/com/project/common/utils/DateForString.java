package com.project.common.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateForString {

    public static   String DateToString(Date date){
        SimpleDateFormat sdf =   new SimpleDateFormat( "yyyy-MM-dd HH:mm:ss");
        String str = sdf.format(date);
        return str;
    }

    public static   Date StringToDate(String str){
        SimpleDateFormat sdf =   new SimpleDateFormat( "yyyy-MM-dd HH:mm:ss");
       Date date = null;
        try {
            date = sdf.parse( str );

        } catch (ParseException e) {
            e.printStackTrace();
        }
        return date;
    }
    public static  void main(String[] args){
        String str = "2019-04-02 10:20:30";
        Date date = StringToDate(str);
        System.out.println(date);
    }
}
