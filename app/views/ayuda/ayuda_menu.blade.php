<!doctype html>
<html lang="es">
<head>
	<meta charset="utf-8"/>
	<link rel="stylesheet" type="text/css" href="../css/inicio.css"/>			
</head>
<body>
<div id="modal">	
<div id="ventanacompleta">
		<div id="salir"><a href="<?=URL::to('main')?>"><img src="../imagenes/salir.png"></a></div>
			<h1>Sistema de Gestión Académica FCA<br>
			<span>Manual de usuario: consulta de los módulos</span></h1>
	<div id="linea2"></div>
        
  <div id="contenedor">
    <div class="opcion" onclick="location.href='ayudape'" style="cursor:pointer;" id="plan">
        <h2>Plan de estudios</h2>
      </div>
      <div class="opcion" onclick="location.href='ayudaca'" style="cursor:pointer;" id="carga">
          <h2>Carga académica</h2>
      </div>
      <div class="opcion" onclick="location.href='ayudadd'" style="cursor:pointer;" id="disponibilidad">
          <h2>Disponibilidad docente</h2>
      </div>
      <div class="opcion" onclick="location.href='ayudaus'" style="cursor:pointer;" id="usuarios">
          <h2>Login y usuarios</h2>
      </div>        
    </div>
  <div id="pie">Facultad de Contaduría y Administración<br>
<span>Universidad Autónoma de Baja California</span></div>    
 </div>  
 <div class="overlay"></div>
 </div>
    
</body>
</html>