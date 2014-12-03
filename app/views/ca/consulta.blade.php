<!doctype html>
<html lang="es">
<head>
<meta charset="utf-8"/>

		<link rel="stylesheet" type="text/css" href="../css/normalize.css">
		<link rel="stylesheet" type="text/css" href="../css/estiloPrincipal.css">
		<link rel="stylesheet" type="text/css" href="../css/estilosnav.css">
		<link rel="stylesheet" type="text/css" href="../css/component.css"/>

		<!-- ------------------------------ Scripts Generales -------------------------------->
		<script type="text/javascript" src="../js/jquery-2.1.0.min.js"></script>

		

<!--AQUI VA HORA Y FECHA-->
		<script src="../js/tiempoactual.js"></script>
		<script>$(function(){startWatch(); return false;});</script>
		<!-- Script tiempo -->

<!---------------------------------------------------------------------------------------->
<title>Carga académica</title>
</head>
<body>
<header>
	<figure id="logo">
	<img src="../imagenes/logo.png" alt="">
	</figure>
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
			Usuario: {{Auth::user()->username}}
		</div>
		<div id="fecha" class="texto_body">
			Fecha Actualizada
		</div>
	</div>
	<div id="ubicacion" class="texto_body">
		Carga académica: Consulta, modificación y eliminación
	</div>
	<div id="loginmanual">
		<div id="login" class="texto_body">
			<img src="../imagenes/login.png" alt="">&nbsp;<a href="<?=URL::to('login/logout');?>"style="text-decoration:none; color:#004000;">Logout</a>
		</div>
		<div id="manual" class="texto_body">
			<img src="../imagenes/manual.png" alt=""><a href="<?=URL::to('ayuda/ayudaca');?>"style="text-decoration:none; color:#004000;">&nbsp;Manual</a>
		</div>
	</div>
</div>

