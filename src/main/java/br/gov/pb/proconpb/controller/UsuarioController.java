package br.gov.pb.proconpb.controller;

import javax.inject.Inject;
import javax.validation.Valid;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.interceptor.IncludeParameters;
import br.com.caelum.vraptor.validator.Validator;
import br.gov.pb.proconpb.annotation.Public;
import br.gov.pb.proconpb.dao.UsuarioDAO;
import br.gov.pb.proconpb.model.Usuario;

@Controller
public class UsuarioController {

    private Result result;
    private UsuarioDAO usuarioDAO;
    private Validator validator;

    @Deprecated
    public UsuarioController() {
    }

    @Inject
    public UsuarioController(Result result, UsuarioDAO usuarioDAO, Validator validator) {
        this.result = result;
        this.usuarioDAO = usuarioDAO;
        this.validator = validator;
    }
    
    @Public
    public void cadastro() {}
    
    @IncludeParameters
    @Public
    @Post
    public void adiciona(@Valid Usuario usuario) {
        validator.onErrorRedirectTo(this).cadastro();
        usuarioDAO.adiciona(usuario);
        result.redirectTo(ServidorController.class).lista();
    }
    
   
    public void perfil(Usuario usuario) {
	result.include("usuario", usuario);
    }

    public void lista() {
        result.include("usuarios", usuarioDAO.lista());
    }
}
