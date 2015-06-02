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
    
          <div id="salir"><a href="<?=URL::to('main')?>"><img src="../imagenes/salir.png"></a></div>
              <h1><span>Manual de usuario</span> <br>
              PLAN DE ESTUDIOS</h1>
            <div id="back"><a href="javascript:window.history.go(-1);"><img src="../imagenes/back.png"></a></div>   
               <div class="container">
         
                 <section class="tabs">
                <!--opciones que se le presentan al usuario para que consulte-->
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
          
                
        <!--div donde se inserta el contenido para cada una de las opciones-->
        <div class="content">
                
<!-----------------------------Tab para el registro, eliminacion y modificacion de catálogos-------------------------------->
    <div class="content-1">
      <h2>Registro, modificación y eliminación de Catálogos</h2>
            <!--<button type="button" class="botonCatalogo" id="regCatal"/><a href="#registro">Registro</a></button>
            <button type="button" class="botonCatalogo" id="modifCatal"/><a href="#modifCat">Modificación y eliminación</a></button>-->
         
       <!-- <a name="registro"><h3>Registro</h3></a> -->          
        <br> <br><p>Antes de iniciar con el registro de las unidades de aprendizaje es necesario llenar los catálogos que alimentarán las pantallas principales del subsistema plan de estudios, dichos catálogos se pueden identificar mediante la opción del menú principal plan de estudios, seleccione el submenú catálogos.<br><br>
Otra opción para ubicar los catálogos es por medio de los botones <img src="../imagenes/agregarCatalogo.png"> ubicados dentro de la pantalla de registro, al hacer click en una de estas opciones se abrirá una ventana donde deberán introducirse los datos requeridos.</p>
     
      <p>El orden de llenado de los catálogos es de la siguiente forma:
         <ul class="lista-catalogos">
         <a name="arriba"></a>
         <li><a href="#pais">1. Pais</li>
         <li><a href="#estado">2. Estado</li>
         <li><a href="#ciudad">3. Ciudad</li>
         <li><a href="#campus">4. Campus</a></li>
         <li><a href="#seriacion">5. Tipo de seriación</a></li>
         <li><a href="#unidadacad">6. Unidad académica</a></li>
         <li><a href="#caracter">7. Carácter de la UA</a></li>
         <li><a href="#etapa">8. Etapa</a></li>
         <li><a href="#nivel">9. Nivel programa</a></li>
         <li><a href="#carreras">10. Carreras</a></li>
         <li><a href="#coordinacion">11. Coordinación</a></li>
         <li><a href="#plan">12. Plan</a></li>
         </ul>
      </p><br>


     
         
<!--contenido del catálogo de País-->
  <ul class="lista-num" id="pais">
  <h2>País</h2><br>
     <center><img src="../imagenes/catalogos/pais.png"></center>
   <ul class="lista-num">
      <li> 1.  Para utilizar un catálogo es necesario realizar una búsqueda de dicho catálogo, selecciónelo y presione el botón de buscar, en la parte inferior de la ventana se despliega una tabla con los campos correspondientes.</li>
      <li>2. Si desea <strong>agregar</strong> un nuevo registro presione el botón de agregar, esta funcionalidad abrirá una ventana (como se muestra en la siguiente figura) donde podrá dar de alta el nuevo registro, introduzca los datos y presione el botón de guardar.<br><br>
    <center><img src="../imagenes/catalogos/agregarPais.png"></center></li></ul><br>
    <ul class="lista-vineta">
      <li>• Si el registro ya existe y desea <strong>modificarlo</strong>, de doble click sobre el registro deseado y edite los datos, presione el boton del teclado enter</li>
      <li>• Para <strong>eliminar</strong> el registro presione el botón de eliminar ubicado del lado derecho del registro con un signo de "-".</li>
      <li>• Si desea <strong>consultar</strong> dentro del catálogo, introduzca la información dentro del cuadro de texto llamado search.</li>
    </ul>
  </ul>
    <a href="#arriba"><img src="../imagenes/arriba.png">Ir arriba</a>
    
    
<!--contenido del catálogo de Estado-->
  <ul class="lista-num" id="estado">
  <h2>Estado</h2><br>
    <center><img src="../imagenes/catalogos/estado.png"></center>
    <ul class="lista-num">
   <li> 1.  Seleccione el catálogo y presione el botón de buscar, en la parte inferior de la ventana se despliega una tabla con los campos correspondientes.</li>
    <li>2. Si desea <strong>agregar</strong> un nuevo registro presione el botón de agregar, esta funcionalidad abrirá una ventana (como se muestra en la siguiente figura) donde podrá dar de alta el nuevo registro, introduzca el nombre del estado y seleccione el pais al cual corresponde, presione el botón de guardar.<br><br>
   <center><img src="../imagenes/catalogos/agregarEstado.png"></center> </li></ul><br>
    <ul class="lista-vineta">
      <li>• Si el registro ya existe y desea <strong>modificarlo</strong>, de doble click sobre el registro deseado y edite los datos, presione el boton del teclado enter.</li>
    <li>• Para <strong>eliminar</strong> el registro presione el botón de eliminar ubicado del lado derecho del registro con un signo de "-".</li>
    <li>• Si desea <strong>consultar</strong> dentro del catálogo, introduzca la información dentro del cuadro de texto llamado search.</li>
    </ul>
  </ul>
    <a href="#arriba"><img src="../imagenes/arriba.png">Ir arriba</a>
    
 
