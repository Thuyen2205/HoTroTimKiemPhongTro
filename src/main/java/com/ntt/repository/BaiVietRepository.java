/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.ntt.repository;

import com.ntt.pojo.BaiViet;
import java.util.List;

/**
 *
 * @author ThanhThuyen
 */
public interface BaiVietRepository {
    List<BaiViet> getBaiViet();
    List<BaiViet> getBaiViet(String tenBaiViet);
    boolean addBaiViet(BaiViet baiviet);
    List<Object> getBaiVietByType (String loaiBViet);
    //Lấy bài viết theo id bài viết
    Object getBaiVietById(int id);
    //Lấy bài viết theo id người dùng
    Object getBaiVietByIdNgDung(int idNgDung);

}
