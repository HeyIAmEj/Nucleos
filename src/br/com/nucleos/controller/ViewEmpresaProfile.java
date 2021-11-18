package br.com.nucleos.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.nucleos.dao.DoadoresDAO;
import br.com.nucleos.dao.EmpresasDAO;
import br.com.nucleos.model.Empresas;

@WebServlet({"/o/verEmpresa"})
public class ViewEmpresaProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

		String id = request.getParameter("id");
		
		EmpresasDAO empresasDAO = new EmpresasDAO();
		Empresas empresa = new Empresas();
		empresa = empresasDAO.getEmpresasById(Integer.parseInt(id));
		
		request.setAttribute("nome", empresa.getNome());
		request.setAttribute("email", empresa.getEmail());
		request.setAttribute("celular", empresa.getTelefone());
		request.setAttribute("localizacao", empresa.getBairro());
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("./verEmpresa.jsp");
		dispatcher.forward(request, response);
		
		System.out.println(empresa);
		
	}

}
