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
    <link rel="stylesheet" href="./assets/css/style.css">
    <title>UserProfile</title>
</head>

<body>
    <div class="container">
        <div class="row gutters">
            <div class="col-xl-3 col-lg-3 col-md-12 col-sm-12 col-12">
                <div class="card h-100">
                    <div class="card-body">
                        <div class="account-settings">
                            <div class="user-profile">
                                <div class="user-avatar">
                                    <img src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="Maxwell Admin"
                                        class="img-fluid">
                                </div>

                                <h6 class="user-email">nguyenmanhhieu267@gmail.com</h6>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-9 col-lg-9 col-md-12 col-sm-12 col-12">
                <div class="card h-100">
                    <div class="card-body">
                        <div class="row gutters">
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                <h6 class="mb-2 text-primary text-success">Personal Details</h6>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="fullName">Full Name</label>
                                    <input type="text" class="form-control" id="fullName" placeholder="Enter full name">
                                </div>
                            </div>



                        </div>
                        <div class="row gutters">

                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="eMail">Phone</label>
                                    <input type="email" class="form-control" id="eMail" placeholder="Phone">
                                </div>
                            </div>



                        </div>
                        <div class="row gutters">

                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="gender">Gender</label>
                                    <select class="form-control form-control-sm" id="gender" name="gender">
                                        <option value="male">Male</option>
                                        <option value="female">Female</option>
                                        <option value="other">Other</option> <!-- Thêm option mới -->
                                    </select>
                                </div>
                            </div>



                        </div>
                        <div class="row gutters">

                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="Street">Address </label>
                                    <input type="name" class="form-control" id="Street" placeholder="Enter Address">
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
                                            class="btn btn-success btn-primary">Update</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
<!--           <a href="home" class="arrow"><i><img src="./images/home-icon.png" alt=""></i></a>-->


</body>

</html>
