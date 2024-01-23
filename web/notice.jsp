<%-- 
    Document   : verify
    Created on : 23-01-2024, 13:09:24
    Author     : Admin
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








        <div class="container" id="login">
            <div class="row">
                <div class="col-md-5 py-3 py-md-0" id="side1">
                    <h3 class="text-center"  >Welcome!</h3> 
                </div>
                <div class="col-md-7 py-3 py-md-0 d-flex align-items-center" id="side2">
                    <div class="container" id="notice">
                        <%
                            String notice = (String)request.getAttribute("notice");
                            if(notice != null){
                        %>
                        <div class="text-success">
                            <h1><%= notice %></h1>
                        </div>
                        <%}%>
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
        <script src="./assets/js/app.js"></script>
    </body>
</html> 

