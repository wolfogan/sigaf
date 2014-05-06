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

	public function postRegistrarnoplan()
	{

	}

	public function postRegistrarnivel()
	{

	}

	public function postRegistrarcarrera()
	{

	}

	public function postRegistraretapa()
	{

	}

	public function postRegistrartipo()
	{

	}

	public function postRegistrarSeriacion()
	{

	}

	public function postRegistrarcarrera()
	{

	}

	public function postRegistrarcoordinacion()
	{
		
	}
}