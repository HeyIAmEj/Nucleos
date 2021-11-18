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

@WebFilter({ "/e/*" })
public class EmpresasProfileFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;

		HttpSession session = httpRequest.getSession(false);

		boolean isLoggedIn = (session != null && session.getAttribute("user") != null);
		boolean isEmpresasPage = httpRequest.getRequestURI().endsWith("user.jsp");

		String empresasURI = httpRequest.getContextPath() + "/user";
		boolean isEmpresasRequest = httpRequest.getRequestURI().equals(empresasURI);
		int perm = (int) session.getAttribute("user-perm");
		System.out.println(perm);
		// FILTRO USER
		if (isLoggedIn && (isEmpresasRequest || isEmpresasPage)) {
			if (perm == 2) {
				RequestDispatcher dispatcher = request.getRequestDispatcher("/e/empresas.jsp");
				dispatcher.forward(request, response);
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher("/e/na.jsp");
				dispatcher.forward(request, response);
			}
		} else if (isLoggedIn || isEmpresasRequest) {
			if(perm == 2) {
				chain.doFilter(request, response);
			}else {
				RequestDispatcher dispatcher = request.getRequestDispatcher("/e/na.jsp");
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
