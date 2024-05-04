package com.example.demo.model;

import jakarta.persistence.*;
import org.hibernate.mapping.List;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "NguoiDung", schema = "dbo", catalog = "DeadlineRestaurant")
public class NguoiDungEntity implements Serializable {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "idNguoiDung")
    private long idKhachHang;
    @Basic
    @Column(name = "Email")
    private String email;
    @Basic
    @Column(name = "MatKhau")
    private String matKhau;
    @Basic
    @Column(name = "SoDienThoai")
    private Long soDienThoai;
    @Basic
    @Column(name = "HoVaTen")
    private String hoVaTen;
    @Basic
    @Column(name = "GioiTinh")
    private String gioiTinh;
    @Basic
    @Column(name = "PhanQuyen")
    private long phanQuyen;
    @Basic
    @Column(name = "DiaChi")
    private String diaChi;
    @Basic
    @Column(name = "AvtKhachHang")
    private String avtKhachHang;

    @OneToMany(mappedBy = "nguoiDung", cascade = CascadeType.ALL)
    private Set<HoaDonEntity> HoaDon = new HashSet<>();

    @OneToMany(mappedBy = "nguoiDung", cascade = CascadeType.ALL)
    private Set<GioHangEntity> gioHang = new HashSet<>();

    public Set<HoaDonEntity> getHoaDon() {
        return HoaDon;
    }

    public void setHoaDon(Set<HoaDonEntity> hoaDon) {
        HoaDon = hoaDon;
    }

    public void setSoDienThoai(Long soDienThoai) {
        this.soDienThoai = soDienThoai;
    }

    public Set<GioHangEntity> getGioHang() {
        return gioHang;
    }

    public void setGioHang(Set<GioHangEntity> giohang) {
        this.gioHang = giohang;
    }

    public Set<HoaDonEntity> getHoadon() {
        return HoaDon;
    }

    public void setHoadon(Set<HoaDonEntity> hoadon) {
        this.HoaDon = hoadon;
    }

    public long getIdKhachHang() {
        return idKhachHang;
    }

    public void setIdKhachHang(long idKhachHang) {
        this.idKhachHang = idKhachHang;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMatKhau() {
        return matKhau;
    }

    public void setMatKhau(String matKhau) {
        this.matKhau = matKhau;
    }

    public Long getSoDienThoai() {
        return soDienThoai;
    }

    public void setSoDienThoai(long soDienThoai) {
        this.soDienThoai = soDienThoai;
    }

    public String getHoVaTen() {
        return hoVaTen;
    }

    public void setHoVaTen(String hoVaTen) {
        this.hoVaTen = hoVaTen;
    }

    public String getGioiTinh() {
        return gioiTinh;
    }

    public void setGioiTinh(String gioiTinh) {
        this.gioiTinh = gioiTinh;
    }

    public Long getPhanQuyen() {
        return phanQuyen;
    }

    public void setPhanQuyen(long phanQuyen) {
        this.phanQuyen = phanQuyen;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        NguoiDungEntity that = (NguoiDungEntity) o;

        if (idKhachHang != that.idKhachHang) return false;
        if (phanQuyen != that.phanQuyen) return false;
        if (email != null ? !email.equals(that.email) : that.email != null) return false;
        if (matKhau != null ? !matKhau.equals(that.matKhau) : that.matKhau != null) return false;
        if (soDienThoai != null ? !soDienThoai.equals(that.soDienThoai) : that.soDienThoai != null) return false;
        if (hoVaTen != null ? !hoVaTen.equals(that.hoVaTen) : that.hoVaTen != null) return false;
        if (gioiTinh != null ? !gioiTinh.equals(that.gioiTinh) : that.gioiTinh != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (idKhachHang ^ (idKhachHang >>> 32));
        result = 31 * result + (email != null ? email.hashCode() : 0);
        result = 31 * result + (matKhau != null ? matKhau.hashCode() : 0);
        result = 31 * result + (soDienThoai != null ? soDienThoai.hashCode() : 0);
        result = 31 * result + (hoVaTen != null ? hoVaTen.hashCode() : 0);
        result = 31 * result + (gioiTinh != null ? gioiTinh.hashCode() : 0);
        result = 31 * result + (int) (phanQuyen ^ (phanQuyen >>> 32));
        return result;
    }

    public String getDiaChi() {
        return diaChi;
    }

    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }

    public String getAvtKhachHang() {
        return avtKhachHang;
    }

    public void setAvtKhachHang(String avtKhachHang) {
        this.avtKhachHang = avtKhachHang;
    }
}
