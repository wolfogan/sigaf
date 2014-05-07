<?php

class PlanEstudioController extends BaseController
{

	public function __construct()
	{
		$this->beforeFilter('auth');
	}

	public function getIndex()
	{

	}

	public function getRegistro()
	{
		return View::make('pe.registro');
	}

	public function getConsulta()
	{
		return View::make('pe.consulta');
	}

<<<<<<< HEAD
<<<<<<< HEAD
	// esto no va a quedar asi no me hagas pull A ESTA LATOSA gracias zorrito :)
	public function getUsuarios()
	{
		return View::make('pe.usuarios');
	}
	// este tampoco, solo de prueba
	public function getUsuariosregistro()
	{
		return View::make('pe.usuariosRegistro');
	}
}

 
=======
	public function postRegistrarnoplan()
	{

	}

=======
>>>>>>> 8f7d8ddd99a1efcbe5bed67cd5494ca9503a9234
	
}
>>>>>>> 04ded8117a7fc8b22afd327f8a52591141f79028
