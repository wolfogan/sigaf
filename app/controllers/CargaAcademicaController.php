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
		$uas = UnidadAprendizaje::select('plan','uaprendizaje','descripcionmat')
				->where('caracter','=',1)
				->whereIn('plan',array($plan[0]->plan,$plan[1]->plan))->orderBy('plan','desc')
				->orderBy('uaprendizaje','asc')->get();
		
		// Unidades de aprendizaje: 20101 - 11236 - Matemáticas
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
		return View::make('ca.registro')->with(compact('unidades','planes','periodosPrograma','codigosPeriodo','tiposCaracter','turnos'));
	}

	public function getRegistro2()
	{
		return View::make("ca.registro2");
	}

	public function getConsulta()
	{
		return View::make("ca.consulta");
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
		$grupo = Input::get('grupo_nombre');
		$periodo = Input::get('grupo_periodo');
		$plan = Input::get('grupo_plan');
		$programa = Input::get('grupo_programa');
		$turno = Input::get('grupo_turno');
		DB::table('grupos')->insert(
			array("grupo"=>$grupo,"periodo"=>$periodo,"plan"=>$plan,"programaedu"=>$programa,"turno"=>$turno)
		);

		return "Si se hizo";
	}

	// CONSULTAS A CARGA ACADEMICA
	public function postObtenergrupos()
	{
		$semestre = Input::get('nosemestre');
		$grupos = DB::table('grupos')
					->where('grupo','LIKE',"_".$semestre."_")
					->get();
		return Response::json($grupos);
	}

	public function postObteneruas()
	{
		$plan = Input::get('noplan');
		$caracter = Input::get('caracter');
		$UAS = UnidadAprendizaje::select('uaprendizaje','descripcionmat')
				->where('plan','=',$plan)
				->where('caracter','=',$caracter)
				->orderBy('uaprendizaje','asc')
				->get();
		$uaformateadas = [];
		foreach ($UAS as $ua) {
			$formato = $ua->uaprendizaje." - ".$ua->descripcionmat;
			array_push($uaformateadas, $formato);
		}
		return $uaformateadas;
	}
}