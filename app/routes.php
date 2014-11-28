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

	//$uaprendizaje = UnidadAprendizaje::where('uaprendizaje','=','11236')->where('plan','=','20092')->first();

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

	$sql = DB::table('p_ua')
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
						->toSql();
	return $OTRO;
});