package br.com.nucleos.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.User;

import br.com.nucleos.dao.DoacaoDAO;
import br.com.nucleos.dao.DoadoresDAO;
import br.com.nucleos.dao.EmpresasDAO;
import br.com.nucleos.dao.OngDAO;
import br.com.nucleos.model.Doacao_Doadores;
import br.com.nucleos.model.Doacao_Empresas;
import br.com.nucleos.model.Doadores;
import br.com.nucleos.model.Empresas;
import br.com.nucleos.model.Ong;
import br.com.nucleos.model.Usuario;
import br.com.nucleos.model.Voluntariar;

@WebServlet({ "/LoginController", "/login.do", "/o/login.do", "/login" })
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// USUARIO IMPORTS

	// ONG IMPORTS
	private OngDAO ongDAO = new OngDAO();
	private Ong ong = new Ong();

	// DOADORES IMPORTS
	private DoadoresDAO doadoresDAO = new DoadoresDAO();
	private Doadores doadores = new Doadores();

	// EMPRESAS IMPORTS
	private EmpresasDAO empresasDAO = new EmpresasDAO();
	private Empresas empresas = new Empresas();

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

		String yourEmail = request.getParameter("emailLogin");
		String yourPass = request.getParameter("senhaLogin");
		

		System.out.println("Chegou request");

		String destPage = "./login.jsp";

		ongDAO = new OngDAO();
		empresasDAO = new EmpresasDAO();
		doadoresDAO = new DoadoresDAO();

		ong = ongDAO.ongAuth(yourEmail, yourPass);
		doadores = doadoresDAO.doadoresAuth(yourEmail, yourPass);
		empresas = empresasDAO.empresasAuth(yourEmail, yourPass);

		String msgErro = "Email/Senha Incorreto.";
		request.setAttribute("erroLogin", msgErro);
		HttpSession session = request.getSession();

		boolean loginFeito = false;

		DoacaoDAO doacaoDAO = new DoacaoDAO();
		long resultadoQtdPessoas = doacaoDAO.getNumberPeople();
		doacaoDAO = new DoacaoDAO();
		long resultadoQtdEmpresas = doacaoDAO.getNumberEmpresas();
		doacaoDAO = new DoacaoDAO();
		long resultadoQtdOngs = doacaoDAO.getNumberOngs();
		doacaoDAO = new DoacaoDAO();
		long resultadoQtdDoadores = doacaoDAO.getNumberDoadores();

		
		ArrayList<List<String>> newlistaDoacaoDoadores = new ArrayList<>();
		ArrayList<List<String>> newlistaDoacaoEmpresas = new ArrayList<>();
		ArrayList<List<String>> newlistaDoacaoVoluntarios = new ArrayList<>();

		
		if (ong != null) {
			
			doacaoDAO = new DoacaoDAO();
			List<Doacao_Doadores> listaDoacao = doacaoDAO.getOnlyOngDoadores(ong.getId());
			doacaoDAO = new DoacaoDAO();
			List<Doacao_Empresas> listaDoacao2 = doacaoDAO.getOnlyOngEmpresas(ong.getId());
			DoadoresDAO doadoresDAO1 = new DoadoresDAO();
			List<Voluntariar> listaDoacao3 = doadoresDAO1.getAllVoluntarios(ong.getId());

			
			for(Voluntariar v : listaDoacao3) {
				List union = new ArrayList();
				DoadoresDAO doadoresDAO = new DoadoresDAO();
				Doadores doadores = doadoresDAO.getDoadoresById(v.getFk_doadores_voluntariar());
				
				union.add(doadores.getNome());
				union.add(ong.getNome());
				union.add(v.getFuncao());
				union.add(v.getDisponibilidade());
				union.add(v.getCaracteristicas());
				union.add(v.getDescricao());
				union.add(v.getFk_doadores_voluntariar());
	
				newlistaDoacaoVoluntarios.add(union);
			}
			
			for(Doacao_Doadores dd : listaDoacao) {
				List union = new ArrayList();
				DoadoresDAO doadoresDAO = new DoadoresDAO();
				Doadores doadores = doadoresDAO.getDoadoresById(dd.getFk_doadores_doacao_doadores());
				
				union.add(doadores.getNome());
				union.add(ong.getNome());
				union.add(dd.getDoacao());
				union.add(dd.getEstado());
				union.add(dd.getEntrega());
				union.add(dd.getQuantidade());
				union.add(dd.getMensagem());
				union.add(dd.getData());
				union.add(doadores.getId());
				
				newlistaDoacaoDoadores.add(union);
			}
			
			
			for(Doacao_Empresas de : listaDoacao2) {
				List union = new ArrayList();
				EmpresasDAO empresasDAO = new EmpresasDAO();
				Empresas empresas = empresasDAO.getEmpresasById(de.getFk_empresas_doacao_empresas());
				union.add(empresas.getNome());
				union.add(ong.getNome());
				union.add(de.getDoacao());
				union.add(de.getEstado());
				union.add(de.getEntrega());
				union.add(de.getQuantidade());
				union.add(de.getMensagem());
				union.add(de.getData());
				union.add(empresas.getId());
				newlistaDoacaoEmpresas.add(union);
			}
			
			
			
			//System.out.println(newlistaDoacaoEmpresas);
			session.setAttribute("listaVoluntarios", newlistaDoacaoVoluntarios);
			session.setAttribute("listaOngDoacaoDoadores", newlistaDoacaoDoadores);
			session.setAttribute("listaOngDoacaoEmpresas", newlistaDoacaoEmpresas);
		}

		// VERIFICA NA TABELA ONG
		if (loginFeito == false) {
			if (ong == null) {
				ong = new Ong();
				System.out.println("Não existe em Ong Table");
				ongDAO = new OngDAO();

			} else {
				System.out.println("login controller ong session 3");
				loginFeito = true;
				ongDAO = new OngDAO();
				Usuario usuario = new Usuario(ong);

				session.setAttribute("qtdPessoas", resultadoQtdPessoas);
				session.setAttribute("qtdEmpresas", resultadoQtdEmpresas);
				session.setAttribute("qtdOngs", resultadoQtdOngs);
				session.setAttribute("qtdDoadores", resultadoQtdDoadores);

				session.setAttribute("user", usuario.getOng());
				session.setAttribute("user-email", usuario.getOng().getEmail());
				session.setAttribute("user-id", usuario.getOng().getId());
				session.setAttribute("user-perm", usuario.getOng().getPermissao());
				List<Ong> lista = ongDAO.getAllOng();
				session.setAttribute("listaOng", lista);

				destPage = "./o/index.jsp";
				response.sendRedirect(destPage);
			}

			if (loginFeito != true) {

				// VERIFICA NA TABELA EMPRESAS
				if (empresas == null) {
					empresas = new Empresas();
					System.out.println("Não existe em Empresas Table");
					empresasDAO = new EmpresasDAO();

				} else {
					ongDAO = new OngDAO();
					Usuario usuario = new Usuario(empresas);
					loginFeito = true;

					session.setAttribute("qtdPessoas", resultadoQtdPessoas);
					session.setAttribute("qtdEmpresas", resultadoQtdEmpresas);
					session.setAttribute("qtdOngs", resultadoQtdOngs);
					session.setAttribute("qtdDoadores", resultadoQtdDoadores);

					session.setAttribute("user", usuario.getEmpresa());
					session.setAttribute("user-email", usuario.getEmpresa().getEmail());
					session.setAttribute("user-id", usuario.getEmpresa().getId());
					session.setAttribute("user-perm", usuario.getEmpresa().getPermissao());
					List<Ong> lista = ongDAO.getAllOng();
					session.setAttribute("listaOng", lista);

					destPage = "./e/index.jsp";
					response.sendRedirect(destPage);
				}
				if (loginFeito != true) {
					ongDAO = new OngDAO();
					// VERIFICA NA TABELA DOADORES
					if (doadores == null) {
						doadores = new Doadores();
						System.out.println("Não existe em Doadores Table");

						// NAO EXISTE EM NENHUM CANTO, RETORNA ERRO

						destPage = "./login.jsp";
						doadoresDAO = new DoadoresDAO();
						RequestDispatcher dispatcher = request.getRequestDispatcher(destPage);
						dispatcher.forward(request, response);
					} else {
						System.out.println("login controller doadores session 1");
						Usuario usuario = new Usuario(doadores);
						loginFeito = true;

						session.setAttribute("qtdPessoas", resultadoQtdPessoas);
						session.setAttribute("qtdEmpresas", resultadoQtdEmpresas);
						session.setAttribute("qtdOngs", resultadoQtdOngs);
						session.setAttribute("qtdDoadores", resultadoQtdDoadores);

						session.setAttribute("user", usuario.getDoadores());
						session.setAttribute("user-email", usuario.getDoadores().getEmail());
						session.setAttribute("user-id", usuario.getDoadores().getId());
						session.setAttribute("user-perm", usuario.getDoadores().getPermissao());
						List<Ong> lista = ongDAO.getAllOng();
						session.setAttribute("listaOng", lista);

						destPage = "./d/index.jsp";
						response.sendRedirect(destPage);
					}
				}
			}
		}//aqui
	}

	// FUNÇÕES
	public LoginController() {
	}

	public Ong getOng() {
		return ong;
	}

	public void setOng(Ong ong) {
		this.ong = ong;
	}

	public Doadores getDoadores() {
		return doadores;
	}

	public void setDoadores(Doadores doadores) {
		this.doadores = doadores;
	}

	public Empresas getEmpresas() {
		return empresas;
	}

	public void setEmpresas(Empresas empresas) {
		this.empresas = empresas;
	}

}
