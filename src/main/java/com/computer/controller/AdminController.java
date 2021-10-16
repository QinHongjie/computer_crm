package com.computer.controller;

import com.computer.dao.ComTypeDao;
import com.computer.model.ComType;
import com.computer.model.Computer;
import com.computer.model.User;
import com.computer.service.AdminService;
import com.computer.service.ComputerService;
import com.computer.service.ShoppingCarService;
import com.computer.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * 管理员控制类
 */
@Controller
public class AdminController {

    @Autowired
    private UserService userService;
    @Autowired
    private ComputerService computerService;
    @Autowired
    private ComTypeDao comTypeDao;
    @Autowired
    private ShoppingCarService shoppingCarService;
    @Autowired
    private AdminService adminService;

    /**
     * 管理后台登录页面
     */
    @RequestMapping(value = "/admin_login.action")
    public String loginPage(){
        return "admin/login";
    }

    /**
     * 管理主页面
     */
    @RequestMapping(value = "/admin_index.action")
    public String adminIndexPage(String iframePage, Model model){
        model.addAttribute("iframePage", iframePage);
        return "admin/admin_index";
    }

    /**
     * 欢迎界面
     */
    @RequestMapping(value = "/welcome.action")
    public String welcome(){
        return "admin/welcome";
    }

    /**
     * 管理员登录操作
     */
    @RequestMapping(value = "/login.admin", method = RequestMethod.POST)
    public String login(String adminName, String password, Model model, HttpSession session){
        // 业务入参比对
        User userByName = userService.findUserName(adminName);
        User user = userService.findUser(adminName, password);
        User admin = adminService.findAdmin(adminName, password);
        // 分别授予错误提示信息
        String msg = "";
        if(userByName == null){
            msg = "没有该用户！";
        }else{
            if(user == null){
                msg = "用户名或密码错误！";
            }else{
                if(admin == null){
                    msg = "该用户还没有授权管理员权限！";
                }else{
                    // 如果用户名密码正确 则保存用户名到session
                    session.setAttribute("ADMIN_SESSION", admin);
                    // 重定向到管理员页面
                    return "redirect:admin_index.action";
                }
            }
        }
        model.addAttribute("msg", msg);
        return "admin/login";
    }

    /**
     * 管理员注销操作
     */
    @RequestMapping(value = "/logout.admin")
    public String logout(HttpSession session){
        session.removeAttribute("ADMIN_SESSION");
        return "redirect:admin_login.action";
    }

    /**
     * 用户列表页
     */
    @RequestMapping(value = "/user_list.action")
    public String userListPage(String page, String num, Model model, HttpSession session){
        userPaging(page, num, model, session);
        return "admin/user_list";
    }

    /**
     * 用户权限管理页
     */
    @RequestMapping(value = "user_right.action")
    public String userRightPage(String page, String num, Model model, HttpSession session){
        userPaging(page, num, model, session);
        return "admin/user_right";
    }

    /**
     * 商品列表页
     */
    @RequestMapping(value = "/product_list.action")
    public String productListPage(String type, String page, String num, Model model, HttpSession session){
        //	-	-	-	返回参数	-	-	-	\
        if(num == null){
            num = (String)session.getAttribute("num");
            if(num == null){
                num = "6";
            }
        }
        // 返回参数
        String typeName;// 商品类型名
        String sumPage = "1";// 总页数
        List<Computer> pageComList = null;// 当前页展示商品
        // 	-	-	-	初始化区域 	-	-	-	\
        if(page == null) {// 初始化当前页
            page = "1";
        }
        String index = (Integer.parseInt(page)-1) * Integer.parseInt(num) + "";// 查询商品检索值
        long sumTypeComs = 0;// 类型商品数量

        // 判断类型是否为空  并分页获取商品列表
        if("".equals(type) || type==null){
            typeName = "所有商品";
            sumTypeComs = computerService.findComs("","","","").size();
            pageComList = computerService.findComs("",index,num,"");
        }else{
            typeName = comTypeDao.findType(type).getTypeName();// 获取对应类型编号类型名称
            sumTypeComs = computerService.findComs(type,"","","").size();
            pageComList = computerService.findComs(type, index, num,"");
        }
        sumPage = sumTypeComs/Integer.parseInt(num) + 1 +"";// 总页数

        model.addAttribute("type", type);
        model.addAttribute("typeName", typeName);
        model.addAttribute("sumPage", sumPage);
        model.addAttribute("page", page);
        model.addAttribute("pageComList", pageComList);
        session.setAttribute("num", num);
        return "admin/product_list";
    }

    /**
     * 类型列表页
     */
    @RequestMapping(value = "/product_type.action")
    public String productTypePage(Model model){
        List<ComType> comTypeList = comTypeDao.findAllType();
        model.addAttribute("comTypeList",comTypeList);
        return "admin/product_type";
    }


    // 用户分页公用方法
    private void userPaging(String page, String num, Model model, HttpSession session){
        // 	-	-	-	初始化区域 	-	-	-	\
        if(num == null){
            num = (String)session.getAttribute("num");
            if(num == null){
                num = "6";
            }
        }
        String sumPage = "1";// 总页数
        if(page == null) {// 初始化当前页
            page = "1";
        }
        int index = (Integer.parseInt(page)-1) * Integer.parseInt(num);// 查询用户检索值
        List<User> userList = adminService.findUserNum(index,Integer.parseInt(num));// 当前页展示用户
        long sumUsers = adminService.findAllUser().size();// 用户数量
        sumPage = sumUsers%Integer.parseInt(num)!=0 ? sumUsers/Integer.parseInt(num)+1+"" : sumUsers/Integer.parseInt(num)+"";// 总页数
        // 预传入前端数据装载
        model.addAttribute("userList", userList);
        model.addAttribute("sumPage", sumPage);
        model.addAttribute("page", page);
        session.setAttribute("num", num);
    }

}
