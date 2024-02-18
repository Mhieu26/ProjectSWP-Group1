<%-- 
    Document   : cart
    Created on : 31-01-2024, 15:11:52
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Products, Model.User, Model.Image, Model.Cart, Model.CartItem"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.text.DecimalFormat" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>LaViBan | E-commerce</title>
        <base href="${pageContext.request.contextPath}">
        <!-- Mobile Specific Metas
        ================================================== -->
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="Construction Html5 Template">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=5.0">
        <meta name="author" content="Themefisher">
        <meta name="generator" content="Themefisher Constra HTML Template v1.0">

        <!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="images/favicon.png" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
        <link rel="stylesheet" href="./assets/css/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.min.css" integrity="sha512-17EgCFERpgZKcm0j0fEq1YCJuyAWdz9KUtv1EjVuaOz8pDnh/0nZxmU6BBXwaaxqoi9PQXnRWqlcDB027hgv9A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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
        <link data-n-head="ssr" rel="icon" type="image/x-icon" href="https://cdn2.cellphones.com.vn/200x/media/favicon/default/logo-cps.png">
        <link rel="stylesheet" href="SWP/assets/css/testpro4.css">
        <link rel="stylesheet" href="SWP/assets/css/right_banner.css">
        <link rel="stylesheet" href="SWP/assets/css/block-slider.css">
        <link rel="stylesheet" href="SWP/assets/css/phukien.css">
        <link rel="shortcut icon" type="image/x-icon" href="images/favicon.png" />

        <!-- Themefisher Icon font -->
        <link rel="stylesheet" href="SWP/assets/plugins/themefisher-font/style.css">
        <!-- bootstrap.min css -->
        <link rel="stylesheet" href="SWP/assets/plugins/bootstrap/css/bootstrap.min.css">

        <!-- Animate css -->
        <link rel="stylesheet" href="SWP/assets/plugins/animate/animate.css">
        <!-- Slick Carousel -->
        <link rel="stylesheet" href="SWP/assets/plugins/slick/slick.css">
        <link rel="stylesheet" href="SWP/assets/plugins/slick/slick-theme.css">

        <!-- Main Stylesheet -->
        <link rel="stylesheet" href="SWP/assets/css/style1.css">


        <!-- link for google login -->
        <meta name="google-signin-client_id"
              content="84108154100-e5i8n0lqnoe59v0rlm5q4aki8chjuth4.apps.googleusercontent.com">
    </head>

    <body id="body">

        <%
            Cart cart = (Cart)request.getAttribute("Cart");
        %>

        <section class="page-header">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="content">
                            <h1 class="page-name">Cart</h1>
                            <ol class="breadcrumb">
                                <li><a href="SWP/home">Home</a></li>
                                <li class="active">cart</li>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>
        </section>



        <div class="page-wrapper">
            <div class="cart shopping">
                <div class="container">
                    <div class="row">
                        <div class="col-md-8 col-md-offset-2">
                            <div class="block">
                                <% if(!cart.getItems().isEmpty()) {%>
                                <div class="product-list">
                                    <form method="post">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th class="" style="text-align: center">Item Name</th>
                                                    <th class="" style="text-align: center">Quantity</th>
                                                    <th class="" style="text-align: center">Price</th>                                                    
                                                    <th class="" style="text-align: center">Actions</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <% for (CartItem item : cart.getItems()){ %>
                                                <tr class="">
                                                    <td class="">
                                                        <div class="product-info">
                                                            <img width="80" src="<%= item.getSource() %>" alt="thumbnail" />
                                                            <a href="#!"><%= item.getName() %></a>
                                                        </div>
                                                    </td>
                                                    <input type="hidden" id="item-productid" value="<%= item.getProductid()%>">
                                                    <input type="hidden" id="item-id" value="<%= item.getId()%>">
                                                    <td class="" style="width: 10%"><input id="item-quantity" type="number" min="1" value="<%= item.getQuantity() %>" style="width: 80%;" onchange="updateQuantity(<%= item.getId() %>,this.value)"></td>
                                                    <td class="">
                                                        <% 
                                                            double price = item.getPrice();
                                                            DecimalFormat decimalFormat = new DecimalFormat("#,##0.00");
                                                            String formattedPrice = decimalFormat.format(price);
                                                            formattedPrice = formattedPrice.replaceAll("\\.00$", "");
                                                            out.print(formattedPrice); 
                                                        %>
                                                    </td>
                                                    <td class="">
                                                        <a class="product-remove" href="SWP/deleteitem?cartItemId=<%= item.getId() %>">Remove</a>
                                                    </td>
                                                </tr>
                                                <%}%>

                                            </tbody>
                                        </table>
                                        <a href="checkout.html" class="btn btn-main pull-right">Checkout</a>
                                    </form>
                                </div>
                                <%}else{%>
                                <div class="block text-center">
                                    <i class="fa-light fa-face-confused"></i>
                                    <h2 class="text-center">Your cart is empty!</h2>
                                    <a href="/SWP/home" class="btn btn-main mt-20">Continue Shopping</a>
                                </div>
                                <%}%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>



        <!-- 
    Essential Scripts
    =====================================-->

        <!-- Main jQuery -->
        <script src="SWP/assets/plugins/jquery/dist/jquery.min.js"></script>
        <!-- Bootstrap 3.1 -->
        <script src="SWP/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
        <!-- Bootstrap Touchpin -->
        <script src="SWP/assets/plugins/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.min.js"></script>
        <!-- Instagram Feed Js -->
        <script src="SWP/assets/plugins/instafeed/instafeed.min.js"></script>
        <!-- Video Lightbox Plugin -->
        <script src="SWP/assets/plugins/ekko-lightbox/dist/ekko-lightbox.min.js"></script>
        <!-- Count Down Js -->
        <script src="SWP/assets/plugins/syo-timer/build/jquery.syotimer.min.js"></script>

        <!-- slick Carousel -->
        <script src="SWP/assets/plugins/slick/slick.min.js"></script>
        <script src="SWP/assets/plugins/slick/slick-animation.min.js"></script>

        <!-- Google Mapl -->
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCC72vZw-6tGqFyRhhg5CkF2fqfILn2Tsw"></script>
        <script type="text/javascript" src="SWP/assets/plugins/google-map/gmap.js"></script>

        <!-- Main Js File -->
        <script src="SWP/assets/js/script.js"></script>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script src="https://apis.google.com/js/platform.js" async defer></script>        
        <script src="SWP/assets/js/app.js"></script>
    </body>
</html>
