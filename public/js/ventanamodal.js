// Variable JSON para las tablas de los catálogos
var titulos = {
	'plan' :{ 
		'titulo':'Número de Plan',
		'campos':['Código','Descripción','Fecha Inicio','Fecha Final'],
		'action':"registrarnoplan"
	},
	'nivel':{
		'titulo':'Nivel',
		'campos':['Código','Nombre'],
		'action':"registrarnivel"
	},
	'carrera':{
		'titulo':'Carrera',
		'campos':['Código','Nombre','Coordinador'],
		'action':"registrarcarrera"
	},
	'etapa':{
		'titulo':'Etapa',
		'campos':['Código','Nombre'],
		'action':"registraretapa"
	},
	'tipo':{
		'titulo':'Tipo',
		'campos':['Código','Nombre'],
		'action':"registrartipo"
	},
	'seriacion':{
		'titulo':'Seriación',
		'campos':['Código','Nombre'],
		'action':"registrarseriacion"
	},
	'carrera':{
		'titulo':'Carrera',
		'campos':['Código','Nombre'],
		'action':"registrarcarrera"
	},
	'coordinación':{
		'titulo':'Coordinación',
		'campos':['Código','Nombre'],
		'action':"registrarcoordinacion"
	}
};

/**
 * Descripción: Función que crea la estructura de las ventanas modales con el contenido que es una tabla.
 * @param  {string} id     Indica el id que tendra la ventana modal en el catálogo.
 * @param  {string} titulo Título que despliega la tabla modal.
 * @param  {string} tabla  HTML de la tabla para embeberla.
 * @return {string}        Retorna la ventana completa en formato HTML.
 */
function estructura(id,titulo,tabla,action)
{
	var ventana ='<div class="md-modal md-effect-11" id="'+ id +'"> ' +
			'<form  action="'+ action +'" class="md-content" method="post">'+
				'<h3>'+ titulo +'</h3>'+ tabla +
				'<input type="button" value="Agregar" class="clsAgregarFila" />'+
				'<input type="submit" value="Guardar" class="clsActualizarFila" />'+
				'<input type="button" value="Salir" class="md-close" />'+
			'</form>'+
		'</div>';
	return ventana;
}

/**
 * Funcón para crear la tabla que contendra los datos del catalogo
 * @param  {string} encabezados Envia los nombre de los campos del catalogo 
 * @return {string}             Regresa la tabla del catalogo con una fila oculta.
 */
function crearTabla(encabezados)
{
	var tabla = ' <table width="90%" id="modal1"><thead>';
	var renglon = '';
	tabla += "<tr>";
	for(var i in encabezados)
	{
		// Agrega el encabezado a la columna
		tabla += "<th>" + encabezados[i] + "</th>";

		// Agrega los controles del renglon de inicio a la tabla, si es fecha , un control date.
		renglon += '<td>';
		// Si el encabezado contiene fecha agregar control tipo fecha
		if(encabezados[i].lastIndexOf("Fecha",0)!=0)
			renglon += '<input  type="text" style:"width:5px;" />';
		else
			renglon+='<input  type="date" name="fecha" style="width: 200px; height: 25px; border-radius:5px" class="clsAnchoTotal" />';
		renglon += '</td>';
	}
	// Agregar la columna editar y eliminar registro.
	tabla+='<th>Eliminar</th>';

	// Agregar al renglón de inicio en la columna eliminar un botón.
	renglon+='<td width="50" align="center"><input type="button" value="-" class="clsEliminarFila" /></td>';


	
	// Agrega el cuerpo a la tabla que esta compuesta por los inputs.
	tabla += '</tr></thead><tbody><tr  style="display:none;">'+ renglon +'</tr></tbody></table>';
	return tabla;
}

/**
 * Función que agrega las ventanas modales a la estructura html que comprenden los catálogos para la inserción del plan de estudios.
 * @return {string} Regresa las estructuras de las ventanas completas.
 */
function crearCatalogos()
{
	var ventanaCatalogos='';
	// Por cada id en la variable titulos.
	for(var id in titulos)
	{
		// Crear la estructura de la ventana modal (id,titulo,tabla) extraida del JSON
		ventanaCatalogos += estructura(id,titulos[id].titulo,crearTabla(titulos[id].campos),titulos[id].action);
	}
	// Crear evento para disparar las ventanas
	ventanaCatalogos += '<div class="md-overlay"></div>';
	
	return ventanaCatalogos;
}


/* AGREGAR ACCIONES AL BOTON GUARDAR
$(function(){

	//$(document).on('click','.clsAgregarFila',function(){
	$('.clsAgregarFila').on('click',function(){
		
		//event.stopPropagation();
		// Obtenermos la tabla del elemento anterior al boton Agregar
		var tabla = $(this).prev().get();
		// Copiamos la primer fila de la tabla del catálogo y la clonamos
		var strNueva_Fila = $(tabla).find('tbody').find('tr:eq(-1)').clone().get();
		// Remover el estilo oculto para mostrar el row
		$(strNueva_Fila).css('display','table-row');
		// Agregamos la nueva fila a la tabla
		$(tabla).find('tbody').prepend(strNueva_Fila);

		// Deshabilitamos la acción hasta que guraden registro.
		$(this).css('background', '#BDBDBD');
		//$(this).off('click');
		
	});

	
	//Cuando se haga clic en cualquier clase .clsEliminarFila se dispara el evento.
	//$(document).on('click','.clsEliminarFila',function(){
	$(document).on('click','.clsEliminarFila',function(){
		var t = $('tblUA').DataTable;
		
		if(!confirm('¿Desea eliminar el registro?'))
		{
			return;
		}
		

		var objCuerpo=$(this).parents().get(2);
		if($(objCuerpo).find('tr').length==2){
			if(!confirm('Esta es la única fila de la lista ¿Desea eliminarla?')){
				return;
			}
		}

		var objFila=$(this).parents().get(1);
		t.row(objFila).remove().draw(false);
	});


});*/
