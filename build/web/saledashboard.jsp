<%-- 
    Document   : saledashboard
    Created on : Feb 20, 2024, 5:08:00 PM
    Author     : phuduc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.*"%>
<%@page import="Dao.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.text.DecimalFormat" %>
<%
    // Kiểm tra xem người dùng đã đăng nhập chưa
    User user = (User) request.getAttribute("user");
    if (user != null) {
        // Nếu đã đăng nhập, kiểm tra vai trò
        int role = (int)(user.getRole().getId());
        if (role != 2 && role != 3&& role != 4) { // Nếu không phải là vai trò 234
            response.sendRedirect("notFoundController"); // Chuyển hướng về trang home
            return; // Dừng xử lý tiếp theo
        }
    } else {
        // Nếu chưa đăng nhập, chuyển hướng đến trang đăng nhập
        response.sendRedirect("login"); // Ví dụ: Chuyển hướng đến trang đăng nhập
        return; // Dừng xử lý tiếp theo
    }
%>
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
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>




        <style type="text/css">

        </style>
    </head>

    <body class="skin-black">
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
                            <span>Manager<i class="caret"></i></span>
                        </a>
                        <ul class="dropdown-menu dropdown-custom dropdown-menu-right">
                            <li class="dropdown-header text-center">Account</li>
                                <%
                                    
                         ArrayList<Products> listproducts = (ArrayList<Products>) request.getAttribute("listproducts");
                         ArrayList<OrderLine> orderlines = (ArrayList<OrderLine>) request.getAttribute("orderlines");
                         if(user != null) {
                            int role = (int)(user.getRole().getId());
                            if(role == 2) { %>
                            <li><a href="adminDashboardController">Admin Manager</a></li>
                            <li><a href="saledashboard">Sale</a></li>
                            <li>
                                <a href="saledashboard">Sale Manager</a>
                            </li>
                            <li>
                                <a href="marketingDashboard">Marketing Manager</a>
                            </li>
                            <% } else if (role == 3) { %>
                            <li><a href="saledashboard">Sale</a></li>
                                <% } else if (role == 4) { %>
                            <li><a href="saledashboard">Sale</a></li>
                            <li><a href="saledashboard">Sale Manager</a></li>
                                <% } else if (role == 5) { %>
                            <li><a href="marketingDashboard">Marketing Manager  </a></li>
                                <% } } %>


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
                            <a href="saledashboard">
                                <i class="fa fa-comment"></i> <span>Dashboard</span>
                            </a>
                        </li>
                        <li>
                            <a href="orderslist">
                                <i class="fa fa-cog"></i> <span>Orders List</span>
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
                <section class="content">
                    <div class="row" style="margin-bottom:5px;">    
                        <div class="col-md-12">
                            <div class="sm-st clearfix">
                                <span class="sm-st-icon st-blue"><i class="fa fa-angle-double-down"></i></span>
                                <p></p>
                                <div style="font-size: xx-large">
                                    Sale Dashboard
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row" style="margin-bottom:5px;">


                        <div class="col-md-3">
                            <div class="sm-st clearfix" ">
                                <span class="sm-st-icon st-red"><i class="fa fa-check-square-o"></i></span>
                                <p></p>
                                <div class="sm-st-info">
                                    <span style="font: x-large">
                                        <%= orderlines.size() %> OrderLine
                                    </span>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="sm-st clearfix">
                                <span class="sm-st-icon st-violet"><i class="fa fa-shopping-cart"></i></span>
                                <p></p>
                                <div class="sm-st-info">
                                    <span>
                                        <% 
                                        int totalSold =0;
                                        double totalPrice = 0;
                                        int totalQuantity = 0;
                                        for(OrderLine orderline1 : orderlines){                                  
                                        if(orderline1.getStatus().equals("Completed")){
                                        totalSold++;
                                        totalQuantity += orderline1.getQuantity();
                                        totalPrice += orderline1.getPrice();
                                            }
                                            }
                                        long totalString = (long)totalPrice;
                                        %>
                                        Products Sold: 
                                        <%= totalQuantity %>
                                    </span>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="sm-st clearfix">
                                <span class="sm-st-icon st-blue"><i class="fa fa-eye-slash"></i></span>
                                <p></p>
                                <div class="sm-st-info">
                                    <span >
                                        <%= totalSold %> Order Line Completed
                                    </span>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="sm-st clearfix" >
                                <span class="sm-st-icon st-green"><i class="fa fa-money"></i></span>
                                <p></p>
                                <div class="sm-st-info">
                                    <span>
                                        Revenue: 
                                        <%= totalString %> ₫
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <form action="saledashboard" method="post">
                        <h4><label  for="selectOption">Trend of success/total orders ,Filter by </label></h4>
                        Saler: <select name="selectedSale">
                            <option value="">All</option>
                            <%
                            String selectedSale = (String) request.getAttribute("selectedSale1");
                            String selectedStatus = (String) request.getAttribute("selectedStatus1");
                            String selectedProduct = (String) request.getAttribute("selectedProduct1");
                            ArrayList<User> saleList = (ArrayList<User>) request.getAttribute("saleList");                        
                                for (User saler1 : saleList) {
                                if(selectedSale!=null){if(saler1.getId()==Integer.parseInt(selectedSale)){
                            %>
                            <option value="<%= saler1.getId() %>" selected=""><%= saler1.getName() %></option>
                            <% session.removeAttribute("selectedSale1");}else{ %>
                            <option value="<%= saler1.getId() %>"><%= saler1.getName() %></option>

                            <%                                
                            }}else{
                            %>
                            <option value="<%= saler1.getId() %>"><%= saler1.getName() %></option>
                            <%}}%>
                        </select>
                        Status: 
                        <select name="selectedStatus">
                            <option value="">All</option>
                            <% if(selectedStatus!=null){ if(selectedStatus.equals("Completed")){ %>
                            <option value="Completed" selected="">Completed</option>
                            <option value="Pending">Pending</option>
                            <% }else{ %>
                            <option value="Completed">Completed</option>
                            <option value="Pending" selected="">Pending</option>
                            <% } session.removeAttribute("selectedStatus1");} else { %>
                            <option value="Completed">Completed</option>
                            <option value="Pending">Pending</option>
                            <% }  %>
                        </select>
                        Product:
                        <select name="selectedProduct">
                            <option value="">All</option>
                            <% for(Products products1 : listproducts){
                            if(selectedProduct!=null){if(products1.getId()==Long.parseLong(selectedProduct)){
                               
                            %>
                            <option value="<%= products1.getId() %>" selected=""><%= products1.getName() %></option>
                            <% session.removeAttribute("selectedProduct1"); }else {%>
                            <option value="<%= products1.getId() %>"><%= products1.getName() %></option>
                            <% }}else { %>
                            <option value="<%= products1.getId() %>"><%= products1.getName() %></option>
                            <%}}%>


                        </select>
                        Start Date
                        <input type="date" name="startdate" value="${selectedStartDate1}"/>
                        <% session.removeAttribute("selectedStartDate1"); %>
                        End Date
                        <input type="date" name="enddate" value="${selectedEndDate}" />
                        <% session.removeAttribute("selectedEndDate"); %>
                        <button type="submit">Filter</button>
                    </form>



                </section>
                        <div id="chart"></div>
            </aside>

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
    google.load("visualization", "1.0", {packages: ["corechart"]});
    google.setOnLoadCallback(drawChart);

    function drawChart() {
        // Get data from servlet for the first line
        var jsonData1 = '${requestScope.dataChart1}'; // Accessing the attribute containing the first dataset using EL
        var javaData1 = JSON.parse(jsonData1);

        // Get data from servlet for the second line
        var jsonData2 = '${requestScope.dataChart2}'; // Accessing the attribute containing the second dataset using EL
        var javaData2 = JSON.parse(jsonData2);

        // Combine data from both datasets into one
        var combinedData = [];
        for (var i = 0; i < Math.max(javaData1.length, javaData2.length); i++) {
            var row = [];
            if (javaData1[i]) {
                row.push(javaData1[i][0]);
                row.push(parseFloat(javaData1[i][1]));
            } else {
                row.push(null);
                row.push(null);
            }
            if (javaData2[i]) {
                row.push(parseFloat(javaData2[i][1]));
            } else {
                row.push(null);
            }
            combinedData.push(row);
        }

        // Create data array dynamically
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'day');
        data.addColumn('number', 'Successful OrderLines');
        data.addColumn('number', 'Total OrderLines');
        data.addRows(combinedData);

        // Create options for the chart
        var options = {
            title: "Revenues trends by day",
            curveType: "function",
            legend: {position: "bottom"}
        };

        // Draw the chart
        var chart = new google.visualization.LineChart(document.getElementById("chart"));
        chart.draw(data, options);
    }
</script>

</body>

</html>