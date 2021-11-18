package br.com.nucleos.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import br.com.nucleos.controller.Criptografia;
import br.com.nucleos.model.Ong;
import br.com.nucleos.model.Usuario;

public class OngDAO {
	private EntityManagerFactory factory = Persistence.createEntityManagerFactory("nucleosdb");
	private EntityManager em = factory.createEntityManager();

	// AuthONG
	public Ong ongAuth(String email, String senha) {
		senha =  Criptografia.criptografar(senha);
		try {
			em.getTransaction().begin();
			Ong ong = (Ong) em.createQuery("SELECT o from Ong o where o.email = :email and o.senha = :senha")
					.setParameter("email", email).setParameter("senha", senha).getSingleResult();
			em.getTransaction().commit();

			em.close();
			factory.close();
			return ong;
		} catch (NoResultException e) {
			return null;
		}
	}
	
	public boolean ongSearch(String ri, String email, String senha) {
		senha =  Criptografia.criptografar(senha);
		try {
			em.getTransaction().begin();
			Ong ong = (Ong) em.createQuery("SELECT o from Ong o where o.registro_instituicao = :ri and o.email = :email")
					.setParameter("ri", ri).setParameter("email", email).getSingleResult();
			em.getTransaction().commit();
			em.getTransaction().begin();

			ong.setSenha(senha);
			em.persist(ong);
			em.getTransaction().commit();

			
			em.close();
			factory.close();
			
			return true;
		} catch (NoResultException e) {
			return false;
		}
	}
	
	
	public Ong ongUpdate(Ong ongg, String nome, String bairro, String telefone, String descricao) {
		Ong ong = null;
		try {
			em.getTransaction().begin();
			ong = (Ong) em.createQuery("SELECT o from Ong o where o.id = :id")
					.setParameter("id", ongg.getId()).getSingleResult();
			em.getTransaction().commit();
			em.getTransaction().begin();

			ong.setNome(nome);
			ong.setBairro(bairro);
			ong.setTelefone(telefone);
			ong.setDescricao(descricao);
			
			em.persist(ong);
			em.getTransaction().commit();

			
			em.close();
			factory.close();
			
			return ong;
		} catch (NoResultException e) {
			return ong;
		}
	}
	

	// GetOngById
	public Ong getOngById(int id) {
		em.getTransaction().begin();
		try {
			Ong ong = (Ong) em.createQuery("SELECT o from Ong o where o.id = :id").setParameter("id", id)
					.getSingleResult();
			em.getTransaction().commit();
			em.close();
			factory.close();
			return ong;
		} catch (NoResultException e) {
			return null;
		}
	}
	
	// GetCount
	public long getCount() {
		em.getTransaction().begin();
		try {
			String jpql = "SELECT COUNT(*) FROM Ong";
			Query queryCount = em.createQuery(jpql);
			long total = ((Number) queryCount.getSingleResult()).longValue();

			em.getTransaction().commit();
			em.close();
			factory.close();
			return total;
		} catch (NoResultException e) {
			return 0;
		}
	}

	// GetAllOng
	public List<Ong> getAllOng() {
		
		try {
			em.getTransaction().begin();
			String jpql = "select o from Ong o";
			TypedQuery<Ong> typedQuery = em.createQuery(jpql, Ong.class);
			List<Ong> listaOng = typedQuery.getResultList();
			em.getTransaction().commit();
			
			/*
			 * for (Ong ong : listaOng) { System.out.println(ong.getNome()); }
			 */
			em.close();
			factory.close();
			return listaOng;
		} catch (NoResultException e) {
			return null;
		}
	}
	
	public boolean inserirOng(Ong ong) {
		try {
			em.getTransaction().begin();
			em.persist(ong);
			em.getTransaction().commit();
			em.close();
			factory.close();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
}
