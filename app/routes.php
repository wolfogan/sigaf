<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the Closure to execute when that URI is requested.
|
*/
// RUTA PRINCIPAL
Route::get('/', function()
{
	return View::make('login');
});

Route::get('main',array('before'=>'auth',function()
{
	return View::make('main.index');
}));

// RUTAS DEL LOGIN
Route::controller('login','UserLoginController');


Route::controller('planestudio','PlanEstudioController');
Route::controller('catalogos','CatalogosController');
Route::controller('cargaacademica','CargaAcademicaController');
Route::controller('disponibilidaddocente','DisponibilidadDocenteController');
Route::controller('ayuda','AyudaController');
Route::controller('usuarios','UserLoginController');
Route::controller('horarios','HorariosController');

Route::get('pruebas',function(){

	/*$uaprendizaje = UnidadAprendizaje::where('uaprendizaje','=','11236')->where('plan','=','20092')->first();

	$plan = PlanEstudio::find('20101')->nivelD;

	$programas = DB::table("plan_programa")
				->join("programaedu","plan_programa.programaedu","=","programaedu.programaedu")
				->select("plan_programa.programaedu","programaedu.descripcion")
				->whereIn("plan_programa.plan",array(20092,20101))
				->distinct()
				->get();

	$nombrePrograma = ProgramaEducativo::find(4);

	$planSemestres = DB::table("carga")
						->select(DB::raw("SUBSTR(carga.grupo FROM 2 FOR 1) as semestre"),"grupos.plan")
						->join("grupos","carga.grupo","=","grupos.grupo")
						->where("carga.periodo","=",'20142')
						->groupBy("semestre","carga.periodo")
						->get();
	
	//DB::delete("delete carga from carga inner join grupos on carga.grupo = grupos.grupo where carga.uaprendizaje = ? and carga.periodo = ? and grupos.programaedu = ?",array(11236,20142,1));


	$programas = ProgramaEducativo::where('programaedu','<>','6')->get();

	$queries = DB::getQueryLog();
	$last_query = end($queries);

	/*$sql = DB::table('p_ua')
				->join('programaedu','p_ua.programaedu','=','programaedu.programaedu')
				->join('etapas','p_ua.etapa','=','etapas.etapa')
				->rightjoin('uaprendizaje','p_ua.uaprendizaje','=','uaprendizaje.uaprendizaje')
				->join('caracter','uaprendizaje.caracter','=','caracter.caracter')
				->join('coordinaciona','uaprendizaje.coordinaciona','=','coordinaciona.coordinaciona')
				->leftjoin('detalleseriacion',function($join){
						$join->on('detalleseriacion.uaprendizaje','=','p_ua.uaprendizaje')
							->on('detalleseriacion.programaedu','=','p_ua.programaedu');
						})
				->select('programaedu.programaedu','programaedu.siglas','uaprendizaje.uaprendizaje','uaprendizaje.plan','uaprendizaje.descripcionmat','uaprendizaje.HC','uaprendizaje.HL','uaprendizaje.HT','uaprendizaje.creditos','caracter.descripcion as caracter','etapas.descripcion as etapa','coordinaciona.descripcion as coordinaciona',DB::raw("GROUP_CONCAT(uaprequisito ORDER BY uaprequisito) as seriacion"))
				->where('uaprendizaje.plan','=',20092)
				->groupBy('programaedu.programaedu','programaedu.siglas','uaprendizaje.uaprendizaje','uaprendizaje.plan','uaprendizaje.descripcionmat','uaprendizaje.HC','uaprendizaje.HL','uaprendizaje.HT','uaprendizaje.creditos','caracter','etapa','coordinaciona')
				//->toSql();
				->get();

	//$u->lastQuery = $last_query;

	$OTRO =  DB::table("carga")
						//->select("carga.periodo",DB::raw("SUBSTR(carga.grupo FROM 2 FOR 1) as semestre"),"carga.uaprendizaje","uaprendizaje.descripcionmat","uaprendizaje.caracter","uaprendizaje.creditos","uaprendizaje.HC","etapas.descripcion as etapa","uaprendizaje.claveD","uaprendizaje.plan","grupos.programaedu")
						->select("carga.periodo","carga.semestre","carga.uaprendizaje","uaprendizaje.descripcionmat","uaprendizaje.caracter","uaprendizaje.creditos","uaprendizaje.HC","etapas.descripcion as etapa","carga.semestre","uaprendizaje.plan","grupos.programaedu")
						->distinct()
						->join("uaprendizaje","carga.uaprendizaje","=","uaprendizaje.uaprendizaje")
						->join("p_ua","carga.uaprendizaje","=","p_ua.uaprendizaje")
						->join("etapas","p_ua.etapa","=","etapas.etapa")
						->join("grupos","carga.grupo","=","grupos.grupo")
						->where("carga.periodo","=",20141)
						->where("grupos.programaedu","=",3)
						->toSql();*/
	/*$datapua = DB::table('p_ua')
					->select('caracter','semestre_sug')
					->where('uaprendizaje','=',11236)
					->where('programaedu','=',1)
					->first();*/

	// Unidades de aprendizaje: 20101 - 11236 - Matemáticas
	/*	$uas = DB::table('p_ua')
				->select('uaprendizaje.plan','p_ua.uaprendizaje','uaprendizaje.descripcionmat')
				->join('uaprendizaje','p_ua.uaprendizaje','=','uaprendizaje.uaprendizaje')
				->where('p_ua.caracter','=',1)
				->whereIn('uaprendizaje.plan',array(20101,20092))
				->orderBy('plan','desc')
				->orderBy('p_ua.uaprendizaje','asc')
				->get();

		$contenido = "";
		foreach ($uas as $key => $value) {
			$contenido .= $uas[$key]->plan;
		}

		$uas["planes"] = $planes = array(20101,20092);
	return var_dump($uas);*/
	/*$planes = PlanEstudio::select('plan') -> orderBy('plan','desc') -> take(2) -> get() -> toArray();
	$planesWhereIn = [];
	foreach ($planes as $key => $value) {
		$planesWhereIn[] = $planes[$key]['plan'];
	}

	$planes = PlanEstudio::select('plan') -> orderBy('plan','desc') -> take(2) -> get() ->toArray();
	$enviarPlanes = [];
	foreach ($planes as $key => $value) 
	{
		$enviarPlanes[] = $planes[$key] -> plan;
	}
		
	$enviarPlanes["cantidad"] = count($planes);
	
	$uas = DB::table("carga")
						->select('carga.periodo','carga.semestre','carga.uaprendizaje','uaprendizaje.descripcionmat','p_ua.caracter','uaprendizaje.creditos','uaprendizaje.HC','etapas.descripcion as etapa','uaprendizaje.plan','carga.programaedu',DB::raw('GROUP_CONCAT(DISTINCT detalleseriacion.uaprequisito) as series'))
						->join('uaprendizaje','carga.uaprendizaje' , '=' , 'uaprendizaje.uaprendizaje')
						->join('p_ua',function($join){
							$join->on('carga.uaprendizaje','=','p_ua.uaprendizaje')
								->on('carga.programaedu','=','p_ua.programaedu');
  						})
						->join('etapas','p_ua.etapa','=','etapas.etapa')
						->leftjoin('detalleseriacion',function($join){
							$join->on('carga.uaprendizaje','=','detalleseriacion.uaprendizaje')
								->on('carga.programaedu', '=' ,'detalleseriacion.programaedu');
						})
						->groupBy('carga.periodo','carga.semestre','carga.uaprendizaje','uaprendizaje.descripcionmat','p_ua.caracter','uaprendizaje.creditos','uaprendizaje.HC','etapa','uaprendizaje.plan','carga.programaedu')
						//->where("carga.periodo","=",$periodo)
						//->where("carga.programaedu","=",$programa)
						->toSql();
	$periodo = 20141;
	$programa = 1;
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
				" ,array('periodo' => $periodo,'programa' => $programa)); // :variable array('variable' => valor)*/

	$programa = 1;
	$semestre = 1;
	$uaprendizaje = 11236;
	$periodo = 20141;
	$gruposAll = DB::select(DB::raw("SELECT CONCAT(grupos.grupo,' - T',SUBSTR((SELECT turnos.descripcion FROM turnos WHERE turnos.turno = grupos.turno) FROM 1 FOR 1)) as grupo
								FROM grupos WHERE grupos.programaedu = ? AND grupos.periodo = ? AND grupos.grupo LIKE '_".$semestre."_' ") , array($programa, $periodo));
	$queries = DB::getQueryLog();
	$last_query = end($queries);
	return var_dump($gruposAll);
	
});