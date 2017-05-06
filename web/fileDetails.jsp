<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="DbPack.DatabaseConnection"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title> MONA : Secure Multi Owner Data Sharing Dynamic Groups in the Cloud</title>
<meta name="keywords" content="VOIP Company, css template, free web design layout" />
<meta name="description" content="VOIP Company, css template, free web design layout from TemplateMo.com" />
<link href="templatemo_style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="tabcontent.css" />
<script type="text/javascript" src="tabcontent.js">

</script>

</head>
<body>
  
<div id="templatemo_wrapper">
<div id="templatemo_container">
    <div id="templatemo_menu">
        <div id="pettabs" class="indentmenu">
            <ul>
                <li><a href="memberHome.jsp" rel="tab1" class="selected" >Back</a></li>
            </ul>
        </div>
        <div class="tabcontentstyle">
        
            
            <div id="tab2" class="tabcontent">
            	<ul>
                  <li><a href="#">Service 1</a></li>
                  <li><a href="#">Service 2</a></li>
                  <li><a href="#">Service 3</a></li>
                  <li><a href="#">Service 4</a></li>
                  <li><a href="#">Service 5</a></li>
                </ul>
            </div>
            
            <div id="tab3" class="tabcontent">
            	<ul>
                  <li><a href="#">Product 1</a></li>
                  <li><a href="#">Product 2</a></li>
                  <li><a href="#">Product 3</a></li>
                  <li><a href="#">Product 4</a></li>
                </ul>
            </div>
            
            <div id="tab4" class="tabcontent">
            	<ul>
                  <li><a href="#">Link 1</a></li>
                  <li><a href="#">Link 2</a></li>
                  <li><a href="#">Link 3</a></li>
                  <li><a href="#">Link 4</a></li>
                  <li><a href="#">Link 5</a></li>
                  <li><a href="#">Link 6</a></li>
                </ul>
            </div>
            
            <div id="tab5" class="tabcontent">
            	Something you might want to know about us.
            </div>
            
            <div id="tab6" class="tabcontent">
            	Don't be hesitated to contact us if you have something to say.
            </div>
        
        </div>
<script type="text/javascript">
        
        var mypets=new ddtabcontent("pettabs")
        mypets.setpersist(true)
        mypets.setselectedClassTarget("link")
        mypets.init(false)   
</script>

    </div> <!-- end of mneu -->
   
    <div id="templatemo_banner">
    	<h1>MONA</h1>
        <p>Secure Multi Owner Data Sharing Dynamic Groups in the Cloud</p>
    
    </div>
    
	<div id="templatemo_content">
    	<div id="content_top"></div>
        
        <div class="templatemo_content_section_01">
            <div class="section_01_left" style="margin-left: 300px;height: 500px;margin-top: 150px;">
                <p style="margin-left:-190px; font-family: monospace;font-size: 15px;font-weight: bold;">File Details:</p>
                <table  style=" margin-left: -200px;width:50%;position:absolute;">
                    <tr align="center" bgcolor="#CC0000" style="font-family:verdana;font-size:12px;">

                                    <td height="36">File name</td>
                                    <td>Date</td>
                                    <td>Delete</td>
                                    <td>View</td>
                                    
                                </tr>
                                <%
                                    String host = null, name = null, pass = null, mail = null, user_group = null, mobile = null, gen = null, blood = null, dis = null, zip = null;
                                    Connection con = null;
                                    // String names = request.getParameter("name");
                                    // String mails = request.getParameter("mail");
                                    // String passs = request.getParameter("password");
                                    
                                    try {
                                        con = DatabaseConnection.getCon();
                                        Statement st = con.createStatement();
                                        Statement st1 = con.createStatement();
                                       /* ResultSet rs1 = st1.executeQuery("select * from register where username = '"+session.getAttribute("ID").toString() +"' ");
                                        if(rs1.next()){
                                            user_group = rs1.getString("group_");
                                            System.out.println("user group is "+user_group);
                                        }*/
                                        String query1 = "select * from upload ";//+"'";//'"+session.getAttribute("uID").toString() +"'";// "+" AND email = '"+mail+"' ";
                                        ResultSet rs = st.executeQuery(query1);

                                        while (rs.next()) {

                                            host = rs.getString("file_name");
                                            name = rs.getString("date");
                                            session.setAttribute("fname", host); 

                                %>
                                <tr align="center" style="font-family:verdana;font-size:12px;"> 
                                    <td> <font color="#5eaaff"><%=host%></font> </td>
                                    <td> <font color="#5eaaff"><%=name%></font> </td>
                                    <td> <font color="#5eaaff"><a href="delete.jsp?<%=host%>">Delete</a></font> </td>
                                    <td> <font color="#5eaaff"><a href="view.jsp?<%=host%>">View</a></font> </td>
                                </tr>
                                    <%


                                            }


                                        } catch (Exception e) {
                                            e.printStackTrace();
                                        }


                                    %>
                            </table>   
            </div> 
			
            
            
            <div class="cleaner">&nbsp;</div>
		</div>
        
       
        
        
    </div>
    
    <div id="templatemo_footer">
    
        	<p>Copyright © 2013 <a href="http://www.jpinfotech.org"><strong>JPINFOTECH</strong></a> </p>
	</div> <!-- end of footer -->
	<!--  Free CSS Templates from www.TemplateMo.com  -->
</div>
</div>
</body>
</html>