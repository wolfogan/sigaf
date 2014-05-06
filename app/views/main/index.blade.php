<!doctype html>
<html lang="es">
	<head>
		<meta charset="utf-8"/>
		<link rel="stylesheet" type="text/css" href="css/normalize.css">
		<link rel="stylesheet" type="text/css" href="css/estiloPrincipal.css">
		<link rel="stylesheet" type="text/css" href="css/demo.css"/>
		<link rel="stylesheet" type="text/css" href="css/style_common.css"/>
		<link rel="stylesheet" type="text/css" href="css/style10.css"/>
		
		<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
		<!--AQUI VA HORA Y FECHA-->
		<script src="js/tiempoactual.js"></script>
		<script>$(function(){startWatch(); return false;});</script>
	</head>
	<body>
		<header>
			<figure id="logo">
				<img src="imagenes/logo.png" alt="">
			</figure>
			<div id="titulo">
				<h1>SISTEMA DE GESTIÓN ACADÉMICA (SIGAF)</h1>
				<h3>Facultad de Contaduría y Administración</h3>
			</div>
			<figure id="cimarron"><img src="imagenes/cimarron.png" alt=""></figure>
		</header>
		<div id="indicadores">
			<div id="usuariofecha">
				<div id="fecha" class="texto_body">
					<label id="reloj"></label>
				</div>
			</div>
			<div id="mensajesIcono">
				<img src="imagenes/mensajes.png" >
			</div>
		</div>
<div class="container">
	<div class="main">
		<div class="view view-tenth">
			<img src="imagenes/plan1.png"/>
			<div class="mask">
				<h2>Plan de estudios</h2>
				<p>
					<a href="<?=URL::to('planestudio/registro'); ?>" style="color:#004000">Registrar, consultar, modificar y eliminar unidad de aprendizaje.</a>
				</p>
			</div>
		</div>
		<div class="view view-tenth">
			<img src="imagenes/carga1.png"/>
			<div class="mask">
				<h2>Carga academica</h2>
				<p>
					<a href="#" style="color:#004000">Registrar carga académica</a>
				</p>
				<p>
					 consultar, eliminar carga academica
				</p>
				<a href="#"></a>
			</div>
		</div>
		<div class="view view-tenth">
			<img src="imagenes/disponibilidad1.png"/>
			<div class="mask">
				<h2>Disponibilidad docente</h2>
				<p>
					Registro, consulta, modificación, eliminación
				</p>
				<a href="#"></a>
			</div>
		</div>
		<div class="view view-tenth">
			<img src="imagenes/creacion1.png"/>
			<div class="mask">
				<h2>Creacion de horarios</h2>
				<p>
					Registro, consulta, modificacion, eliminacion
				</p>
				<!--<a href="#" class="info">Read More</a>-->
			</div>
		</div>
		<div class="view view-tenth">
			<img src="imagenes/calend1.png"/>
			<div class="mask">
				<h2>Calendarizacion de examenes</h2>
				<p>
					Registro, consulta, modificación, eliminación
				</p>
				<!--<a href="#" class="info">Read More</a>-->
			</div>
		</div>
		<div class="view view-tenth">
			<img src="imagenes/control1.png"/>
			<div class="mask">
				<h2>Control de inasistencias</h2>
				<p>
					Registro, consulta, modificación, eliminación
				</p>
				<!--<a href="#" class="info">Read More</a>-->
			</div>
		</div>
		<div class="view view-tenth">
			<img src="imagenes/login1.png"/>
			<div class="mask">
				<h2>Login y usuarios</h2>
				<p>
					Registro, consulta, modificación, eliminación
				</p>
				<!--<a href="#" class="info">Read More</a>-->
			</div>
		</div>
		<div class="view view-tenth">
			<img src="imagenes/manual1.png"/>
			<div class="mask">
				<h2>Manual y ayuda</h2>
				<p>
					Registro, consulta, modificacion, eliminacion
				</p>
			</div>
		</div>
	</div>
</div>
<footer></footer>
</div>
</body>
</html>