package br.com.nucleos.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.com.nucleos.dao.DoadoresDAO;
import br.com.nucleos.dao.EmpresasDAO;
import br.com.nucleos.dao.OngDAO;
import br.com.nucleos.model.Doadores;
import br.com.nucleos.model.Empresas;
import br.com.nucleos.model.Ong;
import br.com.nucleos.model.Usuario;

@WebServlet({ "/o/alterarPerfil", "/e/alterarPerfil", "/d/alterarPerfil" })
public class UpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

		String nome = req.getParameter("alterarNome");
		String sobrenome = req.getParameter("alterarSobrenome");
		String bairro = req.getParameter("alterarBairro");
		String celular = req.getParameter("alterarCelular");
		String descricao = req.getParameter("descricao3");
		
		Ong ongDone = null;
		Empresas empresasDone = null;
		Doadores doadoresDone = null;
		
		HttpSession session = req.getSession();
		String msgErro = "Erro ao alterar dados, tente novamente!";
		req.setAttribute("erroLogin", msgErro);
		
		int perm = (int) session.getAttribute("user-perm");
		
		
		
		if(perm == 3) {
			Ong ong = (Ong) session.getAttribute("user");
			OngDAO ongDAO = new OngDAO();
			ongDone = ongDAO.ongUpdate(ong, nome, bairro, celular, descricao);
			if(ongDone != null) {
				System.out.println("Atualizado com sucesso!");
				session.setAttribute("user", ongDone);
				resp.sendRedirect("./index.jsp");
			}else {
				System.out.println("Erro ao atualizar!");
				String destPage = "ong.jsp";
				RequestDispatcher dispatcher = req.getRequestDispatcher(destPage);
				dispatcher.forward(req, resp);
			}
		}else if (perm == 2) {
			Empresas empresas = (Empresas) session.getAttribute("user");
			EmpresasDAO empresasDAO = new EmpresasDAO();
			empresasDone = empresasDAO.empresasUpdate(empresas, nome, bairro, celular);
			if(empresasDone != null) {
				System.out.println("Atualizado com sucesso!");
				session.setAttribute("user", empresasDone);
				resp.sendRedirect("./index.jsp");
			}else {
				System.out.println("Erro ao atualizar!");
				String destPage = "empresa.jsp";
				RequestDispatcher dispatcher = req.getRequestDispatcher(destPage);
				dispatcher.forward(req, resp);
			}
		}else {
			Doadores doadores = (Doadores) session.getAttribute("user");
			DoadoresDAO doadoresDAO = new DoadoresDAO();
			doadoresDone = doadoresDAO.doadoresUpdate(doadores, nome, sobrenome, bairro, celular);
			if(doadoresDone != null) {
				System.out.println("Atualizado com sucesso!");
				session.setAttribute("user", doadoresDone);
				resp.sendRedirect("./index.jsp");
			}else {
				System.out.println("Erro ao atualizar!");
				String destPage = "user.jsp";
				RequestDispatcher dispatcher = req.getRequestDispatcher(destPage);
				dispatcher.forward(req, resp);
			}
		}
	}

}