<section>
	<div id="statusPlanEstudios"><label>Estatus: En proceso</label></div>
			<div id="checkSubdirector">
				<input style="width:18px; height:18px;" type="checkbox" name="checkSubdirector" value="Generar"><label style="font-size:18px;">Completado</label>
			</div>

	<div id="Consultas">
		<fieldset id="consultaPlan" style="margin:auto;">
			<legend>Consultar por:</legend>

			<div class="consultax_ca">
				
				<div id="consul_carrera_ca">
					<label>Carrera: </label>
					<select class="con_estilo" style="width:150px;" id="carrera_ca">
						@foreach($programas as $programa)
							<option value="{{$programa->programaedu}}">{{$programa->descripcion}}</option>
						@endforeach
					</select>
				</div>

				<div id="consul_periodo_ca">
					<label>Periódo: </label>
					<input class="estilo_text" style="width:150px;" type="text" name="periodo_ca" id="periodo_ca" list="datalist_periodo_ca" size=1 onkeypress="ValidaSoloNumeros()"/>
					<datalist id="datalist_periodo_ca">
						@foreach ($codigosPeriodo as $periodo)
							<option value="{{$periodo['formato']}}" codigo="{{$periodo['codigo']}}">
						@endforeach
					</datalist>
				</div>


				<div id="consul_turno_ca">
					<label>Turno: </label>
					<!--<input class="estilo_text" style="width:150px;" type="text" name="turno_ca" id="turno_ca" list="datalist_turno_ca" size="1"/>
					<datalist id="datalist_turno_ca">
						<option value="MATUTINO">
						<option value="INTERTURNO">
						<option value="VESPERTINO">
					</datalist>-->
					<select class="estilo_text" style="width:150px;" name="turno_ca" id="turno_ca"/>
						<option value="0">TODOS</option>
						@foreach($turnos as $turno)
							<option value="{{$turno->turno}}">{{$turno->descripcion}}</option>
						@endforeach
					</select>
				</div>

				<div id="consul_semestre_ca">
					<label>Semestre: </label>
					<select class="con_estilo" style="width:80px;" name="semestre_ca" size=1>
						<option value="0">TODOS</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
					</select>
				</div>
				
				<div id="consul_grupo_ca">
					<label>Grupo: </label>
					<input class="estilo_text" style="width:80px;" type="text" name="grupo_ca" id="grupo_ca" list="datalist_grupo_ca" size=1 onkeypress="ValidaSoloNumeros()">
					<datalist id="datalist_grupo_ca">
					</datalist>
				</div>
				
			</div>

			<div class="consultay_ca">
				<div id="consul_seriacion_ca">
					<input style="width:18px; height:18px;" type="checkbox" name="seriacion_ca" value="seriacion_ca"><label>Seriadas</label>
				</div>
				
				<div id="consul_habilitados_ca">
					<input style="width:18px; height:18px;" type="checkbox" name="habilitados_ca" value="habilitados_ca"><label>Habilitadas</label>
				</div>

				<div id="consul_deshabilitados_ca">
					<input style="width:18px; height:18px;" type="checkbox" name="deshabilitados_ca" value="deshabilitados_ca"><label>Deshabilitadas</label>
				</div>
			</div>

				<div id="consultaboton_ca">
					<input class="estilo_button2" style="width:145px;" type="button" value="Buscar">
				</div>

		</fieldset>



				

	</div>

		<div id="GridPlanEstudio" style="height:2200px; margin-top:80px">
	<br>
		<!-------------------------------------------SEMESTRE 1 CONSULTA -------------------------------------------->
			<table class="tabla_ca">

				<thead class="dd_encabezado_tablaConsulta">
					<tr>
						<th>SEMESTRE: 1</th>
						<th>PLAN:</th>
					</tr>
				</thead>
				<thead class="dd_encabezado_colorBlanco_tablaConsulta">
					<tr>
						<th style="width:50px">CLAVE</th>
						<th style="width:300px">MATERIA</th>
						<th style="width:50px">NO. CREDITOS</th>
						<th style="width:50px">HC</th>
						<th style="width:100px">ETAPA</th>
						<th style="width:50px">REQ. SERIACION</th>
					</tr>
				</thead>
				<thead class="dd_encabezado_colorNaranja_tablaConsulta">

						<tr>
							<th colspan="7">OBLIGATORIAS</th>
							
						</tr>

				</thead>

				<tbody>
					<tr>
						<td>000453</td>
						<td>DESARROLLO SUSTENTABLE</td>
						<td>20</td>
						<td>21</td>
						<td>BASICA</td>
						<td>none</td>
					</tr>
					<tr>
						<td>000454</td>
						<td>ARQ. DE LA INFO.</td>
						<td>15</td>
						<td>14</td>
						<td>BASICA</td>
						<td>none</td>	
					</tr>
					<tr>
						<td>000455</td>
						<td>PRINCIPIOS DE PROGRAMACION</td>
						<td>9</td>
						<td>12</td>
						<td>BASICA</td>
						<td>none</td>	
					</tr>
					<tr>
						<td>000456</td>
						<td>MATEMATICAS I</td>
						<td>2</td>
						<td>20</td>
						<td>BASICA</td>
						<td>none</td>
					</tr>
					<tr>
						<td>000457</td>
						<td>FISICA I</td>
						<td>4</td>
						<td>30</td>
						<td>BASICA</td>
						<td>none</td>	
					</tr>
					<tr>
						<td>000458</td>
						<td>ORIENTACION VOCACIONAL</td>
						<td>10</td>
						<td>20</td>
						<td>BASICA</td>
						<td>none</td>
					</tr>
					<tr>
						<td>000459</td>
						<td>QUIMICA I</td>
						<td>9</td>
						<td>20</td>
						<td>BASICA</td>
						<td>none</td>	
					</tr>
					<tr>
						<td>000460</td>
						<td>ESTRUCTURA DE DATOS</td>
						<td>2</td>
						<td>4</td>
						<td>BASICA</td>
						<td>none</td>
					</tr>

				<thead class="dd_encabezado_colorNaranja_tablaConsulta">

						<tr>
							<th colspan="7">OPTATIVAS</th>
							
						</tr>

					</thead>

				<tr>
						<td>000458</td>
						<td>ORIENTACION VOCACIONAL 206</td>
						<td>10</td>
						<td>20</td>
						<td>BASICA</td>
						<td>none</td>
					</tr>
					<tr>
						<td>000459</td>
						<td>QUIMICA I 207</td>
						<td>9</td>
						<td>20</td>
						<td>BASICA</td>
						<td>none</td>	
					</tr>
					<tr>
						<td>000460</td>
						<td>ESTRUCTURA DE DATOS 208</td>
						<td>2</td>
						<td>4</td>
						<td>BASICA</td>
						<td>none</td>
					</tr>

					<thead class="dd_encabezado_colorNaranja_tablaConsulta">
						
						<th colspan="2">GRUPOS Y TURNOS:</th>
						<tbody>
							<tr>
								
								<td colspan="2">231 TM, 232 TM, 233 TI, 234 TI, 235 TN, 236 TN</td>
							</tr>
						</tbody>		
					</thead>
			</table>

