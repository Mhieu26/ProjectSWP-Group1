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
                                        if(orderline1.getStatus().equals("Complete")){
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
                                        <%= totalSold %> Order Line Complete
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
                        <h4><label  for="selectOption">Trend of success/total orders for the last 7 days ,Filter by </label></h4>
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
                        <button type="submit">Filter</button>
                    </form>
                    <div id="chart"></div>
                    <h3>OrderLines Information</h3>
                    <div class="row" style="margin-bottom:5px;">
                        <div class="col-md-12">
                            Show
                            <select name="" id="itemperpage">
                                <option value="04">04</option>
                                <option value="05">05</option>
                                <option value="08" selected>08</option>
                                <option value="10">10</option>
                            </select>
                            Per Page                       
                        </div>
                    </div>                 
                    <table class="table table-striped table-bordered">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Product Name</th>
                                <th>Saler</th>
                                <th>Quantity</th>
                                <th>Price</th>
                                <th>OrderID</th>


                                <th>OrderDate</th>
                                <th>EndDate</th>
                                <th>Status</th>

                            </tr>
                        </thead>
                        <tbody>
                            <% 
                            int id = 1;
                        
                                for (OrderLine orderline : orderlines) {
                            %>
                            <tr>
                                <td><%= id %></td>
                                <td><%= orderline.getProduct().getName() %></td>                     
                                <td style="width: 10%;">
                                    <select id="mySelect" onchange="changeSaler(this)">
                                        <% for(User saleList1 : saleList){
                                        if(saleList1.getId() == orderline.getSaleID()){ %>
                                        <option value="<%= saleList1.getId() %>" data-orderlineid="<%= orderline.getId() %>" data-salerid="<%= saleList1.getId() %>" selected><%= saleList1.getName() %></option>

                                        <% } else { %> 
                                        <option value="<%= saleList1.getId() %>" data-orderlineid="<%= orderline.getId() %>" data-salerid="<%= saleList1.getId() %>"><%= saleList1.getName() %></option>

                                        <% } } %>
                                    </select>
                                </td>                                                  
                                <td><%= orderline.getQuantity() %></td>
                                <td ><div class="text-right"><%= orderline.getPrice() %></div></td>
                                <td><a href="orderdetails?orderID=<%= orderline.getOrderID() %>"><%= orderline.getOrderID() %></a></td>
                                <td><input type="datetime" value="<%= orderline.getOrderDate() %>" id="setOrderDate" data-orderlineid="<%= orderline.getId() %>" onkeypress="checkEnter(event, this, 'setOrderDate')"></td>
                                <td><input type="datetime" value="<%= orderline.getEndDate() %>" id="setEndDate" data-orderlineid="<%= orderline.getId() %>" onkeypress="checkEnter(event, this, 'setEndDate')" ></td>

                                <td>
                                    <select id="mySelectStatus" onchange="changeStatus(this)">
                                        <% if(orderline.getStatus().equals("pending")){ %>
                                        <option value="pending" data-orderlineid="<%= orderline.getId() %>" data-status="pending" selected >Pending</option>
                                        <option value="complete" data-orderlineid="<%= orderline.getId() %>" data-status="complete" >Complete</option>
                                        <% } else { %> 
                                        <option value="complete" data-orderlineid="<%= orderline.getId() %>" data-status="complete" selected>Complete</option>
                                        <option value="pending" data-orderlineid="<%= orderline.getId() %>" data-status="pending" >Pending</option>                                      
                                        <% }  %>
                                    </select></td>

                            </tr>
                            <% 
                                id++;
                                }
                            %>
                        </tbody>
                    </table>
                    <div class="row" style="margin-bottom:5px;">
                        <div class="col-md-12">

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

                                                curveType: "function",
                                                legend: {position: "bottom"}
                                            };

                                            // Draw the chart
                                            var chart = new google.visualization.LineChart(document.getElementById("chart"));
                                            chart.draw(data, options);
                                        }
</script>
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
<script>
    function changeSaler(selectElement) {
        var selectedOption = selectElement.value;
        var orderLineID = selectElement.options[selectElement.selectedIndex].getAttribute('data-orderlineid');
        var salerID = selectElement.options[selectElement.selectedIndex].getAttribute('data-salerid');
        window.location.href = "saledashboard?orderLineID=" + orderLineID + "&salerID=" + salerID;

    }

    function changeStatus(mySelectStatus) {
        var selectedOption = mySelectStatus.value;
        var status = mySelectStatus.options[mySelectStatus.selectedIndex].getAttribute('data-status');
        var orderLineID = mySelectStatus.options[mySelectStatus.selectedIndex].getAttribute('data-orderlineid');
        window.location.href = "saledashboard?status=" + status + "&orderLineID=" + orderLineID;
    }

    function checkEnter(event, inputElement, inputType) {
        // Check if Enter key is pressed
        if (event.keyCode === 13) {
            var orderLineID = inputElement.getAttribute('data-orderlineid');
            var inputValue = inputElement.value;
            var url;

            // Get current date
            var currentDate = new Date();

            // Check if it's the setOrderDate input
            if (inputType === 'setOrderDate') {
                var endDateInput = document.getElementById('setEndDate');
                var endDateValue = endDateInput.value;
                var orderDate = new Date(inputValue);
                var endDate = new Date(endDateValue);

                // Check if EndDate > OrderDate, OrderDate < currentDate, and EndDate < currentDate
                if (endDate > orderDate && orderDate < currentDate && endDate < currentDate) {
                    url = "saledashboard?orderDate=" + inputValue + "&orderLineID=" + orderLineID;
                    window.location.href = url;
                } else {
                    // Alert if input values are not valid
                    alert("Please enter valid dates!");
                }
            }

            // Check if it's the setEndDate input
            if (inputType === 'setEndDate') {
                var orderDateInput = document.getElementById('setOrderDate');
                var orderDateValue = orderDateInput.value;
                var orderDate = new Date(orderDateValue);
                var endDate = new Date(inputValue);

                // Check if EndDate > OrderDate, OrderDate < currentDate, and EndDate < currentDate
                if (endDate > orderDate && orderDate < currentDate && endDate < currentDate) {
                    url = "saledashboard?endDate=" + inputValue + "&orderLineID=" + orderLineID;
                    window.location.href = url;
                } else {
                    // Alert if input values are not valid
                    alert("Please enter valid dates!");
                }
            }
        }
    }

</script>
</body>

</html>