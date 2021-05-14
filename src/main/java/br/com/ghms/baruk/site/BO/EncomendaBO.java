/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.ghms.baruk.site.BO;

import br.com.ghms.baruk.site.entity.Cliente;
import br.com.ghms.baruk.site.entity.Encomenda;
import br.com.ghms.baruk.site.entity.Produto;
import java.time.LocalDateTime;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 *
 * @author suporte
 */
public class EncomendaBO {
    private static final EntityManagerFactory emf
            = Persistence.createEntityManagerFactory("barukup");
    
    public List<Encomenda> getEncomendas() throws Exception{
        List<Encomenda>encomenda;
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        encomenda = em.createQuery("from Encomenda").getResultList();
        em.getTransaction().commit();
        em.clear();
        em.close();
        
        if(encomenda==null || encomenda.isEmpty() || encomenda.equals("") ){
            throw new Exception("Sem Encomedas registradas!");            
        }
        
        return encomenda;
    }
    
    public void cadEncomenda (String idcliente, String entrega, String status, String idproduto, String data_solicitacao, String data_previsao  ) throws Exception{ 
        EntityManager em = emf.createEntityManager();
        if(idcliente==null || idcliente.isEmpty() || idcliente.equals("") ){
            throw new Exception ("Não foi informado o cliente da Encomenda!");             
        }
       
        if(idproduto==null || idproduto.isEmpty() || idproduto.equals("") ){
            throw new Exception("Não foi informado o idproduto ");            
        }
        if(data_previsao==null || data_previsao.isEmpty() || data_previsao.equals("") ){
            throw new Exception("Não foi informado o idproduto ");            
        }
        
        
        
        em.getTransaction().begin();
        
        Encomenda encomenda = new Encomenda();
        Produto produtos = em.find(Produto.class, Long.valueOf(idproduto)); 
        Cliente cliente = em.find(Cliente.class, Long.valueOf(idcliente));                 
        encomenda.setCliente(cliente);        
        encomenda.setEntrega(entrega);
        encomenda.setStatus(status);       
        encomenda.setProduto(produtos);
        encomenda.setData_solicitacao(LocalDateTime.now());
        encomenda.setData_previsao(LocalDateTime.parse(data_previsao));
        
       
        em.persist(encomenda);
        em.getTransaction().commit();
        
        em.clear();
        em.close();              
        
    }
     public void editEncomenda (String idencomenda, String idcliente, String entrega, String status, String idproduto, String data_solicitacao, String data_previsao ) throws Exception{ 
        EntityManager em = emf.createEntityManager();
        if(idencomenda==null || idencomenda.isEmpty() || idencomenda.equals("") ){
            throw new Exception ("Não foi informado o idencomenda da Encomenda!");             
        }
        if(idcliente==null || idcliente.isEmpty() || idcliente.equals("") ){
            throw new Exception("Não foi informado o idcliente do Cliente!");            
        }
        if(idproduto==null || idproduto.isEmpty() || idproduto.equals("") ){
            throw new Exception("Não foi informado o idproduto ");            
        }
        if(data_previsao==null || data_previsao.isEmpty() || data_previsao.equals("") ){
            throw new Exception("Não foi informado se o pedido é para entrega!");            
        }
        
        
        
        em.getTransaction().begin();
        
        Encomenda encomenda = em.find(Encomenda.class, Long.valueOf(idencomenda));
        Produto produtos = em.find(Produto.class, Long.valueOf(idproduto)); 
        Cliente cliente = em.find(Cliente.class, Long.valueOf(idcliente));                 
        encomenda.setCliente(cliente);        
        encomenda.setEntrega(entrega);
        encomenda.setStatus(status);       
        encomenda.setProduto(produtos);
        encomenda.setData_solicitacao(LocalDateTime.now());
        encomenda.setData_previsao(LocalDateTime.parse(data_previsao));       
        
       
        em.merge(encomenda);
        em.getTransaction().commit();
        
        em.clear();
        em.close();              
        
    }
     public Encomenda getEncomenda(String idencomenda)throws Exception{
        Encomenda encomenda;
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        
        encomenda = em.find(Encomenda.class,Long.valueOf(idencomenda));
        em.getTransaction().commit();
        em.clear();
        em.close();
        
        if(encomenda==null   || encomenda.equals("") ){
            throw new Exception("Erro ao carregar Encomenda, ID não foi informado");            
        }        
        return encomenda;
    }
    
}
