package br.gov.pb.proconpb.seguranca;

import java.io.Serializable;
import javax.enterprise.context.SessionScoped;
import javax.inject.Named;

import br.gov.pb.proconpb.model.Usuario;

/**
 *
 * @author emiliano
 */
@Named
@SessionScoped
public class UsuarioLogado implements Serializable {
    
    /**
     * 
     */
    private static final long serialVersionUID = 1L;
    /**
     * 
     */
    
    private Usuario usuario;
    
    public void fazLogin(Usuario usuario) {
        this.usuario = usuario;
    }
    
    public void logout() {
        this.usuario = null;
    }
    
    public boolean isLogado() {
        return this.usuario != null;
    }

    public Usuario getUsuario() {
	return usuario;
    }
    
}
