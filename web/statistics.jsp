<%-- 
    Document   : statistics
    Created on : 06-abr-2015, 18:06:05
    Author     : nurcanc
--%>


<%@page import="dominio.Producto"%>
<%@page import="dominio.Usuario"%>
<%@page import="dominio.Categoria"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>E-Bin. Estadísticas</title>
        <link rel="stylesheet" type="text/css" href ="styles/style.css" />
    </head>
    <body>
        <div id="container">
            <%@include file="header.html" %>
            <div id="content">
                <%@include file="navigation.html" %>
                <div class="textos">
                    <h3>Estadísticas</h3>
                    <form method="POST" action="EstadisticaServlet" name="Estadisticas">
                        <table id="statistics-form">
                            <tr>
                                <td colspan="2">
                                    <select name="tipoestadisticas" id="tipoestadisticas" required="true">
                                        <option value="1">1. Categoria</option>
                                        <option value="2">2. Puntos</option>
                                        <option value="3">3. Productos</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input name="enviar" type="submit" value="Enviar">
                                    <input name="borrar" type="reset" value="Limpiar"> 
                                </td>
                            </tr>
                        </table>
                    </form>
                    <br>
                    <div id="cajaEntregas">
                        <% String par = (String) request.getAttribute("par");%>
                        <% if (par != null && par.equals("1")){%>
                        <table class="entregas">
                            <tr>
                                <th>Categoría</th>
                                <th>Número de productos</th>
                                <th>Porcentaje</th>
                            </tr>
                            <%
                            ArrayList<Categoria> categorias = (ArrayList<Categoria>)request.getAttribute("categorias");
                            ArrayList<Integer> cantidad = (ArrayList<Integer>)request.getAttribute("cantidad");
                            ArrayList<Float> porcentaje = (ArrayList<Float>)request.getAttribute("porcentaje");
                            %>
                            <%for(int i=0;i<categorias.size();i++){%>
                            <tr>
                                <td><%=categorias.get(i).getNombre()%></td>
                                <td><%=cantidad.get(i)%></td>
                                <td><%=porcentaje.get(i)%></td>
                            <%}%>
                            </tr>
                        </table>     
                        <%}else{ if(par != null && par.equals("2")){%> 
                            <table class="entregas">
                            <tr>
                                <th>Usuario</th>
                                <th>Nombre</th>
                                <th>Apellidos</th>
                                <th>Puntos</th>
                            </tr>
                            <%   
                            ArrayList<Usuario> user = (ArrayList<Usuario>)request.getAttribute("user");
                            for(int i=0;i<user.size();i++){
                            %>
                            <tr>
                                <td><%=user.get(i).getLogin()%></td>
                                <td><%=user.get(i).getNombre()%></td>
                                <td><%=user.get(i).getApellidos()%></td>
                                <td><%=user.get(i).getEpoint()%></td>
                            <%}%>
                            </tr>
                        </table>                         
                        <%}else{ if(par != null && par.equals("3")){%>
                        <table class="entregas">
                            
                            <tr>
                                <th>Producto</th>
                                <th>Descripción</th>
                                <--Mirar en la DB los puntos relacionados a cada categoria -->
                                <th>Puntos asociados</th>
                            </tr>
                            <%  
                            ArrayList<Producto> prod = (ArrayList<Producto>)request.getAttribute("producto");
                            for(int i=0;i<prod.size();i++){
                            %>
                            <tr>
                                <td><%=prod.get(i).getNombre()%></td>
                                <td><%=prod.get(i).getDescripcion()%></td>
                                <td><%=prod.get(i).getCategoria().getEpasoc()%></td>
                             <%}%>
                            </tr>
                        </table> 
                        <%}}}%>                     
                    </div>
                </div>
                <div id="atras">
                    <a href="IndexServlet"><img src="images/atras.png" alt="Volver"><br>Volver</a>
                </div>  
            </div>
            <%@include file="footer.html" %>
        </div>                     
    </body>
</html>
