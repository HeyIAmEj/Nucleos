<!-- ONG -->
<!DOCTYPE html>
<html lang="pt-br">
<head>
<title>Núcleos</title>
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
		$('.tabs').tabs();
	}
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
						<a href="#" class="brand-logo center">Dados do Usuário</a>
					</div>
				</nav>
			</div>
			<div class="container green lighten-5">
				<div class="row col s12 green">
					<div class="col s12">
						<div class="card green lighten-1">
							<div class="card-content white-text">
								<span style="font-size:40px;" class="card-title center center-align">Informações de Contato</span>
								<br/>
								<div class="divider"></div>
								
								<h4>Nome: ${nome} ${sobrenome}</h4>
								<h4>Email: ${email}</h4>
								<h4>Celular: ${celular}</h4>
								<h4>Localização: ${localizacao}</h4>
								<a class="col s12 center center-align" href="https://api.whatsapp.com/send?phone=55${celular}&text=Oi, somos da ${user.nome}! Vimos que você nos fez uma doação. Podemos bater um papo?"><img class="center center-align" src="/NucleosApp/img/whatsapp.png"/></a>
								<br/><br/><br/><br/><br/><br/>
							</div>
						</div>
					</div>

				</div>

				<!-- <div class="row"></div> -->

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