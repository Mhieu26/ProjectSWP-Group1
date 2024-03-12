<%-- 
    Document   : blog.jsp
    Created on : Jan 19, 2024, 3:17:14 PM
    Author     : bxthu
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Products, Model.User, Model.Image, Model.Cart, Model.CartItem"%>
<%@page import="Dao.ProductsDAO"%>
<%@ page import="java.util.*, java.text.*" %>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
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
        <style>
            .right-align {
                text-align: right;
            }
            .frame {
                border: 1px solid black;
                padding: 5px;
                box-shadow: 5px 5px 5px grey;
            }
        </style>
    </head>
    <body id="body">
        
        <div class="container" id="about">
            <h2>Add Blog</h2>
            <%@ include file="../../common/Message.jsp" %>

            <form action="${pageContext.request.contextPath}/CreateBlog" method="post" enctype="multipart/form-data">
                <!-- Title -->
                <div class="mb-3">
                    <label for="title" class="form-label">Title</label>
                    <input type="text" class="form-control" name="title" required>
                </div>

                <!-- Brief Information -->
                <div class="mb-3">
                    <label for="briefinfo" class="form-label">Brief Information</label>
                    <textarea class="form-control" id="briefinfo" name="briefinfo" rows="3" required></textarea>
                </div>

                <!-- Content -->
                <div class="mb-3">
                    <label for="content" class="form-label">Content</label>
                    <textarea class="form-control" id="content" name="content" rows="6" required></textarea>
                </div>

                <!-- Author -->
                <div class="mb-3">
                    <label for="author" class="form-label">Author</label>
                    <input type="text" class="form-control" id="author" name="author" required>
                </div>

                <!-- Image File Upload -->
                <div class="mb-3">
                    <label for="file" class="form-label">Image File</label>
                    <input type="file" class="form-control" id="file" name="file" accept="image/*" required>
                </div>

                <!-- Blog Category -->
                <div class="mb-3">
                    <label for="blogcategory" class="form-label">Blog Category</label>
                    <select class="form-select" id="blogcategory" name="blogcategory" required>
                        <c:forEach var="b" items="${blogcategories}">
                            <option value="${b.getId()}">${b.getName()}</option>
                        </c:forEach>
                    </select>
                </div>

                <!-- Submit Button -->
                <button type="submit" class="btn btn-primary">Submit</button>

                <hr>
                <a href="settingblogs" class="btn btn-secondary">Back to List Setting Blogs</a>

            </form>
        </div>
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
<script type="text/javascript">
                                        $('input').on('ifChecked', function (event) {
                                            // var element = $(this).parent().find('input:checkbox:first');
                                            // element.parent().parent().parent().addClass('highlight');
                                            $(this).parents('li').addClass("task-done");
                                            console.log('ok');
                                        });
                                        $('input').on('ifUnchecked', function (event) {
                                            // var element = $(this).parent().find('input:checkbox:first');
                                            // element.parent().parent().parent().removeClass('highlight');
                                            $(this).parents('li').removeClass("task-done");
                                            console.log('not');
                                        });

</script>

    </body>
</html>

