<%--
    Document   : fim
    Created on : 25/05/2021, 21:23:10
    Author     : suporte
--%>
<script>
    var filtro = document.getElementById('filtro-nomeUP');
    var tabela = document.getElementById('listaUP');
    filtro.onkeyup = function () {
        var nomeFiltro = filtro.value;
        for (var i = 1; i < tabela.rows.length; i++) {
            var conteudoCelula = tabela.rows[i].cells[0].innerText;
            var corresponde = conteudoCelula.toUpperCase().indexOf(nomeFiltro) >= 0;
            tabela.rows[i].style.display = corresponde ? '' : 'none';
        }
    };



</script>

<script>
    var filtro1 = document.getElementById('filtro-nome');
    var tabela1 = document.getElementById('lista');
    filtro1.onkeyup = function () {
        var nomeFiltro1 = filtro1.value;
        for (var ii = 1; ii < tabela1.rows.length; ii++) {
            var conteudoCelula1 = tabela1.rows[ii].cells[0].innerText;
            var corresponde1 = conteudoCelula1.toLowerCase().indexOf(nomeFiltro1) >= 0;
            tabela1.rows[ii].style.display = corresponde1 ? '' : 'none';
        }
    };


</script>

<script src="gestao/menu/js/select2.js"></script>
<script src="gestao/menu/js/mascara.js"></script>

<script src="gestao/menu/js/popper.js"></script>
<script src="gestao/menu/js/bootstrap.min.js"></script>
<script src="gestao/menu/js/main.js"></script>