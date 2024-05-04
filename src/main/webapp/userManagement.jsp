<%@ page import="com.example.demo.model.NguoiDungEntity" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.demo.model.HoaDonEntity" %>
<!DOCTYPE html>
<html lang="en">

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="icon" href="img/app/weblogo.png" />

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;700&display=swap" rel="stylesheet"/>
    
    <link rel="stylesheet" href="css/style.css"/>
    <link rel="stylesheet" href="css/header.css"/>
    <link rel="stylesheet" href="css/footer.css"/>
    <link rel="stylesheet" href="css/homeCss/section.css"/>
    <link rel="stylesheet" href="css/managerPageCss/userManagement.css"/>
    <link rel="stylesheet" href="css/managerPageCss/menuManagement.css"/>
    <link rel="stylesheet" href="css/managerPageCss/changeUser.css"/>
    <link rel="stylesheet" href="css/managerPageCss/deleteUser.css"/>
    <link rel="stylesheet" href="css/managerPageCss/addUser.css"/>


    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>


    <title>DeadlineRestaurant</title>
</head>
<body>
    <header class="header">
        <a href="${pageContext.request.contextPath}/managerIndex.jsp">
            <img class="logo" alt="Logo nha hang" src="img/app/deadlineRestaurant_logo.jpg"/>
        </a>
        <nav class="main-nav">
            <ul class="main-nav-list">
                <li><a class="main-nav-link" href="#">Thực đơn</a></li>
                <li><a class="main-nav-link" href="#">Địa chỉ</a></li>
                <li><a class="main-nav-link" href="#">Liên hệ</a></li>
                <li><a class="main-nav-link nav-cta" href="${pageContext.request.contextPath}/userManagement.jsp">Quản lý người dùng</a></li>
                <li><a class="main-nav-link nav-cta" href="${pageContext.request.contextPath}/menuManagement.jsp">Quản lý thực đơn</a></li>
            </ul>
        </nav>

        <button class="btn-mobile-nav">
            <ion-icon class="icon-mobile-nav" name="menu-outline"></ion-icon>
            <ion-icon class="icon-mobile-nav" name="close-outline"></ion-icon>
        </button>
    </header>

    <main>
        <section class="section-Customer-Menu-Form">
            <div class="container">
                <div class="Menu-form">
                    <div class="heading-container">
                        <h2 class="heading-secondary">Danh sách người dùng</h2>
                    </div>

                    <div class="Menu-form-text-box">
                        <form action="#" id="Menu-form-info" class="Menu-form-info">   

                            
                            <div class="search-bar">
                                <form action="">
                                    <input class="search-bar-input" type="text" placeholder="Nhập tên người dùng bạn đang tìm">
                                    <button class="search-bar-button" type="submit">Tìm</button>
                                </form>
                            </div>
                            
                            <div class="heading-button-list">
                                <button id="addUser" class="btn btn--form">Thêm người dùng</button>
                                <button id="changeUser" class="btn btn--form">Chỉnh sửa người dùng</button>
                                <button id="deleteUser" class="btn btn--form">Xóa người dùng</button>
                            </div>

                            <% ArrayList<NguoiDungEntity> danhSachNguoiDung;
                                danhSachNguoiDung = (ArrayList<NguoiDungEntity>) request.getSession().getAttribute("danhSachNguoiDung");
                                for (NguoiDungEntity nguoiDung : danhSachNguoiDung){%>
                            <a id="show-user-detail-<%=nguoiDung.getIdKhachHang()%>"
                               class="wrapper"
                               data-user-id="<%= nguoiDung.getIdKhachHang()%>">

                                <input type="hidden" id="idNguoiDung-Change-<%= nguoiDung.getIdKhachHang()%>" value="<%= nguoiDung.getIdKhachHang()%>">
                                <input type="hidden" id="Email-Change-<%= nguoiDung.getIdKhachHang()%>" value="<%= nguoiDung.getEmail()%>">
                                <input type="hidden" id="MatKhau-Change-<%= nguoiDung.getIdKhachHang()%>" value="<%= nguoiDung.getMatKhau()%>">
                                <input type="hidden" id="SoDienThoai-Change-<%= nguoiDung.getIdKhachHang()%>" value="<%= nguoiDung.getSoDienThoai()%>">
                                <input type="hidden" id="HoVaTen-Change-<%= nguoiDung.getIdKhachHang()%>" value="<%= nguoiDung.getHoVaTen()%>">
                                <input type="hidden" id="GioiTinh-Change-<%= nguoiDung.getIdKhachHang()%>" value="<%= nguoiDung.getGioiTinh()%>">
                                <input type="hidden" id="DiaChi-Change-<%= nguoiDung.getIdKhachHang()%>" value="<%= nguoiDung.getDiaChi()%>">
                                <input type="hidden" id="PhanQuyen-Change-<%= nguoiDung.getIdKhachHang()%>" value="<%= nguoiDung.getPhanQuyen()%>">
                                <input type="hidden" id="AvtKhachHang-Change-<%= nguoiDung.getIdKhachHang()%>" value="<%= nguoiDung.getAvtKhachHang()%>">

                                <div class="wrapper-pic-box">
                                    <img class="wrapper-pic-item" src="<%= nguoiDung.getAvtKhachHang()%>">
                                </div>
                                <div class="wrapper-info">
                                    <div class="wrapper-info-padding">
                                        <div class="wrapper-info-name">
                                            <span>Tên người dùng:</span>
                                            <%= nguoiDung.getHoVaTen()%>
                                        </div>
                                    </div>
                                    <div class="wrapper-info-price wrapper-info-padding">
                                        <span>ID:</span>
                                        <%= nguoiDung.getIdKhachHang()%>
                                    </div>

                                    <div class="wrapper-info-price wrapper-info-padding">
                                        <span>Phân quyền:</span>
                                        <%= nguoiDung.getPhanQuyen()%>
                                    </div>
                                </div>
                            </a>
                            <%}%>
                            
                        </form>
                    </div>


                </div>
            </div>

        </section>

        <modal class="addUser_modal_overlay">
            <div class="addUser_modal_body">
                <ion-icon class="addUser-close-icon" name="close-outline"></ion-icon>
                <div class="addUser-from">
                    <h2 class="addUser-form-heading">Thêm người dùng</h2>
                    <form method="POST" action="${pageContext.request.contextPath}/addUserServlet" enctype="multipart/form-data">
                    <div class="addUser-content">
                        <div class="addUser-left-content">
                            <div class="addUser-input-form">
                                <div class="input-label">Email: </div>
                                <div class="wrapper-input">
                                    <input name="email_input" type="email" placeholder="Nhập email" required>
                                </div>
                            </div>
        
                            <div class="addUser-input-form">
                                <div class="input-label">Mật khẩu: </div>
                                <div class="wrapper-input">
                                    <input name="password_input" type="password" placeholder="Nhập mật khẩu" required>
                                </div>
                            </div>
        
                            <div class="addUser-input-form">
                                <div class="input-label">Địa chỉ: </div>
                                <div class="wrapper-input">
                                    <input name="address_input" type="text" placeholder="Nhập địa chỉ" required>
                                </div>
                            </div>
        
                            <div class="addUser-input-form">
                                <div class="input-label">SĐT: </div>
                                <div class="wrapper-input">
                                    <input name="Number_input" type="tel" placeholder="Nhập số điện thoại" required>
                                </div>
                            </div>

                            <div class="addUser-input-form">
                                <div class="input-label">Họ tên: </div>
                                <div class="wrapper-input">
                                    <input name="name_input" placeholder="Nhập tên" required>
                                </div>
                            </div>

                        </div>

                        <div class="addUser-right-content">
                            <div>
                                <div class="input-label">Hình ảnh: </div>
                                <div class="custom-file-input">
                                    <input id="img-file" type="file" class="file-input" name="AvtKhachHang">
                                    <label for="img-file" class="file-label">Chọn ảnh mới</label>
                                </div>
                            </div>

                            <div class="addUser-input-form">
                                <div class="input-label">Giới tính: </div>
                                <div class="wrapper-input">
                                    <select name="Gender_input" id="Gender-input" required>
                                        <option value="">Hãy chọn giới tính của bạn:</option>
                                        <option id="Nam" value="Nam">Nam</option>
                                        <option id="Nu" value="Nu">Nữ</option>
                                    </select> 
                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="button-list">
                        <button id="addUser-close-button" class="btn btn--form" type="button">hủy</button>
                        <button type="submit" class="btn btn--form">Đồng ý</button>
                    </div>
                    </form>

                </div>
            </div>
        </modal>

        <modal class="changeUser_modal_overlay">
            <div class="changeUser_modal_body">
                <ion-icon class="changeUser-close-icon" name="close-outline"></ion-icon>
                <div class="changeUser-from">
                    <h2 class="changeUser-form-heading">Chỉnh Sửa Người dùng</h2>
                    <form method="POST" action="${pageContext.request.contextPath}/updateUserServletForAdminPage" enctype="multipart/form-data">
                    <input type="hidden" id="user-id" name="user-id" value="">
                    <input type="hidden" id="PhanQuyen" name="PhanQuyen" value="">
                    <div class="changeUser-content">
                        <div class="changeUser-left-content">
                            <div class="changeUser-input-form">
                                <div class="input-label">Email: </div>
                                <div class="wrapper-input">
                                    <label id="email-input"></label>

                                    <button class="btn btn--form"
                                            type="button"
                                            onclick="changeContent('email-input', this)">
                                        Thay đổi
                                    </button>
                                    <!-- Button xác nhận, mặc định là ẩn -->
                                    <button class="btn btn--form"
                                            type="submit"
                                            style="display: none;"
                                            id="email-input-confirm-button">
                                        Xác nhận
                                    </button>
                                </div>
                            </div>

                            <div class="changeUser-input-form">
                                <div class="input-label">Mật khẩu: </div>
                                <div class="wrapper-input">
                                    <label id="password-input"></label>

                                    <button class="btn btn--form"
                                            type="button"
                                            onclick="changeContent('password-input', this)">
                                        Thay đổi
                                    </button>
                                    <!-- Button xác nhận, mặc định là ẩn -->
                                    <button class="btn btn--form"
                                            type="submit"
                                            style="display: none;"
                                            id="password-input-confirm-button">
                                        Xác nhận
                                    </button>
                                </div>
                            </div>

                            <div class="changeUser-input-form">
                                <div class="input-label">Địa chỉ: </div>
                                <div class="wrapper-input">
                                    <label id="address_input"></label>

                                    <button class="btn btn--form"
                                            type="button"
                                            onclick="changeContent('address_input', this)">
                                        Thay đổi
                                    </button>
                                    <!-- Button xác nhận, mặc định là ẩn -->
                                    <button class="btn btn--form"
                                            type="submit"
                                            style="display: none;"
                                            id="address_input-confirm-button">
                                        Xác nhận
                                    </button>
                                </div>
                            </div>

                            <div class="changeUser-input-form">
                                <div class="input-label">SĐT: </div>
                                <div class="wrapper-input">
                                    <label id="tel_input"></label>

                                    <button class="btn btn--form"
                                            type="button"
                                            onclick="changeContent('tel_input', this)">
                                        Thay đổi
                                    </button>
                                    <!-- Button xác nhận, mặc định là ẩn -->
                                    <button class="btn btn--form"
                                            type="submit"
                                            style="display: none;"
                                            id="tel_input-confirm-button">
                                        Xác nhận
                                    </button>
                                </div>
                            </div>

                            <div class="changeUser-input-form">
                                <div class="input-label">Tên: </div>
                                <div class="wrapper-input">
                                    <label id="name_input"></label>

                                    <button class="btn btn--form"
                                            type="button"
                                            onclick="changeContent('name_input', this)">
                                        Thay đổi
                                    </button>
                                    <!-- Button xác nhận, mặc định là ẩn -->
                                    <button class="btn btn--form"
                                            type="submit"
                                            style="display: none;"
                                            id="name_input-confirm-button">
                                        Xác nhận
                                    </button>
                                </div>
                            </div>

                        </div>

                        <div class="changeUser-right-content">
                            <div>
                                <div class="input-label">Hình ảnh: </div>
                                <img class="food-pic" src="" alt="">
                            </div>

                            <div class="custom-file-input">
                                <input type="file" class="file-input" name="AvtKhachHang">
                                <label for="img-file" class="file-label">Chọn ảnh mới</label>
                            </div>

                            <div class="changeUser-input-form">
                                <div class="input-label">Giới tính: </div>
                                <div class="wrapper-input">
                                    <div class="wrapper-input">
                                        <label id="GenderSelect" name="GenderSelect">Nam</label>
                                        <button type="button" class="btn btn--form" onclick="replaceWithSelect('GenderSelect')">Thay đổi</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="button-list">
                        <button id="changeUser-close-button" class="btn btn--form" type="button">hủy</button>
                        <button class="btn btn--form" type="submit">Đồng ý</button>
                    </div>
                    </form>

                </div>
            </div>
        </modal>

