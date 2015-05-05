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
		$levels = Level::all();
		$users = User::all();
		return View::make('usuarios.usuariosRegistro')->with(compact('levels','users'));

	}

	public function postUsuarios()
	{
		$users = User::all();
		foreach ($users as $user) {
				$user->levels;
		}
		return Response::json($users);
	}

	public function getModificarcontrasena()
	{
		return View::make('usuarios.modificarContrasena');
	}
	public function getOlvidocontrasena()
	{
		return View::make('usuarios.olvidoContrasena');
	}
}