<!doctype html>
<html lang="es">
	
	<head>
		<meta charset="utf-8"/>
		<!-- -------------------------------- Estilos CSS -------------------------------- -->
		<link rel="stylesheet" type="text/css" href="../css/normalize.css">
		<link rel="stylesheet" type="text/css" href="../css/estiloPrincipal.css">
		<link rel="stylesheet" type="text/css" href="../css/estilosnav.css">
		<link rel="stylesheet" type="text/css" href="../css/jquery.multiSelect.css"/>
		<link rel="stylesheet" type="text/css" href="../css/component.css"/>
        
        <!-- Estilos del dataTable-->
        <link rel="stylesheet" type="text/css" href="../css/demo_page.css">
		<link rel="stylesheet" type="text/css" href="../css/demo_table.css">
        <!--Aqui termina estilo del dataTable-->
        
		<!-- ------------------------------ Scripts Generales -------------------------------->
		<script type="text/javascript" src="../js/jquery.js"></script>

		<!--AQUI VA HORA Y FECHA-->
		<script src="../js/tiempoactual.js"></script>
		<script src="../js/ventanamodal.js"></script>
		<script>$(function(){startWatch(); return false;});</script> <!-- Script tiempo -->
        
       <!-- Script dataTable -->
		<script type="text/javascript" language="javascript" src="../js/jquery.dataTables.js"></script>
		<script type="text/javascript" charset="utf-8">
			$(document).ready(function() {
				$('#example').dataTable( {
					"aoColumnDefs": [ 
						{ "bSearchable": false, "bVisible": false, "aTargets": [  ] },
						{ "bVisible": false, "aTargets": [  ] }
					] } );
			} );
		</script><!-- Termina script dataTable -->
	</head>

	<body>
		<script> $('body').html(crearCatalogos());</script>
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
					Usuario: Iván Avila
				</div>
				<div id="fecha" class="texto_body">
					<label id="reloj"></label>
				</div>
			</div>
			<div id="ubicacion" class="texto_body">
				Plan de estudios: Registro
			</div>
			<div id="loginmanual">
				<div id="login" class="texto_body">
					<img src="../imagenes/login.png" alt="">&nbsp;login y usuarios
				</div>
				<div id="manual" class="texto_body">
					<img src="../imagenes/manual.png" alt="">&nbsp;manual y ayuda
				</div>
			</div>
		</div>

		<section>
			<div id="formularioPlanEstudio">
			
				<div id="primerBloque">
					<!-- ----------------------------------- NO PLAN DIV ----------------------------------- -->
					<div id="noPlanDiv">
						<label>No.Plan:</label>
						<select class="con_estilo" type="text" name="noPlan" id="noPlan"> 
							<option value="2013-2">2013-2</option>
							<option value="2013-4">2013-4</option>
							<option value="2014-1">2014-1</option>
						</select>
						<!-- TABLA MODAL NRO. PLAN-->
						<input class="md-trigger" data-modal="plan" type="button" value="+"></a>
						<!--             -->

					</div>
					
					<!-- ----------------------------------------------------------------------------------- -->


					<!-- ----------------------------------- UNIDAD  DIV ----------------------------------- -->
					<div id="unidadAcademicaDiv">
						<label>U.Acad:</label>
						<select class="con_estilo" name="ua" id="ua" type="text" size=1>
							<option value="FCA">FCA</option>
							<option value="FCQ">FCQ</option>
							<option value="FMO">FMO</option>
						</select>
						<!-- TABLA MODAL UNIDAD-->
						<input class="md-trigger" data-modal="unidad" type="button" value="+">
						<!--             -->
					</div>
					<!-- ----------------------------------------------------------------------------------- -->

					<div id="campusDiv">
						<label>Campus: </label>
						<select class="con_estilo" name="campus" id="campus" size=1 type="text">
							<option value="TIJUANA">TIJUANA</option>
							<option value="TECATE">TECATE</option>
							<option value="MEXICALI">MEXICALI</option>
						</select>
						<!-- TABLA MODAL CAMPUS-->
						<input class="md-trigger" data-modal="campus" type="button" value="+">
						<!--             -->
					</div>
		
					<div id="nivelDiv">
						<label>Nivel: </label>
						<select class="con_estilo" name="nivel" id="nivel" size=1 type="text">
							<option value="LIC">LIC.</option>
							<option value="POSTGRADO">POSTGRADO</option>
							<option value="TECNICO">TECNICO</option>
						</select>
						<!-- TABLA MODAL NIVEL-->
						<input class="md-trigger" data-modal="nivel" type="button" value="+">
						<!--             -->
					</div>
					
					<!-- ----------------------------------------------------------------------------------- -->
				</div>
				
				<fieldset id="unidadaprendizaje">
					
					<div id="segundoBloque">
						
						<div id="claveDiv">
							 &nbsp;<label>Clave: </label>
							<input class="estilo_text" type="text" name="clave1F" id="clave1F" list="datalist_clave" size=1 onkeypress="ValidaSoloNumeros()">
							<datalist id="datalist_clave">
								<option value="10450">
								<option value="13230">
								<option value="10384">
							</datalist>
							<br>
							<input type="checkbox" name="generarClave" value="Generar">Generar clave
						</div>
						
						<div id="materiaDiv">
							<label>Materia: </label>
							<input style="width: 375px; height: 25px; border-radius: 5px; border-color: #DBDBEA; text-transform:uppercase" type="text" name="materia" id="materia" list="datalist_materia" size=1>
							<datalist id="datalist_materia">
								<option value="PROGRAMACION ORIENTADA A OBJETOS">
								<option value="PROGRAMACION AVANZADA">
								<option value="INFORMATICA">
							</datalist>
						</div>

						<div id="carreraDiv">
							<label>Carrera:</label>
								<select style="font-weight:normal; width: 143px" class="con_estilo" id="control_3" name="carrera" multiple="carrera" size="5">
									<option value="TRONCOCOMUN">TRONCO COMUN</option>
									<option value="ADMON">ADMON.</option>
									<option value="CONTAB">CONTAB.</option>
									<option value="INFORMATICA">INFORMATICA</option>
									<option value="NEGOCIOS">NEGOCIOS</option>
								</select>
								<!-- TABLA MODAL CARRERA-->
						<input class="md-trigger" data-modal="carrera" type="button" value="+">
						<!--             -->
						</div>

						<div id="etapaDiv">
							<label>Etapa: </label>
							<select class="con_estilo" name="etapaF" id="etapaF" size=1 type="text">
								<option value="BASICA">BASICA</option>
								<option value="INTERMEDIA">DISCIPLINARIA</option>
								<option value="TERMINAL">TERMINAL</option>
							</select>
							<!-- TABLA MODAL ETAPA-->
						<input class="md-trigger" data-modal="etapa" type="button" value="+">
						<!--             -->
						</div>
					</div>

					<div id="tercerBloque">
						<div id="semestreDiv">
							<label>Sem:</label>
							<input class="estilo_numeric" type="number" name="semestr" id="semestre" min="1" max="9" onkeypress="ValidaSoloNumeros()">
						</div>
						
						<fieldset id="group_seriacion">
							<legend>Seriación</legend>
							
							<div id="claveSerDiv">
								<label>Clave: </label>
								<input class="estilo_text" type="text" name="clave2F" id="clave2F" list="datalist_clave2F" size=1 onkeypress="ValidaSoloNumeros()">
								<datalist id="datalist_clave2F">
								<option value="123344">
								<option value="235562">
								<option value="235009">
								</datalist>
							</div>

							<div id="seriacionDivMateria">
								<select class="con_estilo" style="width: 285px" type="text" name="materiaSeriada" id="materiaSeriada" size=1>
									<option value="PROGRAMACION ORIENTADA A OBJETOS">PROGRAMACION ORIENTADA A OBJETOS</OPTION>
									<option value="PROGRAMACION AVANZADA">PROGRAMACION AVANZADA</OPTION>
									<option value="INFORMATICA">INFORMATICA</OPTION>
								</select>
							</div>

							<div id="seriacionDivTipo">
								<label>Seriación: </label>
								<select style="width: 143px"class="con_estilo" name="seriacion" id="seriacion" size=1 type="text">
									<option value="SINSERIACION">SIN SERIACION</option>
									<option value="OBLIGADA">OBLIGATORIA</option>
									<option value="SUGERIDA">SUGERIDA</option>
								</select>
								<!-- TABLA MODAL NIVEL-->
								<input class="md-trigger" data-modal="seriacion" type="button" value="+">
								<!--             -->
							</div>
						</fieldset>

						<div id="tipoDiv">
							<label>Tipo: </label>
							<select  class="con_estilo" name="tipoF" id="tipoF" size=1 type="text">
								<option value="OBLIGATORIA">OBLIGATORIA</option>
								<option value="OPTATIVA">OPTATIVA</option>
							</select>
							<!-- TABLA MODAL NIVEL-->
							<input class="md-trigger" data-modal="tipo" type="button" value="+">
							<!--             -->
						</div>
					</div>
		
					<div id="cuartoBloque">
						<div id="hcDiv">
							<label>HC: </label>
							<input class="estilo_numeric" type="number" name="hc" id="hc" min="1" max="20" onkeypress="ValidaSoloNumeros()">
						</div>
						<div id="hlDiv">
							<label>HL: </label>
							<input class="estilo_numeric" type="number" name="hl" id="hl" min="1" max="20" onkeypress="ValidaSoloNumeros()">
						</div>
						<div id="htDiv">
							<label>HT: </label>
							<input class="estilo_numeric" type="number" name="ht" id="ht" min="1" max="20" onkeypress="ValidaSoloNumeros()">
						</div>
						<br>
						<br>
						<div id="heDiv">
							<label>HE: </label>
							<input class="estilo_numeric" type="number" name="he" id="he" min="1" max="20" onkeypress="ValidaSoloNumeros()">
						</div>
						<div id="hpcDiv">
							<label>HPC: </label>
							<input class="estilo_numeric" type="number" name="hpc" id="hpc" min="1" max="20" onkeypress="ValidaSoloNumeros()">
						</div>
						<div id="hclDiv">
							<label>HCL: </label>
							<input class="estilo_numeric" type="number" name="hcl" id="hcl" min="1" max="20" onkeypress="ValidaSoloNumeros()">
						</div>
						<br>
						<br>
						
						<div id="creditosDiv">
							<label>Créditos: </label><input class="estilo_numeric" type="number" name="creditosF" id="creditosF" min="1" onkeypress="ValidaSoloNumeros()">
						</div>
						
						<div id="observacionesDiv">
							<label>Observaciones:</label><br>
							<textarea rows=3 cols="60" style=" border-radius:5px; border-color:#DBDBEA; text-transform:uppercase; resize:none" id="observaciones" placeholder="Observaciones"></textarea>
						</div>

						<div id="coordDiv">
							<label>Coord: </label><input style="width:120px; text-transform:uppercase" class="coordina" type="text" name="coord" id="coord" size="1"  list="datalist_coord">
							<datalist id="datalist_coord">
								<option value="INFORMATICA">
								<option value="MATEMATICAS">
								<option value="CIENCIAS COMPUTACIONALES">
								<option value="SISTEMAS DE INFORMACION">
								<option value="PROGRAMACION">
							</datalist>
							<!-- TABLA MODAL COORDINACIÓN-->
							<input class="md-trigger" data-modal="coordinación" type="button" value="+">
							<!--             -->
						</div>


						<div id="botones">
							<input style="width:120px"class="estilo_button2" type="button" value="Guardar" name="guarda" id="guardar">
						</div>
					</div>
				</fieldset>
			</div>

			<div id="GridPlanEstudio">
				<div id="planTerminado"><input style="width:20px; height:20px;" type="checkbox" name="planTerminado" value="Generar"><label style="font-size:18px;">Plan de estudios terminado</label></div>
				<br>

