/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.ghms.baruk.site.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;
import java.util.Objects;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import org.hibernate.annotations.SQLDelete;

/**
 *
 * @author suporte
 */
@Entity
@Table(name="tb_produto")
@SQLDelete(sql = "update tb_produto set ativo = 0 where idproduto = ?")
public class Produto implements Serializable {
     @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idproduto;
    private String produto;
    private String descricao;
    private BigDecimal valor;
    private String tproducao;
    private Boolean ativo;

    public Boolean getAtivo() {
        return ativo;
    }

    public void setAtivo(Boolean ativo) {
        this.ativo = ativo;
    }   
    
    
    
    @OneToMany(mappedBy = "produto")
    private List<Encomenda> encomenda ;

    public List<Encomenda> getEncomenda() {
        return encomenda;
    }

    public void setEncomenda(List<Encomenda> encomenda) {
        this.encomenda = encomenda;
    }
    
    
    public Long getIdproduto() {
        return idproduto;
    }

    public void setIdproduto(Long idproduto) {
        this.idproduto = idproduto;
    }

    public String getProduto() {
        return produto;
    }

    public void setProduto(String produto) {
        this.produto = produto;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public BigDecimal getValor() {
        return valor;
    }

    public void setValor(BigDecimal valor) {
        this.valor = valor;
    }

    public String getTproducao() {
        return tproducao;
    }

    public void setTproducao(String tproducao) {
        this.tproducao = tproducao;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 67 * hash + Objects.hashCode(this.idproduto);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Produto other = (Produto) obj;
        if (!Objects.equals(this.idproduto, other.idproduto)) {
            return false;
        }
        return true;
    }

    public Produto() {
    }
    
    
}
