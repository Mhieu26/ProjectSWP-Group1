<%-- 
    Document   : EditAccount
    Created on : Oct 3, 2023, 9:29:03 PM
    Author     : ManhHieuNguyen
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.User"%>
<%@page import="java.util.List"%>
<%@page import="Dao.UserDAO"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Add User</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>

        <style>
            img{
                width: 200px;
                height: 120px;
            }
        </style>
    <body>
     
        <div class="container">
            
            <div id="editEmployeeModal">
                <div class="modal-dialog">
                    <div class="modal-content">
<form action="adminAddUserController" method="post" onsubmit="return validateForm()">
                            <div class="modal-header">						
                                <h4 class="modal-title">Add User</h4>
                                <button type="button" class="close" data-dismiss="modal"  aria-hidden="true" onclick="redirectToHome()" >&times;</button>
                            </div>
                            <div class="modal-body">					
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Your Name" name="name">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Address" name="address">
                                </div>
                                <div class="form-group">
                                   <input type="email" class="form-control" placeholder="Email" onchange="validateEmail(this.value)" name="email">

                                </div>
                                <div class="form-group">
                                    <input type="tel" class="form-control" placeholder="Phone number" onchange="validatePhone(this.value)" name="phone">

                                </div>
                                <div class="form-group">
                                    <select name="sex" class="form-control">
                                        <option value="" disabled selected hidden>Sex</option>
                                        <option value="true">Male</option>
                                        <option value="false">Female</option>
                                    </select>
                                </div>
                                <div class="form-group">
<input type="password" id="pwd" class="form-control" placeholder="Password" onchange="validatePassword(this.value)" name="password">
                                </div>
                                <div class="form-group">
                                    <input type="password" id="cpwd" class="form-control" placeholder="Confirm password">
                                </div>
                                <% String errorMessage = (String) request.getAttribute("errorMessage"); %>
<% if (errorMessage != null) { %>
    <div style="color: red;"><%= errorMessage %></div>
<% } %>
                                
                            </div>
                            <div class="modal-footer">
                                <input type="submit" class="btn btn-success" value="Update" style="background-color: #39435C">
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </div>
        



        <script src="js/manager.js" type="text/javascript"></script>
        

        <script>
function redirectToHome() {
    window.location.href = "adminUserListController"; // Thay thế "/" bằng URL của trang chủ của bạn
}
</script>


<script> 
    
    function validateForm() {
    var name = document.getElementsByName("name")[0].value.trim();
    var address = document.getElementsByName("address")[0].value.trim();
    var email = document.getElementsByName("email")[0].value.trim();
    var phone = document.getElementsByName("phone")[0].value.trim();
    var password = document.getElementsByName("password")[0].value.trim();
    var confirmPassword = document.getElementById("cpwd").value.trim();
        var confirmPassword = document.getElementById("cpwd").value.trim();


    // Kiểm tra name không được rỗng
    if (name === "") {
        alert("Name cannot be empty");
        return false;
    }

    // Kiểm tra address không được rỗng
    if (address === "") {
        alert("Address cannot be empty");
        return false;
    }

    // Kiểm tra email phải có định dạng hợp lệ
    var emailRegex = /^\S+@\S+\.\S+$/;
    if (!emailRegex.test(email)) {
        alert("Invalid email address");
        return false;
    }

    // Kiểm tra phone không được rỗng
    if (phone === "") {
        alert("Phone number cannot be empty");
        return false;
    }

    // Kiểm tra mật khẩu có ít nhất 8 ký tự và chứa ít nhất 1 chữ cái viết hoa và 1 chữ số
    var passwordRegex = /^(?=.*[A-Z])(?=.*\d).{8,}$/;
    if (!passwordRegex.test(password)) {
        alert("Password must be at least 8 characters long and contain at least one uppercase letter and one digit");
        return false;
    }

    // Kiểm tra mật khẩu nhập lại
    if (password !== confirmPassword) {
        alert("Passwords do not match");
        return false;
    }

    // Nếu tất cả điều kiện đều đúng, trả về true
    return true;
}

// Hàm validateEmail để kiểm tra email ngay khi người dùng thay đổi giá trị trong ô input
function validateEmail(email) {
    var emailRegex = /^\S+@\S+\.\S+$/;
    var emailResult = document.getElementById("email-result");
    if (!emailRegex.test(email)) {
        emailResult.textContent = "Invalid email address";
    } else {
        emailResult.textContent = "";
    }
}

// Hàm validatePhone để kiểm tra số điện thoại ngay khi người dùng thay đổi giá trị trong ô input
function validatePhone(phone) {
    var phoneRegex = /^\d{10}$/;
    var phoneResult = document.getElementById("phone-result");
    if (!phoneRegex.test(phone)) {
        phoneResult.textContent = "Invalid phone number";
    } else {
        phoneResult.textContent = "";
    }
}

// Hàm validatePassword để kiểm tra mật khẩu ngay khi người dùng thay đổi giá trị trong ô input
function validatePassword(password) {
    var confirmPassword = document.getElementById("cpwd").value.trim();
    var passwordRegex = /^(?=.*[A-Z])(?=.*\d).{8,}$/;
    var passwordResult = document.getElementById("password-result");
    var matchResult = document.getElementById("password-match");
    
    if (!passwordRegex.test(password)) {
        passwordResult.textContent = "Password must be at least 8 characters long and contain at least one uppercase letter and one digit";
    } else {
        passwordResult.textContent = "";
    }

    if (confirmPassword !== "") { // Check only if confirmPassword field is not empty
        if (password === confirmPassword) {
            matchResult.textContent = "Matching";
        } else {
            matchResult.textContent = "Not Matching";
        }
    } else {
        matchResult.textContent = ""; // Clear the message if confirmPassword field is empty
    }
}

</script>
    </body>
</html>