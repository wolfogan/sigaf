<!doctype html>
<html lang="es">
<head>
<meta charset="utf-8"/>

		<link rel="stylesheet" type="text/css" href="../css/normalize.css">
		<link rel="stylesheet" type="text/css" href="../css/estiloPrincipal.css">
		<link rel="stylesheet" type="text/css" href="../css/estilosnav.css">
		<link rel="stylesheet" type="text/css" href="../css/component.css"/>
		<link rel="stylesheet" type="text/css" href="../css/estilo_tabs.css" />

		<!-- ------------------------------ Scripts Generales -------------------------------->
		<script type="text/javascript" src="../js/jquery.js"></script>

<!--AQUI VA HORA Y FECHA-->
		<script src="../js/tiempoactual.js"></script>
		<script>$(function(){startWatch(); return false;});</script>
		<!-- Script tiempo -->

<!---------------------------------------------------------------------------------------->
<title>Disponibilidad docente</title>
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
		Horarios: Registro
	</div>
	<div id="loginmanual">
		<div id="login" class="texto_body">
			<img src="../imagenes/login.png" alt="">&nbsp;<a href="<?=URL::to('login/logout');?>"style="text-decoration:none; color:#004000;">Logout</a>
		</div>
		<div id="manual" class="texto_body">
			<img src="../imagenes/manual.png" alt=""><a href="<?=URL::to('ayuda/ayudadd');?>"style="text-decoration:none; color:#004000;">&nbsp;Manual</a>
		</div>
	</div>
