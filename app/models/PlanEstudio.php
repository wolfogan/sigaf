<?php

class PlanEstudio extends Eloquent
{
	protected $table = "planestudio";
	protected $primaryKey = "plan";
	public $timestamps = false;

	public function unidades()
	{
		return $this->hasMany('UnidadAprendizaje','plan');
	}

	public function nivelD()
	{
		return $this->belongsTo('NivelPrograma','nivel','nivel');
	}
}