<div id="demo">
	<table cellpadding="0" cellspacing="0" border="0" class="display" id="example">
		<thead>
			<tr>
				<th>Rendering engine</th>
				<th>Browser</th>
				<th>Platform(s)</th>
				<th>Engine version</th>
				<th>CSS grade</th>
			</tr>
		</thead>
		<tbody>
			<tr class="gradeX">
				<td>Trident</td>
				<td>Internet Explorer 4.0</td>
				<td>Win 95+</td>
				<td class="center">4</td>
				<td class="center">X</td>
			</tr>
			<tr class="gradeC">
				<td>Trident</td>
				<td>Internet Explorer 5.0</td>
				<td>Win 95+</td>
				<td class="center">5</td>
				<td class="center">C</td>
			</tr>
			<tr class="gradeA">
				<td>Trident</td>
				<td>Internet Explorer 5.5</td>
				<td>Win 95+</td>
				<td class="center">5.5</td>
				<td class="center">A</td>
			</tr>
			<tr class="gradeA">
				<td>Trident</td>
				<td>Internet Explorer 6</td>
				<td>Win 98+</td>
				<td class="center">6</td>
				<td class="center">A</td>
			</tr>
			<tr class="gradeA">
				<td>Trident</td>
				<td>Internet Explorer 7</td>
				<td>Win XP SP2+</td>
				<td class="center">7</td>
				<td class="center">A</td>
			</tr>
			<tr class="gradeA">
				<td>Trident</td>
				<td>AOL browser (AOL desktop)</td>
				<td>Win XP</td>
				<td class="center">6</td>
				<td class="center">A</td>
			</tr>
			<tr class="gradeA">
				<td>Gecko</td>
				<td>Firefox 1.0</td>
				<td>Win 98+ / OSX.2+</td>
				<td class="center">1.7</td>
				<td class="center">A</td>
			</tr>
			<tr class="gradeA">
				<td>Gecko</td>
				<td>Firefox 1.5</td>
				<td>Win 98+ / OSX.2+</td>
				<td class="center">1.8</td>
				<td class="center">A</td>
			</tr>
			<tr class="gradeA">
				<td>Gecko</td>
				<td>Firefox 2.0</td>
				<td>Win 98+ / OSX.2+</td>
				<td class="center">1.8</td>
				<td class="center">A</td>
			</tr>
			<tr class="gradeA">
				<td>Gecko</td>
				<td>Firefox 3.0</td>
				<td>Win 2k+ / OSX.3+</td>
				<td class="center">1.9</td>
				<td class="center">A</td>
			</tr>
			<tr class="gradeA">
				<td>Gecko</td>
				<td>Camino 1.0</td>
				<td>OSX.2+</td>
				<td class="center">1.8</td>
				<td class="center">A</td>
			</tr>
			<tr class="gradeA">
				<td>Gecko</td>
				<td>Camino 1.5</td>
				<td>OSX.3+</td>
				<td class="center">1.8</td>
				<td class="center">A</td>
			</tr>
			<tr class="gradeA">
				<td>Gecko</td>
				<td>Netscape 7.2</td>
				<td>Win 95+ / Mac OS 8.6-9.2</td>
				<td class="center">1.7</td>
				<td class="center">A</td>
			</tr>
			<tr class="gradeA">
				<td>Gecko</td>
				<td>Netscape Browser 8</td>
				<td>Win 98SE+</td>
				<td class="center">1.7</td>
				<td class="center">A</td>
			</tr>
			<tr class="gradeA">
				<td>Gecko</td>
				<td>Netscape Navigator 9</td>
				<td>Win 98+ / OSX.2+</td>
				<td class="center">1.8</td>
				<td class="center">A</td>
			</tr>
			<tr class="gradeA">
				<td>Gecko</td>
				<td>Mozilla 1.0</td>
				<td>Win 95+ / OSX.1+</td>
				<td class="center">1</td>
				<td class="center">A</td>
			</tr>
			<tr class="gradeA">
				<td>Gecko</td>
				<td>Mozilla 1.1</td>
				<td>Win 95+ / OSX.1+</td>
				<td class="center">1.1</td>
				<td class="center">A</td>
			</tr>
			<tr class="gradeA">
				<td>Gecko</td>
				<td>Mozilla 1.2</td>
				<td>Win 95+ / OSX.1+</td>
				<td class="center">1.2</td>
				<td class="center">A</td>
			</tr>
			<tr class="gradeA">
				<td>Gecko</td>
				<td>Mozilla 1.3</td>
				<td>Win 95+ / OSX.1+</td>
				<td class="center">1.3</td>
				<td class="center">A</td>
			</tr>
			<tr class="gradeA">
				<td>Gecko</td>
				<td>Mozilla 1.4</td>
				<td>Win 95+ / OSX.1+</td>
				<td class="center">1.4</td>
				<td class="center">A</td>
			</tr>
			<tr class="gradeA">
				<td>Gecko</td>
				<td>Mozilla 1.5</td>
				<td>Win 95+ / OSX.1+</td>
				<td class="center">1.5</td>
				<td class="center">A</td>
			</tr>
			<tr class="gradeA">
				<td>Gecko</td>
				<td>Mozilla 1.6</td>
				<td>Win 95+ / OSX.1+</td>
				<td class="center">1.6</td>
				<td class="center">A</td>
			</tr>
			<tr class="gradeA">
				<td>Gecko</td>
				<td>Mozilla 1.7</td>
				<td>Win 98+ / OSX.1+</td>
				<td class="center">1.7</td>
				<td class="center">A</td>
			</tr>
			<tr class="gradeA">
				<td>Gecko</td>
				<td>Mozilla 1.8</td>
				<td>Win 98+ / OSX.1+</td>
				<td class="center">1.8</td>
				<td class="center">A</td>
			</tr>
			<tr class="gradeA">
				<td>Gecko</td>
				<td>Seamonkey 1.1</td>
				<td>Win 98+ / OSX.2+</td>
				<td class="center">1.8</td>
				<td class="center">A</td>
			</tr>
			<tr class="gradeA">
				<td>Gecko</td>
				<td>Epiphany 2.20</td>
				<td>Gnome</td>
				<td class="center">1.8</td>
				<td class="center">A</td>
			</tr>
			<tr class="gradeA">
				<td>Webkit</td>
				<td>Safari 1.2</td>
				<td>OSX.3</td>
				<td class="center">125.5</td>
				<td class="center">A</td>
			</tr>
			<tr class="gradeA">
				<td>Webkit</td>
				<td>Safari 1.3</td>
				<td>OSX.3</td>
				<td class="center">312.8</td>
				<td class="center">A</td>
			</tr>
			<tr class="gradeA">
				<td>Webkit</td>
				<td>Safari 2.0</td>
				<td>OSX.4+</td>
				<td class="center">419.3</td>
				<td class="center">A</td>
			</tr>
			<tr class="gradeA">
				<td>Webkit</td>
				<td>Safari 3.0</td>
				<td>OSX.4+</td>
				<td class="center">522.1</td>
				<td class="center">A</td>
			</tr>
			<tr class="gradeA">
				<td>Webkit</td>
				<td>OmniWeb 5.5</td>
				<td>OSX.4+</td>
				<td class="center">420</td>
				<td class="center">A</td>
			</tr>
			<tr class="gradeA">
				<td>Webkit</td>
				<td>iPod Touch / iPhone</td>
				<td>iPod</td>
				<td class="center">420.1</td>
				<td class="center">A</td>
			</tr>
			<tr class="gradeA">
				<td>Webkit</td>
				<td>S60</td>
				<td>S60</td>
				<td class="center">413</td>
				<td class="center">A</td>
			</tr>
			<tr class="gradeA">
				<td>Presto</td>
				<td>Opera 7.0</td>
				<td>Win 95+ / OSX.1+</td>
				<td class="center">-</td>
				<td class="center">A</td>
			</tr>
			<tr class="gradeA">
				<td>Presto</td>
				<td>Opera 7.5</td>
				<td>Win 95+ / OSX.2+</td>
				<td class="center">-</td>
				<td class="center">A</td>
			</tr>
			<tr class="gradeA">
				<td>Presto</td>
				<td>Opera 8.0</td>
				<td>Win 95+ / OSX.2+</td>
				<td class="center">-</td>
				<td class="center">A</td>
			</tr>
			<tr class="gradeA">
				<td>Presto</td>
				<td>Opera 8.5</td>
				<td>Win 95+ / OSX.2+</td>
				<td class="center">-</td>
				<td class="center">A</td>
			</tr>
			<tr class="gradeA">
				<td>Presto</td>
				<td>Opera 9.0</td>
				<td>Win 95+ / OSX.3+</td>
				<td class="center">-</td>
				<td class="center">A</td>
			</tr>
			<tr class="gradeA">
				<td>Presto</td>
				<td>Opera 9.2</td>
				<td>Win 88+ / OSX.3+</td>
				<td class="center">-</td>
				<td class="center">A</td>
			</tr>
			<tr class="gradeA">
				<td>Presto</td>
				<td>Opera 9.5</td>
				<td>Win 88+ / OSX.3+</td>
				<td class="center">-</td>
				<td class="center">A</td>
			</tr>
			<tr class="gradeA">
				<td>Presto</td>
				<td>Opera for Wii</td>
				<td>Wii</td>
				<td class="center">-</td>
				<td class="center">A</td>
			</tr>
			<tr class="gradeA">
				<td>Presto</td>
				<td>Nokia N800</td>
				<td>N800</td>
				<td class="center">-</td>
				<td class="center">A</td>
			</tr>
			<tr class="gradeA">
				<td>Presto</td>
				<td>Nintendo DS browser</td>
				<td>Nintendo DS</td>
				<td class="center">8.5</td>
				<td class="center">C/A<sup>1</sup></td>
			</tr>
			<tr class="gradeC">
				<td>KHTML</td>
				<td>Konqureror 3.1</td>
				<td>KDE 3.1</td>
				<td class="center">3.1</td>
				<td class="center">C</td>
			</tr>
			<tr class="gradeA">
				<td>KHTML</td>
				<td>Konqureror 3.3</td>
				<td>KDE 3.3</td>
				<td class="center">3.3</td>
				<td class="center">A</td>
			</tr>
			<tr class="gradeA">
				<td>KHTML</td>
				<td>Konqureror 3.5</td>
				<td>KDE 3.5</td>
				<td class="center">3.5</td>
				<td class="center">A</td>
			</tr>
			<tr class="gradeX">
				<td>Tasman</td>
				<td>Internet Explorer 4.5</td>
				<td>Mac OS 8-9</td>
				<td class="center">-</td>
				<td class="center">X</td>
			</tr>
			<tr class="gradeC">
				<td>Tasman</td>
				<td>Internet Explorer 5.1</td>
				<td>Mac OS 7.6-9</td>
				<td class="center">1</td>

				<td class="center">C</td>
			</tr>
			<tr class="gradeC">
				<td>Tasman</td>
				<td>Internet Explorer 5.2</td>
				<td>Mac OS 8-X</td>
				<td class="center">1</td>
				<td class="center">C</td>
			</tr>
			<tr class="gradeA">
				<td>Misc</td>
				<td>NetFront 3.1</td>
				<td>Embedded devices</td>
				<td class="center">-</td>
				<td class="center">C</td>
			</tr>
			<tr class="gradeA">
				<td>Misc</td>
				<td>NetFront 3.4</td>
				<td>Embedded devices</td>
				<td class="center">-</td>
				<td class="center">A</td>
			</tr>
			<tr class="gradeX">
				<td>Misc</td>
				<td>Dillo 0.8</td>
				<td>Embedded devices</td>
				<td class="center">-</td>
				<td class="center">X</td>
			</tr>
			<tr class="gradeX">
				<td>Misc</td>
				<td>Links</td>
				<td>Text only</td>
				<td class="center">-</td>
				<td class="center">X</td>
			</tr>
			<tr class="gradeX">
				<td>Misc</td>
				<td>Lynx</td>
				<td>Text only</td>
				<td class="center">-</td>
				<td class="center">X</td>
			</tr>
			<tr class="gradeC">
				<td>Misc</td>
				<td>IE Mobile</td>
				<td>Windows Mobile 6</td>
				<td class="center">-</td>
				<td class="center">C</td>
			</tr>
			<tr class="gradeC">
				<td>Misc</td>
				<td>PSP browser</td>
				<td>PSP</td>
				<td class="center">-</td>
				<td class="center">C</td>
			</tr>
			<tr class="gradeU">
				<td>Other browsers</td>
				<td>All others</td>
				<td>-</td>
				<td class="center">-</td>
				<td class="center">U</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<th>Rendering engine</th>
				<th>Browser</th>
				<th>Platform(s)</th>
				<th>Engine version</th>
				<th>CSS grade</th>
			</tr>
		</tfoot>
	</table>
</div>
</div>
		</section>
		<footer></footer>
		<!-- classie.js by @desandro: https://github.com/desandro/classie -->
		<script src="../js/classie.js"></script>
		<script src="../js/modalEffects.js"></script>

	</body>
<!----------------------------------------------------------->
<!--SCRIPT PARA VENTANA MODAL-->
<script type="text/javascript" src="../js/manipulacionUA.js"></script>
<script type="text/javascript" src="../js/jquery.multiSelect.js"></script>
<script>
			$(document).ready( function() {
				// Default options
				$("#control_3").multiSelect();	
			});
		</script>
<!----------------------------------------------------------->

</html>