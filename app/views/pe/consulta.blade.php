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
							<select class="con_estilo" name="etapa" size=1>
								<option value="0">TODAS</option>
								@foreach ($etapas as $etapa)
									<option value="{{$etapa->etapa}}">{{$etapa->descripcion}}</option>
								@endforeach
							</select>
						</div>
						<!------------------------ CARACTERES ------------------------>
						<div id="consul_tipo">
							<label>Tipo: </label>
							<select class="con_estilo" name="tipo" size="1">
								<option value="0">TODAS</option>
								@foreach ($tiposCaracter as $tipo)
									<option value="{{$tipo->caracter}}">{{$tipo->descripcion}}</option>
								@endforeach
							</select>
						</div>
						<!------------------------ TIPOS DE SERIACION ------------------------>
						<div id="consul_serie">
							<label>Seriación: </label>
							<select class="con_estilo" name="seriacion" size=1>
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
							<input style="width:18px; height:18px;" type="checkbox" name="troncoComun" ><label style="font-size:18px;">Tronco común</label>
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
			<ul id="list3">
				<li style="width:0%; padding:0; background-color:red;"></li>
				<!--<input type="image" class="eliminarBloquecito" src="../imagenes/deleteTachita.png" id="elimImg"> -->
			</ul>
			<!------------------------------ ETAPA DISCIPLINARIA ------------------------------>
			<ul id="list2">
				<li style="width:0%; padding:0; background-color:red;"></li>
			</ul>
			<!------------------------------ ETAPA BASICA ------------------------------>
			<ul id="list1">
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
			<div class="md-content">
				<h3>Modificar unidad de aprendizaje</h3>
				<div id="tablita2contenedor">
					<table cellpadding="5" id="tablita2">
					
					<tr>
						<td>Carrera:</td>
						<td>
							<select class="con_estilo" name="carrera" size=1>
								<option value="TC">TRONCO COMUN</option>
								<option value="ADMON">ADMON.</option>
								<option value="CONTAB">CONTAB.</option>
								<option value="INFORMATICA">INFORMATICA</option>
								<option value="NEGOCIOS">NEGOCIOS</option>
							</select>
						</td>
					</tr>
					<tr>
						<td width="95">Clave:</td>
						<td width="301"><input type="text" style="height: 25px; text-transform:uppercase; width:120px;" size="25"></td>
						<td>Materia:</td>
						<td><input type="text" style="height: 25px; text-transform:uppercase; width:180px;" size="25"></td>
					</tr>
					
					<tr>
						<td>Etapa:</td>
						<td>
							<select class="con_estilo" name="etapa" size=1>
								<option value="TODOS">TODOS</option>
								<option value="BASICA">BASICA</option>
								<option value="INTERMEDIA">DISCIPLINARIA</option>
								<option value="TERMINAL">TERMINAL</option>
							</select>

						</td>

					</tr>

					<tr>

						<td>Tipo:</td>
						<td>
							<select class="con_estilo" name="tipo" size=1>
								<option value="TODOS">TODOS</option>
								<option value="OBLIGATORIA">OBLIGATORIA</option>
								<option value="OPTATIVA">OPTATIVA</option>
							</select>
						</td>
					</tr>
					

					<tr>
						<td>Semestre:</td>
						<td>
							<input class="estilo_numeric" type="number" name="semestre" id="semestre_consulta" min="1" max="9" onkeypress="ValidaSoloNumeros()" >
						</td>
					</tr>

					<tr>
						<td>TipoSer.:</td>
						<td>
							<select class="con_estilo" name="seriacion" size=1>
								<option value="SINSERIACION">SIN SERIACION</option>
								<option value="OBLIGADA">OBLIGATORIA</option>
								<option value="SUGERIDA">SUGERIDA</option>
							</select>

						</td>
					</tr>

					<tr>
						<td>Clave:</td>
						<td><input type="text" style="height: 25px; text-transform:uppercase; width:120px;" size="25"></td>

						<td>Materia:</td>
						<td><input type="text" style="height: 25px; text-transform:uppercase; width:180px;" size="25"></td>
					</tr>

					<tr>
						<td size="10">HC:</td>
						<td><input class="estilo_numeric" type="number" name="hc_consulta" id="hc_consulta" min="1" max="9" onkeypress="ValidaSoloNumeros()" ></td>

						<td size="10">HL:</td>
						<td><input class="estilo_numeric" type="number" name="hl_consulta" id="hl_consulta" min="1" max="9" onkeypress="ValidaSoloNumeros()" ></td>
					</tr>
					
					<tr>
						<td size="10">HT:</td>
						<td><input class="estilo_numeric" type="number" name="ht_consulta" id="ht_consulta" min="1" max="9" onkeypress="ValidaSoloNumeros()" ></td>

						<td size="10">HE:</td>
						<td><input class="estilo_numeric" type="number" name="he_consulta" id="he_consulta" min="1" max="9" onkeypress="ValidaSoloNumeros()" ></td>
					</tr>

					
					<tr>
						<td size="10">HPC:</td>
						<td><input class="estilo_numeric" type="number" name="hcp_consulta" id="hcp_consulta" min="1" max="9" onkeypress="ValidaSoloNumeros()" ></td>

						<td size="10">HCL:</td>
						<td><input class="estilo_numeric" type="number" name="hcl_consulta" id="hcl_consulta" min="1" max="9" onkeypress="ValidaSoloNumeros()" ></td>
					</tr>

					<tr>
						<td>Cred.:</td>
						<td><input class="estilo_numeric" type="number" name="cred_consulta" id="cred_consulta" onkeypress="ValidaSoloNumeros()" >
					</tr>
					
					<tr>					
						<td>Coord.:</td>
						<td>
							<input type="text" id="coordinacion" style="width:120px" size=1 list="datalist_coord">
							<datalist id="datalist_coord">
								<option value="INFORMATICA">
								<option value="MATEMATICAS">
								<option value="CIENCIAS COMPUTACIONALES">
								<option value="SISTEMAS DE INFORMACION">
								<option value="PROGRAMACION">
							</datalist>
						</td>
					</tr>

						</table>
				</div>
				<input type="button" style="font-size:21px" value="Guardar carga" class="estilo_button2">
				<input type="button" class="md-close" value="Salir">
			</div>
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
		var etapa = 0;
		$("#noPlan").on("input",function(){
			if($(this).val().length>5)
			{
				//alert("se activo");
				// Obtener el código del plan de estudios
				plan = $("#datalist_noPlan option[value="+$(this).val()+"]").attr('plan');
				//alert(plan);
				//
				// Obtener las carreras que son parte del Plan de Estudios elegido
				$.post("<?php echo URL::to('planestudio/obtenerprogramas'); ?>",{noplan:plan},function(programas){
					var options = "";
					carrera = programas[0].programaedu;
					for(var i = 0; i < programas.length; i++)
					{
						options += "<option value="+programas[i].programaedu+" >"+programas[i].descripcion+"</option>";
					}
					$("#carrera").html(options);
				}).fail(function(){alert("Fallo en obtener los programas educativos");});
				// Obtener las claves para la seriación de las ua registradas en el plan.
				// 
				$.post("<?php echo URL::to('planestudio/obtenerclaveseries'); ?>",{noplan:plan},function(claves){
					var optionsClave="",optionsDescripcion="";
					for(var i=0;i<claves.length;i++)
					{
						optionsClave += "<option value="+claves[i].uaprendizaje+" />";
						optionsDescripcion += "<option value="+claves[i].descripcionmat+" />";
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
			}
			else
			{
				$("#checkTroncoComun").hide();
			}
		});

		// BUSQUEDA Y CONSULTA DE UNIDADES DE APRENDIZAJE
		$("#Buscar").on("click",function(){
			$.post("<?php echo URL::to('planestudio/obteneruascarrera'); ?>",{noplan:plan,programaedu:carrera,etapa:1},function(uas){
				var bloque ="";
				var descripcionUA = "";
				for (var i = 0; i < uas.length; i++) 
				{
					descripcionUA = uas[i].uaprendizaje + '<br />' + uas[i].descripcionmat + '<br />' +'C' + uas[i].HC + ' ' + 'L' + uas[i].HL + ' ' + 'CR' + uas[i].creditos;
					bloque = $('<li>' +
									'<div style="font-size:9px" class="md-trigger unidad" data-modal="modal-11">' +
										descripcionUA +
									'</div>'+
								'</li>').hide().fadeIn("slow");
					$("#list1").append(bloque);
					bloque = "";
				}
				$.post("<?php echo URL::to('planestudio/obteneruascarrera'); ?>",{noplan:plan,programaedu:carrera,etapa:2},function(uas){
					var bloque ="";
					var descripcionUA = "";
					for (var i = 0; i < uas.length; i++) 
					{
						descripcionUA = uas[i].uaprendizaje + '<br />' + uas[i].descripcionmat + '<br />' +'C' + uas[i].HC + ' ' + 'L' + uas[i].HL + ' ' + 'CR' + uas[i].creditos;
						bloque = $('<li>' +
										'<div style="font-size:9px" class="md-trigger unidad" data-modal="modal-11">' +
											descripcionUA +
										'</div>'+
									'</li>').hide().fadeIn("slow");
						$("#list2").append(bloque);
						bloque = "";
					}
					$.post("<?php echo URL::to('planestudio/obteneruascarrera'); ?>",{noplan:plan,programaedu:carrera,etapa:3},function(uas){
						var bloque ="";
						var descripcionUA = "";
						for (var i = 0; i < uas.length; i++) 
						{
							descripcionUA = uas[i].uaprendizaje + '<br />' + uas[i].descripcionmat + '<br />' +'C' + uas[i].HC + ' ' + 'L' + uas[i].HL + ' ' + 'CR' + uas[i].creditos;
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
		});
	});
	</script>

	<script type="text/javascript">
	
		
		$("#list1, #list2, #list3").dragsort({ dragSelector: "div", dragBetween: true, dragEnd: saveOrder, placeHolderTemplate: "<li class='placeHolder'><div></div></li>" });
		
		function saveOrder() {
			var data = $("#list1 li").map(function() { return $(this).children().html(); }).get();
			$("input[name=list1SortOrder]").val(data.join("|"));
		};

		// this is important for IEs
		var polyfilter_scriptpath = '/js/';
		function asignarEventoDatos()
		{
			$("ul li div").on("click",function(){
				$.post("<?php echo URL::to('planestudio/obteneruascarrera'); ?>",{uaprendizaje:uaid},function(){
					
				});
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
				});

			});
		}
		

	</script>
	<!--SCRIPT PARA VENTANA MODAL-->
	<script src="../js/classie.js"></script>
	<script src="../js/css-filters-polyfill.js"></script>
	<!--SCRIPT PARA VENTANA MODAL-->
</body>
</html>