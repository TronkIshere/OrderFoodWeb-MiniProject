package com.example.demo.model;

import jakarta.persistence.*;

@Entity
@Table(name = "GioHang", schema = "dbo", catalog = "DeadlineRestaurant")
public class GioHangEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idGioHang")
    private long idGioHang;
    @ManyToOne
    @JoinColumn(name="idNguoiDung", referencedColumnName = "idNguoiDung")
    private NguoiDungEntity nguoiDung;
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name="idMonAn", referencedColumnName = "idMonAn")
    private MonAnEntity monAn;
    @ManyToOne
    @JoinColumn(name="idHoaDon", referencedColumnName = "idHoaDon")
    private HoaDonEntity hoaDon;
    @Basic
    @Column(name = "SoLuong")
    private long soLuong;
    @Basic
    @Column(name = "TongSoTien")
    private long tongSoTien;

    public GioHangEntity() {
    }

    public MonAnEntity getMonAn() {
        return monAn;
    }

    public void setMonAn(MonAnEntity monAn) {
        this.monAn = monAn;
    }

    public HoaDonEntity getHoaDon() {
        return hoaDon;
    }

    public void setHoaDon(HoaDonEntity hoaDon) {
        this.hoaDon = hoaDon;
    }

    public NguoiDungEntity getNguoiDung() {
        return nguoiDung;
    }

    public void setNguoiDung(NguoiDungEntity nguoiDung) {
        this.nguoiDung = nguoiDung;
    }


    public long getIdGioHang() {
        return idGioHang;
    }

    public void setIdGioHang(long idGioHang) {
        this.idGioHang = idGioHang;
    }

    public long getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(long soLuong) {
        this.soLuong = soLuong;
    }

    public long getTongSoTien() {
        return tongSoTien;
    }

    public void setTongSoTien(long tongSoTien) {
        this.tongSoTien = tongSoTien;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        GioHangEntity that = (GioHangEntity) o;

        if (idGioHang != that.idGioHang) return false;
        if (soLuong != that.soLuong) return false;
        if (tongSoTien != that.tongSoTien) return false;
        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (idGioHang ^ (idGioHang >>> 32));
        result = 31 * result + (int) (soLuong ^ (soLuong >>> 32));
        result = 31 * result + (int) (tongSoTien ^ (tongSoTien >>> 32));
        return result;
    }

}
