package br.com.nucleos.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity(name = "Ong")
@Table(name = "ong")
public class Ong {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name="id", nullable=false, unique=true)
    private int id;

	@Column(name="nome", unique=true)
	private String nome;
	
	@Column(name="email", unique=true)
	private String email;
	
	@Column(name="senha", unique=false)
	private String senha;
	
	@Column(name="registro_instituicao", unique=true)
	private String registro_instituicao;
	
	@Column(name="telefone", unique=false)
	private String telefone;
	
	@Column(name="img_src", unique=false)
	private String img_src;
	
	@Column(name="bairro", unique=false)
	private String bairro;

	@Column(name="descricao", unique=false)
	private String descricao;
	
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

	public String getRegistro_instituicao() {
		return registro_instituicao;
	}

	public void setRegistro_instituicao(String registro_instituicao) {
		this.registro_instituicao = registro_instituicao;
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

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public int getPermissao() {
		return permissao;
	}

	public void setPermissao(int permissao) {
		this.permissao = permissao;
	}
	
	public Ong() {}

	public Ong(String nome, String email, String senha, String registro_instituicao, String telefone,
			String img_src, String bairro, String descricao, int permissao) {
		super();
		this.nome = nome;
		this.email = email;
		this.senha = senha;
		this.registro_instituicao = registro_instituicao;
		this.telefone = telefone;
		this.img_src = img_src;
		this.bairro = bairro;
		this.descricao = descricao;
		this.permissao = permissao;
	}



	
	

}
