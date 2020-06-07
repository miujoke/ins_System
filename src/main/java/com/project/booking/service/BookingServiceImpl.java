package com.project.booking.service;

import com.project.booking.dao.BookingMapper;
import com.project.booking.entity.BookingWithBLOBs;
import com.project.instrument.entity.InstrumentWithBLOBs;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service("BookingServiceImpl")
public class BookingServiceImpl implements  BookingService {

    @Autowired
    private BookingMapper bookingMapper;

    @Override
    public int insertSelective(BookingWithBLOBs record) {
        return bookingMapper.insertSelective(record);
    }

    @Override
    public List<BookingWithBLOBs> selectByInsName(String insName,int id) {
        return bookingMapper.selectByInsName(insName,id);
    }

    @Override
    public int updateByPrimaryKeySelective(BookingWithBLOBs record) {
        return bookingMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public List<BookingWithBLOBs> selectByperson(String booking_person, int id) {
        return bookingMapper.selectByperson(booking_person,id);
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return bookingMapper.deleteByPrimaryKey(id);
    }

    @Override
    public BookingWithBLOBs selectByPrimaryKey(Integer id) {
        return bookingMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<BookingWithBLOBs> selectforTime(String ins_name, Date date, int i, int j) {
        return bookingMapper.selectforTime(ins_name,date,i,j);
    }
}
