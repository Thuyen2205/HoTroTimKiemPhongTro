/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.ntt.service;

import com.ntt.pojo.NguoiDung;
import java.util.List;

/**
 *
 * @author Admins
 */
public interface NguoiDungService {
        List<NguoiDung> getTTNgDung(String tenNguoiDangNhap);

}
