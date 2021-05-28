/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.ghms.baruk.site.BO;

import br.com.ghms.baruk.site.entity.Encomenda;
import br.com.ghms.baruk.site.entity.Login;
import br.com.ghms.baruk.site.entity.Produto;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

/**
 *
 * @author suporte
 */
public class ProdutoBO {

    private static final EntityManagerFactory emf
            = Persistence.createEntityManagerFactory("barukup");

    public List<Produto> getProdutos() throws Exception {
        List<Produto> produto;
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        produto = em.createQuery("from Produto where ativo = 1").getResultList();
        em.getTransaction().commit();
        em.clear();
        em.close();

        if (produto == null || produto.isEmpty() || produto.equals("")) {
            throw new Exception("Sem Produto registrados!");
        }

        return produto;
    }
    public List<Produto> getProdutosarq() throws Exception {
        List<Produto> produto;
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        produto = em.createQuery("from Produto where ativo = 0").getResultList();
        em.getTransaction().commit();
        em.clear();
        em.close();

        if (produto == null || produto.isEmpty() || produto.equals("")) {
            throw new Exception("Sem Produto registrados!");
        }

        return produto;
    }

    public void cadProduto(String produto, String descricao, String valor, String tproducao) throws Exception {
        EntityManager em = emf.createEntityManager();
        if (valor == null || valor.isEmpty() || valor.equals("")) {
            throw new Exception("Não foi informado o cliente da Encomenda!");
        }
        if (produto == null || produto.isEmpty() || produto.equals("")) {
            throw new Exception("Não foi informado o telefone do Cliente!");
        }
        
        em.getTransaction().begin();
        Produto produtos = new Produto();
        produtos.setProduto(produto);
        produtos.setDescricao(descricao);
        BigDecimal valorok = new BigDecimal(valor);
        produtos.setValor(valorok);
        produtos.setTproducao(tproducao);
        produtos.setAtivo(Boolean.TRUE);
        
        em.persist(produtos);
        em.getTransaction().commit();

        em.clear();
        em.close();

    }

    public void editProduto(String idproduto, String produto, String descricao, String valor, String tproducao) throws Exception {
        EntityManager em = emf.createEntityManager();
        if (valor == null || valor.isEmpty() || valor.equals("")) {
            throw new Exception("Não foi informado o valor do produto!");
        }
        if (produto == null || produto.isEmpty() || produto.equals("")) {
            throw new Exception("Não foi informado o nome do Produto!");
        }
        em.getTransaction().begin();

        Produto produtos = em.find(Produto.class, Long.valueOf(idproduto));
        produtos.setProduto(produto);
        produtos.setDescricao(descricao);
        BigDecimal valorok = new BigDecimal(valor);
        produtos.setValor(valorok);
        produtos.setTproducao(tproducao);

        em.merge(produtos);
        em.getTransaction().commit();

        em.clear();
        em.close();

    }
    public Produto getProduto(String idproduto)throws Exception{
        Produto produto;
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        
        produto = em.find(Produto.class,Long.valueOf(idproduto));
        em.getTransaction().commit();
        em.clear();
        em.close();
        
        if(produto==null   || produto.equals("") ){
            throw new Exception("Erro ao carregar o Produto, ID não foi informado");            
        }        
        return produto;
    }
    
    public Boolean excluirProduto(String idproduto)throws Exception{
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        
        if(idproduto==null || idproduto.isEmpty() || idproduto.equals("") ){
            throw new Exception("Erro ao desativar Produto, id não foi informado");            
        }
        
        Produto produto = em.getReference(Produto.class, Long.valueOf(idproduto));
        em.remove(produto);
        
        em.getTransaction().commit();
        em.clear();
        em.close();
         
        return true;
        
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
    public void AtivarProduto(String idproduto) throws Exception {
        EntityManager em = emf.createEntityManager();
        
        if (idproduto == null || idproduto.isEmpty() || idproduto.equals("")) {
            throw new Exception("Não foi informado o nome do Produto!");
        }
        em.getTransaction().begin();
        Produto produtos = em.find(Produto.class, Long.valueOf(idproduto));       
        produtos.setAtivo(Boolean.TRUE);

        em.merge(produtos);
        em.getTransaction().commit();

        em.clear();
        em.close();

    }
    
}
