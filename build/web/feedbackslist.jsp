
<%-- 
    Document   : adminDashboard
    Created on : Feb 19, 2024, 10:57:15 PM
    Author     : DELL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.*"%>
<%@page import="Dao.*"%>
<%@page import="java.util.ArrayList"%>
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




        <style type="text/css">

        </style>
    </head>

    <body class="skin-black">
        <% 
        ArrayList<Feedback> listFeedBack = new ArrayList<Feedback>();
        listFeedBack = (ArrayList<Feedback>) request.getAttribute("listFeedBack");
        %>
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

                            <p>Hello,Manager</p>

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
                            <a href="settingblogs">
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
                        <li>
                            <a href="adminProductList">
                                <i class="fa fa-user"></i> <span>ProductList</span>
                            </a>
                        </li>
                        <li class="active">
                            <a href="feedbackslist">
                                <i class="fa fa-comment"></i> <span>Feedbacks List</span>
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

                    <div class="row" style="margin-bottom:5px;">    
                        <div class="col-md-12">
                            <div class="sm-st clearfix" style="width: 300%">
                                <span class="sm-st-icon st-blue"><i class="fa fa-angle-double-down"></i></span>
                                <p></p>
                                <div style="font-size: xx-large">
                                    Feedbacks List
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row" style="margin-bottom:5px;">


                        <div class="col-md-3">
                            <div class="sm-st clearfix">
                                <span class="sm-st-icon st-red"><i class="fa fa-check-square-o"></i></span>
                                <p></p>
                                <div class="sm-st-info">
                                    <span style="font: x-large">
                                        <%= listFeedBack.size()%> Feedback
                                    </span>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="sm-st clearfix">
                                <span class="sm-st-icon st-violet"><i class="fa fa-star"></i></span>
                                <p></p>
                                <div class="sm-st-info">
                                    <span>
                                        <%  int totalStar = 0;
                                         
                                             for (Feedback feedback1 : listFeedBack) {
                                             totalStar+= feedback1.getStar();
                                            }
                                        %>

                                        <% double average =(double) totalStar/listFeedBack.size(); %>                                  
                                        Average <%= String.format("%.2f", average) %><i class="fa fa-star" style="color: #FAD733; margin-left: 8px"></i>
                                    </span>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="sm-st clearfix">
                                <span class="sm-st-icon st-blue"><i class="fa fa-eye-slash"></i></span>
                                <p></p>
                                <div class="sm-st-info">
                                    <%  int countInvisible = 0;
                                         
                                         for (Feedback feedback1 : listFeedBack) {
                                         if(!feedback1.getStatus()){countInvisible++;}
                                        }
                                    %>
                                    <span >
                                        <%= countInvisible %> Feedback Invisible
                                    </span>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="sm-st clearfix">
                                <span class="sm-st-icon st-green"><i class="fa fa-eye"></i></span>
                                <p></p>
                                <div class="sm-st-info">
                                    <%  int countVisible = 0;
                                         
                                         for (Feedback feedback1 : listFeedBack) {
                                         if(feedback1.getStatus()){countVisible++;}
                                        }
                                    %>
                                    <span>
                                        <%= countVisible %> Feedback Visible
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row" style="margin-bottom:5px;">
                        <div class="col-md-12">
                            <div class="sm-st clearfix">
                                <div class="items-controller col-md-6">
                                    <label>Show</label>
                                    <select name="" id="itemperpage">
                                        <option value="04">04</option>
                                        <option value="05">05</option>
                                        <option value="08" selected>08</option>
                                        <option value="10">10</option>
                                        <option value="15">15</option>
                                    </select>
                                    <label>Per Page</label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">

                        <div class="col-md-12">
                            <section class="panel">
                                <header class="panel-heading">
                                    Filter by 
                                </header>

                                <div class="panel-body table-responsive" style="width: 120%">
                                    <form method="post" action="feedbackslist">
                                        Status
                                        <select name="status" required="">
                                            <option value="" selected disabled hidden>Please select an option</option>
                                            <option value="all">All</option>
                                            <option value="true">Invisible</option>
                                            <option value="false">Visible </option>

                                        </select>
                                        Product
                                        <select name="product" required="">
                                            <option value="" selected disabled hidden>Please select an option</option>
                                            <option value="all">All</option>
                                            <% ProductsDAO proDAO = new ProductsDAO();
                                               ArrayList<Products> products = proDAO.getProducts();
                                               for (Products product : products){%>          
                                            <option value="<%= product.getId() %>"><%= product.getName()%> </option>
                                            <% } %>
                                        </select>
                                        Rate Star
                                        <select name="ratestar" required="">
                                            <option value="" selected disabled hidden >Please select an option</option>
                                            <option value="all">All</option>
                                            <option value="5">5</option>
                                            <option value="4">4</option>
                                            <option value="3">3</option>
                                            <option value="2">2</option>
                                            <option value="1">1</option>
                                        </select>
                                        Content
                                        <input  name="content" placeholder="Search">
                                        <button type="submit">Filter</button>
                                    </form>
                                </div>


                                <div class="panel-body table-responsive">
                                    <table class="table table-striped table-bordered">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Content</th>
                                                <th>Product Name</th>
                                                <th>Rated Star</th>
                                                <th>Status</th>
                                                <th>More Option</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%                                              
                                            if (listFeedBack != null) {
                                                for (Feedback feedback : listFeedBack) {
                                            %>
                                            <tr>
                                                <td><%= feedback.getId() %></td>
                                                <td><%= feedback.getContent() %></td>
                                                <% ProductsDAO proDao = new ProductsDAO();
                               Products product = proDao.getProductsbyID(feedback.getProductid()); %>
                                                <td><%= product.getName() %></td>
                                                <td><%= feedback.getStar() %></td>
                                                <td>
                                                    <% if(!feedback.getStatus()) { %>
                                                    Invisible<% }else{ %>
                                                    Visible <% } %></td>     
                                                <td>
                                                    <a href="#" data-feedbackid="<%= feedback.getId()%>" data-status="<%= feedback.getStatus()%>" class="changeStatusLink" style="margin-right: 20px;">Change Status</a>
                                                    <a href="feedbackdetails?feedbackID=<%= feedback.getId()%>">View Detail</a></td>
                                            </tr>
                                            <% 
                                                }
                                            }
                                            %>
                                        </tbody>
                                    </table>

                                </div>
                                <div class="row" style="margin-bottom:5px;">
                                    <div class="col-md-3">
                                        <div class="sm-st clearfix">
                                            <div class="bottom-field">
                                                <ul class="pagination">
                                                    <li class="prev"><a href="#" id="prev">&#139;</a></li>
                                                    <!-- page number here -->
                                                    <li class="next"><a href="#" id="next">&#155;</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                            </section>


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
        var sortDirection = 1;

        document.querySelectorAll(".table th").forEach(function (th, index) {
            th.addEventListener("click", function () {
                sortTable(index, sortDirection);
                sortDirection *= -1;
            });
        });
    });

    function sortTable(columnIndex, sortDirection) {
        var table, rows, switching, i, x, y, shouldSwitch;
        table = document.querySelector(".table");
        switching = true;

        while (switching) {
            switching = false;
            rows = table.getElementsByTagName("tr");
            for (i = 1; i < (rows.length - 1); i++) {
                shouldSwitch = false;
                x = rows[i].getElementsByTagName("td")[columnIndex].innerHTML;
                y = rows[i + 1].getElementsByTagName("td")[columnIndex].innerHTML;

                // Kiểm tra nếu x và y là số
                if (!isNaN(parseFloat(x)) && !isNaN(parseFloat(y))) {
                    x = parseFloat(x);
                    y = parseFloat(y);
                }

                if (sortDirection === 1) {
                    if (x > y) {
                        shouldSwitch = true;
                        break;
                    }
                } else {
                    if (x < y) {
                        shouldSwitch = true;
                        break;
                    }
                }
            }
            if (shouldSwitch) {
                rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                switching = true;
            }
        }
    }
