<!doctype html>
<html lang="es">
<head>
<meta charset="utf-8"/>

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

<!---------------------------------------------------------------------------------------->
<title>Disponibilidad docente</title>
</head>
<body>
<header>
	<figure id="logo">
	<img src="../imagenes/logo.png" alt="">
	</figure>
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
		Disponibilidad docente: Registro
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
	 <fieldset class="dd_datosPersonales">
        <legend class="leyendas_fieldset">Grado de Estudios</legend>
       <div id="licenciatura"><label>Licenciatura:</label><input id="txtlicenciatura" type="text"/></div>
       <div id="uniegresolic"><label>Univ. egreso:</label><input type="text"/></div>
       <div id="fechatitulacion"><label>Fecha de titulación:</label><input id="fechatitul" type="date" medida="Y/M/D"></div>
       <div id="cedulalic"><label>Cédula:</label><input class="cedulas" type="text"/></div>
       
       <div id="especialidad"><label>Especialidad:</label>
       <input type="checkbox" id="chkespecialid" value="1" onchange="javascript:showContent()"> <label for = "chkespecialid">Si</label></div>
       <div id="contente" style="display: none;">
       <div id="nombreesp"><input type="text" class="nombestudios" placeholder="Nombre especialidad"/></div>
       <div id="uniegresoesp"><label>Univ. egreso:</label><input class="univegresos" type="text"/></div>
       <div id="cedulaesp"><label>Cédula:</label><input class="cedulas" type="text"/></div>
      </div>
       
       <div id="maestria"><label>Maestria:</label>
       <input type="checkbox" id="chkmaestria" value="1" onchange="javascript:showContent()"> <label for = "chkmaestria">Si</label></div>
       <div id="contentm" style="display: none;">
       <div id="nombremaes"><input type="text" class="nombestudios" placeholder="Nombre maestria"/></div>
       <div id="uniegresomaes"><label>Univ. egreso:</label><input class="univegresos" type="text"/></div>
       <div id="cedulamaes"><label>Cédula:</label><input class="cedulas" type="text"/></div>
       </div>
       
       <div id="doctorado"><label>Doctorado:</label>
       <input type="checkbox" id="chkdoctorado" value="1" onchange="javascript:showContent()"> <label for = "chkdoctorado">Si</label></div>
        <div id="contentd" style="display: none;">
       <div id="nombredoc"><input type="text" class="nombestudios" placeholder="Nombre doctorado"/></div>
       <div id="uniegresodoc"><label>Univ. egreso:</label><input class="univegresos" type="text"/></div>
       <div id="ceduladoc"><label>Cédula:</label><input class="cedulas" type="text"/></div>
       </div>
       
    </fieldset>
	
</section>

	<footer>
			<div id="pie_correo">email: emma.castillejos@uabc.edu.mx</div>
			<div id="pie_tel">Teléfono: 664 188 9221</div>

	</footer>

</div>
</body>

<!--SCRIPT PARA QUE SOLO ACEPTE NUMEROS--> 
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
    
    </script>


     <!--Funcion para mostrar el contenido en caso de tener alguna especialidad, maestria o doctorado-->        
	<script type="text/javascript">
    function showContent() {
        if(element = document.getElementById("contente"))
		{
			check = document.getElementById("chkespecialid");
			if (check.checked) 
			{
            element.style.display='block';
        	}
        	else 
			{
            element.style.display='none';
       		}
		}
		 if(element = document.getElementById("contentm"))
		 {
			check = document.getElementById("chkmaestria");
			if (check.checked) 
			{
            element.style.display='block';
        	}
        	else 
			{
            element.style.display='none';
        	}
		}
		 if(element = document.getElementById("contentd"))
		 {
			check = document.getElementById("chkdoctorado");
			if (check.checked) 
			{
            element.style.display='block';
        	}
        	else 
			{
            element.style.display='none';
        	}
		}  
    }
	</script>




</html>