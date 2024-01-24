<%-- 
    Document   : userprofile
    Created on : Jan 18, 2024, 11:47:16 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.usebootstrap.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="./assets/css/userprofile.css">
        <title>UserProfile</title>
    </head>

    <body style="background-color: rgb(21, 44, 129) " >
        <div style="padding-top: 50px">


            <div class="container">
                <div class="row gutters">
                    <form action="userController" method="post">
                        <div class="col-xl-4 col-lg-4 col-md-12 col-sm-12 col-12">
                            <div class="card h-100">
                                <div class="card-body">
                                    <div class="account-settings">
                                        <div class="user-profile">
                                            <div class="user-avatar" style="padding-top: 100px">
                                                <img src="data:image/jpeg;base64,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" alt=" Hinh anh"


                                                     class="img-fluid">
                                            </div>

                                            <h6 class="user-email">${requestScope.user.email}</h6>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-8 col-lg-8 col-md-12 col-sm-12 col-12">
                            <div class="card h-100">
                                <div class="card-body">
                                    <div class="row gutters">
                                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 title-user">
                                            <h2 style="color: #ffc800" >Personal Details</h2>
                                        </div>
                                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                            <div class="form-group">
                                                <label for="fullName">Full Name</label>
                                                <input  name="name" type="text" class="form-control" id="fullName" placeholder="Enter full name" value="${requestScope.user.name}" >
                                            </div>
                                        </div>



                                    </div>
                                    <div class="row gutters">

                                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                            <div class="form-group">
                                                <label for="eMail">Phone</label>
                                                <input name="phone" type="number" class="form-control" id="eMail" placeholder="Phone" value="${requestScope.user.phone}">
                                            </div>
                                        </div>



                                    </div>
                                    <div class="row gutters">

                                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                            <div class="form-group ">
                                                <!--                                    <label for="gender">Gender</label>
                                                                                    <select class="form-control form-control-sm" id="gender" name="
                                                                                            
                                                                                            gender" >
                                                                                        <option value="male"></option>
                                                                                        <option value="female"></option>
                                                                                      
                                                                                    </select>--> 
                                                <input type="radio" name="gender" value="1" checked="">Male<!-- comment -->
                                                <input type="radio" name="gender" value="0" >FeMale<!-- comment -->

                                            </div>
                                        </div>



                                    </div>
                                    <div class="row gutters">

                                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                            <div class="form-group">
                                                <label for="Street">Address </label>
                                                <input type="name"  name="address" class="form-control" id="Street" placeholder="Enter Address" value="${requestScope.user.address}">
                                            </div>
                                        </div>



                                    </div>
                                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                        <div class="form-group">
                                            <label for="profilePicture">Change Profile Picture</label>
                                            <input name="image" type="file" class="form-control-file" id="profilePicture">
                                        </div>
                                        <div class="row gutters">
                                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                                <div class="text-right">
                                                                                            
                                                                                                    <a   class="btn btn-secondary back" href="home" >Cancel</a>
                                                                                            <button type="submit" name="submit"
                                                                                                    class="btn btn-success btn-primary " style="background-color: #ffc800">Update</button> 
<!--                                                   

                                                    </button>
                                                </div>
                                            </div>
                                            <H6>${requestScope.msg}</H6>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>

            </div>
    </body>

</html>
