package control;

import context.DBContext;
import entity.CartBean;
import java.io.IOException;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String customerName = request.getParameter("customerName");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String note = request.getParameter("note");

        HttpSession session = request.getSession();
        double totalPrice = 0;

        if (ProductCart.listCart == null || ProductCart.listCart.isEmpty()) {
            session.setAttribute("orderError", "Giỏ hàng trống! Vui lòng thêm sản phẩm.");
            response.sendRedirect("view-cart.jsp");
            return;
        }

        for (CartBean cart : ProductCart.listCart) {
            totalPrice += cart.getPro().getPrice() * cart.getQuantity();
        }

        try {
            Connection conn = new DBContext().getConnection();
            if (conn == null) {
                System.out.println("Không thể kết nối database!");
                return;
            } else {
                System.out.println("Kết nối MySQL thành công!");
            }

            // 🔹 Lưu đơn hàng vào bảng `orders`
            String sqlOrder = "INSERT INTO orders (customer_name, address, phone, note, total_price) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement stmtOrder = conn.prepareStatement(sqlOrder, Statement.RETURN_GENERATED_KEYS);
            stmtOrder.setString(1, customerName);
            stmtOrder.setString(2, address);
            stmtOrder.setString(3, phone);
            stmtOrder.setString(4, note);
            stmtOrder.setDouble(5, totalPrice);
            stmtOrder.executeUpdate();

            // 🔹 Lấy ID của đơn hàng vừa tạo
            ResultSet rs = stmtOrder.getGeneratedKeys();
            int orderId = 0;
            if (rs.next()) {
                orderId = rs.getInt(1);
            }
            stmtOrder.close();

            // 🔹 Lưu từng sản phẩm vào bảng `order_details`
            String sqlDetails = "INSERT INTO order_details (order_id, product_id, product_name, price, quantity) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement stmtDetails = conn.prepareStatement(sqlDetails);

            for (CartBean cart : ProductCart.listCart) {
                stmtDetails.setInt(1, orderId);
                stmtDetails.setInt(2, cart.getPro().getId());
                stmtDetails.setString(3, cart.getPro().getName());
                stmtDetails.setDouble(4, cart.getPro().getPrice());
                stmtDetails.setInt(5, cart.getQuantity());
                stmtDetails.executeUpdate();
            }
            stmtDetails.close();

            // 🔹 Xóa giỏ hàng sau khi đặt hàng thành công
            ProductCart.listCart.clear();
            session.setAttribute("orderSuccess", "Đặt hàng thành công! Cảm ơn bạn đã mua sắm.");

            response.sendRedirect("order-success.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            session.setAttribute("orderError", "Lỗi SQL: " + e.getMessage());
            response.sendRedirect("view-cart.jsp");
        } catch (Exception ex) {
            Logger.getLogger(OrderServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
