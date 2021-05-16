/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.ghms.baruk.site.BO;

import br.com.ghms.baruk.site.entity.Status;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 *
 * @author alephtav
 */
public class StatusBO {
    
    private static final EntityManagerFactory emf
            = Persistence.createEntityManagerFactory("barukup");
     public List<Status> getStatus() throws Exception {
        List<Status> status;
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        status = em.createQuery("from Status").getResultList();
        em.getTransaction().commit();
        em.clear();
        em.close();

        if (status == null || status.isEmpty() || status.equals("")) {
            throw new Exception("Sem Status registrados!");
        }

        return status;
    }
}
