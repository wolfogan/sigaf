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

			<!------------------- LABEL PRIMER TAB ---------------------------->
	    
			    <input id="tab-1"  type="radio" name="radio-set" class="tab-selector-1" checked="checked" />
				<label for="tab-1" class="tab-label-1">Datos personales</label>
				
			<!------------------- LABEL SEGUNDO TAB ---------------------------->

			    <input id="tab-2" type="radio" name="radio-set" class="tab-selector-2" />
				<label for="tab-2" class="tab-label-2">Estudios y cursos</label>
			
			<!------------------- LABEL TERCER TAB ---------------------------->	

			    <input id="tab-3" type="radio" name="radio-set" class="tab-selector-3" />
				<label for="tab-3" class="tab-label-3">Disponibilidad</label>
		               
					 
				<div class="clear-shadow"></div>
					
				    <div class="content">

			<!------------------- CONTENIDO PRIMER TAB ---------------------------->

		                <div class="content-1">
							<h2>Datos personales</h2>

							<form id="dd_datosPersonales" method="post" action="http://titan:8080/form">
		                      	
			                        

								<div class="dd_divDecoracion">	

									<div id="dd_aPaterno_aMaterno_nombres_sexo">
										<div id="dd_noEmpleado">No. empleado:<label class="dd_label" style="margin-left:15px;">20829</label></div>
										<div id="dd_fechaIngreso">Ingreso UABC:<input type="date" class="dd_estilo_combo" style="margin-left:13px; width:248px;" medida="Y/M/D" placeholder="23/09/2005"></div>
										<div class="dd_datosPersonales">A. paterno:<input style="margin-left:32px;" class="dd_con_estilo_largo" type="text" placeholder="CASTILLEJOS" /></div>
										<div class="dd_datosPersonales">A. materno:<input style="margin-left:27px;" class="dd_con_estilo_largo" type="text" placeholder="CABALLERO"/></div>
										<div class="dd_datosPersonales">Nombre(s):<input style="margin-left:32px;" class="dd_con_estilo_largo" id="txtnombres" type="text" placeholder="EMMA SOFIA"/></div>

										<div class="dd_datosPersonales" >
											Sexo:
											<select class="dd_estilo_combo" style="margin-left:70px; margin-bottom:0px; width:252px;">
												 <option value="FEMENINO">FEMENINO</option>
												 <option value="MASCULINO">MASCULINO</option>
											</select>
										</div>

									</div>
										<div id="dd_fotoDoc"></div>

								</div>
								

									<br>
								
									
							<h2>Dirección</h2>

						
								<div class="dd_colonia_calle_int_ext_cp">
									<div id="dd_calle">Calle:<input class="dd_con_estilo_largo" style="margin-left:35px;" id="txtcalle" type="text" placeholder="CICLON, SECCION COSTA HERMOSA"/></div>
									<div id="dd_ext">No. ext.:<input class="dd_con_estilo_corto" style="margin-left:2px;" id="txtnoexterior" type="text" onKeyPress="ValidaSoloNumeros()" placeholder="758"/></div>
			                		<div id="dd_int">No. int.:<input class="dd_con_estilo_corto" style="margin-left:2px;" id="txtnointerior"type="text" onKeyPress="ValidaSoloNumeros()"/></div>
									<div id="dd_colonia">Colonia:<input class="dd_con_estilo" id="txtcolonia"type="text" placeholder="PLAYAS DE TIJUANA"/></div>
									<div id="dd_cp">C.P.:<input class="dd_con_estilo_corto" style="margin-left:2px;" id="txtcp" type="text" onKeyPress="ValidaSoloNumeros()"/></div>
									
								
								
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

										<div id="dd_otro">Observaciones:<input class="dd_con_estilo" type="text" id="text_dd_otro" placeholder="NINGUNA"></div>
									</div>
								</div>

								

								
								<br>
								<br>
						
				  
		                    <h2>Teléfonos</h2>

		                    <div class="dd_divDecoracionTelefonos">
			                    <div id="dd_telefonos_correo">
									<div id="dd_telOficina">Oficina:<input class="dd_con_estilo" style="margin-left:18px;" type="text" placeholder="(664) 686 5679"/></div>
									<div id="dd_telParticular">Particular:<input class="dd_con_estilo" type="text" placeholder="(664) 188 9221"/></div>
									<div id="dd_celular">Celular:<input class="dd_con_estilo" type="text" placeholder="(664) 188 9221"/></div>
									<div id="dd_correo">Correo UABC:<input class="dd_con_estilo" type="text" placeholder="EMMACATILLEJOS@UABC.EDU.MX"/></div>
								</div>

								<div id="dd_correoA">Correo:<input class="dd_con_estilo" style="margin-left:5px;" type="text"/></div>
							</div>

								<br>
								<br>
								

							<h2>Trabajo fuera de UABC</h2>

		                   		<div id="dd_trabajoFuera_puesto_antiguedad">
		                   			<div class="dd_otroEmpleo">RFC:<label class="dd_label">CACE7210142V1</label></div>

									<div class="dd_otroEmpleo">Nombre de la empresa:<input class="dd_con_estilo_largo" style="margin-left:10px;" type="text" placeholder="LABOPAT"/></div>
									
									<div class="dd_otroEmpleo">Puesto:
										<select style="margin-left:117px; width:252px;" class="dd_con_estilo_largo">
											<option>GERENTE GENERAL</option>
											<option>DIRECTOR</option>
											<option>SUBDIRECTOR</option>
											<option>COORDINADOR</option>
										</select>
									</div>

									<div class="dd_otroEmpleo">Fecha de ingreso:<input class="dd_con_estilo_largo" style="margin-left:50px;" type="date"/></div>
									<div class="dd_otroEmpleo">Antigüedad:<input class="dd_con_estilo" disabled="false" style="margin-left:91px; width:250px;" type="text" placeholder="5 AÑOS"/></div>
								</div>

		                        <div class="dd_btnEstudiosCursos"><input type="submit" class="estilo_button2" style="width:170px;"  type="button" value="Guardar" name="dd_guardar" id="dd_guardar" /></div>

		                        <!--<button id="submit" type="submit">Submit Form</button>-->
						</div>

				<!------------------- CONTENIDO SEGUNDO TAB ---------------------------->

					    <div class="content-2">
		                    
     
							<h2>Grado de estudios</h2>

							<div class="dd_divDecoracionEstudios">

								<div class="dd_especialidad">Licenciatura:</div>
								
								<div class="dd_licenciatura_uniEgreso_fechaTitulacion_cedula">

									<div class="dd_licenciatura"><input class="dd_con_estilo_largo"  type="text" placeholder="LIC. EN INFORMATICA"/></div>
									<div class="dd_uniEgreso">Escuela:<input class="dd_con_estilo" type="text" placeholder="UABC"/></div>
									<div class="dd_fechaTitulacion">Titulación:<input class="dd_estilo_combo" type="date" medida="Y/M/D"></div>

									<div class="dd_cedula">Cédula:<input class="dd_estilo_cedula" type="text" placeholder="8000054"/>  </div>
									<div class="dd_fechaTitulacion"><input class="dd_estilo_combo" type="text" medida="Y/M/D" placeholder="cedula.png"></div>

									<div class="dd_btnAdd"><input class="dd_clsAgregarArchivo" value="" type="button"></div>
									<div class="dd_btnAdd"><input class="dd_clsCancelar" value="" type="button"></div>
									<div class="dd_btnAdd"><input class="dd_clsAgregarFila" value="" type="button" id="dd_agregar"></div>

								</div>

							
								<div class="dd_licenciatura_uniEgreso_fechaTitulacion_cedula">

									<div class="dd_licenciatura"><input class="dd_con_estilo_largo"  type="text" readonly="readonly"/></div>

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
							         
							         <div class="dd_uniEgreso"><label>Nombre:</label><input class="dd_con_estilo_largo" type="text" placeholder="ELABORACION DE MATERIAL DIDACTICO UTILIZANDO LAS HERRAMIENTAS DE POWER POINT Y PREZI"/></div>
							         <div class="dd_fechaTitulacion"><label>Término:</label><input class="dd_estilo_combo" type="date" medida="Y/M/D"/></div>
							         <div class="dd_cedula"><label style="padding-right:17px">Valor:</label><input class="dd_estilo_cedula" style="margin-left:5px;" type="text"/></div>

							         <div class="dd_fechaTitulacion"><input class="dd_estilo_combo" style="margin-left:10px;" type="text" medida="Y/M/D" placeholder="curso material didactico.png"></div>

									<div class="dd_btnAdd"><input class="dd_clsAgregarArchivo" value="" type="button"></div>
									<div class="dd_btnAdd"><input class="dd_clsCancelar" value="" type="button"></div>
									<div class="dd_btnAdd"><input class="dd_clsAgregarFila" value="" type="button"></div>
						     	</div>

						     	<div class="dd_licenciatura_uniEgreso_fechaTitulacion_cedula">

							        <div class="dd_licenciatura"><label>Tipo:</label>
							            <select class="dd_estilo_combo">
							              <option value="TALLER">TALLER</option>
							              <option value="CURSO">CURSO</option>
							              <option value="CONGRESO">CONGRESO</option>
							              
							            </select>
							        </div>
							         
							         <div class="dd_uniEgreso"><label>Nombre:</label><input class="dd_con_estilo_largo" type="text" placeholder="UML Y DISEÑO DE SISTEMAS"/></div>
							         <div class="dd_fechaTitulacion"><label>Término:</label><input class="dd_estilo_combo" type="date" medida="Y/M/D"/></div>
							         <div class="dd_cedula"><label style="padding-right:17px">Valor:</label><input class="dd_estilo_cedula" style="margin-left:5px;" type="text"/></div>

							         <div class="dd_fechaTitulacion"><input class="dd_estilo_combo" style="margin-left:10px;" type="text" medida="Y/M/D" placeholder="taller UML.png"></div>

									<div class="dd_btnAdd"><input class="dd_clsAgregarArchivo" value="" type="button"></div>
									<div class="dd_btnAdd"><input class="dd_clsCancelar" value="" type="button"></div>
									<div class="dd_btnAdd"><input class="dd_clsAgregarFila" value="" type="button"></div>
						     	</div>

						     	<div class="dd_licenciatura_uniEgreso_fechaTitulacion_cedula">

							        <div class="dd_licenciatura"><label>Tipo:</label>
							            <select class="dd_estilo_combo">
							              <option value="TALLER">TALLER</option>
							              <option value="CURSO">CURSO</option>
							              <option value="CONGRESO">CONGRESO</option>
							              
							            </select>
							        </div>
							         
							         <div class="dd_uniEgreso"><label>Nombre:</label><input class="dd_con_estilo_largo" type="text" placeholder="DESARROLLO DE APPS PARA IOS"/></div>
							         <div class="dd_fechaTitulacion"><label>Término:</label><input class="dd_estilo_combo" type="date" medida="Y/M/D"/></div>
							         <div class="dd_cedula"><label style="padding-right:17px">Valor:</label><input class="dd_estilo_cedula" style="margin-left:5px;" type="text" /></div>

							         <div class="dd_fechaTitulacion"><input class="dd_estilo_combo" style="margin-left:10px;" type="text" medida="Y/M/D" placeholder="taller_ios.png"></div>

									<div class="dd_btnAdd"><input class="dd_clsAgregarArchivo" value="" type="button"></div>
									<div class="dd_btnAdd"><input class="dd_clsCancelar" value="" type="button"></div>
									<div class="dd_btnAdd"><input class="dd_clsAgregarFila" value="" type="button"></div>
						     	</div>

						     	<div class="dd_licenciatura_uniEgreso_fechaTitulacion_cedula">

							        <div class="dd_licenciatura"><label>Tipo:</label>
							            <select class="dd_estilo_combo">
							              <option value="TALLER">TALLER</option>
							              <option value="CURSO">CURSO</option>
							              <option value="CONGRESO">CONGRESO</option>
							             
							            </select>
							        </div>
							         
							         <div class="dd_uniEgreso"><label>Nombre:</label><input class="dd_con_estilo_largo" type="text" placeholder="CONTPAQI: CONTABILIDAD ELECTRONICA Y EL TIMBRADO DE LA NOMINA"/></div>
							         <div class="dd_fechaTitulacion"><label>Término:</label><input class="dd_estilo_combo" type="date" medida="Y/M/D"/></div>
							         <div class="dd_cedula"><label style="padding-right:17px">Valor:</label><input class="dd_estilo_cedula" style="margin-left:5px;" type="text"/></div>

							         <div class="dd_fechaTitulacion"><input class="dd_estilo_combo" style="margin-left:10px;" type="text" medida="Y/M/D" placeholder="taller_contpaqi.png"></div>

									<div class="dd_btnAdd"><input class="dd_clsAgregarArchivo" value="" type="button"></div>
									<div class="dd_btnAdd"><input class="dd_clsCancelar" value="" type="button"></div>
									<div class="dd_btnAdd"><input class="dd_clsAgregarFila" value="" type="button"></div>
						     	</div>

						     	<div class="dd_licenciatura_uniEgreso_fechaTitulacion_cedula">

							       <div class="dd_licenciatura"><label>Tipo:</label>
							            <select class="dd_estilo_combo">
							              <option value="TALLER">TALLER</option>
							              <option value="CURSO">CURSO</option>
							              <option value="CONGRESO">CONGRESO</option>
							              
							            </select>
							        </div>
							         
							         <div class="dd_uniEgreso"><label>Nombre:</label><input class="dd_con_estilo_largo" type="text" placeholder="JAVASCRIPT"/></div>
							         <div class="dd_fechaTitulacion"><label>Término:</label><input class="dd_estilo_combo" type="date" medida="Y/M/D"/></div>
							         <div class="dd_cedula"><label style="padding-right:17px">Valor:</label><input class="dd_estilo_cedula" style="margin-left:5px;" type="text"/></div>

							         <div class="dd_fechaTitulacion"><input class="dd_estilo_combo" style="margin-left:10px;" type="text" medida="Y/M/D" placeholder="taller_javascript.png"></div>

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
							         
							         <div class="dd_uniEgreso"><label>Nombre:</label><input class="dd_con_estilo_largo" type="text" placeholder="DISEÑO INSTRUCCIONAL PARA CURSOS EN LINEA"/></div>
							         
						     	</div>

						     	<div class="dd_licenciatura_uniEgreso_fechaTitulacion_cedula">

							        <div class="dd_licenciatura"><label>Tipo:</label>
							            <select class="dd_estilo_combo">
							              <option value="CURSO">CURSO</option>
							              <option value="CONGRESO">CONGRESO</option>
							              <option value="TALLER">TALLER</option>
							            </select>
							        </div>
							         
							         <div class="dd_uniEgreso"><label>Nombre:</label><input class="dd_con_estilo_largo" type="text" placeholder="DOCENCIA Y APRENDIZAJE COOPERATIVO"/></div>
							         
						     	</div>

						     	<div class="dd_licenciatura_uniEgreso_fechaTitulacion_cedula">

							        <div class="dd_licenciatura"><label>Tipo:</label>
							            <select class="dd_estilo_combo">
							              <option value="CURSO">CURSO</option>
							              <option value="CONGRESO">CONGRESO</option>
							              <option value="TALLER">TALLER</option>
							            </select>
							        </div>
							         
							         <div class="dd_uniEgreso"><label>Nombre:</label><input class="dd_con_estilo_largo" type="text" placeholder="ESTRATEGIAS DIDACTICAS APOYADAS EN TCC"/></div>
							         
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
														
						</div>
						

				<!------------------- CONTENIDO TERCER TAB ---------------------------->
		                    
		                    
					    <div class="content-3">
							
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
											<td><input class="dd_con_estilo_corto" type="text" name="dd_input_Tabla" placeholder="11885"/></td>
											<td><input class="dd_con_estilo_largo_tabla" type="text" name="dd_input_Tabla" placeholder="COMERCIO ELECTRONICO"/></td>
											<td><input type="button" value="-" title='Modificar' class="clsModificarFila" id="dd_modificarFila"/></td>	
											<td><input type="button" value="-" title='Seleccionar' class="clsEliminarFila" id="eliminar"/></td>	
										</tr>
										<tr>
											<td><input class="dd_con_estilo_corto" type="text" name="dd_input_Tabla" placeholder="11850"/></td>
											<td><input class="dd_con_estilo_largo_tabla" type="text" name="dd_input_Tabla" placeholder="DISEÑO DE SISTEMAS"/></td>
											<td><input type="button" value="-" title='Modificar' class="clsModificarFila" id="dd_modificarFila"/></td>	
											<td><input type="button" value="-" title='Eliminar' class="clsEliminarFila" id="eliminar"/></td>	
										</tr>
										<tr>
											<td><input class="dd_con_estilo_corto" type="text" name="dd_input_Tabla" placeholder="11842"/></td>
											<td><input class="dd_con_estilo_largo_tabla" type="text" name="dd_input_Tabla" placeholder="ANALISIS DE SISTEMAS"/></td>
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
											
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>7:00 - 8:00</td>
											<!--<td onmouseover="cambiacolor_over(this)" onmouseout="cambiacolor_out(this)"></td>-->
											<td><img alt="Imagen" src="../imagenes/good.png" /></td>		
											<td><img alt="Imagen" src="../imagenes/good.png" /></td>
											<td><img alt="Imagen" src="../imagenes/good.png" /></td>
											<td><img alt="Imagen" src="../imagenes/good.png" /></td>
											<td><img alt="Imagen" src="../imagenes/good.png" /></td>
											



										</tr>
										<tr>
											<td>8:00 - 9:00</td>
											
											<td><img alt="Imagen" src="../imagenes/good.png" /></td>	
											<td><img alt="Imagen" src="../imagenes/good.png" /></td>
											<td><img alt="Imagen" src="../imagenes/good.png" /></td>		
											<td><img alt="Imagen" src="../imagenes/good.png" /></td>
											<td><img alt="Imagen" src="../imagenes/good.png" /></td>
											
						

										</tr>
										<tr>
											<td>9:00 - 10:00</td>
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
											
						
										</tr>
										<tr>
											<td>11:00 - 12:00</td>
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
											
						
										</tr>
										<tr>
											<td>13:00 - 14:00</td>
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
											
						
										</tr>
										<tr>
											<td>15:00 - 16:00</td>
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
											
						
										</tr>
										<tr>
											<td>17:00 - 18:00</td>
											<td><img alt="Imagen" src="../imagenes/good.png" /></td>	
											<td><img alt="Imagen" src="../imagenes/good.png" /></td>
											<td><img alt="Imagen" src="../imagenes/good.png" /></td>
											<td><img alt="Imagen" src="../imagenes/good.png" /></td>
											<td><img alt="Imagen" src="../imagenes/good.png" /></td>
											
						
										</tr>
										<tr>
											<td>18:00 - 19:00</td>
											<td><img alt="Imagen" src="../imagenes/good.png" /></td>	
											<td><label></label></td>
											<td><img alt="Imagen" src="../imagenes/good.png" /></td>
											<td><label></label></td>
											<td><img alt="Imagen" src="../imagenes/good.png" /></td>
											
						
										</tr>
										<tr>
											<td>19:00 - 20:00</td>
											<td><img alt="Imagen" src="../imagenes/good.png" /></td>	
											<td><label></label></td>
											<td><img alt="Imagen" src="../imagenes/good.png" /></td>
											<td><label></label></td>
											<td><img alt="Imagen" src="../imagenes/good.png" /></td>
											
						
										</tr>
										<tr>
											<td>20:00 - 21:00</td>
											<td><img alt="Imagen" src="../imagenes/good.png" /></td>	
											<td><label></label></td>
											<td><img alt="Imagen" src="../imagenes/good.png" /></td>
											<td><label></label></td>
											<td><img alt="Imagen" src="../imagenes/good.png" /></td>
											
						
										</tr>
										<tr>
											<td>21:00 - 22:00</td>
											<td><img alt="Imagen" src="../imagenes/good.png" /></td>	
											<td><label></label></td>
											<td><img alt="Imagen" src="../imagenes/good.png" /></td>
											<td><label></label></td>
											<td><img alt="Imagen" src="../imagenes/good.png" /></td>
											
						
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
			<!--<div id="pie_correo">email: emma.castillejos@uabc.edu.mx</div>
			<div id="pie_tel">Teléfono: 664 188 9221</div>-->

	</footer>

</div>
</body>

<!--- CAMBIAR DE COLOR LA LABEL DE LA DISPONIBILIDAD -->

<script language="javascript">

	function cambiacolor_over(celda){ celda.style.backgroundColor="#ff0000" } 
	function cambiacolor_out(celda){ celda.style.backgroundColor="#F0FFFF" }

	/*if
	{
		onClick==true;
		celda.style.backgroundColor="#ff0000";
	}*/

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