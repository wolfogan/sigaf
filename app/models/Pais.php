<?php

class Pais extends Eloquent
{
	protected $table = "pais";
	protected $primaryKey = "pais";
	public $timestamps = false;

	public function estados()
	{
		return $this->hasMany('Estado','pais');
	}
	public function abajo($query)
    {
        return $query->orderBy('descripcion','DESC');
    }   

}