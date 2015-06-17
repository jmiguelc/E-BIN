<%-- 
    Document   : recoverPassword
    Created on : 14-abr-2015, 17:39:54
    Author     : nurcanc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>E-Bin. Recuperar Contraseña</title>
        <link rel="stylesheet" type="text/css" href ="styles/style.css" />
    </head>
    <body>
        <div id="container">
            <%@include file="header.html"%>
            <div id="content">
                <%@include file="navigation.html"%>
                <div id="cuadroPerfil">
                    <% String rec = (String) request.getAttribute("recoverOK");%>
                    <% String err = (String) request.getAttribute("noEmail");%>
                    <% if (rec == null && err == null){%>
                    <form name="recovery" action="UsuarioServlet" method="POST"> 
                        <table id="centrarTabla">
                            <h2>Recuperar Contraseña:</h2>
                            <tr>
                                <td><b>Introduce tu correo electrónico:</b></td>
                                <td><input type="email" name="email" pattern="[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*@[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{1,5}" title="Formato establecido( Ej:pepe@mail.com )"></td>
                            </tr>
                        </table> 
                        <br>
                        <div><input class="buttondel" type="submit" value="Recuperar" name="recoverPass">
                        </div>
                    </form>
                    <% }else if (rec != null && rec.equals("OK")){%>
                    <% String email = (String)request.getAttribute("mail"); %>
                    <p class="textosCentrados">Se ha enviado la contraseña a la cuenta de correo electrónico facilitada: <%= email%>.</p>
                    <% }else if (err != null && err.equals("NO")) { %>
                    <p class="textosCentrados">El correo electrónico no se corresponde con ninguno registrado.</p>
                    <a href="recoverPassword.jsp">Inténtelo con otro</a>
                    <% } %>
                </div>
                 
                <div id="atras">
                   <a href="IndexServlet"><img src="images/atras.png" alt="Volver"><br>Volver</a>
                </div> 
            </div>
            <%@include file="footer.html"%> 
        </div>
    </body>
</html>
