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
        <%
            String getU = request.getParameter("msg");
            session.setAttribute("OID", getU);

        %>
        <div id="templatemo_wrapper">
            <div id="templatemo_container">
                <div id="templatemo_menu">
                    <div id="pettabs" class="indentmenu">
                        <ul>
                            <li><a href="OwnerPage.jsp?msg=<%=getU%>" rel="tab1" class="selected">Home</a></li>
                            <li><a href="Update.jsp" rel="tab2">File Updates</a></li>
                            <li><a href="Home.jsp" rel="tab2">Sign Out</a></li>
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
                            <p style="font-family:fantasy;font-size:350%; margin-left: -200px;">Welcome  Owner <%=getU%> </p><br></br>
                            <form name="" action="upload" method="post" enctype="multipart/form-data">
                                <p style="font-size: 20px;">File Upload:</p>
                                <table width="70%">
                                    <tr style="height: 40px;"><td>Choose File</td><td> <input name="file" type="file" id="file"/>    </td></tr>
                                    <tr style="height: 20px;width: 150px; "><td></td><td><input type="submit" value="Upload" style="height: 30px;width: 90px;"/></td></tr>
                                </table>
                            </form>  
                            
              
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