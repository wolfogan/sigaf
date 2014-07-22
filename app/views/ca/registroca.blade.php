<!doctype html>
<html lang="es">
	
	<head>
		<meta charset="utf-8"/>
		<!-- -------------------------------- Estilos CSS -------------------------------- -->
		<link rel="stylesheet" type="text/css" href="../css/normalize.css">
		<link rel="stylesheet" type="text/css" href="../css/estiloPrincipal.css">
		<link rel="stylesheet" type="text/css" href="../css/estilosnav.css">
		<link rel="stylesheet" type="text/css" href="../css/component.css"/>

		<!---------------------------------- Para combobox multiple new ---------------------->
		<link rel="stylesheet" href="../css/bootstrap-3.1.1.min.css" type="text/css">
		<link rel="stylesheet" href="../css/bootstrap-multiselect.css" type="text/css">
		<link rel="stylesheet" href="../css/prettify.css" type="text/css">
		<!---------------------------------------------------------------------------------------->

		
		<!---------------------------------- Checkboxlist -------------------------------------->
		
		<link rel="stylesheet" href="../css/jqx.base.css" type="text/css" />
   		<link rel="stylesheet" href="../css/jqx.orange.css" type="text/css" />

   		<script type="text/javascript" src="../js/jquery.js"></script>
		<script type="text/javascript" src="../js/jquery-1.10.2.min.js"></script>
        
		
								<script type="text/javascript">
						            $(document).ready(function () {
						                var source = [
						                    "Affogato",
						                    "Americano",
						                    "Bicerin",
						                    "Breve",
						                    "Café Bombón",
						                    "Café au lait",
						                    "Caffé Corretto",
						                    "Café Crema",
						                    "Caffé Latte",
						                    "Caffé macchiato",
						                    "Café mélange",
						                    "Coffee milk",
						                    "Cafe mocha",
						                    "Cappuccino",
						                    "Carajillo",
						                    "Cortado",
						                    "Cuban espresso",
						                    "Espresso",
						                    "Eiskaffee",
						                    "The Flat White",
						                    "Frappuccino",
						                    "Galao",
						                    "Greek frappé coffee",
						                    "Iced Coffee﻿",
						                    "Indian filter coffee",
						                    "Instant coffee",
						                    "Irish coffee",
						                    "Liqueur coffee"
								        ];

						                // Create a jqxListBox
						                $(".listbox").jqxListBox({width: 450, source: source, checkboxes: true, height: 530, theme: 'orange'});
						                // Check several items.
						                $(".listbox").jqxListBox('checkIndex', 0);
						                $(".listbox").jqxListBox('checkIndex', 1);
						                $(".listbox").jqxListBox('checkIndex', 2);
						                $(".listbox").jqxListBox('checkIndex', 5);

						                $(".listbox").on('checkChange', function (event) {
						                    var args = event.args;
						                    if (args.checked) {
						                        $("#Events").text("Checked: " + args.label);
						                    }
						                    else {
						                        $("#Events").text("Unchecked: " + args.label);
						                    }

						                    var items = $(".listbox").jqxListBox('getCheckedItems');
						                    var checkedItems = "";
						                    $.each(items, function (index) {
						                        if (index < items.length - 1) {
						                            checkedItems += this.label + ", ";
						                        }
						                        else checkedItems += this.label;
						                    });
						                    $("#CheckedItems").text(checkedItems);
						                });
						            });
						        </script>	

					    
		<!------------------------------------------------------------------------------------->
	        


		<!--AQUI VA HORA Y FECHA-->
		<script src="../js/tiempoactual.js"></script>
		<script>$(function(){startWatch(); return false;});</script>
		<!-- Script tiempo -->

		<!---------------------------------- Para combo multiple scripts ---------------------------->
		<script type="text/javascript" src="../js/jquery-2.1.0.min.js"></script>
		<script type="text/javascript" src="../js/bootstrap-3.1.1.min.js"></script>
		<script type="text/javascript" src="../js/bootstrap-multiselect.js"></script>
		<script type="text/javascript" src="../js/prettify.js"></script>

							<div class="containerMultiple">
								<script type="text/javascript">
							    	$(document).ready(function() {
							        window.prettyPrint() && prettyPrint();

				                    $('.example41').multiselect({
							        	includeSelectAllOption: true
							        });

							    });
								</script>
			            	</div>


		<!-------------------------------------------------------------------------------------------->
      	

      	<!-- ------------------------------ DATATABLES --------------------------------------->
		
		<!-- CSS -->
		<link rel="stylesheet" type="text/css" href="../css/jquery.dataTables.css">
		<!-- JS -->
		<script src="../js/jquery.dataTables.js"></script>

		<!-- ---------------------------------------------------------------------------------->
		<!-- Script dataTable -->
		<script type="text/javascript" src="../js/jquery.dataTables.js"></script>
		<script type="text/javascript" charset="utf-8">
			$(document).ready(function() {
				$('#tblUA').dataTable();
			} );
		</script><!-- Termina script dataTable -->

		<!-------------------------------------- MODAL CATALOGO PERIODOS -------------------------------------->
	<div class="md-modal md-effect-11" id="btnCatalogoPeriodo"> 
		<h3>Agregar Periodo</h3>
			<div class="tblCatalogos">
				<table class="tblCatPlan">
					<tr>
						<th></th>
						<th></th>
					</tr>
					<tr>
						<td>Nombre:</td>
						<td><input style="width: 200px; height: 30px; border-radius: 5px; border-color: #DBDBEA;" type="text" id="txtNombrePeriodo" size=1 /></td>
					</tr>
					<tr>
						<td>Fecha inicio:</td>
						<td><input style="width: 200px; height: 30px; border-radius: 5px; border-color: #DBDBEA;" type="date" id="txtFechaIniPeriodo" name='txtFechaIniPeriodo' size=1 /></td>
					</tr>
					<tr>
						<td>Fecha fin:</td>
						<td><input style="width: 200px; height: 30px; border-radius: 5px; border-color: #DBDBEA;" type="date" id="txtFechaFinPeriodo" name='txtFechaFinPeriodo' size=1 /></td>
					</tr>
				</table>
			</div>
			<div class="CatBotones">
				<input type="submit" class="estilo_button2" value="Guardar"/>
				<input type="button" value="Salir" class="md-close" />
			</div>
		</form>
	</div>

	<!-------------------------------------- MODAL CATALOGO GRUPOS -------------------------------------->
	<div class="md-modal md-effect-11" id="btnCatalogoGrupo"> 
		<h3>Agregar Etapa</h3>
			<div class="tblCatalogos">
				<table class="tblCatPlan">
					<tr>
						<th></th>
						<th></th>
					</tr>
					<tr>
						<td>Nombre:</td>
						<td><input style="width: 200px; height: 30px; border-radius: 5px; border-color: #DBDBEA;" type="text" id="txtNombreGpo" size=1 /></td>
					</tr>
					<tr>
						<td>Semestre:</td>
						<td><input style="width: 200px; height: 30px; border-radius: 5px; border-color: #DBDBEA;" type="date" id="txtSemestreGpo" name='txtSemestreGpo' size=1 /></td>
					</tr>
					<tr>
						<td>Turno:</td>
						<td><input style="width: 200px; height: 30px; border-radius: 5px; border-color: #DBDBEA;" type="date" id="txtTurnoGpo" name='txtTurnoGpo' size=1 /></td>
					</tr>
				</table>
			</div>
			<div class="CatBotones">
				<input type="submit" class="estilo_button2" value="Guardar"/>
				<input type="button" value="Salir" class="md-close" />
			</div>
		</form>
	</div>

	<div class="md-overlay"></div>

	<!------------------------------------------------------------------------------>

	</head>

	<body>
		
		<header>
			<figure id="logo"><img src="../imagenes/logo.png" alt=""></figure>
			<div id="titulo">
				<h1>SISTEMA DE GESTIÓN ACADÉMICA (SIGAF)</h1>
				<h3>Facultad de Contaduría y Administración</h3>
			</div>
			<figure id="cimarron"><img src="../imagenes/cimarron.png" alt=""></figure>
		</header>
 		@include('includes.menu')
		<div id="indicadores">
			<div id="usuariofecha">
				<div id="usuario" class="texto_body">
					Usuario: {{Auth::user()->username}}
				</div>
				<div id="fecha" class="texto_body">
					Fecha Actualizada
				</div>
			</div>
			<div id="ubicacion" class="texto_body">
				Carga Académica: Registro
			</div>
			<div id="loginmanual">
				<div id="login" class="texto_body">
					<img src="../imagenes/login.png" alt="">&nbsp;<a href="<?=URL::to('login/logout');?>"style="text-decoration:none; color:#004000;">Logout</a>
				</div>
				<div id="manual" class="texto_body">
					<img src="../imagenes/manual.png" alt="">&nbsp;Manual
				</div>
			</div>
		</div>

		<section>

			<div class="contenedor_Ca">
				<div class="nombre_coordinacion">Lic. en Informática</div>

			<!--------------------- CONTROLES SUPERIOR DERECHO ------------------>

				<div id="periodoCa">
					<div id="btnNuevaCaDiv"><input type="button" style="width:200px;" class="estilo_button2" value="Nueva CA" name="btnNuevaCa" id="btnNuevaCa" /></div>

					<div id="divPeriodo">Periódo: <input type="text" class="con_estilo" name="txtPeriodoCa" id="txtPeriodoCa"/>
					<input type="button" class="md-trigger" value="+" data-modal="btnCatalogoPeriodo" id="btnCatalogoPeriodo" /></div>

				</div>

			<!----------------------- LISTA PLAN VIGENTE ------------------------>

				<div id="planVigente">
					<fieldset id="planV"><legend>Plan vigente</legend>
						<div class="nombrePlan">Plan 2014-1</div>

						<div class="filtroMaterias_ca">Materias: 							
							<select class="con_estilo" style="width:135px; height:30px" name="semestre_ca" size=1>
								<option value="OBLIGATORIAS">OBLIGATORIAS</option>
								<option value="OPTATIVAS">OPTATIVAS</option>
								
							</select>
						</div>


							<div class="listasCa">
								
					            <div class="listbox"></div>
				           
				        	</div>

				        	<label>Semestre: </label>
							<select class="con_estilo" style="width:135px; height:30px" name="semestre_ca" size=1>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
							</select>
							
						<div class="controlesListasCa">
							Grupos:
							
					            
					              	<select name="example" multiple="multiple" class="example41">
						                <option value="cheese" selected>Cheese</option>
						                <option value="tomatoes" selected>Tomatoes</option>
						                <option value="mozarella" selected>Mozzarella</option>
						                <option value="mushrooms" selected>Mushrooms</option>
						                <option value="pepperoni" selected>Pepperoni</option>
						                <option value="onions" selected>Onions</option>
					                </select>
					             

							<input type="button" class="md-trigger" value="+" data-modal="btnCatalogoGrupo" id="btnCatalogoGrupo" />
							<input type="button" style="width:180px" value="Generar Carga"  class="estilo_button2" name="btnGuardarCa" id="btnGuardarCa" />
						</div>

					</fieldset>	
				</div>	

			<!----------------------- BOTON PLAN ANTERIOR ------------------------>

				<div id="btnPlanA">
					<input type="button" style="width:200px;" class="estilo_button2" value="Plan Anterior" name="planAntCa" id="planAntCa" />

				</div>


			<!----------------------- LISTA PLAN ANTERIOR ------------------------>

				<div id="planAnterior"		>
					<fieldset id="planA"><legend>Plan anterior </legend>
						<div class="nombrePlan">Plan 2009-2</div>
						<div class="filtroMaterias_ca">Materias: 							
							<select class="con_estilo" style="width:135px; height:30px" name="semestre_ca" size=1>
								<option value="OBLIGATORIAS">OBLIGATORIAS</option>
								<option value="OPTATIVAS">OPTATIVAS</option>
								
							</select>
						</div>
						<div class="listasCa">
							 <div class="listbox"></div>           
						</div>

						<label>Semestre: </label>
							<select class="con_estilo" style="width:135px; height:30px" name="semestre_ca" size=1>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
							</select>

						<div class="controlesListasCa">
							Grupos:
							
					            
					              	<select name="example" multiple="multiple" class="example41">
						                <option value="cheese" selected>Cheese</option>
						                <option value="tomatoes" selected>Tomatoes</option>
						                <option value="mozarella" selected>Mozzarella</option>
						                <option value="mushrooms" selected>Mushrooms</option>
						                <option value="pepperoni" selected>Pepperoni</option>
						                <option value="onions" selected>Onions</option>
					                </select>
					             

							<input type="button" class="md-trigger" value="+" data-modal="btnCatalogoGrupo" id="btnCatalogoGrupo" />
							<input type="button" style="width:180px" value="Generar Carga"  class="estilo_button2" name="btnGuardarCa" id="btnGuardarCa" />
						</div>

					</fieldset>


				</div>

				<div id="contenedorRegistroca_mostrar">
					<table cellpadding="0" cellspacing="0" border="0" class="display" id="tblUA">
						<thead class="semestre_plan">
							<tr>
								<th>SEMESTRE: 6</th>
								<th>PLAN: 2014-1</th>
							
							</tr>
						</thead>
						<thead class="encabezado_tabla">
							<tr>
								<th>CLAVE</th>
								<th>MATERIA</th>
								<th>NO. CREDITOS</th>
								<th>HC</th>
								<th>ETAPA</th>
								<th>REQ. SERIACION</th>
								<th>ELIMINAR</th>
							
							</tr>
						</thead>
						
						<tbody>
							<tr>
								<td>000453</td>
								<td>DESARROLLO SUSTENTABLE</td>
								<td>20</td>
								<td>21</td>
								<td>BASICA</td>
								<td>none</td>
								<td><input type="button" value="-" title='Eliminar' class="clsEliminarFila" id="eliminar"/></td>	
							</tr>
							<tr>
								<td>000454</td>
								<td>ARQ. DE LA INFO.</td>
								<td>15</td>
								<td>14</td>
								<td>BASICA</td>
								<td>none</td>	
								<td><input type="button" value="-" title='Eliminar' class="clsEliminarFila" id="eliminar"/></td>
							</tr>
							<tr>
								<td>000455</td>
								<td>PRINCIPIOS DE PROGRAMACION</td>
								<td>9</td>
								<td>12</td>
								<td>BASICA</td>
								<td>none</td>
								<td><input type="button" value="-" title='Eliminar' class="clsEliminarFila" id="eliminar"/></td>
							</tr>
							<tr>
								<td>000456</td>
								<td>MATEMATICAS I</td>
								<td>2</td>
								<td>20</td>
								<td>BASICA</td>
								<td>none</td>
								<td><input type="button" value="-" title='Eliminar' class="clsEliminarFila" id="eliminar"/></td>	
							</tr>
							<tr>
								<td>000457</td>
								<td>FISICA I</td>
								<td>4</td>
								<td>30</td>
								<td>BASICA</td>
								<td>none</td>
								<td><input type="button" value="-" title='Eliminar' class="clsEliminarFila" id="eliminar"/></td>
							</tr>
							<tr>
								<td>000458</td>
								<td>ORIENTACION VOCACIONAL</td>
								<td>10</td>
								<td>20</td>
								<td>BASICA</td>
								<td>none</td>
								<td><input type="button" value="-" title='Eliminar' class="clsEliminarFila" id="eliminar"/></td>
							</tr>
							<tr>
								<td>000459</td>
								<td>QUIMICA I</td>
								<td>9</td>
								<td>20</td>
								<td>BASICA</td>
								<td>none</td>
								<td><input type="button" value="-" title='Eliminar' class="clsEliminarFila" id="eliminar"/></td>	
							</tr>
							<tr>
								<td>000460</td>
								<td>ESTRUCTURA DE DATOS</td>
								<td>2</td>
								<td>4</td>
								<td>BASICA</td>
								<td>none</td>
								<td><input type="button" value="-" title='Eliminar' class="clsEliminarFila" id="eliminar"/></td>
							</tr>
							
						<thead class="encabezado_tabla">
							<tr>
								<th>OPTATIVAS</th>
							</tr>
						</thead>
						<tr>
								<td>000459</td>
								<td>QUIMICA I 231, 233, 234</td>
								<td>9</td>
								<td>20</td>
								<td>BASICA</td>
								<td>none</td>
								<td><input type="button" value="-" title='Eliminar' class="clsEliminarFila" id="eliminar"/></td>	
							</tr>
							<tr>
								<td>000460</td>
								<td>ESTRUCTURA DE DATOS 235, 236</td>
								<td>2</td>
								<td>4</td>
								<td>BASICA</td>
								<td>none</td>
								<td><input type="button" value="-" title='Eliminar' class="clsEliminarFila" id="eliminar"/></td>
							</tr>
							<thead class="encabezado_tabla">
								<td>GRUPOS Y TURNOS: </td>
							</thead>
							<td>231 TM, 232 TM, 233 TI, 234 TI, 235 TN, 236 TN</td>

						</tbody>	
					</table>
					<div id="btnGuardarCa_registro">
						<input type="button" style="width:180px" value="Guardar Carga"  class="estilo_button2" name="btnGuardarCa" id="btnGuardarCa" />
					</div>
				</div>


			</div>


				
		</section>
		<script type="text/javascript" src="../js/jqxcore.js"></script>
	    <script type="text/javascript" src="../js/jqxbuttons.js"></script>
	    <script type="text/javascript" src="../js/jqxscrollbar.js"></script>
	    <script type="text/javascript" src="../js/jqxlistbox.js"></script>
	    <script type="text/javascript" src="../js/jqxcheckbox.js"></script>



		<footer></footer>
		<!--SCRIPT PARA VENTANA MODAL-->
	<script src="../js/classie.js"></script>
	<script src="../js/css-filters-polyfill.js"></script>
	<!--SCRIPT PARA VENTANA MODAL-->
	</body>



</html>