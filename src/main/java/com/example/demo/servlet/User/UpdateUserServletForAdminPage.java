package com.example.demo.servlet.User;

import com.example.demo.dao.HibernateUtils;
import com.example.demo.dao.NguoiDungEntityManager;
import com.example.demo.model.MonAnEntity;
import com.example.demo.model.NguoiDungEntity;
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
@WebServlet(name = "updateUserServletForAdminPage", value = "/updateUserServletForAdminPage")
public class UpdateUserServletForAdminPage extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Session session = HibernateUtils.getSessionFactory().openSession();

        String idKhachHang = req.getParameter("user-id");

        // Lấy ảnh từ request
        Part filePart = req.getPart("AvtKhachHang");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

        // Thay đổi đường dẫn lưu ảnh tùy thuộc vào cấu hình máy chủ của bạn
        String uploadDirectoryIntoDatabase = "img/customersAvt";
        String uploadDirectoryIntoServer = "C:\\Users\\ADMIN\\OneDrive\\Desktop\\DeadlineRestaurat\\src\\main\\webapp\\img\\customersAvt";

        String savePathIntoDatabase = uploadDirectoryIntoDatabase + "/" + fileName;
        String savePathIntoServer = uploadDirectoryIntoServer + File.separator + fileName;
        InputStream inputStream = filePart.getInputStream();
        try {
            Files.copy(inputStream, Paths.get(savePathIntoServer));
            System.out.println("da luu anh: " + savePathIntoServer);
        } catch (IOException e) {
            System.err.println("chua luu anh: " + e.getMessage());
        }

        String queryNguoiDung = "FROM NguoiDungEntity AS nguoiDung " +
                "WHERE nguoiDung.idKhachHang = :idKhachHang";
        NguoiDungEntity nguoiDung = (NguoiDungEntity) session.createQuery(queryNguoiDung)
                .setParameter("idKhachHang", Integer.parseInt(idKhachHang))
                .uniqueResult();
        session.close();

        String Email =
                (req.getParameter("email-iput") == null) ?
                        nguoiDung.getEmail() :
                        req.getParameter("email-iput");

        System.out.println("Email: " + Email);

        String MatKhau =
                (req.getParameter("password-input") == null) ?
                        nguoiDung.getMatKhau() :
                        req.getParameter("password-input");

        System.out.println("Mat khau: " + MatKhau);

        String telInput = req.getParameter("tel_input");
        Long SoDienThoai = (telInput == null || telInput.isEmpty()) ?
                nguoiDung.getSoDienThoai() :
                Long.valueOf(telInput);

        System.out.println("SoDienThoai: " + SoDienThoai);

        String HoVaTen =
                (req.getParameter("name_input") == null) ?
                        nguoiDung.getHoVaTen() :
                        req.getParameter("name_input");

        System.out.println("Ho va ten: " + HoVaTen);

        String GioiTinh =
                (req.getParameter("GenderSelect") == null) ?
                        nguoiDung.getGioiTinh() :
                        req.getParameter("GenderSelect");

        System.out.println("GioiTinh: " + GioiTinh);

        String DiaChi =
                (req.getParameter("address_input") == null) ?
                        nguoiDung.getDiaChi() :
                        req.getParameter("address_input");

        System.out.println("Dia chi: " + DiaChi);

        String phanQuyen = req.getParameter("PhanQuyen");
        Long PhanQuyen = (phanQuyen == null || phanQuyen.isEmpty()) ?
                nguoiDung.getPhanQuyen() :
                Long.valueOf(phanQuyen);

        System.out.println("Phan quyen: " + PhanQuyen);

        if (savePathIntoDatabase.equals("img/customersAvt/"))
            nguoiDung.setAvtKhachHang(nguoiDung.getAvtKhachHang());
        else
            nguoiDung.setAvtKhachHang(savePathIntoDatabase);

        System.out.println("Avt: " + nguoiDung.getAvtKhachHang());

        nguoiDung.setEmail(Email);
        nguoiDung.setMatKhau(MatKhau);
        nguoiDung.setSoDienThoai(SoDienThoai);
        nguoiDung.setHoVaTen(HoVaTen);
        nguoiDung.setGioiTinh(GioiTinh);
        nguoiDung.setDiaChi(DiaChi);
        nguoiDung.setPhanQuyen(PhanQuyen);

        NguoiDungEntityManager nguoiDungEntityManager = new NguoiDungEntityManager();
        nguoiDungEntityManager.update(nguoiDung);

        resp.sendRedirect("userManagement.jsp");
    }
}
