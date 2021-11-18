package br.com.nucleos.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet({ "/o/LogoutController", "/logout", "/d/logout", "/e/logout", "/o/logout" })
public class LogoutController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public LogoutController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
        if (session != null) {
            session.removeAttribute("user");
            session.removeAttribute("user-email");
            session.removeAttribute("user-id");
            session.removeAttribute("listaOng");
             System.out.println(request.getContextPath());
             response.sendRedirect("/NucleosApp/index.jsp");
             
             //RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
 			//dispatcher.forward(request, response);
             
			/*
			 * RequestDispatcher dispatcher = request.getRequestDispatcher("/login.jsp");
			 * dispatcher.forward(request, response);
			 */
        }
	}

}
