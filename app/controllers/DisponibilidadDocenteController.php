<?php

class DisponibilidadDocenteController extends BaseController
{
	public function __construct()
	{
		$this->beforeFilter('auth');
	}

	public function getRegistro()
	{
		$ciudadId = Auth::user()->ciudad; // Obtiene la ciudad del usuario actual
		
		$estadoId = "";
		$paisId = "";

		$paises = Pais::all();

		// Si no tiene ciudad carga solo los paises
		if($ciudadId == null)
		{
			$estados = [];
			$ciudades = [];
		}
		else // Si no carga el pais, estado y ciudad al que pertenece el usuario
		{
			$paises = Pais::all();
			$paisId = Ciudad::find($ciudadId) -> estados -> paisId -> pais;
			$estados = Estado::where('pais','=',$paisId)->get();

			$estadoId = Ciudad::find($ciudadId) -> estados -> estado;
			$ciudades = Ciudad::where('estado','=',$estadoId) -> get();
		
		}

		// Obtener los puestos
		$puestos = Puesto::all();

		//$estados = Estado::where('estado','=',$ciudad-> estado);
		return View::make("dd.registro")->with(array("paises" => $paises,"estados" => $estados,"ciudades" => $ciudades,"paisId" => $paisId,"estadoId"=> $estadoId, "puestos" => $puestos));
		
	}
	public function getEstudios()
	{
		return View::make("dd.registroestudios");
	}
	public function getDisponibilidad()
	{
		return View::make("dd.registrodisponibilidad");
	}
	public function getConsulta()
	{
		return View::make("dd.consulta");
	}
	public function getEliminar()
	{
		return View::make("dd.eliminar");
	}

	////// METODOS POST ////////
	public function postEstados()
	{
		$pais = Input::get('pais');
		$estados = Estado::where('pais','=',$pais)->get();

		return Response::json($estados);
	}

	public function postCiudades()
	{
		$estado = Input::get('estado');
		$ciudades = Ciudad::where('estado','=',$estado)->get();

		return Response::json($ciudades);
	}

	public function postRegistrardatospersonales()
	{
		$id = Input::get('dd_id');
		$ingreso = Input::get('dd_ingreso');
		$apePaterno = Input::get('dd_aPaterno');
		$apeMaterno = Input::get('dd_aMaterno');
		$nombres = Input::get('dd_nombres');
		$sexo = Input::get('dd_sexo');
		$calle = Input::get('dd_calle');
		$noExterior = Input::get('dd_noExterior');
		$noInterior = Input::get('dd_noInterior');
		$colonia = Input::get('dd_colonia');
		$cp = Input::get('dd_cp');
		$pais = Input::get('dd_pais');
		$estado = Input::get('dd_estado');
		$ciudad = Input::get('dd_ciudad');
		$telOficina = Input::get('dd_oficina');
		$telParticular = Input::get('dd_particular');
		$telCel = Input::get('dd_celular');
		$correoUABC = Input::get('dd_correoUabc');
		$correo = Input::get('dd_correo');

		$user = User::find($id);
		$user -> fec_ing = $ingreso;
		$user -> last_name = $apePaterno;
		$user -> last_materno = $apeMaterno;
		$user -> name = $nombres;
		$user -> email = $correoUABC;
		$user -> email_alternat = $correo;
		$user -> calle = $calle;
		$user -> no_ext = $noExterior;
		$user -> no_int = $noInterior;
		$user -> colonia = $colonia;
		$user -> cp = $cp;
		$user -> telcel = $telCel;
		$user -> phone = $telParticular;
		$user -> telofna = $telOficina;
		$user -> ciudad = $ciudad;
		$user -> sexo = $sexo;

		$user -> save();

		return "Cambios realizados al usuario correctamente.";
	}

}