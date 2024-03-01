<%-- 
    Document   : login
    Created on : Jan 17, 2024, 7:56:27 AM
    Author     : toanl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
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

        <section class="signin-page account">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 col-md-offset-3">
                        <div class="block text-center">
                            
                            <h2 class="text-center">Welcome Back</h2>
                            <div class="text-left clearfix" action="index.html" >
                                <div class="form-group">
                                    <input type="email" id="loginemail" class="form-control"  placeholder="Email">
                                </div>
                                <div class="form-group">
                                    <input type="password" id="loginpassword" class="form-control" placeholder="Password">
                                </div>
                                <div id="loginprompt" class="text-danger"></div>
                                <div class="text-center">
                                    <button type="submit" id="btnlogin" class="btn btn-main text-center" >Login</button>
                                </div>                                
                            </div>
                            <p class="mt-20">Forgot your password? <a href="/SWP/resetpassword">Resetpassword</a></p>
                            <p class="mt-20">New in this site ?<a href="/SWP/register"> Create New Account</a></p>
                            <div class="text-center" style="margin-top: 4%;">
                                    <h5>Or login with</h5>
                                    <a href="https://accounts.google.com/o/oauth2/auth?scope=profile%20email%20https://www.googleapis.com/auth/user.phonenumbers.read%20https://www.googleapis.com/auth/user.gender.read&redirect_uri=http://localhost:9999/SWP/googlelogin&response_type=code&client_id=84108154100-e5i8n0lqnoe59v0rlm5q4aki8chjuth4.apps.googleusercontent.com&approval_prompt=force">
                                        <img src="https://account.cellphones.com.vn/_nuxt/img/image45.93ceca6.png" alt="google" style="width: 5%;"/>
                                    </a>
                                </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>





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
