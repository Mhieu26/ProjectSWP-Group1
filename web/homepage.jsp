<%-- 
    Document   : homepage
    Created on : Jan 15, 2024, 10:44:46 AM
    Author     : toanl
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Products, Model.User, Model.Image, Model.Cart, Model.CartItem"%>
<%@page import="Dao.ProductsDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.text.DecimalFormat" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>LaViBan</title>
        <link rel="stylesheet" href="./assets/css/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.min.css" integrity="sha512-17EgCFERpgZKcm0j0fEq1YCJuyAWdz9KUtv1EjVuaOz8pDnh/0nZxmU6BBXwaaxqoi9PQXnRWqlcDB027hgv9A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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
        <link rel="stylesheet" href="./assets/css/style1.css">
        <link href="https://fonts.googleapis.com/css2?family=Jost:wght@300;400;500&family=Lato:wght@300;400;700&display=swap" rel="stylesheet">
        <link data-n-head="ssr" rel="icon" type="image/x-icon" href="https://cdn2.cellphones.com.vn/200x/media/favicon/default/logo-cps.png">
        <link rel="stylesheet" href="./assets/css/testpro4.css">
        <link rel="stylesheet" href="./assets/css/right_banner.css">
        <link rel="stylesheet" href="./assets/css/block-slider.css">
        <link rel="stylesheet" href="./assets/css/phukien.css">
        <link rel="shortcut icon" type="image/x-icon" href="images/favicon.png" />


        <!-- Themefisher Icon font -->
        <link rel="stylesheet" href="./assets/plugins/themefisher-font/style.css">
        <!-- bootstrap.min css -->
        <link rel="stylesheet" href="./assets/plugins/bootstrap/css/bootstrap.min.css">

        <!-- Animate css -->
        <link rel="stylesheet" href="./assets/plugins/animate/animate.css">
        <!-- Slick Carousel -->
        <link rel="stylesheet" href="./assets/plugins/slick/slick.css">
        <link rel="stylesheet" href="./assets/plugins/slick/slick-theme.css">

        <!-- Main Stylesheet -->
        <link rel="stylesheet" href="./assets/css/style1.css">

    </head>
    <body id="body">

        <%
            Image img = (Image)session.getAttribute("avatar");
            String googleAvt = (String)session.getAttribute("GoogleAvatar");
            String avt = (img == null) ? 
                    (googleAvt == null ? "https://static-00.iconduck.com/assets.00/avatar-default-symbolic-icon-479x512-n8sg74wg.png" : googleAvt) 
                    : img.getSource();
            User user = (User)session.getAttribute("User");
        %>
        <!-- top navbar -->
        <!-- top navbar -->

        <!-- navbar -->
        <section class="top-header">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 col-xs-12 col-sm-4">
                        <div class="contact-number">
                            <i class="tf-ion-ios-telephone"></i>
                            <span>0969146075</span>
                        </div>
                    </div>
                    <div class="col-md-4 col-xs-12 col-sm-4">
                        <!-- Site Logo -->
                        <div class="logo text-center">
                            <a href="home">
                                <!-- replace logo here -->
                                <svg width="135px" height="29px" viewBox="0 0 155 29" version="1.1" xmlns="http://www.w3.org/2000/svg"
                                     xmlns:xlink="http://www.w3.org/1999/xlink">
                                <g id="Page-1" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd" font-size="35"
                                   font-family="AustinBold, Austin" font-weight="bold">
                                <g id="Group" transform="translate(-108.000000, -297.000000)" fill="#000000">
                                <text id="AVIATO">
                                <tspan x="108.94" y="325">LaViBan</tspan>
                                </text>
                                </g>
                                </g>
                                </svg>
                            </a>
                        </div>
                    </div> 	
                    <div class="col-md-4 col-xs-12 col-sm-4">
                        <!-- Cart -->
                        <ul class="top-menu text-right list-inline">
                            <li class="dropdown cart-nav dropdown-slide">
                                <a href="#!" id="cart" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown"><i
                                        class="tf-ion-android-cart"></i>Cart</a>

                                <% if(user != null && user.getRole().getId()==1){%>
                                <input type="text" id="userid" value="<%=user.getId()%>" hidden="">
                                <div class="dropdown-menu cart-dropdown" id="cart-popup">
                                    <!-- Cart Item -->
                                    <!-- / Cart Item -->
                                    <!-- Cart Item -->
                                    <!-- / Cart Item -->

                                    <div class="cart-summary">
                                        <span>Total</span>
                                        <span class="total-price">$1799.00</span>
                                    </div>
                                    <ul class="text-center cart-buttons">
                                        <li><a href="cart?userid=<%= user.getId() %>" class="btn btn-small">View Cart</a></li>
                                        <li><a href="checkout?userid=<%= user.getId() %>" class="btn btn-small btn-solid-border">Checkout</a></li>
                                    </ul>
                                </div>
                                <%}%>
                            </li><!-- / Cart -->

                            <!-- Search -->
                            <li class="dropdown search dropdown-slide">
                                <a href="#!" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown"><i
                                        class="tf-ion-ios-search-strong"></i> Search</a>
                                <ul class="dropdown-menu search-dropdown">
                                    <li>
                                        <form action="shop"> <input class="text-input" type="text" placeholder="Search product..." value="${search}" name="search">
                                            <input type="hidden" name="action" value="search">
                                        </form>
                                    </li>
                                </ul>
                            </li><!-- / Search -->
                            <li class="dropdown people dropdown-slide">
                                <a href="#!" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown"><i
                                        class="tf-ion-ios-person-outline"></i> Account</a>
                                <div class="dropdown-menu">
                                    <div class="row">

                                        <!-- Introduction -->						

                                        <!-- Contact -->


                                        <!-- Utility -->

                                        <ul>
                                            <li class="dropdown-header"><%= user != null ? user.getName() : "" %></li>
                                            <li role="separator" class="divider"></li>
                                                <% if(user == null) { %>
                                            <li><a href="login">Login</a></li>
                                            <li><a href="register">Sign up</a></li>
                                            <li><a href="resetpassword">Forget Password</a></li>
                                                <% } else { %>
                                                <% if(user != null) {
                                                    int role = (int)(user.getRole().getId());
                                                    if(role == 2) { %>
                                            <li><a href="adminDashboardController">Admin Manager</a></li>
                                            <li><a href="saledashboard">Sale Manager</a></li>
                                            <li><a href="marketingDashboard">Marketing Manager</a></li>
                                                <% } else if(role == 3 || role == 4) { %>
                                            <li><a href="saledashboard">Sale Manager</a></li>
                                                <% } else if(role == 5) { %>
                                            <li><a href="marketingDashboard">Marketing Manager</a></li>
                                                <% } else if(role == 1) { %>
                                            <li><a href="myorder">My Order</a></li>

                                            <% }
        } %>

                                            <li><a href="userController">User Profile</a></li>
                                            <li><a href="changePassword">Change Password</a></li>
                                            <li><a href="logout">Logout</a></li>
                                                <% } %>
                                        </ul>



                                        <!-- Mega Menu -->

                                    </div><!-- / .row -->
                                </div>
                            </li><!-- / Search -->

                            <!-- Languages -->


                        </ul><!-- / .nav .navbar-nav .navbar-right -->
                    </div>
                </div>
            </div>
        </section>
        <section class="menu">
            <nav class="navbar navigation">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <h2 class="menu-title">Main Menu</h2>
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                                aria-expanded="false" aria-controls="navbar">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>

                    </div><!-- / .navbar-header -->

                    <!-- Navbar Links -->
                    <div id="navbar" class="navbar-collapse collapse text-center">
                        <ul class="nav navbar-nav">

                            <!-- Home -->
                            <li class="dropdown ">
                                <a href="home">Home</a>
                            </li><!-- / Home -->



                            <!-- Elements -->
                            <li class="dropdown dropdown-slide">
                                <a href="shop" >Shop
                                </a>
                            </li><!-- / Elements -->

                            <!-- Elements -->



                            <!-- Pages -->
                            <li class="dropdown dropdown-slide">
                                <a href="#!" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="350"
                                   role="button" aria-haspopup="true" aria-expanded="false">Pages <span
                                        ></span></a>
                                <div class="dropdown-menu">
                                    <div class="row">

                                        <!-- Introduction -->
                                        <div class="col-sm-6 col-xs-12">
                                            <ul>
                                                <li class="dropdown-header">Introduction</li>
                                                <li role="separator" class="divider"></li>
                                                <li><a href="contact.jsp">Contact Us</a></li>
                                                <li><a href="about.jsp">About Us</a></li>
                                            </ul>
                                        </div>

                                        <!-- Contact -->



                                        <!-- Mega Menu -->
                                        <div class="col-sm-6 col-xs-12">
                                            <a href="shop.html">
                                                <img class="img-responsive" src="images/c5.png" alt="menu image" />
                                            </a>
                                        </div>
                                    </div><!-- / .row -->
                                </div><!-- / .dropdown-menu -->
                            </li><!-- / Pages -->




                            <!-- Blog -->
                            <li class="dropdown dropdown-slide">
                                <a href="blog" >Blog
                                </a>

                            </li><!-- / Blog -->


                            <!-- Shop -->

                        </ul><!-- / .nav .navbar-nav -->

                    </div>
                    <!--/.navbar-collapse -->
                </div><!-- / .container -->
            </nav>
        </section>
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
                                                            <a href="http://localhost:9999/SWP/shop?cate=1&action=cate" class="multiple-link">
                                                                <span>Phone </span>
                                                            </a>                                                 
                                                        </div>

                                                    </div>
                                                </div>
                                                <div href="#" target="_self" class="label-menu-tree">
                                                    <a href="http://localhost:9999/SWP/shop?cate=2&action=cate" target="_self" class="label-item">
                                                        <div class="right-content">
                                                            <i class="icons-cate" style="background-image:url(https://cdn2.cellphones.com.vn/x/media/icons/menu/icon-cps-380.svg);"></i>
                                                            <span class="single-link">Laptop</span>
                                                        </div>

                                                    </a>
                                                </div>
                                                <div href="#" target="_self" class="label-menu-tree">
                                                    <a href="http://localhost:9999/SWP/shop?cate=3&action=cate" target="_self" class="label-item">
                                                        <div class="right-content">
                                                            <i class="icons-cate" style="background-image:url(https://cellphones.com.vn/media/icons/menu/icon-cps-220.svg);"></i>
                                                            <span class="single-link">Headphone</span>
                                                        </div>

                                                    </a>
                                                </div>
                                                <div target="_self" class="label-menu-tree">
                                                    <div class="label-item multiple">
                                                        <div class="right-content">
                                                            <i class="icons-cate" style="background-image:url(https://cellphones.com.vn/media/icons/menu/icon-cps-610.svg);"></i>
                                                            <a href="http://localhost:9999/SWP/shop?cate=4&action=cate" class="multiple-link">
                                                                <span>Watch</span>
                                                            </a>
                                                        </div>

                                                    </div>
                                                </div>
                                                <div href="#" target="_self" class="label-menu-tree">
                                                    <a href="http://localhost:9999/SWP/shop?cate=5&action=cate" target="_self" class="label-item">
                                                        <div class="right-content">
                                                            <i class="icons-cate" style="background-image:url(https://cellphones.com.vn/media/icons/menu/icon-cps-30.svg);"></i>
                                                            <span class="single-link">Accessories</span>
                                                        </div>

                                                    </a>
                                                </div>

                                                <div href="blog" target="_self" class="label-menu-tree">
                                                    <a href="blog" target="_self" class="label-item">
                                                        <div class="right-content">
                                                            <i class="icons-cate" style="background-image:url(https://cdn.cellphones.com.vn/media/icons/menu/icon-cps-tech.svg);"></i>
                                                            <span class="single-link">Tech news</span>
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
                                                    <c:forEach items="${sliders}" var="s">
                                                        <div class="swiper-slide">
                                                            <a href="${s.backLink}" class="button__link">
                                                                <img src="${s.image}" width="690" height="300" alt="IPHONE 15&lt;br&gt;Sẵn hàng mua ngay" loading="lazy">
                                                            </a>
                                                        </div>
                                                    </c:forEach>

                                                </div>                                   
                                            </div>
                                            <div class="swiper-pagination"></div>

                                        </div>
                                    </div>
                                    <div class="block-top-home__right-banner">
                                        <div class="right-banner">
                                            <a href="http://localhost:9999/SWP/blogdetail?id=20" class="right-banner__item button__link">
                                                <img src="images/blog3.jpeg" width="690" height="300" alt="SAMSUNG S23 128GB&lt;br&gt;Giảm giá sốc" loading="lazy" class="right-banner__img">
                                            </a>
                                            <a href="http://localhost:9999/SWP/blogdetail?id=21" class="right-banner__item button__link">
                                                <img src="images/blog4.jpg" width="690" height="300" alt="ƯU ĐÃI SINH VIÊN&lt;br&gt;Giảm thêm 5%" loading="lazy" class="right-banner__img">
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









        <div class="products">
            <h1 class="text-center">PRODUCTS</h1>      
        </div>
        <section class="product section bg-gray">
            <div class="container">
                <div class="products-title">
                    <h2>
                        <a href="#" class="button__link">Featured Products</a>

                    </h2>
                    <a href="shop" class="btn-show-more button__link">Views All</a>
                </div>
                <div class="product-list">


                    <% 
              ArrayList<Products> products = (ArrayList<Products>) request.getAttribute("featured");
             ArrayList<Image> thumbnails = (ArrayList<Image>) request.getAttribute("thumbnails");
             for (Products product : products) {
                    %> 
                    <div class="product-item">

                        <div class="product-thumb">
                            <span class="bage">Sale</span>
                            <%  for (Image tn : thumbnails) { %>
                            <%if(product.getId()==tn.getProductId()){ %>
                            <img src="<%= tn.getSource()%>" alt="" class="img-responsive">
                            <% } } %>
                            <!--						<img class="img-responsive" src="images/shop/products/product-2.jpg" alt="product-img" />-->
                            <div class="preview-meta">
                                <ul>
                                    <li>

                                        <a href="shopdetail?id=<%= product.getId()%>&cateid=<%=product.getCategoryid()%>">
                                            <i class="tf-ion-ios-search-strong"></i>
                                        </a>



                                    </li>
                                    <li>
                                        <a href="#" ><i class="tf-ion-ios-heart"></i></a>
                                    </li>
                                    <li>
                                        <a href="addtocart?productid=<%= product.getId()%>&quantity=1"><i class="tf-ion-android-cart"></i></a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="product-content">
                            <h4><a href="shopdetail.jsp"> <%= product.getName()%></a></h4>
                            <div class="price">
                                <span class="onprice"><% 
                                    DecimalFormat decimalFormat = new DecimalFormat("#,##0.00");
      double oldPrice = product.getPrice();
       String formattedDiscountedPrice = decimalFormat.format(oldPrice);
       formattedDiscountedPrice = formattedDiscountedPrice.replaceAll("\\.00$", "");
       out.print(formattedDiscountedPrice);
                                    %>₫</span>
                                <span class="oldprice"><% 
        double price = product.getPrice()+0.1*product.getPrice();
            
        String formattedPrice = decimalFormat.format(price);
        formattedPrice = formattedPrice.replaceAll("\\.00$", "");

        out.print(formattedPrice);
                                    %>₫</span>

                            </div>
                        </div>

                    </div>

                    <% } %>





                    <!-- Modal -->

                </div>
                <ul class="listPage">

                </ul>
            </div>
        </section>

        <!-- product cards -->

        <!-- product cards -->







        <div class="hero-slider">
            <div class="slider-item th-fullpage hero-area" style="background-image: url(images/laptop-la-gi-760x427.jpg);">
                <div class="container">
                    <div class="row">
