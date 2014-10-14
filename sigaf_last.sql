/*
Navicat MySQL Data Transfer

Source Server         : LOCAL
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : sigaf_last

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2014-10-14 13:40:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for act_adicional_emp
-- ----------------------------
DROP TABLE IF EXISTS `act_adicional_emp`;
CREATE TABLE `act_adicional_emp` (
  `id_act_adicionalemp` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Consecutivo',
  `empleado` int(11) NOT NULL COMMENT 'Codigo Docente',
  `caracteristica_cur` int(11) NOT NULL COMMENT 'Car curso (Cur,Cong,Tall)',
  `tipo_curso_emp` int(11) NOT NULL COMMENT 'Cod tipo cur (Rec,Imp,Interes)',
  `curso` int(11) NOT NULL COMMENT 'Código curso',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`id_act_adicionalemp`),
  UNIQUE KEY `id_act_adicionalemp_UNIQUE` (`id_act_adicionalemp`),
  KEY `fk_act_adicional_emp_caracteristica_cur1_idx` (`caracteristica_cur`),
  KEY `fk_act_adicional_emp_tipo_curso_emp1_idx` (`tipo_curso_emp`),
  KEY `fk_act_adicional_emp_act_profesional_adic1_idx` (`curso`),
  KEY `fk_act_adicional_emp_empleados1_idx` (`empleado`),
  KEY `fk_act_adicional_emp_users1_idx` (`users_id`),
  CONSTRAINT `fk_act_adicional_emp_act_profesional_adic1` FOREIGN KEY (`curso`) REFERENCES `act_profesional_adic` (`curso`) ON UPDATE NO ACTION,
  CONSTRAINT `fk_act_adicional_emp_caracteristica_cur1` FOREIGN KEY (`caracteristica_cur`) REFERENCES `caracteristica_cur` (`caracteristica_cur`) ON UPDATE NO ACTION,
  CONSTRAINT `fk_act_adicional_emp_empleados1` FOREIGN KEY (`empleado`) REFERENCES `empleados` (`empleado`) ON UPDATE NO ACTION,
  CONSTRAINT `fk_act_adicional_emp_tipo_curso_emp1` FOREIGN KEY (`tipo_curso_emp`) REFERENCES `tipo_curso_emp` (`tipo_curso_emp`) ON UPDATE NO ACTION,
  CONSTRAINT `fk_act_adicional_emp_users1` FOREIGN KEY (`users_id`) REFERENCES `users_delia` (`id`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of act_adicional_emp
-- ----------------------------

-- ----------------------------
-- Table structure for act_profesional_adic
-- ----------------------------
DROP TABLE IF EXISTS `act_profesional_adic`;
CREATE TABLE `act_profesional_adic` (
  `curso` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código curso,congreso,taller',
  `descripcion` varchar(45) NOT NULL COMMENT 'Descripcion curso,congreso,taller',
  `fecha` date NOT NULL COMMENT 'Fecha curso',
  `creditos` int(11) NOT NULL COMMENT 'Creditos',
  `horas` int(11) NOT NULL COMMENT 'Horas',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`curso`),
  KEY `fk_act_profesional_adic_users1_idx` (`users_id`),
  CONSTRAINT `fk_act_profesional_adic_users1` FOREIGN KEY (`users_id`) REFERENCES `users_delia` (`id`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of act_profesional_adic
-- ----------------------------

-- ----------------------------
-- Table structure for act_profesional_emp
-- ----------------------------
DROP TABLE IF EXISTS `act_profesional_emp`;
CREATE TABLE `act_profesional_emp` (
  `carrera` int(11) NOT NULL COMMENT 'Carrera adicional',
  `empleado` int(11) NOT NULL COMMENT 'empleado',
  `universidad` int(11) NOT NULL COMMENT 'Universidad carr adic',
  `nivel` int(11) NOT NULL COMMENT 'grado (Lic, post, tecn)',
  `cedula` int(11) DEFAULT NULL COMMENT 'No cedula',
  `fec_tit` date DEFAULT NULL COMMENT 'Fecha Tit',
  `obtuvo_grado` int(11) NOT NULL COMMENT '1=SI, 2=NO',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`carrera`,`empleado`),
  KEY `fk_carreras_emp_has_empleados_empleados1_idx` (`empleado`),
  KEY `fk_carreras_emp_has_empleados_carreras_emp1_idx` (`carrera`),
  KEY `fk_carr_emp_universidades_emp1_idx` (`universidad`),
  KEY `fk_act_profesional_emp_nvprograma1_idx` (`nivel`),
  KEY `fk_act_profesional_emp_users1_idx` (`users_id`),
  CONSTRAINT `fk_act_profesional_emp_nvprograma1` FOREIGN KEY (`nivel`) REFERENCES `nvprograma` (`nivel`),
  CONSTRAINT `fk_act_profesional_emp_users1` FOREIGN KEY (`users_id`) REFERENCES `users_delia` (`id`) ON UPDATE NO ACTION,
  CONSTRAINT `fk_carreras_emp_has_empleados_carreras_emp1` FOREIGN KEY (`carrera`) REFERENCES `carreras_emp` (`carrera`),
  CONSTRAINT `fk_carreras_emp_has_empleados_empleados1` FOREIGN KEY (`empleado`) REFERENCES `empleados` (`empleado`),
  CONSTRAINT `fk_carr_emp_universidades_emp1` FOREIGN KEY (`universidad`) REFERENCES `universidades_emp` (`universidad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of act_profesional_emp
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=1569 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of bitacora
-- ----------------------------
INSERT INTO `bitacora` VALUES ('1', 'pais', '1', 'I', '2014-10-03 00:00:00', '1|AFGANISTAN', null);
INSERT INTO `bitacora` VALUES ('2', 'pais', '1', 'I', '2014-10-03 00:00:00', '2|ALBANIA', null);
INSERT INTO `bitacora` VALUES ('3', 'pais', '1', 'I', '2014-10-03 00:00:00', '3|ALEMANIA', null);
INSERT INTO `bitacora` VALUES ('4', 'pais', '1', 'I', '2014-10-03 00:00:00', '4|ANDORRA', null);
INSERT INTO `bitacora` VALUES ('5', 'pais', '1', 'I', '2014-10-03 00:00:00', '5|ANGOLA', null);
INSERT INTO `bitacora` VALUES ('6', 'pais', '1', 'I', '2014-10-03 00:00:00', '6|ANGUILLA', null);
INSERT INTO `bitacora` VALUES ('7', 'pais', '1', 'I', '2014-10-03 00:00:00', '7|ANTIGUA Y BARBUDA', null);
INSERT INTO `bitacora` VALUES ('8', 'pais', '1', 'I', '2014-10-03 00:00:00', '8|ANTILLAS HOLANDESAS', null);
INSERT INTO `bitacora` VALUES ('9', 'pais', '1', 'I', '2014-10-03 00:00:00', '9|ARABIA SAUDI', null);
INSERT INTO `bitacora` VALUES ('10', 'pais', '1', 'I', '2014-10-03 00:00:00', '10|ARGELIA', null);
INSERT INTO `bitacora` VALUES ('11', 'pais', '1', 'I', '2014-10-03 00:00:00', '11|ARGENTINA', null);
INSERT INTO `bitacora` VALUES ('12', 'pais', '1', 'I', '2014-10-03 00:00:00', '12|ARMENIA', null);
INSERT INTO `bitacora` VALUES ('13', 'pais', '1', 'I', '2014-10-03 00:00:00', '13|ARUBA', null);
INSERT INTO `bitacora` VALUES ('14', 'pais', '1', 'I', '2014-10-03 00:00:00', '14|AUSTRALIA', null);
INSERT INTO `bitacora` VALUES ('15', 'pais', '1', 'I', '2014-10-03 00:00:00', '15|AUSTRIA', null);
INSERT INTO `bitacora` VALUES ('16', 'pais', '1', 'I', '2014-10-03 00:00:00', '16|AZERBAIYAN', null);
INSERT INTO `bitacora` VALUES ('17', 'pais', '1', 'I', '2014-10-03 00:00:00', '17|BAHAMAS', null);
INSERT INTO `bitacora` VALUES ('18', 'pais', '1', 'I', '2014-10-03 00:00:00', '18|BAHREIN', null);
INSERT INTO `bitacora` VALUES ('19', 'pais', '1', 'I', '2014-10-03 00:00:00', '19|BANGLADESH', null);
INSERT INTO `bitacora` VALUES ('20', 'pais', '1', 'I', '2014-10-03 00:00:00', '20|BARBADOS', null);
INSERT INTO `bitacora` VALUES ('21', 'pais', '1', 'I', '2014-10-03 00:00:00', '22|BELGICA', null);
INSERT INTO `bitacora` VALUES ('22', 'pais', '1', 'I', '2014-10-03 00:00:00', '23|BELICE', null);
INSERT INTO `bitacora` VALUES ('23', 'pais', '1', 'I', '2014-10-03 00:00:00', '25|BERMUDAS', null);
INSERT INTO `bitacora` VALUES ('24', 'pais', '1', 'I', '2014-10-03 00:00:00', '27|BOLIVIA', null);
INSERT INTO `bitacora` VALUES ('25', 'pais', '1', 'I', '2014-10-03 00:00:00', '28|BOSNIA Y HERZEGOVINA', null);
INSERT INTO `bitacora` VALUES ('26', 'pais', '1', 'I', '2014-10-03 00:00:00', '29|BOTSWANA', null);
INSERT INTO `bitacora` VALUES ('27', 'pais', '1', 'I', '2014-10-03 00:00:00', '30|BRASIL', null);
INSERT INTO `bitacora` VALUES ('28', 'pais', '1', 'I', '2014-10-03 00:00:00', '31|BRUNEI', null);
INSERT INTO `bitacora` VALUES ('29', 'pais', '1', 'I', '2014-10-03 00:00:00', '32|BULGARIA', null);
INSERT INTO `bitacora` VALUES ('30', 'pais', '1', 'I', '2014-10-03 00:00:00', '34|BURUNDI', null);
INSERT INTO `bitacora` VALUES ('31', 'pais', '1', 'I', '2014-10-03 00:00:00', '35|CABO VERDE', null);
INSERT INTO `bitacora` VALUES ('32', 'pais', '1', 'I', '2014-10-03 00:00:00', '36|CAMBOYA', null);
INSERT INTO `bitacora` VALUES ('33', 'pais', '1', 'I', '2014-10-03 00:00:00', '37|CAMERUN', null);
INSERT INTO `bitacora` VALUES ('34', 'pais', '1', 'I', '2014-10-03 00:00:00', '38|CANADA', null);
INSERT INTO `bitacora` VALUES ('35', 'pais', '1', 'I', '2014-10-03 00:00:00', '40|CHILE', null);
INSERT INTO `bitacora` VALUES ('36', 'pais', '1', 'I', '2014-10-03 00:00:00', '41|CHINA', null);
INSERT INTO `bitacora` VALUES ('37', 'pais', '1', 'I', '2014-10-03 00:00:00', '42|CHIPRE', null);
INSERT INTO `bitacora` VALUES ('38', 'pais', '1', 'I', '2014-10-03 00:00:00', '43|COLOMBIA', null);
INSERT INTO `bitacora` VALUES ('39', 'pais', '1', 'I', '2014-10-03 00:00:00', '45|CONGO', null);
INSERT INTO `bitacora` VALUES ('40', 'pais', '1', 'I', '2014-10-03 00:00:00', '46|COREA', null);
INSERT INTO `bitacora` VALUES ('41', 'pais', '1', 'I', '2014-10-03 00:00:00', '47|COREA DEL NORTE ', null);
INSERT INTO `bitacora` VALUES ('42', 'pais', '1', 'I', '2014-10-03 00:00:00', '48|COSTA DE MARFIL', null);
INSERT INTO `bitacora` VALUES ('43', 'pais', '1', 'I', '2014-10-03 00:00:00', '49|COSTA RICA', null);
INSERT INTO `bitacora` VALUES ('44', 'pais', '1', 'I', '2014-10-03 00:00:00', '50|CROACIA', null);
INSERT INTO `bitacora` VALUES ('45', 'pais', '1', 'I', '2014-10-03 00:00:00', '51|CUBA', null);
INSERT INTO `bitacora` VALUES ('46', 'pais', '1', 'I', '2014-10-03 00:00:00', '52|DINAMARCA', null);
INSERT INTO `bitacora` VALUES ('47', 'pais', '1', 'I', '2014-10-03 00:00:00', '54|DOMINICA', null);
INSERT INTO `bitacora` VALUES ('48', 'pais', '1', 'I', '2014-10-03 00:00:00', '55|ECUADOR', null);
INSERT INTO `bitacora` VALUES ('49', 'pais', '1', 'I', '2014-10-03 00:00:00', '56|EGIPTO', null);
INSERT INTO `bitacora` VALUES ('50', 'pais', '1', 'I', '2014-10-03 00:00:00', '57|EL SALVADOR', null);
INSERT INTO `bitacora` VALUES ('51', 'pais', '1', 'I', '2014-10-03 00:00:00', '58|EMIRATOS ARABES UNIDOS', null);
INSERT INTO `bitacora` VALUES ('52', 'pais', '1', 'I', '2014-10-03 00:00:00', '60|ESLOVENIA', null);
INSERT INTO `bitacora` VALUES ('53', 'pais', '1', 'I', '2014-10-03 00:00:00', '61|ESPAÂ¥A', null);
INSERT INTO `bitacora` VALUES ('54', 'pais', '1', 'I', '2014-10-03 00:00:00', '62|ESTADOS UNIDOS DE AMERICA', null);
INSERT INTO `bitacora` VALUES ('55', 'pais', '1', 'I', '2014-10-03 00:00:00', '63|ESTONIA', null);
INSERT INTO `bitacora` VALUES ('56', 'pais', '1', 'I', '2014-10-03 00:00:00', '64|ETIOPIA', null);
INSERT INTO `bitacora` VALUES ('57', 'pais', '1', 'I', '2014-10-03 00:00:00', '65|FIJI', null);
INSERT INTO `bitacora` VALUES ('58', 'pais', '1', 'I', '2014-10-03 00:00:00', '66|FILIPINAS', null);
INSERT INTO `bitacora` VALUES ('59', 'pais', '1', 'I', '2014-10-03 00:00:00', '67|FINLANDIA', null);
INSERT INTO `bitacora` VALUES ('60', 'pais', '1', 'I', '2014-10-03 00:00:00', '68|FRANCIA', null);
INSERT INTO `bitacora` VALUES ('61', 'pais', '1', 'I', '2014-10-03 00:00:00', '69|GABON', null);
INSERT INTO `bitacora` VALUES ('62', 'pais', '1', 'I', '2014-10-03 00:00:00', '70|GAMBIA', null);
INSERT INTO `bitacora` VALUES ('63', 'pais', '1', 'I', '2014-10-03 00:00:00', '71|GEORGIA', null);
INSERT INTO `bitacora` VALUES ('64', 'pais', '1', 'I', '2014-10-03 00:00:00', '72|GHANA', null);
INSERT INTO `bitacora` VALUES ('65', 'pais', '1', 'I', '2014-10-03 00:00:00', '73|GIBRALTAR', null);
INSERT INTO `bitacora` VALUES ('66', 'pais', '1', 'I', '2014-10-03 00:00:00', '74|GRANADA', null);
INSERT INTO `bitacora` VALUES ('67', 'pais', '1', 'I', '2014-10-03 00:00:00', '75|GRECIA', null);
INSERT INTO `bitacora` VALUES ('68', 'pais', '1', 'I', '2014-10-03 00:00:00', '76|GROENLANDIA', null);
INSERT INTO `bitacora` VALUES ('69', 'pais', '1', 'I', '2014-10-03 00:00:00', '78|GUAM', null);
INSERT INTO `bitacora` VALUES ('70', 'pais', '1', 'I', '2014-10-03 00:00:00', '79|GUATEMALA', null);
INSERT INTO `bitacora` VALUES ('71', 'pais', '1', 'I', '2014-10-03 00:00:00', '80|GUAYANA FRANCESA', null);
INSERT INTO `bitacora` VALUES ('72', 'pais', '1', 'I', '2014-10-03 00:00:00', '81|GUERNESEY', null);
INSERT INTO `bitacora` VALUES ('73', 'pais', '1', 'I', '2014-10-03 00:00:00', '82|GUINEA', null);
INSERT INTO `bitacora` VALUES ('74', 'pais', '1', 'I', '2014-10-03 00:00:00', '83|GUINEA ECUATORIAL', null);
INSERT INTO `bitacora` VALUES ('75', 'pais', '1', 'I', '2014-10-03 00:00:00', '84|GUINEA-BISSAU', null);
INSERT INTO `bitacora` VALUES ('76', 'pais', '1', 'I', '2014-10-03 00:00:00', '85|GUYANA', null);
INSERT INTO `bitacora` VALUES ('77', 'pais', '1', 'I', '2014-10-03 00:00:00', '86|HAITI', null);
INSERT INTO `bitacora` VALUES ('78', 'pais', '1', 'I', '2014-10-03 00:00:00', '87|HONDURAS', null);
INSERT INTO `bitacora` VALUES ('79', 'pais', '1', 'I', '2014-10-03 00:00:00', '88|HONG KONG', null);
INSERT INTO `bitacora` VALUES ('80', 'pais', '1', 'I', '2014-10-03 00:00:00', '89|HUNGRIA', null);
INSERT INTO `bitacora` VALUES ('81', 'pais', '1', 'I', '2014-10-03 00:00:00', '90|INDIA', null);
INSERT INTO `bitacora` VALUES ('82', 'pais', '1', 'I', '2014-10-03 00:00:00', '91|INDONESIA', null);
INSERT INTO `bitacora` VALUES ('83', 'pais', '1', 'I', '2014-10-03 00:00:00', '92|IRAN', null);
INSERT INTO `bitacora` VALUES ('84', 'pais', '1', 'I', '2014-10-03 00:00:00', '93|IRAQ', null);
INSERT INTO `bitacora` VALUES ('85', 'pais', '1', 'I', '2014-10-03 00:00:00', '94|IRLANDA', null);
INSERT INTO `bitacora` VALUES ('86', 'pais', '1', 'I', '2014-10-03 00:00:00', '95|ISLA DE MAN', null);
INSERT INTO `bitacora` VALUES ('87', 'pais', '1', 'I', '2014-10-03 00:00:00', '96|ISLA NORFOLK', null);
INSERT INTO `bitacora` VALUES ('88', 'pais', '1', 'I', '2014-10-03 00:00:00', '97|ISLANDIA', null);
INSERT INTO `bitacora` VALUES ('89', 'pais', '1', 'I', '2014-10-03 00:00:00', '98|ISLAS ALAND', null);
INSERT INTO `bitacora` VALUES ('90', 'pais', '1', 'I', '2014-10-03 00:00:00', '99|ISLAS CAIM?N', null);
INSERT INTO `bitacora` VALUES ('91', 'pais', '1', 'I', '2014-10-03 00:00:00', '100|ISLAS COOK', null);
INSERT INTO `bitacora` VALUES ('92', 'pais', '1', 'I', '2014-10-03 00:00:00', '101|ISLAS DEL CANAL', null);
INSERT INTO `bitacora` VALUES ('93', 'pais', '1', 'I', '2014-10-03 00:00:00', '102|ISLAS FEROE', null);
INSERT INTO `bitacora` VALUES ('94', 'pais', '1', 'I', '2014-10-03 00:00:00', '103|ISLAS MALVINAS', null);
INSERT INTO `bitacora` VALUES ('95', 'pais', '1', 'I', '2014-10-03 00:00:00', '104|ISLAS MARIANAS DEL NORTE', null);
INSERT INTO `bitacora` VALUES ('96', 'pais', '1', 'I', '2014-10-03 00:00:00', '105|ISLAS MARSHALL', null);
INSERT INTO `bitacora` VALUES ('97', 'pais', '1', 'I', '2014-10-03 00:00:00', '106|ISLAS PITCAIRN', null);
INSERT INTO `bitacora` VALUES ('98', 'pais', '1', 'I', '2014-10-03 00:00:00', '107|ISLAS SALOMON', null);
INSERT INTO `bitacora` VALUES ('99', 'pais', '1', 'I', '2014-10-03 00:00:00', '108|ISLAS TURCAS Y CAICOS', null);
INSERT INTO `bitacora` VALUES ('100', 'pais', '1', 'I', '2014-10-03 00:00:00', '109|ISLAS VIRGENES BRITANICAS', null);
INSERT INTO `bitacora` VALUES ('101', 'pais', '1', 'I', '2014-10-03 00:00:00', '110|ISLAS V?RGENES DE LOS ESTADOS UNIDOS', null);
INSERT INTO `bitacora` VALUES ('102', 'pais', '1', 'I', '2014-10-03 00:00:00', '111|ISRAEL', null);
INSERT INTO `bitacora` VALUES ('103', 'pais', '1', 'I', '2014-10-03 00:00:00', '112|ITALIA', null);
INSERT INTO `bitacora` VALUES ('104', 'pais', '1', 'I', '2014-10-03 00:00:00', '113|JAMAICA', null);
INSERT INTO `bitacora` VALUES ('105', 'pais', '1', 'I', '2014-10-03 00:00:00', '114|JAPON', null);
INSERT INTO `bitacora` VALUES ('106', 'pais', '1', 'I', '2014-10-03 00:00:00', '115|JERSEY', null);
INSERT INTO `bitacora` VALUES ('107', 'pais', '1', 'I', '2014-10-03 00:00:00', '116|JORDANIA', null);
INSERT INTO `bitacora` VALUES ('108', 'pais', '1', 'I', '2014-10-03 00:00:00', '117|KAZAJSTAN', null);
INSERT INTO `bitacora` VALUES ('109', 'pais', '1', 'I', '2014-10-03 00:00:00', '118|KENIA', null);
INSERT INTO `bitacora` VALUES ('110', 'pais', '1', 'I', '2014-10-03 00:00:00', '119|KIRGUISTAN', null);
INSERT INTO `bitacora` VALUES ('111', 'pais', '1', 'I', '2014-10-03 00:00:00', '120|KIRIBATI', null);
INSERT INTO `bitacora` VALUES ('112', 'pais', '1', 'I', '2014-10-03 00:00:00', '121|KUWAIT', null);
INSERT INTO `bitacora` VALUES ('113', 'pais', '1', 'I', '2014-10-03 00:00:00', '122|LAOS', null);
INSERT INTO `bitacora` VALUES ('114', 'pais', '1', 'I', '2014-10-03 00:00:00', '123|LESOTHO', null);
INSERT INTO `bitacora` VALUES ('115', 'pais', '1', 'I', '2014-10-03 00:00:00', '124|LETONIA', null);
INSERT INTO `bitacora` VALUES ('116', 'pais', '1', 'I', '2014-10-03 00:00:00', '125|LIBANO', null);
INSERT INTO `bitacora` VALUES ('117', 'pais', '1', 'I', '2014-10-03 00:00:00', '126|LIBERIA', null);
INSERT INTO `bitacora` VALUES ('118', 'pais', '1', 'I', '2014-10-03 00:00:00', '127|LIBIA', null);
INSERT INTO `bitacora` VALUES ('119', 'pais', '1', 'I', '2014-10-03 00:00:00', '128|LIECHTENSTEIN', null);
INSERT INTO `bitacora` VALUES ('120', 'pais', '1', 'I', '2014-10-03 00:00:00', '129|LITUANIA', null);
INSERT INTO `bitacora` VALUES ('121', 'pais', '1', 'I', '2014-10-03 00:00:00', '130|LUXEMBURGO', null);
INSERT INTO `bitacora` VALUES ('122', 'pais', '1', 'I', '2014-10-03 00:00:00', '131|MACAO', null);
INSERT INTO `bitacora` VALUES ('123', 'pais', '1', 'I', '2014-10-03 00:00:00', '132|MACEDONIA ', null);
INSERT INTO `bitacora` VALUES ('124', 'pais', '1', 'I', '2014-10-03 00:00:00', '133|MADAGASCAR', null);
INSERT INTO `bitacora` VALUES ('125', 'pais', '1', 'I', '2014-10-03 00:00:00', '134|MALASIA', null);
INSERT INTO `bitacora` VALUES ('126', 'pais', '1', 'I', '2014-10-03 00:00:00', '135|MALAWI', null);
INSERT INTO `bitacora` VALUES ('127', 'pais', '1', 'I', '2014-10-03 00:00:00', '136|MALDIVAS', null);
INSERT INTO `bitacora` VALUES ('128', 'pais', '1', 'I', '2014-10-03 00:00:00', '137|MALI', null);
INSERT INTO `bitacora` VALUES ('129', 'pais', '1', 'I', '2014-10-03 00:00:00', '138|MALTA', null);
INSERT INTO `bitacora` VALUES ('130', 'pais', '1', 'I', '2014-10-03 00:00:00', '139|MARRUECOS', null);
INSERT INTO `bitacora` VALUES ('131', 'pais', '1', 'I', '2014-10-03 00:00:00', '140|MARTINICA', null);
INSERT INTO `bitacora` VALUES ('132', 'pais', '1', 'I', '2014-10-03 00:00:00', '141|MAURICIO', null);
INSERT INTO `bitacora` VALUES ('133', 'pais', '1', 'I', '2014-10-03 00:00:00', '142|MAURITANIA', null);
INSERT INTO `bitacora` VALUES ('134', 'pais', '1', 'I', '2014-10-03 00:00:00', '143|MAYOTTE', null);
INSERT INTO `bitacora` VALUES ('135', 'pais', '1', 'I', '2014-10-03 00:00:00', '144|MEXICO', null);
INSERT INTO `bitacora` VALUES ('136', 'pais', '1', 'I', '2014-10-03 00:00:00', '145|MICRONESIA', null);
INSERT INTO `bitacora` VALUES ('137', 'pais', '1', 'I', '2014-10-03 00:00:00', '146|MOLDAVIA', null);
INSERT INTO `bitacora` VALUES ('138', 'pais', '1', 'I', '2014-10-03 00:00:00', '147|MONACO', null);
INSERT INTO `bitacora` VALUES ('139', 'pais', '1', 'I', '2014-10-03 00:00:00', '148|MONGOLIA', null);
INSERT INTO `bitacora` VALUES ('140', 'pais', '1', 'I', '2014-10-03 00:00:00', '149|MONTENEGRO', null);
INSERT INTO `bitacora` VALUES ('141', 'pais', '1', 'I', '2014-10-03 00:00:00', '150|MONTSERRAT', null);
INSERT INTO `bitacora` VALUES ('142', 'pais', '1', 'I', '2014-10-03 00:00:00', '151|MOZAMBIQUE', null);
INSERT INTO `bitacora` VALUES ('143', 'pais', '1', 'I', '2014-10-03 00:00:00', '152|MYANMAR', null);
INSERT INTO `bitacora` VALUES ('144', 'pais', '1', 'I', '2014-10-03 00:00:00', '153|NAMIBIA', null);
INSERT INTO `bitacora` VALUES ('145', 'pais', '1', 'I', '2014-10-03 00:00:00', '154|NAURU', null);
INSERT INTO `bitacora` VALUES ('146', 'pais', '1', 'I', '2014-10-03 00:00:00', '155|NEPAL', null);
INSERT INTO `bitacora` VALUES ('147', 'pais', '1', 'I', '2014-10-03 00:00:00', '156|NICARAGUA', null);
INSERT INTO `bitacora` VALUES ('148', 'pais', '1', 'I', '2014-10-03 00:00:00', '157|NIGER', null);
INSERT INTO `bitacora` VALUES ('149', 'pais', '1', 'I', '2014-10-03 00:00:00', '158|NIGERIA', null);
INSERT INTO `bitacora` VALUES ('150', 'pais', '1', 'I', '2014-10-03 00:00:00', '159|NIUE', null);
INSERT INTO `bitacora` VALUES ('151', 'pais', '1', 'I', '2014-10-03 00:00:00', '160|NORUEGA', null);
INSERT INTO `bitacora` VALUES ('152', 'pais', '1', 'I', '2014-10-03 00:00:00', '161|NUEVA CALEDONIA', null);
INSERT INTO `bitacora` VALUES ('153', 'pais', '1', 'I', '2014-10-03 00:00:00', '162|NUEVA ZELANDA', null);
INSERT INTO `bitacora` VALUES ('154', 'pais', '1', 'I', '2014-10-03 00:00:00', '163|OMAN', null);
INSERT INTO `bitacora` VALUES ('155', 'pais', '1', 'I', '2014-10-03 00:00:00', '164|PAISES BAJOS', null);
INSERT INTO `bitacora` VALUES ('156', 'pais', '1', 'I', '2014-10-03 00:00:00', '165|PAKISTAN', null);
INSERT INTO `bitacora` VALUES ('157', 'pais', '1', 'I', '2014-10-03 00:00:00', '166|PALAOS', null);
INSERT INTO `bitacora` VALUES ('158', 'pais', '1', 'I', '2014-10-03 00:00:00', '167|PALESTINA', null);
INSERT INTO `bitacora` VALUES ('159', 'pais', '1', 'I', '2014-10-03 00:00:00', '168|PANAMA', null);
INSERT INTO `bitacora` VALUES ('160', 'pais', '1', 'I', '2014-10-03 00:00:00', '169|PAPUA NUEVA GUINEA', null);
INSERT INTO `bitacora` VALUES ('161', 'pais', '1', 'I', '2014-10-03 00:00:00', '170|PARAGUAY', null);
INSERT INTO `bitacora` VALUES ('162', 'pais', '1', 'I', '2014-10-03 00:00:00', '171|PERU', null);
INSERT INTO `bitacora` VALUES ('163', 'pais', '1', 'I', '2014-10-03 00:00:00', '172|POLINESIA FRANCESA', null);
INSERT INTO `bitacora` VALUES ('164', 'pais', '1', 'I', '2014-10-03 00:00:00', '173|POLONIA', null);
INSERT INTO `bitacora` VALUES ('165', 'pais', '1', 'I', '2014-10-03 00:00:00', '174|PORTUGAL', null);
INSERT INTO `bitacora` VALUES ('166', 'pais', '1', 'I', '2014-10-03 00:00:00', '175|PUERTO RICO', null);
INSERT INTO `bitacora` VALUES ('167', 'pais', '1', 'I', '2014-10-03 00:00:00', '176|QATAR', null);
INSERT INTO `bitacora` VALUES ('168', 'pais', '1', 'I', '2014-10-03 00:00:00', '177|REINO UNIDO', null);
INSERT INTO `bitacora` VALUES ('169', 'pais', '1', 'I', '2014-10-03 00:00:00', '178|REP.DEMOCRATICA DEL CONGO', null);
INSERT INTO `bitacora` VALUES ('170', 'pais', '1', 'I', '2014-10-03 00:00:00', '179|REPUBLICA CENTROAFRICANA', null);
INSERT INTO `bitacora` VALUES ('171', 'pais', '1', 'I', '2014-10-03 00:00:00', '180|REPUBLICA CHECA', null);
INSERT INTO `bitacora` VALUES ('172', 'pais', '1', 'I', '2014-10-03 00:00:00', '181|REPUBLICA DOMINICANA', null);
INSERT INTO `bitacora` VALUES ('173', 'pais', '1', 'I', '2014-10-03 00:00:00', '182|REPUBLICA ESLOVACA', null);
INSERT INTO `bitacora` VALUES ('174', 'pais', '1', 'I', '2014-10-03 00:00:00', '183|REUNION', null);
INSERT INTO `bitacora` VALUES ('175', 'pais', '1', 'I', '2014-10-03 00:00:00', '184|RUANDA', null);
INSERT INTO `bitacora` VALUES ('176', 'pais', '1', 'I', '2014-10-03 00:00:00', '185|RUMANIA', null);
INSERT INTO `bitacora` VALUES ('177', 'pais', '1', 'I', '2014-10-03 00:00:00', '186|RUSIA', null);
INSERT INTO `bitacora` VALUES ('178', 'pais', '1', 'I', '2014-10-03 00:00:00', '187|SAHARA OCCIDENTAL', null);
INSERT INTO `bitacora` VALUES ('179', 'pais', '1', 'I', '2014-10-03 00:00:00', '188|SAMOA', null);
INSERT INTO `bitacora` VALUES ('180', 'pais', '1', 'I', '2014-10-03 00:00:00', '189|SAMOA AMERICANA', null);
INSERT INTO `bitacora` VALUES ('181', 'pais', '1', 'I', '2014-10-03 00:00:00', '190|SAN BARTOLOME', null);
INSERT INTO `bitacora` VALUES ('182', 'pais', '1', 'I', '2014-10-03 00:00:00', '191|SAN CRISTOBAL Y NIEVES', null);
INSERT INTO `bitacora` VALUES ('183', 'pais', '1', 'I', '2014-10-03 00:00:00', '192|SAN MARINO', null);
INSERT INTO `bitacora` VALUES ('184', 'pais', '1', 'I', '2014-10-03 00:00:00', '193|SAN MARTIN (PARTE FRANCESA)', null);
INSERT INTO `bitacora` VALUES ('185', 'pais', '1', 'I', '2014-10-03 00:00:00', '194|SAN PEDRO Y MIQUELON ', null);
INSERT INTO `bitacora` VALUES ('186', 'pais', '1', 'I', '2014-10-03 00:00:00', '195|SAN VICENTE Y LAS GRANADINAS', null);
INSERT INTO `bitacora` VALUES ('187', 'pais', '1', 'I', '2014-10-03 00:00:00', '196|SANTA HELENA', null);
INSERT INTO `bitacora` VALUES ('188', 'pais', '1', 'I', '2014-10-03 00:00:00', '197|SANTA LUCIA', null);
INSERT INTO `bitacora` VALUES ('189', 'pais', '1', 'I', '2014-10-03 00:00:00', '198|SANTA SEDE', null);
INSERT INTO `bitacora` VALUES ('190', 'pais', '1', 'I', '2014-10-03 00:00:00', '199|SANTO TOME Y PRINCIPE', null);
INSERT INTO `bitacora` VALUES ('191', 'pais', '1', 'I', '2014-10-03 00:00:00', '200|SENEGAL', null);
INSERT INTO `bitacora` VALUES ('192', 'pais', '1', 'I', '2014-10-03 00:00:00', '201|SERBIA', null);
INSERT INTO `bitacora` VALUES ('193', 'pais', '1', 'I', '2014-10-03 00:00:00', '202|SEYCHELLES', null);
INSERT INTO `bitacora` VALUES ('194', 'pais', '1', 'I', '2014-10-03 00:00:00', '203|SIERRA LEONA', null);
INSERT INTO `bitacora` VALUES ('195', 'pais', '1', 'I', '2014-10-03 00:00:00', '204|SINGAPUR', null);
INSERT INTO `bitacora` VALUES ('196', 'pais', '1', 'I', '2014-10-03 00:00:00', '205|SIRIA', null);
INSERT INTO `bitacora` VALUES ('197', 'pais', '1', 'I', '2014-10-03 00:00:00', '206|SOMALIA', null);
INSERT INTO `bitacora` VALUES ('198', 'pais', '1', 'I', '2014-10-03 00:00:00', '207|SRI LANKA', null);
INSERT INTO `bitacora` VALUES ('199', 'pais', '1', 'I', '2014-10-03 00:00:00', '208|SUDAFRICA', null);
INSERT INTO `bitacora` VALUES ('200', 'pais', '1', 'I', '2014-10-03 00:00:00', '209|SUDAN', null);
INSERT INTO `bitacora` VALUES ('201', 'pais', '1', 'I', '2014-10-03 00:00:00', '210|SUECIA', null);
INSERT INTO `bitacora` VALUES ('202', 'pais', '1', 'I', '2014-10-03 00:00:00', '211|SUIZA', null);
INSERT INTO `bitacora` VALUES ('203', 'pais', '1', 'I', '2014-10-03 00:00:00', '212|SURINAM', null);
INSERT INTO `bitacora` VALUES ('204', 'pais', '1', 'I', '2014-10-03 00:00:00', '213|SVALBARD Y JAN MAYEN', null);
INSERT INTO `bitacora` VALUES ('205', 'pais', '1', 'I', '2014-10-03 00:00:00', '214|SWAZILANDIA', null);
INSERT INTO `bitacora` VALUES ('206', 'pais', '1', 'I', '2014-10-03 00:00:00', '215|TADYIKISTAN', null);
INSERT INTO `bitacora` VALUES ('207', 'pais', '1', 'I', '2014-10-03 00:00:00', '216|TAILANDIA', null);
INSERT INTO `bitacora` VALUES ('208', 'pais', '1', 'I', '2014-10-03 00:00:00', '217|TANZANIA', null);
INSERT INTO `bitacora` VALUES ('209', 'pais', '1', 'I', '2014-10-03 00:00:00', '218|TIMOR ORIENTAL', null);
INSERT INTO `bitacora` VALUES ('210', 'pais', '1', 'I', '2014-10-03 00:00:00', '219|TOGO', null);
INSERT INTO `bitacora` VALUES ('211', 'pais', '1', 'I', '2014-10-03 00:00:00', '220|TOKELAU', null);
INSERT INTO `bitacora` VALUES ('212', 'pais', '1', 'I', '2014-10-03 00:00:00', '221|TONGA', null);
INSERT INTO `bitacora` VALUES ('213', 'pais', '1', 'I', '2014-10-03 00:00:00', '222|TRINIDAD Y TOBAGO', null);
INSERT INTO `bitacora` VALUES ('214', 'pais', '1', 'I', '2014-10-03 00:00:00', '223|TUNEZ', null);
INSERT INTO `bitacora` VALUES ('215', 'pais', '1', 'I', '2014-10-03 00:00:00', '224|TURKMENISTAN', null);
INSERT INTO `bitacora` VALUES ('216', 'pais', '1', 'I', '2014-10-03 00:00:00', '225|TURQUIA', null);
INSERT INTO `bitacora` VALUES ('217', 'pais', '1', 'I', '2014-10-03 00:00:00', '226|TUVALU', null);
INSERT INTO `bitacora` VALUES ('218', 'pais', '1', 'I', '2014-10-03 00:00:00', '227|UCRANIA', null);
INSERT INTO `bitacora` VALUES ('219', 'pais', '1', 'I', '2014-10-03 00:00:00', '228|UGANDA', null);
INSERT INTO `bitacora` VALUES ('220', 'pais', '1', 'I', '2014-10-03 00:00:00', '229|URUGUAY', null);
INSERT INTO `bitacora` VALUES ('221', 'pais', '1', 'I', '2014-10-03 00:00:00', '230|UZBEKISTAN', null);
INSERT INTO `bitacora` VALUES ('222', 'pais', '1', 'I', '2014-10-03 00:00:00', '231|VANUATU', null);
INSERT INTO `bitacora` VALUES ('223', 'pais', '1', 'I', '2014-10-03 00:00:00', '232|VENEZUELA', null);
INSERT INTO `bitacora` VALUES ('224', 'pais', '1', 'I', '2014-10-03 00:00:00', '233|VIETNAM', null);
INSERT INTO `bitacora` VALUES ('225', 'pais', '1', 'I', '2014-10-03 00:00:00', '234|WALLIS Y FORTUNA', null);
INSERT INTO `bitacora` VALUES ('226', 'pais', '1', 'I', '2014-10-03 00:00:00', '235|YEMEN', null);
INSERT INTO `bitacora` VALUES ('227', 'pais', '1', 'I', '2014-10-03 00:00:00', '236|ZAMBIA', null);
INSERT INTO `bitacora` VALUES ('228', 'pais', '1', 'I', '2014-10-03 00:00:00', '237|ZIMBABWE', null);
INSERT INTO `bitacora` VALUES ('229', 'estado', '1', 'I', '2014-10-03 00:00:00', '1|AGUASCALIENTES|144', null);
INSERT INTO `bitacora` VALUES ('230', 'estado', '1', 'I', '2014-10-03 00:00:00', '2|BAJA CALIFORNIA|144', null);
INSERT INTO `bitacora` VALUES ('231', 'estado', '1', 'I', '2014-10-03 00:00:00', '3|BAJA CALIFORNIA SUR|144', null);
INSERT INTO `bitacora` VALUES ('232', 'estado', '1', 'I', '2014-10-03 00:00:00', '4|CAMPECHE|144', null);
INSERT INTO `bitacora` VALUES ('233', 'estado', '1', 'I', '2014-10-03 00:00:00', '5|COAHUILA DE ZARAGOZA|144', null);
INSERT INTO `bitacora` VALUES ('234', 'estado', '1', 'I', '2014-10-03 00:00:00', '6|COLIMA|144', null);
INSERT INTO `bitacora` VALUES ('235', 'estado', '1', 'I', '2014-10-03 00:00:00', '7|CHIAPAS|144', null);
INSERT INTO `bitacora` VALUES ('236', 'estado', '1', 'I', '2014-10-03 00:00:00', '8|CHIHUAHUA|144', null);
INSERT INTO `bitacora` VALUES ('237', 'estado', '1', 'I', '2014-10-03 00:00:00', '9|DISTRITO FEDERAL|144', null);
INSERT INTO `bitacora` VALUES ('238', 'estado', '1', 'I', '2014-10-03 00:00:00', '10|DURANGO|144', null);
INSERT INTO `bitacora` VALUES ('239', 'estado', '1', 'I', '2014-10-03 00:00:00', '11|GUANAJUATO|144', null);
INSERT INTO `bitacora` VALUES ('240', 'estado', '1', 'I', '2014-10-03 00:00:00', '12|GUERRERO|144', null);
INSERT INTO `bitacora` VALUES ('241', 'estado', '1', 'I', '2014-10-03 00:00:00', '13|HIDALGO|144', null);
INSERT INTO `bitacora` VALUES ('242', 'estado', '1', 'I', '2014-10-03 00:00:00', '14|JALISCO|144', null);
INSERT INTO `bitacora` VALUES ('243', 'estado', '1', 'I', '2014-10-03 00:00:00', '15|MEXICO|144', null);
INSERT INTO `bitacora` VALUES ('244', 'estado', '1', 'I', '2014-10-03 00:00:00', '16|MICHOACAN DE OCAMPO|144', null);
INSERT INTO `bitacora` VALUES ('245', 'estado', '1', 'I', '2014-10-03 00:00:00', '17|MORELOS|144', null);
INSERT INTO `bitacora` VALUES ('246', 'estado', '1', 'I', '2014-10-03 00:00:00', '18|NAYARIT|144', null);
INSERT INTO `bitacora` VALUES ('247', 'estado', '1', 'I', '2014-10-03 00:00:00', '19|NUEVO LEON|144', null);
INSERT INTO `bitacora` VALUES ('248', 'estado', '1', 'I', '2014-10-03 00:00:00', '20|OAXACA|144', null);
INSERT INTO `bitacora` VALUES ('249', 'estado', '1', 'I', '2014-10-03 00:00:00', '21|PUEBLA|144', null);
INSERT INTO `bitacora` VALUES ('250', 'estado', '1', 'I', '2014-10-03 00:00:00', '22|QUERETARO|144', null);
INSERT INTO `bitacora` VALUES ('251', 'estado', '1', 'I', '2014-10-03 00:00:00', '23|QUINTANA ROO|144', null);
INSERT INTO `bitacora` VALUES ('252', 'estado', '1', 'I', '2014-10-03 00:00:00', '24|SAN LUIS POTOSI|144', null);
INSERT INTO `bitacora` VALUES ('253', 'estado', '1', 'I', '2014-10-03 00:00:00', '25|SINALOA|144', null);
INSERT INTO `bitacora` VALUES ('254', 'estado', '1', 'I', '2014-10-03 00:00:00', '26|SONORA|144', null);
INSERT INTO `bitacora` VALUES ('255', 'estado', '1', 'I', '2014-10-03 00:00:00', '27|TABASCO|144', null);
INSERT INTO `bitacora` VALUES ('256', 'estado', '1', 'I', '2014-10-03 00:00:00', '28|TAMAULIPAS|144', null);
INSERT INTO `bitacora` VALUES ('257', 'estado', '1', 'I', '2014-10-03 00:00:00', '29|TLAXCALA|144', null);
INSERT INTO `bitacora` VALUES ('258', 'estado', '1', 'I', '2014-10-03 00:00:00', '30|VERACRUZ|144', null);
INSERT INTO `bitacora` VALUES ('259', 'estado', '1', 'I', '2014-10-03 00:00:00', '31|YUCATAN|144', null);
INSERT INTO `bitacora` VALUES ('260', 'estado', '1', 'I', '2014-10-03 00:00:00', '32|ZACATECAS|144', null);
INSERT INTO `bitacora` VALUES ('261', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '1|AGUASCALIENTES|1', null);
INSERT INTO `bitacora` VALUES ('262', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '2|ASIENTOS|1', null);
INSERT INTO `bitacora` VALUES ('263', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '3|CALVILLO|1', null);
INSERT INTO `bitacora` VALUES ('264', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '4|COSÃO|1', null);
INSERT INTO `bitacora` VALUES ('265', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '5|JESÃšS MARÃA|1', null);
INSERT INTO `bitacora` VALUES ('266', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '6|PABELLÃ“N DE ARTEAGA|1', null);
INSERT INTO `bitacora` VALUES ('267', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '7|RINCÃ“N DE ROMOS|1', null);
INSERT INTO `bitacora` VALUES ('268', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '8|SAN FRANCISCO DE LOS ROMO|1', null);
INSERT INTO `bitacora` VALUES ('269', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '9|TEPEZALÃ|1', null);
INSERT INTO `bitacora` VALUES ('270', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '10|ENSENADA|2', null);
INSERT INTO `bitacora` VALUES ('271', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '11|MEXICALI|2', null);
INSERT INTO `bitacora` VALUES ('272', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '12|PLAYAS DE ROSARITO|2', null);
INSERT INTO `bitacora` VALUES ('273', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '13|RODOLFO SÃNCHEZ T. (MANEADERO)|2', null);
INSERT INTO `bitacora` VALUES ('274', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '14|SAN FELIPE|2', null);
INSERT INTO `bitacora` VALUES ('275', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '15|TECATE|2', null);
INSERT INTO `bitacora` VALUES ('276', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '16|TIJUANA|2', null);
INSERT INTO `bitacora` VALUES ('277', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '17|CABO SAN LUCAS|3', null);
INSERT INTO `bitacora` VALUES ('278', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '18|CIUDAD CONSTITUCIÃ“N|3', null);
INSERT INTO `bitacora` VALUES ('279', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '19|GUERRERO NEGRO|3', null);
INSERT INTO `bitacora` VALUES ('280', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '20|HEROICA MULEGÃ‰|3', null);
INSERT INTO `bitacora` VALUES ('281', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '21|LA PAZ|3', null);
INSERT INTO `bitacora` VALUES ('282', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '22|LORETO|3', null);
INSERT INTO `bitacora` VALUES ('283', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '23|PUERTO ADOLFO LÃ“PEZ MATEOS|3', null);
INSERT INTO `bitacora` VALUES ('284', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '24|SAN IGNACIO|3', null);
INSERT INTO `bitacora` VALUES ('285', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '25|SAN JOSÃ‰ DEL CABO|3', null);
INSERT INTO `bitacora` VALUES ('286', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '26|TODOS SANTOS|3', null);
INSERT INTO `bitacora` VALUES ('287', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '27|VILLA ALBERTO ANDRÃ‰S ALVARADO ARÃMBURO|3', null);
INSERT INTO `bitacora` VALUES ('288', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '28|CALKINI|4', null);
INSERT INTO `bitacora` VALUES ('289', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '29|CANDELARIA|4', null);
INSERT INTO `bitacora` VALUES ('290', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '30|CHAMPOTÃ“N|4', null);
INSERT INTO `bitacora` VALUES ('291', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '31|CIUDAD DEL CARMEN|4', null);
INSERT INTO `bitacora` VALUES ('292', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '32|ESCÃRCEGA|4', null);
INSERT INTO `bitacora` VALUES ('293', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '33|HECELCHAKÃN|4', null);
INSERT INTO `bitacora` VALUES ('294', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '34|HOPELCHÃ‰N|4', null);
INSERT INTO `bitacora` VALUES ('295', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '35|POMUCH|4', null);
INSERT INTO `bitacora` VALUES ('296', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '36|SABANCUY|4', null);
INSERT INTO `bitacora` VALUES ('297', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '37|SAN FRANCISCO DE CAMPECHE|4', null);
INSERT INTO `bitacora` VALUES ('298', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '38|ALLENDE|5', null);
INSERT INTO `bitacora` VALUES ('299', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '39|ARTEAGA|5', null);
INSERT INTO `bitacora` VALUES ('300', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '40|CASTAÃ‘OS|5', null);
INSERT INTO `bitacora` VALUES ('301', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '41|CIUDAD ACUÃ‘A|5', null);
INSERT INTO `bitacora` VALUES ('302', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '42|CIUDAD MELCHOR MÃšZQUIZ|5', null);
INSERT INTO `bitacora` VALUES ('303', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '43|CUATRO CIÃ‰NEGAS DE CARRANZA|5', null);
INSERT INTO `bitacora` VALUES ('304', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '44|FRANCISCO I. MADERO (CHÃVEZ)|5', null);
INSERT INTO `bitacora` VALUES ('305', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '45|FRONTERA|5', null);
INSERT INTO `bitacora` VALUES ('306', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '46|MATAMOROS|5', null);
INSERT INTO `bitacora` VALUES ('307', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '47|MONCLOVA|5', null);
INSERT INTO `bitacora` VALUES ('308', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '48|MORELOS|5', null);
INSERT INTO `bitacora` VALUES ('309', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '49|NADADORES|5', null);
INSERT INTO `bitacora` VALUES ('310', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '50|NAVA|5', null);
INSERT INTO `bitacora` VALUES ('311', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '51|NUEVA ROSITA|5', null);
INSERT INTO `bitacora` VALUES ('312', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '52|PARRAS DE LA FUENTE|5', null);
INSERT INTO `bitacora` VALUES ('313', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '53|PIEDRAS NEGRAS|5', null);
INSERT INTO `bitacora` VALUES ('314', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '54|RAMOS ARIZPE|5', null);
INSERT INTO `bitacora` VALUES ('315', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '55|SABINAS|5', null);
INSERT INTO `bitacora` VALUES ('316', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '56|SALTILLO|5', null);
INSERT INTO `bitacora` VALUES ('317', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '57|SAN BUENAVENTURA|5', null);
INSERT INTO `bitacora` VALUES ('318', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '58|SAN PEDRO|5', null);
INSERT INTO `bitacora` VALUES ('319', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '59|TORREÃ“N|5', null);
INSERT INTO `bitacora` VALUES ('320', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '60|VIESCA|5', null);
INSERT INTO `bitacora` VALUES ('321', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '61|ZARAGOZA|5', null);
INSERT INTO `bitacora` VALUES ('322', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '62|CIUDAD DE ARMERÃA|6', null);
INSERT INTO `bitacora` VALUES ('323', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '63|CIUDAD DE VILLA DE ÃLVAREZ|6', null);
INSERT INTO `bitacora` VALUES ('324', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '64|CIUDAD DE VILLA DE ÃLVAREZ|6', null);
INSERT INTO `bitacora` VALUES ('325', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '65|COLIMA|6', null);
INSERT INTO `bitacora` VALUES ('326', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '66|MANZANILLO|6', null);
INSERT INTO `bitacora` VALUES ('327', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '67|TECOMAN|6', null);
INSERT INTO `bitacora` VALUES ('328', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '68|ACALA|7', null);
INSERT INTO `bitacora` VALUES ('329', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '69|ARRIAGA|7', null);
INSERT INTO `bitacora` VALUES ('330', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '70|CACAHOATÃN|7', null);
INSERT INTO `bitacora` VALUES ('331', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '71|CHIAPA DE CORZO|7', null);
INSERT INTO `bitacora` VALUES ('332', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '72|CINTALAPA DE FIGUEROA|7', null);
INSERT INTO `bitacora` VALUES ('333', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '73|COMITÃN DE DOMÃNGUEZ|7', null);
INSERT INTO `bitacora` VALUES ('334', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '74|HUIXTLA|7', null);
INSERT INTO `bitacora` VALUES ('335', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '75|JIQUIPILAS|7', null);
INSERT INTO `bitacora` VALUES ('336', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '76|LAS MARGARITAS|7', null);
INSERT INTO `bitacora` VALUES ('337', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '77|LAS ROSAS|7', null);
INSERT INTO `bitacora` VALUES ('338', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '78|MAPASTEPEC|7', null);
INSERT INTO `bitacora` VALUES ('339', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '79|MOTOZINTLA DE MENDOZA|7', null);
INSERT INTO `bitacora` VALUES ('340', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '80|OCOSINGO|7', null);
INSERT INTO `bitacora` VALUES ('341', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '81|OCOZOCOAUTLA DE ESPINOSA|7', null);
INSERT INTO `bitacora` VALUES ('342', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '82|PALENQUE|7', null);
INSERT INTO `bitacora` VALUES ('343', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '83|PICHUCALCO|7', null);
INSERT INTO `bitacora` VALUES ('344', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '84|PIJIJIAPAN|7', null);
INSERT INTO `bitacora` VALUES ('345', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '85|PUERTO MADERO (SAN BENITO)|7', null);
INSERT INTO `bitacora` VALUES ('346', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '86|REFORMA|7', null);
INSERT INTO `bitacora` VALUES ('347', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '87|SAN CRISTÃ“BAL DE LAS CASAS|7', null);
INSERT INTO `bitacora` VALUES ('348', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '88|TAPACHULA DE CÃ“RDOVA Y ORDÃ“Ã‘EZ|7', null);
INSERT INTO `bitacora` VALUES ('349', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '89|TONALÃ|7', null);
INSERT INTO `bitacora` VALUES ('350', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '90|TUXTLA GUTIÃ‰RREZ|7', null);
INSERT INTO `bitacora` VALUES ('351', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '91|VENUSTIANO CARRANZA|7', null);
INSERT INTO `bitacora` VALUES ('352', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '92|VILLAFLORES|7', null);
INSERT INTO `bitacora` VALUES ('353', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '93|BACHÃNIVA|8', null);
INSERT INTO `bitacora` VALUES ('354', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '94|CHIHUAHUA|8', null);
INSERT INTO `bitacora` VALUES ('355', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '95|COLONIA ANÃHUAC|8', null);
INSERT INTO `bitacora` VALUES ('356', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '96|CUAUHTÃ‰MOC|8', null);
INSERT INTO `bitacora` VALUES ('357', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '97|DELICIAS|8', null);
INSERT INTO `bitacora` VALUES ('358', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '98|HIDALGO DEL PARRAL|8', null);
INSERT INTO `bitacora` VALUES ('359', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '99|JOSÃ‰ MARIANO JIMÃ‰NEZ|8', null);
INSERT INTO `bitacora` VALUES ('360', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '100|JUAN ALDAMA|8', null);
INSERT INTO `bitacora` VALUES ('361', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '101|JUÃREZ|8', null);
INSERT INTO `bitacora` VALUES ('362', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '102|MADERA|8', null);
INSERT INTO `bitacora` VALUES ('363', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '103|MANUEL OJINAGA|8', null);
INSERT INTO `bitacora` VALUES ('364', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '104|NUEVO CASAS GRANDES|8', null);
INSERT INTO `bitacora` VALUES ('365', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '105|SANTA ROSALÃA DE CAMARGO|8', null);
INSERT INTO `bitacora` VALUES ('366', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '106|SAUCILLO|8', null);
INSERT INTO `bitacora` VALUES ('367', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '107|CIUDAD DE MÃ‰XICO|9', null);
INSERT INTO `bitacora` VALUES ('368', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '108|CANATLÃN|10', null);
INSERT INTO `bitacora` VALUES ('369', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '109|CIUDAD LERDO|10', null);
INSERT INTO `bitacora` VALUES ('370', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '110|EL SALTO|10', null);
INSERT INTO `bitacora` VALUES ('371', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '111|FRANCISCO I. MADERO|10', null);
INSERT INTO `bitacora` VALUES ('372', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '112|GÃ“MEZ PALACIO|10', null);
INSERT INTO `bitacora` VALUES ('373', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '113|NOMBRE DE DIOS|10', null);
INSERT INTO `bitacora` VALUES ('374', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '114|PEÃ‘Ã“N BLANCO|10', null);
INSERT INTO `bitacora` VALUES ('375', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '115|SAN JUAN DEL RÃO DEL CENTAURO DEL NORTE|10', null);
INSERT INTO `bitacora` VALUES ('376', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '116|SANTA MARÃA DEL ORO|10', null);
INSERT INTO `bitacora` VALUES ('377', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '117|SANTIAGO PAPASQUIARO|10', null);
INSERT INTO `bitacora` VALUES ('378', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '118|VICENTE GUERRERO|10', null);
INSERT INTO `bitacora` VALUES ('379', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '119|VICTORIA DE DURANGO|10', null);
INSERT INTO `bitacora` VALUES ('380', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '120|ABASOLO|11', null);
INSERT INTO `bitacora` VALUES ('381', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '121|ACÃMBARO|11', null);
INSERT INTO `bitacora` VALUES ('382', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '122|APASEO EL ALTO|11', null);
INSERT INTO `bitacora` VALUES ('383', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '123|APASEO EL GRANDE|11', null);
INSERT INTO `bitacora` VALUES ('384', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '124|CELAYA|11', null);
INSERT INTO `bitacora` VALUES ('385', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '125|CIUDAD MANUEL DOBLADO|11', null);
INSERT INTO `bitacora` VALUES ('386', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '126|COMONFORT|11', null);
INSERT INTO `bitacora` VALUES ('387', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '127|CORTAZAR|11', null);
INSERT INTO `bitacora` VALUES ('388', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '128|CUERÃMARO|11', null);
INSERT INTO `bitacora` VALUES ('389', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '129|DOCTOR MORA|11', null);
INSERT INTO `bitacora` VALUES ('390', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '130|DOLORES HIDALGO CUNA DE LA INDEPENDENCIA NACIONAL|11', null);
INSERT INTO `bitacora` VALUES ('391', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '131|EMPALME ESCOBEDO (ESCOBEDO)|11', null);
INSERT INTO `bitacora` VALUES ('392', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '132|GUANAJUATO|11', null);
INSERT INTO `bitacora` VALUES ('393', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '133|HUANÃMARO|11', null);
INSERT INTO `bitacora` VALUES ('394', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '134|IRAPUATO|11', null);
INSERT INTO `bitacora` VALUES ('395', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '135|JARAL DEL PROGRESO|11', null);
INSERT INTO `bitacora` VALUES ('396', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '136|JERÃ‰CUARO|11', null);
INSERT INTO `bitacora` VALUES ('397', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '137|LEÃ“N DE LOS ALDAMA|11', null);
INSERT INTO `bitacora` VALUES ('398', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '138|MARFIL|11', null);
INSERT INTO `bitacora` VALUES ('399', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '139|MOROLEÃ“N|11', null);
INSERT INTO `bitacora` VALUES ('400', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '140|PÃ‰NJAMO|11', null);
INSERT INTO `bitacora` VALUES ('401', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '141|PURÃSIMA DE BUSTOS|11', null);
INSERT INTO `bitacora` VALUES ('402', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '142|RINCÃ“N DE TAMAYO|11', null);
INSERT INTO `bitacora` VALUES ('403', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '143|ROMITA|11', null);
INSERT INTO `bitacora` VALUES ('404', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '144|SALAMANCA|11', null);
INSERT INTO `bitacora` VALUES ('405', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '145|SALVATIERRA|11', null);
INSERT INTO `bitacora` VALUES ('406', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '146|SAN DIEGO DE LA UNIÃ“N|11', null);
INSERT INTO `bitacora` VALUES ('407', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '147|SAN FRANCISCO DEL RINCÃ“N|11', null);
INSERT INTO `bitacora` VALUES ('408', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '148|SAN JOSÃ‰ ITURBIDE|11', null);
INSERT INTO `bitacora` VALUES ('409', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '149|SAN LUIS DE LA PAZ|11', null);
INSERT INTO `bitacora` VALUES ('410', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '150|SAN MIGUEL DE ALLENDE|11', null);
INSERT INTO `bitacora` VALUES ('411', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '151|SANTA CRUZ JUVENTINO ROSAS|11', null);
INSERT INTO `bitacora` VALUES ('412', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '152|SANTIAGO MARAVATÃO|11', null);
INSERT INTO `bitacora` VALUES ('413', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '153|SILAO|11', null);
INSERT INTO `bitacora` VALUES ('414', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '154|TARANDACUAO|11', null);
INSERT INTO `bitacora` VALUES ('415', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '155|URIANGATO|11', null);
INSERT INTO `bitacora` VALUES ('416', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '156|VALLE DE SANTIAGO|11', null);
INSERT INTO `bitacora` VALUES ('417', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '157|VILLAGRÃN|11', null);
INSERT INTO `bitacora` VALUES ('418', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '158|YURIRIA|11', null);
INSERT INTO `bitacora` VALUES ('419', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '159|ACAPULCO DE JUÃREZ|12', null);
INSERT INTO `bitacora` VALUES ('420', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '160|ARCELIA|12', null);
INSERT INTO `bitacora` VALUES ('421', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '161|ATOYAC DE ÃLVAREZ|12', null);
INSERT INTO `bitacora` VALUES ('422', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '162|AYUTLA DE LOS LIBRES|12', null);
INSERT INTO `bitacora` VALUES ('423', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '163|AZOYÃš|12', null);
INSERT INTO `bitacora` VALUES ('424', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '164|BUENAVISTA DE CUELLAR|12', null);
INSERT INTO `bitacora` VALUES ('425', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '165|CHILAPA DE ÃLVAREZ|12', null);
INSERT INTO `bitacora` VALUES ('426', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '166|CHILPANCINGO DE LOS BRAVO|12', null);
INSERT INTO `bitacora` VALUES ('427', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '167|CIUDAD ALTAMIRANO|12', null);
INSERT INTO `bitacora` VALUES ('428', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '168|CIUDAD APAXTLA DE CASTREJÃ“N|12', null);
INSERT INTO `bitacora` VALUES ('429', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '169|COPALA|12', null);
INSERT INTO `bitacora` VALUES ('430', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '170|COYUCA DE BENÃTEZ|12', null);
INSERT INTO `bitacora` VALUES ('431', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '171|COYUCA DE CATALÃN|12', null);
INSERT INTO `bitacora` VALUES ('432', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '172|CRUZ GRANDE|12', null);
INSERT INTO `bitacora` VALUES ('433', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '173|CUAJINICUILAPA|12', null);
INSERT INTO `bitacora` VALUES ('434', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '174|CUTZAMALA DE PINZÃ“N|12', null);
INSERT INTO `bitacora` VALUES ('435', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '175|HUAMUXTITLAN|12', null);
INSERT INTO `bitacora` VALUES ('436', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '176|HUITZUCO|12', null);
INSERT INTO `bitacora` VALUES ('437', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '177|IGUALA DE LA INDEPENDENCIA|12', null);
INSERT INTO `bitacora` VALUES ('438', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '178|LA UNIÃ“N|12', null);
INSERT INTO `bitacora` VALUES ('439', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '179|MARQUELIA|12', null);
INSERT INTO `bitacora` VALUES ('440', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '180|OCOTITO|12', null);
INSERT INTO `bitacora` VALUES ('441', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '181|OLINALÃ|12', null);
INSERT INTO `bitacora` VALUES ('442', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '182|PETATLÃN|12', null);
INSERT INTO `bitacora` VALUES ('443', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '183|SAN JERÃ“NIMO DE JUÃREZ|12', null);
INSERT INTO `bitacora` VALUES ('444', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '184|SAN LUIS ACATLÃN|12', null);
INSERT INTO `bitacora` VALUES ('445', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '185|SAN LUIS DE LA LOMA|12', null);
INSERT INTO `bitacora` VALUES ('446', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '186|SAN LUIS SAN PEDRO|12', null);
INSERT INTO `bitacora` VALUES ('447', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '187|SAN MARCOS|12', null);
INSERT INTO `bitacora` VALUES ('448', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '188|TAXCO DE ALARCÃ“N|12', null);
INSERT INTO `bitacora` VALUES ('449', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '189|TÃ‰CPAN DE GALEANA|12', null);
INSERT INTO `bitacora` VALUES ('450', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '190|TELOLOAPAN|12', null);
INSERT INTO `bitacora` VALUES ('451', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '191|TEPECOACUILCO DE TRUJANO|12', null);
INSERT INTO `bitacora` VALUES ('452', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '192|TIERRA COLORADA|12', null);
INSERT INTO `bitacora` VALUES ('453', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '193|TIXTLA DE GUERRERO|12', null);
INSERT INTO `bitacora` VALUES ('454', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '194|TLALIXTAQUILLA|12', null);
INSERT INTO `bitacora` VALUES ('455', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '195|TLAPA DE COMONFORT|12', null);
INSERT INTO `bitacora` VALUES ('456', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '196|TLAPEHUALA|12', null);
INSERT INTO `bitacora` VALUES ('457', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '197|ZIHUATANEJO|12', null);
INSERT INTO `bitacora` VALUES ('458', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '198|ZUMPANGO DEL RÃO|12', null);
INSERT INTO `bitacora` VALUES ('459', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '199|ACTOPAN|13', null);
INSERT INTO `bitacora` VALUES ('460', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '200|APAN|13', null);
INSERT INTO `bitacora` VALUES ('461', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '201|CIUDAD DE FRAY BERNARDINO DE SAHAGÃšN|13', null);
INSERT INTO `bitacora` VALUES ('462', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '202|CRUZ AZUL|13', null);
INSERT INTO `bitacora` VALUES ('463', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '203|HUEJUTLA DE REYES|13', null);
INSERT INTO `bitacora` VALUES ('464', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '204|IXMIQUILPAN|13', null);
INSERT INTO `bitacora` VALUES ('465', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '205|PACHUCA DE SOTO|13', null);
INSERT INTO `bitacora` VALUES ('466', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '206|SANTIAGO TULANTEPEC|13', null);
INSERT INTO `bitacora` VALUES ('467', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '207|TEPEAPULCO|13', null);
INSERT INTO `bitacora` VALUES ('468', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '208|TEPEJI DEL RIO|13', null);
INSERT INTO `bitacora` VALUES ('469', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '209|TIZAYUCA|13', null);
INSERT INTO `bitacora` VALUES ('470', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '210|TLAXCOAPAN|13', null);
INSERT INTO `bitacora` VALUES ('471', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '211|TULA DE ALLENDE|13', null);
INSERT INTO `bitacora` VALUES ('472', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '212|TULANCINGO|13', null);
INSERT INTO `bitacora` VALUES ('473', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '213|ZIMAPAN|13', null);
INSERT INTO `bitacora` VALUES ('474', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '214|ACATLÃN DE JUÃREZ|14', null);
INSERT INTO `bitacora` VALUES ('475', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '215|AHUALULCO DE MERCADO|14', null);
INSERT INTO `bitacora` VALUES ('476', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '216|AJIJIC|14', null);
INSERT INTO `bitacora` VALUES ('477', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '217|AMECA|14', null);
INSERT INTO `bitacora` VALUES ('478', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '218|ARANDAS|14', null);
INSERT INTO `bitacora` VALUES ('479', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '219|ATOTONILCO EL ALTO|14', null);
INSERT INTO `bitacora` VALUES ('480', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '220|AUTLÃN DE NAVARRO|14', null);
INSERT INTO `bitacora` VALUES ('481', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '221|CHAPALA|14', null);
INSERT INTO `bitacora` VALUES ('482', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '222|CIHUATLÃN|14', null);
INSERT INTO `bitacora` VALUES ('483', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '223|CIUDAD GUZMÃN|14', null);
INSERT INTO `bitacora` VALUES ('484', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '224|COCULA|14', null);
INSERT INTO `bitacora` VALUES ('485', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '225|COLOTLÃN|14', null);
INSERT INTO `bitacora` VALUES ('486', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '226|EL GRULLO|14', null);
INSERT INTO `bitacora` VALUES ('487', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '227|EL QUINCE (SAN JOSÃ‰ EL QUINCE)|14', null);
INSERT INTO `bitacora` VALUES ('488', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '228|ETZATLÃN|14', null);
INSERT INTO `bitacora` VALUES ('489', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '229|GUADALAJARA|14', null);
INSERT INTO `bitacora` VALUES ('490', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '230|HUEJUQUILLA EL ALTO|14', null);
INSERT INTO `bitacora` VALUES ('491', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '231|JALOSTOTITLÃN|14', null);
INSERT INTO `bitacora` VALUES ('492', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '232|JAMAY|14', null);
INSERT INTO `bitacora` VALUES ('493', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '233|JOCOTEPEC|14', null);
INSERT INTO `bitacora` VALUES ('494', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '234|LA BARCA|14', null);
INSERT INTO `bitacora` VALUES ('495', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '235|LA RESOLANA|14', null);
INSERT INTO `bitacora` VALUES ('496', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '236|LAGOS DE MORENO|14', null);
INSERT INTO `bitacora` VALUES ('497', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '237|LAS PINTITAS|14', null);
INSERT INTO `bitacora` VALUES ('498', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '238|MAGDALENA|14', null);
INSERT INTO `bitacora` VALUES ('499', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '239|OCOTLÃN|14', null);
INSERT INTO `bitacora` VALUES ('500', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '240|PONCITLÃN|14', null);
INSERT INTO `bitacora` VALUES ('501', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '241|PUERTO VALLARTA|14', null);
INSERT INTO `bitacora` VALUES ('502', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '242|SAN DIEGO DE ALEJANDRÃA|14', null);
INSERT INTO `bitacora` VALUES ('503', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '243|SAN IGNACIO CERRO GORDO|14', null);
INSERT INTO `bitacora` VALUES ('504', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '244|SAN JOSÃ‰ EL VERDE (EL VERDE)|14', null);
INSERT INTO `bitacora` VALUES ('505', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '245|SAN JUAN DE LOS LAGOS|14', null);
INSERT INTO `bitacora` VALUES ('506', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '246|SAN JULIÃN|14', null);
INSERT INTO `bitacora` VALUES ('507', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '247|SAN MIGUEL EL ALTO|14', null);
INSERT INTO `bitacora` VALUES ('508', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '248|SAYULA|14', null);
INSERT INTO `bitacora` VALUES ('509', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '249|TALA|14', null);
INSERT INTO `bitacora` VALUES ('510', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '250|TALPA DE ALLENDE|14', null);
INSERT INTO `bitacora` VALUES ('511', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '251|TAMAZULA DE GORDIANO|14', null);
INSERT INTO `bitacora` VALUES ('512', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '252|TECALITLÃN|14', null);
INSERT INTO `bitacora` VALUES ('513', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '253|TEOCALTICHE|14', null);
INSERT INTO `bitacora` VALUES ('514', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '254|TEPATITLÃN DE MORELOS|14', null);
INSERT INTO `bitacora` VALUES ('515', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '255|TEQUILA|14', null);
INSERT INTO `bitacora` VALUES ('516', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '256|TLAJOMULCO DE ZÃšÃ‘IGA|14', null);
INSERT INTO `bitacora` VALUES ('517', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '257|TLAQUEPAQUE|14', null);
INSERT INTO `bitacora` VALUES ('518', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '258|TONALÃ|14', null);
INSERT INTO `bitacora` VALUES ('519', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '259|TOTOTLÃN|14', null);
INSERT INTO `bitacora` VALUES ('520', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '260|TUXPAN|14', null);
INSERT INTO `bitacora` VALUES ('521', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '261|UNIÃ“N DE SAN ANTONIO|14', null);
INSERT INTO `bitacora` VALUES ('522', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '262|VALLE DE GUADALUPE|14', null);
INSERT INTO `bitacora` VALUES ('523', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '263|VILLA CORONA|14', null);
INSERT INTO `bitacora` VALUES ('524', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '264|VILLA HIDALGO|14', null);
INSERT INTO `bitacora` VALUES ('525', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '265|YAHUALICA DE GONZÃLEZ GALLO|14', null);
INSERT INTO `bitacora` VALUES ('526', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '266|ZACOALCO DE TORRES|14', null);
INSERT INTO `bitacora` VALUES ('527', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '267|ZAPOPAN|14', null);
INSERT INTO `bitacora` VALUES ('528', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '268|ZAPOTILTIC|14', null);
INSERT INTO `bitacora` VALUES ('529', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '269|ALMOLOYA DE JUÃREZ|15', null);
INSERT INTO `bitacora` VALUES ('530', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '270|AMATEPEC|15', null);
INSERT INTO `bitacora` VALUES ('531', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '271|CAPULHUAC|15', null);
INSERT INTO `bitacora` VALUES ('532', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '272|CHALCO DE DÃAZ COVARRUBIAS|15', null);
INSERT INTO `bitacora` VALUES ('533', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '273|CHICONCUAC|15', null);
INSERT INTO `bitacora` VALUES ('534', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '274|CHIMALHUACÃN|15', null);
INSERT INTO `bitacora` VALUES ('535', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '275|CIUDAD ADOLFO LÃ“PEZ MATEOS|15', null);
INSERT INTO `bitacora` VALUES ('536', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '276|CIUDAD NEZAHUALCOYOTL|15', null);
INSERT INTO `bitacora` VALUES ('537', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '277|COACALCO DE BERRIOZABAL|15', null);
INSERT INTO `bitacora` VALUES ('538', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '278|CUAUTITLÃN|15', null);
INSERT INTO `bitacora` VALUES ('539', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '279|CUAUTITLÃN IZCALLI|15', null);
INSERT INTO `bitacora` VALUES ('540', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '280|ECATEPEC DE MORELOS|15', null);
INSERT INTO `bitacora` VALUES ('541', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '281|HUIXQUILUCAN DE DEGOLLADO|15', null);
INSERT INTO `bitacora` VALUES ('542', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '282|IXTAPALUCA|15', null);
INSERT INTO `bitacora` VALUES ('543', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '283|JUCHITEPEC DE MARIANO RIVA PALACIO|15', null);
INSERT INTO `bitacora` VALUES ('544', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '284|LOS REYES ACAQUILPAN (LA PAZ)|15', null);
INSERT INTO `bitacora` VALUES ('545', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '285|MELCHOR OCAMPO|15', null);
INSERT INTO `bitacora` VALUES ('546', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '286|METEPEC|15', null);
INSERT INTO `bitacora` VALUES ('547', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '287|NAUCALPAN DE JUÃREZ|15', null);
INSERT INTO `bitacora` VALUES ('548', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '288|OCOYOACAC|15', null);
INSERT INTO `bitacora` VALUES ('549', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '289|SAN MATEO ATENCO|15', null);
INSERT INTO `bitacora` VALUES ('550', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '290|SAN VICENTE CHICOLOAPAN DE JUÃREZ|15', null);
INSERT INTO `bitacora` VALUES ('551', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '291|SANTA MARIA TULTEPEC|15', null);
INSERT INTO `bitacora` VALUES ('552', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '292|TECAMAC DE FELIPE VILLANUEVA|15', null);
INSERT INTO `bitacora` VALUES ('553', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '293|TEJUPILCO DE HIDALGO|15', null);
INSERT INTO `bitacora` VALUES ('554', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '294|TEPOTZOTLÃN|15', null);
INSERT INTO `bitacora` VALUES ('555', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '295|TEQUIXQUIAC|15', null);
INSERT INTO `bitacora` VALUES ('556', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '296|TEXCOCO DE MORA|15', null);
INSERT INTO `bitacora` VALUES ('557', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '297|TLALNEPANTLA DE BAZ|15', null);
INSERT INTO `bitacora` VALUES ('558', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '298|TOLUCA DE LERDO|15', null);
INSERT INTO `bitacora` VALUES ('559', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '299|TULTITLÃN DE MARIANO ESCOBEDO|15', null);
INSERT INTO `bitacora` VALUES ('560', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '300|VALLE DE CHALCO SOLIDARIDAD|15', null);
INSERT INTO `bitacora` VALUES ('561', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '301|VILLA NICOLÃS ROMERO|15', null);
INSERT INTO `bitacora` VALUES ('562', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '302|XONACATLÃN|15', null);
INSERT INTO `bitacora` VALUES ('563', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '303|ZUMPANGO|15', null);
INSERT INTO `bitacora` VALUES ('564', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '304|APATZINGÃN DE LA CONSTITUCIÃ“N|16', null);
INSERT INTO `bitacora` VALUES ('565', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '305|CIUDAD HIDALGO|16', null);
INSERT INTO `bitacora` VALUES ('566', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '306|CIUDAD LÃZARO CÃRDENAS|16', null);
INSERT INTO `bitacora` VALUES ('567', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '307|COTIJA DE LA PAZ|16', null);
INSERT INTO `bitacora` VALUES ('568', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '308|CUITZEO DEL PORVENIR|16', null);
INSERT INTO `bitacora` VALUES ('569', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '309|HEROICA ZITÃCUARO|16', null);
INSERT INTO `bitacora` VALUES ('570', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '310|HUETAMO DE NÃšÃ‘EZ|16', null);
INSERT INTO `bitacora` VALUES ('571', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '311|JACONA DE PLANCARTE|16', null);
INSERT INTO `bitacora` VALUES ('572', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '312|JIQUILPAN DE JUÃREZ|16', null);
INSERT INTO `bitacora` VALUES ('573', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '313|LA PIEDAD DE CABADAS|16', null);
INSERT INTO `bitacora` VALUES ('574', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '314|LAS GUACAMAYAS|16', null);
INSERT INTO `bitacora` VALUES ('575', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '315|LOS REYES DE SALGADO|16', null);
INSERT INTO `bitacora` VALUES ('576', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '316|MARAVATÃO DE OCAMPO|16', null);
INSERT INTO `bitacora` VALUES ('577', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '317|MORELIA|16', null);
INSERT INTO `bitacora` VALUES ('578', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '318|NUEVA ITALIA DE RUIZ|16', null);
INSERT INTO `bitacora` VALUES ('579', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '319|PARACHO DE VERDUZCO|16', null);
INSERT INTO `bitacora` VALUES ('580', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '320|PÃTZCUARO|16', null);
INSERT INTO `bitacora` VALUES ('581', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '321|PURUÃNDIRO|16', null);
INSERT INTO `bitacora` VALUES ('582', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '322|SAHUAYO DE MORELOS|16', null);
INSERT INTO `bitacora` VALUES ('583', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '323|TACÃMBARO DE CODALLOS|16', null);
INSERT INTO `bitacora` VALUES ('584', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '324|TANGANCÃCUARO DE ARISTA|16', null);
INSERT INTO `bitacora` VALUES ('585', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '325|TUXPAN|16', null);
INSERT INTO `bitacora` VALUES ('586', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '326|URUAPAN|16', null);
INSERT INTO `bitacora` VALUES ('587', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '327|YURÃ‰CUARO|16', null);
INSERT INTO `bitacora` VALUES ('588', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '328|ZACAPU|16', null);
INSERT INTO `bitacora` VALUES ('589', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '329|ZAMORA DE HIDALGO|16', null);
INSERT INTO `bitacora` VALUES ('590', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '330|ZINAPÃ‰CUARO DE FIGUEROA|16', null);
INSERT INTO `bitacora` VALUES ('591', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '331|CUAUTLA (CUAUTLA DE MORELOS)|17', null);
INSERT INTO `bitacora` VALUES ('592', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '332|CUERNAVACA|17', null);
INSERT INTO `bitacora` VALUES ('593', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '333|GALEANA|17', null);
INSERT INTO `bitacora` VALUES ('594', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '334|JOJUTLA|17', null);
INSERT INTO `bitacora` VALUES ('595', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '335|PUENTE DE IXTLA|17', null);
INSERT INTO `bitacora` VALUES ('596', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '336|SANTA ROSA TREINTA|17', null);
INSERT INTO `bitacora` VALUES ('597', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '337|TLAQUILTENANGO|17', null);
INSERT INTO `bitacora` VALUES ('598', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '338|ZACATEPEC DE HIDALGO|17', null);
INSERT INTO `bitacora` VALUES ('599', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '339|ACAPONETA|18', null);
INSERT INTO `bitacora` VALUES ('600', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '340|AHUACATLÃN|18', null);
INSERT INTO `bitacora` VALUES ('601', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '341|BUCERÃAS|18', null);
INSERT INTO `bitacora` VALUES ('602', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '342|COMPOSTELA|18', null);
INSERT INTO `bitacora` VALUES ('603', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '343|FRANCISCO I. MADERO (PUGA)|18', null);
INSERT INTO `bitacora` VALUES ('604', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '344|IXTLÃN DEL RÃO|18', null);
INSERT INTO `bitacora` VALUES ('605', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '345|JALA|18', null);
INSERT INTO `bitacora` VALUES ('606', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '346|LA PEÃ‘ITA DE JALTEMBA|18', null);
INSERT INTO `bitacora` VALUES ('607', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '347|LAS VARAS|18', null);
INSERT INTO `bitacora` VALUES ('608', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '348|RUIZ|18', null);
INSERT INTO `bitacora` VALUES ('609', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '349|SAN BLAS|18', null);
INSERT INTO `bitacora` VALUES ('610', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '350|SAN PEDRO LAGUNILLAS|18', null);
INSERT INTO `bitacora` VALUES ('611', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '351|SANTIAGO IXCUINTLA|18', null);
INSERT INTO `bitacora` VALUES ('612', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '352|TECUALA|18', null);
INSERT INTO `bitacora` VALUES ('613', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '353|TEPIC|18', null);
INSERT INTO `bitacora` VALUES ('614', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '354|TUXPAN|18', null);
INSERT INTO `bitacora` VALUES ('615', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '355|VILLA HIDALGO (EL NUEVO)|18', null);
INSERT INTO `bitacora` VALUES ('616', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '356|XALISCO|18', null);
INSERT INTO `bitacora` VALUES ('617', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '357|ANÃHUAC|19', null);
INSERT INTO `bitacora` VALUES ('618', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '358|CADEREYTA JIMÃ‰NEZ|19', null);
INSERT INTO `bitacora` VALUES ('619', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '359|CIÃ‰NEGA DE FLORES|19', null);
INSERT INTO `bitacora` VALUES ('620', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '360|CIUDAD APODACA|19', null);
INSERT INTO `bitacora` VALUES ('621', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '361|CIUDAD BENITO JUÃREZ|19', null);
INSERT INTO `bitacora` VALUES ('622', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '362|CIUDAD GENERAL ESCOBEDO|19', null);
INSERT INTO `bitacora` VALUES ('623', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '363|CIUDAD SABINAS HIDALGO|19', null);
INSERT INTO `bitacora` VALUES ('624', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '364|CIUDAD SANTA CATARINA|19', null);
INSERT INTO `bitacora` VALUES ('625', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '365|CIUDAD SANTA CATARINA|19', null);
INSERT INTO `bitacora` VALUES ('626', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '366|DOCTOR ARROYO|19', null);
INSERT INTO `bitacora` VALUES ('627', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '367|EL CERCADO|19', null);
INSERT INTO `bitacora` VALUES ('628', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '368|GARCÃA|19', null);
INSERT INTO `bitacora` VALUES ('629', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '369|GUADALUPE|19', null);
INSERT INTO `bitacora` VALUES ('630', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '370|HUALAHUISES|19', null);
INSERT INTO `bitacora` VALUES ('631', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '371|LINARES|19', null);
INSERT INTO `bitacora` VALUES ('632', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '372|MONTEMORELOS|19', null);
INSERT INTO `bitacora` VALUES ('633', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '373|MONTERREY|19', null);
INSERT INTO `bitacora` VALUES ('634', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '374|SAN NICOLÃS DE LOS GARZA|19', null);
INSERT INTO `bitacora` VALUES ('635', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '375|SAN PEDRO GARZA GARCÃA|19', null);
INSERT INTO `bitacora` VALUES ('636', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '376|SANTIAGO|19', null);
INSERT INTO `bitacora` VALUES ('637', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '377|ASUNCIÃ“N NOCHIXTLÃN|20', null);
INSERT INTO `bitacora` VALUES ('638', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '378|BAHIAS DE HUATULCO|20', null);
INSERT INTO `bitacora` VALUES ('639', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '379|CHAHUITES|20', null);
INSERT INTO `bitacora` VALUES ('640', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '380|CIUDAD IXTEPEC|20', null);
INSERT INTO `bitacora` VALUES ('641', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '381|COSOLAPA|20', null);
INSERT INTO `bitacora` VALUES ('642', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '382|CUILÃPAM DE GUERRERO|20', null);
INSERT INTO `bitacora` VALUES ('643', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '383|EL CAMARÃ“N|20', null);
INSERT INTO `bitacora` VALUES ('644', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '384|EL ROSARIO|20', null);
INSERT INTO `bitacora` VALUES ('645', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '385|HEROICA CIUDAD DE EJUTLA DE CRESPO|20', null);
INSERT INTO `bitacora` VALUES ('646', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '386|HEROICA CIUDAD DE HUAJUAPAN DE LEÃ“N|20', null);
INSERT INTO `bitacora` VALUES ('647', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '387|HEROICA CIUDAD DE TLAXIACO|20', null);
INSERT INTO `bitacora` VALUES ('648', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '388|JUCHITÃN (JUCHITÃN DE ZARAGOZA)|20', null);
INSERT INTO `bitacora` VALUES ('649', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '389|LAGUNAS|20', null);
INSERT INTO `bitacora` VALUES ('650', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '390|LOMA BONITA|20', null);
INSERT INTO `bitacora` VALUES ('651', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '391|MARISCALA DE JUÃREZ|20', null);
INSERT INTO `bitacora` VALUES ('652', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '392|MATÃAS ROMERO AVENDAÃ‘O|20', null);
INSERT INTO `bitacora` VALUES ('653', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '393|MIAHUATLÃN DE PORFIRIO DÃAZ|20', null);
INSERT INTO `bitacora` VALUES ('654', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '394|NATIVIDAD|20', null);
INSERT INTO `bitacora` VALUES ('655', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '395|OAXACA DE JUÃREZ|20', null);
INSERT INTO `bitacora` VALUES ('656', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '396|OCOTLÃN DE MORELOS|20', null);
INSERT INTO `bitacora` VALUES ('657', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '397|PUERTO ESCONDIDO|20', null);
INSERT INTO `bitacora` VALUES ('658', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '398|PUTLA VILLA DE GUERRERO|20', null);
INSERT INTO `bitacora` VALUES ('659', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '399|RÃO GRANDE O PIEDRA PARADA|20', null);
INSERT INTO `bitacora` VALUES ('660', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '400|SALINA CRUZ|20', null);
INSERT INTO `bitacora` VALUES ('661', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '401|SAN ANTONIO DE LA CAL|20', null);
INSERT INTO `bitacora` VALUES ('662', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '402|SAN BLAS ATEMPA|20', null);
INSERT INTO `bitacora` VALUES ('663', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '403|SAN FELIPE JALAPA DE DÃAZ|20', null);
INSERT INTO `bitacora` VALUES ('664', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '404|SAN FRANCISCO IXHUATÃN|20', null);
INSERT INTO `bitacora` VALUES ('665', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '405|SAN FRANCISCO TELIXTLAHUACA|20', null);
INSERT INTO `bitacora` VALUES ('666', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '406|SAN JUAN BAUTISTA CUICATLÃN|20', null);
INSERT INTO `bitacora` VALUES ('667', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '407|SAN JUAN BAUTISTA LO DE SOTO|20', null);
INSERT INTO `bitacora` VALUES ('668', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '408|SAN JUAN BAUTISTA TUXTEPEC|20', null);
INSERT INTO `bitacora` VALUES ('669', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '409|SAN JUAN BAUTISTA VALLE NACIONAL|20', null);
INSERT INTO `bitacora` VALUES ('670', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '410|SAN JUAN CACAHUATEPEC|20', null);
INSERT INTO `bitacora` VALUES ('671', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '411|SAN MIGUEL EL GRANDE|20', null);
INSERT INTO `bitacora` VALUES ('672', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '412|SAN PABLO HUITZO|20', null);
INSERT INTO `bitacora` VALUES ('673', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '413|SAN PABLO VILLA DE MITLA|20', null);
INSERT INTO `bitacora` VALUES ('674', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '414|SAN PEDRO MIXTEPEC -DTO. 22-|20', null);
INSERT INTO `bitacora` VALUES ('675', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '415|SAN PEDRO POCHUTLA|20', null);
INSERT INTO `bitacora` VALUES ('676', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '416|SAN PEDRO TAPANATEPEC|20', null);
INSERT INTO `bitacora` VALUES ('677', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '417|SAN PEDRO TOTOLAPA|20', null);
INSERT INTO `bitacora` VALUES ('678', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '418|SAN SEBASTIÃN TECOMAXTLAHUACA|20', null);
INSERT INTO `bitacora` VALUES ('679', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '419|SANTA CRUZ ITUNDUJIA|20', null);
INSERT INTO `bitacora` VALUES ('680', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '420|SANTA LUCIA DEL CAMINO|20', null);
INSERT INTO `bitacora` VALUES ('681', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '421|SANTA MARÃA HUATULCO|20', null);
INSERT INTO `bitacora` VALUES ('682', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '422|SANTIAGO JAMILTEPEC|20', null);
INSERT INTO `bitacora` VALUES ('683', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '423|SANTIAGO JUXTLAHUACA|20', null);
INSERT INTO `bitacora` VALUES ('684', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '424|SANTIAGO PINOTEPA NACIONAL|20', null);
INSERT INTO `bitacora` VALUES ('685', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '425|SANTIAGO SUCHILQUITONGO|20', null);
INSERT INTO `bitacora` VALUES ('686', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '426|SANTO DOMINGO TEHUANTEPEC|20', null);
INSERT INTO `bitacora` VALUES ('687', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '427|TEOTITLÃN DE FLORES MAGÃ“N|20', null);
INSERT INTO `bitacora` VALUES ('688', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '428|TLACOLULA DE MATAMOROS|20', null);
INSERT INTO `bitacora` VALUES ('689', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '429|UNIÃ“N HIDALGO|20', null);
INSERT INTO `bitacora` VALUES ('690', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '430|VICENTE CAMALOTE|20', null);
INSERT INTO `bitacora` VALUES ('691', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '431|VILLA DE TAMAZULÃPAM DEL PROGRESO|20', null);
INSERT INTO `bitacora` VALUES ('692', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '432|VILLA DE ZAACHILA|20', null);
INSERT INTO `bitacora` VALUES ('693', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '433|VILLA SOLA DE VEGA|20', null);
INSERT INTO `bitacora` VALUES ('694', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '434|ZIMATLÃN DE ÃLVAREZ|20', null);
INSERT INTO `bitacora` VALUES ('695', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '435|ACATLÃN DE OSORIO|21', null);
INSERT INTO `bitacora` VALUES ('696', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '436|AMOZOC|21', null);
INSERT INTO `bitacora` VALUES ('697', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '437|ATLIXCO|21', null);
INSERT INTO `bitacora` VALUES ('698', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '438|CIUDAD SERDÃN|21', null);
INSERT INTO `bitacora` VALUES ('699', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '439|CUAUTLANCINGO|21', null);
INSERT INTO `bitacora` VALUES ('700', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '440|HUAUCHINANGO|21', null);
INSERT INTO `bitacora` VALUES ('701', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '441|IZÃšCAR DE MATAMOROS|21', null);
INSERT INTO `bitacora` VALUES ('702', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '442|PUEBLA (HEROICA PUEBLA)|21', null);
INSERT INTO `bitacora` VALUES ('703', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '443|SAN ANDRÃ‰S CHOLULA|21', null);
INSERT INTO `bitacora` VALUES ('704', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '444|SAN MARTÃN TEXMELUCAN DE LABASTIDA|21', null);
INSERT INTO `bitacora` VALUES ('705', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '445|SAN PEDRO CHOLULA|21', null);
INSERT INTO `bitacora` VALUES ('706', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '446|TECAMACHALCO|21', null);
INSERT INTO `bitacora` VALUES ('707', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '447|TEHUACAN|21', null);
INSERT INTO `bitacora` VALUES ('708', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '448|TEPEACA|21', null);
INSERT INTO `bitacora` VALUES ('709', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '449|TEZIUTLAN|21', null);
INSERT INTO `bitacora` VALUES ('710', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '450|XICOTEPEC|21', null);
INSERT INTO `bitacora` VALUES ('711', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '451|ZACATLÃN|21', null);
INSERT INTO `bitacora` VALUES ('712', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '452|EL PUEBLITO|22', null);
INSERT INTO `bitacora` VALUES ('713', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '453|QUERÃ‰TARO|22', null);
INSERT INTO `bitacora` VALUES ('714', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '454|SAN JUAN DEL RIO|22', null);
INSERT INTO `bitacora` VALUES ('715', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '455|BACALAR|23', null);
INSERT INTO `bitacora` VALUES ('716', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '456|CANCÃšN|23', null);
INSERT INTO `bitacora` VALUES ('717', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '457|CHETUMAL|23', null);
INSERT INTO `bitacora` VALUES ('718', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '458|COZUMEL|23', null);
INSERT INTO `bitacora` VALUES ('719', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '459|FELIPE CARRILLO PUERTO|23', null);
INSERT INTO `bitacora` VALUES ('720', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '460|ISLA MUJERES|23', null);
INSERT INTO `bitacora` VALUES ('721', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '461|KANTUNILKÃN|23', null);
INSERT INTO `bitacora` VALUES ('722', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '462|PLAYA DEL CARMEN|23', null);
INSERT INTO `bitacora` VALUES ('723', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '463|CÃRDENAS|24', null);
INSERT INTO `bitacora` VALUES ('724', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '464|CEDRAL|24', null);
INSERT INTO `bitacora` VALUES ('725', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '465|CERRITOS|24', null);
INSERT INTO `bitacora` VALUES ('726', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '466|CHARCAS|24', null);
INSERT INTO `bitacora` VALUES ('727', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '467|CIUDAD DEL MAÃZ|24', null);
INSERT INTO `bitacora` VALUES ('728', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '468|CIUDAD VALLES|24', null);
INSERT INTO `bitacora` VALUES ('729', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '469|Ã‰BANO|24', null);
INSERT INTO `bitacora` VALUES ('730', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '470|EL NARANJO|24', null);
INSERT INTO `bitacora` VALUES ('731', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '471|FRACCIÃ“N EL REFUGIO|24', null);
INSERT INTO `bitacora` VALUES ('732', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '472|MATEHUALA|24', null);
INSERT INTO `bitacora` VALUES ('733', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '473|RIOVERDE|24', null);
INSERT INTO `bitacora` VALUES ('734', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '474|SALINAS DE HIDALGO|24', null);
INSERT INTO `bitacora` VALUES ('735', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '475|SAN LUIS POTOSÃ|24', null);
INSERT INTO `bitacora` VALUES ('736', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '476|SANTA MARÃA DEL RÃO|24', null);
INSERT INTO `bitacora` VALUES ('737', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '477|SOLEDAD DE GRACIANO SÃNCHEZ|24', null);
INSERT INTO `bitacora` VALUES ('738', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '478|TAMASOPO|24', null);
INSERT INTO `bitacora` VALUES ('739', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '479|TAMAZUNCHALE|24', null);
INSERT INTO `bitacora` VALUES ('740', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '480|TAMUIN|24', null);
INSERT INTO `bitacora` VALUES ('741', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '481|TIERRA NUEVA|24', null);
INSERT INTO `bitacora` VALUES ('742', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '482|VILLA DE REYES|24', null);
INSERT INTO `bitacora` VALUES ('743', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '483|AGUARUTO|25', null);
INSERT INTO `bitacora` VALUES ('744', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '484|AHOME|25', null);
INSERT INTO `bitacora` VALUES ('745', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '485|ANGOSTURA|25', null);
INSERT INTO `bitacora` VALUES ('746', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '486|CHOIX|25', null);
INSERT INTO `bitacora` VALUES ('747', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '487|COSALÃ|25', null);
INSERT INTO `bitacora` VALUES ('748', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '488|CULIACÃN ROSALES|25', null);
INSERT INTO `bitacora` VALUES ('749', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '489|EL ROSARIO|25', null);
INSERT INTO `bitacora` VALUES ('750', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '490|ESCUINAPA DE HIDALGO|25', null);
INSERT INTO `bitacora` VALUES ('751', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '491|ESTACIÃ“N NARANJO|25', null);
INSERT INTO `bitacora` VALUES ('752', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '492|GUAMÃšCHIL|25', null);
INSERT INTO `bitacora` VALUES ('753', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '493|GUASAVE|25', null);
INSERT INTO `bitacora` VALUES ('754', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '494|HIGUERA DE ZARAGOZA|25', null);
INSERT INTO `bitacora` VALUES ('755', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '495|LA CRUZ|25', null);
INSERT INTO `bitacora` VALUES ('756', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '496|LIC. BENITO JUÃREZ (CAMPO GOBIERNO)|25', null);
INSERT INTO `bitacora` VALUES ('757', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '497|LOS MOCHIS|25', null);
INSERT INTO `bitacora` VALUES ('758', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '498|MAZATLÃN|25', null);
INSERT INTO `bitacora` VALUES ('759', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '499|MOCORITO|25', null);
INSERT INTO `bitacora` VALUES ('760', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '500|NAVOLATO|25', null);
INSERT INTO `bitacora` VALUES ('761', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '501|QUILA|25', null);
INSERT INTO `bitacora` VALUES ('762', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '502|SAN BLAS|25', null);
INSERT INTO `bitacora` VALUES ('763', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '503|SAN IGNACIO|25', null);
INSERT INTO `bitacora` VALUES ('764', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '504|SINALOA DE LEYVA|25', null);
INSERT INTO `bitacora` VALUES ('765', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '505|TOPOLOBAMPO|25', null);
INSERT INTO `bitacora` VALUES ('766', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '506|VILLA UNIÃ“N|25', null);
INSERT INTO `bitacora` VALUES ('767', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '507|AGUA PRIETA|26', null);
INSERT INTO `bitacora` VALUES ('768', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '508|CIUDAD OBREGÃ“N|26', null);
INSERT INTO `bitacora` VALUES ('769', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '509|EMPALME|26', null);
INSERT INTO `bitacora` VALUES ('770', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '510|HERMOSILLO|26', null);
INSERT INTO `bitacora` VALUES ('771', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '511|HEROICA CABORCA|26', null);
INSERT INTO `bitacora` VALUES ('772', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '512|HEROICA CIUDAD DE CANANEA|26', null);
INSERT INTO `bitacora` VALUES ('773', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '513|HEROICA GUAYMAS|26', null);
INSERT INTO `bitacora` VALUES ('774', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '514|HEROICA NOGALES|26', null);
INSERT INTO `bitacora` VALUES ('775', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '515|HUATABAMPO|26', null);
INSERT INTO `bitacora` VALUES ('776', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '516|MAGDALENA DE KINO|26', null);
INSERT INTO `bitacora` VALUES ('777', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '517|NAVOJOA|26', null);
INSERT INTO `bitacora` VALUES ('778', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '518|PUERTO PEÃ‘ASCO|26', null);
INSERT INTO `bitacora` VALUES ('779', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '519|SAN LUIS RÃO COLORADO|26', null);
INSERT INTO `bitacora` VALUES ('780', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '520|SONOITA|26', null);
INSERT INTO `bitacora` VALUES ('781', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '521|CÃRDENAS|27', null);
INSERT INTO `bitacora` VALUES ('782', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '522|COMALCALCO|27', null);
INSERT INTO `bitacora` VALUES ('783', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '523|CUNDUACÃN|27', null);
INSERT INTO `bitacora` VALUES ('784', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '524|EMILIANO ZAPATA|27', null);
INSERT INTO `bitacora` VALUES ('785', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '525|FRONTERA|27', null);
INSERT INTO `bitacora` VALUES ('786', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '526|HUIMANGUILLO|27', null);
INSERT INTO `bitacora` VALUES ('787', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '527|JALPA DE MÃ‰NDEZ|27', null);
INSERT INTO `bitacora` VALUES ('788', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '528|MACUSPANA|27', null);
INSERT INTO `bitacora` VALUES ('789', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '529|PARAÃSO|27', null);
INSERT INTO `bitacora` VALUES ('790', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '530|TEAPA|27', null);
INSERT INTO `bitacora` VALUES ('791', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '531|TENOSIQUE DE PINO SUÃREZ|27', null);
INSERT INTO `bitacora` VALUES ('792', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '532|VILLAHERMOSA|27', null);
INSERT INTO `bitacora` VALUES ('793', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '533|ALTAMIRA|28', null);
INSERT INTO `bitacora` VALUES ('794', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '534|CIUDAD CAMARGO|28', null);
INSERT INTO `bitacora` VALUES ('795', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '535|CIUDAD GUSTAVO DÃAZ ORDAZ|28', null);
INSERT INTO `bitacora` VALUES ('796', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '536|CIUDAD MADERO|28', null);
INSERT INTO `bitacora` VALUES ('797', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '537|CIUDAD MANTE|28', null);
INSERT INTO `bitacora` VALUES ('798', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '538|CIUDAD MIGUEL ALEMÃN|28', null);
INSERT INTO `bitacora` VALUES ('799', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '539|CIUDAD RÃO BRAVO|28', null);
INSERT INTO `bitacora` VALUES ('800', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '540|CIUDAD TULA|28', null);
INSERT INTO `bitacora` VALUES ('801', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '541|CIUDAD VICTORIA|28', null);
INSERT INTO `bitacora` VALUES ('802', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '542|ESTACIÃ“N MANUEL (ÃšRSULO GALVÃN)|28', null);
INSERT INTO `bitacora` VALUES ('803', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '543|GONZÃLEZ|28', null);
INSERT INTO `bitacora` VALUES ('804', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '544|HEROICA MATAMOROS|28', null);
INSERT INTO `bitacora` VALUES ('805', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '545|JAUMAVE|28', null);
INSERT INTO `bitacora` VALUES ('806', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '546|NUEVA CIUDAD GUERRERO|28', null);
INSERT INTO `bitacora` VALUES ('807', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '547|NUEVO LAREDO|28', null);
INSERT INTO `bitacora` VALUES ('808', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '548|REYNOSA|28', null);
INSERT INTO `bitacora` VALUES ('809', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '549|SAN FERNANDO|28', null);
INSERT INTO `bitacora` VALUES ('810', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '550|SOTO LA MARINA|28', null);
INSERT INTO `bitacora` VALUES ('811', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '551|TAMPICO|28', null);
INSERT INTO `bitacora` VALUES ('812', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '552|VALLE HERMOSO|28', null);
INSERT INTO `bitacora` VALUES ('813', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '553|XICOTÃ‰NCATL|28', null);
INSERT INTO `bitacora` VALUES ('814', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '554|APIZACO|29', null);
INSERT INTO `bitacora` VALUES ('815', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '555|CALPULALPAN|29', null);
INSERT INTO `bitacora` VALUES ('816', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '556|CHIAUTEMPAN|29', null);
INSERT INTO `bitacora` VALUES ('817', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '557|HUAMANTLA|29', null);
INSERT INTO `bitacora` VALUES ('818', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '558|TLAXCALA (TLAXCALA DE XICOTENCATL)|29', null);
INSERT INTO `bitacora` VALUES ('819', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '559|VILLA VICENTE GUERRERO|29', null);
INSERT INTO `bitacora` VALUES ('820', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '560|ACAYUCAN|30', null);
INSERT INTO `bitacora` VALUES ('821', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '561|AGUA DULCE|30', null);
INSERT INTO `bitacora` VALUES ('822', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '562|ALTOTONGA|30', null);
INSERT INTO `bitacora` VALUES ('823', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '563|ALVARADO|30', null);
INSERT INTO `bitacora` VALUES ('824', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '564|ÃNGEL R. CABADA|30', null);
INSERT INTO `bitacora` VALUES ('825', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '565|ATOYAC|30', null);
INSERT INTO `bitacora` VALUES ('826', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '566|BANDERILLA|30', null);
INSERT INTO `bitacora` VALUES ('827', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '567|BOCA DEL RÃO|30', null);
INSERT INTO `bitacora` VALUES ('828', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '568|CARLOS A. CARRILLO|30', null);
INSERT INTO `bitacora` VALUES ('829', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '569|CATEMACO|30', null);
INSERT INTO `bitacora` VALUES ('830', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '570|CAZONES DE HERRERA|30', null);
INSERT INTO `bitacora` VALUES ('831', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '571|CERRO AZUL|30', null);
INSERT INTO `bitacora` VALUES ('832', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '572|COATEPEC|30', null);
INSERT INTO `bitacora` VALUES ('833', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '573|COATZACOALCOS|30', null);
INSERT INTO `bitacora` VALUES ('834', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '574|COATZINTLA|30', null);
INSERT INTO `bitacora` VALUES ('835', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '575|CÃ“RDOBA|30', null);
INSERT INTO `bitacora` VALUES ('836', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '576|COSAMALOAPAN|30', null);
INSERT INTO `bitacora` VALUES ('837', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '577|COSOLEACAQUE|30', null);
INSERT INTO `bitacora` VALUES ('838', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '578|CUICHAPA|30', null);
INSERT INTO `bitacora` VALUES ('839', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '579|CUITLÃHUAC|30', null);
INSERT INTO `bitacora` VALUES ('840', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '580|EL HIGO|30', null);
INSERT INTO `bitacora` VALUES ('841', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '581|FORTÃN DE LAS FLORES|30', null);
INSERT INTO `bitacora` VALUES ('842', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '582|GENERAL MIGUEL ALEMÃN (POTRERO NUEVO)|30', null);
INSERT INTO `bitacora` VALUES ('843', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '583|GUTIÃ‰RREZ ZAMORA|30', null);
INSERT INTO `bitacora` VALUES ('844', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '584|HUATUSCO DE CHICUELLAR|30', null);
INSERT INTO `bitacora` VALUES ('845', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '585|HUAYACOCOTLA|30', null);
INSERT INTO `bitacora` VALUES ('846', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '586|HUILOAPAN DE CUAUHTÃ‰MOC|30', null);
INSERT INTO `bitacora` VALUES ('847', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '587|ISLA|30', null);
INSERT INTO `bitacora` VALUES ('848', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '588|IXTACZOQUITLÃN|30', null);
INSERT INTO `bitacora` VALUES ('849', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '589|JÃLTIPAN DE MORELOS|30', null);
INSERT INTO `bitacora` VALUES ('850', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '590|JOSÃ‰ CARDEL|30', null);
INSERT INTO `bitacora` VALUES ('851', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '591|JUAN DÃAZ COVARRUBIAS|30', null);
INSERT INTO `bitacora` VALUES ('852', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '592|JUAN RODRÃGUEZ CLARA|30', null);
INSERT INTO `bitacora` VALUES ('853', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '593|LAS CHOAPAS|30', null);
INSERT INTO `bitacora` VALUES ('854', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '594|LERDO DE TEJADA|30', null);
INSERT INTO `bitacora` VALUES ('855', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '595|MINATITLÃN|30', null);
INSERT INTO `bitacora` VALUES ('856', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '596|NARANJOS|30', null);
INSERT INTO `bitacora` VALUES ('857', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '597|NOGALES|30', null);
INSERT INTO `bitacora` VALUES ('858', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '598|ORIZABA|30', null);
INSERT INTO `bitacora` VALUES ('859', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '599|PÃNUCO|30', null);
INSERT INTO `bitacora` VALUES ('860', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '600|PAPANTLA DE OLARTE|30', null);
INSERT INTO `bitacora` VALUES ('861', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '601|PARAJE NUEVO|30', null);
INSERT INTO `bitacora` VALUES ('862', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '602|PASO DE OVEJAS|30', null);
INSERT INTO `bitacora` VALUES ('863', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '603|PASO DEL MACHO|30', null);
INSERT INTO `bitacora` VALUES ('864', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '604|PLATÃ“N SÃNCHEZ|30', null);
INSERT INTO `bitacora` VALUES ('865', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '605|PLAYA VICENTE|30', null);
INSERT INTO `bitacora` VALUES ('866', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '606|POZA RICA DE HIDALGO|30', null);
INSERT INTO `bitacora` VALUES ('867', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '607|RÃO BLANCO|30', null);
INSERT INTO `bitacora` VALUES ('868', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '608|SAN ANDRÃ‰S TUXTLA|30', null);
INSERT INTO `bitacora` VALUES ('869', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '609|SAN RAFAEL|30', null);
INSERT INTO `bitacora` VALUES ('870', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '610|SANTIAGO TUXTLA|30', null);
INSERT INTO `bitacora` VALUES ('871', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '611|SIHUAPAN|30', null);
INSERT INTO `bitacora` VALUES ('872', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '612|SOLEDAD DE DOBLADO|30', null);
INSERT INTO `bitacora` VALUES ('873', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '613|TAMPICO ALTO|30', null);
INSERT INTO `bitacora` VALUES ('874', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '614|TANTOYUCA|30', null);
INSERT INTO `bitacora` VALUES ('875', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '615|TEMPOAL DE SÃNCHEZ|30', null);
INSERT INTO `bitacora` VALUES ('876', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '616|TEZONAPA|30', null);
INSERT INTO `bitacora` VALUES ('877', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '617|TIERRA BLANCA|30', null);
INSERT INTO `bitacora` VALUES ('878', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '618|TIHUATLÃN|30', null);
INSERT INTO `bitacora` VALUES ('879', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '619|TLACOJALPAN|30', null);
INSERT INTO `bitacora` VALUES ('880', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '620|TLAPACOYAN|30', null);
INSERT INTO `bitacora` VALUES ('881', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '621|TRES VALLES|30', null);
INSERT INTO `bitacora` VALUES ('882', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '622|TÃšXPAM DE RODRÃGUEZ CANO|30', null);
INSERT INTO `bitacora` VALUES ('883', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '623|VERACRUZ|30', null);
INSERT INTO `bitacora` VALUES ('884', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '624|XALAPA-ENRÃQUEZ|30', null);
INSERT INTO `bitacora` VALUES ('885', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '625|YECUATLA|30', null);
INSERT INTO `bitacora` VALUES ('886', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '626|KANASÃN|31', null);
INSERT INTO `bitacora` VALUES ('887', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '627|MÃ‰RIDA|31', null);
INSERT INTO `bitacora` VALUES ('888', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '628|MOTUL DE CARRILLO PUERTO|31', null);
INSERT INTO `bitacora` VALUES ('889', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '629|TICUL|31', null);
INSERT INTO `bitacora` VALUES ('890', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '630|TIZIMÃN|31', null);
INSERT INTO `bitacora` VALUES ('891', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '631|VALLADOLID|31', null);
INSERT INTO `bitacora` VALUES ('892', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '632|CIUDAD CUAUHTÃ‰MOC|32', null);
INSERT INTO `bitacora` VALUES ('893', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '633|FRESNILLO|32', null);
INSERT INTO `bitacora` VALUES ('894', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '634|GUADALUPE|32', null);
INSERT INTO `bitacora` VALUES ('895', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '635|JALPA|32', null);
INSERT INTO `bitacora` VALUES ('896', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '636|JEREZ DE GARCÃA SALINAS|32', null);
INSERT INTO `bitacora` VALUES ('897', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '637|JUAN ALDAMA|32', null);
INSERT INTO `bitacora` VALUES ('898', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '638|LORETO|32', null);
INSERT INTO `bitacora` VALUES ('899', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '639|LUIS MOYA|32', null);
INSERT INTO `bitacora` VALUES ('900', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '640|MOYAHUA DE ESTRADA|32', null);
INSERT INTO `bitacora` VALUES ('901', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '641|NOCHISTLÃN DE MEJÃA|32', null);
INSERT INTO `bitacora` VALUES ('902', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '642|OJOCALIENTE|32', null);
INSERT INTO `bitacora` VALUES ('903', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '643|RÃO GRANDE|32', null);
INSERT INTO `bitacora` VALUES ('904', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '644|SOMBRERETE|32', null);
INSERT INTO `bitacora` VALUES ('905', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '645|VALPARAÃSO|32', null);
INSERT INTO `bitacora` VALUES ('906', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '646|VÃCTOR ROSALES|32', null);
INSERT INTO `bitacora` VALUES ('907', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '647|VILLA DE COS|32', null);
INSERT INTO `bitacora` VALUES ('908', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '648|VILLA HIDALGO|32', null);
INSERT INTO `bitacora` VALUES ('909', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '649|VILLANUEVA|32', null);
INSERT INTO `bitacora` VALUES ('910', 'ciudad', '1', 'I', '2014-10-03 00:00:00', '650|ZACATECAS|32', null);
INSERT INTO `bitacora` VALUES ('911', 'periodo_prog_edu', '1', 'I', '2014-10-03 00:00:00', '1|SEMESTRAL', null);
INSERT INTO `bitacora` VALUES ('912', 'periodo_prog_edu', '1', 'I', '2014-10-03 00:00:00', '2|CUATRIMESTRAL', null);
INSERT INTO `bitacora` VALUES ('913', 'periodo_prog_edu', '1', 'I', '2014-10-03 00:00:00', '3|TRIMESTRAL', null);
INSERT INTO `bitacora` VALUES ('914', 'periodo_prog_edu', '1', 'I', '2014-10-03 00:00:00', '4|SABATINO', null);
INSERT INTO `bitacora` VALUES ('915', 'campus', '1', 'I', '2014-10-03 00:00:00', '1|16|TIJUANA UNIDAD OTAY|CALZADA UNIVERSIDAD 14418 PARQUE INDUSTRIAL INTERNACIONAL TI', null);
INSERT INTO `bitacora` VALUES ('916', 'campus', '1', 'I', '2014-10-03 00:00:00', '2|16|TIJUANA UNIDAD TECAT|CALZADA UNIVERSIDAD NO.1 FRACC. SAN FERNANDO. C.P. 21460', null);
INSERT INTO `bitacora` VALUES ('917', 'campus', '1', 'I', '2014-10-03 00:00:00', '3|16|TIJUANA UNIDAD ROSAR|BLVD. MARIANO VERDUGO NORTE ENTRE CALLE ISLA LOBO VERACRUZ Y', null);
INSERT INTO `bitacora` VALUES ('918', 'campus', '1', 'I', '2014-10-03 00:00:00', '4|16|TIJUANA UNIDAD VALLE|BLVD. UNIVERSITARIO #1000', null);
INSERT INTO `bitacora` VALUES ('919', 'uacademica', '1', 'I', '2014-10-03 00:00:00', '1|FCA|FACULTAD DE CONTADURIA Y ADMINISTRACION|1', null);
INSERT INTO `bitacora` VALUES ('920', 'uacademica', '1', 'I', '2014-10-03 00:00:00', '2|FCQI|FACULTAD DE CIENCIAS QUIMICAS E INGENIERIA|1', null);
INSERT INTO `bitacora` VALUES ('921', 'uacademica', '1', 'I', '2014-10-03 00:00:00', '3|FHCS|FACULTAD DE HUMANIDADES Y CIENCIAS SOCIALES|1', null);
INSERT INTO `bitacora` VALUES ('922', 'uacademica', '1', 'I', '2014-10-03 00:00:00', '4|FD|FACULTAD DE DERECHO|1', null);
INSERT INTO `bitacora` VALUES ('923', 'uacademica', '1', 'I', '2014-10-03 00:00:00', '5|FERI|FACULTAD DE ECONOMIA Y RELACIONES INTERNACIONALES|1', null);
INSERT INTO `bitacora` VALUES ('924', 'uacademica', '1', 'I', '2014-10-03 00:00:00', '6|FIN|FACULTAD DE INGENIERIA Y NEGOCIOS|1', null);
INSERT INTO `bitacora` VALUES ('925', 'uacademica', '1', 'I', '2014-10-03 00:00:00', '7|FMP|FACULTAD DE MEDICINA Y PSICOLOGIA|1', null);
INSERT INTO `bitacora` VALUES ('926', 'uacademica', '1', 'I', '2014-10-03 00:00:00', '8|FO|FACULTAD DE ODONTOLOGIA|1', null);
INSERT INTO `bitacora` VALUES ('927', 'uacademica', '1', 'I', '2014-10-03 00:00:00', '9|FTM|FACULTAD DE TURISMO Y MERCADOTECNIA|1', null);
INSERT INTO `bitacora` VALUES ('928', 'uacademica', '1', 'I', '2014-10-03 00:00:00', '10|FA|FACULTAD DE ARTES|1', null);
INSERT INTO `bitacora` VALUES ('929', 'puesto', '1', 'I', '2014-10-03 00:00:00', '1|DIRECTOR', null);
INSERT INTO `bitacora` VALUES ('930', 'puesto', '1', 'I', '2014-10-03 00:00:00', '2|SUBDIRECTOR', null);
INSERT INTO `bitacora` VALUES ('931', 'puesto', '1', 'I', '2014-10-03 00:00:00', '3|ADMINISTRADOR', null);
INSERT INTO `bitacora` VALUES ('932', 'puesto', '1', 'I', '2014-10-03 00:00:00', '4|DOCENTE', null);
INSERT INTO `bitacora` VALUES ('933', 'categoria', '1', 'I', '2014-10-03 00:00:00', '101|PROFESOR ORDINARIO DE ASIGNATURA NIVEL A', null);
INSERT INTO `bitacora` VALUES ('934', 'categoria', '1', 'I', '2014-10-03 00:00:00', '102|PROFESOR ORDINARIO DE ASIGNATURA NIVEL B', null);
INSERT INTO `bitacora` VALUES ('935', 'categoria', '1', 'I', '2014-10-03 00:00:00', '103|PROFESOR ORDINARIO DE ASIGNATURA NIVEL C', null);
INSERT INTO `bitacora` VALUES ('936', 'categoria', '1', 'I', '2014-10-03 00:00:00', '104|PROFESOR ORDINARIO DE CARRERA NIVEL A', null);
INSERT INTO `bitacora` VALUES ('937', 'categoria', '1', 'I', '2014-10-03 00:00:00', '105|PROFESOR ORDINARIO DE CARRERA NIVEL B', null);
INSERT INTO `bitacora` VALUES ('938', 'empleados', '1', 'I', '2014-10-03 00:00:00', '1|MARGARITA|RAMIREZ|RAMIREZ|1|F|DSDSD|2014-06-01|2014-06-01|MAGUIRAM@UABC.EDU.MX|MAGUIRAM@UABC.EDU.MX|20|10|10|16|DESCONOCIDA1|10|A|CACHO|34000|116530|115368|123567|101', null);
INSERT INTO `bitacora` VALUES ('939', 'empleados', '1', 'I', '2014-10-03 00:00:00', '2|NORA DEL CARMEN|OSUNA|MILLAN|1|F|FDFSF|2014-06-01|2014-04-06|NORA.OSUNA@UABC.EDU.MX|NORA.OSUNA@HOTMAIL.COM|20|10|10|16|DESCONOCIDA2|20|CACHO2|35000|116530|115368|1236789|101', null);
INSERT INTO `bitacora` VALUES ('940', 'empleados', '1', 'I', '2014-10-03 00:00:00', '3|ESPERANZA|MANRIQUE|1|F|FFDDS|2014-06-02|2014-03-02|EMANRIQUE@UABC.EDU.MX|EMANRIQUE@HOTMAIL.COM|20|10|10|16|DESCONOCIDA3|200|1|CACHO2|2355|116530|115368|1236789|101', null);
INSERT INTO `bitacora` VALUES ('941', 'empleados', '1', 'I', '2014-10-03 00:00:00', '4|EMMA SOFIA|CASTILLEJOS|CABALLERO|1|F|DFSS|2014-06-01|2014-04-06|EMA.CASTILLEJOS@UABC.EDU.MX|EMA.CASTILLEJOS@HOTMAIL.COM|20|10|10|16|DESCONOCIDA 100|234|1|CACHO1|34000|116530|115368|1236789|101', null);
INSERT INTO `bitacora` VALUES ('942', 'nvprograma', '1', 'I', '2014-10-03 00:00:00', '1|LICENCIATURA', null);
INSERT INTO `bitacora` VALUES ('943', 'nvprograma', '1', 'I', '2014-10-03 00:00:00', '2|POSTGRADO', null);
INSERT INTO `bitacora` VALUES ('944', 'nvprograma', '1', 'I', '2014-10-03 00:00:00', '3|TECNICO', null);
INSERT INTO `bitacora` VALUES ('945', 'esp_prog_edu', '1', 'I', '2014-10-03 00:00:00', '1|MTIC|1', null);
INSERT INTO `bitacora` VALUES ('946', 'esp_prog_edu', '1', 'I', '2014-10-03 00:00:00', '2|MC|1', null);
INSERT INTO `bitacora` VALUES ('947', 'reqseriacion', '1', 'I', '2014-10-03 00:00:00', '1|SIN SERIACION', null);
INSERT INTO `bitacora` VALUES ('948', 'reqseriacion', '1', 'I', '2014-10-03 00:00:00', '2|OBLIGATORIA', null);
INSERT INTO `bitacora` VALUES ('949', 'reqseriacion', '1', 'I', '2014-10-03 00:00:00', '3|SUGERIDA', null);
INSERT INTO `bitacora` VALUES ('950', 'caracter', '1', 'I', '2014-10-03 00:00:00', '1|OBLIGATORIA', null);
INSERT INTO `bitacora` VALUES ('951', 'caracter', '1', 'I', '2014-10-03 00:00:00', '2|OPTATIVA', null);
INSERT INTO `bitacora` VALUES ('952', 'etapas', '1', 'I', '2014-10-03 00:00:00', '1|BASICA', null);
INSERT INTO `bitacora` VALUES ('953', 'etapas', '1', 'I', '2014-10-03 00:00:00', '2|DISCIPLINARIA', null);
INSERT INTO `bitacora` VALUES ('954', 'etapas', '1', 'I', '2014-10-03 00:00:00', '3|TERMINAL', null);
INSERT INTO `bitacora` VALUES ('955', 'puestosemp', '1', 'I', '2014-10-03 00:00:00', '1|1|1', null);
INSERT INTO `bitacora` VALUES ('956', 'programaedu', '10', 'I', '2014-10-03 00:00:00', '2|LICENCIATURA EN ADMON. DE EMPRESAS|1|2|1|1|1', null);
INSERT INTO `bitacora` VALUES ('957', 'programaedu', '10', 'I', '2014-10-03 00:00:00', '3|LICENCIATURA EN INFORMATICA|1|3|1|1|1', null);
INSERT INTO `bitacora` VALUES ('958', 'programaedu', '10', 'I', '2014-10-03 00:00:00', '4|LICENCIATURA EN NEGOCIOS INTERNACIONALES|1|4|1|1|1', null);
INSERT INTO `bitacora` VALUES ('959', 'programaedu', '10', 'I', '2014-10-03 00:00:00', '5|LICENCIATURA EN CONTADURIA|1|4|1|1|1', null);
INSERT INTO `bitacora` VALUES ('960', 'programaedu', '10', 'I', '2014-10-03 00:00:00', '6|TRONCO COMUN|1|4|1|1|1', null);
INSERT INTO `bitacora` VALUES ('961', 'coordinaciona', '11', 'I', '2014-10-03 00:00:00', '1|COORD. CONTABILIDAD BASICA (LIC. EN CONTADURI|6', null);
INSERT INTO `bitacora` VALUES ('962', 'coordinaciona', '11', 'I', '2014-10-03 00:00:00', '2|COORD. CONTABILIDAD AVANZADA (LIC. EN CONTADU|6', null);
INSERT INTO `bitacora` VALUES ('963', 'coordinaciona', '11', 'I', '2014-10-03 00:00:00', '3|COORD. CONTABILIDAD DE COSTOS (LIC. EN CONTAD|6', null);
INSERT INTO `bitacora` VALUES ('964', 'coordinaciona', '11', 'I', '2014-10-03 00:00:00', '4|COORD. FINANZAS (LIC. EN CONTADURIA)|6', null);
INSERT INTO `bitacora` VALUES ('965', 'coordinaciona', '11', 'I', '2014-10-03 00:00:00', '5|COORD. AIDITORIA (LIC. EN CONTADURIA)|6', null);
INSERT INTO `bitacora` VALUES ('966', 'coordinaciona', '11', 'I', '2014-10-03 00:00:00', '6|COORD. IMPUESTOS (LIC. EN CONTADURIA)|6', null);
INSERT INTO `bitacora` VALUES ('967', 'coordinaciona', '11', 'I', '2014-10-03 00:00:00', '7|COORD. MERCADOTECNIA (LIC. EN ADMON. DE EMPRE|6', null);
INSERT INTO `bitacora` VALUES ('968', 'coordinaciona', '11', 'I', '2014-10-03 00:00:00', '8|COORD. RECURSOS HUMANOS (LIC. EN ADMON. DE EM|6', null);
INSERT INTO `bitacora` VALUES ('969', 'coordinaciona', '11', 'I', '2014-10-03 00:00:00', '9|COORD. PRODUCCION (LIC. EN ADMON. DE EMPRESAS|6', null);
INSERT INTO `bitacora` VALUES ('970', 'coordinaciona', '11', 'I', '2014-10-03 00:00:00', '10|COORD. ADMINISTRACION BASICA (LIC. EN ADMON. |6', null);
INSERT INTO `bitacora` VALUES ('971', 'coordinaciona', '11', 'I', '2014-10-03 00:00:00', '11|COORD. ADMINISTRACION AVANZADA (LIC. EN ADMON|6', null);
INSERT INTO `bitacora` VALUES ('972', 'coordinaciona', '11', 'I', '2014-10-03 00:00:00', '12|COORD. INFORMATICA (LIC. EN INFORMATICA) |6', null);
INSERT INTO `bitacora` VALUES ('973', 'coordinaciona', '11', 'I', '2014-10-03 00:00:00', '13|COORD. MATEMATICAS (LIC. EN INFORMATICA)|6', null);
INSERT INTO `bitacora` VALUES ('974', 'coordinaciona', '11', 'I', '2014-10-03 00:00:00', '14|COORD. CIENCIAS COMPUTACIONALES (LIC. EN INFO|6', null);
INSERT INTO `bitacora` VALUES ('975', 'coordinaciona', '11', 'I', '2014-10-03 00:00:00', '15|COORD. SISTEMAS DE INFORMACION (LIC. EN INFOR|6', null);
INSERT INTO `bitacora` VALUES ('976', 'coordinaciona', '11', 'I', '2014-10-03 00:00:00', '16|COORD. PROGRAMACION (LIC. EN INFORMATICA)|6', null);
INSERT INTO `bitacora` VALUES ('977', 'coordinaciona', '11', 'I', '2014-10-03 00:00:00', '17|COORD. ECONOMIA (LIC. EN NEGOCIOS INTERNACION|6', null);
INSERT INTO `bitacora` VALUES ('978', 'coordinaciona', '11', 'I', '2014-10-03 00:00:00', '18|COORD. COMERCIO EXTERIOR (LIC. EN NEGOCIOS IN|6', null);
INSERT INTO `bitacora` VALUES ('979', 'coordinaciona', '11', 'I', '2014-10-03 00:00:00', '19|COORD. DERECHO (LIC. EN NEGOCIOS INTERNACIONA|6', null);
INSERT INTO `bitacora` VALUES ('980', 'coordinaciona', '11', 'I', '2014-10-03 00:00:00', '20|COORD. EMPRENDEDORES(LIC. EN NEGOCIOS INTERNA|6', null);
INSERT INTO `bitacora` VALUES ('981', 'coordinaciona', '11', 'I', '2014-10-03 00:00:00', '21|COORD. ASIGNATURAS DE APOYO (LIC. EN NEGOCIOS|6', null);
INSERT INTO `bitacora` VALUES ('982', 'coordinaciona', '11', 'I', '2014-10-03 00:00:00', '22|SIN COORDINACION|6', null);
INSERT INTO `bitacora` VALUES ('983', 'turnos', '10', 'I', '2014-10-03 00:00:00', '1|MATUTINO', null);
INSERT INTO `bitacora` VALUES ('984', 'turnos', '10', 'I', '2014-10-03 00:00:00', '2|VESPERTINO', null);
INSERT INTO `bitacora` VALUES ('985', 'turnos', '10', 'I', '2014-10-03 00:00:00', '3|INTERTURNO', null);
INSERT INTO `bitacora` VALUES ('986', 'status', '10', 'I', '2014-10-03 00:00:00', '1|CAPTURADO', null);
INSERT INTO `bitacora` VALUES ('987', 'status', '10', 'I', '2014-10-03 00:00:00', '2|COMPLETADO', null);
INSERT INTO `bitacora` VALUES ('988', 'status', '10', 'I', '2014-10-03 00:00:00', '3|EN PROCESO', null);
INSERT INTO `bitacora` VALUES ('989', 'programaedu', '10', 'U', '2014-10-04 00:00:00', '2|ADMON. DE EMPRESAS|1|2|1|1|1', '2|LICENCIATURA EN ADMON. DE EMPRESAS|1|2|1|1|1');
INSERT INTO `bitacora` VALUES ('990', 'programaedu', '10', 'U', '2014-10-04 00:00:00', '3|INFORMATICA|1|3|1|1|1', '3|LICENCIATURA EN INFORMATICA|1|3|1|1|1');
INSERT INTO `bitacora` VALUES ('991', 'programaedu', '10', 'U', '2014-10-04 00:00:00', '4|NEGOCIOS INTERNACIONALES|1|4|1|1|1', '4|LICENCIATURA EN NEGOCIOS INTERNACIONALES|1|4|1|1|1');
INSERT INTO `bitacora` VALUES ('992', 'programaedu', '10', 'U', '2014-10-04 00:00:00', '5|CONTADURIA|1|4|1|1|1', '5|LICENCIATURA EN CONTADURIA|1|4|1|1|1');
INSERT INTO `bitacora` VALUES ('993', 'programaedu', '10', 'I', '2014-10-04 00:00:00', '0|SISTEMAS COMPUTACIONALES|1|2|1|1|1', null);
INSERT INTO `bitacora` VALUES ('994', 'programaedu', '10', 'U', '2014-10-04 00:00:00', '7|SISTEMAS COMPUTACIONALES|1|2|1|1|1', '0|SISTEMAS COMPUTACIONALES|1|2|1|1|1');
INSERT INTO `bitacora` VALUES ('995', 'programaedu', '10', 'I', '2014-10-04 00:00:00', '1|ARTES|1|2|1|1|1', null);
INSERT INTO `bitacora` VALUES ('996', 'planestudio', '9', 'I', '2014-10-06 00:00:00', '20101|Plan 2010-1 SEP 534523|400|2014-10-01|2014-10-31|1', null);
INSERT INTO `bitacora` VALUES ('997', 'planestudio', '9', 'D', '2014-10-06 00:00:00', null, '20101|Plan 2010-1 SEP 534523|400|2014-10-01|2014-10-31|1');
INSERT INTO `bitacora` VALUES ('998', 'planestudio', '9', 'I', '2014-10-06 00:00:00', '20101|Plan 2010-1 SEP 534523|800|2014-10-01|2014-10-31|1', null);
INSERT INTO `bitacora` VALUES ('999', 'plan_programa', '9', 'I', '2014-10-06 00:00:00', '20101|1', null);
INSERT INTO `bitacora` VALUES ('1000', 'plan_programa', '9', 'I', '2014-10-06 00:00:00', '20101|2', null);
INSERT INTO `bitacora` VALUES ('1001', 'plan_programa', '9', 'I', '2014-10-06 00:00:00', '20101|3', null);
INSERT INTO `bitacora` VALUES ('1002', 'plan_programa', '9', 'I', '2014-10-06 00:00:00', '20101|4', null);
INSERT INTO `bitacora` VALUES ('1003', 'plan_programa', '9', 'I', '2014-10-06 00:00:00', '20101|5', null);
INSERT INTO `bitacora` VALUES ('1004', 'plan_programa', '9', 'I', '2014-10-06 00:00:00', '20101|6', null);
INSERT INTO `bitacora` VALUES ('1005', 'plan_programa', '9', 'I', '2014-10-06 00:00:00', '20101|7', null);
INSERT INTO `bitacora` VALUES ('1006', 'plan_programa', '9', 'D', '2014-10-06 00:00:00', null, '20101|7');
INSERT INTO `bitacora` VALUES ('1007', 'plan_programa', '9', 'D', '2014-10-06 00:00:00', null, '20101|6');
INSERT INTO `bitacora` VALUES ('1008', 'plan_programa', '9', 'D', '2014-10-06 00:00:00', null, '20101|5');
INSERT INTO `bitacora` VALUES ('1009', 'plan_programa', '9', 'D', '2014-10-06 00:00:00', null, '20101|4');
INSERT INTO `bitacora` VALUES ('1010', 'plan_programa', '9', 'D', '2014-10-06 00:00:00', null, '20101|3');
INSERT INTO `bitacora` VALUES ('1011', 'plan_programa', '9', 'D', '2014-10-06 00:00:00', null, '20101|2');
INSERT INTO `bitacora` VALUES ('1012', 'plan_programa', '9', 'D', '2014-10-06 00:00:00', null, '20101|1');
INSERT INTO `bitacora` VALUES ('1013', 'planestudio', '9', 'D', '2014-10-06 00:00:00', null, '20101|Plan 2010-1 SEP 534523|800|2014-10-01|2014-10-31|1');
INSERT INTO `bitacora` VALUES ('1014', 'planestudio', '9', 'I', '2014-10-06 00:00:00', '20101|Plan 2010-1 SEP 534523|700|2014-10-01|2014-10-31|1', null);
INSERT INTO `bitacora` VALUES ('1015', 'plan_programa', '9', 'I', '2014-10-06 00:00:00', '20101|1', null);
INSERT INTO `bitacora` VALUES ('1016', 'plan_programa', '9', 'I', '2014-10-06 00:00:00', '20101|2', null);
INSERT INTO `bitacora` VALUES ('1017', 'plan_programa', '9', 'I', '2014-10-06 00:00:00', '20101|3', null);
INSERT INTO `bitacora` VALUES ('1018', 'plan_programa', '9', 'I', '2014-10-06 00:00:00', '20101|4', null);
INSERT INTO `bitacora` VALUES ('1019', 'plan_programa', '9', 'I', '2014-10-06 00:00:00', '20101|5', null);
INSERT INTO `bitacora` VALUES ('1020', 'plan_programa', '9', 'I', '2014-10-06 00:00:00', '20101|6', null);
INSERT INTO `bitacora` VALUES ('1021', 'plan_programa', '9', 'I', '2014-10-06 00:00:00', '20101|7', null);
INSERT INTO `bitacora` VALUES ('1022', 'plan_programa', '9', 'D', '2014-10-06 00:00:00', null, '20101|1');
INSERT INTO `bitacora` VALUES ('1023', 'plan_programa', '9', 'D', '2014-10-06 00:00:00', null, '20101|2');
INSERT INTO `bitacora` VALUES ('1024', 'plan_programa', '9', 'D', '2014-10-06 00:00:00', null, '20101|3');
INSERT INTO `bitacora` VALUES ('1025', 'plan_programa', '9', 'D', '2014-10-06 00:00:00', null, '20101|4');
INSERT INTO `bitacora` VALUES ('1026', 'plan_programa', '9', 'D', '2014-10-06 00:00:00', null, '20101|5');
INSERT INTO `bitacora` VALUES ('1027', 'plan_programa', '9', 'D', '2014-10-06 00:00:00', null, '20101|6');
INSERT INTO `bitacora` VALUES ('1028', 'plan_programa', '9', 'D', '2014-10-06 00:00:00', null, '20101|7');
INSERT INTO `bitacora` VALUES ('1029', 'planestudio', '9', 'D', '2014-10-06 00:00:00', null, '20101|Plan 2010-1 SEP 534523|700|2014-10-01|2014-10-31|1');
INSERT INTO `bitacora` VALUES ('1030', 'planestudio', '9', 'I', '2014-10-06 00:00:00', '20101|Plan 2010-1 SEP 534523|700|2014-10-01|2014-10-31|1', null);
INSERT INTO `bitacora` VALUES ('1031', 'plan_programa', '9', 'I', '2014-10-06 00:00:00', '20101|1', null);
INSERT INTO `bitacora` VALUES ('1032', 'plan_programa', '9', 'I', '2014-10-06 00:00:00', '20101|2', null);
INSERT INTO `bitacora` VALUES ('1033', 'plan_programa', '9', 'I', '2014-10-06 00:00:00', '20101|3', null);
INSERT INTO `bitacora` VALUES ('1034', 'plan_programa', '9', 'I', '2014-10-06 00:00:00', '20101|4', null);
INSERT INTO `bitacora` VALUES ('1035', 'plan_programa', '9', 'I', '2014-10-06 00:00:00', '20101|5', null);
INSERT INTO `bitacora` VALUES ('1036', 'plan_programa', '9', 'I', '2014-10-06 00:00:00', '20101|6', null);
INSERT INTO `bitacora` VALUES ('1037', 'plan_programa', '9', 'I', '2014-10-06 00:00:00', '20101|7', null);
INSERT INTO `bitacora` VALUES ('1038', 'planestudio', '9', 'I', '2014-10-06 00:00:00', '20102|Plan 2010-2 SEP 432421|900|2014-10-01|2014-10-31|1', null);
INSERT INTO `bitacora` VALUES ('1039', 'plan_programa', '9', 'I', '2014-10-06 00:00:00', '20102|1', null);
INSERT INTO `bitacora` VALUES ('1040', 'plan_programa', '9', 'I', '2014-10-06 00:00:00', '20102|2', null);
INSERT INTO `bitacora` VALUES ('1041', 'plan_programa', '9', 'I', '2014-10-06 00:00:00', '20102|3', null);
INSERT INTO `bitacora` VALUES ('1042', 'plan_programa', '9', 'I', '2014-10-06 00:00:00', '20102|4', null);
INSERT INTO `bitacora` VALUES ('1043', 'plan_programa', '9', 'I', '2014-10-06 00:00:00', '20102|5', null);
INSERT INTO `bitacora` VALUES ('1044', 'plan_programa', '9', 'I', '2014-10-06 00:00:00', '20102|6', null);
INSERT INTO `bitacora` VALUES ('1045', 'plan_programa', '9', 'I', '2014-10-06 00:00:00', '20102|7', null);
INSERT INTO `bitacora` VALUES ('1046', 'planestudio', '9', 'I', '2014-10-06 00:00:00', '20103|Plan 2010-3 SEP 432421|800|2014-10-01|2014-10-31|1', null);
INSERT INTO `bitacora` VALUES ('1047', 'plan_programa', '9', 'I', '2014-10-06 00:00:00', '20103|1', null);
INSERT INTO `bitacora` VALUES ('1048', 'plan_programa', '9', 'I', '2014-10-06 00:00:00', '20103|2', null);
INSERT INTO `bitacora` VALUES ('1049', 'plan_programa', '9', 'I', '2014-10-06 00:00:00', '20103|3', null);
INSERT INTO `bitacora` VALUES ('1050', 'plan_programa', '9', 'I', '2014-10-06 00:00:00', '20103|4', null);
INSERT INTO `bitacora` VALUES ('1051', 'plan_programa', '9', 'I', '2014-10-06 00:00:00', '20103|5', null);
INSERT INTO `bitacora` VALUES ('1052', 'plan_programa', '9', 'I', '2014-10-06 00:00:00', '20103|6', null);
INSERT INTO `bitacora` VALUES ('1053', 'plan_programa', '9', 'I', '2014-10-06 00:00:00', '20103|7', null);
INSERT INTO `bitacora` VALUES ('1054', 'planestudio', '9', 'I', '2014-10-06 00:00:00', '20104|vamos|890|2014-10-01|2014-10-31|1', null);
INSERT INTO `bitacora` VALUES ('1055', 'planestudio', '9', 'I', '2014-10-06 00:00:00', '20105|asdf|800|2014-10-01|2014-10-31|1', null);
INSERT INTO `bitacora` VALUES ('1056', 'planestudio', '9', 'I', '2014-10-06 00:00:00', '20107|adsf|8000|2014-10-01|2014-10-31|1', null);
INSERT INTO `bitacora` VALUES ('1057', 'plan_programa', '9', 'D', '2014-10-06 00:00:00', null, '20101|1');
INSERT INTO `bitacora` VALUES ('1058', 'plan_programa', '9', 'D', '2014-10-06 00:00:00', null, '20101|2');
INSERT INTO `bitacora` VALUES ('1059', 'plan_programa', '9', 'D', '2014-10-06 00:00:00', null, '20101|3');
INSERT INTO `bitacora` VALUES ('1060', 'plan_programa', '9', 'D', '2014-10-06 00:00:00', null, '20101|4');
INSERT INTO `bitacora` VALUES ('1061', 'plan_programa', '9', 'D', '2014-10-06 00:00:00', null, '20101|5');
INSERT INTO `bitacora` VALUES ('1062', 'plan_programa', '9', 'D', '2014-10-06 00:00:00', null, '20101|6');
INSERT INTO `bitacora` VALUES ('1063', 'plan_programa', '9', 'D', '2014-10-06 00:00:00', null, '20101|7');
INSERT INTO `bitacora` VALUES ('1064', 'plan_programa', '9', 'D', '2014-10-06 00:00:00', null, '20102|1');
INSERT INTO `bitacora` VALUES ('1065', 'plan_programa', '9', 'D', '2014-10-06 00:00:00', null, '20102|2');
INSERT INTO `bitacora` VALUES ('1066', 'plan_programa', '9', 'D', '2014-10-06 00:00:00', null, '20102|3');
INSERT INTO `bitacora` VALUES ('1067', 'plan_programa', '9', 'D', '2014-10-06 00:00:00', null, '20102|4');
INSERT INTO `bitacora` VALUES ('1068', 'plan_programa', '9', 'D', '2014-10-06 00:00:00', null, '20102|5');
INSERT INTO `bitacora` VALUES ('1069', 'plan_programa', '9', 'D', '2014-10-06 00:00:00', null, '20102|6');
INSERT INTO `bitacora` VALUES ('1070', 'plan_programa', '9', 'D', '2014-10-06 00:00:00', null, '20102|7');
INSERT INTO `bitacora` VALUES ('1071', 'plan_programa', '9', 'D', '2014-10-06 00:00:00', null, '20103|1');
INSERT INTO `bitacora` VALUES ('1072', 'plan_programa', '9', 'D', '2014-10-06 00:00:00', null, '20103|2');
INSERT INTO `bitacora` VALUES ('1073', 'plan_programa', '9', 'D', '2014-10-06 00:00:00', null, '20103|3');
INSERT INTO `bitacora` VALUES ('1074', 'plan_programa', '9', 'D', '2014-10-06 00:00:00', null, '20103|4');
INSERT INTO `bitacora` VALUES ('1075', 'plan_programa', '9', 'D', '2014-10-06 00:00:00', null, '20103|5');
INSERT INTO `bitacora` VALUES ('1076', 'plan_programa', '9', 'D', '2014-10-06 00:00:00', null, '20103|6');
INSERT INTO `bitacora` VALUES ('1077', 'plan_programa', '9', 'D', '2014-10-06 00:00:00', null, '20103|7');
INSERT INTO `bitacora` VALUES ('1078', 'planestudio', '9', 'D', '2014-10-06 00:00:00', null, '20101|Plan 2010-1 SEP 534523|700|2014-10-01|2014-10-31|1');
INSERT INTO `bitacora` VALUES ('1079', 'planestudio', '9', 'D', '2014-10-06 00:00:00', null, '20102|Plan 2010-2 SEP 432421|900|2014-10-01|2014-10-31|1');
INSERT INTO `bitacora` VALUES ('1080', 'planestudio', '9', 'D', '2014-10-06 00:00:00', null, '20103|Plan 2010-3 SEP 432421|800|2014-10-01|2014-10-31|1');
INSERT INTO `bitacora` VALUES ('1081', 'planestudio', '9', 'D', '2014-10-06 00:00:00', null, '20104|vamos|890|2014-10-01|2014-10-31|1');
INSERT INTO `bitacora` VALUES ('1082', 'planestudio', '9', 'D', '2014-10-06 00:00:00', null, '20105|asdf|800|2014-10-01|2014-10-31|1');
INSERT INTO `bitacora` VALUES ('1083', 'planestudio', '9', 'D', '2014-10-06 00:00:00', null, '20107|adsf|8000|2014-10-01|2014-10-31|1');
INSERT INTO `bitacora` VALUES ('1084', 'planestudio', '9', 'I', '2014-10-06 00:00:00', '20101|Plan 2010-1 SEP 534523|600|2014-10-01|2014-10-31|1', null);
INSERT INTO `bitacora` VALUES ('1085', 'plan_programa', '9', 'I', '2014-10-06 00:00:00', '20101|1', null);
INSERT INTO `bitacora` VALUES ('1086', 'planestudio', '9', 'I', '2014-10-06 00:00:00', '20102|Por favor una descripicion|900|2014-10-01|2014-10-31|1', null);
INSERT INTO `bitacora` VALUES ('1087', 'plan_programa', '9', 'I', '2014-10-06 00:00:00', '20102|1', null);
INSERT INTO `bitacora` VALUES ('1088', 'plan_programa', '9', 'I', '2014-10-06 00:00:00', '20102|2', null);
INSERT INTO `bitacora` VALUES ('1089', 'plan_programa', '9', 'I', '2014-10-06 00:00:00', '20102|3', null);
INSERT INTO `bitacora` VALUES ('1090', 'plan_programa', '9', 'I', '2014-10-06 00:00:00', '20102|4', null);
INSERT INTO `bitacora` VALUES ('1091', 'plan_programa', '9', 'I', '2014-10-06 00:00:00', '20102|5', null);
INSERT INTO `bitacora` VALUES ('1092', 'plan_programa', '9', 'I', '2014-10-06 00:00:00', '20102|6', null);
INSERT INTO `bitacora` VALUES ('1093', 'plan_programa', '9', 'I', '2014-10-06 00:00:00', '20102|7', null);
INSERT INTO `bitacora` VALUES ('1094', 'plan_programa', '9', 'D', '2014-10-06 00:00:00', null, '20101|1');
INSERT INTO `bitacora` VALUES ('1095', 'plan_programa', '9', 'D', '2014-10-06 00:00:00', null, '20102|1');
INSERT INTO `bitacora` VALUES ('1096', 'plan_programa', '9', 'D', '2014-10-06 00:00:00', null, '20102|2');
INSERT INTO `bitacora` VALUES ('1097', 'plan_programa', '9', 'D', '2014-10-06 00:00:00', null, '20102|3');
INSERT INTO `bitacora` VALUES ('1098', 'plan_programa', '9', 'D', '2014-10-06 00:00:00', null, '20102|4');
INSERT INTO `bitacora` VALUES ('1099', 'plan_programa', '9', 'D', '2014-10-06 00:00:00', null, '20102|5');
INSERT INTO `bitacora` VALUES ('1100', 'plan_programa', '9', 'D', '2014-10-06 00:00:00', null, '20102|6');
INSERT INTO `bitacora` VALUES ('1101', 'plan_programa', '9', 'D', '2014-10-06 00:00:00', null, '20102|7');
INSERT INTO `bitacora` VALUES ('1102', 'planestudio', '9', 'D', '2014-10-06 00:00:00', null, '20101|Plan 2010-1 SEP 534523|600|2014-10-01|2014-10-31|1');
INSERT INTO `bitacora` VALUES ('1103', 'planestudio', '9', 'D', '2014-10-06 00:00:00', null, '20102|Por favor una descripicion|900|2014-10-01|2014-10-31|1');
INSERT INTO `bitacora` VALUES ('1104', 'planestudio', '9', 'I', '2014-10-09 00:00:00', '20101|Plan 2010-1 SEP 534523|900|2014-10-01|2014-10-31|1', null);
INSERT INTO `bitacora` VALUES ('1105', 'plan_programa', '9', 'I', '2014-10-09 00:00:00', '20101|1', null);
INSERT INTO `bitacora` VALUES ('1106', 'plan_programa', '9', 'I', '2014-10-09 00:00:00', '20101|2', null);
INSERT INTO `bitacora` VALUES ('1107', 'plan_programa', '9', 'I', '2014-10-09 00:00:00', '20101|3', null);
INSERT INTO `bitacora` VALUES ('1108', 'plan_programa', '9', 'I', '2014-10-09 00:00:00', '20101|4', null);
INSERT INTO `bitacora` VALUES ('1109', 'plan_programa', '9', 'I', '2014-10-09 00:00:00', '20101|5', null);
INSERT INTO `bitacora` VALUES ('1110', 'plan_programa', '9', 'I', '2014-10-09 00:00:00', '20101|6', null);
INSERT INTO `bitacora` VALUES ('1111', 'plan_programa', '9', 'I', '2014-10-09 00:00:00', '20101|7', null);
INSERT INTO `bitacora` VALUES ('1112', 'planestudio', '9', 'I', '2014-10-09 00:00:00', '20102|Plan 2010-2 SEP 432421|922|2014-10-01|2014-10-31|1', null);
INSERT INTO `bitacora` VALUES ('1113', 'plan_programa', '9', 'I', '2014-10-09 00:00:00', '20102|1', null);
INSERT INTO `bitacora` VALUES ('1114', 'plan_programa', '9', 'I', '2014-10-09 00:00:00', '20102|2', null);
INSERT INTO `bitacora` VALUES ('1115', 'plan_programa', '9', 'I', '2014-10-09 00:00:00', '20102|3', null);
INSERT INTO `bitacora` VALUES ('1116', 'plan_programa', '9', 'I', '2014-10-09 00:00:00', '20102|4', null);
INSERT INTO `bitacora` VALUES ('1117', 'plan_programa', '9', 'I', '2014-10-09 00:00:00', '20102|5', null);
INSERT INTO `bitacora` VALUES ('1118', 'plan_programa', '9', 'I', '2014-10-09 00:00:00', '20102|6', null);
INSERT INTO `bitacora` VALUES ('1119', 'plan_programa', '9', 'I', '2014-10-09 00:00:00', '20102|7', null);
INSERT INTO `bitacora` VALUES ('1120', 'planestudio', '9', 'I', '2014-10-09 00:00:00', '20103|VAMOS A VER|800|2014-10-01|2014-10-31|1', null);
INSERT INTO `bitacora` VALUES ('1121', 'plan_programa', '9', 'I', '2014-10-09 00:00:00', '20103|1', null);
INSERT INTO `bitacora` VALUES ('1122', 'plan_programa', '9', 'I', '2014-10-09 00:00:00', '20103|2', null);
INSERT INTO `bitacora` VALUES ('1123', 'plan_programa', '9', 'I', '2014-10-09 00:00:00', '20103|3', null);
INSERT INTO `bitacora` VALUES ('1124', 'plan_programa', '9', 'I', '2014-10-09 00:00:00', '20103|4', null);
INSERT INTO `bitacora` VALUES ('1125', 'plan_programa', '9', 'I', '2014-10-09 00:00:00', '20103|5', null);
INSERT INTO `bitacora` VALUES ('1126', 'plan_programa', '9', 'I', '2014-10-09 00:00:00', '20103|6', null);
INSERT INTO `bitacora` VALUES ('1127', 'plan_programa', '9', 'I', '2014-10-09 00:00:00', '20103|7', null);
INSERT INTO `bitacora` VALUES ('1128', 'planestudio', '9', 'I', '2014-10-09 00:00:00', '20104|Plan 2010-1 SEP 534523|500|2014-10-01|2014-10-31|1', null);
INSERT INTO `bitacora` VALUES ('1129', 'plan_programa', '9', 'I', '2014-10-09 00:00:00', '20104|1', null);
INSERT INTO `bitacora` VALUES ('1130', 'plan_programa', '9', 'I', '2014-10-09 00:00:00', '20104|2', null);
INSERT INTO `bitacora` VALUES ('1131', 'plan_programa', '9', 'I', '2014-10-09 00:00:00', '20104|3', null);
INSERT INTO `bitacora` VALUES ('1132', 'plan_programa', '9', 'I', '2014-10-09 00:00:00', '20104|4', null);
INSERT INTO `bitacora` VALUES ('1133', 'plan_programa', '9', 'I', '2014-10-09 00:00:00', '20104|5', null);
INSERT INTO `bitacora` VALUES ('1134', 'plan_programa', '9', 'I', '2014-10-09 00:00:00', '20104|6', null);
INSERT INTO `bitacora` VALUES ('1135', 'plan_programa', '9', 'I', '2014-10-09 00:00:00', '20104|7', null);
INSERT INTO `bitacora` VALUES ('1136', 'plan_programa', '9', 'D', '2014-10-09 00:00:00', null, '20101|1');
INSERT INTO `bitacora` VALUES ('1137', 'plan_programa', '9', 'D', '2014-10-09 00:00:00', null, '20101|2');
INSERT INTO `bitacora` VALUES ('1138', 'plan_programa', '9', 'D', '2014-10-09 00:00:00', null, '20101|3');
INSERT INTO `bitacora` VALUES ('1139', 'plan_programa', '9', 'D', '2014-10-09 00:00:00', null, '20101|4');
INSERT INTO `bitacora` VALUES ('1140', 'plan_programa', '9', 'D', '2014-10-09 00:00:00', null, '20101|5');
INSERT INTO `bitacora` VALUES ('1141', 'plan_programa', '9', 'D', '2014-10-09 00:00:00', null, '20101|6');
INSERT INTO `bitacora` VALUES ('1142', 'plan_programa', '9', 'D', '2014-10-09 00:00:00', null, '20101|7');
INSERT INTO `bitacora` VALUES ('1143', 'plan_programa', '9', 'D', '2014-10-09 00:00:00', null, '20102|1');
INSERT INTO `bitacora` VALUES ('1144', 'plan_programa', '9', 'D', '2014-10-09 00:00:00', null, '20102|2');
INSERT INTO `bitacora` VALUES ('1145', 'plan_programa', '9', 'D', '2014-10-09 00:00:00', null, '20102|3');
INSERT INTO `bitacora` VALUES ('1146', 'plan_programa', '9', 'D', '2014-10-09 00:00:00', null, '20102|4');
INSERT INTO `bitacora` VALUES ('1147', 'plan_programa', '9', 'D', '2014-10-09 00:00:00', null, '20102|5');
INSERT INTO `bitacora` VALUES ('1148', 'plan_programa', '9', 'D', '2014-10-09 00:00:00', null, '20102|6');
INSERT INTO `bitacora` VALUES ('1149', 'plan_programa', '9', 'D', '2014-10-09 00:00:00', null, '20102|7');
INSERT INTO `bitacora` VALUES ('1150', 'plan_programa', '9', 'D', '2014-10-09 00:00:00', null, '20103|1');
INSERT INTO `bitacora` VALUES ('1151', 'plan_programa', '9', 'D', '2014-10-09 00:00:00', null, '20103|2');
INSERT INTO `bitacora` VALUES ('1152', 'plan_programa', '9', 'D', '2014-10-09 00:00:00', null, '20103|3');
INSERT INTO `bitacora` VALUES ('1153', 'plan_programa', '9', 'D', '2014-10-09 00:00:00', null, '20103|4');
INSERT INTO `bitacora` VALUES ('1154', 'plan_programa', '9', 'D', '2014-10-09 00:00:00', null, '20103|5');
INSERT INTO `bitacora` VALUES ('1155', 'plan_programa', '9', 'D', '2014-10-09 00:00:00', null, '20103|6');
INSERT INTO `bitacora` VALUES ('1156', 'plan_programa', '9', 'D', '2014-10-09 00:00:00', null, '20103|7');
INSERT INTO `bitacora` VALUES ('1157', 'plan_programa', '9', 'D', '2014-10-09 00:00:00', null, '20104|1');
INSERT INTO `bitacora` VALUES ('1158', 'plan_programa', '9', 'D', '2014-10-09 00:00:00', null, '20104|2');
INSERT INTO `bitacora` VALUES ('1159', 'plan_programa', '9', 'D', '2014-10-09 00:00:00', null, '20104|3');
INSERT INTO `bitacora` VALUES ('1160', 'plan_programa', '9', 'D', '2014-10-09 00:00:00', null, '20104|4');
INSERT INTO `bitacora` VALUES ('1161', 'plan_programa', '9', 'D', '2014-10-09 00:00:00', null, '20104|5');
INSERT INTO `bitacora` VALUES ('1162', 'plan_programa', '9', 'D', '2014-10-09 00:00:00', null, '20104|6');
INSERT INTO `bitacora` VALUES ('1163', 'plan_programa', '9', 'D', '2014-10-09 00:00:00', null, '20104|7');
INSERT INTO `bitacora` VALUES ('1164', 'planestudio', '9', 'D', '2014-10-09 00:00:00', null, '20101|Plan 2010-1 SEP 534523|900|2014-10-01|2014-10-31|1');
INSERT INTO `bitacora` VALUES ('1165', 'planestudio', '9', 'D', '2014-10-09 00:00:00', null, '20102|Plan 2010-2 SEP 432421|922|2014-10-01|2014-10-31|1');
INSERT INTO `bitacora` VALUES ('1166', 'planestudio', '9', 'D', '2014-10-09 00:00:00', null, '20103|VAMOS A VER|800|2014-10-01|2014-10-31|1');
INSERT INTO `bitacora` VALUES ('1167', 'planestudio', '9', 'D', '2014-10-09 00:00:00', null, '20104|Plan 2010-1 SEP 534523|500|2014-10-01|2014-10-31|1');
INSERT INTO `bitacora` VALUES ('1168', 'planestudio', '9', 'I', '2014-10-09 00:00:00', '20103|Plan 2010-2 SEP 432421|800|2014-10-01|2014-10-31|1', null);
INSERT INTO `bitacora` VALUES ('1169', 'plan_programa', '9', 'I', '2014-10-09 00:00:00', '20103|1', null);
INSERT INTO `bitacora` VALUES ('1170', 'plan_programa', '9', 'I', '2014-10-09 00:00:00', '20103|2', null);
INSERT INTO `bitacora` VALUES ('1171', 'plan_programa', '9', 'I', '2014-10-09 00:00:00', '20103|3', null);
INSERT INTO `bitacora` VALUES ('1172', 'plan_programa', '9', 'I', '2014-10-09 00:00:00', '20103|4', null);
INSERT INTO `bitacora` VALUES ('1173', 'plan_programa', '9', 'I', '2014-10-09 00:00:00', '20103|5', null);
INSERT INTO `bitacora` VALUES ('1174', 'plan_programa', '9', 'I', '2014-10-09 00:00:00', '20103|6', null);
INSERT INTO `bitacora` VALUES ('1175', 'plan_programa', '9', 'I', '2014-10-09 00:00:00', '20103|7', null);
INSERT INTO `bitacora` VALUES ('1176', 'planestudio', '9', 'I', '2014-10-09 00:00:00', '20101|Plan 2010-2 SEP 432421|800|2014-10-01|2014-10-31|1', null);
INSERT INTO `bitacora` VALUES ('1177', 'plan_programa', '9', 'I', '2014-10-09 00:00:00', '20101|1', null);
INSERT INTO `bitacora` VALUES ('1178', 'plan_programa', '9', 'I', '2014-10-09 00:00:00', '20101|2', null);
INSERT INTO `bitacora` VALUES ('1179', 'planestudio', '9', 'U', '2014-10-09 00:00:00', '20103|Plan 2010-2 SEP 432421|800|2014-10-01|2014-10-31|2', '20103|Plan 2010-2 SEP 432421|800|2014-10-01|2014-10-31|1');
INSERT INTO `bitacora` VALUES ('1180', 'plan_programa', '9', 'D', '2014-10-09 00:00:00', null, '20101|1');
INSERT INTO `bitacora` VALUES ('1181', 'plan_programa', '9', 'D', '2014-10-09 00:00:00', null, '20101|2');
INSERT INTO `bitacora` VALUES ('1182', 'plan_programa', '9', 'D', '2014-10-09 00:00:00', null, '20103|1');
INSERT INTO `bitacora` VALUES ('1183', 'plan_programa', '9', 'D', '2014-10-09 00:00:00', null, '20103|2');
INSERT INTO `bitacora` VALUES ('1184', 'plan_programa', '9', 'D', '2014-10-09 00:00:00', null, '20103|3');
INSERT INTO `bitacora` VALUES ('1185', 'plan_programa', '9', 'D', '2014-10-09 00:00:00', null, '20103|4');
INSERT INTO `bitacora` VALUES ('1186', 'plan_programa', '9', 'D', '2014-10-09 00:00:00', null, '20103|5');
INSERT INTO `bitacora` VALUES ('1187', 'plan_programa', '9', 'D', '2014-10-09 00:00:00', null, '20103|6');
INSERT INTO `bitacora` VALUES ('1188', 'plan_programa', '9', 'D', '2014-10-09 00:00:00', null, '20103|7');
INSERT INTO `bitacora` VALUES ('1189', 'planestudio', '9', 'D', '2014-10-09 00:00:00', null, '20101|Plan 2010-2 SEP 432421|800|2014-10-01|2014-10-31|1');
INSERT INTO `bitacora` VALUES ('1190', 'planestudio', '9', 'D', '2014-10-09 00:00:00', null, '20103|Plan 2010-2 SEP 432421|800|2014-10-01|2014-10-31|2');
INSERT INTO `bitacora` VALUES ('1191', 'planestudio', '9', 'I', '2014-10-09 00:00:00', '20101|Plan 2010-1 SEP 534523|700|2014-10-01|2014-10-31|1', null);
INSERT INTO `bitacora` VALUES ('1192', 'plan_programa', '9', 'I', '2014-10-09 00:00:00', '20101|1', null);
INSERT INTO `bitacora` VALUES ('1193', 'plan_programa', '9', 'I', '2014-10-09 00:00:00', '20101|2', null);
INSERT INTO `bitacora` VALUES ('1194', 'plan_programa', '9', 'I', '2014-10-09 00:00:00', '20101|3', null);
INSERT INTO `bitacora` VALUES ('1195', 'plan_programa', '9', 'I', '2014-10-09 00:00:00', '20101|4', null);
INSERT INTO `bitacora` VALUES ('1196', 'plan_programa', '9', 'I', '2014-10-09 00:00:00', '20101|5', null);
INSERT INTO `bitacora` VALUES ('1197', 'plan_programa', '9', 'I', '2014-10-09 00:00:00', '20101|6', null);
INSERT INTO `bitacora` VALUES ('1198', 'plan_programa', '9', 'I', '2014-10-09 00:00:00', '20101|7', null);
INSERT INTO `bitacora` VALUES ('1199', 'plan_programa', '9', 'D', '2014-10-09 00:00:00', null, '20101|1');
INSERT INTO `bitacora` VALUES ('1200', 'plan_programa', '9', 'D', '2014-10-09 00:00:00', null, '20101|2');
INSERT INTO `bitacora` VALUES ('1201', 'plan_programa', '9', 'D', '2014-10-09 00:00:00', null, '20101|3');
INSERT INTO `bitacora` VALUES ('1202', 'plan_programa', '9', 'D', '2014-10-09 00:00:00', null, '20101|4');
INSERT INTO `bitacora` VALUES ('1203', 'plan_programa', '9', 'D', '2014-10-09 00:00:00', null, '20101|5');
INSERT INTO `bitacora` VALUES ('1204', 'plan_programa', '9', 'D', '2014-10-09 00:00:00', null, '20101|6');
INSERT INTO `bitacora` VALUES ('1205', 'plan_programa', '9', 'D', '2014-10-09 00:00:00', null, '20101|7');
INSERT INTO `bitacora` VALUES ('1206', 'planestudio', '9', 'D', '2014-10-09 00:00:00', null, '20101|Plan 2010-1 SEP 534523|700|2014-10-01|2014-10-31|1');
INSERT INTO `bitacora` VALUES ('1207', 'planestudio', '9', 'I', '2014-10-09 00:00:00', '20092|Plan 2009-2 SEP 534523|800|2014-10-01|2014-10-31|1', null);
INSERT INTO `bitacora` VALUES ('1208', 'plan_programa', '9', 'I', '2014-10-09 00:00:00', '20092|1', null);
INSERT INTO `bitacora` VALUES ('1209', 'plan_programa', '9', 'I', '2014-10-09 00:00:00', '20092|2', null);
INSERT INTO `bitacora` VALUES ('1210', 'plan_programa', '9', 'I', '2014-10-09 00:00:00', '20092|3', null);
INSERT INTO `bitacora` VALUES ('1211', 'plan_programa', '9', 'I', '2014-10-09 00:00:00', '20092|4', null);
INSERT INTO `bitacora` VALUES ('1212', 'plan_programa', '9', 'I', '2014-10-09 00:00:00', '20092|5', null);
INSERT INTO `bitacora` VALUES ('1213', 'plan_programa', '9', 'I', '2014-10-09 00:00:00', '20092|6', null);
INSERT INTO `bitacora` VALUES ('1214', 'plan_programa', '9', 'I', '2014-10-09 00:00:00', '20092|7', null);
INSERT INTO `bitacora` VALUES ('1215', 'uaprendizaje', '10', 'I', '2014-10-09 00:00:00', '11236|MATEMATICAS|10|10|10|10|10|10|200|2014-10-09|VAMOS A VER|1|1|1|1|20092', null);
INSERT INTO `bitacora` VALUES ('1216', 'uaprendizaje', '10', 'D', '2014-10-09 00:00:00', null, '11236|MATEMATICAS|10|10|10|10|10|10|200|2014-10-09|VAMOS A VER|1|1|1|1|20092');
INSERT INTO `bitacora` VALUES ('1217', 'reqseriacion', '1', 'D', '2014-10-09 00:00:00', null, '1|SIN SERIACION');
INSERT INTO `bitacora` VALUES ('1218', 'reqseriacion', '1', 'U', '2014-10-09 00:00:00', '1|OBLIGATORIA', '2|OBLIGATORIA');
INSERT INTO `bitacora` VALUES ('1219', 'reqseriacion', '1', 'U', '2014-10-09 00:00:00', '2|SUGERIDA', '3|SUGERIDA');
INSERT INTO `bitacora` VALUES ('1220', 'uaprendizaje', '10', 'I', '2014-10-10 00:00:00', '11236|MATEMATICAS|10|10|10|10|10|10|100|2014-10-10|AFASDF|1|1|1|1|20092', null);
INSERT INTO `bitacora` VALUES ('1221', 'uaprendizaje', '9', 'I', '2014-10-13 00:00:00', '11237|asd|12|0|0|0|0|0|24|2014-10-13||1|1|1|20092', null);
INSERT INTO `bitacora` VALUES ('1222', 'p_ua', '9', 'I', '2014-10-13 00:00:00', '5|11237|1', null);
INSERT INTO `bitacora` VALUES ('1223', 'p_ua', '9', 'D', '2014-10-13 00:00:00', null, '5|11237|1');
INSERT INTO `bitacora` VALUES ('1224', 'uaprendizaje', '9', 'D', '2014-10-13 00:00:00', null, '11237|asd|12|0|0|0|0|0|24|2014-10-13||1|1|1|20092');
INSERT INTO `bitacora` VALUES ('1225', 'uaprendizaje', '9', 'I', '2014-10-13 00:00:00', '11237|ESPAÑOL|12|0|0|0|0|0|24|2014-10-13||1|1|1|20092', null);
INSERT INTO `bitacora` VALUES ('1226', 'p_ua', '9', 'I', '2014-10-13 00:00:00', '5|11237|1', null);
INSERT INTO `bitacora` VALUES ('1227', 'p_ua', '9', 'D', '2014-10-13 00:00:00', null, '5|11237|1');
INSERT INTO `bitacora` VALUES ('1228', 'uaprendizaje', '9', 'D', '2014-10-13 00:00:00', null, '11237|ESPAÑOL|12|0|0|0|0|0|24|2014-10-13||1|1|1|20092');
INSERT INTO `bitacora` VALUES ('1229', 'uaprendizaje', '9', 'I', '2014-10-13 00:00:00', '11237|ESPAÑOL|12|0|0|0|0|0|24|2014-10-13||1|1|1|20092', null);
INSERT INTO `bitacora` VALUES ('1230', 'p_ua', '9', 'I', '2014-10-13 00:00:00', '4|11237|1', null);
INSERT INTO `bitacora` VALUES ('1231', 'p_ua', '9', 'I', '2014-10-13 00:00:00', '5|11237|1', null);
INSERT INTO `bitacora` VALUES ('1232', 'p_ua', '9', 'I', '2014-10-13 00:00:00', '6|11237|1', null);
INSERT INTO `bitacora` VALUES ('1233', 'p_ua', '9', 'I', '2014-10-13 00:00:00', '7|11237|1', null);
INSERT INTO `bitacora` VALUES ('1234', 'p_ua', '9', 'D', '2014-10-13 00:00:00', null, '4|11237|1');
INSERT INTO `bitacora` VALUES ('1235', 'p_ua', '9', 'D', '2014-10-13 00:00:00', null, '5|11237|1');
INSERT INTO `bitacora` VALUES ('1236', 'p_ua', '9', 'D', '2014-10-13 00:00:00', null, '6|11237|1');
INSERT INTO `bitacora` VALUES ('1237', 'p_ua', '9', 'D', '2014-10-13 00:00:00', null, '7|11237|1');
INSERT INTO `bitacora` VALUES ('1238', 'uaprendizaje', '9', 'D', '2014-10-13 00:00:00', null, '11237|ESPAÑOL|12|0|0|0|0|0|24|2014-10-13||1|1|1|20092');
INSERT INTO `bitacora` VALUES ('1239', 'uaprendizaje', '9', 'I', '2014-10-13 00:00:00', '11237|ESPAÑOL|12|0|0|0|0|0|24|2014-10-13||1|1|1|20092', null);
INSERT INTO `bitacora` VALUES ('1240', 'p_ua', '9', 'I', '2014-10-13 00:00:00', '3|11237|1', null);
INSERT INTO `bitacora` VALUES ('1241', 'p_ua', '9', 'I', '2014-10-13 00:00:00', '4|11237|1', null);
INSERT INTO `bitacora` VALUES ('1242', 'p_ua', '9', 'I', '2014-10-13 00:00:00', '5|11237|1', null);
INSERT INTO `bitacora` VALUES ('1243', 'p_ua', '9', 'D', '2014-10-13 00:00:00', null, '3|11237|1');
INSERT INTO `bitacora` VALUES ('1244', 'p_ua', '9', 'D', '2014-10-13 00:00:00', null, '4|11237|1');
INSERT INTO `bitacora` VALUES ('1245', 'p_ua', '9', 'D', '2014-10-13 00:00:00', null, '5|11237|1');
INSERT INTO `bitacora` VALUES ('1246', 'uaprendizaje', '9', 'D', '2014-10-13 00:00:00', null, '11237|ESPAÑOL|12|0|0|0|0|0|24|2014-10-13||1|1|1|20092');
INSERT INTO `bitacora` VALUES ('1247', 'uaprendizaje', '9', 'I', '2014-10-13 00:00:00', '11237|ESPAÑOL|12|0|0|0|0|0|24|2014-10-13|vamosa ver|1|1|1|20092', null);
INSERT INTO `bitacora` VALUES ('1248', 'p_ua', '9', 'I', '2014-10-13 00:00:00', '5|11237|1', null);
INSERT INTO `bitacora` VALUES ('1249', 'detalleseriacion', '9', 'I', '2014-10-13 00:00:00', '11237|11236', null);
INSERT INTO `bitacora` VALUES ('1250', 'detalleseriacion', '9', 'I', '2014-10-13 00:00:00', '11237|11236', null);
INSERT INTO `bitacora` VALUES ('1251', 'detalleseriacion', '9', 'D', '2014-10-13 00:00:00', null, '11237|11236');
INSERT INTO `bitacora` VALUES ('1252', 'detalleseriacion', '9', 'D', '2014-10-13 00:00:00', null, '11237|11236');
INSERT INTO `bitacora` VALUES ('1254', 'p_ua', '9', 'D', '2014-10-13 00:00:00', null, '5|11237|1');
INSERT INTO `bitacora` VALUES ('1255', 'uaprendizaje', '9', 'D', '2014-10-13 00:00:00', null, '11237|ESPAÑOL|12|0|0|0|0|0|24|2014-10-13|vamosa ver|1|1|1|20092');
INSERT INTO `bitacora` VALUES ('1256', 'uaprendizaje', '9', 'I', '2014-10-13 00:00:00', '11237|ESPAÑOL|12|0|0|0|0|0|24|2014-10-13|agregate a la tabla jeje|1|1|1|20092', null);
INSERT INTO `bitacora` VALUES ('1257', 'p_ua', '9', 'I', '2014-10-13 00:00:00', '3|11237|1', null);
INSERT INTO `bitacora` VALUES ('1258', 'p_ua', '9', 'I', '2014-10-13 00:00:00', '5|11237|1', null);
INSERT INTO `bitacora` VALUES ('1259', 'p_ua', '9', 'D', '2014-10-13 00:00:00', null, '3|11237|1');
INSERT INTO `bitacora` VALUES ('1260', 'p_ua', '9', 'D', '2014-10-13 00:00:00', null, '5|11237|1');
INSERT INTO `bitacora` VALUES ('1261', 'uaprendizaje', '9', 'D', '2014-10-13 00:00:00', null, '11237|ESPAÑOL|12|0|0|0|0|0|24|2014-10-13|agregate a la tabla jeje|1|1|1|20092');
INSERT INTO `bitacora` VALUES ('1262', 'coordinaciona', '11', 'U', '2014-10-13 00:00:00', '1|LIC. EN CONTADURI|6', '1|COORD. CONTABILIDAD BASICA (LIC. EN CONTADURI|6');
INSERT INTO `bitacora` VALUES ('1263', 'coordinaciona', '11', 'U', '2014-10-13 00:00:00', '1|CONTABILIDAD BASICA|6', '1|LIC. EN CONTADURI|6');
INSERT INTO `bitacora` VALUES ('1264', 'coordinaciona', '11', 'U', '2014-10-13 00:00:00', '2|COORD. CONTABILIDAD AVANZADA|6', '2|COORD. CONTABILIDAD AVANZADA (LIC. EN CONTADU|6');
INSERT INTO `bitacora` VALUES ('1265', 'coordinaciona', '11', 'U', '2014-10-13 00:00:00', '2|CONTABILIDAD AVANZADA|6', '2|COORD. CONTABILIDAD AVANZADA|6');
INSERT INTO `bitacora` VALUES ('1266', 'coordinaciona', '11', 'U', '2014-10-13 00:00:00', '3|CONTABILIDAD DE COSTOS (LIC. EN CONTAD|6', '3|COORD. CONTABILIDAD DE COSTOS (LIC. EN CONTAD|6');
INSERT INTO `bitacora` VALUES ('1267', 'coordinaciona', '11', 'U', '2014-10-13 00:00:00', '4|FINANZAS (LIC. EN CONTADURIA)|6', '4|COORD. FINANZAS (LIC. EN CONTADURIA)|6');
INSERT INTO `bitacora` VALUES ('1268', 'coordinaciona', '11', 'U', '2014-10-13 00:00:00', '5|AIDITORIA (LIC. EN CONTADURIA)|6', '5|COORD. AIDITORIA (LIC. EN CONTADURIA)|6');
INSERT INTO `bitacora` VALUES ('1269', 'coordinaciona', '11', 'U', '2014-10-13 00:00:00', '6|IMPUESTOS (LIC. EN CONTADURIA)|6', '6|COORD. IMPUESTOS (LIC. EN CONTADURIA)|6');
INSERT INTO `bitacora` VALUES ('1270', 'coordinaciona', '11', 'U', '2014-10-13 00:00:00', '7|MERCADOTECNIA (LIC. EN ADMON. DE EMPRE|6', '7|COORD. MERCADOTECNIA (LIC. EN ADMON. DE EMPRE|6');
INSERT INTO `bitacora` VALUES ('1271', 'coordinaciona', '11', 'U', '2014-10-13 00:00:00', '8|RECURSOS HUMANOS|6', '8|COORD. RECURSOS HUMANOS (LIC. EN ADMON. DE EM|6');
INSERT INTO `bitacora` VALUES ('1272', 'coordinaciona', '11', 'U', '2014-10-13 00:00:00', '9|PRODUCCION (LIC. EN ADMON. DE EMPRESAS|6', '9|COORD. PRODUCCION (LIC. EN ADMON. DE EMPRESAS|6');
INSERT INTO `bitacora` VALUES ('1273', 'coordinaciona', '11', 'U', '2014-10-13 00:00:00', '10|ADMINISTRACION BASICA (LIC. EN ADMON. |6', '10|COORD. ADMINISTRACION BASICA (LIC. EN ADMON. |6');
INSERT INTO `bitacora` VALUES ('1274', 'coordinaciona', '11', 'U', '2014-10-13 00:00:00', '11|COORD. ADMINISTRACION AVANZADA|6', '11|COORD. ADMINISTRACION AVANZADA (LIC. EN ADMON|6');
INSERT INTO `bitacora` VALUES ('1275', 'coordinaciona', '11', 'U', '2014-10-13 00:00:00', '12|COORD. INFORMATICA|6', '12|COORD. INFORMATICA (LIC. EN INFORMATICA) |6');
INSERT INTO `bitacora` VALUES ('1276', 'coordinaciona', '11', 'U', '2014-10-13 00:00:00', '13|COORD. MATEMATICAS|6', '13|COORD. MATEMATICAS (LIC. EN INFORMATICA)|6');
INSERT INTO `bitacora` VALUES ('1277', 'coordinaciona', '11', 'U', '2014-10-13 00:00:00', '14|COORD. CIENCIAS COMPUTACIONALES|6', '14|COORD. CIENCIAS COMPUTACIONALES (LIC. EN INFO|6');
INSERT INTO `bitacora` VALUES ('1278', 'coordinaciona', '11', 'U', '2014-10-13 00:00:00', '15|COORD. SISTEMAS DE INFORMACION|6', '15|COORD. SISTEMAS DE INFORMACION (LIC. EN INFOR|6');
INSERT INTO `bitacora` VALUES ('1279', 'coordinaciona', '11', 'U', '2014-10-13 00:00:00', '16|COORD. PROGRAMACION|6', '16|COORD. PROGRAMACION (LIC. EN INFORMATICA)|6');
INSERT INTO `bitacora` VALUES ('1280', 'coordinaciona', '11', 'U', '2014-10-13 00:00:00', '17|COORD. ECONOMIA|6', '17|COORD. ECONOMIA (LIC. EN NEGOCIOS INTERNACION|6');
INSERT INTO `bitacora` VALUES ('1281', 'coordinaciona', '11', 'U', '2014-10-13 00:00:00', '18|COORD. COMERCIO EXTERIOR|6', '18|COORD. COMERCIO EXTERIOR (LIC. EN NEGOCIOS IN|6');
INSERT INTO `bitacora` VALUES ('1282', 'coordinaciona', '11', 'U', '2014-10-13 00:00:00', '19|COORD. DERECHO|6', '19|COORD. DERECHO (LIC. EN NEGOCIOS INTERNACIONA|6');
INSERT INTO `bitacora` VALUES ('1283', 'coordinaciona', '11', 'U', '2014-10-13 00:00:00', '20|COORD. EMPRENDEDORES|6', '20|COORD. EMPRENDEDORES(LIC. EN NEGOCIOS INTERNA|6');
INSERT INTO `bitacora` VALUES ('1284', 'coordinaciona', '11', 'U', '2014-10-13 00:00:00', '21|COORD. ASIGNATURAS DE APOYO|6', '21|COORD. ASIGNATURAS DE APOYO (LIC. EN NEGOCIOS|6');
INSERT INTO `bitacora` VALUES ('1285', 'coordinaciona', '11', 'U', '2014-10-13 00:00:00', '10|COORD.  ADMINISTRACION BASICA (LIC. EN ADMON. |6', '10|ADMINISTRACION BASICA (LIC. EN ADMON. |6');
INSERT INTO `bitacora` VALUES ('1286', 'coordinaciona', '11', 'U', '2014-10-13 00:00:00', '9|COORD. PRODUCCION (LIC. EN ADMON. DE EMPRESAS|6', '9|PRODUCCION (LIC. EN ADMON. DE EMPRESAS|6');
INSERT INTO `bitacora` VALUES ('1287', 'coordinaciona', '11', 'U', '2014-10-13 00:00:00', '8|COORD. RECURSOS HUMANOS|6', '8|RECURSOS HUMANOS|6');
INSERT INTO `bitacora` VALUES ('1288', 'coordinaciona', '11', 'U', '2014-10-13 00:00:00', '7|COORD. MERCADOTECNIA (LIC. EN ADMON. DE EMPRE|6', '7|MERCADOTECNIA (LIC. EN ADMON. DE EMPRE|6');
INSERT INTO `bitacora` VALUES ('1289', 'coordinaciona', '11', 'U', '2014-10-13 00:00:00', '6|COORD. IMPUESTOS (LIC. EN CONTADURIA)|6', '6|IMPUESTOS (LIC. EN CONTADURIA)|6');
INSERT INTO `bitacora` VALUES ('1290', 'coordinaciona', '11', 'U', '2014-10-13 00:00:00', '5|COORD. AUDITORIA|6', '5|AIDITORIA (LIC. EN CONTADURIA)|6');
INSERT INTO `bitacora` VALUES ('1291', 'coordinaciona', '11', 'U', '2014-10-13 00:00:00', '6|COORD. IMPUESTOS|6', '6|COORD. IMPUESTOS (LIC. EN CONTADURIA)|6');
INSERT INTO `bitacora` VALUES ('1292', 'coordinaciona', '11', 'U', '2014-10-13 00:00:00', '4|FINANZAS|6', '4|FINANZAS (LIC. EN CONTADURIA)|6');
INSERT INTO `bitacora` VALUES ('1293', 'coordinaciona', '11', 'U', '2014-10-13 00:00:00', '3|CONTABILIDAD DE COSTOS|6', '3|CONTABILIDAD DE COSTOS (LIC. EN CONTAD|6');
INSERT INTO `bitacora` VALUES ('1294', 'coordinaciona', '11', 'U', '2014-10-13 00:00:00', '4|COORD.  FINANZAS|6', '4|FINANZAS|6');
INSERT INTO `bitacora` VALUES ('1295', 'coordinaciona', '11', 'U', '2014-10-13 00:00:00', '3|COORD. CONTABILIDAD DE COSTOS|6', '3|CONTABILIDAD DE COSTOS|6');
INSERT INTO `bitacora` VALUES ('1296', 'coordinaciona', '11', 'U', '2014-10-13 00:00:00', '2|COORD. CONTABILIDAD AVANZADA|6', '2|CONTABILIDAD AVANZADA|6');
INSERT INTO `bitacora` VALUES ('1297', 'coordinaciona', '11', 'U', '2014-10-13 00:00:00', '1|COORD. CONTABILIDAD BASICA|6', '1|CONTABILIDAD BASICA|6');
INSERT INTO `bitacora` VALUES ('1298', 'coordinaciona', '11', 'U', '2014-10-13 00:00:00', '7|COORD. MERCADOTECNIA|6', '7|COORD. MERCADOTECNIA (LIC. EN ADMON. DE EMPRE|6');
INSERT INTO `bitacora` VALUES ('1299', 'coordinaciona', '11', 'U', '2014-10-13 00:00:00', '9|COORD. PRODUCCION|6', '9|COORD. PRODUCCION (LIC. EN ADMON. DE EMPRESAS|6');
INSERT INTO `bitacora` VALUES ('1300', 'coordinaciona', '11', 'U', '2014-10-13 00:00:00', '10|COORD.  ADMINISTRACION BASICA|6', '10|COORD.  ADMINISTRACION BASICA (LIC. EN ADMON. |6');
INSERT INTO `bitacora` VALUES ('1301', 'uaprendizaje', '9', 'I', '2014-10-13 00:00:00', '11237|CONTABILIDAD|12|0|0|0|0|0|24|2014-10-13||1|1|1|20092', null);
INSERT INTO `bitacora` VALUES ('1302', 'p_ua', '9', 'I', '2014-10-13 00:00:00', '3|11237|1', null);
INSERT INTO `bitacora` VALUES ('1303', 'p_ua', '9', 'I', '2014-10-13 00:00:00', '5|11237|1', null);
INSERT INTO `bitacora` VALUES ('1304', 'p_ua', '9', 'D', '2014-10-13 00:00:00', null, '3|11237|1');
INSERT INTO `bitacora` VALUES ('1305', 'p_ua', '9', 'D', '2014-10-13 00:00:00', null, '5|11237|1');
INSERT INTO `bitacora` VALUES ('1306', 'uaprendizaje', '9', 'D', '2014-10-13 00:00:00', null, '11237|CONTABILIDAD|12|0|0|0|0|0|24|2014-10-13||1|1|1|20092');
INSERT INTO `bitacora` VALUES ('1307', 'uaprendizaje', '9', 'I', '2014-10-13 00:00:00', '11237|ESPAÑOL|12|0|0|0|0|0|24|2014-10-13||1|1|1|20092', null);
INSERT INTO `bitacora` VALUES ('1308', 'p_ua', '9', 'I', '2014-10-13 00:00:00', '3|11237|1', null);
INSERT INTO `bitacora` VALUES ('1309', 'p_ua', '9', 'I', '2014-10-13 00:00:00', '5|11237|1', null);
INSERT INTO `bitacora` VALUES ('1310', 'p_ua', '9', 'D', '2014-10-13 00:00:00', null, '3|11237|1');
INSERT INTO `bitacora` VALUES ('1311', 'p_ua', '9', 'D', '2014-10-13 00:00:00', null, '5|11237|1');
INSERT INTO `bitacora` VALUES ('1312', 'uaprendizaje', '9', 'D', '2014-10-13 00:00:00', null, '11237|ESPAÑOL|12|0|0|0|0|0|24|2014-10-13||1|1|1|20092');
INSERT INTO `bitacora` VALUES ('1313', 'uaprendizaje', '9', 'I', '2014-10-13 00:00:00', '11237|ESPAÑOL|10|0|0|0|0|0|20|2014-10-13|SIN SERIACIONES|1|1|1|20092', null);
INSERT INTO `bitacora` VALUES ('1314', 'p_ua', '9', 'I', '2014-10-13 00:00:00', '3|11237|1', null);
INSERT INTO `bitacora` VALUES ('1315', 'p_ua', '9', 'I', '2014-10-13 00:00:00', '5|11237|1', null);
INSERT INTO `bitacora` VALUES ('1316', 'uaprendizaje', '9', 'I', '2014-10-13 00:00:00', '11238|CIVISMO|5|0|0|0|0|0|10|2014-10-13||1|1|2|20092', null);
INSERT INTO `bitacora` VALUES ('1317', 'p_ua', '9', 'I', '2014-10-13 00:00:00', '3|11238|1', null);
INSERT INTO `bitacora` VALUES ('1318', 'p_ua', '9', 'I', '2014-10-13 00:00:00', '5|11238|1', null);
INSERT INTO `bitacora` VALUES ('1319', 'detalleseriacion', '9', 'I', '2014-10-13 00:00:00', '11238|11236', null);
INSERT INTO `bitacora` VALUES ('1320', 'detalleseriacion', '9', 'I', '2014-10-13 00:00:00', '11238|11237', null);
INSERT INTO `bitacora` VALUES ('1321', 'p_ua', '9', 'D', '2014-10-13 00:00:00', null, '3|11237|1');
INSERT INTO `bitacora` VALUES ('1322', 'p_ua', '9', 'D', '2014-10-13 00:00:00', null, '3|11238|1');
INSERT INTO `bitacora` VALUES ('1323', 'p_ua', '9', 'D', '2014-10-13 00:00:00', null, '5|11237|1');
INSERT INTO `bitacora` VALUES ('1324', 'p_ua', '9', 'D', '2014-10-13 00:00:00', null, '5|11238|1');
INSERT INTO `bitacora` VALUES ('1325', 'detalleseriacion', '9', 'D', '2014-10-13 00:00:00', null, '11238|11236');
INSERT INTO `bitacora` VALUES ('1326', 'detalleseriacion', '9', 'D', '2014-10-13 00:00:00', null, '11238|11237');
INSERT INTO `bitacora` VALUES ('1327', 'uaprendizaje', '9', 'D', '2014-10-13 00:00:00', null, '11238|CIVISMO|5|0|0|0|0|0|10|2014-10-13||1|1|2|20092');
INSERT INTO `bitacora` VALUES ('1328', 'uaprendizaje', '9', 'D', '2014-10-13 00:00:00', null, '11237|ESPAÑOL|10|0|0|0|0|0|20|2014-10-13|SIN SERIACIONES|1|1|1|20092');
INSERT INTO `bitacora` VALUES ('1329', 'uaprendizaje', '9', 'I', '2014-10-13 00:00:00', '11237|ESPAÑOL|10|0|0|0|0|0|20|2014-10-13||1|1|1|20092', null);
INSERT INTO `bitacora` VALUES ('1330', 'p_ua', '9', 'I', '2014-10-13 00:00:00', '3|11237|1', null);
INSERT INTO `bitacora` VALUES ('1331', 'p_ua', '9', 'I', '2014-10-13 00:00:00', '5|11237|1', null);
INSERT INTO `bitacora` VALUES ('1332', 'detalleseriacion', '9', 'I', '2014-10-13 00:00:00', '11237|11236', null);
INSERT INTO `bitacora` VALUES ('1333', 'coordinaciona', '11', 'U', '2014-10-13 00:00:00', '1|CONTABILIDAD BASICA|6', '1|COORD. CONTABILIDAD BASICA|6');
INSERT INTO `bitacora` VALUES ('1334', 'coordinaciona', '11', 'U', '2014-10-13 00:00:00', '2|CONTABILIDAD AVANZADA|6', '2|COORD. CONTABILIDAD AVANZADA|6');
INSERT INTO `bitacora` VALUES ('1335', 'coordinaciona', '11', 'U', '2014-10-13 00:00:00', '3|CONTABILIDAD DE COSTOS|6', '3|COORD. CONTABILIDAD DE COSTOS|6');
INSERT INTO `bitacora` VALUES ('1336', 'coordinaciona', '11', 'U', '2014-10-13 00:00:00', '4|FINANZAS|6', '4|COORD.  FINANZAS|6');
INSERT INTO `bitacora` VALUES ('1337', 'coordinaciona', '11', 'U', '2014-10-13 00:00:00', '5|AUDITORIA|6', '5|COORD. AUDITORIA|6');
INSERT INTO `bitacora` VALUES ('1338', 'coordinaciona', '11', 'U', '2014-10-13 00:00:00', '6|IMPUESTOS|6', '6|COORD. IMPUESTOS|6');
INSERT INTO `bitacora` VALUES ('1339', 'coordinaciona', '11', 'U', '2014-10-13 00:00:00', '7|MERCADOTECNIA|6', '7|COORD. MERCADOTECNIA|6');
INSERT INTO `bitacora` VALUES ('1340', 'coordinaciona', '11', 'U', '2014-10-13 00:00:00', '8|RECURSOS HUMANOS|6', '8|COORD. RECURSOS HUMANOS|6');
INSERT INTO `bitacora` VALUES ('1341', 'coordinaciona', '11', 'U', '2014-10-13 00:00:00', '9|PRODUCCION|6', '9|COORD. PRODUCCION|6');
INSERT INTO `bitacora` VALUES ('1342', 'coordinaciona', '11', 'U', '2014-10-13 00:00:00', '10|ADMINISTRACION BASICA|6', '10|COORD.  ADMINISTRACION BASICA|6');
INSERT INTO `bitacora` VALUES ('1343', 'coordinaciona', '11', 'U', '2014-10-13 00:00:00', '11|ADMINISTRACION AVANZADA|6', '11|COORD. ADMINISTRACION AVANZADA|6');
INSERT INTO `bitacora` VALUES ('1344', 'coordinaciona', '11', 'U', '2014-10-13 00:00:00', '12|INFORMATICA|6', '12|COORD. INFORMATICA|6');
INSERT INTO `bitacora` VALUES ('1345', 'coordinaciona', '11', 'U', '2014-10-13 00:00:00', '13|MATEMATICAS|6', '13|COORD. MATEMATICAS|6');
INSERT INTO `bitacora` VALUES ('1346', 'coordinaciona', '11', 'U', '2014-10-13 00:00:00', '14|CIENCIAS COMPUTACIONALES|6', '14|COORD. CIENCIAS COMPUTACIONALES|6');
INSERT INTO `bitacora` VALUES ('1347', 'coordinaciona', '11', 'U', '2014-10-13 00:00:00', '15|SISTEMAS DE INFORMACION|6', '15|COORD. SISTEMAS DE INFORMACION|6');
INSERT INTO `bitacora` VALUES ('1348', 'coordinaciona', '11', 'U', '2014-10-13 00:00:00', '16|PROGRAMACION|6', '16|COORD. PROGRAMACION|6');
INSERT INTO `bitacora` VALUES ('1349', 'coordinaciona', '11', 'U', '2014-10-13 00:00:00', '17|ECONOMIA|6', '17|COORD. ECONOMIA|6');
INSERT INTO `bitacora` VALUES ('1350', 'coordinaciona', '11', 'U', '2014-10-13 00:00:00', '18|COMERCIO EXTERIOR|6', '18|COORD. COMERCIO EXTERIOR|6');
INSERT INTO `bitacora` VALUES ('1351', 'coordinaciona', '11', 'U', '2014-10-13 00:00:00', '19|DERECHO|6', '19|COORD. DERECHO|6');
INSERT INTO `bitacora` VALUES ('1352', 'coordinaciona', '11', 'U', '2014-10-13 00:00:00', '20|EMPRENDEDORES|6', '20|COORD. EMPRENDEDORES|6');
INSERT INTO `bitacora` VALUES ('1353', 'coordinaciona', '11', 'U', '2014-10-13 00:00:00', '21|ASIGNATURAS DE APOYO|6', '21|COORD. ASIGNATURAS DE APOYO|6');
INSERT INTO `bitacora` VALUES ('1354', 'uaprendizaje', '9', 'I', '2014-10-13 00:00:00', '11238|CIVISMO|4|0|0|0|0|0|8|2014-10-13||1|1|5|20092', null);
INSERT INTO `bitacora` VALUES ('1355', 'p_ua', '9', 'I', '2014-10-13 00:00:00', '3|11238|1', null);
INSERT INTO `bitacora` VALUES ('1356', 'p_ua', '9', 'I', '2014-10-13 00:00:00', '5|11238|1', null);
INSERT INTO `bitacora` VALUES ('1357', 'detalleseriacion', '9', 'I', '2014-10-13 00:00:00', '11238|11236', null);
INSERT INTO `bitacora` VALUES ('1358', 'detalleseriacion', '9', 'I', '2014-10-13 00:00:00', '11238|11237', null);
INSERT INTO `bitacora` VALUES ('1359', 'p_ua', '9', 'I', '2014-10-13 00:00:00', '3|11236|1', null);
INSERT INTO `bitacora` VALUES ('1360', 'uaprendizaje', '9', 'I', '2014-10-13 00:00:00', '11239|BIOLOGÍA|5|0|0|0|0|0|10|2014-10-13||1|1|5|20092', null);
INSERT INTO `bitacora` VALUES ('1361', 'p_ua', '9', 'I', '2014-10-13 00:00:00', '5|11239|1', null);
INSERT INTO `bitacora` VALUES ('1362', 'detalleseriacion', '9', 'I', '2014-10-13 00:00:00', '11239|11236', null);
INSERT INTO `bitacora` VALUES ('1363', 'uaprendizaje', '9', 'I', '2014-10-13 00:00:00', '11240|GEOGRAFÍA|2|0|0|0|0|0|4|2014-10-13||1|1|4|20092', null);
INSERT INTO `bitacora` VALUES ('1364', 'p_ua', '9', 'I', '2014-10-13 00:00:00', '5|11240|1', null);
INSERT INTO `bitacora` VALUES ('1365', 'detalleseriacion', '9', 'I', '2014-10-13 00:00:00', '11240|11237', null);
INSERT INTO `bitacora` VALUES ('1366', 'uaprendizaje', '9', 'I', '2014-10-13 00:00:00', '11241|EDUCACIÓN FÍSICA|4|0|0|0|0|0|8|2014-10-13||1|1|3|20092', null);
INSERT INTO `bitacora` VALUES ('1367', 'p_ua', '9', 'I', '2014-10-13 00:00:00', '5|11241|1', null);
INSERT INTO `bitacora` VALUES ('1368', 'uaprendizaje', '9', 'I', '2014-10-13 00:00:00', '11242|AHHH|6|0|0|0|0|0|12|2014-10-13||1|1|3|20092', null);
INSERT INTO `bitacora` VALUES ('1369', 'p_ua', '9', 'I', '2014-10-13 00:00:00', '5|11242|1', null);
INSERT INTO `bitacora` VALUES ('1370', 'p_ua', '9', 'D', '2014-10-13 00:00:00', null, '5|11242|1');
INSERT INTO `bitacora` VALUES ('1371', 'uaprendizaje', '9', 'D', '2014-10-13 00:00:00', null, '11242|AHHH|6|0|0|0|0|0|12|2014-10-13||1|1|3|20092');
INSERT INTO `bitacora` VALUES ('1372', 'uaprendizaje', '9', 'U', '2014-10-13 00:00:00', '11238|CIVISMO|4|0|0|0|0|0|8|2014-10-13||0|1|5|20092', '11238|CIVISMO|4|0|0|0|0|0|8|2014-10-13||1|1|5|20092');
INSERT INTO `bitacora` VALUES ('1373', 'p_ua', '9', 'D', '2014-10-13 00:00:00', null, '3|11238|1');
INSERT INTO `bitacora` VALUES ('1374', 'p_ua', '9', 'D', '2014-10-13 00:00:00', null, '5|11238|1');
INSERT INTO `bitacora` VALUES ('1375', 'detalleseriacion', '9', 'D', '2014-10-13 00:00:00', null, '11237|11236');
INSERT INTO `bitacora` VALUES ('1376', 'detalleseriacion', '9', 'D', '2014-10-13 00:00:00', null, '11238|11236');
INSERT INTO `bitacora` VALUES ('1377', 'detalleseriacion', '9', 'D', '2014-10-13 00:00:00', null, '11238|11237');
INSERT INTO `bitacora` VALUES ('1378', 'detalleseriacion', '9', 'D', '2014-10-13 00:00:00', null, '11239|11236');
INSERT INTO `bitacora` VALUES ('1379', 'detalleseriacion', '9', 'D', '2014-10-13 00:00:00', null, '11240|11237');
INSERT INTO `bitacora` VALUES ('1380', 'p_ua', '9', 'D', '2014-10-13 00:00:00', null, '3|11236|1');
INSERT INTO `bitacora` VALUES ('1381', 'p_ua', '9', 'D', '2014-10-13 00:00:00', null, '3|11237|1');
INSERT INTO `bitacora` VALUES ('1382', 'p_ua', '9', 'D', '2014-10-13 00:00:00', null, '5|11237|1');
INSERT INTO `bitacora` VALUES ('1383', 'p_ua', '9', 'D', '2014-10-13 00:00:00', null, '5|11239|1');
INSERT INTO `bitacora` VALUES ('1384', 'p_ua', '9', 'D', '2014-10-13 00:00:00', null, '5|11240|1');
INSERT INTO `bitacora` VALUES ('1385', 'p_ua', '9', 'D', '2014-10-13 00:00:00', null, '5|11241|1');
INSERT INTO `bitacora` VALUES ('1386', 'uaprendizaje', '10', 'D', '2014-10-13 00:00:00', null, '11236|MATEMATICAS|10|10|10|10|10|10|100|2014-10-10|AFASDF|1|1|1|20092');
INSERT INTO `bitacora` VALUES ('1387', 'uaprendizaje', '9', 'D', '2014-10-13 00:00:00', null, '11237|ESPAÑOL|10|0|0|0|0|0|20|2014-10-13||1|1|1|20092');
INSERT INTO `bitacora` VALUES ('1388', 'uaprendizaje', '9', 'D', '2014-10-13 00:00:00', null, '11238|CIVISMO|4|0|0|0|0|0|8|2014-10-13||0|1|5|20092');
INSERT INTO `bitacora` VALUES ('1389', 'uaprendizaje', '9', 'D', '2014-10-13 00:00:00', null, '11239|BIOLOGÍA|5|0|0|0|0|0|10|2014-10-13||1|1|5|20092');
INSERT INTO `bitacora` VALUES ('1390', 'uaprendizaje', '9', 'D', '2014-10-13 00:00:00', null, '11240|GEOGRAFÍA|2|0|0|0|0|0|4|2014-10-13||1|1|4|20092');
INSERT INTO `bitacora` VALUES ('1391', 'uaprendizaje', '9', 'D', '2014-10-13 00:00:00', null, '11241|EDUCACIÓN FÍSICA|4|0|0|0|0|0|8|2014-10-13||1|1|3|20092');
INSERT INTO `bitacora` VALUES ('1392', 'uaprendizaje', '9', 'I', '2014-10-13 00:00:00', '11236|MATEMÁTICAS|10|0|0|0|0|0|20|2014-10-14|vamos a ver|1|1|1|20092', null);
INSERT INTO `bitacora` VALUES ('1393', 'p_ua', '9', 'I', '2014-10-13 00:00:00', '5|11236|1', null);
INSERT INTO `bitacora` VALUES ('1394', 'uaprendizaje', '9', 'I', '2014-10-13 00:00:00', '11237|MATEMÁTICAS II|2|0|0|0|0|0|4|2014-10-14|vamos a ver|1|1|1|20092', null);
INSERT INTO `bitacora` VALUES ('1395', 'p_ua', '9', 'I', '2014-10-13 00:00:00', '5|11237|1', null);
INSERT INTO `bitacora` VALUES ('1396', 'detalleseriacion', '9', 'I', '2014-10-13 00:00:00', '11237|11236', null);
INSERT INTO `bitacora` VALUES ('1397', 'uaprendizaje', '9', 'I', '2014-10-13 00:00:00', '11238|MATEMÁTICAS COMPUTADORA|5|0|0|0|0|0|10|2014-10-14||1|1|2|20092', null);
INSERT INTO `bitacora` VALUES ('1398', 'p_ua', '9', 'I', '2014-10-13 00:00:00', '5|11238|1', null);
INSERT INTO `bitacora` VALUES ('1399', 'detalleseriacion', '9', 'I', '2014-10-13 00:00:00', '11238|11236', null);
INSERT INTO `bitacora` VALUES ('1400', 'detalleseriacion', '9', 'I', '2014-10-13 00:00:00', '11238|11237', null);
INSERT INTO `bitacora` VALUES ('1401', 'p_ua', '9', 'D', '2014-10-13 00:00:00', null, '5|11238|1');
INSERT INTO `bitacora` VALUES ('1402', 'p_ua', '9', 'D', '2014-10-13 00:00:00', null, '5|11237|1');
INSERT INTO `bitacora` VALUES ('1403', 'p_ua', '9', 'D', '2014-10-13 00:00:00', null, '5|11236|1');
INSERT INTO `bitacora` VALUES ('1404', 'programaedu', '9', 'U', '2014-10-13 00:00:00', '1|ARTES|1|2|1|1|1', '1|ARTES|1|2|1|1|1');
INSERT INTO `bitacora` VALUES ('1405', 'programaedu', '9', 'U', '2014-10-13 00:00:00', '2|ADMON. DE EMPRESAS|1|2|1|1|1', '2|ADMON. DE EMPRESAS|1|2|1|1|1');
INSERT INTO `bitacora` VALUES ('1406', 'programaedu', '9', 'U', '2014-10-13 00:00:00', '3|INFORMATICA|1|3|1|1|1', '3|INFORMATICA|1|3|1|1|1');
INSERT INTO `bitacora` VALUES ('1407', 'programaedu', '9', 'U', '2014-10-13 00:00:00', '4|NEGOCIOS INTERNACIONALES|1|4|1|1|1', '4|NEGOCIOS INTERNACIONALES|1|4|1|1|1');
INSERT INTO `bitacora` VALUES ('1408', 'programaedu', '9', 'U', '2014-10-13 00:00:00', '5|CONTADURIA|1|4|1|1|1', '5|CONTADURIA|1|4|1|1|1');
INSERT INTO `bitacora` VALUES ('1409', 'programaedu', '9', 'U', '2014-10-13 00:00:00', '6|TRONCO COMUN|1|4|1|1|1', '6|TRONCO COMUN|1|4|1|1|1');
INSERT INTO `bitacora` VALUES ('1410', 'programaedu', '9', 'U', '2014-10-13 00:00:00', '7|SISTEMAS COMPUTACIONALES|1|2|1|1|1', '7|SISTEMAS COMPUTACIONALES|1|2|1|1|1');
INSERT INTO `bitacora` VALUES ('1411', 'detalleseriacion', '9', 'D', '2014-10-13 00:00:00', null, '11237|11236');
INSERT INTO `bitacora` VALUES ('1412', 'detalleseriacion', '9', 'D', '2014-10-13 00:00:00', null, '11238|11236');
INSERT INTO `bitacora` VALUES ('1413', 'detalleseriacion', '9', 'D', '2014-10-13 00:00:00', null, '11238|11237');
INSERT INTO `bitacora` VALUES ('1414', 'uaprendizaje', '9', 'D', '2014-10-13 00:00:00', null, '11236|MATEMÁTICAS|10|0|0|0|0|0|20|2014-10-14|vamos a ver|1|1|1|20092');
INSERT INTO `bitacora` VALUES ('1415', 'uaprendizaje', '9', 'D', '2014-10-13 00:00:00', null, '11237|MATEMÁTICAS II|2|0|0|0|0|0|4|2014-10-14|vamos a ver|1|1|1|20092');
INSERT INTO `bitacora` VALUES ('1416', 'uaprendizaje', '9', 'D', '2014-10-13 00:00:00', null, '11238|MATEMÁTICAS COMPUTADORA|5|0|0|0|0|0|10|2014-10-14||1|1|2|20092');
INSERT INTO `bitacora` VALUES ('1417', 'uaprendizaje', '9', 'I', '2014-10-13 00:00:00', '11236|MATEMÁTICAS|12|0|0|0|0|0|24|2014-10-14|vamos a ver|1|1|1|20092', null);
INSERT INTO `bitacora` VALUES ('1418', 'p_ua', '9', 'I', '2014-10-13 00:00:00', '5|11236|1', null);
INSERT INTO `bitacora` VALUES ('1419', 'uaprendizaje', '9', 'I', '2014-10-13 00:00:00', '11237|MATEMATICAS II|2|0|0|0|0|0|4|2014-10-14||1|1|1|20092', null);
INSERT INTO `bitacora` VALUES ('1420', 'p_ua', '9', 'I', '2014-10-13 00:00:00', '5|11237|1', null);
INSERT INTO `bitacora` VALUES ('1421', 'detalleseriacion', '9', 'I', '2014-10-13 00:00:00', '11237|11236', null);
INSERT INTO `bitacora` VALUES ('1422', 'uaprendizaje', '9', 'I', '2014-10-13 00:00:00', '11238|MATEMATICAS OPERATIVAS|3|0|0|0|0|0|6|2014-10-14|vamos a ver|1|1|3|20092', null);
INSERT INTO `bitacora` VALUES ('1423', 'p_ua', '9', 'I', '2014-10-13 00:00:00', '5|11238|1', null);
INSERT INTO `bitacora` VALUES ('1424', 'detalleseriacion', '9', 'I', '2014-10-13 00:00:00', '11238|11236', null);
INSERT INTO `bitacora` VALUES ('1425', 'detalleseriacion', '9', 'I', '2014-10-13 00:00:00', '11238|11237', null);
INSERT INTO `bitacora` VALUES ('1426', 'p_ua', '9', 'D', '2014-10-13 00:00:00', null, '5|11238|1');
INSERT INTO `bitacora` VALUES ('1427', 'detalleseriacion', '9', 'D', '2014-10-13 00:00:00', null, '11238|11237');
INSERT INTO `bitacora` VALUES ('1428', 'detalleseriacion', '9', 'D', '2014-10-13 00:00:00', null, '11238|11236');
INSERT INTO `bitacora` VALUES ('1429', 'p_ua', '9', 'I', '2014-10-13 00:00:00', '5|11238|1', null);
INSERT INTO `bitacora` VALUES ('1430', 'detalleseriacion', '9', 'I', '2014-10-13 00:00:00', '11238|11236', null);
INSERT INTO `bitacora` VALUES ('1431', 'detalleseriacion', '9', 'I', '2014-10-13 00:00:00', '11238|11237', null);
INSERT INTO `bitacora` VALUES ('1432', 'p_ua', '9', 'D', '2014-10-13 00:00:00', null, '5|11238|1');
INSERT INTO `bitacora` VALUES ('1433', 'p_ua', '9', 'I', '2014-10-13 00:00:00', '5|11238|1', null);
INSERT INTO `bitacora` VALUES ('1434', 'detalleseriacion', '9', 'D', '2014-10-13 00:00:00', null, '11238|11237');
INSERT INTO `bitacora` VALUES ('1435', 'detalleseriacion', '9', 'D', '2014-10-13 00:00:00', null, '11238|11236');
INSERT INTO `bitacora` VALUES ('1436', 'detalleseriacion', '9', 'I', '2014-10-13 00:00:00', '11238|11236', null);
INSERT INTO `bitacora` VALUES ('1437', 'detalleseriacion', '9', 'I', '2014-10-13 00:00:00', '11238|11237', null);
INSERT INTO `bitacora` VALUES ('1438', 'p_ua', '9', 'D', '2014-10-13 00:00:00', null, '5|11238|1');
INSERT INTO `bitacora` VALUES ('1439', 'p_ua', '9', 'I', '2014-10-13 00:00:00', '5|11238|1', null);
INSERT INTO `bitacora` VALUES ('1440', 'p_ua', '9', 'D', '2014-10-13 00:00:00', null, '5|11238|1');
INSERT INTO `bitacora` VALUES ('1441', 'p_ua', '9', 'I', '2014-10-13 00:00:00', '5|11238|1', null);
INSERT INTO `bitacora` VALUES ('1442', 'p_ua', '9', 'D', '2014-10-13 00:00:00', null, '5|11238|1');
INSERT INTO `bitacora` VALUES ('1443', 'p_ua', '9', 'I', '2014-10-13 00:00:00', '5|11238|1', null);
INSERT INTO `bitacora` VALUES ('1444', 'p_ua', '9', 'D', '2014-10-13 00:00:00', null, '5|11238|1');
INSERT INTO `bitacora` VALUES ('1445', 'p_ua', '9', 'I', '2014-10-13 00:00:00', '5|11238|1', null);
INSERT INTO `bitacora` VALUES ('1446', 'p_ua', '9', 'D', '2014-10-13 00:00:00', null, '5|11238|1');
INSERT INTO `bitacora` VALUES ('1447', 'p_ua', '9', 'I', '2014-10-13 00:00:00', '5|11238|1', null);
INSERT INTO `bitacora` VALUES ('1448', 'p_ua', '9', 'D', '2014-10-13 00:00:00', null, '5|11238|1');
INSERT INTO `bitacora` VALUES ('1449', 'p_ua', '9', 'I', '2014-10-13 00:00:00', '5|11238|1', null);
INSERT INTO `bitacora` VALUES ('1450', 'detalleseriacion', '9', 'D', '2014-10-13 00:00:00', null, '11238|11236');
INSERT INTO `bitacora` VALUES ('1451', 'detalleseriacion', '9', 'D', '2014-10-13 00:00:00', null, '11238|11237');
INSERT INTO `bitacora` VALUES ('1452', 'p_ua', '9', 'D', '2014-10-13 00:00:00', null, '5|11238|1');
INSERT INTO `bitacora` VALUES ('1453', 'p_ua', '9', 'I', '2014-10-13 00:00:00', '5|11238|1', null);
INSERT INTO `bitacora` VALUES ('1454', 'p_ua', '9', 'D', '2014-10-13 00:00:00', null, '5|11238|1');
INSERT INTO `bitacora` VALUES ('1455', 'p_ua', '9', 'I', '2014-10-13 00:00:00', '5|11238|1', null);
INSERT INTO `bitacora` VALUES ('1456', 'detalleseriacion', '9', 'I', '2014-10-13 00:00:00', '11238|11237', null);
INSERT INTO `bitacora` VALUES ('1457', 'p_ua', '9', 'D', '2014-10-13 00:00:00', null, '5|11238|1');
INSERT INTO `bitacora` VALUES ('1458', 'p_ua', '9', 'I', '2014-10-13 00:00:00', '5|11238|1', null);
INSERT INTO `bitacora` VALUES ('1459', 'detalleseriacion', '9', 'D', '2014-10-13 00:00:00', null, '11238|11237');
INSERT INTO `bitacora` VALUES ('1460', 'detalleseriacion', '9', 'I', '2014-10-13 00:00:00', '11238|11236', null);
INSERT INTO `bitacora` VALUES ('1461', 'p_ua', '9', 'D', '2014-10-13 00:00:00', null, '5|11238|1');
INSERT INTO `bitacora` VALUES ('1462', 'p_ua', '9', 'I', '2014-10-13 00:00:00', '5|11238|1', null);
INSERT INTO `bitacora` VALUES ('1463', 'detalleseriacion', '9', 'D', '2014-10-13 00:00:00', null, '11238|11236');
INSERT INTO `bitacora` VALUES ('1464', 'detalleseriacion', '9', 'I', '2014-10-13 00:00:00', '11238|11237', null);
INSERT INTO `bitacora` VALUES ('1465', 'p_ua', '9', 'D', '2014-10-13 00:00:00', null, '5|11238|1');
INSERT INTO `bitacora` VALUES ('1466', 'p_ua', '9', 'I', '2014-10-13 00:00:00', '5|11238|1', null);
INSERT INTO `bitacora` VALUES ('1467', 'detalleseriacion', '9', 'D', '2014-10-13 00:00:00', null, '11238|11237');
INSERT INTO `bitacora` VALUES ('1468', 'p_ua', '9', 'D', '2014-10-13 00:00:00', null, '5|11238|1');
INSERT INTO `bitacora` VALUES ('1469', 'p_ua', '9', 'I', '2014-10-13 00:00:00', '5|11238|1', null);
INSERT INTO `bitacora` VALUES ('1470', 'detalleseriacion', '9', 'I', '2014-10-13 00:00:00', '11238|11237', null);
INSERT INTO `bitacora` VALUES ('1471', 'p_ua', '9', 'D', '2014-10-13 00:00:00', null, '5|11238|1');
INSERT INTO `bitacora` VALUES ('1472', 'p_ua', '9', 'I', '2014-10-13 00:00:00', '5|11238|1', null);
INSERT INTO `bitacora` VALUES ('1473', 'detalleseriacion', '9', 'D', '2014-10-13 00:00:00', null, '11238|11237');
INSERT INTO `bitacora` VALUES ('1474', 'detalleseriacion', '9', 'I', '2014-10-13 00:00:00', '11238|11236', null);
INSERT INTO `bitacora` VALUES ('1475', 'p_ua', '9', 'D', '2014-10-13 00:00:00', null, '5|11238|1');
INSERT INTO `bitacora` VALUES ('1476', 'p_ua', '9', 'I', '2014-10-13 00:00:00', '5|11238|1', null);
INSERT INTO `bitacora` VALUES ('1477', 'detalleseriacion', '9', 'D', '2014-10-13 00:00:00', null, '11238|11236');
INSERT INTO `bitacora` VALUES ('1478', 'detalleseriacion', '9', 'I', '2014-10-13 00:00:00', '11238|11236', null);
INSERT INTO `bitacora` VALUES ('1479', 'detalleseriacion', '9', 'I', '2014-10-13 00:00:00', '11238|11237', null);
INSERT INTO `bitacora` VALUES ('1480', 'p_ua', '9', 'D', '2014-10-13 00:00:00', null, '5|11238|1');
INSERT INTO `bitacora` VALUES ('1481', 'p_ua', '9', 'I', '2014-10-13 00:00:00', '5|11238|1', null);
INSERT INTO `bitacora` VALUES ('1482', 'detalleseriacion', '9', 'D', '2014-10-13 00:00:00', null, '11238|11236');
INSERT INTO `bitacora` VALUES ('1483', 'detalleseriacion', '9', 'D', '2014-10-13 00:00:00', null, '11238|11237');
INSERT INTO `bitacora` VALUES ('1484', 'detalleseriacion', '9', 'I', '2014-10-13 00:00:00', '11238|11236', null);
INSERT INTO `bitacora` VALUES ('1485', 'detalleseriacion', '9', 'I', '2014-10-13 00:00:00', '11238|11237', null);
INSERT INTO `bitacora` VALUES ('1486', 'p_ua', '9', 'D', '2014-10-13 00:00:00', null, '5|11238|1');
INSERT INTO `bitacora` VALUES ('1487', 'p_ua', '9', 'I', '2014-10-13 00:00:00', '5|11238|1', null);
INSERT INTO `bitacora` VALUES ('1488', 'uaprendizaje', '9', 'U', '2014-10-13 00:00:00', '11238|MATEMATICAS descriptivas|3|0|0|0|0|0|6|2014-10-14|vamos a ver|1|1|3|20092', '11238|MATEMATICAS OPERATIVAS|3|0|0|0|0|0|6|2014-10-14|vamos a ver|1|1|3|20092');
INSERT INTO `bitacora` VALUES ('1489', 'detalleseriacion', '9', 'D', '2014-10-13 00:00:00', null, '11238|11236');
INSERT INTO `bitacora` VALUES ('1490', 'detalleseriacion', '9', 'D', '2014-10-13 00:00:00', null, '11238|11237');
INSERT INTO `bitacora` VALUES ('1491', 'detalleseriacion', '9', 'I', '2014-10-13 00:00:00', '11238|11236', null);
INSERT INTO `bitacora` VALUES ('1492', 'detalleseriacion', '9', 'I', '2014-10-13 00:00:00', '11238|11237', null);
INSERT INTO `bitacora` VALUES ('1493', 'p_ua', '9', 'D', '2014-10-13 00:00:00', null, '5|11238|1');
INSERT INTO `bitacora` VALUES ('1494', 'p_ua', '9', 'I', '2014-10-13 00:00:00', '5|11238|1', null);
INSERT INTO `bitacora` VALUES ('1495', 'uaprendizaje', '9', 'U', '2014-10-13 00:00:00', '11238|MATEMATICAS COMPUTADORA|3|0|0|0|0|0|6|2014-10-14|vamos a ver|1|1|3|20092', '11238|MATEMATICAS descriptivas|3|0|0|0|0|0|6|2014-10-14|vamos a ver|1|1|3|20092');
INSERT INTO `bitacora` VALUES ('1496', 'detalleseriacion', '9', 'D', '2014-10-13 00:00:00', null, '11238|11236');
INSERT INTO `bitacora` VALUES ('1497', 'detalleseriacion', '9', 'D', '2014-10-13 00:00:00', null, '11238|11237');
INSERT INTO `bitacora` VALUES ('1498', 'detalleseriacion', '9', 'I', '2014-10-13 00:00:00', '11238|11236', null);
INSERT INTO `bitacora` VALUES ('1499', 'detalleseriacion', '9', 'I', '2014-10-13 00:00:00', '11238|11237', null);
INSERT INTO `bitacora` VALUES ('1500', 'p_ua', '9', 'D', '2014-10-13 00:00:00', null, '5|11238|1');
INSERT INTO `bitacora` VALUES ('1501', 'p_ua', '9', 'I', '2014-10-13 00:00:00', '5|11238|1', null);
INSERT INTO `bitacora` VALUES ('1502', 'uaprendizaje', '9', 'U', '2014-10-13 00:00:00', '11237|MATEMATICAS III|2|0|0|0|0|0|4|2014-10-14||1|1|1|20092', '11237|MATEMATICAS II|2|0|0|0|0|0|4|2014-10-14||1|1|1|20092');
INSERT INTO `bitacora` VALUES ('1503', 'detalleseriacion', '9', 'D', '2014-10-13 00:00:00', null, '11237|11236');
INSERT INTO `bitacora` VALUES ('1504', 'detalleseriacion', '9', 'I', '2014-10-13 00:00:00', '11237|11236', null);
INSERT INTO `bitacora` VALUES ('1505', 'p_ua', '9', 'D', '2014-10-13 00:00:00', null, '5|11237|1');
INSERT INTO `bitacora` VALUES ('1506', 'p_ua', '9', 'I', '2014-10-13 00:00:00', '5|11237|1', null);
INSERT INTO `bitacora` VALUES ('1507', 'uaprendizaje', '9', 'U', '2014-10-13 00:00:00', '11237|MATEMATICAS III|2|1|1|1|1|1|9|2014-10-14||1|1|5|20092', '11237|MATEMATICAS III|2|0|0|0|0|0|4|2014-10-14||1|1|1|20092');
INSERT INTO `bitacora` VALUES ('1508', 'detalleseriacion', '9', 'D', '2014-10-13 00:00:00', null, '11237|11236');
INSERT INTO `bitacora` VALUES ('1509', 'detalleseriacion', '9', 'I', '2014-10-13 00:00:00', '11237|11236', null);
INSERT INTO `bitacora` VALUES ('1510', 'p_ua', '9', 'D', '2014-10-13 00:00:00', null, '5|11237|1');
INSERT INTO `bitacora` VALUES ('1511', 'p_ua', '9', 'I', '2014-10-13 00:00:00', '5|11237|1', null);
INSERT INTO `bitacora` VALUES ('1512', 'uaprendizaje', '9', 'U', '2014-10-13 00:00:00', '11237|MATEMATICAS III|2|1|1|1|1|1|9|2014-10-14||3|1|5|20092', '11237|MATEMATICAS III|2|1|1|1|1|1|9|2014-10-14||1|1|5|20092');
INSERT INTO `bitacora` VALUES ('1513', 'detalleseriacion', '9', 'D', '2014-10-13 00:00:00', null, '11237|11236');
INSERT INTO `bitacora` VALUES ('1514', 'detalleseriacion', '9', 'I', '2014-10-13 00:00:00', '11237|11236', null);
INSERT INTO `bitacora` VALUES ('1515', 'p_ua', '9', 'D', '2014-10-13 00:00:00', null, '5|11237|1');
INSERT INTO `bitacora` VALUES ('1516', 'p_ua', '9', 'I', '2014-10-13 00:00:00', '5|11237|1', null);
INSERT INTO `bitacora` VALUES ('1517', 'uaprendizaje', '9', 'U', '2014-10-13 00:00:00', '11237|MATEMATICAS III|2|1|1|1|1|1|9|2014-10-14||3|2|5|20092', '11237|MATEMATICAS III|2|1|1|1|1|1|9|2014-10-14||3|1|5|20092');
INSERT INTO `bitacora` VALUES ('1518', 'detalleseriacion', '9', 'D', '2014-10-13 00:00:00', null, '11237|11236');
INSERT INTO `bitacora` VALUES ('1519', 'detalleseriacion', '9', 'I', '2014-10-13 00:00:00', '11237|11236', null);
INSERT INTO `bitacora` VALUES ('1520', 'p_ua', '9', 'D', '2014-10-13 00:00:00', null, '5|11237|1');
INSERT INTO `bitacora` VALUES ('1521', 'p_ua', '9', 'I', '2014-10-13 00:00:00', '5|11237|1', null);
INSERT INTO `bitacora` VALUES ('1522', 'detalleseriacion', '9', 'D', '2014-10-13 00:00:00', null, '11237|11236');
INSERT INTO `bitacora` VALUES ('1523', 'detalleseriacion', '9', 'I', '2014-10-13 00:00:00', '11237|11237', null);
INSERT INTO `bitacora` VALUES ('1524', 'p_ua', '9', 'D', '2014-10-13 00:00:00', null, '5|11237|1');
INSERT INTO `bitacora` VALUES ('1525', 'p_ua', '9', 'I', '2014-10-13 00:00:00', '5|11237|1', null);
INSERT INTO `bitacora` VALUES ('1526', 'detalleseriacion', '9', 'D', '2014-10-13 00:00:00', null, '11238|11236');
INSERT INTO `bitacora` VALUES ('1527', 'detalleseriacion', '9', 'D', '2014-10-13 00:00:00', null, '11238|11237');
INSERT INTO `bitacora` VALUES ('1528', 'detalleseriacion', '9', 'I', '2014-10-13 00:00:00', '11238|11236', null);
INSERT INTO `bitacora` VALUES ('1529', 'p_ua', '9', 'D', '2014-10-13 00:00:00', null, '5|11238|1');
INSERT INTO `bitacora` VALUES ('1530', 'p_ua', '9', 'I', '2014-10-13 00:00:00', '5|11238|1', null);
INSERT INTO `bitacora` VALUES ('1531', 'p_ua', '9', 'D', '2014-10-13 00:00:00', null, '5|11236|1');
INSERT INTO `bitacora` VALUES ('1532', 'p_ua', '9', 'I', '2014-10-13 00:00:00', '3|11236|1', null);
INSERT INTO `bitacora` VALUES ('1533', 'p_ua', '9', 'I', '2014-10-13 00:00:00', '5|11236|1', null);
INSERT INTO `bitacora` VALUES ('1534', 'detalleseriacion', '9', 'D', '2014-10-13 00:00:00', null, '11237|11237');
INSERT INTO `bitacora` VALUES ('1535', 'detalleseriacion', '9', 'I', '2014-10-13 00:00:00', '11237|11237', null);
INSERT INTO `bitacora` VALUES ('1536', 'p_ua', '9', 'D', '2014-10-13 00:00:00', null, '5|11237|1');
INSERT INTO `bitacora` VALUES ('1537', 'p_ua', '9', 'I', '2014-10-13 00:00:00', '3|11237|1', null);
INSERT INTO `bitacora` VALUES ('1538', 'p_ua', '9', 'I', '2014-10-13 00:00:00', '4|11237|1', null);
INSERT INTO `bitacora` VALUES ('1539', 'p_ua', '9', 'I', '2014-10-13 00:00:00', '5|11237|1', null);
INSERT INTO `bitacora` VALUES ('1540', 'detalleseriacion', '9', 'D', '2014-10-13 00:00:00', null, '11238|11236');
INSERT INTO `bitacora` VALUES ('1541', 'detalleseriacion', '9', 'I', '2014-10-13 00:00:00', '11238|11236', null);
INSERT INTO `bitacora` VALUES ('1542', 'p_ua', '9', 'D', '2014-10-13 00:00:00', null, '5|11238|1');
INSERT INTO `bitacora` VALUES ('1543', 'p_ua', '9', 'I', '2014-10-13 00:00:00', '6|11238|1', null);
INSERT INTO `bitacora` VALUES ('1544', 'p_ua', '9', 'D', '2014-10-13 00:00:00', null, '3|11236|1');
INSERT INTO `bitacora` VALUES ('1545', 'p_ua', '9', 'D', '2014-10-13 00:00:00', null, '5|11236|1');
INSERT INTO `bitacora` VALUES ('1546', 'p_ua', '9', 'I', '2014-10-13 00:00:00', '5|11236|1', null);
INSERT INTO `bitacora` VALUES ('1547', 'p_ua', '9', 'D', '2014-10-13 00:00:00', null, '3|11237|1');
INSERT INTO `bitacora` VALUES ('1548', 'p_ua', '9', 'D', '2014-10-13 00:00:00', null, '4|11237|1');
INSERT INTO `bitacora` VALUES ('1549', 'p_ua', '9', 'D', '2014-10-13 00:00:00', null, '5|11237|1');
INSERT INTO `bitacora` VALUES ('1550', 'p_ua', '9', 'I', '2014-10-13 00:00:00', '3|11237|2', null);
INSERT INTO `bitacora` VALUES ('1551', 'p_ua', '9', 'I', '2014-10-13 00:00:00', '4|11237|2', null);
INSERT INTO `bitacora` VALUES ('1552', 'p_ua', '9', 'I', '2014-10-13 00:00:00', '5|11237|2', null);
INSERT INTO `bitacora` VALUES ('1553', 'detalleseriacion', '9', 'D', '2014-10-13 00:00:00', null, '11237|11237');
INSERT INTO `bitacora` VALUES ('1554', 'detalleseriacion', '9', 'I', '2014-10-13 00:00:00', '11237|11237', null);
INSERT INTO `bitacora` VALUES ('1555', 'p_ua', '9', 'D', '2014-10-14 00:00:00', null, '6|11238|1');
INSERT INTO `bitacora` VALUES ('1556', 'p_ua', '9', 'I', '2014-10-14 00:00:00', '6|11238|1', null);
INSERT INTO `bitacora` VALUES ('1557', 'detalleseriacion', '9', 'D', '2014-10-14 00:00:00', null, '11238|11236');
INSERT INTO `bitacora` VALUES ('1558', 'detalleseriacion', '9', 'I', '2014-10-14 00:00:00', '11238|11236', null);
INSERT INTO `bitacora` VALUES ('1559', 'detalleseriacion', '9', 'I', '2014-10-14 00:00:00', '11238|11237', null);
INSERT INTO `bitacora` VALUES ('1560', 'p_ua', '9', 'D', '2014-10-14 00:00:00', null, '6|11238|1');
INSERT INTO `bitacora` VALUES ('1561', 'p_ua', '9', 'I', '2014-10-14 00:00:00', '5|11238|1', null);
INSERT INTO `bitacora` VALUES ('1562', 'detalleseriacion', '9', 'D', '2014-10-14 00:00:00', null, '11238|11236');
INSERT INTO `bitacora` VALUES ('1563', 'detalleseriacion', '9', 'D', '2014-10-14 00:00:00', null, '11238|11237');
INSERT INTO `bitacora` VALUES ('1564', 'detalleseriacion', '9', 'I', '2014-10-14 00:00:00', '11238|11236', null);
INSERT INTO `bitacora` VALUES ('1565', 'detalleseriacion', '9', 'I', '2014-10-14 00:00:00', '11238|11237', null);
INSERT INTO `bitacora` VALUES ('1566', 'uaprendizaje', '9', 'I', '2014-10-14 00:00:00', '11239|MATEMATICAS TERMINAL|1|0|0|0|0|0|2|2014-10-14||1|2|2|20092', null);
INSERT INTO `bitacora` VALUES ('1567', 'p_ua', '9', 'I', '2014-10-14 00:00:00', '5|11239|3', null);
INSERT INTO `bitacora` VALUES ('1568', 'detalleseriacion', '9', 'I', '2014-10-14 00:00:00', '11239|11237', null);

-- ----------------------------
-- Table structure for campus
-- ----------------------------
DROP TABLE IF EXISTS `campus`;
CREATE TABLE `campus` (
  `campus` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo campus (1,2,3,4)',
  `descripcion` varchar(40) NOT NULL COMMENT 'Descripcion CAMPUS ()',
  `direccion` varchar(60) DEFAULT NULL COMMENT 'Direccion CAMPUS',
  `ciudad` int(11) NOT NULL DEFAULT '16' COMMENT 'Codigo ciudad',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`campus`),
  UNIQUE KEY `CM_codigo_UNIQUE` (`campus`),
  KEY `fk_campus_ciudad1_idx` (`ciudad`),
  KEY `fk_campus_users1_idx` (`users_id`),
  CONSTRAINT `fk_campus_ciudad1` FOREIGN KEY (`ciudad`) REFERENCES `ciudad` (`ciudad`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COMMENT='<double-click to overwrite multiple objects>';

-- ----------------------------
-- Records of campus
-- ----------------------------
INSERT INTO `campus` VALUES ('1', 'TIJUANA UNIDAD OTAY', 'CALZADA UNIVERSIDAD 14418 PARQUE INDUSTRIAL INTERNACIONAL TI', '16', '1');
INSERT INTO `campus` VALUES ('2', 'TIJUANA UNIDAD TECAT', 'CALZADA UNIVERSIDAD NO.1 FRACC. SAN FERNANDO. C.P. 21460', '16', '1');
INSERT INTO `campus` VALUES ('3', 'TIJUANA UNIDAD ROSAR', 'BLVD. MARIANO VERDUGO NORTE ENTRE CALLE ISLA LOBO VERACRUZ Y', '16', '1');
INSERT INTO `campus` VALUES ('4', 'TIJUANA UNIDAD VALLE', 'BLVD. UNIVERSITARIO #1000', '16', '1');

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
  CONSTRAINT `fk_caracter_users1` FOREIGN KEY (`users_id`) REFERENCES `users_delia` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COMMENT='<double-click to overwrite multiple objects>';

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
  CONSTRAINT `fk_caracteristica_cur_users1` FOREIGN KEY (`users_id`) REFERENCES `users_delia` (`id`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of caracteristica_cur
-- ----------------------------

-- ----------------------------
-- Table structure for carga
-- ----------------------------
DROP TABLE IF EXISTS `carga`;
CREATE TABLE `carga` (
  `grupo` int(11) NOT NULL COMMENT 'Código grupo',
  `periodo` int(11) NOT NULL COMMENT 'Periodo de trabajo(Año 4 digitos+ semestre o cuatrim) ej. 20091,20092',
  `uaprendizaje` int(11) NOT NULL COMMENT 'Código uaprendizaje (SOLO NUMERICOS)',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`grupo`,`periodo`,`uaprendizaje`),
  KEY `fk_carga_grupos1_idx` (`grupo`,`periodo`),
  KEY `fk_carga_uaprendizaje1_idx` (`uaprendizaje`),
  KEY `fk_carga_users1_idx` (`users_id`),
  CONSTRAINT `fk_carga_grupos1` FOREIGN KEY (`grupo`, `periodo`) REFERENCES `grupos` (`grupo`, `periodo`),
  CONSTRAINT `fk_carga_uaprendizaje1` FOREIGN KEY (`uaprendizaje`) REFERENCES `uaprendizaje` (`uaprendizaje`),
  CONSTRAINT `fk_carga_users1` FOREIGN KEY (`users_id`) REFERENCES `users_delia` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of carga
-- ----------------------------

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
  CONSTRAINT `fk_carreras_emp_users1` FOREIGN KEY (`users_id`) REFERENCES `users_delia` (`id`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of carreras_emp
-- ----------------------------

-- ----------------------------
-- Table structure for categorias
-- ----------------------------
DROP TABLE IF EXISTS `categorias`;
CREATE TABLE `categorias` (
  `categoria` int(11) NOT NULL COMMENT 'Categoria contrato',
  `descripcion` varchar(45) DEFAULT NULL COMMENT 'Descripcion (Tiempo Completo, Asignatura)',
  `nivel` char(1) DEFAULT NULL COMMENT 'Nivel',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`categoria`),
  KEY `fk_categorias_users1_idx` (`users_id`),
  CONSTRAINT `fk_categorias_users1` FOREIGN KEY (`users_id`) REFERENCES `users_delia` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  CONSTRAINT `fk_ciudad_users1` FOREIGN KEY (`users_id`) REFERENCES `users_delia` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=651 DEFAULT CHARSET=latin1 COMMENT='<double-click to overwrite multiple objects>';

-- ----------------------------
-- Records of ciudad
-- ----------------------------
INSERT INTO `ciudad` VALUES ('1', 'AGUASCALIENTES', '1', '1');
INSERT INTO `ciudad` VALUES ('2', 'ASIENTOS', '1', '1');
INSERT INTO `ciudad` VALUES ('3', 'CALVILLO', '1', '1');
INSERT INTO `ciudad` VALUES ('4', 'COSÃO', '1', '1');
INSERT INTO `ciudad` VALUES ('5', 'JESÃšS MARÃA', '1', '1');
INSERT INTO `ciudad` VALUES ('6', 'PABELLÃ“N DE ARTEAGA', '1', '1');
INSERT INTO `ciudad` VALUES ('7', 'RINCÃ“N DE ROMOS', '1', '1');
INSERT INTO `ciudad` VALUES ('8', 'SAN FRANCISCO DE LOS ROMO', '1', '1');
INSERT INTO `ciudad` VALUES ('9', 'TEPEZALÃ', '1', '1');
INSERT INTO `ciudad` VALUES ('10', 'ENSENADA', '2', '1');
INSERT INTO `ciudad` VALUES ('11', 'MEXICALI', '2', '1');
INSERT INTO `ciudad` VALUES ('12', 'PLAYAS DE ROSARITO', '2', '1');
INSERT INTO `ciudad` VALUES ('13', 'RODOLFO SÃNCHEZ T. (MANEADERO)', '2', '1');
INSERT INTO `ciudad` VALUES ('14', 'SAN FELIPE', '2', '1');
INSERT INTO `ciudad` VALUES ('15', 'TECATE', '2', '1');
INSERT INTO `ciudad` VALUES ('16', 'TIJUANA', '2', '1');
INSERT INTO `ciudad` VALUES ('17', 'CABO SAN LUCAS', '3', '1');
INSERT INTO `ciudad` VALUES ('18', 'CIUDAD CONSTITUCIÃ“N', '3', '1');
INSERT INTO `ciudad` VALUES ('19', 'GUERRERO NEGRO', '3', '1');
INSERT INTO `ciudad` VALUES ('20', 'HEROICA MULEGÃ‰', '3', '1');
INSERT INTO `ciudad` VALUES ('21', 'LA PAZ', '3', '1');
INSERT INTO `ciudad` VALUES ('22', 'LORETO', '3', '1');
INSERT INTO `ciudad` VALUES ('23', 'PUERTO ADOLFO LÃ“PEZ MATEOS', '3', '1');
INSERT INTO `ciudad` VALUES ('24', 'SAN IGNACIO', '3', '1');
INSERT INTO `ciudad` VALUES ('25', 'SAN JOSÃ‰ DEL CABO', '3', '1');
INSERT INTO `ciudad` VALUES ('26', 'TODOS SANTOS', '3', '1');
INSERT INTO `ciudad` VALUES ('27', 'VILLA ALBERTO ANDRÃ‰S ALVARADO ARÃMBURO', '3', '1');
INSERT INTO `ciudad` VALUES ('28', 'CALKINI', '4', '1');
INSERT INTO `ciudad` VALUES ('29', 'CANDELARIA', '4', '1');
INSERT INTO `ciudad` VALUES ('30', 'CHAMPOTÃ“N', '4', '1');
INSERT INTO `ciudad` VALUES ('31', 'CIUDAD DEL CARMEN', '4', '1');
INSERT INTO `ciudad` VALUES ('32', 'ESCÃRCEGA', '4', '1');
INSERT INTO `ciudad` VALUES ('33', 'HECELCHAKÃN', '4', '1');
INSERT INTO `ciudad` VALUES ('34', 'HOPELCHÃ‰N', '4', '1');
INSERT INTO `ciudad` VALUES ('35', 'POMUCH', '4', '1');
INSERT INTO `ciudad` VALUES ('36', 'SABANCUY', '4', '1');
INSERT INTO `ciudad` VALUES ('37', 'SAN FRANCISCO DE CAMPECHE', '4', '1');
INSERT INTO `ciudad` VALUES ('38', 'ALLENDE', '5', '1');
INSERT INTO `ciudad` VALUES ('39', 'ARTEAGA', '5', '1');
INSERT INTO `ciudad` VALUES ('40', 'CASTAÃ‘OS', '5', '1');
INSERT INTO `ciudad` VALUES ('41', 'CIUDAD ACUÃ‘A', '5', '1');
INSERT INTO `ciudad` VALUES ('42', 'CIUDAD MELCHOR MÃšZQUIZ', '5', '1');
INSERT INTO `ciudad` VALUES ('43', 'CUATRO CIÃ‰NEGAS DE CARRANZA', '5', '1');
INSERT INTO `ciudad` VALUES ('44', 'FRANCISCO I. MADERO (CHÃVEZ)', '5', '1');
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
INSERT INTO `ciudad` VALUES ('59', 'TORREÃ“N', '5', '1');
INSERT INTO `ciudad` VALUES ('60', 'VIESCA', '5', '1');
INSERT INTO `ciudad` VALUES ('61', 'ZARAGOZA', '5', '1');
INSERT INTO `ciudad` VALUES ('62', 'CIUDAD DE ARMERÃA', '6', '1');
INSERT INTO `ciudad` VALUES ('63', 'CIUDAD DE VILLA DE ÃLVAREZ', '6', '1');
INSERT INTO `ciudad` VALUES ('64', 'CIUDAD DE VILLA DE ÃLVAREZ', '6', '1');
INSERT INTO `ciudad` VALUES ('65', 'COLIMA', '6', '1');
INSERT INTO `ciudad` VALUES ('66', 'MANZANILLO', '6', '1');
INSERT INTO `ciudad` VALUES ('67', 'TECOMAN', '6', '1');
INSERT INTO `ciudad` VALUES ('68', 'ACALA', '7', '1');
INSERT INTO `ciudad` VALUES ('69', 'ARRIAGA', '7', '1');
INSERT INTO `ciudad` VALUES ('70', 'CACAHOATÃN', '7', '1');
INSERT INTO `ciudad` VALUES ('71', 'CHIAPA DE CORZO', '7', '1');
INSERT INTO `ciudad` VALUES ('72', 'CINTALAPA DE FIGUEROA', '7', '1');
INSERT INTO `ciudad` VALUES ('73', 'COMITÃN DE DOMÃNGUEZ', '7', '1');
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
INSERT INTO `ciudad` VALUES ('87', 'SAN CRISTÃ“BAL DE LAS CASAS', '7', '1');
INSERT INTO `ciudad` VALUES ('88', 'TAPACHULA DE CÃ“RDOVA Y ORDÃ“Ã‘EZ', '7', '1');
INSERT INTO `ciudad` VALUES ('89', 'TONALÃ', '7', '1');
INSERT INTO `ciudad` VALUES ('90', 'TUXTLA GUTIÃ‰RREZ', '7', '1');
INSERT INTO `ciudad` VALUES ('91', 'VENUSTIANO CARRANZA', '7', '1');
INSERT INTO `ciudad` VALUES ('92', 'VILLAFLORES', '7', '1');
INSERT INTO `ciudad` VALUES ('93', 'BACHÃNIVA', '8', '1');
INSERT INTO `ciudad` VALUES ('94', 'CHIHUAHUA', '8', '1');
INSERT INTO `ciudad` VALUES ('95', 'COLONIA ANÃHUAC', '8', '1');
INSERT INTO `ciudad` VALUES ('96', 'CUAUHTÃ‰MOC', '8', '1');
INSERT INTO `ciudad` VALUES ('97', 'DELICIAS', '8', '1');
INSERT INTO `ciudad` VALUES ('98', 'HIDALGO DEL PARRAL', '8', '1');
INSERT INTO `ciudad` VALUES ('99', 'JOSÃ‰ MARIANO JIMÃ‰NEZ', '8', '1');
INSERT INTO `ciudad` VALUES ('100', 'JUAN ALDAMA', '8', '1');
INSERT INTO `ciudad` VALUES ('101', 'JUÃREZ', '8', '1');
INSERT INTO `ciudad` VALUES ('102', 'MADERA', '8', '1');
INSERT INTO `ciudad` VALUES ('103', 'MANUEL OJINAGA', '8', '1');
INSERT INTO `ciudad` VALUES ('104', 'NUEVO CASAS GRANDES', '8', '1');
INSERT INTO `ciudad` VALUES ('105', 'SANTA ROSALÃA DE CAMARGO', '8', '1');
INSERT INTO `ciudad` VALUES ('106', 'SAUCILLO', '8', '1');
INSERT INTO `ciudad` VALUES ('107', 'CIUDAD DE MÃ‰XICO', '9', '1');
INSERT INTO `ciudad` VALUES ('108', 'CANATLÃN', '10', '1');
INSERT INTO `ciudad` VALUES ('109', 'CIUDAD LERDO', '10', '1');
INSERT INTO `ciudad` VALUES ('110', 'EL SALTO', '10', '1');
INSERT INTO `ciudad` VALUES ('111', 'FRANCISCO I. MADERO', '10', '1');
INSERT INTO `ciudad` VALUES ('112', 'GÃ“MEZ PALACIO', '10', '1');
INSERT INTO `ciudad` VALUES ('113', 'NOMBRE DE DIOS', '10', '1');
INSERT INTO `ciudad` VALUES ('114', 'PEÃ‘Ã“N BLANCO', '10', '1');
INSERT INTO `ciudad` VALUES ('115', 'SAN JUAN DEL RÃO DEL CENTAURO DEL NORTE', '10', '1');
INSERT INTO `ciudad` VALUES ('116', 'SANTA MARÃA DEL ORO', '10', '1');
INSERT INTO `ciudad` VALUES ('117', 'SANTIAGO PAPASQUIARO', '10', '1');
INSERT INTO `ciudad` VALUES ('118', 'VICENTE GUERRERO', '10', '1');
INSERT INTO `ciudad` VALUES ('119', 'VICTORIA DE DURANGO', '10', '1');
INSERT INTO `ciudad` VALUES ('120', 'ABASOLO', '11', '1');
INSERT INTO `ciudad` VALUES ('121', 'ACÃMBARO', '11', '1');
INSERT INTO `ciudad` VALUES ('122', 'APASEO EL ALTO', '11', '1');
INSERT INTO `ciudad` VALUES ('123', 'APASEO EL GRANDE', '11', '1');
INSERT INTO `ciudad` VALUES ('124', 'CELAYA', '11', '1');
INSERT INTO `ciudad` VALUES ('125', 'CIUDAD MANUEL DOBLADO', '11', '1');
INSERT INTO `ciudad` VALUES ('126', 'COMONFORT', '11', '1');
INSERT INTO `ciudad` VALUES ('127', 'CORTAZAR', '11', '1');
INSERT INTO `ciudad` VALUES ('128', 'CUERÃMARO', '11', '1');
INSERT INTO `ciudad` VALUES ('129', 'DOCTOR MORA', '11', '1');
INSERT INTO `ciudad` VALUES ('130', 'DOLORES HIDALGO CUNA DE LA INDEPENDENCIA NACIONAL', '11', '1');
INSERT INTO `ciudad` VALUES ('131', 'EMPALME ESCOBEDO (ESCOBEDO)', '11', '1');
INSERT INTO `ciudad` VALUES ('132', 'GUANAJUATO', '11', '1');
INSERT INTO `ciudad` VALUES ('133', 'HUANÃMARO', '11', '1');
INSERT INTO `ciudad` VALUES ('134', 'IRAPUATO', '11', '1');
INSERT INTO `ciudad` VALUES ('135', 'JARAL DEL PROGRESO', '11', '1');
INSERT INTO `ciudad` VALUES ('136', 'JERÃ‰CUARO', '11', '1');
INSERT INTO `ciudad` VALUES ('137', 'LEÃ“N DE LOS ALDAMA', '11', '1');
INSERT INTO `ciudad` VALUES ('138', 'MARFIL', '11', '1');
INSERT INTO `ciudad` VALUES ('139', 'MOROLEÃ“N', '11', '1');
INSERT INTO `ciudad` VALUES ('140', 'PÃ‰NJAMO', '11', '1');
INSERT INTO `ciudad` VALUES ('141', 'PURÃSIMA DE BUSTOS', '11', '1');
INSERT INTO `ciudad` VALUES ('142', 'RINCÃ“N DE TAMAYO', '11', '1');
INSERT INTO `ciudad` VALUES ('143', 'ROMITA', '11', '1');
INSERT INTO `ciudad` VALUES ('144', 'SALAMANCA', '11', '1');
INSERT INTO `ciudad` VALUES ('145', 'SALVATIERRA', '11', '1');
INSERT INTO `ciudad` VALUES ('146', 'SAN DIEGO DE LA UNIÃ“N', '11', '1');
INSERT INTO `ciudad` VALUES ('147', 'SAN FRANCISCO DEL RINCÃ“N', '11', '1');
INSERT INTO `ciudad` VALUES ('148', 'SAN JOSÃ‰ ITURBIDE', '11', '1');
INSERT INTO `ciudad` VALUES ('149', 'SAN LUIS DE LA PAZ', '11', '1');
INSERT INTO `ciudad` VALUES ('150', 'SAN MIGUEL DE ALLENDE', '11', '1');
INSERT INTO `ciudad` VALUES ('151', 'SANTA CRUZ JUVENTINO ROSAS', '11', '1');
INSERT INTO `ciudad` VALUES ('152', 'SANTIAGO MARAVATÃO', '11', '1');
INSERT INTO `ciudad` VALUES ('153', 'SILAO', '11', '1');
INSERT INTO `ciudad` VALUES ('154', 'TARANDACUAO', '11', '1');
INSERT INTO `ciudad` VALUES ('155', 'URIANGATO', '11', '1');
INSERT INTO `ciudad` VALUES ('156', 'VALLE DE SANTIAGO', '11', '1');
INSERT INTO `ciudad` VALUES ('157', 'VILLAGRÃN', '11', '1');
INSERT INTO `ciudad` VALUES ('158', 'YURIRIA', '11', '1');
INSERT INTO `ciudad` VALUES ('159', 'ACAPULCO DE JUÃREZ', '12', '1');
INSERT INTO `ciudad` VALUES ('160', 'ARCELIA', '12', '1');
INSERT INTO `ciudad` VALUES ('161', 'ATOYAC DE ÃLVAREZ', '12', '1');
INSERT INTO `ciudad` VALUES ('162', 'AYUTLA DE LOS LIBRES', '12', '1');
INSERT INTO `ciudad` VALUES ('163', 'AZOYÃš', '12', '1');
INSERT INTO `ciudad` VALUES ('164', 'BUENAVISTA DE CUELLAR', '12', '1');
INSERT INTO `ciudad` VALUES ('165', 'CHILAPA DE ÃLVAREZ', '12', '1');
INSERT INTO `ciudad` VALUES ('166', 'CHILPANCINGO DE LOS BRAVO', '12', '1');
INSERT INTO `ciudad` VALUES ('167', 'CIUDAD ALTAMIRANO', '12', '1');
INSERT INTO `ciudad` VALUES ('168', 'CIUDAD APAXTLA DE CASTREJÃ“N', '12', '1');
INSERT INTO `ciudad` VALUES ('169', 'COPALA', '12', '1');
INSERT INTO `ciudad` VALUES ('170', 'COYUCA DE BENÃTEZ', '12', '1');
INSERT INTO `ciudad` VALUES ('171', 'COYUCA DE CATALÃN', '12', '1');
INSERT INTO `ciudad` VALUES ('172', 'CRUZ GRANDE', '12', '1');
INSERT INTO `ciudad` VALUES ('173', 'CUAJINICUILAPA', '12', '1');
INSERT INTO `ciudad` VALUES ('174', 'CUTZAMALA DE PINZÃ“N', '12', '1');
INSERT INTO `ciudad` VALUES ('175', 'HUAMUXTITLAN', '12', '1');
INSERT INTO `ciudad` VALUES ('176', 'HUITZUCO', '12', '1');
INSERT INTO `ciudad` VALUES ('177', 'IGUALA DE LA INDEPENDENCIA', '12', '1');
INSERT INTO `ciudad` VALUES ('178', 'LA UNIÃ“N', '12', '1');
INSERT INTO `ciudad` VALUES ('179', 'MARQUELIA', '12', '1');
INSERT INTO `ciudad` VALUES ('180', 'OCOTITO', '12', '1');
INSERT INTO `ciudad` VALUES ('181', 'OLINALÃ', '12', '1');
INSERT INTO `ciudad` VALUES ('182', 'PETATLÃN', '12', '1');
INSERT INTO `ciudad` VALUES ('183', 'SAN JERÃ“NIMO DE JUÃREZ', '12', '1');
INSERT INTO `ciudad` VALUES ('184', 'SAN LUIS ACATLÃN', '12', '1');
INSERT INTO `ciudad` VALUES ('185', 'SAN LUIS DE LA LOMA', '12', '1');
INSERT INTO `ciudad` VALUES ('186', 'SAN LUIS SAN PEDRO', '12', '1');
INSERT INTO `ciudad` VALUES ('187', 'SAN MARCOS', '12', '1');
INSERT INTO `ciudad` VALUES ('188', 'TAXCO DE ALARCÃ“N', '12', '1');
INSERT INTO `ciudad` VALUES ('189', 'TÃ‰CPAN DE GALEANA', '12', '1');
INSERT INTO `ciudad` VALUES ('190', 'TELOLOAPAN', '12', '1');
INSERT INTO `ciudad` VALUES ('191', 'TEPECOACUILCO DE TRUJANO', '12', '1');
INSERT INTO `ciudad` VALUES ('192', 'TIERRA COLORADA', '12', '1');
INSERT INTO `ciudad` VALUES ('193', 'TIXTLA DE GUERRERO', '12', '1');
INSERT INTO `ciudad` VALUES ('194', 'TLALIXTAQUILLA', '12', '1');
INSERT INTO `ciudad` VALUES ('195', 'TLAPA DE COMONFORT', '12', '1');
INSERT INTO `ciudad` VALUES ('196', 'TLAPEHUALA', '12', '1');
INSERT INTO `ciudad` VALUES ('197', 'ZIHUATANEJO', '12', '1');
INSERT INTO `ciudad` VALUES ('198', 'ZUMPANGO DEL RÃO', '12', '1');
INSERT INTO `ciudad` VALUES ('199', 'ACTOPAN', '13', '1');
INSERT INTO `ciudad` VALUES ('200', 'APAN', '13', '1');
INSERT INTO `ciudad` VALUES ('201', 'CIUDAD DE FRAY BERNARDINO DE SAHAGÃšN', '13', '1');
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
INSERT INTO `ciudad` VALUES ('214', 'ACATLÃN DE JUÃREZ', '14', '1');
INSERT INTO `ciudad` VALUES ('215', 'AHUALULCO DE MERCADO', '14', '1');
INSERT INTO `ciudad` VALUES ('216', 'AJIJIC', '14', '1');
INSERT INTO `ciudad` VALUES ('217', 'AMECA', '14', '1');
INSERT INTO `ciudad` VALUES ('218', 'ARANDAS', '14', '1');
INSERT INTO `ciudad` VALUES ('219', 'ATOTONILCO EL ALTO', '14', '1');
INSERT INTO `ciudad` VALUES ('220', 'AUTLÃN DE NAVARRO', '14', '1');
INSERT INTO `ciudad` VALUES ('221', 'CHAPALA', '14', '1');
INSERT INTO `ciudad` VALUES ('222', 'CIHUATLÃN', '14', '1');
INSERT INTO `ciudad` VALUES ('223', 'CIUDAD GUZMÃN', '14', '1');
INSERT INTO `ciudad` VALUES ('224', 'COCULA', '14', '1');
INSERT INTO `ciudad` VALUES ('225', 'COLOTLÃN', '14', '1');
INSERT INTO `ciudad` VALUES ('226', 'EL GRULLO', '14', '1');
INSERT INTO `ciudad` VALUES ('227', 'EL QUINCE (SAN JOSÃ‰ EL QUINCE)', '14', '1');
INSERT INTO `ciudad` VALUES ('228', 'ETZATLÃN', '14', '1');
INSERT INTO `ciudad` VALUES ('229', 'GUADALAJARA', '14', '1');
INSERT INTO `ciudad` VALUES ('230', 'HUEJUQUILLA EL ALTO', '14', '1');
INSERT INTO `ciudad` VALUES ('231', 'JALOSTOTITLÃN', '14', '1');
INSERT INTO `ciudad` VALUES ('232', 'JAMAY', '14', '1');
INSERT INTO `ciudad` VALUES ('233', 'JOCOTEPEC', '14', '1');
INSERT INTO `ciudad` VALUES ('234', 'LA BARCA', '14', '1');
INSERT INTO `ciudad` VALUES ('235', 'LA RESOLANA', '14', '1');
INSERT INTO `ciudad` VALUES ('236', 'LAGOS DE MORENO', '14', '1');
INSERT INTO `ciudad` VALUES ('237', 'LAS PINTITAS', '14', '1');
INSERT INTO `ciudad` VALUES ('238', 'MAGDALENA', '14', '1');
INSERT INTO `ciudad` VALUES ('239', 'OCOTLÃN', '14', '1');
INSERT INTO `ciudad` VALUES ('240', 'PONCITLÃN', '14', '1');
INSERT INTO `ciudad` VALUES ('241', 'PUERTO VALLARTA', '14', '1');
INSERT INTO `ciudad` VALUES ('242', 'SAN DIEGO DE ALEJANDRÃA', '14', '1');
INSERT INTO `ciudad` VALUES ('243', 'SAN IGNACIO CERRO GORDO', '14', '1');
INSERT INTO `ciudad` VALUES ('244', 'SAN JOSÃ‰ EL VERDE (EL VERDE)', '14', '1');
INSERT INTO `ciudad` VALUES ('245', 'SAN JUAN DE LOS LAGOS', '14', '1');
INSERT INTO `ciudad` VALUES ('246', 'SAN JULIÃN', '14', '1');
INSERT INTO `ciudad` VALUES ('247', 'SAN MIGUEL EL ALTO', '14', '1');
INSERT INTO `ciudad` VALUES ('248', 'SAYULA', '14', '1');
INSERT INTO `ciudad` VALUES ('249', 'TALA', '14', '1');
INSERT INTO `ciudad` VALUES ('250', 'TALPA DE ALLENDE', '14', '1');
INSERT INTO `ciudad` VALUES ('251', 'TAMAZULA DE GORDIANO', '14', '1');
INSERT INTO `ciudad` VALUES ('252', 'TECALITLÃN', '14', '1');
INSERT INTO `ciudad` VALUES ('253', 'TEOCALTICHE', '14', '1');
INSERT INTO `ciudad` VALUES ('254', 'TEPATITLÃN DE MORELOS', '14', '1');
INSERT INTO `ciudad` VALUES ('255', 'TEQUILA', '14', '1');
INSERT INTO `ciudad` VALUES ('256', 'TLAJOMULCO DE ZÃšÃ‘IGA', '14', '1');
INSERT INTO `ciudad` VALUES ('257', 'TLAQUEPAQUE', '14', '1');
INSERT INTO `ciudad` VALUES ('258', 'TONALÃ', '14', '1');
INSERT INTO `ciudad` VALUES ('259', 'TOTOTLÃN', '14', '1');
INSERT INTO `ciudad` VALUES ('260', 'TUXPAN', '14', '1');
INSERT INTO `ciudad` VALUES ('261', 'UNIÃ“N DE SAN ANTONIO', '14', '1');
INSERT INTO `ciudad` VALUES ('262', 'VALLE DE GUADALUPE', '14', '1');
INSERT INTO `ciudad` VALUES ('263', 'VILLA CORONA', '14', '1');
INSERT INTO `ciudad` VALUES ('264', 'VILLA HIDALGO', '14', '1');
INSERT INTO `ciudad` VALUES ('265', 'YAHUALICA DE GONZÃLEZ GALLO', '14', '1');
INSERT INTO `ciudad` VALUES ('266', 'ZACOALCO DE TORRES', '14', '1');
INSERT INTO `ciudad` VALUES ('267', 'ZAPOPAN', '14', '1');
INSERT INTO `ciudad` VALUES ('268', 'ZAPOTILTIC', '14', '1');
INSERT INTO `ciudad` VALUES ('269', 'ALMOLOYA DE JUÃREZ', '15', '1');
INSERT INTO `ciudad` VALUES ('270', 'AMATEPEC', '15', '1');
INSERT INTO `ciudad` VALUES ('271', 'CAPULHUAC', '15', '1');
INSERT INTO `ciudad` VALUES ('272', 'CHALCO DE DÃAZ COVARRUBIAS', '15', '1');
INSERT INTO `ciudad` VALUES ('273', 'CHICONCUAC', '15', '1');
INSERT INTO `ciudad` VALUES ('274', 'CHIMALHUACÃN', '15', '1');
INSERT INTO `ciudad` VALUES ('275', 'CIUDAD ADOLFO LÃ“PEZ MATEOS', '15', '1');
INSERT INTO `ciudad` VALUES ('276', 'CIUDAD NEZAHUALCOYOTL', '15', '1');
INSERT INTO `ciudad` VALUES ('277', 'COACALCO DE BERRIOZABAL', '15', '1');
INSERT INTO `ciudad` VALUES ('278', 'CUAUTITLÃN', '15', '1');
INSERT INTO `ciudad` VALUES ('279', 'CUAUTITLÃN IZCALLI', '15', '1');
INSERT INTO `ciudad` VALUES ('280', 'ECATEPEC DE MORELOS', '15', '1');
INSERT INTO `ciudad` VALUES ('281', 'HUIXQUILUCAN DE DEGOLLADO', '15', '1');
INSERT INTO `ciudad` VALUES ('282', 'IXTAPALUCA', '15', '1');
INSERT INTO `ciudad` VALUES ('283', 'JUCHITEPEC DE MARIANO RIVA PALACIO', '15', '1');
INSERT INTO `ciudad` VALUES ('284', 'LOS REYES ACAQUILPAN (LA PAZ)', '15', '1');
INSERT INTO `ciudad` VALUES ('285', 'MELCHOR OCAMPO', '15', '1');
INSERT INTO `ciudad` VALUES ('286', 'METEPEC', '15', '1');
INSERT INTO `ciudad` VALUES ('287', 'NAUCALPAN DE JUÃREZ', '15', '1');
INSERT INTO `ciudad` VALUES ('288', 'OCOYOACAC', '15', '1');
INSERT INTO `ciudad` VALUES ('289', 'SAN MATEO ATENCO', '15', '1');
INSERT INTO `ciudad` VALUES ('290', 'SAN VICENTE CHICOLOAPAN DE JUÃREZ', '15', '1');
INSERT INTO `ciudad` VALUES ('291', 'SANTA MARIA TULTEPEC', '15', '1');
INSERT INTO `ciudad` VALUES ('292', 'TECAMAC DE FELIPE VILLANUEVA', '15', '1');
INSERT INTO `ciudad` VALUES ('293', 'TEJUPILCO DE HIDALGO', '15', '1');
INSERT INTO `ciudad` VALUES ('294', 'TEPOTZOTLÃN', '15', '1');
INSERT INTO `ciudad` VALUES ('295', 'TEQUIXQUIAC', '15', '1');
INSERT INTO `ciudad` VALUES ('296', 'TEXCOCO DE MORA', '15', '1');
INSERT INTO `ciudad` VALUES ('297', 'TLALNEPANTLA DE BAZ', '15', '1');
INSERT INTO `ciudad` VALUES ('298', 'TOLUCA DE LERDO', '15', '1');
INSERT INTO `ciudad` VALUES ('299', 'TULTITLÃN DE MARIANO ESCOBEDO', '15', '1');
INSERT INTO `ciudad` VALUES ('300', 'VALLE DE CHALCO SOLIDARIDAD', '15', '1');
INSERT INTO `ciudad` VALUES ('301', 'VILLA NICOLÃS ROMERO', '15', '1');
INSERT INTO `ciudad` VALUES ('302', 'XONACATLÃN', '15', '1');
INSERT INTO `ciudad` VALUES ('303', 'ZUMPANGO', '15', '1');
INSERT INTO `ciudad` VALUES ('304', 'APATZINGÃN DE LA CONSTITUCIÃ“N', '16', '1');
INSERT INTO `ciudad` VALUES ('305', 'CIUDAD HIDALGO', '16', '1');
INSERT INTO `ciudad` VALUES ('306', 'CIUDAD LÃZARO CÃRDENAS', '16', '1');
INSERT INTO `ciudad` VALUES ('307', 'COTIJA DE LA PAZ', '16', '1');
INSERT INTO `ciudad` VALUES ('308', 'CUITZEO DEL PORVENIR', '16', '1');
INSERT INTO `ciudad` VALUES ('309', 'HEROICA ZITÃCUARO', '16', '1');
INSERT INTO `ciudad` VALUES ('310', 'HUETAMO DE NÃšÃ‘EZ', '16', '1');
INSERT INTO `ciudad` VALUES ('311', 'JACONA DE PLANCARTE', '16', '1');
INSERT INTO `ciudad` VALUES ('312', 'JIQUILPAN DE JUÃREZ', '16', '1');
INSERT INTO `ciudad` VALUES ('313', 'LA PIEDAD DE CABADAS', '16', '1');
INSERT INTO `ciudad` VALUES ('314', 'LAS GUACAMAYAS', '16', '1');
INSERT INTO `ciudad` VALUES ('315', 'LOS REYES DE SALGADO', '16', '1');
INSERT INTO `ciudad` VALUES ('316', 'MARAVATÃO DE OCAMPO', '16', '1');
INSERT INTO `ciudad` VALUES ('317', 'MORELIA', '16', '1');
INSERT INTO `ciudad` VALUES ('318', 'NUEVA ITALIA DE RUIZ', '16', '1');
INSERT INTO `ciudad` VALUES ('319', 'PARACHO DE VERDUZCO', '16', '1');
INSERT INTO `ciudad` VALUES ('320', 'PÃTZCUARO', '16', '1');
INSERT INTO `ciudad` VALUES ('321', 'PURUÃNDIRO', '16', '1');
INSERT INTO `ciudad` VALUES ('322', 'SAHUAYO DE MORELOS', '16', '1');
INSERT INTO `ciudad` VALUES ('323', 'TACÃMBARO DE CODALLOS', '16', '1');
INSERT INTO `ciudad` VALUES ('324', 'TANGANCÃCUARO DE ARISTA', '16', '1');
INSERT INTO `ciudad` VALUES ('325', 'TUXPAN', '16', '1');
INSERT INTO `ciudad` VALUES ('326', 'URUAPAN', '16', '1');
INSERT INTO `ciudad` VALUES ('327', 'YURÃ‰CUARO', '16', '1');
INSERT INTO `ciudad` VALUES ('328', 'ZACAPU', '16', '1');
INSERT INTO `ciudad` VALUES ('329', 'ZAMORA DE HIDALGO', '16', '1');
INSERT INTO `ciudad` VALUES ('330', 'ZINAPÃ‰CUARO DE FIGUEROA', '16', '1');
INSERT INTO `ciudad` VALUES ('331', 'CUAUTLA (CUAUTLA DE MORELOS)', '17', '1');
INSERT INTO `ciudad` VALUES ('332', 'CUERNAVACA', '17', '1');
INSERT INTO `ciudad` VALUES ('333', 'GALEANA', '17', '1');
INSERT INTO `ciudad` VALUES ('334', 'JOJUTLA', '17', '1');
INSERT INTO `ciudad` VALUES ('335', 'PUENTE DE IXTLA', '17', '1');
INSERT INTO `ciudad` VALUES ('336', 'SANTA ROSA TREINTA', '17', '1');
INSERT INTO `ciudad` VALUES ('337', 'TLAQUILTENANGO', '17', '1');
INSERT INTO `ciudad` VALUES ('338', 'ZACATEPEC DE HIDALGO', '17', '1');
INSERT INTO `ciudad` VALUES ('339', 'ACAPONETA', '18', '1');
INSERT INTO `ciudad` VALUES ('340', 'AHUACATLÃN', '18', '1');
INSERT INTO `ciudad` VALUES ('341', 'BUCERÃAS', '18', '1');
INSERT INTO `ciudad` VALUES ('342', 'COMPOSTELA', '18', '1');
INSERT INTO `ciudad` VALUES ('343', 'FRANCISCO I. MADERO (PUGA)', '18', '1');
INSERT INTO `ciudad` VALUES ('344', 'IXTLÃN DEL RÃO', '18', '1');
INSERT INTO `ciudad` VALUES ('345', 'JALA', '18', '1');
INSERT INTO `ciudad` VALUES ('346', 'LA PEÃ‘ITA DE JALTEMBA', '18', '1');
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
INSERT INTO `ciudad` VALUES ('357', 'ANÃHUAC', '19', '1');
INSERT INTO `ciudad` VALUES ('358', 'CADEREYTA JIMÃ‰NEZ', '19', '1');
INSERT INTO `ciudad` VALUES ('359', 'CIÃ‰NEGA DE FLORES', '19', '1');
INSERT INTO `ciudad` VALUES ('360', 'CIUDAD APODACA', '19', '1');
INSERT INTO `ciudad` VALUES ('361', 'CIUDAD BENITO JUÃREZ', '19', '1');
INSERT INTO `ciudad` VALUES ('362', 'CIUDAD GENERAL ESCOBEDO', '19', '1');
INSERT INTO `ciudad` VALUES ('363', 'CIUDAD SABINAS HIDALGO', '19', '1');
INSERT INTO `ciudad` VALUES ('364', 'CIUDAD SANTA CATARINA', '19', '1');
INSERT INTO `ciudad` VALUES ('365', 'CIUDAD SANTA CATARINA', '19', '1');
INSERT INTO `ciudad` VALUES ('366', 'DOCTOR ARROYO', '19', '1');
INSERT INTO `ciudad` VALUES ('367', 'EL CERCADO', '19', '1');
INSERT INTO `ciudad` VALUES ('368', 'GARCÃA', '19', '1');
INSERT INTO `ciudad` VALUES ('369', 'GUADALUPE', '19', '1');
INSERT INTO `ciudad` VALUES ('370', 'HUALAHUISES', '19', '1');
INSERT INTO `ciudad` VALUES ('371', 'LINARES', '19', '1');
INSERT INTO `ciudad` VALUES ('372', 'MONTEMORELOS', '19', '1');
INSERT INTO `ciudad` VALUES ('373', 'MONTERREY', '19', '1');
INSERT INTO `ciudad` VALUES ('374', 'SAN NICOLÃS DE LOS GARZA', '19', '1');
INSERT INTO `ciudad` VALUES ('375', 'SAN PEDRO GARZA GARCÃA', '19', '1');
INSERT INTO `ciudad` VALUES ('376', 'SANTIAGO', '19', '1');
INSERT INTO `ciudad` VALUES ('377', 'ASUNCIÃ“N NOCHIXTLÃN', '20', '1');
INSERT INTO `ciudad` VALUES ('378', 'BAHIAS DE HUATULCO', '20', '1');
INSERT INTO `ciudad` VALUES ('379', 'CHAHUITES', '20', '1');
INSERT INTO `ciudad` VALUES ('380', 'CIUDAD IXTEPEC', '20', '1');
INSERT INTO `ciudad` VALUES ('381', 'COSOLAPA', '20', '1');
INSERT INTO `ciudad` VALUES ('382', 'CUILÃPAM DE GUERRERO', '20', '1');
INSERT INTO `ciudad` VALUES ('383', 'EL CAMARÃ“N', '20', '1');
INSERT INTO `ciudad` VALUES ('384', 'EL ROSARIO', '20', '1');
INSERT INTO `ciudad` VALUES ('385', 'HEROICA CIUDAD DE EJUTLA DE CRESPO', '20', '1');
INSERT INTO `ciudad` VALUES ('386', 'HEROICA CIUDAD DE HUAJUAPAN DE LEÃ“N', '20', '1');
INSERT INTO `ciudad` VALUES ('387', 'HEROICA CIUDAD DE TLAXIACO', '20', '1');
INSERT INTO `ciudad` VALUES ('388', 'JUCHITÃN (JUCHITÃN DE ZARAGOZA)', '20', '1');
INSERT INTO `ciudad` VALUES ('389', 'LAGUNAS', '20', '1');
INSERT INTO `ciudad` VALUES ('390', 'LOMA BONITA', '20', '1');
INSERT INTO `ciudad` VALUES ('391', 'MARISCALA DE JUÃREZ', '20', '1');
INSERT INTO `ciudad` VALUES ('392', 'MATÃAS ROMERO AVENDAÃ‘O', '20', '1');
INSERT INTO `ciudad` VALUES ('393', 'MIAHUATLÃN DE PORFIRIO DÃAZ', '20', '1');
INSERT INTO `ciudad` VALUES ('394', 'NATIVIDAD', '20', '1');
INSERT INTO `ciudad` VALUES ('395', 'OAXACA DE JUÃREZ', '20', '1');
INSERT INTO `ciudad` VALUES ('396', 'OCOTLÃN DE MORELOS', '20', '1');
INSERT INTO `ciudad` VALUES ('397', 'PUERTO ESCONDIDO', '20', '1');
INSERT INTO `ciudad` VALUES ('398', 'PUTLA VILLA DE GUERRERO', '20', '1');
INSERT INTO `ciudad` VALUES ('399', 'RÃO GRANDE O PIEDRA PARADA', '20', '1');
INSERT INTO `ciudad` VALUES ('400', 'SALINA CRUZ', '20', '1');
INSERT INTO `ciudad` VALUES ('401', 'SAN ANTONIO DE LA CAL', '20', '1');
INSERT INTO `ciudad` VALUES ('402', 'SAN BLAS ATEMPA', '20', '1');
INSERT INTO `ciudad` VALUES ('403', 'SAN FELIPE JALAPA DE DÃAZ', '20', '1');
INSERT INTO `ciudad` VALUES ('404', 'SAN FRANCISCO IXHUATÃN', '20', '1');
INSERT INTO `ciudad` VALUES ('405', 'SAN FRANCISCO TELIXTLAHUACA', '20', '1');
INSERT INTO `ciudad` VALUES ('406', 'SAN JUAN BAUTISTA CUICATLÃN', '20', '1');
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
INSERT INTO `ciudad` VALUES ('418', 'SAN SEBASTIÃN TECOMAXTLAHUACA', '20', '1');
INSERT INTO `ciudad` VALUES ('419', 'SANTA CRUZ ITUNDUJIA', '20', '1');
INSERT INTO `ciudad` VALUES ('420', 'SANTA LUCIA DEL CAMINO', '20', '1');
INSERT INTO `ciudad` VALUES ('421', 'SANTA MARÃA HUATULCO', '20', '1');
INSERT INTO `ciudad` VALUES ('422', 'SANTIAGO JAMILTEPEC', '20', '1');
INSERT INTO `ciudad` VALUES ('423', 'SANTIAGO JUXTLAHUACA', '20', '1');
INSERT INTO `ciudad` VALUES ('424', 'SANTIAGO PINOTEPA NACIONAL', '20', '1');
INSERT INTO `ciudad` VALUES ('425', 'SANTIAGO SUCHILQUITONGO', '20', '1');
INSERT INTO `ciudad` VALUES ('426', 'SANTO DOMINGO TEHUANTEPEC', '20', '1');
INSERT INTO `ciudad` VALUES ('427', 'TEOTITLÃN DE FLORES MAGÃ“N', '20', '1');
INSERT INTO `ciudad` VALUES ('428', 'TLACOLULA DE MATAMOROS', '20', '1');
INSERT INTO `ciudad` VALUES ('429', 'UNIÃ“N HIDALGO', '20', '1');
INSERT INTO `ciudad` VALUES ('430', 'VICENTE CAMALOTE', '20', '1');
INSERT INTO `ciudad` VALUES ('431', 'VILLA DE TAMAZULÃPAM DEL PROGRESO', '20', '1');
INSERT INTO `ciudad` VALUES ('432', 'VILLA DE ZAACHILA', '20', '1');
INSERT INTO `ciudad` VALUES ('433', 'VILLA SOLA DE VEGA', '20', '1');
INSERT INTO `ciudad` VALUES ('434', 'ZIMATLÃN DE ÃLVAREZ', '20', '1');
INSERT INTO `ciudad` VALUES ('435', 'ACATLÃN DE OSORIO', '21', '1');
INSERT INTO `ciudad` VALUES ('436', 'AMOZOC', '21', '1');
INSERT INTO `ciudad` VALUES ('437', 'ATLIXCO', '21', '1');
INSERT INTO `ciudad` VALUES ('438', 'CIUDAD SERDÃN', '21', '1');
INSERT INTO `ciudad` VALUES ('439', 'CUAUTLANCINGO', '21', '1');
INSERT INTO `ciudad` VALUES ('440', 'HUAUCHINANGO', '21', '1');
INSERT INTO `ciudad` VALUES ('441', 'IZÃšCAR DE MATAMOROS', '21', '1');
INSERT INTO `ciudad` VALUES ('442', 'PUEBLA (HEROICA PUEBLA)', '21', '1');
INSERT INTO `ciudad` VALUES ('443', 'SAN ANDRÃ‰S CHOLULA', '21', '1');
INSERT INTO `ciudad` VALUES ('444', 'SAN MARTÃN TEXMELUCAN DE LABASTIDA', '21', '1');
INSERT INTO `ciudad` VALUES ('445', 'SAN PEDRO CHOLULA', '21', '1');
INSERT INTO `ciudad` VALUES ('446', 'TECAMACHALCO', '21', '1');
INSERT INTO `ciudad` VALUES ('447', 'TEHUACAN', '21', '1');
INSERT INTO `ciudad` VALUES ('448', 'TEPEACA', '21', '1');
INSERT INTO `ciudad` VALUES ('449', 'TEZIUTLAN', '21', '1');
INSERT INTO `ciudad` VALUES ('450', 'XICOTEPEC', '21', '1');
INSERT INTO `ciudad` VALUES ('451', 'ZACATLÃN', '21', '1');
INSERT INTO `ciudad` VALUES ('452', 'EL PUEBLITO', '22', '1');
INSERT INTO `ciudad` VALUES ('453', 'QUERÃ‰TARO', '22', '1');
INSERT INTO `ciudad` VALUES ('454', 'SAN JUAN DEL RIO', '22', '1');
INSERT INTO `ciudad` VALUES ('455', 'BACALAR', '23', '1');
INSERT INTO `ciudad` VALUES ('456', 'CANCÃšN', '23', '1');
INSERT INTO `ciudad` VALUES ('457', 'CHETUMAL', '23', '1');
INSERT INTO `ciudad` VALUES ('458', 'COZUMEL', '23', '1');
INSERT INTO `ciudad` VALUES ('459', 'FELIPE CARRILLO PUERTO', '23', '1');
INSERT INTO `ciudad` VALUES ('460', 'ISLA MUJERES', '23', '1');
INSERT INTO `ciudad` VALUES ('461', 'KANTUNILKÃN', '23', '1');
INSERT INTO `ciudad` VALUES ('462', 'PLAYA DEL CARMEN', '23', '1');
INSERT INTO `ciudad` VALUES ('463', 'CÃRDENAS', '24', '1');
INSERT INTO `ciudad` VALUES ('464', 'CEDRAL', '24', '1');
INSERT INTO `ciudad` VALUES ('465', 'CERRITOS', '24', '1');
INSERT INTO `ciudad` VALUES ('466', 'CHARCAS', '24', '1');
INSERT INTO `ciudad` VALUES ('467', 'CIUDAD DEL MAÃZ', '24', '1');
INSERT INTO `ciudad` VALUES ('468', 'CIUDAD VALLES', '24', '1');
INSERT INTO `ciudad` VALUES ('469', 'Ã‰BANO', '24', '1');
INSERT INTO `ciudad` VALUES ('470', 'EL NARANJO', '24', '1');
INSERT INTO `ciudad` VALUES ('471', 'FRACCIÃ“N EL REFUGIO', '24', '1');
INSERT INTO `ciudad` VALUES ('472', 'MATEHUALA', '24', '1');
INSERT INTO `ciudad` VALUES ('473', 'RIOVERDE', '24', '1');
INSERT INTO `ciudad` VALUES ('474', 'SALINAS DE HIDALGO', '24', '1');
INSERT INTO `ciudad` VALUES ('475', 'SAN LUIS POTOSÃ', '24', '1');
INSERT INTO `ciudad` VALUES ('476', 'SANTA MARÃA DEL RÃO', '24', '1');
INSERT INTO `ciudad` VALUES ('477', 'SOLEDAD DE GRACIANO SÃNCHEZ', '24', '1');
INSERT INTO `ciudad` VALUES ('478', 'TAMASOPO', '24', '1');
INSERT INTO `ciudad` VALUES ('479', 'TAMAZUNCHALE', '24', '1');
INSERT INTO `ciudad` VALUES ('480', 'TAMUIN', '24', '1');
INSERT INTO `ciudad` VALUES ('481', 'TIERRA NUEVA', '24', '1');
INSERT INTO `ciudad` VALUES ('482', 'VILLA DE REYES', '24', '1');
INSERT INTO `ciudad` VALUES ('483', 'AGUARUTO', '25', '1');
INSERT INTO `ciudad` VALUES ('484', 'AHOME', '25', '1');
INSERT INTO `ciudad` VALUES ('485', 'ANGOSTURA', '25', '1');
INSERT INTO `ciudad` VALUES ('486', 'CHOIX', '25', '1');
INSERT INTO `ciudad` VALUES ('487', 'COSALÃ', '25', '1');
INSERT INTO `ciudad` VALUES ('488', 'CULIACÃN ROSALES', '25', '1');
INSERT INTO `ciudad` VALUES ('489', 'EL ROSARIO', '25', '1');
INSERT INTO `ciudad` VALUES ('490', 'ESCUINAPA DE HIDALGO', '25', '1');
INSERT INTO `ciudad` VALUES ('491', 'ESTACIÃ“N NARANJO', '25', '1');
INSERT INTO `ciudad` VALUES ('492', 'GUAMÃšCHIL', '25', '1');
INSERT INTO `ciudad` VALUES ('493', 'GUASAVE', '25', '1');
INSERT INTO `ciudad` VALUES ('494', 'HIGUERA DE ZARAGOZA', '25', '1');
INSERT INTO `ciudad` VALUES ('495', 'LA CRUZ', '25', '1');
INSERT INTO `ciudad` VALUES ('496', 'LIC. BENITO JUÃREZ (CAMPO GOBIERNO)', '25', '1');
INSERT INTO `ciudad` VALUES ('497', 'LOS MOCHIS', '25', '1');
INSERT INTO `ciudad` VALUES ('498', 'MAZATLÃN', '25', '1');
INSERT INTO `ciudad` VALUES ('499', 'MOCORITO', '25', '1');
INSERT INTO `ciudad` VALUES ('500', 'NAVOLATO', '25', '1');
INSERT INTO `ciudad` VALUES ('501', 'QUILA', '25', '1');
INSERT INTO `ciudad` VALUES ('502', 'SAN BLAS', '25', '1');
INSERT INTO `ciudad` VALUES ('503', 'SAN IGNACIO', '25', '1');
INSERT INTO `ciudad` VALUES ('504', 'SINALOA DE LEYVA', '25', '1');
INSERT INTO `ciudad` VALUES ('505', 'TOPOLOBAMPO', '25', '1');
INSERT INTO `ciudad` VALUES ('506', 'VILLA UNIÃ“N', '25', '1');
INSERT INTO `ciudad` VALUES ('507', 'AGUA PRIETA', '26', '1');
INSERT INTO `ciudad` VALUES ('508', 'CIUDAD OBREGÃ“N', '26', '1');
INSERT INTO `ciudad` VALUES ('509', 'EMPALME', '26', '1');
INSERT INTO `ciudad` VALUES ('510', 'HERMOSILLO', '26', '1');
INSERT INTO `ciudad` VALUES ('511', 'HEROICA CABORCA', '26', '1');
INSERT INTO `ciudad` VALUES ('512', 'HEROICA CIUDAD DE CANANEA', '26', '1');
INSERT INTO `ciudad` VALUES ('513', 'HEROICA GUAYMAS', '26', '1');
INSERT INTO `ciudad` VALUES ('514', 'HEROICA NOGALES', '26', '1');
INSERT INTO `ciudad` VALUES ('515', 'HUATABAMPO', '26', '1');
INSERT INTO `ciudad` VALUES ('516', 'MAGDALENA DE KINO', '26', '1');
INSERT INTO `ciudad` VALUES ('517', 'NAVOJOA', '26', '1');
INSERT INTO `ciudad` VALUES ('518', 'PUERTO PEÃ‘ASCO', '26', '1');
INSERT INTO `ciudad` VALUES ('519', 'SAN LUIS RÃO COLORADO', '26', '1');
INSERT INTO `ciudad` VALUES ('520', 'SONOITA', '26', '1');
INSERT INTO `ciudad` VALUES ('521', 'CÃRDENAS', '27', '1');
INSERT INTO `ciudad` VALUES ('522', 'COMALCALCO', '27', '1');
INSERT INTO `ciudad` VALUES ('523', 'CUNDUACÃN', '27', '1');
INSERT INTO `ciudad` VALUES ('524', 'EMILIANO ZAPATA', '27', '1');
INSERT INTO `ciudad` VALUES ('525', 'FRONTERA', '27', '1');
INSERT INTO `ciudad` VALUES ('526', 'HUIMANGUILLO', '27', '1');
INSERT INTO `ciudad` VALUES ('527', 'JALPA DE MÃ‰NDEZ', '27', '1');
INSERT INTO `ciudad` VALUES ('528', 'MACUSPANA', '27', '1');
INSERT INTO `ciudad` VALUES ('529', 'PARAÃSO', '27', '1');
INSERT INTO `ciudad` VALUES ('530', 'TEAPA', '27', '1');
INSERT INTO `ciudad` VALUES ('531', 'TENOSIQUE DE PINO SUÃREZ', '27', '1');
INSERT INTO `ciudad` VALUES ('532', 'VILLAHERMOSA', '27', '1');
INSERT INTO `ciudad` VALUES ('533', 'ALTAMIRA', '28', '1');
INSERT INTO `ciudad` VALUES ('534', 'CIUDAD CAMARGO', '28', '1');
INSERT INTO `ciudad` VALUES ('535', 'CIUDAD GUSTAVO DÃAZ ORDAZ', '28', '1');
INSERT INTO `ciudad` VALUES ('536', 'CIUDAD MADERO', '28', '1');
INSERT INTO `ciudad` VALUES ('537', 'CIUDAD MANTE', '28', '1');
INSERT INTO `ciudad` VALUES ('538', 'CIUDAD MIGUEL ALEMÃN', '28', '1');
INSERT INTO `ciudad` VALUES ('539', 'CIUDAD RÃO BRAVO', '28', '1');
INSERT INTO `ciudad` VALUES ('540', 'CIUDAD TULA', '28', '1');
INSERT INTO `ciudad` VALUES ('541', 'CIUDAD VICTORIA', '28', '1');
INSERT INTO `ciudad` VALUES ('542', 'ESTACIÃ“N MANUEL (ÃšRSULO GALVÃN)', '28', '1');
INSERT INTO `ciudad` VALUES ('543', 'GONZÃLEZ', '28', '1');
INSERT INTO `ciudad` VALUES ('544', 'HEROICA MATAMOROS', '28', '1');
INSERT INTO `ciudad` VALUES ('545', 'JAUMAVE', '28', '1');
INSERT INTO `ciudad` VALUES ('546', 'NUEVA CIUDAD GUERRERO', '28', '1');
INSERT INTO `ciudad` VALUES ('547', 'NUEVO LAREDO', '28', '1');
INSERT INTO `ciudad` VALUES ('548', 'REYNOSA', '28', '1');
INSERT INTO `ciudad` VALUES ('549', 'SAN FERNANDO', '28', '1');
INSERT INTO `ciudad` VALUES ('550', 'SOTO LA MARINA', '28', '1');
INSERT INTO `ciudad` VALUES ('551', 'TAMPICO', '28', '1');
INSERT INTO `ciudad` VALUES ('552', 'VALLE HERMOSO', '28', '1');
INSERT INTO `ciudad` VALUES ('553', 'XICOTÃ‰NCATL', '28', '1');
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
INSERT INTO `ciudad` VALUES ('564', 'ÃNGEL R. CABADA', '30', '1');
INSERT INTO `ciudad` VALUES ('565', 'ATOYAC', '30', '1');
INSERT INTO `ciudad` VALUES ('566', 'BANDERILLA', '30', '1');
INSERT INTO `ciudad` VALUES ('567', 'BOCA DEL RÃO', '30', '1');
INSERT INTO `ciudad` VALUES ('568', 'CARLOS A. CARRILLO', '30', '1');
INSERT INTO `ciudad` VALUES ('569', 'CATEMACO', '30', '1');
INSERT INTO `ciudad` VALUES ('570', 'CAZONES DE HERRERA', '30', '1');
INSERT INTO `ciudad` VALUES ('571', 'CERRO AZUL', '30', '1');
INSERT INTO `ciudad` VALUES ('572', 'COATEPEC', '30', '1');
INSERT INTO `ciudad` VALUES ('573', 'COATZACOALCOS', '30', '1');
INSERT INTO `ciudad` VALUES ('574', 'COATZINTLA', '30', '1');
INSERT INTO `ciudad` VALUES ('575', 'CÃ“RDOBA', '30', '1');
INSERT INTO `ciudad` VALUES ('576', 'COSAMALOAPAN', '30', '1');
INSERT INTO `ciudad` VALUES ('577', 'COSOLEACAQUE', '30', '1');
INSERT INTO `ciudad` VALUES ('578', 'CUICHAPA', '30', '1');
INSERT INTO `ciudad` VALUES ('579', 'CUITLÃHUAC', '30', '1');
INSERT INTO `ciudad` VALUES ('580', 'EL HIGO', '30', '1');
INSERT INTO `ciudad` VALUES ('581', 'FORTÃN DE LAS FLORES', '30', '1');
INSERT INTO `ciudad` VALUES ('582', 'GENERAL MIGUEL ALEMÃN (POTRERO NUEVO)', '30', '1');
INSERT INTO `ciudad` VALUES ('583', 'GUTIÃ‰RREZ ZAMORA', '30', '1');
INSERT INTO `ciudad` VALUES ('584', 'HUATUSCO DE CHICUELLAR', '30', '1');
INSERT INTO `ciudad` VALUES ('585', 'HUAYACOCOTLA', '30', '1');
INSERT INTO `ciudad` VALUES ('586', 'HUILOAPAN DE CUAUHTÃ‰MOC', '30', '1');
INSERT INTO `ciudad` VALUES ('587', 'ISLA', '30', '1');
INSERT INTO `ciudad` VALUES ('588', 'IXTACZOQUITLÃN', '30', '1');
INSERT INTO `ciudad` VALUES ('589', 'JÃLTIPAN DE MORELOS', '30', '1');
INSERT INTO `ciudad` VALUES ('590', 'JOSÃ‰ CARDEL', '30', '1');
INSERT INTO `ciudad` VALUES ('591', 'JUAN DÃAZ COVARRUBIAS', '30', '1');
INSERT INTO `ciudad` VALUES ('592', 'JUAN RODRÃGUEZ CLARA', '30', '1');
INSERT INTO `ciudad` VALUES ('593', 'LAS CHOAPAS', '30', '1');
INSERT INTO `ciudad` VALUES ('594', 'LERDO DE TEJADA', '30', '1');
INSERT INTO `ciudad` VALUES ('595', 'MINATITLÃN', '30', '1');
INSERT INTO `ciudad` VALUES ('596', 'NARANJOS', '30', '1');
INSERT INTO `ciudad` VALUES ('597', 'NOGALES', '30', '1');
INSERT INTO `ciudad` VALUES ('598', 'ORIZABA', '30', '1');
INSERT INTO `ciudad` VALUES ('599', 'PÃNUCO', '30', '1');
INSERT INTO `ciudad` VALUES ('600', 'PAPANTLA DE OLARTE', '30', '1');
INSERT INTO `ciudad` VALUES ('601', 'PARAJE NUEVO', '30', '1');
INSERT INTO `ciudad` VALUES ('602', 'PASO DE OVEJAS', '30', '1');
INSERT INTO `ciudad` VALUES ('603', 'PASO DEL MACHO', '30', '1');
INSERT INTO `ciudad` VALUES ('604', 'PLATÃ“N SÃNCHEZ', '30', '1');
INSERT INTO `ciudad` VALUES ('605', 'PLAYA VICENTE', '30', '1');
INSERT INTO `ciudad` VALUES ('606', 'POZA RICA DE HIDALGO', '30', '1');
INSERT INTO `ciudad` VALUES ('607', 'RÃO BLANCO', '30', '1');
INSERT INTO `ciudad` VALUES ('608', 'SAN ANDRÃ‰S TUXTLA', '30', '1');
INSERT INTO `ciudad` VALUES ('609', 'SAN RAFAEL', '30', '1');
INSERT INTO `ciudad` VALUES ('610', 'SANTIAGO TUXTLA', '30', '1');
INSERT INTO `ciudad` VALUES ('611', 'SIHUAPAN', '30', '1');
INSERT INTO `ciudad` VALUES ('612', 'SOLEDAD DE DOBLADO', '30', '1');
INSERT INTO `ciudad` VALUES ('613', 'TAMPICO ALTO', '30', '1');
INSERT INTO `ciudad` VALUES ('614', 'TANTOYUCA', '30', '1');
INSERT INTO `ciudad` VALUES ('615', 'TEMPOAL DE SÃNCHEZ', '30', '1');
INSERT INTO `ciudad` VALUES ('616', 'TEZONAPA', '30', '1');
INSERT INTO `ciudad` VALUES ('617', 'TIERRA BLANCA', '30', '1');
INSERT INTO `ciudad` VALUES ('618', 'TIHUATLÃN', '30', '1');
INSERT INTO `ciudad` VALUES ('619', 'TLACOJALPAN', '30', '1');
INSERT INTO `ciudad` VALUES ('620', 'TLAPACOYAN', '30', '1');
INSERT INTO `ciudad` VALUES ('621', 'TRES VALLES', '30', '1');
INSERT INTO `ciudad` VALUES ('622', 'TÃšXPAM DE RODRÃGUEZ CANO', '30', '1');
INSERT INTO `ciudad` VALUES ('623', 'VERACRUZ', '30', '1');
INSERT INTO `ciudad` VALUES ('624', 'XALAPA-ENRÃQUEZ', '30', '1');
INSERT INTO `ciudad` VALUES ('625', 'YECUATLA', '30', '1');
INSERT INTO `ciudad` VALUES ('626', 'KANASÃN', '31', '1');
INSERT INTO `ciudad` VALUES ('627', 'MÃ‰RIDA', '31', '1');
INSERT INTO `ciudad` VALUES ('628', 'MOTUL DE CARRILLO PUERTO', '31', '1');
INSERT INTO `ciudad` VALUES ('629', 'TICUL', '31', '1');
INSERT INTO `ciudad` VALUES ('630', 'TIZIMÃN', '31', '1');
INSERT INTO `ciudad` VALUES ('631', 'VALLADOLID', '31', '1');
INSERT INTO `ciudad` VALUES ('632', 'CIUDAD CUAUHTÃ‰MOC', '32', '1');
INSERT INTO `ciudad` VALUES ('633', 'FRESNILLO', '32', '1');
INSERT INTO `ciudad` VALUES ('634', 'GUADALUPE', '32', '1');
INSERT INTO `ciudad` VALUES ('635', 'JALPA', '32', '1');
INSERT INTO `ciudad` VALUES ('636', 'JEREZ DE GARCÃA SALINAS', '32', '1');
INSERT INTO `ciudad` VALUES ('637', 'JUAN ALDAMA', '32', '1');
INSERT INTO `ciudad` VALUES ('638', 'LORETO', '32', '1');
INSERT INTO `ciudad` VALUES ('639', 'LUIS MOYA', '32', '1');
INSERT INTO `ciudad` VALUES ('640', 'MOYAHUA DE ESTRADA', '32', '1');
INSERT INTO `ciudad` VALUES ('641', 'NOCHISTLÃN DE MEJÃA', '32', '1');
INSERT INTO `ciudad` VALUES ('642', 'OJOCALIENTE', '32', '1');
INSERT INTO `ciudad` VALUES ('643', 'RÃO GRANDE', '32', '1');
INSERT INTO `ciudad` VALUES ('644', 'SOMBRERETE', '32', '1');
INSERT INTO `ciudad` VALUES ('645', 'VALPARAÃSO', '32', '1');
INSERT INTO `ciudad` VALUES ('646', 'VÃCTOR ROSALES', '32', '1');
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
  UNIQUE KEY `CO_codigo_UNIQUE` (`coordinaciona`),
  KEY `fk_coordinaciona_programaedu1_idx` (`programaedu`),
  KEY `fk_coordinaciona_users1_idx` (`users_id`),
  CONSTRAINT `fk_coordinaciona_programaedu1` FOREIGN KEY (`programaedu`) REFERENCES `programaedu` (`programaedu`),
  CONSTRAINT `fk_coordinaciona_users1` FOREIGN KEY (`users_id`) REFERENCES `users_delia` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

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
  `uaprendizaje` int(11) NOT NULL COMMENT 'U aprendizaje',
  `reqseriacion` int(11) NOT NULL,
  `uaprequisito` int(11) NOT NULL COMMENT 'Uap requisito',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  KEY `fk_detalleseriacion_uaprendizaje1_idx` (`uaprendizaje`),
  KEY `fk_detalleseriacion_uaprendizaje2_idx` (`uaprequisito`),
  KEY `fk_detalleseriacion_users1_idx` (`users_id`),
  KEY `fk_detalleseriacion_reqseriacion1` (`reqseriacion`),
  CONSTRAINT `fk_detalleseriacion_reqseriacion1` FOREIGN KEY (`reqseriacion`) REFERENCES `reqseriacion` (`reqseriacion`) ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalleseriacion_uaprendizaje1` FOREIGN KEY (`uaprendizaje`) REFERENCES `uaprendizaje` (`uaprendizaje`) ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalleseriacion_uaprendizaje2` FOREIGN KEY (`uaprequisito`) REFERENCES `uaprendizaje` (`uaprendizaje`) ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalleseriacion_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of detalleseriacion
-- ----------------------------
INSERT INTO `detalleseriacion` VALUES ('11237', '2', '11237', '9');
INSERT INTO `detalleseriacion` VALUES ('11238', '2', '11236', '9');
INSERT INTO `detalleseriacion` VALUES ('11238', '1', '11237', '9');
INSERT INTO `detalleseriacion` VALUES ('11239', '1', '11237', '9');

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
  CONSTRAINT `fk_dias_users1` FOREIGN KEY (`users_id`) REFERENCES `users_delia` (`id`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of dias
-- ----------------------------

-- ----------------------------
-- Table structure for disp_hrs_dias
-- ----------------------------
DROP TABLE IF EXISTS `disp_hrs_dias`;
CREATE TABLE `disp_hrs_dias` (
  `disponibilidad_hrs_dias` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Consec disponib',
  `periodo` int(11) NOT NULL COMMENT 'Periodo escolar',
  `empleado` int(11) NOT NULL COMMENT 'Docente Disponible',
  `dia` int(11) NOT NULL COMMENT 'Dia disponible',
  `hora` int(11) NOT NULL COMMENT 'Hora Disponible',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`disponibilidad_hrs_dias`),
  KEY `fk_disponibilidad_empleados1_idx` (`empleado`),
  KEY `fk_disponibilidad_dias1_idx` (`dia`),
  KEY `fk_disponibilidad_horas1_idx` (`hora`),
  KEY `fk_disp_hrs_dias_periodos1_idx` (`periodo`),
  KEY `fk_disp_hrs_dias_users1_idx` (`users_id`),
  CONSTRAINT `fk_disponibilidad_dias1` FOREIGN KEY (`dia`) REFERENCES `dias` (`dia`),
  CONSTRAINT `fk_disponibilidad_empleados1` FOREIGN KEY (`empleado`) REFERENCES `empleados` (`empleado`),
  CONSTRAINT `fk_disponibilidad_horas1` FOREIGN KEY (`hora`) REFERENCES `horas` (`hora`),
  CONSTRAINT `fk_disp_hrs_dias_periodos1` FOREIGN KEY (`periodo`) REFERENCES `periodos` (`periodo`),
  CONSTRAINT `fk_disp_hrs_dias_users1` FOREIGN KEY (`users_id`) REFERENCES `users_delia` (`id`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of disp_hrs_dias
-- ----------------------------

-- ----------------------------
-- Table structure for disp_ua
-- ----------------------------
DROP TABLE IF EXISTS `disp_ua`;
CREATE TABLE `disp_ua` (
  `disponibilidad_ua` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo disponibilidad',
  `periodo` int(11) NOT NULL COMMENT 'Periodo escolar',
  `empleado` int(11) NOT NULL COMMENT 'Docente disponible',
  `uaprendizaje` int(11) NOT NULL COMMENT 'uac disponible',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`disponibilidad_ua`),
  KEY `fk_disp_ua_empleados1_idx` (`empleado`),
  KEY `fk_disp_ua_periodos1_idx` (`periodo`),
  KEY `fk_disp_ua_uaprendizaje1_idx` (`uaprendizaje`),
  KEY `fk_disp_ua_users1_idx` (`users_id`),
  CONSTRAINT `fk_disp_ua_empleados1` FOREIGN KEY (`empleado`) REFERENCES `empleados` (`empleado`),
  CONSTRAINT `fk_disp_ua_periodos1` FOREIGN KEY (`periodo`) REFERENCES `periodos` (`periodo`),
  CONSTRAINT `fk_disp_ua_uaprendizaje1` FOREIGN KEY (`uaprendizaje`) REFERENCES `uaprendizaje` (`uaprendizaje`),
  CONSTRAINT `fk_disp_ua_users1` FOREIGN KEY (`users_id`) REFERENCES `users_delia` (`id`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  CONSTRAINT `fk_doctos_users1` FOREIGN KEY (`users_id`) REFERENCES `users_delia` (`id`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of doctos
-- ----------------------------

-- ----------------------------
-- Table structure for documentos_emp
-- ----------------------------
DROP TABLE IF EXISTS `documentos_emp`;
CREATE TABLE `documentos_emp` (
  `docto` int(11) NOT NULL COMMENT 'Codigo documento',
  `empleado` int(11) NOT NULL COMMENT 'Codigo Empleado',
  `ruta` varchar(60) NOT NULL COMMENT 'Ruta fisica docto',
  `observaciones` varchar(60) DEFAULT NULL COMMENT 'Observaciones documento',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`docto`,`empleado`),
  KEY `fk_doctos_has_empleados_empleados1_idx` (`empleado`),
  KEY `fk_doctos_has_empleados_doctos1_idx` (`docto`),
  KEY `fk_documentos_emp_users1_idx` (`users_id`),
  CONSTRAINT `fk_doctos_has_empleados_doctos1` FOREIGN KEY (`docto`) REFERENCES `doctos` (`docto`) ON UPDATE NO ACTION,
  CONSTRAINT `fk_doctos_has_empleados_empleados1` FOREIGN KEY (`empleado`) REFERENCES `empleados` (`empleado`) ON UPDATE NO ACTION,
  CONSTRAINT `fk_documentos_emp_users1` FOREIGN KEY (`users_id`) REFERENCES `users_delia` (`id`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of documentos_emp
-- ----------------------------

-- ----------------------------
-- Table structure for empleados
-- ----------------------------
DROP TABLE IF EXISTS `empleados`;
CREATE TABLE `empleados` (
  `empleado` int(11) NOT NULL COMMENT 'Num empleado UABC',
  `nombres` varchar(30) NOT NULL COMMENT 'Nombre',
  `paterno` varchar(20) NOT NULL COMMENT 'Paterno',
  `materno` varchar(20) DEFAULT NULL COMMENT 'Materno',
  `status` int(11) NOT NULL COMMENT 'Status',
  `sexo` char(1) NOT NULL COMMENT 'Sexo',
  `rfc` varchar(13) NOT NULL COMMENT 'RFC empleado',
  `fec_nac` date NOT NULL COMMENT 'Fecha nacimiento',
  `fec_ing` date NOT NULL COMMENT 'Fecha ingreso a UABC',
  `email_vigente` varchar(30) NOT NULL COMMENT 'Email',
  `email_alternat` varchar(45) NOT NULL COMMENT 'email alternativo',
  `hrstope` int(11) NOT NULL COMMENT 'Maximo hrs a impartir',
  `hrslic` int(11) NOT NULL COMMENT 'Hrs en licenciatura',
  `hrspost` int(11) NOT NULL COMMENT 'Hrs en postgrado',
  `ciudad` int(11) NOT NULL DEFAULT '16' COMMENT 'Ciudad residencia docente',
  `calle` varchar(45) NOT NULL COMMENT 'Calle residencia docente',
  `no_int` int(11) NOT NULL COMMENT 'No interior residencia docente',
  `no_ext` varchar(3) DEFAULT NULL COMMENT 'No exterior residencia docente',
  `colonia` varchar(45) NOT NULL COMMENT 'Colonia residencia docente',
  `cp` int(11) DEFAULT NULL COMMENT 'cp residencia docente',
  `telofna` varchar(45) DEFAULT NULL COMMENT 'Tel oficina',
  `telcasa` varchar(45) DEFAULT NULL COMMENT 'Tel casa',
  `telcel` varchar(45) NOT NULL COMMENT 'Celular obligatorio',
  `categoria` int(11) NOT NULL COMMENT 'Categ contrato (Tie Compl, Asignat..)',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`empleado`),
  UNIQUE KEY `DO_codigo_UNIQUE` (`empleado`),
  KEY `fk_empleados_ciudad1_idx` (`ciudad`),
  KEY `fk_empleados_categorias1_idx` (`categoria`),
  KEY `fk_empleados_users1_idx` (`users_id`),
  CONSTRAINT `fk_empleados_categorias1` FOREIGN KEY (`categoria`) REFERENCES `categorias` (`categoria`),
  CONSTRAINT `fk_empleados_ciudad1` FOREIGN KEY (`ciudad`) REFERENCES `ciudad` (`ciudad`),
  CONSTRAINT `fk_empleados_users1` FOREIGN KEY (`users_id`) REFERENCES `users_delia` (`id`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of empleados
-- ----------------------------
INSERT INTO `empleados` VALUES ('1', 'MARGARITA', 'RAMIREZ', 'RAMIREZ', '1', 'F', 'DSDSD', '2014-06-01', '2014-06-01', 'MAGUIRAM@UABC.EDU.MX', 'MAGUIRAM@UABC.EDU.MX', '20', '10', '10', '16', 'DESCONOCIDA1', '10', 'A', 'CACHO', '34000', '116530', '115368', '123567', '101', '1');
INSERT INTO `empleados` VALUES ('2', 'NORA DEL CARMEN', 'OSUNA', 'MILLAN', '1', 'F', 'FDFSF', '2014-06-01', '2014-04-06', 'NORA.OSUNA@UABC.EDU.MX', 'NORA.OSUNA@HOTMAIL.COM', '20', '10', '10', '16', 'DESCONOCIDA2', '20', null, 'CACHO2', '35000', '116530', '115368', '1236789', '101', '1');
INSERT INTO `empleados` VALUES ('3', 'ESPERANZA', 'MANRIQUE', null, '1', 'F', 'FFDDS', '2014-06-02', '2014-03-02', 'EMANRIQUE@UABC.EDU.MX', 'EMANRIQUE@HOTMAIL.COM', '20', '10', '10', '16', 'DESCONOCIDA3', '200', '1', 'CACHO2', '2355', '116530', '115368', '1236789', '101', '1');
INSERT INTO `empleados` VALUES ('4', 'EMMA SOFIA', 'CASTILLEJOS', 'CABALLERO', '1', 'F', 'DFSS', '2014-06-01', '2014-04-06', 'EMA.CASTILLEJOS@UABC.EDU.MX', 'EMA.CASTILLEJOS@HOTMAIL.COM', '20', '10', '10', '16', 'DESCONOCIDA 100', '234', '1', 'CACHO1', '34000', '116530', '115368', '1236789', '101', '1');

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
  CONSTRAINT `fk_empresa_adic_users1` FOREIGN KEY (`users_id`) REFERENCES `users_delia` (`id`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of empresa_adic
-- ----------------------------

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
  CONSTRAINT `fk_esp_prog_edu_users1` FOREIGN KEY (`users_id`) REFERENCES `users_delia` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COMMENT='<double-click to overwrite multiple objects>';

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
  CONSTRAINT `fk_estado_users1` FOREIGN KEY (`users_id`) REFERENCES `users_delia` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1 COMMENT='<double-click to overwrite multiple objects>';

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
  CONSTRAINT `fk_etapas_users1` FOREIGN KEY (`users_id`) REFERENCES `users_delia` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

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
  CONSTRAINT `fk_grupos_users1` FOREIGN KEY (`users_id`) REFERENCES `users_delia` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of grupos
-- ----------------------------

-- ----------------------------
-- Table structure for horarios
-- ----------------------------
DROP TABLE IF EXISTS `horarios`;
CREATE TABLE `horarios` (
  `grupo` int(11) NOT NULL COMMENT 'Gpo',
  `periodo` int(11) NOT NULL COMMENT 'Periodo',
  `uaprendizaje` int(11) NOT NULL COMMENT 'codigo uap',
  `empleado` int(11) NOT NULL COMMENT 'Docente',
  `dia` int(11) NOT NULL COMMENT 'Dia asignado',
  `hora` int(11) NOT NULL COMMENT 'Horario asignado',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  KEY `fk_horarios_empleados1_idx` (`empleado`),
  KEY `fk_horarios_horas1_idx` (`hora`),
  KEY `fk_horarios_dias1_idx` (`dia`),
  KEY `fk_horarios_users1_idx` (`users_id`),
  KEY `fk_horarios_uaprendizaje1_idx` (`uaprendizaje`),
  KEY `fk_horarios_grupos1_idx` (`grupo`,`periodo`),
  CONSTRAINT `fk_horarios_dias1` FOREIGN KEY (`dia`) REFERENCES `dias` (`dia`),
  CONSTRAINT `fk_horarios_empleados1` FOREIGN KEY (`empleado`) REFERENCES `empleados` (`empleado`),
  CONSTRAINT `fk_horarios_grupos1` FOREIGN KEY (`grupo`, `periodo`) REFERENCES `grupos` (`grupo`, `periodo`) ON UPDATE NO ACTION,
  CONSTRAINT `fk_horarios_horas1` FOREIGN KEY (`hora`) REFERENCES `horas` (`hora`),
  CONSTRAINT `fk_horarios_uaprendizaje1` FOREIGN KEY (`uaprendizaje`) REFERENCES `uaprendizaje` (`uaprendizaje`) ON UPDATE NO ACTION,
  CONSTRAINT `fk_horarios_users1` FOREIGN KEY (`users_id`) REFERENCES `users_delia` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  CONSTRAINT `fk_horas_users1` FOREIGN KEY (`users_id`) REFERENCES `users_delia` (`id`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of horas
-- ----------------------------

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
  CONSTRAINT `fk_nvprograma_users1` FOREIGN KEY (`users_id`) REFERENCES `users_delia` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COMMENT='<double-click to overwrite multiple objects>';

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
  CONSTRAINT `fk_pais_users1` FOREIGN KEY (`users_id`) REFERENCES `users_delia` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=238 DEFAULT CHARSET=latin1;

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
  CONSTRAINT `fk_periodos_users1` FOREIGN KEY (`users_id`) REFERENCES `users_delia` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of periodos
-- ----------------------------

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
  CONSTRAINT `fk_periodo_prog_edu_users1` FOREIGN KEY (`users_id`) REFERENCES `users_delia` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

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
  `fecfinvig` date DEFAULT NULL COMMENT 'Fecha Fin Vigencia',
  `nivel` int(11) NOT NULL COMMENT 'Lic, post',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`plan`),
  KEY `fk_planestudiodesc_users1_idx` (`users_id`),
  KEY `fk_planestudiodesc_nvprograma1_idx` (`nivel`),
  CONSTRAINT `fk_planestudiodesc_nvprograma1` FOREIGN KEY (`nivel`) REFERENCES `nvprograma` (`nivel`) ON UPDATE NO ACTION,
  CONSTRAINT `fk_planestudiodesc_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of planestudio
-- ----------------------------
INSERT INTO `planestudio` VALUES ('20092', 'Plan 2009-2 SEP 534523', '800', '2014-10-01', '2014-10-31', '1', '9');

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of plan_programa
-- ----------------------------
INSERT INTO `plan_programa` VALUES ('20092', '1', '9');
INSERT INTO `plan_programa` VALUES ('20092', '2', '9');
INSERT INTO `plan_programa` VALUES ('20092', '3', '9');
INSERT INTO `plan_programa` VALUES ('20092', '4', '9');
INSERT INTO `plan_programa` VALUES ('20092', '5', '9');
INSERT INTO `plan_programa` VALUES ('20092', '6', '9');
INSERT INTO `plan_programa` VALUES ('20092', '7', '9');

-- ----------------------------
-- Table structure for programaedu
-- ----------------------------
DROP TABLE IF EXISTS `programaedu`;
CREATE TABLE `programaedu` (
  `programaedu` int(11) NOT NULL COMMENT 'Código Programa Educativo( Carrera)',
  `descripcion` varchar(60) NOT NULL COMMENT 'Descripción detallenivprog (carrera)',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1=Activa/0=Baja',
  `empleado` int(11) NOT NULL COMMENT 'No empl. coordinador',
  `uacademica` int(11) NOT NULL COMMENT 'Uacademica',
  `especialidad` int(11) DEFAULT NULL COMMENT 'Especialidad programa educativo',
  `nivel` int(11) NOT NULL DEFAULT '1' COMMENT 'Codigo nivel (Lic, post)',
  `periodo_pedu` int(11) NOT NULL DEFAULT '1' COMMENT 'Codigo periodo pe para especificar 1=semestral/2=cuatrimestral',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`programaedu`),
  UNIQUE KEY `DNP_codigo_UNIQUE` (`programaedu`),
  KEY `fk_programaedu_empleados1_idx` (`empleado`),
  KEY `fk_programaedu_uacademica1_idx` (`uacademica`),
  KEY `fk_programaedu_esp_prog_edu1_idx` (`especialidad`),
  KEY `fk_programaedu_nvprograma1_idx` (`nivel`),
  KEY `fk_programaedu_periodo_prog_edu1_idx` (`periodo_pedu`),
  KEY `fk_programaedu_users1_idx` (`users_id`),
  CONSTRAINT `fk_programaedu_empleados1` FOREIGN KEY (`empleado`) REFERENCES `empleados` (`empleado`),
  CONSTRAINT `fk_programaedu_esp_prog_edu1` FOREIGN KEY (`especialidad`) REFERENCES `esp_prog_edu` (`especialidad`),
  CONSTRAINT `fk_programaedu_nvprograma1` FOREIGN KEY (`nivel`) REFERENCES `nvprograma` (`nivel`),
  CONSTRAINT `fk_programaedu_periodo_prog_edu1` FOREIGN KEY (`periodo_pedu`) REFERENCES `periodo_prog_edu` (`periodo_pedu`),
  CONSTRAINT `fk_programaedu_uacademica1` FOREIGN KEY (`uacademica`) REFERENCES `uacademica` (`uacademica`),
  CONSTRAINT `fk_programaedu_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='<double-click to overwrite multiple objects>';

-- ----------------------------
-- Records of programaedu
-- ----------------------------
INSERT INTO `programaedu` VALUES ('1', 'ARTES', '1', '2', '1', null, '1', '1', '9');
INSERT INTO `programaedu` VALUES ('2', 'ADMON. DE EMPRESAS', '1', '2', '1', null, '1', '1', '9');
INSERT INTO `programaedu` VALUES ('3', 'INFORMATICA', '1', '3', '1', null, '1', '1', '9');
INSERT INTO `programaedu` VALUES ('4', 'NEGOCIOS INTERNACIONALES', '1', '4', '1', null, '1', '1', '9');
INSERT INTO `programaedu` VALUES ('5', 'CONTADURIA', '1', '4', '1', null, '1', '1', '9');
INSERT INTO `programaedu` VALUES ('6', 'TRONCO COMUN', '1', '4', '1', null, '1', '1', '9');
INSERT INTO `programaedu` VALUES ('7', 'SISTEMAS COMPUTACIONALES', '1', '2', '1', null, '1', '1', '9');

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
  CONSTRAINT `fk_puesto_users1` FOREIGN KEY (`users_id`) REFERENCES `users_delia` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COMMENT='<double-click to overwrite multiple objects>';

-- ----------------------------
-- Records of puesto
-- ----------------------------
INSERT INTO `puesto` VALUES ('1', 'DIRECTOR', '1');
INSERT INTO `puesto` VALUES ('2', 'SUBDIRECTOR', '1');
INSERT INTO `puesto` VALUES ('3', 'ADMINISTRADOR', '1');
INSERT INTO `puesto` VALUES ('4', 'DOCENTE', '1');

-- ----------------------------
-- Table structure for puestosemp
-- ----------------------------
DROP TABLE IF EXISTS `puestosemp`;
CREATE TABLE `puestosemp` (
  `empleado` int(11) NOT NULL COMMENT 'No. Empleado',
  `uacademica` int(11) NOT NULL COMMENT 'Codigo uacademica (FCQ, FCA)',
  `puesto` int(11) NOT NULL COMMENT 'Codigo puesto',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  KEY `fk_directivosua_uacademica1_idx` (`uacademica`),
  KEY `fk_directivosua_directivopuesto1_idx` (`puesto`),
  KEY `fk_directivosua_users1_idx` (`users_id`),
  KEY `fk_directivosua_empleados1_idx` (`empleado`),
  CONSTRAINT `fk_puestosemp_empleados1` FOREIGN KEY (`empleado`) REFERENCES `empleados` (`empleado`),
  CONSTRAINT `fk_puestosemp_puesto1` FOREIGN KEY (`puesto`) REFERENCES `puesto` (`puesto`),
  CONSTRAINT `fk_puestosemp_uacademica1` FOREIGN KEY (`uacademica`) REFERENCES `uacademica` (`uacademica`),
  CONSTRAINT `fk_puestosemp_users1` FOREIGN KEY (`users_id`) REFERENCES `users_delia` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`programaedu`,`uaprendizaje`),
  KEY `fk_p_ua_programaedu1_idx` (`programaedu`),
  KEY `fk_p_ua_uaprendizaje1_idx` (`uaprendizaje`),
  KEY `fk_p_ua_users1_idx` (`users_id`),
  KEY `fk_p_ua_etapas1_idx` (`etapa`),
  CONSTRAINT `fk_p_ua_etapas1` FOREIGN KEY (`etapa`) REFERENCES `etapas` (`etapa`) ON UPDATE NO ACTION,
  CONSTRAINT `fk_p_ua_programaedu1` FOREIGN KEY (`programaedu`) REFERENCES `programaedu` (`programaedu`),
  CONSTRAINT `fk_p_ua_uaprendizaje1` FOREIGN KEY (`uaprendizaje`) REFERENCES `uaprendizaje` (`uaprendizaje`),
  CONSTRAINT `fk_p_ua_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='<double-click to overwrite multiple objects>';

-- ----------------------------
-- Records of p_ua
-- ----------------------------
INSERT INTO `p_ua` VALUES ('3', '11237', '2', '9');
INSERT INTO `p_ua` VALUES ('4', '11237', '2', '9');
INSERT INTO `p_ua` VALUES ('5', '11236', '1', '9');
INSERT INTO `p_ua` VALUES ('5', '11237', '2', '9');
INSERT INTO `p_ua` VALUES ('5', '11238', '1', '9');
INSERT INTO `p_ua` VALUES ('5', '11239', '3', '9');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COMMENT='<double-click to overwrite multiple objects>';

-- ----------------------------
-- Records of reqseriacion
-- ----------------------------
INSERT INTO `reqseriacion` VALUES ('1', 'OBLIGATORIA', '1');
INSERT INTO `reqseriacion` VALUES ('2', 'SUGERIDA', '1');

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
  CONSTRAINT `fk_status_users1` FOREIGN KEY (`users_id`) REFERENCES `users_delia` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `empleado` int(11) NOT NULL COMMENT 'Docente',
  `status` int(11) NOT NULL COMMENT 'Status Hor Docen 1=Compl 2=Capt 3=En proc',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`periodo`,`empleado`),
  KEY `fk_status_horarios_status1_idx` (`status`),
  KEY `fk_status_horarios_empleados2_idx` (`empleado`),
  KEY `fk_status_horarios_users1_idx` (`users_id`),
  CONSTRAINT `fk_status_horarios_empleados2` FOREIGN KEY (`empleado`) REFERENCES `empleados` (`empleado`) ON UPDATE NO ACTION,
  CONSTRAINT `fk_status_horarios_periodos1` FOREIGN KEY (`periodo`) REFERENCES `periodos` (`periodo`) ON UPDATE NO ACTION,
  CONSTRAINT `fk_status_horarios_status1` FOREIGN KEY (`status`) REFERENCES `status` (`status`) ON UPDATE NO ACTION,
  CONSTRAINT `fk_status_horarios_users1` FOREIGN KEY (`users_id`) REFERENCES `users_delia` (`id`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  CONSTRAINT `fk_status_procesos_periodos1` FOREIGN KEY (`periodo`) REFERENCES `periodos` (`periodo`) ON UPDATE NO ACTION,
  CONSTRAINT `fk_status_procesos_programaedu1` FOREIGN KEY (`programaedu`) REFERENCES `programaedu` (`programaedu`) ON UPDATE NO ACTION,
  CONSTRAINT `fk_status_procesos_status1` FOREIGN KEY (`status_carga`) REFERENCES `status` (`status`) ON UPDATE NO ACTION,
  CONSTRAINT `fk_status_procesos_status2` FOREIGN KEY (`status_plan`) REFERENCES `status` (`status`) ON UPDATE NO ACTION,
  CONSTRAINT `fk_status_procesos_users1` FOREIGN KEY (`users_id`) REFERENCES `users_delia` (`id`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  CONSTRAINT `fk_tipo_curso_emp_users1` FOREIGN KEY (`users_id`) REFERENCES `users_delia` (`id`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tipo_curso_emp
-- ----------------------------

-- ----------------------------
-- Table structure for trabadicional_emp
-- ----------------------------
DROP TABLE IF EXISTS `trabadicional_emp`;
CREATE TABLE `trabadicional_emp` (
  `empleado` int(11) NOT NULL COMMENT 'Num empleado UABC',
  `empresa` int(11) NOT NULL COMMENT 'Codigo empresa',
  `fec_ing` varchar(45) DEFAULT NULL COMMENT 'Fecha ingreso',
  `puesto` int(11) NOT NULL COMMENT 'puesto',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`empleado`,`empresa`),
  KEY `fk_empleados_has_trabadic_emp_empleados1_idx` (`empleado`),
  KEY `fk_trabadicional_emp_empresa_adic1_idx` (`empresa`),
  KEY `fk_trabadicional_emp_users1_idx` (`users_id`),
  KEY `fk_empleados_trabadic_puesto1_idx` (`puesto`),
  CONSTRAINT `fk_empleados_has_trabadic_emp_empleados1` FOREIGN KEY (`empleado`) REFERENCES `empleados` (`empleado`),
  CONSTRAINT `fk_empleados_trabadic_puesto1` FOREIGN KEY (`puesto`) REFERENCES `puesto` (`puesto`),
  CONSTRAINT `fk_trabadicional_emp_empresa_adic1` FOREIGN KEY (`empresa`) REFERENCES `empresa_adic` (`empresa`) ON UPDATE NO ACTION,
  CONSTRAINT `fk_trabadicional_emp_users1` FOREIGN KEY (`users_id`) REFERENCES `users_delia` (`id`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of trabadicional_emp
-- ----------------------------

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
  CONSTRAINT `fk_turnos_users1` FOREIGN KEY (`users_id`) REFERENCES `users_delia` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

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
  CONSTRAINT `fk_uacademica_users1` FOREIGN KEY (`users_id`) REFERENCES `users_delia` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

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
  `descripcionmat` varchar(60) NOT NULL COMMENT 'Descripción  uaprendizaje',
  `HC` int(11) NOT NULL COMMENT 'Horas Clase',
  `HL` int(11) NOT NULL COMMENT 'Horas Laboratorio',
  `HT` int(11) NOT NULL COMMENT 'Horas Taller',
  `HPC` int(11) NOT NULL COMMENT 'Horas',
  `HCL` int(11) NOT NULL COMMENT 'Horas Clinica',
  `HE` int(11) NOT NULL COMMENT 'Horas Extra',
  `creditos` int(11) NOT NULL COMMENT 'Numero de Créditos\n1Hr Clase= 2c',
  `fec_aut` date DEFAULT NULL COMMENT 'Fecha autorización',
  `observa` varchar(60) DEFAULT NULL COMMENT 'Observaciones',
  `semestre_sug` int(11) NOT NULL COMMENT 'Semestre sugerido',
  `caracter` int(11) NOT NULL COMMENT 'Codigo caracter para especificar 1=Obligatoria/2=Optativa',
  `coordinaciona` int(11) NOT NULL COMMENT 'Codigo coordinacion area',
  `plan` int(11) NOT NULL COMMENT 'Codigo plan estudio',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`uaprendizaje`),
  UNIQUE KEY `UA_clave_UNIQUE` (`uaprendizaje`),
  KEY `fk_uaprendizaje_caracter1_idx` (`caracter`),
  KEY `fk_uaprendizaje_coordinaciona1_idx` (`coordinaciona`),
  KEY `fk_uaprendizaje_planestudio1_idx` (`plan`),
  KEY `fk_uaprendizaje_users1_idx` (`users_id`),
  KEY `HPC_UNIQUE` (`HPC`) USING BTREE,
  CONSTRAINT `fk_uaprendizaje_caracter1` FOREIGN KEY (`caracter`) REFERENCES `caracter` (`caracter`),
  CONSTRAINT `fk_uaprendizaje_coordinaciona1` FOREIGN KEY (`coordinaciona`) REFERENCES `coordinaciona` (`coordinaciona`),
  CONSTRAINT `fk_uaprendizaje_planestudio1` FOREIGN KEY (`plan`) REFERENCES `planestudio` (`plan`),
  CONSTRAINT `fk_uaprendizaje_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='<double-click to overwrite multiple objects>';

-- ----------------------------
-- Records of uaprendizaje
-- ----------------------------
INSERT INTO `uaprendizaje` VALUES ('11236', 'MATEMÁTICAS', '12', '0', '0', '0', '0', '0', '24', '2014-10-14', 'vamos a ver', '1', '1', '1', '20092', '9');
INSERT INTO `uaprendizaje` VALUES ('11237', 'MATEMATICAS III', '2', '1', '1', '1', '1', '1', '9', '2014-10-14', '', '3', '2', '5', '20092', '9');
INSERT INTO `uaprendizaje` VALUES ('11238', 'MATEMATICAS COMPUTADORA', '3', '0', '0', '0', '0', '0', '6', '2014-10-14', 'vamos a ver', '1', '1', '3', '20092', '9');
INSERT INTO `uaprendizaje` VALUES ('11239', 'MATEMATICAS TERMINAL', '1', '0', '0', '0', '0', '0', '2', '2014-10-14', '', '1', '2', '2', '20092', '9');

-- ----------------------------
-- Table structure for universidades_emp
-- ----------------------------
DROP TABLE IF EXISTS `universidades_emp`;
CREATE TABLE `universidades_emp` (
  `universidad` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Universidad empleados',
  `desripcion` varchar(60) NOT NULL COMMENT 'Descripcion Universidad',
  `ciudad` int(11) NOT NULL COMMENT 'Ciudad',
  `users_id` int(11) NOT NULL COMMENT 'Usr inserta/modif/borra',
  PRIMARY KEY (`universidad`),
  KEY `fk_universidades_emp_ciudad1_idx` (`ciudad`),
  KEY `fk_universidades_emp_users1_idx` (`users_id`),
  CONSTRAINT `fk_universidades_emp_ciudad1` FOREIGN KEY (`ciudad`) REFERENCES `ciudad` (`ciudad`),
  CONSTRAINT `fk_universidades_emp_users1` FOREIGN KEY (`users_id`) REFERENCES `users_delia` (`id`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of universidades_emp
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` int(11) NOT NULL,
  `campus` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `unidad` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ua` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `programaedu` int(255) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `level` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `remember_token` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'Ivan', 'Duarte', 'wolfogan1@gmail.com', 'Real de Calacoaya 7810-3B', '6450706', 'TIJUANA', 'ENSENADA', 'FCA', '1', 'LoganX1', '$2y$10$9qAw9XKA/BtqYRg5WS087.3WjqG.eH0P8.JiLsY7BF4nBAZAPJ752', '0', '2014-04-19 12:30:58', '2014-08-28 22:09:40', 'Jd3knfA4G2aDhiIKHF5r7UpAkjuf8HWStUbFjlJJlMX0eW51R28fJNaWo0oz');
INSERT INTO `users` VALUES ('8', 'Ivan', 'Duarte', 'wolfogan@gmail.com', 'Real de Calacoaya 7810-3B', '6450706', 'TIJUANA', 'ENSENADA', 'FCA', '1', 'LoganX', '$2y$10$9qAw9XKA/BtqYRg5WS087.3WjqG.eH0P8.JiLsY7BF4nBAZAPJ752', '0', '2014-04-19 12:30:58', '2014-08-28 22:09:40', 'Jd3knfA4G2aDhiIKHF5r7UpAkjuf8HWStUbFjlJJlMX0eW51R28fJNaWo0oz');
INSERT INTO `users` VALUES ('9', 'Cynthia', 'Duarte', 'zyntya@hotmail.com', 'Col. Nueva Tijuana', '6233987', 'TIJUANA', 'VALLE DE LA TRINIDAD', 'FD', '0', 'Tikita', '$2y$10$9qAw9XKA/BtqYRg5WS087.3WjqG.eH0P8.JiLsY7BF4nBAZAPJ752', '1', '2014-04-19 12:30:58', '2014-08-28 22:09:18', 'Rbs0XNlxpwL16k3dPTN6vI4eNlubWfiHlqhNQZkJT8rvMq2hyI2NlD48CoP0');
INSERT INTO `users` VALUES ('11', 'Cynthia', 'Duarte', 'zyntyaa@hotmail.com', 'Col. Nueva Tijuana', '6233987', 'TIJUANA', 'VALLE DE LA TRINIDAD', 'FD', '0', 'Tikitaa', '$2y$10$9qAw9XKA/BtqYRg5WS087.3WjqG.eH0P8.JiLsY7BF4nBAZAPJ752', '1', '2014-04-19 12:30:58', '2014-08-28 22:09:18', 'Rbs0XNlxpwL16k3dPTN6vI4eNlubWfiHlqhNQZkJT8rvMq2hyI2NlD48CoP0');

-- ----------------------------
-- Table structure for users_delia
-- ----------------------------
DROP TABLE IF EXISTS `users_delia`;
CREATE TABLE `users_delia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `empleado` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `level` tinyint(4) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `remember_token` varchar(100) NOT NULL,
  `uacademica` int(11) NOT NULL,
  `campus` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_users_uacademica1_idx` (`uacademica`),
  KEY `fk_users_campus1_idx` (`campus`),
  KEY `fk_users_empleados1_idx` (`empleado`),
  CONSTRAINT `fk_users_campus1` FOREIGN KEY (`campus`) REFERENCES `campus` (`campus`),
  CONSTRAINT `fk_users_empleados1` FOREIGN KEY (`empleado`) REFERENCES `empleados` (`empleado`),
  CONSTRAINT `fk_users_uacademica1` FOREIGN KEY (`uacademica`) REFERENCES `uacademica` (`uacademica`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of users_delia
-- ----------------------------
INSERT INTO `users_delia` VALUES ('1', '1', 'LoganX', '$2y$10$k8fT0GW/Obx8KgZU4hVufOt/stcuq3Y9Z8/9St', '0', '2014-04-19 19:30:58', '2014-04-19 19:30:58', '', '1', '1');
INSERT INTO `users_delia` VALUES ('9', '1', 'Tikita', '', '1', '2014-04-19 19:30:58', '2014-05-14 22:29:32', 'E4uGco0FtNqNTuFFvxq4mSIrfA2qWORYIkt7KDU3SCMzLG90S3AlIhNIIUY8', '1', '1');
INSERT INTO `users_delia` VALUES ('10', '1', 'ra21', '$2y$10$BCYlojviBdFVCG4jfpdcluYJWLW/2/gGIjDsgx', '0', '2014-04-19 19:31:10', '2014-04-19 19:31:10', '', '1', '1');
INSERT INTO `users_delia` VALUES ('11', '1', 'paquito', '$2y$10$NFJnp7SweU./sBw/YqBuM.Fg1mHuVjngo2e55Z', '0', '2014-04-21 15:08:27', '2014-04-21 17:03:15', '', '1', '1');
INSERT INTO `users_delia` VALUES ('17', '1', 'uni', '$2y$10$T3ztXBdUMPxZGvOSyNk8wuSKCiX2gYu7WSLZ9A', '1', '2014-04-25 09:42:07', '2014-04-25 09:42:07', '', '1', '1');
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
    NEW.caracteristica_cur, 
    NEW.curso, 
    NEW.empleado,
    NEW.id_act_adicionalemp,
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
    NEW.caracteristica_cur, 
    NEW.curso, 
    NEW.empleado,
    NEW.id_act_adicionalemp,
    NEW.tipo_curso_emp ), concat_WS( '|', 
    OLD.caracteristica_cur, 
    OLD.curso, 
    OLD.empleado,
    OLD.id_act_adicionalemp,
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
    OLD.caracteristica_cur, 
    OLD.curso, 
    OLD.empleado,
    OLD.id_act_adicionalemp,
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
'act_profesional_adic', NEW.users_id, 'I', curdate( ) , concat_WS( '|', NEW.creditos, NEW.curso, NEW.descripcion,NEW.fecha,NEW.horas ) 
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
'act_profesional_adic', NEW.users_id, 'U', curdate( ) , concat_WS( '|', NEW.creditos, NEW.curso, NEW.descripcion,NEW.fecha,NEW.horas )
, concat_WS( '|', OLD.creditos, OLD.curso, OLD.descripcion,OLD.fecha,OLD.horas )  
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
'act_profesional_adic', OLD.users_id, 'D', curdate( ) , concat_WS( '|', OLD.creditos, OLD.curso, OLD.descripcion,OLD.fecha,OLD.horas ) 
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
NEW.cedula, 
NEW.empleado,
NEW.fec_tit, 
NEW.nivel, 
NEW.obtuvo_grado,
NEW.universidad
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
NEW.cedula, 
NEW.empleado,
NEW.fec_tit, 
NEW.nivel, 
NEW.obtuvo_grado,
NEW.universidad
),
concat_WS( '|', 
OLD.carrera, 
OLD.cedula, 
OLD.empleado,
OLD.fec_tit, 
OLD.nivel, 
OLD.obtuvo_grado,
OLD.universidad
));
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
OLD.cedula, 
OLD.empleado,
OLD.fec_tit, 
OLD.nivel, 
OLD.obtuvo_grado,
OLD.universidad
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
NEW.ciudad, 
NEW.descripcion,
NEW.direccion                                                         ) 
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
NEW.ciudad, 
NEW.descripcion,
NEW.direccion), concat_WS( '|', 
OLD.campus, 
OLD.ciudad, 
OLD.descripcion,
OLD.direccion  )
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
OLD.ciudad, 
OLD.descripcion,
OLD.direccion                                                         ) 
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
          	NEW.uaprendizaje         
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
          	NEW.grupo,
          	NEW.periodo,
          	NEW.uaprendizaje         
        ),
        concat_WS('|',
          	OLD.grupo,
          	OLD.periodo,
          	OLD.uaprendizaje         
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
          	OLD.uaprendizaje         
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
NEW.uaprequisito) 
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
'detalleseriacion', NEW.users_id, 'U', curdate( ) , concat_WS( '|',NEW.uaprendizaje, NEW.uaprequisito),
concat_WS( '|',OLD.uaprendizaje, OLD.uaprequisito));

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
OLD.uaprequisito) 
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
'dias', NEW.users_id, 'I', curdate( ) , concat_WS( '|', NEW.descripcion, NEW.dia ) 
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
'dias', NEW.users_id, 'U', curdate( ) , concat_WS( '|', NEW.descripcion, NEW.dia ),
concat_WS( '|', OLD.descripcion, OLD.dia )  
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
'dias', OLD.users_id, 'D', curdate( ) , concat_WS( '|', OLD.descripcion, OLD.dia ) 
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
NEW.dia, 
NEW.disponibilidad_hrs_dias, 
NEW.empleado,
NEW.hora,
NEW.periodo) 
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
NEW.dia, 
NEW.disponibilidad_hrs_dias, 
NEW.empleado,
NEW.hora,
NEW.periodo),
concat_WS( '|', 
OLD.dia, 
OLD.disponibilidad_hrs_dias, 
OLD.empleado,
OLD.hora,
OLD.periodo)  
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
OLD.dia, 
OLD.disponibilidad_hrs_dias, 
OLD.empleado,
OLD.hora,
OLD.periodo) 
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
'disp_ua', NEW.users_id, 'I', curdate( ) , concat_WS( '|', NEW.disponibilidad_ua, NEW.empleado,NEW.periodo, NEW.uaprendizaje ) 
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
'disp_ua', NEW.users_id, 'U', curdate( ) , concat_WS( '|', NEW.disponibilidad_ua, NEW.empleado,NEW.periodo, NEW.uaprendizaje ),
concat_WS( '|', OLD.disponibilidad_ua, OLD.empleado,OLD.periodo, OLD.uaprendizaje )  
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
'disp_ua', OLD.users_id, 'D', curdate( ) , concat_WS( '|', OLD.disponibilidad_ua, OLD.empleado,OLD.periodo, OLD.uaprendizaje ) 
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
'doctos', NEW.users_id, 'U', curdate( ) , concat_WS( '|', NEW.docto, NEW.descripcion ) ,
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
'documentos_emp', NEW.users_id, 'I', curdate( ) , concat_WS( '|', NEW.docto, NEW.empleado, NEW.observaciones,NEW.ruta ) 
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
'documentos_emp', NEW.users_id, 'U', curdate( ) , concat_WS( '|', NEW.docto, NEW.empleado, NEW.observaciones,NEW.ruta ) ,
 concat_WS( '|', OLD.docto, OLD.empleado, OLD.observaciones,OLD.ruta ) 
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
'documentos_emp', OLD.users_id, 'D', curdate( ) , concat_WS( '|', OLD.docto, OLD.empleado, OLD.observaciones,OLD.ruta ) 
);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_empleados`;
DELIMITER ;;
CREATE TRIGGER `bit_I_empleados` AFTER INSERT ON `empleados` FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *empleados*
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
'empleados', NEW.users_id, 'I', curdate( ) , concat_WS( '|',
  NEW.empleado,
  NEW.nombres,
  NEW.paterno,
  NEW.materno,
  NEW.status,
  NEW.sexo,
  NEW.rfc,
  NEW.fec_nac,
  NEW.fec_ing,
  NEW.email_vigente,
  NEW.email_alternat,
  NEW.hrstope,
  NEW.hrslic,
  NEW.hrspost,
  NEW.ciudad,
  NEW.calle,
  NEW.no_int,
  NEW.no_ext,
  NEW.colonia,
  NEW.cp,
  NEW.telofna,
  NEW.telcasa,
  NEW.telcel,
  NEW.categoria
));

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_empleados`;
DELIMITER ;;
CREATE TRIGGER `bit_U_empleados` AFTER UPDATE ON `empleados` FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al MODIFICAR REGISTRO en *empleados*
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
'empleados', NEW.users_id, 'U', curdate( ) , concat_WS( '|',
  NEW.empleado,
  NEW.nombres,
  NEW.paterno,
  NEW.materno,
  NEW.status,
  NEW.sexo,
  NEW.rfc,
  NEW.fec_nac,
  NEW.fec_ing,
  NEW.email_vigente,
  NEW.email_alternat,
  NEW.hrstope,
  NEW.hrslic,
  NEW.hrspost,
  NEW.ciudad,
  NEW.calle,
  NEW.no_int,
  NEW.no_ext,
  NEW.colonia,
  NEW.cp,
  NEW.telofna,
  NEW.telcasa,
  NEW.telcel,
  NEW.categoria
),
concat_WS( '|',
  OLD.empleado,
  OLD.nombres,
  OLD.paterno,
  OLD.materno,
  OLD.status,
  OLD.sexo,
  OLD.rfc,
  OLD.fec_nac,
  OLD.fec_ing,
  OLD.email_vigente,
  OLD.email_alternat,
  OLD.hrstope,
  OLD.hrslic,
  OLD.hrspost,
  OLD.ciudad,
  OLD.calle,
  OLD.no_int,
  OLD.no_ext,
  OLD.colonia,
  OLD.cp,
  OLD.telofna,
  OLD.telcasa,
  OLD.telcel,
  OLD.categoria
));

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_D_empleados`;
DELIMITER ;;
CREATE TRIGGER `bit_D_empleados` AFTER DELETE ON `empleados` FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *empleados*
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
'empleados', OLD.users_id, 'D', curdate( ) , concat_WS( '|',
  OLD.empleado,
  OLD.nombres,
  OLD.paterno,
  OLD.materno,
  OLD.status,
  OLD.sexo,
  OLD.rfc,
  OLD.fec_nac,
  OLD.fec_ing,
  OLD.email_vigente,
  OLD.email_alternat,
  OLD.hrstope,
  OLD.hrslic,
  OLD.hrspost,
  OLD.ciudad,
  OLD.calle,
  OLD.no_int,
  OLD.no_ext,
  OLD.colonia,
  OLD.cp,
  OLD.telofna,
  OLD.telcasa,
  OLD.telcel,
  OLD.categoria
));

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
VALUES ('empresa_adic', NEW.users_id, 'U', curdate( ) , concat_WS( '|', NEW.empresa, NEW.descripcion),
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
'esp_prog_edu', NEW.users_id, 'U', curdate( ) , concat_WS( '|', NEW.especialidad, NEW.descripcion, NEW.status ),
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
'estado', NEW.users_id, 'U', curdate( ) , concat_WS( '|', NEW.estado, NEW.descripcion, NEW.pais ),
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
'etapas', NEW.users_id, 'U', curdate( ) , concat_WS( '|', NEW.etapa, NEW.descripcion ),
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
'grupos', NEW.users_id, 'U', curdate( ) , concat_WS( '|', NEW.grupo, NEW.periodo, NEW.plan, NEW.programaedu,NEW.turno ),
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
'horarios', NEW.users_id, 'I', curdate( ) , concat_WS( '|', NEW.dia,NEW.empleado,NEW.grupo, NEW.hora,NEW.periodo, NEW.uaprendizaje ) 
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
'horarios', NEW.users_id, 'U', curdate( ) , concat_WS( '|', NEW.dia,NEW.empleado,NEW.grupo, NEW.hora,NEW.periodo, NEW.uaprendizaje ),
concat_WS( '|', OLD.dia,OLD.empleado,OLD.grupo, OLD.hora,OLD.periodo, OLD.uaprendizaje ) 
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
'horarios', OLD.users_id, 'D', curdate( ) , concat_WS( '|', OLD.dia,OLD.empleado,OLD.grupo, OLD.hora,OLD.periodo, OLD.uaprendizaje ) 
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
'nvprograma', NEW.users_id, 'U', curdate( ) , concat_WS( '|', NEW.nivel, NEW.descripcion),concat_WS( '|', OLD.nivel, OLD.descripcion)  
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
    NEW.inicio,                                                 
    NEW.fin,
    NEW.status_periodo),
    concat_WS( '|', 
    OLD.periodo,
    OLD.periodo_pedu, 
    OLD.year,
    OLD.mes,
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
'plan_programa', NEW.users_id, 'U', curdate( ) , concat_WS( '|', NEW.plan, NEW.programaedu),
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
'programaedu', NEW.users_id, 'I', curdate( ) , concat_WS( '|', NEW.programaedu, NEW.descripcion, NEW.status,NEW.empleado,NEW.uacademica,NEW.especialidad,NEW.nivel,NEW.periodo_pedu ) 
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
'programaedu', NEW.users_id, 'U', curdate( ) , concat_WS( '|', NEW.programaedu, NEW.descripcion, NEW.status,NEW.empleado,NEW.uacademica,NEW.especialidad,NEW.nivel,NEW.periodo_pedu ),
concat_WS( '|', OLD.programaedu, OLD.descripcion, OLD.status,OLD.empleado,OLD.uacademica,OLD.especialidad,OLD.nivel,OLD.periodo_pedu )  
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
'programaedu', OLD.users_id, 'D', curdate( ) , concat_WS( '|', OLD.programaedu, OLD.descripcion, OLD.status,OLD.empleado,OLD.uacademica,OLD.especialidad,OLD.nivel,OLD.periodo_pedu ) 
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
'puesto', NEW.users_id, 'U', curdate( ) , concat_WS( '|', NEW.puesto, NEW.descripcion ),
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
'puestosemp', NEW.users_id, 'I', curdate( ) , concat_WS( '|', NEW.empleado, NEW.uacademica, NEW.puesto ) 
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
'puestosemp', NEW.users_id, 'U', curdate( ) , concat_WS( '|', NEW.empleado, NEW.uacademica, NEW.puesto ) ,
concat_WS( '|', OLD.empleado, OLD.uacademica, OLD.puesto ) 
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
'puestosemp', OLD.users_id, 'D', curdate( ) , concat_WS( '|', OLD.empleado, OLD.uacademica, OLD.puesto ) 
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
'p_ua', NEW.users_id, 'I', curdate( ) , concat_WS( '|', NEW.programaedu, NEW.uaprendizaje, NEW.etapa ) 
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
'p_ua', NEW.users_id, 'U', curdate( ) , concat_WS( '|', NEW.programaedu, NEW.uaprendizaje, NEW.etapa ),
concat_WS( '|', OLD.programaedu, OLD.uaprendizaje, OLD.etapa )  
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
'p_ua', OLD.users_id, 'D', curdate( ) , concat_WS( '|', OLD.programaedu, OLD.uaprendizaje, OLD.etapa ) 
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
'reqseriacion', NEW.users_id, 'U', curdate( ) , concat_WS( '|', NEW.reqseriacion, NEW.descripcion ),
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
'status', NEW.users_id, 'U', curdate( ) , concat_WS( '|', NEW.status, NEW.descripcion ),
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
'status_horarios', NEW.users_id, 'I', curdate( ) , concat_WS( '|', NEW.periodo, NEW.empleado, NEW.status ) 
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
'status_horarios', NEW.users_id, 'U', curdate( ) , concat_WS( '|', NEW.periodo, NEW.empleado, NEW.status ),
 concat_WS( '|',OLD.periodo, OLD.empleado, OLD.status )  
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
'status_horarios', OLD.users_id, 'D', curdate( ) , concat_WS( '|', OLD.periodo, OLD.empleado, OLD.status ) 
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
'tipo_curso_emp', NEW.users_id, 'U', curdate( ) , concat_WS( '|', NEW.tipo_curso_emp, NEW.descripcion ),
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
'trabadicional_emp', NEW.users_id, 'I', curdate( ) , concat_WS( '|', NEW.empleado, NEW.empresa, NEW.fec_ing,NEW.puesto ) 
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
'trabadicional_emp', NEW.users_id, 'U', curdate( ) , concat_WS( '|', NEW.empleado, NEW.empresa, NEW.fec_ing,NEW.puesto ),
concat_WS( '|', OLD.empleado, OLD.empresa, OLD.fec_ing,OLD.puesto )  
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
'trabadicional_emp', OLD.users_id, 'D', curdate( ) , concat_WS( '|', OLD.empleado, OLD.empresa, OLD.fec_ing,OLD.puesto ) 
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
'turnos', NEW.users_id, 'U', curdate( ) , concat_WS( '|', NEW.turno, NEW.descripcion ),
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
'uacademica', NEW.users_id, 'U', curdate( ) , concat_WS( '|', NEW.uacademica, NEW.descripshort, NEW.descripcion,NEW.campus),
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
'uaprendizaje', NEW.users_id, 'I', curdate( ) , concat_WS( '|', 
NEW.uaprendizaje, 
NEW.descripcionmat, 
NEW.HC,
NEW.HL,
NEW.HT,
NEW.HPC,
NEW.HCL,
NEW.HE,
NEW.creditos,
NEW.fec_aut,
NEW.observa,
NEW.semestre_sug,
NEW.caracter,
NEW.coordinaciona,
NEW.plan                                                                                                                   
) 
);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_U_uaprendizaje`;
DELIMITER ;;
CREATE TRIGGER `bit_U_uaprendizaje` AFTER UPDATE ON `uaprendizaje` FOR EACH ROW BEGIN 
-- -----------------------------------------------------
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
'uaprendizaje', NEW.users_id, 'U', curdate( ) , concat_WS( '|', 
NEW.uaprendizaje, 
NEW.descripcionmat, 
NEW.HC,
NEW.HL,
NEW.HT,
NEW.HPC,
NEW.HCL,
NEW.HE,
NEW.creditos,
NEW.fec_aut,
NEW.observa,
NEW.semestre_sug,
NEW.caracter,
NEW.coordinaciona,
NEW.plan                                                                                                                   
),
concat_WS( '|', 
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
OLD.semestre_sug,
OLD.caracter,
OLD.coordinaciona,
OLD.plan                                                                                                                   
)  
);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_D_uaprendizaje`;
DELIMITER ;;
CREATE TRIGGER `bit_D_uaprendizaje` AFTER DELETE ON `uaprendizaje` FOR EACH ROW BEGIN 
-- -----------------------------------------------------
-- Bitacora al BORRAR REGISTRO en *uaprendizaje*
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
OLD.semestre_sug,
OLD.caracter,
OLD.coordinaciona,
OLD.plan                                                                                                                   
) 
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
'universidades_emp', NEW.users_id, 'I', curdate( ) , concat_WS( '|', NEW.universidad, NEW.desripcion, NEW.ciudad ) 
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
'universidades_emp', NEW.users_id, 'U', curdate( ) , concat_WS( '|', NEW.universidad, NEW.desripcion, NEW.ciudad ),
concat_WS( '|', OLD.universidad, OLD.desripcion, OLD.ciudad )  
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
'universidades_emp', OLD.users_id, 'D', curdate( ) , concat_WS( '|', OLD.universidad, OLD.desripcion, OLD.ciudad ) 
);

END
;;
DELIMITER ;
