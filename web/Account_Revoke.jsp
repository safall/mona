<%@page import="java.util.List"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="DbPack.DatabaseConnection"%>
<%
String ID = session.getAttribute("ID").toString();
Connection con = DatabaseConnection.getCon();
Statement st = con.createStatement();
int i = st.executeUpdate("update register set status = 'NO' where username = '"+ID+"'");
if(i!=0){
    response.sendRedirect("Home.jsp?A/c deactivated..!");
}else{
    out.println("Revike Error...");
}
List l = null;
%>