<!DOCTYPE html>
<html lang="es">
	
	<head>
		<meta charset="utf-8"/>
		<!-- -------------------------------- Estilos CSS -------------------------------- -->
		<link rel="stylesheet" type="text/css" href="../css/normalize.css">
		<link rel="stylesheet" type="text/css" href="../css/estiloPrincipal.css">
		<link rel="stylesheet" type="text/css" href="../css/estilosnav.css">
		<link rel="stylesheet" type="text/css" href="../css/component.css"/>



        <!-- Creación de Ventanas Modales -->
		<script src="../js/ventanamodal.js"></script>
               
		<!-- ------------------------------ Scripts Generales -------------------------------->
		<script type="text/javascript" src="../js/jquery.js"></script>

		<!--AQUI VA HORA Y FECHA-->
		<script src="../js/tiempoactual.js"></script>
		<script>$(function(){startWatch(); return false;});</script>
		<!-- Script tiempo -->


	

	
	<!--PARA CARGAR EL CAPTCHA--> 
	<body>
	<!-------------------------->	

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
				Login y usuarios: Modificar contraseña
			</div>
			<div id="loginmanual">
				<div id="login" class="texto_body">
					<img src="../imagenes/login.png" alt="">&nbsp;<a href="<?=URL::to('login/logout');?>"style="text-decoration:none; color:#004000;">Logout</a>
				</div>
				<div id="manual" class="texto_body">
					<img src="../imagenes/manual.png" alt="">&nbsp;Manual
				</div>
			</div>
		</div>


		

		<section class="us_ventanasCortasMod">
			
			<h3>Contacto</h3>
			{{ $mensaje }}
			{{
				Form::open(array('url' => URL::to('usuarios/correo'), 'method' => 'get'))
			}}

			<div class="form-group">
				{{ Form::label("Nombre: ") }}
				{{ Form::input("text","name",null,array("class" => "form-control")) }}
			</div>

			<div class="form-group">
				{{ Form::label("Email: ") }}
				{{ Form::input("email","email",null,array("class" => "form-control")) }}
			</div>

			<div class="form-group">
				{{ Form::label("Asunto: ") }}
				{{ Form::input("text","subject",null,array("class" => "form-control")) }}
			</div>

			<div class="form-group">
				{{ Form::label("Mensaje: ") }}
				{{ Form::textarea("msg",null,array("class" => "form-control")) }}
			</div>
			
			{{ Form::input("hidden","contacto")}}
			{{ Form::input("submit",null,"Enviar",array("class" => "btn btn-primary")) }}

			{{ Form::close() }}
			
		</section>
		<footer>
			<!--<div id="pie_correo">email: emma.castillejos@uabc.edu.mx</div>
			<div id="pie_tel">Teléfono: 664 188 9221</div>-->

		</footer>

		
	</body>
<!----------------------------------------------------------------->

</html>