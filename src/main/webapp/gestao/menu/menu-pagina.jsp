<%--
    Document   : menu-pagina
    Created on : 15/05/2021, 01:42:34
    Author     : alephtav
--%>
<%
    HttpSession sessao = request.getSession();

    String username = (String) sessao.getAttribute("username");

    if (username == null || username.isEmpty()) {

        request.getRequestDispatcher("index.jsp").forward(request, response);
        request.setAttribute("mensagemErro", "Ops, você não está logado no sistema!<br> :)");
    }
%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">

        <button type="button" id="sidebarCollapse" class="btn btn-primary">
            <i class="fa fa-bars"></i>
            <span class="sr-only">Toggle Menu</span>
        </button>
        <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <i class="fa fa-bars"></i>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">

            <ul class="nav navbar-nav ml-auto">
                <li>

                    <div class="dropdown">
                        <button class="btn  dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Relatorios
                        </button>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/Relatorio">Clientes</a>
                            <a class="dropdown-item disabled"  href="#">Encomendas</a>
                            <a class="dropdown-item"  href="${pageContext.request.contextPath}/Relatorio_Produto_Mais_Encomendados">Produtos mais encomendados</a>
                            <a class="dropdown-item disabled"  href="#">Clientes com mais pedidos</a>
                        </div>
                    </div>

                </li>


                <li class="nav-item active">
                    <a class="nav-link" href="${pageContext.request.contextPath}/Consulta-Encomenda">Consulta</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="gestao/menu/imports/sessao.jsp">Sair</a>
                </li>
                <li class="nav-item active">
                    <div class="nav-link">
                        <script type="application/javascript" class>
                            function getIP(json) {
                            document.write("Seu IP: ", json.ip);
                            }
                        </script>
                        <script type="application/javascript" src="https://api.ipify.org?format=jsonp&callback=getIP"></script>

                    </div>
                </li>

            </ul>
        </div>
    </div>
</nav>

