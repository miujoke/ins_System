package com.project.instrument.service;


import com.project.instrument.dao.InstrumentMapper;
import com.project.instrument.entity.InstrumentWithBLOBs;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("InstrumentServiceImpl")
public class InstrumentServiceImpl implements  InstrumentService {

    @Autowired
    private InstrumentMapper instrumentMapper;


    @Override
    public List<InstrumentWithBLOBs> selectByAll() {
        return instrumentMapper.selectByAll();
    }

    @Override
    public int insertSelective(InstrumentWithBLOBs record) {
        return instrumentMapper.insertSelective(record);
    }

    @Override
    public List<InstrumentWithBLOBs> selectByUserId(Integer id) {
        return instrumentMapper.selectByUserId(id);
    }
}
