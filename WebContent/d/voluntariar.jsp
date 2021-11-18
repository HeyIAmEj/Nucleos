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

						$("#simularButton")
								.click(
										function() {
											$("#produto").val("Computadores");
											$("#qtd").val("10");
											$("textarea#mensagem")
													.val(
															"Espero que todos possam aprender sobre tecnologia e consigam ganhar o mundo com este aprendizado!");
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



		<form class="cadastrar-form" action="./voluntariarformTESTE"
			method="GET" id="voluntariar_form" class="col 12">
			<div class="row"></div>
			<div class="row">
				<div class="input-field col s6 validate" required>
					<i class="material-icons prefix">build</i> <input id="produto"
						name="produto" type="text" class="validate" required /> <label
						for="produto" class="validate" required>Função</label> <span
						class="helper-text" data-error="Obrigatório"
						data-success="Correto">Obrigatório</span>

				</div>

				<div class="row input-field col s6">
				<label for="caracteristicas">Caracteristicas</label>
						<label class="row"> <input class="row" type="checkbox" id="caracteristicas" value="1"/> <span>Habilidade de comunicação</span></label>
				</div>
			</div>


			<div class="row">
				<div class="input-field col s12">
					<!-- 					<a id="doarButton" class="btn waves-effect green col s12">Doar</a>
 -->
					<button id="doarButton" type="submit"
						class="btn waves-effect green col s12">Doar</button>
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