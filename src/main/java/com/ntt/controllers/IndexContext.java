/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ntt.controllers;

import com.ntt.pojo.BaiViet;
import com.ntt.pojo.NguoiDung;
import com.ntt.service.BaiVietService;
import com.ntt.service.LoaiBaiVietService;
import com.ntt.service.TaiKhoanService;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;

import java.util.HashMap;
import java.util.List;

import java.util.Map;
import javax.persistence.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author ThanhThuyen
 */
@Controller
@Transactional
public class IndexContext {

    @Autowired
    private TaiKhoanService taikhoan;
    @Autowired
    private BaiVietService baivietService;
    @Autowired
    private Environment env;

    @RequestMapping("/")
    public String index(Model model, Authentication authen,
            @RequestParam Map<String, String> params,
            @RequestParam(name = "address", required = false) String address,
            @RequestParam(name = "price", required = false) BigDecimal price,
            @RequestParam(name = "soNguoi", required = false) Integer soNguoi) {

        if (authen != null) {
            UserDetails user = this.taikhoan.loadUserByUsername(authen.getName());
            NguoiDung u = this.taikhoan.getTaiKhoanbyTenTK(user.getUsername());
            model.addAttribute("taikhoan", u);

            model.addAttribute("nguoidung", this.taikhoan.getTaiKhoan(authen.getName()).get(0));

        }
        if (params.isEmpty()) {
            List<BaiViet> baiviet = this.baivietService.getBaiVietAll();
            model.addAttribute("baiviet", this.baivietService.sortBaiVietByNgayDang(baiviet));

        }
        if (!params.isEmpty()) {
            List<BaiViet> baiviets = this.baivietService.getBaiVietTK(address, price, soNguoi, params);
            model.addAttribute("baiviet", this.baivietService.sortBaiVietByNgayDang(baiviets));
        }

        int count = this.baivietService.getCountOfBaiViet();
        int pageSize = Integer.parseInt(this.env.getProperty("PAGE_SIZE"));
        model.addAttribute("pages", Math.ceil(count * 1.0 / pageSize));
        return "index";

    }

//    @RequestMapping(value = "/", method = RequestMethod.POST)
//    public String capNhatKinhDoViDo(@RequestParam("latitude") Double latitude, @RequestParam("longitude") Double longitude, Model model, Authentication authen) {
//        if (authen != null) {
//            UserDetails user = this.taikhoan.loadUserByUsername(authen.getName());
//            NguoiDung nguoiDung = this.taikhoan.getTaiKhoanbyTenTK(user.getUsername());
//
//            nguoiDung.setKinhDo(latitude);
//            nguoiDung.setViDo(longitude);
//
//            this.taikhoan.updateTaiKhoan(nguoiDung);
//
//        }
//
//        return "index";
//    }

    @RequestMapping("/bando")
    public String bando(Model model, NguoiDung nguoidung, Authentication authen) {

        model.addAttribute("dsBaiViet", this.baivietService.getBaiVietAll());

        List<Map<String, Object>> dsThongTinViTri = new ArrayList<>();
        UserDetails user = this.taikhoan.loadUserByUsername(authen.getName());
        NguoiDung u = this.taikhoan.getTaiKhoanbyTenTK(user.getUsername());
        model.addAttribute("taikhoan", u);
        model.addAttribute("nguoidung", this.taikhoan.getTaiKhoan(authen.getName()).get(0));
        return "bando";
    }

    

}
