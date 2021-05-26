/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.ghms.baruk.site.BO;

import br.com.ghms.baruk.site.entity.Cliente;
import java.time.LocalDateTime;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.PersistenceException;
import org.hibernate.HibernateError;

/**
 *
 * @author alephtav
 */
public class ClienteBO {
    private static final EntityManagerFactory emf
            = Persistence.createEntityManagerFactory("barukup");
      public List<Cliente> getClientes() throws Exception{
        List<Cliente>cliente;
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        cliente = em.createQuery("from Cliente").getResultList();
        em.getTransaction().commit();
        em.clear();
        em.close();
        
        if(cliente==null || cliente.isEmpty() || cliente.equals("") ){
            throw new Exception("Sem Clientes registrados!");            
        }
        
        return cliente;
    }
      public void cadCliente (String nome, String telefone, String cpf, String endereco) throws Exception{ 
        EntityManager em = emf.createEntityManager();
        if(nome==null || nome.isEmpty() || nome.equals("") ){
            throw new Exception ("Não foi informado o NOME!");             
        }       
        if(telefone==null || telefone.isEmpty() || telefone.equals("") ){
            throw new Exception("Não foi informado o TELEFONE! ");            
        }
        
        if(cpf==null || cpf.isEmpty() || cpf.equals("") ){
            throw new Exception("Não foi informado o CPF! ");            
        }
        try {
        Cliente cliente = new Cliente();
        cliente.setNome(nome);
        cliente.setTelefone(telefone);
        cliente.setCpf(cpf);
        cliente.setEndereco(endereco);
        cliente.setData_cadastro(LocalDateTime.now());
        
        em.getTransaction().begin(); 
        em.persist(cliente);
        }catch(PersistenceException erro){
           
            throw new Exception("Entrada duplicada; <br> o CPF já está cadastrado no banco de dados!");
            
        }
        
        
        em.getTransaction().commit();
        
        em.clear();
        em.close();              
        
    }
      public void editCliente (String idcliente, String nome, String telefone, String cpf, String endereco) throws Exception{ 
        EntityManager em = emf.createEntityManager();
        if(nome==null || nome.isEmpty() || nome.equals("") ){
            throw new Exception ("Não foi informado o NOME!");             
        }
       
        if(telefone==null || telefone.isEmpty() || telefone.equals("") ){
            throw new Exception("Não foi informado o TELEFONE! ");            
        }
        if(cpf==null || cpf.isEmpty() || cpf.equals("") ){
            throw new Exception("Não foi informado o CPF! ");            
        }
        
        Cliente cliente = em.find(Cliente.class, Long.parseLong(idcliente));
        cliente.setNome(nome);
        cliente.setTelefone(telefone);
        cliente.setCpf(cpf);
        cliente.setEndereco(endereco);
        cliente.setData_atualizacao(LocalDateTime.now());
        
        em.getTransaction().begin();
                
       
        em.merge(cliente);
        em.getTransaction().commit();
        
       
        em.clear();
        em.close();              
        
    }
      public Cliente getEncomenda(String idcliente)throws Exception{
        Cliente cliente;
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        
        cliente = em.find(Cliente.class,Long.valueOf(idcliente));
        em.getTransaction().commit();
        em.clear();
        em.close();
        
        if(cliente==null   || cliente.equals("") ){
            throw new Exception("Erro ao carregar Cliente, ID não foi informado");            
        }        
        return cliente;
    }

    

    
      
}
