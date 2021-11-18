package br.com.nucleos.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity(name = "Voluntariar")
@Table(name = "voluntariar")
public class Voluntariar {
	
	@Id
	@GeneratedValue (strategy=GenerationType.IDENTITY)
	@Column(name="id", nullable=false, unique=true)
	private int id;
	
	@Column(name="funcao", unique=false)
	private String funcao;
	
	@Column(name="disponibilidade", unique=false)
	private String disponibilidade;

	@Column(name="caracteristicas", unique=false)
	private String caracteristicas;
	
	@Column(name="descricao", unique=false)
	private String descricao;
	
	@Column(name="fk_doadores_voluntariar", unique=false)
	private int fk_doadores_voluntariar;
	
	@Column(name="fk_ong_voluntariar", unique=false)
	private int fk_ong_voluntariar;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFuncao() {
		return funcao;
	}

	public void setFuncao(String funcao) {
		this.funcao = funcao;
	}

	public String getDisponibilidade() {
		return disponibilidade;
	}

	public void setDisponibilidade(String disponibilidade) {
		this.disponibilidade = disponibilidade;
	}

	public String getCaracteristicas() {
		return caracteristicas;
	}

	public void setCaracteristicas(String caracteristicas) {
		this.caracteristicas = caracteristicas;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public int getFk_doadores_voluntariar() {
		return fk_doadores_voluntariar;
	}

	public void setFk_doadores_voluntariar(int fk_doadores_voluntariar) {
		this.fk_doadores_voluntariar = fk_doadores_voluntariar;
	}

	public int getFk_ong_voluntariar() {
		return fk_ong_voluntariar;
	}

	public void setFk_ong_voluntariar(int fk_ong_voluntariar) {
		this.fk_ong_voluntariar = fk_ong_voluntariar;
	}

	public Voluntariar(String funcao, String disponibilidade, String caracteristicas, String descricao,
			int fk_doadores_voluntariar, int fk_ong_voluntariar) {
		this.funcao = funcao;
		this.disponibilidade = disponibilidade;
		this.caracteristicas = caracteristicas;
		this.descricao = descricao;
		this.fk_doadores_voluntariar = fk_doadores_voluntariar;
		this.fk_ong_voluntariar = fk_ong_voluntariar;
	}

	
	
	public Voluntariar(int id, String funcao, String disponibilidade, String caracteristicas, String descricao,
			int fk_doadores_voluntariar, int fk_ong_voluntariar) {
		super();
		this.id = id;
		this.funcao = funcao;
		this.disponibilidade = disponibilidade;
		this.caracteristicas = caracteristicas;
		this.descricao = descricao;
		this.fk_doadores_voluntariar = fk_doadores_voluntariar;
		this.fk_ong_voluntariar = fk_ong_voluntariar;
	}

	public Voluntariar() {
		super();
	}

	
	
}
