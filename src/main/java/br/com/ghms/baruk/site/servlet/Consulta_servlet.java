/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.ghms.baruk.site.servlet;

import br.com.ghms.baruk.site.BO.EncomendaBO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Objects;
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
@WebServlet(name = "Consulta_servlet", urlPatterns = {"/Consulta-Encomenda"})
public class Consulta_servlet extends HttpServlet {
    private final EncomendaBO encomendabo = new EncomendaBO();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      HttpSession sessao = req.getSession();
        
        String username = (String) sessao.getAttribute("username");

        if (username == null || username.isEmpty()) {
            req.getRequestDispatcher("index.jsp").forward(req, resp);
        }
        if (Objects.nonNull(req.getParameter("consultar"))) {
            try {
                req.setAttribute("resultado", encomendabo.getEncomendaIdpesquisa(req.getParameter("idpesquisa")));
            } catch (Exception erro) {
                req.setAttribute("mensagemErro", "<div id=\"foo\" class=\"alert alert-warning\" role=\"alert\"><strong> " + erro.getMessage() + "</strong></div>"
                        + "<script>$().ready(function() {\n"
                        + "	setTimeout(function () {\n"
                        + "		$('#foo').hide(); // \"foo\" é o id do elemento que seja manipular.\n"
                        + "	}, 50000); // O valor é representado em milisegundos.\n"
                        + "});</script>");

            }
        }
                       req.getRequestDispatcher("gestao/consulta_encomenda.jsp").forward(req, resp);

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
              HttpSession sessao = req.getSession();
        
        String username = (String) sessao.getAttribute("username");

        if (username == null || username.isEmpty()) {
            req.getRequestDispatcher("index.jsp").forward(req, resp);
        }
        req.getRequestDispatcher("gestao/consulta_encomenda.jsp").forward(req, resp);
    }

   

}
