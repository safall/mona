/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package actionPackage;

import DbPack.DatabaseConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author jp
 */
public class login extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
           
            String mode=null;
               String getUsername = request.getParameter("username");
               String getPassword = request.getParameter("password");
               
               if(getUsername.equals("admin")&&(getPassword.equals("admin"))){
                    response.sendRedirect("adminHome.jsp");
               }
               else{
               Connection con = DatabaseConnection.getCon();
               Statement st = con.createStatement();
               ResultSet rs = st.executeQuery("select * from register where username = '"+getUsername+"'  ");
               if(rs.next()){
                   mode = rs.getString("mode");
                   if(getPassword.equals(rs.getString("password"))){
                       if(mode.equals("User")){
                           response.sendRedirect("UserPage.jsp?msg="+getUsername);
                       }
                       if(mode.equals("Owner")){
                           response.sendRedirect("OwnerPage.jsp?msg="+getUsername);
                       }
                       
                       
                       
                   }
                   else{
                       response.sendRedirect("Home.jsp?msg=Login Error check Password");
                   
                   }
               }
               else{
                   response.sendRedirect("Home.jsp?msg=Login Error check Username");
               }
               }
        } catch (SQLException ex) {
            Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
        }
           
       
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
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
     * Handles the HTTP
     * <code>POST</code> method.
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
