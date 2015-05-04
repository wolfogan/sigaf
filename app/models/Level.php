<?php

class Level extends Eloquent
{
	protected $table = "levels";
	protected $primaryKey = "level";
	public $timestamps = false;

	public function user()
	{
		return $this->belongsTo('User');
	}

}