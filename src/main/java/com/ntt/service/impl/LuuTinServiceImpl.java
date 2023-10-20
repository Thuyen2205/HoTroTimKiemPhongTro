/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ntt.service.impl;

import com.ntt.pojo.BaiViet;
import com.ntt.pojo.LuuTin;
import com.ntt.pojo.NguoiDung;
import com.ntt.repository.BaiVietRepository;
import com.ntt.repository.LuuTinRepository;
import com.ntt.repository.TaiKhoanRepository;
import com.ntt.service.LuuTinService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author ThanhThuyen
 */
@Service
public class LuuTinServiceImpl implements LuuTinService {

    @Autowired
    private LuuTinRepository luuTin;
    @Autowired
    private TaiKhoanRepository taikhoanRepo;
    @Autowired
    private BaiVietRepository baivietRepo;

    @Override
    public boolean addLuuTin(LuuTin luutin) {
        NguoiDung n = this.taikhoanRepo.getTaiKhoanId(luutin.getIdChuBaiViet());
        BaiViet bv= new BaiViet();
        luutin.setIdBaiViet(bv);
        NguoiDung v = this.taikhoanRepo.getTaiKhoan(luutin.getTenNguoiDangBai()).get(0);
        luutin.setIdNguoiDung(v);
        return this.luuTin.addLuuTin(luutin);
    }

}
