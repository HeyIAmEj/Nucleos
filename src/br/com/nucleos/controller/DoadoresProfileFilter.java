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

@WebFilter({ "/d/*" })
public class DoadoresProfileFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;
		HttpSession session = httpRequest.getSession(false);

		boolean isLoggedIn = (session != null && session.getAttribute("user") != null);
		boolean isDoadoresPage = httpRequest.getRequestURI().endsWith("user.jsp");

		String doadoresURI = httpRequest.getContextPath() + "/user";
		boolean isDoadoresRequest = httpRequest.getRequestURI().equals(doadoresURI);
		int perm = (int) session.getAttribute("user-perm");
		System.out.println("DoadoresProfileFilter Perm: "+perm);
		// FILTRO USER
		if (isLoggedIn && (isDoadoresRequest || isDoadoresPage)) {
			if (perm == 1) {
				RequestDispatcher dispatcher = request.getRequestDispatcher("/d/user.jsp");
				dispatcher.forward(request, response);
			} else {
				System.out.println("aqui 1");
				RequestDispatcher dispatcher = request.getRequestDispatcher("/d/na.jsp");
				dispatcher.forward(request, response);
			}
		} else if (isLoggedIn || isDoadoresRequest) {
			if(perm == 1) {
				chain.doFilter(request, response);
			}else {
				System.out.println("aqui 2");
				RequestDispatcher dispatcher = request.getRequestDispatcher("/d/na.jsp");
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
