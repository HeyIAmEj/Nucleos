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
		$('#descricao3').characterCounter();
		$('#cadastrar-page').hide();
		$('#escolher-page').hide();
		$('#d-page').hide();
		$('#e-page').hide();
		$('#i-page').hide();
		$("#loadingLogin").hide();
		$("#loading1").hide();
		$("#loading2").hide();
		$("#loading3").hide();

		$('#cadastrarButton').click(function() {
			$('#login-page').hide();
			$('#escolher-page').show();
		});
		$('#loginButton').click(function() {
			$('#cadastrar-page').hide();
			$('#login-page').show();
		});
		$('.cadastrar-page').click(function() {
			$('#d-page').hide();
			$('#e-page').hide();
			$('#i-page').hide();
			$('#escolher-page').show();
		});
		$('#l-button').click(function() {
			$('#escolher-page').hide();
			$('#login-page').show();
		});
		$('#d-button').click(function() {
			$('#escolher-page').hide();
			$('#d-page').show();
		});
		$('#e-button').click(function() {
			$('#escolher-page').hide();
			$('#e-page').show();
		});
		$('#i-button').click(function() {
			$('#escolher-page').hide();
			$('#i-page').show();
		});

		$('#loginButton').click(function() {
			document.getElementById('login-form').submit();
			$("#loadingLogin").show();
		});

		$("#cad1-form").validate();

		$('#cad1Button').click(function() {
			var liberado = true;
			//campo nao pode estar vazio // ok, add required no html
			//cad1-form
			//campo nao pode ter poucos caracteres ex. nome com 2 letras nao pode
			//campo nao pode ter muitos caracteres
			//campos de numeros nao podem receber letras
			//senhas iguais
			//email contem @
			//arquivos apenas imagens
			//cpf 11 digitos 
			//add characterCounter nos inputs

			var fup = document.getElementById('img_src1');
			var fileName = fup.value;
			var ext = fileName.substring(fileName.lastIndexOf('.') + 1);

			if (ext == "jpeg" || ext == "png" || ext == "jpg" || ext == "bmp") {
				liberado =  true;
			} else {
				liberado = false;	
			}

			if (liberado == true){
				document.getElementById('cad1-form').submit();
				$("#loading1").show();
			}else{
				
			}
		});

		$('#cad2Button').click(function() {
			document.getElementById('cad2-form').submit();
			$("#loading2").show();
		});

		$('#cad3Button').click(function() {
			document.getElementById('cad3-form').submit();
			$("#loading3").show();
		});

		$('.cadastrar-page').click(function() {
			$("#loadingLogin").hide();
			$("#loading1").hide();
			$("#loading2").hide();
			$("#loading3").hide();
		});

	});
</script>


<title>NÚCLEOS</title>
<style>
body {
	height: 100%;
}

html {
	display: table;
	margin: auto;
}

body {
	display: table-cell;
	vertical-align: middle;
	background: #38ac38;
}

#login-page {
	width: 500px;
}
</style>
</head>

