package com.example.demo.servlet;

import java.io.*;

import com.example.demo.dao.HoaDonEnityManager;
import com.example.demo.dao.MonAnEnityManager;
import com.example.demo.dao.NguoiDungEntityManager;
import com.example.demo.model.HoaDonEntity;
import com.example.demo.model.MonAnEntity;
import com.example.demo.model.NguoiDungEntity;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "/hello")
public class CheckDataBaseServlet extends HttpServlet {
    private String message;

    public void init() {
        message = "Nó chạy được à!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");

        NguoiDungEntityManager nguoiDungEntityManager = new NguoiDungEntityManager();
        MonAnEnityManager monAnEnityManager = new MonAnEnityManager();
        HoaDonEnityManager hoaDonEnityManager = new HoaDonEnityManager();

        // Hello
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h1>" + message + "</h1>");
        out.println("Đây là toàn bộ người dùng <br>");
        for (NguoiDungEntity user: nguoiDungEntityManager.getAll()){
            out.println(user.getIdKhachHang());
            out.println(user.getEmail());
            out.println(user.getMatKhau());
            out.println(user.getSoDienThoai());
            out.println(user.getHoVaTen());
            out.println(user.getGioiTinh());
            out.println(user.getPhanQuyen());
            out.println("<br>");
        }

        out.println("Đây là toàn bộ món ăn <br>");
        for (MonAnEntity food: monAnEnityManager.getAll()){
            out.println(food.getIdMonAn());
            out.println(food.getTenMon());
            out.println(food.getMieuTa());
            out.println(food.getGiaTien());
            out.println(food.getDiaChi());
            out.println(food.getHinhAnh());
            out.println("<br>");
        }

        out.println("Đây là toàn bộ hóa đơn <br>");
        for (HoaDonEntity bill: hoaDonEnityManager.getAll()){
            out.println(bill.getIdHoaDon());
            out.println(bill.getIdNguoiDung());
            out.println(bill.getNgayDatHang());
            out.println(bill.getMoTa());
            out.println(bill.getDiaChiGiaoHang());
            out.println(bill.getTongSoTien());
            out.println("<br>");
        }
        out.println("</body></html>");
    }

    public void destroy() {
    }
}