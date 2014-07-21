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
			Plan de estudios: Consulta, modificación y eliminación
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
		<div id="statusPlanEstudios"><label>Estatus del plan</label></div>
			<div id="checkSubdirector">
				<input style="width:18px; height:18px;" type="checkbox" name="checkSubdirector" value="Generar"><label style="font-size:18px;">Aceptado</label>
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
						<div id="consul_serie">
							<label>Seriación: </label>
							<select class="con_estilo" name="seriacion" id="seriacion" size="1">
								<option value="0">TODAS</option>
								@foreach ($seriaciones as $seriacion)
									<option value="{{$seriacion->reqseriacion}}">{{$seriacion->descripcion}}</option>
								@endforeach
							</select>
						</div>
						<!------------------------ COORDINACIONES ------------------------>
						<div id="consul_coor">
							<label>Coord: </label>
							<input type="text" id="coordinacion" style="width:150px" size=1 list="datalist_coord">
							<datalist id="datalist_coord">
								@foreach ($coordinaciones as $coordinacion)
									<option value="{{$coordinacion->descripcion}}" codigo="{{$coordinacion->coordinaciona}}">
								@endforeach
							</datalist>
						</div>
						<!---------------------- CHECK DE TRONCO COMUN ---------------------->
						<div id="checkTroncoComun">
							<input style="width:18px; height:18px;" type="checkbox" name="troncoComun" id="troncoComun"><label style="font-size:18px;">Tronco común</label>
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
			Materias obligatorias: Materias optativas: Total de creditos:
		</div>
		<div id="imprimir"></div>
		<div id="actualizaimprime">
			<input style="font-size:18px" class="estilo_button2" type="button" value="Actualizar">
			&nbsp;&nbsp;
			<input style="font-size:19px" class="estilo_button2" type="button" value="Imprimir">
		</div>
		<!---------------------------------------- VENTANA MODAL PARA ACTULIAZACION DE UA ----------------------------------------> 
		<div class="md-modal md-effect-11" id="modal-11">
			<form id="formUpdate" action="javascript:actualizarUA()" class="md-content">
				<h3 id="titulo_update">Modificar unidad de aprendizaje</h3>
				<div id="tablita2contenedor">
					<table cellpadding="5" id="tablita2">
					
					<tr>
						<td>Carrera:</td>
						<td>
							<select class="con_estilo" name="carrera_update" id="carrera_update" size="1">
							</select>
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
							<select class="con_estilo" name="etapaF" id="etapa_update" size=1>
								@foreach ($etapas as $etapa)
									<option value="{{$etapa->etapa}}">{{$etapa->descripcion}}</option>
								@endforeach
							</select>
						</td>
					</tr>
					<tr>
						<td>Tipo:</td>
						<td>
							<select class="con_estilo" name="tipoF" id="tipo_update" size=1>
								@foreach ($tiposCaracter as $tipo)
									<option value="{{$tipo->caracter}}">{{$tipo->descripcion}}</option>
								@endforeach
							</select>
						</td>
					</tr>
					
					<tr>
						<td>Semestre:</td>
						<td>
							<input class="estilo_numeric" type="number" name="semestre" id="semestre_update" min="1" max="9" onkeypress="ValidaSoloNumeros()" >
						</td>
					</tr>
					<tr>
						<td>TipoSer.:</td>
						<td>
							<select class="con_estilo" name="serie" id="seriacion_update" size=1>
								@foreach ($seriaciones as $seriacion)
									<option value="{{$seriacion->reqseriacion}}">{{$seriacion->descripcion}}</option>
								@endforeach
							</select>
						</td>
					</tr>
					<tr>
						<td>Clave:</td>
						<td><input type="text" style="height: 25px; text-transform:uppercase; width:120px;" name="clave2F" id="claveSeriacion_update" size="25"></td>
						<td>Materia:</td>
						<td><input type="text" style="height: 25px; text-transform:uppercase; width:180px;" name="descripcionSeriacion_update" id="descripcionSeriacion_update" size="25"></td>
					</tr>
					<tr>
						<td size="10">HC:</td>
						<td><input class="estilo_numeric" type="number" name="hc" id="hc_update" min="1" max="9" onkeypress="ValidaSoloNumeros()" ></td>
						<td size="10">HL:</td>
						<td><input class="estilo_numeric" type="number" name="hl" id="hl_update" min="1" max="9" onkeypress="ValidaSoloNumeros()" ></td>
					</tr>
					
					<tr>
						<td size="10">HT:</td>
						<td><input class="estilo_numeric" type="number" name="ht" id="ht_update" min="1" max="9" onkeypress="ValidaSoloNumeros()" ></td>
						<td size="10">HE:</td>
						<td><input class="estilo_numeric" type="number" name="he" id="he_update" min="1" max="9" onkeypress="ValidaSoloNumeros()" ></td>
					</tr>
					
					<tr>
						<td size="10">HPC:</td>
						<td><input class="estilo_numeric" type="number" name="hpc" id="hpc_update" min="1" max="9" onkeypress="ValidaSoloNumeros()" ></td>
						<td size="10">HCL:</td>
						<td><input class="estilo_numeric" type="number" name="hcl" id="hcl_update" min="1" max="9" onkeypress="ValidaSoloNumeros()" ></td>
					</tr>
					<tr>
						<td>Cred.:</td>
						<td><input class="estilo_numeric" type="number" name="creditosF" id="creditos_update" onkeypress="ValidaSoloNumeros()" >
					</tr>
					
					<tr>					
						<td>Coord.:</td>
						<td>
							<input type="text" id="coordinacion_update" name="coord" style="width:120px" size="1" list="datalist_coord">
							<datalist id="datalist_coord">
							</datalist>
						</td>
					</tr>
						</table>
				</div>
				<input type="submit" style="font-size:21px" value="Actualizar" class="estilo_button2">
				<input type="button" class="md-close" value="Salir">
			</form>
		</div>
		<!--<button class="md-trigger" data-modal="modal-11">+</button>-->
		<div class="md-overlay">
		<!---------------------------------------- VENTANA MODAL PARA ACTULIAZACION DE UA ----------------------------------------> 
	</section>
	<footer></footer>

	<script type="text/javascript">
	$(function(){
		
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
					for(var i = 0; i < programas.length; i++)
					{
						options += "<option value="+programas[i].programaedu+" >"+programas[i].descripcion+"</option>";
					}
					$("#carrera,#carrera_update").html(options);
					// Habilitar opciones de consulta
					$("#checkTroncoComun").show();
					$("#etapa").val("0").prop("disabled",false);
					$("#tipo").val("0").prop("disabled",false);
					$("#seriacion").val("0");
					etapa = "";
					reqseriacion = "";
					coordinacion = "";
					caracter = "";
				}).fail(function(){alert("Fallo en obtener los programas educativos");});
				// Obtener las claves para la seriación de las ua registradas en el plan.
				// 
				$.post("<?php echo URL::to('planestudio/obtenerclaveseries'); ?>",{noplan:plan},function(claves){
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
				}).fail(function(){alert("Fallo en obtener las unidades de aprendizaje");});
			}
		});
		// ACCIONES PARA EL COMBOBOX DE PROGRAMAS EDUCATIVOS
		$("#carrera").on("change",function(){
			carrera = $(this).val();
			if($(this).val()!=6)
			{
				$("#checkTroncoComun").show();
				$("#etapa").val("0").prop("disabled",false);
				$("#tipo").val("0").prop("disabled",false);
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
		// BUSQUEDA Y CONSULTA DE UNIDADES DE APRENDIZAJE
		$("#Buscar").on("click",function(){
			//Limpiar busquedas anteriores
			$("#list1 li:not(:first), #list2 li:not(:first), #list3 li:not(:first)").remove();
			var troncoComun = $("#troncoComun").prop("checked"); // Checar true o false del check de Tronco Común
			// Verificar datos depuración:
			alert("Etapa: "+etapa+"\nCaracter: "+caracter+"\nReqseriacion: "+reqseriacion+"\nCoordinacion: "+coordinacion+"\nTronco Comun: "+troncoComun);
			//	SI EL FILTRO CONTEMPLA TODAS LAS ETAPAS
			if(etapa=="")
			{
				$.post("<?php echo URL::to('planestudio/obteneruascarrera'); ?>",{noplan:plan,programaedu:carrera,etapa:1,caracter:caracter,reqseriacion:reqseriacion,coordinacion:coordinacion,troncocomun:troncoComun},function(uas){
					var bloque ="";
					var descripcionUA = "";
					for (var i = 0; i < uas.length; i++) 
					{
						descripcionUA = '<span>'+uas[i].uaprendizaje + '</span><br />' + uas[i].descripcionmat + '<br />' +'C' + uas[i].HC + ' ' + 'L' + uas[i].HL + ' ' + 'CR' + uas[i].creditos;
						bloque = $('<li>' +
										'<div style="font-size:9px" class="md-trigger unidad" data-modal="modal-11">' +
											descripcionUA +
										'</div>'+
									'</li>').hide().fadeIn("slow");
						$("#list1").append(bloque);
						bloque = "";
					}
					$.post("<?php echo URL::to('planestudio/obteneruascarrera'); ?>",{noplan:plan,programaedu:carrera,etapa:2,caracter:caracter,reqseriacion:reqseriacion,coordinacion:coordinacion,troncocomun:false},function(uas){
						var bloque ="";
						var descripcionUA = "";
						for (var i = 0; i < uas.length; i++) 
						{
							descripcionUA = '<span>'+uas[i].uaprendizaje + '</span><br />' + uas[i].descripcionmat + '<br />' +'C' + uas[i].HC + ' ' + 'L' + uas[i].HL + ' ' + 'CR' + uas[i].creditos;
							bloque = $('<li>' +
											'<div style="font-size:9px" class="md-trigger unidad" data-modal="modal-11">' +
												descripcionUA +
											'</div>'+
										'</li>').hide().fadeIn("slow");
							$("#list2").append(bloque);
							bloque = "";
						}
						$.post("<?php echo URL::to('planestudio/obteneruascarrera'); ?>",{noplan:plan,programaedu:carrera,etapa:3,caracter:caracter,reqseriacion:reqseriacion,coordinacion:coordinacion,troncocomun:false},function(uas){
							var bloque ="";
							var descripcionUA = "";
							for (var i = 0; i < uas.length; i++) 
							{
								descripcionUA = '<span>'+uas[i].uaprendizaje + '</span><br />' + uas[i].descripcionmat + '<br />' +'C' + uas[i].HC + ' ' + 'L' + uas[i].HL + ' ' + 'CR' + uas[i].creditos;
								bloque = $('<li>' +
												'<div style="font-size:9px" class="md-trigger unidad" data-modal="modal-11">' +
													descripcionUA +
												'</div>'+
											'</li>').hide().fadeIn("slow");
								$("#list3").append(bloque);
								bloque = "";
							}
							activarModal();
							asignarEventoDatos();
						});
					});
				});
			}
			else // Si solo es una etapa
			{
				$.post("<?php echo URL::to('planestudio/obteneruascarrera'); ?>",{noplan:plan,programaedu:carrera,etapa:etapa,caracter:caracter,reqseriacion:reqseriacion,coordinacion:coordinacion,troncocomun:troncoComun},function(uas){
					var bloque ="";
					var descripcionUA = "";
					for (var i = 0; i < uas.length; i++) 
					{
						descripcionUA = '<span>'+uas[i].uaprendizaje + '</span><br />' + uas[i].descripcionmat + '<br />' +'C' + uas[i].HC + ' ' + 'L' + uas[i].HL + ' ' + 'CR' + uas[i].creditos;
						bloque = $('<li>' +
										'<div style="font-size:9px" class="md-trigger unidad" data-modal="modal-11">' +
											descripcionUA +
										'</div>'+
									'</li>').hide().fadeIn("slow");
						$("#list"+etapa).append(bloque); "ESTO ES IMPORTANTE NO PUEDEN MODIFICAR EL VAL DE LAS ETAPAS SI NO MARCARA ERROR"
						bloque = "";
					}
					activarModal();
					asignarEventoDatos();
				});

			}
		});
	});
	</script>

	<script type="text/javascript">
		
		$("#list1, #list2, #list3").dragsort({ dragSelector: "div", dragBetween: true, dragEnd: saveOrder, placeHolderTemplate: "<li class='placeHolder'><div></div></li>" });
		
		function saveOrder() {
			//var data = $("#list1 li").map(function() { return $(this).children().html(); }).get();
			//$("input[name=list1SortOrder]").val(data.join("|"));
			//alert("Vamos a actualizar la etapa");
			var uaid=$(this).find("span").text();
			var etapa = $(this).parents("ul").attr("etapa");
			//alert("UAID: "+uaid +"Etapa: "+etapa);
			$.post("<?php echo URL::to('planestudio/actualizaretapa'); ?>",{uaprendizaje:uaid,etapa:etapa},function(ua){
				alert(ua);
			});
		}

		function actualizarUA()
		{
			dataUA = $("#formUpdate").serialize();
			$.post("<?php echo URL::to('planestudio/actualizarua'); ?>",dataUA,function(ua){
				alert("Actualizacion Completada");
			})
			.fail(function(){alert("Fallo la actualizacion");});
		}

		function asignarEventoDatos()
		{
			$("ul li div").on("click",function(){
				//alert("Aqui paso algo");
				var uaid = $(this).find("span").text();
				//alert(uaid);
				$.post("<?php echo URL::to('planestudio/obtenerdataua'); ?>",{uaprendizaje:uaid},function(ua){
					//alert("consulto");
					$("#titulo_update").html(ua.descripcionmat);
					$("#carrera_update").val($("#carrera").val());
					$("#clave_update").val(uaid);
					$("#descripcion_update").val(ua.descripcionmat);
					$("#etapa_update").val(ua.etapa);
					$("#tipo_update").val(ua.tipo);
					$("#semestre_update").val(ua.semestre);
					$("#seriacion_update").val(ua.reqseriacion);
					$("#claveSeriacion_update").val(ua.claveD);
					// FALTA DESCRIPCION DE LA SERIADA
					$("#hc_update").val(ua.hc);
					$("#hl_update").val(ua.hl);
					$("#ht_update").val(ua.ht);
					$("#he_update").val(ua.he);
					$("#hpc_update").val(ua.hpc);
					$("#hcl_update").val(ua.hcl);
					$("#creditos_update").val(ua.creditos);
					$("#coordinacion_update").val(ua.coordinaciona);


				})
				.fail(function(){alert("Fallo en la consulta de la unidad de aprendizaje")});
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
					//$("#formUpdate ").val("");
				});

			});
		}
		
		// this is important for IEs
		var polyfilter_scriptpath = '/js/';

	</script>
	<!--SCRIPT PARA VENTANA MODAL-->
	<script src="../js/classie.js"></script>
	<script src="../js/css-filters-polyfill.js"></script>
	<!--SCRIPT PARA VENTANA MODAL-->
</body>
</html>