<!-- EMPRESA -->
<!DOCTYPE html>
<html lang="pt-br">
<head>
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
		$('.tabs').tabs();
		var senha = "${user.senha}";
		var str = $("#senhaP").text();
		$("#page-alterar").hide();

		if (str.includes(senha)){}
		$("#mostrarSenha").click(function() {
					$("#senhaP").text("Senha: "+senha);
					$("#mostrarSenha").css("visibility", "hidden");
					$("#esconderSenha").css("visibility", "visible");
		});
		$("#esconderSenha").click(function() {
					$("#senhaP").text("Senha: ");
					$("#esconderSenha").css("visibility", "hidden");
					$("#mostrarSenha").css("visibility", "visible");
		});
		$("#alterarButton").click(function() {
			$("#page-mostrar").hide();
			$("#page-alterar").show();
		});
		$("#alterarButtonVoltar").click(function() {
			$("#page-alterar").hide();
			$("#page-mostrar").show();
		});
		
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

						<a href="empresa.jsp"><img class="circle" src="${user.img_src}"></a>
						<a href="empresa.jsp"><span class="white-text name">${user.nome}</span></a> <a href="empresa.jsp"><span
							class="white-text email"> ${user.email} </span></a>
					</div></li>
				<li><a href="empresa.jsp"><i class="material-icons">account_circle</i>Dados
						do usu�rio</a></li>
				<li><div class="divider"></div></li>
				<li><a class="subheader">Doa��es</a></li>
				<li class=""><a class="waves-effect " href="index.jsp">P�gina
						Inicial</a></li>
				<li><a class="waves-effect" href="lista.jsp">Fazer Doa��o</a></li>
				<li class=""><a class="waves-effect"
					href="historicoempresas.jsp">Doa��es Empresas</a></li>
				<li><a class="waves-effect " href="historicousuarios.jsp">Doa��es
						Usu�rios</a></li>
				<li><div class="divider"></div></li>
				<li><a class="waves-effect" href="/NucleosApp/e/logout">Sair</a></li>
			</ul>
		</div>

		<div class="col s9 green">
			<div class="row">
				<nav>
					<div class="nav-wrapper green">
						<a href="#" class="brand-logo center">Dados do Usu�rio</a>
					</div>
				</nav>
			</div>
			
			<div id="page-mostrar" class="container green lighten-5">
				<div class="row col s12 green">
					<div class="col s12">
						<div class="card green lighten-1">
							<div class="card-content white-text">
<p style="text-align:center;font-weight:bold;" class="red-text center center-align">${erroLogin}</p>							
								<span class="card-title center center-align"><h4>Informa��es</h4></span>
								<div class="divider"></div>
								<br />

								<h5>
									<b>Nome da Empresa: </b> ${user.nome }
								</h5>
								<br />
								<h5>
									<b>CNPJ:</b> ${user.cnpj }
								</h5>
<br />
								<h5>
									<b>Localiza��o da Empresa: </b> ${user.bairro }
								</h5>
								<br />
								<h5>
									<b>Telefone:</b> ${user.telefone }
								</h5>
								<br />
								<h5>
									<b>Email:</b> ${user.email }
								</h5>
								<br />
								<h5>
									<b>Imagem: 
								</h5>
								
								<div class="card-image circle responsive-img">
									<img class="circle responsive-img" src="${user.img_src}">
								</div>
								<br />
								<h5>
									<span id="senhaP" style="font-weight: bold;">Senha: </span>
								</h5>
								<p>
									<a class="btn" id="mostrarSenha">Mostrar</a> <a class="btn"
										style="visibility: hidden;" id="esconderSenha">Esconder</a>
								</p>
								<br /><br />
								<button class="row col s12 btn center center-align"
								id="alterarButton">Alterar</button>
								<br /> <br />

							</div>
							

						</div>
					</div>

				</div>

				<!-- <div class="row"></div> -->

			</div>




			<div id="page-alterar" class="container green lighten-5">
				<div class="row col s12 green">
					<div class="col s12">
						<div class="card green lighten-1">
							<div class="row card-content white-text">
							<form action="./alterarPerfil" method="post">
								<span class="card-title center center-align"><h4>Alterar Informa��es</h4></span>
								<div class="divider"></div>
								<br />

								<div class="input-field col s12">
									<i class="material-icons prefix">person_outline</i> <input
									 name="alterarNome"
										type="text" required/> 
									<label for="alterarNome"  class="white-text"
										data-error="wrong" data-success="right">Nome da Empresa</label>
								</div>

								<div class="input-field col s12"><i class="material-icons prefix">pin_drop</i> <input
									  name="alterarBairro"
										type="text" required> 
									<label for="alterarBairro" class="white-text"
										data-error="wrong" data-success="right">Localiza��o da Empresa</label>
								</div>
								
								<div class="input-field col s12"><i class="material-icons prefix">phone_in_talk</i> <input
									  name="alterarCelular"
										type="text" required> 
									<label for="alterarCelular" class="white-text"
										data-error="wrong" data-success="right">Telefone da Institui��o</label>
								</div>
								<button class="row col s12 btn center center-align"
								id="alterarButtonSend">Alterar</button>
								
							</form>
							<button class="row col s12 btn center center-align"
								id="alterarButtonVoltar">Voltar</button>
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
			<div class="container center">� N�CLEOS 2021 - Made in Recife</div>
		</div>
	</footer>
</div>
</html>