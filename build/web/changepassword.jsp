<%-- 
    Document   : changepassword
    Created on : Jan 18, 2024, 12:06:40 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="./assets/css/changepassword.css">
    <title>Change password</title>
</head>

<body>


    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <h3 style="text-align: center;">Change Password</h3>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-6 col-sm-offset-3 changebox">
                <input type="password" class="input-lg form-control" name="password1" id="password1"
                    placeholder="Old Password" autocomplete="off">
                <br>


                <form method="post" id="passwordForm">
                  


                    <input type="password" class="input-lg form-control" name="password1" id="password1"
                        placeholder="New Password" autocomplete="off">
                    <div class="row">
                        <div class="col-sm-12">
                            <span>
                                The password must be 8-20 characters, and must not contain spaces.
                            </span>
                        </div>

                    </div>
                    
                    <input type="password" class="input-lg form-control" name="password2" id="password2"
                        placeholder="Repeat Password" autocomplete="off">
                    <div class="row">
                        <div class="col-sm-12">
                            <span>
                                To confirm, type the new password again.

                            </span>
                        </div>
                    </div>
                    <input type="submit"
                        class="col-xs-12 btn btn-success btn-primary btn-load btn-lg custom-green-button"
                        data-loading-text="Changing Password..." value="Change Password">
                </form>
            </div><!--/col-sm-6-->
        </div><!--/row-->
    </div>
</body>

</html>
