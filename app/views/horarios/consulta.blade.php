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

			<div class="hr_lblCarrera" style="margin-top:20px;"><label style="height:30px;">ADMÓN. DE EMPRESAS</label></div>


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
							<label>Carrera: </label>
							<select class="dd_estilo_combo" style="width:150px; margin-left:5px;"  name="hr_carrera_consulta" size=1>
								<option value="LIC. INFORMATICA">INFORMATICA</option>
								<option value="LIC. CONTADURIA">CONTADURIA</option>
								<option value="LIC. NEGOCIOS INTERNACIONALES">LNI</option>
								<option value="LIC. ADMINISTRACION">LAE</option>
							</select>
						</div>

						<div class="consul_carrera_ca">
							<label>Turno: </label>
							<select class="dd_estilo_combo" style="width:150px;"  name="hr_turno_consulta" size=1>
								<option value="MATUTINO">MATUTINO</option>
								<option value="INTERTURNO">INTERTURNO</option>
								<option value="NOCTURNO">NOCTURNO</option>
							</select>
						</div>

						
					</div>

					<div class="consultax_ca" style="width:710px; margin-top:8px;">


						<div class="consul_carrera_ca">
							<label>Grupo: </label>
							<select class="dd_estilo_combo" style="width:150px; margin-left:10px;"  name="hr_grupo_consulta" size=1>
								<option value="321">231</option>
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
							<input class="estilo_button2" style="width:130px; margin-left:60px; margin-top:-5px;" type="button" value="Buscar" id="consultar_hr">
						</div>
					</div>
				</fieldset>


				

			<!-- TABLA PARA CREACION DE HORARIOS: HORARIO DEL GRUPO Y TURNO -->

					
						<div class="hr_titulos" style="margin-top:30px; margin-left:420px;">Horario del grupo</div>
					

					
				<div class="dummy dummy-menu">
						    
					<table class="hr_tabla_ca" style="width:900px; margin-left:50px; float:none;">	

						<thead class="hr_encabezado_tablaConsulta">

							<tr>
								<th colspan="1" style="border:7px;"></th>
								<th colspan="2">LUNES</th>
								<th colspan="2">MARTES</th>
								<th colspan="2">MIÉRCOLES</th>
								<th colspan="2">JUEVES</th>
								<th colspan="2">VIERNES</th>
								
								
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


							</tr>
						</thead>
						
						<tbody>
							<tr>
								
								<td>07:00 - 8:00</td>
								<td>12456</td>
								<td style="background:purple">
									<a class="tooltip tooltip-effect-1" href="#">23658
										<span class="tooltip-content">
                                        <span class="tooltip-front"><img src="../imagenes/user4.png" alt="user4"/></span>
                                        <span class="tooltip-back">REGISTROS ESPECIALES</span>
                                    	</span>
                            		  </a>



									</td>
								<td>12457</td>
								<td>29658</td> 
								<td>11743</td>
								<td>23145</td>
								<td>11743</td>
								<td>23145</td>
								<td>11743</td> 
								<td>23145</td>
								
							</tr>
							<tr>
								
								<td>08:00 - 9:00</td>
								<td>12456</td>
								<td style="background:purple">
									<a class="tooltip tooltip-effect-2" href="#">23658
										<span class="tooltip-content">
                                        <span class="tooltip-front"><img src="../imagenes/user4.png" alt="user4"/></span>
                                        <span class="tooltip-back">REGISTROS ESPECIALES</span>
                                    	</span>
                            		  </a>
								<td>11859</td>
								<td>29365</td> 
								<td>12459</td>
								<td>24639</td>
								<td>11859</td>
								<td>29365</td>
								<td>12457</td> 
								<td>29658</td>
								
								
							</tr>
							<tr>								
								<td>09:00 - 10:00</td>
								<td style="background:#00FF80">11859</td>
								<td style="background:#00FF80">29365</td>
								<td></td>
								<td></td> 
								<td>11743</td>
								<td>23145</td>
								<td>12458</td>
								<td style="background:purple">
									<a class="tooltip tooltip-effect-3" href="#">23658
										<span class="tooltip-content">
                                        <span class="tooltip-front"><img src="../imagenes/user4.png" alt="user4"/></span>
                                        <span class="tooltip-back">REGISTROS ESPECIALES</span>
                                    	</span>
                            		  </a>
								<td>12459</td> 
								<td style="background:purple">
									<a class="tooltip tooltip-effect-4" href="#">23658
										<span class="tooltip-content">
                                        <span class="tooltip-front"><img src="../imagenes/user4.png" alt="user4"/></span>
                                        <span class="tooltip-back">REGISTROS ESPECIALES</span>
                                    	</span>
                            		  </a>
								
							</tr>
							<tr>
								
								<td>10:00 - 11:00</td>
								<td></td>
								<td></td>
								<td>11843</td>
								<td>27896</td> 
								<td>12457</td>
								<td>29658</td>
								<td>12457</td>
								<td>29658</td>
								<td>11859</td> 
								<td style="background:purple">
									<a class="tooltip tooltip-effect-1" href="#">23658
										<span class="tooltip-content">
                                        <span class="tooltip-front"><img src="../imagenes/user4.png" alt="user4"/></span>
                                        <span class="tooltip-back">REGISTROS ESPECIALES</span>
                                    	</span>
                            		  </a>
								
							</tr>
							<tr>
								
								<td>11:00 - 12:00</td>
								<td>12459</td>
								<td>24639</td>
								<td>11843</td>
								<td>27896</td> 
								<td></td>
								<td></td>
								<td>12458</td>
								<td>21523</td>
								<td>12458</td> 
								<td>21523</td>
								
							</tr>
							<tr>
								
								<td>12:00 - 13:00</td>
								<td>11843</td>
								<td>27896</td>
								<td>12459</td>
								<td>24639</td>
								<td>12458</td> 
								<td>21523</td>
								<td></td>
								<td></td>
								<td></td> 
								<td></td>
								
							</tr>
						</table>
					
			</div>
					<!--<div id="btnImprimirBit">
						<input style="width:120px"class="estilo_button2" type="button" value="Guardar" name="hr_GuardarHr" id="hr_GuardarHr">
					</div>-->

			<!-------------------------------------------------------------------------------------------->


			<!-- TABLA SIGNIFICADO DE COLORES -->

			
					<table class="hr_tabla_ca" style="width:220px; margin-left:1050px; margin-top:-300px;">

						
						<thead class="hr_encabezado_tablaConsulta">
							<tr>
								<th style="width:70px; height:25px;">COLOR</th>
								<th style="width:150px; height:25px;">SIGNIFICADO</th>
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



				
				
		<!--</div>-->
	
		</section>

	<footer>
			<!--<div id="pie_correo">email: emma.castillejos@uabc.edu.mx</div>
			<div id="pie_tel">Teléfono: 664 188 9221</div>-->

	</footer>

</div>
</body>


</html>