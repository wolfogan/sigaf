<!doctype html>
<html lang="es">
	
	<head>
		<meta charset="utf-8"/>
		<!-- -------------------------------- Estilos CSS -------------------------------- -->
		<link rel="stylesheet" type="text/css" href="../css/normalize.css">
		<link rel="stylesheet" type="text/css" href="../css/estiloPrincipal.css">
		<link rel="stylesheet" type="text/css" href="../css/estilosnav.css">
		<link rel="stylesheet" type="text/css" href="../css/component.css"/>
        
        <!-- ------------------------------ DATATABLES --------------------------------------->
		
		<!-- CSS -->
		<link rel="stylesheet" type="text/css" href="../css/jquery.dataTables.css">
		<!-- JS -->
		<script src="../js/jquery.dataTables.js"></script>

		<!-- ---------------------------------------------------------------------------------->

               
		<!-- ------------------------------ Scripts Generales -------------------------------->
		<script type="text/javascript" src="../js/jquery.js"></script>

		<!--AQUI VA HORA Y FECHA-->
		<script src="../js/tiempoactual.js"></script>
		<script>$(function(){startWatch(); return false;});</script>
		<!-- Script tiempo -->

       <!-- Script dataTable -->
		<script type="text/javascript" src="../js/jquery.dataTables.js"></script>
		<script type="text/javascript" charset="utf-8">
			$(document).ready(function() {
				$('#tblUA').dataTable();
			} );
		</script><!-- Termina script dataTable -->
	</head>

	<body>
		
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
				Bitácora
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
							
					<!-- ----------------------------------- MODULOS BITACORA  DIV ----------------------------------- -->
					
					<fieldset id="controlesBuscarBit"><legend>Buscar bitácora</legend>
						<div id="controlesBitacora">
							<div id="modulosFechasBit">
								<div id="cmbModulosBit">
									<label>Módulo: </label>
									<select class="con_estilo" style="width:150px;" name="modulosBitacora" id="modulosBitacora" size=1 type="text">
										<option value="PLAN DE ESTUDIOS">PLAN DE ESTUDIOS</option>
										<option value="CARGA ACADEMICA">CARGA ACADEMICA</option>
										<option value="DISPONIBILIDAD DOCENTE">DISPONIBILIDAD DOCENTE</option>
										<option value="CREACION DE HORARIO">CREACION DE HORARIO</option>
										<option value="CALENDARIZACION DE EXAMENES">CALENDARIZACION DE EXAMENES</option>
										<option value="CONTROL DE INASISTENCIAS">CONTROL DE INASISTENCIAS</option>
										<option value="LOGIN Y USUARIOS">LOGIN Y USUARIOS</option>
									</select>		
								</div>

								<div id="fechaIniBit">
									<div id="lblFechaIniBit">Fecha inicio: </div>
									<input style="width:150px;" class="con_estilo" name="fechaIniBit" id="fechaIniBit" size=1 type="date">		
								</div>

								<div id="fechaFinBit">
									<div id="lblFechaFinBit">Fecha fin: </div>
									<input style="width:150px;" class="con_estilo" name="fechaFinBit" id="fechaFinBit" size=1 type="date">		
								</div>
							</div>


							<div id="seccionBuscarPorBit">
								<div id="cmbSeccionesBit">
									<label>Sección: </label>
									<select class="con_estilo" style="width:150px;" name="seccionesBit" id="seccionesBit" size=1 type="text">
										<option value="TODAS">TODAS</option>
										<option value="ALTAS">ALTAS</option>
										<option value="BAJAS">BAJAS</option>
										<option value="MODIFICACIONES">MODIFICACIONES</option>
									</select>		
								</div>

								<div id="cmbBuscarPorBit">
									<label>Usuario: </label>
									<Input class="con_estilo" style="width:170px;" text-transform:"uppercase" name="buscarPorBit" id="buscarPorBit" list="datalist_buscarPorBit" size=1 type="text">
										<datalist id="datalist_buscarPorBit">
											<option value="TODOS">TODOS</option>
											<option value="IVAN AVILA">IVAN AVILA</option>
											<option value="UNICE ESPINOZA">UNICE ESPINOZA</option>
											<option value="CYNTHIA DUARTE">CYNTHIA DUARTE</option>
										</datalist>		
								</div>
							</div>


				
								<div id="btnBuscarBit">
									<input style="width:120px"class="estilo_button2" type="button" value="Buscar" name="buscarBitacora" id="buscarBitacora">
								</div>
							
							</div>
						</fieldset>
				


						
			
				<!---------------------------------------------------------------------------------------------------->

	<div id="GridPlanEstudio">
	<br>
		<div id="demo">
			<table cellpadding="0" cellspacing="0" border="0" class="display" id="tblUA">
				<thead>
					<tr>
						<th>ID USUARIO</th>
						<th>FECHA INGRESO</th>
						<th>HORA INGRESO</th>
						<th>FECHA FIN</th>
						<th>HORA FIN</th>
						<th>CAMPOS CAPTURADOS</th>
						<th>HABILITO ALTA</th>
						<th>MOVIMIENTOS</th>
												

					</tr>
				</thead>
				<tbody>
					<tr class="gradeX">
						<td>000453</td>
						<td>12/02/14</td>
						<td>9:38 am</td>
						<td class="center">12/02/14</td>
						<td class="center">13:24 pm</td>
						<td class="center">PE 2014-2</td>
						<td class="center">NO</td>
						<td class="center">Alta plan 2014-2, Campus, Unidad academica, Nivel, Programa, Carrera, Seriacion, etc.</td>
						
						
					</tr>
					<tr class="gradeC">
						<td>000453</td>
						<td>12/02/14</td>
						<td>9:38 am</td>
						<td class="center">12/02/14</td>
						<td class="center">13:24 pm</td>
						<td class="center">PE 2014-2</td>
						<td class="center">NO</td>
						<td class="center">Alta plan 2014-2, Campus, Unidad academica, Nivel, Programa, Carrera, Seriacion, etc.</td>
						
						
					</tr>
					<tr class="gradeA">
						<td>000453</td>
						<td>12/02/14</td>
						<td>9:38 am</td>
						<td class="center">12/02/14</td>
						<td class="center">13:24 pm</td>
						<td class="center">PE 2014-2</td>
						<td class="center">NO</td>
						<td class="center">Alta plan 2014-2, Campus, Unidad academica, Nivel, Programa, Carrera, Seriacion, etc.</td>
						
						
					</tr>
					<tr class="gradeA">
						<td>000453</td>
						<td>12/02/14</td>
						<td>9:38 am</td>
						<td class="center">12/02/14</td>
						<td class="center">13:24 pm</td>
						<td class="center">PE 2014-2</td>
						<td class="center">NO</td>
						<td class="center">Alta plan 2014-2, Campus, Unidad academica, Nivel, Programa, Carrera, Seriacion, etc.</td>
						
						
					</tr>
					<tr class="gradeA">
						<td>000453</td>
						<td>12/02/14</td>
						<td>9:38 am</td>
						<td class="center">12/02/14</td>
						<td class="center">13:24 pm</td>
						<td class="center">PE 2014-2</td>
						<td class="center">NO</td>
						<td class="center">Alta plan 2014-2, Campus, Unidad academica, Nivel, Programa, Carrera, Seriacion, etc.</td>
						
						
					</tr>
					<tr class="gradeA">
						<td>000453</td>
						<td>12/02/14</td>
						<td>9:38 am</td>
						<td class="center">12/02/14</td>
						<td class="center">13:24 pm</td>
						<td class="center">PE 2014-2</td>
						<td class="center">NO</td>
						<td class="center">Alta plan 2014-2, Campus, Unidad academica, Nivel, Programa, Carrera, Seriacion, etc.</td>
						
						
					</tr>
					<tr class="gradeA">
						<td>000453</td>
						<td>12/02/14</td>
						<td>9:38 am</td>
						<td class="center">12/02/14</td>
						<td class="center">13:24 pm</td>
						<td class="center">PE 2014-2</td>
						<td class="center">NO</td>
						<td class="center">Alta plan 2014-2, Campus, Unidad academica, Nivel, Programa, Carrera, Seriacion, etc.</td>
						
						
					</tr>
					<tr class="gradeA">
						<td>000453</td>
						<td>12/02/14</td>
						<td>9:38 am</td>
						<td class="center">12/02/14</td>
						<td class="center">13:24 pm</td>
						<td class="center">PE 2014-2</td>
						<td class="center">NO</td>
						<td class="center">Alta plan 2014-2, Campus, Unidad academica, Nivel, Programa, Carrera, Seriacion, etc.</td>
						
						

					</tr>
					
					
					<tr class="gradeX">
						<td>000453</td>
						<td>12/02/14</td>
						<td>9:38 am</td>
						<td class="center">12/02/14</td>
						<td class="center">13:24 pm</td>
						<td class="center">PE 2014-2</td>
						<td class="center">NO</td>
						<td class="center">Alta plan 2014-2, Campus, Unidad academica, Nivel, Programa, Carrera, Seriacion, etc.</td>
						
						
					</tr>
					<tr class="gradeC">
						<td>000453</td>
						<td>12/02/14</td>
						<td>9:38 am</td>
						<td class="center">12/02/14</td>
						<td class="center">13:24 pm</td>
						<td class="center">PE 2014-2</td>
						<td class="center">NO</td>
						<td class="center">Alta plan 2014-2, Campus, Unidad academica, Nivel, Programa, Carrera, Seriacion, etc.</td>
						
						
					</tr>
					<tr class="gradeC">
						<td>000453</td>
						<td>12/02/14</td>
						<td>9:38 am</td>
						<td class="center">12/02/14</td>
						<td class="center">13:24 pm</td>
						<td class="center">PE 2014-2</td>
						<td class="center">NO</td>
						<td class="center">Alta plan 2014-2, Campus, Unidad academica, Nivel, Programa, Carrera, Seriacion, etc.</td>
						
						
						
					</tr>
					<tr class="gradeU">
						<td>000453</td>
						<td>12/02/14</td>
						<td>9:38 am</td>
						<td class="center">12/02/14</td>
						<td class="center">13:24 pm</td>
						<td class="center">PE 2014-2</td>
						<td class="center">NO</td>
						<td class="center">Alta plan 2014-2, Campus, Unidad academica, Nivel, Programa, Carrera, Seriacion, etc.</td>
						

					</tr>
						
				</tbody>	
			</table>

				<div id="btnImprimirBit">
					<input style="width:120px"class="estilo_button2" type="button" value="Imprimir" name="imprimirBit" id="imprimirBit">
				</div>
		</div>
	</div>
		</section>
		<footer>
			<div id="pie_correo">email: emma.castillejos@uabc.edu.mx</div>
			<div id="pie_tel">Teléfono: 664 188 9221</div>

		</footer>
	</body>
<!----------------------------------------------------------->

</html>