<!doctype html>
<html lang="es">
	
	<head>
		<meta charset="utf-8"/>
		<!-- -------------------------------- Estilos CSS -------------------------------- -->
		<link rel="stylesheet" type="text/css" href="../css/normalize.css">
		<link rel="stylesheet" type="text/css" href="../css/estiloPrincipal.css">
		<link rel="stylesheet" type="text/css" href="../css/estilosnav.css">
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
							
					<!-- ----------------------------------- MODULOS BITACORA  DIV ----------------------------------- -->
					
					<fieldset id="adminCatalogosFieldset"><legend>Buscar Catálogo</legend>
						<div id="adminCatalogos">

							<div id="cmbBuscarCatalogo">
								<label>Buscar por: </label>
								<select class="con_estilo" style="width:170px;" name="buscarCatalogo" id="buscarCatalogo" size=1 type="text">
									<option value="Plan">PLAN</option>
									<option value="Nivel">NIVEL</option>
									<option value="Programa">PROGRAMA</option>
									<option value="Carrera">CARRERA</option>
									<option value="Etapa">ETAPA</option>
									<option value="Tipo">TIPO</option>
									<option value="Seriacion">SERIACION</option>
									<option value="UnidadAcad">UNIDAD ACADEMICA</option>
									<option value="Campus">CAMPUS</option>
								</select>		
							</div>
						</div>

							<div id="btnBuscarCatalogo">
								<input style="width:120px"class="estilo_button2" type="button" value="Buscar" name="btnBuscarCatalogo" id="btnBuscarCatalogo">
							</div>
					</fieldset>
				
				<!---------------------------------------------------------------------------------------------------->

	<div id="GridPlanEstudio">
	<br>
		<div id="demo">
			<table cellpadding="0" cellspacing="0" border="0" class="display" id="tblUA">
				<thead>
					<tr>
						<th>CODIGO</th>
						<th>DESCRIPCION</th>
						<th>FECHA INICIO</th>
						<th>FECHA FIN</th>
						<th>CREDITOS PRACTICAS</th>
						<th>ELIMINAR</th>
					
						

					</tr>
				</thead>
				<tbody>
					<tr class="gradeX">
						<td>000453</td>
						<td>12/02/14</td>
						<td>9:38 am</td>
						<td class="center">12/02/14</td>
						<td class="center">13:24 pm</td>
						<td><input type="button" value="-" class="clsEliminarFila"></td>
						
					</tr>
					<tr class="gradeC">
						<td>000453</td>
						<td>12/02/14</td>
						<td>9:38 am</td>
						<td class="center">12/02/14</td>
						<td class="center">13:24 pm</td>
						<td><input type="button" value="-" class="clsEliminarFila"></td>
						
					</tr>
					<tr class="gradeA">
						<td>000453</td>
						<td>12/02/14</td>
						<td>9:38 am</td>
						<td class="center">12/02/14</td>
						<td class="center">13:24 pm</td>
						<td><input type="button" value="-" class="clsEliminarFila"></td>
						
					</tr>
					<tr class="gradeA">
						<td>000453</td>
						<td>12/02/14</td>
						<td>9:38 am</td>
						<td class="center">12/02/14</td>
						<td class="center">13:24 pm</td>
						<td><input type="button" value="-" class="clsEliminarFila"></td>
						
					</tr>
					<tr class="gradeA">
						<td>000453</td>
						<td>12/02/14</td>
						<td>9:38 am</td>
						<td class="center">12/02/14</td>
						<td class="center">13:24 pm</td>
						<td><input type="button" value="-" class="clsEliminarFila"></td>
						
					</tr>
					<tr class="gradeA">
						<td>000453</td>
						<td>12/02/14</td>
						<td>9:38 am</td>
						<td class="center">12/02/14</td>
						<td class="center">13:24 pm</td>
						<td><input type="button" value="-" class="clsEliminarFila"></td>

					</tr>
					<tr class="gradeA">
						<td>000453</td>
						<td>12/02/14</td>
						<td>9:38 am</td>
						<td class="center">12/02/14</td>
						<td class="center">13:24 pm</td>
						<td><input type="button" value="-" class="clsEliminarFila"></td>
						
					</tr>
					<tr class="gradeA">
						<td>000453</td>
						<td>12/02/14</td>
						<td>9:38 am</td>
						<td class="center">12/02/14</td>
						<td class="center">13:24 pm</td>
						<td><input type="button" value="-" class="clsEliminarFila"></td>
						
					</tr>
					
					
					<tr class="gradeX">
						<td>000453</td>
						<td>12/02/14</td>
						<td>9:38 am</td>
						<td class="center">12/02/14</td>
						<td class="center">13:24 pm</td>
						<td><input type="button" value="-" class="clsEliminarFila"></td>
						
					</tr>
					<tr class="gradeC">
						<td>000453</td>
						<td>12/02/14</td>
						<td>9:38 am</td>
						<td class="center">12/02/14</td>
						<td class="center">13:24 pm</td>
						<td><input type="button" value="-" class="clsEliminarFila"></td>
						
					</tr>
					<tr class="gradeC">
						<td>000453</td>
						<td>12/02/14</td>
						<td>9:38 am</td>
						<td class="center">12/02/14</td>
						<td class="center">13:24 pm</td>
						<td><input type="button" value="-" class="clsEliminarFila"></td>
						
					</tr>
					<tr class="gradeU">
						<td>000453</td>
						<td>12/02/14</td>
						<td>9:38 am</td>
						<td class="center">12/02/14</td>
						<td class="center">13:24 pm</td>
						<td><input type="button" value="-" class="clsEliminarFila"></td>
						
					</tr>
						
				</tbody>	
			</table>

				<div id="btnImprimirBit">
					<input style="width:120px"class="estilo_button2" type="button" value="Imprimir" name="imprimirBit" id="imprimirBit">
				</div>
		</div>
	</div>
		</section>
		<footer></footer>
	</body>
<!----------------------------------------------------------->

</html>