package com.example.demo.servlet.Food;

import com.example.demo.dao.HibernateUtils;
import com.example.demo.dao.MonAnEnityManager;
import com.example.demo.dao.NguoiDungEntityManager;
import com.example.demo.model.MonAnEntity;
import com.example.demo.model.NguoiDungEntity;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.io.IOException;

@WebServlet(name = "deleteFoodServlet", value = "/deleteFoodServlet")
public class DeleteFoodServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Session session = HibernateUtils.getSessionFactory().openSession();

        String idMonAn = req.getParameter("foodId");

        String queryMonAn = "FROM MonAnEntity AS monAn " +
                "WHERE monAn.idMonAn = :idMonAn";
        MonAnEntity monAn = (MonAnEntity) session.createQuery(queryMonAn)
                .setParameter("idMonAn", Integer.parseInt(idMonAn))
                .uniqueResult();
        session.close();

        MonAnEnityManager monAnEnityManager = new MonAnEnityManager();
        monAnEnityManager.delete(monAn);

        resp.sendRedirect("menuManagement.jsp");
    }
}