<!--contenido del catálogo de Ciudad-->
  <ul class="lista-num" id="ciudad">
  <h2>Ciudad</h2><br>
      <center><img src="../imagenes/catalogos/ciudad.png"></center>
       <ul class="lista-num">
   <li> 1.  Seleccione el catálogo y presione el botón de buscar, en la parte inferior de la ventana se despliega una tabla con los campos correspondientes.</li>
    <li>2. Si desea <strong>agregar</strong> un nuevo registro presione el botón de agregar, esta funcionalidad abrirá una ventana (como se muestra en la siguiente figura) donde podrá dar de alta el nuevo registro, introduzca el nombre de la ciudad y seleccione el estado al cual corresponde, presione el botón de guardar.<br><br>
    <center><img src="../imagenes/catalogos/agregarCiudad.png"></center>
    </li></ul>
   <ul class="lista-vineta">
      <li>• Si el registro ya existe y desea <strong>modificarlo</strong>, de doble click sobre el registro deseado y edite los datos, presione el boton del teclado enter.</li>
    <li>• Para <strong>eliminar</strong> el registro presione el botón de eliminar ubicado del lado derecho del registro con un signo de "-".</li>
    <li>• Si desea <strong>consultar</strong> dentro del catálogo, introduzca la información dentro del cuadro de texto llamado search.</li>
    </ul><br>
       
  </ul>
    <a href="#arriba"><img src="../imagenes/arriba.png">Ir arriba</a>
        
<!--contenido del catálogo de campus-->
  <ul class="lista-num" id="campus">
  <h2>Campus</h2>
    <center><img src="../imagenes/catalogos/campus.png"></center>
    <ul class="lista-num">
   <li> 1.  Seleccione el catálogo y presione el botón de buscar, en la parte inferior de la ventana se despliega una tabla con los campos correspondientes.</li>
    <li>2. Si desea <strong>agregar</strong> un nuevo registro presione el botón de agregar, esta funcionalidad abrirá una ventana (como se muestra en la siguiente figura) donde podrá dar de alta el nuevo registro, introduzca el nombre del campus, la dirección y seleccione la ciudad a la cual corresponde, presione el botón de guardar.<br><br>
   <center><img src="../imagenes/catalogos/agregarCampus.png"></center> </li></ul><br>
   <ul class="lista-vineta">
      <li>• Si el registro ya existe y desea <strong>modificarlo</strong>, de doble click sobre el registro deseado y edite los datos, presione el boton del teclado enter.</li>
    <li>• Para <strong>eliminar</strong> el registro presione el botón de eliminar ubicado del lado derecho del registro con un signo de "-".</li>
    <li>• Si desea <strong>consultar</strong> dentro del catálogo, introduzca la información dentro del cuadro de texto llamado search.</li>
    </ul><br>
  </ul>
    <a href="#arriba"><img src="../imagenes/arriba.png">Ir arriba</a>
   

<!--contenido del catálogo tipo de seriación-->
  <ul class="lista-num" id="seriacion">
        <h2>Tipo de seriación</h2>
        <center><img src="../imagenes/catalogos/seriacion.png" ></center>
        <p>La seriación corresponde a la relación o dependencia que tienen algunas materias con otras, la figura anterior representa el catálogo donde se darán de alta los diferentes tipos de seriación. Ejemplos de seriación: obligada y sugerida.</p>
        <ul class="lista-num">
   <li> 1.  Seleccione el catálogo y presione el botón de buscar, en la parte inferior de la ventana se despliega una tabla con los campos correspondientes.</li>
    <li>2. Si desea <strong>agregar</strong> un nuevo registro presione el botón de agregar, esta funcionalidad abrirá una ventana (como se muestra en la siguiente figura) donde podrá dar de alta el nuevo registro, introduzca el nombre del tipo de seriación, presione el botón de guardar.<br><br>
   <center><img src="../imagenes/catalogos/agregarSeriacion.png"></center> </li></ul><br>
   <ul class="lista-vineta">
      <li>• Si el registro ya existe y desea <strong>modificarlo</strong>, de doble click sobre el registro deseado y edite los datos, presione el boton del teclado enter.</li>
    <li>• Para <strong>eliminar</strong> el registro presione el botón de eliminar ubicado del lado derecho del registro con un signo de "-".</li>
    <li>• Si desea <strong>consultar</strong> dentro del catálogo, introduzca la información dentro del cuadro de texto llamado search.</li>
    </ul><br>  
  </ul>
 <a href="#arriba"><img src="../imagenes/arriba.png">Ir arriba</a>
 
 

<!--contenido del catálogo unidad academica-->
   <ul class="lista-num" id="unidadacad">
  <h2>Unidad Académica</h2>
  <center><img src="../imagenes/catalogos/uacademica.png"></center>
    <ul class="lista-num">
   <li> 1.  Seleccione el catálogo y presione el botón de buscar, en la parte inferior de la ventana se despliega una tabla con los campos correspondientes.</li>
    <li>2. Si desea <strong>agregar</strong> un nuevo registro presione el botón de agregar, esta funcionalidad abrirá una ventana (como se muestra en la siguiente figura) donde podrá dar de alta el nuevo registro, introduzca las siglas de la unidad académica, descripción (nombre de la unidad académica) y seleccione el campus al cual corresponde, presione el botón de guardar.<br><br>
   <center><img src="../imagenes/catalogos/agregarUacademica.png"></center> </li></ul><br>
        <ul class="lista-vineta">
      <li>• Si el registro ya existe y desea <strong>modificarlo</strong>, de doble click sobre el registro deseado y edite los datos, presione el boton del teclado enter.</li>
    <li>• Para <strong>eliminar</strong> el registro presione el botón de eliminar ubicado del lado derecho del registro con un signo de "-".</li>
    <li>• Si desea <strong>consultar</strong> dentro del catálogo, introduzca la información dentro del cuadro de texto llamado search.</li>
    </ul><br>  
  </ul>
    <a href="#arriba"><img src="../imagenes/arriba.png">Ir arriba.</a>


