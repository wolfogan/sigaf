<!doctype html>
<html lang="es">
	
	<head>
		<meta charset="utf-8"/>
		<!-- -------------------------------- Estilos CSS -------------------------------- -->
		<link rel="stylesheet" type="text/css" href="../css/normalize.css">
		<link rel="stylesheet" type="text/css" href="../css/estiloPrincipal.css">
		<link rel="stylesheet" type="text/css" href="../css/estilosnav.css">
        
               
		<!-- ------------------------------ Scripts Generales -------------------------------->
		<script type="text/javascript" src="../js/jquery.js"></script>

		<!--AQUI VA HORA Y FECHA-->
		<script src="../js/tiempoactual.js"></script>
		<script>$(function(){startWatch(); return false;});</script>
		<!-- Script tiempo -->
		
		
	</head>

	<body>
		
		<header>
			<figure id="logo"><img src="../imagenes/logo.png" alt=""></figure>
			<div id="titulo">
				<h1>SISTEMA DE GESTIÓN ACADÉMICA (SIGAF)</h1>
				<h3>Facultad de Contaduría y Administración</h3>
			</div>
			<figure id="cimarron"><img src="../imagenes/cimarron.png" alt=""></figure>
		</header>
 		@include('includes.menu')
		<div id="indicadores">
			<div id="usuariofecha">
				<div id="usuario" class="texto_body">
					Usuario: Iván Avila
				</div>
				<div id="fecha" class="texto_body">
					Fecha Actualizada
				</div>
			</div>
			<div id="ubicacion" class="texto_body">
				Login y usuarios: Iniciar sesión
			</div>
			<div id="loginmanual">
				<div id="login" class="texto_body">
					<img src="../imagenes/login.png" alt="">&nbsp;login y usuarios
				</div>
				<div id="manual" class="texto_body">
					<img src="../imagenes/manual.png" alt="">&nbsp;manual y ayuda
				</div>
			</div>
		</div>

		<section>
			<div id="usuarioContrasena">
				<fieldset id="usuarios">

					<div id="usuarioLogin">
	
							<label>Usuario: </label>
							<input style="width: 300px; height: 30px; border-radius: 5px; border-color: #DBDBEA;" type="text" name="usuario" id="usuario" size=1>
					</div>

					<div id="contrasenaLogin">

							<label>Contraseña: </label>
							<input style="width: 300px; height: 30px; border-radius: 5px; border-color: #DBDBEA;" type="password" name="contrasena" id="contrasena" size=1>
					</div>

					<div id="btnIniciarSesion">
						<input style="width:200px"class="estilo_button2" type="button" value="Iniciar Sesión" name="iniciarSesion" id="iniciarSesion">
					</div>

					<div id="RegistrarseUsuarios">Registrarse!<br> Olvidó su contraseña?</div>

				</fieldset>	

			</div>
				
		</section>
		<footer></footer>
		
	</body>
<!----------------------------------------------------------->

</html>