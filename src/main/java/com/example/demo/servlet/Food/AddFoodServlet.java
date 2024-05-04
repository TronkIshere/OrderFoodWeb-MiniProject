package com.example.demo.servlet.Food;

import com.example.demo.dao.MonAnEnityManager;
import com.example.demo.model.MonAnEntity;
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
@WebServlet(name = "addFoodServlet", value = "/addFoodServlet")
public class AddFoodServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name_input");
        String description = req.getParameter("description_input");
        String money = req.getParameter("money_input");
        String address = req.getParameter("address_input");

        // Lấy ảnh từ request
        Part filePart = req.getPart("AvtMonAn");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

        // Thay đổi đường dẫn lưu ảnh tùy thuộc vào cấu hình máy chủ của bạn
        String uploadDirectoryIntoDatabase = "img/mealfoodsAvt";
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

        MonAnEntity monAn = new MonAnEntity();
        monAn.setTenMon(name);
        monAn.setMieuTa(description);
        monAn.setGiaTien(Long.parseLong(money));
        monAn.setDiaChi(address);
        monAn.setHinhAnh(savePathIntoDatabase);

        MonAnEnityManager monAnEnityManager = new MonAnEnityManager();
        monAnEnityManager.insert(monAn);

        resp.sendRedirect("menuManagement.jsp");
    }

}
