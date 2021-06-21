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
                                <c:if test="${ empty resultado}">
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th scope="col">Nome</th>
                                                <th scope="col">CPF</th>
                                                <th scope="col">Endereço</th>
                                                <th scope="col">Telefone</th>
                                                <th scope="col">Quantidade de Pedidos</th>
                                                <th scope="col">Valor total dos Pedidos</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="relatoriobo" items="${relatoriobo}">
                                                <tr>
                                                <tr>
                                                    <th scope="row">${relatoriobo["0"]}</th>
                                                    <td>${relatoriobo["1"]}</td>
                                                    <td>${relatoriobo["2"]}</td>
                                                    <td>${relatoriobo["3"]}</td>
                                                    <td>${relatoriobo["4"]}</td>
                                                    <td>R$${relatoriobo["5"]}</td>
                                                    <td>
                                                        <form action="${pageContext.request.contextPath}/Relatorio_Qtd_Pedidos_Por_cliente" method="post">
                                                            <button class="btn btn-light" name="consulta" value="${relatoriobo["1"]}"><a target="_blank"><i class="fa fa-eye" aria-hidden="true"></i></a></button>
                                                        </form>
                                                    </td>
                                                </tr>
                                                </tr>
                                            </c:forEach>
                                        </tbody>  
                                    </table>
                                </c:if>     
                            </div>
                        </div>  
                        <c:if test="${ not empty resultado}">
                            <a class="btn btn-light" href="javascript:history.back()">../Voltar</a>
                            <h5 class="display-4">Cliente, <b>${resultado[0][1]}</b></h5>
                              <table class="table table-hover table-dark" id="lista">
                                    <thead>
                                        <tr>
                                            <th>

                                            </th>
                                        </tr>
                                    </thead>
                            <div>

                                <br>
                                <spam id="spaaam">Campo de busca por numero de pedido.</spam>
                                <br>
                                <spam id="spaaam"><i>Procure apenas com letra minuscula.</i></spam>
                                <input class="form-control" id="filtro-nome" placeholder="Numero do Pedido"/>
                            </div>
                            <c:forEach var="resultado" items="${resultado}">

                                <tbody>
                                <td>
                                    <div class="accordion" id="${resultado["0"]}">
                                        <div class="card">
                                            <div class="card-header" id="${resultado["0"]}1">
                                                <h2 class="mb-0">
                                                    <button class="btn btn-block text-left" type="button" data-toggle="collapse" data-target="#${resultado["0"]}2" aria-expanded="false" aria-controls="${resultado["0"]}2">
                                                        <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
                                                        <fmt:formatDate pattern="dd/MM/yyyy" value="${resultado[9]}" var="dataFormatada" /> 
                                                        Pedido: ${resultado["0"]}, Previsão de entrega: ${dataFormatada};
                                                    </button>
                                                </h2>
                                            </div>

                                            <div id="${resultado["0"]}2" class="collapse show" aria-labelledby="${resultado["0"]}1" data-parent="#${resultado["0"]}">
                                                <div class="card-body">
                                                    <div class="jumbotron container">
                                                        <p><b>Cod. Encomenda: ${resultado["0"]}</b></p>
                                                        <p><b>Status: ${resultado["3"]}</b></p>
                                                        <div class="progress">
                                                            <div class="progress-bar ${resultado["5"]}" role="progressbar" style="width: ${resultado["4"]}%;" aria-valuenow="${resultado["4"]}" aria-valuemin="0" aria-valuemax="100">${resultado["4"]}%</div>
                                                        </div>
                                                        <br>
                                                        <div class="card bg-secondary text-white">
                                                            <div class="card-body">
                                                                <h5 class="card-title">O que foi encomendado? <b>${resultado["6"]}</b></h5>
                                                                <p class="card-text"> Observação: <b>${resultado["8"]}</b></p>

                                                                <p class="card-text">Previsão de entrega: <b>${dataFormatada}</b></p>
                                                                <p class="card-text">Entrega em domicílio? <b>${resultado["10"]}</b></p>

                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>                                                                   
                                    </div>
                                </td>
                                </tbody>

                            </c:forEach>
  </table>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>

        <!-- <script src="gestao/menu/js/jquery.min.js"></script> -->
        <jsp:include page="../menu/imports/fim.jsp"/>
    </body>
</html>