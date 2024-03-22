<%-- 
    Document   : feedbackdetails
    Created on : Mar 5, 2024, 10:03:46 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.*"%>
<%@page import="Dao.*"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8">
        <title>Manager</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <meta name="description" content="Developed By M Abdur Rokib Promy">
        <meta name="keywords" content="Admin, Bootstrap 3, Template, Theme, Responsive">
        <!-- bootstrap 3.0.2 -->
        <link href="./admin/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- font Awesome -->
        <link href="./admin/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <!-- Ionicons -->
        <link href="./admin/css/ionicons.min.css" rel="stylesheet" type="text/css" />
        <!-- Morris chart -->
        <link href="./admin/css/morris/morris.css" rel="stylesheet" type="text/css" />
        <!-- jvectormap -->
        <link href="./admin/css/jvectormap/jquery-jvectormap-1.2.2.css" rel="stylesheet" type="text/css" />
        <!-- Date Picker -->
        <link href="./admin/css/datepicker/datepicker3.css" rel="stylesheet" type="text/css" />
        <!-- fullCalendar -->
        <!-- <link href="css/fullcalendar/fullcalendar.css" rel="stylesheet" type="text/css" /> -->
        <!-- Daterange picker -->
        <link href="./admin/css/daterangepicker/daterangepicker-bs3.css" rel="stylesheet" type="text/css" />
        <!-- iCheck for checkboxes and radio inputs -->
        <link href="./admin/css/iCheck/all.css" rel="stylesheet" type="text/css" />
        <!-- bootstrap wysihtml5 - text editor -->
        <!-- <link href="css/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css" rel="stylesheet" type="text/css" /> -->
        <link href='http://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
        <!-- Theme style -->
        <link href="./admin/css/adminstyle.css" rel="stylesheet" type="text/css" />




        <style type="text/css">

        </style>
    </head>

    <body class="skin-black">
        <% User user = (User)session.getAttribute("User");%>
        <!-- header logo: style can be found in header.less -->
        <header class="header">
            <a href="home" class="logo">
                Manager
            </a>
            <!-- Header Navbar: style can be found in header.less -->
            <nav class="navbar navbar-static-top" role="navigation">
                <!-- Sidebar toggle button-->
                <a href="#" class="navbar-btn sidebar-toggle" data-toggle="offcanvas" role="button">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </a>
                <div class="navbar-right">


                    <!-- User Account: style can be found in dropdown.less -->
                    <li class="dropdown user user-menu">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="fa fa-user"></i>
                            <span>Marketing account<i class="caret"></i></span>
                        </a>
                        <ul class="dropdown-menu dropdown-custom dropdown-menu-right">
                            <li class="dropdown-header text-center">Account</li>




                            <li>
                                <a href="logout"><i class="fa fa-ban fa-fw pull-right"></i> Logout</a>
                            </li>
                        </ul>
                    </li>

                </div>
            </nav>
        </header>
        <div class="wrapper row-offcanvas row-offcanvas-left">
            <!-- Left side column. contains the logo and sidebar -->
            <aside class="left-side sidebar-offcanvas">
                <!-- sidebar: style can be found in sidebar.less -->
                <section class="sidebar">
                    <!-- Sidebar user panel -->
                    <div class="user-panel">
                        <div class="pull-left image">
                            <img src="./admin/img/26115.jpg" class="img-circle" alt="User Image" />
                        </div>
                        <div class="pull-left info">

                            <p>Hello, <%= user.getName() %></p>

                            <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                        </div>
                    </div>

                    <!-- /.search form -->
                    <!-- sidebar menu: : style can be found in sidebar.less -->
                    <ul class="sidebar-menu">
                        <li class="active">
                            <a href="feedbackslist">
                                <i class="fa fa-angle-double-down"></i> <span>Feedback Detail</span>
                            </a>
                        </li>

                        <li>
                            <a href="home">
                                <i class="fa fa-home"></i> <span>Home</span>
                            </a>
                        </li>


                    </ul>
                </section>
                <!-- /.sidebar -->
            </aside>

            <aside class="right-side">

                <!-- Main content -->
                <section class="content">
                    <% Feedback feedback = (Feedback)request.getAttribute("feedback");
                       Products product = (Products)request.getAttribute("product");
                       ArrayList<Feedback> feedbackslist = (ArrayList<Feedback>)request.getAttribute("feedbackslist");
                    %>
                    <div class="row" style="margin-bottom:5px;">    
                        <div class="col-md-12">
                            <div class="sm-st clearfix">
                                <span class="sm-st-icon st-blue"><i class="fa fa-angle-double-down"></i></span>
                                <p></p>
                                <div style="font-size: xx-large">
                                    Feedbacks Detail
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row" style="margin-bottom:5px;">
                        <div class="col-md-12">
                            <div class="sm-st clearfix" >
                                <div style="font-size: x-large">
                                    <% long userID = (long)feedback.getUserid(); 
                                    UserDAO uDAO = new UserDAO();
                                    User userFeedback = uDAO.getUserByID(userID);
                                    %> 
                                    <span style="margin-right: 20px"><i class="fa fa-user" style="width: 30px"></i> username : <%= userFeedback.getName()%></span>
                                    <span style="margin-right: 20px; font-size: smaller; color: grey"><i class="fa fa-envelope-o" ></i> email : <%= userFeedback.getEmail()%> </span>
                                    <span style="margin-right: 20px; font-size: smaller; color: grey"><i class="fa fa-phone" ></i> phone number : <%= userFeedback.getPhone()%></span>
                                    <div>
                                        <p>
                                            <span >
                                                <i class="fa fa-star" style="width: 30px" ></i>
                                            </span>
                                            rate star :<% for(int i =0;i< feedback.getStar();i++){ %>
                                            <span >
                                                <i class="fa fa-star" style="color: #FAD733"></i>
                                            </span>
                                            <% } %>
                                        </p>
                                        <p>
                                            <span >
                                                <i class="fa fa-comment" style="width: 30px"></i>
                                            </span>
                                            Feedbacks content :<%= feedback.getContent() %>
                                        </p>
                                        <p>
                                            <span >
                                                <% if(!feedback.getStatus()){ %>
                                                <i class="fa fa-eye-slash"></i>

                                                Feedbacks status :
                                                Invisible
                                                <%}else{%>
                                                <i class="fa fa-eye"></i>

                                                Feedbacks status :
                                                Visible
                                                <%}%></span>
                                            <a href="#" data-feedbackid="<%= feedback.getId()%>" data-status="<%= feedback.getStatus()%>" class="changeStatusLink" style="margin-left: 20px" ">Change Status</a>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>       
                    <div class="row">    
                        <div class="col-md-12">
                            <div class="sm-st clearfix">
                                <% 
                   
                    ImageDAO id=new ImageDAO();                   
                    Image thumbnail=id.getThumbnailImagebyProductID(product.getId());
                                %>
                                <div>
                                    <a style="margin-left: 40px" href="shopdetail?id=<%= product.getId() %>&cateid=<%= product.getId() %>" >
                                        <%= product.getName() %></a>
                                </div>
                                <img style="width: 15%;" src="<%= thumbnail.getSource()%>" alt="thumbnail" class="col-lg-3" >
                                <h4 s><%= product.getDescription() %></h4>                          
                            </div>     
                        </div>
                    </div>
                    <div class="row" style="margin-bottom:5px;">    
                        <div class="col-md-12">
                            <div class="sm-st clearfix" style="font-size: x-large ;">
                                <div>
                                    <%  int totalStar = 0;
                                         
                                         for (Feedback feedback1 : feedbackslist) {
                                         totalStar+= feedback1.getStar();
                                        }
                                    %>

                                    <% double average =(double) totalStar/feedbackslist.size(); %>                                  
                                    Average <%= String.format("%.2f", average) %><i class="fa fa-star" style="color: #FAD733; margin-left: 8px"></i>  out of <%= feedbackslist.size() %> Feedbacks
                                </div>
                                <% int count;
                                for(int j=5;j>0;j--){
                                count =0 ;
                                %>
                                <div>
                                    <% for(Feedback feedback1 : feedbackslist){
                                    if(feedback1.getStar()==j){count++;}
                                        } %>
                                    <%= j %> 
                                    <i class="fa fa-star" style="margin-right: 15px"></i>
                                    <% double starRate = (double)100*count/feedbackslist.size();%>
                                    <span style="margin-right: 20px; font-size: smaller; color: grey">
                                        <%= count %> Feedback (<%= String.format("%.2f", starRate) %>%)
                                    </span>
                                </div>
                                <% }; %>
                            </div>     
                        </div>
                    </div>          
                    <div class="row" style="margin-bottom:5px;">    
                        <div class="col-md-12">
                            <div class="sm-st clearfix">
                                <span class="sm-st-icon st-blue"><i class="fa fa-angle-double-down"></i></span>
                                <p></p>

                                <div style="font-size: xx-large ; margin-bottom: 20px">
                                    List of Feedbacks about <%= product.getName() %>
                                </div>
                                <div style="font-size: x-large">
                                    <% if(feedbackslist.size()>1){
                                    for (Feedback feedback1 : feedbackslist) {
                                   long usersID = (long)feedback1.getUserid();                                 
                                    User usersFeedback = uDAO.getUserByID(usersID);     
                                    %> 
                                    <p>
                                        <span style="margin-right: 20px"><i class="fa fa-user" style="width: 30px"></i> username : <%= usersFeedback.getName()%></span>
                                    </p>
                                    <div style="margin-left: 20px; ">
                                        <span >
                                            <i class="fa fa-comment" style="width: 30px"></i>
                                        </span>
                                        <a href="feedbackdetails?feedbackID=<%= feedback1.getId()%>"><%= feedback1.getContent() %></a>
                                        <div ">
                                            <% if(feedback1.getStatus()){%>
                                            <i class="fa fa-eye" style="margin-right: 10px"> Visible</i>
                                            <% }else{ %>
                                            <i class="fa fa-eye-slash" style="margin-right: 10px"> Invisible</i>
                                            <%}%>
                                        </div>
                                    </div>
                                    <% }} %>
                                </div>
                            </div>

                        </div>
                    </div>


                    <div class="row">

                        <div class="col-md-8">


                        </div><!--end col-6 -->

                    </div>


                </section>


        </div><!--end col-6 -->

        <!-- row end -->
    </section><!-- /.content -->
    <div class="footer-main">

        LaViBan-2024
    </div>
