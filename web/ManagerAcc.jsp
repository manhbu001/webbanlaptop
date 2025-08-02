<%@ page import="java.sql.*, context.DBContext" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet"/>
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet"/>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.1.0/mdb.min.css" rel="stylesheet"/>
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link href="./css/style.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
 
    <title>Qu?n lý tài kho?n</title>
    <style>
        table { width: 100%; border-collapse: collapse; }
        th, td { border: 1px solid black; padding: 8px; text-align: left; }
        th { background-color: #f2f2f2; }
    </style>
    <style>
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
        font-family: 'Roboto', sans-serif;
    }

    th, td {
        padding: 12px 15px;
        text-align: center;
        border: 1px solid #ddd;
    }

    th {
        background-color: #007bff;
        color: white;
        text-transform: uppercase;
        font-size: 14px;
        letter-spacing: 0.5px;
    }

    tr:nth-child(even) {
        background-color: #f9f9f9;
    }

    tr:nth-child(odd) {
        background-color: #ffffff;
    }

    tr:hover {
        background-color: #f1f1f1;
    }

    button {
        background-color: #28a745;
        color: white;
        padding: 6px 12px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-weight: bold;
        margin: 2px;
    }

    button:hover {
        background-color: #218838;
    }

    form {
        display: inline;
    }

    h2 {
        margin-top: 30px;
        font-size: 24px;
        color: #333;
    }

    a[href="DangKyDangNhap.jsp"] {
        display: inline-block;
        margin-bottom: 15px;
        background-color: #17a2b8;
        color: white;
        padding: 8px 16px;
        border-radius: 5px;
        text-decoration: none;
        font-weight: bold;
    }

    a[href="DangKyDangNhap.jsp"]:hover {
        background-color: #138496;
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
            <a href="ManagerAcc.jsp" class="w3-bar-item w3-button" target="blank" style="background-color: rgba(0, 0, 0, 0.1); border: 2px solid #ccc; padding: 10px; border-radius: 5px;">
                Quản lý tài khoản
            </a>
        </c:if>


        <c:if test="${sessionScope.acc.isAdmin == 1}">
            <a href="manageOrders.jsp" class="w3-bar-item w3-button">Quản lý đơn hàng</a>
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
    <h2>Danh sách tài khoản</h2>
    <a href="DangKyDangNhap.jsp">Thêm tài khoản</a>
    <table>
        <tr>
            <th>ID</th>
            <th>Username</th>
            <th>Mật khẩu</th>
            <th>Người bán</th>
            <th>Admin</th>
            <th>Hành động</th>
        </tr>
        <%
            Connection conn = new DBContext().getConnection();
            String sql = "SELECT * FROM account";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("uID") %></td>
            <td><%= rs.getString("user") %></td>
            <td><%= rs.getString("pass") %></td>
            <td><%= rs.getInt("isSell") == 1 ? "Có" : "Không" %></td>
            <td><%= rs.getInt("isAdmin") == 1 ? "Có" : "Không" %></td>
            <td>
                <form action="EditAccount.jsp" method="post">
                    <input type="hidden" name="uID" value="<%= rs.getInt("uID") %>">
                    <button type="submit">Sửa</button>
                </form>
                <form action="DeleteAccountServlet" method="post">
                    <input type="hidden" name="uID" value="<%= rs.getInt("uID") %>">
                    <button type="submit" onclick="return confirm('Bạn có chắc muốn xóa?');">Xóa</button>
                </form>
            </td>
        </tr>
        <%
            }
            rs.close();
            stmt.close();
            conn.close();
        %>
    </table>
</body>
</html>
