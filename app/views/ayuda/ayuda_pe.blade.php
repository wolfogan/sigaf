<!DOCTYPE html >
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>Ayuda</title>
    <link rel="stylesheet" href="../css/estilotab_manual.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="../css/demotab.css" type="text/css" media="screen" />
    <script type="application/javascript" src="../js/jquery.min.js"></script>
</head>
<body>
	<div id="modal">
		<div class="modal-content">
        	<div id="salir"><a href="<?=URL::to('planestudio/registro')?>"><img src="../imagenes/salir.png"></a></div>
           	  <h1><span>Manual de usuario</span> <br>
       	      PLAN DE ESTUDIOS</h1>
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
                	<div class="content-1">
						<h2>Catálogos</h2>
                        <p>
                        Antes de iniciar con el registro de las unidades de aprendizaje es necesario llenar los catálogos que alimentarán las pantallas principales del subsistema plan de estudios, dichos catálogos se pueden identificar mediante la opción del menú principal plan de estudios, seleccione el submenú catálogos.<br><br>
Otra opción para ubicar los catálogos es por medio de los botones <img src="../imagenes/agregarCatalogo.png"> ubicados dentro de la pantalla de registro (Figura 1-PE), al hacer click en una de estas opciones se abrirá una ventana donde deberán introducirse los datos requeridos.
						</p>
     <p>El orden de llenado de los catálogos es de la siguiente forma:
         <ul class="lista-catalogos">
         <a name="arriba"></a>
            <li><a href="#campus">1. Campus</li>
            <li> <a href="#unidadacad">2. Unidad académica</a></li>
            <li> <a href="#nivel">3. Nivel programa</a></li>
            <li> <a href="#especialidad">4. Especialidad</a></li>
            <li><a href="#tipoprog"> 5. Tipo programa</a></li>
            <li> <a href="#carreras">6. Carreras</a></li>
            <li> <a href="#etapa">7. Etapa</a></li>
            <li> <a href="#tipoUA">8. Tipo</a></li>
            <li> <a href="#seriacion">9. Tipo de seriación</a></li>
            <li> <a href="#coordinacion">10. Coordinación</a></li>
            <li> <a href="#plan">11. Plan</a></li>
        </ul>
    </p>

	<ul class="lista-num" id="campus">
	<h2>Campus</h2>
	<center><img src="imgs/"></center>
		
 	<a href="#arriba"><img src="../imagenes/arriba.png">Ir arriba</a>.
	</ul>
    
    

	<ul class="lista-num" id="unidadacad">
	<h2>Unidad Académica</h2>
	<center><img src="../imagenes/catalogos/campus.png"></center>
		<li>1. Ingresar la descripción corta de la Unidad Académica la cual corresponde a las iniciales del nombre de la unidad.</li>
		<li>2. Ingresar la descripción larga de la Unidad Académica representada por el nombre de la unidad. </li>
		<li>3. Seleccionar el campus al que pertenece la unidad académica.</li>
		<li>4. Al terminar su captura, presione el botón de guardar.</li>
            <ul class="lista-vineta">
            <li>• Si desea agregar más de un registro para este catálogo, lo puede realizar una vez que haya guardado el registro capturado.</li>
            <li>• Para salir de la pantalla, haga click en el botón salir.</li>
            <li>• Para eliminar uno de los registros vaya al menú plan de estudios y seleccione administrador de catálogos.</li>
            </ul>
 	<a href="#arriba"><img src="../imagenes/arriba.png">Ir arriba</a>.
	</ul>


	<ul class="lista-num" id="nivel">
        <h2>Nivel programa</h2>
        <center><img ></center>
        <a href="#arriba"><img src="../imagenes/arriba.png">Ir arriba</a>.
	</ul>

	<ul class="lista-num" id="especialidad">
        <h2>Especialidad</h2>
        <center><img ></center>
        <a href="#arriba"><img src="../imagenes/arriba.png">Ir arriba</a>.
	</ul>

	<ul class="lista-num" id="tipoprog">
        <h2>Tipo programa</h2>
        <center><img ></center>
        <a href="#arriba"><img src="../imagenes/arriba.png">Ir arriba</a>.
	</ul>

	<ul class="lista-num" id="carreras">
	<h2>Carreras</h2>
	<center><img src="../imagenes/catalogos/catcarrera.jpg"></center>
        <li>1. Ingresar el nombre de la carrera.</li>
        <li>2. La opción Activado indica el estatus de la carrera, aparecerá activa por default.</li>
        <li>3. Seleccionar el nivel al cual pertenece la carrera.</li>
        <li>4. Seleccionar la especialidad asociada a la carrera (esta opción solo aplica para programas  de posgrado).</li>
        <li>5. Seleccionar el coordinador encargado de la carrera que se está registrando.</li>
        <ul class="lista-vineta">
        <li>• Al terminar su captura, presione el botón de guardar.</li>
        <li>• Si desea agregar más de un registro para este catálogo, lo puede realizar una vez que haya guardado el registro capturado.</li>
        <li>• Para salir de la pantalla, haga click en el botón salir.</li>
        <li>• Para eliminar uno de los registros vaya al menú plan de estudios y seleccione administrador de catálogos.</li>
        </ul>
	<a href="#arriba"><img src="../imagenes/arriba.png">Ir arriba</a>.
	</ul>

	<ul class="lista-num" id="etapa">
	<h2>Etapa</h2>
	<center><img src="../imagenes/catalogos/catetapa.png" ></center>
        <p>La etapa es la forma en la que se agrupan las unidades de aprendizaje, actualmente existen 3 bloques: etapa básica, etapa disciplinaria y etapa terminal.</p><br>
    <li>1. Ingresar el nombre de la etapa que se desea registrar.</li>
        <ul class="lista-vineta">
        <li>• Al terminar su captura, presione el botón de guardar.</li>
        <li>• Si desea agregar más de un registro para este catálogo, lo puede realizar una vez que haya guardado el registro capturado.</li>
        <li>• Para salir de la pantalla, haga click en el botón salir.</li>
        <li>• Para eliminar uno de los registros vaya al menú plan de estudios y seleccione administrador de catálogos.</li></ul>
	<a href="#arriba"><img src="../imagenes/arriba.png">Ir arriba</a>.
    </ul>

	<ul class="lista-num" id="tipoUA">
        <h2>Tipo</h2>
        <center><img src="../imagenes/catalogos/cattipoUA.png" ></center>
         <a href="#arriba">Ir arriba</a>.
	</ul>

	<ul class="lista-num" id="seriacion">
        <h2>Tipo de seriación</h2>
        <center><img src="../imagenes/catalogos/catseriacion.png" ></center>
        <p>La seriación corresponde a la relación o dependencia que tienen algunas materias con otras, en la figura n se darán de alta los diferentes tipos de seriación. Ejemplos de seriación: obligada y sugerida.</p>
        <li>1. Ingresar el nombre de la seriación.</li>
