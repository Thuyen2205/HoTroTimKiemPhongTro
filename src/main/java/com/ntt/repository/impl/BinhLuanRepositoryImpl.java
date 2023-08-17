/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ntt.repository.impl;

import com.ntt.pojo.BinhLuan;
import com.ntt.repository.BinhLuanRepository;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
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
public class BinhLuanRepositoryImpl implements BinhLuanRepository {

    @Autowired
    private LocalSessionFactoryBean factory;

    @Override
    public List<BinhLuan> getBinhLuan(int idBaiViet) {
        Session s = this.factory.getObject().getCurrentSession();
        CriteriaBuilder builder = s.getCriteriaBuilder();
        CriteriaQuery<BinhLuan> query = builder.createQuery(BinhLuan.class);
        Root root = query.from(BinhLuan.class);
        query = query.where(builder.equal(root.get("idBaiViet"), idBaiViet));
        query = query.orderBy(builder.desc(root.get("id")));
        Query q = s.createQuery(query);

        return q.getResultList();
    }

    @Override
    public boolean addBinhLuan(BinhLuan binhluan) {
        Session s = this.factory.getObject().getCurrentSession();
        try {
            Date current = new Date();
//            Calendar calendar = Calendar.getInstance();
//            calendar.setTime(current);
//            calendar.add(Calendar.DAY_OF_MONTH, +1); 
//
//            Date newDate = calendar.getTime();
            binhluan.setNgayBinhLuan(current);
            s.save(binhluan);

            return true;
        } catch (HibernateException e) {
            System.err.println(e.getMessage());
        }
        return false;
    }

}
