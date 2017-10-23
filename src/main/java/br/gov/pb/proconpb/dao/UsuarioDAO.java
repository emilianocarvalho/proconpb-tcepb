package br.gov.pb.proconpb.dao;

import java.util.List;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import br.gov.pb.proconpb.model.Usuario;

@RequestScoped
public class UsuarioDAO {
    private EntityManager manager;
    private List<Usuario> results;

    public UsuarioDAO() {
    }

    @Inject
    public UsuarioDAO(EntityManager manager) {
	this.manager = manager;
    }

    public void adiciona(Usuario usuario) {
	manager.getTransaction().begin();
	if (usuario.getId() == null) {
	    manager.persist(usuario);
	} else {
	    manager.merge(usuario);
	}
	manager.getTransaction().commit();
    }

    public List<Usuario> lista() {
	String jpql = "select u from Usuario u";
	TypedQuery<Usuario> query = manager.createQuery(jpql, Usuario.class);
	return query.getResultList();
    }

    public Usuario busca(String login, String senha) {
	String jpql = "select u from Usuario u where u.login = :login and u.senha = :senha";
	TypedQuery<Usuario> query = manager.createQuery(jpql, Usuario.class);
	query.setParameter("login", login);
	query.setParameter("senha", senha);
	results = query.getResultList();

	return results.isEmpty() ? null : results.get(0);
    }

}
