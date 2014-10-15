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
				$('#tblUA').dataTable( {
        "order": [[ 2, "desc" ]]
    } );
} );
		</script><!-- Termina script dataTable -->
		
	</head>

	<body>
		<div class="md-modal md-effect-10" id="uacademica"> 
		<form id="formUA" action="<?=URL::to('catalogos/registraruacademica'); ?>" class="md-content" method="post">
			<h3>Agregar Unidad Academica</h3>
			<div class="tblCatalogos">
				<table class="tblCatPlan">
					<tr>
						<th></th>
						<th></th>
					</tr>
					<tr>
						<td>SIGLAS:</td>
						<td><input style="width: 150px; height: 30px; border-radius: 5px; border-color: #DBDBEA;" type="text" id="txtCatDescripcion" name="uacademicas_descripshort" size=1 /></td>
					</tr>
					<tr>
						<td>DESCRIPCION:</td>
						<td><input style="width: 150px; height: 30px; border-radius: 5px; border-color: #DBDBEA;" type="text" id="txtCatDescripcion" name="uacademicas_descripcion" size=1 /></td>
					</tr>
					<tr>
						<td>CAMPUS:</td>
						<td>
							<select name="uacademicas_campus" id="uacademicas_campus" style="width: 150px; height: 30px; border-radius: 5px; border-color: #DBDBEA;">
								@foreach ($campuses as $elcampus)
									<option value="{{$elcampus->campus}}">{{$elcampus->descripcion}}</option>
								@endforeach
							</select>
						</td>
					</tr>
					
				
				</table>
			</div>
			<div class="CatBotones">
				<input type="submit" class="estilo_button2" value="Guardar"/>
				<input type="button" value="Salir" class="md-close" />
			</div>
		</form>
	</div>
		
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

		<section><div><div style="display:inline-block; float:left;">U. Academica</div>
			<div style="display:inline-block; float:left; padding-left:40px; color:#ff1508;">@if($errors->any()){{$errors->first()}}@endif</div></div>
							
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
									<option value="uacademica" selected="selected">Uacademica</option>
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

	<div id="GridPlanEstudio">
	<br>
		
			<table cellpadding="0" cellspacing="0" border="0" class="display" id="tblUA">
				<thead>
					<tr>
						<th>ID</th>
						<th>SIGLAS</th>
						<th>DESCRIPCION</th>
						<th>CAMPUS</th>
						<th>ELIMINAR</th>
					
						

					</tr>
				</thead>
				<tbody>

						@foreach ($uacademicas as $lauacademica)
						<tr class="gradeX">
							<form id="{{$lauacademica['uacademica']}}" method="post" action="<?=URL::to('catalogos/actualizaruacademica'); ?>"><td>{{$lauacademica['uacademica']}}</td>
								<td>
								<input type ="hidden" name="uacademicas_id" value="{{$lauacademica['uacademica']}}"/><div style=" visibility: hidden;">{{$lauacademica['descripshort']}}</div>
								<input type="text"id="uacademicas" name="uacademicas_descripshort" id="txtCatDescripcionshot" value="{{$lauacademica['descripshort']}}" readonly="true" ondblclick="this.readOnly='';" onchange="this.form.submit()">
								</td>
								<td>
								<input type="text"id="uacademicas" name="uacademicas_descripcion" id="txtCatDescripcionshot" value="{{$lauacademica['descripcion']}}" readonly="true" ondblclick="this.readOnly='';" onchange="this.form.submit()">
								</td>
								<td><div style=" visibility: hidden;">{{$lauacademica['campus']}}</div><select id="estados" name="uacademicas_campus" id="SelectCampus" readonly="true" ondblclick="this.readOnly='';" onchange="this.form.submit()">
									@foreach($campuses as $elcampus)
									@if ($lauacademica['campus'] === $elcampus['campus'])
									<option value="{{$elcampus['campus']}}" selected="selected">{{$elcampus['descripcion']}}</option>

									@else
									<option value="{{$elcampus['campus']}}">{{$elcampus['descripcion']}}</option>
									@endif
									@endforeach
								</select></td>
								</td>
						</form>
						
						<td><form method="post" action="<?=URL::to('catalogos/eliminaruacademica'); ?>">
							<input type ="hidden" name="uacademicas_id" value="{{$lauacademica['uacademica']}}"/>
							<input type="submit" value="-" class="clsEliminarFila" />
						</form>

						</td>
						</tr>
						@endforeach
						
						
				</tbody>	
			</table>

				<div id="btnImprimirBit">
					<input style="width:120px" class="md-trigger" data-modal="uacademica"  class="estilo_button2" type="button" value="Agregar" name="imprimirBit" id="imprimirBit">
				</div>
		
	</div>
		</section>
		<footer>
			<div id="pie_correo">email: emma.castillejos@uabc.edu.mx</div>
			<div id="pie_tel">Teléfono: 664 188 9221</div>

		</footer>
	
 <script src="../js/classie.js"></script>
	<script src="../js/modalEffects.js"></script>
	<script type="text/javascript">

	</body>

<!----------------------------------------------------------->

</html>