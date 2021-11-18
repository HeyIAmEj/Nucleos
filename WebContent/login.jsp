<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset=UTF-8>
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
		$('#forgot-page').hide();
		$('#d-page').hide();
		$('#e-page').hide();
		$('#i-page').hide();
		$("#loadingLogin").hide();
		$("#loading1").hide();
		$("#loading2").hide();
		$("#loading3").hide();
		$("#loadingForgot").hide();
		$("#erroForgot").hide();

		$('#cadastrarButton').click(function() {
			$('#login-page').hide();
			$('#escolher-page').show();
		});
		$('#loginButton').click(function() {
			$('#cadastrar-page').hide();
			$('#login-page').show();
		});
		$('#forgotButton').click(function() {
			$('#login-page').hide();
			$('#forgot-page').show();
		});
		$('.cadastrar-page').click(function() {
			$('#d-page').hide();
			$('#e-page').hide();
			$('#i-page').hide();
			$('#escolher-page').show();
		});
		$("#l-button").click(function() {
			$('#escolher-page').hide();
			$('#login-page').show();
		});
		$("#forgot-login-button").click(function() {
			$('#forgot-page').hide();
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
			//add characterCounter nos inputs

			var nome = $("#nome1").val();
			var sobrenome = $("#sobrenome1").val();
			var email = $("#email1").val();
			var senha = $("#senha1").val();
			var senhaC = $("#senha1C").val();
			var documento = $("#cpf1").val();
			var celular = $("#celular1").val();
			
			var bairro = $("#bairro1").val();
			
			var liberado = true;
			var liberadoImg = true;
			var regExp = /[a-zA-Z]/g;
			var numeros = /\d/;
			var arroba = /@/g;
			var ponto = /\./g;
			var traco = /-/g;
			var virgula = /\,/g;
			
			 if($("#obrigatorio1").prop("checked") == true){
	                liberado = true;
	            }
	            else if($("#obrigatorio1").prop("checked") == false){
	                liberado = false;
	                alert("Por favor, aceite os termos para continuar.");
	            }
			if(numeros.test(nome) == true || nome == "" || nome == null || nome.length < 1 || nome.length > 20){
				liberado = false;
				alert("Por favor, indique um nome válido.");
				$("#nome1").val("");
				$("#nome1").focus();
			}
			if(numeros.test(sobrenome) == true || sobrenome == "" || sobrenome == null || sobrenome.length < 1 || sobrenome.length > 20){
				liberado = false;
				alert("Por favor, indique um sobrenome válido.");
				$("#sobrenome1").val("");
				$("#sobrenome1").focus();
			}
			if(!(arroba.test(email)) || !(ponto.test(email)) || email == "" || email == null){
				liberado = false;	
				alert("Por favor, indique um e-mail válido.");
				$("#email1").val("");
				$("#email1").focus();
			}
			if(senha != senhaC){
				liberado = false;	
				alert("Por favor, digite a mesma senha!");
				$("#senha1").val("");
				$("#senha1C").focus();
			}
			if(virgula.test(documento) == true || traco.test(documento) == true || ponto.test(documento) == true || regExp.test(documento) == true || documento == "" || documento == null || documento.length <= 10 || documento.length >= 12){
				liberado = false;
				alert("Por favor, indique um cpf válido.");
				$("#cpf1").val("");
				$("#cpf1").focus();
			}
			if(traco.test(celular) == true || regExp.test(celular) == true || celular == "" || celular == null || celular.length < 9 || celular.length > 9){
				liberado = false;
				alert("Por favor, indique um celular válido.");
				$("#celular1").val("");
				$("#celular1").focus();
			}
			if(numeros.test(bairro) == true || bairro == "" || bairro == null || bairro.length < 3 || bairro.length > 200){
				liberado = false;
				alert("Por favor, indique um bairro válido.");
				$("#bairro1").val("");
				$("#bairro1").focus();
			}
			
			
			var fup = document.getElementById('img_src1');
			var fileName = fup.value;
			var ext = fileName.substring(fileName.lastIndexOf('.') + 1);

			if (ext == "jpeg" || ext == "png" || ext == "jpg" || ext == "bmp") {
				liberadoImg = true;
			} else {
				liberadoImg = false;
			}
			
			
	           
			
			if (liberado == true && liberadoImg == true) {
				document.getElementById('cad1-form').submit();
				$("#loading1").show();
			}
			
			
			
		});

		$('#cad2Button').click(function() {
			//add characterCounter nos inputs

			var nome = $("#nome2").val();
			var sobrenome = $("#sobrenome2").val();
			var email = $("#email2").val();
			var senha = $("#senha2").val();
			var senhaC = $("#senha2C").val();
			var documento = $("#cnpj2").val();
			var celular = $("#telefone2").val();
			
			var bairro = $("#bairro2").val();
			
			var liberado = true;
			var liberadoImg = true;
			var regExp = /[a-zA-Z]/g;
			var numeros = /\d/;
			var arroba = /@/g;
			var ponto = /\./g;
			var traco = /-/g;
			var virgula = /\,/g;
			
			if($("#obrigatorio2").prop("checked") == true){
                liberado = true;
            }
            else if($("#obrigatorio2").prop("checked") == false){
                liberado = false;
                alert("Por favor, aceite os termos para continuar.");
            }
			if(numeros.test(nome) == true || nome == "" || nome == null || nome.length < 1 || nome.length > 20){
				liberado = false;
				alert("Por favor, indique um nome válido.");
				$("#nome2").val("");
				$("#nome2").focus();
			}
			if(!(arroba.test(email)) || !(ponto.test(email)) || email == "" || email == null){
				liberado = false;	
				alert("Por favor, indique um e-mail válido.");
				$("#email2").val("");
				$("#email2").focus();
			}
			if(senha != senhaC){
				liberado = false;	
				alert("Por favor, digite a mesma senha!");
				$("#senha2").val("");
				$("#senha2C").focus();
			}
			if(virgula.test(documento) == true || traco.test(documento) == true || ponto.test(documento) == true || regExp.test(documento) == true || documento == "" || documento == null || documento.length < 14 || documento.length > 14){
				liberado = false;
				alert("Por favor, indique um cpnj válido.");
				$("#cnpj2").val("");
				$("#cnpj2").focus();
			}
			if(traco.test(celular) == true || regExp.test(celular) == true || celular == "" || celular == null || celular.length < 8 || celular.length > 8){
				liberado = false;
				alert("Por favor, indique um telefone válido.");
				$("#telefone2").val("");
				$("#telefone2").focus();
			}
			if(numeros.test(bairro) == true || bairro == "" || bairro == null || bairro.length < 3 || bairro.length > 200){
				liberado = false;
				alert("Por favor, indique um bairro válido.");
				$("#bairro2").val("");
				$("#bairro2").focus();
			}
			
			var fup = document.getElementById('img_src2');
			var fileName = fup.value;
			var ext = fileName.substring(fileName.lastIndexOf('.') + 1);

			if (ext == "jpeg" || ext == "png" || ext == "jpg" || ext == "bmp") {
				liberadoImg = true;
			} else {
				liberadoImg = false;
			}


			if (liberado == true && liberadoImg == true) {
				document.getElementById('cad2-form').submit();
				$("#loading2").show();
			}
		});

		$('#cad3Button').click(function() {
			//add characterCounter nos inputs

			var nome = $("#nome3").val();
			var sobrenome = $("#sobrenome3").val();
			var email = $("#email3").val();
			var senha = $("#senha3").val();
			var senhaC = $("#senha3C").val();
			var documento = $("#registro_instituicao3").val();
			var celular = $("#telefone3").val();
			var descricao = $("#descricao3").val();
			var bairro = $("#bairro3").val();
			
			var liberado = true;
			var liberadoImg = true;
			var regExp = /[a-zA-Z]/g;
			var numeros = /\d/;
			var arroba = /@/g;
			var ponto = /\./g;
			var traco = /-/g;
			var virgula = /\,/g;
			
			if($("#obrigatorio3").prop("checked") == true){
                liberado = true;
            }
            else if($("#obrigatorio3").prop("checked") == false){
                liberado = false;
                alert("Por favor, aceite os termos para continuar.");
            }
			if(numeros.test(nome) == true || nome == "" || nome == null || nome.length < 1 || nome.length > 20){
				liberado = false;
				alert("Por favor, indique um nome válido.");
				$("#nome3").val("");
				$("#nome3").focus();
			}
			if(!(arroba.test(email)) || !(ponto.test(email)) || email == "" || email == null){
				liberado = false;	
				alert("Por favor, indique um e-mail válido.");
				$("#email3").val("");
				$("#email3").focus();
			}
			if(senha != senhaC){
				liberado = false;	
				alert("Por favor, digite a mesma senha!");
				$("#senha3").val("");
				$("#senha3C").focus();
			}
			if(virgula.test(documento) == true || traco.test(documento) == true || ponto.test(documento) == true || regExp.test(documento) == true || documento == "" || documento == null || documento.length < 14 || documento.length > 14){
				liberado = false;
				alert("Por favor, indique um registro de instituição (CNPJ) válido.");
				$("#registro_instituicao3").val("");
				$("#registro_instituicao3").focus();
			}
			if(traco.test(celular) == true || regExp.test(celular) == true || celular == "" || celular == null || celular.length < 8 || celular.length > 8){
				liberado = false;
				alert("Por favor, indique um telefone válido.");
				$("#telefone3").val("");
				$("#telefone3").focus();
			}
			if(descricao == "" || descricao == null || descricao.length < 1 || descricao.length > 200){
				liberado = false;
				alert("Por favor, indique uma descrição da instituição.");
				$("#descricao3").val("");
				$("#descricao3").focus();
			}
			if(numeros.test(bairro) == true || bairro == "" || bairro == null || bairro.length < 3 || bairro.length > 200){
				liberado = false;
				alert("Por favor, indique um bairro válido.");
				$("#bairro3").val("");
				$("#bairro3").focus();
			}
			
			var fup = document.getElementById('img_src3');
			var fileName = fup.value;
			var ext = fileName.substring(fileName.lastIndexOf('.') + 1);

			if (ext == "jpeg" || ext == "png" || ext == "jpg" || ext == "bmp") {
				liberadoImg = true;
			} else {
				liberadoImg = false;
			}
			
			
			if (liberado == true && liberadoImg == true) {
				document.getElementById('cad3-form').submit();
				$("#loading3").show();
			}
		});
		
		$("#forgotButtonSend").click(function() {
			var documento = $("#documentoForgot").val();
			var email = $("#emailForgot").val();
			var senha = $("#senhaForgot").val();
			var senhaC = $("#senhaCForgot").val();
			var liberado = true;
			var regExp = /[a-zA-Z]/g;
			var numeros = /0-9/g;
			var arroba = /@/g;
			var ponto = /\./g;
			var traco = /-/g;
			var virgula = /\,/g;

			
			if(virgula.test(documento) == true || traco.test(documento) == true || ponto.test(documento) == true || regExp.test(documento) == true || documento == "" || documento == null || documento.length < 11 || documento.length > 14){
				liberado = false;
				alert("Por favor, indique um documento válido.");
				$("#documentoForgot").val("");
				$("#documentoForgot").focus();
			}
			
			if(!(arroba.test(email)) || !(ponto.test(email)) || email == "" || email == null){
				liberado = false;	
				alert("Por favor, indique um e-mail válido.");
				$("#emailForgot").val("");
				$("#emailForgot").focus();
			}
			
			if(senha != senhaC){
				liberado = false;	
				alert("Por favor, digite a mesma senha!");
				$("#senhaCForgot").val("");
				$("#senhaCForgot").focus();
			}
			
			if(liberado == true){
			document.getElementById("forgot-form").submit();
			$("#loadingForgot").show();
			}
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
			<form id="login-form" class="login-form" action="/NucleosApp/login"
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
					<div class="input-field col s12">
						<a id="forgotButton" class="btn waves-effect green col s12">Esqueci
							minha Senha</a>
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
					<h6 class="red-text">${messageError}</h6>
					<h6 class="green-text">${messageSucess}</h6>
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


	<!-- FORGOT PAGE -->
	<div id="forgot-page" class="row">
		<div class="col s12 card-panel">
			<div class="col s12 row s12">
				<h5 class="center center-align">Esqueci minha Senha</h5>
				<hr />
				<br /> <br />
				<form class="forgot-form" action="./forgot" method="post"
					id="forgot-form" class="col 12">
					<div class="row">
						<div class="input-field col s12 validate" required>
							<i class="material-icons prefix">picture_in_picture</i> 
							<input id="documentoForgot" placeholder="Digite um documento" name="documentoForgot" type="text" class="validate" required /> 
							<label for="documentoForgot" class="validate" required>Digite apenas números</label>
							 <span class="helper-text" data-error="Obrigatório"
								data-success="Correto">Obrigatório</span>
						</div>
					</div>
					<div class="row">
						<div class="input-field col s12 validate" required>
							<i class="material-icons prefix">mail_outline</i> <input
								id="emailForgot" name="emailForgot" type="email"
								class="validate" required /> <label for="emailForgot"
								class="validate" required>Email</label> <span
								class="helper-text" data-error="Obrigatório"
								data-success="Correto">Obrigatório</span>
						</div>
					</div>
					<div class="row">
						<div class="input-field col s6 validate" required>
							<i class="material-icons prefix">lock_outline</i> <input
								id="senhaForgot" name="senhaForgot" type="password"
								class="validate" required /> <label for="senhaForgot"
								class="validate" required>Nova Senha: </label> <span
								class="helper-text" data-error="Obrigatório"
								data-success="Correto">Obrigatório</span>
						</div>
						<div class="input-field col s6 validate" required>
							<i class="material-icons prefix">lock_outline</i> <input
								id="senhaCForgot" name="senhaCForgot" type="password"
								class="validate" required /> <label for="senhaCForgot"
								class="validate" required>Confirmação de Nova Senha: </label> <span
								class="helper-text" data-error="Obrigatório"
								data-success="Correto">Obrigatório</span>
						</div>
					</div>

					<div class="input-field row">
						<div class="input-field row col s6">
							<a id="forgotButtonSend"
								class="btn waves-effect green row s12 col s12">Alterar Senha</a>
						</div>
						<div class="input-field row col s6">
							<a id="forgot-login-button"
								class="btn waves-effect green row s12 col s12">Login</a>
						</div>
					</div>
				</form>
			</div>

			<div id="loadingForgot" class="row">
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

		</div>
	</div>
	</div>


	<!-- CADASTRAR DOADOR PAGE -->

	<div id="d-page" class="row">
		<div class="col s12 card-panel">
		<h3 class="center center-align">Cadastro de Doador</h3>
			<form id="cad1-form" class="cadastrar-form" action="./Cadastro"
				method="post">
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
							id="cpf1" name="cpf1" type="text" class="validate" placeholder="Digite apenas números." required /> <label
							for="cpf1">CPF (Digite apenas números)</label>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s6">
						<i class="material-icons prefix">phone_in_talk</i> <input
							id="celular1" name="celular1" type="text" placeholder="9xxxxyyyy" class="validate"
							required /> <label for="celular1">Celular (apenas números, Ex: 9xxxxyyyy)</label>
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

      <label>
        <input type="checkbox" id="obrigatorio1" required/>
        <span class="black-text">
        <p>Aceite de privacidade: nossa responsabilidade a respeito dos seus dados  pessoais informados!</p>
        <p>Eu declaro que a minha concordância com este aviso de privacidade é manifestada de forma livre,</p>
        <p> informada e inequívoca e concorda com o tratamento de meus dados pessoais, em conformidade com a lei</p>
        <p> nº 13.709/2018 ("LGPD").</p>
        </span>
      </label>
    </p>
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
				<h3 class="center center-align">Cadastro de Empresa</h3>
		
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
							id="cnpj2" name="cnpj2" type="text" class="validate" placeholder="Digite apenas números." required /> <label
							for="cnpj2">CNPJ (Digite apenas números)</label>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s6">
						<i class="material-icons prefix">phone_in_talk</i> <input
							id="telefone2" name="telefone2" type="text" class="validate" placeholder="xxxxyyyy"
							required /> <label for="telefone2">Telefone (apenas números, Ex: xxxxyyyy)</label>
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
<label>
        <input type="checkbox" id="obrigatorio2" required/>
        <span class="black-text">
        <p>Aceite de privacidade: nossa responsabilidade a respeito dos seus dados  pessoais informados!</p>
        <p>Eu declaro que a minha concordância com este aviso de privacidade é manifestada de forma livre,</p>
        <p> informada e inequívoca e concorda com o tratamento de meus dados pessoais, em conformidade com a lei</p>
        <p> nº 13.709/2018 ("LGPD").</p>
        </span>
      </label>

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
				<h3 class="center center-align">Cadastro de Instituição</h3>
		
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
						<i class="material-icons prefix">picture_in_picture</i> 
							<input
							id="registro_instituicao3" name="registro_instituicao3" type="text" class="validate" placeholder="(CNPJ) Digite apenas números." required /> <label
							for="registro_instituicao3">Registro de Instituição (CNPJ) (Digite apenas números)</label>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s6">
						<i class="material-icons prefix">phone_in_talk</i> <input
							id="telefone3" name="telefone3" type="text" class="validate" placeholder="xxxxyyyy"
							required /> <label for="telefone3">Telefone (apenas números, Ex: xxxxyyyy)</label>
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

				<label>
        <input type="checkbox" id="obrigatorio3" required/>
        <span class="black-text">
        <p>Aceite de privacidade: nossa responsabilidade a respeito dos seus dados  pessoais informados!</p>
        <p>Eu declaro que a minha concordância com este aviso de privacidade é manifestada de forma livre,</p>
        <p> informada e inequívoca e concorda com o tratamento de meus dados pessoais, em conformidade com a lei</p>
        <p> nº 13.709/2018 ("LGPD").</p	>
        </span>
      </label>

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