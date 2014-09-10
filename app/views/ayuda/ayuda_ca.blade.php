<!DOCTYPE html >
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>Ayuda</title>
    <link rel="stylesheet" href="../css/demotab.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="../css/estilotab_manual.css" type="text/css" media="screen" />
    <script type="application/javascript" src="../js/jquery.min.js"></script>
</head>
<body>
	<div id="modal">
		<div class="modal-content">
        	<div id="salir"><a href="<?=URL::to('cargaacademica/registro')?>"><img src="../imagenes/salir.png"></a></div>
           	  <h1><span>Manual de usuario</span> <br>
       	      CARGA ACADÉMICA</h1>
   		  		<div id="back"><a href="javascript:window.history.go(-1);"><img src="../imagenes/back.png"></a></div>   
             	 <div class="container">
				 
                 <section class="tabs">
                <input id="tab-1" type="radio" name="radio-set" class="tab-selector-1" checked="checked" />
		        <label for="tab-1" class="tab-label-1" style="background-image:url(../imagenes/catalogo3.png); background-repeat:no-repeat; background-position:top;">Catálogos</label>
		
	            <input id="tab-2" type="radio" name="radio-set" class="tab-selector-2" />
		        <label for="tab-2" class="tab-label-2" style="background-image: url(../imagenes/registro1.png); background-repeat:no-repeat; background-position:top;">Registro</label>
		
	            <input id="tab-3" type="radio" name="radio-set" class="tab-selector-3" />
		        <label for="tab-3" class="tab-label-3" style="background-image:url(../imagenes/Consul.png); background-repeat:no-repeat; background-position:top;">Consulta</label>
			
	            <input id="tab-4" type="radio" name="radio-set" class="tab-selector-4" />
		        <label for="tab-4" class="tab-label-4" style="background-image:url(../imagenes/actualizar.png); background-repeat:no-repeat; background-position:top;">Modificación</label>
    
     <input id="tab-5" type="radio" name="radio-set" class="tab-selector-5" />
		        <label for="tab-5" class="tab-label-5" style="background-image:url(../imagenes/eliminar.png); background-repeat:no-repeat; background-position:top;">Eliminación</label>
    
     <input id="tab-6" type="radio" name="radio-set" class="tab-selector-6" />
	          <label for="tab-6" class="tab-label-6" style="background-image:url(../imagenes/FAQ.png); background-repeat:no-repeat; background-position:top;">FAQ</label>
    
     <input id="tab-7" type="radio" name="radio-set" class="tab-selector-7" />
	          <label for="tab-7" class="tab-label-7" style="background-image: url(../imagenes/glosario.png); background-repeat:no-repeat; background-position:top;">Glosario</label>
   
			 <div class="clear-shadow"></div>
		     	<div class="content">
                	<div class="content-1">
						<h2>Catálogos</h2>
                        <p>
          
 					   </p>
     				</div>
			        <div class="content-2">
                   	<a name="arribaReg"></a>
						<h2>Registro</h2>
                        
 						<a  href="#arribaReg">arriba</a>.
				    </div>
			        <div class="content-3">
						<h2>Consulta</h2>
                        <p></p>
				    </div>
				    <div class="content-4">
						<h2>Modificación</h2>
                		
 						<a href="#arriba">arriba</a>.
                        
				    </div>
                 
                    
                    <div class="content-5">
						<h2>Eliminación</h2>
                        <p></p>
				    </div>
                    
                    <div class="content-6">
						<h2>Preguntas frecuentes</h2>
                        <p></p>
				    </div>
                    
                    <div class="content-7">
						<h2>Glosario</h2>
                        <p></p>
				    </div>
		        </div>
			</section>
        </div>
             
       	
		</div>
		<div class="overlay"></div>
	</div>
</body>
</html>