<!doctype html>
<html lang="es">
<head>
<meta charset="utf-8"/>

		<link rel="stylesheet" type="text/css" href="../css/normalize.css">
		<link rel="stylesheet" type="text/css" href="../css/estiloPrincipal.css">
		<link rel="stylesheet" type="text/css" href="../css/estilosnav.css">
		<link rel="stylesheet" type="text/css" href="../css/component.css"/>

		<!-- ------------------------------ Scripts Generales -------------------------------->
		<script type="text/javascript" src="../js/jquery-2.1.0.min.js"></script>

		

<!--AQUI VA HORA Y FECHA-->
		<script src="../js/tiempoactual.js"></script>
		<script>$(function(){startWatch(); return false;});</script>
		<!-- Script tiempo -->

<!---------------------------------------------------------------------------------------->
<title>Carga académica</title>
</head>
<body>
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
		Carga académica: Consulta, modificación y eliminación
	</div>
	<div id="loginmanual">
		<div id="login" class="texto_body">
			<img src="../imagenes/login.png" alt="">&nbsp;<a href="<?=URL::to('login/logout');?>"style="text-decoration:none; color:#004000;">Logout</a>
		</div>
		<div id="manual" class="texto_body">
			<img src="../imagenes/manual.png" alt=""><a href="<?=URL::to('ayuda/ayudaca');?>"style="text-decoration:none; color:#004000;">&nbsp;Manual</a>
		</div>
	</div>
</div>

