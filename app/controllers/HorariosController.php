<?php

class HorariosController extends BaseController
{
	public function __construct()
	{
		$this->beforeFilter('auth');
	}

	public function getRegistro()
	{
		return View::make("horarios.registro");
	}
	

}