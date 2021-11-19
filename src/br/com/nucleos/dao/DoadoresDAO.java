package br.com.nucleos.dao;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;
import br.com.nucleos.controller.Criptografia;
import br.com.nucleos.model.Doadores;
import br.com.nucleos.model.Voluntariar;

public class DoadoresDAO {

	private EntityManagerFactory factory = Persistence.createEntityManagerFactory("nucleosdb");
	private EntityManager em = factory.createEntityManager();

	public Doadores doadoresAuth(String email, String senha) {
		senha = Criptografia.criptografar(senha);

		em.getTransaction().begin();
		try {
			Doadores doadores = (Doadores) em
					.createQuery("SELECT d from Doadores d where d.email = :email and d.senha = :senha")
					.setParameter("email", email).setParameter("senha", senha).getSingleResult();
			em.getTransaction().commit();
			em.close();
			factory.close();
			return doadores;
		} catch (NoResultException e) {
			return null;
		}
	}

	public boolean doadoresSearch(String cpf, String email, String senha) {
		senha = Criptografia.criptografar(senha);
		System.out.println("chegou");
		em.getTransaction().begin();
		try {
			Doadores doadores = (Doadores) em
					.createQuery("SELECT d from Doadores d where d.cpf = :cpf and d.email = :email")
					.setParameter("cpf", cpf).setParameter("email", email).getSingleResult();
			em.getTransaction().commit();
			em.getTransaction().begin();

			doadores.setSenha(senha);
			em.persist(doadores);
			em.getTransaction().commit();
			System.out.println("certo");
			em.close();
			factory.close();
			return true;
		} catch (NoResultException e) {
			System.out.println("erro not found on doadores table");
			return false;
		}
	}

	public Doadores doadoresUpdate(Doadores doadoress, String nome, String sobrenome, String bairro, String telefone) {
		Doadores doadores = null;
		try {
			em.getTransaction().begin();
			doadores = (Doadores) em.createQuery("SELECT d from Doadores d where d.id = :id")
					.setParameter("id", doadoress.getId()).getSingleResult();
			em.getTransaction().commit();
			em.getTransaction().begin();

			doadores.setNome(nome);
			doadores.setSobrenome(sobrenome);
			doadores.setBairro(bairro);
			doadores.setCelular(telefone);

			em.persist(doadores);
			em.getTransaction().commit();

			em.close();
			factory.close();

			return doadores;
		} catch (NoResultException e) {
			return doadores;
		}
	}

	public Doadores getDoadoresById(int id) {
		em.getTransaction().begin();
		try {
			Doadores doadores = (Doadores) em.createQuery("SELECT d from Doadores d where d.id = :id")
					.setParameter("id", id).getSingleResult();
			em.getTransaction().commit();
			em.close();
			factory.close();
			return doadores;
		} catch (NoResultException e) {
			return null;
		}
	}

	// GetAllOng
	public List<Doadores> getAllDoadores() {
		try {
			em.getTransaction().begin();
			String jpql = "select d from Doadores d";
			TypedQuery<Doadores> typedQuery = em.createQuery(jpql, Doadores.class);
			List<Doadores> listaDoadores = typedQuery.getResultList();
			em.getTransaction().commit();

			/*
			 * for (Ong ong : listaOng) { System.out.println(ong.getNome()); }
			 */
			em.close();
			factory.close();
			return listaDoadores;
		} catch (NoResultException e) {
			return null;
		}
	}

	public boolean inserirDoador(Doadores doadores) {
		try {
			em.getTransaction().begin();
			em.persist(doadores);
			em.getTransaction().commit();
			em.close();
			factory.close();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

	}

	public boolean atualizarInfoBasicaDoador(Doadores doadores, String novoNome, String novoSobrenome, String novoCpf,
			String novaLocalizacao) {
		try {
			em.getTransaction().begin();
			doadores.setNome(novoNome);
			doadores.setSobrenome(novoSobrenome);
			doadores.setCpf(novoCpf);
			doadores.setBairro(novaLocalizacao);
			em.persist(doadores);
			em.getTransaction().commit();
			em.close();
			factory.close();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean atualizarInfoContatoDoador(Doadores doadores, String novoCelular, String novoEmail,
			String novaFoto) {
		try {
			em.getTransaction().begin();
			doadores.setCelular(novoCelular);
			doadores.setEmail(novoEmail);
			doadores.setImg_src(novaFoto);
			em.persist(doadores);
			em.getTransaction().commit();
			em.close();
			factory.close();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean atualizarInfoAcessoDoador(Doadores doadores, String novoEmail, String novaSenha) {
		novaSenha = Criptografia.criptografar(novaSenha);

		try {
			em.getTransaction().begin();
			doadores.setEmail(novoEmail);
			doadores.setSenha(novaSenha);
			em.persist(doadores);
			em.getTransaction().commit();
			em.close();
			factory.close();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean inserirVoluntario(Voluntariar voluntariar) {
		try {
			em.getTransaction().begin();
			em.persist(voluntariar);
			em.getTransaction().commit();
			em.close();
			factory.close();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean voluntariarAction(Voluntariar voluntariar) {
		try {
			em.getTransaction().begin();
			em.persist(voluntariar);
			em.getTransaction().commit();
			em.close();
			factory.close();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public List<Voluntariar> getAllVoluntarios(int id) {
		try {
			em.getTransaction().begin();
			String jpql = "select v from Voluntariar v where v.fk_ong_voluntariar = :id";
			TypedQuery<Voluntariar> typedQuery = em.createQuery(jpql, Voluntariar.class).setParameter("id", id);
			List<Voluntariar> listaVoluntarios = typedQuery.getResultList();
			em.getTransaction().commit();
			em.close();
			factory.close();
			return listaVoluntarios;
		} catch (NoResultException e) {
			return null;
		}
	}
	

}