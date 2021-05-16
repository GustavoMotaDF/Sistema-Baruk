<%-- 
    Document   : consulta_encomenda
    Created on : 16/05/2021, 03:51:12
    Author     : alephtav
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <jsp:include page="menu/menu-lateral.jsp"/>

            <!-- Page Content  -->
            <div id="content" class="p-4 p-md-5">
                <!-- IMPORTAR MENU PÁGINA--> 
                <jsp:include page="menu/menu-pagina.jsp"/>

                <h2 class="mb-4">Sidebar #07</h2>
                <!-- CONTEUDO DE FATO-->
                <c:if test="${ empty resultado}">
                     <div class="container">
                    <form action="${pageContext.request.contextPath}/Encomenda"  method="post">
                        CPF:
                        <input type="text" name="cpf" class="form-control" required placeholder="CPF"/>
                        <br>
                        <input type="submit" name="consultar" class="form-control btn btn-info" value="Consultar"/>
                    </form>
                </div>
                </c:if>
                <c:if test="${ not empty resultado}">
                    
                    
                    ${resultado[0]}
                    ${resultado[1]}
                    ${resultado[2]}
                    ${resultado[3]}
                    
                    
                </c:if>


            </div>
        </div>

        <script src="gestao/menu/js/jquery.min.js"></script>
        <script src="gestao/menu/js/popper.js"></script>
        <script src="gestao/menu/js/bootstrap.min.js"></script>
        <script src="gestao/menu/js/main.js"></script>
    </body>
</html>

