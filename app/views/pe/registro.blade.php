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

	<!-------------------------------------- MODAL PLAN DE ESTUDIO -------------------------------------->
	<div class="md-modal md-effect-11" id="plan"> 
		<form id="formUA" action="<?=URL::to('planestudio/registrarplan'); ?>" class="md-content" method="post">
			<h3>Agregar Plan</h3>
			<div class="tblCatalogos">
				<table class="tblCatPlan">
					<tr>
						<th></th>
						<th></th>
					</tr>
					<tr>		
						<td>No. Plan:</td>
						<td><input style="width: 100px; height: 30px; border-radius: 5px; border-color: #DBDBEA;" name="planestudio_anio" type="text" id="txtCatPlan" size="1" />&nbsp;-&nbsp;<input style="width: 80px; height: 30px; border-radius: 5px; border-color: #DBDBEA;"  name="planestudio_semestre" type="text" id="txtCatPlan2" size="1" /></td>
					</tr>
					<tr>
						<td>Descripción:</td>
						<td><input style="width: 200px; height: 30px; border-radius: 5px; border-color: #DBDBEA;" type="text" id="txtCatDescripcion" name="planestudio_descripcion" size=1 /></td>
					</tr>
					<tr>
						<td>Nivel:</td>
						<td>
							<select name="nivel" id="nivel">

							</select>
						</td>
					</tr>
					<tr>
						<td>Carreras:</td>
						<td>
							<select name="example" multiple="multiple" class="plancarreras">
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
						<td><input style="width: 100px; height: 30px; border-radius: 5px; border-color: #DBDBEA;" type="number" id="txtCatCredPract" name="planestudio_credpracticas" size=1 /></td>
					</tr>
					<tr>
						<td>Fecha Inicio:</td>
						<td><input style="width: 200px; height: 30px; border-radius: 5px; border-color: #DBDBEA;" type="date" id="txtCatFechaIni" name='planestudio_feciniciovig' size=1 /></td>
					</tr>
					<tr>
						<td>Fecha Final:</td>
						<td><input style="width: 200px; height: 30px; border-radius: 5px; border-color: #DBDBEA;" type="date" id="txtCatFechaFin" name="planestudio_fecfinvig" size=1 /></td>
					</tr>
				</table>
			</div>
			<div class="CatBotones">
				<input type="submit" class="estilo_button2" value="Guardar"/>
				<input type="button" value="Salir" class="md-close" />
			</div>
		</form>
	</div>
<<<<<<< HEAD
	<!---------------------------------------- CARRERA ---------------------------------------->

		<div class="md-modal md-effect-11" id="carrera"> 
			<form  action="<?=URL::to('planestudio/registrarprogramaeducativo'); ?>" class="md-content" method="post">
				<h3>Agregar Carrera</h3>
				
=======
	<!-------------------------------------- MODAL PLAN DE ESTUDIO -------------------------------------->
