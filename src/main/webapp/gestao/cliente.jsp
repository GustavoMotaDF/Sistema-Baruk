<%-- 
    Document   : cliente
    Created on : 15/05/2021, 02:28:18
    Author     : alephtav
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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

                <div class="container">
                    <div class="container form-group ">
                        <h2> ${mensagemErro}
                            ${mensagemSucesso}</h2>
                        <form action="${pageContext.request.contextPath}/Cliente"  method="post">
                            <c:if test="${ empty clienteEditando}">
                                Nome:
                                <input type="text" name="nome" class="form-control" required placeholder="Nome"/>
                                <br>

                                <div class="row">
                                    <div class="col-md-6">
                                        Telefone:
                                        <input type="text" name="telefone" class="form-control" required placeholder="Telefone"/>
                                    </div>
                                    <div class="col-md-6">
                                        CPF:
                                        <input type="text" name="cpf" class="form-control" required placeholder=" CPF"/>
                                    </div>
                                </div>
                                <br>
                                Encereço:
                                <input type="text" name="endereco" class="form-control"  placeholder="Encereço"/>
                                <br>

                                <div class="row">
                                    <div class="col-md-6">
                                        <input type="submit" name="cadastrar" class="form-control btn btn-success" value="Cadastrar"/>
                                    </div>

                                    <div class="col-md-6">
                                        <input type="reset" class="form-control btn btn-danger" value="Limpar"/>                       
                                    </div>

                                </div>

                            </c:if>
                            <c:if test="${ not empty clienteEditando}">
                                <input type="hidden" name="idcliente" value="${clienteEditando.idcliente}"/>
                                Nome:
                                <input type="text" name="nome" value="${clienteEditando.nome}" class="form-control" required placeholder="Nome"/>
                                <br>

                                <div class="row">
                                    <div class="col-md-6">
                                        Telefone:
                                        <input type="text" name="telefone" value="${clienteEditando.telefone}" class="form-control" required placeholder="Telefone"/>
                                    </div>
                                    <div class="col-md-6">
                                        CPF:
                                        <input type="text" name="cpf" value="${clienteEditando.cpf}" class="form-control" required placeholder=" CPF"/>
                                    </div>
                                </div>
                                <br>
                                Encereço:
                                <input type="text" name="endereco" value="${clienteEditando.endereco}" class="form-control"  placeholder="Encereço"/>
                                <br>
                                <div class="row">
                                    <div class="col-md-6">
                                        <input type="submit" name="alterar" class="form-control btn btn-success" value="alterar"/>
                                    </div>

                                    <div class="col-md-6">
                                        <a href="${pageContext.request.contextPath}/Cliente" class="form-control btn btn-warning">Cancelar</a>
                                    </div>
                                </div>
                            </c:if>
                        </form>


                        <div class="container">
                            <form action="${pageContext.request.contextPath}/Cliente" method="post">
                                <table class="table table-hover table-sm">
                                    <tr>
                                        <th>Nome</th>
                                        <th>Telefone</th>
                                        <th>CPF</th>
                                        <th>Endereço</th>
                                    </tr>
                                    <c:forEach var="clientes" items="${clientes}">
                                        <tr>

                                            <td>${clientes.nome}</td>
                                            <td>${clientes.telefone}</td>
                                            <td>${clientes.cpf}</td>
                                            <td>${clientes.endereco}</td>
                                            <td><input type="radio" name="idcliente" value="${clientes.idcliente}"/></td>
                                        </tr>
                                    </c:forEach>
                                </table>
                                <input class="btn btn-info " type="submit" name="editar" value="editar"/>
                            </form>


                        </div>
                    </div>
                </div>


            </div>
        </div>

        <script src="gestao/menu/js/jquery.min.js"></script>
        <script src="gestao/menu/js/popper.js"></script>
        <script src="gestao/menu/js/bootstrap.min.js"></script>
        <script src="gestao/menu/js/main.js"></script>
    </body>
</html>