<!--contenido del catálogo de caracter-->
  <ul class="lista-num" id="caracter">
        <h2>Carácter de UA</h2>
        <center><img src="../imagenes/catalogos/caracter.png" ></center>
        <ul class="lista-num">
   <li> 1.  Seleccione el catálogo y presione el botón de buscar, en la parte inferior de la ventana se despliega una tabla con los campos correspondientes.</li>
    <li>2. Si desea <strong>agregar</strong> un nuevo registro presione el botón de agregar, esta funcionalidad abrirá una ventana (como se muestra en la siguiente figura) donde podrá dar de alta el nuevo registro, introduzca el nombre del nuevo carácter, presione el botón de guardar.<br><br>
   <center><img src="../imagenes/catalogos/agregarCaracter.png"></center> </li></ul><br>
    <ul class="lista-vineta">
      <li>• Si el registro ya existe y desea <strong>modificarlo</strong>, de doble click sobre el registro deseado y edite los datos, presione el boton del teclado enter.</li>
    <li>• Para <strong>eliminar</strong> el registro presione el botón de eliminar ubicado del lado derecho del registro con un signo de "-".</li>
    <li>• Si desea <strong>consultar</strong> dentro del catálogo, introduzca la información dentro del cuadro de texto llamado search.</li>
    </ul>
  </ul>
    <a href="#arriba"><img src="../imagenes/arriba.png">Ir arriba</a>


<!--contenido del catálogo etapa-->
  <ul class="lista-num" id="etapa">
  <h2>Etapa</h2>
  <center><img src="../imagenes/catalogos/etapa.png" ></center>
    <p>La etapa es la forma en la que se agrupan las unidades de aprendizaje, actualmente existen 3 bloques: etapa básica, etapa disciplinaria y etapa terminal.</p><br>
       <ul class="lista-num">
   <li> 1.  Seleccione el catálogo y presione el botón de buscar, en la parte inferior de la ventana se despliega una tabla con los campos correspondientes.</li>
    <li>2. Si desea <strong>agregar</strong> un nuevo registro presione el botón de agregar, esta funcionalidad abrirá una ventana (como se muestra en la siguiente figura) donde podrá dar de alta el nuevo registro, introduzca el nombre de la nueva etapa, presione el botón de guardar.<br><br>
   <center><img src="../imagenes/catalogos/agregarEtapa.png"></center> </li></ul><br>
      <ul class="lista-vineta">
      <li>• Si el registro ya existe y desea <strong>modificarlo</strong>, de doble click sobre el registro deseado y edite los datos, presione el boton del teclado enter.</li>
    <li>• Para <strong>eliminar</strong> el registro presione el botón de eliminar ubicado del lado derecho del registro con un signo de "-".</li>
    <li>• Si desea <strong>consultar</strong> dentro del catálogo, introduzca la información dentro del cuadro de texto llamado search.</li>
    </ul>  
  </ul>
    <a href="#arriba"><img src="../imagenes/arriba.png">Ir arriba</a>
    

<!--contenido del catálogo de nivel programa-->
  <ul class="lista-num" id="nivel">
        <h2>Nivel programa</h2>
        <center><img src="../imagenes/catalogos/nvprograma.png" ></center>
        <ul class="lista-num">
   <li> 1.  Seleccione el catálogo y presione el botón de buscar, en la parte inferior de la ventana se despliega una tabla con los campos correspondientes.</li>
    <li>2. Si desea <strong>agregar</strong> un nuevo registro presione el botón de agregar, esta funcionalidad abrirá una ventana (como se muestra en la siguiente figura) donde podrá dar de alta el nuevo registro, introduzca el nombre del nivel programa, presione el botón de guardar.<br><br>
   <center><img src="../imagenes/catalogos/agregarNvprograma.png"></center> </li></ul><br>
   <ul class="lista-vineta">
      <li>• Si el registro ya existe y desea <strong>modificarlo</strong>, de doble click sobre el registro deseado y edite los datos, presione el boton del teclado enter.</li>
    <li>• Para <strong>eliminar</strong> el registro presione el botón de eliminar ubicado del lado derecho del registro con un signo de "-".</li>
    <li>• Si desea <strong>consultar</strong> dentro del catálogo, introduzca la información dentro del cuadro de texto llamado search.</li>
    </ul>
    </ul>
    <a href="#arriba"><img src="../imagenes/arriba.png">Ir arriba.</a>
    
    
<!--contenido del catálogo carreras-->
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
  </ul>
    <a href="#arriba"><img src="../imagenes/arriba.png">Ir arriba</a>



<!--contenido del catálogo coordinación-->
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
        <a href="#arriba"><img src="../imagenes/arriba.png">Ir arriba</a>
  </ul>
    
    
