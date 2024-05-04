package com.example.demo.servlet.bill;

import com.example.demo.dao.GioHangEnityManager;
import com.example.demo.dao.HoaDonEnityManager;
import com.example.demo.dao.NguoiDungEntityManager;
import com.example.demo.model.GioHangEntity;
import com.example.demo.model.HoaDonEntity;
import com.example.demo.model.NguoiDungEntity;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;

@WebServlet(name = "addBillServlet", value = "/addBillServlet")
public class AddBillServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession getSession = req.getSession();
        ArrayList<GioHangEntity> danhSachGioHang = (ArrayList<GioHangEntity>) getSession.getAttribute("danhSachDonHang");
        HoaDonEnityManager hoaDonEnityManager = new HoaDonEnityManager();
        GioHangEnityManager gioHangEnityManager = new GioHangEnityManager();

        if (danhSachGioHang != null && !danhSachGioHang.isEmpty()) {
            Set<GioHangEntity> gioHangSet = new HashSet<>(danhSachGioHang);
            NguoiDungEntity nguoiDung = (NguoiDungEntity) getSession.getAttribute("user");

            Long tongTienHoaDon = 0L;

            String diaChi = req.getParameter("address-text");

            HoaDonEntity hoaDon = new HoaDonEntity();
            hoaDon.setNguoiDung(nguoiDung);
            hoaDon.setNgayDatHang(Date.valueOf(java.time.LocalDate.now()));
            hoaDon.setMoTa("Demo");
            hoaDon.setDiaChiGiaoHang("Demo");

            for(GioHangEntity gioHang : danhSachGioHang){
                gioHang.setNguoiDung(null);
                gioHangEnityManager.update(gioHang);
                tongTienHoaDon += gioHang.getTongSoTien();
            }

            hoaDon.setTongSoTien(tongTienHoaDon);
            hoaDon.setGioHang(gioHangSet);

            hoaDonEnityManager.insert(hoaDon);

            // Cập nhật session với danh sách đơn hàng mới (rỗng)
            getSession.setAttribute("danhSachDonHang", new ArrayList<GioHangEntity>());

            resp.sendRedirect("paymentOrderPage.jsp");
        } else {
            resp.sendRedirect("customerIndex.jsp");
        }
    }
}
