<%-- 
    Document   : produto1
    Created on : 15/05/2021, 02:01:21
    Author     : alephtav
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
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

                <h2 class="mb-4">Produtos</h2>
                <!-- CONTEUDO DE FATO-->

                <div class="container ">

                    <div class="container form-group ">

                        <h2> ${mensagemErro}
                            ${mensagemSucesso}</h2>

                        <!-- Button trigger modal -->
                        <button type="button" class="btn btn-primary form-control" data-toggle="modal" data-target="#exampleModalLong">
                            <i class="fa fa-plus" aria-hidden="true"></i>
                        </button>
                        <div class="modal fade bd-example-modal-lg" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
                            <div class="modal-dialog modal-lg" role="document">
                                <div class="modal-content container">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLongTitle">Novo Produto</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <form action="${pageContext.request.contextPath}/Produto"  method="post">
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
                                    </form>
                                    <br>
                                </div>
                            </div>
                        </div>

                        <br>
                        <br>
                        <br>


                        <form action="${pageContext.request.contextPath}/Produto"  method="post">
                            <c:if test="${ empty produtoEditando}">
                                <c:forEach var="produtos" items="${produtos}">
                                    <ul class="list-group">                                        
                                        <li class="list-group-item">
                                            <button type="button" class="btn btn-secundary form-control" data-toggle="modal" data-target="#a${produtos.idproduto}">${produtos.produto}</button>
                                        </li>                                        
                                    </ul>


                                    <div class="modal fade bd-example-modal-lg" id="a${produtos.idproduto}" tabindex="-1" role="dialog" aria-labelledby="#a${produtos.idproduto}" aria-hidden="true">
                                        <div class="modal-dialog modal-lg">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="a${produtos.idproduto}">${produtos.produto}</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <table class="table table-hover table-sm">
                                                    <tr>
                                                        <th>Produto</th>
                                                        <th>Descricao</th>
                                                        <th>Valor</th>
                                                        <th>Tempo de produção</th>                         
                                                    </tr>

                                                    <tr>

                                                        <td>${produtos.produto}</td>
                                                        <td>${produtos.descricao}</td>
                                                        <td>${produtos.valor}</td>
                                                        <td>${produtos.tproducao}</td>
                                                        <td><input type="radio" name="idproduto" required value="${produtos.idproduto}"/></td>                            
                                                    </tr>

                                                </table>
                                                <input class="btn btn-info" type="submit" name="editar" value="editar"/>
                                            </div>
                                        </div>
                                    </div>



                                </c:forEach>
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
