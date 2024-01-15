<%-- 
    Document   : homepage
    Created on : Jan 15, 2024, 10:44:46 AM
    Author     : toanl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
</head>
<body>

    <!-- top navbar -->
    <!-- top navbar -->

    <!-- navbar -->
    <nav class="navbar navbar-expand-lg" id="navbar">
        <div class="container-fluid">
          <a class="navbar-brand" href="index.html" id="logo"><span id="span1">E</span>Lectronic <span>Shop</span></a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span><img src="./images/menu.png" alt="" width="30px"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
              <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="index.html">Home</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">Product</a>
              </li>
              <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                  Category
                </a>
                <ul class="dropdown-menu" aria-labelledby="navbarDropdown" style="background-color: rgb(67 0 86);">
                  <li><a class="dropdown-item" href="#">Smart Phone</a></li>
                  <li><a class="dropdown-item" href="#">Mobile Phone</a></li>
                  <li><a class="dropdown-item" href="#">Cameras</a></li>
                  <li><a class="dropdown-item" href="#">Fridge</a></li>
                  <li><a class="dropdown-item" href="#">AC</a></li>
                  <li><a class="dropdown-item" href="#">Smart Watch</a></li>
                  <li><a class="dropdown-item" href="#">Headphone</a></li>
                  <li><a class="dropdown-item" href="#">Laptop</a></li>
                  <li><a class="dropdown-item" href="#">PC Moniter</a></li>
                </ul>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="about.html">About</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="contact.html">Contact</a>
              </li>
            </ul>
            <form class="d-flex" id="search">
              <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
              <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
           <div class="btn"><button><i class="fa fa-sign-in"></i> <a href="login.html" style="color: white;">Login</a> </button> </div>
           <div class="user-img"><img src="images/326771922_6199665460078834_6765176038989738157_n.jpg" alt="" onclick="toggleMenu()"></div>
           <div class="sub-menu-wrap" id="subMenu">
            <div class="sub-menu">
              <div class="user-info">
                <img src="images/326771922_6199665460078834_6765176038989738157_n.jpg" alt="">
                <h3>Manh Toan</h3>
              </div>
              <hr>
              <a href="#" class="sub-menu-link">
                <img src="images/user.png" alt="">
                <p>Edit Profile</p>
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

   





    <!-- product cards -->
   <div class="products">
    <h1 class="text-center">PRODUCTS</h1>
    <p>Điện thoại</p>
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
      <p>Laptop</p>
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
      <p>Headphone</p>
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
      <p>Watch</p>
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
      <p>Phụ kiện</p>
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
    <div class="container" id="newslater">
      <h3 class="text-center">Subscribe To The Electronic Shop For Latest upload.</h3>
      <div class="input text-center">
        <input type="text" placeholder="Enter Your Email..">
        <button id="subscribe">SUBSCRIBE</button>
      </div>
    </div>
    <!-- newslater -->






    <!-- footer -->
    <footer id="footer">
      <div class="footer-top">
        <div class="container">
          <div class="row">

            <div class="col-lg-3 col-md-6 footer-contact">
              <h3>Electronic Shop</h3>
              <p>
                Karachi <br>
                Sindh <br>
                Pakistan <br>
              </p>
              <strong>Phone:</strong> +000000000000000 <br>
              <strong>Email:</strong> electronicshop@.com <br>
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
<!--<script src="./slide.js"></script>-->
<script src="./assets/js/menu.js"> </script>
</body>
</html>