</div>

		<section>
			<div class="contenedorCa">

				<div id="hr_trunoGrupo">
					<div class="hr_turnoHorario">
						<label>Turno: </label>
						<select class="dd_estilo_combo" style="width:220px" name="hr_turnoHr" size=1>
							<option value="MATUTINO">MATUTINO</option>
							<option value="INTERTURNO">INTERTURNO</option>
							<option value="NOCTURNO">NOCTURNO</option>
						</select>
					</div>

					<div class="hr_turnoHorario">
						<label>Grupo: </label>
						<select class="dd_estilo_combo" style="width:220px" name="hr_grupoHr" size=1>
							<option value="321">321</option>
							<option value="322">322</option>
							<option value="324">324</option>
							<option value="356">356</option>
						</select>
					</div>
					<!--<div id="hr_btnCrearHr"><input class="estilo_button2" type="button" value="Crear horario">-->
					<div class="hr_lblCarrera"><label>LIC. EN INFORMÁTICA</label></div>
				</div>



				<!-- TABLA PARA CREACION DE HORARIOS: MATERIAS
				
				<div id="hr_tableContainer" class="hr_tableContainer">
				<table border="0" cellpadding="0" cellspacing="0" width="100%" class="scrollTable">
					<thead class="fixedHeader">
						<tr>
							
							<th style="width:80px">CLAVE</th>
							<th style="width:300px">MATERIA</th>
						
						</tr>
					</thead>
					<tbody class="scrollContent">
						<tr>
							
							<tr>
								<td>11235</td>
								<td>MATEMATICAS</td>
							</tr>
							<tr>
								<td>11236</td>
								<td>PROGRAMACION I</td>
							</tr>
							<tr>
								<td>11237</td>
								<td>BASES DE DATOS CORPORATIVAS</td>
							</tr>
							<tr>
								<td>11238</td>
								<td>ESTRUCTURA DE DATOS</td>
							</tr>
							<tr>
								<td>11239</td>
								<td>ADMINISTRACION DE PROYECTOS</td>
							</tr>
							<tr>
								<td>11240</td>
								<td>FISICA</td>
							</tr>
							<tr>
								<td>11236</td>
								<td>PROGRAMACION I</td>
							</tr>
							<tr>
								<td>11237</td>
								<td>BASES DE DATOS CORPORATIVAS</td>
							</tr>
							<tr>
								<td>11238</td>
								<td>ESTRUCTURA DE DATOS</td>
							</tr>
							<tr>
								<td>11239</td>
								<td>ADMINISTRACION DE PROYECTOS</td>
							</tr>
							<tr>
								<td>11240</td>
								<td>FISICA</td>
							</tr>
							<tr>
								<td>11236</td>
								<td>PROGRAMACION I</td>
							</tr>
							<tr>
								<td>11237</td>
								<td>BASES DE DATOS CORPORATIVAS</td>
							</tr>
							<tr>
								<td>11238</td>
								<td>ESTRUCTURA DE DATOS</td>
							</tr>
							<tr>
								<td>11239</td>
								<td>ADMINISTRACION DE PROYECTOS</td>
							</tr>
							<tr>
								<td>11240</td>
								<td>FISICA</td>
							</tr>
							<tr>
								<td>11238</td>
								<td>ESTRUCTURA DE DATOS</td>
							</tr>
							<tr>
								<td>11238</td>
								<td>ESTRUCTURA DE DATOS</td>
							</tr>
							<tr>
								<td>11239</td>
								<td>ADMINISTRACION DE PROYECTOS</td>
							</tr>
							<tr>
								<td>11240</td>
								<td>FISICA</td>
							</tr>
							<tr>
								<td>11236</td>
								<td>PROGRAMACION I</td>
							</tr>
							<tr>
								<td>11237</td>
								<td>BASES DE DATOS CORPORATIVAS</td>
							</tr>
							<tr>
								<td>11238</td>
								<td>ESTRUCTURA DE DATOS</td>
							</tr>
							<tr>
								<td>11239</td>
								<td>ADMINISTRACION DE PROYECTOS</td>
							</tr>
							<tr>
								<td>11240</td>
								<td>FISICA</td>
							</tr>
							<tr>
								<td>11236</td>
								<td>PROGRAMACION I</td>
							</tr>
							<tr>
								<td>11237</td>
								<td>BASES DE DATOS CORPORATIVAS</td>
							</tr>
							<tr>
								<td>11238</td>
								<td>ESTRUCTURA DE DATOS</td>
							</tr>
							<tr>
								<td>11239</td>
								<td>ADMINISTRACION DE PROYECTOS</td>
							</tr>
							<tr>
								<td>11240</td>
								<td>FISICA</td>
							</tr>
							<tr>
								<td>11238</td>
								<td>ESTRUCTURA DE DATOS</td>
							</tr>
						</tr>
					</tbody>
				</table>
			</div>-->


				<!-- TABLA PARA CREACION DE HORARIOS: MATERIAS-->

				<div class="hr_lblMaterias">
					<div class="hr_titulos" style="margin-left:80px;">Seleccione materias</div>
					<div class="hr_titulos" style="margin-left:420px;">Disponibilidad docente</div>
				</div>

					<table class="hr_tabla_ca" style="width:380px;">

						
						<thead class="hr_encabezado_tablaConsulta">
							<tr>
								<th style="width:80px">CLAVE</th>
								<th style="width:300px">MATERIA</th>
							</tr>
						</thead>
						
						<tbody>
							<tr>
								<td>11235</td>
								<td>MATEMATICAS</td>
							</tr>
							<tr>
								<td>11236</td>
								<td>PROGRAMACION I</td>
							</tr>
							<tr>
								<td>11237</td>
								<td>BASES DE DATOS CORPORATIVAS</td>
							</tr>
							<tr>
								<td>11238</td>
								<td>ESTRUCTURA DE DATOS</td>
							</tr>
							<tr>
								<td>11239</td>
								<td>ADMINISTRACION DE PROYECTOS</td>
							</tr>
							<tr>
								<td>11240</td>
								<td>FISICA</td>
							</tr>
							<tr>
								<td>11236</td>
								<td>PROGRAMACION I</td>
							</tr>
							
					</table> 
				
			<!-------------------------------------------------------------------------------------------->

				

				<!-- TABLA PARA CREACION DE HORARIOS: DISPONIBILIDAD DOCENTE -->


					<table class="hr_tabla_ca" style="width:900px;">

						
						<thead class="hr_encabezado_tablaConsulta">
							<tr>
								<th style="width:80px">NO. EMPLEADO</th>
								<th style="width:260px">DOCENTE</th>
								<th style="width:110px">HORA</th>
								<th style="width:74px">LUNES</th>
								<th style="width:74px">MARTES</th>
								<th style="width:74px">MIÉRCOLES</th>
								<th style="width:74px">JUEVES</th>
								<th style="width:74px">VIERNES</th>
								<th style="width:74px">SÁBADO</th>
							</tr>
						</thead>

												
						<tbody>
							<tr>
								<td>23658</td>
								<td>PEDRO PEREZ LOPEZ</td>
								<td >07:00 - 8:00</td>
								<td style="background:#2ECCFA;">321</td>
								<td></td>
								<td></td>
								<td></td> 
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>23111</td>
								<td>CARLOS NEGRETE PALMINO</td>
								<td >08:00 - 9:00</td>
								<td style="background:#FFFF00">DISPONIBLE</td>
								<td></td>
								<td></td>
								<td></td> 
								<td></td>
								<td></td>
								
							</tr>
							<tr>
								<td>23456</td>
								<td>PATRICIA ANGULO SANCHEZ</td>
								<td >09:00 - 10:00</td>
								<td style="background:#2ECCFA;">322</td>
								<td></td>
								<td></td>
								<td></td> 
								<td style="background:#FFFF00">DISPONIBLE</td>
								<td></td>
							</tr>
							<tr>
								<td>12345</td>
								<td>EDGAR AVILA GARRIDO</td>
								<td>10:00 - 11:00</td>
								<td></td>
								<td></td>
								<td>327</td>
								<td style="background:#FFFF00">DISPONIBLE</td> 
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>21345</td>
								<td>UNICE ESPINOZA BASTIDAS</td>
								<td>11:00 - 12:00</td>
								<td style="background:#2ECCFA;">328</td>
								<td style="background:#FFFF00">DISPONIBLE</td>
								<td></td>
								<td style="background:#00FF80"></td> 
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>23343</td>
								<td>NICOLAS GONZALEZ HERNANDEZ</td>
								<td>12:00 - 13:00</td>
								<td></td>
								<td></td>
								<td style="background:#FFFF00">DISPONIBLE</td>
								<td></td> 
								<td style="background:#2ECCFA;">324</td>
								<td></td>
							</tr>
							
						
					</table>
			<!-------------------------------------------------------------------------------------------->



			

			<!-- TABLA PARA CREACION DE HORARIOS: HORARIO DEL GRUPO Y TURNO -->

					<div class="hr_lblMaterias">
						<div class="hr_titulos" style="margin-left:330px;">Seleccione materias</div>
					</div>

					<table class="hr_tabla_ca" style="width:900px;">	

						<thead class="hr_encabezado_tablaConsulta">

							<tr>
								<th colspan="1" style="border:7px;"></th>
								<th colspan="2">LUNES</th>
								<th colspan="2">MARTES</th>
								<th colspan="2">MIÉRCOLES</th>
								<th colspan="2">JUEVES</th>
								<th colspan="2">VIERNES</th>
								<th colspan="2">SÁBADO</th>
								
							</tr>
						</thead>
						<thead class="hr_encabezado_tablaHr">
							
								<th style="width:110px">HORA</th>

								<!---------- LUNES ---------------->	
								<th style="width:74px">CLAVE</th>
								<th style="width:74px">DOCENTE</th>
							
								<!---------- MARTES ---------------->
								<th style="width:74px">CLAVE</th>
								<th style="width:74px">DOCENTE</th>

								<!---------- MIERCOLES ---------------->
								<th style="width:74px">CLAVE</th>
								<th style="width:74px">DOCENTE</th>

								<!---------- JUEVES ---------------->
								<th style="width:74px">CLAVE</th>
								<th style="width:74px">DOCENTE</th>

								<!---------- VIERNES ---------------->
								<th style="width:74px">CLAVE</th>
								<th style="width:74px">DOCENTE</th>

								<!---------- SABADO ---------------->
								<th style="width:74px">CLAVE</th>
								<th style="width:74px">DOCENTE</th>

							</tr>
						</thead>
						
						<tbody>
							<tr>
								
								<td>07:00 - 8:00</td>
								<td>1234</td>
								<td></td>
								<td></td>
								<td></td> 
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td> 
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								
								<td>08:00 - 9:00</td>
								<td>34556</td>
								<td></td>
								<td></td>
								<td></td> 
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td> 
								<td></td>
								<td></td>
								<td></td>
								
							</tr>
							<tr>
								
								<td>09:00 - 10:00</td>
								<td>32211</td>
								<td></td>
								<td></td>
								<td></td> 
								<td>63725</td>
								<td></td>
								<td></td>
								<td></td>
								<td></td> 
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								
								<td>10:00 - 11:00</td>
								<td></td>
								<td></td>
								<td>90872</td>
								<td>93847</td> 
								<td></td>
								<td></td>
								<td>23948</td>
								<td></td>
								<td></td> 
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								
								<td>11:00 - 12:00</td>
								<td>29300</td>
								<td>39447</td>
								<td></td>
								<td></td> 
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td> 
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								
								<td>12:00 - 13:00</td>
								<td></td>
								<td></td>
								<td></td>
								<td>82742</td>
								<td></td> 
								<td>32411</td>
								<td>92478</td>
								<td></td>
								<td></td> 
								<td></td>
								<td></td>
								<td></td>
							</tr>
							
						
					</table>
			<!-------------------------------------------------------------------------------------------->

			<!-- TABLA SIGNIFICADO DE COLORES -->

				

					<table class="hr_tabla_ca" style="width:380px; float:right">

						
						<thead class="hr_encabezado_tablaConsulta">
							<tr>
								<th style="width:80px">COLOR</th>
								<th style="width:300px">SIGNIFICADO</th>
							</tr>
						</thead>
						
						<tbody>
							<tr>
								<td style="background:#2ECCFA;"></td>
								<td>ASIGNADA</td>
							</tr>
							<tr>
								<td style="background:#00FF80"></td>
								<td>COINCIDENCIA</td>
							</tr>
							<tr>
								<td style="background:#FFFF00"></td>
								<td>DISPONIBLE</td>
							</tr>
					</table>
				
			<!-------------------------------------------------------------------------------------------->


		</div>

				
			
		</section>

	<footer>
			<div id="pie_correo">email: emma.castillejos@uabc.edu.mx</div>
			<div id="pie_tel">Teléfono: 664 188 9221</div>

	</footer>

</div>
</body>


</html>