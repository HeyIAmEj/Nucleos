package br.com.nucleos.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import br.com.nucleos.dao.DoacaoDAO;
import br.com.nucleos.model.Doacao_Doadores;
import br.com.nucleos.model.Doacao_Empresas;

@WebServlet({"/e/doacaoform", "/d/doacaoform" })
public class DoarActionController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
        req.setCharacterEncoding("UTF-8");


		
		String doacao = req.getParameter("produto");
		int quantidade = Integer.parseInt(req.getParameter("qtd"));
		String mensagem = req.getParameter("mensagem");


		Date now = new Date();
        SimpleDateFormat fmt = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        String data = fmt.format(now);
        System.out.println(data);
		

		String estado = req.getParameter("conservacao");
		String entrega = req.getParameter("entrega");
		String isAnonimo = req.getParameter("isAnonimo");
		int fk_ong_doacao_doadores = Integer.parseInt(req.getParameter("fk_ong"));
		int doador = Integer.parseInt(req.getParameter("fk_doador"));
		int perm = Integer.parseInt(req.getParameter("perm"));

		
		System.out.println("Ong: " + fk_ong_doacao_doadores);
		System.out.println("Doador: " + doador);
		System.out.println("Permissao: " + perm);
		System.out.println("Data: " + data);
		
		if (perm == 1) {
			int fk_doadores_doacao_doadores = doador;
			DoacaoDAO doacaoDAO = new DoacaoDAO();
			Doacao_Doadores dd = new Doacao_Doadores(doacao, quantidade, mensagem, data, estado, entrega, isAnonimo,
					fk_ong_doacao_doadores, fk_doadores_doacao_doadores);
			boolean sucess = doacaoDAO.inserirDoador(dd);
			if (sucess) {
				session.setAttribute("erro", "");
				System.out.println("Add com sucesso!");
				resp.sendRedirect("./historicousuarios.jsp");
			} else {
				System.out.println("Erro ao Add!");
				session.setAttribute("erro", "Erro ao cadastrar doacao. Tente Novamente!");
				resp.sendRedirect("./doar.jsp");
			}
		} else {

			int fk_empresas_doacao_empresas = doador;
			int fk_ong_doacao_empresas = fk_ong_doacao_doadores;
			DoacaoDAO doacaoDAO = new DoacaoDAO();
			Doacao_Empresas de = new Doacao_Empresas(doacao, quantidade, mensagem, data, estado, entrega, isAnonimo,
					fk_empresas_doacao_empresas, fk_ong_doacao_empresas);
			boolean sucess = doacaoDAO.inserirEmpresa(de);
			if (sucess) {
				session.setAttribute("erro", "");
				System.out.println("Add com sucesso!");
				resp.sendRedirect("./historicoempresas.jsp");
			} else {
				System.out.println("Erro ao Add!");
				session.setAttribute("erro", "Erro ao cadastrar doacao. Tente Novamente!");
				resp.sendRedirect("./doar.jsp");
			}

		}

	}
}
