-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-11-2014 a las 09:03:39
-- Versión del servidor: 5.6.14
-- Versión de PHP: 5.5.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `sigaf`
--

--
-- Estructura para la vista `vw_carga`
--
DROP TABLE IF EXISTS `vw_carga`;


CREATE VIEW `vw_carga` AS 
SELECT 
max(cr.programaedu) as carrera, 
max(pre.descripcion) as desc_carr,
max(cr.semestre) as semestre, 
max(cr.periodo) as periodo, 
max(pe.descripcion) as desc_periodo,
max(cr.uaprendizaje) as uaprendizaje,
max(uap. descripcionmat) as descripcionmat,
max(uap.creditos) as creditos,
max(uap.HC) as HC,
max(uap.HL) as HL,
max(uap.HT) as HT,
max(uap.HPC) as HPC,
max(uap.HCL) as HCL,
max(uap.HE) as HE,
max(pua.etapa) as ETAPA,
max(et.descripcion) as desc_etapa,
/*max(cr.grupo) as grupo,*/
(SELECT GROUP_CONCAT(ds.uaprequisito) FROM detalleseriacion ds WHERE ds.uaprendizaje = cr.uaprendizaje and ds.programaedu = gr.programaedu ) AS requisito,
(SELECT GROUP_CONCAT(turnos.descripcion) FROM grupos left join turnos on grupos.turno=turnos.turno WHERE grupos.grupo = cr.grupo) AS turnos,
(SELECT GROUP_CONCAT(carga.grupo) FROM carga WHERE carga.uaprendizaje = cr.uaprendizaje and carga.periodo = cr.periodo and carga.semestre=cr.semestre ) AS grupos
FROM carga cr left join uaprendizaje uap on
	cr.uaprendizaje= uap.uaprendizaje 
inner join p_ua pua on 
	pua.programaedu=cr.programaedu and
	pua.uaprendizaje=cr.uaprendizaje 
left join grupos gr on
	gr.grupo=cr.grupo and
	gr.periodo=cr.periodo and
	gr.programaedu=cr.programaedu
left join programaedu pre on
	pre.programaedu=pua.programaedu
left join periodos pe on
	pe.periodo=cr.periodo and
	pe.periodo=pe.periodo
left join turnos tu on
	tu.turno=gr.turno
left join detalleseriacion ds on
	ds.uaprendizaje=cr.uaprendizaje  and
	ds.programaedu=gr.programaedu
left join etapas et on
	et.etapa=pua.etapa
GROUP BY cr.periodo,cr.programaedu,cr.semestre, pua.uaprendizaje;



--
-- Estructura para la vista `vw_carga_totales`
--
DROP TABLE IF EXISTS `vw_carga_totales`;


CREATE VIEW `vw_carga_totales` AS 
select 
max(uap.plan) as plan,
max(uac.uacademica) as codigo_uac,
max(uac.descripcion) as desc_uac,
max(pua.programaedu) as programaedu,
max(pe.siglas) as siglas,
max(pe.descripcion) as desc_pe,
max(pe.id) as coordinador,
max(concat(trim(us.name),' ',trim(us.last_name)) ) as nombre_coor,
max(puee.id) as id_directivo,
max(pues.descripcion) as desc_puesto,
(select max(concat(trim(users.name),' ',trim(users.last_name)) ) from users where users.id=puee.id) as directivo_uac,
sum(uap.creditos) as tot_creditos,
(select count(p_ua.caracter) from p_ua where p_ua.programaedu=pua.programaedu and p_ua.caracter=1 ) as tot_obligatoria,
(select count(p_ua.caracter) from p_ua where p_ua.programaedu=pua.programaedu and p_ua.caracter=2 ) as tot_optativa 

