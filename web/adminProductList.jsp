
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
                            <p>Hello, Admin</p>
                            <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                        </div>
                    </div>
                    <!-- search form -->

                    <!-- /.search form -->
                    <!-- sidebar menu: : style can be found in sidebar.less -->
                    <ul class="sidebar-menu">
                        <li>
                            <a href="adminDashboardController">
                                <i class="fa fa-dashboard"></i> <span>Dashboard</span>
                            </a>
                        </li>
                        <li class="active">
                            <a href="adminProductList">
                                <i class="fa fa-user"></i> <span>ProductList</span>
                            </a>
                        </li>
                        <li>
                            <a href="adminSettingListController">
                                <i class="fa fa-cog"></i> <span>ProductDetail</span>
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
                <%@ include file="../../common/Message.jsp" %>
                <section class="header container">
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
                    <div class="search col-md-6">
                        <label style="margin-left: 300px">Search:</label>
                        <input type="text" name="" id="search" placeholder="Search">
                    </div>
                </section>
                <form action="adminUserListController" method="get">
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
                                                        <th>Thumbnail</th>
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
                                <td style="width: 100px;height: 100px;"> 
                                    <img style="width: 100%" src="<%= tn.getSource()%>" alt="" class="img-responsive"></td>
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
                                            <div class="bottom-field">
                                                <ul class="pagination">
                                                    <li class="prev"><a href="#" id="prev">&#139;</a></li>
                                                    <!-- page number here -->
                                                    <li class="next"><a href="#" id="next">&#155;</a></li>
                                                </ul>
                                            </div>
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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <!-- Bootstrap -->
        <script src="./admin/js/bootstrap.min.js" type="text/javascript"></script>

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





                                // search content 
                                var search = document.getElementById("search");
                                search.onkeyup = e => {
                                    const text = e.target.value;
                                    for (let i = 0; i < tr.length; i++) {
                                        const matchText = tr[i].querySelectorAll("td")[1].innerText;
                                        const matchPhone = tr[i].querySelectorAll("td")[4].innerText;
                                        const matchMail = tr[i].querySelectorAll("td")[3].innerText;
                                        if (matchText.toLowerCase().indexOf(text.toLowerCase()) > -1 || matchPhone.toLowerCase().indexOf(text.toLowerCase()) > -1 || matchMail.toLowerCase().indexOf(text.toLowerCase()) > -1) {
                                            tr[i].style.visibility = "visible";
                                        } else {
                                            tr[i].style.visibility = "collapse";
                                        }
                                    }
                                }


// Function to apply filters
// Function to apply filters
                                function applyFilters() {
                                    var cateFilter = document.querySelector("select[name='category']").value;
                                    var makerFilter = document.querySelector("select[name='maker']").value;
                                    var statusFilter = document.querySelector("select[name='status']").value;

                                    var tr = document.querySelectorAll("#user-table tbody tr");

                                    // Create an array to store filtered rows
                                    var filteredRows = [];

                                    tr.forEach(function (row) {
                                        var cate = row.querySelector("td:nth-child(7)").innerText.toLowerCase();
                                        var maker = row.querySelector("td:nth-child(4)").innerText.toLowerCase();
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

