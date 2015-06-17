<%-- 
    Document   : index
    Created on : 26-mar-2015, 11:38:47
    Author     : arklaza
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>E-Bin. Mis puntos</title>
        <link rel="stylesheet" type="text/css" href ="styles/style.css" />
    </head>
    <body>
        <div id="container">
           <%@include file="header.html"%>
            <div id="content">
                <%@include file="navigation.html"%>                
                <div id="cierreSes">
                    <a href="LogoutServlet"><img src="images/logout.png" alt="Cierre sesión"><br>Cerrar sesión</a>
                </div>
                <div class="textos">
                    <div id="cuadroBienv">
                        <p class="msjBienv">Hola <jsp:getProperty name="user" property="nombre"/>, Bienvenido a E-Bin</p>
                    </div>
                    <!-- centrar a partir de aqui -->
                    <div id="cajaPuntos">
                        <p>Dispones de:</p>
                        <div class="puntos">
                            <jsp:useBean id="user" scope="session" class="dominio.Usuario"/>
                            <jsp:getProperty name="user" property="epoint"/>
                        </div>
                        ECO-Puntos
                        <p><a href="PuntosServlet?act=regalos">Canjea tus ECO-Puntos aquí</a></p>
                    </div>
                </div>
                <div id="atras">
                    <a href="account.jsp"><img src="images/atras.png" alt="Volver"><br>Volver</a>
                </div>    
                 
            </div>
            <%@include file="footer.html"%>
        </div>             
    </body>
</html>
