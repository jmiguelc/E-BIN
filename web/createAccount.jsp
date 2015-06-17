<%-- 
    Document   : createAccount
    Created on : 14-abr-2015, 17:29:12
    Author     : nurcanc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>E-Bin. Crear Cuenta</title>
        <link rel="stylesheet" type="text/css" href ="styles/style.css" />
        <script type="text/javascript">
            function validar(numDir){
                val=false;
                i=0;
                pass = document.getElementById("password").value;
                pass2 =document.getElementById("password2").value;
                name = document.getElementById("nombre").value;
                login = document.getElementById("loginr").value;
                tel = document.getElementById("telefono").value;
                mail= document.getElementById("email").value;
               
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
                        alert('[ERROR] Campo direccion Vacío');
                    }
                    i++;
                }
                
                /*si todas las comprobaciones han sido correctas val tiene que ser true*/
                if (val== true){
                    document.register.submit();
                }
            }
        </script>    
    </head>
    <body>
        <div id="container">
            <%@include file="header.html"%>
            <div id="content">
                <%@include file="navigation.html"%>
                <div id="cuadroPerfil">
                    <% String errorReg = (String) request.getAttribute("errorReg");%>
                    <% String isLogin = (String) request.getAttribute("isLogin") ;%>
                    <% if (errorReg == null){%>
                    <form id="formReg" name="register" action="UsuarioServlet?act=create" method="POST">
                            <table id="centrarTabla">
                                <h2>Crea tu cuenta</h2>
                                <h3>Introduce los datos solicitados:</h3>
                                <tr>
                                    <td><b>Nombre:</b></td>
                                    <td><input  id="nombre" type="text" name="nombre" > </td>
                                </tr>
                                <tr>
                                    <td><b>Apellidos:</b></td>
                                    <td><input id="apellidos" type="text" name="apellidos" ></td>
                                </tr>
                                <tr>
                                    <td><b>Nick:</b></td>
                                    <td><input id="loginr" type="text" name="login"></td>
                                    <% if (isLogin != null){%>
                                        <p class="errorstyle"> Login ya existente</p>
                                    <% } %>
                                </tr>
                                <tr>
                                    
                                    <% Integer numDir = (Integer)request.getAttribute("numDir");
                                       if (numDir==null){
                                           numDir=1;
                                       }
                                       session.setAttribute("numDir", numDir);
                                       for(int i=0;i<numDir;i++){
                                    %>
                                    <td><b>Dirección<%=i+1%>:</b></td>
                                    <td><input  id="direccion<%=i%>" type="text" name="direccion<%=i%>" ></td>
                                    <%if(i==numDir-1){%>
                                    <td><a href="UsuarioServlet?act=newDirection"><img alt="Añadir Direccion" src="images/add_direction.png" id="addDir"></a></td>
                                    <%}%>
                                    </tr>
                                    <%}%>
                                <tr>
                                    <td><b>Teléfono</b></td>
                                    <td><input  id="telefono" type="text" name="telefono"  pattern="^[9|8|7|6]\d{8}$" title="Formato establecido( Ej:983254525 )" ></td>
                                </tr>
                                <tr>
                                    <td><b>E-mail:</b> </td>
                                    <td><input id="email" type="email" name="email" pattern="[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*@[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{1,5}" title="Formato establecido( Ej:pepe@mail.com )"></td>
                                </tr>
                                <tr>
                                    <td><b>Contraseña:</b> </td>
                                    <td><input id="password" type="password" name="password" ></td>
                                </tr>
                                <tr>
                                    <td><b>Repetir Contraseña:</b> </td>
                                    <td><input id="password2" type="password" name="password2" ></td>
                                </tr>
                            </table>
                            <br>
                            <div><input type="button" class="buttondel" value="Crear" onclick="validar(<%=numDir%>)" name="registerUser" id="buttonReg">
                            </div>
                    </form>
                    <% }else if (errorReg != null && errorReg == "OK"){%>
                        <p class="textosCentrados">Se ha producido un error durante el registro. Por favor, vuelva a intentarlo. </p>
                    <% }else if (errorReg != null && errorReg == "NO"){%>
                        <p class="textosCentrados"> Se ha registrado de forma satisfactoria. Puede acceder a su cuenta desde la página de Inicio. Gracias.
                    <%}%>
                </div>
                <div id="atras">
                   <a href="IndexServlet"><img src="images/atras.png" alt="Volver"><br>Volver</a>
                </div> 
            </div>
            <%@include file="footer.html"%> 
        </div>
        
        
    </body>
</html>
