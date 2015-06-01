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
		$categorias = Categoria::all();
		$users = User::all();
		$uacademicas = Uacademica::all();
		$campus = Campus::all();
		
		return View::make('usuarios.usuariosRegistro')->with(compact('levels','users','categorias','uacademicas','campus'));

	}

	public function postUsuarios()
	{
		$users = User::all();
		foreach ($users as $user) {
				$user->levels;
		}
		return Response::json($users);
	}

	public function getCorreo()
	{
		$mensaje = null;
		if(isset($_GET['contacto']))
		{
			$data = array(
				'name' => Input::get('name'),
				'email' => Input::get('email'),
				'subject' => Input::get('subject'),
				'msg' => Input::get('msg')
				);

				$fromEmail = 'wolfogan@gmail.com';
				$fromName = "Administrador";

				Mail::send('usuarios.plantilla',$data,function($mensaje) use ($fromName,$fromEmail){
					$mensaje->to($fromEmail,$fromName);
					$mensaje->from($fromEmail,$fromName);
					$mensaje->subject("Nuevo email de contacto");
				});

				$mensaje = "<div class='text-info'>Mensaje enviado con exito!!!</div>";

		}
		
		return View::make('usuarios.correo')->with(array("mensaje" => $mensaje));
	}

	public function postRegistrarusuario()
	{
		$username = Input::get('username');
		$name = Input::get('nombreRegUsuarios');
		$fec_ing = Input::get('hr_ingresoU');
		$last_name = Input::get('apellidosPRegUsuarios');
		$last_materno = Input::get('apellidosMRegUsuarios');
		$sexo = Input::get('sexo');
		$email = Input::get('correoE');
		$rfc = Input::get('rfc');
		$password = Hash::make(Input::get('contrasena_us'));
		$phone = Input::get('telefono');
		$level = Input::get('puesto');
		$categoria = Input::get('categoria');
		$uacademica = Input::get('uacademicaRegUsuarios');
		$campus = Input::get('campusRegUsuarios');
		$users_id = Input::get('users_id');


		$user = new User;
		$user -> username = $username;
		$user -> name = 	 $name;
		$user -> fec_ing = $fec_ing;
		$user -> last_name = $last_name;
		$user -> last_materno = $last_materno;
		$user -> email = $email;
		$user -> rfc = $rfc;
		$user -> name = $name;
		$user -> sexo = $sexo;
		$user -> password = $password;
		$user -> phone = $phone;
		$user -> level = $level;
		$user -> categoria = $categoria;
		$user -> uacademica = $uacademica;
		$user -> campus = $campus;
		//$user -> users_id = $users_id;

		$user -> save();

		return "Usuario Registrado!!!";
	}

	public function postModificarusuario()
	{
		$id = Input::get('id');
		$username = Input::get('username');
		$name = Input::get('nombreRegUsuarios');
		$fec_ing = Input::get('hr_ingresoU');
		$last_name = Input::get('apellidosPRegUsuarios');
		$last_materno = Input::get('apellidosMRegUsuarios');
		$sexo = Input::get('sexo');
		$email = Input::get('correoE');
		$password = Hash::make(Input::get('contrasena_us'));
		$phone = Input::get('telefono');
		$level = Input::get('puesto');
		$categoria = Input::get('categoria');
		$uacademica = Input::get('uacademicaRegUsuarios');
		$campus = Input::get('campusRegUsuarios');
		$users_id = Input::get('users_id');


		$user = User::find($id);
		$user -> username = $username;
		$user -> name = 	 $name;
		$user -> fec_ing = $fec_ing;
		$user -> last_name = $last_name;
		$user -> last_materno = $last_materno;
		$user -> email = $email;
		$user -> name = $name;
		$user -> sexo = $sexo;
		$user -> password = $password;
		$user -> phone = $phone;
		$user -> level = $level;
		$user -> categoria = $categoria;
		$user -> uacademica = $uacademica;
		$user -> campus = $campus;
		//$user -> users_id = $users_id;

		$user -> save();

		return "Usuario Actualizado Correctamente!!!";
	}

	public function postEliminarusuario(){
		$id = Input::get('id');
		$user = User::find($id);
		$user -> delete();
		return "Usuario Eliminado Correctamente!!!";
	}

	public function getModificarcontrasena()
	{
		return View::make('usuarios.modificarContrasena');
	}
	public function getOlvidocontrasena()
	{
		return View::make('usuarios.olvidoContrasena');
	}

	public function postObtenerusuario()
	{
		$id = Input::get('id');

		$user = User::find($id);

		return Response::json($user);
	}
}