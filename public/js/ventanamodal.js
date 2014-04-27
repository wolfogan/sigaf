// Construcción de la ventana modal para los catálogos
var idCatalogos = ['plan','unidad','campus','nivel','carrera','etapa','tipo','seriacion','carrera'];
var titulosCatalogos = ['Número de Plan','Unidad Acádemica','Campus','Nivel','Carrera','Etapa','Tipo','Seriación','Carrera'];

//var titulos = ["Clave","Nombre","Fecha inicio", "Fecha fin","Eliminar"];

var titulos = {
	'plan' : ['Clave','Nombre','Fecha Inicio','Fecha Final','Eliminar'],
	'unidad':['Código','Nombre','Administrador','Subdirector'],
	'campus':['Código','Ciudad','Dirección'],
	'nivel':['Código','Nombre'],
	'carrera':['Código','Nombre','Coordinador'],
	'etapa':['Código','Nombre'],
	'tipo':['Código','Nombre'],
	'seriacion':['Código','Nombre'],
	'carrera':['Código','Nombre']
};

var ejemplo ='<table id="modal1" style="margin:0 auto;" width="100%"><thead><tr><th >Clave</th><th >Nombre</th><th >Fecha inicio</th><th >Fecha fin</th><th>Elim.</th></tr></thead><tbody><tr><td><input type="text" onkeypress="ValidaSoloNumeros()" maxlength="6" autofocus></td><td><input type="text"  maxlength="6" autofocus></td><td><input type="date" name="fecha" ></td><td><input type="date" name="fecha" ></td><td width="50" align="center"><input type="button" value="-" class="clsEliminarFila"/></td></tr></tbody></table>';

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
	var tablaCatalogos='';
	for(var i in idCatalogos)
	{
		tablaCatalogos += estructura(idCatalogos[i],titulosCatalogos[i],crearTablas(titulos.unidad));
	}
	tablaCatalogos += '<div class="md-overlay"></div>';
	
	return tablaCatalogos;
}



function crearTablas(encabezados)
{
	var table = ' <table width="100%" id="modal1"><thead>';
	table += "<tr>";
	for(var i in encabezados)
	{
		table += "<th>" + encabezados[i] + "</th>";
	}
	table += '</tr></thead><tbody><tr><td><input type="text" style="width: 100%; height: 30px; border-radius:5px; font-size:20px;" class="clsAnchoTotal" onkeypress="ValidaSoloNumeros()" maxlength="6" autofocus></td></tr></tbody></table>';
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