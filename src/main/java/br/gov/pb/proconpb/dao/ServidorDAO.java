package br.gov.pb.proconpb.dao;

import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import br.gov.pb.proconpb.model.Servidor;


public class ServidorDAO {

    private EntityManager manager;
    private List<Servidor> results;

    @Deprecated
    public ServidorDAO() {
    }

    /**
     * Inject EntityManager
     * 
     * @param manager
     */
    @Inject
    public ServidorDAO(EntityManager manager) {
	this.manager = manager;

    }

    /**
     * Adiciona / Atualiza Servidor
     * 
     * @param servidor
     */
    public void adiciona(Servidor servidor) {
	manager.getTransaction().begin();
	if (servidor.getId() == null) {
	    manager.persist(servidor);
	} else {
	    manager.merge(servidor);
	}
	manager.getTransaction().commit();
    }

    public Servidor busca(int id) {
	String jpql = "select s from Servidor s where s.id = :id";
	TypedQuery<Servidor> query = manager.createQuery(jpql, Servidor.class);
	query.setParameter("id", id);
	results = query.getResultList();

	return results.isEmpty() ? null : results.get(0);
    }

    /**
     * Lista servidores
     * 
     * @return List
     */
    public List<Servidor> lista() {
	String jpql = "select s from Servidor s";
	TypedQuery<Servidor> query = manager.createQuery(jpql, Servidor.class);
	return query.getResultList();
    }
        
//    public String getDataCadastroFormatado() {
//	SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
//	return formato.format(getDataCadastro());
//    }
    

}
