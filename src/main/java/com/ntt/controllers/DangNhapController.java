/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ntt.controllers;

import com.ntt.pojo.NguoiDung;
import com.ntt.service.BaiVietService;
import com.ntt.service.TaiKhoanService;
import javax.persistence.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author ThanhThuyen
 */
@Controller
@Transactional
public class DangNhapController {
    @Autowired
    private TaiKhoanService taikhoan;
     @Autowired
    private LocalSessionFactoryBean facrory;
     @Autowired
     private BaiVietService baivietService;
     @Autowired
     private BaiVietService baiviet;
    
    @RequestMapping("/dangnhap")
    public String dangNhap(){
        return "dangnhap";
    }
    
    @RequestMapping("/chutro")
    @Transactional
    public String dangNhapChuTro(Model model,Authentication authen){
          if(authen!=null)
        {
            model.addAttribute("baiviet", this.baivietService.getBaiViet().get(0));
            model.addAttribute("taikhoan",this.taikhoan.getTaiKhoan(authen.getName()).get(0));
        }
          
        model.addAttribute("baiviet", this.baiviet.getBaiViet());
        return "chutro";
    }
  
    
    @RequestMapping("/admin")
    public String dangNhapAdmin(Model model,Authentication authen){
         model.addAttribute("taikhoan",this.taikhoan.getTaiKhoan(authen.getName()).get(0));
        return "admin";
    }
    
   
}
