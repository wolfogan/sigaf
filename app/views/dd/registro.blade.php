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
		Disponibilidad docente: Registro
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
			<div class="nombre_coordinacion">Lic. en Informática</div>
			<div class="tabs">
	    
			    <input id="tab-1"  type="radio" name="radio-set" class="tab-selector-1" checked="checked" />
				<label for="tab-1" class="tab-label-1">Datos personales</label>
				
			    <input id="tab-2" type="radio" name="radio-set" class="tab-selector-2" />
				<label for="tab-2" class="tab-label-2">Estudios y cursos</label>
				
			    <input id="tab-3" type="radio" name="radio-set" class="tab-selector-3" />
				<label for="tab-3" class="tab-label-3">Disponibilidad</label>
		               
					 
				<div class="clear-shadow"></div>
					
				    <div class="content">
					        
		                <div class="content-1">
							<h2>Datos personales</h2>
		                      	
			                        <div id="dd_noEmpleado_fechaIngreso">
										<div id="dd_noEmpleado">No. empleado:<label class="dd_label">12345</label></div>
										<div id="dd_fechaIngreso">Fecha ingreso UABC:<input type="date" class="dd_estilo_combo" medida="Y/M/D"></div>
									</div>
									<br>
									<br>
									<br>

								<div class="dd_divDecoracion">		
									<div id="dd_aPaterno_aMaterno_nombres_sexo">
										<div id="dd_aPaterno">A. paterno:<input class="dd_con_estilo" type="text" /></div>
										<div id="dd_aMaterno">A. materno:<input class="dd_con_estilo" type="text"/></div>
										<div id="dd_nombres">Nombre(s):<input class="dd_con_estilo_largo" id="txtnombres" type="text"/></div>
										<div id="dd_sexo" >
											Sexo:
											<select class="dd_estilo_combo">
												 <option value="FEMENINO">FEMENINO</option>
												 <option value="MASCULINO">MASCULINO</option>
											</select>
										</div>

									</div>
										<div id="dd_foto">Foto:<input class="dd_con_estilo_foto" id="txtfoto" type="text"></div>
								</div>
								

									<br>
									<br>
									
							<h2>Dirección</h2>

						
								<div id="dd_colonia_calle_int_ext_cp">
									<div id="dd_calle">Calle:<input class="dd_con_estilo_largo" style="margin-left:35px;" id="txtcalle" type="text"/></div>
			                		<div id="dd_int">No. int.:<input class="dd_con_estilo_corto" style="margin-left:2px;" id="txtnointerior"type="text" onKeyPress="ValidaSoloNumeros()"/></div>
									<div id="dd_ext">No. ext.:<input class="dd_con_estilo_corto" style="margin-left:2px;" id="txtnoexterior" type="text" onKeyPress="ValidaSoloNumeros()"/></div>
									<div id="dd_cp">C.P.:<input class="dd_con_estilo_corto" style="margin-left:2px;" id="txtcp" type="text" onKeyPress="ValidaSoloNumeros()"/></div>
									<div id="dd_colonia">Colonia:<input class="dd_con_estilo" id="txtcolonia"type="text"/></div>
								
								
									<div id="dd_pais_estado_ciudad_otro">
										<div id="dd_pais" >País:
												<select class="dd_con_estilo" style="margin-left:28px;">
													 <option value="MEXICO">MEXICO</option>
													 <option value="USA">USA</option>
												</select>
										</div>

										<div id="dd_estado">Estado:
											<select class="dd_con_estilo">
													 <option value="BAJA CALIFORNIA">BAJA CALIFORNIA</option>
													 <option value="SONORA">SONORA</option>
												</select>
										</div>

										<div id="dd_ciudad">Ciudad:
											<select class="dd_con_estilo">
													 <option value="TIJUANA">TIJUANA</option>
													 <option value="GUAYMAS">GUAYMAS</option>
												</select>
										</div>

										<div id="dd_otro">Otro:<input class="dd_con_estilo" type="text" id="text_dd_otro"></div>
									</div>
								</div>

								

								
								<br>
								<br>
								<br>
				  
		                    <h2>Teléfonos</h2>

		                    <div class="dd_divDecoracion">
			                    <div id="dd_telefonos_correo">
									<div id="dd_telOficina">Oficina:<input class="dd_con_estilo" style="margin-left:18px;" type="text"/></div>
									<div id="dd_telParticular">Particular:<input class="dd_con_estilo" type="text"/></div>
									<div id="dd_celular">Celular:<input class="dd_con_estilo" type="text"/></div>
									<div id="dd_correo">Email:<input class="dd_con_estilo" type="text"/></div>
								</div>

								<div id="dd_correoA">Email alt.:<input class="dd_con_estilo" style="margin-left:5px;" type="text"/></div>
							</div>

								<br>
								<br>
								<br>
								<br>

							<h2>Trabajo fuera de UABC</h2>

		                   		<div class="dd_rfc">RFC:<label class="dd_label">DKFEI0980KD</label></div>
		                   		<br>
		                   		<br>
		                   		<br>

		                   		<div id="dd_trabajoFuera_puesto_antiguedad">
									<div id="dd_trabajoFuera">Otro empleo:<input class="dd_con_estilo_largo" type="text"/></div>
									<div id="dd_puesto">Puesto:<input class="dd_con_estilo" type="text"/></div>
									<div id="dd_antiguedad">Antigüedad:<input class="dd_con_estilo" type="text"/></div>
								</div>

		                        <div class="dd_btnEstudiosCursos"><input type="submit" class="estilo_button2" style="width:170px;"  type="button" value="Guardar" name="dd_guardar" id="dd_guardar" /></div>
						</div>
		                    
					    <div class="content-2">
		                    
     
							<h2>Grado de estudios</h2>

							<div class="dd_divDecoracion">

								<div class="dd_especialidad">Licenciatura:</div>
								
								<div class="dd_licenciatura_uniEgreso_fechaTitulacion_cedula">

									<div class="dd_licenciatura"><input class="dd_con_estilo_largo"  type="text"/></div>
									<div class="dd_uniEgreso">Escuela:<input class="dd_con_estilo" type="text"/></div>
									<div class="dd_fechaTitulacion">Titulación:<input class="dd_con_estilo" type="date" medida="Y/M/D"></div>
									<div class="dd_cedula">Cédula:<input class="dd_estilo_combo" type="text"/>  </div>

									<div class="dd_btnAdd"><input class="dd_clsAgregarFila" type="button" value="+"></div>

								</div>

							
								<div class="dd_licenciatura_uniEgreso_fechaTitulacion_cedula">

									<div class="dd_licenciatura"><input class="dd_con_estilo_largo"  type="text"/></div>
									<div class="dd_uniEgreso">Escuela:<input class="dd_con_estilo" type="text"/></div>
									<div class="dd_fechaTitulacion">Titulación:<input class="dd_con_estilo" type="date" medida="Y/M/D"></div>
									<div class="dd_cedula">Cédula:<input class="dd_estilo_combo" type="text"/>  </div>

								</div>

								<div class="dd_especialidad">Especialidad:<input class="dd_estilo_check" type="checkbox" id="chkespecialid" value="1" onchange="javascript:showContent()"> 
									Si</div>

								<div class="dd_licenciatura_uniEgreso_fechaTitulacion_cedula">

									<div class="dd_licenciatura"><input class="dd_con_estilo_largo" type="text"/></div>
									<div class="dd_uniEgreso">Escuela:<input class="dd_con_estilo" type="text"/></div>
									<div class="dd_fechaTitulacion">Titulación:<input class="dd_con_estilo" type="date" medida="Y/M/D"></div>
									<div class="dd_cedula">Cédula:<input class="dd_estilo_combo" type="text"/>  </div>

									<div class="dd_btnAdd"><input class="dd_clsAgregarFila" type="button" value="+"></div>
								</div>
								

								<div class="dd_licenciatura_uniEgreso_fechaTitulacion_cedula">

									<div class="dd_licenciatura"><input class="dd_con_estilo_largo"type="text"/></div>
									<div class="dd_uniEgreso">Escuela:<input class="dd_con_estilo" type="text"/></div>
									<div class="dd_fechaTitulacion">Titulación:<input class="dd_con_estilo" type="date" medida="Y/M/D"></div>
									<div class="dd_cedula">Cédula:<input class="dd_estilo_combo" type="text"/>  </div>
								</div>



								<div class="dd_especialidad">Maestría:<input class="dd_estilo_check" style="margin-left:50px;" type="checkbox" id="chkespecialid" value="1" onchange="javascript:showContent()"> 
									Si</div>

								<div class="dd_licenciatura_uniEgreso_fechaTitulacion_cedula">

									<div class="dd_licenciatura"><input class="dd_con_estilo_largo" type="text"/></div>
									<div class="dd_uniEgreso">Escuela:<input class="dd_con_estilo" type="text"/></div>
									<div class="dd_fechaTitulacion">Titulación:<input class="dd_con_estilo" type="date" medida="Y/M/D"></div>
									<div class="dd_cedula">Cédula:<input class="dd_estilo_combo" type="text"/>  </div>

									<div class="dd_btnAdd"><input class="dd_clsAgregarFila" type="button" value="+"></div>
								</div>

								

								<div class="dd_licenciatura_uniEgreso_fechaTitulacion_cedula">

									<div class="dd_licenciatura"><input class="dd_con_estilo_largo" type="text"/></div>
									<div class="dd_uniEgreso">Escuela:<input class="dd_con_estilo" type="text"/></div>
									<div class="dd_fechaTitulacion">Titulación:<input class="dd_con_estilo" type="date" medida="Y/M/D"></div>
									<div class="dd_cedula">Cédula:<input class="dd_estilo_combo" type="text"/>  </div>
								</div>


								<div class="dd_especialidad">Doctorado:<input class="dd_estilo_check" style="margin-left:35px;"type="checkbox" id="chkespecialid" value="1" onchange="javascript:showContent()"> 
									Si</div>

								<div class="dd_licenciatura_uniEgreso_fechaTitulacion_cedula">

									<div class="dd_licenciatura"><input class="dd_con_estilo_largo" type="text"/></div>
									<div class="dd_uniEgreso">Escuela:<input class="dd_con_estilo" type="text"/></div>
									<div class="dd_fechaTitulacion">Titulación:<input class="dd_con_estilo" type="date" medida="Y/M/D"></div>
									<div class="dd_cedula">Cédula:<input class="dd_estilo_combo" type="text"/>  </div>

									<div class="dd_btnAdd"><input class="dd_clsAgregarFila" type="button" value="+"></div>
								</div>

								
								<div class="dd_licenciatura_uniEgreso_fechaTitulacion_cedula">

									<div class="dd_licenciatura"><input class="dd_con_estilo_largo" type="text"/></div>
									<div class="dd_uniEgreso">Escuela:<input class="dd_con_estilo" type="text"/></div>
									<div class="dd_fechaTitulacion">Titulación:<input class="dd_con_estilo" type="date" medida="Y/M/D"></div>
									<div class="dd_cedula">Cédula:<input class="dd_estilo_combo" type="text"/>  </div>
								</div>
							</div>
		                        
							<h2>Cursos</h2>

							<label class="dd_label">Cursos recibidos y/o congresos asistidos:</label>
							<br>
							<br>

						    <div class="dd_divDecoracion">
						    	<br>
						       	<div class="dd_licenciatura_uniEgreso_fechaTitulacion_cedula">

							        <div class="dd_licenciatura"><label>Tipo:</label>
							            <select class="dd_estilo_combo">
							              <option value="CURSO">CURSO</option>
							              <option value="CONGRESO">CONGRESO</option>
							              <option value="TALLER">TALLER</option>
							            </select>
							        </div>
							         
							         <div class="dd_uniEgreso"><label>Nombre:</label><input class="dd_con_estilo_largo" type="text"/></div>
							         <div class="dd_fechaTitulacion"><label>Titulación:</label><input class="dd_con_estilo" type="date" medida="Y/M/D"/></div>
							         <div class="dd_cedula"><label>Valor:</label><input class="dd_estilo_combo" style="margin-left:5px;" type="text"/></div>

							         <div class="dd_btnAdd"><input class="dd_clsAgregarFila" type="button" value="+"></div>
						     	</div>

						     	<div class="dd_licenciatura_uniEgreso_fechaTitulacion_cedula">

							        <div class="dd_licenciatura"><label>Tipo:</label>
							            <select class="dd_estilo_combo">
							              <option value="CURSO">CURSO</option>
							              <option value="CONGRESO">CONGRESO</option>
							              <option value="TALLER">TALLER</option>
							            </select>
							        </div>
							         
							         <div class="dd_uniEgreso"><label>Nombre:</label><input class="dd_con_estilo_largo" type="text"/></div>
							         <div class="dd_fechaTitulacion"><label>Titulación:</label><input class="dd_con_estilo" type="date" medida="Y/M/D"/></div>
							         <div class="dd_cedula"><label>Valor:</label><input class="dd_estilo_combo" style="margin-left:5px;" type="text"/></div>

							         <div class="dd_btnAdd"><input class="dd_clsAgregarFila" type="button" value="+"></div>
						     	</div>

						     	<div class="dd_licenciatura_uniEgreso_fechaTitulacion_cedula">

							        <div class="dd_licenciatura"><label>Tipo:</label>
							            <select class="dd_estilo_combo">
							              <option value="CURSO">CURSO</option>
							              <option value="CONGRESO">CONGRESO</option>
							              <option value="TALLER">TALLER</option>
							            </select>
							        </div>
							         
							         <div class="dd_uniEgreso"><label>Nombre:</label><input class="dd_con_estilo_largo" type="text"/></div>
							         <div class="dd_fechaTitulacion"><label>Titulación:</label><input class="dd_con_estilo" type="date" medida="Y/M/D"/></div>
							         <div class="dd_cedula"><label>Valor:</label><input class="dd_estilo_combo" style="margin-left:5px;" type="text"/></div>

							         <div class="dd_btnAdd"><input class="dd_clsAgregarFila" type="button" value="+"></div>
						     	</div>

						     	<div class="dd_licenciatura_uniEgreso_fechaTitulacion_cedula">

							        <div class="dd_licenciatura"><label>Tipo:</label>
							            <select class="dd_estilo_combo">
							              <option value="CURSO">CURSO</option>
							              <option value="CONGRESO">CONGRESO</option>
							              <option value="TALLER">TALLER</option>
							            </select>
							        </div>
							         
							         <div class="dd_uniEgreso"><label>Nombre:</label><input class="dd_con_estilo_largo" type="text"/></div>
							         <div class="dd_fechaTitulacion"><label>Titulación:</label><input class="dd_con_estilo" type="date" medida="Y/M/D"/></div>
							         <div class="dd_cedula"><label>Valor:</label><input class="dd_estilo_combo" style="margin-left:5px;" type="text"/></div>

							         <div class="dd_btnAdd"><input class="dd_clsAgregarFila" type="button" value="+"></div>
						     	</div>

						     	<div class="dd_licenciatura_uniEgreso_fechaTitulacion_cedula">

							        <div class="dd_licenciatura"><label>Tipo:</label>
							            <select class="dd_estilo_combo">
							              <option value="CURSO">CURSO</option>
							              <option value="CONGRESO">CONGRESO</option>
							              <option value="TALLER">TALLER</option>
							            </select>
							        </div>
							         
							         <div class="dd_uniEgreso"><label>Nombre:</label><input class="dd_con_estilo_largo" type="text"/></div>
							         <div class="dd_fechaTitulacion"><label>Titulación:</label><input class="dd_con_estilo" type="date" medida="Y/M/D"/></div>
							         <div class="dd_cedula"><label>Valor:</label><input class="dd_estilo_combo" style="margin-left:5px;" type="text"/></div>

						     	</div>
						     </div>
						         <br>
						         
						        <label class="dd_label">Cursos de actualización:</label>
						        <br>
								<br>

						     <div class="dd_divDecoracion">
						     	<br>
						     
						       	<div class="dd_licenciatura_uniEgreso_fechaTitulacion_cedula">

							        <div class="dd_licenciatura"><label>Tipo:</label>
							            <select class="dd_estilo_combo">
							              <option value="CURSO">CURSO</option>
							              <option value="CONGRESO">CONGRESO</option>
							              <option value="TALLER">TALLER</option>
							            </select>
							        </div>
							         
							         <div class="dd_uniEgreso"><label>Nombre:</label><input class="dd_con_estilo_largo" type="text"/></div>
							         <div class="dd_fechaTitulacion"><label>Titulación:</label><input class="dd_con_estilo" type="date" medida="Y/M/D"/></div>
							         <div class="dd_cedula"><label>Valor:</label><input class="dd_estilo_combo" style="margin-left:5px;" type="text"/></div>

							         <div class="dd_btnAdd"><input class="dd_clsAgregarFila" type="button" value="+"></div>
						     	</div>

						     	<div class="dd_licenciatura_uniEgreso_fechaTitulacion_cedula">

							        <div class="dd_licenciatura"><label>Tipo:</label>
							            <select class="dd_estilo_combo">
							              <option value="CURSO">CURSO</option>
							              <option value="CONGRESO">CONGRESO</option>
							              <option value="TALLER">TALLER</option>
							            </select>
							        </div>
							         
							         <div class="dd_uniEgreso"><label>Nombre:</label><input class="dd_con_estilo_largo" type="text"/></div>
							         <div class="dd_fechaTitulacion"><label>Titulación:</label><input class="dd_con_estilo" type="date" medida="Y/M/D"/></div>
							         <div class="dd_cedula"><label>Valor:</label><input class="dd_estilo_combo" style="margin-left:5px;" type="text"/></div>

							         <div class="dd_btnAdd"><input class="dd_clsAgregarFila" type="button" value="+"></div>
						     	</div>

						     	<div class="dd_licenciatura_uniEgreso_fechaTitulacion_cedula">

							        <div class="dd_licenciatura"><label>Tipo:</label>
							            <select class="dd_estilo_combo">
							              <option value="CURSO">CURSO</option>
							              <option value="CONGRESO">CONGRESO</option>
							              <option value="TALLER">TALLER</option>
							            </select>
							        </div>
							         
							         <div class="dd_uniEgreso"><label>Nombre:</label><input class="dd_con_estilo_largo" type="text"/></div>
							         <div class="dd_fechaTitulacion"><label>Titulación:</label><input class="dd_con_estilo" type="date" medida="Y/M/D"/></div>
							         <div class="dd_cedula"><label>Valor:</label><input class="dd_estilo_combo" style="margin-left:5px;" type="text"/></div>

							         <div class="dd_btnAdd"><input class="dd_clsAgregarFila" type="button" value="+"></div>
						     	</div>

						     	<div class="dd_licenciatura_uniEgreso_fechaTitulacion_cedula">

							        <div class="dd_licenciatura"><label>Tipo:</label>
							            <select class="dd_estilo_combo">
							              <option value="CURSO">CURSO</option>
							              <option value="CONGRESO">CONGRESO</option>
							              <option value="TALLER">TALLER</option>
							            </select>
							        </div>
							         
							         <div class="dd_uniEgreso"><label>Nombre:</label><input class="dd_con_estilo_largo" type="text"/></div>
							         <div class="dd_fechaTitulacion"><label>Titulación:</label><input class="dd_con_estilo" type="date" medida="Y/M/D"/></div>
							         <div class="dd_cedula"><label>Valor:</label><input class="dd_estilo_combo" style="margin-left:5px;" type="text"/></div>

							         <div class="dd_btnAdd"><input class="dd_clsAgregarFila" type="button" value="+"></div>
						     	</div>

						     	<div class="dd_licenciatura_uniEgreso_fechaTitulacion_cedula">

							        <div class="dd_licenciatura"><label>Tipo:</label>
							            <select class="dd_estilo_combo">
							              <option value="CURSO">CURSO</option>
							              <option value="CONGRESO">CONGRESO</option>
							              <option value="TALLER">TALLER</option>
							            </select>
							        </div>
							         
							         <div class="dd_uniEgreso"><label>Nombre:</label><input class="dd_con_estilo_largo" type="text"/></div>
							         <div class="dd_fechaTitulacion"><label>Titulación:</label><input class="dd_con_estilo" type="date" medida="Y/M/D"/></div>
							         <div class="dd_cedula"><label>Valor:</label><input class="dd_estilo_combo" style="margin-left:5px;" type="text"/></div>
						     	</div>
						     </div>

						     	<div class="dd_btnEstudiosCursos"><input type="submit" class="estilo_button2" style="width:170px"  type="button" value="Guardar" name="dd_guardar" id="dd_guardar" /></div>
														
						</div>
		                    
		                    
					    <div class="content-3">
							
							<h2>Materias a impartir</h2>


		                    <div id="dd_impartirMaterias">
			                    <table class="dd_tabla">
									
									<thead class="dd_encabezado">
										<tr>
											<th style="width:50px;">CLAVE</th>
											<th style="width:350px;">MATERIA</th>
											<th style="width:50px;">MODIFICAR</th>
											<th style="width:50px;">ELIMINAR</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>000453</td>
											<td>DESARROLLO SUSTENTABLE</td>
											<td><input type="button" value="-" title='Modificar' class="clsModificarFila" id="dd_modificarFila"/></td>	
											<td><input type="button" value="-" title='Seleccionar' class="clsEliminarFila" id="eliminar"/></td>	
										</tr>
										<tr>
											<td>000453</td>
											<td>DESARROLLO SUSTENTABLE</td>
											<td><input type="button" value="-" title='Modificar' class="clsModificarFila" id="dd_modificarFila"/></td>	
											<td><input type="button" value="-" title='Eliminar' class="clsEliminarFila" id="eliminar"/></td>	
										</tr>
										<tr>
											<td>000453</td>
											<td>DESARROLLO SUSTENTABLE</td>
											<td><input type="button" value="-" title='Modificar' class="clsModificarFila" id="dd_modificarFila"/></td>		
											<td><input type="button" value="-" title='Eliminar' class="clsEliminarFila" id="eliminar"/></td>	
										</tr>
										<tr>
											<td>000453</td>
											<td>DESARROLLO SUSTENTABLE</td>
											<td><input type="button" value="-" title='Modificar' class="clsModificarFila" id="dd_modificarFila"/></td>		
											<td><input type="button" value="-" title='Eliminar' class="clsEliminarFila" id="eliminar"/></td>	
										</tr>
										<tr>
											<td>000453</td>
											<td>DESARROLLO SUSTENTABLE</td>
											<td><input type="button" value="-" title='Modificar' class="clsModificarFila" id="dd_modificarFila"/></td>		
											<td><input type="button" value="-" title='Eliminar' class="clsEliminarFila" id="eliminar"/></td>	
										</tr>
										<tr>
											<td>000453</td>
											<td>DESARROLLO SUSTENTABLE</td>
											<td><input type="button" value="-" title='Modificar' class="clsModificarFila" id="dd_modificarFila"/></td>		
											<td><input type="button" value="-" title='Eliminar' class="clsEliminarFila" id="eliminar"/></td>	
										</tr>
										<tr>
											<td>000453</td>
											<td>DESARROLLO SUSTENTABLE</td>
											<td><input type="button" value="-" title='Modificar' class="clsModificarFila" id="dd_modificarFila"/></td>		
											<td><input type="button" value="-" title='Eliminar' class="clsEliminarFila" id="eliminar"/></td>	
										</tr>
										<tr>
											<td>000453</td>
											<td>DESARROLLO SUSTENTABLE</td>
											<td><input type="button" value="-" title='Modificar' class="clsModificarFila" id="dd_modificarFila"/></td>		
											<td><input type="button" value="-" title='Eliminar' class="clsEliminarFila" id="eliminar"/></td>	
										</tr>
																		
									
									</tbody>
								</table>
							</div>
							<br>
							<br>

							<h2>Disponibilidad</h2>

							<div id="dd_impartirMaterias">
			                    <table class="dd_tabla">
									
									<thead class="dd_encabezado">
										<tr>
											<th>HORARIO</th>
											<th>LUNES</th>
											<th>MARTES</th>
											<th>MIERCOLES</th>
											<th>JUEVES</th>
											<th>VIERNES</th>
											<th>SABADO</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>7:00 - 8:00</td>
											<td><label onclick="'cambiarColor()'"></label></td>	
											<td><label></label></td>
											<td><label></label></td>
											<td><label></label></td>
											<td><label></label></td>
											<td><label></label></td>



										</tr>
										<tr>
											<td>8:00 - 9:00</td>
											<!--<td><input type="button" value="X" title='Seleccionar' class="clsEliminarFila"/></td>	
											<td><input type="button" value="X" title='Seleccionar' class="clsEliminarFila"/></td>	
											<td><input type="button" value="X" title='Seleccionar' class="clsEliminarFila"/></td>	
											<td><input type="button" value="X" title='Seleccionar' class="clsEliminarFila"/></td>	
											<td><input type="button" value="X" title='Seleccionar' class="clsEliminarFila"/></td>	
											<td><input type="button" value="X" title='Seleccionar' class="clsEliminarFila"/></td>	-->
											<td><label></label></td>	
											<td><label></label></td>
											<td><label></label></td>
											<td><label></label></td>
											<td><label></label></td>
											<td><label></label></td>
						

										</tr>
										<tr>
											<td>9:00 - 10:00</td>
											<td><label></label></td>	
											<td><label></label></td>
											<td><label></label></td>
											<td><label></label></td>
											<td><label></label></td>
											<td><label></label></td>
						

										</tr>
										<tr>
											<td>10:00 - 11:00</td>
											<td><label></label></td>	
											<td><label></label></td>
											<td><label></label></td>
											<td><label></label></td>
											<td><label></label></td>
											<td><label></label></td>
						
										</tr>
										<tr>
											<td>11:00 - 12:00</td>
											<td><label></label></td>	
											<td><label></label></td>
											<td><label></label></td>
											<td><label></label></td>
											<td><label></label></td>
											<td><label></label></td>
						
										</tr>
										<tr>
											<td>12:00 - 13:00</td>
											<td><label></label></td>	
											<td><label></label></td>
											<td><label></label></td>
											<td><label></label></td>
											<td><label></label></td>
											<td><label></label></td>
						
										</tr>
										<tr>
											<td>13:00 - 14:00</td>
											<td><label></label></td>	
											<td><label></label></td>
											<td><label></label></td>
											<td><label></label></td>
											<td><label></label></td>
											<td><label></label></td>
						
										</tr>
										<tr>
											<td>14:00 - 15:00</td>
											<td><label></label></td>	
											<td><label></label></td>
											<td><label></label></td>
											<td><label></label></td>
											<td><label></label></td>
											<td><label></label></td>
						
										</tr>
										<tr>
											<td>15:00 - 16:00</td>
											<td><label></label></td>	
											<td><label></label></td>
											<td><label></label></td>
											<td><label></label></td>
											<td><label></label></td>
											<td><label></label></td>
						
										</tr>
										<tr>
											<td>16:00 - 17:00</td>
											<td><label></label></td>	
											<td><label></label></td>
											<td><label></label></td>
											<td><label></label></td>
											<td><label></label></td>
											<td><label></label></td>
						
										</tr>
										<tr>
											<td>17:00 - 18:00</td>
											<td><label></label></td>	
											<td><label></label></td>
											<td><label></label></td>
											<td><label></label></td>
											<td><label></label></td>
											<td><label></label></td>
						
										</tr>
										<tr>
											<td>18:00 - 19:00</td>
											<td><label></label></td>	
											<td><label></label></td>
											<td><label></label></td>
											<td><label></label></td>
											<td><label></label></td>
											<td><label></label></td>
						
										</tr>
										<tr>
											<td>19:00 - 20:00</td>
											<td><label></label></td>	
											<td><label></label></td>
											<td><label></label></td>
											<td><label></label></td>
											<td><label></label></td>
											<td><label></label></td>
						
										</tr>
										<tr>
											<td>20:00 - 21:00</td>
											<td><label></label></td>	
											<td><label></label></td>
											<td><label></label></td>
											<td><label></label></td>
											<td><label></label></td>
											<td><label></label></td>
						
										</tr>
										<tr>
											<td>21:00 - 22:00</td>
											<td><label></label></td>	
											<td><label></label></td>
											<td><label></label></td>
											<td><label></label></td>
											<td><label></label></td>
											<td><label></label></td>
						
										</tr>
																		
									
									</tbody>
								</table>
								<div class="dd_btnEstudiosCursos"><input type="submit" class="estilo_button2" style="width:170px;"  type="button" value="Guardar" name="dd_guardar" id="dd_guardar" /></div>
							</div>



								
						</div>

		                    
		                                    
		                			    
				</div>
			</div>
			
		</section>

	<footer>
			<div id="pie_correo">email: emma.castillejos@uabc.edu.mx</div>
			<div id="pie_tel">Teléfono: 664 188 9221</div>

	</footer>

</div>
</body>

<!--- CAMBIAR DE COLOR LA LABEL DE LA DISPONIBILIDAD -->

<script type="text/javascript">
function cambiarColor () {

	
}


</script>

<!------------------------------------------------------------>

<script src="js/mascara.js" type="text/javascript"></script>
	
	<!--mascara para los teléfonos-->
	<script type="text/javascript">
       jQuery(function($){
      /* $("#date").mask("99/99/9999");*/
       $(".telefonos").mask('(999) 999-9999');
       });
	</script>
     
     <!--SCRIPT PARA QUE SOLO ACEPTE NUMEROS--> 
	<script language="javascript">
    	function ValidaSoloNumeros() {
        if ((event.keyCode < 48) || (event.keyCode > 57)) 
        	event.returnValue = false;
            }
              function Validate(obj){
              if(true != false){
              // Así damos de nuevo el foco al INPUT
                    obj.focus();
                  }
                }    
    
    </script>
</html>