</aside><!-- /.right-side -->s

</div><!-- ./wrapper -->


<!-- jQuery 2.0.2 -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
<script src="./admin/js/jquery.min.js" type="text/javascript"></script>

<!-- jQuery UI 1.10.3 -->
<script src="./admin/js/jquery-ui-1.10.3.min.js" type="text/javascript"></script>
<!-- Bootstrap -->
<script src="./admin/js/bootstrap.min.js" type="text/javascript"></script>
<!-- daterangepicker -->
<script src="./admin/js/plugins/daterangepicker/daterangepicker.js" type="text/javascript"></script>

<script src="./admin/js/plugins/chart.js" type="text/javascript"></script>

<!-- datepicker
    <script src="js/plugins/datepicker/bootstrap-datepicker.js" type="text/javascript"></script>-->
<!-- Bootstrap WYSIHTML5
    <script src="js/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js" type="text/javascript"></script>-->
<!-- iCheck -->
<script src="./admin/js/plugins/iCheck/icheck.min.js" type="text/javascript"></script>
<!-- calendar -->
<script src="./admin/js/plugins/fullcalendar/fullcalendar.js" type="text/javascript"></script>

<!-- Director App -->
<script src="./admin/js/Director/app.js" type="text/javascript"></script>

<!-- Director dashboard demo (This is only for demo purposes) -->
<script src="./admin/js/Director/dashboard.js" type="text/javascript"></script>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        var changeStatusLinks = document.querySelectorAll('.changeStatusLink');
        changeStatusLinks.forEach(function (link) {
            link.addEventListener('click', function (event) {
                event.preventDefault(); // Ngăn chặn hành động mặc định của thẻ <a>

                var feedbackId = this.getAttribute('data-feedbackid');
                var status = this.getAttribute('data-status');

                var confirmResult = confirm("Do you want to change this feedbacks status?");
                if (confirmResult) {
                    // Nếu người dùng đồng ý, chuyển hướng đến URL cụ thể với các tham số feedbackId và status
                    var url = "feedbackdetails?feedbackID=" + feedbackId + "&status=" + status;
                    window.location.href = url;
                } else {
                    // Nếu người dùng không đồng ý, không làm gì cả hoặc thực hiện các hành động khác tùy ý
                }
            });
        });
    });
</script>

</body>

</html>