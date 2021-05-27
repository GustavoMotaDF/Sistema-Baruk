/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.ghms.baruk.site.servlet;

import br.com.ghms.baruk.site.BO.LoginBO;
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
 * @author alephtav
 */
@WebServlet(name = "Login_servlet", urlPatterns = {"/Logins"})
public class Login_servlet extends HttpServlet {
    
    private final LoginBO loginbo = new LoginBO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
     HttpSession sessao = req.getSession();
        
        String username = (String) sessao.getAttribute("username");

        if (username == null || username.isEmpty()) {
            req.getRequestDispatcher("index.jsp").forward(req, resp);
        }
        
        if (Objects.nonNull(req.getParameter("cadastrar"))) {
            try {
                loginbo.cadLogin(
                        req.getParameter("username"),
                        req.getParameter("senha"),
                        req.getParameter("nome"));

                req.setAttribute("mensagemSucesso", "<div id=\"foo\" class=\"alert alert-success\" role=\"alert\"> <strong> Login cadastrado com sucesso! </strong> </div>"
                        + "<script>$().ready(function() {\n"
                        + "	setTimeout(function () {\n"
                        + "		$('#foo').hide(); // \"foo\" é o id do elemento que seja manipular.\n"
                        + "	}, 10000); // O valor é representado em milisegundos.\n"
                        + "});</script>");

            } catch (Exception erro ) {
                req.setAttribute("mensagemErro", "<div id=\"foo\" class=\"alert alert-warning\" role=\"alert\"><strong> Erro ao registrar Login: " + erro.getMessage() + "<br> (caso não saiba o que fazer, procure o administrador do sistema!)</strong></div>"
                        + "<script>$().ready(function() {\n"
                        + "	setTimeout(function () {\n"
                        + "		$('#foo').hide(); // \"foo\" é o id do elemento que seja manipular.\n"
                        + "	}, 10000); // O valor é representado em milisegundos.\n"
                        + "});</script>");
            }
        }
    else if (Objects.nonNull(req.getParameter("editar"))) {
            try {
                req.setAttribute("loginEditando", loginbo.getLogin(req.getParameter("idlogin")));
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
                loginbo.editLogin(
                         req.getParameter("idlogin"),
                         req.getParameter("username"),
                        req.getParameter("senha"),
                        req.getParameter("nome"));

                req.setAttribute("mensagemSucesso", "<div id=\"foo\" class=\"alert alert-success\" role=\"alert\"> <strong> Login alterado com Sucesso! </strong> </div>"
                        + "<script>$().ready(function() {\n"
                        + "	setTimeout(function () {\n"
                        + "		$('#foo').hide(); // \"foo\" é o id do elemento que seja manipular.\n"
                        + "	}, 10000); // O valor é representado em milisegundos.\n"
                        + "});</script>");

            } catch (Exception erro) {
                req.setAttribute("mensagemErro", "<div id=\"foo\" class=\"alert alert-warning\" role=\"alert\"><strong> Erro ao tentar editar Login: " + erro.getMessage() + " caso não saiba o que fazer, procure o administrador do sistema!</strong></div>"
                        + "<script>$().ready(function() {\n"
                        + "	setTimeout(function () {\n"
                        + "		$('#foo').hide(); // \"foo\" é o id do elemento que seja manipular.\n"
                        + "	}, 10000); // O valor é representado em milisegundos.\n"
                        + "});</script>");
            }
            

        }
        try {
            req.setAttribute("login", loginbo.getLogins());

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
        req.getRequestDispatcher("gestao/cadlogin.jsp").forward(req, resp);
    
    
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      HttpSession sessao = req.getSession();
        
        String username = (String) sessao.getAttribute("username");

        if (username == null || username.isEmpty()) {
            req.getRequestDispatcher("index.jsp").forward(req, resp);
        }
        try {
            req.setAttribute("login", loginbo.getLogins());

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
        req.getRequestDispatcher("gestao/cadlogin.jsp").forward(req, resp);
        
    
    }


}
