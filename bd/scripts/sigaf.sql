/*
Navicat MySQL Data Transfer

Source Server         : SIGAF
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : sigaf

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2015-02-13 17:19:23
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
  KEY `fk_act_adicional_emp_users2_idx` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of act_adicional_emp
-- ----------------------------

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
  KEY `fk_act_profesional_adic_caracteristica_cur1` (`caracteristica_cur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of act_profesional_adic
-- ----------------------------

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
  KEY `fk_act_profesional_emp_universidades_emp1_idx` (`universidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=608 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bitacora
-- ----------------------------
INSERT INTO `bitacora` VALUES ('1', 'planestudio', '1', 'I', '2015-01-20 00:00:00', '20101|asdf|123|2015-01-20|2015-01-21|1', null);
INSERT INTO `bitacora` VALUES ('2', 'planestudio', '1', 'D', '2015-01-20 00:00:00', null, '20101|asdf|123|2015-01-20|2015-01-21|1');
INSERT INTO `bitacora` VALUES ('3', 'planestudio', '1', 'I', '2015-01-20 00:00:00', '20101|asdf|123|2015-01-01|2015-01-02|1', null);
INSERT INTO `bitacora` VALUES ('4', 'planestudio', '1', 'I', '2015-01-20 00:00:00', '20102|asdf|123|2015-01-01|2015-01-20|1', null);
INSERT INTO `bitacora` VALUES ('5', 'planestudio', '1', 'D', '2015-01-20 00:00:00', null, '20102|asdf|123|2015-01-01|2015-01-20|1');
INSERT INTO `bitacora` VALUES ('6', 'planestudio', '1', 'D', '2015-01-20 00:00:00', null, '20101|asdf|123|2015-01-01|2015-01-02|1');
INSERT INTO `bitacora` VALUES ('7', 'planestudio', '1', 'I', '2015-01-20 00:00:00', '20101|asdf|123|2015-01-01|2015-01-02|1', null);
INSERT INTO `bitacora` VALUES ('8', 'planestudio', '1', 'D', '2015-01-20 00:00:00', null, '20101|asdf|123|2015-01-01|2015-01-02|1');
INSERT INTO `bitacora` VALUES ('9', 'planestudio', '1', 'I', '2015-01-21 00:00:00', '20091|ssdfgdasf|20|2015-01-21|2015-01-21|1', null);
INSERT INTO `bitacora` VALUES ('10', 'planestudio', '1', 'I', '2015-01-21 00:00:00', '20092|asdfasfd|50|2015-01-01|2015-01-02|1', null);
INSERT INTO `bitacora` VALUES ('11', 'planestudio', '1', 'D', '2015-01-21 00:00:00', null, '20092|asdfasfd|50|2015-01-01|2015-01-02|1');
INSERT INTO `bitacora` VALUES ('12', 'uaprendizaje', '1', 'I', '2015-01-21 00:00:00', '11236|MATEMATICAS 1|5|5|0|0|0|0|15|2015-01-21|vamos a ver|1|20091', null);
INSERT INTO `bitacora` VALUES ('13', 'uaprendizaje', '1', 'D', '2015-01-21 00:00:00', null, '11236|MATEMATICAS 1|5|5|0|0|0|0|15|2015-01-21|vamos a ver|1|20091');
INSERT INTO `bitacora` VALUES ('14', 'planestudio', '1', 'D', '2015-01-21 00:00:00', null, '20091|ssdfgdasf|20|2015-01-21|2015-01-21|1');
INSERT INTO `bitacora` VALUES ('15', 'planestudio', '1', 'I', '2015-01-21 00:00:00', '20092|Plan 2009-2|100|2015-01-01|2015-01-31|1', null);
INSERT INTO `bitacora` VALUES ('16', 'plan_programa', '1', 'I', '2015-01-21 00:00:00', '20092|1', null);
INSERT INTO `bitacora` VALUES ('17', 'plan_programa', '1', 'I', '2015-01-21 00:00:00', '20092|2', null);
INSERT INTO `bitacora` VALUES ('18', 'plan_programa', '1', 'I', '2015-01-21 00:00:00', '20092|3', null);
INSERT INTO `bitacora` VALUES ('19', 'plan_programa', '1', 'I', '2015-01-21 00:00:00', '20092|4', null);
INSERT INTO `bitacora` VALUES ('20', 'plan_programa', '1', 'I', '2015-01-21 00:00:00', '20092|5', null);
INSERT INTO `bitacora` VALUES ('21', 'plan_programa', '1', 'I', '2015-01-21 00:00:00', '20092|6', null);
INSERT INTO `bitacora` VALUES ('22', 'plan_programa', '1', 'I', '2015-01-21 00:00:00', '20092|7', null);
INSERT INTO `bitacora` VALUES ('23', 'uaprendizaje', '1', 'I', '2015-01-21 00:00:00', '11236|MATEMATICAS 1|5|5|0|0|0|0|15|2015-01-21|vamos a ver|1|20092', null);
INSERT INTO `bitacora` VALUES ('24', 'p_ua', '1', 'I', '2015-01-21 00:00:00', '1|11236|1|1|1', null);
INSERT INTO `bitacora` VALUES ('25', 'p_ua', '1', 'I', '2015-01-21 00:00:00', '3|11236|1|1|1', null);
INSERT INTO `bitacora` VALUES ('26', 'uaprendizaje', '1', 'I', '2015-01-21 00:00:00', '11237|MATEMÁTICAS II|5|10|0|0|0|0|20|2015-01-21|vamos a ver|3|20092', null);
INSERT INTO `bitacora` VALUES ('27', 'p_ua', '1', 'I', '2015-01-21 00:00:00', '1|11237|2|1|1', null);
INSERT INTO `bitacora` VALUES ('28', 'p_ua', '1', 'I', '2015-01-21 00:00:00', '3|11237|2|1|1', null);
INSERT INTO `bitacora` VALUES ('29', 'periodos', '2', 'I', '2015-01-21 00:00:00', '20141|1|2014|1|Un período registrado|2015-01-21|2015-10-31|1', null);
INSERT INTO `bitacora` VALUES ('30', 'periodos', '2', 'I', '2015-01-21 00:00:00', '20142|1|2014|2|Vamos a ver|2015-01-21|2015-07-25|1', null);
INSERT INTO `bitacora` VALUES ('31', 'planestudio', '2', 'I', '2015-01-24 00:00:00', '20101|Plan 2010-1|200|2015-01-01|2015-12-31|1', null);
INSERT INTO `bitacora` VALUES ('32', 'plan_programa', '2', 'I', '2015-01-24 00:00:00', '20101|1', null);
INSERT INTO `bitacora` VALUES ('33', 'plan_programa', '2', 'I', '2015-01-24 00:00:00', '20101|2', null);
INSERT INTO `bitacora` VALUES ('34', 'plan_programa', '2', 'I', '2015-01-24 00:00:00', '20101|3', null);
INSERT INTO `bitacora` VALUES ('35', 'plan_programa', '2', 'I', '2015-01-24 00:00:00', '20101|4', null);
INSERT INTO `bitacora` VALUES ('36', 'plan_programa', '2', 'I', '2015-01-24 00:00:00', '20101|5', null);
INSERT INTO `bitacora` VALUES ('37', 'plan_programa', '2', 'I', '2015-01-24 00:00:00', '20101|6', null);
INSERT INTO `bitacora` VALUES ('38', 'plan_programa', '2', 'I', '2015-01-24 00:00:00', '20101|7', null);
INSERT INTO `bitacora` VALUES ('39', 'uaprendizaje', '2', 'I', '2015-01-24 00:00:00', '12236|ESPAÑOL|5|0|0|0|0|0|10|2015-01-24|vamos a ver|1|20101', null);
INSERT INTO `bitacora` VALUES ('40', 'p_ua', '2', 'I', '2015-01-24 00:00:00', '1|12236|1|1|1', null);
INSERT INTO `bitacora` VALUES ('41', 'p_ua', '2', 'I', '2015-01-24 00:00:00', '2|12236|1|1|1', null);
INSERT INTO `bitacora` VALUES ('42', 'p_ua', '2', 'I', '2015-01-24 00:00:00', '3|12236|1|1|1', null);
INSERT INTO `bitacora` VALUES ('43', 'uaprendizaje', '2', 'I', '2015-01-24 00:00:00', '12237|LITERATURA|5|10|2|0|0|0|22|2015-01-24|si se puede|2|20101', null);
INSERT INTO `bitacora` VALUES ('44', 'p_ua', '2', 'I', '2015-01-24 00:00:00', '1|12237|1|1|2', null);
INSERT INTO `bitacora` VALUES ('45', 'detalleseriacion', '2', 'I', '2015-01-24 00:00:00', '12237|1|12236|1', null);
INSERT INTO `bitacora` VALUES ('46', 'plan_programa', '2', 'D', '2015-01-29 00:00:00', null, '20101|7');
INSERT INTO `bitacora` VALUES ('47', 'plan_programa', '2', 'D', '2015-01-29 00:00:00', null, '20101|6');
INSERT INTO `bitacora` VALUES ('48', 'plan_programa', '2', 'D', '2015-01-29 00:00:00', null, '20101|5');
INSERT INTO `bitacora` VALUES ('49', 'plan_programa', '2', 'D', '2015-01-29 00:00:00', null, '20101|4');
INSERT INTO `bitacora` VALUES ('50', 'plan_programa', '2', 'D', '2015-01-29 00:00:00', null, '20101|3');
INSERT INTO `bitacora` VALUES ('51', 'plan_programa', '2', 'D', '2015-01-29 00:00:00', null, '20101|2');
INSERT INTO `bitacora` VALUES ('52', 'plan_programa', '2', 'D', '2015-01-29 00:00:00', null, '20101|1');
INSERT INTO `bitacora` VALUES ('53', 'plan_programa', '1', 'D', '2015-01-29 00:00:00', null, '20092|7');
INSERT INTO `bitacora` VALUES ('54', 'plan_programa', '1', 'D', '2015-01-29 00:00:00', null, '20092|6');
INSERT INTO `bitacora` VALUES ('55', 'plan_programa', '1', 'D', '2015-01-29 00:00:00', null, '20092|5');
INSERT INTO `bitacora` VALUES ('56', 'plan_programa', '1', 'D', '2015-01-29 00:00:00', null, '20092|4');
INSERT INTO `bitacora` VALUES ('57', 'plan_programa', '1', 'D', '2015-01-29 00:00:00', null, '20092|3');
INSERT INTO `bitacora` VALUES ('58', 'plan_programa', '1', 'D', '2015-01-29 00:00:00', null, '20092|2');
INSERT INTO `bitacora` VALUES ('59', 'plan_programa', '1', 'D', '2015-01-29 00:00:00', null, '20092|1');
INSERT INTO `bitacora` VALUES ('60', 'p_ua', '2', 'D', '2015-01-29 00:00:00', null, '3|12236|1|1|1');
INSERT INTO `bitacora` VALUES ('61', 'p_ua', '1', 'D', '2015-01-29 00:00:00', null, '3|11237|2|1|1');
INSERT INTO `bitacora` VALUES ('62', 'p_ua', '1', 'D', '2015-01-29 00:00:00', null, '3|11236|1|1|1');
INSERT INTO `bitacora` VALUES ('63', 'p_ua', '2', 'D', '2015-01-29 00:00:00', null, '2|12236|1|1|1');
INSERT INTO `bitacora` VALUES ('64', 'detalleseriacion', '2', 'D', '2015-01-29 00:00:00', null, '12237|1|12236|1');
INSERT INTO `bitacora` VALUES ('65', 'p_ua', '2', 'D', '2015-01-29 00:00:00', null, '1|12237|1|1|2');
INSERT INTO `bitacora` VALUES ('66', 'p_ua', '2', 'D', '2015-01-29 00:00:00', null, '1|12236|1|1|1');
INSERT INTO `bitacora` VALUES ('67', 'p_ua', '1', 'D', '2015-01-29 00:00:00', null, '1|11237|2|1|1');
INSERT INTO `bitacora` VALUES ('68', 'p_ua', '1', 'D', '2015-01-29 00:00:00', null, '1|11236|1|1|1');
INSERT INTO `bitacora` VALUES ('69', 'uaprendizaje', '2', 'D', '2015-01-29 00:00:00', null, '12237|LITERATURA|5|10|2|0|0|0|22|2015-01-24|si se puede|2|20101');
INSERT INTO `bitacora` VALUES ('70', 'uaprendizaje', '2', 'D', '2015-01-29 00:00:00', null, '12236|ESPAÑOL|5|0|0|0|0|0|10|2015-01-24|vamos a ver|1|20101');
INSERT INTO `bitacora` VALUES ('71', 'uaprendizaje', '1', 'D', '2015-01-29 00:00:00', null, '11237|MATEMÁTICAS II|5|10|0|0|0|0|20|2015-01-21|vamos a ver|3|20092');
INSERT INTO `bitacora` VALUES ('72', 'uaprendizaje', '1', 'D', '2015-01-29 00:00:00', null, '11236|MATEMATICAS 1|5|5|0|0|0|0|15|2015-01-21|vamos a ver|1|20092');
INSERT INTO `bitacora` VALUES ('73', 'planestudio', '2', 'D', '2015-01-29 00:00:00', null, '20101|Plan 2010-1|200|2015-01-01|2015-12-31|1');
INSERT INTO `bitacora` VALUES ('74', 'planestudio', '1', 'D', '2015-01-29 00:00:00', null, '20092|Plan 2009-2|100|2015-01-01|2015-01-31|1');
INSERT INTO `bitacora` VALUES ('75', 'planestudio', '1', 'I', '2015-01-29 00:00:00', '20091|Plan 2009-1|200|2015-01-29|2017-12-31|1', null);
INSERT INTO `bitacora` VALUES ('76', 'plan_programa', '1', 'I', '2015-01-29 00:00:00', '20091|1', null);
INSERT INTO `bitacora` VALUES ('77', 'plan_programa', '1', 'I', '2015-01-29 00:00:00', '20091|2', null);
INSERT INTO `bitacora` VALUES ('78', 'plan_programa', '1', 'I', '2015-01-29 00:00:00', '20091|3', null);
INSERT INTO `bitacora` VALUES ('79', 'plan_programa', '1', 'I', '2015-01-29 00:00:00', '20091|4', null);
INSERT INTO `bitacora` VALUES ('80', 'plan_programa', '1', 'I', '2015-01-29 00:00:00', '20091|5', null);
INSERT INTO `bitacora` VALUES ('81', 'plan_programa', '1', 'I', '2015-01-29 00:00:00', '20091|6', null);
INSERT INTO `bitacora` VALUES ('82', 'plan_programa', '1', 'I', '2015-01-29 00:00:00', '20091|7', null);
INSERT INTO `bitacora` VALUES ('83', 'uaprendizaje', '1', 'I', '2015-01-29 00:00:00', '11236|MATEMÁTICAS I|5|5|0|0|0|0|15|2015-01-29|vamos a ver|1|20091', null);
INSERT INTO `bitacora` VALUES ('84', 'p_ua', '1', 'I', '2015-01-29 00:00:00', '1|11236|1|1|1', null);
INSERT INTO `bitacora` VALUES ('85', 'p_ua', '1', 'I', '2015-01-29 00:00:00', '3|11236|1|1|1', null);
INSERT INTO `bitacora` VALUES ('86', 'uaprendizaje', '1', 'I', '2015-01-29 00:00:00', '11237|MATEMÁTICAS II|15|2|0|0|0|0|32|2015-01-29|vamos a ver|1|20091', null);
INSERT INTO `bitacora` VALUES ('87', 'p_ua', '1', 'I', '2015-01-29 00:00:00', '1|11237|1|1|1', null);
INSERT INTO `bitacora` VALUES ('88', 'detalleseriacion', '1', 'I', '2015-01-29 00:00:00', '11237|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('89', 'p_ua', '1', 'I', '2015-01-29 00:00:00', '3|11237|1|1|1', null);
INSERT INTO `bitacora` VALUES ('90', 'detalleseriacion', '1', 'I', '2015-01-29 00:00:00', '11237|3|11236|1', null);
INSERT INTO `bitacora` VALUES ('91', 'uaprendizaje', '1', 'I', '2015-01-29 00:00:00', '11238|MATEMÁTICAS BASICAS|3|0|0|0|0|0|6|2015-01-29|vamos a ver|1|20091', null);
INSERT INTO `bitacora` VALUES ('92', 'p_ua', '1', 'I', '2015-01-29 00:00:00', '6|11238|1|1|1', null);
INSERT INTO `bitacora` VALUES ('93', 'uaprendizaje', '1', 'I', '2015-01-29 00:00:00', '11239|ESPAÑOL|3|0|0|0|0|0|6|2015-01-29|vamos a ver|2|20091', null);
INSERT INTO `bitacora` VALUES ('94', 'p_ua', '1', 'I', '2015-01-29 00:00:00', '6|11239|1|1|1', null);
INSERT INTO `bitacora` VALUES ('95', 'uaprendizaje', '1', 'I', '2015-01-29 00:00:00', '11240|OPTATIVA 1|3|0|0|0|0|0|6|2015-01-29|vamos a ver|5|20091', null);
INSERT INTO `bitacora` VALUES ('96', 'p_ua', '1', 'I', '2015-01-29 00:00:00', '1|11240|1|2|1', null);
INSERT INTO `bitacora` VALUES ('97', 'grupos', '1', 'I', '2015-01-29 00:00:00', '111|20141|20091|1|1', null);
INSERT INTO `bitacora` VALUES ('98', 'grupos', '1', 'I', '2015-01-29 00:00:00', '112|20141|20091|1|3', null);
INSERT INTO `bitacora` VALUES ('99', 'carga', '1', 'I', '2015-01-29 00:00:00', '111|20141|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('100', 'carga', '1', 'I', '2015-01-29 00:00:00', '111|20141|1|11237|1', null);
INSERT INTO `bitacora` VALUES ('101', 'carga', '1', 'I', '2015-01-29 00:00:00', '112|20141|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('102', 'carga', '1', 'I', '2015-01-29 00:00:00', '112|20141|1|11237|1', null);
INSERT INTO `bitacora` VALUES ('103', 'carga', '1', 'D', '2015-01-29 00:00:00', null, '112|20141|1|11237|1');
INSERT INTO `bitacora` VALUES ('104', 'carga', '1', 'D', '2015-01-29 00:00:00', null, '112|20141|1|11236|1');
INSERT INTO `bitacora` VALUES ('105', 'carga', '1', 'D', '2015-01-29 00:00:00', null, '111|20141|1|11237|1');
INSERT INTO `bitacora` VALUES ('106', 'carga', '1', 'D', '2015-01-29 00:00:00', null, '111|20141|1|11236|1');
INSERT INTO `bitacora` VALUES ('107', 'carga', '1', 'I', '2015-01-29 00:00:00', '111|20141|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('108', 'carga', '1', 'I', '2015-01-29 00:00:00', '111|20141|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('109', 'carga', '1', 'I', '2015-01-29 00:00:00', '112|20141|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('110', 'carga', '1', 'I', '2015-01-29 00:00:00', '111|20141|1|11240|1', null);
INSERT INTO `bitacora` VALUES ('111', 'grupos', '1', 'I', '2015-01-29 00:00:00', '113|20141|20091|1|1', null);
INSERT INTO `bitacora` VALUES ('112', 'grupos', '1', 'I', '2015-01-29 00:00:00', '114|20141|20091|1|2', null);
INSERT INTO `bitacora` VALUES ('113', 'carga', '1', 'I', '2015-01-29 00:00:00', '111|20141|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('114', 'carga', '1', 'I', '2015-01-29 00:00:00', '112|20141|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('115', 'carga', '1', 'I', '2015-01-29 00:00:00', '113|20141|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('116', 'carga', '1', 'I', '2015-01-29 00:00:00', '114|20141|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('117', 'carga', '1', 'I', '2015-01-29 00:00:00', '112|20141|1|11240|1', null);
INSERT INTO `bitacora` VALUES ('118', 'carga', '1', 'D', '2015-01-29 00:00:00', null, '112|20141|1|11240|1');
INSERT INTO `bitacora` VALUES ('119', 'carga', '1', 'D', '2015-01-29 00:00:00', null, '111|20141|1|11236|1');
INSERT INTO `bitacora` VALUES ('120', 'carga', '1', 'D', '2015-01-29 00:00:00', null, '112|20141|1|11236|1');
INSERT INTO `bitacora` VALUES ('121', 'carga', '1', 'D', '2015-01-29 00:00:00', null, '113|20141|1|11236|1');
INSERT INTO `bitacora` VALUES ('122', 'carga', '1', 'D', '2015-01-29 00:00:00', null, '114|20141|1|11236|1');
INSERT INTO `bitacora` VALUES ('123', 'carga', '1', 'I', '2015-01-29 00:00:00', '111|20141|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('124', 'carga', '1', 'I', '2015-01-29 00:00:00', '112|20141|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('125', 'carga', '1', 'I', '2015-01-29 00:00:00', '113|20141|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('126', 'carga', '1', 'I', '2015-01-29 00:00:00', '114|20141|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('127', 'carga', '1', 'I', '2015-01-29 00:00:00', '111|20141|1|11240|1', null);
INSERT INTO `bitacora` VALUES ('128', 'carga', '1', 'I', '2015-01-29 00:00:00', '112|20141|1|11240|1', null);
INSERT INTO `bitacora` VALUES ('129', 'carga', '1', 'I', '2015-01-29 00:00:00', '113|20141|1|11240|1', null);
INSERT INTO `bitacora` VALUES ('130', 'carga', '1', 'I', '2015-01-29 00:00:00', '114|20141|1|11240|1', null);
INSERT INTO `bitacora` VALUES ('131', 'carga', '1', 'I', '2015-01-29 00:00:00', '111|20141|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('132', 'carga', '1', 'I', '2015-01-29 00:00:00', '112|20141|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('133', 'carga', '1', 'I', '2015-01-29 00:00:00', '113|20141|1|11237|1', null);
INSERT INTO `bitacora` VALUES ('134', 'carga', '1', 'I', '2015-01-29 00:00:00', '114|20141|1|11237|1', null);
INSERT INTO `bitacora` VALUES ('135', 'carga', '1', 'I', '2015-01-30 00:00:00', '114|20141|1|11240|1', null);
INSERT INTO `bitacora` VALUES ('136', 'carga', '1', 'I', '2015-01-30 00:00:00', '113|20141|1|11240|1', null);
INSERT INTO `bitacora` VALUES ('137', 'grupos', '1', 'I', '2015-01-31 00:00:00', '115|20141|20091|1|1', null);
INSERT INTO `bitacora` VALUES ('146', 'carga', '1', 'D', '2015-02-06 00:00:00', null, '111|20141|1|11236|1');
INSERT INTO `bitacora` VALUES ('147', 'carga', '1', 'D', '2015-02-06 00:00:00', null, '112|20141|1|11236|1');
INSERT INTO `bitacora` VALUES ('148', 'carga', '1', 'I', '2015-02-06 00:00:00', '111|20141|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('149', 'carga', '1', 'D', '2015-02-06 00:00:00', null, '111|20141|1|11236|1');
INSERT INTO `bitacora` VALUES ('150', 'carga', '1', 'I', '2015-02-06 00:00:00', '111|20141|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('151', 'carga', '1', 'D', '2015-02-06 00:00:00', null, '111|20141|1|11236|1');
INSERT INTO `bitacora` VALUES ('152', 'carga', '1', 'I', '2015-02-06 00:00:00', '111|20141|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('153', 'carga', '1', 'I', '2015-02-06 00:00:00', '112|20141|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('154', 'carga', '1', 'I', '2015-02-06 00:00:00', '113|20141|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('155', 'carga', '1', 'D', '2015-02-06 00:00:00', null, '111|20141|1|11236|1');
INSERT INTO `bitacora` VALUES ('156', 'carga', '1', 'D', '2015-02-06 00:00:00', null, '112|20141|1|11236|1');
INSERT INTO `bitacora` VALUES ('157', 'carga', '1', 'D', '2015-02-06 00:00:00', null, '113|20141|1|11236|1');
INSERT INTO `bitacora` VALUES ('158', 'carga', '1', 'I', '2015-02-06 00:00:00', '111|20141|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('159', 'carga', '1', 'I', '2015-02-06 00:00:00', '112|20141|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('160', 'carga', '1', 'I', '2015-02-06 00:00:00', '113|20141|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('161', 'carga', '1', 'I', '2015-02-06 00:00:00', '114|20141|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('162', 'carga', '1', 'I', '2015-02-06 00:00:00', '115|20141|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('163', 'carga', '1', 'D', '2015-02-06 00:00:00', null, '111|20141|1|11236|1');
INSERT INTO `bitacora` VALUES ('164', 'carga', '1', 'D', '2015-02-06 00:00:00', null, '112|20141|1|11236|1');
INSERT INTO `bitacora` VALUES ('165', 'carga', '1', 'D', '2015-02-06 00:00:00', null, '113|20141|1|11236|1');
INSERT INTO `bitacora` VALUES ('166', 'carga', '1', 'D', '2015-02-06 00:00:00', null, '114|20141|1|11236|1');
INSERT INTO `bitacora` VALUES ('167', 'carga', '1', 'D', '2015-02-06 00:00:00', null, '115|20141|1|11236|1');
INSERT INTO `bitacora` VALUES ('168', 'carga', '1', 'I', '2015-02-06 00:00:00', '111|20141|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('169', 'carga', '1', 'I', '2015-02-06 00:00:00', '112|20141|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('170', 'carga', '1', 'D', '2015-02-06 00:00:00', null, '111|20141|1|11236|1');
INSERT INTO `bitacora` VALUES ('171', 'carga', '1', 'D', '2015-02-06 00:00:00', null, '112|20141|1|11236|1');
INSERT INTO `bitacora` VALUES ('172', 'carga', '1', 'I', '2015-02-06 00:00:00', '111|20141|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('173', 'carga', '1', 'I', '2015-02-06 00:00:00', '112|20141|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('174', 'carga', '1', 'I', '2015-02-06 00:00:00', '113|20141|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('175', 'carga', '1', 'D', '2015-02-06 00:00:00', null, '111|20141|1|11236|1');
INSERT INTO `bitacora` VALUES ('176', 'carga', '1', 'D', '2015-02-06 00:00:00', null, '112|20141|1|11236|1');
INSERT INTO `bitacora` VALUES ('177', 'carga', '1', 'D', '2015-02-06 00:00:00', null, '113|20141|1|11236|1');
INSERT INTO `bitacora` VALUES ('178', 'carga', '1', 'I', '2015-02-06 00:00:00', '111|20141|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('179', 'carga', '1', 'D', '2015-02-06 00:00:00', null, '111|20141|1|11236|1');
INSERT INTO `bitacora` VALUES ('180', 'carga', '1', 'I', '2015-02-06 00:00:00', '111|20141|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('181', 'carga', '1', 'I', '2015-02-06 00:00:00', '112|20141|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('182', 'carga', '1', 'I', '2015-02-06 00:00:00', '113|20141|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('183', 'carga', '1', 'D', '2015-02-06 00:00:00', null, '113|20141|1|11237|1');
INSERT INTO `bitacora` VALUES ('184', 'carga', '1', 'D', '2015-02-06 00:00:00', null, '114|20141|1|11237|1');
INSERT INTO `bitacora` VALUES ('185', 'carga', '1', 'I', '2015-02-06 00:00:00', '112|20141|1|11237|1', null);
INSERT INTO `bitacora` VALUES ('186', 'carga', '1', 'I', '2015-02-06 00:00:00', '113|20141|1|11237|1', null);
INSERT INTO `bitacora` VALUES ('187', 'carga', '1', 'I', '2015-02-06 00:00:00', '114|20141|1|11237|1', null);
INSERT INTO `bitacora` VALUES ('188', 'carga', '1', 'D', '2015-02-06 00:00:00', null, '111|20141|1|11236|1');
INSERT INTO `bitacora` VALUES ('189', 'carga', '1', 'D', '2015-02-06 00:00:00', null, '112|20141|1|11236|1');
INSERT INTO `bitacora` VALUES ('190', 'carga', '1', 'D', '2015-02-06 00:00:00', null, '113|20141|1|11236|1');
INSERT INTO `bitacora` VALUES ('191', 'carga', '1', 'I', '2015-02-06 00:00:00', '111|20141|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('192', 'carga', '1', 'D', '2015-02-06 00:00:00', null, '111|20141|1|11236|1');
INSERT INTO `bitacora` VALUES ('193', 'carga', '1', 'I', '2015-02-06 00:00:00', '111|20141|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('194', 'carga', '1', 'I', '2015-02-06 00:00:00', '112|20141|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('195', 'carga', '1', 'I', '2015-02-06 00:00:00', '113|20141|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('196', 'carga', '1', 'I', '2015-02-06 00:00:00', '114|20141|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('197', 'carga', '1', 'I', '2015-02-06 00:00:00', '115|20141|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('198', 'carga', '1', 'D', '2015-02-06 00:00:00', null, '112|20141|1|11237|1');
INSERT INTO `bitacora` VALUES ('199', 'carga', '1', 'D', '2015-02-06 00:00:00', null, '113|20141|1|11237|1');
INSERT INTO `bitacora` VALUES ('200', 'carga', '1', 'D', '2015-02-06 00:00:00', null, '114|20141|1|11237|1');
INSERT INTO `bitacora` VALUES ('201', 'carga', '1', 'I', '2015-02-06 00:00:00', '111|20141|1|11237|1', null);
INSERT INTO `bitacora` VALUES ('202', 'carga', '1', 'I', '2015-02-06 00:00:00', '112|20141|1|11237|1', null);
INSERT INTO `bitacora` VALUES ('203', 'carga', '1', 'I', '2015-02-06 00:00:00', '113|20141|1|11237|1', null);
INSERT INTO `bitacora` VALUES ('204', 'carga', '1', 'I', '2015-02-06 00:00:00', '114|20141|1|11237|1', null);
INSERT INTO `bitacora` VALUES ('205', 'carga', '1', 'I', '2015-02-06 00:00:00', '115|20141|1|11237|1', null);
INSERT INTO `bitacora` VALUES ('206', 'carga', '1', 'D', '2015-02-06 00:00:00', null, '111|20141|1|11236|1');
INSERT INTO `bitacora` VALUES ('207', 'carga', '1', 'D', '2015-02-06 00:00:00', null, '112|20141|1|11236|1');
INSERT INTO `bitacora` VALUES ('208', 'carga', '1', 'D', '2015-02-06 00:00:00', null, '113|20141|1|11236|1');
INSERT INTO `bitacora` VALUES ('209', 'carga', '1', 'D', '2015-02-06 00:00:00', null, '114|20141|1|11236|1');
INSERT INTO `bitacora` VALUES ('210', 'carga', '1', 'D', '2015-02-06 00:00:00', null, '115|20141|1|11236|1');
INSERT INTO `bitacora` VALUES ('211', 'carga', '1', 'I', '2015-02-06 00:00:00', '111|20141|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('212', 'carga', '1', 'I', '2015-02-06 00:00:00', '112|20141|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('213', 'carga', '1', 'D', '2015-02-06 00:00:00', null, '113|20141|1|11240|1');
INSERT INTO `bitacora` VALUES ('214', 'carga', '1', 'D', '2015-02-06 00:00:00', null, '114|20141|1|11240|1');
INSERT INTO `bitacora` VALUES ('215', 'carga', '1', 'I', '2015-02-06 00:00:00', '112|20141|1|11240|1', null);
INSERT INTO `bitacora` VALUES ('216', 'carga', '1', 'I', '2015-02-06 00:00:00', '113|20141|1|11240|1', null);
INSERT INTO `bitacora` VALUES ('217', 'carga', '1', 'I', '2015-02-06 00:00:00', '114|20141|1|11240|1', null);
INSERT INTO `bitacora` VALUES ('218', 'carga', '1', 'D', '2015-02-06 00:00:00', null, '111|20141|1|11236|1');
INSERT INTO `bitacora` VALUES ('219', 'carga', '1', 'D', '2015-02-06 00:00:00', null, '112|20141|1|11236|1');
INSERT INTO `bitacora` VALUES ('220', 'carga', '1', 'I', '2015-02-06 00:00:00', '111|20141|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('221', 'carga', '1', 'I', '2015-02-06 00:00:00', '112|20141|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('222', 'carga', '1', 'I', '2015-02-06 00:00:00', '113|20141|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('223', 'carga', '1', 'I', '2015-02-06 00:00:00', '114|20141|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('224', 'carga', '1', 'I', '2015-02-06 00:00:00', '115|20141|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('225', 'carga', '1', 'D', '2015-02-06 00:00:00', null, '112|20141|1|11240|1');
INSERT INTO `bitacora` VALUES ('226', 'carga', '1', 'D', '2015-02-06 00:00:00', null, '113|20141|1|11240|1');
INSERT INTO `bitacora` VALUES ('227', 'carga', '1', 'D', '2015-02-06 00:00:00', null, '114|20141|1|11240|1');
INSERT INTO `bitacora` VALUES ('228', 'carga', '1', 'I', '2015-02-06 00:00:00', '111|20141|1|11240|1', null);
INSERT INTO `bitacora` VALUES ('229', 'grupos', '1', 'I', '2015-02-06 00:00:00', '121|20141|20091|1|2', null);
INSERT INTO `bitacora` VALUES ('230', 'carga', '1', 'I', '2015-02-06 00:00:00', '121|20141|1|11237|2', null);
INSERT INTO `bitacora` VALUES ('231', 'carga', '1', 'D', '2015-02-06 00:00:00', null, '111|20141|1|11237|1');
INSERT INTO `bitacora` VALUES ('232', 'carga', '1', 'D', '2015-02-06 00:00:00', null, '112|20141|1|11237|1');
INSERT INTO `bitacora` VALUES ('233', 'carga', '1', 'D', '2015-02-06 00:00:00', null, '113|20141|1|11237|1');
INSERT INTO `bitacora` VALUES ('234', 'carga', '1', 'D', '2015-02-06 00:00:00', null, '114|20141|1|11237|1');
INSERT INTO `bitacora` VALUES ('235', 'carga', '1', 'D', '2015-02-06 00:00:00', null, '115|20141|1|11237|1');
INSERT INTO `bitacora` VALUES ('236', 'carga', '1', 'D', '2015-02-06 00:00:00', null, '121|20141|1|11237|2');
INSERT INTO `bitacora` VALUES ('237', 'carga', '1', 'D', '2015-02-06 00:00:00', null, '111|20141|1|11240|1');
INSERT INTO `bitacora` VALUES ('238', 'carga', '1', 'I', '2015-02-06 00:00:00', '121|20141|1|11237|2', null);
INSERT INTO `bitacora` VALUES ('239', 'carga', '1', 'I', '2015-02-06 00:00:00', '111|20141|1|11237|1', null);
INSERT INTO `bitacora` VALUES ('240', 'carga', '1', 'I', '2015-02-06 00:00:00', '112|20141|1|11237|1', null);
INSERT INTO `bitacora` VALUES ('241', 'carga', '1', 'I', '2015-02-06 00:00:00', '113|20141|1|11237|1', null);
INSERT INTO `bitacora` VALUES ('242', 'carga', '1', 'I', '2015-02-06 00:00:00', '114|20141|1|11237|1', null);
INSERT INTO `bitacora` VALUES ('243', 'carga', '1', 'I', '2015-02-06 00:00:00', '115|20141|1|11237|1', null);
INSERT INTO `bitacora` VALUES ('244', 'carga', '1', 'D', '2015-02-06 00:00:00', null, '111|20141|1|11237|1');
INSERT INTO `bitacora` VALUES ('245', 'carga', '1', 'D', '2015-02-06 00:00:00', null, '112|20141|1|11237|1');
INSERT INTO `bitacora` VALUES ('246', 'carga', '1', 'D', '2015-02-06 00:00:00', null, '113|20141|1|11237|1');
INSERT INTO `bitacora` VALUES ('247', 'carga', '1', 'D', '2015-02-06 00:00:00', null, '114|20141|1|11237|1');
INSERT INTO `bitacora` VALUES ('248', 'carga', '1', 'D', '2015-02-06 00:00:00', null, '115|20141|1|11237|1');
INSERT INTO `bitacora` VALUES ('249', 'carga', '1', 'D', '2015-02-06 00:00:00', null, '111|20141|1|11236|1');
INSERT INTO `bitacora` VALUES ('250', 'carga', '1', 'D', '2015-02-06 00:00:00', null, '112|20141|1|11236|1');
INSERT INTO `bitacora` VALUES ('251', 'carga', '1', 'D', '2015-02-06 00:00:00', null, '113|20141|1|11236|1');
INSERT INTO `bitacora` VALUES ('252', 'carga', '1', 'D', '2015-02-06 00:00:00', null, '114|20141|1|11236|1');
INSERT INTO `bitacora` VALUES ('253', 'carga', '1', 'D', '2015-02-06 00:00:00', null, '115|20141|1|11236|1');
INSERT INTO `bitacora` VALUES ('254', 'carga', '1', 'I', '2015-02-06 00:00:00', '111|20141|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('255', 'carga', '1', 'I', '2015-02-06 00:00:00', '112|20141|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('256', 'carga', '1', 'I', '2015-02-06 00:00:00', '113|20141|1|11237|1', null);
INSERT INTO `bitacora` VALUES ('257', 'carga', '1', 'I', '2015-02-06 00:00:00', '111|20141|1|11238|1', null);
INSERT INTO `bitacora` VALUES ('258', 'carga', '1', 'I', '2015-02-06 00:00:00', '112|20141|1|11238|1', null);
INSERT INTO `bitacora` VALUES ('259', 'carga', '1', 'I', '2015-02-06 00:00:00', '113|20141|1|11238|1', null);
INSERT INTO `bitacora` VALUES ('260', 'carga', '1', 'I', '2015-02-06 00:00:00', '111|20141|1|11239|1', null);
INSERT INTO `bitacora` VALUES ('261', 'carga', '1', 'I', '2015-02-06 00:00:00', '112|20141|1|11239|1', null);
INSERT INTO `bitacora` VALUES ('262', 'carga', '1', 'I', '2015-02-06 00:00:00', '113|20141|1|11239|1', null);
INSERT INTO `bitacora` VALUES ('263', 'carga', '1', 'I', '2015-02-06 00:00:00', '111|20141|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('264', 'carga', '1', 'I', '2015-02-06 00:00:00', '112|20141|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('265', 'carga', '1', 'I', '2015-02-06 00:00:00', '113|20141|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('266', 'carga', '1', 'I', '2015-02-06 00:00:00', '114|20141|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('267', 'carga', '1', 'I', '2015-02-06 00:00:00', '115|20141|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('268', 'carga', '1', 'I', '2015-02-06 00:00:00', '111|20141|1|11238|1', null);
INSERT INTO `bitacora` VALUES ('269', 'carga', '1', 'I', '2015-02-06 00:00:00', '112|20141|1|11238|1', null);
INSERT INTO `bitacora` VALUES ('270', 'carga', '1', 'I', '2015-02-06 00:00:00', '113|20141|1|11238|1', null);
INSERT INTO `bitacora` VALUES ('271', 'carga', '1', 'I', '2015-02-06 00:00:00', '114|20141|1|11238|1', null);
INSERT INTO `bitacora` VALUES ('272', 'carga', '1', 'I', '2015-02-06 00:00:00', '115|20141|1|11238|1', null);
INSERT INTO `bitacora` VALUES ('273', 'carga', '1', 'I', '2015-02-11 00:00:00', '111|20141|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('274', 'carga', '1', 'I', '2015-02-11 00:00:00', '111|20141|1|11237|1', null);
INSERT INTO `bitacora` VALUES ('275', 'carga', '1', 'I', '2015-02-11 00:00:00', '111|20141|1|11238|1', null);
INSERT INTO `bitacora` VALUES ('276', 'carga', '1', 'I', '2015-02-11 00:00:00', '112|20141|1|11238|1', null);
INSERT INTO `bitacora` VALUES ('277', 'carga', '1', 'I', '2015-02-11 00:00:00', '113|20141|1|11238|1', null);
INSERT INTO `bitacora` VALUES ('278', 'carga', '1', 'I', '2015-02-11 00:00:00', '114|20141|1|11238|1', null);
INSERT INTO `bitacora` VALUES ('279', 'carga', '1', 'I', '2015-02-11 00:00:00', '115|20141|1|11238|1', null);
INSERT INTO `bitacora` VALUES ('280', 'carga', '1', 'D', '2015-02-11 00:00:00', null, '111|20141|1|11236|1');
INSERT INTO `bitacora` VALUES ('281', 'carga', '1', 'I', '2015-02-11 00:00:00', '112|20141|1|11238|1', null);
INSERT INTO `bitacora` VALUES ('282', 'carga', '1', 'I', '2015-02-11 00:00:00', '113|20141|1|11238|1', null);
INSERT INTO `bitacora` VALUES ('283', 'carga', '1', 'D', '2015-02-11 00:00:00', null, '113|20141|1|11238|1');
INSERT INTO `bitacora` VALUES ('284', 'carga', '1', 'D', '2015-02-11 00:00:00', null, '112|20141|1|11238|1');
INSERT INTO `bitacora` VALUES ('285', 'carga', '1', 'I', '2015-02-11 00:00:00', '111|20141|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('286', 'carga', '1', 'I', '2015-02-11 00:00:00', '111|20141|1|11237|1', null);
INSERT INTO `bitacora` VALUES ('287', 'carga', '1', 'I', '2015-02-11 00:00:00', '112|20141|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('288', 'carga', '1', 'I', '2015-02-11 00:00:00', '112|20141|1|11237|1', null);
INSERT INTO `bitacora` VALUES ('289', 'carga', '1', 'I', '2015-02-11 00:00:00', '113|20141|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('290', 'carga', '1', 'I', '2015-02-11 00:00:00', '113|20141|1|11237|1', null);
INSERT INTO `bitacora` VALUES ('291', 'carga', '1', 'I', '2015-02-11 00:00:00', '114|20141|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('292', 'carga', '1', 'I', '2015-02-11 00:00:00', '114|20141|1|11237|1', null);
INSERT INTO `bitacora` VALUES ('293', 'carga', '1', 'I', '2015-02-11 00:00:00', '115|20141|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('294', 'carga', '1', 'I', '2015-02-11 00:00:00', '115|20141|1|11237|1', null);
INSERT INTO `bitacora` VALUES ('295', 'grupos', '1', 'I', '2015-02-11 00:00:00', '111|20142|20091|1|1', null);
INSERT INTO `bitacora` VALUES ('296', 'carga', '1', 'I', '2015-02-11 00:00:00', '111|20142|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('297', 'carga', '1', 'D', '2015-02-11 00:00:00', null, '111|20142|1|11236|1');
INSERT INTO `bitacora` VALUES ('298', 'carga', '1', 'I', '2015-02-11 00:00:00', '111|20142|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('299', 'carga', '1', 'D', '2015-02-11 00:00:00', null, '111|20141|1|11236|1');
INSERT INTO `bitacora` VALUES ('300', 'carga', '1', 'D', '2015-02-11 00:00:00', null, '112|20141|1|11236|1');
INSERT INTO `bitacora` VALUES ('301', 'carga', '1', 'D', '2015-02-11 00:00:00', null, '113|20141|1|11236|1');
INSERT INTO `bitacora` VALUES ('302', 'carga', '1', 'D', '2015-02-11 00:00:00', null, '114|20141|1|11236|1');
INSERT INTO `bitacora` VALUES ('303', 'carga', '1', 'D', '2015-02-11 00:00:00', null, '115|20141|1|11236|1');
INSERT INTO `bitacora` VALUES ('304', 'carga', '1', 'I', '2015-02-11 00:00:00', '111|20141|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('305', 'carga', '1', 'I', '2015-02-11 00:00:00', '113|20141|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('306', 'carga', '1', 'D', '2015-02-11 00:00:00', null, '111|20141|1|11237|1');
INSERT INTO `bitacora` VALUES ('307', 'carga', '1', 'D', '2015-02-11 00:00:00', null, '112|20141|1|11237|1');
INSERT INTO `bitacora` VALUES ('308', 'carga', '1', 'D', '2015-02-11 00:00:00', null, '113|20141|1|11237|1');
INSERT INTO `bitacora` VALUES ('309', 'carga', '1', 'D', '2015-02-11 00:00:00', null, '114|20141|1|11237|1');
INSERT INTO `bitacora` VALUES ('310', 'carga', '1', 'D', '2015-02-11 00:00:00', null, '115|20141|1|11237|1');
INSERT INTO `bitacora` VALUES ('311', 'carga', '1', 'I', '2015-02-11 00:00:00', '111|20141|1|11237|1', null);
INSERT INTO `bitacora` VALUES ('312', 'carga', '1', 'I', '2015-02-11 00:00:00', '112|20141|1|11237|1', null);
INSERT INTO `bitacora` VALUES ('313', 'grupos', '1', 'D', '2015-02-12 00:00:00', null, '121|20141|20091|1|2');
INSERT INTO `bitacora` VALUES ('314', 'grupos', '1', 'D', '2015-02-12 00:00:00', null, '115|20141|20091|1|1');
INSERT INTO `bitacora` VALUES ('315', 'grupos', '1', 'D', '2015-02-12 00:00:00', null, '114|20141|20091|1|2');
INSERT INTO `bitacora` VALUES ('316', 'grupos', '1', 'D', '2015-02-12 00:00:00', null, '113|20141|20091|1|1');
INSERT INTO `bitacora` VALUES ('317', 'grupos', '1', 'D', '2015-02-12 00:00:00', null, '112|20141|20091|1|3');
INSERT INTO `bitacora` VALUES ('318', 'grupos', '1', 'D', '2015-02-12 00:00:00', null, '111|20142|20091|1|1');
INSERT INTO `bitacora` VALUES ('319', 'grupos', '1', 'D', '2015-02-12 00:00:00', null, '111|20141|20091|1|1');
INSERT INTO `bitacora` VALUES ('320', 'grupos', '1', 'I', '2015-02-12 00:00:00', '111|20141|20091|1|1', null);
INSERT INTO `bitacora` VALUES ('321', 'grupos', '1', 'I', '2015-02-12 00:00:00', '112|20141|20091|1|1', null);
INSERT INTO `bitacora` VALUES ('322', 'grupos', '1', 'I', '2015-02-12 00:00:00', '113|20141|20091|1|1', null);
INSERT INTO `bitacora` VALUES ('323', 'carga', '1', 'I', '2015-02-12 00:00:00', '111|20141|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('324', 'carga', '1', 'I', '2015-02-12 00:00:00', '112|20141|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('325', 'carga', '1', 'I', '2015-02-12 00:00:00', '113|20141|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('326', 'carga', '1', 'I', '2015-02-12 00:00:00', '112|20141|1|11240|1', null);
INSERT INTO `bitacora` VALUES ('327', 'carga', '1', 'I', '2015-02-12 00:00:00', '111|20141|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('328', 'carga', '1', 'I', '2015-02-12 00:00:00', '112|20141|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('329', 'carga', '1', 'I', '2015-02-12 00:00:00', '113|20141|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('330', 'carga', '1', 'I', '2015-02-12 00:00:00', '112|20141|1|11240|1', null);
INSERT INTO `bitacora` VALUES ('331', 'planestudio', '1', 'I', '2015-02-12 00:00:00', '20092|Plan 2009-2|300|2015-02-12|2015-10-31|1', null);
INSERT INTO `bitacora` VALUES ('332', 'plan_programa', '1', 'I', '2015-02-12 00:00:00', '20092|1', null);
INSERT INTO `bitacora` VALUES ('333', 'plan_programa', '1', 'I', '2015-02-12 00:00:00', '20092|2', null);
INSERT INTO `bitacora` VALUES ('334', 'plan_programa', '1', 'I', '2015-02-12 00:00:00', '20092|3', null);
INSERT INTO `bitacora` VALUES ('335', 'plan_programa', '1', 'I', '2015-02-12 00:00:00', '20092|4', null);
INSERT INTO `bitacora` VALUES ('336', 'plan_programa', '1', 'I', '2015-02-12 00:00:00', '20092|5', null);
INSERT INTO `bitacora` VALUES ('337', 'plan_programa', '1', 'I', '2015-02-12 00:00:00', '20092|6', null);
INSERT INTO `bitacora` VALUES ('338', 'plan_programa', '1', 'I', '2015-02-12 00:00:00', '20092|7', null);
INSERT INTO `bitacora` VALUES ('339', 'plan_programa', '1', 'D', '2015-02-12 00:00:00', null, '20092|7');
INSERT INTO `bitacora` VALUES ('340', 'plan_programa', '1', 'D', '2015-02-12 00:00:00', null, '20092|6');
INSERT INTO `bitacora` VALUES ('341', 'plan_programa', '1', 'D', '2015-02-12 00:00:00', null, '20092|5');
INSERT INTO `bitacora` VALUES ('342', 'plan_programa', '1', 'D', '2015-02-12 00:00:00', null, '20092|4');
INSERT INTO `bitacora` VALUES ('343', 'plan_programa', '1', 'D', '2015-02-12 00:00:00', null, '20092|3');
INSERT INTO `bitacora` VALUES ('344', 'plan_programa', '1', 'D', '2015-02-12 00:00:00', null, '20092|2');
INSERT INTO `bitacora` VALUES ('345', 'plan_programa', '1', 'D', '2015-02-12 00:00:00', null, '20092|1');
INSERT INTO `bitacora` VALUES ('346', 'planestudio', '1', 'D', '2015-02-12 00:00:00', null, '20092|Plan 2009-2|300|2015-02-12|2015-10-31|1');
INSERT INTO `bitacora` VALUES ('347', 'carga', '1', 'I', '2015-02-12 00:00:00', '111|20141|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('348', 'carga', '1', 'I', '2015-02-12 00:00:00', '112|20141|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('349', 'carga', '1', 'I', '2015-02-12 00:00:00', '113|20141|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('350', 'grupos', '1', 'I', '2015-02-12 00:00:00', '114|20141|20091|1|2', null);
INSERT INTO `bitacora` VALUES ('351', 'carga', '1', 'D', '2015-02-12 00:00:00', null, '111|20141|1|11236|1');
INSERT INTO `bitacora` VALUES ('352', 'carga', '1', 'D', '2015-02-12 00:00:00', null, '112|20141|1|11236|1');
INSERT INTO `bitacora` VALUES ('353', 'carga', '1', 'D', '2015-02-12 00:00:00', null, '113|20141|1|11236|1');
INSERT INTO `bitacora` VALUES ('354', 'carga', '1', 'I', '2015-02-12 00:00:00', '111|20141|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('355', 'carga', '1', 'I', '2015-02-12 00:00:00', '112|20141|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('356', 'carga', '1', 'I', '2015-02-12 00:00:00', '113|20141|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('357', 'carga', '1', 'I', '2015-02-12 00:00:00', '114|20141|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('358', 'carga', '1', 'I', '2015-02-12 00:00:00', '112|20141|1|11237|1', null);
INSERT INTO `bitacora` VALUES ('359', 'carga', '1', 'I', '2015-02-12 00:00:00', '113|20141|1|11237|1', null);
INSERT INTO `bitacora` VALUES ('360', 'carga', '1', 'I', '2015-02-12 00:00:00', '111|20141|1|11240|1', null);
INSERT INTO `bitacora` VALUES ('361', 'carga', '1', 'I', '2015-02-13 00:00:00', '111|20141|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('362', 'carga', '1', 'I', '2015-02-13 00:00:00', '112|20141|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('363', 'carga', '1', 'I', '2015-02-13 00:00:00', '113|20141|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('364', 'carga', '1', 'I', '2015-02-13 00:00:00', '114|20141|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('365', 'carga', '1', 'I', '2015-02-13 00:00:00', '112|20141|1|11240|1', null);
INSERT INTO `bitacora` VALUES ('374', 'grupos', '1', 'I', '2015-02-13 00:00:00', '111|20142|20091|1|1', null);
INSERT INTO `bitacora` VALUES ('375', 'grupos', '1', 'I', '2015-02-13 00:00:00', '112|20142|20091|1|1', null);
INSERT INTO `bitacora` VALUES ('376', 'grupos', '1', 'I', '2015-02-13 00:00:00', '113|20142|20091|1|1', null);
INSERT INTO `bitacora` VALUES ('377', 'grupos', '1', 'I', '2015-02-13 00:00:00', '114|20142|20091|1|2', null);
INSERT INTO `bitacora` VALUES ('378', 'carga', '1', 'I', '2015-02-13 00:00:00', '111|20142|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('379', 'carga', '1', 'I', '2015-02-13 00:00:00', '112|20142|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('380', 'carga', '1', 'I', '2015-02-13 00:00:00', '112|20142|1|11240|1', null);
INSERT INTO `bitacora` VALUES ('381', 'carga', '1', 'I', '2015-02-13 00:00:00', '113|20142|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('382', 'carga', '1', 'I', '2015-02-13 00:00:00', '114|20142|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('383', 'periodos', '1', 'I', '2015-02-13 00:00:00', '20151|1|2015|1|Uno más|0000-00-00|0000-00-00|1', null);
INSERT INTO `bitacora` VALUES ('384', 'grupos', '1', 'I', '2015-02-13 00:00:00', '111|20151|20091|1|1', null);
INSERT INTO `bitacora` VALUES ('385', 'grupos', '1', 'I', '2015-02-13 00:00:00', '112|20151|20091|1|1', null);
INSERT INTO `bitacora` VALUES ('386', 'grupos', '1', 'I', '2015-02-13 00:00:00', '113|20151|20091|1|1', null);
INSERT INTO `bitacora` VALUES ('387', 'grupos', '1', 'I', '2015-02-13 00:00:00', '114|20151|20091|1|2', null);
INSERT INTO `bitacora` VALUES ('388', 'carga', '1', 'I', '2015-02-13 00:00:00', '111|20151|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('389', 'carga', '1', 'I', '2015-02-13 00:00:00', '112|20151|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('390', 'carga', '1', 'I', '2015-02-13 00:00:00', '112|20151|1|11240|1', null);
INSERT INTO `bitacora` VALUES ('391', 'carga', '1', 'I', '2015-02-13 00:00:00', '113|20151|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('392', 'carga', '1', 'I', '2015-02-13 00:00:00', '114|20151|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('393', 'carga', '1', 'D', '2015-02-13 00:00:00', null, '114|20151|1|11236|1');
INSERT INTO `bitacora` VALUES ('394', 'carga', '1', 'D', '2015-02-13 00:00:00', null, '113|20151|1|11236|1');
INSERT INTO `bitacora` VALUES ('395', 'carga', '1', 'D', '2015-02-13 00:00:00', null, '112|20151|1|11236|1');
INSERT INTO `bitacora` VALUES ('396', 'carga', '1', 'D', '2015-02-13 00:00:00', null, '112|20151|1|11240|1');
INSERT INTO `bitacora` VALUES ('397', 'carga', '1', 'D', '2015-02-13 00:00:00', null, '111|20151|1|11236|1');
INSERT INTO `bitacora` VALUES ('398', 'carga', '1', 'D', '2015-02-13 00:00:00', null, '114|20142|1|11236|1');
INSERT INTO `bitacora` VALUES ('399', 'carga', '1', 'D', '2015-02-13 00:00:00', null, '113|20142|1|11236|1');
INSERT INTO `bitacora` VALUES ('400', 'carga', '1', 'D', '2015-02-13 00:00:00', null, '112|20142|1|11236|1');
INSERT INTO `bitacora` VALUES ('401', 'carga', '1', 'D', '2015-02-13 00:00:00', null, '112|20142|1|11240|1');
INSERT INTO `bitacora` VALUES ('402', 'carga', '1', 'D', '2015-02-13 00:00:00', null, '111|20142|1|11236|1');
INSERT INTO `bitacora` VALUES ('403', 'grupos', '1', 'D', '2015-02-13 00:00:00', null, '114|20151|20091|1|2');
INSERT INTO `bitacora` VALUES ('404', 'grupos', '1', 'D', '2015-02-13 00:00:00', null, '113|20151|20091|1|1');
INSERT INTO `bitacora` VALUES ('405', 'grupos', '1', 'D', '2015-02-13 00:00:00', null, '111|20151|20091|1|1');
INSERT INTO `bitacora` VALUES ('406', 'grupos', '1', 'D', '2015-02-13 00:00:00', null, '112|20151|20091|1|1');
INSERT INTO `bitacora` VALUES ('407', 'grupos', '1', 'D', '2015-02-13 00:00:00', null, '114|20142|20091|1|2');
INSERT INTO `bitacora` VALUES ('408', 'grupos', '1', 'D', '2015-02-13 00:00:00', null, '111|20142|20091|1|1');
INSERT INTO `bitacora` VALUES ('409', 'grupos', '1', 'D', '2015-02-13 00:00:00', null, '113|20142|20091|1|1');
INSERT INTO `bitacora` VALUES ('410', 'grupos', '1', 'D', '2015-02-13 00:00:00', null, '112|20142|20091|1|1');
INSERT INTO `bitacora` VALUES ('411', 'periodos', '1', 'D', '2015-02-13 00:00:00', null, '20151|1|2015|1|Uno más|0000-00-00|0000-00-00|1');
INSERT INTO `bitacora` VALUES ('412', 'periodos', '2', 'D', '2015-02-13 00:00:00', null, '20142|1|2014|2|Vamos a ver|2015-01-21|2015-07-25|1');
INSERT INTO `bitacora` VALUES ('413', 'periodos', '1', 'I', '2015-02-13 00:00:00', '20142|1|2014|2|Vamos a ver|2015-02-13|2015-06-30|1', null);
INSERT INTO `bitacora` VALUES ('414', 'grupos', '1', 'I', '2015-02-13 00:00:00', '111|20142|20091|1|1', null);
INSERT INTO `bitacora` VALUES ('415', 'grupos', '1', 'I', '2015-02-13 00:00:00', '112|20142|20091|1|1', null);
INSERT INTO `bitacora` VALUES ('416', 'grupos', '1', 'I', '2015-02-13 00:00:00', '113|20142|20091|1|1', null);
INSERT INTO `bitacora` VALUES ('417', 'grupos', '1', 'I', '2015-02-13 00:00:00', '114|20142|20091|1|2', null);
INSERT INTO `bitacora` VALUES ('418', 'carga', '1', 'I', '2015-02-13 00:00:00', '111|20142|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('419', 'carga', '1', 'I', '2015-02-13 00:00:00', '112|20142|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('420', 'carga', '1', 'I', '2015-02-13 00:00:00', '112|20142|1|11240|1', null);
INSERT INTO `bitacora` VALUES ('421', 'carga', '1', 'I', '2015-02-13 00:00:00', '113|20142|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('422', 'carga', '1', 'I', '2015-02-13 00:00:00', '114|20142|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('423', 'carga', '1', 'D', '2015-02-13 00:00:00', null, '114|20142|1|11236|1');
INSERT INTO `bitacora` VALUES ('424', 'carga', '1', 'D', '2015-02-13 00:00:00', null, '113|20142|1|11236|1');
INSERT INTO `bitacora` VALUES ('425', 'carga', '1', 'D', '2015-02-13 00:00:00', null, '112|20142|1|11236|1');
INSERT INTO `bitacora` VALUES ('426', 'carga', '1', 'D', '2015-02-13 00:00:00', null, '112|20142|1|11240|1');
INSERT INTO `bitacora` VALUES ('427', 'carga', '1', 'D', '2015-02-13 00:00:00', null, '111|20142|1|11236|1');
INSERT INTO `bitacora` VALUES ('428', 'grupos', '1', 'D', '2015-02-13 00:00:00', null, '114|20142|20091|1|2');
INSERT INTO `bitacora` VALUES ('429', 'grupos', '1', 'D', '2015-02-13 00:00:00', null, '113|20142|20091|1|1');
INSERT INTO `bitacora` VALUES ('430', 'grupos', '1', 'D', '2015-02-13 00:00:00', null, '112|20142|20091|1|1');
INSERT INTO `bitacora` VALUES ('431', 'grupos', '1', 'D', '2015-02-13 00:00:00', null, '111|20142|20091|1|1');
INSERT INTO `bitacora` VALUES ('432', 'periodos', '1', 'D', '2015-02-13 00:00:00', null, '20142|1|2014|2|Vamos a ver|2015-02-13|2015-06-30|1');
INSERT INTO `bitacora` VALUES ('433', 'periodos', '1', 'I', '2015-02-13 00:00:00', '20142|1|2014|2|vamos|2015-02-13|2015-02-28|1', null);
INSERT INTO `bitacora` VALUES ('434', 'grupos', '1', 'I', '2015-02-13 00:00:00', '111|20142|20091|1|1', null);
INSERT INTO `bitacora` VALUES ('435', 'grupos', '1', 'I', '2015-02-13 00:00:00', '112|20142|20091|1|1', null);
INSERT INTO `bitacora` VALUES ('436', 'grupos', '1', 'I', '2015-02-13 00:00:00', '113|20142|20091|1|1', null);
INSERT INTO `bitacora` VALUES ('437', 'grupos', '1', 'I', '2015-02-13 00:00:00', '114|20142|20091|1|2', null);
INSERT INTO `bitacora` VALUES ('438', 'carga', '1', 'I', '2015-02-13 00:00:00', '111|20142|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('439', 'carga', '1', 'I', '2015-02-13 00:00:00', '112|20142|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('440', 'carga', '1', 'I', '2015-02-13 00:00:00', '112|20142|1|11240|1', null);
INSERT INTO `bitacora` VALUES ('441', 'carga', '1', 'I', '2015-02-13 00:00:00', '113|20142|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('442', 'carga', '1', 'I', '2015-02-13 00:00:00', '114|20142|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('443', 'periodos', '1', 'I', '2015-02-13 00:00:00', '20151|1|2015|1|ahhhhh|2015-02-13|2015-02-28|1', null);
INSERT INTO `bitacora` VALUES ('444', 'grupos', '1', 'I', '2015-02-13 00:00:00', '111|20151|20091|1|1', null);
INSERT INTO `bitacora` VALUES ('445', 'grupos', '1', 'I', '2015-02-13 00:00:00', '112|20151|20091|1|1', null);
INSERT INTO `bitacora` VALUES ('446', 'grupos', '1', 'I', '2015-02-13 00:00:00', '113|20151|20091|1|1', null);
INSERT INTO `bitacora` VALUES ('447', 'grupos', '1', 'I', '2015-02-13 00:00:00', '114|20151|20091|1|2', null);
INSERT INTO `bitacora` VALUES ('448', 'carga', '1', 'I', '2015-02-13 00:00:00', '111|20151|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('449', 'carga', '1', 'I', '2015-02-13 00:00:00', '112|20151|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('450', 'carga', '1', 'I', '2015-02-13 00:00:00', '112|20151|1|11240|1', null);
INSERT INTO `bitacora` VALUES ('451', 'carga', '1', 'I', '2015-02-13 00:00:00', '113|20151|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('452', 'carga', '1', 'I', '2015-02-13 00:00:00', '114|20151|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('453', 'carga', '1', 'D', '2015-02-13 00:00:00', null, '114|20151|1|11236|1');
INSERT INTO `bitacora` VALUES ('454', 'carga', '1', 'D', '2015-02-13 00:00:00', null, '113|20151|1|11236|1');
INSERT INTO `bitacora` VALUES ('455', 'carga', '1', 'D', '2015-02-13 00:00:00', null, '112|20151|1|11236|1');
INSERT INTO `bitacora` VALUES ('456', 'carga', '1', 'D', '2015-02-13 00:00:00', null, '112|20151|1|11240|1');
INSERT INTO `bitacora` VALUES ('457', 'carga', '1', 'D', '2015-02-13 00:00:00', null, '111|20151|1|11236|1');
INSERT INTO `bitacora` VALUES ('458', 'carga', '1', 'D', '2015-02-13 00:00:00', null, '114|20142|1|11236|1');
INSERT INTO `bitacora` VALUES ('459', 'carga', '1', 'D', '2015-02-13 00:00:00', null, '113|20142|1|11236|1');
INSERT INTO `bitacora` VALUES ('460', 'carga', '1', 'D', '2015-02-13 00:00:00', null, '112|20142|1|11236|1');
INSERT INTO `bitacora` VALUES ('461', 'carga', '1', 'D', '2015-02-13 00:00:00', null, '112|20142|1|11240|1');
INSERT INTO `bitacora` VALUES ('462', 'carga', '1', 'D', '2015-02-13 00:00:00', null, '111|20142|1|11236|1');
INSERT INTO `bitacora` VALUES ('463', 'grupos', '1', 'D', '2015-02-13 00:00:00', null, '114|20151|20091|1|2');
INSERT INTO `bitacora` VALUES ('464', 'grupos', '1', 'D', '2015-02-13 00:00:00', null, '113|20151|20091|1|1');
INSERT INTO `bitacora` VALUES ('465', 'grupos', '1', 'D', '2015-02-13 00:00:00', null, '111|20151|20091|1|1');
INSERT INTO `bitacora` VALUES ('466', 'grupos', '1', 'D', '2015-02-13 00:00:00', null, '112|20151|20091|1|1');
INSERT INTO `bitacora` VALUES ('467', 'grupos', '1', 'D', '2015-02-13 00:00:00', null, '114|20142|20091|1|2');
INSERT INTO `bitacora` VALUES ('468', 'grupos', '1', 'D', '2015-02-13 00:00:00', null, '111|20142|20091|1|1');
INSERT INTO `bitacora` VALUES ('469', 'grupos', '1', 'D', '2015-02-13 00:00:00', null, '113|20142|20091|1|1');
INSERT INTO `bitacora` VALUES ('470', 'grupos', '1', 'D', '2015-02-13 00:00:00', null, '112|20142|20091|1|1');
INSERT INTO `bitacora` VALUES ('471', 'periodos', '1', 'D', '2015-02-13 00:00:00', null, '20151|1|2015|1|ahhhhh|2015-02-13|2015-02-28|1');
INSERT INTO `bitacora` VALUES ('472', 'periodos', '1', 'D', '2015-02-13 00:00:00', null, '20142|1|2014|2|vamos|2015-02-13|2015-02-28|1');
INSERT INTO `bitacora` VALUES ('473', 'periodos', '1', 'I', '2015-02-13 00:00:00', '20142|1|2014|2|vamos|2015-02-13|2015-02-28|1', null);
INSERT INTO `bitacora` VALUES ('474', 'grupos', '1', 'I', '2015-02-13 00:00:00', '111|20142|20091|1|1', null);
INSERT INTO `bitacora` VALUES ('475', 'grupos', '1', 'I', '2015-02-13 00:00:00', '112|20142|20091|1|1', null);
INSERT INTO `bitacora` VALUES ('476', 'grupos', '1', 'I', '2015-02-13 00:00:00', '113|20142|20091|1|1', null);
INSERT INTO `bitacora` VALUES ('477', 'grupos', '1', 'I', '2015-02-13 00:00:00', '114|20142|20091|1|2', null);
INSERT INTO `bitacora` VALUES ('478', 'carga', '1', 'I', '2015-02-13 00:00:00', '111|20142|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('479', 'carga', '1', 'I', '2015-02-13 00:00:00', '112|20142|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('480', 'carga', '1', 'I', '2015-02-13 00:00:00', '112|20142|1|11240|1', null);
INSERT INTO `bitacora` VALUES ('481', 'carga', '1', 'I', '2015-02-13 00:00:00', '113|20142|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('482', 'carga', '1', 'I', '2015-02-13 00:00:00', '114|20142|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('483', 'periodos', '1', 'I', '2015-02-13 00:00:00', '20151|1|2015|1|vamos|2015-02-06|2015-02-28|1', null);
INSERT INTO `bitacora` VALUES ('484', 'grupos', '1', 'I', '2015-02-13 00:00:00', '111|20151|20091|1|1', null);
INSERT INTO `bitacora` VALUES ('485', 'grupos', '1', 'I', '2015-02-13 00:00:00', '112|20151|20091|1|1', null);
INSERT INTO `bitacora` VALUES ('486', 'grupos', '1', 'I', '2015-02-13 00:00:00', '113|20151|20091|1|1', null);
INSERT INTO `bitacora` VALUES ('487', 'grupos', '1', 'I', '2015-02-13 00:00:00', '114|20151|20091|1|2', null);
INSERT INTO `bitacora` VALUES ('488', 'carga', '1', 'I', '2015-02-13 00:00:00', '111|20151|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('489', 'carga', '1', 'I', '2015-02-13 00:00:00', '112|20151|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('490', 'carga', '1', 'I', '2015-02-13 00:00:00', '112|20151|1|11240|1', null);
INSERT INTO `bitacora` VALUES ('491', 'carga', '1', 'I', '2015-02-13 00:00:00', '113|20151|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('492', 'carga', '1', 'I', '2015-02-13 00:00:00', '114|20151|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('493', 'periodos', '1', 'I', '2015-02-13 00:00:00', '20152|1|2015|2|vamos a ver|2015-02-06|2015-02-28|1', null);
INSERT INTO `bitacora` VALUES ('494', 'grupos', '1', 'I', '2015-02-13 00:00:00', '111|20152|20091|1|1', null);
INSERT INTO `bitacora` VALUES ('495', 'grupos', '1', 'I', '2015-02-13 00:00:00', '112|20152|20091|1|1', null);
INSERT INTO `bitacora` VALUES ('496', 'grupos', '1', 'I', '2015-02-13 00:00:00', '113|20152|20091|1|1', null);
INSERT INTO `bitacora` VALUES ('497', 'grupos', '1', 'I', '2015-02-13 00:00:00', '114|20152|20091|1|2', null);
INSERT INTO `bitacora` VALUES ('498', 'carga', '1', 'I', '2015-02-13 00:00:00', '111|20152|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('499', 'carga', '1', 'I', '2015-02-13 00:00:00', '112|20152|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('500', 'carga', '1', 'I', '2015-02-13 00:00:00', '112|20152|1|11240|1', null);
INSERT INTO `bitacora` VALUES ('501', 'carga', '1', 'I', '2015-02-13 00:00:00', '113|20152|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('502', 'carga', '1', 'I', '2015-02-13 00:00:00', '114|20152|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('503', 'periodos', '1', 'I', '2015-02-13 00:00:00', '20153|1|2015|3|vamos|2015-02-13|2015-02-28|1', null);
INSERT INTO `bitacora` VALUES ('504', 'grupos', '1', 'I', '2015-02-13 00:00:00', '111|20153|20091|1|1', null);
INSERT INTO `bitacora` VALUES ('505', 'grupos', '1', 'I', '2015-02-13 00:00:00', '112|20153|20091|1|1', null);
INSERT INTO `bitacora` VALUES ('506', 'grupos', '1', 'I', '2015-02-13 00:00:00', '113|20153|20091|1|1', null);
INSERT INTO `bitacora` VALUES ('507', 'grupos', '1', 'I', '2015-02-13 00:00:00', '114|20153|20091|1|2', null);
INSERT INTO `bitacora` VALUES ('508', 'carga', '1', 'I', '2015-02-13 00:00:00', '111|20153|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('509', 'carga', '1', 'I', '2015-02-13 00:00:00', '112|20153|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('510', 'carga', '1', 'I', '2015-02-13 00:00:00', '112|20153|1|11240|1', null);
INSERT INTO `bitacora` VALUES ('511', 'carga', '1', 'I', '2015-02-13 00:00:00', '113|20153|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('512', 'carga', '1', 'I', '2015-02-13 00:00:00', '114|20153|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('513', 'carga', '1', 'D', '2015-02-13 00:00:00', null, '114|20153|1|11236|1');
INSERT INTO `bitacora` VALUES ('514', 'carga', '1', 'D', '2015-02-13 00:00:00', null, '113|20153|1|11236|1');
INSERT INTO `bitacora` VALUES ('515', 'carga', '1', 'D', '2015-02-13 00:00:00', null, '112|20153|1|11236|1');
INSERT INTO `bitacora` VALUES ('516', 'carga', '1', 'D', '2015-02-13 00:00:00', null, '112|20153|1|11240|1');
INSERT INTO `bitacora` VALUES ('517', 'carga', '1', 'D', '2015-02-13 00:00:00', null, '111|20153|1|11236|1');
INSERT INTO `bitacora` VALUES ('518', 'carga', '1', 'D', '2015-02-13 00:00:00', null, '114|20152|1|11236|1');
INSERT INTO `bitacora` VALUES ('519', 'carga', '1', 'D', '2015-02-13 00:00:00', null, '113|20152|1|11236|1');
INSERT INTO `bitacora` VALUES ('520', 'carga', '1', 'D', '2015-02-13 00:00:00', null, '112|20152|1|11236|1');
INSERT INTO `bitacora` VALUES ('521', 'carga', '1', 'D', '2015-02-13 00:00:00', null, '112|20152|1|11240|1');
INSERT INTO `bitacora` VALUES ('522', 'carga', '1', 'D', '2015-02-13 00:00:00', null, '111|20152|1|11236|1');
INSERT INTO `bitacora` VALUES ('523', 'carga', '1', 'D', '2015-02-13 00:00:00', null, '114|20151|1|11236|1');
INSERT INTO `bitacora` VALUES ('524', 'carga', '1', 'D', '2015-02-13 00:00:00', null, '113|20151|1|11236|1');
INSERT INTO `bitacora` VALUES ('525', 'carga', '1', 'D', '2015-02-13 00:00:00', null, '112|20151|1|11236|1');
INSERT INTO `bitacora` VALUES ('526', 'carga', '1', 'D', '2015-02-13 00:00:00', null, '112|20151|1|11240|1');
INSERT INTO `bitacora` VALUES ('527', 'carga', '1', 'D', '2015-02-13 00:00:00', null, '111|20151|1|11236|1');
INSERT INTO `bitacora` VALUES ('528', 'carga', '1', 'D', '2015-02-13 00:00:00', null, '114|20142|1|11236|1');
INSERT INTO `bitacora` VALUES ('529', 'carga', '1', 'D', '2015-02-13 00:00:00', null, '113|20142|1|11236|1');
INSERT INTO `bitacora` VALUES ('530', 'carga', '1', 'D', '2015-02-13 00:00:00', null, '112|20142|1|11236|1');
INSERT INTO `bitacora` VALUES ('531', 'carga', '1', 'D', '2015-02-13 00:00:00', null, '112|20142|1|11240|1');
INSERT INTO `bitacora` VALUES ('532', 'carga', '1', 'D', '2015-02-13 00:00:00', null, '111|20142|1|11236|1');
INSERT INTO `bitacora` VALUES ('533', 'grupos', '1', 'D', '2015-02-13 00:00:00', null, '114|20153|20091|1|2');
INSERT INTO `bitacora` VALUES ('534', 'grupos', '1', 'D', '2015-02-13 00:00:00', null, '112|20153|20091|1|1');
INSERT INTO `bitacora` VALUES ('535', 'grupos', '1', 'D', '2015-02-13 00:00:00', null, '111|20153|20091|1|1');
INSERT INTO `bitacora` VALUES ('536', 'grupos', '1', 'D', '2015-02-13 00:00:00', null, '113|20153|20091|1|1');
INSERT INTO `bitacora` VALUES ('537', 'grupos', '1', 'D', '2015-02-13 00:00:00', null, '111|20152|20091|1|1');
INSERT INTO `bitacora` VALUES ('538', 'grupos', '1', 'D', '2015-02-13 00:00:00', null, '113|20152|20091|1|1');
INSERT INTO `bitacora` VALUES ('539', 'grupos', '1', 'D', '2015-02-13 00:00:00', null, '112|20152|20091|1|1');
INSERT INTO `bitacora` VALUES ('540', 'grupos', '1', 'D', '2015-02-13 00:00:00', null, '114|20152|20091|1|2');
INSERT INTO `bitacora` VALUES ('541', 'grupos', '1', 'D', '2015-02-13 00:00:00', null, '113|20151|20091|1|1');
INSERT INTO `bitacora` VALUES ('542', 'grupos', '1', 'D', '2015-02-13 00:00:00', null, '112|20151|20091|1|1');
INSERT INTO `bitacora` VALUES ('543', 'grupos', '1', 'D', '2015-02-13 00:00:00', null, '111|20151|20091|1|1');
INSERT INTO `bitacora` VALUES ('544', 'grupos', '1', 'D', '2015-02-13 00:00:00', null, '114|20151|20091|1|2');
INSERT INTO `bitacora` VALUES ('545', 'grupos', '1', 'D', '2015-02-13 00:00:00', null, '113|20142|20091|1|1');
INSERT INTO `bitacora` VALUES ('546', 'grupos', '1', 'D', '2015-02-13 00:00:00', null, '112|20142|20091|1|1');
INSERT INTO `bitacora` VALUES ('547', 'grupos', '1', 'D', '2015-02-13 00:00:00', null, '114|20142|20091|1|2');
INSERT INTO `bitacora` VALUES ('548', 'grupos', '1', 'D', '2015-02-13 00:00:00', null, '111|20142|20091|1|1');
INSERT INTO `bitacora` VALUES ('549', 'periodos', '1', 'D', '2015-02-13 00:00:00', null, '20153|1|2015|3|vamos|2015-02-13|2015-02-28|1');
INSERT INTO `bitacora` VALUES ('550', 'periodos', '1', 'D', '2015-02-13 00:00:00', null, '20152|1|2015|2|vamos a ver|2015-02-06|2015-02-28|1');
INSERT INTO `bitacora` VALUES ('551', 'periodos', '1', 'D', '2015-02-13 00:00:00', null, '20151|1|2015|1|vamos|2015-02-06|2015-02-28|1');
INSERT INTO `bitacora` VALUES ('552', 'periodos', '1', 'D', '2015-02-13 00:00:00', null, '20142|1|2014|2|vamos|2015-02-13|2015-02-28|1');
INSERT INTO `bitacora` VALUES ('553', 'periodos', '1', 'I', '2015-02-13 00:00:00', '20142|1|2014|2|vamos a ver|2015-02-06|2015-02-28|1', null);
INSERT INTO `bitacora` VALUES ('554', 'grupos', '1', 'I', '2015-02-13 00:00:00', '111|20142|20091|1|1', null);
INSERT INTO `bitacora` VALUES ('555', 'grupos', '1', 'I', '2015-02-13 00:00:00', '112|20142|20091|1|1', null);
INSERT INTO `bitacora` VALUES ('556', 'grupos', '1', 'I', '2015-02-13 00:00:00', '113|20142|20091|1|1', null);
INSERT INTO `bitacora` VALUES ('557', 'grupos', '1', 'I', '2015-02-13 00:00:00', '114|20142|20091|1|2', null);
INSERT INTO `bitacora` VALUES ('558', 'carga', '1', 'I', '2015-02-13 00:00:00', '111|20142|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('559', 'carga', '1', 'I', '2015-02-13 00:00:00', '112|20142|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('560', 'carga', '1', 'I', '2015-02-13 00:00:00', '112|20142|1|11240|1', null);
INSERT INTO `bitacora` VALUES ('561', 'carga', '1', 'I', '2015-02-13 00:00:00', '113|20142|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('562', 'carga', '1', 'I', '2015-02-13 00:00:00', '114|20142|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('563', 'periodos', '1', 'I', '2015-02-13 00:00:00', '20143|1|2014|3|vamos a ver|2015-02-06|2015-02-28|1', null);
INSERT INTO `bitacora` VALUES ('564', 'grupos', '1', 'I', '2015-02-13 00:00:00', '111|20143|20091|1|1', null);
INSERT INTO `bitacora` VALUES ('565', 'grupos', '1', 'I', '2015-02-13 00:00:00', '112|20143|20091|1|1', null);
INSERT INTO `bitacora` VALUES ('566', 'grupos', '1', 'I', '2015-02-13 00:00:00', '113|20143|20091|1|1', null);
INSERT INTO `bitacora` VALUES ('567', 'grupos', '1', 'I', '2015-02-13 00:00:00', '114|20143|20091|1|2', null);
INSERT INTO `bitacora` VALUES ('568', 'carga', '1', 'I', '2015-02-13 00:00:00', '111|20143|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('569', 'carga', '1', 'I', '2015-02-13 00:00:00', '112|20143|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('570', 'carga', '1', 'I', '2015-02-13 00:00:00', '112|20143|1|11240|1', null);
INSERT INTO `bitacora` VALUES ('571', 'carga', '1', 'I', '2015-02-13 00:00:00', '113|20143|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('572', 'carga', '1', 'I', '2015-02-13 00:00:00', '114|20143|1|11236|1', null);
INSERT INTO `bitacora` VALUES ('573', 'carga', '1', 'D', '2015-02-13 00:00:00', null, '114|20143|1|11236|1');
INSERT INTO `bitacora` VALUES ('574', 'carga', '1', 'D', '2015-02-13 00:00:00', null, '113|20143|1|11236|1');
INSERT INTO `bitacora` VALUES ('575', 'carga', '1', 'D', '2015-02-13 00:00:00', null, '112|20143|1|11236|1');
INSERT INTO `bitacora` VALUES ('576', 'carga', '1', 'D', '2015-02-13 00:00:00', null, '112|20143|1|11240|1');
INSERT INTO `bitacora` VALUES ('577', 'carga', '1', 'D', '2015-02-13 00:00:00', null, '111|20143|1|11236|1');
INSERT INTO `bitacora` VALUES ('578', 'carga', '1', 'D', '2015-02-13 00:00:00', null, '114|20142|1|11236|1');
INSERT INTO `bitacora` VALUES ('579', 'carga', '1', 'D', '2015-02-13 00:00:00', null, '113|20142|1|11236|1');
INSERT INTO `bitacora` VALUES ('580', 'carga', '1', 'D', '2015-02-13 00:00:00', null, '112|20142|1|11236|1');
INSERT INTO `bitacora` VALUES ('581', 'carga', '1', 'D', '2015-02-13 00:00:00', null, '112|20142|1|11240|1');
INSERT INTO `bitacora` VALUES ('582', 'carga', '1', 'D', '2015-02-13 00:00:00', null, '111|20142|1|11236|1');
INSERT INTO `bitacora` VALUES ('583', 'grupos', '1', 'D', '2015-02-13 00:00:00', null, '114|20143|20091|1|2');
INSERT INTO `bitacora` VALUES ('584', 'grupos', '1', 'D', '2015-02-13 00:00:00', null, '113|20143|20091|1|1');
INSERT INTO `bitacora` VALUES ('585', 'grupos', '1', 'D', '2015-02-13 00:00:00', null, '111|20143|20091|1|1');
INSERT INTO `bitacora` VALUES ('586', 'grupos', '1', 'D', '2015-02-13 00:00:00', null, '112|20143|20091|1|1');
INSERT INTO `bitacora` VALUES ('587', 'grupos', '1', 'D', '2015-02-13 00:00:00', null, '114|20142|20091|1|2');
INSERT INTO `bitacora` VALUES ('588', 'grupos', '1', 'D', '2015-02-13 00:00:00', null, '111|20142|20091|1|1');
INSERT INTO `bitacora` VALUES ('589', 'grupos', '1', 'D', '2015-02-13 00:00:00', null, '113|20142|20091|1|1');
INSERT INTO `bitacora` VALUES ('590', 'grupos', '1', 'D', '2015-02-13 00:00:00', null, '112|20142|20091|1|1');
INSERT INTO `bitacora` VALUES ('591', 'periodos', '1', 'D', '2015-02-13 00:00:00', null, '20143|1|2014|3|vamos a ver|2015-02-06|2015-02-28|1');
INSERT INTO `bitacora` VALUES ('592', 'periodos', '1', 'D', '2015-02-13 00:00:00', null, '20142|1|2014|2|vamos a ver|2015-02-06|2015-02-28|1');
INSERT INTO `bitacora` VALUES ('593', 'uaprendizaje', '1', 'I', '2015-02-13 00:00:00', '11241|MATEMATICAS III|5|5|0|0|0|0|15|2015-02-14|vamos a ver|1|20091', null);
INSERT INTO `bitacora` VALUES ('594', 'p_ua', '1', 'I', '2015-02-13 00:00:00', '1|11241|1|1|4', null);
INSERT INTO `bitacora` VALUES ('595', 'detalleseriacion', '1', 'I', '2015-02-13 00:00:00', '11241|1|11237|1', null);
INSERT INTO `bitacora` VALUES ('596', 'p_ua', '1', 'I', '2015-02-13 00:00:00', '2|11241|1|1|4', null);
INSERT INTO `bitacora` VALUES ('597', 'detalleseriacion', '1', 'I', '2015-02-13 00:00:00', '11241|2|11237|1', null);
INSERT INTO `bitacora` VALUES ('598', 'p_ua', '1', 'I', '2015-02-13 00:00:00', '3|11241|1|1|4', null);
INSERT INTO `bitacora` VALUES ('599', 'detalleseriacion', '1', 'I', '2015-02-13 00:00:00', '11241|3|11237|1', null);
INSERT INTO `bitacora` VALUES ('600', 'p_ua', '1', 'I', '2015-02-13 00:00:00', '4|11241|1|1|4', null);
INSERT INTO `bitacora` VALUES ('601', 'detalleseriacion', '1', 'I', '2015-02-13 00:00:00', '11241|4|11237|1', null);
INSERT INTO `bitacora` VALUES ('602', 'p_ua', '1', 'I', '2015-02-13 00:00:00', '5|11241|1|1|4', null);
INSERT INTO `bitacora` VALUES ('603', 'detalleseriacion', '1', 'I', '2015-02-13 00:00:00', '11241|5|11237|1', null);
INSERT INTO `bitacora` VALUES ('604', 'p_ua', '1', 'I', '2015-02-13 00:00:00', '6|11241|1|1|4', null);
INSERT INTO `bitacora` VALUES ('605', 'detalleseriacion', '1', 'I', '2015-02-13 00:00:00', '11241|6|11237|1', null);
INSERT INTO `bitacora` VALUES ('606', 'p_ua', '1', 'I', '2015-02-13 00:00:00', '7|11241|1|1|4', null);
INSERT INTO `bitacora` VALUES ('607', 'detalleseriacion', '1', 'I', '2015-02-13 00:00:00', '11241|7|11237|1', null);

-- ----------------------------
-- Table structure for campus
-- ----------------------------
DROP TABLE IF EXISTS `campus`;
CREATE TABLE `campus` (
  `campus` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo campus (1,2,3,4)',
  `descripcion` varchar(100) NOT NULL COMMENT 'Descripcion CAMPUS ()',
  `direccion` varchar(100) DEFAULT NULL COMMENT 'Direccion CAMPUS',
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
  CONSTRAINT `fk_carga_pua1` FOREIGN KEY (`programaedu`, `uaprendizaje`) REFERENCES `p_ua` (`programaedu`, `uaprendizaje`),
  CONSTRAINT `fk_carga_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of carga
-- ----------------------------
INSERT INTO `carga` VALUES ('111', '20141', '1', '11236', '1', '1');
INSERT INTO `carga` VALUES ('112', '20141', '1', '11236', '1', '1');
INSERT INTO `carga` VALUES ('112', '20141', '1', '11240', '1', '1');
INSERT INTO `carga` VALUES ('113', '20141', '1', '11236', '1', '1');
INSERT INTO `carga` VALUES ('114', '20141', '1', '11236', '1', '1');

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
INSERT INTO `carreras_emp` VALUES ('3', 'LICENCIADO EN NEGOCIOS INTERNACIONALES', '1');
INSERT INTO `carreras_emp` VALUES ('4', 'LICENCIADO EN ADMINISTRACION DE EMPRESAS', '1');
INSERT INTO `carreras_emp` VALUES ('5', 'INGENIERO EN SISTEMAS', '1');
INSERT INTO `carreras_emp` VALUES ('6', 'MAESTRIA EN TECNOLOGIAS DE LA INFORMACION Y LA COMUNICACION', '1');

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
INSERT INTO `coordinaciona` VALUES ('1', 'CONTABILIDAD BASICA', '6', '1');
INSERT INTO `coordinaciona` VALUES ('2', 'CONTABILIDAD AVANZADA', '6', '1');
INSERT INTO `coordinaciona` VALUES ('3', 'CONTABILIDAD DE COSTOS', '6', '1');
INSERT INTO `coordinaciona` VALUES ('4', 'FINANZAS', '6', '1');
INSERT INTO `coordinaciona` VALUES ('5', 'AUDITORIA', '6', '1');
INSERT INTO `coordinaciona` VALUES ('6', 'IMPUESTOS', '6', '1');
INSERT INTO `coordinaciona` VALUES ('7', 'MERCADOTECNIA', '6', '1');
INSERT INTO `coordinaciona` VALUES ('8', 'RECURSOS HUMANOS', '6', '1');
INSERT INTO `coordinaciona` VALUES ('9', 'PRODUCCION', '6', '1');
INSERT INTO `coordinaciona` VALUES ('10', 'ADMINISTRACION BASICA', '6', '1');
INSERT INTO `coordinaciona` VALUES ('11', 'ADMINISTRACION AVANZADA', '6', '1');
INSERT INTO `coordinaciona` VALUES ('12', 'INFORMATICA', '6', '1');
INSERT INTO `coordinaciona` VALUES ('13', 'MATEMATICAS', '6', '1');
INSERT INTO `coordinaciona` VALUES ('14', 'CIENCIAS COMPUTACIONALES', '6', '1');
INSERT INTO `coordinaciona` VALUES ('15', 'SISTEMAS DE INFORMACION', '6', '1');
INSERT INTO `coordinaciona` VALUES ('16', 'PROGRAMACION', '6', '1');
INSERT INTO `coordinaciona` VALUES ('17', 'ECONOMIA', '6', '1');
INSERT INTO `coordinaciona` VALUES ('18', 'COMERCIO EXTERIOR', '6', '1');
INSERT INTO `coordinaciona` VALUES ('19', 'DERECHO', '6', '1');
INSERT INTO `coordinaciona` VALUES ('20', 'EMPRENDEDORES', '6', '1');
INSERT INTO `coordinaciona` VALUES ('21', 'ASIGNATURAS DE APOYO', '6', '1');
INSERT INTO `coordinaciona` VALUES ('22', 'SIN COORDINACION', '6', '1');

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
INSERT INTO `detalleseriacion` VALUES ('1', '11237', '1', '11236', '1');
INSERT INTO `detalleseriacion` VALUES ('1', '11241', '1', '11237', '1');
INSERT INTO `detalleseriacion` VALUES ('2', '11241', '1', '11237', '1');
INSERT INTO `detalleseriacion` VALUES ('3', '11237', '1', '11236', '1');
INSERT INTO `detalleseriacion` VALUES ('3', '11241', '1', '11237', '1');
INSERT INTO `detalleseriacion` VALUES ('4', '11241', '1', '11237', '1');
INSERT INTO `detalleseriacion` VALUES ('5', '11241', '1', '11237', '1');
INSERT INTO `detalleseriacion` VALUES ('6', '11241', '1', '11237', '1');
INSERT INTO `detalleseriacion` VALUES ('7', '11241', '1', '11237', '1');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
INSERT INTO `grupos` VALUES ('111', '20141', '20091', '1', '1', '1');
INSERT INTO `grupos` VALUES ('112', '20141', '20091', '1', '1', '1');
INSERT INTO `grupos` VALUES ('113', '20141', '20091', '1', '1', '1');
INSERT INTO `grupos` VALUES ('114', '20141', '20091', '1', '2', '1');

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
INSERT INTO `levels` VALUES ('1', 'Administrador general', '1');
INSERT INTO `levels` VALUES ('2', 'Administrador auxiliar', '1');
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
INSERT INTO `periodos` VALUES ('20141', '1', '2014', '1', 'Un período registrado', '2015-01-21', '2015-10-31', '1', '2');

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
INSERT INTO `planestudio` VALUES ('20091', 'Plan 2009-1', '200', '2015-01-29', '2017-12-31', '1', '1');

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
INSERT INTO `plan_programa` VALUES ('20091', '1', '1');
INSERT INTO `plan_programa` VALUES ('20091', '2', '1');
INSERT INTO `plan_programa` VALUES ('20091', '3', '1');
INSERT INTO `plan_programa` VALUES ('20091', '4', '1');
INSERT INTO `plan_programa` VALUES ('20091', '5', '1');
INSERT INTO `plan_programa` VALUES ('20091', '6', '1');
INSERT INTO `plan_programa` VALUES ('20091', '7', '1');

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
INSERT INTO `programaedu` VALUES ('1', 'ARTES', 'LA', '1', '1', null, '1', '1', '1');
INSERT INTO `programaedu` VALUES ('2', 'ADMON. DE EMPRESAS', 'LAE', '1', '1', null, '1', '1', '1');
INSERT INTO `programaedu` VALUES ('3', 'INFORMÁTICA', 'LI', '1', '1', null, '1', '1', '1');
INSERT INTO `programaedu` VALUES ('4', 'NEGOCIOS INTERNACIONALES', 'LNI', '1', '1', null, '1', '1', '1');
INSERT INTO `programaedu` VALUES ('5', 'CONTADURIA', 'LC', '1', '1', null, '1', '1', '1');
INSERT INTO `programaedu` VALUES ('6', 'TRONCO COMÚN', 'TC', '1', '1', null, '1', '1', '1');
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
INSERT INTO `p_ua` VALUES ('1', '11236', '1', '1', '1', '1');
INSERT INTO `p_ua` VALUES ('1', '11237', '1', '1', '1', '1');
INSERT INTO `p_ua` VALUES ('1', '11240', '1', '2', '1', '1');
INSERT INTO `p_ua` VALUES ('1', '11241', '1', '1', '4', '1');
INSERT INTO `p_ua` VALUES ('2', '11241', '1', '1', '4', '1');
INSERT INTO `p_ua` VALUES ('3', '11236', '1', '1', '1', '1');
INSERT INTO `p_ua` VALUES ('3', '11237', '1', '1', '1', '1');
INSERT INTO `p_ua` VALUES ('3', '11241', '1', '1', '4', '1');
INSERT INTO `p_ua` VALUES ('4', '11241', '1', '1', '4', '1');
INSERT INTO `p_ua` VALUES ('5', '11241', '1', '1', '4', '1');
INSERT INTO `p_ua` VALUES ('6', '11238', '1', '1', '1', '1');
INSERT INTO `p_ua` VALUES ('6', '11239', '1', '1', '1', '1');
INSERT INTO `p_ua` VALUES ('6', '11241', '1', '1', '4', '1');
INSERT INTO `p_ua` VALUES ('7', '11241', '1', '1', '4', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='<double-click to overwrite multiple objects>';

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
INSERT INTO `status` VALUES ('1', 'CAPTURADO', '1');
INSERT INTO `status` VALUES ('2', 'COMPLETADO', '1');
INSERT INTO `status` VALUES ('3', 'EN PROCESO', '1');

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
INSERT INTO `turnos` VALUES ('1', 'MATUTINO', '1');
INSERT INTO `turnos` VALUES ('2', 'VESPERTINO', '1');
INSERT INTO `turnos` VALUES ('3', 'INTERTURNO', '1');

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
  KEY `fk_uaprendizaje_users1_idx` (`users_id`),
  CONSTRAINT `fk_uaprendizaje_coordinaciona1` FOREIGN KEY (`coordinaciona`) REFERENCES `coordinaciona` (`coordinaciona`),
  CONSTRAINT `fk_uaprendizaje_planprograma1` FOREIGN KEY (`plan`) REFERENCES `plan_programa` (`plan`),
  CONSTRAINT `fk_uaprendizaje_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='<double-click to overwrite multiple objects>';

-- ----------------------------
-- Records of uaprendizaje
-- ----------------------------
INSERT INTO `uaprendizaje` VALUES ('11236', 'MATEMÁTICAS I', '5', '5', '0', '0', '0', '0', '15', '2015-01-29', 'vamos a ver', '1', '20091', '1');
INSERT INTO `uaprendizaje` VALUES ('11237', 'MATEMÁTICAS II', '15', '2', '0', '0', '0', '0', '32', '2015-01-29', 'vamos a ver', '1', '20091', '1');
INSERT INTO `uaprendizaje` VALUES ('11238', 'MATEMÁTICAS BASICAS', '3', '0', '0', '0', '0', '0', '6', '2015-01-29', 'vamos a ver', '1', '20091', '1');
INSERT INTO `uaprendizaje` VALUES ('11239', 'ESPAÑOL', '3', '0', '0', '0', '0', '0', '6', '2015-01-29', 'vamos a ver', '2', '20091', '1');
INSERT INTO `uaprendizaje` VALUES ('11240', 'OPTATIVA 1', '3', '0', '0', '0', '0', '0', '6', '2015-01-29', 'vamos a ver', '5', '20091', '1');
INSERT INTO `uaprendizaje` VALUES ('11241', 'MATEMATICAS III', '5', '5', '0', '0', '0', '0', '15', '2015-02-14', 'vamos a ver', '1', '20091', '1');

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
INSERT INTO `universidades_emp` VALUES ('2', 'INSTITUTO TECNOLOGICO DE TIJUANA', 'ITT', '16', '1');

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
  KEY `fk_users_levels1_idx` (`level`),
  CONSTRAINT `fk_users_campus1` FOREIGN KEY (`campus`) REFERENCES `campus` (`campus`),
  CONSTRAINT `fk_users_categorias1` FOREIGN KEY (`categoria`) REFERENCES `categorias` (`categoria`),
  CONSTRAINT `fk_users_ciudad1` FOREIGN KEY (`ciudad`) REFERENCES `ciudad` (`ciudad`),
  CONSTRAINT `fk_users_levels1` FOREIGN KEY (`level`) REFERENCES `levels` (`level`),
  CONSTRAINT `fk_users_uacademica1` FOREIGN KEY (`uacademica`) REFERENCES `uacademica` (`uacademica`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'Cynthia', 'Duarte', '', 'zyntya@hotmail.com', 'Real de Calacoaya 7810-3B', '6450706', '1', '1', 'Tikita', '$2y$10$9qAw9XKA/BtqYRg5WS087.3WjqG.eH0P8.JiLsY7BF4nBAZAPJ752', '1', '2014-04-19 19:30:58', '2015-02-12 14:59:29', 'nxkvv1PYyCCifUeCemRUttv0pPqAj6wLDQBPfZfiT44aE4Njqc4bP5HSgy4Q', 'F', null, '1985-12-01', '2014-12-02', 'zyntya@uabc.edu.mx', '16', 'CALLE SERRADILLA', '500', 'A', 'MONTGOMERY', '22310', '664-9740000', '664-9740000', '101', 'ENSENADA', 'FCA', '0');
INSERT INTO `users` VALUES ('2', 'Ivan', 'Duarte', '', 'wolfogan@gmail.com', 'Col. Nueva Tijuana', '6233987', '1', '1', 'LoganX', '$2y$10$k8fT0GW/Obx8KgZU4hVufOt/stcuq3Y9Z8/9StZEMuLWOCmjfK1hO', '2', '2014-04-19 19:30:58', '2015-02-12 15:12:34', 'xEFMalzxJwADGNc1iHJN1nJX06ia11HeC8zoOFWUdQVBRG84mFpdSQ4E8p11', 'M', null, '1990-12-02', '2014-12-31', 'luz.lugo@uabc.edu.mx', '16', 'DE LOS LAURELES', '600', '1', 'EL CIRCULO', '22450', '664-1236789', '664\'1236789', '101', 'VALLE DE LA TRINIDAD', 'FD', '1');

-- ----------------------------
-- View structure for vw_carga
-- ----------------------------
DROP VIEW IF EXISTS `vw_carga`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `vw_carga` AS select max(`cr`.`programaedu`) AS `carrera`,max(`pre`.`descripcion`) AS `desc_carr`,max(`cr`.`semestre`) AS `semestre`,max(`cr`.`periodo`) AS `periodo`,max(`pe`.`descripcion`) AS `desc_periodo`,max(`cr`.`uaprendizaje`) AS `uaprendizaje`,max(`uap`.`descripcionmat`) AS `descripcionmat`,max(`uap`.`creditos`) AS `creditos`,max(`uap`.`HC`) AS `HC`,max(`pua`.`etapa`) AS `ETAPA`,max(`et`.`descripcion`) AS `desc_etapa`,max(`cr`.`grupo`) AS `grupo`,(select group_concat(`ds`.`uaprequisito` separator ',') from `detalleseriacion` `ds` where ((`ds`.`uaprendizaje` = `cr`.`uaprendizaje`) and (`ds`.`programaedu` = `gr`.`programaedu`))) AS `requisito`,(select group_concat(`turnos`.`descripcion` separator ',') from (`grupos` left join `turnos` on((`grupos`.`turno` = `turnos`.`turno`))) where (`grupos`.`grupo` = `cr`.`grupo`)) AS `tunros`,(select group_concat(`carga`.`grupo` separator ',') from `carga` where ((`carga`.`uaprendizaje` = `cr`.`uaprendizaje`) and (`carga`.`periodo` = `cr`.`periodo`) and (`carga`.`semestre` = `cr`.`semestre`))) AS `grupos` from ((((((((`carga` `cr` left join `uaprendizaje` `uap` on((`cr`.`uaprendizaje` = `uap`.`uaprendizaje`))) join `p_ua` `pua` on(((`pua`.`programaedu` = `cr`.`programaedu`) and (`pua`.`uaprendizaje` = `cr`.`uaprendizaje`)))) left join `grupos` `gr` on(((`gr`.`grupo` = `cr`.`grupo`) and (`gr`.`periodo` = `cr`.`periodo`) and (`gr`.`programaedu` = `cr`.`programaedu`)))) left join `programaedu` `pre` on((`pre`.`programaedu` = `pua`.`programaedu`))) left join `periodos` `pe` on(((`pe`.`periodo` = `cr`.`periodo`) and (`pe`.`periodo` = `pe`.`periodo`)))) left join `turnos` `tu` on((`tu`.`turno` = `gr`.`turno`))) left join `detalleseriacion` `ds` on(((`ds`.`uaprendizaje` = `cr`.`uaprendizaje`) and (`ds`.`programaedu` = `gr`.`programaedu`)))) left join `etapas` `et` on((`et`.`etapa` = `pua`.`etapa`))) group by `cr`.`periodo`,`cr`.`programaedu`,`cr`.`semestre`,`pua`.`uaprendizaje` ; ;
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
;
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
