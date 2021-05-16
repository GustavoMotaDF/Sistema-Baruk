<%-- 
    Document   : menu-lateral
    Created on : 15/05/2021, 01:42:24
    Author     : alephtav
--%>

<nav id="sidebar" class="active">
    <h1><a href="index.html" class="logo">B.</a></h1>
    <ul class="list-unstyled components mb-5">
        <li class="active">
            <a href="${pageContext.request.contextPath}/inicio.jsp"><span class="fa fa-home"></span> Inicio</a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/Cliente"><span class="fa fa-user"></span> Clientes</a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/Produto"><span class="fa fa-list"></span> Produtos</a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/Encomenda"><span class="fa fa-hourglass-start"></span> Encomendas</a>
        </li>
        <li>
            <a href="#"><span class="fa fa-cogs"></span> Relatórios</a>
        </li>
    </ul>

    <div class="footer">
        <p>
            Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib.com</a>
        </p>
    </div>
</nav>