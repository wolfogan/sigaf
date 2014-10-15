<?php

class Uacademica extends Eloquent
{
	protected $table = "uacademica";
	protected $primaryKey = "uacademica";
	public $timestamps = false;

	public function campus(){

		return $this->belongsTo('Campus');
	}

	public function directivosua()
	{
		return $this->hasMany('Directivosua','uacademica');
	}
}