package br.com.nucleos.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.com.nucleos.dao.DoacaoDAO;
import br.com.nucleos.dao.DoadoresDAO;
import br.com.nucleos.dao.EmpresasDAO;
import br.com.nucleos.dao.OngDAO;
import br.com.nucleos.model.Doacao_Doadores;
import br.com.nucleos.model.Doacao_Empresas;
import br.com.nucleos.model.Doadores;
import br.com.nucleos.model.Empresas;
import br.com.nucleos.model.Ong;

@WebFilter({ "/o/historicoempresas.jsp", "/o/historicousuarios.jsp", "/d/historicoempresas.jsp", "/d/historicousuarios.jsp", "/e/historicoempresas.jsp", "/e/historicousuarios.jsp",})
public class DoacaoViewFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;
		HttpSession session = httpRequest.getSession(false);
		ArrayList<List<String>> newlistaDoacaoDoadores = new ArrayList<>();
		ArrayList<List<String>> newlistaDoacaoEmpresas = new ArrayList<>();
		boolean isLoggedIn = (session != null && session.getAttribute("user") != null);

		boolean endsWithEmpresas = httpRequest.getRequestURI().endsWith("historicoempresas.jsp");

		
		
		if (isLoggedIn) {
			if (endsWithEmpresas) {
				System.out.println("Chegou em ends with empresas");
				DoacaoDAO doacaoDAO = new DoacaoDAO();
				List<Doacao_Empresas> listaDoacaoEmpresas = doacaoDAO.getAllDoacaoEmpresas();
				OngDAO ongDAO = new OngDAO();
				List<Ong> listaOng = ongDAO.getAllOng();
				EmpresasDAO empresasDAO = new EmpresasDAO();
				List<Empresas> listaEmpresas = empresasDAO.getAllEmpresas();
				
				for (Doacao_Empresas de : listaDoacaoEmpresas) {
					List union = new ArrayList();
					System.out.println("Empresa Doacao Empresas: "+de.getFk_empresas_doacao_empresas());
					System.out.println("Ong Doacao Empresas: "+de.getFk_ong_doacao_empresas());
					Empresas empresa = listaEmpresas.get((de.getFk_empresas_doacao_empresas() - 1));
					Ong ong = listaOng.get((de.getFk_ong_doacao_empresas() - 1));

					String nomeDoador;
					String sobrenomeDoador;
					String imgDoador;
					if (de.getIsAnonimo().contains("sim")) {
						nomeDoador = "Anônimo";
						imgDoador = "/NucleosApp/img/user.jpg";

					}else {
						nomeDoador = empresa.getNome();
						imgDoador = empresa.getImg_src();
					}
					

					int idDoador = empresa.getId();

					String nomeOng = ong.getNome();
					int idOng = ong.getId();

					union.add(nomeDoador);
					union.add(idDoador);
					union.add(imgDoador);

					union.add(nomeOng);
					union.add(idOng);

					union.add(de.getDoacao());
					union.add(String.valueOf(de.getQuantidade()));
					union.add(de.getMensagem());
					union.add(de.getData());
					
					newlistaDoacaoEmpresas.add(union);
				}
				session.setAttribute("listaDoacoesEmpresas", newlistaDoacaoEmpresas);
				chain.doFilter(request, response);

			}else {
				DoacaoDAO doacaoDAO = new DoacaoDAO();
				List<Doacao_Doadores> listaDoacaoDoadores = doacaoDAO.getAllDoacaoDoadores();
				OngDAO ongDAO = new OngDAO();
				List<Ong> listaOng = ongDAO.getAllOng();
				DoadoresDAO doadoresDAO = new DoadoresDAO();
				List<Doadores> listaDoadores = doadoresDAO.getAllDoadores();
				
				for (Doacao_Doadores dd : listaDoacaoDoadores) {
					List union = new ArrayList();
					System.out.println("Doador Doacao Doadores: "+dd.getFk_doadores_doacao_doadores());
					System.out.println("Ong Doacao Doadores: "+dd.getFk_ong_doacao_doadores());
					Doadores doadores = listaDoadores.get((dd.getFk_doadores_doacao_doadores() - 1));
					Ong ong = listaOng.get((dd.getFk_ong_doacao_doadores() - 1));
					String nomeDoador;
					String sobrenomeDoador;
					String imgDoador;
					if (dd.getIsAnonimo().contains("sim")) {
						nomeDoador = "Anônimo";
						sobrenomeDoador = "";
						imgDoador = "/NucleosApp/img/user.jpg";

					}else {
						nomeDoador = doadores.getNome();
						sobrenomeDoador = doadores.getSobrenome();
						imgDoador = doadores.getImg_src();

					}
					
					
					int idDoador = doadores.getId();

					String nomeOng = ong.getNome();
					int idOng = ong.getId();

					union.add(nomeDoador+" "+sobrenomeDoador);
					union.add(idDoador);
					union.add(imgDoador);

					union.add(nomeOng);
					union.add(idOng);

					union.add(dd.getDoacao());
					union.add(String.valueOf(dd.getQuantidade()));
					union.add(dd.getMensagem());
					union.add(dd.getData());
					
					newlistaDoacaoDoadores.add(union);

				}
				session.setAttribute("listaDoacoesDoadores", newlistaDoacaoDoadores);
				chain.doFilter(request, response);

			}
		} else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("./na.jsp");
			dispatcher.forward(request, response);
		}

	}
}
