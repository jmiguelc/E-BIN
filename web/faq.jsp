<%-- 
    Document   : faq
    Created on : 06-abr-2015, 18:17:01
    Author     : nurcanc
--%>
<%@page import="dominio.Faq"%>
<%@page import="java.util.ArrayList"%>
<%@page import="datos.FaqDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>E-Bin. F.A.Q.</title>
        <link rel="stylesheet" type="text/css" href ="styles/style.css" />
    </head>
    <body>
        <div id="container">
            <%@include file="header.html"%>
            <div id="content">
                <%@include file="navigation.html"%>
                <div class="textos">
                    <h3>F.A.Q</h3>

                    <ul>
                        <%ArrayList<Faq> faqList = (ArrayList<Faq>) request.getAttribute("faqList");

                        if (faqList != null) {
                                    for (int i = 0; i < faqList.size(); i++) {%>
                        <li> <p> 
                                <%=faqList.get(i).getNombre()%></p></li>
                        <p> 
                            <%=faqList.get(i).getContenido()%></p>
                            <%}
                                }%>
                    </ul>

                    <% String rol = (String) session.getAttribute("adm");%>
                    <%if (rol == "OK") {%>


                    <a class="buttonAsd" href="faqAdm.jsp">Añadir faq</a>

                    <%}%>
                </div>               
                <div id="atras">
                    <a href="IndexServlet?act=faq"><img src="images/atras.png" alt="Volver"><br>Volver</a>
                </div>           
            </div>
            <%@include file="footer.html"%>    
        </div>             
    </body>
</html>
