/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.ghms.baruk.site.servlet;

import br.com.ghms.baruk.site.BO.ClienteBO;
import br.com.ghms.baruk.site.BO.ProdutoBO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Objects;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author alephtav
 */
@WebServlet(name = "Cliente_servlet", urlPatterns = {"/Cliente"})
public class Cliente_servlet extends HttpServlet {
    private final ClienteBO clientebo = new ClienteBO();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        if (Objects.nonNull(req.getParameter("cadastrar"))) {
            try {
                clientebo.cadCliente(
                        req.getParameter("nome"),
                        req.getParameter("telefone"),
                        req.getParameter("cpf"),
                        req.getParameter("endereco"));

                req.setAttribute("mensagemSucesso", "<div id=\"foo\" class=\"alert alert-success\" role=\"alert\"> <strong> Cliente cadastrado com sucesso! </strong> </div>"
                        + "<script>$().ready(function() {\n"
                        + "	setTimeout(function () {\n"
                        + "		$('#foo').hide(); // \"foo\" é o id do elemento que seja manipular.\n"
                        + "	}, 10000); // O valor é representado em milisegundos.\n"
                        + "});</script>");

            } catch (Exception erro) {
                req.setAttribute("mensagemErro", "<div id=\"foo\" class=\"alert alert-warning\" role=\"alert\"><strong> Erro ao registrar Cliente: " + erro.getMessage() + " (caso não saiba o que fazer, procure o administrador do sistema!)</strong></div>"
                        + "<script>$().ready(function() {\n"
                        + "	setTimeout(function () {\n"
                        + "		$('#foo').hide(); // \"foo\" é o id do elemento que seja manipular.\n"
                        + "	}, 10000); // O valor é representado em milisegundos.\n"
                        + "});</script>");
            }
        } else if (Objects.nonNull(req.getParameter("editar"))) {
            try {
                req.setAttribute("clienteEditando", clientebo.getEncomenda(req.getParameter("idcliente")));
            } catch (Exception erro) {
                req.setAttribute("mensagemErro", "<div id=\"foo\" class=\"alert alert-warning\" role=\"alert\"><strong>" + erro.getMessage() + " </strong></div>"
                        + "<script>$().ready(function() {\n"
                        + "	setTimeout(function () {\n"
                        + "		$('#foo').hide(); // \"foo\" é o id do elemento que seja manipular.\n"
                        + "	}, 10000); // O valor é representado em milisegundos.\n"
                        + "});</script>");
            }
        }
        else if (Objects.nonNull(req.getParameter("alterar"))) {
            try {
                clientebo.editCliente(req.getParameter("idcliente"),
                        req.getParameter("nome"),
                        req.getParameter("telefone"),
                        req.getParameter("cpf"),
                        req.getParameter("endereco"));

                req.setAttribute("mensagemSucesso", "<div id=\"foo\" class=\"alert alert-success\" role=\"alert\"> <strong> Cliente alterado com Sucesso! </strong> </div>"
                        + "<script>$().ready(function() {\n"
                        + "	setTimeout(function () {\n"
                        + "		$('#foo').hide(); // \"foo\" é o id do elemento que seja manipular.\n"
                        + "	}, 10000); // O valor é representado em milisegundos.\n"
                        + "});</script>");

            } catch (Exception erro) {
                req.setAttribute("mensagemErro", "<div id=\"foo\" class=\"alert alert-warning\" role=\"alert\"><strong> Erro ao tentar editar Cliente: " + erro.getMessage() + " caso não saiba o que fazer, procure o administrador do sistema!</strong></div>"
                        + "<script>$().ready(function() {\n"
                        + "	setTimeout(function () {\n"
                        + "		$('#foo').hide(); // \"foo\" é o id do elemento que seja manipular.\n"
                        + "	}, 10000); // O valor é representado em milisegundos.\n"
                        + "});</script>");
            }

        }
        try {
            req.setAttribute("clientes", clientebo.getClientes());

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
        req.getRequestDispatcher("gestao/cliente.jsp").forward(req, resp);
        
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            req.setAttribute("clientes", clientebo.getClientes());

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
        req.getRequestDispatcher("gestao/cliente.jsp").forward(req, resp);
    }

   

}
