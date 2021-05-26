<%-- 
    Document   : consulta_encomenda
    Created on : 16/05/2021, 03:51:12
    Author     : alephtav
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<!DOCTYPE html>
<!doctype html>
<html lang="en">
    <head>
        <title>Consulta</title>
        <jsp:include page="menu/imports/head.jsp"/>
    </head>
    <body>

        <div class="wrapper d-flex align-items-stretch">
            <!-- IMPORTAR MENU LATERAL-->
            <jsp:include page="menu/menu-lateral.jsp"/>

            <!-- Page Content  -->
            <div id="content" class="p-4 p-md-5">
                <!-- IMPORTAR MENU P?GINA--> 
                <jsp:include page="menu/menu-pagina.jsp"/>

                <h2 class="mb-4">Sidebar #07</h2>
                <!-- CONTEUDO DE FATO-->
                <c:if test="${ empty resultado}">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-2"></div>
                            <div class="col-md-8">
                                <form action="${pageContext.request.contextPath}/Consulta-Encomenda"  method="post">

                                    <span>O codigo foi informado no momento da solicitação da encomenda</span>
                                    <br>
                                    <span>Ex: BAXXXXXXXXXRUK</span>
                                    <br
                                    <br>
                                    <br>
                                    <br>
                                    <br>
                                    Codigo Encomenda:
                                    <input type="text" name="idpesquisa" class="form-control" required placeholder="Insira o codigo"/>
                                    <br>
                                    <input type="submit" name="consultar" class="form-control btn btn-info" value="Consultar"/>
                                </form>

                            </div>
                            <div class="col-md-2"></div>

                        </div>

                    </div>
                </c:if>
                <c:if test="${ not empty resultado}">


                    <div class="jumbotron container">
                        <h1 class="display-4">Hello, <b>${resultado[0][4]}</b></h1>
                        <p class="lead"> <b>${resultado[0][7]}</b> </p>
                        <hr class="my-4">
                        <p><b>Cod. Encomenda: ${resultado[0][0]}</b></p>
                        <p><b>Status: ${resultado[0][6]}</b></p>
                        <div class="progress">
                            <div class="progress-bar ${resultado[0][8]}" role="progressbar" style="width: ${resultado[0][9]}%;" aria-valuenow="${resultado[0][9]}" aria-valuemin="0" aria-valuemax="100">${resultado[0][9]}%</div>
                        </div>
                        <br>
                        <div class="card bg-secondary text-white">
                            <div class="card-body">
                                <h5 class="card-title">O que foi encomendado? <b>${resultado[0][5]}</b></h5>
                                <p class="card-text"> Observação: <b>${resultado[0][3]}</b></p>
                                <p class="card-text">Previsão de entrega: <b>${resultado[0][2]}</b></p>
                                <p class="card-text">Entrega em domicílio? <b>${resultado[0][1]}</b></p>


                            </div>
                        </div>
                    </div>




                </c:if>


            </div>
        </div>

       <jsp:include page="menu/imports/fim.jsp"/>
        
    </body>
</html>

