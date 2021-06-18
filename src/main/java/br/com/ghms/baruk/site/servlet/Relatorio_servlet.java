/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.ghms.baruk.site.servlet;

import br.com.ghms.baruk.site.BO.ClienteBO;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "Relatorio_servlet", urlPatterns = {"/Relatorio"})
public class Relatorio_servlet extends HttpServlet {
    private final ClienteBO clientebo = new ClienteBO();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession sessao = req.getSession();

        String username = (String) sessao.getAttribute("username");

        if (username == null || username.isEmpty()) {
            req.getRequestDispatcher("index.jsp").forward(req, resp);
        }
        try {
            req.setAttribute("clientes", clientebo.getClientes());
        } catch (Exception ex) {
            Logger.getLogger(Relatorio_servlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        req.getRequestDispatcher("gestao/relatorios/relatorio.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession sessao = req.getSession();

        String username = (String) sessao.getAttribute("username");

        if (username == null || username.isEmpty()) {
            req.getRequestDispatcher("index.jsp").forward(req, resp);
        }
        try {
            req.setAttribute("clientes", clientebo.getClientes());
        } catch (Exception ex) {
            Logger.getLogger(Relatorio_servlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        req.getRequestDispatcher("gestao/relatorios/relatorio.jsp").forward(req, resp);
    }

}
