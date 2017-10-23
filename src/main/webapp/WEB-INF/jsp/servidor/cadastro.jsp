<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib tagdir="/WEB-INF/tags" prefix="procon"%>
<c:import url="/WEB-INF/jsp/header.jsp" />
<script>
	var descNatCargo = "Informar o número 1, 2, 3, 4 ou 0, conforme a natureza do cargo: 1 - exige nível superior completo ou nível médio com especialização, exceto quando se enquadrar nos códigos 2 ou 3 (Ex: Magistrados, Técnicos em Contabilidade, etc.); 2 - ";
	$(document).ready(function() {
		$('#mesAnoFolha').inputmask('99/9999');
		$(":input").inputmask();
		$('.ui.dropdown').dropdown();
		$('.menu').popup({
			inline : true,
			hoverable : true,
		});
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
<div class="ui main raised text container">

	<div class="ui attached message">
		<h3 class="ui right floated header">
			<c:if test="${not empty servidor.matricula }">
				<a class="ui teal right ribbon label">ID - ${servidor.id} |
					Matrícula - ${servidor.matricula}</a>
			</c:if>
		</h3>
		<div class="header">Servidores Ativos e Inativos</div>
		<p>Dados cadastrais e financeiros de todos os servidores ativos e
			inativos do Orgão, membros do poder, comissionados, temporários e
			pensionistas</p>
	</div>
	<form class="ui form attached fluid compact segment"
		action="${linkTo[ServidorController].adiciona(null)}" method="post">

		<h4 class="ui dividing blue header">ORGÃO</h4>

		<input type="hidden" name="servidor.id" id="id" value="${servidor.id}">
		<div class="small fields">
			<div class="ui small six wide field">
				<label for="orgao" class="menu" data-title="Orgão"
					data-position="top left"
					data-content="Informar o nome do orgão (Ex: Secretaria de Educação).">Orgão</label>
				<select class="ui fluid dropdown selection" name='servidor.orgao'
					id='orgao'>
					<c:choose>
						<c:when test="${not empty servidor.orgao}">
							<option id="select" value="${servidor.orgao}">${servidor.orgao}</option>
						</c:when>
						<c:otherwise>
							<option id="select" value="PROCON/PB">PROCON-PB</option>					
						</c:otherwise>
					</c:choose>
					<option value="Defensoria Pública da Paraíba">Defensoria Pública da Paraíba</option>
				</select>

			</div>
			<div class="ui six wide small field">
				<label for="esfera" class="menu" data-title="Esfera"
					data-position="top left"
					data-content="Informar o número 1 ou 2 (1 - Estadual, 2 - Municipal).">Esfera</label>
				<input type="text" name="servidor.esfera" id="esfera"
					value="${servidor.esfera}">
				<select class="ui fluid dropdown selection" name='servidor.orgao'
					id='orgao'>
					<c:choose>
						<c:when test="${not empty servidor.orgao}">
							<option id="select" value="${servidor.orgao}">${servidor.orgao}</option>
						</c:when>
						<c:otherwise>
							<option id="select" value="PROCON/PB">PROCON-PB</option>					
						</c:otherwise>
					</c:choose>
					<option value="Defensoria Pública da Paraíba">Defensoria Pública da Paraíba</option>
				</select>

			</div>
		</div>
		<div class="fields">
			<div class="ui four wide small field">
				<label for="municipio" class="menu" data-title="Município"
					data-position="top left"
					data-content="Informar o nome do município (Para os arquivos da esfera estadual informar o nome da capital do estado).">Municipio</label>
				<input type="text" name="servidor.municipio" id="municipio"
					value="${servidor.municipio}">
			</div>
			<div class="two wide small field">
				<label for="uf" class="menu" data-title="UF"
					data-position="top left"
					data-content="Informar a UF do orgão (Ex: GO, DF, SP, etc).">UF</label>
				<input type="text" name="servidor.uf" id="uf" value="${servidor.uf}">
			</div>
		</div>
		<h4 class="ui dividing blue header">SERVIDOR</h4>
		<div class="fields">
			<div class="eight wide small field">
				<label for="nome" class="menu" data-title="Nome do Servidor"
					data-position="top left"
					data-content="Informar o nome completo do servidor (ativo, aposentado ou instituidor de pensão).">Nome
					do Servidor </label> <input type="text" name="servidor.nome" id="nome"
					value="${servidor.nome}">
			</div>
			<div class="field">
				<label for="cpf" class="menu" data-title="CPF do Servidor"
					data-position="top left"
					data-content="Informar o CPF do servidor com 11 digitos (Ex: 12345678910)">CPF
					do Servidor </label> <input type="text" name="servidor.cpf" id="cpf"
					value="${servidor.cpf}" placeholder="11 digitos, sem pontuação">
			</div>
			<div class="three wide small field">
				<label for="matricula" class="menu" data-title="Matrícula"
					data-position="top left"
					data-content="Informar o código utilizado internamente por esse orgão para identificar o servidor.">Matrícula</label>
				<input type="text" name="servidor.matricula" id="matricula"
					value="${servidor.matricula}"
					placeholder="Informe a codificação utilizada pelo orgão">
			</div>
		</div>
		<div class="fields">
			<div class="four wide small field">
				<label for="regime" class="menu" data-title="Regime"
					data-position="top left"
					data-content="Informar o número 1 ou 2 (1 - Civil, 2 - Militar)">Regime</label>
				<select class="ui fluid dropdown selection" name='servidor.regime'
					id='regime'>
					<c:choose>
						<c:when test="${servidor.regime == '1'}">
							<option id="select" value="${servidor.regime}">${servidor.regime} - Civil</option>
							<option value="2">2 - Militar</option>
						</c:when>
						<c:when test="${servidor.regime == '2 - Militar'}">
							<option id="select" value="${servidor.regime}">${servidor.regime} - Militar</option>
							<option value="1">1 - Civil</option>
						</c:when>
						<c:otherwise>
							<option id="select" value="1">1 - Civil</option>
							<option value="2">2 - Militar</option>
						</c:otherwise>
					</c:choose>
				</select>
			</div>
			<div class="field">
				<label for="cargo" class="menu" data-title="Cargo"
					data-position="top left"
					data-content="Informar a mesma descrição utilizada por esse orgão (Ex: assistente, auditor, etc).">Cargo</label>
				<input type="text" name="servidor.cargo" id="cargo"
					value="${servidor.cargo}"
					placeholder="Utilize a mesma descrição utilizada no orgão">
			</div>
			<div class="six wide small field">
				<label for="naturezaCargo" class="menu"
					data-title="Natureza do Cargo" data-position="top left"
					data-content="Informar o número 1, 2, 3, 4 ou 0, conforme a natureza do cargo: 
				1 - exige nível superior completo ou nível médio com especialização, exceto quando se enquadrar nos códigos 2 ou 3 (Ex: Magistrados, Técnicos em Contabilidade, etc.); 
				2 - profissão regulamentada privativa de profissionais de saúde (Ex: Médicos, Assistentes Sociais, Técnicos em Enfermagem, etc.); 
				3 - Professor; 
				4 - Eletivo (Ex: Prefeitos, Vereadores, etc.; 0 Outras.)"
				data-variation="very wide">Natureza
					do Cargo</label> <select class="ui fluid dropdown selection"
					name='servidor.naturezaCargo' id='naturezaCargo'>
					<c:choose>
					<c:when test="${servidor.naturezaCargo == '1'}">
						<option id="select" value="${servidor.naturezaCargo}">${servidor.naturezaCargo}
							- Exige nível superior ou nível médio com especialização</option>
						<option value="2">2 - Profissão regulamentada privativa
							de profissionais de saúde</option>
						<option value="3">3 - Professor</option>
						<option value="4">4 - Eletivo (Ex: Prefeitos, Vereadores,
							etc.)</option>
						<option value="0">0 - Outras</option>
					</c:when>
					<c:when test="${servidor.naturezaCargo == '2'}">
						<option id="select" value="${servidor.naturezaCargo}">${servidor.naturezaCargo}
							- Profissão regulamentada privativa de profissionais de saúde</option>
						<option value="1">1 - Exige nível superior ou nível médio
							com especialização</option>
						<option value="3">3 - Professor</option>
						<option value="4">4 - Eletivo (Ex: Prefeitos, Vereadores,
							etc.)</option>
						<option value="0">0 - Outras</option>
					</c:when>
					<c:when test="${servidor.naturezaCargo == '3'}">
						<option id="select" value="${servidor.naturezaCargo}">${servidor.naturezaCargo}
							- Professor</option>
						<option value="1">1 - Exige nível superior ou nível médio
							com especialização</option>
						<option value="2">2 - Profissão regulamentada privativa
							de profissionais de saúde</option>
						<option value="4">4 - Eletivo (Ex: Prefeitos, Vereadores,
							etc.)</option>
						<option value="0">0 - Outras</option>
					</c:when>
					<c:when test="${servidor.naturezaCargo == '4'}">
						<option id="select" value="${servidor.naturezaCargo}">${servidor.naturezaCargo}
							- Eletivo (Ex: Prefeitos, Vereadores, etc.)</option>
						<option value="1">1 - Exige nível superior ou nível médio
							com especialização</option>
						<option value="2">2 - Profissão regulamentada privativa
							de profissionais de saúde</option>
						<option value="3">3 - Professor</option>
						<option value="0">0 - Outras</option>
					</c:when>
					<c:when test="${servidor.naturezaCargo == '0'}">
						<option id="select" value="${servidor.naturezaCargo}">${servidor.naturezaCargo}
							- Outras</option>
						<option value="1">1 - Exige nível superior ou nível médio
							com especialização</option>
						<option value="2">2 - Profissão regulamentada privativa
							de profissionais de saúde</option>
						<option value="3">3 - Professor</option>
						<option value="4">4 - Eletivo (Ex: Prefeitos, Vereadores,
							etc.)</option>
					</c:when>
					<c:otherwise>
						<option id="select" value="1">1 - Exige nível superior ou nível médio com especialização</option>
						<option value="2">2 - Profissão regulamentada privativa de profissionais de saúde</option>
						<option value="3">3 - Professor</option>
						<option value="4">4 - Eletivo (Ex: Prefeitos, Vereadores, etc.)</option>
						<option value="0">0 - Outras</option>					
					</c:otherwise>
					</c:choose>
				</select>
			</div>
		</div>
		<div class="fields">

			<div class="field">
				<label for="dataExercicio" class="menu" data-title="Data de Exercício"
					data-position="top left"
					data-content="Formato: dd/mm/aaa. Informar a data de admissão do servidor no orgão">Data
					de Exercício</label>
				<fmt:formatDate var="datEx" value="${servidor.dataExercicio.time}"
					pattern="dd/MM/yyyy" />
				<input data-inputmask="'alias': 'date'" id="dataExercicio"
					name="servidor.dataExercicio" type="text" value="${datEx}" />
			</div>
			<div class="field">
				<label for="dataAposentadoria" class="menu" data-title="Data da Aposentadoria"
					data-position="top left"
					data-content="Formato: dd/mm/aaa. Informar apenas quando for aposentado
					ou instituidor de pensão que estava aposentado quando faleceu">Data da Aposentadoria</label>
				<fmt:formatDate var="datAp"
					value="${servidor.dataAposentadoria.time}" pattern="dd/MM/yyyy" />
				<input data-inputmask="'alias': 'date'" id="dataAposentadoria"
					name="servidor.dataAposentadoria" type="text" value="${datAp}" />

			</div>
			<div class="field">
				<label for="dataExclusao" class="menu" data-title="Data Exclusão"
					data-position="top left"
					data-content="Formato: dd/mm/aaa. Informar apenas nos casos de exoneração, demissão, cancelamento
					de aposentadoria ou cancelamento de pensão. Se o servidor/pensionista se enquadrar em um desses casos,
					mas a data de exclusão não existir no sistema, informar '11/11/1911'. Se o servidor/pensionista se enquadrar
					em um desses casos e não recebeu valor algum em folha de pagamento do mês auditado, ele não deve
					constar no arquivo." data-variation="wide">Data Exclusão</label>
				<fmt:formatDate var="datEc" value="${servidor.dataExclusao.time}"
					pattern="dd/MM/yyyy" />
				<input data-inputmask="'alias': 'date'" id="dataExclusao"
					name="servidor.dataExclusao" type="text" value="${datEc}" />
			</div>
		</div>
		<div class="fields">
			<div class="six wide field">
				<label for="jornada" class="menu" data-title="Jornada Semanal de Trabalho"
					data-position="top left"
					data-content="Informar a jornada semanal de trabalho (Ex: 20, 35, 40). Caso o servidor
					esteja em regime de dedicação exclusiva, informar 99. Quando se tratar de aposentado
					ou instituidor de pensão, deixar em branco." data-variation="wide">Jornada Semanal de Trabalho</label> <input
					type="text" name="servidor.jornada" id="regime"
					value="${servidor.jornada}"
					placeholder="Ex. (20, 35, 40). 99 - dedicação exclusiva. Em branco - Aposentado ou Instituidor de pensão.">
			</div>
			<div class="field">
				<label for="categoriaSituacao" class="menu" data-title="Categoria da situação"
					data-position="top left"
					data-content="Informar um número de 1 a 8, classificando a situação em uma das categorias abaixo:
					1 - de carreira em exercício no próprio órgão (com ou sem cargo/função em comissão);
					2 - ocupante de cargo em comissão sem vínculo com a Administração Pública;
					3 - em exercício em outro orgão (Ex: cedigo, removido, exercício provisório);
					4 - inativo (aposentado, reformado ou reserva remunerada);
					5 - intituidor de pensão por morte;
					6 - do quadro de outro orgão (Ex: requisitado, exercício provisório, etc.);
					7 - contratado por tempo determinado por excepcional interesse público;
					8 - outras situações." data-variation="very wide">Categoria da situação</label> 
					<select class="ui fluid dropdown selection"
					name='servidor.categoriaSituacao' id='categoriaSituacao'>
					<c:choose>
					<c:when test="${servidor.categoriaSituacao == '1'}">
						<option id="select" value="${servidor.categoriaSituacao}">${servidor.categoriaSituacao}
							- De carreira em exercício no próprio orgão</option>
						<option value="2">2 - Ocupante de cargo em comissão</option>
						<option value="3">3 - Em exercício em outro orgão</option>
						<option value="4">4 - Inativo</option>
						<option value="5">5 - Instituidor de pensão por morte</option>
						<option value="6">6 - Do quadro de outro orgão</option>
						<option value="7">7 - Contratado por tempo determinado</option>
						<option value="8">8 - Outras situações</option>
					</c:when>
					<c:when test="${servidor.categoriaSituacao == '2'}">
						<option id="select" value="${servidor.categoriaSituacao}">${servidor.categoriaSituacao}
							- Ocupante de cargo em comissão</option>
						<option value="1">1 - De carreira em exercício no próprio
							orgão</option>
						<option value="3">3 - Em exercício em outro orgão</option>
						<option value="4">4 - Inativo</option>
						<option value="5">5 - Instituidor de pensão por morte</option>
						<option value="6">6 - Do quadro de outro orgão</option>
						<option value="7">7 - Contratado por tempo determinado</option>
						<option value="8">8 - Outras situações</option>
					</c:when>
					<c:when test="${servidor.categoriaSituacao == '3'}">
						<option id="select" value="${servidor.categoriaSituacao}">${servidor.categoriaSituacao}
							- Em exercício em outro orgão</option>
						<option value="1">1 - De carreira em exercício no próprio
							orgão</option>
						<option value="2">2 - Ocupante de cargo em comissão</option>
						<option value="4">4 - Inativo</option>
						<option value="5">5 - Instituidor de pensão por morte</option>
						<option value="6">6 - Do quadro de outro orgão</option>
						<option value="7">7 - Contratado por tempo determinado</option>
						<option value="8">8 - Outras situações</option>
					</c:when>
					<c:when test="${servidor.naturezaCargo == '4'}">
						<option id="select" value="${servidor.categoriaSituacao}">${servidor.categoriaSituacao}
							- Inativo</option>
						<option value="1">1 - De carreira em exercício no próprio
							orgão</option>
						<option value="2">2 - Ocupante de cargo em comissão</option>
						<option value="3">3 - Em exercício em outro orgão</option>
						<option value="5">5 - Instituidor de pensão por morte</option>
						<option value="6">6 - Do quadro de outro orgão</option>
						<option value="7">7 - Contratado por tempo determinado</option>
						<option value="8">8 - Outras situações</option>
					</c:when>
					<c:when test="${servidor.naturezaCargo == '5'}">
						<option id="select" value="${servidor.categoriaSituacao}">${servidor.categoriaSituacao}
							- Instituidor de pensão por morte</option>
						<option value="1">1 - De carreira em exercício no próprio
							orgão</option>
						<option value="2">2 - Ocupante de cargo em comissão</option>
						<option value="3">3 - Em exercício em outro orgão</option>
						<option value="4">4 - Inativo</option>
						<option value="6">6 - Do quadro de outro orgão</option>
						<option value="7">7 - Contratado por tempo determinado</option>
						<option value="8">8 - Outras situações</option>
					</c:when>
					<c:when test="${servidor.naturezaCargo == '6'}">
						<option id="select" value="${servidor.categoriaSituacao}">${servidor.categoriaSituacao}
							- Do quadro de outro orgão</option>
						<option value="1">1 - De carreira em exercício no próprio
							orgão</option>
						<option value="2">2 - Ocupante de cargo em comissão</option>
						<option value="3">3 - Em exercício em outro orgão</option>
						<option value="4">4 - Inativo</option>
						<option value="5">5 - Instituidor de pensão por morte</option>
						<option value="7">7 - Contratado por tempo determinado</option>
						<option value="8">8 - Outras situações</option>
					</c:when>
					<c:when test="${servidor.naturezaCargo == '7'}">
						<option id="select" value="${servidor.categoriaSituacao}">${servidor.categoriaSituacao}
							- Contratado por tempo determinado</option>
						<option value="1">1 - De carreira em exercício no próprio
							orgão</option>
						<option value="2">2 - Ocupante de cargo em comissão</option>
						<option value="3">3 - Em exercício em outro orgão</option>
						<option value="4">4 - Inativo</option>
						<option value="5">5 - Instituidor de pensão por morte</option>
						<option value="6">6 - Do quadro de outro orgão</option>
						<option value="8">8 - Outras situações</option>
					</c:when>
					<c:when test="${servidor.naturezaCargo == '8'}">
						<option id="select" value="${servidor.categoriaSituacao}">${servidor.categoriaSituacao}
							- Outras situações</option>
						<option value="1">1 - De carreira em exercício no próprio
							orgão</option>
						<option value="2">2 - Ocupante de cargo em comissão</option>
						<option value="3">3 - Em exercício em outro orgão</option>
						<option value="4">4 - Inativo</option>
						<option value="5">5 - Instituidor de pensão por morte</option>
						<option value="6">6 - Do quadro de outro orgão</option>
						<option value="7">7 - Contratado por tempo determinado</option>
					</c:when>
					<c:otherwise>
						<option id="select" value="1">1 - De carreira em exercício no próprio orgão</option>
						<option value="2">2 - Ocupante de cargo em comissão</option>
						<option value="3">3 - Em exercício em outro orgão</option>
						<option value="4">4 - Inativo</option>
						<option value="5">5 - Instituidor de pensão por morte</option>
						<option value="6">6 - Do quadro de outro orgão</option>
						<option value="7">7 - Contratado por tempo determinado</option>
						<option value="8">8 - Outras situações</option>					
					</c:otherwise>
					</c:choose>
				</select>

			</div>
		</div>
		<h4 class="ui dividing blue header">PENSIONISTA</h4>
		<div class="fields">
			<div class="eight wide small  field">
				<label for="nomePensionista" class="menu" data-title="Nome do Pensionista"
					data-position="top left"
					data-content="Se o servidor for instituidor de pensão, informar o nome completo do pensionista.
					Nos demais casos deixar em branco.">Nome do pensionista</label> <input
					type="text" name="servidor.nomePensionista" id="nomePensionista"
					value="${servidor.nomePensionista}"
					placeholder="Nome completo do pensionista, caso contrário deixar em branco">
			</div>
			<div class="four wide small  field">
				<label for="cpfPensionista" class="menu" data-title="CPF Pensionista"
					data-position="top left"
					data-content="Se o servidor for instituidor de pensão, informar o CPF do pensionista
					com 11 digitos. Nos demais casos deixar em branco.">CPF Pensionista</label> <input
					type="text" name="servidor.cpfPensionista" id="cpfPensionista"
					value="${servidor.cpfPensionista}"
					placeholder="11 digitos, sem pontos.">
			</div>
		</div>
		<h4 class="ui dividing green header">REMUNERAÇÃO</h4>
		<div class="fields">
			<div class="four wide small  field">
				<label for="mesAnoFolha" class="menu" data-title="Mês da Folha/Ano"
					data-position="top left"
					data-content="Informar o mês da folha de pagamento no formato mm/aaaa">Mês da folha/Ano</label> <input
					id="mesAnoFolha" name="servidor.mesAnoFolha" type="text"
					value="${servidor.mesAnoFolha}" />
			</div>
			<div class="four wide small  field">
				<label for="valorBruto" class="menu" data-title="Valor Bruto (R$)"
					data-position="top left"
					data-content="Informar o valor bruto da remuneração/provento/pensão, com vírgula 
					e 2 casas decimais (Ex: 12580,00). Obs. Não informar ' . '">Valor Bruto (R$)</label> <input
					data-inputmask="'alias': 'numeric', 
					'radixPoint': ',', 
					'groupSeparator': '', 
					'autoGroup': true, 
					'digits': 2, 
					'digitsOptional': false, 
					'prefix': '', 
					'placeholder': '0,00'"
					type="text" name="servidor.valorBruto" id="valorBruto"
					value="${servidor.valorBruto}">
			</div>
			<div class="four wide small  field">
				<label for="valorTeto" class="menu" data-title="Valor para Teto (R$)"
					data-position="top left"
					data-content="Informar o valor bruto da linha anterior menos os valores que não entram 
					para o cálculo do teto remuneratório, tais como:
					- pagamentos retroativos;
					- parcelas indenizatórias (Ex: auxílio alimentação, auxílio transporte, etc.);
					- horas extras;
					Informar o valor com virgula e 2 casas decimais (Ex: 12580,00).
					Obs. Não informar ' . '" data-variation="wide">Valor para Teto (R$)</label> <input
					data-inputmask="'alias': 'numeric', 
					'radixPoint': ',', 
					'groupSeparator': '', 
					'autoGroup': true, 
					'digits': 2, 
					'digitsOptional': false, 
					'prefix': '', 
					'placeholder': '0,00'"
					type="text" name="servidor.valorTeto" id="valorTeto"
					value="${servidor.valorTeto}">
			</div>
			<div class="four wide small  field">
				<label for="valorAbateTeto" class="menu" data-title="Valor abate Teto (R$)"
					data-position="top left"
					data-content="Informar o valor do abate teto. Para os casos que não exista abate teto,
					informar 0,00. Informar o valor com virgula e 2 casas decimais (Ex: 12580,00)
					Obs. Não informar ' . '">Valor abate Teto (R$)</label> <input
					data-inputmask="'alias': 'numeric', 
					'radixPoint': ',', 
					'groupSeparator': '', 
					'autoGroup': true, 
					'digits': 2, 
					'digitsOptional': false, 
					'prefix': '', 
					'placeholder': '0,00'"
					type="text" name="servidor.valorAbateTeto" id="valorAbateTeto"
					value="${servidor.valorAbateTeto}">
			</div>
		</div>
		<button class="ui button" type="submit">Salvar</button>
	</form>
	<c:if test="${not empty message }">
		<div class="ui info message">
			<i class="close icon"></i>
			<div class="header">${message}</div>
			<ul class="list">
				<li>Preencha com cuidados os dados do formulário.</li>
				<li>Qualquer dúvida ou problema encontrato solicite ajuda.</li>
			</ul>
		</div>
	</c:if>
	<c:if test="${not empty errors }">
		<div class="ui bottom attached warning message">
			<c:forEach var="error" items="${errors}">
		${error.category} - ${error.message} <br />
			</c:forEach>
		</div>
	</c:if>
</div>
<c:import url="/WEB-INF/jsp/footer.jsp" />