/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.ntt.service;

import com.ntt.pojo.BaiViet;
import java.util.List;

/**
 *
 * @author ThanhThuyen
 */
public interface BaiVietService  {

    List<BaiViet> getBaiViet();

    List<BaiViet> getBaiViet(String tenBaiViet);
    BaiViet loadBaiViet(String tenBaiViet);
    boolean addBaiViet(BaiViet baiviet);
    
    Object getBaiVietById(int id);
    List<Object> getBaiVietByType(String loaiBViet);
}

