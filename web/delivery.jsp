<%-- 
    Document   : delivery
    Created on : 09-abr-2015, 11:39:24
    Author     : asimart
--%>

<%@page import="dominio.Producto"%>
<%@page import="dominio.Entrega"%>
<%@page import="dominio.Categoria"%>
<%@page import="dominio.Usuario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="datos.DireccionDB"%>
<%@page import="datos.CategoriaDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
        <title>E-Bin. Proceso de entrega</title>
        <link rel="stylesheet" type="text/css" href ="styles/style.css" />
    </head>
    <body>
        <div id="container">
            <%@include file="header.html"%>
            <div id="content">
                <%@include file="navigation.html"%>
                <div id="carrito">
                    <h3 class="centrado">Carrito:</h3>
                    <ul>
                        <%Entrega entrega = (Entrega) session.getAttribute("entrega");
                            if (entrega != null) {
                                ArrayList<Producto> productos = entrega.getProductos();
                                for (int i = 0; i < productos.size(); i++) {
                        %>
                        <li><%=productos.get(i).getNombre() + " (x" + productos.get(i).getCantidad() + ") "%><a href="EntregaServlet?act=deleteProd&&prod=<%=i%>"><img src="images/deleteProd.png"></a></li><br>
                                <%}
                        }%>
                    </ul>
                </div>
                <div id="cuadroEntr">
                    <h3>Entrega de Producto</h3><br>
                    <form method="post" action="EntregaServlet" name="EntregaProductos">
                        <legend><b>Datos de producto</b></legend><br>
                        Producto:<br>
                        <input type="text" name="producto" id="producto" required="true">
                        <br>
                        Descripción:<br>
                        <input type="text" name="descripcion" id="descripcion" required="true">
                        <br>
                        Cantidad:<br>
                        <input type="text" name="cantidad" id="cantidad" required="true" pattern="[1-9][0-9]*" title="Por favor, introduzca un número">
                        <br>
                        Categoria:<br>
                        <SELECT name="categoria" required="true">
                            <% ArrayList<Categoria> categorias = (ArrayList<Categoria>) request.getAttribute("categorias");
                                    for (int i = 0; i < categorias.size(); i++) {%>
                            <option value="<%=categorias.get(i).getIdcat()%>"><%=categorias.get(i).getNombre()%></option>  
                            <%}%>
                        </SELECT>
                        <br><br>    
                        <br>                    
                        <legend><b>Datos de recogida</b></legend><br>
                        Direcciones de entrega:<br>
                        <table align="center">                           
                            <% Usuario user = (Usuario) session.getAttribute("user");
                                for (int i = 0; i < user.getDirecciones().size(); i++) {%>
                            <tr><td align="left">
                                    <input type="radio" id="direccion" name="direccion" value="<%=user.getDirecciones().get(i).getIdDir()%>" required="true"/><%=user.getDirecciones().get(i).getDireccion()%><br>
                                </td></tr>
                                <% } %>
                        </table>
                        <%String error = (String) request.getAttribute("err");
                                if (error == "Error") { %>
                        <p class="errorstyle">Error: Compruebe que ningun campo esté vacio</p>
                        <%}%>
                        <div><input name="add" class="buttondel" type="submit" value="Añadir"></div>
                        <div align="right">
                            <br><br><br>
                            <div><a class="buttondel" href="EntregaServlet?act=finish">Entregar</a></div>
                        </div>
                    </form>
                </div> 
                <div id="atras">
                    <a href="IndexServlet"><img src="images/atras.png" alt="Volver"><br>Volver</a>
                </div>
                <%String noProducts = (String) request.getAttribute("noProducts");%>
                <% if (noProducts != null && noProducts.equals("OK")) {%>
                <script type="text/javascript">showErrorMessage();</script>
                <%}%>
            </div>
            <%@include file="footer.html"%>
        </div>      
    </body>
</html>
