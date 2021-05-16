/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.ghms.baruk.site.entity;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Objects;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

/**
 *
 * @author suporte
 */
@Entity
public class Encomenda implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idencomenda;    
    private String entrega;   
    private LocalDateTime data_solicitacao;
    private LocalDate data_previsao;
    private String observacao;
    
    
    @ManyToOne
    @JoinColumn(name="idproduto")
    private Produto produto;
    
    @ManyToOne
    @JoinColumn(name="idcliente")
    private Cliente cliente;
    
    @ManyToOne
    @JoinColumn(name="idstatus")
    private Status status;

    public String getObservacao() {
        return observacao;
    }

    public void setObservacao(String observacao) {
        this.observacao = observacao;
    }   
    
    public Long getIdencomenda() {
        return idencomenda;
    }

    public void setIdencomenda(Long idencomenda) {
        this.idencomenda = idencomenda;
    }

    public String getEntrega() {
        return entrega;
    }

    public void setEntrega(String entrega) {
        this.entrega = entrega;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

   

    public LocalDateTime getData_solicitacao() {
        return data_solicitacao;
    }

    public void setData_solicitacao(LocalDateTime data_solicitacao) {
        this.data_solicitacao = data_solicitacao;
    }

    public LocalDate getData_previsao() {
        return data_previsao;
    }

    public void setData_previsao(LocalDate data_previsao) {
        this.data_previsao = data_previsao;
    }

    public Produto getProduto() {
        return produto;
    }

    public void setProduto(Produto produto) {
        this.produto = produto;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    @Override
    public int hashCode() {
        int hash = 3;
        hash = 89 * hash + Objects.hashCode(this.idencomenda);
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
        final Encomenda other = (Encomenda) obj;
        if (!Objects.equals(this.idencomenda, other.idencomenda)) {
            return false;
        }
        return true;
    }

    public Encomenda() {
    }
    
        
  }
