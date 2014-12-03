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
        
        <!-- Estilos del dataTable-->
		<link rel="stylesheet" type="text/css" href="../css/demo_table.css">
        <!--Aqui termina estilo del dataTable-->
        
		<!-- ------------------------------ Scripts Generales -------------------------------->
		<script type="text/javascript" src="../js/jquery.js"></script>

		<!--AQUI VA HORA Y FECHA-->
		<script src="../js/tiempoactual.js"></script>
		<script>$(function(){startWatch(); return false;});</script>
		<!-- Script tiempo -->


		<!---------------------------------- Para combo multiple scripts ---------------------------->
		<script type="text/javascript" src="../js/jquery-2.1.0.min.js"></script>
		<script type="text/javascript" src="../js/bootstrap-3.1.1.min.js"></script>
		<script type="text/javascript" src="../js/bootstrap-multiselect.js"></script>
		<script type="text/javascript" src="../js/prettify.js"></script>

							<div class="containerMultiple">
								<script type="text/javascript">
							    	$(document).ready(function() {
							        window.prettyPrint() && prettyPrint();

				                    $('#example41').multiselect({
							        	includeSelectAllOption: true
							        });

							    });
								</script>
			            	</div>
		<!-------------------------------------------------------------------------------------------->

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
				Administración de catálogos
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
							

<!-- ------------------------ multiple combo DIV ---------------------- -->
					
				

						<div id="carreraPrueba">
							<label>Carrera:</label>         
					         <select name="example" multiple="multiple" id="example41">
					                <option value="Contabilidad" selected>CONTABILIDAD</option>
					                <option value="Administracion" selected>ADMINISTRACIÓN</option>
					                <option value="Informatica" selected>INFORMÁTICA</option>
					                <option value="Negocios Internacionales" selected>NEGOCIOS INT.</option>
					                <option value="UnoMas" selected>UNO MAS</option>
					                <option value="DosMas" selected>DOS MÁS</option>

					         </select>
					    </div>
						

							<div id="btnBuscarCatalogo">
								<input style="width:120px"class="estilo_button2" type="button" value="Buscar" name="btnBuscarCatalogo" id="btnBuscarCatalogo">
							</div>
				
				
				<!---------------------------------------------------------------------------------------------------->

	
				<div id="btnImprimirBit">
					<input style="width:120px"class="estilo_button2" type="button" value="Imprimir" name="imprimirBit" id="imprimirBit">
				</div>
		</div>
	</div>
		</section>
		<footer>
			<!--<div id="pie_correo">email: emma.castillejos@uabc.edu.mx</div>
			<div id="pie_tel">Teléfono: 664 188 9221</div>-->

		</footer>


	</body>
<!----------------------------------------------------------->

</html>