<%-- 
    Document   : gifts
    Created on : 09-abr-2015, 17:25:27
    Author     : Arkaitz
--%>

<%@page import="dominio.Regalo"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>E-Bin. Catálogo de regalos</title>
        <link rel="stylesheet" type="text/css" href ="styles/style.css" />
        <script type="text/javascript">
            function validar(idReg){
                
                cantidad=document.getElementById("cantidad"+idReg).value;
                
                if(cantidad!=null && cantidad!="" && cantidad>0){
                    document.EntregaRegalos.submit();
                }else{
                    alert("¡No se ha introducido la cantidad correspondiente!");
                }
            }
        </script>
    </head>
    <body>
       <div id="container">
        <%@include file="header.html"%>    
            <div id="content">
                <%@include file="navigation.html"%>
                <div id="carritoRegalos">    
                    <ul>
                        <b>CARRITO:</b>
                        <%ArrayList<Regalo> regalos = (ArrayList<Regalo>)session.getAttribute("regalos");
                          ArrayList<String> cantidades=(ArrayList<String>)session.getAttribute("cantidades");
                            if(regalos!=null && cantidades!=null){
                                for(int i=0;i<regalos.size() && i<cantidades.size();i++){
                                String nombre=regalos.get(i).getNombre();
                                String cantidad=cantidades.get(i);
                                Integer puntos=regalos.get(i).getEpasoc()*Integer.parseInt(cantidad);
                                %>
                                <li><%=nombre+"(x"+cantidad+")\nPuntos: "+puntos%> <a href="PuntosServlet?act=deleteGift&&gift=<%=i%>"><img src="images/deleteProd.png"></a></li>
                                <%}
                            }%>   
                    </ul>
                </div>
                <div class="textos">
                    <jsp:useBean id="user" scope="session" class="dominio.Usuario"/> 
                    <h3>Catálogo de regalos</h3>
                    <h3><jsp:getProperty name="user" property="nombre"/>, dispones de <jsp:getProperty name="user" property="epoint"/> Epoints</h3>
                    <form method="post" action="PuntosServlet?act=canjeoPuntos" name="EntregaRegalos">
                    <table class="tablaCat">
                        <tr>                            
                            <td><img src="images/regalo1.png" alt="Regalo 1"><br></td>
                            <td><img src="images/regalo2.png" alt="Regalo 2"><br></td>
                            <td><img src="images/regalo3.png" alt="Regalo 3"><br></td>
                            <td><img src="images/regalo4.png" alt="Regalo 4"><br></td>
                        </tr>
                        
                        <tr>
                            <td>Cantidad: <input type="text" id="cantidad1" name="cantidad1" size="4"></td>
                            <td>Cantidad: <input type="text" id="cantidad2" name="cantidad2" size="4"></td>
                            <td>Cantidad: <input type="text" id="cantidad3" name="cantidad3" size="4"></td>
                            <td>Cantidad: <input type="text" id="cantidad4" name="cantidad4" size="4"></td>
                        </tr>
                        <tr>
                            <td><input type="button" value="Añadir" id="add1" class="buttonRegalo" onclick="validar(1)"/></td>
                            <td><input type="button" value="Añadir" id="add2" class="buttonRegalo" onclick="validar(2)"/></td>
                            <td><input type="button" value="Añadir" id="add3" class="buttonRegalo" onclick="validar(3)"/></td>
                            <td><input type="button" value="Añadir" id="add4" class="buttonRegalo" onclick="validar(4)"/></td>
                        </tr>
                        <% ArrayList<Regalo> regalosAct = (ArrayList<Regalo>)session.getAttribute("regalosAct");
                        %>
                        <tr class="pieFoto">
                            <%for(int i=0;i<regalosAct.size()/2;i++){%>
                            <td><%=regalosAct.get(i).getNombre()%><br><%=regalosAct.get(i).getEpasoc()%> ECOpuntos<br><%="Existencias: "+regalosAct.get(i).getCantidad()%></td>
                            <%}%>
                        </tr>
                        <tr>
                            <td><img src="images/regalo5.png" alt="Regalo 5"><br></td>
                            <td><img src="images/regalo6.png" alt="Regalo 6"><br></td>
                            <td><img src="images/regalo7.png" alt="Regalo 7"><br></td>
                            <td><img src="images/regalo8.png" alt="Regalo 8"><br></td>
                        </tr>
                        <tr>
                            <td>Cantidad: <input type="text" id="cantidad5" name="cantidad5" size="4"/></td>
                            <td>Cantidad: <input type="text" id="cantidad6" name="cantidad6" size="4"/></td>
                            <td>Cantidad: <input type="text" id="cantidad7" name="cantidad7" size="4"/></td>
                            <td>Cantidad: <input type="text" id="cantidad8" name="cantidad8" size="4"/></td>
                        </tr>
                        <tr>
                            <td><input type="button" value="Añadir" id="add5" class="buttonRegalo" onclick="validar(5)"/></td>
                            <td><input type="button" value="Añadir" id="add6" class="buttonRegalo" onclick="validar(6)"/></td>
                            <td><input type="button" value="Añadir" id="add7" class="buttonRegalo" onclick="validar(7)"/></td>
                            <td><input type="button" value="Añadir" id="add8" class="buttonRegalo" onclick="validar(8)"/></td>
                        </tr>
                        <tr class="pieFoto">
                            <%for(int i=regalosAct.size()/2;i<regalosAct.size();i++){%>
                            <td><%=regalosAct.get(i).getNombre()%><br><%=regalosAct.get(i).getEpasoc()%> ECOpuntos<br><%="Existencias: "+regalosAct.get(i).getCantidad()%></td>
                            <%}%>
                        </tr>
                    </table>
                </form>
                    <%String error=(String)request.getAttribute("error");
                      if(error!=null && error.equals("errorCantidad")){%>
                      <p class="errorstyle">Lo sentimos, no hay existencias suficientes de dicho regalo</p>
                      <%}else if(error!=null && error.equals("errorPuntos")){%>
                      <p class="errorstyle">Lo sentimos, no tiene los puntos suficientes para obtener ese regalo</p>
                      <%}%>
                      <a class="" href="PuntosServlet?act=finish">Finalizar canjeo</a>
                    <!-- <p>Hay que poner el boton para enviar entrega de los regalos</p> -->
                </div>
                <div id="atras">
                   <a href="IndexServlet"><img src="images/atras.png" alt="Volver"><br>Volver</a>
                </div>
            </div>
            <%@include file="footer.html"%> 
       </div>
    </body>
</html>
