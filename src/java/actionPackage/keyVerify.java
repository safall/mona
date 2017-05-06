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
import javax.servlet.http.HttpSession;
import org.apache.catalina.Session;

/**
 *
 * @author jp
 */
public class keyVerify extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String dbUgroup=null;
            HttpSession session = request.getSession(true);
            String ses = (String) session.getAttribute("fname");
            String Uid = (String) session.getAttribute("UID");
            System.out.println("id sess is "+Uid);
            System.out.println("ses  : " + ses);
            String getK = request.getParameter("getK");
            String getName = request.getParameter("getName");
            Connection con = DatabaseConnection.getCon();
            
             Statement st = con.createStatement();
             Statement st1 = con.createStatement();
             ResultSet rs1 = st1.executeQuery("select * from register where username ='"+Uid+"' ");
             if(rs1.next()){
                 dbUgroup = rs1.getString("group");
             }
            ResultSet rs = st.executeQuery("select * from upload where file_name = '" + getName + "' ");
            System.out.println("hi ");
            if (rs.next()) {
                if ((getK.equals(rs.getString("key_")))&&(dbUgroup.equals(rs.getString("group")))) {
                    System.out.println("fine");
                    response.sendRedirect("fileDChk.jsp?m=" + getName);
                } else {
                    response.sendRedirect("Error.jsp");
                }
            } else {
                response.sendRedirect("Error.jsp");
            }




        } catch (SQLException ex) {
            Logger.getLogger(keyVerify.class.getName()).log(Level.SEVERE, null, ex);
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
