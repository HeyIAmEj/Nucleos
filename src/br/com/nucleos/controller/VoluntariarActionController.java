package br.com.nucleos.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import br.com.nucleos.dao.DoadoresDAO;
import br.com.nucleos.model.Voluntariar;

@WebServlet({"/d/voluntariarform"})
public class VoluntariarActionController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		req.setCharacterEncoding("UTF-8");

		String funcao = req.getParameter("funcao");
		String caracteristicas = req.getParameter("caracteristicas");
		String disponibilidade = req.getParameter("disponibilidade");
		String descricao = req.getParameter("descricao");


		System.out.println("teste CHEGOU AQUI VEI AAAA");
		
		int ongId = Integer.parseInt(req.getParameter("fk_ong"));
		int doadorId = Integer.parseInt(req.getParameter("fk_doador"));
		int perm = Integer.parseInt(req.getParameter("perm"));

		System.out.println(ongId);
		System.out.println(doadorId);
		System.out.println(perm);
		
		if (perm == 1) {
			DoadoresDAO doadoresDAO = new DoadoresDAO();
			Voluntariar voluntariar = new Voluntariar(funcao, disponibilidade, caracteristicas, descricao, doadorId, ongId);
			boolean sucess = doadoresDAO.voluntariarAction(voluntariar);
			if (sucess) {
				session.setAttribute("erro", "");
				System.out.println("Add com sucesso!");
				resp.sendRedirect("./historicousuarios.jsp");
			} else {
				System.out.println("Erro ao Add!");
				session.setAttribute("erro", "Erro ao cadastrar doacao. Tente Novamente!");
				resp.sendRedirect("./doar.jsp");
			}
		}
	}
}
