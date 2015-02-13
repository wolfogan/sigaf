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
	<!-- Creación de Ventanas Modales -->
	<script src="../js/ventanamodal.js"></script>

	<!---------------------------------- Checkboxlist -------------------------------------->

	<link rel="stylesheet" href="../css/jqx.base.css" type="text/css" />
	<link rel="stylesheet" href="../css/jqx.orange.css" type="text/css" />
	<script type="text/javascript" src="../js/jquery-2.1.0.min.js"></script>



	<!------------------------------------------------------------------------------------->

	<!-------------------------------- AQUI VA HORA Y FECHA-------------------------------->
	<script src="../js/tiempoactual.js"></script>
	<script>$(function(){startWatch(); return false;});</script>

	<!-------------------------------- AQUI VA HORA Y FECHA-------------------------------->

	<!---------------------------------- Para combo multiple scripts ---------------------------->
	<script type="text/javascript" src="../js/bootstrap-3.1.1.min.js"></script>
	<script type="text/javascript" src="../js/bootstrap-multiselect.js"></script>
	<script type="text/javascript" src="../js/prettify.js"></script>

	<!-------------------------------- PARA MULTISELECT ---------------------------->
	<script type="text/javascript">
		$(function() {
			$('.grupos').multiselect(configurationObligatorio);
		});

		var configurationObligatorio =
		{
			includeSelectAllOption: false,
			onChange: function(element,checked,index){
				if($("#selectCaracterVigente").val()==1)
				{
					//alert("El caracter es OBLIGATORIO no puedes quitar grupos");
					$('#selectGruposVigente').multiselect('select',element.val());
					return false;
				}

				if($("#selectCaracterAnterior").val()==1)
				{
					//alert("El caracter es OBLIGATORIO no puedes quitar grupos");
					$('#selectGruposAnterior').multiselect('select',element.val());
					return false;
				}
			}
		};
		var configurationOptativo =
		{
			includeSelectAllOption: true
		};
	</script>

	<!-------------------------------------------------------------------------------------------->

