<%-- 
    Document   : ebin
    Created on : 09-abr-2015, 17:03:17
    Author     : Arkaitz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>E-Bin. Sobre E-Bin</title>
        <link rel="stylesheet" type="text/css" href ="styles/style.css" />
    </head>
    <body>
        <div id="container">
            <%@include file="header.html"%>
            <div id="content">
                <%@include file="navigation.html"%>
                <div class="textos2">
                    <h3>Acerca de E-Bin</h3>
                    <p>En E-Bin estamos comprometidos con el medio ambiente y por eso ha surgido esta 
                        web. <br> Nuestro compromiso con la sociedad es ofrecer soluciones eficientes, <br>
                        personalizadas para las necesidades de cada cliente, facilitando el cumplimiento <br> 
                        de la normativa vigente y contribuyendo, de esta forma, a la protección del <br>
                        medio ambiente.<br><br>
                        Para incentivar el reciclaje de tecnología y el uso de nuestra aplicación, hemos desarrollado<br>
                        un programa de recompensas, en las que un usuario gana ECO-Puntos mediante la entrega de productos<br>
                        electronicos para su reciclaje. Con esos puntos, un usuario puede conseguir grandes premios <br>
                        de nuestro catálogo.<br><br>
                        Cada categoría de productos tiene una cantidad de puntos asociados:<br>
                    
                        &bullet;Componentes informaticos: 80 Epoints<br>
                        &bullet;Moviles/Tabletas: 50 Epoints<br>
                        &bullet;Audio: 30 Epoints<br>
                        &bullet;Video: 30 Epoints<br>
                        &bullet;TV:40 Epoints<br>
                        &bullet;Baterias/Pilas/Cargadores: 5 Epoints<br>
                        &bullet;Videoconsolas: 60 Epoints<br>
                        &bullet;Electrodomésticos: 70 Epoints<br>
                        &bullet;Otros: 15 Epoints<br><br>
                    
                        Siguiendo Directiva Europea de Residuos de Aparatos Eléctricos y Electrónicos (RAEE) <br>
                        el proceso de reciclaje electrónico se inicia clasificando los componentes.El producto <br>
                        electrónico destinado a reciclaje es sometido al más estricto proceso de separación <br>
                        y clasificación debido al carácter peligroso de algunos componentes.
                    </p>
                    <div class="textosCentrados2">
                         Firmado :
                        <p>Equipo E-BIN</p>
                    </div>
                </div>
                <div id="atras">
                    <a href="IndexServlet"><img src="images/atras.png" alt="Volver"><br>Volver</a>
                </div>  
            </div>
            <%@include file="footer.html"%> 
        </div>
    </body>
</html>
