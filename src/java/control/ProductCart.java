/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import dao.DAO;
import entity.CartBean;
import entity.Product;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
@WebServlet(name = "ProductCart", urlPatterns = {"/ProductCart"})
public class ProductCart extends HttpServlet {
    public static List<CartBean> listCart = new ArrayList<>();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");   
        String action = request.getParameter("action");//lấy "action" từ bên URL của View-products.jsp sang
        
        //khai báo sử dụng DAO 
        DAO dao = new DAO();
        //khai báo entity CartBean
        CartBean cart = new CartBean();
        Product pro = null;
        int id;
        if (action == null || action.equals("")) {
            request.getRequestDispatcher("home.jsp").forward(request, response);
            return;
        }
        switch(action){
            case "AddCart":
                id = Integer.parseInt(request.getParameter("id"));
                pro = dao.getAllProductByID(Integer.toString(id));
                if(pro != null){
                    cart.setPro(pro);
                    cart.setQuantity(1);
                    listCart.add(cart);
                }
               System.out.println("size:" + listCart.size());
              request.getRequestDispatcher("view-cart.jsp").forward(request, response);
              break;
              case "DelCart":
                  id = Integer.parseInt(request.getParameter("id"));//xóa theo id ở trang View-Cart.jsp truyền qua URL sang
                  listCart.remove(id);
                  request.getRequestDispatcher("view-cart.jsp").forward(request, response);
                  break; 
                 case "ClearCart":
                     listCart.clear();
                     request.getRequestDispatcher("home").forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
