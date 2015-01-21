<?php

class Snippets
{
	/**
 	* Función para integrar el guión entre 2 strings
	 * @param  string $string_add    La cadena a agregar
	 * @param  string $string_target La cadena donde se va a agregar el string
	 * @param  int $offset        Puntero donde corta la caden
	 * @return string                Regresa la cadena concatenada
	 */
	public static function str_insert($string_add,$string_target,$offset)
	{
		$part1 = substr($string_target,0, $offset);
		$part2 = substr($string_target, $offset);

		return $part1.$string_add.$part2;
	}
}