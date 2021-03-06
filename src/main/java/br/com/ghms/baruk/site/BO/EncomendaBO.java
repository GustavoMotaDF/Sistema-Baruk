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
import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Random;
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

    public List<Encomenda> getCanceladas() throws Exception {
        List<Encomenda> encomenda;
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        encomenda = em.createQuery("from Encomenda where idstatus= 6 ").getResultList();
        em.getTransaction().commit();
        em.clear();
        em.close();
        if (encomenda == null || encomenda.isEmpty() || encomenda.equals("")) {
            throw new Exception("Sem Encomedas Canceladas registradas!");
        }
        return encomenda;
    }

    public List<Encomenda> getProducao() throws Exception {
        List<Encomenda> encomenda;
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        encomenda = em.createQuery("from Encomenda where idstatus= 2 ").getResultList();
        em.getTransaction().commit();
        em.clear();
        em.close();
        if (encomenda == null || encomenda.isEmpty() || encomenda.equals("")) {
            throw new Exception("Sem Encomedas Em Produ????o registradas!");
        }
        return encomenda;
    }

    public List<Encomenda> getFinal() throws Exception {
        List<Encomenda> encomenda;
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        encomenda = em.createQuery("from Encomenda where idstatus= 3 ").getResultList();
        em.getTransaction().commit();
        em.clear();
        em.close();
        if (encomenda == null || encomenda.isEmpty() || encomenda.equals("")) {
            throw new Exception("Sem Encomedas Em Fase Final registradas!");
        }
        return encomenda;
    }

    public List<Encomenda> getFinalizada() throws Exception {
        List<Encomenda> encomenda;
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        encomenda = em.createQuery("from Encomenda where idstatus= 4 ").getResultList();
        em.getTransaction().commit();
        em.clear();
        em.close();
        if (encomenda == null || encomenda.isEmpty() || encomenda.equals("")) {
            throw new Exception("Sem Encomedas Finalizadas registradas!");
        }
        return encomenda;
    }

    public List<Encomenda> getEntregue() throws Exception {
        List<Encomenda> encomenda;
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        encomenda = em.createQuery("from Encomenda where idstatus= 5 ").getResultList();
        em.getTransaction().commit();
        em.clear();
        em.close();
        if (encomenda == null || encomenda.isEmpty() || encomenda.equals("")) {
            throw new Exception("Sem Encomedas Entregues registradas!");
        }
        return encomenda;
    }

    public List<Encomenda> getSolicitada() throws Exception {
        List<Encomenda> encomenda;
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        encomenda = em.createQuery("from Encomenda where idstatus= 1 ").getResultList();
        em.getTransaction().commit();
        em.clear();
        em.close();
        if (encomenda == null || encomenda.isEmpty() || encomenda.equals("")) {
            throw new Exception("Sem Encomedas Solicitadas registradas!");
        }
        return encomenda;
    }

    public void cadEncomenda(String idcliente,
            String entrega, String status,
            String idproduto, String data_previsao,
            String observacao, String valor_adicional) throws Exception {
        EntityManager em = emf.createEntityManager();
        if (idcliente == null || idcliente.isEmpty() || idcliente.equals("")) {
            throw new Exception("N??o foi informado o idcliente ");
        }
        if (entrega == null || entrega.isEmpty() || entrega.equals("")) {
            throw new Exception("N??o foi informado o entrega ");
        }
        if (status == null || status.isEmpty() || status.equals("")) {
            throw new Exception("N??o foi informado o status ");
        }
        if (idproduto == null || idproduto.isEmpty() || idproduto.equals("")) {
            throw new Exception("N??o foi informado o idproduto ");
        }
        if (data_previsao == null || data_previsao.isEmpty() || data_previsao.equals("")) {
            throw new Exception("N??o foi informado o data_previsao ");
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
        BigDecimal valorokk = new BigDecimal(valor_adicional);
        encomenda.setValor_adicional(valorokk);
        encomenda.setObservacao(observacao);
        
       Random random = new Random();
       String randonlimit = null;  
       String randonlimit2 = null;  
       for(int idpesquis = 0; idpesquis <= 10; idpesquis++){
           
            int randon = random.nextInt(999999999);
            int randon2 = random.nextInt(555666888);
            
            idpesquis = randon*(random.nextInt(999999999))*(random.nextInt(9));
            int idpesquis2 = randon2*(random.nextInt(555666888))*(random.nextInt(9));
            if(idpesquis < 0){
               idpesquis = idpesquis*-1;
            }
             if(idpesquis2 < 0){
               idpesquis2 = idpesquis2*-1;
            }
            
            String parsee = Integer.toString(idpesquis);
            String parsee2 = Integer.toString(idpesquis2);
            
            randonlimit = parsee.length() <= 4 ? parsee : parsee.substring(0, 4);
            randonlimit2 = parsee2.length() <= 4 ? parsee2 : parsee2.substring(0, 4);
            
           
       }       
        int randon3 = random.nextInt(9);        
        String idpesquisa = "BA" + randonlimit+randon3+randonlimit2+"RUK";


        encomenda.setIdpesquisa(idpesquisa);

        em.persist(encomenda);
        em.getTransaction().commit();

        em.clear();
        em.close();

    }

    public void editEncomenda(String idencomenda, String idcliente, String entrega, String status, String idproduto, String data_previsao, String observacao, String valor_adicional) throws Exception {
        EntityManager em = emf.createEntityManager();
        if (idencomenda == null || idencomenda.isEmpty() || idencomenda.equals("")) {
            throw new Exception("N??o foi informado o idencomenda da Encomenda!");
        }
        if (idcliente == null || idcliente.isEmpty() || idcliente.equals("")) {
            throw new Exception("N??o foi informado o idcliente do Cliente!");
        }
        if (idproduto == null || idproduto.isEmpty() || idproduto.equals("")) {
            throw new Exception("N??o foi informado o idproduto ");
        }
        if (data_previsao == null || data_previsao.isEmpty() || data_previsao.equals("")) {
            throw new Exception("N??o foi informado se o pedido ?? para entrega!");
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
         BigDecimal valorokk = new BigDecimal(valor_adicional);
        encomenda.setValor_adicional(valorokk);
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
            throw new Exception("Erro ao carregar Encomenda, ID n??o foi informado");
        }
        return encomenda;
    }

    public List<Encomenda> getEncomendaIdpesquisa(String idpesquisa) throws Exception {
        List<Encomenda> encomenda;
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        encomenda = em.createNativeQuery("SELECT e.idpesquisa, e.entrega, e.data_previsao, e.observacao, c.nome, p.produto, s.nstatus, s.descricao, s.cor, s.valor from tb_encomenda e join tb_cliente c on c.idcliente=e.idcliente join tb_produto p on p.idproduto=e.idproduto join tb_status s on s.idstatus=e.idstatus  where e.idpesquisa =:idpesquisa ;").setParameter("idpesquisa", idpesquisa).getResultList();
        em.getTransaction().commit();
        em.clear();
        em.close();

        if (encomenda == null || encomenda.isEmpty() || encomenda.equals("") || encomenda.size() < 1) {
            throw new Exception("Sem Encomedas registradas com o codigo informado! <br>Caso isso seja um engano, entre em contato conosco informando o problema!<br>Nossas redes sociais estar??o abaixo <3");
        }

        return encomenda;
    }
    //query para qtd de encomendas por produto e valor ganho
    //select distinctrow  p.idproduto, p.produto, sum(p.valor), count(distinct  e.idencomenda) as qtd from tb_encomenda e join tb_produto p on e.idproduto=p.idproduto group by e.idproduto;
    
    //query para qtd de encomendas por produto e valor ganho com filtro de status
    //select distinctrow  p.idproduto, p.produto, sum(p.valor), count(distinct  e.idencomenda) as qtd, s.nstatus  from tb_encomenda e join tb_produto p on e.idproduto=p.idproduto join tb_status s on s.idstatus=e.idstatus where e.idstatus=2 group by e.idproduto ;
}
