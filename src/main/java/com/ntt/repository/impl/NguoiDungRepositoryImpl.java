/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ntt.repository.impl;

import com.ntt.pojo.NguoiDung;
import com.ntt.repository.NguoiDungRepository;
import java.util.List;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Admins
 */
@Repository
@Transactional
public class NguoiDungRepositoryImpl implements NguoiDungRepository {

    @Autowired
    private LocalSessionFactoryBean factory;

    @Override
    public List<NguoiDung> getTTNguoiDung(String tenNguoiDangNhap) {
        Session s= this.factory.getObject().getCurrentSession();
        CriteriaBuilder builder= s.getCriteriaBuilder();
        CriteriaQuery<NguoiDung> query= builder.createQuery(NguoiDung.class);
        Root root=query.from(NguoiDung.class);
        query= query.select(root);
        
        if(!tenNguoiDangNhap.isEmpty())
        {
            Predicate p =builder.equal(root.get("tenNguoiDangNhap").as(String.class), tenNguoiDangNhap.trim());
            query =query.where(p);
        }
        
        Query q = s.createQuery(query);
        return q.getResultList();
    }
        
            
    

}