>>>>>>> 3eadc40cc7f28e54862d67ccdf9e0ba0fe7e9ac5

	<!-------------------------------------- MODAL PROGRAMA EDUCATIVO -------------------------------------->
	<div class="md-modal md-effect-11" id="carrera"> 
		<form  action="<?=URL::to('planestudio/registrarprogramaeducativo'); ?>" class="md-content" method="post">
			<h3>Agregar Carrera</h3>
			<div class="tblCatalogos">
				<table class="tblCatPlan">
						<td>Nombre:</td>
						<td><input style="width: 200px; height: 30px; border-radius: 5px; border-color: #DBDBEA;" type="text" id="txtCatDescripcionCarrera" name="proe_descripcion" size=1 /></td>
					</tr>
					<tr>
						<td>Status:</td>
						<td><input style="width: 20px; height: 20px; border-radius: 5px; border-color: #DBDBEA;" type="checkbox" id="txtCatCodigoCarrera" name="proe_status" size=1 />Activado</td>
					</tr>
					<tr>
						<td>Nivel:</td>
						<td>
						<select class="con_estilo" style="width: 200px;" name="proe_nivel" type="text" id="txtCatNivel" size=1 />
							@foreach($niveles as $nivel)
								<option value="{{$nivel->nivel}}">{{$nivel->descripcion}}</option>
							@endforeach
						</select>
						</td>
					</tr>
					<tr>
						<td>Especialidad:</td>
						<td>
						<select class="con_estilo" style="width: 200px;" name="proe_especialidad" type="text" id="txtCatEspecialidad" size=1 />
							@foreach($especialidades as $especialidad)
								<option value="{{$especialidad->especialidad}}">{{$especialidad->descripcion}}</option>
							@endforeach
						</select>
						</td>
					</tr>
					<tr>
						<td>Tipo Programa:</td>
						<td>
						<select class="con_estilo" style="width: 200px;" name="proe_periodo" type="text" id="txtCatTipoProgr" size=1 />
							@foreach($periodosPrograma as $periodo)
								<option value="{{$periodo->periodo_pedu}}">{{$periodo->descripcion}}</option>
							@endforeach
						</select>
						</td>
					</tr>
					<tr>
						<td>Coordinador:</td>
						<td><select class="con_estilo" style="width: 200px;" name="txtCatCoordinadorCarrera" type="text" id="txtCatCoordinadorCarrera" size=1 />
								<option value="COORDINADOR INFORMATICA">COORDINADOR INFORMATICA</option>
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
	<!-------------------------------------- MODAL PROGRAMA EDUCATIVO -------------------------------------->

	<!-------------------------------------- MODAL ETAPAS -------------------------------------->
	<div class="md-modal md-effect-11" id="etapa"> 
		<form  action="<?=URL::to('planestudio/registraretapa'); ?>" class="md-content" method="post">
			<h3>Agregar Etapa</h3>
			<div class="tblCatalogos">
				<table class="tblCatPlan">
					<tr>
						<th></th>
						<th></th>
					</tr>
					<tr>
						<td>Nombre:</td>
						<td><input style="width: 200px; height: 30px; border-radius: 5px; border-color: #DBDBEA;" type="text" id="txtCatDescripcionEtapa" size=1 /></td>
					</tr>
				</table>
			</div>
			<div class="CatBotones">
				<input type="submit" class="estilo_button2" value="Guardar"/>
				<input type="button" value="Salir" class="md-close" />
			</div>
		</form>
	</div>
	<!-------------------------------------- MODAL ETAPAS -------------------------------------->

	<!-------------------------------------- MODAL TIPO SERIACION -------------------------------------->
	<div class="md-modal md-effect-11" id="seriacion"> 
		<form  action="<?=URL::to('planestudio/registrarseriacion'); ?>" class="md-content" method="post">
			<h3>Agregar Seriación</h3>
			<div class="tblCatalogos">
				<table class="tblCatPlan">
					<tr>
						<th></th>
						<th></th>
					</tr>
					<tr>
						<td>Nombre:</td>
						<td><input style="width: 200px; height: 30px; border-radius: 5px; border-color: #DBDBEA;" type="text" id="txtCatDescripcionSeriacion" size=1 /></td>
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
						<td><input style="width: 200px; height: 30px; border-radius: 5px; border-color: #DBDBEA;" type="text" id="txtCatDescripcionTipo" size=1 /></td>
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
		<form  action="<?=URL::to('planestudio/registrarprogramaeducativo'); ?>" class="md-content" method="post">
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
						<td><input style="width: 200px; height: 30px; border-radius: 5px; border-color: #DBDBEA;" type="text" id="txtCatDescripcionCoordinacion" size=1 /></td>
					</tr>
					<tr>
						<td>Programa Educativo:</td> 
						<td>
							<select class="con_estilo" style="width: 200px;" name="txtCatDescripcionCoordinacion" type="text" id="txtCatDescripcionCoordinacion" size=1 />
								<option value="CONTABILIDAD">LIC. EN CONTADURIA</option>
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
				<img src="../imagenes/manual.png" alt="">&nbsp;Manual
			</div>
		</div>
	</div>
	<section>
		<!---------------------------- FORMULARIO PRINCIPAL DE UNIDAD DE APRENDIZAJE ---------------------------->
		<form id="formularioPlanEstudio" method="post" action="<?=URL::to('planestudio/registrarua');  ?>">
			<!-- INICIA PRIMER SECCIÓN -->
			<div id="primerBloque">
				<!------------------------------------ NO. PLAN -------------------------------------->
				<div id="noPlanDiv">
					<label>No.Plan:</label>
					<select class="con_estilo" type="text" name="noPlan" id="noPlan" required>
						@foreach ($codigosPE as $codigo )
							<option value="{{$codigo['codigo']}}">{{$codigo['formato']}}</option>
						@endforeach
					</select>
					<!-- LLAMADA MODAL NRO. PLAN -->
					<input class="md-trigger" data-modal="plan" type="button" value="+"></a>
					<!-- LLAMADA MODAL NRO. PLAN -->
				</div>
				<!------------------------------------ CAMPUS ------------------------------------>
				<!--<div id="campusDiv">
						<label>Campus: </label>
						<label style="color:#ECA22E">{{Auth::user()->campus}}</label>
					</div>-->
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
				<!------------------------------------ PROGRAMA EDUCATIVO -------------------------------------->
				<div id="carreraDiv">
					<label>Carrera:</label>
					<select id="select_carreras" name="example" multiple="multiple" class="example41"></select>
					<!-- Campo oculto para id´s de carreras -->
					<input type="hidden" name="carreras" id="carreras"/>
					<input type="hidden" name="add_carreras" id="add_carreras" />
					<!-- LLAMADA MODAL PROGRAMA EDUCATIVO -->
					<input class="md-trigger" data-modal="carrera" type="button" value="+">
					<!-- LLAMADA MODAL PROGRAMA EDUCATIVO -->
				</div>
				<!------------------------------------ NIVEL ------------------------------------>
				<!--<div id="nivelDiv">
					<label>Nivel: </label>
					<label style="color:#ECA22E; padding-left:5px;">LICENCIATURA</label>
				</div>-->
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
						<input class="estilo_text" type="text" name="clave1F" id="clave1F" size="1" autocomplete="off" required>
						<input type="button" value="-" title='Eliminar' class="clsEliminarFila" id="eliminar"/>
						<br />
						<input type="checkbox" id="generarClave" name="generarClave" value="Generar">Generar clave
					</div>
					<!---------------------------------- DESCRIPCIÓN UA ---------------------------------->
					<div id="materiaDiv">
						<label>Materia: </label>
						<input style="width: 375px; height: 25px; border-radius: 5px; border-color: #DBDBEA; text-transform:uppercase" type="text" name="materia" id="materia" size="1" required/>
					</div>
					<!-------------------------------------- ETAPA -------------------------------------->
					<div id="etapaDiv">
						<label>Etapa: </label>
						<select style="width:143px;" class="con_estilo" name="etapaF" id="etapaF" size=1 type="text" required>
							@foreach ($etapas as $etapa)
								<option value="{{$etapa->etapa}}">{{$etapa->descripcion}}</option>
							@endforeach
						</select>
						<!-- LLAMADA MODAL ETAPA -->
							<input class="md-trigger" data-modal="etapa" type="button" value="+">
						<!-- LLAMADA MODAL ETAPA -->
					</div>
					<!---------------------------------- TIPO CARACTER ---------------------------------->
					<div id="tipoDiv">
						<label>Tipo: </label>
						<select style="width:143px;" class="con_estilo" name="tipoF" id="tipoF" size=1 type="text" required>
							@foreach ($tiposCaracter as $caracter)
								<option value="{{$caracter->caracter}}">{{$caracter->descripcion}}</option>
							@endforeach
						</select>
						<!-- LLAMADA MODAL TIPO CARACTER -->
							<input class="md-trigger" data-modal="tipo" type="button" value="+">
						<!-- LLAMADA MODAL TIPO CARACTER -->
					</div>
					<!---------------------------------------------------------------------------------->
				</div>
				<!-- TERMINA SEGUNDA SECCIÓN -->
				<!------------------------------------ SEMESTRE ------------------------------------>
				<!-- INICIA TERCER SECCIÓN -->
				<div id="tercerBloque">
					<div id="semestreDiv">
						<label>Sem:</label>
						<input class="estilo_numeric" type="number" name="semestre" id="semestre" min="1" max="9" onkeypress="ValidaSoloNumeros()" required>
					</div>
					<!-- INICIA MARCO DEL GRUPO SERIACIÓN -->
					<fieldset id="group_seriacion">
						<legend>Seriación</legend>
						<!---------------------------------- TIPO SERIACION ---------------------------------->
						<div id="seriacionDivTipo">
							<label>Tipo Seriación: </label>
							<select style="width: 143px" class="con_estilo" name="serie" id="serie" size=1 type="text" required>
								@foreach ($seriaciones as $seriacion)
									<option value="{{$seriacion->reqseriacion}}">{{$seriacion->descripcion}}</option>
								@endforeach
							</select>
							<!-- LLAMADA MODAL SERIACIÓN-->
							<input class="md-trigger" data-modal="seriacion" type="button" value="+">
							<!-- LLAMADA MODAL SERIACIÓN-->
						</div>
						<!---------------------------------- CLAVE SERIACION ---------------------------------->
						<div id="claveSerDiv">
							<label>Clave: </label>
								<input class="estilo_text" type="text" name="clave2F" id="clave2F" list="datalist_clave2F" size="1" disabled="disabled" autocomplete="off">
								<datalist id="datalist_clave2F">
									{{-- @foreach ($unidadesAprendizaje as $materia)
										<option value="{{$materia->uaprendizaje}}" />
									@endforeach --}}
								</datalist>
						</div>
						<!---------------------------- DESCRIPCION UA SERIACION ---------------------------->
						<div id="seriacionDivMateria">
							<input class="con_estilo" style="height: 25px; width: 280px" text-transform:"uppercase" type="text" name="materiaSeriada" id="materiaSeriada" size="1" disabled/>	
						</div>
					<!-- TERMINA MARCO DEL GRUPO SERIACIÓN -->
					</fieldset>
					<!---------------------------------- COORDINACION ---------------------------------->
					<div id="coordDiv">
						<label>Coord: </label><input autocomplete="off" style="width:143px; text-transform:uppercase" class="coordina" type="text" name="coord" id="coord" size="1"  list="datalist_coord" required />
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
				<!-- TERMINAR TERCER SECCIÓN -->
				<!------------------------------------ HORAS ------------------------------------>
				<!-- INICIA CUARTA SECCIÓN -->
				<div id="cuartoBloque">
					<div id="hcDiv">
						<label>HC: </label>
						<input class="estilo_numeric" type="number" name="hc" id="hc" min="1" max="20" >
					</div>
					<div id="hlDiv">
						<label>HL: </label>
						<input class="estilo_numeric" type="number" name="hl" id="hl" min="1" max="20" >
					</div>
					<div id="htDiv">
						<label>HT: </label>
						<input class="estilo_numeric" type="number" name="ht" id="ht" min="1" max="20" >
					</div>
					<br />
					<br />
					<div id="heDiv">
						<label>HE: </label>
						<input class="estilo_numeric" type="number" name="he" id="he" min="1" max="20" >
					</div>
					<div id="hpcDiv">
						<label>HPC: </label>
						<input class="estilo_numeric" type="number" name="hpc" id="hpc" min="1" max="20" >
					</div>
					<div id="hclDiv">
						<label>HCL: </label>
						<input class="estilo_numeric" type="number" name="hcl" id="hcl" min="1" max="20" >
					</div>
					<br />
					<br />
					<!------------------------------------ CREDITOS ------------------------------------>
					<div id="creditosDiv">
						<label>Créditos: </label><input class="estilo_numeric" type="number" name="creditosF" id="creditosF" min="1" >
					</div>
					<!------------------------------------ OBSERVACIONES ------------------------------------>
					<div id="observacionesDiv">
						<label>Observaciones:</label><br>
						<textarea rows=3 cols="60" style=" border-radius:5px; border-color:#DBDBEA; text-transform:uppercase; resize:none" id="observaciones" name="observaciones" placeholder="Observaciones"></textarea>
					</div>
					<!---------------------------------- BOTON GUARDAR - ACTUALIZAR UA ---------------------------------->
					<div id="botones">
						<input type="button" style="width:120px"class="estilo_button2" type="button" value="Guardar" name="guardar" id="guardar" />
						<input type="button" style="width:120px"class="estilo_button2" type="button" value="Limpiar" name="limpiar" id="limpiar" />
					</div>
					<!---------------------------------- BOTON GUARDAR UA ---------------------------------->
				</div>
				<!-- TERMINA CUARTA SECCIÓN -->
			</fieldset>
			<!------------------------------------ MARCO SEGUNDA SECCIÓN ------------------------------------>
		</form>
		<!---------------------------- FORMULARIO PRINCIPAL DE UNIDAD DE APRENDIZAJE ---------------------------->

		<!------------------------ GRID PARA MOSTRAR UNIDADES DE APRENDIZAJE POR PLAN ------------------------>
		<div id="GridPlanEstudio">
			<label style="font-size:1.2em;">No. Plan: </label><label style="font-size:1.2em; color:orange;" id="grid_plan">000</label>
			<div id="planTerminado">
				<input style="width:20px; height:20px;" type="checkbox" name="planTerminado" value="Generar"><label style="font-size:18px;">Plan de estudios terminado</label>
			</div>
			<br />
			<!-- INICIA TABLA DATATABLES PARA LAS UA -->
			<table cellpadding="0" cellspacing="0" border="0" class="display" id="tblUA">
				<thead>
					<tr>
						<th>CLAVE</th>
						<th>MATERIA</th>
						<th>CARRERA</th>
						<th>ETAPA</th>
						<th>TIPO</th>
						<th>CLAVE_SERIACION</th>
						<th>COORDINACIÓN</th>
						<th>HC</th>
						<th>HL</th>
						<th>HT</th>
						<th>CRÉDITOS</th>
						<th>ELIMINAR</th>
					</tr>
				</thead>
				<tfoot>
					<tr>
						<th>CLAVE</th>
						<th>MATERIA</th>
						<th>CARRERA</th>
						<th>ETAPA</th>
						<th>TIPO</th>
						<th>CLAVE_SERIACION</th>
						<th>COORDINACIÓN</th>
						<th>HC</th>
						<th>HL</th>
						<th>HT</th>
						<th>CRÉDITOS</th>
						<th>ELIMINAR</th>
					</tr>
				</tfoot>
				<tbody></tbody>
			</table>
			<!-- TERMINA TABLA DATATABLES PARA LAS UA -->
		</div>
		<!------------------------ GRID PARA MOSTRAR UNIDADES DE APRENDIZAJE POR PLAN ------------------------>
	</section>
	<footer></footer>
	<!-- classie.js by @desandro: https://github.com/desandro/classie -->
	<script src="../js/classie.js"></script>
	<script src="../js/modalEffects.js"></script>
	<script>
	$(document).ready(function(){
		// Crear instancia Datatables para manipulación de renglones durante la ejecución
		var t = $('#tblUA').DataTable();
		// Para añadir unidades de aprendizaje a las carreras con el update
		var updated = [];
		// Inicialización de controles
		$("#noPlan").val("");
		$("#clave2F").val("");
		$("#materiaSeriada").val("");
		$("#eliminar").hide();
		// FUNCIONES GENERALES DE LA APLICACION
		/**
		 * Obtiene las Unidades de Aprendizaje de las carreras asignadas al Plan de Estudios Vigente.
		 * @param {string} plan Nro. de plan seleccionado por el usuario.
		 */
		function ActualizarUAS(plan)
		{
			$.post("<?php echo URL::to('planestudio/obteneruas'); ?>",{noplan:plan},function(uas){
				$('#tblUA').dataTable().fnClearTable();
				for (var i = 0; i < uas.length; i++) 
				{
					t.row.add([
								uas[i].uaprendizaje,
								uas[i].descripcionmat,
								uas[i].descripcion,
								uas[i].etapa,
								uas[i].caracter,
								uas[i].claveD,
								uas[i].coordinaciona,
								uas[i].HC,
								uas[i].HL,
								uas[i].HT,
								uas[i].creditos,
								"<input type='button' value='-' class='clsEliminarFila' title='"+uas[i].uaprendizaje+"' data='"+uas[i].programaedu+"'>"]).draw();
				}
			});
		}

		function reset_campos()
		{
			//$("#noPlan").val("");
			$("#clave1F").val("");
			$("#materia").val("");
			$("#nivel").val("");
			$("#carrera").val("");
			$("#etapaF").val("1");
			$("#tipoF").val("1");
			$("#clave2F").val("");
			$("#materiaSeriada").val("");
			$("#serie").val("1");
			$("#seriacion").val("");
			$("#hc").val("");
			$("#hl").val("");
			$("#ht").val("");
			$("#he").val("");
			$("#hpc").val("");
			$("#hcl").val("");
			$("#creditosF").val("");
			$("#coord").val("");
			$("#semestre").val("");
			$("#observaciones").val("");
		}
		
		// AL CAMBIO COMBOBOX NO DE PLAN CARGA LAS UNIDADES DE APRENDIZAJES ASIGNADAS A LAS CARRERAS Y LAS UA SERIADAS.
		$("#noPlan").on("change",function(){
			$("#grid_plan").html($(this).val());
			var plan = $(this).val();
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

			$.post("<?php echo URL::to('planestudio/obtenerclaveseries'); ?>",{noplan:plan},function(claves){
				var options = "";
				for(var i=0;i<claves.length;i++)
				{
					options += "<option value="+claves[i].uaprendizaje+" />";
				}
				$("#datalist_clave2F").html(options);
			});

			ActualizarUAS(plan);

		});

		// INICIALIZAR MULTISELECTS DE PROGRAMAS EDUCATIVOS (CARRERAS)
		$('.example41').multiselect({
			includeSelectAllOption: true,
			onChange: function(element, checked,index){
				var brands = $('.example41 option:selected');
				var selected = [];
				$(brands).each(function(index, brand){
					selected.push([$(this).val()]);
				});
				// Asignar arreglos para guardar los números de las carreras
				$("#carreras").val(selected);

				// En caso de actualizar guardar solo las nuevas
				if($("#guardar").val()=="Actualizar" )
				{
					if($(element).val()!=undefined) // Si no seleccionan todas las carreras
					{
						if(checked==true)
						{
							updated.push($(element).val());
						}
						else
						{
							var pos = updated.indexOf($(element).val());
							pos > -1 && updated.splice(pos,1);
						}
						//alert(updated);
					}
					else
					{
						if(checked==true)
						{
							updated = [];
							$('#select_carreras + div > button + .multiselect-container li input:enabled').each(function(index,element){
								if(index!=0)
									updated.push($(element).val());
							});
						}
						else
						{
							updated=[];
						}
						//alert(updated);
					}
				}
				$("#add_carreras").val(updated);
			}
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

		// CASOS DE LA PARA ASIGNAR LA SERIACIÓN
		$('#serie').on('change',function(){
			var opcionSerie = $(this).val();
			if(opcionSerie==1)
			{
				$('#clave2F').attr('disabled','disabled').val("");
				$('#materiaSeriada').val("");
			}
			else
			{
				$("#clave2F").removeAttr('disabled').val("");
				$("#materiaSeriada").val("");
			}
		});
		// CARGAR DATOS A LOS CONTROLES AL SELECCIONAR RENGLÓN DE LA UA DEL DATATABLE
		$('#tblUA tbody').on('click','td',function(){
			
			if(t.cell(this).index().column!=11)
			{
				// Habilitar todas las carreras
				$("#select_carreras option").removeAttr('disabled');
				$(".example41").multiselect('refresh');


				if($(".dataTables_empty").length==0) // Si hay mas de un registro.
				{
					// Aparecer botón de eliminar
					$("#eliminar").show();

					if ( $(this).parent().hasClass('selected') ) // Si esta seleccionado
					{
						$(this).parent().removeClass('selected');
					}
					else
					{
						updated = []; // Limpiar arreglo para actualizar las nuevas materias seleccionadas
						$("#noPlan").attr('disabled','disabled').css("background-color","orange");
						t.$('tr.selected').removeClass('selected'); // Remover selección
						$(this).parent().addClass('selected');
						//var renglonUA = $(this).parent();
						var materia = $(this).parent().find('td:first').html();
						var serie = $(this).parent().find('td').eq(5).html();
						$.post("<?php echo URL::to('planestudio/obtenerdataua'); ?>",{uaprendizaje:materia,claveD:serie}, function(json)
						{
							if(json.success)
							{
								$('#clave1F').val(json.uaprendizaje);
								$('#materia').val(json.descripcionmat);
								$('#etapaF').val(json.etapa);
								$('#tipoF').val(json.caracter);
								$('#serie').val(json.reqseriacion);
								$('#clave2F').val(json.claveD);
								$('#materiaSeriada').val(json.materiaseriada);
								$('#coord').val(json.coordinaciona);
								$('#hc').val(json.hc);
								$('#hl').val(json.hl);
								$('#ht').val(json.ht);
								$('#hpc').val(json.hpc);
								$('#hcl').val(json.hcl);
								$('#he').val(json.he);
								$('#semestre').val(json.semestre);
								$('#creditosF').val(json.creditos);
								$('#observaciones').val(json.observa);
								$("#guardar").val("Actualizar");
								var jsones = "";
								
								
								// Limpiar Control
								$('option',$(".example41")).each(function(element) {
									$(".example41").multiselect('deselect', $(this).val());
								});
								$(".example41").multiselect("refresh");

								//$(".example41").multiselect('deselect', "multiselect-all");
								// Limpiar Control
								
								for(i in json.programas)
								{
									$(".example41").multiselect('select',json.programas[i].programaedu);
									$("#select_carreras option[value='"+json.programas[i].programaedu+"']").attr('disabled','disabled');
									$(".example41").multiselect('refresh');
								}
							}
							else
							{
								//$('#errorMessage').html(json.message);
								//$('#errorMessage').show();
								alert("Hubo error");
							}
						})
						.fail(function(){alert("fallo");});
					}
				}
			}
		});
		// CARGAR LA DESCRIPCIÓN DE LA UNIDAD DE APRENDIZAJE CUANDO PIERDE EL FOCO LA CLAVE.
		$("#clave1F").on("focusout",function(){
			if($(this).val()!="")
			{
				var idua = $(this).val();
			
				$.post("<?php echo URL::to('planestudio/obtenermateria'); ?>",{uaprendizaje:idua},function(materia){
					$("#materia").val(materia);
					$("#materia").css("background","pink");
					if($("#guardar").val()=="Guardar")
					{
						alert("Esta unidad de aprendizaje ya esta registrada indique otro número de clave por favor");
						$("#clave1F").val("").focus();
						$("#materia").val("").css("background","");
					}
				})
				.fail(function(){
					$("#materia").css("background","#9FF781");
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
		// INSERTAR EN TABLA "p_ua" LA CARRERA Y LA UNIDAD DE APRENDIZAJE A LA QUE PERTENECE
		$("#guardar").on("click",function(){
			var opcion = $(this).val();
			// Validar si no eligieron carreras.
			var nCarreras = $("#select_carreras").val();
			if(nCarreras==null)
			{
				alert("No has seleccionado ninguna carrera");
				return;
			}
			// INSERTAR NUEVA UNIDAD DE APRENDIZAJE
			if(opcion == "Guardar")
			{
				var dataUA = $("#formularioPlanEstudio").serialize();
				$.post("<?php echo URL::to('planestudio/registrarua'); ?>",dataUA,function(data){
					var noPlan=$("#noPlan").val();
					var clave1F=$("#clave1F").val();
					var materia=$("#materia").val();
					//var carrera = "INFORMATICA";
					var etapaF=$("#etapaF option:selected").html();
					var tipoF=$("#tipoF option:selected").html();
					var clave2F=$("#clave2F").val();
					//var materiaSeriada=$("#materiaSeriada").val();
					var hc=$("#hc").val();
					var hl=$("#hl").val();
					var ht=$("#ht").val();
					var coord=$("#datalist_coord option[value='"+$("#coord").val()+"']").attr("label");
					var creditosF=$("#creditosF").val();
					var tablaDatos= $("#tblUA");
					$('#select_carreras + div > button + .multiselect-container li').each(function(indice,elemento){
						if($(elemento).hasClass('active') && indice != 0)
						{
							var input = $(elemento).find('input').val();
							t.row.add([
										clave1F,
										materia,
										$(elemento).text(),
										etapaF,
										tipoF,
										clave2F,
										coord,
										hc,
										hl,
										ht,
										creditosF,
										"<input type='button' value='-' title='"+clave1F+"' data="+input+" class='clsEliminarFila'>"]).draw();
						}
					});
					alert(data);
					$("#materia").css("background-color","");
					reset_campos();
				})
				.fail(function(){
					alert("Fallo el registro de la Unidad de Aprendizaje");
				});
			}
			else// ACTUALIZACIÓN DE LA UNIDAD DE APRENDIZAJE
			{	
				var materia=$("#clave1F").val();
				var plan = $("#noPlan").val();
				var dataUA = $("#formularioPlanEstudio").serialize();
				$.post("<?php echo URL::to('planestudio/actualizarua'); ?>",dataUA,function(data){
					//alert(data);
					$("#guardar").val("Guardar");
					$('#tblUA').dataTable().fnClearTable();
					ActualizarUAS(plan);
					alert("Datos actualizados");
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
					reset_campos();
				});
				
			}
		});
		// ELIMINAR LA UNIDAD DE APRENDIZAJE ASOCIADA A LA CARRERA "p_ua".
		$('#tblUA tbody').on('click','.clsEliminarFila',function(){
			
			if (confirm("¿ Está seguro de que desea eliminar ?"))
			{

				var materia = $(this).attr ("title");
				var carrera = $(this).attr("data");
				//document.location.href='users/delete/'+id;
				if($('#tblUA').dataTable().fnGetData().length!=1)
				{
					$.post("<?php echo URL::to('planestudio/eliminarpua'); ?>",{uaprendizaje:materia,programaedu:carrera})
					.done(function(data){
						alert("Unidad de aprendizaje: X eliminada de la carrera: X");
					});
					// Eliminar renglón
					t
					.row($(this).parents('tr'))
					.remove()
					.draw();

					$(".example41").multiselect('deselect', carrera);
					$("#select_carreras option[value='"+carrera+"']").removeAttr('disabled');
					$(".example41").multiselect('refresh');
				}
				else
				{
					if(confirm("Se eliminara la unidad de aprendizaje en su totalidad si la eliminas del programa educativo ¿Deseas Continuar?"))
					{
						$.post("<?php echo URL::to('planestudio/eliminarpua'); ?>",{uaprendizaje:materia,programaedu:carrera})
						.done(function(data){
							$.post("<?php echo URL::to('planestudio/eliminarua'); ?>",{uaprendizaje:materia},function(){$('#tblUA').dataTable().fnClearTable();});
						});
						reset_campos();
						//alert("Si la elimino totalmente");
					}
				}

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
				});
			}
		});
	});
	</script>
</body>
</html>