package com.example.demo.model;

import jakarta.persistence.*;

import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "MonAn", schema = "dbo", catalog = "DeadlineRestaurant")
public class MonAnEntity {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "idMonAn")
    private long idMonAn;
    @Basic
    @Column(name = "TenMon")
    private String tenMon;
    @Basic
    @Column(name = "MieuTa")
    private String mieuTa;
    @Basic
    @Column(name = "GiaTien")
    private long giaTien;
    @Basic
    @Column(name = "DiaChi")
    private String diaChi;
    @Basic
    @Column(name = "HinhAnh")
    private String hinhAnh;

    @OneToMany(mappedBy = "MonAn", cascade = CascadeType.ALL)
    private Set<GioHangEntity> gioHang;

    public Set<GioHangEntity> getGioHang() {
        return gioHang;
    }

    public void setGioHang(Set<GioHangEntity> gioHang) {
        this.gioHang = gioHang;
    }

    public long getIdMonAn() {
        return idMonAn;
    }

    public void setIdMonAn(long idMonAn) {
        this.idMonAn = idMonAn;
    }

    public String getTenMon() {
        return tenMon;
    }

    public void setTenMon(String tenMon) {
        this.tenMon = tenMon;
    }

    public String getMieuTa() {
        return mieuTa;
    }

    public void setMieuTa(String mieuTa) {
        this.mieuTa = mieuTa;
    }

    public long getGiaTien() {
        return giaTien;
    }

    public void setGiaTien(long giaTien) {
        this.giaTien = giaTien;
    }

    public String getDiaChi() {
        return diaChi;
    }

    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }

    public String getHinhAnh() {
        return hinhAnh;
    }

    public void setHinhAnh(String hinhAnh) {
        this.hinhAnh = hinhAnh;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        MonAnEntity that = (MonAnEntity) o;

        if (idMonAn != that.idMonAn) return false;
        if (giaTien != that.giaTien) return false;
        if (tenMon != null ? !tenMon.equals(that.tenMon) : that.tenMon != null) return false;
        if (mieuTa != null ? !mieuTa.equals(that.mieuTa) : that.mieuTa != null) return false;
        if (diaChi != null ? !diaChi.equals(that.diaChi) : that.diaChi != null) return false;
        if (hinhAnh != null ? !hinhAnh.equals(that.hinhAnh) : that.hinhAnh != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (idMonAn ^ (idMonAn >>> 32));
        result = 31 * result + (tenMon != null ? tenMon.hashCode() : 0);
        result = 31 * result + (mieuTa != null ? mieuTa.hashCode() : 0);
        result = 31 * result + (int) (giaTien ^ (giaTien >>> 32));
        result = 31 * result + (diaChi != null ? diaChi.hashCode() : 0);
        result = 31 * result + (hinhAnh != null ? hinhAnh.hashCode() : 0);
        return result;
    }
}
