<%-- 
    Document   : cancelada
    Created on : 16/05/2021, 18:57:16
    Author     : suporte
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
  
<div class="container">
    <h2> ${mensagemErrocancelada}
                            </h2>
    <form action="${pageContext.request.contextPath}/Encomenda" method="post">
        <table class="table table-hover table-sm">
            <tr>
                <th>Cod. Encomenda</th>
                <th>clientes</th>
                <th>data_previsao</th>  

            </tr>
            <c:forEach var="cancelada" items="${cancelada}">
                <tr>
                    <td>${cancelada.idpesquisa}</td>
                    <td>${cancelada.cliente.nome}</td>
                    <td>${cancelada.data_previsao}</td>
                    <td><input type="radio" name="idencomenda" value="${cancelada.idencomenda}"/></td>                            
                </tr>
            </c:forEach>
        </table>
        <input class="btn btn-info " type="submit" name="editar" value="editar"/>
    </form>   
</div> 
