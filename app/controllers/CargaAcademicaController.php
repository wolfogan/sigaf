<?php

class CargaAcademicaController extends BaseController
{
	public function __construct()
	{
		$this->beforeFilter('auth');
	}

	public function getRegistro()
	{
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

		// Plan de Estudio: 20101,20092 (2 últimos planes de estudio)
		$plan = PlanEstudio::select('plan')->orderBy('plan','desc')->take(2)->get();
		
		// Unidades de aprendizaje: 20101 - 11236 - Matemáticas
		$uas = UnidadAprendizaje::select('plan','uaprendizaje','descripcionmat')
				->where('caracter','=',1)
				->whereIn('plan',array($plan[0]->plan,$plan[1]->plan))->orderBy('plan','desc')
				->orderBy('uaprendizaje','asc')->get();
		
		$uas->planes = $planes = array($plan[0]->plan,$plan[1]->plan);;
		$unidades  = [[],[]];
		foreach ($uas as $ua) 
		{
			if($ua->plan == $plan[0]->plan)
			{
				array_push($unidades[0], $ua);
			}
			elseif ($ua->plan==$plan[1]->plan) 
			{
				array_push($unidades[1], $ua);;
			}
		}

		// Cuatrimestral, Semestral
		$periodosPrograma = PeriodoPrograma::select('periodo_pedu','descripcion')->get();

		// Cargar periodos 2010-1, 2010-2
		$periodos = Periodo::select('periodo')->where('fin','>=',date_format(new DateTime("now"),'Y-m-d'))->get();
		$codigosPeriodo = array();
		for ($i=0; $i < count($periodos); $i++) { 
			$codigosPeriodo[] = ["codigo" => $periodos[$i]->periodo,"formato" => str_insert("-",$periodos[$i]->periodo,4)];
		}

		// Oblitatoria, optativa
		$tiposCaracter = Caracter::select('caracter','descripcion')->get();
		
		// Matutino, Vespertino, Interturno
		$turnos = Turno::all();

		// Carreras de los planes de estudio
		$programas = DB::table("plan_programa")
				->join("programaedu","plan_programa.programaedu","=","programaedu.programaedu")
				->select("plan_programa.programaedu","programaedu.descripcion")
				->where("plan_programa.programaedu","<>",6)
				->whereIn("plan_programa.plan",$planes)
				->distinct()
				->get();
		$numPrograma = Auth::user()->programaedu;
		$nombrePrograma = "";
		
		if ($numPrograma!=0) {
			$nombrePrograma = ProgramaEducativo::find($numPrograma);
			$nombrePrograma = $nombrePrograma -> descripcion;
		}
		
		$var_nombre = array("nombrePrograma");

		return View::make('ca.registro')->with(compact('unidades','planes','periodosPrograma','codigosPeriodo','tiposCaracter','turnos','programas',$var_nombre));
		
		//return $nombrePrograma;
	}

