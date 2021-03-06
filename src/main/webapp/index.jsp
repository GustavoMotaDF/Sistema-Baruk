<%-- 
    Document   : index
    Created on : 11/05/2021, 21:05:41
    Author     : suporte
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Login-Baruk</title>
        <jsp:include page="gestao/menu/imports/head.jsp"/>

        <!-- Bootstrap core CSS -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Pattaya&display=swap" rel="stylesheet">


        <style>
            .bd-placeholder-img {
                font-size: 1.125rem;
                text-anchor: middle;
                -webkit-user-select: none;
                -moz-user-select: none;
                -ms-user-select: none;
                user-select: none;
            }
            .fonte{
                font-family: 'Pattaya', sans-serif;
            }
            .fundo{
                background-image: url("gestao/menu/images/fundoNeutro.jpeg");
            }

            @media (min-width: 768px) {
                .bd-placeholder-img-lg {
                    font-size: 3.5rem;
                }
            }
        </style>


        <!-- Custom styles for this template -->
        <link href="gestao/menu/css/signin.css" rel="stylesheet">
    </head>
    <body class="text-center fundo">
        <form class="form-signin" action="${pageContext.request.contextPath}/Inicio" method="post" >
            <img class="mb-4" src="gestao/menu/images/baruk.png" alt="" width="72" height="72">
            <h1 class="h3 mb-3 font-weight-normal fonte">Baruk Art'Cr?</h1>
            <label for="inputEmail" class="sr-only">Login</label>
            <input type="text" id="inputEmail" class="form-control" name="username" required autofocus onkeyup="cpfCheck(this)" maxlength="14" onkeydown="javascript: fMasc(this, mCPF);" placeholder="Login">
            <br>
            <label for="inputPassword" class="sr-only">Password</label>
            <input type="password" id="inputPassword" class="form-control" name="senha" placeholder="Password" required>

            <input class="btn btn-lg btn-primary btn-block" name="Entrar" value="Entrar" type="submit" />
            ${mensagemErro}
            <br>
            <div class="btn btn-light">
               Baruk Art Cro &copy; 2020-2021                 
            </div>
            <div class="text-body">

                <script type="application/javascript">
                   function getIP(json) {
                   document.write("Seu IP: ", json.ip);
                   }
                </script>
                <script type="application/javascript" src="https://api.ipify.org?format=jsonp&callback=getIP"></script>

            </div>


        </form>
    </body>
</html>