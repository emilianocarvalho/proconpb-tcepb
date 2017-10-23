<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/WEB-INF/jsp/header.jsp" />
<div class="ui main text container">

<div class="ui attached message">
	<div class="header">Cadastro do Usuário</div>
	<p>Preencha o cadastro abaixo com seus dados</p>
</div>
<form class="ui form attached fluid segment"
	action="${linkTo[UsuarioController].adiciona(null)}" method="post">
	<div class="field">
		<label for="id">ID ${usuario.id}</label> <input type="hidden" name="usuario.id"
			id="id" value="${usuario.id}">
	</div>	
	<div class="field">
		<label for="nome">Nome</label> <input type="text" name="usuario.nome"
			id="nome" value="${usuario.nome}">
	</div>
	<div class="field">
		<label for="email">Email</label> <input type="text"
			name="usuario.email" id="email" value="${usuario.email}">
	</div>
	<div class="field">
		<label for="login">Login</label> <input type="text"
			name="usuario.login" id="login" value="${usuario.login}">
	</div>
	<div class="field">
		<label for="senha">Senha</label> <input type="password"
			name="usuario.senha" id="senha">
	</div>
	<button class="ui button" type="submit">Cadastrar</button>
</form>
<!-- <div class="ui message"> -->
<%-- 	Telefone(s) <a href="${linkTo[TelefoneController].cadastro()}">Cadastrar</a> --%>
<!-- </div> -->

<c:if test="${not empty errors }">
	<div class="ui bottom attached warning message">
		<c:forEach var="error" items="${errors}">
		${error.category} - ${error.message} <br />
		</c:forEach>
	</div>
</c:if>
<c:import url="/WEB-INF/jsp/footer.jsp" />