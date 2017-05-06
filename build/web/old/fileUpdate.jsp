<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="DbPack.DatabaseConnection"%>
<%
String fe = request.getParameter("group");
String file_name = request.getParameter("file");
System.out.println("gr "+fe+"\n"+"file name"+file_name);

String fname = session.getAttribute("fname").toString();
Connection con = DatabaseConnection.getCon();
Statement st = con.createStatement();
int i = st.executeUpdate("update upload set group_ = '"+fe+"' where file_name = '"+file_name+"' ");
if(i!=0){
   response.sendRedirect("Update.jsp?mm=details Updated"); 
}
else{
   response.sendRedirect("Error.jsp"); 
}


%>