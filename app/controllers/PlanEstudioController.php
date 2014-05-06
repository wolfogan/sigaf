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

	
}