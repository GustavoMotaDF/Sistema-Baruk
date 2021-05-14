/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.ghms.baruk.site.BO;

import br.com.ghms.baruk.site.entity.Encomenda;
import br.com.ghms.baruk.site.entity.Produto;
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
    
    public void cadEncomenda (String cliente, String telefone, String endereco, String entrega, String status,  String idproduto ) throws Exception{ 
        EntityManager em = emf.createEntityManager();
        if(cliente==null || cliente.isEmpty() || cliente.equals("") ){
            throw new Exception ("Não foi informado o cliente da Encomenda!");             
        }
        if(telefone==null || telefone.isEmpty() || telefone.equals("") ){
            throw new Exception("Não foi informado o telefone do Cliente!");            
        }
        if(entrega==null || entrega.isEmpty() || entrega.equals("") ){
            throw new Exception("Não foi informado se o pedido é para entrega!");            
        }
        if(endereco==null || entrega.isEmpty() || endereco.equals("") ){
            throw new Exception("Não foi informado o endereco");            
        }
       
        if(status==null || status.isEmpty() || status.equals("") ){
            throw new Exception("Não foi informado o status");            
        }
        if(idproduto==null || idproduto.isEmpty() || idproduto.equals("") ){
            throw new Exception("Não foi informado o idproduto ");            
        }
        
        
        
        em.getTransaction().begin();
        
        Encomenda encomenda = new Encomenda();
        Produto produtos = em.find(Produto.class, Long.valueOf(idproduto));         
        encomenda.setCliente(cliente);
        encomenda.setTelefone(telefone);
        encomenda.setEndereco(endereco);
        encomenda.setEntrega(entrega);
        encomenda.setStatus(status);       
        encomenda.setProduto(produtos);
        
       
        em.persist(encomenda);
        em.getTransaction().commit();
        
        em.clear();
        em.close();              
        
    }
     public void editEncomenda (String idencomenda, String cliente, String telefone, String endereco, String entrega, String status, String idproduto ) throws Exception{ 
        EntityManager em = emf.createEntityManager();
        if(cliente==null || cliente.isEmpty() || cliente.equals("") ){
            throw new Exception ("Não foi informado o cliente da Encomenda!");             
        }
        if(telefone==null || telefone.isEmpty() || telefone.equals("") ){
            throw new Exception("Não foi informado o telefone do Cliente!");            
        }
        if(entrega==null || entrega.isEmpty() || entrega.equals("") ){
            throw new Exception("Não foi informado se o pedido é para entrega!");            
        }
        
        
        
        em.getTransaction().begin();
        
        Encomenda encomenda = em.find(Encomenda.class, Long.valueOf(idencomenda));
        Produto produtos = em.find(Produto.class, Long.valueOf(idproduto));   
        encomenda.setCliente(cliente);
        encomenda.setTelefone(telefone);
        encomenda.setEndereco(endereco);
        encomenda.setEntrega(entrega);
        encomenda.setStatus(status);        
        encomenda.setProduto(produtos);
        
        
       
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
