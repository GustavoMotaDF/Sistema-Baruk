<%--
    Document   : produto
    Created on : 13/05/2021, 19:22:23
    Author     : suporte
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Produtos</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
        <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
        <meta http-equiv="Pragma" content="no-cache">
        <meta http-equiv="Expires" content="0">
    </head>
    <body>
        <h1>Teste Cad Produto</h1>
        <div class="container form-group ">

            <h2> ${mensagemErro}
                ${mensagemSucesso}</h2>
            <form action="${pageContext.request.contextPath}/Produto"  method="post">
                <c:if test="${ empty produtoEditando}">  
                    Produto: 
                    <input type="text" name="produto" class="form-control" required placeholder="Produto:"/>
                    <br>
                    Descricao:
                    <input type="text" name="descricao" class="form-control" required placeholder="Descricao"/>
                    <br>
                    <div class="row">
                        <div class="col-md-6">
                            Valor:
                            <input type="text" name="valor" class="form-control" required placeholder="Valor"/>
                        </div>
                        <div class="col-md-6">
                            Tempo de produção:
                            <input type="text" name="tproducao" class="form-control" required placeholder=" Tempo de producao"/>
                        </div>
                    </div>
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
                <c:if test="${ not empty produtoEditando}">
                    <input type="hidden" name="idproduto" value="${produtoEditando.idproduto}"/>
                    Produto: 
                    <input type="text" name="produto" class="form-control" value="${produtoEditando.produto}" required placeholder="Produto:"/>
                    <br>
                    Descricao:
                    <input type="text" name="descricao" class="form-control" value="${produtoEditando.descricao}"required placeholder="Descricao"/>
                    <br>
                    <div class="row">
                        <div class="col-md-6">
                            Valor:
                            <input type="text" name="valor" class="form-control" value="${produtoEditando.valor}" required placeholder="Valor"/>
                        </div>
                        <div class="col-md-6">
                            Tempo de produção:
                            <input type="text" name="tproducao" class="form-control" value="${produtoEditando.tproducao}" required placeholder=" Tempo de producao"/>
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-md-6">
                            <input type="submit" name="cadastrar" class="form-control btn btn-success" value="Cadastrar"/>
                        </div>

                        <div class="col-md-6">
                            <a href="${pageContext.request.contextPath}/Produto" class="form-control btn btn-warning">Cancelar</a><br>
                        </div>
                    </div>                 

                </c:if>  
            </form>
            <div class="container">
                <form action="${pageContext.request.contextPath}/Produto" method="post">
                    <table class="table table-hover table-sm">
                        <tr>
                            <th>Produto</th>
                            <th>Descricao</th>
                            <th>Valor</th>
                            <th>Tempo de produção</th>                         
                        </tr>
                        <c:forEach var="produtos" items="${produtos}">
                            <tr>

                                <td>${produtos.produto}</td>
                                <td>${produtos.descricao}</td>
                                <td>${produtos.valor}</td>
                                <td>${produtos.tproducao}</td>
                                <td><input type="radio" name="idproduto" value="${produtos.idproduto}"/></td>                            
                            </tr>
                        </c:forEach>
                    </table>
                    <input class="btn btn-info " type="submit" name="editar" value="editar"/>
                </form>   


            </div> 

        </div>
    </body>
</html>