<!-------------------------------------------SEMESTRE 2 CONSULTA -------------------------------------------->
			<table class="tabla_ca">

				<thead class="dd_encabezado_tablaConsulta">
					<tr>
						<th>SEMESTRE: 2</th>
						<th>PLAN:</th>
					</tr>
				</thead>
				<thead class="dd_encabezado_colorBlanco_tablaConsulta">
					<tr>
						<th style="width:50px">CLAVE</th>
						<th style="width:300px">MATERIA</th>
						<th style="width:50px">NO. CREDITOS</th>
						<th style="width:50px">HC</th>
						<th style="width:100px">ETAPA</th>
						<th style="width:50px">REQ. SERIACION</th>
					</tr>
				</thead>
				<thead class="dd_encabezado_colorNaranja_tablaConsulta">

						<tr>
							<th colspan="7">OBLIGATORIAS</th>
							
						</tr>

				</thead>

				<tbody>
					<tr>
						<td>000453</td>
						<td>DESARROLLO SUSTENTABLE</td>
						<td>20</td>
						<td>21</td>
						<td>BASICA</td>
						<td>none</td>
					</tr>
					<tr>
						<td>000454</td>
						<td>ARQ. DE LA INFO.</td>
						<td>15</td>
						<td>14</td>
						<td>BASICA</td>
						<td>none</td>	
					</tr>
					<tr>
						<td>000455</td>
						<td>PRINCIPIOS DE PROGRAMACION</td>
						<td>9</td>
						<td>12</td>
						<td>BASICA</td>
						<td>none</td>	
					</tr>
					<tr>
						<td>000456</td>
						<td>MATEMATICAS I</td>
						<td>2</td>
						<td>20</td>
						<td>BASICA</td>
						<td>none</td>
					</tr>
					<tr>
						<td>000457</td>
						<td>FISICA I</td>
						<td>4</td>
						<td>30</td>
						<td>BASICA</td>
						<td>none</td>	
					</tr>
					<tr>
						<td>000458</td>
						<td>ORIENTACION VOCACIONAL</td>
						<td>10</td>
						<td>20</td>
						<td>BASICA</td>
						<td>none</td>
					</tr>
					<tr>
						<td>000459</td>
						<td>QUIMICA I</td>
						<td>9</td>
						<td>20</td>
						<td>BASICA</td>
						<td>none</td>	
					</tr>
					<tr>
						<td>000460</td>
						<td>ESTRUCTURA DE DATOS</td>
						<td>2</td>
						<td>4</td>
						<td>BASICA</td>
						<td>none</td>
					</tr>

				<thead class="dd_encabezado_colorNaranja_tablaConsulta">

						<tr>
							<th colspan="7">OPTATIVAS</th>
							
						</tr>

					</thead>

				<tr>
						<td>000458</td>
						<td>ORIENTACION VOCACIONAL 206</td>
						<td>10</td>
						<td>20</td>
						<td>BASICA</td>
						<td>none</td>
					</tr>
					<tr>
						<td>000459</td>
						<td>QUIMICA I 207</td>
						<td>9</td>
						<td>20</td>
						<td>BASICA</td>
						<td>none</td>	
					</tr>
					<tr>
						<td>000460</td>
						<td>ESTRUCTURA DE DATOS 208</td>
						<td>2</td>
						<td>4</td>
						<td>BASICA</td>
						<td>none</td>
					</tr>

				    <thead class="dd_encabezado_colorNaranja_tablaConsulta">
						
						<th colspan="2">GRUPOS Y TURNOS:</th>
						<tbody>
							<tr>
								
								<td colspan="2">231 TM, 232 TM, 233 TI, 234 TI, 235 TN, 236 TN</td>
							</tr>
						</tbody>		
					</thead>
			</table>
<!-------------------------------------------SEMESTRE 3 CONSULTA -------------------------------------------->
			<table class="tabla_ca">

				<thead class="dd_encabezado_tablaConsulta">
					<tr>
						<th>SEMESTRE: 3</th>
						<th>PLAN:</th>
					</tr>
				</thead>
				<thead class="dd_encabezado_colorBlanco_tablaConsulta">
					<tr>
						<th style="width:50px">CLAVE</th>
						<th style="width:300px">MATERIA</th>
						<th style="width:50px">NO. CREDITOS</th>
						<th style="width:50px">HC</th>
						<th style="width:100px">ETAPA</th>
						<th style="width:50px">REQ. SERIACION</th>
					</tr>
				</thead>
				<thead class="dd_encabezado_colorNaranja_tablaConsulta">

						<tr>
							<th colspan="7">OBLIGATORIAS</th>
							
						</tr>

				</thead>

				<tbody>
					<tr>
						<td>000453</td>
						<td>DESARROLLO SUSTENTABLE</td>
						<td>20</td>
						<td>21</td>
						<td>BASICA</td>
						<td>none</td>
					</tr>
					<tr>
						<td>000454</td>
						<td>ARQ. DE LA INFO.</td>
						<td>15</td>
						<td>14</td>
						<td>BASICA</td>
						<td>none</td>	
					</tr>
					<tr>
						<td>000455</td>
						<td>PRINCIPIOS DE PROGRAMACION</td>
						<td>9</td>
						<td>12</td>
						<td>BASICA</td>
						<td>none</td>	
					</tr>
					<tr>
						<td>000456</td>
						<td>MATEMATICAS I</td>
						<td>2</td>
						<td>20</td>
						<td>BASICA</td>
						<td>none</td>
					</tr>
					<tr>
						<td>000457</td>
						<td>FISICA I</td>
						<td>4</td>
						<td>30</td>
						<td>BASICA</td>
						<td>none</td>	
					</tr>
					<tr>
						<td>000458</td>
						<td>ORIENTACION VOCACIONAL</td>
						<td>10</td>
						<td>20</td>
						<td>BASICA</td>
						<td>none</td>
					</tr>
					<tr>
						<td>000459</td>
						<td>QUIMICA I</td>
						<td>9</td>
						<td>20</td>
						<td>BASICA</td>
						<td>none</td>	
					</tr>
					<tr>
						<td>000460</td>
						<td>ESTRUCTURA DE DATOS</td>
						<td>2</td>
						<td>4</td>
						<td>BASICA</td>
						<td>none</td>
					</tr>

				<thead class="dd_encabezado_colorNaranja_tablaConsulta">

						<tr>
							<th colspan="7">OPTATIVAS</th>
							
						</tr>

					</thead>

				<tr>
						<td>000458</td>
						<td>ORIENTACION VOCACIONAL 206</td>
						<td>10</td>
						<td>20</td>
						<td>BASICA</td>
						<td>none</td>
					</tr>
					<tr>
						<td>000459</td>
						<td>QUIMICA I 207</td>
						<td>9</td>
						<td>20</td>
						<td>BASICA</td>
						<td>none</td>	
					</tr>
					<tr>
						<td>000460</td>
						<td>ESTRUCTURA DE DATOS 208</td>
						<td>2</td>
						<td>4</td>
						<td>BASICA</td>
						<td>none</td>
					</tr>

					<thead class="dd_encabezado_colorNaranja_tablaConsulta">
						
						<th colspan="2">GRUPOS Y TURNOS:</th>
						<tbody>
							<tr>
								
								<td colspan="2">231 TM, 232 TM, 233 TI, 234 TI, 235 TN, 236 TN</td>
							</tr>
						</tbody>		
					</thead>
			</table>