<<<<<<< HEAD
                        <div class="col-lg-8 text-center">
                            <p data-duration-in=".3" data-animation-in="fadeInUp" data-delay-in=".1">10% Off</p>
                            <h1 data-duration-in=".3" data-animation-in="fadeInUp" data-delay-in=".5">New Year<br> Sale</h1>
                            <a data-duration-in=".3" data-animation-in="fadeInUp" data-delay-in=".8" class="btn" href="shop">Shop Now</a>
=======
                        <div class="col-md-12">
                            <ul class="social-media">
                                <li>
                                    <a href="https://www.facebook.com/profile.php?id=100012285902227">
                                        <i class="tf-ion-social-facebook"></i>
                                    </a>
                                </li>
                                <li>
                                    <a href="https://gitlab.com/Mhieu26/group1-se1751">
                                        <i class="tf-ion-social-github"></i>
                                    </a>
                                </li>
                                <li>
                                    <a href="mailto:nguyenmanhhieu267@gmail.com">
                                        <i class="tf-ion-social-google-outline"></i>
                                    </a>
                                </li>
                            </ul>
                            <ul class="footer-menu text-uppercase">
                                <li>
                                    <a href="contact.jsp">CONTACT</a>
                                </li>
                                <li>
                                    <a href="shop">SHOP</a>
                                </li>
                                <li>
                                    <a href="blog">Blog</a>
                                </li>
                                <li>
                                    <a href="about.jsp">About</a>
                                </li>
                            </ul>
                            <p class="copyright-text">Copyright &copy;2021, Designed &amp; Developed by Themefisher</p>
