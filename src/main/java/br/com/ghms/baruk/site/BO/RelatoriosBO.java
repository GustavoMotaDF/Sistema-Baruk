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
        encomenda = em.createNativeQuery("SELECT c.nome, c.cpf, c.endereco, c.telefone, count(e.idencomenda) as qtd, sum(e.valor_adicional+p.valor) FROM tb_cliente c join tb_encomenda e on e.idcliente=c.idcliente join tb_produto p on p.idproduto=e.idproduto where e.idstatus=5 group by c.idcliente order by qtd desc, c.nome;").getResultList();
        em.getTransaction().commit();
        em.clear();
        em.close();

        if (encomenda == null || encomenda.isEmpty() || encomenda.equals("") || encomenda.size() < 1) {
            throw new Exception(" Nada aqui por enquanto!  :) ");
        }

        return encomenda;
    }
    public List<Encomenda> getPedidosCPF(String consulta) throws Exception {
        List<Encomenda> encomenda;
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        encomenda = em.createNativeQuery("SELECT e.idpesquisa, c.nome, s.descricao, s.nstatus, s.valor, s.cor, p.produto, sum(p.valor+e.valor_adicional), e.observacao, e.data_previsao, e.entrega FROM tb_cliente c join tb_encomenda e on e.idcliente=c.idcliente join tb_produto p on p.idproduto=e.idproduto join tb_status s on s.idstatus=e.idstatus where c.cpf=:consulta and e.idstatus=5 group by e.idencomenda order by e.data_previsao asc;").setParameter("consulta", consulta).getResultList();
        em.getTransaction().commit();
        em.clear();
        em.close();

        if (encomenda == null || encomenda.isEmpty() || encomenda.equals("") || encomenda.size() < 1) {
            throw new Exception(" Ocorreu algum erro!  :) ");
        }

        return encomenda;
    }
    
}
