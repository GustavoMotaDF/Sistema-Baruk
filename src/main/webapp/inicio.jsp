<%-- 
    Document   : inicio
    Created on : 15/05/2021, 01:43:17
    Author     : alephtav
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!doctype html>
<html lang="en">
    <head>
        <title>Sidebar 07</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="gestao/menu/css/style.css">
    </head>
    <body>

        <div class="wrapper d-flex align-items-stretch">
            <!-- IMPORTAR MENU LATERAL-->
            <jsp:include page="gestao/menu/menu-lateral.jsp"/>

            <!-- Page Content  -->
            <div id="content" class="p-4 p-md-5">
                <!-- IMPORTAR MENU PÁGINA--> 
                <jsp:include page="gestao/menu/menu-pagina.jsp"/>

                <h2 class="mb-4">Sidebar #07</h2>
                <!-- CONTEUDO DE FATO-->

                <div class="container">
                    <h3>Hello, BARUK</h3>
                </div>


            </div>
        </div>

        <script src="gestao/menu/js/jquery.min.js"></script>
        <script src="gestao/menu/js/popper.js"></script>
        <script src="gestao/menu/js/bootstrap.min.js"></script>
        <script src="gestao/menu/js/main.js"></script>
    </body>
</html>
