package br.com.nucleos.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import br.com.nucleos.controller.Criptografia;
import br.com.nucleos.model.Doacao_Doadores;
import br.com.nucleos.model.Doacao_Empresas;
import br.com.nucleos.model.Doadores;
import br.com.nucleos.model.Empresas;
import br.com.nucleos.model.Ong;

public class DoacaoDAO {
	private EntityManagerFactory factory = Persistence.createEntityManagerFactory("nucleosdb");
	private EntityManager em = factory.createEntityManager();

	public List<Doacao_Doadores> getAllDoacaoDoadores() {

		try {
			em.getTransaction().begin();
			String jpql = "select dd from Doacao_Doadores dd order by dd.data desc";
			TypedQuery<Doacao_Doadores> typedQuery = em.createQuery(jpql, Doacao_Doadores.class);
			List<Doacao_Doadores> listaDoacao = typedQuery.getResultList();
			for (Doacao_Doadores doacao : listaDoacao) {
				System.out.println("Mensagem: " + doacao.getMensagem());
				System.out.println("Doador: " + doacao.getFk_doadores_doacao_doadores());
				System.out.println("Ong: " + doacao.getFk_ong_doacao_doadores());

			}

			em.close();
			factory.close();
			return listaDoacao;
		} catch (NoResultException e) {
			return null;
		}
	}

	public List<Doacao_Doadores> getAllDonatesDoadores(Ong ong) {

		try {
			em.getTransaction().begin();
			String jpql = "select dd from Doacao_Doadores dd order by dd.data desc where dd.nome = :nome";
			TypedQuery<Doacao_Doadores> typedQuery = em.createQuery(jpql, Doacao_Doadores.class).setParameter("nome",
					ong.getNome());
			List<Doacao_Doadores> listaDoacao = typedQuery.getResultList();

			em.close();
			factory.close();
			return listaDoacao;
		} catch (NoResultException e) {
			return null;
		}
	}

	public List<Doacao_Empresas> getAllDoacaoEmpresas() {

		try {
			em.getTransaction().begin();
			String jpql = "select de from Doacao_Empresas de order by de.data desc";
			TypedQuery<Doacao_Empresas> typedQuery = em.createQuery(jpql, Doacao_Empresas.class);
			List<Doacao_Empresas> listaDoacao = typedQuery.getResultList();

			em.close();
			factory.close();
			System.out.println("Retornou lista DAO");
			return listaDoacao;
		} catch (NoResultException e) {
			System.out.println("Esta retornando null");
			return null;
		}
	}

	public List<Doacao_Empresas> getAllDonatesEmpresas(Ong ong) {

		try {
			em.getTransaction().begin();
			String jpql = "select de from Doacao_Empresas de order by de.data desc where de.nome = :nome";
			TypedQuery<Doacao_Empresas> typedQuery = em.createQuery(jpql, Doacao_Empresas.class).setParameter("nome",
					ong.getNome());
			List<Doacao_Empresas> listaDoacao = typedQuery.getResultList();

			em.close();
			factory.close();
			System.out.println("Retornou lista DAO");
			return listaDoacao;
		} catch (NoResultException e) {
			System.out.println("Esta retornando null");
			return null;
		}
	}

	public boolean inserirDoador(Doacao_Doadores doador) {
		try {
			em.getTransaction().begin();
			em.persist(doador);
			em.getTransaction().commit();
			em.close();
			factory.close();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean inserirEmpresa(Doacao_Empresas empresa) {
		try {
			em.getTransaction().begin();
			em.persist(empresa);
			em.getTransaction().commit();
			em.close();
			factory.close();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public Long getNumberPeople() {
		try {
			em.getTransaction().begin();
			long resultado = (long) em.createQuery("SELECT sum(dd.quantidade) from Doacao_Doadores dd")
					.getSingleResult();
			em.getTransaction().commit();

			em.close();
			factory.close();
			return resultado;
		} catch (NoResultException e) {
			return (long) 0;
		}
	}

	public Long getNumberEmpresas() {
		try {
			em.getTransaction().begin();
			long resultado = (long) em.createQuery("SELECT count(e.nome) from Empresas e").getSingleResult();
			em.getTransaction().commit();

			em.close();
			factory.close();
			return resultado;
		} catch (NoResultException e) {
			return (long) 0;
		}
	}

	public Long getNumberOngs() {
		try {
			em.getTransaction().begin();
			long resultado = (long) em.createQuery("SELECT count(o.nome) from Ong o").getSingleResult();
			em.getTransaction().commit();

			em.close();
			factory.close();
			return resultado;
		} catch (NoResultException e) {
			return (long) 0;
		}
	}

	public Long getNumberDoadores() {
		try {
			em.getTransaction().begin();
			long resultado = (long) em.createQuery("SELECT count(d.nome) from Doadores d").getSingleResult();
			em.getTransaction().commit();

			em.close();
			factory.close();
			return resultado;
		} catch (NoResultException e) {
			return (long) 0;
		}
	}

	public List<Doacao_Doadores> getOnlyOngDoadores(int id) {

		try {
			em.getTransaction().begin();
			String jpql = "select dd from Doacao_Doadores dd where dd.fk_ong_doacao_doadores = :ongid";
			TypedQuery<Doacao_Doadores> typedQuery = em.createQuery(jpql, Doacao_Doadores.class).setParameter("ongid",
					id);
			List<Doacao_Doadores> listaDoacao = typedQuery.getResultList();

			em.close();
			factory.close();
			return listaDoacao;
		} catch (NoResultException e) {
			System.out.println("Esta retornando null");
			return null;
		}
	}

	
	public List<Doacao_Empresas> getOnlyOngEmpresas(int id) {

		try {
			em.getTransaction().begin();
			String jpql = "select de from Doacao_Empresas de where de.fk_ong_doacao_empresas = :ongid";
			TypedQuery<Doacao_Empresas> typedQuery = em.createQuery(jpql, Doacao_Empresas.class).setParameter("ongid",
					id);
			List<Doacao_Empresas> listaDoacao = typedQuery.getResultList();

			em.close();
			factory.close();
			return listaDoacao;
		} catch (NoResultException e) {
			System.out.println("Esta retornando null");
			return null;
		}
	}


	/*
	 * public List<Doacao_Empresas> getTopEmpresas() {
	 * 
	 * try { em.getTransaction().begin(); String jpql =
	 * "select de from Doacao_Empresas de"; TypedQuery<Doacao_Empresas> typedQuery =
	 * em.createQuery(jpql, Doacao_Empresas.class); List<Doacao_Empresas>
	 * listaDoacao = typedQuery.getResultList(); em.close(); factory.close();
	 * 
	 * return listaDoacao; } catch (NoResultException e) {
	 * System.out.println("Esta retornando null"); return null; } }
	 */

	
	/*
	 * public static void main(String[] args) { DoacaoDAO doacaoDao = new
	 * DoacaoDAO(); List<Doacao_Empresas> listaDoacao = doacaoDao.getTopEmpresas();
	 * for(Doacao_Empresas de : listaDoacao) {
	 * System.out.println(de.getFk_empresas_doacao_empresas());
	 * 
	 * } }
	 */
}
