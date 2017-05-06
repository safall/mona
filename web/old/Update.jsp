<%@page import="java.sql.PreparedStatement"%>
<%@page import="DbPack.DatabaseConnection"%>
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
        <link rel="stylesheet" type="text/css" href="css/templatemo_style.css" />
        <script type="text/javascript" src="scripts/jquery-1.4.3.min.js"></script>
        <style type="text/css">
            .web_dialog
            {
                display: none;
                position: fixed;
                width: 300px;
                height: 280px;
                top: 50%;
                left: 50%;
                margin-left: -190px;
                margin-top: -100px;
                background-color: #6495ED;
                border: 2px solid #336699;
                padding: 0px;
                z-index: 102;
                font-family: Verdana;
                font-size: 10pt;
            }

        </style>
        <script type="text/javascript">
            function ShowDialog(modal,a)
            {
                if(a=='True')
                {
                    $("#dialog").fadeIn(700);
                }
                else
                {
                    $("#error-dialog").fadeIn(700);
                }
            }
            $(document).ready(function() {
                $("#get").click(function(event){
    	
                    $("#dialog").fadeIn(700);
                });
            });
            $(document).ready(function() {
                $("#get1").click(function(event){
    	
                    $("#dialog").fadeOut(700);
                });
            });


        </script>
    </head>
    <body>
        <%
            String getU = session.getAttribute("OID").toString();
          
        %>
        <div id="templatemo_wrapper">
            <div id="templatemo_container">
                <div id="templatemo_menu">
                    <div id="pettabs" class="indentmenu">
                        <ul>
                            <li><a href="OwnerPage.jsp?msg=<%=getU%>" rel="tab1" class="selected">Home</a></li>
                            <li><a href="Home.jsp" rel="tab3">Sign Out</a></li>
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
                        <div class="section_01_left" style="margin-left: 280px; width: 500px;height: 600px">
                            <p style="font-family:fantasy;font-size:350%; margin-left: -200px;">Welcome  User , <%= getU%> </p><br></br>

                            <form action="fileUpdate.jsp" method="get">
                                <p>File Name :</p><p><select id="keys" name="file" style="width: 220px; height: 30px;" onchange="loadXMLDoc()"> 
                                        <option value="-1">-Select-</option>

                                        <%
                                            String sql1 = "select * from upload";
                                            System.out.println(";;;;;;;;;;;;;;;" + sql1);
                                            PreparedStatement pst1 = null;
                                            Connection conn1 = null;
                                            try {
                                                conn1 = DatabaseConnection.getCon();
                                                pst1 = conn1.prepareStatement(sql1);
                                                ResultSet rs1 = pst1.executeQuery();
                                                while (rs1.next()) {%>
                                        <option value="<%=rs1.getString("file_name")%>"><%=rs1.getString("file_name")%></option>
                                        <%}
                                            } catch (Exception e) {
                                            }%>
                                    </select></p>
                                    <p>Select Group :</p><p><select id="keys" name="group" style="width: 220px; height: 30px;" onchange="loadXMLDoc()"> 
                                        <option value="-1">-Select-</option>

                                        <%
                                            String sql11 = "select * from make_group";
                                            System.out.println(";;;;;;;;;;;;;;;" + sql1);
                                            PreparedStatement pst11 = null;
                                            Connection conn11 = null;
                                            try {
                                                conn11 = DatabaseConnection.getCon();
                                                pst11 = conn11.prepareStatement(sql11);
                                                ResultSet rs11 = pst11.executeQuery();
                                                while (rs11.next()) {%>
                                        <option value="<%=rs11.getString("group_name")%>"><%=rs11.getString("group_name")%></option>
                                        <%}
                                            } catch (Exception e) {
                                            }%>
                                    </select></p>
                                    <p><input type="submit" value="Update" style="font-size: 20px;" /></p>
                                   
                            </form>
                        </div> 

                     
                        <div class="cleaner">&nbsp;</div>
                        <div style="margin-top: 80px;" ></div>
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