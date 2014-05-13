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

	$caracter = new Caracter;
		$caracter->CAR_descripcion = "Uno";
		
		
		// Guardamos
		$caracter -> save();

	/* Obtener códigos de plan de estudio distintos. select distinct pe_codigo from planestudio
	$planestudio = DB::table('planestudio')->distinct()->select('PE_codigo')->orderBy('PE_codigo','desc')->get();

	function str_insert($string_add,$string_target,$offset)
	{
		$part1 = substr($string_target,0, $offset);
		$part2 = substr($string_target, $offset);

		return $part1.$string_add.$part2;
	}

	$pe = array();
	for ($i=0; $i < count($planestudio); $i++) { 
		$pe[] = ["codigo" => $planestudio[$i]->PE_codigo,"formato" => str_insert("-",$planestudio[$i]->PE_codigo,4)];
	}



	$nivel = NivelPrograma::lists('NV_descripcion');
	
	$detalleNivPrograma = DB::table('detallenivprograma')->lists('DNP_descripcion');

	$etapa = Etapa::lists('ET_descripcion');

	$caracter = Caracter::lists('CAR_descripcion');

	$seriacion = Seriacion::lists('RS_descripcion');

	$coordinacion = Coordinacion::lists('CO_descripcion');

	$tipoPrograma = TipoPrograma::lists('TP_descripcion');

	return var_dump($pe)+var_dump($nivel)+var_dump($detalleNivPrograma)+var_dump($etapa)+var_dump($caracter)+var_dump($seriacion)+var_dump($coordinacion)+var_dump($tipoPrograma);*/
});