<section>
	<div id="statusPlanEstudios"><label>Estatus: En proceso</label></div>
			<div id="checkSubdirector">
				<input style="width:18px; height:18px;" type="checkbox" name="checkSubdirector" value="Generar"><label style="font-size:18px;">Completado</label>
			</div>

	<div id="Consultas">
		<fieldset id="consultaPlan" style="margin:auto;">
			<legend>Consultar por:</legend>

			<div class="consultax_ca">
				
				<div class="consul_carrera_ca">
					<label>Carrera: </label>
					<select class="con_estilo" style="width:150px;" id="carrera_ca">
						@foreach($programas as $programa)
							<option value="{{$programa->programaedu}}">{{$programa->descripcion}}</option>
						@endforeach
					</select>
				</div>

				<div class="consul_carrera_ca">
					<label>Periódo: </label>
					<input class="estilo_text" style="width:150px;" type="text" name="periodo_ca" id="periodo_ca" list="datalist_periodo_ca" size=1 onkeypress="ValidaSoloNumeros()"/>
					<datalist id="datalist_periodo_ca">
						@foreach ($codigosPeriodo as $periodo)
							<option value="{{$periodo['formato']}}" codigo="{{$periodo['codigo']}}">
						@endforeach
					</datalist>
				</div>


				<div class="consul_carrera_ca">
					<label>Turno: </label>
					<!--<input class="estilo_text" style="width:150px;" type="text" name="turno_ca" id="turno_ca" list="datalist_turno_ca" size="1"/>
					<datalist id="datalist_turno_ca">
						<option value="MATUTINO">
						<option value="INTERTURNO">
						<option value="VESPERTINO">
					</datalist>-->
					<select class="estilo_text" style="width:150px; height:30px;" name="turno_ca" id="turno_ca"/>
						<option value="0">TODOS</option>
						@foreach($turnos as $turno)
							<option value="{{$turno->turno}}">{{$turno->descripcion}}</option>
						@endforeach
					</select>
				</div>

				<div class="consul_carrera_ca">
					<label>Semestre: </label>
					<select class="con_estilo" style="width:80px;" name="semestre_ca" id="semestre_ca">
						<option value="0">TODOS</option>
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
				</div>
				
				<div class="consul_carrera_ca">
					<label>Grupo: </label>
					<input class="estilo_text" style="width:80px;" type="text" name="grupo_ca" id="grupo_ca" list="datalist_grupo_ca" size=1 onkeypress="ValidaSoloNumeros()">
					<datalist id="datalist_grupo_ca">
					</datalist>
				</div>

				<div class="consul_carrera_ca">
					<input class="estilo_button2" style="width:130px; margin-top:-10px;" type="button" value="Buscar" id="consultarCarga">
				</div>
				
			</div>

			<!--<div class="consultay_ca">
				<div id="consul_seriacion_ca">
					<input style="width:18px; height:18px;" type="checkbox" name="seriacion_ca" value="seriacion_ca"><label>Seriadas</label>
				</div>
				
				<div id="consul_habilitados_ca">
					<input style="width:18px; height:18px;" type="checkbox" name="habilitados_ca" value="habilitados_ca"><label>Habilitadas</label>
				</div>

				<div id="consul_deshabilitados_ca">
					<input style="width:18px; height:18px;" type="checkbox" name="deshabilitados_ca" value="deshabilitados_ca"><label>Deshabilitadas</label>
				</div>
			</div>-->

				

		</fieldset>



				

	</div>

		<div id="GridPlanEstudio" style="height:2200px; margin-top:80px">
	<br>
		<!-------------------------------------------SEMESTRE 1 CONSULTA -------------------------------------------->
			<table class="tabla_ca" id="semestre1">
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
						<th style="width:50px">REQ. SERIACIÓN</th>
					</tr>
				</thead>
				<thead class="dd_encabezado_colorNaranja_tablaConsulta">
						<tr>
							<th colspan="7">OBLIGATORIAS</th>
							
						</tr>
				</thead>
				<tbody>
				</tbody>
				<thead class="dd_encabezado_colorNaranja_tablaConsulta">
						<tr>
							<th colspan="7">OPTATIVAS</th>
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

		<!-------------------------------------------SEMESTRE 2 CONSULTA -------------------------------------------->
			<table class="tabla_ca" id="semestre2">
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
						<th style="width:50px">REQ. SERIACIÓN</th>
					</tr>
				</thead>
				<thead class="dd_encabezado_colorNaranja_tablaConsulta">
						<tr>
							<th colspan="7">OBLIGATORIAS</th>
							
						</tr>
				</thead>
				<tbody>
				</tbody>
				<thead class="dd_encabezado_colorNaranja_tablaConsulta">
						<tr>
							<th colspan="7">OPTATIVAS</th>
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
<!-------------------------------------------SEMESTRE 3 CONSULTA -------------------------------------------->
			<table class="tabla_ca" id="semestre3">
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
						<th style="width:50px">REQ. SERIACIÓN</th>
					</tr>
				</thead>
				<thead class="dd_encabezado_colorNaranja_tablaConsulta">
						<tr>
							<th colspan="7">OBLIGATORIAS</th>
							
						</tr>
				</thead>
				<tbody>
				</tbody>
				<thead class="dd_encabezado_colorNaranja_tablaConsulta">
						<tr>
							<th colspan="7">OPTATIVAS</th>
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
<!-------------------------------------------SEMESTRE 4 CONSULTA -------------------------------------------->
			<table class="tabla_ca" id="semestre4">
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
						<th style="width:50px">REQ. SERIACIÓN</th>
					</tr>
				</thead>
				<thead class="dd_encabezado_colorNaranja_tablaConsulta">
						<tr>
							<th colspan="7">OBLIGATORIAS</th>
							
						</tr>
				</thead>
				<tbody>
				</tbody>
				<thead class="dd_encabezado_colorNaranja_tablaConsulta">
						<tr>
							<th colspan="7">OPTATIVAS</th>
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
<!-------------------------------------------SEMESTRE 5 CONSULTA -------------------------------------------->
			<table class="tabla_ca" id="semestre5">
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
						<th style="width:50px">REQ. SERIACIÓN</th>
					</tr>
				</thead>
				<thead class="dd_encabezado_colorNaranja_tablaConsulta">
						<tr>
							<th colspan="7">OBLIGATORIAS</th>
							
						</tr>
				</thead>
				<tbody>
				</tbody>
				<thead class="dd_encabezado_colorNaranja_tablaConsulta">
						<tr>
							<th colspan="7">OPTATIVAS</th>
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
<!-------------------------------------------SEMESTRE 6 CONSULTA -------------------------------------------->
			<table class="tabla_ca" id="semestre6">
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
						<th style="width:50px">REQ. SERIACIÓN</th>
					</tr>
				</thead>
				<thead class="dd_encabezado_colorNaranja_tablaConsulta">
						<tr>
							<th colspan="7">OBLIGATORIAS</th>
							
						</tr>
				</thead>
				<tbody>
				</tbody>
				<thead class="dd_encabezado_colorNaranja_tablaConsulta">
						<tr>
							<th colspan="7">OPTATIVAS</th>
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
<!-------------------------------------------SEMESTRE 7 CONSULTA -------------------------------------------->
			<table class="tabla_ca" id="semestre7">
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
						<th style="width:50px">REQ. SERIACIÓN</th>
					</tr>
				</thead>
				<thead class="dd_encabezado_colorNaranja_tablaConsulta">
						<tr>
							<th colspan="7">OBLIGATORIAS</th>
							
						</tr>
				</thead>
				<tbody>
				</tbody>
				<thead class="dd_encabezado_colorNaranja_tablaConsulta">
						<tr>
							<th colspan="7">OPTATIVAS</th>
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
<!-------------------------------------------SEMESTRE 8 CONSULTA -------------------------------------------->
			<table class="tabla_ca" id="semestre8">
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
						<th style="width:50px">REQ. SERIACIÓN</th>
					</tr>
				</thead>
				<thead class="dd_encabezado_colorNaranja_tablaConsulta">
						<tr>
							<th colspan="7">OBLIGATORIAS</th>
							
						</tr>
				</thead>
				<tbody>
				</tbody>
				<thead class="dd_encabezado_colorNaranja_tablaConsulta">
						<tr>
							<th colspan="7">OPTATIVAS</th>
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
<!-------------------------------------------SEMESTRE 9 CONSULTA -------------------------------------------->
			<table class="tabla_ca" id="semestre9">
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
						<th style="width:50px">REQ. SERIACIÓN</th>
					</tr>
				</thead>
				<thead class="dd_encabezado_colorNaranja_tablaConsulta">
						<tr>
							<th colspan="7">OBLIGATORIAS</th>
							
						</tr>
				</thead>
				<tbody>
				</tbody>
				<thead class="dd_encabezado_colorNaranja_tablaConsulta">
						<tr>
							<th colspan="7">OPTATIVAS</th>
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

		<div class="ca_btnImprimir">
			<input class="estilo_button2" style="width:145px;" type="button" value="Imprimir">
		</div>


