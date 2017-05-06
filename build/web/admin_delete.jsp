<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="DbPack.DatabaseConnection"%>
<%
String key_ = null;
String typeKey = request.getParameter("keys");
String s = request.getQueryString();
String getF = session.getAttribute("fnme").toString();
System.out.println("getF "+getF);
Connection con = DatabaseConnection.getCon();
Statement st = con.createStatement();
int i = st.executeUpdate("delete from upload where file_id = '"+request.getQueryString()+"' ");
if(i!=0){
    response.sendRedirect("adminFileDetails.jsp?file Deleted...!");
}

%>