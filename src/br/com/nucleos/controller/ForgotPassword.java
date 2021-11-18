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

@WebServlet("/forgot")
public class ForgotPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

		String documentoForgot = request.getParameter("documentoForgot");
		String emailForgot = request.getParameter("emailForgot");
		String senhaForgot = request.getParameter("senhaForgot");
		String senhaCForgot = request.getParameter("senhaCForgot");
		
		boolean ongDone = false;
		boolean empresasDone = false;
		boolean doadoresDone = false;

		if (senhaForgot.contains(senhaCForgot)) {
			System.out.println("chegou");
			OngDAO ongDAO = new OngDAO();
			ongDone = ongDAO.ongSearch(documentoForgot, emailForgot, senhaForgot);

			EmpresasDAO empresasDAO = new EmpresasDAO();
			empresasDone = empresasDAO.empresasSearch(documentoForgot, emailForgot, senhaForgot);

			DoadoresDAO doadoresDAO = new DoadoresDAO();
			doadoresDone = doadoresDAO.doadoresSearch(documentoForgot, emailForgot, senhaForgot);
		}

		String msgSucesso = "Senha alterada com Sucesso!";
		String msgErro = "Dados incorretos, por favor, tente novamente!";

		String destPageSucess = "./login.jsp?sucess";
		String destPageError = "./login.jsp?error";
		if (ongDone) {
			request.setAttribute("messageSucess", msgSucesso);
			RequestDispatcher dispatcher = request.getRequestDispatcher(destPageSucess);
			dispatcher.forward(request, response);
		} else if (empresasDone) {
			request.setAttribute("messageSucess", msgSucesso);
			RequestDispatcher dispatcher = request.getRequestDispatcher(destPageSucess);
			dispatcher.forward(request, response);
		} else if (doadoresDone) {
			request.setAttribute("messageSucess", msgSucesso);
			RequestDispatcher dispatcher = request.getRequestDispatcher(destPageSucess);
			dispatcher.forward(request, response);
		} else {
			request.setAttribute("messageError", msgErro);
			RequestDispatcher dispatcher = request.getRequestDispatcher(destPageError);
			dispatcher.forward(request, response);
		}
		
		

	}


}
