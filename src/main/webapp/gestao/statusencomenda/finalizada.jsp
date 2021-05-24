<%-- 
    Document   : finalizada
    Created on : 16/05/2021, 18:56:50
    Author     : suporte
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<div class="container">
      <h2> ${mensagemErrofinalizada}
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
            <c:forEach var="finalizada" items="${finalizada}">
                <tr>
                    <td>${finalizada.idpesquisa}</td>
                    <td>${finalizada.cliente.nome}</td>
                    <td>${finalizada.entrega}</td>                                  
                    <td>${finalizada.status.nstatus}</td>                                  
                    <td>${finalizada.produto.produto}</td>
                    <td>${finalizada.data_previsao}</td>
                    <td>${finalizada.observacao}</td>
                    <td><input type="radio" name="idencomenda" value="${finalizada.idencomenda}"/></td>                            
                </tr>
            </c:forEach>
        </table>
        <input class="btn btn-info " type="submit" name="editar" value="editar"/>
    </form>   
</div> 