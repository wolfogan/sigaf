<!DOCTYPE html >
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>Ayuda</title>
    <link rel="stylesheet" href="../css/demotab.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="../css/estilotab_manual.css" type="text/css" media="screen" />
    <script type="application/javascript" src="../js/jquery.min.js"></script>
</head>
<body>
	<div id="modal">
		<div class="modal-content">
        	<div id="salir"><a href="<?=URL::to('usuarios/usuariosregistro')?>"><img src="../imagenes/salir.png"></a></div>
           	  <h1><span>Manual de usuario</span> <br>
       	      LOGIN Y USUARIOS</h1>
   		  		<div id="back"><a href="javascript:window.history.go(-1);"><img src="../imagenes/back.png"></a></div>   
             	 <div class="container">
				 
                 <section class="tabs">
                <input id="tab-1" type="radio" name="radio-set" class="tab-selector-1" checked="checked" />
		        <label for="tab-1" class="tab-label-1" style="background-image:url(../imagenes/catalogo3.png); background-repeat:no-repeat; background-position:top;">Catálogos</label>
		
	            <input id="tab-2" type="radio" name="radio-set" class="tab-selector-2" />
		        <label for="tab-2" class="tab-label-2" style="background-image: url(../imagenes/registro1.png); background-repeat:no-repeat; background-position:top;">Registro</label>
		
	            <input id="tab-3" type="radio" name="radio-set" class="tab-selector-3" />
		        <label for="tab-3" class="tab-label-3" style="background-image:url(../imagenes/Consul.png); background-repeat:no-repeat; background-position:top;">Consulta</label>
			
	            <input id="tab-4" type="radio" name="radio-set" class="tab-selector-4" />
		        <label for="tab-4" class="tab-label-4" style="background-image:url(../imagenes/actualizar.png); background-repeat:no-repeat; background-position:top;">Modificación</label>
    
     <input id="tab-5" type="radio" name="radio-set" class="tab-selector-5" />
		        <label for="tab-5" class="tab-label-5" style="background-image:url(../imagenes/eliminar.png); background-repeat:no-repeat; background-position:top;">Eliminación</label>
    
     <input id="tab-6" type="radio" name="radio-set" class="tab-selector-6" />
	          <label for="tab-6" class="tab-label-6" style="background-image:url(../imagenes/FAQ.png); background-repeat:no-repeat; background-position:top;">FAQ</label>
    
     <input id="tab-7" type="radio" name="radio-set" class="tab-selector-7" />
	          <label for="tab-7" class="tab-label-7" style="background-image: url(../imagenes/glosario.png); background-repeat:no-repeat; background-position:top;">Glosario</label>
   
			 <div class="clear-shadow"></div>
		     	<div class="content">
		     	  <a name="arriba"></a>   
                	<div class="content-1">
						<h2>Catálogos</h2>        
                        <h3>Categorías:</h3>
                        <p>Las categorías hacen referencia a la clasificación de los docentes pueden ser de nivel A, B o C.</p>
                        <center><img src="../imagenes/registro/us/catalCatego.png"></center>
                        <ul class="lista-vineta">
                        	<p>Para ingresar categorías realice los siguientes pasos:</p>
							<li>• Descripción. Ingrese una breve descripción de la categoría.</li>
							<li>• Nivel. Introduzca el nivel de la categoría.</li>
							<li>• No. Empleado. Introduzca su número de empleado.</li>
							<li>• Presione el botón de guardar.</li>
                        </ul>
						<a href="#arriba"><img src="../imagenes/arriba.png">Ir arriba</a>
     				</div>



			        <div class="content-2">
                   	<a name="arribaReg"></a>
						<h2>Registro</h2>       
						<p>El acceso al registro de usuarios se ubica sobre el menú que se muestra al inicio de sesión del sistema, pulse la opción Login y usuarios</p>
 						<center><img src="../imagenes/registro/us/accesous.png"></center>
 						<p>Otra forma de acceder es pulsando la opción de Login y usuarios desde la barra de menú principal la cual está compuesta por 3 opciones principales;
						<ul class="lista-vineta">
							<li>• Registro, consulta y modificación de usuarios.</li>
							<li>• Cambiar contraseña.</li>
							<li>Olvidó contraseña.</li>
						</ul>
						</p>
						<center><img src="../imagenes/registro/us/menulogin.png"></center>
						<p>El registro de usuarios requiere de la inserción de los datos como se muestra en la siguiente figura, es importante que antes de iniciar con dicho registro introduzca los datos de los catálogos correspondientes (campus, unidad académica y categoría) los cuales pueden ubicarse con el símbolo de “+” o desde la sección de catálogos.</p><br>
						<center><img src="../imagenes/registro/us/regus.png"></center>
						<p>Pasos para introducir los datos:</p>
						<ul class="lista-num">
							<li><strong>1. User Name.</strong> Introduzca un Nick (apodo) con el cual quiere ser identificado (este será el usuario con el que iniciara sesión).</li>
							<li><strong>2. Ingreso a UABC. </strong>Seleccione la fecha en la que ingreso a UABC o introdúzcala directamente respetando la nomenclatura mostrada día, mes y año.</li>
							<li><strong>3. A. Paterno.</strong> Introduzca el apellido paterno.</li>
							<li><strong>4. A. Materno. </strong>Introduzca el apellido materno.</li>
							<li><strong>5. Nombre.</strong> Introduzca su nombre.</li>
							<li><strong>6. Sexo.</strong> Seleccione su sexo.</li>
							<li><strong>7. Correo.</strong> Introduzca su correo electrónico, el sistema valida la inserción es importante respetar la nomenclatura mostrada, debe contener un @ y un punto.</li>
							<li><strong>8. Repetir correo.</strong> Introduzca nuevamente su correo, el sistema valida la inserción.</li>
							<li><strong>9. Teléfono.</strong> Introduzca su número telefónico (solo números).</li>
							<li><strong>10. Contraseña.</strong> Introduzca la contraseña con la cual iniciará sesión al sistema.</li>
							<li><strong>11.	Puesto.</strong> Seleccione el puesto que desempeña el usuario en cuestión, recuerde que de acuerdo al puesto será el nivel de acceso al sistema, a continuación se muestra la relación de niveles:</li>
						</ul>
						<p>A. Altas 	B. Bajas	C. consultas	         M. Modificaciones</p>
						<center><h4 style="font-size:23px;"><strong>- Nivel 1.</strong> Administrador master</h4></center>
						<center><table style="font-size:20px;">
							<tr>
								<td><strong>Módulo</strong></td>
								<td><strong>Acciones</strong></td>
							</tr>
							<tr>
								<td>Login y usuarios</td>
								<td>A-B-C-M</td>
							</tr>
							<tr>
								<td>Plan de estudios</td>
								<td>A-B-C-M</td>
							</tr>
							<tr>
								<td>Carga académica</td>
								<td>A-B-C-M</td>
							</tr>
							<tr>
								<td>Disponibilidad docente</td>
								<td>A-B-C-M</td>
							</tr>
						</table></center>
						<center><h4 style="font-size:23px;"><strong>- Nivel 2.</strong> Administrador</h4></center>
						<center><table style="font-size:20px;">
							<tr>
								<td><strong>Módulo</strong></td>
								<td><strong>Acciones</strong></td>
							</tr>
							<tr>
								<td>Login y usuarios</td>
								<td>A-B-C-M</td>
							</tr>
							<tr>
								<td>Plan de estudios</td>
								<td>A-B-C-M</td>
							</tr>
							<tr>
								<td>Carga académica</td>
								<td>A-B-C-M</td>
							</tr>
							<tr>
								<td>Disponibilidad docente</td>
								<td>A-B-C-M</td>
							</tr>
						</table></center>
						<center><h4 style="font-size:23px;"><strong>- Nivel 3.</strong> Auxiliar administrador</h4></center>
						<center><table style="font-size:20px;">
							<tr>
								<td><strong>Módulo</strong></td>
								<td><strong>Acciones</strong></td>
							</tr>
							<tr>
								<td>Login y usuarios</td>
								<td>A-B-C-M</td>
							</tr>
							<tr>
								<td>Plan de estudios</td>
								<td>A-B-C-M</td>
							</tr>
							<tr>
								<td>Carga académica</td>
								<td>A-B-C-M</td>
							</tr>
							<tr>
								<td>Disponibilidad docente</td>
								<td>A-B-C-M</td>
							</tr>
						</table></center>
						<center><h4 style="font-size:23px;"><strong>- Nivel 4.</strong> Coordinador de carrera</h4></center>
						<center><table style="font-size:20px;">
							<tr>
								<td><strong>Módulo</strong></td>
								<td><strong>Acciones</strong></td>
							</tr>
							<tr>
								<td>Login y usuarios</td>
								<td>M (contraseña)</td>
							</tr>
							<tr>
								<td>Plan de estudios</td>
								<td>C</td>
							</tr>
							<tr>
								<td>Carga académica</td>
								<td>A-B-C-M</td>
							</tr>
							<tr>
								<td>Disponibilidad docente</td>
								<td>A-B-C-M</td>
							</tr>
						</table></center>
						<center><h4 style="font-size:23px;"><strong>- Nivel 5.</strong> Coordinador de área</h4></center>
						<center><table style="font-size:20px;">
							<tr>
								<td><strong>Módulo</strong></td>
								<td><strong>Acciones</strong></td>
							</tr>
							<tr>
								<td>Login y usuarios</td>
								<td>M (contraseña)</td>
							</tr>
							<tr>
								<td>Plan de estudios</td>
								<td>C</td>
							</tr>
							<tr>
								<td>Carga académica</td>
								<td>A-B-C-M</td>
							</tr>
							<tr>
								<td>Disponibilidad docente</td>
								<td>A-B-C-M</td>
							</tr>
						</table></center>
						<center><h4 style="font-size:23px;"><strong>- Nivel 6.</strong> Docente</h4></center>
						<center><table style="font-size:20px;">
							<tr>
								<td><strong>Módulo</strong></td>
								<td><strong>Acciones</strong></td>
							</tr>
							<tr>
								<td>Login y usuarios</td>
								<td>M(contraseña)</td>
							</tr>
							<tr>
								<td>Plan de estudios</td>
								<td>C</td>
							</tr>
							<tr>
								<td>Carga académica</td>
								<td>C</td>
							</tr>
							<tr>
								<td>Disponibilidad docente</td>
								<td>A-B-C-M</td>
							</tr>
						</table></center>
						<ul class="lista-num">
							<li><strong>12.	Categoría.</strong> Seleccione la categoría del empleado (si no está dada de alta pulse en el botón “+” y regístrela).</li>
							<li><strong>13.	Unidad académica.</strong> Seleccione la unidad académica, si no está dada de alta pulse el botón “+” y regístrela.</li>
							<li><strong>14.	Campus.</strong> Seleccione el campus al que pertenece el empleado si no está dado de alta pulse el botón “+” y regístrelo.</li>
							<li>15.	Pulse el botón de crear usuario, el sistema muestra el mensaje “usuario registrado”.</li>
						</ul>
 						<a href="#arriba"><img src="../imagenes/arriba.png">Ir arriba</a>
				    </div>




			        <div class="content-3">
						<h2>Consulta</h2>
						<p>Para consultar los usuarios registrados, entre al menú de Login y usuarios haga click en la primera opción del submenú.</p>
						<center><img src="../imagenes/registro/us/tablaregus.png"></center>
						<p>Se mostrará la tabla de la figura anterior la cual contiene la relación de registros de usuarios, dicha tabla tiene opción para filtrar la información por cualquiera de los campos, solo presione el encabezado por el cual desea filtrar la información o puede realizar la búsqueda del registro desde el cuadro de texto search.</p>
						<a href="#arriba"><img src="../imagenes/arriba.png">Ir arriba</a>
				    </div>



				    <div class="content-4">
						<h2>Modificación</h2>
                		<p>En la opción de registro, consulta y modificación de usuarios del menú de Login y usuarios se realiza la actualización de los usuarios.</p>
 						<center><img src="../imagenes/registro/us/modus.png"></center>
 						<p>La figura anterior muestra la ventana de actualización de usuarios, realice el siguiente proceso:</p>
 						<p>Cada vez que entre al módulo de Login y usuarios se le mostrará la tabla con todos los usuarios registrados, seleccione con un click el usuario que desea modificar y los datos automáticamente se cargarán en los controles de la parte superior, modifique los campos necesarios y presione el botón de modificar usuario, el sistema le enviará un mensaje indicándole que la actualización se ha realizado correctamente.</p>
 						<a href="#arriba"><img src="../imagenes/arriba.png">Ir arriba</a>
                    </div>


                 
                    <div class="content-5">
						<h2>Eliminación</h2>
						<center><img src="../imagenes/registro/us/elimus.png"></center><br>
						<p>La eliminación de usuarios se hace directamente desde la tabla de registros, presione el botón de eliminar ubicada con un signo de “-” el sistema le enviará el siguiente mensaje para validar la acción realizada: </p>
						<center><img src="../imagenes/registro/us/msgelim.png"></center>
						<p>Si está seguro de la eliminación pulse el botón de aceptar de lo contrario pulse el botón cancelar.</p>
				    </div>



                    
                    <div class="content-6">
						<h2>Preguntas frecuentes</h2>
                        <p>
                        	<ul class="lista-vineta">
								<li><strong>¿Cómo doy de alta un nuevo usuario?</strong></li><br>
								<li>R.Después de haber ubicado la sección de Login y usuarios, en la sección de registrar usuario se presentan una serie de campos los cuales debe llenar, hay 3 campos que tienen asociados un botón con el símbolo “+” estos representan catálogos, si la información que usted requiere no está registrada abra el catálogo y regístrela para que pueda concluir su alta de usuario exitosamente, por ultimo presione el botón de crear usuario.</li><br>
								<li><strong>¿Cómo modifico la información de un usuario?</strong></li><br>
								<li>R. Dentro de la ventana de registrar usuario, en la parte inferior se muestra una tabla con todos los usuarios registrados, seleccione con un click el registro que desea modificar, si no lo encuentra puede filtrarlo con la opción de search, después de seleccionarlo, en los controles de la parte superior se cargará la información del registro, modifíquela y presione el botón de modificar usuario.</li><br>
								<li><strong>¿Cómo puedo cambiar la contraseña de mi inicio de sesión?</strong></li><br>
								<li>R. Después de ubicar la sección de cambiar contraseña es necesario introducir los datos que se muestran en la pantalla para validar que es el usuario propietario de la sesión quien quiere realizar la modificación, presione el botón de cambiar contraseña.
								<li><strong>Si olvide mi contraseña ¿cómo la puedo recuperar?</strong></li><br>
								<li>R. Después de ubicar la pantalla de olvidó contraseña introduzca los datos requeridos y presione el botón de guardar, en el inicio de sesión también hay un link que lo manda a esta sección.</li><br>

                        	</ul>
                        </p>
				    </div>



                    
                    <div class="content-7">
						<h2>Glosario</h2>
                        <p>
                        	<ul class="lista-vineta">
                        		<li><strong>Captcha. </strong>Imagen que sirve para validar la inserción de la información, consiste en teclear en el recuadro una serie de caracteres que se muestran distorsionados.</li><br>
								<li><strong>Contraseña. </strong> Es una cadena de caracteres que se usa para iniciar sesión en el sistema y por tanto tener acceso a los recursos contenidos en este.</li><br>
								<li><strong>Correo.</strong> Es la cuenta correo electrónico que tiene el usuario ya sea de UABC o con otro servidor, es necesario repetir el correo para validar su inserción.</li><br>
								<li><strong>Login.</strong> Hace referencia al inicio de sesión del usuario, de acuerdo al tipo de usuario será el acceso que este tenga al sistema.</li><br>
								<li><strong>Nick.</strong> Hace referencia a un apodo con el cual el usuario iniciará sesión.</li><br>
								<li><strong>Puesto.</strong> Es el cargo que tiene asignado el usuario actualmente se encuentran registrados seis niveles, administrador master, administrador, administrador auxiliar, coordinador de carrera, coordinador de área y docente.</li><br>
								<li><strong>User name. </strong>Nombre del usuario que se registrará en el sistema.

                        	</ul>

                        </p>
                             

            					 <a  href="#arribaglosario"><img src="../imagenes/arriba.png">Ir arriba</a>
      						</ul>
				    </div>
		        </div>
			</section>
        </div>
             
       	
		</div>
		<div class="overlay"></div>
	</div>
</body>
</html>