<%-- 
    Document   : errorPage
    Created on : 21-may-2015, 16:55:31
    Author     : arklaza
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>E-BIN. Se ha producido un error.</title>
        <link rel="stylesheet" type="text/css" href ="styles/style.css" />
    </head>
    <body>
        <div id="container">
            <%@include file="header.html"%>
            <div id="content">
                <div class="centradoErr">
                    <h1>Lo sentimos, se ha producido un error :(</h1>
                    <% Integer errorCode = (Integer) request.getAttribute("isCodeError");%>
                    <% if (errorCode == 404) {%>
                    <h3><%=errorCode%> Error</h3>
                    <p>Recurso no encontrado. El servidor no ha sido capaz de localizar el recurso</p>
                    <p><a href="IndexServlet">Volver a la página de inicio</a></p>
                    <%}%>
                    <% if (errorCode == 403) {%>
                    <h3><%=errorCode%> Error</h3>
                    <p>Prohibido. La solicitud fue legal, pero el servidor se rehúsa a responderla</p>
                    <p><a href="IndexServlet">Volver a la página de inicio</a></p>
                    <%}%>
                    <% if (errorCode == 500) {%>
                    <h3><%=errorCode%> Error</h3>
                    <p>Error interno. Se ha producido un error en el servidor y no puede completar la solicitud.</p>
                    <p><a href="IndexServlet">Volver a la página de inicio</a></p>
                    <%}%>
                    <% if (errorCode == 503) {%>
                    <h3><%=errorCode%> Error</h3>
                    <p>Servicio no disponible. El servidor no está disponible en estos momentos, debido a tareas de mantenimiento o a una sobrecarga.</p>
                    <p><a href="IndexServlet">Volver a la página de inicio</a></p>
                    <%}%>
                </div>
            </div>
            <%@include file="footer.html"%> 
        </div>
    </body>
</html>
