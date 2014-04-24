<!doctype html>
<html lang="es">
	<head>
		<meta charset="utf-8"/>

		<!-- ///////////// Estilos CSS /////////////-->
		<link rel="stylesheet" type="text/css" href="css/normalize.css">
		<link rel="stylesheet" type="text/css" href="css/estiloPrincipal.css">
		<link rel="stylesheet" type="text/css" href="css/demo.css"/>
		<link rel="stylesheet" type="text/css" href="css/style_common.css"/>
		<link rel="stylesheet" type="text/css" href="css/style10.css"/>
		
		<!-- ///////////// Script y jQuery /////////////-->
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>
		<script src="js/tiempoactual.js"></script>
		<script>$(function(){startWatch();});</script> <!-- Script tiempo -->
	
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
</div>
<div class="container">
	<div class="main">
		<div class="view view-tenth">
			<img src="imagenes/plan.png"/>
			<div class="mask">
				<h2>Plan de estudios</h2>
				<p>
					<a href="<?=URL::to('planestudio/registro'); ?>" style="color:#004000">Registrar unidad de aprendizaje</a>
				</p>
				<p>
					<a href="<?=URL::to('planestudio/consulta'); ?>" style="color:#004000">consultar, modificar y eliminar unidad de aprendizaje.</a>
				</p>
				<!--<a href="#" class="info">Read More</a>-->
			</div>
		</div>
		<div class="view view-tenth">
			<img src="imagenes/carga.png"/>
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
			<img src="imagenes/disponibilidadd.png"/>
			<div class="mask">
				<h2>Disponibilidad docente</h2>
				<p>
					Registro, consulta, modificación, eliminación
				</p>
				<a href="#"></a>
			</div>
		</div>
		<div class="view view-tenth">
			<img src="imagenes/horario.png"/>
			<div class="mask">
				<h2>Creacion de horarios</h2>
				<p>
					Registro, consulta, modificacion, eliminacion
				</p>
				<!--<a href="#" class="info">Read More</a>-->
			</div>
		</div>
		<div class="view view-tenth">
			<img src="imagenes/calendarizacion1.png"/>
			<div class="mask">
				<h2>Calendarizacion de examenes</h2>
				<p>
					Registro, consulta, modificación, eliminación
				</p>
				<!--<a href="#" class="info">Read More</a>-->
			</div>
		</div>
		<div class="view view-tenth">
			<img src="imagenes/control.png"/>
			<div class="mask">
				<h2>Control de inasistencias</h2>
				<p>
					Registro, consulta, modificación, eliminación
				</p>
				<!--<a href="#" class="info">Read More</a>-->
			</div>
		</div>
		<div class="view view-tenth">
			<img src="imagenes/login2.png"/>
			<div class="mask">
				<h2>Login y usuarios</h2>
				<p>
					Registro, consulta, modificación, eliminación
				</p>
				<!--<a href="#" class="info">Read More</a>-->
			</div>
		</div>
		<div class="view view-tenth">
			<img src="imagenes/help.png"/>
			<div class="mask">
				<h2>Manual y ayuda</h2>
				<p>
					Registro, consulta, modificacion, eliminacion
				</p>
				<!--<a href="#" class="info">Read More</a>-->
			</div>
		</div>
	</div>
</div>
<footer></footer>
</div>


</body>
</html>