<?php

class DisponibilidadDocenteController extends BaseController
{
	public function __construct()
	{
		$this->beforeFilter('auth');
	}

	public function getRegistro()
	{
		return View::make("dd.registro");
	}
	public function getEstudios()
	{
		return View::make("dd.registroestudios");
	}
	public function getDisponibilidad()
	{
		return View::make("dd.registrodisponibilidad");
	}

}