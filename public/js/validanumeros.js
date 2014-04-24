<!--SCRIPT PARA QUE SOLO ACEPTE NUMEROS-->
<script language="javascript">
			function ValidaSoloNumeros() {
			 if ((event.keyCode < 48) || (event.keyCode > 57)) 
			  event.returnValue = false;
			}
			function Validate(obj){
			  if(true != false){
				// Así damos de nuevo el foco al INPUT
				obj.focus();
			  }
			}    
		</script>