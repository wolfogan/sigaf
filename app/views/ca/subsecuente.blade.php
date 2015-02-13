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


	<!-------------------------------- MODAL CATALOGO PERIODOS -------------------------------->

	<div class="md-modal md-effect-11" id="btnCatalogoPeriodo">
		<form id="formPeriodo" action="javascript:registrarPeriodo();" class="md-content" method="post">
			<h3>Crear Nuevo Período</h3>
			<div class="tblCatalogos">
			<div id="Ca_aCopiar">La carga anterior pertenece al período:<label id="periodoCopia">{{ (!is_null($ultimoPeriodoCarga))?Snippets::str_insert('-',$ultimoPeriodoCarga->periodo,4):"XXXX-X"}}</label></div>
				<table class="tblCatPlan">
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
			<div class="CatBotones">
				<input type="submit" class="estilo_button2" value="Copiar"/>
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
		<div class="contenedorCa" style="height:1050px;">
			<div class="nombre_coordinacion" id="nombrePrograma"></div>
			<!--------------------- CONTROLES SUPERIOR DERECHO ------------------>

			<div class="ca_checkstatus">
				<input type="checkbox" style="height:18px; width:18px" name="checkSubdirector_ca" value="Generar">
				<label>Carga capturada</label>
			</div>


			<div class="periodoCa">

				<div class="divPeriodo">
					Periodo:
					<select class="con_estilo" type="text" style="height:30px; width:135px;" name="periodo" id="periodo"/>
						@foreach ($codigosPeriodo as $periodo)
							<option value="{{$periodo['codigo']}}">{{$periodo['formato']}}</option>
						@endforeach
					</select>

					<!--<input type="button" class="md-trigger" value="+" data-modal="btnCatalogoPeriodo" id="btnCatalogoPeriodo" />-->
				</div>


				<div class="consultar_admin"><span id="labelCarrera">Carrera:</span>
						<select class="con_estilo" style="width:135px; height:30px" name="carrera_admin" id="carreraAdmin">
							@foreach ($programas as $programa)
								<option value="{{$programa->programaedu}}">{{$programa->descripcion}}</option>
							@endforeach
						</select>

				</div>
				@if (!is_null($ultimoPeriodoCarga))
				<div id="btn_copiarCa"><input type="button" class="md-trigger" value="COPIAR carga anterior" data-modal="btnCatalogoPeriodo" id="copiarCarga" /></div>
				@endif
			</div>


			<div id="ca_nombrePeriodo">Periodo:<label>XXXX-X</label></div>



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
						<input type="button" style="width:180px; margin-top:3px;" value="Generar Carga"  class="estilo_button2" name="btnGuardarCa" id="btnGuardarCargaV" />

					</div>
				</fieldset>
			</div>





			<!-------------------------------- REGISTROS SEMESTRE 1 -------------------------------->

			<table class="tabla_ca" style="width:700px; margin-left:30px; margin-top:70px;">


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
					<tr>
						<td>000453</td>
						<td>DESARROLLO SUSTENTABLE</td>
						<td>20</td>
						<td>21</td>
						<td>BASICA</td>
						<td>none</td>
						<td><input type='button' value='-' title='Modificar' class='clsModificarFila' id='eliminar'/></td>
						<td><input type='button' value='-' title='Eliminar' class='clsEliminarFila' id='eliminar'/></td>

					</tr>
					<tr>
						<td>000454</td>
						<td>ARQ. DE LA INFO.</td>
						<td>15</td>
						<td>14</td>
						<td>BASICA</td>
						<td>none</td>
						<td><input type='button' value='-' title='Modificar' class='clsModificarFila' id='eliminar'/></td>
						<td><input type='button' value='-' title='Eliminar' class='clsEliminarFila' id='eliminar'/></td>


					</tr>
					<tr>
						<td>000455</td>
						<td>PRINCIPIOS DE PROGRAMACION</td>
						<td>9</td>
						<td>12</td>
						<td>BASICA</td>
						<td>none</td>
						<td><input type='button' value='-' title='Modificar' class='clsModificarFila' id='eliminar'/></td>
						<td><input type='button' value='-' title='Eliminar' class='clsEliminarFila' id='eliminar'/></td>

					</tr>
					<tr>
						<td>000456</td>
						<td>MATEMATICAS I</td>
						<td>2</td>
						<td>20</td>
						<td>BASICA</td>
						<td>none</td>
						<td><input type='button' value='-' title='Modificar' class='clsModificarFila' id='eliminar'/></td>
						<td><input type='button' value='-' title='Eliminar' class='clsEliminarFila' id='eliminar'/></td>

					</tr>
					<tr>
						<td>000457</td>
						<td>FISICA I</td>
						<td>4</td>
						<td>30</td>
						<td>BASICA</td>
						<td>none</td>
						<td><input type='button' value='-' title='Modificar' class='clsModificarFila' id='eliminar'/></td>
						<td><input type='button' value='-' title='Eliminar' class='clsEliminarFila' id='eliminar'/></td>

					</tr>
					<tr>
						<td>000458</td>
						<td>ORIENTACION VOCACIONAL</td>
						<td>10</td>
						<td>20</td>
						<td>BASICA</td>
						<td>none</td>
						<td><input type='button' value='-' title='Modificar' class='clsModificarFila' id='eliminar'/></td>
						<td><input type='button' value='-' title='Eliminar' class='clsEliminarFila' id='eliminar'/></td>

					</tr>
					<tr>
						<td>000459</td>
						<td>QUIMICA I</td>
						<td>9</td>
						<td>20</td>
						<td>BASICA</td>
						<td>none</td>
						<td><input type='button' value='-' title='Modificar' class='clsModificarFila' id='eliminar'/></td>
						<td><input type='button' value='-' title='Eliminar' class='clsEliminarFila' id='eliminar'/></td>

					</tr>
					<tr>
						<td>000460</td>
						<td>ESTRUCTURA DE DATOS</td>
						<td>2</td>
						<td>4</td>
						<td>BASICA</td>
						<td>none</td>
						<td><input type='button' value='-' title='Modificar' class='clsModificarFila' id='eliminar'/></td>
						<td><input type='button' value='-' title='Eliminar' class='clsEliminarFila' id='eliminar'/></td>

					</tr>
				</tbody>
				<thead class="dd_encabezado_colorNaranja_tablaConsulta">
						<tr>
							<th colspan="8">OPTATIVAS</th>

						</tr>
				</thead>
				<tbody>
					<tr>
						<td>000460</td>
						<td>ESTRUCTURA DE DATOS</td>
						<td>2</td>
						<td>4</td>
						<td>BASICA</td>
						<td>none</td>
						<td><input type='button' value='-' title='Modificar' class='clsModificarFila' id='eliminar'/></td>
						<td><input type='button' value='-' title='Eliminar' class='clsEliminarFila' id='eliminar'/></td>
					</tr>
				</tbody>
				<thead class="dd_encabezado_colorNaranja_tablaConsulta">
					<th colspan="2">GRUPOS Y TURNOS:</th>
				</thead>
				<tbody>
				</tbody>

			</table>
			<div id="ca_actualiza">
				<input type="button" style="width:180px;" value="Actualizar Carga"  class="estilo_button2" name="btnActualizarCa" id="btnActualizarCargaV" />
			</div>
			<!-------------------------------------------------------------------------------------------->

			<!-------------------------------------------TABLA DE RESUMEN PARA CADA CONSULTA -------------------------------------------->


					<table class="ca_tblResumenConsulta">

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

