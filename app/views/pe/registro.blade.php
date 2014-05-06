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
		<link rel="stylesheet" type="text/css" href="../css/demo_table.css">
        <!--Aqui termina estilo del dataTable-->
        
		<!-- ------------------------------ Scripts Generales -------------------------------->
		<script type="text/javascript" src="../js/jquery.js"></script>

		<!--AQUI VA HORA Y FECHA-->
		<script src="../js/tiempoactual.js"></script>
		<script>$(function(){startWatch(); return false;});</script>
		<!-- Script tiempo -->
		
		<!-- Creación de Ventanas Modales -->
		<script src="../js/ventanamodal.js"></script>

       <!-- Script dataTable -->
		<script type="text/javascript" src="../js/jquery.dataTables.js"></script>
		<script type="text/javascript" charset="utf-8">
			$(document).ready(function() {
				$('#tblUA').dataTable();
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
						<label style="color:#ECA22E">{{Auth::user()->ua}}</label>
							
						<!-- TABLA MODAL UNIDAD-->
						<!--<input class="md-trigger" data-modal="unidad" type="button" value="+">-->
						<!--             -->
					</div>
					<!-- ----------------------------------------------------------------------------------- -->

					<div id="campusDiv">
						<label>Campus: </label>
						<label style="color:#ECA22E">{{Auth::user()->campus}}</label>
						<!-- TABLA MODAL CAMPUS-->
						<!--<input class="md-trigger" data-modal="campus" type="button" value="+">-->
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
								<select style="font-weight:normal; width: 143px" class="con_estilo" id="control_3" name="carreras" multiple="carrera" size="5">
									<option value="TRONCOCOMUN">TRONCO COMUN</option>
									<option value="ADMON">ADMINISTRACION</option>
									<option value="CONTAB">CONTABILIDAD</option>
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
								<select style="width: 143px"class="con_estilo" name="serie" id="serie" size=1 type="text">
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
	<table cellpadding="0" cellspacing="0" border="0" class="display" id="tblUA">
		<thead>
			<tr>
				<th>CLAVE</th>
				<th>MATERIA</th>
				<th>CARRERA</th>
				<th>ETAPA</th>
				<th>CLAVE_SERIACION</th>
				<th>TIPO</th>
				<th>COORDINACIÓN</th>
				<th>HC</th>
				<th>HL</th>
				<th>HT</th>
				<th>CRÉDITOS</th>
				<th>ELIMINAR</th>
			</tr>
		</thead>
		<tbody>
			<tr class="gradeX">
				<td>000453</td>
				<td>Programación Orientada a Objetos</td>
				<td>Informática</td>
				<td class="center">Básica</td>
				<td class="center" title="Este materia esta seriada con esta otra">2130</td>
				<td class="center">Optativa</td>
				<td class="center">Ramon Bracho</td>
				<td class="center">20</td>
				<td class="center">50</td>
				<td class="center">15</td>
				<td class="center">50</td>
				<td><input type="button" value="-" class="clsEliminarFila"></td>
			</tr>
			<tr class="gradeC">
				<td>000453</td>
				<td>Programación Orientada a Objetos</td>
				<td>Informática</td>
				<td class="center">Básica</td>
				<td class="center" title="Esta materia esta seriada con esta otra">1249</td>
				<td class="center">Optativa</td>
				<td class="center">Ramon Bracho</td>
				<td class="center">20</td>
				<td class="center">50</td>
				<td class="center">15</td>
				<td class="center">50</td>
				<td><input type="button" value="-" class="clsEliminarFila"></td>
			</tr>
			<tr class="gradeA">
				<td>000453</td>
				<td>Programación Orientada a Objetos</td>
				<td>Informática</td>
				<td class="center">Básica</td>
				<td class="center" title="Esta materia esta seriada con esta otra">9309</td>
				<td class="center">Optativa</td>
				<td class="center">Ramon Bracho</td>
				<td class="center">20</td>
				<td class="center">50</td>
				<td class="center">15</td>
				<td class="center">50</td>
				<td><input type="button" value="-" class="clsEliminarFila"></td>
			</tr>
			<tr class="gradeA">
				<td>000453</td>
				<td>Programación Orientada a Objetos</td>
				<td>Informática</td>
				<td class="center">Básica</td>
				<td class="center" title="Esta materia esta seriada con esta otra">3900</td>
				<td class="center">Optativa</td>
				<td class="center">Ramon Bracho</td>
				<td class="center">20</td>
				<td class="center">50</td>
				<td class="center">15</td>
				<td class="center">50</td>
				<td><input type="button" value="-" class="clsEliminarFila"></td>
			</tr>
			<tr class="gradeA">
				<td>000453</td>
				<td>Programación Orientada a Objetos</td>
				<td>Informática</td>
				<td class="center">Básica</td>
				<td class="center" title="Esta materia esta seriada con esta otra">3907</td>
				<td class="center">Optativa</td>
				<td class="center">Ramon Bracho</td>
				<td class="center">20</td>
				<td class="center">50</td>
				<td class="center">15</td>
				<td class="center">50</td>
				<td><input type="button" value="-" class="clsEliminarFila"></td>
			</tr>
			<tr class="gradeA">
				<td>000453</td>
				<td>Programación Orientada a Objetos</td>
				<td>Informática</td>
				<td class="center">Básica</td>
				<td class="center" title="Esta materia esta seriada con esta otra">3909</td>
				<td class="center">Optativa</td>
				<td class="center">Ramon Bracho</td>
				<td class="center">20</td>
				<td class="center">50</td>
				<td class="center">15</td>
				<td class="center">50</td>
				<td><input type="button" value="-" class="clsEliminarFila"></td>
			</tr>
			<tr class="gradeA">
				<td>000453</td>
				<td>Programación Orientada a Objetos</td>
				<td>Informática</td>
				<td class="center">Básica</td>
				<td class="center" title="Esta materia esta seriada con esta otra">3009</td>
				<td class="center">Optativa</td>
				<td class="center">Ramon Bracho</td>
				<td class="center">20</td>
				<td class="center">50</td>
				<td class="center">15</td>
				<td class="center">50</td>
				<td><input type="button" value="-" class="clsEliminarFila"></td>
			</tr>
			<tr class="gradeA">
				<td>000453</td>
				<td>Programación Orientada a Objetos</td>
				<td>Informática</td>
				<td class="center">Básica</td>
				<td class="center" title="Esta materia esta seriada con esta otra">9023</td>
				<td class="center">Optativa</td>
				<td class="center">Ramon Bracho</td>
				<td class="center">20</td>
				<td class="center">50</td>
				<td class="center">15</td>
				<td class="center">50</td>
				<td><input type="button" value="-" class="clsEliminarFila"></td>
			</tr>
			
			
			<tr class="gradeX">
				<td>000453</td>
				<td>Programación Orientada a Objetos</td>
				<td>Informática</td>
				<td class="center">Básica</td>
				<td class="center" title="Esta materia esta seriada con esta otra">2934</td>
				<td class="center">Optativa</td>
				<td class="center">Ramon Bracho</td>
				<td class="center">20</td>
				<td class="center">50</td>
				<td class="center">15</td>
				<td class="center">50</td>
				<td><input type="button" value="-" class="clsEliminarFila"></td>
			</tr>
			<tr class="gradeC">
				<td>000453</td>
				<td>Programación Orientada a Objetos</td>
				<td>Informática</td>
				<td class="center">Básica</td>
				<td class="center" title="Esta materia esta seriada con esta otra">1209</td>
				<td class="center">Optativa</td>
				<td class="center">Ramon Bracho</td>
				<td class="center">20</td>
				<td class="center">50</td>
				<td class="center">15</td>
				<td class="center">50</td>
				<td><input type="button" value="-" class="clsEliminarFila"></td>
			</tr>
			<tr class="gradeC">
				<td>000453</td>
				<td>Programación Orientada a Objetos</td>
				<td>Informática</td>
				<td class="center">Básica</td>
				<td class="center" title="Esta materia esta seriada con esta otra">2939</td>
				<td class="center">Optativa</td>
				<td class="center">Ramon Bracho</td>
				<td class="center">20</td>
				<td class="center">50</td>
				<td class="center">15</td>
				<td class="center">50</td>
				<td><input type="button" value="-" class="clsEliminarFila"></td>
			</tr>
			<tr class="gradeU">
				<td>000453</td>
				<td>Programación Orientada a Objetos</td>
				<td>Informática</td>
				<td class="center">Básica</td>
				<td class="center" title="Esta materia esta seriada con esta otra">8390</td>
				<td class="center">Optativa</td>
				<td class="center">Ramon Bracho</td>
				<td class="center">20</td>
				<td class="center">50</td>
				<td class="center">15</td>
				<td class="center">50</td>
				<td><input type="button" value="-" class="clsEliminarFila"></td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<th>CLAVE</th>
				<th>MATERIA</th>
				<th>CARRERA</th>
				<th>ETAPA</th>
				<th>SERIACIÓN</th>
				<th>TIPO</th>
				<th>COORDINACIÓN</th>
				<th>HC</th>
				<th>HL</th>
				<th>HT</th>
				<th>ELIMINAR</th>
				<th>CRÉDITOS</th>
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
<script type="text/javascript" src="../js/jquery.multiSelect.js"></script>
<script type="text/javascript" src="../js/insertarua.js"></script>
<script>
			$(document).ready( function() {
				// Default options
				$("#control_3").multiSelect();	
			});
		</script>

<!----------------------------------------------------------->

</html>