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




 <!-- PARA LISTA DENTRO DE MODAL, PARA MODIFICAR GRUPOS -->
	<script type="text/javascript">
			$(function () {

				// Create a jqxListBox
				$("#listaUa").jqxListBox({width: 250, checkboxes: true, height: 300, theme: 'orange'});

				/* Check several items.
				$("#listaUa").jqxListBox('checkIndex', 0);
				$("#listaUa").jqxListBox('checkIndex', 1);
				$("#listaUa").jqxListBox('checkIndex', 2);
				$("#listaUa").jqxListBox('checkIndex', 5);*/

				/*$("#listaUa").on('checkChange', function (event) {
					var args = event.args;
					if (args.checked) {
						$("#Events").text("Checked: " + args.label);
					}
					else {
						$("#Events").text("Unchecked: " + args.label);
					}

					var items = $("#listaUa").jqxListBox('getCheckedItems');
					var checkedItems = "";
					$.each(items, function (index) {
						if (index < items.length - 1) {
							checkedItems += this.label + ", ";
						}
						else checkedItems += this.label;
					});
					$("#CheckedItems").text(checkedItems);
				});*/
			});
	</script>

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
		$('.grupos').multiselect(configurationOptativo);
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
	<input type="hidden" name="user_programa" id="userPrograma" value="{{Auth::user()->programaedu}}"/>
	<input type="hidden" name="user_id" id="userID" value="{{Auth::user()->id}}"/>

	<!-------------------------------------- MODAL LISTA PARA MODIFICAR GRUPOS -------------------------------------->
	<div class="md-modal2 md-effect-11" id="pruebaCa">
		<form  id="formActualizarGrupos" action="javascript: actualizarGrupos()" class="md-content" method="post">
			<h3>Modificar grupos</h3>
			<div class="tblCatalogos">
				<div class="listasCa">
					<div id="listaUa" style="margin-top:40px; margin-left:5px;"></div>
				</div>
			</div>
			<div class="CatBotones">
				<input type="hidden" name="grupos_programa" id="actualizarGruposPrograma" />
				<input type="hidden" name="grupos_periodo" id="actualizarGruposPeriodo"/>
				<input type="hidden" name="grupos_semestre" id="actualizarGruposSemestre"/>
				<input type="hidden" name="grupos_uaprendizaje" id="actualizarGruposUaprendizaje"/>
				<input type="hidden" name="grupos_userid" id="actualizarGruposUserId" />
				<input type="hidden" name="grupos_grupos" id="actualizarGruposGrupos" />

				<input style="font-size:18px;" type="submit" class="estilo_button2" value="Actualizar"/>
				<input style="font-size:18px;" type="button" value="Salir" class="md-close" />
			</div>
		</form>
	</div>



	<!-------------------------------- MODAL CATALOGO PERIODOS -------------------------------->

	<div class="md-modal md-effect-11" id="btnCatalogoPeriodo">
		<form id="formPeriodo" action="javascript:registrarPeriodo();" class="md-content" method="post">
			<h3>Agregar Período</h3>
			<div class="tblCatalogos">
				<table class="tblCatPlan">
					<tr>
						<td>Nombre:</td>
						<td><input style="width: 100px; height: 30px; border-radius: 5px; border-color: #DBDBEA;" name="periodoAnio" type="text" id="periodoAnio" maxlength="4" placeholder="2014" required/>&nbsp;-&nbsp;<input style="width: 80px; height: 30px; border-radius: 5px; border-color: #DBDBEA;"  name="periodoLapso" type="text" id="perdiodoLapso" maxlength="1" placeholder="1" required/></td>
					</tr>
					<tr>
						<td>Tipo Programa:</td>
						<td>
							<select style="width:200px;" name="periodoTipo" id="periodoTipo" />
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
			<div class="CatBotones">
				<input type="hidden" name="periodoUsersId" id="periodoUsersId"/>
				<input type="submit" class="estilo_button2" value="Guardar"/>
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
						<td><label><div class="grupoPgr">Lic. XXXXXXXX</div></label></td>
					</tr>
					<input type="hidden" name="grupo_usersid" class="grupoUsersId">
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

	<!-------------------------------------- MODAL CATALOGO GRUPOS PLAN ANTERIOR -------------------------------------->

	<div class="md-modal md-effect-11" id="modalGruposAnterior">
		<form id="formGA" action="javascript:registrarGrupo(false);" class="md-content" method="post">
			<h3>Agregar Grupos</h3>
			<div class="tblCatalogos">
				<table class="tblCatPlan">
					<tr>
						<th></th>
						<th></th>
					</tr>
					<tr>
						<td>Nombre:</td>
						<td>
							<input style="width: 40px; height: 30px; border-radius: 5px; border-color: #DBDBEA;" name="grupo_carrera" type="text" id="grupoCarreraA" maxlength="1"  readonly required/>
							<input style="width: 40px; height: 30px; border-radius: 5px; border-color: #DBDBEA;"  name="grupo_semestre" type="text" id="grupoSemestreA" maxlength="1"  readonly required/>
							<input style="width: 40px; height: 30px; border-radius: 5px; border-color: #DBDBEA;"  name="grupo_identificador" type="text" id="grupoIdentificadorA" maxlength="1" placeholder="1" required/>
						</td>
					</tr>
					<tr>
						<td>Turno:</td>
						<td>
							<select style="width:200px;" name="grupo_turno" id="grupoTurno" />
								@foreach ($turnos as $turno)
									<option value="{{$turno->turno}}">{{$turno->descripcion}}</option>
								@endforeach
							</select>
						</td>
					</tr>
					<tr>
						<td>Plan:</td>
						<td><label><div id="grupoPlanAnterior">Plan XXXX-X</div></label></td>
					</tr>
					<tr>
						<td>Período:</td>
						<td><label><div class="grupoPer">XXXX-X</div></label></td>
					</tr>
					<tr>
						<td>Programa Educativo:</td>
						<td><label><div class="grupoPgr">Lic. XXXXXXXX</div></label></td>
					</tr>
					<input type="hidden" name="grupo_usersid" class="grupoUsersId">
					<input type="hidden" name="grupo_plan" id="grupoAnteriorPlan"/>
					<input type="hidden" name="grupo_periodo" class="grupoPeriodo"/>
					<input type="hidden" name="grupo_programa" class="grupoPrograma"/>
				</table>
			</div>
			<div class="CatBotones">
				<input type="submit" class="estilo_button2" value="Guardar"/>
				<input type="button" value="Salir" class="md-close salirGrupo" />
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
			Carga Académica: Registro Inicial
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
		<div class="contenedor_Ca">

			<div class="nombre_coordinacion" id="nombrePrograma"></div>
			<!--------------------- CONTROLES SUPERIOR DERECHO ------------------>
			<div class="ca_checkstatus">
				<input type="checkbox" style="height:18px; width:18px" name="checkSubdirector_ca" value="Generar">
				<label>Carga capturada</label>
			</div>

			<div class="periodoCa">

				<div class="divPeriodo">
					Periódo:
					<select type="text" class="con_estilo" style="height:25px" name="periodo" id="periodo">
						@foreach ($codigosPeriodo as $periodo)
							<option value="{{$periodo['codigo']}}">{{$periodo['formato']}}</option>
						@endforeach
					</select>
					<input type="button" class="md-trigger" value="+" data-modal="btnCatalogoPeriodo" id="btnCatalogoPeriodo" />
				</div>


				<div class="consultar_admin"><span id="labelCarrera">Carrera:</span>
					@if (Auth::user()->programaedu == 0)
					<select class="con_estilo" style="width:135px; height:30px" name="carrera_admin" id="carreraAdmin">
						@foreach ($programas as $programa)
							<option value="{{$programa->programaedu}}">{{$programa->descripcion}}</option>
						@endforeach
					</select>
					@endif
				</div>
			</div>





			<!------------------------------------ LISTA PLAN VIGENTE ------------------------------------>
			<div id="planVigente">
				<fieldset id="planV"><legend>Plan vigente</legend>
					<div class="nombrePlan" id="nombreVigente">Plan XXXX-X</div>
					<div class="filtroMaterias_ca">
						Materias:
						<select class="con_estilo" style="width:135px; height:30px" id="selectCaracterVigente">
							@foreach ($tiposCaracter as $caracter)
								<option value="{{$caracter->caracter}}">{{$caracter->descripcion}}</option>
							@endforeach
						</select>

					</div>
					<div class="listasCa">
						<div id="listboxPlanVigente"></div>
					</div>
					<label>Semestre:</label>
					<select class="con_estilo" style="width:135px; height:30px" id="semestresVigente">
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
						<input type="button" style="width:180px" value="Generar Carga"  class="estilo_button2" name="btnGuardarCa" id="btnGuardarCargaV" />
					</div>
				</fieldset>
			</div>
			<!----------------------- BOTON PLAN ANTERIOR ------------------------>
			<div id="btnPlanA">
				<input type="button" style="width:200px;" class="estilo_button2" value="Borrar Carga" name="planAntCa" id="planAntCa" />
			</div>


			<!-- <input type="button" style="width:200px;" class="md-trigger" value="Prueba" data-modal="pruebaCa" id="pruebaCa" /> -->





			<!----------------------- LISTA PLAN ANTERIOR ------------------------>
			<div id="planAnterior">
				<fieldset id="planA"><legend>Plan anterior </legend>
					<div class="nombrePlan" id="nombreAnterior">Plan XXXX-X</div>
					<div class="filtroMaterias_ca">
						Materias:
						<select class="con_estilo" style="width:135px; height:30px" name="semestre_ca" id="selectCaracterAnterior">
							@foreach ($tiposCaracter as $caracter)
								<option value="{{$caracter->caracter}}">{{$caracter->descripcion}}</option>
							@endforeach
						</select>

					</div>
					<div class="listasCa">
						 <div id="listboxPlanAnterior"></div>
					</div>
					<label>Semestre: </label>
					<select class="con_estilo" style="width:135px; height:30px" id="semestresAnterior">
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
						<select name="gruposA[]" id="selectGruposAnterior" multiple="multiple" class="grupos" >
							<!--<option value="231" selected>231</option>-->
						</select>
						<input type="button" class="md-trigger" value="+" data-modal="modalGruposAnterior" id="modalGruposAnterior" />
						<input type="button" style="width:180px" value="Generar Carga"  class="estilo_button2" name="btnGuardarCa" id="btnGuardarCargaA" />
					</div>
				</fieldset>
			</div>
			<!---------------------------------- REGISTROS DE CARGA ACADEMICA ---------------------------------->
			<div id="contenedorRegistroca_mostrar">
				<a id="botonAll" class="btnStyleAllTable">Todos</a>
				<!-------------------------------- REGISTROS SEMESTRE 1 -------------------------------->
				<table class="dd_tabla" id="semestre1">
					<thead class="dd_encabezado">
						<tr>
							<th>SEMESTRE: 1</th>
							<th></th>
						</tr>
					</thead>

					<thead class="dd_encabezado_colorVerde">

						<tr>
							<th style="width:150px">CLAVE</th>
							<th style="width:500px">MATERIA</th>
							<th style="width:50px">NO. CREDITOS</th>
							<th style="width:50px">HC</th>
							<th style="width:130px">ETAPA</th>
							<th style="width:70px">REQ. SERIACION</th>
							<th style="width:50px">MODIFICAR</th>
							<th style="width:50px">ELIMINAR</th>
						</tr>
					</thead>
					<thead class="dd_encabezado_colorVerde">
						<tr>
							<th colspan="8">OBLIGATORIAS</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
					<thead class="dd_encabezado_colorVerde">
						<tr>
							<th colspan="8">OPTATIVAS</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
					<thead class="dd_encabezado_colorVerdeClaro">
						<tr>
							<th colspan="2">GRUPOS Y TURNOS:</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			<!-------------------------------- REGISTROS SEMESTRE 1 -------------------------------->

			<!-------------------------------- REGISTROS SEMESTRE 2 -------------------------------->
				<table class="dd_tabla" id="semestre2">
					<thead class="dd_encabezado">
						<tr>
							<th>SEMESTRE: 2</th>
							<th></th>
						</tr>
					</thead>

					<thead class="dd_encabezado_colorNaranja">

						<tr>
							<th style="width:150px">CLAVE</th>
							<th style="width:500px">MATERIA</th>
							<th style="width:50px">NO. CREDITOS</th>
							<th style="width:50px">HC</th>
							<th style="width:130px">ETAPA</th>
							<th style="width:70px">REQ. SERIACION</th>
							<th style="width:50px">MODIFICAR</th>
							<th style="width:50px">ELIMINAR</th>
						</tr>
					</thead>
					<thead class="dd_encabezado_colorNaranja">
						<tr>
							<th colspan="8">OBLIGATORIAS</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
					<thead class="dd_encabezado_colorNaranja">
						<tr>
							<th colspan="8">OPTATIVAS</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
					<thead class="dd_encabezado_colorVerdeClaro">
						<tr>
							<th colspan="2">GRUPOS Y TURNOS:</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			<!-------------------------------- REGISTROS SEMESTRE 2 -------------------------------->

			<!-------------------------------- REGISTROS SEMESTRE 3 -------------------------------->
				<table class="dd_tabla" id="semestre3">
					<thead class="dd_encabezado">
						<tr>
							<th>SEMESTRE: 3</th>
							<th></th>
						</tr>
					</thead>

					<thead class="dd_encabezado_colorVerde">

						<tr>
							<th style="width:150px">CLAVE</th>
							<th style="width:500px">MATERIA</th>
							<th style="width:50px">NO. CREDITOS</th>
							<th style="width:50px">HC</th>
							<th style="width:130px">ETAPA</th>
							<th style="width:70px">REQ. SERIACION</th>
							<th style="width:50px">MODIFICAR</th>
							<th style="width:50px">ELIMINAR</th>

						</tr>
					</thead>
					<thead class="dd_encabezado_colorVerde">
						<tr>
							<th colspan="8">OBLIGATORIAS</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
					<thead class="dd_encabezado_colorVerde">
						<tr>
							<th colspan="8">OPTATIVAS</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
					<thead class="dd_encabezado_colorVerdeClaro">
						<tr>
							<th colspan="2">GRUPOS Y TURNOS:</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			<!-------------------------------- REGISTROS SEMESTRE 3 -------------------------------->

			<!-------------------------------- REGISTROS SEMESTRE 4 -------------------------------->
				<table class="dd_tabla" id="semestre4">
					<thead class="dd_encabezado">
						<tr>
							<th>SEMESTRE: 4</th>
							<th></th>
						</tr>
					</thead>

					<thead class="dd_encabezado_colorNaranja">

						<tr>
							<th style="width:150px">CLAVE</th>
							<th style="width:500px">MATERIA</th>
							<th style="width:50px">NO. CREDITOS</th>
							<th style="width:50px">HC</th>
							<th style="width:130px">ETAPA</th>
							<th style="width:70px">REQ. SERIACION</th>
							<th style="width:50px">MODIFICAR</th>
							<th style="width:50px">ELIMINAR</th>
						</tr>
					</thead>
					<thead class="dd_encabezado_colorNaranja">
						<tr>
							<th colspan="8">OBLIGATORIAS</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
					<thead class="dd_encabezado_colorNaranja">
						<tr>
							<th colspan="8">OPTATIVAS</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
					<thead class="dd_encabezado_colorVerdeClaro">
						<tr>
							<th colspan="2">GRUPOS Y TURNOS:</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			<!-------------------------------- REGISTROS SEMESTRE 4 -------------------------------->

			<!-------------------------------- REGISTROS SEMESTRE 5 -------------------------------->
				<table class="dd_tabla" id="semestre5">
					<thead class="dd_encabezado">
						<tr>
							<th>SEMESTRE: 5</th>
							<th></th>
						</tr>
					</thead>


					<thead class="dd_encabezado_colorVerde">

						<tr>
							<th style="width:150px">CLAVE</th>
							<th style="width:500px">MATERIA</th>
							<th style="width:50px">NO. CREDITOS</th>
							<th style="width:50px">HC</th>
							<th style="width:130px">ETAPA</th>
							<th style="width:70px">REQ. SERIACION</th>
							<th style="width:50px">MODIFICAR</th>
							<th style="width:50px">ELIMINAR</th>
						</tr>
					</thead>
					<thead class="dd_encabezado_colorVerde">
						<tr>
							<th colspan="8">OBLIGATORIAS</th>

						</tr>
					</thead>
					<tbody>
					</tbody>
					<thead class="dd_encabezado_colorVerde">
						<tr>
							<th colspan="8">OPTATIVAS</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
					<thead class="dd_encabezado_colorVerdeClaro">
						<tr>
							<th colspan="2">GRUPOS Y TURNOS:</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			<!-------------------------------- REGISTROS SEMESTRE 5 -------------------------------->

			<!-------------------------------- REGISTROS SEMESTRE 6 -------------------------------->
				<table class="dd_tabla" id="semestre6">
					<thead class="dd_encabezado">
						<tr>
							<th>SEMESTRE: 6</th>
							<th></th>
						</tr>
					</thead>

					<thead class="dd_encabezado_colorNaranja">

						<tr>
							<th style="width:150px">CLAVE</th>
							<th style="width:500px">MATERIA</th>
							<th style="width:50px">NO. CREDITOS</th>
							<th style="width:50px">HC</th>
							<th style="width:130px">ETAPA</th>
							<th style="width:70px">REQ. SERIACION</th>
							<th style="width:50px">MODIFICAR</th>
							<th style="width:50px">ELIMINAR</th>
						</tr>
					</thead>
					<thead class="dd_encabezado_colorNaranja">
						<tr>
							<th colspan="8">OBLIGATORIAS</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
					<thead class="dd_encabezado_colorNaranja">
						<tr>
							<th colspan="8">OPTATIVAS</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
					<thead class="dd_encabezado_colorVerdeClaro">
						<tr>
							<th colspan="2">GRUPOS Y TURNOS:</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			<!-------------------------------- REGISTROS SEMESTRE 6 -------------------------------->

			<!-------------------------------- REGISTROS SEMESTRE 7 -------------------------------->
				<table class="dd_tabla" id="semestre7">
					<thead class="dd_encabezado">
						<tr>
							<th>SEMESTRE: 7</th>
							<th></th>
						</tr>
					</thead>

					<thead class="dd_encabezado_colorVerde">

						<tr>
							<th style="width:150px">CLAVE</th>
							<th style="width:500px">MATERIA</th>
							<th style="width:50px">NO. CREDITOS</th>
							<th style="width:50px">HC</th>
							<th style="width:130px">ETAPA</th>
							<th style="width:70px">REQ. SERIACION</th>
							<th style="width:50px">MODIFICAR</th>
							<th style="width:50px">ELIMINAR</th>
						</tr>

					</thead>
					<thead class="dd_encabezado_colorVerde">
						<tr>
							<th colspan="8">OBLIGATORIAS</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
					<thead class="dd_encabezado_colorVerde">
						<tr>
							<th colspan="8">OPTATIVAS</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
					<thead class="dd_encabezado_colorVerdeClaro">
						<tr>
							<th colspan="2">GRUPOS Y TURNOS:</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			<!-------------------------------- REGISTROS SEMESTRE 7 -------------------------------->

			<!-------------------------------- REGISTROS SEMESTRE 8 -------------------------------->
				<table class="dd_tabla" id="semestre8">
					<thead class="dd_encabezado">
						<tr>
							<th>SEMESTRE: 8</th>
							<th></th>
						</tr>
					</thead>

					<thead class="dd_encabezado_colorNaranja">

						<tr>
							<th style="width:150px">CLAVE</th>
							<th style="width:500px">MATERIA</th>
							<th style="width:50px">NO. CREDITOS</th>
							<th style="width:50px">HC</th>
							<th style="width:130px">ETAPA</th>
							<th style="width:70px">REQ. SERIACION</th>
							<th style="width:50px">MODIFICAR</th>
							<th style="width:50px">ELIMINAR</th>
						</tr>
					</thead>
					<thead class="dd_encabezado_colorNaranja">
						<tr>
							<th colspan="8">OBLIGATORIAS</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
					<thead class="dd_encabezado_colorNaranja">
						<tr>
							<th colspan="8">OPTATIVAS</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
					<thead class="dd_encabezado_colorVerdeClaro">
						<tr>
							<th colspan="2">GRUPOS Y TURNOS:</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			<!-------------------------------- REGISTROS SEMESTRE 8 -------------------------------->

			<!-------------------------------- REGISTROS SEMESTRE 9 -------------------------------->
				<table class="dd_tabla" id="semestre9">
					<thead class="dd_encabezado">
						<tr>
							<th>SEMESTRE: 9</th>
							<th></th>
						</tr>
					</thead>

					<thead class="dd_encabezado_colorVerde">

						<tr>
							<th style="width:150px">CLAVE</th>
							<th style="width:500px">MATERIA</th>
							<th style="width:50px">NO. CREDITOS</th>
							<th style="width:50px">HC</th>
							<th style="width:130px">ETAPA</th>
							<th style="width:70px">REQ. SERIACION</th>
							<th style="width:50px">MODIFICAR</th>
							<th style="width:50px">ELIMINAR</th>
						</tr>
					</thead>
					<thead class="dd_encabezado_colorVerde">
						<tr>
							<th colspan="8">OBLIGATORIAS</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
					<thead class="dd_encabezado_colorVerde">
						<tr>
							<th colspan="8">OPTATIVAS</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
					<thead class="dd_encabezado_colorVerdeClaro">
						<tr>
							<th colspan="2">GRUPOS Y TURNOS:</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			<!-------------------------------- REGISTROS SEMESTRE 9 -------------------------------->
			<!--<div id="btnGuardarCa_registro">
				<input type="button" style="width:180px" value="Guardar Carga"  class="estilo_button2" name="btnGuardarCa" id="btnGuardarCa" />
			</div>-->
		</div>
	</section>

	<script type="text/javascript" src="../js/jqxcore.js"></script>
	<script type="text/javascript" src="../js/jqxbuttons.js"></script>
	<script type="text/javascript" src="../js/jqxscrollbar.js"></script>
	<script type="text/javascript" src="../js/jqxlistbox.js"></script>
	<script type="text/javascript" src="../js/jqxcheckbox.js"></script>
	<footer>
			<!--<div id="pie_correo">email: emma.castillejos@uabc.edu.mx</div>
			<div id="pie_tel">Teléfono: 664 188 9221</div>-->

	</footer>
	<script type="text/javascript">
		/******************** SCRIPTS DE FUNCIONES GENERALES DEL SISTEMA ********************/
		var planVigente = 0;
		var planAnterior = 0;
		var uasVigente = [];
		var uasAnterior = [];
		var actualizar = false;
		var renglonActualizarGrupos;

		var NUM_PROGRAMA = 0;
		var USERS_ID = 0;

		function insertStr(stringTarget,stringAdd,stringIndex)
		{
			var string1 = stringTarget.substring(0,stringIndex);
			var string2 = stringTarget.substring(stringIndex);

			return String(string1+stringAdd+string2);
		}

		Date.prototype.now = function(){
				var dd = this.getDate();
				var mm = this.getMonth()+1;
				var yyyy = this.getFullYear();
				if(dd<10) dd='0'+dd;
				if(mm<10) mm='0'+mm;
				return String(yyyy+"-"+mm+"-"+dd);
		};

		function activarModal()
		{
			var overlay = document.querySelector( '.md-overlay' );

			[].slice.call( document.querySelectorAll( '.md-trigger' ) ).forEach( function( el, i )
			{

				var modal = document.querySelector( '#' + el.getAttribute( 'data-modal' ) ),
					close = modal.querySelector( '.md-close' );

				function removeModal( hasPerspective ) {
					classie.remove( modal, 'md-show' );

					if( hasPerspective ) {
						classie.remove( document.documentElement, 'md-perspective' );
					}
					// Si es guardar limpiar campos
					if($("#guardar").val()=="Guardar")
					{
						reset_campos();
					}
					else{

					}
					// Optimizar esta parte con una bandera de actualizacion
					if($("#limpiar").val()=="Cancelar")
						$("#limpiar").click();

					//ActualizarUAS($("#noPlan").val());
				}

				function removeModalHandler() {
					// Condicion de los rows
					//if($("#select_carreras").val()==null)
					//	return;
					removeModal( classie.has( el, 'md-setperspective' ) );
				}

				el.addEventListener( 'click', function( ev ) {
					classie.add( modal, 'md-show' );
					overlay.removeEventListener( 'click', removeModalHandler );
					overlay.addEventListener( 'click', removeModalHandler );

					if( classie.has( el, 'md-setperspective' ) ) {
						setTimeout( function() {
							classie.add( document.documentElement, 'md-perspective' );
						}, 25 );
					}
				});

				close.addEventListener( 'click', function( ev ) {
					ev.stopPropagation();
					removeModalHandler();
				});
			});
		}

		/**
		 * Funcion que permite registrar un periodo para generar la carga academica
		 * @return {null} No regresa ningun valor
		 */
		function registrarPeriodo()
		{
			var dataPeriodo = $("#formPeriodo").serialize();
			// Asignar usuario
			//$("#periodoUsersId").val(USERS_ID);

			$.post("<?php echo URL::to('cargaacademica/registrarperiodo'); ?>",dataPeriodo,function(result){
				var option = "<option value='"+ result['periodo'] +"'>"  + insertStr(result['periodo'],"-",4) + "</option>";
				$("#periodo").append(option);
				$("#periodo").val(result['periodo']);


				alert("Periodo dado de alta exitosamente!!!");
				$("#salirPeriodo").click();

			})
			.fail(function(errorText,textError,errorThrow){
				alert(errorText.responseText);
			});
		}

		/**
		 * Funcion para registrar un grupo en la carga actual
		 * @param  {bool} vigente Verifica si es un grupo del plan vigente o anterior
		 * @return {null}         No reguresa ningun tipo de valor
		 */
		function registrarGrupo(vigente)
		{
			var dataGrupo;
			if(vigente == true)
			{
				dataGrupo = $("#formGV").serialize();
			}
			else
			{
				dataGrupo = $("#formGA").serialize();
			}

			$.post("<?php echo URL::to('cargaacademica/registrargrupo'); ?>",dataGrupo,function(result){
				if(vigente == true)
				{
					$("#selectGruposVigente").append("<option value="+result+" >"+result+"</option>");
					$('.grupos').multiselect('rebuild');
					if($("#selectCaracterVigente").val()==1)
					{
						marcar_carreras($("#selectGruposVigente"));
					}
				}
				else
				{
					$("#selectGruposAnterior").append("<option value="+result+" >"+result+"</option>");
					$('.grupos').multiselect('rebuild');
					if($("#selectCaracterAnterior").val()==1)
					{
						marcar_carreras($("#selectGruposAnterior"));
					}
				}
				//alert(result); Verificar el grupo registrado
				alert("Grupo dado de alta");
				$(".salirGrupo").click();

			})
			.fail(function(errorText,textError,errorThrow){
				alert(errorText.responseText);
			});
		}

		function actualizarGrupos()
		{
			// Obtener renglon para la actualización
			var tdGrupos = $(renglonActualizarGrupos).find("td:eq(1)");
			var textoGrupos = $(tdGrupos).text();
			// Obtener grupos seleccionados
			var grupos = $("#listaUa").jqxListBox("getCheckedItems");
			var gruposActualizar = [];
			$.each(grupos,function(index, valor){
				gruposActualizar.push(valor.value.substr(0,3));
			});

			if(gruposActualizar.length == 0)
			{
				alert("Debes seleccionar por lo menos un grupos para continuar...");
				return;
			}
			// Grupos seleccionados por el usuario
			$("#actualizarGruposGrupos").val(gruposActualizar);

			// Serializar información
			var dataGrupos = $("#formActualizarGrupos").serialize();
			console.log(dataGrupos);

			// Actualizar grupos
			$.ajax({
				url : "<?php echo URL::to('cargaacademica/actualizargrupos') ?>",
				type: "post",
				data: dataGrupos,
				success: function(grupos){
					textoGrupos = textoGrupos.substring(0,textoGrupos.indexOf('-') + 1);
					textoGrupos += ' ' + grupos;
					$(tdGrupos).text(textoGrupos);
					alert("Grupos actualizados correctamente");
					$(".md-close").click();
				},
				error: function(errorText,textError,errorThrow){
					alert("Error: " + errorText.responseText);
				}
			});
		}

		function desmarcar_carreras(selectGrupos)
		{
			// Limpiar Control
			$('option',selectGrupos).each(function(element) {
				$(selectGrupos).multiselect('deselect', $(this).val());
			});
			$(selectGrupos).multiselect("refresh");
			// Habilitar Carreras
			$(selectGrupos).find("option").removeAttr('disabled');
			$(selectGrupos).multiselect('refresh');
		}
		function marcar_carreras(selectGrupos)
		{
			// Revisar cada option
			$('option',selectGrupos).each(function(element){
				$(selectGrupos).multiselect('select',$(this).val()); // Seleccionar option
				//$(selectGrupos).find('option').attr('disabled','disabled'); // Deshabilitar option
				$(selectGrupos).multiselect('refresh'); // Refrescar option
			});
		}

		function seleccionarCaracter(selectCaracter,listboxPlan,selectGrupos,NUM_PROGRAMA,plan)
		{
			if(NUM_PROGRAMA == 0)
			{
				var programa = $("#carreraAdmin").val();
			}
			else
			{
				var programa = NUM_PROGRAMA;
			}

			var caracter = $(selectCaracter).val();
			$.post("<?php echo URL::to('cargaacademica/obteneruas'); ?>",{noplan:plan,programa:programa,caracter:caracter},function(uas){
				$(listboxPlan).jqxListBox({source: uas});
				alert(caracter);
				if(caracter != 1)
				{
					$(selectGrupos).multiselect('setOptions',configurationOptativo);
					$(selectGrupos).multiselect('rebuild');
					desmarcar_carreras($(selectGrupos));
				}
				else
				{
					$(selectGrupos).multiselect('setOptions',configurationOptativo);
					$(selectGrupos).multiselect('rebuild');
					marcar_carreras($(selectGrupos));
				}
			})
			.fail(function(errorText,textError,errorThrow){
				alert(errorText.responseText);
			});
		}

		function seleccionarSemestre(grupoSemestre,selectGrupos,selectCaracter,NUM_PROGRAMA,semestre,plan)
		{
			// Aparecer tabla correspondiente
			if(!$("table:not(.tblCatPlan)").hasClass("tableAll"))
			{
				$("table:not(.tblCatPlan)").css("display","none");
				$("#semestre"+semestre).fadeIn("slow");
			}

			// Asignar valor semestre a la ventana modal en la segunda posicion.
			$(grupoSemestre).val(semestre);
			// Obtener los grupos asociados al semestre seleccionado.
			var periodo = $("#periodo").val();
			if(NUM_PROGRAMA == 0)
			{
				var programa = $("#carreraAdmin").val();
			}
			else
			{
				var programa = NUM_PROGRAMA;
			}
			// Obtener grupos de ese plan, periodo y semestre
			$.post("<?php echo URL::to('cargaacademica/obtenergrupos'); ?>",{nosemestre:semestre,noplan:plan,noperiodo:periodo,noprograma:programa},function(grupos){
				var options = "";
				for(var i = 0; i < grupos.length; i++)
				{
					options += "<option value="+grupos[i].grupo+" >"+grupos[i].grupo+"</option>";
				}
				// Llenar las carreras que pertenecen al plan seleccionado
				$(selectGrupos).html(options);
				$('.grupos').multiselect('rebuild');

				// Si es de caracter obligatorio seleccionar todos los grupos y deshabilitar
				if($(selectCaracter).val()==1)
				{
					marcar_carreras($(selectGrupos));
				}
			})
			.fail(function(errorText,textError,errorThrow){
				alert(errorText.responseText);// CUANDO CAMBIEN EL SEMESTRE DEL PLAN VIGENTE
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

					if (data.uas[i].caracter == 1)
					{
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

						$("#semestre"+data.uas[i].semestre+" tbody:eq(0)").append(renglon);

					}
					else
					{
						/*var renglonGrupos = "";
						 Obtener los grupos a los que pertenece la ua de tipo optativa
						$.ajax({
							type: "POST",
							url:"<?php echo URL::to('cargaacademica/obtenergruposua'); ?>",
							data: {uaprendizaje:ua,semestre:semestreua},
							dataType: "json",
							success: function(grupos){
								renglonGrupos = "";
								for(var j=0;j<grupos.length;j++)
								{
									if(j == grupos.length-1)
										renglonGrupos+=grupos[j].grupo;
									else
										renglonGrupos+=grupos[j].grupo + ", ";
								}
							},
							error: function(errorText,textError,errorThrow){
								alert("Error al obtener grupos asociados en la ua: " + errorText.responseText);
							},
							async:false
						});*/

						renglon = "<tr>" +
									"<td>" + data.uas[i].uaprendizaje + "</td>" +
									"<td>" + data.uas[i].descripcionmat + " - " + data.uas[i].grupos + "</td>" +
									"<td>" + data.uas[i].creditos + "</td>" +
									"<td>" + data.uas[i].HC + "</td>" +
									"<td>" + data.uas[i].etapa + "</td>" +
									"<td>" + ((data.uas[i].series === null) ? "SIN SERIACION" : data.uas[i].series) + "</td>" +
									"<td>" + "<input type='button' class='md-trigger clsModificarFila' data-modal='pruebaCa' programa='" + programa + "' periodo='" + periodo + "' semestre='" + semestreua + "' uaprendizaje='" + ua + "' />" + "</td>" +
									"<td>" + "<input type='button' value='-'' title='Eliminar' class='clsEliminarFila' id='eliminar' semestre='" + semestreua + "' />" + "</td>" +
								  "</tr>";
						$("#semestre"+data.uas[i].semestre+" tbody:eq(1)").append(renglon);
						//alert("Si fue sincrono");
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
				activarModal();
			})
			.fail(function(errorText,textError,errorThrow){
				alert(errorText.responseText);
			});
		}

		function generarCarga(selectGrupos,listboxPlan,uasPlan,NUM_PROGRAMA,semestre)
		{
			// $(selectGrupos).val() instanceof Array = Saber si es un arreglo
			// Validar seleccion de unidad de aprendizaje
			if(uasPlan.length < 1)
			{
				alert("Es necesario seleccionar una unidad de aprendizaje para generar la carga");
				return false;
			}

			// Validar si ha seleccionado grupos en el caso de las optativas
			var grupos = $(selectGrupos).val();
			if(grupos == null)
			{
				alert("No hay ningun grupo seleccionado para realizar la carga");
				return false;
			}

			//var periodo = $("#datalistPeriodo option[value='"+$("#periodo").val()+"']").attr("codigo");
			var periodo = $("#periodo").val();
			var programa = 0;

			if(NUM_PROGRAMA == 0)
			{
				var programa = $("#carreraAdmin").val();
			}
			else
			{
				var programa = NUM_PROGRAMA;
			}


			// Mostrar unidades de aprendizaje en las tablas
			$.post("<?php echo URL::to('cargaacademica/registrarcarga'); ?>",{grupos:grupos,periodo:periodo,uas:uasPlan,programa:programa,semestre:semestre,usersid:USERS_ID},function(uas){
				//Actualizar tabla de semestres
				obtenerCarga(periodo,programa);
				alert(uas);
			})
			.fail(function(errorText,textError,errorThrow){
				alert(errorText.responseText);
			});

			// Limpiar listboxPlanVigente
			$(listboxPlan).jqxListBox("uncheckAll");
		}

		function obtenerPlanesEstudio(programaedu)
		{
			$.ajax({
				url : "<?php echo URL::to('cargaacademica/obtenerplanes') ?>",
				data : {programaedu : programaedu},
				type : "post",
				success : function(planes){
					// Depuración
					console.log("Planes de Estudio {programa:"+programaedu+"} :");
					console.log(planes);

					// Evaluar cantidad de planes
					if(planes.cantidad != 0)
					{
						// Inyectar datos PLAN VIGENTE
						var plan = String(planes[0]);
						$("#nombreVigente").text("Plan " + insertStr(plan,"-",4));
						$("#grupoVigentePlan").val(plan);
						$("#grupoPlanVigente").text($("#nombreVigente").text());
						$("#planVigente").find("input, select").attr("disabled",false);
						// Inyectar datos PLAN ANTERIOR SI EXISTE
						if(planes.cantidad == 2)
						{
							plan = String(planes[1]);
							$("#nombreAnterior").text("Plan " + insertStr(plan,"-",4));
							$("#grupoAnteriorPlan").val(plan);
							$("#grupoPlanAnterior").text($("#nombreAnterior").text());
							$("#planAnterior").find("input, select").attr("disabled",false);
						}
					}

					// Si no hay planes
					if(planes.cantidad == 0)
					{
						alert("No existen planes de estudio registrados para el programa educativo seleccionado.");
					}
					else
					{
						// Si hay 1 Plan.
						planVigente = planes[0];
						// Crear controles para las unidades de aprendizaje
						$("#listboxPlanVigente").jqxListBox({width: 480,   checkboxes: true, height: 330, theme: 'orange'});
						// Evento al seleccionar ua's de plan vigente.
						$("#listboxPlanVigente").on('checkChange', function (event)
						{
							var items = $("#listboxPlanVigente").jqxListBox('getCheckedItems');
							// Limpiar arreglo
							uasVigente = [];
							// Agregar al arreglo clave de unidad de aprendizaje
							$.each(items, function (index)
							{
								uasVigente.push(this.label.substring(0,5));
							});
						});
						var programa = programaedu;
						//Obtener las unidades de aprendizaje obligatorias plan vigente formateadas Ej. 11236 - Matematicas
						$.post("<?php echo URL::to('cargaacademica/obteneruas'); ?>",{noplan:planVigente,programa:programa,caracter:1},function(uas){
							$("#listboxPlanVigente").jqxListBox({source:uas});
						})
						.fail(function(errorText,textError,errorThrow){
							alert(errorText.responseText);
						});

						// Si hay 2 Planes
						if(planes.cantidad == 2)
						{
							planAnterior = planes[1];
							// Crear controles para las unidades de aprendizaje
							$("#listboxPlanVigente,#listboxPlanAnterior").jqxListBox({width: 480,   checkboxes: true, height: 330, theme: 'orange'});
							// Evento al seleccionar ua's de los plan
							$("#listboxPlanAnterior").on('checkChange', function (event)
							{
								var items = $("#listboxPlanAnterior").jqxListBox('getCheckedItems');
								// Limpiar arreglo
								uasAnterior = [];
								// Agregar al arreglo clave de unidad de aprendizaje
								$.each(items, function (index)
								{
									uasAnterior.push( this.label.substring(0 , 5) );
								});
							});

							//Obtener las unidades de aprendizaje obligatorias plan anterior formateadas Ej. 11236 - Matematicas
							$.post("<?php echo URL::to('cargaacademica/obteneruas'); ?>",{noplan:planAnterior,programa:programa,caracter:1},function(uas){
								$("#listboxPlanAnterior").jqxListBox({source:uas});
							})
							.fail(function(errorText,textError,errorThrow){
								alert(errorText.responseText);
							});
						}
					}
					//callback(planes);
				},
				error: function(errorText,textError,errorThrow){
					alert("Error: " + errorText.responseText);
				}
			});
		}
	</script>

	<script type="text/javascript">
		$(function(){
			/********************************** INICIO DE LA APLICACIÓN ***********************************/
			// INICIALIZAR
			var tablaActualSemestre = 0;
			$("#periodo").val("");
			$("#carreraAdmin").val("");
			$("#semestresVigente").val("");
			$("#semestresAnterior").val("");
			// Ocultar tablas de registro de carga
			$("table:not(.tblCatPlan)").hide();
			$("#botonAll").hide();
			// Deshabilitar controles
			$("#planVigente").find("input, select").attr("disabled",true);
			$("#planAnterior").find("input, select").attr("disabled",true);

			// DECLARAR CONSTANTES
			NUM_PROGRAMA = $("#userPrograma").val();
			USERS_ID = $("#userID").val();
			$(".grupoUsersId").val(USERS_ID);

			console.log("User programaedu: " + NUM_PROGRAMA);
			console.log("User id: " + USERS_ID);

			// VALIDAR TIPO DE USUARIO
			if(NUM_PROGRAMA != 0)
			{
				// Cambiar valores para el registro de los grupos en la modal.
				$("#grupoCarreraV,#grupoCarreraA").val(NUM_PROGRAMA); // Asignar carrera - Administrador para grupo
				$(".grupoPrograma").val(NUM_PROGRAMA);

				// Reiniciar select de tipo caracter
				$("#selectCaracterVigente,#selectCaracterAnterior").val(1);

				// Indicar nombre del programa
				$.post("<?php echo URL::to('cargaacademica/obtenernombreprograma') ?>",{programa:NUM_PROGRAMA},function(nombre){
					$("#nombrePrograma").text("Lic. en " + nombre);
					$(".grupoPgr").text($("#nombrePrograma").text());
				})
				.fail(function(errorText,textError,errorThrow){
					alert("Error: " + errorText.responseText);
				});

				obtenerPlanesEstudio(NUM_PROGRAMA);
			}
			// CUANDO CAMBIEN EL PERIODO
			$("#periodo").on("change",function(){
					//var periodo = $("#datalistPeriodo option[value='"+$(this).val()+"']").attr("codigo");
					var periodo = $("#periodo").val();
					console.log("Periodo seleccionado: " + periodo);
					$(".grupoPer").text($(this).find("option:selected").text());
					$(".grupoPeriodo").val(periodo);

					if(NUM_PROGRAMA != 0)
					{
						obtenerCarga(periodo,NUM_PROGRAMA);
					}
			});

			// CUANDO CAMBIEN LA CARRERA EL ADMINISTRADOR
			$("#carreraAdmin").on("change",function(){

				// Cambiar valores para el registro de los grupos en la modal.
				$("#grupoCarreraV,#grupoCarreraA").val($(this).val()); // Asignar carrera - Administrador para grupo
				$(".grupoPrograma").val($(this).val());

				// Reiniciar select de tipo caracter
				$("#selectCaracterVigente,#selectCaracterAnterior").val(1);

				// Indicar nombre del programa
				$("#nombrePrograma").text("Lic. en " + $("#carreraAdmin option:selected").text());
				$(".grupoPgr").text($("#nombrePrograma").text());

				// Almacenar programa y periodo
				var programa = $("#carreraAdmin").val();

				//var periodo = $("#datalistPeriodo option[value='"+$("#periodo").val()+"']").attr("codigo");
				var periodo = $("#periodo").val();
				console.log("Programa: " + programa + ", " + " Periodo: " + periodo);

				// Obtener planes de estudio.
				obtenerPlanesEstudio(programa);

				// Actualizar tablas de semestres
				obtenerCarga(periodo,programa);
			});

			// CUANDO SELECCIONEN EL CARACTER EJ. OBLIGATORIO DE LAS MATERIAS PLAN VIGENTE
			$("#selectCaracterVigente").on("change",function(){
				seleccionarCaracter($(this),"#listboxPlanVigente","#selectGruposVigente",NUM_PROGRAMA,planVigente);
			});

			// CUANDO SELECCIONEN EL CARACTER EJ. OBLIGATORIO DE LAS MATERIAS PLAN ANTERIOR
			$("#selectCaracterAnterior").on("change",function(){
				seleccionarCaracter($(this),"#listboxPlanAnterior","#selectGruposAnterior",NUM_PROGRAMA,planAnterior);
			});

			// CUANDO CAMBIEN EL SEMESTRE DEL PLAN VIGENTE
			$("#semestresVigente").on("change",function(){
				$("#botonAll").show("slow");
				tablaActualSemestre = $(this).val();
				seleccionarSemestre("#grupoSemestreV","#selectGruposVigente","#selectCaracterVigente",NUM_PROGRAMA,$(this).val(),planVigente);
			});

			// CUANDO CAMBIEN EL SEMESTRE DEL PLAN ANTERIOR
			$("#semestresAnterior").on("change",function(){
				$("#botonAll").show("slow");
				tablaActualSemestre = $(this).val();
				seleccionarSemestre("#grupoSemestreA","#selectGruposAnterior","#selectCaracterAnterior",NUM_PROGRAMA,$(this).val(),planAnterior);
			});

			// PARA GENERAR LAS CARGA ACADEMICA
			$("#btnGuardarCargaV").on("click",function(){
				generarCarga("#selectGruposVigente","#listboxPlanVigente",uasVigente,NUM_PROGRAMA,$("#semestresVigente").val());
			});

			$("#btnGuardarCargaA").on("click",function(){
				generarCarga("#selectGruposAnterior","#listboxPlanAnterior",uasAnterior,NUM_PROGRAMA,$("#semestresAnterior").val());
			});

			// PARA MODIFICAR GRUPOS DE LA CARGA YA REALIZADA
			$("table").on("click",".clsModificarFila",function(event){
				event.stopPropagation();
				// Asignar renglos seleccionado para actualizar
				renglonActualizarGrupos = $(this).parents().get(1);
				console.log(renglonActualizarGrupos);
				// Limpiar control
				$("#listaUa").jqxListBox('clear');
				var semestre = $(this).attr("semestre"),periodo=$(this).attr("periodo"),programa=$(this).attr("programa"),uaprendizaje = $(this).attr('uaprendizaje');

				// Cargar los valores predefinidos input:hidden para la actualizacion de los grupos
				$("#actualizarGruposPrograma").val(programa);
				$("#actualizarGruposPeriodo").val(periodo);
				$("#actualizarGruposSemestre").val(semestre);
				$("#actualizarGruposUaprendizaje").val(uaprendizaje);
				$("#actualizarGruposUserId").val(USERS_ID);
				// Petición para mostrar grupos por default
				$.ajax({
					url : "<?php echo URL::to('cargaacademica/obtenergruposua'); ?>",
					type : "post",
					data : {semestre:semestre,periodo:periodo,programa:programa,uaprendizaje:uaprendizaje},
					dataType : "JSON",
					success : function(data){
						$("#listaUa").jqxListBox({source: data.source});
						console.log(data.source);
						console.log(data.grupos);

						// Seleccionar items almacenados
						for (var i = data.grupos.length - 1; i >= 0; i--) {
							if(data.grupos[i].check == true)
							{
								$("#listaUa").jqxListBox('checkItem',data.grupos[i].grupo);
							}
						};

					},
					error : function(errorText,textError,errorThrow){
						alert("Error en: " + errorText.responseText);
					},
					always: function(){
						alert("terminoa ajax");
					}
				});
			});

			// PARA ELIIMINAR UA DE LA CARGA FALTA EL FILTRO DE CARRRRRRRRERASSASAAAASDASDASDFASDFASDF
			$("table").on("click",".clsEliminarFila",function(event){
				event.stopPropagation();
				alert(NUM_PROGRAMA);
				if(confirm("Se dara de baja la unidad de aprendizaje de la carga actual. Deseas continuar?"))
				{
					// Obtener UA,periodo
					var row = $(this).parents().get(1);
					var ua = $(row).find("td:eq(0)").text();
					var semestre = $(this).attr("semestre");
					//var periodo = $("#datalistPeriodo option[value='"+$("#periodo").val()+"']").attr("codigo");
					var periodo = $("#periodo").val();
					if(NUM_PROGRAMA == 0)
					{
						var programa = $("#carreraAdmin").val();
					}
					else
					{
						var programa = NUM_PROGRAMA;
					}
					$.post("<?php echo URL::to('cargaacademica/eliminaruacarga'); ?>",{periodo:periodo,uaprendizaje:ua,programa:programa,semestre:semestre},function(data){
						alert(data);
						$(row).remove();
					});
				}
			});

			// ELIMINAR TODA LA CARGA
			$("#planAntCa").on("click",function(){
				$.post("<?php echo URL::to('cargaacademica/eliminarcarga'); ?>").done(function(){
					$("table:not(.tblCatPlan) tbody").empty();
					alert("Carga Eliminada");
				});
			});

			// BOTON ALL
			$("#botonAll").on("click",function(){
				if($("table:not(.tblCatPlan,#semestre"+tablaActualSemestre+")").hasClass("tableAll"))
				{
					$("table:not(.tblCatPlan,#semestre"+tablaActualSemestre+")").removeClass("tableAll").fadeOut("fast");
					//$("#semestre"+tablaActualSemestre).fadeIn();
					$(this).text("Todos");
				}
				else
				{
					$("table:not(.tblCatPlan,#semestre"+tablaActualSemestre+")").addClass("tableAll").fadeIn("fast");
					$("#semestre"+tablaActualSemestre).css("margin-bottom","8%");
					$(this).text("Individual");
				}
			});
		});
	</script>

		<!--SCRIPT PARA VENTANA MODAL-->
	<script src="../js/classie.js"></script>
	<script src="../js/modalEffects.js"></script>







</body>
</html>