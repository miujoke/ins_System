package com.project.instrument.service;

import com.project.instrument.entity.InstrumentWithBLOBs;

import java.util.List;

public interface InstrumentService {
    List<InstrumentWithBLOBs> selectByAll();

    int insertSelective(InstrumentWithBLOBs record);

    List<InstrumentWithBLOBs> selectByUserId(Integer id);
}
