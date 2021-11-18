<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
<script src="http://jqueryvalidation.org/files/dist/jquery.validate.js"></script>

<script>
	$(document).ready(function() {
		$('.parallax').parallax();

	});
</script>


<title>NÚCLEOS</title>
</head>
<body>

	<!--menu superior-->
	<header>
		<nav>
			<nav class="menu-superior green">
				<div class="nav-wrapper container">
					<a href="./index.jsp" class="brand-logo">NÚCLEOS</a>
					<ul id="nav-mobile" class="right hide-on-med-and-down">
						<li><a href="./login.jsp">Entrar</a></li>
					</ul>
				</div>
			</nav>
		</nav>

		<!-- primeiro slide -->

		<div id="index-banner" class="parallax-container">
			<br>
			<br>
			<br>
			<br>
			<div class="section no-pad-bot"></div>
			<div class="parallax">
				<img src="./img/logotipo.png" alt="Nucleos logotipo">
			</div>
		</div>


		<div class="container">
			<div class="section">

				<!--   Icon Section   -->
				<div class="row">
					<div class="col s12 m12">
						<div class="icon-block">
							<h2 class="center brown-text">
								<i class="material-icons">lightbulb_outline</i>
							</h2>
							<h5 class="center">O que é a Núcleos</h5>
							<p class="light">O que acham de um site que futuramente pode
								vir a ser um aplicativo? Então, iremos desenvolver um site que
								irá fazer a ligação entre as empresas que desejam doar, para as
								ONGs e com as pessoas que queiram ser voluntários. Mas antes de
								falar como iremos fazer isso acontecer quero falar o porquê de
								escolhermos essa cor para o nosso site. Bom, o verde representa
								a esperança e a saúde o que também é o nosso objetivo. Com isso
								desenvolvemos um site onde as ONGs, as empresas e pessoas que
								desejam ser voluntários se cadastrem.</p>
						</div>
					</div>
				</div>
			</div>
		</div>


		<div class="parallax-container valign-wrapper">
			<div class="section no-pad-bot"></div>
			<div class="parallax">
				<img src="img/empresa.png" alt="Unsplashed background img 2">
			</div>
		</div>

		<div class="container">
			<div class="section">

				<div class="row">
					<div class="col s12 m4">
						<div class="icon-block">
							<h2 class="center brown-text">
								<i class="material-icons">group</i>
							</h2>
							<h5 class="center">ONGs</h5>
							<p class="light">Atualmente existem 187 ONGS na região
								metropolitana de Recife, atendendo centenas de crianças e jovens
								das comunidades carentes da capital pernambucana. Entretanto,
								este site irá mostrar todas as ONGs que estão precisando de
								doações e de ajuda de pessoas que desejam ser voluntárias.</p>
						</div>
					</div>

					<div class="col s12 m4">
						<div class="icon-block">
							<h2 class="center brown-text">
								<i class="material-icons">business</i>
							</h2>
							<h5 class="center">Empresas</h5>
							<p class="light">O apoio das empresas em relação as ONGs são
								muito importantes, pois elas estão contribuindo para que as
								Organizações Não Governamentais mudem a vida de milhares de
								jovens. Ao cadastrar sua empresa na Núcleos você poderá
								acompanhar e escolher para qual instituição doar.</p>
						</div>
					</div>

					<div class="col s12 m4">
						<div class="icon-block">
							<h2 class="center brown-text">
								<i class="material-icons">accessibility</i>
							</h2>
							<h5 class="center">Voluntários</h5>
							<p class="light">Segundo o IBGE, no ano de 2018 7,4 milhões
								de pessoas fazem trabalhos voluntários no Brasil. Com isso, no
								mesmo ano Pernambuco tinha 149 mil pessoas sendo voluntárias.
								Nesse site você pode se cadastrar e fazer o bem na ONG mais
								próxima de você.</p>
						</div>
					</div>
				</div>

			</div>
		</div>


		<div class="parallax-container valign-wrapper">
			<div class="section no-pad-bot">
				<div class="container"></div>
			</div>
			<div class="parallax">
				<img src="img/socialpng.png" alt="Unsplashed background img 3">
			</div>
		</div>
	</header>
	<footer class="page-footer green">
		<div class="footer-copyright green">
			<div class="container">© NÚCLEOS 2021 - Made in Recife</div>
		</div>
	</footer>
</body>
</html>