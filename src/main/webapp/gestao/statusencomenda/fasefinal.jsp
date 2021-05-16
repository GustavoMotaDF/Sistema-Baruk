<%-- 
    Document   : fasefinal
    Created on : 16/05/2021, 18:56:39
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
            <c:forEach var="final" items="${final}">
                <tr>
                    <td>${final.idencomenda}</td>
                    <td>${final.cliente.nome}</td>
                    <td>${final.entrega}</td>                                  
                    <td>${final.status.nstatus}</td>                                  
                    <td>${final.produto.produto}</td>
                    <td>${final.data_previsao}</td>
                    <td>${final.observacao}</td>
                    <td><input type="radio" name="idencomenda" value="${final.idencomenda}"/></td>                            
                </tr>
            </c:forEach>
        </table>
        <input class="btn btn-info " type="submit" name="editar" value="editar"/>
    </form>   
</div> 
