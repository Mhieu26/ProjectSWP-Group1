<%-- 
    Document   : EditAccount
    Created on : Oct 3, 2023, 9:29:03 PM
    Author     : ManhHieuNguyen
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Products, Model.Image"%>
<%@page import="java.util.List"%>
<%@page import="Dao.ProductsDAO"%>
<%@ page import="java.text.DecimalFormat" %>
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
            <% 
            Products product = (Products)request.getAttribute("product");
            List<Image> imgs = (List<Image>)request.getAttribute("Images");
            %>
            <div id="editEmployeeModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="updateProductController" method="post" id="update">
                            <div class="modal-header">						
                                <h4 class="modal-title">Update Product</h4>
                                <button type="button" class="close" data-dismiss="modal"  aria-hidden="true" onclick="redirectToHome()" >&times;</button>
                            </div>
                            <div class="modal-body">					
                                <div class="form-group">
                                    <label>ID</label>
                                    <input value="<%=product.getId()%>" name="id" type="text" class="form-control" readonly required>
                                </div>
                                <div class="form-group">
                                    <label>Price</label>
                                    <input value="<%
                                                                DecimalFormat decimalFormat = new DecimalFormat("#,##0");
                                                                  double price = product.getPrice();
                
            String formattedPrice = decimalFormat.format(price);
            formattedPrice = formattedPrice.replaceAll("[,.]", "");

            out.print(formattedPrice);%>" name="price" type="text" class="form-control"  required>
                                </div>
                                <div class="form-group">
                                    <label>Maker</label>
                                    <input value="<%=product.getMaker()%>" name="maker" type="text" class="form-control"  readonly required>
                                </div>
                                <div class="form-group">
                                    <label>Inventory</label>
                                    <input value="<%=product.getInventory()%>" name="inventory" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label for="description">Description:</label>
                                    <textarea class="form-control" rows="5" form="update" name="description"><%= product.getDescription() != null ? product.getDescription() : ""%></textarea>
                                </div>

                                <div class="form-group">
                                    <label>Category</label>
                                    <input value="<%=product.getCategoryid()%>" name="category" type="text" class="form-control" readonly required>
                                </div>
                                <div class="form-group">
                                    <label>Status</label>
                                    <select name="status">
                                        <% if (product.getStatus() == false) { %>
                                        <option value="false">False</option>
                                        <option value="true">True</option>
                                        <% } else { %>
                                        <option value="true">True</option>
                                        <option value="false">False</option>
                                        <% } %>
                                    </select>

                                </div>

                            </div>

                        </form>
                        <div class="modal-body">	
                            <div class="form-group">
                                <label for="thumbnail">Thumbnail:</label>
                                <%if(!imgs.isEmpty()){
                                    for(Image img : imgs){
                                        if(img.getType().equals("thumbnail")){%>
                                <div style="border: solid 5px #F5F5F5; border-radius: 8px; width: fit-content; margin-bottom: 2%;">
                                    <img src="<%=img.getSource()%>" width="100%" alt="alt"/>
                                </div>
                                <%}}%>
                                <form action="changethumbnail" method="post" enctype="multipart/form-data" id="changethumbnail">
                                    <input type="text" name="productid" value="<%=product.getId()%>" hidden>
                                    <input type="text" name="type" value="thumbnail" hidden>
                                    <input type="text" name="imgid" value="<%=imgs.get(0).getId()%>" hidden>
                                    <input type="file" name="file"><br>
                                    <input type="submit" value="Upload" form="changethumbnail">
                                </form>
                                <%}else{%>
                                <form action="uploadproductimg" id="upthumbnail" method="post" enctype="multipart/form-data">
                                    <input type="text" name="productid" value="<%=product.getId()%>" hidden>
                                    <input type="text" name="type" value="thumbnail" hidden>
                                    <input type="file" name="file"><br>
                                    <input type="submit" value="Upload" form="upthumbnail">
                                </form>
                                <%}%>
                            </div>
                            <div class="form-group">
                                <label for="image">Images</label>
                                <div>
                                    <% for(int i=0; i<imgs.size(); i++){
                                        if(imgs.get(i).getType().equals("detail")){%>
                                    <div style="border: solid 5px #F5F5F5; border-radius: 8px; width: fit-content; margin-bottom: 2%; margin-right: 2%; display: inline-block;">
                                        <img src="<%=imgs.get(i).getSource()%>" width="100%" alt="alt"/>

                                    </div>
                                    <span style="font-size: large;"><a href="deleteimg?id=<%=imgs.get(i).getId()%>" class="text-danger"> <i class="fa fa-trash" aria-hidden="true"></i></a></span>
                                            <%}}%>
                                </div>

                                <form action="uploadproductimg" id="upimg" method="post" enctype="multipart/form-data">
                                    <input type="text" name="productid" value="<%=product.getId()%>" hidden>
                                    <input type="text" name="type" value="detail" hidden>
                                    <input type="file" name="file"><br>
                                    <input type="submit" value="Upload" form="upimg">
                                </form>

                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="submit" class="btn btn-success" form="update" value="Update" style="background-color: #39435C">
                        </div>
                    </div>
                </div>
            </div>

        </div>


        <script src="js/manager.js" type="text/javascript"></script>
        <script>
                                    function redirectToHome() {
                                        window.location.href = "adminProductList"; // Thay thế "/" bằng URL của trang chủ của bạn
                                    }
        </script>

    </body>
</html>