<!--contenido del catalogo No. plan-->
  <ul class="lista-num" id="plan">
        <h2>Plan</h2>
        <center><img src="../imagenes/catalogos/catplan.png" ></center>
        <li>1. Ingresar el número con el cual se identificará al plan de estudio siguiendo la nomenclatura año-semestre. Este control solo acepta datos numéricos.</li>
    <li>2. Ingresar la descripción o nombre mediante el cual se identificá al plan de estudios.</li>
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
        <a href="#arriba"><img src="../imagenes/arriba.png">Ir arriba</a>
  </ul>
    <!--<a name="modifCat"><h3> Modificación y eliminación</h3></a> -->    
    </div>
  
    
    
<!--------------------------------------Contenido de registro de UA---------------------------------->
    <div class="content-2">
    <a name="arribaReg"></a>
  <h2>Registro de UA</h2>
  
  <p> El plan de estudios es el conjunto de actividades de enseñanza-aprendizaje que comprende la descripción general de los contenidos de un programa de unidad de aprendizaje (conjunto de materias de mapa curricular). A continuación se muestran las funcionalidades que involucra este subsistema.</p>
  <br><center><img src="../imagenes/registro/registroUA.png"></center><br>
  <p> Como se muestra en la Figura anterior la pantalla principal de plan de estudios está compuesta por las siguientes opciones:</p>



<p>Contenido de la pantalla de Plan de Estudios<br>
  <p><strong>1. Opciones del menú principal</strong><br>
    El menú está compuesto por las funcionalidades principales que conforman el sistema SIGAF, en cuanto al módulo de Plan de Estudios, esta opción del menú contiene un submenú formado con los siguientes valores:</p>
    <ul class="lista-vineta">
      <li>• Catálogos.</li>
      <li>• Modificación y eliminación de catálogos.</li>
      <li>• Registro y eliminación de UA.</li>
      <li>• Consulta y modificación de UA.</li>
      <li>• Bitácora de plan de estudios.</li>
      <li>• Menú principal.</li>
    </ul>

    <p><strong>2. Usuario en sesión y fecha del sistema</strong><br>
   Cuando un usuario inicia sesión, en esta parte de la pantalla se indica que usuario es el que está actualmente logueado al sistema.
    La fecha que se muestra en la pantalla se toma de la PC del usuario.</p>
    <p><strong>3. Logout y manual</strong><br>
    La opción de Logout tiene la función de cerrar la sesión del usuario, solo pulse la opción y saldrá del sistema el cual lo enviará a la ventana de inicio de sesión.
    La opción de manual muestra la guía que el usuario requiere para conocer el funcionamiento correcto del subsistema (módulo) en el que se encuentra.</p>
    <p><strong>4. Controles para insertar, modificar y eliminar las UA (Unidades de Aprendizaje).</strong><br>
    Muestra cada uno de los controles que se requieren para que el usuario pueda introducir los datos pertinentes del registro de las unidades de aprendizaje que conforman el plan de estudios. Dichos controles también sirven para que el usuario modifique los datos asociados a una unidad de aprendizaje o la elimine.</p>
    <p><strong>5. Tabla de registros.</strong><br>
    Muestra cada uno de los registros que el usuario ha introducido. Mediante esta tabla se pueden cargar los datos en los controles para realizar modificaciones o eliminaciones, solo necesita dar doble click sobre la fila deseada.</p>
  <br><br>
  <p>En la siguiente tabla se muestra el código de colores empleados durante la inserción de los datos. </p>

  <p><strong>Código de colores</strong></p>
    <center><img src="../imagenes/registro/codcolores.png"></center><br>
   
    <p style="color:red"><strong>NOTA:</strong> <br>- Las unidades de aprendizaje pertenecientes a tronco común se registran solo una vez.<br>
        - Los campos que tienen un asterisco (*) pueden quedar vacíos.</p><br>
    
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
            <td><strong>No. Plan:</strong><br>
            Seleccione el plan, previo a este paso debió haber registrado el plan en el catálogo correspondiente.</td>
          </tr>
          <tr>
            <td>2</td>
            <td><img src="../imagenes/registro/p5.png"></td>
            <td><strong>Clave:</strong><br>
        Insertar la Clave de la Unidad de Aprendizaje, al pasar el cursor al siguiente control se validarán los datos introducidos,  en caso de que la clave ya exista se mostrará el siguiente mensaje:<img src="../imagenes/registro/msgClave.png"><br>Presione el botón ok e inserte una clave valida.
