<?php

class DisponibilidadDocenteController extends BaseController
{
	public function __construct()
	{
		$this->beforeFilter('auth');
	}

	public function getRegistro()
	{
		$ciudadId = Auth::user()->ciudad; // Obtiene la ciudad del usuario actual
		$documento = DB::table('documentos_emp')->where('docto',1)->where('id',Auth::user()->id)->first(); 
		
		if(empty($documento))
			$rutaFoto = "";
		else
		{
			if(file_exists($documento -> ruta))
				$rutaFoto = $documento -> ruta;
			else
				$rutaFoto = "";
		}
		
		// 1 = Foto

		$estadoId = "";
		$paisId = "";

		$paises = Pais::all();

		// Si no tiene ciudad carga solo los paises
		if($ciudadId == null)
		{
			$estados = [];
			$ciudades = [];
		}
		else // Si no carga el pais, estado y ciudad al que pertenece el usuario
		{
			$paises = Pais::all();
			$paisId = Ciudad::find($ciudadId) -> estados -> paisId -> pais;
			$estados = Estado::where('pais','=',$paisId)->get();

			$estadoId = Ciudad::find($ciudadId) -> estados -> estado;
			$ciudades = Ciudad::where('estado','=',$estadoId) -> get();
		
		}

		// Obtener los puestos
		$puestos = Puesto::all();
		$tipoCursos = TipoCurso::all();
		$carateristicaCursos = CaracteristicaCurso::all();
		//$estados = Estado::where('estado','=',$ciudad-> estado);
		return View::make("dd.registro")->with(array("paises" => $paises,"estados" => $estados,"ciudades" => $ciudades,"paisId" => $paisId,"estadoId"=> $estadoId, "puestos" => $puestos,"tipoCursos" => $tipoCursos,"caracteristicaCursos" => $carateristicaCursos,"rutaFoto" =>$rutaFoto));
		
	}
	public function getEstudios()
	{
		return View::make("dd.registroestudios");
	}
	public function getDisponibilidad()
	{
		return View::make("dd.registrodisponibilidad");
	}
	public function getConsulta()
	{
		return View::make("dd.consulta");
	}
	public function getEliminar()
	{
		return View::make("dd.eliminar");
	}

	////// METODOS POST ////////
	public function postEstados()
	{
		$pais = Input::get('pais');
		$estados = Estado::where('pais','=',$pais)->get();

		return Response::json($estados);
	}

	public function postCiudades()
	{
		$estado = Input::get('estado');
		$ciudades = Ciudad::where('estado','=',$estado)->get();

		return Response::json($ciudades);
	}


	public function postCarrerasemp()
	{
		$carrerasEmp = CarrerasEmp::all();
		return Response::json($carrerasEmp);
	}

	public function postUniversidadesemp()
	{
		$universidadesEmp = UniversidadesEmp::all();
		return Response::json($universidadesEmp);
	}

