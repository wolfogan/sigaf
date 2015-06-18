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
        	<div id="salir"><a href="<?=URL::to('disponibilidaddocente/registro')?>"><img src="../imagenes/salir.png"></a></div>
        	
           	  <h1><span>Manual de usuario</span> <br>
       	      DISPONIBILIDAD DOCENTE</h1>
   		  		<div id="back"><a href="javascript:window.history.go(-1);"><img src="../imagenes/back.png"></a></div>   
             	 <div class="container">
				 
                 <section class="tabs">
                <input id="tab-1" type="radio" name="radio-set" class="tab-selector-1" checked="checked" />
		        <label for="tab-1" class="tab-label-1" style="background-image:url(../imagenes/catalogo3.png); margin-left:110px; background-repeat:no-repeat; background-position:top;">Catálogos</label>
		
	            <input id="tab-2" type="radio" name="radio-set" class="tab-selector-2" />
		        <label for="tab-2" class="tab-label-2" style="background-image: url(../imagenes/registro1.png); background-repeat:no-repeat; background-position:top;">Registro</label>
		
	            <input id="tab-3" type="radio" name="radio-set" class="tab-selector-3" />
		        <label for="tab-3" class="tab-label-3" style="background-image:url(../imagenes/Consul.png); background-repeat:no-repeat; background-position:top;">Consulta</label>
			
	            <input id="tab-4" type="radio" name="radio-set" class="tab-selector-4" />
		        <label for="tab-4" class="tab-label-4" style="background-image:url(../imagenes/actualizar.png); background-repeat:no-repeat; background-position:top;">Modificación</label>
    			
    			<input id="tab-5" type="radio" name="radio-set" class="tab-selector-5" />
	            <label for="tab-5" class="tab-label-5" style="background-image:url(../imagenes/FAQ.png); background-repeat:no-repeat; background-position:top;">FAQ</label>
    
                <input id="tab-6" type="radio" name="radio-set" class="tab-selector-6" />
	            <label for="tab-6" class="tab-label-6" style="background-image: url(../imagenes/glosario.png); background-repeat:no-repeat; background-position:top;">Glosario</label>
   
			 <div class="clear-shadow"></div>
		     	<div class="content">
                	

                	<div class="content-1">
						<h2>Catálogos</h2>
						<h3>Curso de actualización</h3>
                        <p> Los docentes tiene la responsabilidad de tomar cursos para mantenerse actualizados. Para dar de alta un curso de actualización solo introduzca el nombre del curso y presione el botón de guardar.</p><br>
                        <center><img src="../imagenes/catalogos/agregarCursoActuali.png"></center><br>
                        <h3>Catálogo carrera</h3>
                        <center><img src="../imagenes/catalogos/agregarCarrera.png"></center>
                        <p>El catálogo carreras sirve para registrar las carreras en las cuales los docentes cursaron el nivel de licenciatura.
						Para dar de alta la carrera introduzca el nombre de la carrera y pulse el botón guardar, para salir de la ventana pulse el botón salir.
						</p>
						<h3>Catálogo escuela</h3>
						<center><img src="../imagenes/catalogos/agregarEscuela.png"></center>
						<p>El catálogo escuela sirve para registrar las escuelas en las cuales el docente curso su licenciatura, maestría, especialidad o doctorado.
						Para registrar una escuela introduzca el nombre de esta, las siglas del nombre y seleccione la ciudad a la cual pertenece la escuela, pulse el botón de guardar, para salir pulse el botón salir.
						</p>

						<a href="#arribaReg"><img src="../imagenes/arriba.png">Ir arriba</a>
					</div>



			        <div class="content-2">
                   <a name="arribaReg"></a>
						<h2>Registro</h2>
						<p>El registro de la disponibilidad docente está compuesto de 3 partes las cuales deben estar debidamente llenadas,  a medida que avance puede guardar la información. En la siguiente figura se muestra la clasificación de los datos del registro.</p><br>
                        <center><img src="../imagenes/registro/dd/opcionRegistro.png"></center>
                        <br><h3><strong>Datos personales:</strong></h3><br>
                        <center><img src="../imagenes/registro/dd/agregarDatPer.png"></center>
                        <p>Los datos personales están compuestos por los siguientes campos que se requiere ingresar:</p>
							<ul class="lista-vineta">
								<li><strong>• No. Empleado:</strong> se toma del inicio de sesión.</li>
								<li><strong>• Ingreso a UABC:</strong> seleccione la fecha de ingreso a UABC o digítela respetando la nomenclatura día, mes y año.
								<li><strong>• A. paterno:</strong> Dato tomado del inicio de sesión del usuario.
								<li><strong>• A. materno: </strong>Dato tomado del inicio de sesión del usuario.
								<li><strong>• Nombre(s): </strong>Dato tomado del inicio de sesión del usuario.
								<li><strong>• Sexo: </strong>seleccione su sexo.
								<li>• Pulse el botón seleccionar archivo para cargar su foto.
								<li>• Continúe con la siguiente información.
							</ul><br>
							<center><img src="../imagenes/registro/dd/agregarDirTel.png"></center>
								<ul class="lista-vineta">
									<li><strong>• Calle.</strong> Introduzca el nombre de la calle.</li>
									<li><strong>• No. Ext.</strong> Introduzca el número exterior.</li>
									<li><strong>• No. int.</strong> Introduzca el número interior de su domicilio (en caso de que aplique).</li>
									<li><strong>• Colonia.</strong> Ingrese el nombre de su colonia.</li>
									<li><strong>• C.P.</strong> ingrese su código postal.</li>
									<li><strong>• País.</strong> Seleccione su país de residencia.</li>
									<li><strong>• Estado.</strong> Seleccione su estado de residencia.</li>
									<li><strong>• Ciudad.</strong> Seleccione la ciudad.</li>
									<li><strong>• Oficina.</strong> Introduzca el teléfono de su oficina (si no aplica puede quedar vacío).</li>
									<li><strong>• Particular.</strong> Ingrese el teléfono de casa (si no aplica puede quedar vacío).</li>
									<li><strong>• Celular.</strong> Ingrese su número de teléfono celular (puede quedar vacío).</li>
									<li><strong>• Correo UABC.</strong> Ingrese su correo de UABC.</li>
									<li><strong>• Correo.</strong> Ingrese un correo alternativo.</li>
									<li>• Continúe con la siguiente información.</li>
								</ul><br>
								<center><img src="../imagenes/registro/dd/agregarTrabFuera.png"></center>
								<p>El trabajo fuera de UABC se llena solamente si es aplicable a su caso, en caso de no tener otro trabajo pase a la siguiente sección.</p>
								<ul class="lista-vineta">
									<li><strong>• RFC.</strong>  El RFC se toma del inicio se sesión.</li>
									<li><strong>• Empresa.</strong> Seleccione la empresa en la que labora fuera de UABC, en caso de no estar registrada pulse en el botón “+” este lo envía al catálogo donde podrá registrar el dato correspondiente.</li>
									<li><strong>• Puesto. </strong>Seleccione el puesto, en caso no estar registrado pulse el botón “+” para abrir el catálogo asociado a este y poder registrar el dato correspondiente.</li>
									<li><strong>• Fecha de ingreso.</strong> Seleccione la fecha de ingreso o introdúzcala respetando la nomenclatura mostrada día, mes y año.</li>
									<li><strong>• Antigüedad.</strong> Introduzca el tiempo de antigüedad.</li>
									<li>• Pulse el botón guardar, continúe con la siguiente sección.</li>
									<li>• Pulse el botón de estudios y cursos como se muestra en la siguiente figura:</li>

								</ul>
								<h3><strong>Estudios y cursos:</strong></h3><br>
								<center><img src="../imagenes/registro/dd/opcionEstudios.png"></center><br>
								<p>El docente deberá introducir la información de sus estudios con su respectivo documento que los compruebe.</p><br>
								<center><img src="../imagenes/registro/dd/agregarGradoEst.png"></center><br><br>
								<p>Siga las instrucciones para ingresar el grado de estudios:</p>
								<ul class="lista-vineta">
									<li><strong>• Licenciatura.</strong> Seleccione el nombre de la licenciatura cursada, si no se encuentra pulse el botón +Carrera para agregar el dato correspondiente.</li>
									<li><strong>• Escuela.</strong> Seleccione el nombre de la escuela donde cursó la licenciatura, si no está registrada pulse el botón +Escuela para que registre el dato correspondiente.</li>
									<li><strong>• Obtuvo grado. </strong>Active la casilla de verificación si obtuvo su grado.</li>
									<li><strong>• Titulación.</strong> Seleccione la fecha en la que se tituló o introdúzcala manualmente respetando la nomenclatura.</li>
									<li><strong>• Cédula.</strong> Ingrese su número de cédula.</li>
									<li>• Pulse el botón identificado con un clip para cargar el documento que acredita su licenciatura, en el cuadro de texto que se encuentra al lado izquierdo se pondrá el nombre del documento, si desea eliminarlo solo bórrelo con el backspace o delete del teclado.</li>
								    <li>• Para agregar otro registro pulse el botón identificado con el símbolo “+” el cual activa el registro de abajo para que pueda introducir los datos, para eliminar un registro pulse el botón identificado con una “X”.</li>

								</ul><br>
								<p><strong>NOTA.</strong> El usuario podrá introducir dos registros por nivel de estudio que haya cursado.</p><br>
								<p>Si el usuario tiene una especialidad, maestría o doctorado deberá seguir los mismos pasos, ingresar el nombre del nivel de estudio, la escuela de procedencia, si obtuvo el grado, la fecha en la que se tituló y el número de cédula así como adjuntar el archivo correspondiente.</p>
								<p>Los docentes se actualizan constantemente tomando cursos, asistiendo a congresos o talleres, es importante que lo reflejen sobre el sistema, en la siguiente figura se muestra la pantalla para ingresar los cursos a los que el usuario ha asistido.</p><br>
 								<center><img src="../imagenes/registro/dd/agregarCursos.png"></center><br>
 								<p>De inicio pulse el botón SIN CURSOS para empezar a registrar sus cursos, se abrirá la siguiente ventana:</p>
 								<center><img src="../imagenes/registro/dd/ingresarCurso.png"></center><br>
 								
 								<ul class="lista-vineta">
 									<p>Pasos para ingresar los cursos:</p>
									<li>• Elija si el curso que registrará lo recibió o lo impartió.</li>
									<li>• Seleccione de qué tipo es, curso, congreso o taller.</li>
									<li>• Ingrese el nombre del curso.</li>
									<li>• Seleccione la fecha en la que terminó dicho curso o ingrésela manualmente respetando la nomenclatura día, mes y año.</li>
									<li>• Ingrese el valor del curso.</li>
									<li>• Adjunte el archivo que comprueba que tomó el curso, pulse el botón con el clip para agregar el documento, si desea agregar más de un curso pulse el botón de “+”, si desea eliminar un registro pulse el botón con la “X”.</li>
									<li>• En los cursos de actualización debe seleccionar los cursos que desea tomar presentados en la pantalla, active la casilla de verificación.</li>
									<li>• Pulse el botón guardar, continúe con el siguiente registro, presione el botón de disponibilidad como se muestra en la siguiente figura:</li>

 								</ul><br>
 								<h3><strong>Disponibilidad:</strong></h3><br>
 								<center><img src="../imagenes/registro/dd/opcionDisponibilidad.png"></center><br>
 								<p>En la sección de disponibilidad se introducen las materias que el docente desea impartir y la disponibilidad que tendrá en el semestre por cursar. Las materias a impartir tienen un tope de 7.</p><br>
 								<center><img src="../imagenes/registro/dd/agregarDisponibilidad.png"></center><br>
 								<p>Pasos para introducir las materias a impartir:</p>
 								<ul class="lista-vineta">
 									<li>• Introduzca la clave de la materia, automáticamente se carga el nombre de la materia.</li>
									<li>• El sistema por default le mostrara las materias cursadas el semestre anterior.</li><br> 
 								</ul>
 								<p>Cada semestre el docente debe actualizar los datos de su disponibilidad,  esta se tomará en consideración para la próxima carga de materias, en caso de que el docente no actualice su disponibilidad se dará por entendido que tiene la misma que el semestre anterior.</p>
 								<p>Para ingresar la disponibilidad haga click sobre el cuadro que corresponde al día y la hora que desea seleccionar (se pondrá una palomita), el horario a considerar es desde las 7 de la mañana hasta las 10 de la noche.</p><br>
 								<center><img src="../imagenes/registro/dd/agregarDispo.png"></center><br>
 								<ul class="lista-vineta">
 									<li><strong>• Observaciones.</strong> Ingrese las observaciones que considere pertinentes.</li>
				     				<li>• Pulse el botón de guardar.</li>
 								</ul>
 						<a  href="#arribaReg"><img src="../imagenes/arriba.png">Ir arriba</a>.
				    </div>



			        <div class="content-3">
						<h2>Consulta</h2>
						<center><img src="../imagenes/registro/dd/consultaCriterios.png"></center>
						<p>Para realizar una búsqueda es necesario que introduzca los datos mediante los cuales desea filtrar la información, puede ser por número de empleado o por nombre del docente, el periodo si es necesario introducirlo, en la opción consultar por, elija una de las opciones que se muestran en la siguiente figura: </p>
                        <center><img src="../imagenes/registro/dd/consultarPor.png"></center>
                        <p>• Presione el botón de buscar para que despliegue los resultados los cuales se cargarán sobre los controles de la pantalla.</p>
				    </div>




				    <div class="content-4">
						<h2>Modificación</h2>
						<center><img src="../imagenes/registro/dd/consultaCriterios.png"></center>
						<p>Para realizar una búsqueda es necesario que introduzca los datos mediante los cuales desea filtrar la información, puede ser por número de empleado o por nombre del docente, el periodo si es necesario introducirlo, en la opción consultar por, elija una de las opciones que se muestran en la siguiente figura: </p>
                        <center><img src="../imagenes/registro/dd/consultarPor.png"></center>
                        <p>• Presione el botón de buscar para que despliegue los resultados los cuales se cargarán sobre los controles de la pantalla.</p>
                        <p>• Realice la modificación pertinente, pulse el botón de modificar.</p>
						<a href="#arribaReg"><img src="../imagenes/arriba.png">Ir arriba</a>               
				    </div>
                 
                   
                    
                    <div class="content-5">
						<h2>Preguntas frecuentes</h2>
                        <p>
                        	<ul class="lista-vineta">
								<li><strong>¿Qué es la disponibilidad docente?</strong></li><br>
								<li>R. Especificación de los datos personales, escolaridad, actividad profesional, capacitación que ha recibido o impartido un docente, así como la especificación de materias y horarios en los que pueden impartir una unidad de aprendizaje.</li>
								<br><li><strong>¿Cuál es proceso para el registro de la disponibilidad docente?</strong></li>
								<br><li>El registro está compuesto por tres secciones, datos personales, estudios y cursos, y la disponibilidad, cada sección contempla cierta información, debe introducir los datos correspondientes y pulsar el botón de guardar para avanzar a la siguiente sección, abra datos que el sistema se los inserte al validar el inicio de sesión y abra otros datos que no apliquen para su caso como lo puede ser un trabajo externo al de UABC.</li>
								<br><li><strong>¿Qué hacer en el caso de que en los campos como empresa y puesto no esté el dato que yo necesito?</strong></li>
								<br><li>R. A un lado de este control está asociado un botón con el símbolo “+”, dar click en este el cual abrirá el catálogo correspondiente parar que inserte el registro deseado (lo mismo aplica para el caso de carreras y escuela).</li>
								<br><li><strong>¿Cómo dar de alta los cursos?</strong></li>
								<br><li>R. En la sección de cursos, hay un botón alargado color gris que dice SIN CURSOS, pulse este botón y se desplegaran los campos para que ingrese los datos necesarios, si desea agregar más de un cursos pulse el botón “+” o si desea eliminar un registro presione el botón “-”.</li>
								<br><li><strong>Para insertar las materias a impartir, ¿qué hacer en caso de no tener la clave?</strong></li>
								<br><li>R. Deberá ponerse en contacto con las analistas administrativas para conseguir la clave y dar la alta la materia que desea impartir.</li>
								<br><li><strong>¿Qué hacer en caso de que en la matriz de disponibilidad me equivoque de horario o día?</strong></li>
								<br><li>R. La matriz es flexible y con solo un click puede activar o desactivar el día y la hora correspondiente.</li>
								<br><li><strong>¿Qué hacer en caso de que haya errores en mi llenado de información?</strong></li>
								<br><li>R. Si el error lo cometió usted al introducir los datos, vaya al menú de disponibilidad docente y presione la opción de consulta, deberá filtrar la información y hacer los cambios pertinentes.</li>

						</ul>

                        </p>
				    </div>
                    
                    <div class="content-6">
						<h2>Glosario</h2>
                        <ul class="lista-vineta">
							<li><strong>Cursos.</strong> Es necesario que el docente se mantenga actualizado para lo cual puede asistir a cursos, congresos o talleres, en el sistema debe ingresar el tipo de curso, el nombre, cuando lo terminó, el valor del curso y adjuntar el archivo que avale la información.</li><br>
							<li><strong>Datos personales.</strong> Engloba información personal del docente, incluye el número de empleado, el ingreso a UABC, los apellidos, nombre y sexo.</li><br>
							<li><strong>Dirección y teléfono.</strong> Información relacionada con la dirección del docente incluye la calle, numero exterior, numero interior en los casos que aplique, colonia, C.P, país, estado, ciudad, si tiene oficina el número de teléfono de esta, su teléfono particular, el número de celular donde se le pueda localizar, el correo de UABC y un correo alternativo.</li><br>
							<li><strong>Disponibilidad docente.</strong> Especificación de los datos personales, escolaridad, actividad profesional, capacitación que ha recibido o impartido un docente, así como la especificación de materias y horarios en los que pueden impartir una unidad de aprendizaje. </li><br>
							<li><strong>Disponibilidad.</strong> Es una matriz que le permite al docente asignar su disponibilidad de acuerdo al día y la hora que podrá impartir sus clases en UABC. </li><br>
							<li><strong>Grado de estudios.</strong> Hace referencia al nivel de estudios que haya cursado el docente desde la licenciatura hasta doctorado, debe adjuntar los archivos correspondientes que validen la información proporcionada (cédula o título).</li><br>
							<li><strong>Materias a impartir.</strong> Es el conjunto de materia que el docente desea impartir de acuerdo a su perfil, hay un tope de 7 materias por docente, el sistema le permite consultar las materias que impartió el semestre anterior.</li><br>
							<li><strong>Trabajo fuera de UABC.</strong> Esta información es para aquellos docentes que tienen un trabajo adicional al de UABC deben llenar los datos de la empresa, puesto, fecha de ingreso y antigüedad.</li><br>
            				<a  href="#arribaReg"><img src="../imagenes/arriba.png">Ir arriba</a>
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