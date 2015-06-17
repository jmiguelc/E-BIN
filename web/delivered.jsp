<%-- 
    Document   : index
    Created on : 26-mar-2015, 11:38:47
    Author     : arklaza
--%>

<%@page import="dominio.CompositeEntrega"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>E-Bin. Mis entregas</title>
        <link rel="stylesheet" type="text/css" href ="styles/style.css" />
    </head>
    <body>
        <div id="container">
            <%@include file="header.html"%>    
            <div id="content">
                <%@include file="navigation.html"%>    
                <div id="cierreSes">
                    <a href="IndexServlet"><img src="images/logout.png" alt="Cierre sesión"><br>Cerrar sesión</a>
                </div>
                <div class="textos">
                    <div id="cuadroBienv">
                        <jsp:useBean id="user" scope="session" class="dominio.Usuario"/>
                        <p class="msjBienv">Hola <jsp:getProperty name="user" property="nombre"/>, Bienvenido a E-Bin</p>
                    </div>
                    <div id="cajaEntregas">
                         <% ArrayList<CompositeEntrega> listProd = (ArrayList<CompositeEntrega>) request.getAttribute("listProd");%>
                         <% if (listProd.isEmpty()) {%>
                                <p class="textosCentrados">No ha realizado ninguna entrega de productos hasta el momento</p>
                         <% } else {%>
                         <table class="entregas">
                            <caption style="font-weight: bold">Historial de entregas realizadas</caption>
                            <tr>
                                <th>Producto</th>
                                <th>Descripción</th>
                                <th>Fecha entrega</th>
                                <th>Puntos asociados</th>
                            </tr>
                            <% for (int i = 0; i < listProd.size(); i++) {%>
                            <% CompositeEntrega prod = listProd.get(i);%>
                            <tr>
                                <td><%=prod.getProducto().getNombre()%></td>
                                <td><%=prod.getProducto().getDescripcion()%></td>
                                <td><%=prod.getFecha()%></td>
                                <td><%=prod.getPuntos()%></td>
                            </tr>
                            <% } %>
                        </table>
                        <% }%>
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
