<%-- 
    Document   : produtosmaisencomendados
    Created on : 17/06/2021, 19:30:31
    Author     : suporte
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<!DOCTYPE html>

<html lang="en">
    <head>
        <title>Relat�rio - Produtos mais encomendados</title>
        <jsp:include page="../menu/imports/head.jsp"/>
        <meta name="viewport" content="width=device-width, initial-scale=0.5, shrink-to-fit=no">
    </head>
    <body>

        <div class="wrapper d-flex align-items-stretch">
            <!-- IMPORTAR MENU LATERAL-->
            <jsp:include page="../menu/menu-lateral.jsp"/>

            <!-- Page Content  -->
            <div id="content" class="p-4 p-md-5">
                <!-- IMPORTAR MENU P�GINA--> 
                <jsp:include page="../menu/menu-pagina.jsp"/>

                <h2 class="mb-4">Relat�rio - Produtos mais encomendados</h2>

                <!-- CONTEUDO DE FATO-->
                <div class="container ">
                    <div class="container">                        
                        <div>
                            <table class="table table-hover">
                                <tr>
                                    <td>Impresso por <%
                                        
                                        %></td> 
                                </tr>
                            </table>
                        </div>
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th scope="col">Produto</th>
                                    <th scope="col">Quantidade de pedidos</th>
                                    <th scope="col">Valor unit�rio</th>
                                    <th scope="col">Valor Total</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="produtomais" items="${produtomais}">
                                    <tr>
                                        <th scope="row">${produtomais["1"]}</th>
                                        <td>${produtomais["2"]}</td>
                                        <td>R$${produtomais["3"]}</td>
                                        <td>R$${produtomais["4"]}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>  
                        </table>                        
                        <form>
                            <input class="btn btn-info priint" type="button" value="Imprimir" onClick="window.print()"/>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- <script src="gestao/menu/js/jquery.min.js"></script> -->
        <jsp:include page="../menu/imports/fim.jsp"/>
        
    </body>
</html>