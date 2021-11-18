package br.com.nucleos.model;



public class Usuario {
    private Ong ong;
    private Empresas empresa;
    private Doadores doadores;
    
	public Usuario(Ong ong) {
		super();
		this.ong = ong;
	}

	public Usuario(Empresas empresa) {
		super();
		this.empresa = empresa;
	}

	public Usuario(Doadores doadores) {
		super();
		this.doadores = doadores;
	}

	public Ong getOng() {
		return ong;
	}

	public void setOng(Ong ong) {
		this.ong = ong;
	}

	public Empresas getEmpresa() {
		return empresa;
	}

	public void setEmpresa(Empresas empresa) {
		this.empresa = empresa;
	}

	public Doadores getDoadores() {
		return doadores;
	}

	public void setDoadores(Doadores doadores) {
		this.doadores = doadores;
	}
    
    
    
}
