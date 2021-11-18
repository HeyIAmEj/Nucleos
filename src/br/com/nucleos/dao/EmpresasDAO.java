package br.com.nucleos.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

import br.com.nucleos.controller.Criptografia;
import br.com.nucleos.model.Empresas;
import br.com.nucleos.model.Ong;

public class EmpresasDAO {

	private EntityManagerFactory factory = Persistence.createEntityManagerFactory("nucleosdb");
	private EntityManager em = factory.createEntityManager();

	public Empresas empresasAuth(String email, String senha) {
		senha =  Criptografia.criptografar(senha);

		em.getTransaction().begin();
		try {
			Empresas empresas = (Empresas) em
					.createQuery("SELECT e from Empresas e where e.email = :email and e.senha = :senha")
					.setParameter("email", email).setParameter("senha", senha).getSingleResult();
			em.getTransaction().commit();
			em.close();
			factory.close();
			return empresas;
		} catch (NoResultException e) {
			return null;
		}
	}

	public Empresas getEmpresasById(int id) {
		em.getTransaction().begin();
		try {
			Empresas empresas = (Empresas) em.createQuery("SELECT e from Empresas e where e.id = :id")
					.setParameter("id", id).getSingleResult();
			em.getTransaction().commit();
			em.close();
			factory.close();
			return empresas;
		} catch (NoResultException e) {
			return null;
		}
	}
	
	public Empresas empresasUpdate(Empresas empresass, String nome, String bairro, String telefone) {
		Empresas empresas = null;
		try {
			em.getTransaction().begin();
			empresas = (Empresas) em.createQuery("SELECT e from Empresas e where e.id = :id")
					.setParameter("id", empresass.getId()).getSingleResult();
			em.getTransaction().commit();
			em.getTransaction().begin();

			empresas.setNome(nome);
			empresas.setBairro(bairro);
			empresas.setTelefone(telefone);
			
			em.persist(empresas);
			em.getTransaction().commit();

			
			em.close();
			factory.close();
			
			return empresas;
		} catch (NoResultException e) {
			return empresas;
		}
	}
	
	public boolean empresasSearch(String cnpj, String email, String senha) {
		senha =  Criptografia.criptografar(senha);
		try {
			em.getTransaction().begin();
			Empresas empresas = (Empresas) em.createQuery("SELECT e from Empresas e where e.cnpj = :cnpj and e.email = :email")
					.setParameter("cnpj", cnpj).setParameter("email", email).getSingleResult();
			em.getTransaction().commit();
			em.getTransaction().begin();

			empresas.setSenha(senha);
			em.persist(empresas);
			em.getTransaction().commit();

			
			em.close();
			factory.close();
			
			return true;
		} catch (NoResultException e) {
			return false;
		}
	}

	// GetAllOng
	public List<Empresas> getAllEmpresas() {
		try {
			em.getTransaction().begin();
			String jpql = "select e from Empresas e";
			TypedQuery<Empresas> typedQuery = em.createQuery(jpql, Empresas.class);
			List<Empresas> listaEmpresas = typedQuery.getResultList();
			em.getTransaction().commit();
			/*
			 * for (Ong ong : listaOng) { System.out.println(ong.getNome()); }
			 */
			em.close();
			factory.close();
			return listaEmpresas;
		} catch (NoResultException e) {
			return null;
		}
	}

	public boolean inserirEmpresas(Empresas empresas) {
		try {
			em.getTransaction().begin();
			em.persist(empresas);
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
