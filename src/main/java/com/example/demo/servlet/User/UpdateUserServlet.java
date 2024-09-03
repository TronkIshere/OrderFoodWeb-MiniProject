package com.example.demo.servlet.User;

import com.example.demo.model.NguoiDungEntity;
import com.example.demo.dao.NguoiDungEntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import jakarta.validation.constraints.Null;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;

@MultipartConfig
@WebServlet(name = "updateUserServlet", value = "/updateUserServlet")
public class UpdateUserServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        NguoiDungEntity nguoiDung = (NguoiDungEntity) session.getAttribute("user");

        Long idNguoiDung = nguoiDung.getIdKhachHang();

        String Email =
                (req.getParameter("Email") == null) ?
                        nguoiDung.getEmail() :
                        req.getParameter("Email");

        String MatKhau =
                (req.getParameter("MatKhau") == null) ?
                        nguoiDung.getMatKhau() :
                        req.getParameter("MatKhau");

        Long SoDienThoai =
                (req.getParameter("SoDienThoai") == null) ?
                        nguoiDung.getSoDienThoai() :
                        Long.valueOf(req.getParameter("SoDienThoai"));

        String HoVaTen = (req.getParameter("HoVaTen") == null) ?
                nguoiDung.getHoVaTen() :
                req.getParameter("HoVaTen");

        String GioiTinh =
                (req.getParameter("GioiTinh") == null) ?
                        nguoiDung.getGioiTinh() :
                        req.getParameter("GioiTinh");

        String DiaChi =
                (req.getParameter("DiaChi") == null) ?
                        nguoiDung.getDiaChi() :
                        req.getParameter("DiaChi");

        // Lấy ảnh từ request
        Part filePart = req.getPart("AvtKhachHang");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

        // Thay đổi đường dẫn lưu ảnh tùy thuộc vào cấu hình máy chủ của bạn
        String uploadDirectoryIntoDatabase = "img/customersAvt";
        String uploadDirectoryIntoServer = "D:\\MiniProject\\\\DeadlineRestaurat\\src\\main\\webapp\\img\\customersAvt";

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


        System.out.println("Email: " + Email);
        System.out.println("Mat Khau: " + MatKhau);
        System.out.println("So dien thoai: " + SoDienThoai);
        System.out.println("Ho va Ten: " + HoVaTen);
        System.out.println("Gioi tinh: " + GioiTinh);
        System.out.println("Dia chi: " + DiaChi);
        System.out.println("Avt: " + savePathIntoDatabase);

        nguoiDung.setIdKhachHang(nguoiDung.getIdKhachHang());
        nguoiDung.setEmail(Email);
        nguoiDung.setMatKhau(MatKhau);
        nguoiDung.setSoDienThoai(SoDienThoai);
        nguoiDung.setHoVaTen(HoVaTen);
        nguoiDung.setGioiTinh(GioiTinh);
        nguoiDung.setDiaChi(DiaChi);

        if (savePathIntoDatabase.equals("img/customersAvt/"))
            nguoiDung.setAvtKhachHang(nguoiDung.getAvtKhachHang());
        else
            nguoiDung.setAvtKhachHang(savePathIntoDatabase);

        NguoiDungEntityManager nguoiDungEntityManager = new NguoiDungEntityManager();
        nguoiDungEntityManager.update(nguoiDung);

        HttpSession httpSession = req.getSession();
        httpSession.setAttribute("user", nguoiDung);
        resp.sendRedirect("customerInfomationPage.jsp");

    }
}
