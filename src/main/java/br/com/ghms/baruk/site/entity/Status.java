/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.ghms.baruk.site.entity;

import java.io.Serializable;
import java.util.List;
import java.util.Objects;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author alephtav
 */
@Entity
@Table(name="tb_status")
public class Status implements Serializable {
     @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
     @Column(unique=true)
    private Long idstatus;
     @Column(unique=true)
    private String nstatus;   
    private String valor;
     @Column(unique=true)
    private String descricao;
    private String cor;
    
    @OneToMany(mappedBy = "status")
    private List<Encomenda> encomenda ;

    public List<Encomenda> getEncomenda() {
        return encomenda;
    }

    public void setEncomenda(List<Encomenda> encomenda) {
        this.encomenda = encomenda;
    }

        
    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getCor() {
        return cor;
    }

    public void setCor(String cor) {
        this.cor = cor;
    }
    
    
    public Long getIdstatus() {
        return idstatus;
    }

    public void setIdstatus(Long idstatus) {
        this.idstatus = idstatus;
    }

    public String getNstatus() {
        return nstatus;
    }

    public void setNstatus(String nstatus) {
        this.nstatus = nstatus;
    }

    public String getValor() {
        return valor;
    }

    public void setValor(String valor) {
        this.valor = valor;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 61 * hash + Objects.hashCode(this.idstatus);
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
        final Status other = (Status) obj;
        if (!Objects.equals(this.idstatus, other.idstatus)) {
            return false;
        }
        return true;
    }

    public Status() {
    }
    
    
}
