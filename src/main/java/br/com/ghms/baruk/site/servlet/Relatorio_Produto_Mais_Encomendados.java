/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.ghms.baruk.site.servlet;

import br.com.ghms.baruk.site.BO.RelatoriosBO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author suporte
 */
@WebServlet(name = "Relatorio_Produto_Mais_Encomendados", urlPatterns = {"/Relatorio_Produto_Mais_Encomendados"})
public class Relatorio_Produto_Mais_Encomendados extends HttpServlet {
    
     private final RelatoriosBO relatoriobo = new RelatoriosBO();
  
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       
        
         try {
             req.setAttribute("produtomais", relatoriobo.getProdutorMaisPedidos());
         } catch (Exception ex) {
             Logger.getLogger(Relatorio_Produto_Mais_Encomendados.class.getName()).log(Level.SEVERE, null, ex);
         }
         req.getRequestDispatcher("gestao/relatorios/produtosmaisencomendados.jsp").forward(req, resp);
    }

    

}
