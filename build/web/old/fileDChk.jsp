
<%@page import="DbPack.TrippleDes"%>
<%@page import="DbPack.DatabaseConnection"%>

<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<html>
<head>
<title>fastpage | About</title>
<script language="JavaScript">

</script>
</head>

<body>		
<%
     


 //String us = session.getAttribute("userId").toString();
 //System.out.println(us);
       
              String getf = request.getParameter("m");
              System.out.println("getQ "+request.getQueryString());
              Class.forName("com.mysql.jdbc.Driver");
              Connection conn = DatabaseConnection.getCon();
              
              Statement st = conn.createStatement();
              String qqq = "select * from upload where file_name= '"+getf+"' ";
              ResultSet rs = st.executeQuery(qqq);
              if(rs.next()){
		Blob b = rs.getBlob("file_data");
		if(b != null)
		{
                   // System.out.println("Fdsf");
			String fileName = "image";
                         byte[] ba = b.getBytes(1, (int)b.length());                        
			 response.setContentType("image/jpg");
			response.setHeader("Content-Disposition","attachment; filename=\""+getf+"\"");
			
			OutputStream os = response.getOutputStream();
			os.write(ba);
			os.close();
			ba = null;
			//session.removeAttribute("document1");
		}
		else
		{
			response.sendRedirect("down.jsp");
		}
                               }
%>

</body>
</html>