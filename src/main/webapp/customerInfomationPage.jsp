<%@ page import="com.example.demo.model.HoaDonEntity" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.demo.dao.HoaDonEnityManager" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Collection" %>

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
    <link rel="stylesheet" href="css/customerPageCss/informationForm.css"/>

    <script defer src="js/script.js"></script>

    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>


    <title>DeadlineRestaurant</title>
</head>
<body>
    <header class="header">
        <a href="${pageContext.request.contextPath}/customerIndex.jsp">
            <img class="logo" alt="Logo nha hang" src="img/app/deadlineRestaurant_logo.jpg"/>
        </a>
        <nav class="main-nav">
            <ul class="main-nav-list">
                <li><a class="main-nav-link" href="#">Thực đơn</a></li>
                <li><a class="main-nav-link" href="#">Địa chỉ</a></li>
                <li><a class="main-nav-link" href="#">Liên hệ</a></li>
                <li><a class="main-nav-link nav-cta" href="${pageContext.request.contextPath}/customerInfomationPage.jsp">Tài khoản</a></li>
                <li><a class="main-nav-link nav-cta" href="${pageContext.request.contextPath}/menuPage.jsp">Đặt món</a></li>
                <li><a class="main-nav-link nav-cta" href="${pageContext.request.contextPath}/paymentOrderPage.jsp">Giỏ hàng</a></li>
            </ul>
        </nav>

        <button class="btn-mobile-nav">
            <ion-icon class="icon-mobile-nav" name="menu-outline"></ion-icon>
            <ion-icon class="icon-mobile-nav" name="close-outline"></ion-icon>
        </button>
    </header>

    <main>
        <section class="section-Customer-Information-Form">
            <div class="container">
                <form method="POST"
                      action="${pageContext.request.contextPath}/updateUserServlet"
                      id="Information-form-info"
                      class="Information-form-info"
                      onsubmit="return validateForm()"
                      enctype="multipart/form-data">
                <div class="Information-form">
                    <div class="heading-container">
                        <h2 class="heading-secondary">Thông tin cá nhân của bạn</h2>
                    </div>
                    <div class="Information-form-text-box">
                            <div>
                                <label name="HoVaTen" for="HoVaTen">Họ tên: </label>
                                <div class="wrapper">
                                    <label id="HoVaTen">${user.hoVaTen}</label>
                                    <button class="btn btn--form"
                                            onclick="changeContent('HoVaTen', this);">
                                        Thay đổi
                                    </button>
                                    <!-- Button xác nhận, mặc định là ẩn -->
                                    <button class="btn btn--form"
                                            type="submit"
                                            id="HoVaTen-confirm-button"
                                            style="display: none;">
                                        Xác nhận
                                    </button>
                                </div>

                            </div>

                            <div>
                                <label for="GioiTinh">Giới tính: </label>
                                <div class="wrapper">
                                    <label name="GioiTinh" id="GioiTinh">${user.gioiTinh}</label>
                                    <button class="btn btn--form"
                                            onclick="changeContent('GioiTinh', this);">
                                        Thay đổi
                                    </button>
                                    <!-- Button xác nhận, mặc định là ẩn -->
                                    <button class="btn btn--form"
                                            type="submit"
                                            id="GioiTinh-confirm-button"
                                            style="display: none;">
                                        Xác nhận
                                    </button>
                                </div>
                            </div>

                            <div>
                                <label name="DiaChi" for="DiaChi">Địa chỉ: </label>
                                <div class="wrapper">
                                    <label id="DiaChi">${user.diaChi}</label>
                                    <button class="btn btn--form"
                                            onclick="changeContent('DiaChi', this);">
                                        Thay đổi
                                    </button>
                                    <!-- Button xác nhận, mặc định là ẩn -->
                                    <button class="btn btn--form"
                                            type="submit"
                                            id="DiaChi-confirm-button"
                                            style="display: none;">
                                        Xác nhận
                                    </button>
                                </div>
                            </div>

                            <div>
                                <label name="SoDienThoai" for="SoDienThoai">Số điện thoại: </label>
                                <div class="wrapper">
                                    <label name="SoDienThoai" id="SoDienThoai">${user.soDienThoai}</label>
                                    <button class="btn btn--form"
                                            onclick="changeContent('SoDienThoai', this);">
                                        Thay đổi
                                    </button>
                                    <!-- Button xác nhận, mặc định là ẩn -->
                                    <button class="btn btn--form"
                                            type="submit"
                                            id="SoDienThoai-confirm-button"
                                            style="display: none;">
                                        Xác nhận
                                    </button>
                                </div>
                            </div>

                            <div>
                                <label name="Email" for="Email">Email: </label>
                                <div class="wrapper">
                                    <label id="Email">${user.email}</label>
                                    <button class="btn btn--form"
                                            onclick="changeContent('Email', this);">
                                        Thay đổi
                                    </button>
                                    <!-- Button xác nhận, mặc định là ẩn -->
                                    <button class="btn btn--form img-confirm-button"
                                            type="submit"
                                            id="Email-confirm-button"
                                            style="display: none;">
                                        Xác nhận
                                    </button>
                                </div>
                            </div>

                            <div>
                                <label name="MatKhau" for="MatKhau">Mật khẩu: </label>
                                <div class="wrapper">
                                    <label id="MatKhau">${user.matKhau}</label>
                                    <button class="btn btn--form"
                                            onclick="changeContent('MatKhau', this);">
                                        Thay đổi
                                    </button>
                                    <!-- Button xác nhận, mặc định là ẩn -->
                                    <button class="btn btn--form"
                                            type="submit"
                                            id="MatKhau-confirm-button"
                                            style="display: none;">
                                        Xác nhận
                                    </button>
                                </div>
                            </div>
                            <!-- <button class="btn btn--form">Đăng ký ngay</button> -->
                    </div>

                    <div class="Information-form-pic">
                        <div class="Information-form-list">
                            <div class="heading-img-text">Ảnh đại diện</div>
                            <img id="AvtKhachHang" class="Information-form-img-box" src="${user.avtKhachHang}">

                            <div class="custom-file-input">
                                <input id="img-file" type="file" class="file-input" name="AvtKhachHang">
                                <label for="img-file" class="file-label">Chọn ảnh mới</label>
                            </div>
                            <!-- Button xác nhận, mặc định là ẩn -->
                            <button class="btn btn--form"
                                    type="submit"
                                    id="img-file-confirm-button"
                                    style="
                                    display: none;
                                    width: 50%;
                                    align-self: center;">
                                Xác nhận
                            </button>
                        </div>

