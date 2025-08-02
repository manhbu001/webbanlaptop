<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thanh toán đơn hàng</title>
        <style>
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background: linear-gradient(to right, #f8f9fa, #e0f7fa);
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                margin: 0;
            }

            .checkout-form {
                background-color: #ffffff;
                padding: 30px 40px;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                width: 100%;
                max-width: 450px;
            }

            .checkout-form h2 {
                text-align: center;
                margin-bottom: 25px;
                color: #333;
            }

            label {
                display: block;
                margin-bottom: 5px;
                font-weight: 500;
                color: #333;
            }

            input[type="text"],
            textarea {
                width: 100%;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 6px;
                margin-bottom: 20px;
                font-size: 14px;
            }

            textarea {
                resize: vertical;
                min-height: 80px;
            }

            input[type="submit"] {
                background-color: #28a745;
                color: white;
                padding: 12px;
                border: none;
                border-radius: 6px;
                width: 100%;
                font-size: 16px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            input[type="submit"]:hover {
                background-color: #218838;
            }
        </style>
    </head>
    <body>
        <form class="checkout-form" action="OrderServlet" method="post">
            <h2>Thông tin đặt hàng</h2>

            <label for="name">Tên khách hàng:</label>
            <input type="text" id="name" name="customerName" required>

            <label for="address">Địa chỉ:</label>
            <input type="text" id="address" name="address" required>

            <label for="phone">Số điện thoại:</label>
            <input type="text" id="phone" name="phone" required>

            <label for="note">Ghi chú:</label>
            <textarea id="note" name="note"></textarea>

            <input type="submit" value="Đặt hàng">
        </form>
    </body>
</html>
