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

		$especialidades = Especialidad::select('especialidad','descripcion')->orderBy('descripcion','desc')->get();

		return View::make('pe.registro')->with(compact('codigosPE','niveles','periodosPrograma','etapas','seriaciones','tiposCaracter','coordinaciones','unidadesAprendizaje','programasEducativos','especialidades'));
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
	public function getPrueba()
	{
		return View::make('pe.prueba');
	}


	// ALTAS DE CATALOGOS
	// 
	public function postRegistrarplan()
	{
		$plan = new PlanEstudio;
		$plan -> plan = Input::get('planestudio_anio').Input::get('planestudio_semestre');
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
		$status = Input::get('proe_status');
		
		if(isset($status))
			$status = true;
		else
			$status = false;

		$programaEducativo = new ProgramaEducativo;
		$programaEducativo -> descripcion = Input::get('proe_descripcion');
		$programaEducativo -> status = $status;
		$programaEducativo -> empleado = Input::get('proe_empleado');
		$programaEducativo -> uacademica = 1;
		$programaEducativo -> especialidad = Input::get('proe_especialidad');
		$programaEducativo -> nivel = Input::get('proe_nivel');
		$programaEducativo -> periodo_pedu = Input::get('proe_periodo');
		$programaEducativo -> save();
		

		return Redirect::back();
	}

	public function postRegistrarua()
	{

		$noplan = Input::get('noPlan');
		$clave = Input::get('clave1F');
		$UA = UnidadAprendizaje::where('uaprendizaje',$clave) -> where('plan',$noplan) ->get();
		
		
		// Si no existe la ua se crea
		if(strlen($UA)==2)
		{
			$UA = new UnidadAprendizaje;
			$UA -> uaprendizaje = $clave;
			$UA -> plan = $noplan;
			$UA -> descripcionmat = Input::get('materia');
			$UA -> HC = Input::get('hc');
			$UA -> HT = Input::get('ht');
			$UA -> HPC = Input::get('hpc');
			$UA -> HCL = Input::get('hcl');
			$UA -> HE = Input::get('he');
			$UA -> creditos = Input::get('creditosF');
			$UA -> fec_aut = date('Y-m-d');
			$UA -> observa = Input::get('observaciones');
			$UA -> caracter = Input::get('tipoF');
			$UA -> reqseriacion = Input::get('serie');
			$UA -> claveD = Input::get('clave2F');
			$UA -> etapa = Input::get('etapaF');
			$UA -> coordinaciona = Input::get('coord');
			
			$UA -> save();

			$carrera = Input::get('control_3');

			DB::table('p_ua') -> insert (array('programaedu' => $carrera[0],'uaprendizaje'=>$clave));

			$mensaje = "Registro Insertado";

		}
		else
		{
			$mensaje = "Ya existe la materia";
		}


		return $mensaje;


	}

	// Llamadas Asíncronas
	public function postObtenermateria()
	{
		$ua_id = Input::get('uaprendizaje');
		$uaprendizaje = UnidadAprendizaje::find($ua_id);
		return $uaprendizaje->descripcionmat;
	}

	public function postObtenerclave()
	{
		$ua_id = UnidadAprendizaje::select('uaprendizaje')->orderBy('uaprendizaje','desc')->first();
		return $ua_id->uaprendizaje+1;
	}


	public function getObteneruas()
	{
		$plan = Input::get('ua_noplan');
		$unidadesAprendizaje = UnidadAprendizaje::where('plan',$plan)->get();
		return Response::json($unidadesAprendizaje);

	}
}

