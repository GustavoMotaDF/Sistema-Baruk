/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.ghms.baruk.site.BO;

import br.com.ghms.baruk.site.entity.Login;
import br.com.ghms.baruk.site.entity.Status;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 *
 * @author suporte
 */
public class GerenciaBO {
     private static final EntityManagerFactory emf
            = Persistence.createEntityManagerFactory("barukup");
    public void InsercaoAuto() {        
        
       EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();

        Status status = new Status();
        status.setNstatus("Encomenda Solicitada");
        status.setDescricao("A sua encomenda foi cadastrada em nosso sistema, em breve iniciaremos a produção!");
        status.setValor("5");
        status.setCor("bg-info");
        em.persist(status);       

        Status status2 = new Status();
        status2.setNstatus("Encomenda em Produção");
        status2.setDescricao("A sua encomenda está em processo de produção, esse processo irá demorar de acordo com a complexidade do que foi encomendado!");
        status2.setValor("25");
        status2.setCor("bg-secondary");
        em.persist(status2);
        
        Status status3 = new Status();
        status3.setNstatus("Encomenda em Fase final");
        status3.setDescricao("A sua encomenda está em fase final de produção. Nesta fase, iremos fazer testes de qualidade, para garantir que erá entregue o que foi encomendado!");
        status3.setValor("50");
        status3.setCor("bg-warning");
        em.persist(status3);
        
        Status status4 = new Status();
        status4.setNstatus("Encomenda finalizada");
        status4.setDescricao("A sua encomenda está pronta!! <3.   Entraremos em contato para lhe avisar!");
        status4.setValor("75");
        status4.setCor("bg-primary");
        em.persist(status4);
        
        Status status5 = new Status();
        status5.setNstatus("Encomenda está entregue");
        status5.setDescricao("A sua encomenda foi entregue!! <3 Qualquer problema, basta nos procurar em nossas redes sociais!");
        status5.setValor("100");
        status5.setCor("bg-success");
        em.persist(status5);
        
        Status status6 = new Status();
        status6.setNstatus("Encomenda cancelada");
        status6.setDescricao("A sua encomenda foi cancelada :( !");
        status6.setValor("100");
        status6.setCor("bg-danger");
        em.persist(status6);
        
        Login login = new Login();
        login.setCpf("055.553.441-39");
        login.setSenha("abduladan");
        login.setNome("Gustavo");
        em.persist(login);
        em.getTransaction().commit();

        em.clear();
        
        System.out.println("nome gerado: " + status.getNstatus());
        System.out.println("nome gerado: " + status2.getNstatus());
        System.out.println("nome gerado: " + status3.getNstatus());
        System.out.println("nome gerado: " + status4.getNstatus());
        System.out.println("nome gerado: " + status5.getNstatus());
        System.out.println("nome gerado: " + status6.getNstatus());
        
        em.close();
        
    }
}