<!-------------------------------------------SEMESTRE 4 CONSULTA -------------------------------------------->
			<table class="tabla_ca">

				<thead class="dd_encabezado_tablaConsulta">
					<tr>
						<th>SEMESTRE: 4</th>
						<th>PLAN:</th>
					</tr>
				</thead>
				<thead class="dd_encabezado_colorBlanco_tablaConsulta">
					<tr>
						<th style="width:50px">CLAVE</th>
						<th style="width:300px">MATERIA</th>
						<th style="width:50px">NO. CREDITOS</th>
						<th style="width:50px">HC</th>
						<th style="width:100px">ETAPA</th>
						<th style="width:50px">REQ. SERIACION</th>
					</tr>
				</thead>
				<thead class="dd_encabezado_colorNaranja_tablaConsulta">

						<tr>
							<th colspan="7">OBLIGATORIAS</th>
							
						</tr>

				</thead>

				<tbody>
					<tr>
						<td>000453</td>
						<td>DESARROLLO SUSTENTABLE</td>
						<td>20</td>
						<td>21</td>
						<td>BASICA</td>
						<td>none</td>
					</tr>
					<tr>
						<td>000454</td>
						<td>ARQ. DE LA INFO.</td>
						<td>15</td>
						<td>14</td>
						<td>BASICA</td>
						<td>none</td>	
					</tr>
					<tr>
						<td>000455</td>
						<td>PRINCIPIOS DE PROGRAMACION</td>
						<td>9</td>
						<td>12</td>
						<td>BASICA</td>
						<td>none</td>	
					</tr>
					<tr>
						<td>000456</td>
						<td>MATEMATICAS I</td>
						<td>2</td>
						<td>20</td>
						<td>BASICA</td>
						<td>none</td>
					</tr>
					<tr>
						<td>000457</td>
						<td>FISICA I</td>
						<td>4</td>
						<td>30</td>
						<td>BASICA</td>
						<td>none</td>	
					</tr>
					<tr>
						<td>000458</td>
						<td>ORIENTACION VOCACIONAL</td>
						<td>10</td>
						<td>20</td>
						<td>BASICA</td>
						<td>none</td>
					</tr>
					<tr>
						<td>000459</td>
						<td>QUIMICA I</td>
						<td>9</td>
						<td>20</td>
						<td>BASICA</td>
						<td>none</td>	
					</tr>
					<tr>
						<td>000460</td>
						<td>ESTRUCTURA DE DATOS</td>
						<td>2</td>
						<td>4</td>
						<td>BASICA</td>
						<td>none</td>
					</tr>

				<thead class="dd_encabezado_colorNaranja_tablaConsulta">

						<tr>
							<th colspan="7">OPTATIVAS</th>
							
						</tr>

					</thead>

				<tr>
						<td>000458</td>
						<td>ORIENTACION VOCACIONAL 206</td>
						<td>10</td>
						<td>20</td>
						<td>BASICA</td>
						<td>none</td>
					</tr>
					<tr>
						<td>000459</td>
						<td>QUIMICA I 207</td>
						<td>9</td>
						<td>20</td>
						<td>BASICA</td>
						<td>none</td>	
					</tr>
					<tr>
						<td>000460</td>
						<td>ESTRUCTURA DE DATOS 208</td>
						<td>2</td>
						<td>4</td>
						<td>BASICA</td>
						<td>none</td>
					</tr>

					<thead class="dd_encabezado_colorNaranja_tablaConsulta">
						
						<th colspan="2">GRUPOS Y TURNOS:</th>
						<tbody>
							<tr>
								
								<td colspan="2">231 TM, 232 TM, 233 TI, 234 TI, 235 TN, 236 TN</td>
							</tr>
						</tbody>		
					</thead>
			</table>


