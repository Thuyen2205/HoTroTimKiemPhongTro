/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ntt.service.impl;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.ntt.pojo.BaiViet;
import com.ntt.pojo.LoaiBaiViet;
import com.ntt.pojo.NguoiDung;
import com.ntt.repository.BaiVietRepository;
import com.ntt.repository.LoaiBaiVietRepository;
import com.ntt.repository.TaiKhoanRepository;
import com.ntt.service.BaiVietService;
import java.io.IOException;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

/**
 *
 * @author ThanhThuyen
 */
@Service
public class BaiVietServiceImpl implements BaiVietService {

    @Autowired
    private Cloudinary cloudinary;
    @Autowired
    private BaiVietRepository baivietRepo;
    @Autowired
    private TaiKhoanRepository taikhoan;
    @Autowired
    private LoaiBaiVietRepository loaiBaiViet;

    @Override
    public List<BaiViet> getBaiViet() {
        return this.baivietRepo.getBaiViet();
    }

    @Override
    public boolean addBaiViet(BaiViet baiviet) {
        NguoiDung b = this.taikhoan.getTaiKhoan(baiviet.getTenNguoiDangBai()).get(0);
        baiviet.setIdNguoiDung(b);
        try {

            if (baiviet.getIdNguoiDung().getIdLoaiTaiKhoan().getId() == 2) {

                Map res = this.cloudinary.uploader().upload(baiviet.getFile().getBytes(),
                        ObjectUtils.asMap("resource_type", "auto"));
                baiviet.setHinhAnh(res.get("secure_url").toString());
                baiviet.setNgayDang(new Date());

            }

        } catch (IOException ex) {
            System.err.println("== ADD BaiViet ==" + ex.getMessage());
        }
        return this.baivietRepo.addBaiViet(baiviet);
    }

    @Override
    public List<BaiViet> getBaiViet(String tenBaiViet) {
        return this.baivietRepo.getBaiViet(tenBaiViet);
    }

    @Override
    public BaiViet loadBaiViet(String tenBaiViet) {
        List<BaiViet> baiviets = this.getBaiViet(tenBaiViet);

        if (baiviets.isEmpty()) {
            throw new UsernameNotFoundException("Bài Viết Không Tồn Tại!!!");
        }
        BaiViet baiviet = baiviets.get(0);

        baiviet.getIdNguoiDung().getTenNguoiDung();

        return new BaiViet();
    }

    @Override
    public Object getBaiVietById(int id) {
        return this.baivietRepo.getBaiVietById(id);

    }

    @Override
    public List<Object> getBaiVietByType(String loaiBViet) {
        return this.baivietRepo.getBaiVietByType(loaiBViet);
    }

    @Override
    public List<Object> getBaiVietByIdNgDung(NguoiDung idNgDung) {
        return this.baivietRepo.getBaiVietByIdNgDung(idNgDung);
    }

    @Override
    public boolean updateBaiViet(BaiViet baiviet) {
        if (!baiviet.getFile().isEmpty()) {
            try {
                Map res = this.cloudinary.uploader().upload(baiviet.getFile().getBytes(),
                        ObjectUtils.asMap("resource_type", "auto"));
                baiviet.setHinhAnh(res.get("secure_url").toString());
            } catch (IOException ex) {
                System.err.println("== Update BaiViet ==" + ex.getMessage());
            }
        }
        return this.baivietRepo.updateBaiViet(baiviet);
    }

    @Override
    public boolean deleteBaiViet(int id) {
        return this.baivietRepo.deleteBaiViet(id);
    }

}
