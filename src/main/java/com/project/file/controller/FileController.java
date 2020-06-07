package com.project.file.controller;

import com.project.booking.entity.BookingWithBLOBs;
import com.project.booking.service.BookingService;
import com.project.common.utils.WordTest;
import com.project.user.entity.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;

import static com.project.common.utils.RemoveFile.deleteFile;



@Controller
@RequestMapping("file")
public class FileController {

    @Autowired
    BookingService bookingService;

   /**
   *@Description:文件上传功能
   */
    @RequestMapping(value="/upload",method= RequestMethod.POST)
    @ResponseBody
    public String upload(MultipartFile file, HttpServletRequest request) throws IOException {
        String path = request.getSession().getServletContext().getRealPath("upload");
        String fileName = file.getOriginalFilename();
        File dir = new File(path,fileName);
        if(!dir.exists()){
            dir.mkdirs();
        }
        //MultipartFile自带的解析方法
        file.transferTo(dir);
        return "ok!";
    }

@RequestMapping("/down")
public void down(HttpServletRequest request,HttpServletResponse response) throws Exception{
    WordTest wordTest = new WordTest();
    int  id = Integer.parseInt(request.getParameter("id"));
    BookingWithBLOBs booking = bookingService.selectByPrimaryKey(id);
       User user = (User) request.getSession().getAttribute("user");
    String fileName = wordTest.createWord(booking,user.getRealName());

    //获取输入流
    InputStream bis = new BufferedInputStream(new FileInputStream(new File(fileName)));
    //假如以中文名下载的话
    String filename = "大型仪器设备预约管理系统预约单.doc";
    //转码，免得文件名中文乱码
    filename = URLEncoder.encode(filename,"UTF-8");
    //设置文件下载头
    response.addHeader("Content-Disposition", "attachment;filename=" + filename);
    //1.设置文件ContentType类型，这样设置，会自动判断下载文件类型
    response.setContentType("multipart/form-data");
    BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());
    int len = 0;
    while((len = bis.read()) != -1){
        out.write(len);
        out.flush();
    }
    bis.close();
    out.close();
    System.out.println(deleteFile(fileName));


}
}