	public function postRegistrardatospersonales()
	{

		/* ID TIPO DOCUMENTO
		*	1 - FOTO
		*	2 - LICENCIATURA1
		*	3 - LICENCIATURA2
		*	4 - MAESTRIA1
		*	5 - MAESTRIA2
		*	6 - DOCTORADO1
		*	7 - DOCTORADO2
		*	8 - ESPECIALIDAD1
		*	9 - ESPECIALIDAD2
		**/
		$id = Input::get('dd_id');
		$savePhoto = true;
		$ruta = "Empty";

		

		if(Input::hasFile("foto_seleccion"))
		{
			$ext = Input::file("foto_seleccion") -> getClientOriginalExtension();
			$nombreFoto = "foto_" . $id .".". $ext;
			$ruta = "documentos/fotos/".$nombreFoto; 
		}
		else
		{
			$documento = DB::table("documentos_emp")->select('ruta')->where('docto',1)->where('id',$id)->first();
			if(!empty($documento->ruta))
				$ruta = $documento->ruta;
			else
				$ruta = "";

			$savePhoto = false;

		}
		
		$ingreso = Input::get('dd_ingreso');
		$apePaterno = Input::get('dd_aPaterno');
		$apeMaterno = Input::get('dd_aMaterno');
		$nombres = Input::get('dd_nombres');
		$sexo = Input::get('dd_sexo');
		$calle = Input::get('dd_calle');
		$noExterior = Input::get('dd_noExterior');
		$noInterior = Input::get('dd_noInterior');
		$colonia = Input::get('dd_colonia');
		$cp = Input::get('dd_cp');
		$pais = Input::get('dd_pais');
		$estado = Input::get('dd_estado');
		$ciudad = Input::get('dd_ciudad');
		$telOficina = Input::get('dd_oficina');
		$telParticular = Input::get('dd_particular');
		$telCel = Input::get('dd_celular');
		$correoUABC = Input::get('dd_correoUabc');
		$correo = Input::get('dd_correo');

		DB::transaction(function() use($id,$ingreso,$apePaterno,$apeMaterno,$nombres,$correoUABC,$correo,$calle,$noExterior,$noInterior,$colonia,$cp,$telCel,$telParticular,$telOficina,$ciudad,$sexo,$ruta){
			$user = User::find($id);
			$user -> fec_ing = $ingreso;
			$user -> last_name = $apePaterno;
			$user -> last_materno = $apeMaterno;
			$user -> name = $nombres;
			$user -> email = $correoUABC;
			$user -> email_alternat = $correo;
			$user -> calle = $calle;
			$user -> no_ext = $noExterior;
			$user -> no_int = $noInterior;
			$user -> colonia = $colonia;
			$user -> cp = $cp;
			$user -> telcel = $telCel;
			$user -> phone = $telParticular;
			$user -> telofna = $telOficina;
			$user -> ciudad = $ciudad;
			$user -> sexo = $sexo;
			$user -> save();

			$foto = DB::table("documentos_emp")->where('docto',1)->where('id',$id)->get();
			
			if(empty($foto))
			{
				DB::table('documentos_emp')
					->insert(
							array(
								'docto' => 1,
								'id' 	=> $id,
								'ruta'	=> $ruta,
								'observaciones' => "",
								'users_id' => $id
								)
							);
			}
			else
			{
				DB::table('documentos_emp')
						->where('id', $id)
						->where('docto',1)
						->update(array('ruta' => $ruta));
			}

			
		});
		
		if($savePhoto)
			Input::file("foto_seleccion")->move("documentos/fotos/",$nombreFoto);

		

		return "Cambios realizados al usuario correctamente.!!";
		
	}

	public function postRegistrarestudioscursos()
	{

		$todo = Input::get('dd_carreraLic2');

		

		/* ID TIPO DOCUMENTO
		*	1 - FOTO
		*	2 - LICENCIATURA1
		*	3 - LICENCIATURA2
		*	4 - MAESTRIA1
		*	5 - MAESTRIA2
		*	6 - DOCTORADO1
		*	7 - DOCTORADO2
		*	8 - ESPECIALIDAD1
		*	9 - ESPECIALIDAD2
		**/

		
	}
	// CATALOGOS DISPONIBILIDAD DOCENTE

	public function postRegistrarempresas()
	{
		$empresas = new Empresas;
		$empresas -> descripcion = Input::get('dd_cat_nombreEmpresa');
		$empresas -> users_id = Input::get('users_id');
	
		$empresas -> save();

		// return Redirect::back();
		return "Registro insertado correctamente! :D";

	}

	public function postRegistrarpuesto()
	{
		$puesto = new Puesto;
		$puesto -> descripcion = Input::get('dd_cat_nombrePuesto');
		$puesto -> users_id = Input::get('users_id');

		$puesto -> save();	
	}

	public function postRegistrarcarreras()
	{
		$carrera = new Carrera;
		$carrera -> descripcion = Input::get('dd_cat_nombreCarrera');
		$carrera -> users_id = Input::get('users_id');

		$carrera -> save();	
	}

	public function postRegistraruniversidad()
	{
		$universidad = new Universidad;
		$universidad -> descripcion = Input::get('dd_cat_nombreEscuela');
		$universidad -> descripshort = Input::get('dd_cat_siglas');
		$universidad -> ciudad = Input::get('dd_cat_ciudad');
		$universidad -> users_id = Input::get('users_id');

		$universidad -> save();	
	}

	public function postRegistrarcursos()
	{
		$cursos = new Cursos;
		$cursos -> periodo = Input::get('dd_cat_periodo');
		$cursos -> descripcion = Input::get('dd_cat_nombre');
		$cursos -> fecha = Input::get('dd_cat_fecha');
		$cursos -> creditos = Input::get('dd_cat_creditos');
		$cursos -> horas = Input::get('dd_cat_horas');
		$cursos -> caracteristica_cur = Input::get('dd_cat_curso');
		$cursos -> users_id = Input::get('users_id');

		$cursos -> save();
	}


}