Si no tiene la clave, active la casilla de verificación Generar clave la cual le generará una clave provisional que después podrá ser actualizada por la real. Solo se pueden introducir números.
            </td>
          </tr>
          <tr>
            <td>3</td>
            <td><img src="../imagenes/registro/p6.png"></td>
            <td><strong>Materia: </strong><br>
          Insertar el nombre de la unidad de aprendizaje. Nota: es posible insertar materias en un plan de estudio con el mismo nombre siempre y cuando tengan diferente clave.
            </td>
          </tr>   
          <tr>
            <td>4</td>
            <td><img src="../imagenes/registro/p13.png"></td>
            <td><strong>HC:</strong> <br>
        Insertar las Horas Clase (HC) que tendrá la Unidad de Aprendizaje, solo se aceptan números.</td>
          </tr>
          <tr>
            <td>5</td>
            <td><img src="../imagenes/registro/p14.png"></td>
            <td><strong>*HL:</strong><br>
        Insertar las Horas Laboratorio (HL) que tendrá la Unidad de Aprendizaje, solo se aceptan números.</td>
          </tr>
          <tr>
            <td>6</td>
            <td><img src="../imagenes/registro/p15.png"></td>
            <td><strong>*HT:</strong><br>
        Insertar las Horas Taller (HT) que tendrá la Unidad de Aprendizaje, solo se aceptan números.</td>
          </tr>
          <tr>
            <td>7</td>
            <td><img src="../imagenes/registro/p16.png"></td>
            <td><strong>*HE:</strong> <br>
        Insertar las Horas Extra Clase (HE) que tendrá la Unidad de Aprendizaje, solo se aceptan números, si no tiene asignadas estas horas, el control puede quedar vacío.</td>
          </tr>
          <tr>
            <td>8</td>
            <td><img src="../imagenes/registro/p17.png"></td>
            <td><strong>*HPC:</strong><br>
        Insertar las Horas Prácticas de Campo (HPC) que tendrá la Unidad de Aprendizaje, solo se aceptan números, si no tiene asignadas estas horas, el control puede quedar vacío.</td>
          </tr>
          <tr>
            <td>9</td>
            <td><img src="../imagenes/registro/p18.png"></td>
            <td><strong>*HCL: </strong><br>
        Insertar las Horas Clínicas (HCL) que tendrá la Unidad de Aprendizaje, solo se aceptan números, si no tiene asignadas estas horas, el control puede quedar vacío.</td>
          </tr>
          <tr>
            <td>10</td>
            <td><img src="../imagenes/registro/p19.png"></td>
            <td><strong>Créditos:</strong> <br>
        El valor de los créditos se calculará automáticamente a partir de las horas asignadas.</td>
          </tr>
          <tr>
            <td>11</td>
            <td><img src="../imagenes/registro/p12.png"></td>
            <td><strong>Coordinación:</strong> <br> Seleccionar la coordinación a la que pertenece la unidad de aprendizaje.</td>
          </tr>
          <tr>
            <td>12</td>
            <td><img src="../imagenes/registro/p20.png"></td>
            <td><strong>*Observaciones:</strong> <br>
        Insertar en este control alguna situación o dato importante asociado a la Unidad de Aprendizaje, si no existe ninguna observación puede quedar vacío.</td>
          </tr>
          <td>13</td>
            <td><img src="../imagenes/registro/btn1.png"></td>
            <td>Después de que haya llenado los campos necesarios para registrar la Unidad de Aprendizaje, haga click en el botón de guardar, automáticamente se abre la siguiente ventana:<br>
        <br><img src="../imagenes/registro/modUA.png">
         <ul>
            <li>Seleccionar la carrera (s) a la cual estará asociada la unidad de aprendizaje.</li>
            <li>Seleccionar la etapa a la que pertenece la unidad de aprendizaje.</li>
            <li>Selecciona el tipo en el que se clasifica la unidad de aprendizaje, puede ser obligatoria u optativa.</li>
            <li>Introducir el semestre para el que se sugiere la unidad de aprendizaje, este dato puede quedar vacío. </li>
            <li>Si no hay materias para seriar con la unidad de aprendizaje que se está registrando se procede a dar click en el botón de agregar el cual registra la unidad de aprendizaje en la base de datos con todos los datos asociados. En la tabla inferior de la ventana se muestra el registro capturado.</li>
            <li>En caso de que exista una seriación de click en el texto “SIN SERIACION” como se muestra en la siguiente figura.<br>
             <br><img src="../imagenes/registro/seriacion.png"></li>
             La opción mencionada anteriormente permite al usuario la inserción de la seriación correspondiente, para completar este proceso deberá seleccionar el tipo de seriación e insertar la clave de la materia que desea seriar (el nombre de la materia se genera automáticamente a partir de la clave); hay 2 botones asociados al registro, el botón con el símbolo “-” elimina la seriación y el botón con el símbolo”+” permite insertar al usuario las seriaciones necesarias, en la siguiente figura puede ver la funcionalidad.<br>
             <br><img src="../imagenes/registro/uaAsoc.png"></li>
          </ul>
            </td>
          </tr>
          <td></td>
            <td><img src="../imagenes/registro/btn2.png"></td>
            <td>En la pantalla principal de plan de estudios aparece el botón de limpiar, presione este botón si desea borrar los datos de los controles que ha capturado (esta opción es recomendable usarla antes de presionar el botón de guardar, después de guardado el registro, en caso de haberlo capturado con datos incorrectos podrá modificarlo por medio de una actualización o de ser necesario eliminarlo y volver a capturarlo). Cada vez que guarde un registro los campos se limpian automáticamente.</td>
          </tr>
          <td></td>
            <td><img src="../imagenes/registro/btn4.png"></td>
            <td>Para actualizar los datos asociados a una Unidad de Aprendizaje, realice la modificación de los valores y pulse el botón Actualizar.</td>
          </tr>
          <td></td>
            <td><img src="../imagenes/registro/btn5.png"></td>
            <td>Si desea cancelar una acción, pulse el botón cancelar.</td>
          </tr>
           <td></td>
            <td><img src="../imagenes/casillaplantermin.png"></td>
            <td>Al finalizar la inserción de las Unidades de Aprendizaje pertenecientes a un Plan de Estudios, active la casilla de verificación de plan de estudios terminado, esta enviará un correo electrónico al subdirector notificándole que el proceso ha finalizado.</td>
          </tr>
        </table>
        <br><p>Si cerró sesión en el sistema y desea ingresar más unidades de aprendizaje para el mismo plan, inicie sesión, seleccione el no. del plan y siga los pasos que se le presentaron anteriormente.  </p>
             
  <a  href="#arribaReg"><img src="../imagenes/arriba.png">Ir arriba</a>
  </div>
    
    