</section>

	<footer>
			<!--<div id="pie_correo">email: emma.castillejos@uabc.edu.mx</div>
			<div id="pie_tel">Teléfono: 664 188 9221</div>-->

	</footer>

</div>
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

			function insertStr(stringTarget,stringAdd,stringIndex)
			{
				var string1 = stringTarget.substring(0,stringIndex);
				var string2 = stringTarget.substring(stringIndex);

				return String(string1+stringAdd+string2);
			}
</script>

<!------------------------------------------------------------------------------------------>
<script type="text/javascript">
	$(function(){
		// Ocultar tablas
		$("table:not(.ca_tblResumenConsulta)").hide();

		$("#carrera_ca").on("change",function(){
			$("#periodo_ca").val("");
		});

		$("#periodo_ca").on("input",function(){
			var periodoVal = $("#datalist_periodo_ca option[value='" + $(this).val() + "']").attr("codigo");
			// AQUI POSIBLE EVALUACION DEPENDIENDO EL USUARIO
			var programaVal = $("#carrera_ca").val();
			//alert(periodoVal + " "+ programaVal);
			if(periodoVal.length == 5)
			{
				$.post("<?php echo URL::to('cargaacademica/obtenergruposperiodo'); ?>",{programa:programaVal,periodo:periodoVal},function(grupos){
					var options = "";
					for (var i = 0; i < grupos.length; i++) {
						options += "<option value='" + grupos[i].grupo + "'>";
					}
					$("#datalist_grupo_ca").html(options);
				})
				.fail(function(errorText,textError,errorThrow){
					alert(errorText.responseText);
				});
			}
		});
		// Consulta principal a carga académica
		$("#consultarCarga").on("click",function(event){
			if($("#periodo_ca").val() == "")
			{
				alert("Es necesario introducir un período para continuar...");
			}

			// Limpiar tablas y encabezado de las mismas
			$("table:not(.ca_tblResumenConsulta)").hide();
			$("#semestre1 tbody,#semestre2 tbody,#semestre3 tbody,#semestre4 tbody,#semestre5 tbody,#semestre6 tbody,#semestre7 tbody,#semestre8 tbody,#semestre9 tbody").html("");
			$(".dd_encabezado_tablaConsulta tr th:eq(1)").empty();

			// Obtener programa educativo
			var programaedu = $("#carrera_ca").val();
			var periodo = $("#datalist_periodo_ca [value='" + $("#periodo_ca").val() + "']").attr("codigo");
			var turno = $("#turno_ca").val();
			var semestre = $("#semestre_ca").val();
			// Filtro de grupo
			var grupo =$("#grupo_ca").val();

			alert(programaedu + "\n" + periodo + "\n" + turno+ "\n" + semestre + "\n" + grupo);

			$.ajax({
				url : "<?php echo URL::to('cargaacademica/obtenercarga'); ?>",
				type : "post",
				data : { programa : programaedu , periodo : periodo, semestre:semestre, grupo:grupo},
				dataType : "JSON",
				success : function(data){
					console.log(data);

					for (var i = 0; i < data.uas.length; i++) 
					{
						// Filtro de turno
						var validarTurno = false;
						var filtroTurno = parseInt($("#turno_ca").val());
						
						
						switch(filtroTurno)
						{
							case 0:
							validarTurno = true;
							break;
							case 1:
							filtroTurno = "M";
							break;
							case 2:
							filtroTurno = "V";
							break;
							case 3:
							filtroTurno = "I";
							break;
							default:
							filtroTurno = "N";
							break;
						}
						
						var turnos = data.uas[i].turnos.split(","); 
						$.each(turnos,function(key,value){
							if(value == filtroTurno)
							{
								validarTurno = true;
								return false;
							}
						});
						

						if(validarTurno == true)
						{
							var renglon = "";
							// Poner en la seccion correspondiente de la tabla si es obligatoria:1 o seriada:2.
							
								renglon = "<tr>" + 
											"<td>" + data.uas[i].uaprendizaje + "</td>" +
											"<td>" + data.uas[i].descripcionmat + " - " + data.uas[i].grupos + "</td>" +
											"<td>" + data.uas[i].creditos + "</td>" +
											"<td>" + data.uas[i].HC + "</td>" +
											"<td>" + data.uas[i].etapa + "</td>" +
											"<td>" + ((data.uas[i].series == null) ? "SIN SERIACION" : data.uas[i].series) + "</td>" +
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
						$("#semestre" + data.planSemestres[i].semestre + " .dd_encabezado_tablaConsulta").find("th:eq(1)").text("PLAN: " + insertStr(String(data.planSemestres[i].plan),"-",4));
						// Filtro de semestres
						var filtroSemestre = parseInt($("#semestre_ca").val());
						if(filtroSemestre ==0 || filtroSemestre == data.planSemestres[i].semestre)
						{
							$("#semestre" + data.planSemestres[i].semestre).hide().fadeIn("slow");
						}
					}
				},
				error : function(errorText,textError,errorThrow){
					alert("Error: " + errorText.responseText);
				}
			});
		});

		
		
	});
</script>
</body>
</html>