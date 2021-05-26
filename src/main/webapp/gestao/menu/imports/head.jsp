<%--
    Document   : head
    Created on : 25/05/2021, 21:17:04
    Author     : suporte
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="gestao/menu/css/select2.css" rel="stylesheet" >
<link rel="stylesheet" href="gestao/menu/css/style.css">


<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js" type="text/javascript"></script>
<script src="https://cdn.rawgit.com/plentz/jquery-maskmoney/master/dist/jquery.maskMoney.min.js"></script>
<script src="gestao/menu/js/mascara.js"></script>

<script>
                                                                $(document).ready(function ()
                                                                {
                                                                    $(".valores").maskMoney({
                                                                        decimal: ".",
                                                                        thousands: "."
                                                                    });
                                                                });
                                                            </script>