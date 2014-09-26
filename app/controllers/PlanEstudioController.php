<?php

class PlanEstudioController extends BaseController
{
	// <option value="2013-2">2013-2</option>
	public function __construct()
	{
		$this->beforeFilter('auth');
	}
	
	/**
	 * Ruta REST para obtener la vista del registro de una UNIDAD DE APRENDIZAJE
	 * @return VIEW REGRESA LA VISTA CON LAS CONSULTAS DINAMICAS
	 */
	public function getRegistro()
	{
		// Obtener planes de estudio: 2010-1, 2010-2, 2010-3
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
		$niveles = NivelPrograma::select('nivel','descripcion')->orderBy('nivel','asc')->get();
		
		// Cuatrimestral, Semestral
		$periodosPrograma = PeriodoPrograma::select('periodo_pedu','descripcion')->get();
		
		// Básica, Disciplinaria, Terminal
		$etapas= Etapa::select('etapa','descripcion')->get();

		// Obligatoria, Sugerida, Sin seriación.
		$seriaciones = Seriacion::select('reqseriacion','descripcion')->orderBy('reqseriacion','asc')->get();

		// Oblitatoria, optativa
		$tiposCaracter = Caracter::select('caracter','descripcion')->get();

		// Coordinación de area
		$coordinaciones = Coordinacion::select('coordinaciona','descripcion')->get();

		/* Materia: Matemáticas, español, etc.
		$unidadesAprendizaje = UnidadAprendizaje::select('uaprendizaje','descripcionmat')->orderBy('uaprendizaje','desc')->get();*/
		$programasEducativos = ProgramaEducativo::select('programaedu','descripcion')->orderBy('programaedu','asc')->get();

		$especialidades = Especialidad::select('especialidad','descripcion')->orderBy('descripcion','desc')->get();

		return View::make('pe.registro')->with(compact('codigosPE','niveles','periodosPrograma','etapas','seriaciones','tiposCaracter','coordinaciones','programasEducativos','especialidades'));
	}

	public function getConsulta()
	{
		// Obtener planes de estudio.
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
		// Carrera: Tronco Comun
		//$programasEducativos = ProgramaEducativo::select('programaedu','descripcion')->orderBy('programaedu','asc')->get();
		
		// Básica, Disciplinaria, Terminal
		$etapas= Etapa::select('etapa','descripcion')->get();

		// Oblitatoria, optativa
		$tiposCaracter = Caracter::select('caracter','descripcion')->get();

		// Obligatoria, Sugerida, Sin seriación.
		$seriaciones = Seriacion::select('reqseriacion','descripcion')->orderBy('reqseriacion','asc')->get();

		// Coordinación de area
		$coordinaciones = Coordinacion::select('coordinaciona','descripcion')->get();
		
		return View::make('pe.consulta')->with(compact('codigosPE','programasEducativos','etapas','tiposCaracter','seriaciones','coordinaciones'));
	}

	public function getUsuarios()
	{
		return View::make('pe.usuarios');
	}
	
	public function getUsuariosregistro()
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
	public function getPlantilla()
	{
		return View::make('pe.plantilla');
	}
	



