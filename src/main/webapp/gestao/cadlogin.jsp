<%-- 
    Document   : cadlogin
    Created on : 26/05/2021, 01:43:10
    Author     : alephtav
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<!DOCTYPE html>
<!doctype html>
<html lang="en">
    <head>
        <title>Login</title>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>

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

                <h2 class="mb-4">Logins</h2>
                <!-- CONTEUDO DE FATO-->

                <div class="container ">

                    <div class="container form-group ">

                        <h5> ${mensagemErro}
                            ${mensagemSucesso}</h5>

                        <!-- Button trigger modal -->
                        <button type="button" class="btn btn-primary form-control" data-toggle="modal" data-target="#exampleModalLong">
                            <i class="fa fa-plus" aria-hidden="true"></i>
                        </button>
                        <div class="modal fade bd-example-modal-lg" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
                            <div class="modal-dialog modal-lg" role="document">
                                <div class="modal-content container">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLongTitle">Novo Login</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <form action="${pageContext.request.contextPath}/Logins"  method="post">
                                        Login: 
                                        <input  class="form-control" type="text" name="username" onkeyup="cpfCheck(this)" maxlength="14" onkeydown="javascript: fMasc(this, mCPF);"> <span id="cpfResponse"></span>
                                        <br>
                                        <script>
                                            function show() {
                                                var senha = document.getElementById("senha");
                                                if (senha.type === "password") {
                                                    senha.type = "text";
                                                } else {
                                                    senha.type = "password";
                                                }
                                            }
                                        </script>
                                        Senha:

                                        <div class="input-group">
                                            <div class="col-auto">                                                    
                                                <div class="input-group mb-2">
                                                    <div class="input-group-prepend">
                                                        <input type="password" name="senha" id="senha" placeholder="senha" class="form-control"/>
                                                        <div class="input-group-text"><i class="fa fa-eye" aria-hidden="true" onclick="show()"></i>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                        <br>
                                        Nome:
                                        <input type="text" name="nome" class="form-control" required placeholder="Nome"/>
                                        <br>                                        
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


                        <form action="${pageContext.request.contextPath}/Logins"  method="post">
                            <c:if test="${ empty loginEditando}">
                                <c:forEach var="login" items="${login}">
                                    <ul class="list-group">                                        
                                        <li class="list-group-item">
                                            <button type="button" class="btn btn-secundary form-control" data-toggle="modal" data-target="#baruk${login.idlogin}">${login.nome}</button>
                                        </li>                                        
                                    </ul>


                                    <div class="modal fade bd-example-modal-lg" id="baruk${login.idlogin}" tabindex="-1" role="dialog" aria-labelledby="#baruk${login.idlogin}" aria-hidden="true">
                                        <div class="modal-dialog modal-lg">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="baruk${login.idlogin}">${login.nome}</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <table class="table table-hover table-sm">
                                                    <tr>
                                                        <th>Nome</th>
                                                        <th>Login</th>
                                                        <th>Senha</th>
                                                    </tr>

                                                    <tr>
                                                        <td>${login.nome}</td>
                                                        <td>${login.cpf}</td>
                                                        <td>${login.senha}</td>
                                                        <td><input type="radio" name="idlogin" required value="${login.idlogin}"/></td>                            
                                                    </tr>

                                                </table>
                                                <input class="btn btn-info" type="submit" name="editar" value="editar"/>
                                            </div>
                                        </div>
                                    </div>



                                </c:forEach>
                            </c:if> 
                            <c:if test="${ not empty loginEditando}">
                                <input type="hidden" name="idlogin" value="${loginEditando.idlogin}"/>
                                Login: 
                                <input  class="form-control" type="text" value="${loginEditando.cpf}" name="username" onkeyup="cpfCheck(this)" maxlength="14" onkeydown="javascript: fMasc(this, mCPF);"> <span id="cpfResponse"></span>
                                <br>
                                Senha:
                                 <script>
                                            function show1() {
                                                var senha = document.getElementById("senha2");
                                                if (senha.type === "password") {
                                                    senha.type = "text";
                                                } else {
                                                    senha.type = "password";
                                                }
                                            }
                                        </script>
                                <div class="input-group">
                                            <div class="col-auto">                                                    
                                                <div class="input-group mb-2">
                                                    <div class="input-group-prepend">
                                                        <input type="password" name="senha" value="${loginEditando.senha}" id="senha2" placeholder="senha" class="form-control"/>
                                                        <div class="input-group-text"><i class="fa fa-eye" aria-hidden="true" onclick="show1()"></i>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                <br>
                                Nome:
                                <input type="text" name="nome" value="${loginEditando.nome}" class="form-control" required placeholder="Nome"/>
                                <br>                                        
                                <br>

                                <div class="row">
                                    <div class="col-md-6">
                                        <input type="submit" name="alterar" class="form-control btn btn-success" value="Alterar"/>
                                    </div>

                                    <div class="col-md-6">
                                        <a href="${pageContext.request.contextPath}/Logins" class="form-control btn btn-warning">Cancelar</a><br>
                                    </div>
                                </div>                 

                            </c:if>  
                        </form>

                    </div> 
                </div>
            </div>
        </div>
    </div>

    <!-- <script src="gestao/menu/js/jquery.min.js"></script> -->
    <jsp:include page="menu/imports/fim.jsp"/>

</body>
</html>
