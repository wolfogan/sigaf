<?PHP

class CatalogosController extends BaseController

{


	public function __construct()
	{
		
		$this->beforeFilter('auth');
	}
	
	public function getModificable()
	{
		$q = $_GET['q'];
 		echo '<input type="text" value="'.$q.'">';
	}




	
//FUNCIONES PARA CATALOGOS DE SERIACION////////////////////////////////////////
	public function getSeries()
	{

		$seriaciones = Seriacion::select('reqseriacion','descripcion')->orderBy('reqseriacion')->get();
		return View::make("catalogos.series")->with(compact('seriaciones'));
}
public function postActualizarseriacion()
	{

		$seriacion = Seriacion::find(Input::get('seriacion_id'));
		$seriacion -> descripcion = Str::upper(Input::get('seriacion_descripcion'));
		$seriacion->save();
		$seriacion->push();
		$message= 'Registro actualizado';
		return Redirect::back()->withErrors($message);
	}
public function postRegistrarseriacion()
	{

		if(Seriacion::where('descripcion','=',Input::get('seriacion_descripcion'))->exists()){
			$message= 'Registro Duplicado, ingrese otro nombre';
		return Redirect::back()->withErrors($message);

		}
		else{
	
		$seriacion = new Seriacion;

		$seriacion -> descripcion = Str::upper(Input::get('seriacion_descripcion'));
		$seriacion -> save();

		$message= 'Registro Agregado';
		return Redirect::back()->withErrors($message);
	}
	}

	public function postEliminarseriacion(){
		$seriacion = Seriacion::find(Input::get('seriacion_id'));
		$seriacion -> delete();
		$message= 'Registro Borrado';
		return Redirect::back()->withErrors($message);
		
	}

	//FUNCIONES PARA CATALOGOS DE SERIACION////////////////////////////////////////
	//FUNCIONES PARA CATALOGOS DE CARACTER////////////////////////////////////////
	public function getCaracter()
	{

		$caracteres = Caracter::select('caracter','descripcion')->orderBy('caracter')->get();
		return View::make("catalogos.caracter")->with(compact('caracteres'));
}
public function postActualizarcaracter()
	{

		$caracteres = Caracter::find(Input::get('caracteres_id'));
		$caracteres -> descripcion = Str::upper(Input::get('caracteres_descripcion'));
		$caracteres->save();
		$caracteres->push();
		$message= 'Registro actualizado';
		return Redirect::back()->withErrors($message);
	}
public function postRegistrarcaracter()
	{

		if(Caracter::where('descripcion','=',Input::get('caracteres_descripcion'))->exists()){
			$message= 'Registro Duplicado, ingrese otro nombre';
		return Redirect::back()->withErrors($message);

		}
		else{
	
		$caracteres = new Caracter;
		$caracteres -> descripcion = Str::upper(Input::get('caracteres_descripcion'));
		$caracteres -> save();

		$message= 'Registro Agregado';
		return Redirect::back()->withErrors($message);
	}
	}

	public function postEliminarcaracter(){
		$caracteres = Caracter::find(Input::get('caracteres_id'));
		$caracteres -> delete();
		$message= 'Registro Borrado';
		return Redirect::back()->withErrors($message);
		
	}

	//FUNCIONES PARA CATALOGOS DE CARACTER////////////////////////////////////////
	//FUNCIONES PARA CATALOGOS DE ETAPAS////////////////////////////////////////
	public function getEtapas()
	{

		$etapas = Etapa::select('etapa','descripcion')->orderBy('etapa')->get();
		return View::make("catalogos.etapas")->with(compact('etapas'));
}
public function postActualizaretapas()
	{

		$etapas = Etapa::find(Input::get('etapas_id'));
		$etapas -> descripcion = Str::upper(Input::get('etapas_descripcion'));
		$etapas->save();
		$etapas->push();
		$message= 'Registro actualizado';
		return Redirect::back()->withErrors($message);
	}
public function postRegistraretapas()
	{
		if(Etapa::where('descripcion','=',Input::get('etapas_descripcion'))->exists()){
			$message= 'Registro Duplicado, ingrese otro nombre';
		return Redirect::back()->withErrors($message);

		}
		else{
		$etapas = new Etapa;
		$etapas -> descripcion = Str::upper(Input::get('etapas_descripcion'));
		$etapas -> save();

		$message= 'Registro Agregado';
		return Redirect::back()->withErrors($message);
		}
	}

