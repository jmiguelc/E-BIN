<%-- 
    Document   : profile
    Created on : 13-abr-2015, 19:40:10
    Author     : nurcanc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>E-Bin. Mi perfil</title>
        <link rel="stylesheet" type="text/css" href ="styles/style.css" />
        <script type="text/javascript">
            function validar(numDir){
                i=0;
                val=false;
                pass = document.getElementById("password").value;
                pass2 =document.getElementById("password2").value;
                name = document.getElementById("nombre").value;
                login = document.getElementById("loginr").value;
                tel = document.getElementById("telefono").value;
                mail= document.getElementById("email").value;
               
                /*comprobacion de todos los campos menos direcciones*/
                if( name == null || name.length == 0 || /^\s+$/.test(name) ){
                    alert('[ERROR] Campo Nombre requerido');
                }else if ( login == null || login.length == 0 || /^\s+$/.test(login) ){
                    alert('[ERROR] Campo Nick requerido');
                }else if ( tel == null || tel.length == 0 || /^\s+$/.test(tel) ){
                     alert('[ERROR] Campo Teléfono requerido');
                }else if ( mail == null || mail.length == 0 || /^\s+$/.test(mail) ){
                     alert('[ERROR] Campo Email requerido');
                }else if ( pass == null || pass.length == 0 || /^\s+$/.test(pass) ){
                     alert('[ERROR] Debe introducir contraseña');
                }else if ( pass2 == null || pass2.length == 0 || /^\s+$/.test(pass2) ){
                     alert('[ERROR] Debe introducir repetición');
                }else if(pass != pass2){
                     alert('[ERROR] Las contraseñas no coinciden');
                }else {
                    val=true;
                }
                
                /*Comprobación de los campos direcciones*/
                while(i<numDir && val!=false){
                    dir = document.getElementById("direccion"+i).value;
                    if( dir == null || dir.length == 0 || /^\s+$/.test(dir) ){
                        val=false;
                        alert('[ERROR] Campo direccion requerido');
                    }
                    i++;
                }
                
                /*si todas las comprobaciones han sido correctas val tiene que ser true*/
                if (val== true){
                    document.prof.submit();
                }
            }
        </script>    
    </head>
    <body>
        <div id="container">
            <%@include file="header.html"%>
            <div id="content">
                <%@include file="navigation.html"%>
                <div id="cierreSes">
                    <a href="LogoutServlet"><img src="images/logout.png" alt="Cierre sesión"><br>Cerrar sesión</a>
                </div>
                <div id="cuadroPerfil">
                        <form id="profile" action="UsuarioServlet?act=mod" name="prof" method="POST"> 
                            <table id="centrarTabla">
                                <% String flag = (String) request.getAttribute("isEdit");%>
                                <jsp:useBean id="user" scope="session" class="dominio.Usuario"/> 
                                <h2>Mi Perfil</h2>
                                <tr>
                                    <td><b>Nombre:</b></td>
                                    <%if (flag != null && flag.equals("OK")){%>
                                    <td><input id="nombre" type="text" name="nombre" value="<jsp:getProperty name="user" property="nombre"/>"></td>
                                    <%}else{%>
                                    <td><input type="text" name="nombre" value="<jsp:getProperty name="user" property="nombre"/>" disabled="true"></td>
                                    <%}%>
                                </tr>
                                <tr>
                                    <td><b>Apellidos:</b></td>
                                    <%if (flag != null && flag.equals("OK")){%>
                                    <td><input id="apellidos" type="text" name="apellidos" value="<jsp:getProperty name="user" property="apellidos"/>"></td>
                                    <%}else {%>
                                    <td><input type="text" name="apellidos" value="<jsp:getProperty name="user" property="apellidos"/>" disabled="true"></td>
                                    <%}%>
                                </tr>
                                <tr>
                                    <td><b>Nick:</b></td>
                                    <%if (flag != null && flag.equals("OK")){%>
                                    <td><input id="loginr" type="text" name="login" value="<jsp:getProperty name="user" property="login"/>"></td>
                                    <%}else{%>
                                    <td><input type="text" name="login" value="<jsp:getProperty name="user" property="login"/>" disabled="true"> </td>
                                    <%}%>
                                </tr>
                                    <td><b>Direcciones:</b></td>
                                    <%int i=0;
                                      int numDir=user.getDirecciones().size();
                                    %>
                                    <%if (flag != null && flag.equals("OK")){%>
                                        <%for(i=0;i<numDir;i++){%>
                                            <tr><td></td>
                                            <td><input id="direccion<%=i%>" type="text" name="direccion<%=i%>" value="<%=user.getDirecciones().get(i).getDireccion()%>"></td>
                                            </tr>
                                        <%}
                                          session.setAttribute("numDir", i);%>
                                    <%}else{%>
                                        <%for(i=0;i<user.getDirecciones().size();i++){%>
                                            <tr><td></td>
                                            <td><input type="text" name="direccion" value="<%=user.getDirecciones().get(i).getDireccion()%>" disabled="true" ></td>
                                            </tr>
                                        <%}%>
                                    <%}%>
                                <tr>
                                    <td><b>Teléfono:</b></td>
                                    <%if (flag != null && flag.equals("OK")){%>
                                    <td><input id="telefono" type="text" name="telefono" value="<jsp:getProperty name="user" property="telefono"/>" pattern="^[9|8|7|6]\d{8}$" title="Formato establecido( Ej:983254525 )"></td>
                                    <%}else{%>
                                    <td><input id="telefono" type="text" name="telefono" value="<jsp:getProperty name="user" property="telefono"/>" disabled="true" ></td>
                                    <%}%>
                                </tr>
                                <tr>
                                    <td><b>E-mail:</b> </td>
                                     <%if (flag != null && flag.equals("OK")){%>
                                     <td><input id="email" type="text" name="email" value="<jsp:getProperty name="user" property="email"/>" pattern="[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*@[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{1,5}" title="Formato establecido( Ej:pepe@mail.com )"></td>
                                    <%}else {%>
                                     <td><input type="text" name="email" value="<jsp:getProperty name="user" property="email"/>" disabled="true"></td>
                                    <%}%> 
                                </tr>
                                <tr>
                                    <td><b>Contraseña:</b> </td>
                                     <%if (flag != null && flag.equals("OK")){%>
                                     <td><input id="password" type="text" name="password" value="<jsp:getProperty name="user" property="password"/>"></td>
                                    <%}else {%>
                                     <td><input type="password" name="password" value="<jsp:getProperty name="user" property="password"/>" disabled="true"></td>
                                    <%}%> 
                                </tr>
                                <tr>
                                    <td><b>Repetir Contraseña:</b> </td>
                                     <%if (flag != null && flag.equals("OK")){%>
                                     <td><input id="password2" type="text" name="password2" value="<jsp:getProperty name="user" property="password"/>"></td>
                                    <%}else {%>
                                     <td><input type="password" name="password2" value="<jsp:getProperty name="user" property="password"/>" disabled="true"></td>
                                    <%}%> 
                                </tr>
                            </table>
                            <br>
                            <div>
                                <% if (flag != null && flag.equals("OK")){%>
                                <% request.setAttribute("isSave", "OK");%>
                                    <input class="buttondel" type="button" onclick="validar(<%=numDir%>)" value="Guardar cambios" name="saveProfile">
                                <%}else{%>
                                <a class="buttonEnl" href="UsuarioServlet?act=edit">Editar datos</a>
                                <%}%>
                                <% String errorMod = (String) request.getAttribute("errorMod");%>
                                <% String isLogin = (String) request.getAttribute("isLogin");%>
                                <% if (errorMod != null && errorMod.equals("OK")){%>
                                    <p>Se ha producido un error durante la modificación de datos. Vuelva a intentarlo.</p> 
                                    <% }else if (errorMod != null && errorMod.equals("NO")){%>
                                    <p>Se han realizado los cambios de manera correcta.</p>
                                <%}%> 
                                <% if (isLogin != null && isLogin.equals("OK")){%>
                                    <p>Ya existe un usuario registrado con ese login.</p>
                                <%}%>
                            </div>
                    </form>
                </div>
                <div id="atras">
                   <a href="account.jsp"><img src="images/atras.png" alt="Volver"><br>Volver</a>
                </div>     
           </div>
            <%@include file="footer.html"%> 
        </div>
    </body>
</html>
