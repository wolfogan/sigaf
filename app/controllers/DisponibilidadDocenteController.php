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

		$carreraLic1 = Input::get('dd_carreraLic1');
		$escuelaLic1 = Input::get('dd_escuelaLic1');
		$obtuvoLic1 = Input::get('dd_obtuvoLic1');
		$fechaLic1 = Input::get('dd_fechaLic1');
		$cedulaLic1 = Input::get('dd_cedulaLic1');
		$nomFileLic1 = Input::get('dd_nomFileLic1');
		$rutaLic1 = "Empty";

		if($obtuvoLic1 == true)
			$obtuvoLic1 = 1;
		else
			$obtuvoLic1 = 0;
		

		if(Input::hasFile("dd_fileLic1"))
		{
			$ext = Input::file("dd_fileLic1") -> getClientOriginalExtension();
			$nombreFoto = "licenciatura1_" . $id .".". $ext;
			$rutaLic1 = "documentos/estudios/".$nombreFoto; 
		}

		

		$arrayLic1 = array('carrera' => $carreraLic1,'id' => $id,'universidad' => $escuelaLic1,'nivel' => 1,'cedula' => $cedulaLic1,'fec_tit' => $fechaLic1,'obtuvo_grado' => $obtuvoLic1,'users_id'=> $id );
		$docLic1 = array('docto' => 2,'id' => $id,'ruta' => $rutaLic1,'observaciones' => "",'users_id' =>$id);


		DB::transaction(function() use($arrayLic1,$docLic1){
			DB::table('act_profesional_emp')->insert($arrayLic1);
			DB::table('documentos_emp') -> insert($docLic1);
		});
		

		$carreraLic2 = Input::get('dd_carreraLic2');
		if(!empty($carreraLic2))
		{
			$escuelaLic2 = Input::get('dd_escuelaLic2');
			$obtuvoLic2 = Input::get('dd_obtuvoLic2');
			$fechaLic2 = Input::get('dd_fechaLic2');
			$cedulaLic2 = Input::get('dd_cedulaLic2');
			$nomFileLic2 = Input::get('dd_nomFileLic2');
			$rutaLic2 = "Empty";

			if($obtuvoLic2 == true)
				$obtuvoLic2 = 1;
			else
				$obtuvoLic2 = 0;
		

			if(Input::hasFile("dd_fileLic2"))
			{
				$ext = Input::file("dd_fileLic2") -> getClientOriginalExtension();
				$nombreFoto = "licenciatura2_" . $id .".". $ext;
				$rutaLic2 = "documentos/estudios/".$nombreFoto; 
			}

			$arrayLic2 = array('carrera' => $carreraLic2,'id' => $id,'universidad' => $escuelaLic2,'nivel' => 1,'cedula' => $cedulaLic2,'fec_tit' => $fechaLic2,'obtuvo_grado' => $obtuvoLic2,'users_id'=> $id );
			$docLic2 = array('docto' => 2,'id' => $id,'ruta' => $rutaLic2,'observaciones' => "",'users_id' =>$id);


			DB::transaction(function() use($arrayLic1,$docLic2){
				DB::table('act_profesional_emp')->insert($arrayLic2);
				DB::table('documentos_emp') -> insert($docLic2);
			});
		}

		
		$carreraEsp1 = Input::get('dd_carreraEsp1');
		if(!empty($carreraEsp1))
		{
			$escuelaEsp1 = Input::get('dd_escuelaEsp1');
			$obtuvoEsp1 = Input::get('dd_obtuvoEsp1');
			$fechaEsp1 = Input::get('dd_fechaEsp1');
			$cedulaEsp1 = Input::get('dd_cedulaEsp1');
			$nomFileEsp1 = Input::get('dd_nomFileEsp1');
			$rutaEsp1 = "Empty";

			if($obtuvoEsp1 == true)
				$obtuvoEsp1 = 1;
			else
				$obtuvoEsp1 = 0;

			if(Input::hasFile("dd_fileEsp1"))
			{
				$ext = Input::file("dd_fileEsp1") -> getClientOriginalExtension();
				$nombreFoto = "especialidad1_" . $id .".". $ext;
				$rutaEsp1 = "documentos/estudios/".$nombreFoto; 
			}

			$arrayEsp1 = array('carrera' => $carreraEsp1,'id' => $id,'universidad' => $escuelaEsp1,'nivel' => 4,'cedula' => $cedulaEsp1,'fec_tit' => $fechaEsp1,'obtuvo_grado' => $obtuvoEsp1,'users_id'=> $id );
			$docEsp1 = array('docto' => 8,'id' => $id,'ruta' => $rutaEsp1,'observaciones' => "",'users_id' =>$id);


			DB::transaction(function() use($arrayEsp1,$docEsp1){
				DB::table('act_profesional_emp')->insert($arrayEsp1);
				DB::table('documentos_emp') -> insert($docEsp1);
			});
		}

		$carreraEsp2 = Input::get('dd_carreraEsp2');
		if(!empty($carreraEsp2))
		{
			$escuelaEsp2 = Input::get('dd_escuelaEsp2');
			$obtuvoEsp2 = Input::get('dd_obtuvoEsp2');
			$fechaEsp2 = Input::get('dd_fechaEsp2');
			$cedulaEsp2 = Input::get('dd_cedulaEsp2');
			$nomFileEsp2 = Input::get('dd_nomFileEsp2');
			$rutaEsp2 = "Empty";

			if($obtuvoEsp2 == true)
				$obtuvoEsp2 = 1;
			else
				$obtuvoEsp2 = 0;

			if(Input::hasFile("dd_fileEsp2"))
			{
				$ext = Input::file("dd_fileEsp2") -> getClientOriginalExtension();
				$nombreFoto = "especialidad2_" . $id .".". $ext;
				$rutaEsp2 = "documentos/estudios/".$nombreFoto; 
			}

			$arrayEsp2 = array('carrera' => $carreraEsp2,'id' => $id,'universidad' => $escuelaEsp2,'nivel' => 4,'cedula' => $cedulaEsp2,'fec_tit' => $fechaEsp2,'obtuvo_grado' => $obtuvoEsp2,'users_id'=> $id );
			$docEsp2 = array('docto' => 9,'id' => $id,'ruta' => $rutaEsp2,'observaciones' => "",'users_id' =>$id);


			DB::transaction(function() use($arrayEsp2,$docEsp2){
				DB::table('act_profesional_emp')->insert($arrayEsp2);
				DB::table('documentos_emp') -> insert($docEsp2);
			});
		}
		
		$carreraMas1 = Input::get('dd_carreraMas1');
		if(!empty($carreraMas1))
		{
			$escuelaMas1 = Input::get('dd_escuelaMas1');
			$obtuvoMas1 = Input::get('dd_obtuvoMas1');
			$fechaMas1 = Input::get('dd_fechaMas1');
			$cedulaMas1 = Input::get('dd_cedulaMas1');
			$nomFileMas1 = Input::get('dd_nomFileMas1');
			$rutaMas1 = "Empty";

			if($obtuvoMas1 == true)
				$obtuvoMas1 = 1;
			else
				$obtuvoMas1 = 0;

			if(Input::hasFile("dd_fileMas1"))
			{
				$ext = Input::file("dd_fileMas1") -> getClientOriginalExtension();
				$nombreFoto = "maestria1_" . $id .".". $ext;
				$rutaMas1 = "documentos/estudios/".$nombreFoto; 
			}

			$arrayMas1 = array('carrera' => $carreraMas1,'id' => $id,'universidad' => $escuelaMas1,'nivel' => 2,'cedula' => $cedulaMas1,'fec_tit' => $fechaMas1,'obtuvo_grado' => $obtuvoMas1,'users_id'=> $id );
			$docMas1 = array('docto' => 4,'id' => $id,'ruta' => $rutaMas1,'observaciones' => "",'users_id' =>$id);


			DB::transaction(function() use($arrayMas1,$docMas1){
				DB::table('act_profesional_emp')->insert($arrayMas1);
				DB::table('documentos_emp') -> insert($docMas1);
			});
		}

		
		$carreraMas2 = Input::get('dd_carreraMas2');
		if(!empty($carreraMas2))
		{
			$escuelaMas2 = Input::get('dd_escuelaMas2');
			$obtuvoMas2 = Input::get('dd_obtuvoMas2');
			$fechaMas2 = Input::get('dd_fechaMas2');
			$cedulaMas2 = Input::get('dd_cedulaMas2');
			$nomFileMas2 = Input::get('dd_nomFileMas2');
			$fileMas2 = "Empty";

			if($obtuvoMas2 == true)
				$obtuvoMas2 = 1;
			else
				$obtuvoMas2 = 0;

			if(Input::hasFile("dd_fileMas2"))
			{
				$ext = Input::file("dd_fileMas2") -> getClientOriginalExtension();
				$nombreFoto = "maestria2_" . $id .".". $ext;
				$rutaMas2 = "documentos/estudios/".$nombreFoto; 
			}

			$arrayMas2 = array('carrera' => $carreraMas2,'id' => $id,'universidad' => $escuelaMas2,'nivel' => 2,'cedula' => $cedulaMas2,'fec_tit' => $fechaMas2,'obtuvo_grado' => $obtuvoMas2,'users_id'=> $id );
			$docMas2 = array('docto' => 5,'id' => $id,'ruta' => $rutaMas2,'observaciones' => "",'users_id' =>$id);


			DB::transaction(function() use($arrayMas2,$docMas2){
				DB::table('act_profesional_emp')->insert($arrayMas2);
				DB::table('documentos_emp') -> insert($docMas2);
			});
		}

		$carreraDoc1 = Input::get('dd_carreraDoc1');
		if(!empty($carreraDoc1))
		{
			$escuelaDoc1 = Input::get('dd_escuelaDoc1');
			$obtuvoDoc1 = Input::get('dd_obtuvoDoc1');
			$fechaDoc1 = Input::get('dd_fechaDoc1');
			$cedulaDoc1 = Input::get('dd_cedulaDoc1');
			$nomFileDoc1 = Input::get('dd_nomFileDoc1');
			$rutaDoc1 = "Empty";

			if($obtuvoDoc1 == true)
				$obtuvoDoc1 = 1;
			else
				$obtuvoDoc1 = 0;

			if(Input::hasFile("dd_fileDoc1"))
			{
				$ext = Input::file("dd_fileDoc1") -> getClientOriginalExtension();
				$nombreFoto = "doctorado1_" . $id .".". $ext;
				$rutaDoc1 = "documentos/estudios/".$nombreFoto; 
			}

			$arrayDoc1 = array('carrera' => $carreraDoc1,'id' => $id,'universidad' => $escuelaDoc1,'nivel' => 3,'cedula' => $cedulaDoc1,'fec_tit' => $fechaDoc1,'obtuvo_grado' => $obtuvoDoc1,'users_id'=> $id );
			$docDoc1 = array('docto' => 6,'id' => $id,'ruta' => $rutaDoc1,'observaciones' => "",'users_id' =>$id);


			DB::transaction(function() use($arrayDoc1,$docDoc1){
				DB::table('act_profesional_emp')->insert($arrayDoc1);
				DB::table('documentos_emp') -> insert($docDoc1);
			});
		}

		$carreraDoc2 = Input::get('dd_carreraDoc2');
		if(!empty($carreraDoc2))
		{
			$escuelaDoc2 = Input::get('dd_escuelaDoc2');
			$obtuvoDoc2 = Input::get('dd_obtuvoDoc2');
			$fechaDoc2 = Input::get('dd_fechaDoc2');
			$cedulaDoc2 = Input::get('dd_cedulaDoc2');
			$nomFileDoc2 = Input::get('dd_nomFileDoc2');
			$rutaDoc2 = "Emtpy";

			if($obtuvoDoc2 == true)
				$obtuvoDoc2 = 1;
			else
				$obtuvoDoc2 = 0;

			if(Input::hasFile("dd_fileDoc2"))
			{
				$ext = Input::file("dd_fileDoc2") -> getClientOriginalExtension();
				$nombreFoto = "doctorado2_" . $id .".". $ext;
				$rutaDoc2 = "documentos/estudios/".$nombreFoto; 
			}

			$arrayDoc2 = array('carrera' => $carreraDoc2,'id' => $id,'universidad' => $escuelaDoc2,'nivel' => 3,'cedula' => $cedulaDoc2,'fec_tit' => $fechaDoc2,'obtuvo_grado' => $obtuvoDoc2,'users_id'=> $id );
			$docDoc2 = array('docto' => 7,'id' => $id,'ruta' => $rutaDoc2,'observaciones' => "",'users_id' =>$id);

			DB::transaction(function() use($arrayDoc2,$docDoc2){
				DB::table('act_profesional_emp')->insert($arrayDoc2);
				DB::table('documentos_emp') -> insert($docDoc2);
			});
		}

		

		
		return "Estudios registrados correctamente!!!!";
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