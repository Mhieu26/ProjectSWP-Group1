<%-- 
    Document   : checkout
    Created on : 19-02-2024, 09:35:50
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
            User user = (User)session.getAttribute("User");
        %>
        <div class="page-wrapper">
            <div class="checkout shopping">
                <div class="container">
                    <div class="row">
                        <div class="col-md-8">
                            <div class="block billing-details">
                                <h4 class="widget-title">Billing Details</h4>
                                <form class="checkout-form">
                                    <div class="form-group">
                                        <label for="name">Full Name</label>
                                        <input type="text" class="form-control" id="name" name="name" placeholder="" value="<%= user.getName()%>">
                                    </div>
                                    <div class="form-group">
                                        <label for="address">Address</label>
                                        <input type="text" class="form-control" id="address" name="address" placeholder="" value="<%= user.getAddress() != null ? user.getAddress() : ""%>">
                                    </div>
                                    <div class="form-group">
                                        <label for="phone">Phone number</label>
                                        <input type="tel" class="form-control" id="phone" name="phone" value="<%= user.getPhone() != null ? user.getPhone() : ""%>" onchange="validatePhone(this.value)" >
                                    </div>
                                    <div id="phone-result" style="font-size: smaller; color: red; height: fit-content;"></div>
                                    <div class="form-group">
                                        <label for="email">Email</label>
                                        <input type="text" class="form-control" id="email" name="email" placeholder="" value="<%= user.getEmail()%>" onchange="validateEmail(this.value)">
                                    </div>
                                    <div id="email-result" style="font-size: smaller; color: red; height: fit-content;"></div>
                                </form>
                            </div>
                            <div class="block">
                                <h4 class="widget-title">Payment Method</h4>
                                <p>Credit Cart Details (Secure payment)</p>
                                <div class="checkout-product-details">
                                    <div class="payment">
                                        <div class="card-details">
                                            <form  class="checkout-form">
                                                <div class="form-group">
                                                    <label for="card-number">Card Number <span class="required">*</span></label>
                                                    <input  id="card-number" class="form-control"   type="tel" placeholder="•••• •••• •••• ••••">
                                                </div>
                                                <div class="form-group half-width padding-right">
                                                    <label for="card-expiry">Expiry (MM/YY) <span class="required">*</span></label>
                                                    <input id="card-expiry" class="form-control" type="tel" placeholder="MM / YY">
                                                </div>
                                                <div class="form-group half-width padding-left">
                                                    <label for="card-cvc">Card Code <span class="required">*</span></label>
                                                    <input id="card-cvc" class="form-control"  type="tel" maxlength="4" placeholder="CVC" >
                                                </div>
                                                <a href="confirmation.html" class="btn btn-main mt-20">Place Order</a >
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="product-checkout-details">
                                <div class="block">
                                    <h4 class="widget-title">Order Summary</h4>
                                    <% for (CartItem item : cart.getItems()){ %>
                                    <div class="media product-card">
                                        <a class="pull-left" href="#">
                                            <img class="media-object" src="<%= item.getSource() %>" alt="Image" />
                                        </a>
                                        <div class="media-body">
                                            <h4 class="media-heading"><a href="#"><%= item.getName() %></a></h4>
                                            <p class="price"> <%= item.getQuantity() %> x 
                                                <% 
                                                            double price = item.getPrice()/item.getQuantity();
                                                            double total = cart.getTotal();
                                                            DecimalFormat decimalFormat = new DecimalFormat("#,##0.00");
                                                            String formattedPrice = decimalFormat.format(price);
                                                            formattedPrice = formattedPrice.replaceAll("\\.00$", "");
                                                            out.print(formattedPrice); 
                                                %>
                                            </p>

                                        </div>
                                    </div>
                                    <%}%>
                                    <div class="discount-code">
                                        <p>Have a discount ? <a data-toggle="modal" data-target="#coupon-modal" href="#!">enter it here</a></p>
                                    </div>
                                    <ul class="summary-prices">
                                        <li>
                                            <span>Subtotal:</span>
                                            <span class="price">
                                                <% 
                                                    double total = cart.getTotal();
                                                    DecimalFormat decimalFormat = new DecimalFormat("#,##0.00");
                                                    out.print(decimalFormat.format(total).replaceAll("\\.00$", ""));                                                    
                                                %>
                                            </span>
                                        </li>
                                        <li>
                                            <span>Shipping:</span>
                                            <span>Free</span>
                                        </li>
                                    </ul>
                                    <div class="summary-total">
                                        <span>Total</span>
                                        <span><% out.print(decimalFormat.format(total).replaceAll("\\.00$", ""));  %></span>
                                    </div>
                                    <div class="verified-icon">
                                        <img src="https://demo.themefisher.com/aviato-bootstrap/images/shop/verified.png">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal -->
        <div class="modal fade" id="coupon-modal" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-body">
                        <form>
                            <div class="form-group">
                                <input class="form-control" type="text" placeholder="Enter Coupon Code">
                            </div>
                            <button type="submit" class="btn btn-main">Apply Coupon</button>
                        </form>
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