</script>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        var changeStatusLinks = document.querySelectorAll('.changeStatusLink');
        changeStatusLinks.forEach(function (link) {
            link.addEventListener('click', function (event) {
                event.preventDefault(); // Ngăn chặn hành động mặc định của thẻ <a>

                var feedbackId = this.getAttribute('data-feedbackid');
                var status = this.getAttribute('data-status');

                var confirmResult = confirm("Do you want to change this feedbacks status ?");
                if (confirmResult) {
                    // Nếu người dùng đồng ý, chuyển hướng đến URL cụ thể với các tham số feedbackId và status
                    var url = "feedbackslist?feedbackID=" + feedbackId + "&status=" + status;
                    window.location.href = url;
                } else {
                    // Nếu người dùng không đồng ý, không làm gì cả hoặc thực hiện các hành động khác tùy ý
                }
            });
        });
    });
</script>
<script>


    var tbody = document.querySelector("tbody");
    var pageUl = document.querySelector(".pagination");
    var itemShow = document.querySelector("#itemperpage");
    var tr = tbody.querySelectorAll("tr");
    var emptyBox = [];
    var index = 1;
    var itemPerPage = 8;

    for (let i = 0; i < tr.length; i++) {
        emptyBox.push(tr[i]);
    }

    itemShow.onchange = giveTrPerPage;
    function giveTrPerPage() {
        itemPerPage = Number(this.value);
        // console.log(itemPerPage);
        displayPage(itemPerPage);
        pageGenerator(itemPerPage);
        getpagElement(itemPerPage);
    }

    function displayPage(limit) {
        tbody.innerHTML = '';
        for (let i = 0; i < limit; i++) {
            tbody.appendChild(emptyBox[i]);
        }
        const  pageNum = pageUl.querySelectorAll('.list');
        pageNum.forEach(n => n.remove());
    }
    displayPage(itemPerPage);

    function pageGenerator(getem) {
        const num_of_tr = emptyBox.length;
        if (num_of_tr <= getem) {
            pageUl.style.display = 'none';
        } else {
            pageUl.style.display = 'flex';
            const num_Of_Page = Math.ceil(num_of_tr / getem);
            for (i = 1; i <= num_Of_Page; i++) {
                const li = document.createElement('li');
                li.className = 'list';
                const a = document.createElement('a');
                a.href = '#';
                a.innerText = i;
                a.setAttribute('data-page', i);
                li.appendChild(a);
                pageUl.insertBefore(li, pageUl.querySelector('.next'));
            }
        }
    }
    pageGenerator(itemPerPage);
    let pageLink = pageUl.querySelectorAll("a");
    let lastPage = pageLink.length - 2;

    function pageRunner(page, items, lastPage, active) {
        for (button of page) {
            button.onclick = e => {
                const page_num = e.target.getAttribute('data-page');
                const page_mover = e.target.getAttribute('id');
                if (page_num != null) {
                    index = page_num;

                } else {
                    if (page_mover === "next") {
                        index++;
                        if (index >= lastPage) {
                            index = lastPage;
                        }
                    } else {
                        index--;
                        if (index <= 1) {
                            index = 1;
                        }
                    }
                }
                pageMaker(index, items, active);
            }
        }

    }
    var pageLi = pageUl.querySelectorAll('.list');
    pageLi[0].classList.add("active");
    pageRunner(pageLink, itemPerPage, lastPage, pageLi);

    function getpagElement(val) {
        let pagelink = pageUl.querySelectorAll("a");
        let lastpage = pagelink.length - 2;
        let pageli = pageUl.querySelectorAll('.list');
        pageli[0].classList.add("active");
        pageRunner(pagelink, val, lastpage, pageli);

    }



    function pageMaker(index, item_per_page, activePage) {
        const start = item_per_page * index;
        const end = start + item_per_page;
        const current_page = emptyBox.slice((start - item_per_page), (end - item_per_page));
        tbody.innerHTML = "";
        for (let j = 0; j < current_page.length; j++) {
            let item = current_page[j];
            tbody.appendChild(item);
        }
        Array.from(activePage).forEach((e) => {
            e.classList.remove("active");
        });
        activePage[index - 1].classList.add("active");
    }
</script>
</body>

</html>