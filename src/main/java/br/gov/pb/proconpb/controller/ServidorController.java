package br.gov.pb.proconpb.controller;

import javax.inject.Inject;
import javax.validation.Valid;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.interceptor.IncludeParameters;
import br.com.caelum.vraptor.validator.Validator;
import br.gov.pb.proconpb.dao.ServidorDAO;
import br.gov.pb.proconpb.model.Regime;
import br.gov.pb.proconpb.model.Servidor;

@Controller
public class ServidorController {

    private Result result;
    private ServidorDAO servidorDAO;
    private Validator validator;

    @Inject
    public ServidorController(Result result, ServidorDAO servidorDAO, Validator validator) {
	this.result = result;
	this.servidorDAO = servidorDAO;
	this.validator = validator;
    }

    @Deprecated
    public ServidorController() {
	this(null, null, null);
    }

    @IncludeParameters
    @Post
    public void adiciona(@Valid Servidor servidor) {
	validator.onErrorRedirectTo(this).cadastro();
	servidorDAO.adiciona(servidor);
	result.redirectTo(this).lista();
    }

    public void edita(int id) {
	
	Servidor servidorEncontrado = servidorDAO.busca(id);
	if (servidorEncontrado == null) {
	    result.notFound();
	} else {
	    result.include(servidorEncontrado);
	    result.of(this).cadastro();
	}
    }

    public void lista() {
	result.include("servidores", servidorDAO.lista());
    }

    public void cadastro() {
    }
}
