/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.ghms.baruk.site.servlet;

import br.com.ghms.baruk.site.BO.ClienteBO;
import br.com.ghms.baruk.site.BO.RelatoriosBO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Objects;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author suporte
 */
@WebServlet(name = "Relatorio_Qtd_Pedidos_Por_CLiente_servlet", urlPatterns = {"/Relatorio_Qtd_Pedidos_Por_cliente"})
public class Relatorio_Qtd_Pedidos_Por_CLiente_servlet extends HttpServlet {
    private final RelatoriosBO relatoriobo = new RelatoriosBO();
   
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession sessao = req.getSession();

        String username = (String) sessao.getAttribute("username");

        if (username == null || username.isEmpty()) {
            req.getRequestDispatcher("index.jsp").forward(req, resp);
        }
        try {
            req.setAttribute("relatoriobo", relatoriobo.getClientesPedidos());
        } catch (Exception ex) {
            Logger.getLogger(Relatorio_Qtd_Pedidos_Por_CLiente_servlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        req.getRequestDispatcher("gestao/relatorios/qtddepedidosporcliente.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

HttpSession sessao = req.getSession();

        String username = (String) sessao.getAttribute("username");

        if (username == null || username.isEmpty()) {
            req.getRequestDispatcher("index.jsp").forward(req, resp);
        }
        
        if (Objects.nonNull(req.getParameter("consulta"))) {
            try {
                req.setAttribute("resultado", relatoriobo.getPedidosCPF(req.getParameter("consulta")));
            } catch (Exception erro) {
                req.setAttribute("mensagemErro", "<div id=\"foo\" class=\"alert alert-warning\" role=\"alert\"><strong> " + erro.getMessage() + "</strong></div>"
                        + "<script>$().ready(function() {\n"
                        + "	setTimeout(function () {\n"
                        + "		$('#foo').hide(); // \"foo\" é o id do elemento que seja manipular.\n"
                        + "	}, 50000); // O valor é representado em milisegundos.\n"
                        + "});</script>");

            }
        }  
                
        
        try {
            req.setAttribute("relatoriobo", relatoriobo.getClientesPedidos());
        } catch (Exception ex) {
            Logger.getLogger(Relatorio_Qtd_Pedidos_Por_CLiente_servlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        req.getRequestDispatcher("gestao/relatorios/qtddepedidosporcliente.jsp").forward(req, resp);
    }
    

}
