// Variable JSON para las tablas de los catálogos
var titulos = {
	'plan' :{ 
		'titulo':'Número de Plan',
		'campos':['Clave','Nombre','Fecha Inicio','Fecha Final','Eliminar']
	},
	'unidad':{
		'titulo':'Unidad Acádemica',
		'campos':['Código','Nombre','Administrador','Subdirector']
	},
	'campus':{
		'titulo':'Campus',
		'campos':['Código','Ciudad','Dirección']
	},
	'nivel':{
		'titulo':'Nivel',
		'campos':['Código','Nombre']
	},
	'carrera':{
		'titulo':'Carrera',
		'campos':['Código','Nombre','Coordinador']
	},
	'etapa':{
		'titulo':'Etapa',
		'campos':['Código','Nombre']
	},
	'tipo':{
		'titulo':'Tipo',
		'campos':['Código','Nombre']
	},
	'seriacion':{
		'titulo':'Seriación',
		'campos':['Código','Nombre']
	},
	'carrera':{
		'titulo':'Carrera',
		'campos':['Código','Nombre']
	},
	'coordinación':{
		'titulo':'Coordinación',
		'campos':['Código','Nombre']
	}
};


function estructura(id,titulo,tabla)
{
	var ventana ='<div class="md-modal md-effect-11" id="'+ id +'"> ' +
			'<div class="md-content">'+
				'<h3>'+ titulo +'</h3>'+ tabla +
				'<input type="button" value="Agregar" class="clsAgregarFilaNoPlan" />'+
				'<input type="button" value="Guardar" class="estilo_button2" />'+
				'<input type="button" value="Salir" class="md-close" />'+
			'</div>'+
		'</div>';
	return ventana;
}

function crearCatalogos()
{
	var ventanaCatalogos='';

	for(var idKey in titulos)
	{
		ventanaCatalogos += estructura(idKey,titulos[idKey].titulo,crearTablas(titulos[idKey].campos));
	}
	ventanaCatalogos += '<div class="md-overlay"></div>';
	
	return ventanaCatalogos;
}



function crearTablas(encabezados)
{
	var table = ' <table width="100%" id="modal1"><thead>';
	table += "<tr>";
	for(var i in encabezados)
	{
		table += "<th>" + encabezados[i] + "</th>";
	}
	table += '</tr></thead><tbody></tbody></table>';
	return table;
}

/*$(function(){
	$(document).on('click','.clsAgregarFilaNoPlan',function(){
		//almacenamos en una variable todo el contenido de la nueva fila que deseamos
		//agregar. pueden incluirse id's, nombres y cualquier tag... sigue siendo html
		var strNueva_Fila='<tr>'+
			'<td><input type="text" style="width: 60px; height: 25px; border-radius:5px" class="clsAnchoTotal" onKeyPress="ValidaSoloNumeros()" maxlength="6" autofocus></td>'+
			'<td><input type="date" name="fecha" style="width: 140px; height: 25px; border-radius:5px" class="clsAnchoTotal"></td>'+
			'<td><input type="date" name="fecha" style="width: 140px; height: 25px; border-radius:5px" class="clsAnchoTotal"></td>'+
			'<td align="center"><input type="button" value="-" class="clsEliminarFila"/></td>'+
		'</tr>';


		var objTabla=$(this).parents().get(0);
		$(objTabla).find('table').find('tbody').append(strNueva_Fila);
});*/