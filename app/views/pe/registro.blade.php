<!doctype html>
<html lang="es">
	<head>
		<meta charset="utf-8"/>
		<link rel="stylesheet" type="text/css" href="../css/normalize.css">
		<link rel="stylesheet" type="text/css" href="../css/estiloPrincipal.css">
		<link rel="stylesheet" type="text/css" href="../css/estilosnav.css">
		<link rel="stylesheet" type="text/css" href="../css/jquery.multiSelect.css"/>
		<link rel="stylesheet" type="text/css" href="../css/component.css"/>
<!--SCRIPT PARA AGREGAR ITEMS AL GRIDVIEW-->
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript">
    $(function() {		
		$("#guardar").click(addFormulario);	
	});	
	function addFormulario(){	
		var noPlan=$("#noPlan").val();
		var clave1F=$("#clave1F").val();
		var materia=$("#materia").val();
		var nivel=$("#nivel").val();
		var carrera=$("#carrera").val();	
		var etapaF=$("#etapaF").val();
		var tipoF=$("#tipoF").val();
		var clave2F=$("#clave2F").val();
		var seriacion=$("#seriacion").val();
		var materiaSeriada=$("#materiaSeriada").val();
		var hc=$("#hc").val();
		var hl=$("#hl").val();
		var ht=$("#ht").val();
		var he=$("#he").val();
		var hpc=$("#hpc").val();
		var hcl=$("#hcl").val();
		var creditosF=$("#creditosF").val();
		var coord=$("#coord").val();
		var semestre=$("#semestre").val();
		var observaciones=$("#observaciones").val();
		var tablaDatos= $("#tblDatos");
		if(clave1F!="" || materia!=""|| nivel!=""|| carrera!=""|| etapaF!="" || tipoF!="" || clave2F!=""|| seriacion!=""|| hc!=""|| hl!=""|| ht!=""|| he!=""|| hpc!=""|| hcl!=""|| creditosF!=""|| coord!=""){		
			tablaDatos.append("<tr style='text-transform:uppercase; font-size:12px;' ><td>"+clave1F+"</td><td>"+materia+"</td><td>"+nivel+"</td><td>"+carrera+"</td><td>"+etapaF+"</td><td>"+tipoF+"</td><td>"+clave2F+"</td><td>"+seriacion+"</td><td style='text-align:center'>"+hc+"</td><td style='text-align:center'>"+hl+"</td><td style='text-align:center'>"+ht+"</td><td style='text-align:center'>"+he+"</td><td style='text-align:center'>"+hpc+"</td><td style='text-align:center'>"+hcl+"</td><td style='text-align:center'>"+creditosF+"</td><td>"+coord+"</td><td style='text-align:center'><input type='button' value='-' class='clsEliminarFila'></td></tr>");	
			reset_campos();	
		}
	}
	//cuando se haga clic en cualquier clase .clsEliminarFila se dispara el evento
	$(document).on('click','.clsEliminarFila',function(){
		var objFila=$(this).parents().get(1);
			$(objFila).remove();
	});
	function reset_campos(){
		$("#noPlan").val("");	
		$("#clave1F").val("");
		$("#materia").val("");
		<!--$("#nivel").val("");-->
		$("#carrera").val("");
		<!--$("#etapaF").val("");-->
		<!--$("#tipoF").val("");-->
		$("#clave2F").val("");
		$("#materiaSeriada").val("");
		/*$("#seriacion").val("");*/
		$("#hc").val("");
		$("#hl").val("");
		$("#ht").val("");
		$("#he").val("");
		$("#hpc").val("");
		$("#hcl").val("");
		$("#creditosF").val("");
		$("#coord").val("");
		$("#semestre").val("");
		$("#observaciones").val("");
	}
	function getDatos(){
		var clave1F="";
		var materia="";
		var nivel="";
		var carrera="";
		var etapaF="";
		var tipoF="";
		var clave2F="";
		var seriacion="";
		var hc="";
		var hl="";
		var ht="";
		var he="";
		var hpc="";
		var hcl="";
		var creditosF="";
		var coord="";
		/*var noPlan="";
		var semestre="";
		var materiaSeriada="";
		var observaciones="";*/
		var filasStr = datos.split("|||");
		for(i=0;i<filasStr.length;i++){
			var fila= filasStr[i];
			var datosFila=fila.split("&&&");
			clave1F=datosFila[0];
			materia=datosFila[1];
			nivel=datosFila[2];
			carrera=datosFila[3];
			etapaF=datosFila[4];
			tipoF=datosFila[5];
			clave2F=datosFila[6];
			seriacion=datosFila[7];
			hc=datosFila[8];
			hl=datosFila[9];
			ht=datosFila[10];
			he=datosFila[11];
			hpc=datosFila[12];
			hcl=datosFila[13];
			creditosF=datosFila[14]
			coord=datosFila[15];
			tablaDatos.append("<tr><td>"+clave1F+"</td><td>"+materia+"</td><td>"+nivel+"</td><td>"+carrera+"</td><td>"+etapaF+"</td><td>"+tipoF+"</td><td>"+clave2F+"</td><td>"+seriacion+"</td><td>"+hc+"</td><td>"+hl+"</td><td>"+ht+"</td><td>"+he+"</td><td>"+hpc+"</td><td>"+hcl+"</td><td>"+creditosF+"</td><td>"+coord+"</td></tr>");
		}				
	}
