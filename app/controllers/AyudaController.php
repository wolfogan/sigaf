<?php

class AyudaController extends BaseController
{
	public function __construct()
	{
		$this->beforeFilter('auth');
	}

	public function getMenuayuda()
	{
		return View::make("ayuda.ayuda_menu");
	}
	public function getAyudape()
	{
		return View::make("ayuda.ayuda_pe");
	}
	public function getAyudaca()
	{
		return View::make("ayuda.ayuda_ca");
	}
	public function getAyudadd()
	{
		return View::make("ayuda.ayuda_dd");
	}
	public function getAyudaus()
	{
		return View::make("ayuda.ayuda_us");
	}

}