// Construcción de la ventana modal para los catálogos
var idCatalogos = ['plan','unidad','campus','nivel','carrera','etapa','tipo','seriacion','carrera'];

function estructura(id)
{
	var ventana ='<div class="md-modal md-effect-11" id="'+ id +'"> ' +
			'<div class="md-content">'+
				'<h3>Número de Plan</h3>'+
				'<input type="button" value="Agregar" class="clsAgregarFila">'+
				'<input type="button" value="Guardar" class="estilo_button2">'+
				'<input type="button" value="Salir" class="md-close" >'+
			'</div>'+
		'</div>'+
		'<div class="md-overlay"></div>';


	return ventana;

}

function crearCatalogos()
{
	
}


