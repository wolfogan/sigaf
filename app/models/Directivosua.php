<?php

class Directivosua extends Eloquent
{
	protected $table = "directivosua";
	protected $primaryKey = "empleado";
	public $timestamps = false;


	public function directivopuesto(){

		return $this->belongsTo('Directivopuesto');
	}

	public function uacademica(){

		return $this->belongsTo('Uacademica');
	}
}