	public function getRegistro2()
	{
		$plan = PlanEstudio::select('plan')->orderBy('plan','desc')->take(1)->get();
		$UAS = UnidadAprendizaje::select('uaprendizaje','descripcionmat')
				->where('plan','=',$plan[0]->plan)
				->orderBy('uaprendizaje','asc')
				->get();
		$uasPlanVigente = [];
		foreach ($UAS as $ua) {
			$formato = '"'.$ua->uaprendizaje." - ".$ua->descripcionmat.'"';
			array_push($uasPlanVigente, $formato);
		}
		$uasPV = implode(",", $uasPlanVigente);

		$periodoColumn = DB::table('carga')->select('periodo')->orderBy('periodo','desc')->first();
		$periodo = $periodoColumn -> periodo;
		// PRIMER SEMESTRE
		$UAS = DB::table('carga')
					->select('carga.uaprendizaje','uaprendizaje.descripcionmat')
					->distinct()
					->join('uaprendizaje','carga.uaprendizaje','=','uaprendizaje.uaprendizaje')
					->where('carga.periodo','=',$periodo)
					->where('carga.grupo','LIKE',"_1_")
					->get();
		$uasSemestre1 = [];
		foreach ($UAS as $ua) {
			$formato = '"'.$ua->uaprendizaje." - ".$ua->descripcionmat.'"';
			array_push($uasSemestre1, $formato);
		}
		$uasS1 = implode(",", $uasSemestre1);
		// SEGUNDO SEMESTRE
		$UAS = DB::table('carga')
					->select('carga.uaprendizaje','uaprendizaje.descripcionmat')
					->distinct()
					->join('uaprendizaje','carga.uaprendizaje','=','uaprendizaje.uaprendizaje')
					->where('carga.periodo','=',$periodo)
					->where('carga.grupo','LIKE',"_2_")
					->get();
		$uasSemestre2 = [];
		foreach ($UAS as $ua) {
			$formato = '"'.$ua->uaprendizaje." - ".$ua->descripcionmat.'"';
			array_push($uasSemestre2, $formato);
		}
		$uasS2 = implode(",", $uasSemestre2);
		// TERCER SEMESTRE
		$UAS = DB::table('carga')
					->select('carga.uaprendizaje','uaprendizaje.descripcionmat')
					->distinct()
					->join('uaprendizaje','carga.uaprendizaje','=','uaprendizaje.uaprendizaje')
					->where('carga.periodo','=',$periodo)
					->where('carga.grupo','LIKE',"_3_")
					->get();
		$uasSemestre3 = [];
		foreach ($UAS as $ua) {
			$formato = '"'.$ua->uaprendizaje." - ".$ua->descripcionmat.'"';
			array_push($uasSemestre3, $formato);
		}
		$uasS3 = implode(",", $uasSemestre3);
		// CUARTO SEMESTRE
		$UAS = DB::table('carga')
					->select('carga.uaprendizaje','uaprendizaje.descripcionmat')
					->distinct()
					->join('uaprendizaje','carga.uaprendizaje','=','uaprendizaje.uaprendizaje')
					->where('carga.periodo','=',$periodo)
					->where('carga.grupo','LIKE',"_4_")
					->get();
		$uasSemestre4 = [];
		foreach ($UAS as $ua) {
			$formato = '"'.$ua->uaprendizaje." - ".$ua->descripcionmat.'"';
			array_push($uasSemestre4, $formato);
		}
		$uasS4 = implode(",", $uasSemestre4);
		// QUINTO SEMESTRE
		$UAS = DB::table('carga')
					->select('carga.uaprendizaje','uaprendizaje.descripcionmat')
					->distinct()
					->join('uaprendizaje','carga.uaprendizaje','=','uaprendizaje.uaprendizaje')
					->where('carga.periodo','=',$periodo)
					->where('carga.grupo','LIKE',"_5_")
					->get();
		$uasSemestre5 = [];
		foreach ($UAS as $ua) {
			$formato = '"'.$ua->uaprendizaje." - ".$ua->descripcionmat.'"';
			array_push($uasSemestre5, $formato);
		}
		$uasS5 = implode(",", $uasSemestre5);
		// SEXTO SEMESTRE
		$UAS = DB::table('carga')
					->select('carga.uaprendizaje','uaprendizaje.descripcionmat')
					->distinct()
					->join('uaprendizaje','carga.uaprendizaje','=','uaprendizaje.uaprendizaje')
					->where('carga.periodo','=',$periodo)
					->where('carga.grupo','LIKE',"_6_")
					->get();
		$uasSemestre6 = [];
		foreach ($UAS as $ua) {
			$formato = '"'.$ua->uaprendizaje." - ".$ua->descripcionmat.'"';
			array_push($uasSemestre6, $formato);
		}
		$uasS6 = implode(",", $uasSemestre6);
		// SEPTIMO SEMESTRE
		$UAS = DB::table('carga')
					->select('carga.uaprendizaje','uaprendizaje.descripcionmat')
					->distinct()
					->join('uaprendizaje','carga.uaprendizaje','=','uaprendizaje.uaprendizaje')
					->where('carga.periodo','=',$periodo)
					->where('carga.grupo','LIKE',"_7_")
					->get();
		$uasSemestre7 = [];
		foreach ($UAS as $ua) {
			$formato = '"'.$ua->uaprendizaje." - ".$ua->descripcionmat.'"';
			array_push($uasSemestre7, $formato);
		}
		$uasS7 = implode(",", $uasSemestre7);
		// OCTAVO SEMESTRE
		$UAS = DB::table('carga')
					->select('carga.uaprendizaje','uaprendizaje.descripcionmat')
					->distinct()
					->join('uaprendizaje','carga.uaprendizaje','=','uaprendizaje.uaprendizaje')
					->where('carga.periodo','=',$periodo)
					->where('carga.grupo','LIKE',"_8_")
					->get();
		$uasSemestre8 = [];
		foreach ($UAS as $ua) {
			$formato = '"'.$ua->uaprendizaje." - ".$ua->descripcionmat.'"';
			array_push($uasSemestre8, $formato);
		}
		$uasS8 = implode(",", $uasSemestre8);
		// NOVENO SEMESTRE
		$UAS = DB::table('carga')
					->select('carga.uaprendizaje','uaprendizaje.descripcionmat')
					->distinct()
					->join('uaprendizaje','carga.uaprendizaje','=','uaprendizaje.uaprendizaje')
					->where('carga.periodo','=',$periodo)
					->where('carga.grupo','LIKE',"_9_")
					->get();
		$uasSemestre9 = [];
		foreach ($UAS as $ua) {
			$formato = '"'.$ua->uaprendizaje." - ".$ua->descripcionmat.'"';
			array_push($uasSemestre9, $formato);
		}
		$uasS9 = implode(",", $uasSemestre9);
		
		return View::make("ca.registro2")->with(compact('uasPV','uasS1','uasS2','uasS3','uasS4','uasS5','uasS6','uasS7','uasS8','uasS9'));
	}

