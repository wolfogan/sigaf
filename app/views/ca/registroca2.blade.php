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

		<!-- Creación de Ventanas Modales -->
		<script src="../js/ventanamodal.js"></script>
		

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
						                $(".listbox").jqxListBox({width: 408, source: source, checkboxes: true, height: 200, theme: 'orange'});
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
						                $(".listbox1").jqxListBox({width: 408, source: source, checkboxes: true, height: 350, theme: 'orange'});
						                // Check several items.
						                $(".listbox1").jqxListBox('checkIndex', 0);
						                $(".listbox1").jqxListBox('checkIndex', 1);
						                $(".listbox1").jqxListBox('checkIndex', 2);
						                $(".listbox1").jqxListBox('checkIndex', 5);

						                $(".listbox1").on('checkChange', function (event) {
						                    var args = event.args;
						                    if (args.checked) {
						                        $("#Events").text("Checked: " + args.label);
						                    }
						                    else {
						                        $("#Events").text("Unchecked: " + args.label);
						                    }

						                    var items = $(".listbox1").jqxListBox('getCheckedItems');
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
		<form  action="<?=URL::to('planestudio/registraretapa'); ?>" class="md-content" method="post">
			<h3>Agregar Periodos</h3>
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
		<form  action="<?=URL::to('planestudio/registraretapa'); ?>" class="md-content" method="post">
			<h3>Agregar Grupos</h3>
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

	<!-------------------------------------- MODAL PLAN DE ESTUDIOS -------------------------------------->
	<div class="md-modal md-effect-11" id="btnAgregarUa"> 
		<form  action="<?=URL::to('planestudio/registraretapa'); ?>" class="md-content" method="post">
			<h3>Unidades de aprendizaje</h3>
			<div class="tblCatalogos">
				
					        <div class="listasCa">	
					            <div class="listbox1" style="margin:auto;"></div>
				        	</div>
				        	 
			</div>
			<div class="CatBotones">
				<input type="submit" class="estilo_button2" value="Agregar"/>
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

			<div class="contenedorCa">
				<div class="nombre_coordinacion">Lic. en Informática</div>

			<!--------------------- CONTROLES SUPERIOR DERECHO ------------------>

				<div id="periodoCa">
					<div id="btnNuevaCaDiv"><input type="button" style="width:200px;" class="estilo_button2" value="Nueva CA" name="btnNuevaCa" id="btnNuevaCa" /></div>

					<div id="divPeriodo">Periódo: <input type="text" class="con_estilo" name="txtPeriodoCa" id="txtPeriodoCa"/>
					<input type="button" class="md-trigger" value="+" data-modal="btnCatalogoPeriodo" id="btnCatalogoPeriodo" /></div>

				</div>

			<!----------------------- LISTA PRIMER SEMESTRE ------------------------>

				<div class="carga_listas" style="margin-top:20px;">
					
						<div class="nombre_semestre">SEMESTRE: 1</div>
						<div class="nombre_plan">2014-1</div>

						<div class="filtroMaterias_ca2">Materias: 							
							<select class="con_estilo" style="width:135px; height:30px" name="filtro_materias_ca2" size=1>
								<option value="OBLIGATORIAS">OBLIGATORIAS</option>
								<option value="OPTATIVAS">OPTATIVAS</option>
								
							</select>
						</div>
							<div class="listasCa">	
					            <div class="listbox"></div>
				        	</div>
						
						<div class="controlesListasCa_2">
							Grupos:
					              	<select name="example" multiple="multiple" class="example41">
						                <option value="231" selected>231</option>
						                <option value="232" selected>232</option>
						                <option value="241" selected>241</option>
						                <option value="242" selected>242</option>
						                <option value="251" selected>251</option>
						                <option value="252" selected>252</option>
					                </select>
					             

							<input type="button" class="md-trigger" value="+" data-modal="btnCatalogoGrupo" id="btnCatalogoGrupo" />
							<input type="button" class="md-trigger" value="UA" style="width:40px;" data-modal="btnAgregarUa" id="btnAgregarUa" />
							<input type="button" style="width:100px" value="Guardar"  class="estilo_button2" name="btnGuardarCa" id="btnGuardarCa" />
						</div>
				</div>	


				<!----------------------- LISTA SEGUNDO SEMESTRE ------------------------>

				<div class="carga_listas">
					
						<div class="nombre_semestre">SEMESTRE: 2</div>
						<div class="nombre_plan">2014-1</div>
						<div class="filtroMaterias_ca2">Materias: 							
							<select class="con_estilo" style="width:135px; height:30px" name="filtro_materias_ca2" size=1>
								<option value="OBLIGATORIAS">OBLIGATORIAS</option>
								<option value="OPTATIVAS">OPTATIVAS</option>
								
							</select>
						</div>
							<div class="listasCa">	
					            <div class="listbox"></div>
				        	</div>
						
						<div class="controlesListasCa_2">
							Grupos:
					              	<select name="example" multiple="multiple" class="example41">
						                <option value="231" selected>231</option>
						                <option value="232" selected>232</option>
						                <option value="241" selected>241</option>
						                <option value="242" selected>242</option>
						                <option value="251" selected>251</option>
						                <option value="252" selected>252</option>
					                </select>
					             

							<input type="button" class="md-trigger" value="+" data-modal="btnCatalogoGrupo" id="btnCatalogoGrupo" />
							<input type="button" class="md-trigger" value="UA" style="width:40px;" data-modal="btnAgregarUa" id="btnAgregarUa" />
							<input type="button" style="width:100px" value="Guardar"  class="estilo_button2" name="btnGuardarCa" id="btnGuardarCa" />
						</div>
				</div>	

				<!----------------------- LISTA TERCER SEMESTRE ------------------------>

				<div class="carga_listas">
					
						<div class="nombre_semestre">SEMESTRE: 3</div>
						<div class="nombre_plan">2014-1</div>
						<div class="filtroMaterias_ca2">Materias: 							
							<select class="con_estilo" style="width:135px; height:30px" name="filtro_materias_ca2" size=1>
								<option value="OBLIGATORIAS">OBLIGATORIAS</option>
								<option value="OPTATIVAS">OPTATIVAS</option>
								
							</select>
						</div>
							<div class="listasCa">	
					            <div class="listbox"></div>
				        	</div>
						
						<div class="controlesListasCa_2">
							Grupos:
					              	<select name="example" multiple="multiple" class="example41">
						                <option value="231" selected>231</option>
						                <option value="232" selected>232</option>
						                <option value="241" selected>241</option>
						                <option value="242" selected>242</option>
						                <option value="251" selected>251</option>
						                <option value="252" selected>252</option>
					                </select>
					             

							<input type="button" class="md-trigger" value="+" data-modal="btnCatalogoGrupo" id="btnCatalogoGrupo" />
							<input type="button" class="md-trigger" value="UA" style="width:40px;" data-modal="btnAgregarUa" id="btnAgregarUa" />
							<input type="button" style="width:100px" value="Guardar"  class="estilo_button2" name="btnGuardarCa" id="btnGuardarCa" />
						</div>
				</div>	

				<!----------------------- LISTA CUARTO SEMESTRE ------------------------>

				<div class="carga_listas">
					
						<div class="nombre_semestre">SEMESTRE: 4</div>
						<div class="nombre_plan">2014-1</div>
						<div class="filtroMaterias_ca2">Materias: 							
							<select class="con_estilo" style="width:135px; height:30px" name="filtro_materias_ca2" size=1>
								<option value="OBLIGATORIAS">OBLIGATORIAS</option>
								<option value="OPTATIVAS">OPTATIVAS</option>
								
							</select>
						</div>
							<div class="listasCa">	
					            <div class="listbox"></div>
				        	</div>
						
						<div class="controlesListasCa_2">
							Grupos:
					              	<select name="example" multiple="multiple" class="example41">
						                <option value="231" selected>231</option>
						                <option value="232" selected>232</option>
						                <option value="241" selected>241</option>
						                <option value="242" selected>242</option>
						                <option value="251" selected>251</option>
						                <option value="252" selected>252</option>
					                </select>
					             

							<input type="button" class="md-trigger" value="+" data-modal="btnCatalogoGrupo" id="btnCatalogoGrupo" />
							<input type="button" class="md-trigger" value="UA" style="width:40px;" data-modal="btnAgregarUa" id="btnAgregarUa" />
							<input type="button" style="width:100px" value="Guardar"  class="estilo_button2" name="btnGuardarCa" id="btnGuardarCa" />
						</div>
				</div>	

				<!----------------------- LISTA QUINTO SEMESTRE ------------------------>

				<div class="carga_listas">
					
						<div class="nombre_semestre">SEMESTRE: 5</div>
						<div class="nombre_plan">2014-1</div>
						<div class="filtroMaterias_ca2">Materias: 							
							<select class="con_estilo" style="width:135px; height:30px" name="filtro_materias_ca2" size=1>
								<option value="OBLIGATORIAS">OBLIGATORIAS</option>
								<option value="OPTATIVAS">OPTATIVAS</option>
								
							</select>
						</div>
							<div class="listasCa">	
					            <div class="listbox"></div>
				        	</div>
						
						<div class="controlesListasCa_2">
							Grupos:
					              	<select name="example" multiple="multiple" class="example41">
						                <option value="231" selected>231</option>
						                <option value="232" selected>232</option>
						                <option value="241" selected>241</option>
						                <option value="242" selected>242</option>
						                <option value="251" selected>251</option>
						                <option value="252" selected>252</option>
					                </select>
					             

							<input type="button" class="md-trigger" value="+" data-modal="btnCatalogoGrupo" id="btnCatalogoGrupo" />
							<input type="button" class="md-trigger" value="UA" style="width:40px;" data-modal="btnAgregarUa" id="btnAgregarUa" />
							<input type="button" style="width:100px" value="Guardar"  class="estilo_button2" name="btnGuardarCa" id="btnGuardarCa" />
						</div>
				</div>	

				<!----------------------- LISTA SEXTO SEMESTRE ------------------------>

				<div class="carga_listas">
					
						<div class="nombre_semestre">SEMESTRE: 6</div>
						<div class="nombre_plan">2014-1</div>
						<div class="filtroMaterias_ca2">Materias: 							
							<select class="con_estilo" style="width:135px; height:30px" name="filtro_materias_ca2" size=1>
								<option value="OBLIGATORIAS">OBLIGATORIAS</option>
								<option value="OPTATIVAS">OPTATIVAS</option>
								
							</select>
						</div>
							<div class="listasCa">	
					            <div class="listbox"></div>
				        	</div>
						
						<div class="controlesListasCa_2">
							Grupos:
					              	<select name="example" multiple="multiple" class="example41">
						                <option value="231" selected>231</option>
						                <option value="232" selected>232</option>
						                <option value="241" selected>241</option>
						                <option value="242" selected>242</option>
						                <option value="251" selected>251</option>
						                <option value="252" selected>252</option>
					                </select>
					             

							<input type="button" class="md-trigger" value="+" data-modal="btnCatalogoGrupo" id="btnCatalogoGrupo" />
							<input type="button" class="md-trigger" value="UA" style="width:40px;" data-modal="btnAgregarUa" id="btnAgregarUa" />
							<input type="button" style="width:100px" value="Guardar"  class="estilo_button2" name="btnGuardarCa" id="btnGuardarCa" />
						</div>
				</div>	

				<!----------------------- LISTA SEPTIMO SEMESTRE ------------------------>

				<div class="carga_listas">
					
						<div class="nombre_semestre">SEMESTRE: 7</div>
						<div class="nombre_plan">2014-1</div>
						<div class="filtroMaterias_ca2">Materias: 							
							<select class="con_estilo" style="width:135px; height:30px" name="filtro_materias_ca2" size=1>
								<option value="OBLIGATORIAS">OBLIGATORIAS</option>
								<option value="OPTATIVAS">OPTATIVAS</option>
								
							</select>
						</div>
							<div class="listasCa">	
					            <div class="listbox"></div>
				        	</div>
						
						<div class="controlesListasCa_2">
							Grupos:
					              	<select name="example" multiple="multiple" class="example41">
						                <option value="231" selected>231</option>
						                <option value="232" selected>232</option>
						                <option value="241" selected>241</option>
						                <option value="242" selected>242</option>
						                <option value="251" selected>251</option>
						                <option value="252" selected>252</option>
					                </select>

							<input type="button" class="md-trigger" value="+" data-modal="btnCatalogoGrupo" id="btnCatalogoGrupo" />
							<input type="button" class="md-trigger" value="UA" style="width:40px;" data-modal="btnAgregarUa" id="btnAgregarUa" />
							<input type="button" style="width:100px" value="Guardar"  class="estilo_button2" name="btnGuardarCa" id="btnGuardarCa" />
						</div>
				</div>	

				<!----------------------- LISTA OCTAVO SEMESTRE ------------------------>

				<div class="carga_listas">
					
						<div class="nombre_semestre">SEMESTRE: 8</div>
						<div class="nombre_plan">2014-1</div>
						<div class="filtroMaterias_ca2">Materias: 							
							<select class="con_estilo" style="width:135px; height:30px" name="filtro_materias_ca2" size=1>
								<option value="OBLIGATORIAS">OBLIGATORIAS</option>
								<option value="OPTATIVAS">OPTATIVAS</option>
								
							</select>
						</div>
							<div class="listasCa">	
					            <div class="listbox"></div>
				        	</div>
						
						<div class="controlesListasCa_2">
							Grupos:
					              	<select name="example" multiple="multiple" class="example41">
						                <option value="231" selected>231</option>
						                <option value="232" selected>232</option>
						                <option value="241" selected>241</option>
						                <option value="242" selected>242</option>
						                <option value="251" selected>251</option>
						                <option value="252" selected>252</option>
					                </select>
					             

							<input type="button" class="md-trigger" value="+" data-modal="btnCatalogoGrupo" id="btnCatalogoGrupo" />
							<input type="button" class="md-trigger" value="UA" style="width:40px;" data-modal="btnAgregarUa" id="btnAgregarUa" />
							<input type="button" style="width:100px" value="Guardar"  class="estilo_button2" name="btnGuardarCa" id="btnGuardarCa" />
						</div>
				</div>	

				<!----------------------- LISTA NOVENO SEMESTRE ------------------------>

				<div class="carga_listas">
					
						<div class="nombre_semestre">SEMESTRE: 9</div>
						<div class="nombre_plan">2014-1</div>
						<div class="filtroMaterias_ca2">Materias: 							
							<select class="con_estilo" style="width:135px; height:30px" name="filtro_materias_ca2" size=1>
								<option value="OBLIGATORIAS">OBLIGATORIAS</option>
								<option value="OPTATIVAS">OPTATIVAS</option>
								
							</select>
						</div>
							<div class="listasCa">	
					            <div class="listbox"></div>
				        	</div>
						
						<div class="controlesListasCa_2">
							Grupos:
					              	<select name="example" multiple="multiple" class="example41">
						                <option value="231" selected>231</option>
						                <option value="232" selected>232</option>
						                <option value="241" selected>241</option>
						                <option value="242" selected>242</option>
						                <option value="251" selected>251</option>
						                <option value="252" selected>252</option>
					                </select>
					             

							<input type="button" class="md-trigger" value="+" data-modal="btnCatalogoGrupo" id="btnCatalogoGrupo" />
							<input type="button" class="md-trigger" value="UA" style="width:40px;" data-modal="btnAgregarUa" id="btnAgregarUa" />
							<input type="button" style="width:100px" value="Guardar"  class="estilo_button2" name="btnGuardarCa" id="btnGuardarCa" />
						</div>
				</div>	

				
					<div class="nombre_escuela">UNIVERSIDAD AUTONOMA DE BAJA CALIFORNIA</div>
					<div class="nombre_escuela">FACULTAD DE CONTADURIA Y ADMINISTRACION</div>
					<div class="nombre_escuela">DIRECTOR:</div>
					<div class="nombre_escuela">SUBDIRECTOR:</div>
					<div class="nombre_escuela">ADMINISTRADOR:</div>
					<div class="nombre_escuela">COORDINADOR:</div>
					<div class="nombre_escuela">CREDITOS/PLAN:</div>
					<div class="nombre_escuela">OBLIGATORIAS:</div>
					<div class="nombre_escuela">OPTATIVAS:</div>
					<div class="nombre_escuela">TOTAL:</div>


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
	<script src="../js/modalEffects.js"></script>
	</body>



</html>