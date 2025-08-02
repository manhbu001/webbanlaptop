///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//package context;
//
//import java.sql.Connection;
//import java.sql.DriverManager;
///**
// *
// * @author Admin
// */
//public class DBContext {
//
//    private final String userID = "sa";
//    private final String password = "sa";
//    private final String instance = "";
//    private final String portNumber = "1433";
//    private final String dbName = "banhang";
//    private final String serverName = "DESKTOP-PSE5JTP";
//
//    public Connection getConnection() throws Exception {
//        String url = "jdbc:sqlserver://" + serverName + ":" + portNumber + "\\" + instance + ";databaseName=" + dbName;
//        if (instance == null || instance.trim().isEmpty()) {
//            url = "jdbc:sqlserver://" + serverName + ":" + portNumber + ";databaseName=" + dbName;
//        }
//        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
//        return DriverManager.getConnection(url, userID, password);
//    }
//
//    public static void main(String[] args) throws Exception {
//
//        System.out.println(new DBContext().getConnection());
//    }
//
//}


package context;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBContext {
    private String user = "root";
    private String password = "";
    public String dbname = "banhang";
    public String host = "localhost";
    public int port = 3306;

    public Connection getConnection() throws Exception {
        String url = "jdbc:mysql://" + host + ":" + port + "/" + dbname;
        Class.forName("com.mysql.cj.jdbc.Driver");
        System.out.println("Connecting to MySQL database..."); // Thêm thông báo
        return DriverManager.getConnection(url, user, password);
    }

    public static void main(String[] args) {
        try {
            DBContext db = new DBContext();
            Connection conn = db.getConnection(); // Lưu kết nối để kiểm tra
            if (conn != null) {
                System.out.println("Kết nối MySQL thành công!");
                conn.close(); // Đóng kết nối sau khi kiểm tra
            }
        } catch (Exception e) {
            System.err.println("Kết nối thất bại!"); // Sử dụng System.err cho lỗi
            e.printStackTrace(); // In ra stack trace của lỗi
        }
    }
}





//
//package context;
//
//import java.sql.Connection;
//import java.sql.DriverManager;
//
///**
// *
// * @author Admin
// */
//public class DBContext {
//
//    private final String userID = "root"; // Thường là root với XAMPP
//    private final String password = ""; // Mặc định XAMPP là chuỗi rỗng
//    private final String dbName = "banhang"; // Tên database bạn đã tạo trong phpMyAdmin
//    private final String serverName = "localhost"; // Hoặc 127.0.0.1
//    private final String portNumber = "3306"; // Cổng mặc định MySQL
//
//    public Connection getConnection() throws Exception {
//        String url = "jdbc:mysql://" + serverName + ":" + portNumber + "/" + dbName + "?useSSL=false&serverTimezone=UTC";
//        Class.forName("com.mysql.cj.jdbc.Driver");
//        return DriverManager.getConnection(url, userID, password);
//    }
//
//    public static void main(String[] args) throws Exception {
//        System.out.println(new DBContext().getConnection());
//    }
//
//}
