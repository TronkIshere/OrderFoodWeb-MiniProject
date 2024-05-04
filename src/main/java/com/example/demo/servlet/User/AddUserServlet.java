package com.example.demo.servlet.User;

import com.example.demo.dao.NguoiDungEntityManager;
import com.example.demo.model.NguoiDungEntity;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;

@MultipartConfig
@WebServlet(name = "addUserServlet", value = "/addUserServlet")
public class AddUserServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email_input");
        String password = req.getParameter("password_input");
        String address = req.getParameter("address_input");
        String tel = req.getParameter("Number_input");
        String gender = req.getParameter("Gender_input");
        String name = req.getParameter("name_input");

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
            e.printStackTrace();
        }

        NguoiDungEntity nguoiDung = new NguoiDungEntity();
        nguoiDung.setEmail(email);
        nguoiDung.setMatKhau(password);
        nguoiDung.setSoDienThoai(Long.valueOf(tel));
        nguoiDung.setHoVaTen(name);
        nguoiDung.setGioiTinh(gender);
        nguoiDung.setDiaChi(address);
        nguoiDung.setPhanQuyen(2);
        nguoiDung.setAvtKhachHang(savePathIntoDatabase);

        NguoiDungEntityManager nguoiDungEntityManager = new NguoiDungEntityManager();
        nguoiDungEntityManager.insert(nguoiDung);

        resp.sendRedirect("userManagement.jsp");
    }
}
