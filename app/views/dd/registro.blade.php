<!doctype html>
<html lang="es">
<head>
<meta charset="utf-8"/>

		<link rel="stylesheet" type="text/css" href="../css/normalize.css">
		<link rel="stylesheet" type="text/css" href="../css/estiloPrincipal.css">
		<link rel="stylesheet" type="text/css" href="../css/estilosnav.css">
		<link rel="stylesheet" type="text/css" href="../css/component.css"/>
		<link rel="stylesheet" type="text/css" href="../css/estilo_tabs.css" />

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
			<div class="nombre_coordinacion">Lic. en Informática</div>
			<div class="tabs">
	    
			    <input id="tab-1"  type="radio" name="radio-set" class="tab-selector-1" checked="checked" />
				<label for="tab-1" class="tab-label-1">Datos personales</label>
				
			    <input id="tab-2" type="radio" name="radio-set" class="tab-selector-2" />
				<label for="tab-2" class="tab-label-2">Estudios y cursos</label>
				
			    <input id="tab-3" type="radio" name="radio-set" class="tab-selector-3" />
				<label for="tab-3" class="tab-label-3">Disponibilidad</label>
		                
		        <input id="tab-4" type="radio" name="radio-set" class="tab-selector-4" />
				<label for="tab-4" class="tab-label-4">Otro</label>
					 
				<div class="clear-shadow"></div>
					
				    <div class="content">
					        
		                <div class="content-1">
							<h2>Datos personales</h2>
		                        
								<div id="dd_noEmpleado">No. empleado:<label>12345</label></div>
								<div id="dd_fechaIngreso">Fecha ingreso a UABC:<input type="date" medida="Y/M/D"></div>
								<div id="dd_aPaterno">A. paterno:<input type="text"/></div>
								<div id="dd_aMaterno">A. materno:<input type="text"/></div>
								<div id="dd_nombres">Nombre(s):<input id="txtnombres" type="text"/></div>
								<div id="dd_sexo">
									Sexo:
									<select>
										 <option value="FEMENINO">FEMENINO</option>
										 <option value="MASCULINO">MASCULINO</option>
									</select>
								</div>
								<div id="dd_foto">Foto:<input id="txtfoto" type="text"></div>


							<h2>Dirección</h2>
		                        
								Colonia:<input id="txtcolonia"type="text"/>
								Calle:<input id="txtcalle" type="text"/>
								No. int.:<input id="txtnointerior"type="text" onKeyPress="ValidaSoloNumeros()"/>
								No. ext.:<input id="txtnoexterior" type="text" onKeyPress="ValidaSoloNumeros()"/>
								C.P.:<input  id="txtcp" type="text" onKeyPress="ValidaSoloNumeros()"/>
				  
		                    <h2>Teléfonos</h2>

								Tel. oficina:<input class="telefonos" type="text"/>
								Tel. particular:<input class="telefonos" type="text"/>
								Celular:<input class="telefonos" type="text"/>
								email:<input class="txtemail" type="text"/>
								email alternativo:<input class="txtemail" type="text"/>                       
		                        
		                       	
						</div>
		                    
					    <div class="content-2">
		                    
		                   	<h2>Trabajo fuera de UABC</h2>

								RFC:<input id="txtrfc" type="text"/>
								Trabajo fuera de UABC:<input id="txtotrotrabajo" type="text"/>
								Puesto:<input id="txtpuesto" type="text"/>
								Antigüedad:<input id="txtantiguedad" type="text"/>                   
		                       
							<h2>Grado de estudios</h2>

								Licenciatura:<input id="txtlicenciatura" type="text"/>
								Univ. egreso:<input type="text"/>
								Fecha de titulación:<input id="fechatitul" type="date" medida="Y/M/D">
								Cédula:<input class="cedulas" type="text"/>  

								<input type="checkbox" id="chkespecialid" value="1" onchange="javascript:showContent()"> 
								Si
								Univ. egreso:<input class="univegresos" type="text"/>
								Cédula:<input class="cedulas" type="text"/>   

								<input type="checkbox" id="chkespecialid" value="1" onchange="javascript:showContent()"> 
								Si
								Univ. egreso:<input class="univegresos" type="text"/>
								Cédula:<input class="cedulas" type="text"/>

								<input type="checkbox" id="chkdoctorado" value="1" onchange="javascript:showContent()"> 
								Si
								Univ. egreso:<input class="univegresos" type="text"/>
								Cédula:<input class="cedulas" type="text"/>                                     
		                        
		                        
							<h2>Cursos</h2>
								
						</div>
		                    
		                    
					    <div class="content-3">
							
							<h2>Materias a impartir</h2>
		                        
		                        hola cynthia
		                        
							<h2>Disponibilidad</h2>
								
						</div>
		                    
		                                    
		                <div class="content-4">
								
							<h2>X</h2>
		                        
		                        hola cynthia DOS
		                        
							<h2>Y</h2>
								
						</div>
					    
				</div>
			</div>
			
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