<?php

class CargaAcademicaController extends BaseController
{
	public function __construct()
	{
		$this->beforeFilter('auth');
	}
	
	/**
	 * Obtener la vista del registro inicial de carga acádemica.
	 * @return [type]
	 */
	public function getRegistro()
	{
		// Plan de Estudio: 20101,20092 (2 últimos planes de estudio)
		$planes = PlanEstudio::select('plan') -> orderBy('plan','desc') -> take(2) -> get();
		$numPlanes = count($planes);
		return View::make('ca.registro')->with('numPlanes',$numPlanes);
	}

	public function getCatalogos()
	{
		// Cuatrimestral, Semestral
		$periodosPrograma = PeriodoPrograma::select('periodo_pedu','descripcion')->get();

		// Cargar periodos 2010-1, 2010-2
		$periodos = Periodo::select('periodo')->where('fin','>=',date_format(new DateTime("now"),'Y-m-d'))->get();
		
		$codigosPeriodo = array(); // ó []
		// ["20101" => "2010-1"]
		for ($i=0 ; $i < count($periodos) ; $i++)
		{ 
			$codigosPeriodo[] = ["codigo" => $periodos[$i]->periodo,"formato" => Snippets::str_insert("-",$periodos[$i]->periodo,4)];
		}

		// Oblitatoria, optativa
		$tiposCaracter = Caracter::select('caracter','descripcion')->get();
		
		// Matutino, Vespertino, Interturno
		$turnos = Turno::all();

		// 1 - Artes, 2 - Administración
		/*$numPrograma = Auth::user()->programaedu;
		
		// 0 - Administrador,!0 - Coordinador
		// Obtener nombre en caso de ser coordinador
		$nombrePrograma = "";
		if ($numPrograma != 0) 
		{
			$nombrePrograma = ProgramaEducativo::find($numPrograma);
			$nombrePrograma = $nombrePrograma -> descripcion;
		}
		
		$var_nombre = array("nombrePrograma");

		// Obtener Planes
		$planes = PlanEstudio::select('plan') -> orderBy('plan','desc') -> take(2) -> get();
		$numPlanes = count($planes);
		*/
			// Catalogos y unidades de aprendizaje de los planes de estudio.
		$data = compact('periodosPrograma','codigosPeriodo','tiposCaracter','turnos','unidades');

		return Response::json($data);
		
		
	}
	
	public function getConsulta()
	{
		
		// Cargar periodos 2010-1, 2010-2
		$periodos = Periodo::select('periodo')->where('fin','>=',date_format(new DateTime("now"),'Y-m-d'))->get();
		$codigosPeriodo = array();
		for ($i=0; $i < count($periodos); $i++) { 
			$codigosPeriodo[] = ["codigo" => $periodos[$i]->periodo,"formato" => Snippets::str_insert("-",$periodos[$i]->periodo,4)];
		}

		// Carreras de los planes de estudio: ARTES, CONTADURIA, INFORMATICA, ETC.
		$programas = ProgramaEducativo::where('programaedu','<>','6')->get();

		// Matutino, Vespertino, Interturno
		$turnos = Turno::all();

		return View::make("ca.consulta")->with(compact('codigosPeriodo','programas','turnos'));
	}


	// Altas a tablas principales
	public function postRegistrarperiodo()
	{
		$lapso = new Periodo;
		$p = Input::get('periodoAnio').Input::get('periodoLapso');
		$lapso -> periodo = $p;
		$lapso -> periodo_pedu = Input::get('periodoTipo');
		$lapso -> year = Input::get('periodoAnio');
		$lapso -> mes = Input::get('periodoLapso');
		$lapso -> descripcion = Input::get('periodoDescripcion');
		$lapso -> inicio = Input::get('periodoFechaInicio');
		$lapso -> fin = Input::get('periodoFechaFin');
		$lapso -> users_id = Input::get('periodoUsersId');
		

		$lapso -> save();

		return $lapso;
	}

	public function postRegistrargrupo()
	{
		$grupo = Input::get('grupo_carrera').Input::get('grupo_semestre').Input::get('grupo_identificador');
		$periodo = Input::get('grupo_periodo');
		$plan = Input::get('grupo_plan');
		$users_id = Input::get('grupo_usersid');

		$programa = Input::get('grupo_programa');
		$turno = Input::get('grupo_turno');
		DB::table('grupos')->insert(
			array("grupo"=>$grupo,"periodo"=>$periodo,"plan"=>$plan,"programaedu"=>$programa,"turno"=>$turno,"users_id"=>$users_id)
		);

		return $grupo;
	}

