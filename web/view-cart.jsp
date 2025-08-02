<%-- 
    Document   : view-cart
    Created on : May 18, 2024, 3:02:06 PM
    Author     : Admin
--%>

<%@page import="control.ProductCart"%>
<%@page import="entity.CartBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    </head>
    <body>
    <a href="Home.jsp" class="w3-bar-item w3-button w3-mobile w3-green">Back</a>
        <div class="container">
            <div class="table-wrapper">
                <h2>Giỏ Hàng</h2>
                <a class="btn btn-primary btn-sm" href="home">Thêm giỏ hàng</a>
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>id</th>
                            <th>Ten SP</th>
                            <th>Gia</th>
                            <th>So Luong</th>
                            <th>Image</th>
                            <th>Action</th>

                        </tr>
                    </thead>
                    <tbody>
                        <%
                            int i;
                            for (i = 0; i < ProductCart.listCart.size(); i++) {
                                CartBean cart = ProductCart.listCart.get(i);
                        %>
                        <tr>
                            <td><%=i + 1%></td>
                            <td><%=cart.getPro().getName()%></td>
                            <td><%=cart.getPro().getPrice()%></td>
                            <td><%=cart.getQuantity()%></td>
                            <td><img src="<%=cart.getPro().getImage()%>"></td>
                            <td><a class="btn btn-danger btn-sm" href="ProductCart?action=DelCart&id=<%=i%>">Loại Bỏ</a> </td>
                        </tr>
                        <%
                            }
                        %>
                        <tr>
                    <a class="btn btn-success btn-sm" href="order-form.jsp">Đặt Hàng</a>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>

