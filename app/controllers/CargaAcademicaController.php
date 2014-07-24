<?php

class CargaAcademicaController extends BaseController
{
	public function __construct()
	{
		$this->beforeFilter('auth');
	}

	public function getRegistro()
	{
		return View::make("ca.registro");
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