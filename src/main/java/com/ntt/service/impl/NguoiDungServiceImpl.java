/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ntt.service.impl;

import com.ntt.pojo.NguoiDung;
import com.ntt.repository.NguoiDungRepository;
import com.ntt.service.NguoiDungService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Admins
 */
@Service

public class NguoiDungServiceImpl implements NguoiDungService{

    @Autowired
    private NguoiDungRepository ngdungRepo;

    @Override
    public List<NguoiDung> getTTNgDung(String tenNguoiDangNhap) {
        return this.ngdungRepo.getTTNguoiDung(tenNguoiDangNhap);
    }
   
    
}
