<%-- 
    Document   : resetpassword
    Created on : Jan 22, 2024, 7:56:27 AM
    Author     : ducnp
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
</head>
<body>

    <!-- top navbar -->

    <!-- top navbar -->

    <!-- navbar -->
    
    <!-- navbar -->
    






 <%
    // check to display interface
    String step = (String) request.getAttribute("step");
    if (step=="1") {step="2";
%>
   <div class="container" id="login">
    <div class="row">
        <div class="col-md-5 py-3 py-md-0" id="side1">
            <h3 class="text-center"  >Welcome!</h3> 
        </div>
        <div class="col-md-7 py-3 py-md-0" id="side2">
            <h3 class="text-center">Forgot your password ?</h3>
            <form action="resetpassword" method="post" >
                <div class="input2 text-center">     
                <input type="email" placeholder="Email-Address">         
                </div>
                <div class="text-center" id="btnlogin" >
                <button type="submit" >Reset Password</button></div>
            </form>
            <div class="text-center">
              <p>Not a member? <a href="register">Register</a></p>
              <p>or sign up with:</p>
              <button type="button" class="btn btn-link btn-floating mx-1">
                <i class="fab fa-facebook-f"></i>
              </button>
          
              <button type="button" class="btn btn-link btn-floating mx-1">
                <i class="fab fa-google"></i>
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
    <%
    } else if(step=="2") {step="3";
    %>
    <div class="container" id="login">
    <div class="row">
        <div class="col-md-5 py-3 py-md-0" id="side1">
            <h3 class="text-center"  >Welcome!</h3> 
        </div>
        <div class="col-md-7 py-3 py-md-0" id="side2">
            <h3 class="text-center">Reset your password</h3>
            <form action="resetpassword" method="post" >
                <div class="input2 text-center">     
                <input type="newpass" placeholder="New password">
                <input type="repas" placeholder="Repeat your new password">
                </div>
                <div class="text-center" id="btnlogin" >
                <button type="submit" >Reset Password</button></div>
            </form>
            <div class="text-center">
              <p>Not a member? <a href="register">Register</a></p>
              <p>or sign up with:</p>
              <button type="button" class="btn btn-link btn-floating mx-1">
                <i class="fab fa-facebook-f"></i>
              </button>
          
              <button type="button" class="btn btn-link btn-floating mx-1">
                <i class="fab fa-google"></i>
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
    <%
    } else if(step=="3") {
    %>
    <<h1>page 3</h1>
    <%
    }
    %>
   










    <!-- footer -->
   
    <!-- footer -->






    <a href="home" class="arrow"><i><img src="./images/home-icon.png" alt=""></i></a>












    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

</body>
</html> 
