/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ntt.controllers;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.common.reflect.TypeToken;
import com.nimbusds.jose.shaded.gson.Gson;
import com.ntt.pojo.BaiViet;
import com.ntt.pojo.NguoiDung;
import com.ntt.service.BaiVietService;
import com.ntt.service.LoaiBaiVietService;
import com.ntt.service.TaiKhoanService;
import java.io.IOException;
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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

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

    @RequestMapping("/baivietxungquanh")
    public String baivietxungquanh(Model model, Authentication authen, @RequestParam Map<String, String> params) {
        UserDetails user = this.taikhoan.loadUserByUsername(authen.getName());
        NguoiDung nguoidung = this.taikhoan.getTaiKhoanbyTenTK(user.getUsername());
        if (authen != null) {

            model.addAttribute("taikhoan", nguoidung);
            model.addAttribute("nguoidung", nguoidung);
        }

        List<BaiViet> baiviets = this.baivietService.getBaiVietAll();
        model.addAttribute("baiviet", baiviets);
        return "baivietxungquanh";
    }

    @GetMapping("/bando")
    public String bando(Model model, NguoiDung nguoidung, Authentication authen) {

        model.addAttribute("dsBaiViet", this.baivietService.getBaiVietAll());
        List<Map<String, Object>> dsThongTinViTri = new ArrayList<>();
        UserDetails user = this.taikhoan.loadUserByUsername(authen.getName());
        NguoiDung u = this.taikhoan.getTaiKhoanbyTenTK(user.getUsername());
        model.addAttribute("taikhoan", u);
        model.addAttribute("nguoidung", this.taikhoan.getTaiKhoan(authen.getName()).get(0));
        return "bando";

    }

    @PostMapping("/bando")
    public String bando_capnhat(Model model, NguoiDung nguoidung, Authentication authen) {

        String errMSg="";
        UserDetails user = this.taikhoan.loadUserByUsername(authen.getName());
        NguoiDung u = this.taikhoan.getTaiKhoanbyTenTK(user.getUsername());
        model.addAttribute("taikhoan", u);
        model.addAttribute("nguoidung", this.taikhoan.getTaiKhoan(authen.getName()).get(0));
        
        return "capnhattaikhoan";
    }

    @PostMapping("/bando_map")
    public String bando_map(Model model, @RequestParam("diaChiList") String diaChiListParam, Authentication authen) {
        Gson gson = new Gson();
        List<String> diaChiList = gson.fromJson(diaChiListParam, new TypeToken<List<String>>() {
        }.getType());

        model.addAttribute("diaChi", diaChiList);

        model.addAttribute("dsBaiViet", this.baivietService.getBaiVietAll());
        UserDetails user = this.taikhoan.loadUserByUsername(authen.getName());
        NguoiDung u = this.taikhoan.getTaiKhoanbyTenTK(user.getUsername());
        model.addAttribute("taikhoan", u);
        model.addAttribute("nguoidung", this.taikhoan.getTaiKhoan(authen.getName()).get(0));

        List<Map<String, Object>> dsThongTinViTri = new ArrayList<>();
        return "bando";
    }

}
