$(function(){
		//evento que se dispara al hacer clic en el boton para agregar una nueva fila para numero de plan
	$(document).on('click','.clsAgregarFilaNoPlan',function(){
		//almacenamos en una variable todo el contenido de la nueva fila que deseamos
		//agregar. pueden incluirse id's, nombres y cualquier tag... sigue siendo html
		var strNueva_Fila='<tr>'+
			'<td><input type="text" style="width: 60px; height: 25px; border-radius:5px" class="clsAnchoTotal" onKeyPress="ValidaSoloNumeros()" maxlength="6" autofocus></td>'+
			'<td><input type="date" name="fecha" style="width: 140px; height: 25px; border-radius:5px" class="clsAnchoTotal"></td>'+
			'<td><input type="date" name="fecha" style="width: 140px; height: 25px; border-radius:5px" class="clsAnchoTotal"></td>'+
			'<td align="center"><input type="button" value="-" class="clsEliminarFila"/></td>'+
		'</tr>';
				
		/*obtenemos el padre del boton presionado (en este caso queremos la tabla, por eso
		utilizamos get(3)
			table -> padre 3
				tfoot -> padre 2
					tr -> padre 1
						td -> padre 0
		nosotros queremos utilizar el padre 3 para agregarle en la etiqueta
		tbody una nueva fila*/

		var objTabla=$(this).parents().get(0);
		$(objTabla).find('table').find('tbody').append(strNueva_Fila);
		
	});
	
	
	
	//cuando se haga clic en cualquier clase .clsEliminarFila se dispara el evento
	$(document).on('click','.clsEliminarFila',function(){
		/*if(!confirm('¿Desea eliminar el registro?')){
					return;
				}*/
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
					boton --> hijo directo de td (y nieto de tr? si!)
		*/
		var objFila=$(this).parents().get(1);
			/*eliminamos el tr que contiene los datos del contacto (se elimina todo el
			contenido (en este caso los td, los text y logicamente, el boton */
			$(objFila).remove();
	});
	
	//evento que se produce al hacer clic en el boton que elimina una tabla completamente
	$(document).on('click','.clsEliminarTabla',function(){
		var objTabla=$(this).parents().get(3);
			//bajamos la opacidad de la tabla hasta estar invisible
			$(objTabla).animate({'opacity':0},500,function(){
				//eliminar la tabla
				$(this).remove();
			});
	});
	
	//boton para clonar cualquiera de las tablas
	$(document).on('click','.clsClonarTabla',function(){
		var objTabla=$(this).parents().get(4);
			//agregamos un clon de la tabla a la capa contenedora
			$('#divContenedor').append($(objTabla).clone());
	});
			
});