	// ALTAS DE CATALOGOS
	// 
	public function postRegistrarplan()
	{
		$plan = new PlanEstudio;
		$noplan = Input::get('planestudio_anio').Input::get('planestudio_semestre');
		$plan -> plan = $noplan;
		$plan -> descripcion = Input::get('planestudio_descripcion');
		$plan -> nivel = Input::get('planestudio_nivel');
		$plan -> feciniciovig = Input::get('planestudio_feciniciovig');
		$plan -> fecfinvig = Input::get('planestudio_fecfinvig');
		$plan -> credpracticas = Input::get('planestudio_credpracticas');
		$plan -> save();
		
		
		$carreras = explode(',',Input::get('alta_plan_carreras'));
		foreach($carreras as $carrera)
		{
			DB::table('plan_programa') -> insert (array('plan' => $noplan,'programaedu'=>$carrera));
		}
		
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
		$programaEducativo -> empleado = 1;
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
			$UA -> HL = Input::get('hl');
			$UA -> HT = Input::get('ht');
			$UA -> HPC = Input::get('hpc');
			$UA -> HCL = Input::get('hcl');
			$UA -> HE = Input::get('he');
			$UA -> creditos = Input::get('creditosF');
			$UA -> semestre = Input::get('semestre');
			$UA -> fec_aut = date('Y-m-d');
			$UA -> observa = Input::get('observaciones');
			$UA -> caracter = Input::get('tipoF');
			$UA -> reqseriacion = Input::get('serie');
			$UA -> claveD = Input::get('clave2F');
			$UA -> etapa = Input::get('etapaF');
			$UA -> coordinaciona = Input::get('coord');
			
			$UA -> save();

			//$programas = explode(",",Input::get('carreras')); Cuando lo hacia de la manera compleja
			$programas = Input::get('carreras');
			foreach ($programas as $carrera) {
				DB::table('p_ua') -> insert (array('programaedu' => $carrera,'uaprendizaje'=>$clave));
			}

			$mensaje = "Registros insertados";
		}
		else
		{
			$mensaje = "Materia ya existe";
		}

		//$mensaje = "hola";

