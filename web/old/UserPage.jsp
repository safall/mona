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
         <script type="text/javascript">
            function ShowDialog(modal,a)
            {
                if(a=='True')
                {
                    $("#dialog1").fadeIn(700);
                }
                else
                {
                    $("#error-dialog1").fadeIn(700);
                }
            }
            $(document).ready(function() {
                $("#get1").click(function(event){
    	
                    $("#dialog1").fadeIn(700);
                });
            });
            $(document).ready(function() {
                $("#get1").click(function(event){
    	
                    $("#dialog1").fadeOut(700);
                });
            });


        </script>
    </head>
    <body>
        <%
            String getU = request.getParameter("msg");
            session.setAttribute("UID", getU);

        %>
        <div id="templatemo_wrapper">
            <div id="templatemo_container">
                <div id="templatemo_menu">
                    <div id="pettabs" class="indentmenu">
                        <ul>
                            <li><a href="UserPage.jsp?msg=<%=getU%>" rel="tab1" class="selected">Home</a></li>
                            <li><a href="#" rel="tab2" class="selected">File Read</a></li>
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
                        <div class="section_01_left" style="margin-left: 280px;">
                            <p style="font-family:fantasy;font-size:350%; margin-left: -200px;">Welcome  User <%=getU%> </p><br></br>

                            <table  style=" margin-left: -200px;width:50%;position:absolute;">
                                <tr bgcolor="#CC0000" style="font-family:verdana;font-size:12px;">

                                    <td height="36">File name</td>
                                    <td>Date</td>

                                </tr>
                                <%
                                    String host = null, name = null, pass = null, mail = null, pdfass = null, mobile = null, gen = null, blood = null, dis = null, zip = null;
                                    Connection con = null;
                                    // String names = request.getParameter("name");
                                    // String mails = request.getParameter("mail");
                                    // String passs = request.getParameter("password");
                                    try {
                                        con = DatabaseConnection.getCon();
                                        Statement st = con.createStatement();
                                        String query1 = "select * from upload ";//+"'";//'"+session.getAttribute("uID").toString() +"'";// "+" AND email = '"+mail+"' ";
                                        ResultSet rs = st.executeQuery(query1);

                                        while (rs.next()) {

                                            host = rs.getString("file_name");
                                            name = rs.getString("date");
                                            session.setAttribute("fname", host);

                                %>
                                <tr style="font-family:verdana;font-size:12px;"> 
                                    <td> <font color="#5eaaff"><%=host%></font> </td>
                                    <td> <font color="#5eaaff"><%=name%></font> </td>

                                    <%


                                            }


                                        } catch (Exception e) {
                                            e.printStackTrace();
                                        }


                                    %>
                            </table>  
                            <div style="margin-left: -150px;margin-top: 150px; font-size:20px;">
                                <p>File Download </p>
                                <p><input type="button" id = "get" value="Download" style="font-size: 20px;"/></p>
                            </div>
                            
                             <div style="margin-left: 50px;margin-top: -85px; font-size:20px;">
                                <p>File Modify</p>
                                <p><input type="button" id = "gets" value="Edit" style="font-size: 20px;"/></p>
                            </div>
                        </div> 

                        <div id="dialog" class="web_dialog">
                            <form action ="keyVerify1">
                                <p><a href="#" id="get1" style="margin-left: 260px;">Close</a></p>

                                <p >File Name:</p>
                                <p style="margin-left: 55px;"><input type="text" name="getName" style="height: 25px;width: 200px;"/></p>

                                <p >File Key Verification :</p>
                                <p style="margin-left: 55px;"><input type="text" name="getK" style="height: 25px;width: 200px;"/></p>

                                <p style="margin-left: 95px;"><input type="submit" value="Verify" style="height: 25px;width: 100px;font-style: italic"/></p>
                            </form>

                        </div>
                             <div id="dialog1" class="web_dialog1">
                            <form action ="keyVerify">
                                <p><a href="#" id="get1" style="margin-left: 260px;">Close</a></p>

                                <p >File Name:</p>
                                <p style="margin-left: 55px;"><input type="text" name="getName" style="height: 25px;width: 200px;"/></p>

                                <p >File Key Verification :</p>
                                <p style="margin-left: 55px;"><input type="text" name="getK" style="height: 25px;width: 200px;"/></p>

                                <p style="margin-left: 95px;"><input type="submit" value="Verify" style="height: 25px;width: 100px;font-style: italic"/></p>


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