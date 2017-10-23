<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/WEB-INF/jsp/header.jsp" />

<script>
	$(document).ready(function() {
		$('.ui.form').form({
			fields : {
				login : {
					identifier : 'login',
					rules : [ {
						type : 'empty',
						prompt : 'Por favor, informe seu login'
					} ]
				},
				senha : {
					identifier : 'senha',
					rules : [ {
						type : 'empty',
						prompt : 'Por favor, informe sua senha'
					}, {
						type : 'length[6]',
						prompt : 'Sua senha deve ter no mínimo 6 caracteres'
					} ]
				}
			}
		});
	});
</script>
<div class="ui main text container">

<div class="ui middle aligned aligned grid">
	<div class="column">
		<h2 class="ui teal image header">
			<img class="image" src="<c:url value='/images/logo.png'/>" />
			<div class="content">Faça login em sua conta</div>
		</h2>
		<form class="ui large form"
			action="${linkTo[LoginController].autentica(null, null)}"
			method="post">

			<div class="ui stacked segment">
				<div class="field">
					<div class="ui left icon input">
						<i class="user icon"></i> <input type="text" id="login"
							name="login" placeholder="Digite seu login" />
					</div>
				</div>
				<div class="field">
					<div class="ui left icon input">
						<i class="lock icon"></i> <input type="password" id="senha"
							name="senha" placeholder="Digite sua senha" />
					</div>
				</div>
				<button class="ui fluid large teal button" type="submit">Login</button>

			</div>
			<div class="ui error message"></div>

		</form>
		<div class="ui message">
			Novo Cadastro? <a href="${linkTo[UsuarioController].cadastro()}">Cadastre-se</a>
		</div>
		<c:if test="${not empty errors }">
			<div class="ui error message">
				<c:forEach var="error" items="${errors}">
					<span> ${error.message} </span>
					<br />
				</c:forEach>
			</div>
		</c:if>

	</div>
</div>

