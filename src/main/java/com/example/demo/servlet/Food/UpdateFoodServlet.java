package com.example.demo.servlet.Food;

import com.example.demo.dao.HibernateUtils;
import com.example.demo.dao.MonAnEnityManager;
import com.example.demo.model.MonAnEntity;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import org.hibernate.Session;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;

@MultipartConfig
@WebServlet(name = "updateFoodServlet", value = "/updateFoodServlet")
public class UpdateFoodServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Session session = HibernateUtils.getSessionFactory().openSession();

        String idMonAn = req.getParameter("foodId");

        // Lấy ảnh từ request
        Part filePart = req.getPart("AvtMonAn");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

        // Thay đổi đường dẫn lưu ảnh tùy thuộc vào cấu hình máy chủ của bạn
        String uploadDirectoryIntoDatabase = "img/mealAvt";
        String uploadDirectoryIntoServer = "C:\\Users\\ADMIN\\OneDrive\\Desktop\\DeadlineRestaurat\\src\\main\\webapp\\img\\mealAvt";

        String savePathIntoDatabase = uploadDirectoryIntoDatabase + "/" + fileName;
        String savePathIntoServer = uploadDirectoryIntoServer + File.separator + fileName;
        InputStream inputStream = filePart.getInputStream();
        try {
            Files.copy(inputStream, Paths.get(savePathIntoServer));
            System.out.println("da luu anh: " + savePathIntoServer);
        } catch (IOException e) {
            System.err.println("chua luu anh: " + e.getMessage());
            e.printStackTrace();
        }

        String queryMonAn = "FROM MonAnEntity AS monAn " +
                "WHERE monAn.idMonAn = :idMonAn";
        MonAnEntity monAn = (MonAnEntity) session.createQuery(queryMonAn)
                .setParameter("idMonAn", Integer.parseInt(idMonAn))
                .uniqueResult();
        session.close();

        String TenMon =
                (req.getParameter("address-text-foodname") == null) ?
                        monAn.getTenMon() :
                        req.getParameter("address-text-foodname");

        String MieuTa =
                (req.getParameter("address-text-fooddesc") == null) ?
                        monAn.getMieuTa() :
                        req.getParameter("address-text-fooddesc");

        long GiaTien =
                (req.getParameter("address-text-price") == null) ?
                        monAn.getGiaTien() :
                        Long.parseLong(req.getParameter("address-text-price"));

        String DiaChi =
                (req.getParameter("address-text") == null) ?
                        monAn.getDiaChi() :
                        req.getParameter("address-text");

        monAn.setTenMon(TenMon);
        monAn.setMieuTa(MieuTa);
        monAn.setGiaTien(GiaTien);
        monAn.setDiaChi(DiaChi);

        if (savePathIntoDatabase.equals("img/mealAvt/"))
            monAn.setHinhAnh(monAn.getHinhAnh());
        else
            monAn.setHinhAnh(savePathIntoDatabase);

        MonAnEnityManager monAnEnityManager = new MonAnEnityManager();
        monAnEnityManager.update(monAn);

        resp.sendRedirect("menuManagement.jsp");
    }
}
