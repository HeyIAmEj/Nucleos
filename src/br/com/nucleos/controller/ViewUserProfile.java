package br.com.nucleos.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.nucleos.dao.DoadoresDAO;
import br.com.nucleos.model.Doadores;

@WebServlet({"/o/verUser"})
public class ViewUserProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

		String id = request.getParameter("id");
		
		DoadoresDAO doadoresDAO = new DoadoresDAO();
		Doadores doador = new Doadores();
		doador = doadoresDAO.getDoadoresById(Integer.parseInt(id));
		
		request.setAttribute("nome", doador.getNome());
		request.setAttribute("sobrenome", doador.getSobrenome());
		request.setAttribute("email", doador.getEmail());
		request.setAttribute("celular", doador.getCelular());
		request.setAttribute("localizacao", doador.getBairro());
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("./verUser.jsp");
		dispatcher.forward(request, response);
		
		System.out.println(doador);
		
	}

}
