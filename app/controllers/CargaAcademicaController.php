<?php

class CargaAcademicaController extends BaseController
{
	public function __construct()
	{
		$this->beforeFilter('auth');
	}

	public function getRegistro()
	{
		$plan = PlanEstudio::select('plan')->orderBy('plan','desc')->take(2)->get();
		$uas = UnidadAprendizaje::select('plan','uaprendizaje','descripcionmat')->whereIn('plan',array($plan[0]->plan,$plan[1]->plan))->orderBy('plan','desc')->orderBy('uaprendizaje','asc')->get();
		$uas->planes = array($plan[0]->plan,$plan[1]->plan);;
		$prueba  = [[],[]];
		foreach ($uas as $ua) {
			if($ua->plan == $plan[0]->plan)
				array_push($prueba[0], $ua);
			elseif ($ua->plan==$plan[1]->plan) {
				array_push($prueba[1], $ua);;
			}
		}
		
		return View::make('ca.registro')->with(compact('prueba'));
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