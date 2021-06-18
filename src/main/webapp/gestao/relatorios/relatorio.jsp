<%-- 
    Document   : relatorio
    Created on : 11/06/2021, 19:54:17
    Author     : suporte
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<!DOCTYPE html>

<html lang="en">
    <head>
        <title>Relatórios</title>
        <jsp:include page="../menu/imports/head.jsp"/>
        <meta name="viewport" content="width=device-width, initial-scale=0.5, shrink-to-fit=no">
    </head>
    <body>

        <div class="wrapper d-flex align-items-stretch">
            <!-- IMPORTAR MENU LATERAL-->
            <jsp:include page="../menu/menu-lateral.jsp"/>

            <!-- Page Content  -->
            <div id="content" class="p-4 p-md-5">
                <!-- IMPORTAR MENU PÁGINA--> 
                <jsp:include page="../menu/menu-pagina.jsp"/>

                <h2 class="mb-4">Relatórios-Clientes</h2>

                <!-- CONTEUDO DE FATO-->
                <div class="container ">
                    <div class="container"> 

                        <div class="row text-center">
                            <div class="col-md-11 border-success">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th scope="col">Nome</th>
                                            <th scope="col">CPF</th>
                                            <th scope="col">Telefone</th>
                                            <th scope="col">Endereço</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="clientes" items="${clientes}">
                                            <tr>
                                                <th scope="row">${clientes.nome}</th>
                                                <td>${clientes.cpf}</td>
                                                <td>${clientes.telefone}</td>
                                                <td>${clientes.endereco}</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>  
                                </table>
                            </div>
                        </div>                        
                    </div>
                </div>
            </div>
        </div>

        <!-- <script src="gestao/menu/js/jquery.min.js"></script> -->
        <jsp:include page="../menu/imports/fim.jsp"/>
    </body>
</html>