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
        <title>Edit User</title>
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
                        <form action="updateUserController" method="post">
                            <div class="modal-header">						
                                <h4 class="modal-title">Update User</h4>
                                <button type="button" class="close" data-dismiss="modal"  aria-hidden="true" onclick="redirectToHome()" >&times;</button>
                            </div>
                            <div class="modal-body">					
                                <div class="form-group">
                                    <label>ID</label>
                                    <input value="${user.id}" name="id" type="text" class="form-control" readonly required>
                                </div>
                                <div class="form-group">
                                    <label>Name</label>
                                    <input value="${user.name}" name="name" type="text" class="form-control" readonly required>
                                </div>
                                <div class="form-group">
                                    <label>Sex</label>
                                    <input value="${user.sex? 'Male' : 'Female'}" name="sex" type="text" class="form-control"  readonly required>
                                </div>
                                <div class="form-group">
                                    <label>Email</label>
                                    <input value="${user.email}" name="email" type="text" class="form-control" readonly required>
                                </div>
                                <div class="form-group">
                                    <label>Phone</label>
                                    <input value="${user.phone}" name="phone" type="text" class="form-control" readonly required>
                                </div>
                                <div class="form-group">
                                    <label>Role</label>
                                    <select name="role" class="form-control" required>
                                        <option value="1" ${user.role.id == 1 ? 'selected' : ''}>Customer</option>
                                        <option value="2" ${user.role.id == 2 ? 'selected' : ''}>Admin</option>
                                        <option value="3" ${user.role.id == 3 ? 'selected' : ''}>Sale</option>
                                        <option value="4" ${user.role.id == 4 ? 'selected' : ''}>Sale Manager</option>
                                        <option value="5" ${user.role.id == 5 ? 'selected' : ''}>Marketing</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>Status</label>
                                    <select name="status" class="form-control" required>
                                        <option value="true" ${user.status ? 'selected' : ''}>Active</option>
                                        <option value="false" ${!user.status ? 'selected' : ''}>Inactive</option>
                                    </select>
                                </div>


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

    </body>
</html>