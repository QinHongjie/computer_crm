package com.computer.controller;

import com.computer.model.User;
import com.computer.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;

/**
 * 用户控制类
 */
@Controller
public class UserController {

    @Autowired
    private UserService userService;

    /**
     * 用户登录
     */
    @RequestMapping(value = "/login.action", method = RequestMethod.POST)
    public String login(String userName, String password, Model model, HttpSession session){

//        User user = userService.findUser(userName,password);
//        if(user != null) {
//            session.setAttribute("user", user);
//            return "test/success";
//        }
//        model.addAttribute("msg", "错误！");
        return "test/success";
    }

}
