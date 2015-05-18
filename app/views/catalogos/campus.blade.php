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
		<div class="md-modal md-effect-11" id="campus"> 
		<form id="formUA" action="<?=URL::to('catalogos/registrarcampus'); ?>" class="md-content" method="post">
			<h3>Agregar Campus</h3>
			<div class="tblCatalogos">
				<table class="tblCatPlan">
					<tr>
						<th></th>
						<th></th>
					</tr>
					<tr>
						<td>Nombre:</td>
						<td><input style="width: 150px; text-transform:uppercase; height: 30px; border-radius: 5px; border-color: #DBDBEA;" type="text" id="txtCatDescripcion" onkeypress="Mayusculas(this)" name="campuses_descripcion" size=1 /></td>
					</tr>
					<tr>
						<td>Direccion:</td>
						<td><input style="width: 150px; text-transform:uppercase; height: 30px; border-radius: 5px; border-color: #DBDBEA;" type="text" id="txtCatDescripcion" onkeypress="Mayusculas(this)" name="campuses_direccion" size=1 /></td>
					</tr>
					<tr>
						<td>Ciudad:</td>
						<td>
							<select name="campuses_ciudad" id="campuses_ciudad" style="width: 150px; height: 30px; border-radius: 5px; border-color: #DBDBEA;">
								@foreach ($ciudades as $laciudad)
									<option value="{{$laciudad->ciudad}}">{{$laciudad->descripcion}}</option>
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
	<div class="md-overlay"></div>
		
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
									<option value="pais">País</option>
									<option value="Estado">Estado</option>
									<option value="Ciudad">Ciudad</option>
									<option value="Campus" selected="selected">Campus</option>
									<option value="series">Seriación</option>
									<option value="uacademica">U. Académica</option>
									<option value="caracter">Carácter</option>
									<option value="etapas">Etapas</option>
									<option value="nivelprograma">Nivel Programa</option>
								</select>		
							</div>
						</div>

							<div id="btnBuscarCatalogo">
								<input style="width:120px"class="estilo_button2" type="button" value="Buscar" name="btnBuscarCatalogo" id="btnBuscarCatalogo" onclick="buscarCatalogo()">
							</div>
					</fieldset>
					<div><div class="titulo">Campus</div>
					</div>

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

				<div id="btnImprimirBit">
					<input style="width:120px" class="md-trigger" data-modal="campus"  class="estilo_button2" type="button" value="Agregar" name="imprimirBit" id="imprimirBit">
				</div>
	<br>
		
			<table cellpadding="0" cellspacing="0" border="0" class="display" id="tblUA">
				<thead>
					<tr>
						<th>CAMPUS</th>
						<th>DESCRIPCION</th>
						<th>DIRECCION</th>
						<th>CIUDAD</th>
						<th>ELIMINAR</th>
					</tr>
				</thead>
				<tbody>

						@foreach ($campuses as $elcampus)
						<tr class="gradeX">
							<form id="{{$elcampus['campus']}}" method="post" action="<?=URL::to('catalogos/actualizarcampus'); ?>"><td>{{$elcampus['campus']}}</td>
								<td>
								<input type ="hidden" name="campuses_id" value="{{$elcampus['campus']}}"/><div style=" visibility: hidden;">{{$elcampus['descripcion']}}</div>
								<input type="text"id="ciudades" name="campuses_descripcion" id="txtCatDescripcionCampus" value="{{$elcampus['descripcion']}}" readonly="true" ondblclick="this.readOnly='';" onchange="this.form.submit()">
								</td>
								<td>
								<div style=" visibility: hidden;">{{$elcampus['direccion']}}</div>
								<input type="text"id="campuses" name="campuses_direccion" id="txtCatDescripcionCiudad" value="{{$elcampus['direccion']}}" readonly="true" ondblclick="this.readOnly='';" onchange="this.form.submit()">
								</td>

								<td><div style=" visibility: hidden;">{{$elcampus['ciudad']}}</div><select id="estados" name="campuses_ciudad" id="SelectCatDescripcionPais" readonly="true" ondblclick="this.readOnly='';" onchange="this.form.submit()">
									@foreach($ciudades as $laciudad)
									@if ($laciudad['ciudad'] === $elcampus['ciudad'])
									<option value="{{$laciudad['ciudad']}}" selected="selected">{{$laciudad['descripcion']}}</option>

									@else
									<option value="{{$laciudad['ciudad']}}">{{$laciudad['descripcion']}}</option>
									@endif
									@endforeach
								</select></td>
								</td>
						</form>
						
						<td><form method="post" action="<?=URL::to('catalogos/eliminarcampus'); ?>">
							<input type ="hidden" name="campuses_id" value="{{$elcampus['campus']}}"/>
							<input type="submit" value="-" class="clsEliminarFila" />
						</form>

						</td>
						</tr>
						@endforeach
						
						
				</tbody>	
			</table>
			<div class="mensaje">@if($errors->any()){{$errors->first()}}@endif</div>
		
	</div>
		</section>
		<footer>
			<div id="pie_correo">email: emma.castillejos@uabc.edu.mx</div>
			<div id="pie_tel">Teléfono: 664 188 9221</div>

		</footer>
	
 <script src="../js/classie.js"></script>
	<script src="../js/modalEffects.js"></script>
	<script type="text/javascript">

	<!------------------------------------ PARA VALIDAR SOLO NUMEROS ---------------------------->

<script language="javascript">

			function ValidaSoloNumeros() {
			 if ((event.keyCode < 48) || (event.keyCode > 57))
			  event.returnValue = false;
			}

			function Validate(obj){
			  if(true != false){
				// Así damos de nuevo el foco al INPUT
				obj.focus();
			  }
			
			}
			function Mayusculas(input){
				this.value = this.value.toUpperCase();
			}
</script>

<!------------------------------------------------------------------------------------------>

	</body>

</html>