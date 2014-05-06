<?php

class PlanEstudioController extends BaseController
{
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

 