		return $mensaje;


	}

	// LLAMADAS ASINCRONAS
	public function postObtenernivelplan()
	{
		$noplan = Input::get('noplan');
		$nivel = PlanEstudio::find($noplan)->nivelD;
		return $nivel->descripcion;
	}
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

	public function postObtenerclaveseries()
	{
		$noplan = Input::get('noplan');
		$unidadesAprendizaje = UnidadAprendizaje::select('uaprendizaje','descripcionmat')->where('plan','=',$noplan)->orderBy('uaprendizaje','desc')->get();

		return $unidadesAprendizaje;
	}

	public function postObtenerprogramas()
	{
		$noplan = Input::get('noplan');
		$programas = DB::table('plan_programa')
						->join('programaedu','plan_programa.programaedu','=','programaedu.programaedu')
						->select('programaedu.programaedu','programaedu.descripcion')
						->where('plan_programa.plan','=',$noplan)
						->get();
		return Response::json($programas);
	}

	public function postObteneruas()
	{
		$noplan = Input::get('noplan');
		
		//$plan = PlanEstudio::find($noplan);
		//$uas = $plan->unidades;

		$UAS = DB::table('p_ua')
				->join('programaedu','p_ua.programaedu','=','programaedu.programaedu')
				->join('uaprendizaje','p_ua.uaprendizaje','=','uaprendizaje.uaprendizaje')
				->join('caracter','uaprendizaje.caracter','=','caracter.caracter')
				->join('reqseriacion','uaprendizaje.reqseriacion','=','reqseriacion.reqseriacion')
				->join('etapas','uaprendizaje.etapa','=','etapas.etapa')
				->join('coordinaciona','uaprendizaje.coordinaciona','=','coordinaciona.coordinaciona')
				->select('programaedu.programaedu','programaedu.descripcion','uaprendizaje.uaprendizaje','uaprendizaje.plan','uaprendizaje.descripcionmat','uaprendizaje.HC','uaprendizaje.HL','uaprendizaje.HT','uaprendizaje.creditos','caracter.descripcion as caracter','uaprendizaje.claveD','etapas.descripcion as etapa','coordinaciona.descripcion as coordinaciona')
				->where('uaprendizaje.plan','=',$noplan)
				->get();

		return Response::json($UAS);

	}

	public function postObteneruascarrera()
	{
		$noplan = Input::get('noplan');
		$programaedu = Input::get('programaedu');
		$etapa = Input::get('etapa');
		$caracter = Input::get('caracter');
		$reqseriacion = Input::get('reqseriacion');
		$coordinacion = Input::get('coordinacion');
		//$plan = PlanEstudio::find($noplan);
		//$uas = $plan->unidades;
		$tronco = Input::get('troncocomun');
		// Si selecciono tronco comun
		if($tronco == "true")
		{
			$UAS = DB::table('p_ua')
					->join('programaedu','p_ua.programaedu','=','programaedu.programaedu')
					->join('uaprendizaje','p_ua.uaprendizaje','=','uaprendizaje.uaprendizaje')
					->join('caracter','uaprendizaje.caracter','=','caracter.caracter')
					->join('reqseriacion','uaprendizaje.reqseriacion','=','reqseriacion.reqseriacion')
					->join('etapas','uaprendizaje.etapa','=','etapas.etapa')
					->join('coordinaciona','uaprendizaje.coordinaciona','=','coordinaciona.coordinaciona')
					->select('programaedu.programaedu','programaedu.descripcion','uaprendizaje.uaprendizaje','uaprendizaje.plan','uaprendizaje.descripcionmat','uaprendizaje.HC','uaprendizaje.HL','uaprendizaje.HT','uaprendizaje.creditos','caracter.descripcion as caracter','uaprendizaje.reqseriacion','uaprendizaje.claveD','etapas.descripcion as etapa','coordinaciona.descripcion as coordinaciona')
					->where('uaprendizaje.plan','=',$noplan)
					->where('uaprendizaje.etapa','=',$etapa)
					->where('uaprendizaje.caracter','LIKE',"%$caracter%")
					->where('uaprendizaje.reqseriacion',"LIKE","%$reqseriacion%")
					->where('uaprendizaje.coordinaciona','LIKE',"%$coordinacion%")
					->whereIn('p_ua.programaedu',array($programaedu,6)) // Carrera + Tronco Común
					->orderBy('uaprendizaje.uaprendizaje','asc')
					->get();
			
		}
		else
		{
			$UAS = DB::table('p_ua')
					->join('programaedu','p_ua.programaedu','=','programaedu.programaedu')
					->join('uaprendizaje','p_ua.uaprendizaje','=','uaprendizaje.uaprendizaje')
					->join('caracter','uaprendizaje.caracter','=','caracter.caracter')
					->join('reqseriacion','uaprendizaje.reqseriacion','=','reqseriacion.reqseriacion')
					->join('etapas','uaprendizaje.etapa','=','etapas.etapa')
					->join('coordinaciona','uaprendizaje.coordinaciona','=','coordinaciona.coordinaciona')
					->select('programaedu.programaedu','programaedu.descripcion','uaprendizaje.uaprendizaje','uaprendizaje.plan','uaprendizaje.descripcionmat','uaprendizaje.HC','uaprendizaje.HL','uaprendizaje.HT','uaprendizaje.creditos','caracter.descripcion as caracter','uaprendizaje.reqseriacion','uaprendizaje.claveD','etapas.descripcion as etapa','coordinaciona.descripcion as coordinaciona')
					->where('uaprendizaje.plan','=',$noplan)
					->where('uaprendizaje.etapa','=',$etapa)
					->where('uaprendizaje.caracter','LIKE',"%$caracter%")
					->where('uaprendizaje.reqseriacion',"LIKE","%$reqseriacion%")
					->where('uaprendizaje.coordinaciona','LIKE',"%$coordinacion%")
					->where('p_ua.programaedu','=',$programaedu)
					->orderBy('uaprendizaje.uaprendizaje','asc')
					->get();
			
		}

		return $UAS;

	}

	public function postContaruas()
	{
		$uaid = Input::get('uaprendizaje');
		$numUAS = DB::table('p_ua')->where('uaprendizaje','=',$uaid)->count();
		return $numUAS;
	}
	public function postEliminarua()
	{
		$uaid = Input::get("uaprendizaje");
		$UA = UnidadAprendizaje::find($uaid);
		$UA -> delete();

		return "Unidad de Aprendizaje Eliminada Exitosamente!";
	}

	public function postEliminarpua()
	{
		$programaedu = Input::get('programaedu');
		$uaprendizaje= Input::get('uaprendizaje');

		DB::table('p_ua')->where('programaedu','=',$programaedu)->where('uaprendizaje','=',$uaprendizaje)->delete();
	}

	public function postObtenerdataua()
	{
		$uaid = Input::get('uaprendizaje');
		$uaserieid = Input::get('claveD');
		$ua = UnidadAprendizaje::find($uaid);
		if(empty($uaserieid))
		{
			$uaserie = "";
		}
		else
		{
			$data = UnidadAprendizaje::find($uaserieid);
			$uaserie = $data->descripcionmat;
		}

		$programas = DB::table('p_ua')->where('uaprendizaje','=',$uaid)->get();
		$data= array(
			'success' => true,
			'uaprendizaje' => $ua->uaprendizaje,
			'descripcionmat' => $ua->descripcionmat,
			'etapa'=>$ua->etapa,
			'caracter'=>$ua->caracter,
			'reqseriacion'=>$ua->reqseriacion,
			'claveD'=>$ua->claveD,
			'coordinaciona'=>$ua->coordinaciona,
			'observa'=>$ua->observa,
			'materiaseriada' => $uaserie,
			'hc'=>$ua->HC,
			'hl'=>$ua->HL,
			'ht'=>$ua->HT,
			'hpc'=>$ua->HPC,
			'hcl'=>$ua->HCL,
			'he'=>$ua->HE,
			'semestre'=>$ua->semestre,
			'creditos'=>$ua->creditos,
			'programas'=>$programas
		);

		return Response::json($data);
	}

	public function postActualizarua()
	{

		$clave = Input::get("clave1F");
		$UA = UnidadAprendizaje::find($clave);
		//$UA -> plan = $noplan;
		$UA -> descripcionmat = Input::get('materia');
		$UA -> HC = Input::get('hc');
		$UA -> HL = Input::get('hl');
		$UA -> HT = Input::get('ht');
		$UA -> HPC = Input::get('hpc');
		$UA -> HCL = Input::get('hcl');
		$UA -> HE = Input::get('he');
		$UA -> creditos = Input::get('creditosF');
		//$UA -> fec_aut = date('Y-m-d');
		$UA -> semestre = Input::get('semestre');
		$UA -> observa = Input::get('observaciones');
		$UA -> caracter = Input::get('tipoF');
		$UA -> reqseriacion = Input::get('serie');
		$UA -> claveD = Input::get('clave2F');
		$UA -> etapa = Input::get('etapaF');
		$UA -> coordinaciona = Input::get('coord');
		$UA -> save();
		
		// Esto era de la manera dificil
		/*$add =Input::get('add_carreras');
		if(!empty($add))
		{
			$programas = explode(",",Input::get('add_carreras'));
			foreach ($programas as $carrera)
			{
				DB::table('p_ua') -> insert (array('programaedu' => $carrera,'uaprendizaje'=>$clave));
			}
		}*/

		// Eliminar en p_ua Unidades asociadas a las carreras para hacer una actualizacion.
		DB::table('p_ua')
			->where("uaprendizaje","=",$UA -> uaprendizaje)
			->delete();

		// Posteriormente hacer las inserciones en p_ua de las Unidades Aprendizaje asociadas a los programas.
		$programas = Input::get('carreras');
		foreach ($programas as $carrera)
		{
			DB::table('p_ua') -> insert (array('programaedu' => $carrera,'uaprendizaje'=>$clave));
		}
	}

	public function postActualizaretapa()
	{
		$uaid = Input::get("uaprendizaje");
		$etapa = Input::get("etapa");
		$UA = UnidadAprendizaje::find($uaid);
		$UA->etapa = $etapa;
		$UA->save();

		return "Etapa actualizada";
	}
}

