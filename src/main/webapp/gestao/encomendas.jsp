<%-- 
    Document   : encomedas
    Created on : 15/05/2021, 02:24:09
    Author     : alephtav
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

                    <div class=" container form-group ">

                        <h2> ${mensagemErro}
                            ${mensagemSucesso}</h2>

                        <form action="${pageContext.request.contextPath}/Encomenda"  method="post">
                            <c:if test="${ empty encomendaEditando}"> 
                                Cliente: 
                                <select class="form-control" name="idcliente">
                                    <option value=" ">Selecione ...</option>
                                    <c:forEach var="clientes" items="${clientes}">                             
                                        <option value="${clientes.idcliente}">${clientes.nome}</option>
                                    </c:forEach>
                                </select>
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
                                <select class="form-control" name="idproduto">
                                    <option value=" ">Selecione ...</option>
                                    <c:forEach var="produtos" items="${produtos}">                             
                                        <option value="${produtos.idproduto}">${produtos.produto}</option>
                                    </c:forEach>
                                </select>


                                Data previsão da entrega:
                                <input type="date" name="data_previsao" class="form-control" required />
                                <br>
                                Observação:
                                <br>
                                <textarea name="observacao" class="form-control" ></textarea>                    

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
                                Cliente: 
                                <select class="form-control" name="idcliente">
                                    <option value="${encomendaEditando.cliente.idcliente}">${encomendaEditando.cliente.nome}</option>
                                    <option value=" ">Selecione ...</option>

                                    <c:forEach var="clientes" items="${clientes}">                             
                                        <option value="${clientes.idcliente}">${clientes.nome}</option>
                                    </c:forEach>
                                </select>
                                <br>
                                <div class="row">
                                    <div class="col-md-6">
                                        Entrega? :
                                        <select class="form-control" name="entrega">

                                            <option value="${encomendaEditando.entrega}">${encomendaEditando.entrega}</option>
                                            <option value=" ">Selecione ...</option>
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
                                <select class="form-control" name="idproduto">
                                    <option value="${encomendaEditando.produto.idproduto}">${encomendaEditando.produto.produto}</option>
                                    <option value=" ">Selecione ...</option>
                                    <c:forEach var="produtos" items="${produtos}">                             
                                        <option value="${produtos.idproduto}">${produtos.produto}</option>
                                    </c:forEach>
                                </select>


                                Data previsão da entrega:
                                <input type="date" name="data_previsao" value="${encomendaEditando.data_previsao}" class="form-control" required />
                                <br>
                                Observação:
                                <br>
                                <textarea name="observacao"  class="form-control" >${encomendaEditando.observacao}</textarea>                    

                                <br>
                                <div class="row">
                                    <div class="col-md-6">
                                        <input type="submit" name="alterar" class="form-control btn btn-success" value="Alterar"/>
                                    </div>

                                    <div class="col-md-6">
                                        <a href="${pageContext.request.contextPath}/Encomenda" class="form-control btn btn-warning">Cancelar</a><br>
                                    </div>
                                </div>                    
                            </c:if>> 
                        </form>

                        <div class="container">
                            <form action="${pageContext.request.contextPath}/Encomenda" method="post">
                                <table class="table table-hover table-sm">
                                    <tr>
                                        <th>Cod. Encomenda</th>
                                        <th>clientes</th>
                                        <th>entrega</th>
                                        <th>status</th>
                                        <th>produto</th>                         
                                        <th>data_previsao</th>  
                                        <th>observacao></th>

                                    </tr>
                                    <c:forEach var="encomendas" items="${encomendas}">
                                        <tr>
                                            <td>${encomendas.idencomenda}</td>
                                            <td>${encomendas.cliente.nome}</td>
                                            <td>${encomendas.entrega}</td>                                  
                                            <td>${encomendas.status}</td>                                  
                                            <td>${encomendas.produto.produto}</td>
                                            <td>${encomendas.data_previsao}</td>
                                            <td>${encomendas.observacao}</td>
                                            <td><input type="radio" name="idencomenda" value="${encomendas.idencomenda}"/></td>                            
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