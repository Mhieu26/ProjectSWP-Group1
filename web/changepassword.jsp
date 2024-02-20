<!DOCTYPE html>



<html lang="en">
    <head>

        <!-- Basic Page Needs
        ================================================== -->
        <meta charset="utf-8">
        <title>Changepassword</title>

        <!-- Mobile Specific Metas
        ================================================== -->
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="Construction Html5 Template">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=5.0">
        <meta name="author" content="Themefisher">
        <meta name="generator" content="Themefisher Constra HTML Template v1.0">

        <!-- Favicon -->
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
        <!-- link thêm vào -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css" />
        <!-- font awesome 5.13.1 -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css" />
    </head>




    <section class="signin-page account">
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-md-offset-3">
                    <div class="block text-center">
                        <div class="logo text-center">
                            <a href="home">
                                <!-- replace logo here -->
                                <svg width="135px" height="29px" viewBox="0 0 155 29" version="1.1" xmlns="http://www.w3.org/2000/svg"
                                     xmlns:xlink="http://www.w3.org/1999/xlink">
                                <g id="Page-1" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd" font-size="35"
                                   font-family="AustinBold, Austin" font-weight="bold">
                                <g id="Group" transform="translate(-108.000000, -297.000000)" fill="#000000">
                                <text id="AVIATO">
                                <tspan x="108.94" y="325">LAVIBAN</tspan>
                                </text>
                                </g>
                                </g>
                                </svg>
                            </a>
                        </div>
                        <h2 class="text-center">Change password</h2>
                        <form method="post" action="changePassword" >
                            <div class="form-group">
                                <div class="input-group mb-3">
                                    <input type="password" name="oldPass" class="form-control" id="ipnPassword" placeholder="Old Password" />
                                    <div class="input-group-append">
                                        <button class="btn btn-outline-secondary" type="button" id="btnPassword">
                                            <span class="fa fa-eye"></span>
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group mb-3">
                                    <input type="password" name="pass1" class="form-control" id="ipnNewPassword" placeholder="New Password" />
                                    <div class="input-group-append">
                                        <button class="btn btn-outline-secondary" type="button" id="btnNewPassword">
                                            <span class="fa fa-eye"></span>
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group mb-3">
                                    <input type="password" name="pass2" class="form-control" id="ipnReNewPassword" placeholder="Re-New Password" />
                                    <div class="input-group-append">
                                        <button class="btn btn-outline-secondary" type="button" id="btnReNewPassword">
                                            <span class="fa fa-eye"></span>
                                        </button>
                                    </div>
                                </div>
                                
                            </div>
                           
                            

                            <div class="submitcp">
                                <button type="submit" class="confirm-btn">Confirm</button>
                                <br>

                                <button type="button" class="cancel-btn" ><a><a href="home">Back to home</a></button>
                            </div>
                             <div>
                        <H6>${requestScope.errorMessage}</H6>
                    </div>
                        </form>
                            
                    </div>
                   
                    
                </div>

                
            </div>
        </div>
    

</section>



<script src="./assets/plugins/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.1 -->
<script src="./assets/plugins/bootstrap/js/bootstrap.min.js"></script>
<!-- Bootstrap Touchpin -->
<script src="./assets/plugins/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.min.js"></script>
<!-- Instagram Feed Js -->
<script src="./assets/plugins/instafeed/instafeed.min.js"></script>
<!-- Video Lightbox Plugin -->
<script src="./assets/plugins/ekko-lightbox/dist/ekko-lightbox.min.js"></script>
<!-- Count Down Js -->
<script src="./assets/plugins/syo-timer/build/jquery.syotimer.min.js"></script>

<!-- slick Carousel -->
<script src="./assets/plugins/slick/slick.min.js"></script>
<script src="./assets/plugins/slick/slick-animation.min.js"></script>

<!-- Google Mapl -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCC72vZw-6tGqFyRhhg5CkF2fqfILn2Tsw"></script>
<script type="text/javascript" src="./assets/plugins/google-map/gmap.js"></script>

<!-- Main Js File -->
<script src="./assets/js/cp.js"></script>




</body>
</html>