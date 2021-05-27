<%-- 
    Document   : gerencia
    Created on : 26/05/2021, 14:09:47
    Author     : suporte
--%>

<%@page import="java.io.IOException"%>
<%@page import="javax.servlet.annotation.WebServlet"%>
<%@page import="br.com.ghms.baruk.site.BO.GerenciaBO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>
        <title>Gerência</title>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>

        <jsp:include page="menu/imports/head.jsp"/>
    </head>
    <body>
        <% 
        @WebServlet(name = "erencia_servlet", urlPatterns = {"/Gerencia"})
            class Gerencia_servlet extends HttpServlet {
       
            private final GerenciaBO gerenciabo = new GerenciaBO();
            protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
                gerenciabo.InsercaoAuto();
            }
        }
           %>
        public class Cliente_servlet extends HttpServlet {
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
                      
                    </div>
             </div>
               
        </div>
        
    </body>
</html>
