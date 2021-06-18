<%-- 
    Document   : inicio
    Created on : 15/05/2021, 01:43:17
    Author     : alephtav
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<!DOCTYPE html>

<html lang="en">
    <head>
        <title>Inicio</title>
        <jsp:include page="gestao/menu/imports/head.jsp"/>
    </head>
    <body>

        <div class="wrapper d-flex align-items-stretch">
            <!-- IMPORTAR MENU LATERAL-->
            <jsp:include page="gestao/menu/menu-lateral.jsp"/>

            <!-- Page Content  -->
            <div id="content" class="p-4 p-md-5">
                <!-- IMPORTAR MENU PÁGINA--> 
                <jsp:include page="gestao/menu/menu-pagina.jsp"/>

                <h2 class="mb-4">Inicio</h2>
                <!-- CONTEUDO DE FATO-->

                <div class="container">
                    <h3>Hello, BARUK</h3>
                </div>


            </div>
        </div>
 <!-- <script src="gestao/menu/js/jquery.min.js"></script> -->
        <jsp:include page="gestao/menu/imports/fim.jsp"/>
    </body>
</html>
