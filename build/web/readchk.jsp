<%@page import="DbPack.TrippleDes"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
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
                            <li><form>
                                    <input type="button" value="Back to Previous Page"  style="margin-top:90px; ;width: 200px;height: 35px;"  onClick="javascript: history.go(-1)">
                                </form></li>
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
                        <div class="section_01_left" style="margin-left: 20px;">
                            <p style="font-family: monospace; font-size: xx-large;">Data::</p>
                            <p> 
                                <%
                                    String getFile = session.getAttribute("fid").toString();
                                    Connection con = DbPack.DatabaseConnection.getCon();
                                    Statement st = con.createStatement();
                                    ResultSet rs = st.executeQuery("select * from upload where file_name = '" + getFile + "' ");
                                    if (rs.next()) {
                                        if (request.getParameter("keys").equals(rs.getString("key_"))) {
                                            String getCipher = rs.getString("file_data");
                                            String plainText = new TrippleDes().decrypt(getCipher);
                                %>
                                <form action="updateFile" method="post">
                                    <textarea name="gets" style="width: 500px;height: 500px;"> <%=plainText%></textarea>
                                    <input type="submit" value="Update And Save"/>
                                </form>
                                    <form action="download.jsp" method="get">
                                         <input type="submit" value="download"/>
                                    </form>

                                <%
                                            // out.println(plainText);

                                        }else{
                                            out.println("File Key Error");
                                        }
                                    }
                                                                       else{
                                        out.println("File Error...!");
                                                                       }

                                %>
                            </p> 
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
