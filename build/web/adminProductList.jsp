
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="Model.Products, Model.User, Model.Image,Model.Category"%>
<%@page import="Dao.ProductsDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.text.DecimalFormat" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.User" %>

<%
    // Kiểm tra xem người dùng đã đăng nhập chưa
    User user = (User) request.getAttribute("user");
    if (user != null) {
        // Nếu đã đăng nhập, kiểm tra vai trò
        int role = (int)(user.getRole().getId());
        if (role != 2 && role != 5) { // Nếu không phải là vai trò 2
            response.sendRedirect("notFoundController"); // Chuyển hướng về trang home
            return; // Dừng xử lý tiếp theo
        }
    } else {
        // Nếu chưa đăng nhập, chuyển hướng đến trang đăng nhập
        response.sendRedirect("notFoundController"); // Ví dụ: Chuyển hướng đến trang đăng nhập
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
        <link href='http://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
        <!-- Theme style -->
        <link href="./admin/css/adminstyle.css" rel="stylesheet" type="text/css" />

  
    </head>

    <body class="skin-black">
        <!-- header logo: style can be found in header.less -->
        <header class="header">
            <a href="index.html" class="logo">
                <!-- Add the class icon to your logo image or logo icon to add the margining -->
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
                            <li><a href="marketingDashboard">Marketing Manager </a></li>
                                <% } } %>


                            <li>
                                <a href="home"><i class="fa fa-ban fa-fw pull-right"></i> Logout</a>
                            </li>
                        </ul>
                    </li>

                </div>
            </nav>
        </header>
        <div class="wrapper row-offcanvas row-offcanvas-left">
            <!-- Left side column. contains the logo and sidebar -->
            <aside class="left-side sidebar-offcanvas">
              <section class="sidebar">
                    <!-- Sidebar user panel -->
                    <div class="user-panel">
                        <div class="pull-left image">
                            <img src="./admin/img/26115.jpg" class="img-circle" alt="User Image" />
                        </div>
                        <div class="pull-left info">
                            <p>Hello</p>



                            <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                        </div>
                    </div>

                    <!-- /.search form -->
                    <!-- sidebar menu: : style can be found in sidebar.less -->
                    <ul class="sidebar-menu">
                        <li>
                            <a href="marketingDashboard">
                                <i class="fa fa-dashboard"></i> <span>Dashboard</span>
                            </a>
                        </li>
                        <li>
                            <a href="">
                                <i class="fa fa-cog"></i> <span>Setting Blogs</span>
                            </a>
                        </li>

                        <li>
                            <a href="customersList">
                                <i class="fa fa-user"></i> <span>Customers List</span>
                            </a>
                        </li>
                        <li>
                            <a href="slidersList">
                                <i class="fa fa-user"></i> <span>Sliders List</span>
                            </a>
                        </li>
                         <li    class="active">
                            <a href="adminProductList">
                                <i class="fa fa-user"></i> <span>ProductList</span>
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

            <!-- Right side column. Contains the navbar and content of the page -->
            <div class="right-side">
                <!-- search form -->

                <!-- /.search form -->
             

                <form action="adminUserListController" method="get" style="font-size: 20px">
                    <label style="margin-left: 30px">Filter by Category:</label>
                    <select name="category">
                        <option value="all">All</option>
                        <option value="smartphone">Smart Phone</option>
                        <option value="laptop">Laptop</option>
                        <option value="audio">Audio</option>
                        <option value="smartwatch">Smart Watch</option>
                        <option value="accessory">Accessory</option>
                        
                    </select>

                    <label style="margin-left: 50px">Filter by Maker:</label>
                    <select name="maker"  >
                        <option value="all">All</option>
                        <option value="samsung">samsung</option>
                        <option value="apple">apple</option>
                        <option value="xiaomi">xiaomi</option>
                        <option value="Asus">Asus</option>
                        <option value="Lenovo">Lenovo</option>
                        <option value="Dell">Dell</option>
                        <option value="Sony">Sony</option>
                        <option value="rapoo">rapoo</option>
                        <option value="logitech">logitech</option>
                        <option value="TECNO">TECNO</option>
                        <option value="TCL">TCL</option>
                    </select>

                    <label style="margin-left: 45px">Filter by Status:</label>
                    <select name="status" >
                        <option value="all">All</option>
                        <option value="active">Active</option>
                        <option value="inactive">Inactive</option>
                    </select>


                </form>


                <div class="content">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="box">

                                    <!-- /.box-header -->
                                    <div class="box-body">

                                        <div class="table-responsive">
                                            <table class="table table-bordered" id="user-table">
                                                <thead>
                                                    <tr>
                                                        <th>ID</th>
                                                        <th>Full Name</th>
                                                        <th style="width: 100px">Thumbnail</th>
                                                        <th>Price</th>
                                                        <th>Maker</th>
                                                        
                                                        <th>Status</th>
                                                        <th>Category</th>
                                                        <th>Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                     <% 
                      ArrayList<Products> products = (ArrayList<Products>) request.getAttribute("products");
                     ArrayList<Category> listc = (ArrayList<Category>) request.getAttribute("listc");
                       ArrayList<Image> thumbnails = (ArrayList<Image>) request.getAttribute("thumbnails");
                     for (Products p : products) {
                            %> 
                                                        <tr>
                                                            <td><%=p.getId()%></td>
                                                            <td><%=p.getName()%></td>
                                                             <%  for (Image tn : thumbnails) { %>
                                <%if(p.getId()==tn.getProductId()){ %>
                                <td> 
                                    <img style="" src="<%= tn.getSource()%>" alt="" class="img-thumbnail"></td>
                                <% } } %>
                                                         
                                                            <td><%
                                                                DecimalFormat decimalFormat = new DecimalFormat("#,##0.00");
                                                                  double price = p.getPrice();
                
            String formattedPrice = decimalFormat.format(price);
            formattedPrice = formattedPrice.replaceAll("\\.00$", "");

            out.print(formattedPrice);%></td>
                                                            <td><%=p.getMaker()%></td>
                                                            
                                                            <td><%=p.getStatus() ? "active" : "inactive" %></td>
                                                            <% for(Category c : listc){ %>
                                                            <% if(p.getCategoryid()==c.getId()){ %>
                                                            <td><%=c.getCategory()%></td>
                                                            <% }}%>
                                                            
                                                            <td > 
                                                                
                                                                    <a class="btn btn-primary" href="updateProductController?id=<%=p.getId()%>"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>
                                                               
                                                            <a class="btn btn-danger" href="deleteProduct?id=<%=p.getId()%>"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>

                                                        </tr>


                                                   <% } %>
                                                </tbody>
                                            </table>
                                           
                                        </div>

                                        <!-- /.table-responsive -->
                                    </div>
                                    <!-- /.box-body -->
                                </div>
                                <!-- /.box -->
                            </div>
                            <button id="addUserButton" onclick="location.href = 'adminAddProductList';" style="margin-left: 1000px; color: white; background-color: #39435C; " >Add New Product</button>

                            <!-- /.col -->
                        </div>
                        <!-- /.row -->
                    </div>
                    <!-- /.container-fluid -->
                </div>


                <!-- /.content -->
            </div>

        </div>

        <!-- Modal -->
        <!-- You can add modal HTML code here for viewing/editing user details -->

        <!-- jQuery -->
        <script src="https://code.jquery.com/jquery-3.7.1.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="./admin/js/datatable.js"></script>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <!-- Bootstrap -->
        <script src="./admin/js/bootstrap.min.js" type="text/javascript"></script>

        <script>
