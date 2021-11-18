package br.com.nucleos.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.nucleos.dao.DoadoresDAO;
import br.com.nucleos.dao.EmpresasDAO;
import br.com.nucleos.dao.OngDAO;
import br.com.nucleos.model.Doadores;
import br.com.nucleos.model.Empresas;
import br.com.nucleos.model.Ong;

@WebServlet({ "/Cadastro", "/cadastro.do" })
public class CadastroController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	OngDAO ongDAO = new OngDAO();
	EmpresasDAO empresasDAO = new EmpresasDAO();
	DoadoresDAO doadoresDAO = new DoadoresDAO();
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

		String tipoUser = request.getParameter("tipoUser");

		if (tipoUser.equals("3")) {
			String nome = request.getParameter("nome3");
			String email = request.getParameter("email3");
			String senha = request.getParameter("senha3");
			senha =  Criptografia.criptografar(senha);
			String registro_instituicao = request.getParameter("registro_instituicao3");
			String telefone = request.getParameter("telefone3");
			String img_src = "/NucleosApp/img/user.jpg";
			String descricao = request.getParameter("descricao3");
			String bairro = request.getParameter("bairro3");
			int permissao = 3;
			Ong ong = new Ong(nome, email, senha, registro_instituicao, telefone, img_src, descricao, bairro,
					permissao);
			try {
				ongDAO.inserirOng(ong);
				System.out.println("Inserido com sucesso!");
				response.sendRedirect("./index.jsp");
			} catch (Exception e) {
				System.out.println("Erro ao inserir!");

			}

		} else if (tipoUser.equals("2")) {
			String nome = request.getParameter("nome2");
			String email = request.getParameter("email2");
			String senha = request.getParameter("senha2");
			senha =  Criptografia.criptografar(senha);
			String cnpj = request.getParameter("cnpj2");
			String telefone = request.getParameter("telefone2");
			String img_src = "/NucleosApp/img/user.jpg";
			String bairro = request.getParameter("bairro2");
			int permissao = 2;
			Empresas empresas = new Empresas(nome, email, senha, cnpj, telefone, img_src, bairro, permissao);
			try {
				empresasDAO.inserirEmpresas(empresas);
				System.out.println("Inserido com sucesso!");
				response.sendRedirect("./index.jsp");
			} catch (Exception e) {
				System.out.println("Erro ao inserir!");

			}
		} else {
			System.out.println("Usuario Normal");
			String nome = request.getParameter("nome1");
			String sobrenome = request.getParameter("sobrenome1");
			String email = request.getParameter("email1");
			String senha = request.getParameter("senha1");
			senha =  Criptografia.criptografar(senha);
			String cpf = request.getParameter("cpf1");
			String celular = request.getParameter("celular1");
			String img_src = "/NucleosApp/img/user.jpg";
			String bairro = request.getParameter("bairro1");
			int permissao = 1;
			Doadores doadores = new Doadores(nome, sobrenome, email, senha, cpf, celular, img_src, bairro, permissao);
			try {
				doadoresDAO.inserirDoador(doadores);
				System.out.println("Inserido com sucesso!");
				response.sendRedirect("./index.jsp");
			} catch (Exception e) {
				System.out.println("Erro ao inserir!");

			}
		}

	}

}
