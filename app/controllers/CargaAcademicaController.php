<?php

class CargaAcademicaController extends BaseController
{
	public function __construct()
	{
		$this->beforeFilter('auth');
	}

	public function getRegistro()
	{

		// Plan de Estudio: 20101,20092 (2 últimos planes de estudio)
		$plan = PlanEstudio::select('plan')->orderBy('plan','desc')->take(2)->get();
		$uas = UnidadAprendizaje::select('plan','uaprendizaje','descripcionmat')->whereIn('plan',array($plan[0]->plan,$plan[1]->plan))->orderBy('plan','desc')->orderBy('uaprendizaje','asc')->get();
		
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
		
		return View::make('ca.registro')->with(compact('unidades','planes','periodosPrograma'));
	}

	public function getRegistro2()
	{
		return View::make("ca.registro2");
	}

	public function getConsulta()
	{
		return View::make("ca.consulta");
	}
}