<body>
	<br />
	<br />
	<br />
	<br />
	<br />
	<header>
		<div class="row">
			<a href="index.jsp" style="text-decoration: none;"
				class="brand-logo right white-text"><i
				class="material-icons small">home</i></a>
		</div>
	</header>

	<div id="login-page" class="row">
		<div class="col s12 card-panel">
			<form id="login-form" class="login-form" action="./login.do"
				method="post">
				<div class="row"></div>
				<div class="row">
					<div class="input-field col s12">
						<i class="material-icons prefix">mail_outline</i> <input
							class="validate" id="emailLogin" name="emailLogin" type="email"
							required /> <label for="emailLogin" data-error="wrong"
							data-success="right">Email</label>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s12">
						<i class="material-icons prefix">lock_outline</i> <input
							id="senhaLogin" name="senhaLogin" type="password" required /> <label
							for="senhaLogin">Senha</label>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s6">
						<a id="loginButton" class="btn waves-effect green col s12">Login</a>
					</div>
					<div class="input-field col s6">
						<a id="cadastrarButton" class="btn waves-effect green col s12">Cadastrar</a>
					</div>
				</div>

				<div id="loadingLogin" class="row">
					<div class="input-field col s12 center center-align">
						<div class="preloader-wrapper small active">
							<div class="spinner-layer spinner-green-only">
								<div class="circle-clipper left">
									<div class="circle"></div>
								</div>
								<div class="gap-patch">
									<div class="circle"></div>
								</div>
								<div class="circle-clipper right">
									<div class="circle"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row center center-align">
					<h6 class="red-text">${erroLogin}</h6>
				</div>

			</form>
		</div>
	</div>

	<!-- DIV ESCOLHER CADASTRO PAGE -->
	<div id="escolher-page" class="row">
		<div class="col s12 card-panel">
			<div class="col s12 row s12">
				<br /> <br /> <a id="l-button"
					class="btn waves-effect green row s12 col s12">Login</a> <a
					id="d-button" class="btn waves-effect green row s12 col s12">Cadastrar
					Doador</a> <a id="e-button"
					class="btn waves-effect green row s12 col s12">Cadastrar
					Empresa</a> <a id="i-button"
					class="btn waves-effect green row s12 col s12">Cadastrar
					Instituição</a>
			</div>

		</div>
	</div>

	<!-- CADASTRAR DOADOR PAGE -->

	<div id="d-page" class="row">
		<div class="col s12 card-panel">
			<form id="cad1-form" class="cadastrar-form" action="./Cadastroo"
				method="get">
				<div class="row">
					<div class="input-field col s6">
						<i class="material-icons prefix">person_outline</i> <input
							id="nome1" name="nome1" type="text" class="validate" required />
						<label for="nome1">Nome</label>
					</div>
					<div class="input-field col s6">
						<input id="sobrenome1" name="sobrenome1" type="text"
							class="validate" required /> <label for="sobrenome1">Sobrenome</label>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s12">
						<i class="material-icons prefix">mail_outline</i> <input
							id="email1" name="email1" type="email" class="validate" required />
						<label for="email1">Email</label>
					</div>
				</div>

				<div class="row">
					<div class="input-field col s6">
						<i class="material-icons prefix">lock_outline</i> <input
							id="senha1" name="senha1" type="password" class="validate"
							required /> <label for="senha1">Senha</label>
					</div>
					<div class="input-field col s6">
						<input id="senha1C" name="senha1C" type="password"
							class="validate" required /> <label for="senha1C">Confirmar
							Senha</label>
					</div>
				</div>

				<div class="row">
					<div class="input-field col s12">
						<i class="material-icons prefix">picture_in_picture</i> <input
							id="cpf1" name="cpf1" type="text" class="validate" required /> <label
							for="cpf1">CPF</label>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s6">
						<i class="material-icons prefix">phone_in_talk</i> <input
							id="celular1" name="celular1" type="text" class="validate"
							required /> <label for="celular1">Celular</label>
					</div>
					<div class="input-field col s6">
						<i class="material-icons prefix">photo_camera</i> <input
							id="img_src1" name="img_src1" type="file" class="validate" />
					</div>
				</div>
				<div class="row">
					<div class="input-field col s12">
						<i class="material-icons prefix">pin_drop</i> <input id="bairro1"
							name="bairro1" type="text" class="validate" required /> <label
							for="bairro1">Localização</label>
					</div>
				</div>

				<input type="hidden" id="tipoUser" name="tipoUser" value="1">

				<div class="row">
					<div class="input-field col s6">
						<a id="cad1Button" class="btn waves-effect green col s12">Cadastrar</a>
					</div>
					<div class="input-field col s6">
						<a class="cadastrar-page btn waves-effect green col s12">Voltar</a>
					</div>
				</div>

				<div id="loading1" class="row">
					<div class="input-field col s12 center center-align">
						<div class="preloader-wrapper small active">
							<div class="spinner-layer spinner-green-only">
								<div class="circle-clipper left">
									<div class="circle"></div>
								</div>
								<div class="gap-patch">
									<div class="circle"></div>
								</div>
								<div class="circle-clipper right">
									<div class="circle"></div>
								</div>
							</div>
						</div>
					</div>
				</div>

			</form>
		</div>
	</div>


	<!-- CADASTRAR EMPRESA PAGE -->

	<div id="e-page" class="row">
		<div class="col s12 card-panel">
			<form id="cad2-form" class="cadastrar-form" action="./Cadastro"
				method="POST">
				<div class="row">
					<div class="input-field col s12">
						<i class="material-icons prefix">location_city</i> <input
							id="nome2" name="nome2" type="text" class="validate" required />
						<label for="nome2">Nome da Empresa</label>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s12">
						<i class="material-icons prefix">mail_outline</i> <input
							id="email2" name="email2" type="email" class="validate" required />
						<label for="email2">Email</label>
					</div>
				</div>

				<div class="row">
					<div class="input-field col s6">
						<i class="material-icons prefix">lock_outline</i> <input
							id="senha2" name="senha2" type="password" class="validate"
							required /> <label for="senha2">Senha</label>
					</div>
					<div class="input-field col s6">
						<input id="senha2C" name="senha2C" type="password"
							class="validate" required /> <label for="senha2C">Confirmar
							Senha</label>
					</div>
				</div>

				<div class="row">
					<div class="input-field col s12">
						<i class="material-icons prefix">picture_in_picture</i> <input
							id="cnpj2" name="cnpj2" type="text" class="validate" required />
						<label for="cnpj2">CNPJ</label>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s6">
						<i class="material-icons prefix">phone_in_talk</i> <input
							id="telefone2" name="telefone2" type="text" class="validate"
							required /> <label for="telefone2">Telefone</label>
					</div>
					<div class="input-field col s6">
						<i class="material-icons prefix">photo_camera</i> <input
							id="img_src2" name="img_src2" type="file" class="validate" />
					</div>
				</div>
				<div class="row">
					<div class="input-field col s12">
						<i class="material-icons prefix">pin_drop</i> <input id="bairro2"
							name="bairro2" type="text" class="validate" required /> <label
							for="bairro2">Localização</label>
					</div>
				</div>
				<input type="hidden" id="tipoUser" name="tipoUser" value="2">


				<div class="row">
					<div class="input-field col s6">
						<a id="cad2Button" class="btn waves-effect green col s12">Cadastrar</a>
					</div>
					<div class="input-field col s6">
						<a class="cadastrar-page btn waves-effect green col s12">Voltar</a>
					</div>
				</div>

				<div id="loading2" class="row">
					<div class="input-field col s12 center center-align">
						<div class="preloader-wrapper small active">
							<div class="spinner-layer spinner-green-only">
								<div class="circle-clipper left">
									<div class="circle"></div>
								</div>
								<div class="gap-patch">
									<div class="circle"></div>
								</div>
								<div class="circle-clipper right">
									<div class="circle"></div>
								</div>
							</div>
						</div>
					</div>
				</div>

			</form>
		</div>
	</div>


	<!-- CADASTRAR INSTITUIÇÃO PAGE -->

	<div id="i-page" class="row">
		<div class="col s12 card-panel">
			<form id="cad3-form" class="cadastrar-form" action="./Cadastro"
				method="POST">
				<div class="row">
					<div class="input-field col s12">
						<i class="material-icons prefix">location_city</i> <input
							id="nome3" name="nome3" type="text" class="validate" required />
						<label for="nome3">Nome da Instituição</label>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s12">
						<i class="material-icons prefix">mail_outline</i> <input
							id="email3" name="email3" type="email" class="validate" required />
						<label for="email3">Email</label>
					</div>
				</div>

				<div class="row">
					<div class="input-field col s6">
						<i class="material-icons prefix">lock_outline</i> <input
							id="senha3" name="senha3" type="password" class="validate"
							required /> <label for="senha3">Senha</label>
					</div>
					<div class="input-field col s6">
						<input id="senha3C" name="senha3C" type="password"
							class="validate" required /> <label for="senha3C">Confirmar
							Senha</label>
					</div>
				</div>

				<div class="row">
					<div class="input-field col s12">
						<i class="material-icons prefix">picture_in_picture</i> <input
							id="registro_instituicao3" name="registro_instituicao3"
							type="text" class="validate" required /> <label
							for="registro_instituicao3">Registro da Instituição</label>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s6">
						<i class="material-icons prefix">phone_in_talk</i> <input
							id="telefone3" name="telefone3" type="text" class="validate"
							required /> <label for="telefone3">Telefone</label>
					</div>
					<div class="input-field col s6">
						<i class="material-icons prefix">photo_camera</i> <input
							id="img_src3" name="img_src3" type="file" class="validate" />
					</div>
				</div>
				<div class="row">
					<div class="input-field col s12">
						<i class="material-icons prefix">message</i>
						<textarea id="descricao3" name="descricao3"
							class="materialize-textarea" data-length="200" required></textarea>
						<label for="descricao3">Fale sobre a Instituição</label>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s12">
						<i class="material-icons prefix">pin_drop</i> <input id="bairro3"
							name="bairro3" type="text" class="validate" required /> <label
							for="bairro3">Localização</label>
					</div>
				</div>

				<input type="hidden" id="tipoUser" name="tipoUser" value="3">

				<div class="row">
					<div class="input-field col s6">
						<a id="cad3Button" class="btn waves-effect green col s12">Cadastrar</a>
					</div>
					<div class="input-field col s6">
						<a class="cadastrar-page btn waves-effect green col s12">Voltar</a>
					</div>
				</div>

				<div id="loading3" class="row">
					<div class="input-field col s12 center center-align">
						<div class="preloader-wrapper small active">
							<div class="spinner-layer spinner-green-only">
								<div class="circle-clipper left">
									<div class="circle"></div>
								</div>
								<div class="gap-patch">
									<div class="circle"></div>
								</div>
								<div class="circle-clipper right">
									<div class="circle"></div>
								</div>
							</div>
						</div>
					</div>
				</div>

			</form>
		</div>
	</div>
</body>
</html>