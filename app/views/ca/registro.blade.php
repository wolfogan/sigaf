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
				var source = [
					"221 TM",
					"222 TM",
					"223 TM",
					"224 TM",
					"225 TM",
					"226 TM",
					"227 TM",
					"220 TM",
					"228 TM",
					"223 TM",
					"224 TM",
					"225 TM",
					"226 TM",
					"227 TM",
					"229 TM"
				];
				// Create a jqxListBox
				$("#listaUa").jqxListBox({width: 250, source: source, checkboxes: true, height: 300, theme: 'orange'});
				
				// Check several items.
				$("#listaUa").jqxListBox('checkIndex', 0);
				$("#listaUa").jqxListBox('checkIndex', 1);
				$("#listaUa").jqxListBox('checkIndex', 2);
				$("#listaUa").jqxListBox('checkIndex', 5);

				$("#listaUa").on('checkChange', function (event) {
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
				});
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
	}
	var configurationOptativo =
	{
		includeSelectAllOption: true
	}
	</script>

	<!-------------------------------------------------------------------------------------------->

</head>
<body>
	<!-- Verificar planes de estudio -->
	<input type="hidden" id="planes" value="{{$numPlanes}}" />
	<!-------------------------------------- MODAL LISTA PARA MODIFICAR GRUPOS -------------------------------------->
	<div class="md-modal2 md-effect-11" id="pruebaCa"> 
		<form  action="<?=URL::to('planestudio/registraretapa'); ?>" class="md-content" method="post">
			<h3>Modificar grupos</h3>
			<div class="tblCatalogos">
				
							<div class="listasCa">
								<div id="listaUa" style="margin-top:40px; margin-left:5px;"></div>
							</div>
							 
			</div>
			<div class="CatBotones">
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
								
									<option value="1">TM</option>
								
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
						<td><label><div class="grupoPgr">Lic. Informática</div></label></td>
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
			Carga Académica: Registro
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
			<div class="periodoCa">
				
				<div class="divPeriodo">
					Periódo: 
					<input type="text" class="con_estilo" style="height:25px" name="periodo" id="periodo" list="datalistPeriodo"/>
					<datalist id="datalistPeriodo">
					</datalist>
					<input type="button" class="md-trigger" value="+" data-modal="btnCatalogoPeriodo" id="btnCatalogoPeriodo" />
				</div>
			

				<div class="consultar_admin"><span id="labelCarrera">Carrera:</span>
						<select class="con_estilo" style="width:135px; height:30px" name="carrera_admin" id="carreraAdmin">
							
						</select>

				</div>
			</div>

			<div class="ca_checkstatus">
				<input type="checkbox" style="height:18px; width:18px" name="checkSubdirector_ca" value="Generar">
				<label>Carga capturada</label>
			</div>

			
			
			<!------------------------------------ LISTA PLAN VIGENTE ------------------------------------>
			<div id="planVigente">
				<fieldset id="planV"><legend>Plan vigente</legend>
					<div class="nombrePlan" id="nombreVigente">Plan XXXX-X</div>
					<div class="filtroMaterias_ca">
						Materias:
						<select class="con_estilo" style="width:135px; height:30px" id="selectCaracterVigente">
						</select>
						
					</div>
					<div class="listasCa">
						<div id="listboxPlanVigente"></div>
					</div>
					<label>Semestre:</label>
					<select class="con_estilo" style="width:135px; height:30px" id="semestresVigente">
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
				<input type="button" style="width:200px;" class="estilo_button2" value="Plan Anterior" name="planAntCa" id="planAntCa" />
			</div>

			
			<!-- <input type="button" style="width:200px;" class="md-trigger" value="Prueba" data-modal="pruebaCa" id="pruebaCa" /> -->





			<!----------------------- LISTA PLAN ANTERIOR ------------------------>
			<div id="planAnterior">
				<fieldset id="planA"><legend>Plan anterior </legend>
					<div class="nombrePlan" id="nombreAnterior">Plan XXXX-X</div>
					<div class="filtroMaterias_ca">
						Materias:
						<select class="con_estilo" style="width:135px; height:30px" name="semestre_ca" id="selectCaracterAnterior">
						</select>
						
					</div>
					<div class="listasCa">
						 <div id="listboxPlanAnterior"></div>
					</div>
					<label>Semestre: </label>
					<select class="con_estilo" style="width:135px; height:30px" id="semestresAnterior">
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
		var numPrograma = 0;
		var actualizar = false;

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
		}

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
				var option = "<option value='"+insertStr(result['periodo'],"-",4)+"' codigo='"+result['periodo']+"' />";
				$("#datalistPeriodo").append(option);
				$("#periodo").val(insertStr(result['periodo'],"-",4));


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
			if(vigente==true)
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

		function obtenerPlanesEstudio(callback)
		{
			$.ajax({
				url : "<?php echo URL::to('cargaacademica/obtenerplanes') ?>",
				type : "post",
				success : function(planes){
					console.log(planes);
					var plan = String(planes[0]);
					$("#nombreVigente").text("Plan " + insertStr(plan,"-",4));
					$("#grupoVigentePlan").val(plan);
					$("#grupoPlanVigente").text($("#nombreVigente").text());
					
					if(planes.cantidad == 2)
					{
						plan = String(planes[1]);
						$("#nombreAnterior").text("Plan " + insertStr(plan,"-",4));
						$("#grupoAnteriorPlan").val(plan);
						$("#grupoPlanAnterior").text($("#nombreAnterior").text());
					}
					else
					{
						$("#planAnterior").find("input, select").attr("disabled",true);
					}
					callback(planes);
				},
				error: function(errorText,textError,errorThrow){
					alert("Error: " + errorText.responseText); 
				}
			});

		}

		function cargarControlesUsuario(planes)
		{
			numPrograma = {{Auth::user()->programaedu}};
			USERS_ID = {{Auth::user()->id}};
			// Asignar usuario a la ventana modal de registro de periodos
			$("#periodoUsersId").val(USERS_ID);
			$(".grupoUsersId").val(USERS_ID);
			
			planVigente = planes[0];
			planAnterior = planes[1];

			// Verificar planes de estudio y pasarlos como parametros para los programas del admin.
			var planesEstudio = [];
			planesEstudio = (planes.cantidad < 2) ? [planVigente] : [planVigente,planAnterior];
			
			console.log(planesEstudio);
			if(numPrograma == 0) // Administrador
			{
				// Cargar programas asociados a los planes de estudio actuales
				$.ajax({
					url : "<?php echo URL::to('cargaacademica/obtenerprogramasadmin'); ?>",
					type : "post",
					data : { programa : numPrograma, planes : planesEstudio },
					dataType: "json",
					success: function(programas){
						
						var options = "";
						for(key in programas)
						{
							options += "<option value='"+ programas[key].programaedu +"'>" + programas[key].descripcion + "</option>";
						}
						$("#carreraAdmin").html(options);
						$("#carreraAdmin").val("");
						
					},
					error: function(errorText,textError,errorThrow){
						alert("Error: " + errorText.responseText);
						console.log(errorText);
					}
				});
		
			}
			else // Coordinador de carrera
			{
				$("#grupoCarreraV,#grupoCarreraA").val(numPrograma); // Establecer el numero de carrera para grupo
				$("#carreraAdmin, #labelCarrera").hide();
				// Obtener nombre del programa
				$.ajax({
					url: "<?php echo URL::to('cargaacademica/obtenernombreprograma'); ?>",
					type: "post",
					data : { programa : numPrograma },
					success: function(nombrePrograma){
						var nombre = String(nombrePrograma);
						$("#nombrePrograma").text("Lic. en " + nombre);
						$(".grupoPgr").text($("#nombrePrograma").text());
					},
					error: function(errorText,textError,errorThrow){
						alert("Error: " + errorText.responseText);
					}
				});
				// Treaer materias
				$.post("<?php echo URL::to('cargaacademica/obteneruas'); ?>",{noplan:planVigente,programa:numPrograma,caracter:1},function(uas){
					$("#listboxPlanVigente").jqxListBox({source:uas});
				})
				.fail(function(errorText,textError,errorThrow){
					alert(errorText.responseText);
				});

				$.post("<?php echo URL::to('cargaacademica/obteneruas'); ?>",{noplan:planAnterior,programa:numPrograma,caracter:1},function(uas){
					$("#listboxPlanAnterior").jqxListBox({source:uas});
				})
				.fail(function(errorText,textError,errorThrow){
					alert(errorText.responseText);
				});
			}
			
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

		function seleccionarCaracter(selectCaracter,listboxPlan,selectGrupos,numPrograma,plan)
		{
			if(numPrograma == 0)
			{
				var programa = $("#carreraAdmin").val();
			}
			else
			{
				var programa = numPrograma;
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

		function seleccionarSemestre(grupoSemestre,selectGrupos,selectCaracter,numPrograma,semestre,plan)
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
			var periodo = $("#datalistPeriodo option[value='"+$("#periodo").val()+"']").attr("codigo");
			if(numPrograma == 0)
			{
				var programa = $("#carreraAdmin").val();
			}
			else
			{
				var programa = numPrograma;
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
					if (data.uas[i].caracter == 1)
					{
						renglon = "<tr>" + 
									"<td>" + data.uas[i].uaprendizaje + "</td>" +
									"<td>" + data.uas[i].descripcionmat+"</td>" +
									"<td>" + data.uas[i].creditos + "</td>" +
									"<td>" + data.uas[i].HC + "</td>" +
									"<td>" + data.uas[i].etapa + "</td>" +
									"<td>" + ((data.uas[i].series == null) ? "SIN SERIACION" : data.uas[i].series) + "</td>" +
									"<td>" + "<input type='button' class='md-trigger clsModificarFila' data-modal='pruebaCa'/>" + "</td>" +
									"<td>" + "<input type='button' value='-' title='Eliminar' class='clsEliminarFila' id='eliminar'/>" + "</td>" +
								  "</tr>";
						
						$("#semestre"+data.uas[i].semestre+" tbody:eq(0)").append(renglon);

					}
					else
					{
						var ua = data.uas[i].uaprendizaje;
						var semestreua = data.uas[i].semestre;
						var renglonGrupos = "";
						// Obtener los grupos a los que pertenece la ua de tipo optativa
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
							async:false
						});
						renglon = "<tr>" +
									"<td>" + data.uas[i].uaprendizaje + "</td>" +
									"<td>" + data.uas[i].descripcionmat + " - " + renglonGrupos + "</td>" +
									"<td>" + data.uas[i].creditos + "</td>" +
									"<td>" + data.uas[i].HC + "</td>" +
									"<td>" + data.uas[i].etapa + "</td>" +
									"<td>" + ((data.uas[i].series == null) ? "SIN SERIACION" : data.uas[i].series) + "</td>" +
									"<td>" + "<input type='button' class='md-trigger clsModificarFila' data-modal='pruebaCa'/>" + "</td>" +
									"<td>" + "<input type='button' value='-'' title='Eliminar' class='clsEliminarFila' id='eliminar'/>" + "</td>" +
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

		function generarCarga(selectGrupos,listboxPlan,uasPlan,numPrograma,semestre)
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

			var periodo = $("#datalistPeriodo option[value='"+$("#periodo").val()+"']").attr("codigo");
			var programa = 0;

			if(numPrograma == 0)
			{
				var programa = $("#carreraAdmin").val();
			}
			else
			{
				var programa = numPrograma;
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
	</script>

	<script type="text/javascript">
		$(function(){
			var tablaActualSemestre = 0;
			$("#carreraAdmin").val("");
			$("#semestresVigente").val("");
			$("#semestresAnterior").val("");
			// Crear instancia Datatables para manipulación de renglones durante la ejecución
			//var t = $('#tblUA').DataTable();

			// Ocultar tablas de registro de carga
			$("table:not(.tblCatPlan)").hide();
			$("#botonAll").hide();
			
			var planes = $("#planes").val() > 0;
			// Verificar existencia de planes de estudio
			if(planes == false)
			{
				alert("No existen planes de estudio registrados");
				// Desactivar opciones
				$("#planVigente , #planAnterior").find("select, input").attr("disabled" , true);
			}
			else
			{
				// INICIALIZAR ENTORNO PARA GENERAR LA CARGA
				
				
				//vaar nomPlanVigente = insertStr(planVigente),"-",3);
				//$("#nombreVigente").val("Plan " + nomPlanVigente);

				// Inicializar fecha periodo
				var date = new Date();
				$("#periodoFechaInicio").val(date.now());
				$("#periodoFechaFin").val(date.now());
				//$("#periodoFechaInicio").prop('min',date.now());
				//$("#periodoFechaInicio").prop('max','2015-08-08');


				// Obtener catalogos para el registro de la carga academica
				$.get("<?php echo URL::to('cargaacademica/catalogos'); ?>",function(data)
				{
					// Asignar nombre de la coordinación en caso de que sea un usuario coordinador
					//$("#nombrePrograma").text("Lic. en " + data.nombrePrograma);

					// Asignar tipos de período a modal de registro de períodos: SEMESTRAL,SABATINO, ETC.
					var options = "";
					for(key in data.periodosPrograma)
					{
						var periodo = data.periodosPrograma[key].periodo_pedu;
						var descripcion = data.periodosPrograma[key].descripcion;
						options += "<option value='" + periodo + "'>" + descripcion + "</option>"; 
					}
					$("#periodoTipo").html(options);

					// Asignar tipos de carácter a la lista de los planes: OBLIGATORIO, OPTATIVA
					options = "";
					for(key in data.tiposCaracter)
					{
						var caracter = data.tiposCaracter[key].caracter;
						var descripcion = data.tiposCaracter[key].descripcion;
						options += "<option value='" + caracter + "'>" + descripcion + "</option>" 
					}
					$("#selectCaracterVigente,#selectCaracterAnterior").html(options);

					// Asignar los periodos registrados: 2014-1, 2014-2
					options = "";
					for(key in data.codigosPeriodo)
					{
						var codigo = data.codigosPeriodo[key].codigo;
						var formato = data.codigosPeriodo[key].formato;
						options += "<option value = '" + formato + "' codigo = '" + codigo + "' />"; 
					}
					$("#datalistPeriodo").html(options);

					// Asignar los turnos para los grupos TM, TV , etc.
					options = "";
					for(key in data.turnos)
					{
						var turno = data.turnos[key].turno;
						var descripcion = data.turnos[key].descripcion;
						options += "<option value = '" + turno + "'>" + descripcion + "</option>"; 
					}
					$("#grupoTurno").html(options);



					// Asignar los semestres
					options = "";
					var semestres = [1,2,3,4,5,6,7,8,9];
					for(key in semestres)
					{
						/*var option = document.createElement('option');
						option.text = semestres[key];
						option.value = semestres[key];
						s.options[s.options.length] = option;*/
						options += "<option value='" + semestres[key] + "'>" + semestres[key] + "</option>";  
					}
					$("#semestresVigente,#semestresAnterior").html(options);
					$("#semestresVigente , #semestresAnterior").val("");
					// Cargar input para crear grupos con el semestre elegido
					$("#grupoSemestreV,#grupoSemestreA").val(1);
				})
				.fail(function(errorText,textError,errorThrow){
					alert(errorText.responseText);
				});

				// Crear controles para las unidades de aprendizaje
				$("#listboxPlanVigente").jqxListBox({width: 480,   checkboxes: true, height: 330, theme: 'orange'});
				$("#listboxPlanAnterior").jqxListBox({width: 480, checkboxes: true, height: 330, theme: 'orange'});
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
				// Evento al seleccionar ua's de plan anterior.
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
				
				
				// Mostrar controles por privilegio de usuario
				// Cargar planes de estudio.
				obtenerPlanesEstudio(function(planes){
					cargarControlesUsuario(planes);
				});

			}


			// CUANDO CAMBIEN EL PERIODO
			$("#periodo").on("input",function(){
				if($(this).val().length == 6)
				{
					var periodo = $("#datalistPeriodo option[value='"+$(this).val()+"']").attr("codigo");
					$(".grupoPer").text($(this).val());
					$(".grupoPeriodo").val(periodo);
					if(numPrograma != 0)
					{
						obtenerCarga(periodo,numPrograma);
					}
				}
			});

			// CUANDO CAMBIEN LA CARRERA EL ADMINISTRADOR
			$("#carreraAdmin").on("change",function(){
				$("#grupoCarreraV,#grupoCarreraA").val($(this).val()); // Asignar carrera - Administrador para grupo
				$("#selectCaracterVigente,#selectCaracterAnterior").val(1);
				$(".grupoPrograma").val($(this).val());
				$("#nombrePrograma").text("Lic. en " + $("#carreraAdmin option:selected").text());
				$(".grupoPgr").text($("#nombrePrograma").text());
				var programa = $("#carreraAdmin").val();
				var periodo = $("#datalistPeriodo option[value='"+$("#periodo").val()+"']").attr("codigo");
				//Obtener las unidades de aprendizaje obligatorias formateadas Ej. 11236 - Matematicas 
				$.post("<?php echo URL::to('cargaacademica/obteneruas'); ?>",{noplan:planVigente,programa:programa,caracter:1},function(uas){
					$("#listboxPlanVigente").jqxListBox({source:uas});
				})
				.fail(function(errorText,textError,errorThrow){
					alert(errorText.responseText);
				});
				//Obtener las unidades de aprendizaje optativas formateadas Ej. 11236 - Matematicas 
				$.post("<?php echo URL::to('cargaacademica/obteneruas'); ?>",{noplan:planAnterior,programa:programa,caracter:1},function(uas){
					$("#listboxPlanAnterior").jqxListBox({source:uas});
				})
				.fail(function(errorText,textError,errorThrow){
					alert(errorText.responseText);
				});
				// Actualizar tablas de semestres
				obtenerCarga(periodo,programa);
			});

			// CUANDO SELECCIONEN EL CARACTER EJ. OBLIGATORIO DE LAS MATERIAS PLAN VIGENTE
			$("#selectCaracterVigente").on("change",function(){
				seleccionarCaracter($(this),"#listboxPlanVigente","#selectGruposVigente",numPrograma,planVigente);
			});

			// CUANDO SELECCIONEN EL CARACTER EJ. OBLIGATORIO DE LAS MATERIAS PLAN ANTERIOR
			$("#selectCaracterAnterior").on("change",function(){
				seleccionarCaracter($(this),"#listboxPlanAnterior","#selectGruposAnterior",numPrograma,planAnterior);
			});

			// CUANDO CAMBIEN EL SEMESTRE DEL PLAN VIGENTE
			$("#semestresVigente").on("change",function(){
				$("#botonAll").show("slow");
				tablaActualSemestre = $(this).val();
				seleccionarSemestre("#grupoSemestreV","#selectGruposVigente","#selectCaracterVigente",numPrograma,$(this).val(),planVigente);
			});

			// CUANDO CAMBIEN EL SEMESTRE DEL PLAN ANTERIOR
			$("#semestresAnterior").on("change",function(){
				$("#botonAll").show("slow");
				tablaActualSemestre = $(this).val();
				seleccionarSemestre("#grupoSemestreA","#selectGruposAnterior","#selectCaracterAnterior",numPrograma,$(this).val(),planAnterior);
			});


			// PARA GENERAR LAS CARGA ACADEMICA
			$("#btnGuardarCargaV").on("click",function(){
				generarCarga("#selectGruposVigente","#listboxPlanVigente",uasVigente,numPrograma,$("#semestresVigente").val());
			});

			$("#btnGuardarCargaA").on("click",function(){
				generarCarga("#selectGruposAnterior","#listboxPlanAnterior",uasAnterior,numPrograma,$("#semestresAnterior").val());
			});
			// PARA MODIFICAR GRUPOS DE LA CARGA YA REALIZADA
			$("table").on("click",".clsModificarFila",function(event){

			});

			// PARA ELIIMINAR UA DE LA CARGA FALTA EL FILTRO DE CARRRRRRRRERASSASAAAASDASDASDFASDFASDF
			$("table").on("click",".clsEliminarFila",function(event){
				event.stopPropagation();
				alert(numPrograma);
				if(confirm("Se dara de baja la unidad de aprendizaje de la carga actual. Deseas continuar?"))
				{
					// Obtener UA,periodo
					var row = $(this).parents().get(1);
					var ua = $(row).find("td:eq(0)").text();
					var periodo = $("#datalistPeriodo option[value='"+$("#periodo").val()+"']").attr("codigo");
					if(numPrograma == 0)
					{
						var programa = $("#carreraAdmin").val();
					}
					else
					{
						var programa = numPrograma;
					}
					$.post("<?php echo URL::to('cargaacademica/eliminaruacarga'); ?>",{periodo:periodo,uaprendizaje:ua,programa:programa},function(data){
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