</script>
<!----------------------------------------------------------------------------->
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
<img src="../imagenes/logo.png" alt="">
</figure>
<div id="titulo">
	<h1>SISTEMA DE GESTIÓN ACADÉMICA (SIGAF)</h1>
	<h3>Facultad de Contaduría y Administración</h3>
</div>
<figure id="cimarron"><img src="../imagenes/cimarron.png" alt=""></figure>
</header>
<nav id="MenuNav" style="border-right:none">
<ul>
	<li><a href="#" titile="Menu 1">Plan de estudios</a>
	<ul>
		<li><a href="<?=URL::to('planestudio/registro')?>" title="SubMenu 1">Registrar UA</a></li>
		<li><a href="<?=URL::to('planestudio/consulta')?>" titile="SubMenu 2">Consulta y modificación</a></li>
		<li class="ultimo"><a href="index.html" title="SubMenu 3">Menu principal</a></li>
	</ul>
	</li>
	<li><a href="#" titile="Menu 2">Carga académica</a>
	<ul>
		<li><a href="#"title="registro_ca">Registrar Carga A.</a></li>
		<li><a href="#" titile="SubMenu 2">Consultar Carga A.</a></li>
		<li class="ultimo"><a href="#" title="SubMenu 3">Modificar Carga A.</a></li>
	</ul>
	</li>
	<li><a href="#" title="Menu 3">Disponibilidad docente</a>
	<ul>
		<li><a href="#" title="SubMenu 1">Submen&uacute; 1</a></li>
		<li><a href="#" titile="SubMenu 2">Submen&uacute; 2</a></li>
		<li class="ultimo"><a href="#" title="SubMenu 3">Submen&uacute; 3</a></li>
	</ul>
	</li>
	<li><a href="#" title="Menu 4">Creación de horario<span></span></a>
	<ul>
		<li><a href="#" title="SubMenu 1">Submen&uacute; 1</a></li>
		<li><a href="#" titile="SubMenu 2">Submen&uacute; 2</a></li>
		<li class="ultimo"><a href="#" title="SubMenu 3">Submen&uacute; 3</a></li>
	</ul>
	</li>
	<li><a href="#" title="Menu 5">Calendarización Exams.</a>
	<ul>
		<li><a href="#" title="SubMenu 1">Submen&uacute; 1</a></li>
		<li><a href="#" titile="SubMenu 2">Submen&uacute; 2</a></li>
		<li class="ultimo"><a href="#" title="SubMenu 3">Submen&uacute; 3</a></li>
	</ul>
	</li>
	<li><a href="#" title="Menu 6" style="border-right:1px solid #FEA417;">Control de inasistencias</a>
	<ul>
		<li><a href="#" title="SubMenu 1">Submen&uacute; 1</a></li>
		<li><a href="#" titile="SubMenu 2">Submen&uacute; 2</a></li>
		<li class="ultimo"><a href="#" title="SubMenu 3">Submen&uacute; 3</a></li>
	</ul>
	</li>
