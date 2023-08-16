/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.ntt.repository;

import com.ntt.pojo.NguoiDung;
import java.util.List;

/**
 *
 * @author Admins
 */
public interface NguoiDungRepository {
    List<NguoiDung> getTTNguoiDung(String tenNguoiDangNhap);
}
