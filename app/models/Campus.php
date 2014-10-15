<?php

class Campus extends Eloquent
{
	protected $table = "campus";
	protected $primaryKey = "campus";
	public $timestamps = false;

	public function ciudad(){

		return $this->belongsTo('Ciudad');
	}

	public function uacademica()
	{
		return $this->hasMany('Uacademica','campus');
	}
}