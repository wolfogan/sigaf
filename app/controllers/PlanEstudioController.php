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
	
	/*public function getUsuariosregistro()
	{
		return View::make('pe.usuariosRegistro');
	}*/

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
	



	///////////////////////////////////// ALTAS DE CATALOGOS /////////////////////////////////////
	/**
	 * Función que permite registrar un nuevo plan de estudios
	 * @return string Mensaje de confirmación
	 */
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
		$plan -> users_id = Input::get('planestudio_userid');
		$plan -> save();
		
		
		$carreras = explode(',',Input::get('alta_plan_carreras'));
		foreach($carreras as $carrera)
		{
			DB::table('plan_programa') -> insert (array('plan' => $noplan,'programaedu'=>$carrera,'users_id'=>$plan -> users_id));
		}
		
		return '!Plan de Estudios registrado correctamente¡';
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
			$users_id = Input::get('users_id');
			
			$UA = new UnidadAprendizaje;
			$UA -> uaprendizaje = $clave;
			$UA -> plan = $noplan;
			$UA -> descripcionmat = Str::upper(Input::get('materia'));
			$UA -> HC = Input::get('hc');
			$UA -> HL = Input::get('hl');
			$UA -> HT = Input::get('ht');
			$UA -> HPC = Input::get('hpc');
			$UA -> HCL = Input::get('hcl');
			$UA -> HE = Input::get('he');
			$UA -> creditos = Input::get('creditosF');
			$UA -> fec_aut = date('Y-m-d');
			$UA -> observa = Input::get('observaciones');
			$UA -> coordinaciona = Input::get('coord');
			$UA -> users_id = $users_id;
			$UA -> save();
			$UA -> push();

			

			$mensaje = "¡Unidad de Aprendizaje registrada!";
		}
		else
		{
			$mensaje = "¡Materia ya existe!";
		}

		

		return $mensaje;
	}

	public function postAsociarprogramas()
	{
		$programas = Input::get("carreras");
		$etapa = Input::get("etapa");
		$caracter = Input::get("caracter");
		$semestre = Input::get("semestre");
		$ua = Input::get("ua");
		$users_id = Input::get("users_id");
		$seriacionTipos = Input::get("seriacion_tipo");
		$seriacionClaves = Input::get("seriacion_clave");
		//$descripcionProgramas = [];
		
		// En caso de actualizacion eliminar asociaciones anteriores
		
		foreach ($programas as $programa) 
		{
			// Disociar
			DB::transaction(function() use ($programa,$ua){
				DB::table("detalleseriacion")
					->where("programaedu","=",$programa)
					->where("uaprendizaje","=",$ua)
					->delete();

				DB::table("p_ua")
					->where("programaedu","=",$programa)
					->where("uaprendizaje","=",$ua)
					->delete();
			});

			// Asociar
			DB::table("p_ua")->insert(array("programaedu" => $programa,"uaprendizaje" => $ua,"etapa"=>$etapa,"caracter"=>$caracter,"semestre_sug"=>$semestre,"users_id"=> $users_id));
			// Insertar seriaciones por programa
			if(isset($seriacionTipos))
			{
				foreach ($seriacionTipos as $key => $value)
				{
					DB::table('detalleseriacion') -> insert(array('programaedu' => $programa,'uaprendizaje'=>$ua,'reqseriacion'=>$seriacionTipos[$key],'uaprequisito'=>$seriacionClaves[$key],'users_id'=>$users_id));
				}
			}
			//$programaedu = ProgramaEducativo::find($programa);
			//$descripcionProgramas[] = ["programaedu" => $programa, "descripcion" => $programaedu -> descripcion];
		}

		
		return "Unidad de Aprendizaje asociada correctamente!";
	}

	public function postDisociarprograma()
	{
		$programa = Input::get("programa");
		$ua = Input::get("ua");

		// Eliminacion con transaccion por seguridad
		DB::transaction(function() use ($programa,$ua){
			
			DB::table("detalleseriacion")
				->where("programaedu","=",$programa)
				->where("uaprendizaje","=",$ua)
				->delete();

			DB::table("p_ua")
				->where("programaedu","=",$programa)
				->where("uaprendizaje","=",$ua)
				->delete();
		});

		return "Unidad Eliminada del Programa";
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
		if(empty($uaprendizaje))
			return "NO EXISTE";
		else
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

	public function postObtenerclavescarrera()
	{
		$noplan = Input::get('noplan');
		$programaedu = Input::get('programaedu');
		$uas = DB::table("p_ua")
					->select('p_ua.uaprendizaje','uaprendizaje.descripcionmat')
					->join('uaprendizaje','p_ua.uaprendizaje','=','uaprendizaje.uaprendizaje')
					->where('uaprendizaje.plan','=',$noplan)
					->where('p_ua.programaedu','=',$programaedu)
					->orderBy('p_ua.uaprendizaje','asc')
					->get();

		return Response::json($uas);
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

		$UAS = $sql = DB::table('p_ua')
				->select('programaedu.programaedu','programaedu.descripcion','programaedu.siglas','uaprendizaje.uaprendizaje','uaprendizaje.plan','uaprendizaje.descripcionmat','uaprendizaje.HC','uaprendizaje.HL','uaprendizaje.HT','uaprendizaje.creditos','caracter.descripcion as caracter','etapas.descripcion as etapa','p_ua.etapa as numetapa','coordinaciona.descripcion as coordinaciona',DB::raw("GROUP_CONCAT(detalleseriacion.uaprequisito,CONCAT('(',SUBSTR(reqseriacion.descripcion FROM 1 FOR 1),')')) as seriacion"))
				->leftjoin('programaedu','p_ua.programaedu','=','programaedu.programaedu')
				->leftjoin('etapas','p_ua.etapa','=','etapas.etapa')
				->rightjoin('uaprendizaje','p_ua.uaprendizaje','=','uaprendizaje.uaprendizaje')
				->leftjoin('caracter','p_ua.caracter','=','caracter.caracter')
				->leftjoin('coordinaciona','uaprendizaje.coordinaciona','=','coordinaciona.coordinaciona')
				->leftjoin('detalleseriacion',function($join){
						$join->on('detalleseriacion.uaprendizaje','=','p_ua.uaprendizaje')
							->on('detalleseriacion.programaedu','=','p_ua.programaedu');
						})
				->leftjoin('reqseriacion','detalleseriacion.reqseriacion','=','reqseriacion.reqseriacion')
				->groupBy('programaedu.programaedu','programaedu.siglas','uaprendizaje.uaprendizaje','uaprendizaje.plan','uaprendizaje.descripcionmat','uaprendizaje.HC','uaprendizaje.HL','uaprendizaje.HT','uaprendizaje.creditos','caracter','etapa','coordinaciona')
				->where('uaprendizaje.plan','=',$noplan)
				->get();

		/*
		$UAS = DB::table('p_ua')
				->join('etapas','p_ua.etapa','=','etapas.etapa')
				->leftjoin('programaedu','p_ua.programaedu','=','programaedu.programaedu')
				->rightjoin('uaprendizaje','uaprendizaje.uaprendizaje','=','p_ua.uaprendizaje')
				->join('caracter','caracter.caracter','=','p_ua.caracter')
				->join('coordinaciona','uaprendizaje.coordinaciona','=','coordinaciona.coordinaciona')
				->select('uaprendizaje.uaprendizaje','uaprendizaje.plan','uaprendizaje.descripcionmat','uaprendizaje.HC','uaprendizaje.HL','uaprendizaje.HT','uaprendizaje.creditos','caracter.descripcion as caracter','etapas.descripcion as etapa','coordinaciona.descripcion as coordinaciona',DB::raw("IFNULL(GROUP_CONCAT(programaedu.siglas),'N/A') as programas"))
				->groupBy('uaprendizaje.uaprendizaje','uaprendizaje.descripcionmat')
				->get();
		*/


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
					->join('etapas','p_ua.etapa','=','etapas.etapa')
					->join('caracter','p_ua.caracter','=','caracter.caracter')
					->leftjoin('detalleseriacion','p_ua.uaprendizaje','=',"detalleseriacion.uaprendizaje")
					//->join('reqseriacion','detalleseriacion.reqseriacion','=','reqseriacion.reqseriacion')
					->join('coordinaciona','uaprendizaje.coordinaciona','=','coordinaciona.coordinaciona')
					->select('programaedu.programaedu','programaedu.descripcion','uaprendizaje.uaprendizaje','uaprendizaje.plan','uaprendizaje.descripcionmat','uaprendizaje.HC','uaprendizaje.HL','uaprendizaje.HT','uaprendizaje.creditos','caracter.descripcion as caracter','p_ua.etapa as etapa','etapas.descripcion as descripcionetapa','coordinaciona.descripcion as coordinaciona',DB::raw("GROUP_CONCAT(uaprequisito ORDER BY uaprequisito) as seriacion"))
					->where('uaprendizaje.plan','=',$noplan)
					->where('p_ua.caracter','LIKE',"%$caracter%")
					//->where('detalleseriacion.reqseriacion',"LIKE","%$reqseriacion%")
					->where('uaprendizaje.coordinaciona','LIKE',"%$coordinacion%")
					->where('p_ua.etapa','=',$etapa)
					->whereIn('p_ua.programaedu',array($programaedu,6)) // Carrera + Tronco Común
					->groupBy('programaedu.programaedu','programaedu.descripcion','uaprendizaje.uaprendizaje','uaprendizaje.plan','uaprendizaje.descripcionmat','uaprendizaje.HC','uaprendizaje.HL','uaprendizaje.HT','uaprendizaje.creditos','caracter','etapa','descripcionetapa','coordinaciona')
					->orderBy('uaprendizaje.uaprendizaje','asc')
					->get();
			
		}
		else
		{
			$UAS = DB::table('p_ua')
					->join('programaedu','p_ua.programaedu','=','programaedu.programaedu')
					->join('uaprendizaje','p_ua.uaprendizaje','=','uaprendizaje.uaprendizaje')
					->join('caracter','p_ua.caracter','=','caracter.caracter')
					->join('etapas','p_ua.etapa','=','etapas.etapa')
					->leftjoin('detalleseriacion','p_ua.uaprendizaje','=',"detalleseriacion.uaprendizaje")
					//->join('reqseriacion','detalleseriacion.reqseriacion','=','reqseriacion.reqseriacion')
					->join('coordinaciona','uaprendizaje.coordinaciona','=','coordinaciona.coordinaciona')
					->select('programaedu.programaedu','programaedu.descripcion','uaprendizaje.uaprendizaje','uaprendizaje.plan','uaprendizaje.descripcionmat','uaprendizaje.HC','uaprendizaje.HL','uaprendizaje.HT','uaprendizaje.creditos','caracter.descripcion as caracter','p_ua.etapa as etapa','etapas.descripcion as descripcionetapa','coordinaciona.descripcion as coordinaciona',DB::raw("GROUP_CONCAT(uaprequisito ORDER BY uaprequisito) as seriacion"))
					->where('uaprendizaje.plan','=',$noplan)
					->where('p_ua.etapa','=',$etapa)
					->where('p_ua.caracter','LIKE',"%$caracter%")
					//->where('detalleseriacion.reqseriacion',"LIKE","%$reqseriacion%")
					->where('uaprendizaje.coordinaciona','LIKE',"%$coordinacion%")
					->where('p_ua.programaedu','=',$programaedu)
					->groupBy('programaedu.programaedu','programaedu.descripcion','uaprendizaje.uaprendizaje','uaprendizaje.plan','uaprendizaje.descripcionmat','uaprendizaje.HC','uaprendizaje.HL','uaprendizaje.HT','uaprendizaje.creditos','caracter','etapa','descripcionetapa','coordinaciona')
					->orderBy('uaprendizaje.uaprendizaje','asc')
					->get();
			
		}

		return $UAS;

	}

	public function postObtenerdatauacarrera()
	{
		$noplan = Input::get('noplan');
		$programaedu = Input::get('programaedu');
		$uaprendizaje = Input::get('uaprendizaje');
		$UA = DB::table('p_ua')
					->join('programaedu','p_ua.programaedu','=','programaedu.programaedu')
					->join('uaprendizaje','p_ua.uaprendizaje','=','uaprendizaje.uaprendizaje')
					->leftjoin('detalleseriacion','p_ua.uaprendizaje','=',"detalleseriacion.uaprendizaje")
					->join('etapas','p_ua.etapa','=','etapas.etapa')
					->join('caracter','p_ua.caracter','=','caracter.caracter')
					//->join('reqseriacion','uaprendizaje.reqseriacion','=','reqseriacion.reqseriacion')
					->join('coordinaciona','uaprendizaje.coordinaciona','=','coordinaciona.coordinaciona')
					->select('programaedu.programaedu','programaedu.descripcion','uaprendizaje.uaprendizaje','uaprendizaje.plan','uaprendizaje.descripcionmat','uaprendizaje.HC','uaprendizaje.HL','uaprendizaje.HT','uaprendizaje.creditos','caracter.descripcion as caracter','p_ua.etapa','coordinaciona.descripcion as coordinaciona',DB::raw("GROUP_CONCAT(uaprequisito ORDER BY uaprequisito) as seriacion"))
					->where('uaprendizaje.plan','=',$noplan)
					->where('uaprendizaje.uaprendizaje','=',$uaprendizaje)
					->where('p_ua.programaedu','=',$programaedu)
					->groupBy('programaedu.programaedu','programaedu.descripcion','uaprendizaje.uaprendizaje','uaprendizaje.plan','uaprendizaje.descripcionmat','uaprendizaje.HC','uaprendizaje.HL','uaprendizaje.HT','uaprendizaje.creditos','caracter','p_ua.etapa','coordinaciona')
					->get();
		return $UA;
	}

	public function postContaruas()
	{
		$uaid = Input::get('uaprendizaje');
		$numUAS = DB::table('p_ua')->where('uaprendizaje','=',$uaid)->count();
		return $numUAS;
	}
	public function postEliminarua()
	{
		$uaprendizaje = Input::get("uaprendizaje");

		// Eliminacion con transaccion por seguridad
		DB::transaction(function() use ($uaprendizaje){
			
			DB::table("detalleseriacion")
				->where("uaprendizaje","=",$uaprendizaje)
				->delete();

			DB::table("carga")
				->where('uaprendizaje',"=",$uaprendizaje)
				->delete();

			DB::table("p_ua")
				->where("uaprendizaje","=",$uaprendizaje)
				->delete();

			$UA = UnidadAprendizaje::find($uaprendizaje);
			$UA -> delete();
		});

		return "Unidad de Aprendizaje Eliminada Exitosamente!";
	}

	public function postEliminarpua()
	{
		$programaedu = Input::get('programaedu');
		$uaprendizaje= Input::get('uaprendizaje');

		// Eliminacion con transaccion por seguridad
		DB::transaction(function() use ($programaedu,$uaprendizaje){
			
			DB::table("detalleseriacion")
				->where("programaedu","=",$programaedu)
				->where("uaprendizaje","=",$uaprendizaje)
				->delete();

			DB::table("carga")
				->where("programaedu","=",$programaedu)
				->where("uaprendizaje","=",$uaprendizaje)
				->delete();

			DB::table("p_ua")
				->where("programaedu","=",$programaedu)
				->where("uaprendizaje","=",$uaprendizaje)
				->delete();
		});
	}

	public function postObtenerdataua()
	{
		$uaid = Input::get('uaprendizaje');
		$programaedu = Input::get('programaedu');
		$ua = UnidadAprendizaje::find($uaid);
		
		$datapua = DB::table('p_ua')
					->select('caracter','semestre_sug')
					->where('uaprendizaje','=',$uaid)
					->where('programaedu','=',$programaedu)
					->first();
		/*$uaserieid = Input::get('claveD');
		if(empty($uaserieid))
		{
			$uaserie = "";
		}
		else
		{
			$data = UnidadAprendizaje::find($uaserieid);
			$uaserie = $data->descripcionmat;
		}*/

		//$programas = DB::table('p_ua')->where('uaprendizaje','=',$uaid)->get();
		/*$series= DB::table('detalleseriacion')
						->join('uaprendizaje','detalleseriacion.uaprequisito','=','uaprendizaje.uaprendizaje')
						->select('detalleseriacion.uaprendizaje','detalleseriacion.reqseriacion','detalleseriacion.uaprequisito','detalleseriacion.users_id','uaprendizaje.descripcionmat')
						->where('detalleseriacion.uaprendizaje','=',$uaid)->get();*/
		$consulta = Input::get("consulta"); 
		if(!isset($consulta))
		{
			$programaSeries= DB::table('p_ua')
							->leftjoin('detalleseriacion',function($join){
								$join -> on ('p_ua.programaedu','=','detalleseriacion.programaedu')
										-> on ('p_ua.uaprendizaje','=','detalleseriacion.uaprendizaje');
							})
							->rightjoin('uaprendizaje','p_ua.uaprendizaje','=','uaprendizaje.uaprendizaje')
							->leftjoin('programaedu','p_ua.programaedu','=','programaedu.programaedu')
							->leftjoin('etapas','p_ua.etapa','=','etapas.etapa')
							->leftjoin('caracter','p_ua.caracter','=','caracter.caracter')
							->leftjoin('reqseriacion','detalleseriacion.reqseriacion','=','reqseriacion.reqseriacion')
							->select('p_ua.programaedu','programaedu.descripcion','etapas.descripcion as etapa','caracter.descripcion as caracter','p_ua.semestre_sug','uaprendizaje.uaprendizaje',DB::raw('GROUP_CONCAT(detalleseriacion.uaprequisito,CONCAT(\'(\',SUBSTR(reqseriacion.descripcion FROM 1 FOR 1),\')\')) as series'))
							->where('uaprendizaje.uaprendizaje','=',$uaid)
							->groupBy('p_ua.programaedu','programaedu.descripcion','etapa','caracter','p_ua.semestre_sug','uaprendizaje.uaprendizaje')
							->get();
		}
		else
		{
			$programaSeries= DB::table('detalleseriacion')
							->join('reqseriacion','detalleseriacion.reqseriacion','=','reqseriacion.reqseriacion')
							->join('uaprendizaje','detalleseriacion.uaprequisito','=','uaprendizaje.uaprendizaje')
							->select('detalleseriacion.reqseriacion','detalleseriacion.uaprequisito','uaprendizaje.descripcionmat')
							->where('detalleseriacion.programaedu','=',$programaedu)
							->where('detalleseriacion.uaprendizaje','=',$uaid)
							->orderBy('detalleseriacion.uaprequisito')
							->get();
		}
		$pua = new stdClass();
		if(!isset($datapua))
		{
			$pua->caracter = "";
			$pua->semestre_sug = "";
		}
		else
		{
			$pua->caracter = $datapua->caracter;
			$pua->semestre_sug = $datapua->semestre_sug;
		}

		$data= array(
			'success' => true,
			'uaprendizaje' => $ua->uaprendizaje,
			'descripcionmat' => $ua->descripcionmat,
			//'etapa'=>$ua->etapa,
			'caracter'=>$pua->caracter,
			//'reqseriacion'=>$ua->reqseriacion,
			//'claveD'=>$ua->claveD,
			//'materiaseriada' => $uaserie,
			'coordinaciona'=>$ua->coordinaciona,
			'observa'=>$ua->observa,
			'hc'=>$ua->HC,
			'hl'=>$ua->HL,
			'ht'=>$ua->HT,
			'hpc'=>$ua->HPC,
			'hcl'=>$ua->HCL,
			'he'=>$ua->HE,
			'semestre_sug'=>$pua->semestre_sug,
			'creditos'=>$ua->creditos,
			//'programas'=>$programas,
			'series'=> $programaSeries
		);

		return Response::json($data);
	}

	public function postObtenerdetalleseriacion()
	{
		$programaedu = Input::get('programaedu');
		$uaid = Input::get('uaprendizaje');

		$programaSeries= DB::table('detalleseriacion')
							->join('reqseriacion','detalleseriacion.reqseriacion','=','reqseriacion.reqseriacion')
							->join('uaprendizaje','detalleseriacion.uaprequisito','=','uaprendizaje.uaprendizaje')
							->select('detalleseriacion.reqseriacion','detalleseriacion.uaprequisito','uaprendizaje.descripcionmat')
							->where('detalleseriacion.programaedu','=',$programaedu)
							->where('detalleseriacion.uaprendizaje','=',$uaid)
							->orderBy('detalleseriacion.uaprequisito')
							->get();
		return Response::json($programaSeries);
	}

	public function postActualizarua()
	{

		$clave = Input::get("clave1F");
		$UA = UnidadAprendizaje::find($clave);
		$coord = Input::get('coord');
		//$UA -> plan = $noplan;
		$UA -> descripcionmat = Str::upper(Input::get('materia'));
		$UA -> HC = Input::get('hc');
		$UA -> HL = Input::get('hl');
		$UA -> HT = Input::get('ht');
		$UA -> HPC = Input::get('hpc');
		$UA -> HCL = Input::get('hcl');
		$UA -> HE = Input::get('he');
		$UA -> creditos = Input::get('creditosF');
		//$UA -> fec_aut = date('Y-m-d');
		//$UA -> semestre_sug = Input::get('semestre');
		$UA -> observa = Input::get('observaciones');
		//$UA -> caracter = Input::get('tipoF');
		//$UA -> reqseriacion = Input::get('serie');
		//$UA -> claveD = Input::get('clave2F');
		//$UA -> etapa = Input::get('etapaF');
		if(isset($coord))
			$UA -> coordinaciona = Input::get('coord');
		else
			$UA -> coordinaciona = Input::get('coordinacion_update');
		$UA -> save();

		// VALIDAR ACTUALIZACION EN LA CONSULTA
		$programa = Input::get("programaedu");
		$etapa = Input::get("etapaF");
		$caracter = Input::get("tipoF");
		$semestre = Input::get("semestre");
		$users_id = Input::get("users_id");
		
		if(isset($programa))
		{
			// Transacción por seguridad
			DB::transaction(function() use ($clave,$programa,$etapa,$caracter,$semestre,$users_id){
				// Actualización en la etapa
				DB::table('p_ua')
					->where('programaedu',$programa)
					->where('uaprendizaje',$clave)
					->update(array("etapa" => $etapa,"caracter"=>$caracter,"semestre_sug"=>$semestre));

				// Actualización en las seriaciones
				// Borrar las uas seriadas
				DB::table('detalleseriacion')
					->where('programaedu','=',$programa)
					->where('uaprendizaje','=',$clave)
					->delete();
				
				$tipos = Input::get("seriacion_tipo");
				$claves = Input::get("seriacion_clave");
				
				
				if(isset($claves))
				{
					// Inserción
					foreach ($claves as $key => $value) {
						DB::table('detalleseriacion') -> insert(array('programaedu'=>$programa,'uaprendizaje'=>$clave,'reqseriacion'=>$tipos[$key],'uaprequisito'=>$claves[$key],'users_id'=>$users_id));
					}
				}
			});
		}
		
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

		// ACTUALIZACION DE LAS UAS SERIADAS METODO: ELIMINACION-ALTA

		// Capturar claves seriadas[11236,11237] y tipos [OBLIGATORIAS,OPTATIVAS]
		/*$tipos = Input::get("seriacion_tipo");
		$claves = Input::get("seriacion_clave");
		$users_id = Input::get("users_id");
		$etapa = Input::get('etapaF');
		
		// CONDICION PARA QUE NO AFECTE LA ACTUALIZACION DE LA CONSULTA 
		$programas = Input::get('carreras');
		if(!empty($programas))
		{
			// Eliminar en p_ua Unidades asociadas a las carreras para hacer una actualizacion.
			DB::table('p_ua')
				->where("uaprendizaje","=",$UA -> uaprendizaje)
				->delete();

			// Posteriormente hacer las inserciones en p_ua de las Unidades Aprendizaje asociadas a los programas.
			foreach ($programas as $carrera)
			{
				DB::table('p_ua') -> insert (array('programaedu' => $carrera,'uaprendizaje'=>$clave,'etapa'=>$etapa,'users_id'=>$users_id));
			}
		}

		// Registrar las materias seriadas en detalleseriacion si existen registros
		// Borrar las uas seriadas
		DB::table('detalleseriacion')->where('uaprendizaje','=',$clave)->delete();
		
		if(isset($claves))
		{
			// Inserción
			foreach ($claves as $key => $value) {
				DB::table('detalleseriacion') -> insert(array('uaprendizaje'=>$clave,'reqseriacion'=>$tipos[$key],'uaprequisito'=>$claves[$key],'users_id'=>$users_id));
			}
		}*/


	}

	public function postActualizaretapa()
	{
		$uaprendizaje = Input::get("uaprendizaje");
		$programaedu = Input::get("programaedu");
		$etapa = Input::get("etapa");
		DB::table("p_ua")
					->where("programaedu","=",$programaedu)
					->where("uaprendizaje","=",$uaprendizaje)
					->update(array("etapa"=>$etapa));

		return "Etapa actualizada";
	}
}

