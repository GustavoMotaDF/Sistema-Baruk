/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.ghms.baruk.site.servlet;

import br.com.ghms.baruk.site.BO.ClienteBO;
import br.com.ghms.baruk.site.BO.EncomendaBO;
import br.com.ghms.baruk.site.BO.ProdutoBO;
import br.com.ghms.baruk.site.BO.StatusBO;
import java.io.IOException;
import java.util.Objects;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author suporte
 */
@WebServlet(name = "Encomenda_Servlet", urlPatterns = {"/Encomenda"})
public class Encomenda_Servlet extends HttpServlet {

    private final EncomendaBO encomendabo = new EncomendaBO();
    private final ProdutoBO produtobo = new ProdutoBO();
    private final ClienteBO clientebo = new ClienteBO();
    private final StatusBO statusbo = new StatusBO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       
        if (Objects.nonNull(req.getParameter("cadastrar"))) {
            try {
                encomendabo.cadEncomenda(req.getParameter("idcliente"),
                        req.getParameter("entrega"),
                        req.getParameter("status"),
                        req.getParameter("idproduto"),
                        req.getParameter("data_previsao"),
                        req.getParameter("valor_adicional"),
                        req.getParameter("observacao"));

                req.setAttribute("mensagemSucesso", "<div id=\"foo\" class=\"alert alert-success\" role=\"alert\"> <strong> Encomenda registrada com sucesso! </strong> </div>"
                        + "<script>$().ready(function() {\n"
                        + "	setTimeout(function () {\n"
                        + "		$('#foo').hide(); // \"foo\" é o id do elemento que seja manipular.\n"
                        + "	}, 10000); // O valor é representado em milisegundos.\n"
                        + "});</script>");

            } catch (Exception erro) {
                req.setAttribute("mensagemErro", "<div id=\"foo\" class=\"alert alert-warning\" role=\"alert\"><strong> Erro ao registrar encomenda: " + erro + " caso não saiba o que fazer, procure o administrador do sistema!</strong></div>"
                        + "<script>$().ready(function() {\n"
                        + "	setTimeout(function () {\n"
                        + "		$('#foo').hide(); // \"foo\" é o id do elemento que seja manipular.\n"
                        + "	}, 10000); // O valor é representado em milisegundos.\n"
                        + "});</script>");
            }
        } else if (Objects.nonNull(req.getParameter("editar"))) {
            try {
                req.setAttribute("encomendaEditando", encomendabo.getEncomenda(req.getParameter("idencomenda")));
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
                encomendabo.editEncomenda(req.getParameter("idencomenda"),
                        req.getParameter("idcliente"),
                        req.getParameter("entrega"),
                        req.getParameter("status"),
                        req.getParameter("idproduto"),
                        req.getParameter("data_previsao"),
                        req.getParameter("valor_adicional"),
                        req.getParameter("observacao"));
                req.setAttribute("mensagemSucesso", "<div id=\"foo\" class=\"alert alert-success\" role=\"alert\"> <strong> Encomenda alterada com Sucesso! </strong> </div>"
                        + "<script>$().ready(function() {\n"
                        + "	setTimeout(function () {\n"
                        + "		$('#foo').hide(); // \"foo\" é o id do elemento que seja manipular.\n"
                        + "	}, 10000); // O valor é representado em milisegundos.\n"
                        + "});</script>");

            } catch (Exception erro) {
                req.setAttribute("mensagemErro", "<div id=\"foo\" class=\"alert alert-warning\" role=\"alert\"><strong> Erro ao tentar editar a Encomenda: " + erro.getMessage() + " caso não saiba o que fazer, procure o administrador do sistema!</strong></div>"
                        + "<script>$().ready(function() {\n"
                        + "	setTimeout(function () {\n"
                        + "		$('#foo').hide(); // \"foo\" é o id do elemento que seja manipular.\n"
                        + "	}, 10000); // O valor é representado em milisegundos.\n"
                        + "});</script>");
            }

        } 
        try {  
             req.setAttribute("solicitada", encomendabo.getSolicitada());
         }
         catch(Exception erro){
               req.setAttribute("mensagemErrosolicitada", "<div id=\"foo\" class=\"alert alert-warning\" role=\"alert\">" + erro.getMessage() + "</div>"
                    + "<script>\n"
                    + "                    $().ready(function () {\n"
                    + "                        setTimeout(function () {\n"
                    + "                            $('#foo').hide();\n"
                    + "                        }, 10000);\n"
                    + "                    });\n"
                    + "                </script>\n"
                    + "");
         }
         try {  
              req.setAttribute("producao", encomendabo.getProducao());
         }
         catch(Exception erro){
             req.setAttribute("mensagemErroproducao", "<div id=\"foo\" class=\"alert alert-warning\" role=\"alert\">"+ erro.getMessage() + "</div>"
                    + "<script>\n"
                    + "                    $().ready(function () {\n"
                    + "                        setTimeout(function () {\n"
                    + "                            $('#foo').hide();\n"
                    + "                        }, 10000);\n"
                    + "                    });\n"
                    + "                </script>\n"
                    + "");
         }
         try {  
              req.setAttribute("final", encomendabo.getFinal());
         }
         catch(Exception erro){
             req.setAttribute("mensagemErrofinal", "<div id=\"foo\" class=\"alert alert-warning\" role=\"alert\">" + erro.getMessage() + "</div>"
                    + "<script>\n"
                    + "                    $().ready(function () {\n"
                    + "                        setTimeout(function () {\n"
                    + "                            $('#foo').hide();\n"
                    + "                        }, 10000);\n"
                    + "                    });\n"
                    + "                </script>\n"
                    + "");
         }
         try {  
             req.setAttribute("finalizada", encomendabo.getFinalizada());
         }
         catch(Exception erro){
             req.setAttribute("mensagemErrofinalizada", "<div id=\"foo\" class=\"alert alert-warning\" role=\"alert\">" + erro.getMessage() + "</div>"
                    + "<script>\n"
                    + "                    $().ready(function () {\n"
                    + "                        setTimeout(function () {\n"
                    + "                            $('#foo').hide();\n"
                    + "                        }, 10000);\n"
                    + "                    });\n"
                    + "                </script>\n"
                    + "");
         }
         try {  
             req.setAttribute("entregue", encomendabo.getEntregue());
         }
         catch(Exception erro){
             req.setAttribute("mensagemErroentregue", "<div id=\"foo\" class=\"alert alert-warning\" role=\"alert\">" + erro.getMessage() + "</div>"
                    + "<script>\n"
                    + "                    $().ready(function () {\n"
                    + "                        setTimeout(function () {\n"
                    + "                            $('#foo').hide();\n"
                    + "                        }, 10000);\n"
                    + "                    });\n"
                    + "                </script>\n"
                    + "");
         }
         try {  
             req.setAttribute("cancelada", encomendabo.getCanceladas());
         }
         catch(Exception erro){
             req.setAttribute("mensagemErrocancelada", "<div id=\"foo\" class=\"alert alert-warning\" role=\"alert\">" + erro.getMessage() + "</div>"
                    + "<script>\n"
                    + "                    $().ready(function () {\n"
                    + "                        setTimeout(function () {\n"
                    + "                            $('#foo').hide();\n"
                    + "                        }, 10000);\n"
                    + "                    });\n"
                    + "                </script>\n"
                    + "");
         }
        try {
            req.setAttribute("produtos", produtobo.getProdutos());
            req.setAttribute("clientes", clientebo.getClientes());
            req.setAttribute("status", statusbo.getStatus());            
            req.setAttribute("encomendas", encomendabo.getEncomendas());
            
            

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
        
        req.getRequestDispatcher("gestao/encomendas.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    
        try {  
             req.setAttribute("solicitada", encomendabo.getSolicitada());
         }
         catch(Exception erro){
               req.setAttribute("mensagemErrosolicitada", "<div id=\"foo\" class=\"alert alert-warning\" role=\"alert\">" + erro.getMessage() + "</div>"
                    + "<script>\n"
                    + "                    $().ready(function () {\n"
                    + "                        setTimeout(function () {\n"
                    + "                            $('#foo').hide();\n"
                    + "                        }, 10000);\n"
                    + "                    });\n"
                    + "                </script>\n"
                    + "");
         }
         try {  
              req.setAttribute("producao", encomendabo.getProducao());
         }
         catch(Exception erro){
             req.setAttribute("mensagemErroproducao", "<div id=\"foo\" class=\"alert alert-warning\" role=\"alert\">" + erro.getMessage() + "</div>"
                    + "<script>\n"
                    + "                    $().ready(function () {\n"
                    + "                        setTimeout(function () {\n"
                    + "                            $('#foo').hide();\n"
                    + "                        }, 10000);\n"
                    + "                    });\n"
                    + "                </script>\n"
                    + "");
         }
         try {  
              req.setAttribute("final", encomendabo.getFinal());
         }
         catch(Exception erro){
             req.setAttribute("mensagemErrofinal", "<div id=\"foo\" class=\"alert alert-warning\" role=\"alert\">" + erro.getMessage() + "</div>"
                    + "<script>\n"
                    + "                    $().ready(function () {\n"
                    + "                        setTimeout(function () {\n"
                    + "                            $('#foo').hide();\n"
                    + "                        }, 10000);\n"
                    + "                    });\n"
                    + "                </script>\n"
                    + "");
         }
         try {  
             req.setAttribute("finalizada", encomendabo.getFinalizada());
         }
         catch(Exception erro){
             req.setAttribute("mensagemErrofinalizada", "<div id=\"foo\" class=\"alert alert-warning\" role=\"alert\">"+ erro.getMessage() + "</div>"
                    + "<script>\n"
                    + "                    $().ready(function () {\n"
                    + "                        setTimeout(function () {\n"
                    + "                            $('#foo').hide();\n"
                    + "                        }, 10000);\n"
                    + "                    });\n"
                    + "                </script>\n"
                    + "");
         }
         try {  
             req.setAttribute("entregue", encomendabo.getEntregue());
         }
         catch(Exception erro){
             req.setAttribute("mensagemErroentregue", "<div id=\"foo\" class=\"alert alert-warning\" role=\"alert\">" + erro.getMessage() + "</div>"
                    + "<script>\n"
                    + "                    $().ready(function () {\n"
                    + "                        setTimeout(function () {\n"
                    + "                            $('#foo').hide();\n"
                    + "                        }, 10000);\n"
                    + "                    });\n"
                    + "                </script>\n"
                    + "");
         }
         try {  
             req.setAttribute("cancelada", encomendabo.getCanceladas());
         }
         catch(Exception erro){
             req.setAttribute("mensagemErrocancelada", "<div id=\"foo\" class=\"alert alert-warning\" role=\"alert\">" + erro.getMessage() + "</div>"
                    + "<script>\n"
                    + "                    $().ready(function () {\n"
                    + "                        setTimeout(function () {\n"
                    + "                            $('#foo').hide();\n"
                    + "                        }, 10000);\n"
                    + "                    });\n"
                    + "                </script>\n"
                    + "");
         }
        
        
       
        
        
        try {          
            req.setAttribute("produtos", produtobo.getProdutos());
            req.setAttribute("clientes", clientebo.getClientes());
            req.setAttribute("status", statusbo.getStatus());            
            req.setAttribute("encomendas", encomendabo.getEncomendas());
           

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

        req.getRequestDispatcher("gestao/encomendas.jsp").forward(req, resp);

    }

}
