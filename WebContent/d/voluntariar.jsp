<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<title>Núcleos</title>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!-- Configuração para mobile -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!-- Imports do Materialize -->

<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet" />
<link href="/NucleosApp/css/1.0.0/materialize.css" type="text/css"
	rel="stylesheet" media="screen,projection" />
<!-- CSS -->
<link type="text/css" rel="stylesheet"
	href="/NucleosApp/css/projeto.css" media="screen,projection" />
<!-- Scripts Materialize -->
<script src="/NucleosApp/js/1.0.0/jquery.js"></script>
<script src="/NucleosApp/js/1.0.0/materialize.js"></script>
<script>
	$(document)
			.ready(
					function() {
						$('select').formSelect();
						$('#funcao').characterCounter();
						$('#caracteristicas').characterCounter();
						$('#descricao').characterCounter();
						$('#disponibilidade').characterCounter();
						$("#simularButton").click(function() {
											$("#produto").val("Computadores");
											$("#qtd").val("10");
											$("textarea#mensagem")
													.val(
															"Espero que todos possam aprender sobre tecnologia e consigam ganhar o mundo com este aprendizado!");
											//$('option:contains("Disponivel para entrega?")').text('Sim');
											//$('select #entrega option:contains("Disponivel para entrega?")').text('Sim');

										});
						$("#simularButton").click(function() {
							$("#funcao").val("Professora de Música");
							$("textarea#caracteristicas").val("Sou muito focada na minha profissão, sou comunicativa. Meu ponto fraco é que eu tenho dificuldade em abandonar um projeto.");
							$("#disponibilidade").val("Qualquer turno");
							$("textarea#descricao").val("Trabalho com música há mais de 15 anos. Estou cursando Mestrado em Música e espero estar ajudando a Ong dando cursos para os Jovens.");

							//$('option:contains("Disponivel para entrega?")').text('Sim');
							//$('select #entrega option:contains("Disponivel para entrega?")').text('Sim');

						});
					});
</script>
</head>


<header>
	<nav class="menu-superior green">
		<div class="nav-wrapper container brand-logo">
			<a href="#" onclick="window.history.back();"> <i
				class="material-icons white-text">arrow_back</i>
			</a> <a href="index.jsp" class="brand-logo"> NÚCLEOS </a>
		</div>
	</nav>
</header>
<main>
	<h3 class="row green-text center center-align">Você está se
		voluntariando para</h3>


	<div class="row container green-text green lighten-5">
		<div class="row col s12 center center-align green">
			<div class="card">
				<div class="card-content">
					<b><span class="card-title"> ${nomeOng} </span></b>
					<p>${descricaoOng}</p>
				</div>
			</div>
		</div>
		<h6 class="center center-align red-text">${erro}</h6>



		<form class="cadastrar-form" action="./voluntariarform"
			method="POST" id="voluntariar_form" class="col 12">
			<div class="row"></div>

			<div class="row">
				<div class="input-field col s6 validate" required>
					<i class="material-icons prefix">build</i> <input id="funcao"
						name="funcao" type="text" class="validate" data-length="30"
						placeholder="Auxiliar/Cozinheirx/Advogadx/Professorx" required />
					<label for="funcao" class="validate" required>Função</label> <span
						class="helper-text" data-error="Obrigatório"
						data-success="Correto">Obrigatório</span>

				</div>

				<div class="input-field col s6">
					<i class="material-icons prefix">question_answer</i>
					<textarea id="caracteristicas" data-length="200"
						name="caracteristicas" class="materialize-textarea"
						placeholder="Fale seus pontos fortes e fracos." required></textarea>
					<label for="caracteristicas">Características</label><span
						class="helper-text" data-error="Obrigatório"
						data-success="Correto">Obrigatório</span>
				</div>
			</div>
			<div class="row">
				<div class="input-field col s6 validate" required>
					<i class="material-icons prefix">alarm</i> <input data-length="20"
						id="disponibilidade" name="disponibilidade" type="text"
						class="validate" required placeholder="Manhã/Tarde/Noite" /> <label
						for="disponibilidade" class="validate" required>Disponibilidade</label>
					<span class="helper-text" data-error="Obrigatório"
						data-success="Correto">Obrigatório</span>
				</div>

				<div class="input-field col s6">
					<i class="material-icons prefix">assignment_ind</i>
					<textarea id="descricao" name="descricao"
						class="materialize-textarea" data-length="200"
						placeholder="Fale um pouco sobre você." required></textarea>
					<label for="descricao">Descrição</label><span class="helper-text"
						data-error="Obrigatório" data-success="Correto">Obrigatório</span>
				</div>
			</div>

			<input type="hidden" name="fk_ong" value="${id}" />
			<input type="hidden" name="fk_doador" value="${user.id}" />
			<input type="hidden" name="perm" value="${user.getPermissao()}"/>
				

			<div class="row">
				<div class="input-field col s12">
					<!-- 					<a id="doarButton" class="btn waves-effect green col s12">Doar</a>
 -->
					<button id="doarButton" type="submit"
						class="btn waves-effect green col s12">Voluntariar</button>
				</div>
			</div>

		</form>
		<div class="row">
			<div class="input-field col s12">
				<button id="simularButton" class="btn waves-effect green col s12">Simular</button>
			</div>
		</div>
	</div>
	<br> <br> <br> <br>
</main>

<div id="row">
	<footer class="page-footer green">
		<div class="footer-copyright">
			<div class="container center">© NÚCLEOS 2021 - Made in Recife</div>
		</div>
	</footer>
</div>
</html>