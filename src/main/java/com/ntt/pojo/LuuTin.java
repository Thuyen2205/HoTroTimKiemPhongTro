/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ntt.pojo;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author ThanhThuyen
 */
@Entity
@Table(name = "luu_tin")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "LuuTin.findAll", query = "SELECT l FROM LuuTin l"),
    @NamedQuery(name = "LuuTin.findById", query = "SELECT l FROM LuuTin l WHERE l.id = :id")})
public class LuuTin implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "id")
    private Integer id;
    @JoinColumn(name = "id_bai_viet", referencedColumnName = "id")
    @ManyToOne
    private BaiViet idBaiViet;
    @JoinColumn(name = "id_nguoi_dung", referencedColumnName = "id")
    @ManyToOne
    private NguoiDung idNguoiDung;

    public LuuTin() {
    }

    public LuuTin(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public BaiViet getIdBaiViet() {
        return idBaiViet;
    }

    public void setIdBaiViet(BaiViet idBaiViet) {
        this.idBaiViet = idBaiViet;
    }

    public NguoiDung getIdNguoiDung() {
        return idNguoiDung;
    }

    public void setIdNguoiDung(NguoiDung idNguoiDung) {
        this.idNguoiDung = idNguoiDung;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof LuuTin)) {
            return false;
        }
        LuuTin other = (LuuTin) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.ntt.pojo.LuuTin[ id=" + id + " ]";
    }
    
}
