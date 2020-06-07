package com.project.common.utils;

import com.project.booking.entity.BookingWithBLOBs;

import java.util.Date;
import java.util.List;


public class BookingTime {
    public static boolean bookingTime(List<BookingWithBLOBs> bookings , Date startTime,Date endTime){
       int i = 0;

        for (BookingWithBLOBs booking:bookings){
            if(startTime.getTime()>booking.getBookingStopTime().getTime()||endTime.getTime()<booking.getBookingStartTime().getTime()){
                i++;
            }else {
                break;
            }
        }
        if(i==bookings.size()){
            return true;
        }else {
            return false;
        }
    }
}
