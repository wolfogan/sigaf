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

Route::get('pruebas',function(){

	$UAS = DB::table('p_ua')
				->join('programaedu','p_ua.programaedu','=','programaedu.programaedu')
				->join('uaprendizaje','p_ua.uaprendizaje','=','uaprendizaje.uaprendizaje')
				->join('caracter','uaprendizaje.caracter','=','caracter.caracter')
				->join('reqseriacion','uaprendizaje.reqseriacion','=','reqseriacion.reqseriacion')
				->join('etapas','uaprendizaje.etapa','=','etapas.etapa')
				->join('coordinaciona','uaprendizaje.coordinaciona','=','coordinaciona.coordinaciona')
				->select('programaedu.descripcion','uaprendizaje.uaprendizaje','uaprendizaje.plan','uaprendizaje.descripcionmat','uaprendizaje.HC','uaprendizaje.HL','uaprendizaje.HT','uaprendizaje.HPC','uaprendizaje.HCL','uaprendizaje.HE','uaprendizaje.creditos','uaprendizaje.fec_aut','uaprendizaje.observa','caracter.descripcion as caracter','reqseriacion.descripcion as reqseriacion','uaprendizaje.claveD','etapas.descripcion as etapa','coordinaciona.descripcion as coordinaciona')
				->where('uaprendizaje.plan','=','20102')
				->get();
	$queries = DB::getQueryLog();
	$last_query = end($queries);

	//$u->lastQuery = $last_query;

	return $UAS;
});