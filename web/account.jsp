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
        <title>E-Bin. Mi cuenta</title>
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
                        <jsp:useBean id="user" scope="session" class="dominio.Usuario"/> 
                        <p class="msjBienv">Hola <jsp:getProperty name="user" property="nombre"/>, Bienvenido a E-Bin</p>
                    </div>
                    <div class="cajaZona">
                        <table class="tablaZona">
                            <tr>
                                <td class="logoCelda"><img src="images/perfil.png" alt="Mi perfil"></td>
                                <td><a href="CuentaServlet?act=info" class="contCelda">Mi Perfil<br>(Modificar datos personales, contraseña, etc)</a></td>
                            </tr>
                        </table>
                    </div><br>
                    <div class="cajaZona">
                        <table class="tablaZona">
                            <tr>
                                <td class="logoCelda"><img src="images/entregas.png" alt="Mis entregas"></td>
                                <td><a href="CuentaServlet?act=deliveries" class="contCelda">Mis Entregas<br>(Consulta tus entregas realizas)</a></td>
                            </tr>
                        </table>
                    </div><br>
                    <div class="cajaZona">
                        <table class="tablaZona">
                            <tr>
                                <td class="logoCelda"><img src="images/puntos.png" alt="Mis puntos"></td>
                                <td><a href="CuentaServlet?act=points" class="contCelda">Mis Puntos<br>(Consulta tus ECO-Puntos acumulados)</a></td>

                            </tr>
                        </table>
                    </div>
                </div>
                <div id="atras">
                       <a href="IndexServlet"><img src="images/atras.png" alt="Volver"><br>Volver</a>
                </div>  
            </div>
            <%@include file="footer.html"%>
        </div>             
    </body>
</html>
