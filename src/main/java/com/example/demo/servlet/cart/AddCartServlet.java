package com.example.demo.servlet.cart;

import com.example.demo.dao.GioHangEnityManager;
import com.example.demo.dao.HibernateUtils;
import com.example.demo.dao.NguoiDungEntityManager;
import com.example.demo.model.GioHangEntity;
import com.example.demo.model.MonAnEntity;
import com.example.demo.model.NguoiDungEntity;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.constraints.Null;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Set;

@WebServlet(name = "addCartServlet", value = "/addCartServlet")
public class AddCartServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String foodId = req.getParameter("food-id-cart");
        String foodAmount = req.getParameter("food-amount");

        Integer addBillAction = Integer.valueOf(req.getParameter("addBillAction"));

        Session session = HibernateUtils.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        try {
            String queryMonAn = "FROM MonAnEntity AS monAn " +
                    "WHERE monAn.idMonAn = :idMonAn ";
            MonAnEntity monAn = session.createQuery(queryMonAn, MonAnEntity.class)
                    .setParameter("idMonAn", foodId)
                    .uniqueResult();

            HttpSession getSession = req.getSession();
            NguoiDungEntity nguoiDung = (NguoiDungEntity) getSession.getAttribute("user");

            GioHangEntity gioHang = new GioHangEntity();
            gioHang.setNguoiDung(nguoiDung);
            gioHang.setMonAn(monAn);
            gioHang.setHoaDon(null);
            gioHang.setSoLuong(Long.parseLong(foodAmount));
            gioHang.setTongSoTien(Long.parseLong(foodAmount) * monAn.getGiaTien());

            GioHangEnityManager gioHangEnityManager = new GioHangEnityManager();
            gioHangEnityManager.insert(gioHang);

            HttpSession httpSession = req.getSession();

            Set<GioHangEntity> gioHangList = nguoiDung.getGioHang();
            ArrayList<GioHangEntity> danhSachGioHang = new ArrayList<>(gioHangList);

            httpSession.setAttribute("danhSachDonHang", danhSachGioHang);

            if (addBillAction == 1) resp.sendRedirect("paymentOrderPage.jsp");
            else resp.sendRedirect("menuPage.jsp");

        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }

    }
}
