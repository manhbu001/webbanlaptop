<%@ page import="java.sql.*, context.DBContext" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet"/>
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet"/>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.1.0/mdb.min.css" rel="stylesheet"/>
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link href="./css/style.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
 
    <title>Quản lý đơn hàng</title>
    <style>
        table { width: 100%; border-collapse: collapse; }
        th, td { border: 1px solid black; padding: 8px; text-align: left; }
        th { background-color: #f2f2f2; }
    </style>
    
    <style>
    body {
        font-family: 'Roboto', sans-serif;
        background-color: #f0f2f5;
        padding: 20px;
    }

    h2 {
        text-align: center;
        margin-bottom: 20px;
        color: #333;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        background-color: white;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        border-radius: 10px;
        overflow: hidden;
    }

    th {
        background-color: #007bff;
        color: white;
        padding: 12px;
        text-align: center;
        font-size: 16px;
    }

    td {
        padding: 12px;
        text-align: center;
        border-bottom: 1px solid #ddd;
        color: #333;
    }

    tr:nth-child(even) {
        background-color: #f9f9f9;
    }

    tr:hover {
        background-color: #f1f1f1;
    }

    .w3-bar {
        margin-bottom: 30px;
    }

    .btn-outline-primary {
        background-color: #fff;
        border: 1px solid #007bff;
        color: #007bff;
        transition: 0.3s;
    }

    .btn-outline-primary:hover {
        background-color: #007bff;
        color: white;
    }

    /* Responsive */
    @media (max-width: 768px) {
        table, thead, tbody, th, td, tr {
            display: block;
        }

        td {
            text-align: left;
            padding-left: 50%;
            position: relative;
        }

        td::before {
            content: attr(data-label);
            position: absolute;
            left: 15px;
            font-weight: bold;
        }

        th {
            display: none;
        }
    }
</style>

</head>
<body>
    <div class="w3-bar w3-black" style="display: flex; align-items: center; justify-content: space-between;">
    <div style="display: flex; align-items: center;">
        <a href="https://media.discordapp.net/attachments/1153292530796986378/1379381560037343242/Gemini_Generated_Image_wczmutwczmutwczm.png?ex=684008af&is=683eb72f&hm=d0252b4c23149b8ccd34b0b805f7f468b5d2eafa139a0ebb538e5eadf7036ee4&=&format=webp&quality=lossless" class="w3-bar-item w3-button w3-mobile">
            <img src="https://media.discordapp.net/attachments/1153292530796986378/1379381560037343242/Gemini_Generated_Image_wczmutwczmutwczm.png?ex=684008af&is=683eb72f&hm=d0252b4c23149b8ccd34b0b805f7f468b5d2eafa139a0ebb538e5eadf7036ee4&=&format=webp&quality=lossless" alt="Logo" style="height:30px; vertical-align:middle; margin-right:5px;">
        </a>
        <a href="Home.jsp" class="w3-bar-item w3-button w3-mobile w3-green">Home</a>

        <c:if test="${sessionScope.acc.isSell == 1}">
            <a href="managerProduct" class="w3-bar-item w3-button">Quản lý sản phẩm</a>
        </c:if>
        <c:if test="${sessionScope.acc.isAdmin == 1}">
            <a href="ManagerAcc.jsp" class="w3-bar-item w3-button" target="blank">Quản lý tài khoản</a>
        </c:if>

        <c:if test="${sessionScope.acc.isAdmin == 1}">
            <a href="manageOrders.jsp" class="w3-bar-item w3-button" target="blank" style="background-color: rgba(0, 0, 0, 0.1); border: 2px solid #ccc; padding: 10px; border-radius: 5px;">Quản lý đơn hàng</a>
        </c:if>    
            
        <c:if test ="${sessionScope.acc != null}">
            <a href="logout" class="w3-bar-item w3-button">Đăng xuất</a>
            <a href="#" class="w3-bar-item w3-button">Xin chào ${sessionScope.acc.user}</a>
        </c:if>
        <c:if test="${sessionScope.acc == null}">
            <a href="login" class="w3-bar-item w3-button">Đăng nhập</a>
        </c:if>
        <!-- Search -->
        <form class="d-flex input-group w3-bar-item" style="width: 300px;" action="search" method="get" name="myformsearch" onsubmit="return validateForm()">
            <input name="txt" type="text" class="form-control w3-input w3-sand" placeholder="Nhập sản phẩm cần tìm" />
            <button id="MyBtn" class="btn btn-outline-primary" type="submit">Tìm kiếm</button>
        </form>
    </div>

    <!-- View Cart bên phải -->
    <a href="./view-cart.jsp" class="w3-bar-item w3-button" title="View Cart">
        <i class="fas fa-shopping-cart"></i>
    </a>

</div>
    <h2>Danh sách đơn hàng</h2>
    <table>
        <tr>
            <th>ID Đơn Hàng</th>
            <th>Tên Khách Hàng</th>
            <th>Địa Chỉ</th>
            <th>Số Điện Thoại</th>
            <th>Tổng Tiền</th>
            <th>Ngày Đặt</th>
            <th>Sản Phẩm</th>
        </tr>
        <%
            Connection conn = new DBContext().getConnection();
            String sql = "SELECT o.id, o.customer_name, o.address, o.phone, o.total_price, o.order_date, "
                       + "d.product_name, d.price, d.quantity "
                       + "FROM orders o "
                       + "INNER JOIN order_details d ON o.id = d.order_id "
                       + "ORDER BY o.order_date DESC";

            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            int currentOrderId = -1;
            while (rs.next()) {
                int orderId = rs.getInt("id");
                
                if (orderId != currentOrderId) {
        %>
        <tr>
            <td><%= orderId %></td>
            <td><%= rs.getString("customer_name") %></td>
            <td><%= rs.getString("address") %></td>
            <td><%= rs.getString("phone") %></td>
            <td><%= rs.getDouble("total_price") %> VND</td>
            <td><%= rs.getTimestamp("order_date") %></td>
            <td>
        <%
                    currentOrderId = orderId;
                }
        %>
                <%= rs.getString("product_name") %> (x<%= rs.getInt("quantity") %>) - <%= rs.getDouble("price") %> VND<br>
        <%
            }
            rs.close();
            stmt.close();
            conn.close();
        %>
            </td>
            
        </tr>
        
    </table>
</body>
</html>
