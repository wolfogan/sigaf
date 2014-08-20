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
	<div id="noempleado"><label>No. empleado:</label><input id="txtnoempleado" type="text"/></div>
    <div id="fechaingresouabc"><label>Fecha ingreso a UABC:</label><input type="date" medida="Y/M/D"></div>

    <fieldset class="dd_datosPersonales">
        <legend class="leyendas_fieldset">Datos personales</legend>
	        <div id="apaterno"><label>A. paterno:</label><input type="text"/></div>
	        <div id="amaterno"><label>A. materno:</label><input type="text"/></div>
	        <div id="nombres"><label>Nombre(s):</label><input id="txtnombres" type="text"/></div>
	        <div id="sexo"><label>Sexo:</label>
	            <select>
	              <option value="FEMENINO">FEMENINO</option>
	              <option value="MASCULINO">MASCULINO</option>
	            </select></div>
        <div id="foto"><label>Foto:</label><input id="txtfoto" type="text"></div>
        
        <fieldset class="dd_datosPersonales">
        <legend class="leyendas_fieldset">Dirección</legend>
	        <div id="colonia"><label>Colonia:</label><input id="txtcolonia"type="text"/></div>
	        <div id="calle"><label>Calle:</label><input id="txtcalle" type="text"/></div>
	        <div id="nointerior"><label>No. int.:</label><input id="txtnointerior"type="text" onKeyPress="ValidaSoloNumeros()"/></div>
	        <div id="noexterior"><label>No. ext.:</label><input id="txtnoexterior" type="text" onKeyPress="ValidaSoloNumeros()"/></div>
	        <div id="cp"><label>C.P.:</label><input  id="txtcp" type="text" onKeyPress="ValidaSoloNumeros()"/></div>
        </fieldset>
        
        <fieldset class="dd_datosPersonales">
        <legend class="leyendas_fieldset">Teléfono y correo electrónico</legend>
	        <div id="teloficina"><label>Tel. oficina:</label><input class="telefonos" type="text"/></div>
	        <div id="telparticular"><label>Tel. particular:</label><input class="telefonos" type="text"/></div>
	        <div id="celular"><label>Celular:</label><input class="telefonos" type="text"/></div>
	        <div id="email"><label>email:</label><input class="txtemail" type="text"/></div>
	        <div id="emailalterno"><label>email alternativo:</label><input class="txtemail" type="text"/></div>
        </fieldset>
        
        <div id="rfc"><label>RFC:</label><input id="txtrfc" type="text"/></div>
        <div id="otrotrabajo"><label>Trabajo fuera de UABC:</label><input id="txtotrotrabajo" type="text"/></div>
        <div id="puesto"><label>Puesto:</label><input id="txtpuesto" type="text"/></div>
        <div id="antiguedad"><label>Antigüedad:</label><input id="txtantiguedad" type="text"/></div>
        
    </fieldset>

	
</section>

	<footer>
			<div id="pie_correo">email: emma.castillejos@uabc.edu.mx</div>
			<div id="pie_tel">Teléfono: 664 188 9221</div>

	</footer>

</div>
</body>

<script src="js/mascara.js" type="text/javascript"></script>
	
	<!--mascara para los teléfonos-->
	<script type="text/javascript">
       jQuery(function($){
      /* $("#date").mask("99/99/9999");*/
       $(".telefonos").mask('(999) 999-9999');
       });
	</script>
     
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
</html>