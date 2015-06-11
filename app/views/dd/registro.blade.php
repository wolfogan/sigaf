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
<!-------------------------------- MODAL CATALOGO EMPRESAS -------------------------------->

	<div class="md-modal md-effect-11" id="btnCat_empresas_dd"> 
		<form id="formPeriodo" action="javascript:registrarempresas();" class="md-content" method="post">

			<h3>Agregar Empresa</h3>
			<div class="tblCatalogos">
				<table class="tblCatPlan">
				
					<tr>
						<td>Nombre:</td>
						<td><input class="dd_con_estilo_largo" style="text-transform:uppercase" onblur="Mayusculas(this)" name="dd_cat_nombreEmpresa" type="text" required/></td>
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

	<!-------------------------------- MODAL CATALOGO PUESTOS -------------------------------->

	<div class="md-modal md-effect-11" id="btnCat_puestos_dd"> 
		<form id="formPeriodo" action="javascript:registrarpuestos();" class="md-content" method="post">
			<h3>Agregar Puesto</h3>
			<div class="tblCatalogos">
				<table class="tblCatPlan">
				
					<tr>
						<td>Nombre:</td>
						<td><input class="dd_con_estilo_largo" style="text-transform:uppercase" onblur="Mayusculas(this)" name="dd_cat_nombrePuesto" type="text" required/></td>
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
<!-------------------------------- MODAL CATALOGO CARRERAS -------------------------------->

	<div class="md-modal md-effect-11" id="btnCat_carreras_dd"> 
		<form id="formPeriodo" action="javascript:Registrarcarreras();" class="md-content" method="post">
			<h3>Agregar Carrera</h3>
			<div class="tblCatalogos">
				<table class="tblCatPlan">
				
					<tr>
						<td>Nombre:</td>
						<td><input class="dd_con_estilo_largo" style="text-transform:uppercase" onblur="Mayusculas(this)" name="dd_cat_nombreCarrera" type="text" required/></td>
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

<!-------------------------------- MODAL CATALOGO UNIVERSIDADES -------------------------------->

	<div class="md-modal md-effect-11" id="btnCat_escuelas_dd"> 
		<form id="formPeriodo" action="javascript:registraruniversidad();" class="md-content" method="post">
			<h3>Agregar Escuela</h3>
			<div class="tblCatalogos">
				<table class="tblCatPlan">
				
					<tr>
						<td>Nombre:</td>
						<td><input class="dd_con_estilo" style="text-transform:uppercase" onblur="Mayusculas(this)" name="dd_cat_nombreEscuela" type="text" required/></td>
					</tr>
					<tr>
						<td>Siglas:</td>
						<td><input class="dd_con_estilo" style="text-transform:uppercase" onblur="Mayusculas(this)" name="dd_cat_siglas" type="text" required/></td>
					</tr>
					<tr>
						<td>Ciudad:</td>
						<td>
							<select class="dd_con_estilo" style="text-transform:uppercase" onblur="Mayusculas(this)" name="dd_cat_ciudad" type="text" required/>
								<option value="1"></option>
							</select>
						</td>
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

