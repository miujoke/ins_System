package com.project.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("index")
public class ApiController {
    @RequestMapping
    public String index(){
        return "index";
    }
    @RequestMapping("/cary")
    public String cary(){
        return "cary";
    }
    @RequestMapping("/ins_admin")
    public String ins_admin(){
        return "ins_admin";
    }
    @RequestMapping("/insorder")
    public String insorder(){
        return "insorder";
    }
    @RequestMapping("/epma")
    public String epma(){
        return "epma";
    }
    @RequestMapping("/login")
    public String login(){
        return "login";
    }
    @RequestMapping("/Nova")
    public String Nova(){
        return "Nova";
    }
    @RequestMapping("/order")
    public String order(){
        return "order";
    }
    @RequestMapping("/xray")
    public String xray(){
        return "xray";
    }
    @RequestMapping("/spectrometer")
    public String spectrometer(){
        return "spectrometer";
    }
    @RequestMapping("/center")
    public String center(){
        return "center";
    }

    @RequestMapping("/download")
    public String download(){
        return "download";
    }

    @RequestMapping("/applyfor")
    public String applyfor(){
        return "applyfor";
    }

    @RequestMapping("/approved")
    public String approved(){
        return "approved";
    }

    @RequestMapping("/thinktime")
    public String thinktime(){
        return "thinktime";
    }

    @RequestMapping("/changepassword")
    public String changepassword(){
        return "changepassword";
    }
    @RequestMapping("/doun")
    public String doun(){
        return "doun";
    }


    @RequestMapping("/file")
    public String file(){
        return "file";
    }
}
