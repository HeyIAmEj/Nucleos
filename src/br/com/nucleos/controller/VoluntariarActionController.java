package br.com.nucleos.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.com.nucleos.dao.DoacaoDAO;
import br.com.nucleos.dao.DoadoresDAO;
import br.com.nucleos.model.Doacao_Doadores;
import br.com.nucleos.model.Doacao_Empresas;
import br.com.nucleos.model.Voluntariar;

@WebServlet({"/e/voluntariarform", "/d/voluntariarform" })
public class VoluntariarActionController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
        req.setCharacterEncoding("UTF-8");

		String funcao = req.getParameter("funcao");
		String disponibilidade = req.getParameter("disponibilidade");
		String caracteristicas = req.getParameter("caracteristicas");
		String descricao = req.getParameter("descricao");
		int fk_doadores_voluntariar = Integer.parseInt(req.getParameter("fk_doadores_voluntariar"));
		int fk_ong_voluntariar = Integer.parseInt(req.getParameter("fk_ong_voluntariar"));
		int perm = Integer.parseInt(req.getParameter("perm"));

		
		if (perm == 1) {
			DoadoresDAO doadoresDAO = new DoadoresDAO();
			Voluntariar voluntario = new Voluntariar(funcao, disponibilidade, caracteristicas
					, descricao, fk_doadores_voluntariar, fk_ong_voluntariar);
			
			boolean sucess = doadoresDAO.inserirVoluntario(voluntario);
			
			if (sucess) {
				session.setAttribute("erro", "");
				System.out.println("Adicionado com Sucesso!");
				resp.sendRedirect("./index.jsp");
			} else {
				System.out.println("Erro ao Adicionar!");
				session.setAttribute("erro", "Erro ao cadastrar voluntario. Tente Novamente!");
				resp.sendRedirect("./voluntariar.jsp");
			}
		} else {

			DoadoresDAO doadoresDAO = new DoadoresDAO();
			Voluntariar voluntario = new Voluntariar(funcao, disponibilidade, caracteristicas
					, descricao, fk_doadores_voluntariar, fk_ong_voluntariar);
			boolean sucess = doadoresDAO.inserirVoluntario(voluntario);
			if (sucess) {
				session.setAttribute("erro", "");
				System.out.println("Adicionado com Sucesso!");
				resp.sendRedirect("./index.jsp");
			} else {
				System.out.println("Erro ao adicionar!");
				session.setAttribute("erro", "Erro ao cadastrar voluntario. Tente Novamente!");
				resp.sendRedirect("./voluntariar.jsp");
			}

		}

	}
}
