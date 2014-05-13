<?php

class PlanEstudioController extends BaseController
{
	// <option value="2013-2">2013-2</option>
	public function __construct()
	{
		$this->beforeFilter('auth');
	}
	

	public function getRegistro()
	{
		//$planestudio = DB::table('planestudio')->distinct()->lists('PE_codigo');
		$planestudio = DB::table('planestudio')->distinct()->select('PE_codigo')->orderBy('PE_codigo','desc')->get();
		$codigosPE = array();
		
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
		
		for ($i=0; $i < count($planestudio); $i++) { 
		$codigosPE[] = ["codigo" => $planestudio[$i]->PE_codigo,"formato" => str_insert("-",$planestudio[$i]->PE_codigo,4)];
		}

		$niveles = NivelPrograma::select('NV_descripcion')->orderBy('NV_codigo','desc')->get();
		
		$tiposPrograma = TipoPrograma::select('TP_descripcion')->get();

		$seriaciones = Seriacion::select('RS_descripcion')->get();

		return View::make('pe.registro')->with(compact('codigosPE','niveles','tiposPrograma','seriaciones'));
	}

	public function getConsulta()
	{
		return View::make('pe.consulta');
	}

	public function getUsuarios()
	{
		return View::make('pe.usuarios');
	}
	
	public function getUsuariosRegistro()
	{
		return View::make('pe.usuariosRegistro');
	}

	public function getBitacora()
	{
		return View::make('pe.bitacora');
	}
	public function getCatalogosadmin()
	{
		return View::make('pe.catalogosAdmin');
	}
}

