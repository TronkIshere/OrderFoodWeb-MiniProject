<%@ page import="com.example.demo.model.HoaDonEntity" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.demo.model.GioHangEntity" %>
<%@ page import="java.util.Set" %>
<%@ page import="org.hibernate.Hibernate" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="com.example.demo.dao.HibernateUtils" %>
<%@ page import="org.hibernate.Transaction" %>
<%@ page import="com.example.demo.model.MonAnEntity" %>
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
    <link rel="stylesheet" href="css/customerPageCss/boughtHistory.css"/>

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
        <section class="section-Customer-History-Form">
            <div class="container">
                <div class="History-form">
                    <div class="heading-container">
                        <h2 class="heading-secondary">Lịch sử đặt hàng</h2>
                    </div>

                    <div class="History-form-text-box">
                        <form action="#" id="History-form-info" class="History-form-info">

                            <% ArrayList<HoaDonEntity> danhSachHoaDon;
                                danhSachHoaDon = (ArrayList<HoaDonEntity>) request.getSession().getAttribute("danhSachHoaDon"); %>
                            <% if (!danhSachHoaDon.isEmpty()) { %>
                            <% for (HoaDonEntity hoaDon : danhSachHoaDon) { %>
                            <div class="wrapper">
                                <div class="wrapper-info">
                                    <div class="time-order">
                                        <span>Ngày đặt hàng:</span>
                                        <%= hoaDon.getNgayDatHang() %>
                                    </div>
                                    <div class="note">
                                        <span>Ghi chú:</span>
                                    </div>
                                    <div class="bile">
                                        <span>Tổng tiền:</span>
                                        <%= hoaDon.getTongSoTien() %>
                                    </div>
                                </div>

                                <div class="wrapper-list">
                                    <% Set<GioHangEntity> danhSachGioHang = hoaDon.getGioHang();
                                        for (GioHangEntity gioHang : danhSachGioHang) {
                                            MonAnEntity monAn = gioHang.getMonAn();%>
                                    <div class="wrapper-list-item">
                                        - <%= monAn.getTenMon()%>
                                        <span>X<%= gioHang.getSoLuong()%></span>
                                    </div>
                                    <%}%>
                                </div>
                            </div>
                            <% } %>
                            <% } else { %>
                            <p>Không có đơn hàng nào.</p>
                            <% } %>

                            
                        </form>
                    </div>

                    <div class="History-form-pic">
                        <div class="History-form-list">
                            <div class="heading-img-text">Quảng cáo</div>
                            <img class="History-form-img-box" src="img/app/breakingbad.jpg">
                        </div>
                    </div>
                </div>
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
    
    </body>
</html>