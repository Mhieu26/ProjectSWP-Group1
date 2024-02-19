<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css" />
        <link rel="stylesheet" href="./assets/css/userprofile.css">

        <title>Userprofile</title>
    </head>
    <body>
        <form  action="userController" method="post">

            <div class="container">
                <div class="row gutters">
                    <div class="col-xl-3 col-lg-3 col-md-12 col-sm-12 col-12">
                        <div class="card h-100">
                            <div class="card-body">
                                <div class="account-settings">
                                    <div class="user-profile">
                                        <div class="user-avatar">
                                            <img src="./images/${requestScope.img.source}" alt="fail">
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
                                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 textuser">
                                        <h3 class="mb-2 text-primary">Personal Details</h3>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-group">
                                            <label for="fullName">Full Name</label>
                                            <input type="text" class="form-control" id="fullName" placeholder="Enter full name" name="name" value="${requestScope.user.name}">
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-group">
                                            <label for="phone">Phone</label>
                                            <input type="text" class="form-control" id="phone" placeholder="Enter phone number" name="phone" value="${requestScope.user.phone}">
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-group">
                                            <label for="address">Address</label>
                                            <input type="text" class="form-control" id="address" placeholder="Enter address" name="address" value="${requestScope.user.address}">
                                        </div>
                                    </div>
                                    <div class="col-12 form-inline">
                                        <label class="mr-3">
                                            <input type="radio" name="gender" value="1" ${requestScope.user.sex == true ? 'checked' : ''}> Male
                                        </label>
                                        <label>
                                            <input type="radio" name="gender" value="0" ${requestScope.user.sex == false ? 'checked' : ''}> Female
                                        </label>
                                    </div>
<!--                                        doi tuong cu the moi dung true false con dau khi dung session thi dung 
-->
                                </div>
                                <div class="row gutters">
                                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                        <div class="text-right">
                                            <button type="button"  class="btn btn-secondary">Cancel</button>
                                            <button type="button" id="submit" name="submit" class="btn btn-dark">Update</button>
                                        </div>
                                    </div>
                                </div>
                                         </div>
                                                 <H6>${requestScope.msg}</H6>
                                            </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>

    </body>
</html>
