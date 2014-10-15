<?php

class Directivopuesto extends Eloquent
{
	protected $table = "directivopuesto";
	protected $primaryKey = "directivopuesto";
	public $timestamps = false;

	public function directivosua()
	{
		return $this->hasMany('Directivosua','directivopuesto');
	}
}