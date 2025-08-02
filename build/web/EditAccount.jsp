<%@ page import="java.sql.*, context.DBContext" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Chỉnh sửa tài khoản</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f0f2f5;
            padding: 40px;
        }

        h2 {
            text-align: center;
            color: #333;
        }

        form {
            max-width: 500px;
            margin: auto;
            background: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }

        label {
            display: block;
            margin-top: 15px;
            font-weight: bold;
            color: #555;
        }

        input[type="text"],
        input[type="password"],
        select {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            margin-top: 20px;
            width: 100%;
            padding: 12px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>

<body>
    <h2>Chỉnh sửa tài khoản</h2>
    <%
        int uID = Integer.parseInt(request.getParameter("uID"));
        Connection conn = new DBContext().getConnection();
        String sql = "SELECT * FROM account WHERE uID = ?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setInt(1, uID);
        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
    %>
    <form action="EditAccountServlet" method="post">
        <input type="hidden" name="uID" value="<%= rs.getInt("uID") %>">
        <label>Username:</label>
        <input type="text" name="user" value="<%= rs.getString("user") %>" required>

        <label>Password:</label>
        <input type="password" name="pass" value="<%= rs.getString("pass") %>" required>

        <label>Người bán:</label>
        <select name="isSell">
            <option value="1" <% if(rs.getInt("isSell") == 1) out.print("selected"); %>>Có</option>
            <option value="0" <% if(rs.getInt("isSell") == 0) out.print("selected"); %>>Không</option>
        </select>

        <label>Admin:</label>
        <select name="isAdmin">
            <option value="1" <% if(rs.getInt("isAdmin") == 1) out.print("selected"); %>>Có</option>
            <option value="0" <% if(rs.getInt("isAdmin") == 0) out.print("selected"); %>>Không</option>
        </select>

        <input type="submit" value="Lưu thay đổi">
    </form>
    <%
        }
        rs.close();
        stmt.close();
        conn.close();
    %>
</body>
</html>
