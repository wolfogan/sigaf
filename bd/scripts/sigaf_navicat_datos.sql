/*
Navicat MySQL Data Transfer

Source Server         : SIGAF
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : sigaf

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2015-01-16 00:28:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for act_adicional_emp
-- ----------------------------
DROP TABLE IF EXISTS `act_adicional_emp`;
CREATE TABLE `act_adicional_emp` (
  `id` int(11) NOT NULL COMMENT 'Codigo Docente',
  `tipo_curso_emp` int(11) NOT NULL COMMENT 'Cod tipo cur (Rec,Imp,Interes)',
  `curso` int(11) NOT NULL COMMENT 'Código curso',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  KEY `fk_act_adicional_emp_tipo_curso_emp1_idx` (`tipo_curso_emp`),
  KEY `fk_act_adicional_emp_act_profesional_adic1_idx` (`curso`),
  KEY `fk_act_adicional_emp_users1_idx` (`users_id`),
  KEY `fk_act_adicional_emp_users2_idx` (`id`),
  CONSTRAINT `fk_act_adicional_emp_act_profesional_adic1` FOREIGN KEY (`curso`) REFERENCES `act_profesional_adic` (`curso`),
  CONSTRAINT `fk_act_adicional_emp_tipo_curso_emp1` FOREIGN KEY (`tipo_curso_emp`) REFERENCES `tipo_curso_emp` (`tipo_curso_emp`),
  CONSTRAINT `fk_act_adicional_emp_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_act_adicional_emp_users2` FOREIGN KEY (`id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of act_adicional_emp
-- ----------------------------
INSERT INTO `act_adicional_emp` VALUES ('18', '1', '1', '1');
INSERT INTO `act_adicional_emp` VALUES ('18', '1', '2', '1');
INSERT INTO `act_adicional_emp` VALUES ('18', '1', '3', '1');
INSERT INTO `act_adicional_emp` VALUES ('18', '1', '4', '1');
INSERT INTO `act_adicional_emp` VALUES ('18', '1', '5', '1');
INSERT INTO `act_adicional_emp` VALUES ('18', '2', '6', '1');
INSERT INTO `act_adicional_emp` VALUES ('18', '1', '7', '1');
INSERT INTO `act_adicional_emp` VALUES ('18', '1', '8', '1');
INSERT INTO `act_adicional_emp` VALUES ('18', '1', '9', '1');
INSERT INTO `act_adicional_emp` VALUES ('18', '1', '10', '1');

-- ----------------------------
-- Table structure for act_profesional_adic
-- ----------------------------
DROP TABLE IF EXISTS `act_profesional_adic`;
CREATE TABLE `act_profesional_adic` (
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
  KEY `fk_act_profesional_adic_caracteristica_cur1` (`caracteristica_cur`),
  CONSTRAINT `fk_act_profesional_adic_caracteristica_cur1` FOREIGN KEY (`caracteristica_cur`) REFERENCES `caracteristica_cur` (`caracteristica_cur`),
  CONSTRAINT `fk_act_profesional_adic_periodos1` FOREIGN KEY (`periodo`) REFERENCES `periodos` (`periodo`),
  CONSTRAINT `fk_act_profesional_adic_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of act_profesional_adic
-- ----------------------------
INSERT INTO `act_profesional_adic` VALUES ('1', '20141', 'ELABORACION DE MATERIAL DIDACTICO DIGITAL UTILIZANDO LAS HERRAMIENTAS DE POWER POINT Y \"PREZI\"', '2014-07-21', '10', '25.00', '1', '1');
INSERT INTO `act_profesional_adic` VALUES ('2', '20141', 'GOOGLE SITES', '2014-06-11', '10', '2.30', '1', '1');
INSERT INTO `act_profesional_adic` VALUES ('3', '20141', 'JAVA SCRIPT', '2014-06-10', '10', '3.00', '1', '1');
INSERT INTO `act_profesional_adic` VALUES ('4', '20141', 'CONTPAQI: CONTABILIDAD ELECTRONICA Y EL TIMBRADO DE LA NOMINA', '2014-06-10', '10', '3.00', '1', '1');
INSERT INTO `act_profesional_adic` VALUES ('5', '20141', 'DESARROLLO DE APPS PARA IOS', '2014-06-09', '10', '1.30', '1', '1');
INSERT INTO `act_profesional_adic` VALUES ('6', '20132', 'UML Y DISENO DE SISTEMAS', '2014-03-24', '10', '0.00', '1', '1');
INSERT INTO `act_profesional_adic` VALUES ('7', '20131', 'HERRAMIENTAS DIDACTICAS PARA LA DOCENCIA', '2013-04-14', '0', '5.00', '1', '1');
INSERT INTO `act_profesional_adic` VALUES ('8', '20131', 'PRIMERA PARTE: PROYECT MANAGEMENT', '2013-04-22', '10', '5.00', '1', '1');
INSERT INTO `act_profesional_adic` VALUES ('9', '20131', 'TALLER DE HERRAMIENTAS DE EVOLUCION EN BLACKBOARD', '2013-06-04', '10', '25.00', '1', '1');
INSERT INTO `act_profesional_adic` VALUES ('10', '20131', 'DOCENCIA POYADA EN TECNOLOGIAS DE INF., COMUNICACION Y COLABORACION I (INTERMEDIO)', '2013-06-10', '10', '25.00', '1', '1');

-- ----------------------------
-- Table structure for act_profesional_emp
-- ----------------------------
DROP TABLE IF EXISTS `act_profesional_emp`;
CREATE TABLE `act_profesional_emp` (
  `carrera` int(11) NOT NULL COMMENT 'Carrera adicional',
  `id` int(11) NOT NULL COMMENT 'Usuario',
  `universidad` int(11) NOT NULL COMMENT 'Universidad carr adic',
  `nivel` int(11) NOT NULL COMMENT 'grado (Lic, post, tecn)',
  `cedula` int(11) DEFAULT NULL COMMENT 'No cedula',
  `fec_tit` date DEFAULT NULL COMMENT 'Fecha Tit',
  `obtuvo_grado` int(11) NOT NULL COMMENT '1=SI, 2=NO',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`carrera`,`id`),
  KEY `fk_act_profesional_emp_nvprograma1_idx` (`nivel`),
  KEY `fk_act_profesional_emp_users1_idx` (`users_id`),
  KEY `fk_act_profesional_emp_users2_idx` (`id`),
  KEY `fk_act_profesional_emp_carreras_emp1_idx` (`carrera`),
  KEY `fk_act_profesional_emp_universidades_emp1_idx` (`universidad`),
  CONSTRAINT `fk_act_profesional_emp_carreras_emp1` FOREIGN KEY (`carrera`) REFERENCES `carreras_emp` (`carrera`),
  CONSTRAINT `fk_act_profesional_emp_nvprograma1` FOREIGN KEY (`nivel`) REFERENCES `nvprograma` (`nivel`),
  CONSTRAINT `fk_act_profesional_emp_universidades_emp1` FOREIGN KEY (`universidad`) REFERENCES `universidades_emp` (`universidad`),
  CONSTRAINT `fk_act_profesional_emp_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_act_profesional_emp_users2` FOREIGN KEY (`id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of act_profesional_emp
-- ----------------------------
INSERT INTO `act_profesional_emp` VALUES ('1', '18', '1', '1', '8000054', '1997-04-30', '1', '18');
INSERT INTO `act_profesional_emp` VALUES ('5', '1', '2', '1', null, null, '1', '1');
INSERT INTO `act_profesional_emp` VALUES ('5', '9', '2', '1', null, null, '1', '1');
INSERT INTO `act_profesional_emp` VALUES ('5', '10', '2', '1', null, null, '1', '1');
INSERT INTO `act_profesional_emp` VALUES ('5', '11', '2', '1', null, null, '1', '1');
INSERT INTO `act_profesional_emp` VALUES ('5', '17', '2', '1', null, null, '2', '1');
INSERT INTO `act_profesional_emp` VALUES ('6', '9', '1', '2', null, null, '1', '1');
INSERT INTO `act_profesional_emp` VALUES ('6', '17', '1', '2', null, null, '1', '9');

-- ----------------------------
-- Table structure for bitacora
-- ----------------------------
DROP TABLE IF EXISTS `bitacora`;
CREATE TABLE `bitacora` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Consecutivo',
  `tabla` varchar(25) NOT NULL COMMENT 'Tabla',
  `usuario` varchar(20) NOT NULL COMMENT 'Usuario',
  `operacion` char(3) NOT NULL COMMENT 'Operacion realizada',
  `fecha` datetime NOT NULL COMMENT 'Fecha realizacion cambio',
  `registro` varchar(200) DEFAULT NULL COMMENT 'Registro Insertado',
  `registro_old` varchar(200) DEFAULT NULL COMMENT 'Registro Modificado/Borrado',
  PRIMARY KEY (`id`),
  UNIQUE KEY `BI_id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3103 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bitacora
-- ----------------------------
INSERT INTO `bitacora` VALUES ('989', 'periodos', '1', 'I', '2014-10-29 00:00:00', '20142|1|2014|7|2014-09-01|2014-12-15|1', null);
INSERT INTO `bitacora` VALUES ('990', 'periodos', '1', 'I', '2014-10-29 00:00:00', '20141|1|2014|1|2014-01-01|2014-07-31|1', null);
INSERT INTO `bitacora` VALUES ('991', 'periodos', '1', 'I', '2014-10-29 00:00:00', '20131|1|2013|1|2013-01-01|2013-07-31|1', null);
INSERT INTO `bitacora` VALUES ('992', 'periodos', '1', 'I', '2014-10-29 00:00:00', '20132|1|2013|9|2013-09-01|2013-12-15|1', null);
INSERT INTO `bitacora` VALUES ('993', 'periodos', '1', 'I', '2014-10-29 00:00:00', '20121|1|2012|1|2013-01-01|2013-07-31|1', null);
INSERT INTO `bitacora` VALUES ('994', 'periodos', '1', 'I', '2014-10-29 00:00:00', '20122|1|2012|9|2014-09-01|2014-12-15|1', null);
INSERT INTO `bitacora` VALUES ('995', 'planestudio', '1', 'I', '2014-10-29 00:00:00', '20092|PLAN DE ESTUDIOS 2009-2|20|2009-01-01|2015-12-31|1', null);
INSERT INTO `bitacora` VALUES ('996', 'plan_programa', '1', 'I', '2014-10-29 00:00:00', '20092|2', null);
INSERT INTO `bitacora` VALUES ('997', 'plan_programa', '1', 'I', '2014-10-29 00:00:00', '20092|5', null);
INSERT INTO `bitacora` VALUES ('998', 'plan_programa', '1', 'I', '2014-10-29 00:00:00', '20092|6', null);
INSERT INTO `bitacora` VALUES ('1019', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '0|esto es una pruena|1|1|1|1|1|1|1|2014-07-01|esto es una prueba|2|1|1|20092', null);
INSERT INTO `bitacora` VALUES ('1020', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '11236|COMUNICACION ORAL Y ESCRITA|1|0|2|0|0|0|4|0|1|21|20092', null);
INSERT INTO `bitacora` VALUES ('1021', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '11237|CONTABILIDAD|2|0|3|0|0|0|7|0|1|1|20092', null);
INSERT INTO `bitacora` VALUES ('1022', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '11238|DESARROLLO HUMANO|1|0|2|0|0|0|4|0|1|8|20092', null);
INSERT INTO `bitacora` VALUES ('1023', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '11239|ENTORNO GLOBAL DE LOS NEGOCIOS|2|0|2|0|0|0|6|0|1|10|20092', null);
INSERT INTO `bitacora` VALUES ('1024', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '11240|MATEMATICAS|2|0|2|0|0|0|6|0|1|22|20092', null);
INSERT INTO `bitacora` VALUES ('1025', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '11241|RESPONSABILIDAD SOCIAL|2|0|1|0|0|0|5|0|1|21|20092', null);
INSERT INTO `bitacora` VALUES ('1026', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '11242|TECNOLOGIAS DE LA INFORMACION|1|3|0|0|0|0|5|0|1|12|20092', null);
INSERT INTO `bitacora` VALUES ('1027', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '11243|CONTABILIDAD APLICADA|2|0|3|0|0|0|7|0|1|1|20092', null);
INSERT INTO `bitacora` VALUES ('1028', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '11244|DERECHO|3|0|0|0|0|0|6|0|1|19|20092', null);
INSERT INTO `bitacora` VALUES ('1029', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '11245|ECONOMIA|2|0|2|0|0|0|6|0|1|17|20092', null);
INSERT INTO `bitacora` VALUES ('1030', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '11246|LOGICA PARA LA TOMA DE DECISIONES|1|0|3|0|0|0|5|0|1|16|20092', null);
INSERT INTO `bitacora` VALUES ('1031', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '11247|PROBABILIDAD Y ESTADISTICA|2|0|2|0|0|0|6|0|1|22|20092', null);
INSERT INTO `bitacora` VALUES ('1032', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '11248|PROCESO ADMINISTRATIVO|2|0|2|0|0|0|6|0|1|10|20092', null);
INSERT INTO `bitacora` VALUES ('1033', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '11249|SISTEMAS DE INFORMACION|2|0|2|0|0|0|6|0|1|15|20092', null);
INSERT INTO `bitacora` VALUES ('1034', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '11733|MATEMATICAS FINANCIERAS|2|0|2|0|0|0|6|0|1|4|20092', null);
INSERT INTO `bitacora` VALUES ('1035', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '11734|ENTORNO SOCIOECONOMICO DE MEXICO|2|0|2|0|0|0|6|0|1|17|20092', null);
INSERT INTO `bitacora` VALUES ('1036', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '11737|DERECHO CORPORATIVO|3|0|1|0|0|0|7|0|1|19|20092', null);
INSERT INTO `bitacora` VALUES ('1037', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '11755|DESARROLLO DE EMPRENDEDORES|1|0|3|0|0|0|5|0|1|20|20092', null);
INSERT INTO `bitacora` VALUES ('1038', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '11761|ADMINISTRACION PUBLICA|3|0|0|0|0|0|6|0|2|11|20092', null);
INSERT INTO `bitacora` VALUES ('1039', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '11843|METODOLOGIA DE LA INVESTIGACION|2|0|1|0|0|0|5|0|1|21|20092', null);
INSERT INTO `bitacora` VALUES ('1040', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '11859|METODOS CUANTITATIVOS|2|0|2|0|0|0|6|0|1|9|20092', null);
INSERT INTO `bitacora` VALUES ('1041', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '11862|MERCADOTECNIA|2|0|2|0|0|0|6|0|1|7|20092', null);
INSERT INTO `bitacora` VALUES ('1042', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12292|ADMINISTRACION ESTRATEGICA|2|0|2|0|0|0|6|0|1|11|20092', null);
INSERT INTO `bitacora` VALUES ('1043', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12345|preuba de bitacora|1|1|1|1|1|1|1|2014-08-01|prueba bita|2|1|1|20092', null);
INSERT INTO `bitacora` VALUES ('1044', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12456|ADMINISTRACION DE COMPRAS|2|0|1|0|0|0|5|0|1|10|20092', null);
INSERT INTO `bitacora` VALUES ('1045', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12457|DISEÃ‘O ORGANIZACIONAL|2|0|2|0|0|0|6|0|1|10|20092', null);
INSERT INTO `bitacora` VALUES ('1046', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12458|REGISTROS ESPECIALES|2|0|2|0|0|0|6|0|1|1|20092', null);
INSERT INTO `bitacora` VALUES ('1047', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12459|RELACIONES LABORALES|2|0|2|0|0|0|6|0|1|19|20092', null);
INSERT INTO `bitacora` VALUES ('1048', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12460|CONTABILIDAD ADMINISTRATIVA|2|0|2|0|0|0|6|0|1|3|20092', null);
INSERT INTO `bitacora` VALUES ('1049', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12461|DERECHO CORPORATIVO|2|0|1|0|0|0|5|0|1|1|20092', null);
INSERT INTO `bitacora` VALUES ('1050', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12462|DERECHO FISCAL|2|0|2|0|0|0|6|0|1|6|20092', null);
INSERT INTO `bitacora` VALUES ('1051', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12463|INTEGRACION Y DESARROLLO DEL TALENTO HUMANO|2|0|3|0|0|0|7|0|1|8|20092', null);
INSERT INTO `bitacora` VALUES ('1052', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12464|METODOS CUANTITATIVOS AVANZADOS|2|0|2|0|0|0|6|0|1|9|20092', null);
INSERT INTO `bitacora` VALUES ('1053', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12465|ADMINISTRACION DE OPERACIONES|2|0|2|0|0|0|6|0|1|9|20092', null);
INSERT INTO `bitacora` VALUES ('1054', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12466|ADMINISTRACION DE VENTAS|2|0|1|0|0|0|5|0|1|7|20092', null);
INSERT INTO `bitacora` VALUES ('1055', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12467|ANALISIS FINANCIERO|2|0|3|0|0|0|7|0|1|4|20092', null);
INSERT INTO `bitacora` VALUES ('1056', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12468|MERCADOTECNIA AVANZADA|2|0|2|0|0|0|6|0|1|7|20092', null);
INSERT INTO `bitacora` VALUES ('1057', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12469|SEGURIDAD E HIGIENE|2|0|2|0|0|0|6|0|1|8|20092', null);
INSERT INTO `bitacora` VALUES ('1058', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12470|ADMINISTRACION DEL CAPITAL DE TRABAJO|2|0|2|0|0|0|6|0|1|22|20092', null);
INSERT INTO `bitacora` VALUES ('1059', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12471|ADMINISTRACION DE SUELDOS Y SALARIOS|2|0|2|0|0|0|6|0|1|8|20092', null);
INSERT INTO `bitacora` VALUES ('1060', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12472|CONTRIBUCIONES DE SEGURIDAD SOCIAL|2|0|2|0|0|0|6|0|1|6|20092', null);
INSERT INTO `bitacora` VALUES ('1061', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12473|DIRECCION ESTRATEGICA|2|0|2|0|0|0|6|0|1|8|20092', null);
INSERT INTO `bitacora` VALUES ('1062', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12474|INVESTIGACION DE MERCADO|2|0|2|0|0|0|6|0|1|7|20092', null);
INSERT INTO `bitacora` VALUES ('1063', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12475|SI ESTRATEGICA EN LOS NEGOCIOS|1|0|3|0|0|0|5|0|1|15|20092', null);
INSERT INTO `bitacora` VALUES ('1064', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12476|ADMINISTRACION DE LA CALIDAD|2|0|2|0|0|0|6|0|1|22|20092', null);
INSERT INTO `bitacora` VALUES ('1065', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12477|AUDITORIA ADMINISTRATIVA|2|0|2|0|0|0|6|0|1|11|20092', null);
INSERT INTO `bitacora` VALUES ('1066', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12478|CONTROL PRESUPUESTAL|2|0|2|0|0|0|6|0|1|4|20092', null);
INSERT INTO `bitacora` VALUES ('1067', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12479|FUENTES DE FINANCIAMIENTO|2|0|2|0|0|0|6|0|1|4|20092', null);
INSERT INTO `bitacora` VALUES ('1068', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12480|COMPETITIVIDAD EN LOS MERCADOS|1|0|3|0|0|0|5|0|1|9|20092', null);
INSERT INTO `bitacora` VALUES ('1069', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12481|FORMULACION Y EVALUACION DE PROYECTOS DE INVERSION|1|0|3|0|0|0|5|0|1|4|20092', null);
INSERT INTO `bitacora` VALUES ('1070', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12482|PRACTICA PROFESIONAL|0|0|0|0|0|0|10|0|2|22|20092', null);
INSERT INTO `bitacora` VALUES ('1071', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12483|ADMON. DEL MEDIO AMBIENTE|3|0|0|0|0|0|6|0|2|22|20092', null);
INSERT INTO `bitacora` VALUES ('1072', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12484|ETICA|3|0|0|0|0|0|6|0|2|21|20092', null);
INSERT INTO `bitacora` VALUES ('1073', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12485|IDIOMA|3|0|0|0|0|0|6|0|2|22|20092', null);
INSERT INTO `bitacora` VALUES ('1074', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12486|SOCIOLOGIA DE LA EMPRESA|3|0|0|0|0|0|6|0|2|10|20092', null);
INSERT INTO `bitacora` VALUES ('1075', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12487|COMERCIO EXTERIOR|4|0|0|0|0|0|6|0|2|18|20092', null);
INSERT INTO `bitacora` VALUES ('1076', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12488|DESARROLLO DE HABILIDADES DOCENTES|4|0|0|0|0|0|6|0|2|21|20092', null);
INSERT INTO `bitacora` VALUES ('1077', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12489|DESARROLLO ORGANIZACIONAL|3|0|0|0|0|0|6|0|2|10|20092', null);
INSERT INTO `bitacora` VALUES ('1078', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12490|IMPUESTOS|4|0|0|0|0|0|7|0|2|6|20092', null);
INSERT INTO `bitacora` VALUES ('1079', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12491|MERCADOTECNIAS ESPECIALES|4|0|0|0|0|0|7|0|2|7|20092', null);
INSERT INTO `bitacora` VALUES ('1080', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12492|TECNICAS DE NEGOCIACION|2|0|1|0|0|0|5|0|2|11|20092', null);
INSERT INTO `bitacora` VALUES ('1081', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12493|ADMON. DE AGRONEGOCIOS|3|0|0|0|0|0|6|0|2|11|20092', null);
INSERT INTO `bitacora` VALUES ('1082', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12494|ADMON. Y COMERCIO ELECTRONICO|4|0|0|0|0|0|6|0|2|12|20092', null);
INSERT INTO `bitacora` VALUES ('1083', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12495|COMUNICACION ORGANIZACIONAL|4|0|0|0|0|0|6|0|2|11|20092', null);
INSERT INTO `bitacora` VALUES ('1084', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12496|CONSULTORIA|4|0|0|0|0|0|6|0|2|11|20092', null);
INSERT INTO `bitacora` VALUES ('1085', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12497|CREACION DE NEGOCIOS POR INTERNET|4|0|0|0|0|0|6|0|2|12|20092', null);
INSERT INTO `bitacora` VALUES ('1086', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12498|DESARROLLO DE HABILIDADES DIRECTIVAS|3|0|0|0|0|0|6|0|2|8|20092', null);
INSERT INTO `bitacora` VALUES ('1087', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12499|ETICA DE LOS NEGOCIOS|4|0|0|0|0|0|7|0|2|22|20092', null);
INSERT INTO `bitacora` VALUES ('1088', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12500|FINANZAS INTERNACIONALES|4|0|0|0|0|0|6|0|2|4|20092', null);
INSERT INTO `bitacora` VALUES ('1089', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12501|SISTEMAS ADMINISTRATIVOS ESPECIALES|3|0|0|0|0|0|6|0|2|22|20092', null);
INSERT INTO `bitacora` VALUES ('1090', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12559|DERECHO TRIBUTARIO|2|0|3|0|0|0|7|0|1|6|20092', null);
INSERT INTO `bitacora` VALUES ('1091', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12560|IMPUESTOS INDIRECTOS|2|0|2|0|0|0|6|0|1|6|20092', null);
INSERT INTO `bitacora` VALUES ('1092', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12561|NORMAS DE INFORMACION FINANCIERA|2|0|3|0|0|0|7|0|1|22|20092', null);
INSERT INTO `bitacora` VALUES ('1093', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12562|PROFESION CONTABLE|1|0|2|0|0|0|4|0|1|22|20092', null);
INSERT INTO `bitacora` VALUES ('1094', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12563|CONTABILIDAD DE SOCIEDADES|2|0|2|0|0|0|6|0|1|2|20092', null);
INSERT INTO `bitacora` VALUES ('1095', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12564|CONTROL|1|0|4|0|0|0|6|0|1|5|20092', null);
INSERT INTO `bitacora` VALUES ('1096', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12565|FUNDAMENTOS DE CONTABILIDAD DE COSTOS|2|0|3|0|0|0|7|0|1|3|20092', null);
INSERT INTO `bitacora` VALUES ('1097', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12566|NORMAS PARTICULARES|3|0|3|0|0|0|7|0|1|22|20092', null);
INSERT INTO `bitacora` VALUES ('1098', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12567|AUDITORIA|2|0|3|0|0|0|7|0|1|5|20092', null);
INSERT INTO `bitacora` VALUES ('1099', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12568|COSTOS PREDETERMINADOS|2|0|3|0|0|0|7|0|1|3|20092', null);
INSERT INTO `bitacora` VALUES ('1100', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12569|ESTADOS FINANCIEROS|1|2|0|0|0|0|4|0|1|2|20092', null);
INSERT INTO `bitacora` VALUES ('1101', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12570|ISR PERSONAS FISICAS|2|0|3|0|0|0|7|0|1|6|20092', null);
INSERT INTO `bitacora` VALUES ('1102', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12571|PLANEACION FINANCIERA|1|0|2|0|0|0|4|0|1|4|20092', null);
INSERT INTO `bitacora` VALUES ('1103', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12572|COSTOS PARA LA TOMA DE DECISIONES|2|0|2|0|0|0|6|0|1|3|20092', null);
INSERT INTO `bitacora` VALUES ('1104', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12573|ISR PERSONAS MORALES Y OTRAS CONTRIBUCIONES|2|0|3|0|0|0|7|0|1|6|20092', null);
INSERT INTO `bitacora` VALUES ('1105', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12574|PAQUETERIA NEGOCIOS|1|2|0|0|0|0|4|0|1|2|20092', null);
INSERT INTO `bitacora` VALUES ('1106', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12575|PRACTICA DE AUDITORIAS|1|0|3|0|0|0|5|0|1|5|20092', null);
INSERT INTO `bitacora` VALUES ('1107', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12576|PRACTICA FISCAL|1|2|0|0|0|0|4|0|1|6|20092', null);
INSERT INTO `bitacora` VALUES ('1108', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12578|INTEGRACION FISCAL|1|0|2|0|0|0|4|0|1|6|20092', null);
INSERT INTO `bitacora` VALUES ('1109', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12579|PLANEACION ESTRATEGICA|1|0|3|0|0|0|5|0|1|11|20092', null);
INSERT INTO `bitacora` VALUES ('1110', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12581|ANALISIS DE LA LEGISLACION ADUANERA|4|0|0|0|0|0|8|0|2|22|20092', null);
INSERT INTO `bitacora` VALUES ('1111', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12582|COSTOS Y PRODUCTIVIDAD|2|0|2|0|0|0|6|0|2|3|20092', null);
INSERT INTO `bitacora` VALUES ('1112', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12583|INVESTIGACION DE OPERACIONES|2|0|2|0|0|0|6|0|2|9|20092', null);
INSERT INTO `bitacora` VALUES ('1113', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12584|MERCADOTECNIA|2|0|2|0|0|0|6|0|2|7|20092', null);
INSERT INTO `bitacora` VALUES ('1114', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12585|PRODUCCION|1|0|2|0|0|0|4|0|2|9|20092', null);
INSERT INTO `bitacora` VALUES ('1115', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12586|AUDITORIAS ESPECIALES|2|0|2|0|0|0|6|0|2|5|20092', null);
INSERT INTO `bitacora` VALUES ('1116', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12587|CASOS PRACTICOS DE COSTOS|2|0|2|0|0|0|6|0|2|3|20092', null);
INSERT INTO `bitacora` VALUES ('1117', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12588|CONTABILIDAD INTERNACIONAL|2|0|1|0|0|0|5|0|2|2|20092', null);
INSERT INTO `bitacora` VALUES ('1118', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12589|CONTABILIDAD CONSOLIDADA|3|0|1|0|0|0|7|0|2|2|20092', null);
INSERT INTO `bitacora` VALUES ('1119', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12590|CONTABILIDADES ESPECIALES|2|0|2|0|0|0|6|0|2|2|20092', null);
INSERT INTO `bitacora` VALUES ('1120', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12591|DICTAMENES|4|0|0|0|0|0|8|0|2|5|20092', null);
INSERT INTO `bitacora` VALUES ('1121', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12592|FINANZAS INTERNACIONALES|3|0|1|0|0|0|7|0|2|4|20092', null);
INSERT INTO `bitacora` VALUES ('1122', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12593|INVESTIGACION CONTABLE|2|0|2|0|0|0|6|0|2|2|20092', null);
INSERT INTO `bitacora` VALUES ('1123', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '12594|MERCADO DE VALORES|2|0|1|0|0|0|5|0|2|4|20092', null);
INSERT INTO `bitacora` VALUES ('1124', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '20000|prueba|1|1|1|1|1|1|1|2014-07-01|Esta ua es una prueba|12|1|1|20092', null);
INSERT INTO `bitacora` VALUES ('1125', 'uaprendizaje', '1', 'I', '2014-10-29 00:00:00', '20001|prueba|1|1|1|1|1|1|1|2014-07-01|esto es una prueba|12|1|1|20092', null);
INSERT INTO `bitacora` VALUES ('1126', 'uaprendizaje', '9', 'I', '2014-10-29 00:00:00', '20002|esto es una prueba|1|1|1|1|1|1|1|esto es una prueba|9|1|1|20092', null);
INSERT INTO `bitacora` VALUES ('1127', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '6|11236|1', null);
INSERT INTO `bitacora` VALUES ('1128', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '6|11237|1', null);
INSERT INTO `bitacora` VALUES ('1129', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '6|11238|1', null);
INSERT INTO `bitacora` VALUES ('1130', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '6|11239|1', null);
INSERT INTO `bitacora` VALUES ('1131', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '6|11240|1', null);
INSERT INTO `bitacora` VALUES ('1132', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '6|11241|1', null);
INSERT INTO `bitacora` VALUES ('1133', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '6|11242|1', null);
INSERT INTO `bitacora` VALUES ('1134', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '6|11243|1', null);
INSERT INTO `bitacora` VALUES ('1135', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '6|11244|1', null);
INSERT INTO `bitacora` VALUES ('1136', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '6|11245|1', null);
INSERT INTO `bitacora` VALUES ('1137', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '6|11246|1', null);
INSERT INTO `bitacora` VALUES ('1138', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '6|11247|1', null);
INSERT INTO `bitacora` VALUES ('1139', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '6|11248|1', null);
INSERT INTO `bitacora` VALUES ('1140', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '6|11249|1', null);
INSERT INTO `bitacora` VALUES ('1141', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|11733|1', null);
INSERT INTO `bitacora` VALUES ('1142', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|11733|1', null);
INSERT INTO `bitacora` VALUES ('1143', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|11734|1', null);
INSERT INTO `bitacora` VALUES ('1144', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|11734|1', null);
INSERT INTO `bitacora` VALUES ('1145', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|11843|1', null);
INSERT INTO `bitacora` VALUES ('1146', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|11843|1', null);
INSERT INTO `bitacora` VALUES ('1147', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|11859|1', null);
INSERT INTO `bitacora` VALUES ('1148', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12456|1', null);
INSERT INTO `bitacora` VALUES ('1149', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12457|1', null);
INSERT INTO `bitacora` VALUES ('1150', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|12457|1', null);
INSERT INTO `bitacora` VALUES ('1151', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12458|1', null);
INSERT INTO `bitacora` VALUES ('1152', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|12458|1', null);
INSERT INTO `bitacora` VALUES ('1153', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12459|1', null);
INSERT INTO `bitacora` VALUES ('1154', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|12459|1', null);
INSERT INTO `bitacora` VALUES ('1155', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12483|1', null);
INSERT INTO `bitacora` VALUES ('1156', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12484|1', null);
INSERT INTO `bitacora` VALUES ('1157', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12485|1', null);
INSERT INTO `bitacora` VALUES ('1158', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12486|1', null);
INSERT INTO `bitacora` VALUES ('1159', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|12559|1', null);
INSERT INTO `bitacora` VALUES ('1160', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|11737|2', null);
INSERT INTO `bitacora` VALUES ('1161', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|11761|2', null);
INSERT INTO `bitacora` VALUES ('1162', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|11862|2', null);
INSERT INTO `bitacora` VALUES ('1163', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12460|2', null);
INSERT INTO `bitacora` VALUES ('1164', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12461|2', null);
INSERT INTO `bitacora` VALUES ('1165', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12462|2', null);
INSERT INTO `bitacora` VALUES ('1166', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12463|2', null);
INSERT INTO `bitacora` VALUES ('1167', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12464|2', null);
INSERT INTO `bitacora` VALUES ('1168', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12465|2', null);
INSERT INTO `bitacora` VALUES ('1169', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12466|2', null);
INSERT INTO `bitacora` VALUES ('1170', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12467|2', null);
INSERT INTO `bitacora` VALUES ('1171', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|12467|2', null);
INSERT INTO `bitacora` VALUES ('1172', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12468|2', null);
INSERT INTO `bitacora` VALUES ('1173', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12469|2', null);
INSERT INTO `bitacora` VALUES ('1174', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12470|2', null);
INSERT INTO `bitacora` VALUES ('1175', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|12470|2', null);
INSERT INTO `bitacora` VALUES ('1176', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12471|2', null);
INSERT INTO `bitacora` VALUES ('1177', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12472|2', null);
INSERT INTO `bitacora` VALUES ('1178', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|12472|2', null);
INSERT INTO `bitacora` VALUES ('1179', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12473|2', null);
INSERT INTO `bitacora` VALUES ('1180', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12474|2', null);
INSERT INTO `bitacora` VALUES ('1181', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12475|2', null);
INSERT INTO `bitacora` VALUES ('1182', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12479|2', null);
INSERT INTO `bitacora` VALUES ('1183', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|12479|2', null);
INSERT INTO `bitacora` VALUES ('1184', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12487|2', null);
INSERT INTO `bitacora` VALUES ('1185', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12488|2', null);
INSERT INTO `bitacora` VALUES ('1186', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12489|2', null);
INSERT INTO `bitacora` VALUES ('1187', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12490|2', null);
INSERT INTO `bitacora` VALUES ('1188', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12491|2', null);
INSERT INTO `bitacora` VALUES ('1189', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12492|2', null);
INSERT INTO `bitacora` VALUES ('1190', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|12492|2', null);
INSERT INTO `bitacora` VALUES ('1191', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|12560|2', null);
INSERT INTO `bitacora` VALUES ('1192', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|12561|2', null);
INSERT INTO `bitacora` VALUES ('1193', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|12562|2', null);
INSERT INTO `bitacora` VALUES ('1194', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|12563|2', null);
INSERT INTO `bitacora` VALUES ('1195', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|12564|2', null);
INSERT INTO `bitacora` VALUES ('1196', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|12565|2', null);
INSERT INTO `bitacora` VALUES ('1197', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|12566|2', null);
INSERT INTO `bitacora` VALUES ('1198', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|12567|2', null);
INSERT INTO `bitacora` VALUES ('1199', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|12568|2', null);
INSERT INTO `bitacora` VALUES ('1200', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|12569|2', null);
INSERT INTO `bitacora` VALUES ('1201', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|12570|2', null);
INSERT INTO `bitacora` VALUES ('1202', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|12571|2', null);
INSERT INTO `bitacora` VALUES ('1203', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|12581|2', null);
INSERT INTO `bitacora` VALUES ('1204', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|12582|2', null);
INSERT INTO `bitacora` VALUES ('1205', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|12583|2', null);
INSERT INTO `bitacora` VALUES ('1206', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|12584|2', null);
INSERT INTO `bitacora` VALUES ('1207', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|12585|2', null);
INSERT INTO `bitacora` VALUES ('1208', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|11755|3', null);
INSERT INTO `bitacora` VALUES ('1209', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|11755|3', null);
INSERT INTO `bitacora` VALUES ('1210', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12292|3', null);
INSERT INTO `bitacora` VALUES ('1211', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12476|3', null);
INSERT INTO `bitacora` VALUES ('1212', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12477|3', null);
INSERT INTO `bitacora` VALUES ('1213', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12478|3', null);
INSERT INTO `bitacora` VALUES ('1214', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12480|3', null);
INSERT INTO `bitacora` VALUES ('1215', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12481|3', null);
INSERT INTO `bitacora` VALUES ('1216', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|12481|3', null);
INSERT INTO `bitacora` VALUES ('1217', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12482|3', null);
INSERT INTO `bitacora` VALUES ('1218', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12493|3', null);
INSERT INTO `bitacora` VALUES ('1219', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12494|3', null);
INSERT INTO `bitacora` VALUES ('1220', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12495|3', null);
INSERT INTO `bitacora` VALUES ('1221', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12496|3', null);
INSERT INTO `bitacora` VALUES ('1222', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12497|3', null);
INSERT INTO `bitacora` VALUES ('1223', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12498|3', null);
INSERT INTO `bitacora` VALUES ('1224', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12499|3', null);
INSERT INTO `bitacora` VALUES ('1225', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12500|3', null);
INSERT INTO `bitacora` VALUES ('1226', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '2|12501|3', null);
INSERT INTO `bitacora` VALUES ('1227', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|12572|3', null);
INSERT INTO `bitacora` VALUES ('1228', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|12573|3', null);
INSERT INTO `bitacora` VALUES ('1229', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|12574|3', null);
INSERT INTO `bitacora` VALUES ('1230', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|12575|3', null);
INSERT INTO `bitacora` VALUES ('1231', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|12576|3', null);
INSERT INTO `bitacora` VALUES ('1232', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|12578|3', null);
INSERT INTO `bitacora` VALUES ('1233', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|12579|3', null);
INSERT INTO `bitacora` VALUES ('1234', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|12586|3', null);
INSERT INTO `bitacora` VALUES ('1235', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|12587|3', null);
INSERT INTO `bitacora` VALUES ('1236', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|12588|3', null);
INSERT INTO `bitacora` VALUES ('1237', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|12589|3', null);
INSERT INTO `bitacora` VALUES ('1238', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|12590|3', null);
INSERT INTO `bitacora` VALUES ('1239', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|12591|3', null);
INSERT INTO `bitacora` VALUES ('1240', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|12592|3', null);
INSERT INTO `bitacora` VALUES ('1241', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|12593|3', null);
INSERT INTO `bitacora` VALUES ('1242', 'p_ua', '1', 'I', '2014-10-29 00:00:00', '5|12594|3', null);
INSERT INTO `bitacora` VALUES ('1243', 'grupos', '1', 'I', '2014-10-29 00:00:00', '231|20132|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('1244', 'grupos', '1', 'I', '2014-10-29 00:00:00', '232|20132|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('1245', 'grupos', '1', 'I', '2014-10-29 00:00:00', '235|20132|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('1246', 'grupos', '1', 'I', '2014-10-29 00:00:00', '241|20132|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('1247', 'grupos', '1', 'I', '2014-10-29 00:00:00', '242|20132|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('1248', 'grupos', '1', 'I', '2014-10-29 00:00:00', '245|20132|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('1249', 'grupos', '1', 'I', '2014-10-29 00:00:00', '251|20132|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('1250', 'grupos', '1', 'I', '2014-10-29 00:00:00', '252|20132|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('1251', 'grupos', '1', 'I', '2014-10-29 00:00:00', '255|20132|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('1252', 'grupos', '1', 'I', '2014-10-29 00:00:00', '261|20132|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('1253', 'grupos', '1', 'I', '2014-10-29 00:00:00', '262|20132|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('1254', 'grupos', '1', 'I', '2014-10-29 00:00:00', '265|20132|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('1255', 'grupos', '1', 'I', '2014-10-29 00:00:00', '271|20132|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('1256', 'grupos', '1', 'I', '2014-10-29 00:00:00', '272|20132|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('1257', 'grupos', '1', 'I', '2014-10-29 00:00:00', '275|20132|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('1258', 'grupos', '1', 'I', '2014-10-29 00:00:00', '281|20132|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('1259', 'grupos', '1', 'I', '2014-10-29 00:00:00', '282|20132|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('1260', 'grupos', '1', 'D', '2014-11-03 00:00:00', null, '282|20132|20092|2|1');
INSERT INTO `bitacora` VALUES ('1261', 'grupos', '1', 'D', '2014-11-03 00:00:00', null, '281|20132|20092|2|1');
INSERT INTO `bitacora` VALUES ('1262', 'grupos', '1', 'D', '2014-11-03 00:00:00', null, '275|20132|20092|2|1');
INSERT INTO `bitacora` VALUES ('1263', 'grupos', '1', 'D', '2014-11-03 00:00:00', null, '272|20132|20092|2|1');
INSERT INTO `bitacora` VALUES ('1264', 'grupos', '1', 'D', '2014-11-03 00:00:00', null, '271|20132|20092|2|1');
INSERT INTO `bitacora` VALUES ('1265', 'grupos', '1', 'D', '2014-11-03 00:00:00', null, '265|20132|20092|2|1');
INSERT INTO `bitacora` VALUES ('1266', 'grupos', '1', 'D', '2014-11-03 00:00:00', null, '262|20132|20092|2|1');
INSERT INTO `bitacora` VALUES ('1267', 'grupos', '1', 'D', '2014-11-03 00:00:00', null, '261|20132|20092|2|1');
INSERT INTO `bitacora` VALUES ('1268', 'grupos', '1', 'D', '2014-11-03 00:00:00', null, '255|20132|20092|2|1');
INSERT INTO `bitacora` VALUES ('1269', 'grupos', '1', 'D', '2014-11-03 00:00:00', null, '252|20132|20092|2|1');
INSERT INTO `bitacora` VALUES ('1270', 'grupos', '1', 'D', '2014-11-03 00:00:00', null, '251|20132|20092|2|1');
INSERT INTO `bitacora` VALUES ('1271', 'grupos', '1', 'D', '2014-11-03 00:00:00', null, '245|20132|20092|2|1');
INSERT INTO `bitacora` VALUES ('1272', 'grupos', '1', 'D', '2014-11-03 00:00:00', null, '242|20132|20092|2|1');
INSERT INTO `bitacora` VALUES ('1273', 'grupos', '1', 'D', '2014-11-03 00:00:00', null, '241|20132|20092|2|1');
INSERT INTO `bitacora` VALUES ('1274', 'grupos', '1', 'D', '2014-11-03 00:00:00', null, '235|20132|20092|2|1');
INSERT INTO `bitacora` VALUES ('1275', 'grupos', '1', 'D', '2014-11-03 00:00:00', null, '232|20132|20092|2|1');
INSERT INTO `bitacora` VALUES ('1276', 'grupos', '1', 'D', '2014-11-03 00:00:00', null, '231|20132|20092|2|1');
INSERT INTO `bitacora` VALUES ('1277', 'grupos', '1', 'I', '2014-11-04 00:00:00', '231|20132|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('1278', 'grupos', '1', 'I', '2014-11-04 00:00:00', '232|20132|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('1279', 'grupos', '1', 'I', '2014-11-04 00:00:00', '235|20132|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('1308', 'plan_programa', '1', 'I', '2014-11-04 00:00:00', '20092|3', null);
INSERT INTO `bitacora` VALUES ('1309', 'plan_programa', '1', 'I', '2014-11-04 00:00:00', '20092|4', null);
INSERT INTO `bitacora` VALUES ('1335', 'grupos', '1', 'I', '2014-11-04 00:00:00', '241|20132|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('1336', 'grupos', '1', 'I', '2014-11-04 00:00:00', '242|20132|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('1337', 'grupos', '1', 'I', '2014-11-04 00:00:00', '245|20132|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('1338', 'grupos', '1', 'I', '2014-11-04 00:00:00', '251|20132|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('1339', 'grupos', '1', 'I', '2014-11-04 00:00:00', '252|20132|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('1340', 'grupos', '1', 'I', '2014-11-04 00:00:00', '255|20132|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('1341', 'grupos', '1', 'I', '2014-11-04 00:00:00', '261|20132|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('1342', 'grupos', '1', 'I', '2014-11-04 00:00:00', '262|20132|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('1343', 'grupos', '1', 'I', '2014-11-04 00:00:00', '265|20132|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('1344', 'grupos', '1', 'I', '2014-11-04 00:00:00', '271|20132|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('1345', 'grupos', '1', 'I', '2014-11-04 00:00:00', '272|20132|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('1346', 'grupos', '1', 'I', '2014-11-04 00:00:00', '275|20132|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('1347', 'grupos', '1', 'I', '2014-11-04 00:00:00', '281|20132|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('1348', 'grupos', '1', 'I', '2014-11-04 00:00:00', '282|20132|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('1349', 'grupos', '1', 'I', '2014-11-04 00:00:00', '331|20132|20092|3|1', null);
INSERT INTO `bitacora` VALUES ('1350', 'grupos', '1', 'I', '2014-11-04 00:00:00', '341|20132|20092|3|1', null);
INSERT INTO `bitacora` VALUES ('1351', 'grupos', '1', 'I', '2014-11-04 00:00:00', '351|20132|20092|3|1', null);
INSERT INTO `bitacora` VALUES ('1352', 'grupos', '1', 'I', '2014-11-04 00:00:00', '361|20132|20092|3|1', null);
INSERT INTO `bitacora` VALUES ('1353', 'grupos', '1', 'I', '2014-11-04 00:00:00', '371|20132|20092|3|1', null);
INSERT INTO `bitacora` VALUES ('1354', 'grupos', '1', 'I', '2014-11-04 00:00:00', '431|20132|20092|4|1', null);
INSERT INTO `bitacora` VALUES ('1355', 'grupos', '1', 'I', '2014-11-04 00:00:00', '441|20132|20092|4|1', null);
INSERT INTO `bitacora` VALUES ('1356', 'grupos', '1', 'I', '2014-11-04 00:00:00', '451|20132|20092|4|1', null);
INSERT INTO `bitacora` VALUES ('1357', 'grupos', '1', 'I', '2014-11-04 00:00:00', '461|20132|20092|4|1', null);
INSERT INTO `bitacora` VALUES ('1358', 'grupos', '1', 'I', '2014-11-04 00:00:00', '471|20132|20092|4|1', null);
INSERT INTO `bitacora` VALUES ('1359', 'grupos', '1', 'I', '2014-11-04 00:00:00', '531|20132|20092|5|1', null);
INSERT INTO `bitacora` VALUES ('1360', 'grupos', '1', 'I', '2014-11-04 00:00:00', '532|20132|20092|5|1', null);
INSERT INTO `bitacora` VALUES ('1361', 'grupos', '1', 'I', '2014-11-04 00:00:00', '541|20132|20092|5|1', null);
INSERT INTO `bitacora` VALUES ('1362', 'grupos', '1', 'I', '2014-11-04 00:00:00', '542|20132|20092|5|1', null);
INSERT INTO `bitacora` VALUES ('1363', 'grupos', '1', 'I', '2014-11-04 00:00:00', '551|20132|20092|5|1', null);
INSERT INTO `bitacora` VALUES ('1364', 'grupos', '1', 'I', '2014-11-04 00:00:00', '552|20132|20092|5|1', null);
INSERT INTO `bitacora` VALUES ('1365', 'grupos', '1', 'I', '2014-11-04 00:00:00', '561|20132|20092|5|1', null);
INSERT INTO `bitacora` VALUES ('1366', 'grupos', '1', 'I', '2014-11-04 00:00:00', '562|20132|20092|5|1', null);
INSERT INTO `bitacora` VALUES ('1367', 'grupos', '1', 'I', '2014-11-04 00:00:00', '571|20132|20092|5|1', null);
INSERT INTO `bitacora` VALUES ('1368', 'grupos', '1', 'I', '2014-11-04 00:00:00', '572|20132|20092|5|1', null);
INSERT INTO `bitacora` VALUES ('1369', 'grupos', '1', 'I', '2014-11-04 00:00:00', '581|20132|20092|5|1', null);
INSERT INTO `bitacora` VALUES ('1370', 'grupos', '1', 'I', '2014-11-04 00:00:00', '582|20132|20092|5|1', null);
INSERT INTO `bitacora` VALUES ('1371', 'grupos', '1', 'I', '2014-11-04 00:00:00', '601|20132|20092|6|1', null);
INSERT INTO `bitacora` VALUES ('1372', 'grupos', '1', 'I', '2014-11-04 00:00:00', '602|20132|20092|6|1', null);
INSERT INTO `bitacora` VALUES ('1373', 'grupos', '1', 'I', '2014-11-04 00:00:00', '603|20132|20092|6|1', null);
INSERT INTO `bitacora` VALUES ('1374', 'grupos', '1', 'I', '2014-11-04 00:00:00', '604|20132|20092|6|1', null);
INSERT INTO `bitacora` VALUES ('1375', 'grupos', '1', 'I', '2014-11-04 00:00:00', '605|20132|20092|6|1', null);
INSERT INTO `bitacora` VALUES ('1376', 'grupos', '1', 'I', '2014-11-04 00:00:00', '606|20132|20092|6|1', null);
INSERT INTO `bitacora` VALUES ('1377', 'grupos', '1', 'I', '2014-11-04 00:00:00', '621|20132|20092|6|1', null);
INSERT INTO `bitacora` VALUES ('1378', 'grupos', '1', 'I', '2014-11-04 00:00:00', '622|20132|20092|6|1', null);
INSERT INTO `bitacora` VALUES ('1379', 'grupos', '1', 'I', '2014-11-04 00:00:00', '623|20132|20092|6|1', null);
INSERT INTO `bitacora` VALUES ('1380', 'grupos', '1', 'I', '2014-11-04 00:00:00', '624|20132|20092|6|1', null);
INSERT INTO `bitacora` VALUES ('1381', 'grupos', '1', 'I', '2014-11-04 00:00:00', '625|20132|20092|6|1', null);
INSERT INTO `bitacora` VALUES ('1382', 'grupos', '1', 'I', '2014-11-04 00:00:00', '626|20132|20092|6|1', null);
INSERT INTO `bitacora` VALUES ('1385', 'carga', '1', 'I', '2014-11-05 00:00:00', '601|20132|11238', null);
INSERT INTO `bitacora` VALUES ('1386', 'carga', '1', 'I', '2014-11-05 00:00:00', '601|20132|11239', null);
INSERT INTO `bitacora` VALUES ('1387', 'carga', '1', 'I', '2014-11-05 00:00:00', '601|20132|11240', null);
INSERT INTO `bitacora` VALUES ('1388', 'carga', '1', 'I', '2014-11-05 00:00:00', '601|20132|11236', null);
INSERT INTO `bitacora` VALUES ('1389', 'carga', '1', 'I', '2014-11-05 00:00:00', '601|20132|11237', null);
INSERT INTO `bitacora` VALUES ('1390', 'carga', '1', 'I', '2014-11-05 00:00:00', '601|20132|11242', null);
INSERT INTO `bitacora` VALUES ('1391', 'carga', '1', 'I', '2014-11-05 00:00:00', '601|20132|11241', null);
INSERT INTO `bitacora` VALUES ('1392', 'carga', '1', 'I', '2014-11-05 00:00:00', '603|20132|11238', null);
INSERT INTO `bitacora` VALUES ('1393', 'carga', '1', 'I', '2014-11-05 00:00:00', '603|20132|11239', null);
INSERT INTO `bitacora` VALUES ('1394', 'carga', '1', 'I', '2014-11-05 00:00:00', '603|20132|11240', null);
INSERT INTO `bitacora` VALUES ('1395', 'carga', '1', 'I', '2014-11-05 00:00:00', '603|20132|11236', null);
INSERT INTO `bitacora` VALUES ('1396', 'carga', '1', 'I', '2014-11-05 00:00:00', '603|20132|11237', null);
INSERT INTO `bitacora` VALUES ('1397', 'carga', '1', 'I', '2014-11-05 00:00:00', '603|20132|11242', null);
INSERT INTO `bitacora` VALUES ('1398', 'carga', '1', 'I', '2014-11-05 00:00:00', '603|20132|11241', null);
INSERT INTO `bitacora` VALUES ('1399', 'carga', '1', 'I', '2014-11-05 00:00:00', '602|20132|11238', null);
INSERT INTO `bitacora` VALUES ('1400', 'carga', '1', 'I', '2014-11-05 00:00:00', '602|20132|11239', null);
INSERT INTO `bitacora` VALUES ('1401', 'carga', '1', 'I', '2014-11-05 00:00:00', '602|20132|11240', null);
INSERT INTO `bitacora` VALUES ('1402', 'carga', '1', 'I', '2014-11-05 00:00:00', '602|20132|11236', null);
INSERT INTO `bitacora` VALUES ('1403', 'carga', '1', 'I', '2014-11-05 00:00:00', '602|20132|11237', null);
INSERT INTO `bitacora` VALUES ('1404', 'carga', '1', 'I', '2014-11-05 00:00:00', '602|20132|11242', null);
INSERT INTO `bitacora` VALUES ('1405', 'carga', '1', 'I', '2014-11-05 00:00:00', '602|20132|11241', null);
INSERT INTO `bitacora` VALUES ('1406', 'carga', '1', 'I', '2014-11-05 00:00:00', '604|20132|11238', null);
INSERT INTO `bitacora` VALUES ('1407', 'carga', '1', 'I', '2014-11-05 00:00:00', '604|20132|11239', null);
INSERT INTO `bitacora` VALUES ('1408', 'carga', '1', 'I', '2014-11-05 00:00:00', '604|20132|11240', null);
INSERT INTO `bitacora` VALUES ('1409', 'carga', '1', 'I', '2014-11-05 00:00:00', '604|20132|11236', null);
INSERT INTO `bitacora` VALUES ('1410', 'carga', '1', 'I', '2014-11-05 00:00:00', '604|20132|11237', null);
INSERT INTO `bitacora` VALUES ('1411', 'carga', '1', 'I', '2014-11-05 00:00:00', '604|20132|11242', null);
INSERT INTO `bitacora` VALUES ('1412', 'carga', '1', 'I', '2014-11-05 00:00:00', '604|20132|11241', null);
INSERT INTO `bitacora` VALUES ('1413', 'carga', '1', 'I', '2014-11-05 00:00:00', '605|20132|11238', null);
INSERT INTO `bitacora` VALUES ('1414', 'carga', '1', 'I', '2014-11-05 00:00:00', '605|20132|11239', null);
INSERT INTO `bitacora` VALUES ('1415', 'carga', '1', 'I', '2014-11-05 00:00:00', '605|20132|11240', null);
INSERT INTO `bitacora` VALUES ('1416', 'carga', '1', 'I', '2014-11-05 00:00:00', '605|20132|11236', null);
INSERT INTO `bitacora` VALUES ('1417', 'carga', '1', 'I', '2014-11-05 00:00:00', '605|20132|11237', null);
INSERT INTO `bitacora` VALUES ('1418', 'carga', '1', 'I', '2014-11-05 00:00:00', '605|20132|11242', null);
INSERT INTO `bitacora` VALUES ('1419', 'carga', '1', 'I', '2014-11-05 00:00:00', '605|20132|11241', null);
INSERT INTO `bitacora` VALUES ('1420', 'carga', '1', 'I', '2014-11-05 00:00:00', '606|20132|11238', null);
INSERT INTO `bitacora` VALUES ('1421', 'carga', '1', 'I', '2014-11-05 00:00:00', '606|20132|11239', null);
INSERT INTO `bitacora` VALUES ('1422', 'carga', '1', 'I', '2014-11-05 00:00:00', '606|20132|11240', null);
INSERT INTO `bitacora` VALUES ('1423', 'carga', '1', 'I', '2014-11-05 00:00:00', '606|20132|11236', null);
INSERT INTO `bitacora` VALUES ('1424', 'carga', '1', 'I', '2014-11-05 00:00:00', '606|20132|11237', null);
INSERT INTO `bitacora` VALUES ('1425', 'carga', '1', 'I', '2014-11-05 00:00:00', '606|20132|11242', null);
INSERT INTO `bitacora` VALUES ('1426', 'carga', '1', 'I', '2014-11-05 00:00:00', '606|20132|11241', null);
INSERT INTO `bitacora` VALUES ('1427', 'grupos', '1', 'I', '2014-11-05 00:00:00', '607|20132|20092|2|3', null);
INSERT INTO `bitacora` VALUES ('1428', 'grupos', '1', 'I', '2014-11-05 00:00:00', '608|20132|20092|2|3', null);
INSERT INTO `bitacora` VALUES ('1429', 'grupos', '1', 'I', '2014-11-05 00:00:00', '611|20132|20092|2|2', null);
INSERT INTO `bitacora` VALUES ('1430', 'grupos', '1', 'I', '2014-11-05 00:00:00', '612|20132|20092|2|2', null);
INSERT INTO `bitacora` VALUES ('1432', 'carga', '1', 'I', '2014-11-05 00:00:00', '607|20132|11236', null);
INSERT INTO `bitacora` VALUES ('1433', 'carga', '1', 'I', '2014-11-05 00:00:00', '607|20132|11237', null);
INSERT INTO `bitacora` VALUES ('1434', 'carga', '1', 'I', '2014-11-05 00:00:00', '607|20132|11238', null);
INSERT INTO `bitacora` VALUES ('1435', 'carga', '1', 'I', '2014-11-05 00:00:00', '607|20132|11239', null);
INSERT INTO `bitacora` VALUES ('1436', 'carga', '1', 'I', '2014-11-05 00:00:00', '607|20132|11240', null);
INSERT INTO `bitacora` VALUES ('1437', 'carga', '1', 'I', '2014-11-05 00:00:00', '607|20132|11241', null);
INSERT INTO `bitacora` VALUES ('1438', 'carga', '1', 'I', '2014-11-05 00:00:00', '607|20132|11242', null);
INSERT INTO `bitacora` VALUES ('1439', 'carga', '1', 'I', '2014-11-05 00:00:00', '608|20132|11236', null);
INSERT INTO `bitacora` VALUES ('1440', 'carga', '1', 'I', '2014-11-05 00:00:00', '608|20132|11237', null);
INSERT INTO `bitacora` VALUES ('1441', 'carga', '1', 'I', '2014-11-05 00:00:00', '608|20132|11238', null);
INSERT INTO `bitacora` VALUES ('1442', 'carga', '1', 'I', '2014-11-05 00:00:00', '608|20132|11239', null);
INSERT INTO `bitacora` VALUES ('1443', 'carga', '1', 'I', '2014-11-05 00:00:00', '608|20132|11240', null);
INSERT INTO `bitacora` VALUES ('1444', 'carga', '1', 'I', '2014-11-05 00:00:00', '608|20132|11241', null);
INSERT INTO `bitacora` VALUES ('1445', 'carga', '1', 'I', '2014-11-05 00:00:00', '608|20132|11242', null);
INSERT INTO `bitacora` VALUES ('1446', 'carga', '1', 'I', '2014-11-05 00:00:00', '611|20132|11236', null);
INSERT INTO `bitacora` VALUES ('1447', 'carga', '1', 'I', '2014-11-05 00:00:00', '611|20132|11237', null);
INSERT INTO `bitacora` VALUES ('1448', 'carga', '1', 'I', '2014-11-05 00:00:00', '611|20132|11238', null);
INSERT INTO `bitacora` VALUES ('1449', 'carga', '1', 'I', '2014-11-05 00:00:00', '611|20132|11239', null);
INSERT INTO `bitacora` VALUES ('1450', 'carga', '1', 'I', '2014-11-05 00:00:00', '611|20132|11240', null);
INSERT INTO `bitacora` VALUES ('1451', 'carga', '1', 'I', '2014-11-05 00:00:00', '611|20132|11241', null);
INSERT INTO `bitacora` VALUES ('1452', 'carga', '1', 'I', '2014-11-05 00:00:00', '611|20132|11242', null);
INSERT INTO `bitacora` VALUES ('1453', 'carga', '1', 'I', '2014-11-05 00:00:00', '612|20132|11236', null);
INSERT INTO `bitacora` VALUES ('1454', 'carga', '1', 'I', '2014-11-05 00:00:00', '612|20132|11237', null);
INSERT INTO `bitacora` VALUES ('1455', 'carga', '1', 'I', '2014-11-05 00:00:00', '612|20132|11238', null);
INSERT INTO `bitacora` VALUES ('1456', 'carga', '1', 'I', '2014-11-05 00:00:00', '612|20132|11239', null);
INSERT INTO `bitacora` VALUES ('1457', 'carga', '1', 'I', '2014-11-05 00:00:00', '612|20132|11240', null);
INSERT INTO `bitacora` VALUES ('1458', 'carga', '1', 'I', '2014-11-05 00:00:00', '612|20132|11241', null);
INSERT INTO `bitacora` VALUES ('1459', 'carga', '1', 'I', '2014-11-05 00:00:00', '612|20132|11242', null);
INSERT INTO `bitacora` VALUES ('1460', 'periodos', '1', 'I', '2014-11-05 00:00:00', '20151|1|2015|1|2015-01-01|2015-07-31|1', null);
INSERT INTO `bitacora` VALUES ('1461', 'periodos', '1', 'I', '2014-11-05 00:00:00', '20152|1|2015|7|2015-08-01|2014-12-31|1', null);
INSERT INTO `bitacora` VALUES ('1462', 'grupos', '1', 'I', '2014-11-05 00:00:00', '231|20151|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('1463', 'grupos', '1', 'I', '2014-11-05 00:00:00', '232|20151|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('1464', 'grupos', '1', 'I', '2014-11-05 00:00:00', '235|20151|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('1465', 'grupos', '1', 'I', '2014-11-05 00:00:00', '233|20151|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('1466', 'grupos', '1', 'I', '2014-11-05 00:00:00', '234|20151|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('1467', 'grupos', '1', 'I', '2014-11-05 00:00:00', '236|20151|20092|2|2', null);
INSERT INTO `bitacora` VALUES ('1468', 'grupos', '1', 'I', '2014-11-05 00:00:00', '241|20151|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('1469', 'grupos', '1', 'I', '2014-11-05 00:00:00', '242|20151|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('1470', 'grupos', '1', 'I', '2014-11-05 00:00:00', '245|20151|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('1471', 'grupos', '1', 'I', '2014-11-05 00:00:00', '243|20151|20092|2|2', null);
INSERT INTO `bitacora` VALUES ('1472', 'grupos', '1', 'I', '2014-11-05 00:00:00', '244|20151|20092|2|2', null);
INSERT INTO `bitacora` VALUES ('1473', 'grupos', '1', 'I', '2014-11-05 00:00:00', '246|20151|20092|2|2', null);
INSERT INTO `bitacora` VALUES ('1474', 'grupos', '1', 'I', '2014-11-05 00:00:00', '251|20151|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('1475', 'grupos', '1', 'I', '2014-11-05 00:00:00', '252|20151|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('1476', 'grupos', '1', 'I', '2014-11-05 00:00:00', '255|20151|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('1477', 'grupos', '1', 'I', '2014-11-05 00:00:00', '253|20151|20092|2|2', null);
INSERT INTO `bitacora` VALUES ('1478', 'grupos', '1', 'I', '2014-11-05 00:00:00', '254|20151|20092|2|2', null);
INSERT INTO `bitacora` VALUES ('1479', 'grupos', '1', 'I', '2014-11-05 00:00:00', '256|20151|20092|2|2', null);
INSERT INTO `bitacora` VALUES ('1480', 'grupos', '1', 'I', '2014-11-05 00:00:00', '261|20151|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('1481', 'grupos', '1', 'I', '2014-11-05 00:00:00', '262|20151|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('1482', 'grupos', '1', 'I', '2014-11-05 00:00:00', '265|20151|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('1483', 'grupos', '1', 'I', '2014-11-05 00:00:00', '263|20151|20092|2|2', null);
INSERT INTO `bitacora` VALUES ('1484', 'grupos', '1', 'I', '2014-11-05 00:00:00', '264|20151|20092|2|2', null);
INSERT INTO `bitacora` VALUES ('1485', 'grupos', '1', 'I', '2014-11-05 00:00:00', '266|20151|20092|2|2', null);
INSERT INTO `bitacora` VALUES ('1486', 'grupos', '1', 'I', '2014-11-05 00:00:00', '271|20151|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('1487', 'grupos', '1', 'I', '2014-11-05 00:00:00', '272|20151|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('1488', 'grupos', '1', 'I', '2014-11-05 00:00:00', '275|20151|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('1489', 'grupos', '1', 'I', '2014-11-05 00:00:00', '273|20151|20092|2|2', null);
INSERT INTO `bitacora` VALUES ('1490', 'grupos', '1', 'I', '2014-11-05 00:00:00', '274|20151|20092|2|2', null);
INSERT INTO `bitacora` VALUES ('1491', 'grupos', '1', 'I', '2014-11-05 00:00:00', '276|20151|20092|2|2', null);
INSERT INTO `bitacora` VALUES ('1492', 'grupos', '1', 'I', '2014-11-05 00:00:00', '281|20151|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('1493', 'grupos', '1', 'I', '2014-11-05 00:00:00', '282|20151|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('1494', 'grupos', '1', 'I', '2014-11-05 00:00:00', '285|20151|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('1495', 'grupos', '1', 'I', '2014-11-05 00:00:00', '283|20151|20092|2|2', null);
INSERT INTO `bitacora` VALUES ('1496', 'grupos', '1', 'I', '2014-11-05 00:00:00', '284|20151|20092|2|2', null);
INSERT INTO `bitacora` VALUES ('1497', 'grupos', '1', 'I', '2014-11-05 00:00:00', '286|20151|20092|2|2', null);
INSERT INTO `bitacora` VALUES ('1498', 'carga', '1', 'I', '2014-11-05 00:00:00', '231|20151|12456', null);
INSERT INTO `bitacora` VALUES ('1499', 'carga', '1', 'I', '2014-11-05 00:00:00', '231|20151|12457', null);
INSERT INTO `bitacora` VALUES ('1500', 'carga', '1', 'I', '2014-11-05 00:00:00', '231|20151|11859', null);
INSERT INTO `bitacora` VALUES ('1501', 'carga', '1', 'I', '2014-11-05 00:00:00', '231|20151|12458', null);
INSERT INTO `bitacora` VALUES ('1502', 'carga', '1', 'I', '2014-11-05 00:00:00', '231|20151|12459', null);
INSERT INTO `bitacora` VALUES ('1503', 'carga', '1', 'I', '2014-11-05 00:00:00', '231|20151|11843', null);
INSERT INTO `bitacora` VALUES ('1504', 'carga', '1', 'I', '2014-11-05 00:00:00', '231|20151|11734', null);
INSERT INTO `bitacora` VALUES ('1505', 'carga', '1', 'I', '2014-11-05 00:00:00', '232|20151|12456', null);
INSERT INTO `bitacora` VALUES ('1506', 'carga', '1', 'I', '2014-11-05 00:00:00', '232|20151|12457', null);
INSERT INTO `bitacora` VALUES ('1507', 'carga', '1', 'I', '2014-11-05 00:00:00', '232|20151|11859', null);
INSERT INTO `bitacora` VALUES ('1508', 'carga', '1', 'I', '2014-11-05 00:00:00', '232|20151|12458', null);
INSERT INTO `bitacora` VALUES ('1509', 'carga', '1', 'I', '2014-11-05 00:00:00', '232|20151|12459', null);
INSERT INTO `bitacora` VALUES ('1510', 'carga', '1', 'I', '2014-11-05 00:00:00', '232|20151|11843', null);
INSERT INTO `bitacora` VALUES ('1511', 'carga', '1', 'I', '2014-11-05 00:00:00', '232|20151|11734', null);
INSERT INTO `bitacora` VALUES ('1512', 'carga', '1', 'I', '2014-11-05 00:00:00', '235|20151|12456', null);
INSERT INTO `bitacora` VALUES ('1513', 'carga', '1', 'I', '2014-11-05 00:00:00', '235|20151|12457', null);
INSERT INTO `bitacora` VALUES ('1514', 'carga', '1', 'I', '2014-11-05 00:00:00', '235|20151|11859', null);
INSERT INTO `bitacora` VALUES ('1515', 'carga', '1', 'I', '2014-11-05 00:00:00', '235|20151|12458', null);
INSERT INTO `bitacora` VALUES ('1516', 'carga', '1', 'I', '2014-11-05 00:00:00', '235|20151|12459', null);
INSERT INTO `bitacora` VALUES ('1517', 'carga', '1', 'I', '2014-11-05 00:00:00', '235|20151|11843', null);
INSERT INTO `bitacora` VALUES ('1518', 'carga', '1', 'I', '2014-11-05 00:00:00', '235|20151|11734', null);
INSERT INTO `bitacora` VALUES ('1519', 'carga', '1', 'I', '2014-11-05 00:00:00', '233|20151|12456', null);
INSERT INTO `bitacora` VALUES ('1520', 'carga', '1', 'I', '2014-11-05 00:00:00', '233|20151|12457', null);
INSERT INTO `bitacora` VALUES ('1521', 'carga', '1', 'I', '2014-11-05 00:00:00', '233|20151|11859', null);
INSERT INTO `bitacora` VALUES ('1522', 'carga', '1', 'I', '2014-11-05 00:00:00', '233|20151|12458', null);
INSERT INTO `bitacora` VALUES ('1523', 'carga', '1', 'I', '2014-11-05 00:00:00', '233|20151|12459', null);
INSERT INTO `bitacora` VALUES ('1524', 'carga', '1', 'I', '2014-11-05 00:00:00', '233|20151|11843', null);
INSERT INTO `bitacora` VALUES ('1525', 'carga', '1', 'I', '2014-11-05 00:00:00', '233|20151|11734', null);
INSERT INTO `bitacora` VALUES ('1526', 'carga', '1', 'I', '2014-11-05 00:00:00', '234|20151|12456', null);
INSERT INTO `bitacora` VALUES ('1527', 'carga', '1', 'I', '2014-11-05 00:00:00', '234|20151|12457', null);
INSERT INTO `bitacora` VALUES ('1528', 'carga', '1', 'I', '2014-11-05 00:00:00', '234|20151|11859', null);
INSERT INTO `bitacora` VALUES ('1529', 'carga', '1', 'I', '2014-11-05 00:00:00', '234|20151|12458', null);
INSERT INTO `bitacora` VALUES ('1530', 'carga', '1', 'I', '2014-11-05 00:00:00', '234|20151|12459', null);
INSERT INTO `bitacora` VALUES ('1531', 'carga', '1', 'I', '2014-11-05 00:00:00', '234|20151|11843', null);
INSERT INTO `bitacora` VALUES ('1532', 'carga', '1', 'I', '2014-11-05 00:00:00', '234|20151|11734', null);
INSERT INTO `bitacora` VALUES ('1533', 'carga', '1', 'I', '2014-11-05 00:00:00', '236|20151|12456', null);
INSERT INTO `bitacora` VALUES ('1534', 'carga', '1', 'I', '2014-11-05 00:00:00', '236|20151|12457', null);
INSERT INTO `bitacora` VALUES ('1535', 'carga', '1', 'I', '2014-11-05 00:00:00', '236|20151|11859', null);
INSERT INTO `bitacora` VALUES ('1536', 'carga', '1', 'I', '2014-11-05 00:00:00', '236|20151|12458', null);
INSERT INTO `bitacora` VALUES ('1537', 'carga', '1', 'I', '2014-11-05 00:00:00', '236|20151|12459', null);
INSERT INTO `bitacora` VALUES ('1538', 'carga', '1', 'I', '2014-11-05 00:00:00', '236|20151|11843', null);
INSERT INTO `bitacora` VALUES ('1539', 'carga', '1', 'I', '2014-11-05 00:00:00', '236|20151|11734', null);
INSERT INTO `bitacora` VALUES ('1540', 'carga', '1', 'I', '2014-11-05 00:00:00', '241|20151|11862', null);
INSERT INTO `bitacora` VALUES ('1541', 'carga', '1', 'I', '2014-11-05 00:00:00', '241|20151|12463', null);
INSERT INTO `bitacora` VALUES ('1542', 'carga', '1', 'I', '2014-11-05 00:00:00', '241|20151|12464', null);
INSERT INTO `bitacora` VALUES ('1543', 'carga', '1', 'I', '2014-11-05 00:00:00', '241|20151|12462', null);
INSERT INTO `bitacora` VALUES ('1544', 'carga', '1', 'I', '2014-11-05 00:00:00', '241|20151|12460', null);
INSERT INTO `bitacora` VALUES ('1545', 'carga', '1', 'I', '2014-11-05 00:00:00', '241|20151|11733', null);
INSERT INTO `bitacora` VALUES ('1546', 'carga', '1', 'I', '2014-11-05 00:00:00', '241|20151|12461', null);
INSERT INTO `bitacora` VALUES ('1547', 'carga', '1', 'I', '2014-11-05 00:00:00', '241|20151|12487', null);
INSERT INTO `bitacora` VALUES ('1548', 'carga', '1', 'I', '2014-11-05 00:00:00', '241|20151|11761', null);
INSERT INTO `bitacora` VALUES ('1549', 'carga', '1', 'I', '2014-11-05 00:00:00', '241|20151|12492', null);
INSERT INTO `bitacora` VALUES ('1550', 'carga', '1', 'I', '2014-11-05 00:00:00', '242|20151|11862', null);
INSERT INTO `bitacora` VALUES ('1551', 'carga', '1', 'I', '2014-11-05 00:00:00', '242|20151|12463', null);
INSERT INTO `bitacora` VALUES ('1552', 'carga', '1', 'I', '2014-11-05 00:00:00', '242|20151|12464', null);
INSERT INTO `bitacora` VALUES ('1553', 'carga', '1', 'I', '2014-11-05 00:00:00', '242|20151|12462', null);
INSERT INTO `bitacora` VALUES ('1554', 'carga', '1', 'I', '2014-11-05 00:00:00', '242|20151|12460', null);
INSERT INTO `bitacora` VALUES ('1555', 'carga', '1', 'I', '2014-11-05 00:00:00', '242|20151|11733', null);
INSERT INTO `bitacora` VALUES ('1556', 'carga', '1', 'I', '2014-11-05 00:00:00', '242|20151|12461', null);
INSERT INTO `bitacora` VALUES ('1557', 'carga', '1', 'I', '2014-11-05 00:00:00', '242|20151|12487', null);
INSERT INTO `bitacora` VALUES ('1558', 'carga', '1', 'I', '2014-11-05 00:00:00', '242|20151|11761', null);
INSERT INTO `bitacora` VALUES ('1559', 'carga', '1', 'I', '2014-11-05 00:00:00', '242|20151|12492', null);
INSERT INTO `bitacora` VALUES ('1560', 'carga', '1', 'I', '2014-11-05 00:00:00', '245|20151|11862', null);
INSERT INTO `bitacora` VALUES ('1561', 'carga', '1', 'I', '2014-11-05 00:00:00', '245|20151|12463', null);
INSERT INTO `bitacora` VALUES ('1562', 'carga', '1', 'I', '2014-11-05 00:00:00', '245|20151|12464', null);
INSERT INTO `bitacora` VALUES ('1563', 'carga', '1', 'I', '2014-11-05 00:00:00', '245|20151|12462', null);
INSERT INTO `bitacora` VALUES ('1564', 'carga', '1', 'I', '2014-11-05 00:00:00', '245|20151|12460', null);
INSERT INTO `bitacora` VALUES ('1565', 'carga', '1', 'I', '2014-11-05 00:00:00', '245|20151|11733', null);
INSERT INTO `bitacora` VALUES ('1566', 'carga', '1', 'I', '2014-11-05 00:00:00', '245|20151|12461', null);
INSERT INTO `bitacora` VALUES ('1567', 'carga', '1', 'I', '2014-11-05 00:00:00', '245|20151|12487', null);
INSERT INTO `bitacora` VALUES ('1568', 'carga', '1', 'I', '2014-11-05 00:00:00', '245|20151|11761', null);
INSERT INTO `bitacora` VALUES ('1569', 'carga', '1', 'I', '2014-11-05 00:00:00', '245|20151|12492', null);
INSERT INTO `bitacora` VALUES ('1570', 'carga', '1', 'I', '2014-11-05 00:00:00', '243|20151|11862', null);
INSERT INTO `bitacora` VALUES ('1571', 'carga', '1', 'I', '2014-11-05 00:00:00', '243|20151|12463', null);
INSERT INTO `bitacora` VALUES ('1572', 'carga', '1', 'I', '2014-11-05 00:00:00', '243|20151|12464', null);
INSERT INTO `bitacora` VALUES ('1573', 'carga', '1', 'I', '2014-11-05 00:00:00', '243|20151|12462', null);
INSERT INTO `bitacora` VALUES ('1574', 'carga', '1', 'I', '2014-11-05 00:00:00', '243|20151|12460', null);
INSERT INTO `bitacora` VALUES ('1575', 'carga', '1', 'I', '2014-11-05 00:00:00', '243|20151|11733', null);
INSERT INTO `bitacora` VALUES ('1576', 'carga', '1', 'I', '2014-11-05 00:00:00', '243|20151|12461', null);
INSERT INTO `bitacora` VALUES ('1577', 'carga', '1', 'I', '2014-11-05 00:00:00', '243|20151|12487', null);
INSERT INTO `bitacora` VALUES ('1578', 'carga', '1', 'I', '2014-11-05 00:00:00', '243|20151|11761', null);
INSERT INTO `bitacora` VALUES ('1579', 'carga', '1', 'I', '2014-11-05 00:00:00', '243|20151|12492', null);
INSERT INTO `bitacora` VALUES ('1580', 'carga', '1', 'I', '2014-11-05 00:00:00', '244|20151|11862', null);
INSERT INTO `bitacora` VALUES ('1581', 'carga', '1', 'I', '2014-11-05 00:00:00', '244|20151|12463', null);
INSERT INTO `bitacora` VALUES ('1582', 'carga', '1', 'I', '2014-11-05 00:00:00', '244|20151|12464', null);
INSERT INTO `bitacora` VALUES ('1583', 'carga', '1', 'I', '2014-11-05 00:00:00', '244|20151|12462', null);
INSERT INTO `bitacora` VALUES ('1584', 'carga', '1', 'I', '2014-11-05 00:00:00', '244|20151|12460', null);
INSERT INTO `bitacora` VALUES ('1585', 'carga', '1', 'I', '2014-11-05 00:00:00', '244|20151|11733', null);
INSERT INTO `bitacora` VALUES ('1586', 'carga', '1', 'I', '2014-11-05 00:00:00', '244|20151|12461', null);
INSERT INTO `bitacora` VALUES ('1587', 'carga', '1', 'I', '2014-11-05 00:00:00', '244|20151|12487', null);
INSERT INTO `bitacora` VALUES ('1588', 'carga', '1', 'I', '2014-11-05 00:00:00', '244|20151|11761', null);
INSERT INTO `bitacora` VALUES ('1589', 'carga', '1', 'I', '2014-11-05 00:00:00', '244|20151|12492', null);
INSERT INTO `bitacora` VALUES ('1590', 'carga', '1', 'I', '2014-11-05 00:00:00', '246|20151|11862', null);
INSERT INTO `bitacora` VALUES ('1591', 'carga', '1', 'I', '2014-11-05 00:00:00', '246|20151|12463', null);
INSERT INTO `bitacora` VALUES ('1592', 'carga', '1', 'I', '2014-11-05 00:00:00', '246|20151|12464', null);
INSERT INTO `bitacora` VALUES ('1593', 'carga', '1', 'I', '2014-11-05 00:00:00', '246|20151|12462', null);
INSERT INTO `bitacora` VALUES ('1594', 'carga', '1', 'I', '2014-11-05 00:00:00', '246|20151|12460', null);
INSERT INTO `bitacora` VALUES ('1595', 'carga', '1', 'I', '2014-11-05 00:00:00', '246|20151|11733', null);
INSERT INTO `bitacora` VALUES ('1596', 'carga', '1', 'I', '2014-11-05 00:00:00', '246|20151|12461', null);
INSERT INTO `bitacora` VALUES ('1597', 'carga', '1', 'I', '2014-11-05 00:00:00', '246|20151|12487', null);
INSERT INTO `bitacora` VALUES ('1598', 'carga', '1', 'I', '2014-11-05 00:00:00', '246|20151|11761', null);
INSERT INTO `bitacora` VALUES ('1599', 'carga', '1', 'I', '2014-11-05 00:00:00', '246|20151|12492', null);
INSERT INTO `bitacora` VALUES ('1618', 'carga', '1', 'I', '2014-11-05 00:00:00', '251|20151|12468', null);
INSERT INTO `bitacora` VALUES ('1619', 'carga', '1', 'I', '2014-11-05 00:00:00', '251|20151|12469', null);
INSERT INTO `bitacora` VALUES ('1620', 'carga', '1', 'I', '2014-11-05 00:00:00', '251|20151|12465', null);
INSERT INTO `bitacora` VALUES ('1621', 'carga', '1', 'I', '2014-11-05 00:00:00', '251|20151|12466', null);
INSERT INTO `bitacora` VALUES ('1622', 'carga', '1', 'I', '2014-11-05 00:00:00', '251|20151|12467', null);
INSERT INTO `bitacora` VALUES ('1623', 'carga', '1', 'I', '2014-11-05 00:00:00', '251|20151|11761', null);
INSERT INTO `bitacora` VALUES ('1624', 'carga', '1', 'I', '2014-11-05 00:00:00', '251|20151|12489', null);
INSERT INTO `bitacora` VALUES ('1625', 'carga', '1', 'I', '2014-11-05 00:00:00', '251|20151|12487', null);
INSERT INTO `bitacora` VALUES ('1626', 'carga', '1', 'I', '2014-11-05 00:00:00', '251|20151|12492', null);
INSERT INTO `bitacora` VALUES ('1627', 'carga', '1', 'I', '2014-11-05 00:00:00', '251|20151|12490', null);
INSERT INTO `bitacora` VALUES ('1628', 'carga', '1', 'I', '2014-11-05 00:00:00', '252|20151|12468', null);
INSERT INTO `bitacora` VALUES ('1629', 'carga', '1', 'I', '2014-11-05 00:00:00', '252|20151|12469', null);
INSERT INTO `bitacora` VALUES ('1630', 'carga', '1', 'I', '2014-11-05 00:00:00', '252|20151|12465', null);
INSERT INTO `bitacora` VALUES ('1631', 'carga', '1', 'I', '2014-11-05 00:00:00', '252|20151|12466', null);
INSERT INTO `bitacora` VALUES ('1632', 'carga', '1', 'I', '2014-11-05 00:00:00', '252|20151|12467', null);
INSERT INTO `bitacora` VALUES ('1633', 'carga', '1', 'I', '2014-11-05 00:00:00', '252|20151|11761', null);
INSERT INTO `bitacora` VALUES ('1634', 'carga', '1', 'I', '2014-11-05 00:00:00', '252|20151|12489', null);
INSERT INTO `bitacora` VALUES ('1635', 'carga', '1', 'I', '2014-11-05 00:00:00', '252|20151|12487', null);
INSERT INTO `bitacora` VALUES ('1636', 'carga', '1', 'I', '2014-11-05 00:00:00', '252|20151|12492', null);
INSERT INTO `bitacora` VALUES ('1637', 'carga', '1', 'I', '2014-11-05 00:00:00', '252|20151|12490', null);
INSERT INTO `bitacora` VALUES ('1638', 'carga', '1', 'I', '2014-11-05 00:00:00', '255|20151|12468', null);
INSERT INTO `bitacora` VALUES ('1639', 'carga', '1', 'I', '2014-11-05 00:00:00', '255|20151|12469', null);
INSERT INTO `bitacora` VALUES ('1640', 'carga', '1', 'I', '2014-11-05 00:00:00', '255|20151|12465', null);
INSERT INTO `bitacora` VALUES ('1641', 'carga', '1', 'I', '2014-11-05 00:00:00', '255|20151|12466', null);
INSERT INTO `bitacora` VALUES ('1642', 'carga', '1', 'I', '2014-11-05 00:00:00', '255|20151|12467', null);
INSERT INTO `bitacora` VALUES ('1643', 'carga', '1', 'I', '2014-11-05 00:00:00', '255|20151|11761', null);
INSERT INTO `bitacora` VALUES ('1644', 'carga', '1', 'I', '2014-11-05 00:00:00', '255|20151|12489', null);
INSERT INTO `bitacora` VALUES ('1645', 'carga', '1', 'I', '2014-11-05 00:00:00', '255|20151|12487', null);
INSERT INTO `bitacora` VALUES ('1646', 'carga', '1', 'I', '2014-11-05 00:00:00', '255|20151|12492', null);
INSERT INTO `bitacora` VALUES ('1647', 'carga', '1', 'I', '2014-11-05 00:00:00', '255|20151|12490', null);
INSERT INTO `bitacora` VALUES ('1648', 'carga', '1', 'I', '2014-11-05 00:00:00', '253|20151|12468', null);
INSERT INTO `bitacora` VALUES ('1649', 'carga', '1', 'I', '2014-11-05 00:00:00', '253|20151|12469', null);
INSERT INTO `bitacora` VALUES ('1650', 'carga', '1', 'I', '2014-11-05 00:00:00', '253|20151|12465', null);
INSERT INTO `bitacora` VALUES ('1651', 'carga', '1', 'I', '2014-11-05 00:00:00', '253|20151|12466', null);
INSERT INTO `bitacora` VALUES ('1652', 'carga', '1', 'I', '2014-11-05 00:00:00', '253|20151|12467', null);
INSERT INTO `bitacora` VALUES ('1653', 'carga', '1', 'I', '2014-11-05 00:00:00', '253|20151|11761', null);
INSERT INTO `bitacora` VALUES ('1654', 'carga', '1', 'I', '2014-11-05 00:00:00', '253|20151|12489', null);
INSERT INTO `bitacora` VALUES ('1655', 'carga', '1', 'I', '2014-11-05 00:00:00', '253|20151|12487', null);
INSERT INTO `bitacora` VALUES ('1656', 'carga', '1', 'I', '2014-11-05 00:00:00', '253|20151|12492', null);
INSERT INTO `bitacora` VALUES ('1657', 'carga', '1', 'I', '2014-11-05 00:00:00', '253|20151|12490', null);
INSERT INTO `bitacora` VALUES ('1658', 'carga', '1', 'I', '2014-11-05 00:00:00', '254|20151|12468', null);
INSERT INTO `bitacora` VALUES ('1659', 'carga', '1', 'I', '2014-11-05 00:00:00', '254|20151|12469', null);
INSERT INTO `bitacora` VALUES ('1660', 'carga', '1', 'I', '2014-11-05 00:00:00', '254|20151|12465', null);
INSERT INTO `bitacora` VALUES ('1661', 'carga', '1', 'I', '2014-11-05 00:00:00', '254|20151|12466', null);
INSERT INTO `bitacora` VALUES ('1662', 'carga', '1', 'I', '2014-11-05 00:00:00', '254|20151|12467', null);
INSERT INTO `bitacora` VALUES ('1663', 'carga', '1', 'I', '2014-11-05 00:00:00', '254|20151|11761', null);
INSERT INTO `bitacora` VALUES ('1664', 'carga', '1', 'I', '2014-11-05 00:00:00', '254|20151|12489', null);
INSERT INTO `bitacora` VALUES ('1665', 'carga', '1', 'I', '2014-11-05 00:00:00', '254|20151|12487', null);
INSERT INTO `bitacora` VALUES ('1666', 'carga', '1', 'I', '2014-11-05 00:00:00', '254|20151|12492', null);
INSERT INTO `bitacora` VALUES ('1667', 'carga', '1', 'I', '2014-11-05 00:00:00', '254|20151|12490', null);
INSERT INTO `bitacora` VALUES ('1668', 'carga', '1', 'I', '2014-11-05 00:00:00', '256|20151|12468', null);
INSERT INTO `bitacora` VALUES ('1669', 'carga', '1', 'I', '2014-11-05 00:00:00', '256|20151|12469', null);
INSERT INTO `bitacora` VALUES ('1670', 'carga', '1', 'I', '2014-11-05 00:00:00', '256|20151|12465', null);
INSERT INTO `bitacora` VALUES ('1671', 'carga', '1', 'I', '2014-11-05 00:00:00', '256|20151|12466', null);
INSERT INTO `bitacora` VALUES ('1672', 'carga', '1', 'I', '2014-11-05 00:00:00', '256|20151|12467', null);
INSERT INTO `bitacora` VALUES ('1673', 'carga', '1', 'I', '2014-11-05 00:00:00', '256|20151|11761', null);
INSERT INTO `bitacora` VALUES ('1674', 'carga', '1', 'I', '2014-11-05 00:00:00', '256|20151|12489', null);
INSERT INTO `bitacora` VALUES ('1675', 'carga', '1', 'I', '2014-11-05 00:00:00', '256|20151|12487', null);
INSERT INTO `bitacora` VALUES ('1676', 'carga', '1', 'I', '2014-11-05 00:00:00', '256|20151|12492', null);
INSERT INTO `bitacora` VALUES ('1677', 'carga', '1', 'I', '2014-11-05 00:00:00', '256|20151|12490', null);
INSERT INTO `bitacora` VALUES ('1678', 'carga', '1', 'I', '2014-11-05 00:00:00', '261|20151|12473', null);
INSERT INTO `bitacora` VALUES ('1679', 'carga', '1', 'I', '2014-11-05 00:00:00', '261|20151|12475', null);
INSERT INTO `bitacora` VALUES ('1680', 'carga', '1', 'I', '2014-11-05 00:00:00', '261|20151|12474', null);
INSERT INTO `bitacora` VALUES ('1681', 'carga', '1', 'I', '2014-11-05 00:00:00', '261|20151|12472', null);
INSERT INTO `bitacora` VALUES ('1682', 'carga', '1', 'I', '2014-11-05 00:00:00', '261|20151|12470', null);
INSERT INTO `bitacora` VALUES ('1683', 'carga', '1', 'I', '2014-11-05 00:00:00', '261|20151|12471', null);
INSERT INTO `bitacora` VALUES ('1684', 'carga', '1', 'I', '2014-11-05 00:00:00', '261|20151|12487', null);
INSERT INTO `bitacora` VALUES ('1685', 'carga', '1', 'I', '2014-11-05 00:00:00', '261|20151|12491', null);
INSERT INTO `bitacora` VALUES ('1686', 'carga', '1', 'I', '2014-11-05 00:00:00', '261|20151|12490', null);
INSERT INTO `bitacora` VALUES ('1687', 'carga', '1', 'I', '2014-11-05 00:00:00', '261|20151|12489', null);
INSERT INTO `bitacora` VALUES ('1688', 'carga', '1', 'I', '2014-11-05 00:00:00', '262|20151|12473', null);
INSERT INTO `bitacora` VALUES ('1689', 'carga', '1', 'I', '2014-11-05 00:00:00', '262|20151|12475', null);
INSERT INTO `bitacora` VALUES ('1690', 'carga', '1', 'I', '2014-11-05 00:00:00', '262|20151|12474', null);
INSERT INTO `bitacora` VALUES ('1691', 'carga', '1', 'I', '2014-11-05 00:00:00', '262|20151|12472', null);
INSERT INTO `bitacora` VALUES ('1692', 'carga', '1', 'I', '2014-11-05 00:00:00', '262|20151|12470', null);
INSERT INTO `bitacora` VALUES ('1693', 'carga', '1', 'I', '2014-11-05 00:00:00', '262|20151|12471', null);
INSERT INTO `bitacora` VALUES ('1694', 'carga', '1', 'I', '2014-11-05 00:00:00', '262|20151|12487', null);
INSERT INTO `bitacora` VALUES ('1695', 'carga', '1', 'I', '2014-11-05 00:00:00', '262|20151|12491', null);
INSERT INTO `bitacora` VALUES ('1696', 'carga', '1', 'I', '2014-11-05 00:00:00', '262|20151|12490', null);
INSERT INTO `bitacora` VALUES ('1697', 'carga', '1', 'I', '2014-11-05 00:00:00', '262|20151|12489', null);
INSERT INTO `bitacora` VALUES ('1698', 'carga', '1', 'I', '2014-11-05 00:00:00', '265|20151|12473', null);
INSERT INTO `bitacora` VALUES ('1699', 'carga', '1', 'I', '2014-11-05 00:00:00', '265|20151|12475', null);
INSERT INTO `bitacora` VALUES ('1700', 'carga', '1', 'I', '2014-11-05 00:00:00', '265|20151|12474', null);
INSERT INTO `bitacora` VALUES ('1701', 'carga', '1', 'I', '2014-11-05 00:00:00', '265|20151|12472', null);
INSERT INTO `bitacora` VALUES ('1702', 'carga', '1', 'I', '2014-11-05 00:00:00', '265|20151|12470', null);
INSERT INTO `bitacora` VALUES ('1703', 'carga', '1', 'I', '2014-11-05 00:00:00', '265|20151|12471', null);
INSERT INTO `bitacora` VALUES ('1704', 'carga', '1', 'I', '2014-11-05 00:00:00', '265|20151|12487', null);
INSERT INTO `bitacora` VALUES ('1705', 'carga', '1', 'I', '2014-11-05 00:00:00', '265|20151|12491', null);
INSERT INTO `bitacora` VALUES ('1706', 'carga', '1', 'I', '2014-11-05 00:00:00', '265|20151|12490', null);
INSERT INTO `bitacora` VALUES ('1707', 'carga', '1', 'I', '2014-11-05 00:00:00', '265|20151|12489', null);
INSERT INTO `bitacora` VALUES ('1708', 'carga', '1', 'I', '2014-11-05 00:00:00', '263|20151|12473', null);
INSERT INTO `bitacora` VALUES ('1709', 'carga', '1', 'I', '2014-11-05 00:00:00', '263|20151|12475', null);
INSERT INTO `bitacora` VALUES ('1710', 'carga', '1', 'I', '2014-11-05 00:00:00', '263|20151|12474', null);
INSERT INTO `bitacora` VALUES ('1711', 'carga', '1', 'I', '2014-11-05 00:00:00', '263|20151|12472', null);
INSERT INTO `bitacora` VALUES ('1712', 'carga', '1', 'I', '2014-11-05 00:00:00', '263|20151|12470', null);
INSERT INTO `bitacora` VALUES ('1713', 'carga', '1', 'I', '2014-11-05 00:00:00', '263|20151|12471', null);
INSERT INTO `bitacora` VALUES ('1714', 'carga', '1', 'I', '2014-11-05 00:00:00', '263|20151|12487', null);
INSERT INTO `bitacora` VALUES ('1715', 'carga', '1', 'I', '2014-11-05 00:00:00', '263|20151|12491', null);
INSERT INTO `bitacora` VALUES ('1716', 'carga', '1', 'I', '2014-11-05 00:00:00', '263|20151|12490', null);
INSERT INTO `bitacora` VALUES ('1717', 'carga', '1', 'I', '2014-11-05 00:00:00', '263|20151|12489', null);
INSERT INTO `bitacora` VALUES ('1718', 'carga', '1', 'I', '2014-11-05 00:00:00', '264|20151|12473', null);
INSERT INTO `bitacora` VALUES ('1719', 'carga', '1', 'I', '2014-11-05 00:00:00', '264|20151|12475', null);
INSERT INTO `bitacora` VALUES ('1720', 'carga', '1', 'I', '2014-11-05 00:00:00', '264|20151|12474', null);
INSERT INTO `bitacora` VALUES ('1721', 'carga', '1', 'I', '2014-11-05 00:00:00', '264|20151|12472', null);
INSERT INTO `bitacora` VALUES ('1722', 'carga', '1', 'I', '2014-11-05 00:00:00', '264|20151|12470', null);
INSERT INTO `bitacora` VALUES ('1723', 'carga', '1', 'I', '2014-11-05 00:00:00', '264|20151|12471', null);
INSERT INTO `bitacora` VALUES ('1724', 'carga', '1', 'I', '2014-11-05 00:00:00', '264|20151|12487', null);
INSERT INTO `bitacora` VALUES ('1725', 'carga', '1', 'I', '2014-11-05 00:00:00', '264|20151|12491', null);
INSERT INTO `bitacora` VALUES ('1726', 'carga', '1', 'I', '2014-11-05 00:00:00', '264|20151|12490', null);
INSERT INTO `bitacora` VALUES ('1727', 'carga', '1', 'I', '2014-11-05 00:00:00', '264|20151|12489', null);
INSERT INTO `bitacora` VALUES ('1728', 'carga', '1', 'I', '2014-11-05 00:00:00', '266|20151|12473', null);
INSERT INTO `bitacora` VALUES ('1729', 'carga', '1', 'I', '2014-11-05 00:00:00', '266|20151|12475', null);
INSERT INTO `bitacora` VALUES ('1730', 'carga', '1', 'I', '2014-11-05 00:00:00', '266|20151|12474', null);
INSERT INTO `bitacora` VALUES ('1731', 'carga', '1', 'I', '2014-11-05 00:00:00', '266|20151|12472', null);
INSERT INTO `bitacora` VALUES ('1732', 'carga', '1', 'I', '2014-11-05 00:00:00', '266|20151|12470', null);
INSERT INTO `bitacora` VALUES ('1733', 'carga', '1', 'I', '2014-11-05 00:00:00', '266|20151|12471', null);
INSERT INTO `bitacora` VALUES ('1734', 'carga', '1', 'I', '2014-11-05 00:00:00', '266|20151|12487', null);
INSERT INTO `bitacora` VALUES ('1735', 'carga', '1', 'I', '2014-11-05 00:00:00', '266|20151|12491', null);
INSERT INTO `bitacora` VALUES ('1736', 'carga', '1', 'I', '2014-11-05 00:00:00', '266|20151|12490', null);
INSERT INTO `bitacora` VALUES ('1737', 'carga', '1', 'I', '2014-11-05 00:00:00', '266|20151|12489', null);
INSERT INTO `bitacora` VALUES ('1738', 'carga', '1', 'I', '2014-11-05 00:00:00', '271|20151|12292', null);
INSERT INTO `bitacora` VALUES ('1739', 'carga', '1', 'I', '2014-11-05 00:00:00', '271|20151|12477', null);
INSERT INTO `bitacora` VALUES ('1740', 'carga', '1', 'I', '2014-11-05 00:00:00', '271|20151|12479', null);
INSERT INTO `bitacora` VALUES ('1741', 'carga', '1', 'I', '2014-11-05 00:00:00', '271|20151|12478', null);
INSERT INTO `bitacora` VALUES ('1742', 'carga', '1', 'I', '2014-11-05 00:00:00', '271|20151|12476', null);
INSERT INTO `bitacora` VALUES ('1743', 'carga', '1', 'I', '2014-11-05 00:00:00', '271|20151|11755', null);
INSERT INTO `bitacora` VALUES ('1744', 'carga', '1', 'I', '2014-11-05 00:00:00', '271|20151|12495', null);
INSERT INTO `bitacora` VALUES ('1745', 'carga', '1', 'I', '2014-11-05 00:00:00', '271|20151|12496', null);
INSERT INTO `bitacora` VALUES ('1746', 'carga', '1', 'I', '2014-11-05 00:00:00', '271|20151|12497', null);
INSERT INTO `bitacora` VALUES ('1747', 'carga', '1', 'I', '2014-11-05 00:00:00', '271|20151|12501', null);
INSERT INTO `bitacora` VALUES ('1748', 'carga', '1', 'I', '2014-11-05 00:00:00', '272|20151|12292', null);
INSERT INTO `bitacora` VALUES ('1749', 'carga', '1', 'I', '2014-11-05 00:00:00', '272|20151|12477', null);
INSERT INTO `bitacora` VALUES ('1750', 'carga', '1', 'I', '2014-11-05 00:00:00', '272|20151|12479', null);
INSERT INTO `bitacora` VALUES ('1751', 'carga', '1', 'I', '2014-11-05 00:00:00', '272|20151|12478', null);
INSERT INTO `bitacora` VALUES ('1752', 'carga', '1', 'I', '2014-11-05 00:00:00', '272|20151|12476', null);
INSERT INTO `bitacora` VALUES ('1753', 'carga', '1', 'I', '2014-11-05 00:00:00', '272|20151|11755', null);
INSERT INTO `bitacora` VALUES ('1754', 'carga', '1', 'I', '2014-11-05 00:00:00', '272|20151|12495', null);
INSERT INTO `bitacora` VALUES ('1755', 'carga', '1', 'I', '2014-11-05 00:00:00', '272|20151|12496', null);
INSERT INTO `bitacora` VALUES ('1756', 'carga', '1', 'I', '2014-11-05 00:00:00', '272|20151|12497', null);
INSERT INTO `bitacora` VALUES ('1757', 'carga', '1', 'I', '2014-11-05 00:00:00', '272|20151|12501', null);
INSERT INTO `bitacora` VALUES ('1758', 'carga', '1', 'I', '2014-11-05 00:00:00', '275|20151|12292', null);
INSERT INTO `bitacora` VALUES ('1759', 'carga', '1', 'I', '2014-11-05 00:00:00', '275|20151|12477', null);
INSERT INTO `bitacora` VALUES ('1760', 'carga', '1', 'I', '2014-11-05 00:00:00', '275|20151|12479', null);
INSERT INTO `bitacora` VALUES ('1761', 'carga', '1', 'I', '2014-11-05 00:00:00', '275|20151|12478', null);
INSERT INTO `bitacora` VALUES ('1762', 'carga', '1', 'I', '2014-11-05 00:00:00', '275|20151|12476', null);
INSERT INTO `bitacora` VALUES ('1763', 'carga', '1', 'I', '2014-11-05 00:00:00', '275|20151|11755', null);
INSERT INTO `bitacora` VALUES ('1764', 'carga', '1', 'I', '2014-11-05 00:00:00', '275|20151|12495', null);
INSERT INTO `bitacora` VALUES ('1765', 'carga', '1', 'I', '2014-11-05 00:00:00', '275|20151|12496', null);
INSERT INTO `bitacora` VALUES ('1766', 'carga', '1', 'I', '2014-11-05 00:00:00', '275|20151|12497', null);
INSERT INTO `bitacora` VALUES ('1767', 'carga', '1', 'I', '2014-11-05 00:00:00', '275|20151|12501', null);
INSERT INTO `bitacora` VALUES ('1768', 'carga', '1', 'I', '2014-11-05 00:00:00', '273|20151|12292', null);
INSERT INTO `bitacora` VALUES ('1769', 'carga', '1', 'I', '2014-11-05 00:00:00', '273|20151|12477', null);
INSERT INTO `bitacora` VALUES ('1770', 'carga', '1', 'I', '2014-11-05 00:00:00', '273|20151|12479', null);
INSERT INTO `bitacora` VALUES ('1771', 'carga', '1', 'I', '2014-11-05 00:00:00', '273|20151|12478', null);
INSERT INTO `bitacora` VALUES ('1772', 'carga', '1', 'I', '2014-11-05 00:00:00', '273|20151|12476', null);
INSERT INTO `bitacora` VALUES ('1773', 'carga', '1', 'I', '2014-11-05 00:00:00', '273|20151|11755', null);
INSERT INTO `bitacora` VALUES ('1774', 'carga', '1', 'I', '2014-11-05 00:00:00', '273|20151|12495', null);
INSERT INTO `bitacora` VALUES ('1775', 'carga', '1', 'I', '2014-11-05 00:00:00', '273|20151|12496', null);
INSERT INTO `bitacora` VALUES ('1776', 'carga', '1', 'I', '2014-11-05 00:00:00', '273|20151|12497', null);
INSERT INTO `bitacora` VALUES ('1777', 'carga', '1', 'I', '2014-11-05 00:00:00', '273|20151|12501', null);
INSERT INTO `bitacora` VALUES ('1778', 'carga', '1', 'I', '2014-11-05 00:00:00', '274|20151|12292', null);
INSERT INTO `bitacora` VALUES ('1779', 'carga', '1', 'I', '2014-11-05 00:00:00', '274|20151|12477', null);
INSERT INTO `bitacora` VALUES ('1780', 'carga', '1', 'I', '2014-11-05 00:00:00', '274|20151|12479', null);
INSERT INTO `bitacora` VALUES ('1781', 'carga', '1', 'I', '2014-11-05 00:00:00', '274|20151|12478', null);
INSERT INTO `bitacora` VALUES ('1782', 'carga', '1', 'I', '2014-11-05 00:00:00', '274|20151|12476', null);
INSERT INTO `bitacora` VALUES ('1783', 'carga', '1', 'I', '2014-11-05 00:00:00', '274|20151|11755', null);
INSERT INTO `bitacora` VALUES ('1784', 'carga', '1', 'I', '2014-11-05 00:00:00', '274|20151|12495', null);
INSERT INTO `bitacora` VALUES ('1785', 'carga', '1', 'I', '2014-11-05 00:00:00', '274|20151|12496', null);
INSERT INTO `bitacora` VALUES ('1786', 'carga', '1', 'I', '2014-11-05 00:00:00', '274|20151|12497', null);
INSERT INTO `bitacora` VALUES ('1787', 'carga', '1', 'I', '2014-11-05 00:00:00', '274|20151|12501', null);
INSERT INTO `bitacora` VALUES ('1788', 'carga', '1', 'I', '2014-11-05 00:00:00', '276|20151|12292', null);
INSERT INTO `bitacora` VALUES ('1789', 'carga', '1', 'I', '2014-11-05 00:00:00', '276|20151|12477', null);
INSERT INTO `bitacora` VALUES ('1790', 'carga', '1', 'I', '2014-11-05 00:00:00', '276|20151|12479', null);
INSERT INTO `bitacora` VALUES ('1791', 'carga', '1', 'I', '2014-11-05 00:00:00', '276|20151|12478', null);
INSERT INTO `bitacora` VALUES ('1792', 'carga', '1', 'I', '2014-11-05 00:00:00', '276|20151|12476', null);
INSERT INTO `bitacora` VALUES ('1793', 'carga', '1', 'I', '2014-11-05 00:00:00', '276|20151|11755', null);
INSERT INTO `bitacora` VALUES ('1794', 'carga', '1', 'I', '2014-11-05 00:00:00', '276|20151|12495', null);
INSERT INTO `bitacora` VALUES ('1795', 'carga', '1', 'I', '2014-11-05 00:00:00', '276|20151|12496', null);
INSERT INTO `bitacora` VALUES ('1796', 'carga', '1', 'I', '2014-11-05 00:00:00', '276|20151|12497', null);
INSERT INTO `bitacora` VALUES ('1797', 'carga', '1', 'I', '2014-11-05 00:00:00', '276|20151|12501', null);
INSERT INTO `bitacora` VALUES ('1798', 'carga', '1', 'I', '2014-11-06 00:00:00', '281|20151|12481', null);
INSERT INTO `bitacora` VALUES ('1799', 'carga', '1', 'I', '2014-11-06 00:00:00', '281|20151|12480', null);
INSERT INTO `bitacora` VALUES ('1800', 'carga', '1', 'I', '2014-11-06 00:00:00', '281|20151|12494', null);
INSERT INTO `bitacora` VALUES ('1801', 'carga', '1', 'I', '2014-11-06 00:00:00', '281|20151|12495', null);
INSERT INTO `bitacora` VALUES ('1802', 'carga', '1', 'I', '2014-11-06 00:00:00', '281|20151|12497', null);
INSERT INTO `bitacora` VALUES ('1803', 'carga', '1', 'I', '2014-11-06 00:00:00', '281|20151|12498', null);
INSERT INTO `bitacora` VALUES ('1804', 'carga', '1', 'I', '2014-11-06 00:00:00', '281|20151|12501', null);
INSERT INTO `bitacora` VALUES ('1805', 'carga', '1', 'I', '2014-11-06 00:00:00', '281|20151|12496', null);
INSERT INTO `bitacora` VALUES ('1806', 'carga', '1', 'I', '2014-11-06 00:00:00', '281|20151|12493', null);
INSERT INTO `bitacora` VALUES ('1807', 'carga', '1', 'I', '2014-11-06 00:00:00', '281|20151|12500', null);
INSERT INTO `bitacora` VALUES ('1808', 'carga', '1', 'I', '2014-11-06 00:00:00', '282|20151|12481', null);
INSERT INTO `bitacora` VALUES ('1809', 'carga', '1', 'I', '2014-11-06 00:00:00', '282|20151|12480', null);
INSERT INTO `bitacora` VALUES ('1810', 'carga', '1', 'I', '2014-11-06 00:00:00', '282|20151|12494', null);
INSERT INTO `bitacora` VALUES ('1811', 'carga', '1', 'I', '2014-11-06 00:00:00', '282|20151|12495', null);
INSERT INTO `bitacora` VALUES ('1812', 'carga', '1', 'I', '2014-11-06 00:00:00', '282|20151|12497', null);
INSERT INTO `bitacora` VALUES ('1813', 'carga', '1', 'I', '2014-11-06 00:00:00', '282|20151|12498', null);
INSERT INTO `bitacora` VALUES ('1814', 'carga', '1', 'I', '2014-11-06 00:00:00', '282|20151|12501', null);
INSERT INTO `bitacora` VALUES ('1815', 'carga', '1', 'I', '2014-11-06 00:00:00', '282|20151|12496', null);
INSERT INTO `bitacora` VALUES ('1816', 'carga', '1', 'I', '2014-11-06 00:00:00', '282|20151|12493', null);
INSERT INTO `bitacora` VALUES ('1817', 'carga', '1', 'I', '2014-11-06 00:00:00', '282|20151|12500', null);
INSERT INTO `bitacora` VALUES ('1818', 'carga', '1', 'I', '2014-11-06 00:00:00', '285|20151|12481', null);
INSERT INTO `bitacora` VALUES ('1819', 'carga', '1', 'I', '2014-11-06 00:00:00', '285|20151|12480', null);
INSERT INTO `bitacora` VALUES ('1820', 'carga', '1', 'I', '2014-11-06 00:00:00', '285|20151|12494', null);
INSERT INTO `bitacora` VALUES ('1821', 'carga', '1', 'I', '2014-11-06 00:00:00', '285|20151|12495', null);
INSERT INTO `bitacora` VALUES ('1822', 'carga', '1', 'I', '2014-11-06 00:00:00', '285|20151|12497', null);
INSERT INTO `bitacora` VALUES ('1823', 'carga', '1', 'I', '2014-11-06 00:00:00', '285|20151|12498', null);
INSERT INTO `bitacora` VALUES ('1824', 'carga', '1', 'I', '2014-11-06 00:00:00', '285|20151|12501', null);
INSERT INTO `bitacora` VALUES ('1825', 'carga', '1', 'I', '2014-11-06 00:00:00', '285|20151|12496', null);
INSERT INTO `bitacora` VALUES ('1826', 'carga', '1', 'I', '2014-11-06 00:00:00', '285|20151|12493', null);
INSERT INTO `bitacora` VALUES ('1827', 'carga', '1', 'I', '2014-11-06 00:00:00', '285|20151|12500', null);
INSERT INTO `bitacora` VALUES ('1828', 'carga', '1', 'I', '2014-11-06 00:00:00', '283|20151|12481', null);
INSERT INTO `bitacora` VALUES ('1829', 'carga', '1', 'I', '2014-11-06 00:00:00', '283|20151|12480', null);
INSERT INTO `bitacora` VALUES ('1830', 'carga', '1', 'I', '2014-11-06 00:00:00', '283|20151|12494', null);
INSERT INTO `bitacora` VALUES ('1831', 'carga', '1', 'I', '2014-11-06 00:00:00', '283|20151|12495', null);
INSERT INTO `bitacora` VALUES ('1832', 'carga', '1', 'I', '2014-11-06 00:00:00', '283|20151|12497', null);
INSERT INTO `bitacora` VALUES ('1833', 'carga', '1', 'I', '2014-11-06 00:00:00', '283|20151|12498', null);
INSERT INTO `bitacora` VALUES ('1834', 'carga', '1', 'I', '2014-11-06 00:00:00', '283|20151|12501', null);
INSERT INTO `bitacora` VALUES ('1835', 'carga', '1', 'I', '2014-11-06 00:00:00', '283|20151|12496', null);
INSERT INTO `bitacora` VALUES ('1836', 'carga', '1', 'I', '2014-11-06 00:00:00', '283|20151|12493', null);
INSERT INTO `bitacora` VALUES ('1837', 'carga', '1', 'I', '2014-11-06 00:00:00', '283|20151|12500', null);
INSERT INTO `bitacora` VALUES ('1838', 'carga', '1', 'I', '2014-11-06 00:00:00', '284|20151|12481', null);
INSERT INTO `bitacora` VALUES ('1839', 'carga', '1', 'I', '2014-11-06 00:00:00', '284|20151|12480', null);
INSERT INTO `bitacora` VALUES ('1840', 'carga', '1', 'I', '2014-11-06 00:00:00', '284|20151|12494', null);
INSERT INTO `bitacora` VALUES ('1841', 'carga', '1', 'I', '2014-11-06 00:00:00', '284|20151|12495', null);
INSERT INTO `bitacora` VALUES ('1842', 'carga', '1', 'I', '2014-11-06 00:00:00', '284|20151|12497', null);
INSERT INTO `bitacora` VALUES ('1843', 'carga', '1', 'I', '2014-11-06 00:00:00', '284|20151|12498', null);
INSERT INTO `bitacora` VALUES ('1844', 'carga', '1', 'I', '2014-11-06 00:00:00', '284|20151|12501', null);
INSERT INTO `bitacora` VALUES ('1845', 'carga', '1', 'I', '2014-11-06 00:00:00', '284|20151|12496', null);
INSERT INTO `bitacora` VALUES ('1846', 'carga', '1', 'I', '2014-11-06 00:00:00', '284|20151|12493', null);
INSERT INTO `bitacora` VALUES ('1847', 'carga', '1', 'I', '2014-11-06 00:00:00', '284|20151|12500', null);
INSERT INTO `bitacora` VALUES ('1848', 'carga', '1', 'I', '2014-11-06 00:00:00', '286|20151|12481', null);
INSERT INTO `bitacora` VALUES ('1849', 'carga', '1', 'I', '2014-11-06 00:00:00', '286|20151|12480', null);
INSERT INTO `bitacora` VALUES ('1850', 'carga', '1', 'I', '2014-11-06 00:00:00', '286|20151|12494', null);
INSERT INTO `bitacora` VALUES ('1851', 'carga', '1', 'I', '2014-11-06 00:00:00', '286|20151|12495', null);
INSERT INTO `bitacora` VALUES ('1852', 'carga', '1', 'I', '2014-11-06 00:00:00', '286|20151|12497', null);
INSERT INTO `bitacora` VALUES ('1853', 'carga', '1', 'I', '2014-11-06 00:00:00', '286|20151|12498', null);
INSERT INTO `bitacora` VALUES ('1854', 'carga', '1', 'I', '2014-11-06 00:00:00', '286|20151|12501', null);
INSERT INTO `bitacora` VALUES ('1855', 'carga', '1', 'I', '2014-11-06 00:00:00', '286|20151|12496', null);
INSERT INTO `bitacora` VALUES ('1856', 'carga', '1', 'I', '2014-11-06 00:00:00', '286|20151|12493', null);
INSERT INTO `bitacora` VALUES ('1857', 'carga', '1', 'I', '2014-11-06 00:00:00', '286|20151|12500', null);
INSERT INTO `bitacora` VALUES ('1858', 'detalleseriacion', '1', 'I', '2014-11-07 00:00:00', '12457|2|11248|2', null);
INSERT INTO `bitacora` VALUES ('1859', 'detalleseriacion', '1', 'I', '2014-11-07 00:00:00', '12468|2|11862|2', null);
INSERT INTO `bitacora` VALUES ('1860', 'detalleseriacion', '1', 'I', '2014-11-07 00:00:00', '12481|2|12479|2', null);
INSERT INTO `bitacora` VALUES ('1861', 'detalleseriacion', '1', 'I', '2014-11-07 00:00:00', '12463|2|12457|2', null);
INSERT INTO `bitacora` VALUES ('1862', 'detalleseriacion', '1', 'I', '2014-11-07 00:00:00', '12464|2|11859|2', null);
INSERT INTO `bitacora` VALUES ('1863', 'detalleseriacion', '1', 'I', '2014-11-07 00:00:00', '12479|2|12470|2', null);
INSERT INTO `bitacora` VALUES ('1864', 'detalleseriacion', '1', 'I', '2014-11-07 00:00:00', '12470|2|12467|2', null);
INSERT INTO `bitacora` VALUES ('1865', 'detalleseriacion', '1', 'I', '2014-11-07 00:00:00', '12467|2|11733|2', null);
INSERT INTO `bitacora` VALUES ('1866', 'detalleseriacion', '1', 'I', '2014-11-07 00:00:00', '12460|2|12458|2', null);
INSERT INTO `bitacora` VALUES ('1867', 'detalleseriacion', '1', 'I', '2014-11-07 00:00:00', '12458|2|11243|2', null);
INSERT INTO `bitacora` VALUES ('1868', 'detalleseriacion', '1', 'I', '2014-11-07 00:00:00', '11243|2|11237|2', null);
INSERT INTO `bitacora` VALUES ('1869', 'grupos', '1', 'I', '2014-11-17 00:00:00', '601|20151|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('1870', 'grupos', '1', 'I', '2014-11-17 00:00:00', '602|20151|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('1871', 'grupos', '1', 'I', '2014-11-17 00:00:00', '603|20151|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('1872', 'grupos', '1', 'I', '2014-11-17 00:00:00', '604|20151|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('1873', 'grupos', '1', 'I', '2014-11-17 00:00:00', '605|20151|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('1874', 'grupos', '1', 'I', '2014-11-17 00:00:00', '606|20151|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('1875', 'grupos', '1', 'I', '2014-11-17 00:00:00', '607|20151|20092|2|3', null);
INSERT INTO `bitacora` VALUES ('1876', 'grupos', '1', 'I', '2014-11-17 00:00:00', '608|20151|20092|2|3', null);
INSERT INTO `bitacora` VALUES ('1877', 'grupos', '1', 'I', '2014-11-17 00:00:00', '611|20151|20092|2|2', null);
INSERT INTO `bitacora` VALUES ('1878', 'grupos', '1', 'I', '2014-11-17 00:00:00', '612|20151|20092|2|2', null);
INSERT INTO `bitacora` VALUES ('1879', 'grupos', '1', 'I', '2014-11-17 00:00:00', '613|20151|20092|2|2', null);
INSERT INTO `bitacora` VALUES ('1880', 'grupos', '1', 'I', '2014-11-17 00:00:00', '614|20151|20092|2|2', null);
INSERT INTO `bitacora` VALUES ('1881', 'grupos', '1', 'I', '2014-11-17 00:00:00', '615|20151|20092|2|2', null);
INSERT INTO `bitacora` VALUES ('1882', 'grupos', '1', 'I', '2014-11-17 00:00:00', '616|20151|20092|2|2', null);
INSERT INTO `bitacora` VALUES ('1883', 'grupos', '1', 'I', '2014-11-17 00:00:00', '621|20151|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('1884', 'grupos', '1', 'I', '2014-11-17 00:00:00', '622|20151|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('1885', 'grupos', '1', 'I', '2014-11-17 00:00:00', '623|20151|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('1886', 'grupos', '1', 'I', '2014-11-17 00:00:00', '624|20151|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('1887', 'grupos', '1', 'I', '2014-11-17 00:00:00', '625|20151|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('1888', 'grupos', '1', 'I', '2014-11-17 00:00:00', '626|20151|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('1889', 'grupos', '1', 'I', '2014-11-17 00:00:00', '627|20151|20092|2|3', null);
INSERT INTO `bitacora` VALUES ('1890', 'grupos', '1', 'I', '2014-11-17 00:00:00', '628|20151|20092|2|3', null);
INSERT INTO `bitacora` VALUES ('1891', 'grupos', '1', 'I', '2014-11-17 00:00:00', '629|20151|20092|2|3', null);
INSERT INTO `bitacora` VALUES ('1892', 'grupos', '1', 'I', '2014-11-17 00:00:00', '630|20151|20092|2|3', null);
INSERT INTO `bitacora` VALUES ('1893', 'grupos', '1', 'I', '2014-11-17 00:00:00', '631|20151|20092|2|2', null);
INSERT INTO `bitacora` VALUES ('1894', 'grupos', '1', 'I', '2014-11-17 00:00:00', '632|20151|20092|2|2', null);
INSERT INTO `bitacora` VALUES ('1895', 'grupos', '1', 'I', '2014-11-17 00:00:00', '633|20151|20092|2|2', null);
INSERT INTO `bitacora` VALUES ('1896', 'grupos', '1', 'I', '2014-11-17 00:00:00', '634|20151|20092|2|2', null);
INSERT INTO `bitacora` VALUES ('1897', 'grupos', '1', 'I', '2014-11-17 00:00:00', '635|20151|20092|2|2', null);
INSERT INTO `bitacora` VALUES ('1898', 'grupos', '1', 'I', '2014-11-17 00:00:00', '636|20151|20092|2|2', null);
INSERT INTO `bitacora` VALUES ('1899', 'grupos', '1', 'U', '2014-11-17 00:00:00', '601|20151|20092|6|1', '601|20151|20092|2|1');
INSERT INTO `bitacora` VALUES ('1900', 'grupos', '1', 'U', '2014-11-17 00:00:00', '602|20151|20092|6|1', '602|20151|20092|2|1');
INSERT INTO `bitacora` VALUES ('1901', 'grupos', '1', 'U', '2014-11-17 00:00:00', '603|20151|20092|6|1', '603|20151|20092|2|1');
INSERT INTO `bitacora` VALUES ('1902', 'grupos', '1', 'U', '2014-11-17 00:00:00', '604|20151|20092|6|1', '604|20151|20092|2|1');
INSERT INTO `bitacora` VALUES ('1903', 'grupos', '1', 'U', '2014-11-17 00:00:00', '605|20151|20092|6|1', '605|20151|20092|2|1');
INSERT INTO `bitacora` VALUES ('1904', 'grupos', '1', 'U', '2014-11-17 00:00:00', '606|20151|20092|6|1', '606|20151|20092|2|1');
INSERT INTO `bitacora` VALUES ('1905', 'grupos', '1', 'U', '2014-11-17 00:00:00', '607|20151|20092|6|3', '607|20151|20092|2|3');
INSERT INTO `bitacora` VALUES ('1906', 'grupos', '1', 'U', '2014-11-17 00:00:00', '608|20151|20092|6|3', '608|20151|20092|2|3');
INSERT INTO `bitacora` VALUES ('1907', 'grupos', '1', 'U', '2014-11-17 00:00:00', '611|20151|20092|6|2', '611|20151|20092|2|2');
INSERT INTO `bitacora` VALUES ('1908', 'grupos', '1', 'U', '2014-11-17 00:00:00', '612|20151|20092|6|2', '612|20151|20092|2|2');
INSERT INTO `bitacora` VALUES ('1909', 'grupos', '1', 'U', '2014-11-17 00:00:00', '613|20151|20092|6|2', '613|20151|20092|2|2');
INSERT INTO `bitacora` VALUES ('1910', 'grupos', '1', 'U', '2014-11-17 00:00:00', '614|20151|20092|6|2', '614|20151|20092|2|2');
INSERT INTO `bitacora` VALUES ('1911', 'grupos', '1', 'U', '2014-11-17 00:00:00', '615|20151|20092|6|2', '615|20151|20092|2|2');
INSERT INTO `bitacora` VALUES ('1912', 'grupos', '1', 'U', '2014-11-17 00:00:00', '616|20151|20092|6|2', '616|20151|20092|2|2');
INSERT INTO `bitacora` VALUES ('1913', 'grupos', '1', 'U', '2014-11-17 00:00:00', '621|20151|20092|6|1', '621|20151|20092|2|1');
INSERT INTO `bitacora` VALUES ('1914', 'grupos', '1', 'U', '2014-11-17 00:00:00', '622|20151|20092|6|1', '622|20151|20092|2|1');
INSERT INTO `bitacora` VALUES ('1915', 'grupos', '1', 'U', '2014-11-17 00:00:00', '623|20151|20092|6|1', '623|20151|20092|2|1');
INSERT INTO `bitacora` VALUES ('1916', 'grupos', '1', 'U', '2014-11-17 00:00:00', '624|20151|20092|6|1', '624|20151|20092|2|1');
INSERT INTO `bitacora` VALUES ('1917', 'grupos', '1', 'U', '2014-11-17 00:00:00', '625|20151|20092|6|1', '625|20151|20092|2|1');
INSERT INTO `bitacora` VALUES ('1918', 'grupos', '1', 'U', '2014-11-17 00:00:00', '626|20151|20092|6|1', '626|20151|20092|2|1');
INSERT INTO `bitacora` VALUES ('1919', 'grupos', '1', 'U', '2014-11-17 00:00:00', '627|20151|20092|6|3', '627|20151|20092|2|3');
INSERT INTO `bitacora` VALUES ('1920', 'grupos', '1', 'U', '2014-11-17 00:00:00', '628|20151|20092|6|3', '628|20151|20092|2|3');
INSERT INTO `bitacora` VALUES ('1921', 'grupos', '1', 'U', '2014-11-17 00:00:00', '629|20151|20092|6|3', '629|20151|20092|2|3');
INSERT INTO `bitacora` VALUES ('1922', 'grupos', '1', 'U', '2014-11-17 00:00:00', '630|20151|20092|6|3', '630|20151|20092|2|3');
INSERT INTO `bitacora` VALUES ('1923', 'grupos', '1', 'U', '2014-11-17 00:00:00', '631|20151|20092|6|2', '631|20151|20092|2|2');
INSERT INTO `bitacora` VALUES ('1924', 'grupos', '1', 'U', '2014-11-17 00:00:00', '632|20151|20092|6|2', '632|20151|20092|2|2');
INSERT INTO `bitacora` VALUES ('1925', 'grupos', '1', 'U', '2014-11-17 00:00:00', '633|20151|20092|6|2', '633|20151|20092|2|2');
INSERT INTO `bitacora` VALUES ('1926', 'grupos', '1', 'U', '2014-11-17 00:00:00', '634|20151|20092|6|2', '634|20151|20092|2|2');
INSERT INTO `bitacora` VALUES ('1927', 'grupos', '1', 'U', '2014-11-17 00:00:00', '635|20151|20092|6|2', '635|20151|20092|2|2');
INSERT INTO `bitacora` VALUES ('1928', 'grupos', '1', 'U', '2014-11-17 00:00:00', '636|20151|20092|6|2', '636|20151|20092|2|2');
INSERT INTO `bitacora` VALUES ('1929', 'carga', '1', 'I', '2014-11-17 00:00:00', '601|20151|11238|6|11238|1', null);
INSERT INTO `bitacora` VALUES ('1930', 'carga', '1', 'I', '2014-11-17 00:00:00', '601|20151|11239|6|11239|1', null);
INSERT INTO `bitacora` VALUES ('1931', 'carga', '1', 'I', '2014-11-17 00:00:00', '601|20151|11240|6|11240|1', null);
INSERT INTO `bitacora` VALUES ('1932', 'carga', '1', 'I', '2014-11-17 00:00:00', '601|20151|11236|6|11236|1', null);
INSERT INTO `bitacora` VALUES ('1933', 'carga', '1', 'I', '2014-11-17 00:00:00', '601|20151|11237|6|11237|1', null);
INSERT INTO `bitacora` VALUES ('1934', 'carga', '1', 'I', '2014-11-17 00:00:00', '601|20151|11241|6|11241|1', null);
INSERT INTO `bitacora` VALUES ('1935', 'carga', '1', 'I', '2014-11-17 00:00:00', '602|20151|11238|6|11238|1', null);
INSERT INTO `bitacora` VALUES ('1936', 'carga', '1', 'I', '2014-11-17 00:00:00', '602|20151|11239|6|11239|1', null);
INSERT INTO `bitacora` VALUES ('1937', 'carga', '1', 'I', '2014-11-17 00:00:00', '602|20151|11240|6|11240|1', null);
INSERT INTO `bitacora` VALUES ('1938', 'carga', '1', 'I', '2014-11-17 00:00:00', '602|20151|11236|6|11236|1', null);
INSERT INTO `bitacora` VALUES ('1939', 'carga', '1', 'I', '2014-11-17 00:00:00', '602|20151|11237|6|11237|1', null);
INSERT INTO `bitacora` VALUES ('1940', 'carga', '1', 'I', '2014-11-17 00:00:00', '602|20151|11241|6|11241|1', null);
INSERT INTO `bitacora` VALUES ('1941', 'carga', '1', 'I', '2014-11-17 00:00:00', '603|20151|11238|6|11238|1', null);
INSERT INTO `bitacora` VALUES ('1942', 'carga', '1', 'I', '2014-11-17 00:00:00', '603|20151|11239|6|11239|1', null);
INSERT INTO `bitacora` VALUES ('1943', 'carga', '1', 'I', '2014-11-17 00:00:00', '603|20151|11240|6|11240|1', null);
INSERT INTO `bitacora` VALUES ('1944', 'carga', '1', 'I', '2014-11-17 00:00:00', '603|20151|11236|6|11236|1', null);
INSERT INTO `bitacora` VALUES ('1945', 'carga', '1', 'I', '2014-11-17 00:00:00', '603|20151|11237|6|11237|1', null);
INSERT INTO `bitacora` VALUES ('1946', 'carga', '1', 'I', '2014-11-17 00:00:00', '603|20151|11241|6|11241|1', null);
INSERT INTO `bitacora` VALUES ('1947', 'carga', '1', 'I', '2014-11-17 00:00:00', '604|20151|11238|6|11238|1', null);
INSERT INTO `bitacora` VALUES ('1948', 'carga', '1', 'I', '2014-11-17 00:00:00', '604|20151|11239|6|11239|1', null);
INSERT INTO `bitacora` VALUES ('1949', 'carga', '1', 'I', '2014-11-17 00:00:00', '604|20151|11240|6|11240|1', null);
INSERT INTO `bitacora` VALUES ('1950', 'carga', '1', 'I', '2014-11-17 00:00:00', '604|20151|11236|6|11236|1', null);
INSERT INTO `bitacora` VALUES ('1951', 'carga', '1', 'I', '2014-11-17 00:00:00', '604|20151|11237|6|11237|1', null);
INSERT INTO `bitacora` VALUES ('1952', 'carga', '1', 'I', '2014-11-17 00:00:00', '604|20151|11241|6|11241|1', null);
INSERT INTO `bitacora` VALUES ('1953', 'carga', '1', 'I', '2014-11-17 00:00:00', '605|20151|11238|6|11238|1', null);
INSERT INTO `bitacora` VALUES ('1954', 'carga', '1', 'I', '2014-11-17 00:00:00', '605|20151|11239|6|11239|1', null);
INSERT INTO `bitacora` VALUES ('1955', 'carga', '1', 'I', '2014-11-17 00:00:00', '605|20151|11240|6|11240|1', null);
INSERT INTO `bitacora` VALUES ('1956', 'carga', '1', 'I', '2014-11-17 00:00:00', '605|20151|11236|6|11236|1', null);
INSERT INTO `bitacora` VALUES ('1957', 'carga', '1', 'I', '2014-11-17 00:00:00', '605|20151|11237|6|11237|1', null);
INSERT INTO `bitacora` VALUES ('1958', 'carga', '1', 'I', '2014-11-17 00:00:00', '605|20151|11241|6|11241|1', null);
INSERT INTO `bitacora` VALUES ('1959', 'carga', '1', 'I', '2014-11-17 00:00:00', '606|20151|11238|6|11238|1', null);
INSERT INTO `bitacora` VALUES ('1960', 'carga', '1', 'I', '2014-11-17 00:00:00', '606|20151|11239|6|11239|1', null);
INSERT INTO `bitacora` VALUES ('1961', 'carga', '1', 'I', '2014-11-17 00:00:00', '606|20151|11240|6|11240|1', null);
INSERT INTO `bitacora` VALUES ('1962', 'carga', '1', 'I', '2014-11-17 00:00:00', '606|20151|11236|6|11236|1', null);
INSERT INTO `bitacora` VALUES ('1963', 'carga', '1', 'I', '2014-11-17 00:00:00', '606|20151|11237|6|11237|1', null);
INSERT INTO `bitacora` VALUES ('1964', 'carga', '1', 'I', '2014-11-17 00:00:00', '606|20151|11241|6|11241|1', null);
INSERT INTO `bitacora` VALUES ('1965', 'carga', '1', 'I', '2014-11-17 00:00:00', '607|20151|11238|6|11238|1', null);
INSERT INTO `bitacora` VALUES ('1966', 'carga', '1', 'I', '2014-11-17 00:00:00', '607|20151|11239|6|11239|1', null);
INSERT INTO `bitacora` VALUES ('1967', 'carga', '1', 'I', '2014-11-17 00:00:00', '607|20151|11240|6|11240|1', null);
INSERT INTO `bitacora` VALUES ('1968', 'carga', '1', 'I', '2014-11-17 00:00:00', '607|20151|11236|6|11236|1', null);
INSERT INTO `bitacora` VALUES ('1969', 'carga', '1', 'I', '2014-11-17 00:00:00', '607|20151|11237|6|11237|1', null);
INSERT INTO `bitacora` VALUES ('1970', 'carga', '1', 'I', '2014-11-17 00:00:00', '607|20151|11241|6|11241|1', null);
INSERT INTO `bitacora` VALUES ('1971', 'carga', '1', 'I', '2014-11-17 00:00:00', '608|20151|11238|6|11238|1', null);
INSERT INTO `bitacora` VALUES ('1972', 'carga', '1', 'I', '2014-11-17 00:00:00', '608|20151|11239|6|11239|1', null);
INSERT INTO `bitacora` VALUES ('1973', 'carga', '1', 'I', '2014-11-17 00:00:00', '608|20151|11240|6|11240|1', null);
INSERT INTO `bitacora` VALUES ('1974', 'carga', '1', 'I', '2014-11-17 00:00:00', '608|20151|11236|6|11236|1', null);
INSERT INTO `bitacora` VALUES ('1975', 'carga', '1', 'I', '2014-11-17 00:00:00', '608|20151|11237|6|11237|1', null);
INSERT INTO `bitacora` VALUES ('1976', 'carga', '1', 'I', '2014-11-17 00:00:00', '608|20151|11241|6|11241|1', null);
INSERT INTO `bitacora` VALUES ('1977', 'carga', '1', 'I', '2014-11-17 00:00:00', '611|20151|11238|6|11238|1', null);
INSERT INTO `bitacora` VALUES ('1978', 'carga', '1', 'I', '2014-11-17 00:00:00', '611|20151|11239|6|11239|1', null);
INSERT INTO `bitacora` VALUES ('1979', 'carga', '1', 'I', '2014-11-17 00:00:00', '611|20151|11240|6|11240|1', null);
INSERT INTO `bitacora` VALUES ('1980', 'carga', '1', 'I', '2014-11-17 00:00:00', '611|20151|11236|6|11236|1', null);
INSERT INTO `bitacora` VALUES ('1981', 'carga', '1', 'I', '2014-11-17 00:00:00', '611|20151|11237|6|11237|1', null);
INSERT INTO `bitacora` VALUES ('1982', 'carga', '1', 'I', '2014-11-17 00:00:00', '611|20151|11241|6|11241|1', null);
INSERT INTO `bitacora` VALUES ('1983', 'carga', '1', 'I', '2014-11-17 00:00:00', '612|20151|11238|6|11238|1', null);
INSERT INTO `bitacora` VALUES ('1984', 'carga', '1', 'I', '2014-11-17 00:00:00', '612|20151|11239|6|11239|1', null);
INSERT INTO `bitacora` VALUES ('1985', 'carga', '1', 'I', '2014-11-17 00:00:00', '612|20151|11240|6|11240|1', null);
INSERT INTO `bitacora` VALUES ('1986', 'carga', '1', 'I', '2014-11-17 00:00:00', '612|20151|11236|6|11236|1', null);
INSERT INTO `bitacora` VALUES ('1987', 'carga', '1', 'I', '2014-11-17 00:00:00', '612|20151|11237|6|11237|1', null);
INSERT INTO `bitacora` VALUES ('1988', 'carga', '1', 'I', '2014-11-17 00:00:00', '612|20151|11241|6|11241|1', null);
INSERT INTO `bitacora` VALUES ('1989', 'carga', '1', 'I', '2014-11-17 00:00:00', '613|20151|11238|6|11238|1', null);
INSERT INTO `bitacora` VALUES ('1990', 'carga', '1', 'I', '2014-11-17 00:00:00', '613|20151|11239|6|11239|1', null);
INSERT INTO `bitacora` VALUES ('1991', 'carga', '1', 'I', '2014-11-17 00:00:00', '613|20151|11240|6|11240|1', null);
INSERT INTO `bitacora` VALUES ('1992', 'carga', '1', 'I', '2014-11-17 00:00:00', '613|20151|11236|6|11236|1', null);
INSERT INTO `bitacora` VALUES ('1993', 'carga', '1', 'I', '2014-11-17 00:00:00', '613|20151|11237|6|11237|1', null);
INSERT INTO `bitacora` VALUES ('1994', 'carga', '1', 'I', '2014-11-17 00:00:00', '613|20151|11241|6|11241|1', null);
INSERT INTO `bitacora` VALUES ('1995', 'carga', '1', 'I', '2014-11-17 00:00:00', '614|20151|11238|6|11238|1', null);
INSERT INTO `bitacora` VALUES ('1996', 'carga', '1', 'I', '2014-11-17 00:00:00', '614|20151|11239|6|11239|1', null);
INSERT INTO `bitacora` VALUES ('1997', 'carga', '1', 'I', '2014-11-17 00:00:00', '614|20151|11240|6|11240|1', null);
INSERT INTO `bitacora` VALUES ('1998', 'carga', '1', 'I', '2014-11-17 00:00:00', '614|20151|11236|6|11236|1', null);
INSERT INTO `bitacora` VALUES ('1999', 'carga', '1', 'I', '2014-11-17 00:00:00', '614|20151|11237|6|11237|1', null);
INSERT INTO `bitacora` VALUES ('2000', 'carga', '1', 'I', '2014-11-17 00:00:00', '614|20151|11241|6|11241|1', null);
INSERT INTO `bitacora` VALUES ('2001', 'carga', '1', 'I', '2014-11-17 00:00:00', '615|20151|11238|6|11238|1', null);
INSERT INTO `bitacora` VALUES ('2002', 'carga', '1', 'I', '2014-11-17 00:00:00', '615|20151|11239|6|11239|1', null);
INSERT INTO `bitacora` VALUES ('2003', 'carga', '1', 'I', '2014-11-17 00:00:00', '615|20151|11240|6|11240|1', null);
INSERT INTO `bitacora` VALUES ('2004', 'carga', '1', 'I', '2014-11-17 00:00:00', '615|20151|11236|6|11236|1', null);
INSERT INTO `bitacora` VALUES ('2005', 'carga', '1', 'I', '2014-11-17 00:00:00', '615|20151|11237|6|11237|1', null);
INSERT INTO `bitacora` VALUES ('2006', 'carga', '1', 'I', '2014-11-17 00:00:00', '615|20151|11241|6|11241|1', null);
INSERT INTO `bitacora` VALUES ('2007', 'carga', '1', 'I', '2014-11-17 00:00:00', '616|20151|11238|6|11238|1', null);
INSERT INTO `bitacora` VALUES ('2008', 'carga', '1', 'I', '2014-11-17 00:00:00', '616|20151|11239|6|11239|1', null);
INSERT INTO `bitacora` VALUES ('2009', 'carga', '1', 'I', '2014-11-17 00:00:00', '616|20151|11240|6|11240|1', null);
INSERT INTO `bitacora` VALUES ('2010', 'carga', '1', 'I', '2014-11-17 00:00:00', '616|20151|11236|6|11236|1', null);
INSERT INTO `bitacora` VALUES ('2011', 'carga', '1', 'I', '2014-11-17 00:00:00', '616|20151|11237|6|11237|1', null);
INSERT INTO `bitacora` VALUES ('2012', 'carga', '1', 'I', '2014-11-17 00:00:00', '616|20151|11241|6|11241|1', null);
INSERT INTO `bitacora` VALUES ('2013', 'carga', '1', 'I', '2014-11-17 00:00:00', '621|20151|11245|6|11245|2', null);
INSERT INTO `bitacora` VALUES ('2014', 'carga', '1', 'I', '2014-11-17 00:00:00', '621|20151|11248|6|11248|2', null);
INSERT INTO `bitacora` VALUES ('2015', 'carga', '1', 'I', '2014-11-17 00:00:00', '621|20151|11247|6|11247|2', null);
INSERT INTO `bitacora` VALUES ('2016', 'carga', '1', 'I', '2014-11-17 00:00:00', '621|20151|11246|6|11246|2', null);
INSERT INTO `bitacora` VALUES ('2017', 'carga', '1', 'I', '2014-11-17 00:00:00', '621|20151|11243|6|11243|2', null);
INSERT INTO `bitacora` VALUES ('2018', 'carga', '1', 'I', '2014-11-17 00:00:00', '621|20151|11249|6|11249|2', null);
INSERT INTO `bitacora` VALUES ('2019', 'carga', '1', 'I', '2014-11-17 00:00:00', '621|20151|11244|6|11244|2', null);
INSERT INTO `bitacora` VALUES ('2020', 'carga', '1', 'I', '2014-11-17 00:00:00', '622|20151|11245|6|11245|2', null);
INSERT INTO `bitacora` VALUES ('2021', 'carga', '1', 'I', '2014-11-17 00:00:00', '622|20151|11248|6|11248|2', null);
INSERT INTO `bitacora` VALUES ('2022', 'carga', '1', 'I', '2014-11-17 00:00:00', '622|20151|11247|6|11247|2', null);
INSERT INTO `bitacora` VALUES ('2023', 'carga', '1', 'I', '2014-11-17 00:00:00', '622|20151|11246|6|11246|2', null);
INSERT INTO `bitacora` VALUES ('2024', 'carga', '1', 'I', '2014-11-17 00:00:00', '622|20151|11243|6|11243|2', null);
INSERT INTO `bitacora` VALUES ('2025', 'carga', '1', 'I', '2014-11-17 00:00:00', '622|20151|11249|6|11249|2', null);
INSERT INTO `bitacora` VALUES ('2026', 'carga', '1', 'I', '2014-11-17 00:00:00', '622|20151|11244|6|11244|2', null);
INSERT INTO `bitacora` VALUES ('2027', 'carga', '1', 'I', '2014-11-17 00:00:00', '623|20151|11245|6|11245|2', null);
INSERT INTO `bitacora` VALUES ('2028', 'carga', '1', 'I', '2014-11-17 00:00:00', '623|20151|11248|6|11248|2', null);
INSERT INTO `bitacora` VALUES ('2029', 'carga', '1', 'I', '2014-11-17 00:00:00', '623|20151|11247|6|11247|2', null);
INSERT INTO `bitacora` VALUES ('2030', 'carga', '1', 'I', '2014-11-17 00:00:00', '623|20151|11246|6|11246|2', null);
INSERT INTO `bitacora` VALUES ('2031', 'carga', '1', 'I', '2014-11-17 00:00:00', '623|20151|11243|6|11243|2', null);
INSERT INTO `bitacora` VALUES ('2032', 'carga', '1', 'I', '2014-11-17 00:00:00', '623|20151|11249|6|11249|2', null);
INSERT INTO `bitacora` VALUES ('2033', 'carga', '1', 'I', '2014-11-17 00:00:00', '623|20151|11244|6|11244|2', null);
INSERT INTO `bitacora` VALUES ('2034', 'carga', '1', 'I', '2014-11-17 00:00:00', '624|20151|11245|6|11245|2', null);
INSERT INTO `bitacora` VALUES ('2035', 'carga', '1', 'I', '2014-11-17 00:00:00', '624|20151|11248|6|11248|2', null);
INSERT INTO `bitacora` VALUES ('2036', 'carga', '1', 'I', '2014-11-17 00:00:00', '624|20151|11247|6|11247|2', null);
INSERT INTO `bitacora` VALUES ('2037', 'carga', '1', 'I', '2014-11-17 00:00:00', '624|20151|11246|6|11246|2', null);
INSERT INTO `bitacora` VALUES ('2038', 'carga', '1', 'I', '2014-11-17 00:00:00', '624|20151|11243|6|11243|2', null);
INSERT INTO `bitacora` VALUES ('2039', 'carga', '1', 'I', '2014-11-17 00:00:00', '624|20151|11249|6|11249|2', null);
INSERT INTO `bitacora` VALUES ('2040', 'carga', '1', 'I', '2014-11-17 00:00:00', '624|20151|11244|6|11244|2', null);
INSERT INTO `bitacora` VALUES ('2041', 'carga', '1', 'I', '2014-11-17 00:00:00', '625|20151|11245|6|11245|2', null);
INSERT INTO `bitacora` VALUES ('2042', 'carga', '1', 'I', '2014-11-17 00:00:00', '625|20151|11248|6|11248|2', null);
INSERT INTO `bitacora` VALUES ('2043', 'carga', '1', 'I', '2014-11-17 00:00:00', '625|20151|11247|6|11247|2', null);
INSERT INTO `bitacora` VALUES ('2044', 'carga', '1', 'I', '2014-11-17 00:00:00', '625|20151|11246|6|11246|2', null);
INSERT INTO `bitacora` VALUES ('2045', 'carga', '1', 'I', '2014-11-17 00:00:00', '625|20151|11243|6|11243|2', null);
INSERT INTO `bitacora` VALUES ('2046', 'carga', '1', 'I', '2014-11-17 00:00:00', '625|20151|11249|6|11249|2', null);
INSERT INTO `bitacora` VALUES ('2047', 'carga', '1', 'I', '2014-11-17 00:00:00', '625|20151|11244|6|11244|2', null);
INSERT INTO `bitacora` VALUES ('2048', 'carga', '1', 'I', '2014-11-17 00:00:00', '626|20151|11245|6|11245|2', null);
INSERT INTO `bitacora` VALUES ('2049', 'carga', '1', 'I', '2014-11-17 00:00:00', '626|20151|11248|6|11248|2', null);
INSERT INTO `bitacora` VALUES ('2050', 'carga', '1', 'I', '2014-11-17 00:00:00', '626|20151|11247|6|11247|2', null);
INSERT INTO `bitacora` VALUES ('2051', 'carga', '1', 'I', '2014-11-17 00:00:00', '626|20151|11246|6|11246|2', null);
INSERT INTO `bitacora` VALUES ('2052', 'carga', '1', 'I', '2014-11-17 00:00:00', '626|20151|11243|6|11243|2', null);
INSERT INTO `bitacora` VALUES ('2053', 'carga', '1', 'I', '2014-11-17 00:00:00', '626|20151|11249|6|11249|2', null);
INSERT INTO `bitacora` VALUES ('2054', 'carga', '1', 'I', '2014-11-17 00:00:00', '626|20151|11244|6|11244|2', null);
INSERT INTO `bitacora` VALUES ('2055', 'carga', '1', 'I', '2014-11-17 00:00:00', '627|20151|11245|6|11245|2', null);
INSERT INTO `bitacora` VALUES ('2056', 'carga', '1', 'I', '2014-11-17 00:00:00', '627|20151|11248|6|11248|2', null);
INSERT INTO `bitacora` VALUES ('2057', 'carga', '1', 'I', '2014-11-17 00:00:00', '627|20151|11247|6|11247|2', null);
INSERT INTO `bitacora` VALUES ('2058', 'carga', '1', 'I', '2014-11-17 00:00:00', '627|20151|11246|6|11246|2', null);
INSERT INTO `bitacora` VALUES ('2059', 'carga', '1', 'I', '2014-11-17 00:00:00', '627|20151|11243|6|11243|2', null);
INSERT INTO `bitacora` VALUES ('2060', 'carga', '1', 'I', '2014-11-17 00:00:00', '627|20151|11249|6|11249|2', null);
INSERT INTO `bitacora` VALUES ('2061', 'carga', '1', 'I', '2014-11-17 00:00:00', '627|20151|11244|6|11244|2', null);
INSERT INTO `bitacora` VALUES ('2062', 'carga', '1', 'I', '2014-11-17 00:00:00', '628|20151|11245|6|11245|2', null);
INSERT INTO `bitacora` VALUES ('2063', 'carga', '1', 'I', '2014-11-17 00:00:00', '628|20151|11248|6|11248|2', null);
INSERT INTO `bitacora` VALUES ('2064', 'carga', '1', 'I', '2014-11-17 00:00:00', '628|20151|11247|6|11247|2', null);
INSERT INTO `bitacora` VALUES ('2065', 'carga', '1', 'I', '2014-11-17 00:00:00', '628|20151|11246|6|11246|2', null);
INSERT INTO `bitacora` VALUES ('2066', 'carga', '1', 'I', '2014-11-17 00:00:00', '628|20151|11243|6|11243|2', null);
INSERT INTO `bitacora` VALUES ('2067', 'carga', '1', 'I', '2014-11-17 00:00:00', '628|20151|11249|6|11249|2', null);
INSERT INTO `bitacora` VALUES ('2068', 'carga', '1', 'I', '2014-11-17 00:00:00', '628|20151|11244|6|11244|2', null);
INSERT INTO `bitacora` VALUES ('2069', 'carga', '1', 'I', '2014-11-17 00:00:00', '629|20151|11245|6|11245|2', null);
INSERT INTO `bitacora` VALUES ('2070', 'carga', '1', 'I', '2014-11-17 00:00:00', '629|20151|11248|6|11248|2', null);
INSERT INTO `bitacora` VALUES ('2071', 'carga', '1', 'I', '2014-11-17 00:00:00', '629|20151|11247|6|11247|2', null);
INSERT INTO `bitacora` VALUES ('2072', 'carga', '1', 'I', '2014-11-17 00:00:00', '629|20151|11246|6|11246|2', null);
INSERT INTO `bitacora` VALUES ('2073', 'carga', '1', 'I', '2014-11-17 00:00:00', '629|20151|11243|6|11243|2', null);
INSERT INTO `bitacora` VALUES ('2074', 'carga', '1', 'I', '2014-11-17 00:00:00', '629|20151|11249|6|11249|2', null);
INSERT INTO `bitacora` VALUES ('2075', 'carga', '1', 'I', '2014-11-17 00:00:00', '629|20151|11244|6|11244|2', null);
INSERT INTO `bitacora` VALUES ('2076', 'carga', '1', 'I', '2014-11-17 00:00:00', '630|20151|11245|6|11245|2', null);
INSERT INTO `bitacora` VALUES ('2077', 'carga', '1', 'I', '2014-11-17 00:00:00', '630|20151|11248|6|11248|2', null);
INSERT INTO `bitacora` VALUES ('2078', 'carga', '1', 'I', '2014-11-17 00:00:00', '630|20151|11247|6|11247|2', null);
INSERT INTO `bitacora` VALUES ('2079', 'carga', '1', 'I', '2014-11-17 00:00:00', '630|20151|11246|6|11246|2', null);
INSERT INTO `bitacora` VALUES ('2080', 'carga', '1', 'I', '2014-11-17 00:00:00', '630|20151|11243|6|11243|2', null);
INSERT INTO `bitacora` VALUES ('2081', 'carga', '1', 'I', '2014-11-17 00:00:00', '630|20151|11249|6|11249|2', null);
INSERT INTO `bitacora` VALUES ('2082', 'carga', '1', 'I', '2014-11-17 00:00:00', '630|20151|11244|6|11244|2', null);
INSERT INTO `bitacora` VALUES ('2083', 'carga', '1', 'I', '2014-11-17 00:00:00', '631|20151|11245|6|11245|2', null);
INSERT INTO `bitacora` VALUES ('2084', 'carga', '1', 'I', '2014-11-17 00:00:00', '631|20151|11248|6|11248|2', null);
INSERT INTO `bitacora` VALUES ('2085', 'carga', '1', 'I', '2014-11-17 00:00:00', '631|20151|11247|6|11247|2', null);
INSERT INTO `bitacora` VALUES ('2086', 'carga', '1', 'I', '2014-11-17 00:00:00', '631|20151|11246|6|11246|2', null);
INSERT INTO `bitacora` VALUES ('2087', 'carga', '1', 'I', '2014-11-17 00:00:00', '631|20151|11243|6|11243|2', null);
INSERT INTO `bitacora` VALUES ('2088', 'carga', '1', 'I', '2014-11-17 00:00:00', '631|20151|11249|6|11249|2', null);
INSERT INTO `bitacora` VALUES ('2089', 'carga', '1', 'I', '2014-11-17 00:00:00', '631|20151|11244|6|11244|2', null);
INSERT INTO `bitacora` VALUES ('2090', 'carga', '1', 'I', '2014-11-17 00:00:00', '632|20151|11245|6|11245|2', null);
INSERT INTO `bitacora` VALUES ('2091', 'carga', '1', 'I', '2014-11-17 00:00:00', '632|20151|11248|6|11248|2', null);
INSERT INTO `bitacora` VALUES ('2092', 'carga', '1', 'I', '2014-11-17 00:00:00', '632|20151|11247|6|11247|2', null);
INSERT INTO `bitacora` VALUES ('2093', 'carga', '1', 'I', '2014-11-17 00:00:00', '632|20151|11246|6|11246|2', null);
INSERT INTO `bitacora` VALUES ('2094', 'carga', '1', 'I', '2014-11-17 00:00:00', '632|20151|11243|6|11243|2', null);
INSERT INTO `bitacora` VALUES ('2095', 'carga', '1', 'I', '2014-11-17 00:00:00', '632|20151|11249|6|11249|2', null);
INSERT INTO `bitacora` VALUES ('2096', 'carga', '1', 'I', '2014-11-17 00:00:00', '632|20151|11244|6|11244|2', null);
INSERT INTO `bitacora` VALUES ('2097', 'carga', '1', 'I', '2014-11-17 00:00:00', '633|20151|11245|6|11245|2', null);
INSERT INTO `bitacora` VALUES ('2098', 'carga', '1', 'I', '2014-11-17 00:00:00', '633|20151|11248|6|11248|2', null);
INSERT INTO `bitacora` VALUES ('2099', 'carga', '1', 'I', '2014-11-17 00:00:00', '633|20151|11247|6|11247|2', null);
INSERT INTO `bitacora` VALUES ('2100', 'carga', '1', 'I', '2014-11-17 00:00:00', '633|20151|11246|6|11246|2', null);
INSERT INTO `bitacora` VALUES ('2101', 'carga', '1', 'I', '2014-11-17 00:00:00', '633|20151|11243|6|11243|2', null);
INSERT INTO `bitacora` VALUES ('2102', 'carga', '1', 'I', '2014-11-17 00:00:00', '633|20151|11249|6|11249|2', null);
INSERT INTO `bitacora` VALUES ('2103', 'carga', '1', 'I', '2014-11-17 00:00:00', '633|20151|11244|6|11244|2', null);
INSERT INTO `bitacora` VALUES ('2104', 'carga', '1', 'I', '2014-11-17 00:00:00', '634|20151|11245|6|11245|2', null);
INSERT INTO `bitacora` VALUES ('2105', 'carga', '1', 'I', '2014-11-17 00:00:00', '634|20151|11248|6|11248|2', null);
INSERT INTO `bitacora` VALUES ('2106', 'carga', '1', 'I', '2014-11-17 00:00:00', '634|20151|11247|6|11247|2', null);
INSERT INTO `bitacora` VALUES ('2107', 'carga', '1', 'I', '2014-11-17 00:00:00', '634|20151|11246|6|11246|2', null);
INSERT INTO `bitacora` VALUES ('2108', 'carga', '1', 'I', '2014-11-17 00:00:00', '634|20151|11243|6|11243|2', null);
INSERT INTO `bitacora` VALUES ('2109', 'carga', '1', 'I', '2014-11-17 00:00:00', '634|20151|11249|6|11249|2', null);
INSERT INTO `bitacora` VALUES ('2110', 'carga', '1', 'I', '2014-11-17 00:00:00', '634|20151|11244|6|11244|2', null);
INSERT INTO `bitacora` VALUES ('2111', 'carga', '1', 'I', '2014-11-17 00:00:00', '635|20151|11245|6|11245|2', null);
INSERT INTO `bitacora` VALUES ('2112', 'carga', '1', 'I', '2014-11-17 00:00:00', '635|20151|11248|6|11248|2', null);
INSERT INTO `bitacora` VALUES ('2113', 'carga', '1', 'I', '2014-11-17 00:00:00', '635|20151|11247|6|11247|2', null);
INSERT INTO `bitacora` VALUES ('2114', 'carga', '1', 'I', '2014-11-17 00:00:00', '635|20151|11246|6|11246|2', null);
INSERT INTO `bitacora` VALUES ('2115', 'carga', '1', 'I', '2014-11-17 00:00:00', '635|20151|11243|6|11243|2', null);
INSERT INTO `bitacora` VALUES ('2116', 'carga', '1', 'I', '2014-11-17 00:00:00', '635|20151|11249|6|11249|2', null);
INSERT INTO `bitacora` VALUES ('2117', 'carga', '1', 'I', '2014-11-17 00:00:00', '635|20151|11244|6|11244|2', null);
INSERT INTO `bitacora` VALUES ('2118', 'carga', '1', 'I', '2014-11-17 00:00:00', '636|20151|11245|6|11245|2', null);
INSERT INTO `bitacora` VALUES ('2119', 'carga', '1', 'I', '2014-11-17 00:00:00', '636|20151|11248|6|11248|2', null);
INSERT INTO `bitacora` VALUES ('2120', 'carga', '1', 'I', '2014-11-17 00:00:00', '636|20151|11247|6|11247|2', null);
INSERT INTO `bitacora` VALUES ('2121', 'carga', '1', 'I', '2014-11-17 00:00:00', '636|20151|11246|6|11246|2', null);
INSERT INTO `bitacora` VALUES ('2122', 'carga', '1', 'I', '2014-11-17 00:00:00', '636|20151|11243|6|11243|2', null);
INSERT INTO `bitacora` VALUES ('2123', 'carga', '1', 'I', '2014-11-17 00:00:00', '636|20151|11249|6|11249|2', null);
INSERT INTO `bitacora` VALUES ('2124', 'carga', '1', 'I', '2014-11-17 00:00:00', '636|20151|11244|6|11244|2', null);
INSERT INTO `bitacora` VALUES ('2125', 'detalleseriacion', '1', 'D', '2014-11-21 00:00:00', null, '12457|2|11248|2');
INSERT INTO `bitacora` VALUES ('2126', 'detalleseriacion', '1', 'D', '2014-11-21 00:00:00', null, '12468|2|11862|2');
INSERT INTO `bitacora` VALUES ('2127', 'detalleseriacion', '1', 'D', '2014-11-21 00:00:00', null, '12481|2|12479|2');
INSERT INTO `bitacora` VALUES ('2128', 'detalleseriacion', '1', 'D', '2014-11-21 00:00:00', null, '12463|2|12457|2');
INSERT INTO `bitacora` VALUES ('2129', 'detalleseriacion', '1', 'D', '2014-11-21 00:00:00', null, '12464|2|11859|2');
INSERT INTO `bitacora` VALUES ('2130', 'detalleseriacion', '1', 'D', '2014-11-21 00:00:00', null, '12479|2|12470|2');
INSERT INTO `bitacora` VALUES ('2131', 'detalleseriacion', '1', 'D', '2014-11-21 00:00:00', null, '12470|2|12467|2');
INSERT INTO `bitacora` VALUES ('2132', 'detalleseriacion', '1', 'D', '2014-11-21 00:00:00', null, '12467|2|11733|2');
INSERT INTO `bitacora` VALUES ('2133', 'detalleseriacion', '1', 'D', '2014-11-21 00:00:00', null, '12460|2|12458|2');
INSERT INTO `bitacora` VALUES ('2134', 'detalleseriacion', '1', 'D', '2014-11-21 00:00:00', null, '12458|2|11243|2');
INSERT INTO `bitacora` VALUES ('2135', 'detalleseriacion', '1', 'D', '2014-11-21 00:00:00', null, '11243|2|11237|2');
INSERT INTO `bitacora` VALUES ('2136', 'detalleseriacion', '1', 'I', '2014-11-22 00:00:00', '12457|2|11248|2', null);
INSERT INTO `bitacora` VALUES ('2137', 'detalleseriacion', '1', 'I', '2014-11-22 00:00:00', '12468|2|11862|2', null);
INSERT INTO `bitacora` VALUES ('2138', 'detalleseriacion', '1', 'I', '2014-11-22 00:00:00', '12481|2|12479|2', null);
INSERT INTO `bitacora` VALUES ('2139', 'detalleseriacion', '1', 'I', '2014-11-22 00:00:00', '12463|2|12457|2', null);
INSERT INTO `bitacora` VALUES ('2140', 'detalleseriacion', '1', 'I', '2014-11-22 00:00:00', '12464|2|11859|2', null);
INSERT INTO `bitacora` VALUES ('2141', 'detalleseriacion', '1', 'I', '2014-11-22 00:00:00', '12479|2|12470|2', null);
INSERT INTO `bitacora` VALUES ('2142', 'detalleseriacion', '1', 'I', '2014-11-22 00:00:00', '12470|2|12467|2', null);
INSERT INTO `bitacora` VALUES ('2143', 'detalleseriacion', '1', 'I', '2014-11-22 00:00:00', '12467|2|11733|2', null);
INSERT INTO `bitacora` VALUES ('2144', 'detalleseriacion', '1', 'I', '2014-11-22 00:00:00', '12460|2|12458|2', null);
INSERT INTO `bitacora` VALUES ('2145', 'detalleseriacion', '1', 'I', '2014-11-22 00:00:00', '12458|2|11243|2', null);
INSERT INTO `bitacora` VALUES ('2146', 'detalleseriacion', '1', 'I', '2014-11-22 00:00:00', '11243|2|11237|2', null);
INSERT INTO `bitacora` VALUES ('2147', 'detalleseriacion', '1', 'I', '2014-11-22 00:00:00', '12457|2|11843|1', null);
INSERT INTO `bitacora` VALUES ('2148', 'detalleseriacion', '1', 'I', '2014-11-22 00:00:00', '12479|2|11236|1', null);
INSERT INTO `bitacora` VALUES ('2149', 'detalleseriacion', '1', 'I', '2014-11-22 00:00:00', '12479|2|11248|1', null);
INSERT INTO `bitacora` VALUES ('2150', 'puesto', '1', 'I', '2014-12-08 00:00:00', '5|GERENTE GENERAL', null);
INSERT INTO `bitacora` VALUES ('2151', 'empresa_adic', '1', 'I', '2014-12-08 00:00:00', '1|LABOPAT', null);
INSERT INTO `bitacora` VALUES ('2152', 'trabadicional_emp', '1', 'I', '2014-12-08 00:00:00', '18|1|5', null);
INSERT INTO `bitacora` VALUES ('2153', 'trabadicional_emp', '1', 'U', '2014-12-09 00:00:00', '18|1|2005-12-01|5', '18|1|5');
INSERT INTO `bitacora` VALUES ('2154', 'trabadicional_emp', '1', 'U', '2014-12-09 00:00:00', '18|1|2003-12-01|5', '18|1|2005-12-01|5');
INSERT INTO `bitacora` VALUES ('2156', 'tipo_curso_emp', '1', 'I', '2014-12-10 00:00:00', '1|RECIBIDO', null);
INSERT INTO `bitacora` VALUES ('2157', 'tipo_curso_emp', '1', 'I', '2014-12-10 00:00:00', '2|IMPARTIDO', null);
INSERT INTO `bitacora` VALUES ('2158', 'tipo_curso_emp', '1', 'I', '2014-12-10 00:00:00', '3|DE INTERES', null);
INSERT INTO `bitacora` VALUES ('2159', 'caracteristica_cur', '1', 'I', '2014-12-10 00:00:00', '1|CURSO', null);
INSERT INTO `bitacora` VALUES ('2160', 'caracteristica_cur', '1', 'I', '2014-12-10 00:00:00', '2|CONGRESO', null);
INSERT INTO `bitacora` VALUES ('2161', 'caracteristica_cur', '1', 'I', '2014-12-10 00:00:00', '3|TALLER', null);
INSERT INTO `bitacora` VALUES ('2162', 'act_profesional_adic', '1', 'I', '2014-12-10 00:00:00', '10|1|ELABORACION DE MATERIAL DIDACTICO DIGITAL UTI|2014-07-21|25', null);
INSERT INTO `bitacora` VALUES ('2163', 'act_profesional_adic', '1', 'U', '2014-12-10 00:00:00', '10|1|ELABORACION DE MATERIAL DIDACTICO DIGITAL UTILIZANDO LAS HERRAMIENTAS DE POWER POINT Y \"PREZI\"|2014-07-21|25', '10|1|ELABORACION DE MATERIAL DIDACTICO DIGITAL UTI|2014-07-21|25');
INSERT INTO `bitacora` VALUES ('2164', 'act_profesional_adic', '1', 'I', '2014-12-10 00:00:00', '10|2|GOOGLE SITES|2014-06-11|2', null);
INSERT INTO `bitacora` VALUES ('2165', 'act_profesional_adic', '1', 'I', '2014-12-10 00:00:00', '10|3|JAVA SCRIPT|2014-06-10|3', null);
INSERT INTO `bitacora` VALUES ('2166', 'act_profesional_adic', '1', 'I', '2014-12-10 00:00:00', '10|4|CONTPAQI: CONTABILIDAD ELECTRONICA Y EL TIMBRADO DE LA NOMINA|2014-06-10|3', null);
INSERT INTO `bitacora` VALUES ('2167', 'act_profesional_adic', '1', 'I', '2014-12-10 00:00:00', '10|5|DESARROLLO DE APPS PARA IOS|2014-06-09|1', null);
INSERT INTO `bitacora` VALUES ('2168', 'act_profesional_adic', '1', 'I', '2014-12-10 00:00:00', '10|6|UML Y DISENO DE SISTEMAS|2014-03-24|0', null);
INSERT INTO `bitacora` VALUES ('2169', 'act_profesional_adic', '1', 'I', '2014-12-10 00:00:00', '0|7|HERRAMIENTAS DIDACTICAS PARA LA DOCENCIA|2013-04-14|4', null);
INSERT INTO `bitacora` VALUES ('2170', 'act_profesional_adic', '1', 'I', '2014-12-10 00:00:00', '10|8|PRIMERA PARTE: PROYECT MANAGEMENT|2013-04-22|5', null);
INSERT INTO `bitacora` VALUES ('2171', 'act_profesional_adic', '1', 'I', '2014-12-10 00:00:00', '10|9|TALLER DE HERRAMIENTAS DE EVOLUCION EN BLACKBOARD|2013-06-04|25', null);
INSERT INTO `bitacora` VALUES ('2172', 'act_profesional_adic', '1', 'I', '2014-12-10 00:00:00', '10|10|DOCENCIA POYADA EN TECNOLOGIAS DE INF., COMUNICACION Y COLABORACION I (INTERMEDIO)|2013-06-10|25', null);
INSERT INTO `bitacora` VALUES ('2173', 'act_adicional_emp', '1', 'I', '2014-12-10 00:00:00', '1|1|18|1|1', null);
INSERT INTO `bitacora` VALUES ('2175', 'act_adicional_emp', '1', 'I', '2014-12-10 00:00:00', '1|2|18|2|1', null);
INSERT INTO `bitacora` VALUES ('2176', 'act_adicional_emp', '1', 'I', '2014-12-10 00:00:00', '1|3|18|3|1', null);
INSERT INTO `bitacora` VALUES ('2177', 'act_adicional_emp', '1', 'I', '2014-12-10 00:00:00', '1|4|18|4|1', null);
INSERT INTO `bitacora` VALUES ('2178', 'act_adicional_emp', '1', 'I', '2014-12-10 00:00:00', '1|5|18|5|1', null);
INSERT INTO `bitacora` VALUES ('2179', 'act_adicional_emp', '1', 'I', '2014-12-10 00:00:00', '1|6|18|6|1', null);
INSERT INTO `bitacora` VALUES ('2180', 'act_adicional_emp', '1', 'I', '2014-12-10 00:00:00', '1|7|18|7|1', null);
INSERT INTO `bitacora` VALUES ('2181', 'act_adicional_emp', '1', 'I', '2014-12-10 00:00:00', '1|8|18|8|1', null);
INSERT INTO `bitacora` VALUES ('2182', 'act_adicional_emp', '1', 'I', '2014-12-10 00:00:00', '1|9|18|9|1', null);
INSERT INTO `bitacora` VALUES ('2183', 'act_adicional_emp', '1', 'I', '2014-12-10 00:00:00', '1|10|18|10|1', null);
INSERT INTO `bitacora` VALUES ('2184', 'act_adicional_emp', '1', 'U', '2014-12-10 00:00:00', '1|6|18|6|2', '1|6|18|6|1');
INSERT INTO `bitacora` VALUES ('2185', 'universidades_emp', '1', 'I', '2014-12-10 00:00:00', '1|UNIVERSIDAD AUTONOMA DE BAJA CALIFORNIA|16', null);
INSERT INTO `bitacora` VALUES ('2186', 'universidades_emp', '18', 'I', '2014-12-10 00:00:00', '2|INSTITUTO TECNOLOGICO DE TIJUANA|16', null);
INSERT INTO `bitacora` VALUES ('2187', 'carreras_emp', '1', 'I', '2014-12-10 00:00:00', '1|LICENCIADO EN INFORMATICA', null);
INSERT INTO `bitacora` VALUES ('2188', 'carreras_emp', '1', 'I', '2014-12-10 00:00:00', '2|LICENCIADO EN CONTADURIA', null);
INSERT INTO `bitacora` VALUES ('2189', 'carreras_emp', '18', 'I', '2014-12-10 00:00:00', '3|LICENCIADO EN NEGOCIOS INTERNACIONALES', null);
INSERT INTO `bitacora` VALUES ('2190', 'carreras_emp', '18', 'I', '2014-12-10 00:00:00', '4|LICENCIADO EN ADMINISTRACION DE EMPRESAS', null);
INSERT INTO `bitacora` VALUES ('2191', 'carga', '18', 'I', '2014-12-10 00:00:00', '1|8000054|18|1997-04-30|1|1|1', null);
INSERT INTO `bitacora` VALUES ('2192', 'carreras_emp', '1', 'I', '2014-12-10 00:00:00', '5|INGENIERO EN SISTEMAS', null);
INSERT INTO `bitacora` VALUES ('2193', 'carga', '1', 'I', '2014-12-10 00:00:00', '5|1|1|1|2', null);
INSERT INTO `bitacora` VALUES ('2194', 'carga', '1', 'I', '2014-12-10 00:00:00', '5|9|1|1|2', null);
INSERT INTO `bitacora` VALUES ('2195', 'carga', '1', 'I', '2014-12-10 00:00:00', '5|10|1|1|2', null);
INSERT INTO `bitacora` VALUES ('2196', 'carga', '1', 'I', '2014-12-10 00:00:00', '5|11|1|1|2', null);
INSERT INTO `bitacora` VALUES ('2197', 'carga', '1', 'I', '2014-12-10 00:00:00', '5|17|1|2|2', null);
INSERT INTO `bitacora` VALUES ('2198', 'universidades_emp', '1', 'U', '2014-12-11 00:00:00', '1|UNIVERSIDAD AUTONOMA DE BAJA CALIFORNIA|16', '1|UNIVERSIDAD AUTONOMA DE BAJA CALIFORNIA|16');
INSERT INTO `bitacora` VALUES ('2199', 'universidades_emp', '18', 'U', '2014-12-11 00:00:00', '2|INSTITUTO TECNOLOGICO DE TIJUANA|16', '2|INSTITUTO TECNOLOGICO DE TIJUANA|16');
INSERT INTO `bitacora` VALUES ('2200', 'act_profesional_adic', '1', 'U', '2014-12-11 00:00:00', '0|7|HERRAMIENTAS DIDACTICAS PARA LA DOCENCIA|2013-04-14|5', '0|7|HERRAMIENTAS DIDACTICAS PARA LA DOCENCIA|2013-04-14|4');
INSERT INTO `bitacora` VALUES ('2201', 'act_profesional_adic', '1', 'U', '2014-12-11 00:00:00', '10|2|GOOGLE SITES|2014-06-11|3', '10|2|GOOGLE SITES|2014-06-11|2');
INSERT INTO `bitacora` VALUES ('2202', 'act_profesional_adic', '1', 'U', '2014-12-11 00:00:00', '10|2|GOOGLE SITES|2014-06-11|2.50', '10|2|GOOGLE SITES|2014-06-11|3.00');
INSERT INTO `bitacora` VALUES ('2203', 'carreras_emp', '9', 'I', '2014-12-15 00:00:00', '6|MAESTRIA EN TECNOLOGIAS DE LA INFORMACION Y LA COMUNICACION', null);
INSERT INTO `bitacora` VALUES ('2204', 'carga', '1', 'I', '2014-12-15 00:00:00', '6|9|2|1|1', null);
INSERT INTO `bitacora` VALUES ('2205', 'carga', '9', 'I', '2014-12-15 00:00:00', '6|17|2|1|1', null);
INSERT INTO `bitacora` VALUES ('2206', 'act_adicional_emp', '1', 'U', '2014-12-16 00:00:00', '3|1|18|1|1', '1|1|18|1|1');
INSERT INTO `bitacora` VALUES ('2207', 'act_adicional_emp', '1', 'U', '2014-12-16 00:00:00', '1|1|18|1|1', '3|1|18|1|1');
INSERT INTO `bitacora` VALUES ('2208', 'act_adicional_emp', '1', 'D', '2014-12-16 00:00:00', null, '1|1|18|1|1');
INSERT INTO `bitacora` VALUES ('2209', 'act_adicional_emp', '1', 'D', '2014-12-16 00:00:00', null, '1|2|18|2|1');
INSERT INTO `bitacora` VALUES ('2210', 'act_adicional_emp', '1', 'D', '2014-12-16 00:00:00', null, '1|3|18|3|1');
INSERT INTO `bitacora` VALUES ('2211', 'act_adicional_emp', '1', 'D', '2014-12-16 00:00:00', null, '1|4|18|4|1');
INSERT INTO `bitacora` VALUES ('2212', 'act_adicional_emp', '1', 'D', '2014-12-16 00:00:00', null, '1|5|18|5|1');
INSERT INTO `bitacora` VALUES ('2213', 'act_adicional_emp', '1', 'D', '2014-12-16 00:00:00', null, '1|6|18|6|2');
INSERT INTO `bitacora` VALUES ('2214', 'act_adicional_emp', '1', 'D', '2014-12-16 00:00:00', null, '1|7|18|7|1');
INSERT INTO `bitacora` VALUES ('2215', 'act_adicional_emp', '1', 'D', '2014-12-16 00:00:00', null, '1|8|18|8|1');
INSERT INTO `bitacora` VALUES ('2216', 'act_adicional_emp', '1', 'D', '2014-12-16 00:00:00', null, '1|9|18|9|1');
INSERT INTO `bitacora` VALUES ('2217', 'act_adicional_emp', '1', 'D', '2014-12-16 00:00:00', null, '1|10|18|10|1');
INSERT INTO `bitacora` VALUES ('2218', 'act_profesional_adic', '1', 'U', '2014-12-16 00:00:00', '10|1|ELABORACION DE MATERIAL DIDACTICO DIGITAL UTILIZANDO LAS HERRAMIENTAS DE POWER POINT Y \"PREZI\"|2014-07-21|25.00', '10|1|ELABORACION DE MATERIAL DIDACTICO DIGITAL UTILIZANDO LAS HERRAMIENTAS DE POWER POINT Y \"PREZI\"|2014-07-21|25.00');
INSERT INTO `bitacora` VALUES ('2219', 'act_profesional_adic', '1', 'U', '2014-12-16 00:00:00', '10|2|GOOGLE SITES|2014-06-11|2.50', '10|2|GOOGLE SITES|2014-06-11|2.50');
INSERT INTO `bitacora` VALUES ('2220', 'act_profesional_adic', '1', 'U', '2014-12-16 00:00:00', '10|3|JAVA SCRIPT|2014-06-10|3.00', '10|3|JAVA SCRIPT|2014-06-10|3.00');
INSERT INTO `bitacora` VALUES ('2221', 'act_profesional_adic', '1', 'U', '2014-12-16 00:00:00', '10|1|ELABORACION DE MATERIAL DIDACTICO DIGITAL UTILIZANDO LAS HERRAMIENTAS DE POWER POINT Y \"PREZI\"|2014-07-21|25.00', '10|1|ELABORACION DE MATERIAL DIDACTICO DIGITAL UTILIZANDO LAS HERRAMIENTAS DE POWER POINT Y \"PREZI\"|2014-07-21|25.00');
INSERT INTO `bitacora` VALUES ('2222', 'act_profesional_adic', '1', 'U', '2014-12-16 00:00:00', '10|2|GOOGLE SITES|2014-06-11|2.50', '10|2|GOOGLE SITES|2014-06-11|2.50');
INSERT INTO `bitacora` VALUES ('2223', 'act_profesional_adic', '1', 'U', '2014-12-16 00:00:00', '10|3|JAVA SCRIPT|2014-06-10|3.00', '10|3|JAVA SCRIPT|2014-06-10|3.00');
INSERT INTO `bitacora` VALUES ('2224', 'act_profesional_adic', '1', 'U', '2014-12-16 00:00:00', '10|4|CONTPAQI: CONTABILIDAD ELECTRONICA Y EL TIMBRADO DE LA NOMINA|2014-06-10|3.00', '10|4|CONTPAQI: CONTABILIDAD ELECTRONICA Y EL TIMBRADO DE LA NOMINA|2014-06-10|3.00');
INSERT INTO `bitacora` VALUES ('2225', 'act_profesional_adic', '1', 'U', '2014-12-16 00:00:00', '10|5|DESARROLLO DE APPS PARA IOS|2014-06-09|1.00', '10|5|DESARROLLO DE APPS PARA IOS|2014-06-09|1.00');
INSERT INTO `bitacora` VALUES ('2226', 'act_profesional_adic', '1', 'U', '2014-12-16 00:00:00', '10|6|UML Y DISENO DE SISTEMAS|2014-03-24|0.00', '10|6|UML Y DISENO DE SISTEMAS|2014-03-24|0.00');
INSERT INTO `bitacora` VALUES ('2227', 'act_profesional_adic', '1', 'U', '2014-12-16 00:00:00', '0|7|HERRAMIENTAS DIDACTICAS PARA LA DOCENCIA|2013-04-14|5.00', '0|7|HERRAMIENTAS DIDACTICAS PARA LA DOCENCIA|2013-04-14|5.00');
INSERT INTO `bitacora` VALUES ('2228', 'act_profesional_adic', '1', 'U', '2014-12-16 00:00:00', '10|8|PRIMERA PARTE: PROYECT MANAGEMENT|2013-04-22|5.00', '10|8|PRIMERA PARTE: PROYECT MANAGEMENT|2013-04-22|5.00');
INSERT INTO `bitacora` VALUES ('2229', 'act_profesional_adic', '1', 'U', '2014-12-16 00:00:00', '10|9|TALLER DE HERRAMIENTAS DE EVOLUCION EN BLACKBOARD|2013-06-04|25.00', '10|9|TALLER DE HERRAMIENTAS DE EVOLUCION EN BLACKBOARD|2013-06-04|25.00');
INSERT INTO `bitacora` VALUES ('2230', 'act_profesional_adic', '1', 'U', '2014-12-16 00:00:00', '10|10|DOCENCIA POYADA EN TECNOLOGIAS DE INF., COMUNICACION Y COLABORACION I (INTERMEDIO)|2013-06-10|25.00', '10|10|DOCENCIA POYADA EN TECNOLOGIAS DE INF., COMUNICACION Y COLABORACION I (INTERMEDIO)|2013-06-10|25.00');
INSERT INTO `bitacora` VALUES ('2231', 'act_adicional_emp', '1', 'I', '2014-12-16 00:00:00', '0|1|18|1|1', null);
INSERT INTO `bitacora` VALUES ('2232', 'act_adicional_emp', '1', 'I', '2014-12-16 00:00:00', '0|2|18|2|1', null);
INSERT INTO `bitacora` VALUES ('2233', 'act_adicional_emp', '1', 'I', '2014-12-16 00:00:00', '0|3|18|3|1', null);
INSERT INTO `bitacora` VALUES ('2234', 'act_adicional_emp', '1', 'I', '2014-12-16 00:00:00', '0|4|18|4|1', null);
INSERT INTO `bitacora` VALUES ('2235', 'act_adicional_emp', '1', 'I', '2014-12-16 00:00:00', '0|5|18|5|1', null);
INSERT INTO `bitacora` VALUES ('2236', 'act_adicional_emp', '1', 'I', '2014-12-16 00:00:00', '0|6|18|6|2', null);
INSERT INTO `bitacora` VALUES ('2237', 'act_adicional_emp', '1', 'I', '2014-12-16 00:00:00', '0|7|18|7|1', null);
INSERT INTO `bitacora` VALUES ('2238', 'act_adicional_emp', '1', 'I', '2014-12-16 00:00:00', '0|8|18|8|1', null);
INSERT INTO `bitacora` VALUES ('2239', 'act_adicional_emp', '1', 'I', '2014-12-16 00:00:00', '0|9|18|9|1', null);
INSERT INTO `bitacora` VALUES ('2240', 'act_adicional_emp', '1', 'I', '2014-12-16 00:00:00', '0|10|18|10|1', null);
INSERT INTO `bitacora` VALUES ('2241', 'act_profesional_adic', '1', 'U', '2014-12-16 00:00:00', '10|2|GOOGLE SITES|2014-06-11|2.30', '10|2|GOOGLE SITES|2014-06-11|2.50');
INSERT INTO `bitacora` VALUES ('2242', 'act_profesional_adic', '1', 'U', '2014-12-16 00:00:00', '10|5|DESARROLLO DE APPS PARA IOS|2014-06-09|2.30', '10|5|DESARROLLO DE APPS PARA IOS|2014-06-09|1.00');
INSERT INTO `bitacora` VALUES ('2243', 'act_profesional_adic', '1', 'U', '2014-12-16 00:00:00', '10|5|DESARROLLO DE APPS PARA IOS|2014-06-09|1.30', '10|5|DESARROLLO DE APPS PARA IOS|2014-06-09|2.30');
INSERT INTO `bitacora` VALUES ('2244', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|11761|2', '2|11761|2');
INSERT INTO `bitacora` VALUES ('2245', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12482|3', '2|12482|3');
INSERT INTO `bitacora` VALUES ('2246', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12483|1', '2|12483|1');
INSERT INTO `bitacora` VALUES ('2247', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12484|1', '2|12484|1');
INSERT INTO `bitacora` VALUES ('2248', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12485|1', '2|12485|1');
INSERT INTO `bitacora` VALUES ('2249', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12486|1', '2|12486|1');
INSERT INTO `bitacora` VALUES ('2250', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12487|2', '2|12487|2');
INSERT INTO `bitacora` VALUES ('2251', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12488|2', '2|12488|2');
INSERT INTO `bitacora` VALUES ('2252', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12489|2', '2|12489|2');
INSERT INTO `bitacora` VALUES ('2253', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12490|2', '2|12490|2');
INSERT INTO `bitacora` VALUES ('2254', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12491|2', '2|12491|2');
INSERT INTO `bitacora` VALUES ('2255', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12492|2', '2|12492|2');
INSERT INTO `bitacora` VALUES ('2256', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12493|3', '2|12493|3');
INSERT INTO `bitacora` VALUES ('2257', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12494|3', '2|12494|3');
INSERT INTO `bitacora` VALUES ('2258', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12495|3', '2|12495|3');
INSERT INTO `bitacora` VALUES ('2259', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12496|3', '2|12496|3');
INSERT INTO `bitacora` VALUES ('2260', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12497|3', '2|12497|3');
INSERT INTO `bitacora` VALUES ('2261', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12498|3', '2|12498|3');
INSERT INTO `bitacora` VALUES ('2262', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12499|3', '2|12499|3');
INSERT INTO `bitacora` VALUES ('2263', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12500|3', '2|12500|3');
INSERT INTO `bitacora` VALUES ('2264', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12501|3', '2|12501|3');
INSERT INTO `bitacora` VALUES ('2265', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12492|2', '5|12492|2');
INSERT INTO `bitacora` VALUES ('2266', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12581|2', '5|12581|2');
INSERT INTO `bitacora` VALUES ('2267', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12582|2', '5|12582|2');
INSERT INTO `bitacora` VALUES ('2268', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12583|2', '5|12583|2');
INSERT INTO `bitacora` VALUES ('2269', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12584|2', '5|12584|2');
INSERT INTO `bitacora` VALUES ('2270', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12585|2', '5|12585|2');
INSERT INTO `bitacora` VALUES ('2271', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12586|3', '5|12586|3');
INSERT INTO `bitacora` VALUES ('2272', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12587|3', '5|12587|3');
INSERT INTO `bitacora` VALUES ('2273', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12588|3', '5|12588|3');
INSERT INTO `bitacora` VALUES ('2274', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12589|3', '5|12589|3');
INSERT INTO `bitacora` VALUES ('2275', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12590|3', '5|12590|3');
INSERT INTO `bitacora` VALUES ('2276', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12591|3', '5|12591|3');
INSERT INTO `bitacora` VALUES ('2277', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12592|3', '5|12592|3');
INSERT INTO `bitacora` VALUES ('2278', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12593|3', '5|12593|3');
INSERT INTO `bitacora` VALUES ('2279', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12594|3', '5|12594|3');
INSERT INTO `bitacora` VALUES ('2280', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '6|11236|1', '6|11236|1');
INSERT INTO `bitacora` VALUES ('2281', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '6|11237|1', '6|11237|1');
INSERT INTO `bitacora` VALUES ('2282', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '6|11238|1', '6|11238|1');
INSERT INTO `bitacora` VALUES ('2283', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '6|11239|1', '6|11239|1');
INSERT INTO `bitacora` VALUES ('2284', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '6|11240|1', '6|11240|1');
INSERT INTO `bitacora` VALUES ('2285', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '6|11241|1', '6|11241|1');
INSERT INTO `bitacora` VALUES ('2286', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '6|11242|1', '6|11242|1');
INSERT INTO `bitacora` VALUES ('2287', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '6|11243|1', '6|11243|1');
INSERT INTO `bitacora` VALUES ('2288', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '6|11244|1', '6|11244|1');
INSERT INTO `bitacora` VALUES ('2289', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '6|11245|1', '6|11245|1');
INSERT INTO `bitacora` VALUES ('2290', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '6|11246|1', '6|11246|1');
INSERT INTO `bitacora` VALUES ('2291', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '6|11247|1', '6|11247|1');
INSERT INTO `bitacora` VALUES ('2292', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '6|11248|1', '6|11248|1');
INSERT INTO `bitacora` VALUES ('2293', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '6|11249|1', '6|11249|1');
INSERT INTO `bitacora` VALUES ('2294', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|11733|1', '2|11733|1');
INSERT INTO `bitacora` VALUES ('2295', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|11733|1', '5|11733|1');
INSERT INTO `bitacora` VALUES ('2296', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|11734|1', '2|11734|1');
INSERT INTO `bitacora` VALUES ('2297', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|11734|1', '5|11734|1');
INSERT INTO `bitacora` VALUES ('2298', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|11737|2', '5|11737|2');
INSERT INTO `bitacora` VALUES ('2299', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|11755|3', '2|11755|3');
INSERT INTO `bitacora` VALUES ('2300', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|11755|3', '5|11755|3');
INSERT INTO `bitacora` VALUES ('2301', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|11761|2', '2|11761|2');
INSERT INTO `bitacora` VALUES ('2302', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|11843|1', '2|11843|1');
INSERT INTO `bitacora` VALUES ('2303', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|11843|1', '5|11843|1');
INSERT INTO `bitacora` VALUES ('2304', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|11859|1', '2|11859|1');
INSERT INTO `bitacora` VALUES ('2305', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|11862|2', '2|11862|2');
INSERT INTO `bitacora` VALUES ('2306', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12292|3', '2|12292|3');
INSERT INTO `bitacora` VALUES ('2307', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12456|1', '2|12456|1');
INSERT INTO `bitacora` VALUES ('2308', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12457|1', '2|12457|1');
INSERT INTO `bitacora` VALUES ('2309', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12457|1', '5|12457|1');
INSERT INTO `bitacora` VALUES ('2310', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12458|1', '2|12458|1');
INSERT INTO `bitacora` VALUES ('2311', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12458|1', '5|12458|1');
INSERT INTO `bitacora` VALUES ('2312', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12459|1', '2|12459|1');
INSERT INTO `bitacora` VALUES ('2313', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12459|1', '5|12459|1');
INSERT INTO `bitacora` VALUES ('2314', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12460|2', '2|12460|2');
INSERT INTO `bitacora` VALUES ('2315', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12461|2', '2|12461|2');
INSERT INTO `bitacora` VALUES ('2316', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12462|2', '2|12462|2');
INSERT INTO `bitacora` VALUES ('2317', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12463|2', '2|12463|2');
INSERT INTO `bitacora` VALUES ('2318', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12464|2', '2|12464|2');
INSERT INTO `bitacora` VALUES ('2319', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12465|2', '2|12465|2');
INSERT INTO `bitacora` VALUES ('2320', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12466|2', '2|12466|2');
INSERT INTO `bitacora` VALUES ('2321', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12467|2', '2|12467|2');
INSERT INTO `bitacora` VALUES ('2322', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12467|2', '5|12467|2');
INSERT INTO `bitacora` VALUES ('2323', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12468|2', '2|12468|2');
INSERT INTO `bitacora` VALUES ('2324', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12469|2', '2|12469|2');
INSERT INTO `bitacora` VALUES ('2325', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12470|2', '2|12470|2');
INSERT INTO `bitacora` VALUES ('2326', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12470|2', '5|12470|2');
INSERT INTO `bitacora` VALUES ('2327', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12471|2', '2|12471|2');
INSERT INTO `bitacora` VALUES ('2328', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12472|2', '2|12472|2');
INSERT INTO `bitacora` VALUES ('2329', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12472|2', '5|12472|2');
INSERT INTO `bitacora` VALUES ('2330', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12473|2', '2|12473|2');
INSERT INTO `bitacora` VALUES ('2331', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12474|2', '2|12474|2');
INSERT INTO `bitacora` VALUES ('2332', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12475|2', '2|12475|2');
INSERT INTO `bitacora` VALUES ('2333', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12476|3', '2|12476|3');
INSERT INTO `bitacora` VALUES ('2334', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12477|3', '2|12477|3');
INSERT INTO `bitacora` VALUES ('2335', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12478|3', '2|12478|3');
INSERT INTO `bitacora` VALUES ('2336', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12479|2', '2|12479|2');
INSERT INTO `bitacora` VALUES ('2337', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12479|2', '5|12479|2');
INSERT INTO `bitacora` VALUES ('2338', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12480|3', '2|12480|3');
INSERT INTO `bitacora` VALUES ('2339', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12481|3', '2|12481|3');
INSERT INTO `bitacora` VALUES ('2340', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12481|3', '5|12481|3');
INSERT INTO `bitacora` VALUES ('2341', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12482|3', '2|12482|3');
INSERT INTO `bitacora` VALUES ('2342', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12483|1', '2|12483|1');
INSERT INTO `bitacora` VALUES ('2343', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12484|1', '2|12484|1');
INSERT INTO `bitacora` VALUES ('2344', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12485|1', '2|12485|1');
INSERT INTO `bitacora` VALUES ('2345', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12486|1', '2|12486|1');
INSERT INTO `bitacora` VALUES ('2346', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12487|2', '2|12487|2');
INSERT INTO `bitacora` VALUES ('2347', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12488|2', '2|12488|2');
INSERT INTO `bitacora` VALUES ('2348', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12489|2', '2|12489|2');
INSERT INTO `bitacora` VALUES ('2349', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12490|2', '2|12490|2');
INSERT INTO `bitacora` VALUES ('2350', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12491|2', '2|12491|2');
INSERT INTO `bitacora` VALUES ('2351', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12492|2', '2|12492|2');
INSERT INTO `bitacora` VALUES ('2352', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12492|2', '5|12492|2');
INSERT INTO `bitacora` VALUES ('2353', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12493|3', '2|12493|3');
INSERT INTO `bitacora` VALUES ('2354', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12494|3', '2|12494|3');
INSERT INTO `bitacora` VALUES ('2355', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12495|3', '2|12495|3');
INSERT INTO `bitacora` VALUES ('2356', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12496|3', '2|12496|3');
INSERT INTO `bitacora` VALUES ('2357', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12497|3', '2|12497|3');
INSERT INTO `bitacora` VALUES ('2358', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12498|3', '2|12498|3');
INSERT INTO `bitacora` VALUES ('2359', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12499|3', '2|12499|3');
INSERT INTO `bitacora` VALUES ('2360', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12500|3', '2|12500|3');
INSERT INTO `bitacora` VALUES ('2361', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12501|3', '2|12501|3');
INSERT INTO `bitacora` VALUES ('2362', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12559|1', '5|12559|1');
INSERT INTO `bitacora` VALUES ('2363', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12560|2', '5|12560|2');
INSERT INTO `bitacora` VALUES ('2364', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12561|2', '5|12561|2');
INSERT INTO `bitacora` VALUES ('2365', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12562|2', '5|12562|2');
INSERT INTO `bitacora` VALUES ('2366', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12563|2', '5|12563|2');
INSERT INTO `bitacora` VALUES ('2367', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12564|2', '5|12564|2');
INSERT INTO `bitacora` VALUES ('2368', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12565|2', '5|12565|2');
INSERT INTO `bitacora` VALUES ('2369', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12566|2', '5|12566|2');
INSERT INTO `bitacora` VALUES ('2370', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12567|2', '5|12567|2');
INSERT INTO `bitacora` VALUES ('2371', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12568|2', '5|12568|2');
INSERT INTO `bitacora` VALUES ('2372', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12569|2', '5|12569|2');
INSERT INTO `bitacora` VALUES ('2373', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12570|2', '5|12570|2');
INSERT INTO `bitacora` VALUES ('2374', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12571|2', '5|12571|2');
INSERT INTO `bitacora` VALUES ('2375', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12572|3', '5|12572|3');
INSERT INTO `bitacora` VALUES ('2376', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12573|3', '5|12573|3');
INSERT INTO `bitacora` VALUES ('2377', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12574|3', '5|12574|3');
INSERT INTO `bitacora` VALUES ('2378', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12575|3', '5|12575|3');
INSERT INTO `bitacora` VALUES ('2379', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12576|3', '5|12576|3');
INSERT INTO `bitacora` VALUES ('2380', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12578|3', '5|12578|3');
INSERT INTO `bitacora` VALUES ('2381', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12579|3', '5|12579|3');
INSERT INTO `bitacora` VALUES ('2382', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12581|2', '5|12581|2');
INSERT INTO `bitacora` VALUES ('2383', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12582|2', '5|12582|2');
INSERT INTO `bitacora` VALUES ('2384', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12583|2', '5|12583|2');
INSERT INTO `bitacora` VALUES ('2385', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12584|2', '5|12584|2');
INSERT INTO `bitacora` VALUES ('2386', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12585|2', '5|12585|2');
INSERT INTO `bitacora` VALUES ('2387', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12586|3', '5|12586|3');
INSERT INTO `bitacora` VALUES ('2388', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12587|3', '5|12587|3');
INSERT INTO `bitacora` VALUES ('2389', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12588|3', '5|12588|3');
INSERT INTO `bitacora` VALUES ('2390', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12589|3', '5|12589|3');
INSERT INTO `bitacora` VALUES ('2391', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12590|3', '5|12590|3');
INSERT INTO `bitacora` VALUES ('2392', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12591|3', '5|12591|3');
INSERT INTO `bitacora` VALUES ('2393', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12592|3', '5|12592|3');
INSERT INTO `bitacora` VALUES ('2394', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12593|3', '5|12593|3');
INSERT INTO `bitacora` VALUES ('2395', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12594|3', '5|12594|3');
INSERT INTO `bitacora` VALUES ('2396', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '6|11236|1', '6|11236|1');
INSERT INTO `bitacora` VALUES ('2397', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '6|11237|1', '6|11237|1');
INSERT INTO `bitacora` VALUES ('2398', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '6|11238|1', '6|11238|1');
INSERT INTO `bitacora` VALUES ('2399', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '6|11239|1', '6|11239|1');
INSERT INTO `bitacora` VALUES ('2400', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '6|11240|1', '6|11240|1');
INSERT INTO `bitacora` VALUES ('2401', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '6|11241|1', '6|11241|1');
INSERT INTO `bitacora` VALUES ('2402', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '6|11242|1', '6|11242|1');
INSERT INTO `bitacora` VALUES ('2403', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '6|11243|1', '6|11243|1');
INSERT INTO `bitacora` VALUES ('2404', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '6|11244|1', '6|11244|1');
INSERT INTO `bitacora` VALUES ('2405', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '6|11245|1', '6|11245|1');
INSERT INTO `bitacora` VALUES ('2406', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '6|11246|1', '6|11246|1');
INSERT INTO `bitacora` VALUES ('2407', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '6|11247|1', '6|11247|1');
INSERT INTO `bitacora` VALUES ('2408', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '6|11248|1', '6|11248|1');
INSERT INTO `bitacora` VALUES ('2409', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '6|11249|1', '6|11249|1');
INSERT INTO `bitacora` VALUES ('2410', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|11733|1', '2|11733|1');
INSERT INTO `bitacora` VALUES ('2411', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|11733|1', '5|11733|1');
INSERT INTO `bitacora` VALUES ('2412', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|11734|1', '2|11734|1');
INSERT INTO `bitacora` VALUES ('2413', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|11734|1', '5|11734|1');
INSERT INTO `bitacora` VALUES ('2414', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|11737|2', '5|11737|2');
INSERT INTO `bitacora` VALUES ('2415', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|11755|3', '2|11755|3');
INSERT INTO `bitacora` VALUES ('2416', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|11755|3', '5|11755|3');
INSERT INTO `bitacora` VALUES ('2417', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|11761|2', '2|11761|2');
INSERT INTO `bitacora` VALUES ('2418', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|11843|1', '2|11843|1');
INSERT INTO `bitacora` VALUES ('2419', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|11843|1', '5|11843|1');
INSERT INTO `bitacora` VALUES ('2420', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|11859|1', '2|11859|1');
INSERT INTO `bitacora` VALUES ('2421', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|11862|2', '2|11862|2');
INSERT INTO `bitacora` VALUES ('2422', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12292|3', '2|12292|3');
INSERT INTO `bitacora` VALUES ('2423', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12456|1', '2|12456|1');
INSERT INTO `bitacora` VALUES ('2424', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12457|1', '2|12457|1');
INSERT INTO `bitacora` VALUES ('2425', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12457|1', '5|12457|1');
INSERT INTO `bitacora` VALUES ('2426', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12458|1', '2|12458|1');
INSERT INTO `bitacora` VALUES ('2427', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12458|1', '5|12458|1');
INSERT INTO `bitacora` VALUES ('2428', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12459|1', '2|12459|1');
INSERT INTO `bitacora` VALUES ('2429', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12459|1', '5|12459|1');
INSERT INTO `bitacora` VALUES ('2430', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12460|2', '2|12460|2');
INSERT INTO `bitacora` VALUES ('2431', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12461|2', '2|12461|2');
INSERT INTO `bitacora` VALUES ('2432', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12462|2', '2|12462|2');
INSERT INTO `bitacora` VALUES ('2433', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12463|2', '2|12463|2');
INSERT INTO `bitacora` VALUES ('2434', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12464|2', '2|12464|2');
INSERT INTO `bitacora` VALUES ('2435', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12465|2', '2|12465|2');
INSERT INTO `bitacora` VALUES ('2436', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12466|2', '2|12466|2');
INSERT INTO `bitacora` VALUES ('2437', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12467|2', '2|12467|2');
INSERT INTO `bitacora` VALUES ('2438', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12467|2', '5|12467|2');
INSERT INTO `bitacora` VALUES ('2439', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12468|2', '2|12468|2');
INSERT INTO `bitacora` VALUES ('2440', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12469|2', '2|12469|2');
INSERT INTO `bitacora` VALUES ('2441', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12470|2', '2|12470|2');
INSERT INTO `bitacora` VALUES ('2442', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12470|2', '5|12470|2');
INSERT INTO `bitacora` VALUES ('2443', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12471|2', '2|12471|2');
INSERT INTO `bitacora` VALUES ('2444', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12472|2', '2|12472|2');
INSERT INTO `bitacora` VALUES ('2445', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12472|2', '5|12472|2');
INSERT INTO `bitacora` VALUES ('2446', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12473|2', '2|12473|2');
INSERT INTO `bitacora` VALUES ('2447', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12474|2', '2|12474|2');
INSERT INTO `bitacora` VALUES ('2448', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12475|2', '2|12475|2');
INSERT INTO `bitacora` VALUES ('2449', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12476|3', '2|12476|3');
INSERT INTO `bitacora` VALUES ('2450', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12477|3', '2|12477|3');
INSERT INTO `bitacora` VALUES ('2451', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12478|3', '2|12478|3');
INSERT INTO `bitacora` VALUES ('2452', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12479|2', '2|12479|2');
INSERT INTO `bitacora` VALUES ('2453', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12479|2', '5|12479|2');
INSERT INTO `bitacora` VALUES ('2454', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12480|3', '2|12480|3');
INSERT INTO `bitacora` VALUES ('2455', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12481|3', '2|12481|3');
INSERT INTO `bitacora` VALUES ('2456', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12481|3', '5|12481|3');
INSERT INTO `bitacora` VALUES ('2457', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12482|3', '2|12482|3');
INSERT INTO `bitacora` VALUES ('2458', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12483|1', '2|12483|1');
INSERT INTO `bitacora` VALUES ('2459', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12484|1', '2|12484|1');
INSERT INTO `bitacora` VALUES ('2460', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12485|1', '2|12485|1');
INSERT INTO `bitacora` VALUES ('2461', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12486|1', '2|12486|1');
INSERT INTO `bitacora` VALUES ('2462', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12487|2', '2|12487|2');
INSERT INTO `bitacora` VALUES ('2463', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12488|2', '2|12488|2');
INSERT INTO `bitacora` VALUES ('2464', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12489|2', '2|12489|2');
INSERT INTO `bitacora` VALUES ('2465', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12490|2', '2|12490|2');
INSERT INTO `bitacora` VALUES ('2466', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12491|2', '2|12491|2');
INSERT INTO `bitacora` VALUES ('2467', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12492|2', '2|12492|2');
INSERT INTO `bitacora` VALUES ('2468', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12492|2', '5|12492|2');
INSERT INTO `bitacora` VALUES ('2469', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12493|3', '2|12493|3');
INSERT INTO `bitacora` VALUES ('2470', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12494|3', '2|12494|3');
INSERT INTO `bitacora` VALUES ('2471', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12495|3', '2|12495|3');
INSERT INTO `bitacora` VALUES ('2472', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12496|3', '2|12496|3');
INSERT INTO `bitacora` VALUES ('2473', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12497|3', '2|12497|3');
INSERT INTO `bitacora` VALUES ('2474', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12498|3', '2|12498|3');
INSERT INTO `bitacora` VALUES ('2475', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12499|3', '2|12499|3');
INSERT INTO `bitacora` VALUES ('2476', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12500|3', '2|12500|3');
INSERT INTO `bitacora` VALUES ('2477', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12501|3', '2|12501|3');
INSERT INTO `bitacora` VALUES ('2478', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12559|1', '5|12559|1');
INSERT INTO `bitacora` VALUES ('2479', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12560|2', '5|12560|2');
INSERT INTO `bitacora` VALUES ('2480', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12561|2', '5|12561|2');
INSERT INTO `bitacora` VALUES ('2481', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12562|2', '5|12562|2');
INSERT INTO `bitacora` VALUES ('2482', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12563|2', '5|12563|2');
INSERT INTO `bitacora` VALUES ('2483', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12564|2', '5|12564|2');
INSERT INTO `bitacora` VALUES ('2484', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12565|2', '5|12565|2');
INSERT INTO `bitacora` VALUES ('2485', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12566|2', '5|12566|2');
INSERT INTO `bitacora` VALUES ('2486', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12567|2', '5|12567|2');
INSERT INTO `bitacora` VALUES ('2487', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12568|2', '5|12568|2');
INSERT INTO `bitacora` VALUES ('2488', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12569|2', '5|12569|2');
INSERT INTO `bitacora` VALUES ('2489', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12570|2', '5|12570|2');
INSERT INTO `bitacora` VALUES ('2490', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12571|2', '5|12571|2');
INSERT INTO `bitacora` VALUES ('2491', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12572|3', '5|12572|3');
INSERT INTO `bitacora` VALUES ('2492', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12573|3', '5|12573|3');
INSERT INTO `bitacora` VALUES ('2493', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12574|3', '5|12574|3');
INSERT INTO `bitacora` VALUES ('2494', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12575|3', '5|12575|3');
INSERT INTO `bitacora` VALUES ('2495', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12576|3', '5|12576|3');
INSERT INTO `bitacora` VALUES ('2496', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12578|3', '5|12578|3');
INSERT INTO `bitacora` VALUES ('2497', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12579|3', '5|12579|3');
INSERT INTO `bitacora` VALUES ('2498', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12581|2', '5|12581|2');
INSERT INTO `bitacora` VALUES ('2499', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12582|2', '5|12582|2');
INSERT INTO `bitacora` VALUES ('2500', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12583|2', '5|12583|2');
INSERT INTO `bitacora` VALUES ('2501', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12584|2', '5|12584|2');
INSERT INTO `bitacora` VALUES ('2502', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12585|2', '5|12585|2');
INSERT INTO `bitacora` VALUES ('2503', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12586|3', '5|12586|3');
INSERT INTO `bitacora` VALUES ('2504', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12587|3', '5|12587|3');
INSERT INTO `bitacora` VALUES ('2505', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12588|3', '5|12588|3');
INSERT INTO `bitacora` VALUES ('2506', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12589|3', '5|12589|3');
INSERT INTO `bitacora` VALUES ('2507', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12590|3', '5|12590|3');
INSERT INTO `bitacora` VALUES ('2508', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12591|3', '5|12591|3');
INSERT INTO `bitacora` VALUES ('2509', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12592|3', '5|12592|3');
INSERT INTO `bitacora` VALUES ('2510', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12593|3', '5|12593|3');
INSERT INTO `bitacora` VALUES ('2511', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12594|3', '5|12594|3');
INSERT INTO `bitacora` VALUES ('2512', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '6|11236|1', '6|11236|1');
INSERT INTO `bitacora` VALUES ('2513', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '6|11237|1', '6|11237|1');
INSERT INTO `bitacora` VALUES ('2514', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '6|11238|1', '6|11238|1');
INSERT INTO `bitacora` VALUES ('2515', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '6|11239|1', '6|11239|1');
INSERT INTO `bitacora` VALUES ('2516', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '6|11240|1', '6|11240|1');
INSERT INTO `bitacora` VALUES ('2517', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '6|11241|1', '6|11241|1');
INSERT INTO `bitacora` VALUES ('2518', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '6|11242|1', '6|11242|1');
INSERT INTO `bitacora` VALUES ('2519', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '6|11243|1', '6|11243|1');
INSERT INTO `bitacora` VALUES ('2520', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '6|11244|1', '6|11244|1');
INSERT INTO `bitacora` VALUES ('2521', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '6|11245|1', '6|11245|1');
INSERT INTO `bitacora` VALUES ('2522', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '6|11246|1', '6|11246|1');
INSERT INTO `bitacora` VALUES ('2523', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '6|11247|1', '6|11247|1');
INSERT INTO `bitacora` VALUES ('2524', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '6|11248|1', '6|11248|1');
INSERT INTO `bitacora` VALUES ('2525', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '6|11249|1', '6|11249|1');
INSERT INTO `bitacora` VALUES ('2526', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|11733|1', '2|11733|1');
INSERT INTO `bitacora` VALUES ('2527', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|11733|1', '5|11733|1');
INSERT INTO `bitacora` VALUES ('2528', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|11734|1', '2|11734|1');
INSERT INTO `bitacora` VALUES ('2529', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|11734|1', '5|11734|1');
INSERT INTO `bitacora` VALUES ('2530', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|11737|2', '5|11737|2');
INSERT INTO `bitacora` VALUES ('2531', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|11755|3', '2|11755|3');
INSERT INTO `bitacora` VALUES ('2532', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|11755|3', '5|11755|3');
INSERT INTO `bitacora` VALUES ('2533', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|11761|2', '2|11761|2');
INSERT INTO `bitacora` VALUES ('2534', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|11843|1', '2|11843|1');
INSERT INTO `bitacora` VALUES ('2535', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|11843|1', '5|11843|1');
INSERT INTO `bitacora` VALUES ('2536', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|11859|1', '2|11859|1');
INSERT INTO `bitacora` VALUES ('2537', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|11862|2', '2|11862|2');
INSERT INTO `bitacora` VALUES ('2538', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12292|3', '2|12292|3');
INSERT INTO `bitacora` VALUES ('2539', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12456|1', '2|12456|1');
INSERT INTO `bitacora` VALUES ('2540', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12457|1', '2|12457|1');
INSERT INTO `bitacora` VALUES ('2541', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12457|1', '5|12457|1');
INSERT INTO `bitacora` VALUES ('2542', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12458|1', '2|12458|1');
INSERT INTO `bitacora` VALUES ('2543', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12458|1', '5|12458|1');
INSERT INTO `bitacora` VALUES ('2544', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12459|1', '2|12459|1');
INSERT INTO `bitacora` VALUES ('2545', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12459|1', '5|12459|1');
INSERT INTO `bitacora` VALUES ('2546', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12460|2', '2|12460|2');
INSERT INTO `bitacora` VALUES ('2547', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12461|2', '2|12461|2');
INSERT INTO `bitacora` VALUES ('2548', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12462|2', '2|12462|2');
INSERT INTO `bitacora` VALUES ('2549', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12463|2', '2|12463|2');
INSERT INTO `bitacora` VALUES ('2550', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12464|2', '2|12464|2');
INSERT INTO `bitacora` VALUES ('2551', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12465|2', '2|12465|2');
INSERT INTO `bitacora` VALUES ('2552', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12466|2', '2|12466|2');
INSERT INTO `bitacora` VALUES ('2553', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12467|2', '2|12467|2');
INSERT INTO `bitacora` VALUES ('2554', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12467|2', '5|12467|2');
INSERT INTO `bitacora` VALUES ('2555', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12468|2', '2|12468|2');
INSERT INTO `bitacora` VALUES ('2556', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12469|2', '2|12469|2');
INSERT INTO `bitacora` VALUES ('2557', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12470|2', '2|12470|2');
INSERT INTO `bitacora` VALUES ('2558', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12470|2', '5|12470|2');
INSERT INTO `bitacora` VALUES ('2559', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12471|2', '2|12471|2');
INSERT INTO `bitacora` VALUES ('2560', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12472|2', '2|12472|2');
INSERT INTO `bitacora` VALUES ('2561', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12472|2', '5|12472|2');
INSERT INTO `bitacora` VALUES ('2562', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12473|2', '2|12473|2');
INSERT INTO `bitacora` VALUES ('2563', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12474|2', '2|12474|2');
INSERT INTO `bitacora` VALUES ('2564', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12475|2', '2|12475|2');
INSERT INTO `bitacora` VALUES ('2565', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12476|3', '2|12476|3');
INSERT INTO `bitacora` VALUES ('2566', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12477|3', '2|12477|3');
INSERT INTO `bitacora` VALUES ('2567', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12478|3', '2|12478|3');
INSERT INTO `bitacora` VALUES ('2568', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12479|2', '2|12479|2');
INSERT INTO `bitacora` VALUES ('2569', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12479|2', '5|12479|2');
INSERT INTO `bitacora` VALUES ('2570', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12480|3', '2|12480|3');
INSERT INTO `bitacora` VALUES ('2571', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12481|3', '2|12481|3');
INSERT INTO `bitacora` VALUES ('2572', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12481|3', '5|12481|3');
INSERT INTO `bitacora` VALUES ('2573', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12482|3', '2|12482|3');
INSERT INTO `bitacora` VALUES ('2574', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12483|1', '2|12483|1');
INSERT INTO `bitacora` VALUES ('2575', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12484|1', '2|12484|1');
INSERT INTO `bitacora` VALUES ('2576', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12485|1', '2|12485|1');
INSERT INTO `bitacora` VALUES ('2577', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12486|1', '2|12486|1');
INSERT INTO `bitacora` VALUES ('2578', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12487|2', '2|12487|2');
INSERT INTO `bitacora` VALUES ('2579', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12488|2', '2|12488|2');
INSERT INTO `bitacora` VALUES ('2580', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12489|2', '2|12489|2');
INSERT INTO `bitacora` VALUES ('2581', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12490|2', '2|12490|2');
INSERT INTO `bitacora` VALUES ('2582', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12491|2', '2|12491|2');
INSERT INTO `bitacora` VALUES ('2583', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12492|2', '2|12492|2');
INSERT INTO `bitacora` VALUES ('2584', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12492|2', '5|12492|2');
INSERT INTO `bitacora` VALUES ('2585', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12493|3', '2|12493|3');
INSERT INTO `bitacora` VALUES ('2586', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12494|3', '2|12494|3');
INSERT INTO `bitacora` VALUES ('2587', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12495|3', '2|12495|3');
INSERT INTO `bitacora` VALUES ('2588', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12496|3', '2|12496|3');
INSERT INTO `bitacora` VALUES ('2589', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12497|3', '2|12497|3');
INSERT INTO `bitacora` VALUES ('2590', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12498|3', '2|12498|3');
INSERT INTO `bitacora` VALUES ('2591', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12499|3', '2|12499|3');
INSERT INTO `bitacora` VALUES ('2592', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12500|3', '2|12500|3');
INSERT INTO `bitacora` VALUES ('2593', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '2|12501|3', '2|12501|3');
INSERT INTO `bitacora` VALUES ('2594', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12559|1', '5|12559|1');
INSERT INTO `bitacora` VALUES ('2595', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12560|2', '5|12560|2');
INSERT INTO `bitacora` VALUES ('2596', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12561|2', '5|12561|2');
INSERT INTO `bitacora` VALUES ('2597', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12562|2', '5|12562|2');
INSERT INTO `bitacora` VALUES ('2598', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12563|2', '5|12563|2');
INSERT INTO `bitacora` VALUES ('2599', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12564|2', '5|12564|2');
INSERT INTO `bitacora` VALUES ('2600', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12565|2', '5|12565|2');
INSERT INTO `bitacora` VALUES ('2601', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12566|2', '5|12566|2');
INSERT INTO `bitacora` VALUES ('2602', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12567|2', '5|12567|2');
INSERT INTO `bitacora` VALUES ('2603', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12568|2', '5|12568|2');
INSERT INTO `bitacora` VALUES ('2604', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12569|2', '5|12569|2');
INSERT INTO `bitacora` VALUES ('2605', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12570|2', '5|12570|2');
INSERT INTO `bitacora` VALUES ('2606', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12571|2', '5|12571|2');
INSERT INTO `bitacora` VALUES ('2607', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12572|3', '5|12572|3');
INSERT INTO `bitacora` VALUES ('2608', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12573|3', '5|12573|3');
INSERT INTO `bitacora` VALUES ('2609', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12574|3', '5|12574|3');
INSERT INTO `bitacora` VALUES ('2610', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12575|3', '5|12575|3');
INSERT INTO `bitacora` VALUES ('2611', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12576|3', '5|12576|3');
INSERT INTO `bitacora` VALUES ('2612', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12578|3', '5|12578|3');
INSERT INTO `bitacora` VALUES ('2613', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12579|3', '5|12579|3');
INSERT INTO `bitacora` VALUES ('2614', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12581|2', '5|12581|2');
INSERT INTO `bitacora` VALUES ('2615', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12582|2', '5|12582|2');
INSERT INTO `bitacora` VALUES ('2616', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12583|2', '5|12583|2');
INSERT INTO `bitacora` VALUES ('2617', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12584|2', '5|12584|2');
INSERT INTO `bitacora` VALUES ('2618', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12585|2', '5|12585|2');
INSERT INTO `bitacora` VALUES ('2619', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12586|3', '5|12586|3');
INSERT INTO `bitacora` VALUES ('2620', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12587|3', '5|12587|3');
INSERT INTO `bitacora` VALUES ('2621', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12588|3', '5|12588|3');
INSERT INTO `bitacora` VALUES ('2622', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12589|3', '5|12589|3');
INSERT INTO `bitacora` VALUES ('2623', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12590|3', '5|12590|3');
INSERT INTO `bitacora` VALUES ('2624', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12591|3', '5|12591|3');
INSERT INTO `bitacora` VALUES ('2625', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12592|3', '5|12592|3');
INSERT INTO `bitacora` VALUES ('2626', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12593|3', '5|12593|3');
INSERT INTO `bitacora` VALUES ('2627', 'p_ua', '1', 'U', '2014-12-19 00:00:00', '5|12594|3', '5|12594|3');
INSERT INTO `bitacora` VALUES ('2628', 'uaprendizaje', '1', 'U', '2014-12-22 00:00:00', '11236|COMUNICACION ORAL Y ESCRITA|1|0|2|0|0|0|4|1|1|21|20092', '11236|COMUNICACION ORAL Y ESCRITA|1|0|2|0|0|0|4|0|1|21|20092');
INSERT INTO `bitacora` VALUES ('2629', 'uaprendizaje', '1', 'U', '2014-12-22 00:00:00', '11237|CONTABILIDAD|2|0|3|0|0|0|7|1|1|1|20092', '11237|CONTABILIDAD|2|0|3|0|0|0|7|0|1|1|20092');
INSERT INTO `bitacora` VALUES ('2630', 'uaprendizaje', '1', 'U', '2014-12-22 00:00:00', '11238|DESARROLLO HUMANO|1|0|2|0|0|0|4|1|1|8|20092', '11238|DESARROLLO HUMANO|1|0|2|0|0|0|4|0|1|8|20092');
INSERT INTO `bitacora` VALUES ('2631', 'uaprendizaje', '1', 'U', '2014-12-22 00:00:00', '11239|ENTORNO GLOBAL DE LOS NEGOCIOS|2|0|2|0|0|0|6|1|1|10|20092', '11239|ENTORNO GLOBAL DE LOS NEGOCIOS|2|0|2|0|0|0|6|0|1|10|20092');
INSERT INTO `bitacora` VALUES ('2632', 'uaprendizaje', '1', 'U', '2014-12-22 00:00:00', '11240|MATEMATICAS|2|0|2|0|0|0|6|1|1|22|20092', '11240|MATEMATICAS|2|0|2|0|0|0|6|0|1|22|20092');
INSERT INTO `bitacora` VALUES ('2633', 'uaprendizaje', '1', 'U', '2014-12-22 00:00:00', '11241|RESPONSABILIDAD SOCIAL|2|0|1|0|0|0|5|1|1|21|20092', '11241|RESPONSABILIDAD SOCIAL|2|0|1|0|0|0|5|0|1|21|20092');
INSERT INTO `bitacora` VALUES ('2634', 'uaprendizaje', '1', 'U', '2014-12-22 00:00:00', '11242|TECNOLOGIAS DE LA INFORMACION|1|3|0|0|0|0|5|1|1|12|20092', '11242|TECNOLOGIAS DE LA INFORMACION|1|3|0|0|0|0|5|0|1|12|20092');
INSERT INTO `bitacora` VALUES ('2635', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '6|11236|1', '6|11236|1');
INSERT INTO `bitacora` VALUES ('2636', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '6|11237|1', '6|11237|1');
INSERT INTO `bitacora` VALUES ('2637', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '6|11238|1', '6|11238|1');
INSERT INTO `bitacora` VALUES ('2638', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '6|11239|1', '6|11239|1');
INSERT INTO `bitacora` VALUES ('2639', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '6|11240|1', '6|11240|1');
INSERT INTO `bitacora` VALUES ('2640', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '6|11241|1', '6|11241|1');
INSERT INTO `bitacora` VALUES ('2641', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '6|11242|1', '6|11242|1');
INSERT INTO `bitacora` VALUES ('2642', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '6|11243|1', '6|11243|1');
INSERT INTO `bitacora` VALUES ('2643', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '6|11244|1', '6|11244|1');
INSERT INTO `bitacora` VALUES ('2644', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '6|11245|1', '6|11245|1');
INSERT INTO `bitacora` VALUES ('2645', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '6|11246|1', '6|11246|1');
INSERT INTO `bitacora` VALUES ('2646', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '6|11247|1', '6|11247|1');
INSERT INTO `bitacora` VALUES ('2647', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '6|11248|1', '6|11248|1');
INSERT INTO `bitacora` VALUES ('2648', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '6|11249|1', '6|11249|1');
INSERT INTO `bitacora` VALUES ('2649', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|11734|1', '2|11734|1');
INSERT INTO `bitacora` VALUES ('2650', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|11734|1', '5|11734|1');
INSERT INTO `bitacora` VALUES ('2651', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|11843|1', '2|11843|1');
INSERT INTO `bitacora` VALUES ('2652', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|11843|1', '5|11843|1');
INSERT INTO `bitacora` VALUES ('2653', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|11859|1', '2|11859|1');
INSERT INTO `bitacora` VALUES ('2654', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12456|1', '2|12456|1');
INSERT INTO `bitacora` VALUES ('2655', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12457|1', '2|12457|1');
INSERT INTO `bitacora` VALUES ('2656', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12457|1', '5|12457|1');
INSERT INTO `bitacora` VALUES ('2657', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12458|1', '2|12458|1');
INSERT INTO `bitacora` VALUES ('2658', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12458|1', '5|12458|1');
INSERT INTO `bitacora` VALUES ('2659', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12459|1', '2|12459|1');
INSERT INTO `bitacora` VALUES ('2660', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12459|1', '5|12459|1');
INSERT INTO `bitacora` VALUES ('2661', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|11733|1', '2|11733|1');
INSERT INTO `bitacora` VALUES ('2662', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|11733|1', '5|11733|1');
INSERT INTO `bitacora` VALUES ('2663', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|11761|2', '2|11761|2');
INSERT INTO `bitacora` VALUES ('2664', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|11862|2', '2|11862|2');
INSERT INTO `bitacora` VALUES ('2665', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12460|2', '2|12460|2');
INSERT INTO `bitacora` VALUES ('2666', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12461|2', '2|12461|2');
INSERT INTO `bitacora` VALUES ('2667', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12462|2', '2|12462|2');
INSERT INTO `bitacora` VALUES ('2668', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12463|2', '2|12463|2');
INSERT INTO `bitacora` VALUES ('2669', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12464|2', '2|12464|2');
INSERT INTO `bitacora` VALUES ('2670', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12487|2', '2|12487|2');
INSERT INTO `bitacora` VALUES ('2671', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12492|2', '2|12492|2');
INSERT INTO `bitacora` VALUES ('2672', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12492|2', '5|12492|2');
INSERT INTO `bitacora` VALUES ('2673', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|11761|2', '2|11761|2');
INSERT INTO `bitacora` VALUES ('2674', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12465|2', '2|12465|2');
INSERT INTO `bitacora` VALUES ('2675', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12466|2', '2|12466|2');
INSERT INTO `bitacora` VALUES ('2676', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12467|2', '2|12467|2');
INSERT INTO `bitacora` VALUES ('2677', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12467|2', '5|12467|2');
INSERT INTO `bitacora` VALUES ('2678', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12468|2', '2|12468|2');
INSERT INTO `bitacora` VALUES ('2679', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12469|2', '2|12469|2');
INSERT INTO `bitacora` VALUES ('2680', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12487|2', '2|12487|2');
INSERT INTO `bitacora` VALUES ('2681', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12489|2', '2|12489|2');
INSERT INTO `bitacora` VALUES ('2682', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12490|2', '2|12490|2');
INSERT INTO `bitacora` VALUES ('2683', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12492|2', '2|12492|2');
INSERT INTO `bitacora` VALUES ('2684', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12492|2', '5|12492|2');
INSERT INTO `bitacora` VALUES ('2685', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|11761|2', '2|11761|2');
INSERT INTO `bitacora` VALUES ('2686', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12465|2', '2|12465|2');
INSERT INTO `bitacora` VALUES ('2687', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12466|2', '2|12466|2');
INSERT INTO `bitacora` VALUES ('2688', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12467|2', '2|12467|2');
INSERT INTO `bitacora` VALUES ('2689', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12467|2', '5|12467|2');
INSERT INTO `bitacora` VALUES ('2690', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12468|2', '2|12468|2');
INSERT INTO `bitacora` VALUES ('2691', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12469|2', '2|12469|2');
INSERT INTO `bitacora` VALUES ('2692', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12487|2', '2|12487|2');
INSERT INTO `bitacora` VALUES ('2693', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12489|2', '2|12489|2');
INSERT INTO `bitacora` VALUES ('2694', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12490|2', '2|12490|2');
INSERT INTO `bitacora` VALUES ('2695', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12492|2', '2|12492|2');
INSERT INTO `bitacora` VALUES ('2696', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12492|2', '5|12492|2');
INSERT INTO `bitacora` VALUES ('2697', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|11761|2', '2|11761|2');
INSERT INTO `bitacora` VALUES ('2698', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12465|2', '2|12465|2');
INSERT INTO `bitacora` VALUES ('2699', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12466|2', '2|12466|2');
INSERT INTO `bitacora` VALUES ('2700', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12467|2', '2|12467|2');
INSERT INTO `bitacora` VALUES ('2701', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12467|2', '5|12467|2');
INSERT INTO `bitacora` VALUES ('2702', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12468|2', '2|12468|2');
INSERT INTO `bitacora` VALUES ('2703', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12469|2', '2|12469|2');
INSERT INTO `bitacora` VALUES ('2704', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12487|2', '2|12487|2');
INSERT INTO `bitacora` VALUES ('2705', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12489|2', '2|12489|2');
INSERT INTO `bitacora` VALUES ('2706', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12490|2', '2|12490|2');
INSERT INTO `bitacora` VALUES ('2707', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12492|2', '2|12492|2');
INSERT INTO `bitacora` VALUES ('2708', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12492|2', '5|12492|2');
INSERT INTO `bitacora` VALUES ('2709', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|11761|2', '2|11761|2');
INSERT INTO `bitacora` VALUES ('2710', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12465|2', '2|12465|2');
INSERT INTO `bitacora` VALUES ('2711', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12466|2', '2|12466|2');
INSERT INTO `bitacora` VALUES ('2712', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12467|2', '2|12467|2');
INSERT INTO `bitacora` VALUES ('2713', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12467|2', '5|12467|2');
INSERT INTO `bitacora` VALUES ('2714', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12468|2', '2|12468|2');
INSERT INTO `bitacora` VALUES ('2715', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12469|2', '2|12469|2');
INSERT INTO `bitacora` VALUES ('2716', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12487|2', '2|12487|2');
INSERT INTO `bitacora` VALUES ('2717', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12489|2', '2|12489|2');
INSERT INTO `bitacora` VALUES ('2718', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12490|2', '2|12490|2');
INSERT INTO `bitacora` VALUES ('2719', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12492|2', '2|12492|2');
INSERT INTO `bitacora` VALUES ('2720', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12492|2', '5|12492|2');
INSERT INTO `bitacora` VALUES ('2721', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12470|2', '2|12470|2');
INSERT INTO `bitacora` VALUES ('2722', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12470|2', '5|12470|2');
INSERT INTO `bitacora` VALUES ('2723', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12471|2', '2|12471|2');
INSERT INTO `bitacora` VALUES ('2724', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12472|2', '2|12472|2');
INSERT INTO `bitacora` VALUES ('2725', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12472|2', '5|12472|2');
INSERT INTO `bitacora` VALUES ('2726', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12473|2', '2|12473|2');
INSERT INTO `bitacora` VALUES ('2727', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12474|2', '2|12474|2');
INSERT INTO `bitacora` VALUES ('2728', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12475|2', '2|12475|2');
INSERT INTO `bitacora` VALUES ('2729', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12491|2', '2|12491|2');
INSERT INTO `bitacora` VALUES ('2730', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|11755|3', '2|11755|3');
INSERT INTO `bitacora` VALUES ('2731', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|11755|3', '5|11755|3');
INSERT INTO `bitacora` VALUES ('2732', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12292|3', '2|12292|3');
INSERT INTO `bitacora` VALUES ('2733', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12476|3', '2|12476|3');
INSERT INTO `bitacora` VALUES ('2734', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12477|3', '2|12477|3');
INSERT INTO `bitacora` VALUES ('2735', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12478|3', '2|12478|3');
INSERT INTO `bitacora` VALUES ('2736', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12479|2', '2|12479|2');
INSERT INTO `bitacora` VALUES ('2737', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12479|2', '5|12479|2');
INSERT INTO `bitacora` VALUES ('2738', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12495|3', '2|12495|3');
INSERT INTO `bitacora` VALUES ('2739', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12496|3', '2|12496|3');
INSERT INTO `bitacora` VALUES ('2740', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12497|3', '2|12497|3');
INSERT INTO `bitacora` VALUES ('2741', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12501|3', '2|12501|3');
INSERT INTO `bitacora` VALUES ('2742', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12480|3', '2|12480|3');
INSERT INTO `bitacora` VALUES ('2743', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12481|3', '2|12481|3');
INSERT INTO `bitacora` VALUES ('2744', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12481|3', '5|12481|3');
INSERT INTO `bitacora` VALUES ('2745', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12493|3', '2|12493|3');
INSERT INTO `bitacora` VALUES ('2746', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12494|3', '2|12494|3');
INSERT INTO `bitacora` VALUES ('2747', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12498|3', '2|12498|3');
INSERT INTO `bitacora` VALUES ('2748', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12500|3', '2|12500|3');
INSERT INTO `bitacora` VALUES ('2749', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12483|1', '2|12483|1');
INSERT INTO `bitacora` VALUES ('2750', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12483|1', '2|12483|1');
INSERT INTO `bitacora` VALUES ('2751', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12484|1', '2|12484|1');
INSERT INTO `bitacora` VALUES ('2752', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12485|1', '2|12485|1');
INSERT INTO `bitacora` VALUES ('2753', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12483|1', '2|12483|1');
INSERT INTO `bitacora` VALUES ('2754', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12484|1', '2|12484|1');
INSERT INTO `bitacora` VALUES ('2755', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12485|1', '2|12485|1');
INSERT INTO `bitacora` VALUES ('2756', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12486|1', '2|12486|1');
INSERT INTO `bitacora` VALUES ('2757', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12488|2', '2|12488|2');
INSERT INTO `bitacora` VALUES ('2758', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12559|1', '5|12559|1');
INSERT INTO `bitacora` VALUES ('2759', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|11737|2', '5|11737|2');
INSERT INTO `bitacora` VALUES ('2760', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12560|2', '5|12560|2');
INSERT INTO `bitacora` VALUES ('2761', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12561|2', '5|12561|2');
INSERT INTO `bitacora` VALUES ('2762', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12562|2', '5|12562|2');
INSERT INTO `bitacora` VALUES ('2763', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12563|2', '5|12563|2');
INSERT INTO `bitacora` VALUES ('2764', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12564|2', '5|12564|2');
INSERT INTO `bitacora` VALUES ('2765', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12565|2', '5|12565|2');
INSERT INTO `bitacora` VALUES ('2766', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12566|2', '5|12566|2');
INSERT INTO `bitacora` VALUES ('2767', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12567|2', '5|12567|2');
INSERT INTO `bitacora` VALUES ('2768', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12568|2', '5|12568|2');
INSERT INTO `bitacora` VALUES ('2769', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12569|2', '5|12569|2');
INSERT INTO `bitacora` VALUES ('2770', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12570|2', '5|12570|2');
INSERT INTO `bitacora` VALUES ('2771', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12571|2', '5|12571|2');
INSERT INTO `bitacora` VALUES ('2772', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12581|2', '5|12581|2');
INSERT INTO `bitacora` VALUES ('2773', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12582|2', '5|12582|2');
INSERT INTO `bitacora` VALUES ('2774', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12583|2', '5|12583|2');
INSERT INTO `bitacora` VALUES ('2775', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12584|2', '5|12584|2');
INSERT INTO `bitacora` VALUES ('2776', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12585|2', '5|12585|2');
INSERT INTO `bitacora` VALUES ('2777', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12482|3', '2|12482|3');
INSERT INTO `bitacora` VALUES ('2778', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '2|12499|3', '2|12499|3');
INSERT INTO `bitacora` VALUES ('2779', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12572|3', '5|12572|3');
INSERT INTO `bitacora` VALUES ('2780', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12573|3', '5|12573|3');
INSERT INTO `bitacora` VALUES ('2781', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12574|3', '5|12574|3');
INSERT INTO `bitacora` VALUES ('2782', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12575|3', '5|12575|3');
INSERT INTO `bitacora` VALUES ('2783', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12576|3', '5|12576|3');
INSERT INTO `bitacora` VALUES ('2784', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12578|3', '5|12578|3');
INSERT INTO `bitacora` VALUES ('2785', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12579|3', '5|12579|3');
INSERT INTO `bitacora` VALUES ('2786', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12586|3', '5|12586|3');
INSERT INTO `bitacora` VALUES ('2787', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12587|3', '5|12587|3');
INSERT INTO `bitacora` VALUES ('2788', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12588|3', '5|12588|3');
INSERT INTO `bitacora` VALUES ('2789', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12589|3', '5|12589|3');
INSERT INTO `bitacora` VALUES ('2790', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12590|3', '5|12590|3');
INSERT INTO `bitacora` VALUES ('2791', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12591|3', '5|12591|3');
INSERT INTO `bitacora` VALUES ('2792', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12592|3', '5|12592|3');
INSERT INTO `bitacora` VALUES ('2793', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12593|3', '5|12593|3');
INSERT INTO `bitacora` VALUES ('2794', 'p_ua', '1', 'U', '2014-12-22 00:00:00', '5|12594|3', '5|12594|3');
INSERT INTO `bitacora` VALUES ('2795', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|11761|2', '2|11761|2');
INSERT INTO `bitacora` VALUES ('2796', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12482|3', '2|12482|3');
INSERT INTO `bitacora` VALUES ('2797', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12483|1', '2|12483|1');
INSERT INTO `bitacora` VALUES ('2798', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12484|1', '2|12484|1');
INSERT INTO `bitacora` VALUES ('2799', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12485|1', '2|12485|1');
INSERT INTO `bitacora` VALUES ('2800', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12486|1', '2|12486|1');
INSERT INTO `bitacora` VALUES ('2801', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12487|2', '2|12487|2');
INSERT INTO `bitacora` VALUES ('2802', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12488|2', '2|12488|2');
INSERT INTO `bitacora` VALUES ('2803', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12489|2', '2|12489|2');
INSERT INTO `bitacora` VALUES ('2804', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12490|2', '2|12490|2');
INSERT INTO `bitacora` VALUES ('2805', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12491|2', '2|12491|2');
INSERT INTO `bitacora` VALUES ('2806', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12492|2', '2|12492|2');
INSERT INTO `bitacora` VALUES ('2807', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12493|3', '2|12493|3');
INSERT INTO `bitacora` VALUES ('2808', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12494|3', '2|12494|3');
INSERT INTO `bitacora` VALUES ('2809', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12495|3', '2|12495|3');
INSERT INTO `bitacora` VALUES ('2810', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12496|3', '2|12496|3');
INSERT INTO `bitacora` VALUES ('2811', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12497|3', '2|12497|3');
INSERT INTO `bitacora` VALUES ('2812', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12498|3', '2|12498|3');
INSERT INTO `bitacora` VALUES ('2813', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12499|3', '2|12499|3');
INSERT INTO `bitacora` VALUES ('2814', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12500|3', '2|12500|3');
INSERT INTO `bitacora` VALUES ('2815', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12501|3', '2|12501|3');
INSERT INTO `bitacora` VALUES ('2816', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12492|2', '5|12492|2');
INSERT INTO `bitacora` VALUES ('2817', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12581|2', '5|12581|2');
INSERT INTO `bitacora` VALUES ('2818', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12582|2', '5|12582|2');
INSERT INTO `bitacora` VALUES ('2819', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12583|2', '5|12583|2');
INSERT INTO `bitacora` VALUES ('2820', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12584|2', '5|12584|2');
INSERT INTO `bitacora` VALUES ('2821', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12585|2', '5|12585|2');
INSERT INTO `bitacora` VALUES ('2822', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12586|3', '5|12586|3');
INSERT INTO `bitacora` VALUES ('2823', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12587|3', '5|12587|3');
INSERT INTO `bitacora` VALUES ('2824', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12588|3', '5|12588|3');
INSERT INTO `bitacora` VALUES ('2825', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12589|3', '5|12589|3');
INSERT INTO `bitacora` VALUES ('2826', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12590|3', '5|12590|3');
INSERT INTO `bitacora` VALUES ('2827', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12591|3', '5|12591|3');
INSERT INTO `bitacora` VALUES ('2828', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12592|3', '5|12592|3');
INSERT INTO `bitacora` VALUES ('2829', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12593|3', '5|12593|3');
INSERT INTO `bitacora` VALUES ('2830', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12594|3', '5|12594|3');
INSERT INTO `bitacora` VALUES ('2831', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|11733|1', '2|11733|1');
INSERT INTO `bitacora` VALUES ('2832', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|11734|1', '2|11734|1');
INSERT INTO `bitacora` VALUES ('2833', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|11755|3', '2|11755|3');
INSERT INTO `bitacora` VALUES ('2834', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|11843|1', '2|11843|1');
INSERT INTO `bitacora` VALUES ('2835', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|11859|1', '2|11859|1');
INSERT INTO `bitacora` VALUES ('2836', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|11862|2', '2|11862|2');
INSERT INTO `bitacora` VALUES ('2837', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12292|3', '2|12292|3');
INSERT INTO `bitacora` VALUES ('2838', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12456|1', '2|12456|1');
INSERT INTO `bitacora` VALUES ('2839', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12457|1', '2|12457|1');
INSERT INTO `bitacora` VALUES ('2840', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12458|1', '2|12458|1');
INSERT INTO `bitacora` VALUES ('2841', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12459|1', '2|12459|1');
INSERT INTO `bitacora` VALUES ('2842', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12460|2', '2|12460|2');
INSERT INTO `bitacora` VALUES ('2843', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12461|2', '2|12461|2');
INSERT INTO `bitacora` VALUES ('2844', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12462|2', '2|12462|2');
INSERT INTO `bitacora` VALUES ('2845', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12463|2', '2|12463|2');
INSERT INTO `bitacora` VALUES ('2846', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12464|2', '2|12464|2');
INSERT INTO `bitacora` VALUES ('2847', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12465|2', '2|12465|2');
INSERT INTO `bitacora` VALUES ('2848', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12466|2', '2|12466|2');
INSERT INTO `bitacora` VALUES ('2849', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12467|2', '2|12467|2');
INSERT INTO `bitacora` VALUES ('2850', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12468|2', '2|12468|2');
INSERT INTO `bitacora` VALUES ('2851', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12469|2', '2|12469|2');
INSERT INTO `bitacora` VALUES ('2852', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12470|2', '2|12470|2');
INSERT INTO `bitacora` VALUES ('2853', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12471|2', '2|12471|2');
INSERT INTO `bitacora` VALUES ('2854', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12472|2', '2|12472|2');
INSERT INTO `bitacora` VALUES ('2855', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12473|2', '2|12473|2');
INSERT INTO `bitacora` VALUES ('2856', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12474|2', '2|12474|2');
INSERT INTO `bitacora` VALUES ('2857', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12475|2', '2|12475|2');
INSERT INTO `bitacora` VALUES ('2858', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12476|3', '2|12476|3');
INSERT INTO `bitacora` VALUES ('2859', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12477|3', '2|12477|3');
INSERT INTO `bitacora` VALUES ('2860', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12478|3', '2|12478|3');
INSERT INTO `bitacora` VALUES ('2861', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12479|2', '2|12479|2');
INSERT INTO `bitacora` VALUES ('2862', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12480|3', '2|12480|3');
INSERT INTO `bitacora` VALUES ('2863', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12481|3', '2|12481|3');
INSERT INTO `bitacora` VALUES ('2864', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|11733|1', '5|11733|1');
INSERT INTO `bitacora` VALUES ('2865', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|11734|1', '5|11734|1');
INSERT INTO `bitacora` VALUES ('2866', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|11737|2', '5|11737|2');
INSERT INTO `bitacora` VALUES ('2867', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|11755|3', '5|11755|3');
INSERT INTO `bitacora` VALUES ('2868', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|11843|1', '5|11843|1');
INSERT INTO `bitacora` VALUES ('2869', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12457|1', '5|12457|1');
INSERT INTO `bitacora` VALUES ('2870', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12458|1', '5|12458|1');
INSERT INTO `bitacora` VALUES ('2871', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12459|1', '5|12459|1');
INSERT INTO `bitacora` VALUES ('2872', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12467|2', '5|12467|2');
INSERT INTO `bitacora` VALUES ('2873', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12470|2', '5|12470|2');
INSERT INTO `bitacora` VALUES ('2874', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12472|2', '5|12472|2');
INSERT INTO `bitacora` VALUES ('2875', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12479|2', '5|12479|2');
INSERT INTO `bitacora` VALUES ('2876', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12481|3', '5|12481|3');
INSERT INTO `bitacora` VALUES ('2877', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12559|1', '5|12559|1');
INSERT INTO `bitacora` VALUES ('2878', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12560|2', '5|12560|2');
INSERT INTO `bitacora` VALUES ('2879', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12561|2', '5|12561|2');
INSERT INTO `bitacora` VALUES ('2880', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12562|2', '5|12562|2');
INSERT INTO `bitacora` VALUES ('2881', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12563|2', '5|12563|2');
INSERT INTO `bitacora` VALUES ('2882', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12564|2', '5|12564|2');
INSERT INTO `bitacora` VALUES ('2883', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12565|2', '5|12565|2');
INSERT INTO `bitacora` VALUES ('2884', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12566|2', '5|12566|2');
INSERT INTO `bitacora` VALUES ('2885', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12567|2', '5|12567|2');
INSERT INTO `bitacora` VALUES ('2886', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12568|2', '5|12568|2');
INSERT INTO `bitacora` VALUES ('2887', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12569|2', '5|12569|2');
INSERT INTO `bitacora` VALUES ('2888', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12570|2', '5|12570|2');
INSERT INTO `bitacora` VALUES ('2889', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12571|2', '5|12571|2');
INSERT INTO `bitacora` VALUES ('2890', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12572|3', '5|12572|3');
INSERT INTO `bitacora` VALUES ('2891', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12573|3', '5|12573|3');
INSERT INTO `bitacora` VALUES ('2892', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12574|3', '5|12574|3');
INSERT INTO `bitacora` VALUES ('2893', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12575|3', '5|12575|3');
INSERT INTO `bitacora` VALUES ('2894', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12576|3', '5|12576|3');
INSERT INTO `bitacora` VALUES ('2895', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12578|3', '5|12578|3');
INSERT INTO `bitacora` VALUES ('2896', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12579|3', '5|12579|3');
INSERT INTO `bitacora` VALUES ('2897', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '6|11236|1', '6|11236|1');
INSERT INTO `bitacora` VALUES ('2898', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '6|11237|1', '6|11237|1');
INSERT INTO `bitacora` VALUES ('2899', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '6|11238|1', '6|11238|1');
INSERT INTO `bitacora` VALUES ('2900', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '6|11239|1', '6|11239|1');
INSERT INTO `bitacora` VALUES ('2901', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '6|11240|1', '6|11240|1');
INSERT INTO `bitacora` VALUES ('2902', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '6|11241|1', '6|11241|1');
INSERT INTO `bitacora` VALUES ('2903', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '6|11242|1', '6|11242|1');
INSERT INTO `bitacora` VALUES ('2904', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '6|11243|1', '6|11243|1');
INSERT INTO `bitacora` VALUES ('2905', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '6|11244|1', '6|11244|1');
INSERT INTO `bitacora` VALUES ('2906', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '6|11245|1', '6|11245|1');
INSERT INTO `bitacora` VALUES ('2907', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '6|11246|1', '6|11246|1');
INSERT INTO `bitacora` VALUES ('2908', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '6|11247|1', '6|11247|1');
INSERT INTO `bitacora` VALUES ('2909', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '6|11248|1', '6|11248|1');
INSERT INTO `bitacora` VALUES ('2910', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '6|11249|1', '6|11249|1');
INSERT INTO `bitacora` VALUES ('2911', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|11733|1', '2|11733|1');
INSERT INTO `bitacora` VALUES ('2912', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|11734|1', '2|11734|1');
INSERT INTO `bitacora` VALUES ('2913', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|11755|3', '2|11755|3');
INSERT INTO `bitacora` VALUES ('2914', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|11843|1', '2|11843|1');
INSERT INTO `bitacora` VALUES ('2915', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|11859|1', '2|11859|1');
INSERT INTO `bitacora` VALUES ('2916', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|11862|2', '2|11862|2');
INSERT INTO `bitacora` VALUES ('2917', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12292|3', '2|12292|3');
INSERT INTO `bitacora` VALUES ('2918', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12456|1', '2|12456|1');
INSERT INTO `bitacora` VALUES ('2919', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12457|1', '2|12457|1');
INSERT INTO `bitacora` VALUES ('2920', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12458|1', '2|12458|1');
INSERT INTO `bitacora` VALUES ('2921', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12459|1', '2|12459|1');
INSERT INTO `bitacora` VALUES ('2922', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12460|2', '2|12460|2');
INSERT INTO `bitacora` VALUES ('2923', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12461|2', '2|12461|2');
INSERT INTO `bitacora` VALUES ('2924', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12462|2', '2|12462|2');
INSERT INTO `bitacora` VALUES ('2925', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12463|2', '2|12463|2');
INSERT INTO `bitacora` VALUES ('2926', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12464|2', '2|12464|2');
INSERT INTO `bitacora` VALUES ('2927', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12465|2', '2|12465|2');
INSERT INTO `bitacora` VALUES ('2928', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12466|2', '2|12466|2');
INSERT INTO `bitacora` VALUES ('2929', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12467|2', '2|12467|2');
INSERT INTO `bitacora` VALUES ('2930', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12468|2', '2|12468|2');
INSERT INTO `bitacora` VALUES ('2931', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12469|2', '2|12469|2');
INSERT INTO `bitacora` VALUES ('2932', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12470|2', '2|12470|2');
INSERT INTO `bitacora` VALUES ('2933', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12471|2', '2|12471|2');
INSERT INTO `bitacora` VALUES ('2934', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12472|2', '2|12472|2');
INSERT INTO `bitacora` VALUES ('2935', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12473|2', '2|12473|2');
INSERT INTO `bitacora` VALUES ('2936', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12474|2', '2|12474|2');
INSERT INTO `bitacora` VALUES ('2937', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12475|2', '2|12475|2');
INSERT INTO `bitacora` VALUES ('2938', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12476|3', '2|12476|3');
INSERT INTO `bitacora` VALUES ('2939', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12477|3', '2|12477|3');
INSERT INTO `bitacora` VALUES ('2940', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12478|3', '2|12478|3');
INSERT INTO `bitacora` VALUES ('2941', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12479|2', '2|12479|2');
INSERT INTO `bitacora` VALUES ('2942', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12480|3', '2|12480|3');
INSERT INTO `bitacora` VALUES ('2943', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12481|3', '2|12481|3');
INSERT INTO `bitacora` VALUES ('2944', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|11733|1', '5|11733|1');
INSERT INTO `bitacora` VALUES ('2945', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|11734|1', '5|11734|1');
INSERT INTO `bitacora` VALUES ('2946', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|11737|2', '5|11737|2');
INSERT INTO `bitacora` VALUES ('2947', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|11755|3', '5|11755|3');
INSERT INTO `bitacora` VALUES ('2948', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|11843|1', '5|11843|1');
INSERT INTO `bitacora` VALUES ('2949', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12457|1', '5|12457|1');
INSERT INTO `bitacora` VALUES ('2950', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12458|1', '5|12458|1');
INSERT INTO `bitacora` VALUES ('2951', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12459|1', '5|12459|1');
INSERT INTO `bitacora` VALUES ('2952', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12467|2', '5|12467|2');
INSERT INTO `bitacora` VALUES ('2953', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12470|2', '5|12470|2');
INSERT INTO `bitacora` VALUES ('2954', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12472|2', '5|12472|2');
INSERT INTO `bitacora` VALUES ('2955', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12479|2', '5|12479|2');
INSERT INTO `bitacora` VALUES ('2956', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12481|3', '5|12481|3');
INSERT INTO `bitacora` VALUES ('2957', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12559|1', '5|12559|1');
INSERT INTO `bitacora` VALUES ('2958', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12560|2', '5|12560|2');
INSERT INTO `bitacora` VALUES ('2959', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12561|2', '5|12561|2');
INSERT INTO `bitacora` VALUES ('2960', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12562|2', '5|12562|2');
INSERT INTO `bitacora` VALUES ('2961', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12563|2', '5|12563|2');
INSERT INTO `bitacora` VALUES ('2962', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12564|2', '5|12564|2');
INSERT INTO `bitacora` VALUES ('2963', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12565|2', '5|12565|2');
INSERT INTO `bitacora` VALUES ('2964', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12566|2', '5|12566|2');
INSERT INTO `bitacora` VALUES ('2965', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12567|2', '5|12567|2');
INSERT INTO `bitacora` VALUES ('2966', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12568|2', '5|12568|2');
INSERT INTO `bitacora` VALUES ('2967', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12569|2', '5|12569|2');
INSERT INTO `bitacora` VALUES ('2968', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12570|2', '5|12570|2');
INSERT INTO `bitacora` VALUES ('2969', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12571|2', '5|12571|2');
INSERT INTO `bitacora` VALUES ('2970', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12572|3', '5|12572|3');
INSERT INTO `bitacora` VALUES ('2971', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12573|3', '5|12573|3');
INSERT INTO `bitacora` VALUES ('2972', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12574|3', '5|12574|3');
INSERT INTO `bitacora` VALUES ('2973', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12575|3', '5|12575|3');
INSERT INTO `bitacora` VALUES ('2974', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12576|3', '5|12576|3');
INSERT INTO `bitacora` VALUES ('2975', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12578|3', '5|12578|3');
INSERT INTO `bitacora` VALUES ('2976', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12579|3', '5|12579|3');
INSERT INTO `bitacora` VALUES ('2977', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '6|11236|1', '6|11236|1');
INSERT INTO `bitacora` VALUES ('2978', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '6|11237|1', '6|11237|1');
INSERT INTO `bitacora` VALUES ('2979', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '6|11238|1', '6|11238|1');
INSERT INTO `bitacora` VALUES ('2980', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '6|11239|1', '6|11239|1');
INSERT INTO `bitacora` VALUES ('2981', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '6|11240|1', '6|11240|1');
INSERT INTO `bitacora` VALUES ('2982', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '6|11241|1', '6|11241|1');
INSERT INTO `bitacora` VALUES ('2983', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '6|11242|1', '6|11242|1');
INSERT INTO `bitacora` VALUES ('2984', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '6|11243|1', '6|11243|1');
INSERT INTO `bitacora` VALUES ('2985', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '6|11244|1', '6|11244|1');
INSERT INTO `bitacora` VALUES ('2986', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '6|11245|1', '6|11245|1');
INSERT INTO `bitacora` VALUES ('2987', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '6|11246|1', '6|11246|1');
INSERT INTO `bitacora` VALUES ('2988', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '6|11247|1', '6|11247|1');
INSERT INTO `bitacora` VALUES ('2989', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '6|11248|1', '6|11248|1');
INSERT INTO `bitacora` VALUES ('2990', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '6|11249|1', '6|11249|1');
INSERT INTO `bitacora` VALUES ('2991', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|11761|2', '2|11761|2');
INSERT INTO `bitacora` VALUES ('2992', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12482|3', '2|12482|3');
INSERT INTO `bitacora` VALUES ('2993', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12483|1', '2|12483|1');
INSERT INTO `bitacora` VALUES ('2994', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12484|1', '2|12484|1');
INSERT INTO `bitacora` VALUES ('2995', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12485|1', '2|12485|1');
INSERT INTO `bitacora` VALUES ('2996', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12486|1', '2|12486|1');
INSERT INTO `bitacora` VALUES ('2997', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12487|2', '2|12487|2');
INSERT INTO `bitacora` VALUES ('2998', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12488|2', '2|12488|2');
INSERT INTO `bitacora` VALUES ('2999', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12489|2', '2|12489|2');
INSERT INTO `bitacora` VALUES ('3000', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12490|2', '2|12490|2');
INSERT INTO `bitacora` VALUES ('3001', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12491|2', '2|12491|2');
INSERT INTO `bitacora` VALUES ('3002', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12492|2', '2|12492|2');
INSERT INTO `bitacora` VALUES ('3003', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12493|3', '2|12493|3');
INSERT INTO `bitacora` VALUES ('3004', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12494|3', '2|12494|3');
INSERT INTO `bitacora` VALUES ('3005', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12495|3', '2|12495|3');
INSERT INTO `bitacora` VALUES ('3006', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12496|3', '2|12496|3');
INSERT INTO `bitacora` VALUES ('3007', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12497|3', '2|12497|3');
INSERT INTO `bitacora` VALUES ('3008', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12498|3', '2|12498|3');
INSERT INTO `bitacora` VALUES ('3009', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12499|3', '2|12499|3');
INSERT INTO `bitacora` VALUES ('3010', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12500|3', '2|12500|3');
INSERT INTO `bitacora` VALUES ('3011', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '2|12501|3', '2|12501|3');
INSERT INTO `bitacora` VALUES ('3012', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12492|2', '5|12492|2');
INSERT INTO `bitacora` VALUES ('3013', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12581|2', '5|12581|2');
INSERT INTO `bitacora` VALUES ('3014', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12582|2', '5|12582|2');
INSERT INTO `bitacora` VALUES ('3015', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12583|2', '5|12583|2');
INSERT INTO `bitacora` VALUES ('3016', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12584|2', '5|12584|2');
INSERT INTO `bitacora` VALUES ('3017', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12585|2', '5|12585|2');
INSERT INTO `bitacora` VALUES ('3018', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12586|3', '5|12586|3');
INSERT INTO `bitacora` VALUES ('3019', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12587|3', '5|12587|3');
INSERT INTO `bitacora` VALUES ('3020', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12588|3', '5|12588|3');
INSERT INTO `bitacora` VALUES ('3021', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12589|3', '5|12589|3');
INSERT INTO `bitacora` VALUES ('3022', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12590|3', '5|12590|3');
INSERT INTO `bitacora` VALUES ('3023', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12591|3', '5|12591|3');
INSERT INTO `bitacora` VALUES ('3024', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12592|3', '5|12592|3');
INSERT INTO `bitacora` VALUES ('3025', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12593|3', '5|12593|3');
INSERT INTO `bitacora` VALUES ('3026', 'p_ua', '1', 'U', '2014-12-23 00:00:00', '5|12594|3', '5|12594|3');
INSERT INTO `bitacora` VALUES ('3027', 'programaedu', '10', 'U', '2015-01-15 00:00:00', '6|TRONCO COMUN|TC|1|9|1|1|1', '6|TRONCO COMUN||1|9|1|1|1');
INSERT INTO `bitacora` VALUES ('3028', 'programaedu', '10', 'U', '2015-01-15 00:00:00', '2|LICENCIATURA EN ADMON. DE EMPRESAS|LAE|1|9|1|1|1', '2|LICENCIATURA EN ADMON. DE EMPRESAS||1|9|1|1|1');
INSERT INTO `bitacora` VALUES ('3029', 'programaedu', '10', 'U', '2015-01-15 00:00:00', '3|LICENCIATURA EN INFORMATICA|LI|1|9|1|1|1', '3|LICENCIATURA EN INFORMATICA||1|9|1|1|1');
INSERT INTO `bitacora` VALUES ('3030', 'programaedu', '10', 'U', '2015-01-15 00:00:00', '4|LICENCIATURA EN NEGOCIOS INTERNACIONALES|LNI|1|9|1|1|1', '4|LICENCIATURA EN NEGOCIOS INTERNACIONALES||1|9|1|1|1');
INSERT INTO `bitacora` VALUES ('3031', 'programaedu', '10', 'U', '2015-01-15 00:00:00', '5|LICENCIATURA EN CONTADURIA|LC|1|9|1|1|1', '5|LICENCIATURA EN CONTADURIA||1|9|1|1|1');
INSERT INTO `bitacora` VALUES ('3032', 'reqseriacion', '1', 'U', '2015-01-15 00:00:00', '1|OBLIGATORI', '1|SIN SERIACION');
INSERT INTO `bitacora` VALUES ('3033', 'reqseriacion', '1', 'U', '2015-01-15 00:00:00', '2|CONVENIENTE', '2|OBLIGATORIA');
INSERT INTO `bitacora` VALUES ('3034', 'reqseriacion', '1', 'D', '2015-01-15 00:00:00', null, '3|SUGERIDA');
INSERT INTO `bitacora` VALUES ('3035', 'reqseriacion', '1', 'U', '2015-01-15 00:00:00', '1|OBLIGATORIA', '1|OBLIGATORI');
INSERT INTO `bitacora` VALUES ('3036', 'detalleseriacion', '1', 'D', '2015-01-15 00:00:00', null, '12481|2|12479|2');
INSERT INTO `bitacora` VALUES ('3037', 'detalleseriacion', '1', 'D', '2015-01-15 00:00:00', null, '12479|2|12470|2');
INSERT INTO `bitacora` VALUES ('3038', 'detalleseriacion', '1', 'D', '2015-01-15 00:00:00', null, '12479|2|11248|1');
INSERT INTO `bitacora` VALUES ('3039', 'detalleseriacion', '1', 'D', '2015-01-15 00:00:00', null, '12479|2|11236|1');
INSERT INTO `bitacora` VALUES ('3040', 'detalleseriacion', '1', 'D', '2015-01-15 00:00:00', null, '12470|2|12467|2');
INSERT INTO `bitacora` VALUES ('3041', 'detalleseriacion', '1', 'D', '2015-01-15 00:00:00', null, '12468|2|11862|2');
INSERT INTO `bitacora` VALUES ('3042', 'detalleseriacion', '1', 'D', '2015-01-15 00:00:00', null, '12467|2|11733|2');
INSERT INTO `bitacora` VALUES ('3043', 'detalleseriacion', '1', 'D', '2015-01-15 00:00:00', null, '12464|2|11859|2');
INSERT INTO `bitacora` VALUES ('3044', 'detalleseriacion', '1', 'D', '2015-01-15 00:00:00', null, '12463|2|12457|2');
INSERT INTO `bitacora` VALUES ('3045', 'detalleseriacion', '1', 'D', '2015-01-15 00:00:00', null, '12460|2|12458|2');
INSERT INTO `bitacora` VALUES ('3046', 'detalleseriacion', '1', 'D', '2015-01-15 00:00:00', null, '12458|2|11243|2');
INSERT INTO `bitacora` VALUES ('3047', 'detalleseriacion', '1', 'D', '2015-01-15 00:00:00', null, '12457|2|11843|1');
INSERT INTO `bitacora` VALUES ('3048', 'detalleseriacion', '1', 'D', '2015-01-15 00:00:00', null, '12457|2|11248|2');
INSERT INTO `bitacora` VALUES ('3049', 'detalleseriacion', '1', 'D', '2015-01-15 00:00:00', null, '11243|2|11237|2');
INSERT INTO `bitacora` VALUES ('3050', 'programaedu', '10', 'I', '2015-01-15 00:00:00', '1|ARTES|LA|1|9|1|1|1', null);
INSERT INTO `bitacora` VALUES ('3051', 'programaedu', '10', 'U', '2015-01-15 00:00:00', '2|ADMON. DE EMPRESAS|LAE|1|1|1|1', '2|LICENCIATURA EN ADMON. DE EMPRESAS|LAE|1|1|1|1');
INSERT INTO `bitacora` VALUES ('3052', 'programaedu', '10', 'U', '2015-01-15 00:00:00', '3|INFORMATICA|LI|1|1|1|1', '3|LICENCIATURA EN INFORMATICA|LI|1|1|1|1');
INSERT INTO `bitacora` VALUES ('3053', 'programaedu', '10', 'U', '2015-01-15 00:00:00', '4|NEGOCIOS INTERNACIONALES|LNI|1|1|1|1', '4|LICENCIATURA EN NEGOCIOS INTERNACIONALES|LNI|1|1|1|1');
INSERT INTO `bitacora` VALUES ('3054', 'programaedu', '10', 'U', '2015-01-15 00:00:00', '5|CONTADURIA|LC|1|1|1|1', '5|LICENCIATURA EN CONTADURIA|LC|1|1|1|1');
INSERT INTO `bitacora` VALUES ('3055', 'programaedu', '1', 'I', '2015-01-15 00:00:00', '7|SISTEMAS COMPUTACIONALES|LSC|1|2|1|1', null);
INSERT INTO `bitacora` VALUES ('3056', 'programaedu', '1', 'U', '2015-01-15 00:00:00', '7|SISTEMAS COMPUTACIONALES|LSC|1|1|1|1', '7|SISTEMAS COMPUTACIONALES|LSC|1|2|1|1');
INSERT INTO `bitacora` VALUES ('3057', 'uaprendizaje', '9', 'D', '2015-01-15 00:00:00', null, '20002|esto es una prueba|1|1|1|1|1|1|1|esto es una prueba|1|20092');
INSERT INTO `bitacora` VALUES ('3058', 'uaprendizaje', '1', 'D', '2015-01-15 00:00:00', null, '20001|prueba|1|1|1|1|1|1|1|2014-07-01|esto es una prueba|1|20092');
INSERT INTO `bitacora` VALUES ('3059', 'uaprendizaje', '1', 'D', '2015-01-15 00:00:00', null, '20000|prueba|1|1|1|1|1|1|1|2014-07-01|Esta ua es una prueba|1|20092');
INSERT INTO `bitacora` VALUES ('3060', 'plan_programa', '1', 'I', '2015-01-15 00:00:00', '20092|1', null);
INSERT INTO `bitacora` VALUES ('3061', 'plan_programa', '1', 'I', '2015-01-15 00:00:00', '20092|7', null);
INSERT INTO `bitacora` VALUES ('3062', 'coordinaciona', '11', 'U', '2015-01-15 00:00:00', '1|CONTABILIDAD BASICA|6', '1|COORD. CONTABILIDAD BASICA (LIC. EN CONTADURI|6');
INSERT INTO `bitacora` VALUES ('3063', 'coordinaciona', '11', 'U', '2015-01-15 00:00:00', '2|CONTABILIDAD AVANZADA|6', '2|COORD. CONTABILIDAD AVANZADA (LIC. EN CONTADU|6');
INSERT INTO `bitacora` VALUES ('3064', 'coordinaciona', '11', 'U', '2015-01-15 00:00:00', '3|CONTABILIDAD DE COSTOS|6', '3|COORD. CONTABILIDAD DE COSTOS (LIC. EN CONTAD|6');
INSERT INTO `bitacora` VALUES ('3065', 'coordinaciona', '11', 'U', '2015-01-15 00:00:00', '4|COORD. FINANZAS|6', '4|COORD. FINANZAS (LIC. EN CONTADURIA)|6');
INSERT INTO `bitacora` VALUES ('3066', 'coordinaciona', '11', 'U', '2015-01-15 00:00:00', '5|COORD. AIDITORIA|6', '5|COORD. AIDITORIA (LIC. EN CONTADURIA)|6');
INSERT INTO `bitacora` VALUES ('3067', 'coordinaciona', '11', 'U', '2015-01-15 00:00:00', '6|COORD. IMPUESTOS|6', '6|COORD. IMPUESTOS (LIC. EN CONTADURIA)|6');
INSERT INTO `bitacora` VALUES ('3068', 'coordinaciona', '11', 'U', '2015-01-15 00:00:00', '7|COORD. MERCADOTECNIA|6', '7|COORD. MERCADOTECNIA (LIC. EN ADMON. DE EMPRE|6');
INSERT INTO `bitacora` VALUES ('3069', 'coordinaciona', '11', 'U', '2015-01-15 00:00:00', '8|COORD. RECURSOS HUMANOS|6', '8|COORD. RECURSOS HUMANOS (LIC. EN ADMON. DE EM|6');
INSERT INTO `bitacora` VALUES ('3070', 'coordinaciona', '11', 'U', '2015-01-15 00:00:00', '9|COORD. PRODUCCION|6', '9|COORD. PRODUCCION (LIC. EN ADMON. DE EMPRESAS|6');
INSERT INTO `bitacora` VALUES ('3071', 'coordinaciona', '11', 'U', '2015-01-15 00:00:00', '10|COORD. ADMINISTRACION BASICA|6', '10|COORD. ADMINISTRACION BASICA (LIC. EN ADMON. |6');
INSERT INTO `bitacora` VALUES ('3072', 'coordinaciona', '11', 'U', '2015-01-15 00:00:00', '11|COORD. ADMINISTRACION AVANZADA|6', '11|COORD. ADMINISTRACION AVANZADA (LIC. EN ADMON|6');
INSERT INTO `bitacora` VALUES ('3073', 'coordinaciona', '11', 'U', '2015-01-15 00:00:00', '12|COORD. INFORMATICA|6', '12|COORD. INFORMATICA (LIC. EN INFORMATICA) |6');
INSERT INTO `bitacora` VALUES ('3074', 'coordinaciona', '11', 'U', '2015-01-15 00:00:00', '13|COORD. MATEMATICAS|6', '13|COORD. MATEMATICAS (LIC. EN INFORMATICA)|6');
INSERT INTO `bitacora` VALUES ('3075', 'coordinaciona', '11', 'U', '2015-01-15 00:00:00', '14|COORD. CIENCIAS COMPUTACIONALES|6', '14|COORD. CIENCIAS COMPUTACIONALES (LIC. EN INFO|6');
INSERT INTO `bitacora` VALUES ('3076', 'coordinaciona', '11', 'U', '2015-01-15 00:00:00', '15|COORD. SISTEMAS DE INFORMACION|6', '15|COORD. SISTEMAS DE INFORMACION (LIC. EN INFOR|6');
INSERT INTO `bitacora` VALUES ('3077', 'coordinaciona', '11', 'U', '2015-01-15 00:00:00', '16|COORD. PROGRAMACION|6', '16|COORD. PROGRAMACION (LIC. EN INFORMATICA)|6');
INSERT INTO `bitacora` VALUES ('3078', 'coordinaciona', '11', 'U', '2015-01-15 00:00:00', '17|COORD. ECONOMIA|6', '17|COORD. ECONOMIA (LIC. EN NEGOCIOS INTERNACION|6');
INSERT INTO `bitacora` VALUES ('3079', 'coordinaciona', '11', 'U', '2015-01-15 00:00:00', '18|COORD. COMERCIO EXTERIOR|6', '18|COORD. COMERCIO EXTERIOR (LIC. EN NEGOCIOS IN|6');
INSERT INTO `bitacora` VALUES ('3080', 'coordinaciona', '11', 'U', '2015-01-15 00:00:00', '19|COORD. DERECHO|6', '19|COORD. DERECHO (LIC. EN NEGOCIOS INTERNACIONA|6');
INSERT INTO `bitacora` VALUES ('3081', 'coordinaciona', '11', 'U', '2015-01-15 00:00:00', '20|COORD. EMPRENDEDORES|6', '20|COORD. EMPRENDEDORES(LIC. EN NEGOCIOS INTERNA|6');
INSERT INTO `bitacora` VALUES ('3082', 'coordinaciona', '11', 'U', '2015-01-15 00:00:00', '21|COORD. ASIGNATURAS DE APOYO|6', '21|COORD. ASIGNATURAS DE APOYO (LIC. EN NEGOCIOS|6');
INSERT INTO `bitacora` VALUES ('3083', 'coordinaciona', '11', 'U', '2015-01-15 00:00:00', '4|FINANZAS|6', '4|COORD. FINANZAS|6');
INSERT INTO `bitacora` VALUES ('3084', 'coordinaciona', '11', 'U', '2015-01-15 00:00:00', '5|AUDITORIA|6', '5|COORD. AIDITORIA|6');
INSERT INTO `bitacora` VALUES ('3085', 'coordinaciona', '11', 'U', '2015-01-15 00:00:00', '6|IMPUESTOS|6', '6|COORD. IMPUESTOS|6');
INSERT INTO `bitacora` VALUES ('3086', 'coordinaciona', '11', 'U', '2015-01-15 00:00:00', '7|MERCADOTECNIA|6', '7|COORD. MERCADOTECNIA|6');
INSERT INTO `bitacora` VALUES ('3087', 'coordinaciona', '11', 'U', '2015-01-15 00:00:00', '8|RECURSOS HUMANOS|6', '8|COORD. RECURSOS HUMANOS|6');
INSERT INTO `bitacora` VALUES ('3088', 'coordinaciona', '11', 'U', '2015-01-15 00:00:00', '9|PRODUCCION|6', '9|COORD. PRODUCCION|6');
INSERT INTO `bitacora` VALUES ('3089', 'coordinaciona', '11', 'U', '2015-01-15 00:00:00', '10|ADMINISTRACION BASICA|6', '10|COORD. ADMINISTRACION BASICA|6');
INSERT INTO `bitacora` VALUES ('3090', 'coordinaciona', '11', 'U', '2015-01-15 00:00:00', '11|ADMINISTRACION AVANZADA|6', '11|COORD. ADMINISTRACION AVANZADA|6');
INSERT INTO `bitacora` VALUES ('3091', 'coordinaciona', '11', 'U', '2015-01-15 00:00:00', '12|INFORMATICA|6', '12|COORD. INFORMATICA|6');
INSERT INTO `bitacora` VALUES ('3092', 'coordinaciona', '11', 'U', '2015-01-15 00:00:00', '13|MATEMATICAS|6', '13|COORD. MATEMATICAS|6');
INSERT INTO `bitacora` VALUES ('3093', 'coordinaciona', '11', 'U', '2015-01-15 00:00:00', '14|CIENCIAS COMPUTACIONALES|6', '14|COORD. CIENCIAS COMPUTACIONALES|6');
INSERT INTO `bitacora` VALUES ('3094', 'coordinaciona', '11', 'U', '2015-01-15 00:00:00', '15|SISTEMAS DE INFORMACION|6', '15|COORD. SISTEMAS DE INFORMACION|6');
INSERT INTO `bitacora` VALUES ('3095', 'coordinaciona', '11', 'U', '2015-01-15 00:00:00', '16|PROGRAMACION|6', '16|COORD. PROGRAMACION|6');
INSERT INTO `bitacora` VALUES ('3096', 'coordinaciona', '11', 'U', '2015-01-15 00:00:00', '17|ECONOMIA|6', '17|COORD. ECONOMIA|6');
INSERT INTO `bitacora` VALUES ('3097', 'coordinaciona', '11', 'U', '2015-01-15 00:00:00', '18|COMERCIO EXTERIOR|6', '18|COORD. COMERCIO EXTERIOR|6');
INSERT INTO `bitacora` VALUES ('3098', 'coordinaciona', '11', 'U', '2015-01-15 00:00:00', '19|DERECHO|6', '19|COORD. DERECHO|6');
INSERT INTO `bitacora` VALUES ('3099', 'coordinaciona', '11', 'U', '2015-01-15 00:00:00', '20|EMPRENDEDORES|6', '20|COORD. EMPRENDEDORES|6');
INSERT INTO `bitacora` VALUES ('3100', 'coordinaciona', '11', 'U', '2015-01-15 00:00:00', '21|ASIGNATURAS DE APOYO|6', '21|COORD. ASIGNATURAS DE APOYO|6');
INSERT INTO `bitacora` VALUES ('3101', 'programaedu', '10', 'U', '2015-01-15 00:00:00', '6|TRONCO COMÚN|TC|1|1|1|1', '6|TRONCO COMUN|TC|1|1|1|1');
INSERT INTO `bitacora` VALUES ('3102', 'programaedu', '10', 'U', '2015-01-15 00:00:00', '3|INFORMÁTICA|LI|1|1|1|1', '3|INFORMATICA|LI|1|1|1|1');

-- ----------------------------
-- Table structure for campus
-- ----------------------------
DROP TABLE IF EXISTS `campus`;
CREATE TABLE `campus` (
  `campus` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo campus (1,2,3,4)',
  `descripcion` varchar(100) NOT NULL COMMENT 'Descripcion CAMPUS ()',
  `direccion` varchar(60) DEFAULT NULL COMMENT 'Direccion CAMPUS',
  `ciudad` int(11) NOT NULL DEFAULT '16' COMMENT 'Codigo ciudad',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`campus`),
  UNIQUE KEY `CM_codigo_UNIQUE` (`campus`),
  KEY `fk_campus_ciudad1_idx` (`ciudad`),
  KEY `fk_campus_users1_idx` (`users_id`),
  CONSTRAINT `fk_campus_ciudad1` FOREIGN KEY (`ciudad`) REFERENCES `ciudad` (`ciudad`),
  CONSTRAINT `fk_campus_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='<double-click to overwrite multiple objects>';

-- ----------------------------
-- Records of campus
-- ----------------------------
INSERT INTO `campus` VALUES ('1', 'TIJUANA UNIDAD OTAY', 'CALZADA UNIVERSIDAD 14418 PARQUE INDUSTRIAL INTERNACIONAL TI', '16', '1');
INSERT INTO `campus` VALUES ('2', 'TIJUANA UNIDAD TECATE', 'CALZADA UNIVERSIDAD NO.1 FRACC. SAN FERNANDO. C.P. 21460', '16', '1');
INSERT INTO `campus` VALUES ('3', 'TIJUANA UNIDAD ROSARITO', 'BLVD. MARIANO VERDUGO NORTE ENTRE CALLE ISLA LOBO VERACRUZ Y', '16', '1');
INSERT INTO `campus` VALUES ('4', 'TIJUANA UNIDAD VALLE DE LAS PALMAS', 'BLVD. UNIVERSITARIO #1000', '16', '1');

-- ----------------------------
-- Table structure for caracter
-- ----------------------------
DROP TABLE IF EXISTS `caracter`;
CREATE TABLE `caracter` (
  `caracter` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Caracter de materia uaprendizaje (1,2)',
  `descripcion` varchar(15) NOT NULL COMMENT 'Obligatoria, Optativa',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`caracter`),
  UNIQUE KEY `CAR_codigo_UNIQUE` (`caracter`),
  KEY `fk_caracter_users1_idx` (`users_id`),
  CONSTRAINT `fk_caracter_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='<double-click to overwrite multiple objects>';

-- ----------------------------
-- Records of caracter
-- ----------------------------
INSERT INTO `caracter` VALUES ('1', 'OBLIGATORIA', '1');
INSERT INTO `caracter` VALUES ('2', 'OPTATIVA', '1');

-- ----------------------------
-- Table structure for caracteristica_cur
-- ----------------------------
DROP TABLE IF EXISTS `caracteristica_cur`;
CREATE TABLE `caracteristica_cur` (
  `caracteristica_cur` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Consec Característica',
  `descripcion` varchar(45) NOT NULL COMMENT 'Desc Curso:',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`caracteristica_cur`),
  UNIQUE KEY `caracteristica_cur_UNIQUE` (`caracteristica_cur`),
  KEY `fk_caracteristica_cur_users1_idx` (`users_id`),
  CONSTRAINT `fk_caracteristica_cur_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of caracteristica_cur
-- ----------------------------
INSERT INTO `caracteristica_cur` VALUES ('1', 'CURSO', '1');
INSERT INTO `caracteristica_cur` VALUES ('2', 'CONGRESO', '1');
INSERT INTO `caracteristica_cur` VALUES ('3', 'TALLER', '1');

-- ----------------------------
-- Table structure for carga
-- ----------------------------
DROP TABLE IF EXISTS `carga`;
CREATE TABLE `carga` (
  `grupo` int(11) NOT NULL COMMENT 'Código grupo',
  `periodo` int(11) NOT NULL COMMENT 'Periodo de trabajo(Año 4 digitos+ semestre o cuatrim) ej. 20091,20092',
  `programaedu` int(11) NOT NULL,
  `uaprendizaje` int(11) NOT NULL,
  `semestre` int(11) NOT NULL COMMENT 'Semestre',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`grupo`,`periodo`,`programaedu`,`uaprendizaje`),
  KEY `fk_carga_users1_idx` (`users_id`),
  KEY `fk_carga_p_ua1_idx` (`programaedu`,`uaprendizaje`),
  KEY `fk_carga_grupos1_idx` (`grupo`,`periodo`),
  CONSTRAINT `fk_carga_grupos1` FOREIGN KEY (`grupo`, `periodo`) REFERENCES `grupos` (`grupo`, `periodo`),
  CONSTRAINT `fk_carga_p_ua1` FOREIGN KEY (`programaedu`, `uaprendizaje`) REFERENCES `p_ua` (`programaedu`, `uaprendizaje`),
  CONSTRAINT `fk_carga_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of carga
-- ----------------------------
INSERT INTO `carga` VALUES ('231', '20151', '2', '11734', '3', '1');
INSERT INTO `carga` VALUES ('231', '20151', '2', '11843', '3', '1');
INSERT INTO `carga` VALUES ('231', '20151', '2', '11859', '3', '1');
INSERT INTO `carga` VALUES ('231', '20151', '2', '12456', '3', '1');
INSERT INTO `carga` VALUES ('231', '20151', '2', '12457', '3', '1');
INSERT INTO `carga` VALUES ('231', '20151', '2', '12458', '3', '1');
INSERT INTO `carga` VALUES ('231', '20151', '2', '12459', '3', '1');
INSERT INTO `carga` VALUES ('232', '20151', '2', '11734', '3', '1');
INSERT INTO `carga` VALUES ('232', '20151', '2', '11843', '3', '1');
INSERT INTO `carga` VALUES ('232', '20151', '2', '11859', '3', '1');
INSERT INTO `carga` VALUES ('232', '20151', '2', '12456', '3', '1');
INSERT INTO `carga` VALUES ('232', '20151', '2', '12457', '3', '1');
INSERT INTO `carga` VALUES ('232', '20151', '2', '12458', '3', '1');
INSERT INTO `carga` VALUES ('232', '20151', '2', '12459', '3', '1');
INSERT INTO `carga` VALUES ('233', '20151', '2', '11734', '3', '1');
INSERT INTO `carga` VALUES ('233', '20151', '2', '11843', '3', '1');
INSERT INTO `carga` VALUES ('233', '20151', '2', '11859', '3', '1');
INSERT INTO `carga` VALUES ('233', '20151', '2', '12456', '3', '1');
INSERT INTO `carga` VALUES ('233', '20151', '2', '12457', '3', '1');
INSERT INTO `carga` VALUES ('233', '20151', '2', '12458', '3', '1');
INSERT INTO `carga` VALUES ('233', '20151', '2', '12459', '3', '1');
INSERT INTO `carga` VALUES ('234', '20151', '2', '11734', '3', '1');
INSERT INTO `carga` VALUES ('234', '20151', '2', '11843', '3', '1');
INSERT INTO `carga` VALUES ('234', '20151', '2', '11859', '3', '1');
INSERT INTO `carga` VALUES ('234', '20151', '2', '12456', '3', '1');
INSERT INTO `carga` VALUES ('234', '20151', '2', '12457', '3', '1');
INSERT INTO `carga` VALUES ('234', '20151', '2', '12458', '3', '1');
INSERT INTO `carga` VALUES ('234', '20151', '2', '12459', '3', '1');
INSERT INTO `carga` VALUES ('235', '20151', '2', '11734', '3', '1');
INSERT INTO `carga` VALUES ('235', '20151', '2', '11843', '3', '1');
INSERT INTO `carga` VALUES ('235', '20151', '2', '11859', '3', '1');
INSERT INTO `carga` VALUES ('235', '20151', '2', '12456', '3', '1');
INSERT INTO `carga` VALUES ('235', '20151', '2', '12457', '3', '1');
INSERT INTO `carga` VALUES ('235', '20151', '2', '12458', '3', '1');
INSERT INTO `carga` VALUES ('235', '20151', '2', '12459', '3', '1');
INSERT INTO `carga` VALUES ('236', '20151', '2', '11734', '3', '1');
INSERT INTO `carga` VALUES ('236', '20151', '2', '11843', '3', '1');
INSERT INTO `carga` VALUES ('236', '20151', '2', '11859', '3', '1');
INSERT INTO `carga` VALUES ('236', '20151', '2', '12456', '3', '1');
INSERT INTO `carga` VALUES ('236', '20151', '2', '12457', '3', '1');
INSERT INTO `carga` VALUES ('236', '20151', '2', '12458', '3', '1');
INSERT INTO `carga` VALUES ('236', '20151', '2', '12459', '3', '1');
INSERT INTO `carga` VALUES ('241', '20151', '2', '11733', '4', '1');
INSERT INTO `carga` VALUES ('241', '20151', '2', '11761', '4', '1');
INSERT INTO `carga` VALUES ('241', '20151', '2', '11862', '4', '1');
INSERT INTO `carga` VALUES ('241', '20151', '2', '12460', '4', '1');
INSERT INTO `carga` VALUES ('241', '20151', '2', '12461', '4', '1');
INSERT INTO `carga` VALUES ('241', '20151', '2', '12462', '4', '1');
INSERT INTO `carga` VALUES ('241', '20151', '2', '12463', '4', '1');
INSERT INTO `carga` VALUES ('241', '20151', '2', '12464', '4', '1');
INSERT INTO `carga` VALUES ('241', '20151', '2', '12487', '4', '1');
INSERT INTO `carga` VALUES ('241', '20151', '2', '12492', '4', '1');
INSERT INTO `carga` VALUES ('242', '20151', '2', '11733', '4', '1');
INSERT INTO `carga` VALUES ('242', '20151', '2', '11761', '4', '1');
INSERT INTO `carga` VALUES ('242', '20151', '2', '11862', '4', '1');
INSERT INTO `carga` VALUES ('242', '20151', '2', '12460', '4', '1');
INSERT INTO `carga` VALUES ('242', '20151', '2', '12461', '4', '1');
INSERT INTO `carga` VALUES ('242', '20151', '2', '12462', '4', '1');
INSERT INTO `carga` VALUES ('242', '20151', '2', '12463', '4', '1');
INSERT INTO `carga` VALUES ('242', '20151', '2', '12464', '4', '1');
INSERT INTO `carga` VALUES ('242', '20151', '2', '12487', '4', '1');
INSERT INTO `carga` VALUES ('242', '20151', '2', '12492', '4', '1');
INSERT INTO `carga` VALUES ('243', '20151', '2', '11733', '4', '1');
INSERT INTO `carga` VALUES ('243', '20151', '2', '11761', '4', '1');
INSERT INTO `carga` VALUES ('243', '20151', '2', '11862', '4', '1');
INSERT INTO `carga` VALUES ('243', '20151', '2', '12460', '4', '1');
INSERT INTO `carga` VALUES ('243', '20151', '2', '12461', '4', '1');
INSERT INTO `carga` VALUES ('243', '20151', '2', '12462', '4', '1');
INSERT INTO `carga` VALUES ('243', '20151', '2', '12463', '4', '1');
INSERT INTO `carga` VALUES ('243', '20151', '2', '12464', '4', '1');
INSERT INTO `carga` VALUES ('243', '20151', '2', '12487', '4', '1');
INSERT INTO `carga` VALUES ('243', '20151', '2', '12492', '4', '1');
INSERT INTO `carga` VALUES ('244', '20151', '2', '11733', '4', '1');
INSERT INTO `carga` VALUES ('244', '20151', '2', '11761', '4', '1');
INSERT INTO `carga` VALUES ('244', '20151', '2', '11862', '4', '1');
INSERT INTO `carga` VALUES ('244', '20151', '2', '12460', '4', '1');
INSERT INTO `carga` VALUES ('244', '20151', '2', '12461', '4', '1');
INSERT INTO `carga` VALUES ('244', '20151', '2', '12462', '4', '1');
INSERT INTO `carga` VALUES ('244', '20151', '2', '12463', '4', '1');
INSERT INTO `carga` VALUES ('244', '20151', '2', '12464', '4', '1');
INSERT INTO `carga` VALUES ('244', '20151', '2', '12487', '4', '1');
INSERT INTO `carga` VALUES ('244', '20151', '2', '12492', '4', '1');
INSERT INTO `carga` VALUES ('245', '20151', '2', '11733', '4', '1');
INSERT INTO `carga` VALUES ('245', '20151', '2', '11761', '4', '1');
INSERT INTO `carga` VALUES ('245', '20151', '2', '11862', '4', '1');
INSERT INTO `carga` VALUES ('245', '20151', '2', '12460', '4', '1');
INSERT INTO `carga` VALUES ('245', '20151', '2', '12461', '4', '1');
INSERT INTO `carga` VALUES ('245', '20151', '2', '12462', '4', '1');
INSERT INTO `carga` VALUES ('245', '20151', '2', '12463', '4', '1');
INSERT INTO `carga` VALUES ('245', '20151', '2', '12464', '4', '1');
INSERT INTO `carga` VALUES ('245', '20151', '2', '12487', '4', '1');
INSERT INTO `carga` VALUES ('245', '20151', '2', '12492', '4', '1');
INSERT INTO `carga` VALUES ('246', '20151', '2', '11733', '4', '1');
INSERT INTO `carga` VALUES ('246', '20151', '2', '11761', '4', '1');
INSERT INTO `carga` VALUES ('246', '20151', '2', '11862', '4', '1');
INSERT INTO `carga` VALUES ('246', '20151', '2', '12460', '4', '1');
INSERT INTO `carga` VALUES ('246', '20151', '2', '12461', '4', '1');
INSERT INTO `carga` VALUES ('246', '20151', '2', '12462', '4', '1');
INSERT INTO `carga` VALUES ('246', '20151', '2', '12463', '4', '1');
INSERT INTO `carga` VALUES ('246', '20151', '2', '12464', '4', '1');
INSERT INTO `carga` VALUES ('246', '20151', '2', '12487', '4', '1');
INSERT INTO `carga` VALUES ('246', '20151', '2', '12492', '4', '1');
INSERT INTO `carga` VALUES ('251', '20151', '2', '11761', '5', '1');
INSERT INTO `carga` VALUES ('251', '20151', '2', '12465', '5', '1');
INSERT INTO `carga` VALUES ('251', '20151', '2', '12466', '5', '1');
INSERT INTO `carga` VALUES ('251', '20151', '2', '12467', '5', '1');
INSERT INTO `carga` VALUES ('251', '20151', '2', '12468', '5', '1');
INSERT INTO `carga` VALUES ('251', '20151', '2', '12469', '5', '1');
INSERT INTO `carga` VALUES ('251', '20151', '2', '12487', '5', '1');
INSERT INTO `carga` VALUES ('251', '20151', '2', '12489', '5', '1');
INSERT INTO `carga` VALUES ('251', '20151', '2', '12490', '5', '1');
INSERT INTO `carga` VALUES ('251', '20151', '2', '12492', '5', '1');
INSERT INTO `carga` VALUES ('252', '20151', '2', '11761', '5', '1');
INSERT INTO `carga` VALUES ('252', '20151', '2', '12465', '5', '1');
INSERT INTO `carga` VALUES ('252', '20151', '2', '12466', '5', '1');
INSERT INTO `carga` VALUES ('252', '20151', '2', '12467', '5', '1');
INSERT INTO `carga` VALUES ('252', '20151', '2', '12468', '5', '1');
INSERT INTO `carga` VALUES ('252', '20151', '2', '12469', '5', '1');
INSERT INTO `carga` VALUES ('252', '20151', '2', '12487', '5', '1');
INSERT INTO `carga` VALUES ('252', '20151', '2', '12489', '5', '1');
INSERT INTO `carga` VALUES ('252', '20151', '2', '12490', '5', '1');
INSERT INTO `carga` VALUES ('252', '20151', '2', '12492', '5', '1');
INSERT INTO `carga` VALUES ('253', '20151', '2', '11761', '5', '1');
INSERT INTO `carga` VALUES ('253', '20151', '2', '12465', '5', '1');
INSERT INTO `carga` VALUES ('253', '20151', '2', '12466', '5', '1');
INSERT INTO `carga` VALUES ('253', '20151', '2', '12467', '5', '1');
INSERT INTO `carga` VALUES ('253', '20151', '2', '12468', '5', '1');
INSERT INTO `carga` VALUES ('253', '20151', '2', '12469', '5', '1');
INSERT INTO `carga` VALUES ('253', '20151', '2', '12487', '5', '1');
INSERT INTO `carga` VALUES ('253', '20151', '2', '12489', '5', '1');
INSERT INTO `carga` VALUES ('253', '20151', '2', '12490', '5', '1');
INSERT INTO `carga` VALUES ('253', '20151', '2', '12492', '5', '1');
INSERT INTO `carga` VALUES ('254', '20151', '2', '11761', '5', '1');
INSERT INTO `carga` VALUES ('254', '20151', '2', '12465', '5', '1');
INSERT INTO `carga` VALUES ('254', '20151', '2', '12466', '5', '1');
INSERT INTO `carga` VALUES ('254', '20151', '2', '12467', '5', '1');
INSERT INTO `carga` VALUES ('254', '20151', '2', '12468', '5', '1');
INSERT INTO `carga` VALUES ('254', '20151', '2', '12469', '5', '1');
INSERT INTO `carga` VALUES ('254', '20151', '2', '12487', '5', '1');
INSERT INTO `carga` VALUES ('254', '20151', '2', '12489', '5', '1');
INSERT INTO `carga` VALUES ('254', '20151', '2', '12490', '5', '1');
INSERT INTO `carga` VALUES ('254', '20151', '2', '12492', '5', '1');
INSERT INTO `carga` VALUES ('255', '20151', '2', '11761', '5', '1');
INSERT INTO `carga` VALUES ('255', '20151', '2', '12465', '5', '1');
INSERT INTO `carga` VALUES ('255', '20151', '2', '12466', '5', '1');
INSERT INTO `carga` VALUES ('255', '20151', '2', '12467', '5', '1');
INSERT INTO `carga` VALUES ('255', '20151', '2', '12468', '5', '1');
INSERT INTO `carga` VALUES ('255', '20151', '2', '12469', '5', '1');
INSERT INTO `carga` VALUES ('255', '20151', '2', '12487', '5', '1');
INSERT INTO `carga` VALUES ('255', '20151', '2', '12489', '5', '1');
INSERT INTO `carga` VALUES ('255', '20151', '2', '12490', '5', '1');
INSERT INTO `carga` VALUES ('255', '20151', '2', '12492', '5', '1');
INSERT INTO `carga` VALUES ('256', '20151', '2', '11761', '5', '1');
INSERT INTO `carga` VALUES ('256', '20151', '2', '12465', '5', '1');
INSERT INTO `carga` VALUES ('256', '20151', '2', '12466', '5', '1');
INSERT INTO `carga` VALUES ('256', '20151', '2', '12467', '5', '1');
INSERT INTO `carga` VALUES ('256', '20151', '2', '12468', '5', '1');
INSERT INTO `carga` VALUES ('256', '20151', '2', '12469', '5', '1');
INSERT INTO `carga` VALUES ('256', '20151', '2', '12487', '5', '1');
INSERT INTO `carga` VALUES ('256', '20151', '2', '12489', '5', '1');
INSERT INTO `carga` VALUES ('256', '20151', '2', '12490', '5', '1');
INSERT INTO `carga` VALUES ('256', '20151', '2', '12492', '5', '1');
INSERT INTO `carga` VALUES ('261', '20151', '2', '12470', '6', '1');
INSERT INTO `carga` VALUES ('261', '20151', '2', '12471', '6', '1');
INSERT INTO `carga` VALUES ('261', '20151', '2', '12472', '6', '1');
INSERT INTO `carga` VALUES ('261', '20151', '2', '12473', '6', '1');
INSERT INTO `carga` VALUES ('261', '20151', '2', '12474', '6', '1');
INSERT INTO `carga` VALUES ('261', '20151', '2', '12475', '6', '1');
INSERT INTO `carga` VALUES ('261', '20151', '2', '12487', '6', '1');
INSERT INTO `carga` VALUES ('261', '20151', '2', '12489', '6', '1');
INSERT INTO `carga` VALUES ('261', '20151', '2', '12490', '6', '1');
INSERT INTO `carga` VALUES ('261', '20151', '2', '12491', '6', '1');
INSERT INTO `carga` VALUES ('262', '20151', '2', '12470', '6', '1');
INSERT INTO `carga` VALUES ('262', '20151', '2', '12471', '6', '1');
INSERT INTO `carga` VALUES ('262', '20151', '2', '12472', '6', '1');
INSERT INTO `carga` VALUES ('262', '20151', '2', '12473', '6', '1');
INSERT INTO `carga` VALUES ('262', '20151', '2', '12474', '6', '1');
INSERT INTO `carga` VALUES ('262', '20151', '2', '12475', '6', '1');
INSERT INTO `carga` VALUES ('262', '20151', '2', '12487', '6', '1');
INSERT INTO `carga` VALUES ('262', '20151', '2', '12489', '6', '1');
INSERT INTO `carga` VALUES ('262', '20151', '2', '12490', '6', '1');
INSERT INTO `carga` VALUES ('262', '20151', '2', '12491', '6', '1');
INSERT INTO `carga` VALUES ('263', '20151', '2', '12470', '6', '1');
INSERT INTO `carga` VALUES ('263', '20151', '2', '12471', '6', '1');
INSERT INTO `carga` VALUES ('263', '20151', '2', '12472', '6', '1');
INSERT INTO `carga` VALUES ('263', '20151', '2', '12473', '6', '1');
INSERT INTO `carga` VALUES ('263', '20151', '2', '12474', '6', '1');
INSERT INTO `carga` VALUES ('263', '20151', '2', '12475', '6', '1');
INSERT INTO `carga` VALUES ('263', '20151', '2', '12487', '6', '1');
INSERT INTO `carga` VALUES ('263', '20151', '2', '12489', '6', '1');
INSERT INTO `carga` VALUES ('263', '20151', '2', '12490', '6', '1');
INSERT INTO `carga` VALUES ('263', '20151', '2', '12491', '6', '1');
INSERT INTO `carga` VALUES ('264', '20151', '2', '12470', '6', '1');
INSERT INTO `carga` VALUES ('264', '20151', '2', '12471', '6', '1');
INSERT INTO `carga` VALUES ('264', '20151', '2', '12472', '6', '1');
INSERT INTO `carga` VALUES ('264', '20151', '2', '12473', '6', '1');
INSERT INTO `carga` VALUES ('264', '20151', '2', '12474', '6', '1');
INSERT INTO `carga` VALUES ('264', '20151', '2', '12475', '6', '1');
INSERT INTO `carga` VALUES ('264', '20151', '2', '12487', '6', '1');
INSERT INTO `carga` VALUES ('264', '20151', '2', '12489', '6', '1');
INSERT INTO `carga` VALUES ('264', '20151', '2', '12490', '6', '1');
INSERT INTO `carga` VALUES ('264', '20151', '2', '12491', '6', '1');
INSERT INTO `carga` VALUES ('265', '20151', '2', '12470', '6', '1');
INSERT INTO `carga` VALUES ('265', '20151', '2', '12471', '6', '1');
INSERT INTO `carga` VALUES ('265', '20151', '2', '12472', '6', '1');
INSERT INTO `carga` VALUES ('265', '20151', '2', '12473', '6', '1');
INSERT INTO `carga` VALUES ('265', '20151', '2', '12474', '6', '1');
INSERT INTO `carga` VALUES ('265', '20151', '2', '12475', '6', '1');
INSERT INTO `carga` VALUES ('265', '20151', '2', '12487', '6', '1');
INSERT INTO `carga` VALUES ('265', '20151', '2', '12489', '6', '1');
INSERT INTO `carga` VALUES ('265', '20151', '2', '12490', '6', '1');
INSERT INTO `carga` VALUES ('265', '20151', '2', '12491', '6', '1');
INSERT INTO `carga` VALUES ('266', '20151', '2', '12470', '6', '1');
INSERT INTO `carga` VALUES ('266', '20151', '2', '12471', '6', '1');
INSERT INTO `carga` VALUES ('266', '20151', '2', '12472', '6', '1');
INSERT INTO `carga` VALUES ('266', '20151', '2', '12473', '6', '1');
INSERT INTO `carga` VALUES ('266', '20151', '2', '12474', '6', '1');
INSERT INTO `carga` VALUES ('266', '20151', '2', '12475', '6', '1');
INSERT INTO `carga` VALUES ('266', '20151', '2', '12487', '6', '1');
INSERT INTO `carga` VALUES ('266', '20151', '2', '12489', '6', '1');
INSERT INTO `carga` VALUES ('266', '20151', '2', '12490', '6', '1');
INSERT INTO `carga` VALUES ('266', '20151', '2', '12491', '6', '1');
INSERT INTO `carga` VALUES ('271', '20151', '2', '11755', '7', '1');
INSERT INTO `carga` VALUES ('271', '20151', '2', '12292', '7', '1');
INSERT INTO `carga` VALUES ('271', '20151', '2', '12476', '7', '1');
INSERT INTO `carga` VALUES ('271', '20151', '2', '12477', '7', '1');
INSERT INTO `carga` VALUES ('271', '20151', '2', '12478', '7', '1');
INSERT INTO `carga` VALUES ('271', '20151', '2', '12479', '7', '1');
INSERT INTO `carga` VALUES ('271', '20151', '2', '12495', '7', '1');
INSERT INTO `carga` VALUES ('271', '20151', '2', '12496', '7', '1');
INSERT INTO `carga` VALUES ('271', '20151', '2', '12497', '7', '1');
INSERT INTO `carga` VALUES ('271', '20151', '2', '12501', '7', '1');
INSERT INTO `carga` VALUES ('272', '20151', '2', '11755', '7', '1');
INSERT INTO `carga` VALUES ('272', '20151', '2', '12292', '7', '1');
INSERT INTO `carga` VALUES ('272', '20151', '2', '12476', '7', '1');
INSERT INTO `carga` VALUES ('272', '20151', '2', '12477', '7', '1');
INSERT INTO `carga` VALUES ('272', '20151', '2', '12478', '7', '1');
INSERT INTO `carga` VALUES ('272', '20151', '2', '12479', '7', '1');
INSERT INTO `carga` VALUES ('272', '20151', '2', '12495', '7', '1');
INSERT INTO `carga` VALUES ('272', '20151', '2', '12496', '7', '1');
INSERT INTO `carga` VALUES ('272', '20151', '2', '12497', '7', '1');
INSERT INTO `carga` VALUES ('272', '20151', '2', '12501', '7', '1');
INSERT INTO `carga` VALUES ('273', '20151', '2', '11755', '7', '1');
INSERT INTO `carga` VALUES ('273', '20151', '2', '12292', '7', '1');
INSERT INTO `carga` VALUES ('273', '20151', '2', '12476', '7', '1');
INSERT INTO `carga` VALUES ('273', '20151', '2', '12477', '7', '1');
INSERT INTO `carga` VALUES ('273', '20151', '2', '12478', '7', '1');
INSERT INTO `carga` VALUES ('273', '20151', '2', '12479', '7', '1');
INSERT INTO `carga` VALUES ('273', '20151', '2', '12495', '7', '1');
INSERT INTO `carga` VALUES ('273', '20151', '2', '12496', '7', '1');
INSERT INTO `carga` VALUES ('273', '20151', '2', '12497', '7', '1');
INSERT INTO `carga` VALUES ('273', '20151', '2', '12501', '7', '1');
INSERT INTO `carga` VALUES ('274', '20151', '2', '11755', '7', '1');
INSERT INTO `carga` VALUES ('274', '20151', '2', '12292', '7', '1');
INSERT INTO `carga` VALUES ('274', '20151', '2', '12476', '7', '1');
INSERT INTO `carga` VALUES ('274', '20151', '2', '12477', '7', '1');
INSERT INTO `carga` VALUES ('274', '20151', '2', '12478', '7', '1');
INSERT INTO `carga` VALUES ('274', '20151', '2', '12479', '7', '1');
INSERT INTO `carga` VALUES ('274', '20151', '2', '12495', '7', '1');
INSERT INTO `carga` VALUES ('274', '20151', '2', '12496', '7', '1');
INSERT INTO `carga` VALUES ('274', '20151', '2', '12497', '7', '1');
INSERT INTO `carga` VALUES ('274', '20151', '2', '12501', '7', '1');
INSERT INTO `carga` VALUES ('275', '20151', '2', '11755', '7', '1');
INSERT INTO `carga` VALUES ('275', '20151', '2', '12292', '7', '1');
INSERT INTO `carga` VALUES ('275', '20151', '2', '12476', '7', '1');
INSERT INTO `carga` VALUES ('275', '20151', '2', '12477', '7', '1');
INSERT INTO `carga` VALUES ('275', '20151', '2', '12478', '7', '1');
INSERT INTO `carga` VALUES ('275', '20151', '2', '12479', '7', '1');
INSERT INTO `carga` VALUES ('275', '20151', '2', '12495', '7', '1');
INSERT INTO `carga` VALUES ('275', '20151', '2', '12496', '7', '1');
INSERT INTO `carga` VALUES ('275', '20151', '2', '12497', '7', '1');
INSERT INTO `carga` VALUES ('275', '20151', '2', '12501', '7', '1');
INSERT INTO `carga` VALUES ('276', '20151', '2', '11755', '7', '1');
INSERT INTO `carga` VALUES ('276', '20151', '2', '12292', '7', '1');
INSERT INTO `carga` VALUES ('276', '20151', '2', '12476', '7', '1');
INSERT INTO `carga` VALUES ('276', '20151', '2', '12477', '7', '1');
INSERT INTO `carga` VALUES ('276', '20151', '2', '12478', '7', '1');
INSERT INTO `carga` VALUES ('276', '20151', '2', '12479', '7', '1');
INSERT INTO `carga` VALUES ('276', '20151', '2', '12495', '7', '1');
INSERT INTO `carga` VALUES ('276', '20151', '2', '12496', '7', '1');
INSERT INTO `carga` VALUES ('276', '20151', '2', '12497', '7', '1');
INSERT INTO `carga` VALUES ('276', '20151', '2', '12501', '7', '1');
INSERT INTO `carga` VALUES ('281', '20151', '2', '12480', '8', '1');
INSERT INTO `carga` VALUES ('281', '20151', '2', '12481', '8', '1');
INSERT INTO `carga` VALUES ('281', '20151', '2', '12493', '8', '1');
INSERT INTO `carga` VALUES ('281', '20151', '2', '12494', '8', '1');
INSERT INTO `carga` VALUES ('281', '20151', '2', '12495', '8', '1');
INSERT INTO `carga` VALUES ('281', '20151', '2', '12496', '8', '1');
INSERT INTO `carga` VALUES ('281', '20151', '2', '12497', '8', '1');
INSERT INTO `carga` VALUES ('281', '20151', '2', '12498', '8', '1');
INSERT INTO `carga` VALUES ('281', '20151', '2', '12500', '8', '1');
INSERT INTO `carga` VALUES ('281', '20151', '2', '12501', '8', '1');
INSERT INTO `carga` VALUES ('282', '20151', '2', '12480', '8', '1');
INSERT INTO `carga` VALUES ('282', '20151', '2', '12481', '8', '1');
INSERT INTO `carga` VALUES ('282', '20151', '2', '12493', '8', '1');
INSERT INTO `carga` VALUES ('282', '20151', '2', '12494', '8', '1');
INSERT INTO `carga` VALUES ('282', '20151', '2', '12495', '8', '1');
INSERT INTO `carga` VALUES ('282', '20151', '2', '12496', '8', '1');
INSERT INTO `carga` VALUES ('282', '20151', '2', '12497', '8', '1');
INSERT INTO `carga` VALUES ('282', '20151', '2', '12498', '8', '1');
INSERT INTO `carga` VALUES ('282', '20151', '2', '12500', '8', '1');
INSERT INTO `carga` VALUES ('282', '20151', '2', '12501', '8', '1');
INSERT INTO `carga` VALUES ('283', '20151', '2', '12480', '8', '1');
INSERT INTO `carga` VALUES ('283', '20151', '2', '12481', '8', '1');
INSERT INTO `carga` VALUES ('283', '20151', '2', '12493', '8', '1');
INSERT INTO `carga` VALUES ('283', '20151', '2', '12494', '8', '1');
INSERT INTO `carga` VALUES ('283', '20151', '2', '12495', '8', '1');
INSERT INTO `carga` VALUES ('283', '20151', '2', '12496', '8', '1');
INSERT INTO `carga` VALUES ('283', '20151', '2', '12497', '8', '1');
INSERT INTO `carga` VALUES ('283', '20151', '2', '12498', '8', '1');
INSERT INTO `carga` VALUES ('283', '20151', '2', '12500', '8', '1');
INSERT INTO `carga` VALUES ('283', '20151', '2', '12501', '8', '1');
INSERT INTO `carga` VALUES ('284', '20151', '2', '12480', '8', '1');
INSERT INTO `carga` VALUES ('284', '20151', '2', '12481', '8', '1');
INSERT INTO `carga` VALUES ('284', '20151', '2', '12493', '8', '1');
INSERT INTO `carga` VALUES ('284', '20151', '2', '12494', '8', '1');
INSERT INTO `carga` VALUES ('284', '20151', '2', '12495', '8', '1');
INSERT INTO `carga` VALUES ('284', '20151', '2', '12496', '8', '1');
INSERT INTO `carga` VALUES ('284', '20151', '2', '12497', '8', '1');
INSERT INTO `carga` VALUES ('284', '20151', '2', '12498', '8', '1');
INSERT INTO `carga` VALUES ('284', '20151', '2', '12500', '8', '1');
INSERT INTO `carga` VALUES ('284', '20151', '2', '12501', '8', '1');
INSERT INTO `carga` VALUES ('285', '20151', '2', '12480', '8', '1');
INSERT INTO `carga` VALUES ('285', '20151', '2', '12481', '8', '1');
INSERT INTO `carga` VALUES ('285', '20151', '2', '12493', '8', '1');
INSERT INTO `carga` VALUES ('285', '20151', '2', '12494', '8', '1');
INSERT INTO `carga` VALUES ('285', '20151', '2', '12495', '8', '1');
INSERT INTO `carga` VALUES ('285', '20151', '2', '12496', '8', '1');
INSERT INTO `carga` VALUES ('285', '20151', '2', '12497', '8', '1');
INSERT INTO `carga` VALUES ('285', '20151', '2', '12498', '8', '1');
INSERT INTO `carga` VALUES ('285', '20151', '2', '12500', '8', '1');
INSERT INTO `carga` VALUES ('285', '20151', '2', '12501', '8', '1');
INSERT INTO `carga` VALUES ('286', '20151', '2', '12480', '8', '1');
INSERT INTO `carga` VALUES ('286', '20151', '2', '12481', '8', '1');
INSERT INTO `carga` VALUES ('286', '20151', '2', '12493', '8', '1');
INSERT INTO `carga` VALUES ('286', '20151', '2', '12494', '8', '1');
INSERT INTO `carga` VALUES ('286', '20151', '2', '12495', '8', '1');
INSERT INTO `carga` VALUES ('286', '20151', '2', '12496', '8', '1');
INSERT INTO `carga` VALUES ('286', '20151', '2', '12497', '8', '1');
INSERT INTO `carga` VALUES ('286', '20151', '2', '12498', '8', '1');
INSERT INTO `carga` VALUES ('286', '20151', '2', '12500', '8', '1');
INSERT INTO `carga` VALUES ('286', '20151', '2', '12501', '8', '1');
INSERT INTO `carga` VALUES ('601', '20132', '6', '11236', '1', '1');
INSERT INTO `carga` VALUES ('601', '20132', '6', '11237', '1', '1');
INSERT INTO `carga` VALUES ('601', '20132', '6', '11238', '1', '1');
INSERT INTO `carga` VALUES ('601', '20132', '6', '11239', '1', '1');
INSERT INTO `carga` VALUES ('601', '20132', '6', '11240', '1', '1');
INSERT INTO `carga` VALUES ('601', '20132', '6', '11241', '1', '1');
INSERT INTO `carga` VALUES ('601', '20132', '6', '11242', '1', '1');
INSERT INTO `carga` VALUES ('601', '20151', '6', '11236', '1', '1');
INSERT INTO `carga` VALUES ('601', '20151', '6', '11237', '1', '1');
INSERT INTO `carga` VALUES ('601', '20151', '6', '11238', '1', '1');
INSERT INTO `carga` VALUES ('601', '20151', '6', '11239', '1', '1');
INSERT INTO `carga` VALUES ('601', '20151', '6', '11240', '1', '1');
INSERT INTO `carga` VALUES ('601', '20151', '6', '11241', '1', '1');
INSERT INTO `carga` VALUES ('602', '20132', '6', '11236', '1', '1');
INSERT INTO `carga` VALUES ('602', '20132', '6', '11237', '1', '1');
INSERT INTO `carga` VALUES ('602', '20132', '6', '11238', '1', '1');
INSERT INTO `carga` VALUES ('602', '20132', '6', '11239', '1', '1');
INSERT INTO `carga` VALUES ('602', '20132', '6', '11240', '1', '1');
INSERT INTO `carga` VALUES ('602', '20132', '6', '11241', '1', '1');
INSERT INTO `carga` VALUES ('602', '20132', '6', '11242', '1', '1');
INSERT INTO `carga` VALUES ('602', '20151', '6', '11236', '1', '1');
INSERT INTO `carga` VALUES ('602', '20151', '6', '11237', '1', '1');
INSERT INTO `carga` VALUES ('602', '20151', '6', '11238', '1', '1');
INSERT INTO `carga` VALUES ('602', '20151', '6', '11239', '1', '1');
INSERT INTO `carga` VALUES ('602', '20151', '6', '11240', '1', '1');
INSERT INTO `carga` VALUES ('602', '20151', '6', '11241', '1', '1');
INSERT INTO `carga` VALUES ('603', '20132', '6', '11236', '1', '1');
INSERT INTO `carga` VALUES ('603', '20132', '6', '11237', '1', '1');
INSERT INTO `carga` VALUES ('603', '20132', '6', '11238', '1', '1');
INSERT INTO `carga` VALUES ('603', '20132', '6', '11239', '1', '1');
INSERT INTO `carga` VALUES ('603', '20132', '6', '11240', '1', '1');
INSERT INTO `carga` VALUES ('603', '20132', '6', '11241', '1', '1');
INSERT INTO `carga` VALUES ('603', '20132', '6', '11242', '1', '1');
INSERT INTO `carga` VALUES ('603', '20151', '6', '11236', '1', '1');
INSERT INTO `carga` VALUES ('603', '20151', '6', '11237', '1', '1');
INSERT INTO `carga` VALUES ('603', '20151', '6', '11238', '1', '1');
INSERT INTO `carga` VALUES ('603', '20151', '6', '11239', '1', '1');
INSERT INTO `carga` VALUES ('603', '20151', '6', '11240', '1', '1');
INSERT INTO `carga` VALUES ('603', '20151', '6', '11241', '1', '1');
INSERT INTO `carga` VALUES ('604', '20132', '6', '11236', '1', '1');
INSERT INTO `carga` VALUES ('604', '20132', '6', '11237', '1', '1');
INSERT INTO `carga` VALUES ('604', '20132', '6', '11238', '1', '1');
INSERT INTO `carga` VALUES ('604', '20132', '6', '11239', '1', '1');
INSERT INTO `carga` VALUES ('604', '20132', '6', '11240', '1', '1');
INSERT INTO `carga` VALUES ('604', '20132', '6', '11241', '1', '1');
INSERT INTO `carga` VALUES ('604', '20132', '6', '11242', '1', '1');
INSERT INTO `carga` VALUES ('604', '20151', '6', '11236', '1', '1');
INSERT INTO `carga` VALUES ('604', '20151', '6', '11237', '1', '1');
INSERT INTO `carga` VALUES ('604', '20151', '6', '11238', '1', '1');
INSERT INTO `carga` VALUES ('604', '20151', '6', '11239', '1', '1');
INSERT INTO `carga` VALUES ('604', '20151', '6', '11240', '1', '1');
INSERT INTO `carga` VALUES ('604', '20151', '6', '11241', '1', '1');
INSERT INTO `carga` VALUES ('605', '20132', '6', '11236', '1', '1');
INSERT INTO `carga` VALUES ('605', '20132', '6', '11237', '1', '1');
INSERT INTO `carga` VALUES ('605', '20132', '6', '11238', '1', '1');
INSERT INTO `carga` VALUES ('605', '20132', '6', '11239', '1', '1');
INSERT INTO `carga` VALUES ('605', '20132', '6', '11240', '1', '1');
INSERT INTO `carga` VALUES ('605', '20132', '6', '11241', '1', '1');
INSERT INTO `carga` VALUES ('605', '20132', '6', '11242', '1', '1');
INSERT INTO `carga` VALUES ('605', '20151', '6', '11236', '1', '1');
INSERT INTO `carga` VALUES ('605', '20151', '6', '11237', '1', '1');
INSERT INTO `carga` VALUES ('605', '20151', '6', '11238', '1', '1');
INSERT INTO `carga` VALUES ('605', '20151', '6', '11239', '1', '1');
INSERT INTO `carga` VALUES ('605', '20151', '6', '11240', '1', '1');
INSERT INTO `carga` VALUES ('605', '20151', '6', '11241', '1', '1');
INSERT INTO `carga` VALUES ('606', '20132', '6', '11236', '1', '1');
INSERT INTO `carga` VALUES ('606', '20132', '6', '11237', '1', '1');
INSERT INTO `carga` VALUES ('606', '20132', '6', '11238', '1', '1');
INSERT INTO `carga` VALUES ('606', '20132', '6', '11239', '1', '1');
INSERT INTO `carga` VALUES ('606', '20132', '6', '11240', '1', '1');
INSERT INTO `carga` VALUES ('606', '20132', '6', '11241', '1', '1');
INSERT INTO `carga` VALUES ('606', '20132', '6', '11242', '1', '1');
INSERT INTO `carga` VALUES ('606', '20151', '6', '11236', '1', '1');
INSERT INTO `carga` VALUES ('606', '20151', '6', '11237', '1', '1');
INSERT INTO `carga` VALUES ('606', '20151', '6', '11238', '1', '1');
INSERT INTO `carga` VALUES ('606', '20151', '6', '11239', '1', '1');
INSERT INTO `carga` VALUES ('606', '20151', '6', '11240', '1', '1');
INSERT INTO `carga` VALUES ('606', '20151', '6', '11241', '1', '1');
INSERT INTO `carga` VALUES ('607', '20132', '6', '11236', '1', '1');
INSERT INTO `carga` VALUES ('607', '20132', '6', '11237', '1', '1');
INSERT INTO `carga` VALUES ('607', '20132', '6', '11238', '1', '1');
INSERT INTO `carga` VALUES ('607', '20132', '6', '11239', '1', '1');
INSERT INTO `carga` VALUES ('607', '20132', '6', '11240', '1', '1');
INSERT INTO `carga` VALUES ('607', '20132', '6', '11241', '1', '1');
INSERT INTO `carga` VALUES ('607', '20132', '6', '11242', '1', '1');
INSERT INTO `carga` VALUES ('607', '20151', '6', '11236', '1', '1');
INSERT INTO `carga` VALUES ('607', '20151', '6', '11237', '1', '1');
INSERT INTO `carga` VALUES ('607', '20151', '6', '11238', '1', '1');
INSERT INTO `carga` VALUES ('607', '20151', '6', '11239', '1', '1');
INSERT INTO `carga` VALUES ('607', '20151', '6', '11240', '1', '1');
INSERT INTO `carga` VALUES ('607', '20151', '6', '11241', '1', '1');
INSERT INTO `carga` VALUES ('608', '20132', '6', '11236', '1', '1');
INSERT INTO `carga` VALUES ('608', '20132', '6', '11237', '1', '1');
INSERT INTO `carga` VALUES ('608', '20132', '6', '11238', '1', '1');
INSERT INTO `carga` VALUES ('608', '20132', '6', '11239', '1', '1');
INSERT INTO `carga` VALUES ('608', '20132', '6', '11240', '1', '1');
INSERT INTO `carga` VALUES ('608', '20132', '6', '11241', '1', '1');
INSERT INTO `carga` VALUES ('608', '20132', '6', '11242', '1', '1');
INSERT INTO `carga` VALUES ('608', '20151', '6', '11236', '1', '1');
INSERT INTO `carga` VALUES ('608', '20151', '6', '11237', '1', '1');
INSERT INTO `carga` VALUES ('608', '20151', '6', '11238', '1', '1');
INSERT INTO `carga` VALUES ('608', '20151', '6', '11239', '1', '1');
INSERT INTO `carga` VALUES ('608', '20151', '6', '11240', '1', '1');
INSERT INTO `carga` VALUES ('608', '20151', '6', '11241', '1', '1');
INSERT INTO `carga` VALUES ('611', '20132', '6', '11236', '1', '1');
INSERT INTO `carga` VALUES ('611', '20132', '6', '11237', '1', '1');
INSERT INTO `carga` VALUES ('611', '20132', '6', '11238', '1', '1');
INSERT INTO `carga` VALUES ('611', '20132', '6', '11239', '1', '1');
INSERT INTO `carga` VALUES ('611', '20132', '6', '11240', '1', '1');
INSERT INTO `carga` VALUES ('611', '20132', '6', '11241', '1', '1');
INSERT INTO `carga` VALUES ('611', '20132', '6', '11242', '1', '1');
INSERT INTO `carga` VALUES ('611', '20151', '6', '11236', '1', '1');
INSERT INTO `carga` VALUES ('611', '20151', '6', '11237', '1', '1');
INSERT INTO `carga` VALUES ('611', '20151', '6', '11238', '1', '1');
INSERT INTO `carga` VALUES ('611', '20151', '6', '11239', '1', '1');
INSERT INTO `carga` VALUES ('611', '20151', '6', '11240', '1', '1');
INSERT INTO `carga` VALUES ('611', '20151', '6', '11241', '1', '1');
INSERT INTO `carga` VALUES ('612', '20132', '6', '11236', '1', '1');
INSERT INTO `carga` VALUES ('612', '20132', '6', '11237', '1', '1');
INSERT INTO `carga` VALUES ('612', '20132', '6', '11238', '1', '1');
INSERT INTO `carga` VALUES ('612', '20132', '6', '11239', '1', '1');
INSERT INTO `carga` VALUES ('612', '20132', '6', '11240', '1', '1');
INSERT INTO `carga` VALUES ('612', '20132', '6', '11241', '1', '1');
INSERT INTO `carga` VALUES ('612', '20132', '6', '11242', '1', '1');
INSERT INTO `carga` VALUES ('612', '20151', '6', '11236', '1', '1');
INSERT INTO `carga` VALUES ('612', '20151', '6', '11237', '1', '1');
INSERT INTO `carga` VALUES ('612', '20151', '6', '11238', '1', '1');
INSERT INTO `carga` VALUES ('612', '20151', '6', '11239', '1', '1');
INSERT INTO `carga` VALUES ('612', '20151', '6', '11240', '1', '1');
INSERT INTO `carga` VALUES ('612', '20151', '6', '11241', '1', '1');
INSERT INTO `carga` VALUES ('613', '20151', '6', '11236', '1', '1');
INSERT INTO `carga` VALUES ('613', '20151', '6', '11237', '1', '1');
INSERT INTO `carga` VALUES ('613', '20151', '6', '11238', '1', '1');
INSERT INTO `carga` VALUES ('613', '20151', '6', '11239', '1', '1');
INSERT INTO `carga` VALUES ('613', '20151', '6', '11240', '1', '1');
INSERT INTO `carga` VALUES ('613', '20151', '6', '11241', '1', '1');
INSERT INTO `carga` VALUES ('614', '20151', '6', '11236', '1', '1');
INSERT INTO `carga` VALUES ('614', '20151', '6', '11237', '1', '1');
INSERT INTO `carga` VALUES ('614', '20151', '6', '11238', '1', '1');
INSERT INTO `carga` VALUES ('614', '20151', '6', '11239', '1', '1');
INSERT INTO `carga` VALUES ('614', '20151', '6', '11240', '1', '1');
INSERT INTO `carga` VALUES ('614', '20151', '6', '11241', '1', '1');
INSERT INTO `carga` VALUES ('615', '20151', '6', '11236', '1', '1');
INSERT INTO `carga` VALUES ('615', '20151', '6', '11237', '1', '1');
INSERT INTO `carga` VALUES ('615', '20151', '6', '11238', '1', '1');
INSERT INTO `carga` VALUES ('615', '20151', '6', '11239', '1', '1');
INSERT INTO `carga` VALUES ('615', '20151', '6', '11240', '1', '1');
INSERT INTO `carga` VALUES ('615', '20151', '6', '11241', '1', '1');
INSERT INTO `carga` VALUES ('616', '20151', '6', '11236', '1', '1');
INSERT INTO `carga` VALUES ('616', '20151', '6', '11237', '1', '1');
INSERT INTO `carga` VALUES ('616', '20151', '6', '11238', '1', '1');
INSERT INTO `carga` VALUES ('616', '20151', '6', '11239', '1', '1');
INSERT INTO `carga` VALUES ('616', '20151', '6', '11240', '1', '1');
INSERT INTO `carga` VALUES ('616', '20151', '6', '11241', '1', '1');
INSERT INTO `carga` VALUES ('621', '20151', '6', '11243', '2', '1');
INSERT INTO `carga` VALUES ('621', '20151', '6', '11244', '2', '1');
INSERT INTO `carga` VALUES ('621', '20151', '6', '11245', '2', '1');
INSERT INTO `carga` VALUES ('621', '20151', '6', '11246', '2', '1');
INSERT INTO `carga` VALUES ('621', '20151', '6', '11247', '2', '1');
INSERT INTO `carga` VALUES ('621', '20151', '6', '11248', '2', '1');
INSERT INTO `carga` VALUES ('621', '20151', '6', '11249', '2', '1');
INSERT INTO `carga` VALUES ('622', '20151', '6', '11243', '2', '1');
INSERT INTO `carga` VALUES ('622', '20151', '6', '11244', '2', '1');
INSERT INTO `carga` VALUES ('622', '20151', '6', '11245', '2', '1');
INSERT INTO `carga` VALUES ('622', '20151', '6', '11246', '2', '1');
INSERT INTO `carga` VALUES ('622', '20151', '6', '11247', '2', '1');
INSERT INTO `carga` VALUES ('622', '20151', '6', '11248', '2', '1');
INSERT INTO `carga` VALUES ('622', '20151', '6', '11249', '2', '1');
INSERT INTO `carga` VALUES ('623', '20151', '6', '11243', '2', '1');
INSERT INTO `carga` VALUES ('623', '20151', '6', '11244', '2', '1');
INSERT INTO `carga` VALUES ('623', '20151', '6', '11245', '2', '1');
INSERT INTO `carga` VALUES ('623', '20151', '6', '11246', '2', '1');
INSERT INTO `carga` VALUES ('623', '20151', '6', '11247', '2', '1');
INSERT INTO `carga` VALUES ('623', '20151', '6', '11248', '2', '1');
INSERT INTO `carga` VALUES ('623', '20151', '6', '11249', '2', '1');
INSERT INTO `carga` VALUES ('624', '20151', '6', '11243', '2', '1');
INSERT INTO `carga` VALUES ('624', '20151', '6', '11244', '2', '1');
INSERT INTO `carga` VALUES ('624', '20151', '6', '11245', '2', '1');
INSERT INTO `carga` VALUES ('624', '20151', '6', '11246', '2', '1');
INSERT INTO `carga` VALUES ('624', '20151', '6', '11247', '2', '1');
INSERT INTO `carga` VALUES ('624', '20151', '6', '11248', '2', '1');
INSERT INTO `carga` VALUES ('624', '20151', '6', '11249', '2', '1');
INSERT INTO `carga` VALUES ('625', '20151', '6', '11243', '2', '1');
INSERT INTO `carga` VALUES ('625', '20151', '6', '11244', '2', '1');
INSERT INTO `carga` VALUES ('625', '20151', '6', '11245', '2', '1');
INSERT INTO `carga` VALUES ('625', '20151', '6', '11246', '2', '1');
INSERT INTO `carga` VALUES ('625', '20151', '6', '11247', '2', '1');
INSERT INTO `carga` VALUES ('625', '20151', '6', '11248', '2', '1');
INSERT INTO `carga` VALUES ('625', '20151', '6', '11249', '2', '1');
INSERT INTO `carga` VALUES ('626', '20151', '6', '11243', '2', '1');
INSERT INTO `carga` VALUES ('626', '20151', '6', '11244', '2', '1');
INSERT INTO `carga` VALUES ('626', '20151', '6', '11245', '2', '1');
INSERT INTO `carga` VALUES ('626', '20151', '6', '11246', '2', '1');
INSERT INTO `carga` VALUES ('626', '20151', '6', '11247', '2', '1');
INSERT INTO `carga` VALUES ('626', '20151', '6', '11248', '2', '1');
INSERT INTO `carga` VALUES ('626', '20151', '6', '11249', '2', '1');
INSERT INTO `carga` VALUES ('627', '20151', '6', '11243', '2', '1');
INSERT INTO `carga` VALUES ('627', '20151', '6', '11244', '2', '1');
INSERT INTO `carga` VALUES ('627', '20151', '6', '11245', '2', '1');
INSERT INTO `carga` VALUES ('627', '20151', '6', '11246', '2', '1');
INSERT INTO `carga` VALUES ('627', '20151', '6', '11247', '2', '1');
INSERT INTO `carga` VALUES ('627', '20151', '6', '11248', '2', '1');
INSERT INTO `carga` VALUES ('627', '20151', '6', '11249', '2', '1');
INSERT INTO `carga` VALUES ('628', '20151', '6', '11243', '2', '1');
INSERT INTO `carga` VALUES ('628', '20151', '6', '11244', '2', '1');
INSERT INTO `carga` VALUES ('628', '20151', '6', '11245', '2', '1');
INSERT INTO `carga` VALUES ('628', '20151', '6', '11246', '2', '1');
INSERT INTO `carga` VALUES ('628', '20151', '6', '11247', '2', '1');
INSERT INTO `carga` VALUES ('628', '20151', '6', '11248', '2', '1');
INSERT INTO `carga` VALUES ('628', '20151', '6', '11249', '2', '1');
INSERT INTO `carga` VALUES ('629', '20151', '6', '11243', '2', '1');
INSERT INTO `carga` VALUES ('629', '20151', '6', '11244', '2', '1');
INSERT INTO `carga` VALUES ('629', '20151', '6', '11245', '2', '1');
INSERT INTO `carga` VALUES ('629', '20151', '6', '11246', '2', '1');
INSERT INTO `carga` VALUES ('629', '20151', '6', '11247', '2', '1');
INSERT INTO `carga` VALUES ('629', '20151', '6', '11248', '2', '1');
INSERT INTO `carga` VALUES ('629', '20151', '6', '11249', '2', '1');
INSERT INTO `carga` VALUES ('630', '20151', '6', '11243', '2', '1');
INSERT INTO `carga` VALUES ('630', '20151', '6', '11244', '2', '1');
INSERT INTO `carga` VALUES ('630', '20151', '6', '11245', '2', '1');
INSERT INTO `carga` VALUES ('630', '20151', '6', '11246', '2', '1');
INSERT INTO `carga` VALUES ('630', '20151', '6', '11247', '2', '1');
INSERT INTO `carga` VALUES ('630', '20151', '6', '11248', '2', '1');
INSERT INTO `carga` VALUES ('630', '20151', '6', '11249', '2', '1');
INSERT INTO `carga` VALUES ('631', '20151', '6', '11243', '2', '1');
INSERT INTO `carga` VALUES ('631', '20151', '6', '11244', '2', '1');
INSERT INTO `carga` VALUES ('631', '20151', '6', '11245', '2', '1');
INSERT INTO `carga` VALUES ('631', '20151', '6', '11246', '2', '1');
INSERT INTO `carga` VALUES ('631', '20151', '6', '11247', '2', '1');
INSERT INTO `carga` VALUES ('631', '20151', '6', '11248', '2', '1');
INSERT INTO `carga` VALUES ('631', '20151', '6', '11249', '2', '1');
INSERT INTO `carga` VALUES ('632', '20151', '6', '11243', '2', '1');
INSERT INTO `carga` VALUES ('632', '20151', '6', '11244', '2', '1');
INSERT INTO `carga` VALUES ('632', '20151', '6', '11245', '2', '1');
INSERT INTO `carga` VALUES ('632', '20151', '6', '11246', '2', '1');
INSERT INTO `carga` VALUES ('632', '20151', '6', '11247', '2', '1');
INSERT INTO `carga` VALUES ('632', '20151', '6', '11248', '2', '1');
INSERT INTO `carga` VALUES ('632', '20151', '6', '11249', '2', '1');
INSERT INTO `carga` VALUES ('633', '20151', '6', '11243', '2', '1');
INSERT INTO `carga` VALUES ('633', '20151', '6', '11244', '2', '1');
INSERT INTO `carga` VALUES ('633', '20151', '6', '11245', '2', '1');
INSERT INTO `carga` VALUES ('633', '20151', '6', '11246', '2', '1');
INSERT INTO `carga` VALUES ('633', '20151', '6', '11247', '2', '1');
INSERT INTO `carga` VALUES ('633', '20151', '6', '11248', '2', '1');
INSERT INTO `carga` VALUES ('633', '20151', '6', '11249', '2', '1');
INSERT INTO `carga` VALUES ('634', '20151', '6', '11243', '2', '1');
INSERT INTO `carga` VALUES ('634', '20151', '6', '11244', '2', '1');
INSERT INTO `carga` VALUES ('634', '20151', '6', '11245', '2', '1');
INSERT INTO `carga` VALUES ('634', '20151', '6', '11246', '2', '1');
INSERT INTO `carga` VALUES ('634', '20151', '6', '11247', '2', '1');
INSERT INTO `carga` VALUES ('634', '20151', '6', '11248', '2', '1');
INSERT INTO `carga` VALUES ('634', '20151', '6', '11249', '2', '1');
INSERT INTO `carga` VALUES ('635', '20151', '6', '11243', '2', '1');
INSERT INTO `carga` VALUES ('635', '20151', '6', '11244', '2', '1');
INSERT INTO `carga` VALUES ('635', '20151', '6', '11245', '2', '1');
INSERT INTO `carga` VALUES ('635', '20151', '6', '11246', '2', '1');
INSERT INTO `carga` VALUES ('635', '20151', '6', '11247', '2', '1');
INSERT INTO `carga` VALUES ('635', '20151', '6', '11248', '2', '1');
INSERT INTO `carga` VALUES ('635', '20151', '6', '11249', '2', '1');
INSERT INTO `carga` VALUES ('636', '20151', '6', '11243', '2', '1');
INSERT INTO `carga` VALUES ('636', '20151', '6', '11244', '2', '1');
INSERT INTO `carga` VALUES ('636', '20151', '6', '11245', '2', '1');
INSERT INTO `carga` VALUES ('636', '20151', '6', '11246', '2', '1');
INSERT INTO `carga` VALUES ('636', '20151', '6', '11247', '2', '1');
INSERT INTO `carga` VALUES ('636', '20151', '6', '11248', '2', '1');
INSERT INTO `carga` VALUES ('636', '20151', '6', '11249', '2', '1');

-- ----------------------------
-- Table structure for carreras_emp
-- ----------------------------
DROP TABLE IF EXISTS `carreras_emp`;
CREATE TABLE `carreras_emp` (
  `carrera` int(11) NOT NULL COMMENT 'Carrera emp',
  `descripcion` varchar(60) NOT NULL COMMENT 'Descripcion carrera emp',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`carrera`),
  KEY `fk_carreras_emp_users1_idx` (`users_id`),
  CONSTRAINT `fk_carreras_emp_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of carreras_emp
-- ----------------------------
INSERT INTO `carreras_emp` VALUES ('1', 'LICENCIADO EN INFORMATICA', '1');
INSERT INTO `carreras_emp` VALUES ('2', 'LICENCIADO EN CONTADURIA', '1');
INSERT INTO `carreras_emp` VALUES ('3', 'LICENCIADO EN NEGOCIOS INTERNACIONALES', '18');
INSERT INTO `carreras_emp` VALUES ('4', 'LICENCIADO EN ADMINISTRACION DE EMPRESAS', '18');
INSERT INTO `carreras_emp` VALUES ('5', 'INGENIERO EN SISTEMAS', '1');
INSERT INTO `carreras_emp` VALUES ('6', 'MAESTRIA EN TECNOLOGIAS DE LA INFORMACION Y LA COMUNICACION', '9');

-- ----------------------------
-- Table structure for categorias
-- ----------------------------
DROP TABLE IF EXISTS `categorias`;
CREATE TABLE `categorias` (
  `categoria` int(11) NOT NULL COMMENT 'Categoria contrato',
  `descripcion` varchar(45) NOT NULL COMMENT 'Descripcion (Tiempo Completo, Asignatura)',
  `nivel` char(1) DEFAULT NULL COMMENT 'Nivel',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`categoria`),
  KEY `fk_categorias_users1_idx` (`users_id`),
  CONSTRAINT `fk_categorias_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of categorias
-- ----------------------------
INSERT INTO `categorias` VALUES ('101', 'PROFESOR ORDINARIO DE ASIGNATURA NIVEL A', null, '1');
INSERT INTO `categorias` VALUES ('102', 'PROFESOR ORDINARIO DE ASIGNATURA NIVEL B', null, '1');
INSERT INTO `categorias` VALUES ('103', 'PROFESOR ORDINARIO DE ASIGNATURA NIVEL C', null, '1');
INSERT INTO `categorias` VALUES ('104', 'PROFESOR ORDINARIO DE CARRERA NIVEL A', null, '1');
INSERT INTO `categorias` VALUES ('105', 'PROFESOR ORDINARIO DE CARRERA NIVEL B', null, '1');

-- ----------------------------
-- Table structure for ciudad
-- ----------------------------
DROP TABLE IF EXISTS `ciudad`;
CREATE TABLE `ciudad` (
  `ciudad` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo Ciudad',
  `descripcion` varchar(60) NOT NULL COMMENT 'Descripcion Ciudad',
  `estado` int(11) NOT NULL DEFAULT '2' COMMENT 'Codigo estado',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`ciudad`),
  UNIQUE KEY `CD_codigo_UNIQUE` (`ciudad`),
  KEY `fk_ciudad_estado1_idx` (`estado`),
  KEY `fk_ciudad_users1_idx` (`users_id`),
  CONSTRAINT `fk_ciudad_estado1` FOREIGN KEY (`estado`) REFERENCES `estado` (`estado`),
  CONSTRAINT `fk_ciudad_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=651 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ciudad
-- ----------------------------
INSERT INTO `ciudad` VALUES ('1', 'AGUASCALIENTES', '1', '1');
INSERT INTO `ciudad` VALUES ('2', 'ASIENTOS', '1', '1');
INSERT INTO `ciudad` VALUES ('3', 'CALVILLO', '1', '1');
INSERT INTO `ciudad` VALUES ('4', 'COSÍO', '1', '1');
INSERT INTO `ciudad` VALUES ('5', 'JESÚS MARÍA', '1', '1');
INSERT INTO `ciudad` VALUES ('6', 'PABELLÓN DE ARTEAGA', '1', '1');
INSERT INTO `ciudad` VALUES ('7', 'RINCÓN DE ROMOS', '1', '1');
INSERT INTO `ciudad` VALUES ('8', 'SAN FRANCISCO DE LOS ROMO', '1', '1');
INSERT INTO `ciudad` VALUES ('9', 'TEPEZALÁ', '1', '1');
INSERT INTO `ciudad` VALUES ('10', 'ENSENADA', '2', '1');
INSERT INTO `ciudad` VALUES ('11', 'MEXICALI', '2', '1');
INSERT INTO `ciudad` VALUES ('12', 'PLAYAS DE ROSARITO', '2', '1');
INSERT INTO `ciudad` VALUES ('13', 'RODOLFO SÁNCHEZ T. (MANEADERO)', '2', '1');
INSERT INTO `ciudad` VALUES ('14', 'SAN FELIPE', '2', '1');
INSERT INTO `ciudad` VALUES ('15', 'TECATE', '2', '1');
INSERT INTO `ciudad` VALUES ('16', 'TIJUANA', '2', '1');
INSERT INTO `ciudad` VALUES ('17', 'CABO SAN LUCAS', '3', '1');
INSERT INTO `ciudad` VALUES ('18', 'CIUDAD CONSTITUCIÓN', '3', '1');
INSERT INTO `ciudad` VALUES ('19', 'GUERRERO NEGRO', '3', '1');
INSERT INTO `ciudad` VALUES ('20', 'HEROICA MULEGÉ', '3', '1');
INSERT INTO `ciudad` VALUES ('21', 'LA PAZ', '3', '1');
INSERT INTO `ciudad` VALUES ('22', 'LORETO', '3', '1');
INSERT INTO `ciudad` VALUES ('23', 'PUERTO ADOLFO LÓPEZ MATEOS', '3', '1');
INSERT INTO `ciudad` VALUES ('24', 'SAN IGNACIO', '3', '1');
INSERT INTO `ciudad` VALUES ('25', 'SAN JOSÉ DEL CABO', '3', '1');
INSERT INTO `ciudad` VALUES ('26', 'TODOS SANTOS', '3', '1');
INSERT INTO `ciudad` VALUES ('27', 'VILLA ALBERTO ANDRÉS ALVARADO ARÁMBURO', '3', '1');
INSERT INTO `ciudad` VALUES ('28', 'CALKINI', '4', '1');
INSERT INTO `ciudad` VALUES ('29', 'CANDELARIA', '4', '1');
INSERT INTO `ciudad` VALUES ('30', 'CHAMPOTÓN', '4', '1');
INSERT INTO `ciudad` VALUES ('31', 'CIUDAD DEL CARMEN', '4', '1');
INSERT INTO `ciudad` VALUES ('32', 'ESCÁRCEGA', '4', '1');
INSERT INTO `ciudad` VALUES ('33', 'HECELCHAKÁN', '4', '1');
INSERT INTO `ciudad` VALUES ('34', 'HOPELCHÉN', '4', '1');
INSERT INTO `ciudad` VALUES ('35', 'POMUCH', '4', '1');
INSERT INTO `ciudad` VALUES ('36', 'SABANCUY', '4', '1');
INSERT INTO `ciudad` VALUES ('37', 'SAN FRANCISCO DE CAMPECHE', '4', '1');
INSERT INTO `ciudad` VALUES ('38', 'ALLENDE', '5', '1');
INSERT INTO `ciudad` VALUES ('39', 'ARTEAGA', '5', '1');
INSERT INTO `ciudad` VALUES ('40', 'CASTAÑOS', '5', '1');
INSERT INTO `ciudad` VALUES ('41', 'CIUDAD ACUÑA', '5', '1');
INSERT INTO `ciudad` VALUES ('42', 'CIUDAD MELCHOR MÚZQUIZ', '5', '1');
INSERT INTO `ciudad` VALUES ('43', 'CUATRO CIÉNEGAS DE CARRANZA', '5', '1');
INSERT INTO `ciudad` VALUES ('44', 'FRANCISCO I. MADERO (CHÁVEZ)', '5', '1');
INSERT INTO `ciudad` VALUES ('45', 'FRONTERA', '5', '1');
INSERT INTO `ciudad` VALUES ('46', 'MATAMOROS', '5', '1');
INSERT INTO `ciudad` VALUES ('47', 'MONCLOVA', '5', '1');
INSERT INTO `ciudad` VALUES ('48', 'MORELOS', '5', '1');
INSERT INTO `ciudad` VALUES ('49', 'NADADORES', '5', '1');
INSERT INTO `ciudad` VALUES ('50', 'NAVA', '5', '1');
INSERT INTO `ciudad` VALUES ('51', 'NUEVA ROSITA', '5', '1');
INSERT INTO `ciudad` VALUES ('52', 'PARRAS DE LA FUENTE', '5', '1');
INSERT INTO `ciudad` VALUES ('53', 'PIEDRAS NEGRAS', '5', '1');
INSERT INTO `ciudad` VALUES ('54', 'RAMOS ARIZPE', '5', '1');
INSERT INTO `ciudad` VALUES ('55', 'SABINAS', '5', '1');
INSERT INTO `ciudad` VALUES ('56', 'SALTILLO', '5', '1');
INSERT INTO `ciudad` VALUES ('57', 'SAN BUENAVENTURA', '5', '1');
INSERT INTO `ciudad` VALUES ('58', 'SAN PEDRO', '5', '1');
INSERT INTO `ciudad` VALUES ('59', 'TORREÓN', '5', '1');
INSERT INTO `ciudad` VALUES ('60', 'VIESCA', '5', '1');
INSERT INTO `ciudad` VALUES ('61', 'ZARAGOZA', '5', '1');
INSERT INTO `ciudad` VALUES ('62', 'CIUDAD DE ARMERÍA', '6', '1');
INSERT INTO `ciudad` VALUES ('63', 'CIUDAD DE VILLA DE ÁLVAREZ', '6', '1');
INSERT INTO `ciudad` VALUES ('64', 'CIUDAD DE VILLA DE ÁLVAREZ', '6', '1');
INSERT INTO `ciudad` VALUES ('65', 'COLIMA', '6', '1');
INSERT INTO `ciudad` VALUES ('66', 'MANZANILLO', '6', '1');
INSERT INTO `ciudad` VALUES ('67', 'TECOMAN', '6', '1');
INSERT INTO `ciudad` VALUES ('68', 'ACALA', '7', '1');
INSERT INTO `ciudad` VALUES ('69', 'ARRIAGA', '7', '1');
INSERT INTO `ciudad` VALUES ('70', 'CACAHOATÁN', '7', '1');
INSERT INTO `ciudad` VALUES ('71', 'CHIAPA DE CORZO', '7', '1');
INSERT INTO `ciudad` VALUES ('72', 'CINTALAPA DE FIGUEROA', '7', '1');
INSERT INTO `ciudad` VALUES ('73', 'COMITÁN DE DOMÍNGUEZ', '7', '1');
INSERT INTO `ciudad` VALUES ('74', 'HUIXTLA', '7', '1');
INSERT INTO `ciudad` VALUES ('75', 'JIQUIPILAS', '7', '1');
INSERT INTO `ciudad` VALUES ('76', 'LAS MARGARITAS', '7', '1');
INSERT INTO `ciudad` VALUES ('77', 'LAS ROSAS', '7', '1');
INSERT INTO `ciudad` VALUES ('78', 'MAPASTEPEC', '7', '1');
INSERT INTO `ciudad` VALUES ('79', 'MOTOZINTLA DE MENDOZA', '7', '1');
INSERT INTO `ciudad` VALUES ('80', 'OCOSINGO', '7', '1');
INSERT INTO `ciudad` VALUES ('81', 'OCOZOCOAUTLA DE ESPINOSA', '7', '1');
INSERT INTO `ciudad` VALUES ('82', 'PALENQUE', '7', '1');
INSERT INTO `ciudad` VALUES ('83', 'PICHUCALCO', '7', '1');
INSERT INTO `ciudad` VALUES ('84', 'PIJIJIAPAN', '7', '1');
INSERT INTO `ciudad` VALUES ('85', 'PUERTO MADERO (SAN BENITO)', '7', '1');
INSERT INTO `ciudad` VALUES ('86', 'REFORMA', '7', '1');
INSERT INTO `ciudad` VALUES ('87', 'SAN CRISTÓBAL DE LAS CASAS', '7', '1');
INSERT INTO `ciudad` VALUES ('88', 'TAPACHULA DE CÓRDOVA Y ORDÓÑEZ', '7', '1');
INSERT INTO `ciudad` VALUES ('89', 'TONALÁ', '7', '1');
INSERT INTO `ciudad` VALUES ('90', 'TUXTLA GUTIÉRREZ', '7', '1');
INSERT INTO `ciudad` VALUES ('91', 'VENUSTIANO CARRANZA', '7', '1');
INSERT INTO `ciudad` VALUES ('92', 'VILLAFLORES', '7', '1');
INSERT INTO `ciudad` VALUES ('93', 'BACHÍNIVA', '8', '1');
INSERT INTO `ciudad` VALUES ('94', 'CHIHUAHUA', '8', '1');
INSERT INTO `ciudad` VALUES ('95', 'COLONIA ANÁHUAC', '8', '1');
INSERT INTO `ciudad` VALUES ('96', 'CUAUHTÉMOC', '8', '1');
INSERT INTO `ciudad` VALUES ('97', 'DELICIAS', '8', '1');
INSERT INTO `ciudad` VALUES ('98', 'HIDALGO DEL PARRAL', '8', '1');
INSERT INTO `ciudad` VALUES ('99', 'JOSÉ MARIANO JIMÉNEZ', '8', '1');
INSERT INTO `ciudad` VALUES ('100', 'JUAN ALDAMA', '8', '1');
INSERT INTO `ciudad` VALUES ('101', 'JUÁREZ', '8', '1');
INSERT INTO `ciudad` VALUES ('102', 'MADERA', '8', '1');
INSERT INTO `ciudad` VALUES ('103', 'MANUEL OJINAGA', '8', '1');
INSERT INTO `ciudad` VALUES ('104', 'NUEVO CASAS GRANDES', '8', '1');
INSERT INTO `ciudad` VALUES ('105', 'SANTA ROSALÍA DE CAMARGO', '8', '1');
INSERT INTO `ciudad` VALUES ('106', 'SAUCILLO', '8', '1');
INSERT INTO `ciudad` VALUES ('107', 'CIUDAD DE MÉXICO', '9', '1');
INSERT INTO `ciudad` VALUES ('108', 'CANATLÁN', '10', '1');
INSERT INTO `ciudad` VALUES ('109', 'CIUDAD LERDO', '10', '1');
INSERT INTO `ciudad` VALUES ('110', 'EL SALTO', '10', '1');
INSERT INTO `ciudad` VALUES ('111', 'FRANCISCO I. MADERO', '10', '1');
INSERT INTO `ciudad` VALUES ('112', 'GÓMEZ PALACIO', '10', '1');
INSERT INTO `ciudad` VALUES ('113', 'NOMBRE DE DIOS', '10', '1');
INSERT INTO `ciudad` VALUES ('114', 'PEÑÓN BLANCO', '10', '1');
INSERT INTO `ciudad` VALUES ('115', 'SAN JUAN DEL RÍO DEL CENTAURO DEL NORTE', '10', '1');
INSERT INTO `ciudad` VALUES ('116', 'SANTA MARÍA DEL ORO', '10', '1');
INSERT INTO `ciudad` VALUES ('117', 'SANTIAGO PAPASQUIARO', '10', '1');
INSERT INTO `ciudad` VALUES ('118', 'VICENTE GUERRERO', '10', '1');
INSERT INTO `ciudad` VALUES ('119', 'VICTORIA DE DURANGO', '10', '1');
INSERT INTO `ciudad` VALUES ('120', 'ABASOLO', '11', '1');
INSERT INTO `ciudad` VALUES ('121', 'ACÁMBARO', '11', '1');
INSERT INTO `ciudad` VALUES ('122', 'APASEO EL ALTO', '11', '1');
INSERT INTO `ciudad` VALUES ('123', 'APASEO EL GRANDE', '11', '1');
INSERT INTO `ciudad` VALUES ('124', 'CELAYA', '11', '1');
INSERT INTO `ciudad` VALUES ('125', 'CIUDAD MANUEL DOBLADO', '11', '1');
INSERT INTO `ciudad` VALUES ('126', 'COMONFORT', '11', '1');
INSERT INTO `ciudad` VALUES ('127', 'CORTAZAR', '11', '1');
INSERT INTO `ciudad` VALUES ('128', 'CUERÁMARO', '11', '1');
INSERT INTO `ciudad` VALUES ('129', 'DOCTOR MORA', '11', '1');
INSERT INTO `ciudad` VALUES ('130', 'DOLORES HIDALGO CUNA DE LA INDEPENDENCIA NACIONAL', '11', '1');
INSERT INTO `ciudad` VALUES ('131', 'EMPALME ESCOBEDO (ESCOBEDO)', '11', '1');
INSERT INTO `ciudad` VALUES ('132', 'GUANAJUATO', '11', '1');
INSERT INTO `ciudad` VALUES ('133', 'HUANÍMARO', '11', '1');
INSERT INTO `ciudad` VALUES ('134', 'IRAPUATO', '11', '1');
INSERT INTO `ciudad` VALUES ('135', 'JARAL DEL PROGRESO', '11', '1');
INSERT INTO `ciudad` VALUES ('136', 'JERÉCUARO', '11', '1');
INSERT INTO `ciudad` VALUES ('137', 'LEÓN DE LOS ALDAMA', '11', '1');
INSERT INTO `ciudad` VALUES ('138', 'MARFIL', '11', '1');
INSERT INTO `ciudad` VALUES ('139', 'MOROLEÓN', '11', '1');
INSERT INTO `ciudad` VALUES ('140', 'PÉNJAMO', '11', '1');
INSERT INTO `ciudad` VALUES ('141', 'PURÍSIMA DE BUSTOS', '11', '1');
INSERT INTO `ciudad` VALUES ('142', 'RINCÓN DE TAMAYO', '11', '1');
INSERT INTO `ciudad` VALUES ('143', 'ROMITA', '11', '1');
INSERT INTO `ciudad` VALUES ('144', 'SALAMANCA', '11', '1');
INSERT INTO `ciudad` VALUES ('145', 'SALVATIERRA', '11', '1');
INSERT INTO `ciudad` VALUES ('146', 'SAN DIEGO DE LA UNIÓN', '11', '1');
INSERT INTO `ciudad` VALUES ('147', 'SAN FRANCISCO DEL RINCÓN', '11', '1');
INSERT INTO `ciudad` VALUES ('148', 'SAN JOSÉ ITURBIDE', '11', '1');
INSERT INTO `ciudad` VALUES ('149', 'SAN LUIS DE LA PAZ', '11', '1');
INSERT INTO `ciudad` VALUES ('150', 'SAN MIGUEL DE ALLENDE', '11', '1');
INSERT INTO `ciudad` VALUES ('151', 'SANTA CRUZ JUVENTINO ROSAS', '11', '1');
INSERT INTO `ciudad` VALUES ('152', 'SANTIAGO MARAVATÍO', '11', '1');
INSERT INTO `ciudad` VALUES ('153', 'SILAO', '11', '1');
INSERT INTO `ciudad` VALUES ('154', 'TARANDACUAO', '11', '1');
INSERT INTO `ciudad` VALUES ('155', 'URIANGATO', '11', '1');
INSERT INTO `ciudad` VALUES ('156', 'VALLE DE SANTIAGO', '11', '1');
INSERT INTO `ciudad` VALUES ('157', 'VILLAGRÁN', '11', '1');
INSERT INTO `ciudad` VALUES ('158', 'YURIRIA', '11', '1');
INSERT INTO `ciudad` VALUES ('159', 'ACAPULCO DE JUÁREZ', '12', '1');
INSERT INTO `ciudad` VALUES ('160', 'ARCELIA', '12', '1');
INSERT INTO `ciudad` VALUES ('161', 'ATOYAC DE ÁLVAREZ', '12', '1');
INSERT INTO `ciudad` VALUES ('162', 'AYUTLA DE LOS LIBRES', '12', '1');
INSERT INTO `ciudad` VALUES ('163', 'AZOYÚ', '12', '1');
INSERT INTO `ciudad` VALUES ('164', 'BUENAVISTA DE CUELLAR', '12', '1');
INSERT INTO `ciudad` VALUES ('165', 'CHILAPA DE ÁLVAREZ', '12', '1');
INSERT INTO `ciudad` VALUES ('166', 'CHILPANCINGO DE LOS BRAVO', '12', '1');
INSERT INTO `ciudad` VALUES ('167', 'CIUDAD ALTAMIRANO', '12', '1');
INSERT INTO `ciudad` VALUES ('168', 'CIUDAD APAXTLA DE CASTREJÓN', '12', '1');
INSERT INTO `ciudad` VALUES ('169', 'COPALA', '12', '1');
INSERT INTO `ciudad` VALUES ('170', 'COYUCA DE BENÍTEZ', '12', '1');
INSERT INTO `ciudad` VALUES ('171', 'COYUCA DE CATALÁN', '12', '1');
INSERT INTO `ciudad` VALUES ('172', 'CRUZ GRANDE', '12', '1');
INSERT INTO `ciudad` VALUES ('173', 'CUAJINICUILAPA', '12', '1');
INSERT INTO `ciudad` VALUES ('174', 'CUTZAMALA DE PINZÓN', '12', '1');
INSERT INTO `ciudad` VALUES ('175', 'HUAMUXTITLAN', '12', '1');
INSERT INTO `ciudad` VALUES ('176', 'HUITZUCO', '12', '1');
INSERT INTO `ciudad` VALUES ('177', 'IGUALA DE LA INDEPENDENCIA', '12', '1');
INSERT INTO `ciudad` VALUES ('178', 'LA UNIÓN', '12', '1');
INSERT INTO `ciudad` VALUES ('179', 'MARQUELIA', '12', '1');
INSERT INTO `ciudad` VALUES ('180', 'OCOTITO', '12', '1');
INSERT INTO `ciudad` VALUES ('181', 'OLINALÁ', '12', '1');
INSERT INTO `ciudad` VALUES ('182', 'PETATLÁN', '12', '1');
INSERT INTO `ciudad` VALUES ('183', 'SAN JERÓNIMO DE JUÁREZ', '12', '1');
INSERT INTO `ciudad` VALUES ('184', 'SAN LUIS ACATLÁN', '12', '1');
INSERT INTO `ciudad` VALUES ('185', 'SAN LUIS DE LA LOMA', '12', '1');
INSERT INTO `ciudad` VALUES ('186', 'SAN LUIS SAN PEDRO', '12', '1');
INSERT INTO `ciudad` VALUES ('187', 'SAN MARCOS', '12', '1');
INSERT INTO `ciudad` VALUES ('188', 'TAXCO DE ALARCÓN', '12', '1');
INSERT INTO `ciudad` VALUES ('189', 'TÉCPAN DE GALEANA', '12', '1');
INSERT INTO `ciudad` VALUES ('190', 'TELOLOAPAN', '12', '1');
INSERT INTO `ciudad` VALUES ('191', 'TEPECOACUILCO DE TRUJANO', '12', '1');
INSERT INTO `ciudad` VALUES ('192', 'TIERRA COLORADA', '12', '1');
INSERT INTO `ciudad` VALUES ('193', 'TIXTLA DE GUERRERO', '12', '1');
INSERT INTO `ciudad` VALUES ('194', 'TLALIXTAQUILLA', '12', '1');
INSERT INTO `ciudad` VALUES ('195', 'TLAPA DE COMONFORT', '12', '1');
INSERT INTO `ciudad` VALUES ('196', 'TLAPEHUALA', '12', '1');
INSERT INTO `ciudad` VALUES ('197', 'ZIHUATANEJO', '12', '1');
INSERT INTO `ciudad` VALUES ('198', 'ZUMPANGO DEL RÍO', '12', '1');
INSERT INTO `ciudad` VALUES ('199', 'ACTOPAN', '13', '1');
INSERT INTO `ciudad` VALUES ('200', 'APAN', '13', '1');
INSERT INTO `ciudad` VALUES ('201', 'CIUDAD DE FRAY BERNARDINO DE SAHAGÚN', '13', '1');
INSERT INTO `ciudad` VALUES ('202', 'CRUZ AZUL', '13', '1');
INSERT INTO `ciudad` VALUES ('203', 'HUEJUTLA DE REYES', '13', '1');
INSERT INTO `ciudad` VALUES ('204', 'IXMIQUILPAN', '13', '1');
INSERT INTO `ciudad` VALUES ('205', 'PACHUCA DE SOTO', '13', '1');
INSERT INTO `ciudad` VALUES ('206', 'SANTIAGO TULANTEPEC', '13', '1');
INSERT INTO `ciudad` VALUES ('207', 'TEPEAPULCO', '13', '1');
INSERT INTO `ciudad` VALUES ('208', 'TEPEJI DEL RIO', '13', '1');
INSERT INTO `ciudad` VALUES ('209', 'TIZAYUCA', '13', '1');
INSERT INTO `ciudad` VALUES ('210', 'TLAXCOAPAN', '13', '1');
INSERT INTO `ciudad` VALUES ('211', 'TULA DE ALLENDE', '13', '1');
INSERT INTO `ciudad` VALUES ('212', 'TULANCINGO', '13', '1');
INSERT INTO `ciudad` VALUES ('213', 'ZIMAPAN', '13', '1');
INSERT INTO `ciudad` VALUES ('214', 'ACATLÁN DE JUÁREZ', '14', '1');
INSERT INTO `ciudad` VALUES ('215', 'AHUALULCO DE MERCADO', '14', '1');
INSERT INTO `ciudad` VALUES ('216', 'AJIJIC', '14', '1');
INSERT INTO `ciudad` VALUES ('217', 'AMECA', '14', '1');
INSERT INTO `ciudad` VALUES ('218', 'ARANDAS', '14', '1');
INSERT INTO `ciudad` VALUES ('219', 'ATOTONILCO EL ALTO', '14', '1');
INSERT INTO `ciudad` VALUES ('220', 'AUTLÁN DE NAVARRO', '14', '1');
INSERT INTO `ciudad` VALUES ('221', 'CHAPALA', '14', '1');
INSERT INTO `ciudad` VALUES ('222', 'CIHUATLÁN', '14', '1');
INSERT INTO `ciudad` VALUES ('223', 'CIUDAD GUZMÁN', '14', '1');
INSERT INTO `ciudad` VALUES ('224', 'COCULA', '14', '1');
INSERT INTO `ciudad` VALUES ('225', 'COLOTLÁN', '14', '1');
INSERT INTO `ciudad` VALUES ('226', 'EL GRULLO', '14', '1');
INSERT INTO `ciudad` VALUES ('227', 'EL QUINCE (SAN JOSÉ EL QUINCE)', '14', '1');
INSERT INTO `ciudad` VALUES ('228', 'ETZATLÁN', '14', '1');
INSERT INTO `ciudad` VALUES ('229', 'GUADALAJARA', '14', '1');
INSERT INTO `ciudad` VALUES ('230', 'HUEJUQUILLA EL ALTO', '14', '1');
INSERT INTO `ciudad` VALUES ('231', 'JALOSTOTITLÁN', '14', '1');
INSERT INTO `ciudad` VALUES ('232', 'JAMAY', '14', '1');
INSERT INTO `ciudad` VALUES ('233', 'JOCOTEPEC', '14', '1');
INSERT INTO `ciudad` VALUES ('234', 'LA BARCA', '14', '1');
INSERT INTO `ciudad` VALUES ('235', 'LA RESOLANA', '14', '1');
INSERT INTO `ciudad` VALUES ('236', 'LAGOS DE MORENO', '14', '1');
INSERT INTO `ciudad` VALUES ('237', 'LAS PINTITAS', '14', '1');
INSERT INTO `ciudad` VALUES ('238', 'MAGDALENA', '14', '1');
INSERT INTO `ciudad` VALUES ('239', 'OCOTLÁN', '14', '1');
INSERT INTO `ciudad` VALUES ('240', 'PONCITLÁN', '14', '1');
INSERT INTO `ciudad` VALUES ('241', 'PUERTO VALLARTA', '14', '1');
INSERT INTO `ciudad` VALUES ('242', 'SAN DIEGO DE ALEJANDRÍA', '14', '1');
INSERT INTO `ciudad` VALUES ('243', 'SAN IGNACIO CERRO GORDO', '14', '1');
INSERT INTO `ciudad` VALUES ('244', 'SAN JOSÉ EL VERDE (EL VERDE)', '14', '1');
INSERT INTO `ciudad` VALUES ('245', 'SAN JUAN DE LOS LAGOS', '14', '1');
INSERT INTO `ciudad` VALUES ('246', 'SAN JULIÁN', '14', '1');
INSERT INTO `ciudad` VALUES ('247', 'SAN MIGUEL EL ALTO', '14', '1');
INSERT INTO `ciudad` VALUES ('248', 'SAYULA', '14', '1');
INSERT INTO `ciudad` VALUES ('249', 'TALA', '14', '1');
INSERT INTO `ciudad` VALUES ('250', 'TALPA DE ALLENDE', '14', '1');
INSERT INTO `ciudad` VALUES ('251', 'TAMAZULA DE GORDIANO', '14', '1');
INSERT INTO `ciudad` VALUES ('252', 'TECALITLÁN', '14', '1');
INSERT INTO `ciudad` VALUES ('253', 'TEOCALTICHE', '14', '1');
INSERT INTO `ciudad` VALUES ('254', 'TEPATITLÁN DE MORELOS', '14', '1');
INSERT INTO `ciudad` VALUES ('255', 'TEQUILA', '14', '1');
INSERT INTO `ciudad` VALUES ('256', 'TLAJOMULCO DE ZÚÑIGA', '14', '1');
INSERT INTO `ciudad` VALUES ('257', 'TLAQUEPAQUE', '14', '1');
INSERT INTO `ciudad` VALUES ('258', 'TONALÁ', '14', '1');
INSERT INTO `ciudad` VALUES ('259', 'TOTOTLÁN', '14', '1');
INSERT INTO `ciudad` VALUES ('260', 'TUXPAN', '14', '1');
INSERT INTO `ciudad` VALUES ('261', 'UNIÓN DE SAN ANTONIO', '14', '1');
INSERT INTO `ciudad` VALUES ('262', 'VALLE DE GUADALUPE', '14', '1');
INSERT INTO `ciudad` VALUES ('263', 'VILLA CORONA', '14', '1');
INSERT INTO `ciudad` VALUES ('264', 'VILLA HIDALGO', '14', '1');
INSERT INTO `ciudad` VALUES ('265', 'YAHUALICA DE GONZÁLEZ GALLO', '14', '1');
INSERT INTO `ciudad` VALUES ('266', 'ZACOALCO DE TORRES', '14', '1');
INSERT INTO `ciudad` VALUES ('267', 'ZAPOPAN', '14', '1');
INSERT INTO `ciudad` VALUES ('268', 'ZAPOTILTIC', '14', '1');
INSERT INTO `ciudad` VALUES ('269', 'ALMOLOYA DE JUÁREZ', '15', '1');
INSERT INTO `ciudad` VALUES ('270', 'AMATEPEC', '15', '1');
INSERT INTO `ciudad` VALUES ('271', 'CAPULHUAC', '15', '1');
INSERT INTO `ciudad` VALUES ('272', 'CHALCO DE DÍAZ COVARRUBIAS', '15', '1');
INSERT INTO `ciudad` VALUES ('273', 'CHICONCUAC', '15', '1');
INSERT INTO `ciudad` VALUES ('274', 'CHIMALHUACÁN', '15', '1');
INSERT INTO `ciudad` VALUES ('275', 'CIUDAD ADOLFO LÓPEZ MATEOS', '15', '1');
INSERT INTO `ciudad` VALUES ('276', 'CIUDAD NEZAHUALCOYOTL', '15', '1');
INSERT INTO `ciudad` VALUES ('277', 'COACALCO DE BERRIOZABAL', '15', '1');
INSERT INTO `ciudad` VALUES ('278', 'CUAUTITLÁN', '15', '1');
INSERT INTO `ciudad` VALUES ('279', 'CUAUTITLÁN IZCALLI', '15', '1');
INSERT INTO `ciudad` VALUES ('280', 'ECATEPEC DE MORELOS', '15', '1');
INSERT INTO `ciudad` VALUES ('281', 'HUIXQUILUCAN DE DEGOLLADO', '15', '1');
INSERT INTO `ciudad` VALUES ('282', 'IXTAPALUCA', '15', '1');
INSERT INTO `ciudad` VALUES ('283', 'JUCHITEPEC DE MARIANO RIVA PALACIO', '15', '1');
INSERT INTO `ciudad` VALUES ('284', 'LOS REYES ACAQUILPAN (LA PAZ)', '15', '1');
INSERT INTO `ciudad` VALUES ('285', 'MELCHOR OCAMPO', '15', '1');
INSERT INTO `ciudad` VALUES ('286', 'METEPEC', '15', '1');
INSERT INTO `ciudad` VALUES ('287', 'NAUCALPAN DE JUÁREZ', '15', '1');
INSERT INTO `ciudad` VALUES ('288', 'OCOYOACAC', '15', '1');
INSERT INTO `ciudad` VALUES ('289', 'SAN MATEO ATENCO', '15', '1');
INSERT INTO `ciudad` VALUES ('290', 'SAN VICENTE CHICOLOAPAN DE JUÁREZ', '15', '1');
INSERT INTO `ciudad` VALUES ('291', 'SANTA MARIA TULTEPEC', '15', '1');
INSERT INTO `ciudad` VALUES ('292', 'TECAMAC DE FELIPE VILLANUEVA', '15', '1');
INSERT INTO `ciudad` VALUES ('293', 'TEJUPILCO DE HIDALGO', '15', '1');
INSERT INTO `ciudad` VALUES ('294', 'TEPOTZOTLÁN', '15', '1');
INSERT INTO `ciudad` VALUES ('295', 'TEQUIXQUIAC', '15', '1');
INSERT INTO `ciudad` VALUES ('296', 'TEXCOCO DE MORA', '15', '1');
INSERT INTO `ciudad` VALUES ('297', 'TLALNEPANTLA DE BAZ', '15', '1');
INSERT INTO `ciudad` VALUES ('298', 'TOLUCA DE LERDO', '15', '1');
INSERT INTO `ciudad` VALUES ('299', 'TULTITLÁN DE MARIANO ESCOBEDO', '15', '1');
INSERT INTO `ciudad` VALUES ('300', 'VALLE DE CHALCO SOLIDARIDAD', '15', '1');
INSERT INTO `ciudad` VALUES ('301', 'VILLA NICOLÁS ROMERO', '15', '1');
INSERT INTO `ciudad` VALUES ('302', 'XONACATLÁN', '15', '1');
INSERT INTO `ciudad` VALUES ('303', 'ZUMPANGO', '15', '1');
INSERT INTO `ciudad` VALUES ('304', 'APATZINGÁN DE LA CONSTITUCIÓN', '16', '1');
INSERT INTO `ciudad` VALUES ('305', 'CIUDAD HIDALGO', '16', '1');
INSERT INTO `ciudad` VALUES ('306', 'CIUDAD LÁZARO CÁRDENAS', '16', '1');
INSERT INTO `ciudad` VALUES ('307', 'COTIJA DE LA PAZ', '16', '1');
INSERT INTO `ciudad` VALUES ('308', 'CUITZEO DEL PORVENIR', '16', '1');
INSERT INTO `ciudad` VALUES ('309', 'HEROICA ZITÁCUARO', '16', '1');
INSERT INTO `ciudad` VALUES ('310', 'HUETAMO DE NÚÑEZ', '16', '1');
INSERT INTO `ciudad` VALUES ('311', 'JACONA DE PLANCARTE', '16', '1');
INSERT INTO `ciudad` VALUES ('312', 'JIQUILPAN DE JUÁREZ', '16', '1');
INSERT INTO `ciudad` VALUES ('313', 'LA PIEDAD DE CABADAS', '16', '1');
INSERT INTO `ciudad` VALUES ('314', 'LAS GUACAMAYAS', '16', '1');
INSERT INTO `ciudad` VALUES ('315', 'LOS REYES DE SALGADO', '16', '1');
INSERT INTO `ciudad` VALUES ('316', 'MARAVATÍO DE OCAMPO', '16', '1');
INSERT INTO `ciudad` VALUES ('317', 'MORELIA', '16', '1');
INSERT INTO `ciudad` VALUES ('318', 'NUEVA ITALIA DE RUIZ', '16', '1');
INSERT INTO `ciudad` VALUES ('319', 'PARACHO DE VERDUZCO', '16', '1');
INSERT INTO `ciudad` VALUES ('320', 'PÁTZCUARO', '16', '1');
INSERT INTO `ciudad` VALUES ('321', 'PURUÁNDIRO', '16', '1');
INSERT INTO `ciudad` VALUES ('322', 'SAHUAYO DE MORELOS', '16', '1');
INSERT INTO `ciudad` VALUES ('323', 'TACÁMBARO DE CODALLOS', '16', '1');
INSERT INTO `ciudad` VALUES ('324', 'TANGANCÍCUARO DE ARISTA', '16', '1');
INSERT INTO `ciudad` VALUES ('325', 'TUXPAN', '16', '1');
INSERT INTO `ciudad` VALUES ('326', 'URUAPAN', '16', '1');
INSERT INTO `ciudad` VALUES ('327', 'YURÉCUARO', '16', '1');
INSERT INTO `ciudad` VALUES ('328', 'ZACAPU', '16', '1');
INSERT INTO `ciudad` VALUES ('329', 'ZAMORA DE HIDALGO', '16', '1');
INSERT INTO `ciudad` VALUES ('330', 'ZINAPÉCUARO DE FIGUEROA', '16', '1');
INSERT INTO `ciudad` VALUES ('331', 'CUAUTLA (CUAUTLA DE MORELOS)', '17', '1');
INSERT INTO `ciudad` VALUES ('332', 'CUERNAVACA', '17', '1');
INSERT INTO `ciudad` VALUES ('333', 'GALEANA', '17', '1');
INSERT INTO `ciudad` VALUES ('334', 'JOJUTLA', '17', '1');
INSERT INTO `ciudad` VALUES ('335', 'PUENTE DE IXTLA', '17', '1');
INSERT INTO `ciudad` VALUES ('336', 'SANTA ROSA TREINTA', '17', '1');
INSERT INTO `ciudad` VALUES ('337', 'TLAQUILTENANGO', '17', '1');
INSERT INTO `ciudad` VALUES ('338', 'ZACATEPEC DE HIDALGO', '17', '1');
INSERT INTO `ciudad` VALUES ('339', 'ACAPONETA', '18', '1');
INSERT INTO `ciudad` VALUES ('340', 'AHUACATLÁN', '18', '1');
INSERT INTO `ciudad` VALUES ('341', 'BUCERÍAS', '18', '1');
INSERT INTO `ciudad` VALUES ('342', 'COMPOSTELA', '18', '1');
INSERT INTO `ciudad` VALUES ('343', 'FRANCISCO I. MADERO (PUGA)', '18', '1');
INSERT INTO `ciudad` VALUES ('344', 'IXTLÁN DEL RÍO', '18', '1');
INSERT INTO `ciudad` VALUES ('345', 'JALA', '18', '1');
INSERT INTO `ciudad` VALUES ('346', 'LA PEÑITA DE JALTEMBA', '18', '1');
INSERT INTO `ciudad` VALUES ('347', 'LAS VARAS', '18', '1');
INSERT INTO `ciudad` VALUES ('348', 'RUIZ', '18', '1');
INSERT INTO `ciudad` VALUES ('349', 'SAN BLAS', '18', '1');
INSERT INTO `ciudad` VALUES ('350', 'SAN PEDRO LAGUNILLAS', '18', '1');
INSERT INTO `ciudad` VALUES ('351', 'SANTIAGO IXCUINTLA', '18', '1');
INSERT INTO `ciudad` VALUES ('352', 'TECUALA', '18', '1');
INSERT INTO `ciudad` VALUES ('353', 'TEPIC', '18', '1');
INSERT INTO `ciudad` VALUES ('354', 'TUXPAN', '18', '1');
INSERT INTO `ciudad` VALUES ('355', 'VILLA HIDALGO (EL NUEVO)', '18', '1');
INSERT INTO `ciudad` VALUES ('356', 'XALISCO', '18', '1');
INSERT INTO `ciudad` VALUES ('357', 'ANÁHUAC', '19', '1');
INSERT INTO `ciudad` VALUES ('358', 'CADEREYTA JIMÉNEZ', '19', '1');
INSERT INTO `ciudad` VALUES ('359', 'CIÉNEGA DE FLORES', '19', '1');
INSERT INTO `ciudad` VALUES ('360', 'CIUDAD APODACA', '19', '1');
INSERT INTO `ciudad` VALUES ('361', 'CIUDAD BENITO JUÁREZ', '19', '1');
INSERT INTO `ciudad` VALUES ('362', 'CIUDAD GENERAL ESCOBEDO', '19', '1');
INSERT INTO `ciudad` VALUES ('363', 'CIUDAD SABINAS HIDALGO', '19', '1');
INSERT INTO `ciudad` VALUES ('364', 'CIUDAD SANTA CATARINA', '19', '1');
INSERT INTO `ciudad` VALUES ('365', 'CIUDAD SANTA CATARINA', '19', '1');
INSERT INTO `ciudad` VALUES ('366', 'DOCTOR ARROYO', '19', '1');
INSERT INTO `ciudad` VALUES ('367', 'EL CERCADO', '19', '1');
INSERT INTO `ciudad` VALUES ('368', 'GARCÍA', '19', '1');
INSERT INTO `ciudad` VALUES ('369', 'GUADALUPE', '19', '1');
INSERT INTO `ciudad` VALUES ('370', 'HUALAHUISES', '19', '1');
INSERT INTO `ciudad` VALUES ('371', 'LINARES', '19', '1');
INSERT INTO `ciudad` VALUES ('372', 'MONTEMORELOS', '19', '1');
INSERT INTO `ciudad` VALUES ('373', 'MONTERREY', '19', '1');
INSERT INTO `ciudad` VALUES ('374', 'SAN NICOLÁS DE LOS GARZA', '19', '1');
INSERT INTO `ciudad` VALUES ('375', 'SAN PEDRO GARZA GARCÍA', '19', '1');
INSERT INTO `ciudad` VALUES ('376', 'SANTIAGO', '19', '1');
INSERT INTO `ciudad` VALUES ('377', 'ASUNCIÓN NOCHIXTLÁN', '20', '1');
INSERT INTO `ciudad` VALUES ('378', 'BAHIAS DE HUATULCO', '20', '1');
INSERT INTO `ciudad` VALUES ('379', 'CHAHUITES', '20', '1');
INSERT INTO `ciudad` VALUES ('380', 'CIUDAD IXTEPEC', '20', '1');
INSERT INTO `ciudad` VALUES ('381', 'COSOLAPA', '20', '1');
INSERT INTO `ciudad` VALUES ('382', 'CUILÁPAM DE GUERRERO', '20', '1');
INSERT INTO `ciudad` VALUES ('383', 'EL CAMARÓN', '20', '1');
INSERT INTO `ciudad` VALUES ('384', 'EL ROSARIO', '20', '1');
INSERT INTO `ciudad` VALUES ('385', 'HEROICA CIUDAD DE EJUTLA DE CRESPO', '20', '1');
INSERT INTO `ciudad` VALUES ('386', 'HEROICA CIUDAD DE HUAJUAPAN DE LEÓN', '20', '1');
INSERT INTO `ciudad` VALUES ('387', 'HEROICA CIUDAD DE TLAXIACO', '20', '1');
INSERT INTO `ciudad` VALUES ('388', 'JUCHITÁN (JUCHITÁN DE ZARAGOZA)', '20', '1');
INSERT INTO `ciudad` VALUES ('389', 'LAGUNAS', '20', '1');
INSERT INTO `ciudad` VALUES ('390', 'LOMA BONITA', '20', '1');
INSERT INTO `ciudad` VALUES ('391', 'MARISCALA DE JUÁREZ', '20', '1');
INSERT INTO `ciudad` VALUES ('392', 'MATÍAS ROMERO AVENDAÑO', '20', '1');
INSERT INTO `ciudad` VALUES ('393', 'MIAHUATLÁN DE PORFIRIO DÍAZ', '20', '1');
INSERT INTO `ciudad` VALUES ('394', 'NATIVIDAD', '20', '1');
INSERT INTO `ciudad` VALUES ('395', 'OAXACA DE JUÁREZ', '20', '1');
INSERT INTO `ciudad` VALUES ('396', 'OCOTLÁN DE MORELOS', '20', '1');
INSERT INTO `ciudad` VALUES ('397', 'PUERTO ESCONDIDO', '20', '1');
INSERT INTO `ciudad` VALUES ('398', 'PUTLA VILLA DE GUERRERO', '20', '1');
INSERT INTO `ciudad` VALUES ('399', 'RÍO GRANDE O PIEDRA PARADA', '20', '1');
INSERT INTO `ciudad` VALUES ('400', 'SALINA CRUZ', '20', '1');
INSERT INTO `ciudad` VALUES ('401', 'SAN ANTONIO DE LA CAL', '20', '1');
INSERT INTO `ciudad` VALUES ('402', 'SAN BLAS ATEMPA', '20', '1');
INSERT INTO `ciudad` VALUES ('403', 'SAN FELIPE JALAPA DE DÍAZ', '20', '1');
INSERT INTO `ciudad` VALUES ('404', 'SAN FRANCISCO IXHUATÁN', '20', '1');
INSERT INTO `ciudad` VALUES ('405', 'SAN FRANCISCO TELIXTLAHUACA', '20', '1');
INSERT INTO `ciudad` VALUES ('406', 'SAN JUAN BAUTISTA CUICATLÁN', '20', '1');
INSERT INTO `ciudad` VALUES ('407', 'SAN JUAN BAUTISTA LO DE SOTO', '20', '1');
INSERT INTO `ciudad` VALUES ('408', 'SAN JUAN BAUTISTA TUXTEPEC', '20', '1');
INSERT INTO `ciudad` VALUES ('409', 'SAN JUAN BAUTISTA VALLE NACIONAL', '20', '1');
INSERT INTO `ciudad` VALUES ('410', 'SAN JUAN CACAHUATEPEC', '20', '1');
INSERT INTO `ciudad` VALUES ('411', 'SAN MIGUEL EL GRANDE', '20', '1');
INSERT INTO `ciudad` VALUES ('412', 'SAN PABLO HUITZO', '20', '1');
INSERT INTO `ciudad` VALUES ('413', 'SAN PABLO VILLA DE MITLA', '20', '1');
INSERT INTO `ciudad` VALUES ('414', 'SAN PEDRO MIXTEPEC -DTO. 22-', '20', '1');
INSERT INTO `ciudad` VALUES ('415', 'SAN PEDRO POCHUTLA', '20', '1');
INSERT INTO `ciudad` VALUES ('416', 'SAN PEDRO TAPANATEPEC', '20', '1');
INSERT INTO `ciudad` VALUES ('417', 'SAN PEDRO TOTOLAPA', '20', '1');
INSERT INTO `ciudad` VALUES ('418', 'SAN SEBASTIÁN TECOMAXTLAHUACA', '20', '1');
INSERT INTO `ciudad` VALUES ('419', 'SANTA CRUZ ITUNDUJIA', '20', '1');
INSERT INTO `ciudad` VALUES ('420', 'SANTA LUCIA DEL CAMINO', '20', '1');
INSERT INTO `ciudad` VALUES ('421', 'SANTA MARÍA HUATULCO', '20', '1');
INSERT INTO `ciudad` VALUES ('422', 'SANTIAGO JAMILTEPEC', '20', '1');
INSERT INTO `ciudad` VALUES ('423', 'SANTIAGO JUXTLAHUACA', '20', '1');
INSERT INTO `ciudad` VALUES ('424', 'SANTIAGO PINOTEPA NACIONAL', '20', '1');
INSERT INTO `ciudad` VALUES ('425', 'SANTIAGO SUCHILQUITONGO', '20', '1');
INSERT INTO `ciudad` VALUES ('426', 'SANTO DOMINGO TEHUANTEPEC', '20', '1');
INSERT INTO `ciudad` VALUES ('427', 'TEOTITLÁN DE FLORES MAGÓN', '20', '1');
INSERT INTO `ciudad` VALUES ('428', 'TLACOLULA DE MATAMOROS', '20', '1');
INSERT INTO `ciudad` VALUES ('429', 'UNIÓN HIDALGO', '20', '1');
INSERT INTO `ciudad` VALUES ('430', 'VICENTE CAMALOTE', '20', '1');
INSERT INTO `ciudad` VALUES ('431', 'VILLA DE TAMAZULÁPAM DEL PROGRESO', '20', '1');
INSERT INTO `ciudad` VALUES ('432', 'VILLA DE ZAACHILA', '20', '1');
INSERT INTO `ciudad` VALUES ('433', 'VILLA SOLA DE VEGA', '20', '1');
INSERT INTO `ciudad` VALUES ('434', 'ZIMATLÁN DE ÁLVAREZ', '20', '1');
INSERT INTO `ciudad` VALUES ('435', 'ACATLÁN DE OSORIO', '21', '1');
INSERT INTO `ciudad` VALUES ('436', 'AMOZOC', '21', '1');
INSERT INTO `ciudad` VALUES ('437', 'ATLIXCO', '21', '1');
INSERT INTO `ciudad` VALUES ('438', 'CIUDAD SERDÁN', '21', '1');
INSERT INTO `ciudad` VALUES ('439', 'CUAUTLANCINGO', '21', '1');
INSERT INTO `ciudad` VALUES ('440', 'HUAUCHINANGO', '21', '1');
INSERT INTO `ciudad` VALUES ('441', 'IZÚCAR DE MATAMOROS', '21', '1');
INSERT INTO `ciudad` VALUES ('442', 'PUEBLA (HEROICA PUEBLA)', '21', '1');
INSERT INTO `ciudad` VALUES ('443', 'SAN ANDRÉS CHOLULA', '21', '1');
INSERT INTO `ciudad` VALUES ('444', 'SAN MARTÍN TEXMELUCAN DE LABASTIDA', '21', '1');
INSERT INTO `ciudad` VALUES ('445', 'SAN PEDRO CHOLULA', '21', '1');
INSERT INTO `ciudad` VALUES ('446', 'TECAMACHALCO', '21', '1');
INSERT INTO `ciudad` VALUES ('447', 'TEHUACAN', '21', '1');
INSERT INTO `ciudad` VALUES ('448', 'TEPEACA', '21', '1');
INSERT INTO `ciudad` VALUES ('449', 'TEZIUTLAN', '21', '1');
INSERT INTO `ciudad` VALUES ('450', 'XICOTEPEC', '21', '1');
INSERT INTO `ciudad` VALUES ('451', 'ZACATLÁN', '21', '1');
INSERT INTO `ciudad` VALUES ('452', 'EL PUEBLITO', '22', '1');
INSERT INTO `ciudad` VALUES ('453', 'QUERÉTARO', '22', '1');
INSERT INTO `ciudad` VALUES ('454', 'SAN JUAN DEL RIO', '22', '1');
INSERT INTO `ciudad` VALUES ('455', 'BACALAR', '23', '1');
INSERT INTO `ciudad` VALUES ('456', 'CANCÚN', '23', '1');
INSERT INTO `ciudad` VALUES ('457', 'CHETUMAL', '23', '1');
INSERT INTO `ciudad` VALUES ('458', 'COZUMEL', '23', '1');
INSERT INTO `ciudad` VALUES ('459', 'FELIPE CARRILLO PUERTO', '23', '1');
INSERT INTO `ciudad` VALUES ('460', 'ISLA MUJERES', '23', '1');
INSERT INTO `ciudad` VALUES ('461', 'KANTUNILKÍN', '23', '1');
INSERT INTO `ciudad` VALUES ('462', 'PLAYA DEL CARMEN', '23', '1');
INSERT INTO `ciudad` VALUES ('463', 'CÁRDENAS', '24', '1');
INSERT INTO `ciudad` VALUES ('464', 'CEDRAL', '24', '1');
INSERT INTO `ciudad` VALUES ('465', 'CERRITOS', '24', '1');
INSERT INTO `ciudad` VALUES ('466', 'CHARCAS', '24', '1');
INSERT INTO `ciudad` VALUES ('467', 'CIUDAD DEL MAÍZ', '24', '1');
INSERT INTO `ciudad` VALUES ('468', 'CIUDAD VALLES', '24', '1');
INSERT INTO `ciudad` VALUES ('469', 'ÉBANO', '24', '1');
INSERT INTO `ciudad` VALUES ('470', 'EL NARANJO', '24', '1');
INSERT INTO `ciudad` VALUES ('471', 'FRACCIÓN EL REFUGIO', '24', '1');
INSERT INTO `ciudad` VALUES ('472', 'MATEHUALA', '24', '1');
INSERT INTO `ciudad` VALUES ('473', 'RIOVERDE', '24', '1');
INSERT INTO `ciudad` VALUES ('474', 'SALINAS DE HIDALGO', '24', '1');
INSERT INTO `ciudad` VALUES ('475', 'SAN LUIS POTOSÍ', '24', '1');
INSERT INTO `ciudad` VALUES ('476', 'SANTA MARÍA DEL RÍO', '24', '1');
INSERT INTO `ciudad` VALUES ('477', 'SOLEDAD DE GRACIANO SÁNCHEZ', '24', '1');
INSERT INTO `ciudad` VALUES ('478', 'TAMASOPO', '24', '1');
INSERT INTO `ciudad` VALUES ('479', 'TAMAZUNCHALE', '24', '1');
INSERT INTO `ciudad` VALUES ('480', 'TAMUIN', '24', '1');
INSERT INTO `ciudad` VALUES ('481', 'TIERRA NUEVA', '24', '1');
INSERT INTO `ciudad` VALUES ('482', 'VILLA DE REYES', '24', '1');
INSERT INTO `ciudad` VALUES ('483', 'AGUARUTO', '25', '1');
INSERT INTO `ciudad` VALUES ('484', 'AHOME', '25', '1');
INSERT INTO `ciudad` VALUES ('485', 'ANGOSTURA', '25', '1');
INSERT INTO `ciudad` VALUES ('486', 'CHOIX', '25', '1');
INSERT INTO `ciudad` VALUES ('487', 'COSALÁ', '25', '1');
INSERT INTO `ciudad` VALUES ('488', 'CULIACÁN ROSALES', '25', '1');
INSERT INTO `ciudad` VALUES ('489', 'EL ROSARIO', '25', '1');
INSERT INTO `ciudad` VALUES ('490', 'ESCUINAPA DE HIDALGO', '25', '1');
INSERT INTO `ciudad` VALUES ('491', 'ESTACIÓN NARANJO', '25', '1');
INSERT INTO `ciudad` VALUES ('492', 'GUAMÚCHIL', '25', '1');
INSERT INTO `ciudad` VALUES ('493', 'GUASAVE', '25', '1');
INSERT INTO `ciudad` VALUES ('494', 'HIGUERA DE ZARAGOZA', '25', '1');
INSERT INTO `ciudad` VALUES ('495', 'LA CRUZ', '25', '1');
INSERT INTO `ciudad` VALUES ('496', 'LIC. BENITO JUÁREZ (CAMPO GOBIERNO)', '25', '1');
INSERT INTO `ciudad` VALUES ('497', 'LOS MOCHIS', '25', '1');
INSERT INTO `ciudad` VALUES ('498', 'MAZATLÁN', '25', '1');
INSERT INTO `ciudad` VALUES ('499', 'MOCORITO', '25', '1');
INSERT INTO `ciudad` VALUES ('500', 'NAVOLATO', '25', '1');
INSERT INTO `ciudad` VALUES ('501', 'QUILA', '25', '1');
INSERT INTO `ciudad` VALUES ('502', 'SAN BLAS', '25', '1');
INSERT INTO `ciudad` VALUES ('503', 'SAN IGNACIO', '25', '1');
INSERT INTO `ciudad` VALUES ('504', 'SINALOA DE LEYVA', '25', '1');
INSERT INTO `ciudad` VALUES ('505', 'TOPOLOBAMPO', '25', '1');
INSERT INTO `ciudad` VALUES ('506', 'VILLA UNIÓN', '25', '1');
INSERT INTO `ciudad` VALUES ('507', 'AGUA PRIETA', '26', '1');
INSERT INTO `ciudad` VALUES ('508', 'CIUDAD OBREGÓN', '26', '1');
INSERT INTO `ciudad` VALUES ('509', 'EMPALME', '26', '1');
INSERT INTO `ciudad` VALUES ('510', 'HERMOSILLO', '26', '1');
INSERT INTO `ciudad` VALUES ('511', 'HEROICA CABORCA', '26', '1');
INSERT INTO `ciudad` VALUES ('512', 'HEROICA CIUDAD DE CANANEA', '26', '1');
INSERT INTO `ciudad` VALUES ('513', 'HEROICA GUAYMAS', '26', '1');
INSERT INTO `ciudad` VALUES ('514', 'HEROICA NOGALES', '26', '1');
INSERT INTO `ciudad` VALUES ('515', 'HUATABAMPO', '26', '1');
INSERT INTO `ciudad` VALUES ('516', 'MAGDALENA DE KINO', '26', '1');
INSERT INTO `ciudad` VALUES ('517', 'NAVOJOA', '26', '1');
INSERT INTO `ciudad` VALUES ('518', 'PUERTO PEÑASCO', '26', '1');
INSERT INTO `ciudad` VALUES ('519', 'SAN LUIS RÍO COLORADO', '26', '1');
INSERT INTO `ciudad` VALUES ('520', 'SONOITA', '26', '1');
INSERT INTO `ciudad` VALUES ('521', 'CÁRDENAS', '27', '1');
INSERT INTO `ciudad` VALUES ('522', 'COMALCALCO', '27', '1');
INSERT INTO `ciudad` VALUES ('523', 'CUNDUACÁN', '27', '1');
INSERT INTO `ciudad` VALUES ('524', 'EMILIANO ZAPATA', '27', '1');
INSERT INTO `ciudad` VALUES ('525', 'FRONTERA', '27', '1');
INSERT INTO `ciudad` VALUES ('526', 'HUIMANGUILLO', '27', '1');
INSERT INTO `ciudad` VALUES ('527', 'JALPA DE MÉNDEZ', '27', '1');
INSERT INTO `ciudad` VALUES ('528', 'MACUSPANA', '27', '1');
INSERT INTO `ciudad` VALUES ('529', 'PARAÍSO', '27', '1');
INSERT INTO `ciudad` VALUES ('530', 'TEAPA', '27', '1');
INSERT INTO `ciudad` VALUES ('531', 'TENOSIQUE DE PINO SUÁREZ', '27', '1');
INSERT INTO `ciudad` VALUES ('532', 'VILLAHERMOSA', '27', '1');
INSERT INTO `ciudad` VALUES ('533', 'ALTAMIRA', '28', '1');
INSERT INTO `ciudad` VALUES ('534', 'CIUDAD CAMARGO', '28', '1');
INSERT INTO `ciudad` VALUES ('535', 'CIUDAD GUSTAVO DÍAZ ORDAZ', '28', '1');
INSERT INTO `ciudad` VALUES ('536', 'CIUDAD MADERO', '28', '1');
INSERT INTO `ciudad` VALUES ('537', 'CIUDAD MANTE', '28', '1');
INSERT INTO `ciudad` VALUES ('538', 'CIUDAD MIGUEL ALEMÁN', '28', '1');
INSERT INTO `ciudad` VALUES ('539', 'CIUDAD RÍO BRAVO', '28', '1');
INSERT INTO `ciudad` VALUES ('540', 'CIUDAD TULA', '28', '1');
INSERT INTO `ciudad` VALUES ('541', 'CIUDAD VICTORIA', '28', '1');
INSERT INTO `ciudad` VALUES ('542', 'ESTACIÓN MANUEL (ÚRSULO GALVÁN)', '28', '1');
INSERT INTO `ciudad` VALUES ('543', 'GONZÁLEZ', '28', '1');
INSERT INTO `ciudad` VALUES ('544', 'HEROICA MATAMOROS', '28', '1');
INSERT INTO `ciudad` VALUES ('545', 'JAUMAVE', '28', '1');
INSERT INTO `ciudad` VALUES ('546', 'NUEVA CIUDAD GUERRERO', '28', '1');
INSERT INTO `ciudad` VALUES ('547', 'NUEVO LAREDO', '28', '1');
INSERT INTO `ciudad` VALUES ('548', 'REYNOSA', '28', '1');
INSERT INTO `ciudad` VALUES ('549', 'SAN FERNANDO', '28', '1');
INSERT INTO `ciudad` VALUES ('550', 'SOTO LA MARINA', '28', '1');
INSERT INTO `ciudad` VALUES ('551', 'TAMPICO', '28', '1');
INSERT INTO `ciudad` VALUES ('552', 'VALLE HERMOSO', '28', '1');
INSERT INTO `ciudad` VALUES ('553', 'XICOTÉNCATL', '28', '1');
INSERT INTO `ciudad` VALUES ('554', 'APIZACO', '29', '1');
INSERT INTO `ciudad` VALUES ('555', 'CALPULALPAN', '29', '1');
INSERT INTO `ciudad` VALUES ('556', 'CHIAUTEMPAN', '29', '1');
INSERT INTO `ciudad` VALUES ('557', 'HUAMANTLA', '29', '1');
INSERT INTO `ciudad` VALUES ('558', 'TLAXCALA (TLAXCALA DE XICOTENCATL)', '29', '1');
INSERT INTO `ciudad` VALUES ('559', 'VILLA VICENTE GUERRERO', '29', '1');
INSERT INTO `ciudad` VALUES ('560', 'ACAYUCAN', '30', '1');
INSERT INTO `ciudad` VALUES ('561', 'AGUA DULCE', '30', '1');
INSERT INTO `ciudad` VALUES ('562', 'ALTOTONGA', '30', '1');
INSERT INTO `ciudad` VALUES ('563', 'ALVARADO', '30', '1');
INSERT INTO `ciudad` VALUES ('564', 'ÁNGEL R. CABADA', '30', '1');
INSERT INTO `ciudad` VALUES ('565', 'ATOYAC', '30', '1');
INSERT INTO `ciudad` VALUES ('566', 'BANDERILLA', '30', '1');
INSERT INTO `ciudad` VALUES ('567', 'BOCA DEL RÍO', '30', '1');
INSERT INTO `ciudad` VALUES ('568', 'CARLOS A. CARRILLO', '30', '1');
INSERT INTO `ciudad` VALUES ('569', 'CATEMACO', '30', '1');
INSERT INTO `ciudad` VALUES ('570', 'CAZONES DE HERRERA', '30', '1');
INSERT INTO `ciudad` VALUES ('571', 'CERRO AZUL', '30', '1');
INSERT INTO `ciudad` VALUES ('572', 'COATEPEC', '30', '1');
INSERT INTO `ciudad` VALUES ('573', 'COATZACOALCOS', '30', '1');
INSERT INTO `ciudad` VALUES ('574', 'COATZINTLA', '30', '1');
INSERT INTO `ciudad` VALUES ('575', 'CÓRDOBA', '30', '1');
INSERT INTO `ciudad` VALUES ('576', 'COSAMALOAPAN', '30', '1');
INSERT INTO `ciudad` VALUES ('577', 'COSOLEACAQUE', '30', '1');
INSERT INTO `ciudad` VALUES ('578', 'CUICHAPA', '30', '1');
INSERT INTO `ciudad` VALUES ('579', 'CUITLÁHUAC', '30', '1');
INSERT INTO `ciudad` VALUES ('580', 'EL HIGO', '30', '1');
INSERT INTO `ciudad` VALUES ('581', 'FORTÍN DE LAS FLORES', '30', '1');
INSERT INTO `ciudad` VALUES ('582', 'GENERAL MIGUEL ALEMÁN (POTRERO NUEVO)', '30', '1');
INSERT INTO `ciudad` VALUES ('583', 'GUTIÉRREZ ZAMORA', '30', '1');
INSERT INTO `ciudad` VALUES ('584', 'HUATUSCO DE CHICUELLAR', '30', '1');
INSERT INTO `ciudad` VALUES ('585', 'HUAYACOCOTLA', '30', '1');
INSERT INTO `ciudad` VALUES ('586', 'HUILOAPAN DE CUAUHTÉMOC', '30', '1');
INSERT INTO `ciudad` VALUES ('587', 'ISLA', '30', '1');
INSERT INTO `ciudad` VALUES ('588', 'IXTACZOQUITLÁN', '30', '1');
INSERT INTO `ciudad` VALUES ('589', 'JÁLTIPAN DE MORELOS', '30', '1');
INSERT INTO `ciudad` VALUES ('590', 'JOSÉ CARDEL', '30', '1');
INSERT INTO `ciudad` VALUES ('591', 'JUAN DÍAZ COVARRUBIAS', '30', '1');
INSERT INTO `ciudad` VALUES ('592', 'JUAN RODRÍGUEZ CLARA', '30', '1');
INSERT INTO `ciudad` VALUES ('593', 'LAS CHOAPAS', '30', '1');
INSERT INTO `ciudad` VALUES ('594', 'LERDO DE TEJADA', '30', '1');
INSERT INTO `ciudad` VALUES ('595', 'MINATITLÁN', '30', '1');
INSERT INTO `ciudad` VALUES ('596', 'NARANJOS', '30', '1');
INSERT INTO `ciudad` VALUES ('597', 'NOGALES', '30', '1');
INSERT INTO `ciudad` VALUES ('598', 'ORIZABA', '30', '1');
INSERT INTO `ciudad` VALUES ('599', 'PÁNUCO', '30', '1');
INSERT INTO `ciudad` VALUES ('600', 'PAPANTLA DE OLARTE', '30', '1');
INSERT INTO `ciudad` VALUES ('601', 'PARAJE NUEVO', '30', '1');
INSERT INTO `ciudad` VALUES ('602', 'PASO DE OVEJAS', '30', '1');
INSERT INTO `ciudad` VALUES ('603', 'PASO DEL MACHO', '30', '1');
INSERT INTO `ciudad` VALUES ('604', 'PLATÓN SÁNCHEZ', '30', '1');
INSERT INTO `ciudad` VALUES ('605', 'PLAYA VICENTE', '30', '1');
INSERT INTO `ciudad` VALUES ('606', 'POZA RICA DE HIDALGO', '30', '1');
INSERT INTO `ciudad` VALUES ('607', 'RÍO BLANCO', '30', '1');
INSERT INTO `ciudad` VALUES ('608', 'SAN ANDRÉS TUXTLA', '30', '1');
INSERT INTO `ciudad` VALUES ('609', 'SAN RAFAEL', '30', '1');
INSERT INTO `ciudad` VALUES ('610', 'SANTIAGO TUXTLA', '30', '1');
INSERT INTO `ciudad` VALUES ('611', 'SIHUAPAN', '30', '1');
INSERT INTO `ciudad` VALUES ('612', 'SOLEDAD DE DOBLADO', '30', '1');
INSERT INTO `ciudad` VALUES ('613', 'TAMPICO ALTO', '30', '1');
INSERT INTO `ciudad` VALUES ('614', 'TANTOYUCA', '30', '1');
INSERT INTO `ciudad` VALUES ('615', 'TEMPOAL DE SÁNCHEZ', '30', '1');
INSERT INTO `ciudad` VALUES ('616', 'TEZONAPA', '30', '1');
INSERT INTO `ciudad` VALUES ('617', 'TIERRA BLANCA', '30', '1');
INSERT INTO `ciudad` VALUES ('618', 'TIHUATLÁN', '30', '1');
INSERT INTO `ciudad` VALUES ('619', 'TLACOJALPAN', '30', '1');
INSERT INTO `ciudad` VALUES ('620', 'TLAPACOYAN', '30', '1');
INSERT INTO `ciudad` VALUES ('621', 'TRES VALLES', '30', '1');
INSERT INTO `ciudad` VALUES ('622', 'TÚXPAM DE RODRÍGUEZ CANO', '30', '1');
INSERT INTO `ciudad` VALUES ('623', 'VERACRUZ', '30', '1');
INSERT INTO `ciudad` VALUES ('624', 'XALAPA-ENRÍQUEZ', '30', '1');
INSERT INTO `ciudad` VALUES ('625', 'YECUATLA', '30', '1');
INSERT INTO `ciudad` VALUES ('626', 'KANASÍN', '31', '1');
INSERT INTO `ciudad` VALUES ('627', 'MÉRIDA', '31', '1');
INSERT INTO `ciudad` VALUES ('628', 'MOTUL DE CARRILLO PUERTO', '31', '1');
INSERT INTO `ciudad` VALUES ('629', 'TICUL', '31', '1');
INSERT INTO `ciudad` VALUES ('630', 'TIZIMÍN', '31', '1');
INSERT INTO `ciudad` VALUES ('631', 'VALLADOLID', '31', '1');
INSERT INTO `ciudad` VALUES ('632', 'CIUDAD CUAUHTÉMOC', '32', '1');
INSERT INTO `ciudad` VALUES ('633', 'FRESNILLO', '32', '1');
INSERT INTO `ciudad` VALUES ('634', 'GUADALUPE', '32', '1');
INSERT INTO `ciudad` VALUES ('635', 'JALPA', '32', '1');
INSERT INTO `ciudad` VALUES ('636', 'JEREZ DE GARCÍA SALINAS', '32', '1');
INSERT INTO `ciudad` VALUES ('637', 'JUAN ALDAMA', '32', '1');
INSERT INTO `ciudad` VALUES ('638', 'LORETO', '32', '1');
INSERT INTO `ciudad` VALUES ('639', 'LUIS MOYA', '32', '1');
INSERT INTO `ciudad` VALUES ('640', 'MOYAHUA DE ESTRADA', '32', '1');
INSERT INTO `ciudad` VALUES ('641', 'NOCHISTLÁN DE MEJÍA', '32', '1');
INSERT INTO `ciudad` VALUES ('642', 'OJOCALIENTE', '32', '1');
INSERT INTO `ciudad` VALUES ('643', 'RÍO GRANDE', '32', '1');
INSERT INTO `ciudad` VALUES ('644', 'SOMBRERETE', '32', '1');
INSERT INTO `ciudad` VALUES ('645', 'VALPARAÍSO', '32', '1');
INSERT INTO `ciudad` VALUES ('646', 'VÍCTOR ROSALES', '32', '1');
INSERT INTO `ciudad` VALUES ('647', 'VILLA DE COS', '32', '1');
INSERT INTO `ciudad` VALUES ('648', 'VILLA HIDALGO', '32', '1');
INSERT INTO `ciudad` VALUES ('649', 'VILLANUEVA', '32', '1');
INSERT INTO `ciudad` VALUES ('650', 'ZACATECAS', '32', '1');

-- ----------------------------
-- Table structure for coordinaciona
-- ----------------------------
DROP TABLE IF EXISTS `coordinaciona`;
CREATE TABLE `coordinaciona` (
  `coordinaciona` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id Coordinación',
  `descripcion` varchar(70) NOT NULL COMMENT 'Descripción Coordinación',
  `programaedu` int(11) NOT NULL COMMENT 'Codigo carrera',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`coordinaciona`),
  UNIQUE KEY `CO_codigo_UNIQUE` (`coordinaciona`) USING BTREE,
  KEY `fk_coordinaciona_programaedu1_idx` (`programaedu`),
  KEY `fk_coordinaciona_users1_idx` (`users_id`),
  CONSTRAINT `fk_coordinaciona_programaedu1` FOREIGN KEY (`programaedu`) REFERENCES `programaedu` (`programaedu`),
  CONSTRAINT `fk_coordinaciona_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of coordinaciona
-- ----------------------------
INSERT INTO `coordinaciona` VALUES ('1', 'CONTABILIDAD BASICA', '6', '11');
INSERT INTO `coordinaciona` VALUES ('2', 'CONTABILIDAD AVANZADA', '6', '11');
INSERT INTO `coordinaciona` VALUES ('3', 'CONTABILIDAD DE COSTOS', '6', '11');
INSERT INTO `coordinaciona` VALUES ('4', 'FINANZAS', '6', '11');
INSERT INTO `coordinaciona` VALUES ('5', 'AUDITORIA', '6', '11');
INSERT INTO `coordinaciona` VALUES ('6', 'IMPUESTOS', '6', '11');
INSERT INTO `coordinaciona` VALUES ('7', 'MERCADOTECNIA', '6', '11');
INSERT INTO `coordinaciona` VALUES ('8', 'RECURSOS HUMANOS', '6', '11');
INSERT INTO `coordinaciona` VALUES ('9', 'PRODUCCION', '6', '11');
INSERT INTO `coordinaciona` VALUES ('10', 'ADMINISTRACION BASICA', '6', '11');
INSERT INTO `coordinaciona` VALUES ('11', 'ADMINISTRACION AVANZADA', '6', '11');
INSERT INTO `coordinaciona` VALUES ('12', 'INFORMATICA', '6', '11');
INSERT INTO `coordinaciona` VALUES ('13', 'MATEMATICAS', '6', '11');
INSERT INTO `coordinaciona` VALUES ('14', 'CIENCIAS COMPUTACIONALES', '6', '11');
INSERT INTO `coordinaciona` VALUES ('15', 'SISTEMAS DE INFORMACION', '6', '11');
INSERT INTO `coordinaciona` VALUES ('16', 'PROGRAMACION', '6', '11');
INSERT INTO `coordinaciona` VALUES ('17', 'ECONOMIA', '6', '11');
INSERT INTO `coordinaciona` VALUES ('18', 'COMERCIO EXTERIOR', '6', '11');
INSERT INTO `coordinaciona` VALUES ('19', 'DERECHO', '6', '11');
INSERT INTO `coordinaciona` VALUES ('20', 'EMPRENDEDORES', '6', '11');
INSERT INTO `coordinaciona` VALUES ('21', 'ASIGNATURAS DE APOYO', '6', '11');
INSERT INTO `coordinaciona` VALUES ('22', 'SIN COORDINACION', '6', '11');

-- ----------------------------
-- Table structure for detalleseriacion
-- ----------------------------
DROP TABLE IF EXISTS `detalleseriacion`;
CREATE TABLE `detalleseriacion` (
  `programaedu` int(11) NOT NULL COMMENT 'prog edu',
  `uaprendizaje` int(11) NOT NULL COMMENT 'U aprendizaje',
  `reqseriacion` int(11) NOT NULL COMMENT 'Reqseriación',
  `uaprequisito` int(11) NOT NULL COMMENT 'Uap requisito',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`programaedu`,`uaprendizaje`,`uaprequisito`),
  KEY `fk_detalleseriacion_uaprendizaje2_idx` (`uaprequisito`),
  KEY `fk_detalleseriacion_users1_idx` (`users_id`),
  KEY `fk_detalleseriacion_reqseriacion1_idx` (`reqseriacion`),
  KEY `fk_detalleseriacion_pua_idx` (`programaedu`,`uaprendizaje`) USING BTREE,
  CONSTRAINT `fk_detalleseriacion_pua` FOREIGN KEY (`programaedu`, `uaprendizaje`) REFERENCES `p_ua` (`programaedu`, `uaprendizaje`),
  CONSTRAINT `fk_detalleseriacion_reqseriacion1` FOREIGN KEY (`reqseriacion`) REFERENCES `reqseriacion` (`reqseriacion`),
  CONSTRAINT `fk_detalleseriacion_uaprendizaje2` FOREIGN KEY (`uaprequisito`) REFERENCES `uaprendizaje` (`uaprendizaje`),
  CONSTRAINT `fk_detalleseriacion_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of detalleseriacion
-- ----------------------------

-- ----------------------------
-- Table structure for dias
-- ----------------------------
DROP TABLE IF EXISTS `dias`;
CREATE TABLE `dias` (
  `dia` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Consec Dia',
  `descripcion` varchar(9) NOT NULL COMMENT 'Descripcion Dia (Lun,Mar,Mier..)',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`dia`),
  UNIQUE KEY `DI_dia_UNIQUE` (`dia`),
  KEY `fk_dias_users1_idx` (`users_id`),
  CONSTRAINT `fk_dias_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dias
-- ----------------------------

-- ----------------------------
-- Table structure for disp_hrs_dias
-- ----------------------------
DROP TABLE IF EXISTS `disp_hrs_dias`;
CREATE TABLE `disp_hrs_dias` (
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
  KEY `fk_disp_hrs_dias_status1` (`status`),
  CONSTRAINT `fk_disp_hrs_dias_dias2` FOREIGN KEY (`dia`) REFERENCES `dias` (`dia`),
  CONSTRAINT `fk_disp_hrs_dias_horas1` FOREIGN KEY (`hora`) REFERENCES `horas` (`hora`),
  CONSTRAINT `fk_disp_hrs_dias_periodos1` FOREIGN KEY (`periodo`) REFERENCES `periodos` (`periodo`),
  CONSTRAINT `fk_disp_hrs_dias_status1` FOREIGN KEY (`status`) REFERENCES `status` (`status`),
  CONSTRAINT `fk_disp_hrs_dias_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_disp_hrs_dias_users2` FOREIGN KEY (`id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of disp_hrs_dias
-- ----------------------------

-- ----------------------------
-- Table structure for disp_ua
-- ----------------------------
DROP TABLE IF EXISTS `disp_ua`;
CREATE TABLE `disp_ua` (
  `periodo` int(11) NOT NULL COMMENT 'Periodo escolar',
  `id` int(11) NOT NULL COMMENT 'Docente disponible',
  `uaprendizaje` int(11) NOT NULL COMMENT 'uac disponible',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`periodo`,`id`,`uaprendizaje`),
  KEY `fk_disp_ua_periodos1_idx` (`periodo`),
  KEY `fk_disp_ua_uaprendizaje1_idx` (`uaprendizaje`),
  KEY `fk_disp_ua_users1_idx` (`users_id`),
  KEY `fk_disp_ua_users2_idx` (`id`),
  CONSTRAINT `fk_disp_ua_periodos1` FOREIGN KEY (`periodo`) REFERENCES `periodos` (`periodo`),
  CONSTRAINT `fk_disp_ua_uaprendizaje1` FOREIGN KEY (`uaprendizaje`) REFERENCES `uaprendizaje` (`uaprendizaje`),
  CONSTRAINT `fk_disp_ua_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_disp_ua_users2` FOREIGN KEY (`id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of disp_ua
-- ----------------------------

-- ----------------------------
-- Table structure for doctos
-- ----------------------------
DROP TABLE IF EXISTS `doctos`;
CREATE TABLE `doctos` (
  `docto` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo documento',
  `descripcion` varchar(45) NOT NULL COMMENT 'Descripcion documento (cedula, foto, certificado, curso, etc)',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`docto`),
  KEY `fk_doctos_users1_idx` (`users_id`),
  CONSTRAINT `fk_doctos_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of doctos
-- ----------------------------

-- ----------------------------
-- Table structure for documentos_emp
-- ----------------------------
DROP TABLE IF EXISTS `documentos_emp`;
CREATE TABLE `documentos_emp` (
  `docto` int(11) NOT NULL COMMENT 'Codigo documento',
  `id` int(11) NOT NULL COMMENT 'Codigo Empleado',
  `ruta` varchar(60) NOT NULL COMMENT 'Ruta fisica docto',
  `observaciones` varchar(60) DEFAULT NULL COMMENT 'Observaciones documento',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`docto`,`id`),
  KEY `fk_documentos_emp_users1_idx` (`users_id`),
  KEY `fk_documentos_emp_users2_idx` (`id`),
  KEY `fk_documentos_emp_doctos1_idx` (`docto`),
  CONSTRAINT `fk_documentos_emp_doctos1` FOREIGN KEY (`docto`) REFERENCES `doctos` (`docto`),
  CONSTRAINT `fk_documentos_emp_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_documentos_emp_users2` FOREIGN KEY (`id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of documentos_emp
-- ----------------------------

-- ----------------------------
-- Table structure for empresa_adic
-- ----------------------------
DROP TABLE IF EXISTS `empresa_adic`;
CREATE TABLE `empresa_adic` (
  `empresa` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Empresa TrabAdic a UABC',
  `descripcion` varchar(45) NOT NULL COMMENT 'Desc TrabAdic a UABC',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`empresa`),
  KEY `fk_empresa_adic_users1_idx` (`users_id`),
  CONSTRAINT `fk_empresa_adic_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of empresa_adic
-- ----------------------------
INSERT INTO `empresa_adic` VALUES ('1', 'LABOPAT', '1');

-- ----------------------------
-- Table structure for esp_prog_edu
-- ----------------------------
DROP TABLE IF EXISTS `esp_prog_edu`;
CREATE TABLE `esp_prog_edu` (
  `especialidad` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo Especificación Nivel Programa (SOLO POSTGRADO)',
  `descripcion` varchar(45) NOT NULL COMMENT 'Descripción Especificación Nivel Programa',
  `status` char(1) NOT NULL COMMENT 'Status esp nivel programa\n1=Activo',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`especialidad`),
  UNIQUE KEY `ENP_codigo_UNIQUE` (`especialidad`),
  KEY `fk_esp_prog_edu_users1_idx` (`users_id`),
  CONSTRAINT `fk_esp_prog_edu_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='<double-click to overwrite multiple objects>';

-- ----------------------------
-- Records of esp_prog_edu
-- ----------------------------
INSERT INTO `esp_prog_edu` VALUES ('1', 'MTIC', '1', '1');
INSERT INTO `esp_prog_edu` VALUES ('2', 'MC', '1', '1');

-- ----------------------------
-- Table structure for estado
-- ----------------------------
DROP TABLE IF EXISTS `estado`;
CREATE TABLE `estado` (
  `estado` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo estado',
  `descripcion` char(30) NOT NULL COMMENT 'Descripcion estado',
  `pais` int(11) NOT NULL DEFAULT '144' COMMENT 'Codigo pais',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`estado`),
  UNIQUE KEY `ES_codigo_UNIQUE` (`estado`),
  KEY `fk_estado_pais1_idx` (`pais`),
  KEY `fk_estado_users1_idx` (`users_id`),
  CONSTRAINT `fk_estado_pais1` FOREIGN KEY (`pais`) REFERENCES `pais` (`pais`),
  CONSTRAINT `fk_estado_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='<double-click to overwrite multiple objects>';

-- ----------------------------
-- Records of estado
-- ----------------------------
INSERT INTO `estado` VALUES ('1', 'AGUASCALIENTES', '144', '1');
INSERT INTO `estado` VALUES ('2', 'BAJA CALIFORNIA', '144', '1');
INSERT INTO `estado` VALUES ('3', 'BAJA CALIFORNIA SUR', '144', '1');
INSERT INTO `estado` VALUES ('4', 'CAMPECHE', '144', '1');
INSERT INTO `estado` VALUES ('5', 'COAHUILA DE ZARAGOZA', '144', '1');
INSERT INTO `estado` VALUES ('6', 'COLIMA', '144', '1');
INSERT INTO `estado` VALUES ('7', 'CHIAPAS', '144', '1');
INSERT INTO `estado` VALUES ('8', 'CHIHUAHUA', '144', '1');
INSERT INTO `estado` VALUES ('9', 'DISTRITO FEDERAL', '144', '1');
INSERT INTO `estado` VALUES ('10', 'DURANGO', '144', '1');
INSERT INTO `estado` VALUES ('11', 'GUANAJUATO', '144', '1');
INSERT INTO `estado` VALUES ('12', 'GUERRERO', '144', '1');
INSERT INTO `estado` VALUES ('13', 'HIDALGO', '144', '1');
INSERT INTO `estado` VALUES ('14', 'JALISCO', '144', '1');
INSERT INTO `estado` VALUES ('15', 'MEXICO', '144', '1');
INSERT INTO `estado` VALUES ('16', 'MICHOACAN DE OCAMPO', '144', '1');
INSERT INTO `estado` VALUES ('17', 'MORELOS', '144', '1');
INSERT INTO `estado` VALUES ('18', 'NAYARIT', '144', '1');
INSERT INTO `estado` VALUES ('19', 'NUEVO LEON', '144', '1');
INSERT INTO `estado` VALUES ('20', 'OAXACA', '144', '1');
INSERT INTO `estado` VALUES ('21', 'PUEBLA', '144', '1');
INSERT INTO `estado` VALUES ('22', 'QUERETARO', '144', '1');
INSERT INTO `estado` VALUES ('23', 'QUINTANA ROO', '144', '1');
INSERT INTO `estado` VALUES ('24', 'SAN LUIS POTOSI', '144', '1');
INSERT INTO `estado` VALUES ('25', 'SINALOA', '144', '1');
INSERT INTO `estado` VALUES ('26', 'SONORA', '144', '1');
INSERT INTO `estado` VALUES ('27', 'TABASCO', '144', '1');
INSERT INTO `estado` VALUES ('28', 'TAMAULIPAS', '144', '1');
INSERT INTO `estado` VALUES ('29', 'TLAXCALA', '144', '1');
INSERT INTO `estado` VALUES ('30', 'VERACRUZ', '144', '1');
INSERT INTO `estado` VALUES ('31', 'YUCATAN', '144', '1');
INSERT INTO `estado` VALUES ('32', 'ZACATECAS', '144', '1');

-- ----------------------------
-- Table structure for etapas
-- ----------------------------
DROP TABLE IF EXISTS `etapas`;
CREATE TABLE `etapas` (
  `etapa` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código Etapa (1,2,3)',
  `descripcion` varchar(20) NOT NULL COMMENT 'Descripció Et (Básica, disciplinaria, terminal)',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`etapa`),
  UNIQUE KEY `ET_codigo_UNIQUE` (`etapa`),
  KEY `fk_etapas_users1_idx` (`users_id`),
  CONSTRAINT `fk_etapas_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of etapas
-- ----------------------------
INSERT INTO `etapas` VALUES ('1', 'BASICA', '1');
INSERT INTO `etapas` VALUES ('2', 'DISCIPLINARIA', '1');
INSERT INTO `etapas` VALUES ('3', 'TERMINAL', '1');

-- ----------------------------
-- Table structure for grupos
-- ----------------------------
DROP TABLE IF EXISTS `grupos`;
CREATE TABLE `grupos` (
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
  KEY `fk_grupos_users1_idx` (`users_id`),
  CONSTRAINT `fk_grupos_periodos1` FOREIGN KEY (`periodo`) REFERENCES `periodos` (`periodo`),
  CONSTRAINT `fk_grupos_planestudio1` FOREIGN KEY (`plan`, `programaedu`) REFERENCES `plan_programa` (`plan`, `programaedu`),
  CONSTRAINT `fk_grupos_turnos1` FOREIGN KEY (`turno`) REFERENCES `turnos` (`turno`),
  CONSTRAINT `fk_grupos_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of grupos
-- ----------------------------
INSERT INTO `grupos` VALUES ('231', '20132', '20092', '2', '1', '1');
INSERT INTO `grupos` VALUES ('231', '20151', '20092', '2', '1', '1');
INSERT INTO `grupos` VALUES ('232', '20132', '20092', '2', '1', '1');
INSERT INTO `grupos` VALUES ('232', '20151', '20092', '2', '1', '1');
INSERT INTO `grupos` VALUES ('233', '20151', '20092', '2', '1', '1');
INSERT INTO `grupos` VALUES ('234', '20151', '20092', '2', '1', '1');
INSERT INTO `grupos` VALUES ('235', '20132', '20092', '2', '1', '1');
INSERT INTO `grupos` VALUES ('235', '20151', '20092', '2', '1', '1');
INSERT INTO `grupos` VALUES ('236', '20151', '20092', '2', '2', '1');
INSERT INTO `grupos` VALUES ('241', '20132', '20092', '2', '1', '1');
INSERT INTO `grupos` VALUES ('241', '20151', '20092', '2', '1', '1');
INSERT INTO `grupos` VALUES ('242', '20132', '20092', '2', '1', '1');
INSERT INTO `grupos` VALUES ('242', '20151', '20092', '2', '1', '1');
INSERT INTO `grupos` VALUES ('243', '20151', '20092', '2', '2', '1');
INSERT INTO `grupos` VALUES ('244', '20151', '20092', '2', '2', '1');
INSERT INTO `grupos` VALUES ('245', '20132', '20092', '2', '1', '1');
INSERT INTO `grupos` VALUES ('245', '20151', '20092', '2', '1', '1');
INSERT INTO `grupos` VALUES ('246', '20151', '20092', '2', '2', '1');
INSERT INTO `grupos` VALUES ('251', '20132', '20092', '2', '1', '1');
INSERT INTO `grupos` VALUES ('251', '20151', '20092', '2', '1', '1');
INSERT INTO `grupos` VALUES ('252', '20132', '20092', '2', '1', '1');
INSERT INTO `grupos` VALUES ('252', '20151', '20092', '2', '1', '1');
INSERT INTO `grupos` VALUES ('253', '20151', '20092', '2', '2', '1');
INSERT INTO `grupos` VALUES ('254', '20151', '20092', '2', '2', '1');
INSERT INTO `grupos` VALUES ('255', '20132', '20092', '2', '1', '1');
INSERT INTO `grupos` VALUES ('255', '20151', '20092', '2', '1', '1');
INSERT INTO `grupos` VALUES ('256', '20151', '20092', '2', '2', '1');
INSERT INTO `grupos` VALUES ('261', '20132', '20092', '2', '1', '1');
INSERT INTO `grupos` VALUES ('261', '20151', '20092', '2', '1', '1');
INSERT INTO `grupos` VALUES ('262', '20132', '20092', '2', '1', '1');
INSERT INTO `grupos` VALUES ('262', '20151', '20092', '2', '1', '1');
INSERT INTO `grupos` VALUES ('263', '20151', '20092', '2', '2', '1');
INSERT INTO `grupos` VALUES ('264', '20151', '20092', '2', '2', '1');
INSERT INTO `grupos` VALUES ('265', '20132', '20092', '2', '1', '1');
INSERT INTO `grupos` VALUES ('265', '20151', '20092', '2', '1', '1');
INSERT INTO `grupos` VALUES ('266', '20151', '20092', '2', '2', '1');
INSERT INTO `grupos` VALUES ('271', '20132', '20092', '2', '1', '1');
INSERT INTO `grupos` VALUES ('271', '20151', '20092', '2', '1', '1');
INSERT INTO `grupos` VALUES ('272', '20132', '20092', '2', '1', '1');
INSERT INTO `grupos` VALUES ('272', '20151', '20092', '2', '1', '1');
INSERT INTO `grupos` VALUES ('273', '20151', '20092', '2', '2', '1');
INSERT INTO `grupos` VALUES ('274', '20151', '20092', '2', '2', '1');
INSERT INTO `grupos` VALUES ('275', '20132', '20092', '2', '1', '1');
INSERT INTO `grupos` VALUES ('275', '20151', '20092', '2', '1', '1');
INSERT INTO `grupos` VALUES ('276', '20151', '20092', '2', '2', '1');
INSERT INTO `grupos` VALUES ('281', '20132', '20092', '2', '1', '1');
INSERT INTO `grupos` VALUES ('281', '20151', '20092', '2', '1', '1');
INSERT INTO `grupos` VALUES ('282', '20132', '20092', '2', '1', '1');
INSERT INTO `grupos` VALUES ('282', '20151', '20092', '2', '1', '1');
INSERT INTO `grupos` VALUES ('283', '20151', '20092', '2', '2', '1');
INSERT INTO `grupos` VALUES ('284', '20151', '20092', '2', '2', '1');
INSERT INTO `grupos` VALUES ('285', '20151', '20092', '2', '1', '1');
INSERT INTO `grupos` VALUES ('286', '20151', '20092', '2', '2', '1');
INSERT INTO `grupos` VALUES ('331', '20132', '20092', '3', '1', '1');
INSERT INTO `grupos` VALUES ('341', '20132', '20092', '3', '1', '1');
INSERT INTO `grupos` VALUES ('351', '20132', '20092', '3', '1', '1');
INSERT INTO `grupos` VALUES ('361', '20132', '20092', '3', '1', '1');
INSERT INTO `grupos` VALUES ('371', '20132', '20092', '3', '1', '1');
INSERT INTO `grupos` VALUES ('431', '20132', '20092', '4', '1', '1');
INSERT INTO `grupos` VALUES ('441', '20132', '20092', '4', '1', '1');
INSERT INTO `grupos` VALUES ('451', '20132', '20092', '4', '1', '1');
INSERT INTO `grupos` VALUES ('461', '20132', '20092', '4', '1', '1');
INSERT INTO `grupos` VALUES ('471', '20132', '20092', '4', '1', '1');
INSERT INTO `grupos` VALUES ('531', '20132', '20092', '5', '1', '1');
INSERT INTO `grupos` VALUES ('532', '20132', '20092', '5', '1', '1');
INSERT INTO `grupos` VALUES ('541', '20132', '20092', '5', '1', '1');
INSERT INTO `grupos` VALUES ('542', '20132', '20092', '5', '1', '1');
INSERT INTO `grupos` VALUES ('551', '20132', '20092', '5', '1', '1');
INSERT INTO `grupos` VALUES ('552', '20132', '20092', '5', '1', '1');
INSERT INTO `grupos` VALUES ('561', '20132', '20092', '5', '1', '1');
INSERT INTO `grupos` VALUES ('562', '20132', '20092', '5', '1', '1');
INSERT INTO `grupos` VALUES ('571', '20132', '20092', '5', '1', '1');
INSERT INTO `grupos` VALUES ('572', '20132', '20092', '5', '1', '1');
INSERT INTO `grupos` VALUES ('581', '20132', '20092', '5', '1', '1');
INSERT INTO `grupos` VALUES ('582', '20132', '20092', '5', '1', '1');
INSERT INTO `grupos` VALUES ('601', '20132', '20092', '6', '1', '1');
INSERT INTO `grupos` VALUES ('601', '20151', '20092', '6', '1', '1');
INSERT INTO `grupos` VALUES ('602', '20132', '20092', '6', '1', '1');
INSERT INTO `grupos` VALUES ('602', '20151', '20092', '6', '1', '1');
INSERT INTO `grupos` VALUES ('603', '20132', '20092', '6', '1', '1');
INSERT INTO `grupos` VALUES ('603', '20151', '20092', '6', '1', '1');
INSERT INTO `grupos` VALUES ('604', '20132', '20092', '6', '1', '1');
INSERT INTO `grupos` VALUES ('604', '20151', '20092', '6', '1', '1');
INSERT INTO `grupos` VALUES ('605', '20132', '20092', '6', '1', '1');
INSERT INTO `grupos` VALUES ('605', '20151', '20092', '6', '1', '1');
INSERT INTO `grupos` VALUES ('606', '20132', '20092', '6', '1', '1');
INSERT INTO `grupos` VALUES ('606', '20151', '20092', '6', '1', '1');
INSERT INTO `grupos` VALUES ('607', '20132', '20092', '2', '3', '1');
INSERT INTO `grupos` VALUES ('607', '20151', '20092', '6', '3', '1');
INSERT INTO `grupos` VALUES ('608', '20132', '20092', '2', '3', '1');
INSERT INTO `grupos` VALUES ('608', '20151', '20092', '6', '3', '1');
INSERT INTO `grupos` VALUES ('611', '20132', '20092', '2', '2', '1');
INSERT INTO `grupos` VALUES ('611', '20151', '20092', '6', '2', '1');
INSERT INTO `grupos` VALUES ('612', '20132', '20092', '2', '2', '1');
INSERT INTO `grupos` VALUES ('612', '20151', '20092', '6', '2', '1');
INSERT INTO `grupos` VALUES ('613', '20151', '20092', '6', '2', '1');
INSERT INTO `grupos` VALUES ('614', '20151', '20092', '6', '2', '1');
INSERT INTO `grupos` VALUES ('615', '20151', '20092', '6', '2', '1');
INSERT INTO `grupos` VALUES ('616', '20151', '20092', '6', '2', '1');
INSERT INTO `grupos` VALUES ('621', '20132', '20092', '6', '1', '1');
INSERT INTO `grupos` VALUES ('621', '20151', '20092', '6', '1', '1');
INSERT INTO `grupos` VALUES ('622', '20132', '20092', '6', '1', '1');
INSERT INTO `grupos` VALUES ('622', '20151', '20092', '6', '1', '1');
INSERT INTO `grupos` VALUES ('623', '20132', '20092', '6', '1', '1');
INSERT INTO `grupos` VALUES ('623', '20151', '20092', '6', '1', '1');
INSERT INTO `grupos` VALUES ('624', '20132', '20092', '6', '1', '1');
INSERT INTO `grupos` VALUES ('624', '20151', '20092', '6', '1', '1');
INSERT INTO `grupos` VALUES ('625', '20132', '20092', '6', '1', '1');
INSERT INTO `grupos` VALUES ('625', '20151', '20092', '6', '1', '1');
INSERT INTO `grupos` VALUES ('626', '20132', '20092', '6', '1', '1');
INSERT INTO `grupos` VALUES ('626', '20151', '20092', '6', '1', '1');
INSERT INTO `grupos` VALUES ('627', '20151', '20092', '6', '3', '1');
INSERT INTO `grupos` VALUES ('628', '20151', '20092', '6', '3', '1');
INSERT INTO `grupos` VALUES ('629', '20151', '20092', '6', '3', '1');
INSERT INTO `grupos` VALUES ('630', '20151', '20092', '6', '3', '1');
INSERT INTO `grupos` VALUES ('631', '20151', '20092', '6', '2', '1');
INSERT INTO `grupos` VALUES ('632', '20151', '20092', '6', '2', '1');
INSERT INTO `grupos` VALUES ('633', '20151', '20092', '6', '2', '1');
INSERT INTO `grupos` VALUES ('634', '20151', '20092', '6', '2', '1');
INSERT INTO `grupos` VALUES ('635', '20151', '20092', '6', '2', '1');
INSERT INTO `grupos` VALUES ('636', '20151', '20092', '6', '2', '1');

-- ----------------------------
-- Table structure for horarios
-- ----------------------------
DROP TABLE IF EXISTS `horarios`;
CREATE TABLE `horarios` (
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
  KEY `fk_horarios_users2_idx` (`id`),
  CONSTRAINT `fk_horarios_dias1` FOREIGN KEY (`dia`) REFERENCES `dias` (`dia`),
  CONSTRAINT `fk_horarios_grupos1` FOREIGN KEY (`grupo`, `periodo`) REFERENCES `grupos` (`grupo`, `periodo`),
  CONSTRAINT `fk_horarios_horas1` FOREIGN KEY (`hora`) REFERENCES `horas` (`hora`),
  CONSTRAINT `fk_horarios_uaprendizaje1` FOREIGN KEY (`uaprendizaje`) REFERENCES `uaprendizaje` (`uaprendizaje`),
  CONSTRAINT `fk_horarios_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_horarios_users2` FOREIGN KEY (`id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of horarios
-- ----------------------------

-- ----------------------------
-- Table structure for horas
-- ----------------------------
DROP TABLE IF EXISTS `horas`;
CREATE TABLE `horas` (
  `hora` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo hora (1,2,3,4)',
  `horaini` char(5) NOT NULL COMMENT 'Hr exacta inicio (0800)',
  `horafin` char(5) NOT NULL COMMENT 'Hr exacta fin (0859)',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`hora`),
  UNIQUE KEY `HR_hora_UNIQUE` (`hora`),
  KEY `fk_horas_users1_idx` (`users_id`),
  CONSTRAINT `fk_horas_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of horas
-- ----------------------------

-- ----------------------------
-- Table structure for levels
-- ----------------------------
DROP TABLE IF EXISTS `levels`;
CREATE TABLE `levels` (
  `level` int(11) NOT NULL COMMENT 'Nivel',
  `descrip_level` varchar(45) NOT NULL COMMENT 'Descripcion Nivel',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`level`),
  KEY `fk_levels_users1_idx` (`users_id`),
  CONSTRAINT `fk_levels_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of levels
-- ----------------------------
INSERT INTO `levels` VALUES ('1', 'Administrador_general', '1');
INSERT INTO `levels` VALUES ('2', 'Administrador_auxiliar', '1');
INSERT INTO `levels` VALUES ('3', 'Coordinador Carrera', '1');
INSERT INTO `levels` VALUES ('4', 'Coordinador de Area', '1');
INSERT INTO `levels` VALUES ('5', 'Docente', '1');

-- ----------------------------
-- Table structure for nvprograma
-- ----------------------------
DROP TABLE IF EXISTS `nvprograma`;
CREATE TABLE `nvprograma` (
  `nivel` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Nivel (1,2,3)',
  `descripcion` varchar(15) NOT NULL COMMENT 'Licenciatura/Postgrado',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`nivel`),
  UNIQUE KEY `NV_codigo_UNIQUE` (`nivel`),
  KEY `fk_nvprograma_users1_idx` (`users_id`),
  CONSTRAINT `fk_nvprograma_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='<double-click to overwrite multiple objects>';

-- ----------------------------
-- Records of nvprograma
-- ----------------------------
INSERT INTO `nvprograma` VALUES ('1', 'LICENCIATURA', '1');
INSERT INTO `nvprograma` VALUES ('2', 'POSTGRADO', '1');
INSERT INTO `nvprograma` VALUES ('3', 'TECNICO', '1');

-- ----------------------------
-- Table structure for pais
-- ----------------------------
DROP TABLE IF EXISTS `pais`;
CREATE TABLE `pais` (
  `pais` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo pais',
  `descripcion` varchar(60) NOT NULL COMMENT 'Descripción pais',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`pais`),
  UNIQUE KEY `PA_codigo_UNIQUE` (`pais`),
  KEY `fk_pais_users1_idx` (`users_id`),
  CONSTRAINT `fk_pais_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=238 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pais
-- ----------------------------
INSERT INTO `pais` VALUES ('1', 'AFGANISTAN', '1');
INSERT INTO `pais` VALUES ('2', 'ALBANIA', '1');
INSERT INTO `pais` VALUES ('3', 'ALEMANIA', '1');
INSERT INTO `pais` VALUES ('4', 'ANDORRA', '1');
INSERT INTO `pais` VALUES ('5', 'ANGOLA', '1');
INSERT INTO `pais` VALUES ('6', 'ANGUILLA', '1');
INSERT INTO `pais` VALUES ('7', 'ANTIGUA Y BARBUDA', '1');
INSERT INTO `pais` VALUES ('8', 'ANTILLAS HOLANDESAS', '1');
INSERT INTO `pais` VALUES ('9', 'ARABIA SAUDI', '1');
INSERT INTO `pais` VALUES ('10', 'ARGELIA', '1');
INSERT INTO `pais` VALUES ('11', 'ARGENTINA', '1');
INSERT INTO `pais` VALUES ('12', 'ARMENIA', '1');
INSERT INTO `pais` VALUES ('13', 'ARUBA', '1');
INSERT INTO `pais` VALUES ('14', 'AUSTRALIA', '1');
INSERT INTO `pais` VALUES ('15', 'AUSTRIA', '1');
INSERT INTO `pais` VALUES ('16', 'AZERBAIYAN', '1');
INSERT INTO `pais` VALUES ('17', 'BAHAMAS', '1');
INSERT INTO `pais` VALUES ('18', 'BAHREIN', '1');
INSERT INTO `pais` VALUES ('19', 'BANGLADESH', '1');
INSERT INTO `pais` VALUES ('20', 'BARBADOS', '1');
INSERT INTO `pais` VALUES ('22', 'BELGICA', '1');
INSERT INTO `pais` VALUES ('23', 'BELICE', '1');
INSERT INTO `pais` VALUES ('25', 'BERMUDAS', '1');
INSERT INTO `pais` VALUES ('27', 'BOLIVIA', '1');
INSERT INTO `pais` VALUES ('28', 'BOSNIA Y HERZEGOVINA', '1');
INSERT INTO `pais` VALUES ('29', 'BOTSWANA', '1');
INSERT INTO `pais` VALUES ('30', 'BRASIL', '1');
INSERT INTO `pais` VALUES ('31', 'BRUNEI', '1');
INSERT INTO `pais` VALUES ('32', 'BULGARIA', '1');
INSERT INTO `pais` VALUES ('34', 'BURUNDI', '1');
INSERT INTO `pais` VALUES ('35', 'CABO VERDE', '1');
INSERT INTO `pais` VALUES ('36', 'CAMBOYA', '1');
INSERT INTO `pais` VALUES ('37', 'CAMERUN', '1');
INSERT INTO `pais` VALUES ('38', 'CANADA', '1');
INSERT INTO `pais` VALUES ('40', 'CHILE', '1');
INSERT INTO `pais` VALUES ('41', 'CHINA', '1');
INSERT INTO `pais` VALUES ('42', 'CHIPRE', '1');
INSERT INTO `pais` VALUES ('43', 'COLOMBIA', '1');
INSERT INTO `pais` VALUES ('45', 'CONGO', '1');
INSERT INTO `pais` VALUES ('46', 'COREA', '1');
INSERT INTO `pais` VALUES ('47', 'COREA DEL NORTE ', '1');
INSERT INTO `pais` VALUES ('48', 'COSTA DE MARFIL', '1');
INSERT INTO `pais` VALUES ('49', 'COSTA RICA', '1');
INSERT INTO `pais` VALUES ('50', 'CROACIA', '1');
INSERT INTO `pais` VALUES ('51', 'CUBA', '1');
INSERT INTO `pais` VALUES ('52', 'DINAMARCA', '1');
INSERT INTO `pais` VALUES ('54', 'DOMINICA', '1');
INSERT INTO `pais` VALUES ('55', 'ECUADOR', '1');
INSERT INTO `pais` VALUES ('56', 'EGIPTO', '1');
INSERT INTO `pais` VALUES ('57', 'EL SALVADOR', '1');
INSERT INTO `pais` VALUES ('58', 'EMIRATOS ARABES UNIDOS', '1');
INSERT INTO `pais` VALUES ('60', 'ESLOVENIA', '1');
INSERT INTO `pais` VALUES ('61', 'ESPAÂ¥A', '1');
INSERT INTO `pais` VALUES ('62', 'ESTADOS UNIDOS DE AMERICA', '1');
INSERT INTO `pais` VALUES ('63', 'ESTONIA', '1');
INSERT INTO `pais` VALUES ('64', 'ETIOPIA', '1');
INSERT INTO `pais` VALUES ('65', 'FIJI', '1');
INSERT INTO `pais` VALUES ('66', 'FILIPINAS', '1');
INSERT INTO `pais` VALUES ('67', 'FINLANDIA', '1');
INSERT INTO `pais` VALUES ('68', 'FRANCIA', '1');
INSERT INTO `pais` VALUES ('69', 'GABON', '1');
INSERT INTO `pais` VALUES ('70', 'GAMBIA', '1');
INSERT INTO `pais` VALUES ('71', 'GEORGIA', '1');
INSERT INTO `pais` VALUES ('72', 'GHANA', '1');
INSERT INTO `pais` VALUES ('73', 'GIBRALTAR', '1');
INSERT INTO `pais` VALUES ('74', 'GRANADA', '1');
INSERT INTO `pais` VALUES ('75', 'GRECIA', '1');
INSERT INTO `pais` VALUES ('76', 'GROENLANDIA', '1');
INSERT INTO `pais` VALUES ('78', 'GUAM', '1');
INSERT INTO `pais` VALUES ('79', 'GUATEMALA', '1');
INSERT INTO `pais` VALUES ('80', 'GUAYANA FRANCESA', '1');
INSERT INTO `pais` VALUES ('81', 'GUERNESEY', '1');
INSERT INTO `pais` VALUES ('82', 'GUINEA', '1');
INSERT INTO `pais` VALUES ('83', 'GUINEA ECUATORIAL', '1');
INSERT INTO `pais` VALUES ('84', 'GUINEA-BISSAU', '1');
INSERT INTO `pais` VALUES ('85', 'GUYANA', '1');
INSERT INTO `pais` VALUES ('86', 'HAITI', '1');
INSERT INTO `pais` VALUES ('87', 'HONDURAS', '1');
INSERT INTO `pais` VALUES ('88', 'HONG KONG', '1');
INSERT INTO `pais` VALUES ('89', 'HUNGRIA', '1');
INSERT INTO `pais` VALUES ('90', 'INDIA', '1');
INSERT INTO `pais` VALUES ('91', 'INDONESIA', '1');
INSERT INTO `pais` VALUES ('92', 'IRAN', '1');
INSERT INTO `pais` VALUES ('93', 'IRAQ', '1');
INSERT INTO `pais` VALUES ('94', 'IRLANDA', '1');
INSERT INTO `pais` VALUES ('95', 'ISLA DE MAN', '1');
INSERT INTO `pais` VALUES ('96', 'ISLA NORFOLK', '1');
INSERT INTO `pais` VALUES ('97', 'ISLANDIA', '1');
INSERT INTO `pais` VALUES ('98', 'ISLAS ALAND', '1');
INSERT INTO `pais` VALUES ('99', 'ISLAS CAIM?N', '1');
INSERT INTO `pais` VALUES ('100', 'ISLAS COOK', '1');
INSERT INTO `pais` VALUES ('101', 'ISLAS DEL CANAL', '1');
INSERT INTO `pais` VALUES ('102', 'ISLAS FEROE', '1');
INSERT INTO `pais` VALUES ('103', 'ISLAS MALVINAS', '1');
INSERT INTO `pais` VALUES ('104', 'ISLAS MARIANAS DEL NORTE', '1');
INSERT INTO `pais` VALUES ('105', 'ISLAS MARSHALL', '1');
INSERT INTO `pais` VALUES ('106', 'ISLAS PITCAIRN', '1');
INSERT INTO `pais` VALUES ('107', 'ISLAS SALOMON', '1');
INSERT INTO `pais` VALUES ('108', 'ISLAS TURCAS Y CAICOS', '1');
INSERT INTO `pais` VALUES ('109', 'ISLAS VIRGENES BRITANICAS', '1');
INSERT INTO `pais` VALUES ('110', 'ISLAS V?RGENES DE LOS ESTADOS UNIDOS', '1');
INSERT INTO `pais` VALUES ('111', 'ISRAEL', '1');
INSERT INTO `pais` VALUES ('112', 'ITALIA', '1');
INSERT INTO `pais` VALUES ('113', 'JAMAICA', '1');
INSERT INTO `pais` VALUES ('114', 'JAPON', '1');
INSERT INTO `pais` VALUES ('115', 'JERSEY', '1');
INSERT INTO `pais` VALUES ('116', 'JORDANIA', '1');
INSERT INTO `pais` VALUES ('117', 'KAZAJSTAN', '1');
INSERT INTO `pais` VALUES ('118', 'KENIA', '1');
INSERT INTO `pais` VALUES ('119', 'KIRGUISTAN', '1');
INSERT INTO `pais` VALUES ('120', 'KIRIBATI', '1');
INSERT INTO `pais` VALUES ('121', 'KUWAIT', '1');
INSERT INTO `pais` VALUES ('122', 'LAOS', '1');
INSERT INTO `pais` VALUES ('123', 'LESOTHO', '1');
INSERT INTO `pais` VALUES ('124', 'LETONIA', '1');
INSERT INTO `pais` VALUES ('125', 'LIBANO', '1');
INSERT INTO `pais` VALUES ('126', 'LIBERIA', '1');
INSERT INTO `pais` VALUES ('127', 'LIBIA', '1');
INSERT INTO `pais` VALUES ('128', 'LIECHTENSTEIN', '1');
INSERT INTO `pais` VALUES ('129', 'LITUANIA', '1');
INSERT INTO `pais` VALUES ('130', 'LUXEMBURGO', '1');
INSERT INTO `pais` VALUES ('131', 'MACAO', '1');
INSERT INTO `pais` VALUES ('132', 'MACEDONIA ', '1');
INSERT INTO `pais` VALUES ('133', 'MADAGASCAR', '1');
INSERT INTO `pais` VALUES ('134', 'MALASIA', '1');
INSERT INTO `pais` VALUES ('135', 'MALAWI', '1');
INSERT INTO `pais` VALUES ('136', 'MALDIVAS', '1');
INSERT INTO `pais` VALUES ('137', 'MALI', '1');
INSERT INTO `pais` VALUES ('138', 'MALTA', '1');
INSERT INTO `pais` VALUES ('139', 'MARRUECOS', '1');
INSERT INTO `pais` VALUES ('140', 'MARTINICA', '1');
INSERT INTO `pais` VALUES ('141', 'MAURICIO', '1');
INSERT INTO `pais` VALUES ('142', 'MAURITANIA', '1');
INSERT INTO `pais` VALUES ('143', 'MAYOTTE', '1');
INSERT INTO `pais` VALUES ('144', 'MEXICO', '1');
INSERT INTO `pais` VALUES ('145', 'MICRONESIA', '1');
INSERT INTO `pais` VALUES ('146', 'MOLDAVIA', '1');
INSERT INTO `pais` VALUES ('147', 'MONACO', '1');
INSERT INTO `pais` VALUES ('148', 'MONGOLIA', '1');
INSERT INTO `pais` VALUES ('149', 'MONTENEGRO', '1');
INSERT INTO `pais` VALUES ('150', 'MONTSERRAT', '1');
INSERT INTO `pais` VALUES ('151', 'MOZAMBIQUE', '1');
INSERT INTO `pais` VALUES ('152', 'MYANMAR', '1');
INSERT INTO `pais` VALUES ('153', 'NAMIBIA', '1');
INSERT INTO `pais` VALUES ('154', 'NAURU', '1');
INSERT INTO `pais` VALUES ('155', 'NEPAL', '1');
INSERT INTO `pais` VALUES ('156', 'NICARAGUA', '1');
INSERT INTO `pais` VALUES ('157', 'NIGER', '1');
INSERT INTO `pais` VALUES ('158', 'NIGERIA', '1');
INSERT INTO `pais` VALUES ('159', 'NIUE', '1');
INSERT INTO `pais` VALUES ('160', 'NORUEGA', '1');
INSERT INTO `pais` VALUES ('161', 'NUEVA CALEDONIA', '1');
INSERT INTO `pais` VALUES ('162', 'NUEVA ZELANDA', '1');
INSERT INTO `pais` VALUES ('163', 'OMAN', '1');
INSERT INTO `pais` VALUES ('164', 'PAISES BAJOS', '1');
INSERT INTO `pais` VALUES ('165', 'PAKISTAN', '1');
INSERT INTO `pais` VALUES ('166', 'PALAOS', '1');
INSERT INTO `pais` VALUES ('167', 'PALESTINA', '1');
INSERT INTO `pais` VALUES ('168', 'PANAMA', '1');
INSERT INTO `pais` VALUES ('169', 'PAPUA NUEVA GUINEA', '1');
INSERT INTO `pais` VALUES ('170', 'PARAGUAY', '1');
INSERT INTO `pais` VALUES ('171', 'PERU', '1');
INSERT INTO `pais` VALUES ('172', 'POLINESIA FRANCESA', '1');
INSERT INTO `pais` VALUES ('173', 'POLONIA', '1');
INSERT INTO `pais` VALUES ('174', 'PORTUGAL', '1');
INSERT INTO `pais` VALUES ('175', 'PUERTO RICO', '1');
INSERT INTO `pais` VALUES ('176', 'QATAR', '1');
INSERT INTO `pais` VALUES ('177', 'REINO UNIDO', '1');
INSERT INTO `pais` VALUES ('178', 'REP.DEMOCRATICA DEL CONGO', '1');
INSERT INTO `pais` VALUES ('179', 'REPUBLICA CENTROAFRICANA', '1');
INSERT INTO `pais` VALUES ('180', 'REPUBLICA CHECA', '1');
INSERT INTO `pais` VALUES ('181', 'REPUBLICA DOMINICANA', '1');
INSERT INTO `pais` VALUES ('182', 'REPUBLICA ESLOVACA', '1');
INSERT INTO `pais` VALUES ('183', 'REUNION', '1');
INSERT INTO `pais` VALUES ('184', 'RUANDA', '1');
INSERT INTO `pais` VALUES ('185', 'RUMANIA', '1');
INSERT INTO `pais` VALUES ('186', 'RUSIA', '1');
INSERT INTO `pais` VALUES ('187', 'SAHARA OCCIDENTAL', '1');
INSERT INTO `pais` VALUES ('188', 'SAMOA', '1');
INSERT INTO `pais` VALUES ('189', 'SAMOA AMERICANA', '1');
INSERT INTO `pais` VALUES ('190', 'SAN BARTOLOME', '1');
INSERT INTO `pais` VALUES ('191', 'SAN CRISTOBAL Y NIEVES', '1');
INSERT INTO `pais` VALUES ('192', 'SAN MARINO', '1');
INSERT INTO `pais` VALUES ('193', 'SAN MARTIN (PARTE FRANCESA)', '1');
INSERT INTO `pais` VALUES ('194', 'SAN PEDRO Y MIQUELON ', '1');
INSERT INTO `pais` VALUES ('195', 'SAN VICENTE Y LAS GRANADINAS', '1');
INSERT INTO `pais` VALUES ('196', 'SANTA HELENA', '1');
INSERT INTO `pais` VALUES ('197', 'SANTA LUCIA', '1');
INSERT INTO `pais` VALUES ('198', 'SANTA SEDE', '1');
INSERT INTO `pais` VALUES ('199', 'SANTO TOME Y PRINCIPE', '1');
INSERT INTO `pais` VALUES ('200', 'SENEGAL', '1');
INSERT INTO `pais` VALUES ('201', 'SERBIA', '1');
INSERT INTO `pais` VALUES ('202', 'SEYCHELLES', '1');
INSERT INTO `pais` VALUES ('203', 'SIERRA LEONA', '1');
INSERT INTO `pais` VALUES ('204', 'SINGAPUR', '1');
INSERT INTO `pais` VALUES ('205', 'SIRIA', '1');
INSERT INTO `pais` VALUES ('206', 'SOMALIA', '1');
INSERT INTO `pais` VALUES ('207', 'SRI LANKA', '1');
INSERT INTO `pais` VALUES ('208', 'SUDAFRICA', '1');
INSERT INTO `pais` VALUES ('209', 'SUDAN', '1');
INSERT INTO `pais` VALUES ('210', 'SUECIA', '1');
INSERT INTO `pais` VALUES ('211', 'SUIZA', '1');
INSERT INTO `pais` VALUES ('212', 'SURINAM', '1');
INSERT INTO `pais` VALUES ('213', 'SVALBARD Y JAN MAYEN', '1');
INSERT INTO `pais` VALUES ('214', 'SWAZILANDIA', '1');
INSERT INTO `pais` VALUES ('215', 'TADYIKISTAN', '1');
INSERT INTO `pais` VALUES ('216', 'TAILANDIA', '1');
INSERT INTO `pais` VALUES ('217', 'TANZANIA', '1');
INSERT INTO `pais` VALUES ('218', 'TIMOR ORIENTAL', '1');
INSERT INTO `pais` VALUES ('219', 'TOGO', '1');
INSERT INTO `pais` VALUES ('220', 'TOKELAU', '1');
INSERT INTO `pais` VALUES ('221', 'TONGA', '1');
INSERT INTO `pais` VALUES ('222', 'TRINIDAD Y TOBAGO', '1');
INSERT INTO `pais` VALUES ('223', 'TUNEZ', '1');
INSERT INTO `pais` VALUES ('224', 'TURKMENISTAN', '1');
INSERT INTO `pais` VALUES ('225', 'TURQUIA', '1');
INSERT INTO `pais` VALUES ('226', 'TUVALU', '1');
INSERT INTO `pais` VALUES ('227', 'UCRANIA', '1');
INSERT INTO `pais` VALUES ('228', 'UGANDA', '1');
INSERT INTO `pais` VALUES ('229', 'URUGUAY', '1');
INSERT INTO `pais` VALUES ('230', 'UZBEKISTAN', '1');
INSERT INTO `pais` VALUES ('231', 'VANUATU', '1');
INSERT INTO `pais` VALUES ('232', 'VENEZUELA', '1');
INSERT INTO `pais` VALUES ('233', 'VIETNAM', '1');
INSERT INTO `pais` VALUES ('234', 'WALLIS Y FORTUNA', '1');
INSERT INTO `pais` VALUES ('235', 'YEMEN', '1');
INSERT INTO `pais` VALUES ('236', 'ZAMBIA', '1');
INSERT INTO `pais` VALUES ('237', 'ZIMBABWE', '1');

-- ----------------------------
-- Table structure for periodos
-- ----------------------------
DROP TABLE IF EXISTS `periodos`;
CREATE TABLE `periodos` (
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
  KEY `fk_periodos_users1_idx` (`users_id`),
  CONSTRAINT `fk_periodos_periodo_prog_edu1` FOREIGN KEY (`periodo_pedu`) REFERENCES `periodo_prog_edu` (`periodo_pedu`),
  CONSTRAINT `fk_periodos_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of periodos
-- ----------------------------
INSERT INTO `periodos` VALUES ('20121', '1', '2012', '1', 'Período Enero-Julio 2012', '2013-01-01', '2013-07-31', '1', '1');
INSERT INTO `periodos` VALUES ('20122', '1', '2012', '9', 'Período Septiembre-Diciembre 2012', '2014-09-01', '2014-12-15', '1', '1');
INSERT INTO `periodos` VALUES ('20131', '1', '2013', '1', 'Período Enero-Julio 2013', '2013-01-01', '2013-07-31', '1', '1');
INSERT INTO `periodos` VALUES ('20132', '1', '2013', '9', 'Período Septiembre-Dciembre 2013', '2013-09-01', '2013-12-15', '1', '1');
INSERT INTO `periodos` VALUES ('20141', '1', '2014', '1', 'Período Enero-Julio 2014 ', '2014-01-01', '2014-07-31', '1', '1');
INSERT INTO `periodos` VALUES ('20142', '1', '2014', '7', 'Período Septiembre-Diciembre 2014 ', '2014-09-01', '2014-12-15', '1', '1');
INSERT INTO `periodos` VALUES ('20151', '1', '2015', '1', 'Período Enero-Julio 2014 ', '2015-01-01', '2015-07-31', '1', '1');
INSERT INTO `periodos` VALUES ('20152', '1', '2015', '7', 'Período Agosto-diciembre 2015', '2015-08-01', '2014-12-31', '1', '1');

-- ----------------------------
-- Table structure for periodo_prog_edu
-- ----------------------------
DROP TABLE IF EXISTS `periodo_prog_edu`;
CREATE TABLE `periodo_prog_edu` (
  `periodo_pedu` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Tipo: 1=semestral/2=cuatrimestral',
  `descripcion` varchar(15) NOT NULL COMMENT 'Descripcion: semestral, cuatrimestral',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`periodo_pedu`),
  UNIQUE KEY `TP_codigo_UNIQUE` (`periodo_pedu`),
  KEY `fk_periodo_prog_edu_users1_idx` (`users_id`),
  CONSTRAINT `fk_periodo_prog_edu_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of periodo_prog_edu
-- ----------------------------
INSERT INTO `periodo_prog_edu` VALUES ('1', 'SEMESTRAL', '1');
INSERT INTO `periodo_prog_edu` VALUES ('2', 'CUATRIMESTRAL', '1');
INSERT INTO `periodo_prog_edu` VALUES ('3', 'TRIMESTRAL', '1');
INSERT INTO `periodo_prog_edu` VALUES ('4', 'SABATINO', '1');

-- ----------------------------
-- Table structure for planestudio
-- ----------------------------
DROP TABLE IF EXISTS `planestudio`;
CREATE TABLE `planestudio` (
  `plan` int(11) NOT NULL COMMENT 'Código Plan (Año+Semestre)',
  `descripcion` varchar(35) NOT NULL COMMENT 'Descripción plan  ("PLAN DE ESTUDIOS "+Año+" "+Semestre)',
  `credpracticas` int(11) NOT NULL COMMENT 'Total Créditos practicas',
  `feciniciovig` date NOT NULL COMMENT 'Fecha inicio Vigencia',
  `fecfinvig` date NOT NULL COMMENT 'Fecha Fin Vigencia',
  `nivel` int(11) NOT NULL COMMENT 'Lic, post',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`plan`),
  KEY `fk_planestudiodesc_users1_idx` (`users_id`),
  KEY `fk_planestudiodesc_nvprograma1_idx` (`nivel`),
  CONSTRAINT `fk_planestudiodesc_nvprograma1` FOREIGN KEY (`nivel`) REFERENCES `nvprograma` (`nivel`),
  CONSTRAINT `fk_planestudiodesc_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of planestudio
-- ----------------------------
INSERT INTO `planestudio` VALUES ('20092', 'PLAN DE ESTUDIOS 2009-2', '20', '2009-01-01', '2015-12-31', '1', '1');

-- ----------------------------
-- Table structure for plan_programa
-- ----------------------------
DROP TABLE IF EXISTS `plan_programa`;
CREATE TABLE `plan_programa` (
  `plan` int(11) NOT NULL COMMENT 'Código Plan (Año+Semestre)',
  `programaedu` int(11) NOT NULL COMMENT 'Código Programa Educativo( Carrera)',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`plan`,`programaedu`),
  KEY `fk_planestudio_planestudiodesc1_idx` (`plan`),
  KEY `fk_planestudio_programaedu1_idx` (`programaedu`),
  KEY `fk_planestudio_users1_idx` (`users_id`),
  CONSTRAINT `fk_planestudio_planestudiodesc1` FOREIGN KEY (`plan`) REFERENCES `planestudio` (`plan`),
  CONSTRAINT `fk_planestudio_programaedu1` FOREIGN KEY (`programaedu`) REFERENCES `programaedu` (`programaedu`),
  CONSTRAINT `fk_planestudio_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of plan_programa
-- ----------------------------
INSERT INTO `plan_programa` VALUES ('20092', '1', '1');
INSERT INTO `plan_programa` VALUES ('20092', '2', '1');
INSERT INTO `plan_programa` VALUES ('20092', '3', '1');
INSERT INTO `plan_programa` VALUES ('20092', '4', '1');
INSERT INTO `plan_programa` VALUES ('20092', '5', '1');
INSERT INTO `plan_programa` VALUES ('20092', '6', '1');
INSERT INTO `plan_programa` VALUES ('20092', '7', '1');

-- ----------------------------
-- Table structure for programaedu
-- ----------------------------
DROP TABLE IF EXISTS `programaedu`;
CREATE TABLE `programaedu` (
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
  KEY `fk_programaedu_users1_idx` (`users_id`),
  CONSTRAINT `fk_programaedu_esp_prog_edu1` FOREIGN KEY (`especialidad`) REFERENCES `esp_prog_edu` (`especialidad`),
  CONSTRAINT `fk_programaedu_nvprograma1` FOREIGN KEY (`nivel`) REFERENCES `nvprograma` (`nivel`),
  CONSTRAINT `fk_programaedu_periodo_prog_edu1` FOREIGN KEY (`periodo_pedu`) REFERENCES `periodo_prog_edu` (`periodo_pedu`),
  CONSTRAINT `fk_programaedu_uacademica1` FOREIGN KEY (`uacademica`) REFERENCES `uacademica` (`uacademica`),
  CONSTRAINT `fk_programaedu_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of programaedu
-- ----------------------------
INSERT INTO `programaedu` VALUES ('1', 'ARTES', 'LA', '1', '1', null, '1', '1', '10');
INSERT INTO `programaedu` VALUES ('2', 'ADMON. DE EMPRESAS', 'LAE', '1', '1', null, '1', '1', '10');
INSERT INTO `programaedu` VALUES ('3', 'INFORMÁTICA', 'LI', '1', '1', null, '1', '1', '10');
INSERT INTO `programaedu` VALUES ('4', 'NEGOCIOS INTERNACIONALES', 'LNI', '1', '1', null, '1', '1', '10');
INSERT INTO `programaedu` VALUES ('5', 'CONTADURIA', 'LC', '1', '1', null, '1', '1', '10');
INSERT INTO `programaedu` VALUES ('6', 'TRONCO COMÚN', 'TC', '1', '1', null, '1', '1', '10');
INSERT INTO `programaedu` VALUES ('7', 'SISTEMAS COMPUTACIONALES', 'LSC', '1', '1', null, '1', '1', '1');

-- ----------------------------
-- Table structure for puesto
-- ----------------------------
DROP TABLE IF EXISTS `puesto`;
CREATE TABLE `puesto` (
  `puesto` int(11) NOT NULL AUTO_INCREMENT COMMENT '1,2,3',
  `descripcion` varchar(15) NOT NULL COMMENT 'Director, subd., adm., docente, etc.',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`puesto`),
  UNIQUE KEY `DI_directivopuesto_UNIQUE` (`puesto`),
  KEY `fk_directivopuesto_users1_idx` (`users_id`),
  CONSTRAINT `fk_puesto_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='<double-click to overwrite multiple objects>';

-- ----------------------------
-- Records of puesto
-- ----------------------------
INSERT INTO `puesto` VALUES ('1', 'DIRECTOR', '1');
INSERT INTO `puesto` VALUES ('2', 'SUBDIRECTOR', '1');
INSERT INTO `puesto` VALUES ('3', 'ADMINISTRADOR', '1');
INSERT INTO `puesto` VALUES ('4', 'DOCENTE', '1');
INSERT INTO `puesto` VALUES ('5', 'GERENTE GENERAL', '1');

-- ----------------------------
-- Table structure for puestosemp
-- ----------------------------
DROP TABLE IF EXISTS `puestosemp`;
CREATE TABLE `puestosemp` (
  `id` int(11) NOT NULL COMMENT 'No. Empleado',
  `uacademica` int(11) NOT NULL COMMENT 'Codigo uacademica (FCQ, FCA)',
  `puesto` int(11) NOT NULL COMMENT 'Codigo puesto',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  KEY `fk_directivosua_uacademica1_idx` (`uacademica`),
  KEY `fk_directivosua_directivopuesto1_idx` (`puesto`),
  KEY `fk_directivosua_users1_idx` (`users_id`),
  KEY `fk_puestosemp_users2_idx` (`id`),
  CONSTRAINT `fk_puestosemp_puesto1` FOREIGN KEY (`puesto`) REFERENCES `puesto` (`puesto`),
  CONSTRAINT `fk_puestosemp_uacademica1` FOREIGN KEY (`uacademica`) REFERENCES `uacademica` (`uacademica`),
  CONSTRAINT `fk_puestosemp_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_puestosemp_users2` FOREIGN KEY (`id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of puestosemp
-- ----------------------------
INSERT INTO `puestosemp` VALUES ('1', '1', '1', '1');

-- ----------------------------
-- Table structure for p_ua
-- ----------------------------
DROP TABLE IF EXISTS `p_ua`;
CREATE TABLE `p_ua` (
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
  KEY `fk_p_ua_caracter1_idx` (`caracter`) USING BTREE,
  CONSTRAINT `fk_p_ua_caracter1` FOREIGN KEY (`caracter`) REFERENCES `caracter` (`caracter`),
  CONSTRAINT `fk_p_ua_etapas1` FOREIGN KEY (`etapa`) REFERENCES `etapas` (`etapa`),
  CONSTRAINT `fk_p_ua_programaedu1` FOREIGN KEY (`programaedu`) REFERENCES `programaedu` (`programaedu`),
  CONSTRAINT `fk_p_ua_uaprendizaje1` FOREIGN KEY (`uaprendizaje`) REFERENCES `uaprendizaje` (`uaprendizaje`),
  CONSTRAINT `fk_p_ua_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='<double-click to overwrite multiple objects>';

-- ----------------------------
-- Records of p_ua
-- ----------------------------
INSERT INTO `p_ua` VALUES ('2', '11733', '1', '1', '4', '1');
INSERT INTO `p_ua` VALUES ('2', '11734', '1', '1', '3', '1');
INSERT INTO `p_ua` VALUES ('2', '11755', '3', '1', '7', '1');
INSERT INTO `p_ua` VALUES ('2', '11761', '2', '2', '5', '1');
INSERT INTO `p_ua` VALUES ('2', '11843', '1', '1', '3', '1');
INSERT INTO `p_ua` VALUES ('2', '11859', '1', '1', '3', '1');
INSERT INTO `p_ua` VALUES ('2', '11862', '2', '1', '4', '1');
INSERT INTO `p_ua` VALUES ('2', '12292', '3', '1', '7', '1');
INSERT INTO `p_ua` VALUES ('2', '12456', '1', '1', '3', '1');
INSERT INTO `p_ua` VALUES ('2', '12457', '1', '1', '3', '1');
INSERT INTO `p_ua` VALUES ('2', '12458', '1', '1', '3', '1');
INSERT INTO `p_ua` VALUES ('2', '12459', '1', '1', '3', '1');
INSERT INTO `p_ua` VALUES ('2', '12460', '2', '1', '4', '1');
INSERT INTO `p_ua` VALUES ('2', '12461', '2', '1', '4', '1');
INSERT INTO `p_ua` VALUES ('2', '12462', '2', '1', '4', '1');
INSERT INTO `p_ua` VALUES ('2', '12463', '2', '1', '4', '1');
INSERT INTO `p_ua` VALUES ('2', '12464', '2', '1', '4', '1');
INSERT INTO `p_ua` VALUES ('2', '12465', '2', '1', '5', '1');
INSERT INTO `p_ua` VALUES ('2', '12466', '2', '1', '5', '1');
INSERT INTO `p_ua` VALUES ('2', '12467', '2', '1', '5', '1');
INSERT INTO `p_ua` VALUES ('2', '12468', '2', '1', '5', '1');
INSERT INTO `p_ua` VALUES ('2', '12469', '2', '1', '5', '1');
INSERT INTO `p_ua` VALUES ('2', '12470', '2', '1', '6', '1');
INSERT INTO `p_ua` VALUES ('2', '12471', '2', '1', '6', '1');
INSERT INTO `p_ua` VALUES ('2', '12472', '2', '1', '6', '1');
INSERT INTO `p_ua` VALUES ('2', '12473', '2', '1', '6', '1');
INSERT INTO `p_ua` VALUES ('2', '12474', '2', '1', '6', '1');
INSERT INTO `p_ua` VALUES ('2', '12475', '2', '1', '6', '1');
INSERT INTO `p_ua` VALUES ('2', '12476', '3', '1', '7', '1');
INSERT INTO `p_ua` VALUES ('2', '12477', '3', '1', '7', '1');
INSERT INTO `p_ua` VALUES ('2', '12478', '3', '1', '7', '1');
INSERT INTO `p_ua` VALUES ('2', '12479', '2', '1', '7', '1');
INSERT INTO `p_ua` VALUES ('2', '12480', '3', '1', '8', '1');
INSERT INTO `p_ua` VALUES ('2', '12481', '3', '1', '8', '1');
INSERT INTO `p_ua` VALUES ('2', '12482', '3', '2', '7', '1');
INSERT INTO `p_ua` VALUES ('2', '12483', '1', '2', '2', '1');
INSERT INTO `p_ua` VALUES ('2', '12484', '1', '2', '2', '1');
INSERT INTO `p_ua` VALUES ('2', '12485', '1', '2', '2', '1');
INSERT INTO `p_ua` VALUES ('2', '12486', '1', '2', '2', '1');
INSERT INTO `p_ua` VALUES ('2', '12487', '2', '2', '5', '1');
INSERT INTO `p_ua` VALUES ('2', '12488', '2', '2', '5', '1');
INSERT INTO `p_ua` VALUES ('2', '12489', '2', '2', '5', '1');
INSERT INTO `p_ua` VALUES ('2', '12490', '2', '2', '5', '1');
INSERT INTO `p_ua` VALUES ('2', '12491', '2', '2', '6', '1');
INSERT INTO `p_ua` VALUES ('2', '12492', '2', '2', '5', '1');
INSERT INTO `p_ua` VALUES ('2', '12493', '3', '2', '8', '1');
INSERT INTO `p_ua` VALUES ('2', '12494', '3', '2', '8', '1');
INSERT INTO `p_ua` VALUES ('2', '12495', '3', '2', '7', '1');
INSERT INTO `p_ua` VALUES ('2', '12496', '3', '2', '7', '1');
INSERT INTO `p_ua` VALUES ('2', '12497', '3', '2', '7', '1');
INSERT INTO `p_ua` VALUES ('2', '12498', '3', '2', '8', '1');
INSERT INTO `p_ua` VALUES ('2', '12499', '3', '2', '7', '1');
INSERT INTO `p_ua` VALUES ('2', '12500', '3', '2', '8', '1');
INSERT INTO `p_ua` VALUES ('2', '12501', '3', '2', '7', '1');
INSERT INTO `p_ua` VALUES ('5', '11733', '1', '1', '4', '1');
INSERT INTO `p_ua` VALUES ('5', '11734', '1', '1', '3', '1');
INSERT INTO `p_ua` VALUES ('5', '11737', '2', '1', '5', '1');
INSERT INTO `p_ua` VALUES ('5', '11755', '3', '1', '7', '1');
INSERT INTO `p_ua` VALUES ('5', '11843', '1', '1', '3', '1');
INSERT INTO `p_ua` VALUES ('5', '12457', '1', '1', '3', '1');
INSERT INTO `p_ua` VALUES ('5', '12458', '1', '1', '3', '1');
INSERT INTO `p_ua` VALUES ('5', '12459', '1', '1', '3', '1');
INSERT INTO `p_ua` VALUES ('5', '12467', '2', '1', '5', '1');
INSERT INTO `p_ua` VALUES ('5', '12470', '2', '1', '6', '1');
INSERT INTO `p_ua` VALUES ('5', '12472', '2', '1', '6', '1');
INSERT INTO `p_ua` VALUES ('5', '12479', '2', '1', '7', '1');
INSERT INTO `p_ua` VALUES ('5', '12481', '3', '1', '8', '1');
INSERT INTO `p_ua` VALUES ('5', '12492', '2', '2', '5', '1');
INSERT INTO `p_ua` VALUES ('5', '12559', '1', '1', '2', '1');
INSERT INTO `p_ua` VALUES ('5', '12560', '2', '1', '5', '1');
INSERT INTO `p_ua` VALUES ('5', '12561', '2', '1', '5', '1');
INSERT INTO `p_ua` VALUES ('5', '12562', '2', '1', '5', '1');
INSERT INTO `p_ua` VALUES ('5', '12563', '2', '1', '5', '1');
INSERT INTO `p_ua` VALUES ('5', '12564', '2', '1', '5', '1');
INSERT INTO `p_ua` VALUES ('5', '12565', '2', '1', '5', '1');
INSERT INTO `p_ua` VALUES ('5', '12566', '2', '1', '5', '1');
INSERT INTO `p_ua` VALUES ('5', '12567', '2', '1', '5', '1');
INSERT INTO `p_ua` VALUES ('5', '12568', '2', '1', '5', '1');
INSERT INTO `p_ua` VALUES ('5', '12569', '2', '1', '5', '1');
INSERT INTO `p_ua` VALUES ('5', '12570', '2', '1', '5', '1');
INSERT INTO `p_ua` VALUES ('5', '12571', '2', '1', '5', '1');
INSERT INTO `p_ua` VALUES ('5', '12572', '3', '1', '7', '1');
INSERT INTO `p_ua` VALUES ('5', '12573', '3', '1', '7', '1');
INSERT INTO `p_ua` VALUES ('5', '12574', '3', '1', '7', '1');
INSERT INTO `p_ua` VALUES ('5', '12575', '3', '1', '7', '1');
INSERT INTO `p_ua` VALUES ('5', '12576', '3', '1', '7', '1');
INSERT INTO `p_ua` VALUES ('5', '12578', '3', '1', '7', '1');
INSERT INTO `p_ua` VALUES ('5', '12579', '3', '1', '7', '1');
INSERT INTO `p_ua` VALUES ('5', '12581', '2', '2', '5', '1');
INSERT INTO `p_ua` VALUES ('5', '12582', '2', '2', '5', '1');
INSERT INTO `p_ua` VALUES ('5', '12583', '2', '2', '5', '1');
INSERT INTO `p_ua` VALUES ('5', '12584', '2', '2', '5', '1');
INSERT INTO `p_ua` VALUES ('5', '12585', '2', '2', '5', '1');
INSERT INTO `p_ua` VALUES ('5', '12586', '3', '2', '7', '1');
INSERT INTO `p_ua` VALUES ('5', '12587', '3', '2', '7', '1');
INSERT INTO `p_ua` VALUES ('5', '12588', '3', '2', '7', '1');
INSERT INTO `p_ua` VALUES ('5', '12589', '3', '2', '7', '1');
INSERT INTO `p_ua` VALUES ('5', '12590', '3', '2', '7', '1');
INSERT INTO `p_ua` VALUES ('5', '12591', '3', '2', '7', '1');
INSERT INTO `p_ua` VALUES ('5', '12592', '3', '2', '7', '1');
INSERT INTO `p_ua` VALUES ('5', '12593', '3', '2', '7', '1');
INSERT INTO `p_ua` VALUES ('5', '12594', '3', '2', '7', '1');
INSERT INTO `p_ua` VALUES ('6', '11236', '1', '1', '1', '1');
INSERT INTO `p_ua` VALUES ('6', '11237', '1', '1', '1', '1');
INSERT INTO `p_ua` VALUES ('6', '11238', '1', '1', '1', '1');
INSERT INTO `p_ua` VALUES ('6', '11239', '1', '1', '1', '1');
INSERT INTO `p_ua` VALUES ('6', '11240', '1', '1', '1', '1');
INSERT INTO `p_ua` VALUES ('6', '11241', '1', '1', '1', '1');
INSERT INTO `p_ua` VALUES ('6', '11242', '1', '1', '1', '1');
INSERT INTO `p_ua` VALUES ('6', '11243', '1', '1', '2', '1');
INSERT INTO `p_ua` VALUES ('6', '11244', '1', '1', '2', '1');
INSERT INTO `p_ua` VALUES ('6', '11245', '1', '1', '2', '1');
INSERT INTO `p_ua` VALUES ('6', '11246', '1', '1', '2', '1');
INSERT INTO `p_ua` VALUES ('6', '11247', '1', '1', '2', '1');
INSERT INTO `p_ua` VALUES ('6', '11248', '1', '1', '2', '1');
INSERT INTO `p_ua` VALUES ('6', '11249', '1', '1', '2', '1');

-- ----------------------------
-- Table structure for reqseriacion
-- ----------------------------
DROP TABLE IF EXISTS `reqseriacion`;
CREATE TABLE `reqseriacion` (
  `reqseriacion` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Reqseriacion (1,2,3)',
  `descripcion` varchar(15) NOT NULL COMMENT 'Obligada, Sugerida, Sin seriación',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`reqseriacion`),
  UNIQUE KEY `RS_codigo_UNIQUE` (`reqseriacion`),
  KEY `fk_reqseriacion_users1_idx` (`users_id`),
  CONSTRAINT `fk_reqseriacion_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='<double-click to overwrite multiple objects>';

-- ----------------------------
-- Records of reqseriacion
-- ----------------------------
INSERT INTO `reqseriacion` VALUES ('1', 'OBLIGATORIA', '1');
INSERT INTO `reqseriacion` VALUES ('2', 'CONVENIENTE', '1');

-- ----------------------------
-- Table structure for status
-- ----------------------------
DROP TABLE IF EXISTS `status`;
CREATE TABLE `status` (
  `status` int(11) NOT NULL COMMENT 'status (1,2,3)',
  `descripcion` varchar(45) DEFAULT NULL COMMENT 'Status: 1=Completado 2=Capturado 3=En proceso',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`status`),
  KEY `fk_status_users1_idx` (`users_id`),
  CONSTRAINT `fk_status_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of status
-- ----------------------------
INSERT INTO `status` VALUES ('1', 'CAPTURADO', '10');
INSERT INTO `status` VALUES ('2', 'COMPLETADO', '10');
INSERT INTO `status` VALUES ('3', 'EN PROCESO', '10');

-- ----------------------------
-- Table structure for status_horarios
-- ----------------------------
DROP TABLE IF EXISTS `status_horarios`;
CREATE TABLE `status_horarios` (
  `periodo` int(11) NOT NULL COMMENT 'Período',
  `id` int(11) NOT NULL COMMENT 'Docente',
  `status` int(11) NOT NULL COMMENT 'Status Hor Docen 1=Compl 2=Capt 3=En proc',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`periodo`,`id`),
  KEY `fk_status_horarios_status1_idx` (`status`),
  KEY `fk_status_horarios_users1_idx` (`users_id`),
  KEY `fk_status_horarios_users2_idx` (`id`),
  CONSTRAINT `fk_status_horarios_periodos1` FOREIGN KEY (`periodo`) REFERENCES `periodos` (`periodo`),
  CONSTRAINT `fk_status_horarios_status1` FOREIGN KEY (`status`) REFERENCES `status` (`status`),
  CONSTRAINT `fk_status_horarios_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_status_horarios_users2` FOREIGN KEY (`id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of status_horarios
-- ----------------------------

-- ----------------------------
-- Table structure for status_procesos
-- ----------------------------
DROP TABLE IF EXISTS `status_procesos`;
CREATE TABLE `status_procesos` (
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
  KEY `fk_status_procesos_status2_idx` (`status_plan`),
  CONSTRAINT `fk_status_procesos_periodos1` FOREIGN KEY (`periodo`) REFERENCES `periodos` (`periodo`),
  CONSTRAINT `fk_status_procesos_programaedu1` FOREIGN KEY (`programaedu`) REFERENCES `programaedu` (`programaedu`),
  CONSTRAINT `fk_status_procesos_status1` FOREIGN KEY (`status_carga`) REFERENCES `status` (`status`),
  CONSTRAINT `fk_status_procesos_status2` FOREIGN KEY (`status_plan`) REFERENCES `status` (`status`),
  CONSTRAINT `fk_status_procesos_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of status_procesos
-- ----------------------------

-- ----------------------------
-- Table structure for tipo_curso_emp
-- ----------------------------
DROP TABLE IF EXISTS `tipo_curso_emp`;
CREATE TABLE `tipo_curso_emp` (
  `tipo_curso_emp` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Tipo curso',
  `descripcion` varchar(45) NOT NULL COMMENT 'Descipción: Impartido, recibido, interés',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`tipo_curso_emp`),
  KEY `fk_tipo_curso_emp_users1_idx` (`users_id`),
  CONSTRAINT `fk_tipo_curso_emp_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tipo_curso_emp
-- ----------------------------
INSERT INTO `tipo_curso_emp` VALUES ('1', 'RECIBIDO', '1');
INSERT INTO `tipo_curso_emp` VALUES ('2', 'IMPARTIDO', '1');
INSERT INTO `tipo_curso_emp` VALUES ('3', 'DE INTERES', '1');

-- ----------------------------
-- Table structure for trabadicional_emp
-- ----------------------------
DROP TABLE IF EXISTS `trabadicional_emp`;
CREATE TABLE `trabadicional_emp` (
  `empresa` int(11) NOT NULL,
  `id` int(11) NOT NULL COMMENT 'Num empleado UABC',
  `fec_ing` date DEFAULT NULL COMMENT 'Fecha ingreso',
  `puesto` int(11) NOT NULL COMMENT 'puesto',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`id`,`empresa`),
  KEY `fk_trabadicional_emp_empresa_adic1_idx` (`empresa`),
  KEY `fk_trabadicional_emp_users1_idx` (`users_id`),
  KEY `fk_trabadicional_emp_puesto1_idx` (`puesto`),
  KEY `fk_trabadicional_emp_users2_idx` (`id`),
  CONSTRAINT `fk_trabadicional_emp_empresa_adic1` FOREIGN KEY (`empresa`) REFERENCES `empresa_adic` (`empresa`),
  CONSTRAINT `fk_trabadicional_emp_puesto1` FOREIGN KEY (`puesto`) REFERENCES `puesto` (`puesto`),
  CONSTRAINT `fk_trabadicional_emp_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_trabadicional_emp_users2` FOREIGN KEY (`id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of trabadicional_emp
-- ----------------------------
INSERT INTO `trabadicional_emp` VALUES ('1', '18', '2003-12-01', '5', '1');

-- ----------------------------
-- Table structure for turnos
-- ----------------------------
DROP TABLE IF EXISTS `turnos`;
CREATE TABLE `turnos` (
  `turno` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Turno  (1,2,3)',
  `descripcion` varchar(20) NOT NULL COMMENT 'Descripción: Matutino, Vespertino, Interturnos',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`turno`),
  UNIQUE KEY `codigo_UNIQUE` (`turno`),
  KEY `fk_turnos_users1_idx` (`users_id`),
  CONSTRAINT `fk_turnos_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of turnos
-- ----------------------------
INSERT INTO `turnos` VALUES ('1', 'MATUTINO', '10');
INSERT INTO `turnos` VALUES ('2', 'VESPERTINO', '10');
INSERT INTO `turnos` VALUES ('3', 'INTERTURNO', '10');

-- ----------------------------
-- Table structure for uacademica
-- ----------------------------
DROP TABLE IF EXISTS `uacademica`;
CREATE TABLE `uacademica` (
  `uacademica` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo Facultad',
  `descripshort` varchar(10) NOT NULL COMMENT 'Descripcion (FCQ, FCA)',
  `descripcion` varchar(60) NOT NULL COMMENT 'Descripcion Facultad',
  `campus` int(11) NOT NULL DEFAULT '1' COMMENT 'Codigo campus',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`uacademica`),
  UNIQUE KEY `UAC_codigo_UNIQUE` (`uacademica`),
  KEY `fk_uacademica_campus1_idx` (`campus`),
  KEY `fk_uacademica_users1_idx` (`users_id`),
  CONSTRAINT `fk_uacademica_campus1` FOREIGN KEY (`campus`) REFERENCES `campus` (`campus`),
  CONSTRAINT `fk_uacademica_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uacademica
-- ----------------------------
INSERT INTO `uacademica` VALUES ('1', 'FCA', 'FACULTAD DE CONTADURIA Y ADMINISTRACION', '1', '1');
INSERT INTO `uacademica` VALUES ('2', 'FCQI', 'FACULTAD DE CIENCIAS QUIMICAS E INGENIERIA', '1', '1');
INSERT INTO `uacademica` VALUES ('3', 'FHCS', 'FACULTAD DE HUMANIDADES Y CIENCIAS SOCIALES', '1', '1');
INSERT INTO `uacademica` VALUES ('4', 'FD', 'FACULTAD DE DERECHO', '1', '1');
INSERT INTO `uacademica` VALUES ('5', 'FERI', 'FACULTAD DE ECONOMIA Y RELACIONES INTERNACIONALES', '1', '1');
INSERT INTO `uacademica` VALUES ('6', 'FIN', 'FACULTAD DE INGENIERIA Y NEGOCIOS', '1', '1');
INSERT INTO `uacademica` VALUES ('7', 'FMP', 'FACULTAD DE MEDICINA Y PSICOLOGIA', '1', '1');
INSERT INTO `uacademica` VALUES ('8', 'FO', 'FACULTAD DE ODONTOLOGIA', '1', '1');
INSERT INTO `uacademica` VALUES ('9', 'FTM', 'FACULTAD DE TURISMO Y MERCADOTECNIA', '1', '1');
INSERT INTO `uacademica` VALUES ('10', 'FA', 'FACULTAD DE ARTES', '1', '1');

-- ----------------------------
-- Table structure for uaprendizaje
-- ----------------------------
DROP TABLE IF EXISTS `uaprendizaje`;
CREATE TABLE `uaprendizaje` (
  `uaprendizaje` int(11) NOT NULL COMMENT 'Código uaprendizaje (SOLO NUMERICOS)',
  `descripcionmat` varchar(100) NOT NULL COMMENT 'Descripción  uaprendizaje',
  `HC` int(11) NOT NULL COMMENT 'Horas Clase',
  `HL` int(11) NOT NULL COMMENT 'Horas Laboratorio',
  `HT` int(11) NOT NULL COMMENT 'Horas Taller',
  `HPC` int(11) NOT NULL COMMENT 'Horas',
  `HCL` int(11) NOT NULL COMMENT 'Horas Clinica',
  `HE` int(11) NOT NULL COMMENT 'Horas Extra',
  `creditos` int(11) NOT NULL COMMENT 'Numero de Créditos\n1Hr Clase= 2c',
  `fec_aut` date DEFAULT NULL COMMENT 'Fecha autorización',
  `observa` varchar(60) DEFAULT NULL COMMENT 'Observaciones',
  `coordinaciona` int(11) NOT NULL COMMENT 'Codigo coordinacion area',
  `plan` int(11) NOT NULL COMMENT 'Codigo plan estudio',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`uaprendizaje`),
  UNIQUE KEY `UA_clave_UNIQUE` (`uaprendizaje`),
  KEY `fk_uaprendizaje_coordinaciona1_idx` (`coordinaciona`),
  KEY `fk_uaprendizaje_planestudio1_idx` (`plan`),
  KEY `fk_uaprendizaje_users1_idx` (`users_id`),
  CONSTRAINT `fk_uaprendizaje_planestudio1` FOREIGN KEY (`plan`) REFERENCES `planestudio` (`plan`),
  CONSTRAINT `fk_uaprendizaje_coordinaciona1` FOREIGN KEY (`coordinaciona`) REFERENCES `coordinaciona` (`coordinaciona`),
  CONSTRAINT `fk_uaprendizaje_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='<double-click to overwrite multiple objects>';

-- ----------------------------
-- Records of uaprendizaje
-- ----------------------------
INSERT INTO `uaprendizaje` VALUES ('0', 'esto es una pruena', '1', '1', '1', '1', '1', '1', '1', '2014-07-01', 'esto es una prueba', '1', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('11236', 'COMUNICACION ORAL Y ESCRITA', '1', '0', '2', '0', '0', '0', '4', null, null, '21', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('11237', 'CONTABILIDAD', '2', '0', '3', '0', '0', '0', '7', null, null, '1', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('11238', 'DESARROLLO HUMANO', '1', '0', '2', '0', '0', '0', '4', null, null, '8', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('11239', 'ENTORNO GLOBAL DE LOS NEGOCIOS', '2', '0', '2', '0', '0', '0', '6', null, null, '10', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('11240', 'MATEMATICAS', '2', '0', '2', '0', '0', '0', '6', null, null, '22', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('11241', 'RESPONSABILIDAD SOCIAL', '2', '0', '1', '0', '0', '0', '5', null, null, '21', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('11242', 'TECNOLOGIAS DE LA INFORMACION', '1', '3', '0', '0', '0', '0', '5', null, null, '12', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('11243', 'CONTABILIDAD APLICADA', '2', '0', '3', '0', '0', '0', '7', null, null, '1', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('11244', 'DERECHO', '3', '0', '0', '0', '0', '0', '6', null, null, '19', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('11245', 'ECONOMIA', '2', '0', '2', '0', '0', '0', '6', null, null, '17', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('11246', 'LOGICA PARA LA TOMA DE DECISIONES', '1', '0', '3', '0', '0', '0', '5', null, null, '16', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('11247', 'PROBABILIDAD Y ESTADISTICA', '2', '0', '2', '0', '0', '0', '6', null, null, '22', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('11248', 'PROCESO ADMINISTRATIVO', '2', '0', '2', '0', '0', '0', '6', null, null, '10', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('11249', 'SISTEMAS DE INFORMACION', '2', '0', '2', '0', '0', '0', '6', null, null, '15', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('11733', 'MATEMATICAS FINANCIERAS', '2', '0', '2', '0', '0', '0', '6', null, null, '4', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('11734', 'ENTORNO SOCIOECONOMICO DE MEXICO', '2', '0', '2', '0', '0', '0', '6', null, null, '17', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('11737', 'DERECHO CORPORATIVO', '3', '0', '1', '0', '0', '0', '7', null, null, '19', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('11755', 'DESARROLLO DE EMPRENDEDORES', '1', '0', '3', '0', '0', '0', '5', null, null, '20', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('11761', 'ADMINISTRACION PUBLICA', '3', '0', '0', '0', '0', '0', '6', null, null, '11', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('11843', 'METODOLOGIA DE LA INVESTIGACION', '2', '0', '1', '0', '0', '0', '5', null, null, '21', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('11859', 'METODOS CUANTITATIVOS', '2', '0', '2', '0', '0', '0', '6', null, null, '9', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('11862', 'MERCADOTECNIA', '2', '0', '2', '0', '0', '0', '6', null, null, '7', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('12292', 'ADMINISTRACION ESTRATEGICA', '2', '0', '2', '0', '0', '0', '6', null, null, '11', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('12345', 'preuba de bitacora', '1', '1', '1', '1', '1', '1', '1', '2014-08-01', 'prueba bita', '1', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('12456', 'ADMINISTRACION DE COMPRAS', '2', '0', '1', '0', '0', '0', '5', null, null, '10', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('12457', 'DISEÃ‘O ORGANIZACIONAL', '2', '0', '2', '0', '0', '0', '6', null, null, '10', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('12458', 'REGISTROS ESPECIALES', '2', '0', '2', '0', '0', '0', '6', null, null, '1', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('12459', 'RELACIONES LABORALES', '2', '0', '2', '0', '0', '0', '6', null, null, '19', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('12460', 'CONTABILIDAD ADMINISTRATIVA', '2', '0', '2', '0', '0', '0', '6', null, null, '3', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('12461', 'DERECHO CORPORATIVO', '2', '0', '1', '0', '0', '0', '5', null, null, '1', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('12462', 'DERECHO FISCAL', '2', '0', '2', '0', '0', '0', '6', null, null, '6', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('12463', 'INTEGRACION Y DESARROLLO DEL TALENTO HUMANO', '2', '0', '3', '0', '0', '0', '7', null, null, '8', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('12464', 'METODOS CUANTITATIVOS AVANZADOS', '2', '0', '2', '0', '0', '0', '6', null, null, '9', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('12465', 'ADMINISTRACION DE OPERACIONES', '2', '0', '2', '0', '0', '0', '6', null, null, '9', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('12466', 'ADMINISTRACION DE VENTAS', '2', '0', '1', '0', '0', '0', '5', null, null, '7', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('12467', 'ANALISIS FINANCIERO', '2', '0', '3', '0', '0', '0', '7', null, null, '4', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('12468', 'MERCADOTECNIA AVANZADA', '2', '0', '2', '0', '0', '0', '6', null, null, '7', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('12469', 'SEGURIDAD E HIGIENE', '2', '0', '2', '0', '0', '0', '6', null, null, '8', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('12470', 'ADMINISTRACION DEL CAPITAL DE TRABAJO', '2', '0', '2', '0', '0', '0', '6', null, null, '22', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('12471', 'ADMINISTRACION DE SUELDOS Y SALARIOS', '2', '0', '2', '0', '0', '0', '6', null, null, '8', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('12472', 'CONTRIBUCIONES DE SEGURIDAD SOCIAL', '2', '0', '2', '0', '0', '0', '6', null, null, '6', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('12473', 'DIRECCION ESTRATEGICA', '2', '0', '2', '0', '0', '0', '6', null, null, '8', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('12474', 'INVESTIGACION DE MERCADO', '2', '0', '2', '0', '0', '0', '6', null, null, '7', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('12475', 'SI ESTRATEGICA EN LOS NEGOCIOS', '1', '0', '3', '0', '0', '0', '5', null, null, '15', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('12476', 'ADMINISTRACION DE LA CALIDAD', '2', '0', '2', '0', '0', '0', '6', null, null, '22', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('12477', 'AUDITORIA ADMINISTRATIVA', '2', '0', '2', '0', '0', '0', '6', null, null, '11', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('12478', 'CONTROL PRESUPUESTAL', '2', '0', '2', '0', '0', '0', '6', null, null, '4', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('12479', 'FUENTES DE FINANCIAMIENTO', '2', '0', '2', '0', '0', '0', '6', null, null, '4', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('12480', 'COMPETITIVIDAD EN LOS MERCADOS', '1', '0', '3', '0', '0', '0', '5', null, null, '9', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('12481', 'FORMULACION Y EVALUACION DE PROYECTOS DE INVERSION', '1', '0', '3', '0', '0', '0', '5', null, null, '4', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('12482', 'PRACTICA PROFESIONAL', '0', '0', '0', '0', '0', '0', '10', null, null, '22', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('12483', 'ADMON. DEL MEDIO AMBIENTE', '3', '0', '0', '0', '0', '0', '6', null, null, '22', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('12484', 'ETICA', '3', '0', '0', '0', '0', '0', '6', null, null, '21', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('12485', 'IDIOMA', '3', '0', '0', '0', '0', '0', '6', null, null, '22', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('12486', 'SOCIOLOGIA DE LA EMPRESA', '3', '0', '0', '0', '0', '0', '6', null, null, '10', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('12487', 'COMERCIO EXTERIOR', '4', '0', '0', '0', '0', '0', '6', null, null, '18', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('12488', 'DESARROLLO DE HABILIDADES DOCENTES', '4', '0', '0', '0', '0', '0', '6', null, null, '21', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('12489', 'DESARROLLO ORGANIZACIONAL', '3', '0', '0', '0', '0', '0', '6', null, null, '10', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('12490', 'IMPUESTOS', '4', '0', '0', '0', '0', '0', '7', null, null, '6', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('12491', 'MERCADOTECNIAS ESPECIALES', '4', '0', '0', '0', '0', '0', '7', null, null, '7', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('12492', 'TECNICAS DE NEGOCIACION', '2', '0', '1', '0', '0', '0', '5', null, null, '11', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('12493', 'ADMON. DE AGRONEGOCIOS', '3', '0', '0', '0', '0', '0', '6', null, null, '11', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('12494', 'ADMON. Y COMERCIO ELECTRONICO', '4', '0', '0', '0', '0', '0', '6', null, null, '12', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('12495', 'COMUNICACION ORGANIZACIONAL', '4', '0', '0', '0', '0', '0', '6', null, null, '11', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('12496', 'CONSULTORIA', '4', '0', '0', '0', '0', '0', '6', null, null, '11', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('12497', 'CREACION DE NEGOCIOS POR INTERNET', '4', '0', '0', '0', '0', '0', '6', null, null, '12', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('12498', 'DESARROLLO DE HABILIDADES DIRECTIVAS', '3', '0', '0', '0', '0', '0', '6', null, null, '8', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('12499', 'ETICA DE LOS NEGOCIOS', '4', '0', '0', '0', '0', '0', '7', null, null, '22', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('12500', 'FINANZAS INTERNACIONALES', '4', '0', '0', '0', '0', '0', '6', null, null, '4', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('12501', 'SISTEMAS ADMINISTRATIVOS ESPECIALES', '3', '0', '0', '0', '0', '0', '6', null, null, '22', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('12559', 'DERECHO TRIBUTARIO', '2', '0', '3', '0', '0', '0', '7', null, null, '6', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('12560', 'IMPUESTOS INDIRECTOS', '2', '0', '2', '0', '0', '0', '6', null, null, '6', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('12561', 'NORMAS DE INFORMACION FINANCIERA', '2', '0', '3', '0', '0', '0', '7', null, null, '22', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('12562', 'PROFESION CONTABLE', '1', '0', '2', '0', '0', '0', '4', null, null, '22', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('12563', 'CONTABILIDAD DE SOCIEDADES', '2', '0', '2', '0', '0', '0', '6', null, null, '2', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('12564', 'CONTROL', '1', '0', '4', '0', '0', '0', '6', null, null, '5', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('12565', 'FUNDAMENTOS DE CONTABILIDAD DE COSTOS', '2', '0', '3', '0', '0', '0', '7', null, null, '3', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('12566', 'NORMAS PARTICULARES', '3', '0', '3', '0', '0', '0', '7', null, null, '22', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('12567', 'AUDITORIA', '2', '0', '3', '0', '0', '0', '7', null, null, '5', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('12568', 'COSTOS PREDETERMINADOS', '2', '0', '3', '0', '0', '0', '7', null, null, '3', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('12569', 'ESTADOS FINANCIEROS', '1', '2', '0', '0', '0', '0', '4', null, null, '2', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('12570', 'ISR PERSONAS FISICAS', '2', '0', '3', '0', '0', '0', '7', null, null, '6', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('12571', 'PLANEACION FINANCIERA', '1', '0', '2', '0', '0', '0', '4', null, null, '4', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('12572', 'COSTOS PARA LA TOMA DE DECISIONES', '2', '0', '2', '0', '0', '0', '6', null, null, '3', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('12573', 'ISR PERSONAS MORALES Y OTRAS CONTRIBUCIONES', '2', '0', '3', '0', '0', '0', '7', null, null, '6', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('12574', 'PAQUETERIA NEGOCIOS', '1', '2', '0', '0', '0', '0', '4', null, null, '2', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('12575', 'PRACTICA DE AUDITORIAS', '1', '0', '3', '0', '0', '0', '5', null, null, '5', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('12576', 'PRACTICA FISCAL', '1', '2', '0', '0', '0', '0', '4', null, null, '6', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('12578', 'INTEGRACION FISCAL', '1', '0', '2', '0', '0', '0', '4', null, null, '6', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('12579', 'PLANEACION ESTRATEGICA', '1', '0', '3', '0', '0', '0', '5', null, null, '11', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('12581', 'ANALISIS DE LA LEGISLACION ADUANERA', '4', '0', '0', '0', '0', '0', '8', null, null, '22', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('12582', 'COSTOS Y PRODUCTIVIDAD', '2', '0', '2', '0', '0', '0', '6', null, null, '3', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('12583', 'INVESTIGACION DE OPERACIONES', '2', '0', '2', '0', '0', '0', '6', null, null, '9', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('12584', 'MERCADOTECNIA', '2', '0', '2', '0', '0', '0', '6', null, null, '7', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('12585', 'PRODUCCION', '1', '0', '2', '0', '0', '0', '4', null, null, '9', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('12586', 'AUDITORIAS ESPECIALES', '2', '0', '2', '0', '0', '0', '6', null, null, '5', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('12587', 'CASOS PRACTICOS DE COSTOS', '2', '0', '2', '0', '0', '0', '6', null, null, '3', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('12588', 'CONTABILIDAD INTERNACIONAL', '2', '0', '1', '0', '0', '0', '5', null, null, '2', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('12589', 'CONTABILIDAD CONSOLIDADA', '3', '0', '1', '0', '0', '0', '7', null, null, '2', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('12590', 'CONTABILIDADES ESPECIALES', '2', '0', '2', '0', '0', '0', '6', null, null, '2', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('12591', 'DICTAMENES', '4', '0', '0', '0', '0', '0', '8', null, null, '5', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('12592', 'FINANZAS INTERNACIONALES', '3', '0', '1', '0', '0', '0', '7', null, null, '4', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('12593', 'INVESTIGACION CONTABLE', '2', '0', '2', '0', '0', '0', '6', null, null, '2', '20092', '1');
INSERT INTO `uaprendizaje` VALUES ('12594', 'MERCADO DE VALORES', '2', '0', '1', '0', '0', '0', '5', null, null, '4', '20092', '1');

-- ----------------------------
-- Table structure for universidades_emp
-- ----------------------------
DROP TABLE IF EXISTS `universidades_emp`;
CREATE TABLE `universidades_emp` (
  `universidad` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Universidad empleados',
  `descripcion` varchar(60) NOT NULL COMMENT 'Descripcion Universidad',
  `descripshort` varchar(10) NOT NULL,
  `ciudad` int(11) NOT NULL COMMENT 'Ciudad',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`universidad`),
  KEY `fk_universidades_emp_ciudad1_idx` (`ciudad`),
  KEY `fk_universidades_emp_users1_idx` (`users_id`),
  CONSTRAINT `fk_universidades_emp_ciudad1` FOREIGN KEY (`ciudad`) REFERENCES `ciudad` (`ciudad`),
  CONSTRAINT `fk_universidades_emp_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of universidades_emp
-- ----------------------------
INSERT INTO `universidades_emp` VALUES ('1', 'UNIVERSIDAD AUTONOMA DE BAJA CALIFORNIA', 'UABC', '16', '1');
INSERT INTO `universidades_emp` VALUES ('2', 'INSTITUTO TECNOLOGICO DE TIJUANA', 'ITT', '16', '18');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
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
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  `unidad` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ua` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `programaedu` int(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_username_unique` (`username`),
  KEY `fk_users_uacademica1_idx` (`uacademica`),
  KEY `fk_users_campus1_idx` (`campus`),
  KEY `fk_users_categorias1_idx` (`categoria`),
  KEY `fk_users_users1_idx` (`users_id`),
  KEY `fk_users_ciudad1_idx` (`ciudad`),
  KEY `fk_users_levels1_idx` (`level`),
  CONSTRAINT `fk_users_campus1` FOREIGN KEY (`campus`) REFERENCES `campus` (`campus`),
  CONSTRAINT `fk_users_categorias1` FOREIGN KEY (`categoria`) REFERENCES `categorias` (`categoria`),
  CONSTRAINT `fk_users_ciudad1` FOREIGN KEY (`ciudad`) REFERENCES `ciudad` (`ciudad`),
  CONSTRAINT `fk_users_levels1` FOREIGN KEY (`level`) REFERENCES `levels` (`level`),
  CONSTRAINT `fk_users_uacademica1` FOREIGN KEY (`uacademica`) REFERENCES `uacademica` (`uacademica`),
  CONSTRAINT `fk_users_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'Ivan', 'Duarte', '', 'wolfogan@gmail.com', 'Real de Calacoaya 7810-3B', '6450706', '1', '1', 'LoganX', '$2y$10$k8fT0GW/Obx8KgZU4hVufOt/stcuq3Y9Z8/9StZEMuLWOCmjfK1hO', '1', '2014-04-19 19:30:58', '2014-04-19 19:30:58', '', 'M', null, '1985-12-01', '2014-12-02', 'iavila85@uabc.edu.mx', '16', 'CALLE SERRADILLA', '500', 'A', 'MONTGOMERY', '22310', '664-9740000', '664-9740000', '101', '1', 'ENSENADA', 'FCA', '1');
INSERT INTO `users` VALUES ('9', 'Cynthia', 'Duarte', '', 'zyntya@hotmail.com', 'Col. Nueva Tijuana', '6233987', '1', '1', 'Tikita', '$2y$10$9qAw9XKA/BtqYRg5WS087.3WjqG.eH0P8.JiLsY7BF4nBAZAPJ752', '2', '2014-04-19 19:30:58', '2014-05-14 22:29:32', 'E4uGco0FtNqNTuFFvxq4mSIrfA2qWORYIkt7KDU3SCMzLG90S3AlIhNIIUY8', 'F', null, '1990-12-02', '2014-12-31', 'luz.lugo@uabc.edu.mx', '16', 'DE LOS LAURELES', '600', '1', 'EL CIRCULO', '22450', '664-1236789', '664\'1236789', '101', '1', 'VALLE DE LA TRINIDAD', 'FD', '0');
INSERT INTO `users` VALUES ('10', 'Ra', 'Contreras', '', 'Raulito21@gmail.com', 'Calle 9 de julio #244', '52224799', '1', '1', 'ra21', '$2y$10$BCYlojviBdFVCG4jfpdcluYJWLW/2/gGIjDsgxPcKWRx09DpE1Oce', '2', '2014-04-19 19:31:10', '2014-04-19 19:31:10', '', 'M', null, '2000-12-17', '2014-12-31', 'raul.suchilt@uabc.edu.mx', '16', 'DE LOS REMEDIOS', '35', null, 'EL REMEDIO', '22345', '664-234677', '664-34589/', '104', '1', 'VALLE DE LA TRINIDAD', 'FD', '1');
INSERT INTO `users` VALUES ('11', 'Juanelon', 'Rosado de la colina', '', 'paquito@gmail.com', 'Real de patito 50', '6457896', '1', '1', 'paquito', '$2y$10$NFJnp7SweU./sBw/YqBuM.Fg1mHuVjngo2e55Z/p9w.JxpliC6QlC', '2', '2014-04-21 15:08:27', '2014-04-21 17:03:15', '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1', 'VALLE DE LA TRINIDAD', 'FD', '0');
INSERT INTO `users` VALUES ('17', 'unice', 'unice', '', 'unice@gmail.com', 'nose donde vive', '2147483647', '1', '1', 'uni', '$2y$10$T3ztXBdUMPxZGvOSyNk8wuSKCiX2gYu7WSLZ9ANkm5XVBda2Rm2Ye', '2', '2014-04-25 09:42:07', '2014-04-25 09:42:07', '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1', 'ENSENADA', 'FCA', '1');
INSERT INTO `users` VALUES ('18', 'EMMA SOFIA', 'CASTILLEJOS', 'CABALLERO', 'emma.castillejos@uabc.edu.mx', 'CICLÓN', '2147483647', '1', '1', 'emma', 'sofia', '1', '2014-12-08 00:00:00', '2014-12-08 00:00:00', '', 'F', 'CACE7210142V1', '1972-10-14', '2005-09-23', null, '16', 'CICLÓN', '758', null, 'PLAYAS DE TIJUANA', null, '664-686-5679 ', '664-188-92-21', '101', '1', '1', '1', '3');

-- ----------------------------
-- View structure for vw_carga
-- ----------------------------
DROP VIEW IF EXISTS `vw_carga`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `vw_carga` AS select max(`cr`.`programaedu`) AS `carrera`,max(`pre`.`descripcion`) AS `desc_carr`,max(`cr`.`semestre`) AS `semestre`,max(`cr`.`periodo`) AS `periodo`,max(`pe`.`descripcion`) AS `desc_periodo`,max(`cr`.`uaprendizaje`) AS `uaprendizaje`,max(`uap`.`descripcionmat`) AS `descripcionmat`,max(`uap`.`creditos`) AS `creditos`,max(`uap`.`HC`) AS `HC`,max(`pua`.`etapa`) AS `ETAPA`,max(`et`.`descripcion`) AS `desc_etapa`,max(`cr`.`grupo`) AS `grupo`,(select group_concat(`ds`.`uaprequisito` separator ',') from `detalleseriacion` `ds` where ((`ds`.`uaprendizaje` = `cr`.`uaprendizaje`) and (`ds`.`programaedu` = `gr`.`programaedu`))) AS `requisito`,(select group_concat(`turnos`.`descripcion` separator ',') from (`grupos` left join `turnos` on((`grupos`.`turno` = `turnos`.`turno`))) where (`grupos`.`grupo` = `cr`.`grupo`)) AS `tunros`,(select group_concat(`carga`.`grupo` separator ',') from `carga` where ((`carga`.`uaprendizaje` = `cr`.`uaprendizaje`) and (`carga`.`periodo` = `cr`.`periodo`) and (`carga`.`semestre` = `cr`.`semestre`))) AS `grupos` from ((((((((`carga` `cr` left join `uaprendizaje` `uap` on((`cr`.`uaprendizaje` = `uap`.`uaprendizaje`))) join `p_ua` `pua` on(((`pua`.`programaedu` = `cr`.`programaedu`) and (`pua`.`uaprendizaje` = `cr`.`uaprendizaje`)))) left join `grupos` `gr` on(((`gr`.`grupo` = `cr`.`grupo`) and (`gr`.`periodo` = `cr`.`periodo`) and (`gr`.`programaedu` = `cr`.`programaedu`)))) left join `programaedu` `pre` on((`pre`.`programaedu` = `pua`.`programaedu`))) left join `periodos` `pe` on(((`pe`.`periodo` = `cr`.`periodo`) and (`pe`.`periodo` = `pe`.`periodo`)))) left join `turnos` `tu` on((`tu`.`turno` = `gr`.`turno`))) left join `detalleseriacion` `ds` on(((`ds`.`uaprendizaje` = `cr`.`uaprendizaje`) and (`ds`.`programaedu` = `gr`.`programaedu`)))) left join `etapas` `et` on((`et`.`etapa` = `pua`.`etapa`))) group by `cr`.`periodo`,`cr`.`programaedu`,`cr`.`semestre`,`pua`.`uaprendizaje` ;
DROP TRIGGER IF EXISTS `bit_I_act_adicional_emp`;
DELIMITER ;;
CREATE TRIGGER `bit_I_act_adicional_emp` AFTER INSERT ON `act_adicional_emp` FOR EACH ROW BEGIN
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_act_adicional_emp`;
DELIMITER ;;
CREATE TRIGGER `bit_U_act_adicional_emp` AFTER UPDATE ON `act_adicional_emp` FOR EACH ROW BEGIN
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_D_act_adicional_emp`;
DELIMITER ;;
CREATE TRIGGER `bit_D_act_adicional_emp` AFTER DELETE ON `act_adicional_emp` FOR EACH ROW BEGIN
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_act_profesional_adic`;
DELIMITER ;;
CREATE TRIGGER `bit_I_act_profesional_adic` AFTER INSERT ON `act_profesional_adic` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_act_profesional_adic`;
DELIMITER ;;
CREATE TRIGGER `bit_U_act_profesional_adic` AFTER UPDATE ON `act_profesional_adic` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_D_act_profesional_adic`;
DELIMITER ;;
CREATE TRIGGER `bit_D_act_profesional_adic` AFTER DELETE ON `act_profesional_adic` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_act_profesional_emp`;
DELIMITER ;;
CREATE TRIGGER `bit_I_act_profesional_emp` AFTER INSERT ON `act_profesional_emp` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_act_profesional_emp`;
DELIMITER ;;
CREATE TRIGGER `bit_U_act_profesional_emp` AFTER UPDATE ON `act_profesional_emp` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_D_act_profesional_emp`;
DELIMITER ;;
CREATE TRIGGER `bit_D_act_profesional_emp` AFTER DELETE ON `act_profesional_emp` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_campus`;
DELIMITER ;;
CREATE TRIGGER `bit_I_campus` AFTER INSERT ON `campus` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_campus`;
DELIMITER ;;
CREATE TRIGGER `bit_U_campus` AFTER UPDATE ON `campus` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_D_campus`;
DELIMITER ;;
CREATE TRIGGER `bit_D_campus` AFTER DELETE ON `campus` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_caracter`;
DELIMITER ;;
CREATE TRIGGER `bit_I_caracter` AFTER INSERT ON `caracter` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_caracter`;
DELIMITER ;;
CREATE TRIGGER `bit_U_caracter` AFTER UPDATE ON `caracter` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_D_caracter`;
DELIMITER ;;
CREATE TRIGGER `bit_D_caracter` AFTER DELETE ON `caracter` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_caracteristica_cur`;
DELIMITER ;;
CREATE TRIGGER `bit_I_caracteristica_cur` AFTER INSERT ON `caracteristica_cur` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_caracteristica_cur`;
DELIMITER ;;
CREATE TRIGGER `bit_U_caracteristica_cur` AFTER UPDATE ON `caracteristica_cur` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_D_caracteristica_cur`;
DELIMITER ;;
CREATE TRIGGER `bit_D_caracteristica_cur` AFTER DELETE ON `caracteristica_cur` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_carga`;
DELIMITER ;;
CREATE TRIGGER `bit_I_carga` AFTER INSERT ON `carga` FOR EACH ROW BEGIN
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_carga`;
DELIMITER ;;
CREATE TRIGGER `bit_U_carga` AFTER UPDATE ON `carga` FOR EACH ROW BEGIN
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_D_carga`;
DELIMITER ;;
CREATE TRIGGER `bit_D_carga` AFTER DELETE ON `carga` FOR EACH ROW BEGIN
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_carreras_emp`;
DELIMITER ;;
CREATE TRIGGER `bit_I_carreras_emp` AFTER INSERT ON `carreras_emp` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_carreras_emp`;
DELIMITER ;;
CREATE TRIGGER `bit_U_carreras_emp` AFTER UPDATE ON `carreras_emp` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_D_carreras_emp`;
DELIMITER ;;
CREATE TRIGGER `bit_D_carreras_emp` AFTER DELETE ON `carreras_emp` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_categorias`;
DELIMITER ;;
CREATE TRIGGER `bit_I_categorias` AFTER INSERT ON `categorias` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_categorias`;
DELIMITER ;;
CREATE TRIGGER `bit_U_categorias` AFTER UPDATE ON `categorias` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_D_categorias`;
DELIMITER ;;
CREATE TRIGGER `bit_D_categorias` AFTER DELETE ON `categorias` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_ciudad`;
DELIMITER ;;
CREATE TRIGGER `bit_I_ciudad` AFTER INSERT ON `ciudad` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_ciudad`;
DELIMITER ;;
CREATE TRIGGER `bit_U_ciudad` AFTER UPDATE ON `ciudad` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_D_ciudad`;
DELIMITER ;;
CREATE TRIGGER `bit_D_ciudad` AFTER DELETE ON `ciudad` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_coordinaciona`;
DELIMITER ;;
CREATE TRIGGER `bit_I_coordinaciona` AFTER INSERT ON `coordinaciona` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_coordinaciona`;
DELIMITER ;;
CREATE TRIGGER `bit_U_coordinaciona` AFTER UPDATE ON `coordinaciona` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_D_coordinaciona`;
DELIMITER ;;
CREATE TRIGGER `bit_D_coordinaciona` AFTER DELETE ON `coordinaciona` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_detalleseriacion`;
DELIMITER ;;
CREATE TRIGGER `bit_I_detalleseriacion` AFTER INSERT ON `detalleseriacion` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_detalleseriacion`;
DELIMITER ;;
CREATE TRIGGER `bit_U_detalleseriacion` AFTER UPDATE ON `detalleseriacion` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_D_detalleseriacion`;
DELIMITER ;;
CREATE TRIGGER `bit_D_detalleseriacion` AFTER DELETE ON `detalleseriacion` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_dias`;
DELIMITER ;;
CREATE TRIGGER `bit_I_dias` AFTER INSERT ON `dias` FOR EACH ROW BEGIN -- -----------------------------------------------------
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_dias`;
DELIMITER ;;
CREATE TRIGGER `bit_U_dias` AFTER UPDATE ON `dias` FOR EACH ROW BEGIN -- -----------------------------------------------------
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_D_dias`;
DELIMITER ;;
CREATE TRIGGER `bit_D_dias` AFTER DELETE ON `dias` FOR EACH ROW BEGIN -- -----------------------------------------------------
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_disp_hrs_dias`;
DELIMITER ;;
CREATE TRIGGER `bit_I_disp_hrs_dias` AFTER INSERT ON `disp_hrs_dias` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_disp_hrs_dias`;
DELIMITER ;;
CREATE TRIGGER `bit_U_disp_hrs_dias` AFTER UPDATE ON `disp_hrs_dias` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_D_disp_hrs_dias`;
DELIMITER ;;
CREATE TRIGGER `bit_D_disp_hrs_dias` AFTER DELETE ON `disp_hrs_dias` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_disp_ua`;
DELIMITER ;;
CREATE TRIGGER `bit_I_disp_ua` AFTER INSERT ON `disp_ua` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_disp_ua`;
DELIMITER ;;
CREATE TRIGGER `bit_U_disp_ua` AFTER UPDATE ON `disp_ua` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_D_disp_ua`;
DELIMITER ;;
CREATE TRIGGER `bit_D_disp_ua` AFTER DELETE ON `disp_ua` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_doctos`;
DELIMITER ;;
CREATE TRIGGER `bit_I_doctos` AFTER INSERT ON `doctos` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_doctos`;
DELIMITER ;;
CREATE TRIGGER `bit_U_doctos` AFTER UPDATE ON `doctos` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_D_doctos`;
DELIMITER ;;
CREATE TRIGGER `bit_D_doctos` AFTER DELETE ON `doctos` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_documentos_emp`;
DELIMITER ;;
CREATE TRIGGER `bit_I_documentos_emp` AFTER INSERT ON `documentos_emp` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_documentos_emp`;
DELIMITER ;;
CREATE TRIGGER `bit_U_documentos_emp` AFTER UPDATE ON `documentos_emp` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_D_documentos_emp`;
DELIMITER ;;
CREATE TRIGGER `bit_D_documentos_emp` AFTER DELETE ON `documentos_emp` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_empresa_adic`;
DELIMITER ;;
CREATE TRIGGER `bit_I_empresa_adic` AFTER INSERT ON `empresa_adic` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_empresa_adic`;
DELIMITER ;;
CREATE TRIGGER `bit_U_empresa_adic` AFTER UPDATE ON `empresa_adic` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_D_empresa_adic`;
DELIMITER ;;
CREATE TRIGGER `bit_D_empresa_adic` AFTER DELETE ON `empresa_adic` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_esp_prog_edu`;
DELIMITER ;;
CREATE TRIGGER `bit_I_esp_prog_edu` AFTER INSERT ON `esp_prog_edu` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_esp_prog_edu`;
DELIMITER ;;
CREATE TRIGGER `bit_U_esp_prog_edu` AFTER UPDATE ON `esp_prog_edu` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_D_esp_prog_edu`;
DELIMITER ;;
CREATE TRIGGER `bit_D_esp_prog_edu` AFTER DELETE ON `esp_prog_edu` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_estado`;
DELIMITER ;;
CREATE TRIGGER `bit_I_estado` AFTER INSERT ON `estado` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_estado`;
DELIMITER ;;
CREATE TRIGGER `bit_U_estado` AFTER UPDATE ON `estado` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_D_estado`;
DELIMITER ;;
CREATE TRIGGER `bit_D_estado` AFTER DELETE ON `estado` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_etapas`;
DELIMITER ;;
CREATE TRIGGER `bit_I_etapas` AFTER INSERT ON `etapas` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_etapas`;
DELIMITER ;;
CREATE TRIGGER `bit_U_etapas` AFTER UPDATE ON `etapas` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_D_etapas`;
DELIMITER ;;
CREATE TRIGGER `bit_D_etapas` AFTER DELETE ON `etapas` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_grupos`;
DELIMITER ;;
CREATE TRIGGER `bit_I_grupos` AFTER INSERT ON `grupos` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_grupos`;
DELIMITER ;;
CREATE TRIGGER `bit_U_grupos` AFTER UPDATE ON `grupos` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_D_grupos`;
DELIMITER ;;
CREATE TRIGGER `bit_D_grupos` AFTER DELETE ON `grupos` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_horarios`;
DELIMITER ;;
CREATE TRIGGER `bit_I_horarios` AFTER INSERT ON `horarios` FOR EACH ROW BEGIN
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_horarios`;
DELIMITER ;;
CREATE TRIGGER `bit_U_horarios` AFTER UPDATE ON `horarios` FOR EACH ROW BEGIN
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_D_horarios`;
DELIMITER ;;
CREATE TRIGGER `bit_D_horarios` AFTER DELETE ON `horarios` FOR EACH ROW BEGIN
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_horas`;
DELIMITER ;;
CREATE TRIGGER `bit_I_horas` AFTER INSERT ON `horas` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_horas`;
DELIMITER ;;
CREATE TRIGGER `bit_U_horas` AFTER UPDATE ON `horas` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_D_horas`;
DELIMITER ;;
CREATE TRIGGER `bit_D_horas` AFTER DELETE ON `horas` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_levels`;
DELIMITER ;;
CREATE TRIGGER `bit_I_levels` AFTER INSERT ON `levels` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_levels`;
DELIMITER ;;
CREATE TRIGGER `bit_U_levels` AFTER UPDATE ON `levels` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_D_levels`;
DELIMITER ;;
CREATE TRIGGER `bit_D_levels` AFTER DELETE ON `levels` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_nvprograma`;
DELIMITER ;;
CREATE TRIGGER `bit_I_nvprograma` AFTER INSERT ON `nvprograma` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_nvprograma`;
DELIMITER ;;
CREATE TRIGGER `bit_U_nvprograma` AFTER UPDATE ON `nvprograma` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_D_nvprograma`;
DELIMITER ;;
CREATE TRIGGER `bit_D_nvprograma` AFTER DELETE ON `nvprograma` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_pais`;
DELIMITER ;;
CREATE TRIGGER `bit_I_pais` AFTER INSERT ON `pais` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_pais`;
DELIMITER ;;
CREATE TRIGGER `bit_U_pais` AFTER UPDATE ON `pais` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_D_pais`;
DELIMITER ;;
CREATE TRIGGER `bit_D_pais` AFTER DELETE ON `pais` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_periodos`;
DELIMITER ;;
CREATE TRIGGER `bit_I_periodos` AFTER INSERT ON `periodos` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_periodos`;
DELIMITER ;;
CREATE TRIGGER `bit_U_periodos` AFTER UPDATE ON `periodos` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_D_periodos`;
DELIMITER ;;
CREATE TRIGGER `bit_D_periodos` AFTER DELETE ON `periodos` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_periodo_prog_edu`;
DELIMITER ;;
CREATE TRIGGER `bit_I_periodo_prog_edu` AFTER INSERT ON `periodo_prog_edu` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_periodo_prog_edu`;
DELIMITER ;;
CREATE TRIGGER `bit_U_periodo_prog_edu` AFTER UPDATE ON `periodo_prog_edu` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_D_periodo_prog_edu`;
DELIMITER ;;
CREATE TRIGGER `bit_D_periodo_prog_edu` AFTER DELETE ON `periodo_prog_edu` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_planestudio`;
DELIMITER ;;
CREATE TRIGGER `bit_I_planestudio` AFTER INSERT ON `planestudio` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_planestudio`;
DELIMITER ;;
CREATE TRIGGER `bit_U_planestudio` AFTER UPDATE ON `planestudio` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_D_planestudio`;
DELIMITER ;;
CREATE TRIGGER `bit_D_planestudio` AFTER DELETE ON `planestudio` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_plan_programa`;
DELIMITER ;;
CREATE TRIGGER `bit_I_plan_programa` AFTER INSERT ON `plan_programa` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_plan_programa`;
DELIMITER ;;
CREATE TRIGGER `bit_U_plan_programa` AFTER UPDATE ON `plan_programa` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_D_plan_programa`;
DELIMITER ;;
CREATE TRIGGER `bit_D_plan_programa` AFTER DELETE ON `plan_programa` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_programaedu`;
DELIMITER ;;
CREATE TRIGGER `bit_I_programaedu` AFTER INSERT ON `programaedu` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_programaedu`;
DELIMITER ;;
CREATE TRIGGER `bit_U_programaedu` AFTER UPDATE ON `programaedu` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_D_programaedu`;
DELIMITER ;;
CREATE TRIGGER `bit_D_programaedu` AFTER DELETE ON `programaedu` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_puesto`;
DELIMITER ;;
CREATE TRIGGER `bit_I_puesto` AFTER INSERT ON `puesto` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_puesto`;
DELIMITER ;;
CREATE TRIGGER `bit_U_puesto` AFTER UPDATE ON `puesto` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_D_puesto`;
DELIMITER ;;
CREATE TRIGGER `bit_D_puesto` AFTER DELETE ON `puesto` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_puestosemp`;
DELIMITER ;;
CREATE TRIGGER `bit_I_puestosemp` AFTER INSERT ON `puestosemp` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_puestosemp`;
DELIMITER ;;
CREATE TRIGGER `bit_U_puestosemp` AFTER UPDATE ON `puestosemp` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_D_puestosemp`;
DELIMITER ;;
CREATE TRIGGER `bit_D_puestosemp` AFTER DELETE ON `puestosemp` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_p_ua`;
DELIMITER ;;
CREATE TRIGGER `bit_I_p_ua` AFTER INSERT ON `p_ua` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_p_ua`;
DELIMITER ;;
CREATE TRIGGER `bit_U_p_ua` AFTER UPDATE ON `p_ua` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_D_p_ua`;
DELIMITER ;;
CREATE TRIGGER `bit_D_p_ua` AFTER DELETE ON `p_ua` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_reqseriacion`;
DELIMITER ;;
CREATE TRIGGER `bit_I_reqseriacion` AFTER INSERT ON `reqseriacion` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_reqseriacion`;
DELIMITER ;;
CREATE TRIGGER `bit_U_reqseriacion` AFTER UPDATE ON `reqseriacion` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_D_reqseriacion`;
DELIMITER ;;
CREATE TRIGGER `bit_D_reqseriacion` AFTER DELETE ON `reqseriacion` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_status`;
DELIMITER ;;
CREATE TRIGGER `bit_I_status` AFTER INSERT ON `status` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_status`;
DELIMITER ;;
CREATE TRIGGER `bit_U_status` AFTER UPDATE ON `status` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_D_status`;
DELIMITER ;;
CREATE TRIGGER `bit_D_status` AFTER DELETE ON `status` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_status_horarios`;
DELIMITER ;;
CREATE TRIGGER `bit_I_status_horarios` AFTER INSERT ON `status_horarios` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_status_horarios`;
DELIMITER ;;
CREATE TRIGGER `bit_U_status_horarios` AFTER UPDATE ON `status_horarios` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_D_status_horarios`;
DELIMITER ;;
CREATE TRIGGER `bit_D_status_horarios` AFTER DELETE ON `status_horarios` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_status_procesos`;
DELIMITER ;;
CREATE TRIGGER `bit_I_status_procesos` AFTER INSERT ON `status_procesos` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_status_procesos`;
DELIMITER ;;
CREATE TRIGGER `bit_U_status_procesos` AFTER UPDATE ON `status_procesos` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_D_status_procesos`;
DELIMITER ;;
CREATE TRIGGER `bit_D_status_procesos` AFTER DELETE ON `status_procesos` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_tipo_curso_emp`;
DELIMITER ;;
CREATE TRIGGER `bit_I_tipo_curso_emp` AFTER INSERT ON `tipo_curso_emp` FOR EACH ROW BEGIN -- -----------------------------------------------------
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_tipo_curso_emp`;
DELIMITER ;;
CREATE TRIGGER `bit_U_tipo_curso_emp` AFTER UPDATE ON `tipo_curso_emp` FOR EACH ROW BEGIN -- -----------------------------------------------------
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_D_tipo_curso_emp`;
DELIMITER ;;
CREATE TRIGGER `bit_D_tipo_curso_emp` AFTER DELETE ON `tipo_curso_emp` FOR EACH ROW BEGIN -- -----------------------------------------------------
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_trabadicional_emp`;
DELIMITER ;;
CREATE TRIGGER `bit_I_trabadicional_emp` AFTER INSERT ON `trabadicional_emp` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_trabadicional_emp`;
DELIMITER ;;
CREATE TRIGGER `bit_U_trabadicional_emp` AFTER UPDATE ON `trabadicional_emp` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_D_trabadicional_emp`;
DELIMITER ;;
CREATE TRIGGER `bit_D_trabadicional_emp` AFTER DELETE ON `trabadicional_emp` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_turnos`;
DELIMITER ;;
CREATE TRIGGER `bit_I_turnos` AFTER INSERT ON `turnos` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_turnos`;
DELIMITER ;;
CREATE TRIGGER `bit_U_turnos` AFTER UPDATE ON `turnos` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_D_turnos`;
DELIMITER ;;
CREATE TRIGGER `bit_D_turnos` AFTER DELETE ON `turnos` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_uacademica`;
DELIMITER ;;
CREATE TRIGGER `bit_I_uacademica` AFTER INSERT ON `uacademica` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_uacademica`;
DELIMITER ;;
CREATE TRIGGER `bit_U_uacademica` AFTER UPDATE ON `uacademica` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_D_uacademica`;
DELIMITER ;;
CREATE TRIGGER `bit_D_uacademica` AFTER DELETE ON `uacademica` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_uaprendizaje`;
DELIMITER ;;
CREATE TRIGGER `bit_I_uaprendizaje` AFTER INSERT ON `uaprendizaje` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_uaprendizaje`;
DELIMITER ;;
CREATE TRIGGER `bit_U_uaprendizaje` AFTER UPDATE ON `uaprendizaje` FOR EACH ROW -- -----------------------------------------------------
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_D_uaprendizaje`;
DELIMITER ;;
CREATE TRIGGER `bit_D_uaprendizaje` AFTER DELETE ON `uaprendizaje` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_universidades_emp`;
DELIMITER ;;
CREATE TRIGGER `bit_I_universidades_emp` AFTER INSERT ON `universidades_emp` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_universidades_emp`;
DELIMITER ;;
CREATE TRIGGER `bit_U_universidades_emp` AFTER UPDATE ON `universidades_emp` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_D_universidades_emp`;
DELIMITER ;;
CREATE TRIGGER `bit_D_universidades_emp` AFTER DELETE ON `universidades_emp` FOR EACH ROW BEGIN 
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
;;
DELIMITER ;
