<?php

class UnidadAprendizaje extends Eloquent
{
	protected $table = 'uaprendizaje';
	protected $primaryKey = 'uaprendizaje';
	public $timestamps = false;
	public $incrementing = false;

	public function plan()
	{
		return $this->belongsTo('PlanEstudio','plan');
	}
}