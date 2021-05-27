/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.ghms.baruk.site.servlet;

import br.com.ghms.baruk.site.BO.LoginBO;
import br.com.ghms.baruk.site.entity.Login;
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
@WebServlet(name = "Inicio_login_servlet", urlPatterns = {"/Inicio"})
public class Inicio_login_servlet extends HttpServlet {
    private final LoginBO loginbo = new LoginBO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
     HttpSession session = req.getSession();
     
     if (Objects.nonNull(req.getParameter("Entrar"))) {
            try {                
                req.setAttribute("Login", loginbo.getLogin(req.getParameter("username"), req.getParameter("senha")));
                session.isNew();
                session.setAttribute("username", req.getParameter("username"));

                req.getRequestDispatcher("inicio.jsp").forward(req, resp);

            } catch (Exception errologin) {

                req.setAttribute("mensagemErro", "<div class=\"alert alert-danger\" id=\"foo\">"
                        + "<strong> Login ou senha incorretos! </strong>"
                        + "</div>"
                        + "<script>$().ready(function() {\n"
                        + "	setTimeout(function () {\n"
                        + "		$('#foo').hide(); // \"foo\" é o id do elemento que seja manipular.\n"
                        + "	}, 15000); // O valor é representado em milisegundos.\n"
                        + "});</script>");
                req.getRequestDispatcher("index.jsp").forward(req, resp);
            }
        }     
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      HttpSession sessao = req.getSession();

        String username = (String) sessao.getAttribute("username");
     if (username == null || username.isEmpty()) {
            req.setAttribute("mensagemErro", "<div class=\"alert alert-danger\" id=\"foo\">"
                        + "<strong> Você foi deslogado, faça login novamente para ter acesso ao sistema! </strong>"
                        + "</div>"
                        + "<script>$().ready(function() {\n"
                        + "	setTimeout(function () {\n"
                        + "		$('#foo').hide(); // \"foo\" é o id do elemento que seja manipular.\n"
                        + "	}, 15000); // O valor é representado em milisegundos.\n"
                        + "});</script>");
            req.getRequestDispatcher("index.jsp").forward(req, resp);
            
        }
        req.getRequestDispatcher("inicio.jsp").forward(req, resp);
    }


}
