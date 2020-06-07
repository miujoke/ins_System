package com.project.booking.dao;


import com.project.booking.entity.Booking;
import com.project.booking.entity.BookingWithBLOBs;

import java.util.Date;
import java.util.List;

public interface BookingMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(BookingWithBLOBs record);

    int insertSelective(BookingWithBLOBs record);

    BookingWithBLOBs selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(BookingWithBLOBs record);

    int updateByPrimaryKeyWithBLOBs(BookingWithBLOBs record);

    int updateByPrimaryKey(Booking record);

    List<BookingWithBLOBs> selectByInsName(String insName, int id);
    List<BookingWithBLOBs> selectByperson(String booking_person,int auditing);
    List<BookingWithBLOBs> selectforTime(String ins_name, Date date, int i, int j);
}