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
			$(document).ready(function() {
				$('#tblUA').dataTable();
			} );
		</script><!-- Termina script dataTable -->

		<!-- CAPTCHA -->

		<script type="text/javascript">

   //Crear/ Generar la funcion del Captcha
    function DrawCaptcha()
    {
        var a = Math.ceil(Math.random() * 9)+ '';
   		var aLetras = new Array('a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u');
		var b = aLetras[Math.floor(Math.random()*aLetras.length)];
		var c = Math.ceil(Math.random() * 9)+ '';      
		var d = aLetras[Math.floor(Math.random()*aLetras.length)];
		var e = Math.ceil(Math.random() * 9)+ '';  
		var f = aLetras[Math.floor(Math.random()*aLetras.length)];
		var g = aLetras[Math.floor(Math.random()*aLetras.length)];
        var code = a + ' ' + b + ' ' +c+ ' ' + d + ' ' + e + ' ' + f + ' '+ g;
        document.getElementById("txtCaptcha").value = code
    }

   //Validar la entrada, funcion para generar el codigo de seguridad  
    function ValidCaptcha(){
        var str1 = removeSpaces(document.getElementById('txtCaptcha').value);
        var str2 = removeSpaces(document.getElementById('txtInput').value);
        if (str1 == str2) return true;        
        return false; 
    }

    //Quitar espacios de la entrada y generar codigo
    function removeSpaces(string)
    {
        return string.split(' ').join('');
    }
   </script>

		<!-------------------------------------------------------------------------------------->

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
					<tr>
						<td>Usuario?:</td>
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
					<tr>
						<td>Usuario?:</td>
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
	<div class="md-overlay"></div>
			
	<!--PARA CARGAR EL CAPTCHA--> 
	<body onload="DrawCaptcha();">
	<!-------------------------->

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
				

						<div class="us_txtNoEmpleado">No. Empleado:
							<input style="margin-left:7px" class="dd_estilo_combo" type="text"  name="nombreRegUsuarios" id="nombreRegUsuarios" size=1>
						</div>
				
						<div class="us_nuevo_usuario">A. Paterno:		
							<input style="margin-left:30px" class="dd_con_estilo_largo" type="text" name="apellidosRegUsuarios" id="apellidosRegUsuarios" size=1>
						</div>

						<div class="us_nuevo_usuario">A. Materno:		
							<input style="margin-left:68px" class="dd_con_estilo_largo" name="apellidosRegUsuarios" id="apellidosRegUsuarios" size=1>
						</div>

						<div class="us_nuevo_usuario">Nombre:
							<input style="margin-left:50px" class="dd_con_estilo_largo" type="text" name="nombreRegUsuarios" id="nombreRegUsuarios" size=1>
						</div>

						<div class="us_div">
							<div class="us_nuevo">Correo:
								<input style="margin-left:57px" class="dd_con_estilo_largo" type="text" name="correoE" id="correoE" size=1>
							</div>
							<div class="us_repetir">Repetir correo:
								<input style="margin-left:40px" class="dd_con_estilo_largo" type="text" name="correoE" id="correoE" size=1>
							</div>
						</div>


						<div class="us_div">
							<div class="us_nuevo">Contraseña:
								<input style="margin-left:27px" class="dd_con_estilo_largo" type="password" placeholder="RFC" name="contrasenaRegUsuarios" id="contrasenaRegUsuarios" size=1>
							</div>

							<div class="us_repetir">Repetir Contraseña:
								<input style="margin-left:11px" class="dd_con_estilo_largo" type="password" placeholder="RFC" name="contrasenaRegUsuarios" id="contrasenaRegUsuarios" size=1>
							</div>
						</div>


						<div class="us_div">
							<div class="us_nuevo">Puesto:	
								<select style="margin-left:59px" class="dd_con_estilo_largo">
									<option>1. ADMINISTRADOR MASTER</option>
									<option>2. ADMINISTRADOR</option>
									<option>3. AUXILIAR ADMINISTRATIVO</option>
									<option>4. COORDINADOR DE CARRERA</option>
									<option>5. COORDINADOR DE ÁREA</option>
									<option>6. DOCENTES</option>
								</select>
								           
							</div>

					
							<div class="us_repetir">Categoría:
								<select style="margin-left:80px" class="dd_con_estilo_largo">
									<option>A</option>
									<option>B</option>
									<option>C</option>
								</select>


								<!-- TABLA MODAL CATEGORIA-->
								<div class="btnUnidadAcadRegistro"><input style="width:30px; height:30px;" class="md-trigger" data-modal="us_categoria" type="button" value="+"></a></div>
								<!--             -->
							</div>
						</div>

						<div class="us_div">
							<div class="us_nuevo">U. Acad:
									<select style="margin-left:53px" class="dd_con_estilo_largo" type="text" placeholder="Unidad académica" name="campusRegUsuarios" id="campusRegUsuarios"> 
										<option value="FCA">FCA</option>
										<option value="FCQ">FCQ</option>
										<option value="FNI">FNI</option>
									</select>
								    <!-- TABLA MODAL UNIDAD ACADEMICA-->
									<div class="btnUnidadAcadRegistro"><input style="width:30px; height:30px; margin-left: -40px;" class="md-trigger" data-modal="us_uacad" type="button" value="+"></a></div>
									<!--     -->
							</div>
								

							<div class="us_repetir">Campus:
									<select style="margin-left:93px" class="dd_con_estilo_largo" type="text" placeholder="Campus" name="campusRegUsuarios" id="campusRegUsuarios">
										<option value="Tijuana">TIJUANA</option>
										<option value="Valle de las palmas">VALLE DE LAS PALMAS</option>
										<option value="Mexicali">MEXICALI</option>
									</select>
									<!-- TABLA MODAL CAMPUS-->
									<div class="btnUnidadAcadRegistro"><input style="width:30px; height:30px;" class="md-trigger" data-modal="us_campus" type="button" value="+"></a></div>
									<!--             -->
							</div>		


							<div class="us_nuevo">Pregunta:
									<select style="margin-left:44px" class="dd_con_estilo_largo" type="text" name="us_pregunta" id="us_pregunta">
										<option value="¿CUAL ES EL NOMBRE DE MI MASCOTA?">¿CUAL ES EL NOMBRE DE MI MASCOTA?</option>
										<option value="¿CUAL ES LA FECHA DE NACIMIENTO DE MI ABUELO MATERNO?">¿CUAL ES LA FECHA DE NACIMIENTO DE MI ABUELO MATERNO?</option>
										<option value="¿CUAL ES LA EDAD DE MI PAPA?">¿CUAL ES LA EDAD DE MI PAPA?</option>
									</select>
									
							</div>	

							<div class="us_repetir">Respuesta:
								<input style="margin-left:75px" class="dd_con_estilo_largo" type="text" name="us_Respuesta" id="us_Respuesta" size=1>
							</div>	
						</div>

						<div id="us_divCaptcha">
							<table>
							    <tr>
							        <td>
							            Introduce los caracteres:<br>
							        </td>
							    </tr>
							    <tr>
							        <td>
							            <input class="dd_con_estilo_largo" style="background-color: rgba(104,160,26,0.3); color:green; margin-left:10px; height:40px; margin-bottom:10px; text-align:center; border:none; font-weight:bold; font-size:24px;" type="text" id="txtCaptcha"  />
							            <input class="us_clsRefresh" type="button" id="btnrefresh" value="" onclick="DrawCaptcha();" />
							        </td>
							    </tr>
							    <tr>
							        <td>
							            <input class="dd_con_estilo_largo" style="margin-left:-21px; text-align:center; font-size:16px;" type="text" id="txtInput"/>    
							        </td>
							    </tr>
							    
							</table>
						</div>

						<div id="us_btnRegistroUsuario">
							<input type="button" style="width:200px" class="estilo_button2" value="Modificar usuario" name="modificarUsuario" id="modificarUsuario">
							<input type="button" style="width:200px" class="estilo_button2" value="Crear usuario" name="crearUsuario" id="crearUsuario" onclick="alert(ValidCaptcha())";>
						</div>
			</div>

			<div id="us_tablaRegistro">
				<table cellpadding="0" cellspacing="0" border="0" class="display" id="tblUA">
					<thead>
						<tr>
							<th>NO. EMPLEADO</th>
							<th>A. PATERNO</th>
							<th>A. MATERNO</th>
							<th>NOMBRE</th>
							<th>CORREO</th>
							<th>PUESTO</th>
							<th>ELIMINAR</th>
						
							

						</tr>
					</thead>
					<tbody>


						<tr class="gradeX">
							<td>1234567</td>
							<td>GONZALEZ</td>
							<td>AYALA</td>
							<td>ERNESTO RAUL</td>
							<td>ernesto.gonzalez@uabc.edu.mx</td>
							<td>1. AMINISTRADOR MASTER</td>
							<td><input type="button" value="-" class="clsEliminarFila"></td>
							
						</tr>
						<tr class="gradeC">
							<td>1334567</td>
							<td>GAMBOA</td>
							<td>AYALA</td>
							<td>ERNESTO RAUL</td>
							<td>ernesto.gamboa@uabc.edu.mx</td>
							<td>2. AMINISTRADOR </td>
							<td><input type="button" value="-" class="clsEliminarFila"></td>
							
						</tr>
						<tr class="gradeA">
							<td>1434567</td>
							<td>ROSAS</td>
							<td>DUARTE</td>
							<td>JUVENTINO</td>
							<td>juventino.rosas@uabc.edu.mx</td>
							<td>1. AMINISTRADOR MASTER</td>
							<td><input type="button" value="-" class="clsEliminarFila"></td>
							
						</tr>
						<tr class="gradeA">
							<td>1534567</td>
							<td>BASTIDAS</td>
							<td>ESPINOZA</td>
							<td>CLARA ELIZABETH</td>
							<td>clara.bastidas@uabc.edu.mx</td>
							<td>1. AMINISTRADOR MASTER</td>
							<td><input type="button" value="-" class="clsEliminarFila"></td>
							
						</tr>
						<tr class="gradeA">
							<td>1634567</td>
							<td>AVILA</td>
							<td>FRAUSTO</td>
							<td>MIGUELINA</td>
							<td>miguelina.avila@uabc.edu.mx</td>
							<td>1. AMINISTRADOR MASTER</td>
							<td><input type="button" value="-" class="clsEliminarFila"></td>
							
						</tr>
						<tr class="gradeA">
							<td>1734567</td>
							<td>CONTRERAS</td>
							<td>CASTRO</td>
							<td>RUFINO</td>
							<td>rufino.contreras@uabc.edu.mx</td>
							<td>1. AMINISTRADOR MASTER</td>
							<td><input type="button" value="-" class="clsEliminarFila"></td>

						</tr>
						<tr class="gradeA">
							<td>1234567</td>
							<td>GONZALEZ</td>
							<td>AYALA</td>
							<td>ERNESTO RAUL</td>
							<td>ernesto.gonzalez@uabc.edu.mx</td>
							<td>1. AMINISTRADOR MASTER</td>
							<td><input type="button" value="-" class="clsEliminarFila"></td>
							
						</tr>
						<tr class="gradeA">
							<td>1734567</td>
							<td>CONTRERAS</td>
							<td>CASTRO</td>
							<td>RUFINO</td>
							<td>rufino.contreras@uabc.edu.mx</td>
							<td>1. AMINISTRADOR MASTER</td>
							<td><input type="button" value="-" class="clsEliminarFila"></td>
							
						</tr>
						
						
						<tr class="gradeX">
							<td>1634567</td>
							<td>AVILA</td>
							<td>FRAUSTO</td>
							<td>MIGUELINA</td>
							<td>miguelina.avila@uabc.edu.mx</td>
							<td>1. AMINISTRADOR MASTER</td>
							<td><input type="button" value="-" class="clsEliminarFila"></td>
							
						</tr>
						<tr class="gradeC">
							<td>1234567</td>
							<td>GONZALEZ</td>
							<td>AYALA</td>
							<td>ERNESTO RAUL</td>
							<td>ernesto.gonzalez@uabc.edu.mx</td>
							<td>1. AMINISTRADOR MASTER</td>
							<td><input type="button" value="-" class="clsEliminarFila"></td>
							
						</tr>
						<tr class="gradeC">
							<td>1334567</td>
							<td>GAMBOA</td>
							<td>AYALA</td>
							<td>ERNESTO RAUL</td>
							<td>ernesto.gamboa@uabc.edu.mx</td>
							<td>2. AMINISTRADOR </td>
							<td><input type="button" value="-" class="clsEliminarFila"></td>
						</tr>
						<tr class="gradeU">
							<td>1534567</td>
							<td>BASTIDAS</td>
							<td>ESPINOZA</td>
							<td>CLARA ELIZABETH</td>
							<td>clara.bastidas@uabc.edu.mx</td>
							<td>1. AMINISTRADOR MASTER</td>
							<td><input type="button" value="-" class="clsEliminarFila"></td>
							
						</tr>
							
					</tbody>	
				</table>
			</div>

				<div id="btnImprimirBit">
					<input style="width:120px"class="estilo_button2" type="button" value="Imprimir" name="imprimirBit" id="imprimirBit">
				</div>
		
		</section>
		<footer>
			<div id="pie_correo">email: emma.castillejos@uabc.edu.mx</div>
			<div id="pie_tel">Teléfono: 664 188 9221</div>

		</footer>

			<!--SCRIPT PARA VENTANA MODAL-->
		
		<script src="../js/classie.js"></script>
		<script src="../js/modalEffects.js"></script>
		<script type="text/javascript"></script>
			
	</body>
<!----------------------------------------------------------------->

</html>