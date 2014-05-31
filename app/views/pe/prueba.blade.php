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


<link rel="stylesheet" type="text/css" href="../css/jquery.multiselect.css" />
<link rel="stylesheet" type="text/css" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1/themes/ui-lightness/jquery-ui.css" />

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1/jquery-ui.min.js"></script>
<script type="text/javascript" src="../js/jquery.multiselect.js"></script>
<script type="text/javascript">
$(function(){
	$("select").multiselect();
});
</script>
		<section>
							

<!-- ------------------------ multiple combo DIV ---------------------- -->
					
				

			<label>Buscar por: </label>
			<div id="p">
				<select name="example-optgroup" multiple="multiple" size="5">
					<optgroup label="Group One">
						<option value="option1">Option 1</option>
						<option value="option2">Option 2</option>
						<option value="option3">Option 3</option>
					</optgroup>
									
					<optgroup label="Group Two">
						<option value="option4">Option 4</option>
						<option value="option5">Option 5</option>
						<option value="option6">Option 6</option>
						<option value="option7">Option 7</option>
					</optgroup>
				</select>
			</div>

						

							<div id="btnBuscarCatalogo">
								<input style="width:120px"class="estilo_button2" type="button" value="Buscar" name="btnBuscarCatalogo" id="btnBuscarCatalogo">
							</div>
					</fieldset>
				
				<!---------------------------------------------------------------------------------------------------->

	
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