<ul class="lista-vineta"><li>• Al terminar su captura, presione el botón de guardar.</li>
<li>• Si desea agregar más de un registro para este catálogo, lo puede realizar una vez que haya guardado el registro capturado.</li>
<li>• Para salir de la pantalla, haga click en el botón salir.</li>
<li>• Para eliminar uno de los registros vaya al menú plan de estudios y seleccione administrador de catálogos.</li>
</ul>
         <a href="#arriba"><img src="../imagenes/arriba.png">Ir arriba</a>.
	</ul>

	<ul class="lista-num" id="coordinacion">
        <h2>Coordinación</h2>
        <center><img src="../imagenes/catalogos/catcoordinacion.png" ></center>
        <ul class="lista-num">
        <li>1. Ingresar el nombre de la coordinación.</li>
		<li>2. Seleccionar el programa educativo (carrera) a la que pertenece la coordinación que desea registrar.</li>
		<ul class="lista-vineta">
        <li>• Al terminar su captura, presione el botón de guardar.</li>
		<li>• Si desea agregar más de un registro para este catálogo, lo puede realizar una vez que haya guardado el registro capturado.</li>
		<li>• Para salir de la pantalla, haga click en el botón salir.</li>
		<li>• Para eliminar uno de los registros vaya al menú plan de estudios y seleccione administrador de catálogos.</li>
        </ul>
	</ul>
        <a href="#arriba"><img src="../imagenes/arriba.png">Ir arriba</a>.
	</ul>

	<ul class="lista-num" id="plan">
        <h2>Plan</h2>
        <center><img src="../imagenes/catalogos/catplan.png" ></center>
       
        <li>1. Ingresar el número con el cual se identificará al plan de estudio siguiendo la nomenclatura año-semestre. Este campo solo acepta datos numéricos.</li>
		<li>2. Ingresar la descripción o nombre mediante el cual se identificara al plan de estudios.</li>
		<li>3. Seleccionar el nivel (licenciatura, posgrado, técnico) al que pertenecerá el plan de estudios.</li>
        <li>4. Seleccionar las carreras (o programas educativos) a las cuales se asignará el plan de estudios.</li>
        <li>5. Introducir la cantidad de créditos prácticas asignados al plan de estudios. Introducir solo datos numéricos.</li>
        <li>6. Ingresar o seleccionar la fecha de inicio del plan de estudio siguiendo la nomenclatura especificada.</li>
        <li>7. Ingresar o seleccionar la fecha de fin del plan de estudio siguiendo la nomenclatura especificada.</li>
        <ul class="lista-vineta">
        <li>• Al terminar su captura, presione el botón de guardar.</li>
        <li>• Si desea agregar más de un registro para este catálogo, lo puede realizar una vez que haya guardado el registro capturado.</li>
        <li>• Para salir de la pantalla, haga click en salir.</li>
        <li>• Para eliminar uno de los registros vaya al menú plan de estudios y seleccione administrador de catálogos.</li>
		</ul>
        <a href="#arriba"><img src="../imagenes/arriba.png">Ir arriba</a>.
	</ul>
    </div>
	
    <div class="content-2">
    <a name="arribaReg"></a>
	<h2>Registro</h2>
    <center><img src="../imagenes/registro/registroUA.png"></center><br>
	<p>Código de colores</p>
    <center><img src="../imagenes/registro/codcolores.png"></center><br>
	<p>Pasos para registrar una Unidad de Aprendizaje:</p> <br>
         
         <table id="pasos" width="900" align="center">
          <tr>
            <td><strong>Pasos</strong></td>
            <td><strong>Imagen</strong></td>
            <td><strong>Descripción</strong></td>
          </tr>
          <tr>
          <td>1</td>
            <td><img src="../imagenes/registro/p1.png"></td>
            <td>Aqui va lo de la descripcion</td>
          </tr>
          <tr>
            <td>2</td>
            <td><img src="../imagenes/registro/p2.png"></td>
            <td><strong>Unidad:</strong><br>
				El campo de Unidad obtiene el valor de la unidad en la que se registró el usuario que se encuentra en sesión.</td>
          </tr>
          <tr>
            <td>3</td>
            <td><img src="../imagenes/registro/p3.png"></td>
            <td><strong>U. Académica:</strong><br>
				El campo de Unidad Académica obtiene el valor de la unidad académica a la que pertenece el usuario que se encuentra en sesión. </td>
          </tr>
          <tr>
            <td>4</td>
            <td><img src="../imagenes/registro/p4.png"></td>
            <td><strong>Carrera:</strong> <br>
				Seleccionar una o más carreras en las que se impartirá la Unidad de Aprendizaje que se está registrando (una Unidad de Aprendizaje puede ser impartida en más de una carrera).</td>
          </tr>
          <tr>
            <td>5</td>
            <td><img src="../imagenes/registro/p5.png"></td>
            <td><strong>Clave:</strong><br>
				Insertar la Clave de la Unidad de Aprendizaje, al pasar el cursor al siguiente control se validarán los datos introducidos,  en caso de que la clave ya exista se mostrará el siguiente mensaje:<img src="imgs/registro/msgClave.png"><br>
