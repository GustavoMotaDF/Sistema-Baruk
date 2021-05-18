<%-- 
    Document   : producao
    Created on : 16/05/2021, 18:56:00
    Author     : suporte
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<div class="container">
     <h2> ${mensagemErroproducao}
                           </h2>
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
            <c:forEach var="producao" items="${producao}">
                <tr>
                    <td>${producao.idencomenda}</td>
                    <td>${producao.cliente.nome}</td>
                    <td>${producao.entrega}</td>                                  
                    <td>${producao.status.nstatus}</td>                                  
                    <td>${producao.produto.produto}</td>
                    <td>${producao.data_previsao}</td>
                    <td>${producao.observacao}</td>
                    <td><input type="radio" name="idencomenda" value="${producao.idencomenda}"/></td>                            
                </tr>
            </c:forEach>
        </table>
        <input class="btn btn-info " type="submit" name="editar" value="editar"/>
    </form>   
</div> 
