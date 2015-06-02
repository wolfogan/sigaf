<!doctype html>
<html lang="es">

    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        @include('includes.styles')
        <?php echo HTML::style('css/login.css'); ?>

        <link rel="stylesheet" type="text/css" href="css/estiloPrincipal.css">

        <!-- ------------------------------ Scripts Generales -------------------------------->
        <script type="text/javascript" src="js/jquery.js"></script>

        <!--AQUI VA HORA Y FECHA-->
        <script src="js/tiempoactual.js"></script>
        <script>$(function(){startWatch(); return false;});</script>
        <!-- Script tiempo -->
	</head>    
         
    <body>

            <header>
            <figure id="logo"><img src="imagenes/logo.png" alt=""></figure>
            <div id="titulo">
                <h1>SISTEMA DE GESTIÓN ACADÉMICA (SIGAF)</h1>
                <h3>Facultad de Contaduría y Administración</h3>
            </div>
            <figure id="cimarron"><img src="imagenes/cimarron.png" alt=""></figure>
        </header>
        <div id="indicadores">
            <div id="usuariofecha">
                <div id="fecha" class="texto_body">
                    Fecha Actualizada
                </div>
            </div> 
           
        </div>

        <div id="container">
            <div id="loginbox" class="wrapper">          

                <form id="loginform" action="login/validar" method="post" >
    				<!-- Verifica si existe la variable de sesión -->
                    @if(Session::has('login_errors'))
                    <p style='color:#FB1D1D' >El nombre de usuario o la contraseña no son correctos.</p>
                    @else
                    <p>Introduzca usuario y contraseña para continuar.</p>
                    @endif
                    
                                  
                    <div class="input-group input-sm">
                        <span class="input-group-addon"><i class="fa fa-user"></i></i></span><input class="form-control" id="username" placeholder="Usuario" type="text" name="username">
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-lock"></i></span><input class="form-control" id="password" placeholder="Contraseña" type="password" name="password">
                    </div>
                    <div class="form-actions clearfix">                      
                        <input class="btn btn-block btn-primary btn-success" value="Acceder" type="submit">
                    </div>
                    <div class="footer-login">
                        <div class="pull-left text">
                                <div id="loading"><img src="{{ asset('imagenes/loading-icons/loader.gif')}}"></div>
                        </div>

                        <div id="us_cambiarContrasena"><a href="<?=URL::to('usuarios/olvidocontrasena'); ?>" style="color:#004000">¿Olvidó contraseña?</a></div>
    
                    </div>
                </form>
                </div>
               <!-- <span style="color:#FFF">@include('includes.footer') </span>-->
        </div>

        <?php echo HTML::script('js/jquery.js'); ?>
        <?php echo HTML::script('js/jquery-ui.js'); ?>
        <?php echo HTML::script('js/login.js'); ?>

        <footer>
           <!-- <div id="pie_correo">email: emma.castillejos@uabc.edu.mx</div>
            <div id="pie_tel">Teléfono: 664 188 9221</div>-->
        </footer>
</body>
</html>