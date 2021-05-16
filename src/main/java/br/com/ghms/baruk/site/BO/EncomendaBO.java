/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.ghms.baruk.site.BO;

import br.com.ghms.baruk.site.entity.Cliente;
import br.com.ghms.baruk.site.entity.Encomenda;
import br.com.ghms.baruk.site.entity.Produto;
import br.com.ghms.baruk.site.entity.Status;
import java.time.LocalDate;
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

    public List<Encomenda> getEncomendas() throws Exception {
        List<Encomenda> encomenda;
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        encomenda = em.createQuery("from Encomenda").getResultList();
        em.getTransaction().commit();
        em.clear();
        em.close();

        if (encomenda == null || encomenda.isEmpty() || encomenda.equals("")) {
            throw new Exception("Sem Encomedas registradas!");
        }

        return encomenda;
    }

    public void cadEncomenda(String idcliente, 
            String entrega, String status, 
            String idproduto, String data_previsao, 
            String observacao) throws Exception {
        EntityManager em = emf.createEntityManager();
        if (idcliente == null || idcliente.isEmpty() || idcliente.equals("")) {
            throw new Exception("Não foi informado o idcliente ");
        }
        if (entrega == null || entrega.isEmpty() || entrega.equals("")) {
            throw new Exception("Não foi informado o entrega ");
        }
        if (status == null || status.isEmpty() || status.equals("")) {
            throw new Exception("Não foi informado o status ");
        }
        if (idproduto == null || idproduto.isEmpty() || idproduto.equals("")) {
            throw new Exception("Não foi informado o idproduto ");
        }
         if (data_previsao == null || data_previsao.isEmpty() || data_previsao.equals("")) {
            throw new Exception("Não foi informado o data_previsao ");
        }
         if (observacao == null || observacao.isEmpty() || observacao.equals("")) {
            throw new Exception("Não foi informado o observacao ");
        }

        em.getTransaction().begin();

        Encomenda encomenda = new Encomenda();
        Cliente cliente = em.find(Cliente.class, Long.valueOf(idcliente));
        encomenda.setCliente(cliente);     
        Produto produtos = em.find(Produto.class, Long.valueOf(idproduto));
        encomenda.setProduto(produtos);         
        encomenda.setEntrega(entrega);
        Status statuss = em.find(Status.class, Long.valueOf(status));
        encomenda.setStatus(statuss);        
        encomenda.setData_solicitacao(LocalDateTime.now());        
        encomenda.setData_previsao(LocalDate.parse(data_previsao));
        encomenda.setObservacao(observacao);

        em.persist(encomenda);
        em.getTransaction().commit();

        em.clear();
        em.close();

    }

    public void editEncomenda(String idencomenda, String idcliente, String entrega, String status, String idproduto, String data_previsao, String observacao) throws Exception {
        EntityManager em = emf.createEntityManager();
        if (idencomenda == null || idencomenda.isEmpty() || idencomenda.equals("")) {
            throw new Exception("Não foi informado o idencomenda da Encomenda!");
        }
        if (idcliente == null || idcliente.isEmpty() || idcliente.equals("")) {
            throw new Exception("Não foi informado o idcliente do Cliente!");
        }
        if (idproduto == null || idproduto.isEmpty() || idproduto.equals("")) {
            throw new Exception("Não foi informado o idproduto ");
        }
        if (data_previsao == null || data_previsao.isEmpty() || data_previsao.equals("")) {
            throw new Exception("Não foi informado se o pedido é para entrega!");
        }

        em.getTransaction().begin();

        Encomenda encomenda = em.find(Encomenda.class, Long.valueOf(idencomenda));
       Produto produtos = em.find(Produto.class, Long.valueOf(idproduto));
        encomenda.setProduto(produtos);
        Cliente cliente = em.find(Cliente.class, Long.valueOf(idcliente));
        encomenda.setCliente(cliente);        
        encomenda.setEntrega(entrega);
        Status statuss = em.find(Status.class, Long.valueOf(status));
        encomenda.setStatus(statuss);      
        encomenda.setData_previsao(LocalDate.parse(data_previsao));
        encomenda.setObservacao(observacao);

        em.merge(encomenda);
        em.getTransaction().commit();

        em.clear();
        em.close();

    }

    public Encomenda getEncomenda(String idencomenda) throws Exception {
        Encomenda encomenda;
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();

        encomenda = em.find(Encomenda.class, Long.valueOf(idencomenda));
        em.getTransaction().commit();
        em.clear();
        em.close();

        if (encomenda == null || encomenda.equals("")) {
            throw new Exception("Erro ao carregar Encomenda, ID não foi informado");
        }
        return encomenda;
    }
    
    public List<Encomenda> getEncomendaCPF(String cpf) throws Exception {
        List<Encomenda> encomenda;
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        encomenda = em.createNativeQuery("SELECT e.data_previsao, e.observacao, c.nome, s.nstatus, p.produto, s.descricao from Encomenda e join Cliente c on c.idcliente=e.idcliente join Produto p on p.idproduto=e.idproduto join tb_status s on s.idstatus=e.idstatus  where c.cpf = :cpf").setParameter("cpf",cpf).getResultList();
        em.getTransaction().commit();
        em.clear();
        em.close();

        if (encomenda == null || encomenda.isEmpty() || encomenda.equals("")) {
            throw new Exception("Sem Encomedas registradas!");
        }

        return encomenda;
    }

}
