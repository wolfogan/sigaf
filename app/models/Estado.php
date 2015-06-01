<?php

class Estado extends Eloquent
{
	protected $table = "estado";
	protected $primaryKey = "estado";
	public $timestamps = false;

	public function paisId(){
		return $this->belongsTo('Pais','pais','pais');
	}

	public function ciudad()
	{
		return $this->hasMany('Ciudad','estado');
	}

}