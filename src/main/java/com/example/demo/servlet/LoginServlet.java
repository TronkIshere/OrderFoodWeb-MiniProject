package com.example.demo.servlet;

import com.example.demo.dao.HibernateUtils;
import com.example.demo.dao.HoaDonEnityManager;
import com.example.demo.dao.MonAnEnityManager;
import com.example.demo.dao.NguoiDungEntityManager;
import com.example.demo.model.GioHangEntity;
import com.example.demo.model.HoaDonEntity;
import com.example.demo.model.MonAnEntity;
import com.example.demo.model.NguoiDungEntity;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import jakarta.transaction.Transactional;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.mapping.List;
import org.hibernate.query.Query;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Set;

@WebServlet(name = "loginServlet", value = "/login")
public class LoginServlet extends HttpServlet {

    @Transactional
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Session session = HibernateUtils.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        try {
            NguoiDungEntity nguoiDung = authenticateUser(req, session);

            if (nguoiDung != null) {
                HttpSession httpSession = req.getSession();
                setSessionAttributes(httpSession, nguoiDung);
                redirectToCorrectPage(resp, nguoiDung);
            } else {
                resp.sendRedirect("index.jsp");
            }
            transaction.commit();
        } catch (Exception e) {
            handleException(transaction, e);
        } finally {
            session.close();
        }
    }

    private NguoiDungEntity authenticateUser(HttpServletRequest req, Session session) {
        String email = req.getParameter("email_login");
        String password = req.getParameter("password_login");
        String queryNguoiDung = "FROM NguoiDungEntity AS nguoidung " +
                "WHERE nguoidung.email = :email " +
                "AND nguoidung.matKhau = :matkhau";
        return session.createQuery(queryNguoiDung, NguoiDungEntity.class)
                .setParameter("email", email)
                .setParameter("matkhau", password)
                .uniqueResult();
    }

    private void setSessionAttributes(HttpSession httpSession, NguoiDungEntity nguoiDung) {
        ArrayList<HoaDonEntity> danhSachHoaDon = new ArrayList<>(nguoiDung.getHoadon());
        ArrayList<GioHangEntity> danhSachGioHang = new ArrayList<>(nguoiDung.getGioHang());
        MonAnEnityManager monAnEnityManager = new MonAnEnityManager();
        ArrayList<MonAnEntity> danhSachMonAn = new ArrayList<>(monAnEnityManager.getAll());

        httpSession.setAttribute("user", nguoiDung);
        httpSession.setAttribute("danhSachHoaDon", danhSachHoaDon);
        httpSession.setAttribute("danhSachDonHang", danhSachGioHang);
        httpSession.setAttribute("danhSachMonAn", danhSachMonAn);

        if(nguoiDung.getIdKhachHang() == 1) {
            NguoiDungEntityManager nguoiDungEntityManager = new NguoiDungEntityManager();
            ArrayList<NguoiDungEntity> danhSachNguoiDung = (ArrayList<NguoiDungEntity>) nguoiDungEntityManager.getAll();
            httpSession.setAttribute("danhSachNguoiDung", danhSachNguoiDung);
        }
    }

    private void redirectToCorrectPage(HttpServletResponse resp, NguoiDungEntity nguoiDung) throws IOException {
        if (nguoiDung.getPhanQuyen() == 1) {
            resp.sendRedirect("managerIndex.jsp");
        } else {
            resp.sendRedirect("customerIndex.jsp");
        }
    }

    private void handleException(Transaction transaction, Exception e) {
        if (transaction != null) {
            transaction.rollback();
        }
        e.printStackTrace();
    }
}

