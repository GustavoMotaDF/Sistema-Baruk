<%-- 
    Document   : encomendas
    Created on : 11/05/2021, 20:49:50
    Author     : suporte
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Encomendas</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

    </head>
    <body>
        <h1>Teste Cad Encomenda</h1>
        <div class=" container form-group ">

            <h2> ${mensagemErro}
                ${mensagemSucesso}</h2>

            <form action="${pageContext.request.contextPath}/Encomenda"  method="post">
                <c:if test="${ empty encomendaEditando}"> 
                    Nome: 
                    <input type="text" name="cliente" class="form-control" required placeholder="Cliente"/>
                    <br>
                    Telefone: 
                    <input type="text" name="telefone" class="form-control" required placeholder="Telefone"/>
                    <br>
                    Endereço:
                    <input type="text" name="endereco" class="form-control" required placeholder="Endereço"/>
                    <br>
                    <div class="row">
                        <div class="col-md-6">
                            Entrega? :
                            <select class="form-control" name="entrega">
                                <option value=" ">Selecione ...</option>
                                <option value="Sim">Sim</option>
                                <option value="Nao">Não</option>
                            </select>
                            <br>
                        </div>
                        <div class="col-md-6">
                            Status:
                            <select class="form-control" name="status">
                                <option value=" ">Selecione ...</option>
                                <option value="Encomenda solicitada">Encomenda solicitada</option>
                                <option value="Em producao">Em produção</option>
                                <option value="Entregue">Entregue</option>            
                                <option value="Cancelada">Cancelada</option>
                            </select>
                        </div>
                    </div>
                    <br>
                    <select class="form-control" name="idproduto">
                        <option value=" ">Selecione ...</option>
                        <c:forEach var="produtos" items="${produtos}">                             
                            <option value="${produtos.idproduto}">${produtos.produto}</option>
                        </c:forEach>
                    </select>
                    <br>
                    <div class="row">
                        <div class="col-md-6">
                            <input type="submit" name="cadastrar" class="form-control btn btn-success" value="Cadastrar"/>
                        </div>

                        <div class="col-md-6">
                            <input type="reset" name="" class="form-control btn btn-danger" value="Cancelar"/>
                        </div>
                    </div>
                </c:if>  
                <c:if test="${ not empty encomendaEditando}">
                    <input type="hidden" name="idencomenda" value="${encomendaEditando.idencomenda}"/>
                    Nome: 
                    <input type="text" name="cliente"  value="${encomendaEditando.cliente}" class="form-control" required placeholder="Cliente"/>
                    <br>
                    Telefone: 
                    <input type="text" name="telefone" value="${encomendaEditando.telefone}" class="form-control" required placeholder="Telefone"/>
                    <br>
                    Endereço:
                    <input type="text" name="endereco" value="${encomendaEditando.endereco}" class="form-control" required placeholder="Endereço"/>
                    <br>
                    <div class="row">
                        <div class="col-md-6">
                            Entrega? :
                            <select class="form-control" name="entrega">
                                <option value="${encomendaEditando.entrega}">${encomendaEditando.entrega}</option>
                                <option value="Sim">Selecione ...</option>
                                <option value="Sim">Sim</option>
                                <option value="Nao">Não</option>
                            </select>
                            <br>
                        </div>
                        <div class="col-md-6">
                            Status:
                            <select class="form-control" name="status">
                                <option value="${encomendaEditando.status}">${encomendaEditando.status}</option>
                                <option value=" ">Selecione ...</option>
                                <option value="Encomenda solicitada">Encomenda solicitada</option>
                                <option value="Em producao">Em produção</option>
                                <option value="Entregue">Entregue</option>            
                                <option value="Cancelada">Cancelada</option>
                            </select>
                        </div>
                    </div>
                    <br>
                    Produto: 
                    <select class="form-control" name="idproduto">
                        <option value="${encomendaEditando.produto.idproduto}">${encomendaEditando.produto.produto}</option>
                        <option value=" ">Selecione ...</option>
                        <c:forEach var="produtos" items="${produtos}">                             
                            <option value="${produtos.idproduto}">${produtos.produto}</option>
                        </c:forEach>
                    </select>
                    
                    
                    <br>
                    <div class="row">
                        <div class="col-md-6">
                            <input type="submit" name="cadastrar" class="form-control btn btn-success" value="Cadastrar"/>
                        </div>

                        <div class="col-md-6">
                            <a href="${pageContext.request.contextPath}/Encomenda" class="form-control btn btn-warning">Cancelar</a><br>
                        </div>
                    </div>                    
                </c:if> 
            </form>

            <div class="container">
                <form action="${pageContext.request.contextPath}/Encomenda" method="post">
                    <table class="table table-hover table-sm">
                        <tr>
                            <th>Cod. Encomenda</th>
                            <th>Cliente</th>
                            <th>Telefone</th>
                            <th>Endereço</th>
                            <th>Entrega</th>                         
                            <th>Status</th>  
                            <th>Produto></th>

                        </tr>
                        <c:forEach var="encomendas" items="${encomendas}">
                            <tr>
                                <td>${encomendas.idencomenda}</td>
                                <td>${encomendas.cliente}</td>
                                <td>${encomendas.telefone}</td>                                  
                                <td>${encomendas.endereco}</td>
                                <td>${encomendas.entrega}</td>
                                <td>${encomendas.status}</td>
                                <td>${encomendas.produto.produto}</td>
                                <td><input type="radio" name="idencomenda" value="${encomendas.idencomenda}"/></td>                            
                            </tr>
                        </c:forEach>
                    </table>
                    <input class="btn btn-info " type="submit" name="editar" value="editar"/>
                </form>   


            </div> 

        </div>              

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>    </body>
</html>
