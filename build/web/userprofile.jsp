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
            <div class="col-xl-3 col-lg-3 col-md-12 col-sm-12 col-12">
                <div class="card h-100">
                    <div class="card-body">
                        <div class="account-settings">
                            <div class="user-profile">
                                <div class="user-avatar" style="padding-top: 100px">
                           <img src="images/${requestScope.img.source}" 

                                    
                                        class="img-fluid">
                                </div>

                                <h6 class="user-email">${requestScope.user.email}</h6>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-9 col-lg-9 col-md-12 col-sm-12 col-12">
                <div class="card h-100">
                    <div class="card-body">
                        <div class="row gutters">
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 title-user">
                                <h2 style="color: #ffc800" >Personal Details</h2>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="fullName">Full Name</label>
                                    <input type="text" class="form-control" id="fullName" placeholder="Enter full name" value="${requestScope.user.name}" >
                                </div>
                            </div>



                        </div>
                        <div class="row gutters">

                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="eMail">Phone</label>
                                    <input type="email" class="form-control" id="eMail" placeholder="Phone" value="${requestScope.user.phone}">
                                </div>
                            </div>



                        </div>
                        <div class="row gutters">

                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="gender">Gender</label>
                                    <select class="form-control form-control-sm" id="gender" name="gender" >
                                        <option value="male">${requestScope.user.sex?"Male":"Female"}</option>
                                        <option value="female"></option>
                                      
                                    </select>
                                </div>
                            </div>



                        </div>
                        <div class="row gutters">

                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="Street">Address </label>
                                    <input type="name" class="form-control" id="Street" placeholder="Enter Address" value="${requestScope.user.address}">
                                </div>
                            </div>



                        </div>
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="form-group">
                                <label for="profilePicture">Change Profile Picture</label>
                                <input type="file" class="form-control-file" id="profilePicture">
                            </div>
                            <div class="row gutters">
                                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                    <div class="text-right">
                                        <button type="button" id="submit" name="submit"
                                                class="btn btn-secondary back"><a href="home" >Cancel</a></button>
                                        <button type="button" id="submit" name="submit"
                                                class="btn btn-success btn-primary " style="background-color: #ffc800">Update</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
<!--           <a href="home" class="arrow"><i><img src="./images/home-icon.png" alt=""></i></a>-->

</div>
</body>

</html>
