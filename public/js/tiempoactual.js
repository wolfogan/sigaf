// Definición de variables para el tiempo
var mydate = new Date();
var myday = mydate.getDay();
var mymonth = mydate.getMonth();
var myweekday= mydate.getDate();
var myyear=mydate.getFullYear();
var weekday= myweekday;

switch(myday)
{
	case 0:day = " Domingo ";		break;
	case 1:day = " Lunes ";		break;
	case 2:day = " Martes ";		break;
	case 3:day = " Miércoles ";	break;
	case 4:day = " Jueves ";		break;
	case 5:day = " Viernes ";		break;
	case 6:day = " Sábado ";		break;
}

switch(mymonth)
{
	case 0: month = "Enero ";		break;
	case 1: month = "Febrero ";		break;
	case 2: month = "Marzo ";		break;
	case 3: month = "Abril ";		break;
	case 4: month = "Mayo ";		break;
	case 5: month = "Junio ";		break;
	case 6: month = "Julio ";		break;
	case 7: month = "Agosto ";		break;
	case 8: month = "Setiembre ";	break;
	case 9: month = "Octubre ";		break;
	case 10:month = "Noviembre ";	break;
	case 11:month = "Diciembre ";	break;
}

/**
 * Función para formatear los minutos y segundos
 * Ejemplo: 01,02,...09
 * @param  {int} i
 * @return {string}
 */
function checkTime(i) {
	if (i<10) {
		i = "0" + i;
	}
	return i;
}

/**
 * Funcion que inicializa el tiempo.
 * @return {false}
 */
function startTime()
{
	var today=new Date();
	var h=today.getHours();
	var m=today.getMinutes();
	var s=today.getSeconds();
	m=checkTime(m);
	s=checkTime(s);
	$('#reloj').html(h+":"+m+":"+s);
	t=setTimeout('startTime()',500);
}

/**
 * Coloca la fecha y tiempo en el div correspondiente.
 * @return {false}
 */
function startWatch()
{
	var fecha = day + myweekday+" de "+month+ " de " +myyear+",";
	$("#fecha").prepend(fecha);
	startTime();
}


//window.onload=function(){startTime();};