</ul>
</nav>
<div id="indicadores">
	<div id="usuariofecha">
		<div id="usuario" class="texto_body">
			Usuario: Iván Avila
		</div>
		<div id="fecha" class="texto_body">
			<script>document.write(day);document.write(myweekday+" de "+month+ " de " +myyear+",");</script>
			<label id="reloj"></label>
		</div>
	</div>
	<div id="ubicacion" class="texto_body">
		Plan de estudios: Registro
	</div>
	<div id="loginmanual">
		<div id="login" class="texto_body">
			<img src="../imagenes/login.png" alt="">&nbsp;login y usuarios
		</div>
		<div id="manual" class="texto_body">
			<img src="../imagenes/manual.png" alt="">&nbsp;manual y ayuda
		</div>
	</div>
</div>
<section>


<div id="formularioPlanEstudio">
	<div id="primerBloque">
		<div id="noPlanDiv">
			<label>No.Plan: </label>
			<select class="con_estilo" type="text" name="noPlan" id="noPlan"> 
			<option value="2013-2">2013-2</option>
			<option value="2013-4">2013-4</option>
			<option value="2014-1">2014-1</option>
			</select>
			<div class="md-modal md-effect-11" id="modal-10">
				<div class="md-content">
					<h3>Número de Plan</h3>
					<div id="tablita">
						<div id="tablita2">
							<table id="modal1" width="461">
							<thead>
							<tr>
								<th width="82" height="28">
									Clave
								</th>
								<th width="82" height="28">
									Nombre
								</th>
								<th width="82">
									Fecha inicio
								</th>
								<th width="82">
									Fecha fin
								</th>
								<th>
									Elim.
								</th>
							</tr>
							</thead>
							<tbody>
							<tr>
								<td>
									<input type="text" style="width: 60px; height: 25px; border-radius:5px" class="clsAnchoTotal" onkeypress="ValidaSoloNumeros()" maxlength="6" autofocus>
								</td>
								<td>
									<input type="text" style="width: 60px; height: 25px; border-radius:5px" class="clsAnchoTotal" maxlength="6" autofocus>
								</td>
								<td>
									<input type="date" name="fecha" style="width: 80px; height: 25px; border-radius:5px" class="clsAnchoTotal">
								</td>
								<td>
									<input type="date" name="fecha" style="width: 80px; height: 25px; border-radius:5px" class="clsAnchoTotal">
								</td>
								<td width="50" align="center">
									<input type="button" value="-" class="clsEliminarFila"/>
								</td>
							</tr>
							</tbody>
							</table>
						</div>
					</div>
					<input type="button" value="Agregar" class="clsAgregarFilaNoPlan">
					<input type="button" value="Guardar" class="estilo_button2">
					<input type="button" class="md-close" value="Salir">
				</div>
			</div>
			<input class="md-trigger" data-modal="modal-10" type="button" value="+"></a>
			<div class="md-overlay">
			</div>
		</div>
		<div style="display: none;">
			<div id="noPlanE" style="width:526px;height:425px;overflow:auto;">
				<div id="encab1">
					<label>Número de Plan</label>
				</div>
			</div>
		</div>
		<div id="unidadAcademicaDiv">
			<label>U.Acad: </label>
			<select class="con_estilo" name="ua" id="ua" type="text" size=1>
				<option value="FCA">FCA</option>
				<option value="FCQ">FCQ</option>
				<option value="FMO">FMO</option>
			</select>
			<div class="md-modal md-effect-11" id="modal-11">
				<div class="md-content">
					<h3>Unidad Académica</h3>
					<div id="tablita">
						<table id="modal" width="388">
						<thead>
						<tr>
							<th width="84">
								Clave
							</th>
							<th width="70">
								Nombre
							</th>
							<th width="70">
								Administrador
							</th>
							<th width="70">
								Subdirector
							</th>
							<th width="70">
								Director
							</th>
							<th width="51">
								Elim.
							</th>
						</tr>
						</thead>
						<tbody>
						<tr>
							<td>
								<input type="text" style="width: 60px; height: 25px; border-radius:5px" class="clsAnchoTotal" onkeypress="ValidaSoloNumeros()" maxlength="6" autofocus>
							</td>
							<td>
								<input type="text" style="height: 25px; width:70px; text-transform:uppercase; border-radius:5px" class="clsAnchoTotal">
							</td>
							<td>
								<input type="text" style="height: 25px; width:70px; text-transform:uppercase; border-radius:5px" class="clsAnchoTotal">
							</td>
							<td>
								<input type="text" style="height: 25px; width:70px; text-transform:uppercase; border-radius:5px" class="clsAnchoTotal">
							</td>
							<td>
								<input type="text" style="height: 25px; width:70px; text-transform:uppercase; border-radius:5px" class="clsAnchoTotal">
							</td>
							<td align="center">
								<input type="button" value="-" class="clsEliminarFila"/>
							</td>
						</tr>
						</tbody>
						</table>
					</div>
					<input type="button" value="Agregar" class="clsAgregarFila">
					<input type="button" value="Guardar" class="estilo_button2">
					<input type="button" class="md-close" value="Salir">
				</div>
			</div>
			<input class="md-trigger" data-modal="modal-11" type="button" value="+">
			<div class="md-overlay">
			</div>
		</div>
		<div style="display: none;">
			<div id="CatUniAca" style="width:526px;height:425px;overflow:auto;">
				<div id="encab">
					<label>Unidad Académica</label>
				</div>
			</div>
		</div>
		<div id="campusDiv">
			<label>Campus: </label>
			<select class="con_estilo" name="campus" id="campus" size=1 type="text">
				<option value="TIJUANA">TIJUANA</option>
				<option value="TECATE">TECATE</option>
				<option value="MEXICALI">MEXICALI</option>
			</select>
			&nbsp;<input class="estilo_button" type="button" value="+">
		</div>
		<div id="nivelDiv">
			<label>Nivel: </label>
			<select class="con_estilo" name="nivel" id="nivel" size=1 type="text">
				<option value="LIC">LIC.</option>
				<option value="POSTGRADO">POSTGRADO</option>
				<option value="TECNICO">TECNICO</option>
			</select>
			&nbsp;<input class="estilo_button" type="button" value="+">
		</div>
		
	</div>
	<fieldset id="unidadaprendizaje">
		<div id="segundoBloque">
			<div id="claveDiv">
				 &nbsp;<label>Clave: </label>
				<input class="estilo_text" type="text" name="clave1F" id="clave1F" list="datalist_clave" size=1 onkeypress="ValidaSoloNumeros()">
				<datalist id="datalist_clave">
				<option value="10450">
				<option value="13230">
				<option value="10384">
				</datalist>
				<br>
				<input type="checkbox" name="generarClave" value="Generar">Generar clave
			</div>
			<div id="materiaDiv">
				<label>Materia: </label>
				<input style="width: 375px; height: 25px; border-radius: 5px; border-color: #DBDBEA; text-transform:uppercase" type="text" name="materia" id="materia" list="datalist_materia" size=1>
				<datalist id="datalist_materia">
				<option value="PROGRAMACION ORIENTADA A OBJETOS">
				<option value="PROGRAMACION AVANZADA">
				<option value="INFORMATICA">
				</datalist>
			</div>

			<div id="carreraDiv">
			<label>Carrera:</label>
			<select style="font-weight:normal; width: 143px" class="con_estilo" id="control_3" name="carrera" multiple="carrera" size="5">
				<option value="TRONCOCOMUN">TRONCO COMUN</option>
				<option value="ADMON">ADMON.</option>
				<option value="CONTAB">CONTAB.</option>
				<option value="INFORMATICA">INFORMATICA</option>
				<option value="NEGOCIOS">NEGOCIOS</option>
			</select>
			&nbsp;<input class="estilo_button" type="button" value="+">
		</div>


			<div id="etapaDiv">
				<label>Etapa: </label>
				<select class="con_estilo" name="etapaF" id="etapaF" size=1 type="text">
					<option value="BASICA">BASICA</option>
					<option value="INTERMEDIA">DISCIPLINARIA</option>
					<option value="TERMINAL">TERMINAL</option>
				</select>
				&nbsp;<input class="estilo_button" type="button" value="+">
			</div>
			
		</div>
		<div id="tercerBloque">
			<div id="semestreDiv">
				<label>Sem:</label>
				<input class="estilo_numeric" type="number" name="semestr" id="semestre" min="1" max="9" onkeypress="ValidaSoloNumeros()">
			</div>
			<fieldset id="group_seriacion">
				<legend>Seriación</legend>
				<div id="claveSerDiv">
					<label>Clave: </label>
					<input class="estilo_text" type="text" name="clave2F" id="clave2F" list="datalist_clave2F" size=1 onkeypress="ValidaSoloNumeros()">
					<datalist id="datalist_clave2F">
					<option value="123344">
					<option value="235562">
					<option value="235009">
					</datalist>
				</div>


				<div id="seriacionDivMateria">
					<select class="con_estilo" style="width: 285px" type="text" name="materiaSeriada" id="materiaSeriada" size=1>
					<option value="PROGRAMACION ORIENTADA A OBJETOS">PROGRAMACION ORIENTADA A OBJETOS</OPTION>
					<option value="PROGRAMACION AVANZADA">PROGRAMACION AVANZADA</OPTION>
					<option value="INFORMATICA">INFORMATICA</OPTION>
					</select>
				</div>
				<div id="seriacionDivTipo">
					<label>Seriación: </label>
					<select style="width: 143px"class="con_estilo" name="seriacion" id="seriacion" size=1 type="text">
						<option value="SINSERIACION">SIN SERIACION</option>
						<option value="OBLIGADA">OBLIGATORIA</option>
						<option value="SUGERIDA">SUGERIDA</option>
					</select>
					&nbsp;<input class="estilo_button" type="button" value="+">
				</div>
			</fieldset>

			<div id="tipoDiv">
				<label>Tipo: </label>
				<select  class="con_estilo" name="tipoF" id="tipoF" size=1 type="text">
					<option value="OBLIGATORIA">OBLIGATORIA</option>
					<option value="OPTATIVA">OPTATIVA</option>
				</select>
				&nbsp;<input class="estilo_button" type="button" value="+">
			</div>

			
			
		</div>
		<div id="cuartoBloque">
			<div id="hcDiv">
				<label>HC: </label>
				<input class="estilo_numeric" type="number" name="hc" id="hc" min="1" max="20" onkeypress="ValidaSoloNumeros()">
			</div>
			<div id="hlDiv">
				<label>HL: </label>
				<input class="estilo_numeric" type="number" name="hl" id="hl" min="1" max="20" onkeypress="ValidaSoloNumeros()">
			</div>
			<div id="htDiv">
				<label>HT: </label>
				<input class="estilo_numeric" type="number" name="ht" id="ht" min="1" max="20" onkeypress="ValidaSoloNumeros()">
			</div>
			<br>
			<br>
			<div id="heDiv">
				<label>HE: </label>
				<input class="estilo_numeric" type="number" name="he" id="he" min="1" max="20" onkeypress="ValidaSoloNumeros()">
			</div>
			<div id="hpcDiv">
				<label>HPC: </label>
				<input class="estilo_numeric" type="number" name="hpc" id="hpc" min="1" max="20" onkeypress="ValidaSoloNumeros()">
			</div>
			<div id="hclDiv">
				<label>HCL: </label>
				<input class="estilo_numeric" type="number" name="hcl" id="hcl" min="1" max="20" onkeypress="ValidaSoloNumeros()">
			</div>
			<br>
			<br>
			
			<div id="creditosDiv">
				<label>Créditos: </label><input class="estilo_numeric" type="number" name="creditosF" id="creditosF" min="1" onkeypress="ValidaSoloNumeros()">
			</div>
			
			<div id="observacionesDiv">
				<label>Observaciones:</label><br>
				<textarea rows=3 cols="60" style=" border-radius:5px; border-color:#DBDBEA; text-transform:uppercase; resize:none" id="observaciones" placeholder="Observaciones"></textarea>
			</div>

			<div id="coordDiv">
				<label>Coord: </label><input style="width:120px" class="coordina" type="text" name="coord" id="coord" size=1 style="text-transform:uppercase" list="datalist_coord">
				<datalist id="datalist_coord">
				<option value="INFORMATICA">
				<option value="MATEMATICAS">
				<option value="CIENCIAS COMPUTACIONALES">
				<option value="SISTEMAS DE INFORMACION">
				<option value="PROGRAMACION">
				</datalist><input class="estilo_button" type="button" value="+">
			</div>


			<div id="botones">
				<input style="width:120px"class="estilo_button2" type="button" value="Guardar" name="guarda" id="guardar">
			</div>
		</div>
	</fieldset>
