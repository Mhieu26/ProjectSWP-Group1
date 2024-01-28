<%-- 
    Document   : login
    Created on : Jan 17, 2024, 7:56:27 AM
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

        <!-- link for google login -->
        <meta name="google-signin-client_id"
              content="84108154100-e5i8n0lqnoe59v0rlm5q4aki8chjuth4.apps.googleusercontent.com">
    </head>
    <body>

        <!-- top navbar -->

        <!-- top navbar -->

        <!-- navbar -->

        <!-- navbar -->








        <div class="container" id="login">
            <div class="row">
                <div class="col-md-5 py-3 py-md-0" id="side1">
                    <h3 class="text-center"  >Welcome!</h3> 
                </div>
                <div class="col-md-7 py-3 py-md-0" id="side2">
                    <h3 class="text-center">Account login</h3>                    
                    <div class="input2 text-center">
                        <div id="loginprompt" class="text-danger"></div>
                        <input type="email" id="loginemail" placeholder="Email" name="email">
                        <input type="password" id="loginpassword" placeholder="Password" name="password">
                    </div>
                    <p class="text-center" id="btnlogin"><a>LOG IN</a></p>
                    <p class="text-center"><a href="resetpassword">Forgot Password?</a></p>
                    <div class="text-center">
                        <p>Not a member? <a href="register">Register</a></p>
                        <p>or sign up with:</p>
                        <button type="button" class="btn btn-link btn-floating mx-1">
                            <i class="fab fa-facebook-f"></i>
                        </button>

                        <button type="button" class="btn btn-link btn-floating mx-1">

                            <a href="https://accounts.google.com/o/oauth2/auth?scope=profile%20email%20https://www.googleapis.com/auth/user.phonenumbers.read%20https://www.googleapis.com/auth/user.gender.read&redirect_uri=http://localhost:9999/SWP/googlelogin&response_type=code&client_id=84108154100-e5i8n0lqnoe59v0rlm5q4aki8chjuth4.apps.googleusercontent.com&approval_prompt=force">
                                <i class="fab fa-google"></i>
                            </a>
                        </button>

                        <button type="button" class="btn btn-link btn-floating mx-1">
                            <i class="fab fa-twitter"></i>
                        </button>

                        <button type="button" class="btn btn-link btn-floating mx-1">
                            <i class="fab fa-github"></i>
                        </button>
                    </div>
                </div>

            </div>
        </div>











        <!-- footer -->

        <!-- footer -->






        <a href="home" class="arrow"><i><img src="./images/home-icon.png" alt=""></i></a>












        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script src="https://apis.google.com/js/platform.js" async defer></script>
        <script src="./assets/js/app.js"></script>
    </body>
</html> 
