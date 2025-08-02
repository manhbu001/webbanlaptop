<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đặt hàng thành công</title>
        <style>
            body {
                margin: 0;
                padding: 0;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background: linear-gradient(to right, #e0f7fa, #fffde7);
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }

            .success-container {
                background-color: #ffffff;
                padding: 40px 60px;
                border-radius: 12px;
                box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
                text-align: center;
                max-width: 500px;
                width: 100%;
            }

            .success-container h2 {
                color: #28a745;
                margin-bottom: 20px;
            }

            .success-container p {
                color: #333;
                font-size: 16px;
                margin-bottom: 30px;
            }

            .success-container a {
                display: inline-block;
                background-color: #007bff;
                color: #fff;
                padding: 12px 24px;
                border-radius: 6px;
                text-decoration: none;
                transition: background-color 0.3s ease;
                font-weight: bold;
            }

            .success-container a:hover {
                background-color: #0056b3;
            }
        </style>
    </head>
    <body>
        <div class="success-container">
            <h2><%= session.getAttribute("orderSuccess") != null ? session.getAttribute("orderSuccess") : "Đặt hàng thành công!" %></h2>
            <p>Cảm ơn bạn đã đặt hàng! Chúng tôi sẽ xử lý đơn hàng và gửi tới cho bạn sớm nhất có thể.</p>
            <a href="Home.jsp">← Quay lại trang chủ</a>
        </div>
    </body>
</html>
