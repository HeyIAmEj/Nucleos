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

@WebFilter({ "/o/login", "/d/login", "/e/login", "/o/login.jsp", "/e/login.jsp", "/d/login.jsp", "/login",
		"/login.jsp" })
public class LoginFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;
		HttpSession session = httpRequest.getSession(false);

		boolean isLoggedIn = (session != null && session.getAttribute("user") != null);
		boolean isLoginPage = httpRequest.getRequestURI().endsWith("login.jsp");

		String loginURI = httpRequest.getContextPath() + "/login";
		System.out.println(httpRequest.getRequestURI());
		System.out.println(httpRequest.getRequestURI());
		System.out.println(httpRequest.getRequestURI());
		System.out.println(httpRequest.getRequestURI());
		boolean isLoginRequest = httpRequest.getRequestURI().equals(loginURI);

		// FILTRO USER
		if (isLoggedIn && (isLoginRequest || isLoginPage)) {
			int perm = (int) session.getAttribute("user-perm");
			String redirect = (String) session.getAttribute("redirect");
			if (redirect.contains("yes")) {
				if (perm == 3) {
					httpResponse.sendRedirect("./o/index.jsp");
				} else if (perm == 2) {
					httpResponse.sendRedirect("./e/index.jsp");
				} else {
					httpResponse.sendRedirect("./d/index.jsp");
				}
			} else {
				if (perm == 3) {
					httpResponse.sendRedirect("./o/index.jsp");
					// RequestDispatcher dispatcher = request.getRequestDispatcher("/o/index.jsp");
					// dispatcher.forward(request, response);
				} else if (perm == 2) {
					httpResponse.sendRedirect("./e/index.jsp");
					// RequestDispatcher dispatcher =
					// request.getRequestDispatcher("/e/empresa.jsp");
					// dispatcher.forward(request, response);
				} else {
					httpResponse.sendRedirect("./d/index.jsp");
					// RequestDispatcher dispatcher = request.getRequestDispatcher("/d/user.jsp");
					// dispatcher.forward(request, response);
				}
			}
		} else if (isLoggedIn || isLoginRequest) {
			chain.doFilter(request, response);
		} else {
			System.out.println("Usuário não autenticado.");
			chain.doFilter(request, response);

		}

	}

	public void destroy() {
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

}
