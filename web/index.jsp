<%-- 
    Document   : index
    Created on : 26-mar-2015, 11:38:47
    Author     : arklaza
    Author     : juacelo
--%>

<%@page import="datos.NoticiaDB"%>
<%@page import="dominio.Noticia"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dominio.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bienvenido a E-Bin. Página de Inicio</title>
        <link rel="stylesheet" type="text/css" href ="styles/style.css" />
    </head>
    <body>
        <script type="text/javascript"> 
        function showErrorMessage(){
           alert("¡Para realizar una entrega debes indetificarte en el sistema primero!\n Disculpe las molestias");
        }
        function showErrorMessageAccount(){
           alert("¡Para tener acceso a la zona Mi Cuenta es necesario estar identificado en el sistema!"); 
        }
        </script>    
        <div id="container">
        <%@include file="header.html"%>    
            <div id="content">
                <%@include file="navigation.html"%>
                <div id="productos">
                    <h3>Productos</h3><br>
                    <ul>
                        <li><a href="CatalogoServlet?act=Componentes informaticos">Componentes Informáticos</a></li><br>
                        <li><a href="CatalogoServlet?act=Moviles/tabletas">Móviles/Tabletas</a></li><br>
                        <li><a href="CatalogoServlet?act=Audio">Audio</a></li><br>
                        <li><a href="CatalogoServlet?act=Video">Vídeo</a></li><br>
                        <li><a href="CatalogoServlet?act=TV">TV</a></li><br>
                        <li><a href="CatalogoServlet?act=Baterias/Pilas/Cargadores">Baterías/Pilas/Cargadores</a></li><br>
                        <li><a href="CatalogoServlet?act=Videoconsolas">Videoconsolas</a></li><br>
                        <li><a href="CatalogoServlet?act=Electrodomesticos">Electrodomésticos</a></li><br>
                        <li><a href="CatalogoServlet?act=Otros">Otros</a></li><br>
                    </ul>
                </div>
                
                <div id="novedades">
                    <h3>Noticias</h3>
                    <% ArrayList<Noticia> listNot = (ArrayList<Noticia>) request.getAttribute("listNot");%>
                    <ul>
                        <% for(int i=0;i<listNot.size();i++){%>
                        <li><p><b><%=listNot.get(i).getNombre()%></b></p></li>
                            <p><%=listNot.get(i).getContenido()%></p>
                        <%}%>    
                    </ul>
                    <% String rol = (String) session.getAttribute("adm");%>
                    <%if (rol == "OK") {%>
                        <div><a class="buttonEnl" href="AdminServlet?act=noticia">Añade noticia</a></div>
                    <%} %>
                </div>
                <div id="compuesto">
                    <div id="login">
                        <% String error = (String) request.getAttribute("err");%>
                        <% String exito = (String) session.getAttribute("success");%>
                        <% if (exito != "OK") {%>
                        <p class="centrado">Login</p>
                 
                        <form method="post" action="LoginServlet">
                            <table id="tablaLogin" >
                                <tr>
                                    <td>Usuario:</td>
                                    <td><input type="text" name="usuario" size=15 required="true"/></td>
                                </tr>
                                <tr>
                                    <td>Contraseña:</td>
                                    <td><input type="password" name="password" size=15 required="true"/></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td><input type="submit" value="Entrar"/></td>
                                </tr>
                            </table>
                            <% if (error == "OK") {%>
                            <p class="errorstyle">Usuario o contraseña incorrectos</p>
                            <% } %>
                            <p>
                                <a href="recoverPassword.jsp">¿Has olvidado tu contraseña?</a><br>
                                <a href="createAccount.jsp">Crea tu cuenta</a>
                            </p>
                        </form>
                        <% }else {%>
                            <jsp:useBean id="user" scope="session" class="dominio.Usuario"/> 
                            <p class="textosCentrados"> Bienvenido, <jsp:getProperty name="user" property="nombre"/> 
                                <jsp:getProperty name="user" property="apellidos"/></p>
                            <p class="textosCentrados"><a href="LogoutServlet">Cerrar sesión</a></p>
                        <% } %>
                    </div>
                    <div id="estadisticas">
                        <table class="tablaEstadist">
                            <tr>
                                <td>
                                    <img src="images/estadistica.png" alt="estadistica" width="40px" height="40px"/>
                                </td>
                                <td>
                                    <a href="statistics.jsp">Comprueba nuestras<br>estadísticas</a>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div id="enlaces">
                        <p class="centrado">Visítanos</p>
                        <a href="http://www.facebook.com "><img class="redes" src="images/facebook.png" alt="Facebook"/></a>
                        <a href="http://www.plus.google.com "><img class="redes" src="images/google.png" alt="Google+"/></a>
                        <a href="http://www.twitter.com "><img class="redes" src="images/twitter.png" alt="Twitter"/></a>
                    </div>
                    
                </div> 
            </div>
        <%@include file="footer.html"%>   
        </div>
        <%String errorLogin=(String)request.getAttribute("errorlogin"); 
        if(errorLogin!=null && errorLogin.equals("errorLogin")){%>
        <script type="text/javascript">showErrorMessage();</script>
        <%}%>
        <%String errorCuenta=(String)request.getAttribute("errorCuenta"); 
        if(errorCuenta!=null && errorCuenta.equals("errorCuenta")){%>
        <script type="text/javascript">showErrorMessageAccount();</script>
        <%}%>
    </body>
</html>
