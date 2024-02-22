<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>LaViBan | E-commerce</title>
        <base href="${pageContext.request.contextPath}  ">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="Construction Html5 Template">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="author" content="Themefisher">
        <meta name="generator" content="Themefisher Constra HTML Template v1.0">
        
        <!-- Main Stylesheet -->
        
        <!-- bootstrap links -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        
        <!-- fonts links -->
        
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Merriweather&display=swap" rel="stylesheet">
        <!-- fonts links -->
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

                            <h2 class="text-center">Reset your Password</h2>
                            <form method="post" action="resetpass" onsubmit="return validateForm()" class="changePW">
                                <div class="form-group">
                                <input class="form-control" type="text" name="email" value="${requestScope.email}" readonly="${requestScope.email}">
                                </div>
                                <div class="form-group">
                                    <input class="form-control" type=password id="password" name="password" placeholder="New Password">
                                </div>
                                <div class="form-group">
                                    <input class="form-control" type=password id="confirmPassword" placeholder="Repeat Your New Password">
                                </div>
                                <p id="passwordMatchError" class="error"></p>
                                <div class="form-group">
                                <button class ="buttonPart" type="submit" class="btn" >Save</button>
                                </div>  
                            </form>

                            <p class="mt-20">New in this site ?<a href="/SWP/register"> Create New Account</a></p>
                            <div class="text-center" style="margin-top: 4%;">
                                <h5>Or login with</h5>
                                <a href="https://accounts.google.com/o/oauth2/auth?scope=profile%20email%20https://www.googleapis.com/auth/user.phonenumbers.read%20https://www.googleapis.com/auth/user.gender.read&redirect_uri=http://localhost:9999/SWP/googlelogin&response_type=code&client_id=84108154100-e5i8n0lqnoe59v0rlm5q4aki8chjuth4.apps.googleusercontent.com&approval_prompt=force">
                                    <img src="https://account.cellphones.com.vn/_nuxt/img/image45.93ceca6.png" alt="google" width="5%"/>
                                </a>
                            </div>

                        </div>
                    </div>


                </div>
            </div>


        </section>
   
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <a href="home" class="arrow"><i><img src="./images/home-icon.png" alt=""></i></a>
        <script>
            function validateForm() {
                var password = document.getElementById("password").value;
                var confirmPassword = document.getElementById("confirmPassword").value;
                var passwordMatchError = document.getElementById("passwordMatchError");
                if (password !== confirmPassword) {
                    passwordMatchError.textContent = "Passwords do not match";
                    return false;
                } else {
                    passwordMatchError.textContent = "";
                    return true;
                }
            }
            
        </script>
       
    </body>
</html>