-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-06-2015 a las 01:58:26
-- Versión del servidor: 5.6.17
-- Versión de PHP: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `sigaf`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `act_adicional_emp`
--

CREATE TABLE IF NOT EXISTS `act_adicional_emp` (
  `id` int(11) NOT NULL COMMENT 'Codigo Docente',
  `tipo_curso_emp` int(11) NOT NULL COMMENT 'Cod tipo cur (Rec,Imp,Interes)',
  `curso` int(11) NOT NULL COMMENT 'Código curso',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  KEY `fk_act_adicional_emp_tipo_curso_emp1_idx` (`tipo_curso_emp`),
  KEY `fk_act_adicional_emp_act_profesional_adic1_idx` (`curso`),
  KEY `fk_act_adicional_emp_users1_idx` (`users_id`),
  KEY `fk_act_adicional_emp_users2_idx` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Disparadores `act_adicional_emp`
--
DROP TRIGGER IF EXISTS `bit_D_act_adicional_emp`;
DELIMITER //
CREATE TRIGGER `bit_D_act_adicional_emp` AFTER DELETE ON `act_adicional_emp`
 FOR EACH ROW BEGIN
-- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *act_adicional_emp*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro_old
)
VALUES ('act_adicional_emp', OLD.users_id, 'D', curdate( ) , concat_WS( '|', 
    OLD.curso, 
    OLD.id,
    OLD.tipo_curso_emp ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_act_adicional_emp`;
DELIMITER //
CREATE TRIGGER `bit_I_act_adicional_emp` AFTER INSERT ON `act_adicional_emp`
 FOR EACH ROW BEGIN
-- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *act_adicional_emp*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro
)
VALUES ('act_adicional_emp', NEW.users_id, 'I', curdate( ) , concat_WS( '|',  
    NEW.curso, 
    NEW.id,
    NEW.tipo_curso_emp ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_act_adicional_emp`;
DELIMITER //
CREATE TRIGGER `bit_U_act_adicional_emp` AFTER UPDATE ON `act_adicional_emp`
 FOR EACH ROW BEGIN
-- -----------------------------------------------------
-- Bitacora al MODIFICAR REGISTRO en *act_adicional_emp*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro,
registro_old
)
VALUES ('act_adicional_emp', NEW.users_id, 'U', curdate( ) , concat_WS( '|',  
    NEW.curso, 
    NEW.id,
    NEW.tipo_curso_emp ), concat_WS( '|', 
    OLD.curso, 
    OLD.id,
    OLD.tipo_curso_emp ) 
    
);

END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `act_profesional_adic`
--

CREATE TABLE IF NOT EXISTS `act_profesional_adic` (
  `curso` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código curso,congreso,taller',
  `periodo` int(11) NOT NULL,
  `descripcion` varchar(255) NOT NULL COMMENT 'Desc:cur,cong,tall',
  `fecha` date NOT NULL COMMENT 'Fecha curso',
  `creditos` int(11) NOT NULL COMMENT 'Creditos',
  `horas` decimal(11,2) unsigned NOT NULL COMMENT 'Horas',
  `caracteristica_cur` int(11) NOT NULL,
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`curso`),
  KEY `fk_act_profesional_adic_users1_idx` (`users_id`),
  KEY `fk_act_profesional_adic_periodos1` (`periodo`),
  KEY `fk_act_profesional_adic_caracteristica_cur1` (`caracteristica_cur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Disparadores `act_profesional_adic`
--
DROP TRIGGER IF EXISTS `bit_D_act_profesional_adic`;
DELIMITER //
CREATE TRIGGER `bit_D_act_profesional_adic` AFTER DELETE ON `act_profesional_adic`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *act_profesional_adic*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro_old
)
VALUES (
'act_profesional_adic', OLD.users_id, 'D', curdate( ) , concat_WS( '|',  
  OLD.curso,
  OLD.periodo,
  OLD.descripcion, 
  OLD.fecha,
  OLD.creditos,
  OLD.horas,
  OLD.caracteristica_cur ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_act_profesional_adic`;
DELIMITER //
CREATE TRIGGER `bit_I_act_profesional_adic` AFTER INSERT ON `act_profesional_adic`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *act_profesional_adic*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro
)
VALUES (
'act_profesional_adic', NEW.users_id, 'I', curdate( ) , concat_WS( '|',  
NEW.curso,
NEW.periodo, 
NEW.descripcion,
NEW.fecha,
NEW.creditos,
NEW.horas,
NEW.caracteristica_cur ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_act_profesional_adic`;
DELIMITER //
CREATE TRIGGER `bit_U_act_profesional_adic` AFTER UPDATE ON `act_profesional_adic`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al MODIFICAR REGISTRO en *act_profesional_adic*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro,
registro_old
)
VALUES (
'act_profesional_adic', NEW.users_id, 'U', curdate( ) , concat_WS( '|', 
NEW.curso,
NEW.periodo, 
NEW.descripcion,
NEW.fecha,
NEW.creditos,
NEW.horas,
NEW.caracteristica_cur )
, concat_WS( '|', 
OLD.curso,
OLD.periodo, 
OLD.descripcion,
OLD.fecha,
OLD.creditos,
OLD.horas,
OLD.caracteristica_cur )  
);

END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `act_profesional_emp`
--

CREATE TABLE IF NOT EXISTS `act_profesional_emp` (
  `carrera` int(11) NOT NULL COMMENT 'Carrera adicional',
  `id` int(11) NOT NULL COMMENT 'Usuario',
  `universidad` int(11) NOT NULL COMMENT 'Universidad carr adic',
  `nivel` int(11) NOT NULL COMMENT 'grado (Lic, post, tecn)',
  `cedula` int(11) DEFAULT NULL COMMENT 'No cedula',
  `fec_tit` date DEFAULT NULL COMMENT 'Fecha Tit',
  `obtuvo_grado` bit(1) NOT NULL COMMENT '1=SI, 0=NO',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`carrera`,`id`),
  KEY `fk_act_profesional_emp_nvprograma1_idx` (`nivel`),
  KEY `fk_act_profesional_emp_users1_idx` (`users_id`),
  KEY `fk_act_profesional_emp_users2_idx` (`id`),
  KEY `fk_act_profesional_emp_carreras_emp1_idx` (`carrera`),
  KEY `fk_act_profesional_emp_universidades_emp1_idx` (`universidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Disparadores `act_profesional_emp`
--
DROP TRIGGER IF EXISTS `bit_D_act_profesional_emp`;
DELIMITER //
CREATE TRIGGER `bit_D_act_profesional_emp` AFTER DELETE ON `act_profesional_emp`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *act_profesional_emp*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------
INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro_old
)
VALUES (
'carga', OLD.users_id, 'D', curdate( ) , concat_WS( '|', 
OLD.carrera, 
OLD.id,
OLD.universidad, 
OLD.nivel,                                                                                         
OLD.cedula, 
OLD.fec_tit, 
OLD.obtuvo_grado
));
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_act_profesional_emp`;
DELIMITER //
CREATE TRIGGER `bit_I_act_profesional_emp` AFTER INSERT ON `act_profesional_emp`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *act_profesional_emp*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------
INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro
)
VALUES (
'carga', NEW.users_id, 'I', curdate( ) , concat_WS( '|', 
NEW.carrera, 
NEW.id,
NEW.universidad, 
NEW.nivel,                                                                                         
NEW.cedula, 
NEW.fec_tit, 
NEW.obtuvo_grado
));
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_act_profesional_emp`;
DELIMITER //
CREATE TRIGGER `bit_U_act_profesional_emp` AFTER UPDATE ON `act_profesional_emp`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al MODIFICAR REGISTRO en *act_profesional_emp*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------
INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro,
registro_old
)
VALUES (
'carga', NEW.users_id, 'U', curdate( ) , concat_WS( '|', 
NEW.carrera, 
NEW.id,
NEW.universidad, 
NEW.nivel,                                                                                         
NEW.cedula, 
NEW.fec_tit, 
NEW.obtuvo_grado
),
concat_WS( '|', 
OLD.carrera, 
OLD.id,
OLD.universidad, 
OLD.nivel,                                                                                         
OLD.cedula, 
OLD.fec_tit, 
OLD.obtuvo_grado));
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bitacora`
--

CREATE TABLE IF NOT EXISTS `bitacora` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Consecutivo',
  `tabla` varchar(25) NOT NULL COMMENT 'Tabla',
  `usuario` varchar(20) NOT NULL COMMENT 'Usuario',
  `operacion` char(3) NOT NULL COMMENT 'Operacion realizada',
  `fecha` datetime NOT NULL COMMENT 'Fecha realizacion cambio',
  `registro` varchar(200) DEFAULT NULL COMMENT 'Registro Insertado',
  `registro_old` varchar(200) DEFAULT NULL COMMENT 'Registro Modificado/Borrado',
  PRIMARY KEY (`id`),
  UNIQUE KEY `BI_id_UNIQUE` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1145 ;

--
-- Volcado de datos para la tabla `bitacora`
--

INSERT INTO `bitacora` (`id`, `tabla`, `usuario`, `operacion`, `fecha`, `registro`, `registro_old`) VALUES
(1, 'planestudio', '1', 'I', '2015-01-20 00:00:00', '20101|asdf|123|2015-01-20|2015-01-21|1', NULL),
(2, 'planestudio', '1', 'D', '2015-01-20 00:00:00', NULL, '20101|asdf|123|2015-01-20|2015-01-21|1'),
(3, 'planestudio', '1', 'I', '2015-01-20 00:00:00', '20101|asdf|123|2015-01-01|2015-01-02|1', NULL),
(4, 'planestudio', '1', 'I', '2015-01-20 00:00:00', '20102|asdf|123|2015-01-01|2015-01-20|1', NULL),
(5, 'planestudio', '1', 'D', '2015-01-20 00:00:00', NULL, '20102|asdf|123|2015-01-01|2015-01-20|1'),
(6, 'planestudio', '1', 'D', '2015-01-20 00:00:00', NULL, '20101|asdf|123|2015-01-01|2015-01-02|1'),
(7, 'planestudio', '1', 'I', '2015-01-20 00:00:00', '20101|asdf|123|2015-01-01|2015-01-02|1', NULL),
(8, 'planestudio', '1', 'D', '2015-01-20 00:00:00', NULL, '20101|asdf|123|2015-01-01|2015-01-02|1'),
(9, 'planestudio', '1', 'I', '2015-01-21 00:00:00', '20091|ssdfgdasf|20|2015-01-21|2015-01-21|1', NULL),
(10, 'planestudio', '1', 'I', '2015-01-21 00:00:00', '20092|asdfasfd|50|2015-01-01|2015-01-02|1', NULL),
(11, 'planestudio', '1', 'D', '2015-01-21 00:00:00', NULL, '20092|asdfasfd|50|2015-01-01|2015-01-02|1'),
(12, 'uaprendizaje', '1', 'I', '2015-01-21 00:00:00', '11236|MATEMATICAS 1|5|5|0|0|0|0|15|2015-01-21|vamos a ver|1|20091', NULL),
(13, 'uaprendizaje', '1', 'D', '2015-01-21 00:00:00', NULL, '11236|MATEMATICAS 1|5|5|0|0|0|0|15|2015-01-21|vamos a ver|1|20091'),
(14, 'planestudio', '1', 'D', '2015-01-21 00:00:00', NULL, '20091|ssdfgdasf|20|2015-01-21|2015-01-21|1'),
(15, 'planestudio', '1', 'I', '2015-01-21 00:00:00', '20092|Plan 2009-2|100|2015-01-01|2015-01-31|1', NULL),
(16, 'plan_programa', '1', 'I', '2015-01-21 00:00:00', '20092|1', NULL),
(17, 'plan_programa', '1', 'I', '2015-01-21 00:00:00', '20092|2', NULL),
(18, 'plan_programa', '1', 'I', '2015-01-21 00:00:00', '20092|3', NULL),
(19, 'plan_programa', '1', 'I', '2015-01-21 00:00:00', '20092|4', NULL),
(20, 'plan_programa', '1', 'I', '2015-01-21 00:00:00', '20092|5', NULL),
(21, 'plan_programa', '1', 'I', '2015-01-21 00:00:00', '20092|6', NULL),
(22, 'plan_programa', '1', 'I', '2015-01-21 00:00:00', '20092|7', NULL),
(23, 'uaprendizaje', '1', 'I', '2015-01-21 00:00:00', '11236|MATEMATICAS 1|5|5|0|0|0|0|15|2015-01-21|vamos a ver|1|20092', NULL),
(24, 'p_ua', '1', 'I', '2015-01-21 00:00:00', '1|11236|1|1|1', NULL),
(25, 'p_ua', '1', 'I', '2015-01-21 00:00:00', '3|11236|1|1|1', NULL),
(26, 'uaprendizaje', '1', 'I', '2015-01-21 00:00:00', '11237|MATEMÁTICAS II|5|10|0|0|0|0|20|2015-01-21|vamos a ver|3|20092', NULL),
(27, 'p_ua', '1', 'I', '2015-01-21 00:00:00', '1|11237|2|1|1', NULL),
(28, 'p_ua', '1', 'I', '2015-01-21 00:00:00', '3|11237|2|1|1', NULL),
(29, 'periodos', '2', 'I', '2015-01-21 00:00:00', '20141|1|2014|1|Un período registrado|2015-01-21|2015-10-31|1', NULL),
(30, 'periodos', '2', 'I', '2015-01-21 00:00:00', '20142|1|2014|2|Vamos a ver|2015-01-21|2015-07-25|1', NULL),
(31, 'planestudio', '2', 'I', '2015-01-24 00:00:00', '20101|Plan 2010-1|200|2015-01-01|2015-12-31|1', NULL),
(32, 'plan_programa', '2', 'I', '2015-01-24 00:00:00', '20101|1', NULL),
(33, 'plan_programa', '2', 'I', '2015-01-24 00:00:00', '20101|2', NULL),
(34, 'plan_programa', '2', 'I', '2015-01-24 00:00:00', '20101|3', NULL),
(35, 'plan_programa', '2', 'I', '2015-01-24 00:00:00', '20101|4', NULL),
(36, 'plan_programa', '2', 'I', '2015-01-24 00:00:00', '20101|5', NULL),
(37, 'plan_programa', '2', 'I', '2015-01-24 00:00:00', '20101|6', NULL),
(38, 'plan_programa', '2', 'I', '2015-01-24 00:00:00', '20101|7', NULL),
(39, 'uaprendizaje', '2', 'I', '2015-01-24 00:00:00', '12236|ESPAÑOL|5|0|0|0|0|0|10|2015-01-24|vamos a ver|1|20101', NULL),
(40, 'p_ua', '2', 'I', '2015-01-24 00:00:00', '1|12236|1|1|1', NULL),
(41, 'p_ua', '2', 'I', '2015-01-24 00:00:00', '2|12236|1|1|1', NULL),
(42, 'p_ua', '2', 'I', '2015-01-24 00:00:00', '3|12236|1|1|1', NULL),
(43, 'uaprendizaje', '2', 'I', '2015-01-24 00:00:00', '12237|LITERATURA|5|10|2|0|0|0|22|2015-01-24|si se puede|2|20101', NULL),
(44, 'p_ua', '2', 'I', '2015-01-24 00:00:00', '1|12237|1|1|2', NULL),
(45, 'detalleseriacion', '2', 'I', '2015-01-24 00:00:00', '12237|1|12236|1', NULL),
(46, 'plan_programa', '2', 'D', '2015-01-29 00:00:00', NULL, '20101|7'),
(47, 'plan_programa', '2', 'D', '2015-01-29 00:00:00', NULL, '20101|6'),
(48, 'plan_programa', '2', 'D', '2015-01-29 00:00:00', NULL, '20101|5'),
(49, 'plan_programa', '2', 'D', '2015-01-29 00:00:00', NULL, '20101|4'),
(50, 'plan_programa', '2', 'D', '2015-01-29 00:00:00', NULL, '20101|3'),
(51, 'plan_programa', '2', 'D', '2015-01-29 00:00:00', NULL, '20101|2'),
(52, 'plan_programa', '2', 'D', '2015-01-29 00:00:00', NULL, '20101|1'),
(53, 'plan_programa', '1', 'D', '2015-01-29 00:00:00', NULL, '20092|7'),
(54, 'plan_programa', '1', 'D', '2015-01-29 00:00:00', NULL, '20092|6'),
(55, 'plan_programa', '1', 'D', '2015-01-29 00:00:00', NULL, '20092|5'),
(56, 'plan_programa', '1', 'D', '2015-01-29 00:00:00', NULL, '20092|4'),
(57, 'plan_programa', '1', 'D', '2015-01-29 00:00:00', NULL, '20092|3'),
(58, 'plan_programa', '1', 'D', '2015-01-29 00:00:00', NULL, '20092|2'),
(59, 'plan_programa', '1', 'D', '2015-01-29 00:00:00', NULL, '20092|1'),
(60, 'p_ua', '2', 'D', '2015-01-29 00:00:00', NULL, '3|12236|1|1|1'),
(61, 'p_ua', '1', 'D', '2015-01-29 00:00:00', NULL, '3|11237|2|1|1'),
(62, 'p_ua', '1', 'D', '2015-01-29 00:00:00', NULL, '3|11236|1|1|1'),
(63, 'p_ua', '2', 'D', '2015-01-29 00:00:00', NULL, '2|12236|1|1|1'),
(64, 'detalleseriacion', '2', 'D', '2015-01-29 00:00:00', NULL, '12237|1|12236|1'),
(65, 'p_ua', '2', 'D', '2015-01-29 00:00:00', NULL, '1|12237|1|1|2'),
(66, 'p_ua', '2', 'D', '2015-01-29 00:00:00', NULL, '1|12236|1|1|1'),
(67, 'p_ua', '1', 'D', '2015-01-29 00:00:00', NULL, '1|11237|2|1|1'),
(68, 'p_ua', '1', 'D', '2015-01-29 00:00:00', NULL, '1|11236|1|1|1'),
(69, 'uaprendizaje', '2', 'D', '2015-01-29 00:00:00', NULL, '12237|LITERATURA|5|10|2|0|0|0|22|2015-01-24|si se puede|2|20101'),
(70, 'uaprendizaje', '2', 'D', '2015-01-29 00:00:00', NULL, '12236|ESPAÑOL|5|0|0|0|0|0|10|2015-01-24|vamos a ver|1|20101'),
(71, 'uaprendizaje', '1', 'D', '2015-01-29 00:00:00', NULL, '11237|MATEMÁTICAS II|5|10|0|0|0|0|20|2015-01-21|vamos a ver|3|20092'),
(72, 'uaprendizaje', '1', 'D', '2015-01-29 00:00:00', NULL, '11236|MATEMATICAS 1|5|5|0|0|0|0|15|2015-01-21|vamos a ver|1|20092'),
(73, 'planestudio', '2', 'D', '2015-01-29 00:00:00', NULL, '20101|Plan 2010-1|200|2015-01-01|2015-12-31|1'),
(74, 'planestudio', '1', 'D', '2015-01-29 00:00:00', NULL, '20092|Plan 2009-2|100|2015-01-01|2015-01-31|1'),
(75, 'planestudio', '1', 'I', '2015-01-29 00:00:00', '20091|Plan 2009-1|200|2015-01-29|2017-12-31|1', NULL),
(76, 'plan_programa', '1', 'I', '2015-01-29 00:00:00', '20091|1', NULL),
(77, 'plan_programa', '1', 'I', '2015-01-29 00:00:00', '20091|2', NULL),
(78, 'plan_programa', '1', 'I', '2015-01-29 00:00:00', '20091|3', NULL),
(79, 'plan_programa', '1', 'I', '2015-01-29 00:00:00', '20091|4', NULL),
(80, 'plan_programa', '1', 'I', '2015-01-29 00:00:00', '20091|5', NULL),
(81, 'plan_programa', '1', 'I', '2015-01-29 00:00:00', '20091|6', NULL),
(82, 'plan_programa', '1', 'I', '2015-01-29 00:00:00', '20091|7', NULL),
(83, 'uaprendizaje', '1', 'I', '2015-01-29 00:00:00', '11236|MATEMÁTICAS I|5|5|0|0|0|0|15|2015-01-29|vamos a ver|1|20091', NULL),
(84, 'p_ua', '1', 'I', '2015-01-29 00:00:00', '1|11236|1|1|1', NULL),
(85, 'p_ua', '1', 'I', '2015-01-29 00:00:00', '3|11236|1|1|1', NULL),
(86, 'uaprendizaje', '1', 'I', '2015-01-29 00:00:00', '11237|MATEMÁTICAS II|15|2|0|0|0|0|32|2015-01-29|vamos a ver|1|20091', NULL),
(87, 'p_ua', '1', 'I', '2015-01-29 00:00:00', '1|11237|1|1|1', NULL),
(88, 'detalleseriacion', '1', 'I', '2015-01-29 00:00:00', '11237|1|11236|1', NULL),
(89, 'p_ua', '1', 'I', '2015-01-29 00:00:00', '3|11237|1|1|1', NULL),
(90, 'detalleseriacion', '1', 'I', '2015-01-29 00:00:00', '11237|3|11236|1', NULL),
(91, 'uaprendizaje', '1', 'I', '2015-01-29 00:00:00', '11238|MATEMÁTICAS BASICAS|3|0|0|0|0|0|6|2015-01-29|vamos a ver|1|20091', NULL),
(92, 'p_ua', '1', 'I', '2015-01-29 00:00:00', '6|11238|1|1|1', NULL),
(93, 'uaprendizaje', '1', 'I', '2015-01-29 00:00:00', '11239|ESPAÑOL|3|0|0|0|0|0|6|2015-01-29|vamos a ver|2|20091', NULL),
(94, 'p_ua', '1', 'I', '2015-01-29 00:00:00', '6|11239|1|1|1', NULL),
(95, 'uaprendizaje', '1', 'I', '2015-01-29 00:00:00', '11240|OPTATIVA 1|3|0|0|0|0|0|6|2015-01-29|vamos a ver|5|20091', NULL),
(96, 'p_ua', '1', 'I', '2015-01-29 00:00:00', '1|11240|1|2|1', NULL),
(97, 'grupos', '1', 'I', '2015-01-29 00:00:00', '111|20141|20091|1|1', NULL),
(98, 'grupos', '1', 'I', '2015-01-29 00:00:00', '112|20141|20091|1|3', NULL),
(99, 'carga', '1', 'I', '2015-01-29 00:00:00', '111|20141|1|11236|1', NULL),
(100, 'carga', '1', 'I', '2015-01-29 00:00:00', '111|20141|1|11237|1', NULL),
(101, 'carga', '1', 'I', '2015-01-29 00:00:00', '112|20141|1|11236|1', NULL),
(102, 'carga', '1', 'I', '2015-01-29 00:00:00', '112|20141|1|11237|1', NULL),
(103, 'carga', '1', 'D', '2015-01-29 00:00:00', NULL, '112|20141|1|11237|1'),
(104, 'carga', '1', 'D', '2015-01-29 00:00:00', NULL, '112|20141|1|11236|1'),
(105, 'carga', '1', 'D', '2015-01-29 00:00:00', NULL, '111|20141|1|11237|1'),
(106, 'carga', '1', 'D', '2015-01-29 00:00:00', NULL, '111|20141|1|11236|1'),
(107, 'carga', '1', 'I', '2015-01-29 00:00:00', '111|20141|1|11236|1', NULL),
(108, 'carga', '1', 'I', '2015-01-29 00:00:00', '111|20141|1|11236|1', NULL),
(109, 'carga', '1', 'I', '2015-01-29 00:00:00', '112|20141|1|11236|1', NULL),
(110, 'carga', '1', 'I', '2015-01-29 00:00:00', '111|20141|1|11240|1', NULL),
(111, 'grupos', '1', 'I', '2015-01-29 00:00:00', '113|20141|20091|1|1', NULL),
(112, 'grupos', '1', 'I', '2015-01-29 00:00:00', '114|20141|20091|1|2', NULL),
(113, 'carga', '1', 'I', '2015-01-29 00:00:00', '111|20141|1|11236|1', NULL),
(114, 'carga', '1', 'I', '2015-01-29 00:00:00', '112|20141|1|11236|1', NULL),
(115, 'carga', '1', 'I', '2015-01-29 00:00:00', '113|20141|1|11236|1', NULL),
(116, 'carga', '1', 'I', '2015-01-29 00:00:00', '114|20141|1|11236|1', NULL),
(117, 'carga', '1', 'I', '2015-01-29 00:00:00', '112|20141|1|11240|1', NULL),
(118, 'carga', '1', 'D', '2015-01-29 00:00:00', NULL, '112|20141|1|11240|1'),
(119, 'carga', '1', 'D', '2015-01-29 00:00:00', NULL, '111|20141|1|11236|1'),
(120, 'carga', '1', 'D', '2015-01-29 00:00:00', NULL, '112|20141|1|11236|1'),
(121, 'carga', '1', 'D', '2015-01-29 00:00:00', NULL, '113|20141|1|11236|1'),
(122, 'carga', '1', 'D', '2015-01-29 00:00:00', NULL, '114|20141|1|11236|1'),
(123, 'carga', '1', 'I', '2015-01-29 00:00:00', '111|20141|1|11236|1', NULL),
(124, 'carga', '1', 'I', '2015-01-29 00:00:00', '112|20141|1|11236|1', NULL),
(125, 'carga', '1', 'I', '2015-01-29 00:00:00', '113|20141|1|11236|1', NULL),
(126, 'carga', '1', 'I', '2015-01-29 00:00:00', '114|20141|1|11236|1', NULL),
(127, 'carga', '1', 'I', '2015-01-29 00:00:00', '111|20141|1|11240|1', NULL),
(128, 'carga', '1', 'I', '2015-01-29 00:00:00', '112|20141|1|11240|1', NULL),
(129, 'carga', '1', 'I', '2015-01-29 00:00:00', '113|20141|1|11240|1', NULL),
(130, 'carga', '1', 'I', '2015-01-29 00:00:00', '114|20141|1|11240|1', NULL),
(131, 'carga', '1', 'I', '2015-01-29 00:00:00', '111|20141|1|11236|1', NULL),
(132, 'carga', '1', 'I', '2015-01-29 00:00:00', '112|20141|1|11236|1', NULL),
(133, 'carga', '1', 'I', '2015-01-29 00:00:00', '113|20141|1|11237|1', NULL),
(134, 'carga', '1', 'I', '2015-01-29 00:00:00', '114|20141|1|11237|1', NULL),
(135, 'carga', '1', 'I', '2015-01-30 00:00:00', '114|20141|1|11240|1', NULL),
(136, 'carga', '1', 'I', '2015-01-30 00:00:00', '113|20141|1|11240|1', NULL),
(137, 'grupos', '1', 'I', '2015-01-31 00:00:00', '115|20141|20091|1|1', NULL),
(146, 'carga', '1', 'D', '2015-02-06 00:00:00', NULL, '111|20141|1|11236|1'),
(147, 'carga', '1', 'D', '2015-02-06 00:00:00', NULL, '112|20141|1|11236|1'),
(148, 'carga', '1', 'I', '2015-02-06 00:00:00', '111|20141|1|11236|1', NULL),
(149, 'carga', '1', 'D', '2015-02-06 00:00:00', NULL, '111|20141|1|11236|1'),
(150, 'carga', '1', 'I', '2015-02-06 00:00:00', '111|20141|1|11236|1', NULL),
(151, 'carga', '1', 'D', '2015-02-06 00:00:00', NULL, '111|20141|1|11236|1'),
(152, 'carga', '1', 'I', '2015-02-06 00:00:00', '111|20141|1|11236|1', NULL),
(153, 'carga', '1', 'I', '2015-02-06 00:00:00', '112|20141|1|11236|1', NULL),
(154, 'carga', '1', 'I', '2015-02-06 00:00:00', '113|20141|1|11236|1', NULL),
(155, 'carga', '1', 'D', '2015-02-06 00:00:00', NULL, '111|20141|1|11236|1'),
(156, 'carga', '1', 'D', '2015-02-06 00:00:00', NULL, '112|20141|1|11236|1'),
(157, 'carga', '1', 'D', '2015-02-06 00:00:00', NULL, '113|20141|1|11236|1'),
(158, 'carga', '1', 'I', '2015-02-06 00:00:00', '111|20141|1|11236|1', NULL),
(159, 'carga', '1', 'I', '2015-02-06 00:00:00', '112|20141|1|11236|1', NULL),
(160, 'carga', '1', 'I', '2015-02-06 00:00:00', '113|20141|1|11236|1', NULL),
(161, 'carga', '1', 'I', '2015-02-06 00:00:00', '114|20141|1|11236|1', NULL),
(162, 'carga', '1', 'I', '2015-02-06 00:00:00', '115|20141|1|11236|1', NULL),
(163, 'carga', '1', 'D', '2015-02-06 00:00:00', NULL, '111|20141|1|11236|1'),
(164, 'carga', '1', 'D', '2015-02-06 00:00:00', NULL, '112|20141|1|11236|1'),
(165, 'carga', '1', 'D', '2015-02-06 00:00:00', NULL, '113|20141|1|11236|1'),
(166, 'carga', '1', 'D', '2015-02-06 00:00:00', NULL, '114|20141|1|11236|1'),
(167, 'carga', '1', 'D', '2015-02-06 00:00:00', NULL, '115|20141|1|11236|1'),
(168, 'carga', '1', 'I', '2015-02-06 00:00:00', '111|20141|1|11236|1', NULL),
(169, 'carga', '1', 'I', '2015-02-06 00:00:00', '112|20141|1|11236|1', NULL),
(170, 'carga', '1', 'D', '2015-02-06 00:00:00', NULL, '111|20141|1|11236|1'),
(171, 'carga', '1', 'D', '2015-02-06 00:00:00', NULL, '112|20141|1|11236|1'),
(172, 'carga', '1', 'I', '2015-02-06 00:00:00', '111|20141|1|11236|1', NULL),
(173, 'carga', '1', 'I', '2015-02-06 00:00:00', '112|20141|1|11236|1', NULL),
(174, 'carga', '1', 'I', '2015-02-06 00:00:00', '113|20141|1|11236|1', NULL),
(175, 'carga', '1', 'D', '2015-02-06 00:00:00', NULL, '111|20141|1|11236|1'),
(176, 'carga', '1', 'D', '2015-02-06 00:00:00', NULL, '112|20141|1|11236|1'),
(177, 'carga', '1', 'D', '2015-02-06 00:00:00', NULL, '113|20141|1|11236|1'),
(178, 'carga', '1', 'I', '2015-02-06 00:00:00', '111|20141|1|11236|1', NULL),
(179, 'carga', '1', 'D', '2015-02-06 00:00:00', NULL, '111|20141|1|11236|1'),
(180, 'carga', '1', 'I', '2015-02-06 00:00:00', '111|20141|1|11236|1', NULL),
(181, 'carga', '1', 'I', '2015-02-06 00:00:00', '112|20141|1|11236|1', NULL),
(182, 'carga', '1', 'I', '2015-02-06 00:00:00', '113|20141|1|11236|1', NULL),
(183, 'carga', '1', 'D', '2015-02-06 00:00:00', NULL, '113|20141|1|11237|1'),
(184, 'carga', '1', 'D', '2015-02-06 00:00:00', NULL, '114|20141|1|11237|1'),
(185, 'carga', '1', 'I', '2015-02-06 00:00:00', '112|20141|1|11237|1', NULL),
(186, 'carga', '1', 'I', '2015-02-06 00:00:00', '113|20141|1|11237|1', NULL),
(187, 'carga', '1', 'I', '2015-02-06 00:00:00', '114|20141|1|11237|1', NULL),
(188, 'carga', '1', 'D', '2015-02-06 00:00:00', NULL, '111|20141|1|11236|1'),
(189, 'carga', '1', 'D', '2015-02-06 00:00:00', NULL, '112|20141|1|11236|1'),
(190, 'carga', '1', 'D', '2015-02-06 00:00:00', NULL, '113|20141|1|11236|1'),
(191, 'carga', '1', 'I', '2015-02-06 00:00:00', '111|20141|1|11236|1', NULL),
(192, 'carga', '1', 'D', '2015-02-06 00:00:00', NULL, '111|20141|1|11236|1'),
(193, 'carga', '1', 'I', '2015-02-06 00:00:00', '111|20141|1|11236|1', NULL),
(194, 'carga', '1', 'I', '2015-02-06 00:00:00', '112|20141|1|11236|1', NULL),
(195, 'carga', '1', 'I', '2015-02-06 00:00:00', '113|20141|1|11236|1', NULL),
(196, 'carga', '1', 'I', '2015-02-06 00:00:00', '114|20141|1|11236|1', NULL),
(197, 'carga', '1', 'I', '2015-02-06 00:00:00', '115|20141|1|11236|1', NULL),
(198, 'carga', '1', 'D', '2015-02-06 00:00:00', NULL, '112|20141|1|11237|1'),
(199, 'carga', '1', 'D', '2015-02-06 00:00:00', NULL, '113|20141|1|11237|1'),
(200, 'carga', '1', 'D', '2015-02-06 00:00:00', NULL, '114|20141|1|11237|1'),
(201, 'carga', '1', 'I', '2015-02-06 00:00:00', '111|20141|1|11237|1', NULL),
(202, 'carga', '1', 'I', '2015-02-06 00:00:00', '112|20141|1|11237|1', NULL),
(203, 'carga', '1', 'I', '2015-02-06 00:00:00', '113|20141|1|11237|1', NULL),
(204, 'carga', '1', 'I', '2015-02-06 00:00:00', '114|20141|1|11237|1', NULL),
(205, 'carga', '1', 'I', '2015-02-06 00:00:00', '115|20141|1|11237|1', NULL),
(206, 'carga', '1', 'D', '2015-02-06 00:00:00', NULL, '111|20141|1|11236|1'),
(207, 'carga', '1', 'D', '2015-02-06 00:00:00', NULL, '112|20141|1|11236|1'),
(208, 'carga', '1', 'D', '2015-02-06 00:00:00', NULL, '113|20141|1|11236|1'),
(209, 'carga', '1', 'D', '2015-02-06 00:00:00', NULL, '114|20141|1|11236|1'),
(210, 'carga', '1', 'D', '2015-02-06 00:00:00', NULL, '115|20141|1|11236|1'),
(211, 'carga', '1', 'I', '2015-02-06 00:00:00', '111|20141|1|11236|1', NULL),
(212, 'carga', '1', 'I', '2015-02-06 00:00:00', '112|20141|1|11236|1', NULL),
(213, 'carga', '1', 'D', '2015-02-06 00:00:00', NULL, '113|20141|1|11240|1'),
(214, 'carga', '1', 'D', '2015-02-06 00:00:00', NULL, '114|20141|1|11240|1'),
(215, 'carga', '1', 'I', '2015-02-06 00:00:00', '112|20141|1|11240|1', NULL),
(216, 'carga', '1', 'I', '2015-02-06 00:00:00', '113|20141|1|11240|1', NULL),
(217, 'carga', '1', 'I', '2015-02-06 00:00:00', '114|20141|1|11240|1', NULL),
(218, 'carga', '1', 'D', '2015-02-06 00:00:00', NULL, '111|20141|1|11236|1'),
(219, 'carga', '1', 'D', '2015-02-06 00:00:00', NULL, '112|20141|1|11236|1'),
(220, 'carga', '1', 'I', '2015-02-06 00:00:00', '111|20141|1|11236|1', NULL),
(221, 'carga', '1', 'I', '2015-02-06 00:00:00', '112|20141|1|11236|1', NULL),
(222, 'carga', '1', 'I', '2015-02-06 00:00:00', '113|20141|1|11236|1', NULL),
(223, 'carga', '1', 'I', '2015-02-06 00:00:00', '114|20141|1|11236|1', NULL),
(224, 'carga', '1', 'I', '2015-02-06 00:00:00', '115|20141|1|11236|1', NULL),
(225, 'carga', '1', 'D', '2015-02-06 00:00:00', NULL, '112|20141|1|11240|1'),
(226, 'carga', '1', 'D', '2015-02-06 00:00:00', NULL, '113|20141|1|11240|1'),
(227, 'carga', '1', 'D', '2015-02-06 00:00:00', NULL, '114|20141|1|11240|1'),
(228, 'carga', '1', 'I', '2015-02-06 00:00:00', '111|20141|1|11240|1', NULL),
(229, 'grupos', '1', 'I', '2015-02-06 00:00:00', '121|20141|20091|1|2', NULL),
(230, 'carga', '1', 'I', '2015-02-06 00:00:00', '121|20141|1|11237|2', NULL),
(231, 'carga', '1', 'D', '2015-02-06 00:00:00', NULL, '111|20141|1|11237|1'),
(232, 'carga', '1', 'D', '2015-02-06 00:00:00', NULL, '112|20141|1|11237|1'),
(233, 'carga', '1', 'D', '2015-02-06 00:00:00', NULL, '113|20141|1|11237|1'),
(234, 'carga', '1', 'D', '2015-02-06 00:00:00', NULL, '114|20141|1|11237|1'),
(235, 'carga', '1', 'D', '2015-02-06 00:00:00', NULL, '115|20141|1|11237|1'),
(236, 'carga', '1', 'D', '2015-02-06 00:00:00', NULL, '121|20141|1|11237|2'),
(237, 'carga', '1', 'D', '2015-02-06 00:00:00', NULL, '111|20141|1|11240|1'),
(238, 'carga', '1', 'I', '2015-02-06 00:00:00', '121|20141|1|11237|2', NULL),
(239, 'carga', '1', 'I', '2015-02-06 00:00:00', '111|20141|1|11237|1', NULL),
(240, 'carga', '1', 'I', '2015-02-06 00:00:00', '112|20141|1|11237|1', NULL),
(241, 'carga', '1', 'I', '2015-02-06 00:00:00', '113|20141|1|11237|1', NULL),
(242, 'carga', '1', 'I', '2015-02-06 00:00:00', '114|20141|1|11237|1', NULL),
(243, 'carga', '1', 'I', '2015-02-06 00:00:00', '115|20141|1|11237|1', NULL),
(244, 'carga', '1', 'D', '2015-02-06 00:00:00', NULL, '111|20141|1|11237|1'),
(245, 'carga', '1', 'D', '2015-02-06 00:00:00', NULL, '112|20141|1|11237|1'),
(246, 'carga', '1', 'D', '2015-02-06 00:00:00', NULL, '113|20141|1|11237|1'),
(247, 'carga', '1', 'D', '2015-02-06 00:00:00', NULL, '114|20141|1|11237|1'),
(248, 'carga', '1', 'D', '2015-02-06 00:00:00', NULL, '115|20141|1|11237|1'),
(249, 'carga', '1', 'D', '2015-02-06 00:00:00', NULL, '111|20141|1|11236|1'),
(250, 'carga', '1', 'D', '2015-02-06 00:00:00', NULL, '112|20141|1|11236|1'),
(251, 'carga', '1', 'D', '2015-02-06 00:00:00', NULL, '113|20141|1|11236|1'),
(252, 'carga', '1', 'D', '2015-02-06 00:00:00', NULL, '114|20141|1|11236|1'),
(253, 'carga', '1', 'D', '2015-02-06 00:00:00', NULL, '115|20141|1|11236|1'),
(254, 'carga', '1', 'I', '2015-02-06 00:00:00', '111|20141|1|11236|1', NULL),
(255, 'carga', '1', 'I', '2015-02-06 00:00:00', '112|20141|1|11236|1', NULL),
(256, 'carga', '1', 'I', '2015-02-06 00:00:00', '113|20141|1|11237|1', NULL),
(257, 'carga', '1', 'I', '2015-02-06 00:00:00', '111|20141|1|11238|1', NULL),
(258, 'carga', '1', 'I', '2015-02-06 00:00:00', '112|20141|1|11238|1', NULL),
(259, 'carga', '1', 'I', '2015-02-06 00:00:00', '113|20141|1|11238|1', NULL),
(260, 'carga', '1', 'I', '2015-02-06 00:00:00', '111|20141|1|11239|1', NULL),
(261, 'carga', '1', 'I', '2015-02-06 00:00:00', '112|20141|1|11239|1', NULL),
(262, 'carga', '1', 'I', '2015-02-06 00:00:00', '113|20141|1|11239|1', NULL),
(263, 'carga', '1', 'I', '2015-02-06 00:00:00', '111|20141|1|11236|1', NULL),
(264, 'carga', '1', 'I', '2015-02-06 00:00:00', '112|20141|1|11236|1', NULL),
(265, 'carga', '1', 'I', '2015-02-06 00:00:00', '113|20141|1|11236|1', NULL),
(266, 'carga', '1', 'I', '2015-02-06 00:00:00', '114|20141|1|11236|1', NULL),
(267, 'carga', '1', 'I', '2015-02-06 00:00:00', '115|20141|1|11236|1', NULL),
(268, 'carga', '1', 'I', '2015-02-06 00:00:00', '111|20141|1|11238|1', NULL),
(269, 'carga', '1', 'I', '2015-02-06 00:00:00', '112|20141|1|11238|1', NULL),
(270, 'carga', '1', 'I', '2015-02-06 00:00:00', '113|20141|1|11238|1', NULL),
(271, 'carga', '1', 'I', '2015-02-06 00:00:00', '114|20141|1|11238|1', NULL),
(272, 'carga', '1', 'I', '2015-02-06 00:00:00', '115|20141|1|11238|1', NULL),
(273, 'carga', '1', 'I', '2015-02-11 00:00:00', '111|20141|1|11236|1', NULL),
(274, 'carga', '1', 'I', '2015-02-11 00:00:00', '111|20141|1|11237|1', NULL),
(275, 'carga', '1', 'I', '2015-02-11 00:00:00', '111|20141|1|11238|1', NULL),
(276, 'carga', '1', 'I', '2015-02-11 00:00:00', '112|20141|1|11238|1', NULL),
(277, 'carga', '1', 'I', '2015-02-11 00:00:00', '113|20141|1|11238|1', NULL),
(278, 'carga', '1', 'I', '2015-02-11 00:00:00', '114|20141|1|11238|1', NULL),
(279, 'carga', '1', 'I', '2015-02-11 00:00:00', '115|20141|1|11238|1', NULL),
(280, 'carga', '1', 'D', '2015-02-11 00:00:00', NULL, '111|20141|1|11236|1'),
(281, 'carga', '1', 'I', '2015-02-11 00:00:00', '112|20141|1|11238|1', NULL),
(282, 'carga', '1', 'I', '2015-02-11 00:00:00', '113|20141|1|11238|1', NULL),
(283, 'carga', '1', 'D', '2015-02-11 00:00:00', NULL, '113|20141|1|11238|1'),
(284, 'carga', '1', 'D', '2015-02-11 00:00:00', NULL, '112|20141|1|11238|1'),
(285, 'carga', '1', 'I', '2015-02-11 00:00:00', '111|20141|1|11236|1', NULL),
(286, 'carga', '1', 'I', '2015-02-11 00:00:00', '111|20141|1|11237|1', NULL),
(287, 'carga', '1', 'I', '2015-02-11 00:00:00', '112|20141|1|11236|1', NULL),
(288, 'carga', '1', 'I', '2015-02-11 00:00:00', '112|20141|1|11237|1', NULL),
(289, 'carga', '1', 'I', '2015-02-11 00:00:00', '113|20141|1|11236|1', NULL),
(290, 'carga', '1', 'I', '2015-02-11 00:00:00', '113|20141|1|11237|1', NULL),
(291, 'carga', '1', 'I', '2015-02-11 00:00:00', '114|20141|1|11236|1', NULL),
(292, 'carga', '1', 'I', '2015-02-11 00:00:00', '114|20141|1|11237|1', NULL),
(293, 'carga', '1', 'I', '2015-02-11 00:00:00', '115|20141|1|11236|1', NULL),
(294, 'carga', '1', 'I', '2015-02-11 00:00:00', '115|20141|1|11237|1', NULL),
(295, 'grupos', '1', 'I', '2015-02-11 00:00:00', '111|20142|20091|1|1', NULL),
(296, 'carga', '1', 'I', '2015-02-11 00:00:00', '111|20142|1|11236|1', NULL),
(297, 'carga', '1', 'D', '2015-02-11 00:00:00', NULL, '111|20142|1|11236|1'),
(298, 'carga', '1', 'I', '2015-02-11 00:00:00', '111|20142|1|11236|1', NULL),
(299, 'carga', '1', 'D', '2015-02-11 00:00:00', NULL, '111|20141|1|11236|1'),
(300, 'carga', '1', 'D', '2015-02-11 00:00:00', NULL, '112|20141|1|11236|1'),
(301, 'carga', '1', 'D', '2015-02-11 00:00:00', NULL, '113|20141|1|11236|1'),
(302, 'carga', '1', 'D', '2015-02-11 00:00:00', NULL, '114|20141|1|11236|1'),
(303, 'carga', '1', 'D', '2015-02-11 00:00:00', NULL, '115|20141|1|11236|1'),
(304, 'carga', '1', 'I', '2015-02-11 00:00:00', '111|20141|1|11236|1', NULL),
(305, 'carga', '1', 'I', '2015-02-11 00:00:00', '113|20141|1|11236|1', NULL),
(306, 'carga', '1', 'D', '2015-02-11 00:00:00', NULL, '111|20141|1|11237|1'),
(307, 'carga', '1', 'D', '2015-02-11 00:00:00', NULL, '112|20141|1|11237|1'),
(308, 'carga', '1', 'D', '2015-02-11 00:00:00', NULL, '113|20141|1|11237|1'),
(309, 'carga', '1', 'D', '2015-02-11 00:00:00', NULL, '114|20141|1|11237|1'),
(310, 'carga', '1', 'D', '2015-02-11 00:00:00', NULL, '115|20141|1|11237|1'),
(311, 'carga', '1', 'I', '2015-02-11 00:00:00', '111|20141|1|11237|1', NULL),
(312, 'carga', '1', 'I', '2015-02-11 00:00:00', '112|20141|1|11237|1', NULL),
(313, 'grupos', '1', 'D', '2015-02-12 00:00:00', NULL, '121|20141|20091|1|2'),
(314, 'grupos', '1', 'D', '2015-02-12 00:00:00', NULL, '115|20141|20091|1|1'),
(315, 'grupos', '1', 'D', '2015-02-12 00:00:00', NULL, '114|20141|20091|1|2'),
(316, 'grupos', '1', 'D', '2015-02-12 00:00:00', NULL, '113|20141|20091|1|1'),
(317, 'grupos', '1', 'D', '2015-02-12 00:00:00', NULL, '112|20141|20091|1|3'),
(318, 'grupos', '1', 'D', '2015-02-12 00:00:00', NULL, '111|20142|20091|1|1'),
(319, 'grupos', '1', 'D', '2015-02-12 00:00:00', NULL, '111|20141|20091|1|1'),
(320, 'grupos', '1', 'I', '2015-02-12 00:00:00', '111|20141|20091|1|1', NULL),
(321, 'grupos', '1', 'I', '2015-02-12 00:00:00', '112|20141|20091|1|1', NULL),
(322, 'grupos', '1', 'I', '2015-02-12 00:00:00', '113|20141|20091|1|1', NULL),
(323, 'carga', '1', 'I', '2015-02-12 00:00:00', '111|20141|1|11236|1', NULL),
(324, 'carga', '1', 'I', '2015-02-12 00:00:00', '112|20141|1|11236|1', NULL),
(325, 'carga', '1', 'I', '2015-02-12 00:00:00', '113|20141|1|11236|1', NULL),
(326, 'carga', '1', 'I', '2015-02-12 00:00:00', '112|20141|1|11240|1', NULL),
(327, 'carga', '1', 'I', '2015-02-12 00:00:00', '111|20141|1|11236|1', NULL),
(328, 'carga', '1', 'I', '2015-02-12 00:00:00', '112|20141|1|11236|1', NULL),
(329, 'carga', '1', 'I', '2015-02-12 00:00:00', '113|20141|1|11236|1', NULL),
(330, 'carga', '1', 'I', '2015-02-12 00:00:00', '112|20141|1|11240|1', NULL),
(331, 'planestudio', '1', 'I', '2015-02-12 00:00:00', '20092|Plan 2009-2|300|2015-02-12|2015-10-31|1', NULL),
(332, 'plan_programa', '1', 'I', '2015-02-12 00:00:00', '20092|1', NULL),
(333, 'plan_programa', '1', 'I', '2015-02-12 00:00:00', '20092|2', NULL),
(334, 'plan_programa', '1', 'I', '2015-02-12 00:00:00', '20092|3', NULL),
(335, 'plan_programa', '1', 'I', '2015-02-12 00:00:00', '20092|4', NULL),
(336, 'plan_programa', '1', 'I', '2015-02-12 00:00:00', '20092|5', NULL),
(337, 'plan_programa', '1', 'I', '2015-02-12 00:00:00', '20092|6', NULL),
(338, 'plan_programa', '1', 'I', '2015-02-12 00:00:00', '20092|7', NULL),
(339, 'plan_programa', '1', 'D', '2015-02-12 00:00:00', NULL, '20092|7'),
(340, 'plan_programa', '1', 'D', '2015-02-12 00:00:00', NULL, '20092|6'),
(341, 'plan_programa', '1', 'D', '2015-02-12 00:00:00', NULL, '20092|5'),
(342, 'plan_programa', '1', 'D', '2015-02-12 00:00:00', NULL, '20092|4'),
(343, 'plan_programa', '1', 'D', '2015-02-12 00:00:00', NULL, '20092|3'),
(344, 'plan_programa', '1', 'D', '2015-02-12 00:00:00', NULL, '20092|2'),
(345, 'plan_programa', '1', 'D', '2015-02-12 00:00:00', NULL, '20092|1'),
(346, 'planestudio', '1', 'D', '2015-02-12 00:00:00', NULL, '20092|Plan 2009-2|300|2015-02-12|2015-10-31|1'),
(347, 'carga', '1', 'I', '2015-02-12 00:00:00', '111|20141|1|11236|1', NULL),
(348, 'carga', '1', 'I', '2015-02-12 00:00:00', '112|20141|1|11236|1', NULL),
(349, 'carga', '1', 'I', '2015-02-12 00:00:00', '113|20141|1|11236|1', NULL),
(350, 'grupos', '1', 'I', '2015-02-12 00:00:00', '114|20141|20091|1|2', NULL),
(351, 'carga', '1', 'D', '2015-02-12 00:00:00', NULL, '111|20141|1|11236|1'),
(352, 'carga', '1', 'D', '2015-02-12 00:00:00', NULL, '112|20141|1|11236|1'),
(353, 'carga', '1', 'D', '2015-02-12 00:00:00', NULL, '113|20141|1|11236|1'),
(354, 'carga', '1', 'I', '2015-02-12 00:00:00', '111|20141|1|11236|1', NULL),
(355, 'carga', '1', 'I', '2015-02-12 00:00:00', '112|20141|1|11236|1', NULL),
(356, 'carga', '1', 'I', '2015-02-12 00:00:00', '113|20141|1|11236|1', NULL),
(357, 'carga', '1', 'I', '2015-02-12 00:00:00', '114|20141|1|11236|1', NULL),
(358, 'carga', '1', 'I', '2015-02-12 00:00:00', '112|20141|1|11237|1', NULL),
(359, 'carga', '1', 'I', '2015-02-12 00:00:00', '113|20141|1|11237|1', NULL),
(360, 'carga', '1', 'I', '2015-02-12 00:00:00', '111|20141|1|11240|1', NULL),
(361, 'carga', '1', 'I', '2015-02-13 00:00:00', '111|20141|1|11236|1', NULL),
(362, 'carga', '1', 'I', '2015-02-13 00:00:00', '112|20141|1|11236|1', NULL),
(363, 'carga', '1', 'I', '2015-02-13 00:00:00', '113|20141|1|11236|1', NULL),
(364, 'carga', '1', 'I', '2015-02-13 00:00:00', '114|20141|1|11236|1', NULL),
(365, 'carga', '1', 'I', '2015-02-13 00:00:00', '112|20141|1|11240|1', NULL),
(374, 'grupos', '1', 'I', '2015-02-13 00:00:00', '111|20142|20091|1|1', NULL),
(375, 'grupos', '1', 'I', '2015-02-13 00:00:00', '112|20142|20091|1|1', NULL),
(376, 'grupos', '1', 'I', '2015-02-13 00:00:00', '113|20142|20091|1|1', NULL),
(377, 'grupos', '1', 'I', '2015-02-13 00:00:00', '114|20142|20091|1|2', NULL),
(378, 'carga', '1', 'I', '2015-02-13 00:00:00', '111|20142|1|11236|1', NULL),
(379, 'carga', '1', 'I', '2015-02-13 00:00:00', '112|20142|1|11236|1', NULL),
(380, 'carga', '1', 'I', '2015-02-13 00:00:00', '112|20142|1|11240|1', NULL),
(381, 'carga', '1', 'I', '2015-02-13 00:00:00', '113|20142|1|11236|1', NULL),
(382, 'carga', '1', 'I', '2015-02-13 00:00:00', '114|20142|1|11236|1', NULL),
(383, 'periodos', '1', 'I', '2015-02-13 00:00:00', '20151|1|2015|1|Uno más|0000-00-00|0000-00-00|1', NULL),
(384, 'grupos', '1', 'I', '2015-02-13 00:00:00', '111|20151|20091|1|1', NULL),
(385, 'grupos', '1', 'I', '2015-02-13 00:00:00', '112|20151|20091|1|1', NULL),
(386, 'grupos', '1', 'I', '2015-02-13 00:00:00', '113|20151|20091|1|1', NULL),
(387, 'grupos', '1', 'I', '2015-02-13 00:00:00', '114|20151|20091|1|2', NULL),
(388, 'carga', '1', 'I', '2015-02-13 00:00:00', '111|20151|1|11236|1', NULL),
(389, 'carga', '1', 'I', '2015-02-13 00:00:00', '112|20151|1|11236|1', NULL),
(390, 'carga', '1', 'I', '2015-02-13 00:00:00', '112|20151|1|11240|1', NULL),
(391, 'carga', '1', 'I', '2015-02-13 00:00:00', '113|20151|1|11236|1', NULL),
(392, 'carga', '1', 'I', '2015-02-13 00:00:00', '114|20151|1|11236|1', NULL),
(393, 'carga', '1', 'D', '2015-02-13 00:00:00', NULL, '114|20151|1|11236|1'),
(394, 'carga', '1', 'D', '2015-02-13 00:00:00', NULL, '113|20151|1|11236|1'),
(395, 'carga', '1', 'D', '2015-02-13 00:00:00', NULL, '112|20151|1|11236|1'),
(396, 'carga', '1', 'D', '2015-02-13 00:00:00', NULL, '112|20151|1|11240|1'),
(397, 'carga', '1', 'D', '2015-02-13 00:00:00', NULL, '111|20151|1|11236|1'),
(398, 'carga', '1', 'D', '2015-02-13 00:00:00', NULL, '114|20142|1|11236|1'),
(399, 'carga', '1', 'D', '2015-02-13 00:00:00', NULL, '113|20142|1|11236|1'),
(400, 'carga', '1', 'D', '2015-02-13 00:00:00', NULL, '112|20142|1|11236|1'),
(401, 'carga', '1', 'D', '2015-02-13 00:00:00', NULL, '112|20142|1|11240|1'),
(402, 'carga', '1', 'D', '2015-02-13 00:00:00', NULL, '111|20142|1|11236|1'),
(403, 'grupos', '1', 'D', '2015-02-13 00:00:00', NULL, '114|20151|20091|1|2'),
(404, 'grupos', '1', 'D', '2015-02-13 00:00:00', NULL, '113|20151|20091|1|1'),
(405, 'grupos', '1', 'D', '2015-02-13 00:00:00', NULL, '111|20151|20091|1|1'),
(406, 'grupos', '1', 'D', '2015-02-13 00:00:00', NULL, '112|20151|20091|1|1'),
(407, 'grupos', '1', 'D', '2015-02-13 00:00:00', NULL, '114|20142|20091|1|2'),
(408, 'grupos', '1', 'D', '2015-02-13 00:00:00', NULL, '111|20142|20091|1|1'),
(409, 'grupos', '1', 'D', '2015-02-13 00:00:00', NULL, '113|20142|20091|1|1'),
(410, 'grupos', '1', 'D', '2015-02-13 00:00:00', NULL, '112|20142|20091|1|1'),
(411, 'periodos', '1', 'D', '2015-02-13 00:00:00', NULL, '20151|1|2015|1|Uno más|0000-00-00|0000-00-00|1'),
(412, 'periodos', '2', 'D', '2015-02-13 00:00:00', NULL, '20142|1|2014|2|Vamos a ver|2015-01-21|2015-07-25|1'),
(413, 'periodos', '1', 'I', '2015-02-13 00:00:00', '20142|1|2014|2|Vamos a ver|2015-02-13|2015-06-30|1', NULL),
(414, 'grupos', '1', 'I', '2015-02-13 00:00:00', '111|20142|20091|1|1', NULL),
(415, 'grupos', '1', 'I', '2015-02-13 00:00:00', '112|20142|20091|1|1', NULL),
(416, 'grupos', '1', 'I', '2015-02-13 00:00:00', '113|20142|20091|1|1', NULL),
(417, 'grupos', '1', 'I', '2015-02-13 00:00:00', '114|20142|20091|1|2', NULL),
(418, 'carga', '1', 'I', '2015-02-13 00:00:00', '111|20142|1|11236|1', NULL),
(419, 'carga', '1', 'I', '2015-02-13 00:00:00', '112|20142|1|11236|1', NULL),
(420, 'carga', '1', 'I', '2015-02-13 00:00:00', '112|20142|1|11240|1', NULL),
(421, 'carga', '1', 'I', '2015-02-13 00:00:00', '113|20142|1|11236|1', NULL),
(422, 'carga', '1', 'I', '2015-02-13 00:00:00', '114|20142|1|11236|1', NULL),
(423, 'carga', '1', 'D', '2015-02-13 00:00:00', NULL, '114|20142|1|11236|1'),
(424, 'carga', '1', 'D', '2015-02-13 00:00:00', NULL, '113|20142|1|11236|1'),
(425, 'carga', '1', 'D', '2015-02-13 00:00:00', NULL, '112|20142|1|11236|1'),
(426, 'carga', '1', 'D', '2015-02-13 00:00:00', NULL, '112|20142|1|11240|1'),
(427, 'carga', '1', 'D', '2015-02-13 00:00:00', NULL, '111|20142|1|11236|1'),
(428, 'grupos', '1', 'D', '2015-02-13 00:00:00', NULL, '114|20142|20091|1|2'),
(429, 'grupos', '1', 'D', '2015-02-13 00:00:00', NULL, '113|20142|20091|1|1'),
(430, 'grupos', '1', 'D', '2015-02-13 00:00:00', NULL, '112|20142|20091|1|1'),
(431, 'grupos', '1', 'D', '2015-02-13 00:00:00', NULL, '111|20142|20091|1|1'),
(432, 'periodos', '1', 'D', '2015-02-13 00:00:00', NULL, '20142|1|2014|2|Vamos a ver|2015-02-13|2015-06-30|1'),
(433, 'periodos', '1', 'I', '2015-02-13 00:00:00', '20142|1|2014|2|vamos|2015-02-13|2015-02-28|1', NULL),
(434, 'grupos', '1', 'I', '2015-02-13 00:00:00', '111|20142|20091|1|1', NULL),
(435, 'grupos', '1', 'I', '2015-02-13 00:00:00', '112|20142|20091|1|1', NULL),
(436, 'grupos', '1', 'I', '2015-02-13 00:00:00', '113|20142|20091|1|1', NULL),
(437, 'grupos', '1', 'I', '2015-02-13 00:00:00', '114|20142|20091|1|2', NULL),
(438, 'carga', '1', 'I', '2015-02-13 00:00:00', '111|20142|1|11236|1', NULL),
(439, 'carga', '1', 'I', '2015-02-13 00:00:00', '112|20142|1|11236|1', NULL),
(440, 'carga', '1', 'I', '2015-02-13 00:00:00', '112|20142|1|11240|1', NULL),
(441, 'carga', '1', 'I', '2015-02-13 00:00:00', '113|20142|1|11236|1', NULL),
(442, 'carga', '1', 'I', '2015-02-13 00:00:00', '114|20142|1|11236|1', NULL),
(443, 'periodos', '1', 'I', '2015-02-13 00:00:00', '20151|1|2015|1|ahhhhh|2015-02-13|2015-02-28|1', NULL),
(444, 'grupos', '1', 'I', '2015-02-13 00:00:00', '111|20151|20091|1|1', NULL),
(445, 'grupos', '1', 'I', '2015-02-13 00:00:00', '112|20151|20091|1|1', NULL),
(446, 'grupos', '1', 'I', '2015-02-13 00:00:00', '113|20151|20091|1|1', NULL),
(447, 'grupos', '1', 'I', '2015-02-13 00:00:00', '114|20151|20091|1|2', NULL),
(448, 'carga', '1', 'I', '2015-02-13 00:00:00', '111|20151|1|11236|1', NULL),
(449, 'carga', '1', 'I', '2015-02-13 00:00:00', '112|20151|1|11236|1', NULL),
(450, 'carga', '1', 'I', '2015-02-13 00:00:00', '112|20151|1|11240|1', NULL),
(451, 'carga', '1', 'I', '2015-02-13 00:00:00', '113|20151|1|11236|1', NULL),
(452, 'carga', '1', 'I', '2015-02-13 00:00:00', '114|20151|1|11236|1', NULL),
(453, 'carga', '1', 'D', '2015-02-13 00:00:00', NULL, '114|20151|1|11236|1'),
(454, 'carga', '1', 'D', '2015-02-13 00:00:00', NULL, '113|20151|1|11236|1'),
(455, 'carga', '1', 'D', '2015-02-13 00:00:00', NULL, '112|20151|1|11236|1'),
(456, 'carga', '1', 'D', '2015-02-13 00:00:00', NULL, '112|20151|1|11240|1'),
(457, 'carga', '1', 'D', '2015-02-13 00:00:00', NULL, '111|20151|1|11236|1'),
(458, 'carga', '1', 'D', '2015-02-13 00:00:00', NULL, '114|20142|1|11236|1'),
(459, 'carga', '1', 'D', '2015-02-13 00:00:00', NULL, '113|20142|1|11236|1'),
(460, 'carga', '1', 'D', '2015-02-13 00:00:00', NULL, '112|20142|1|11236|1'),
(461, 'carga', '1', 'D', '2015-02-13 00:00:00', NULL, '112|20142|1|11240|1'),
(462, 'carga', '1', 'D', '2015-02-13 00:00:00', NULL, '111|20142|1|11236|1'),
(463, 'grupos', '1', 'D', '2015-02-13 00:00:00', NULL, '114|20151|20091|1|2'),
(464, 'grupos', '1', 'D', '2015-02-13 00:00:00', NULL, '113|20151|20091|1|1'),
(465, 'grupos', '1', 'D', '2015-02-13 00:00:00', NULL, '111|20151|20091|1|1'),
(466, 'grupos', '1', 'D', '2015-02-13 00:00:00', NULL, '112|20151|20091|1|1'),
(467, 'grupos', '1', 'D', '2015-02-13 00:00:00', NULL, '114|20142|20091|1|2'),
(468, 'grupos', '1', 'D', '2015-02-13 00:00:00', NULL, '111|20142|20091|1|1'),
(469, 'grupos', '1', 'D', '2015-02-13 00:00:00', NULL, '113|20142|20091|1|1'),
(470, 'grupos', '1', 'D', '2015-02-13 00:00:00', NULL, '112|20142|20091|1|1'),
(471, 'periodos', '1', 'D', '2015-02-13 00:00:00', NULL, '20151|1|2015|1|ahhhhh|2015-02-13|2015-02-28|1'),
(472, 'periodos', '1', 'D', '2015-02-13 00:00:00', NULL, '20142|1|2014|2|vamos|2015-02-13|2015-02-28|1'),
(473, 'periodos', '1', 'I', '2015-02-13 00:00:00', '20142|1|2014|2|vamos|2015-02-13|2015-02-28|1', NULL),
(474, 'grupos', '1', 'I', '2015-02-13 00:00:00', '111|20142|20091|1|1', NULL),
(475, 'grupos', '1', 'I', '2015-02-13 00:00:00', '112|20142|20091|1|1', NULL),
(476, 'grupos', '1', 'I', '2015-02-13 00:00:00', '113|20142|20091|1|1', NULL),
(477, 'grupos', '1', 'I', '2015-02-13 00:00:00', '114|20142|20091|1|2', NULL),
(478, 'carga', '1', 'I', '2015-02-13 00:00:00', '111|20142|1|11236|1', NULL),
(479, 'carga', '1', 'I', '2015-02-13 00:00:00', '112|20142|1|11236|1', NULL),
(480, 'carga', '1', 'I', '2015-02-13 00:00:00', '112|20142|1|11240|1', NULL),
(481, 'carga', '1', 'I', '2015-02-13 00:00:00', '113|20142|1|11236|1', NULL),
(482, 'carga', '1', 'I', '2015-02-13 00:00:00', '114|20142|1|11236|1', NULL),
(483, 'periodos', '1', 'I', '2015-02-13 00:00:00', '20151|1|2015|1|vamos|2015-02-06|2015-02-28|1', NULL),
(484, 'grupos', '1', 'I', '2015-02-13 00:00:00', '111|20151|20091|1|1', NULL),
(485, 'grupos', '1', 'I', '2015-02-13 00:00:00', '112|20151|20091|1|1', NULL),
(486, 'grupos', '1', 'I', '2015-02-13 00:00:00', '113|20151|20091|1|1', NULL),
(487, 'grupos', '1', 'I', '2015-02-13 00:00:00', '114|20151|20091|1|2', NULL),
(488, 'carga', '1', 'I', '2015-02-13 00:00:00', '111|20151|1|11236|1', NULL),
(489, 'carga', '1', 'I', '2015-02-13 00:00:00', '112|20151|1|11236|1', NULL),
(490, 'carga', '1', 'I', '2015-02-13 00:00:00', '112|20151|1|11240|1', NULL),
(491, 'carga', '1', 'I', '2015-02-13 00:00:00', '113|20151|1|11236|1', NULL),
(492, 'carga', '1', 'I', '2015-02-13 00:00:00', '114|20151|1|11236|1', NULL),
(493, 'periodos', '1', 'I', '2015-02-13 00:00:00', '20152|1|2015|2|vamos a ver|2015-02-06|2015-02-28|1', NULL),
(494, 'grupos', '1', 'I', '2015-02-13 00:00:00', '111|20152|20091|1|1', NULL),
(495, 'grupos', '1', 'I', '2015-02-13 00:00:00', '112|20152|20091|1|1', NULL),
(496, 'grupos', '1', 'I', '2015-02-13 00:00:00', '113|20152|20091|1|1', NULL),
(497, 'grupos', '1', 'I', '2015-02-13 00:00:00', '114|20152|20091|1|2', NULL),
(498, 'carga', '1', 'I', '2015-02-13 00:00:00', '111|20152|1|11236|1', NULL),
(499, 'carga', '1', 'I', '2015-02-13 00:00:00', '112|20152|1|11236|1', NULL),
(500, 'carga', '1', 'I', '2015-02-13 00:00:00', '112|20152|1|11240|1', NULL),
(501, 'carga', '1', 'I', '2015-02-13 00:00:00', '113|20152|1|11236|1', NULL),
(502, 'carga', '1', 'I', '2015-02-13 00:00:00', '114|20152|1|11236|1', NULL),
(503, 'periodos', '1', 'I', '2015-02-13 00:00:00', '20153|1|2015|3|vamos|2015-02-13|2015-02-28|1', NULL),
(504, 'grupos', '1', 'I', '2015-02-13 00:00:00', '111|20153|20091|1|1', NULL),
(505, 'grupos', '1', 'I', '2015-02-13 00:00:00', '112|20153|20091|1|1', NULL),
(506, 'grupos', '1', 'I', '2015-02-13 00:00:00', '113|20153|20091|1|1', NULL),
(507, 'grupos', '1', 'I', '2015-02-13 00:00:00', '114|20153|20091|1|2', NULL),
(508, 'carga', '1', 'I', '2015-02-13 00:00:00', '111|20153|1|11236|1', NULL),
(509, 'carga', '1', 'I', '2015-02-13 00:00:00', '112|20153|1|11236|1', NULL),
(510, 'carga', '1', 'I', '2015-02-13 00:00:00', '112|20153|1|11240|1', NULL),
(511, 'carga', '1', 'I', '2015-02-13 00:00:00', '113|20153|1|11236|1', NULL),
(512, 'carga', '1', 'I', '2015-02-13 00:00:00', '114|20153|1|11236|1', NULL),
(513, 'carga', '1', 'D', '2015-02-13 00:00:00', NULL, '114|20153|1|11236|1'),
(514, 'carga', '1', 'D', '2015-02-13 00:00:00', NULL, '113|20153|1|11236|1'),
(515, 'carga', '1', 'D', '2015-02-13 00:00:00', NULL, '112|20153|1|11236|1'),
(516, 'carga', '1', 'D', '2015-02-13 00:00:00', NULL, '112|20153|1|11240|1'),
(517, 'carga', '1', 'D', '2015-02-13 00:00:00', NULL, '111|20153|1|11236|1'),
(518, 'carga', '1', 'D', '2015-02-13 00:00:00', NULL, '114|20152|1|11236|1'),
(519, 'carga', '1', 'D', '2015-02-13 00:00:00', NULL, '113|20152|1|11236|1'),
(520, 'carga', '1', 'D', '2015-02-13 00:00:00', NULL, '112|20152|1|11236|1'),
(521, 'carga', '1', 'D', '2015-02-13 00:00:00', NULL, '112|20152|1|11240|1'),
(522, 'carga', '1', 'D', '2015-02-13 00:00:00', NULL, '111|20152|1|11236|1'),
(523, 'carga', '1', 'D', '2015-02-13 00:00:00', NULL, '114|20151|1|11236|1'),
(524, 'carga', '1', 'D', '2015-02-13 00:00:00', NULL, '113|20151|1|11236|1'),
(525, 'carga', '1', 'D', '2015-02-13 00:00:00', NULL, '112|20151|1|11236|1'),
(526, 'carga', '1', 'D', '2015-02-13 00:00:00', NULL, '112|20151|1|11240|1'),
(527, 'carga', '1', 'D', '2015-02-13 00:00:00', NULL, '111|20151|1|11236|1'),
(528, 'carga', '1', 'D', '2015-02-13 00:00:00', NULL, '114|20142|1|11236|1'),
(529, 'carga', '1', 'D', '2015-02-13 00:00:00', NULL, '113|20142|1|11236|1'),
(530, 'carga', '1', 'D', '2015-02-13 00:00:00', NULL, '112|20142|1|11236|1'),
(531, 'carga', '1', 'D', '2015-02-13 00:00:00', NULL, '112|20142|1|11240|1'),
(532, 'carga', '1', 'D', '2015-02-13 00:00:00', NULL, '111|20142|1|11236|1'),
(533, 'grupos', '1', 'D', '2015-02-13 00:00:00', NULL, '114|20153|20091|1|2'),
(534, 'grupos', '1', 'D', '2015-02-13 00:00:00', NULL, '112|20153|20091|1|1'),
(535, 'grupos', '1', 'D', '2015-02-13 00:00:00', NULL, '111|20153|20091|1|1'),
(536, 'grupos', '1', 'D', '2015-02-13 00:00:00', NULL, '113|20153|20091|1|1'),
(537, 'grupos', '1', 'D', '2015-02-13 00:00:00', NULL, '111|20152|20091|1|1'),
(538, 'grupos', '1', 'D', '2015-02-13 00:00:00', NULL, '113|20152|20091|1|1'),
(539, 'grupos', '1', 'D', '2015-02-13 00:00:00', NULL, '112|20152|20091|1|1'),
(540, 'grupos', '1', 'D', '2015-02-13 00:00:00', NULL, '114|20152|20091|1|2'),
(541, 'grupos', '1', 'D', '2015-02-13 00:00:00', NULL, '113|20151|20091|1|1'),
(542, 'grupos', '1', 'D', '2015-02-13 00:00:00', NULL, '112|20151|20091|1|1'),
(543, 'grupos', '1', 'D', '2015-02-13 00:00:00', NULL, '111|20151|20091|1|1'),
(544, 'grupos', '1', 'D', '2015-02-13 00:00:00', NULL, '114|20151|20091|1|2'),
(545, 'grupos', '1', 'D', '2015-02-13 00:00:00', NULL, '113|20142|20091|1|1'),
(546, 'grupos', '1', 'D', '2015-02-13 00:00:00', NULL, '112|20142|20091|1|1'),
(547, 'grupos', '1', 'D', '2015-02-13 00:00:00', NULL, '114|20142|20091|1|2'),
(548, 'grupos', '1', 'D', '2015-02-13 00:00:00', NULL, '111|20142|20091|1|1'),
(549, 'periodos', '1', 'D', '2015-02-13 00:00:00', NULL, '20153|1|2015|3|vamos|2015-02-13|2015-02-28|1'),
(550, 'periodos', '1', 'D', '2015-02-13 00:00:00', NULL, '20152|1|2015|2|vamos a ver|2015-02-06|2015-02-28|1'),
(551, 'periodos', '1', 'D', '2015-02-13 00:00:00', NULL, '20151|1|2015|1|vamos|2015-02-06|2015-02-28|1'),
(552, 'periodos', '1', 'D', '2015-02-13 00:00:00', NULL, '20142|1|2014|2|vamos|2015-02-13|2015-02-28|1'),
(553, 'periodos', '1', 'I', '2015-02-13 00:00:00', '20142|1|2014|2|vamos a ver|2015-02-06|2015-02-28|1', NULL),
(554, 'grupos', '1', 'I', '2015-02-13 00:00:00', '111|20142|20091|1|1', NULL),
(555, 'grupos', '1', 'I', '2015-02-13 00:00:00', '112|20142|20091|1|1', NULL),
(556, 'grupos', '1', 'I', '2015-02-13 00:00:00', '113|20142|20091|1|1', NULL),
(557, 'grupos', '1', 'I', '2015-02-13 00:00:00', '114|20142|20091|1|2', NULL),
(558, 'carga', '1', 'I', '2015-02-13 00:00:00', '111|20142|1|11236|1', NULL),
(559, 'carga', '1', 'I', '2015-02-13 00:00:00', '112|20142|1|11236|1', NULL),
(560, 'carga', '1', 'I', '2015-02-13 00:00:00', '112|20142|1|11240|1', NULL),
(561, 'carga', '1', 'I', '2015-02-13 00:00:00', '113|20142|1|11236|1', NULL),
(562, 'carga', '1', 'I', '2015-02-13 00:00:00', '114|20142|1|11236|1', NULL),
(563, 'periodos', '1', 'I', '2015-02-13 00:00:00', '20143|1|2014|3|vamos a ver|2015-02-06|2015-02-28|1', NULL),
(564, 'grupos', '1', 'I', '2015-02-13 00:00:00', '111|20143|20091|1|1', NULL),
(565, 'grupos', '1', 'I', '2015-02-13 00:00:00', '112|20143|20091|1|1', NULL),
(566, 'grupos', '1', 'I', '2015-02-13 00:00:00', '113|20143|20091|1|1', NULL),
(567, 'grupos', '1', 'I', '2015-02-13 00:00:00', '114|20143|20091|1|2', NULL),
(568, 'carga', '1', 'I', '2015-02-13 00:00:00', '111|20143|1|11236|1', NULL),
(569, 'carga', '1', 'I', '2015-02-13 00:00:00', '112|20143|1|11236|1', NULL),
(570, 'carga', '1', 'I', '2015-02-13 00:00:00', '112|20143|1|11240|1', NULL),
(571, 'carga', '1', 'I', '2015-02-13 00:00:00', '113|20143|1|11236|1', NULL),
(572, 'carga', '1', 'I', '2015-02-13 00:00:00', '114|20143|1|11236|1', NULL),
(573, 'carga', '1', 'D', '2015-02-13 00:00:00', NULL, '114|20143|1|11236|1'),
(574, 'carga', '1', 'D', '2015-02-13 00:00:00', NULL, '113|20143|1|11236|1'),
(575, 'carga', '1', 'D', '2015-02-13 00:00:00', NULL, '112|20143|1|11236|1'),
(576, 'carga', '1', 'D', '2015-02-13 00:00:00', NULL, '112|20143|1|11240|1'),
(577, 'carga', '1', 'D', '2015-02-13 00:00:00', NULL, '111|20143|1|11236|1'),
(578, 'carga', '1', 'D', '2015-02-13 00:00:00', NULL, '114|20142|1|11236|1'),
(579, 'carga', '1', 'D', '2015-02-13 00:00:00', NULL, '113|20142|1|11236|1'),
(580, 'carga', '1', 'D', '2015-02-13 00:00:00', NULL, '112|20142|1|11236|1'),
(581, 'carga', '1', 'D', '2015-02-13 00:00:00', NULL, '112|20142|1|11240|1'),
(582, 'carga', '1', 'D', '2015-02-13 00:00:00', NULL, '111|20142|1|11236|1'),
(583, 'grupos', '1', 'D', '2015-02-13 00:00:00', NULL, '114|20143|20091|1|2'),
(584, 'grupos', '1', 'D', '2015-02-13 00:00:00', NULL, '113|20143|20091|1|1'),
(585, 'grupos', '1', 'D', '2015-02-13 00:00:00', NULL, '111|20143|20091|1|1'),
(586, 'grupos', '1', 'D', '2015-02-13 00:00:00', NULL, '112|20143|20091|1|1'),
(587, 'grupos', '1', 'D', '2015-02-13 00:00:00', NULL, '114|20142|20091|1|2'),
(588, 'grupos', '1', 'D', '2015-02-13 00:00:00', NULL, '111|20142|20091|1|1'),
(589, 'grupos', '1', 'D', '2015-02-13 00:00:00', NULL, '113|20142|20091|1|1'),
(590, 'grupos', '1', 'D', '2015-02-13 00:00:00', NULL, '112|20142|20091|1|1'),
(591, 'periodos', '1', 'D', '2015-02-13 00:00:00', NULL, '20143|1|2014|3|vamos a ver|2015-02-06|2015-02-28|1'),
(592, 'periodos', '1', 'D', '2015-02-13 00:00:00', NULL, '20142|1|2014|2|vamos a ver|2015-02-06|2015-02-28|1'),
(593, 'uaprendizaje', '1', 'I', '2015-02-13 00:00:00', '11241|MATEMATICAS III|5|5|0|0|0|0|15|2015-02-14|vamos a ver|1|20091', NULL),
(594, 'p_ua', '1', 'I', '2015-02-13 00:00:00', '1|11241|1|1|4', NULL),
(595, 'detalleseriacion', '1', 'I', '2015-02-13 00:00:00', '11241|1|11237|1', NULL),
(596, 'p_ua', '1', 'I', '2015-02-13 00:00:00', '2|11241|1|1|4', NULL),
(597, 'detalleseriacion', '1', 'I', '2015-02-13 00:00:00', '11241|2|11237|1', NULL),
(598, 'p_ua', '1', 'I', '2015-02-13 00:00:00', '3|11241|1|1|4', NULL),
(599, 'detalleseriacion', '1', 'I', '2015-02-13 00:00:00', '11241|3|11237|1', NULL),
(600, 'p_ua', '1', 'I', '2015-02-13 00:00:00', '4|11241|1|1|4', NULL),
(601, 'detalleseriacion', '1', 'I', '2015-02-13 00:00:00', '11241|4|11237|1', NULL),
(602, 'p_ua', '1', 'I', '2015-02-13 00:00:00', '5|11241|1|1|4', NULL),
(603, 'detalleseriacion', '1', 'I', '2015-02-13 00:00:00', '11241|5|11237|1', NULL),
(604, 'p_ua', '1', 'I', '2015-02-13 00:00:00', '6|11241|1|1|4', NULL),
(605, 'detalleseriacion', '1', 'I', '2015-02-13 00:00:00', '11241|6|11237|1', NULL),
(606, 'p_ua', '1', 'I', '2015-02-13 00:00:00', '7|11241|1|1|4', NULL),
(607, 'detalleseriacion', '1', 'I', '2015-02-13 00:00:00', '11241|7|11237|1', NULL),
(608, 'detalleseriacion', '1', 'D', '2015-02-13 00:00:00', NULL, '11241|6|11237|1'),
(609, 'p_ua', '1', 'D', '2015-02-13 00:00:00', NULL, '6|11241|1|1|4'),
(610, 'carga', '1', 'I', '2015-02-13 00:00:00', '111|20141|1|11241|1', NULL),
(611, 'carga', '1', 'I', '2015-02-13 00:00:00', '112|20141|1|11241|1', NULL),
(612, 'carga', '1', 'I', '2015-02-13 00:00:00', '113|20141|1|11241|1', NULL),
(613, 'carga', '1', 'I', '2015-02-13 00:00:00', '114|20141|1|11241|1', NULL),
(614, 'carga', '1', 'D', '2015-02-13 00:00:00', NULL, '111|20141|1|11241|1'),
(615, 'carga', '1', 'D', '2015-02-13 00:00:00', NULL, '112|20141|1|11241|1'),
(616, 'carga', '1', 'D', '2015-02-13 00:00:00', NULL, '113|20141|1|11241|1'),
(617, 'carga', '1', 'D', '2015-02-13 00:00:00', NULL, '114|20141|1|11241|1'),
(618, 'carga', '1', 'I', '2015-02-13 00:00:00', '111|20141|1|11241|1', NULL),
(619, 'carga', '1', 'I', '2015-02-13 00:00:00', '112|20141|1|11241|1', NULL),
(620, 'periodos', '1', 'I', '2015-02-19 00:00:00', '20142|1|2014|2|Vamos a ver|2015-02-19|2015-02-28|1', NULL),
(621, 'grupos', '1', 'I', '2015-02-19 00:00:00', '111|20142|20091|1|1', NULL),
(622, 'grupos', '1', 'I', '2015-02-19 00:00:00', '112|20142|20091|1|1', NULL),
(623, 'grupos', '1', 'I', '2015-02-19 00:00:00', '113|20142|20091|1|1', NULL),
(624, 'grupos', '1', 'I', '2015-02-19 00:00:00', '114|20142|20091|1|2', NULL),
(625, 'carga', '1', 'I', '2015-02-19 00:00:00', '111|20142|1|11236|1', NULL),
(626, 'carga', '1', 'I', '2015-02-19 00:00:00', '111|20142|1|11241|1', NULL),
(627, 'carga', '1', 'I', '2015-02-19 00:00:00', '112|20142|1|11236|1', NULL),
(628, 'carga', '1', 'I', '2015-02-19 00:00:00', '112|20142|1|11240|1', NULL),
(629, 'carga', '1', 'I', '2015-02-19 00:00:00', '112|20142|1|11241|1', NULL),
(630, 'carga', '1', 'I', '2015-02-19 00:00:00', '113|20142|1|11236|1', NULL),
(631, 'carga', '1', 'I', '2015-02-19 00:00:00', '114|20142|1|11236|1', NULL),
(632, 'carga', '1', 'I', '2015-02-19 00:00:00', '112|20141|1|11237|1', NULL),
(633, 'carga', '1', 'I', '2015-02-19 00:00:00', '114|20141|1|11237|1', NULL),
(634, 'carga', '1', 'I', '2015-02-19 00:00:00', '113|20141|1|11237|1', NULL),
(635, 'uaprendizaje', '1', 'I', '2015-02-19 00:00:00', '11242|CIVISMO SEMESTRE 2|4|4|4|0|0|0|16|2015-02-20|vamnos a ver|1|20091', NULL),
(636, 'p_ua', '1', 'I', '2015-02-19 00:00:00', '1|11242|1|1|1', NULL),
(637, 'grupos', '1', 'I', '2015-02-19 00:00:00', '121|20141|20091|1|3', NULL),
(638, 'carga', '1', 'I', '2015-02-19 00:00:00', '121|20141|1|11242|2', NULL),
(639, 'carga', '1', 'D', '2015-02-19 00:00:00', NULL, '111|20141|1|11241|1'),
(640, 'carga', '1', 'D', '2015-02-19 00:00:00', NULL, '112|20141|1|11241|1'),
(641, 'carga', '1', 'I', '2015-02-19 00:00:00', '111|20141|1|11241|1', NULL),
(642, 'carga', '1', 'I', '2015-02-19 00:00:00', '112|20141|1|11241|1', NULL),
(643, 'carga', '1', 'I', '2015-02-19 00:00:00', '113|20141|1|11241|1', NULL),
(644, 'carga', '1', 'D', '2015-02-19 00:00:00', NULL, '112|20141|1|11240|1'),
(645, 'carga', '1', 'I', '2015-02-19 00:00:00', '111|20141|1|11240|1', NULL),
(646, 'carga', '1', 'I', '2015-02-19 00:00:00', '113|20141|1|11240|1', NULL),
(647, 'carga', '1', 'D', '2015-02-19 00:00:00', NULL, '112|20142|1|11240|1');
INSERT INTO `bitacora` (`id`, `tabla`, `usuario`, `operacion`, `fecha`, `registro`, `registro_old`) VALUES
(648, 'carga', '1', 'I', '2015-02-19 00:00:00', '112|20142|1|11240|1', NULL),
(649, 'carga', '1', 'I', '2015-02-19 00:00:00', '113|20142|1|11240|1', NULL),
(650, 'carga', '1', 'I', '2015-02-19 00:00:00', '114|20142|1|11240|1', NULL),
(651, 'periodos', '1', 'I', '2015-02-19 00:00:00', '20143|1|2014|3|Vamos ver|2015-02-19|2015-06-30|1', NULL),
(652, 'grupos', '1', 'I', '2015-02-19 00:00:00', '111|20143|20091|1|1', NULL),
(653, 'grupos', '1', 'I', '2015-02-19 00:00:00', '112|20143|20091|1|1', NULL),
(654, 'grupos', '1', 'I', '2015-02-19 00:00:00', '113|20143|20091|1|1', NULL),
(655, 'grupos', '1', 'I', '2015-02-19 00:00:00', '114|20143|20091|1|2', NULL),
(656, 'carga', '1', 'I', '2015-02-19 00:00:00', '111|20143|1|11236|1', NULL),
(657, 'carga', '1', 'I', '2015-02-19 00:00:00', '111|20143|1|11241|1', NULL),
(658, 'carga', '1', 'I', '2015-02-19 00:00:00', '112|20143|1|11236|1', NULL),
(659, 'carga', '1', 'I', '2015-02-19 00:00:00', '112|20143|1|11240|1', NULL),
(660, 'carga', '1', 'I', '2015-02-19 00:00:00', '112|20143|1|11241|1', NULL),
(661, 'carga', '1', 'I', '2015-02-19 00:00:00', '113|20143|1|11236|1', NULL),
(662, 'carga', '1', 'I', '2015-02-19 00:00:00', '113|20143|1|11240|1', NULL),
(663, 'carga', '1', 'I', '2015-02-19 00:00:00', '114|20143|1|11236|1', NULL),
(664, 'carga', '1', 'I', '2015-02-19 00:00:00', '114|20143|1|11240|1', NULL),
(665, 'grupos', '1', 'I', '2015-02-25 00:00:00', '611|20141|20091|6|1', NULL),
(666, 'grupos', '1', 'I', '2015-02-25 00:00:00', '612|20141|20091|6|2', NULL),
(667, 'carga', '1', 'I', '2015-02-25 00:00:00', '611|20141|6|11238|1', NULL),
(668, 'carga', '1', 'I', '2015-02-25 00:00:00', '611|20141|6|11239|1', NULL),
(669, 'carga', '1', 'I', '2015-02-25 00:00:00', '612|20141|6|11238|1', NULL),
(670, 'carga', '1', 'I', '2015-02-25 00:00:00', '612|20141|6|11239|1', NULL),
(671, 'grupos', '1', 'I', '2015-02-25 00:00:00', '131|20141|20091|1|2', NULL),
(672, 'grupos', '1', 'I', '2015-02-25 00:00:00', '132|20141|20091|1|2', NULL),
(673, 'carga', '1', 'I', '2015-02-25 00:00:00', '131|20141|1|11236|3', NULL),
(674, 'carga', '1', 'I', '2015-02-25 00:00:00', '131|20141|1|11237|3', NULL),
(675, 'carga', '1', 'I', '2015-02-25 00:00:00', '132|20141|1|11236|3', NULL),
(676, 'carga', '1', 'I', '2015-02-25 00:00:00', '132|20141|1|11237|3', NULL),
(677, 'carga', '1', 'I', '2015-03-14 00:00:00', '111|20143|1|11236|1', NULL),
(678, 'carga', '1', 'I', '2015-03-14 00:00:00', '111|20143|1|11237|1', NULL),
(679, 'carga', '1', 'I', '2015-03-14 00:00:00', '111|20143|1|11241|1', NULL),
(680, 'carga', '1', 'I', '2015-03-14 00:00:00', '112|20143|1|11236|1', NULL),
(681, 'carga', '1', 'I', '2015-03-14 00:00:00', '112|20143|1|11237|1', NULL),
(682, 'carga', '1', 'I', '2015-03-14 00:00:00', '112|20143|1|11241|1', NULL),
(683, 'carga', '1', 'I', '2015-03-14 00:00:00', '113|20143|1|11236|1', NULL),
(684, 'carga', '1', 'I', '2015-03-14 00:00:00', '113|20143|1|11237|1', NULL),
(685, 'carga', '1', 'I', '2015-03-14 00:00:00', '113|20143|1|11241|1', NULL),
(686, 'carga', '1', 'I', '2015-03-14 00:00:00', '114|20143|1|11236|1', NULL),
(687, 'carga', '1', 'I', '2015-03-14 00:00:00', '114|20143|1|11237|1', NULL),
(688, 'carga', '1', 'I', '2015-03-14 00:00:00', '114|20143|1|11241|1', NULL),
(689, 'carga', '1', 'I', '2015-03-14 00:00:00', '111|20143|1|11240|1', NULL),
(690, 'carga', '1', 'I', '2015-03-14 00:00:00', '113|20143|1|11240|1', NULL),
(691, 'grupos', '1', 'I', '2015-03-14 00:00:00', '122|20143|20091|1|3', NULL),
(692, 'carga', '1', 'I', '2015-03-14 00:00:00', '122|20143|1|11242|2', NULL),
(693, 'uaprendizaje', '1', 'I', '2015-03-14 00:00:00', '11243|CIVISMO 3|5|2|2|0|0|0|14|2015-03-15|vamos a ver|1|20091', NULL),
(694, 'p_ua', '1', 'I', '2015-03-14 00:00:00', '1|11243|2|2|3', NULL),
(695, 'grupos', '1', 'I', '2015-03-14 00:00:00', '134|20143|20091|1|2', NULL),
(696, 'carga', '1', 'I', '2015-03-14 00:00:00', '134|20143|1|11243|3', NULL),
(697, 'periodos', '1', 'I', '2015-03-14 00:00:00', '20144|1|2014|4|vamos a ver el periodo|2015-03-14|2015-07-31|1', NULL),
(698, 'grupos', '1', 'I', '2015-03-14 00:00:00', '111|20144|20091|1|1', NULL),
(699, 'grupos', '1', 'I', '2015-03-14 00:00:00', '112|20144|20091|1|1', NULL),
(700, 'grupos', '1', 'I', '2015-03-14 00:00:00', '113|20144|20091|1|1', NULL),
(701, 'grupos', '1', 'I', '2015-03-14 00:00:00', '114|20144|20091|1|2', NULL),
(702, 'grupos', '1', 'I', '2015-03-14 00:00:00', '122|20144|20091|1|3', NULL),
(703, 'grupos', '1', 'I', '2015-03-14 00:00:00', '134|20144|20091|1|2', NULL),
(704, 'carga', '1', 'I', '2015-03-14 00:00:00', '111|20144|1|11236|1', NULL),
(705, 'carga', '1', 'I', '2015-03-14 00:00:00', '111|20144|1|11237|1', NULL),
(706, 'carga', '1', 'I', '2015-03-14 00:00:00', '111|20144|1|11240|1', NULL),
(707, 'carga', '1', 'I', '2015-03-14 00:00:00', '111|20144|1|11241|1', NULL),
(708, 'carga', '1', 'I', '2015-03-14 00:00:00', '112|20144|1|11236|1', NULL),
(709, 'carga', '1', 'I', '2015-03-14 00:00:00', '112|20144|1|11237|1', NULL),
(710, 'carga', '1', 'I', '2015-03-14 00:00:00', '112|20144|1|11241|1', NULL),
(711, 'carga', '1', 'I', '2015-03-14 00:00:00', '113|20144|1|11241|1', NULL),
(712, 'carga', '1', 'I', '2015-03-14 00:00:00', '113|20144|1|11240|1', NULL),
(713, 'carga', '1', 'I', '2015-03-14 00:00:00', '113|20144|1|11237|1', NULL),
(714, 'carga', '1', 'I', '2015-03-14 00:00:00', '113|20144|1|11236|1', NULL),
(715, 'carga', '1', 'I', '2015-03-14 00:00:00', '114|20144|1|11236|1', NULL),
(716, 'carga', '1', 'I', '2015-03-14 00:00:00', '114|20144|1|11237|1', NULL),
(717, 'carga', '1', 'I', '2015-03-14 00:00:00', '114|20144|1|11241|1', NULL),
(718, 'carga', '1', 'I', '2015-03-14 00:00:00', '122|20144|1|11242|2', NULL),
(719, 'carga', '1', 'I', '2015-03-14 00:00:00', '134|20144|1|11243|3', NULL),
(720, 'uaprendizaje', '1', 'I', '2015-03-14 00:00:00', '11244|MATERIA 4|5|6|0|0|0|0|16|2015-03-15|vamos a ver|2|20091', NULL),
(721, 'p_ua', '1', 'I', '2015-03-14 00:00:00', '1|11244|2|1|1', NULL),
(722, 'uaprendizaje', '1', 'I', '2015-03-14 00:00:00', '11245|MATERIA 5|6|2|0|0|0|1|15|2015-03-15|esto que es|1|20091', NULL),
(723, 'p_ua', '1', 'I', '2015-03-14 00:00:00', '1|11245|1|1|1', NULL),
(724, 'uaprendizaje', '1', 'I', '2015-03-14 00:00:00', '11246|MATERIA 6|3|2|0|0|0|0|8|2015-03-15|vamos a ver|1|20091', NULL),
(725, 'p_ua', '1', 'I', '2015-03-14 00:00:00', '1|11246|3|1|1', NULL),
(726, 'uaprendizaje', '1', 'I', '2015-03-14 00:00:00', '11247|MATERIA 7|4|2|0|0|0|0|10|2015-03-15|vamos a ver|1|20091', NULL),
(727, 'p_ua', '1', 'I', '2015-03-14 00:00:00', '1|11247|1|1|1', NULL),
(728, 'uaprendizaje', '1', 'I', '2015-03-14 00:00:00', '11248|MATERIA 8|3|0|0|0|0|0|6|2015-03-15|que es esto|2|20091', NULL),
(729, 'p_ua', '1', 'I', '2015-03-14 00:00:00', '1|11248|1|1|1', NULL),
(730, 'uaprendizaje', '1', 'U', '2015-03-14 00:00:00', '11243|CIVISMO 3|5|2|2|0|0|0|14|2015-03-15|1|20091', '11243|CIVISMO 3|5|2|2|0|0|0|14|2015-03-15|vamos a ver|1|20091'),
(731, 'p_ua', '1', 'U', '2015-03-14 00:00:00', '1|11243|2|1|3', '1|11243|2|2|3'),
(732, 'grupos', '1', 'D', '2015-03-14 00:00:00', NULL, '612|20141|20091|6|2'),
(733, 'grupos', '1', 'D', '2015-03-14 00:00:00', NULL, '611|20141|20091|6|1'),
(734, 'grupos', '1', 'D', '2015-03-14 00:00:00', NULL, '134|20144|20091|1|2'),
(735, 'grupos', '1', 'D', '2015-03-14 00:00:00', NULL, '134|20143|20091|1|2'),
(736, 'grupos', '1', 'D', '2015-03-14 00:00:00', NULL, '132|20141|20091|1|2'),
(737, 'grupos', '1', 'D', '2015-03-14 00:00:00', NULL, '131|20141|20091|1|2'),
(738, 'grupos', '1', 'D', '2015-03-14 00:00:00', NULL, '122|20144|20091|1|3'),
(739, 'grupos', '1', 'D', '2015-03-14 00:00:00', NULL, '122|20143|20091|1|3'),
(740, 'grupos', '1', 'D', '2015-03-14 00:00:00', NULL, '121|20141|20091|1|3'),
(741, 'grupos', '1', 'D', '2015-03-14 00:00:00', NULL, '114|20144|20091|1|2'),
(742, 'grupos', '1', 'D', '2015-03-14 00:00:00', NULL, '114|20143|20091|1|2'),
(743, 'grupos', '1', 'D', '2015-03-14 00:00:00', NULL, '114|20142|20091|1|2'),
(744, 'grupos', '1', 'D', '2015-03-14 00:00:00', NULL, '114|20141|20091|1|2'),
(745, 'grupos', '1', 'D', '2015-03-14 00:00:00', NULL, '113|20144|20091|1|1'),
(746, 'grupos', '1', 'D', '2015-03-14 00:00:00', NULL, '113|20143|20091|1|1'),
(747, 'grupos', '1', 'D', '2015-03-14 00:00:00', NULL, '113|20142|20091|1|1'),
(748, 'grupos', '1', 'D', '2015-03-14 00:00:00', NULL, '113|20141|20091|1|1'),
(749, 'grupos', '1', 'D', '2015-03-14 00:00:00', NULL, '112|20144|20091|1|1'),
(750, 'grupos', '1', 'D', '2015-03-14 00:00:00', NULL, '112|20143|20091|1|1'),
(751, 'grupos', '1', 'D', '2015-03-14 00:00:00', NULL, '112|20142|20091|1|1'),
(752, 'grupos', '1', 'D', '2015-03-14 00:00:00', NULL, '112|20141|20091|1|1'),
(753, 'grupos', '1', 'D', '2015-03-14 00:00:00', NULL, '111|20144|20091|1|1'),
(754, 'grupos', '1', 'D', '2015-03-14 00:00:00', NULL, '111|20143|20091|1|1'),
(755, 'grupos', '1', 'D', '2015-03-14 00:00:00', NULL, '111|20142|20091|1|1'),
(756, 'grupos', '1', 'D', '2015-03-14 00:00:00', NULL, '111|20141|20091|1|1'),
(757, 'periodos', '1', 'D', '2015-03-14 00:00:00', NULL, '20144|1|2014|4|vamos a ver el periodo|2015-03-14|2015-07-31|1'),
(758, 'periodos', '1', 'D', '2015-03-14 00:00:00', NULL, '20143|1|2014|3|Vamos ver|2015-02-19|2015-06-30|1'),
(759, 'periodos', '1', 'D', '2015-03-14 00:00:00', NULL, '20142|1|2014|2|Vamos a ver|2015-02-19|2015-02-28|1'),
(760, 'periodos', '2', 'D', '2015-03-14 00:00:00', NULL, '20141|1|2014|1|Un período registrado|2015-01-21|2015-10-31|1'),
(761, 'periodos', '1', 'I', '2015-03-15 00:00:00', '20141|1|2014|1|VAMOS A VER|2015-03-01|2015-03-31|1', NULL),
(762, 'periodos', '1', 'I', '2015-03-15 00:00:00', '20142|1|2014|2|vamos a ver|2015-03-01|2015-03-31|1', NULL),
(763, 'periodos', '1', 'D', '2015-03-15 00:00:00', NULL, '20142|1|2014|2|vamos a ver|2015-03-01|2015-03-31|1'),
(764, 'periodos', '1', 'D', '2015-03-15 00:00:00', NULL, '20141|1|2014|1|VAMOS A VER|2015-03-01|2015-03-31|1'),
(765, 'periodos', '1', 'I', '2015-03-15 00:00:00', '20141|1|2014|1|vamos a ver|2015-03-01|2015-03-31|1', NULL),
(766, 'grupos', '1', 'I', '2015-03-15 00:00:00', '111|20141|20091|1|1', NULL),
(767, 'grupos', '1', 'I', '2015-03-15 00:00:00', '112|20141|20091|1|2', NULL),
(768, 'carga', '1', 'I', '2015-03-15 00:00:00', '111|20141|1|11236|1', NULL),
(769, 'carga', '1', 'I', '2015-03-15 00:00:00', '112|20141|1|11236|1', NULL),
(770, 'grupos', '1', 'I', '2015-03-15 00:00:00', '121|20141|20091|1|3', NULL),
(771, 'carga', '1', 'I', '2015-03-15 00:00:00', '121|20141|1|11237|2', NULL),
(772, 'grupos', '1', 'I', '2015-03-15 00:00:00', '131|20141|20091|1|2', NULL),
(773, 'carga', '1', 'I', '2015-03-15 00:00:00', '131|20141|1|11241|3', NULL),
(774, 'grupos', '1', 'I', '2015-03-15 00:00:00', '141|20141|20091|1|2', NULL),
(775, 'carga', '1', 'I', '2015-03-15 00:00:00', '141|20141|1|11244|4', NULL),
(776, 'grupos', '1', 'I', '2015-03-15 00:00:00', '142|20141|20091|1|2', NULL),
(777, 'carga', '1', 'D', '2015-03-15 00:00:00', NULL, '141|20141|1|11244|4'),
(778, 'carga', '1', 'I', '2015-03-15 00:00:00', '141|20141|1|11244|4', NULL),
(779, 'carga', '1', 'I', '2015-03-15 00:00:00', '142|20141|1|11244|4', NULL),
(780, 'grupos', '1', 'I', '2015-03-15 00:00:00', '143|20141|20091|1|1', NULL),
(781, 'carga', '1', 'D', '2015-03-15 00:00:00', NULL, '141|20141|1|11244|4'),
(782, 'carga', '1', 'D', '2015-03-15 00:00:00', NULL, '142|20141|1|11244|4'),
(783, 'carga', '1', 'I', '2015-03-15 00:00:00', '141|20141|1|11244|4', NULL),
(784, 'carga', '1', 'I', '2015-03-15 00:00:00', '142|20141|1|11244|4', NULL),
(785, 'carga', '1', 'I', '2015-03-15 00:00:00', '143|20141|1|11244|4', NULL),
(786, 'grupos', '1', 'I', '2015-03-15 00:00:00', '151|20141|20091|1|1', NULL),
(787, 'carga', '1', 'I', '2015-03-15 00:00:00', '151|20141|1|11245|5', NULL),
(788, 'grupos', '1', 'I', '2015-03-15 00:00:00', '161|20141|20091|1|1', NULL),
(789, 'carga', '1', 'I', '2015-03-15 00:00:00', '161|20141|1|11246|6', NULL),
(790, 'carga', '1', 'D', '2015-03-15 00:00:00', NULL, '161|20141|1|11246|6'),
(791, 'carga', '1', 'I', '2015-03-15 00:00:00', '161|20141|1|11246|6', NULL),
(792, 'grupos', '1', 'I', '2015-03-15 00:00:00', '171|20141|20091|1|1', NULL),
(793, 'grupos', '1', 'I', '2015-03-15 00:00:00', '172|20141|20091|1|1', NULL),
(794, 'carga', '1', 'I', '2015-03-15 00:00:00', '171|20141|1|11247|7', NULL),
(795, 'carga', '1', 'I', '2015-03-15 00:00:00', '172|20141|1|11247|7', NULL),
(796, 'grupos', '1', 'I', '2015-03-15 00:00:00', '181|20141|20091|1|1', NULL),
(797, 'carga', '1', 'I', '2015-03-15 00:00:00', '181|20141|1|11248|8', NULL),
(798, 'grupos', '1', 'I', '2015-03-15 00:00:00', '191|20141|20091|1|1', NULL),
(799, 'carga', '1', 'I', '2015-03-15 00:00:00', '191|20141|1|11242|9', NULL),
(800, 'periodos', '1', 'I', '2015-03-15 00:00:00', '20142|1|2014|2|vamos a ver|2015-03-01|2015-03-31|1', NULL),
(801, 'grupos', '1', 'I', '2015-03-15 00:00:00', '111|20142|20091|1|1', NULL),
(802, 'grupos', '1', 'I', '2015-03-15 00:00:00', '112|20142|20091|1|2', NULL),
(803, 'grupos', '1', 'I', '2015-03-15 00:00:00', '121|20142|20091|1|3', NULL),
(804, 'grupos', '1', 'I', '2015-03-15 00:00:00', '131|20142|20091|1|2', NULL),
(805, 'grupos', '1', 'I', '2015-03-15 00:00:00', '141|20142|20091|1|2', NULL),
(806, 'grupos', '1', 'I', '2015-03-15 00:00:00', '142|20142|20091|1|2', NULL),
(807, 'grupos', '1', 'I', '2015-03-15 00:00:00', '143|20142|20091|1|1', NULL),
(808, 'grupos', '1', 'I', '2015-03-15 00:00:00', '151|20142|20091|1|1', NULL),
(809, 'grupos', '1', 'I', '2015-03-15 00:00:00', '161|20142|20091|1|1', NULL),
(810, 'grupos', '1', 'I', '2015-03-15 00:00:00', '171|20142|20091|1|1', NULL),
(811, 'grupos', '1', 'I', '2015-03-15 00:00:00', '172|20142|20091|1|1', NULL),
(812, 'grupos', '1', 'I', '2015-03-15 00:00:00', '181|20142|20091|1|1', NULL),
(813, 'grupos', '1', 'I', '2015-03-15 00:00:00', '191|20142|20091|1|1', NULL),
(814, 'carga', '1', 'I', '2015-03-15 00:00:00', '111|20142|1|11236|1', NULL),
(815, 'carga', '1', 'I', '2015-03-15 00:00:00', '112|20142|1|11236|1', NULL),
(816, 'carga', '1', 'I', '2015-03-15 00:00:00', '121|20142|1|11237|2', NULL),
(817, 'carga', '1', 'I', '2015-03-15 00:00:00', '131|20142|1|11241|3', NULL),
(818, 'carga', '1', 'I', '2015-03-15 00:00:00', '141|20142|1|11244|4', NULL),
(819, 'carga', '1', 'I', '2015-03-15 00:00:00', '142|20142|1|11244|4', NULL),
(820, 'carga', '1', 'I', '2015-03-15 00:00:00', '143|20142|1|11244|4', NULL),
(821, 'carga', '1', 'I', '2015-03-15 00:00:00', '151|20142|1|11245|5', NULL),
(822, 'carga', '1', 'I', '2015-03-15 00:00:00', '161|20142|1|11246|6', NULL),
(823, 'carga', '1', 'I', '2015-03-15 00:00:00', '171|20142|1|11247|7', NULL),
(824, 'carga', '1', 'I', '2015-03-15 00:00:00', '172|20142|1|11247|7', NULL),
(825, 'carga', '1', 'I', '2015-03-15 00:00:00', '181|20142|1|11248|8', NULL),
(826, 'carga', '1', 'I', '2015-03-15 00:00:00', '191|20142|1|11242|9', NULL),
(827, 'carga', '1', 'I', '2015-03-15 00:00:00', '111|20142|1|11237|1', NULL),
(828, 'carga', '1', 'I', '2015-03-15 00:00:00', '112|20142|1|11237|1', NULL),
(829, 'periodos', '1', 'I', '2015-03-15 00:00:00', '20143|1|2014|3|Vamos a ver|2015-03-01|2015-03-31|1', NULL),
(830, 'grupos', '1', 'I', '2015-03-15 00:00:00', '111|20143|20091|1|1', NULL),
(831, 'grupos', '1', 'I', '2015-03-15 00:00:00', '112|20143|20091|1|2', NULL),
(832, 'grupos', '1', 'I', '2015-03-15 00:00:00', '121|20143|20091|1|3', NULL),
(833, 'grupos', '1', 'I', '2015-03-15 00:00:00', '131|20143|20091|1|2', NULL),
(834, 'grupos', '1', 'I', '2015-03-15 00:00:00', '141|20143|20091|1|2', NULL),
(835, 'grupos', '1', 'I', '2015-03-15 00:00:00', '142|20143|20091|1|2', NULL),
(836, 'grupos', '1', 'I', '2015-03-15 00:00:00', '143|20143|20091|1|1', NULL),
(837, 'grupos', '1', 'I', '2015-03-15 00:00:00', '151|20143|20091|1|1', NULL),
(838, 'grupos', '1', 'I', '2015-03-15 00:00:00', '161|20143|20091|1|1', NULL),
(839, 'grupos', '1', 'I', '2015-03-15 00:00:00', '171|20143|20091|1|1', NULL),
(840, 'grupos', '1', 'I', '2015-03-15 00:00:00', '172|20143|20091|1|1', NULL),
(841, 'grupos', '1', 'I', '2015-03-15 00:00:00', '181|20143|20091|1|1', NULL),
(842, 'grupos', '1', 'I', '2015-03-15 00:00:00', '191|20143|20091|1|1', NULL),
(843, 'carga', '1', 'I', '2015-03-15 00:00:00', '111|20143|1|11236|1', NULL),
(844, 'carga', '1', 'I', '2015-03-15 00:00:00', '111|20143|1|11237|1', NULL),
(845, 'carga', '1', 'I', '2015-03-15 00:00:00', '112|20143|1|11236|1', NULL),
(846, 'carga', '1', 'I', '2015-03-15 00:00:00', '112|20143|1|11237|1', NULL),
(847, 'carga', '1', 'I', '2015-03-15 00:00:00', '121|20143|1|11237|2', NULL),
(848, 'carga', '1', 'I', '2015-03-15 00:00:00', '131|20143|1|11241|3', NULL),
(849, 'carga', '1', 'I', '2015-03-15 00:00:00', '141|20143|1|11244|4', NULL),
(850, 'carga', '1', 'I', '2015-03-15 00:00:00', '142|20143|1|11244|4', NULL),
(851, 'carga', '1', 'I', '2015-03-15 00:00:00', '143|20143|1|11244|4', NULL),
(852, 'carga', '1', 'I', '2015-03-15 00:00:00', '151|20143|1|11245|5', NULL),
(853, 'carga', '1', 'I', '2015-03-15 00:00:00', '161|20143|1|11246|6', NULL),
(854, 'carga', '1', 'I', '2015-03-15 00:00:00', '171|20143|1|11247|7', NULL),
(855, 'carga', '1', 'I', '2015-03-15 00:00:00', '172|20143|1|11247|7', NULL),
(856, 'carga', '1', 'I', '2015-03-15 00:00:00', '181|20143|1|11248|8', NULL),
(857, 'carga', '1', 'I', '2015-03-15 00:00:00', '191|20143|1|11242|9', NULL),
(858, 'periodos', '1', 'I', '2015-03-15 00:00:00', '20144|1|2014|4|vamos a ver|2015-03-01|2015-03-31|1', NULL),
(859, 'grupos', '1', 'I', '2015-03-15 00:00:00', '111|20144|20091|1|1', NULL),
(860, 'grupos', '1', 'I', '2015-03-15 00:00:00', '112|20144|20091|1|2', NULL),
(861, 'grupos', '1', 'I', '2015-03-15 00:00:00', '121|20144|20091|1|3', NULL),
(862, 'grupos', '1', 'I', '2015-03-15 00:00:00', '131|20144|20091|1|2', NULL),
(863, 'grupos', '1', 'I', '2015-03-15 00:00:00', '141|20144|20091|1|2', NULL),
(864, 'grupos', '1', 'I', '2015-03-15 00:00:00', '142|20144|20091|1|2', NULL),
(865, 'grupos', '1', 'I', '2015-03-15 00:00:00', '143|20144|20091|1|1', NULL),
(866, 'grupos', '1', 'I', '2015-03-15 00:00:00', '151|20144|20091|1|1', NULL),
(867, 'grupos', '1', 'I', '2015-03-15 00:00:00', '161|20144|20091|1|1', NULL),
(868, 'grupos', '1', 'I', '2015-03-15 00:00:00', '171|20144|20091|1|1', NULL),
(869, 'grupos', '1', 'I', '2015-03-15 00:00:00', '172|20144|20091|1|1', NULL),
(870, 'grupos', '1', 'I', '2015-03-15 00:00:00', '181|20144|20091|1|1', NULL),
(871, 'grupos', '1', 'I', '2015-03-15 00:00:00', '191|20144|20091|1|1', NULL),
(872, 'carga', '1', 'I', '2015-03-15 00:00:00', '111|20144|1|11236|1', NULL),
(873, 'carga', '1', 'I', '2015-03-15 00:00:00', '111|20144|1|11237|1', NULL),
(874, 'carga', '1', 'I', '2015-03-15 00:00:00', '112|20144|1|11236|1', NULL),
(875, 'carga', '1', 'I', '2015-03-15 00:00:00', '112|20144|1|11237|1', NULL),
(876, 'carga', '1', 'I', '2015-03-15 00:00:00', '121|20144|1|11237|2', NULL),
(877, 'carga', '1', 'I', '2015-03-15 00:00:00', '131|20144|1|11241|3', NULL),
(878, 'carga', '1', 'I', '2015-03-15 00:00:00', '141|20144|1|11244|4', NULL),
(879, 'carga', '1', 'I', '2015-03-15 00:00:00', '142|20144|1|11244|4', NULL),
(880, 'carga', '1', 'I', '2015-03-15 00:00:00', '143|20144|1|11244|4', NULL),
(881, 'carga', '1', 'I', '2015-03-15 00:00:00', '151|20144|1|11245|5', NULL),
(882, 'carga', '1', 'I', '2015-03-15 00:00:00', '161|20144|1|11246|6', NULL),
(883, 'carga', '1', 'I', '2015-03-15 00:00:00', '171|20144|1|11247|7', NULL),
(884, 'carga', '1', 'I', '2015-03-15 00:00:00', '172|20144|1|11247|7', NULL),
(885, 'carga', '1', 'I', '2015-03-15 00:00:00', '181|20144|1|11248|8', NULL),
(886, 'carga', '1', 'I', '2015-03-15 00:00:00', '191|20144|1|11242|9', NULL),
(887, 'periodos', '1', 'I', '2015-03-15 00:00:00', '20145|1|2014|5|vamos a ver|2015-03-01|2015-03-31|1', NULL),
(888, 'grupos', '1', 'I', '2015-03-15 00:00:00', '111|20145|20091|1|1', NULL),
(889, 'grupos', '1', 'I', '2015-03-15 00:00:00', '112|20145|20091|1|2', NULL),
(890, 'grupos', '1', 'I', '2015-03-15 00:00:00', '121|20145|20091|1|3', NULL),
(891, 'grupos', '1', 'I', '2015-03-15 00:00:00', '131|20145|20091|1|2', NULL),
(892, 'grupos', '1', 'I', '2015-03-15 00:00:00', '141|20145|20091|1|2', NULL),
(893, 'grupos', '1', 'I', '2015-03-15 00:00:00', '142|20145|20091|1|2', NULL),
(894, 'grupos', '1', 'I', '2015-03-15 00:00:00', '143|20145|20091|1|1', NULL),
(895, 'grupos', '1', 'I', '2015-03-15 00:00:00', '151|20145|20091|1|1', NULL),
(896, 'grupos', '1', 'I', '2015-03-15 00:00:00', '161|20145|20091|1|1', NULL),
(897, 'grupos', '1', 'I', '2015-03-15 00:00:00', '171|20145|20091|1|1', NULL),
(898, 'grupos', '1', 'I', '2015-03-15 00:00:00', '172|20145|20091|1|1', NULL),
(899, 'grupos', '1', 'I', '2015-03-15 00:00:00', '181|20145|20091|1|1', NULL),
(900, 'grupos', '1', 'I', '2015-03-15 00:00:00', '191|20145|20091|1|1', NULL),
(901, 'carga', '1', 'I', '2015-03-15 00:00:00', '111|20145|1|11236|1', NULL),
(902, 'carga', '1', 'I', '2015-03-15 00:00:00', '111|20145|1|11237|1', NULL),
(903, 'carga', '1', 'I', '2015-03-15 00:00:00', '112|20145|1|11236|1', NULL),
(904, 'carga', '1', 'I', '2015-03-15 00:00:00', '112|20145|1|11237|1', NULL),
(905, 'carga', '1', 'I', '2015-03-15 00:00:00', '121|20145|1|11237|2', NULL),
(906, 'carga', '1', 'I', '2015-03-15 00:00:00', '131|20145|1|11241|3', NULL),
(907, 'carga', '1', 'I', '2015-03-15 00:00:00', '141|20145|1|11244|4', NULL),
(908, 'carga', '1', 'I', '2015-03-15 00:00:00', '142|20145|1|11244|4', NULL),
(909, 'carga', '1', 'I', '2015-03-15 00:00:00', '143|20145|1|11244|4', NULL),
(910, 'carga', '1', 'I', '2015-03-15 00:00:00', '151|20145|1|11245|5', NULL),
(911, 'carga', '1', 'I', '2015-03-15 00:00:00', '161|20145|1|11246|6', NULL),
(912, 'carga', '1', 'I', '2015-03-15 00:00:00', '171|20145|1|11247|7', NULL),
(913, 'carga', '1', 'I', '2015-03-15 00:00:00', '172|20145|1|11247|7', NULL),
(914, 'carga', '1', 'I', '2015-03-15 00:00:00', '181|20145|1|11248|8', NULL),
(915, 'carga', '1', 'I', '2015-03-15 00:00:00', '191|20145|1|11242|9', NULL),
(916, 'grupos', '1', 'I', '2015-03-15 00:00:00', '113|20145|20091|1|2', NULL),
(917, 'carga', '1', 'D', '2015-03-15 00:00:00', NULL, '111|20145|1|11236|1'),
(918, 'carga', '1', 'D', '2015-03-15 00:00:00', NULL, '112|20145|1|11236|1'),
(919, 'carga', '1', 'I', '2015-03-15 00:00:00', '111|20145|1|11236|1', NULL),
(920, 'carga', '1', 'I', '2015-03-15 00:00:00', '112|20145|1|11236|1', NULL),
(921, 'carga', '1', 'I', '2015-03-15 00:00:00', '113|20145|1|11236|1', NULL),
(922, 'carga', '1', 'D', '2015-03-15 00:00:00', NULL, '111|20145|1|11237|1'),
(923, 'carga', '1', 'D', '2015-03-15 00:00:00', NULL, '112|20145|1|11237|1'),
(924, 'carga', '1', 'I', '2015-03-15 00:00:00', '111|20145|1|11237|1', NULL),
(925, 'carga', '1', 'I', '2015-03-15 00:00:00', '112|20145|1|11237|1', NULL),
(926, 'carga', '1', 'I', '2015-03-15 00:00:00', '113|20145|1|11237|1', NULL),
(927, 'periodos', '1', 'I', '2015-05-24 00:00:00', '20147|1|2014|7|adfasdf|2015-05-07|2015-05-31|1', NULL),
(928, 'grupos', '1', 'I', '2015-05-24 00:00:00', '111|20147|20091|1|2', NULL),
(929, 'grupos', '1', 'I', '2015-05-24 00:00:00', '115|20147|20091|1|2', NULL),
(930, 'grupos', '1', 'I', '2015-05-24 00:00:00', '116|20147|20091|1|2', NULL),
(931, 'carga', '1', 'I', '2015-05-24 00:00:00', '111|20147|1|11236|1', NULL),
(932, 'carga', '1', 'I', '2015-05-24 00:00:00', '111|20147|1|11237|1', NULL),
(933, 'carga', '1', 'I', '2015-05-24 00:00:00', '111|20147|1|11241|1', NULL),
(934, 'carga', '1', 'I', '2015-05-24 00:00:00', '111|20147|1|11242|1', NULL),
(935, 'carga', '1', 'I', '2015-05-24 00:00:00', '115|20147|1|11236|1', NULL),
(936, 'carga', '1', 'I', '2015-05-24 00:00:00', '115|20147|1|11237|1', NULL),
(937, 'carga', '1', 'I', '2015-05-24 00:00:00', '115|20147|1|11241|1', NULL),
(938, 'carga', '1', 'I', '2015-05-24 00:00:00', '115|20147|1|11242|1', NULL),
(939, 'carga', '1', 'I', '2015-05-24 00:00:00', '116|20147|1|11236|1', NULL),
(940, 'carga', '1', 'I', '2015-05-24 00:00:00', '116|20147|1|11237|1', NULL),
(941, 'carga', '1', 'I', '2015-05-24 00:00:00', '116|20147|1|11241|1', NULL),
(942, 'carga', '1', 'I', '2015-05-24 00:00:00', '116|20147|1|11242|1', NULL),
(943, 'carga', '1', 'I', '2015-05-24 00:00:00', '115|20147|1|11240|1', NULL),
(944, 'uaprendizaje', '1', 'U', '2015-06-02 00:00:00', '11236|MATEMÁTICAS I|5|5|5|0|0|0|15|2015-01-29|1|20091', '11236|MATEMÁTICAS I|5|5|0|0|0|0|15|2015-01-29|vamos a ver|1|20091'),
(945, 'p_ua', '1', 'U', '2015-06-02 00:00:00', '1|11236|1|1|1', '1|11236|1|1|1'),
(946, 'uaprendizaje', '1', 'I', '2015-06-02 00:00:00', '11270|MATERIA NUEVA|5|5|0|0|0|5|20|2015-06-03|unas observaciones|1|20091', NULL),
(947, 'p_ua', '1', 'I', '2015-06-02 00:00:00', '2|11270|1|1|1', NULL),
(948, 'p_ua', '1', 'I', '2015-06-02 00:00:00', '3|11270|1|1|1', NULL),
(949, 'p_ua', '1', 'I', '2015-06-02 00:00:00', '4|11270|1|1|1', NULL),
(950, 'p_ua', '1', 'D', '2015-06-02 00:00:00', NULL, '4|11270|1|1|1'),
(951, 'p_ua', '1', 'D', '2015-06-02 00:00:00', NULL, '2|11270|1|1|1'),
(952, 'p_ua', '1', 'I', '2015-06-02 00:00:00', '2|11270|2|1|1', NULL),
(953, 'p_ua', '1', 'D', '2015-06-02 00:00:00', NULL, '3|11270|1|1|1'),
(954, 'p_ua', '1', 'I', '2015-06-02 00:00:00', '3|11270|2|1|1', NULL),
(955, 'p_ua', '1', 'I', '2015-06-02 00:00:00', '4|11270|2|1|1', NULL),
(956, 'p_ua', '1', 'D', '2015-06-02 00:00:00', NULL, '4|11270|2|1|1'),
(957, 'p_ua', '1', 'I', '2015-06-02 00:00:00', '4|11270|3|1|1', NULL),
(958, 'p_ua', '1', 'D', '2015-06-02 00:00:00', NULL, '4|11270|3|1|1'),
(959, 'p_ua', '1', 'I', '2015-06-02 00:00:00', '4|11270|3|1|1', NULL),
(960, 'detalleseriacion', '1', 'I', '2015-06-02 00:00:00', '11270|4|11236|1', NULL),
(961, 'uaprendizaje', '1', 'U', '2015-06-02 00:00:00', '11270|MATERIA NUEVA|5|5|0|0|0|5|20|2015-06-03|1|20091', '11270|MATERIA NUEVA|5|5|0|0|0|5|20|2015-06-03|unas observaciones|1|20091'),
(962, 'p_ua', '1', 'U', '2015-06-02 00:00:00', '4|11270|3|1|1', '4|11270|3|1|1'),
(963, 'detalleseriacion', '1', 'D', '2015-06-02 00:00:00', NULL, '11270|4|11236|1'),
(964, 'detalleseriacion', '1', 'I', '2015-06-02 00:00:00', '11270|4|11236|1', NULL),
(965, 'detalleseriacion', '1', 'I', '2015-06-02 00:00:00', '11270|4|11237|1', NULL),
(966, 'uaprendizaje', '1', 'U', '2015-06-02 00:00:00', '11246|MATERIA 6|3|2|5|0|0|0|13|2015-03-15|1|20091', '11246|MATERIA 6|3|2|0|0|0|0|8|2015-03-15|vamos a ver|1|20091'),
(967, 'p_ua', '1', 'U', '2015-06-02 00:00:00', '1|11246|3|1|1', '1|11246|3|1|1'),
(968, 'p_ua', '1', 'U', '2015-06-02 00:00:00', '1|11248|1|1|1', '1|11248|1|1|1'),
(969, 'p_ua', '1', 'U', '2015-06-02 00:00:00', '1|11247|2|1|1', '1|11247|1|1|1'),
(970, 'periodos', '1', 'I', '2015-06-02 00:00:00', '20151|1|2015|1|bla bla|2015-06-02|2015-06-30|1', NULL),
(971, 'grupos', '1', 'I', '2015-06-02 00:00:00', '111|20151|20091|1|1', NULL),
(972, 'grupos', '1', 'I', '2015-06-02 00:00:00', '112|20151|20091|1|2', NULL),
(973, 'grupos', '1', 'I', '2015-06-02 00:00:00', '113|20151|20091|1|3', NULL),
(974, 'carga', '1', 'I', '2015-06-02 00:00:00', '111|20151|1|11236|1', NULL),
(975, 'carga', '1', 'I', '2015-06-02 00:00:00', '111|20151|1|11237|1', NULL),
(976, 'carga', '1', 'I', '2015-06-02 00:00:00', '112|20151|1|11236|1', NULL),
(977, 'carga', '1', 'I', '2015-06-02 00:00:00', '112|20151|1|11237|1', NULL),
(978, 'carga', '1', 'I', '2015-06-02 00:00:00', '113|20151|1|11236|1', NULL),
(979, 'carga', '1', 'I', '2015-06-02 00:00:00', '113|20151|1|11237|1', NULL),
(980, 'carga', '1', 'I', '2015-06-02 00:00:00', '112|20151|1|11240|1', NULL),
(981, 'carga', '1', 'D', '2015-06-02 00:00:00', NULL, '112|20151|1|11240|1'),
(982, 'carga', '1', 'I', '2015-06-02 00:00:00', '111|20151|1|11240|1', NULL),
(983, 'carga', '1', 'I', '2015-06-02 00:00:00', '112|20151|1|11240|1', NULL),
(984, 'grupos', '1', 'I', '2015-06-02 00:00:00', '121|20151|20091|1|2', NULL),
(985, 'grupos', '1', 'I', '2015-06-02 00:00:00', '122|20151|20091|1|2', NULL),
(986, 'carga', '1', 'I', '2015-06-02 00:00:00', '121|20151|1|11243|2', NULL),
(987, 'carga', '1', 'D', '2015-06-02 00:00:00', NULL, '121|20151|1|11243|2'),
(988, 'carga', '1', 'I', '2015-06-02 00:00:00', '121|20151|1|11243|2', NULL),
(989, 'carga', '1', 'I', '2015-06-02 00:00:00', '122|20151|1|11243|2', NULL),
(990, 'carga', '1', 'I', '2015-06-02 00:00:00', '111|20151|1|11246|1', NULL),
(991, 'carga', '1', 'I', '2015-06-02 00:00:00', '112|20151|1|11246|1', NULL),
(992, 'carga', '1', 'I', '2015-06-02 00:00:00', '113|20151|1|11246|1', NULL),
(993, 'grupos', '1', 'I', '2015-06-02 00:00:00', '131|20151|20091|1|1', NULL),
(994, 'carga', '1', 'I', '2015-06-02 00:00:00', '131|20151|1|11248|3', NULL),
(995, 'grupos', '1', 'I', '2015-06-02 00:00:00', '132|20151|20091|1|1', NULL),
(996, 'carga', '1', 'I', '2015-06-02 00:00:00', '132|20151|1|11248|3', NULL),
(997, 'periodos', '1', 'I', '2015-06-02 00:00:00', '20152|1|2015|2|vamos|2015-06-02|2015-06-30|1', NULL),
(998, 'grupos', '1', 'I', '2015-06-02 00:00:00', '111|20152|20091|1|1', NULL),
(999, 'grupos', '1', 'I', '2015-06-02 00:00:00', '112|20152|20091|1|2', NULL),
(1000, 'grupos', '1', 'I', '2015-06-02 00:00:00', '113|20152|20091|1|3', NULL),
(1001, 'grupos', '1', 'I', '2015-06-02 00:00:00', '121|20152|20091|1|2', NULL),
(1002, 'grupos', '1', 'I', '2015-06-02 00:00:00', '122|20152|20091|1|2', NULL),
(1003, 'grupos', '1', 'I', '2015-06-02 00:00:00', '131|20152|20091|1|1', NULL),
(1004, 'grupos', '1', 'I', '2015-06-02 00:00:00', '132|20152|20091|1|1', NULL),
(1005, 'carga', '1', 'I', '2015-06-02 00:00:00', '111|20152|1|11236|1', NULL),
(1006, 'carga', '1', 'I', '2015-06-02 00:00:00', '111|20152|1|11237|1', NULL),
(1007, 'carga', '1', 'I', '2015-06-02 00:00:00', '111|20152|1|11240|1', NULL),
(1008, 'carga', '1', 'I', '2015-06-02 00:00:00', '111|20152|1|11246|1', NULL),
(1009, 'carga', '1', 'I', '2015-06-02 00:00:00', '112|20152|1|11246|1', NULL),
(1010, 'carga', '1', 'I', '2015-06-02 00:00:00', '112|20152|1|11240|1', NULL),
(1011, 'carga', '1', 'I', '2015-06-02 00:00:00', '112|20152|1|11237|1', NULL),
(1012, 'carga', '1', 'I', '2015-06-02 00:00:00', '112|20152|1|11236|1', NULL),
(1013, 'carga', '1', 'I', '2015-06-02 00:00:00', '113|20152|1|11236|1', NULL),
(1014, 'carga', '1', 'I', '2015-06-02 00:00:00', '113|20152|1|11237|1', NULL),
(1015, 'carga', '1', 'I', '2015-06-02 00:00:00', '113|20152|1|11246|1', NULL),
(1016, 'carga', '1', 'I', '2015-06-02 00:00:00', '121|20152|1|11243|2', NULL),
(1017, 'carga', '1', 'I', '2015-06-02 00:00:00', '122|20152|1|11243|2', NULL),
(1018, 'carga', '1', 'I', '2015-06-02 00:00:00', '131|20152|1|11248|3', NULL),
(1019, 'carga', '1', 'I', '2015-06-02 00:00:00', '132|20152|1|11248|3', NULL),
(1020, 'grupos', '1', 'I', '2015-06-02 00:00:00', '126|20152|20091|1|1', NULL),
(1021, 'carga', '1', 'I', '2015-06-02 00:00:00', '126|20152|1|11240|2', NULL),
(1022, 'doctos', '1', 'I', '2015-06-03 00:00:00', '1|foto', NULL),
(1023, 'doctos', '1', 'I', '2015-06-03 00:00:00', '2|cedula_lic', NULL),
(1024, 'doctos', '1', 'I', '2015-06-03 00:00:00', '4|cedula_maestria', NULL),
(1025, 'doctos', '1', 'U', '2015-06-03 00:00:00', '2|ced_licenciatura', '2|cedula_lic'),
(1026, 'doctos', '1', 'U', '2015-06-03 00:00:00', '4|', '4|cedula_maestria'),
(1027, 'doctos', '1', 'U', '2015-06-03 00:00:00', '2|cedula_lic', '2|ced_licenciatura'),
(1028, 'doctos', '1', 'U', '2015-06-03 00:00:00', '4|cedula_mae', '4|'),
(1029, 'doctos', '1', 'D', '2015-06-03 00:00:00', NULL, '4|cedula_mae'),
(1030, 'doctos', '1', 'U', '2015-06-03 00:00:00', '2|licenciatura1', '2|cedula_lic'),
(1031, 'doctos', '1', 'I', '2015-06-03 00:00:00', '6|licenciatura2', NULL),
(1032, 'doctos', '1', 'I', '2015-06-03 00:00:00', '7|maestria1', NULL),
(1033, 'doctos', '1', 'I', '2015-06-03 00:00:00', '8|maestria2', NULL),
(1034, 'doctos', '1', 'I', '2015-06-03 00:00:00', '10|doctorado1', NULL),
(1035, 'doctos', '1', 'I', '2015-06-03 00:00:00', '14|doctorado2', NULL),
(1036, 'doctos', '1', 'U', '2015-06-03 00:00:00', '3|licenciatura2', '6|licenciatura2'),
(1037, 'doctos', '1', 'U', '2015-06-03 00:00:00', '4|maestria1', '7|maestria1'),
(1038, 'doctos', '1', 'U', '2015-06-03 00:00:00', '5|maestria2', '8|maestria2'),
(1039, 'doctos', '1', 'U', '2015-06-03 00:00:00', '6|doctorado1', '10|doctorado1'),
(1040, 'doctos', '1', 'U', '2015-06-03 00:00:00', '7|doctorado2', '14|doctorado2'),
(1041, 'doctos', '1', 'I', '2015-06-03 00:00:00', '16|especialidad1', NULL),
(1042, 'doctos', '1', 'U', '2015-06-03 00:00:00', '8|especialidad1', '16|especialidad1'),
(1043, 'doctos', '1', 'I', '2015-06-03 00:00:00', '10|especialidad2', NULL),
(1044, 'doctos', '1', 'U', '2015-06-03 00:00:00', '9|especialidad2', '10|especialidad2'),
(1045, 'documentos_emp', '3', 'I', '2015-06-03 00:00:00', '1|3|documentos/foto/foto_3.PNG|', NULL),
(1046, 'documentos_emp', '3', 'U', '2015-06-03 00:00:00', '1|3||documentos/foto/foto_3.PNG', '1|3|documentos/foto/foto_3.PNG|'),
(1047, 'documentos_emp', '3', 'U', '2015-06-03 00:00:00', '1|3||documentos/foto/foto_3.png', '1|3|documentos/foto/foto_3.PNG|'),
(1050, 'documentos_emp', '3', 'U', '2015-06-03 00:00:00', '1|3||documentos/fotos/foto_3.PNG', '1|3|documentos/foto/foto_3.png|'),
(1051, 'documentos_emp', '3', 'U', '2015-06-03 00:00:00', '1|3||documentos/fotos/foto_3.png', '1|3|documentos/fotos/foto_3.PNG|'),
(1052, 'documentos_emp', '3', 'U', '2015-06-03 00:00:00', '1|3||documentos/fotos/foto_3.PNG', '1|3|documentos/fotos/foto_3.png|'),
(1053, 'documentos_emp', '3', 'U', '2015-06-03 00:00:00', '1|3||documentos/fotos/foto_3.png', '1|3|documentos/fotos/foto_3.PNG|'),
(1054, 'documentos_emp', '3', 'U', '2015-06-03 00:00:00', '1|3||documentos/fotos/foto_3.PNG', '1|3|documentos/fotos/foto_3.png|'),
(1055, 'documentos_emp', '1', 'I', '2015-06-08 00:00:00', '1|1|documentos/fotos/foto_1.jpg|', NULL),
(1056, 'documentos_emp', '3', 'U', '2015-06-09 00:00:00', '1|3||documentos/fotos/foto_3.jpg', '1|3|documentos/fotos/foto_3.PNG|'),
(1057, 'documentos_emp', '3', 'U', '2015-06-09 00:00:00', '1|3||documentos/fotos/foto_3.jpg', '1|3|documentos/fotos/foto_3.jpg|'),
(1058, 'documentos_emp', '3', 'U', '2015-06-09 00:00:00', '1|3||documentos/fotos/foto_3.jpg', '1|3|documentos/fotos/foto_3.jpg|'),
(1059, 'documentos_emp', '3', 'U', '2015-06-09 00:00:00', '1|3||documentos/fotos/foto_3.jpg', '1|3|documentos/fotos/foto_3.jpg|'),
(1060, 'documentos_emp', '3', 'U', '2015-06-09 00:00:00', '1|3||documentos/fotos/foto_3.jpg', '1|3|documentos/fotos/foto_3.jpg|'),
(1061, 'documentos_emp', '3', 'U', '2015-06-09 00:00:00', '1|3||documentos/fotos/foto_3.jpg', '1|3|documentos/fotos/foto_3.jpg|'),
(1062, 'documentos_emp', '3', 'U', '2015-06-09 00:00:00', '1|3||documentos/fotos/foto_3.jpg', '1|3|documentos/fotos/foto_3.jpg|'),
(1066, 'documentos_emp', '3', 'U', '2015-06-09 00:00:00', '1|3||documentos/fotos/foto_3.png', '1|3|documentos/fotos/foto_3.jpg|'),
(1067, 'documentos_emp', '3', 'U', '2015-06-09 00:00:00', '1|3||documentos/fotos/foto_3.png', '1|3|documentos/fotos/foto_3.png|'),
(1068, 'documentos_emp', '3', 'U', '2015-06-09 00:00:00', '1|3||documentos/fotos/foto_3.png', '1|3|documentos/fotos/foto_3.png|'),
(1069, 'documentos_emp', '3', 'U', '2015-06-09 00:00:00', '1|3||documentos/fotos/foto_3.png', '1|3|documentos/fotos/foto_3.png|'),
(1070, 'documentos_emp', '3', 'U', '2015-06-09 00:00:00', '1|3||documentos/fotos/foto_3.jpg', '1|3|documentos/fotos/foto_3.png|'),
(1071, 'documentos_emp', '3', 'U', '2015-06-09 00:00:00', '1|3||documentos/fotos/foto_3.jpg', '1|3|documentos/fotos/foto_3.jpg|'),
(1072, 'documentos_emp', '3', 'U', '2015-06-09 00:00:00', '1|3||documentos/fotos/foto_3.jpg', '1|3|documentos/fotos/foto_3.jpg|'),
(1073, 'documentos_emp', '3', 'U', '2015-06-09 00:00:00', '1|3||documentos/fotos/foto_3.jpg', '1|3|documentos/fotos/foto_3.jpg|'),
(1074, 'documentos_emp', '3', 'U', '2015-06-09 00:00:00', '1|3||documentos/fotos/foto_3.jpg', '1|3|documentos/fotos/foto_3.jpg|'),
(1075, 'documentos_emp', '3', 'U', '2015-06-09 00:00:00', '1|3||documentos/fotos/foto_3.jpg', '1|3|documentos/fotos/foto_3.jpg|'),
(1076, 'documentos_emp', '3', 'U', '2015-06-09 00:00:00', '1|3||documentos/fotos/foto_3.png', '1|3|documentos/fotos/foto_3.jpg|'),
(1077, 'documentos_emp', '3', 'U', '2015-06-09 00:00:00', '1|3||documentos/fotos/foto_3.png', '1|3|documentos/fotos/foto_3.png|'),
(1078, 'documentos_emp', '3', 'U', '2015-06-09 00:00:00', '1|3||documentos/fotos/foto_3.png', '1|3|documentos/fotos/foto_3.png|'),
(1079, 'documentos_emp', '3', 'U', '2015-06-09 00:00:00', '1|3||documentos/fotos/foto_3.png', '1|3|documentos/fotos/foto_3.png|'),
(1080, 'documentos_emp', '3', 'U', '2015-06-09 00:00:00', '1|3||documentos/fotos/foto_3.png', '1|3|documentos/fotos/foto_3.png|'),
(1081, 'documentos_emp', '3', 'U', '2015-06-09 00:00:00', '1|3||', '1|3|documentos/fotos/foto_3.png|'),
(1082, 'documentos_emp', '3', 'U', '2015-06-09 00:00:00', '1|3||', '1|3||'),
(1083, 'documentos_emp', '3', 'D', '2015-06-09 00:00:00', NULL, '1|3||'),
(1084, 'documentos_emp', '3', 'I', '2015-06-09 00:00:00', '1|3|Empty|', NULL),
(1085, 'documentos_emp', '3', 'U', '2015-06-09 00:00:00', '1|3||Empty', '1|3|Empty|'),
(1086, 'documentos_emp', '3', 'U', '2015-06-09 00:00:00', '1|3||Empty', '1|3|Empty|'),
(1087, 'documentos_emp', '3', 'D', '2015-06-09 00:00:00', NULL, '1|3|Empty|'),
(1088, 'documentos_emp', '3', 'I', '2015-06-09 00:00:00', '1|3|Empty|', NULL),
(1089, 'documentos_emp', '3', 'D', '2015-06-09 00:00:00', NULL, '1|3|Empty|'),
(1090, 'documentos_emp', '3', 'I', '2015-06-09 00:00:00', '1|3|documentos/fotos/foto_3.PNG|', NULL),
(1091, 'documentos_emp', '3', 'U', '2015-06-09 00:00:00', '1|3||', '1|3|documentos/fotos/foto_3.PNG|'),
(1092, 'documentos_emp', '3', 'D', '2015-06-09 00:00:00', NULL, '1|3||'),
(1093, 'documentos_emp', '1', 'I', '2015-06-09 00:00:00', '1|3|', NULL),
(1094, 'documentos_emp', '1', 'D', '2015-06-09 00:00:00', NULL, '1|3|'),
(1095, 'documentos_emp', '3', 'I', '2015-06-09 00:00:00', '1|3|documentos/fotos/foto_3.PNG|', NULL),
(1097, 'documentos_emp', '3', 'U', '2015-06-09 00:00:00', '1|3||documentos/fotos/foto_3.PNG', '1|3|documentos/fotos/foto_3.PNG|'),
(1098, 'documentos_emp', '3', 'U', '2015-06-09 00:00:00', '1|3||documentos/fotos/foto_3.PNG', '1|3|documentos/fotos/foto_3.PNG|'),
(1099, 'documentos_emp', '3', 'U', '2015-06-09 00:00:00', '1|3||documentos/fotos/foto_3.PNG', '1|3|documentos/fotos/foto_3.PNG|'),
(1100, 'documentos_emp', '3', 'U', '2015-06-09 00:00:00', '1|3||documentos/fotos/foto_3.PNG', '1|3|documentos/fotos/foto_3.PNG|'),
(1101, 'documentos_emp', '3', 'U', '2015-06-09 00:00:00', '1|3||documentos/fotos/foto_3.PNG', '1|3|documentos/fotos/foto_3.PNG|'),
(1102, 'documentos_emp', '3', 'U', '2015-06-09 00:00:00', '1|3||documentos/fotos/foto_3.PNG', '1|3|documentos/fotos/foto_3.PNG|'),
(1103, 'documentos_emp', '3', 'U', '2015-06-10 00:00:00', '1|3||documentos/fotos/foto_3.png', '1|3|documentos/fotos/foto_3.PNG|'),
(1104, 'documentos_emp', '3', 'U', '2015-06-10 00:00:00', '1|3||documentos/fotos/foto_3.PNG', '1|3|documentos/fotos/foto_3.png|'),
(1105, 'documentos_emp', '3', 'U', '2015-06-10 00:00:00', '1|3||documentos/fotos/foto_3.png', '1|3|documentos/fotos/foto_3.PNG|'),
(1106, 'documentos_emp', '3', 'U', '2015-06-10 00:00:00', '1|3||documentos/fotos/foto_3.png', '1|3|documentos/fotos/foto_3.png|'),
(1107, 'documentos_emp', '3', 'U', '2015-06-10 00:00:00', '1|3||documentos/fotos/foto_3.png', '1|3|documentos/fotos/foto_3.png|'),
(1108, 'documentos_emp', '3', 'U', '2015-06-10 00:00:00', '1|3||documentos/fotos/foto_3.png', '1|3|documentos/fotos/foto_3.png|'),
(1109, 'documentos_emp', '3', 'U', '2015-06-10 00:00:00', '1|3||', '1|3|documentos/fotos/foto_3.png|'),
(1110, 'documentos_emp', '3', 'U', '2015-06-10 00:00:00', '1|3||', '1|3||'),
(1111, 'documentos_emp', '3', 'U', '2015-06-10 00:00:00', '1|3||documentos/fotos/foto_3.PNG', '1|3||'),
(1112, 'documentos_emp', '3', 'U', '2015-06-10 00:00:00', '1|3||documentos/fotos/foto_3.PNG', '1|3|documentos/fotos/foto_3.PNG|'),
(1113, 'documentos_emp', '3', 'U', '2015-06-10 00:00:00', '1|3||documentos/fotos/foto_3.jpg', '1|3|documentos/fotos/foto_3.PNG|'),
(1114, 'documentos_emp', '3', 'U', '2015-06-10 00:00:00', '1|3||documentos/fotos/foto_3.jpg', '1|3|documentos/fotos/foto_3.jpg|'),
(1115, 'documentos_emp', '3', 'U', '2015-06-10 00:00:00', '1|3||', '1|3|documentos/fotos/foto_3.jpg|'),
(1116, 'documentos_emp', '3', 'D', '2015-06-10 00:00:00', NULL, '1|3||'),
(1117, 'documentos_emp', '3', 'I', '2015-06-10 00:00:00', '1|3|documentos/fotos/foto_3.png|', NULL),
(1118, 'documentos_emp', '3', 'U', '2015-06-10 00:00:00', '1|3||documentos/fotos/foto_3.png', '1|3|documentos/fotos/foto_3.png|'),
(1119, 'documentos_emp', '3', 'U', '2015-06-10 00:00:00', '1|3||documentos/fotos/foto_3.png', '1|3|documentos/fotos/foto_3.png|'),
(1120, 'documentos_emp', '3', 'U', '2015-06-10 00:00:00', '1|3||documentos/fotos/foto_3.PNG', '1|3|documentos/fotos/foto_3.png|'),
(1121, 'nvprograma', '1', 'I', '2015-06-10 00:00:00', '4|DOCTORADO', NULL),
(1122, 'nvprograma', '1', 'I', '2015-06-10 00:00:00', '5|ESPECIALIDAD', NULL),
(1123, 'nvprograma', '1', 'U', '2015-06-10 00:00:00', '3|DOCTORADO', '3|TECNICO'),
(1124, 'nvprograma', '1', 'U', '2015-06-10 00:00:00', '4|ESPECIALIDAD', '4|DOCTORADO'),
(1125, 'nvprograma', '1', 'U', '2015-06-10 00:00:00', '5|TECNICO', '5|ESPECIALIDAD'),
(1126, 'uaprendizaje', '1', 'I', '2015-06-10 00:00:00', '11271|OTRA M|5|5|5|5|5|5|35|2015-06-10|vamos a ver|2|20091', NULL),
(1127, 'p_ua', '1', 'I', '2015-06-10 00:00:00', '1|11271|1|1|1', NULL),
(1128, 'p_ua', '1', 'I', '2015-06-10 00:00:00', '3|11271|1|1|1', NULL),
(1129, 'uaprendizaje', '1', 'I', '2015-06-10 00:00:00', '11272|HASTA EL DIA|2|2|2|0|0|0|8|2015-06-10|vamos|2|20091', NULL),
(1130, 'p_ua', '1', 'I', '2015-06-10 00:00:00', '1|11272|1|1|1', NULL),
(1131, 'carga', '3', 'I', '2015-06-10 00:00:00', '2|3|2|1|0|2015-06-09|0', NULL),
(1132, 'documentos_emp', '3', 'I', '2015-06-10 00:00:00', '2|3|documentos/estudios/licenciatura1_3.css|', NULL),
(1133, 'carga', '3', 'D', '2015-06-10 00:00:00', NULL, '2|3|2|1|0|2015-06-09|0'),
(1134, 'documentos_emp', '3', 'D', '2015-06-10 00:00:00', NULL, '2|3|documentos/estudios/licenciatura1_3.css|'),
(1135, 'carga', '3', 'I', '2015-06-10 00:00:00', '2|3|2|1|0|2015-06-09|0', NULL),
(1136, 'documentos_emp', '3', 'I', '2015-06-10 00:00:00', '2|3|documentos/estudios/licenciatura1_3.css|', NULL),
(1137, 'carga', '3', 'U', '2015-06-10 00:00:00', '2|3|2|1|2134123|2015-06-09|0', '2|3|2|1|0|2015-06-09|0'),
(1138, 'carga', '3', 'U', '2015-06-10 00:00:00', '2|3|2|1|12343|2015-06-09|0', '2|3|2|1|2134123|2015-06-09|0'),
(1139, 'carga', '3', 'D', '2015-06-10 00:00:00', NULL, '2|3|2|1|12343|2015-06-09|\0'),
(1140, 'documentos_emp', '3', 'D', '2015-06-10 00:00:00', NULL, '2|3|documentos/estudios/licenciatura1_3.css|'),
(1141, 'carga', '3', 'I', '2015-06-10 00:00:00', '1|3|2|1|12345|2015-06-10|', NULL),
(1142, 'documentos_emp', '3', 'I', '2015-06-10 00:00:00', '2|3|documentos/estudios/licenciatura1_3.PNG|', NULL),
(1143, 'documentos_emp', '3', 'D', '2015-06-10 00:00:00', NULL, '2|3|documentos/estudios/licenciatura1_3.PNG|'),
(1144, 'carga', '3', 'D', '2015-06-10 00:00:00', NULL, '1|3|2|1|12345|2015-06-10|');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `campus`
--

CREATE TABLE IF NOT EXISTS `campus` (
  `campus` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo campus (1,2,3,4)',
  `descripcion` varchar(100) NOT NULL COMMENT 'Descripcion CAMPUS ()',
  `direccion` varchar(100) DEFAULT NULL COMMENT 'Direccion CAMPUS',
  `ciudad` int(11) NOT NULL DEFAULT '16' COMMENT 'Codigo ciudad',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`campus`),
  UNIQUE KEY `CM_codigo_UNIQUE` (`campus`),
  KEY `fk_campus_ciudad1_idx` (`ciudad`),
  KEY `fk_campus_users1_idx` (`users_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='<double-click to overwrite multiple objects>' AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `campus`
--

INSERT INTO `campus` (`campus`, `descripcion`, `direccion`, `ciudad`, `users_id`) VALUES
(1, 'TIJUANA UNIDAD OTAY', 'CALZADA UNIVERSIDAD 14418 PARQUE INDUSTRIAL INTERNACIONAL TI', 16, 1),
(2, 'TIJUANA UNIDAD TECATE', 'CALZADA UNIVERSIDAD NO.1 FRACC. SAN FERNANDO. C.P. 21460', 16, 1),
(3, 'TIJUANA UNIDAD ROSARITO', 'BLVD. MARIANO VERDUGO NORTE ENTRE CALLE ISLA LOBO VERACRUZ Y', 16, 1),
(4, 'TIJUANA UNIDAD VALLE DE LAS PALMAS', 'BLVD. UNIVERSITARIO #1000', 16, 1);

--
-- Disparadores `campus`
--
DROP TRIGGER IF EXISTS `bit_D_campus`;
DELIMITER //
CREATE TRIGGER `bit_D_campus` AFTER DELETE ON `campus`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *bit_D_campus*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro_old
)
VALUES (
'campus', OLD.users_id, 'D', curdate( ) , concat_WS( '|', 
OLD.campus,
OLD.descripcion,
OLD.direccion,
OLD.ciudad                                                      ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_campus`;
DELIMITER //
CREATE TRIGGER `bit_I_campus` AFTER INSERT ON `campus`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *bit_I_campus*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro
)
VALUES (
'campus', NEW.users_id, 'I', curdate( ) , concat_WS( '|', 
NEW.campus,
NEW.descripcion,
NEW.direccion,
NEW.ciudad                                                           ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_campus`;
DELIMITER //
CREATE TRIGGER `bit_U_campus` AFTER UPDATE ON `campus`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al MODIFICAR REGISTRO en *campus*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro,
registro_old
)
VALUES (
'campus', NEW.users_id, 'U', curdate( ) , concat_WS( '|', 
NEW.campus,
NEW.descripcion,
NEW.direccion,
NEW.ciudad), 
concat_WS( '|', 
OLD.campus,
OLD.descripcion,
OLD.direccion,
OLD.ciudad    )
);

END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caracter`
--

CREATE TABLE IF NOT EXISTS `caracter` (
  `caracter` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Caracter de materia uaprendizaje (1,2)',
  `descripcion` varchar(15) NOT NULL COMMENT 'Obligatoria, Optativa',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`caracter`),
  UNIQUE KEY `CAR_codigo_UNIQUE` (`caracter`),
  KEY `fk_caracter_users1_idx` (`users_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='<double-click to overwrite multiple objects>' AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `caracter`
--

INSERT INTO `caracter` (`caracter`, `descripcion`, `users_id`) VALUES
(1, 'OBLIGATORIA', 1),
(2, 'OPTATIVA', 1);

--
-- Disparadores `caracter`
--
DROP TRIGGER IF EXISTS `bit_D_caracter`;
DELIMITER //
CREATE TRIGGER `bit_D_caracter` AFTER DELETE ON `caracter`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *caracter*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro_old
)
VALUES (
'caracter', OLD.users_id, 'D', curdate( ) , concat_WS( '|', OLD.caracter, OLD.descripcion 
));

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_caracter`;
DELIMITER //
CREATE TRIGGER `bit_I_caracter` AFTER INSERT ON `caracter`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *caracter*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro
)
VALUES (
'caracter', NEW.users_id, 'I', curdate( ) , concat_WS( '|', NEW.caracter, NEW.descripcion 
));

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_caracter`;
DELIMITER //
CREATE TRIGGER `bit_U_caracter` AFTER UPDATE ON `caracter`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al MODIFICAR REGISTRO en *caracter*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro,
registro_old
)
VALUES (
'caracter', NEW.users_id, 'U', curdate( ) , concat_WS( '|', NEW.caracter, NEW.descripcion ),
concat_WS( '|', OLD.caracter, OLD.descripcion )
);

END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caracteristica_cur`
--

CREATE TABLE IF NOT EXISTS `caracteristica_cur` (
  `caracteristica_cur` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Consec Característica',
  `descripcion` varchar(45) NOT NULL COMMENT 'Desc Curso:',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`caracteristica_cur`),
  UNIQUE KEY `caracteristica_cur_UNIQUE` (`caracteristica_cur`),
  KEY `fk_caracteristica_cur_users1_idx` (`users_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `caracteristica_cur`
--

INSERT INTO `caracteristica_cur` (`caracteristica_cur`, `descripcion`, `users_id`) VALUES
(1, 'CURSO', 1),
(2, 'CONGRESO', 1),
(3, 'TALLER', 1);

--
-- Disparadores `caracteristica_cur`
--
DROP TRIGGER IF EXISTS `bit_D_caracteristica_cur`;
DELIMITER //
CREATE TRIGGER `bit_D_caracteristica_cur` AFTER DELETE ON `caracteristica_cur`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *caracteristica_cur*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro_old
)
VALUES (
'caracteristica_cur', OLD.users_id, 'D', curdate( ) , concat_WS( '|', 
OLD.caracteristica_cur,
OLD.descripcion ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_caracteristica_cur`;
DELIMITER //
CREATE TRIGGER `bit_I_caracteristica_cur` AFTER INSERT ON `caracteristica_cur`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *caracteristica_cur*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro
)
VALUES (
'caracteristica_cur', NEW.users_id, 'I', curdate( ) , concat_WS( '|', 
NEW.caracteristica_cur,
NEW.descripcion ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_caracteristica_cur`;
DELIMITER //
CREATE TRIGGER `bit_U_caracteristica_cur` AFTER UPDATE ON `caracteristica_cur`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al MODIFICAR REGISTRO en *caracteristica_cur*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro,
registro_old
)
VALUES (
'caracteristica_cur', NEW.users_id, 'U', curdate( ) , concat_WS( '|', NEW.caracteristica_cur,NEW.descripcion ), 
concat_WS( '|', OLD.caracteristica_cur,OLD.descripcion ) 
);

END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carga`
--

CREATE TABLE IF NOT EXISTS `carga` (
  `grupo` int(11) NOT NULL COMMENT 'Código grupo',
  `periodo` int(11) NOT NULL COMMENT 'Periodo de trabajo(Año 4 digitos+ semestre o cuatrim) ej. 20091,20092',
  `programaedu` int(11) NOT NULL,
  `uaprendizaje` int(11) NOT NULL,
  `semestre` int(11) NOT NULL COMMENT 'Semestre',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`grupo`,`periodo`,`programaedu`,`uaprendizaje`),
  KEY `fk_carga_users1_idx` (`users_id`),
  KEY `fk_carga_p_ua1_idx` (`programaedu`,`uaprendizaje`),
  KEY `fk_carga_grupos1_idx` (`grupo`,`periodo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `carga`
--

INSERT INTO `carga` (`grupo`, `periodo`, `programaedu`, `uaprendizaje`, `semestre`, `users_id`) VALUES
(111, 20147, 1, 11236, 1, 1),
(111, 20147, 1, 11237, 1, 1),
(111, 20147, 1, 11241, 1, 1),
(111, 20147, 1, 11242, 1, 1),
(111, 20151, 1, 11236, 1, 1),
(111, 20151, 1, 11237, 1, 1),
(111, 20151, 1, 11240, 1, 1),
(111, 20151, 1, 11246, 1, 1),
(111, 20152, 1, 11236, 1, 1),
(111, 20152, 1, 11237, 1, 1),
(111, 20152, 1, 11240, 1, 1),
(111, 20152, 1, 11246, 1, 1),
(112, 20151, 1, 11236, 1, 1),
(112, 20151, 1, 11237, 1, 1),
(112, 20151, 1, 11240, 1, 1),
(112, 20151, 1, 11246, 1, 1),
(112, 20152, 1, 11236, 1, 1),
(112, 20152, 1, 11237, 1, 1),
(112, 20152, 1, 11240, 1, 1),
(112, 20152, 1, 11246, 1, 1),
(113, 20151, 1, 11236, 1, 1),
(113, 20151, 1, 11237, 1, 1),
(113, 20151, 1, 11246, 1, 1),
(113, 20152, 1, 11236, 1, 1),
(113, 20152, 1, 11237, 1, 1),
(113, 20152, 1, 11246, 1, 1),
(115, 20147, 1, 11236, 1, 1),
(115, 20147, 1, 11237, 1, 1),
(115, 20147, 1, 11240, 1, 1),
(115, 20147, 1, 11241, 1, 1),
(115, 20147, 1, 11242, 1, 1),
(116, 20147, 1, 11236, 1, 1),
(116, 20147, 1, 11237, 1, 1),
(116, 20147, 1, 11241, 1, 1),
(116, 20147, 1, 11242, 1, 1),
(121, 20151, 1, 11243, 2, 1),
(121, 20152, 1, 11243, 2, 1),
(122, 20151, 1, 11243, 2, 1),
(122, 20152, 1, 11243, 2, 1),
(126, 20152, 1, 11240, 2, 1),
(131, 20151, 1, 11248, 3, 1),
(131, 20152, 1, 11248, 3, 1),
(132, 20151, 1, 11248, 3, 1),
(132, 20152, 1, 11248, 3, 1);

--
-- Disparadores `carga`
--
DROP TRIGGER IF EXISTS `bit_D_carga`;
DELIMITER //
CREATE TRIGGER `bit_D_carga` AFTER DELETE ON `carga`
 FOR EACH ROW BEGIN
-- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *carga*
-- Uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Julio 2014 
-- -----------------------------------------------------
	INSERT INTO  `bitacora`
		(tabla, usuario, operacion, fecha,registro_old) 
	VALUES 
		('carga', OLD.users_id, 'D',curdate(),concat_WS('|',
          	OLD.grupo,
          	OLD.periodo,
          	OLD.programaedu,
			OLD.uaprendizaje,
			OLD.semestre
        ));   
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_carga`;
DELIMITER //
CREATE TRIGGER `bit_I_carga` AFTER INSERT ON `carga`
 FOR EACH ROW BEGIN
-- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *carga*
-- Uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Julio 2014 
-- -----------------------------------------------------
	INSERT INTO  `bitacora`
		(tabla, usuario, operacion, fecha,registro) 
	VALUES 
		('carga', NEW.users_id, 'I',curdate(),concat_WS('|',
          	NEW.grupo,
          	NEW.periodo,
          	NEW.programaedu,
			NEW.uaprendizaje,
			NEW.semestre
        ));   
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_carga`;
DELIMITER //
CREATE TRIGGER `bit_U_carga` AFTER UPDATE ON `carga`
 FOR EACH ROW BEGIN
-- -----------------------------------------------------
-- Bitacora al MODIFICAR REGISTRO en *carga*
-- Uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Oct 2014 
-- -----------------------------------------------------
	INSERT INTO  `bitacora`
		(tabla, usuario, operacion, fecha,registro,registro_old) 
	VALUES 
		('carga', NEW.users_id, 'U',curdate(),concat_WS('|',
          	OLD.grupo,
          	OLD.periodo,
          	OLD.programaedu,
			OLD.uaprendizaje,
			OLD.semestre
        ),
        concat_WS('|',
          	OLD.grupo,
          	OLD.periodo,
          	OLD.programaedu,
			OLD.uaprendizaje,
			OLD.semestre
        ));   
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carreras_emp`
--

CREATE TABLE IF NOT EXISTS `carreras_emp` (
  `carrera` int(11) NOT NULL COMMENT 'Carrera emp',
  `descripcion` varchar(60) NOT NULL COMMENT 'Descripcion carrera emp',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`carrera`),
  KEY `fk_carreras_emp_users1_idx` (`users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `carreras_emp`
--

INSERT INTO `carreras_emp` (`carrera`, `descripcion`, `users_id`) VALUES
(1, 'LICENCIADO EN INFORMATICA', 1),
(2, 'LICENCIADO EN CONTADURIA', 1),
(3, 'LICENCIADO EN NEGOCIOS INTERNACIONALES', 1),
(4, 'LICENCIADO EN ADMINISTRACION DE EMPRESAS', 1),
(5, 'INGENIERO EN SISTEMAS', 1),
(6, 'MAESTRIA EN TECNOLOGIAS DE LA INFORMACION Y LA COMUNICACION', 1);

--
-- Disparadores `carreras_emp`
--
DROP TRIGGER IF EXISTS `bit_D_carreras_emp`;
DELIMITER //
CREATE TRIGGER `bit_D_carreras_emp` AFTER DELETE ON `carreras_emp`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *carreras_emp*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro_old
)
VALUES (
'carreras_emp', OLD.users_id, 'D', curdate( ) , concat_WS( '|', 
OLD.carrera, 
OLD.descripcion ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_carreras_emp`;
DELIMITER //
CREATE TRIGGER `bit_I_carreras_emp` AFTER INSERT ON `carreras_emp`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *carreras_emp*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro
)
VALUES (
'carreras_emp', NEW.users_id, 'I', curdate( ) , concat_WS( '|', 
NEW.carrera, 
NEW.descripcion ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_carreras_emp`;
DELIMITER //
CREATE TRIGGER `bit_U_carreras_emp` AFTER UPDATE ON `carreras_emp`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al MODIFICAR REGISTRO en *carreras_emp*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro,registro_old
)
VALUES (
'carreras_emp', NEW.users_id, 'U', curdate( ) , concat_WS( '|',NEW.carrera, NEW.descripcion ),
concat_WS( '|',OLD.carrera, OLD.descripcion ) 
);

END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE IF NOT EXISTS `categorias` (
  `categoria` int(11) NOT NULL COMMENT 'Categoria contrato',
  `descripcion` varchar(45) NOT NULL COMMENT 'Descripcion (Tiempo Completo, Asignatura)',
  `nivel` char(1) DEFAULT NULL COMMENT 'Nivel',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`categoria`),
  KEY `fk_categorias_users1_idx` (`users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`categoria`, `descripcion`, `nivel`, `users_id`) VALUES
(101, 'PROFESOR ORDINARIO DE ASIGNATURA NIVEL A', NULL, 1),
(102, 'PROFESOR ORDINARIO DE ASIGNATURA NIVEL B', NULL, 1),
(103, 'PROFESOR ORDINARIO DE ASIGNATURA NIVEL C', NULL, 1),
(104, 'PROFESOR ORDINARIO DE CARRERA NIVEL A', NULL, 1),
(105, 'PROFESOR ORDINARIO DE CARRERA NIVEL B', NULL, 1);

--
-- Disparadores `categorias`
--
DROP TRIGGER IF EXISTS `bit_D_categorias`;
DELIMITER //
CREATE TRIGGER `bit_D_categorias` AFTER DELETE ON `categorias`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *categorias*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro_old
)
VALUES (
'categoria', OLD.users_id, 'D', curdate( ) , concat_WS( '|', 
OLD.categoria, 
OLD.descripcion, 
OLD.nivel ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_categorias`;
DELIMITER //
CREATE TRIGGER `bit_I_categorias` AFTER INSERT ON `categorias`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *categorias*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro
)
VALUES (
'categoria', NEW.users_id, 'I', curdate( ) , concat_WS( '|', 
NEW.categoria, 
NEW.descripcion, 
NEW.nivel ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_categorias`;
DELIMITER //
CREATE TRIGGER `bit_U_categorias` AFTER UPDATE ON `categorias`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al MODIFICAR REGISTRO en *categorias*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro,registro_old
)
VALUES (
'categoria', NEW.users_id, 'U', curdate( ) , concat_WS( '|', 
NEW.categoria, 
NEW.descripcion, 
NEW.nivel ),
concat_WS( '|', 
OLD.categoria, 
OLD.descripcion, 
OLD.nivel )  
);

END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudad`
--

CREATE TABLE IF NOT EXISTS `ciudad` (
  `ciudad` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo Ciudad',
  `descripcion` varchar(60) NOT NULL COMMENT 'Descripcion Ciudad',
  `estado` int(11) NOT NULL DEFAULT '2' COMMENT 'Codigo estado',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`ciudad`),
  UNIQUE KEY `CD_codigo_UNIQUE` (`ciudad`),
  KEY `fk_ciudad_estado1_idx` (`estado`),
  KEY `fk_ciudad_users1_idx` (`users_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=651 ;

--
-- Volcado de datos para la tabla `ciudad`
--

INSERT INTO `ciudad` (`ciudad`, `descripcion`, `estado`, `users_id`) VALUES
(1, 'AGUASCALIENTES', 1, 1),
(2, 'ASIENTOS', 1, 1),
(3, 'CALVILLO', 1, 1),
(4, 'COSÍO', 1, 1),
(5, 'JESÚS MARÍA', 1, 1),
(6, 'PABELLÓN DE ARTEAGA', 1, 1),
(7, 'RINCÓN DE ROMOS', 1, 1),
(8, 'SAN FRANCISCO DE LOS ROMO', 1, 1),
(9, 'TEPEZALÁ', 1, 1),
(10, 'ENSENADA', 2, 1),
(11, 'MEXICALI', 2, 1),
(12, 'PLAYAS DE ROSARITO', 2, 1),
(13, 'RODOLFO SÁNCHEZ T. (MANEADERO)', 2, 1),
(14, 'SAN FELIPE', 2, 1),
(15, 'TECATE', 2, 1),
(16, 'TIJUANA', 2, 1),
(17, 'CABO SAN LUCAS', 3, 1),
(18, 'CIUDAD CONSTITUCIÓN', 3, 1),
(19, 'GUERRERO NEGRO', 3, 1),
(20, 'HEROICA MULEGÉ', 3, 1),
(21, 'LA PAZ', 3, 1),
(22, 'LORETO', 3, 1),
(23, 'PUERTO ADOLFO LÓPEZ MATEOS', 3, 1),
(24, 'SAN IGNACIO', 3, 1),
(25, 'SAN JOSÉ DEL CABO', 3, 1),
(26, 'TODOS SANTOS', 3, 1),
(27, 'VILLA ALBERTO ANDRÉS ALVARADO ARÁMBURO', 3, 1),
(28, 'CALKINI', 4, 1),
(29, 'CANDELARIA', 4, 1),
(30, 'CHAMPOTÓN', 4, 1),
(31, 'CIUDAD DEL CARMEN', 4, 1),
(32, 'ESCÁRCEGA', 4, 1),
(33, 'HECELCHAKÁN', 4, 1),
(34, 'HOPELCHÉN', 4, 1),
(35, 'POMUCH', 4, 1),
(36, 'SABANCUY', 4, 1),
(37, 'SAN FRANCISCO DE CAMPECHE', 4, 1),
(38, 'ALLENDE', 5, 1),
(39, 'ARTEAGA', 5, 1),
(40, 'CASTAÑOS', 5, 1),
(41, 'CIUDAD ACUÑA', 5, 1),
(42, 'CIUDAD MELCHOR MÚZQUIZ', 5, 1),
(43, 'CUATRO CIÉNEGAS DE CARRANZA', 5, 1),
(44, 'FRANCISCO I. MADERO (CHÁVEZ)', 5, 1),
(45, 'FRONTERA', 5, 1),
(46, 'MATAMOROS', 5, 1),
(47, 'MONCLOVA', 5, 1),
(48, 'MORELOS', 5, 1),
(49, 'NADADORES', 5, 1),
(50, 'NAVA', 5, 1),
(51, 'NUEVA ROSITA', 5, 1),
(52, 'PARRAS DE LA FUENTE', 5, 1),
(53, 'PIEDRAS NEGRAS', 5, 1),
(54, 'RAMOS ARIZPE', 5, 1),
(55, 'SABINAS', 5, 1),
(56, 'SALTILLO', 5, 1),
(57, 'SAN BUENAVENTURA', 5, 1),
(58, 'SAN PEDRO', 5, 1),
(59, 'TORREÓN', 5, 1),
(60, 'VIESCA', 5, 1),
(61, 'ZARAGOZA', 5, 1),
(62, 'CIUDAD DE ARMERÍA', 6, 1),
(63, 'CIUDAD DE VILLA DE ÁLVAREZ', 6, 1),
(64, 'CIUDAD DE VILLA DE ÁLVAREZ', 6, 1),
(65, 'COLIMA', 6, 1),
(66, 'MANZANILLO', 6, 1),
(67, 'TECOMAN', 6, 1),
(68, 'ACALA', 7, 1),
(69, 'ARRIAGA', 7, 1),
(70, 'CACAHOATÁN', 7, 1),
(71, 'CHIAPA DE CORZO', 7, 1),
(72, 'CINTALAPA DE FIGUEROA', 7, 1),
(73, 'COMITÁN DE DOMÍNGUEZ', 7, 1),
(74, 'HUIXTLA', 7, 1),
(75, 'JIQUIPILAS', 7, 1),
(76, 'LAS MARGARITAS', 7, 1),
(77, 'LAS ROSAS', 7, 1),
(78, 'MAPASTEPEC', 7, 1),
(79, 'MOTOZINTLA DE MENDOZA', 7, 1),
(80, 'OCOSINGO', 7, 1),
(81, 'OCOZOCOAUTLA DE ESPINOSA', 7, 1),
(82, 'PALENQUE', 7, 1),
(83, 'PICHUCALCO', 7, 1),
(84, 'PIJIJIAPAN', 7, 1),
(85, 'PUERTO MADERO (SAN BENITO)', 7, 1),
(86, 'REFORMA', 7, 1),
(87, 'SAN CRISTÓBAL DE LAS CASAS', 7, 1),
(88, 'TAPACHULA DE CÓRDOVA Y ORDÓÑEZ', 7, 1),
(89, 'TONALÁ', 7, 1),
(90, 'TUXTLA GUTIÉRREZ', 7, 1),
(91, 'VENUSTIANO CARRANZA', 7, 1),
(92, 'VILLAFLORES', 7, 1),
(93, 'BACHÍNIVA', 8, 1),
(94, 'CHIHUAHUA', 8, 1),
(95, 'COLONIA ANÁHUAC', 8, 1),
(96, 'CUAUHTÉMOC', 8, 1),
(97, 'DELICIAS', 8, 1),
(98, 'HIDALGO DEL PARRAL', 8, 1),
(99, 'JOSÉ MARIANO JIMÉNEZ', 8, 1),
(100, 'JUAN ALDAMA', 8, 1),
(101, 'JUÁREZ', 8, 1),
(102, 'MADERA', 8, 1),
(103, 'MANUEL OJINAGA', 8, 1),
(104, 'NUEVO CASAS GRANDES', 8, 1),
(105, 'SANTA ROSALÍA DE CAMARGO', 8, 1),
(106, 'SAUCILLO', 8, 1),
(107, 'CIUDAD DE MÉXICO', 9, 1),
(108, 'CANATLÁN', 10, 1),
(109, 'CIUDAD LERDO', 10, 1),
(110, 'EL SALTO', 10, 1),
(111, 'FRANCISCO I. MADERO', 10, 1),
(112, 'GÓMEZ PALACIO', 10, 1),
(113, 'NOMBRE DE DIOS', 10, 1),
(114, 'PEÑÓN BLANCO', 10, 1),
(115, 'SAN JUAN DEL RÍO DEL CENTAURO DEL NORTE', 10, 1),
(116, 'SANTA MARÍA DEL ORO', 10, 1),
(117, 'SANTIAGO PAPASQUIARO', 10, 1),
(118, 'VICENTE GUERRERO', 10, 1),
(119, 'VICTORIA DE DURANGO', 10, 1),
(120, 'ABASOLO', 11, 1),
(121, 'ACÁMBARO', 11, 1),
(122, 'APASEO EL ALTO', 11, 1),
(123, 'APASEO EL GRANDE', 11, 1),
(124, 'CELAYA', 11, 1),
(125, 'CIUDAD MANUEL DOBLADO', 11, 1),
(126, 'COMONFORT', 11, 1),
(127, 'CORTAZAR', 11, 1),
(128, 'CUERÁMARO', 11, 1),
(129, 'DOCTOR MORA', 11, 1),
(130, 'DOLORES HIDALGO CUNA DE LA INDEPENDENCIA NACIONAL', 11, 1),
(131, 'EMPALME ESCOBEDO (ESCOBEDO)', 11, 1),
(132, 'GUANAJUATO', 11, 1),
(133, 'HUANÍMARO', 11, 1),
(134, 'IRAPUATO', 11, 1),
(135, 'JARAL DEL PROGRESO', 11, 1),
(136, 'JERÉCUARO', 11, 1),
(137, 'LEÓN DE LOS ALDAMA', 11, 1),
(138, 'MARFIL', 11, 1),
(139, 'MOROLEÓN', 11, 1),
(140, 'PÉNJAMO', 11, 1),
(141, 'PURÍSIMA DE BUSTOS', 11, 1),
(142, 'RINCÓN DE TAMAYO', 11, 1),
(143, 'ROMITA', 11, 1),
(144, 'SALAMANCA', 11, 1),
(145, 'SALVATIERRA', 11, 1),
(146, 'SAN DIEGO DE LA UNIÓN', 11, 1),
(147, 'SAN FRANCISCO DEL RINCÓN', 11, 1),
(148, 'SAN JOSÉ ITURBIDE', 11, 1),
(149, 'SAN LUIS DE LA PAZ', 11, 1),
(150, 'SAN MIGUEL DE ALLENDE', 11, 1),
(151, 'SANTA CRUZ JUVENTINO ROSAS', 11, 1),
(152, 'SANTIAGO MARAVATÍO', 11, 1),
(153, 'SILAO', 11, 1),
(154, 'TARANDACUAO', 11, 1),
(155, 'URIANGATO', 11, 1),
(156, 'VALLE DE SANTIAGO', 11, 1),
(157, 'VILLAGRÁN', 11, 1),
(158, 'YURIRIA', 11, 1),
(159, 'ACAPULCO DE JUÁREZ', 12, 1),
(160, 'ARCELIA', 12, 1),
(161, 'ATOYAC DE ÁLVAREZ', 12, 1),
(162, 'AYUTLA DE LOS LIBRES', 12, 1),
(163, 'AZOYÚ', 12, 1),
(164, 'BUENAVISTA DE CUELLAR', 12, 1),
(165, 'CHILAPA DE ÁLVAREZ', 12, 1),
(166, 'CHILPANCINGO DE LOS BRAVO', 12, 1),
(167, 'CIUDAD ALTAMIRANO', 12, 1),
(168, 'CIUDAD APAXTLA DE CASTREJÓN', 12, 1),
(169, 'COPALA', 12, 1),
(170, 'COYUCA DE BENÍTEZ', 12, 1),
(171, 'COYUCA DE CATALÁN', 12, 1),
(172, 'CRUZ GRANDE', 12, 1),
(173, 'CUAJINICUILAPA', 12, 1),
(174, 'CUTZAMALA DE PINZÓN', 12, 1),
(175, 'HUAMUXTITLAN', 12, 1),
(176, 'HUITZUCO', 12, 1),
(177, 'IGUALA DE LA INDEPENDENCIA', 12, 1),
(178, 'LA UNIÓN', 12, 1),
(179, 'MARQUELIA', 12, 1),
(180, 'OCOTITO', 12, 1),
(181, 'OLINALÁ', 12, 1),
(182, 'PETATLÁN', 12, 1),
(183, 'SAN JERÓNIMO DE JUÁREZ', 12, 1),
(184, 'SAN LUIS ACATLÁN', 12, 1),
(185, 'SAN LUIS DE LA LOMA', 12, 1),
(186, 'SAN LUIS SAN PEDRO', 12, 1),
(187, 'SAN MARCOS', 12, 1),
(188, 'TAXCO DE ALARCÓN', 12, 1),
(189, 'TÉCPAN DE GALEANA', 12, 1),
(190, 'TELOLOAPAN', 12, 1),
(191, 'TEPECOACUILCO DE TRUJANO', 12, 1),
(192, 'TIERRA COLORADA', 12, 1),
(193, 'TIXTLA DE GUERRERO', 12, 1),
(194, 'TLALIXTAQUILLA', 12, 1),
(195, 'TLAPA DE COMONFORT', 12, 1),
(196, 'TLAPEHUALA', 12, 1),
(197, 'ZIHUATANEJO', 12, 1),
(198, 'ZUMPANGO DEL RÍO', 12, 1),
(199, 'ACTOPAN', 13, 1),
(200, 'APAN', 13, 1),
(201, 'CIUDAD DE FRAY BERNARDINO DE SAHAGÚN', 13, 1),
(202, 'CRUZ AZUL', 13, 1),
(203, 'HUEJUTLA DE REYES', 13, 1),
(204, 'IXMIQUILPAN', 13, 1),
(205, 'PACHUCA DE SOTO', 13, 1),
(206, 'SANTIAGO TULANTEPEC', 13, 1),
(207, 'TEPEAPULCO', 13, 1),
(208, 'TEPEJI DEL RIO', 13, 1),
(209, 'TIZAYUCA', 13, 1),
(210, 'TLAXCOAPAN', 13, 1),
(211, 'TULA DE ALLENDE', 13, 1),
(212, 'TULANCINGO', 13, 1),
(213, 'ZIMAPAN', 13, 1),
(214, 'ACATLÁN DE JUÁREZ', 14, 1),
(215, 'AHUALULCO DE MERCADO', 14, 1),
(216, 'AJIJIC', 14, 1),
(217, 'AMECA', 14, 1),
(218, 'ARANDAS', 14, 1),
(219, 'ATOTONILCO EL ALTO', 14, 1),
(220, 'AUTLÁN DE NAVARRO', 14, 1),
(221, 'CHAPALA', 14, 1),
(222, 'CIHUATLÁN', 14, 1),
(223, 'CIUDAD GUZMÁN', 14, 1),
(224, 'COCULA', 14, 1),
(225, 'COLOTLÁN', 14, 1),
(226, 'EL GRULLO', 14, 1),
(227, 'EL QUINCE (SAN JOSÉ EL QUINCE)', 14, 1),
(228, 'ETZATLÁN', 14, 1),
(229, 'GUADALAJARA', 14, 1),
(230, 'HUEJUQUILLA EL ALTO', 14, 1),
(231, 'JALOSTOTITLÁN', 14, 1),
(232, 'JAMAY', 14, 1),
(233, 'JOCOTEPEC', 14, 1),
(234, 'LA BARCA', 14, 1),
(235, 'LA RESOLANA', 14, 1),
(236, 'LAGOS DE MORENO', 14, 1),
(237, 'LAS PINTITAS', 14, 1),
(238, 'MAGDALENA', 14, 1),
(239, 'OCOTLÁN', 14, 1),
(240, 'PONCITLÁN', 14, 1),
(241, 'PUERTO VALLARTA', 14, 1),
(242, 'SAN DIEGO DE ALEJANDRÍA', 14, 1),
(243, 'SAN IGNACIO CERRO GORDO', 14, 1),
(244, 'SAN JOSÉ EL VERDE (EL VERDE)', 14, 1),
(245, 'SAN JUAN DE LOS LAGOS', 14, 1),
(246, 'SAN JULIÁN', 14, 1),
(247, 'SAN MIGUEL EL ALTO', 14, 1),
(248, 'SAYULA', 14, 1),
(249, 'TALA', 14, 1),
(250, 'TALPA DE ALLENDE', 14, 1),
(251, 'TAMAZULA DE GORDIANO', 14, 1),
(252, 'TECALITLÁN', 14, 1),
(253, 'TEOCALTICHE', 14, 1),
(254, 'TEPATITLÁN DE MORELOS', 14, 1),
(255, 'TEQUILA', 14, 1),
(256, 'TLAJOMULCO DE ZÚÑIGA', 14, 1),
(257, 'TLAQUEPAQUE', 14, 1),
(258, 'TONALÁ', 14, 1),
(259, 'TOTOTLÁN', 14, 1),
(260, 'TUXPAN', 14, 1),
(261, 'UNIÓN DE SAN ANTONIO', 14, 1),
(262, 'VALLE DE GUADALUPE', 14, 1),
(263, 'VILLA CORONA', 14, 1),
(264, 'VILLA HIDALGO', 14, 1),
(265, 'YAHUALICA DE GONZÁLEZ GALLO', 14, 1),
(266, 'ZACOALCO DE TORRES', 14, 1),
(267, 'ZAPOPAN', 14, 1),
(268, 'ZAPOTILTIC', 14, 1),
(269, 'ALMOLOYA DE JUÁREZ', 15, 1),
(270, 'AMATEPEC', 15, 1),
(271, 'CAPULHUAC', 15, 1),
(272, 'CHALCO DE DÍAZ COVARRUBIAS', 15, 1),
(273, 'CHICONCUAC', 15, 1),
(274, 'CHIMALHUACÁN', 15, 1),
(275, 'CIUDAD ADOLFO LÓPEZ MATEOS', 15, 1),
(276, 'CIUDAD NEZAHUALCOYOTL', 15, 1),
(277, 'COACALCO DE BERRIOZABAL', 15, 1),
(278, 'CUAUTITLÁN', 15, 1),
(279, 'CUAUTITLÁN IZCALLI', 15, 1),
(280, 'ECATEPEC DE MORELOS', 15, 1),
(281, 'HUIXQUILUCAN DE DEGOLLADO', 15, 1),
(282, 'IXTAPALUCA', 15, 1),
(283, 'JUCHITEPEC DE MARIANO RIVA PALACIO', 15, 1),
(284, 'LOS REYES ACAQUILPAN (LA PAZ)', 15, 1),
(285, 'MELCHOR OCAMPO', 15, 1),
(286, 'METEPEC', 15, 1),
(287, 'NAUCALPAN DE JUÁREZ', 15, 1),
(288, 'OCOYOACAC', 15, 1),
(289, 'SAN MATEO ATENCO', 15, 1),
(290, 'SAN VICENTE CHICOLOAPAN DE JUÁREZ', 15, 1),
(291, 'SANTA MARIA TULTEPEC', 15, 1),
(292, 'TECAMAC DE FELIPE VILLANUEVA', 15, 1),
(293, 'TEJUPILCO DE HIDALGO', 15, 1),
(294, 'TEPOTZOTLÁN', 15, 1),
(295, 'TEQUIXQUIAC', 15, 1),
(296, 'TEXCOCO DE MORA', 15, 1),
(297, 'TLALNEPANTLA DE BAZ', 15, 1),
(298, 'TOLUCA DE LERDO', 15, 1),
(299, 'TULTITLÁN DE MARIANO ESCOBEDO', 15, 1),
(300, 'VALLE DE CHALCO SOLIDARIDAD', 15, 1),
(301, 'VILLA NICOLÁS ROMERO', 15, 1),
(302, 'XONACATLÁN', 15, 1),
(303, 'ZUMPANGO', 15, 1),
(304, 'APATZINGÁN DE LA CONSTITUCIÓN', 16, 1),
(305, 'CIUDAD HIDALGO', 16, 1),
(306, 'CIUDAD LÁZARO CÁRDENAS', 16, 1),
(307, 'COTIJA DE LA PAZ', 16, 1),
(308, 'CUITZEO DEL PORVENIR', 16, 1),
(309, 'HEROICA ZITÁCUARO', 16, 1),
(310, 'HUETAMO DE NÚÑEZ', 16, 1),
(311, 'JACONA DE PLANCARTE', 16, 1),
(312, 'JIQUILPAN DE JUÁREZ', 16, 1),
(313, 'LA PIEDAD DE CABADAS', 16, 1),
(314, 'LAS GUACAMAYAS', 16, 1),
(315, 'LOS REYES DE SALGADO', 16, 1),
(316, 'MARAVATÍO DE OCAMPO', 16, 1),
(317, 'MORELIA', 16, 1),
(318, 'NUEVA ITALIA DE RUIZ', 16, 1),
(319, 'PARACHO DE VERDUZCO', 16, 1),
(320, 'PÁTZCUARO', 16, 1),
(321, 'PURUÁNDIRO', 16, 1),
(322, 'SAHUAYO DE MORELOS', 16, 1),
(323, 'TACÁMBARO DE CODALLOS', 16, 1),
(324, 'TANGANCÍCUARO DE ARISTA', 16, 1),
(325, 'TUXPAN', 16, 1),
(326, 'URUAPAN', 16, 1),
(327, 'YURÉCUARO', 16, 1),
(328, 'ZACAPU', 16, 1),
(329, 'ZAMORA DE HIDALGO', 16, 1),
(330, 'ZINAPÉCUARO DE FIGUEROA', 16, 1),
(331, 'CUAUTLA (CUAUTLA DE MORELOS)', 17, 1),
(332, 'CUERNAVACA', 17, 1),
(333, 'GALEANA', 17, 1),
(334, 'JOJUTLA', 17, 1),
(335, 'PUENTE DE IXTLA', 17, 1),
(336, 'SANTA ROSA TREINTA', 17, 1),
(337, 'TLAQUILTENANGO', 17, 1),
(338, 'ZACATEPEC DE HIDALGO', 17, 1),
(339, 'ACAPONETA', 18, 1),
(340, 'AHUACATLÁN', 18, 1),
(341, 'BUCERÍAS', 18, 1),
(342, 'COMPOSTELA', 18, 1),
(343, 'FRANCISCO I. MADERO (PUGA)', 18, 1),
(344, 'IXTLÁN DEL RÍO', 18, 1),
(345, 'JALA', 18, 1),
(346, 'LA PEÑITA DE JALTEMBA', 18, 1),
(347, 'LAS VARAS', 18, 1),
(348, 'RUIZ', 18, 1),
(349, 'SAN BLAS', 18, 1),
(350, 'SAN PEDRO LAGUNILLAS', 18, 1),
(351, 'SANTIAGO IXCUINTLA', 18, 1),
(352, 'TECUALA', 18, 1),
(353, 'TEPIC', 18, 1),
(354, 'TUXPAN', 18, 1),
(355, 'VILLA HIDALGO (EL NUEVO)', 18, 1),
(356, 'XALISCO', 18, 1),
(357, 'ANÁHUAC', 19, 1),
(358, 'CADEREYTA JIMÉNEZ', 19, 1),
(359, 'CIÉNEGA DE FLORES', 19, 1),
(360, 'CIUDAD APODACA', 19, 1),
(361, 'CIUDAD BENITO JUÁREZ', 19, 1),
(362, 'CIUDAD GENERAL ESCOBEDO', 19, 1),
(363, 'CIUDAD SABINAS HIDALGO', 19, 1),
(364, 'CIUDAD SANTA CATARINA', 19, 1),
(365, 'CIUDAD SANTA CATARINA', 19, 1),
(366, 'DOCTOR ARROYO', 19, 1),
(367, 'EL CERCADO', 19, 1),
(368, 'GARCÍA', 19, 1),
(369, 'GUADALUPE', 19, 1),
(370, 'HUALAHUISES', 19, 1),
(371, 'LINARES', 19, 1),
(372, 'MONTEMORELOS', 19, 1),
(373, 'MONTERREY', 19, 1),
(374, 'SAN NICOLÁS DE LOS GARZA', 19, 1),
(375, 'SAN PEDRO GARZA GARCÍA', 19, 1),
(376, 'SANTIAGO', 19, 1),
(377, 'ASUNCIÓN NOCHIXTLÁN', 20, 1),
(378, 'BAHIAS DE HUATULCO', 20, 1),
(379, 'CHAHUITES', 20, 1),
(380, 'CIUDAD IXTEPEC', 20, 1),
(381, 'COSOLAPA', 20, 1),
(382, 'CUILÁPAM DE GUERRERO', 20, 1),
(383, 'EL CAMARÓN', 20, 1),
(384, 'EL ROSARIO', 20, 1),
(385, 'HEROICA CIUDAD DE EJUTLA DE CRESPO', 20, 1),
(386, 'HEROICA CIUDAD DE HUAJUAPAN DE LEÓN', 20, 1),
(387, 'HEROICA CIUDAD DE TLAXIACO', 20, 1),
(388, 'JUCHITÁN (JUCHITÁN DE ZARAGOZA)', 20, 1),
(389, 'LAGUNAS', 20, 1),
(390, 'LOMA BONITA', 20, 1),
(391, 'MARISCALA DE JUÁREZ', 20, 1),
(392, 'MATÍAS ROMERO AVENDAÑO', 20, 1),
(393, 'MIAHUATLÁN DE PORFIRIO DÍAZ', 20, 1),
(394, 'NATIVIDAD', 20, 1),
(395, 'OAXACA DE JUÁREZ', 20, 1),
(396, 'OCOTLÁN DE MORELOS', 20, 1),
(397, 'PUERTO ESCONDIDO', 20, 1),
(398, 'PUTLA VILLA DE GUERRERO', 20, 1),
(399, 'RÍO GRANDE O PIEDRA PARADA', 20, 1),
(400, 'SALINA CRUZ', 20, 1),
(401, 'SAN ANTONIO DE LA CAL', 20, 1),
(402, 'SAN BLAS ATEMPA', 20, 1),
(403, 'SAN FELIPE JALAPA DE DÍAZ', 20, 1),
(404, 'SAN FRANCISCO IXHUATÁN', 20, 1),
(405, 'SAN FRANCISCO TELIXTLAHUACA', 20, 1),
(406, 'SAN JUAN BAUTISTA CUICATLÁN', 20, 1),
(407, 'SAN JUAN BAUTISTA LO DE SOTO', 20, 1),
(408, 'SAN JUAN BAUTISTA TUXTEPEC', 20, 1),
(409, 'SAN JUAN BAUTISTA VALLE NACIONAL', 20, 1),
(410, 'SAN JUAN CACAHUATEPEC', 20, 1),
(411, 'SAN MIGUEL EL GRANDE', 20, 1),
(412, 'SAN PABLO HUITZO', 20, 1),
(413, 'SAN PABLO VILLA DE MITLA', 20, 1),
(414, 'SAN PEDRO MIXTEPEC -DTO. 22-', 20, 1),
(415, 'SAN PEDRO POCHUTLA', 20, 1),
(416, 'SAN PEDRO TAPANATEPEC', 20, 1),
(417, 'SAN PEDRO TOTOLAPA', 20, 1),
(418, 'SAN SEBASTIÁN TECOMAXTLAHUACA', 20, 1),
(419, 'SANTA CRUZ ITUNDUJIA', 20, 1),
(420, 'SANTA LUCIA DEL CAMINO', 20, 1),
(421, 'SANTA MARÍA HUATULCO', 20, 1),
(422, 'SANTIAGO JAMILTEPEC', 20, 1),
(423, 'SANTIAGO JUXTLAHUACA', 20, 1),
(424, 'SANTIAGO PINOTEPA NACIONAL', 20, 1),
(425, 'SANTIAGO SUCHILQUITONGO', 20, 1),
(426, 'SANTO DOMINGO TEHUANTEPEC', 20, 1),
(427, 'TEOTITLÁN DE FLORES MAGÓN', 20, 1),
(428, 'TLACOLULA DE MATAMOROS', 20, 1),
(429, 'UNIÓN HIDALGO', 20, 1),
(430, 'VICENTE CAMALOTE', 20, 1),
(431, 'VILLA DE TAMAZULÁPAM DEL PROGRESO', 20, 1),
(432, 'VILLA DE ZAACHILA', 20, 1),
(433, 'VILLA SOLA DE VEGA', 20, 1),
(434, 'ZIMATLÁN DE ÁLVAREZ', 20, 1),
(435, 'ACATLÁN DE OSORIO', 21, 1),
(436, 'AMOZOC', 21, 1),
(437, 'ATLIXCO', 21, 1),
(438, 'CIUDAD SERDÁN', 21, 1),
(439, 'CUAUTLANCINGO', 21, 1),
(440, 'HUAUCHINANGO', 21, 1),
(441, 'IZÚCAR DE MATAMOROS', 21, 1),
(442, 'PUEBLA (HEROICA PUEBLA)', 21, 1),
(443, 'SAN ANDRÉS CHOLULA', 21, 1),
(444, 'SAN MARTÍN TEXMELUCAN DE LABASTIDA', 21, 1),
(445, 'SAN PEDRO CHOLULA', 21, 1),
(446, 'TECAMACHALCO', 21, 1),
(447, 'TEHUACAN', 21, 1),
(448, 'TEPEACA', 21, 1),
(449, 'TEZIUTLAN', 21, 1),
(450, 'XICOTEPEC', 21, 1),
(451, 'ZACATLÁN', 21, 1),
(452, 'EL PUEBLITO', 22, 1),
(453, 'QUERÉTARO', 22, 1),
(454, 'SAN JUAN DEL RIO', 22, 1),
(455, 'BACALAR', 23, 1),
(456, 'CANCÚN', 23, 1),
(457, 'CHETUMAL', 23, 1),
(458, 'COZUMEL', 23, 1),
(459, 'FELIPE CARRILLO PUERTO', 23, 1),
(460, 'ISLA MUJERES', 23, 1),
(461, 'KANTUNILKÍN', 23, 1),
(462, 'PLAYA DEL CARMEN', 23, 1),
(463, 'CÁRDENAS', 24, 1),
(464, 'CEDRAL', 24, 1),
(465, 'CERRITOS', 24, 1),
(466, 'CHARCAS', 24, 1),
(467, 'CIUDAD DEL MAÍZ', 24, 1),
(468, 'CIUDAD VALLES', 24, 1),
(469, 'ÉBANO', 24, 1),
(470, 'EL NARANJO', 24, 1),
(471, 'FRACCIÓN EL REFUGIO', 24, 1),
(472, 'MATEHUALA', 24, 1),
(473, 'RIOVERDE', 24, 1),
(474, 'SALINAS DE HIDALGO', 24, 1),
(475, 'SAN LUIS POTOSÍ', 24, 1),
(476, 'SANTA MARÍA DEL RÍO', 24, 1),
(477, 'SOLEDAD DE GRACIANO SÁNCHEZ', 24, 1),
(478, 'TAMASOPO', 24, 1),
(479, 'TAMAZUNCHALE', 24, 1),
(480, 'TAMUIN', 24, 1),
(481, 'TIERRA NUEVA', 24, 1),
(482, 'VILLA DE REYES', 24, 1),
(483, 'AGUARUTO', 25, 1),
(484, 'AHOME', 25, 1),
(485, 'ANGOSTURA', 25, 1),
(486, 'CHOIX', 25, 1),
(487, 'COSALÁ', 25, 1),
(488, 'CULIACÁN ROSALES', 25, 1),
(489, 'EL ROSARIO', 25, 1),
(490, 'ESCUINAPA DE HIDALGO', 25, 1),
(491, 'ESTACIÓN NARANJO', 25, 1),
(492, 'GUAMÚCHIL', 25, 1),
(493, 'GUASAVE', 25, 1),
(494, 'HIGUERA DE ZARAGOZA', 25, 1),
(495, 'LA CRUZ', 25, 1),
(496, 'LIC. BENITO JUÁREZ (CAMPO GOBIERNO)', 25, 1),
(497, 'LOS MOCHIS', 25, 1),
(498, 'MAZATLÁN', 25, 1),
(499, 'MOCORITO', 25, 1),
(500, 'NAVOLATO', 25, 1),
(501, 'QUILA', 25, 1),
(502, 'SAN BLAS', 25, 1),
(503, 'SAN IGNACIO', 25, 1),
(504, 'SINALOA DE LEYVA', 25, 1),
(505, 'TOPOLOBAMPO', 25, 1),
(506, 'VILLA UNIÓN', 25, 1),
(507, 'AGUA PRIETA', 26, 1),
(508, 'CIUDAD OBREGÓN', 26, 1),
(509, 'EMPALME', 26, 1),
(510, 'HERMOSILLO', 26, 1),
(511, 'HEROICA CABORCA', 26, 1),
(512, 'HEROICA CIUDAD DE CANANEA', 26, 1),
(513, 'HEROICA GUAYMAS', 26, 1),
(514, 'HEROICA NOGALES', 26, 1),
(515, 'HUATABAMPO', 26, 1),
(516, 'MAGDALENA DE KINO', 26, 1),
(517, 'NAVOJOA', 26, 1),
(518, 'PUERTO PEÑASCO', 26, 1),
(519, 'SAN LUIS RÍO COLORADO', 26, 1),
(520, 'SONOITA', 26, 1),
(521, 'CÁRDENAS', 27, 1),
(522, 'COMALCALCO', 27, 1),
(523, 'CUNDUACÁN', 27, 1),
(524, 'EMILIANO ZAPATA', 27, 1),
(525, 'FRONTERA', 27, 1),
(526, 'HUIMANGUILLO', 27, 1),
(527, 'JALPA DE MÉNDEZ', 27, 1),
(528, 'MACUSPANA', 27, 1),
(529, 'PARAÍSO', 27, 1),
(530, 'TEAPA', 27, 1),
(531, 'TENOSIQUE DE PINO SUÁREZ', 27, 1),
(532, 'VILLAHERMOSA', 27, 1),
(533, 'ALTAMIRA', 28, 1),
(534, 'CIUDAD CAMARGO', 28, 1),
(535, 'CIUDAD GUSTAVO DÍAZ ORDAZ', 28, 1),
(536, 'CIUDAD MADERO', 28, 1),
(537, 'CIUDAD MANTE', 28, 1),
(538, 'CIUDAD MIGUEL ALEMÁN', 28, 1),
(539, 'CIUDAD RÍO BRAVO', 28, 1),
(540, 'CIUDAD TULA', 28, 1),
(541, 'CIUDAD VICTORIA', 28, 1),
(542, 'ESTACIÓN MANUEL (ÚRSULO GALVÁN)', 28, 1),
(543, 'GONZÁLEZ', 28, 1),
(544, 'HEROICA MATAMOROS', 28, 1),
(545, 'JAUMAVE', 28, 1),
(546, 'NUEVA CIUDAD GUERRERO', 28, 1),
(547, 'NUEVO LAREDO', 28, 1),
(548, 'REYNOSA', 28, 1),
(549, 'SAN FERNANDO', 28, 1),
(550, 'SOTO LA MARINA', 28, 1),
(551, 'TAMPICO', 28, 1),
(552, 'VALLE HERMOSO', 28, 1),
(553, 'XICOTÉNCATL', 28, 1),
(554, 'APIZACO', 29, 1),
(555, 'CALPULALPAN', 29, 1),
(556, 'CHIAUTEMPAN', 29, 1),
(557, 'HUAMANTLA', 29, 1),
(558, 'TLAXCALA (TLAXCALA DE XICOTENCATL)', 29, 1),
(559, 'VILLA VICENTE GUERRERO', 29, 1),
(560, 'ACAYUCAN', 30, 1),
(561, 'AGUA DULCE', 30, 1),
(562, 'ALTOTONGA', 30, 1),
(563, 'ALVARADO', 30, 1),
(564, 'ÁNGEL R. CABADA', 30, 1),
(565, 'ATOYAC', 30, 1),
(566, 'BANDERILLA', 30, 1),
(567, 'BOCA DEL RÍO', 30, 1),
(568, 'CARLOS A. CARRILLO', 30, 1),
(569, 'CATEMACO', 30, 1),
(570, 'CAZONES DE HERRERA', 30, 1),
(571, 'CERRO AZUL', 30, 1),
(572, 'COATEPEC', 30, 1),
(573, 'COATZACOALCOS', 30, 1),
(574, 'COATZINTLA', 30, 1),
(575, 'CÓRDOBA', 30, 1),
(576, 'COSAMALOAPAN', 30, 1),
(577, 'COSOLEACAQUE', 30, 1),
(578, 'CUICHAPA', 30, 1),
(579, 'CUITLÁHUAC', 30, 1),
(580, 'EL HIGO', 30, 1),
(581, 'FORTÍN DE LAS FLORES', 30, 1),
(582, 'GENERAL MIGUEL ALEMÁN (POTRERO NUEVO)', 30, 1),
(583, 'GUTIÉRREZ ZAMORA', 30, 1),
(584, 'HUATUSCO DE CHICUELLAR', 30, 1),
(585, 'HUAYACOCOTLA', 30, 1),
(586, 'HUILOAPAN DE CUAUHTÉMOC', 30, 1),
(587, 'ISLA', 30, 1),
(588, 'IXTACZOQUITLÁN', 30, 1),
(589, 'JÁLTIPAN DE MORELOS', 30, 1),
(590, 'JOSÉ CARDEL', 30, 1),
(591, 'JUAN DÍAZ COVARRUBIAS', 30, 1),
(592, 'JUAN RODRÍGUEZ CLARA', 30, 1),
(593, 'LAS CHOAPAS', 30, 1),
(594, 'LERDO DE TEJADA', 30, 1),
(595, 'MINATITLÁN', 30, 1),
(596, 'NARANJOS', 30, 1),
(597, 'NOGALES', 30, 1),
(598, 'ORIZABA', 30, 1),
(599, 'PÁNUCO', 30, 1),
(600, 'PAPANTLA DE OLARTE', 30, 1),
(601, 'PARAJE NUEVO', 30, 1),
(602, 'PASO DE OVEJAS', 30, 1),
(603, 'PASO DEL MACHO', 30, 1),
(604, 'PLATÓN SÁNCHEZ', 30, 1),
(605, 'PLAYA VICENTE', 30, 1),
(606, 'POZA RICA DE HIDALGO', 30, 1),
(607, 'RÍO BLANCO', 30, 1),
(608, 'SAN ANDRÉS TUXTLA', 30, 1),
(609, 'SAN RAFAEL', 30, 1),
(610, 'SANTIAGO TUXTLA', 30, 1),
(611, 'SIHUAPAN', 30, 1),
(612, 'SOLEDAD DE DOBLADO', 30, 1),
(613, 'TAMPICO ALTO', 30, 1),
(614, 'TANTOYUCA', 30, 1),
(615, 'TEMPOAL DE SÁNCHEZ', 30, 1),
(616, 'TEZONAPA', 30, 1),
(617, 'TIERRA BLANCA', 30, 1),
(618, 'TIHUATLÁN', 30, 1),
(619, 'TLACOJALPAN', 30, 1),
(620, 'TLAPACOYAN', 30, 1),
(621, 'TRES VALLES', 30, 1),
(622, 'TÚXPAM DE RODRÍGUEZ CANO', 30, 1),
(623, 'VERACRUZ', 30, 1),
(624, 'XALAPA-ENRÍQUEZ', 30, 1),
(625, 'YECUATLA', 30, 1),
(626, 'KANASÍN', 31, 1),
(627, 'MÉRIDA', 31, 1),
(628, 'MOTUL DE CARRILLO PUERTO', 31, 1),
(629, 'TICUL', 31, 1),
(630, 'TIZIMÍN', 31, 1),
(631, 'VALLADOLID', 31, 1),
(632, 'CIUDAD CUAUHTÉMOC', 32, 1),
(633, 'FRESNILLO', 32, 1),
(634, 'GUADALUPE', 32, 1),
(635, 'JALPA', 32, 1),
(636, 'JEREZ DE GARCÍA SALINAS', 32, 1),
(637, 'JUAN ALDAMA', 32, 1),
(638, 'LORETO', 32, 1),
(639, 'LUIS MOYA', 32, 1),
(640, 'MOYAHUA DE ESTRADA', 32, 1),
(641, 'NOCHISTLÁN DE MEJÍA', 32, 1),
(642, 'OJOCALIENTE', 32, 1),
(643, 'RÍO GRANDE', 32, 1),
(644, 'SOMBRERETE', 32, 1),
(645, 'VALPARAÍSO', 32, 1),
(646, 'VÍCTOR ROSALES', 32, 1),
(647, 'VILLA DE COS', 32, 1),
(648, 'VILLA HIDALGO', 32, 1),
(649, 'VILLANUEVA', 32, 1),
(650, 'ZACATECAS', 32, 1);

--
-- Disparadores `ciudad`
--
DROP TRIGGER IF EXISTS `bit_D_ciudad`;
DELIMITER //
CREATE TRIGGER `bit_D_ciudad` AFTER DELETE ON `ciudad`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *ciudad*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro_old
)
VALUES (
'ciudad', OLD.users_id, 'D', curdate( ) , concat_WS( '|', 
OLD.ciudad, 
OLD.descripcion, 
OLD.estado ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_ciudad`;
DELIMITER //
CREATE TRIGGER `bit_I_ciudad` AFTER INSERT ON `ciudad`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *ciudad*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro
)
VALUES (
'ciudad', NEW.users_id, 'I', curdate( ) , concat_WS( '|', 
NEW.ciudad, 
NEW.descripcion, 
NEW.estado ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_ciudad`;
DELIMITER //
CREATE TRIGGER `bit_U_ciudad` AFTER UPDATE ON `ciudad`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al MODIFICAR REGISTRO en *ciudad*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro,
registro_old
)
VALUES (
'ciudad', NEW.users_id, 'U', curdate( ) , 
concat_WS( '|', NEW.ciudad, NEW.descripcion, NEW.estado),
concat_WS( '|', OLD.ciudad, OLD.descripcion, OLD.estado)  
);

END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `coordinaciona`
--

CREATE TABLE IF NOT EXISTS `coordinaciona` (
  `coordinaciona` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id Coordinación',
  `descripcion` varchar(70) NOT NULL COMMENT 'Descripción Coordinación',
  `programaedu` int(11) NOT NULL COMMENT 'Codigo carrera',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`coordinaciona`),
  UNIQUE KEY `CO_codigo_UNIQUE` (`coordinaciona`) USING BTREE,
  KEY `fk_coordinaciona_programaedu1_idx` (`programaedu`),
  KEY `fk_coordinaciona_users1_idx` (`users_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

--
-- Volcado de datos para la tabla `coordinaciona`
--

INSERT INTO `coordinaciona` (`coordinaciona`, `descripcion`, `programaedu`, `users_id`) VALUES
(1, 'CONTABILIDAD BASICA', 6, 1),
(2, 'CONTABILIDAD AVANZADA', 6, 1),
(3, 'CONTABILIDAD DE COSTOS', 6, 1),
(4, 'FINANZAS', 6, 1),
(5, 'AUDITORIA', 6, 1),
(6, 'IMPUESTOS', 6, 1),
(7, 'MERCADOTECNIA', 6, 1),
(8, 'RECURSOS HUMANOS', 6, 1),
(9, 'PRODUCCION', 6, 1),
(10, 'ADMINISTRACION BASICA', 6, 1),
(11, 'ADMINISTRACION AVANZADA', 6, 1),
(12, 'INFORMATICA', 6, 1),
(13, 'MATEMATICAS', 6, 1),
(14, 'CIENCIAS COMPUTACIONALES', 6, 1),
(15, 'SISTEMAS DE INFORMACION', 6, 1),
(16, 'PROGRAMACION', 6, 1),
(17, 'ECONOMIA', 6, 1),
(18, 'COMERCIO EXTERIOR', 6, 1),
(19, 'DERECHO', 6, 1),
(20, 'EMPRENDEDORES', 6, 1),
(21, 'ASIGNATURAS DE APOYO', 6, 1),
(22, 'SIN COORDINACION', 6, 1);

--
-- Disparadores `coordinaciona`
--
DROP TRIGGER IF EXISTS `bit_D_coordinaciona`;
DELIMITER //
CREATE TRIGGER `bit_D_coordinaciona` AFTER DELETE ON `coordinaciona`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *coordinaciona*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro_old
)
VALUES (
'coordinaciona', OLD.users_id, 'D', curdate( ) , concat_WS( '|', 
OLD.coordinaciona, 
OLD.descripcion, 
OLD.programaedu ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_coordinaciona`;
DELIMITER //
CREATE TRIGGER `bit_I_coordinaciona` AFTER INSERT ON `coordinaciona`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *coordinaciona*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro
)
VALUES (
'coordinaciona', NEW.users_id, 'I', curdate( ) , concat_WS( '|', 
NEW.coordinaciona, 
NEW.descripcion, 
NEW.programaedu ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_coordinaciona`;
DELIMITER //
CREATE TRIGGER `bit_U_coordinaciona` AFTER UPDATE ON `coordinaciona`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al MODIFICAR REGISTRO en *coordinaciona*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro,registro_old
)
VALUES (
'coordinaciona', NEW.users_id, 'U', curdate( ) , concat_WS( '|', NEW.coordinaciona, NEW.descripcion, NEW.programaedu ),
 concat_WS( '|', OLD.coordinaciona, OLD.descripcion, OLD.programaedu )  
);

END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleseriacion`
--

CREATE TABLE IF NOT EXISTS `detalleseriacion` (
  `programaedu` int(11) NOT NULL COMMENT 'prog edu',
  `uaprendizaje` int(11) NOT NULL COMMENT 'U aprendizaje',
  `reqseriacion` int(11) NOT NULL COMMENT 'Reqseriación',
  `uaprequisito` int(11) NOT NULL COMMENT 'Uap requisito',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`programaedu`,`uaprendizaje`,`uaprequisito`),
  KEY `fk_detalleseriacion_uaprendizaje2_idx` (`uaprequisito`),
  KEY `fk_detalleseriacion_users1_idx` (`users_id`),
  KEY `fk_detalleseriacion_reqseriacion1_idx` (`reqseriacion`),
  KEY `fk_detalleseriacion_pua_idx` (`programaedu`,`uaprendizaje`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `detalleseriacion`
--

INSERT INTO `detalleseriacion` (`programaedu`, `uaprendizaje`, `reqseriacion`, `uaprequisito`, `users_id`) VALUES
(1, 11237, 1, 11236, 1),
(1, 11241, 1, 11237, 1),
(2, 11241, 1, 11237, 1),
(3, 11237, 1, 11236, 1),
(3, 11241, 1, 11237, 1),
(4, 11241, 1, 11237, 1),
(4, 11270, 1, 11236, 1),
(4, 11270, 1, 11237, 1),
(5, 11241, 1, 11237, 1),
(7, 11241, 1, 11237, 1);

--
-- Disparadores `detalleseriacion`
--
DROP TRIGGER IF EXISTS `bit_D_detalleseriacion`;
DELIMITER //
CREATE TRIGGER `bit_D_detalleseriacion` AFTER DELETE ON `detalleseriacion`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *detalleseriacion*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro_old
)
VALUES (
'detalleseriacion', OLD.users_id, 'D', curdate( ) , concat_WS( '|', 
  OLD.uaprendizaje,
  OLD.programaedu,
  OLD.uaprequisito,
  OLD.reqseriacion) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_detalleseriacion`;
DELIMITER //
CREATE TRIGGER `bit_I_detalleseriacion` AFTER INSERT ON `detalleseriacion`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *detalleseriacion*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro
)
VALUES (
'detalleseriacion', NEW.users_id, 'I', curdate( ) , concat_WS( '|', 
  NEW.uaprendizaje,
  NEW.programaedu,
  NEW.uaprequisito,
  NEW.reqseriacion) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_detalleseriacion`;
DELIMITER //
CREATE TRIGGER `bit_U_detalleseriacion` AFTER UPDATE ON `detalleseriacion`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al MODIFICAR REGISTRO en *detalleseriacion*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro,registro_old
)
VALUES (
'detalleseriacion', NEW.users_id, 'U', curdate( ) , concat_WS( '|',
  NEW.uaprendizaje,
  NEW.programaedu,
  NEW.uaprequisito,
  NEW.reqseriacion),
concat_WS( '|',
  OLD.uaprendizaje,
  OLD.programaedu,
  OLD.uaprequisito,
  OLD.reqseriacion));

END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dias`
--

CREATE TABLE IF NOT EXISTS `dias` (
  `dia` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Consec Dia',
  `descripcion` varchar(9) NOT NULL COMMENT 'Descripcion Dia (Lun,Mar,Mier..)',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`dia`),
  UNIQUE KEY `DI_dia_UNIQUE` (`dia`),
  KEY `fk_dias_users1_idx` (`users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Disparadores `dias`
--
DROP TRIGGER IF EXISTS `bit_D_dias`;
DELIMITER //
CREATE TRIGGER `bit_D_dias` AFTER DELETE ON `dias`
 FOR EACH ROW BEGIN -- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *dias*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro_old
)
VALUES (
'dias', OLD.users_id, 'D', curdate( ) , concat_WS( '|', OLD.dia, OLD.descripcion ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_dias`;
DELIMITER //
CREATE TRIGGER `bit_I_dias` AFTER INSERT ON `dias`
 FOR EACH ROW BEGIN -- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *dias*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro
)
VALUES (
'dias', NEW.users_id, 'I', curdate( ) , concat_WS( '|', 
 NEW.dia, NEW.descripcion ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_dias`;
DELIMITER //
CREATE TRIGGER `bit_U_dias` AFTER UPDATE ON `dias`
 FOR EACH ROW BEGIN -- -----------------------------------------------------
-- Bitacora al MODIFICAR REGISTRO en *dias*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro,registro_old
)
VALUES (
'dias', NEW.users_id, 'U', curdate( ) , 
concat_WS( '|',  NEW.dia, NEW.descripcion ),
concat_WS( '|',  OLD.dia, OLD.descripcion )  
);

END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `disp_hrs_dias`
--

CREATE TABLE IF NOT EXISTS `disp_hrs_dias` (
  `periodo` int(11) NOT NULL COMMENT 'Periodo escolar',
  `id` int(11) NOT NULL COMMENT 'Docente Disponible',
  `dia` int(11) NOT NULL COMMENT 'Dia disponible',
  `hora` int(11) NOT NULL COMMENT 'Hora Disponible',
  `status` int(11) NOT NULL DEFAULT '3',
  `observaciones` varchar(255) DEFAULT NULL,
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`periodo`,`id`,`dia`,`hora`),
  KEY `fk_disp_hrs_dias_periodos1_idx` (`periodo`),
  KEY `fk_disp_hrs_dias_users2_idx` (`id`),
  KEY `fk_disp_hrs_dias_dias2_idx` (`dia`),
  KEY `fk_disp_hrs_dias_horas1_idx` (`hora`),
  KEY `fk_disp_hrs_dias_users1_idx` (`users_id`),
  KEY `fk_disp_hrs_dias_status1` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Disparadores `disp_hrs_dias`
--
DROP TRIGGER IF EXISTS `bit_D_disp_hrs_dias`;
DELIMITER //
CREATE TRIGGER `bit_D_disp_hrs_dias` AFTER DELETE ON `disp_hrs_dias`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *disp_hrs_dias*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro_old
)
VALUES (
'disp_hrs_dias', OLD.users_id, 'D', curdate( ) , concat_WS( '|', 
OLD.periodo, 
OLD.id, 
OLD.dia, 
OLD.hora,
OLD.status,
OLD.observaciones) 
);
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_disp_hrs_dias`;
DELIMITER //
CREATE TRIGGER `bit_I_disp_hrs_dias` AFTER INSERT ON `disp_hrs_dias`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *disp_hrs_dias*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro
)
VALUES (
'disp_hrs_dias', NEW.users_id, 'I', curdate( ) , concat_WS( '|', 
NEW.periodo, 
NEW.id, 
NEW.dia, 
NEW.hora,
NEW.status,
NEW.observaciones ) 
);
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_disp_hrs_dias`;
DELIMITER //
CREATE TRIGGER `bit_U_disp_hrs_dias` AFTER UPDATE ON `disp_hrs_dias`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al MODIFICAR REGISTRO en *disp_hrs_dias*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro,registro_old
)
VALUES (
'disp_hrs_dias', NEW.users_id, 'U', curdate( ) , concat_WS( '|', 
NEW.periodo, 
NEW.id, 
NEW.dia, 
NEW.hora,
NEW.status,
NEW.observaciones),
concat_WS( '|', 
OLD.periodo, 
OLD.id, 
OLD.dia, 
OLD.hora,
OLD.status,
OLD.observaciones)  
);
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `disp_ua`
--

CREATE TABLE IF NOT EXISTS `disp_ua` (
  `periodo` int(11) NOT NULL COMMENT 'Periodo escolar',
  `id` int(11) NOT NULL COMMENT 'Docente disponible',
  `uaprendizaje` int(11) NOT NULL COMMENT 'uac disponible',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`periodo`,`id`,`uaprendizaje`),
  KEY `fk_disp_ua_periodos1_idx` (`periodo`),
  KEY `fk_disp_ua_uaprendizaje1_idx` (`uaprendizaje`),
  KEY `fk_disp_ua_users1_idx` (`users_id`),
  KEY `fk_disp_ua_users2_idx` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Disparadores `disp_ua`
--
DROP TRIGGER IF EXISTS `bit_D_disp_ua`;
DELIMITER //
CREATE TRIGGER `bit_D_disp_ua` AFTER DELETE ON `disp_ua`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *disp_ua*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro_old
)
VALUES (
'disp_ua', OLD.users_id, 'D', curdate( ) , concat_WS( '|',OLD.periodo, OLD.id, OLD.uaprendizaje ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_disp_ua`;
DELIMITER //
CREATE TRIGGER `bit_I_disp_ua` AFTER INSERT ON `disp_ua`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *disp_ua*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro
)
VALUES (
'disp_ua', NEW.users_id, 'I', curdate( ) , concat_WS( '|', NEW.periodo, NEW.id, NEW.uaprendizaje ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_disp_ua`;
DELIMITER //
CREATE TRIGGER `bit_U_disp_ua` AFTER UPDATE ON `disp_ua`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al MODIFICAR REGISTRO en *disp_ua*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro,registro_old
)
VALUES (
'disp_ua', NEW.users_id, 'U', curdate( ) , 
concat_WS( '|', NEW.periodo, NEW.id, NEW.uaprendizaje ),
concat_WS( '|', OLD.periodo, OLD.id, OLD.uaprendizaje )  
);

END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `doctos`
--

CREATE TABLE IF NOT EXISTS `doctos` (
  `docto` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo documento',
  `descripcion` varchar(45) NOT NULL COMMENT 'Descripcion documento (cedula, foto, certificado, curso, etc)',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`docto`),
  KEY `fk_doctos_users1_idx` (`users_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Volcado de datos para la tabla `doctos`
--

INSERT INTO `doctos` (`docto`, `descripcion`, `users_id`) VALUES
(1, 'foto', 1),
(2, 'licenciatura1', 1),
(3, 'licenciatura2', 1),
(4, 'maestria1', 1),
(5, 'maestria2', 1),
(6, 'doctorado1', 1),
(7, 'doctorado2', 1),
(8, 'especialidad1', 1),
(9, 'especialidad2', 1);

--
-- Disparadores `doctos`
--
DROP TRIGGER IF EXISTS `bit_D_doctos`;
DELIMITER //
CREATE TRIGGER `bit_D_doctos` AFTER DELETE ON `doctos`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *doctos*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro_old
)
VALUES (
'doctos', OLD.users_id, 'D', curdate( ) , concat_WS( '|', OLD.docto, OLD.descripcion ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_doctos`;
DELIMITER //
CREATE TRIGGER `bit_I_doctos` AFTER INSERT ON `doctos`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *doctos*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro
)
VALUES (
'doctos', NEW.users_id, 'I', curdate( ) , concat_WS( '|', NEW.docto, NEW.descripcion ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_doctos`;
DELIMITER //
CREATE TRIGGER `bit_U_doctos` AFTER UPDATE ON `doctos`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al MODIFICAR REGISTRO en *doctos*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro,registro_old
)
VALUES (
'doctos', NEW.users_id, 'U', curdate( ) , 
concat_WS( '|', NEW.docto, NEW.descripcion ) ,
concat_WS( '|', OLD.docto, OLD.descripcion ) 
);

END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documentos_emp`
--

CREATE TABLE IF NOT EXISTS `documentos_emp` (
  `docto` int(11) NOT NULL COMMENT 'Codigo documento',
  `id` int(11) NOT NULL COMMENT 'Codigo Empleado',
  `ruta` varchar(60) NOT NULL COMMENT 'Ruta fisica docto',
  `observaciones` varchar(60) DEFAULT NULL COMMENT 'Observaciones documento',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`docto`,`id`),
  KEY `fk_documentos_emp_users1_idx` (`users_id`),
  KEY `fk_documentos_emp_users2_idx` (`id`),
  KEY `fk_documentos_emp_doctos1_idx` (`docto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `documentos_emp`
--

INSERT INTO `documentos_emp` (`docto`, `id`, `ruta`, `observaciones`, `users_id`) VALUES
(1, 1, 'documentos/fotos/foto_1.jpg', '', 1),
(1, 3, 'documentos/fotos/foto_3.PNG', '', 3);

--
-- Disparadores `documentos_emp`
--
DROP TRIGGER IF EXISTS `bit_D_documentos_emp`;
DELIMITER //
CREATE TRIGGER `bit_D_documentos_emp` AFTER DELETE ON `documentos_emp`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *documentos_emp*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro_old
)
VALUES (
'documentos_emp', OLD.users_id, 'D', curdate( ) , concat_WS( '|', OLD.docto, OLD.id, OLD.ruta, OLD.observaciones ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_documentos_emp`;
DELIMITER //
CREATE TRIGGER `bit_I_documentos_emp` AFTER INSERT ON `documentos_emp`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *documentos_emp*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro
)
VALUES (
'documentos_emp', NEW.users_id, 'I', curdate( ) , concat_WS( '|', NEW.docto, NEW.id, NEW.ruta, NEW.observaciones ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_documentos_emp`;
DELIMITER //
CREATE TRIGGER `bit_U_documentos_emp` AFTER UPDATE ON `documentos_emp`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al MODIFICAR REGISTRO en *documentos_emp*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro,registro_old
)
VALUES (
'documentos_emp', NEW.users_id, 'U', curdate( ) , concat_WS( '|', NEW.docto, NEW.id, NEW.observaciones,NEW.ruta ) ,
 concat_WS( '|', OLD.docto, OLD.id, OLD.ruta, OLD.observaciones ) 
);

END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa_adic`
--

CREATE TABLE IF NOT EXISTS `empresa_adic` (
  `empresa` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Empresa TrabAdic a UABC',
  `descripcion` varchar(45) NOT NULL COMMENT 'Desc TrabAdic a UABC',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`empresa`),
  KEY `fk_empresa_adic_users1_idx` (`users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Disparadores `empresa_adic`
--
DROP TRIGGER IF EXISTS `bit_D_empresa_adic`;
DELIMITER //
CREATE TRIGGER `bit_D_empresa_adic` AFTER DELETE ON `empresa_adic`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *carga*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro_old
)
VALUES ('empresa_adic', OLD.users_id, 'D', curdate( ) , concat_WS( '|', OLD.empresa, OLD.descripcion));
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_empresa_adic`;
DELIMITER //
CREATE TRIGGER `bit_I_empresa_adic` AFTER INSERT ON `empresa_adic`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *carga*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro
)
VALUES ('empresa_adic', NEW.users_id, 'I', curdate( ) , concat_WS( '|', NEW.empresa, NEW.descripcion));
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_empresa_adic`;
DELIMITER //
CREATE TRIGGER `bit_U_empresa_adic` AFTER UPDATE ON `empresa_adic`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al MODIFICAR REGISTRO en *carga*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro,registro_old
)
VALUES ('empresa_adic', NEW.users_id, 'U', curdate( ) , 
concat_WS( '|', NEW.empresa, NEW.descripcion),
concat_WS( '|', OLD.empresa, OLD.descripcion));
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `esp_prog_edu`
--

CREATE TABLE IF NOT EXISTS `esp_prog_edu` (
  `especialidad` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo Especificación Nivel Programa (SOLO POSTGRADO)',
  `descripcion` varchar(45) NOT NULL COMMENT 'Descripción Especificación Nivel Programa',
  `status` char(1) NOT NULL COMMENT 'Status esp nivel programa\n1=Activo',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`especialidad`),
  UNIQUE KEY `ENP_codigo_UNIQUE` (`especialidad`),
  KEY `fk_esp_prog_edu_users1_idx` (`users_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='<double-click to overwrite multiple objects>' AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `esp_prog_edu`
--

INSERT INTO `esp_prog_edu` (`especialidad`, `descripcion`, `status`, `users_id`) VALUES
(1, 'MTIC', '1', 1),
(2, 'MC', '1', 1);

--
-- Disparadores `esp_prog_edu`
--
DROP TRIGGER IF EXISTS `bit_D_esp_prog_edu`;
DELIMITER //
CREATE TRIGGER `bit_D_esp_prog_edu` AFTER DELETE ON `esp_prog_edu`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *esp_prog_edu*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro_old
)
VALUES (
'esp_prog_edu', OLD.users_id, 'D', curdate( ) , concat_WS( '|', OLD.especialidad, OLD.descripcion, OLD.status ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_esp_prog_edu`;
DELIMITER //
CREATE TRIGGER `bit_I_esp_prog_edu` AFTER INSERT ON `esp_prog_edu`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *esp_prog_edu*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro
)
VALUES (
'esp_prog_edu', NEW.users_id, 'I', curdate( ) , concat_WS( '|', NEW.especialidad, NEW.descripcion, NEW.status ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_esp_prog_edu`;
DELIMITER //
CREATE TRIGGER `bit_U_esp_prog_edu` AFTER UPDATE ON `esp_prog_edu`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al MODIFICAR REGISTRO en *esp_prog_edu*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro,registro_old
)
VALUES (
'esp_prog_edu', NEW.users_id, 'U', curdate( ) , 
concat_WS( '|', NEW.especialidad, NEW.descripcion, NEW.status ),
concat_WS( '|', OLD.especialidad, OLD.descripcion, OLD.status )  
);

END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE IF NOT EXISTS `estado` (
  `estado` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo estado',
  `descripcion` char(30) NOT NULL COMMENT 'Descripcion estado',
  `pais` int(11) NOT NULL DEFAULT '144' COMMENT 'Codigo pais',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`estado`),
  UNIQUE KEY `ES_codigo_UNIQUE` (`estado`),
  KEY `fk_estado_pais1_idx` (`pais`),
  KEY `fk_estado_users1_idx` (`users_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='<double-click to overwrite multiple objects>' AUTO_INCREMENT=33 ;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`estado`, `descripcion`, `pais`, `users_id`) VALUES
(1, 'AGUASCALIENTES', 144, 1),
(2, 'BAJA CALIFORNIA', 144, 1),
(3, 'BAJA CALIFORNIA SUR', 144, 1),
(4, 'CAMPECHE', 144, 1),
(5, 'COAHUILA DE ZARAGOZA', 144, 1),
(6, 'COLIMA', 144, 1),
(7, 'CHIAPAS', 144, 1),
(8, 'CHIHUAHUA', 144, 1),
(9, 'DISTRITO FEDERAL', 144, 1),
(10, 'DURANGO', 144, 1),
(11, 'GUANAJUATO', 144, 1),
(12, 'GUERRERO', 144, 1),
(13, 'HIDALGO', 144, 1),
(14, 'JALISCO', 144, 1),
(15, 'MEXICO', 144, 1),
(16, 'MICHOACAN DE OCAMPO', 144, 1),
(17, 'MORELOS', 144, 1),
(18, 'NAYARIT', 144, 1),
(19, 'NUEVO LEON', 144, 1),
(20, 'OAXACA', 144, 1),
(21, 'PUEBLA', 144, 1),
(22, 'QUERETARO', 144, 1),
(23, 'QUINTANA ROO', 144, 1),
(24, 'SAN LUIS POTOSI', 144, 1),
(25, 'SINALOA', 144, 1),
(26, 'SONORA', 144, 1),
(27, 'TABASCO', 144, 1),
(28, 'TAMAULIPAS', 144, 1),
(29, 'TLAXCALA', 144, 1),
(30, 'VERACRUZ', 144, 1),
(31, 'YUCATAN', 144, 1),
(32, 'ZACATECAS', 144, 1);

--
-- Disparadores `estado`
--
DROP TRIGGER IF EXISTS `bit_D_estado`;
DELIMITER //
CREATE TRIGGER `bit_D_estado` AFTER DELETE ON `estado`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *estado*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro_old
)
VALUES (
'estado', OLD.users_id, 'D', curdate( ) , concat_WS( '|', OLD.estado, OLD.descripcion, OLD.pais ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_estado`;
DELIMITER //
CREATE TRIGGER `bit_I_estado` AFTER INSERT ON `estado`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *estado*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro
)
VALUES (
'estado', NEW.users_id, 'I', curdate( ) , concat_WS( '|', NEW.estado, NEW.descripcion, NEW.pais ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_estado`;
DELIMITER //
CREATE TRIGGER `bit_U_estado` AFTER UPDATE ON `estado`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al MODIFICAR REGISTRO en *estado*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro,registro_old
)
VALUES (
'estado', NEW.users_id, 'U', curdate( ) , 
concat_WS( '|', NEW.estado, NEW.descripcion, NEW.pais ),
concat_WS( '|', OLD.estado, OLD.descripcion, OLD.pais )  
);

END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `etapas`
--

CREATE TABLE IF NOT EXISTS `etapas` (
  `etapa` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código Etapa (1,2,3)',
  `descripcion` varchar(20) NOT NULL COMMENT 'Descripció Et (Básica, disciplinaria, terminal)',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`etapa`),
  UNIQUE KEY `ET_codigo_UNIQUE` (`etapa`),
  KEY `fk_etapas_users1_idx` (`users_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `etapas`
--

INSERT INTO `etapas` (`etapa`, `descripcion`, `users_id`) VALUES
(1, 'BASICA', 1),
(2, 'DISCIPLINARIA', 1),
(3, 'TERMINAL', 1);

--
-- Disparadores `etapas`
--
DROP TRIGGER IF EXISTS `bit_D_etapas`;
DELIMITER //
CREATE TRIGGER `bit_D_etapas` AFTER DELETE ON `etapas`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *etapas*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro_old
)
VALUES (
'etapas', OLD.users_id, 'D', curdate( ) , concat_WS( '|', OLD.etapa, OLD.descripcion ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_etapas`;
DELIMITER //
CREATE TRIGGER `bit_I_etapas` AFTER INSERT ON `etapas`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *etapas*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro
)
VALUES (
'etapas', NEW.users_id, 'I', curdate( ) , concat_WS( '|', NEW.etapa, NEW.descripcion ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_etapas`;
DELIMITER //
CREATE TRIGGER `bit_U_etapas` AFTER UPDATE ON `etapas`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al MODIFICAR REGISTRO en *etapas*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro,registro_old
)
VALUES (
'etapas', NEW.users_id, 'U', curdate( ) , 
concat_WS( '|', NEW.etapa, NEW.descripcion ),
concat_WS( '|', OLD.etapa, OLD.descripcion )  
);

END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupos`
--

CREATE TABLE IF NOT EXISTS `grupos` (
  `grupo` int(11) NOT NULL COMMENT 'Código Grup',
  `periodo` int(11) NOT NULL COMMENT 'Periodo de trabajo(Año 4 digitos+ semestre o cuatrim) ej. 20091,20092',
  `plan` int(11) NOT NULL COMMENT 'Código Plan (Año+Semestre)',
  `programaedu` int(11) NOT NULL COMMENT 'Código Programa Educativo( Carrera)',
  `turno` int(11) NOT NULL COMMENT 'Turno',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`grupo`,`periodo`),
  KEY `fk_grupos_periodos1_idx` (`periodo`),
  KEY `fk_grupos_turnos1_idx` (`turno`),
  KEY `fk_grupos_planestudio1_idx` (`plan`,`programaedu`),
  KEY `fk_grupos_users1_idx` (`users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `grupos`
--

INSERT INTO `grupos` (`grupo`, `periodo`, `plan`, `programaedu`, `turno`, `users_id`) VALUES
(111, 20141, 20091, 1, 1, 1),
(111, 20142, 20091, 1, 1, 1),
(111, 20143, 20091, 1, 1, 1),
(111, 20144, 20091, 1, 1, 1),
(111, 20145, 20091, 1, 1, 1),
(111, 20147, 20091, 1, 2, 1),
(111, 20151, 20091, 1, 1, 1),
(111, 20152, 20091, 1, 1, 1),
(112, 20141, 20091, 1, 2, 1),
(112, 20142, 20091, 1, 2, 1),
(112, 20143, 20091, 1, 2, 1),
(112, 20144, 20091, 1, 2, 1),
(112, 20145, 20091, 1, 2, 1),
(112, 20151, 20091, 1, 2, 1),
(112, 20152, 20091, 1, 2, 1),
(113, 20145, 20091, 1, 2, 1),
(113, 20151, 20091, 1, 3, 1),
(113, 20152, 20091, 1, 3, 1),
(115, 20147, 20091, 1, 2, 1),
(116, 20147, 20091, 1, 2, 1),
(121, 20141, 20091, 1, 3, 1),
(121, 20142, 20091, 1, 3, 1),
(121, 20143, 20091, 1, 3, 1),
(121, 20144, 20091, 1, 3, 1),
(121, 20145, 20091, 1, 3, 1),
(121, 20151, 20091, 1, 2, 1),
(121, 20152, 20091, 1, 2, 1),
(122, 20151, 20091, 1, 2, 1),
(122, 20152, 20091, 1, 2, 1),
(126, 20152, 20091, 1, 1, 1),
(131, 20141, 20091, 1, 2, 1),
(131, 20142, 20091, 1, 2, 1),
(131, 20143, 20091, 1, 2, 1),
(131, 20144, 20091, 1, 2, 1),
(131, 20145, 20091, 1, 2, 1),
(131, 20151, 20091, 1, 1, 1),
(131, 20152, 20091, 1, 1, 1),
(132, 20151, 20091, 1, 1, 1),
(132, 20152, 20091, 1, 1, 1),
(141, 20141, 20091, 1, 2, 1),
(141, 20142, 20091, 1, 2, 1),
(141, 20143, 20091, 1, 2, 1),
(141, 20144, 20091, 1, 2, 1),
(141, 20145, 20091, 1, 2, 1),
(142, 20141, 20091, 1, 2, 1),
(142, 20142, 20091, 1, 2, 1),
(142, 20143, 20091, 1, 2, 1),
(142, 20144, 20091, 1, 2, 1),
(142, 20145, 20091, 1, 2, 1),
(143, 20141, 20091, 1, 1, 1),
(143, 20142, 20091, 1, 1, 1),
(143, 20143, 20091, 1, 1, 1),
(143, 20144, 20091, 1, 1, 1),
(143, 20145, 20091, 1, 1, 1),
(151, 20141, 20091, 1, 1, 1),
(151, 20142, 20091, 1, 1, 1),
(151, 20143, 20091, 1, 1, 1),
(151, 20144, 20091, 1, 1, 1),
(151, 20145, 20091, 1, 1, 1),
(161, 20141, 20091, 1, 1, 1),
(161, 20142, 20091, 1, 1, 1),
(161, 20143, 20091, 1, 1, 1),
(161, 20144, 20091, 1, 1, 1),
(161, 20145, 20091, 1, 1, 1),
(171, 20141, 20091, 1, 1, 1),
(171, 20142, 20091, 1, 1, 1),
(171, 20143, 20091, 1, 1, 1),
(171, 20144, 20091, 1, 1, 1),
(171, 20145, 20091, 1, 1, 1),
(172, 20141, 20091, 1, 1, 1),
(172, 20142, 20091, 1, 1, 1),
(172, 20143, 20091, 1, 1, 1),
(172, 20144, 20091, 1, 1, 1),
(172, 20145, 20091, 1, 1, 1),
(181, 20141, 20091, 1, 1, 1),
(181, 20142, 20091, 1, 1, 1),
(181, 20143, 20091, 1, 1, 1),
(181, 20144, 20091, 1, 1, 1),
(181, 20145, 20091, 1, 1, 1),
(191, 20141, 20091, 1, 1, 1),
(191, 20142, 20091, 1, 1, 1),
(191, 20143, 20091, 1, 1, 1),
(191, 20144, 20091, 1, 1, 1),
(191, 20145, 20091, 1, 1, 1);

--
-- Disparadores `grupos`
--
DROP TRIGGER IF EXISTS `bit_D_grupos`;
DELIMITER //
CREATE TRIGGER `bit_D_grupos` AFTER DELETE ON `grupos`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *grupos*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro_old
)
VALUES (
'grupos', OLD.users_id, 'D', curdate( ) , concat_WS( '|', OLD.grupo, OLD.periodo, OLD.plan, OLD.programaedu,OLD.turno ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_grupos`;
DELIMITER //
CREATE TRIGGER `bit_I_grupos` AFTER INSERT ON `grupos`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *grupos*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro
)
VALUES (
'grupos', NEW.users_id, 'I', curdate( ) , concat_WS( '|', NEW.grupo, NEW.periodo, NEW.plan, NEW.programaedu,NEW.turno ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_grupos`;
DELIMITER //
CREATE TRIGGER `bit_U_grupos` AFTER UPDATE ON `grupos`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al MODIFICAR REGISTRO en *grupos*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro,registro_old
)
VALUES (
'grupos', NEW.users_id, 'U', curdate( ) , 
concat_WS( '|', NEW.grupo, NEW.periodo, NEW.plan, NEW.programaedu,NEW.turno ),
concat_WS( '|', OLD.grupo, OLD.periodo, OLD.plan, OLD.programaedu,OLD.turno )  
);

END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horarios`
--

CREATE TABLE IF NOT EXISTS `horarios` (
  `grupo` int(11) NOT NULL COMMENT 'Gpo',
  `periodo` int(11) NOT NULL COMMENT 'Periodo',
  `uaprendizaje` int(11) NOT NULL COMMENT 'codigo uap',
  `id` int(11) NOT NULL COMMENT 'Docente',
  `dia` int(11) NOT NULL COMMENT 'Dia asignado',
  `hora` int(11) NOT NULL COMMENT 'Horario asignado',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  KEY `fk_horarios_horas1_idx` (`hora`),
  KEY `fk_horarios_dias1_idx` (`dia`),
  KEY `fk_horarios_users1_idx` (`users_id`),
  KEY `fk_horarios_uaprendizaje1_idx` (`uaprendizaje`),
  KEY `fk_horarios_grupos1_idx` (`grupo`,`periodo`),
  KEY `fk_horarios_users2_idx` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Disparadores `horarios`
--
DROP TRIGGER IF EXISTS `bit_D_horarios`;
DELIMITER //
CREATE TRIGGER `bit_D_horarios` AFTER DELETE ON `horarios`
 FOR EACH ROW BEGIN
-- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *horarios*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro_old
)
VALUES (
'horarios', OLD.users_id, 'D', curdate( ) , concat_WS( '|', OLD.grupo, OLD.periodo, OLD.uaprendizaje, OLD.id, OLD.dia, OLD.hora ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_horarios`;
DELIMITER //
CREATE TRIGGER `bit_I_horarios` AFTER INSERT ON `horarios`
 FOR EACH ROW BEGIN
-- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *horarios*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro
)
VALUES (
'horarios', NEW.users_id, 'I', curdate( ) , concat_WS( '|', NEW.grupo, NEW.periodo, NEW.uaprendizaje, NEW.id, NEW.dia, NEW.hora ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_horarios`;
DELIMITER //
CREATE TRIGGER `bit_U_horarios` AFTER UPDATE ON `horarios`
 FOR EACH ROW BEGIN
-- -----------------------------------------------------
-- Bitacora al MODIFICAR REGISTRO en *horarios*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro,registro_old
)
VALUES (
'horarios', NEW.users_id, 'U', curdate( ) , 
concat_WS( '|', NEW.grupo, NEW.periodo, NEW.uaprendizaje, NEW.id, NEW.dia, NEW.hora ),
concat_WS( '|', OLD.grupo, OLD.periodo, OLD.uaprendizaje, OLD.id, OLD.dia, OLD.hora ) 
);

END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horas`
--

CREATE TABLE IF NOT EXISTS `horas` (
  `hora` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo hora (1,2,3,4)',
  `horaini` char(5) NOT NULL COMMENT 'Hr exacta inicio (0800)',
  `horafin` char(5) NOT NULL COMMENT 'Hr exacta fin (0859)',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`hora`),
  UNIQUE KEY `HR_hora_UNIQUE` (`hora`),
  KEY `fk_horas_users1_idx` (`users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Disparadores `horas`
--
DROP TRIGGER IF EXISTS `bit_D_horas`;
DELIMITER //
CREATE TRIGGER `bit_D_horas` AFTER DELETE ON `horas`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *horas*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro_old
)
VALUES (
'horas', OLD.users_id, 'D', curdate( ) , concat_WS( '|', 
OLD.hora, 
OLD.horaini,
OLD.horafin ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_horas`;
DELIMITER //
CREATE TRIGGER `bit_I_horas` AFTER INSERT ON `horas`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *horas*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro
)
VALUES (
'horas', NEW.users_id, 'I', curdate( ) , concat_WS( '|', 
NEW.hora, 
NEW.horaini,
NEW.horafin ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_horas`;
DELIMITER //
CREATE TRIGGER `bit_U_horas` AFTER UPDATE ON `horas`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al MODIFICAR REGISTRO en *horas*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro,registro_old
)
VALUES (
'horas', NEW.users_id, 'U', curdate( ) , concat_WS( '|', 
NEW.hora, 
NEW.horaini,
NEW.horafin ),
concat_WS( '|', 
OLD.hora, 
OLD.horaini,
OLD.horafin )  
);

END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `levels`
--

CREATE TABLE IF NOT EXISTS `levels` (
  `level` int(11) NOT NULL COMMENT 'Nivel',
  `descrip_level` varchar(45) NOT NULL COMMENT 'Descripcion Nivel',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`level`),
  KEY `fk_levels_users1_idx` (`users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `levels`
--

INSERT INTO `levels` (`level`, `descrip_level`, `users_id`) VALUES
(1, 'Administrador general', 1),
(2, 'Administrador auxiliar', 1),
(3, 'Coordinador Carrera', 1),
(4, 'Coordinador de Area', 1),
(5, 'Docente', 1);

--
-- Disparadores `levels`
--
DROP TRIGGER IF EXISTS `bit_D_levels`;
DELIMITER //
CREATE TRIGGER `bit_D_levels` AFTER DELETE ON `levels`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *levels*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Dic 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro_old
)
VALUES (
'levels', OLD.users_id, 'D', curdate( ) , concat_WS( '|', 
OLD.level, 
OLD.descrip_level ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_levels`;
DELIMITER //
CREATE TRIGGER `bit_I_levels` AFTER INSERT ON `levels`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *levels*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Dic 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro
)
VALUES (
'levels', NEW.users_id, 'I', curdate( ) , concat_WS( '|', 
NEW.level, 
NEW.descrip_level ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_levels`;
DELIMITER //
CREATE TRIGGER `bit_U_levels` AFTER UPDATE ON `levels`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al MODIFICAR REGISTRO en *levels*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Dic 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro,registro_old
)
VALUES (
'levels', NEW.users_id, 'U', curdate( ) , concat_WS( '|', 
NEW.level, 
NEW.descrip_level),
concat_WS( '|', 
OLD.level, 
OLD.descrip_level )  
);
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nvprograma`
--

CREATE TABLE IF NOT EXISTS `nvprograma` (
  `nivel` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Nivel (1,2,3)',
  `descripcion` varchar(15) NOT NULL COMMENT 'Licenciatura/Postgrado',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`nivel`),
  UNIQUE KEY `NV_codigo_UNIQUE` (`nivel`),
  KEY `fk_nvprograma_users1_idx` (`users_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='<double-click to overwrite multiple objects>' AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `nvprograma`
--

INSERT INTO `nvprograma` (`nivel`, `descripcion`, `users_id`) VALUES
(1, 'LICENCIATURA', 1),
(2, 'POSTGRADO', 1),
(3, 'DOCTORADO', 1),
(4, 'ESPECIALIDAD', 1),
(5, 'TECNICO', 1);

--
-- Disparadores `nvprograma`
--
DROP TRIGGER IF EXISTS `bit_D_nvprograma`;
DELIMITER //
CREATE TRIGGER `bit_D_nvprograma` AFTER DELETE ON `nvprograma`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *nvprograma*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro_old
)
VALUES (
'nvprograma', OLD.users_id, 'D', curdate( ) , concat_WS( '|', OLD.nivel, OLD.descripcion) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_nvprograma`;
DELIMITER //
CREATE TRIGGER `bit_I_nvprograma` AFTER INSERT ON `nvprograma`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *nvprograma*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro
)
VALUES (
'nvprograma', NEW.users_id, 'I', curdate( ) , concat_WS( '|', NEW.nivel, NEW.descripcion) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_nvprograma`;
DELIMITER //
CREATE TRIGGER `bit_U_nvprograma` AFTER UPDATE ON `nvprograma`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al MODIFICAR REGISTRO en *nvprograma*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro,registro_old
)
VALUES (
'nvprograma', NEW.users_id, 'U', curdate( ) , 
concat_WS( '|', NEW.nivel, NEW.descripcion),
concat_WS( '|', OLD.nivel, OLD.descripcion)  
);

END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pais`
--

CREATE TABLE IF NOT EXISTS `pais` (
  `pais` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo pais',
  `descripcion` varchar(60) NOT NULL COMMENT 'Descripción pais',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`pais`),
  UNIQUE KEY `PA_codigo_UNIQUE` (`pais`),
  KEY `fk_pais_users1_idx` (`users_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=238 ;

--
-- Volcado de datos para la tabla `pais`
--

INSERT INTO `pais` (`pais`, `descripcion`, `users_id`) VALUES
(1, 'AFGANISTAN', 1),
(2, 'ALBANIA', 1),
(3, 'ALEMANIA', 1),
(4, 'ANDORRA', 1),
(5, 'ANGOLA', 1),
(6, 'ANGUILLA', 1),
(7, 'ANTIGUA Y BARBUDA', 1),
(8, 'ANTILLAS HOLANDESAS', 1),
(9, 'ARABIA SAUDI', 1),
(10, 'ARGELIA', 1),
(11, 'ARGENTINA', 1),
(12, 'ARMENIA', 1),
(13, 'ARUBA', 1),
(14, 'AUSTRALIA', 1),
(15, 'AUSTRIA', 1),
(16, 'AZERBAIYAN', 1),
(17, 'BAHAMAS', 1),
(18, 'BAHREIN', 1),
(19, 'BANGLADESH', 1),
(20, 'BARBADOS', 1),
(22, 'BELGICA', 1),
(23, 'BELICE', 1),
(25, 'BERMUDAS', 1),
(27, 'BOLIVIA', 1),
(28, 'BOSNIA Y HERZEGOVINA', 1),
(29, 'BOTSWANA', 1),
(30, 'BRASIL', 1),
(31, 'BRUNEI', 1),
(32, 'BULGARIA', 1),
(34, 'BURUNDI', 1),
(35, 'CABO VERDE', 1),
(36, 'CAMBOYA', 1),
(37, 'CAMERUN', 1),
(38, 'CANADA', 1),
(40, 'CHILE', 1),
(41, 'CHINA', 1),
(42, 'CHIPRE', 1),
(43, 'COLOMBIA', 1),
(45, 'CONGO', 1),
(46, 'COREA', 1),
(47, 'COREA DEL NORTE ', 1),
(48, 'COSTA DE MARFIL', 1),
(49, 'COSTA RICA', 1),
(50, 'CROACIA', 1),
(51, 'CUBA', 1),
(52, 'DINAMARCA', 1),
(54, 'DOMINICA', 1),
(55, 'ECUADOR', 1),
(56, 'EGIPTO', 1),
(57, 'EL SALVADOR', 1),
(58, 'EMIRATOS ARABES UNIDOS', 1),
(60, 'ESLOVENIA', 1),
(61, 'ESPAÂ¥A', 1),
(62, 'ESTADOS UNIDOS DE AMERICA', 1),
(63, 'ESTONIA', 1),
(64, 'ETIOPIA', 1),
(65, 'FIJI', 1),
(66, 'FILIPINAS', 1),
(67, 'FINLANDIA', 1),
(68, 'FRANCIA', 1),
(69, 'GABON', 1),
(70, 'GAMBIA', 1),
(71, 'GEORGIA', 1),
(72, 'GHANA', 1),
(73, 'GIBRALTAR', 1),
(74, 'GRANADA', 1),
(75, 'GRECIA', 1),
(76, 'GROENLANDIA', 1),
(78, 'GUAM', 1),
(79, 'GUATEMALA', 1),
(80, 'GUAYANA FRANCESA', 1),
(81, 'GUERNESEY', 1),
(82, 'GUINEA', 1),
(83, 'GUINEA ECUATORIAL', 1),
(84, 'GUINEA-BISSAU', 1),
(85, 'GUYANA', 1),
(86, 'HAITI', 1),
(87, 'HONDURAS', 1),
(88, 'HONG KONG', 1),
(89, 'HUNGRIA', 1),
(90, 'INDIA', 1),
(91, 'INDONESIA', 1),
(92, 'IRAN', 1),
(93, 'IRAQ', 1),
(94, 'IRLANDA', 1),
(95, 'ISLA DE MAN', 1),
(96, 'ISLA NORFOLK', 1),
(97, 'ISLANDIA', 1),
(98, 'ISLAS ALAND', 1),
(99, 'ISLAS CAIM?N', 1),
(100, 'ISLAS COOK', 1),
(101, 'ISLAS DEL CANAL', 1),
(102, 'ISLAS FEROE', 1),
(103, 'ISLAS MALVINAS', 1),
(104, 'ISLAS MARIANAS DEL NORTE', 1),
(105, 'ISLAS MARSHALL', 1),
(106, 'ISLAS PITCAIRN', 1),
(107, 'ISLAS SALOMON', 1),
(108, 'ISLAS TURCAS Y CAICOS', 1),
(109, 'ISLAS VIRGENES BRITANICAS', 1),
(110, 'ISLAS V?RGENES DE LOS ESTADOS UNIDOS', 1),
(111, 'ISRAEL', 1),
(112, 'ITALIA', 1),
(113, 'JAMAICA', 1),
(114, 'JAPON', 1),
(115, 'JERSEY', 1),
(116, 'JORDANIA', 1),
(117, 'KAZAJSTAN', 1),
(118, 'KENIA', 1),
(119, 'KIRGUISTAN', 1),
(120, 'KIRIBATI', 1),
(121, 'KUWAIT', 1),
(122, 'LAOS', 1),
(123, 'LESOTHO', 1),
(124, 'LETONIA', 1),
(125, 'LIBANO', 1),
(126, 'LIBERIA', 1),
(127, 'LIBIA', 1),
(128, 'LIECHTENSTEIN', 1),
(129, 'LITUANIA', 1),
(130, 'LUXEMBURGO', 1),
(131, 'MACAO', 1),
(132, 'MACEDONIA ', 1),
(133, 'MADAGASCAR', 1),
(134, 'MALASIA', 1),
(135, 'MALAWI', 1),
(136, 'MALDIVAS', 1),
(137, 'MALI', 1),
(138, 'MALTA', 1),
(139, 'MARRUECOS', 1),
(140, 'MARTINICA', 1),
(141, 'MAURICIO', 1),
(142, 'MAURITANIA', 1),
(143, 'MAYOTTE', 1),
(144, 'MEXICO', 1),
(145, 'MICRONESIA', 1),
(146, 'MOLDAVIA', 1),
(147, 'MONACO', 1),
(148, 'MONGOLIA', 1),
(149, 'MONTENEGRO', 1),
(150, 'MONTSERRAT', 1),
(151, 'MOZAMBIQUE', 1),
(152, 'MYANMAR', 1),
(153, 'NAMIBIA', 1),
(154, 'NAURU', 1),
(155, 'NEPAL', 1),
(156, 'NICARAGUA', 1),
(157, 'NIGER', 1),
(158, 'NIGERIA', 1),
(159, 'NIUE', 1),
(160, 'NORUEGA', 1),
(161, 'NUEVA CALEDONIA', 1),
(162, 'NUEVA ZELANDA', 1),
(163, 'OMAN', 1),
(164, 'PAISES BAJOS', 1),
(165, 'PAKISTAN', 1),
(166, 'PALAOS', 1),
(167, 'PALESTINA', 1),
(168, 'PANAMA', 1),
(169, 'PAPUA NUEVA GUINEA', 1),
(170, 'PARAGUAY', 1),
(171, 'PERU', 1),
(172, 'POLINESIA FRANCESA', 1),
(173, 'POLONIA', 1),
(174, 'PORTUGAL', 1),
(175, 'PUERTO RICO', 1),
(176, 'QATAR', 1),
(177, 'REINO UNIDO', 1),
(178, 'REP.DEMOCRATICA DEL CONGO', 1),
(179, 'REPUBLICA CENTROAFRICANA', 1),
(180, 'REPUBLICA CHECA', 1),
(181, 'REPUBLICA DOMINICANA', 1),
(182, 'REPUBLICA ESLOVACA', 1),
(183, 'REUNION', 1),
(184, 'RUANDA', 1),
(185, 'RUMANIA', 1),
(186, 'RUSIA', 1),
(187, 'SAHARA OCCIDENTAL', 1),
(188, 'SAMOA', 1),
(189, 'SAMOA AMERICANA', 1),
(190, 'SAN BARTOLOME', 1),
(191, 'SAN CRISTOBAL Y NIEVES', 1),
(192, 'SAN MARINO', 1),
(193, 'SAN MARTIN (PARTE FRANCESA)', 1),
(194, 'SAN PEDRO Y MIQUELON ', 1),
(195, 'SAN VICENTE Y LAS GRANADINAS', 1),
(196, 'SANTA HELENA', 1),
(197, 'SANTA LUCIA', 1),
(198, 'SANTA SEDE', 1),
(199, 'SANTO TOME Y PRINCIPE', 1),
(200, 'SENEGAL', 1),
(201, 'SERBIA', 1),
(202, 'SEYCHELLES', 1),
(203, 'SIERRA LEONA', 1),
(204, 'SINGAPUR', 1),
(205, 'SIRIA', 1),
(206, 'SOMALIA', 1),
(207, 'SRI LANKA', 1),
(208, 'SUDAFRICA', 1),
(209, 'SUDAN', 1),
(210, 'SUECIA', 1),
(211, 'SUIZA', 1),
(212, 'SURINAM', 1),
(213, 'SVALBARD Y JAN MAYEN', 1),
(214, 'SWAZILANDIA', 1),
(215, 'TADYIKISTAN', 1),
(216, 'TAILANDIA', 1),
(217, 'TANZANIA', 1),
(218, 'TIMOR ORIENTAL', 1),
(219, 'TOGO', 1),
(220, 'TOKELAU', 1),
(221, 'TONGA', 1),
(222, 'TRINIDAD Y TOBAGO', 1),
(223, 'TUNEZ', 1),
(224, 'TURKMENISTAN', 1),
(225, 'TURQUIA', 1),
(226, 'TUVALU', 1),
(227, 'UCRANIA', 1),
(228, 'UGANDA', 1),
(229, 'URUGUAY', 1),
(230, 'UZBEKISTAN', 1),
(231, 'VANUATU', 1),
(232, 'VENEZUELA', 1),
(233, 'VIETNAM', 1),
(234, 'WALLIS Y FORTUNA', 1),
(235, 'YEMEN', 1),
(236, 'ZAMBIA', 1),
(237, 'ZIMBABWE', 1);

--
-- Disparadores `pais`
--
DROP TRIGGER IF EXISTS `bit_D_pais`;
DELIMITER //
CREATE TRIGGER `bit_D_pais` AFTER DELETE ON `pais`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *pais*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro_old
)
VALUES (
'pais', OLD.users_id, 'D', curdate( ) , concat_WS( '|', OLD.pais, OLD.descripcion ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_pais`;
DELIMITER //
CREATE TRIGGER `bit_I_pais` AFTER INSERT ON `pais`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *pais*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro
)
VALUES (
'pais', NEW.users_id, 'I', curdate( ) , concat_WS( '|', NEW.pais, NEW.descripcion ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_pais`;
DELIMITER //
CREATE TRIGGER `bit_U_pais` AFTER UPDATE ON `pais`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al ACTUALIZAR REGISTRO en *pais*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro,
registro_old
)
VALUES (
'pais', NEW.users_id, 'U', curdate( ),
concat_WS( '|', NEW.pais, NEW.descripcion),
concat_WS( '|', OLD.pais, OLD.descripcion) 
);

END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `periodos`
--

CREATE TABLE IF NOT EXISTS `periodos` (
  `periodo` int(11) NOT NULL COMMENT 'Periodo de trabajo(Año 4 digitos+ semestre o cuatrim) ej. 20091,20092',
  `periodo_pedu` int(11) NOT NULL DEFAULT '1' COMMENT 'Tipo: 1=semestral/2=cuatrimestral',
  `year` int(11) NOT NULL COMMENT 'Año preriodo',
  `mes` int(11) NOT NULL COMMENT 'Mes periodo',
  `descripcion` varchar(40) NOT NULL COMMENT 'Descripción',
  `inicio` date NOT NULL COMMENT 'Fecha inicio periodo',
  `fin` date DEFAULT NULL COMMENT 'Fecha fin periodo ',
  `status_periodo` int(11) NOT NULL DEFAULT '1' COMMENT 'Status 1,2 (1=Abierto, 2=Cerrado) ',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`periodo`),
  UNIQUE KEY `PR_periodo_UNIQUE` (`periodo`),
  KEY `fk_periodos_periodo_prog_edu1_idx` (`periodo_pedu`),
  KEY `fk_periodos_users1_idx` (`users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `periodos`
--

INSERT INTO `periodos` (`periodo`, `periodo_pedu`, `year`, `mes`, `descripcion`, `inicio`, `fin`, `status_periodo`, `users_id`) VALUES
(20141, 1, 2014, 1, 'vamos a ver', '2015-03-01', '2015-03-31', 1, 1),
(20142, 1, 2014, 2, 'vamos a ver', '2015-03-01', '2015-03-31', 1, 1),
(20143, 1, 2014, 3, 'Vamos a ver', '2015-03-01', '2015-03-31', 1, 1),
(20144, 1, 2014, 4, 'vamos a ver', '2015-03-01', '2015-03-31', 1, 1),
(20145, 1, 2014, 5, 'vamos a ver', '2015-03-01', '2015-03-31', 1, 1),
(20147, 1, 2014, 7, 'adfasdf', '2015-05-07', '2015-05-31', 1, 1),
(20151, 1, 2015, 1, 'bla bla', '2015-06-02', '2015-06-30', 1, 1),
(20152, 1, 2015, 2, 'vamos', '2015-06-02', '2015-06-30', 1, 1);

--
-- Disparadores `periodos`
--
DROP TRIGGER IF EXISTS `bit_D_periodos`;
DELIMITER //
CREATE TRIGGER `bit_D_periodos` AFTER DELETE ON `periodos`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *periodos*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro_old
)
VALUES (
'periodos', OLD.users_id, 'D', curdate( ) , concat_WS( '|', 
    OLD.periodo,
    OLD.periodo_pedu, 
    OLD.year,
    OLD.mes,
    OLD.descripcion,
    OLD.inicio,                                                 
    OLD.fin,
    OLD.status_periodo)
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_periodos`;
DELIMITER //
CREATE TRIGGER `bit_I_periodos` AFTER INSERT ON `periodos`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *periodos*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro
)
VALUES (
'periodos', NEW.users_id, 'I', curdate( ) , concat_WS( '|', 
    NEW.periodo,
    NEW.periodo_pedu, 
    NEW.year,
    NEW.mes,
    NEW.descripcion,
    NEW.inicio,                                                 
    NEW.fin,
    NEW.status_periodo)
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_periodos`;
DELIMITER //
CREATE TRIGGER `bit_U_periodos` AFTER UPDATE ON `periodos`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al MODIFICAR REGISTRO en *periodos*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro,registro_old
)
VALUES (
'periodos', NEW.users_id, 'U', curdate( ) , concat_WS( '|', 
    NEW.periodo,
    NEW.periodo_pedu, 
    NEW.year,
    NEW.mes,
    NEW.descripcion,
    NEW.inicio,                                                 
    NEW.fin,
    NEW.status_periodo),
    concat_WS( '|', 
    OLD.periodo,
    OLD.periodo_pedu, 
    OLD.year,
    OLD.mes,
    OLD.descripcion,
    OLD.inicio,                                                 
    OLD.fin,
    OLD.status_periodo)
);

END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `periodo_prog_edu`
--

CREATE TABLE IF NOT EXISTS `periodo_prog_edu` (
  `periodo_pedu` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Tipo: 1=semestral/2=cuatrimestral',
  `descripcion` varchar(15) NOT NULL COMMENT 'Descripcion: semestral, cuatrimestral',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`periodo_pedu`),
  UNIQUE KEY `TP_codigo_UNIQUE` (`periodo_pedu`),
  KEY `fk_periodo_prog_edu_users1_idx` (`users_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `periodo_prog_edu`
--

INSERT INTO `periodo_prog_edu` (`periodo_pedu`, `descripcion`, `users_id`) VALUES
(1, 'SEMESTRAL', 1),
(2, 'CUATRIMESTRAL', 1),
(3, 'TRIMESTRAL', 1),
(4, 'SABATINO', 1);

--
-- Disparadores `periodo_prog_edu`
--
DROP TRIGGER IF EXISTS `bit_D_periodo_prog_edu`;
DELIMITER //
CREATE TRIGGER `bit_D_periodo_prog_edu` AFTER DELETE ON `periodo_prog_edu`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *periodo_prog_edu*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro_old
)
VALUES (
'periodo_prog_edu', OLD.users_id, 'D', curdate( ) , concat_WS( '|', 
OLD.periodo_pedu,
OLD.descripcion) 
);
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_periodo_prog_edu`;
DELIMITER //
CREATE TRIGGER `bit_I_periodo_prog_edu` AFTER INSERT ON `periodo_prog_edu`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *periodo_prog_edu*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro
)
VALUES (
'periodo_prog_edu', NEW.users_id, 'I', curdate( ) , concat_WS( '|', 
NEW.periodo_pedu,
NEW.descripcion) 
);
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_periodo_prog_edu`;
DELIMITER //
CREATE TRIGGER `bit_U_periodo_prog_edu` AFTER UPDATE ON `periodo_prog_edu`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al MODIFICAR REGISTRO en *periodo_prog_edu*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro,registro_old
)
VALUES (
'periodo_prog_edu', NEW.users_id, 'U', curdate( ) , concat_WS( '|', 
NEW.periodo_pedu,
NEW.descripcion),
concat_WS( '|', 
OLD.periodo_pedu,
OLD.descripcion)  
);
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planestudio`
--

CREATE TABLE IF NOT EXISTS `planestudio` (
  `plan` int(11) NOT NULL COMMENT 'Código Plan (Año+Semestre)',
  `descripcion` varchar(35) NOT NULL COMMENT 'Descripción plan  ("PLAN DE ESTUDIOS "+Año+" "+Semestre)',
  `credpracticas` int(11) NOT NULL COMMENT 'Total Créditos practicas',
  `feciniciovig` date NOT NULL COMMENT 'Fecha inicio Vigencia',
  `fecfinvig` date NOT NULL COMMENT 'Fecha Fin Vigencia',
  `nivel` int(11) NOT NULL COMMENT 'Lic, post',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`plan`),
  KEY `fk_planestudiodesc_users1_idx` (`users_id`),
  KEY `fk_planestudiodesc_nvprograma1_idx` (`nivel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `planestudio`
--

INSERT INTO `planestudio` (`plan`, `descripcion`, `credpracticas`, `feciniciovig`, `fecfinvig`, `nivel`, `users_id`) VALUES
(20091, 'Plan 2009-1', 200, '2015-01-29', '2017-12-31', 1, 1);

--
-- Disparadores `planestudio`
--
DROP TRIGGER IF EXISTS `bit_D_planestudio`;
DELIMITER //
CREATE TRIGGER `bit_D_planestudio` AFTER DELETE ON `planestudio`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *planestudio*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro_old
)
VALUES (
'planestudio', OLD.users_id, 'D', curdate( ) , concat_WS( '|', 
OLD.plan, 
OLD.descripcion, 
OLD.credpracticas, 
OLD.feciniciovig, 
OLD.fecfinvig,
OLD.nivel                                                       ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_planestudio`;
DELIMITER //
CREATE TRIGGER `bit_I_planestudio` AFTER INSERT ON `planestudio`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *planestudio*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro
)
VALUES (
'planestudio', NEW.users_id, 'I', curdate( ) , concat_WS( '|', 
NEW.plan, 
NEW.descripcion, 
NEW.credpracticas, 
NEW.feciniciovig, 
NEW.fecfinvig,
NEW.nivel                                                       ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_planestudio`;
DELIMITER //
CREATE TRIGGER `bit_U_planestudio` AFTER UPDATE ON `planestudio`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al MODIFICAR REGISTRO en *planestudio*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro,registro_old
)
VALUES (
'planestudio', NEW.users_id, 'U', curdate( ) , concat_WS( '|', 
NEW.plan, 
NEW.descripcion, 
NEW.credpracticas, 
NEW.feciniciovig, 
NEW.fecfinvig,
NEW.nivel), 
concat_WS( '|', 
OLD.plan, 
OLD.descripcion, 
OLD.credpracticas, 
OLD.feciniciovig, 
OLD.fecfinvig,
OLD.nivel) 
);

END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plan_programa`
--

CREATE TABLE IF NOT EXISTS `plan_programa` (
  `plan` int(11) NOT NULL COMMENT 'Código Plan (Año+Semestre)',
  `programaedu` int(11) NOT NULL COMMENT 'Código Programa Educativo( Carrera)',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`plan`,`programaedu`),
  KEY `fk_planestudio_planestudiodesc1_idx` (`plan`),
  KEY `fk_planestudio_programaedu1_idx` (`programaedu`),
  KEY `fk_planestudio_users1_idx` (`users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `plan_programa`
--

INSERT INTO `plan_programa` (`plan`, `programaedu`, `users_id`) VALUES
(20091, 1, 1),
(20091, 2, 1),
(20091, 3, 1),
(20091, 4, 1),
(20091, 5, 1),
(20091, 6, 1),
(20091, 7, 1);

--
-- Disparadores `plan_programa`
--
DROP TRIGGER IF EXISTS `bit_D_plan_programa`;
DELIMITER //
CREATE TRIGGER `bit_D_plan_programa` AFTER DELETE ON `plan_programa`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *plan_programa*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro_old
)
VALUES (
'plan_programa', OLD.users_id, 'D', curdate( ) , concat_WS( '|', OLD.plan, OLD.programaedu) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_plan_programa`;
DELIMITER //
CREATE TRIGGER `bit_I_plan_programa` AFTER INSERT ON `plan_programa`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *plan_programa*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro
)
VALUES (
'plan_programa', NEW.users_id, 'I', curdate( ) , concat_WS( '|', NEW.plan, NEW.programaedu) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_plan_programa`;
DELIMITER //
CREATE TRIGGER `bit_U_plan_programa` AFTER UPDATE ON `plan_programa`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al MODIFICAR REGISTRO en *plan_programa*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro,registro_old
)
VALUES (
'plan_programa', NEW.users_id, 'U', curdate( ) , 
concat_WS( '|', NEW.plan, NEW.programaedu),
concat_WS( '|', OLD.plan, OLD.programaedu)  
);

END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programaedu`
--

CREATE TABLE IF NOT EXISTS `programaedu` (
  `programaedu` int(11) NOT NULL COMMENT 'Código Programa Educativo( Carrera)',
  `descripcion` varchar(60) NOT NULL COMMENT 'Descripción detallenivprog (carrera)',
  `siglas` varchar(10) NOT NULL COMMENT 'Descripcion (FCQ, FCA)',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1=Activa/0=Baja',
  `uacademica` int(11) NOT NULL COMMENT 'Uacademica',
  `especialidad` int(11) DEFAULT NULL COMMENT 'Especialidad programa educativo',
  `nivel` int(11) NOT NULL DEFAULT '1' COMMENT 'Codigo nivel (Lic, post)',
  `periodo_pedu` int(11) NOT NULL DEFAULT '1' COMMENT 'Codigo periodo pe para especificar 1=semestral/2=cuatrimestral',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`programaedu`),
  UNIQUE KEY `DNP_codigo_UNIQUE` (`programaedu`),
  KEY `fk_programaedu_uacademica1_idx` (`uacademica`),
  KEY `fk_programaedu_esp_prog_edu1_idx` (`especialidad`),
  KEY `fk_programaedu_nvprograma1_idx` (`nivel`),
  KEY `fk_programaedu_periodo_prog_edu1_idx` (`periodo_pedu`),
  KEY `fk_programaedu_users1_idx` (`users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `programaedu`
--

INSERT INTO `programaedu` (`programaedu`, `descripcion`, `siglas`, `status`, `uacademica`, `especialidad`, `nivel`, `periodo_pedu`, `users_id`) VALUES
(1, 'ARTES', 'LA', 1, 1, NULL, 1, 1, 1),
(2, 'ADMON. DE EMPRESAS', 'LAE', 1, 1, NULL, 1, 1, 1),
(3, 'INFORMÁTICA', 'LI', 1, 1, NULL, 1, 1, 1),
(4, 'NEGOCIOS INTERNACIONALES', 'LNI', 1, 1, NULL, 1, 1, 1),
(5, 'CONTADURIA', 'LC', 1, 1, NULL, 1, 1, 1),
(6, 'TRONCO COMÚN', 'TC', 1, 1, NULL, 1, 1, 1),
(7, 'SISTEMAS COMPUTACIONALES', 'LSC', 1, 1, NULL, 1, 1, 1);

--
-- Disparadores `programaedu`
--
DROP TRIGGER IF EXISTS `bit_D_programaedu`;
DELIMITER //
CREATE TRIGGER `bit_D_programaedu` AFTER DELETE ON `programaedu`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *programaedu*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro_old
)
VALUES (
'programaedu', OLD.users_id, 'D', curdate( ) , concat_WS( '|', OLD.programaedu, OLD.descripcion, OLD.siglas, OLD.status,OLD.uacademica,OLD.especialidad,OLD.nivel,OLD.periodo_pedu ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_programaedu`;
DELIMITER //
CREATE TRIGGER `bit_I_programaedu` AFTER INSERT ON `programaedu`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *programaedu*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro
)
VALUES (
'programaedu', NEW.users_id, 'I', curdate( ) , concat_WS( '|', NEW.programaedu, NEW.descripcion, NEW.siglas, NEW.status,NEW.uacademica,NEW.especialidad,NEW.nivel,NEW.periodo_pedu ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_programaedu`;
DELIMITER //
CREATE TRIGGER `bit_U_programaedu` AFTER UPDATE ON `programaedu`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al MODIFICAR REGISTRO en *programaedu*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro,registro_old
)
VALUES (
'programaedu', NEW.users_id, 'U', curdate( ) , 
concat_WS( '|', NEW.programaedu, NEW.descripcion, NEW.siglas, NEW.status,NEW.uacademica,NEW.especialidad,NEW.nivel,NEW.periodo_pedu ),
concat_WS( '|', OLD.programaedu, OLD.descripcion, OLD.siglas, OLD.status,OLD.uacademica,OLD.especialidad,OLD.nivel,OLD.periodo_pedu )  
);

END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puesto`
--

CREATE TABLE IF NOT EXISTS `puesto` (
  `puesto` int(11) NOT NULL AUTO_INCREMENT COMMENT '1,2,3',
  `descripcion` varchar(15) NOT NULL COMMENT 'Director, subd., adm., docente, etc.',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`puesto`),
  UNIQUE KEY `DI_directivopuesto_UNIQUE` (`puesto`),
  KEY `fk_directivopuesto_users1_idx` (`users_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='<double-click to overwrite multiple objects>' AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `puesto`
--

INSERT INTO `puesto` (`puesto`, `descripcion`, `users_id`) VALUES
(1, 'DIRECTOR', 1),
(2, 'SUBDIRECTOR', 1),
(3, 'ADMINISTRADOR', 1),
(4, 'DOCENTE', 1),
(5, 'GERENTE GENERAL', 1);

--
-- Disparadores `puesto`
--
DROP TRIGGER IF EXISTS `bit_D_puesto`;
DELIMITER //
CREATE TRIGGER `bit_D_puesto` AFTER DELETE ON `puesto`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *puesto*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro_old
)
VALUES (
'puesto', OLD.users_id, 'D', curdate( ) , concat_WS( '|', OLD.puesto, OLD.descripcion ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_puesto`;
DELIMITER //
CREATE TRIGGER `bit_I_puesto` AFTER INSERT ON `puesto`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *puesto*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro
)
VALUES (
'puesto', NEW.users_id, 'I', curdate( ) , concat_WS( '|', NEW.puesto, NEW.descripcion ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_puesto`;
DELIMITER //
CREATE TRIGGER `bit_U_puesto` AFTER UPDATE ON `puesto`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al MODIFICAR REGISTRO en *puesto*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro,registro_old
)
VALUES (
'puesto', NEW.users_id, 'U', curdate( ) , 
concat_WS( '|', NEW.puesto, NEW.descripcion ),
concat_WS( '|', OLD.puesto, OLD.descripcion )  
);

END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puestosemp`
--

CREATE TABLE IF NOT EXISTS `puestosemp` (
  `id` int(11) NOT NULL COMMENT 'No. Empleado',
  `uacademica` int(11) NOT NULL COMMENT 'Codigo uacademica (FCQ, FCA)',
  `puesto` int(11) NOT NULL COMMENT 'Codigo puesto',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  KEY `fk_directivosua_uacademica1_idx` (`uacademica`),
  KEY `fk_directivosua_directivopuesto1_idx` (`puesto`),
  KEY `fk_directivosua_users1_idx` (`users_id`),
  KEY `fk_puestosemp_users2_idx` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Disparadores `puestosemp`
--
DROP TRIGGER IF EXISTS `bit_D_puestosemp`;
DELIMITER //
CREATE TRIGGER `bit_D_puestosemp` AFTER DELETE ON `puestosemp`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *puestosemp*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro_old
)
VALUES (
'puestosemp', OLD.users_id, 'D', curdate( ) , concat_WS( '|', OLD.id, OLD.uacademica, OLD.puesto ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_puestosemp`;
DELIMITER //
CREATE TRIGGER `bit_I_puestosemp` AFTER INSERT ON `puestosemp`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *puestosemp*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro
)
VALUES (
'puestosemp', NEW.users_id, 'I', curdate( ) , concat_WS( '|', NEW.id, NEW.uacademica, NEW.puesto ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_puestosemp`;
DELIMITER //
CREATE TRIGGER `bit_U_puestosemp` AFTER UPDATE ON `puestosemp`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al MODIFICAR REGISTRO en *puestosemp*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro,registro_old
)
VALUES (
'puestosemp', NEW.users_id, 'U', curdate( ) , 
concat_WS( '|', NEW.id, NEW.uacademica, NEW.puesto ) ,
concat_WS( '|', OLD.id, OLD.uacademica, OLD.puesto ) 
);

END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `p_ua`
--

CREATE TABLE IF NOT EXISTS `p_ua` (
  `programaedu` int(11) NOT NULL COMMENT 'Programa educativo',
  `uaprendizaje` int(11) NOT NULL COMMENT 'U Aprend',
  `etapa` int(11) NOT NULL COMMENT 'Etapa',
  `caracter` int(11) NOT NULL,
  `semestre_sug` int(11) NOT NULL,
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`programaedu`,`uaprendizaje`),
  KEY `fk_p_ua_programaedu1_idx` (`programaedu`),
  KEY `fk_p_ua_uaprendizaje1_idx` (`uaprendizaje`),
  KEY `fk_p_ua_users1_idx` (`users_id`),
  KEY `fk_p_ua_etapas1_idx` (`etapa`),
  KEY `fk_p_ua_caracter1_idx` (`caracter`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='<double-click to overwrite multiple objects>';

--
-- Volcado de datos para la tabla `p_ua`
--

INSERT INTO `p_ua` (`programaedu`, `uaprendizaje`, `etapa`, `caracter`, `semestre_sug`, `users_id`) VALUES
(1, 11236, 1, 1, 1, 1),
(1, 11237, 1, 1, 1, 1),
(1, 11240, 1, 2, 1, 1),
(1, 11241, 1, 1, 4, 1),
(1, 11242, 1, 1, 1, 1),
(1, 11243, 2, 1, 3, 1),
(1, 11244, 2, 1, 1, 1),
(1, 11245, 1, 1, 1, 1),
(1, 11246, 3, 1, 1, 1),
(1, 11247, 2, 1, 1, 1),
(1, 11248, 1, 1, 1, 1),
(1, 11271, 1, 1, 1, 1),
(1, 11272, 1, 1, 1, 1),
(2, 11241, 1, 1, 4, 1),
(2, 11270, 2, 1, 1, 1),
(3, 11236, 1, 1, 1, 1),
(3, 11237, 1, 1, 1, 1),
(3, 11241, 1, 1, 4, 1),
(3, 11270, 2, 1, 1, 1),
(3, 11271, 1, 1, 1, 1),
(4, 11241, 1, 1, 4, 1),
(4, 11270, 3, 1, 1, 1),
(5, 11241, 1, 1, 4, 1),
(6, 11238, 1, 1, 1, 1),
(6, 11239, 1, 1, 1, 1),
(7, 11241, 1, 1, 4, 1);

--
-- Disparadores `p_ua`
--
DROP TRIGGER IF EXISTS `bit_D_p_ua`;
DELIMITER //
CREATE TRIGGER `bit_D_p_ua` AFTER DELETE ON `p_ua`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *p_ua*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro_old
)
VALUES (
'p_ua', OLD.users_id, 'D', curdate( ) , concat_WS( '|', OLD.programaedu, OLD.uaprendizaje, OLD.etapa, OLD.caracter, OLD.semestre_sug ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_p_ua`;
DELIMITER //
CREATE TRIGGER `bit_I_p_ua` AFTER INSERT ON `p_ua`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *p_ua*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro
)
VALUES (
'p_ua', NEW.users_id, 'I', curdate( ) , concat_WS( '|', NEW.programaedu, NEW.uaprendizaje, NEW.etapa, NEW.caracter, NEW.semestre_sug ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_p_ua`;
DELIMITER //
CREATE TRIGGER `bit_U_p_ua` AFTER UPDATE ON `p_ua`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al MODIFICAR REGISTRO en *p_ua*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro,registro_old
)
VALUES (
'p_ua', NEW.users_id, 'U', curdate( ) , 
concat_WS( '|', NEW.programaedu, NEW.uaprendizaje, NEW.etapa, NEW.caracter, NEW.semestre_sug ),
concat_WS( '|', OLD.programaedu, OLD.uaprendizaje, OLD.etapa, OLD.caracter, OLD.semestre_sug)  
);

END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reqseriacion`
--

CREATE TABLE IF NOT EXISTS `reqseriacion` (
  `reqseriacion` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Reqseriacion (1,2,3)',
  `descripcion` varchar(15) NOT NULL COMMENT 'Obligada, Sugerida, Sin seriación',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`reqseriacion`),
  UNIQUE KEY `RS_codigo_UNIQUE` (`reqseriacion`),
  KEY `fk_reqseriacion_users1_idx` (`users_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='<double-click to overwrite multiple objects>' AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `reqseriacion`
--

INSERT INTO `reqseriacion` (`reqseriacion`, `descripcion`, `users_id`) VALUES
(1, 'OBLIGATORIA', 1),
(2, 'CONVENIENTE', 1);

--
-- Disparadores `reqseriacion`
--
DROP TRIGGER IF EXISTS `bit_D_reqseriacion`;
DELIMITER //
CREATE TRIGGER `bit_D_reqseriacion` AFTER DELETE ON `reqseriacion`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *reqseriacion*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro_old
)
VALUES (
'reqseriacion', OLD.users_id, 'D', curdate( ) , concat_WS( '|', OLD.reqseriacion, OLD.descripcion ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_reqseriacion`;
DELIMITER //
CREATE TRIGGER `bit_I_reqseriacion` AFTER INSERT ON `reqseriacion`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *reqseriacion*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro
)
VALUES (
'reqseriacion', NEW.users_id, 'I', curdate( ) , concat_WS( '|', NEW.reqseriacion, NEW.descripcion ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_reqseriacion`;
DELIMITER //
CREATE TRIGGER `bit_U_reqseriacion` AFTER UPDATE ON `reqseriacion`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al MODIFICAR REGISTRO en *reqseriacion*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro,registro_old
)
VALUES (
'reqseriacion', NEW.users_id, 'U', curdate( ) , 
concat_WS( '|', NEW.reqseriacion, NEW.descripcion ),
concat_WS( '|', OLD.reqseriacion, OLD.descripcion )  
);

END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `status`
--

CREATE TABLE IF NOT EXISTS `status` (
  `status` int(11) NOT NULL COMMENT 'status (1,2,3)',
  `descripcion` varchar(45) DEFAULT NULL COMMENT 'Status: 1=Completado 2=Capturado 3=En proceso',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`status`),
  KEY `fk_status_users1_idx` (`users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `status`
--

INSERT INTO `status` (`status`, `descripcion`, `users_id`) VALUES
(1, 'CAPTURADO', 1),
(2, 'COMPLETADO', 1),
(3, 'EN PROCESO', 1);

--
-- Disparadores `status`
--
DROP TRIGGER IF EXISTS `bit_D_status`;
DELIMITER //
CREATE TRIGGER `bit_D_status` AFTER DELETE ON `status`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *status*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro_old
)
VALUES (
'status', OLD.users_id, 'D', curdate( ) , concat_WS( '|', OLD.status, OLD.descripcion ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_status`;
DELIMITER //
CREATE TRIGGER `bit_I_status` AFTER INSERT ON `status`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *status*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro
)
VALUES (
'status', NEW.users_id, 'I', curdate( ) , concat_WS( '|', NEW.status, NEW.descripcion ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_status`;
DELIMITER //
CREATE TRIGGER `bit_U_status` AFTER UPDATE ON `status`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al MODIFICAR REGISTRO en *status*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro,registro_old
)
VALUES (
'status', NEW.users_id, 'U', curdate( ) , 
concat_WS( '|', NEW.status, NEW.descripcion ),
concat_WS( '|', OLD.status, OLD.descripcion )  
);

END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `status_horarios`
--

CREATE TABLE IF NOT EXISTS `status_horarios` (
  `periodo` int(11) NOT NULL COMMENT 'Período',
  `id` int(11) NOT NULL COMMENT 'Docente',
  `status` int(11) NOT NULL COMMENT 'Status Hor Docen 1=Compl 2=Capt 3=En proc',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`periodo`,`id`),
  KEY `fk_status_horarios_status1_idx` (`status`),
  KEY `fk_status_horarios_users1_idx` (`users_id`),
  KEY `fk_status_horarios_users2_idx` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Disparadores `status_horarios`
--
DROP TRIGGER IF EXISTS `bit_D_status_horarios`;
DELIMITER //
CREATE TRIGGER `bit_D_status_horarios` AFTER DELETE ON `status_horarios`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *status_horarios*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro_old
)
VALUES (
'status_horarios', OLD.users_id, 'D', curdate( ) , concat_WS( '|', OLD.periodo, OLD.id, OLD.status ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_status_horarios`;
DELIMITER //
CREATE TRIGGER `bit_I_status_horarios` AFTER INSERT ON `status_horarios`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *status_horarios*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro
)
VALUES (
'status_horarios', NEW.users_id, 'I', curdate( ) , concat_WS( '|', NEW.periodo, NEW.id, NEW.status ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_status_horarios`;
DELIMITER //
CREATE TRIGGER `bit_U_status_horarios` AFTER UPDATE ON `status_horarios`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al MODIFICAR REGISTRO en *status_horarios*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro,registro_old
)
VALUES (
'status_horarios', NEW.users_id, 'U', curdate( ) , 
 concat_WS( '|', NEW.periodo, NEW.id, NEW.status ),
 concat_WS( '|', OLD.periodo, OLD.id, OLD.status )  
);

END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `status_procesos`
--

CREATE TABLE IF NOT EXISTS `status_procesos` (
  `idstatus` int(11) NOT NULL COMMENT 'No Status',
  `periodo` int(11) NOT NULL COMMENT 'Período',
  `programaedu` int(11) NOT NULL COMMENT 'Carrera',
  `status_carga` int(11) NOT NULL COMMENT 'Status Carga',
  `status_plan` int(11) NOT NULL COMMENT 'Status Horario',
  `users_id` int(11) NOT NULL,
  KEY `fk_status_procesos_periodos1_idx` (`periodo`),
  KEY `fk_status_procesos_programaedu1_idx` (`programaedu`),
  KEY `fk_status_procesos_users1_idx` (`users_id`),
  KEY `fk_status_procesos_status1_idx` (`status_carga`),
  KEY `fk_status_procesos_status2_idx` (`status_plan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Disparadores `status_procesos`
--
DROP TRIGGER IF EXISTS `bit_D_status_procesos`;
DELIMITER //
CREATE TRIGGER `bit_D_status_procesos` AFTER DELETE ON `status_procesos`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *status_procesos*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------
INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro_old
)
VALUES (
'status_procesos', OLD.users_id, 'D', curdate( ) , concat_WS( '|', 
OLD.idstatus,
OLD.periodo,
OLD.programaedu,
OLD.status_carga,
OLD.status_plan
));

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_status_procesos`;
DELIMITER //
CREATE TRIGGER `bit_I_status_procesos` AFTER INSERT ON `status_procesos`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *status_procesos*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------
INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro
)
VALUES (
'status_procesos', NEW.users_id, 'I', curdate( ) , concat_WS( '|', 
NEW.idstatus,
NEW.periodo,
NEW.programaedu,
NEW.status_carga,
NEW.status_plan
));

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_status_procesos`;
DELIMITER //
CREATE TRIGGER `bit_U_status_procesos` AFTER UPDATE ON `status_procesos`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al MODIFICAR REGISTRO en *status_procesos*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------
INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro,registro_old
)
VALUES (
'status_procesos', NEW.users_id, 'U', curdate( ) , concat_WS( '|', 
NEW.idstatus,
NEW.periodo,
NEW.programaedu,
NEW.status_carga,
NEW.status_plan
),
concat_WS( '|', 
OLD.idstatus,
OLD.periodo,
OLD.programaedu,
OLD.status_carga,
OLD.status_plan
));

END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_curso_emp`
--

CREATE TABLE IF NOT EXISTS `tipo_curso_emp` (
  `tipo_curso_emp` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Tipo curso',
  `descripcion` varchar(45) NOT NULL COMMENT 'Descipción: Impartido, recibido, interés',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`tipo_curso_emp`),
  KEY `fk_tipo_curso_emp_users1_idx` (`users_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `tipo_curso_emp`
--

INSERT INTO `tipo_curso_emp` (`tipo_curso_emp`, `descripcion`, `users_id`) VALUES
(1, 'RECIBIDO', 1),
(2, 'IMPARTIDO', 1),
(3, 'DE INTERES', 1);

--
-- Disparadores `tipo_curso_emp`
--
DROP TRIGGER IF EXISTS `bit_D_tipo_curso_emp`;
DELIMITER //
CREATE TRIGGER `bit_D_tipo_curso_emp` AFTER DELETE ON `tipo_curso_emp`
 FOR EACH ROW BEGIN -- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *tipo_curso_emp*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------
INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro_old
)
VALUES (
'tipo_curso_emp', OLD.users_id, 'D', curdate( ) , concat_WS( '|', OLD.tipo_curso_emp, OLD.descripcion ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_tipo_curso_emp`;
DELIMITER //
CREATE TRIGGER `bit_I_tipo_curso_emp` AFTER INSERT ON `tipo_curso_emp`
 FOR EACH ROW BEGIN -- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *tipo_curso_emp*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------
INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro
)
VALUES (
'tipo_curso_emp', NEW.users_id, 'I', curdate( ) , concat_WS( '|', NEW.tipo_curso_emp, NEW.descripcion ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_tipo_curso_emp`;
DELIMITER //
CREATE TRIGGER `bit_U_tipo_curso_emp` AFTER UPDATE ON `tipo_curso_emp`
 FOR EACH ROW BEGIN -- -----------------------------------------------------
-- Bitacora al MODIFICAR REGISTRO en *tipo_curso_emp*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------
INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro,registro_old
)
VALUES (
'tipo_curso_emp', NEW.users_id, 'U', curdate( ) , 
concat_WS( '|', NEW.tipo_curso_emp, NEW.descripcion ),
concat_WS( '|', OLD.tipo_curso_emp, OLD.descripcion )  
);

END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabadicional_emp`
--

CREATE TABLE IF NOT EXISTS `trabadicional_emp` (
  `empresa` int(11) NOT NULL,
  `id` int(11) NOT NULL COMMENT 'Num empleado UABC',
  `fec_ing` date DEFAULT NULL COMMENT 'Fecha ingreso',
  `puesto` int(11) NOT NULL COMMENT 'puesto',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`id`,`empresa`),
  KEY `fk_trabadicional_emp_empresa_adic1_idx` (`empresa`),
  KEY `fk_trabadicional_emp_users1_idx` (`users_id`),
  KEY `fk_trabadicional_emp_puesto1_idx` (`puesto`),
  KEY `fk_trabadicional_emp_users2_idx` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Disparadores `trabadicional_emp`
--
DROP TRIGGER IF EXISTS `bit_D_trabadicional_emp`;
DELIMITER //
CREATE TRIGGER `bit_D_trabadicional_emp` AFTER DELETE ON `trabadicional_emp`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *trabadicional_emp*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro_old
)
VALUES (
'trabadicional_emp', OLD.users_id, 'D', curdate( ) , concat_WS( '|', OLD.empresa, OLD.id, OLD.fec_ing,OLD.puesto ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_trabadicional_emp`;
DELIMITER //
CREATE TRIGGER `bit_I_trabadicional_emp` AFTER INSERT ON `trabadicional_emp`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *trabadicional_emp*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro
)
VALUES (
'trabadicional_emp', NEW.users_id, 'I', curdate( ) , concat_WS( '|', NEW.empresa, NEW.id, NEW.fec_ing,NEW.puesto ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_trabadicional_emp`;
DELIMITER //
CREATE TRIGGER `bit_U_trabadicional_emp` AFTER UPDATE ON `trabadicional_emp`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al MODIFICAR REGISTRO en *trabadicional_emp*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro,registro_old
)
VALUES (
'trabadicional_emp', NEW.users_id, 'U', curdate( ) , 
concat_WS( '|', NEW.empresa, NEW.id, NEW.fec_ing,NEW.puesto ),
concat_WS( '|', OLD.empresa, OLD.id, OLD.fec_ing,OLD.puesto )  
);

END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `turnos`
--

CREATE TABLE IF NOT EXISTS `turnos` (
  `turno` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Turno  (1,2,3)',
  `descripcion` varchar(20) NOT NULL COMMENT 'Descripción: Matutino, Vespertino, Interturnos',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`turno`),
  UNIQUE KEY `codigo_UNIQUE` (`turno`),
  KEY `fk_turnos_users1_idx` (`users_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `turnos`
--

INSERT INTO `turnos` (`turno`, `descripcion`, `users_id`) VALUES
(1, 'MATUTINO', 1),
(2, 'VESPERTINO', 1),
(3, 'INTERTURNO', 1);

--
-- Disparadores `turnos`
--
DROP TRIGGER IF EXISTS `bit_D_turnos`;
DELIMITER //
CREATE TRIGGER `bit_D_turnos` AFTER DELETE ON `turnos`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *turnos*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro_old
)
VALUES (
'turnos', OLD.users_id, 'D', curdate( ) , concat_WS( '|', OLD.turno, OLD.descripcion ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_turnos`;
DELIMITER //
CREATE TRIGGER `bit_I_turnos` AFTER INSERT ON `turnos`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *turnos*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro
)
VALUES (
'turnos', NEW.users_id, 'I', curdate( ) , concat_WS( '|', NEW.turno, NEW.descripcion ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_turnos`;
DELIMITER //
CREATE TRIGGER `bit_U_turnos` AFTER UPDATE ON `turnos`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al MODIFICAR REGISTRO en *turnos*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro,registro_old
)
VALUES (
'turnos', NEW.users_id, 'U', curdate( ) , 
 concat_WS( '|', NEW.turno, NEW.descripcion ),
 concat_WS( '|', OLD.turno, OLD.descripcion )  
);

END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `uacademica`
--

CREATE TABLE IF NOT EXISTS `uacademica` (
  `uacademica` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo Facultad',
  `descripshort` varchar(10) NOT NULL COMMENT 'Descripcion (FCQ, FCA)',
  `descripcion` varchar(60) NOT NULL COMMENT 'Descripcion Facultad',
  `campus` int(11) NOT NULL DEFAULT '1' COMMENT 'Codigo campus',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`uacademica`),
  UNIQUE KEY `UAC_codigo_UNIQUE` (`uacademica`),
  KEY `fk_uacademica_campus1_idx` (`campus`),
  KEY `fk_uacademica_users1_idx` (`users_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Volcado de datos para la tabla `uacademica`
--

INSERT INTO `uacademica` (`uacademica`, `descripshort`, `descripcion`, `campus`, `users_id`) VALUES
(1, 'FCA', 'FACULTAD DE CONTADURIA Y ADMINISTRACION', 1, 1),
(2, 'FCQI', 'FACULTAD DE CIENCIAS QUIMICAS E INGENIERIA', 1, 1),
(3, 'FHCS', 'FACULTAD DE HUMANIDADES Y CIENCIAS SOCIALES', 1, 1),
(4, 'FD', 'FACULTAD DE DERECHO', 1, 1),
(5, 'FERI', 'FACULTAD DE ECONOMIA Y RELACIONES INTERNACIONALES', 1, 1),
(6, 'FIN', 'FACULTAD DE INGENIERIA Y NEGOCIOS', 1, 1),
(7, 'FMP', 'FACULTAD DE MEDICINA Y PSICOLOGIA', 1, 1),
(8, 'FO', 'FACULTAD DE ODONTOLOGIA', 1, 1),
(9, 'FTM', 'FACULTAD DE TURISMO Y MERCADOTECNIA', 1, 1),
(10, 'FA', 'FACULTAD DE ARTES', 1, 1);

--
-- Disparadores `uacademica`
--
DROP TRIGGER IF EXISTS `bit_D_uacademica`;
DELIMITER //
CREATE TRIGGER `bit_D_uacademica` AFTER DELETE ON `uacademica`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *uacademica*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro_old
)
VALUES (
'uacademica', OLD.users_id, 'D', curdate( ) , concat_WS( '|', OLD.uacademica, OLD.descripshort, OLD.descripcion,OLD.campus 
));
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_uacademica`;
DELIMITER //
CREATE TRIGGER `bit_I_uacademica` AFTER INSERT ON `uacademica`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *uacademica*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro
)
VALUES (
'uacademica', NEW.users_id, 'I', curdate( ) , concat_WS( '|', NEW.uacademica, NEW.descripshort, NEW.descripcion,NEW.campus 
));
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_uacademica`;
DELIMITER //
CREATE TRIGGER `bit_U_uacademica` AFTER UPDATE ON `uacademica`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al MODIFICAR REGISTRO en *uacademica*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro,registro_old
)
VALUES (
'uacademica', NEW.users_id, 'U', curdate( ) , 
concat_WS( '|', NEW.uacademica, NEW.descripshort, NEW.descripcion,NEW.campus),
concat_WS( '|', OLD.uacademica, OLD.descripshort, OLD.descripcion,OLD.campus)
);
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `uaprendizaje`
--

CREATE TABLE IF NOT EXISTS `uaprendizaje` (
  `uaprendizaje` int(11) NOT NULL COMMENT 'Código uaprendizaje (SOLO NUMERICOS)',
  `descripcionmat` varchar(100) NOT NULL COMMENT 'Descripción  uaprendizaje',
  `HC` int(11) NOT NULL DEFAULT '0' COMMENT 'Horas Clase',
  `HL` int(11) NOT NULL DEFAULT '0' COMMENT 'Horas Laboratorio',
  `HT` int(11) NOT NULL DEFAULT '0' COMMENT 'Horas Taller',
  `HPC` int(11) NOT NULL DEFAULT '0' COMMENT 'Horas',
  `HCL` int(11) NOT NULL DEFAULT '0' COMMENT 'Horas Clinica',
  `HE` int(11) NOT NULL DEFAULT '0' COMMENT 'Horas Extra',
  `creditos` int(11) NOT NULL DEFAULT '0' COMMENT 'Numero de Créditos\n1Hr Clase= 2c',
  `fec_aut` date DEFAULT NULL COMMENT 'Fecha autorización',
  `observa` varchar(60) DEFAULT NULL COMMENT 'Observaciones',
  `coordinaciona` int(11) NOT NULL COMMENT 'Codigo coordinacion area',
  `plan` int(11) NOT NULL COMMENT 'Codigo plan estudio',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`uaprendizaje`),
  UNIQUE KEY `UA_clave_UNIQUE` (`uaprendizaje`),
  KEY `fk_uaprendizaje_coordinaciona1_idx` (`coordinaciona`),
  KEY `fk_uaprendizaje_planestudio1_idx` (`plan`),
  KEY `fk_uaprendizaje_users1_idx` (`users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='<double-click to overwrite multiple objects>';

--
-- Volcado de datos para la tabla `uaprendizaje`
--

INSERT INTO `uaprendizaje` (`uaprendizaje`, `descripcionmat`, `HC`, `HL`, `HT`, `HPC`, `HCL`, `HE`, `creditos`, `fec_aut`, `observa`, `coordinaciona`, `plan`, `users_id`) VALUES
(11236, 'MATEMÁTICAS I', 5, 5, 5, 0, 0, 0, 15, '2015-01-29', NULL, 1, 20091, 1),
(11237, 'MATEMÁTICAS II', 15, 2, 0, 0, 0, 0, 32, '2015-01-29', 'vamos a ver', 1, 20091, 1),
(11238, 'MATEMÁTICAS BASICAS', 3, 0, 0, 0, 0, 0, 6, '2015-01-29', 'vamos a ver', 1, 20091, 1),
(11239, 'ESPAÑOL', 3, 0, 0, 0, 0, 0, 6, '2015-01-29', 'vamos a ver', 2, 20091, 1),
(11240, 'OPTATIVA 1', 3, 0, 0, 0, 0, 0, 6, '2015-01-29', 'vamos a ver', 5, 20091, 1),
(11241, 'MATEMATICAS III', 5, 5, 0, 0, 0, 0, 15, '2015-02-14', 'vamos a ver', 1, 20091, 1),
(11242, 'CIVISMO SEMESTRE 2', 4, 4, 4, 0, 0, 0, 16, '2015-02-20', 'vamnos a ver', 1, 20091, 1),
(11243, 'CIVISMO 3', 5, 2, 2, 0, 0, 0, 14, '2015-03-15', NULL, 1, 20091, 1),
(11244, 'MATERIA 4', 5, 6, 0, 0, 0, 0, 16, '2015-03-15', 'vamos a ver', 2, 20091, 1),
(11245, 'MATERIA 5', 6, 2, 0, 0, 0, 1, 15, '2015-03-15', 'esto que es', 1, 20091, 1),
(11246, 'MATERIA 6', 3, 2, 5, 0, 0, 0, 13, '2015-03-15', NULL, 1, 20091, 1),
(11247, 'MATERIA 7', 4, 2, 0, 0, 0, 0, 10, '2015-03-15', 'vamos a ver', 1, 20091, 1),
(11248, 'MATERIA 8', 3, 0, 0, 0, 0, 0, 6, '2015-03-15', 'que es esto', 2, 20091, 1),
(11270, 'MATERIA NUEVA', 5, 5, 0, 0, 0, 5, 20, '2015-06-03', NULL, 1, 20091, 1),
(11271, 'OTRA M', 5, 5, 5, 5, 5, 5, 35, '2015-06-10', 'vamos a ver', 2, 20091, 1),
(11272, 'HASTA EL DIA', 2, 2, 2, 0, 0, 0, 8, '2015-06-10', 'vamos', 2, 20091, 1);

--
-- Disparadores `uaprendizaje`
--
DROP TRIGGER IF EXISTS `bit_D_uaprendizaje`;
DELIMITER //
CREATE TRIGGER `bit_D_uaprendizaje` AFTER DELETE ON `uaprendizaje`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *uaprendizaje*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Dic 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro_old
)
VALUES (
'uaprendizaje', OLD.users_id, 'D', curdate( ) , concat_WS( '|', 
OLD.uaprendizaje, 
OLD.descripcionmat, 
OLD.HC,
OLD.HL,
OLD.HT,
OLD.HPC,
OLD.HCL,
OLD.HE,
OLD.creditos,
OLD.fec_aut,
OLD.observa,
OLD.coordinaciona,
OLD.plan ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_uaprendizaje`;
DELIMITER //
CREATE TRIGGER `bit_I_uaprendizaje` AFTER INSERT ON `uaprendizaje`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *uaprendizaje*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Dic 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro
)
VALUES (
'uaprendizaje', NEW.users_id, 'I', curdate( ) , 
concat_WS( '|', NEW.uaprendizaje, NEW.descripcionmat, NEW.HC,NEW.HL,NEW.HT,NEW.HPC,NEW.HCL,NEW.HE,NEW.creditos,NEW.fec_aut,NEW.observa,NEW.coordinaciona,NEW.plan )
);
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_uaprendizaje`;
DELIMITER //
CREATE TRIGGER `bit_U_uaprendizaje` AFTER UPDATE ON `uaprendizaje`
 FOR EACH ROW -- -----------------------------------------------------
-- Bitacora al MODIFICAR REGISTRO en *uaprendizaje*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro,registro_old
)
VALUES (
'uaprendizaje', NEW.users_id, 'U', curdate( ) , 
concat_WS( '|', NEW.uaprendizaje, NEW.descripcionmat, NEW.HC,NEW.HL,NEW.HT,NEW.HPC,NEW.HCL,NEW.HE,NEW.creditos,NEW.fec_aut,NEW.observa,NEW.coordinaciona,NEW.plan ),
concat_WS( '|', OLD.uaprendizaje, OLD.descripcionmat, OLD.HC,OLD.HL,OLD.HT,OLD.HPC,OLD.HCL,OLD.HE,OLD.creditos,OLD.fec_aut,OLD.observa,OLD.coordinaciona,OLD.plan )  
)
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `universidades_emp`
--

CREATE TABLE IF NOT EXISTS `universidades_emp` (
  `universidad` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Universidad empleados',
  `descripcion` varchar(60) NOT NULL COMMENT 'Descripcion Universidad',
  `descripshort` varchar(10) NOT NULL,
  `ciudad` int(11) NOT NULL COMMENT 'Ciudad',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`universidad`),
  KEY `fk_universidades_emp_ciudad1_idx` (`ciudad`),
  KEY `fk_universidades_emp_users1_idx` (`users_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `universidades_emp`
--

INSERT INTO `universidades_emp` (`universidad`, `descripcion`, `descripshort`, `ciudad`, `users_id`) VALUES
(1, 'UNIVERSIDAD AUTONOMA DE BAJA CALIFORNIA', 'UABC', 16, 1),
(2, 'INSTITUTO TECNOLOGICO DE TIJUANA', 'ITT', 16, 1);

--
-- Disparadores `universidades_emp`
--
DROP TRIGGER IF EXISTS `bit_D_universidades_emp`;
DELIMITER //
CREATE TRIGGER `bit_D_universidades_emp` AFTER DELETE ON `universidades_emp`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *universidades_emp*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro_old
)
VALUES (
'universidades_emp', OLD.users_id, 'D', curdate( ) , concat_WS( '|', 
OLD.universidad, 
OLD.descripcion,
OLD.descripshort,
OLD.ciudad ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_universidades_emp`;
DELIMITER //
CREATE TRIGGER `bit_I_universidades_emp` AFTER INSERT ON `universidades_emp`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *universidades_emp*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro
)
VALUES (
'universidades_emp', NEW.users_id, 'I', curdate( ) , concat_WS( '|', 
NEW.universidad, 
NEW.descripcion,
NEW.descripshort,
NEW.ciudad ) 
);

END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_universidades_emp`;
DELIMITER //
CREATE TRIGGER `bit_U_universidades_emp` AFTER UPDATE ON `universidades_emp`
 FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al MODIFICAR REGISTRO en *universidades_emp*
-- Uso: SIGAF UABC 
-- Autor:Delia Yadira Gambino Tj. BC Oct 2014 
-- -----------------------------------------------------

INSERT INTO `bitacora` (
tabla,
usuario,
operacion,
fecha,
registro,registro_old
)
VALUES (
'universidades_emp', NEW.users_id, 'U', curdate( ) , concat_WS( '|', 
NEW.universidad, 
NEW.descripcion,
NEW.descripshort,
NEW.ciudad),
concat_WS( '|',
OLD.universidad, 
OLD.descripcion,
OLD.descripshort,
OLD.ciudad)  
);

END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `last_materno` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `phone` int(11) DEFAULT NULL,
  `campus` int(11) NOT NULL,
  `uacademica` int(11) NOT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `level` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `remember_token` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `sexo` char(1) DEFAULT NULL COMMENT 'Sexo',
  `rfc` varchar(13) DEFAULT NULL COMMENT 'RFC empleado',
  `fec_nac` date DEFAULT NULL COMMENT 'Fecha nacimiento',
  `fec_ing` date DEFAULT NULL COMMENT 'Fecha ingreso a UABC',
  `email_alternat` varchar(45) DEFAULT NULL COMMENT 'email alternativo',
  `ciudad` int(11) DEFAULT NULL COMMENT 'cd',
  `calle` varchar(45) DEFAULT NULL COMMENT 'Calle',
  `no_ext` int(11) DEFAULT NULL COMMENT 'No int',
  `no_int` varchar(3) DEFAULT NULL COMMENT 'No ext',
  `colonia` varchar(45) DEFAULT NULL COMMENT 'Colonia',
  `cp` int(11) DEFAULT NULL COMMENT 'cp',
  `telofna` varchar(45) DEFAULT NULL COMMENT 'Tel ofna',
  `telcel` varchar(45) DEFAULT NULL COMMENT 'Cel',
  `categoria` int(11) DEFAULT NULL COMMENT 'categoria',
  `unidad` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ua` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `programaedu` int(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_username_unique` (`username`),
  KEY `fk_users_uacademica1_idx` (`uacademica`),
  KEY `fk_users_campus1_idx` (`campus`),
  KEY `fk_users_categorias1_idx` (`categoria`),
  KEY `fk_users_ciudad1_idx` (`ciudad`),
  KEY `fk_users_levels1_idx` (`level`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `last_name`, `last_materno`, `email`, `address`, `phone`, `campus`, `uacademica`, `username`, `password`, `level`, `created_at`, `updated_at`, `remember_token`, `sexo`, `rfc`, `fec_nac`, `fec_ing`, `email_alternat`, `ciudad`, `calle`, `no_ext`, `no_int`, `colonia`, `cp`, `telofna`, `telcel`, `categoria`, `unidad`, `ua`, `programaedu`) VALUES
(1, 'Cynthia', 'Duarte', 'Frausto', 'zyntya@hotmail.com', 'Real de Calacoaya 7810-3B', 6450706, 1, 1, 'Tikita', '$2y$10$xnsOE1TJVotNVKW9vSqTme76Dk0OO0GAe9zrl2rvFZFwI2T0iF3GG', 1, '2014-04-19 19:30:58', '2015-06-10 23:41:44', 'pHL7iUBzx9WniN8Z5G43meT4PBfXjn2Nzm1FCjZtKK4QIw8DXNVDvpMXL2CR', 'F', 'ICU870212HBC', '1985-12-01', '2014-12-02', 'zyntya@uabc.edu.mx', 16, 'CALLE SERRADILLA', 500, 'A  ', 'MONTGOMERY', 22310, '664-9740000', '664-9740000', 101, 'ENSENADA', 'FCA', 0),
(2, 'Ivan', 'Duarte', 'Jeyson', 'wolfogan@gmail.com', 'Col. Nueva Tijuana', 6233987, 1, 1, 'LoganX', '$2y$10$Di0Yl1lU/GdnLfdaOAnVNOCf.DTDASCERnguBuaanFU796CqnQP5O', 2, '2014-04-19 19:30:58', '2015-05-26 02:12:30', 'tFVqHQD0rt2yIGlR7GeIM0D0HmwgMdGDMNbyq0xtfXG2jOoobEqkw45H5ARM', 'M', NULL, '1990-12-02', '2014-12-31', 'luz.lugo@uabc.edu.mx', 16, 'DE LOS LAURELES', 600, '0', 'EL CIRCULO', 22450, '664-1236789', '664''1236789', 101, 'VALLE DE LA TRINIDAD', 'FD', 1),
(3, 'Maestro', 'Perez', 'Morales', 'maestro@maestro.com', '', 6450706, 1, 1, 'Maestro', '$2y$10$qWeWE7XG6ZkDEeu5t93/g.ym0fGHxazv9fyXfIEQhNiZ9E4LWYHQG', 5, '2015-05-26 02:11:59', '2015-06-10 22:47:57', '7S7mvSgInjmJ5Tiq8Ltb1NdxTkjJ9JuFdT3k5roDjqRHjWExjGw9FNmM1Zql', 'F', 'ICU870212HBC', NULL, '2015-05-25', 'maestro@alternativo.mx', 16, 'LIMON', 10, ' 5 ', 'REAL DE SAN FRANCISCO', 3345, '2654786', '6642650628', 104, '', '', 0),
(4, 'Nora', 'Osuna', 'Millan', 'nora.osuna@aubc.edu.mx', '', 9797500, 1, 1, 'non', '$2y$10$lG5cPdvAGWKZLm2Nw2znmudyH.osd833ESSceJ4JU.TKbKXFFGu/.', 5, '2015-06-03 03:06:11', '2015-06-03 03:08:28', 'k2tHimIOgwIbJranzotfuc2eTfoe9iXhXSRRz9petAinpwwnSNK12iaSdbpe', 'F', 'OUMN720826', NULL, '2015-06-02', 'nora@otro.com.mx', 16, 'Alfonso vidal y planas', 123, ' 12', 'miel', 22236, '6459798', '24234232', 103, '', '', 0);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_carga`
--
CREATE TABLE IF NOT EXISTS `vw_carga` (
`carrera` int(11)
,`desc_carr` varchar(60)
,`semestre` int(11)
,`periodo` int(11)
,`desc_periodo` varchar(40)
,`uaprendizaje` int(11)
,`descripcionmat` varchar(100)
,`creditos` int(11)
,`HC` int(11)
,`ETAPA` int(11)
,`desc_etapa` varchar(20)
,`grupo` int(11)
,`requisito` varchar(256)
,`tunros` varchar(341)
,`grupos` varchar(256)
);
-- --------------------------------------------------------

--
-- Estructura para la vista `vw_carga`
--
DROP TABLE IF EXISTS `vw_carga`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_carga` AS select max(`cr`.`programaedu`) AS `carrera`,max(`pre`.`descripcion`) AS `desc_carr`,max(`cr`.`semestre`) AS `semestre`,max(`cr`.`periodo`) AS `periodo`,max(`pe`.`descripcion`) AS `desc_periodo`,max(`cr`.`uaprendizaje`) AS `uaprendizaje`,max(`uap`.`descripcionmat`) AS `descripcionmat`,max(`uap`.`creditos`) AS `creditos`,max(`uap`.`HC`) AS `HC`,max(`pua`.`etapa`) AS `ETAPA`,max(`et`.`descripcion`) AS `desc_etapa`,max(`cr`.`grupo`) AS `grupo`,(select group_concat(`ds`.`uaprequisito` separator ',') from `detalleseriacion` `ds` where ((`ds`.`uaprendizaje` = `cr`.`uaprendizaje`) and (`ds`.`programaedu` = `gr`.`programaedu`))) AS `requisito`,(select group_concat(`turnos`.`descripcion` separator ',') from (`grupos` left join `turnos` on((`grupos`.`turno` = `turnos`.`turno`))) where (`grupos`.`grupo` = `cr`.`grupo`)) AS `tunros`,(select group_concat(`carga`.`grupo` separator ',') from `carga` where ((`carga`.`uaprendizaje` = `cr`.`uaprendizaje`) and (`carga`.`periodo` = `cr`.`periodo`) and (`carga`.`semestre` = `cr`.`semestre`))) AS `grupos` from ((((((((`carga` `cr` left join `uaprendizaje` `uap` on((`cr`.`uaprendizaje` = `uap`.`uaprendizaje`))) join `p_ua` `pua` on(((`pua`.`programaedu` = `cr`.`programaedu`) and (`pua`.`uaprendizaje` = `cr`.`uaprendizaje`)))) left join `grupos` `gr` on(((`gr`.`grupo` = `cr`.`grupo`) and (`gr`.`periodo` = `cr`.`periodo`) and (`gr`.`programaedu` = `cr`.`programaedu`)))) left join `programaedu` `pre` on((`pre`.`programaedu` = `pua`.`programaedu`))) left join `periodos` `pe` on(((`pe`.`periodo` = `cr`.`periodo`) and (`pe`.`periodo` = `pe`.`periodo`)))) left join `turnos` `tu` on((`tu`.`turno` = `gr`.`turno`))) left join `detalleseriacion` `ds` on(((`ds`.`uaprendizaje` = `cr`.`uaprendizaje`) and (`ds`.`programaedu` = `gr`.`programaedu`)))) left join `etapas` `et` on((`et`.`etapa` = `pua`.`etapa`))) group by `cr`.`periodo`,`cr`.`programaedu`,`cr`.`semestre`,`pua`.`uaprendizaje`;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `campus`
--
ALTER TABLE `campus`
  ADD CONSTRAINT `fk_campus_ciudad1` FOREIGN KEY (`ciudad`) REFERENCES `ciudad` (`ciudad`),
  ADD CONSTRAINT `fk_campus_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `caracteristica_cur`
--
ALTER TABLE `caracteristica_cur`
  ADD CONSTRAINT `fk_caracteristica_cur_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `carga`
--
ALTER TABLE `carga`
  ADD CONSTRAINT `fk_carga_grupos1` FOREIGN KEY (`grupo`, `periodo`) REFERENCES `grupos` (`grupo`, `periodo`),
  ADD CONSTRAINT `fk_carga_pua1` FOREIGN KEY (`programaedu`, `uaprendizaje`) REFERENCES `p_ua` (`programaedu`, `uaprendizaje`),
  ADD CONSTRAINT `fk_carga_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `carreras_emp`
--
ALTER TABLE `carreras_emp`
  ADD CONSTRAINT `fk_carreras_emp_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD CONSTRAINT `fk_categorias_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD CONSTRAINT `fk_ciudad_estado1` FOREIGN KEY (`estado`) REFERENCES `estado` (`estado`),
  ADD CONSTRAINT `fk_ciudad_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `coordinaciona`
--
ALTER TABLE `coordinaciona`
  ADD CONSTRAINT `fk_coordinaciona_programaedu1` FOREIGN KEY (`programaedu`) REFERENCES `programaedu` (`programaedu`),
  ADD CONSTRAINT `fk_coordinaciona_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `detalleseriacion`
--
ALTER TABLE `detalleseriacion`
  ADD CONSTRAINT `fk_detalleseriacion_pua` FOREIGN KEY (`programaedu`, `uaprendizaje`) REFERENCES `p_ua` (`programaedu`, `uaprendizaje`),
  ADD CONSTRAINT `fk_detalleseriacion_reqseriacion1` FOREIGN KEY (`reqseriacion`) REFERENCES `reqseriacion` (`reqseriacion`),
  ADD CONSTRAINT `fk_detalleseriacion_uaprendizaje2` FOREIGN KEY (`uaprequisito`) REFERENCES `uaprendizaje` (`uaprendizaje`),
  ADD CONSTRAINT `fk_detalleseriacion_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `dias`
--
ALTER TABLE `dias`
  ADD CONSTRAINT `fk_dias_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `disp_hrs_dias`
--
ALTER TABLE `disp_hrs_dias`
  ADD CONSTRAINT `fk_disp_hrs_dias_dias2` FOREIGN KEY (`dia`) REFERENCES `dias` (`dia`),
  ADD CONSTRAINT `fk_disp_hrs_dias_horas1` FOREIGN KEY (`hora`) REFERENCES `horas` (`hora`),
  ADD CONSTRAINT `fk_disp_hrs_dias_periodos1` FOREIGN KEY (`periodo`) REFERENCES `periodos` (`periodo`),
  ADD CONSTRAINT `fk_disp_hrs_dias_status1` FOREIGN KEY (`status`) REFERENCES `status` (`status`),
  ADD CONSTRAINT `fk_disp_hrs_dias_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `fk_disp_hrs_dias_users2` FOREIGN KEY (`id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `disp_ua`
--
ALTER TABLE `disp_ua`
  ADD CONSTRAINT `fk_disp_ua_periodos1` FOREIGN KEY (`periodo`) REFERENCES `periodos` (`periodo`),
  ADD CONSTRAINT `fk_disp_ua_uaprendizaje1` FOREIGN KEY (`uaprendizaje`) REFERENCES `uaprendizaje` (`uaprendizaje`),
  ADD CONSTRAINT `fk_disp_ua_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `fk_disp_ua_users2` FOREIGN KEY (`id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `doctos`
--
ALTER TABLE `doctos`
  ADD CONSTRAINT `fk_doctos_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `documentos_emp`
--
ALTER TABLE `documentos_emp`
  ADD CONSTRAINT `fk_documentos_emp_doctos1` FOREIGN KEY (`docto`) REFERENCES `doctos` (`docto`),
  ADD CONSTRAINT `fk_documentos_emp_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `fk_documentos_emp_users2` FOREIGN KEY (`id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `empresa_adic`
--
ALTER TABLE `empresa_adic`
  ADD CONSTRAINT `fk_empresa_adic_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `esp_prog_edu`
--
ALTER TABLE `esp_prog_edu`
  ADD CONSTRAINT `fk_esp_prog_edu_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `estado`
--
ALTER TABLE `estado`
  ADD CONSTRAINT `fk_estado_pais1` FOREIGN KEY (`pais`) REFERENCES `pais` (`pais`),
  ADD CONSTRAINT `fk_estado_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `etapas`
--
ALTER TABLE `etapas`
  ADD CONSTRAINT `fk_etapas_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `grupos`
--
ALTER TABLE `grupos`
  ADD CONSTRAINT `fk_grupos_periodos1` FOREIGN KEY (`periodo`) REFERENCES `periodos` (`periodo`),
  ADD CONSTRAINT `fk_grupos_planestudio1` FOREIGN KEY (`plan`, `programaedu`) REFERENCES `plan_programa` (`plan`, `programaedu`),
  ADD CONSTRAINT `fk_grupos_turnos1` FOREIGN KEY (`turno`) REFERENCES `turnos` (`turno`),
  ADD CONSTRAINT `fk_grupos_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `horarios`
--
ALTER TABLE `horarios`
  ADD CONSTRAINT `fk_horarios_dias1` FOREIGN KEY (`dia`) REFERENCES `dias` (`dia`),
  ADD CONSTRAINT `fk_horarios_grupos1` FOREIGN KEY (`grupo`, `periodo`) REFERENCES `grupos` (`grupo`, `periodo`),
  ADD CONSTRAINT `fk_horarios_horas1` FOREIGN KEY (`hora`) REFERENCES `horas` (`hora`),
  ADD CONSTRAINT `fk_horarios_uaprendizaje1` FOREIGN KEY (`uaprendizaje`) REFERENCES `uaprendizaje` (`uaprendizaje`),
  ADD CONSTRAINT `fk_horarios_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `fk_horarios_users2` FOREIGN KEY (`id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `horas`
--
ALTER TABLE `horas`
  ADD CONSTRAINT `fk_horas_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `levels`
--
ALTER TABLE `levels`
  ADD CONSTRAINT `fk_levels_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `nvprograma`
--
ALTER TABLE `nvprograma`
  ADD CONSTRAINT `fk_nvprograma_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `pais`
--
ALTER TABLE `pais`
  ADD CONSTRAINT `fk_pais_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `periodos`
--
ALTER TABLE `periodos`
  ADD CONSTRAINT `fk_periodos_periodo_prog_edu1` FOREIGN KEY (`periodo_pedu`) REFERENCES `periodo_prog_edu` (`periodo_pedu`),
  ADD CONSTRAINT `fk_periodos_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `periodo_prog_edu`
--
ALTER TABLE `periodo_prog_edu`
  ADD CONSTRAINT `fk_periodo_prog_edu_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `planestudio`
--
ALTER TABLE `planestudio`
  ADD CONSTRAINT `fk_planestudiodesc_nvprograma1` FOREIGN KEY (`nivel`) REFERENCES `nvprograma` (`nivel`),
  ADD CONSTRAINT `fk_planestudiodesc_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `plan_programa`
--
ALTER TABLE `plan_programa`
  ADD CONSTRAINT `fk_planestudio_planestudiodesc1` FOREIGN KEY (`plan`) REFERENCES `planestudio` (`plan`),
  ADD CONSTRAINT `fk_planestudio_programaedu1` FOREIGN KEY (`programaedu`) REFERENCES `programaedu` (`programaedu`),
  ADD CONSTRAINT `fk_planestudio_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `programaedu`
--
ALTER TABLE `programaedu`
  ADD CONSTRAINT `fk_programaedu_esp_prog_edu1` FOREIGN KEY (`especialidad`) REFERENCES `esp_prog_edu` (`especialidad`),
  ADD CONSTRAINT `fk_programaedu_nvprograma1` FOREIGN KEY (`nivel`) REFERENCES `nvprograma` (`nivel`),
  ADD CONSTRAINT `fk_programaedu_periodo_prog_edu1` FOREIGN KEY (`periodo_pedu`) REFERENCES `periodo_prog_edu` (`periodo_pedu`),
  ADD CONSTRAINT `fk_programaedu_uacademica1` FOREIGN KEY (`uacademica`) REFERENCES `uacademica` (`uacademica`),
  ADD CONSTRAINT `fk_programaedu_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `puesto`
--
ALTER TABLE `puesto`
  ADD CONSTRAINT `fk_puesto_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `puestosemp`
--
ALTER TABLE `puestosemp`
  ADD CONSTRAINT `fk_puestosemp_puesto1` FOREIGN KEY (`puesto`) REFERENCES `puesto` (`puesto`),
  ADD CONSTRAINT `fk_puestosemp_uacademica1` FOREIGN KEY (`uacademica`) REFERENCES `uacademica` (`uacademica`),
  ADD CONSTRAINT `fk_puestosemp_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `fk_puestosemp_users2` FOREIGN KEY (`id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `p_ua`
--
ALTER TABLE `p_ua`
  ADD CONSTRAINT `fk_p_ua_caracter1` FOREIGN KEY (`caracter`) REFERENCES `caracter` (`caracter`),
  ADD CONSTRAINT `fk_p_ua_etapas1` FOREIGN KEY (`etapa`) REFERENCES `etapas` (`etapa`),
  ADD CONSTRAINT `fk_p_ua_programaedu1` FOREIGN KEY (`programaedu`) REFERENCES `programaedu` (`programaedu`),
  ADD CONSTRAINT `fk_p_ua_uaprendizaje1` FOREIGN KEY (`uaprendizaje`) REFERENCES `uaprendizaje` (`uaprendizaje`),
  ADD CONSTRAINT `fk_p_ua_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `reqseriacion`
--
ALTER TABLE `reqseriacion`
  ADD CONSTRAINT `fk_reqseriacion_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `status`
--
ALTER TABLE `status`
  ADD CONSTRAINT `fk_status_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `status_horarios`
--
ALTER TABLE `status_horarios`
  ADD CONSTRAINT `fk_status_horarios_periodos1` FOREIGN KEY (`periodo`) REFERENCES `periodos` (`periodo`),
  ADD CONSTRAINT `fk_status_horarios_status1` FOREIGN KEY (`status`) REFERENCES `status` (`status`),
  ADD CONSTRAINT `fk_status_horarios_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `fk_status_horarios_users2` FOREIGN KEY (`id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `status_procesos`
--
ALTER TABLE `status_procesos`
  ADD CONSTRAINT `fk_status_procesos_periodos1` FOREIGN KEY (`periodo`) REFERENCES `periodos` (`periodo`),
  ADD CONSTRAINT `fk_status_procesos_programaedu1` FOREIGN KEY (`programaedu`) REFERENCES `programaedu` (`programaedu`),
  ADD CONSTRAINT `fk_status_procesos_status1` FOREIGN KEY (`status_carga`) REFERENCES `status` (`status`),
  ADD CONSTRAINT `fk_status_procesos_status2` FOREIGN KEY (`status_plan`) REFERENCES `status` (`status`),
  ADD CONSTRAINT `fk_status_procesos_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `tipo_curso_emp`
--
ALTER TABLE `tipo_curso_emp`
  ADD CONSTRAINT `fk_tipo_curso_emp_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `trabadicional_emp`
--
ALTER TABLE `trabadicional_emp`
  ADD CONSTRAINT `fk_trabadicional_emp_empresa_adic1` FOREIGN KEY (`empresa`) REFERENCES `empresa_adic` (`empresa`),
  ADD CONSTRAINT `fk_trabadicional_emp_puesto1` FOREIGN KEY (`puesto`) REFERENCES `puesto` (`puesto`),
  ADD CONSTRAINT `fk_trabadicional_emp_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `fk_trabadicional_emp_users2` FOREIGN KEY (`id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `turnos`
--
ALTER TABLE `turnos`
  ADD CONSTRAINT `fk_turnos_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `uacademica`
--
ALTER TABLE `uacademica`
  ADD CONSTRAINT `fk_uacademica_campus1` FOREIGN KEY (`campus`) REFERENCES `campus` (`campus`),
  ADD CONSTRAINT `fk_uacademica_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `uaprendizaje`
--
ALTER TABLE `uaprendizaje`
  ADD CONSTRAINT `fk_uaprendizaje_coordinaciona1` FOREIGN KEY (`coordinaciona`) REFERENCES `coordinaciona` (`coordinaciona`),
  ADD CONSTRAINT `fk_uaprendizaje_planprograma1` FOREIGN KEY (`plan`) REFERENCES `plan_programa` (`plan`),
  ADD CONSTRAINT `fk_uaprendizaje_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `universidades_emp`
--
ALTER TABLE `universidades_emp`
  ADD CONSTRAINT `fk_universidades_emp_ciudad1` FOREIGN KEY (`ciudad`) REFERENCES `ciudad` (`ciudad`),
  ADD CONSTRAINT `fk_universidades_emp_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_users_campus1` FOREIGN KEY (`campus`) REFERENCES `campus` (`campus`),
  ADD CONSTRAINT `fk_users_categorias1` FOREIGN KEY (`categoria`) REFERENCES `categorias` (`categoria`),
  ADD CONSTRAINT `fk_users_ciudad1` FOREIGN KEY (`ciudad`) REFERENCES `ciudad` (`ciudad`),
  ADD CONSTRAINT `fk_users_levels1` FOREIGN KEY (`level`) REFERENCES `levels` (`level`),
  ADD CONSTRAINT `fk_users_uacademica1` FOREIGN KEY (`uacademica`) REFERENCES `uacademica` (`uacademica`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
