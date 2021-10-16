package com.computer.controller;


import com.computer.model.ShoppingCar;
import com.computer.model.User;
import com.computer.service.AdminService;
import com.computer.service.ShoppingCarService;
import com.computer.service.UserService;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * 用户操作接口类
 */
@RequestMapping(value = "/userApi")
@Controller
public class UserApi {

    @Autowired
    private UserService userService;
    @Autowired
    private ShoppingCarService shoppingCarService;
    @Autowired
    private AdminService adminService;

    /**
     * 获取用户购物车商品数量接口
     */
    @RequestMapping(value = "/getScQuantity")
    public void getScQuantity(HttpServletResponse response,  HttpSession session) throws IOException {
        response.setContentType("application/json;charset=UTF-8");
        User user_session = (User)session.getAttribute("USER_SESSION");
        List<ShoppingCar> scList = shoppingCarService.findUserSC(user_session.getId());
        JSONObject json = new JSONObject();
        long scQuantity = scList.size();
        json.put("scQuantity",scQuantity);
        response.getWriter().write(json.toString());
    }

    /**
     * 用户名查重接口
     */
    @RequestMapping(value = "/checkUserName")
    public void checkUserName(String userName, HttpServletResponse response, HttpSession session) throws IOException {
        response.setContentType("application/json;charset=UTF-8");
        // 判断数据库中是否已有此用户名
        User user = userService.findUserName(userName);
        boolean isExist;
        if (user != null){
            isExist = true;
        } else {
            isExist = false;
        }
        JSONObject json = new JSONObject();
        json.put("isExist",isExist);
        response.getWriter().write(json.toString());
    }

    /**
     * 修改用户名查重接口
     */
    @RequestMapping(value = "/checkAlterUserName")
    public void checkAlterUserName(String alterName, HttpServletResponse response, HttpSession session) throws IOException {
        response.setContentType("application/json;charset=UTF-8");
        User user_session = (User)session.getAttribute("USER_SESSION");//获取当前登录用户
        // 判断数据库中是否已有此用户名
        boolean isExist = userService.isUserNameToRemoveYourselfExist(user_session.getId(),alterName);
        JSONObject json = new JSONObject();
        json.put("isExist",isExist);
        response.getWriter().write(json.toString());
    }

    /**
     * 验证密码正确性接口
     */
    @RequestMapping(value = "/checkAlterOldPass")
    public void checkAlterOldPass(String oldPass, HttpServletResponse response, HttpSession session) throws IOException {
        response.setContentType("application/json;charset=UTF-8");
        User user_session = (User)session.getAttribute("USER_SESSION");//获取当前登录用户
        // 判断数据库中是否有此用户
        User user = userService.findUser(user_session.getUserName(), oldPass);
        boolean isExist;
        if (user != null){
            isExist = true;
        } else {
            isExist = false;
        }
        JSONObject json = new JSONObject();
        json.put("isExist",isExist);
        response.getWriter().write(json.toString());
    }

    /**
     * 用户状态设置
     */
    @RequestMapping(value = "/setUserStatus")
    public void setUserStatus(String status, String userid, HttpServletResponse response) throws IOException {
        int count=0;
        // 状态字段只能为 0 或 1
        if("0".equals(status)||"1".equals(status)){
            // 调用数据操作层 修改用户状态
            count = adminService.updateStatus(userid,status);
        }
        // 判断是否有返回结果
        boolean isExist=false;
        if (count > 0) {
            // 如果有则代表用户名和密码正确
            isExist = true;
        } else {
            //否则返回用户名和密码不正确
            isExist = false;
        }
        JSONObject json = new JSONObject();
        json.put("isExist",isExist);
        response.getWriter().write(json.toString());
    }

    /**
     * 用户权限设置
     */
    @RequestMapping(value = "/setUserIdent")
    public void setUserIdent(String status, String userid, HttpServletResponse response) throws IOException {
        int count=0;
        // 状态字段只能为 0 或 1
        if("0".equals(status)||"1".equals(status)){
            // 调用数据操作层 修改用户状态
            count = adminService.updateIdent(userid,status);
        }
        // 判断是否有返回结果
        boolean isExist=false;
        if (count > 0) {
            // 如果有则代表用户名和密码正确
            isExist = true;
        } else {
            //否则返回用户名和密码不正确
            isExist = false;
        }
        JSONObject json = new JSONObject();
        json.put("isExist",isExist);
        response.getWriter().write(json.toString());
    }

}
