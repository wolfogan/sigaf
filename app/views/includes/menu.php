<nav id="MenuNav" style="border-right:none">
	<ul>
		<li>
			<a href="#" titile="Plan de estudios">Plan de estudios</a>
			<ul>
				<li><a href="<?=URL::to('catalogos/catalogos');?>" title="Catalogos">Catálogos</a></li>
				<!--<li><a href="<?=URL::to('planestudio/catalogosadmin')?>" titile="Modificación y eliminación de catálogos">Catálogos: modificación y eliminación </a></li>-->
				<li><a href="<?=URL::to('planestudio/registro')?>" title="Registro y eliminacion UAs">Registro y eliminación UA's</a></li>
				<li><a href="<?=URL::to('planestudio/consulta')?>" titile="Consulta y modificacion">Consulta y modificación UA's</a></li>
				<li><a href="<?=URL::to('planestudio/bitacora')?>" titile="Bitacora">Bitácora</a></li>
				<li class="ultimo"><a href="<?=URL::to('main');?>" title="Menú principal">Menú principal</a></li>
			</ul>
		</li>
		<li>
			<a href="#" titile="Carga académica">Carga académica</a>
			<ul>
				<li><a href="<?=URL::to('cargaacademica/registro');?>" title="Registrar CA">Registro Inicial CA</a></li>
				<li><a href="<?=URL::to('cargaacademica/subsecuente');?>" title="Registrar CA3">Registro subsecuente CA 2</a></li>
				<li><a href="<?=URL::to('cargaacademica/consulta');?>" title="Consultar CA">Consultar Carga A.</a></li>
				<li class="ultimo"><a href="<?=URL::to('main');?>" title="Menú principal">Menú principal</a></li>
				

				
			</ul>
		</li>
		<li>
			<a href="#" title="Disponibilidad docente">Disponibilidad docente</a>
			<ul>
				<li><a href="<?=URL::to('disponibilidaddocente/registro');?>" title="Registrar DD">Registrar Disp. Doc.</a></li>
				<li><a href="<?=URL::to('disponibilidaddocente/consulta');?>" title="Consultar y modificar DD">Consultar Disp. Doc.</a></li>
				<li><a href="<?=URL::to('disponibilidaddocente/eliminar');?>" title="Eliminar DD">Eliminar Disp. Doc.</a></li>
				<li class="ultimo"><a href="<?=URL::to('main');?>" title="Menú principal">Menú principal</a></li>
			
			</ul>
		</li>
		<li>
			<a href="#" title="Creación de horarios">Creación de horario<span></span></a>
			<ul>
				<li><a href="<?=URL::to('horarios/registro');?>" title="Registrar Horario">Registrar y consultar horario</a></li>
				<li class="ultimo"><a href="<?=URL::to('main');?>" title="Menú principal">Menú principal</a></li>
				<!--<li><a href="#" titile="SubMenu 2">Submen&uacute; 2</a></li>
				<li class="ultimo"><a href="#" title="SubMenu 3">Submen&uacute; 3</a></li>-->
			</ul>
		</li>
		<li>
			<a href="#" title="Calendarización de Exámenes">Calendarización Exams.</a>
			<ul>
				<li><a href="#" title="SubMenu 1">Submen&uacute; 1</a></li>
				<li><a href="#" titile="SubMenu 2">Submen&uacute; 2</a></li>
				<li class="ultimo"><a href="#" title="SubMenu 3">Submen&uacute; 3</a></li>
			</ul>
		</li>
		<li>
			<a href="#" title="Control de inasistencias" style="border-right:1px solid #FEA417;">Control de inasistencias</a>
			<ul>
				<li><a href="#" title="SubMenu 1">Submen&uacute; 1</a></li>
				<li><a href="#" titile="SubMenu 2">Submen&uacute; 2</a></li>
				<li class="ultimo"><a href="#" title="SubMenu 3">Submen&uacute; 3</a></li>
			</ul>
		</li>
		<li>
			<a href="#" title="Login y usuarios" style="border-right:1px solid #FEA417;">Login y usuarios</a>
			<ul>
				<li><a href="<?=URL::to('usuarios/usuariosregistro');?>" title="Registro, consulta y modificación de usuarios">Registro, consulta, modificación usuarios</a></li>
				<li><a href="<?=URL::to('usuarios/modificarcontrasena');?>" title="Modificar contraseña">Cambiar contraseña</a></li>
				<li><a href="<?=URL::to('usuarios/olvidocontrasena');?>" title="Olvidó contraseña">Olvidó contraseña</a></li>
				<li class="ultimo"><a href="<?=URL::to('main');?>" title="Menú principal">Menú principal</a></li>



			</ul>
		</li>
	</ul>
</nav>