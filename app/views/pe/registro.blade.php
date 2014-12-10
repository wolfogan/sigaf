<!doctype html>
<html lang="es">
<head>
	<meta charset="utf-8"/>
	<!-- -------------------------------- Estilos CSS -------------------------------- -->
	<link rel="stylesheet" type="text/css" href="../css/normalize.css">
	<link rel="stylesheet" type="text/css" href="../css/estiloPrincipal.css">
	<link rel="stylesheet" type="text/css" href="../css/estilosnav.css">
	<link rel="stylesheet" type="text/css" href="../css/component.css"/>
	<!---------------------------------- Para combobox multiple new ---------------------->
	<link rel="stylesheet" href="../css/bootstrap-3.1.1.min.css" type="text/css">
	<link rel="stylesheet" href="../css/bootstrap-multiselect.css" type="text/css">
	<link rel="stylesheet" href="../css/prettify.css" type="text/css">
	<!---------------------------------------------------------------------------------------->

	<!-- ------------------------------ Scripts Generales -------------------------------->
	<script type="text/javascript" src="../js/jquery.js"></script>
	<!--AQUI VA HORA Y FECHA-->
	<script src="../js/tiempoactual.js"></script>
	<script>$(function(){startWatch(); return false;});</script>
	<!-- Script tiempo -->
	<!-- Creación de Ventanas Modales -->
	<script src="../js/ventanamodal.js"></script>
	<!---------------------------------- Para combo multiple scripts ---------------------------->
	<script type="text/javascript" src="../js/jquery-2.1.0.min.js"></script>
	<script type="text/javascript" src="../js/bootstrap-3.1.1.min.js"></script>
	<script type="text/javascript" src="../js/bootstrap-multiselect.js"></script>

	<!---------------------------------- DATATABLES --------------------------------------->
		
		<!-- CSS -->
		<link rel="stylesheet" type="text/css" href="../css/jquery.dataTables.css">
		<!-- JS -->
		<script src="../js/jquery.dataTables.js"></script>

		<!-------------------------------------------------------------------------------->


