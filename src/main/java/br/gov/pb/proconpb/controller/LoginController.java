package br.gov.pb.proconpb.controller;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.validator.SimpleMessage;
import br.com.caelum.vraptor.validator.Validator;
import br.gov.pb.proconpb.annotation.Public;
import br.gov.pb.proconpb.dao.UsuarioDAO;
import br.gov.pb.proconpb.model.Usuario;
import br.gov.pb.proconpb.seguranca.UsuarioLogado;

/**
 *
 * @author emiliano
 */
@Controller
public class LoginController {

    private final UsuarioDAO dao;
    private final UsuarioLogado usuarioLogado;
    private final Result result;
    private final Validator validator;

    @Inject
    public LoginController(UsuarioDAO dao, UsuarioLogado usuarioLogado,
            Result result, Validator validator) {
        this.dao = dao;
        this.usuarioLogado = usuarioLogado;
        this.result = result;
        this.validator = validator;
    }

    @Deprecated
    public LoginController() {
        this(null, null, null, null);
    }


    @Public    
    public void login() {

    }

    @Post
    @Public
    public void autentica(String login, String senha) {
        Usuario usuario = dao.busca(login, senha);
        if (usuario != null) {
            usuarioLogado.fazLogin(usuario);
            result.redirectTo(ServidorController.class).lista();
        } else {
            validator.add(new SimpleMessage("login_invalido",
                    "Login ou senha incorretos"));
            validator.onErrorRedirectTo(this).login();
        }
    }
    
    @Public
    public void logout() {
        usuarioLogado.logout();
        result.redirectTo(this).login();
    }
}
