<%-- 
    Document   : register.jsp
    Created on : Jan 17, 2024, 8:25:30 AM
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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script> 
        <script src="https://malsup.github.io/jquery.form.js"></script> 
        <!-- fonts links -->
    </head>
    <body>

        <!-- top navbar -->

        <!-- top navbar -->

        <!-- navbar -->

        <!-- navbar -->




        <div class="container" id="login" style="height: fit-content; max-height: 1000px;">
            <div class="row">
                <div class="col-md-5 py-3 py-md-0" id="side1">
                    <h3 class="text-center">Register</h3>
                </div>
                <div class="col-md-7 py-3 py-md-0" id="side2">
                    <h3 class="text-center">Create Account</h3> 
                    <div class="">
                        <label for="name">Your name:</label>
                        <input type="text" class="form-control" id="name" placeholder="Enter your name"
                               name="name" required>
                    </div>

                    <div class="">
                        <label for="address">Address:</label>
                        <input type="text" class="form-control" id="address" placeholder="Enter address" name="address"
                               required>
                    </div>

                    <div class="">
                        <label for="email">Email:</label>
                        <input type="email" class="form-control" id="email" placeholder="Enter email" name="email"
                               onchange="validateEmail(this.value)">                            
                    </div>
                    <p id="email-result" style="font-size: smaller; color: red; height: fit-content;"></p>
                    <div class="">
                        <label for="phone">Phone number:</label>
                        <input type="tel" class="form-control" id="phone" placeholder="Enter phone number"
                               name="phone" onchange="validatePhone(this.value)">
                    </div>
                    <p id="phone-result" style="font-size: smaller; color: red; height: fit-content;"></p>
                    <div class="w-25">
                        <label for="phone">Sex:</label>
                        <select id="sex" name="sex" class="form-control">
                            <option value="true">Male</option>
                            <option value="false">Female</option>
                        </select>
                    </div>
                    <div class="d-flex">
                        <div class="">
                            <label for="pwd">Password:</label>
                            <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="password"
                                   required>
                        </div>
                        <div class="ps-4">
                            <label for="cpwd">Confirm password:</label>
                            <input type="password" class="form-control" id="cpwd" placeholder="Confirm password"
                                   name="cpassword" required>
                            <span id='message'></span>
                        </div>
                    </div>
                    <div id="registerprompt" class="text-danger"></div>
                    <div class="mt-3 d-flex justify-content-center">
                        <button type="submit" id="btn-signup" class="btn btn-primary w-50 h-100">Sign up</button>
                    </div>
                    <p class="text-center mt-5"><a href="login" >I am already member</a></p>
                </div>

            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script src="./assets/js/app.js"></script>
        <script src= 
                "https://malsup.github.io/jquery.blockUI.js">
        </script>
        <a href="home" class="arrow"><i><img src="./images/home-icon.png" alt=""></i></a>

    </body>
</html>
