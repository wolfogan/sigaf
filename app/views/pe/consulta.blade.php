<!doctype html>
<html lang="es">
<head>
	<meta charset="utf-8"/>

	<link rel="stylesheet" type="text/css" href="../css/normalize.css">
	<link rel="stylesheet" type="text/css" href="../css/estiloPrincipal.css">
	<link rel="stylesheet" type="text/css" href="../css/estilosnav.css">
	<link rel="stylesheet" type="text/css" href="../css/estilodrag.css">
	<link rel="stylesheet" type="text/css" href="../css/component.css"/>
	
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<!--<script type="text/javascript" src="../js/jquery.min.js"></script>-->
	<script type="text/javascript" src="../js/jquery.dragsort-0.5.1.min.js"></script>
	
	<!--AQUI VA HORA Y FECHA-->
	<script src="../js/tiempoactual.js"></script>
	<script>$(function(){startWatch(); return false;});</script>
	<!-- Script tiempo -->

	<script type="text/javascript">
		$(function(){
			$('.eliminarBloquecito').on('click',function()
			{
				$(this).parent().parent().remove();
			});
		});
	</script>
	<!---------------------------------------------------------------------------------------->
	<title>Plan de estudios</title>
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
			Plan de estudios: Consulta y modificación
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
		<div id="statusPlanEstudios"><label>Estatus: En proceso</label></div>
			<div id="checkSubdirector">
				<input style="width:18px; height:18px;" type="checkbox" name="checkSubdirector" value="Generar"><label style="font-size:18px;">Completado</label>
			</div>

			<div id="Consultas">
				<fieldset id="consultaPlan">
					<legend>Consultar por:</legend>
					<div id="consultax">
						<!------------------------ PLAN DE ESTUDIO ------------------------>
						<div id="consul_noPlan">
							<label>No.Plan: </label>
							<input class="estilo_text" style="width:115px" type="text" name="noPlan" id="noPlan" list="datalist_noPlan" size=1 onkeypress="ValidaSoloNumeros()"/>
							<datalist id="datalist_noPlan">
								@foreach ($codigosPE as $codigo)
									<option value="{{$codigo['formato']}}" plan="{{$codigo['codigo']}}">
								@endforeach
							</datalist>
						</div>
						<!------------------------ PROGRAMAS EDUCATIVOS ------------------------>
						<div id="consul_carrera">
							<label>Carrera: </label>
							<select class="con_estilo" name="carrera" size="1" id="carrera">
							</select>
						</div>
						<!------------------------ CLAVES DE UNIDADES DE APRENDIZAJE ------------------------>
						<div id="consul_clave">
							<label>Clave: </label>
							<input class="estilo_text" style="width:120px" type="text" name="clave" id="clave" list="datalist_clave" size=1 onkeypress="ValidaSoloNumeros()">
							<datalist id="datalist_clave">
								<!-- AQUI VAN LAS CLAVES -->
							</datalist>
						</div>
						<!------------------------ DESCRIPCION DE UNIDADES DE APRENDIZAJE ------------------------>
						<div id="consul_materia">
							<label>Materia: </label>
							<input type="text" style="width:300px;" name="materia" id="materiaCon" list="datalist_materia" size="1"/>
							<datalist id="datalist_materia">
							</datalist>
						</div>
					</div>
					<div id="consultay">
						<!------------------------ ETAPAS ------------------------>
						<div id="consul_etapa">
							<label>Etapa:</label>
							<select class="con_estilo" name="etapa" id="etapa" size=1>
								<option value="0">TODAS</option>
								@foreach ($etapas as $etapa)
									<option value="{{$etapa->etapa}}">{{$etapa->descripcion}}</option>
								@endforeach
							</select>
						</div>
						<!------------------------ CARACTERES ------------------------>
						<div id="consul_tipo">
							<label>Tipo: </label>
							<select class="con_estilo" name="tipo" id="tipo" size="1">
								<option value="0">TODAS</option>
								@foreach ($tiposCaracter as $tipo)
									<option value="{{$tipo->caracter}}">{{$tipo->descripcion}}</option>
								@endforeach
							</select>
						</div>
						<!------------------------ TIPOS DE SERIACION ------------------------>
						<!--<div id="consul_serie">
							<label>Seriación: </label>
							<select class="con_estilo" name="seriacion" id="seriacion" size="1">
								<option value="0">TODAS</option>
								@foreach ($seriaciones as $seriacion)
									<option value="{{$seriacion->reqseriacion}}">{{$seriacion->descripcion}}</option>
								@endforeach
							</select>
						</div>-->
						<!------------------------ COORDINACIONES ------------------------>
						<div id="consul_coor">
							<label>Coord: </label>
							<input type="text" id="coordinacion" style="width:120px" size=1 list="datalist_coord">
							<datalist id="datalist_coord">
								@foreach ($coordinaciones as $coordinacion)
									<option value="{{$coordinacion->descripcion}}" codigo="{{$coordinacion->coordinaciona}}">
								@endforeach
							</datalist>
						</div>
						<!---------------------- CHECK DE TRONCO COMUN ---------------------->
						<div id="checkTroncoComun">
							<input style="width:18px; height:18px;" type="checkbox" checked name="troncoComun" id="troncoComun"><label style="font-size:18px;">Tronco común</label>
						</div>
					</div>
				</fieldset>
				
				<div id="consultaboton">
						<input class="estilo_button2" type="button" value="Limpiar">
						<div id="consultaboton_limpiar"><input class="estilo_button2" type="button" value="Buscar" id="Buscar"></div>
				</div>
			</div>
			<!---------------------------- ENCABEZADOS DE LAS ETAPAS ---------------------------->
			<div id="consultaetapas">
				<div id="etapabasica">
					Etapa básica
				</div>
				<div id="etapadisciplinaria">
					Etapa disciplinaria
				</div>
				<div id="etapaterminal">
					Etapa terminal
				</div>
			</div>
			<!--<div id="basica_semestres">
				<div id="semestre_uno">1</div>
				<div id="semestre_dos">2</div>
				<div id="semestre_tres">3</div>
			</div>
			<div id="disciplinaria_semestres">
				<div id="semestre_cuatro">4</div>
				<div id="semestre_cinco">5</div>
				<div id="semestre_seis">6</div>
			</div>
			<div id="terminal_semestres">
				<div id="semestre_siete">7</div>
				<div id="semestre_ocho">8</div>
				<div id="semestre_nueve">9</div>
			</div>-->
			<br>
			<br>
		</div>
		<script type="text/javascript">
			$("ul:first").dragsort();
		</script>
		<div id="cuadros">
			<!------------------------------ ETAPA TERMINAL ------------------------------>
			<ul id="list3" etapa="3">
				<li style="width:0%; padding:0; background-color:red;"></li>
				<!--<input type="image" class="eliminarBloquecito" src="../imagenes/deleteTachita.png" id="elimImg"> -->
			</ul>
			<!------------------------------ ETAPA DISCIPLINARIA ------------------------------>
			<ul id="list2" etapa="2">
				<li style="width:0%; padding:0; background-color:red;"></li>
			</ul>
			<!------------------------------ ETAPA BASICA ------------------------------>
			<ul id="list1" etapa="1">
				<li style="width:0%; padding:0; background-color:red;"></li>
			</ul>
			<!-- <input style="margin-left:40px; margin-top:5px" class="eliminarBloquecito" type="button" value="-">-->
		</div>
		<div style="clear:both;"></div>
		<br />
		<div id="totalcreditos">
			<label> Materias obligatorias:</label><label id="creditos_obligatorias">0</label>
			<label> Materias optativas:</label><label id="creditos_optativas">0</label><br>
			<label> Total de creditos: </label><label id="creditos_total">0</label>
		</div>
		<div id="pe_consultaActualizada">!ETAPA ACTUALIZADA!</div>

		<div id="actualizaimprime">
			<input style="font-size:19px" class="estilo_button2" type="button" value="Imprimir">
		</div>
		<!---------------------------------------- VENTANA MODAL PARA ACTULIAZACION DE UA ----------------------------------------> 
		<div class="md-modal1 md-effect-11" id="modal-11" >
			<form id="formUpdate" action="javascript:actualizarUA()" class="md-content">
				<h3 id="titulo_update">Modificar unidad de aprendizaje</h3>
				
				<div id="tablita2contenedor" >
					<table cellpadding="5" id="tablita2" style="width:650px;">
						<tr>
							<td>Carrera:</td>
							<td>
								<label id="carrera_update">PROGRAMA EDUCATIVO</label>
								<input type="hidden" id="programa" name="programaedu" />
							</td>
							<td>Semestre:</td>
							<td>
								<input class="estilo_numeric" type="number" name="semestre" id="semestre_update" min="1" max="9">
							</td>
						</tr>
						<tr>
							<td width="95">Clave:</td>
							<td width="301"><input type="text" name="clave1F" id="clave_update" style="height: 25px; text-transform:uppercase; width:120px;" size="25"></td>
							<td>Materia:</td>
							<td><input type="text" name="materia" id="descripcion_update" style="height: 25px; text-transform:uppercase; width:180px;" size="25"></td>
						</tr>
						
						<tr>
							<td>Etapa:</td>
							<td>
								<select class="con_estilo" name="etapaF" id="etapa_update">
									@foreach ($etapas as $etapa)
										<option value="{{$etapa->etapa}}">{{$etapa->descripcion}}</option>
									@endforeach
								</select>
							</td>
							<td>Tipo:</td>
							<td>
								<select class="con_estilo" style="width:183px;" name="tipoF" id="tipo_update" size=1>
									@foreach ($tiposCaracter as $tipo)
										<option value="{{$tipo->caracter}}">{{$tipo->descripcion}}</option>
									@endforeach
								</select>
							</td>
						</tr>
					
						<tr>
							<td size="10">HC:</td>
							<td><input class="estilo_numeric" type="number" name="hc" id="hc_update" min="0" max="9" onkeypress="ValidaSoloNumeros()" ></td>
							<td size="10">HL:</td>
							<td><input class="estilo_numeric" type="number" name="hl" id="hl_update" min="0" max="9" onkeypress="ValidaSoloNumeros()" ></td>
						</tr>
						
						<tr>
							<td size="10">HT:</td>
							<td><input class="estilo_numeric" type="number" name="ht" id="ht_update" min="0" max="9" onkeypress="ValidaSoloNumeros()" ></td>
							<td size="10">HE:</td>
							<td><input class="estilo_numeric" type="number" name="he" id="he_update" min="0" max="9" onkeypress="ValidaSoloNumeros()" ></td>
						</tr>
						
						<tr>
							<td size="10">HPC:</td>
							<td><input class="estilo_numeric" type="number" name="hpc" id="hpc_update" min="0" max="9" onkeypress="ValidaSoloNumeros()" ></td>
							<td size="10">HCL:</td>
							<td><input class="estilo_numeric" type="number" name="hcl" id="hcl_update" min="0" max="9" onkeypress="ValidaSoloNumeros()" ></td>
						</tr>
						<tr>
							<td>Cred.:</td>
							<td><input class="estilo_numeric" type="number" name="creditosF" id="creditos_update" onkeypress="ValidaSoloNumeros()" >
							<td>Coord.:</td>
							<td>
								<input class="con_estilo" type="text" id="coordinacion_update" name="coordinacion_update" style="width:180px" size="1" list="datalist_coord" />
								<input type="hidden" name="coord" id="coord" />
							</td>
						</tr>
					</table>
					<br>

					<div class="div_pe_tableContainer" class="pe_tableContainer">

						<table id="tblUpdateSeriaciones" style="width:700px;" border="0" cellpadding="0" cellspacing="0" width="100%" class="scrollTable">
							<thead style="background:green">
								<tr>
									<th colspan="7">MATERIAS SERIADAS</th>
								</tr>
							</thead>

							<tbody class="scrollContent" style="height:155px;">

								<!--<tr class="sin-seriacion">-->
								<tr class = "sin-seriacion">
									<td colspan="7" style="text-align:center; font-size:2em;">SIN SERIACION</td>
								</tr>

								<!--<tr class="fila-base-seriacion">-->
								<tr class="fila-base-seriacion">

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
				<div class="catBotones" style="margin-top:10px;">
					<input type="hidden" id="user" name="users_id" / >
					<input type="submit" value="Guardar" class="estilo_button2" style="height:40px;">
					<input type="button" class="md-close" value="Salir" style="height:40px;">

				</div>
			</form>

		</div>
			




					
					<!--<label for="title-seriacion">Unidades de Aprendizaje Seriadas:</label>
					
					<table class="tblCatPlanUpdateSeriacion">
						<tr class="sin-seriacion" onmouseover="javascript:this.style.cursor='pointer'">
							<td colspan="7" style="text-align:center; font-size:2em;">SIN SERIACION</td>
						</tr>
						<tr class="fila-base-seriacion">
							<td>Tipo:</td>
							<td>
								<select style="width: 100px; height: 30px; border-radius: 5px; border-color: #DBDBEA;" type="text" class="tipo-seriacion" />
									@foreach($seriaciones as $seriacion)
										<option value="{{$seriacion->reqseriacion}}">{{$seriacion->descripcion}}</option>
									@endforeach
								</select>
							</td>

							<td>Clave:</td>
							<td><input style="width: 80px; height: 30px; border-radius: 5px; border-color: #DBDBEA;" type="text" class="clave-seriacion"/></td>
							<td><input style="width: 100px; height: 30px; border-radius: 5px; border-color: #DBDBEA;" type="text" class="clave-seriacion-descripcion" disabled="true"  /></td>
							
							<td><input type="button" class="clsEliminarFila" style="height:30px; width:30px;"value="-"></td>
							<td><input type="button" class="dd_clsAgregarFila"></td>
						</tr>
					</table>-->
				
		<!--<button class="md-trigger" data-modal="modal-11">+</button>-->
		<div class="md-overlay">
		<!---------------------------------------- VENTANA MODAL PARA ACTULIAZACION DE UA ----------------------------------------> 
	</section>
	<footer>
			<!--<div id="pie_correo">email: emma.castillejos@uabc.edu.mx</div>
			<div id="pie_tel">Teléfono: 664 188 9221</div>-->

	</footer>
	<script type="text/javascript">
		function aleatorio(inferior,superior)
		{
			posibilidades = superior - inferior;
			num = Math.random() * posibilidades;
			num = Math.floor(num);
			return parseInt(inferior)+num;
		}
		
		function color_aleatorio()
		{
			var hexadecimal = new Array("0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F");
			var colorAleatorio = "#";
			for (var i = 0; i < 6; i++) {
				posArray = aleatorio(0,hexadecimal.length);
				colorAleatorio += hexadecimal[posArray];
			}
			return colorAleatorio;
		}

		
	</script>
	<script type="text/javascript">
	$(function(){
		// Usuario fijo
		
		$("#user").val({{Auth::user()->id}});
		// VALORES INICIALES
		//$("#checkTroncoComun").hide();
		// CARGAR UA'S Y MATERIAS DESPUES DE SELECCIONAR EL PLAN DE ESTUDIO
		var plan = 0;
		var carrera = 0;
		var etapa = "";
		var reqseriacion = "";
		var coordinacion = "";
		var caracter = "";
		$("#noPlan").on("input",function(){
			if($(this).val().length>5)
			{
				//Limpiar busquedas anteriores
				$("#list1 li:not(:first), #list2 li:not(:first), #list3 li:not(:first)").remove();
				//alert("se activo");
				// Obtener el código del plan de estudios
				plan = $("#datalist_noPlan option[value="+$(this).val()+"]").attr('plan');
				//alert(plan);
				
				// Obtener las carreras que son parte del Plan de Estudios elegido
				$.post("<?php echo URL::to('planestudio/obtenerprogramas'); ?>",{noplan:plan},function(programas){
					var options = "";
					carrera = programas[0].programaedu;
					$("#programa").val(carrera);

					for(var i = 0; i < programas.length; i++)
					{
						options += "<option value="+programas[i].programaedu+" >"+programas[i].descripcion+"</option>";
					}
					$("#carrera").html(options);
					// Habilitar opciones de consulta
					$("#checkTroncoComun").show();
					$("#etapa").val("0").prop("disabled",false);
					$("#tipo").val("0").prop("disabled",false);
					$("#seriacion").val("0");
					etapa = "";
					reqseriacion = "";
					coordinacion = "";
					caracter = "";
				}).fail(function(errorText,textError,errorThrow){alert("Fallo en obtener los programas educativos " + errorText.responseText);});
				
			}
		});
		// ACCIONES PARA EL COMBOBOX DE PROGRAMAS EDUCATIVOS
		$("#carrera").on("change",function(){
			//alert(plan);
			//Limpiar busquedas anteriores
			$("#list1 li:not(:first), #list2 li:not(:first), #list3 li:not(:first)").remove();
			carrera = $(this).val();
			// Cambio de valores
			$("#programa").val(carrera);

			if($(this).val()!=6)
			{
				$("#checkTroncoComun").show();
				$("#etapa").val("0").prop("disabled",false);
				$("#tipo").val("0").prop("disabled",false);
				etapa = "";
				tipo = "";
			}
			else
			{
				$("#troncoComun").prop("checked",false);
				$("#checkTroncoComun").hide();
				$("#etapa").val("1").prop("disabled",true);
				$("#tipo").val("1").prop("disabled",true);
				etapa = 1;
				tipo = "";
			}

			// Obtener las claves para la seriación de las ua registradas en el plan.
			$.post("<?php echo URL::to('planestudio/obtenerclavescarrera'); ?>",{noplan:plan,programaedu:carrera},function(claves){
				var optionsClave="",optionsDescripcion="";
				for(var i=0;i<claves.length;i++)
				{
					optionsClave += "<option value="+claves[i].uaprendizaje+" />";
					optionsDescripcion += '<option value="'+claves[i].descripcionmat+'" />';
				}
				$("#datalist_clave").html(optionsClave);
				$("#datalist_materia").html(optionsDescripcion);
				//$("#datalist_materia").html(options);
				//alert("Funciono");
			}).fail(function(errorText,textError,errorThrow){
				alert("Fallo en obtener las unidades de aprendizaje" + errorText.responseText);
			});
		});
		// ELECCION DE VARIABLES CONSULTA, CARACTER,REQSERIACION,COORDINACION
		$("#etapa").on("change",function(){
			if($(this).val()==0)
				etapa = "";
			else
				etapa = $(this).val();
			//alert(etapa);
		});
		$("#tipo").on("change",function(){
			if($(this).val()==0)
				caracter = "";
			else
				caracter = $(this).val();
			//alert(caracter);
		});
		$("#seriacion").on("change",function(){
			if($(this).val()==0)
				reqseriacion = "";
			else
				reqseriacion = $(this).val();
			//alert(seriacion);
		});
		$("#coordinacion").on("input",function(){
			if($(this).val()=="")
				coordinacion = "";
			else
				coordinacion = $("#datalist_coord option[value='"+$(this).val()+"']").attr("codigo");
			//alert(coordinacion);
		});
		$("#coordinacion_update").on("input",function(){
			if($(this).val()==""||$(this).val().length < 6)
				$("#coord").val(22);
			else
				$("#coord").val($("#datalist_coord option[value='"+$(this).val()+"']").attr("codigo"));
			//alert(coordinacion);
		});
		// BUSQUEDA Y CONSULTA DE UNIDADES DE APRENDIZAJE
		$("#Buscar").on("click",function(){
			// Variables total de los creditos
			creditosObligatorias = 0;
			creditosOptativas = 0;
			totalCreditos = 0;
			// Limpiar etiquetas de creditos
			$("#creditos_obligatorias").text(creditosObligatorias);
			$("#creditos_optativas").text(creditosOptativas);
			$("#creditos_total").text(totalCreditos);
			// Limpiar busquedas anteriores
			$("#list1 li:not(:first), #list2 li:not(:first), #list3 li:not(:first)").remove();
			var troncoComun = $("#troncoComun").prop("checked"); // Checar true o false del check de Tronco Común
			// Verificar datos depuración:
			//alert("Etapa: "+etapa+"\nCaracter: "+caracter+"\nReqseriacion: "+reqseriacion+"\nCoordinacion: "+coordinacion+"\nTronco Comun: "+troncoComun);
			//	SI EL FILTRO CONTEMPLA TODAS LAS ETAPAS
			function creacionBloques(uas,lista)
			{
				var bloque ="";
				var descripcionUA = "";
				for (var i = 0; i < uas.length; i++) 
				{
					//alert(uas[i].seriacion); // Mostrar las seriaciones
					descripcionUA = '<span>'+uas[i].uaprendizaje + '</span><br /><span>' + uas[i].descripcionmat + '</span><br />C<span>' + uas[i].HC + '</span> T<span>' + uas[i].HT + '</span> CR<span>' + uas[i].creditos + '</span>';
					bloque = $('<li>' +
									'<div style="font-size:9px" class="md-trigger unidad" data-modal="modal-11" tipo="'+uas[i].caracter+'" etapa="'+uas[i].etapa+'">' +
										descripcionUA +
									'</div>'+
								'</li>').hide().fadeIn("slow");
					
					/*if(uas[i].reqseriacion != "1")
					{
						var color = color_aleatorio();
						$(bloque).children().css("border","4px dotted "+ color);
						$("ul li div span:first-child:contains('"+uas[i].claveD+"')").parent().css("border","4px dotted " + color);
					}*/
					
					
					$(lista).append(bloque);
					bloque = "";
					if(uas[i].caracter=="OBLIGATORIA")
						creditosObligatorias += uas[i].creditos;
					if(uas[i].caracter=="OPTATIVA")
						creditosOptativas += uas[i].creditos;
				}
			}
			// Filtro individual y retornar la funcion.
			if($("#clave").val().length == 5)
			{
				var ua = $("#clave").val();
				$.post("<?php echo URL::to('planestudio/obtenerdatauacarrera'); ?>",{noplan:plan,programaedu:carrera,uaprendizaje:ua},function(ua){
					creacionBloques(ua,$("#list" + ua[0].etapa));
					activarModal();
					asignarEventoDatos();
					// Mostrar informacion de los creditos
					$("#creditos_obligatorias").text(creditosObligatorias);
					$("#creditos_optativas").text(creditosOptativas);
					$("#creditos_total").text(totalCreditos);
				})
				.fail(function(errorText,textError,errorThrow){
					alert("Error: " + errorText.responseText);
				});
				return;
			}

			if(etapa=="")
			{
				$.post("<?php echo URL::to('planestudio/obteneruascarrera'); ?>",{noplan:plan,programaedu:carrera,etapa:1,caracter:caracter,reqseriacion:reqseriacion,coordinacion:coordinacion,troncocomun:troncoComun},function(uas){
					creacionBloques(uas,$("#list1"));
					$.post("<?php echo URL::to('planestudio/obteneruascarrera'); ?>",{noplan:plan,programaedu:carrera,etapa:2,caracter:caracter,reqseriacion:reqseriacion,coordinacion:coordinacion,troncocomun:false},function(uas){
						creacionBloques(uas,$("#list2"));
						$.post("<?php echo URL::to('planestudio/obteneruascarrera'); ?>",{noplan:plan,programaedu:carrera,etapa:3,caracter:caracter,reqseriacion:reqseriacion,coordinacion:coordinacion,troncocomun:false},function(uas){
							creacionBloques(uas,$("#list3"));
							activarModal();
							asignarEventoDatos();
							totalCreditos = creditosObligatorias + creditosOptativas;
							// Mostrar informacion de los creditos
							$("#creditos_obligatorias").text(creditosObligatorias);
							$("#creditos_optativas").text(creditosOptativas);
							$("#creditos_total").text(totalCreditos);
							
						});
					});
				})
				.fail(function(errorText,textError,errorThrow){
					alert("Error: " + errorText.responseText);
				});
			}
			else // Si solo es una etapa
			{
				$.post("<?php echo URL::to('planestudio/obteneruascarrera'); ?>",{noplan:plan,programaedu:carrera,etapa:etapa,caracter:caracter,reqseriacion:reqseriacion,coordinacion:coordinacion,troncocomun:troncoComun},function(uas){
					creacionBloques(uas,$("#list"+etapa))
					activarModal();
					asignarEventoDatos();
					// Mostrar informacion de los creditos
					$("#creditos_obligatorias").text(creditosObligatorias);
					$("#creditos_optativas").text(creditosOptativas);
					$("#creditos_total").text(totalCreditos);
				});
			}
		});
		// SUMAR CREDITOS DE HORAS CLASE
		$("#hc_update,#hl_update,#ht_update,#hcl_update,#he_update,#hpc_update").on("input focusout change",function(){
			var hc = parseInt($("#hc_update").val())*2;
			var hl = parseInt($("#hl_update").val());
			var ht = parseInt($("#ht_update").val());
			var hcl = parseInt($("#hcl_update").val());
			var hpc = parseInt($("#hpc_update").val());
			var he = parseInt($("#he_update").val());
			var creditos = hc + hl + ht + hcl + hpc + he;
			$("#creditos_update").val(creditos);
		});
		// EVENTOS EN LA VENTANA MODAL DE CONSULTA DE UNIDAD DE APRENDIZAJE
		$(".sin-seriacion").on("click",function(){
			var rowCount = $("#tblUpdateSeriaciones > tbody > tr").length;
			if(rowCount > 2)
			{
				var filaSeriacion = $("#tblUpdateSeriaciones tr:last-child");
				if($(filaSeriacion).find(".clave-seriacion-descripcion").val()=="" || $(filaSeriacion).find(".clave-seriacion-descripcion").val()=="NO EXISTE")
				{
					alert("Por favor, agregue una seriación válida");
					return;
				}
			}
			

			var seriacionNueva = $(".fila-base-seriacion").clone().removeClass("fila-base-seriacion").appendTo("#tblUpdateSeriaciones");
			$(seriacionNueva).find(".tipo-seriacion").attr("name","seriacion_tipo[]");
			$(seriacionNueva).find(".clave-seriacion").attr("name","seriacion_clave[]");
			
			$(this).hide();
		});
		// Presionene boton agregar de las filas
		$("#tblUpdateSeriaciones").on("click",".dd_clsAgregarFila",function(){
			
			var filaSeriacion = $(this).parents().get(1);
			// Validar clave de seriación
			if($(filaSeriacion).find(".clave-seriacion-descripcion").val()=="" || $(filaSeriacion).find(".clave-seriacion-descripcion").val()=="NO EXISTE")
			{
				alert("Por favor, agregue una seriación válida");
				return;
			}
			// Duplicar fila base y añadir a tabla
			var seriacionNueva = $(".fila-base-seriacion").clone().removeClass("fila-base-seriacion").appendTo("#tblUpdateSeriaciones");
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
		// Presionen el boton eliminar de las filas
		$("#tblUpdateSeriaciones").on("click",".clsEliminarFila",function(){
			var filaSeriacion = $(this).parents().get(1);
			// Remover fila
			$(filaSeriacion).remove();
			// Habilitar fila anterior
			$("#tblUpdateSeriaciones tr:last-child").find("input:not('.clave-seriacion-descripcion'),select").removeAttr("disabled");

			// Si se elimina la última fila, mostrar mensaje sin seriación
			var rowCount = $("#tblUpdateSeriaciones > tbody > tr").length;
			if(rowCount == 2)
				$(".sin-seriacion").show();
		});
		
		// Cargar descripcion de ua cuando la tecleen o seleccionen
		$("#tblUpdateSeriaciones").on("input",".clave-seriacion",function(){
			
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
	});
	</script>

	<script type="text/javascript">
		var divUA; // Para almacenar el div seleccionado
		var etapaOld = 0; // Si cambian la etapa almacenar la etapa vieja para hacer la comparacion funciones involucradas (actualizarUA,asignarEventosDatos)
		$("#list1, #list2, #list3").dragsort({ dragSelector: "div", dragBetween: true, dragEnd: saveOrder, placeHolderTemplate: "<li class='placeHolder'><div></div></li>" });
		// Variables total de los creditos
		var creditosObligatorias = 0;
		var creditosOptativas = 0;
		var totalCreditos = 0;
		
		// ACTUALIZAR ETAPA CUANDO LA ARRASTRAN EN LA GRILLA CORRESPONDIENTE
		function saveOrder() {
			//var data = $("#list1 li").map(function() { return $(this).children().html(); }).get();
			//$("input[name=list1SortOrder]").val(data.join("|"));
			//alert("Vamos a actualizar la etapa");
			var uaid=$(this).find("span").eq(0).text();
			var etapa = $(this).parents("ul").attr("etapa");
			var programaedu = $("#carrera").val();
			//alert("PROGRAMA:" + programaedu + "UAID: "+uaid +"Etapa: "+etapa);
			$.post("<?php echo URL::to('planestudio/actualizaretapa'); ?>",{programaedu:programaedu,uaprendizaje:uaid,etapa:etapa},function(ua){
				//alert(ua);
				$("#pe_consultaActualizada").css("visibility","visible").fadeIn(300).fadeOut(1000);
			});
		}
		
		function actualizarCreditos()
		{
			creditosObligatorias = 0;
			creditosOptativas = 0;
			totalCreditos = 0;
			$("ul li:not(:first) div").each(function(index,element){
					if($(this).attr("tipo")=="OBLIGATORIA")
						creditosObligatorias += parseInt($(this).find("span").eq(4).text());
					if($(this).attr("tipo")=="OPTATIVA")
						creditosOptativas += parseInt($(this).find("span").eq(4).text());
			});
			totalCreditos = creditosObligatorias + creditosOptativas;
			// alert(creditosObligatorias);
			// alert(creditosOptativas);
			// Mostrar informacion de los creditos
			$("#creditos_obligatorias").text(creditosObligatorias);
			$("#creditos_optativas").text(creditosOptativas);
			$("#creditos_total").text(totalCreditos);
		}
		
		function actualizarUA()
		{
			// Orden de los span:
			// eq(0) - uaprendizaje
			// eq(1) - descripcionmat
			// eq(2) - hc
			// eq(3) - hl
			// eq(4) - total
			dataUA = $("#formUpdate").serialize(); //+ & + $("#tblUpdateSeriaciones").serialize();
			alert(dataUA);
			//var etapaOld = $("#etapa_update").val(); //Almacenar la etapa inicial
			$.post("<?php echo URL::to('planestudio/actualizarua'); ?>",dataUA,function(ua){
				$(divUA).find("span").eq(1).text($("#descripcion_update").val());
				$(divUA).find("span").eq(2).text($("#hc_update").val());
				$(divUA).find("span").eq(3).text($("#hl_update").val());
				$(divUA).find("span").eq(4).text($("#creditos_update").val());
				// Cambiar el tipo en el DIV internamente como atributo
				if($("#tipo_update").val()==1)
					$(divUA).attr("tipo","OBLIGATORIA");
				if($("#tipo_update").val()==2)
					$(divUA).attr("tipo","OPTATIVA");
				// Actualizar creditos;
				actualizarCreditos();
				alert("Actualizacion Completada");

				$(".md-close").click();

				// Colocar en la nueva etapa si se modifico la etapa, evaluar la etapaOld
				//alert(etapaOld);
				//alert(ua.etapa);
				if(etapaOld != ua.etapa)
				{
					var lista = "#list" + $("#etapa_update").val();
					$(lista).append($(divUA).parent());
				}
			})
			.fail(function(errorText,textError,errorThrow){
				alert("FALLO EN EL REGISTRO: " + errorText.responseText);
			});
		}

		function asignarEventoDatos()
		{
			$("ul li div").on("click",function(){
				//alert("Aqui paso algo");
				divUA = $(this);
				var uaid = $(this).find("span").eq(0).text();
				var etapa = $(divUA).attr("etapa");
				var programaedu = $("#carrera").val();
				//alert(uaid);
				$.post("<?php echo URL::to('planestudio/obtenerdataua'); ?>",{programaedu:programaedu,uaprendizaje:uaid,consulta:true},function(ua){
					//alert("consulto");
					
					$("#titulo_update").html(ua.descripcionmat);
					$("#carrera_update").text($("#carrera option:selected").html());
					$("#clave_update").val(uaid);
					$("#descripcion_update").val(ua.descripcionmat);
					$("#etapa_update").val(etapa);
					etapaOld = etapa; // Por si cambian la etapa reubicar el div en la etapa correspondiente
					$("#tipo_update").val(ua.caracter);
					$("#semestre_update").val(ua.semestre_sug);
					//$("#seriacion_update").val(ua.reqseriacion);
					//$("#claveSeriacion_update").val(ua.claveD);
					// FALTA DESCRIPCION DE LA SERIADA
					$("#hc_update").val(ua.hc);
					$("#hl_update").val(ua.hl);
					$("#ht_update").val(ua.ht);
					$("#he_update").val(ua.he);
					$("#hpc_update").val(ua.hpc);
					$("#hcl_update").val(ua.hcl);
					$("#creditos_update").val(ua.creditos);
					$("#coordinacion_update").val($("#datalist_coord option[codigo='"+ua.coordinaciona+"']").prop("value"));
					$("#coord").val(ua.coordinaciona);

					// CARGAR SERIACIONES
					// Limpiar tabla seriaciones
					$("#tblUpdateSeriaciones > tbody > tr").not(":eq(0) , :eq(1)").remove();
					$(".sin-seriacion").show();
					// Iterar por las series
					for(i in ua.series)
					{
						// Duplicar fila base y añadir a tabla las seriaciones extraidas de la BD
						var seriacionNueva = $(".fila-base-seriacion").clone().removeClass("fila-base-seriacion").appendTo("#tblUpdateSeriaciones");
						$(".sin-seriacion").hide();
						//console.log(filaSeriacion);
						
						// Valores de las ua seriadas
						$(seriacionNueva).find("select:eq(0)").val(ua.series[i].reqseriacion);
						$(seriacionNueva).find("input:eq(0)").val(ua.series[i].uaprequisito);
						$(seriacionNueva).find("input:eq(1)").val(ua.series[i].descripcionmat);

						// Para la actualizacion posterior
						$(seriacionNueva).find(".tipo-seriacion").attr("name","seriacion_tipo[]");
						$(seriacionNueva).find(".clave-seriacion").attr("name","seriacion_clave[]");
					}
					
				})
				.fail(function(errorText,textError,errorThrow){alert("Fallo en la consulta de la unidad de aprendizaje: " + errorText.responseText)});
			});
		}

		function activarModal()
		{
			var overlay = document.querySelector( '.md-overlay' );

			[].slice.call( document.querySelectorAll( '.md-trigger' ) ).forEach( function( el, i ) {

				var modal = document.querySelector( '#' + el.getAttribute( 'data-modal' ) ),
					close = modal.querySelector( '.md-close' );

				function removeModal( hasPerspective ) {
					classie.remove( modal, 'md-show' );
					if( hasPerspective ) {
						classie.remove( document.documentElement, 'md-perspective' );
					}
					
				}
				function removeModalHandler() {
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
					
					$("#formUpdate :text").val("");
					$("#formUpdate :checkbox").val("");
					$("#formUpdate input[type=number]").val(0);
					$("#titulo_update").text("Unidad de Aprendizaje");
					// Limpiar tabla seriaciones
					//$("#tblUpdateSeriaciones > tbody > tr").not(":eq(0) , :eq(1)").remove();
					//$(".sin-seriacion").show();
					//$("#formUpdate ").val("");
				});

			});
		}
		
		// this is important for IEs
		var polyfilter_scriptpath = '/js/';

	</script>
	<!--SCRIPT PARA VENTANA MODAL-->
	<script src="../js/classie.js"></script>
	<!--<script src="../js/css-filters-polyfill.js"></script>-->
	<!--SCRIPT PARA VENTANA MODAL-->
</body>
</html>