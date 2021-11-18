package br.com.nucleos.dao;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.Persistence;
import javax.persistence.Query;

import br.com.nucleos.controller.Criptografia;
import br.com.nucleos.model.Usuario;

public class UsuarioDAO {
	
	private EntityManagerFactory factory = Persistence.createEntityManagerFactory("nucleosdb");
	private EntityManager em = factory.createEntityManager();

	public Usuario getUsuario(String nomeUsuario, String senha) {
		senha =  Criptografia.criptografar(senha);

		em.getTransaction().begin();
   try {
     Usuario usuario = (Usuario) em
      .createQuery("SELECT u from Usuario u where u.nomeUsuario = :name and u.senha = :senha")
      .setParameter("name", nomeUsuario)
      .setParameter("senha", senha).getSingleResult();
     em.getTransaction().commit();
     return usuario;
   } catch (NoResultException e) {
         return null;
   }
 }

	public boolean inserirUsuario(Usuario usuario) {
		try {
			em.getTransaction().begin();
			em.persist(usuario);
			em.getTransaction().commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean deletarUsuario(String nomeUsuario) {
		try {
			em.getTransaction().begin();
			Query q= em.createQuery("delete from Usuario u where u.nomeUsuario = :nomeUsuario");
			q.setParameter("nomeUsuario", nomeUsuario);
			int deletedRows = q.executeUpdate();
			System.out.println(deletedRows);
			em.getTransaction().commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
}
