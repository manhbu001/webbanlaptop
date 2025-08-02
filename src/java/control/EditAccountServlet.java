/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package control;

import dao.DAO;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Minh0
 */
@WebServlet("/EditAccountServlet")
public class EditAccountServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int uID = Integer.parseInt(request.getParameter("uID"));
            String user = request.getParameter("user");
            String pass = request.getParameter("pass");
            int isSell = Integer.parseInt(request.getParameter("isSell"));
            int isAdmin = Integer.parseInt(request.getParameter("isAdmin"));
            
            DAO dao = new DAO();
            dao.updateAccount(uID, user, pass, isSell, isAdmin);
            
            response.sendRedirect("ManagerAcc.jsp");
        } catch (Exception ex) {
            Logger.getLogger(EditAccountServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
