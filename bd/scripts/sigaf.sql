-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 12, 2015 at 02:17 AM
-- Server version: 5.5.24-log
-- PHP Version: 5.4.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `sigaf`
--

-- --------------------------------------------------------

--
-- Table structure for table `act_adicional_emp`
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
-- Triggers `act_adicional_emp`
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
-- Table structure for table `act_profesional_adic`
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
-- Triggers `act_profesional_adic`
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
-- Table structure for table `bitacora`
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=123 ;

-- --------------------------------------------------------

--
-- Table structure for table `campus`
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
-- Dumping data for table `campus`
--

INSERT INTO `campus` (`campus`, `descripcion`, `direccion`, `ciudad`, `users_id`) VALUES
(1, 'TIJUANA UNIDAD OTAY', 'CALZADA UNIVERSIDAD 14418 PARQUE INDUSTRIAL INTERNACIONAL TI', 16, 1),
(2, 'TIJUANA UNIDAD TECATE', 'CALZADA UNIVERSIDAD NO.1 FRACC. SAN FERNANDO. C.P. 21460', 16, 1),
(3, 'TIJUANA UNIDAD ROSARITO', 'BLVD. MARIANO VERDUGO NORTE ENTRE CALLE ISLA LOBO VERACRUZ Y', 16, 1),
(4, 'TIJUANA UNIDAD VALLE DE LAS PALMAS', 'BLVD. UNIVERSITARIO #1000', 16, 1);

-- --------------------------------------------------------

--
-- Table structure for table `caracter`
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
-- Dumping data for table `caracter`
--

INSERT INTO `caracter` (`caracter`, `descripcion`, `users_id`) VALUES
(1, 'OBLIGATORIA', 1),
(2, 'OPTATIVA', 1);

-- --------------------------------------------------------

--
-- Table structure for table `caracteristica_cur`
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
-- Dumping data for table `caracteristica_cur`
--

INSERT INTO `caracteristica_cur` (`caracteristica_cur`, `descripcion`, `users_id`) VALUES
(1, 'CURSO', 1),
(2, 'CONGRESO', 1),
(3, 'TALLER', 1);

-- --------------------------------------------------------

--
-- Table structure for table `carga`
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

-- --------------------------------------------------------

--
-- Table structure for table `carreras_emp`
--

