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
		Disponibilidad docente: Consulta
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

			<div id="statusPlanEstudios"><label>Estatus: En proceso</label></div>
			<div id="checkSubdirector">
				<input style="width:18px; height:18px;" type="checkbox" name="checkSubdirector" value="Generar"><label style="font-size:18px;">Completado</label>
			</div>

		<fieldset id="dd_consulta">
			<legend>Consultar por:</legend>

			<div id="dd_consultaEmpleado">
					<label>No. Empleado: </label>
					<input class="dd_con_estilo" style="margin-left:0px;" type="text" name="dd_empleadoConsulta" id="dd_empleadoConsulta" list="datalist_empleado_dd" size=1 onkeypress="ValidaSoloNumeros()" />
					<datalist id="datalist_dd_empleadoConsulta">
						<option value="Emma Castillejos">
						<option value="Consuelo Salgado">
						<option value="Nora Osuna">
					</datalist>
				</div>

			<div id="dd_consultaNombre">
					<label>Nombre docente: </label>
					<input class="dd_con_estilo_largo"type="text" name="dd_nombreConsulta" id="dd_nombreConsulta" list="datalist_nombre_dd" size=1 />
					<datalist id="datalist_nombre_dd">
						<option value="Nora Osuna">
						<option value="Margarita Ramirez">
						<option value="Emma Castillejos">
						<option value="Consuelo Salgado">
						
					</datalist>
				</div>

			
				<div id="dd_consultaPeriodo">
					<label>Periódo: </label>
					<input class="dd_con_estilo" style="margin-left:43px;"type="text" name="dd_periodoConsulta" id="dd_periodoConsulta" list="datalist_periodo_ca" size=1 onkeypress="ValidaSoloNumeros()"/>
					<datalist id="datalist_dd_periodoConsulta">
						<option value="2013-2">
						<option value="2013-4">
						<option value="2014-1">
					</datalist>
				</div>

				<div id="dd_consultarPor">
					<label>Consultar por: </label>
					<select class="dd_estilo_combo" style="width:250px; margin-left:25px;" name="dd_consultarPor" size=1>
						<option value="TODOS">TODOS</option>
						<option value="TC">DATOS PERSONALES</option>
						<option value="ADMON">GRADO DE ESTUDIOS</option>
						<option value="CONTAB">CURSOS Y/O CONGRESOS</option>
						<option value="INFORMATICA">MATERIAS A IMPARTIR</option>
						<option value="NEGOCIOS">MATRIZ DE DISPONIBILIDAD</option>
						<option value="NEGOCIOS">MATERIAS OFERTADAS</option>
					</select>
				</div>


				
					<div id="dd_btnBuscar"><input class="estilo_button2" style="width:145px" type="button" value="Buscar">
			
			

		</fieldset>




			<div class="tabs" style="margin-top:20px;">

				<!--------------------- LABEL PRIMER TAB ---------------------------->
	    
			    <input id="tab-1"  type="radio" name="radio-set" class="tab-selector-1" checked="checked" />
				<label for="tab-1" class="tab-label-1">Datos personales</label>
				
				<!--------------------- LABEL SEGUNDO TAB ---------------------------->

			   <!-- <input id="tab-2" type="radio" name="radio-set" class="tab-selector-2" />
				<label for="tab-2" class="tab-label-2">Estudios y cursos</label>-->

				<!--------------------- LABEL TERCER TAB ---------------------------->

			    <!--<input id="tab-3" type="radio" name="radio-set" class="tab-selector-3" />
				<label for="tab-3" class="tab-label-3">Disponibilidad</label>-->
		               
				<div id="dd_consulta_NoEmpleado">No. Empleado:<label>20829</label></div>
				<div class="clear-shadow"></div>
					
				    <div class="content">

	<!----------------------------- PRIMER TAB CONTENIDO ------------------------------------------>
					        
		               <div class="content-1">
							<h2>Datos personales</h2>

							<form id="dd_datosPersonales" method="post" action="http://titan:8080/form">
		                      
								<div class="dd_divDecoracion">	
									<div id="dd_fotoDoc"></div>

									<div id="dd_aPaterno_aMaterno_nombres_sexo">
										<div id="dd_noEmpleado">No. empleado:<label class="dd_label" style="margin-left:15px;">20829</label></div>
										<div class="dd_datosPersonales">Período:<input style="margin-left:55px;" class="dd_con_estilo_largo" type="text" placeholder="2014-2015" /></div>
										<div id="dd_fechaIngreso">Ingreso UABC:<input type="date" class="dd_estilo_combo" style="margin-left:10px; width:248px;" medida="Y/M/D" placeholder="23/09/2005"></div>
										<div class="dd_datosPersonales">A. paterno:<input style="margin-left:32px;" class="dd_con_estilo_largo" type="text" placeholder="CASTILLEJOS" /></div>
										<div class="dd_datosPersonales">A. materno:<input style="margin-left:27px;" class="dd_con_estilo_largo" type="text" placeholder="CABALLERO"/></div>
										<div class="dd_datosPersonales">Nombre(s):<input style="margin-left:32px;" class="dd_con_estilo_largo" id="txtnombres" type="text" placeholder="EMMA SOFIA"/></div>

										<div class="dd_datosPersonales" >
											Sexo:
											<select class="dd_estilo_combo" style="margin-left:75px; margin-bottom:0px; width:252px;">
												 <option value="FEMENINO">FEMENINO</option>
												 <option value="MASCULINO">MASCULINO</option>
											</select>
										</div>

									</div>
								</div>

								 <h2>Dirección y teléfonos</h2>

									<div class="dd_colonia_calle_int_ext_cp">
										<div class="dd_datosPersonales">Calle:<input class="dd_con_estilo_largo" style="margin-left:35px;" id="txtcalle" type="text" placeholder="CICLON, SECCION COSTA HERMOSA"/></div>
										<div id="dd_ext">No. ext.:<input class="dd_con_estilo_corto" style="margin-left:10px;" id="txtnoexterior" type="text" onKeyPress="ValidaSoloNumeros()" placeholder="758"/></div>
					                	<div id="dd_int">No. int.:<input class="dd_con_estilo_corto" style="margin-left:15px;" id="txtnointerior"type="text" onKeyPress="ValidaSoloNumeros()"/></div>
										<div class="dd_datosPersonales">Colonia:<input class="dd_con_estilo_largo" style="margin-left:15px;" id="txtcolonia"type="text" placeholder="PLAYAS DE TIJUANA"/></div>
										<div class="dd_datosPersonales">C.P.:<input class="dd_con_estilo_corto" style="margin-left:44px;" id="txtcp" type="text" onKeyPress="ValidaSoloNumeros()"/></div>

											
										<div class="dd_datosPersonales" >País:
											<select class="dd_con_estilo_largo" style="margin-left:40px;">
												 <option value="MEXICO">MEXICO</option>
												 <option value="USA">USA</option>
											</select>
										</div>

										<div class="dd_datosPersonales">Estado:
											<select class="dd_con_estilo_largo" style="margin-left:18px;">
												<option value="BAJA CALIFORNIA">BAJA CALIFORNIA</option>
												<option value="SONORA">SONORA</option>
											</select>
										</div>

										<div class="dd_datosPersonales">Ciudad:
											<select class="dd_con_estilo_largo" style="margin-left:16px;">
												<option value="TIJUANA">TIJUANA</option>
												<option value="GUAYMAS">GUAYMAS</option>
											</select>
										</div>
		
									</div>

									 <div class="dd_divDecoracionTelefonos">
										<div class="dd_datosPersonales">Oficina:<input class="dd_con_estilo_largo" style="margin-left:62px;" type="text" placeholder="(664) 686 5679"/></div>
										<div class="dd_datosPersonales">Particular:<input class="dd_con_estilo_largo" style="margin-left:38px;" type="text" placeholder="(664) 188 9221"/></div>
										<div class="dd_datosPersonales">Celular:<input class="dd_con_estilo_largo" style="margin-left:60px;" type="text" placeholder="(664) 188 9221"/></div>
										<div class="dd_datosPersonales">Correo UABC:<input class="dd_con_estilo_largo" style="margin-left:12px;" type="text" placeholder="EMMACATILLEJOS@UABC.EDU.MX"/></div>
										<div class="dd_datosPersonales">Correo:<input class="dd_con_estilo_largo" style="margin-left:62px;" type="text"/></div>

										<div id="dd_otro">
											<label></label>
											<textarea rows=3 cols="36" style=" border-radius:5px; border-color:#DBDBEA; text-transform:uppercase; resize:none" id="dd_observaciones" name="dd_observaciones" placeholder="Observaciones"></textarea>
										</div>
									</div>

								<h2 style="margin-top:400px;">Trabajo fuera de UABC</h2>
				                   		<div id="dd_trabajoFuera_puesto">

				                   			<div class="dd_datosPersonales">RFC:<label class="dd_label" style="margin-left:50px;">CACE7210142V1</label></div>
											<div class="dd_datosPersonales">Empresa:<input class="dd_con_estilo_largo" style="margin-left:10px;" type="text" placeholder="LABOPAT"/></div>
											

											<div class="dd_datosPersonales">Puesto:
												<select style="margin-left:20px; width:252px;" class="dd_con_estilo_largo">
													<option>GERENTE GENERAL</option>
													<option>DIRECTOR</option>
													<option>SUBDIRECTOR</option>
													<option>COORDINADOR</option>
												</select>
											</div>

										</div>
										<div id="dd_ingreso_antiguedad">


											<div class="dd_datosPersonales" style="margin-top:40px;">Fecha de ingreso:<input class="dd_con_estilo" style="margin-left:10px; width:215px" type="date"/></div>
											<div class="dd_datosPersonales">Antigüedad:<input class="dd_con_estilo" disabled="false" style="margin-left:60px; width:215px;" type="text" placeholder="5 AÑOS"/></div>

										</div>


				                        <!--<div class="dd_btnEstudiosCursos"><input type="submit" class="estilo_button2" style="width:170px;"  type="button" value="Guardar" name="dd_guardar" id="dd_guardar" /></div>-->

		                        <!--<button id="submit" type="submit">Submit Form</button>-->
		                    </form>
						</div>


