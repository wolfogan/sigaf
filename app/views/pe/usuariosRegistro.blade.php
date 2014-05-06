<!doctype html>
<html lang="es">
	
	<head>
		<meta charset="utf-8"/>
		<!-- -------------------------------- Estilos CSS -------------------------------- -->
		<link rel="stylesheet" type="text/css" href="../css/normalize.css">
		<link rel="stylesheet" type="text/css" href="../css/estiloPrincipal.css">
		<link rel="stylesheet" type="text/css" href="../css/estilosnav.css">
        
               
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
					<img src="../imagenes/login.png" alt="">&nbsp;login y usuarios
				</div>
				<div id="manual" class="texto_body">
					<img src="../imagenes/manual.png" alt="">&nbsp;manual y ayuda
				</div>
			</div>
		</div>

		<section>
			<div id="formularioRegUsuarios">
				<fieldset id="usuariosRegistro">

					<div id="nombreApellidos">
						<div id="nombreRegUsuarios">	
								<input style="width: 250px; height: 30px; border-radius: 5px; border-color: #DBDBEA;" type="text" placeholder="Nombre(s)" name="nombreRegUsuarios" id="nombreRegUsuarios" size=1>
						</div>

						<div id="apellidosRegUsuarios">			
								<input style="width: 250px; height: 30px; border-radius: 5px; border-color: #DBDBEA;" type="text" placeholder="Apellidos"  name="apellidosRegUsuarios" id="apellidosRegUsuarios" size=1>
						</div>
					</div>

					<div id="correoContrasena">
						<div id="correoE">
									<input style="width: 250px; height: 30px; border-radius: 5px; border-color: #DBDBEA;" type="text" placeholder="Correo-E" name="correoE" id="correoE" size=1>
						</div>

						<div id="contrasenaRegUsuarios">
									<input style="width: 250px; height: 30px; border-radius: 5px; border-color: #DBDBEA;" type="password" placeholder="contraseña" name="contrasenaRegUsuarios" id="contrasenaRegUsuarios" size=1>
						</div>
					</div>	

					<div id="unidadCampusReg">

						<div id="unidadAcadRegUsuarios">
							<label>Unidad Académica</label>
								<select style="width:250px; height:30px; border-radius:5px; border-color:#DBDBEA;" type="text" placeholder="Unidad académica" name="campusRegUsuarios" id="campusRegUsuarios"> 
									<option value="FCA">FCA</option>
									<option value="FCQ">FCQ</option>
									<option value="FNI">FNI</option>
								</select>
							        <!-- TABLA MODAL UNIDAD ACADEMICA-->
									<div id="btnUnidadAcadRegistro"><input style="width:30px; height:30px;" class="md-trigger" data-modal="unidadAcadRegUsuarios" type="button" value="+"></a></div>
									<!--     -->
						</div>
							

						<div id="campusRegUsuarios">
							<label>Campus</label>
								<select style="width:280px; height:30px; border-radius:5px; border-color:#DBDBEA;" type="text" placeholder="Campus" name="campusRegUsuarios" id="campusRegUsuarios">
									<option value="Tijuana">Tijuana</option>
									<option value="Valle de las palmas">Valle de las palmas</option>
									<option value="Mexicali">Mexicali</option>
								</select>
							<!-- TABLA MODAL CAMPUS-->
							<div id="btnCampusReg"><input style="width:30px; height:30px;" class="md-trigger" data-modal="CampusRegUsuarios" type="button" value="+"></a></div>
							<!--             -->
						</div>
					</div>



					<div id="btnRegistroUsuario">
						<input style="width:200px"class="estilo_button2" type="button" value="Crear usuario" name="crearUsuario" id="crearUsuario">
					</div>

				</fieldset>	

			</div>
				
		</section>
		<footer></footer>
		
	</body>
<!----------------------------------------------------------->

</html>