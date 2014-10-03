<?php

class UserLoginController extends BaseController
{
	/**
	 * Función para validar al usuario.
	 * @return ruta Redirecciona dependiendo la validación
	 */
	public function postValidar()
	{
		// Obtener los datos del POST
		$userdata = array(
			'username' => Input::get('username'),
			'password'=> Input::get('password')
		);

		// Verificar datos contra BD.
		if(Auth::attempt($userdata))
		{
			// Redirecciona al menú de usuario.
			return Redirect::to('main');
		}
		else
		{
			// Si las credenciales no estan correctas me manda al login.
			return Redirect::to('/')->with('login_errors',true);
		}
	}

	public function getLogout()
	{
		// Destruye la cookie
		Auth::logout();
		return Redirect::to('/');
	}


	public function getUsuariosregistro()
	{
		return View::make('usuarios.usuariosRegistro');
	}
}