<!---------------------------------------------------------------------------------------------------------------->

		</div>
	</section>

	<script type="text/javascript" src="../js/jqxcore.js"></script>
	<script type="text/javascript" src="../js/jqxbuttons.js"></script>
	<script type="text/javascript" src="../js/jqxscrollbar.js"></script>
	<script type="text/javascript" src="../js/jqxlistbox.js"></script>
	<script type="text/javascript" src="../js/jqxcheckbox.js"></script>

	<script type="text/javascript">
		var actualizar = false;
	</script>
	<script type="text/javascript">
			$(document).ready(function () {

				// Limpiar controles
				$("#selecciona_plan").val("");
				$("#periodo").val("");
				$("#carreraAdmin").val("");
				// Create a jqxListBox
				$("#listaPlanVigente").jqxListBox({width: 480,  checkboxes: true, height: 330, theme: 'orange'});


				$("#listaPlanVigente").on('checkChange', function (event) {
					var args = event.args;
					if (args.checked) {
						$("#Events").text("Checked: " + args.label);
					}
					else {
						$("#Events").text("Unchecked: " + args.label);
					}

					var items = $("#listaPlanVigente").jqxListBox('getCheckedItems');
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





	<footer>
			<!--<div id="pie_correo">email: emma.castillejos@uabc.edu.mx</div>
			<div id="pie_tel">Teléfono: 664 188 9221</div>-->

	</footer>
		<!--SCRIPT PARA VENTANA MODAL-->
	<script src="../js/classie.js"></script>
	<script src="../js/modalEffects.js"></script>


</body>
</html>