<!doctype html>
<html lang="es">
<head>
<meta charset="utf-8"/>

		<link rel="stylesheet" type="text/css" href="../css/normalize.css">
		<link rel="stylesheet" type="text/css" href="../css/estiloPrincipal.css">
		<link rel="stylesheet" type="text/css" href="../css/estilosnav.css">
		<link rel="stylesheet" type="text/css" href="../css/component.css"/>
		<link rel="stylesheet" type="text/css" href="../css/estiloTooltipFlip.css" />

		<!-- ------------------------------ Scripts Generales -------------------------------->
		<script type="text/javascript" src="../js/jquery.js"></script>

<!--AQUI VA HORA Y FECHA-->
		<script src="../js/tiempoactual.js"></script>
		<script>$(function(){startWatch(); return false;});</script>
		<!-- Script tiempo -->

<!---------------------------------------------------------------------------------------->
<title>Horarios</title>
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
		Horarios: Consulta
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
			<!--<div class="contenedorCa" style="height:1400px;">-->

			<div class="hr_lblCarrera" style="margin-top:20px;"><label style="height:30px;">INFORMÁTICA</label></div>


				<fieldset id="consultaHorarios">
					<legend>Consultar por:</legend>

					<div class="consultax_ca" style="width:710px;">

						<div class="consul_carrera_ca">
							<label>Periódo: </label>
							<input class="estilo_text" style="width:150px;" type="text" name="periodo_hr_consulta" id="periodo_hr_consulta" list="datalist_periodo_hr_consulta" size=1 onkeypress="ValidaSoloNumeros()"/>
							<datalist id="datalist_periodo_hr_consulta">
								
									<option value="2009-1">2009-1</option>
								
							</datalist>
						</div>

						<div class="consul_carrera_ca">
							<label>Elija: </label>
							<select class="dd_estilo_combo" style="width:150px;"  name="elija_doc_grupo" size=1>
								<option value="GRUPO">GRUPO</option>
								<option value="DOCENTE">DOCENTE</option>
								
							</select>
						</div>


						<div class="consul_carrera_ca">
							<label>Carrera: </label>
							<select class="dd_estilo_combo" style="width:150px; margin-left:10px;"  name="hr_carrera_consulta" size=1>
								<option value="LIC. INFORMATICA">INFORMATICA</option>
								<option value="LIC. CONTADURIA">CONTADURIA</option>
								<option value="LIC. NEGOCIOS INTERNACIONALES">LNI</option>
								<option value="LIC. ADMINISTRACION">LAE</option>
							</select>
						</div>

						

						
					</div>

					<div class="consultax_ca" style="width:710px; margin-top:8px;">
						
						<div class="consul_carrera_ca">
							<label>Turno: </label>
							<select class="dd_estilo_combo" style="width:150px; margin-left:15px;"  name="hr_turno_consulta" size=1>
								<option value="MATUTINO">MATUTINO</option>
								<option value="INTERTURNO">INTERTURNO</option>
								<option value="NOCTURNO">NOCTURNO</option>
							</select>
						</div>

						<div class="consul_carrera_ca">
							<label>Gpo: </label>
							<select class="dd_estilo_combo" style="width:150px; margin-left:5px;"  name="hr_grupo_consulta" size=1>
								<option value="TODOS">TODOS</option>
								<option value="321">321</option>
								<option value="322">322</option>
								<option value="324">324</option>
								<option value="356">356</option>
							</select>
						</div>

						<div class="consul_carrera_ca">
							<label>Docente: </label>
							<input class="estilo_text" style="width:150px; margin-left:2px;" type="text" name="docente_hr_consulta" id="docente_hr_consulta" list="datalist_docente_hr_consulta" size=1 onkeypress="ValidaSoloNumeros()"/>
							<datalist id="datalist_docente_hr_consulta">
								
									<option value="12345">12345</option>
								
							</datalist>
						</div>
						<!--<div id="hr_btnCrearHr"><input class="estilo_button2" type="button" value="Crear horario">-->


						<div class="consul_carrera_ca" >
							<input class="estilo_button2" style="width:130px; margin-left:550px; margin-top:10px;" type="button" value="Buscar" id="consultar_hr">
						</div>
					</div>
				</fieldset>


				<!-- TABLA PARA CONSULTA DE HORARIOS: HORARIO DEL GRUPO -->

					
				<div class="hr_titulos" style="margin-top:30px; margin-bottom:20px; margin-left:550px;">Horario del grupo</div>
					

					
				<div class="hr_contenedor_tbl_consulta">
						    
					<table class="hr_consulta_grupos">	

						<thead class="hr_encabezado_tablaConsulta">

							<tr>
								<th colspan="1"></th>
								<th colspan="2">LUNES</th>
								<th colspan="2">MARTES</th>
								<th colspan="2">MIÉRCOLES</th>
								<th colspan="2">JUEVES</th>
								<th colspan="2">VIERNES</th>
								
								
							</tr>
						</thead>
						<thead class="hr_encabezado_tablaHr">
							
								<th>HORA</th>

								<!---------- LUNES ---------------->	
								<th>MATERIA</th>
								<th>DOCENTE</th>
							
								<!---------- MARTES ---------------->
								<th>MATERIA</th>
								<th>DOCENTE</th>

								<!---------- MIERCOLES ---------------->
								<th>MATERIA</th>
								<th>DOCENTE</th>

								<!---------- JUEVES ---------------->
								<th>MATERIA</th>
								<th>DOCENTE</th>

								<!---------- VIERNES ---------------->
								<th>MATERIA</th>
								<th>DOCENTE</th>


							</tr>
						</thead>
						
						<tbody>
							<tr>
								
								<td>07:00 - 8:00</td>
								<td> Metodos cuanticos</td>
								<td> Nora Osuna</td>
								<td>Desarrollo Organizacional</td>
								<td>Margarita Ramirez</td>
								<td>Programacion</td>
								<td>Beatriz E.</td>
								<td>Contabilidad financiera</td>
								<td>Esthela Duran</td>
								<td>Diseno de sitios web</td>
								<td>Roberto Diaz</td> 
								
								
							</tr>
							<tr>
								
								<td>08:00 - 9:00</td>
								<td> Metodos cuanticos</td>
								<td> Nora Osuna</td>
								<td>Desarrollo Organizacional</td>
								<td>Margarita Ramirez</td>
								<td>Programacion</td>
								<td>Beatriz E.</td>
								<td>Contabilidad financiera</td>
								<td>Esthela Duran</td>
								<td>Diseno de sitios web</td>
								<td>Roberto Diaz</td> 
								
								
							</tr>
							<tr>								
								<td>09:00 - 10:00</td>
								<td> Metodos cuanticos</td>
								<td> Nora Osuna</td>
								<td>Desarrollo Organizacional</td>
								<td>Margarita Ramirez</td>
								<td>Programacion</td>
								<td>Beatriz E.</td>
								<td>Contabilidad financiera</td>
								<td>Esthela Duran</td>
								<td>Diseno de sitios web</td>
								<td>Roberto Diaz</td> 
								
							</tr>
							<tr>
								
								<td>10:00 - 11:00</td>
								<td> Metodos cuanticos</td>
								<td> Nora Osuna</td>
								<td>Desarrollo Organizacional</td>
								<td>Margarita Ramirez</td>
								<td>Programacion</td>
								<td>Beatriz E.</td>
								<td>Contabilidad financiera</td>
								<td>Esthela Duran</td>
								<td>Diseno de sitios web</td>
								<td>Roberto Diaz</td> 
								
							</tr>
							<tr>
								
								<td>11:00 - 12:00</td>
								<td> Metodos cuanticos</td>
								<td> Nora Osuna</td>
								<td>Desarrollo Organizacional</td>
								<td>Margarita Ramirez</td>
								<td>Programacion</td>
								<td>Beatriz E.</td>
								<td>Contabilidad financiera</td>
								<td>Esthela Duran</td>
								<td>Diseno de sitios web</td>
								<td>Roberto Diaz</td> 
								
							</tr>
							<tr>
								
								<td>12:00 - 13:00</td>
								<td> Metodos cuanticos</td>
								<td> Nora Osuna</td>
								<td>Desarrollo Organizacional</td>
								<td>Margarita Ramirez</td>
								<td>Programacion</td>
								<td>Beatriz E.</td>
								<td>Contabilidad financiera</td>
								<td>Esthela Duran</td>
								<td>Diseno de sitios web</td>
								<td>Roberto Diaz</td> 
								
							</tr>
						</table>
					
			</div>

			

			<!-- TABLA PARA HORARIO DEL DOCENTE -->

			<div class="hr_titulos" style="margin-top:30px; margin-bottom:20px; margin-left:550px;">Horario del docente</div>
			<div class="hr_contenedor_tbl_consulta">
						    
					<table class="hr_consulta_docente">	

						<thead class="hr_encabezado_tablaConsulta">

							<tr>
								<th colspan="1"></th>
								<th colspan="2">LUNES</th>
								<th colspan="2">MARTES</th>
								<th colspan="2">MIÉRCOLES</th>
								<th colspan="2">JUEVES</th>
								<th colspan="2">VIERNES</th>
								
								
							</tr>
						</thead>
						<thead class="hr_encabezado_tablaHr">
							
								<th>HORA</th> 

								<!---------- LUNES -------------->	
								<th>MATERIA</th>
								<th>GRUPO</th>
							
								<!---------- MARTES ---------------->
								<th>MATERIA</th>
								<th>GRUPO</th>

								<!---------- MIERCOLES ---------------->
								<th>MATERIA</th>
								<th>GRUPO</th>

								<!---------- JUEVES ---------------->
								<th>MATERIA</th>
								<th>GRUPO</th>

								<!---------- VIERNES ---------------->
								 <th>MATERIA</th>
								<th>GRUPO</th>
 

							 </tr>
						</thead>
						
						<tbody>
							<tr>
								
								<td>07:00 - 8:00</td>
								<td> Metodos cuanticos</td>
								<td> 321</td>
								<td>Desarrollo Organizacional</td>
								<td>246</td>
								<td>Programacion</td>
								<td>821</td>
								<td>Contabilidad financiera</td>
								<td>237</td>
								<td>Diseno de sitios web</td>
								<td>221</td> 
								
								
							</tr>
							<tr>
								
								<td>07:00 - 8:00</td>
								<td> Metodos cuanticos</td>
								<td> 321</td>
								<td>Desarrollo Organizacional</td>
								<td>246</td>
								<td>Programacion</td>
								<td>821</td>
								<td>Contabilidad financiera</td>
								<td>237</td>
								<td>Diseno de sitios web</td>
								<td>221</td> 
								
								
							</tr>
							<tr>								
								<td>07:00 - 8:00</td>
								<td> Metodos cuanticos</td>
								<td> 321</td>
								<td>Desarrollo Organizacional</td>
								<td>246</td>
								<td>Programacion</td>
								<td>821</td>
								<td>Contabilidad financiera</td>
								<td>237</td>
								<td>Diseno de sitios web</td>
								<td>221</td> 
								
							</tr>
							<tr>
								
								<td>07:00 - 8:00</td>
								<td> Metodos cuanticos</td>
								<td> 321</td>
								<td>Desarrollo Organizacional</td>
								<td>246</td>
								<td>Programacion</td>
								<td>821</td>
								<td>Contabilidad financiera</td>
								<td>237</td>
								<td>Diseno de sitios web</td>
								<td>221</td> 
								
							</tr>
							<tr>
								
								<td>07:00 - 8:00</td>
								<td> Metodos cuanticos</td>
								<td> 321</td>
								<td>Desarrollo Organizacional</td>
								<td>246</td>
								<td>Programacion</td>
								<td>821</td>
								<td>Contabilidad financiera</td>
								<td>237</td>
								<td>Diseno de sitios web</td>
								<td>221</td> 
								
							</tr>
							<tr>
								
								<td>07:00 - 8:00</td>
								<td> Metodos cuanticos</td>
								<td> 321</td>
								<td>Desarrollo Organizacional</td>
								<td>246</td>
								<td>Programacion</td>
								<td>821</td>
								<td>Contabilidad financiera</td>
								<td>237</td>
								<td>Diseno de sitios web</td>
								<td>221</td> 
								
							</tr>
						</table>
					
			</div>



			


					<div id="btnImprimirBit">
						<input style="width:120px"class="estilo_button2" type="button" value="Imprimir" name="hr_ImprmirHr" id="hr_ImprimirHr">
					</div>

			<!------------------------------------------------------------------------>

	
		</section>

	<footer>
			<!--<div id="pie_correo">email: emma.castillejos@uabc.edu.mx</div>
			<div id="pie_tel">Teléfono: 664 188 9221</div>-->

	</footer>

</div>
</body>


</html>