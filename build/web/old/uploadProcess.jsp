
<%@page import="DbPack.TrippleDes"%>
<%@page import="org.apache.commons.io.IOUtils"%>
<%@page import="org.apache.tomcat.util.http.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory"%>
<%@page import="java.io.File"%>

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
    <%
        String TMP_DIR_PATH = "c:\\tmp";
        File tmpDir = new File(TMP_DIR_PATH);
        String[] lines = null;
        int count = 0;
        String size = null;
        String key = null;
        String userid = null;
        String filename = null;
        String nameid = "";
        String master = "";
        String sec = "";
        String pub = "";
        try {
            DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
            fileItemFactory.setSizeThreshold(1 * 1024 * 1024); //1 MB
            fileItemFactory.setRepository(tmpDir);
            ServletFileUpload uploadHandler = new ServletFileUpload(fileItemFactory);
            List items = uploadHandler.parseRequest(request);
            Iterator itr = items.iterator();
            int a1;
            int a2;

            while (itr.hasNext()) {
                FileItem item = (FileItem) itr.next();
                if (item.isFormField()) {
                    //     if (item.getFieldName().equals("key_")) {
                    //       key = item.getString();                                                               
                    // }
                } else {
                    String str = IOUtils.toString(item.getInputStream(), "UTF-8");
                    filename = item.getName();
                    //item.getInputStream().
                    lines = str.split("\r\n|\r|\n");
                    nameid = (String) session.getAttribute("name");
                    sec = new TrippleDes().encrypt("");
                    pub = Utilities.stringtoByte(nameid);
                    master = Utilities.stringtoByte(pub + sec);
                    // a1=Utilities.stringtoByte(filename); 
                    // a2=Utilities.stringtoByte(filename.length()+""); 
                    //   master= Integer.toBinaryString((a1&a2)); 

                    // size = lines.length + "";
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
    <body>
        <%
            String getU = request.getParameter("msg");

        %>
        <div id="templatemo_wrapper">
            <div id="templatemo_container">
                <div id="templatemo_menu">
                    <div id="pettabs" class="indentmenu">
                        <ul>
                            <li><a href="OwnerPage.jsp?msg=<%=getU%>" rel="tab1" class="selected">Home</a></li>
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
                            <form method="post" action="UploadData">
                                <input type="hidden" id="fileName" name="fileName" value="<%=filename%>">

                                    <table>
                                        <tr><td>Public Key:</td><td><input type="text" id="publicKey" name="publicKey" size="50" value="<%=Utilities.stringtoByte(nameid)%>"/></td></tr>
                                        <tr><td>File Attribute 1:</td><td><input type="text" id="att1" name="att1" size="50" value="<%=Utilities.stringtoByte(filename)%>"/></td></tr>
                                        <tr><td>File Attribute 2:</td><td><input type="text" id="att2" name="att2" size="50" value="<%=Utilities.stringtoByte(lines.length + "")%>"/></td></tr>
                                        <tr><td>Master key:</td><td><input type="text" id="master" name="master" size="50"  value="<%= master%>"/></td></tr>
                                        <tr><td>Secrete Key:</td><td><input type="text" id="secret" name="secret"  size="50" value="<%=sec%>"/></td></tr>
                                        <tr><td>File Content:</td><td><textarea id="block1" name="block1" value="" size="50" style="width: 300px;height: 100px;">
                                                    <%
                                                        for (int i = count; i < lines.length; i++) {
                                                            if (lines[i].trim() == null || lines[i].trim() == "") {
                                                                continue;
                                                            }
                                                            out.println(lines[i]);
                                                        }%>
                                                </textarea></td></tr>
                                        <tr><td><input type="submit" value="Upload"/></td></tr>
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