Si no tiene la clave, active la casilla de verificación Generar clave la cual le generará una clave provisional que después podrá ser actualizada por la real. Solo se pueden introducir números.
            </td>
          </tr>
          <tr>
            <td>6</td>
            <td><img src="../imagenes/registro/p6.png"></td>
            <td><strong>Materia: </strong><br>
				Insertar el nombre de la Unidad de Aprendizaje, a medida que vaya tecleando se le autocompletará el campo como referencia de que el nombre de la materia ya existe, el sistema validará su inserción, si ya existe el nombre tecleado, deberá introducir otro nombre.
            </td>
          </tr>
          <tr>
            <td>7</td>
            <td><img src="../imagenes/registro/p7.png"></td>
            <td><strong>Etapa:</strong><br>
				Seleccionar la etapa a la cual pertenece la Unidad de Aprendizaje.</td>
          </tr>
          <tr>
            <td>8</td>
            <td><img src="../imagenes/registro/p8.png"></td>
            <td><strong>Tipo:</strong><br>
				Seleccionar el tipo de Unidad de Aprendizaje (se clasifican como Obligatorias u Optativas).</td>
          </tr>
          <tr>
            <td>9</td>
            <td><img src="../imagenes/registro/p9.png"></td>
            <td><strong>*Sem:</strong><br>
				Insertar el semestre al cual pertenecerá la Unidad de Aprendizaje, este campo puede quedar vacío. Solo se aceptan números.</td>
          </tr>
          <tr>
            <td>10</td>
            <td><img src="../imagenes/registro/p10.png"></td>
            <td><strong>Seriación:</strong><br>
				El campo de Seriación tiene el valor de SIN SERIACION por default y por consecuencia los siguientes 2 controles inactivos:<br>
			<img src="../imagenes/registro/serdeshab.png"> <br>
				Si desea establecer una seriación cambie este valor seleccionando la opción deseada.</td>
          </tr>
          <tr>
            <td>11</td>
            <td><img src="../imagenes/registro/p11.png"></td>
            <td><strong>Clave:</strong><br>
				Insertar la Clave de la Unidad de Aprendizaje con la que se desea establecer una seriación, las claves que se emplean para establecer una serie deben estar registradas, una vez que haya introducido la clave correspondiente se le mostrará el nombre de la Unidad de Aprendizaje asociado a dicha clave. Solo se pueden introducir números.</td>
          </tr>
          <tr>
            <td>12</td>
            <td><img src="../imagenes/registro/p12.png"></td>
            <td>Aqui va lo de la descripcion</td>
          </tr>
          <tr>
            <td>13</td>
            <td><img src="../imagenes/registro/p13.png"></td>
            <td><strong>HC:</strong> <br>
				Insertar las Horas Clase (HC) que tendrá la Unidad de Aprendizaje, solo se aceptan números.</td>
          </tr>
          <tr>
            <td>14</td>
            <td><img src="../imagenes/registro/p14.png"></td>
            <td><strong>*HL:</strong><br>
				Insertar las Horas Laboratorio (HL) que tendrá la Unidad de Aprendizaje, solo se aceptan números.</td>
          </tr>
          <tr>
            <td>15</td>
            <td><img src="../imagenes/registro/p15.png"></td>
            <td><strong>HT:</strong><br>
				Insertar las Horas Taller (HT) que tendrá la Unidad de Aprendizaje, solo se aceptan números.</td>
          </tr>
          <tr>
            <td>16</td>
            <td><img src="../imagenes/registro/p16.png"></td>
            <td><strong>*HE:</strong> <br>
				Insertar las Horas Extra Clase (HE) que tendrá la Unidad de Aprendizaje, solo se aceptan números, si no tiene asignadas estas horas, el campo puede quedar vacío.</td>
          </tr>
          <tr>
            <td>17</td>
            <td><img src="../imagenes/registro/p17.png"></td>
            <td><strong>*HPC:</strong><br>
				Insertar las Horas Prácticas de Campo (HPC) que tendrá la Unidad de Aprendizaje, solo se aceptan números, si no tiene asignadas estas horas, el campo puede quedar vacío.</td>
          </tr>
          <tr>
            <td>18</td>
            <td><img src="../imagenes/registro/p18.png"></td>
            <td><strong>*HCL: </strong><br>
				Insertar las Horas Clínicas (HCL) que tendrá la Unidad de Aprendizaje, solo se aceptan números, si no tiene asignadas estas horas, el campo puede quedar vacío.</td>
          </tr>
          <tr>
            <td>19</td>
            <td><img src="../imagenes/registro/p19.png"></td>
            <td><strong>Créditos:</strong> <br>
				El valor de los créditos se calculará automáticamente a partir de las horas asignadas.</td>
          </tr><tr>
            <td>20</td>
            <td><img src="../imagenes/registro/p20.png"></td>
            <td><strong>*Observaciones:</strong> <br>
				Insertar en este campo alguna situación o dato importante asociado a la Unidad de Aprendizaje, si no existe ninguna observación puede quedar vacío.</td>
          </tr>
          <td></td>
            <td><img src="../imagenes/registro/btn1.png"></td>
            <td>Después de que haya llenado los campos necesarios para registrar la Unidad de Aprendizaje, haga click en el botón de guardar.                   </td>
          </tr>
          <td></td>
            <td><img src="../imagenes/registro/btn2.png"></td>
            <td>Si desea limpiar los campos para realizar otra inserción, haga click en el botón de limpiar. Cada vez que guarde un registro los campos se limpian automáticamente.</td>
          </tr>
          <td></td>
            <td><img src="../imagenes/registro/btn4.png"></td>
            <td>Para actualizar los datos asociados a una Unidad de Aprendizaje, realice la modificación de los valores y pulse el botón Actualizar.</td>
          </tr>
          <td></td>
            <td><img src="../imagenes/registro/btn5.png"></td>
            <td>Si desea cancelar una acción, pulse el botón cancelar.</td>
          </tr>
        </table>
              
	<a  href="#arribaReg"><img src="../imagenes/arriba.png">Ir arriba</a>.
    
	</div>
		<div class="content-3">
			<h2>Consulta</h2>
            	<ul><li>1.	Para realizar una consulta, introduzca los datos en los campos de los cuales requiera extraer información, el campo de No. Plan es obligatorio introducirlo.</li>
                <li>2.	Haga click en el botón de buscar.</li></ul>
		</div>
		<div class="content-4">
			<h2>Modificación</h2>
          	<center><img src="../imagenes/consulta/consultaMat.png"></center>
 			<a href="#arriba">Ir arriba</a>.
        </div>
        
        <div class="content-5">
			<h2>Eliminación</h2>
            	<p></p>
		</div>
                    
		<div class="content-6">
			<h2>Preguntas frecuentes</h2>
            <p></p>
		</div>
                    
       	 <div class="content-7">
		 	<h2>Glosario</h2>
           	<p></p>
			</div>
		 </div>
			</section>
	</div>
</div>
		<div class="overlay"></div>
	</div>
</body>
</html>