<!----------------------------- SEGUNDO TAB CONTENIDO ------------------------------------------>
		                    
					  <!--  <div class="content-2">
		                    
     
							<h2>Grado de estudios</h2>

							<div class="dd_divDecoracionEstudios">

								<div class="dd_especialidad">Licenciatura:</div>
								
								<div class="dd_licenciatura_uniEgreso_fechaTitulacion_cedula">

									<div class="dd_licenciatura"><input class="dd_con_estilo_largo"  type="text"/></div>
									<div class="dd_uniEgreso">Escuela:<input class="dd_con_estilo" type="text"/></div>
									<div class="dd_fechaTitulacion">Titulación:<input class="dd_estilo_combo" type="date" medida="Y/M/D"></div>

									<div class="dd_cedula">Cédula:<input class="dd_estilo_cedula" type="text"/>  </div>
									<div class="dd_fechaTitulacion"><input class="dd_estilo_combo" type="text" medida="Y/M/D"></div>

									<div class="dd_btnAdd"><input class="dd_clsAgregarArchivo" value="" type="button"></div>
									<div class="dd_btnAdd"><input class="dd_clsCancelar" value="" type="button"></div>
									<div class="dd_btnAdd"><input class="dd_clsAgregarFila" value="" type="button"></div>

								</div>

							
								<div class="dd_licenciatura_uniEgreso_fechaTitulacion_cedula">

									<div class="dd_licenciatura"><input class="dd_con_estilo_largo"  type="text"/></div>
									<div class="dd_uniEgreso">Escuela:<input class="dd_con_estilo" type="text"/></div>
									<div class="dd_fechaTitulacion">Titulación:<input class="dd_estilo_combo" type="date" medida="Y/M/D"></div>

									<div class="dd_cedula">Cédula:<input class="dd_estilo_cedula" type="text"/>  </div>
									<div class="dd_fechaTitulacion"><input class="dd_estilo_combo" type="text" medida="Y/M/D"></div>

									<div class="dd_btnAdd"><input class="dd_clsAgregarArchivo" value="" type="button"></div>
									<div class="dd_btnAdd"><input class="dd_clsCancelar" value="" type="button"></div>

								</div>

								<div class="dd_especialidad">Especialidad:<input class="dd_estilo_check" type="checkbox" id="chkespecialid" value="1" onchange="javascript:showContent()"> 
									Si</div>

								<div class="dd_licenciatura_uniEgreso_fechaTitulacion_cedula">

									<div class="dd_licenciatura"><input class="dd_con_estilo_largo"  type="text"/></div>
									<div class="dd_uniEgreso">Escuela:<input class="dd_con_estilo" type="text"/></div>
									<div class="dd_fechaTitulacion">Titulación:<input class="dd_estilo_combo" type="date" medida="Y/M/D"></div>

									<div class="dd_cedula">Cédula:<input class="dd_estilo_cedula" type="text"/>  </div>
									<div class="dd_fechaTitulacion"><input class="dd_estilo_combo" type="text" medida="Y/M/D"></div>

									<div class="dd_btnAdd"><input class="dd_clsAgregarArchivo" value="" type="button"></div>
									<div class="dd_btnAdd"><input class="dd_clsCancelar" value="" type="button"></div>
									<div class="dd_btnAdd"><input class="dd_clsAgregarFila" value="" type="button"></div>
								</div>
								

								<div class="dd_licenciatura_uniEgreso_fechaTitulacion_cedula">

									<div class="dd_licenciatura"><input class="dd_con_estilo_largo"  type="text"/></div>
									<div class="dd_uniEgreso">Escuela:<input class="dd_con_estilo" type="text"/></div>
									<div class="dd_fechaTitulacion">Titulación:<input class="dd_estilo_combo" type="date" medida="Y/M/D"></div>

									<div class="dd_cedula">Cédula:<input class="dd_estilo_cedula" type="text"/>  </div>
									<div class="dd_fechaTitulacion"><input class="dd_estilo_combo" type="text" medida="Y/M/D"></div>

									<div class="dd_btnAdd"><input class="dd_clsAgregarArchivo" value="" type="button"></div>
									<div class="dd_btnAdd"><input class="dd_clsCancelar" value="" type="button"></div>
									
								</div>



								<div class="dd_especialidad">Maestría:<input class="dd_estilo_check" style="margin-left:50px;" type="checkbox" id="chkespecialid" value="1" onchange="javascript:showContent()"> 
									Si</div>

								<div class="dd_licenciatura_uniEgreso_fechaTitulacion_cedula">

									<div class="dd_licenciatura"><input class="dd_con_estilo_largo"  type="text"/></div>
									<div class="dd_uniEgreso">Escuela:<input class="dd_con_estilo" type="text"/></div>
									<div class="dd_fechaTitulacion">Titulación:<input class="dd_estilo_combo" type="date" medida="Y/M/D"></div>

									<div class="dd_cedula">Cédula:<input class="dd_estilo_cedula" type="text"/>  </div>
									<div class="dd_fechaTitulacion"><input class="dd_estilo_combo" type="text" medida="Y/M/D"></div>

									<div class="dd_btnAdd"><input class="dd_clsAgregarArchivo" value="" type="button"></div>
									<div class="dd_btnAdd"><input class="dd_clsCancelar" value="" type="button"></div>
									<div class="dd_btnAdd"><input class="dd_clsAgregarFila" value="" type="button"></div>
								</div>

								

								<div class="dd_licenciatura_uniEgreso_fechaTitulacion_cedula">

									<div class="dd_licenciatura"><input class="dd_con_estilo_largo"  type="text"/></div>
									<div class="dd_uniEgreso">Escuela:<input class="dd_con_estilo" type="text"/></div>
									<div class="dd_fechaTitulacion">Titulación:<input class="dd_estilo_combo" type="date" medida="Y/M/D"></div>

									<div class="dd_cedula">Cédula:<input class="dd_estilo_cedula" type="text"/>  </div>
									<div class="dd_fechaTitulacion"><input class="dd_estilo_combo" type="text" medida="Y/M/D"></div>

									<div class="dd_btnAdd"><input class="dd_clsAgregarArchivo" value="" type="button"></div>
									<div class="dd_btnAdd"><input class="dd_clsCancelar" value="" type="button"></div>
								</div>


								<div class="dd_especialidad">Doctorado:<input class="dd_estilo_check" style="margin-left:35px;"type="checkbox" id="chkespecialid" value="1" onchange="javascript:showContent()"> 
									Si</div>

								<div class="dd_licenciatura_uniEgreso_fechaTitulacion_cedula">

									<div class="dd_licenciatura"><input class="dd_con_estilo_largo"  type="text"/></div>
									<div class="dd_uniEgreso">Escuela:<input class="dd_con_estilo" type="text"/></div>
									<div class="dd_fechaTitulacion">Titulación:<input class="dd_estilo_combo" type="date" medida="Y/M/D"></div>

									<div class="dd_cedula">Cédula:<input class="dd_estilo_cedula" type="text"/>  </div>
									<div class="dd_fechaTitulacion"><input class="dd_estilo_combo" type="text" medida="Y/M/D"></div>

									<div class="dd_btnAdd"><input class="dd_clsAgregarArchivo" value="" type="button"></div>
									<div class="dd_btnAdd"><input class="dd_clsCancelar" value="" type="button"></div>
									<div class="dd_btnAdd"><input class="dd_clsAgregarFila" value="" type="button"></div>
								</div>

								
								<div class="dd_licenciatura_uniEgreso_fechaTitulacion_cedula">

									<div class="dd_licenciatura"><input class="dd_con_estilo_largo"  type="text"/></div>
									<div class="dd_uniEgreso">Escuela:<input class="dd_con_estilo" type="text"/></div>
									<div class="dd_fechaTitulacion">Titulación:<input class="dd_estilo_combo" type="date" medida="Y/M/D"></div>

									<div class="dd_cedula">Cédula:<input class="dd_estilo_cedula" type="text"/>  </div>
									<div class="dd_fechaTitulacion"><input class="dd_estilo_combo" type="text" medida="Y/M/D"></div>

									<div class="dd_btnAdd"><input class="dd_clsAgregarArchivo" value="" type="button"></div>
									<div class="dd_btnAdd"><input class="dd_clsCancelar" value="" type="button"></div>
								</div>
							</div>
		                        
							<h2>Cursos</h2>

							<label class="dd_label">Cursos recibidos y/o congresos asistidos:</label>
							<br>
							<br>

						    <div class="dd_divDecoracionCursos">
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
							         <div class="dd_fechaTitulacion"><label>Término:</label><input class="dd_estilo_combo" type="date" medida="Y/M/D"/></div>
							         <div class="dd_cedula"><label style="padding-right:17px">Valor:</label><input class="dd_estilo_cedula" style="margin-left:5px;" type="text"/></div>

							         <div class="dd_fechaTitulacion"><input class="dd_estilo_combo" style="margin-left:10px;" type="text" medida="Y/M/D"></div>

									<div class="dd_btnAdd"><input class="dd_clsAgregarArchivo" value="" type="button"></div>
									<div class="dd_btnAdd"><input class="dd_clsCancelar" value="" type="button"></div>
									<div class="dd_btnAdd"><input class="dd_clsAgregarFila" value="" type="button"></div>
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
							         <div class="dd_fechaTitulacion"><label>Término:</label><input class="dd_estilo_combo" type="date" medida="Y/M/D"/></div>
							         <div class="dd_cedula"><label style="padding-right:17px">Valor:</label><input class="dd_estilo_cedula" style="margin-left:5px;" type="text"/></div>

							         <div class="dd_fechaTitulacion"><input class="dd_estilo_combo" style="margin-left:10px;" type="text" medida="Y/M/D"></div>

									<div class="dd_btnAdd"><input class="dd_clsAgregarArchivo" value="" type="button"></div>
									<div class="dd_btnAdd"><input class="dd_clsCancelar" value="" type="button"></div>
									<div class="dd_btnAdd"><input class="dd_clsAgregarFila" value="" type="button"></div>
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
							         <div class="dd_fechaTitulacion"><label>Término:</label><input class="dd_estilo_combo" type="date" medida="Y/M/D"/></div>
							         <div class="dd_cedula"><label style="padding-right:17px">Valor:</label><input class="dd_estilo_cedula" style="margin-left:5px;" type="text"/></div>

							         <div class="dd_fechaTitulacion"><input class="dd_estilo_combo" style="margin-left:10px;" type="text" medida="Y/M/D"></div>

									<div class="dd_btnAdd"><input class="dd_clsAgregarArchivo" value="" type="button"></div>
									<div class="dd_btnAdd"><input class="dd_clsCancelar" value="" type="button"></div>
									<div class="dd_btnAdd"><input class="dd_clsAgregarFila" value="" type="button"></div>
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
							         <div class="dd_fechaTitulacion"><label>Término:</label><input class="dd_estilo_combo" type="date" medida="Y/M/D"/></div>
							         <div class="dd_cedula"><label style="padding-right:17px">Valor:</label><input class="dd_estilo_cedula" style="margin-left:5px;" type="text"/></div>

							         <div class="dd_fechaTitulacion"><input class="dd_estilo_combo" style="margin-left:10px;" type="text" medida="Y/M/D"></div>

									<div class="dd_btnAdd"><input class="dd_clsAgregarArchivo" value="" type="button"></div>
									<div class="dd_btnAdd"><input class="dd_clsCancelar" value="" type="button"></div>
									<div class="dd_btnAdd"><input class="dd_clsAgregarFila" value="" type="button"></div>
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
							         <div class="dd_fechaTitulacion"><label>Término:</label><input class="dd_estilo_combo" type="date" medida="Y/M/D"/></div>
							         <div class="dd_cedula"><label style="padding-right:17px">Valor:</label><input class="dd_estilo_cedula" style="margin-left:5px;" type="text"/></div>

							         <div class="dd_fechaTitulacion"><input class="dd_estilo_combo" style="margin-left:10px;" type="text" medida="Y/M/D"></div>

									<div class="dd_btnAdd"><input class="dd_clsAgregarArchivo" value="" type="button"></div>
									<div class="dd_btnAdd"><input class="dd_clsCancelar" value="" type="button"></div>
									
						     	</div>
						     </div>
						         <br>
						         
						        <label class="dd_label">Cursos de actualización:</label>
						        <br>
								<br>

						     <div class="dd_divDecoracionCursos">
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
							         
						     	</div>
						     </div>

						     	<div class="dd_btnEstudiosCursos"><input type="submit" class="estilo_button2" style="width:170px"  type="button" value="Guardar" name="dd_guardar" id="dd_guardar" /></div>
														
						</div>-->
		                    
		<!----------------------------- TERCER TAB CONTENIDO ------------------------------------------>                    
					    
					  <!--  <div class="content-3">
							
							<h2>Materias a impartir</h2>


		                    <div id="dd_impartirMaterias">
			                    <table class="dd_tabla_MatImpartir">
									
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
											<td><input class="dd_con_estilo_corto" type="text" name="dd_input_Tabla"/></td>
											<td><input class="dd_con_estilo_largo_tabla" type="text" name="dd_input_Tabla"/></td>
											<td><input type="button" value="-" title='Modificar' class="clsModificarFila" id="dd_modificarFila"/></td>	
											<td><input type="button" value="-" title='Seleccionar' class="clsEliminarFila" id="eliminar"/></td>	
										</tr>
										<tr>
											<td><input class="dd_con_estilo_corto" type="text" name="dd_input_Tabla"/></td>
											<td><input class="dd_con_estilo_largo_tabla" type="text" name="dd_input_Tabla"/></td>
											<td><input type="button" value="-" title='Modificar' class="clsModificarFila" id="dd_modificarFila"/></td>	
											<td><input type="button" value="-" title='Eliminar' class="clsEliminarFila" id="eliminar"/></td>	
										</tr>
										<tr>
											<td><input class="dd_con_estilo_corto" type="text" name="dd_input_Tabla"/></td>
											<td><input class="dd_con_estilo_largo_tabla" type="text" name="dd_input_Tabla"/></td>
											<td><input type="button" value="-" title='Modificar' class="clsModificarFila" id="dd_modificarFila"/></td>		
											<td><input type="button" value="-" title='Eliminar' class="clsEliminarFila" id="eliminar"/></td>	
										</tr>
										<tr>
											<td><input class="dd_con_estilo_corto" type="text" name="dd_input_Tabla"/></td>
											<td><input class="dd_con_estilo_largo_tabla" type="text" name="dd_input_Tabla"/></td>
											<td><input type="button" value="-" title='Modificar' class="clsModificarFila" id="dd_modificarFila"/></td>		
											<td><input type="button" value="-" title='Eliminar' class="clsEliminarFila" id="eliminar"/></td>	
										</tr>
										<tr>
											<td><input class="dd_con_estilo_corto" type="text" name="dd_input_Tabla"/></td>
											<td><input class="dd_con_estilo_largo_tabla" type="text" name="dd_input_Tabla"/></td>
											<td><input type="button" value="-" title='Modificar' class="clsModificarFila" id="dd_modificarFila"/></td>		
											<td><input type="button" value="-" title='Eliminar' class="clsEliminarFila" id="eliminar"/></td>	
										</tr>
										<tr>
											<td><input class="dd_con_estilo_corto" type="text" name="dd_input_Tabla"/></td>
											<td><input class="dd_con_estilo_largo_tabla" type="text" name="dd_input_Tabla"/></td>
											<td><input type="button" value="-" title='Modificar' class="clsModificarFila" id="dd_modificarFila"/></td>		
											<td><input type="button" value="-" title='Eliminar' class="clsEliminarFila" id="eliminar"/></td>	
										</tr>
										<tr>
											<td><input class="dd_con_estilo_corto" type="text" name="dd_input_Tabla"/></td>
											<td><input class="dd_con_estilo_largo_tabla" type="text" name="dd_input_Tabla"/></td>
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
			                    <table class="dd_tabla_MatImpartir">
									
									<thead class="dd_encabezado">
										<tr>
											<th style="width:100px;">HORARIO</th>
											<th style="width:100px;">LUNES</th>
											<th style="width:100px;">MARTES</th>
											<th style="width:100px;">MIERCOLES</th>
											<th style="width:100px;">JUEVES</th>
											<th style="width:100px;">VIERNES</th>
											<th style="width:100px;">SABADO</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>7:00 - 8:00</td>
											<td onmouseover="cambiacolor_over(this)" onmouseout="cambiacolor_out(this)"></td>	
											<td><label></label></td>
											<td><label></label></td>
											<td><label></label></td>
											<td><label></label></td>
											<td><label></label></td>



										</tr>
										<tr>
											<td>8:00 - 9:00</td>
											
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



								
						</div>-->

		                    
		                                    
		                			    
			
				</div>
		
			</div>
			
		</section>

	<footer>
			<!--<div id="pie_correo">email: emma.castillejos@uabc.edu.mx</div>
			<div id="pie_tel">Teléfono: 664 188 9221</div>-->

	</footer>

</div>
</body>

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