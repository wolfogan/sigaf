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

	<script type="text/javascript">
	$(function (){
		
		function insertStr(stringTarget,stringAdd,stringIndex)
		{
			var string1 = stringTarget.substring(0,stringIndex);
			var string2 = stringTarget.substring(stringIndex);

			return string1+stringAdd+string2;

		}
		Date.prototype.now = function(){
			var dd = this.getDate();
			var mm = this.getMonth()+1;
			var yyyy = this.getFullYear();
			if(dd<10) dd='0'+dd;
			if(mm<10) mm='0'+mm;
			return String(yyyy+"-"+mm+"-"+dd);
		}
		// Inicializar fech periodo
		var date = new Date();
		$("#periodoFechaInicio").val(date.now());
		$("#periodoFechaFin").val(date.now());
		//$("#periodoFechaInicio").prop('min',date.now());
		//$("#periodoFechaInicio").prop('max','2015-08-08');

		var sourcePlanVigente = [@for ($i = 0;$i<count($unidades[0]);$i++){{"'".$unidades[0][$i]->uaprendizaje." - ".$unidades[0][$i]->descripcionmat."'"}} @if ($i<count($unidades[0])-1){{","}} @endif @endfor];
		var sourcePlanAnterior = [ @for ($i = 0;$i<count($unidades[1]);$i++){{"'".$unidades[1][$i]->uaprendizaje." - ".$unidades[1][$i]->descripcionmat."'"}} @if ($i<count($unidades[1])-1){{","}} @endif @endfor];
		//alert(source[0].plan);
		// Create a jqxListBox
		$(".listboxPlanVigente").jqxListBox({width: 450, source: sourcePlanVigente, checkboxes: true, height: 530, theme: 'orange'});
		$(".listboxPlanAnterior").jqxListBox({width: 450, source: sourcePlanAnterior, checkboxes: true, height: 530, theme: 'orange'});
		// Check several items.
		// $(".listbox").jqxListBox('checkIndex', 0);
		// $(".listbox").jqxListBox('checkIndex', 1);
		// $(".listbox").jqxListBox('checkIndex', 2);
		// $(".listbox").jqxListBox('checkIndex', 5);

		// Asingar nombres de planes
		$("#nombreVigente").text("Plan "+insertStr({{'"'.$planes[0].'"'}},"-",4));
		$("#nombreAnterior").text("Plan "+insertStr({{'"'.$planes[1].'"'}},"-",4));
		
		$(".listboxPlanAnterior,.listboxPlanVigente").on('checkChange', function (event) {
			var args = event.args;
			if (args.checked) {
				$("#Events").text("Checked: " + args.label);
			}
			else {
				$("#Events").text("Unchecked: " + args.label);
			}

			var items = $(".listbox").jqxListBox('getCheckedItems');
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

	<script type="text/javascript">
	$(document).ready(function() {
		$('.grupos').multiselect({
			includeSelectAllOption: true
		});
	});
	</script>

	<!-------------------------------------------------------------------------------------------->

	<!----------------------------------------- DATATABLES --------------------------------------->
	<!-- CSS -->
	<link rel="stylesheet" type="text/css" href="../css/jquery.dataTables.css">
	<!-- JS -->
	<script src="../js/jquery.dataTables.js"></script>
	<!-- Script dataTable -->
	
	
	<!-------------------------------------------------------------------------------------------->
</head>
<body>
	<!-------------------------------- MODAL CATALOGO PERIODOS -------------------------------->
	<div class="md-modal md-effect-11" id="btnCatalogoPeriodo"> 
		<form id="formPeriodo" action="javascript:registrarPeriodo();" class="md-content" method="post">
			<h3>Agregar Período</h3>
			<div class="tblCatalogos">
				<table class="tblCatPlan">
					<tr>
						<th></th>
						<th></th>
					</tr>
					<tr>
						<td>Nombre:</td>
						<td><input style="width: 100px; height: 30px; border-radius: 5px; border-color: #DBDBEA;" name="periodoAnio" type="text" id="periodoAnio" maxlength="4" placeholder="2014" required/>&nbsp;-&nbsp;<input style="width: 80px; height: 30px; border-radius: 5px; border-color: #DBDBEA;"  name="periodoLapso" type="text" id="perdiodoSemestre" maxlength="1" placeholder="1" required/></td>
					</tr>
					<tr>
						<td>Tipo Programa:</td>
						<td><select style="width:200px;" name="periodoTipo" id="periodoTipo" />
							@foreach ($periodosPrograma as $periodo)
								<option value="{{$periodo->periodo_pedu}}">{{$periodo->descripcion}}</option>
							@endforeach
						</select></td>
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
				<input type="submit" class="estilo_button2" value="Guardar"/>
				<input type="button" value="Salir" class="md-close" />
			</div>
		</form>
	</div>

	<!-------------------------------------- MODAL CATALOGO GRUPOS -------------------------------------->
	
	<div class="md-modal md-effect-11" id="btnCatalogoGrupo"> 
		<form id="formUA" action="<?=URL::to('planestudio/registrarplan'); ?>" class="md-content" method="post">
			<h3>Agregar Grupos</h3>
			<div class="tblCatalogos">
				<table class="tblCatPlan">
					<tr>
						<th></th>
						<th></th>
					</tr>
					<tr>
						<td>Nombre:</td>
						<td><input style="width: 200px; height: 30px; border-radius: 5px; border-color: #DBDBEA;" type="text" id="txtNombreGpo" size=1 /></td>
					</tr>
					<tr>
						<td>Semestre:</td>
						<td><input style="width: 200px; height: 30px; border-radius: 5px; border-color: #DBDBEA;" type="number" id="txtSemestreGpo" name='txtSemestreGpo' size=1 /></td>
					</tr>
					<tr>
						<td>Turno:</td>
						<td><input style="width: 200px; height: 30px; border-radius: 5px; border-color: #DBDBEA;" type="text" id="txtTurnoGpo" name='txtTurnoGpo' size=1 /></td>
					</tr>
					<tr>
						<td>Período:</td>
						<td><label><div class="periodo_nombre">Periodo tal</div></label></td>
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
				<img src="../imagenes/manual.png" alt="">&nbsp;Manual
			</div>
		</div>
	</div>
	<section>
		<div class="contenedor_Ca">
			<div class="nombre_coordinacion">Lic. en Informática</div>
			<!--------------------- CONTROLES SUPERIOR DERECHO ------------------>
			<div id="periodoCa">
				<div id="btnNuevaCaDiv"><input type="button" style="width:200px;" class="estilo_button2" value="Nueva CA" name="btnNuevaCa" id="btnNuevaCa" /></div>
				<div id="divPeriodo">Periódo: <input type="text" class="con_estilo" name="txtPeriodoCa" id="txtPeriodoCa"/>
					<input type="button" class="md-trigger" value="+" data-modal="btnCatalogoPeriodo" id="btnCatalogoPeriodo" />
				</div>
				<input style="width:18px; height:18px; margin-left:310px" type="checkbox" name="checkSubdirector_ca" value="Generar">
				<label style="font-size:18px;">Carga completada</label>
			</div>
			<!----------------------- LISTA PLAN VIGENTE ------------------------>
			
			<div id="planVigente">
				<fieldset id="planV"><legend>Plan vigente</legend>
					<div class="nombrePlan" id="nombreVigente">Plan 2014-1</div>
					<div class="filtroMaterias_ca">
						Materias:
						<select class="con_estilo" style="width:135px; height:30px" name="semestre_ca" size=1>
							<option value="OBLIGATORIAS">OBLIGATORIAS</option>
							<option value="OPTATIVAS">OPTATIVAS</option>
						</select>
						<button class="estilo_button_lupa" name="btnfiltro_ca" type="submit"><img src="../imagenes/search.png"> </button>
					</div>
					<div class="listasCa">
						<div class="listboxPlanVigente"></div>
					</div>
					<label>Semestre:</label>
					<select class="con_estilo" style="width:135px; height:30px" name="semestre_ca" size=1>
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
						<select name="example" multiple="multiple" class="grupos">
							<option value="231" selected>231</option>
							<option value="232" selected>232</option>
							<option value="241" selected>241</option>
							<option value="242" selected>242</option>
							<option value="251" selected>251</option>
							<option value="252" selected>252</option>
						</select>
						<input type="button" class="md-trigger" value="+" data-modal="btnCatalogoGrupo" id="btnCatalogoGrupo" />
						<input type="button" style="width:180px" value="Generar Carga"  class="estilo_button2" name="btnGuardarCa" id="btnGuardarCa" />
					</div>
				</fieldset>
			</div>
			
			<!----------------------- BOTON PLAN ANTERIOR ------------------------>
			<div id="btnPlanA">
				<input type="button" style="width:200px;" class="estilo_button2" value="Plan Anterior" name="planAntCa" id="planAntCa" />
			</div>
			<!----------------------- LISTA PLAN ANTERIOR ------------------------>
			<div id="planAnterior">
				<fieldset id="planA"><legend>Plan anterior </legend>
					<div class="nombrePlan" id="nombreAnterior">Plan 2009-2</div>
					<div class="filtroMaterias_ca">
						Materias:
						<select class="con_estilo" style="width:135px; height:30px" name="semestre_ca" size=1>
							<option value="OBLIGATORIAS">OBLIGATORIAS</option>
							<option value="OPTATIVAS">OPTATIVAS</option>
						</select>
						<button class="estilo_button_lupa" name="btnfiltro_ca" type="submit"><img src="../imagenes/search.png"> </button>
					</div>
					<div class="listasCa">
						 <div class="listboxPlanAnterior"></div>           
					</div>
					<label>Semestre: </label>
					<select class="con_estilo" style="width:135px; height:30px" name="semestre_ca" size=1>
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
						<select name="example" multiple="multiple" class="grupos">
							<option value="231" selected>231</option>
							<option value="232" selected>232</option>
							<option value="241" selected>241</option>
							<option value="242" selected>242</option>
							<option value="251" selected>251</option>
							<option value="252" selected>252</option>
						</select>
						<input type="button" class="md-trigger" value="+" data-modal="btnCatalogoGrupo" id="btnCatalogoGrupo" />
						<input type="button" style="width:180px" value="Generar Carga"  class="estilo_button2" name="btnGuardarCa" id="btnGuardarCa" />
					</div>
				</fieldset>
			</div>
			<!---------------------------------- REGISTROS DE CARGA ACADEMICA <!----------------------------------> 
			<div id="contenedorRegistroca_mostrar">
				<table cellpadding="0" cellspacing="0" border="0" class="display" id="tblUA">
					<thead class="semestre_plan">
						<tr>
							<th>SEMESTRE: 6</th>
							<th>PLAN: 2014-1</th>
						</tr>
					</thead>
					<thead class="encabezado_tabla">
						<tr>
							<th>CLAVE</th>
							<th>MATERIA</th>
							<th>NO. CREDITOS</th>
							<th>HC</th>
							<th>ETAPA</th>
							<th>REQ. SERIACION</th>
							<th>ELIMINAR</th>
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
							<td><input type="button" value="-" title='Eliminar' class="clsEliminarFila" id="eliminar"/></td>	
						</tr>
						<tr>
							<td>000454</td>
							<td>ARQ. DE LA INFO.</td>
							<td>15</td>
							<td>14</td>
							<td>BASICA</td>
							<td>none</td>	
							<td><input type="button" value="-" title='Eliminar' class="clsEliminarFila" id="eliminar"/></td>
						</tr>
						<tr>
							<td>000455</td>
							<td>PRINCIPIOS DE PROGRAMACION</td>
							<td>9</td>
							<td>12</td>
							<td>BASICA</td>
							<td>none</td>
							<td><input type="button" value="-" title='Eliminar' class="clsEliminarFila" id="eliminar"/></td>
						</tr>
						<tr>
							<td>000456</td>
							<td>MATEMATICAS I</td>
							<td>2</td>
							<td>20</td>
							<td>BASICA</td>
							<td>none</td>
							<td><input type="button" value="-" title='Eliminar' class="clsEliminarFila" id="eliminar"/></td>	
						</tr>
						<tr>
							<td>000457</td>
							<td>FISICA I</td>
							<td>4</td>
							<td>30</td>
							<td>BASICA</td>
							<td>none</td>
							<td><input type="button" value="-" title='Eliminar' class="clsEliminarFila" id="eliminar"/></td>
						</tr>
						<tr>
							<td>000458</td>
							<td>ORIENTACION VOCACIONAL</td>
							<td>10</td>
							<td>20</td>
							<td>BASICA</td>
							<td>none</td>
							<td><input type="button" value="-" title='Eliminar' class="clsEliminarFila" id="eliminar"/></td>
						</tr>
						<tr>
							<td>000459</td>
							<td>QUIMICA I</td>
							<td>9</td>
							<td>20</td>
							<td>BASICA</td>
							<td>none</td>
							<td><input type="button" value="-" title='Eliminar' class="clsEliminarFila" id="eliminar"/></td>	
						</tr>
						<tr>
							<td>000460</td>
							<td>ESTRUCTURA DE DATOS</td>
							<td>2</td>
							<td>4</td>
							<td>BASICA</td>
							<td>none</td>
							<td><input type="button" value="-" title='Eliminar' class="clsEliminarFila" id="eliminar"/></td>
						</tr>
					<thead class="encabezado_tabla">
						<tr>
							<th>OPTATIVAS</th>
						</tr>
					</thead>
					<tr>
						<td>000459</td>
						<td>QUIMICA I 231, 233, 234</td>
						<td>9</td>
						<td>20</td>
						<td>BASICA</td>
						<td>none</td>
						<td><input type="button" value="-" title='Eliminar' class="clsEliminarFila" id="eliminar"/></td>	
					</tr>
					<tr>
						<td>000460</td>
						<td>ESTRUCTURA DE DATOS 235, 236</td>
						<td>2</td>
						<td>4</td>
						<td>BASICA</td>
						<td>none</td>
						<td><input type="button" value="-" title='Eliminar' class="clsEliminarFila" id="eliminar"/></td>
					</tr>
					<thead class="encabezado_tabla">
						<td>GRUPOS Y TURNOS: </td>
					</thead>
					<tr>
						<td>231 TM, 232 TM, 233 TI, 234 TI, 235 TN, 236 TN</td>
					</tr>
				</tbody>
			</table>
			<div id="btnGuardarCa_registro">
				<input type="button" style="width:180px" value="Guardar Carga"  class="estilo_button2" name="btnGuardarCa" id="btnGuardarCa" />
			</div>
		</div>
	</section>

	<script type="text/javascript" src="../js/jqxcore.js"></script>
	<script type="text/javascript" src="../js/jqxbuttons.js"></script>
	<script type="text/javascript" src="../js/jqxscrollbar.js"></script>
	<script type="text/javascript" src="../js/jqxlistbox.js"></script>
	<script type="text/javascript" src="../js/jqxcheckbox.js"></script>
	<footer></footer>
		<!--SCRIPT PARA VENTANA MODAL-->
	<script src="../js/classie.js"></script>
	<script src="../js/modalEffects.js"></script>
	
	<script type="text/javascript">
	function registrarPeriodo()
	{
		var dataPeriodo = $("#formPeriodo").serialize();
		$.post("<?php echo URL::to('cargaacademica/registrarperiodo'); ?>",dataPeriodo,function(result){
			alert(result);
		})
		.fail(function(){
			alert("Fallo al registrar el periodo.");
		});
	}
	$(function(){
		// Crear instancia Datatables para manipulación de renglones durante la ejecución
		var t = $('#tblUA').DataTable();
	});
	</script>
</body>
</html>