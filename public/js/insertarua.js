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