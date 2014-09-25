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
Route::controller('cargaacademica','CargaAcademicaController');
Route::controller('disponibilidaddocente','DisponibilidadDocenteController');
Route::controller('ayuda','AyudaController');

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
	DB::delete("delete carga from carga inner join grupos on carga.grupo = grupos.grupo where carga.uaprendizaje = ? and carga.periodo = ? and grupos.programaedu = ?",array(11236,20142,1));
	$queries = DB::getQueryLog();
	$last_query = end($queries);

	//$u->lastQuery = $last_query;

	return $last_query;
});