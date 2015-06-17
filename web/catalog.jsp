<%-- 
    Document   : catalog
    Created on : 13-may-2015, 11:53:41
    Author     : Arkaitz
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dominio.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>E-BIN. Productos.</title>
        <link rel="stylesheet" type="text/css" href ="styles/style.css" />
    </head>
    <body>
         <div id="container">
            <%@include file="header.html"%>
            <div id="content">
                <%@include file="navigation.html"%>
                <div id="cuadroPerfil">
                    <% String cat = (String) request.getAttribute("cat");%>
                    <% ArrayList<Producto> listProd = (ArrayList<Producto>) request.getAttribute("listProd");%>
                    <h3>Lista de productos para la categoría:&nbsp;<b><%=cat%></b></h3>
                    <%if (!listProd.isEmpty()){%>
                    <ul>
                    <% for (int i=0;i<listProd.size();i++){%>
                        <li>Nombre producto: <b><%=listProd.get(i).getNombre()%></b> ----- Descripción: <b><%=listProd.get(i).getDescripcion()%></b> ----- Cantidad: <b><%=listProd.get(i).getCantidad()%></b></li>
                    <%}%>
                    </ul>
                    <%}else {%>
                        <p class="textosCentrados">No hay productos disponibles de esta categoría.</p>
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
