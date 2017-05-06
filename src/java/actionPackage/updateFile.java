/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package actionPackage;

import DbPack.DatabaseConnection;
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
import javax.servlet.http.HttpSession;

/**
 *
 * @author jp
 */
public class updateFile extends HttpServlet {

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
            HttpSession session = request.getSession(true);
            String ses =  session.getAttribute("fid").toString();
            System.out.println("fid is "+ses);
            String getFiledata = request.getParameter("gets");
            String gr = null;
            String getUser = session.getAttribute("ID").toString();
            // out.println(getFiledata+"\n");
            Connection con = DatabaseConnection.getCon();
            Statement st = con.createStatement();
            Statement st3 = con.createStatement();
            ResultSet rs = st3.executeQuery("select * from register where username='" + getUser + "'");
            if (rs.next()) {
                gr = rs.getString("group_");
                System.out.println("gr is "+gr);
            }
            Statement st1 = con.createStatement();
            int i = st.executeUpdate("update upload set file_data = '" + new TrippleDes().encrypt(getFiledata) + "' where file_name = '" + ses + "'  ");
            if (i != 0) {
                int ii = st.executeUpdate("insert into log_details values('" + getUser + "','" + ses + "','" + gr + "','Update',now())");
                if(ii!=0){
                    response.sendRedirect("fileDetails.jsp?File Updated....");
                }
                
            } else {
                out.println("File Update Error...");
            }



        } catch (Exception ex) {
            Logger.getLogger(updateFile.class.getName()).log(Level.SEVERE, null, ex);
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