	public function getConsulta()
	{
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

		// Cargar periodos 2010-1, 2010-2
		$periodos = Periodo::select('periodo')->where('fin','>=',date_format(new DateTime("now"),'Y-m-d'))->get();
		$codigosPeriodo = array();
		for ($i=0; $i < count($periodos); $i++) { 
			$codigosPeriodo[] = ["codigo" => $periodos[$i]->periodo,"formato" => str_insert("-",$periodos[$i]->periodo,4)];
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
		

		$lapso -> save();

		return $lapso;
	}

	public function postRegistrargrupo()
	{
		$grupo = Input::get('grupo_carrera').Input::get('grupo_semestre').Input::get('grupo_identificador');
		$periodo = Input::get('grupo_periodo');
		$plan = Input::get('grupo_plan');

		$programa = Input::get('grupo_programa');
		$turno = Input::get('grupo_turno');
		DB::table('grupos')->insert(
			array("grupo"=>$grupo,"periodo"=>$periodo,"plan"=>$plan,"programaedu"=>$programa,"turno"=>$turno)
		);

		return $grupo;
	}

	// CONSULTAS A CARGA ACADEMICA
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
				->where('uaprendizaje.caracter','=',$caracter)
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
		foreach ($grupos as $grupo) {
			foreach ($uas as $ua) {
				DB::table('carga')->insert(
					array('grupo' => $grupo,'periodo'=>$periodo,'uaprendizaje'=>$ua,'status'=>3)
					);
			}
		}

		
		return "Carga dada de alta con exito!";
	}

	public function postObtenergruposua()
	{
		$uaprendizaje = Input::get('uaprendizaje');
		$semestre = Input::get('semestre');
		$grupos = DB::table('carga')
					->select('grupo')
					->where('uaprendizaje','=',$uaprendizaje)
					->where('grupo','LIKE',"_".$semestre."_")
					->get();
		return Response::json($grupos);
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

		$uas = DB::table("carga")
						->select("carga.periodo",DB::raw("SUBSTR(carga.grupo FROM 2 FOR 1) as semestre"),"carga.uaprendizaje","uaprendizaje.descripcionmat","uaprendizaje.caracter","uaprendizaje.creditos","uaprendizaje.HC","etapas.descripcion as etapa","uaprendizaje.claveD","uaprendizaje.plan","grupos.programaedu")
						->distinct()
						->join("uaprendizaje","carga.uaprendizaje","=","uaprendizaje.uaprendizaje")
						->join("etapas","uaprendizaje.etapa","=","etapas.etapa")
						->join("grupos","carga.grupo","=","grupos.grupo")
						->where("carga.periodo","=",$periodo)
						->where("grupos.programaedu","=",$programa)
						->get();
		$grupos = DB::table("carga")
						->select("carga.grupo",DB::raw("SUBSTR(carga.grupo FROM 2 FOR 1) as semestre"))
						->distinct()
						->join("grupos","carga.grupo","=","grupos.grupo")
						->where("carga.periodo","=",$periodo)
						->where("grupos.programaedu","=",$programa)
						->get();
		$planSemestres = DB::table("carga")
						->select(DB::raw("SUBSTR(carga.grupo FROM 2 FOR 1) as semestre"),"carga.periodo","grupos.plan")
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