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
        <title>Produto</title>
        <jsp:include page="menu/imports/head.jsp"/>
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

                        <h5> ${mensagemErro}
                            ${mensagemSucesso}</h5>

                        <!-- Button trigger modal -->
                        <div class="row">
                            <div class="col-md-5">
                                <button type="button" class="btn btn-primary form-control" data-toggle="modal" data-target="#exampleModalLong">
                                    <i class="fa fa-plus" aria-hidden="true"></i>
                                </button>
                            </div>
                            <div class="col-md-2"></div>
                            <div class="col-md-5">
                                <button type="button" class="btn btn-secondary form-control" data-toggle="modal" data-target="#exampleModalLong1">
                                    Arquivados
                                </button>
                            </div>
                        </div>

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
                                        <input type="text" name="produto" class="form-control" maxlength="100" required placeholder="Produto:"/>
                                        <br>
                                        Descricao:
                                        <input type="text" name="descricao" class="form-control" required placeholder="Descricao"/>
                                        <br>
                                        <div class="row">
                                            <div class="col-md-6">
                                                Valor:
                                                <div class="col-auto">                                                    
                                                    <div class="input-group mb-2">
                                                        <div class="input-group-prepend">
                                                            <div class="input-group-text">R$</div>                                                            
                                                            <input type="text" name="valor" class="valores form-control" maxlength="9" required placeholder="Valor"/>
                                                        </div>
                                                    </div>
                                                </div>


                                            </div>
                                            <div class="col-md-6">
                                                Tempo de produção:
                                                <div class="col-auto">                                                    
                                                    <div class="input-group mb-2">
                                                        <div class="input-group-prepend">
                                                            <input type="text" name="tproducao" class="form-control" required placeholder=" Tempo de producao" maxlength="3"/>
                                                            <div class="input-group-text">Dias</div>
                                                        </div>
                                                    </div>
                                                </div>
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
                        <div class="modal fade bd-example-modal-lg" id="exampleModalLong1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle1" aria-hidden="true">
                            <div class="modal-dialog modal-lg" role="document">
                                <div class="modal-content container">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLongTitle1">Arquivados</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <form action="${pageContext.request.contextPath}/Produto"  method="post">
                                        <table class="table table-hover table-sm">
                                            <tr>
                                                <th>Produto</th>
                                                <th>Descricao</th>
                                                <th>Valor</th>
                                                <th>Tempo de produção</th>                         
                                            </tr>
                                            <c:forEach var="produtosarq" items="${produtosarq}">
                                                <tr>
                                                    <td>${produtosarq.produto}</td>
                                                    <td>${produtosarq.descricao}</td>
                                                    <td>${produtosarq.valor}</td>
                                                    <td>${produtosarq.tproducao}</td>
                                                    <td><input type="hidden" name="idproduto" value="${produtosarq.idproduto}"/></td> 
                                                    <td><input class="btn btn-info" type="submit" name="ativar" value="Ativar"/></td>
                                                </tr>
                                            </c:forEach>
                                        </table>
                                    </form>

                                    <br>
                                </div>
                            </div>
                        </div>

                        <form action="${pageContext.request.contextPath}/Produto"  method="post">
                            <c:if test="${ empty produtoEditando}">
                                <div class="row">
                                    <c:forEach var="produtos" items="${produtos}">

                                        <div class="modal fade bd-example-modal-lg" id="a${produtos.idproduto}" tabindex="-1" role="dialog" aria-labelledby="#a${produtos.idproduto}" aria-hidden="true">
                                            <div class="modal-dialog modal-lg">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="a${produtos.idproduto}">${produtos.produto}</h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <form action="${pageContext.request.contextPath}/Produto"  method="post">
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
                                                                <td> <input type="hidden" name="idproduto" value="${produtos.idproduto}"/> </td>                    
                                                            </tr>

                                                        </table>
                                                        <div class="container row">
                                                            <div class="col-md-5"><input class="btn btn-info form-control" type="submit" name="editar" value="Editar"/></div>
                                                            <div class="col-md-2"></div>
                                                            <div class="col-md-5"><input class="btn btn-warning form-control" type="submit" name="excluir" value="Arquivar"/></div>
                                                        </div>
                                                        <br>
                                                    </form>

                                                </div>
                                            </div>
                                        </div>



                                        <div class="col-md-4">
                                            <div class="card border-primary">
                                                <div class="card-body ">
                                                    <h5 class="card-title">${produtos.produto}</h5>
                                                    <h6 class="card-subtitle mb-2 text-muted">R$${produtos.valor}</h6>
                                                    <p class="card-text">${produtos.descricao}</p>
                                                    <p class="card-text">${produtos.tproducao} Dias de produção.</p>
                                                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#a${produtos.idproduto}"><i class="fa fa-cog" aria-hidden="true"></i></button>
                                                </div>
                                            </div>
                                        </div>

                                    </c:forEach>
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
                                        <div class="col-auto">                                                    
                                            <div class="input-group mb-2">
                                                <div class="input-group-prepend">
                                                    <div class="input-group-text">R$</div>
                                                    <input type="text" name="valor" class="valores form-control" value="${produtoEditando.valor}" maxlength="9" required placeholder="Valor"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        Tempo de produção:
                                        <div class="col-auto">                                                    
                                            <div class="input-group mb-2">
                                                <div class="input-group-prepend">
                                                    <input type="text" name="tproducao" class="form-control" value="${produtoEditando.tproducao}" required placeholder=" Tempo de producao" maxlength="3"/>
                                                    <div class="input-group-text">Dias</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <br>
                                <div class="row">
                                    <div class="col-md-6">
                                        <input type="submit" name="alterar" class="form-control btn btn-success" value="Alterar"/>
                                    </div>

                                    <div class="col-md-6">
                                        <a href="${pageContext.request.contextPath}/Produto" class="form-control btn btn-warning">Cancelar</a><br>
                                    </div>
                                </div>                 

                            </c:if>  
                        </form>

                    </div>
                </div>
            </div>
        </div>

        <!-- <script src="gestao/menu/js/jquery.min.js"></script> -->
        <jsp:include page="menu/imports/fim.jsp"/>

    </body>
</html>