<!-------------------------------------------SEMESTRE 5 CONSULTA -------------------------------------------->
			<table class="tabla_ca">

				<thead class="dd_encabezado_tablaConsulta">
					<tr>
						<th>SEMESTRE: 5</th>
						<th>PLAN:</th>
					</tr>
				</thead>
				<thead class="dd_encabezado_colorBlanco_tablaConsulta">
					<tr>
						<th style="width:50px">CLAVE</th>
						<th style="width:300px">MATERIA</th>
						<th style="width:50px">NO. CREDITOS</th>
						<th style="width:50px">HC</th>
						<th style="width:100px">ETAPA</th>
						<th style="width:50px">REQ. SERIACION</th>
					</tr>
				</thead>
				<thead class="dd_encabezado_colorNaranja_tablaConsulta">

						<tr>
							<th colspan="7">OBLIGATORIAS</th>
							
						</tr>

				</thead>

				<tbody>
					<tr>
						<td>000453</td>
						<td>DESARROLLO SUSTENTABLE</td>
						<td>20</td>
						<td>21</td>
						<td>BASICA</td>
						<td>none</td>
					</tr>
					<tr>
						<td>000454</td>
						<td>ARQ. DE LA INFO.</td>
						<td>15</td>
						<td>14</td>
						<td>BASICA</td>
						<td>none</td>	
					</tr>
					<tr>
						<td>000455</td>
						<td>PRINCIPIOS DE PROGRAMACION</td>
						<td>9</td>
						<td>12</td>
						<td>BASICA</td>
						<td>none</td>	
					</tr>
					<tr>
						<td>000456</td>
						<td>MATEMATICAS I</td>
						<td>2</td>
						<td>20</td>
						<td>BASICA</td>
						<td>none</td>
					</tr>
					<tr>
						<td>000457</td>
						<td>FISICA I</td>
						<td>4</td>
						<td>30</td>
						<td>BASICA</td>
						<td>none</td>	
					</tr>
					<tr>
						<td>000458</td>
						<td>ORIENTACION VOCACIONAL</td>
						<td>10</td>
						<td>20</td>
						<td>BASICA</td>
						<td>none</td>
					</tr>
					<tr>
						<td>000459</td>
						<td>QUIMICA I</td>
						<td>9</td>
						<td>20</td>
						<td>BASICA</td>
						<td>none</td>	
					</tr>
					<tr>
						<td>000460</td>
						<td>ESTRUCTURA DE DATOS</td>
						<td>2</td>
						<td>4</td>
						<td>BASICA</td>
						<td>none</td>
					</tr>

				<thead class="dd_encabezado_colorNaranja_tablaConsulta">

						<tr>
							<th colspan="7">OPTATIVAS</th>
							
						</tr>

					</thead>

				<tr>
						<td>000458</td>
						<td>ORIENTACION VOCACIONAL 206</td>
						<td>10</td>
						<td>20</td>
						<td>BASICA</td>
						<td>none</td>
					</tr>
					<tr>
						<td>000459</td>
						<td>QUIMICA I 207</td>
						<td>9</td>
						<td>20</td>
						<td>BASICA</td>
						<td>none</td>	
					</tr>
					<tr>
						<td>000460</td>
						<td>ESTRUCTURA DE DATOS 208</td>
						<td>2</td>
						<td>4</td>
						<td>BASICA</td>
						<td>none</td>
					</tr>

					<thead class="dd_encabezado_colorNaranja_tablaConsulta">
						
						<th colspan="2">GRUPOS Y TURNOS:</th>
						<tbody>
							<tr>
								
								<td colspan="2">231 TM, 232 TM, 233 TI, 234 TI, 235 TN, 236 TN</td>
							</tr>
						</tbody>		
					</thead>
			</table>

<!-------------------------------------------SEMESTRE 6 CONSULTA -------------------------------------------->
			<table class="tabla_ca">

				<thead class="dd_encabezado_tablaConsulta">
					<tr>
						<th>SEMESTRE: 6</th>
						<th>PLAN:</th>
					</tr>
				</thead>
				<thead class="dd_encabezado_colorBlanco_tablaConsulta">
					<tr>
						<th style="width:50px">CLAVE</th>
						<th style="width:300px">MATERIA</th>
						<th style="width:50px">NO. CREDITOS</th>
						<th style="width:50px">HC</th>
						<th style="width:100px">ETAPA</th>
						<th style="width:50px">REQ. SERIACION</th>
					</tr>
				</thead>
				<thead class="dd_encabezado_colorNaranja_tablaConsulta">

						<tr>
							<th colspan="7">OBLIGATORIAS</th>
							
						</tr>

				</thead>

				<tbody>
					<tr>
						<td>000453</td>
						<td>DESARROLLO SUSTENTABLE</td>
						<td>20</td>
						<td>21</td>
						<td>BASICA</td>
						<td>none</td>
					</tr>
					<tr>
						<td>000454</td>
						<td>ARQ. DE LA INFO.</td>
						<td>15</td>
						<td>14</td>
						<td>BASICA</td>
						<td>none</td>	
					</tr>
					<tr>
						<td>000455</td>
						<td>PRINCIPIOS DE PROGRAMACION</td>
						<td>9</td>
						<td>12</td>
						<td>BASICA</td>
						<td>none</td>	
					</tr>
					<tr>
						<td>000456</td>
						<td>MATEMATICAS I</td>
						<td>2</td>
						<td>20</td>
						<td>BASICA</td>
						<td>none</td>
					</tr>
					<tr>
						<td>000457</td>
						<td>FISICA I</td>
						<td>4</td>
						<td>30</td>
						<td>BASICA</td>
						<td>none</td>	
					</tr>
					<tr>
						<td>000458</td>
						<td>ORIENTACION VOCACIONAL</td>
						<td>10</td>
						<td>20</td>
						<td>BASICA</td>
						<td>none</td>
					</tr>
					<tr>
						<td>000459</td>
						<td>QUIMICA I</td>
						<td>9</td>
						<td>20</td>
						<td>BASICA</td>
						<td>none</td>	
					</tr>
					<tr>
						<td>000460</td>
						<td>ESTRUCTURA DE DATOS</td>
						<td>2</td>
						<td>4</td>
						<td>BASICA</td>
						<td>none</td>
					</tr>

				<thead class="dd_encabezado_colorNaranja_tablaConsulta">

						<tr>
							<th colspan="7">OPTATIVAS</th>
							
						</tr>

					</thead>

				<tr>
						<td>000458</td>
						<td>ORIENTACION VOCACIONAL 206</td>
						<td>10</td>
						<td>20</td>
						<td>BASICA</td>
						<td>none</td>
					</tr>
					<tr>
						<td>000459</td>
						<td>QUIMICA I 207</td>
						<td>9</td>
						<td>20</td>
						<td>BASICA</td>
						<td>none</td>	
					</tr>
					<tr>
						<td>000460</td>
						<td>ESTRUCTURA DE DATOS 208</td>
						<td>2</td>
						<td>4</td>
						<td>BASICA</td>
						<td>none</td>
					</tr>

					<thead class="dd_encabezado_colorNaranja_tablaConsulta">
						
						<th colspan="2">GRUPOS Y TURNOS:</th>
						<tbody>
							<tr>
								
								<td colspan="2">231 TM, 232 TM, 233 TI, 234 TI, 235 TN, 236 TN</td>
							</tr>
						</tbody>		
					</thead>
			</table>
