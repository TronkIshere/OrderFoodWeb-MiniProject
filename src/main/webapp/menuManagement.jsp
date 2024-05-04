<%@ page import="com.example.demo.model.MonAnEntity" %>
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
    <link rel="stylesheet" href="css/homeCss/section.css"/>
    <link rel="stylesheet" href="css/customerPageCss/menuPage.css"/>
    <link rel="stylesheet" href="css/managerPageCss/menuManagement.css"/>
    <link rel="stylesheet" href="css/managerPageCss/addFood.css"/>
    <link rel="stylesheet" href="css/managerPageCss/changeFood.css"/>
    <link rel="stylesheet" href="css/managerPageCss/deleteFood.css"/>


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
                            
                            <div class="heading-button-list">
                                <button id="addFood" class="btn btn--form">Thêm món</button>
                                <button id="changeFood" class="btn btn--form">Chỉnh sửa món</button>
                                <button id="deleteFood" class="btn btn--form">Xóa món</button>
                            </div>

                            <% ArrayList<MonAnEntity> danhSachMonAn;
                                danhSachMonAn = (ArrayList<MonAnEntity>) request.getSession().getAttribute("danhSachMonAn");
                                if (danhSachMonAn != null && !danhSachMonAn.isEmpty()) {
                                    for(MonAnEntity monAn : danhSachMonAn){%>
                            <a id="show-food-detail-<%=monAn.getIdMonAn()%>"
                               class="wrapper"
                               data-food-id="<%= monAn.getIdMonAn()%>">

                                <input type="hidden" id="idMonAn-Change-<%= monAn.getIdMonAn()%>" value="<%= monAn.getIdMonAn()%>">
                                <input type="hidden" id="TenMon-Change-<%= monAn.getIdMonAn()%>" value="<%= monAn.getTenMon()%>">
                                <input type="hidden" id="MieuTa-Change-<%= monAn.getIdMonAn()%>" value="<%= monAn.getMieuTa()%>">
                                <input type="hidden" id="GiaTien-Change-<%= monAn.getIdMonAn()%>" value="<%= monAn.getGiaTien()%>">
                                <input type="hidden" id="DiaChi-Change-<%= monAn.getIdMonAn()%>" value="<%= monAn.getDiaChi()%>">
                                <input type="hidden" id="HinhAnh-Change-<%= monAn.getIdMonAn()%>" value="<%= monAn.getHinhAnh()%>">

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
                            <%
                                }
                                } else {
                            %>
                            <p>Hiện không có đồ ăn nào.</p>
                            <%
                                }
                            %>
                            
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
        </section>


        <modal class="addFood_modal_overlay">
            <div class="modal_body">
                <ion-icon class="addFood-close-icon" name="close-outline"></ion-icon>
                <div class="addFood-from">
                    <h2 class="addFood-form-heading">Thêm món</h2>
                    <form method="POST" action="${pageContext.request.contextPath}/addFoodServlet" enctype="multipart/form-data">
                    <div class="input-form">
                        <div class="input-label">Tên món: </div>
                        <div class="wrapper-input">
                            <input name="name_input" type="text" placeholder="Nhập tên món">
                        </div>
                    </div>

                    <div class="input-form">
                        <div class="input-label">Miêu tả: </div>
                        <div class="wrapper-input">
                            <input name="description_input" type="text" placeholder="Miêu tả">
                        </div>
                    </div>

                    <div class="input-form">
                        <div class="input-label">Giá tiền: </div>
                        <div class="wrapper-input">
                            <input name="money_input" type="number" placeholder="Giá tiền">
                        </div>
                    </div>

                    <div class="input-form">
                        <div class="input-label">Địa chỉ: </div>
                        <div class="wrapper-input">
                            <input name="address_input" type="text" placeholder="Địa chỉ">
                        </div>
                    </div>

                    <div class="input-form">
                        <div class="input-label">Hình ảnh: </div>
                        <div class="custom-file-input">
                            <input id="img-file" type="file" class="file-input" name="AvtMonAn">
                            <label for="img-file" class="file-label">Chọn ảnh mới</label>
                        </div>
                    </div>

                    <div class="button-list">
                        <button id="addFood-close-button" class="btn btn--form" type="button">hủy</button>
                        <button type="submit" class="btn btn--form">Đồng ý</button>
                    </div>
                    </form>
                </div>
            </div>
        </modal>

        <modal class="changeFood_modal_overlay">
            <div class="modal_body">
                <ion-icon class="changeFood-close-icon" name="close-outline"></ion-icon>
                <div class="changeFood-from">
                    <h2 class="changeFood-form-heading">Thay đổi thông tin món</h2>
                    <form method="POST" action="${pageContext.request.contextPath}/updateFoodServlet" enctype="multipart/form-data">
                        <input type="hidden" id="food-id" name="foodId" value="">
                    <div class="input-form">
                        <div class="input-label">Tên món: </div>
                        <div class="wrapper-input">
                            <label name="address-text-foodname" id="address-text-foodname"></label>

                            <button class="btn btn--form"
                                    type="button"
                                    onclick="changeContent('address-text-foodname', this)">
                                Thay đổi
                            </button>
                            <!-- Button xác nhận, mặc định là ẩn -->
                            <button class="btn btn--form"
                                    type="submit"
                                    style="display: none;"
                                    id="address-text-foodname-confirm-button">
                                Xác nhận
                            </button>

                        </div>
                    </div>

                    <div class="input-form">
                        <div class="input-label">Miêu tả: </div>
                        <div class="wrapper-input">
                            <label name="address-text-fooddesc" id="address-text-fooddesc"></label>

                            <button class="btn btn--form"
                                    type="button"
                                    onclick="changeContent('address-text-fooddesc', this)">
                                Thay đổi
                            </button>
                            <!-- Button xác nhận, mặc định là ẩn -->
                            <button class="btn btn--form"
                                    type="submit"
                                    style="display: none;"
                                    id="address-text-fooddesc-confirm-button">
                                Xác nhận
                            </button>
                        </div>
                    </div>

                    <div class="input-form">
                        <div class="input-label">Giá tiền: </div>
                        <div class="wrapper-input">
                            <label name="address-text-price" id="address-text-price"></label>

                            <button class="btn btn--form"
                                    type="button"
                                    onclick="changeContent('address-text-price', this)">
                                Thay đổi
                            </button>
                            <!-- Button xác nhận, mặc định là ẩn -->
                            <button class="btn btn--form"
                                    type="submit"
                                    style="display: none;"
                                    id="address-text-price-confirm-button">
                                Xác nhận
                            </button>
                        </div>
                    </div>

                    <div class="input-form">
                        <div class="input-label">Địa chỉ: </div>
                        <div class="wrapper-input">
                            <label name="address-text" id="address-text"></label>

                            <button class="btn btn--form"
                                    type="button"
                                    onclick="changeContent('address-text', this)">
                                Thay đổi
                            </button>
                            <!-- Button xác nhận, mặc định là ẩn -->
                            <button class="btn btn--form"
                                    type="submit"
                                    style="display: none;"
                                    id="address-text-confirm-button">
                                Xác nhận
                            </button>
                        </div>
                    </div>

                    <div class="input-form">
                        <div class="input-label">Hình ảnh: </div>
                        <img class="food-pic" src="img/menu/gaChien.jpg">
                    </div>

                        <div class="custom-file-input">
                            <input type="file" class="file-input" name="AvtMonAn">
                            <label for="img-file" class="file-label">Chọn ảnh mới</label>
                        </div>

                    <div class="button-list">
                        <button id="changeFood-close-button" class="btn btn--form" type="button">hủy</button>
                        <button class="btn btn--form" type="submit">Đồng ý</button>
                    </div>
                    </form>
                </div>
            </div>
        </modal>

        <modal class="deleteFood_modal_overlay">
            <div class="modal_body">
                <ion-icon class="deleteFood-close-icon" name="close-outline"></ion-icon>
                <div class="deleteFood-from">
                    <h2 class="deleteFood-form-heading">Bạn có muốn xóa món này không?</h2>
                    <form method="POST" action="${pageContext.request.contextPath}/deleteFoodServlet">
                    <div class="foodName">
                        <span></span>
                    </div>

                    <div class="deleteFood-from-content">
                        <div class="foodPic">
                            <img class="foodPic-item" src="img/menu/gaChien.jpg" alt="cánh gà chiên">
                        </div>
                        <div class="food-info">
                            <div class="foodDescription">
                                <span></span>
                            </div>

                            <div class="foodPrice">
                                <span></span>
                            </div>
                        </div>
                    </div>

                        <input type="hidden" id="foodId" name="foodId" value="">
                    <div class="button-list">
                        <button id="deleteFood-close-button" class="btn btn--form" type="button">hủy</button>
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

        <script src="js/menuManagerPage.js"></script>
    </footer>

    </body>
</html>