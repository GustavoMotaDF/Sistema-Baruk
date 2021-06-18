<%-- 
    Document   : menu-lateral
    Created on : 15/05/2021, 01:42:24
    Author     : alephtav
--%>

<nav id="sidebar" class="active">
    <img class="mb-4" src="gestao/menu/images/baruk.png" alt="" width="72" height="72">
    <h1><a href="${pageContext.request.contextPath}/Inicio" class="logo">B.</a></h1>
    
    <ul class="list-unstyled components mb-5">
        <li class="active">
            <a href="${pageContext.request.contextPath}/Inicio"><span class="fa fa-home"></span> Inicio</a>
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
            <a href="${pageContext.request.contextPath}/Logins"><span class="fa fa-address-card-o"></span>Login</a>    
        </li>
        
    </ul>
              <br>
           
    <div class="footer">
        <p>
            Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib.com</a>
        </p>
    </div>
</nav>