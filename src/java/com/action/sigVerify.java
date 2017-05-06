/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.action;

import DbPack.DatabaseConnection;
import DbPack.TrippleDes;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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
public class sigVerify extends HttpServlet {

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
            String getu = session.getAttribute("uid").toString();
            System.out.println("uid is " + getu);
            String getS = request.getParameter("sig");
            Connection con = DatabaseConnection.getCon();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select * from register where username = '" + getu + "'");
            if (rs.next()) {
                String getSignature = null;
                try {
                    getSignature = new TrippleDes().encrypt(rs.getString("group_"));
                    System.out.println("group sig is = " + getSignature);
                } catch (Exception ex) {
                    Logger.getLogger(sigVerify.class.getName()).log(Level.SEVERE, null, ex);
                }

                if (getS.equals(getSignature)) {
                   
                    response.sendRedirect("memberHome.jsp?ms="+getu);//?<html><body onload=\"alert('Signature Verified....')\"></body></html>"); 
                } else {
                    out.println("Invaild Signature.....");
                }
            } else {
                out.println("User Error");
            }


        } catch (SQLException ex) {
            Logger.getLogger(sigVerify.class.getName()).log(Level.SEVERE, null, ex);
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
