// Variable JSON para las tablas de los catálogos
var titulos = {
	'plan' :{ 
		'titulo':'Número de Plan',
		'campos':['Clave','Nombre','Fecha Inicio','Fecha Final']
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

/**
 * Descripción: Función que crea la estructura de las ventanas modales con el contenido que es una tabla.
 * @param  {string} id     Indica el id que tendra la ventana modal en el catálogo.
 * @param  {string} titulo Título que despliega la tabla modal.
 * @param  {string} tabla  HTML de la tabla para embeberla.
 * @return {string}        Retorna la ventana completa en formato HTML.
 */
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


function crearTabla(encabezados)
{
	var tabla = ' <table width="90%" id="modal1"><thead>';
	var renglon = '';
	tabla += "<tr>";
	for(var i in encabezados)
	{
		tabla += "<th>" + encabezados[i] + "</th>";
		renglon += '<td>';
		renglon += '<input type="text" style:"width:5px;" />';
		renglon += '</td>';
	}
	// Agregar la columna eliminar registro.
	tabla+='<th>Eliminar</th>';

	// Agregar al renglón de inicio en la columna eliminar un botón.
	renglon+='<td width="50" align="center"><input type="button" value="-" class="clsEliminarFila"/></td>';
	
	tabla += '</tr></thead><tbody><tr>'+ renglon +'</tr></tbody></table>';
	return tabla;
}

function crearCatalogos()
{
	var ventanaCatalogos='';

	for(var id in titulos)
	{
		ventanaCatalogos += estructura(id,titulos[id].titulo,crearTabla(titulos[id].campos));
	}
	ventanaCatalogos += '<div class="md-overlay"></div>';
	
	return ventanaCatalogos;
}


// AGREGAR ACCIONES AL BOTON AGRE
$(function(){
	$(document).on('click','.clsAgregarFilaNoPlan',function(){
		
		// Obtenermos la tabla del elemento anterior al boton Agregar
		var tabla = $(this).prev().get();
		// Copiamos la primer fila de la tabla del catálogo y la clonamos
		var strNueva_Fila = $(tabla).find('tbody').find('tr:eq(0)').clone().get();
		// Agregamos la nueva fila a la tabla
		$(tabla).find('tbody').append(strNueva_Fila);


	});

//cuando se haga clic en cualquier clase .clsEliminarFila se dispara el evento
	$(document).on('click','.clsEliminarFila',function(){
		if(!confirm('¿Desea eliminar el registro?'))
		{
					return;
		}
		/*obtener el cuerpo de la tabla; contamos cuantas filas (tr) tiene
		si queda solamente una fila le preguntamos al usuario si desea eliminarla*/
		var objCuerpo=$(this).parents().get(2);
			if($(objCuerpo).find('tr').length==1){
				if(!confirm('Esta es la única fila de la lista ¿Desea eliminarla?')){
					return;
				}
			}
					
		/*obtenemos el padre (tr) del td que contiene a nuestro boton de eliminar
		que quede claro: estamos obteniendo dos padres
					
		el asunto de los padres e hijos funciona exactamente como en la vida real
		es una jergarquia. imagine un arbol genealogico y tendra todo claro ;)
				
			tr	--> padre del td que contiene el boton
				td	--> hijo de tr y padre del boton
					boton --> hijo directo de td (y nieto de tr? si!) */
		
		var objFila=$(this).parents().get(1);
			/*eliminamos el tr que contiene los datos del contacto (se elimina todo el
			contenido (en este caso los td, los text y logicamente, el boton */
			$(objFila).remove();
	});
});
