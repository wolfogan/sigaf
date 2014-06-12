<?php

class ProgramaEducativo extends Eloquent
{
	protected $table = "programaedu";
	protected $primaryKey = "programaedu";
	public $timestamps = false;

	public function unidades()
	{
		return $this->belongsToMany('UnidadAprendizaje','p_ua','programaedu','uaprendizaje');
	}
}