<!-------------------------------------------SEMESTRE 7 CONSULTA -------------------------------------------->
			<table class="tabla_ca">

				<thead class="dd_encabezado_tablaConsulta">
					<tr>
						<th>SEMESTRE: 7</th>
						<th>PLAN:</th>
					</tr>
				</thead>
				<thead class="dd_encabezado_colorBlanco_tablaConsulta">
					<tr>
						<th style="width:50px">CLAVE</th>
						<th style="width:300px">MATERIA</th>
						<th style="width:50px">NO. CREDITOS</th>
						<th style="width:50px">HC</th>
						<th style="width:100px">ETAPA</th>
						<th style="width:50px">REQ. SERIACION</th>
					</tr>
				</thead>
				<thead class="dd_encabezado_colorNaranja_tablaConsulta">

						<tr>
							<th colspan="7">OBLIGATORIAS</th>
							
						</tr>

				</thead>

				<tbody>
					<tr>
						<td>000453</td>
						<td>DESARROLLO SUSTENTABLE</td>
						<td>20</td>
						<td>21</td>
						<td>BASICA</td>
						<td>none</td>
					</tr>
					<tr>
						<td>000454</td>
						<td>ARQ. DE LA INFO.</td>
						<td>15</td>
						<td>14</td>
						<td>BASICA</td>
						<td>none</td>	
					</tr>
					<tr>
						<td>000455</td>
						<td>PRINCIPIOS DE PROGRAMACION</td>
						<td>9</td>
						<td>12</td>
						<td>BASICA</td>
						<td>none</td>	
					</tr>
					<tr>
						<td>000456</td>
						<td>MATEMATICAS I</td>
						<td>2</td>
						<td>20</td>
						<td>BASICA</td>
						<td>none</td>
					</tr>
					<tr>
						<td>000457</td>
						<td>FISICA I</td>
						<td>4</td>
						<td>30</td>
						<td>BASICA</td>
						<td>none</td>	
					</tr>
					<tr>
						<td>000458</td>
						<td>ORIENTACION VOCACIONAL</td>
						<td>10</td>
						<td>20</td>
						<td>BASICA</td>
						<td>none</td>
					</tr>
					<tr>
						<td>000459</td>
						<td>QUIMICA I</td>
						<td>9</td>
						<td>20</td>
						<td>BASICA</td>
						<td>none</td>	
					</tr>
					<tr>
						<td>000460</td>
						<td>ESTRUCTURA DE DATOS</td>
						<td>2</td>
						<td>4</td>
						<td>BASICA</td>
						<td>none</td>
					</tr>

				<thead class="dd_encabezado_colorNaranja_tablaConsulta">

						<tr>
							<th colspan="7">OPTATIVAS</th>
							
						</tr>

					</thead>

				<tr>
						<td>000458</td>
						<td>ORIENTACION VOCACIONAL 206</td>
						<td>10</td>
						<td>20</td>
						<td>BASICA</td>
						<td>none</td>
					</tr>
					<tr>
						<td>000459</td>
						<td>QUIMICA I 207</td>
						<td>9</td>
						<td>20</td>
						<td>BASICA</td>
						<td>none</td>	
					</tr>
					<tr>
						<td>000460</td>
						<td>ESTRUCTURA DE DATOS 208</td>
						<td>2</td>
						<td>4</td>
						<td>BASICA</td>
						<td>none</td>
					</tr>

					<thead class="dd_encabezado_colorNaranja_tablaConsulta">
						
						<th colspan="2">GRUPOS Y TURNOS:</th>
						<tbody>
							<tr>
								
								<td colspan="2">231 TM, 232 TM, 233 TI, 234 TI, 235 TN, 236 TN</td>
							</tr>
						</tbody>		
					</thead>
			</table>

