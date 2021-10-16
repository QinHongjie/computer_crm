package com.computer.controller;

import com.computer.model.ShoppingCar;
import com.computer.model.User;
import com.computer.service.ShoppingCarService;
import com.computer.service.UserService;
import net.sf.json.JSONObject;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * 用户控制类
 */
@Controller
public class UserController {

    @Autowired
    private UserService userService;
    @Autowired
    private ShoppingCarService shoppingCarService;

    /**
     * 用户登录
     */
    @RequestMapping(value = "/login.do", method = RequestMethod.POST)
    public String login(String username, String password, String checkCode, Model model, HttpSession session){
        // 判断验证码
        String code = (String)session.getAttribute("code");
        if (null == code || null == checkCode || !code.equalsIgnoreCase(checkCode))
        {
            // 错误信息
            String msg = "验证码错误！";
            // 将错误信息传回客户页面
            model.addAttribute("message", msg);
            // 回到登录页面
            return "public/login";
        }
        // 通过用户名和密码查询用户记录
        User user = userService.findUser(username, password);
        if(user == null) {
            model.addAttribute("message", "用户名或密码错误！");
            return "public/login";
        }
        session.setAttribute("USER_SESSION", user);
        return "redirect:index.action";
    }

    /**
     * 用户注册
     */
    @RequestMapping(value = "/register.do")
    public String register(String username, String password, String telephone, Model model){
        int r = userService.addUser(username, password, telephone);
        if(r!=0){
            model.addAttribute("msg", "你已注册成功，请登录。");
            model.addAttribute("href", "login.action");

        }else{
            model.addAttribute("msg", "注册失败，请重新注册！");
            model.addAttribute("href", "login.action?action=1");
        }
        return "public/result";
    }

    /**
     * 用户注销
     */
    @RequestMapping(value = "/logout.do")
    public String logout(Model model, HttpSession session){
        //销毁当前session
        session.invalidate();
        return "redirect:index.action";
    }

    /**
     * 用户购物车页
     */
    @RequestMapping(value = "/user_sc_show.do")
    public String userScShow(Model model, HttpSession session){
        User user_session = (User)session.getAttribute("USER_SESSION");
        model.addAttribute("scList", shoppingCarService.findUserSC(user_session.getId()));
        return "public/shoppingcar";
    }

    /**
     * 用户购物操作
     */
    @RequestMapping(value = "/user_sc_add.do")
    public String userScAdd(int comId, int quantity, Model model, HttpSession session){
        User user_session = (User)session.getAttribute("USER_SESSION");
        shoppingCarService.addToSC(user_session.getId(),comId,quantity);
        model.addAttribute("msg", "你已成功将 "+quantity+" 件商品添加进购物车！");
        model.addAttribute("href", "user_sc_show.do");
        return "public/result";
    }

    /**
     * 用户移除购物车商品
     */
    @RequestMapping(value = "/user_sc_del.do")
    public String userScDel(Integer[] ids, Model model){
        List<Integer> idList = Arrays.asList(ids);
        int r = shoppingCarService.delUserSC(idList);
        model.addAttribute("msg", "你已成功将 "+r+" 种商品从购物车中移除！");
        model.addAttribute("href", "user_sc_show.do");
        return "public/result";
    }

    /**
     * 个人中心页
     */
    @RequestMapping(value = "/per_center.do")
    public String perCenter(){
        return "public/personal_center";
    }

    /**
     * 修改用户基本信息
     */
    @RequestMapping(value = "/user_alter_info.do", method = RequestMethod.POST)
    public String userAlterInfo(String alterName, String alterTel, String alterAddress, Model model, HttpSession session){
        User user_session = (User)session.getAttribute("USER_SESSION");
        int r = userService.updateUser(user_session.getId(),alterName,alterTel,alterAddress);
        User user = userService.findUserById(user_session.getId());
        session.setAttribute("USER_SESSION", user);
        if(r!=0){
            model.addAttribute("msg", "修改信息成功!");
        }else{
            model.addAttribute("msg", "修改信息失败!");
        }
        model.addAttribute("href","per_center.do");
        return "public/result";
    }

    /**
     * 修改用户密码
     */
    @RequestMapping(value = "/user_alter_pass.do", method = RequestMethod.POST)
    public String userAlterPass(String newPass, Model model, HttpSession session){
        User user_session = (User)session.getAttribute("USER_SESSION");
        int r = userService.updatePass(user_session.getId(),newPass);
        if(r!=0){
            model.addAttribute("msg", "修改密码成功!");
        }else{
            model.addAttribute("msg", "修改密码失败!");
        }
        model.addAttribute("href","per_center.do");
        return "public/result";
    }

}
