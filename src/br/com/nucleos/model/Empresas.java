package br.com.nucleos.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Empresas {

	@Id
	@GeneratedValue (strategy=GenerationType.IDENTITY)
	@Column(name="id", nullable=false, unique=true)
	private int id;
	
	@Column(name="nome", unique=false)
	private String nome;
	
	@Column(name="email", unique=false)
	private String email;
	
	@Column(name="senha", unique=false)
	private String senha;
	
	@Column(name="cnpj", unique=true)
	private String cnpj;
	
	@Column(name="telefone", unique=false)
	private String telefone;
	
	@Column(name="img_src", unique=false)
	private String img_src;
	
	@Column(name="bairro", unique=false)
	private String bairro;	
	
	@Column(name="permissao", unique=false)
	private int permissao;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public String getCnpj() {
		return cnpj;
	}

	public void setCnpj(String cnpj) {
		this.cnpj = cnpj;
	}

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public String getImg_src() {
		return img_src;
	}

	public void setImg_src(String img_src) {
		this.img_src = img_src;
	}

	public String getBairro() {
		return bairro;
	}

	public void setBairro(String bairro) {
		this.bairro = bairro;
	}

	public int getPermissao() {
		return permissao;
	}

	public void setPermissao(int permissao) {
		this.permissao = permissao;
	}

	public Empresas() {

	}

	public Empresas(String nome, String email, String senha, String cnpj, String telefone, String img_src,
			String bairro, int permissao) {
		super();
		this.nome = nome;
		this.email = email;
		this.senha = senha;
		this.cnpj = cnpj;
		this.telefone = telefone;
		this.img_src = img_src;
		this.bairro = bairro;
		this.permissao = permissao;
	}

	
	
}