	// CONSULTAS A CARGA ACADEMICA
	
	// Obtener programas por usuario 
	public function postObtenernombreprograma()
	{
		$programa = Input::get('programa');

		$nombre = ProgramaEducativo::find($programa);

		return $nombre->descripcion;
	}

	public function postObtenerprogramasadmin()
	{
		//$programa = Input::get('programa');
		$planesWhereIn = Input::get("planes");

		
		// Carreras de los planes de estudio
		$programas = DB::table("plan_programa")
				->join("programaedu","plan_programa.programaedu","=","programaedu.programaedu")
				->select("plan_programa.programaedu","programaedu.descripcion")
				->where("plan_programa.programaedu","<>",6)
				->whereIn("plan_programa.plan",$planesWhereIn)
				->distinct()
				->get();
		// Catalogos y programas educativos
		
		
		return Response::json($programas);
	}

	public function postObtenerplanes()
	{
		$planes = PlanEstudio::select('plan') -> orderBy('plan','desc') -> take(2) -> get();
		
		$enviarPlanes = [];
		foreach ($planes as $key => $value) 
		{
			$enviarPlanes[] = $planes[$key] -> plan;
		}
			
		$enviarPlanes["cantidad"] = count($planes);
			
			return $enviarPlanes;
	}

	public function postObtenergrupos()
	{
		$semestre = Input::get('nosemestre');
		$plan = Input::get('noplan');
		$periodo = Input::get('noperiodo');
		$programa = Input::get('noprograma');

		$grupos = DB::table('grupos')
					->where('grupo','LIKE',"_".$semestre."_")
					->where('plan','=',$plan)
					->where('periodo','=',$periodo)
					->where('programaedu','=',$programa)
					->get();
		return Response::json($grupos);
	}

	public function postObtenergruposperiodo()
	{
		$programa = Input::get("programa");
		$periodo = Input::get("periodo");
		
		$grupos = DB::table("grupos")
					->where("programaedu","=",$programa)
					->where("periodo","=",$periodo)
					->get();

		return $grupos;
	}

	public function postObteneruas()
	{
		$plan = Input::get('noplan');
		$programa = Input::get('programa');
		$caracter = Input::get('caracter');
		// Traer uas aprendizaje con las de tronco comun
		$UAS = DB::table('p_ua')
				->join('uaprendizaje','p_ua.uaprendizaje','=','uaprendizaje.uaprendizaje')
				->select('p_ua.uaprendizaje','uaprendizaje.descripcionmat')
				->whereIn('p_ua.programaedu',array($programa,6))
				->where('uaprendizaje.plan','=',$plan)
				->where('p_ua.caracter','=',$caracter)
				->orderBy('p_ua.uaprendizaje','asc')
				->get();
		
		$uaformateadas = [];
		
		foreach ($UAS as $ua) {
			$formato = $ua->uaprendizaje." - ".$ua->descripcionmat;
			array_push($uaformateadas, $formato);
		}
		return $uaformateadas;
	}
	
	public function postRegistrarcarga()
	{
		$grupos = Input::get('grupos');
		$uas = Input::get('uas');
		$periodo = Input::get('periodo');
		$programa = Input::get('programa');
		$semestre = Input::get('semestre');
		$users_id = Input::get('usersid');
		foreach ($grupos as $grupo) {
			foreach ($uas as $ua) {
				DB::table('carga')->insert(
					array('grupo' => $grupo,'periodo'=>$periodo,'programaedu'=>$programa,'uaprendizaje'=>$ua,'semestre'=>$semestre,'users_id'=>$users_id)
					);
			}
		}

		
		return "Carga dada de alta con exito!";
	}

	public function postObtenergruposua()
	{
		$uaprendizaje = Input::get('uaprendizaje');
		$programa = Input::get('programa');
		$periodo = Input::get('periodo');
		$semestre = Input::get('semestre');

		$gruposAll = DB::table('carga')
					->select('grupo')
					->where('programaedu' , '=' , $programa)
					->where('periodo','=',$periodo)
					->where('semestre' , '=' , $semestre)//->where('grupo','LIKE',"_".$semestre."_")
					->get();
		
		$gruposUA = DB::table('carga')
					->select('grupo')
					->where('programaedu' , '=' , $programa)
					->where('periodo','=',$periodo)
					->where('semestre' , '=' , $semestre)
					->where('uaprendizaje','=',$uaprendizaje)
					->get();
		
		foreach ($gruposAll as $keyA => $valueA) {
			foreach ($gruposUA as $keyB => $valueB) {
				if($gruposAll[$keyA]->grupo==$gruposUA[$keyB]->grupo)
				{
					$gruposAll[$keyA]->check = true;
					'brake 1';
				}
				else
					$gruposAll[$keyA]->check = false;
			}
		}
		return Response::json($gruposAll);
	}

