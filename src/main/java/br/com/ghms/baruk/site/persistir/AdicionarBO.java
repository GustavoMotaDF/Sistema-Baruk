/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.ghms.baruk.site.persistir;

import br.com.ghms.baruk.site.BO.StatusBO;
import br.com.ghms.baruk.site.entity.Status;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 *
 * @author suporte
 */
public class AdicionarBO {
    private static final EntityManagerFactory emf
            = Persistence.createEntityManagerFactory("barukup");
     public static void main(String[] args) {
         
        
         StatusBO statusbo = new StatusBO();
         statusbo.InsercaoAuto();
        
     
     }

    
    
}
