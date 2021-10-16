package com.computer.controller;

import com.computer.dao.ComTypeDao;
import com.computer.model.ComType;
import com.computer.model.Computer;
import com.computer.service.ComputerService;
import com.computer.service.ShoppingCarService;
import com.computer.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * 公共页面控制类
 */
@Controller
public class CommonController {

    @Autowired
    private UserService userService;
    @Autowired
    private ComputerService computerService;
    @Autowired
    private ComTypeDao comTypeDao;
    @Autowired
    private ShoppingCarService shoppingCarService;

    // 首页
    @RequestMapping(value = "/index.action")
    public String index(Model model){
        model.addAttribute("recomm", computerService.findRecommComs());
        model.addAttribute("bjb", computerService.findComs("1","","6","hits"));
        model.addAttribute("tsj",computerService.findComs("2","","6","hits"));
        model.addAttribute("sb",computerService.findComs("3","","3","hits"));
        model.addAttribute("jp",computerService.findComs("4","","3","hits"));
        model.addAttribute("other",computerService.findWaisheComs("4","","3"));//获取type>4(外观系列)商品的前3个
        return "public/index";
    }

    // 类型页面
    @RequestMapping(value = "/type_show.action")
    public String typeShow(String minPrice, String maxPrice, String type, String page, Model model){
        //	-	-	-	返回参数	-	-	-	\
        String num = "6";// 展示商品数
        // 返回参数
        String typeName;// 商品类型名
        String sumPage = "1";// 总页数
        List<Computer> pageComs = null;// 当前页展示商品

        // 	-	-	-	初始化区域 	-	-	-	\
        if(page == null) {// 初始化当前页
            page = "1";
        }
        // 判断显示类型商品，并分页
        if (Integer.parseInt(type) < 3)
        {
            typeName =  comTypeDao.findType(type).getTypeName();
        } else
        {
            typeName = "外设系列";
        }
        if(minPrice!=null || maxPrice!=null){
            pageComs = computerService.getPriceComs(minPrice, maxPrice, type);
        }else{
            String index = (Integer.parseInt(page)-1) * 6 + "";// 查询商品检索值
            long sumTypeComs;// 类型商品数量
            // 判断显示类型商品，并分页
            if (Integer.parseInt(type) < 3)
            {
                typeName = comTypeDao.findType(type).getTypeName();
                sumTypeComs = computerService.findComs(type,"","","hits").size();
                pageComs = computerService.findComs(type, index, num,"hits");
            } else
            {
                typeName = "外设系列";
                sumTypeComs = computerService.findWaisheComs("2","","").size();
                pageComs = computerService.findWaisheComs("2", index, num);
            }
            sumPage = sumTypeComs/6 + 1 +"";// 总页数
        }
        model.addAttribute("minPrice", minPrice);
        model.addAttribute("maxPrice", maxPrice);
        model.addAttribute("type", type);
        model.addAttribute("typeName", typeName);
        model.addAttribute("sumPage", sumPage);
        model.addAttribute("page", page);
        model.addAttribute("pageComs", pageComs);
        return "public/type_show";
    }

    // 商品详情页
    @RequestMapping(value = "/detail_show.action")
        public String detailShow(int id, Model model){
        model.addAttribute("computer", computerService.findCom(id));
        return "public/detail_show";
    }

    //搜索商品页
    @RequestMapping(value = "/search.action")
    public String search(String content, Model model){
        List<Computer> comList = computerService.findComsBySearch(content);
        model.addAttribute("content",content);
        model.addAttribute("comList", comList);
        return "public/search";
    }

    // 用户登录/注册页面
    @RequestMapping(value = "/login.action")
    public String login(){
        return "public/login";
    }

}
