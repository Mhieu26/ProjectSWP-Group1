<%-- 
    Document   : about
    Created on : Jan 16, 2024, 6:32:09 PM
    Author     : toanl
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Products, Model.User, Model.Image,Model.Category,Model.Specification,Model.Feedback"%>
<%@page import="Dao.ProductsDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.Timestamp" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>LaViBAn</title>
        <link rel="stylesheet" href="/SWP/assets/css/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
        <!-- bootstrap links -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <!-- bootstrap links -->
        <!-- fonts links -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Merriweather&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="/SWP/assets/css/testpro4.css">
        <link rel="stylesheet" href="/SWP/assets/css/right_banner.css">
        <link rel="stylesheet" href="/SWP/assets/css/block-slider.css">
        <link rel="stylesheet" href="/SWP/assets/css/phukien.css">
        <link rel="shortcut icon" type="image/x-icon" href="/SWP/images/favicon.png" />
        <link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet'>

        <!-- Themefisher Icon font -->
        <link rel="stylesheet" href="/SWP/assets/plugins/themefisher-font/style.css">
        <!-- bootstrap.min css -->
        <link rel="stylesheet" href="/SWP/assets/plugins/bootstrap/css/bootstrap.min.css">

        <!-- Animate css -->
        <link rel="stylesheet" href="/SWP/assets/plugins/animate/animate.css">
        <!-- Slick Carousel -->
        <link rel="stylesheet" href="/SWP/assets/plugins/slick/slick.css">
        <link rel="stylesheet" href="/SWP/assets/plugins/slick/slick-theme.css">

        <!-- Main Stylesheet -->
        <link rel="stylesheet" href="/SWP/assets/css/style1.css">
        <!-- fonts links -->
    </head>
    <body>

        <!-- top navbar -->
        <!-- top navbar -->
        <%
            User user = (User)session.getAttribute("User");
        %>
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

                                <% if(user != null){%>
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
                                        <form action="post"><input type="search" class="form-control" placeholder="Search..."></form>
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
                                            <li class="dropdown-header"><%=user != null ? user.getName() : ""%></li>
                                            <li role="separator" class="divider"></li>
                                                <% if(user == null){ %>
                                            <li><a href="login">Login</a></li>
                                            <li><a href="register">Sign up</a></li>
                                            <li><a href="resetpassword">Forget Password</a></li>
                                                <%}else {%>
                                            <li><a href="userController">User Profile</a></li>
                                            <li><a href="changePassword">Change Password</a></li>
                                            <li><a href="logout">Logout</a></li>
                                                <%}%>
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
                                <a href="/SWP/home">Home</a>
                            </li><!-- / Home -->


                            <!-- Elements -->
                            <li class="dropdown dropdown-slide">
                                <a href="shop" >Shop
                                </a>
                            </li><!-- / Elements -->


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
                                            <a href="shop">
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

        <section class="single-product">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <ol class="breadcrumb">
                            <li><a href="home">Home</a></li>
                            <li><a href="shop">Shop</a></li>
                            <li class="active">Single Product</li>
                        </ol>
                    </div>

                </div>

                <% 
                  
                           ArrayList<Image> details = (ArrayList<Image>) request.getAttribute("detail");
                           Products products = (Products) request.getAttribute("product");
                         
                      
                                
                %> 

                <div class="row mt-20">

                    <div class="col-md-8">

                        <div class="single-product-slider">

                            <div id='carousel-custom' class='carousel slide' data-ride='carousel'>

                                <div class='carousel-outer'>

                                    <!-- me art lab slider -->

                                    <div class='carousel-inner '>
                                        <div class="image-slider">
                                            <%  for (Image tn : details) { %>
                                            <%if(products.getId()==tn.getProductId()){ %>
                                            <div class='image-item'>
                                                <div class="item">
                                                    <img src="<%= tn.getSource()%>" alt='' data-zoom-image="<%= tn.getSource()%>" />
                                                </div>


                                            </div>

                                            <% } } %>  

                                        </div>
                                    </div>


                                    <!-- sag sol -->


                                </div>


                                <!-- thumb -->


                            </div>

                        </div>

                    </div>

                    <div class="col-md-4">
                        <div class="single-product-details">
                            <h2><%=products.getName()%></h2>
                            <div class="price">
                                <span class="onprice"><% 
    DecimalFormat decimalFormat = new DecimalFormat("#,##0.00");
           double oldPrice = products.getPrice();
            String formattedDiscountedPrice = decimalFormat.format(oldPrice);
            formattedDiscountedPrice = formattedDiscountedPrice.replaceAll("\\.00$", "");
            out.print(formattedDiscountedPrice);
                                    %>₫</span>
                                <span class="oldprice"><% 
         double price = products.getPrice()+0.1*products.getPrice();
            
            String formattedPrice = decimalFormat.format(price);
            formattedPrice = formattedPrice.replaceAll("\\.00$", "");

            out.print(formattedPrice);
                                    %>₫</span>

                            </div>



                            <% if(products.getCategoryid()==1){ %>
                            <div class="color-swatches">
                                <span>Color:</span>
                                <div class="colors">
                                    <form action="" class="form">
                                        <div class="select-color">
                                            <label for="red">
                                                <input type="radio" name="color" id="red">
                                                <span class="color-1"></span>
                                            </label>
                                            <label for="green">
                                                <input type="radio" name="color" id="green">
                                                <span class="color-2"></span>
                                            </label>
                                            <label for="blue">
                                                <input type="radio" name="color" id="blue">
                                                <span class="color-3"></span>
                                            </label>
                                            <label for="pink">
                                                <input type="radio" name="color" id="pink">
                                                <span class="color-4"></span>
                                            </label>

                                        </div>
                                    </form>
                                </div>
                            </div>

                            <div class="product-quantity">
                                <span>Quantity:</span>
                                <div class="product-quantity-slider">
                                    <input id="product-quantity" type="number" value=1 min="1"  name="product-quantity">
                                </div>
                            </div>
                            <% }else{%>
                            <div class="product-quantity">
                                <span>Quantity:</span>
                                <div class="product-quantity-slider">
                                    <input id="product-quantity" type="number" value=1 min="1" name="product-quantity">
                                </div>
                            </div>
                            <%}%>
                            <!--                            <div class="product-category">
                                                            <span>Categories:</span>
                                                            <ul>
                                                                <li><a href="product-single.html">Products</a></li>
                                                                <li><a href="product-single.html">Soap</a></li>
                                                            </ul>
                                                        </div>-->
                            <input type="text" id="productid-addtocart" value="<%= products.getId()%>" hidden="">
                            <a href="addtocart?productid=<%= products.getId()%>&quantity=1" id="href-addtocart" class="btn btn-main mt-20">Add To Cart</a>

                            <div class="cps-block-technicalInfo mb-3 ml-3 px-3 pt-3 pb-1">

                                <div class="is-flex is-justify-content-space-between is-align-items-center">
                                    <h2 class="title is-6 mb-3">Specifications</h2> 
                                </div> 

                                <ul class="technical-content">
                                    <% 
                  
ArrayList<Specification> list = (ArrayList<Specification>) request.getAttribute("spec");
         
                         
for(Specification s : list){
                                
                                    %> 
                                    <li class="technical-content-item is-flex is-align-items-center is-justify-content-space-between p-2">
                                        <p><%=s.getName()%></p> 
                                        <div style="font-family: Poppins, sans-serif;"><%=s.getValue()%></div></li>
                                        <% }%>
                                </ul>




                            </div>
                        </div>
                    </div>

                </div>

                <div class="container">
                    <div class="products-title">
                        <h2>
                            <a href="#" class="button__link">Related Products</a>

                        </h2>

                    </div>
                    <div class="products-cards">


                        <% 
                  ArrayList<Products> categories = (ArrayList<Products>) request.getAttribute("categories");
                 ArrayList<Image> thumbnails = (ArrayList<Image>) request.getAttribute("thumbnails");
                 for (Products product : categories) {
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
                                       
          double oldPrice1 = product.getPrice();
           String formattedDiscountedPrice1 = decimalFormat.format(oldPrice1);
           formattedDiscountedPrice1 = formattedDiscountedPrice1.replaceAll("\\.00$", "");
           out.print(formattedDiscountedPrice1);
                                        %>₫</span>
                                    <span class="oldprice"><% 
            double price1 = product.getPrice()+0.1*product.getPrice();
            
            String formattedPrice1 = decimalFormat.format(price);
            formattedPrice1 = formattedPrice.replaceAll("\\.00$", "");

            out.print(formattedPrice1);
                                        %>₫</span>

                                </div>
                            </div>

                        </div>

                        <% } %>





                        <!-- Modal -->

                    </div>

                </div>

                <div class="row">
                    <div class="col-xs-12">
                        <div class="tabCommon mt-20">
                            <ul class="nav nav-tabs">
                                <!--                                <li class="active"><a data-toggle="tab" href="#details" aria-expanded="true">Details</a></li>-->

                                <li class="active"><a data-toggle="tab" href="#reviews" aria-expanded="true">Reviews</a></li>


                            </ul>
                            <div class="tab-content patternbg">



                                <div id="reviews" class="tab-pane fade active in">
                                    <div class="post-comments">
                                        <ul class="media-list comments-list m-bot-50 clearlist">
                                            <!-- Comment Item start-->
                                            <% 
                                    ArrayList<Feedback> feedback = (ArrayList<Feedback>) request.getAttribute("feedback");
                                    ArrayList<User> users = (ArrayList<User>) request.getAttribute("user");
               
                                   for (Feedback fb : feedback) {
                                  
                                            %> 
                                            <li class="media">

                                                <a class="pull-left" href="#!">
                                                    <img class="media-object comment-avatar" src="images/blog/avater-1.jpg" alt="" width="50" height="50" />
                                                </a>

                                                <div class="media-body">
                                                    <div class="comment-info">
                                                        <%  for (User u : users) { %>
                                                        <%if(fb.getUserid()==u.getId()){ %>


                                                        <h4 class="comment-author">
                                                            <%=u.getName()%>
                                                        </h4>
                                                        <% } } %> 
                                                        <div class="comment-content">
                                                        <time datetime="2013-04-06T13:53"><%= fb.getPostdate() %></time>
                                                        <% int rating=fb.getStar();
                                                        if(rating==5){%>
                                                        <div class="star ">
                                                           
                                                            <i class="fa-solid fa-star checked" data-index="0"></i>
                                                            <i class="fa-solid fa-star checked" data-index="1"></i>
                                                            <i class="fa-solid fa-star checked" data-index="2"></i>
                                                            <i class="fa-solid fa-star checked" data-index="3"></i>
                                                            <i class="fa-solid fa-star checked" data-index="4"></i>
                                                        </div>
                                                        <% }else if(rating==4){ %>
                                                          <div class="star ">
                                                           
                                                            <i class="fa-solid fa-star checked" data-index="0"></i>
                                                            <i class="fa-solid fa-star checked" data-index="1"></i>
                                                            <i class="fa-solid fa-star checked" data-index="2"></i>
                                                            <i class="fa-solid fa-star checked" data-index="3"></i>
                                                            <i class="fa-solid fa-star" data-index="4"></i>
                                                        </div>
                                                        <% }else if(rating==3){ %>
                                                         <div class="star ">
                                                           
                                                            <i class="fa-solid fa-star checked" data-index="0"></i>
                                                            <i class="fa-solid fa-star checked" data-index="1"></i>
                                                            <i class="fa-solid fa-star checked" data-index="2"></i>
                                                            <i class="fa-solid fa-star " data-index="3"></i>
                                                            <i class="fa-solid fa-star " data-index="4"></i>
                                                        </div>
                                                         <% }else if(rating==2){ %>
                                                         <div class="star ">
                                                           
                                                            <i class="fa-solid fa-star checked" data-index="0"></i>
                                                            <i class="fa-solid fa-star checked" data-index="1"></i>
                                                            <i class="fa-solid fa-star " data-index="2"></i>
                                                            <i class="fa-solid fa-star " data-index="3"></i>
                                                            <i class="fa-solid fa-star " data-index="4"></i>
                                                         </div>
                                                         <% }else if(rating==1){ %>
                                                         <div class="star ">
                                                           
                                                            <i class="fa-solid fa-star checked" data-index="0"></i>
                                                            <i class="fa-solid fa-star " data-index="1"></i>
                                                            <i class="fa-solid fa-star " data-index="2"></i>
                                                            <i class="fa-solid fa-star " data-index="3"></i>
                                                            <i class="fa-solid fa-star " data-index="4"></i>
                                                        </div>
                                                         <% }else{ %>
                                                         <div class="star ">
                                                           
                                                            <i class="fa-solid fa-star " data-index="0"></i>
                                                            <i class="fa-solid fa-star " data-index="1"></i>
                                                            <i class="fa-solid fa-star " data-index="2"></i>
                                                            <i class="fa-solid fa-star " data-index="3"></i>
                                                            <i class="fa-solid fa-star " data-index="4"></i>
                                                        </div>
                                                        <% } %>
                                                        <a class="comment-button" href="#!"><i class="tf-ion-chatbubbles"></i>Reply</a>
                                                    </div>

                                                    <p>
                                                        <%=fb.getContent()%>
                                                    </p>
                                                    </div>
                                                </div>

                                            </li>
                                            <% } %>
                                            <!-- End Comment Item -->

                                            <!-- Comment Item start-->

                                        </ul>

                                    </div>

                                    <div class="wrapper center">
                                        <h3><%=products.getName()%></h3>
                                        <p>General Assessment</p>
                                        <div id="close-btn">&times</div>
                                        <form action="feedback" id="feedbackForm">
                                            <input type="hidden" name="id" value="<%= products.getId()%>">
                                            <input type="hidden" name="cateid" value="<%= products.getCategoryid()%>">

                                            <div class="rating">
                                                <input type="number" name="rating" hidden>
                                                <i class='bx bx-star star' style="--i: 0;"></i>
                                                <i class='bx bx-star star' style="--i: 1;"></i>
                                                <i class='bx bx-star star' style="--i: 2;"></i>
                                                <i class='bx bx-star star' style="--i: 3;"></i>
                                                <i class='bx bx-star star' style="--i: 4;"></i>
                                            </div>
                                            <textarea name="content" cols="30" rows="5" placeholder="Your opinion..."></textarea>
                                            <div class="btn-group">
                                                <button type="submit" class="btn submit">Submit</button>

                                            </div>
                                        </form>

                                    </div>

                                    <div class="button__review-container">
                                        <p class="has-text-centered my-2 subtitle is-6">How do you rate this product?</p> 
                                        <div class="has-text-centered">
                                            <button class="button has-text-white button__review" id="open-popup-btn">Rating now
                                            </button></div></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>















        <!-- offer -->

        <!-- offer -->






        <!-- newslater -->
        <!-- newslater -->






        <!-- footer -->
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
                    </div>
                </div>
            </div>
        </footer>
        <!-- footer -->







        <a href="#" class="arrow"><i><img src="/SWP/images/arrow.png" alt=""></i></a>



        <!-- Google Mapl -->

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
        <script src="./assets/js/shoplist.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js" integrity="sha512-HGOnQO9+SP1V92SrtZfjqxxtLmVzqZpjFFekvzZVWoiASSQgSr4cw9Kqd2+l8Llp4Gm0G8GIFJ4ddwZilcdb8A==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    </body>
</html>
