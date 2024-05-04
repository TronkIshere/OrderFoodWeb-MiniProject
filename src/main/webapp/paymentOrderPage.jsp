<%@ page import="com.example.demo.model.GioHangEntity" %>
<%@ page import="java.util.ArrayList" %>
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
    <link rel="stylesheet" href="css/customerPageCss/paymentOderPage.css"/>

    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>


    <title>DeadlineRestaurant</title>
</head>
<body>
    <header class="header">
        <a href="/customerIndex.jsp">
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
        <section class="section-Customer-Menu-Form">
            <div class="container">
                <div class="Menu-form">
                    <div class="heading-container">
                        <h2 class="heading-secondary">Giỏ hàng</h2>
                    </div>

                    <div class="Menu-form-text-box">
                            <%
                                Long TongSoTien = 0L;
                                ArrayList<GioHangEntity> danhSachGioHang = (ArrayList<GioHangEntity>) request.getSession().getAttribute("danhSachDonHang");
                                if (danhSachGioHang != null && !danhSachGioHang.isEmpty()) {
                                    for (GioHangEntity gioHang : danhSachGioHang) {
                                        TongSoTien = TongSoTien + gioHang.getTongSoTien();
                            %>
                            <a class="wrapper">
                                <div class="wrapper-pic-box">
                                    <img class="wrapper-pic-item" src="<%=gioHang.getMonAn().getHinhAnh()%>">
                                </div>
                                <div class="wrapper-info">
                                    <div class="wrapper-info-padding">
                                        <div class="wrapper-info-name">
                                            <span>Tên món ăn:</span>
                                            <%= gioHang.getMonAn().getTenMon()%>
                                        </div>
                                        <div class="wrapper-info-description">
                                            <span>Miêu tả:</span>
                                            <%= gioHang.getMonAn().getMieuTa()%>
                                        </div>
                                    </div>
                                    <div class="wrapper-info-price wrapper-info-padding">
                                        Số lượng:
                                        <span><%= gioHang.getSoLuong()%></span>
                                    </div>

                                    <div class="wrapper-info-price wrapper-info-padding">
                                        Tổng tiền:
                                        <span><%= gioHang.getTongSoTien()%></span>
                                    </div>
                                </div>
                            </a>
                            <%
                                }
                            } else {
                            %>
                            <div class="no-items-message">Không có mục nào trong giỏ hàng.</div>
                            <%
                                }
                            %>


                        <form method="POST" action="${pageContext.request.contextPath}/addBillServlet">
                            <div class="address-form">
                                <label>Địa chỉ: </label>
                                <div class="wrapper-address">
                                    <label id="address-text" name="address-text">688/91, Quang Trung, Gò Vấp</label>
                                    <button class="btn btn--form">Thay đổi</button>
                                </div>
                            </div>
                            
                            <div class="pay-bill">
                                <div class="bill">
                                    <span>Tổng hóa đơn: </span>
                                    <%= TongSoTien%>
                                </div>
                                <button class="btn btn--form">Thanh toán</button>
                            </div>
                        </form>
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