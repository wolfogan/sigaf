<?php

class Ciudad extends Eloquent
{
	protected $table = "ciudad";
	protected $primaryKey = "ciudad";
	public $timestamps = false;

	public function estado(){

		return $this->belongsTo('Estado');
	}

	public function campus()
	{
		return $this->hasMany('Campus','ciudad');
	}
}