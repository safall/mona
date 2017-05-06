<%@page import="DbPack.TrippleDes"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="DbPack.DatabaseConnection"%>
<%
String gets=null;
String getString = request.getQueryString();
Connection con = DatabaseConnection.getCon();
Statement st = con.createStatement();
Statement st1 = con.createStatement();
ResultSet rs = st1.executeQuery("select * from register where  username = '"+getString+"' ");
if(rs.next()){
    gets = new TrippleDes().encrypt(rs.getString("group_"));
}
System.out.println("tt "+gets);
int i = st.executeUpdate("update register set status = 'NO' ,gr_sig = '"+gets+"' where username = '"+getString+"' ");
if(i!=0){
    response.sendRedirect("view_Action.jsp?group="+session.getAttribute("gid").toString());
}
else{
    //response.sendRedirect("");
    out.println("Account Activation Error check ur data....");
}
%>