<!-------------------------------- MODAL CATALOGO CURSOS -------------------------------->

	<div class="md-modal md-effect-11" id="btnCatalogoCursos"> 
		<form id="formPeriodo" action="javascript:registrarcursos();" class="md-content" method="post">
			<h3>Agregar curso de actualización</h3>
			<div class="tblCatalogos">
				<table class="tblCatPlan">
					<tr>
						<td>Periodo:</td>
						<td>
							<select class="dd_con_estilo" name="dd_cat_periodo" type="text" required/>
								<option value="1"></option>
							</select>
						</td>
					</tr>
					<tr>
						<td>Nombre:</td>
						<td><input class="dd_con_estilo" style="text-transform:uppercase" onblur="Mayusculas(this)" name="dd_cat_nombre" type="text" required/></td>
					</tr>
					<tr>
						<td>Fecha:</td>
						<td><input class="dd_con_estilo" style="text-transform:uppercase" onblur="Mayusculas(this)" name="dd_cat_fecha" type="date" required/></td>
					</tr>
					<tr>
						<td>Créditos:</td>
						<td><input class="dd_con_estilo" name="dd_cat_creditos" type="text" onkeypress="ValidaSoloNumeros()" required/></td>
					</tr>
					<tr>
						<td>Horas:</td>
						<td><input class="dd_con_estilo" name="dd_cat_horas" type="text" onkeypress="ValidaSoloNumeros()"  required/></td>
					</tr>
					<tr>
						<td>Características curso:</td>
						<td>
							<select class="dd_con_estilo" style="text-transform:uppercase" onblur="Mayusculas(this)" name="dd_cat_curso" type="text" required/>
								<option value="1"></option>
							</select>
						</td>
					</tr>


			
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

			<!------------------- CONTENIDO DE LAS LABELS ---------------------------->
			<div class="content">

				<!------------------- CONTENIDO PRIMER TAB ---------------------------->
				<div class="content-1">
					
					<h2>Datos personales</h2>
						<!-- <form id="dd_datosPersonales" method="post" action="javascript:GuardarDatosPersonales();" enctype="multipart/form-data"> -->
					<form id="dd_datosPersonales" method="post" action="javascript:GuardarDatosPersonales();">
						
						<div class="dd_divDecoracion">
		
							<div class="foto_botones">
								<div id="dd_fotoDoc">
								@if (empty($rutaFoto))
									<img id="file-preview" width="100%" height="100%" />
								@else
									<img id="file-preview" src="{{'../'.$rutaFoto}}" width="100%" height="100%" />
								@endif
								</div>
								<input id="file-upload" type="file" accept="image/*" class="input-file" style="font-size:.7em; width:250px; margin-left:65px; margin-top:10px;" name="foto_seleccion" />
							</div>

							<div id="dd_aPaterno_aMaterno_nombres_sexo">
								<div id="dd_noEmpleado">No. empleado:<label id="dd_lbl_noEmpleado" class="dd_label"  style="margin-left:15px; font-size:1.2em;">{{Auth::user()->id}}</label></div>
								
								<div id="dd_fechaIngreso">Ingreso UABC:<input id="dd_ingresoUabc" name="dd_ingreso" type="date" class="dd_estilo_combo" style="margin-left:10px; width:248px;" medida="Y/M/D" placeholder="23/09/2005" value="{{Auth::user()->fec_ing}}"/></div>
								<div class="dd_datosPersonales">A. paterno:<input id="dd_aPaterno" name="dd_aPaterno" style="margin-left:32px; text-transform:uppercase" class="dd_con_estilo_largo" type="text" onkeypress="Mayusculas(this)" value="{{Auth::user()->last_name}}"/></div>
								<div class="dd_datosPersonales">A. materno:<input id="dd_aMaterno" name="dd_aMaterno" style="margin-left:27px; text-transform:uppercase" class="dd_con_estilo_largo" type="text" onkeypress="Mayusculas(this)"  value="{{Auth::user()->last_materno}}" /></div>
								<div class="dd_datosPersonales">Nombre(s):<input id="dd_nombres" name="dd_nombres" style="margin-left:32px; text-transform:uppercase" class="dd_con_estilo_largo" type="text" onkeypress="Mayusculas(this)"  value="{{Auth::user()->name}}" /></div>

								<div class="dd_datosPersonales" >
									Sexo:
									<select id="dd_sexo" name="dd_sexo" class="dd_estilo_combo" style="margin-left:75px; margin-bottom:0px; width:252px;">
										 <option value="F" @if (Auth::user()->sexo == "F") selected @endif >FEMENINO</option>
										 <option value="M" @if (Auth::user()->sexo == "M") selected @endif >MASCULINO</option>
									</select>
								</div>
							</div>
						</div>

						<h2>Dirección y teléfonos</h2>

						<div class="dd_colonia_calle_int_ext_cp">
							
							<div class="dd_datosPersonales">Calle:<input id="dd_calle" name="dd_calle" class="dd_con_estilo_largo" style="margin-left:35px; text-transform:uppercase" onblur="Mayusculas(this)" type="text" value="{{ Auth::user()->calle }}"/></div>
							<div id="dd_ext">No. ext.:<input id="dd_noExterior" name="dd_noExterior" class="dd_con_estilo_corto" style="margin-left:10px;"  type="text" onKeyPress="ValidaSoloNumeros()" value="{{ Auth::user()->no_ext }}" /></div>
							<div id="dd_int">No. int.:<input id="dd_noInterior" name="dd_noInterior" class="dd_con_estilo_corto" style="margin-left:15px;" type="text" onKeyPress="ValidaSoloNumeros()" value="{{ Auth::user()->no_int }} "/></div>
							<div class="dd_datosPersonales">Colonia:<input id="dd_colonia" name="dd_colonia" class="dd_con_estilo_largo" style="margin-left:15px; text-transform:uppercase" onblur="Mayusculas(this)" type="text" value="{{ Auth::user()->colonia }}" /></div>
							<div class="dd_datosPersonales">C.P.:<input id="dd_cp" name="dd_cp" class="dd_con_estilo_corto" style="margin-left:44px;"  type="text" onKeyPress="ValidaSoloNumeros()" value="{{ Auth::user()->cp }}" /></div>

									
							<div class="dd_datosPersonales" >País:
								<select id="dd_pais" name="dd_pais" class="dd_con_estilo_largo" style="margin-left:40px;">

									@foreach($paises as $pais)
										@if($pais->pais == $paisId)
											<option value="{{$pais->pais}}" selected='selected'>{{ $pais->descripcion }}</option>
										@else
											<option value="{{$pais->pais}}">{{ $pais->descripcion }}</option>
										@endif
									@endforeach
								</select>
							</div>

							<div class="dd_datosPersonales">Estado:
								<select id="dd_estado" name="dd_estado" class="dd_con_estilo_largo" style="margin-left:18px;">
									@foreach($estados as $estado)
										@if($estado->estado == $estadoId)
											<option value="{{$estado -> estado}}}" selected="selected">{{$estado -> descripcion}}</option>
										@else
											<option value="{{$estado -> estado}}}">{{$estado -> descripcion}}</option>
										@endif
									@endforeach
								</select>
							</div>
						</div>

						<div class="dd_divDecoracionTelefonos">
							<div class="dd_datosPersonales">Ciudad:
								<select id="dd_ciudad" name="dd_ciudad" class="dd_con_estilo_largo" style="margin-left:60px;">
									@foreach($ciudades as $ciudad)
										@if($ciudad->ciudad == Auth::user()->ciudad)
											<option value="{{$ciudad -> ciudad}}" selected="selected">{{$ciudad -> descripcion}}</option>
										@else
											<option value="{{$ciudad -> ciudad}}">{{$ciudad -> descripcion}}</option>
										@endif
									@endforeach
								</select>
							</div>
							<div class="dd_datosPersonales">Oficina:<input id="dd_oficina" name="dd_oficina" class="dd_con_estilo_largo" style="margin-left:62px; text-transform:uppercase" onblur="Mayusculas(this)" type="text" value="{{ Auth::user()->telofna }}" /></div>
							<div class="dd_datosPersonales">Particular:<input id="dd_particular" name="dd_particular" class="dd_con_estilo_largo" style="margin-left:38px; text-transform:uppercase" onblur="Mayusculas(this)" type="text" value="{{ Auth::user()->phone }}" /></div>
							<div class="dd_datosPersonales">Celular:<input id="dd_celular" name="dd_celular" class="dd_con_estilo_largo" style="margin-left:60px; text-transform:uppercase" onblur="Mayusculas(this)" type="text" value="{{ Auth::user()->telcel }}" /></div>
							<div class="dd_datosPersonales">Correo UABC:<input id="dd_correoUabc" name="dd_correoUabc" class="dd_con_estilo_largo" style="margin-left:12px; text-transform:uppercase" onblur="Mayusculas(this)" type="text" value="{{ Auth::user()->email }}" /></div>
							<div class="dd_datosPersonales">Correo:<input id="dd_correo" name= "dd_correo" class="dd_con_estilo_largo" style="margin-left:62px; text-transform:uppercase" onblur="Mayusculas(this)" type="text" value="{{ Auth::user()->email_alternat }}" /></div>
						</div>

						<h2 style="margin-top:400px;">Trabajo fuera de UABC</h2>
						
						<div id="dd_trabajoFuera_puesto">

							<div class="dd_datosPersonales">RFC:<label id="dd_lbl_rfc" name="dd_rfc" class="dd_label" style="margin-left:50px;">{{Auth::user()->rfc}}</label></div>
							<div class="dd_datosPersonales">Empresa:
								<select id="dd_empresa" name="dd_empresa" class="dd_con_estilo_largo" style="margin-left:10px; text-transform:uppercase" onblur="Mayusculas(this)" type="text"/>
									<option value="1"></option>
								</select>
								<input type="button" class="md-trigger" data-modal="btnCat_empresas_dd" value="+">
							</div>
							
							<div class="dd_datosPersonales">Puesto:
								<select id="dd_puestoExterno" name="dd_puestoExterno" style="margin-left:23px; width:252px;" class="dd_con_estilo_largo">
									@foreach($puestos as $puesto)
										<option value="{{$puesto->puesto}}">{{$puesto->descripcion}}</option>
									@endforeach
								</select>
								<input type="button" class="md-trigger" data-modal="btnCat_puestos_dd" value="+">
							</div>
						</div>

						<div id="dd_ingreso_antiguedad">


							<div class="dd_datosPersonales" style="margin-top:40px;">Fecha de ingreso:<input id="dd_ingresoExterno" name="dd_ingresoExterno" class="dd_con_estilo" style="margin-left:10px; width:215px" type="date"/></div>
							<div class="dd_datosPersonales">Antigüedad:<input id="dd_antiguedadExterno" name="dd_antiguedadExterno" class="dd_con_estilo" disabled="false" style="margin-left:60px; width:215px;" type="text"/></div>
						</div>


						<div class="dd_btnEstudiosCursos">
							<input type="submit" class="estilo_button2" style="width:170px;" value="Guardar" name="dd_guardar" id="dd_guardarDatosPersonales" />
						</div>

						<!--<button id="submit" type="submit">Submit Form</button>-->
					</form>

				</div>

				<!------------------- CONTENIDO SEGUNDO TAB ---------------------------->

				<div class="content-2">
						
					<h2>Grado de estudios</h2>

					<form action="javascript:GuardarEstudiosCursos();" method="post" id="dd_datosEstudios">
						<div class="dd_divDecoracionEstudios">

							<div class="dd_especialidad" style="width:550px">
								Licenciatura:
								<input type="button" class="md-trigger" data-modal="btnCat_carreras_dd" value="+ Carrera" style="width:100px; margin-left:85px; font-size:16px;">
								<input type="button" class="md-trigger" data-modal="btnCat_escuelas_dd" value="+ Escuela" style="width:100px; font-size:16px;">
							</div>
							
							<div class="dd_licenciatura_uniEgreso_fechaTitulacion_cedula">

								<div class="dd_licenciatura">
									<select id="" name="dd_carreraLic1" class="dd_carrerasEmp dd_con_estilo" style="text-transform:uppercase" type="text" onblur="Mayusculas(this)" required/>
									</select>
								</div>
								<div class="dd_uniEgreso">
									Escuela:
									<select id="" name="dd_escuelaLic1" class="dd_escuela dd_con_estilo" type="text" style="text-transform:uppercase" onblur="Mayusculas(this)" required/>
									</select>
								</div>

								<div class="dd_chk_grado">
									Obtuvo grado:
									<input id="dd_chk_grado" name="dd_obtuvoLic1" type="checkbox" />
								</div>

								<div class="dd_fechaTitulacion">
									Titulación:
									<input id="dd_fechaTitulacion" name="dd_fechaLic1" class="dd_estilo_combo" type="date" medida="Y/M/D" required/>
								</div>

								<div class="dd_cedula">
									Cédula:
									<input id="dd_cedula" name="dd_cedulaLic1" class="dd_estilo_cedula" style="text-transform:uppercase" type="text" onblur="Mayusculas(this)" required/>
								</div>
								
								<div class="dd_fechaTitulacion">
									<input id="dd_archivoTitulacion" name="dd_nomFileLic1" class="dd_estilo_combo" type="text" required/>
								</div>

								<div class="dd_btnAdd">
									<div class="custom-input-file">
										<input type="file" name="dd_fileLic1" class="input-file" id="dd_fileLic1" required/>
									</div>
								</div>
								<!-- <div class="dd_btnAdd"><input id="dd_btnCancelar_archivo" class="dd_clsCancelar" value="" type="button"></div> -->
								<div class="dd_btnAdd">
									<input class="dd_clsAgregarFila" value="" type="button" id="dd_agregar" />
								</div>
							
							</div>

							<div class="dd_licenciatura_uniEgreso_fechaTitulacion_cedula">

								<div class="dd_licenciatura">
									<select id="" name="dd_carreraLic2" style="text-transform:uppercase" class="dd_carrerasEmp dd_con_estilo" onblur="Mayusculas(this)" type="text" required/>
									</select>
								</div>
								<div class="dd_uniEgreso">Escuela:
									<select id="" name="dd_escuelaLic2" style="text-transform:uppercase" class="dd_escuela dd_con_estilo" onblur="Mayusculas(this)" type="text" required/>
									</select>
								</div>


								<div class="dd_chk_grado">
									Obtuvo grado:
									<input id="dd_chk_grado" name="dd_obtuvoLic2" type="checkbox" />
								</div>

								<div class="dd_fechaTitulacion">
									Titulación:
									<input id="dd_fechaTitulacion" name="dd_fechaLic2" class="dd_estilo_combo" type="date" medida="Y/M/D" required />
								</div>

								<div class="dd_cedula">
									Cédula:
									<input id="dd_cedula" name="dd_cedulaLic2" style="text-transform:uppercase" onblur="Mayusculas(this)" class="dd_estilo_cedula" type="text" required/>
								</div>
								
								<div class="dd_fechaTitulacion">
									<input id="dd_archivoTitulacion" name="dd_nomFileLic2" class="dd_estilo_combo" type="text" required/>
								</div>

								<div class="dd_btnAdd">
									<div class="custom-input-file">
										<input type="file" name="dd_fileLic2" class="input-file" id="file" required/>
									</div>
								</div>
								<!-- <div class="dd_btnAdd"><input id="dd_btnCancelar_archivo" class="dd_clsCancelar" value="" type="button"></div> -->
							</div>

							<div class="dd_especialidad">
								Especialidad:
								<input id="dd_chk_especialidad" class="dd_estilo_check" type="checkbox" /> Si
							</div>

							<div class="dd_licenciatura_uniEgreso_fechaTitulacion_cedula">

								<div class="dd_licenciatura">
									<select id="" name="dd_carreraEsp1" style="text-transform:uppercase" onblur="Mayusculas(this)" class="dd_carrerasEmp dd_con_estilo"  type="text" required/>
									</select>
								</div>

								<div class="dd_uniEgreso">
									Escuela:
									<select id="" name="dd_escuelaEsp1" style="text-transform:uppercase" onblur="Mayusculas(this)" class="dd_escuela dd_con_estilo" type="text" required/>
									</select>
								</div>

								<div class="dd_chk_grado">
									Obtuvo grado:
									<input id="dd_chk_grado" name="dd_obtuvoEsp1" type="checkbox"  />
								</div>

								<div class="dd_fechaTitulacion">
									Titulación:
									<input id="dd_fechaTitulacion" name="dd_fechaEsp1" class="dd_estilo_combo" type="date" medida="Y/M/D" required/>
								</div>

								<div class="dd_cedula">
									Cédula:
									<input id="dd_cedula" name="dd_cedulaEsp1" style="text-transform:uppercase" onblur="Mayusculas(this)" class="dd_estilo_cedula" type="text" required/>								</div>
								
								<div class="dd_fechaTitulacion">
									<input id="dd_archivoTitulacion" name="dd_nomFileEsp1" class="dd_estilo_combo" type="text" required/>
								</div>

								<div class="dd_btnAdd">
									<div class="custom-input-file">
										<input type="file" name="dd_fileEsp1" class="input-file" id="file" required/>
									</div>
								</div>
								
								<!-- <div class="dd_btnAdd"><input id="dd_btnCancelar_archivo" class="dd_clsCancelar" value="" type="button"></div> -->
								<div class="dd_btnAdd">
									<input class="dd_clsAgregarFila" type="button" id="dd_agregar" />
								</div>
							</div>
							

							<div class="dd_licenciatura_uniEgreso_fechaTitulacion_cedula">

								<div class="dd_licenciatura">
									<select id="" name="dd_carreraEsp2" style="text-transform:uppercase" onblur="Mayusculas(this)" class="dd_carrerasEmp dd_con_estilo"  type="text" required/>
									</select>
								</div>
								<div class="dd_uniEgreso">Escuela:
									<select id="" name="dd_escuelaEsp2" style="text-transform:uppercase" onblur="Mayusculas(this)" class="dd_escuela dd_con_estilo" type="text" required/>
										<option value="1"></option>
									</select>
								</div>

								<div class="dd_chk_grado">
									Obtuvo grado:
									<input id="dd_chk_grado" name="dd_obtuvoEsp2" type="checkbox" />
								</div>

								<div class="dd_fechaTitulacion">
									Titulación:
									<input id="dd_fechaTitulacion" name="dd_fechaEsp2" class="dd_estilo_combo" type="date" medida="Y/M/D" required/>
								</div>

								<div class="dd_cedula">
									Cédula:
									<input id="dd_cedula" name="dd_cedulaEsp2" style="text-transform:uppercase" onblur="Mayusculas(this)" class="dd_estilo_cedula" type="text" required/>
								</div>

								<div class="dd_fechaTitulacion">
									<input id="dd_archivoTitulacion" name="dd_nomFileEsp2" class="dd_estilo_combo" type="text" required/>
								</div>

								<div class="dd_btnAdd">
									<div class="custom-input-file">
										<input type="file" name="dd_fileEsp2" class="input-file" id="file" required/>
									</div>
								</div>
								<!-- <div class="dd_btnAdd"><input id="dd_btnCancelar_archivo" class="dd_clsCancelar" value="" type="button"></div> -->
							</div>



							<div class="dd_especialidad">
								Maestría:
								<input id="dd_chk_maestria" class="dd_estilo_check" style="margin-left:45px;" type="checkbox"/> Si
							</div>

							<div class="dd_licenciatura_uniEgreso_fechaTitulacion_cedula">

								<div class="dd_licenciatura">
									<select id="" name="dd_carreraMas1" style="text-transform:uppercase" onblur="Mayusculas(this)" class="dd_carrerasEmp dd_con_estilo"  type="text"  required/>
									</select>
								</div>
								<div class="dd_uniEgreso">Escuela:
									<select id="" name="dd_escuelaMas1" style="text-transform:uppercase" onblur="Mayusculas(this)" class="dd_escuela dd_con_estilo" type="text" required/>
										<option value="1"></option>
									</select>
								</div>

								<div class="dd_chk_grado">
									Obtuvo grado:
									<input id="dd_chk_grado" name="dd_obtuvoMas1" type="checkbox" />
								</div>

								<div class="dd_fechaTitulacion">
									Titulación:
									<input id="dd_fechaTitulacion" name="dd_fechaMas1" class="dd_estilo_combo" type="date" medida="Y/M/D" required/>
								</div>

								<div class="dd_cedula">
									Cédula:
									<input id="dd_cedula" name="dd_cedulaMas1" style="text-transform:uppercase" onblur="Mayusculas(this)" class="dd_estilo_cedula" type="text" required/>
								</div>
								
								<div class="dd_fechaTitulacion">
									<input id="dd_archivoTitulacion" name="dd_nomFileMas1" class="dd_estilo_combo" type="text" required/>
								</div>

								<div class="dd_btnAdd">
									<div class="custom-input-file">
										<input name="dd_fileMas1" type="file" class="input-file" id="file" required/>
									</div>
								</div>
								<!-- <div class="dd_btnAdd"><input id="dd_btnCancelar_archivo" class="dd_clsCancelar" value="" type="button"></div> -->
								<div class="dd_btnAdd">
									<input class="dd_clsAgregarFila" value="" type="button" id="dd_agregar">
								</div>

							</div>

							

							<div class="dd_licenciatura_uniEgreso_fechaTitulacion_cedula">

								<div class="dd_licenciatura">
									<select id="" name="dd_carreraMas2" style="text-transform:uppercase" onblur="Mayusculas(this)" class="dd_carrerasEmp dd_con_estilo"  type="text" required/>
									</select>
								</div>
								<div class="dd_uniEgreso">
									Escuela:
									<select id="" name="dd_escuelaMas2" style="text-transform:uppercase" onblur="Mayusculas(this)" class="dd_escuela dd_con_estilo" type="text" required/>
									</select>
								</div>

								<div class="dd_chk_grado">
									Obtuvo grado:
									<input id="dd_chk_grado" name="dd_obtuvoMas2" type="checkbox"  />
								</div>

								<div class="dd_fechaTitulacion">
									Titulación:
									<input id="dd_fechaTitulacion" name="dd_fechaMas2" class="dd_estilo_combo" type="date" medida="Y/M/D" required/>
								</div>

								<div class="dd_cedula">
									Cédula:
									<input id="dd_cedula" name="dd_cedulaMas2" style="text-transform:uppercase" onblur="Mayusculas(this)" class="dd_estilo_cedula" type="text" required/>
								</div>
								
								<div class="dd_fechaTitulacion">
									<input id="dd_archivoTitulacion" name="dd_nomFileMas2" class="dd_estilo_combo" type="text" required/>
								</div>

								<div class="dd_btnAdd">
									<div class="custom-input-file">
										<input name="dd_fileMas2" type="file" class="input-file" id="file"/>
									</div>
								</div>
								<!-- <div class="dd_btnAdd"><input id="dd_btnCancelar_archivo" class="dd_clsCancelar" value="" type="button"></div>							 -->
							</div>


							<div class="dd_especialidad">
								Doctorado:
								<input id="dd_chk_doctorado" class="dd_estilo_check" style="margin-left:35px;" type="checkbox" /> Si
							</div>

							<div class="dd_licenciatura_uniEgreso_fechaTitulacion_cedula">

								<div class="dd_licenciatura">
									<select id="" name="dd_carreraDoc1" style="text-transform:uppercase" onblur="Mayusculas(this)" class="dd_carrerasEmp dd_con_estilo"  type="text" required/>
									</select>
								</div>
								<div class="dd_uniEgreso">
									Escuela:
									<select id="" name="dd_escuelaDoc1" style="text-transform:uppercase" onblur="Mayusculas(this)" class="dd_escuela dd_con_estilo" type="text" required/>
									</select>
								</div>

								<div class="dd_chk_grado">
									Obtuvo grado:
									<input id="dd_chk_grado" name="dd_obtuvoDoc1" type="checkbox" />
								</div>

								<div class="dd_fechaTitulacion">
									Titulación:
									<input id="dd_fechaTitulacion" name="dd_fechaDoc1" class="dd_estilo_combo" type="date" medida="Y/M/D" required/>
								</div>

								<div class="dd_cedula">
									Cédula:
									<input id="dd_cedula" name="dd_cedulaDoc1" style="text-transform:uppercase" onblur="Mayusculas(this)" class="dd_estilo_cedula" type="text" required/>
								</div>
								
								<div class="dd_fechaTitulacion">
									<input id="dd_archivoTitulacion" name="dd_nomFileDoc1" class="dd_estilo_combo" type="text" required/>
								</div>

								<div class="dd_btnAdd">
									<div class="custom-input-file">
										<input name="dd_fileDoc1" type="file" class="input-file" id="file" required/>
									</div>
								</div>
								<!-- <div class="dd_btnAdd"><input id="dd_btnCancelar_archivo" class="dd_clsCancelar" value="" type="button"></div> -->
								<div class="dd_btnAdd">
									<input class="dd_clsAgregarFila" value="" type="button" id="dd_agregar">
								</div>

							</div>

							
							<div class="dd_licenciatura_uniEgreso_fechaTitulacion_cedula">
								<div class="dd_licenciatura">
									<select id="" name="dd_carreraDoc2" style="text-transform:uppercase" onblur="Mayusculas(this)" class="dd_carrerasEmp dd_con_estilo"  type="text" required/>
									</select>
								</div>
								<div class="dd_uniEgreso">
									Escuela:
									<select id="" name="dd_escuelaDoc2" style="text-transform:uppercase" onblur="Mayusculas(this)" class="dd_escuela dd_con_estilo" type="text" required/>
									</select>
								</div>

								<div class="dd_chk_grado">
									Obtuvo grado:
									<input id="dd_chk_grado" name="dd_obtuvoDoc2" type="checkbox" />
								</div>

								<div class="dd_fechaTitulacion">
									Titulación:
									<input id="dd_fechaTitulacion" name="dd_fechaDoc2" class="dd_estilo_combo" type="date" medida="Y/M/D" required/>
								</div>

								<div class="dd_cedula">
									Cédula:
									<input id="dd_cedula" name="dd_cedulaDoc2" style="text-transform:uppercase" onblur="Mayusculas(this)" class="dd_estilo_cedula" type="text" required/>
								</div>
								
								<div class="dd_fechaTitulacion">
									<input id="dd_archivoTitulacion" name="dd_nomFileDoc2" class="dd_estilo_combo" type="text" medida="Y/M/D" required/>
								</div>

								<div class="dd_btnAdd">
									<div class="custom-input-file">
										<input name="dd_fileDoc2" type="file" class="input-file" id="file" required/>
									</div>
								</div>
								<!-- <div class="dd_btnAdd"><input id="dd_btnCancelar_archivo" class="dd_clsCancelar" value="" type="button"></div>			 -->
							</div>
						</div>
								
						<h2>Cursos</h2>

						<label class="dd_label">Cursos recibidos y/o congresos asistidos:</label>
						<br>
						<br>

						<div class="dd_divDecoracionCursos">

								<div id="tbl_dd_cursos">
									<div id="tableContainer" class="tableContainer">
										<table style="width:1200px; margin-top:-20px;" border="0" cellpadding="0" cellspacing="0" width="100%" class="scrollTable tblCursos">
											<thead style="background:green;">
												<tr>
													<th colspan="14">Ingresar cursos recibidos o impartidos</th>
												</tr>
											</thead>		
	
											<tbody class="scrollContent" style="height:125px;">
											
											<tr class="sin-cursos">
												<td colspan="14" style="text-align:center; font-size:2em;">SIN CURSOS</td>
											</tr>
											
											<tr class="fila-base-cursos">
												<td>Elija:</td>
												 <td><select id="" class="dd_elijaTipo dd_estilo_combo" style="width:100px;">
														@foreach($tipoCursos as $tipoCurso)
															<option value="{{$tipoCurso->tipo_curso_emp}}">{{$tipoCurso->descripcion}}</option>
														@endforeach
													 </select>
												  </td>

												 <td><label>Tipo:</label></td>
												 <td><select id="" class="dd_elijaCaracteristica dd_estilo_combo" style="width:100px;">
														@foreach($caracteristicaCursos as $caracteristica)
															<option value="{{$caracteristica->caracteristica_cur}}">{{$caracteristica->descripcion}}</option>
														@endforeach
													  </select>
												 </td>

												 <td><label>Nombre:</label></td><td>
													<input id="" type="text" class="dd_elijaNombre dd_con_estilo_largo" style="width:200px; text-transform:uppercase" onblur="Mayusculas(this)" />
													<!-- <select id="dd_nombreCurso" class="dd_con_estilo_largo" style="width:200px; text-transform:uppercase" type="text" onblur="Mayusculas(this)" />
														<option value="1"></option>
													</select> -->
												 </td>
												 
												 <td><label>Término:</label></td>
												 <td>
													<input id="" class="dd_elijaFechaTermino dd_estilo_combo" type="date" medida="Y/M/D"/>
												 </td>
												 
												 <td><label>Valor:</label></td>
												 <td>
													<input id="" class="dd_elijaValor dd_estilo_cedula" style="text-transform:uppercase" onblur="Mayusculas(this)" type="text"/>
												 </td>
												 
												 <td>
													<input id="" class="dd_elijaNombreArchivo dd_estilo_combo" style="margin-left:10px;" type="text" medida="Y/M/D">
												 </td>

												 <td>
													<div class="custom-input-file">
														<input id="" type="file" class="dd_elijaArchivo input-file" name="fileToUpload"/>
													</div>
												 </td>
												 
												 <td>
													<input id="dd_btnCancelar_archivo_curso" class="clsEliminarFila" style="width:30px; height:30px;" value="-" type="button">
												 </td>
												 
												 <td>
													<input class="dd_clsAgregarFila" value="" type="button">
												 </td>
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
								
								<div id="dd_btnCursos_actualizacion"><input type="button" class="md-trigger" value="+ Cursos" style="width:100px; font-size:16px;" data-modal="btnCatalogoCursos" id="btnCatalogoCursos" /></div>    	
						</div>
					</form>

				</div>

				<!------------------- CONTENIDO TERCER TAB ---------------------------->
							   
				<div class="content-3">
					
					<h2>Materias a impartir</h2>

					<form action="javascript:RegistrarDisponibilidad();" method="post" id="dd_datosDisponibilidad">

						<div class="div_periodo_dd">Período:
							<select id="dd_periodo" style="margin-left:5px;" name="periodo_dd" class="dd_estilo_combo" type="text" />
								<option value="2014-1">2014-1</option>
								<option value="2014-2">2014-2</option>
								<option value="2015-1">2015-1</option>
							</select>
								
						</div>

						<div id="dd_impartirMaterias">
							<table class="dd_tabla_MatImpartir">
								
								<thead class="dd_encabezado">
									<tr>
										<th style="width:50px;">CLAVE</th>
										<th style="width:350px;">MATERIA</th>
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
										
										<td onclick="color_disp(this)"></td>		
										<td onclick="color_disp(this)"></td>
										<td onclick="color_disp(this)"></td>
										<td onclick="color_disp(this)"></td>
										<td onclick="color_disp(this)"></td>
										<td onclick="color_disp(this)"></td>
									</tr>
									<tr>
										<td>8:00 - 9:00</td>
										
										<td onclick="color_disp(this)"></td>		
										<td onclick="color_disp(this)"></td>
										<td onclick="color_disp(this)"></td>
										<td onclick="color_disp(this)"></td>
										<td onclick="color_disp(this)"></td>
										<td onclick="color_disp(this)"></td>
									</tr>
									<tr>
										<td>9:00 - 10:00</td>
										<td onclick="color_disp(this)"></td>		
										<td onclick="color_disp(this)"></td>
										<td onclick="color_disp(this)"></td>
										<td onclick="color_disp(this)"></td>
										<td onclick="color_disp(this)"></td>
										<td onclick="color_disp(this)"></td>
									</tr>
									<tr>
										<td>10:00 - 11:00</td>
										<td onclick="color_disp(this)"></td>		
										<td onclick="color_disp(this)"></td>
										<td onclick="color_disp(this)"></td>
										<td onclick="color_disp(this)"></td>
										<td onclick="color_disp(this)"></td>
										<td onclick="color_disp(this)"></td>
									</tr>
									<tr>
										<td>11:00 - 12:00</td>
										<td onclick="color_disp(this)"></td>		
										<td onclick="color_disp(this)"></td>
										<td onclick="color_disp(this)"></td>
										<td onclick="color_disp(this)"></td>
										<td onclick="color_disp(this)"></td>
										<td onclick="color_disp(this)"></td>
									</tr>
									<tr>
										<td>12:00 - 13:00</td>
										<td onclick="color_disp(this)"></td>		
										<td onclick="color_disp(this)"></td>
										<td onclick="color_disp(this)"></td>
										<td onclick="color_disp(this)"></td>
										<td onclick="color_disp(this)"></td>
										<td onclick="color_disp(this)"></td>
									</tr>
									<tr>
										<td>13:00 - 14:00</td>
										<td onclick="color_disp(this)"></td>		
										<td onclick="color_disp(this)"></td>
										<td onclick="color_disp(this)"></td>
										<td onclick="color_disp(this)"></td>
										<td onclick="color_disp(this)"></td>
										<td onclick="color_disp(this)"></td>
									</tr>
									<tr>
										<td>14:00 - 15:00</td>
										<td onclick="color_disp(this)"></td>		
										<td onclick="color_disp(this)"></td>
										<td onclick="color_disp(this)"></td>
										<td onclick="color_disp(this)"></td>
										<td onclick="color_disp(this)"></td>
										<td onclick="color_disp(this)"></td>
					
									</tr>
									<tr>
										<td>15:00 - 16:00</td>
										<td onclick="color_disp(this)"></td>		
										<td onclick="color_disp(this)"></td>
										<td onclick="color_disp(this)"></td>
										<td onclick="color_disp(this)"></td>
										<td onclick="color_disp(this)"></td>
										<td onclick="color_disp(this)"></td>
										
					
									</tr>
									<tr>
										<td>16:00 - 17:00</td>
										<td onclick="color_disp(this)"></td>		
										<td onclick="color_disp(this)"></td>
										<td onclick="color_disp(this)"></td>
										<td onclick="color_disp(this)"></td>
										<td onclick="color_disp(this)"></td>
										<td onclick="color_disp(this)"></td>
										
					
									</tr>
									<tr>
										<td>17:00 - 18:00</td>
										<td onclick="color_disp(this)"></td>		
										<td onclick="color_disp(this)"></td>
										<td onclick="color_disp(this)"></td>
										<td onclick="color_disp(this)"></td>
										<td onclick="color_disp(this)"></td>
										<td onclick="color_disp(this)"></td>
										
					
									</tr>
									<tr>
										<td>18:00 - 19:00</td>
										<td onclick="color_disp(this)"></td>		
										<td onclick="color_disp(this)"></td>
										<td onclick="color_disp(this)"></td>
										<td onclick="color_disp(this)"></td>
										<td onclick="color_disp(this)"></td>
										<td onclick="color_disp(this)"></td>
										
					
									</tr>
									<tr>
										<td>19:00 - 20:00</td>
										<td onclick="color_disp(this)"></td>		
										<td onclick="color_disp(this)"></td>
										<td onclick="color_disp(this)"></td>
										<td onclick="color_disp(this)"></td>
										<td onclick="color_disp(this)"></td>
										<td onclick="color_disp(this)"></td>
										
					
									</tr>
									<tr>
										<td>20:00 - 21:00</td>
										<td onclick="color_disp(this)"></td>		
										<td onclick="color_disp(this)"></td>
										<td onclick="color_disp(this)"></td>
										<td onclick="color_disp(this)"></td>
										<td onclick="color_disp(this)"></td>
										<td onclick="color_disp(this)"></td>
										
					
									</tr>
									<tr>
										<td>21:00 - 22:00</td>
										<td onclick="color_disp(this)"></td>		
										<td onclick="color_disp(this)"></td>
										<td onclick="color_disp(this)"></td>
										<td onclick="color_disp(this)"></td>
										<td onclick="color_disp(this)"></td>
										<td onclick="color_disp(this)"></td>			
									</tr>
																	
								
								</tbody>
							</table>
							<!--<div class="dd_btnEstudiosCursos"><input type="submit" class="estilo_button2" style="width:170px;"  type="button" value="Guardar" name="dd_guardar" id="dd_guardar" /></div>-->
						</div>

						<div id="dd_observaciones_materias">
							<label>Observaciones:</label>
							<textarea rows=0 cols="5" style="margin-left:145px; margin-top:-30px; width:500px; border-radius:5px; border-color:green; text-transform:uppercase; resize:none" id="dd_observaciones_materias" name="dd_observaciones_materias" onblur="Mayusculas(this)" placeholder="Observaciones"></textarea>
						</div>


						<div id="dd_btnGuardarDisp">
							<input type="submit" class="estilo_button2" style="width:170px; margin-top:15px;"  type="button" value="Guardar" name="dd_guardar" id="dd_guardar" />
						</div>	
					</form>
				
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

