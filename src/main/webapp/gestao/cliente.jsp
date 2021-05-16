<%--
    Document   : cliente
    Created on : 15/05/2021, 02:28:18
    Author     : alephtav
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
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
                    <div class=" form-group ">
                        <h4> ${mensagemErro}
                            ${mensagemSucesso}</h4>


                        <!-- Button trigger modal -->
                        <button type="button" class="btn btn-primary form-control" data-toggle="modal" data-target="#exampleModalLong">
                            <i class="fa fa-plus" aria-hidden="true"></i>
                        </button>

                        <!-- Modal -->
                        <div class="modal fade bd-example-modal-lg" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
                            <div class="modal-dialog modal-lg" role="document">
                                <div class="modal-content container">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLongTitle">Novo Cliente</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <form action="${pageContext.request.contextPath}/Cliente"  method="post">
                                        <div class="modal-body container">

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
                                        </div>

                                        <div class="row">
                                            <div class="col-md-6">
                                                <input type="submit" name="cadastrar" class="form-control btn btn-success" value="Cadastrar"/>
                                            </div>

                                            <div class="col-md-6">
                                                <input type="reset" class="form-control btn btn-danger" value="Limpar"/>
                                            </div>

                                        </div>
                                    </form>
                                    <br>
                                </div>
                            </div>
                        </div>

                        <br>
                        <br>
                        <br>
                        <form action="${pageContext.request.contextPath}/Cliente"  method="post">
                            <c:if test="${ empty clienteEditando}">

                                <c:forEach var="clientes" items="${clientes}">
                                    <ul class="list-group">                                        
                                        <li class="list-group-item">
                                            <button type="button" class="btn btn-secundary form-control" data-toggle="modal" data-target="#a${clientes.cpf}">${clientes.nome}</button>
                                        </li>                                        
                                    </ul>
                                    <!-- Large modal -->
                                    <br>

                                    <div class="modal fade bd-example-modal-lg" id="a${clientes.cpf}" tabindex="-1" role="dialog" aria-labelledby="#a${clientes.cpf}" aria-hidden="true">
                                        <div class="modal-dialog modal-lg">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="a${clientes.cpf}">${clientes.nome}</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <table class="table table-hover table-sm">
                                                    <tr>
                                                        <th>Nome</th>
                                                        <th>Telefone</th>
                                                        <th>CPF</th>
                                                        <th>Endereço</th>
                                                    </tr>
                                                    <tr>
                                                        <td>${clientes.nome}</td>
                                                        <td>${clientes.telefone}</td>
                                                        <td>${clientes.cpf}</td>
                                                        <td>${clientes.endereco}</td>
                                                        <td><input type="radio"  name="idcliente" required value="${clientes.idcliente}"/></td>
                                                    </tr>
                                                </table>
                                                <input class="btn btn-info" type="submit" name="editar" value="editar"/>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>

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
