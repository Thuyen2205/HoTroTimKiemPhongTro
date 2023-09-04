/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ntt.controllers;

import com.ntt.pojo.BaiViet;
import com.ntt.pojo.NguoiDung;
import com.ntt.pojo.TrangThaiBaiViet;
import com.ntt.service.BaiVietService;
import com.ntt.service.BinhLuanService;
import com.ntt.service.HinhAnhService;
import com.ntt.service.LoaiBaiVietService;
import com.ntt.service.NguoiDungService;
import com.ntt.service.TaiKhoanService;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Admins
 */
@RestController

@CrossOrigin
public class ApiBaiVietController {

    @Autowired
    private BaiVietService baivietService;
    @Autowired
    private TaiKhoanService taikhoanService;
    @Autowired
    private LoaiBaiVietService loaibaivietService;
    @Autowired
    private BinhLuanService binhLuanService;
    @Autowired
    private HinhAnhService HinhAnhService;

    @DeleteMapping("/canhan/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void deleteBViet(@PathVariable(value = "id") int id) {
//
//        this.binhLuanService.deleteBinhLuanByBaiVietId(id);
//        this.HinhAnhService.deleteHinhAnhByBaiVietId(id);
        this.baivietService.deleteBaiViet(id);

    }

}