<!-------------------------------------------SEMESTRE 8 CONSULTA -------------------------------------------->
			<table class="tabla_ca">

				<thead class="dd_encabezado_tablaConsulta">
					<tr>
						<th>SEMESTRE: 8</th>
						<th>PLAN:</th>
					</tr>
				</thead>
				<thead class="dd_encabezado_colorBlanco_tablaConsulta">
					<tr>
						<th style="width:50px">CLAVE</th>
						<th style="width:300px">MATERIA</th>
						<th style="width:50px">NO. CREDITOS</th>
						<th style="width:50px">HC</th>
						<th style="width:100px">ETAPA</th>
						<th style="width:50px">REQ. SERIACION</th>
					</tr>
				</thead>
				<thead class="dd_encabezado_colorNaranja_tablaConsulta">

						<tr>
							<th colspan="7">OBLIGATORIAS</th>
							
						</tr>

				</thead>

				<tbody>
					<tr>
						<td>000453</td>
						<td>DESARROLLO SUSTENTABLE</td>
						<td>20</td>
						<td>21</td>
						<td>BASICA</td>
						<td>none</td>
					</tr>
					<tr>
						<td>000454</td>
						<td>ARQ. DE LA INFO.</td>
						<td>15</td>
						<td>14</td>
						<td>BASICA</td>
						<td>none</td>	
					</tr>
					<tr>
						<td>000455</td>
						<td>PRINCIPIOS DE PROGRAMACION</td>
						<td>9</td>
						<td>12</td>
						<td>BASICA</td>
						<td>none</td>	
					</tr>
					<tr>
						<td>000456</td>
						<td>MATEMATICAS I</td>
						<td>2</td>
						<td>20</td>
						<td>BASICA</td>
						<td>none</td>
					</tr>
					<tr>
						<td>000457</td>
						<td>FISICA I</td>
						<td>4</td>
						<td>30</td>
						<td>BASICA</td>
						<td>none</td>	
					</tr>
					<tr>
						<td>000458</td>
						<td>ORIENTACION VOCACIONAL</td>
						<td>10</td>
						<td>20</td>
						<td>BASICA</td>
						<td>none</td>
					</tr>
					<tr>
						<td>000459</td>
						<td>QUIMICA I</td>
						<td>9</td>
						<td>20</td>
						<td>BASICA</td>
						<td>none</td>	
					</tr>
					<tr>
						<td>000460</td>
						<td>ESTRUCTURA DE DATOS</td>
						<td>2</td>
						<td>4</td>
						<td>BASICA</td>
						<td>none</td>
					</tr>

				<thead class="dd_encabezado_colorNaranja_tablaConsulta">

						<tr>
							<th colspan="7">OPTATIVAS</th>
							
						</tr>

					</thead>

				<tr>
						<td>000458</td>
						<td>ORIENTACION VOCACIONAL 206</td>
						<td>10</td>
						<td>20</td>
						<td>BASICA</td>
						<td>none</td>
					</tr>
					<tr>
						<td>000459</td>
						<td>QUIMICA I 207</td>
						<td>9</td>
						<td>20</td>
						<td>BASICA</td>
						<td>none</td>	
					</tr>
					<tr>
						<td>000460</td>
						<td>ESTRUCTURA DE DATOS 208</td>
						<td>2</td>
						<td>4</td>
						<td>BASICA</td>
						<td>none</td>
					</tr>

					<thead class="dd_encabezado_colorNaranja_tablaConsulta">
						
						<th colspan="2">GRUPOS Y TURNOS:</th>
						<tbody>
							<tr>
								
								<td colspan="2">231 TM, 232 TM, 233 TI, 234 TI, 235 TN, 236 TN</td>
							</tr>
						</tbody>		
					</thead>
			</table>
