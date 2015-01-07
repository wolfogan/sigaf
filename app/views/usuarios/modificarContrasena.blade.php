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
        var code =a+b+c+d+e+f+g;
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
				Login y usuarios: Modificar contraseña
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


		

		<section class="us_ventanasCortasMod">

			<div id="formularioRegUsuarios_mod">
				
						<div class="us_cambiar">No.Empleado:<label id="us_noEmpleadoMod">1234567</label></div>		

						<div class="us_cambiar">Correo-E:		
							<input style="margin-left:82px;" class="dd_con_estilo_largo" type="text" name="us_Correo_mod" id="us_Correo_mod" size=1>
						</div>

						<div class="us_cambiar">Contraseña:
							<input style="margin-left:67px;" class="dd_con_estilo_largo" type="text" name="us_Contrasena_mod" id="us_Contrasena_mod" size=1>
						</div>	

						<div class="us_cambiar">Nueva contraseña:		
							<input style="margin-left:20px;" class="dd_con_estilo_largo" type="text" name="us_ContrasenaNueva_mod" id="us_ContrasenaNueva_mod" size=1>
						</div>

						<div class="us_cambiar">Repetir contraseña:
							<input style="margin-left:12px;" class="dd_con_estilo_largo" type="text" name="us_ContrasenaRepetir_mod" id="us_ContrasenaRepetir_mod" size=1>
						</div>

						<div class="us_cambiar" style="height:50px;">Pregunta:<label class="us_preguntaMod">¿CUAL ES EL NOMBRE DE MI MASCOTA?</label></div>

						<div class="us_cambiar">Respuesta:
							<input style="margin-left:75px;" class="dd_con_estilo_largo" type="text" name="us_Respuesta_mod" id="us_Respuesta_mod" size=1>
						</div>

						<div id="us_divCaptcha_mod">
							<table>
							    <tr>
							        <td>
							            Introduce los caracteres:<br>
							        </td>
							    </tr>
							    <tr>
							        <td>
							            <input class="dd_con_estilo_propio" readonly="readonly" type="text" id="txtCaptcha"/>
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

						<div class="us_btnRegistroUsuario_mod">
							<input type="button" style="width:200px" class="estilo_button2" value="Modificar usuario" name="modificarUsuario" id="modificarUsuario" onclick="alert(ValidCaptcha())">
						</div>

			</div>


			
		</section>
		<footer>
			<!--<div id="pie_correo">email: emma.castillejos@uabc.edu.mx</div>
			<div id="pie_tel">Teléfono: 664 188 9221</div>-->

		</footer>

		
	</body>
<!----------------------------------------------------------------->

</html>