</head>
<body>
<!-------------------------------------- VENTANAS MODALES CATÁLOGOS -------------------------------------->
	
	<!-------------------------------------- MODAL ASOCIACION UA-PROGRAMA -------------------------------------->
	<div class="md-modal1 md-effect-11" id="add_seriacion"> 
		<form  id="formAsociar" action="javascript:asociarProgramas();" class="md-content" style="width:1000px; height:700px;" method="post">
			<h3 id="detalle">CLAVE - MATERIA</h3>

			<div class="pe_noPlan">No. Plan:<label>2009-1</label></div>
			<div id="pe_divs_modificar">

				<div class="carreraDiv" style="margin-left:20px;">
					<label>Carrera:</label>
					<select id="select_carreras" name="carreras[]" multiple="multiple" class="example41"></select>
				</div>

				<div class="carreraDiv">
					<label>Etapa:</label>
					<select class="dd_estilo_combo" style="color:#000; height:32px;" id="asociar_etapa" name="etapa">
						@foreach($etapas as $etapa)
							<option value="{{$etapa->etapa}}">{{$etapa->descripcion}}</option>
						@endforeach
					</select>
				</div>

				<div class="carreraDiv">
					<label>Tipo: </label>
					<select style="color:#000; width:143px; height:30px" class="con_estilo" name="caracter" id="asociar_caracter" size=1 type="text">
						@foreach ($tiposCaracter as $caracter)
							<option value="{{$caracter->caracter}}">{{$caracter->descripcion}}</option>
						@endforeach
					</select>
				</div>

				<div class="carreraDiv" style="width:150px;">
					<label>Sem:</label>
						<input style="color:#000" class="estilo_numeric" type="number" name="semestre" id="asociar_semestre" min="1" max="9" onkeypress="ValidaSoloNumeros()" >
				</div>

			</div>

			<div class="pe_catalogos_tbl">
				<div id="tableContainer" class="tableContainer">
					<table border="0" cellpadding="0" cellspacing="0" width="100%" class="scrollTable tblSeriaciones">
						<thead style="background:green">
							<tr>
								<th colspan="7">MATERIAS ASOCIADAS</th>
							</tr>
						</thead>
						<tbody class="scrollContent">
							<tr class="sin-seriacion">
								<td colspan="7" style="text-align:center; font-size:2em;">SIN SERIACION</td>
							</tr>
							<tr class="fila-base-seriacion">
								<td>Tipo:</td>
								<td>
									<select style="width: 150px; height: 30px; border-radius: 5px; border-color: #DBDBEA;" type="text" class="tipo-seriacion" />
										@foreach($seriaciones as $seriacion)
											<option value="{{$seriacion->reqseriacion}}">{{$seriacion->descripcion}}</option>
										@endforeach
									</select>
								</td>

								<td>Clave:</td>
								<td>
									<input style="width: 80px; height: 30px; border-radius: 5px; border-color: #DBDBEA;" type="text" class="clave-seriacion"/>
								</td>
								<td>
									<input style="width:350px; height: 30px; border-radius: 5px; border-color: #DBDBEA;" type="text" class="clave-seriacion-descripcion" disabled="true"  />
								</td>
								
								<td>
									<input type="button" class="clsEliminarFila" style="height:30px; width:30px;"value="-">
								</td>
								<td><input type="button" class="dd_clsAgregarFila"></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div id="pe_BtnseriacionAgregar">
					<input type="hidden" name="ua" id="asociar_ua"/>
					<input type="hidden" name="users_id" id="asociar_user"/>
					<input type="submit" style="height:35px;" class="estilo_button2" id="asociarPrograma" value="Agregar"/>
					<input style="height:35px;" type="button" value="Salir" class="md-close" />
				</div>
				
			</div>
			<div id="pe_programasAsociados">PROGRAMAS EDUCATIVOS ASOCIADOS A LA MATERIA</div>
			<div id="tableContainer" class="tableContainer">
				<table border="0" cellpadding="0" cellspacing="0" width="100%" class="scrollTable" id="tblDetalleAsociacion" />
					<thead class="fixedHeader">
						<tr>
							
							<th>PROGR. EDUCATIVO</th>
							<th>ETAPA</th>
							<th>TIPO</th>
							<th>SEMESTRE</th>
							<th>SERIACIÓN</th>
							<th>ELIMINAR</th>
							<th style="display:none;">CODIGO</th>
						</tr>
					</thead>
					<tbody class="scrollContent">
					</tbody>
				</table>
			</div>

		</form>
	</div>
	<!-------------------------------------- TERMINA MODAL AGREGAR SERIACION -------------------------------------->
	

	


	<!-------------------------------------- MODAL MODIFICAR MATERIAS INDEPENDIENTEMENTE DEL GRID -------------------------------------->
	<div class="md-modal1 md-effect-11" id="seriacion_independiente"> 
		<form  id="formAsociar" action="javascript:asociarProgramas();" class="md-content" style="width:800px; height:700px;" method="post">
			<h3 id="detalle">CLAVE - MATERIA</h3>
			
			<div id="pe_divs_modificar" style="margin-top:20px;">
				<div class="carreraDiv">
					Carrera:<label style="margin-left:10px;">INFORMÁTICA</label>		
				</div>

				<div class="carreraDiv">
					<label>Etapa:</label>
					<select class="dd_estilo_combo" style="color:#000; height:32px;" id="asociar_etapa" name="etapa">
						@foreach($etapas as $etapa)
							<option value="{{$etapa->etapa}}">{{$etapa->descripcion}}</option>
						@endforeach
					</select>
				</div>

				<div class="pe_noPlan">No. Plan:<label>0000-0</label></div>
			</div>

			<div class="div_pe_tableContainer" class="pe_tableContainer">
				<table border="0" style="width:700px;" cellpadding="0" cellspacing="0" width="100%" class="scrollTable">
					<thead style="background:green">
						<tr>
							<th colspan="7">MATERIAS ASOCIADAS</th>
						</tr>
					</thead>		

					<tbody class="scrollContent" style="height:155px;">

							<!--<tr class="sin-seriacion">-->
						<tr>
							<td colspan="7" style="text-align:center; font-size:2em;">SIN SERIACION</td>
						</tr>

							<!--<tr class="fila-base-seriacion">-->
						<tr>
							<td>Tipo:</td>
							<td>
								<select style="width: 100px; height: 30px; border-radius: 5px; border-color: #DBDBEA;" type="text" class="tipo-seriacion" />
								@foreach($seriaciones as $seriacion)
								<option value="{{$seriacion->reqseriacion}}">{{$seriacion->descripcion}}</option>
								@endforeach
								</select>
							</td>

							<td>Clave:</td>

							<td>
								<input style="width: 80px; height: 30px; border-radius: 5px; border-color: #DBDBEA;" type="text" class="clave-seriacion"/>
							</td>

							<td>
								<input style="width: 200px; height: 30px; border-radius: 5px; border-color: #DBDBEA;" type="text" class="clave-seriacion-descripcion" disabled="true"  />
							</td>
										
							<td>
								<input type="button" class="clsEliminarFila" style="height:30px; width:30px;"value="-">
							</td>

							<td><input type="button" class="dd_clsAgregarFila"></td>
						</tr>
								
					</tbody>
				</table>
			</div>

			


				<div id="pe_BtnseriacionAgregar">
					<input type="hidden" name="ua" id="asociar_ua"/>
					<input type="hidden" name="users_id" id="asociar_user"/>
					<input type="submit" class="estilo_button2" id="asociarPrograma" value="Agregar"/>
					<input type="button" value="Salir" class="md-close" />
				</div>

				
			
		</form>
	</div>
	<!-------------------------------------- TERMINA MODAL MODIFICAR MATERIAS INDEPENDIENTEMENTE DEL GRID -------------------------------------->







	

	<!-------------------------------------- MODAL PLAN DE ESTUDIO -------------------------------------->
	<div class="md-modal md-effect-11" id="plan"> 
		<form id="formUA" action="javascript:registrarPlanEstudios(document.forms.formUA);" name="formUA" class="md-content" method="post">
			<h3>Agregar Plan</h3>
			<div class="tblCatalogos">
				<table class="tblCatPlan">
					<tr>
						<th></th>
						<th></th>
					</tr>
					<tr>		
						<td>No. Plan:</td>
						<td><input title="Por favor, introduce un año." style="width: 120px; height: 30px; border-radius: 5px; border-color: #DBDBEA;" maxlength="4" name="planestudio_anio" type="text" id="txtCatPlan" required/>&nbsp;-&nbsp;<input style="width: 60px; height: 30px; border-radius: 5px; border-color: #DBDBEA;"  maxlength="1" name="planestudio_semestre" type="text" id="txtCatPlan2" required/></td>
					</tr>
					<tr>
						<td>Descripción:</td>
						<td><input title="Por favor, introduce una descripción." style="width: 200px; height: 30px; border-radius: 5px; border-color: #DBDBEA;" type="text" id="txtCatDescripcion" name="planestudio_descripcion" required/></td>
					</tr>
					<tr>
						<td>Nivel:</td>
						<td>
							<select style= "width:200px; height:30px;" name="planestudio_nivel" id="planestudio_nivel">
								@foreach ($niveles as $nivel)
									<option value="{{$nivel->nivel}}">{{$nivel->descripcion}}</option>
								@endforeach
							</select>
						</td>
					</tr>
					<tr>
						<td>Carreras:</td>
						<td>
							<select  name="example" multiple="multiple" class="plancarreras">
								@foreach ($programasEducativos as $carrera)
									<option value="{{$carrera->programaedu}}" >{{$carrera->descripcion}}</option>
								@endforeach
							</select>
							<!-- Campo oculto para id´s de carreras -->

							<input type="hidden" name="alta_plan_carreras" id="alta_plan_carreras"/>
						</td>
					</tr>
					<tr>
						<td>Créditos Prácticas:</td>
						<td><input title="Por favor,introduce los creditos" min="1" style="width: 120px; height: 30px; border-radius: 5px; border-color: #DBDBEA;" type="number" id="txtCatCredPract" name="planestudio_credpracticas" required/></td>
					</tr>
					<tr>
						<td>Fecha Inicio:</td>
						<td><input title="Por favor, introduce una fecha valida" style="width: 200px; height: 30px; border-radius: 5px; border-color: #DBDBEA;" type="date" id="txtCatFechaIni" name='planestudio_feciniciovig' required/></td>
					</tr>
					<tr>
						<td>Fecha Final:</td>
						<td><input title="Por favor, introduce una fecha valida"  style="width: 200px; height: 30px; border-radius: 5px; border-color: #DBDBEA;" type="date" id="txtCatFechaFin" name="planestudio_fecfinvig" required/></td>
					</tr>
				</table>
			</div>
			<div class="CatBotones">
				<input type="hidden" name="planestudio_userid" />
				<input type="submit" class="estilo_button2" value="Guardar"/>
				<input type="button" value="Salir" class="md-close" />
			</div>
		</form>
	</div>
	<!-------------------------------------- MODAL PLAN DE ESTUDIO -------------------------------------->


	<!-------------------------------------- MODAL TIPO SERIACION -------------------------------------->
	<div class="md-modal md-effect-11" id="seriacion"> 
		<form  action="<?=URL::to('planestudio/registrarseriacion'); ?>" class="md-content" method="post">
			<h3>Agregar seriación</h3>
			<div class="tblCatalogos">
				<table class="tblCatPlan">
					

					<tr>
						<th></th>
						<th></th>
					</tr>
					<tr>
						<td>Nombre:</td>
						<td><input style="width: 200px; height: 30px; border-radius: 5px; border-color: #DBDBEA;"  type="text" name="seriacion_descripcion" id="txtCatDescripcionSeriacion" size=1 /></td>
					</tr>
				</table>
			</div>
			<div class="CatBotones">
				<input type="submit" class="estilo_button2" value="Guardar"/>
				<input type="button" value="Salir" class="md-close" />
			</div>
		</form>
	</div>
	<!-------------------------------------- MODAL TIPO SERIACION -------------------------------------->

	<!-------------------------------------- MODAL TIPO CARACTER -------------------------------------->
	<div class="md-modal md-effect-11" id="tipo"> 
		<form  action="<?=URL::to('planestudio/registrarcaracter'); ?>" class="md-content" method="post">
			<h3>Agregar Tipo</h3>
			<div class="tblCatalogos">
				<table class="tblCatPlan">
					<tr>
						<th></th>
						<th></th>
					</tr>
					<tr>
						<td>Nombre:</td>
						<td><input style="width: 200px; height: 30px; border-radius: 5px; border-color: #DBDBEA;" type="text" name="caracter_descripcion" id="txtCatDescripcionTipo" size=1 /></td>
					</tr>
				</table>
			</div>
			<div class="CatBotones">
				<input type="submit" class="estilo_button2" value="Guardar"/>
				<input type="button" value="Salir" class="md-close" />
			</div>
		</form>
	</div>
	<!-------------------------------------- MODAL TIPO CARACTER -------------------------------------->

	<!-------------------------------------- MODAL COORDINACIÓN -------------------------------------->
	<div class="md-modal md-effect-11" id="coordina"> 
		<form  action="<?=URL::to('planestudio/registrarcoordinacion'); ?>" class="md-content" method="post">
			<h3>Agregar Coordinación</h3>
			<div class="lblCatalogosDependencias"></div>
			<div class="tblCatalogos">
				<table class="tblCatPlan">
					<tr>
						<th></th>
						<th></th>
					</tr>
					<tr>
						<td>Nombre:</td>
						<td><input style="width: 200px; height: 30px; border-radius: 5px; border-color: #DBDBEA;" type="text" name="coordinacion_descripcion" id="txtCatDescripcionCoordinacion"/></td>
					</tr>
					<tr>
						<td>Programa Educativo:</td> 
						<td>
							<select style="width: 200px;" name="txtCatDescripcionCoordinacion" type="text" id="txtCatDescripcionCoordinacion"/>
								<option value="1">LIC. EN INFORMATICA</option>
							</select>
						</td>
					</tr>
				</table>
			</div>
			<div class="CatBotones">
				<input type="submit" class="estilo_button2" value="Guardar"/>
				<input type="button" value="Salir" class="md-close" />
			</div>
		</form>
	</div>
	<div class="md-overlay"></div>
	<!-------------------------------------- MODAL COORDINACIÓN -------------------------------------->

	<!------------------------------------ VENTANAS MODALES CATÁLOGOS ------------------------------------>
	<header>
		<figure id="logo"><img src="../imagenes/logo.png" alt=""></figure>
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
				Plan de estudios: Registro
		</div>
		<div id="loginmanual">
			<div id="login" class="texto_body">
				<img src="../imagenes/login.png" alt="">&nbsp;<a href="<?=URL::to('login/logout');?>"style="text-decoration:none; color:#004000;">Logout</a>
			</div>
			<div id="manual" class="texto_body">
				<img src="../imagenes/manual.png" alt=""><a href="<?=URL::to('ayuda/ayudape');?>"style="text-decoration:none; color:#004000;">&nbsp;Manual</a>
			</div>
		</div>
	</div>
	<section>



		<!---------------------------- FORMULARIO PRINCIPAL DE UNIDAD DE APRENDIZAJE ---------------------------->
		<form id="formularioPlanEstudio" method="POST" action="javascript:registrarUnidadAprendizaje();">
			<!-- INICIA PRIMER SECCIÓN -->
			<div id="primerBloque">
				<!------------------------------------ NO. PLAN -------------------------------------->
				<div id="noPlanDiv">
					<label>No.Plan:</label>
					<select style="width:141px;" class="con_estilo" type="text" name="noPlan" id="noPlan" required>
						@foreach ($codigosPE as $codigo)
							<option value="{{$codigo['codigo']}}">{{$codigo['formato']}}</option>
						@endforeach
					</select>
					<!-- LLAMADA MODAL NRO. PLAN -->
					<input class="md-trigger" data-modal="plan" type="button" value="+"></a>
					<!-- LLAMADA MODAL NRO. PLAN -->
				</div>
				
				<!------------------------------------ UNIDAD ------------------------------------>
				<div id="unidadDiv">
					<label>Unidad: </label>
					<label style="color:#ECA22E">{{Auth::user()->unidad}}</label>
					<!-- LLAMADA MODAL CAMPUS -->
					<!--<input class="md-trigger" data-modal="campus" type="button" value="+">-->
					<!-- LLAMADA MODAL CAMPUS -->
				</div>
				<!------------------------------------ UNIDAD ACADEMICA ------------------------------------>
				<div id="unidadAcademicaDiv">
					<label>U.Acad:</label>
					<label style="color:#ECA22E">{{Auth::user()->ua}}</label>
					<!-- LLAMADA MODAL UNIDAD ACADEMICA -->
					<!--<input class="md-trigger" data-modal="unidad" type="button" value="+">-->
					<!-- LLAMADA MODAL UNIDAD ACADEMICA -->
				</div>
				<!------------------------------------ NIVEL ------------------------------------>
				<div id="nivelDiv">
					<label>Nivel: </label>
					<label id="plan_nivel" style="color:#ECA22E; padding-left:5px;"></label>
				</div>
				<!------------------------------------------------------------------------------>
			</div>
			<!-- TERMINA PRIMER SECCIÓN -->
			<!------------------------------------ MARCO SEGUNDA SECCIÓN ------------------------------------>
			<fieldset id="unidadaprendizaje">
				<!-- INICIA SEGUNDA SECCIÓN -->
				<div id="segundoBloque">
					<!------------------------------------ CLAVE UA ------------------------------------>
					<div id="claveDiv">
						 &nbsp;<label>Clave: </label>
						<input class="estilo_text" style="width:143px; margin-left:10px;" onKeyPress="ValidaSoloNumeros()" type="text" name="clave1F" id="clave1F" autocomplete="off" title="Por favor, inserte el número de clave de la materia" required/>
						<input type="button" value="-" title='Eliminar' class="clsEliminarFila" id="eliminar"/>
						<br />
						<input type="checkbox" id="generarClave" name="generarClave" value="Generar">Generar clave
					</div>
					<!---------------------------------- DESCRIPCIÓN UA ---------------------------------->
					<div id="materiaDiv">
						<label>Materia: </label>
						<input style="width: 375px; height: 25px; border-radius: 5px; border-color: #DBDBEA; text-transform:uppercase" type="text" name="materia" id="materia" size="1" title="Es necesario una descripción de la unidad de aprendizaje" required/>
					</div>


					<!-- TERMINAR TERCER SECCIÓN -->
				<!------------------------------------ HORAS ------------------------------------>
				<!-- INICIA CUARTA SECCIÓN -->
				<div id="cuartoBloque">
					<div id="hcDiv">
						<label>HC: </label>
						<input class="estilo_numeric" onKeyPress="ValidaSoloNumeros()" type="number" name="hc" id="hc" min="1" max="20" title="Es necesario tener horas clase en la unidad de aprendizaje">
					</div>
					<div id="hlDiv">
						<label>HL: </label>
						<input class="estilo_numeric" onKeyPress="ValidaSoloNumeros()" type="number" name="hl" id="hl" min="0" max="20" >
					</div>
					<div id="htDiv">
						<label>HT: </label>
						<input class="estilo_numeric" onKeyPress="ValidaSoloNumeros()" type="number" name="ht" id="ht" min="0" max="20" >
					</div>
					<br />
					<br />
					<div id="heDiv">
						<label>HE: </label>
						<input class="estilo_numeric" onKeyPress="ValidaSoloNumeros()" type="number" name="he" id="he" min="0" max="20" >
					</div>
					<div id="hpcDiv">
						<label>HPC: </label>
						<input class="estilo_numeric" onKeyPress="ValidaSoloNumeros()" type="number" name="hpc" id="hpc" min="0" max="20" >
					</div>
					<div id="hclDiv">
						<label>HCL: </label>
						<input class="estilo_numeric" onKeyPress="ValidaSoloNumeros()" type="number" name="hcl" id="hcl" min="0" max="20" >
					</div>
					<br />
					<br />
					<!------------------------------------ CREDITOS ------------------------------------>
					<div id="creditosDiv">
						<label>CDTOS: </label><input class="estilo_numeric" onKeyPress="ValidaSoloNumeros()" type="number" name="creditosF" id="creditosF" min="1" >	
					</div>
					<div id="pe_btnSeriacionMod">
						<input type="button" class="md-trigger" data-modal="add_seriacion" type="button" value="Actualizar seriación" name="asociar" id="asignacion"/>
					</div>

					
				</div>
				<!-- TERMINA SEGUNDA SECCIÓN -->
				
				<!-- INICIA TERCER SECCIÓN -->
				<div id="tercerBloque">

					<!---------------------------------- COORDINACION ---------------------------------->
					<div id="coordDiv">
						<label>Coord: </label><input autocomplete="off" style="width:143px; text-transform:uppercase; margin-left:10px;" class="coordina" type="text" name="coord" id="coord" size="1"  list="datalist_coord" title="Es necesarios especificar una coordinación." required/>
						<datalist id="datalist_coord" name="c">
							@foreach ($coordinaciones as $coordinacion)
								<option value="{{$coordinacion->coordinaciona}}" label="{{$coordinacion->descripcion}}" >
							@endforeach
						</datalist>
						<!-- LLAMADA MODAL COORDINACIÓN-->
						<input class="md-trigger" data-modal="coordina" type="button" value="+">
						<!-- LLAMADA MODAL COORDINACIÓN-->
					</div>
					<!---------------------------------------------------------------------------------->
				</div>
				<!-- TERMINA TERCERA SECCIÓN -->

				<!------------------------------------ OBSERVACIONES ------------------------------------>
					<div id="observacionesDiv">
						<label></label><br>
						<textarea rows=3 cols="46" style=" border-radius:5px; border-color:#DBDBEA; text-transform:uppercase; resize:none" id="observaciones" name="observaciones" placeholder="Observaciones"></textarea>
					</div>
					<!---------------------------------- BOTON GUARDAR - ACTUALIZAR UA ---------------------------------->
					<div id="botones">
						<input type="button" style="width:110px"class="estilo_button2" type="button" value="Limpiar" name="limpiar" id="limpiar" />
						<input type="submit" style="width:110px"class="estilo_button2" type="button" value="Guardar" name="guardar" id="guardar" />
						<!--<input type="button" style="width:110px; height:50px; font-size=21px; margin-left:10px; margin-right:-5px;" class="md-trigger" data-modal="add_seriacion" type="button" value="Asociar" name="asociar" id="asignacion"/>-->

						<!--------------------------------A Q U I PRUEBA -------------------------------->

						<input class="md-trigger" data-modal="seriacion_independiente" type="button" value="M"></a>

						<!------------------------------------------------------------------------>

					</div>
					<!---------------------------------- BOTON GUARDAR UA ---------------------------------->


					


			</fieldset>
			<!------------------------------------ MARCO SEGUNDA SECCIÓN ------------------------------------>
		</form>
		<!---------------------------- FORMULARIO PRINCIPAL DE UNIDAD DE APRENDIZAJE ---------------------------->

		<!------------------------ GRID PARA MOSTRAR UNIDADES DE APRENDIZAJE POR PLAN ------------------------>
		<div id="GridPlanEstudio">
			<label style="font-size:1.2em;">No. Plan: </label><label style="font-size:1.2em; color:orange;" id="grid_plan">0000</label>
			<figure id="ajaxLoad">
				<img src="../imagenes/ajax_loader.gif" alt="Cargando...." />
				<img src="../imagenes/cargando.gif" alt="Cargando2...." style="margin-top:6%; width:70px; height:12px;"/>
			</figure>
			<div id="planTerminado">
				<input style="width:20px; height:20px;" type="checkbox" name="planTerminado" value="Generar"><label style="font-size:18px;">Plan de estudios capturado</label>
			</div>
			<br />
			<!-- INICIA TABLA DATATABLES PARA LAS UA -->
			<table cellpadding="0" cellspacing="0" border="0" class="display"  id="tblUA">
				<thead>
					<tr>
						<th>CLAVE</th>
						<th>MATERIA</th>
						<th>CARRERAS</th>
						<th>ETAPA</th>
						<th>TIPO</th>
						<TH>SERIACION</TH>
						<th>COORDINACIÓN</th>
						<th>HC</th>
						<th>HL</th>
						<th>HT</th>
						<th>CRÉDITOS</th>
						<th>MODIFICAR</th>
						<th>ELIMINAR</th>
					</tr>
				</thead>
				<tfoot>
					<tr>
						<th>CLAVE</th>
						<th>MATERIA</th>
						<th>CARRERAS</th>
						<th>ETAPA</th>
						<th>TIPO</th>
						<th>SERIACION</th>
						<th>COORDINACIÓN</th>
						<th>HC</th>
						<th>HL</th>
						<th>HT</th>
						<th>CRÉDITOS</th>
						<th>MODIFICAR</th>
						<th>ELIMINAR</th>
					</tr>
				</tfoot>
				<tbody></tbody>
			</table>
			<!-- TERMINA TABLA DATATABLES PARA LAS UA -->
		</div>
		<!------------------------ GRID PARA MOSTRAR UNIDADES DE APRENDIZAJE POR PLAN ------------------------>
	</section>
	<footer>
			<!--<div id="pie_correo">email: emma.castillejos@uabc.edu.mx</div>
			<div id="pie_tel">Teléfono: 664 188 9221</div>-->

	</footer>
	<!-- classie.js by @desandro: https://github.com/desandro/classie -->
	<script src="../js/classie.js"></script>
	<script src="../js/modalEffects.js"></script>
	<script type="text/javascript">

	function registrarPlanEstudios(formPlan)
	{
		console.log(formPlan);
		if(formPlan.alta_plan_carreras.value === "")
		{
			alert("Seleccione un programa educativo para continuar.");
			return;
		}
		//alert(USER_ID);
		formPlan.planestudio_userid.value = USER_ID;
		//alert(formPlan.planestudio_userid.value);
		var datosPlan = $(formPlan).serialize();
		$.post("<?=URL::to('planestudio/registrarplan'); ?>",datosPlan,function(mensaje){
			alert(mensaje);
			var newPlan = {
				plan:formPlan.planestudio_anio.value + formPlan.planestudio_semestre.value,
				formato:formPlan.planestudio_anio.value + "-" + formPlan.planestudio_semestre.value
			};
			
			$("#noPlan").prepend("<option value='"+newPlan.plan+"''>"+newPlan.formato+"</option>");
			$(".md-close").click();
			$("#noPlan").val(newPlan.plan);
			$("#noPlan").change();
		})
		.fail(function(errorText,textError,errorThrow){
			alert(errorText.responseText);
			/*console.log(errorText);
			console.log(textError);
			console.log(errorThrow);*/
		});
	}

	// FUNCION registrarUnidadAprendizaje
	/**
	 * Función principal que permite el registro de la Unidad de Aprendizaje en un Plan de Estudio
	 * @return {null} Si las validaciones fallan no permite la ejecución de la función
	 */
	function registrarUnidadAprendizaje()
	{

		// Crear instancia Datatables para manipulación de renglones durante la ejecución
		var t = $("#tblUA").DataTable();
		var opcion = $("#guardar").val();
		// Validar si no eligieron carreras.
		var nCarreras = $("#select_carreras").val();
		/*if(nCarreras==null)
		{
			alert("No has seleccionado ninguna carrera");
			return;
		}¨*/
		/* Validar seriacion
		if($("#serie").val()!=1 && $("#clave2F").val().length<1)
		{
			alert("Debes escribir una materia seriada");
			return;
		}*/

		// Mostrar AjaxLoader
		$("#ajaxLoad").css("display","block");
		
		// REGISTRAR UNIDAD DE APRENDIZAJE
		if(opcion == "Guardar")
		{
			var dataUA = $("#formularioPlanEstudio").serialize() + "&" + "users_id=" + USER_ID;
			//$(".tblCatPlanAgregarSeriacion input,.tblCatPlanAgregarSeriacion select").removeAttr("disabled");
			//var dataUA = $("#formularioPlanEstudio").serialize() +"&"+ $("#formSeriacion").serialize() + "&" + "users_id=" + USER_ID;
			//console.log(dataUA);
			//alert(dataUA);
			$.post("<?php echo URL::to('planestudio/registrarua'); ?>",dataUA,function(mensaje){
				var noPlan=$("#noPlan").val();
				var clave1F=$("#clave1F").val();
				var materia=$("#materia").val();
			
				alert(mensaje);
			
				//reset_campos();
				// Mostrar la ventan modal para el detalle
				$("#detalle").text(clave1F+ " - " + materia.toUpperCase());
				$("#asignacion").click();

			})
			.fail(function(errorText,textError,errorThrow){
				alert("FALLO EN EL REGISTRO: " + errorText.responseText);
			})
			.always(function(){
				// OCULTAR AJAXLOADER
				$("#ajaxLoad").css("display","none");
				
			});
		}
		else// ACTUALIZACIÓN DE LA UNIDAD DE APRENDIZAJE
		{

			var materia=$("#clave1F").val();
			var plan = $("#noPlan").val();
			// Habilitar seriaciones para permitir guardado
			//$(".tblCatPlanAgregarSeriacion input,.tblCatPlanAgregarSeriacion select").removeAttr("disabled");
			var dataUA = $("#formularioPlanEstudio").serialize() + "&" + "users_id=" + USER_ID;
			//alert(dataUA);
			$.post("<?php echo URL::to('planestudio/actualizarua'); ?>",dataUA,function(data){
				//alert(data);
				$("#guardar").val("Guardar");
				$("#limpiar").val("Limpiar");
				$("#tblUA").dataTable().fnClearTable();
				ActualizarUAS(plan);
			
				alert("!Unidad de Aprendizaje actualizada!");
				// Limpiar Control
				$('option',$(".example41")).each(function(element) {
					$(".example41").multiselect('deselect', $(this).val());
				});
				$(".example41").multiselect("refresh");
				//$(".example41").multiselect('deselect', "multiselect-all");
				// Limpiar Control
				$("#select_carreras option").removeAttr('disabled');
				$(".example41").multiselect('refresh');

				$("#materia").css("background-color","");
				$("#noPlan").removeAttr('disabled').css("background-color","");
				$("#eliminar").hide();
				$("#asignacion").fadeOut("fast");
				// Limpiar variable de carreras
				$("#add_carreras").val("");
				reset_campos();
			})
			.fail(function(errorText,textError,errorThrow){
				alert("FALLO EN LA ACTUALIZACION: " + errorText.responseText);
			})
			.always(function(){
				// OCULTAR AJAXLOADER
				$("#ajaxLoad").css("display","none");

			});
			
		}
		// Regresar foco a la clave
		//$("#clave1F").focus();

	}

	// FUNCION ActualizarUAS
	/**
	 * Obtiene las Unidades de Aprendizaje de las carreras asignadas al Plan de Estudios Vigente.
	 * @param {string} plan Nro. de plan seleccionado por el usuario.
	 */
	function ActualizarUAS(plan)
	{
		// Crear instancia Datatables para manipulación de renglones durante la ejecución
		var t = $('#tblUA').DataTable();
		$("#ajaxLoad").css("display","block");
		$.post("<?php echo URL::to('planestudio/obteneruas'); ?>",{noplan:plan},function(uas){
			$('#tblUA').dataTable().fnClearTable();
			for (var i = 0; i < uas.length; i++) 
			{
				t.row.add([
							uas[i].uaprendizaje,
							uas[i].descripcionmat,
							(uas[i].siglas == null) ? "<span class='font-red'>NINGUNA</span>" : uas[i].siglas,
							(uas[i].etapa == null) ? "<span class='font-red'>NINGUNA</span>" : uas[i].etapa,
							(uas[i].caracter == null) ? "<span class='font-red'>NINGUNA</span>" : uas[i].caracter,
							(uas[i].seriacion == null ) ? "SIN SERIACIÓN" : uas[i].seriacion,// Falta llenar las seriaciones
							uas[i].coordinaciona,
							uas[i].HC,
							uas[i].HL,
							uas[i].HT,
							uas[i].creditos,
							"<input type='button' class='clsModificarFila' value='' data-modal='add_seriacion'/>",
							"<input type='button' value='-' class='clsEliminarFila' title='"+uas[i].uaprendizaje+"' data='"+uas[i].programaedu+"'>"]).draw();
			}
			$("#ajaxLoad").css("display","none");
			
		})
		.fail(function(errorText,textError,errorThrow){
			alert(errorText.responseText);
			/*console.log(errorText);
			console.log(textError);
			console.log(errorThrow);*/
		});
	}
	/** ASOCIAR PROGRAMAS
	 * Funcion que asocia la unidad de aprendizaje registrada con las carreras y sus posibles seriaciones
	 * @return {null} No regresa dato
	 */
	function asociarProgramas()
	{
		if($("#select_carreras").val()==null)
		{
			alert("Seleccione un programa educativo para continuar.");
		}
		else
		{
			$(".tblSeriaciones").find("input,select").removeAttr("disabled");
			$("#asociar_ua").val($("#clave1F").val());
			$("#asociar_user").val(USER_ID);
			var dataAsociar = $("#formAsociar").serialize();
			$.post("<?php echo URL::to('planestudio/asociarprogramas'); ?>",dataAsociar,function(mensaje){
				alert(mensaje);
				// Obtener el numero de serie de las materias seriadas
				var series = [];
				$(".tblSeriaciones tbody tr").not(":eq(0) , :eq(1)").each(function(index,element){
					var serie = $(element).find("input:first").val();
					// Indicar si es obligatoria o conveniente la ua seriada
					var tipo = $(element).find("select:first option:selected").html();
					series.push(serie + " (" + tipo.substring(0,1) + ")");
				});
				var stringSeries = "";
				// Mostrar informacion guardada en la base de datos de los programas asociados
				$("#select_carreras option:selected").each(function(){
					
					// Agregar informacion en la tabla
					if(series.length == 0)
						stringSeries = "SIN SERIACION";
					else
						stringSeries = series.join();
					var rowDetail = "<tr><td>"+ $(this).text() +"</td><td>"+ $("#asociar_etapa option:selected").text() +"</td><td>" +$("#asociar_caracter option:selected").text()+"</td><td>"+$("#asociar_semestre").val()+"</td><td>"+stringSeries+"</td><td><input type='button' value='-'' class='clsEliminarFila'></td><td style='display:none;'>" + $(this).val() + "</td></tr>";
					// Eliminar renglon en caso de actualizacion
					var rowOld=$("#tblDetalleAsociacion tbody tr td:contains('"+$(this).text()+"')").parent();
					if($(rowOld).length)
					{
						$(rowOld).replaceWith(rowDetail);
					}
					else
					{
						// Si no existe agregarlo a la tabla
						$("#tblDetalleAsociacion").append(rowDetail);
					}
				});
				// Limpiar controles
				//desmarcar_carreras();
				//$("#asociar_etapa").val(1);
				//$("#asociar_caracter").val(1);
				//$("#asociar_semestre").val(1);
				$(".tblSeriaciones > tbody > tr").not(":eq(0) , :eq(1)").remove();
				$(".sin-seriacion").show();

				//Actualizar Grilla
				//ActualizarUAS($("#noPlan").val());

			})
			.fail(function(errorText,textError,errorThrow){
				alert(errorText.responseText);
			});
		}
	}

	function disabled_campos(deshabilitar)
	{
		$("#clave1F").attr("disabled",deshabilitar);
		$("#materia").attr("disabled",deshabilitar);
		$("#etapaF").attr("disabled",deshabilitar);
		$("#tipoF").attr("disabled",deshabilitar);
		$("#semestre").attr("disabled",deshabilitar);
		$("#serie").attr("disabled",deshabilitar);
		$("#coord").attr("disabled",deshabilitar);
		$("#hc").attr("disabled",deshabilitar);
		$("#hl").attr("disabled",deshabilitar);
		$("#ht").attr("disabled",deshabilitar);
		$("#he").attr("disabled",deshabilitar);
		$("#hcl").attr("disabled",deshabilitar);
		$("#hpc").attr("disabled",deshabilitar);
		$("#observaciones").attr("disabled",deshabilitar);
		$("#creditosF").attr("disabled",deshabilitar);
		if(deshabilitar==true)
			$("#select_carreras").multiselect("disable");
		else
			$("#select_carreras").multiselect("enable");
		
		
	}

	function reset_campos()
	{
		//$("#noPlan").val("");
		$("#clave1F").val("");
		$("#materia").val("");
		//$("#nivel").val("");
		$("#carrera").val("");
		$("#asociar_etapa").val("1");
		$("#asociar_caracter").val("1");
		$("#asociar_semestre").val("1");
		//$("#materiaSeriada").val("");
		//$("#serie").val("1");
		//$("#clave2F").val("");
		//$("#clave2F").attr("disabled",true);
		$("#seriacion").val("");
		$("#hc").val(0);
		$("#hl").val(0);
		$("#ht").val(0);
		$("#he").val(0);
		$("#hpc").val(0);
		$("#hcl").val(0);
		$("#creditosF").val(0);
		$("#coord").val("");
		$("#semestre").val(1);
		$("#observaciones").val("");

		$(".tblSeriaciones > tbody > tr").not(":eq(0) , :eq(1)").remove();
		$("#tblDetalleAsociacion > tbody > tr").remove();
		$(".sin-seriacion").show();

		$("#clave1F").val("").focus();
		$("#materia").val("").css({"background":"","color":"black"});
		$("#clave1F").css("background","");

		$("#detalle").text("CLAVE - MATERIA");
	}

	function desmarcar_carreras()
	{
		// Limpiar Control
		$('option',$(".example41")).each(function(element) {
			$(".example41").multiselect('deselect', $(this).val());
		});
		$(".example41").multiselect("refresh");
	}
	</script>