	public function postEliminaretapas(){
		$etapas = Etapa::find(Input::get('etapas_id'));
		$etapas -> delete();
		$message= 'Registro Borrado';
		return Redirect::back()->withErrors($message);
		
	}

	//FUNCIONES PARA CATALOGOS DE CARACTER////////////////////////////////////////
	//FUNCIONES PARA CATALOGOS DE NIVELPROGRAMA////////////////////////////////////////
	public function getNivelprograma()
	{

		$nivelprogramas = NivelPrograma::select('nivel','descripcion')->orderBy('nivel')->get();
		return View::make("catalogos.nivelprograma")->with(compact('nivelprogramas'));
}
public function postActualizarnivelprograma()
	{

		$nivelprogramas = NivelPrograma::find(Input::get('nivelprogramas_id'));
		$nivelprogramas -> descripcion = Str::upper(Input::get('nivelprogramas_descripcion'));
		$nivelprogramas->save();
		$nivelprogramas->push();
		$message= 'Registro actualizado';
		return Redirect::back()->withErrors($message);
	}
public function postRegistrarnivelprograma()
	{
		if(NivelPrograma::where('descripcion','=',Input::get('nivelprogramas_descripcion'))->exists()){
			$message= 'Registro Duplicado, ingrese otro nombre';
		return Redirect::back()->withErrors($message);

		}
		else{
		$nivelprogramas = new NivelPrograma;
		$nivelprogramas -> descripcion = Str::upper(Input::get('nivelprogramas_descripcion'));	
		$nivelprogramas -> save();

		$message= 'Registro Agregado';
		return Redirect::back()->withErrors($message);
	}
	}

	public function postEliminarnivelprograma(){
		$nivelprogramas = NivelPrograma::find(Input::get('nivelprogramas_id'));
		$nivelprogramas -> delete();
		$message= 'Registro Borrado';
		return Redirect::back()->withErrors($message);
		
	}

	//FUNCIONES PARA CATALOGOS DE CARACTER////////////////////////////////////////

	//FUNCIONES PARA CATALOGOS DE PAISES////////////////////////////////////////
	public function getPais()
	{

		$paises = Pais::select('descripcion','pais')->orderBy('descripcion')->get();
		return View::make("catalogos.pais")->with(compact('paises'));
}
public function postActualizarpais()
	{

		 $paises = Pais::find(Input::get('paises_id'));
		$paises -> descripcion = Str::upper(Input::get('paises_descripcion'));
		$paises->save();
		$paises->push();
		$message= 'Registro actualizado';
		return Redirect::back()->withErrors($message);
	}
public function postRegistrarpais()
	{if(Paises::where('descripcion','=',Input::get('paises_descripcion'))->exists()){
			$message= 'Registro Duplicado, ingrese otro nombre';
		return Redirect::back()->withErrors($message);

		}
		else{
		 $paises = new Pais;
		$paises -> descripcion = Str::upper(Input::get('paises_descripcion'));
		$paises -> save();

		$message= 'Registro Agregado';
		return Redirect::back()->withErrors($message);
	}
	}

	public function postEliminarpais(){

		if(Estado::where('pais','=',Input::get('paises_id'))->exists()){
			$paises = Pais::select('pais','descripcion')->orderBy('descripcion')->get();
		$message = 'No se pudo borrar el Pais, verifique estados relacionados';
		return Redirect::back()->withErrors($message);

			
		}else{
			$paises = Pais::find(Input::get('paises_id'));
		$paises -> delete();
		$message= 'Registro Borrado';
		return Redirect::back()->withErrors($message);
		}	
	}

	//FUNCIONES PARA CATALOGOS DE PAISES////////////////////////////////////////

