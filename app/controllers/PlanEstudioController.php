<?php

class PlanEstudioController extends BaseController
{
	// <option value="2013-2">2013-2</option>
	public function __construct()
	{
		$this->beforeFilter('auth');
	}
	

	public function getRegistro()
	{
		//$planestudio = DB::table('planestudio')->distinct()->lists('PE_codigo');
		//$planestudio = DB::table('planestudio')->distinct()->select('PE_codigo')->orderBy('PE_codigo','desc')->get();
		$planestudio = PlanEstudio::select('plan')->orderBy('plan','desc')->get();
		$codigosPE = array();
		
		/**
	 	* Función para integrar el guión en el código del plan de estudio 2009-2
		 * @param  string $string_add    La cadena a agregar
		 * @param  string $string_target La cadena donde se va a agregar el string
		 * @param  int $offset        Puntero donde corta la caden
		 * @return string                Regresa la cadena concatenada
		 */
		function str_insert($string_add,$string_target,$offset)
		{
			$part1 = substr($string_target,0, $offset);
			$part2 = substr($string_target, $offset);

			return $part1.$string_add.$part2;
		}
		
		for ($i=0; $i < count($planestudio); $i++) { 
		$codigosPE[] = ["codigo" => $planestudio[$i]->plan,"formato" => str_insert("-",$planestudio[$i]->plan,4)];
		}
		// Licenciatura, Maestría
		$niveles = NivelPrograma::select('nivel','descripcion')->orderBy('nivel','desc')->get();
		// Cuatrimestral, Semestral
		$periodosPrograma = PeriodoPrograma::select('periodo_pedu','descripcion')->get();

		// Básica, Disciplinaria, Terminal
		$etapas= Etapa::select('etapa','descripcion')->get();

		// Obligatoria, Sugerida, Sin seriación.
		$seriaciones = Seriacion::select('reqseriacion','descripcion')->orderBy('reqseriacion','desc')->get();

		// Oblitatoria, optativa
		$tiposCaracter = Caracter::select('caracter','descripcion')->get();

		// Coordinación de area
		$coordinaciones = Coordinacion::select('coordinaciona','descripcion')->get();

		// Materia: Matemáticas, español, etc.
		$unidadesAprendizaje = UnidadAprendizaje::select('uaprendizaje','descripcionmat')->orderBy('uaprendizaje','desc')->get();

		$programasEducativos = ProgramaEducativo::select('programaedu','descripcion')->orderBy('programaedu','asc')->get();

		return View::make('pe.registro')->with(compact('codigosPE','niveles','periodosPrograma','etapas','seriaciones','tiposCaracter','coordinaciones','unidadesAprendizaje','programasEducativos'));
	}

	public function getConsulta()
	{
		return View::make('pe.consulta');
	}

	public function getUsuarios()
	{
		return View::make('pe.usuarios');
	}
	
	public function getUsuariosRegistro()
	{
		return View::make('pe.usuariosRegistro');
	}

	public function getBitacora()
	{
		return View::make('pe.bitacora');
	}
	public function getCatalogosadmin()
	{
		return View::make('pe.catalogosAdmin');
	}

	// ALTAS DE CATALOGOS
	// 
	public function postRegistrarplan()
	{
		$plan = new PlanEstudio;
		$plan -> plan = Input::get('planestudio_plan');
		$plan -> descripcion = Input::get('planestudio_descripcion');
		$plan -> feciniciovig = Input::get('planestudio_feciniciovig');
		$plan -> fecfinvig = Input::get('planestudio_fecfinvig');
		$plan -> credpracticas = Input::get('planestudio_credpracticas');
		$plan -> save();
		return Redirect::back();
	}

	public function postRegistrarnivel()
	{
		$nivel = new NivelPrograma;
		$nivel -> descripcion = Input::get('nivel_descripcion');
		$nivel -> save();

		return Redirect::back();
	}

	public function postRegistrarperiodoprograma()
	{
		$tipo = new PeriodoPrograma;
		$tipo -> descripcion = Input::get('periodoprograma_descripcion');
		$tipo -> save();

		return Redirect::back();
	}

	public function postRegistraretapa()
	{
		$etapa = new Etapa;
		$etapa -> descripcion = Input::get('etapa_descripcion');
		$etapa -> save();

		return Redirect::back();
	}

	public function postRegistrarseriacion()
	{
		$seriacion = new Seriacion;
		$seriacion -> descripcion = Input::get('seriacion_descripcion');
		$seriacion -> save();

		return Redirect::back();
	}

	public function postRegistrarcaracter()
	{
		$caracter = new Caracter;
		$caracter -> descripcion = Input::get('caracter_descripcion');
		$caracter -> save();

		return Redirect::back();
	}

	public function postRegistrarcoordinacion()
	{
		$coordinacion= new Coordinacion;
		$coordinacion -> descripcion = Input::get('coordinacion_descripcion');
		$coordinacion -> programaedu = 1;
		$coordinacion -> save();

		return Redirect::back();

	}

	public function postRegistrarprogramaeducativo()
	{
		$programaEducativo = new ProgramaEducativo;
		$programaEducativo -> descripcion = "NEW CARRER";
		$programaEducativo -> save();

		return Redirect::back();
	}

	public function postRegistrarua()
	{
		$ua = new UnidadAprendizaje;
		return "YUHUUU";
	}

	// Llamadas Asíncronas
	public function postObtenermateria()
	{
		$ua_id = Input::get('uaprendizaje');
		$uaprendizaje = UnidadAprendizaje::find($ua_id);
		return $uaprendizaje->descripcionmat;
	}

	public function getObtenerclave()
	{
		$ua_id = UnidadAprendizaje::select('uaprendizaje')->orderBy('uaprendizaje','desc')->first();
		return $ua_id->uaprendizaje+1;
	}

}

