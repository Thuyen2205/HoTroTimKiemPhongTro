/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ntt.repository.impl;

import com.ntt.pojo.BaiViet;
import com.ntt.pojo.LuuTin;
import com.ntt.pojo.NguoiDung;
import com.ntt.repository.BaiVietRepository;
import com.ntt.repository.LuuTinRepository;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author ThanhThuyen
 */
@Repository
@Transactional
public class LuuTinRepositoryImpl implements LuuTinRepository {

    @Autowired
    private LocalSessionFactoryBean factory;

    @Autowired
    private BaiVietRepository baiViet;

    @Override
    public boolean addLuuTin(LuuTin luutin) {
        Session s = this.factory.getObject().getCurrentSession();
        LuuTin lt = new LuuTin();
        try {
            s.save(luutin);
            return true;
        } catch (HibernateException ex) {
            System.err.println(ex.getMessage());
        }
        return false;
    }

}