</body>

<!--- ---------------------------------------------------- -->

<script language="javascript">

	function GuardarDatosPersonales()
	{

		if(document.images.namedItem("file-preview").src == "")
		{
			alert("Debes introducir una imagen para continuar...");
			return;
		}
		
		var id = $("#dd_lbl_noEmpleado").html().trim();
		//var datos = "dd_id=" + id + "&" + $("#dd_datosPersonales").serialize() + "&r=" + encodeURIComponent(img);
		var datos = new FormData(document.forms.namedItem("dd_datosPersonales"));
		datos.append("dd_id",id);
		console.log(datos);
		//alert(document.images.namedItem("file-preview").src);

		$.ajax({
			url: "<?php echo URL::to('disponibilidaddocente/registrardatospersonales')?>",
			method: "POST",
			data: datos,
			processData: false,
			contentType: false
		})
		.done(function(data){
			alert(data);
		})
		.fail(function(error,textError,errorTrow){
			alert("Error: " + error.responseText);
		});
	}

	function GuardarEstudiosCursos()
	{
		// Validar Imagen
		if(document.images.namedItem("file-preview").src == "")
		{
			alert("Debes introducir una imagen para continuar...");
			return;
		}

		var id = $("#dd_lbl_noEmpleado").text().trim();
		var datos = new FormData(document.forms.namedItem("dd_datosEstudios"));
		datos.append("dd_id",id);

		$.ajax({
			url: "<?php echo URL::to('disponibilidaddocente/registrarestudioscursos')?>",
			method: "POST",
			data: datos,
			processData: false,
			contentType: false
		})
		.done(function(data){
			//debugger;
			alert(data);
		})
		.fail(function(error,textError,errorTrow){
			alert("Error: " + error.responseText);
		});

	}

