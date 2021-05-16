<%-- 
    Document   : solicitada
    Created on : 16/05/2021, 18:56:24
    Author     : suporte
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
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
            <c:forEach var="solicitada" items="${solicitada}">
                <tr>
                    <td>${solicitada.idencomenda}</td>
                    <td>${solicitada.cliente.nome}</td>
                    <td>${solicitada.entrega}</td>                                  
                    <td>${solicitada.status.nstatus}</td>                                  
                    <td>${solicitada.produto.produto}</td>
                    <td>${solicitada.data_previsao}</td>
                    <td>${solicitada.observacao}</td>
                    <td><input type="radio" name="idencomenda" value="${solicitada.idencomenda}"/></td>                            
                </tr>
            </c:forEach>
        </table>
        <input class="btn btn-info " type="submit" name="editar" value="editar"/>
    </form>   
</div> 
