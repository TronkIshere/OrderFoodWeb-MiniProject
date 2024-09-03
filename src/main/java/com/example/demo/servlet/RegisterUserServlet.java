package com.example.demo.servlet;

import com.example.demo.dao.NguoiDungEntityManager;
import com.example.demo.model.NguoiDungEntity;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "registerUserServlet", value = "/registerUserServlet")
public class RegisterUserServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Lấy dữ liệu từ form
        String fullName = req.getParameter("Full-name");
        String gender = req.getParameter("Gender");
        String address = req.getParameter("Address");
        String numberString = req.getParameter("Number");
        String email = req.getParameter("Email");
        String password = req.getParameter("Password");

        String defaultAvt = "img/customersAvt/defaultAvt.png";

        // Tạo đối tượng UserEntity và set giá trị
        NguoiDungEntity nguoiDung = new NguoiDungEntity();
        nguoiDung.setHoVaTen(fullName);
        nguoiDung.setGioiTinh(gender);
        nguoiDung.setDiaChi(address);
        nguoiDung.setSoDienThoai(Long.valueOf(numberString));
        nguoiDung.setEmail(email);
        nguoiDung.setPhanQuyen(2);
        nguoiDung.setMatKhau(password);
        nguoiDung.setAvtKhachHang(defaultAvt);

        // Lưu user vào cơ sở dữ liệu
        NguoiDungEntityManager nguoiDungEntityManager = new NguoiDungEntityManager();
        nguoiDungEntityManager.insert(nguoiDung);

        // Chuyển hướng đến trang đăng ký thành công
        resp.sendRedirect("index.jsp");
    }
}
