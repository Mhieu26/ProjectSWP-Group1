<%-- 
    Document   : blog
    Created on : Jan 22, 2024, 8:56:10 AM
    Author     : toanl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*" %>
<!DOCTYPE html>
<html>
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
        <link rel="stylesheet" href="./assets/css/testpro4.css">
        <link rel="stylesheet" href="./assets/css/right_banner.css">
        <link rel="stylesheet" href="./assets/css/block-slider.css">
        <!-- fonts links -->
        <style>
            .right-align {
                text-align: right;
            }
            .frame {
                border: 1px solid black;
                padding: 5px;
                box-shadow: 5px 5px 5px grey;
                }
            </style>
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
                                <a class="nav-link active" aria-current="page" href="homepage.jsp">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Product</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="blog">Blog</a>
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
                    </div>
                </div>
            </nav>
            <!-- navbar -->








            <div class="container" id="about">
                <h3>Tin tức cập nhật</h3>
                <hr>
                <p class="right-align"><%
                    Date date = new Date();
                    SimpleDateFormat formatter = new SimpleDateFormat("HH:mm dd/MM/yyyy");
                    String formattedDate = formatter.format(date);
                    out.println(formattedDate);
                    %></p>
                <div class="frame">
                    <div class="row" style="margin-top: 20px;">
                        <div class="col-md-5 py-3 py-md-0">
                            <div class="card">
                                <img src="https://cdn2.cellphones.com.vn/1200x400/https://cdn.sforum.vn/sforum/wp-content/uploads/2024/01/samsung-galaxy-s23-series.jpeg" alt=""  width="450" height="200">
                            </div>
                        </div>
                        <div class="col-md-7 py-3 py-md-0">
                            <h2>Những sản phẩm thành công và thất bại của Samsung trong năm 2023</h2>
                            <br>
                            <a href="https://cellphones.com.vn/sforum/nhung-san-pham-thanh-cong-va-that-bai-cua-samsung-trong-nam-2023"><button>Xem thêm</button></a>
                        </div>
                    </div>
                </div>
                <br><br><br>
                <div class="frame">
                    <div class="row" style="margin-top: 20px;">
                        <div class="col-md-5 py-3 py-md-0">
                            <div class="card">
                                <img src="https://cdn2.cellphones.com.vn/350x200/https://cdn.sforum.vn/sforum/wp-content/uploads/2024/01/Redmi-Note-13-Note-13-Pro-cover.jpg" alt=""  width="450" height="200">
                            </div>
                        </div>
                        <div class="col-md-7 py-3 py-md-0">
                            <h2>So sánh Redmi Note 13 4G và Redmi Note 13 Pro 5G: Có gì khác biệt? </h2>
                            <br>
                            <a href="https://cellphones.com.vn/sforum/so-sanh-redmi-note-13-4g-va-redmi-note-13-pro-5g"><button>Xem thêm</button></a>
                        </div>
                    </div>
                </div>
            </div>









            <!-- offer -->

            <!-- offer -->






            <!-- newslater -->
            <!-- newslater -->






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
                                <strong>Phone:</strong> +84565021612 <br>
                                <strong>Email:</strong> nguyenmanhhieu267@gmail.com <br>
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
                                <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Quia, quibusdam.</p>

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

        </body>
    </html>


