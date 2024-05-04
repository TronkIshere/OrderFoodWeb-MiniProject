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
    <link rel="stylesheet" href="css/homeCss/hero.css"/>
    <link rel="stylesheet" href="css/homeCss/testimonials.css"/>
    <link rel="stylesheet" href="css/homeCss/pricing.css"/>
    <!-- <link rel="stylesheet" href="css/homeCss/CTA.css"/> -->
    <link rel="stylesheet" href="css/cta.css"/>
    <link rel="stylesheet" href="css/homeCss/queries.css"/>
    <link rel="stylesheet" href="css/homeCss/login.css"/>

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
        <section class="section-hero">
            <hero class="hero">
                <div class="hero-text-box">
                    <h1 class="heading-primary">
                        A healthy meal delivered to your door, every single day
                    </h1>
                    <p class="hero-description">
                        Chúng tôi đã cung cấp hơn 250,000+ bữa ăn trong năm vừa rồi. 
                        Hãy đăng ký tài khoản ngay hôm nay để nhận thêm ưu đãi cũng như có những bữa ăn tiện lợi.
                    </p>
                    <a href="#" class="btn btn--full margin-right-sm">Bắt đầu đặt</a>
                    <a href="#" class="btn btn--outline">Tìm hiểu thêm &darr;</a>
                    <div class="delivered-meals">
                        <div class="deliverd-imgs">
                            <img src="img/app/homepage_adam.jpg" alt="Customer photo">
                            <img src="img/app/homePage_Alastor.jpg" alt="Customer photo">
                            <img src="img/app/homePage_Neuromancer.jpg" alt="Customer photo">
                            <img src="img/app/homePage_Roise.jpg" alt="Customer photo">
                            <img src="img/app/homePage_val.jpg" alt="Customer photo">
                            <img src="img/app/homePage_Vox.jpg" alt="Customer photo">
                        </div>
                        <p class="deliverd-text">
                            <span>250,000+</span> bữa ăn đã được giao
                        </p>
                    </div>
                </div>
                <div class="hero-img-box">
                    <img src="img/app/anime-girl-eating-street-food-4k-zm-scaled.jpg" 
                        class="hero-img"
                        alt="anime-girl-eating-street-food-4k-zm-scaled"/>
                </div>
            </hero>
        </section>

        <section class="section-featured">
            <div class="container">
                <h2 class="heading-featured-in">Các thương hiệu đang được hợp tác</h2>
                <div class="logos">
                    <img src="img/logos/hazbin_hotel.png" alt=""/>
                    <img src="img/logos/Helluva-Boss-Logo.jpg" alt=""/>
                    <img src="img/logos/KFC.jpg" alt=""/>
                    <img src="img/logos/jollibee-logo-png-transparent-11116.png" alt=""/>
                    <img src="img/logos/muder_drones.png" alt=""/>
                </div>
            </div>
        </section>

        <section class="section-how">
            <div class="container">
                <span class="subheading">Bạn muốn tìm một trang web đặt đồ ăn như thế nào</span>
                <h2 class="heading-secondary">Web của chúng tôi đáp ứng những thứ sau</h2>
            </div>

            <div class="container grid grid--2-cols">
                <!-- STEP 1-->
                <div class="step-text-box">
                    <p class="step-number">01</p>
                    <h3 class="heading-tertiary">Bạn đang tìm kiếm một cách nhanh chóng và thuận tiện :</h3>
                    <p class="step-description">
                        Không cần phải lo lắng nữa, vì chúng tôi đã tạo ra một nền tảng đặt đồ ăn hoàn hảo để đáp ứng mọi nhu cầu của bạn.
                        Với hàng trăm nhà hàng và quán ăn đối tác trên khắp địa bàn, chúng tôi mang đến cho bạn một bảng thực đơn phong phú với đủ loại hương vị từ mọi miền đất nước và thế giới. Từ món ăn truyền thống đến các xu hướng ẩm thực mới nhất, bạn sẽ luôn tìm thấy điều gì đó phù hợp với khẩu vị của mình.
                    </p>
                </div>
                <div class="step-img-box">
                    <img src="img/app/app_pic_1.png" class="step-img step-img-1" alt="Anh app"/>
                </div>
                

                <!-- STEP 2-->
                <div class="step-img-box">
                    <img src="img/app/app_pic_2.png" class="step-img step-img-2" alt="Anh app"/>
                </div>
                <div class="step-text-box">
                    <p class="step-number">02</p>
                    <h3 class="heading-tertiary">Với giao diện đơn giản và dễ sử dụng: </h3>
                    <p class="step-description">
                        bạn có thể dễ dàng tìm kiếm, xem xét và đặt hàng mà không mất quá nhiều thời gian. Hơn nữa, chúng tôi cung cấp các tính năng tùy chỉnh để bạn có thể điều chỉnh thực đơn theo ý thích của mình, từ việc thêm hoặc loại bỏ thành phần đến lựa chọn kích cỡ phục vụ.
                    </p>
                </div>

                <!-- STEP 3-->
                <div class="step-text-box">
                    <p class="step-number">03</p>
                    <h3 class="heading-tertiary">Chúng tôi cam kết đảm bảo chất lượng và sự hài lòng của khách hàng:</h3>
                    <p class="step-description">
                        Với dịch vụ giao hàng nhanh chóng và đội ngũ nhân viên chuyên nghiệp, mỗi bữa ăn bạn đặt từ chúng tôi đều là một trải nghiệm tuyệt vời.
                    </p>
                </div>
                <div class="step-img-box step-img-3">
                    <img src="img/app/app_pic_3.png" class="step-img" alt="Anh app"/>
                </div>
            </div>
        </section>

        <section class="section-meals">
            <div class="container center-text">
                <span class="subheading ">Những thực đơn</span>
                <h2 class="heading-secondary">
                    Chúng tôi có một thực đơn cực kì đa dạng
                </h2>
            </div>

            <div class="container grid grid--3-cols margin-right-md">

                <div class="meal">
                    <img src="img/meals/MamDa.jpg" class="meal-img" />
                    <div class="meal-content">
                        <div class="meal-tags">
                            <span class="tag tag--noNutrient">Món giảm cân</span>
                        </div>
                        <p class="meal-title">Mầm đá</p>
                        <ul class="meal-attributes">
                            <li class="meal-attribute">
                                <ion-icon class="meal-icon" name="flame-outline"></ion-icon>
                                <span><strong>0</strong> calories</span>
                            </li>
                            <li class="meal-attribute">
                                <ion-icon class="meal-icon" name="restaurant-outline"></ion-icon>
                                <span>Điểm số dinh dưỡng &reg; <strong>0</strong></span>
                            </li>
                            <li class="meal-attribute">
                                <ion-icon class="meal-icon" name="star-outline"></ion-icon>
                                <span><strong>4.9</strong> Đánh giá (576)</span>
                            </li>
                        </ul>
                    </div>
                </div>

                <div class="meal">
                    <img src="img/meals/UcGa.jpg" class="meal-img" />
                    <div class="meal-content">
                        <div class="meal-tags">
                            <span class="tag tag--meat">Món thịt</span>
                            <span class="tag tag--heartAttack">Bệnh tim</span>
                        </div>
                        <p class="meal-title">Thịt gà chiên</p>
                        <ul class="meal-attributes">
                            <li class="meal-attribute">
                                <ion-icon class="meal-icon" name="flame-outline"></ion-icon>
                                <span><strong>500</strong> calories</span>
                            </li>
                            <li class="meal-attribute">
                                <ion-icon class="meal-icon" name="restaurant-outline"></ion-icon>
                                <span>Điểm số dinh dưỡng &reg; <strong>78</strong></span>
                            </li>
                            <li class="meal-attribute">
                                <ion-icon class="meal-icon" name="star-outline"></ion-icon>
                                <span><strong>4.2</strong> Đánh giá (13)</span>
                            </li>
                        </ul>
                    </div>
                </div>

                <div class="diets">
                    <h3 class="diets-heading-tertiary heading-tertiary">Nhiều loại thực đơn</h3>
                    <ul class="list">
                        <li class="list-item">
                            <ion-icon class="list-icon" name="checkmark-outline"></ion-icon>
                            <span>Thịt</span>
                        </li>
                        <li class="list-item">
                            <ion-icon class="list-icon" name="checkmark-outline"></ion-icon>
                            <span>Giảm cân</span>
                        </li>
                        <li class="list-item">
                            <ion-icon class="list-icon" name="checkmark-outline"></ion-icon>
                            <span>Bệnh tim</span>
                        </li>
                        <li class="list-item">
                            <ion-icon class="list-icon" name="checkmark-outline"></ion-icon>
                            <span>Rau củ</span>
                        </li>
                        <li class="list-item">
                            <ion-icon class="list-icon" name="checkmark-outline"></ion-icon>
                            <span>Thuần chay</span>
                        </li>
                        <li class="list-item">
                            <ion-icon class="list-icon" name="checkmark-outline"></ion-icon>
                            <span>Cho trẻ</span>
                        </li>
                        <li class="list-item">
                            <ion-icon class="list-icon" name="checkmark-outline"></ion-icon>
                            <span>Lành mạnh</span>
                        </li>
                        <li class="list-item">
                            <ion-icon class="list-icon" name="checkmark-outline"></ion-icon>
                            <span>Ăn vặt</span>
                        </li>
                        <li class="list-item">
                            <ion-icon class="list-icon" name="checkmark-outline"></ion-icon>
                            <span>Độc lạ</span>
                        </li>
                        <li class="list-item">
                            <ion-icon class="list-icon" name="checkmark-outline"></ion-icon>
                            <span>Zero calories</span>
                        </li>
                    </ul>
                </div>
            </div>

            <div class="container all-recipes">
                <a href="#" class="link">Xem tất cả đơn hàng &rarr;</a>
            </div>
            
            <section class="section-testimonials grid grid--2-cols">
                <div class="testimonials-container">
                    <span class="subheading ">Những thực khách</span>
                    <h2 class="heading-secondary">
                        Những người đã từng đặt tại trang web của chúng tôi
                    </h2>
    
                    <div class="testimonials">
                        <div class="testimonial">
                            <img class="testimonial-img" alt="Ảnh của Vox" src="img/customers/Vox.jpg"/>
                            <blockquote class="testimonial-text">
                                "Tôi thấy giao diện trực quan và dễ sử dụng, 
                                cũng như tính năng tìm kiếm mạnh mẽ để dễ dàng tìm kiếm và đặt đồ ăn.""
                            </blockquote>
                            <p class="testimonial-name">&mdash; Vox</p>
                        </div>
    
                        <div class="testimonial">
                            <img class="testimonial-img" alt="Ảnh của Roise" src="img/customers/Roise.jpg"/>
                            <blockquote class="testimonial-text">
                                "Ồ, thật là thú vị! Điều đầu tiên tôi quan tâm khi đến một trang web 
                                đặt đồ ăn chắc chắn là tính tiện lợi và đơn giản của nó."
                            </blockquote>
                            <p class="testimonial-name">&mdash; Roise</p>
                        </div>
    
                        <div class="testimonial">
                            <img class="testimonial-img" alt="Ảnh của Hush" src="img/customers/hush.jpeg"/>
                            <blockquote class="testimonial-text">
                                "Một trang web đơn giản và dễ sử dụng là điều mà tôi đánh giá cao nhất. 
                                Tôi không muốn phải mất nhiều thời gian 
                                để tìm kiếm hoặc đặt hàng."
                            </blockquote>
                            <p class="testimonial-name">&mdash; Hush</p>
                        </div>
    
                        <div class="testimonial">
                            <img class="testimonial-img" alt="Ảnh của Charlie" src="img/customers/charlie.jpg"/>
                            <blockquote class="testimonial-text">
                                "Việc đặt đồ ăn trực tuyến là một cách tiện lợi để tận hưởng những món 
                                ăn ngon mà không cần phải ra ngoài."
                            </blockquote>
                            <p class="testimonial-name">&mdash; Charlie</p>
                        </div>
    
                    </div>
                </div>

                <div class="gallery">
                    <figure class="gallery-item">
                        <img src="img/gallery/DoAn1.jpg" alt="Hình ảnh đồ ăn" />
                    </figure>
                    <figure class="gallery-item">
                        <img src="img/gallery/DoAn2.jpg" alt="Hình ảnh đồ ăn" />
                    </figure>
                    <figure class="gallery-item">
                        <img src="img/gallery/DoAn3.jpg" alt="Hình ảnh đồ ăn" />
                    </figure>
                    <figure class="gallery-item">
                        <img src="img/gallery/DoAn4.jpg" alt="Hình ảnh đồ ăn" />
                    </figure>
                    <figure class="gallery-item">
                        <img src="img/gallery/DoAn5.jpg" alt="Hình ảnh đồ ăn" />
                    </figure>
                    <figure class="gallery-item">
                        <img src="img/gallery/DoAn6.jpg" alt="Hình ảnh đồ ăn" />
                    </figure>
                    <figure class="gallery-item">
                        <img src="img/gallery/DoAn7.jpg" alt="Hình ảnh đồ ăn" />
                    </figure>
                    <figure class="gallery-item">
                        <img src="img/gallery/DoAn8.jpg" alt="Hình ảnh đồ ăn" />
                    </figure>
                    <figure class="gallery-item">
                        <img src="img/gallery/DoAn9.jpg" alt="Hình ảnh đồ ăn" />
                    </figure>
                    <figure class="gallery-item">
                        <img src="img/gallery/DoAn10.jpg" alt="Hình ảnh đồ ăn" />
                    </figure>
                    <figure class="gallery-item">
                        <img src="img/gallery/DoAn11.jpg" alt="Hình ảnh đồ ăn" />
                    </figure>
                    <figure class="gallery-item">
                        <img src="img/gallery/DoAn12.jpg" alt="Hình ảnh đồ ăn" />
                    </figure>
                </div>
            </section>
            
            <section class="section-pricing">
                <div class="container">
                    <span class="subheading">Pricing</span>
                    <h2 class="heading-secondary">
                        Các gói hội viên sắp ra được ra mắt
                    </h2>
                </div>

                <div class="container grid grid--2-cols">
                    <div class="princing-plan princing-plan--starter">
                        <header class="plan-header">
                            <p class="plan-name">Started</p>
                            <p class="plan-price"><span>$</span>10</p>
                            <p class="plan-text">Chỉ với khoảng tiền đó bạn được hưởng ưu đãi sau: </p>
                        </header>
                        <ul class="list">
                            <li class="list-item">
                                <ion-icon class="list-icon" name="checkmark-outline"></ion-icon>
                                <span>Mã giảm giá đặc biệt</span>
                            </li>
                            <li class="list-item">
                                <ion-icon class="list-icon" name="checkmark-outline"></ion-icon>
                                <span>Đề xuất đặc biệt</span>
                            </li>
                            <li class="list-item">
                                <ion-icon class="list-icon" name="checkmark-outline"></ion-icon>
                                <span>Miễn phí giao hàng</span>
                            </li>
                            <li class="list-item">
                                <ion-icon class="list-icon" name="close-outline"></ion-icon>
                                <span></span>
                            </li>

                        </ul>
                        <div class="plan-sing-up">
                            <a href="#" class="btn btn--full">Đăng ký</a>
                        </div>
                    </div>

                    <div class="princing-plan princing-plan--special">
                        <div class="plan-header">
                            <p class="plan-name">Special</p>
                            <p class="plan-price"><span>$</span>39</p>
                            <p class="plan-text">Chỉ với khoảng tiền đó bạn được hưởng ưu đãi sau: </p>
                        </div>
                        <ul class="list">
                            <li class="list-item">
                                <ion-icon class="list-icon" name="checkmark-outline"></ion-icon>
                                <span>Ưu tiên sử dụng mã giảm giá giới hạn</span>
                            </li>
                            <li class="list-item">
                                <ion-icon class="list-icon" name="checkmark-outline"></ion-icon>
                                <span>Luôn được giao hàng nhanh</span>
                            </li>
                            <li class="list-item">
                                <ion-icon class="list-icon" name="checkmark-outline"></ion-icon>
                                <span>Mức ưu tiên cao</span>
                            </li>
                            <li class="list-item">
                                <ion-icon class="list-icon" name="checkmark-outline"></ion-icon>
                                <span>Toàn bộ những gì gói started có</span>
                            </li>
                        </ul>
                        <div class="plan-sing-up">
                            <a href="#" class="btn btn--full">Đăng ký</a>
                        </div>
                    </div>
                </div>

                <div class="section-pricing-container container grid">
                    <aside class="plan-details">
                        Hãy cùng khám phá những đặc điểm tuyệt vời của nền ẩm thực trực tuyến này:
                    </aside>
                </div>

                <div class="container grid grid--4-cols margin-bottom-md">
                    <div class="feature">
                        <ion-icon class="feature-icon" name="infinite-outline"></ion-icon>
                        <div class="feature-title">Không muốn nấu ăn!</div>
                        <div class="feature-text">
                            Dịch vụ của chúng tôi hoạt động 365 ngày, 
                            bao gồm cả ngày lễ.
                        </div>
                    </div>

                    <div class="feature">
                        <ion-icon class="feature-icon" name="time-outline"></ion-icon>
                        <div class="feature-title">Sợ chờ đợi lâu!</div>
                        <div class="feature-text">
                            Dịch vụ của chúng tôi giao hàng chỉ trong vòng 30p.
                        </div>
                    </div>

                    <div class="feature">
                        <ion-icon class="feature-icon" name="cash-outline"></ion-icon>
                        <div class="feature-title">Muốn tiết kiệm!</div>
                        <div class="feature-text">
                            Chúng tôi luôn luôn có ưu đãi dành cho các bạn mọi lúc, mọi khung giờ.
                        </div>
                    </div>
                    <div class="feature">
                        <ion-icon class="feature-icon" name="star-outline"></ion-icon>
                        <div class="feature-title">Lười lựa món!</div>
                        <div class="feature-text">
                            Hệ thống của chúng tôi sẽ luôn luôn đề xuất cho các bạn những món mới nhất,
                            đang trending, hoặc có lượt đặt nhiều nhất.
                        </div>
                    </div>
                </div>
            </section>
        </section>

        <section id="section-cta" class="section-cta">
            <div class="container">
                <div class="cta">
                    
                    <div class="cta-text-box">
                        <h2 class="heading-secondary">Chúng tôi đề nghị gói started miễn phí</h2>
                        <p class="cta-text">
                            Nếu như bạn đăng ký trong khoảng thời gian từ hôm nay đến 28/6/2025 
                            Các bạn sẽ nhận được một gói started pack miễn phí.
                        </p>

                        <form action="#" id="cta-form" class="cta-form">
                            <div>
                                <label for = "full-name">Họ tên: </label>
                                <input id="full-name" type="text" placeholder=" Tronk" required/>
                            </div>
                            
                            <div>
                                <label for="gender">Giới tính: </label>
                                <select id="Gender" required>
                                    <option value="">Hãy chọn giới tính của bạn:</option>
                                    <option id="Nam" value="Nam">Nam</option>
                                    <option id="Nu" value="Nu">Nữ</option>
                                </select> 
                            </div>
                            
                            <div>
                                <label for="Adress">Địa chỉ: </label>
                                <input id="Adress" type="text" placeholder=" 688/91, Quang trung" required/>
                            </div>

                            <div>
                                <label for="Number">Số điện thoại: </label>
                                <input id="Number" type="number" placeholder=" 0359256696" required/>
                            </div>

                            <div>
                                <label for="Email">Email: </label>
                                <input id="Email" type="email" placeholder=" me@example.com" required/>
                            </div>

                            <div>
                                <label for="Password">Mật khẩu: </label>
                                <input id="Password" type="password" placeholder=" Mật khẩu" required/>
                            </div>
                            

                            <button class="btn btn--form">Đăng ký ngay</button>
                        </form>
                    </div>

                    <div class="cta-img-box" role="img">
                    </div>

                </div>
            </div>
        </section>

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

        

    </main>

    <modal class="modal_overlay">
        <form method="POST" action="${pageContext.request.contextPath}/login">
        <div class="modal_body">
            <ion-icon class="login-close-icon" name="close-outline"></ion-icon>
            <div class="login-from">
                <h2 class="heading-login">Đăng nhập</h2>

                <div class="login-form-element">
                    <label for="email">Email:</label>
                    <input type="email" name="email_login" placeholder="Nhập tài khoản">
                </div>
                
                <div class="login-form-element">
                    <label for="password">Password:</label>
                    <input type="password" name="password_login" placeholder="Nhập mật khẩu">
                </div>

                <div class="login-form-element">
                    <input type="checkbox" id="remember-me">
                    <label for="remember-me">Nhớ tài khoản</label>
                </div>
                <div class="login-form-element">
                    <button>Đăng nhập</button>
                </div>
                <div class="login-form-element">
                    <a href="#">Quên mật khẩu?</a>
                </div>
            </div>
        </div>
        </form>
    </modal>
    
    </body>
</html>