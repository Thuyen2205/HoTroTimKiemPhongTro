/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.ntt.repository;

import com.ntt.pojo.BaiViet;
import com.ntt.pojo.BinhLuan;
import com.ntt.pojo.NguoiDung;
import java.util.List;

/**
 *
 * @author ThanhThuyen
 */
public interface BinhLuanRepository {

    List<BinhLuan> getBinhLuan(int idBaiViet);
    List<BinhLuan> getBinhLuanByNguoiDung(NguoiDung idNguoiDung);

    boolean addBinhLuan(BinhLuan binhluan);
     boolean deleteBinhLuan(int id);
     BinhLuan getBinhLuanById(int idBinhLuan);
     boolean updateBinhLuan(BinhLuan binhLuan);
     void saveBinhLuan(BinhLuan binhLuan);
     
}