<%--                    Chả hiểu sao chỗ nào buộc phải có 2 form nó mới chạy được
                        Cần xem để biết đường khắc phục và không mắc lỗi tương tự--%>
                        <div class="Information-form-button">
                            <form id="logoutForm"
                                  method="POST"
                                  action="${pageContext.request.contextPath}/logout">
                                <button class="btn btn--form"
                                        style="display: none;">
                                    Xác nhận
                                </button>
                            </form>
                        </div>

                        <div class="Information-form-button">
                            <form id="logoutForm_2"
                                  method="POST"
                                  action="${pageContext.request.contextPath}/logout">
                                <button id="DangXuat_2"
                                        class="btn btn--form"
                                        type="submit"
                                        style="display: block">
                                    Đăng xuất
                                </button>
                            </form>
                        </div>

                    </div>

                    <div class="Information-form-history">
                        <div class="history-text-form">
                            <div class="heading-history">
                                Lịch sử đặt món:
                            </div>

                            <div class="history-list">
                                <%
                                    int count = 0;
                                    ArrayList<HoaDonEntity> danhSachHoaDon =
                                            (ArrayList<HoaDonEntity>) request.getSession().getAttribute("danhSachHoaDon");
                                    if (danhSachHoaDon != null && !danhSachHoaDon.isEmpty()) {
                                        for (HoaDonEntity donHang : danhSachHoaDon) {
                                            count++;
                                %>
                                <div class="history-list-item">
                                    <img src="img/meals/gaChien.webp" alt="">
                                    <div class="history-list-item-text">
                                        <div>Ngày đặt hàng: <%= donHang.getNgayDatHang() %></div>
                                        <div>Tổng hóa đơn: <%= donHang.getTongSoTien() %></div>
                                    </div>
                                </div>
                                <%
                                        if (count == 5) break;
                                    }
                                } else {
                                %>
                                <p>Không có đơn hàng nào.</p>
                                <% } %>

                            </div>

                            <div class="show-all-history">
                                <a class="change-img-text" href="customerBoughtHistory.jsp">xem tất cả</a>
                            </div>

                        </div>
                    </div>

                </div>
                </form>

            </div>
        </section>
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

    <script src="js/customerInfomationPage.js"></script>

    </body>
</html>