<%-- 
    Document   : calculator
    Created on : 14-abr-2015, 16:21:12
    Author     : asimart
--%>

<%@page import="dominio.Categoria"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>E-bin. Calculadora ECO-Puntos</title>
    </head>
    <body>
        <div id="container">
            <%@include file="header.html"%>    
            <div id="content">
                <%@include file="navigation.html"%>
                <div class="textos">
                    <% String isError = (String) request.getAttribute("isError");%>
                    <% if (isError == null) {%>
                    <h3>Calculadora de ECO-POINTS</h3><br>

                    <form method="post" action="PuntosServlet?act=calcular" name="Calculadora">
                          <table class="tablaCat">
                            <tr>                            

                            <div class="elemcentrado">
                                <td width="40%">
                                    <br><br><label for="so">Categorias</label> 

                                    <br><br> <SELECT id="categoria" name="categoria" required="true">
                                        <% ArrayList<Categoria> categorias = (ArrayList<Categoria>) session.getAttribute("categorias");
                                            for (int i = 0; i < categorias.size(); i++) {%>
                                        <option value="<%=categorias.get(i).getIdcat()%>"><%=categorias.get(i).getNombre()%></option>  
                                        <%}%>
                                    </SELECT>
                                    <br><br>
                                    <label for="cant">Cantidad</label> <br><br>
                                    <input type="text" value="0" name="cant" size=5 required="true" pattern="[1-9][0-9]*" title="Por favor, introduzca un número mayor que 0"/>
                                    <br><br>
                                    <input class="buttondel" name="send" value="Enviar" type="submit" onclick="validar()"/>
                                    <a class="buttondel" href="PuntosServlet?act=borrar">Borrar</a>
                                    <br><br>
                                <td width="40%">
                                    <% ArrayList<Categoria> listaCatCalc=(ArrayList<Categoria>)session.getAttribute("listaCatCalc");
                                       ArrayList<Integer> listaCantCalc=(ArrayList<Integer>)session.getAttribute("listaCantCalc");
                                        if (listaCatCalc!=null && listaCantCalc!=null){
                                            int i=0;
                                            while(i<listaCatCalc.size() && i<listaCantCalc.size()){ 
                                                //Se pone de esta forma por cuestiones de lgibilidad
                                                String nombre=listaCatCalc.get(i).getNombre();
                                                int puntos=listaCatCalc.get(i).getEpasoc();
                                                int cantidad=listaCantCalc.get(i);
                                                int subtotal=puntos*cantidad;
                                            %>
                                            <p><%=nombre%> puntos:<%=puntos%> cantidad:<%=cantidad%> subtotal:<%=subtotal%></p>
                                                <%i++;
                                            }
                                        }%>
                                </td>
                                <td>
                                    <div id="cajaPuntos">
                                        <p>Puntos que podrías obtener</p>
                                        <div class="puntos">
                                            <%Integer total = (Integer)session.getAttribute("total");
                                              if(total==null){
                                                  total=0;
                                              } %>
                                            <%=total%>
                                        </div>
                                        ECO-Puntos
                                    </div>

                                </td>
                                </tr>
                        </table>
                    </form>
                    <%} else if (isError != null && isError.equals("OK")) {%>
                    <p class="textosCentrados">Se produjo un error durante el proceso de agregado. Vuelva a intentarlo.</p>
                    <%} else if (isError != null && isError.equals("NO")) {%>
                    <p class="textosCentrados">La entrada de faq se ha añadido correctamente.</p>
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
