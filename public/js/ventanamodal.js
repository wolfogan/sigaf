// Construcción de la ventana modal para los catálogos
var idCatalogos = ['plan','unidad','campus','nivel','carrera','etapa','tipo','seriacion','carrera'];
var titulosCatalogos = ['Número de Plan','Unidad Acádemica','Campus','Nivel','Carrera','Etapa','Tipo','Seriación','Carrera'];

var ejemplo = '<div id="tablita"><div id="tablita2"><table id="modal1" width="461"><thead><tr><th width="82" height="28">Clave</th><th width="82" height="28">Nombre</th><th width="82">Fecha inicio</th><th width="82">Fecha fin</th><th>Elim.</th></tr></thead><tbody><tr><td><input type="text" style="width: 60px; height: 25px; border-radius:5px" class="clsAnchoTotal" onkeypress="ValidaSoloNumeros()" maxlength="6" autofocus></td><td><input type="text" style="width: 60px; height: 25px; border-radius:5px" class="clsAnchoTotal" maxlength="6" autofocus></td><td><input type="date" name="fecha" style="width: 80px; height: 25px; border-radius:5px" class="clsAnchoTotal"></td><td><input type="date" name="fecha" style="width: 80px; height: 25px; border-radius:5px" class="clsAnchoTotal"></td><td width="50" align="center"><input type="button" value="-" class="clsEliminarFila"/></td></tr></tbody></table></div></div>';

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
		tablaCatalogos += estructura(idCatalogos[i],titulosCatalogos[i],ejemplo);
	}
	tablaCatalogos += '<div class="md-overlay"></div>';
	
	return tablaCatalogos;
}


