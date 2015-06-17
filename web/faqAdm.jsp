<%-- 
    Document   : faqAdm
    Created on : 19-may-2015, 16:16:38
    Author     : asimart
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>E-BIN. Edición de noticias.</title>
        <link rel="stylesheet" type="text/css" href ="styles/style.css" />
    </head>
    <body>
        <div id="container">
            <%@include file="header.html"%>
            <div id="content">
                <%@include file="navigation.html"%>
                <div id="cuadroPerfil">
                    <% String isError = (String) request.getAttribute("isError");%>
                    <% if (isError == null) {%>
                    <h3>Añadir FAQ</h3>
                    <form name="addNew" method="POST" action="AdminServlet">
                        <table id="centrarTabla">
                            <tr>
                                <td>Nombre faq</td>
                                <td><input type="text" name="faqName" required="true"size="36"></td>
                            </tr>
                            <tr>
                                <td>Contenido faq:</td>
                                <td><textarea class=estilotextarea cols="40" rows="10"  maxlength="500" name="faqCont" required="true"></textarea></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td><input type="submit" name="buttondel" value="Agregar faq"></td>
                            </tr>
                        </table>
                    </form>
                    <%} else if (isError != null && isError.equals("OK")) {%>
                    <p class="textosCentrados">Se produjo un error durante el proceso de agregado. Vuelva a intentarlo.</p>
                    <%} else if (isError != null && isError.equals("NO")) {%>
                    <p class="textosCentrados">La entrada de faq se ha añadido correctamente.</p>
                    <%}%> 
                </div>               
                <div id="atras">
                    <a href="faq.jsp"><img src="images/atras.png" alt="Volver"><br>Volver</a>
                </div>           
            </div>
            <%@include file="footer.html"%>    
        </div>  
    </body>
</html>
