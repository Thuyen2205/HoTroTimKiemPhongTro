/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ntt.pojo;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author Admins
 */
@Entity
@Table(name = "bai_viet")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "BaiViet.findAll", query = "SELECT b FROM BaiViet b"),
    @NamedQuery(name = "BaiViet.findById", query = "SELECT b FROM BaiViet b WHERE b.id = :id"),
    @NamedQuery(name = "BaiViet.findByTenBaiViet", query = "SELECT b FROM BaiViet b WHERE b.tenBaiViet = :tenBaiViet"),
    @NamedQuery(name = "BaiViet.findByHinhAnh", query = "SELECT b FROM BaiViet b WHERE b.hinhAnh = :hinhAnh"),
    @NamedQuery(name = "BaiViet.findByPhamViCanTim", query = "SELECT b FROM BaiViet b WHERE b.phamViCanTim = :phamViCanTim"),
    @NamedQuery(name = "BaiViet.findByNgayDang", query = "SELECT b FROM BaiViet b WHERE b.ngayDang = :ngayDang"),
    @NamedQuery(name = "BaiViet.findBySoNguoi", query = "SELECT b FROM BaiViet b WHERE b.soNguoi = :soNguoi"),
    @NamedQuery(name = "BaiViet.findByGiaThue", query = "SELECT b FROM BaiViet b WHERE b.giaThue = :giaThue"),
    @NamedQuery(name = "BaiViet.findByDienTich", query = "SELECT b FROM BaiViet b WHERE b.dienTich = :dienTich"),
    @NamedQuery(name = "BaiViet.findByDiaChiCt", query = "SELECT b FROM BaiViet b WHERE b.diaChiCt = :diaChiCt")})
public class BaiViet implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Size(max = 45)
    @Column(name = "ten_bai_viet")
    private String tenBaiViet;
    @Size(max = 500)
    @Column(name = "hinh_anh")
    private String hinhAnh;
    @Lob
    @Size(max = 2147483647)
    @Column(name = "noi_dung")
    private String noiDung;
    @Size(max = 100)
    @Column(name = "pham_vi_can_tim")
    private String phamViCanTim;
    @Column(name = "ngay_dang")
    @Temporal(TemporalType.TIMESTAMP)
    private Date ngayDang;
    @Column(name = "so_nguoi")
    private Integer soNguoi;
    @Column(name = "gia_thue")
    private Long giaThue;
    @Size(max = 45)
    @Column(name = "dien_tich")
    private String dienTich;
    @Size(max = 45)
    @Column(name = "dia_chi_ct")
    private String diaChiCt;
    @OneToMany(mappedBy = "idBaiViet")
    private Set<BinhLuan> binhLuanSet;
    @OneToMany(mappedBy = "idBaiViet")
    private Set<ThongBao> thongBaoSet;
    @JoinColumn(name = "loai_bai_viet", referencedColumnName = "id")
    @ManyToOne
    private LoaiBaiViet loaiBaiViet;
    @JoinColumn(name = "id_nguoi_dung", referencedColumnName = "id")
    @ManyToOne
    private NguoiDung idNguoiDung;
    @Transient
    private MultipartFile file;
    @Transient
    private String tenNguoiDangBai;

    public BaiViet() {
    }

    public BaiViet(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTenBaiViet() {
        return tenBaiViet;
    }

    public void setTenBaiViet(String tenBaiViet) {
        this.tenBaiViet = tenBaiViet;
    }

    public String getHinhAnh() {
        return hinhAnh;
    }

    public void setHinhAnh(String hinhAnh) {
        this.hinhAnh = hinhAnh;
    }

    public String getNoiDung() {
        return noiDung;
    }

    public void setNoiDung(String noiDung) {
        this.noiDung = noiDung;
    }

    public String getPhamViCanTim() {
        return phamViCanTim;
    }

    public void setPhamViCanTim(String phamViCanTim) {
        this.phamViCanTim = phamViCanTim;
    }

    public Date getNgayDang() {
        return ngayDang;
    }

    public void setNgayDang(Date ngayDang) {
        this.ngayDang = ngayDang;
    }

    public Integer getSoNguoi() {
        return soNguoi;
    }

    public void setSoNguoi(Integer soNguoi) {
        this.soNguoi = soNguoi;
    }

    public Long getGiaThue() {
        return giaThue;
    }

    public void setGiaThue(Long giaThue) {
        this.giaThue = giaThue;
    }

    public String getDienTich() {
        return dienTich;
    }

    public void setDienTich(String dienTich) {
        this.dienTich = dienTich;
    }

    public String getDiaChiCt() {
        return diaChiCt;
    }

    public void setDiaChiCt(String diaChiCt) {
        this.diaChiCt = diaChiCt;
    }

    @XmlTransient
    public Set<BinhLuan> getBinhLuanSet() {
        return binhLuanSet;
    }

    public void setBinhLuanSet(Set<BinhLuan> binhLuanSet) {
        this.binhLuanSet = binhLuanSet;
    }

    @XmlTransient
    public Set<ThongBao> getThongBaoSet() {
        return thongBaoSet;
    }

    public void setThongBaoSet(Set<ThongBao> thongBaoSet) {
        this.thongBaoSet = thongBaoSet;
    }

    public LoaiBaiViet getLoaiBaiViet() {
        return loaiBaiViet;
    }

    public void setLoaiBaiViet(LoaiBaiViet loaiBaiViet) {
        this.loaiBaiViet = loaiBaiViet;
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
        if (!(object instanceof BaiViet)) {
            return false;
        }
        BaiViet other = (BaiViet) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.ntt.pojo.BaiViet[ id=" + id + " ]";
    }

    /**
     * @return the file
     */
    public MultipartFile getFile() {
        return file;
    }

    /**
     * @param file the file to set
     */
    public void setFile(MultipartFile file) {
        this.file = file;
    }

    /**
     * @return the tenNguoiDangBai
     */
    public String getTenNguoiDangBai() {
        return tenNguoiDangBai;
    }

    /**
     * @param tenNguoiDangBai the tenNguoiDangBai to set
     */
    public void setTenNguoiDangBai(String tenNguoiDangBai) {
        this.tenNguoiDangBai = tenNguoiDangBai;
    }

}
