package com.project.instrument.controller;

import com.project.common.utils.ApiResult;
import com.project.instrument.entity.InstrumentWithBLOBs;
import com.project.instrument.service.InstrumentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("instrument")
public class InstrumentController {


    @Autowired
    private InstrumentService instrumentService;
/**
*@Description:查询所有的仪器
*/
    @RequestMapping
    @ResponseBody
    public ApiResult<List<InstrumentWithBLOBs>> index(HttpServletRequest request){
        ApiResult<List<InstrumentWithBLOBs>> resp = new ApiResult<>();
        List<InstrumentWithBLOBs> instruments = instrumentService.selectByAll();
        resp.setMessage("操作成功");
        resp.setData(instruments);
    return resp;
    }




}
