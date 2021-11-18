package br.com.nucleos.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.SecondaryTable;
import javax.persistence.Table;

@Entity(name = "Doacao_Empresas")
@Table(name = "doacao_empresas")
public class Doacao_Empresas {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", nullable = false, unique = true)
	private int id;

	@Column(name = "doacao", unique = false)
	private String doacao;

	@Column(name = "quantidade", unique = false)
	private int quantidade;

	@Column(name = "mensagem", unique = false)
	private String mensagem;
	
	@Column(name = "data", unique = false)
	private String data;
	
	@Column(name = "estado", unique = false)
	private String estado;
	
	@Column(name = "entrega", unique = false)
	private String entrega;

	@Column(name = "isAnonimo", unique = false)
	private String isAnonimo;
	
	@Column(name = "fk_empresas_doacao_empresas", unique = false)
	private int fk_empresas_doacao_empresas;
	
	@Column(name = "fk_ong_doacao_empresas", unique = false)
	private int fk_ong_doacao_empresas;

	
	
	public String getIsAnonimo() {
		return isAnonimo;
	}

	public void setIsAnonimo(String isAnonimo) {
		this.isAnonimo = isAnonimo;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDoacao() {
		return doacao;
	}

	public void setDoacao(String doacao) {
		this.doacao = doacao;
	}

	public int getQuantidade() {
		return quantidade;
	}

	public void setQuantidade(int quantidade) {
		this.quantidade = quantidade;
	}

	public String getMensagem() {
		return mensagem;
	}

	public void setMensagem(String mensagem) {
		this.mensagem = mensagem;
	}

	public String getData() {
		return data;
	}

	public void setData(String data) {
		this.data = data;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public String getEntrega() {
		return entrega;
	}

	public void setEntrega(String entrega) {
		this.entrega = entrega;
	}

	public int getFk_empresas_doacao_empresas() {
		return fk_empresas_doacao_empresas;
	}

	public void setFk_empresas_doacao_empresas(int fk_empresas_doacao_empresas) {
		this.fk_empresas_doacao_empresas = fk_empresas_doacao_empresas;
	}

	public int getFk_ong_doacao_empresas() {
		return fk_ong_doacao_empresas;
	}

	public void setFk_ong_doacao_empresas(int fk_ong_doacao_empresas) {
		this.fk_ong_doacao_empresas = fk_ong_doacao_empresas;
	}

	public Doacao_Empresas() {
		super();
	}

	public Doacao_Empresas(String doacao, int quantidade, String mensagem, String data, String estado, String entrega, String isAnonimo,
			int fk_empresas_doacao_empresas, int fk_ong_doacao_empresas) {
		super();
		this.doacao = doacao;
		this.quantidade = quantidade;
		this.mensagem = mensagem;
		this.data = data;
		this.estado = estado;
		this.entrega = entrega;
		this.isAnonimo = isAnonimo;
		this.fk_empresas_doacao_empresas = fk_empresas_doacao_empresas;
		this.fk_ong_doacao_empresas = fk_ong_doacao_empresas;
	}

}
