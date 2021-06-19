<%-- 
    Document   : fim
    Created on : 25/05/2021, 21:23:10
    Author     : suporte
--%>    
<script>
    var filtro = document.getElementById('filtro-nome');
    var tabela = document.getElementById('lista');
    filtro.onkeyup = function () {
        var nomeFiltro = filtro.value;
        for (var i = 1; i < tabela.rows.length; i++) {
            var conteudoCelula = tabela.rows[i].cells[0].innerText;            
            var corresponde = conteudoCelula.toLowerCase().indexOf(nomeFiltro) >= 0;
            tabela.rows[i].style.display = corresponde ? '' : 'none';
        }
    };
    

</script>   

<script src="gestao/menu/js/select2.js"></script>
<script src="gestao/menu/js/mascara.js"></script>

<script src="gestao/menu/js/popper.js"></script>
<script src="gestao/menu/js/bootstrap.min.js"></script>
<script src="gestao/menu/js/main.js"></script>