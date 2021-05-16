<%-- 
    Document   : encomedas
    Created on : 15/05/2021, 02:24:09
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
        <link href="gestao/menu/css/select2.css" rel="stylesheet" >
        <script src="gestao/menu/js/jquery-3.3.1.slim.min.js"></script>

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
                                <small id="emailHelp" class="form-text text-muted">Todos os campos são obrigatórios!</small>
                                Cliente: <br>
                                <select class="form-control procc" required name="idcliente" >
                                    <option value=null>Selecione ...</option>
                                    <c:forEach var="clientes" items="${clientes}">                             
                                        <option value="${clientes.idcliente}">${clientes.nome}</option>
                                    </c:forEach>
                                </select>
                                <br>
                                <br>
                                <div class="row">
                                    <div class="col-md-6">
                                        Entrega? :
                                        <select class="form-control procc" required name="entrega">
                                            <option value=" ">Selecione ...</option>
                                            <option value="Sim">Sim</option>
                                            <option value="Nao">Não</option>
                                        </select>
                                        <br>
                                        <br>
                                    </div>
                                    <div class="col-md-6">
                                        Status:
                                        <select class="form-control procc" required name="status">
                                            <option value=" ">Selecione ...</option>
                                            <c:forEach var="status" items="${status}">                             
                                                <option value="${status.idstatus}">${status.nstatus}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                Produto:
                                <select class="form-control procc" required name="idproduto">
                                    <option value=" ">Selecione ...</option>
                                    <c:forEach var="produtos" items="${produtos}">                             
                                        <option value="${produtos.idproduto}">${produtos.produto}</option>
                                    </c:forEach>
                                </select>
                                <br>
                                <br>

                                Data previsão da entrega:
                                <input type="date" name="data_previsao" required class="form-control" required />
                                <br>
                                Observação:
                                <br>
                                <textarea name="observacao" required class="form-control" ></textarea>                    

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
                                <select class="form-control procc" required name="idcliente">
                                    <option value="${encomendaEditando.cliente.idcliente}">${encomendaEditando.cliente.nome}</option>
                                    <option value=" ">Selecione ...</option>

                                    <c:forEach var="clientes" items="${clientes}">                             
                                        <option value="${clientes.idcliente}">${clientes.nome}</option>
                                    </c:forEach>
                                </select>
                                <br>
                                <br>
                                <div class="row">
                                    <div class="col-md-6">
                                        Entrega? :
                                        <select class="form-control procc " required name="entrega">

                                            <option value="${encomendaEditando.entrega}">${encomendaEditando.entrega}</option>
                                            <option value=" ">Selecione ...</option>
                                            <option value="Sim">Sim</option>
                                            <option value="Nao">Não</option>
                                        </select>
                                        <br>

                                    </div>
                                    <div class="col-md-6">
                                        Status:
                                        <select class=" form-control procc" name="status">
                                            <option value="${encomendaEditando.status.idstatus}">${encomendaEditando.status.nstatus}</option>
                                            <option value=" ">Selecione ...</option>
                                            <c:forEach var="status" items="${status}">                             
                                                <option value="${status.idstatus}">${status.nstatus}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <br>
                                Produto:
                                <select class="form-control procc" name="idproduto">
                                    <option value="${encomendaEditando.produto.idproduto}">${encomendaEditando.produto.produto}</option>
                                    <option value=" ">Selecione ...</option>
                                    <c:forEach var="produtos" items="${produtos}">                             
                                        <option value="${produtos.idproduto}">${produtos.produto}</option>
                                    </c:forEach>
                                </select>
                                <br>
                                <br>

                                Data previsão da entrega:
                                <input type="date" name="data_previsao" value="${encomendaEditando.data_previsao}" class="form-control" required />
                                <br>
                                Observação:
                                <br>
                                <textarea name="observacao" required class="form-control" >${encomendaEditando.observacao}</textarea>                    

                                <br>
                                <div class="row">
                                    <div class="col-md-6">
                                        <input type="submit" name="alterar" class="form-control btn btn-success" value="Alterar"/>
                                    </div>

                                    <div class="col-md-6">
                                        <a href="${pageContext.request.contextPath}/Encomenda" class="form-control btn btn-warning">Cancelar</a><br>
                                    </div>
                                </div>                    
                            </c:if>
                        </form>

                        <br>
                        <br>

                        <div class="row">
                            <div class="col-3">
                                <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                                    <a class="nav-link active" id="solicitada-tab" data-toggle="pill" href="#solicitada" role="tab" aria-controls="solicitada" aria-selected="false">Status: Solicitada</a>
                                    <a class="nav-link" id="emproducao-tab" data-toggle="pill" href="#emproducao" role="tab" aria-controls="emproducao" aria-selected="true">Status: Em produção</a>
                                    <a class="nav-link" id="final-tab" data-toggle="pill" href="#final" role="tab" aria-controls="final" aria-selected="false">Status: Fase Final</a>
                                    <a class="nav-link" id="finalizada-tab" data-toggle="pill" href="#finalizada" role="tab" aria-controls="finalizada" aria-selected="false">Status: Finalizada</a>
                                    <a class="nav-link" id="entregue-tab" data-toggle="pill" href="#entregue" role="tab" aria-controls="entregue" aria-selected="false">Status: Entregue</a>
                                    <a class="nav-link" id="cancelada-tab" data-toggle="pill" href="#cancelada" role="tab" aria-controls="cancelada" aria-selected="false">Status: Cancelada</a>
                                </div>
                            </div>
                            <div class="col-9">
                                <div class="tab-content" id="v-pills-tabContent">
                                    <div class="tab-pane fade active" id="solicitada" role="tabpanel" aria-labelledby="solicitada-tab">
                                        <jsp:include page="statusencomenda/solicitada.jsp"/>
                                    </div>
                                    <div class="tab-pane fade show " id="emproducao" role="tabpanel" aria-labelledby="emproducao-tab">
                                        <jsp:include page="statusencomenda/producao.jsp"/>
                                    </div>
                                    <div class="tab-pane fade" id="final" role="tabpanel" aria-labelledby="final-tab">
                                        <jsp:include page="statusencomenda/fasefinal.jsp"/>
                                    </div>
                                    <div class="tab-pane fade" id="finalizada" role="tabpanel" aria-labelledby="finalizada-tab">
                                        <jsp:include page="statusencomenda/finalizada.jsp"/>
                                    </div>
                                    <div class="tab-pane fade" id="entregue" role="tabpanel" aria-labelledby="entregue-tab">
                                        <jsp:include page="statusencomenda/entregue.jsp"/>
                                    </div>
                                    <div class="tab-pane fade" id="cancelada" role="tabpanel" aria-labelledby="cancelada-tab">
                                        <jsp:include page="statusencomenda/cancelada.jsp"/>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div> 

                </div>


            </div>
        </div>
        <script>
            $(document).ready(function () {
                $('.procc').select2();

            });
        </script>

        <script src="gestao/menu/js/select2.js"></script>

        <script src="gestao/menu/js/popper.js"></script>
        <script src="gestao/menu/js/bootstrap.min.js"></script>
        <script src="gestao/menu/js/main.js"></script>
    </body>
</html>