from p_ua pua left join uaprendizaje uap on 
		pua.uaprendizaje=uap.uaprendizaje 	
	left join programaedu pe on
		pua.programaedu=pe.programaedu
	left join uacademica uac on
		pe.uacademica=uac.uacademica
	left join puestosemp puee on
		puee.uacademica=uac.uacademica
	left join puesto pues on	
		puee.puesto=pues.puesto
	left join users us on
		us.id=pe.id 
where pues.puesto in (1,2,3) /*Aplica solo DIR SUBDIR ADM*/
group by uac.uacademica , pua.programaedu , uap.plan,puee.puesto;


--
-- Estructura para la vista `vw_datospersonales`
--
DROP TABLE IF EXISTS `vw_datospersonales`;


CREATE VIEW `vw_datospersonales` AS 
select
	us.id as no_empleado,
	us.fec_ing,
	us.rfc as rfc,
	UPPER(us.last_name) as last_paterno,
	UPPER(us.last_materno) as last_materno,
	UPPER(us.name) as name,
	case upper(us.sexo) when "F" then "FEMENINO" else "MASCULINO" end,
	UPPER(us.calle) as calle,
	us.no_ext,
	us.no_int,
	us.cp, 
	UPPER(us.colonia) as colonia,
	cd.ciudad,
	UPPER(cd.descripcion) as desc_cd,
	es.estado,
	UPPER(es.descripcion) as desc_es,
	pa.pais,
	pa.descripcion as desc_pais,
us.telofna as telofna,
us.phone as telpart,
us.telcel as telcel,
us.email as email,
us.email_alternat as email_alternat,
tad.empresa as empresa,
upper(eadi.descripcion) as desc_empresa,
tad.puesto,
upper(pu.descripcion) as puesto,
tad.fec_ing




 from users us inner join /*Cambiar por full outer join que no funciona para mysql*/ ciudad cd on 
	us.ciudad=cd.ciudad
		inner join estado es on 
	es.estado=cd.estado
		inner join pais pa on 
	pa.pais=es.pais
		left join trabadicional_emp tad on
	tad.id=us.id
		left join empresa_adic eadi on
	eadi.empresa=tad.empresa
		left join puesto pu on
	pu.puesto=tad.puesto;
	
	






--
-- Estructura para la vista `vw_datosperfil`
--
DROP TABLE IF EXISTS `vw_datosperfil`;


CREATE VIEW `vw_datosperfil` AS 
select
	us.id,
	actpe.carrera,
	cae.descripcion as desc_carrera,
	actpe.universidad,
	uni.descripcion as desc_universidad,
	uni.descripshort,
	actpe.nivel,
	nvp.descripcion as desc_nivel,
	actpe.fec_tit,
	actpe.cedula
from users us 

left join act_profesional_emp actpe on
	us.id=actpe.id
left join carreras_emp cae on
	cae.carrera=actpe.carrera
left join universidades_emp uni on
	uni.universidad= actpe.universidad
left join nvprograma nvp on
	nvp.nivel=actpe.nivel
order by nivel;
	






--
-- Estructura para la vista `vw_datoscursos`
--
DROP TABLE IF EXISTS `vw_datoscursos`;


CREATE VIEW `vw_datoscursos` AS 
select
	us.id,
	cur.caracteristica_cur as caracteristica_cur,
	car.descripcion as desc_carac_cur,
	cur.curso,
	cur.descripcion as nombre_cur,
	cur.fecha,
	cur.creditos as valor_creditos,
	cur.horas as valor_horas,
	actae.tipo_curso_emp as tipo_cur,
	tip.descripcion as desc_tipo_cur,
	cur.periodo,
	per.descripcion as desc_periodo
from users us 

left join act_adicional_emp actae on
	us.id=actae.id
left join act_profesional_adic cur on
	cur.curso= actae.curso
left join caracteristica_cur car on
	car.caracteristica_cur=cur.caracteristica_cur
left join tipo_curso_emp as tip on
	tip.tipo_curso_emp=actae.tipo_curso_emp
left join periodos as per on
	per.periodo=cur.periodo;
