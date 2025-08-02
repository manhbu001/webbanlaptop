/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import context.DBContext;
import entity.Category;
import entity.Product;
import entity.Account;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
//import aes.AES256;
import java.sql.SQLException;

/**
 *
 * @author Admin
 */
public class DAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
//load toàn bộ sản phẩm lên trang home

    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        String query = "select * from product";

        try {
            conn = new DBContext().getConnection();//thuc hien mo ket noi sqlserver
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6)));
            }
        } catch (Exception e) {
        }
        return list;
    }
//load toàn bộ Category lên menu danh mục category

    public List<Category> getAllCategory() {
        List<Category> listC = new ArrayList<>();
        String query = "select * from Category";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                listC.add(new Category(rs.getInt(1),
                        rs.getString(2)));
            }
        } catch (Exception e) {
        }
        return listC;
    }
//lấy toàn bộ sản phẩm trong product theo từng ID của category khi click vào từng categoryID

    public List<Product> getAllProductByCateID(String CateID) {
        List<Product> listProductByCateID = new ArrayList<>();
        String query = "select * from product where cateID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, CateID);
            rs = ps.executeQuery();
            while (rs.next()) {
                listProductByCateID.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6)));
            }
        } catch (Exception e) {
        }
        return listProductByCateID;
    }
    //load tất cả các sản phẩm theo sellID trong product   

    public List<Product> getAllProductBy_sellID(int sell_ID) {
        List<Product> listProductBy_sellID = new ArrayList<>();
        String query = "select * from product where sell_ID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, sell_ID);
            rs = ps.executeQuery();
            while (rs.next()) {
                listProductBy_sellID.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6)));
            }
        } catch (Exception e) {
        }
        return listProductBy_sellID;
    }

    // Hàm getAllProductByID trả về một object là một sản phẩm chứ không phải là một danh sách các sản phẩm nên không dùng list
    //lấy sản phẩm theo id của product truyền qua trang Detail để người dùng xem thông tin sản phẩm
    //hàm này còn dùng cho cả thêm giỏ hàng
    public Product getAllProductByID(String id) {
        String query = "select * from product where id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
//                return new Product(rs.getInt(1),
//                        rs.getString(2),
//                        rs.getString(3),
//                        rs.getDouble(4),
//                        rs.getString(5),
//                        rs.getString(6));
                return new Product(rs.getInt(1),
                   rs.getString(2),
                   rs.getString(3),
                   rs.getInt(4),  // Đổi từ getDouble(4) sang getBigDecimal(4)
                   rs.getString(5),
                   rs.getString(6));

            }
        } catch (Exception e) {
        }
        return null;
    }

    //Hàm tìm kiếm sản phẩm trong bảng Product theo tên sản phẩm "name"
    public List<Product> searchByName(String name) {
        List<Product> listProductByName = new ArrayList<>();
        String query = "select * from product where name like ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + name + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                listProductByName.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6)));
            }
        } catch (Exception e) {
        }
        return listProductByName;
    }

    //hàm Login() kiểm tra sự tồn tại của account gồm(user và pass) trong bảng Account nếu có trả về 1 đối tượng Acount nếu không trả về kết quả null
    public Account Login(String user, String pass) {
        String query = "select * from account where user = ? and pass = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5));
            }

        } catch (Exception e) {
        }
        return null;
    }

    //hàm kiểm tra user xem có tồn tại trong bảng Account chưa phục vụ cho việc signup) nếu có trả vè một đối tượng Acount nếu không trả về null
    public Account CheckSignup(String user) {
        String query = "select * from account where user = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5));
            }

        } catch (Exception e) {
        }
        return null;
    }

    //insert 1 Account vào bảng Account phần singup
    public void Signup(String user, String pass) {
        String query = "insert into account (user, pass, isSell, isAdmin) values(?,?,0,0)";
        try {
            //String _encryptpass = AES256.encrypt(pass, user, user);
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            //ps.setString(2, _encryptpass);
            ps.setString(2, pass);
            ps.executeUpdate();

        } catch (Exception e) {
        }
    }

    //thêm sản phẩm trong bảng Product theo Category với thông tin của Account đã lưu trên Session
    public void insertProductBy_CategoryID_Of_Acc(String name, String image, String price,String title, String description, String category, int sell_ID) {
        String query = "insert into product (name,image,price,title,description,cateID,sell_ID) values (?,?,?,?,?,?,?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, image);
            ps.setString(3, price);
            ps.setString(4, title);
            ps.setString(5, description);
            ps.setString(6, category);
            ps.setInt(7, sell_ID);
            ps.executeUpdate();
        } catch (Exception e) {
        }

    }
    
        //sửa sản phẩm trong bảng Product theo Category với thông tin của Account đã lưu trên Session
    public void editProductBy_CategoryID_Of_Acc(String name, String image, String price,String title, String description, String category, String productid) {
        String query = "update product set name=?,image=?,price=?,title=?,description=?,cateID=? where id=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, image);
            ps.setString(3, price);
            ps.setString(4, title);
            ps.setString(5, description);
            ps.setString(6, category);
            ps.setString(7, productid);
            ps.executeUpdate();
        } catch (Exception e) {
        }

    }

    //hàm xóa sản phẩm trong bảng Product(sau khi click nút xóa sản phẩm ở trang ManagerProduct.jsp sẽ gọi đến servlet deleteProductID sau đó thực thi hàm xóa này)
    public void deleteProductID(String productid) {
        String query = "delete from product where id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, productid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
public List<Product> getProductsByPage(int page, int pageSize) {
    List<Product> list = new ArrayList<>();
    int offset = (page - 1) * pageSize;
    String query = "SELECT * FROM product ORDER BY id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

    // Nếu bạn dùng MySQL thì thay bằng:
    // String query = "SELECT * FROM Product ORDER BY id LIMIT ?, ?";

    try {
        conn = new DBContext().getConnection();
        ps = conn.prepareStatement(query);
        ps.setInt(1, offset);
        ps.setInt(2, pageSize);
        rs = ps.executeQuery();

        while (rs.next()) {
            Product p = new Product();
            p.setId(rs.getInt("id"));
            p.setName(rs.getString("name"));
            p.setImage(rs.getString("image"));
            p.setPrice(rs.getInt("price"));
            // Gán các trường khác nếu cần
            list.add(p);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }

    return list;
}

public int getTotalProductCount() {
    String query = "SELECT COUNT(*) FROM product";
    int count = 0;

    try {
        conn = new DBContext().getConnection();
        ps = conn.prepareStatement(query);
        rs = ps.executeQuery();
        if (rs.next()) {
            count = rs.getInt(1);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }

    return count;
}


public void updateAccount(int uID, String user, String pass, int isSell, int isAdmin) throws Exception {
    String sql = "UPDATE account SET user = ?, pass = ?, isSell = ?, isAdmin = ? WHERE uID = ?";
    try (Connection conn = new DBContext().getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql)) {
        stmt.setString(1, user);
        stmt.setString(2, pass);
        stmt.setInt(3, isSell);
        stmt.setInt(4, isAdmin);
        stmt.setInt(5, uID);
        stmt.executeUpdate();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}

public void deleteAccount(int uID) throws Exception {
    String sql = "DELETE FROM account WHERE uID = ?";
    try (Connection conn = new DBContext().getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql)) {
        stmt.setInt(1, uID);
        int rowsAffected = stmt.executeUpdate();
        System.out.println("Xóa thành công? " + (rowsAffected > 0));
    } catch (SQLException e) {
        e.printStackTrace();
    }
}



    public static void main(String[] args) {
        DAO test_dao = new DAO();
        //test du lieu Product
//        List<Product> list = test_dao.getAllProduct();
//        for (Product obj_product : list) {
//            System.out.println(obj_product);
//        }

        //test du lieu Category
//        List<Category> listC = test_dao.getAllCategory();
//        for (Category obj_category : listC) {
//            System.out.println(obj_category);
//        }
        //test du lieu Product lấy theo CateID
//        List<Product> listProductByCateID = test_dao.getAllProductByCateID("2");
//        for(Product obj_productbycateid : listProductByCateID) {
//            System.out.println(obj_productbycateid);
//        }
//        List<Product> listProductByName = test_dao.searchByName("áo thu");
//        for (Product obj_productbyname : listProductByName) {
//            System.out.println(obj_productbyname);
//        }
//Account obj_Account = test_dao.Login("Adam", "123456");
//        System.out.println(obj_Account);
    }
}
