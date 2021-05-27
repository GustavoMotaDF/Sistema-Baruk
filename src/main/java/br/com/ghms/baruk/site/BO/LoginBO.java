/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.ghms.baruk.site.BO;

import br.com.ghms.baruk.site.entity.Cliente;
import br.com.ghms.baruk.site.entity.Login;
import java.time.LocalDateTime;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.PersistenceException;

/**
 *
 * @author alephtav
 */
public class LoginBO {
    private static final EntityManagerFactory emf
            = Persistence.createEntityManagerFactory("barukup");
    
    public List<Login> getLogins() throws Exception{
        List<Login>login;
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        login = em.createQuery("from Login").getResultList();
        em.getTransaction().commit();
        em.clear();
        em.close();
        
        if(login==null || login.isEmpty() || login.equals("") ){
            throw new Exception("Sem Logins registrados!");            
        }
        
        return login;
    }
    public void cadLogin (String username, String senha, String nome) throws Exception{ 
        EntityManager em = emf.createEntityManager();
        if(username==null || username.isEmpty() || username.equals("") ){
            throw new Exception ("Não foi informado o username!");             
        }       
        if(senha==null || senha.isEmpty() || senha.equals("") ){
            throw new Exception("Não foi informado a senha! ");            
        }
        
        if(nome==null || nome.isEmpty() || nome.equals("") ){
            throw new Exception("Não foi informado o nome! ");            
        }
        try {
        Login login = new Login();
        login.setCpf(username);
        login.setSenha(senha);
        login.setNome(nome);
        
        em.getTransaction().begin(); 
        em.persist(login);
        }catch(PersistenceException erro){           
            throw new Exception(erro);            
        }        
        
        em.getTransaction().commit();
        
        em.clear();
        em.close();              
        
    }
    public void editLogin (String idlogin, String username, String senha, String nome) throws Exception{ 
        EntityManager em = emf.createEntityManager();
        if(idlogin==null || idlogin.isEmpty() || idlogin.equals("") ){
            throw new Exception("Não foi informado o idlogin! ");            
        }
        if(username==null || username.isEmpty() || username.equals("") ){
            throw new Exception ("Não foi informado o cpf!");             
        }       
        if(senha==null || senha.isEmpty() || senha.equals("") ){
            throw new Exception("Não foi informado a senha! ");            
        }
        
        if(nome==null || nome.isEmpty() || nome.equals("") ){
            throw new Exception("Não foi informado o nome! ");            
        }
        try {
        Login login = em.find(Login.class, Long.valueOf(idlogin));                
        login.setCpf(username);
        login.setSenha(senha);
        login.setNome(nome);
        
        em.getTransaction().begin(); 
        em.merge(login);
        }catch(PersistenceException erro){           
            throw new Exception(erro);            
        }        
        
        em.getTransaction().commit();
        
        em.clear();
        em.close();              
        
    }
    public Login getLogin(String idlogin)throws Exception{
        Login login;
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        
        login = em.find(Login.class, Long.valueOf(idlogin));
        em.getTransaction().commit();
        em.clear();
        em.close();
        
        if(login==null   || login.equals("") ){
            throw new Exception("Erro ao carregar Login, ID não foi informado");            
        }        
        return login;
    }
    public List<Login> getLogin(String username, String senha) throws Exception {
        List<Login> Login;
        EntityManager em = emf.createEntityManager(); 
        em.getTransaction().begin();
         
        Login = em.createNativeQuery("SELECT log.nome FROM tb_login log where log.cpf=:cpf and log.senha=:senha")
                                .setParameter("cpf", username)
                                .setParameter("senha", senha)
                                .getResultList();

        em.getTransaction().commit();
        em.clear();
        em.close();
        
        if(Login == null || Login.isEmpty()){
          throw new Exception("Sem resultado");
                    
         }
        
        
        
        
        return Login;
        
        

    }
}
