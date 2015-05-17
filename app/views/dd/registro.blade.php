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

		<!-- Creación de Ventanas Modales -->
		<script src="../js/ventanamodal.js"></script>
	

		<!----------------- Checkboxlist para agregar cursos de actualizacion que deseen tomar los docentes ---------->
		
		<link rel="stylesheet" href="../css/jqx.base.css" type="text/css" />
		<link rel="stylesheet" href="../css/jqx.orange.css" type="text/css" />
		<script type="text/javascript" src="../js/jquery-2.1.0.min.js"></script>

		<script type="text/javascript">
							            $(document).ready(function () {
							                var source = [
							                    "CURSO PROFESIONAL DE BACKEND",
							                    "HERRAMIENTAS CLOUD PARA EL DESARROLLO DE HABILIDADES",
							                    "FRONTEND, APLICACIONES WEB PROFESIONAL",
							                    "CURSO AVANZADO DE ANDROID",
							                    "CURSO PROFESIONAL DE GIT Y GITHUB, ",
							                    "CURSO DE ADMINISTRACION DE SERVIDORES Y DEVOPS",
							                    "CURSO DE PROGRAMACION PARA IOS, IPHONE Y IPAD",
							                    "NODE.JS Y JAVASCRIPT"
									        ];

							                // Create a jqxListBox
							                $("#listbox").jqxListBox({width: 600, source: source, checkboxes: true, height: 140, theme: 'orange'});
							                // Check several items.
							                $("#listbox").jqxListBox('checkIndex', 0);
							                $("#listbox").jqxListBox('checkIndex', 1);
							                $("#listbox").jqxListBox('checkIndex', 2);
							                $("#listbox").jqxListBox('checkIndex', 5);

							                $("#listbox").on('checkChange', function (event) {
							                    var args = event.args;
							                    if (args.checked) {
							                        $("#Events").text("Checked: " + args.label);
							                    }
							                    else {
							                        $("#Events").text("Unchecked: " + args.label);
							                    }

							                    var items = $("#listbox").jqxListBox('getCheckedItems');
							                    var checkedItems = "";
							                    $.each(items, function (index) {
							                        if (index < items.length - 1) {
							                            checkedItems += this.label + ", ";
							                        }
							                        else checkedItems += this.label;
							                    });
							                    $("#CheckedItems").text(checkedItems);
							                });
							            });
							        </script>

		<!---------------------------------------------------------------------------------------->


		<!--AQUI VA HORA Y FECHA-->
		<script src="../js/tiempoactual.js"></script>
		<script>$(function(){startWatch(); return false;});</script>
		<!-- Script tiempo -->


		<!---------------------------------------------------------------------------------------->
<title>Disponibilidad docente</title>
</head>
<body>

