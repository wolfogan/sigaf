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
						<td><input style="width: 200px; height: 30px; border-radius: 5px; border-color: #DBDBEA;" type="text" name="etapa_descripcion" id="txtCatDescripcionEtapa"  /></td>
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

			<form  method="post" id="formularioRegUsuarios">
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
						<td>User Name:</td>
						<td><input class="dd_con_estilo_largo" type="text"  name="username" id="username" title="Campo requerido." placeholder="Nick" required /></td>
						<td></td>
						<td>Ingreso a UABC:</td>
						<td><input class="dd_con_estilo_largo" type="date" name="hr_ingresoU" id="hr_ingresoU" required/></td>
						<td></td>		
					</tr>
							
					<tr>
						<td>A. Paterno:</td>
						<td><input class="dd_con_estilo_largo" type="text" name="apellidosPRegUsuarios" id="apellidosPRegUsuarios" placeholder="A. Paterno" required/></td>
						<td></td>
						<td>A. Materno</td>
						<td><input class="dd_con_estilo_largo" type="text" name="apellidosMRegUsuarios" id="apellidosMRegUsuarios" placeholder="A. Materno" required/></td>
						<td></td>
					</tr>

					<tr>
						<td>Nombre:</td>
						<td><input class="dd_con_estilo_largo" type="text" name="nombreRegUsuarios" id="nombreRegUsuarios" placeholder="Nombre" required/></td>
						<td></td>
						<td>Sexo:</td>
						<td>
							<select class="dd_con_estilo_largo" name="sexo" id="sexo" required>
								<option value='F'>Femenino</option>
								<option value='M'>Masculino</option>	
							</select>
						</td>
						<td></td>
					</tr>

					<tr>
						<td>Correo:</td>
						<td><input class="dd_con_estilo_largo" type="email" name="correoE" id="correoE" placeholder="example@mail.com" required/></td>
						<td></td>
						<td>Repetir correo:</td>
						<td><input class="dd_con_estilo_largo" type="email" name="correoER" id="correoER" placeholder="example@mail.com" required/></td>
						<td></td>
					</tr>
							
					<tr>
						<td>Telefono:</td>
						<td><input class="dd_con_estilo_largo" type="text" placeholder="Teléfono" name="telefono" id="telefono" required/></td>
						<td></td>
						<td>Contraseña:</td>
						<td><input class="dd_con_estilo_largo" type="password" name="contrasena_us" id="contrasena_us" placeholder="***" required/></td>
						
						<td></td>
					</tr>

					<tr>
						<td>Puesto:</td>
						<td>
							<select class="dd_con_estilo_largo" name="puesto" id="puesto" required>
								@foreach($levels as $level)
									<option value={{$level->level}}>{{$level->descrip_level}}</option>
								@endforeach
							</select>
						</td>
						<td></td>
						<td>Categoría:</td>
						<td>
							<select class="dd_con_estilo_largo" name="categoria" id="categoria" required>
								@foreach($categorias as $categoria)
									<option value="{{$categoria -> categoria}}">{{$categoria -> descripcion}}</option>
								@endforeach
							</select>
					
						</td>
						<td>
							<input class="md-trigger" data-modal="us_categoria" type="button" value="+"></a>								</td>
					</tr>

					<tr>
						<td>U. Acad:</td>
						<td>
							<select class="dd_con_estilo_largo" type="text" placeholder="Unidad académica" name="uacademicaRegUsuarios" id="uacademica" required> 
								@foreach($uacademicas as $uacademica)
									<option value="{{$uacademica->uacademica}}">{{$uacademica->descripshort}}</option>
								@endforeach
							</select>	
						</td>
						<td>
							<input style="width:30px; height:30px" class="md-trigger" data-modal="us_uacad" type="button" value="+"></a>
						</td>
						<td>Campus:</td>
						<td>
							<select class="dd_con_estilo_largo" type="text" placeholder="Campus" name="campusRegUsuarios" id="campusRegUsuarios" required>
								@foreach($campus as $camp)
									<option value="{{$camp->campus}}">{{$camp->descripcion}}</option>
								@endforeach
							</select>		
						</td>
						<td>
							<input class="md-trigger" data-modal="us_campus" type="button" value="+"></a>
						</td>
					</tr>
								
				

				</table>

				<div id="us_btnRegistroUsuario">
					<input type="submit" style="width:200px" class="estilo_button2" value="Modificar usuario" name="modificarUsuario" id="modificarUsuario">
					<input type="submit" style="width:200px" class="estilo_button2" value="Crear usuario" name="crearUsuario" id="crearUsuario">
					<input type="hidden" name="users_id" id="users_id" value="{{Auth::user()->id}}" />
					<input type="hidden" name="id" id="id" />
					
				</div>
			</form>

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

		// Funciones global
		var actualizar = false;

		function Limpiar()
		{
			$("input[type='text']").val("");
			$("input[type='email']").val("");
			$("input[type='date']").val("");
			$("input[type='password']").val("");
			$("select").val(0);


		}

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
								"<input type='button' value='-' class='clsEliminarFila' title='"+users[i].id+"' username='" + users[i].username + "'>"]).draw();
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

		function Registrar()
		{
			$.ajax({
				url : "<?php echo URL::to('usuarios/registrarusuario'); ?>",
				type: "post",
				data: $("#formularioRegUsuarios").serialize(),	
			})
			.done(function(data){
				alert(data);
				Limpiar();
				Actualizarusers();
			})
			.fail(function(jqXHR, textStatus, errorThrown){
				alert(jqXHR.responseText);
			});
			//$("#formularioRegUsuarios").submit();
		}

		function Actualizar()
		{
			$.ajax({
				url : "<?php echo URL::to('usuarios/modificarusuario'); ?>",
				type: "post",
				data: $("#formularioRegUsuarios").serialize(),
			})
			.done(function(data){
				alert(data);
				Limpiar();
				Actualizarusers();
			})
			.fail(function(jqXHR, textStatus, errorThrown){
				alert(jqXHR.responseText);
			});
		}
		</script>

		<script type="text/javascript">
		$(function(){

			Actualizarusers();
			var t = $('#tblUA').DataTable();
			
			$("input[type='submit']").on("click",function(event){
				
				var value = $(this).attr("value");

				if(value == "Crear usuario")
				{
					$("#formularioRegUsuarios").attr("action","javascript:Registrar();");
				}
				else
				{
					$("#formularioRegUsuarios").attr("action","javascript:Actualizar();");

				}
			});
			
			$('#tblUA tbody').on('click','td',function(event){
				if(t.cell(this).index().column < 8)
				{
					/* Habilitar todas las carreras
					$("#select_carreras option").removeAttr('disabled');
					$(".example41").multiselect('refresh');*/

					//$("#limpiar").val("Cancelar");

					if($(".dataTables_empty").length==0) // Si hay mas de un registro.
					{
						if ( $(this).parent().hasClass('selected') ) // Si esta seleccionado
						{
							$(this).parent().removeClass('selected');
							Limpiar();
						}
						else
						{
							t.$('tr.selected').removeClass('selected'); // Remover selección
							$(this).parent().addClass('selected');

							var indexRow = t.cell(this).index().row;
							var id = t.cell(indexRow , 0).data();

							//alert(id);
							$.ajax({
								url: "<?php echo URL::to('usuarios/obtenerusuario'); ?>",
								type: "post",
								data: {id:id},
								success: function(user){
									//console.log(user);
									$("#id").val(user.id);
									$("#username").val(user.username);
									$("#hr_ingresoU").val(user.fec_ing);
									$("#apellidosPRegUsuarios").val(user.last_name);
									$("#apellidosMRegUsuarios").val(user.last_materno);
									$("#nombreRegUsuarios").val(user.name);
									$("#sexo").val(user.sexo);
									$("#telefono").val(user.phone)
									$("#correoE,#correoER").val(user.email);
									$("#puesto").val(user.level);
									$("#categoria").val(user.categoria);
									$("#uacademica").val(user.uacademica);
									$("#campusRegUsuarios").val(user.campus);
								},
								error: function(data,textError,errorThrow){
									alert(data.responseText);
								}
							});
						}
					}
				}
			});

			$("#tblUA tbody").on("click",".clsEliminarFila",function(event){
				event.stopPropagation();
				if(confirm("Desea eliminar el usuario: \"" + $(this).attr("username") + "\""))
				{
					//$(this).parent() = td contenedor del boton eliminar
					var rowIndex = t.cell($(this).parent()).index().row;
					var id = t.cell(rowIndex , 0).data();
					
					$.ajax({
						url: "<?php echo URL::to('usuarios/eliminarusuario'); ?>",
						type: "post",
						data: {id : id},
						success: function(data){
							alert(data);
							Actualizarusers();
						},
						error: function(error,textError,errorThrow){
							alert("Error: " + error.responseText);
						}
					});
				}

			});

		});
		</script>

	</body>
<!----------------------------------------------------------------->

</html>