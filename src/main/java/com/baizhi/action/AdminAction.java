package com.baizhi.action;


import com.baizhi.entity.Admin;
import com.baizhi.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

//哈哈哈哈，第一次测试成功了！！！

@Controller
@RequestMapping("/admin")
public class AdminAction {
    @Autowired
    private AdminService adminService;

    @RequestMapping("/login")
    public String login(Admin admin, Model model,HttpSession session){
        try {
            Admin login = adminService.login(admin);
            session.setAttribute("login",login);
            return "shouye";
        }catch (Exception e){
            e.printStackTrace();
            String message = e.getMessage();
            model.addAttribute("message",message);
            return "login";
        }

    }

}
