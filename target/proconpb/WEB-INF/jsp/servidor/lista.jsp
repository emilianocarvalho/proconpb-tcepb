<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:import url="/WEB-INF/jsp/header.jsp" />
<div class="ui main container">

<a href="${linkTo[ServidorController].cadastro()}">Novo Servidor</a>
<table class="ui table blue striped compact">
	<thead>
		<tr>
			<th>Id</th>
			<th>Orgao</th>
			<th>Esfera</th>
			<th>Municipio</th>
			<th>UF</th>
			<th>Nome</th>
			<th>CPF</th>
			<th>Matrícula</th>
			<th>Regime</th>
			<th>Cargo</th>
			<th>Natureza</th>
			<th>Data</th>
			<th></th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${servidores}" var="servidor">
			<tr>
				<td>${servidor.id}</td>
				<td>${servidor.orgao}</td>
				<td>${servidor.esfera}</td>
				<td>${servidor.municipio}</td>
				<td>${servidor.uf}</td>
				<td>${servidor.nome}</td>
				<td>${servidor.cpf}</td>
				<td>${servidor.matricula}</td>
				<td>${servidor.regime}</td>
				<td>${servidor.cargo}</td>
				<td>${servidor.naturezaCargo}</td>
				<td><fmt:formatDate value="${servidor.dataExercicio.time}" pattern="dd/MM/yyyy" /></td>
				<td><a href="${linkTo[ServidorController].edita}?id=${servidor.id}">Editar</a></td>
			</tr>

		</c:forEach>
	</tbody>
</table>
<c:import url="/WEB-INF/jsp/footer.jsp" />