<!-------------------------------------------SEMESTRE 9 CONSULTA -------------------------------------------->
			<table class="tabla_ca">

				<thead class="dd_encabezado_tablaConsulta">
					<tr>
						<th>SEMESTRE: 9</th>
						<th>PLAN:</th>
					</tr>
				</thead>
				<thead class="dd_encabezado_colorBlanco_tablaConsulta">
					<tr>
						<th style="width:50px">CLAVE</th>
						<th style="width:300px">MATERIA</th>
						<th style="width:50px">NO. CREDITOS</th>
						<th style="width:50px">HC</th>
						<th style="width:100px">ETAPA</th>
						<th style="width:50px">REQ. SERIACION</th>
					</tr>
				</thead>
				<thead class="dd_encabezado_colorNaranja_tablaConsulta">

						<tr>
							<th colspan="7">OBLIGATORIAS</th>
							
						</tr>

				</thead>

				<tbody>
					<tr>
						<td>000453</td>
						<td>DESARROLLO SUSTENTABLE</td>
						<td>20</td>
						<td>21</td>
						<td>BASICA</td>
						<td>none</td>
					</tr>
					<tr>
						<td>000454</td>
						<td>ARQ. DE LA INFO.</td>
						<td>15</td>
						<td>14</td>
						<td>BASICA</td>
						<td>none</td>	
					</tr>
					<tr>
						<td>000455</td>
						<td>PRINCIPIOS DE PROGRAMACION</td>
						<td>9</td>
						<td>12</td>
						<td>BASICA</td>
						<td>none</td>	
					</tr>
					<tr>
						<td>000456</td>
						<td>MATEMATICAS I</td>
						<td>2</td>
						<td>20</td>
						<td>BASICA</td>
						<td>none</td>
					</tr>
					<tr>
						<td>000457</td>
						<td>FISICA I</td>
						<td>4</td>
						<td>30</td>
						<td>BASICA</td>
						<td>none</td>	
					</tr>
					<tr>
						<td>000458</td>
						<td>ORIENTACION VOCACIONAL</td>
						<td>10</td>
						<td>20</td>
						<td>BASICA</td>
						<td>none</td>
					</tr>
					<tr>
						<td>000459</td>
						<td>QUIMICA I</td>
						<td>9</td>
						<td>20</td>
						<td>BASICA</td>
						<td>none</td>	
					</tr>
					<tr>
						<td>000460</td>
						<td>ESTRUCTURA DE DATOS</td>
						<td>2</td>
						<td>4</td>
						<td>BASICA</td>
						<td>none</td>
					</tr>

				<thead class="dd_encabezado_colorNaranja_tablaConsulta">

						<tr>
							<th colspan="7">OPTATIVAS</th>
							
						</tr>

					</thead>

					<tr>
						<td>000458</td>
						<td>ORIENTACION VOCACIONAL 206</td>
						<td>10</td>
						<td>20</td>
						<td>BASICA</td>
						<td>none</td>
					</tr>
					<tr>
						<td>000459</td>
						<td>QUIMICA I 207</td>
						<td>9</td>
						<td>20</td>
						<td>BASICA</td>
						<td>none</td>	
					</tr>
					<tr>
						<td>000460</td>
						<td>ESTRUCTURA DE DATOS 208</td>
						<td>2</td>
						<td>4</td>
						<td>BASICA</td>
						<td>none</td>
					</tr>

					<thead class="dd_encabezado_colorNaranja_tablaConsulta">
						
						<th colspan="2">GRUPOS Y TURNOS:</th>
						<tbody>
							<tr>
								
								<td colspan="2">231 TM, 232 TM, 233 TI, 234 TI, 235 TN, 236 TN</td>
							</tr>
						</tbody>		
					</thead>
			</table>

<!-------------------------------------------TABLA DE RESUMEN PARA CADA CONSULTA -------------------------------------------->


					<table class="ca_tblResumenConsulta">

						<thead class="ca_tblResumenEncabezado">

							<tr>
								<th colspan="2">UNIVERSIDAD AUTÓNOMA DE BAJA CALIFORNIA</th>
							</tr>

							<tr>
								<th colspan="2">FACULTAD DE CONTADURÍA Y ADMINISTRACIÓN</th>
							</tr>

						</thead>

							<tr>
								<td style="width:100px">DIRECTOR:</td>
								<td>BERNARDO DUARTE</td>
							</tr>

							<tr>
								<td style="width:100px">SUBDIRECTOR:</td>
								<td>MAGDALENA FRAUSTO FUENTES</td>
							</tr>

							<tr>
								<td style="width:100px">ADMINISTRADOR:</td>
								<td>BERNARDO DUARTE FRAUSTO</td>
							</tr>

							<tr>
								<td style="width:100px">COORDINADOR:</td>
								<td>VASTI MAGDALENA DUARTE FRAUSTO</td>
							</tr>

							<tr>
								<td style="width:100px">CREDITOS/PLAN:</td>
								<td>90</td>
							</tr>

							<tr>
								<td style="width:100px">OBLIGATORIAS:</td>
								<td>60</td>
							</tr>

							<tr>
								<td style="width:100px">OPTATIVAS:</td>
								<td>30</td>
							</tr>

							<tr>
								<td style="width:100px">TOTAL:</td>
								<td>90</td>
							</tr>

					</table>

<!---------------------------------------------------------------------------------------------------------------->

		<div class="ca_btnImprimir">
			<input class="estilo_button2" style="width:145px;" type="button" value="Imprimir">
		</div>


</section>

	<footer>
			<!--<div id="pie_correo">email: emma.castillejos@uabc.edu.mx</div>
			<div id="pie_tel">Teléfono: 664 188 9221</div>-->

	</footer>

</div>
<script type="text/javascript">
	$(function(){

		$("#carrera_ca").on("change",function(){
			$("#periodo_ca").val("");
		});

		$("#periodo_ca").on("input",function(){
			var periodoVal = $("#datalist_periodo_ca option[value='" + $(this).val() + "']").attr("codigo");
			// AQUI POSIBLE EVALUACION DEPENDIENDO EL USUARIO
			var programaVal = $("#carrera_ca").val();
			//alert(periodoVal + " "+ programaVal);
			if(periodoVal.length == 5)
			{
				$.post("<?php echo URL::to('cargaacademica/obtenergruposperiodo'); ?>",{programa:programaVal,periodo:periodoVal},function(grupos){
					var options = "";
					for (var i = 0; i < grupos.length; i++) {
						options += "<option value='" + grupos[i].grupo + "'>";
					}
					$("#datalist_grupo_ca").html(options);
				})
				.fail(function(errorText,textError,errorThrow){
					alert(errorText.responseText);
				});
			}
		});
	});
</script>
</body>
</html>