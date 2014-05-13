<?php

class PlanEstudioController extends BaseController
{

	public function __construct()
	{
		$this->beforeFilter('auth');
	}

	
	public function getRegistro()
	{
		return View::make('pe.registro');
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