new DataTable('#user-table');		

                                function applyFilters() {
                                    var cateFilter = document.querySelector("select[name='category']").value;
                                    var makerFilter = document.querySelector("select[name='maker']").value;
                                    var statusFilter = document.querySelector("select[name='status']").value;

                                    var tr = document.querySelectorAll("#user-table tbody tr");

                                    // Create an array to store filtered rows
                                    var filteredRows = [];

                                    tr.forEach(function (row) {
                                        var cate = row.querySelector("td:nth-child(7)").innerText.toLowerCase();
                                        var maker = row.querySelector("td:nth-child(5)").innerText.toLowerCase();
                                        var status = row.querySelector("td:nth-child(6)").innerText.toLowerCase();

                                        // Check if row matches filters
                                        if ((cateFilter === 'all' || cate === cateFilter) &&
                                                (makerFilter === 'all' || maker === makerFilter) &&
                                                (statusFilter === 'all' || status === statusFilter)) {
                                            filteredRows.push(row);
                                        }
                                    });

                                    // Hide all rows
                                    tr.forEach(function (row) {
                                        row.style.display = "none";
                                    });

                                    // Show filtered rows
                                    filteredRows.forEach(function (row) {
                                        row.style.display = "";
                                    });
                                }

// Event listener for filter changes
                                document.querySelectorAll("select[name='category'], select[name='maker'], select[name='status']").forEach(function (select) {
                                    select.addEventListener("change", function () {
                                        applyFilters();
                                    });
                                });


        </script>


    </body>

</html>

