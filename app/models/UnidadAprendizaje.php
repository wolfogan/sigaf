<?php

class UnidadAprendizaje extends Eloquent
{
	protected $table = 'uaprendizaje';
	protected $primaryKey = 'uaprendizaje';
	public $timestamps = false;
	public $incrementing = false;

	// Obtiene el plan de estudio al que pertenece la unidad de aprendizaje
	public function plan()
	{
		return $this->belongsTo('PlanEstudio','plan');
	}

	// Accedo directamente a que carreras pertenece una unidad de aprendizaje
	/*public function programas()
	{
		return $this->belongsToMany('ProgramaEducativo','p_ua','uaprendizaje','programaedu');
	}

	/*public function tipoCaracter()
	{
		return $this->hasOne('Caracter','caracter','caracter');
	}

	/*public function seriacion()
	{
		return $this->hasOne('Seriacion','reqseriacion','reqseriacion');
	}*/

	/*public function claveSeriacion()
	{
		return $this->hasOne('UnidadAprendizaje','uaprendizaje','claveD');
	}*/

	/*public function etapaUA()
	{
		return $this->hasOne('Etapa','etapa','etapa');
	}*/

	public function coordinacion()
	{
		return $this->hasOne('Coordinacion','coordinaciona','coordinaciona');
	}
}