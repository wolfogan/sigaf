<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="utf-8"/>
    <link rel="stylesheet" type="text/css" href="css/normalize.css">
    <link rel="stylesheet" type="text/css" href="css/estiloPrincipal.css">
    <link rel="stylesheet" type="text/css" href="css/demo.css"/>
    <link rel="stylesheet" type="text/css" href="css/style_common.css"/>
    <link rel="stylesheet" type="text/css" href="css/style10.css"/>
<!--SCRIPT PARA FECHA Y HORA-->
<script language="javascript"> 
mydate = new Date(); 
myday = mydate.getDay(); 
mymonth = mydate.getMonth(); 
myweekday= mydate.getDate(); 
myyear=mydate.getFullYear();
weekday= myweekday; 
if(myday == 0) 
day = " Domingo " 
else if(myday == 1) 
day = " Lunes " 
else if(myday == 2) 
day = " Martes " 
else if(myday == 3) 
day = " Miércoles " 
else if(myday == 4) 
day = " Jueves " 
else if(myday == 5) 
day = " Viernes " 
else if(myday == 6) 
day = " Sábado " 
if(mymonth == 0) 
month = "Enero " 
else if(mymonth ==1) 
month = "Febrero " 
else if(mymonth ==2) 
month = "Marzo " 
else if(mymonth ==3) 
month = "Abril " 
else if(mymonth ==4) 
month = "Mayo " 
else if(mymonth ==5) 
month = "Junio " 
else if(mymonth ==6) 
month = "Julio " 
else if(mymonth ==7) 
month = "Agosto " 
else if(mymonth ==8) 
month = "Setiembre " 
else if(mymonth ==9) 
month = "Octubre " 
else if(mymonth ==10) 
month = "Noviembre " 
else if(mymonth ==11) 
month = "Diciembre " 
</script>
<script>
function startTime(){
today=new Date();
h=today.getHours();
m=today.getMinutes();
s=today.getSeconds();
m=checkTime(m);
s=checkTime(s);
document.getElementById('reloj').innerHTML=h+":"+m+":"+s;
t=setTimeout('startTime()',500);}
function checkTime(i)
{if (i<10) {i="0" + i;}return i;}
window.onload=function(){startTime();}
</script>
<!---------------------------------------------------------------------------------------->
</head>
<body>
<header>
<figure id="logo">
<img src="imagenes/logo.png" alt="">
</figure>
<div id="titulo">
	<h1>SISTEMA DE GESTIÓN ACADÉMICA (SIGAF)</h1>
	<h3>Facultad de Contaduría y Administración</h3>
</div>
<figure id="cimarron"><img src="imagenes/cimarron.png" alt=""></figure>
</header>
<div id="indicadores">
	<div id="usuariofecha">
		<div id="fecha" class="texto_body">
			<script>document.write(day);document.write(myweekday+" de "+month+ " de " +myyear+",");</script>
			<label id="reloj"></label>
		</div>
	</div>
    <div id="mensajesIcono">
    <img src="imagenes/mensajes.png" >
    
    </div>
</div>
<div class="container">
	<div class="main">
		<div class="view view-tenth">
			<img src="imagenes/plan1.png"/>
			<div class="mask">
				<h2>Plan de estudios</h2>
				<p>
					<a href="registrope.html" style="color:#004000">Registrar, consultar, modificar y eliminar unidad de aprendizaje.</a>
				</p>
				<p>
					<a href="consultape.html" style="color:#004000"></a>
				</p>
				<!--<a href="#" class="info">Read More</a>-->
			</div>
		</div>
		<div class="view view-tenth">
			<img src="imagenes/carga1.png"/>
			<div class="mask">
				<h2>Carga academica</h2>
				<p>
					<a href="#" style="color:#004000">Registrar carga académica</a>
				</p>
				<p>
					 consultar, eliminar carga academica
				</p>
				<a href="#"></a>
			</div>
		</div>
		<div class="view view-tenth">
			<img src="imagenes/disponibilidad1.png"/>
			<div class="mask">
				<h2>Disponibilidad docente</h2>
				<p>
					Registro, consulta, modificación, eliminación
				</p>
				<a href="#"></a>
			</div>
		</div>
		<div class="view view-tenth">
			<img src="imagenes/creacion1.png"/>
			<div class="mask">
				<h2>Creacion de horarios</h2>
				<p>
					Registro, consulta, modificacion, eliminacion
				</p>
				<!--<a href="#" class="info">Read More</a>-->
			</div>
		</div>
		<div class="view view-tenth">
			<img src="imagenes/calend1.png"/>
			<div class="mask">
				<h2>Calendarizacion de examenes</h2>
				<p>
					Registro, consulta, modificación, eliminación
				</p>
				<!--<a href="#" class="info">Read More</a>-->
			</div>
		</div>
		<div class="view view-tenth">
			<img src="imagenes/control1.png"/>
			<div class="mask">
				<h2>Control de inasistencias</h2>
				<p>
					Registro, consulta, modificación, eliminación
				</p>
				<!--<a href="#" class="info">Read More</a>-->
			</div>
		</div>
		<div class="view view-tenth">
			<img src="imagenes/login1.png"/>
			<div class="mask">
				<h2>Login y usuarios</h2>
				<p>
					Registro, consulta, modificación, eliminación
				</p>
				<!--<a href="#" class="info">Read More</a>-->
			</div>
		</div>
		<div class="view view-tenth">
			<img src="imagenes/manual1.png"/>
			<div class="mask">
				<h2>Manual y ayuda</h2>
				<p>
					Registro, consulta, modificacion, eliminacion
				</p>
				<!--<a href="#" class="info">Read More</a>-->
			</div>
		</div>
	</div>
</div>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>
<footer></footer>
</div>
</body>
</html>