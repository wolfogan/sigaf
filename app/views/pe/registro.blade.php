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
	
	
	<script type="text/javascript">
		$(document).ready(function()
		{
			$('.example41').multiselect({
				includeSelectAllOption: true,
				onChange: function(element, checked){
					var brands = $('.example41 option:selected');
					var selected = [];
					$(brands).each(function(index, brand){
						selected.push([$(this).val()]);
					});
					// Asignar arreglos para guardar los números de las carreras
					$("#carreras").val(selected);
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

			$("#clave2F").val(0);
			$("#materiaSeriada").val("SIN SERIACION");

		});
	</script>
	<!------------------------------------------------------------------------------------->
	
	<!---------------------------------- DATATABLES --------------------------------------->
		
		<!-- CSS -->
		<link rel="stylesheet" type="text/css" href="../css/jquery.dataTables.css">
		<!-- JS -->
		<script src="../js/jquery.dataTables.js"></script>

		<!-------------------------------------------------------------------------------->
</head>
<body>
<!-------------------------------------- VENTANAS MODALES CATÁLOGOS -------------------------------------->

	<!---------------------------------------- PLAN DE ESTUDIO ---------------------------------------->
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
	<!---------------------------------------- PLAN DE ESTUDIO ---------------------------------------->


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

			<form id="formularioPlanEstudio" method="post" action="<?=URL::to('planestudio/registrarua');  ?>">



			
				<div id="primerBloque">
					<!-- ----------------------------------- NO PLAN DIV ----------------------------------- -->
					<div id="noPlanDiv">
						<label>No.Plan:</label>
						<select class="con_estilo" type="text" name="noPlan" id="noPlan">
						@foreach ($codigosPE as $codigo )
						<option value="{{$codigo['codigo']}}">{{$codigo['formato']}}</option>
						@endforeach
						</select>
						<!-- TABLA MODAL NRO. PLAN-->
						<input class="md-trigger" data-modal="plan" type="button" value="+"></a>
						<!--             -->

					</div>
					

					<!-- ----------------------------------- CAMPUS  DIV ----------------------------------- -->

					<!--<div id="campusDiv">
						<label>Campus: </label>
						<label style="color:#ECA22E">{{Auth::user()->campus}}</label>
					</div>-->

					<!-- ----------------------------------- UNIDAD  DIV ----------------------------------- -->

					<div id="unidadDiv">
						<label>Unidad: </label>
						<label style="color:#ECA22E">{{Auth::user()->unidad}}</label>
						<!-- TABLA MODAL CAMPUS-->
						<!--<input class="md-trigger" data-modal="campus" type="button" value="+">-->
						<!--             -->
					</div>
					


					<!-- ----------------------------------- UNIDAD ACADEMICA DIV ----------------------------------- -->
					<div id="unidadAcademicaDiv">
						<label>U.Acad:</label>
						<label style="color:#ECA22E">{{Auth::user()->ua}}</label>
							
						<!-- TABLA MODAL UNIDAD-->
						<!--<input class="md-trigger" data-modal="unidad" type="button" value="+">-->
						<!--             -->
					</div>

					

					<!-- ----------------------------------- CARRERA  DIV ----------------------------------- -->

						<div id="carreraDiv">
							<label>Carrera:</label>

							<select id="select_carreras" name="example" multiple="multiple" class="example41">
					         </select>
							
							<!-- Campo oculto para id´s de carreras -->
							<input type="hidden" name="carreras" id="carreras"/>

								<!-- TABLA MODAL CARRERA-->
								<input class="md-trigger" data-modal="carrera" type="button" value="+">
								<!--             -->
						</div>

						
					<!-- ----------------------------------- NIVEL ----------------------------------- 
					<div id="nivelDiv">
						<label>Nivel: </label>
						<label style="color:#ECA22E; padding-left:5px;">LICENCIATURA</label>
						
					</div> -->


					<!-- ----------------------------------- CLAVE  DIV ----------------------------------- -->
				</div>
				
				<fieldset id="unidadaprendizaje">
					
					<div id="segundoBloque">
						
						<div id="claveDiv">
							 &nbsp;<label>Clave: </label>

							<input class="estilo_text" type="text" name="clave1F" id="clave1F" size="1" autocomplete="off">

							<br>
							<input type="checkbox" id="generarClave" name="generarClave" value="Generar">Generar clave
						</div>

					<!-- ----------------------------------- MATERIA  DIV ----------------------------------- -->
						
						<div id="materiaDiv">
							<label>Materia: </label>
							<input style="width: 375px; height: 25px; border-radius: 5px; border-color: #DBDBEA; text-transform:uppercase" type="text" name="materia" id="materia" size="1"/>
						
						</div>

			
					<!-- ----------------------------------- ETAPA  DIV ----------------------------------- -->

						<div id="etapaDiv">
							<label>Etapa: </label>

							<select style="width:143px;" class="con_estilo" name="etapaF" id="etapaF" size=1 type="text">
								@foreach ($etapas as $etapa)
								<option value="{{$etapa->etapa}}">{{$etapa->descripcion}}</option>
								@endforeach
							</select>
							<!-- TABLA MODAL ETAPA-->
							<input class="md-trigger" data-modal="etapa" type="button" value="+">
							<!--             -->
						</div>

					<!-- ----------------------------------- TIPO MATERIA  DIV ----------------------------------- -->

						<div id="tipoDiv">
							<label>Tipo: </label>
							<select style="width:143px;" class="con_estilo" name="tipoF" id="tipoF" size=1 type="text">
								@foreach ($tiposCaracter as $caracter)
								<option value="{{$caracter->caracter}}">{{$caracter->descripcion}}</option>
								@endforeach
							</select>
							<!-- TABLA MODAL NIVEL-->
							<input class="md-trigger" data-modal="tipo" type="button" value="+">
							<!--             -->
						</div>
					</div>


					<!-- ----------------------------------- SEMESTRE  DIV ----------------------------------- -->

					<div id="tercerBloque">
						<div id="semestreDiv">
							<label>Sem:</label>
							<input class="estilo_numeric" type="number" name="semestre" id="semestre" min="1" max="9" onkeypress="ValidaSoloNumeros()">
						</div>


						<fieldset id="group_seriacion">
							<legend>Seriación</legend>

					<!-- ----------------------------------- TIPO SERIACION  DIV ----------------------------------- -->

							<div id="seriacionDivTipo">
								<label>Tipo Seriación: </label>
									<select style="width: 143px" class="con_estilo" name="serie" id="serie" size=1 type="text">
										@foreach ($seriaciones as $seriacion)
										<option value="{{$seriacion->reqseriacion}}">{{$seriacion->descripcion}}</option>
										@endforeach
											
									</select>
									<!-- TABLA MODAL NIVEL-->
									<input class="md-trigger" data-modal="seriacion" type="button" value="+">
									<!--             -->
							</div>	

					<!-- ----------------------------------- CLAVE SERIACION  DIV ----------------------------------- -->
											
							<div id="claveSerDiv">
								<label>Clave: </label>
								<input class="estilo_text" type="text" name="clave2F" id="clave2F" list="datalist_clave2F" size="1" disabled="disabled" autocomplete="off">
								<datalist id="datalist_clave2F">
									@foreach ($unidadesAprendizaje as $materia)
										<option value="{{$materia->uaprendizaje}}">
									@endforeach
								</datalist>
							</div>
					<!-- ----------------------------------- MATERIA SERIACION  DIV ----------------------------------- -->

							<div id="seriacionDivMateria">
								<input class="con_estilo" style="height: 25px; width: 280px" text-transform:"uppercase" type="text" name="materiaSeriada" id="materiaSeriada" size="1" disabled/>	
							</div>

					
						</fieldset>

					<!-- ----------------------------------- COORDINACION  DIV ----------------------------------- -->


							<div id="coordDiv">
							<label>Coord: </label><input autocomplete="off" style="width:143px; text-transform:uppercase" class="coordina" type="text" name="coord" id="coord" size="1"  list="datalist_coord" dus>
							<datalist id="datalist_coord" name="c">
								@foreach ($coordinaciones as $coordinacion)
								<option value="{{$coordinacion->coordinaciona}}" label="{{$coordinacion->descripcion}}" >
								@endforeach
							</datalist>
							<!-- TABLA MODAL COORDINACIÓN-->
							<input class="md-trigger" data-modal="coordina" type="button" value="+">
							<!--             -->
						</div>

					</div>

					<!-- ----------------------------------- HORAS  DIV ----------------------------------- -->
		
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
						<br>
						<br>
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
						<br>
						<br>

					<!-- ----------------------------------- CREDITOS  DIV ----------------------------------- -->
						
						<div id="creditosDiv">
							<label>Créditos: </label><input class="estilo_numeric" type="number" name="creditosF" id="creditosF" min="1" >
						</div>

					<!-- ----------------------------------- OBSERVACIONES  DIV ----------------------------------- -->
						
						<div id="observacionesDiv">
							<label>Observaciones:</label><br>
							<textarea rows=3 cols="60" style=" border-radius:5px; border-color:#DBDBEA; text-transform:uppercase; resize:none" id="observaciones" name="observaciones" placeholder="Observaciones"></textarea>
						</div>


					<!----------------------------------- BOTON INSERTAR UA --------------------------------------------------------------- -->


						<div id="botones">
							<input type="button" style="width:120px"class="estilo_button2" type="button" value="Guardar" name="guardar" id="guardar">
						</div>
					</div>
				</fieldset>
			</form>

			
					<!---------------------------------------------------------------------------------------------------->


			<div id="GridPlanEstudio">
				<label style="font-size:1.2em;">No. Plan: </label><label style="font-size:1.2em; color:orange;" id="grid_plan">000</label>
				<div id="planTerminado">
					
					
					<input style="width:20px; height:20px;" type="checkbox" name="planTerminado" value="Generar"><label style="font-size:18px;">Plan de estudios terminado</label>
				</div>		
			<br>


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
		<tbody>
		</tbody>
	</table> 

	
</div>
		</section>
		<footer></footer>
		<!-- classie.js by @desandro: https://github.com/desandro/classie -->
		<script src="../js/classie.js"></script>
		<script src="../js/modalEffects.js"></script>

	</body>
<!----------------------------------------------------------->
<!--SCRIPT PARA VENTANA MODAL-->

<script type="text/javascript" src="../js/insertarua.js"></script>
<script>
$(document).ready( function() {
	
	var t = $('#tblUA').DataTable();
	// Funciones
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
	
	// Casos de la seriación
	$('#serie').on('change click',function(){
		var opcionSerie = $(this).val();
		if(opcionSerie==1)
		{
			$('#clave2F').attr('disabled','disabled').val("0");
			$('#materiaSeriada').val("SIN SERIACION");
		}
		else
		{
			$("#clave2F").removeAttr('disabled').val("");
			$("#materiaSeriada").val("");
		}
	});
	
	// Para seleccioar renglón
	$('#tblUA tbody').on( 'click', 'tr', function () 
	{
		if ( $(this).hasClass('selected') ) 
		{
			$(this).removeClass('selected');
		}
		else
		{
			$("#noPlan").attr('disabled','disabled');
			t.$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
			var materia = $(this).find('td:first').html();
			var serie = $(this).find('td').eq(5).html();
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
					$('#creditosF').val(json.creditos);
					$('#observaciones').val(json.observa);
					$("#guardar").val("Actualizar");
					var jsones = "";
					for(i in json.programas)
					{
						$(".example41").multiselect('select',json.programas[i].programaedu);
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
	});
	
	// Cuando pierde el foco la clave de la unidad de aprendizaje
	$("#clave1F").on("focusout",function(){
	if($(this).val()!="")
	{
		var idua = $(this).val();
		
		$.post("<?php echo URL::to('planestudio/obtenermateria'); ?>",{uaprendizaje:idua},function(materia){
			$("#materia").val(materia);
				$("#materia").css("background","pink");
			})
			.fail(function(){
				$("#materia").css("background","#9FF781");
			});
		}
	});
	
	// Mostrar clave de seriación
	$("#clave2F").on("focusout",function(){
		if($(this).val()!="")
		{
			var idua = $(this).val();
			$.post("<?php echo URL::to('planestudio/obtenermateria'); ?>",{uaprendizaje:idua},function(materia){
				$("#materiaSeriada").val(materia);
			});
		}
	});

	// Generar clave automática
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
		// Insertar p_ua y unidad de aprendizaje
				$("#guardar").on("click",function()
				{
					var opcion = $(this).val();
					// Si es guardar
					if(opcion == "Guardar")
					{
						var dataUA = $("#formularioPlanEstudio").serialize();
						$.post("<?php echo URL::to('planestudio/registrarua'); ?>",dataUA,function(data)
						{
						
							
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
							var coord=$("#coord").val().prop("label");
							var creditosF=$("#creditosF").val();
							var tablaDatos= $("#tblUA");
								$('.multiselect-container li').each(function(indice,elemento)
							{
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
						})
						.fail(function(){
							alert("fallo");
						});
					}else // Si es actualizar
					{	
							var materia=$("#clave1F").val();
						var plan = $("#noPlan").val();
						var dataUA = $("#formularioPlanEstudio").serialize();
						$.post("<?php echo URL::to('planestudio/actualizarua'); ?>",dataUA,function(){
							
							$("#guardar").val("Guardar");
							$('#tblUA').dataTable().fnClearTable();
							ActualizarUAS(plan);
							});

						//alert("Datos actualizados");
					}
				});
				// Al cambiar el Plan de Estudio actualizar unidades de aprendizaje y programas educativos
				$("#noPlan").on("change click",function(){
					
					$("#grid_plan").html($(this).val());
					var plan = $(this).val();
						$.post("<?php echo URL::to('planestudio/obtenerprogramas'); ?>",{noplan:plan},function(programas)
						{	
							var options = "";
							for(var i = 0; i < programas.length; i++)
							{
								options += "<option value="+programas[i].programaedu+" >"+programas[i].descripcion+"</option>";
							}
								$('#select_carreras').html(options);
								$('.example41').multiselect('rebuild');
						});
						ActualizarUAS(plan);
				});
			
			// Botón eliminar uaprendizaje plan estudios.
			$('#tblUA tbody').on('click','.clsEliminarFila',function(){
				if (confirm("¿ Está seguro de que desea eliminar ?"))
				{
					var materia = $(this).attr ("title");
					var carrera = $(this).attr("data");
					//document.location.href='users/delete/'+id;
					$.post("<?php echo URL::to('planestudio/eliminarpua'); ?>",{uaprendizaje:materia,programaedu:carrera})
						.done(function(data){
							alert("Unidad de aprendizaje: X eliminada de la carrera: X");
						});
					// Eliminar renglón
					t
					.row($(this).parents('tr'))
					.remove()
					.draw();
				}
				
			});
			});
	</script>

<!------------------------------------------------------------>

</html>