<!--------------------------------------Contenido de la consulta de UA---------------------------------->  
    <div class="content-3">
      <h2>Consulta de UA</h2>
            <a name="arribaconsulta"></a>
            <p>Criterios de búsqueda</p><br>
            <center><img  src="../imagenes/consulta/criteriosbusqueda.png"></center>
              <ul class="lista-num">
                  <li>1. Para realizar una consulta, introduzca los datos en los controles por los cuales requiere extraer información, los controles de No. Plan y carrera es obligatorio introducirlos.</li>
                  <li>2. Haga click en el botón de buscar.</li>
                  <ul class="lista-vineta">
                    <li>• Si desea consultar el mapa curricular completo, la casilla de verificación tronco común tiene la funcionalidad de agregar al plan de estudios consultado las materias pertenecientes a tronco común, solo active esta opción y presione el botón de buscar.                                                                 </li>
                    <li>• Para limpiar los controles presione el botón de limpiar.</li></ul></ul><br><br>
      <p>La siguiente figura representa los resultados de la búsqueda la cual se muestra clasificada de acuerdo a las etapas a la que pertenecen las unidades de aprendizaje, en cada etapa dichas UA se ordenan por clave en forma ascendente de izquierda a derecha.<br>
En la parte inferior de la figura se muestran los creditos totales de las unidades de aprendizaje obligatorias, optativas y el total de ambas.</p>
            <center><img  src="../imagenes/consulta/resultadobusq.png"></center> 
            <p>El borde punteado y de color que se presenta en los cuadros hace referencia a la seriación de las UA, las UA que estan seriadas tienen bordes del mismo color esto hace que puedan identificarse con mayor facilidad.</p>
            <a  href="#arribaconsulta"><img src="../imagenes/arriba.png">Ir arriba</a>
    </div>
        
        
<!--------------------------------------Contenido de la modificación de UA---------------------------------->
    <div class="content-4">
      <h2>Modificación de UA</h2>
          <a name="arribamodificacion"></a>
          <p> Existen 3 formas para actualizar los datos de las unidades de aprendizaje:</p>
      <ul class="lista-num">
        <li>1. Desde la pantalla de registro.</li>
        <li>2. Desde la pantalla de consulta y modificación mediante la ventana de modificar.</li>
        <li>3. Al arrastrar las UA para cambiarlas de etapa en la ventana de consulta.</li>
      </ul>
    
      <p>Cualquiera de los controles puede ser modificados.<br><br>
    <strong>Desde la pantalla de registro.</strong><br>
<p><strong>Opción 1:</strong>
    Seleccione en la tabla inferior la unidad de aprendizaje que se desea actualizar, de click sobre el registro deseado y se cargaran los datos correspondientes en los campos mostrados en la parte superior de la pantalla como se muestra en la siguiente figura.</p>
  <center><img src="../imagenes/actualizar/actualizarPE.png"></center><br><br>

<p> Después de actualizar el registro deseado pulse en el botón de actualizar o en su defecto si desea abandonar la operación pulse el botón de cancelar.</p>
 <p> <strong>Opción 2:</strong> En la tabla inferior de la ventana identifique el registro que desea actualizar y pulse el botón de modificar asociado al registro seleccionado (dicho botón se identifica por un lapicito), se abrirá la siguiente ventana.</p>
<center><img src="../imagenes/actualizar/modUA.png"></center>
     
     <p>• Modifique la información correspondiente y pulse el botón de actualizar.</p>

      <p><strong>Opción 3:</strong> <br>
 
     Cuando se registra una unidad de aprendizaje se introducen los datos generales de la materia, se pueden dar situaciones en las que se guarde el registro pero la materia no se asocie a una carrera, etapa, tipo y semestre o en caso de tener seriaciones, en tal situación siga los siguientes pasos:</p>
      <ul class="lista-num">
        <li>• En la tabla inferior de la ventana seleccione el registro que desea modificar, presione el botón actualizar seriación el cual lo enviará a la siguiente ventana:
        <center><img src="../imagenes/actualizar/actUA.png"></center></li>
        <li><strong>Opción 4:</strong>
        Si hay una unidad de aprendizaje registrada y desea añadirle una seriación o a un programa educativo, cambiarla de etapa, cambiar el tipo o semestre, selecciónela con un click y pulse el botón de actualizar seriación que se encuentre en la parte superior de la ventana, se abrirá la ventana mostrada en la figura N.
        </li>

      </ul>
      

      <p>2.  Desde la pantalla de consulta y modificación. </p>
      <p>Después de actualizar pulse el botón de guardar.<br><br>
    <strong>Al arrastrar las UA para cambiarlas de etapa</strong>. Esta es otra opción para realizar una modificación sobre las UA sin embargo esta solo es aplicable para el cambio de etapa, para realizar el procedimiento solo arrastre y suelte el cuadro en la etapa deseada automáticamente se realiza el cambio.</p><br><br>
      <center><img src="../imagenes/consulta/consultaMat.png"></center>
    <a  href="#arribamodificacion"><img src="../imagenes/arriba.png">Ir arriba</a>
      </div>
        
        
