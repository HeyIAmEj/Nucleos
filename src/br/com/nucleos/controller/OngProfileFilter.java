package br.com.nucleos.controller;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter({ "/o/*" })
public class OngProfileFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;

		HttpSession session = httpRequest.getSession(false);

		boolean isLoggedIn = (session != null && session.getAttribute("user") != null);
		boolean isOngPage = httpRequest.getRequestURI().endsWith("ong.jsp");

		String ongURI = httpRequest.getContextPath() + "/ong";
		boolean isOngRequest = httpRequest.getRequestURI().equals(ongURI);
		int perm = (int) session.getAttribute("user-perm");

		// FILTRO USER
		if (isLoggedIn && (isOngRequest || isOngPage)) {
			if (perm == 3) {
				RequestDispatcher dispatcher = request.getRequestDispatcher("/o/ong.jsp");
				dispatcher.forward(request, response);
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher("/o/na.jsp");
				dispatcher.forward(request, response);
			}
		} else if (isLoggedIn || isOngRequest) {
			if(perm == 3) {
				chain.doFilter(request, response);
			}else {
				RequestDispatcher dispatcher = request.getRequestDispatcher("/o/na.jsp");
				dispatcher.forward(request, response);
			}
 
        } else {
			System.out.println("Usuário não autenticado.");
			httpResponse.sendRedirect("/NucleosApp/index.jsp");

		}

	}

	public void destroy() {
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

}
