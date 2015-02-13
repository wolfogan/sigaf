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
		// 1.- Cargar periodos 2010-1, 2010-2 con validación de fecha.
		$periodos = Periodo::select('periodo')->where('fin','>=',date_format(new DateTime("now"),'Y-m-d'))->get();
		// 2.- Formatear períodos.
		$codigosPeriodo = array(); // ó []
		// ["20101" => "2010-1"]
		for ($i=0 ; $i < count($periodos) ; $i++)
		{ 
			$codigosPeriodo[] = ["codigo" => $periodos[$i]->periodo,"formato" => Snippets::str_insert("-",$periodos[$i]->periodo,4)];
		}

		// 3.- Cargar programas educativo: 1 - Artes - LA - etc..... menos tronco común
		$programas = ProgramaEducativo::where('programaedu','<>','6')->get();

		// CATALOGOS GENERALES:
		// 
		// Cuatrimestral, Semestral
		$periodosPrograma = PeriodoPrograma::select('periodo_pedu','descripcion')->get();

		// Oblitatoria, optativa
		$tiposCaracter = Caracter::select('caracter','descripcion')->get();
		
		// Matutino, Vespertino, Interturno
		$turnos = Turno::all();
		

		$data = compact('codigosPeriodo','programas','periodosPrograma','tiposCaracter','turnos','unidades');
		return View::make('ca.registro')->with($data);
	}

	public function getSubsecuente()
	{
		// 2 Planes de estudio actuales
		$planes = PlanEstudio::select('plan') -> orderBy('plan','desc') -> take(2) -> get();
		$codigosPlanes = [];
		foreach ($planes as $plan) {
			$codigosPlanes[] = ["codigo" => $plan->plan, "formato" => Snippets::str_insert("-",$plan->plan,4)];
		}
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

		// Carreras de los planes de estudio: ARTES, CONTADURIA, INFORMATICA, ETC.
		$programas = ProgramaEducativo::where('programaedu','<>','6')->get();

		// Obtener último período de carga
		$ultimoPeriodoCarga = DB::table('carga')
								->select('periodo')
								->orderBy('periodo','desc')
								->first();

		return View::make('ca.subsecuente')->with(compact('codigosPlanes','periodosPrograma','programas','codigosPeriodo','tiposCaracter','turnos','unidades','ultimoPeriodoCarga'));
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
		// Tabla plan_programa
		$programaedu = Input::get("programaedu");

		$planes = DB::table('plan_programa') 
					-> orderBy('plan','desc')
					-> where('programaedu',$programaedu) 
					-> take(2) 
					-> get();
		
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
		// Formatear unidades para que aparezca de la siguiente forma 11236 - Matemáticas
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
		// Obtener grupos registrados se uso inyección por la complejidad del query en like
		$gruposAll = DB::select(DB::raw("SELECT CONCAT(grupos.grupo,' - T',SUBSTR((SELECT turnos.descripcion FROM turnos WHERE turnos.turno = grupos.turno) FROM 1 FOR 1)) as grupo
								FROM grupos WHERE grupos.programaedu = ? AND grupos.periodo = ? AND grupos.grupo LIKE '_".$semestre."_' ") , array($programa, $periodo));
		
		$gruposUA = DB::select("SELECT CONCAT(carga.grupo,' - T',SUBSTR((SELECT turnos.descripcion FROM turnos WHERE turnos.turno = (SELECT grupos.turno FROM grupos WHERE grupos.grupo = carga.grupo and grupos.periodo = carga.periodo)) FROM 1 FOR 1)) as grupo
								FROM carga WHERE carga.programaedu = :programaedu AND carga.periodo = :periodo AND carga.semestre = :semestre AND  carga.uaprendizaje = :uaprendizaje" , array('programaedu' => $programa, 'periodo' => $periodo, 'semestre' => $semestre, 'uaprendizaje' => $uaprendizaje));
		/*DB::table('grupos')
					->select('grupo')
					->distinct()
					->where('programaedu' , '=' , $programa)
					->where('periodo','=',$periodo)
					->where('grupo','LIKE',"_".$semestre."_")
					->get();
		// Obtener grupos asociados en la carga
		$gruposUA = DB::table('carga')
					->select('grupo')
					->where('programaedu' , '=' , $programa)
					->where('periodo','=',$periodo)
					->where('semestre' , '=' , $semestre)
					->where('uaprendizaje','=',$uaprendizaje)
					->get();*/
		/* Formatear grupos
		foreach ($gruposAll as $g) {
			$turno = DB::table('grupos')
						->select('turnos.descripcion')
						->join('turnos','grupos.turno','=','turnos.turno')
						->where('grupos.grupo','=',$g->grupo)
						->first();

			$g->grupo = (string)$g->grupo.' - '." T".substr($turno->descripcion, 0,1);
		}*/
		// Marcar grupos que coinciden y agregar atributo check->true o false 
		// dependiendo si esta asociado para mostrar seleccionado el item
		$gruposSource = [];
		foreach ($gruposAll as $keyA => $valueA) {
			
			$gruposSource[] = $gruposAll[$keyA] -> grupo;
			
			foreach ($gruposUA as $keyB => $valueB) {
				
				if($gruposUA[$keyB]->grupo==$gruposAll[$keyA]->grupo)
				{
					$gruposAll[$keyA]->check = true;
					break;
				}
				else
					$gruposAll[$keyA]->check = false;
			}
		}
		$data = new stdClass();
		$data -> grupos = $gruposAll;
		$data -> source = $gruposSource;
		//$data -> gruposua = $gruposUA;
		
		
		return Response::json($data);
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
		$semestre = Input::get('semestre');
		/*DB::table("carga")
				->where("carga.uaprendizaje","=",$uaprendizaje)
				->where("carga.periodo","=",$periodo)
				->delete();*/
		DB::delete("delete carga from carga inner join grupos on carga.grupo = grupos.grupo where carga.periodo = ? and carga.uaprendizaje = ? and grupos.programaedu = ? and carga.semestre = ?",array($periodo,$uaprendizaje,$programa,$semestre));
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
		$semestre = Input::get('semestre');
		$grupo = Input::get('grupo');

		if(empty($semestre))
			$semestre = "";
		else
			$semestre = Input::get("semestre");

		if(empty($grupo))
			$grupo = "";
		else
			$grupo = Input::get("grupo");

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
				(SELECT GROUP_CONCAT(cr.grupo) FROM carga cr WHERE cr.uaprendizaje = carga.uaprendizaje AND cr.programaedu = carga.programaedu AND cr.semestre = carga.semestre and cr.periodo = carga.periodo) as grupos,
				(SELECT GROUP_CONCAT( DISTINCT SUBSTR(turnos.descripcion FROM 1 FOR 1)) FROM carga ca INNER JOIN grupos ON ca.grupo = grupos.grupo INNER JOIN turnos ON grupos.turno = turnos.turno WHERE ca.semestre = carga.semestre AND ca.uaprendizaje=carga.uaprendizaje AND ca.programaedu = carga.programaedu) AS turnos 
				FROM carga
				INNER JOIN uaprendizaje ON carga.uaprendizaje  =  uaprendizaje.uaprendizaje
				INNER JOIN p_ua ON carga.uaprendizaje = p_ua.uaprendizaje AND
													 carga.programaedu = p_ua.programaedu
				INNER JOIN etapas ON p_ua.etapa = etapas.etapa
				LEFT JOIN detalleseriacion ON carga.uaprendizaje = detalleseriacion.uaprendizaje 					AND	carga.programaedu = detalleseriacion.programaedu
				WHERE
				carga.periodo = :periodo AND
				carga.programaedu = :programa AND
				carga.semestre LIKE '%" . $semestre . "%' AND
				carga.grupo LIKE '%" .$grupo. "%'
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
						->where("carga.grupo","LIKE","%".$grupo."%")
						->groupBy("carga.semestre","carga.periodo")
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


	public function postActualizargrupos()
	{
		$programaedu = Input::get('grupos_programa');
		$periodo = Input::get('grupos_periodo');
		$semestre = Input::get('grupos_semestre');
		$uaprendizaje = Input::get('grupos_uaprendizaje');
		$users_id = Input::get('grupos_userid');
		$grupos = Input::get('grupos_grupos');
		$grupos = explode(',', $grupos);
		
		DB::transaction(function() use($programaedu,$periodo,$semestre,$uaprendizaje,$users_id,$grupos){
			DB::table('carga')
				->where('programaedu',$programaedu)
				->where('periodo',$periodo)
				->where('semestre',$semestre)
				->where('uaprendizaje',$uaprendizaje)
				->delete();

			foreach ($grupos as $grupo) {
				DB::table('carga')
				->insert(array('grupo'=>$grupo,'periodo'=>$periodo,'programaedu'=>$programaedu,'semestre'=>$semestre,'uaprendizaje'=>$uaprendizaje,'users_id'=>$users_id));
			}
		});

		return implode(',', $grupos);
	}

}