</div>
<div id="GridPlanEstudio">


<div id=planTerminado><input style="width:20px; height:20px;" type="checkbox" name="generarClave" value="Generar"><label style="font-size:18px;">Plan de estudios terminado</label></div>

	<table width="100%" border="2px solid #D9D9EA" align="center" cellpadding="10" cellspacing="0" class="tablaDatos" height="20px" id="tblDatos" style="table-layout:fixed">
	<tr>
		<th style="width:60px;">
			<strong>CLAVE</strong>
		</th>
		<th style="width:200px" ;>
			<strong>MATERIA</strong>
		</th>
		<th>
			<strong>NIVEL</strong>
		</th>
		<th style="width:110px;">
			<strong>CARRERA</strong>
		</th>
		<th>
			<strong>ETAPA</strong>
		</th>
		<th>
			<strong>TIPO</strong>
		</th>
		<th>
			<strong>SERIE</strong>
		</th>
		<th>
			<strong>TIPOSERIE</strong>
		</th>
		<th style="width:30px;">
			<strong>HC</strong>
		</th>
		<th style="width:30px;">
			<strong>HL</strong>
		</th>
		<th style="width:30px;">
			<strong>HT</strong>
		</th>
		<th style="width:30px;">
			<strong>HE</strong>
		</th>
		<th style="width:40px;">
			<strong>HPC</strong>
		</th>
		<th style="width:40px;">
			<strong>HCL</strong>
		</th>
		<th style="width:50px;">
			<strong>CRED.</strong>
		</th>
		<th style="width:130px;">
			<strong>COORD.</strong>
		</th>
		<th style="width:50px;">
			<strong>ELIM.</strong>
		</th>
	</tr>
	</table>

	<br>
	<div id="botonguardar">
	</div>
</div>
</section>
<footer></footer>
</div>
</body>
<!----------------------------------------------------------->
<!--SCRIPT PARA VENTANA MODAL-->
<script type="text/javascript">
			// this is important for IEs
			var polyfilter_scriptpath = '/js/';
		</script>
<script src="../js/classie.js"></script>
<script src="../js/modalEffects.js"></script>
<!--<script src="js/css-filters-polyfill.js"></script>-->
<script type="text/javascript" src="../js/manipulacion.js"></script>
<script type="text/javascript" src="../js/manipulacionUA.js"></script>
<!--SCRIPT PARA COMBOBOX MULTIPLE-->
<!--<script type="text/javascript" src="js/jquery.min.js"></script> -->
<!--<script type="text/javascript" src="js/jquery.bgiframe.min.js" ></script>-->
<script type="text/javascript" src="../js/jquery.multiSelect.js"></script>
<script>
			$(document).ready( function() {
				// Default options
				$("#control_3").multiSelect();	
			});
		</script>
<!----------------------------------------------------------->
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