	public function postFormateargruposturnos()
	{
		$grupos = Input::get('grupos');
		//$gruposTurno = new stdClass(); // Clase vacia php para recoger variables.
		$gruposTurno = "";
		// Alternativo al for para ultimo elemento
		$ultimo = end($grupos);

		foreach ($grupos as $grupo) {
			$turno = DB::table('grupos')
						->select('turnos.descripcion')
						->join('turnos','grupos.turno','=','turnos.turno')
						->where('grupos.grupo','=',$grupo)
						->first();
			if($ultimo!=$grupo)
				$gruposTurno .= (string)$grupo." T".substr($turno->descripcion, 0,1).", ";
			else
				$gruposTurno .= (string)$grupo." T".substr($turno->descripcion, 0,1);
		}

		return $gruposTurno;
	}

	public function postEliminaruacarga()
	{
		$uaprendizaje = Input::get("uaprendizaje");
		$periodo = Input::get("periodo");
		$programa = Input::get('programa');
		/*DB::table("carga")
				->where("carga.uaprendizaje","=",$uaprendizaje)
				->where("carga.periodo","=",$periodo)
				->delete();*/
		DB::delete("delete carga from carga inner join grupos on carga.grupo = grupos.grupo where carga.periodo = ? and carga.uaprendizaje = ? and grupos.programaedu = ?",array($periodo,$uaprendizaje,$programa));
		return "Unidad de aprendizaje dada de baja de la carga correctamente!";
	}

	public function postEliminarcarga()
	{
		DB::table("carga")->truncate();
	}

	public function postObtenercarga()
	{
		$periodo = Input::get("periodo");
		$programa = Input::get("programa");

		$uas = DB::select("SELECT carga.periodo,
				carga.semestre,
				carga.uaprendizaje,
				uaprendizaje.descripcionmat,
				p_ua.caracter,
				uaprendizaje.creditos,
				uaprendizaje.HC,
				etapas.descripcion as etapa,
				uaprendizaje.plan,
				carga.programaedu,
				GROUP_CONCAT(DISTINCT detalleseriacion.uaprequisito) as series,
				(SELECT GROUP_CONCAT(cr.grupo) FROM carga cr WHERE cr.uaprendizaje = carga.uaprendizaje AND cr.programaedu = carga.programaedu AND cr.semestre = carga.semestre) as grupos
				FROM carga
				INNER JOIN uaprendizaje ON carga.uaprendizaje  =  uaprendizaje.uaprendizaje
				INNER JOIN p_ua ON carga.uaprendizaje = p_ua.uaprendizaje AND
													 carga.programaedu = p_ua.programaedu
				INNER JOIN etapas ON p_ua.etapa = etapas.etapa
				LEFT JOIN detalleseriacion ON carga.uaprendizaje = detalleseriacion.uaprendizaje 					AND	carga.programaedu = detalleseriacion.programaedu
				WHERE
				carga.periodo = :periodo AND
				carga.programaedu = :programa
				GROUP BY
							carga.periodo,
							carga.semestre,
							carga.uaprendizaje,
							uaprendizaje.descripcionmat,
							p_ua.caracter,
							uaprendizaje.creditos,
							uaprendizaje.HC,etapa,
							uaprendizaje.plan,carga.programaedu
				" ,array('periodo' => $periodo,'programa' => $programa));


		$grupos = DB::table("carga")
						->select("carga.grupo","carga.semestre")
						->distinct()
						->join("grupos","carga.grupo","=","grupos.grupo")
						->where("carga.periodo","=",$periodo)
						->where("grupos.programaedu","=",$programa)
						->get();
		
		$planSemestres = DB::table("carga")
						->select("carga.semestre","carga.periodo","grupos.plan")
						->join("grupos","carga.grupo","=","grupos.grupo")
						->where("carga.periodo","=",$periodo)
						->where("grupos.programaedu","=",$programa)
						->groupBy("semestre","carga.periodo")
						->get();

		foreach ($grupos as $g) {
			$turno = DB::table('grupos')
						->select('turnos.descripcion')
						->join('turnos','grupos.turno','=','turnos.turno')
						->where('grupos.grupo','=',$g->grupo)
						->first();

			$g->grupo = (string)$g->grupo." T".substr($turno->descripcion, 0,1);
		}

		return Response::json(array('uas' => $uas,'grupos'=> $grupos,'planSemestres'=>$planSemestres));

	}

}