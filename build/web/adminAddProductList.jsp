
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="Model.Products, Model.User, Model.Image,Model.Category"%>
<%@page import="Dao.ProductsDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.text.DecimalFormat" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                            <span>Admin <i class="caret"></i></span>
                        </a>
                        <ul class="dropdown-menu dropdown-custom dropdown-menu-right">
                            <li class="dropdown-header text-center">Account</li>


                            <li class="divider"></li>



                            <li class="divider"></li>

                            <li>
                                <a href="home"><i class="fa fa-ban fa-fw pull-right"></i> Logout</a>
                            </li>
                        </ul>

                    </li>
                    </ul>
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
                         <li class="active">
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
                <section class="content">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="panel">
                                <header class="panel-heading">
                                    Add Product
                                </header>
                                <div class="panel-body table-responsive">
                                    <div class="sliderList">
                                        <form action="adminAddProductList" method="post">
                                            <div class="form-group col-md-6">
                                                <label class="control-label">ID</label>
                                                <input class="form-control" style="width:25%;" type="text"  name="pid" readonly value="${(s.getId()!=0 && s.getId()!=null)?s.getId():"Auto genarated"}">
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label for="exampleSelect1" class="control-label">Maker</label>
                                                <input class="form-control" type="text" name="maker" required pattern="[A-Za-z]+" value="${s.getMaker()}">
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label for="exampleSelect1" class="control-label">Product Name</label>
                                                <input class="form-control" type="text" name="name" required value="${s.getName()}">
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label for="exampleSelect1" class="control-label">Inventory</label>
                                                <input class="form-control" type="text" name="inventory" pattern="[0-9]+" required value="${s.getInventory()}">
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label class="control-label">Category</label>
                                                <select class="form-control" name="cid">
                                                    
                                                    <option value="1">smartphone</option>
                                                    <option value="2">laptop</option>
                                                    <option value="3">audio</option>
                                                    <option value="4">smartwatch</option>
                                                    <option value="5">accessory</option>
                                                    
                                                      
                                                </select>
                                            </div>

                                            <div class="form-group col-md-6">
                                                <label class="control-label">Price</label>
                                                <input class="form-control" type="text" name="price" pattern="([0-9]*[.])?[0-9]+"  required value="${s.getPrice()}">

                                            </div>
                                           
                                            <div class="form-group col-md-12">
                                                <label class="control-label">Description:</label>
                                                <textarea class="form-control" name="description" style="height: 95px;">${s.getDescription()}</textarea>
                                            </div>
                                           
                                            <div class="col-md-10">
                                                <div class="left-filter"> 
                                                    <input class="btn ${service=="Add"?"btn-primary":"btn-outline-danger"}" name="in" type="submit" value="Add">
                                                </div>  
                                                <c:if test="${error !=null}">
                                                    ${error}
                                                </c:if>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                </section><!-- /.content -->
            </div>

        </div>

        <!-- Modal -->
        <!-- You can add modal HTML code here for viewing/editing user details -->

        <!-- jQuery -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <!-- Bootstrap -->
        <script src="./admin/js/bootstrap.min.js" type="text/javascript"></script>

      


    </body>

</html>

