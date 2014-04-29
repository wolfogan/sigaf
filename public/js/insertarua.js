$(function(){
	$("#guardar").click(addFormulario);

});

function addFormulario(){
	var noPlan=$("#noPlan").val();
	var clave1F=$("#clave1F").val();
	var materia=$("#materia").val();
	var nivel=$("#nivel").val();
	var etapaF=$("#etapaF").val();
	var tipoF=$("#tipoF").val();
	var clave2F=$("#clave2F").val();
	var serie=$("#serie").val();
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
	var tablaDatos= $("#tblUA");

	$('.multiSelectOptions label').each(function(indice,elemento){
		if($(elemento).hasClass('checked') && indice != 0){
			tablaDatos.append("<tr class='gradeC' style='text-transform:uppercase; font-size:12px;'><td>"+clave1F+"</td><td>"+materia+"</td><td>"+$(elemento).text()+"</td><td>"+etapaF+"</td><td>"+serie+"</td><td>"+tipoF+"</td><td style='text-align:center'>"+coord+"</td><td style='text-align:center'>"+hc+"</td><td style='text-align:center'>"+hl+"</td><td style='text-align:center'>"+ht+"</td><td>"+creditosF+"</td><td style='text-align:center'><input type='button' value='-' class='clsEliminarFila'></td></tr>");
		reset_campos();
		}
	});

	function reset_campos()
	{
		$("#noPlan").val("");
		$("#clave1F").val("");
		$("#materia").val("");
		$("#nivel").val("");
		$("#carrera").val("");
		$("#etapaF").val("");
		$("#tipoF").val("");
		$("#clave2F").val("");
		$("#materiaSeriada").val("");
		$("#seriacion").val("");
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

}