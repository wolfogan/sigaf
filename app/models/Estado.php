<?php

class Estado extends Eloquent
{
	protected $table = "estado";
	protected $primaryKey = "estado";
	public $timestamps = false;

	public function pais(){
		return $this->belongsTo('Pais');
	}

	public function ciudad()
	{
		return $this->hasMany('Ciudad','estado');
	}

}