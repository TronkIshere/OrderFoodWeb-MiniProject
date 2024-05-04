package com.example.demo.servlet.User;

import com.example.demo.dao.HibernateUtils;
import com.example.demo.dao.NguoiDungEntityManager;
import com.example.demo.model.NguoiDungEntity;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.hibernate.Session;

import java.io.IOException;

@WebServlet(name = "deleteUserServlet", value = "/deleteUserServlet")
public class DeleteUserServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Session session = HibernateUtils.getSessionFactory().openSession();

        String idNguoiDung = req.getParameter("userId");

        String queryNguoiDung = "FROM NguoiDungEntity AS nguoiDung " +
                "WHERE nguoiDung.idKhachHang = :idNguoiDung";
        NguoiDungEntity nguoiDung = (NguoiDungEntity) session.createQuery(queryNguoiDung)
                .setParameter("idNguoiDung", Integer.parseInt(idNguoiDung))
                .uniqueResult();
        session.close();

        NguoiDungEntityManager nguoiDungEntityManager = new NguoiDungEntityManager();
        nguoiDungEntityManager.delete(nguoiDung);

        resp.sendRedirect("userManagement.jsp");
    }
}
