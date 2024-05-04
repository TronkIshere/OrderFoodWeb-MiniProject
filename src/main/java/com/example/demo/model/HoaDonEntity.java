package com.example.demo.model;

import jakarta.persistence.*;
import org.hibernate.mapping.List;

import java.sql.Date;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "HoaDon", schema = "dbo", catalog = "DeadlineRestaurant")
public class HoaDonEntity {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "idHoaDon")
    private long idHoaDon;
    @ManyToOne
    @JoinColumn(name="idNguoiDung", referencedColumnName = "idNguoiDung")
    private NguoiDungEntity nguoiDung;

    @OneToMany(mappedBy = "HoaDon", cascade = CascadeType.ALL)
    private Set<GioHangEntity> gioHang;
    public Set<GioHangEntity> getGioHang() {
        return gioHang;
    }

    public void setGioHang(Set<GioHangEntity> gioHang) {
        this.gioHang = gioHang;
    }

    public NguoiDungEntity getNguoiDung() {
        return nguoiDung;
    }

    public void setNguoiDung(NguoiDungEntity nguoiDung) {
        this.nguoiDung = nguoiDung;
    }

    @Basic
    @Column(name = "NgayDatHang")
    private Date ngayDatHang;
    @Basic
    @Column(name = "MoTa")
    private String moTa;
    @Basic
    @Column(name = "DiaChiGiaoHang")
    private String diaChiGiaoHang;
    @Basic
    @Column(name = "TongSoTien")
    private long tongSoTien;

    public long getIdHoaDon() {
        return idHoaDon;
    }

    public void setIdHoaDon(long idHoaDon) {
        this.idHoaDon = idHoaDon;
    }

    public long getIdNguoiDung() {
        return nguoiDung != null ? nguoiDung.getIdKhachHang() : 0;
    }

    public void setIdNguoiDung(long idNguoiDung) {
        // Không cần thiết lập idNguoiDung vì đã sử dụng đối tượng nguoiDung
    }

    public Date getNgayDatHang() {
        return ngayDatHang;
    }

    public void setNgayDatHang(Date ngayDatHang) {
        this.ngayDatHang = ngayDatHang;
    }

    public String getMoTa() {
        return moTa;
    }

    public void setMoTa(String moTa) {
        this.moTa = moTa;
    }

    public String getDiaChiGiaoHang() {
        return diaChiGiaoHang;
    }

    public void setDiaChiGiaoHang(String diaChiGiaoHang) {
        this.diaChiGiaoHang = diaChiGiaoHang;
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

        HoaDonEntity that = (HoaDonEntity) o;

        if (idHoaDon != that.idHoaDon) return false;
        if (nguoiDung != null ? !nguoiDung.equals(that.nguoiDung) : that.nguoiDung != null) return false;
        if (tongSoTien != that.tongSoTien) return false;
        if (ngayDatHang != null ? !ngayDatHang.equals(that.ngayDatHang) : that.ngayDatHang != null) return false;
        if (moTa != null ? !moTa.equals(that.moTa) : that.moTa != null) return false;
        if (diaChiGiaoHang != null ? !diaChiGiaoHang.equals(that.diaChiGiaoHang) : that.diaChiGiaoHang != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (idHoaDon ^ (idHoaDon >>> 32));
        result = 31 * result + (nguoiDung != null ? nguoiDung.hashCode() : 0);
        result = 31 * result + (ngayDatHang != null ? ngayDatHang.hashCode() : 0);
        result = 31 * result + (moTa != null ? moTa.hashCode() : 0);
        result = 31 * result + (diaChiGiaoHang != null ? diaChiGiaoHang.hashCode() : 0);
        result = 31 * result + (int) (tongSoTien ^ (tongSoTien >>> 32));
        return result;
    }
}
