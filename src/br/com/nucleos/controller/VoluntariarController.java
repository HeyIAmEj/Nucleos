package br.com.nucleos.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.com.nucleos.dao.OngDAO;
import br.com.nucleos.model.Ong;

@WebServlet({ "/d/voluntariar" })
public class VoluntariarController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private Ong ong = new Ong();
	private OngDAO ongDAO = new OngDAO();
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

		System.out.println("Chegou request para doar.jsp");
		
		HttpSession session = request.getSession(false);
		boolean isLoggedIn = (session != null && session.getAttribute("user") != null);

		if (isLoggedIn) {
			String id = request.getParameter("id");
			ong = ongDAO.getOngById(Integer.parseInt(id));
			
			session.setAttribute("id", id);
			session.setAttribute("nomeOng", ong.getNome());
			session.setAttribute("descricaoOng", ong.getDescricao());
			
			ongDAO = new OngDAO();
			RequestDispatcher dispatcher = request.getRequestDispatcher("./voluntariar.jsp");
			dispatcher.forward(request, response);
		}else {
			response.sendRedirect("/NucleosApp/index.jsp");
		}
		
	}

}
