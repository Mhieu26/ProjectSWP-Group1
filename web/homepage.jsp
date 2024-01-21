<%-- 
    Document   : homepage
    Created on : Jan 15, 2024, 10:44:46 AM
    Author     : toanl
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Products"%>
<%@page import="Dao.ProductsDAO"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Electronic Shop</title>
        <link rel="stylesheet" href="./assets/css/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
        <!-- bootstrap links -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <!-- bootstrap links -->
        <!-- fonts links -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Merriweather&display=swap" rel="stylesheet">
        <!-- fonts links -->
        <link
            rel="stylesheet"
            type="text/css"
            href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"
            />
        <link rel="preload" href="https://static.cellphones.com.vn/css/bc726cb.css" as="style">
        <link rel="preload" href="https://static.cellphones.com.vn/css/c8890e7.css" as="style">
        <link rel="preload" href="https://static.cellphones.com.vn/css/8b24af9.css" as="style">
        <link rel="preload" href="https://static.cellphones.com.vn/css/8019e2f.css" as="style">
        <link rel="preload" href="https://static.cellphones.com.vn/css/7c5b2c4.css" as="style">
        <link rel="preload" href="https://static.cellphones.com.vn/css/380ebf8.css" as="style"> 
        <link rel="preload" href="https://static.cellphones.com.vn/css/ee84d5b.css" as="style">
        <link rel="stylesheet" href="https://static.cellphones.com.vn/css/bc726cb.css">
        <link rel="stylesheet" href="https://static.cellphones.com.vn/css/c8890e7.css">
        <link rel="stylesheet" href="https://static.cellphones.com.vn/css/8b24af9.css">
        <link rel="stylesheet" href="https://static.cellphones.com.vn/css/8019e2f.css">
        <link rel="stylesheet" href="https://static.cellphones.com.vn/css/7c5b2c4.css">
        <link rel="stylesheet" href="https://static.cellphones.com.vn/css/380ebf8.css">
        <link rel="stylesheet" href="https://static.cellphones.com.vn/css/ee84d5b.css">
        <link rel="stylesheet" href="./assets/css/testpro4.css">
        <link rel="stylesheet" href="./assets/css/right_banner.css">
        <link rel="stylesheet" href="./assets/css/block-slider.css">
        <link rel="stylesheet" href="./assets/css/phukien.css">

    </head>
    <body>

        <!-- top navbar -->
        <!-- top navbar -->

        <!-- navbar -->
        <nav class="navbar navbar-expand-lg" id="navbar">
            <div class="container-fluid">
                <a class="navbar-brand" href="home" id="logo"><span id="span1">E</span>Lectronic <span>Shop</span></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span><img src="./images/menu.png" alt="" width="30px"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="home">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Product</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Blog</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="about.jsp">About</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="contact.jsp">Contact</a>
                        </li>
                    </ul>
                    <form class="d-flex" id="search">
                        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success" type="submit">Search</button>
                    </form>
                    <div class="btn" onclick="openForm()"><button><i class="fa fa-sign-in"></i> <a style="color: white;">Login</a> </button> </div>
                    <div class="user-img"><img src="images/326771922_6199665460078834_6765176038989738157_n.jpg" alt="" onclick="toggleMenu()"></div>
                    <div class="sub-menu-wrap" id="subMenu">
                        <div class="sub-menu">
                            <div class="user-info">
                                <img src="images/326771922_6199665460078834_6765176038989738157_n.jpg" alt="">
                                <h3>Manh Toan</h3>
                            </div>
                            <hr>
                            <a href="userController" class="sub-menu-link">
                                <img src="images/user.png" alt="">
                                <p>Edit Profile</p>
                            </a>
                            <a href="changePassword" class="sub-menu-link">
                                <img src="images/pw.png" alt="">
                                <p>Change Password</p>
                            </a>
                            <a href="#" class="sub-menu-link">
                                <img src="images/shopping-cart.png" alt="">
                                <p>Orders History</p>
                            </a>
                            <a href="#" class="sub-menu-link">
                                <img src="images/logout.png" alt="">
                                <p>Log Out</p>
                            </a>

                        </div>
                    </div>
                </div>
            </div>
        </nav>
        <!-- navbar -->



        <!--slider-->
        <div data-server-rendered="true" id="__nuxt">
            <!---->
            <div id="__layout">
                <div id="layout-desktop" class="cps-page">
                    <div></div>
                    <!---->
                    <div class="cps-container cps-body">
                        <div style="display:none;">
                            <div id="page_loader">
                                <div class="logo"></div>
                                <div class="loader"></div>
                            </div>
                        </div>
                        <div data-fetch-key="Index:0" class="cps-homepage">
                            <div>
                                <div class="block-top-home is-flex">
                                    <div id="menu-main" class="menu-container">
                                        <div class="menu-wrapper space-bread-crumb">
                                            <div class="menu-tree">
                                                <div target="_self" class="label-menu-tree">
                                                    <div class="label-item multiple">
                                                        <div class="right-content">
                                                            <i class="icons-cate" style="background-image:url(https://cellphones.com.vn/media/icons/menu/icon-cps-3.svg);"></i>
                                                            <a href="#" class="multiple-link">
                                                                <span>Điện thoại </span>
                                                            </a>                                                 
                                                        </div>

                                                    </div>
                                                </div>
                                                <div href="#" target="_self" class="label-menu-tree">
                                                    <a href="#" target="_self" class="label-item">
                                                        <div class="right-content">
                                                            <i class="icons-cate" style="background-image:url(https://cdn2.cellphones.com.vn/x/media/icons/menu/icon-cps-380.svg);"></i>
                                                            <span class="single-link">Laptop</span>
                                                        </div>

                                                    </a>
                                                </div>
                                                <div href="#" target="_self" class="label-menu-tree">
                                                    <a href="#" target="_self" class="label-item">
                                                        <div class="right-content">
                                                            <i class="icons-cate" style="background-image:url(https://cellphones.com.vn/media/icons/menu/icon-cps-220.svg);"></i>
                                                            <span class="single-link">Âm thanh</span>
                                                        </div>

                                                    </a>
                                                </div>
                                                <div target="_self" class="label-menu-tree">
                                                    <div class="label-item multiple">
                                                        <div class="right-content">
                                                            <i class="icons-cate" style="background-image:url(https://cellphones.com.vn/media/icons/menu/icon-cps-610.svg);"></i>
                                                            <a href="#" class="multiple-link">
                                                                <span>Đồng hồ</span>
                                                            </a>
                                                        </div>

                                                    </div>
                                                </div>
                                                <div href="#" target="_self" class="label-menu-tree">
                                                    <a href="#" target="_self" class="label-item">
                                                        <div class="right-content">
                                                            <i class="icons-cate" style="background-image:url(https://cellphones.com.vn/media/icons/menu/icon-cps-30.svg);"></i>
                                                            <span class="single-link">Phụ kiện</span>
                                                        </div>

                                                    </a>
                                                </div>
                                                <div href="#" target="_self" class="label-menu-tree">
                                                    <a href="#" target="_self" class="label-item">
                                                        <div class="right-content">
                                                            <i class="icons-cate" style="background-image:url(https://cdn2.cellphones.com.vn/x/media/icons/menu/icon-cps-promotion.svg);"></i>
                                                            <span class="single-link">Khuyến mãi</span>
                                                        </div>

                                                    </a>
                                                </div>
                                                <div href="#" target="_self" class="label-menu-tree">
                                                    <a href="#" target="_self" class="label-item">
                                                        <div class="right-content">
                                                            <i class="icons-cate" style="background-image:url(https://cdn.cellphones.com.vn/media/icons/menu/icon-cps-tech.svg);"></i>
                                                            <span class="single-link">Tin công nghệ</span>
                                                        </div>

                                                    </a>
                                                </div>
                                            </div>
                                            <div class="menu-tree-child columns m-0 box" style="display:none;"></div>
                                        </div>
                                    </div>
                                    <div data-fetch-key="SlidingBanner:0" class="block-top-home__sliding-banner">
                                        <div class="block-sliding-home">
                                            <div class="swiper-container gallery-top">
                                                <div class="swiper-wrapper">
                                                    <div class="swiper-slide">
                                                        <a href="#" class="button__link">
                                                            <img src="https://cdn2.cellphones.com.vn/insecure/rs:fill:690:300/q:80/plain/https://dashboard.cellphones.com.vn/storage/sliding-home-iphone15.jpg" width="690" height="300" alt="IPHONE 15&lt;br&gt;Sẵn hàng mua ngay" loading="lazy">
                                                        </a>
                                                    </div>
                                                    <div class="swiper-slide">
                                                        <a href="#" class="button__link">
                                                            <img src="https://cdn2.cellphones.com.vn/insecure/rs:fill:690:300/q:80/plain/https://dashboard.cellphones.com.vn/storage/sliding-a15a25-new-t1.png" width="690" height="300" alt="GALAXY A15 | A25&lt;br&gt;Mở bán deal hời" loading="lazy">
                                                        </a>
                                                    </div>
                                                    <div class="swiper-slide">
                                                        <a href="#" class="button__link">
                                                            <img src="https://cdn2.cellphones.com.vn/insecure/rs:fill:690:300/q:80/plain/https://dashboard.cellphones.com.vn/storage/sliding-dkinhantin-1.png" width="690" height="300" alt="SIÊU PHẨM SAMSUNG&lt;br&gt;Đăng kí ngay" loading="lazy">
                                                        </a>
                                                    </div>
                                                    <div class="swiper-slide">
                                                        <a href="#" class="button__link">
                                                            <img src="https://cdn2.cellphones.com.vn/insecure/rs:fill:690:300/q:80/plain/https://dashboard.cellphones.com.vn/storage/sliding-note13-dattruoc-1.jpg" width="690" height="300" alt="REDMI NOTE 13&lt;br&gt;Đặt trước giá tốt" loading="lazy">
                                                        </a>
                                                    </div>
                                                    <div class="swiper-slide">
                                                        <a href="#" class="button__link">
                                                            <img src="https://cdn2.cellphones.com.vn/insecure/rs:fill:690:300/q:80/plain/https://dashboard.cellphones.com.vn/storage/robot-roborock-q5-pro-01-2024.jpg" width="690" height="300" alt="ROBOROCK Q5 PRO&lt;br&gt;Ưu đãi chỉ 6.99 triệu" loading="lazy">
                                                        </a>
                                                    </div>
                                                    <div class="swiper-slide">
                                                        <a href="#" class="button__link">
                                                            <img src="https://cdn2.cellphones.com.vn/insecure/rs:fill:690:300/q:80/plain/https://dashboard.cellphones.com.vn/storage/rog strix scar.jpg" width="690" height="300" alt="ASUS ROG STRIX&lt;br&gt;Hiệu năng hàng đầu" loading="lazy">
                                                        </a>
                                                    </div>
                                                    <div class="swiper-slide">
                                                        <a href="#" class="button__link">
                                                            <img src="https://cdn2.cellphones.com.vn/insecure/rs:fill:690:300/q:80/plain/https://dashboard.cellphones.com.vn/storage/watch 2 pro.jpg" width="690" height="300" alt="XIAOMI WATCH 2 PRO&lt;br&gt;Chốt ngay deal xịn" loading="lazy">
                                                        </a>
                                                    </div>
                                                    <div class="swiper-slide">
                                                        <a href="#" class="button__link">
                                                            <img src="https://cdn2.cellphones.com.vn/insecure/rs:fill:690:300/q:80/plain/https://dashboard.cellphones.com.vn/storage/tecno-2024-sliding.png" width="690" height="300" alt="TECNO SPARK 2024&lt;br&gt;Mở bán deal hời" loading="lazy">
                                                        </a>
                                                    </div>
                                                    <div class="swiper-slide">
                                                        <a href="#" class="button__link">
                                                            <img src="https://cdn2.cellphones.com.vn/insecure/rs:fill:690:300/q:80/plain/https://dashboard.cellphones.com.vn/storage/tcl-sliding-txt-th111-4390.jpg" width="690" height="300" alt="TCL 40 NXT PAPER&lt;br&gt;Ưu đãi khủng" loading="lazy">
                                                        </a>
                                                    </div>
                                                </div>                                   
                                            </div>
                                            <div class="swiper-pagination"></div>

                                        </div>
                                    </div>
                                    <div class="block-top-home__right-banner">
                                        <div class="right-banner">
                                            <a href="#" class="right-banner__item button__link">
                                                <img src="images/blog.png" width="690" height="300" alt="SAMSUNG S23 128GB&lt;br&gt;Giảm giá sốc" loading="lazy" class="right-banner__img">
                                            </a>
                                            <a href="#" class="right-banner__item button__link">
                                                <img src="images/blog2.png" width="690" height="300" alt="ƯU ĐÃI SINH VIÊN&lt;br&gt;Giảm thêm 5%" loading="lazy" class="right-banner__img">
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="horizontal-banner"></div>
                            </div>
                            <!---->
                            <div class="block-categories is-desktop mt-0 menu-mobile-device" style="display:none;">
                                <div class="categories-title">
                                    <h2>
                                        <a href="" class="button__link">DANH MỤC</a>
                                    </h2>
                                    <!---->
                                </div>
                                <div class="categories-content">
                                    <div class="categories-content-wrapper is-flex">
                                        <div class="item-categories-outer">
                                            <a href="https://cellphones.com.vn/mobile.html" class="button__link item-categories square" style="background-color:null;background-image:url(https://cdn2.cellphones.com.vn/insecure/rs:fill:150:0/q:70/plain/https://cellphones.com.vn/media/catalog/product/i/c/icon-phone-tablet_1.png);">
                                                <!---->
                                            </a>
                                            <p class="title-under">Điện thoại, Tablet</p>
                                        </div>
                                        <div class="item-categories-outer">
                                            <a href="https://cellphones.com.vn/laptop.html" class="button__link item-categories square" style="background-color:#ffffff;background-image:url(https://cdn2.cellphones.com.vn/insecure/rs:fill:150:0/q:70/plain/https://cellphones.com.vn/media/catalog/product/m/e/menu-laptop-v2.png);">
                                                <!---->
                                            </a>
                                            <p class="title-under">Laptop</p>
                                        </div>
                                        <div class="item-categories-outer">
                                            <a href="https://cellphones.com.vn/do-choi-cong-nghe.html" class="button__link item-categories square" style="background-color:#ffffff;background-image:url(https://cdn2.cellphones.com.vn/insecure/rs:fill:150:0/q:70/plain/https://cellphones.com.vn/media/catalog/product/d/o/dong-ho.png);">
                                                <!---->
                                            </a>
                                            <p class="title-under">Đồng hồ</p>
                                        </div>
                                        <div class="item-categories-outer">
                                            <a href="https://cellphones.com.vn/thiet-bi-am-thanh.html" class="button__link item-categories square" style="background-color:#ffffff;background-image:url(https://cdn2.cellphones.com.vn/insecure/rs:fill:150:0/q:70/plain/https://cellphones.com.vn/media/catalog/product/m/e/menu-audio-v2.png);">
                                                <!---->
                                            </a>
                                            <p class="title-under">Âm thanh</p>
                                        </div>
                                        <div class="item-categories-outer">
                                            <a href="https://cellphones.com.vn/do-gia-dung.html" class="button__link item-categories square" style="background-color:#ffffff;background-image:url(https://cdn2.cellphones.com.vn/insecure/rs:fill:150:0/q:70/plain/https://cellphones.com.vn/media/tmp/catalog/product/g/r/group_172_2.png);">
                                                <!---->
                                            </a>
                                            <p class="title-under">Đồ gia dụng</p>
                                        </div>
                                        <div class="item-categories-outer">
                                            <a href="https://cellphones.com.vn/phu-kien.html" class="button__link item-categories square" style="background-color:#ffffff;background-image:url(https://cdn2.cellphones.com.vn/insecure/rs:fill:150:0/q:70/plain/https://cellphones.com.vn/media/catalog/product/m/e/menu-accessories.png);">
                                                <!---->
                                            </a>
                                            <p class="title-under">Phụ kiện</p>
                                        </div>
                                        <div class="item-categories-outer">
                                            <a href="https://cellphones.com.vn/man-hinh.html" class="button__link item-categories square" style="background-color:#ffffff;background-image:url(https://cdn2.cellphones.com.vn/insecure/rs:fill:150:0/q:70/plain/https://cellphones.com.vn/media/catalog/product/m/e/menu-pc-monitor.png);">
                                                <!---->
                                            </a>
                                            <p class="title-under">Màn hình</p>
                                        </div>
                                        <div class="item-categories-outer">
                                            <a href="https://cellphones.com.vn/tivi.html" class="button__link item-categories square" style="background-color:#ffffff;background-image:url(https://cdn2.cellphones.com.vn/insecure/rs:fill:150:0/q:70/plain/https://cellphones.com.vn/media/catalog/product/m/e/menu-tv.png);">
                                                <!---->
                                            </a>
                                            <p class="title-under">Tivi</p>
                                        </div>
                                        <div class="item-categories-outer">
                                            <a href="https://cellphones.com.vn/thu-cu-doi-moi" class="button__link item-categories square" style="background-color:#ffffff;background-image:url(https://cdn2.cellphones.com.vn/insecure/rs:fill:150:0/q:70/plain/https://cellphones.com.vn/media/catalog/product/m/e/menu-old-product.png);">
                                                <!---->
                                            </a>
                                            <p class="title-under">Thu cũ</p>
                                        </div>
                                        <div class="item-categories-outer">
                                            <a href="https://cellphones.com.vn/hang-cu.html" class="button__link item-categories square" style="background-color:#ffffff;background-image:url(https://cdn2.cellphones.com.vn/insecure/rs:fill:150:0/q:70/plain/https://cellphones.com.vn/media/catalog/product/m/e/menu-trade_in.png);">
                                                <!---->
                                            </a>
                                            <p class="title-under">Hàng cũ</p>
                                        </div>
                                        <div class="item-categories-outer">
                                            <a href="https://cellphones.com.vn/danh-sach-khuyen-mai" class="button__link item-categories square" style="background-color:#ffffff;background-image:url(https://cdn2.cellphones.com.vn/insecure/rs:fill:150:0/q:70/plain/https://cellphones.com.vn/media/tmp/catalog/product/t/_/t_i_xu_ng_-_2022-06-07t114601.808.png);">
                                                <!---->
                                            </a>
                                            <p class="title-under">Khuyến mại</p>
                                        </div>
                                        <div class="item-categories-outer">
                                            <a href="https://cellphones.com.vn/sforum/" class="button__link item-categories square" style="background-color:#ffffff;background-image:url(https://cdn2.cellphones.com.vn/insecure/rs:fill:150:0/q:70/plain/https://cellphones.com.vn/media/catalog/product/s/f/sforum-news.png);">
                                                <!---->
                                            </a>
                                            <p class="title-under">Tin công nghệ</p>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!---->

                        </div>
                    </div>

                </div>
            </div>
        </div>



        <!-- home content -->
        <script
            type="text/javascript"
            src="https://code.jquery.com/jquery-1.11.0.min.js"
        ></script>
        <script
            type="text/javascript"
            src="https://code.jquery.com/jquery-migrate-1.2.1.min.js"
        ></script>
        <script
            type="text/javascript"
            src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"
        ></script> 




                   <% 
            ArrayList<Products> products = (ArrayList<Products>) request.getAttribute("products");
            for (Products product : products) {
        %>
        <%= product.getName()%>
        <% } %>



        <div class="products">
            <h1 class="text-center">PRODUCTS</h1>
            <div class="products-title">
                <h2>
                    <a href="#" class="button__link">Featured Products</a>

                </h2>
                <a href="#" class="btn-show-more button__link">Xem tất cả</a>
            </div>
        
            <div class="product-cards"> 
                <div class="card">
                    <div class="card-img">
                        <img src="./images/p6.png" alt="">
                    </div>
                    <div class="card-body">
                        <h3 class="text-center">IPhone</h3>
                        <p class="text-center">Feedback</p>
                        <div class="star text-center">
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                        </div>
                        <h2>$1000 <span><li class="fa-solid fa-cart-shopping"></li></span></h2>
                    </div>
                </div>
    

                <div class="card">
                    <div class="card-img">
                        <img src="./images/a1.png" alt="">
                    </div>
                    <div class="card-body">
                        <h3 class="text-center">Airpods</h3>
                        <p class="text-center">Feedback</p>
                        <div class="star text-center">
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                        </div>
                        <h2>$100 <span><li class="fa-solid fa-cart-shopping"></li></span></h2>
                    </div>
                </div>

                <div class="card">
                    <div class="card-img">
                        <img src="./images/laptop2.png" alt="">
                    </div>
                    <div class="card-body">
                        <h3 class="text-center">Laptop</h3>
                        <p class="text-center">Feedback</p>
                        <div class="star text-center">
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                        </div>
                        <h2>$200 <span><li class="fa-solid fa-cart-shopping"></li></span></h2>
                    </div>
                </div>
                <div class="card">
                    <div class="card-img">
                        <img src="./images/iphone-14-pro_2__5.png" alt="">
                    </div>
                    <div class="card-body">
                        <h3 class="text-center">Iphone 14 Pro Max</h3>
                        <p class="text-center">Feedback</p>
                        <div class="star text-center">
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                        </div>
                        <h2>$200 <span><li class="fa-solid fa-cart-shopping"></li></span></h2>
                    </div>
                </div>
                <div class="card">
                    <div class="card-img">
                        <img src="./images/iphone-14-pro_2__5.png" alt="">
                    </div>
                    <div class="card-body">
                        <h3 class="text-center">Iphone 14 Pro Max</h3>
                        <p class="text-center">Feedback</p>
                        <div class="star text-center">
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                        </div>
                        <h2>$200 <span><li class="fa-solid fa-cart-shopping"></li></span></h2>
                    </div>
                </div>
                <div class="card">
                    <div class="card-img">
                        <img src="./images/iphone-14-pro_2__5.png" alt="">
                    </div>
                    <div class="card-body">
                        <h3 class="text-center">Iphone 14 Pro Max</h3>
                        <p class="text-center">Feedback</p>
                        <div class="star text-center">
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                        </div>
                        <h2>$200 <span><li class="fa-solid fa-cart-shopping"></li></span></h2>
                    </div>
                </div>

                <div class="card">
                    <div class="card-img">
                        <img src="./images/pr9.png" alt="">
                    </div>
                    <div class="card-body">
                        <h3 class="text-center">Laptop</h3>
                        <p class="text-center">Feedback</p>
                        <div class="star text-center">
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                        </div>
                        <h2>$200 <span><li class="fa-solid fa-cart-shopping"></li></span></h2>
                    </div>
                </div>

                <div class="card">
                    <div class="card-img">
                        <img src="./images/t1.png" alt="">
                    </div>
                    <div class="card-body">
                        <h3 class="text-center">Ipad</h3>
                        <p class="text-center">Feedback</p>
                        <div class="star text-center">
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                        </div>
                        <h2>$300 <span><li class="fa-solid fa-cart-shopping"></li></span></h2>
                    </div>
                </div>

            </div>
            <div class="products-title">
                <h2>
                    <a href="#" class="button__link">Phone</a>

                </h2>
                <a href="#" class="btn-show-more button__link">Xem tất cả</a>
            </div>

            <div class="product-cards"> 
                <div class="card">
                    <div class="card-img">
                        <img src="./images/p6.png" alt="">
                    </div>
                    <div class="card-body">
                        <h3 class="text-center">Iphone 13 pro</h3>
                        <p class="text-center">Feedback</p>
                        <div class="star text-center">
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                        </div>
                        <h2>$1000 <span><li class="fa-solid fa-cart-shopping"></li></span></h2>
                    </div>
                </div>


                <div class="card">
                    <div class="card-img">
                        <img src="./images/a1.png" alt="">
                    </div>
                    <div class="card-body">
                        <h3 class="text-center">Airpods</h3>
                        <p class="text-center">Feedback</p>
                        <div class="star text-center">
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                        </div>
                        <h2>$100 <span><li class="fa-solid fa-cart-shopping"></li></span></h2>
                    </div>
                </div>

                <div class="card">
                    <div class="card-img">
                        <img src="./images/laptop2.png" alt="">
                    </div>
                    <div class="card-body">
                        <h3 class="text-center">Laptop</h3>
                        <p class="text-center">Feedback</p>
                        <div class="star text-center">
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                        </div>
                        <h2>$200 <span><li class="fa-solid fa-cart-shopping"></li></span></h2>
                    </div>
                </div>
                <div class="card">
                    <div class="card-img">
                        <img src="./images/iphone-14-pro_2__5.png" alt="">
                    </div>
                    <div class="card-body">
                        <h3 class="text-center">Iphone 14 Pro Max</h3>
                        <p class="text-center">Feedback</p>
                        <div class="star text-center">
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                        </div>
                        <h2>$200 <span><li class="fa-solid fa-cart-shopping"></li></span></h2>
                    </div>
                </div>
                <div class="card">
                    <div class="card-img">
                        <img src="./images/iphone-14-pro_2__5.png" alt="">
                    </div>
                    <div class="card-body">
                        <h3 class="text-center">Iphone 14 Pro Max</h3>
                        <p class="text-center">Feedback</p>
                        <div class="star text-center">
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                        </div>
                        <h2>$200 <span><li class="fa-solid fa-cart-shopping"></li></span></h2>
                    </div>
                </div>
                <div class="card">
                    <div class="card-img">
                        <img src="./images/iphone-14-pro_2__5.png" alt="">
                    </div>
                    <div class="card-body">
                        <h3 class="text-center">Iphone 14 Pro Max</h3>
                        <p class="text-center">Feedback</p>
                        <div class="star text-center">
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                        </div>
                        <h2>$200 <span><li class="fa-solid fa-cart-shopping"></li></span></h2>
                    </div>
                </div>

                <div class="card">
                    <div class="card-img">
                        <img src="./images/pr9.png" alt="">
                    </div>
                    <div class="card-body">
                        <h3 class="text-center">Laptop</h3>
                        <p class="text-center">Feedback</p>
                        <div class="star text-center">
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                        </div>
                        <h2>$200 <span><li class="fa-solid fa-cart-shopping"></li></span></h2>
                    </div>
                </div>

                <div class="card">
                    <div class="card-img">
                        <img src="./images/t1.png" alt="">
                    </div>
                    <div class="card-body">
                        <h3 class="text-center">Ipad</h3>
                        <p class="text-center">Feedback</p>
                        <div class="star text-center">
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                        </div>
                        <h2>$300 <span><li class="fa-solid fa-cart-shopping"></li></span></h2>
                    </div>
                </div>

            </div>
            <div class="products-title">
                <h2>
                    <a href="#" class="button__link">Laptop</a>

                </h2>
                <a href="#" class="btn-show-more button__link">Xem tất cả</a>
            </div>
            <div class="product-cards"> 
                <div class="card">
                    <div class="card-img">
                        <img src="./images/p6.png" alt="">
                    </div>
                    <div class="card-body">
                        <h3 class="text-center">Iphone 13 pro</h3>
                        <p class="text-center">Feedback</p>
                        <div class="star text-center">
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                        </div>
                        <h2>$1000 <span><li class="fa-solid fa-cart-shopping"></li></span></h2>
                    </div>
                </div>


                <div class="card">
                    <div class="card-img">
                        <img src="./images/a1.png" alt="">
                    </div>
                    <div class="card-body">
                        <h3 class="text-center">Airpods</h3>
                        <p class="text-center">Feedback</p>
                        <div class="star text-center">
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                        </div>
                        <h2>$100 <span><li class="fa-solid fa-cart-shopping"></li></span></h2>
                    </div>
                </div>

                <div class="card">
                    <div class="card-img">
                        <img src="./images/laptop2.png" alt="">
                    </div>
                    <div class="card-body">
                        <h3 class="text-center">Laptop</h3>
                        <p class="text-center">Feedback</p>
                        <div class="star text-center">
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                        </div>
                        <h2>$200 <span><li class="fa-solid fa-cart-shopping"></li></span></h2>
                    </div>
                </div>
                <div class="card">
                    <div class="card-img">
                        <img src="./images/p6.png" alt="">
                    </div>
                    <div class="card-body">
                        <h3 class="text-center">Laptop</h3>
                        <p class="text-center">Feedback</p>
                        <div class="star text-center">
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                        </div>
                        <h2>$200 <span><li class="fa-solid fa-cart-shopping"></li></span></h2>
                    </div>
                </div>
                <div class="card">
                    <div class="card-img">
                        <img src="./images/pr9.png" alt="">
                    </div>
                    <div class="card-body">
                        <h3 class="text-center">Laptop</h3>
                        <p class="text-center">Feedback</p>
                        <div class="star text-center">
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                        </div>
                        <h2>$200 <span><li class="fa-solid fa-cart-shopping"></li></span></h2>
                    </div>
                </div>

                <div class="card">
                    <div class="card-img">
                        <img src="./images/t1.png" alt="">
                    </div>
                    <div class="card-body">
                        <h3 class="text-center">Ipad</h3>
                        <p class="text-center">Feedback</p>
                        <div class="star text-center">
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                        </div>
                        <h2>$300 <span><li class="fa-solid fa-cart-shopping"></li></span></h2>
                    </div>
                </div>

            </div>
            <div class="products-title">
                <h2>
                    <a href="#" class="button__link">Headphone</a>

                </h2>
                <a href="#" class="btn-show-more button__link">Xem tất cả</a>
            </div>
            <div class="product-cards"> 
                <div class="card">
                    <div class="card-img">
                        <img src="./images/p6.png" alt="">
                    </div>
                    <div class="card-body">
                        <h3 class="text-center">Iphone 13 pro</h3>
                        <p class="text-center">Feedback</p>
                        <div class="star text-center">
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                        </div>
                        <h2>$1000 <span><li class="fa-solid fa-cart-shopping"></li></span></h2>
                    </div>
                </div>


                <div class="card">
                    <div class="card-img">
                        <img src="./images/a1.png" alt="">
                    </div>
                    <div class="card-body">
                        <h3 class="text-center">Airpods</h3>
                        <p class="text-center">Feedback</p>
                        <div class="star text-center">
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                        </div>
                        <h2>$100 <span><li class="fa-solid fa-cart-shopping"></li></span></h2>
                    </div>
                </div>

                <div class="card">
                    <div class="card-img">
                        <img src="./images/laptop2.png" alt="">
                    </div>
                    <div class="card-body">
                        <h3 class="text-center">Laptop</h3>
                        <p class="text-center">Feedback</p>
                        <div class="star text-center">
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                        </div>
                        <h2>$200 <span><li class="fa-solid fa-cart-shopping"></li></span></h2>
                    </div>
                </div>
                <div class="card">
                    <div class="card-img">
                        <img src="./images/p6.png" alt="">
                    </div>
                    <div class="card-body">
                        <h3 class="text-center">Laptop</h3>
                        <p class="text-center">Feedback</p>
                        <div class="star text-center">
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                        </div>
                        <h2>$200 <span><li class="fa-solid fa-cart-shopping"></li></span></h2>
                    </div>
                </div>
                <div class="card">
                    <div class="card-img">
                        <img src="./images/pr9.png" alt="">
                    </div>
                    <div class="card-body">
                        <h3 class="text-center">Laptop</h3>
                        <p class="text-center">Feedback</p>
                        <div class="star text-center">
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                        </div>
                        <h2>$200 <span><li class="fa-solid fa-cart-shopping"></li></span></h2>
                    </div>
                </div>

                <div class="card">
                    <div class="card-img">
                        <img src="./images/t1.png" alt="">
                    </div>
                    <div class="card-body">
                        <h3 class="text-center">Ipad</h3>
                        <p class="text-center">Feedback</p>
                        <div class="star text-center">
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                        </div>
                        <h2>$300 <span><li class="fa-solid fa-cart-shopping"></li></span></h2>
                    </div>
                </div>

            </div>  
            <div class="products-title">
                <h2>
                    <a href="#" class="button__link">Watch</a>

                </h2>
                <a href="#" class="btn-show-more button__link">Xem tất cả</a>
            </div>
            <div class="product-cards"> 
                <div class="card">
                    <div class="card-img">
                        <img src="./images/p6.png" alt="">
                    </div>
                    <div class="card-body">
                        <h3 class="text-center">Iphone 13 pro</h3>
                        <p class="text-center">Feedback</p>
                        <div class="star text-center">
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                        </div>
                        <h2>$1000 <span><li class="fa-solid fa-cart-shopping"></li></span></h2>
                    </div>
                </div>


                <div class="card">
                    <div class="card-img">
                        <img src="./images/a1.png" alt="">
                    </div>
                    <div class="card-body">
                        <h3 class="text-center">Airpods</h3>
                        <p class="text-center">Feedback</p>
                        <div class="star text-center">
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                        </div>
                        <h2>$100 <span><li class="fa-solid fa-cart-shopping"></li></span></h2>
                    </div>
                </div>

                <div class="card">
                    <div class="card-img">
                        <img src="./images/laptop2.png" alt="">
                    </div>
                    <div class="card-body">
                        <h3 class="text-center">Laptop</h3>
                        <p class="text-center">Feedback</p>
                        <div class="star text-center">
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                        </div>
                        <h2>$200 <span><li class="fa-solid fa-cart-shopping"></li></span></h2>
                    </div>
                </div>
                <div class="card">
                    <div class="card-img">
                        <img src="./images/p6.png" alt="">
                    </div>
                    <div class="card-body">
                        <h3 class="text-center">Laptop</h3>
                        <p class="text-center">Feedback</p>
                        <div class="star text-center">
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                        </div>
                        <h2>$200 <span><li class="fa-solid fa-cart-shopping"></li></span></h2>
                    </div>
                </div>
                <div class="card">
                    <div class="card-img">
                        <img src="./images/pr9.png" alt="">
                    </div>
                    <div class="card-body">
                        <h3 class="text-center">Laptop</h3>
                        <p class="text-center">Feedback</p>
                        <div class="star text-center">
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                        </div>
                        <h2>$200 <span><li class="fa-solid fa-cart-shopping"></li></span></h2>
                    </div>
                </div>

                <div class="card">
                    <div class="card-img">
                        <img src="./images/t1.png" alt="">
                    </div>
                    <div class="card-body">
                        <h3 class="text-center">Ipad</h3>
                        <p class="text-center">Feedback</p>
                        <div class="star text-center">
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                        </div>
                        <h2>$300 <span><li class="fa-solid fa-cart-shopping"></li></span></h2>
                    </div>
                </div>

            </div>  
            <div class="products-title">
                <h2>
                    <a href="#" class="button__link">PHỤ KIỆN</a>

                </h2>
                <a href="#" class="btn-show-more button__link">Xem tất cả</a>
            </div>
            <div class="product-cards"> 
                <div class="card">
                    <div class="card-img">
                        <img src="./images/p6.png" alt="">
                    </div>
                    <div class="card-body">
                        <h3 class="text-center">Iphone 13 pro</h3>
                        <p class="text-center">Feedback</p>
                        <div class="star text-center">
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                        </div>
                        <h2>$1000 <span><li class="fa-solid fa-cart-shopping"></li></span></h2>
                    </div>
                </div>


                <div class="card">
                    <div class="card-img">
                        <img src="./images/a1.png" alt="">
                    </div>
                    <div class="card-body">
                        <h3 class="text-center">Airpods</h3>
                        <p class="text-center">Feedback</p>
                        <div class="star text-center">
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                        </div>
                        <h2>$100 <span><li class="fa-solid fa-cart-shopping"></li></span></h2>
                    </div>
                </div>

                <div class="card">
                    <div class="card-img">
                        <img src="./images/laptop2.png" alt="">
                    </div>
                    <div class="card-body">
                        <h3 class="text-center">Laptop</h3>
                        <p class="text-center">Feedback</p>
                        <div class="star text-center">
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                        </div>
                        <h2>$200 <span><li class="fa-solid fa-cart-shopping"></li></span></h2>
                    </div>
                </div>
                <div class="card">
                    <div class="card-img">
                        <img src="./images/p6.png" alt="">
                    </div>
                    <div class="card-body">
                        <h3 class="text-center">Laptop</h3>
                        <p class="text-center">Feedback</p>
                        <div class="star text-center">
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                        </div>
                        <h2>$200 <span><li class="fa-solid fa-cart-shopping"></li></span></h2>
                    </div>
                </div>
                <div class="card">
                    <div class="card-img">
                        <img src="./images/pr9.png" alt="">
                    </div>
                    <div class="card-body">
                        <h3 class="text-center">Laptop</h3>
                        <p class="text-center">Feedback</p>
                        <div class="star text-center">
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                        </div>
                        <h2>$200 <span><li class="fa-solid fa-cart-shopping"></li></span></h2>
                    </div>
                </div>

                <div class="card">
                    <div class="card-img">
                        <img src="./images/t1.png" alt="">
                    </div>
                    <div class="card-body">
                        <h3 class="text-center">Ipad</h3>
                        <p class="text-center">Feedback</p>
                        <div class="star text-center">
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                        </div>
                        <h2>$300 <span><li class="fa-solid fa-cart-shopping"></li></span></h2>
                    </div>
                </div>

            </div>  
        </div>

        <!-- product cards -->

        <!-- product cards -->









        <!-- other cards -->
        <div class="container" id="other-cards">
            <div class="row">
                <div class="col-md-6 py-3 py-md-0">
                    <div class="card">
                        <img src="./images/c1.png" alt="">
                        <div class="card-img-overlay">
                            <h3>Best Laptop</h3>
                            <h5>Latest Collection</h5>
                            <p>Up To 50% Off</p>
                            <button id="shopnow">Shop Now</button>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 py-3 py-md-0">
                    <div class="card">
                        <img src="./images/c2.png" alt="">
                        <div class="card-img-overlay">
                            <h3>Best Headphone</h3>
                            <h5>Latest Collection</h5>
                            <p>Up To 50% Off</p>
                            <button id="shopnow">Shop Now</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- other cards -->







        <!-- banner -->
        <!-- phukien -->
        <div class="block-categories is-desktop">
            <div class="categories-title">
                <h2>
                    <a href="#" class="button__link">PHỤ KIỆN</a>

                </h2>
                <a href="#" class="btn-show-more button__link">Xem tất cả</a>
            </div>
            <div class="categories-content">
                <div class="categories-content-wrapper is-flex">
                    <div class="item-categories-outer">
                        <a href="#" class="button__link item-categories " 
                           style="background-color: rgb(242, 131, 118); background-image:
                           url(&quot;https://cdn2.cellphones.com.vn/insecure/rs:fill:150:0/q:70/plain/https://cellphones.com.vn/media/icons/category/cate-1644.svg&quot;);">
                            <span>Nổi bật</span></a>
                    </div>
                    <div class="item-categories-outer">
                        <a href="#" class="button__link item-categories " style="background-color: rgb(242, 131, 118); background-image:
                           url(&quot;https://cdn2.cellphones.com.vn/insecure/rs:fill:150:0/q:70/plain/https://cellphones.com.vn/media/icons/category/cate-43.svg&quot;);"><span>Phụ kiện Apple</span></a>
                    </div>
                    <div class="item-categories-outer">
                        <a href="#" class="button__link item-categories " style="background-color: rgb(242, 131, 118); background-image: url(&quot;https://cdn2.cellphones.com.vn/insecure/rs:fill:150:0/q:70/plain/https://cellphones.com.vn/media/icons/category/cate-286.svg&quot;);"><span>Dán màn hình</span></a>
                    </div>
                    <div class="item-categories-outer">
                        <a href="#" class="button__link item-categories " style="background-color: rgb(242, 131, 118); background-image: url(&quot;https://cdn2.cellphones.com.vn/insecure/rs:fill:150:0/q:70/plain/https://cellphones.com.vn/media/icons/category/cate-663.svg&quot;);"><span>Chuột, bàn phím</span></a>
                    </div>

                    <div class="item-categories-outer">
                        <a href="#" class="button__link item-categories " style="background-color: rgb(242, 131, 118); background-image: url(&quot;https://cdn2.cellphones.com.vn/insecure/rs:fill:150:0/q:70/plain/https://cellphones.com.vn/media/icons/category/cate-122.svg&quot;);"><span>Pin dự phòng</span></a>
                    </div>
                    <div class="item-categories-outer">
                        <a href="#" class="button__link item-categories " style="background-color: rgb(242, 131, 118); background-image: url(&quot;https://cdn2.cellphones.com.vn/insecure/rs:fill:150:0/q:70/plain/https://cellphones.com.vn/media/icons/category/cate-114.svg&quot;);"><span>Cáp, sạc</span></a>          
                    </div>
                    <div class="item-categories-outer">
                        <a href="#" class="button__link item-categories " style="background-color: rgb(242, 131, 118); background-image: url(&quot;https://cdn2.cellphones.com.vn/insecure/rs:fill:150:0/q:70/plain/https://cellphones.com.vn/media/icons/category/cate-44.svg&quot;);"><span>Phụ kiện Laptop</span></a>          </div>
                </div>


            </div>
        </div>


        <!-- phukien -->
        <!-- banner -->








        <!-- product cards -->

        <!-- other cards -->

        <!-- offer -->
        <div class="container" id="offer">
            <div class="row">
                <div class="col-md-3 py-3 py-md-0">
                    <i class="fa-solid fa-cart-shopping"></i>
                    <h3>Free Shipping</h3>
                    <p>On order over $1000</p>
                </div>
                <div class="col-md-3 py-3 py-md-0">
                    <i class="fa-solid fa-rotate-left"></i>
                    <h3>Free Returns</h3>
                    <p>Within 30 days</p>
                </div>
                <div class="col-md-3 py-3 py-md-0">
                    <i class="fa-solid fa-truck"></i>
                    <h3>Fast Delivery</h3>
                    <p>World Wide</p>
                </div>
                <div class="col-md-3 py-3 py-md-0">
                    <i class="fa-solid fa-thumbs-up"></i>
                    <h3>Big choice</h3>
                    <p>Of products</p>
                </div>
            </div>
        </div>
        <!-- offer -->






        <!-- newslater -->
        <!-- newslater -->

        <div class="form-popup" id="myForm">
            <form action="/action_page.php" class="form-container">
                <h1 style="font-size: xx-large; margin-bottom: 2%;">Login</h1>

                <label for="email"><b>Email</b></label>
                <input type="text" placeholder="Enter Email" name="email" required>

                <label for="psw"><b>Password</b></label>
                <input type="password" placeholder="Enter Password" name="psw" required>

                <button type="submit" class="btn">Login</button>
                <button type="button" class="btn cancel" onclick="closeForm()">Close</button>
                <div class="text-center">
                    <p>Not a member? <a href="register">Register</a></p>
                    <p>or sign up with:</p>
                    <div style="margin-top: 5%">
                        <button type="button" class="btn btn-link btn-floating mx-1">
                            <i class="fab fa-facebook-f"></i>
                        </button>

                        <button type="button" class="btn btn-link btn-floating mx-1">
                            <i class="fab fa-google"></i>
                        </button>

                        <button type="button" class="btn btn-link btn-floating mx-1">
                            <i class="fab fa-twitter"></i>
                        </button>

                        <button type="button" class="btn btn-link btn-floating mx-1">
                            <i class="fab fa-github"></i>
                        </button>
                    </div>
                </div>
            </form>

        </div>  




        <!-- footer -->
        <footer id="footer">
            <div class="footer-top">
                <div class="container">
                    <div class="row">

                        <div class="col-lg-3 col-md-6 footer-contact">
                            <h3>Electronic Shop</h3>
                            <p>
                                số 1 Lê Thánh Tông <br>
                                Quận Ngô Quyền <br>
                                Thành Phố Hải Phòng <br>
                            </p>
                            <strong style="color: #ffffff;">Phone:</strong> +84565021612 <br>
                            <strong style="color: #ffffff;">Email:</strong> nguyenmanhhieu267@gmail.com <br>
                        </div>

                        <div class="col-lg-3 col-md-6 footer-links">
                            <h4>Usefull Links</h4>
                            <ul>
                                <li><a href="#">Home</a></li>
                                <li><a href="#">About Us</a></li>
                                <li><a href="#">Services</a></li>
                                <li><a href="#">Terms of service</a></li>
                                <li><a href="#">Privacy policey</a></li>
                            </ul>
                        </div>





                        <div class="col-lg-3 col-md-6 footer-links">
                            <h4>Our Services</h4>

                            <ul>
                                <li><a href="#">Laptop</a></li>
                                <li><a href="#">Iphone</a></li>
                                <li><a href="#">Headphone</a></li>
                                <li><a href="#">Watch</a></li>
                                <li><a href="#">Accessory</a></li>
                            </ul>
                        </div>

                        <div class="col-lg-3 col-md-6 footer-links">
                            <h4>Our Social Networks</h4>
                            <p>Feedback</p>

                            <div class="socail-links mt-3">
                                <a href="#"><i class="fa-brands fa-twitter"></i></a>
                                <a href="#"><i class="fa-brands fa-facebook-f"></i></a>
                                <a href="#"><i class="fa-brands fa-instagram"></i></a>
                                <a href="#"><i class="fa-brands fa-skype"></i></a>
                                <a href="#"><i class="fa-brands fa-linkedin"></i></a>
                            </div>

                        </div>

                    </div>
                </div>
            </div>
            <hr>
            <div class="container py-4">
                <div class="copyright">
                    &copy; Copyright <strong><span>Electronic Shop</span></strong>. All Rights Reserved
                </div>
            </div>
        </footer>
        <!-- footer -->







        <a href="#" class="arrow"><i><img src="./images/arrow.png" alt=""></i></a>













        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="./assets/js/app.js"></script>
        <script src="./assets/js/product_card.js"></script>
        <script src="./assets/js/menu.js"></script>
    </body>
</html>