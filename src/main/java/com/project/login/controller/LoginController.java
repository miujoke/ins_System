package com.project.login.controller;

import com.project.common.utils.ApiResult;
import com.project.common.utils.MD5Utils;
import com.project.instrument.entity.InstrumentWithBLOBs;
import com.project.instrument.service.InstrumentService;
import com.project.user.entity.User;
import com.project.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.http.HttpServletRequest;
import javax.xml.ws.soap.Addressing;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("login")
public class LoginController {

    @Autowired
    private UserService userService;

    @Autowired
    private InstrumentService instrumentService;
    @RequestMapping
    public String login(){
        return "login";
    }
    /**
    *@Description:登录 并且把用户信息存session 返回所有的仪器信息
    */
    @RequestMapping("/entry")
    @ResponseBody
    public ApiResult<List<InstrumentWithBLOBs>> entry(HttpServletRequest request){
        ApiResult<List<InstrumentWithBLOBs>> resp = new ApiResult<>();
        String uid = request.getParameter("uid");
        String pwd = request.getParameter("pwd");
        List<User> users =  userService.selectByUserName(uid);
        if(users!=null){
            for (User user:users){
                try {
                    if(MD5Utils.checkPassword(pwd,user.getPassword())){
                        resp.setMessage("操作成功");
                        request.getSession().setAttribute("user",user);
                        List<InstrumentWithBLOBs> instruments = instrumentService.selectByAll();
                        resp.setData(instruments);
                       resp.setId(user.getRoleId());
                       break;
                    }

                } catch (UnsupportedEncodingException e) {
                    e.printStackTrace();
                } catch (NoSuchAlgorithmException e) {
                    e.printStackTrace();
                }
            }
        }else {
            resp.setMessage("账号密码错误");
        }
        return resp;
    }




    @RequestMapping("/username")
    @ResponseBody
    public ApiResult<String> username(HttpServletRequest request){
        ApiResult<String> resp = new ApiResult<>();
        User user = (User) request.getSession().getAttribute("user");
        resp.setData(user.getRealName());
        resp.setMessage("操作成功");
        return resp;

    }


   /**
   *@Description:注册接口
   */
//    @RequestMapping("/register")
//    @ResponseBody
//    public ApiResult<String> register(HttpServletRequest request){
//        ApiResult<String> resp = new ApiResult<>();
////        String uid = request.getParameter("uid");
////        String pwd = request.getParameter("pwd");
//        long strs = new Date().getTime();
//        int i = Math.toIntExact(strs % 10000);
//
//        for (int j = 0 ; j<5 ;j++){
//            String uid = String.valueOf(i);
//            String pwd = String.valueOf(i);
//            User user = new User();
//            user.setUsername(uid);
//            try {
//                String password =  MD5Utils.encrptyPassword(pwd);
//                user.setCollege("贵州理工学院电气与信息工程学院");
//                user.setRealName(String.valueOf(i));
//                user.setMobile("11012010086");
//                user.setRoleId(3);
//                user.setUsername(uid);
//                user.setPassword(password);
//                userService.insertSelective(user);
//
//            } catch (NoSuchAlgorithmException e) {
//                e.printStackTrace();
//            } catch (UnsupportedEncodingException e) {
//                e.printStackTrace();
//            }
//       i++;
//        }
//
//        resp.setMessage("操作成功");
//
//        return  resp;
//    }
}
