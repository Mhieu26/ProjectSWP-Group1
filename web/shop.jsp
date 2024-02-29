<%-- 
    Document   : about
    Created on : Jan 16, 2024, 6:32:09 PM
    Author     : toanl
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Products, Model.User, Model.Image,Model.Category"%>
<%@page import="Dao.ProductsDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.text.DecimalFormat" %>
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

        <section class="page-header">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="content">
                            <h1 class="page-name">Shop</h1>
                            <ol class="breadcrumb">
                                <li><a href="/SWP/home">Home</a></li>
                                <li class="active">shop</li>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- navbar -->
        <section class="products section">
            <div class="container">
                <div class="row">
                    <div class="col-md-3">
                        <div class="search-box">
                            <form class="search-form" action="shop">
                                <input class="text-input" type="text" placeholder="Search product..." value="${search}" name="search">
                                <input type="hidden" name="action" value="search">
                                <button type="submit" class="search-btn"><i class="fa-solid fa-chevron-up fa-rotate-90"
                                                                            style="color: #ffffff;"></i></button>
                            </form>
                        </div>
                        <form class="price-form" action="shop">
                            <div class="pricing-slider">
                                <h3>Pricing</h3>
                                <div class="price-input">
                                    <span>From</span> <input type="number" value="${minPrice}" name="minPrice"> <span>To</span> <input type="number" value="${maxPrice}" name="maxPrice"> 
                                </div>
                            </div>
                            <div class="search-btn-box"><button type="submit" class="price-search">Search</button>
                            </div>
                            <input type="hidden" name="action" value="price">
                        </form>
                        <div class="widget product-category">

                            <div class="panel-group commonAccordion" id="accordion" role="tablist" aria-multiselectable="true">
                                <div class="panel panel-default">
                                    <div class="panel-heading" role="tab" id="headingOne">
                                        <h4 class="panel-title">
                                            <a role="button"  data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                                Categories
                                            </a>
                                        </h4>
                                    </div>

                                    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                                        <div class="panel-body">

                                            <ul>
                                                <c:forEach var="c" items="${listc}">
                                                    <li><a href="shop?cate=${c.getId()}&action=cate" style="    text-transform: uppercase;
                                                           font-size: 10px;">${c.getCategory()}</a></li>
                                                    </c:forEach>
                                            </ul>

                                        </div>
                                    </div>

                                </div>	
                                 <div class="panel panel-default">
                                    <div class="panel-heading" role="tab" id="headingOne">
                                        <h4 class="panel-title">
                                            <a role="button"  data-parent="#accordion" href="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
                                                Maker
                                            </a>
                                        </h4>
                                    </div>

                                    <div id="collapseTwo" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingTwo">
                                        <div class="panel-body">

                                            <ul>
                                                <c:forEach var="c" items="${listMaker}">
                                                    <li><a href="shop?maker=${c}&action=maker" style="    text-transform: uppercase;
                                                           font-size: 10px;">${c}</a></li>
                                                    </c:forEach>
                                            </ul>

                                        </div>
                                    </div>

                                </div>	

                            </div>

                        </div>
                        <div class="slide-bar-product">


                            <% 
                      ArrayList<Products> get3newest = (ArrayList<Products>) request.getAttribute("get3newest");
                     ArrayList<Image> thumbnails = (ArrayList<Image>) request.getAttribute("thumbnails");
                     for (Products product : get3newest) {
                            %> 
                            <div class="slide-product">
                                <h3>Newest Products</h3>

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
                                                <a href="#!"><i class="tf-ion-android-cart"></i></a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="product-content">
                                    <h4><a href="product-single.html"> <%= product.getName()%></a></h4>

                                </div>
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
                            <% } %>





                            <!-- Modal -->

                        </div>
                    </div>
                    <div class="col-md-9">
                        <div class="text-sort">

                            <div class="sort-box">
                                <select class="select-sort" id="select" onchange="window.location.href = 'shop?action=${action}&search=${search}&cate=${cate}&minPrice=${minPrice}&maxPrice=${maxPrice}&sort=' + document.getElementById('select').value;">
                                    <option <c:if test="${sort eq ''}">selected=""</c:if> value="">Default</option>
                                    <option <c:if test="${sort eq 'asc'}">selected=""</c:if> value="asc">Low</option>
                                    <option <c:if test="${sort eq 'desc'}">selected=""</c:if> value="desc">High</option>
                                    </select>
                                </div>
                            </div>
                            <div class="container">
                                <div class="shop-list">


                                <% 
                          ArrayList<Products> products = (ArrayList<Products>) request.getAttribute("listp");
                         
                         for (Products product : products) {
                                %> 
                                <div class="shop-item">

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
                                        <h4><a href="product-single.html"> <%= product.getName()%></a></h4>

                                    </div>
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
                                <% } %>





                                <!-- Modal -->


                            </div>
                            <ul class="listPage">         
                            </ul>

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
