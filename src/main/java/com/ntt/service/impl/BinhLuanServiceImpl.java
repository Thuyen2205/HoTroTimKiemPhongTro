/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ntt.service.impl;

import com.ntt.pojo.BinhLuan;
import com.ntt.repository.BinhLuanRepository;
import com.ntt.service.BinhLuanService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author ThanhThuyen
 */
@Service
public class BinhLuanServiceImpl implements BinhLuanService{
    @Autowired
    private BinhLuanRepository binhluan;
    @Override
    public List<BinhLuan> getBinhLuan() {
        return this.binhluan.getBinhLuan();
    }
    
}