>>>>>>> 97052c4dff9ed5044435cf0c8b2aa29eaff6e3bd
                        </div>
                    </div>
                </div>
            </div>
            <div class="slider-item th-fullpage hero-area" style="background-image: url(images/galaxy-watch6-kv-pc.jpg);">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8 text-left">
                            <p data-duration-in=".3" data-animation-in="fadeInUp" data-delay-in=".1">10% Off</p>
                            <h1 data-duration-in=".3" data-animation-in="fadeInUp" data-delay-in=".5">New Year <br>Sale</h1>
                            <a data-duration-in=".3" data-animation-in="fadeInUp" data-delay-in=".8" class="btn" href="shop">Shop Now</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="slider-item th-fullpage hero-area" style="background-image: url(images/iphone__ky2k6x5u6vue_og.png);">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8 text-right">
                            <p data-duration-in=".3" data-animation-in="fadeInUp" data-delay-in=".1">10% Off</p>
                            <h1 data-duration-in=".3" data-animation-in="fadeInUp" data-delay-in=".5">New Year <br>Sale</h1>
                            <a data-duration-in=".3" data-animation-in="fadeInUp" data-delay-in=".8" class="btn" href="shop">Shop Now</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- other cards -->
        <!--        <div class="container" id="other-cards">
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
                </div>-->
        <!-- other cards -->







        <!-- banner -->
        <!-- phukien -->
        <div class="block-categories is-desktop">
            <div class="categories-title">
                <h2>
                    <a href="#" class="button__link">PHỤ KIỆN</a>

                </h2>
                <a href="shop?cate=5&action=cate" class="btn-show-more button__link">Xem tất cả</a>
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

        <footer class="footer section text-center">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <ul class="social-media">
                            <li>
                                <a href="https://www.facebook.com/profile.php?id=100012285902227">
                                    <i class="tf-ion-social-facebook"></i>
                                </a>
                            </li>
                            <li>
                                <a href="https://gitlab.com/Mhieu26/group1-se1751">
                                    <i class="tf-ion-social-github"></i>
                                </a>
                            </li>
                            <li>
                                <a href="mailto:nguyenmanhhieu267@gmail.com">
                                    <i class="tf-ion-social-google-outline"></i>
                                </a>
                            </li>
                        </ul>
                        <ul class="footer-menu text-uppercase">
                            <li>
                                <a href="contact">CONTACT</a>
                            </li>
                            <li>
                                <a href="shop">SHOP</a>
                            </li>
                            <li>
                                <a href="blog">Blog</a>
                            </li>
                            <li>
                                <a href="about.jsp">About</a>
                            </li>
                        </ul>
                        <p class="copyright-text">Copyright &copy;2021, Designed &amp; Developed by Themefisher</p>
                    </div>
                </div>
            </div>
        </footer>




        <!-- footer -->







        <a href="#" class="arrow"><i><img src="./images/arrow.png" alt=""></i></a>











        <script src="./assets/plugins/jquery/dist/jquery.min.js"></script>

        <script src="./assets/plugins/bootstrap/js/bootstrap.min.js"></script>

        <script src="./assets/plugins/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.min.js"></script>

        <script src="./assets/plugins/instafeed/instafeed.min.js"></script>

        <script src="./assets/plugins/ekko-lightbox/dist/ekko-lightbox.min.js"></script>
        <script src="./assets/plugins/syo-timer/build/jquery.syotimer.min.js"></script>

        <script src="./assets/plugins/slick/slick.min.js"></script>
        <script src="./assets/plugins/slick/slick-animation.min.js"></script>


        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCC72vZw-6tGqFyRhhg5CkF2fqfILn2Tsw"></script>
        <script type="text/javascript" src="./assets/plugins/google-map/gmap.js"></script>


        <script src="./assets/js/script.js"></script>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script src="./assets/js/app.js"></script>
        <script src="./assets/js/product_card.js"></script>
        <script src="./assets/js/menu.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js" integrity="sha512-HGOnQO9+SP1V92SrtZfjqxxtLmVzqZpjFFekvzZVWoiASSQgSr4cw9Kqd2+l8Llp4Gm0G8GIFJ4ddwZilcdb8A==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

    </body>
</html>