<%--        Lí do mà trong những câu lệnh này đặt tên là food thay vì user--%>
<%--        Do vận dụng lại code mà quên thay đổi, thành ra bên JS nhìn ngộ luôn--%>
        <modal class="deleteUser_modal_overlay">
            <div class="modal_body">
                <ion-icon class="deleteUser-close-icon" name="close-outline"></ion-icon>
                <div class="deleteUser-from">
                    <h2 class="deleteUser-form-heading">Bạn có muốn xóa người dùng này không?</h2>
                    <form method="POST" action="${pageContext.request.contextPath}/deleteUserServlet">
                        <div class="foodName">
                            <span></span>
                        </div>
                        <div class="deleteUser-from-content">
                            <div class="foodPic">
                                <img class="foodPic-item" src="" alt="">
                            </div>
                            <div class="food-info">
                                <div class="foodDescription">
                                    <span></span>
                                </div>
                            </div>
                        </div>

                        <input type="hidden" id="userId" name="userId" value="">
                        <div class="button-list">
                            <button id="deleteUser-close-button" class="btn btn--form" type="button">hủy</button>
                            <button class="btn btn--form" type="submit">Đồng ý</button>
                        </div>
                    </form>
                </div>
            </div>
        </modal>

    </main>

    <footer class="footer">
        <div class="container grid grid--5-cols">
            <div class="logo-col">
                <a href="#" class="footer-logo">
                    <img class="logo" alt="Logo nha hang" src="img/app/deadlineRestaurant_logo.jpg"/>
                </a>

                <ul class="social-links">
                    <li><a href="#">
                        <ion-icon class="social-icon" name="logo-instagram"></ion-icon>
                    </a></li>

                    <li><a href="#">
                        <ion-icon class="social-icon" name="logo-facebook"></ion-icon>
                    </a></li>

                    <li><a href="#">
                        <ion-icon class="social-icon" name="logo-twitter"></ion-icon>
                    </a></li>
                </ul>

                <p class="copyright">Copyright &copy; 2024 by Deadline Restaurant, Inc. All rights reserved</p>
            </div>

            <div class="address-col">
                <p class="footer-heading">Liên hệ với chúng tôi</p>
                <address class="contacts">
                    <p class="address">688/91 Quang Trung, Gò vấp, Phường 11</p>
                    <p>
                        <a class="footer-link" href="tel:0359256696">035-925-6696</a><br>
                        <a class="footer-link" href="mailto:nguyenhuutrong11133@gmail.com">nguyenhuutrong11133@gmail.com</a>
                    </p>
                </address>
            </div>

            <div class="nav-col">
                <p class="footer-heading">Tài khoản</p>
                <ul class="footer-nav">
                    <li><a class="footer-link" href="#">Đăng nhập</a></li>
                    <li><a class="footer-link" href="#">Đăng ký</a></li>
                </ul>
            </div>

            <div class="nav-col">
                <p class="footer-heading">Trang web</p>
                <ul class="footer-nav">
                    <li><a class="footer-link" href="#">Về trang web</a></li>
                    <li><a class="footer-link" href="#">Thương hiệu hợp tác</a></li>
                    <li><a class="footer-link" href="#">Hội viên</a></li>
                </ul>
            </div>

            <div class="nav-col">
                <p class="footer-heading">Trợ giúp</p>
                <ul class="footer-nav">
                    <li><a class="footer-link" href="">Hướng dẫn (đang cập nhật)</a></li>
                    <li><a class="footer-link" href="#">Trung tâm trợ giúp</a></li>
                    <li><a class="footer-link" href="#">Điều khoản & dịch vụ</a></li>
                </ul>
            </div>
        </div>
    </footer>
    
    <script src="js/userManagerPage.js"></script>

    </body>
</html>