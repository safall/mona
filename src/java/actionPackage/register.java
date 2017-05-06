/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package actionPackage;

import DbPack.TrippleDes;
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
public class register extends HttpServlet {

    
    
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
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String user = request.getParameter("username");
            String pass = request.getParameter("password");
            String conpass = request.getParameter("conpassword");
            String group = request.getParameter("group");
            String email = request.getParameter("email");
            String mobile = request.getParameter("mobile");
            String place = request.getParameter("place");
            //String mode = request.getParameter("mode");
            if(pass.equals(conpass)){
            Connection con  =DbPack.DatabaseConnection.getCon();
            Statement st = con.createStatement();
            int i = st.executeUpdate("insert into register values('"+user+"','"+pass+"','"+group+"','"+email+"','"+mobile+"','"+place+"','NO','0')"); 
             if(i!=0){
                 
                 
                 mail_Send.sendMail(new TrippleDes().encrypt(group), user, email);
                 
                 
                 response.sendRedirect("Home.jsp?m=Registeration done");
                 
             }
             else{
                   response.sendRedirect("register.jsp?m=register error...check");
             }
            }
            else{
                response.sendRedirect("register.jsp?m=password not match");
            }
        } catch (Exception ex) {
            Logger.getLogger(register.class.getName()).log(Level.SEVERE, null, ex);
        } finally {            
            out.close();
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(register.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(register.class.getName()).log(Level.SEVERE, null, ex);
        }
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
