package com.project.booking.service;

import com.project.booking.entity.BookingWithBLOBs;
import com.project.instrument.entity.InstrumentWithBLOBs;

import java.util.Date;
import java.util.List;

public interface BookingService {
    int insertSelective(BookingWithBLOBs record);
    List<BookingWithBLOBs> selectByInsName(String insName,int id);
    int updateByPrimaryKeySelective(BookingWithBLOBs record);
    List<BookingWithBLOBs> selectByperson(String booking_person,int id);
    int deleteByPrimaryKey(Integer id);
    BookingWithBLOBs selectByPrimaryKey(Integer id);
    List<BookingWithBLOBs> selectforTime(String ins_name, Date date, int i, int j);

}
