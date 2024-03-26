<%-- 
    Document   : orderdetails
    Created on : Mar 7, 2024, 10:31:23 AM
    Author     : ducng
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.*"%>
<%@page import="Dao.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.text.DecimalFormat" %>
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


        <!-- header logo: style can be found in header.less -->
        <header class="header">
            <a href="index.html" class="logo">
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
                            <span>Saler<i class="caret"></i></span>
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
                        <% 
User user = (User)session.getAttribute("User"); 
ArrayList<OrderLine> orderlines = (ArrayList<OrderLine>) request.getAttribute("orderLines");
User userOrder = (User) request.getAttribute("userOrder");
Order order = (Order) request.getAttribute("order");
           
                        %>
                        <div class="pull-left info">
                            <p>Hello, <%= user.getName() %></p>

                            <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                        </div>
                    </div>

                    <!-- /.search form -->
                    <!-- sidebar menu: : style can be found in sidebar.less -->
                    <ul class="sidebar-menu">
                        <li>
                            <a href="saledashboard">
                                <i class="fa fa-comment"></i> <span>Dashboard</span>
                            </a>
                        </li>


                        <li>
                            <a href="orderslist">
                                <i class="fa fa-comment"></i> <span>Orders List</span>
                            </a>
                        </li>
                        <li class="active">
                            <a href="orderdetails">
                                <i class="fa fa-dashboard"></i> <span>Order Details</span>
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
                    <div class="row" style="margin-bottom:5px;"></div>

                    <div class="sm-st clearfix">
                        <span class="sm-st-icon st-red"><i class="fa fa-check-square-o"></i></span>
                        <div class="sm-st-info">
                            <span id="orderSuccess" ></span>
                            <p></p>
                            <span style="font: xx-large"> Order Details of OrderID : <%= order.getId() %></span>
                        </div>

                    </div>
                    <div class="row" style="margin-bottom:5px;">


                        <div class="col-md-12" ">
                            <div class="sm-st clearfix">
                                <span style="margin-right:  10px"><i class="fa fa-user"></i></span>                           
                                <span> Customer Name : <%= userOrder.getName() %></span> 
                                <span style="margin-left: 30px;margin-right: 10px"><i class="fa fa-envelope-o"></i></span> 
                                <span> Email : <%= userOrder.getEmail() %></span> 
                                <span style="margin-left: 30px;margin-right: 10px"><i class="fa fa-ban"></i></span> 
                                <span> Phone Number : <%= userOrder.getPhone() %></span>
                                <span style="margin-left: 30px;margin-right: 10px"><i class="fa fa-calendar"></i></span> 
                                <span> Order Date : <%= order.getOrderDate() %></span>
                                <span style="margin-left: 30px;margin-right: 10px"><i class="fa fa-dollar"></i></span> 
                                <span> Total Cost : <%= order.getTotal() %></span>
                                <span style="margin-left: 30px;margin-right: 10px"><i class="fa fa-share"></i></span> 
                                <span> Status : <select id="mySelectStatus" onchange="changeStatus(this)">
                                        <% if(order.getStatus().equals("pending")){ %>
                                        <option value="pending"  selected >Pending</option>
                                        <option value="completed">Completed</option>
                                        <% } else { %> 
                                        <option value="completed" selected>Completed</option>
                                        <option value="pending" >Pending</option>                                      
                                        <% }  %>
                                    </select></span>
                            </div>

                        </div>

                    </div>
                    <table class="table table-striped table-bordered">
                        <thead>
                            <tr>
                                <th>Thumbnail</th>
                                <th>Name</th>
                                <th>Category</th>
                                <th>Price</th>
                                <th>Quantity</th>
                                <th>Total</th>
                                <th>Saler</th>
                                <th>Sale Note</th>


                            </tr>
                        </thead>
                        <% 
                            ArrayList<User> saleList =(ArrayList<User>)request.getAttribute("saleList");
                            ProductsDAO proDAO = new ProductsDAO();
                        CategoryDAO cateDao = new CategoryDAO();
                    for (OrderLine item : orderlines){ImageDAO id=new ImageDAO();
                        long productID = item.getProductID();
                        Products product = proDAO.getProductsbyID((int)productID);
                        Image thumbnail=id.getThumbnailImagebyProductID(productID);
                        %>
                        <tbody>
                            <tr>                                                                        
                                <td style="width: 15%;"><img style="width: 30%;" src="<%= thumbnail.getSource()%>" alt="thumbnail" /></td>                
                                <td style="width: 15%;"><a href="shopdetail?id=<%= product.getId()%>&cateid=<%=product.getCategoryid()%>" ; style="color: #007ae1" ><%= product.getName() %>/</a></td><!-- comment -->
                                <td style="width: 10%;"><%= cateDao.getCategoryByID(product.getCategoryid()).getCategory() %></td>
                                <%
        // Số dạng khoa học
        double scientificNumber = proDAO.getProductsbyID(item.getProductID()).getPrice();

        // Tạo một đối tượng DecimalFormat
        DecimalFormat decimalFormat = new DecimalFormat("#.###");

        // Chuyển đổi số khoa học sang số thập phân
        String decimalNumber = decimalFormat.format(scientificNumber);
                                %>
                                <td style="width: 10%;"><%= decimalNumber %></td><!-- comment -->
                                <td style="width: 10%;"><%= item.getQuantity()%></td><!-- comment -->
                                <%  scientificNumber = item.getQuantity()*proDAO.getProductsbyID(item.getProductID()).getPrice();
                                decimalNumber = decimalFormat.format(scientificNumber);
                                %>
                                <td style="width: 10%;"><%= decimalNumber %></td><!-- comment -->
                                <% if(user.getRole().getId()==4||user.getRole().getId()==2){%>
                                <td style="width: 10%;">
                                    <select id="mySelect" onchange="changeSaler(this)">
                                        <% for(User saleList1 : saleList){
                                        if(saleList1.getId() == item.getSaleID()){ %>
                                        <option value="<%= saleList1.getId() %>" data-orderlineid="<%= item.getId() %>" data-salerid="<%= saleList1.getId() %>" selected><%= saleList1.getName() %></option>

                                        <% } else { %> 
                                        <option value="<%= saleList1.getId() %>" data-orderlineid="<%= item.getId() %>" data-salerid="<%= saleList1.getId() %>"><%= saleList1.getName() %></option>

                                        <% } } %>
                                    </select>
                                </td>
                                <% }else{ UserDAO uDAO = new UserDAO(); User saler = uDAO.getUserByID(item.getSaleID());   %>
                                <td style="width: 10%;"><%= saler.getName() %></td>
                                <%}%>
                                <td>
                                    <input type="text" data-orderlineid="<%= item.getId() %>" id="inputText" value="<%= item.getSaleNote()%>" onkeypress="checkEnter(event, this)">
                                </td>
                            </tr>
                        </tbody>
                        <% } %>

                    </table>

                </section>


        </div><!--end col-6 -->
    </div>
    <!-- row end -->
    <!-- /.content -->
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
<!-- Director for demo purposes -->
<script>
                                        function changeSaler(selectElement) {
                                            var selectedOption = selectElement.value;
                                            var orderLineID = selectElement.options[selectElement.selectedIndex].getAttribute('data-orderlineid');
                                            var salerID = selectElement.options[selectElement.selectedIndex].getAttribute('data-salerid');
                                            var urlParams = new URLSearchParams(window.location.search);
                                            var orderID = urlParams.get('orderID');
                                            window.location.href = "orderdetails?orderLineID=" + orderLineID + "&salerID=" + salerID + "&orderID=" + orderID;

                                        }

                                        function changeStatus(mySelectStatus) {
                                            var selectedOption = mySelectStatus.value;
                                            var urlParams = new URLSearchParams(window.location.search);
                                            var orderID = urlParams.get('orderID');
                                            window.location.href = "orderdetails?status=" + selectedOption + "&orderID=" + orderID;

                                        }
                                        function checkEnter(event, inputElement) {
                                            if (event.keyCode === 13) {
                                                var orderLineID = inputElement.getAttribute('data-orderlineid');
                                                var urlParams = new URLSearchParams(window.location.search);
                                                var orderID = urlParams.get('orderID');
                                                var inputValue = inputElement.value;
                                                // Điều hướng đến trang khác với giá trị của input là tham số truy vấn
                                                window.location.href = "orderdetails?salenote=" + inputValue + "&orderID=" + orderID + "&orderLineID=" + orderLineID;
                                            }
                                        }

</script>
</body>

</html>
