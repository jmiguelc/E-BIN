<%-- 
    Document   : delivery_end
    Created on : 09-abr-2015, 13:37:45
    Author     : asimart
--%>

<%@page import="dominio.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>E-Bin. Detalles entrega</title>
        <link rel="stylesheet" type="text/css" href ="styles/style.css" />
    </head>
    <body>
        <div id="container">
            <%@include file="header.html"%>    
            <div id="content">
                <%@include file="navigation.html"%>    
                <div id="cierreSes">
                    <a href="index.jsp"><img src="images/logout.png" alt="Cierre sesión"><br>Cerrar sesión</a>
                </div>
                <div class="textos">
                    <div id="cuadroBienv">
                        <jsp:useBean id="user" scope="session" class="dominio.Usuario"/> 
                        <p class="msjBienv">Hola <jsp:getProperty name="user" property="nombre"/>, estos son los detalles de tu entrega</p>
                    </div>
                    <div id="cajaEntregas">
                        <table class="entregas">
                            <caption style="font-weight: bold">Detalles de la entrega</caption>
                            <tr>
                                <th>Producto</th>
                                <th>Descripción</th>
                                <th>Dirección</th>
                                <th>Fecha entrega</th>
                                <th>Puntos asociados</th>
                            </tr>
                            <jsp:useBean id="entrega" scope="session" class="dominio.Entrega"/>
                            <%
                            for(int i=0;i<entrega.getProductos().size();i++){ 
                            Producto p=entrega.getProductos().get(i);
                            %>
                            <tr>
                                <td><%=p.getNombre()%></td>
                                <td><%=p.getDescripcion()%></td>
                                <td><%=entrega.getDireccion().getDireccion()%></td>
                                <td><%=entrega.getFechaAlta()%></td>
                                <td><%=p.getCategoria().getEpasoc()*p.getCantidad()%></td>
                            </tr>
                            <%}%>
                        </table>
                    </div>
                </div>
                 <div id="atras">
                     <a href="EntregaServlet?act=entregar"><img src="images/finalizar.png" alt="Volver"><br>Finalizar</a>
                </div>  
            </div>
            <%@include file="footer.html"%>    
        </div>             
    </body>
</html>