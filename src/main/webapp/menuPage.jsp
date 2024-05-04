<%@ page import="com.example.demo.model.MonAnEntity" %>
<%@ page import="com.example.demo.model.HoaDonEntity" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta 
        name="description"
        content="Đây là đồ án được thực hiện bởi sinh viên cao đẳng bình minh khi hắn mới có 19,5t
        khi mà các bạn vẫn còn đang trà sữa và liên quân thì hắn được thầy Ninh tống cho học
        Tomcat, Servlet, Spring, java, webResponsive từ js đến CSS, deploy web để qua môn
        CHỈ TRONG 12 TUẦN THÔI ĐẤY, TÔI CUỐC TOÀN BỘ SOLO 1 MÌNH
        
        Ở tuổi các bạn thì tôi đánh ngang sinh viên năm 4"/>

    <link rel="icon" href="img/app/weblogo.png" />

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;700&display=swap" rel="stylesheet"/>
    
    <link rel="stylesheet" href="css/style.css"/>
    <link rel="stylesheet" href="css/header.css"/>
    <link rel="stylesheet" href="css/footer.css"/>
    <link rel="stylesheet" href="css/homeCss/section.css"/>
    <link rel="stylesheet" href="css/customerPageCss/menuPage.css"/>
    <link rel="stylesheet" href="css/customerPageCss/foodDetail.css"/>

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
        <section class="section-Customer-Menu-Form">
            <div class="container">
                <div class="Menu-form">
                    <div class="heading-container">
                        <h2 class="heading-secondary">Danh sách món ăn</h2>
                    </div>

                    <div class="Menu-form-text-box">
                        <form action="#" id="Menu-form-info" class="Menu-form-info">   

                            <div class="search-bar">
                                <form action="">
                                    <input class="search-bar-input" type="text" placeholder="Nhập đồ tên ăn bạn đang tìm">
                                    <button class="search-bar-button" type="submit">Tìm</button>
                                </form>
                            </div>

                            <% ArrayList<MonAnEntity> danhSachMonAn;
                                danhSachMonAn = (ArrayList<MonAnEntity>) request.getSession().getAttribute("danhSachMonAn");
                                for(MonAnEntity monAn : danhSachMonAn){%>
                            <a id="show-food-detail-<%=monAn.getIdMonAn()%>"
                               class="wrapper"
                               onclick="foodInformationPopup(
                                   '<%=monAn.getIdMonAn()%>',
                                       '<%=monAn.getTenMon()%>',
                                       '<%=monAn.getMieuTa()%>',
                                       '<%=monAn.getGiaTien()%>',
                                       '<%=monAn.getDiaChi()%>',
                                       '<%=monAn.getHinhAnh()%>')">
                                <div class="wrapper-pic-box">
                                    <img class="wrapper-pic-item" src="<%= monAn.getHinhAnh()%>">
                                </div>
                                <div class="wrapper-info">
                                    <div class="wrapper-info-padding">
                                        <div class="wrapper-info-name">
                                            <span>Tên món ăn:</span>
                                            <%= monAn.getTenMon()%>
                                        </div>
                                        <div class="wrapper-info-description">
                                            <span>Miêu tả:</span>
                                            <%= monAn.getMieuTa()%>
                                        </div>
                                    </div>
                                    <div class="wrapper-info-price wrapper-info-padding">
                                        <span>Giá tiền:</span>
                                        <%= monAn.getGiaTien()%>
                                    </div>
                                </div>
                            </a>
                            <%}%>
                        </form>
                    </div>

                    <div class="Menu-form-pic">
                        <div class="Menu-form-list">
                            <div class="heading-img-text">Món đang hot</div>
                            <div class="meal">
                                <img src="img/menu/gaChien.jpg" class="meal-img" />
                                <div class="meal-content">
                                    <div class="meal-tags">
                                        <span class="tag tag--noNutrient">Đang hot</span>
                                    </div>
                                    <p class="meal-title">gà chiên</p>
                                    <ul class="meal-attributes">
                                        <li class="meal-attribute">
                                            <ion-icon class="meal-icon" name="flame-outline"></ion-icon>
                                            <span><strong>120</strong> calories</span>
                                        </li>
                                        <li class="meal-attribute">
                                            <ion-icon class="meal-icon" name="restaurant-outline"></ion-icon>
                                            <span>Điểm số dinh dưỡng &reg; <strong>500</strong></span>
                                        </li>
                                        <li class="meal-attribute">
                                            <ion-icon class="meal-icon" name="star-outline"></ion-icon>
                                            <span><strong>4.9</strong> Đánh giá (576)</span>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

            <modal class="modal_overlay">
                <div class="modal_body">
                    <ion-icon class="foodDetail-close-icon" name="close-outline"></ion-icon>
                    <div class="foodDetail-from">
                        <h2 class="foodDetail-form-heading">Thông tin món ăn</h2>

                        <div class="food-info">
                            <div class="food-pic-and-price">
                                <img class="food-pic" src="">
                                <div class="food-price">
                                    <span>Giá tiền: </span>
                                </div>
                            </div>
                            <div class="food-description">
                                <span>Mô tả: </span>
                            </div>
                        </div>

                        <div class="foodDetail-from-footer">
                            <div class="choose-quantity">
                                <button id='decrease-btn'>-</button>
                                <span name="food-amount" id='food-amount'>1</span>
                                <button id='increase-btn'>+</button>
                            </div>

                            <form id="addCartServlet" method="POST" action="${pageContext.request.contextPath}/addCartServlet">
                                <input type="hidden" name="food-id-cart" id="food-id-cart" class="food-id" value="1">
                                <input type="hidden" name="food-amount" id="food-amount-input-cart">
                                <button class="btn btn--full" onclick="submitFormForCart()">
                                    bỏ vào giỏ hàng
                                </button>
                            </form>

                            <form id="addBillServlet" method="POST" action="${pageContext.request.contextPath}/addCartServlet">
                                <input type="hidden" name="food-id-cart" id="food-id-bill" class="food-id" value="1">
                                <input type="hidden" name="food-amount" id="food-amount-input-bill">
                                <input type="hidden" name="addBillAction" id="addBillAction">
                                <button class="btn btn--full" onclick="submitFormForBill()">
                                    thanh toán
                                </button>
                            </form>

                        </div>
                    </div>
                </div>
            </modal>

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

        <script src="js/customerPage.js"></script>
    </footer>
    
    </body>
</html>