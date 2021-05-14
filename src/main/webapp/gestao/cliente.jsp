<%--
    Document   : cliente
    Created on : 14/05/2021, 02:20:45
    Author     : alephtav
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Clientes</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
        <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
        <meta http-equiv="Pragma" content="no-cache">
        <meta http-equiv="Expires" content="0">
    </head>
    <body>
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
        </div>

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

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
    </body>
</html>