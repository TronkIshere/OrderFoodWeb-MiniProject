package com.example.demo.servlet;

import java.io.*;

import com.example.demo.dao.NguoiDungEntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "logoutServlet", value = "/logout")
public class LogoutServlet extends  HttpServlet {
    NguoiDungEntityManager nguoiDungEntityManager = new NguoiDungEntityManager();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        session.invalidate();
        resp.sendRedirect("index.jsp"); // Chuyển hướng đến trang đăng nhập
    }

}