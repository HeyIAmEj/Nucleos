<%@page import="br.com.nucleos.model.Doacao_Doadores"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- DOADORES -->


<!DOCTYPE html>
<html lang="pt-br">
<head>
<title>Núcleos</title>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- Configura��o para mobile -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Imports do Materialize -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link href="/NucleosApp/css/1.0.0/materialize.css" type="text/css"
	rel="stylesheet" media="screen,projection" />
<!-- CSS -->
<link type="text/css" rel="stylesheet"
	href="/NucleosApp/css/projeto.css" media="screen,projection" />
<!-- Scripts Materialize -->
<script src="/NucleosApp/js/1.0.0/jquery.js"></script>
<script src="/NucleosApp/js/bin/materialize.js"></script>
<script src="/NucleosApp/js/bin/materialize.min.js"></script>
<script>
	$(document).ready(function() {
		$('.sidenav').sidenav();
	});
</script>
<style>
.container {
	padding: 0px;
}
</style>
</head>


<header> </header>
<main class="green">

	<div class="row col 12">
		<div class="row col s3">

			<nav>
				<div class="nav-wrapper green">
					<a href="#!" class="brand-logo"></a> <a href="#"
						data-target="mobile-demo" class="sidenav-trigger"><i
						class="material-icons black-text">menu</i></a>
				</div>
			</nav>
			<ul id="mobile-demo" class="sidenav sidenav-fixed ">
				<li><div class="user-view">
						<div class="background">
							<img src="/NucleosApp/img/grey.jpg" />
						</div>

						<a href="ong.jsp"><img class="circle" src="${user.img_src}"></a>
						<a href="ong.jsp"><span class="white-text name">${user.nome}</span></a>
						<a href="ong.jsp"><span class="white-text email">
								${user.email} </span></a>
					</div></li>
				<li><a href="ong.jsp"><i class="material-icons">account_circle</i>Dados
						do usuário</a></li>
				<li><div class="divider"></div></li>
				<li><a class="subheader">Doações</a></li>
				<li class=""><a class="waves-effect " href="index.jsp">Página
						Inicial</a></li>
				<li><a class="waves-effect" href="donates.jsp">Para
						${user.nome}</a></li>
				<li class=""><a class="waves-effect "
					href="historicoempresas.jsp">Doações Empresas</a></li>
				<li><a class="waves-effect " href="historicousuarios.jsp">Doações
						Usuários</a></li>
				<li><div class="divider"></div></li>
				<li><a class="waves-effect" href="/NucleosApp/o/logout">Sair</a></li>
			</ul>
		</div>

		<div class="col s9 green">
			<div class="row">
				<nav>
					<div class="nav-wrapper green">
						<a href="#" class="brand-logo center black-text">Para
							${user.nome}</a>
					</div>
				</nav>
			</div>
			<br />
			<div class="container">
				<div class="row col s12">
					<div class="col s12">
						<div class="card center center-align">
							<a style="font-size:20px;" href="#voluntarios" class="black-text center center-align col s4">Ver Voluntários</a>
							<a style="font-size:20px;" href="#doadores" class="black-text center center-align col s4">Ver Doadores</a>
							<a style="font-size:20px;" href="#empresas" class="black-text center center-align col s4">Ver Empresas</a>
						</div>
					</div>
				</div>
			</div>
			<br /> <br />
			<c:forEach items="${listaVoluntarios}" var="item"
				varStatus="loopStatus">
				<div class="container green lighten-5">
					<div class="row col s12 green">
						<div class="col s12">
							<div class="card green lighten-1">
								<div id="voluntarios" class="card-content black-text">

									<span class="card-title center center-align"><b>${item.get(0)}</b>
										se Voluntariou para <b>${item.get(1)}</b></span>
									<div class="divider black black-text"></div>
									
									<h6>
										<b>Função:</b> ${item.get(2)}
									</h6>
									<h6>
										<b>Disponibilidade:</b> ${item.get(3)}
									</h6>
									<h6>
										<b>Características:</b> ${item.get(4)}
									</h6>
									<h6>
										<b>Descrição:</b> ${item.get(5)}
									</h6>
									<div class="card-action">
										<form action="./verUser" method="POST">
											<input type="hidden" value="${item.get(6)}" name="id" id="id" />
											<button
												class="white-text black row col s12 btn center center-align"
												type="submit">Entrar em Contato</button>
										</form>
										<br />
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
			</c:forEach>
			<br />
			<c:forEach items="${listaOngDoacaoDoadores}" var="item"
				varStatus="loopStatus">
				<div class="container green lighten-5">
					<div class="row col s12 green">
						<div class="col s12">
							<div class="card green lighten-1">
								<div id="doadores" class="card-content black-text">

									<span class="card-title center center-align"><b>${item.get(0)}</b>
										doou para <b>${item.get(1)}</b></span>
									<div class="divider black black-text"></div>

									<h6>
										<b>Data:</b> ${item.get(7)}
									</h6>
									<h6>
										<b>Doação:</b> ${item.get(5)}x ${item.get(2)}
									</h6>
									<h6>
										<b>Mensagem:</b> ${item.get(6)}
									</h6>
									<h6>
										<b>Estado:</b> ${item.get(3)}
									</h6>
									<h6>
										<b>Disponível para Entrega:</b> ${item.get(4)}
									</h6>
									<div class="card-action">
										<form action="./verUser" method="POST">
											<input type="hidden" value="${item.get(8)}" name="id" id="id" />
											<button
												class="white-text black row col s12 btn center center-align"
												type="submit">Entrar em Contato</button>
										</form>
										<br />
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
			</c:forEach>
			<br />
			<c:forEach items="${listaOngDoacaoEmpresas}" var="item"
				varStatus="loopStatus">
				<div class="container green lighten-5">
					<div class="row col s12 green">
						<div class="col s12">
							<div class="card green lighten-1">
								<div id="empresas" class="card-content black-text">

									<span class="card-title center center-align"><b>${item.get(0)}</b>
										doou para <b>${item.get(1)}</b></span>
									<div class="divider black black-text"></div>

									<h6>
										<b>Data:</b> ${item.get(7)}
									</h6>
									<h6>
										<b>Doação:</b> ${item.get(5)}x ${item.get(2)}
									</h6>
									<h6>
										<b>Mensagem:</b> ${item.get(6)}
									</h6>
									<h6>
										<b>Estado:</b> ${item.get(3)}
									</h6>
									<h6>
										<b>Disponível para Entrega:</b> ${item.get(4)}
									</h6>
									<div class="card-action">
										<form action="./verUser" method="POST">
											<input type="hidden" value="${item.get(8)}" name="id" id="id" />
											<button class="black row col s12 btn center center-align"
												type="submit">Entrar em Contato</button>
										</form>
										<br />
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</main>

<div id="row">
	<footer class="page-footer green">
		<div class="footer-copyright">
			<div class="container center">© NÚCLEOS 2021 - Made in Recife</div>
		</div>
	</footer>
</div>
</html>