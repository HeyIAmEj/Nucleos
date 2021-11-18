<%@page import="br.com.nucleos.dao.DoacaoDAO"%>
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

						<a href="empresa.jsp"><img class="circle" src="${user.img_src}"></a>
						<a href="empresa.jsp"><span class="white-text name">${user.nome}</span></a> <a href="empresa.jsp"><span
							class="white-text email"> ${user.email} </span></a>
					</div></li>
				<li><a href="empresa.jsp"><i class="material-icons">account_circle</i>Dados
						do usuário</a></li>
				<li><div class="divider"></div></li>
				<li><a class="subheader">Doações</a></li>
				<li class=""><a class="waves-effect " href="index.jsp">Página
						Inicial</a></li>
				<li><a class="waves-effect" href="lista.jsp">Fazer Doação</a></li>
				<li class=""><a class="waves-effect "
					href="historicoempresas.jsp">Doações Empresas</a></li>
				<li><a class="waves-effect " href="historicousuarios.jsp">Doações
						Usuários</a></li>
				<li><div class="divider"></div></li>
				<li><a class="waves-effect" href="/NucleosApp/e/logout">Sair</a></li>
			</ul>
		</div>

		<div class="col s9 green">
			<div class="row">
				<nav>
					<div class="nav-wrapper green">
						<a href="#" class="brand-logo center">Últimas doações de usuários</a>
					</div>
				</nav>
			</div>
			
			<div class="container">
				<c:forEach items="${listaDoacoesDoadores}" var="item"
					varStatus="loopStatus">
					<div class="card horizontal">
						<div class="card-image circle responsive-img">
							<img src="${item.get(2) }" class="circle responsive-img" />
						</div>
						<div class="card-stacked">
							<div class="card-content">
								<p>
								<h6 class="center center-align">
									<h5><b>${item.get(0) }</b> doou para <b>${item.get(3) }</b></h5>
								</h6>
								</p>
								<div class="divider"></div>
								<span><h6><b>Data:</b> ${ item.get(8)}</h6></span>
								<span><h6><b>Doação:</b> ${item.get(6)}x ${item.get(5)}</h6></span>
								<span><h6><b>Mensagem: </b></h6>${item.get(7)}</span>
							</div>
						</div>
					</div>

				</c:forEach>
			</div>
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