<!--------------------------------------Contenido de la eliminación de UA---------------------------------->
        <div class="content-5">
      <h2>Eliminación de UA</h2>
            <a name="arribaeliminacion"></a>
            <p>En la siguiente figura se muestra la pantalla donde se podrá realizar la eliminación de las UA asociadas a las carreras.</p><br><br>
            <center><img src="../imagenes/eliminacion/eliminar.png"></center>
            <p>Hay unidades de aprendizaje asociadas a diferentes carreras, si solo desea eliminar la unidad de alguna de las carreras realice los siguientes pasos:</p><br>
    <ul class="lista-vineta">
      <li>• Identifique la Unidad de Aprendizaje que desea eliminar y selecciónela dando click sobre el registro.</li>
      <li>• Pulse el botón  para eliminar el registro, le aparecerá el siguiente mensaje:</li>
    </ul>
        <center><img src="../imagenes/eliminacion/venta_dialogo.png"></center><br><br>
    
    <p>Si está seguro de eliminar el registro presione el botón OK, de lo contrario cancele la operación presionando el botón Cancel.<br><br>
    Si lo que desea es eliminar la Unidad de Aprendizaje completamente, en la parte superior de la pantalla de registro, a un lado de la clave se activó un botón para que pueda hacer la eliminación, considere que si elimina la unidad de aprendizaje de esta forma, se eliminará por completo de todas las carreras y de la base de datos.</p>
    <a  href="#arribaeliminacion"><img src="../imagenes/arriba.png">Ir arriba</a>
    </div>
              
              
<!--------------------------------------Contenido de las preguntas frecuentes---------------------------------->      
    <div class="content-6">
      <h2>Preguntas frecuentes</h2>
            <a name="arribafaq"></a>
            <ul class="lista-faq">
              <li><a href="#p1">1. ¿Qué es el plan de estudios?</a></li>
        <li><a href="#p2">2. ¿Cómo doy de alta un nuevo plan de estudios?</a></li>
              <li><a href="#p3">3. ¿Cómo funciona el control “carrera” dentro del registro del plan de estudios?</a></li>
        <li>4. ¿Puedo seleccionar un plan de estudios anterior al actual?</li>
        <li><a href="#p5">5. ¿Qué representan los botones con un “+”?</a></li>
        <li><a href="#p6">6. ¿Cómo funciona el control generar clave?</a></li>
        <li><a href="#p7">7. ¿Cómo se realiza el cálculo de los créditos?</a></li>
        <li><a href="#p8">8. ¿Qué acciones debo realizar para continuar registrando el plan de estudios si active la opción plan de estudios terminado y lo guarde?</a></li>
           </ul>
           
           <p><class id="p1">1. R. El plan de estudios es el conjunto de actividades de enseñanza-aprendizaje que comprende la descripción general de los contenidos de un programa de unidad de aprendizaje (conjunto de materias de mapa curricular).</p><br>
           <center><img src="../imagenes/faq/plan.png"></center><br><br>
           <a  href="#arribafaq"><img src="../imagenes/arriba.png">Ir arriba</a><br>
           <p><class id="p2">2. R. Para registrar un nuevo plan de estudio con las UA correspondientes es necesario que registre primero el plan en el catálogo  No. de plan, después de dicho registro podrá ingresar los datos de cada una de las UA que engloban al plan de estudios. A medida que introduzca y guarde una UA se limpiarán los controles para que siga insertando sobre el mismo plan.</p><br>
           <center><img src="../imagenes/faq/faqAgrPlan.png"></center><br><br>
           <a href="#arribafaq"><img src="../imagenes/arriba.png">Ir arriba</a><br><br>
           <p><class id="p3">3. R. Una UA puede impartirse en diferentes carreras, en el control de carrera podrá seleccionar las que sean necesarias para el registro, cuando se modifica una UA en el control de carreras se cargan todas las carreras a las que está asignada la UA, el usuario puede activar o desactivar las carreras según corresponda.</p><br>
           <center><img src="../imagenes/faq/ctrlCarrera.png"></center><br><br>
           <a  href="#arribafaq"><img src="../imagenes/arriba.png">Ir arriba</a><br><br>
           <p><class id="p5">5. R. Los botones con un signo de “+” representan los catálogos, al pulsar este botón se abrirá el catalogo correspondiente, estos también se pueden ubicar dentro del menú de plan de estudios.</p><br>
           <center><img src="../imagenes/faq/boton+.png"></center><br><br>
           <a  href="#arribafaq"><img src="../imagenes/arriba.png">Ir arriba</a><br><br>
           <p><class id="p6">6. R. Hay unidades de aprendizaje que no tienen asociada una clave, a estas se les asigna una provisional la cual puede ser actualizada en cuanto se autorice la clave real, la función que realiza el control de generar clave es que al momento de activarlo autogenera una clave para que el usuario pueda guardar la UA que desea registrar. </p><br>
            <center><img src="../imagenes/faq/generarClave.png"></center><br><br>
            <a  href="#arribafaq"><img src="../imagenes/arriba.png">Ir arriba</a><br><br>
           <p><class id="p7">7. R. El cálculo de los créditos lo realiza el sistema de forma automática tomando en cuenta que una hora clase equivale a 2 créditos y una hora práctica a un crédito.</p>
           <p><class id="p8">8. R. Cuando activa la casilla de verificación plan de estudios terminado se le envía un correo al subdirector donde se le notifica que se terminó de registrar el plan, será este quien autorice para seguir modificando el plan una vez terminado.</p>
           <a  href="#arribafaq"><img src="../imagenes/arriba.png">Ir arriba</a>
        </div>
                    
 