|	<script type="text/javascript">
	$(function(){
		// Guardar Constantes
		USER_ID = {{Auth::user()->id}};
		// Crear instancia Datatables para manipulación de renglones durante la ejecución
		var t = $('#tblUA').DataTable();
		// Para añadir unidades de aprendizaje a las carreras con el update
		var updated = [];
		// Inicialización de controles
		$("#noPlan").val("");
		$("#clave2F").val("");
		$("#materiaSeriada").val("");
		$("#eliminar").hide();
		$("#asignacion").hide();
		reset_campos();
		
		
		// AL CAMBIO COMBOBOX NO DE PLAN CARGA LAS UNIDADES DE APRENDIZAJES ASIGNADAS A LAS CARRERAS Y LAS UA SERIADAS.
		$("#noPlan").on("change",function(){
			//alert("un cambio");
			reset_campos();
			$("#grid_plan").html($(this).val());
			disabled_campos(false);
			var plan = $(this).val();
			// Mostrar en label de ventana modal de asociacion
			$(".pe_noPlan label:first").text($(this).find("option:selected").html());
			// Obtener el nivel al que pertenece el plan seleccionado
			$.post("<?php echo URL::to('planestudio/obtenernivelplan'); ?>",{noplan:plan},function(nivel){
				$("#plan_nivel").html(nivel);
			}).fail(function(){
				alert("Fallo obtener nivel del plan");
			});
			// Obtener las carreras asociadas al plan de estudios.
			$.post("<?php echo URL::to('planestudio/obtenerprogramas'); ?>",{noplan:plan},function(programas){
				var options = "";
				for(var i = 0; i < programas.length; i++)
				{
					options += "<option value="+programas[i].programaedu+" >"+programas[i].descripcion+"</option>";
				}
				// Llenar las carreras que pertenecen al plan seleccionado
				$('#select_carreras').html(options);
				$('.example41').multiselect('rebuild');
			});
			// Obtener las claves para la seriación de las ua registradas en el plan.
			$.post("<?php echo URL::to('planestudio/obtenerclaveseries'); ?>",{noplan:plan},function(claves){
				var options = "";
				for(var i=0;i<claves.length;i++)
				{
					options += "<option value="+claves[i].uaprendizaje+" />";
				}
				$("#datalist_clave2F").html(options);
			});
			// Actualizar grid para mostrar las ua por carrera.
			ActualizarUAS(plan);

		});

		// INICIALIZAR MULTISELECTS DE PROGRAMAS EDUCATIVOS (CARRERAS)
		$('.example41').multiselect({
			includeSelectAllOption: true
			});

		$('.plancarreras').multiselect({
			includeSelectAllOption: true,
			onChange: function(element, checked){
				var brands = $('.plancarreras option:selected');
				var selected = [];
				$(brands).each(function(index, brand){
					selected.push([$(this).val()]);
				});
				// Asignar arreglos para guardar los números de las carreras
				$("#alta_plan_carreras").val(selected);
			}
		});
		disabled_campos(true);
		// CARGAR LA DESCRIPCIÓN DE LA UNIDAD DE APRENDIZAJE CUANDO PIERDE EL FOCO LA CLAVE DE LA UA.
		// VALIDA QUE NO ESTE REGISTRADA ESA UA EN EL PLAN SELECCIONADO
		$("#clave1F").on("focusout",function(){
			if($("#guardar").val()=="Actualizar")
				return;
			if($(this).val()!="")
			{
				var idua = $(this).val();
			
				$.post("<?php echo URL::to('planestudio/obtenermateria'); ?>",{uaprendizaje:idua},function(materia){
					if(materia != "NO EXISTE")
					{
						$("#materia").val(materia);
						$("#materia").css({"background":"pink","color":"black"});
						$("#clave1F").css("background","pink");
						if($("#guardar").val()=="Guardar")
						{
							alert("Esta unidad de aprendizaje ya esta registrada indique otro número de clave por favor");
							$("#clave1F").val("").focus();
							$("#materia").val("").css({"background":"","color":"black"});
							$("#clave1F").css("background","");
						}
					}
					else
					{
						$("#materia").css({"background":"#173C00","color":"white","font-size":"130%"}).focus();
					}
				})
				.fail(function(){
					
				});
			}
		});
		// VALIDAR CHECKBOX PARA CLAVE1F
		$("#clave1F").on("input",function(){
			if($(this).val().length!=5)
				$("#generarClave").attr("checked",false);
		});
		// GENERAR CLAVE PROVISIONAL
		$("#generarClave").on("change",function(){
			if($(this).is(":checked"))
			{
				$.post("<?php echo URL::to('planestudio/obtenerclave');?>",function(data){
					$("#clave1F").val(data);
					$("#materia").val("").focus();
				});
			}
			else
			{
				$("#clave1F").val("");
			}
		});
		// ELIMINAR LA UNIDAD DE APRENDIZAJE EN SU TOTALIDAD.
		$("#eliminar").on("click",function(){
			if(confirm("¿Deseas eliminar totalmente la Unidad de Aprendizaje? (Se eliminara de todos los programas educativos)"))
			{
				var materia = $("#clave1F").val();
				$.post("<?php echo URL::to('planestudio/eliminarua'); ?>",{uaprendizaje:materia})
				.done(function(data){
					alert(data);
					$("#guardar").val("Guardar");
					$("#tblUA").dataTable().fnClearTable();
					ActualizarUAS($("#noPlan").val());
					reset_campos();
					$("#eliminar").hide();
					$("#noPlan").removeAttr("disabled").css("background-color","");
					//desmarcar_carreras();
					// Habilitar Carreras
					$("#select_carreras option").removeAttr('disabled');
					$(".example41").multiselect('refresh');
				});
			}
		});
		
		// CARGAR LA DESCRIPCIÓN DE LA UNIDAD DE APRENDIZAJE DE LA SERIACIÓN CUANDO PIERDE EL FOCO.
		$("#clave2F").on("focusout",function(){
			if($(this).val()!="")
			{
				var idua = $(this).val();
				$.post("<?php echo URL::to('planestudio/obtenermateria'); ?>",{uaprendizaje:idua},function(materia){
					$("#materiaSeriada").val(materia);
				});
			}
		});
		// VALIDAR COORDINACION
		$("#coord").on("focusout",function(e){
			var flag = $("#datalist_coord option[value='"+$(this).val()+"']").attr("label");
			if(flag == undefined && $("#clave1F").val().length >= 5)
			{
				alert("No existe la coordinación tecleada");
				$(this).focus();
			}

		});

		// SUMAR CREDITOS DE HORAS CLASE
		$("#hc,#hl,#ht,#hcl,#he,#hpc").on("focusout",function(){
			var hc = parseInt($("#hc").val())*2;
			var hl = parseInt($("#hl").val());
			var ht = parseInt($("#ht").val());
			var hcl = parseInt($("#hcl").val());
			var hpc = parseInt($("#hpc").val());
			var he = parseInt($("#he").val());
			var creditos = hc + hl + ht + hcl + hpc + he;
			$("#creditosF").val(creditos);
		});
		
		// EVENTOS PARA EL BOTÓN LIMPIAR - GUARDAR Y CANCELAR - ACTUALIZAR
		$("#limpiar").on('click',function(){
			var opcion = $(this).val();
			// Si cancela una actualización
			if(opcion=="Cancelar")
			{
				reset_campos();
				$("#noPlan").removeAttr('disabled').css("background-color","");
				// Deseleccionar Carreras
				desmarcar_carreras();
				// habilitar Carreras
				$("#select_carreras option").removeAttr('disabled');
				$(".example41").multiselect('refresh');
				$("#guardar").val("Guardar");
				$(this).val("Limpiar");
				t.$('tr.selected').removeClass('selected'); // Remover selección
				
				$("#eliminar").hide();
				$("#asignacion").fadeOut("fast");
			}
			else
			{
				reset_campos();
				desmarcar_carreras();
			}
		});

		// EVENTOS PARA LA TABLA DE LAS SERIACIONES
		$(".tblSeriaciones").on("click",".dd_clsAgregarFila",function(){
			
			var filaSeriacion = $(this).parents().get(1);
			// Validar clave de seriación
			if($(filaSeriacion).find(".clave-seriacion-descripcion").val()=="" || $(filaSeriacion).find(".clave-seriacion-descripcion").val()=="NO EXISTE")
			{
				alert("Por favor, agregue una seriación válida");
				return;
			}
			// Duplicar fila base y añadir a tabla
			var seriacionNueva = $(".fila-base-seriacion").clone().removeClass("fila-base-seriacion").appendTo(".tblSeriaciones");
			$(".sin-seriacion").hide();
			//console.log(filaSeriacion);
			
			$(seriacionNueva).find(".tipo-seriacion").attr("name","seriacion_tipo[]");
			$(seriacionNueva).find(".clave-seriacion").attr("name","seriacion_clave[]");

			// Deshabilitar fila anterior
			if($("#guardar").val()!="Actualizar")
			{
				$(filaSeriacion).find("select,input").attr("disabled",true);
			}


		});
		// Eliminar fila de las materias seriadas sin afectar comportamiento en BD.
		$(".tblSeriaciones").on("click",".clsEliminarFila",function(){
			var filaSeriacion = $(this).parents().get(1);
			// Remover fila
			$(filaSeriacion).remove();
			// Habilitar fila anterior
			$(".tblSeriaciones tr:last-child").find("input:not('.clave-seriacion-descripcion'),select").removeAttr("disabled");

			// Si se elimina la última fila, mostrar mensaje sin seriación
			var rowCount = $(".tblSeriaciones > tbody > tr").length;
			if(rowCount == 2)
				$(".sin-seriacion").show();
		});
		
		// Cargar descripcion de ua cuando la tecleen o seleccionen
		$(".tblSeriaciones").on("input",".clave-seriacion",function(){
			
			var idua = $(this).val();
			var filaSeriacion = $(this).parents().get(1);
			// Si la clave seriada no esta vacia y es mayor o igual a 5 consultar.
			if($(this).val()!="" && $(this).val().length==5)
			{
				//alert(idua);
				$.post("<?php echo URL::to('planestudio/obtenermateria'); ?>",{uaprendizaje:idua},function(materia){
					//alert(materia);
					$(filaSeriacion).find(".clave-seriacion-descripcion").val(materia);
					
				})
				.fail(function(errorText,textError,errorThrow){
					alert(errorText.responseText);
				});

			}
			else
			{
				// Indicar que no existe la clave en la descripción
				$(filaSeriacion).find(".clave-seriacion-descripcion").val("NO EXISTE");
			}
		});


		// Boton AGREGAR en ventana modal seriacion
		$(".sin-seriacion").on("click",function(event){
			
			// Crear fila y agregar atributos para pasar por el formulario
			var seriacionNueva = $(".fila-base-seriacion").clone().removeClass("fila-base-seriacion").appendTo(".tblSeriaciones");
			$(seriacionNueva).find(".tipo-seriacion").attr("name","seriacion_tipo[]");
			$(seriacionNueva).find(".clave-seriacion").attr("name","seriacion_clave[]");
			
			$(this).hide();

			
		});

		// Evento eliminar para la tabla tblDetalleAsociacion
		$("#tblDetalleAsociacion tbody").on("click",".clsEliminarFila",function(){
			var rowAsociacion = $(this).parents().get(1);
			var programa = $(rowAsociacion).find("td:last-child").text();
			var ua = $("#asociar_ua").val();
			// Disociar la unidad del programa
			$.post("<?php echo URL::to('planestudio/disociarprograma'); ?>",{programa:programa,ua:ua},function(mensaje){
				alert(mensaje);
				$(rowAsociacion).remove();
			})
			.fail(function(errorText,textError,errorThrow){
				alert(errorText.responseText);
			})
			.always(function(){
				//ActualizarUAS($("#noPlan").val());
			});

		});
		
		// CARGAR DATOS A LOS CONTROLES AL SELECCIONAR RENGLÓN DE LA UA DEL DATATABLE
		$('#tblUA tbody').on('click','td',function(event){
			
			if(t.cell(this).index().column < 11)
			{
				/* Habilitar todas las carreras
				$("#select_carreras option").removeAttr('disabled');
				$(".example41").multiselect('refresh');*/

				$("#limpiar").val("Cancelar");

				if($(".dataTables_empty").length==0) // Si hay mas de un registro.
				{
					
					
					if ( $(this).parent().hasClass('selected') ) // Si esta seleccionado
					{
						$(this).parent().removeClass('selected');
					}
					else
					{
						//updated = []; // Limpiar arreglo para actualizar las nuevas materias seleccionadas
						$("#noPlan").attr('disabled','disabled').css("background-color","orange");
						t.$('tr.selected').removeClass('selected'); // Remover selección
						$(this).parent().addClass('selected');
						//var renglonUA = $(this).parent();
						var materia = $(this).parent().find('td:first').html();
						//var serie = $(this).parent().find('td').eq(5).html();
						var programaedu = $(this).parent().find('td:last-child input').attr("data");
						//console.log(programaedu);
						// MOSTRAR AJAXLOADER
						$("#ajaxLoad").css("display","block");
						$.post("<?php echo URL::to('planestudio/obtenerdataua'); ?>",{uaprendizaje:materia,programaedu:programaedu}, function(json)
						{
							//console.log(json); un cambio
							reset_campos();

							if(json.success)
							{
								$('#clave1F').val(json.uaprendizaje);
								$('#materia').val(json.descripcionmat);
								//$('#etapaF').val(json.etapa);
								//$('#tipoF').val(json.caracter);
								//$('#serie').val(json.reqseriacion);
								//$('#clave2F').val(json.claveD);
								//$('#materiaSeriada').val(json.materiaseriada);
								$('#coord').val(json.coordinaciona);
								$('#hc').val(json.hc);
								$('#hl').val(json.hl);
								$('#ht').val(json.ht);
								$('#hpc').val(json.hpc);
								$('#hcl').val(json.hcl);
								$('#he').val(json.he);
								//$('#semestre').val(json.semestre_sug);
								$('#creditosF').val(json.creditos);
								$('#observaciones').val(json.observa);
								// Cambiar funcionalidad
								$("#guardar").val("Actualizar");
								// Aparecer botón de eliminar
								$("#eliminar").show();
								$("#asignacion").fadeIn("fast");
								
								// Ventana modal asociacion
								$("#detalle").text(json.uaprendizaje + " - " + json.descripcionmat);
								$("#asociar_ua").val(json.uaprendizaje);

								var jsones = "";
								
								// Mostrar asociaciones con las carreras y materias seriadas en la tblDetalleAsociacion
								for(var i = 0; i < json.series.length; i++)
								{
									// Si no esta asociado, no mostrar renglon en vacio o nulo en la tabla detalle asociacion
									if(json.series[i].programaedu!=null)
									{
										var rowDetail = "<tr><td>"+ json.series[i].descripcion +"</td><td>"+ json.series[i].etapa +"</td><td>"+json.series[i].caracter+"</td><td>"+json.series[i].semestre_sug+"</td><td>"+((json.series[i].series == null) ? "SIN SERIACION" : json.series[i].series) +"</td><td><input type='button' value='-'' class='clsEliminarFila'></td><td style='display:none;''>" + json.series[i].programaedu + "</td></tr>";
										if(json.series[i].programaedu == programaedu)
										{
											//alert("si")
											console.log($(rowDetail));
										}
										$("#tblDetalleAsociacion tbody").append(rowDetail);
									}
								}
								
								//desmarcar_carreras();

								// Llenar tabla donde se asocian los programas con la materias

								//$(".example41").multiselect('deselect', "multiselect-all");
								// Limpiar Control
								
								/*for(i in json.programas)
								{
									$(".example41").multiselect('select',json.programas[i].programaedu);
									//$("#select_carreras option[value='"+json.programas[i].programaedu+"']").attr('disabled','disabled');
									$(".example41").multiselect('refresh');
								}

								for(i in json.series)
								{
									// Duplicar fila base y añadir a tabla las seriaciones extraidas de la BD
									var seriacionNueva = $(".fila-base-seriacion").clone().removeClass("fila-base-seriacion").appendTo(".tblCatPlanAgregarSeriacion");
									$(".sin-seriacion").hide();
									//console.log(filaSeriacion);
									
									// Valores de las ua seriadas
									$(seriacionNueva).find("select:eq(0)").val(json.series[i].reqseriacion);
									$(seriacionNueva).find("input:eq(0)").val(json.series[i].uaprequisito);
									$(seriacionNueva).find("input:eq(1)").val(json.series[i].descripcionmat);

									// Para la actualizacion posterior
									$(seriacionNueva).find(".tipo-seriacion").attr("name","seriacion_tipo[]");
									$(seriacionNueva).find(".clave-seriacion").attr("name","seriacion_clave[]");
								}*/

								// Habilitar ultima fila
								//$(".tblCatPlanAgregarSeriacion > tbody > tr").not(":eq(0) , :eq(1),:last-child").find("input,select").attr('disabled',true);
								
							}
							else
							{
								//$('#errorMessage').html(json.message);
								//$('#errorMessage').show();
								alert("Hubo error");
							}
						})
						.fail(function(errorText,textError,errorThrow){alert("Fallor al cargar datos para actualizar: " + errorText.responseText);})
						.always(function(){
							// OCULTAR AJAXLOADER
							$("#ajaxLoad").css("display","none");
						});
					}
				}
			}
		});
		// ELIMINAR LA UNIDAD DE APRENDIZAJE ASOCIADA A LA CARRERA "p_ua".
		$('#tblUA tbody').on('click','.clsEliminarFila',function(event){
			// Evitar que se propagen los eventos
			event.stopPropagation();

			var rowUA = $(this).parents().get(1);
			// Remover la seleccion
			
			$("#limpiar").click();
			$(rowUA).addClass('selected');
			

			if (confirm("¿ Está seguro de que desea eliminar ?"))
			{

				var materia = $(this).attr ("title"); // tittle esta el id de la unidad de aprendizaje
				var carrera = $(this).attr("data"); // data es la carrera / programa educativo
				var btnDelete = $(this);
				//document.location.href='users/delete/'+id;
				$.post("<?php echo URL::to('planestudio/contaruas'); ?>",{uaprendizaje:materia})
				.done(function(data){
					//alert(data);
					// if($('#tblUA').dataTable().fnGetData().length!=1)
					// Condición para verificar que no sea la unica asociada a un programa. Si es solo una asociación indicarle al usuario.
					if(data>1)
					{
						$.post("<?php echo URL::to('planestudio/eliminarpua'); ?>",{uaprendizaje:materia,programaedu:carrera})
						.done(function(data){
						// Eliminar renglón
							t
							.row($(btnDelete).parents('tr'))
							.remove()
							.draw();
							alert("Unidad de aprendizaje: X eliminada de la carrera: X");
						});

						//$(".example41").multiselect('deselect', carrera);
						//$("#select_carreras option[value='"+carrera+"']").removeAttr('disabled');
						//$(".example41").multiselect('refresh');
					}
					else
					{
						if(confirm("Se eliminara la unidad de aprendizaje en su totalidad si la eliminas del programa educativo ¿Deseas Continuar?"))
						{
							$.post("<?php echo URL::to('planestudio/eliminarua'); ?>",{uaprendizaje:materia,programaedu:carrera},function(){
								//$('#tblUA').dataTable().fnClearTable();
								t
								.row($(btnDelete).parents('tr'))
								.remove()
								.draw();
								alert("Unidad Eliminada Correctamente");
							});
							reset_campos();
							//alert("Si la elimino totalmente");
						}
					}

					
				});
			}
			else
			{
				$(rowUA).removeClass("selected");
			}
		});

		// EVENTOS VENTANA MODAL ASOCIACION DE PROGRAMAS
		$("#tblDetalleAsociacion").on("click","tr td",function(){
			if($(this).index() != 3)
			{
				var programa = $(this).parent().find("td:last").text();
				var etapa = $(this).parent().find("td:eq(1)").text();
				var uaid = $("#clave1F").val();

				$("#asociar_etapa option:contains('"+etapa+"')").attr('selected',true);
				$("#select_carreras").multiselect('select',programa);

				$.post("<?php echo URL::to('planestudio/obtenerdetalleseriacion'); ?>",{programaedu:programa,uaprendizaje:uaid},function(ua){
					// Limpiar tabla seriaciones
					$(".tblSeriaciones > tbody > tr").not(":eq(0) , :eq(1)").remove();
					$(".sin-seriacion").show();
					// Iterar por las series
					for(i in ua)
					{
						// Duplicar fila base y añadir a tabla las seriaciones extraidas de la BD
						var seriacionNueva = $(".fila-base-seriacion").clone().removeClass("fila-base-seriacion").appendTo(".tblSeriaciones");
						$(".sin-seriacion").hide();
						//console.log(filaSeriacion);
						
						// Valores de las ua seriadas
						$(seriacionNueva).find("select:eq(0)").val(ua[i].reqseriacion);
						$(seriacionNueva).find("input:eq(0)").val(ua[i].uaprequisito);
						$(seriacionNueva).find("input:eq(1)").val(ua[i].descripcionmat);

						// Para la actualizacion posterior
						$(seriacionNueva).find(".tipo-seriacion").attr("name","seriacion_tipo[]");
						$(seriacionNueva).find(".clave-seriacion").attr("name","seriacion_clave[]");
					}
				});
			}

		});
	});
	</script>

	 

<!------------------------------------ PARA VALIDAR SOLO NUMEROS ---------------------------->

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

<!------------------------------------------------------------------------------------------>
</body>
</html>