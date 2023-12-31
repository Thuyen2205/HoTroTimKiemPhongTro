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
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Map;
import java.util.regex.Pattern;
import javax.persistence.Query;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
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
import java.util.Random;
import org.springframework.web.bind.annotation.SessionAttributes;

/**
 *
 * @author ThanhThuyen
 */
@Controller
//@SessionAttributes("username")
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
    @Autowired
    private JavaMailSender emailSender;
    private int randomNumber;

    @RequestMapping("/dangnhap")
    public String dangNhap() {
        return "dangnhap";
    }

    @RequestMapping("/canhan")
//    @Transactional
    public String dangNhapCaNhan(Model model, Authentication authen, @RequestParam(name = "errMsg", required = false) String errMsg) {
//        model.addAttribute("taikhoan", new NguoiDung());

        if (authen != null) {
            UserDetails user = this.taikhoan.loadUserByUsername(authen.getName());
            NguoiDung u = this.taikhoan.getTaiKhoanbyTenTK(user.getUsername());
            model.addAttribute("taikhoan", u);
            model.addAttribute("baiviet", this.baiviet.getBaiVietByIdNgDung(u));
        }
        model.addAttribute("nguoidung", this.taikhoan.getTaiKhoan(authen.getName()).get(0));
        model.addAttribute("errMsg", errMsg);

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
    public String doiMatKhau(Model model, @RequestParam Map<String, String> params, Authentication authen, @RequestParam(name = "errMsg", required = false) String errMsg) {

        if (authen != null) {
            UserDetails user = this.taikhoan.loadUserByUsername(authen.getName());
            NguoiDung u = this.taikhoan.getTaiKhoanbyTenTK(user.getUsername());
            model.addAttribute("taikhoan", this.taikhoan.getTaiKhoan(authen.getName()).get(0));
            model.addAttribute("taikhoan", u);
            model.addAttribute("nguoidung", this.taikhoan.getTaiKhoan(authen.getName()).get(0));

        }
        model.addAttribute("errMsg", errMsg);
        model.addAttribute("user", new NguoiDung());

        return "doimatkhau";
    }

    @PostMapping("/doimatkhau")
    public String doiMatKhau(Model model, Authentication authen, @RequestParam Map<String, String> params,
            @RequestParam("matKhauCu") String matKhauCu,
            @RequestParam("matKhauMoi") String matKhauMoi,
            @RequestParam("xacNhanMatKhauMoi") String xacNhanMatKhauMoi,
            HttpSession session) throws UnsupportedEncodingException {
        String errMsg = "";
        Integer id = Integer.parseInt(params.get("idNguoiDung"));
        NguoiDung nguoiDung = this.taikhoan.getTaiKhoanId(id);

        if (authen != null) {
            if (!matKhauMoi.equals(xacNhanMatKhauMoi)) {
                errMsg = "Mat moi khong khop";
                return "redirect:/doimatkhau?errMsg=" + URLEncoder.encode(errMsg, "UTF-8");
            }
            if (passwordEncoder.matches(matKhauCu, nguoiDung.getMatKhau())) {
                String hashedPassword = passwordEncoder.encode(matKhauMoi);
                nguoiDung.setMatKhau(hashedPassword);
                boolean capNhatThanhCong = taikhoan.updateTaiKhoan(nguoiDung);
                if (capNhatThanhCong) {
                    session.setAttribute("success", "Đổi mật khẩu thành công.");
                    return "redirect:/";
                } else {
                    errMsg = "Loi cap nhat";
                    return "redirect:/doimatkhau?errMsg=" + URLEncoder.encode(errMsg, "UTF-8");
                }
            } else {
                errMsg = "Mat khau cu khong dung";
                return "redirect:/doimatkhau?errMsg=" + URLEncoder.encode(errMsg, "UTF-8");
            }
        }
        return "redirect:/doimatkhau?errMsg=" + URLEncoder.encode(errMsg, "UTF-8");
    }

    @GetMapping("/capnhattaikhoan")
    public String capNhatTaiKhoan(Model model, @RequestParam Map<String, String> params, Authentication authen,
            @RequestParam(name = "errMsg", required = false) String errMsg) {

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
            @ModelAttribute(value = "taikhoan") NguoiDung taikhoan) throws UnsupportedEncodingException {
        String errMsg = "";
        if (taikhoan.getTenTaiKhoan() == null || taikhoan.getTenTaiKhoan().isEmpty()) {
            errMsg = "Vui lòng nhập tên nguoi dung";
            return "redirect:/canhan?errMsg=" + URLEncoder.encode(errMsg, "UTF-8");
        } else if (taikhoan.getTenTaiKhoan().length() < 5) {
            errMsg = "Tên tai khoan phải có ít nhất 5 ký tự";
            return "redirect:/canhan?errMsg=" + URLEncoder.encode(errMsg, "UTF-8");
        }
        if (taikhoan.getEmail() == null || taikhoan.getEmail().isEmpty()) {
            errMsg = "Vui lòng nhập dia chi email";
            return "redirect:/capnhattaikhoan?errMsg=" + URLEncoder.encode(errMsg, "UTF-8");
        } else {
            String emailPattern = "^[A-Za-z0-9+_.-]+@(.+)$";
            if (!Pattern.matches(emailPattern, taikhoan.getEmail())) {
                errMsg = "Dia chi email không hợp lệ";
                return "redirect:/canhan?errMsg=" + URLEncoder.encode(errMsg, "UTF-8");
            }
        }
        if (taikhoan.getSdt() == null || taikhoan.getSdt().isEmpty()) {
            errMsg = "Vui lòng nhập so dien thoai";
            return "redirect:/canhan?errMsg=" + URLEncoder.encode(errMsg, "UTF-8");
        } else if (!taikhoan.getSdt().matches("\\d{10,}")) {
            errMsg = "Số điện thoại phải chứa ít nhất 10 chữ số";
            return "redirect:/canhan?errMsg=" + URLEncoder.encode(errMsg, "UTF-8");
        }
        if (authen != null) {
            if (this.taikhoan.updateNguoiDung(taikhoan) == true) {
                return "redirect:/canhan";
            } else {
                errMsg = "ra";
            }
        }
        return "redirect:/capnhattaikhoan?errMsg=" + URLEncoder.encode(errMsg, "UTF-8");
    }

    @GetMapping("/quenmatkhau")
    public String quenMatKhau(Model model, @RequestParam Map<String, String> params, Authentication authen,
            @RequestParam(name = "errMsg", required = false) String errMsg,
            @RequestParam(name = "TenTaiKhoan", required = false) String TenTaiKhoan) {

        if (authen != null) {
            UserDetails user = this.taikhoan.loadUserByUsername(authen.getName());
            NguoiDung u = this.taikhoan.getTaiKhoanbyTenTK(user.getUsername());
            model.addAttribute("nguoidung", this.taikhoan.getTaiKhoan(authen.getName()).get(0));
            model.addAttribute("taikhoan", u);
        }

        return "quenmatkhau";
    }

//    @GetMapping("/quenmatkhau/{id}")
//    public String thayDoiMkByIdTK(Model model, @PathVariable("id") int id) {
//
//        NguoiDung tk = (NguoiDung) this.nguoidung.getNgDungById(id);
//        model.addAttribute("user", tk);
//        return "quenmatkhau";
//    }
    @PostMapping("/quenmatkhau")
    public String quenMatKhau(@RequestParam("username") String username, @RequestParam Map<String, String> params) {

//        Integer id = Integer.parseInt(params.get("user"));
        NguoiDung nguoidung = this.taikhoan.getTaiKhoanbyTenTK(username);

        if (this.taikhoan.getTaiKhoanbyTenTK(username) != null) {
            randomNumber = new Random().nextInt(100);
            SimpleMailMessage message = new SimpleMailMessage();
            message.setTo(nguoidung.getEmail());
            message.setSubject("Xác nhận thông tin");
            message.setText("Số của bạn là: " + randomNumber);
            emailSender.send(message);
        }
        return "redirect:/matkhaumoi/" + nguoidung.getId();
    }

//    @PostMapping("/quenmatkhau_xacnhan")
//    public String quenMatKhauXacNhan(@RequestParam("soxacnhan") String soXacNhan) {
//
//        int soXacNhanInt = Integer.parseInt(soXacNhan);
//
//        if (soXacNhanInt == randomNumber) {
//
//            return "matkhaumoi";
//
//        }
//        return "quenmatkhau";
//    }
    @GetMapping("/matkhaumoi/{id}")
    public String matKhauMoi(Model model, @RequestParam Map<String, String> params, Authentication authen,
            @RequestParam(name = "errMsg", required = false) String errMsg, @PathVariable("id") int id) {

        if (authen != null) {
            UserDetails user = this.taikhoan.loadUserByUsername(authen.getName());
            NguoiDung u = this.taikhoan.getTaiKhoanbyTenTK(user.getUsername());
            model.addAttribute("nguoidung", this.taikhoan.getTaiKhoan(authen.getName()).get(0));
            model.addAttribute("taikhoan", u);
        }

        NguoiDung u1 = this.taikhoan.getTaiKhoanId(id);
        model.addAttribute("tk", u1);

        return "matkhaumoi";
    }

    @PostMapping("/matkhaumoi/{id}")
    public String matKhauMot(@RequestParam("matKhauMoi") String matKhauMoi,
            @RequestParam("soxacnhan") String soXacNhan,
            @RequestParam("xacNhanMatKhauMoi") String xacNhanMatKhauMoi,
            @PathVariable("id") int id) {
        NguoiDung tk = this.taikhoan.getTaiKhoanId(id);

        int soXacNhanInt = Integer.parseInt(soXacNhan);

        if (soXacNhanInt == randomNumber) {
            if (matKhauMoi.equals(xacNhanMatKhauMoi)) {
                String hashedPassword = passwordEncoder.encode(matKhauMoi);
                tk.setMatKhau(hashedPassword);
                return "dangnhap";
            }
        }

        return "matkhaumoi";
    }

//    @GetMapping("/xacnhantaikhoan")
//    public String xacNhanTaiKhoan(Model model, @RequestParam Map<String, String> params, Authentication authen,
//            @RequestParam(name = "errMsg", required = false) String errMsg) {
//
//        if (authen != null) {
//            UserDetails user = this.taikhoan.loadUserByUsername(authen.getName());
//            NguoiDung u = this.taikhoan.getTaiKhoanbyTenTK(user.getUsername());
//            model.addAttribute("nguoidung", this.taikhoan.getTaiKhoan(authen.getName()).get(0));
//            model.addAttribute("taikhoan", u);
//
//        }
//
//        return "xacnhantaikhoan";
//    }
}
