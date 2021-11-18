package br.com.nucleos.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet({"/erroRedirect", "/d/erroRedirect", "/e/erroRedirect", "/o/erroRedirect" })
public class ErrorRedirectController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.setAttribute("redirect", "yes");
		response.sendRedirect("/NucleosApp/index.jsp");
             
             //RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
 			//dispatcher.forward(request, response);
             
			/*
			 * RequestDispatcher dispatcher = request.getRequestDispatcher("/login.jsp");
			 * dispatcher.forward(request, response);
			 */
}

}