</head>
<body>

	<input type="hidden" name="global_user_id" id="globalUserId"  value = {{Auth::user()->id}}/>
	<!-------------------------------- MODAL CATALOGO PERIODOS -------------------------------->

	<div class="md-modal md-effect-11" id="btnCatalogoPeriodo">
		<form id="formCopiarCarga" action="javascript:copiarCarga();" class="md-content" method="post">
			<h3>Crear Nuevo Período</h3>
			<div class="tblCatalogos">
				<div class="Ca_aCopiar">La carga anterior pertenece al período:<label id="labelPeriodoCopia"></label></div>
				<table class="tblCatPlan" id="tablaCopiarCarga">
					<tr>
						<td>Nombre:</td>
						<td><input style="width: 100px; height: 30px; border-radius: 5px; border-color: #DBDBEA;" name="periodoAnio" type="text" id="periodoAnio" maxlength="4" placeholder="2014" required/>&nbsp;-&nbsp;<input style="width: 80px; height: 30px; border-radius: 5px; border-color: #DBDBEA;"  name="periodoLapso" type="text" id="perdiodoLapso" maxlength="1" placeholder="1" required/></td>
					</tr>
					<tr>
						<td>Tipo Programa:</td>
						<td>
							<select style="width:200px;" name="periodoTipo" id="periodoTipo" />
								@foreach ($periodosPrograma as $periodo)
									<option value="{{$periodo->periodo_pedu}}">{{$periodo->descripcion}}</option>
								@endforeach
							</select>
						</td>
					</tr>
					<tr>
						<td>Fecha inicio:</td>
						<td><input style="width: 200px; height: 30px; border-radius: 5px; border-color: #DBDBEA;" type="date" id="periodoFechaInicio" name='periodoFechaInicio' required/></td>
					</tr>
					<tr>
						<td>Fecha fin:</td>
						<td><input style="width: 200px; height: 30px; border-radius: 5px; border-color: #DBDBEA;" type="date" id="periodoFechaFin" name='periodoFechaFin' required/></td>
					</tr>
					<tr>
						<td>Descripción:</td>
						<td><input style="width: 200px; height: 30px; border-radius: 5px; border-color: #DBDBEA;" type="text" name="periodoDescripcion" id="periodoDescripcion" placeholder="Descripción del período" required/></td>
					</tr>
				</table>
			</div>
			<figure id="ajaxLoad" style="margin-left:30px;">
				<img src="../imagenes/copiando_carga.gif" alt="Cargando...." />
				<img src="../imagenes/332.gif" alt="Cargando2...." style="margin-left:-50px; margin-top:9%; width:100px; height:18px;"/>
			</figure>
			<div class="Ca_aCopiar" id="cargaCompleta" style="float:left; margin-left:40px; padding-right:0px;">Carga copiada con éxito!!!!</div>
			<div class="CatBotones">
				<input type="hidden" name="programa_copia" id ="programaCopia" />
				<input type="hidden" name="periodo_copia" id="periodoCopia" />
				<input type="hidden" name="periodo_usersid" id="periodoUsersId">

				<input type="submit" class="estilo_button2" value="Copiar" id="buttonCopiar"/>
				<input type="button" value="Salir" class="md-close" id="salirPeriodo"/>
			</div>
		</form>
	</div>

	<!-------------------------------------- MODAL CATALOGO GRUPOS PLAN VIGENTE -------------------------------------->

	<div class="md-modal md-effect-11" id="modalGruposVigente">
		<form id="formGV" action="javascript:registrarGrupo(true);" class="md-content" method="post">
			<h3>Agregar Grupos</h3>
			<div class="tblCatalogos">
				<table class="tblCatPlan">
					<tr>
						<td>Nombre:</td>
						<td>
							<input style="width: 40px; height: 30px; border-radius: 5px; border-color: #DBDBEA;" name="grupo_carrera" type="text" id="grupoCarreraV" maxlength="1"  readonly required/>
							<input style="width: 40px; height: 30px; border-radius: 5px; border-color: #DBDBEA;"  name="grupo_semestre" type="text" id="grupoSemestreV" maxlength="1"  readonly required/>
							<input style="width: 40px; height: 30px; border-radius: 5px; border-color: #DBDBEA;"  name="grupo_identificador" type="text" id="grupoIdentificadorV" maxlength="1" placeholder="1" required/>

						</td>
					</tr>
					<tr>
						<td>Turno:</td>
						<td>
							<select style="width:145px;" name="grupo_turno" id="grupoTurno" />
								@foreach ($turnos as $turno)
									<option value="{{$turno->turno}}">{{$turno->descripcion}}</option>
								@endforeach
							</select>
						</td>
					</tr>
					<tr>
						<td>Plan:</td>
						<td><label><div id="grupoPlanVigente">Plan XXXX-X</div></label></td>
					</tr>
					<tr>
						<td>Período:</td>
						<td><label><div class="grupoPer">XXXX-X</div></label></td>
					</tr>
					<tr>
						<td>Programa Educativo:</td>
						<td><label><div class="grupoPgr">Lic. Informática</div></label></td>
					</tr>
					<input type="hidden" name="grupo_plan" id="grupoVigentePlan"/>
					<input type="hidden" name="grupo_periodo" class="grupoPeriodo"/>
					<input type="hidden" name="grupo_programa" class="grupoPrograma"/>
				</table>
			</div>
			<div class="CatBotones">
				<input type="submit" class="estilo_button2" value="Guardar"/>
				<input type="button" value="Salir" class="md-close salirGrupo"/>
			</div>
		</form>
	</div>
	<div class="md-overlay"></div>

	<!------------------------------------------------------------------------------>

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
			Carga Académica: Registro Subsecuente
		</div>
		<div id="loginmanual">
			<div id="login" class="texto_body">
				<img src="../imagenes/login.png" alt="">&nbsp;<a href="<?=URL::to('login/logout');?>" style="text-decoration:none; color:#004000;">Logout</a>
			</div>
			<div id="manual" class="texto_body">
				<img src="../imagenes/manual.png" alt=""><a href="<?=URL::to('ayuda/ayudaca');?>"style="text-decoration:none; color:#004000;">&nbsp;Manual</a>
			</div>
		</div>
	</div>

	<section>
		
		<!-- REVISAR ESTE CONTENEDOR, PORQUE SI SE AGRANDAN LAS TABLAS SE SALDRIAN DEL CONTENEDOR, POR EL HEIGHT -->
		<div class="contenedorCa" style="height:2350px;">
		
		
			<div class="nombre_coordinacion" id="nombrePrograma"></div>
			<!--------------------- CONTROLES SUPERIOR DERECHO ------------------>

			<div class="ca_checkstatus">
				<input type="checkbox" style="height:18px; width:18px" name="checkSubdirector_ca" value="Generar">
				<label>Carga capturada</label>
			</div>


			<div class="periodoCa">
				<div class="consultar_admin"><span id="labelCarrera">Carrera:</span>
						<select class="con_estilo" style="width:135px; height:30px" name="carrera_admin" id="carreraAdmin">
							@foreach ($programas as $programa)
								<option value="{{$programa->programaedu}}">{{$programa->descripcion}}</option>
							@endforeach
						</select>
				</div>
				<div class="divPeriodo">
					Período:
					<select class="con_estilo" type="text" style="height:30px; width:135px;" name="periodo" id="periodo"/>
						@foreach ($codigosPeriodo as $periodo)
							<option value="{{$periodo['codigo']}}">{{$periodo['formato']}}</option>
						@endforeach
					</select>
					<!--<input type="button" class="md-trigger" value="+" data-modal="btnCatalogoPeriodo" id="btnCatalogoPeriodo" />-->
				</div>
				<div id="btn_copiarCa"><input type="button" class="md-trigger" value="COPIAR carga anterior" data-modal="btnCatalogoPeriodo" id="copiarCarga" /></div>
			</div>

			<div id="ca_nombrePeriodo">Período:<label>XXXX-X</label></div>

			<!------------------------------------ LISTA PLAN VIGENTE ------------------------------------>
		
			<div id="planVigente">
				<fieldset id="planV"><legend>Plan de estudios</legend>
					<div class="nombrePlan" id="nombreVigente">Plan XXXX-X</div>

					<div class="filtroMaterias_ca" style="float:left; width:200px;">
						Plan:
						<select class="con_estilo" style="width:135px; height:30px" id="selecciona_plan">
								@foreach($codigosPlanes as $plan)
									<option value="{{$plan['codigo']}}">{{$plan['formato']}}</option>
								@endforeach
						</select>
					</div>

					<div class="filtroMaterias_ca" style="float:left; width:250px; margin-left:30px;">
						Materias:
						<select class="con_estilo" style="width:135px; height:30px" id="selectCaracterVigente">
							@foreach($tiposCaracter as $caracter)
								<option value="{{$caracter->caracter}}">{{$caracter->descripcion}}</option>
							@endforeach
						</select>

					</div>
					<div class="listasCa">
						<div id="listaPlanVigente"></div>
					</div>
					<label>Semestre:</label>
					<select class="con_estilo" style="width:135px; height:30px; margin-top:40px;" id="semestresVigente">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
					</select>
					<div class="controlesListasCa">
						Grupos:
						<select name="gruposV[]" id="selectGruposVigente" multiple="multiple" class="grupos">
							<!--<option value="231" selected>231</option>-->
						</select>
						<input type="button" class="md-trigger" value="+" data-modal="modalGruposVigente" id="modalGruposVigente" />
						<!--<input type="button" class="md-trigger" value="UA" style="width:40px;" data-modal="btnAgregarUa" id="btnAgregarUa" />-->
						<input type="button" style="width:180px; margin-top:3px;" value="Actualizar Carga"  class="estilo_button2" name="btnGuardarCa" id="btnGuardarCargaV" />
					</div>
				</fieldset>
			</div>


			<!-------------------------------- REGISTROS SEMESTRE 1 -------------------------------->

			<table class="dd_tabla" id="semestre1" style="width:700px; margin-top:150px;">
				<thead class="dd_encabezado_tablaConsulta">
					<tr>
						<th>SEMESTRE: 1</th>
						<th>PLAN:</th>
					</tr>
				</thead>
				<thead class="dd_encabezado_colorBlanco_tablaConsulta">
					<tr>
						<th style="width:50px">CLAVE</th>
						<th style="width:300px">MATERIA</th>
						<th style="width:50px">NO. CRÉDITOS</th>
						<th style="width:50px">HC</th>
						<th style="width:100px">ETAPA</th>
						<th style="width:50px">REQ. SERIACION</th>
						<th style="width:30px">MODIFICAR</th>
						<th style="width:30px">ELIMINAR</th>
					</tr>
				</thead>
				<thead class="dd_encabezado_colorNaranja_tablaConsulta">
						<tr>
							<th colspan="8">OBLIGATORIAS</th>
						</tr>
				</thead>
				<tbody>
				</tbody>
				<thead class="dd_encabezado_colorNaranja_tablaConsulta">
						<tr>
							<th colspan="8">OPTATIVAS</th>
						</tr>
				</thead>
				<tbody>
				</tbody>
				<thead class="dd_encabezado_colorNaranja_tablaConsulta">
					<th colspan="2">GRUPOS Y TURNOS:</th>
				</thead>
				<tbody>
				</tbody>
			</table>
			<table class="dd_tabla" id="semestre2" style="margin-top:380px;">
				<thead class="dd_encabezado_tablaConsulta">
					<tr>
						<th>SEMESTRE: 2</th>
						<th>PLAN:</th>
					</tr>
				</thead>
				<thead class="dd_encabezado_colorBlanco_tablaConsulta">
					<tr>
						<th style="width:50px">CLAVE</th>
						<th style="width:300px">MATERIA</th>
						<th style="width:50px">NO. CRÉDITOS</th>
						<th style="width:50px">HC</th>
						<th style="width:100px">ETAPA</th>
						<th style="width:50px">REQ. SERIACION</th>
						<th style="width:30px">MODIFICAR</th>
						<th style="width:30px">ELIMINAR</th>
					</tr>
				</thead>
				<thead class="dd_encabezado_colorNaranja_tablaConsulta">
						<tr>
							<th colspan="8">OBLIGATORIAS</th>
						</tr>
				</thead>
				<tbody>
				</tbody>
				<thead class="dd_encabezado_colorNaranja_tablaConsulta">
						<tr>
							<th colspan="8">OPTATIVAS</th>
						</tr>
				</thead>
				<tbody>
				</tbody>
				<thead class="dd_encabezado_colorNaranja_tablaConsulta">
					<th colspan="2">GRUPOS Y TURNOS:</th>
				</thead>
				<tbody>
				</tbody>
			</table>
			<table class="dd_tabla" id="semestre3" style="margin-top:30px;">
				<thead class="dd_encabezado_tablaConsulta">
					<tr>
						<th>SEMESTRE: 3</th>
						<th>PLAN:</th>
					</tr>
				</thead>
				<thead class="dd_encabezado_colorBlanco_tablaConsulta">
					<tr>
						<th style="width:50px">CLAVE</th>
						<th style="width:300px">MATERIA</th>
						<th style="width:50px">NO. CRÉDITOS</th>
						<th style="width:50px">HC</th>
						<th style="width:100px">ETAPA</th>
						<th style="width:50px">REQ. SERIACION</th>
						<th style="width:30px">MODIFICAR</th>
						<th style="width:30px">ELIMINAR</th>
					</tr>
				</thead>
				<thead class="dd_encabezado_colorNaranja_tablaConsulta">
						<tr>
							<th colspan="8">OBLIGATORIAS</th>
						</tr>
				</thead>
				<tbody>
				</tbody>
				<thead class="dd_encabezado_colorNaranja_tablaConsulta">
						<tr>
							<th colspan="8">OPTATIVAS</th>
						</tr>
				</thead>
				<tbody>
				</tbody>
				<thead class="dd_encabezado_colorNaranja_tablaConsulta">
					<th colspan="2">GRUPOS Y TURNOS:</th>
				</thead>
				<tbody>
				</tbody>
			</table>
			<table class="dd_tabla" id="semestre4" style="margin-top:30px;">
				<thead class="dd_encabezado_tablaConsulta">
					<tr>
						<th>SEMESTRE: 4</th>
						<th>PLAN:</th>
					</tr>
				</thead>
				<thead class="dd_encabezado_colorBlanco_tablaConsulta">
					<tr>
						<th style="width:50px">CLAVE</th>
						<th style="width:300px">MATERIA</th>
						<th style="width:50px">NO. CRÉDITOS</th>
						<th style="width:50px">HC</th>
						<th style="width:100px">ETAPA</th>
						<th style="width:50px">REQ. SERIACION</th>
						<th style="width:30px">MODIFICAR</th>
						<th style="width:30px">ELIMINAR</th>
					</tr>
				</thead>
				<thead class="dd_encabezado_colorNaranja_tablaConsulta">
						<tr>
							<th colspan="8">OBLIGATORIAS</th>
						</tr>
				</thead>
				<tbody>
				</tbody>
				<thead class="dd_encabezado_colorNaranja_tablaConsulta">
						<tr>
							<th colspan="8">OPTATIVAS</th>
						</tr>
				</thead>
				<tbody>
				</tbody>
				<thead class="dd_encabezado_colorNaranja_tablaConsulta">
					<th colspan="2">GRUPOS Y TURNOS:</th>
				</thead>
				<tbody>
				</tbody>
			</table>
			<table class="dd_tabla" id="semestre5" style="margin-top:30px;">
				<thead class="dd_encabezado_tablaConsulta">
					<tr>
						<th>SEMESTRE: 5</th>
						<th>PLAN:</th>
					</tr>
				</thead>
				<thead class="dd_encabezado_colorBlanco_tablaConsulta">
					<tr>
						<th style="width:50px">CLAVE</th>
						<th style="width:300px">MATERIA</th>
						<th style="width:50px">NO. CRÉDITOS</th>
						<th style="width:50px">HC</th>
						<th style="width:100px">ETAPA</th>
						<th style="width:50px">REQ. SERIACION</th>
						<th style="width:30px">MODIFICAR</th>
						<th style="width:30px">ELIMINAR</th>
					</tr>
				</thead>
				<thead class="dd_encabezado_colorNaranja_tablaConsulta">
						<tr>
							<th colspan="8">OBLIGATORIAS</th>
						</tr>
				</thead>
				<tbody>
				</tbody>
				<thead class="dd_encabezado_colorNaranja_tablaConsulta">
						<tr>
							<th colspan="8">OPTATIVAS</th>
						</tr>
				</thead>
				<tbody>
				</tbody>
				<thead class="dd_encabezado_colorNaranja_tablaConsulta">
					<th colspan="2">GRUPOS Y TURNOS:</th>
				</thead>
				<tbody>
				</tbody>
			</table>
			<table class="dd_tabla" id="semestre6" style="margin-top:30px;">
				<thead class="dd_encabezado_tablaConsulta">
					<tr>
						<th>SEMESTRE: 6</th>
						<th>PLAN:</th>
					</tr>
				</thead>
				<thead class="dd_encabezado_colorBlanco_tablaConsulta">
					<tr>
						<th style="width:50px">CLAVE</th>
						<th style="width:300px">MATERIA</th>
						<th style="width:50px">NO. CRÉDITOS</th>
						<th style="width:50px">HC</th>
						<th style="width:100px">ETAPA</th>
						<th style="width:50px">REQ. SERIACION</th>
						<th style="width:30px">MODIFICAR</th>
						<th style="width:30px">ELIMINAR</th>
					</tr>
				</thead>
				<thead class="dd_encabezado_colorNaranja_tablaConsulta">
						<tr>
							<th colspan="8">OBLIGATORIAS</th>
						</tr>
				</thead>
				<tbody>
				</tbody>
				<thead class="dd_encabezado_colorNaranja_tablaConsulta">
						<tr>
							<th colspan="8">OPTATIVAS</th>
						</tr>
				</thead>
				<tbody>
				</tbody>
				<thead class="dd_encabezado_colorNaranja_tablaConsulta">
					<th colspan="2">GRUPOS Y TURNOS:</th>
				</thead>
				<tbody>
				</tbody>
			</table>
			<table class="dd_tabla" id="semestre7" style="margin-top:30px;">
				<thead class="dd_encabezado_tablaConsulta">
					<tr>
						<th>SEMESTRE: 7</th>
						<th>PLAN:</th>
					</tr>
				</thead>
				<thead class="dd_encabezado_colorBlanco_tablaConsulta">
					<tr>
						<th style="width:50px">CLAVE</th>
						<th style="width:300px">MATERIA</th>
						<th style="width:50px">NO. CRÉDITOS</th>
						<th style="width:50px">HC</th>
						<th style="width:100px">ETAPA</th>
						<th style="width:50px">REQ. SERIACION</th>
						<th style="width:30px">MODIFICAR</th>
						<th style="width:30px">ELIMINAR</th>
					</tr>
				</thead>
				<thead class="dd_encabezado_colorNaranja_tablaConsulta">
						<tr>
							<th colspan="8">OBLIGATORIAS</th>
						</tr>
				</thead>
				<tbody>
				</tbody>
				<thead class="dd_encabezado_colorNaranja_tablaConsulta">
						<tr>
							<th colspan="8">OPTATIVAS</th>
						</tr>
				</thead>
				<tbody>
				</tbody>
				<thead class="dd_encabezado_colorNaranja_tablaConsulta">
					<th colspan="2">GRUPOS Y TURNOS:</th>
				</thead>
				<tbody>
				</tbody>
			</table>
			<table class="dd_tabla" id="semestre8" style="margin-top:30px;">
				<thead class="dd_encabezado_tablaConsulta">
					<tr>
						<th>SEMESTRE: 8</th>
						<th>PLAN:</th>
					</tr>
				</thead>
				<thead class="dd_encabezado_colorBlanco_tablaConsulta">
					<tr>
						<th style="width:50px">CLAVE</th>
						<th style="width:300px">MATERIA</th>
						<th style="width:50px">NO. CRÉDITOS</th>
						<th style="width:50px">HC</th>
						<th style="width:100px">ETAPA</th>
						<th style="width:50px">REQ. SERIACION</th>
						<th style="width:30px">MODIFICAR</th>
						<th style="width:30px">ELIMINAR</th>
					</tr>
				</thead>
				<thead class="dd_encabezado_colorNaranja_tablaConsulta">
						<tr>
							<th colspan="8">OBLIGATORIAS</th>
						</tr>
				</thead>
				<tbody>
				</tbody>
				<thead class="dd_encabezado_colorNaranja_tablaConsulta">
						<tr>
							<th colspan="8">OPTATIVAS</th>
						</tr>
				</thead>
				<tbody>
				</tbody>
				<thead class="dd_encabezado_colorNaranja_tablaConsulta">
					<th colspan="2">GRUPOS Y TURNOS:</th>
				</thead>
				<tbody>
				</tbody>
			</table>
			<table class="dd_tabla" id="semestre9" style="margin-top:30px;">
				<thead class="dd_encabezado_tablaConsulta">
					<tr>
						<th>SEMESTRE: 9</th>
						<th>PLAN:</th>
					</tr>
				</thead>
				<thead class="dd_encabezado_colorBlanco_tablaConsulta">
					<tr>
						<th style="width:50px">CLAVE</th>
						<th style="width:300px">MATERIA</th>
						<th style="width:50px">NO. CRÉDITOS</th>
						<th style="width:50px">HC</th>
						<th style="width:100px">ETAPA</th>
						<th style="width:50px">REQ. SERIACION</th>
						<th style="width:30px">MODIFICAR</th>
						<th style="width:30px">ELIMINAR</th>
					</tr>
				</thead>
				<thead class="dd_encabezado_colorNaranja_tablaConsulta">
						<tr>
							<th colspan="8">OBLIGATORIAS</th>
						</tr>
				</thead>
				<tbody>
				</tbody>
				<thead class="dd_encabezado_colorNaranja_tablaConsulta">
						<tr>
							<th colspan="8">OPTATIVAS</th>
						</tr>
				</thead>
				<tbody>
				</tbody>
				<thead class="dd_encabezado_colorNaranja_tablaConsulta">
					<th colspan="2">GRUPOS Y TURNOS:</th>
				</thead>
				<tbody>
				</tbody>
			</table>

			<!-- <div id="ca_actualiza">
				<input type="button" style="width:180px;" value="Actualizar Carga"  class="estilo_button2" name="btnActualizarCa" id="btnActualizarCargaV" />
			</div> -->
			<!-------------------------------------------------------------------------------------------->

			<!-------------------------------------------TABLA DE RESUMEN PARA CADA CONSULTA -------------------------------------------->


					<table class="ca_tblResumenConsulta" style="margin-right:40px;">

						<thead class="ca_tblResumenEncabezado">

							<tr>
								<th colspan="2">UNIVERSIDAD AUTÓNOMA DE BAJA CALIFORNIA</th>
							</tr>

							<tr>
								<th colspan="2">FACULTAD DE CONTADURÍA Y ADMINISTRACIÓN</th>
							</tr>

						</thead>

							<tr>
								<td style="width:100px">DIRECTOR:</td>
								<td>BERNARDO DUARTE</td>
							</tr>

							<tr>
								<td style="width:100px">SUBDIRECTOR:</td>
								<td>MAGDALENA FRAUSTO FUENTES</td>
							</tr>

							<tr>
								<td style="width:100px">ADMINISTRADOR:</td>
								<td>BERNARDO DUARTE FRAUSTO</td>
							</tr>

							<tr>
								<td style="width:100px">COORDINADOR:</td>
								<td>VASTI MAGDALENA DUARTE FRAUSTO</td>
							</tr>

							<tr>
								<td style="width:100px">CRÉDITOS/PLAN:</td>
								<td>90</td>
							</tr>

							<tr>
								<td style="width:100px">OBLIGATORIAS:</td>
								<td>60</td>
							</tr>

							<tr>
								<td style="width:100px">OPTATIVAS:</td>
								<td>30</td>
							</tr>

							<tr>
								<td style="width:100px">TOTAL:</td>
								<td>90</td>
							</tr>
					</table>	
				</div>
		
	</section>

	<!---------------------------------------------------------------------------------------------------------------->

	<script type="text/javascript" src="../js/jqxcore.js"></script>
	<script type="text/javascript" src="../js/jqxbuttons.js"></script>
	<script type="text/javascript" src="../js/jqxscrollbar.js"></script>
	<script type="text/javascript" src="../js/jqxlistbox.js"></script>
	<script type="text/javascript" src="../js/jqxcheckbox.js"></script>

	<script type="text/javascript">
		var actualizar = false;
		var USERS_ID = $("#globalUserId").val();
		var PROGRAMAEDU = 0;
		var $loader = $("#ajaxLoad");
		var $buttonCopiar = $("#buttonCopiar");

		function insertStr(stringTarget,stringAdd,stringIndex)
		{
			var string1 = stringTarget.substring(0,stringIndex);
			var string2 = stringTarget.substring(stringIndex);

			return String(string1+stringAdd+string2);
		}

		function copiarCarga()
		{

			$buttonCopiar.attr("disabled",true).css('background-color','#C8C8C8');
			$loader.show();
			// Asignar usuario
			$("#periodoUsersId").val(USERS_ID);
			// Serializar formulario
			var dataCopia = $("#formCopiarCarga").serialize();
			// Crear copia con transacción para evitar inconsistencias en BD
			$.ajax({
				url : "<?php echo URL::to('cargaacademica/copiarcarga'); ?>",
				type: "post",
				data: dataCopia,
				success: function(periodo){
					//$loader.hide();
					$("#cargaCompleta").show();
					// Limpieza de controles
					$("#tablaCopiarCarga").find("input,select").val("");
					// Añadir periodo
					$("#periodo").append("<option value='" + periodo + "'>" + insertStr(periodo,"-",4) + "</option>");
					$("#periodo").val(periodo);
					// Consultar carga
					obtenerCarga(periodo,PROGRAMAEDU);

				},
				error: function(errorText,textError,errorThrow){
					alert(errorText.responseText);
				},
				complete:function(){
					$loader.hide();
					$buttonCopiar.attr("disabled",false).css('background-color','#004000');
				}
			});
		}

		function obtenerCarga(periodo,programa)
		{
			// Obtene la carga academica si existe en el momento
			//alert(programa);
			$.post("<?php echo URL::to('cargaacademica/obtenercarga'); ?>",{periodo:periodo,programa:programa},function(data){
				// Limpiar tablas y encabezado de las mismas
				$("#semestre1 tbody,#semestre2 tbody,#semestre3 tbody,#semestre4 tbody,#semestre5 tbody,#semestre6 tbody,#semestre7 tbody,#semestre8 tbody,#semestre9 tbody").html("");
				$(".dd_encabezado tr th:eq(1)").empty();

				for (var i = 0; i < data.uas.length; i++)
				{
					var renglon = "";
					// Poner en la seccion correspondiente de la tabla si es obligatoria:1 o seriada:2.
					var ua = data.uas[i].uaprendizaje;
					var semestreua = data.uas[i].semestre;

					renglon = "<tr>" +
								"<td>" + data.uas[i].uaprendizaje + "</td>" +
								"<td>" + data.uas[i].descripcionmat + " - " + data.uas[i].grupos + "</td>" +
								"<td>" + data.uas[i].creditos + "</td>" +
								"<td>" + data.uas[i].HC + "</td>" +
								"<td>" + data.uas[i].etapa + "</td>" +
								"<td>" + ((data.uas[i].series == null) ? "SIN SERIACION" : data.uas[i].series) + "</td>" +
								"<td>" + "<input type='button' class='md-trigger clsModificarFila' data-modal='pruebaCa' programa='" + programa + "' periodo='" + periodo + "' semestre='" + semestreua + "' uaprendizaje='" + ua + "' />" + "</td>" +
								"<td>" + "<input type='button' value='-' title='Eliminar' class='clsEliminarFila' id='eliminar' semestre='" + semestreua + "'/>" + "</td>" +
							  "</tr>";

					if (data.uas[i].caracter == 1)
					{
						$("#semestre"+data.uas[i].semestre+" tbody:eq(0)").append(renglon);
					}
					else
					{
						$("#semestre"+data.uas[i].semestre+" tbody:eq(1)").append(renglon);
					}
				}
				// Para generar los grupos de la carga
				for (var i = 0; i < data.grupos.length; i++)
				{
					var grupoTurno = $("#semestre" + data.grupos[i].semestre + " tbody:eq(2) tr td").text();
					if(grupoTurno.length == 0)
						grupoTurno += data.grupos[i].grupo + " ";
					else
						grupoTurno += ", "+data.grupos[i].grupo;
					$("#semestre" + data.grupos[i].semestre + " tbody:eq(2)").html("<tr><td colspan='2'>"+grupoTurno+"</td></tr>");
				}

				// Para mostrar el plan al que pertenece la carga de cada semestre
				for (var i = 0; i < data.planSemestres.length; i++)
				{
					$("#semestre" + data.planSemestres[i].semestre + " .dd_encabezado").find("th:eq(1)").text("PLAN: " + insertStr(String(data.planSemestres[i].plan),"-",4));
				}

				// Activar modales en la modificacion de las filas
				//activarModal();
			})
			.fail(function(errorText,textError,errorThrow){
				alert(errorText.responseText);
			});
		}


	</script>

	<script type="text/javascript">
			$(document).ready(function () {
				// Limpiar controles
				$("#selecciona_plan").val("");
				$("#periodo").val("");
				$("#carreraAdmin").val("");
				// Inicializar controles
				var $buttonCopiarCA = $("#btn_copiarCa").hide();
				var $labelPeriodoCopia = $("#labelPeriodoCopia");
				$("#cargaCompleta").hide();
				// Create a jqxListBox

				$("#listaPlanVigente").jqxListBox({width: 480,  checkboxes: true, height: 330, theme: 'orange'});

				$("#carreraAdmin").on("change",function(event){
					event.preventDefault();
					$buttonCopiarCA.hide();
					PROGRAMAEDU = $("#carreraAdmin").val();
					console.log(PROGRAMAEDU);

					$.ajax({
						url: "<?php echo URL::to('cargaacademica/ultimoperiodo'); ?>",
						type: "post",
						data: {programaedu: PROGRAMAEDU},
						success:function(periodo){
							if(periodo === 0)
							{
								alert("No existe una carga anterior para el programa educativo seleccionado.");
							}
							else
							{
								$buttonCopiarCA.show();
								$labelPeriodoCopia.text(insertStr(periodo,'-',4));
								$("#programaCopia").val(PROGRAMAEDU);
								$("#periodoCopia").val(periodo);
							}

						},
						error:function(errorText,textError,errorThrow){
							alert("Error: " + errorText.responseText);
						}
					});


				});
			});
		</script>





	<footer>
			<!--<div id="pie_correo">email: emma.castillejos@uabc.edu.mx</div>
			<div id="pie_tel">Teléfono: 664 188 9221</div>-->

	</footer>
		<!--SCRIPT PARA VENTANA MODAL-->
	<script src="../js/classie.js"></script>
	<script src="../js/modalEffects.js"></script>


</body>
</html>