package br.gov.pb.proconpb.interceptor;

import br.com.caelum.vraptor.Accepts;
import br.com.caelum.vraptor.AroundCall;
import br.com.caelum.vraptor.Intercepts;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.controller.ControllerMethod;
import br.com.caelum.vraptor.interceptor.SimpleInterceptorStack;
import br.gov.pb.proconpb.annotation.Public;
import br.gov.pb.proconpb.controller.LoginController;
import br.gov.pb.proconpb.seguranca.UsuarioLogado;

import javax.inject.Inject;

/**
 *
 * @author emiliano
 */
@Intercepts
public class AutorizadorInterceptor {

    private final UsuarioLogado usuarioLogado;
    private final Result result;
    private ControllerMethod method;

    @Inject
    public AutorizadorInterceptor(UsuarioLogado usuarioLogado, Result result, ControllerMethod method) {
	this.usuarioLogado = usuarioLogado;
	this.result = result;
	this.method = method;
    }

    @Deprecated
    public AutorizadorInterceptor() {
	this(null, null, null);
    }

    @Accepts
    public boolean accept() {
	return !method.containsAnnotation(Public.class);
    }

    @AroundCall
    public void intercept(SimpleInterceptorStack stack) {
	if (usuarioLogado.isLogado()) {
	    stack.next();
	} else {
	    result.redirectTo(LoginController.class).login();
	}
    }
}
