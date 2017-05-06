<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="DbPack.DatabaseConnection"%>
<%
String userid = session.getAttribute("ID").toString();
String fileName = request.getQueryString();
String user_group=null,file_group=null,file_key=null;

Connection con = DatabaseConnection.getCon();
Statement st1 = con.createStatement();
Statement st2 = con.createStatement();
ResultSet rs1 = st1.executeQuery("select * from register where username = '"+userid+"' ");
ResultSet rs2 = st2.executeQuery("select * from upload where file_name = '"+fileName+"' ");

if(rs1.next()){
    user_group = rs1.getString("group_");
    System.out.println("user gr "+user_group);
}
if(rs2.next()){
    file_group = rs2.getString("group_");
    file_key = rs2.getString("key_");
    System.out.println("file gr "+file_group);
}

if(user_group.equalsIgnoreCase(file_group)){
    response.sendRedirect("delete_verify.jsp?mm="+fileName);
    out.println("fine delete");
    
}
else{
    out.println("not deleted");
}
%>