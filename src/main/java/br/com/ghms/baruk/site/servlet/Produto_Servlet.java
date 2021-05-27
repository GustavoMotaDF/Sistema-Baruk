/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.ghms.baruk.site.servlet;

import br.com.ghms.baruk.site.BO.EncomendaBO;
import br.com.ghms.baruk.site.BO.ProdutoBO;
import java.io.IOException;
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
@WebServlet(name = "Produto_Servlet", urlPatterns = {"/Produto"})
public class Produto_Servlet extends HttpServlet {

    private final ProdutoBO produtobo = new ProdutoBO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       HttpSession sessao = req.getSession();
        
        String username = (String) sessao.getAttribute("username");

        if (username == null || username.isEmpty()) {
            req.getRequestDispatcher("index.jsp").forward(req, resp);
        }
        if (Objects.nonNull(req.getParameter("cadastrar"))) {
            try {
                produtobo.cadProduto(
                        req.getParameter("produto"),
                        req.getParameter("descricao"),
                        req.getParameter("valor"),
                        req.getParameter("tproducao"));

                req.setAttribute("mensagemSucesso", "<div id=\"foo\" class=\"alert alert-success\" role=\"alert\"> <strong> Produto cadastrado com sucesso! </strong> </div>"
                        + "<script>$().ready(function() {\n"
                        + "	setTimeout(function () {\n"
                        + "		$('#foo').hide(); // \"foo\" é o id do elemento que seja manipular.\n"
                        + "	}, 10000); // O valor é representado em milisegundos.\n"
                        + "});</script>");

            } catch (Exception erro) {
                req.setAttribute("mensagemErro", "<div id=\"foo\" class=\"alert alert-warning\" role=\"alert\"><strong> Erro ao registrar Produto: " + erro.getMessage() + " (caso não saiba o que fazer, procure o administrador do sistema!)</strong></div>"
                        + "<script>$().ready(function() {\n"
                        + "	setTimeout(function () {\n"
                        + "		$('#foo').hide(); // \"foo\" é o id do elemento que seja manipular.\n"
                        + "	}, 10000); // O valor é representado em milisegundos.\n"
                        + "});</script>");
            }
        } else if (Objects.nonNull(req.getParameter("editar"))) {
            try {
                req.setAttribute("produtoEditando", produtobo.getProduto(req.getParameter("idproduto")));
            } catch (Exception erro) {
                req.setAttribute("mensagemErro", "<div id=\"foo\" class=\"alert alert-warning\" role=\"alert\"><strong>" + erro.getMessage() + " </strong></div>"
                        + "<script>$().ready(function() {\n"
                        + "	setTimeout(function () {\n"
                        + "		$('#foo').hide(); // \"foo\" é o id do elemento que seja manipular.\n"
                        + "	}, 10000); // O valor é representado em milisegundos.\n"
                        + "});</script>");
            }
        } else if (Objects.nonNull(req.getParameter("alterar"))) {
            try {
                produtobo.editProduto(req.getParameter("idproduto"),
                        req.getParameter("produto"),
                        req.getParameter("descricao"),
                        req.getParameter("valor"),
                        req.getParameter("tproducao"));

                req.setAttribute("mensagemSucesso", "<div id=\"foo\" class=\"alert alert-success\" role=\"alert\"> <strong> Produto alterado com Sucesso! </strong> </div>"
                        + "<script>$().ready(function() {\n"
                        + "	setTimeout(function () {\n"
                        + "		$('#foo').hide(); // \"foo\" é o id do elemento que seja manipular.\n"
                        + "	}, 10000); // O valor é representado em milisegundos.\n"
                        + "});</script>");

            } catch (Exception erro) {
                req.setAttribute("mensagemErro", "<div id=\"foo\" class=\"alert alert-warning\" role=\"alert\"><strong> Erro ao tentar editar a Produto: " + erro.getMessage() + " caso não saiba o que fazer, procure o administrador do sistema!</strong></div>"
                        + "<script>$().ready(function() {\n"
                        + "	setTimeout(function () {\n"
                        + "		$('#foo').hide(); // \"foo\" é o id do elemento que seja manipular.\n"
                        + "	}, 10000); // O valor é representado em milisegundos.\n"
                        + "});</script>");
            }

        }
        try {
            req.setAttribute("produtos", produtobo.getProdutos());

        } catch (Exception erro) {
            req.setAttribute("mensagemErro", "<div id=\"foo\" class=\"alert alert-warning\" role=\"alert\">" + erro.getMessage() + "</div>"
                    + "<script>\n"
                    + "                    $().ready(function () {\n"
                    + "                        setTimeout(function () {\n"
                    + "                            $('#foo').hide();\n"
                    + "                        }, 10000);\n"
                    + "                    });\n"
                    + "                </script>\n"
                    + "");
        }
        req.getRequestDispatcher("gestao/produto.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession sessao = req.getSession();
        
        String username = (String) sessao.getAttribute("username");

        if (username == null || username.isEmpty()) {
            req.getRequestDispatcher("index.jsp").forward(req, resp);
        }
        try {
            req.setAttribute("produtos", produtobo.getProdutos());

        } catch (Exception erro) {
            req.setAttribute("mensagemErro", "<div id=\"foo\" class=\"alert alert-warning\" role=\"alert\">" + erro.getMessage() + "</div>"
                    + "<script>\n"
                    + "                    $().ready(function () {\n"
                    + "                        setTimeout(function () {\n"
                    + "                            $('#foo').hide();\n"
                    + "                        }, 10000);\n"
                    + "                    });\n"
                    + "                </script>\n"
                    + "");
        }
        req.getRequestDispatcher("gestao/produto.jsp").forward(req, resp);
    }

}
