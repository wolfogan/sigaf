// Construcción de la ventana modal para los catálogos
var idCatalogos = ['plan','unidad','campus','nivel','carrera','etapa','tipo','seriacion','carrera'];
var titulosCatalogos = ['Número de Plan','Unidad Acádemica','Campus','Nivel','Carrera','Etapa','Tipo','Seriación','Carrera'];

function estructura(id,titulo)
{
	var ventana ='<div class="md-modal md-effect-11" id="'+ id +'"> ' +
			'<div class="md-content">'+
				'<h3>'+ titulo +'</h3>'+
				'<input type="button" value="Agregar" class="clsAgregarFila">'+
				'<input type="button" value="Guardar" class="estilo_button2">'+
				'<input type="button" value="Salir" class="md-close" >'+
			'</div>'+
		'</div>';


	return ventana;

}

function crearCatalogos()
{
	var tablaCatalogos;
	for(var i in idCatalogos)
	{
		tablaCatalogos += estructura(idCatalogos[i],titulosCatalogos[i]);
	}
	tablaCatalogos += '<div class="md-overlay"></div>';
	
	return tablaCatalogos;
}


