package com.project.instrument.dao;

import com.project.instrument.entity.Instrument;
import com.project.instrument.entity.InstrumentWithBLOBs;

import java.util.List;

public interface InstrumentMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(InstrumentWithBLOBs record);

    int insertSelective(InstrumentWithBLOBs record);

    InstrumentWithBLOBs selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(InstrumentWithBLOBs record);

    int updateByPrimaryKeyWithBLOBs(InstrumentWithBLOBs record);

    int updateByPrimaryKey(Instrument record);

    List<InstrumentWithBLOBs> selectByAll();

    List<InstrumentWithBLOBs> selectByUserId(Integer id);
}