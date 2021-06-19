/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.ghms.baruk.site.BO;

import br.com.ghms.baruk.site.entity.Encomenda;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 *
 * @author suporte
 */
public class RelatoriosBO {
    private static final EntityManagerFactory emf
            = Persistence.createEntityManagerFactory("barukup");
    
    public List<Encomenda> getProdutorMaisPedidos() throws Exception {
        List<Encomenda> encomenda;
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        encomenda = em.createNativeQuery("select distinctrow p.idproduto, p.produto, count(distinct  e.idencomenda) as qtd, sum( distinctrow p.valor), sum(p.valor)  from tb_encomenda e join tb_produto p on e.idproduto=p.idproduto join tb_status s on s.idstatus=e.idstatus where e.idstatus=5 group by e.idproduto ;").getResultList();
        em.getTransaction().commit();
        em.clear();
        em.close();

        if (encomenda == null || encomenda.isEmpty() || encomenda.equals("") || encomenda.size() < 1) {
            throw new Exception("Sem produtos encomendados ainda   :(");
        }

        return encomenda;
    }
    
    public List<Encomenda> getClientesPedidos() throws Exception {
        List<Encomenda> encomenda;
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        encomenda = em.createNativeQuery("SELECT distinctrow c.nome, c.cpf, c.telefone, c.endereco, count(distinctrow e.idencomenda) as qtd FROM tb_encomenda e join tb_cliente c on c.idcliente=e.idcliente group by c.idcliente order by qtd desc, c.nome;").getResultList();
        em.getTransaction().commit();
        em.clear();
        em.close();

        if (encomenda == null || encomenda.isEmpty() || encomenda.equals("") || encomenda.size() < 1) {
            throw new Exception("Sem produtos encomendados ainda   :(");
        }

        return encomenda;
    }
}