<!-------------------------------- MODAL CATALOGO CURSOS -------------------------------->

	<div class="md-modal md-effect-11" id="btnCatalogoCursos"> 
		<form id="formPeriodo" action="javascript:registrarPeriodo();" class="md-content" method="post">
			<h3>Agregar curso de actualización</h3>
			<div class="tblCatalogos">
				<table class="tblCatPlan">
					<tr>
						<td>Nombre:</td>
						<td><input class="con_estilo_largo" style="text-transform:uppercase" onblur="Mayusculas(this)" name="catalogo_curso" type="text" id="catalogo_curso" required/>
					</tr>
			
				</table>
			</div>
			<div class="CatBotones">
				<input type="submit" class="estilo_button2" value="Guardar"/>
				<input type="button" value="Salir" class="md-close" id="salirPeriodo"/>
			</div>
		</form>
	</div>
	

	<!---------------------------------------------------------------------------------------->


	<!-------------------------------- MODAL MATERIAS IMPARTIDAS SEMESTRE ANTERIOR -------------------------------->

	<div class="md-modal md-effect-11" id="btnMateriasAnterior"> 
		<form id="formPeriodo" action="javascript:registrarPeriodo();" class="md-content" method="post">
			<h3>Materias impartidas el semestre anterior</h3>
			
			<div class="tblCatalogos">

				<table class="dd_tabla_MatImpartir" style="color: black; width:200px; margin-top:30px;">

					<thead class="dd_encabezado">
						<tr>
							<th style="width:50px;">CLAVE</th>
							<th style="width:150px;">MATERIA</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input id="dd_claveMateria" style="text-transform:uppercase" onblur="Mayusculas(this)" onkeypress="ValidaSoloNumeros()" class="dd_con_estilo_corto" type="text" name="dd_input_Tabla"/></td>
							<td><input id="dd_nombreMateria" style="text-transform:uppercase" onblur="Mayusculas(this)" class="dd_con_estilo_largo_tabla" type="text" name="dd_input_Tabla"/></td>
						</tr>
						<tr>
							<td><input id="dd_claveMateria" style="text-transform:uppercase" onblur="Mayusculas(this)" onkeypress="ValidaSoloNumeros()" class="dd_con_estilo_corto" type="text" name="dd_input_Tabla"/></td>
							<td><input id="dd_nombreMateria" style="text-transform:uppercase" onblur="Mayusculas(this)" class="dd_con_estilo_largo_tabla" type="text" name="dd_input_Tabla"/></td>
						</tr>	
						<tr>
							<td><input id="dd_claveMateria" style="text-transform:uppercase" onblur="Mayusculas(this)" onkeypress="ValidaSoloNumeros()" class="dd_con_estilo_corto" type="text" name="dd_input_Tabla"/></td>
							<td><input id="dd_nombreMateria" style="text-transform:uppercase" onblur="Mayusculas(this)" class="dd_con_estilo_largo_tabla" type="text" name="dd_input_Tabla"/></td>
						</tr>	
						<tr>
							<td><input id="dd_claveMateria" style="text-transform:uppercase" onblur="Mayusculas(this)" onkeypress="ValidaSoloNumeros()" class="dd_con_estilo_corto" type="text" name="dd_input_Tabla"/></td>
							<td><input id="dd_nombreMateria" style="text-transform:uppercase" onblur="Mayusculas(this)" class="dd_con_estilo_largo_tabla" type="text" name="dd_input_Tabla"/></td>
						</tr>	
						<tr>
							<td><input id="dd_claveMateria" style="text-transform:uppercase" onblur="Mayusculas(this)" onkeypress="ValidaSoloNumeros()" class="dd_con_estilo_corto" type="text" name="dd_input_Tabla"/></td>
							<td><input id="dd_nombreMateria" style="text-transform:uppercase" onblur="Mayusculas(this)" class="dd_con_estilo_largo_tabla" type="text" name="dd_input_Tabla"/></td>
						</tr>	
						<tr>
							<td><input id="dd_claveMateria" style="text-transform:uppercase" onblur="Mayusculas(this)" onkeypress="ValidaSoloNumeros()" class="dd_con_estilo_corto" type="text" name="dd_input_Tabla"/></td>
							<td><input id="dd_nombreMateria" style="text-transform:uppercase" onblur="Mayusculas(this)" class="dd_con_estilo_largo_tabla" type="text" name="dd_input_Tabla"/></td>
						</tr>	
						<tr>
							<td><input id="dd_claveMateria" style="text-transform:uppercase" onblur="Mayusculas(this)" onkeypress="ValidaSoloNumeros()" class="dd_con_estilo_corto" type="text" name="dd_input_Tabla"/></td>
							<td><input id="dd_nombreMateria" style="text-transform:uppercase" onblur="Mayusculas(this)" class="dd_con_estilo_largo_tabla" type="text" name="dd_input_Tabla"/></td>
						</tr>		
						
					</tbody>
				</table>

			</div>
			<div class="CatBotones">
				<input type="submit" class="estilo_button2" value="Guardar"/>
				<input type="button" value="Salir" class="md-close" id="salirPeriodo"/>
			</div>
		</form>
	</div>
	<div class="md-overlay"></div>

	<!---------------------------------------------------------------------------------------->




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
									<div id="dd_fotoDoc"></div>

									<div id="dd_aPaterno_aMaterno_nombres_sexo">
										<div id="dd_noEmpleado">No. empleado:<label id="dd_lbl_noEmpleado" class="dd_label"  style="margin-left:15px;">XXXXX</label></div>
										<div class="dd_datosPersonales">Período:<input id="dd_periodo" style="margin-left:55px;"  class="dd_con_estilo_largo" type="text" /></div>
										<div id="dd_fechaIngreso">Ingreso UABC:<input id="dd_ingresoUabc" type="date" class="dd_estilo_combo" style="margin-left:10px; width:248px;" medida="Y/M/D" placeholder="23/09/2005"/></div>
										<div class="dd_datosPersonales">A. paterno:<input id="dd_aPaterno" style="margin-left:32px; text-transform:uppercase" class="dd_con_estilo_largo" type="text" onkeypress="Mayusculas(this)" /></div>
										<div class="dd_datosPersonales">A. materno:<input id="dd_aMaterno" style="margin-left:27px; text-transform:uppercase" class="dd_con_estilo_largo" type="text" onkeypress="Mayusculas(this)" /></div>
										<div class="dd_datosPersonales">Nombre(s):<input id="dd_nombres" style="margin-left:32px; text-transform:uppercase" class="dd_con_estilo_largo" type="text" onkeypress="Mayusculas(this)" /></div>

										<div class="dd_datosPersonales" >
											Sexo:
											<select id="dd_sexo" class="dd_estilo_combo" style="margin-left:75px; margin-bottom:0px; width:252px;">
												 <option value="FEMENINO">FEMENINO</option>
												 <option value="MASCULINO">MASCULINO</option>
											</select>
										</div>

									</div>
								</div>

								 <h2>Dirección y teléfonos</h2>

									<div class="dd_colonia_calle_int_ext_cp">
										<div class="dd_datosPersonales">Calle:<input id="dd_calle" class="dd_con_estilo_largo" style="margin-left:35px; text-transform:uppercase" onblur="Mayusculas(this)" type="text"/></div>
										<div id="dd_ext">No. ext.:<input id="dd_noExterior" class="dd_con_estilo_corto" style="margin-left:10px;"  type="text" onKeyPress="ValidaSoloNumeros()"/></div>
					                	<div id="dd_int">No. int.:<input id="dd_noInterior" class="dd_con_estilo_corto" style="margin-left:15px;" type="text" onKeyPress="ValidaSoloNumeros()"/></div>
										<div class="dd_datosPersonales">Colonia:<input id="dd_colonia" class="dd_con_estilo_largo" style="margin-left:15px; text-transform:uppercase" onblur="Mayusculas(this)" type="text"/></div>
										<div class="dd_datosPersonales">C.P.:<input id="dd_cp" class="dd_con_estilo_corto" style="margin-left:44px;"  type="text" onKeyPress="ValidaSoloNumeros()"/></div>

											
										<div class="dd_datosPersonales" >País:
											<select id="dd_pais" class="dd_con_estilo_largo" style="margin-left:40px;">
												 <option value="MEXICO">MEXICO</option>
												 <option value="USA">USA</option>
											</select>
										</div>

										<div class="dd_datosPersonales">Estado:
											<select id="dd_estado" class="dd_con_estilo_largo" style="margin-left:18px;">
												<option value="BAJA CALIFORNIA">BAJA CALIFORNIA</option>
												<option value="SONORA">SONORA</option>
											</select>
										</div>

										
		
									</div>

									 <div class="dd_divDecoracionTelefonos">
									 	<div class="dd_datosPersonales">Ciudad:
											<select id="dd_ciudad" class="dd_con_estilo_largo" style="margin-left:60px;">
												<option value="TIJUANA">TIJUANA</option>
												<option value="GUAYMAS">GUAYMAS</option>
											</select>
										</div>
										<div class="dd_datosPersonales">Oficina:<input id="dd_oficina" class="dd_con_estilo_largo" style="margin-left:62px; text-transform:uppercase" onblur="Mayusculas(this)" type="text" /></div>
										<div class="dd_datosPersonales">Particular:<input id="dd_particular" class="dd_con_estilo_largo" style="margin-left:38px; text-transform:uppercase" onblur="Mayusculas(this)" type="text" /></div>
										<div class="dd_datosPersonales">Celular:<input id="dd_celular" class="dd_con_estilo_largo" style="margin-left:60px; text-transform:uppercase" onblur="Mayusculas(this)" type="text" /></div>
										<div class="dd_datosPersonales">Correo UABC:<input id="dd_correoUabc" class="dd_con_estilo_largo" style="margin-left:12px; text-transform:uppercase" onblur="Mayusculas(this)" type="text" /></div>
										<div class="dd_datosPersonales">Correo:<input id="dd_correo" class="dd_con_estilo_largo" style="margin-left:62px; text-transform:uppercase" onblur="Mayusculas(this)" type="text"/></div>
										
									</div>

								<h2 style="margin-top:400px;">Trabajo fuera de UABC</h2>
				                   		<div id="dd_trabajoFuera_puesto">

				                   			<div class="dd_datosPersonales">RFC:<label id="dd_lbl_rfc" class="dd_label" style="margin-left:50px;">XXXXXXXXXXXX</label></div>
											<div class="dd_datosPersonales">Empresa:<input id="dd_empresa" class="dd_con_estilo_largo" style="margin-left:10px; text-transform:uppercase" onblur="Mayusculas(this)" type="text"/></div>
											

											<div class="dd_datosPersonales">Puesto:
												<select id="dd_puestoExterno" style="margin-left:20px; width:252px;" class="dd_con_estilo_largo">
													<option>GERENTE GENERAL</option>
													<option>DIRECTOR</option>
													<option>SUBDIRECTOR</option>
													<option>COORDINADOR</option>
												</select>
											</div>

										</div>
										<div id="dd_ingreso_antiguedad">


											<div class="dd_datosPersonales" style="margin-top:40px;">Fecha de ingreso:<input id="dd_ingresoExterno" class="dd_con_estilo" style="margin-left:10px; width:215px" type="date"/></div>
											<div class="dd_datosPersonales">Antigüedad:<input id="dd_antiguedadExterno" class="dd_con_estilo" disabled="false" style="margin-left:60px; width:215px;" type="text"/></div>

										</div>


				                        <div class="dd_btnEstudiosCursos"><input type="submit" class="estilo_button2" style="width:170px;"  type="button" value="Guardar" name="dd_guardar" id="dd_guardar" /></div>

		                        <!--<button id="submit" type="submit">Submit Form</button>-->
		                    </form>
						</div>

				<!------------------- CONTENIDO SEGUNDO TAB ---------------------------->

					    <div class="content-2">
		                    
     
							<h2>Grado de estudios</h2>

							<div class="dd_divDecoracionEstudios">

								<div class="dd_especialidad">Licenciatura:</div>
								
								<div class="dd_licenciatura_uniEgreso_fechaTitulacion_cedula">

									<div class="dd_licenciatura"><input id="dd_licenciatura" class="dd_con_estilo_largo" style="text-transform:uppercase" type="text" onblur="Mayusculas(this)" /></div>
									<div class="dd_uniEgreso">Escuela:<input id="dd_escuela" class="dd_con_estilo" type="text" style="text-transform:uppercase" onblur="Mayusculas(this)" /></div>
									<div class="dd_fechaTitulacion">Titulación:<input id="dd_fechaTitulacion" class="dd_estilo_combo" type="date" medida="Y/M/D"></div>

									<div class="dd_cedula">Cédula:<input id="dd_cedula" class="dd_estilo_cedula" style="text-transform:uppercase" type="text" onblur="Mayusculas(this)" />  </div>
									<div class="dd_fechaTitulacion"><input id="dd_archivoTitulacion" class="dd_estilo_combo" type="text" medida="Y/M/D"></div>

									<div class="dd_btnAdd"><div class="custom-input-file"><input type="file" class="input-file" name="fileToUpload" id="fileToUpload"/>
									</div></div>
									<div class="dd_btnAdd"><input id="dd_btnCancelar_archivo" class="dd_clsCancelar" value="" type="button"></div>
									<div class="dd_btnAdd"><input class="dd_clsAgregarFila" value="" type="button" id="dd_agregar"></div>

								</div>

							
								<div class="dd_licenciatura_uniEgreso_fechaTitulacion_cedula">

									<div class="dd_licenciatura"><input id="dd_licenciatura" style="text-transform:uppercase" class="dd_con_estilo_largo" onblur="Mayusculas(this)" type="text" /></div>
									<div class="dd_uniEgreso">Escuela:<input id="dd_escuela" style="text-transform:uppercase" class="dd_con_estilo" onblur="Mayusculas(this)" type="text" /></div>
									<div class="dd_fechaTitulacion">Titulación:<input id="dd_fechaTitulacion" class="dd_estilo_combo" type="date" medida="Y/M/D"></div>

									<div class="dd_cedula">Cédula:<input id="dd_cedula" style="text-transform:uppercase" onblur="Mayusculas(this)" class="dd_estilo_cedula" type="text" />  </div>
									<div class="dd_fechaTitulacion"><input id="dd_archivoTitulacion" class="dd_estilo_combo" type="text" medida="Y/M/D"></div>

									<div class="dd_btnAdd"><div class="custom-input-file"><input type="file" class="input-file" name="fileToUpload" id="fileToUpload"/>
									</div></div>
									<div class="dd_btnAdd"><input id="dd_btnCancelar_archivo" class="dd_clsCancelar" value="" type="button"></div>
									

								</div>

								<div class="dd_especialidad">Especialidad:<input id="dd_chk_especialidad" class="dd_estilo_check" type="checkbox"  value="1" onchange="javascript:showContent()"> 
									Si</div>

								<div class="dd_licenciatura_uniEgreso_fechaTitulacion_cedula">

									<div class="dd_licenciatura"><input id="dd_licenciatura" style="text-transform:uppercase" onblur="Mayusculas(this)" class="dd_con_estilo_largo"  type="text" /></div>
									<div class="dd_uniEgreso">Escuela:<input id="dd_escuela" style="text-transform:uppercase" onblur="Mayusculas(this)" class="dd_con_estilo" type="text" /></div>
									<div class="dd_fechaTitulacion">Titulación:<input id="dd_fechaTitulacion"  class="dd_estilo_combo" type="date" medida="Y/M/D"></div>

									<div class="dd_cedula">Cédula:<input id="dd_cedula" style="text-transform:uppercase" onblur="Mayusculas(this)" class="dd_estilo_cedula" type="text" />  </div>
									<div class="dd_fechaTitulacion"><input id="dd_archivoTitulacion" class="dd_estilo_combo" type="text" medida="Y/M/D"></div>

									<div class="dd_btnAdd"><div class="custom-input-file"><input type="file" class="input-file" name="fileToUpload" id="fileToUpload"/>
									</div></div>
									<div class="dd_btnAdd"><input id="dd_btnCancelar_archivo" class="dd_clsCancelar" value="" type="button"></div>
									<div class="dd_btnAdd"><input class="dd_clsAgregarFila" value="" type="button" id="dd_agregar"></div>

								</div>
								

								<div class="dd_licenciatura_uniEgreso_fechaTitulacion_cedula">

									<div class="dd_licenciatura"><input id="dd_licenciatura" style="text-transform:uppercase" onblur="Mayusculas(this)" class="dd_con_estilo_largo"  type="text" /></div>
									<div class="dd_uniEgreso">Escuela:<input id="dd_escuela" style="text-transform:uppercase" onblur="Mayusculas(this)" class="dd_con_estilo" type="text" /></div>
									<div class="dd_fechaTitulacion">Titulación:<input id="dd_fechaTitulacion" class="dd_estilo_combo" type="date" medida="Y/M/D"></div>

									<div class="dd_cedula">Cédula:<input id="dd_cedula" style="text-transform:uppercase" onblur="Mayusculas(this)" class="dd_estilo_cedula" type="text" />  </div>
									<div class="dd_fechaTitulacion"><input id="dd_archivoTitulacion" class="dd_estilo_combo" type="text" medida="Y/M/D"></div>
									<div class="dd_btnAdd"><div class="custom-input-file"><input type="file" class="input-file" name="fileToUpload" id="fileToUpload"/>
									</div></div>
									<div class="dd_btnAdd"><input id="dd_btnCancelar_archivo" class="dd_clsCancelar" value="" type="button"></div>
									

								</div>



								<div class="dd_especialidad">Maestría:<input id="dd_chk_maestria" class="dd_estilo_check" style="margin-left:45px;" type="checkbox"  value="1" onchange="javascript:showContent()"> 
									Si</div>

								<div class="dd_licenciatura_uniEgreso_fechaTitulacion_cedula">

									<div class="dd_licenciatura"><input id="dd_licenciatura" style="text-transform:uppercase" onblur="Mayusculas(this)" class="dd_con_estilo_largo"  type="text" /></div>
									<div class="dd_uniEgreso">Escuela:<input id="dd_escuela" style="text-transform:uppercase" onblur="Mayusculas(this)" class="dd_con_estilo" type="text" /></div>
									<div class="dd_fechaTitulacion">Titulación:<input id="dd_fechaTitulacion" class="dd_estilo_combo" type="date" medida="Y/M/D"></div>

									<div class="dd_cedula">Cédula:<input id="dd_cedula" style="text-transform:uppercase" onblur="Mayusculas(this)" class="dd_estilo_cedula" type="text" />  </div>
									<div class="dd_fechaTitulacion"><input id="dd_archivoTitulacion" class="dd_estilo_combo" type="text" medida="Y/M/D"></div>

									<div class="dd_btnAdd"><div class="custom-input-file"><input type="file" class="input-file" name="fileToUpload" id="fileToUpload"/>
									</div></div>
									<div class="dd_btnAdd"><input id="dd_btnCancelar_archivo" class="dd_clsCancelar" value="" type="button"></div>
									<div class="dd_btnAdd"><input class="dd_clsAgregarFila" value="" type="button" id="dd_agregar"></div>

								</div>

								

								<div class="dd_licenciatura_uniEgreso_fechaTitulacion_cedula">

									<div class="dd_licenciatura"><input id="dd_licenciatura" style="text-transform:uppercase" onblur="Mayusculas(this)" class="dd_con_estilo_largo"  type="text" /></div>
									<div class="dd_uniEgreso">Escuela:<input id="dd_escuela" style="text-transform:uppercase" onblur="Mayusculas(this)" class="dd_con_estilo" type="text" /></div>
									<div class="dd_fechaTitulacion">Titulación:<input id="dd_fechaTitulacion" class="dd_estilo_combo" type="date" medida="Y/M/D"></div>

									<div class="dd_cedula">Cédula:<input id="dd_cedula" style="text-transform:uppercase" onblur="Mayusculas(this)" class="dd_estilo_cedula" type="text" />  </div>
									<div class="dd_fechaTitulacion"><input id="dd_archivoTitulacion" class="dd_estilo_combo" type="text" medida="Y/M/D"></div>

									<div class="dd_btnAdd"><div class="custom-input-file"><input type="file" class="input-file" name="fileToUpload" id="fileToUpload"/>
									</div></div>
									<div class="dd_btnAdd"><input id="dd_btnCancelar_archivo" class="dd_clsCancelar" value="" type="button"></div>
									
								</div>


								<div class="dd_especialidad">Doctorado:<input id="dd_chk_doctorado" class="dd_estilo_check" style="margin-left:35px;" type="checkbox"  value="1" onchange="javascript:showContent()"> 
									Si</div>

								<div class="dd_licenciatura_uniEgreso_fechaTitulacion_cedula">

									<div class="dd_licenciatura"><input id="dd_licenciatura" style="text-transform:uppercase" onblur="Mayusculas(this)" class="dd_con_estilo_largo"  type="text" /></div>
									<div class="dd_uniEgreso">Escuela:<input id="dd_escuela" style="text-transform:uppercase" onblur="Mayusculas(this)" class="dd_con_estilo" type="text" /></div>
									<div class="dd_fechaTitulacion">Titulación:<input id="dd_fechaTitulacion" class="dd_estilo_combo" type="date" medida="Y/M/D"></div>

									<div class="dd_cedula">Cédula:<input id="dd_cedula" style="text-transform:uppercase" onblur="Mayusculas(this)" class="dd_estilo_cedula" type="text" />  </div>
									<div class="dd_fechaTitulacion"><input id="dd_archivoTitulacion" class="dd_estilo_combo" type="text" medida="Y/M/D"></div>

									<div class="dd_btnAdd"><div class="custom-input-file"><input type="file" class="input-file" name="fileToUpload" id="fileToUpload"/>
									</div></div>
									<div class="dd_btnAdd"><input id="dd_btnCancelar_archivo" class="dd_clsCancelar" value="" type="button"></div>
									<div class="dd_btnAdd"><input class="dd_clsAgregarFila" value="" type="button" id="dd_agregar"></div>

								</div>

								
								<div class="dd_licenciatura_uniEgreso_fechaTitulacion_cedula">

									<div class="dd_licenciatura"><input id="dd_licenciatura" style="text-transform:uppercase" onblur="Mayusculas(this)" class="dd_con_estilo_largo"  type="text" /></div>
									<div class="dd_uniEgreso">Escuela:<input id="dd_escuela" style="text-transform:uppercase" onblur="Mayusculas(this)" class="dd_con_estilo" type="text" /></div>
									<div class="dd_fechaTitulacion">Titulación:<input id="dd_fechaTitulacion" class="dd_estilo_combo" type="date" medida="Y/M/D"></div>

									<div class="dd_cedula">Cédula:<input id="dd_cedula" style="text-transform:uppercase" onblur="Mayusculas(this)" class="dd_estilo_cedula" type="text" />  </div>
									<div class="dd_fechaTitulacion"><input id="dd_archivoTitulacion" class="dd_estilo_combo" type="text" medida="Y/M/D"></div>

									<div class="dd_btnAdd"><div class="custom-input-file"><input type="file" class="input-file" name="fileToUpload" id="fileToUpload"/>
									</div></div>
									<div class="dd_btnAdd"><input id="dd_btnCancelar_archivo" class="dd_clsCancelar" value="" type="button"></div>
									
								</div>
							</div>
		                        
							<h2>Cursos</h2>

							<label class="dd_label">Cursos recibidos y/o congresos asistidos:</label>
							<br>
							<br>

						    <div class="dd_divDecoracionCursos">

						       	<div id="tbl_dd_cursos">
						       		<div id="tableContainer" class="tableContainer">
										<table style="width:1200px; margin-top:-20px;" border="0" cellpadding="0" cellspacing="0" width="100%" class="scrollTable tblSeriaciones">
											<thead style="background:green;">
												<tr>
													<th colspan="14">Ingresar cursos recibidos o impartidos</th>
												</tr>
											</thead>		

											
											<tbody class="scrollContent" style="height:125px;">


											<tr>
												<td>Elija:</td>
												 <td><select id="dd_elija" class="dd_estilo_combo" style="width:100px;">
											          	<option value="RECIBIDO">RECIBIDO</option>
											            <option value="IMPARTIDO">IMPARTIDO</option>
											         </select>
											      </td>

											     <td><label>Tipo:</label></td>
											     <td><select id="dd_elijaTipo" class="dd_estilo_combo" style="width:100px;">
											          	<option value="CURSO">CURSO</option>
											            <option value="CONGRESO">CONGRESO</option>
											            <option value="TALLER">TALLER</option>
											          </select>
											      </td>
       
											     <td><label>Nombre:</label></td><td><input id="dd_nombreCurso" class="dd_con_estilo_largo" style="width:200px; text-transform:uppercase" type="text" onblur="Mayusculas(this)" /></td>
											     <td><label>Término:</label></td><td><input id="dd_terminoCurso" class="dd_estilo_combo" type="date" medida="Y/M/D"/></td>
											     <td><label>Valor:</label></td><td><input id="dd_valorCurso" class="dd_estilo_cedula" style="text-transform:uppercase" onblur="Mayusculas(this)" type="text"/></td>
											     <td><input id="dd_archivoCurso" class="dd_estilo_combo" style="margin-left:10px;" type="text" medida="Y/M/D"></td>

												 <td><div class="custom-input-file"><input type="file" class="input-file" name="fileToUpload" id="fileToUpload"/></div></td>
												 <td><input id="dd_btnCancelar_archivo_curso" class="dd_clsCancelar" value="" type="button"></td>
												 <td><input class="dd_clsAgregarFila" value="" type="button"></td>
											</tr>

											<tr>
												<td>Elija:</td>
												 <td><select id="dd_elija" class="dd_estilo_combo" style="width:100px;">
											          	<option value="RECIBIDO">RECIBIDO</option>
											            <option value="IMPARTIDO">IMPARTIDO</option>
											         </select>
											      </td>

											     <td><label>Tipo:</label></td>
											     <td><select id="dd_elijaTipo" class="dd_estilo_combo" style="width:100px;">
											          	<option value="CURSO">CURSO</option>
											            <option value="CONGRESO">CONGRESO</option>
											            <option value="TALLER">TALLER</option>
											          </select>
											      </td>
       
											     <td><label>Nombre:</label></td><td><input id="dd_nombreCurso" class="dd_con_estilo_largo" style="width:200px; text-transform:uppercase" type="text" onblur="Mayusculas(this)" /></td>
											     <td><label>Término:</label></td><td><input id="dd_terminoCurso" class="dd_estilo_combo" type="date" medida="Y/M/D"/></td>
											     <td><label>Valor:</label></td><td><input id="dd_valorCurso" class="dd_estilo_cedula" style="text-transform:uppercase" onblur="Mayusculas(this)" type="text"/></td>
											     <td><input id="dd_archivoCurso" class="dd_estilo_combo" style="margin-left:10px;" type="text" medida="Y/M/D"></td>

												 <td><div class="custom-input-file"><input type="file" class="input-file" name="fileToUpload" id="fileToUpload"/></div></td>
												 <td><input id="dd_btnCancelar_archivo_curso" class="dd_clsCancelar" value="" type="button"></td>
												 <td><input class="dd_clsAgregarFila" value="" type="button"></td>
											</tr>

											<tr>
												<td>Elija:</td>
												 <td><select id="dd_elija" class="dd_estilo_combo" style="width:100px;">
											          	<option value="RECIBIDO">RECIBIDO</option>
											            <option value="IMPARTIDO">IMPARTIDO</option>
											         </select>
											      </td>

											     <td><label>Tipo:</label></td>
											     <td><select id="dd_elijaTipo" class="dd_estilo_combo" style="width:100px;">
											          	<option value="CURSO">CURSO</option>
											            <option value="CONGRESO">CONGRESO</option>
											            <option value="TALLER">TALLER</option>
											          </select>
											      </td>
       
											     <td><label>Nombre:</label></td><td><input id="dd_nombreCurso" class="dd_con_estilo_largo" style="width:200px; text-transform:uppercase" type="text" onblur="Mayusculas(this)" /></td>
											     <td><label>Término:</label></td><td><input id="dd_terminoCurso" class="dd_estilo_combo" type="date" medida="Y/M/D"/></td>
											     <td><label>Valor:</label></td><td><input id="dd_valorCurso" class="dd_estilo_cedula" style="text-transform:uppercase" onblur="Mayusculas(this)" type="text"/></td>
											     <td><input id="dd_archivoCurso" class="dd_estilo_combo" style="margin-left:10px;" type="text" medida="Y/M/D"></td>

												 <td><div class="custom-input-file"><input type="file" class="input-file" name="fileToUpload" id="fileToUpload"/></div></td>
												 <td><input id="dd_btnCancelar_archivo_curso" class="dd_clsCancelar" value="" type="button"></td>
												 <td><input class="dd_clsAgregarFila" value="" type="button"></td>
											</tr>

											<tr>
												<td>Elija:</td>
												 <td><select id="dd_elija" class="dd_estilo_combo" style="width:100px;">
											          	<option value="RECIBIDO">RECIBIDO</option>
											            <option value="IMPARTIDO">IMPARTIDO</option>
											         </select>
											      </td>

											     <td><label>Tipo:</label></td>
											     <td><select id="dd_elijaTipo" class="dd_estilo_combo" style="width:100px;">
											          	<option value="CURSO">CURSO</option>
											            <option value="CONGRESO">CONGRESO</option>
											            <option value="TALLER">TALLER</option>
											          </select>
											      </td>
       
											     <td><label>Nombre:</label></td><td><input id="dd_nombreCurso" class="dd_con_estilo_largo" style="width:200px; text-transform:uppercase" type="text" onblur="Mayusculas(this)" /></td>
											     <td><label>Término:</label></td><td><input id="dd_terminoCurso" class="dd_estilo_combo" type="date" medida="Y/M/D"/></td>
											     <td><label>Valor:</label></td><td><input id="dd_valorCurso" class="dd_estilo_cedula" style="text-transform:uppercase" onblur="Mayusculas(this)" type="text"/></td>
											     <td><input id="dd_archivoCurso" class="dd_estilo_combo" style="margin-left:10px;" type="text" medida="Y/M/D"></td>

												 <td><div class="custom-input-file"><input type="file" class="input-file" name="fileToUpload" id="fileToUpload"/></div></td>
												 <td><input id="dd_btnCancelar_archivo_curso" class="dd_clsCancelar" value="" type="button"></td>
												 <td><input class="dd_clsAgregarFila" value="" type="button"></td>
											</tr>

											<tr>
												<td>Elija:</td>
												 <td><select id="dd_elija" class="dd_estilo_combo" style="width:100px;">
											          	<option value="RECIBIDO">RECIBIDO</option>
											            <option value="IMPARTIDO">IMPARTIDO</option>
											         </select>
											      </td>

											     <td><label>Tipo:</label></td>
											     <td><select id="dd_elijaTipo" class="dd_estilo_combo" style="width:100px;">
											          	<option value="CURSO">CURSO</option>
											            <option value="CONGRESO">CONGRESO</option>
											            <option value="TALLER">TALLER</option>
											          </select>
											      </td>
       
											     <td><label>Nombre:</label></td><td><input id="dd_nombreCurso" class="dd_con_estilo_largo" style="width:200px; text-transform:uppercase" type="text" onblur="Mayusculas(this)" /></td>
											     <td><label>Término:</label></td><td><input id="dd_terminoCurso" class="dd_estilo_combo" type="date" medida="Y/M/D"/></td>
											     <td><label>Valor:</label></td><td><input id="dd_valorCurso" class="dd_estilo_cedula" style="text-transform:uppercase" onblur="Mayusculas(this)" type="text"/></td>
											     <td><input id="dd_archivoCurso" class="dd_estilo_combo" style="margin-left:10px;" type="text" medida="Y/M/D"></td>

												 <td><div class="custom-input-file"><input type="file" class="input-file" name="fileToUpload" id="fileToUpload"/></div></td>
												 <td><input id="dd_btnCancelar_archivo_curso" class="dd_clsCancelar" value="" type="button"></td>
												 <td><input class="dd_clsAgregarFila" value="" type="button"></td>
											</tr>

											
										</table>
									</div>
						     	</div>

						     	
						     </div>
						         <br>
						         
						        <label class="dd_label">Cursos de actualización:</label>
						        <br>
								<br>


							<div class="dd_btnEstudiosCursos"><input type="submit" class="estilo_button2" style="width:170px;"  type="button" value="Guardar" name="dd_guardar" id="dd_guardar" /></div>						

						    <div class="dd_divDecoracionCursos">

						       	<div class="dd_licenciatura_uniEgreso_fechaTitulacion_cedula">


							        <div id='jqxWidget'>
							            <div id="listbox"></div> 
							        </div>

						     	</div>
						     	
						     	<div id="dd_btnCursos_actualizacion"><input type="button" class="md-trigger" value="+" data-modal="btnCatalogoCursos" id="btnCatalogoCursos" /></div>
						     	
						     </div>
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
											<td><input id="dd_claveMateria" style="text-transform:uppercase" onblur="Mayusculas(this)" onkeypress="ValidaSoloNumeros()" class="dd_con_estilo_corto" type="text" name="dd_input_Tabla"/></td>
											<td><input id="dd_nombreMateria" style="text-transform:uppercase" onblur="Mayusculas(this)" class="dd_con_estilo_largo_tabla" type="text" name="dd_input_Tabla"/></td>
											<td><input type="button" value="-" title='Modificar' class="clsModificarFila" id="dd_modificarFila"/></td>	
											<td><input type="button" value="-" title='Seleccionar' class="clsEliminarFila" id="dd_eliminarFila"/></td>	
										</tr>
										<tr>
											<td><input id="dd_claveMateria" style="text-transform:uppercase" onblur="Mayusculas(this)" onkeypress="ValidaSoloNumeros()" class="dd_con_estilo_corto" type="text" name="dd_input_Tabla"/></td>
											<td><input id="dd_nombreMateria" style="text-transform:uppercase" onblur="Mayusculas(this)" class="dd_con_estilo_largo_tabla" type="text" name="dd_input_Tabla"/></td>
											<td><input type="button" value="-" title='Modificar' class="clsModificarFila" id="dd_modificarFila"/></td>	
											<td><input type="button" value="-" title='Seleccionar' class="clsEliminarFila" id="dd_eliminarFila"/></td>	
										</tr>
										<tr>
											<td><input id="dd_claveMateria" style="text-transform:uppercase" onblur="Mayusculas(this)" onkeypress="ValidaSoloNumeros()" class="dd_con_estilo_corto" type="text" name="dd_input_Tabla"/></td>
											<td><input id="dd_nombreMateria" style="text-transform:uppercase" onblur="Mayusculas(this)" class="dd_con_estilo_largo_tabla" type="text" name="dd_input_Tabla"/></td>
											<td><input type="button" value="-" title='Modificar' class="clsModificarFila" id="dd_modificarFila"/></td>	
											<td><input type="button" value="-" title='Seleccionar' class="clsEliminarFila" id="dd_eliminarFila"/></td>	
										</tr>
										<tr>
											<td><input id="dd_claveMateria" style="text-transform:uppercase" onblur="Mayusculas(this)" onkeypress="ValidaSoloNumeros()" class="dd_con_estilo_corto" type="text" name="dd_input_Tabla"/></td>
											<td><input id="dd_nombreMateria" style="text-transform:uppercase" onblur="Mayusculas(this)" class="dd_con_estilo_largo_tabla" type="text" name="dd_input_Tabla"/></td>
											<td><input type="button" value="-" title='Modificar' class="clsModificarFila" id="dd_modificarFila"/></td>	
											<td><input type="button" value="-" title='Seleccionar' class="clsEliminarFila" id="dd_eliminarFila"/></td>	
										</tr>
										<tr>
											<td><input id="dd_claveMateria" style="text-transform:uppercase" onblur="Mayusculas(this)" onkeypress="ValidaSoloNumeros()" class="dd_con_estilo_corto" type="text" name="dd_input_Tabla"/></td>
											<td><input id="dd_nombreMateria" style="text-transform:uppercase" onblur="Mayusculas(this)" class="dd_con_estilo_largo_tabla" type="text" name="dd_input_Tabla"/></td>
											<td><input type="button" value="-" title='Modificar' class="clsModificarFila" id="dd_modificarFila"/></td>	
											<td><input type="button" value="-" title='Seleccionar' class="clsEliminarFila" id="dd_eliminarFila"/></td>	
										</tr>
										<tr>
											<td><input id="dd_claveMateria" style="text-transform:uppercase" onblur="Mayusculas(this)" onkeypress="ValidaSoloNumeros()" class="dd_con_estilo_corto" type="text" name="dd_input_Tabla"/></td>
											<td><input id="dd_nombreMateria" style="text-transform:uppercase" onblur="Mayusculas(this)" class="dd_con_estilo_largo_tabla" type="text" name="dd_input_Tabla"/></td>
											<td><input type="button" value="-" title='Modificar' class="clsModificarFila" id="dd_modificarFila"/></td>	
											<td><input type="button" value="-" title='Seleccionar' class="clsEliminarFila" id="dd_eliminarFila"/></td>	
										</tr>
										<tr>
											<td><input id="dd_claveMateria" style="text-transform:uppercase" onblur="Mayusculas(this)" onkeypress="ValidaSoloNumeros()" class="dd_con_estilo_corto" type="text" name="dd_input_Tabla"/></td>
											<td><input id="dd_nombreMateria" style="text-transform:uppercase" onblur="Mayusculas(this)" class="dd_con_estilo_largo_tabla" type="text" name="dd_input_Tabla"/></td>
											<td><input type="button" value="-" title='Modificar' class="clsModificarFila" id="dd_modificarFila"/></td>	
											<td><input type="button" value="-" title='Seleccionar' class="clsEliminarFila" id="dd_eliminarFila"/></td>	
										</tr>

									</tbody>
								</table>

								
									<div id="dd_btnVerAnterior"><input style="font-size: 15px; height: 50px; width:170px;" type="button" class="md-trigger" value="Ver semestre anterior" data-modal="btnMateriasAnterior" id="btnMateriasAnterior" /></div>
								
							</div>



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
											<th style="width:100px;">SÁBADO</th>
											
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
											<td><img alt="Imagen" src="../imagenes/good.png" /></td>
										</tr>
										<tr>
											<td>8:00 - 9:00</td>
											
											<td><img alt="Imagen" src="../imagenes/good.png" /></td>	
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
											<td><img alt="Imagen" src="../imagenes/good.png" /></td>	
											<td><img alt="Imagen" src="../imagenes/good.png" /></td>
											<td><img alt="Imagen" src="../imagenes/good.png" /></td>
											<td><img alt="Imagen" src="../imagenes/good.png" /></td>
											<td><img alt="Imagen" src="../imagenes/good.png" /></td>
											<td><label></label></td>
											
						
										</tr>
										<tr>
											<td>18:00 - 19:00</td>
											<td><img alt="Imagen" src="../imagenes/good.png" /></td>	
											<td><label></label></td>
											<td><img alt="Imagen" src="../imagenes/good.png" /></td>
											<td><label></label></td>
											<td><img alt="Imagen" src="../imagenes/good.png" /></td>
											<td><label></label></td>
											
						
										</tr>
										<tr>
											<td>19:00 - 20:00</td>
											<td><img alt="Imagen" src="../imagenes/good.png" /></td>	
											<td><label></label></td>
											<td><img alt="Imagen" src="../imagenes/good.png" /></td>
											<td><label></label></td>
											<td><img alt="Imagen" src="../imagenes/good.png" /></td>
											<td><label></label></td>
											
						
										</tr>
										<tr>
											<td>20:00 - 21:00</td>
											<td><img alt="Imagen" src="../imagenes/good.png" /></td>	
											<td><label></label></td>
											<td><img alt="Imagen" src="../imagenes/good.png" /></td>
											<td><label></label></td>
											<td><img alt="Imagen" src="../imagenes/good.png" /></td>
											<td><label></label></td>
											
						
										</tr>
										<tr>
											<td>21:00 - 22:00</td>
											<td><img alt="Imagen" src="../imagenes/good.png" /></td>	
											<td><label></label></td>
											<td><img alt="Imagen" src="../imagenes/good.png" /></td>
											<td><label></label></td>
											<td><img alt="Imagen" src="../imagenes/good.png" /></td>
											<td><label></label></td>
											
						
										</tr>
																		
									
									</tbody>
								</table>
								<!--<div class="dd_btnEstudiosCursos"><input type="submit" class="estilo_button2" style="width:170px;"  type="button" value="Guardar" name="dd_guardar" id="dd_guardar" /></div>-->
							</div>
							<div id="dd_observaciones_materias">
								<label>Observaciones:</label>
								<textarea rows=3 cols="120" style="margin-left:145px; margin-top:-20px; width:500px; border-radius:5px; border-color:green; text-transform:uppercase; resize:none" id="dd_observaciones_materias" name="dd_observaciones_materias" onblur="Mayusculas(this)" placeholder="Observaciones"></textarea>
							</div>


								<div id="dd_btnGuardarDisp"><input type="submit" class="estilo_button2" style="width:170px"  type="button" value="Guardar" name="dd_guardar" id="dd_guardar" /></div>
								
						</div>

		                    
		                                    
		                			    
				</div>
			</div>
			
		</section>

	<footer>

		<script type="text/javascript" src="../js/jqxcore.js"></script>
		<script type="text/javascript" src="../js/jqxbuttons.js"></script>
		<script type="text/javascript" src="../js/jqxscrollbar.js"></script>
		<script type="text/javascript" src="../js/jqxlistbox.js"></script>
		<script type="text/javascript" src="../js/jqxcheckbox.js"></script>
			<!--<div id="pie_correo">email: emma.castillejos@uabc.edu.mx</div>
			<div id="pie_tel">Teléfono: 664 188 9221</div>-->

	</footer>

		<!--SCRIPT PARA VENTANA MODAL-->
		<script src="../js/classie.js"></script>
		<script src="../js/modalEffects.js"></script>

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
     
    <!------------------------------------ VALIDACIONES ---------------------------->

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
			function Mayusculas(input){
				this.value = this.value.toUpperCase();
			}
</script>

<!------------------------------------------------------------------------------------------>


</html>