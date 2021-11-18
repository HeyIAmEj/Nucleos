<%@page import="br.com.nucleos.dao.OngDAO"%>
<%@page import="br.com.nucleos.model.Ong"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- Configuração para mobile -->
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
						<a href="ong.jsp"><span class="white-text name">${user.nome}</span></a> <a href="ong.jsp"><span
							class="white-text email"> ${user.email} </span></a>
					</div></li>
				<li><a href="ong.jsp"><i class="material-icons">account_circle</i>Dados
						do usuário</a></li>
				<li><div class="divider"></div></li>
				<li><a class="subheader">Doações</a></li>
				<li class=""><a class="waves-effect " href="index.jsp">Página
						Inicial</a></li>
				<li><a class="waves-effect" href="donates.jsp">Para ${user.nome}</a></li>
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
						<a href="#" class="brand-logo center">Pagina Inicial</a>
					</div>
				</nav>
			</div>
			<div class="container green lighten-5">
			
				<!--  PESSOAS BENEFICIADAS -->
				<div class="col s12 m6">
					<div class="card hoverable">
						<div class="card-image">
							<img src="${item.img_src}">
						</div>
						<div class="card-content">
							<span class="card-title center center-align">Números de
								Pessoas Beneficiadas</span>
							<h1 class="center center-align">${qtdPessoas}</h1>
						</div>
					</div>
				</div>
				
				<!-- ONG RECEBERAM DOAÇÕES -->
				<div class="col s12 m6">
					<div class="card hoverable">
						<div class="card-image">
							<img src="${item.img_src}">
						</div>
						<div class="card-content">
							<span class="card-title center center-align">Quantidade de Doadores Cadastrados</span>
							<h1 class="center center-align">${qtdDoadores }</h1>
						</div>
					</div>
				</div>
				
				<!-- EMPRESAS PARCEIRAS -->
				<div class="col s12 m6">
					<div class="card hoverable">
						<div class="card-image">
							<img src="${item.img_src}">
						</div>
						<div class="card-content">
							<span class="card-title center center-align">Quantidade de Empresas Cadastradas</span>
							<h1 class="center center-align">${qtdEmpresas }</h1>
						</div>
					</div>
				</div>
				
				<!-- EMPRESAS PARCEIRAS -->
				<div class="col s12 m6">
					<div class="card hoverable">
						<div class="card-image">
							<img src="${item.img_src}">
						</div>
						<div class="card-content">
							<span class="card-title center center-align">Quantidade de
								ONGs Cadastradas</span>
							<h1 class="center center-align">${qtdOngs }</h1>
						</div>
					</div>
				</div>
				
				
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