<!doctype html>
<html lang="es">
<head>
<meta charset="utf-8"/>

		<link rel="stylesheet" type="text/css" href="../css/normalize.css">
		<link rel="stylesheet" type="text/css" href="../css/estiloPrincipal.css">
		<link rel="stylesheet" type="text/css" href="../css/estilosnav.css">
		<link rel="stylesheet" type="text/css" href="../css/component.css"/>

		<!-- ------------------------------ Scripts Generales -------------------------------->
		<script type="text/javascript" src="../js/jquery.js"></script>


		

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
				<div id="consul_periodo_ca">
					<label>Periódo: </label>
					<input class="estilo_text" style="width:150px;" type="text" name="periodo_ca" id="periodo_ca" list="datalist_periodo_ca" size=1 onkeypress="ValidaSoloNumeros()"/>
					<datalist id="datalist_periodo_ca">
						<option value="2013-2">
						<option value="2013-4">
						<option value="2014-1">
					</datalist>
				</div>

				<div id="consul_carrera_ca">
					<label>Carrera: </label>
					<select class="con_estilo" style="width:150px;" name="carrera_ca" size=1>
						<option value="TC">TRONCO COMUN</option>
						<option value="ADMON">ADMON.</option>
						<option value="CONTAB">CONTAB.</option>
						<option value="INFORMATICA">INFORMATICA</option>
						<option value="NEGOCIOS">NEGOCIOS</option>
					</select>
				</div>

				<div id="consul_turno_ca">
					<label>Turno: </label>
					<input class="estilo_text" style="width:150px;" type="text" name="turno_ca" id="turno_ca" list="datalist_turno_ca" size="1"/>
					<datalist id="datalist_turno_ca">
						<option value="MATUTINO">
						<option value="INTERTURNO">
						<option value="VESPERTINO">
					</datalist>
				</div>

				<div id="consul_semestre_ca">
					<label>Semestre: </label>
					<select class="con_estilo" style="width:80px;" name="semestre_ca" size=1>
						<option value="PRIMERO">1</option>
						<option value="SEGUNDO">2</option>
						<option value="TERCERO">3</option>
					</select>
				</div>
				
				<div id="consul_grupo_ca">
					<label>Grupo: </label>
					<input class="estilo_text" style="width:80px;" type="text" name="grupo_ca" id="grupo_ca" list="datalist_grupo_ca" size=1 onkeypress="ValidaSoloNumeros()">
					<datalist id="datalist_grupo_ca">
						<option value="231">
						<option value="241">
						<option value="243">
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

		<div id="GridPlanEstudio" style="height:1500px; margin-top:80px">
	<br>
		
			<table class="tabla_ca">

				<thead class="semestre_plan">
					<tr>
						<th>SEMESTRE: 1</th>
						<th>PLAN:</th>
					</tr>
				</thead>
				<thead class="encabezado_tabla">
					<tr>
						<th>CLAVE</th>
						<th>MATERIA</th>
						<th>NO. CREDITOS</th>
						<th>HC</th>
						<th>ETAPA</th>
						<th>REQ. SERIACION</th>
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

				<thead class="encabezado_optativas">
					<tr>
						<th>OPTATIVAS</th>
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

				<thead class="semestre_plan">
					<tr>
						<th>GRUPOS Y TURNOS:</th>
					</tr>
				</thead>
				<tr>
						<td>206 TM, 207 TI, 208 TN</td>
						
					</tr>
							
						
				</tbody>	
			</table>


			<table class="tabla_ca">
				<thead class="semestre_plan">
					<tr>
						<th>SEMESTRE: 2</th>
						<th>PLAN:</th>
					</tr>
				</thead>
				<thead class="encabezado_tabla">
					<tr>
						<th>CLAVE</th>
						<th>MATERIA</th>
						<th>NO. CREDITOS</th>
						<th>HC</th>
						<th>ETAPA</th>
						<th>REQ. SERIACION</th>
					
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
					<thead class="semestre_plan">
					<tr>
						<th>GRUPOS Y TURNOS:</th>
						
					</tr>
				</thead>
							
						
				</tbody>	
			</table>


			<table class="tabla_ca">
				<thead class="semestre_plan">
					<tr>
						<th>SEMESTRE: 3</th>
						<th>PLAN:</th>
					</tr>
				</thead>
				<thead class="encabezado_tabla">
					<tr>
						<th>CLAVE</th>
						<th>MATERIA</th>
						<th>NO. CREDITOS</th>
						<th>HC</th>
						<th>ETAPA</th>
						<th>REQ. SERIACION</th>
					
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
					<thead class="semestre_plan">
					<tr>
						<th>GRUPOS Y TURNOS:</th>
						
					</tr>
				</thead>		
				</tbody>	
			</table>

			<table class="tabla_ca">
				<thead class="semestre_plan">
					<tr>
						<th>SEMESTRE: 4</th>
						<th>PLAN:</th>
					</tr>
				</thead>
				<thead class="encabezado_tabla">
					<tr>
						<th>CLAVE</th>
						<th>MATERIA</th>
						<th>NO. CREDITOS</th>
						<th>HC</th>
						<th>ETAPA</th>
						<th>REQ. SERIACION</th>
					
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
					<thead class="semestre_plan">
					<tr>
						<th>GRUPOS Y TURNOS:</th>
						
					</tr>
				</thead>
							
						
				</tbody>	
			</table>

			<table class="tabla_ca">
				<thead class="semestre_plan">
					<tr>
						<th>SEMESTRE: 5</th>
						<th>PLAN:</th>
					</tr>
				</thead>
				<thead class="encabezado_tabla">
					<tr>
						<th>CLAVE</th>
						<th>MATERIA</th>
						<th>NO. CREDITOS</th>
						<th>HC</th>
						<th>ETAPA</th>
						<th>REQ. SERIACION</th>
					
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
					<thead class="semestre_plan">
					<tr>
						<th>GRUPOS Y TURNOS:</th>
						
					</tr>
				</thead>
							
						
				</tbody>	
			</table>

			<table class="tabla_ca">
				<thead class="semestre_plan">
					<tr>
						<th>SEMESTRE: 6</th>
						<th>PLAN:</th>
					</tr>
				</thead>
				<thead class="encabezado_tabla">
					<tr>
						<th>CLAVE</th>
						<th>MATERIA</th>
						<th>NO. CREDITOS</th>
						<th>HC</th>
						<th>ETAPA</th>
						<th>REQ. SERIACION</th>
					
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
					<thead class="semestre_plan">
					<tr>
						<th>GRUPOS Y TURNOS:</th>
						
					</tr>
				</thead>
							
						
				</tbody>	
			</table>


			<table class="tabla_ca">
				<thead class="semestre_plan">
					<tr>
						<th>SEMESTRE: 7</th>
						<th>PLAN:</th>
					</tr>
				</thead>
				<thead class="encabezado_tabla">
					<tr>
						<th>CLAVE</th>
						<th>MATERIA</th>
						<th>NO. CREDITOS</th>
						<th>HC</th>
						<th>ETAPA</th>
						<th>REQ. SERIACION</th>
					
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
					<thead class="semestre_plan">
					<tr>
						<th>GRUPOS Y TURNOS:</th>
						
					</tr>
				</thead>
							
						
				</tbody>	
			</table>



			<table class="tabla_ca">
				<thead class="semestre_plan">
					<tr>
						<th>SEMESTRE: 8</th>
						<th>PLAN:</th>
					</tr>
				</thead>
				<thead class="encabezado_tabla">
					<tr>
						<th>CLAVE</th>
						<th>MATERIA</th>
						<th>NO. CREDITOS</th>
						<th>HC</th>
						<th>ETAPA</th>
						<th>REQ. SERIACION</th>
					
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
					<thead class="semestre_plan">
					<tr>
						<th>GRUPOS Y TURNOS:</th>
						
					</tr>
				</thead>
							
						
				</tbody>	
			</table>


			<table class="tabla_ca">
				<thead class="semestre_plan">
					<tr>
						<th>SEMESTRE: 9</th>
						<th>PLAN:</th>
					</tr>
				</thead>
				<thead class="encabezado_tabla">
					<tr>
						<th>CLAVE</th>
						<th>MATERIA</th>
						<th>NO. CREDITOS</th>
						<th>HC</th>
						<th>ETAPA</th>
						<th>REQ. SERIACION</th>
					
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
					<thead class="semestre_plan">
					<tr>
						<th>GRUPOS Y TURNOS:</th>
						
					</tr>
				</thead>
							
						
				</tbody>	
			</table>

					<div class="nombre_escuela">UNIVERSIDAD AUTONOMA DE BAJA CALIFORNIA</div>
					<div class="nombre_escuela">FACULTAD DE CONTADURIA Y ADMINISTRACION</div>
					<div class="nombre_escuela">DIRECTOR:</div>
					<div class="nombre_escuela">SUBDIRECTOR:</div>
					<div class="nombre_escuela">ADMINISTRADOR:</div>
					<div class="nombre_escuela">COORDINADOR:</div>
					<div class="nombre_escuela">CREDITOS/PLAN:</div>
					<div class="nombre_escuela">OBLIGATORIAS:</div>
					<div class="nombre_escuela">OPTATIVAS:</div>
					<div class="nombre_escuela">TOTAL:</div>




</section>

	<footer>
			<div id="pie_correo">email: emma.castillejos@uabc.edu.mx</div>
			<div id="pie_tel">Teléfono: 664 188 9221</div>

	</footer>

</div>
</body>
</html>