<!--------------------------------------Contenido del glosario---------------------------------->        
         <div class="content-7">
      <h2>Glosario</h2>
            <a name="arribaglosario"></a>
            <ul class="lista-vineta">
              <li><strong>Campus:</strong> es el conjunto de terrenos y edificios que pertenecen a la Universidad, por ejemplo los campus en los que se encuentra la UABC son Ensenada, Mexicali y Tijuana y son identificados por este mismo nombre.</li><br>
                <li><strong>Carácter de la UA:</strong> las unidades de aprendizaje son de carácter obligatorio u optativo, las obligatorias como su nombre lo indica son aquellas que el alumno está obligado a cursar y en las optativas el alumno tiene más libertad de elegir.</li><br>
                <li><strong>Casilla de verificación:</strong> es un pequeño cuadrado que el usuario puede activar o desactivar con un simple clic; cuando la casilla de verificación está activada, una marca aparecerá en su interior, si la desactivamos, o no la activamos, la casilla aparecerá vacía.</li><br>
                <li><strong>Clave de UA:</strong> todas las unidades de aprendizaje tienen asociadas una clave la cual está compuesta por 5 dígitos numéricos y es única.</li><br> 
        <li><strong>Controles:</strong> hace referencia a cada uno de los elementos que integran las pantallas y que permiten introducir los datos correspondientes.</li><br>
        <li><strong>Coordinación:</strong> hace referencia a la coordinación de área, cada una de las unidades de aprendizaje se encuentra asociadas a una coordinación donde el responsable de esta se encarga de coordinar las actividades del personal académico de su área, verificar el cumplimiento de los programas de estudio de las unidades de aprendizaje correspondientes, así como asesorar a los alumnos de dicha área académica.</li><br>
        <li><strong>Etapa:</strong> las unidades de aprendizaje se encuentran clasificadas por etapa básica, disciplinaria y terminal.</li><br>
        <li><strong>Etapa básica:</strong> contiene las unidades de aprendizaje donde se establecen los cimientos del programa educativo, comprende un conjunto de unidades de aprendizaje de carácter general multidisciplinario, con una orientación eminentemente formativa que proporciona al estudiante las bases contextuales, metodológicas e instrumentales fundamentales para el área administrativa, necesarias para la comprensión del origen y la ubicación de las unidades de aprendizaje de la etapa disciplinaria. Esta etapa favorece la integración de un tronco común que consiste en un conjunto de unidades de aprendizaje perteneciente a un grupo de carreras afines de una misma área de conocimiento.</li><br>
        <li><strong>Etapa disciplinaria:</strong> contiene las unidades de aprendizaje que le permitan al alumno adquirir los conocimientos teóricos, metodológicos y técnicos propios de la carrera elegida, orientados a un aprendizaje genérico para el ejercicio profesional.</li><br>
        <li><strong>Etapa terminal:</strong> contiene las unidades de aprendizaje que permiten reforzar los conocimientos específicos de la carrera seleccionada, se lleva a la aplicación en forma integrada de los conocimientos adquiridos, incrementando los trabajos prácticos, y se concluye con el desarrollo de las competencias profesionales necesarias para incorporarse en el campo ocupacional, para la generación de alternativas y la solución de problemas. En esta etapa la vinculación universitaria adquiere singular importancia para establecer relaciones que permitan construir espacios educativos donde los alumnos, además de realizar actividades de servicio, tienen contacto cercano con el mundo del trabajo y los aspectos ligados a la profesión, con la finalidad de proponer alternativas de solución a los problemas que se le presentan e impulsar los cambios para mejorar procesos y condiciones.</li><br>
        <li><strong>HC:</strong> hace referencia a la cantidad de horas clase que se deben impartir en las unidades de aprendizaje, este dato es obligatorio introducirlo.</li><br>
        <li><strong>HCL:</strong> hace referencia a la cantidad de horas clínicas que se deben impartir en las unidades de aprendizaje en las cuales aplique.</li><br>
        <li><strong>HE:</strong> hace referencia a la cantidad de horas extra clase que se deben impartir en las unidades de aprendizaje en las cuales aplique.</li><br>
        <li><strong>HL:</strong> hace referencia a la cantidad en el laboratorio que se deben impartir en las unidades de aprendizaje en las cuales aplique.</li><br>
        <li><strong>HPC:</strong> hace referencia a la cantidad de horas prácticas de campo que se deben impartir en las unidades de aprendizaje en las cuales aplique.</li><br>
        <li><strong>HT:</strong> hace referencia a la cantidad de horas taller que se deben impartir en las unidades de aprendizaje en las cuales aplique.</li><br>
        <li><strong>Mapa curricular:</strong> Es la representación gráfica del plan de estudio donde se muestran las unidades de aprendizaje.</li><br>
        <li><strong>Nivel:</strong> el nivel programa representa los estudios ya sean licenciatura, técnico y posgrado.</li><br>
        <li><strong>Plan de estudio:</strong> es el conjunto de actividades de enseñanza-aprendizaje que comprende la descripción general de los contenidos de un programa de unidad de aprendizaje (conjunto de materias de mapa curricular).</li><br>
        <li><strong>Seriación:</strong> hace referencia a las unidades de aprendizaje que guardan relación entre sí, una unidad de aprendizaje puede estar seriada a una o más unidades de aprendizaje, se consideran dos tipos de seriación, la obligada y la sugerida.</li><br>
        <li><strong>Unidad académica:</strong> se refiere a las facultades que integran al campus, por ejemplo Facultad de Contaduría y Administración (FCA), Facultad de Ciencias Químicas e Ingeniera (FCQI), etc.</li><br>
        <li><strong>Unidad de aprendizaje (UA):</strong> concepto empleado para hacer referencia a las materias.</li><br>

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