CREATE TABLE IF NOT EXISTS `carreras_emp` (
  `carrera` int(11) NOT NULL COMMENT 'Carrera emp',
  `descripcion` varchar(60) NOT NULL COMMENT 'Descripcion carrera emp',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`carrera`),
  KEY `fk_carreras_emp_users1_idx` (`users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `categorias`
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
-- Dumping data for table `categorias`
--

INSERT INTO `categorias` (`categoria`, `descripcion`, `nivel`, `users_id`) VALUES
(101, 'PROFESOR ORDINARIO DE ASIGNATURA NIVEL A', NULL, 1),
(102, 'PROFESOR ORDINARIO DE ASIGNATURA NIVEL B', NULL, 1),
(103, 'PROFESOR ORDINARIO DE ASIGNATURA NIVEL C', NULL, 1),
(104, 'PROFESOR ORDINARIO DE CARRERA NIVEL A', NULL, 1),
(105, 'PROFESOR ORDINARIO DE CARRERA NIVEL B', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ciudad`
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
-- Dumping data for table `ciudad`
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

-- --------------------------------------------------------

--
-- Table structure for table `coordinaciona`
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
-- Dumping data for table `coordinaciona`
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

-- --------------------------------------------------------

--
-- Table structure for table `detalleseriacion`
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

-- --------------------------------------------------------

--
-- Table structure for table `dias`
--

CREATE TABLE IF NOT EXISTS `dias` (
  `dia` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Consec Dia',
  `descripcion` varchar(9) NOT NULL COMMENT 'Descripcion Dia (Lun,Mar,Mier..)',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`dia`),
  UNIQUE KEY `DI_dia_UNIQUE` (`dia`),
  KEY `fk_dias_users1_idx` (`users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `disp_hrs_dias`
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

-- --------------------------------------------------------

--
-- Table structure for table `disp_ua`
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

-- --------------------------------------------------------

--
-- Table structure for table `doctos`
--

CREATE TABLE IF NOT EXISTS `doctos` (
  `docto` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo documento',
  `descripcion` varchar(45) NOT NULL COMMENT 'Descripcion documento (cedula, foto, certificado, curso, etc)',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`docto`),
  KEY `fk_doctos_users1_idx` (`users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `documentos_emp`
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

-- --------------------------------------------------------

--
-- Table structure for table `empresa_adic`
--

CREATE TABLE IF NOT EXISTS `empresa_adic` (
  `empresa` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Empresa TrabAdic a UABC',
  `descripcion` varchar(45) NOT NULL COMMENT 'Desc TrabAdic a UABC',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`empresa`),
  KEY `fk_empresa_adic_users1_idx` (`users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `esp_prog_edu`
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
-- Dumping data for table `esp_prog_edu`
--

INSERT INTO `esp_prog_edu` (`especialidad`, `descripcion`, `status`, `users_id`) VALUES
(1, 'MTIC', '1', 1),
(2, 'MC', '1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `estado`
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
-- Dumping data for table `estado`
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

-- --------------------------------------------------------

--
-- Table structure for table `etapas`
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
-- Dumping data for table `etapas`
--

INSERT INTO `etapas` (`etapa`, `descripcion`, `users_id`) VALUES
(1, 'BASICA', 1),
(2, 'DISCIPLINARIA', 1),
(3, 'TERMINAL', 1);

-- --------------------------------------------------------

--
-- Table structure for table `grupos`
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

-- --------------------------------------------------------

--
-- Table structure for table `horarios`
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

-- --------------------------------------------------------

--
-- Table structure for table `horas`
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

-- --------------------------------------------------------

--
-- Table structure for table `levels`
--

CREATE TABLE IF NOT EXISTS `levels` (
  `level` int(11) NOT NULL COMMENT 'Nivel',
  `descrip_level` varchar(45) NOT NULL COMMENT 'Descripcion Nivel',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`level`),
  KEY `fk_levels_users1_idx` (`users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `levels`
--

INSERT INTO `levels` (`level`, `descrip_level`, `users_id`) VALUES
(1, 'Administrador general', 1),
(2, 'Administrador auxiliar', 1),
(3, 'Coordinador Carrera', 1),
(4, 'Coordinador de Area', 1),
(5, 'Docente', 1);

-- --------------------------------------------------------

--
-- Table structure for table `nvprograma`
--

CREATE TABLE IF NOT EXISTS `nvprograma` (
  `nivel` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Nivel (1,2,3)',
  `descripcion` varchar(15) NOT NULL COMMENT 'Licenciatura/Postgrado',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`nivel`),
  UNIQUE KEY `NV_codigo_UNIQUE` (`nivel`),
  KEY `fk_nvprograma_users1_idx` (`users_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='<double-click to overwrite multiple objects>' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `nvprograma`
--

INSERT INTO `nvprograma` (`nivel`, `descripcion`, `users_id`) VALUES
(1, 'LICENCIATURA', 1),
(2, 'POSGRADO', 1),
(3, 'TECNICO', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pais`
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
-- Dumping data for table `pais`
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

-- --------------------------------------------------------

--
-- Table structure for table `periodos`
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

-- --------------------------------------------------------

--
-- Table structure for table `periodo_prog_edu`
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
-- Dumping data for table `periodo_prog_edu`
--

INSERT INTO `periodo_prog_edu` (`periodo_pedu`, `descripcion`, `users_id`) VALUES
(1, 'SEMESTRAL', 1),
(2, 'CUATRIMESTRAL', 1),
(3, 'TRIMESTRAL', 1),
(4, 'SABATINO', 1);

-- --------------------------------------------------------

--
-- Table structure for table `planestudio`
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
-- Dumping data for table `planestudio`
--

INSERT INTO `planestudio` (`plan`, `descripcion`, `credpracticas`, `feciniciovig`, `fecfinvig`, `nivel`, `users_id`) VALUES
(20091, 'Plan 2009-1', 200, '2015-01-29', '2017-12-31', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `plan_programa`
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

-- --------------------------------------------------------

--
-- Table structure for table `programaedu`
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
-- Dumping data for table `programaedu`
--

INSERT INTO `programaedu` (`programaedu`, `descripcion`, `siglas`, `status`, `uacademica`, `especialidad`, `nivel`, `periodo_pedu`, `users_id`) VALUES
(2, 'ADMON. DE EMPRESAS', 'LAE', 1, 1, NULL, 1, 1, 1),
(3, 'INFORMÁTICA', 'LI', 1, 1, NULL, 1, 1, 1),
(4, 'NEGOCIOS INTERNACIONALES', 'LNI', 1, 1, NULL, 1, 1, 1),
(5, 'CONTADURIA', 'LC', 1, 1, NULL, 1, 1, 1),
(6, 'TRONCO COMÚN', 'TC', 1, 1, NULL, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `puesto`
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
-- Dumping data for table `puesto`
--

INSERT INTO `puesto` (`puesto`, `descripcion`, `users_id`) VALUES
(1, 'DIRECTOR', 1),
(2, 'SUBDIRECTOR', 1),
(3, 'ADMINISTRADOR', 1),
(4, 'DOCENTE', 1),
(5, 'GERENTE GENERAL', 1);

-- --------------------------------------------------------

--
-- Table structure for table `puestosemp`
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

-- --------------------------------------------------------

--
-- Table structure for table `p_ua`
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

-- --------------------------------------------------------

--
-- Table structure for table `reqseriacion`
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
-- Dumping data for table `reqseriacion`
--

INSERT INTO `reqseriacion` (`reqseriacion`, `descripcion`, `users_id`) VALUES
(1, 'OBLIGATORIA', 1),
(2, 'CONVENIENTE', 1);

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE IF NOT EXISTS `status` (
  `status` int(11) NOT NULL COMMENT 'status (1,2,3)',
  `descripcion` varchar(45) DEFAULT NULL COMMENT 'Status: 1=Completado 2=Capturado 3=En proceso',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`status`),
  KEY `fk_status_users1_idx` (`users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`status`, `descripcion`, `users_id`) VALUES
(1, 'CAPTURADO', 1),
(2, 'COMPLETADO', 1),
(3, 'EN PROCESO', 1);

-- --------------------------------------------------------

--
-- Table structure for table `status_horarios`
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

-- --------------------------------------------------------

--
-- Table structure for table `status_procesos`
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

-- --------------------------------------------------------

--
-- Table structure for table `tipo_curso_emp`
--

CREATE TABLE IF NOT EXISTS `tipo_curso_emp` (
  `tipo_curso_emp` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Tipo curso',
  `descripcion` varchar(45) NOT NULL COMMENT 'Descipción: Impartido, recibido, interés',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`tipo_curso_emp`),
  KEY `fk_tipo_curso_emp_users1_idx` (`users_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `tipo_curso_emp`
--

INSERT INTO `tipo_curso_emp` (`tipo_curso_emp`, `descripcion`, `users_id`) VALUES
(1, 'RECIBIDO', 1),
(2, 'IMPARTIDO', 1),
(3, 'DE INTERES', 1);

-- --------------------------------------------------------

--
-- Table structure for table `trabadicional_emp`
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

-- --------------------------------------------------------

--
-- Table structure for table `turnos`
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
-- Dumping data for table `turnos`
--

INSERT INTO `turnos` (`turno`, `descripcion`, `users_id`) VALUES
(1, 'MATUTINO', 1),
(2, 'VESPERTINO', 1),
(3, 'INTERTURNO', 1);

-- --------------------------------------------------------

--
-- Table structure for table `uacademica`
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
-- Dumping data for table `uacademica`
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

-- --------------------------------------------------------

--
-- Table structure for table `uaprendizaje`
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

-- --------------------------------------------------------

--
-- Table structure for table `universidades_emp`
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
-- Dumping data for table `universidades_emp`
--

INSERT INTO `universidades_emp` (`universidad`, `descripcion`, `descripshort`, `ciudad`, `users_id`) VALUES
(1, 'UNIVERSIDAD AUTONOMA DE BAJA CALIFORNIA', 'UABC', 16, 1),
(2, 'INSTITUTO TECNOLOGICO DE TIJUANA', 'ITT', 16, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
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
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `last_name`, `last_materno`, `email`, `address`, `phone`, `campus`, `uacademica`, `username`, `password`, `level`, `created_at`, `updated_at`, `remember_token`, `sexo`, `rfc`, `fec_nac`, `fec_ing`, `email_alternat`, `ciudad`, `calle`, `no_ext`, `no_int`, `colonia`, `cp`, `telofna`, `telcel`, `categoria`, `unidad`, `ua`, `programaedu`) VALUES
(1, 'Cynthia', 'Duarte', '', 'zyntya@hotmail.com', 'Real de Calacoaya 7810-3B', 6450706, 1, 1, 'Tikita', '$2y$10$9qAw9XKA/BtqYRg5WS087.3WjqG.eH0P8.JiLsY7BF4nBAZAPJ752', 1, '2014-04-19 19:30:58', '2015-01-29 12:29:38', 'RxUzFbxTOcn7SVSFg2FFcjP7TddMVotrzDoIOgKMLnmWaUGz5EAxpqeN0q4B', 'F', NULL, '1985-12-01', '2014-12-02', 'zyntya@uabc.edu.mx', 16, 'CALLE SERRADILLA', 500, 'A', 'MONTGOMERY', 22310, '664-9740000', '664-9740000', 101, 'ENSENADA', 'FCA', 0),
(2, 'Ivan', 'Duarte', '', 'wolfogan@gmail.com', 'Col. Nueva Tijuana', 6233987, 1, 1, 'LoganX', '$2y$10$k8fT0GW/Obx8KgZU4hVufOt/stcuq3Y9Z8/9StZEMuLWOCmjfK1hO', 2, '2014-04-19 19:30:58', '2015-01-29 09:45:44', 'fw7JjrYTk6RA8bE4OfqBxN4U4mFsTAniE4gGoOMrlFvbCfUWGhBRSirjq0ZT', 'M', NULL, '1990-12-02', '2014-12-31', 'luz.lugo@uabc.edu.mx', 16, 'DE LOS LAURELES', 600, '1', 'EL CIRCULO', 22450, '664-1236789', '664''1236789', 101, 'VALLE DE LA TRINIDAD', 'FD', 3),
(4, 'Subdirector', 'Subdirector', '', 'subdirector@hotmail.com', 'Real de Calacoaya 7810-3B', 6450706, 1, 1, 'Subdirector', '$2y$10$9qAw9XKA/BtqYRg5WS087.3WjqG.eH0P8.JiLsY7BF4nBAZAPJ752', 1, '2014-04-19 19:30:58', '2015-01-29 12:29:38', 'RxUzFbxTOcn7SVSFg2FFcjP7TddMVotrzDoIOgKMLnmWaUGz5EAxpqeN0q4B', 'F', NULL, '1985-12-01', '2014-12-02', 'zyntya@uabc.edu.mx', 16, 'CALLE SERRADILLA', 500, 'A', 'MONTGOMERY', 22310, '664-9740000', '664-9740000', 101, 'TIJUANA', 'FCA', 0);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_carga`
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
,`requisito` varchar(341)
,`tunros` varchar(341)
,`grupos` varchar(341)
);
-- --------------------------------------------------------

--
-- Structure for view `vw_carga`
--
DROP TABLE IF EXISTS `vw_carga`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_carga` AS select max(`cr`.`programaedu`) AS `carrera`,max(`pre`.`descripcion`) AS `desc_carr`,max(`cr`.`semestre`) AS `semestre`,max(`cr`.`periodo`) AS `periodo`,max(`pe`.`descripcion`) AS `desc_periodo`,max(`cr`.`uaprendizaje`) AS `uaprendizaje`,max(`uap`.`descripcionmat`) AS `descripcionmat`,max(`uap`.`creditos`) AS `creditos`,max(`uap`.`HC`) AS `HC`,max(`pua`.`etapa`) AS `ETAPA`,max(`et`.`descripcion`) AS `desc_etapa`,max(`cr`.`grupo`) AS `grupo`,(select group_concat(`ds`.`uaprequisito` separator ',') from `detalleseriacion` `ds` where ((`ds`.`uaprendizaje` = `cr`.`uaprendizaje`) and (`ds`.`programaedu` = `gr`.`programaedu`))) AS `requisito`,(select group_concat(`turnos`.`descripcion` separator ',') from (`grupos` left join `turnos` on((`grupos`.`turno` = `turnos`.`turno`))) where (`grupos`.`grupo` = `cr`.`grupo`)) AS `tunros`,(select group_concat(`carga`.`grupo` separator ',') from `carga` where ((`carga`.`uaprendizaje` = `cr`.`uaprendizaje`) and (`carga`.`periodo` = `cr`.`periodo`) and (`carga`.`semestre` = `cr`.`semestre`))) AS `grupos` from ((((((((`carga` `cr` left join `uaprendizaje` `uap` on((`cr`.`uaprendizaje` = `uap`.`uaprendizaje`))) join `p_ua` `pua` on(((`pua`.`programaedu` = `cr`.`programaedu`) and (`pua`.`uaprendizaje` = `cr`.`uaprendizaje`)))) left join `grupos` `gr` on(((`gr`.`grupo` = `cr`.`grupo`) and (`gr`.`periodo` = `cr`.`periodo`) and (`gr`.`programaedu` = `cr`.`programaedu`)))) left join `programaedu` `pre` on((`pre`.`programaedu` = `pua`.`programaedu`))) left join `periodos` `pe` on(((`pe`.`periodo` = `cr`.`periodo`) and (`pe`.`periodo` = `pe`.`periodo`)))) left join `turnos` `tu` on((`tu`.`turno` = `gr`.`turno`))) left join `detalleseriacion` `ds` on(((`ds`.`uaprendizaje` = `cr`.`uaprendizaje`) and (`ds`.`programaedu` = `gr`.`programaedu`)))) left join `etapas` `et` on((`et`.`etapa` = `pua`.`etapa`))) group by `cr`.`periodo`,`cr`.`programaedu`,`cr`.`semestre`,`pua`.`uaprendizaje`;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `campus`
--
ALTER TABLE `campus`
  ADD CONSTRAINT `fk_campus_ciudad1` FOREIGN KEY (`ciudad`) REFERENCES `ciudad` (`ciudad`),
  ADD CONSTRAINT `fk_campus_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `caracter`
--
ALTER TABLE `caracter`
  ADD CONSTRAINT `fk_caracter_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `caracteristica_cur`
--
ALTER TABLE `caracteristica_cur`
  ADD CONSTRAINT `fk_caracteristica_cur_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `carga`
--
ALTER TABLE `carga`
  ADD CONSTRAINT `fk_carga_grupos1` FOREIGN KEY (`grupo`, `periodo`) REFERENCES `grupos` (`grupo`, `periodo`),
  ADD CONSTRAINT `fk_carga_p_ua1` FOREIGN KEY (`programaedu`, `uaprendizaje`) REFERENCES `p_ua` (`programaedu`, `uaprendizaje`),
  ADD CONSTRAINT `fk_carga_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `carreras_emp`
--
ALTER TABLE `carreras_emp`
  ADD CONSTRAINT `fk_carreras_emp_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `categorias`
--
ALTER TABLE `categorias`
  ADD CONSTRAINT `fk_categorias_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `ciudad`
--
ALTER TABLE `ciudad`
  ADD CONSTRAINT `fk_ciudad_estado1` FOREIGN KEY (`estado`) REFERENCES `estado` (`estado`),
  ADD CONSTRAINT `fk_ciudad_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `coordinaciona`
--
ALTER TABLE `coordinaciona`
  ADD CONSTRAINT `fk_coordinaciona_programaedu1` FOREIGN KEY (`programaedu`) REFERENCES `programaedu` (`programaedu`),
  ADD CONSTRAINT `fk_coordinaciona_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `detalleseriacion`
--
ALTER TABLE `detalleseriacion`
  ADD CONSTRAINT `fk_detalleseriacion_pua` FOREIGN KEY (`programaedu`, `uaprendizaje`) REFERENCES `p_ua` (`programaedu`, `uaprendizaje`),
  ADD CONSTRAINT `fk_detalleseriacion_reqseriacion1` FOREIGN KEY (`reqseriacion`) REFERENCES `reqseriacion` (`reqseriacion`),
  ADD CONSTRAINT `fk_detalleseriacion_uaprendizaje2` FOREIGN KEY (`uaprequisito`) REFERENCES `uaprendizaje` (`uaprendizaje`),
  ADD CONSTRAINT `fk_detalleseriacion_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `dias`
--
ALTER TABLE `dias`
  ADD CONSTRAINT `fk_dias_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `disp_hrs_dias`
--
ALTER TABLE `disp_hrs_dias`
  ADD CONSTRAINT `fk_disp_hrs_dias_dias2` FOREIGN KEY (`dia`) REFERENCES `dias` (`dia`),
  ADD CONSTRAINT `fk_disp_hrs_dias_horas1` FOREIGN KEY (`hora`) REFERENCES `horas` (`hora`),
  ADD CONSTRAINT `fk_disp_hrs_dias_periodos1` FOREIGN KEY (`periodo`) REFERENCES `periodos` (`periodo`),
  ADD CONSTRAINT `fk_disp_hrs_dias_status1` FOREIGN KEY (`status`) REFERENCES `status` (`status`),
  ADD CONSTRAINT `fk_disp_hrs_dias_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `fk_disp_hrs_dias_users2` FOREIGN KEY (`id`) REFERENCES `users` (`id`);

--
-- Constraints for table `disp_ua`
--
ALTER TABLE `disp_ua`
  ADD CONSTRAINT `fk_disp_ua_periodos1` FOREIGN KEY (`periodo`) REFERENCES `periodos` (`periodo`),
  ADD CONSTRAINT `fk_disp_ua_uaprendizaje1` FOREIGN KEY (`uaprendizaje`) REFERENCES `uaprendizaje` (`uaprendizaje`),
  ADD CONSTRAINT `fk_disp_ua_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `fk_disp_ua_users2` FOREIGN KEY (`id`) REFERENCES `users` (`id`);

--
-- Constraints for table `doctos`
--
ALTER TABLE `doctos`
  ADD CONSTRAINT `fk_doctos_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `documentos_emp`
--
ALTER TABLE `documentos_emp`
  ADD CONSTRAINT `fk_documentos_emp_doctos1` FOREIGN KEY (`docto`) REFERENCES `doctos` (`docto`),
  ADD CONSTRAINT `fk_documentos_emp_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `fk_documentos_emp_users2` FOREIGN KEY (`id`) REFERENCES `users` (`id`);

--
-- Constraints for table `empresa_adic`
--
ALTER TABLE `empresa_adic`
  ADD CONSTRAINT `fk_empresa_adic_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `esp_prog_edu`
--
ALTER TABLE `esp_prog_edu`
  ADD CONSTRAINT `fk_esp_prog_edu_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `estado`
--
ALTER TABLE `estado`
  ADD CONSTRAINT `fk_estado_pais1` FOREIGN KEY (`pais`) REFERENCES `pais` (`pais`),
  ADD CONSTRAINT `fk_estado_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `etapas`
--
ALTER TABLE `etapas`
  ADD CONSTRAINT `fk_etapas_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `grupos`
--
ALTER TABLE `grupos`
  ADD CONSTRAINT `fk_grupos_periodos1` FOREIGN KEY (`periodo`) REFERENCES `periodos` (`periodo`),
  ADD CONSTRAINT `fk_grupos_planestudio1` FOREIGN KEY (`plan`, `programaedu`) REFERENCES `plan_programa` (`plan`, `programaedu`),
  ADD CONSTRAINT `fk_grupos_turnos1` FOREIGN KEY (`turno`) REFERENCES `turnos` (`turno`),
  ADD CONSTRAINT `fk_grupos_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `horarios`
--
ALTER TABLE `horarios`
  ADD CONSTRAINT `fk_horarios_dias1` FOREIGN KEY (`dia`) REFERENCES `dias` (`dia`),
  ADD CONSTRAINT `fk_horarios_grupos1` FOREIGN KEY (`grupo`, `periodo`) REFERENCES `grupos` (`grupo`, `periodo`),
  ADD CONSTRAINT `fk_horarios_horas1` FOREIGN KEY (`hora`) REFERENCES `horas` (`hora`),
  ADD CONSTRAINT `fk_horarios_uaprendizaje1` FOREIGN KEY (`uaprendizaje`) REFERENCES `uaprendizaje` (`uaprendizaje`),
  ADD CONSTRAINT `fk_horarios_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `fk_horarios_users2` FOREIGN KEY (`id`) REFERENCES `users` (`id`);

--
-- Constraints for table `horas`
--
ALTER TABLE `horas`
  ADD CONSTRAINT `fk_horas_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `levels`
--
ALTER TABLE `levels`
  ADD CONSTRAINT `fk_levels_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `nvprograma`
--
ALTER TABLE `nvprograma`
  ADD CONSTRAINT `fk_nvprograma_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `pais`
--
ALTER TABLE `pais`
  ADD CONSTRAINT `fk_pais_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `periodos`
--
ALTER TABLE `periodos`
  ADD CONSTRAINT `fk_periodos_periodo_prog_edu1` FOREIGN KEY (`periodo_pedu`) REFERENCES `periodo_prog_edu` (`periodo_pedu`),
  ADD CONSTRAINT `fk_periodos_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `periodo_prog_edu`
--
ALTER TABLE `periodo_prog_edu`
  ADD CONSTRAINT `fk_periodo_prog_edu_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `planestudio`
--
ALTER TABLE `planestudio`
  ADD CONSTRAINT `fk_planestudiodesc_nvprograma1` FOREIGN KEY (`nivel`) REFERENCES `nvprograma` (`nivel`),
  ADD CONSTRAINT `fk_planestudiodesc_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `plan_programa`
--
ALTER TABLE `plan_programa`
  ADD CONSTRAINT `fk_planestudio_planestudiodesc1` FOREIGN KEY (`plan`) REFERENCES `planestudio` (`plan`),
  ADD CONSTRAINT `fk_planestudio_programaedu1` FOREIGN KEY (`programaedu`) REFERENCES `programaedu` (`programaedu`),
  ADD CONSTRAINT `fk_planestudio_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `programaedu`
--
ALTER TABLE `programaedu`
  ADD CONSTRAINT `fk_programaedu_esp_prog_edu1` FOREIGN KEY (`especialidad`) REFERENCES `esp_prog_edu` (`especialidad`),
  ADD CONSTRAINT `fk_programaedu_nvprograma1` FOREIGN KEY (`nivel`) REFERENCES `nvprograma` (`nivel`),
  ADD CONSTRAINT `fk_programaedu_periodo_prog_edu1` FOREIGN KEY (`periodo_pedu`) REFERENCES `periodo_prog_edu` (`periodo_pedu`),
  ADD CONSTRAINT `fk_programaedu_uacademica1` FOREIGN KEY (`uacademica`) REFERENCES `uacademica` (`uacademica`),
  ADD CONSTRAINT `fk_programaedu_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `puesto`
--
ALTER TABLE `puesto`
  ADD CONSTRAINT `fk_puesto_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `puestosemp`
--
ALTER TABLE `puestosemp`
  ADD CONSTRAINT `fk_puestosemp_puesto1` FOREIGN KEY (`puesto`) REFERENCES `puesto` (`puesto`),
  ADD CONSTRAINT `fk_puestosemp_uacademica1` FOREIGN KEY (`uacademica`) REFERENCES `uacademica` (`uacademica`),
  ADD CONSTRAINT `fk_puestosemp_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `fk_puestosemp_users2` FOREIGN KEY (`id`) REFERENCES `users` (`id`);

--
-- Constraints for table `p_ua`
--
ALTER TABLE `p_ua`
  ADD CONSTRAINT `fk_p_ua_caracter1` FOREIGN KEY (`caracter`) REFERENCES `caracter` (`caracter`),
  ADD CONSTRAINT `fk_p_ua_etapas1` FOREIGN KEY (`etapa`) REFERENCES `etapas` (`etapa`),
  ADD CONSTRAINT `fk_p_ua_programaedu1` FOREIGN KEY (`programaedu`) REFERENCES `programaedu` (`programaedu`),
  ADD CONSTRAINT `fk_p_ua_uaprendizaje1` FOREIGN KEY (`uaprendizaje`) REFERENCES `uaprendizaje` (`uaprendizaje`),
  ADD CONSTRAINT `fk_p_ua_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `reqseriacion`
--
ALTER TABLE `reqseriacion`
  ADD CONSTRAINT `fk_reqseriacion_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `status`
--
ALTER TABLE `status`
  ADD CONSTRAINT `fk_status_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `status_horarios`
--
ALTER TABLE `status_horarios`
  ADD CONSTRAINT `fk_status_horarios_periodos1` FOREIGN KEY (`periodo`) REFERENCES `periodos` (`periodo`),
  ADD CONSTRAINT `fk_status_horarios_status1` FOREIGN KEY (`status`) REFERENCES `status` (`status`),
  ADD CONSTRAINT `fk_status_horarios_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `fk_status_horarios_users2` FOREIGN KEY (`id`) REFERENCES `users` (`id`);

--
-- Constraints for table `status_procesos`
--
ALTER TABLE `status_procesos`
  ADD CONSTRAINT `fk_status_procesos_periodos1` FOREIGN KEY (`periodo`) REFERENCES `periodos` (`periodo`),
  ADD CONSTRAINT `fk_status_procesos_programaedu1` FOREIGN KEY (`programaedu`) REFERENCES `programaedu` (`programaedu`),
  ADD CONSTRAINT `fk_status_procesos_status1` FOREIGN KEY (`status_carga`) REFERENCES `status` (`status`),
  ADD CONSTRAINT `fk_status_procesos_status2` FOREIGN KEY (`status_plan`) REFERENCES `status` (`status`),
  ADD CONSTRAINT `fk_status_procesos_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `tipo_curso_emp`
--
ALTER TABLE `tipo_curso_emp`
  ADD CONSTRAINT `fk_tipo_curso_emp_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `trabadicional_emp`
--
ALTER TABLE `trabadicional_emp`
  ADD CONSTRAINT `fk_trabadicional_emp_empresa_adic1` FOREIGN KEY (`empresa`) REFERENCES `empresa_adic` (`empresa`),
  ADD CONSTRAINT `fk_trabadicional_emp_puesto1` FOREIGN KEY (`puesto`) REFERENCES `puesto` (`puesto`),
  ADD CONSTRAINT `fk_trabadicional_emp_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `fk_trabadicional_emp_users2` FOREIGN KEY (`id`) REFERENCES `users` (`id`);

--
-- Constraints for table `turnos`
--
ALTER TABLE `turnos`
  ADD CONSTRAINT `fk_turnos_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `uacademica`
--
ALTER TABLE `uacademica`
  ADD CONSTRAINT `fk_uacademica_campus1` FOREIGN KEY (`campus`) REFERENCES `campus` (`campus`),
  ADD CONSTRAINT `fk_uacademica_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `uaprendizaje`
--
ALTER TABLE `uaprendizaje`
  ADD CONSTRAINT `fk_uaprendizaje_coordinaciona1` FOREIGN KEY (`coordinaciona`) REFERENCES `coordinaciona` (`coordinaciona`),
  ADD CONSTRAINT `fk_uaprendizaje_planprograma1` FOREIGN KEY (`plan`) REFERENCES `plan_programa` (`plan`),
  ADD CONSTRAINT `fk_uaprendizaje_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `universidades_emp`
--
ALTER TABLE `universidades_emp`
  ADD CONSTRAINT `fk_universidades_emp_ciudad1` FOREIGN KEY (`ciudad`) REFERENCES `ciudad` (`ciudad`),
  ADD CONSTRAINT `fk_universidades_emp_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `users`
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
