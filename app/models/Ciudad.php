<?php

class Ciudad extends Eloquent
{
	protected $table = "ciudad";
	protected $primaryKey = "ciudad";
	public $timestamps = false;

	public function estados(){

		return $this->belongsTo('Estado','estado','estado');
	}

	public function campus()
	{
		return $this->hasMany('Campus','ciudad');
	}
}