</script>


<!------------------------------------------------------------>

<!-- <script src="js/mascara.js" type="text/javascript"></script> -->
	
	<!--mascara para los teléfonos-->
<script type="text/javascript">
	// jQuery(function($){
	// 	 $("#date").mask("99/99/9999");
	// 	$(".telefonos").mask('(999) 999-9999');
		
	// });
	$(function(){

		// Carga de catalogos de LICENCIATURAS
		$.ajax({
			url:"<?php echo URL::to('disponibilidaddocente/carrerasemp'); ?>",
			method: "POST",
			dataType:"json",
		})
		.done(function(carrerasemp){
			var options = "";
			for(var i in carrerasemp)
			{
				options +="<option value='" + carrerasemp[i].carrera + "'>"+carrerasemp[i].descripcion+"</ option>"; 
			}
			$(".dd_carrerasEmp").html(options);
		})
		.fail(function(error,texterror,errorthrow){
			alert("Error: " + error.responseText);
		});

		// Carga de catalogos de ESCUELAS
		$.ajax({
			url:"<?php echo URL::to('disponibilidaddocente/universidadesemp'); ?>",
			method: "POST",
			dataType:"json",
		})
		.done(function(carrerasemp){
			var options = "";
			for(var i in carrerasemp)
			{
				options +="<option value='" + carrerasemp[i].universidad + "'>"+carrerasemp[i].descripshort+"</ option>"; 
			}
			$(".dd_escuela").html(options);
		})
		.fail(function(error,texterror,errorthrow){
			alert("Error: " + error.responseText);
		});


		$(".dd_licenciatura_uniEgreso_fechaTitulacion_cedula").not(":first").find("input, select").attr("disabled", true);

		$("#dd_pais").on("change",function(){
			var pais = $(this).val();
			//alert(pais);
			$.ajax({
				url : "<?php echo URL::to('disponibilidaddocente/estados') ?>",
				method : "POST",
				data: {pais:pais}

			})
			.done(function(estados){
				//console.log(data);
				var options = "";
				for(x in estados)
				{
					options += "<option value='"+ estados[x].estado +"'>"+ estados[x].descripcion +"</option>"
				}

				$("#dd_estado").html(options);
			})
			.fail(function(error,texterror,errorthrow){
				alert("Error : ", error.responseText);
			});
		});

		$("#dd_estado").on("change",function(){
			var estado = $(this).val();
			//alert(pais);
			$.ajax({
				url : "<?php echo URL::to('disponibilidaddocente/ciudades') ?>",
				method : "POST",
				data: {estado:estado}

			})
			.done(function(ciudades){
				//console.log(data);
				var options = "";
				for(x in ciudades)
				{
					options += "<option value='"+ ciudades[x].ciudad +"'>"+ ciudades[x].descripcion +"</option>"
				}

				$("#dd_ciudad").html(options);
			})
			.fail(function(error,texterror,errorthrow){
				alert("Error : ", error.responseText);
			});
		});

		$(".dd_clsAgregarFila").on("click",function(){
			var divPapa = $(this).parents(".dd_licenciatura_uniEgreso_fechaTitulacion_cedula");
			var divNext = $(divPapa).next(".dd_licenciatura_uniEgreso_fechaTitulacion_cedula");
			$(divNext).find("input, select").attr("disabled",false);
		});
		// HABILITAR CONTENIDO DE ESTUDIOS

		$(".dd_estilo_check").on("change",function(){
			var $input = $(this);
			var divNext = $input.parent().next(".dd_licenciatura_uniEgreso_fechaTitulacion_cedula");
			var divNextNext = $input.parent().next(".dd_licenciatura_uniEgreso_fechaTitulacion_cedula").next(".dd_licenciatura_uniEgreso_fechaTitulacion_cedula");
			if($input.is(":checked"))
			{
				$(divNext).find("input, select").attr("disabled", false);
			}
			else
			{
				$(divNext).find("input, select").attr("disabled", true);
				$(divNextNext).find("input, select").attr("disabled",true);
			}
		});

		// Boton fila en cursos
		$(".sin-cursos").on("click",function(event){

			// Crear fila y agregar atributos para pasar por el formulario
			var filaBaseCurso = $(this).next();
			var cursoNuevo = $(filaBaseCurso).clone().removeClass("fila-base-cursos").appendTo($(this).parent());
			$(cursoNuevo).find(".dd_elijaTipo").attr("name","dd_curso_tipo[]");
			$(cursoNuevo).find(".dd_elijaCaracteristica").attr("name","dd_curso_caracteristica[]");
			$(cursoNuevo).find(".dd_elijaNombre").attr("name","dd_curso_nombre[]");
			$(cursoNuevo).find(".dd_elijaFechaTermino").attr("name","dd_curso_fecha[]");
			$(cursoNuevo).find(".dd_elijaValor").attr("name","dd_curso_valor[]");
			$(cursoNuevo).find(".dd_elijaNombreArchivo").attr("name","dd_curso_filename[]");
			$(cursoNuevo).find(".dd_elijaArchivo").attr("name","dd_curso_file[]");


			$(this).hide();


		});

		$(".scrollTable").on("click",".dd_clsAgregarFila",function(){

			var filaCurso = $(this).parents().get(1);
			// Validar clave de seriación
			// if($(filaCurso).find(".clave-seriacion-descripcion").val()=="" || $(filaCurso).find(".clave-seriacion-descripcion").val()=="NO EXISTE")
			// {
			// 	alert("Por favor, agregue una seriación válida");
			// 	return;
			// }
			// Duplicar fila base y añadir a tabla
			var tbodySeriacion = $(this).parents().get(2);
			var filaBaseCurso = $(tbodySeriacion).find("tr:eq(1)");
			var cursoNuevo = $(filaBaseCurso).clone().removeClass("fila-base-cursos").appendTo(tbodySeriacion);
			$(".sin-cursos").hide();
			//console.log(filaCurso);

			$(cursoNuevo).find(".tipo-seriacion").attr("name","seriacion_tipo[]");
			$(cursoNuevo).find(".clave-seriacion").attr("name","seriacion_clave[]");

			// Deshabilitar fila anterior
			if($("#guardar").val()!="Actualizar")
			{
				$(filaCurso).find("select,input").attr("disabled",true);
			}

		});

		// Eliminar fila de las materias seriadas sin afectar comportamiento en BD.
		$(".scrollTable").on("click",".clsEliminarFila",function(){
			var filaCurso = $(this).parents().get(1);
			var table = $(filaCurso).parents().get(1);
			// Remover fila
			$(filaCurso).remove();

			// Si se elimina la última fila, mostrar mensaje sin seriación
			var rowCount = $(table).find("tbody > tr").length;
			if(rowCount == 2)
				$(".sin-cursos").show();
			else
			{
				// Habilitar fila anterior
				$(table).find("tr:last-child").find("input:not('.clave-seriacion-descripcion'),select").removeAttr("disabled");
			}
		});

		$(".dd_tabla_MatImpartir td:nth-child(2)").find("input").attr("disabled", true);

		

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

<!------------------FUNCION PARA CAMBIAR COLOR EN LA TABLA DISPONIBILIDAD-------------------->


<script>

	function color_disp(x) {

	if(x.style.backgroundColor == "rgb(236, 162, 46)")
	{
		x.style.backgroundColor = "";
	}
	else
	{
		x.style.backgroundColor = "rgb(236, 162, 46)";
	}
}
</script>

<!--------------------------------FUNCION PARA AGREGAR FOTOGRAFIA-------------------------------------------------------------------->
<script>
	function readFile(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
 
			reader.onload = function (e) {
				
				// var filePreview = document.createElement('img');
				// filePreview.id = 'file-preview';
				var filePreview = $("#file-preview");
				//e.target.result contents the base64 data from the image uploaded
				//filePreview.src = e.target.result;
				filePreview.attr("src",e.target.result);
				//filePreview.style.width = "100%";
				//filePreview.style.height = "100%";
				console.log(e.target.result);
 
				// var previewZone = document.getElementById('dd_fotoDoc');
				// previewZone.innerHTML = "";
				// previewZone.appendChild(filePreview);
			}
 
			reader.readAsDataURL(input.files[0]);
		}
	}
	// file-preview-zone
 
	var fileUpload = document.getElementById('file-upload');
	fileUpload.onchange = function (e) {
		readFile(e.srcElement);
	}
</script>
<!---------------------------------------------------------------------------------------------------->


</html>