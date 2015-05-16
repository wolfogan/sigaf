<!doctype html>
<html lang="es">

	<head>
		<meta charset="utf-8"/>
		<!-- -------------------------------- Estilos CSS -------------------------------- -->
		<link rel="stylesheet" type="text/css" href="../css/normalize.css">
		<link rel="stylesheet" type="text/css" href="../css/estiloPrincipal.css">
		<link rel="stylesheet" type="text/css" href="../css/estilosnav.css">
		<link rel="stylesheet" type="text/css" href="../css/component.css"/>

        <!-- Creación de Ventanas Modales -->
		<script src="../js/ventanamodal.js"></script>

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
			// $(document).ready(function() {
			// 	$('#tblUA').dataTable();
			// } );
		</script><!-- Termina script dataTable -->


		<!-------------------------------------- MODAL AGREGAR PUESTO -------------------------------------->
	<div class="md-modal md-effect-11" id="us_puesto">
		<form  action="<?=URL::to('planestudio/registraretapa'); ?>" class="md-content" method="post">
			<h3>Agregar Puesto</h3>
			<div class="tblCatalogos">
				<table class="tblCatPlan">
					<tr>
						<th></th>
						<th></th>
					</tr>
					<tr>
						<td>Descripción:</td>
						<td><input style="width: 200px; height: 30px; border-radius: 5px; border-color: #DBDBEA;" type="text" name="etapa_descripcion" id="txtCatDescripcionEtapa" size=1 /></td>
					</tr>
				</table>
			</div>
			<div class="CatBotones">
				<input type="submit" class="estilo_button2" value="Guardar"/>
				<input type="button" value="Salir" class="md-close" />
			</div>
		</form>
	</div>

		<!-------------------------------------- MODAL AGREGAR CATEGORIA -------------------------------------->
	<div class="md-modal md-effect-11" id="us_categoria">
		<form  action="<?=URL::to('planestudio/registraretapa'); ?>" class="md-content" method="post">
			<h3>Agregar Categoría</h3>
			<div class="tblCatalogos">
				<table class="tblCatPlan">
					<tr>
						<th></th>
						<th></th>
					</tr>
					<tr>
						<td>Descripción:</td>
						<td><input style="width: 200px; height: 30px; border-radius: 5px; border-color: #DBDBEA;" type="text" name="us_agregarDescripcion" id="txtAgregarDescripcion" size=1 /></td>
					</tr>
					<tr>
						<td>Nivel:</td>
						<td><input style="width: 200px; height: 30px; border-radius: 5px; border-color: #DBDBEA;" type="text" name="us_agregarNivel" id="txtAgregarNivel" size=1 /></td>
					</tr>
					<tr>
						<td>No. Empleado:</td>
						<td><input style="width: 200px; height: 30px; border-radius: 5px; border-color: #DBDBEA;" type="text" name="us_agregarEmpleado" id="txtAgregarEmpleado" size=1 /></td>
					</tr>
				</table>
			</div>
			<div class="CatBotones">
				<input type="submit" class="estilo_button2" value="Guardar"/>
				<input type="button" value="Salir" class="md-close" />
			</div>
		</form>
	</div>

	<!-------------------------------------- MODAL AGREGAR UNIDAD ACADEMICA -------------------------------------->
	<div class="md-modal md-effect-11" id="us_uacad">
		<form  action="<?=URL::to('planestudio/registraretapa'); ?>" class="md-content" method="post">
			<h3>Agregar Unidad Académica</h3>
			<div class="tblCatalogos">
				<table class="tblCatPlan">
					<tr>
						<th></th>
						<th></th>
					</tr>
					<tr>
						<td>Descripción corta:</td>
						<td><input style="width: 200px; height: 30px; border-radius: 5px; border-color: #DBDBEA;" type="text" name="us_agregarDescripcion" id="txtAgregarDescripcion" size=1 /></td>
					</tr>
					<tr>
						<td>Descripción:</td>
						<td><input style="width: 200px; height: 30px; border-radius: 5px; border-color: #DBDBEA;" type="text" name="us_agregarDescripcion" id="txtAgregarDescripcion" size=1 /></td>
					</tr>
					<tr>
						<td>Campus:</td>
						<td>
							<select style="width:200px; height:30px">
								<option>TIJUANA</option>
								<option>VALLE DE LAS PALMAS</option>
								<option>ENSENADA</option>
								<option>MEXICALI</option>
							</select>

						</td>
					</tr>
					<!-- <tr>
						<td>Usuario?:</td>
						<td><input style="width: 200px; height: 30px; border-radius: 5px; border-color: #DBDBEA;" type="text" name="us_agregarEmpleado" id="txtAgregarEmpleado" size=1 /></td>
					</tr> -->
				</table>
			</div>
			<div class="CatBotones">
				<input type="submit" class="estilo_button2" value="Guardar"/>
				<input type="button" value="Salir" class="md-close" />
			</div>
		</form>
	</div>

	<!-------------------------------------- MODAL AGREGAR CAMPUS -------------------------------------->
	<div class="md-modal md-effect-11" id="us_campus">
		<form  action="<?=URL::to('planestudio/registraretapa'); ?>" class="md-content" method="post">
			<h3>Agregar Campus</h3>
			<div class="tblCatalogos">
				<table class="tblCatPlan">
					<tr>
						<th></th>
						<th></th>
					</tr>
					<tr>
						<td>Descripción:</td>
						<td><input style="width: 200px; height: 30px; border-radius: 5px; border-color: #DBDBEA;" type="text" name="us_agregarDescripcion" id="txtAgregarDescripcion" size=1 /></td>
					</tr>
					<tr>
						<td>Dirección:</td>
						<td><input style="width: 200px; height: 30px; border-radius: 5px; border-color: #DBDBEA;" type="text" name="us_agregarNivel" id="txtAgregarNivel" size=1 /></td>
					</tr>
					<tr>
						<td>Ciudad:</td>
						<td>

							<select style="width:200px; height:30px">
								<option>TIJUANA</option>
								<option>TECATE</option>
								<option>ENSENADA</option>
								<option>MEXICALI</option>
							</select>

						</td>
					</tr>
					<!-- <tr>
						<td>Usuario?:</td>
						<td><input style="width: 200px; height: 30px; border-radius: 5px; border-color: #DBDBEA;" type="text" name="us_agregarEmpleado" id="txtAgregarEmpleado" size=1 /></td>
					</tr> -->
				</table>
			</div>
			<div class="CatBotones">
				<input type="submit" class="estilo_button2" value="Guardar"/>
				<input type="button" value="Salir" class="md-close" />
			</div>
		</form>
	</div>
	<div class="md-overlay"></div>

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
					Usuario: Iván Avila
				</div>
				<div id="fecha" class="texto_body">
					Fecha Actualizada
				</div>
			</div>
			<div id="ubicacion" class="texto_body">
				Login y usuarios: Registrar usuario
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

			<div id="formularioRegUsuarios">
				
						<table class="us_formulario">
							<tr>
								<th></th>
								<th></th>
								<th></th>
								<th></th>
								<th></th>
								<th></th>
							</tr>

							<tr>
								<td>No. Empleado:</td>
								<td><input class="dd_estilo_combo" type="text"  name="nombreRegUsuarios" id="nombreRegUsuarios" size=1/></td>
								<td></td>
								<td>Ingreso a UABC:</td>
								<td><input class="dd_con_estilo_largo" type="date" name="hr_ingresoU" id="hr_ingresoU" size=1/></td>
								<td></td>
								
								
							</tr>
							<tr>
								<td>A. Paterno:</td>
								<td><input class="dd_con_estilo_largo" type="text" name="apellidosRegUsuarios" id="apellidosRegUsuarios" size=1/></td>
								<td></td>
								<td>A. Materno</td>
								<td><input class="dd_con_estilo_largo" name="apellidosRegUsuarios" id="apellidosRegUsuarios" size=1/></td>
								<td></td>
							</tr>
							<tr>
								<td>Nombre:</td>
								<td><input class="dd_con_estilo_largo" type="text" name="nombreRegUsuarios" id="nombreRegUsuarios" size=1/></td>
								<td></td>
								<td>Sexo:</td>
								<td>
									<select class="dd_con_estilo_largo">
										<option>Femenino</option>
										<option>Masculino</option>		
									</select>
								</td>
								<td></td>
							</tr>
							<tr>
								<td>Correo:</td>
								<td><input class="dd_con_estilo_largo" type="text" name="correoE" id="correoE" size=1/></td>
								<td></td>
								<td>Repetir correo:</td>
								<td><input class="dd_con_estilo_largo" type="text" name="correoE" id="correoE" size=1/></td>
								<td></td>
							</tr>
							<tr>
								<td>Contraseña:</td>
								<td><input class="dd_con_estilo_largo" type="text" name="contrasena_us" id="contrasena_us" size=1/></td>
								<td></td>
								<td>Telefono:</td>
								<td><input class="dd_con_estilo_largo" type="password" placeholder="RFC" name="contrasenaRegUsuarios" id="contrasenaRegUsuarios" size=1></td>
								<td></td>
							</tr>
							<tr>
								<td>Puesto:</td>
								<td>
									<select class="dd_con_estilo_largo">
										<option>1. ADMINISTRADOR MASTER</option>
										<option>2. ADMINISTRADOR</option>
										<option>3. AUXILIAR ADMINISTRATIVO</option>
										<option>4. COORDINADOR DE CARRERA</option>
										<option>5. COORDINADOR DE ÁREA</option>
										<option>6. DOCENTES</option>
									</select>
								</td>
								<td></td>
								<td>Categoría:</td>
								<td>
									<select class="dd_con_estilo_largo">
										<option>A</option>
										<option>B</option>
										<option>C</option>
									</select>
							
								</td>
								<td>
									<input class="md-trigger" data-modal="us_categoria" type="button" value="+"></a>								</td>
							</tr>
							<tr>
								<td>U. Acad:</td>
								<td>
									<select class="dd_con_estilo_largo" type="text" placeholder="Unidad académica" name="campusRegUsuarios" id="campusRegUsuarios"> 
										<option value="FCA">FCA</option>
										<option value="FCQ">FCQ</option>
										<option value="FNI">FNI</option>
									</select>	
								</td>
								<td>
									<input style="width:30px; height:30px" class="md-trigger" data-modal="us_uacad" type="button" value="+"></a>
								</td>
								<td>Campus:</td>
								<td>
									<select class="dd_con_estilo_largo" type="text" placeholder="Campus" name="campusRegUsuarios" id="campusRegUsuarios">
										<option value="Tijuana">TIJUANA</option>
										<option value="Valle de las palmas">VALLE DE LAS PALMAS</option>
										<option value="Mexicali">MEXICALI</option>
									</select>		
								</td>
								<td>
									<input class="md-trigger" data-modal="us_campus" type="button" value="+"></a>
								</td>
							</tr>
							
									
							</div>

						</table>


						<div id="us_btnRegistroUsuario">
							<input type="button" style="width:200px" class="estilo_button2" value="Modificar usuario" name="modificarUsuario" id="modificarUsuario">
							<input type="button" style="width:200px" class="estilo_button2" value="Crear usuario" name="crearUsuario" id="crearUsuario">
						</div>
			</div>

			<div id="us_tablaRegistro">
				<table cellpadding="0" cellspacing="0" border="0" class="display" id="tblUA">
					<thead>
						<tr>
							<th>NO. EMPLEADO</th>
							<th>A. PATERNO</th>
							<th>A. MATERNO</th>
							<th>NOMBRE(S)</th>
							<th>CORREO</th>
							<th>PUESTO</th>
							<th>SEXO</th>
							<th>FECHA INGRESO</th>
							<th>ELIMINAR</th>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<th>NO. EMPLEADO</th>
							<th>A. PATERNO</th>
							<th>A. MATERNO</th>
							<th>NOMBRE(S)</th>
							<th>CORREO</th>
							<th>PUESTO</th>
							<th>SEXO</th>
							<th>FECHA INGRESO</th>
							<th>ELIMINAR</th>
						</tr>
					</tfoot>
					<tbody>
					</tbody>
				</table>
			</div>

				<div id="btnImprimirBit">
					<input style="width:120px"class="estilo_button2" type="button" value="Imprimir" name="imprimirBit" id="imprimirBit">
				</div>

		</section>
		<footer>
			<!--<div id="pie_correo">email: emma.castillejos@uabc.edu.mx</div>
			<div id="pie_tel">Teléfono: 664 188 9221</div>-->

		</footer>

			<!--SCRIPT PARA VENTANA MODAL-->

		<script src="../js/classie.js"></script>
		<script src="../js/modalEffects.js"></script>
		<script type="text/javascript">
		function Actualizarusers()
		{
			// Crear instancia Datatables para manipulación de renglones durante la ejecución
			var t = $('#tblUA').DataTable();
			//$("#ajaxLoad").css("display","block");
			$.post("<?php echo URL::to('usuarios/usuarios'); ?>",function(users){
				$('#tblUA').dataTable().fnClearTable();
				console.log(users);
				for (var i = 0; i < users.length; i++)
				{
					t.row.add([
								users[i].id,
								users[i].last_name,
								users[i].last_materno,
								users[i].name,
								users[i].email,
								users[i].levels.descrip_level,
								users[i].sexo,
								users[i].fec_ing,
								"<input type='button' value='-' class='clsEliminarFila' title='"+users[i].id+"'>"]).draw();
				}
				//$("#ajaxLoad").css("display","none");
				//activarModal();
			})
			.fail(function(errorText,textError,errorThrow){
				alert(errorText.responseText);
				/*console.log(errorText);
				console.log(textError);
				console.log(errorThrow);*/
			});
		}
		</script>
		<script type="text/javascript">
		$(function(){
			
			Actualizarusers();
		});
		</script>

	</body>
<!----------------------------------------------------------------->

</html>