		//FUNCIONES PARA CATALOGOS DE ESTADOS////////////////////////////////////////
	public function getEstado()
	{

		$paises = Pais::select('pais','descripcion')->orderBy('descripcion')->get();
		$estados = Estado::select('estado','descripcion','pais')->orderBy('descripcion')->get();
		return View::make("catalogos.estado")->with(compact('paises','estados'));
}
public function postActualizarestado()
	{

		$paises=Pais::select('descripcion')->where('pais','=',Input::get('estados_pais'))->first();
		$elestado=Estado::select('descripcion')->where('estado','=',Input::get('estados_id'))->first();
		 $estados = Estado::find(Input::get('estados_id'));
		$estados -> descripcion = Str::upper(Input::get('estados_descripcion'));
		$estados -> pais = Input::get('estados_pais');
		$message= 'El Estado '.$elestado['descripcion'].' ha cambiado a '.Input::get('estados_descripcion').' y el pais se ha actualizado al pais '.$paises['descripcion'];
		$estados->save();
		$estados->push();
		return Redirect::back()->withErrors($message);
	}
public function postRegistrarestado()
	{
		if(Estado::where('descripcion','=',Input::get('estados_descripcion'))->exists()){
			$message= 'Registro Duplicado, ingrese otro nombre';
		return Redirect::back()->withErrors($message);

		}
		else{
		 $estados = new Estado;

		$estados -> descripcion = Str::upper(Input::get('estados_descripcion'));
		$estados -> pais = Input::get('estados_pais');
		$estados -> save();

		$message= 'Registro Agregado';
		return Redirect::back()->withErrors($message);
	}
	}

	public function postEliminarestado(){
		if(Ciudad::where('estado','=',Input::get('estados_id'))->exists()){
		$paises = Pais::select('pais','descripcion')->orderBy('descripcion')->get();
		$estados = Estado::select('estado','descripcion','pais')->orderBy('descripcion')->get();
		$message = 'No se pudo borrar el Estado, verifique ciudades relacionadas';
		return Redirect::back()->withErrors($message);
		}else{
			$estados = Estado::find(Input::get('estados_id'));
		$estados -> delete();
		$message= 'Registro Borrado';
		return Redirect::back()->withErrors($message);		}
	}

	//FUNCIONES PARA CATALOGOS DE ESTADOS////////////////////////////////////////

		//FUNCIONES PARA CATALOGOS DE CIUDADES////////////////////////////////////////
	public function getCiudad()
	{
		$estados = Estado::select('estado','descripcion')->orderBy('descripcion')->get();
		$ciudades = Ciudad::select('ciudad','descripcion','estado')->orderBy('descripcion')->get();
		return View::make("catalogos.ciudad")->with(compact('ciudades','estados'));
}
public function postActualizarciudad()
	{




		$estados=Estado::select('descripcion')->where('estado','=',Input::get('ciudades_estado'))->first();
		$laciudad=Ciudad::select('descripcion')->where('ciudad','=',Input::get('ciudades_id'))->first();

		$ciudades = Ciudad::find(Input::get('ciudades_id'));
		$ciudades -> descripcion = Str::upper(Input::get('ciudades_descripcion'));
		$ciudades -> estado = Input::get('ciudades_estado');

		$message= 'La ciudad '.$laciudad['descripcion'].' ha cambiado a '.Input::get('ciudades_descripcion').' y el Estado se ha actualizado '.$estados['descripcion'];
		$ciudades->save();
		$ciudades->push();
		
		return Redirect::back()->withErrors($message);
}
public function postRegistrarciudad()
	{
		if(Ciudad::where('descripcion','=',Input::get('ciudades_descripcion'))->exists() && Ciudad::where('estado','=',Input::get('ciudades_estado'))->exists()){
			$message= 'Registro Duplicado, ingrese otro nombre';
		return Redirect::back()->withErrors($message);

		}
		else{
		 $ciudades = new Ciudad;
		$ciudades -> descripcion = Str::upper(Input::get('ciudades_descripcion'));
		$ciudades -> estado = Input::get('ciudades_estado');
		$ciudades -> save();

		$message= 'Registro Agregado';
		return Redirect::back()->withErrors($message);
	}
	}

	public function postEliminarciudad(){
		if(Campus::where('ciudad','=',Input::get('ciudades_id'))->exists()){
			$estados = Estado::select('estado','descripcion')->orderBy('descripcion')->get();
		$ciudades = Ciudad::select('ciudad','descripcion','estado')->orderBy('descripcion')->get();
		$message = 'No se pudo borrar la Ciudad, verifique campus relacionados';
		return Redirect::back()->withErrors($message);
		}
	else{
		$ciudades = Ciudad::find(Input::get('ciudades_id'));
		$ciudades -> delete();
		$message= 'Registro Borrado';
		return Redirect::back()->withErrors($message);
		
		}
		
	}

	//FUNCIONES PARA CATALOGOS DE CIUDADES////////////////////////////////////////


