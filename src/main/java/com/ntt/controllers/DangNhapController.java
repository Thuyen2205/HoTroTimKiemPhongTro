/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ntt.controllers;

import com.ntt.pojo.BaiViet;
import com.ntt.pojo.NguoiDung;
import com.ntt.service.BaiVietService;
import com.ntt.service.BinhLuanService;
import com.ntt.service.HinhAnhService;
import com.ntt.service.NguoiDungService;
import com.ntt.service.TaiKhoanService;
import java.util.Map;
import javax.persistence.Query;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
    @Autowired
    private NguoiDungService nguoidung;
    @Autowired
    private BinhLuanService binhLuanService;
    @Autowired
    private HinhAnhService hinhAnhService;
    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

    @RequestMapping("/dangnhap")
    public String dangNhap() {
        return "dangnhap";
    }

    @RequestMapping("/canhan")
//    @Transactional
    public String dangNhapCaNhan(Model model, Authentication authen) {
//        model.addAttribute("taikhoan", new NguoiDung());

        if (authen != null) {
            UserDetails user = this.taikhoan.loadUserByUsername(authen.getName());
            NguoiDung u = this.taikhoan.getTaiKhoanbyTenTK(user.getUsername());
            model.addAttribute("taikhoan", u);
            model.addAttribute("baiviet", this.baiviet.getBaiVietByIdNgDung(u));
        }
        model.addAttribute("nguoidung", this.taikhoan.getTaiKhoan(authen.getName()).get(0));

        return "canhan";
    }

    @PostMapping("/canhan_xoa")
    public String xoaBaiViet(Model model, Authentication authen, @RequestParam Map<String, String> params) {
        Integer id = Integer.parseInt(params.get("idBaiVietXoa"));
        if (authen != null) {
            this.binhLuanService.deleteBinhLuanByBaiViet(this.baivietService.getBaiVietById(id));
            this.hinhAnhService.deleteHinhAnhByBaiViet(this.baivietService.getBaiVietById(id));
            if (this.baiviet.deleteBaiViet(id) == true) {
                return "forward:/canhan";
            }
        }
        return "index";
    }

    @GetMapping("/doimatkhau")
    public String doiMatKhau(Model model, @RequestParam Map<String, String> params, Authentication authen) {

        if (authen != null) {
            UserDetails user = this.taikhoan.loadUserByUsername(authen.getName());
            NguoiDung u = this.taikhoan.getTaiKhoanbyTenTK(user.getUsername());
            model.addAttribute("taikhoan", this.taikhoan.getTaiKhoan(authen.getName()).get(0));
            model.addAttribute("taikhoan", u);
            model.addAttribute("nguoidung", this.taikhoan.getTaiKhoan(authen.getName()).get(0));

        }
        model.addAttribute("user", new NguoiDung());

        return "doimatkhau";
    }

    @PostMapping("/doimatkhau")
    public String doiMatKhau(Model model, Authentication authen, @RequestParam Map<String, String> params,
            @RequestParam("matKhauCu") String matKhauCu,
            @RequestParam("matKhauMoi") String matKhauMoi,
            @RequestParam("xacNhanMatKhauMoi") String xacNhanMatKhauMoi,
            HttpSession session) {

        Integer id = Integer.parseInt(params.get("idNguoiDung"));
        NguoiDung nguoiDung = this.taikhoan.getTaiKhoanId(id);

        if (authen != null) {
            if (!matKhauMoi.equals(xacNhanMatKhauMoi)) {
                session.setAttribute("error", "Mật khẩu mới không khớp.");
                return "redirect:/doimatkhau";
            }
            if (passwordEncoder.matches(matKhauCu, nguoiDung.getMatKhau())) {
                String hashedPassword = passwordEncoder.encode(matKhauMoi);
                nguoiDung.setMatKhau(hashedPassword);
                boolean capNhatThanhCong = taikhoan.updateTaiKhoan(nguoiDung);
                if (capNhatThanhCong) {
                    session.setAttribute("success", "Đổi mật khẩu thành công.");
                    return "redirect:/";
                } else {
                    session.setAttribute("error", "Lỗi khi cập nhật mật khẩu.");
                }
            } else {
                session.setAttribute("error", "Mật khẩu cũ không đúng.");
            }
        }
        return "redirect:/doimatkhau";
    }

    @GetMapping("/capnhattaikhoan")
    public String capNhatTaiKhoan(Model model, @RequestParam Map<String, String> params, Authentication authen) {

        if (authen != null) {
            UserDetails user = this.taikhoan.loadUserByUsername(authen.getName());
            NguoiDung u = this.taikhoan.getTaiKhoanbyTenTK(user.getUsername());
            model.addAttribute("nguoidung", this.taikhoan.getTaiKhoan(authen.getName()).get(0));

            model.addAttribute("taikhoan", u);
        }

        return "capnhattaikhoan";
    }

    @PostMapping("/capnhattaikhoan")
    public String capnhatTaiKhoan(Model model, Authentication authen,
            @RequestParam Map<String, String> params,
            @ModelAttribute(value = "taikhoan") NguoiDung taikhoan) {
        String errMsg = "";
        if (authen != null) {
            if (this.taikhoan.updateNguoiDung(taikhoan) == true) {
                return "redirect:/capnhattaikhoan";
            } else {
                errMsg = "ra";
            }
        }
        return "capnhattaikhoan";
    }
}
