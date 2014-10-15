<!doctype html>
<html lang="es">
	
	<head>
		<meta charset="utf-8"/>
		<!-- -------------------------------- Estilos CSS -------------------------------- -->
		<link rel="stylesheet" type="text/css" href="../css/normalize.css">
		<link rel="stylesheet" type="text/css" href="../css/estiloPrincipal.css">
		<link rel="stylesheet" type="text/css" href="../css/estilosnav.css">
		<link rel="stylesheet" type="text/css" href="../css/component.css"/>
        
        
		<!-- ------------------------------ Scripts Generales -------------------------------->
		<script type="text/javascript" src="../js/jquery.js"></script>

		<!--AQUI VA HORA Y FECHA-->
		<script src="../js/tiempoactual.js"></script>
		<script>$(function(){startWatch(); return false;});</script>
		<!-- Script tiempo -->

       <!-- ------------------------------ DATATABLES --------------------------------------->
		
		<!-- CSS -->
		<link rel="stylesheet" type="text/css" href="../css/jquery.dataTables.css">
		<!-- JS -->
		<script src="../js/jquery.dataTables.js"></script>

		<!-- ---------------------------------------------------------------------------------->
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
				Plan de estudios: Modificar y eliminar catálogos
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
					
					<fieldset id="adminCatalogosFieldset"><legend>Buscar Catálogo</legend>
						<div id="adminCatalogos">

							<div id="cmbBuscarCatalogo">
								<label>Buscar por: </label>
								<select class="con_estilo" style="width:170px;" name="buscarCatalogo" id="seleccion">
									<option value="pais">Pais</option>
									<option value="Estado">Estado</option>
									<option value="Ciudad">Ciudad</option>
									<option value="Campus">Campus</option>
									<option value="series">Seriación</option>
									<option value="uacademica">Uacademica</option>
									<option value="caracter">Caracter</option>
									<option value="etapas">Etapas</option>
									<option value="nivelprograma">Nivel Programa</option>
								</select>		
							</div>
						</div>

							<div id="btnBuscarCatalogo">
								<input style="width:120px"class="estilo_button2" type="button" value="Buscar" name="btnBuscarCatalogo" id="btnBuscarCatalogo" onclick="buscarCatalogo()">
							</div>
					</fieldset>

					<script>
				function buscarCatalogo() {
					var opcion = document.getElementById("seleccion").value;
					if(opcion =='pais'){
    window.location.assign("pais");
    }
    if(opcion == 'Estado'){
    window.location.assign("estado");
    }
    if(opcion == 'Ciudad'){
    window.location.assign("ciudad");
    }
					if(opcion == 'series'){
    window.location.assign("series");
    }
    				if(opcion == 'Campus'){
    window.location.assign("campus");
    }
    if(opcion == 'uacademica'){
    window.location.assign("uacademica");
    }
    if(opcion == 'caracter'){
    window.location.assign("caracter");
    }
    if(opcion == 'etapas'){
    window.location.assign("etapas");
    }
    if(opcion == 'nivelprograma'){
    window.location.assign("nivelprograma");
    }

}
				</script>
				
				<!---------------------------------------------------------------------------------------------------->

	
		</section>
		<footer>
			<div id="pie_correo">email: emma.castillejos@uabc.edu.mx</div>
			<div id="pie_tel">Teléfono: 664 188 9221</div>

		</footer>
	</body>
<!----------------------------------------------------------->

</html>