		//FUNCIONES PARA CATALOGOS DE CAMPUS////////////////////////////////////////
	public function getCampus()
	{
		$campuses = Campus::select('campus','descripcion','direccion','ciudad')->orderBy('descripcion')->get();
		$ciudades = Ciudad::select('ciudad','descripcion')->orderBy('descripcion')->get();
		return View::make("catalogos.campus")->with(compact('campuses','ciudades'));
}
public function postActualizarcampus()
	{

		 $campuses = Campus::find(Input::get('campuses_id'));
		$campuses -> descripcion = Str::upper(Input::get('campuses_descripcion'));
		$campuses -> direccion = Str::upper(Input::get('campuses_direccion'));
		$campuses -> ciudad = Input::get('campuses_ciudad');
		$campuses->save();
		$campuses->push();
		$message= 'Registro actualizado';
		return Redirect::back()->withErrors($message);
	}
public function postRegistrarcampus()
	{
		if(Campus::where('descripcion','=',Input::get('campuses_descripcion'))->exists()){
			$message= 'Registro Duplicado, ingrese otro nombre';
		return Redirect::back()->withErrors($message);

		}
		else{
		 $campuses = new Campus;
		$campuses -> descripcion = Str::upper(Input::get('campuses_descripcion'));
		$campuses -> direccion = Str::upper(Input::get('campuses_direccion'));
		$campuses -> ciudad = Input::get('campuses_ciudad');
		$campuses -> save();

		$message= 'Registro Agregado';
		return Redirect::back()->withErrors($message);
	}
	}

	public function postEliminarcampus(){

		if(Uacademica::where('campus','=',Input::get('campuses_id'))->exists()){
			
		$message = 'No se pudo borrar Campus, verifique Unidad Academica relacionada';
		return Redirect::back()->withErrors($message);
		}
	else{
		$campuses = Campus::find(Input::get('campuses_id'));
		$campuses -> delete();
		$message= 'Registro Borrado';
		return Redirect::back()->withErrors($message);

		
		}		
	}

	//FUNCIONES PARA CATALOGOS DE CAMPUS////////////////////////////////////////


			//FUNCIONES PARA CATALOGOS DE UACADEMICA////////////////////////////////////////
	public function getUacademica()
	{
		$uacademicas = Uacademica::select('uacademica','descripshort','descripcion','campus')->orderBy('descripshort')->get();
		$campuses = Campus::select('campus','descripcion')->orderBy('descripcion')->get();
		return View::make("catalogos.uacademica")->with(compact('campuses','uacademicas'));
}
public function postActualizaruacademica()
	{

		 $uacademicas = Uacademica::find(Input::get('uacademicas_id'));
		 $uacademicas -> descripshort = Str::upper(Input::get('uacademicas_descripshort'));
		$uacademicas -> descripcion = Str::upper(Input::get('uacademicas_descripcion'));
		$uacademicas -> campus = Input::get('uacademicas_campus');
		$uacademicas->save();
		$uacademicas->push();
		$message= 'Registro actualizado';
		return Redirect::back()->withErrors($message);
	}
public function postRegistraruacademica()
	{
		if(Uacademica::where('descripcion','=',Input::get('uacademicas_descripcion'))->exists() || Uacademica::where('descripshort','=',Input::get('uacademicas_descripshort'))->exists()){
			$message= 'Registro Duplicado, ingrese otro nombre';
		return Redirect::back()->withErrors($message);

		}
		else{
		 $uacademicas = new Uacademica;
		$uacademicas -> descripshort = Str::upper(Input::get('uacademicas_descripshort'));
		$uacademicas -> descripcion = Str::upper(Input::get('uacademicas_descripcion'));
		$uacademicas -> campus = Input::get('uacademicas_campus');
		$uacademicas -> save();

		$message= 'Registro Agregado';
		return Redirect::back()->withErrors($message);
	}
	}

	public function postEliminaruacademica(){
		if(ProgramaEducativo::where('uacademica','=',Input::get('uacademicas_id'))->exists() || Directivosua::where('uacademica','=',Input::get('uacademicas_id'))->exists()){
			
		$message = 'No se pudo borrar Unidad Academica, verifique Programa Educativo y Directivos';
		return Redirect::back()->withErrors($message);
		}
	else{
		$uacademicas = Uacademica::find(Input::get('uacademicas_id'));
		$uacademicas -> delete();
		$message= 'Registro Borrado';
		return Redirect::back()->withErrors($message);

		
		}



		
	}

	//FUNCIONES PARA CATALOGOS DE UACADEMICA////////////////////////////////////////


public function getCatalogos()
	{
		

			return View::make("pe.catalogos");



	}
}