/*
Navicat MySQL Data Transfer

Source Server         : LOCAL
Source Server Version : 50612
Source Host           : localhost:3306
Source Database       : sigaf

Target Server Type    : MYSQL
Target Server Version : 50612
File Encoding         : 65001

Date: 2014-08-06 16:07:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bitacora
-- ----------------------------
DROP TABLE IF EXISTS `bitacora`;
CREATE TABLE `bitacora` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Consecutivo',
  `tabla` varchar(25) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL COMMENT 'Tabla',
  `usuario` varchar(20) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL COMMENT 'Usuario',
  `operacion` char(3) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL COMMENT 'Operacion realizada',
  `fecha` datetime NOT NULL COMMENT 'Fecha realizacion cambio',
  `registro` varchar(200) CHARACTER SET latin1 COLLATE latin1_spanish_ci DEFAULT NULL COMMENT 'Registro Insertado/Borrado',
  `registro_old` varchar(200) CHARACTER SET latin1 COLLATE latin1_spanish_ci DEFAULT NULL COMMENT 'Registro Borrado / Anterior',
  PRIMARY KEY (`id`),
  UNIQUE KEY `BI_id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=833 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of bitacora
-- ----------------------------
INSERT INTO `bitacora` VALUES ('1', 'periodo_prog_edu', 'tempo', 'I', '2014-07-24 00:00:00', '1|SEMESTRAL', null);
INSERT INTO `bitacora` VALUES ('2', 'periodo_prog_edu', 'tempo', 'I', '2014-07-24 00:00:00', '2|CUATRIMESTRAL', null);
INSERT INTO `bitacora` VALUES ('3', 'periodo_prog_edu', 'tempo', 'I', '2014-07-24 00:00:00', '3|TRIMESTRAL', null);
INSERT INTO `bitacora` VALUES ('4', 'periodo_prog_edu', 'tempo', 'I', '2014-07-24 00:00:00', '4|SABATINO', null);
INSERT INTO `bitacora` VALUES ('5', 'directivopuesto', 'tempo', 'I', '2014-07-24 00:00:00', '1|DIRECTOR', null);
INSERT INTO `bitacora` VALUES ('6', 'directivopuesto', 'tempo', 'I', '2014-07-24 00:00:00', '2|SUBDIRECTOR', null);
INSERT INTO `bitacora` VALUES ('7', 'directivopuesto', 'tempo', 'I', '2014-07-24 00:00:00', '3|ADMINISTRADOR', null);
INSERT INTO `bitacora` VALUES ('8', 'directivosua', 'tempo', 'I', '2014-07-24 00:00:00', '1|1|1', null);
INSERT INTO `bitacora` VALUES ('9', 'programaedu', 'tempo', 'I', '2014-07-24 00:00:00', null, null);
INSERT INTO `bitacora` VALUES ('10', 'programaedu', 'tempo', 'I', '2014-07-24 00:00:00', null, null);
INSERT INTO `bitacora` VALUES ('11', 'programaedu', 'tempo', 'I', '2014-07-24 00:00:00', null, null);
INSERT INTO `bitacora` VALUES ('12', 'programaedu', 'tempo', 'I', '2014-07-24 00:00:00', null, null);
INSERT INTO `bitacora` VALUES ('13', 'programaedu', 'tempo', 'I', '2014-07-24 00:00:00', null, null);
INSERT INTO `bitacora` VALUES ('14', 'planestudiodesc', 'tempo', 'I', '2014-07-24 00:00:00', '20092|PLAN DE ESTUDIOS 2009-2|20|2009-01-01|2015-12-31', null);
INSERT INTO `bitacora` VALUES ('15', 'planestudio', 'tempo', 'I', '2014-07-24 00:00:00', '20092|5|', null);
INSERT INTO `bitacora` VALUES ('16', 'planestudio', 'tempo', 'I', '2014-07-24 00:00:00', '20092|6|', null);
INSERT INTO `bitacora` VALUES ('17', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '11236|COMUNICACION ORAL Y ESCRITA|1|0|2|0|0|0|1|4|0|1|3|1|21|20092', null);
INSERT INTO `bitacora` VALUES ('18', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '11237|CONTABILIDAD|2|0|3|0|0|0|2|7|0|1|1|1|1|20092', null);
INSERT INTO `bitacora` VALUES ('19', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '11238|DESARROLLO HUMANO|1|0|2|0|0|0|1|4|0|1|3|1|8|20092', null);
INSERT INTO `bitacora` VALUES ('20', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '11239|ENTORNO GLOBAL DE LOS NEGOCIOS|2|0|2|0|0|0|2|6|0|1|3|1|10|20092', null);
INSERT INTO `bitacora` VALUES ('21', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '11240|MATEMATICAS|2|0|2|0|0|0|2|6|0|1|3|1|22|20092', null);
INSERT INTO `bitacora` VALUES ('22', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '11241|RESPONSABILIDAD SOCIAL|2|0|1|0|0|0|2|5|0|1|3|1|21|20092', null);
INSERT INTO `bitacora` VALUES ('23', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '11242|TECNOLOGIAS DE LA INFORMACION|1|3|0|0|0|0|1|5|0|1|3|1|12|20092', null);
INSERT INTO `bitacora` VALUES ('24', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '11243|CONTABILIDAD APLICADA|2|0|3|0|0|0|2|7|0|1|1|1|1|11237|20092', null);
INSERT INTO `bitacora` VALUES ('25', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '11244|DERECHO|3|0|0|0|0|0|3|6|0|1|3|1|19|20092', null);
INSERT INTO `bitacora` VALUES ('26', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '11245|ECONOMIA|2|0|2|0|0|0|2|6|0|1|3|1|17|20092', null);
INSERT INTO `bitacora` VALUES ('27', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '11246|LOGICA PARA LA TOMA DE DECISIONES|1|0|3|0|0|0|1|5|0|1|3|1|16|20092', null);
INSERT INTO `bitacora` VALUES ('28', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '11247|PROBABILIDAD Y ESTADISTICA|2|0|2|0|0|0|2|6|0|1|3|1|22|20092', null);
INSERT INTO `bitacora` VALUES ('29', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '11248|PROCESO ADMINISTRATIVO|2|0|2|0|0|0|2|6|0|1|1|1|10|20092', null);
INSERT INTO `bitacora` VALUES ('30', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '11249|SISTEMAS DE INFORMACION|2|0|2|0|0|0|2|6|0|1|3|1|15|20092', null);
INSERT INTO `bitacora` VALUES ('31', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '11733|MATEMATICAS FINANCIERAS|2|0|2|0|0|0|2|6|0|1|1|1|4|20092', null);
INSERT INTO `bitacora` VALUES ('32', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '11734|ENTORNO SOCIOECONOMICO DE MEXICO|2|0|2|0|0|0|2|6|0|1|3|1|17|20092', null);
INSERT INTO `bitacora` VALUES ('33', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '11737|DERECHO CORPORATIVO|3|0|1|0|0|0|3|7|0|1|1|2|19|20092', null);
INSERT INTO `bitacora` VALUES ('34', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '11755|DESARROLLO DE EMPRENDEDORES|1|0|3|0|0|0|1|5|0|1|3|3|20|20092', null);
INSERT INTO `bitacora` VALUES ('35', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '11761|ADMINISTRACION PUBLICA|3|0|0|0|0|0|3|6|0|2|3|2|11|20092', null);
INSERT INTO `bitacora` VALUES ('36', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '11843|METODOLOGIA DE LA INVESTIGACION|2|0|1|0|0|0|2|5|0|1|3|1|21|20092', null);
INSERT INTO `bitacora` VALUES ('37', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '11859|METODOS CUANTITATIVOS|2|0|2|0|0|0|2|6|0|1|1|1|9|20092', null);
INSERT INTO `bitacora` VALUES ('38', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '11862|MERCADOTECNIA|2|0|2|0|0|0|2|6|0|1|1|2|7|20092', null);
INSERT INTO `bitacora` VALUES ('39', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '12292|ADMINISTRACION ESTRATEGICA|2|0|2|0|0|0|2|6|0|1|3|3|11|20092', null);
INSERT INTO `bitacora` VALUES ('40', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '12456|ADMINISTRACION DE COMPRAS|2|0|1|0|0|0|2|5|0|1|3|1|10|20092', null);
INSERT INTO `bitacora` VALUES ('41', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '12457|DISEÃ‘O ORGANIZACIONAL|2|0|2|0|0|0|2|6|0|1|3|1|10|11248|20092', null);
INSERT INTO `bitacora` VALUES ('42', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '12458|REGISTROS ESPECIALES|2|0|2|0|0|0|2|6|0|1|1|1|1|11243|20092', null);
INSERT INTO `bitacora` VALUES ('43', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '12459|RELACIONES LABORALES|2|0|2|0|0|0|2|6|0|1|3|1|19|20092', null);
INSERT INTO `bitacora` VALUES ('44', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '12460|CONTABILIDAD ADMINISTRATIVA|2|0|2|0|0|0|2|6|0|1|3|2|3|12458|20092', null);
INSERT INTO `bitacora` VALUES ('45', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '12461|DERECHO CORPORATIVO|2|0|1|0|0|0|2|5|0|1|3|2|1|20092', null);
INSERT INTO `bitacora` VALUES ('46', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '12462|DERECHO FISCAL|2|0|2|0|0|0|2|6|0|1|3|2|6|20092', null);
INSERT INTO `bitacora` VALUES ('47', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '12463|INTEGRACION Y DESARROLLO DEL TALENTO HUMANO|2|0|3|0|0|0|2|7|0|1|3|2|8|12457|20092', null);
INSERT INTO `bitacora` VALUES ('48', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '12464|METODOS CUANTITATIVOS AVANZADOS|2|0|2|0|0|0|2|6|0|1|3|2|9|11859|20092', null);
INSERT INTO `bitacora` VALUES ('49', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '12465|ADMINISTRACION DE OPERACIONES|2|0|2|0|0|0|2|6|0|1|3|2|9|20092', null);
INSERT INTO `bitacora` VALUES ('50', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '12466|ADMINISTRACION DE VENTAS|2|0|1|0|0|0|2|5|0|1|3|2|7|20092', null);
INSERT INTO `bitacora` VALUES ('51', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '12467|ANALISIS FINANCIERO|2|0|3|0|0|0|2|7|0|1|1|2|4|11733|20092', null);
INSERT INTO `bitacora` VALUES ('52', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '12468|MERCADOTECNIA AVANZADA|2|0|2|0|0|0|2|6|0|1|3|2|7|11862|20092', null);
INSERT INTO `bitacora` VALUES ('53', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '12469|SEGURIDAD E HIGIENE|2|0|2|0|0|0|2|6|0|1|3|2|8|20092', null);
INSERT INTO `bitacora` VALUES ('54', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '12470|ADMINISTRACION DEL CAPITAL DE TRABAJO|2|0|2|0|0|0|2|6|0|1|1|2|22|12467|20092', null);
INSERT INTO `bitacora` VALUES ('55', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '12471|ADMINISTRACION DE SUELDOS Y SALARIOS|2|0|2|0|0|0|2|6|0|1|3|2|8|20092', null);
INSERT INTO `bitacora` VALUES ('56', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '12472|CONTRIBUCIONES DE SEGURIDAD SOCIAL|2|0|2|0|0|0|2|6|0|1|3|2|6|20092', null);
INSERT INTO `bitacora` VALUES ('57', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '12473|DIRECCION ESTRATEGICA|2|0|2|0|0|0|2|6|0|1|3|2|8|20092', null);
INSERT INTO `bitacora` VALUES ('58', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '12474|INVESTIGACION DE MERCADO|2|0|2|0|0|0|2|6|0|1|3|2|7|20092', null);
INSERT INTO `bitacora` VALUES ('59', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '12475|SI ESTRATEGICA EN LOS NEGOCIOS|1|0|3|0|0|0|1|5|0|1|3|2|15|20092', null);
INSERT INTO `bitacora` VALUES ('60', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '12476|ADMINISTRACION DE LA CALIDAD|2|0|2|0|0|0|2|6|0|1|3|3|22|20092', null);
INSERT INTO `bitacora` VALUES ('61', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '12477|AUDITORIA ADMINISTRATIVA|2|0|2|0|0|0|2|6|0|1|3|3|11|20092', null);
INSERT INTO `bitacora` VALUES ('62', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '12478|CONTROL PRESUPUESTAL|2|0|2|0|0|0|2|6|0|1|3|3|4|20092', null);
INSERT INTO `bitacora` VALUES ('63', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '12479|FUENTES DE FINANCIAMIENTO|2|0|2|0|0|0|2|6|0|1|1|2|4|12470|20092', null);
INSERT INTO `bitacora` VALUES ('64', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '12480|COMPETITIVIDAD EN LOS MERCADOS|1|0|3|0|0|0|1|5|0|1|3|3|9|20092', null);
INSERT INTO `bitacora` VALUES ('65', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '12481|FORMULACION Y EVALUACION DE PROYECTOS DE INVERSION|1|0|3|0|0|0|1|5|0|1|3|3|4|12479|20092', null);
INSERT INTO `bitacora` VALUES ('66', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '12482|PRACTICA PROFESIONAL|0|0|0|0|0|0|0|10|0|2|3|3|22|20092', null);
INSERT INTO `bitacora` VALUES ('67', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '12483|ADMON. DEL MEDIO AMBIENTE|3|0|0|0|0|0|3|6|0|2|3|1|22|20092', null);
INSERT INTO `bitacora` VALUES ('68', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '12484|ETICA|3|0|0|0|0|0|3|6|0|2|3|1|21|20092', null);
INSERT INTO `bitacora` VALUES ('69', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '12485|IDIOMA|3|0|0|0|0|0|3|6|0|2|3|1|22|20092', null);
INSERT INTO `bitacora` VALUES ('70', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '12486|SOCIOLOGIA DE LA EMPRESA|3|0|0|0|0|0|3|6|0|2|3|1|10|20092', null);
INSERT INTO `bitacora` VALUES ('71', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '12487|COMERCIO EXTERIOR|4|0|0|0|0|0|4|6|0|2|3|2|18|20092', null);
INSERT INTO `bitacora` VALUES ('72', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '12488|DESARROLLO DE HABILIDADES DOCENTES|4|0|0|0|0|0|4|6|0|2|3|2|21|20092', null);
INSERT INTO `bitacora` VALUES ('73', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '12489|DESARROLLO ORGANIZACIONAL|3|0|0|0|0|0|3|6|0|2|3|2|10|20092', null);
INSERT INTO `bitacora` VALUES ('74', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '12490|IMPUESTOS|4|0|0|0|0|0|4|7|0|2|3|2|6|20092', null);
INSERT INTO `bitacora` VALUES ('75', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '12491|MERCADOTECNIAS ESPECIALES|4|0|0|0|0|0|4|7|0|2|3|2|7|20092', null);
INSERT INTO `bitacora` VALUES ('76', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '12492|TECNICAS DE NEGOCIACION|2|0|1|0|0|0|2|5|0|2|3|2|11|20092', null);
INSERT INTO `bitacora` VALUES ('77', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '12493|ADMON. DE AGRONEGOCIOS|3|0|0|0|0|0|3|6|0|2|3|3|11|20092', null);
INSERT INTO `bitacora` VALUES ('78', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '12494|ADMON. Y COMERCIO ELECTRONICO|4|0|0|0|0|0|4|6|0|2|3|3|12|20092', null);
INSERT INTO `bitacora` VALUES ('79', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '12495|COMUNICACION ORGANIZACIONAL|4|0|0|0|0|0|4|6|0|2|3|3|11|20092', null);
INSERT INTO `bitacora` VALUES ('80', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '12496|CONSULTORIA|4|0|0|0|0|0|4|6|0|2|3|3|11|20092', null);
INSERT INTO `bitacora` VALUES ('81', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '12497|CREACION DE NEGOCIOS POR INTERNET|4|0|0|0|0|0|4|6|0|2|3|3|12|20092', null);
INSERT INTO `bitacora` VALUES ('82', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '12498|DESARROLLO DE HABILIDADES DIRECTIVAS|3|0|0|0|0|0|3|6|0|2|3|3|8|20092', null);
INSERT INTO `bitacora` VALUES ('83', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '12499|ETICA DE LOS NEGOCIOS|4|0|0|0|0|0|4|7|0|2|3|3|22|20092', null);
INSERT INTO `bitacora` VALUES ('84', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '12500|FINANZAS INTERNACIONALES|4|0|0|0|0|0|4|6|0|2|3|3|4|20092', null);
INSERT INTO `bitacora` VALUES ('85', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '12501|SISTEMAS ADMINISTRATIVOS ESPECIALES|3|0|0|0|0|0|3|6|0|2|3|3|22|20092', null);
INSERT INTO `bitacora` VALUES ('86', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '12559|DERECHO TRIBUTARIO|2|0|3|0|0|0|2|7|0|1|3|1|6|20092', null);
INSERT INTO `bitacora` VALUES ('87', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '12560|IMPUESTOS INDIRECTOS|2|0|2|0|0|0|2|6|0|1|3|2|6|20092', null);
INSERT INTO `bitacora` VALUES ('88', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '12561|NORMAS DE INFORMACION FINANCIERA|2|0|3|0|0|0|2|7|0|1|1|2|22|12458|20092', null);
INSERT INTO `bitacora` VALUES ('89', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '12562|PROFESION CONTABLE|1|0|2|0|0|0|1|4|0|1|3|2|22|20092', null);
INSERT INTO `bitacora` VALUES ('90', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '12563|CONTABILIDAD DE SOCIEDADES|2|0|2|0|0|0|2|6|0|1|3|2|2|11737|20092', null);
INSERT INTO `bitacora` VALUES ('91', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '12564|CONTROL|1|0|4|0|0|0|1|6|0|1|1|2|5|20092', null);
INSERT INTO `bitacora` VALUES ('92', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '12565|FUNDAMENTOS DE CONTABILIDAD DE COSTOS|2|0|3|0|0|0|2|7|0|1|1|2|3|20092', null);
INSERT INTO `bitacora` VALUES ('93', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '12566|NORMAS PARTICULARES|3|0|3|0|0|0|3|7|0|1|1|2|22|12561|20092', null);
INSERT INTO `bitacora` VALUES ('94', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '12567|AUDITORIA|2|0|3|0|0|0|2|7|0|1|1|2|5|12564|20092', null);
INSERT INTO `bitacora` VALUES ('95', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '12568|COSTOS PREDETERMINADOS|2|0|3|0|0|0|2|7|0|1|1|2|3|12565|20092', null);
INSERT INTO `bitacora` VALUES ('96', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '12569|ESTADOS FINANCIEROS|1|2|0|0|0|0|1|4|0|1|3|2|2|12566|20092', null);
INSERT INTO `bitacora` VALUES ('97', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '12570|ISR PERSONAS FISICAS|2|0|3|0|0|0|2|7|0|1|3|2|6|20092', null);
INSERT INTO `bitacora` VALUES ('98', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '12571|PLANEACION FINANCIERA|1|0|2|0|0|0|1|4|0|1|3|2|4|20092', null);
INSERT INTO `bitacora` VALUES ('99', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '12572|COSTOS PARA LA TOMA DE DECISIONES|2|0|2|0|0|0|2|6|0|1|3|3|3|12568|20092', null);
INSERT INTO `bitacora` VALUES ('100', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '12573|ISR PERSONAS MORALES Y OTRAS CONTRIBUCIONES|2|0|3|0|0|0|2|7|0|1|1|3|6|20092', null);
INSERT INTO `bitacora` VALUES ('101', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '12574|PAQUETERIA NEGOCIOS|1|2|0|0|0|0|1|4|0|1|3|3|2|20092', null);
INSERT INTO `bitacora` VALUES ('102', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '12575|PRACTICA DE AUDITORIAS|1|0|3|0|0|0|1|5|0|1|3|3|5|12567|20092', null);
INSERT INTO `bitacora` VALUES ('103', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '12576|PRACTICA FISCAL|1|2|0|0|0|0|1|4|0|1|3|3|6|20092', null);
INSERT INTO `bitacora` VALUES ('104', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '12578|INTEGRACION FISCAL|1|0|2|0|0|0|1|4|0|1|3|3|6|12573|20092', null);
INSERT INTO `bitacora` VALUES ('105', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '12579|PLANEACION ESTRATEGICA|1|0|3|0|0|0|1|5|0|1|3|3|11|20092', null);
INSERT INTO `bitacora` VALUES ('106', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '12581|ANALISIS DE LA LEGISLACION ADUANERA|4|0|0|0|0|0|4|8|0|2|3|2|22|20092', null);
INSERT INTO `bitacora` VALUES ('107', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '12582|COSTOS Y PRODUCTIVIDAD|2|0|2|0|0|0|2|6|0|2|3|2|3|20092', null);
INSERT INTO `bitacora` VALUES ('108', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '12583|INVESTIGACION DE OPERACIONES|2|0|2|0|0|0|2|6|0|2|3|2|9|20092', null);
INSERT INTO `bitacora` VALUES ('109', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '12584|MERCADOTECNIA|2|0|2|0|0|0|2|6|0|2|3|2|7|20092', null);
INSERT INTO `bitacora` VALUES ('110', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '12585|PRODUCCION|1|0|2|0|0|0|1|4|0|2|3|2|9|20092', null);
INSERT INTO `bitacora` VALUES ('111', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '12586|AUDITORIAS ESPECIALES|2|0|2|0|0|0|2|6|0|2|3|3|5|20092', null);
INSERT INTO `bitacora` VALUES ('112', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '12587|CASOS PRACTICOS DE COSTOS|2|0|2|0|0|0|2|6|0|2|3|3|3|20092', null);
INSERT INTO `bitacora` VALUES ('113', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '12588|CONTABILIDAD INTERNACIONAL|2|0|1|0|0|0|2|5|0|2|3|3|2|20092', null);
INSERT INTO `bitacora` VALUES ('114', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '12589|CONTABILIDAD CONSOLIDADA|3|0|1|0|0|0|3|7|0|2|3|3|2|20092', null);
INSERT INTO `bitacora` VALUES ('115', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '12590|CONTABILIDADES ESPECIALES|2|0|2|0|0|0|2|6|0|2|3|3|2|20092', null);
INSERT INTO `bitacora` VALUES ('116', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '12591|DICTAMENES|4|0|0|0|0|0|4|8|0|2|3|3|5|20092', null);
INSERT INTO `bitacora` VALUES ('117', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '12592|FINANZAS INTERNACIONALES|3|0|1|0|0|0|3|7|0|2|3|3|4|20092', null);
INSERT INTO `bitacora` VALUES ('118', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '12593|INVESTIGACION CONTABLE|2|0|2|0|0|0|2|6|0|2|3|3|2|20092', null);
INSERT INTO `bitacora` VALUES ('119', 'uaprendizaje', 'tempo', 'I', '2014-07-24 00:00:00', '12594|MERCADO DE VALORES|2|0|1|0|0|0|2|5|0|2|3|3|4|20092', null);
INSERT INTO `bitacora` VALUES ('120', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '6|11236', null);
INSERT INTO `bitacora` VALUES ('121', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '6|11237', null);
INSERT INTO `bitacora` VALUES ('122', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '6|11238', null);
INSERT INTO `bitacora` VALUES ('123', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '6|11239', null);
INSERT INTO `bitacora` VALUES ('124', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '6|11240', null);
INSERT INTO `bitacora` VALUES ('125', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '6|11241', null);
INSERT INTO `bitacora` VALUES ('126', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '6|11242', null);
INSERT INTO `bitacora` VALUES ('127', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '6|11243', null);
INSERT INTO `bitacora` VALUES ('128', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '6|11244', null);
INSERT INTO `bitacora` VALUES ('129', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '6|11245', null);
INSERT INTO `bitacora` VALUES ('130', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '6|11246', null);
INSERT INTO `bitacora` VALUES ('131', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '6|11247', null);
INSERT INTO `bitacora` VALUES ('132', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '6|11248', null);
INSERT INTO `bitacora` VALUES ('133', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '6|11249', null);
INSERT INTO `bitacora` VALUES ('134', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '2|11733', null);
INSERT INTO `bitacora` VALUES ('135', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '5|11733', null);
INSERT INTO `bitacora` VALUES ('136', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '2|11734', null);
INSERT INTO `bitacora` VALUES ('137', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '5|11734', null);
INSERT INTO `bitacora` VALUES ('138', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '5|11737', null);
INSERT INTO `bitacora` VALUES ('139', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '2|11755', null);
INSERT INTO `bitacora` VALUES ('140', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '5|11755', null);
INSERT INTO `bitacora` VALUES ('141', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '2|11761', null);
INSERT INTO `bitacora` VALUES ('142', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '2|11843', null);
INSERT INTO `bitacora` VALUES ('143', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '5|11843', null);
INSERT INTO `bitacora` VALUES ('144', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '2|11859', null);
INSERT INTO `bitacora` VALUES ('145', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '2|11862', null);
INSERT INTO `bitacora` VALUES ('146', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '2|12292', null);
INSERT INTO `bitacora` VALUES ('147', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '2|12456', null);
INSERT INTO `bitacora` VALUES ('148', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '2|12457', null);
INSERT INTO `bitacora` VALUES ('149', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '5|12457', null);
INSERT INTO `bitacora` VALUES ('150', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '2|12458', null);
INSERT INTO `bitacora` VALUES ('151', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '5|12458', null);
INSERT INTO `bitacora` VALUES ('152', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '2|12459', null);
INSERT INTO `bitacora` VALUES ('153', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '5|12459', null);
INSERT INTO `bitacora` VALUES ('154', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '2|12460', null);
INSERT INTO `bitacora` VALUES ('155', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '2|12461', null);
INSERT INTO `bitacora` VALUES ('156', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '2|12462', null);
INSERT INTO `bitacora` VALUES ('157', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '2|12463', null);
INSERT INTO `bitacora` VALUES ('158', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '2|12464', null);
INSERT INTO `bitacora` VALUES ('159', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '2|12465', null);
INSERT INTO `bitacora` VALUES ('160', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '2|12466', null);
INSERT INTO `bitacora` VALUES ('161', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '2|12467', null);
INSERT INTO `bitacora` VALUES ('162', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '5|12467', null);
INSERT INTO `bitacora` VALUES ('163', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '2|12468', null);
INSERT INTO `bitacora` VALUES ('164', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '2|12469', null);
INSERT INTO `bitacora` VALUES ('165', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '2|12470', null);
INSERT INTO `bitacora` VALUES ('166', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '5|12470', null);
INSERT INTO `bitacora` VALUES ('167', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '2|12471', null);
INSERT INTO `bitacora` VALUES ('168', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '2|12472', null);
INSERT INTO `bitacora` VALUES ('169', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '5|12472', null);
INSERT INTO `bitacora` VALUES ('170', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '2|12473', null);
INSERT INTO `bitacora` VALUES ('171', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '2|12474', null);
INSERT INTO `bitacora` VALUES ('172', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '2|12475', null);
INSERT INTO `bitacora` VALUES ('173', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '2|12476', null);
INSERT INTO `bitacora` VALUES ('174', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '2|12477', null);
INSERT INTO `bitacora` VALUES ('175', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '2|12478', null);
INSERT INTO `bitacora` VALUES ('176', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '2|12479', null);
INSERT INTO `bitacora` VALUES ('177', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '5|12479', null);
INSERT INTO `bitacora` VALUES ('178', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '2|12480', null);
INSERT INTO `bitacora` VALUES ('179', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '2|12481', null);
INSERT INTO `bitacora` VALUES ('180', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '5|12481', null);
INSERT INTO `bitacora` VALUES ('181', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '2|12482', null);
INSERT INTO `bitacora` VALUES ('182', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '2|12483', null);
INSERT INTO `bitacora` VALUES ('183', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '2|12484', null);
INSERT INTO `bitacora` VALUES ('184', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '2|12485', null);
INSERT INTO `bitacora` VALUES ('185', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '2|12486', null);
INSERT INTO `bitacora` VALUES ('186', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '2|12487', null);
INSERT INTO `bitacora` VALUES ('187', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '2|12488', null);
INSERT INTO `bitacora` VALUES ('188', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '2|12489', null);
INSERT INTO `bitacora` VALUES ('189', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '2|12490', null);
INSERT INTO `bitacora` VALUES ('190', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '2|12491', null);
INSERT INTO `bitacora` VALUES ('191', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '2|12492', null);
INSERT INTO `bitacora` VALUES ('192', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '5|12492', null);
INSERT INTO `bitacora` VALUES ('193', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '2|12493', null);
INSERT INTO `bitacora` VALUES ('194', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '2|12494', null);
INSERT INTO `bitacora` VALUES ('195', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '2|12495', null);
INSERT INTO `bitacora` VALUES ('196', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '2|12496', null);
INSERT INTO `bitacora` VALUES ('197', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '2|12497', null);
INSERT INTO `bitacora` VALUES ('198', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '2|12498', null);
INSERT INTO `bitacora` VALUES ('199', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '2|12499', null);
INSERT INTO `bitacora` VALUES ('200', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '2|12500', null);
INSERT INTO `bitacora` VALUES ('201', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '2|12501', null);
INSERT INTO `bitacora` VALUES ('202', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '5|12559', null);
INSERT INTO `bitacora` VALUES ('203', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '5|12560', null);
INSERT INTO `bitacora` VALUES ('204', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '5|12561', null);
INSERT INTO `bitacora` VALUES ('205', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '5|12562', null);
INSERT INTO `bitacora` VALUES ('206', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '5|12563', null);
INSERT INTO `bitacora` VALUES ('207', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '5|12564', null);
INSERT INTO `bitacora` VALUES ('208', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '5|12565', null);
INSERT INTO `bitacora` VALUES ('209', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '5|12566', null);
INSERT INTO `bitacora` VALUES ('210', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '5|12567', null);
INSERT INTO `bitacora` VALUES ('211', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '5|12568', null);
INSERT INTO `bitacora` VALUES ('212', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '5|12569', null);
INSERT INTO `bitacora` VALUES ('213', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '5|12570', null);
INSERT INTO `bitacora` VALUES ('214', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '5|12571', null);
INSERT INTO `bitacora` VALUES ('215', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '5|12572', null);
INSERT INTO `bitacora` VALUES ('216', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '5|12573', null);
INSERT INTO `bitacora` VALUES ('217', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '5|12574', null);
INSERT INTO `bitacora` VALUES ('218', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '5|12575', null);
INSERT INTO `bitacora` VALUES ('219', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '5|12576', null);
INSERT INTO `bitacora` VALUES ('220', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '5|12578', null);
INSERT INTO `bitacora` VALUES ('221', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '5|12579', null);
INSERT INTO `bitacora` VALUES ('222', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '5|12581', null);
INSERT INTO `bitacora` VALUES ('223', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '5|12582', null);
INSERT INTO `bitacora` VALUES ('224', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '5|12583', null);
INSERT INTO `bitacora` VALUES ('225', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '5|12584', null);
INSERT INTO `bitacora` VALUES ('226', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '5|12585', null);
INSERT INTO `bitacora` VALUES ('227', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '5|12586', null);
INSERT INTO `bitacora` VALUES ('228', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '5|12587', null);
INSERT INTO `bitacora` VALUES ('229', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '5|12588', null);
INSERT INTO `bitacora` VALUES ('230', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '5|12589', null);
INSERT INTO `bitacora` VALUES ('231', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '5|12590', null);
INSERT INTO `bitacora` VALUES ('232', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '5|12591', null);
INSERT INTO `bitacora` VALUES ('233', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '5|12592', null);
INSERT INTO `bitacora` VALUES ('234', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '5|12593', null);
INSERT INTO `bitacora` VALUES ('235', 'p_ua', 'tempo', 'I', '2014-07-24 00:00:00', '5|12594', null);
INSERT INTO `bitacora` VALUES ('236', 'planestudio', 'tempo', 'I', '2014-07-24 00:00:00', '20092|2|', null);
INSERT INTO `bitacora` VALUES ('237', 'grupos', 'tempo', 'I', '2014-07-24 00:00:00', '231|20141|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('238', 'grupos', 'tempo', 'I', '2014-07-24 00:00:00', '232|20141|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('239', 'grupos', 'tempo', 'I', '2014-07-24 00:00:00', '233|20141|20092|2|3', null);
INSERT INTO `bitacora` VALUES ('240', 'grupos', 'tempo', 'I', '2014-07-24 00:00:00', '234|20141|20092|2|3', null);
INSERT INTO `bitacora` VALUES ('241', 'grupos', 'tempo', 'I', '2014-07-24 00:00:00', '235|20141|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('242', 'grupos', 'tempo', 'I', '2014-07-24 00:00:00', '236|20141|20092|2|3', null);
INSERT INTO `bitacora` VALUES ('243', 'grupos', 'tempo', 'I', '2014-07-24 00:00:00', '241|20141|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('244', 'grupos', 'tempo', 'I', '2014-07-24 00:00:00', '242|20141|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('245', 'grupos', 'tempo', 'I', '2014-07-24 00:00:00', '243|20141|20092|2|3', null);
INSERT INTO `bitacora` VALUES ('246', 'grupos', 'tempo', 'I', '2014-07-24 00:00:00', '244|20141|20092|2|3', null);
INSERT INTO `bitacora` VALUES ('247', 'grupos', 'tempo', 'I', '2014-07-24 00:00:00', '245|20141|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('248', 'grupos', 'tempo', 'I', '2014-07-24 00:00:00', '246|20141|20092|2|3', null);
INSERT INTO `bitacora` VALUES ('249', 'grupos', 'tempo', 'I', '2014-07-24 00:00:00', '251|20141|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('250', 'grupos', 'tempo', 'I', '2014-07-24 00:00:00', '252|20141|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('251', 'grupos', 'tempo', 'I', '2014-07-24 00:00:00', '253|20141|20092|2|3', null);
INSERT INTO `bitacora` VALUES ('252', 'grupos', 'tempo', 'I', '2014-07-24 00:00:00', '254|20141|20092|2|3', null);
INSERT INTO `bitacora` VALUES ('253', 'grupos', 'tempo', 'I', '2014-07-24 00:00:00', '255|20141|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('254', 'grupos', 'tempo', 'I', '2014-07-24 00:00:00', '256|20141|20092|2|3', null);
INSERT INTO `bitacora` VALUES ('255', 'grupos', 'tempo', 'I', '2014-07-24 00:00:00', '261|20141|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('256', 'grupos', 'tempo', 'I', '2014-07-24 00:00:00', '262|20141|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('257', 'grupos', 'tempo', 'I', '2014-07-24 00:00:00', '263|20141|20092|2|3', null);
INSERT INTO `bitacora` VALUES ('258', 'grupos', 'tempo', 'I', '2014-07-24 00:00:00', '264|20141|20092|2|3', null);
INSERT INTO `bitacora` VALUES ('259', 'grupos', 'tempo', 'I', '2014-07-24 00:00:00', '265|20141|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('260', 'grupos', 'tempo', 'I', '2014-07-24 00:00:00', '266|20141|20092|2|3', null);
INSERT INTO `bitacora` VALUES ('261', 'grupos', 'tempo', 'I', '2014-07-24 00:00:00', '271|20141|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('262', 'grupos', 'tempo', 'I', '2014-07-24 00:00:00', '272|20141|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('263', 'grupos', 'tempo', 'I', '2014-07-24 00:00:00', '273|20141|20092|2|3', null);
INSERT INTO `bitacora` VALUES ('264', 'grupos', 'tempo', 'I', '2014-07-24 00:00:00', '274|20141|20092|2|3', null);
INSERT INTO `bitacora` VALUES ('265', 'grupos', 'tempo', 'I', '2014-07-24 00:00:00', '275|20141|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('266', 'grupos', 'tempo', 'I', '2014-07-24 00:00:00', '281|20141|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('267', 'grupos', 'tempo', 'I', '2014-07-24 00:00:00', '282|20141|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('268', 'grupos', 'tempo', 'I', '2014-07-24 00:00:00', '283|20141|20092|2|3', null);
INSERT INTO `bitacora` VALUES ('269', 'grupos', 'tempo', 'I', '2014-07-24 00:00:00', '284|20141|20092|2|3', null);
INSERT INTO `bitacora` VALUES ('270', 'grupos', 'tempo', 'I', '2014-07-24 00:00:00', '601|20141|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('271', 'grupos', 'tempo', 'I', '2014-07-24 00:00:00', '602|20141|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('272', 'grupos', 'tempo', 'I', '2014-07-24 00:00:00', '603|20141|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('273', 'grupos', 'tempo', 'I', '2014-07-24 00:00:00', '604|20141|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('274', 'grupos', 'tempo', 'I', '2014-07-24 00:00:00', '605|20141|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('275', 'grupos', 'tempo', 'I', '2014-07-24 00:00:00', '606|20141|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('276', 'grupos', 'tempo', 'I', '2014-07-24 00:00:00', '607|20141|20092|2|2', null);
INSERT INTO `bitacora` VALUES ('277', 'grupos', 'tempo', 'I', '2014-07-24 00:00:00', '608|20141|20092|2|2', null);
INSERT INTO `bitacora` VALUES ('278', 'grupos', 'tempo', 'I', '2014-07-24 00:00:00', '611|20141|20092|2|3', null);
INSERT INTO `bitacora` VALUES ('279', 'grupos', 'tempo', 'I', '2014-07-24 00:00:00', '612|20141|20092|2|3', null);
INSERT INTO `bitacora` VALUES ('280', 'grupos', 'tempo', 'I', '2014-07-24 00:00:00', '613|20141|20092|2|3', null);
INSERT INTO `bitacora` VALUES ('281', 'grupos', 'tempo', 'I', '2014-07-24 00:00:00', '614|20141|20092|2|3', null);
INSERT INTO `bitacora` VALUES ('282', 'grupos', 'tempo', 'I', '2014-07-24 00:00:00', '615|20141|20092|2|3', null);
INSERT INTO `bitacora` VALUES ('283', 'grupos', 'tempo', 'I', '2014-07-24 00:00:00', '616|20141|20092|2|3', null);
INSERT INTO `bitacora` VALUES ('284', 'grupos', 'tempo', 'I', '2014-07-24 00:00:00', '621|20141|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('285', 'grupos', 'tempo', 'I', '2014-07-24 00:00:00', '622|20141|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('286', 'grupos', 'tempo', 'I', '2014-07-24 00:00:00', '623|20141|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('287', 'grupos', 'tempo', 'I', '2014-07-24 00:00:00', '624|20141|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('288', 'grupos', 'tempo', 'I', '2014-07-24 00:00:00', '625|20141|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('289', 'grupos', 'tempo', 'I', '2014-07-24 00:00:00', '626|20141|20092|2|1', null);
INSERT INTO `bitacora` VALUES ('290', 'grupos', 'tempo', 'I', '2014-07-24 00:00:00', '627|20141|20092|2|2', null);
INSERT INTO `bitacora` VALUES ('291', 'grupos', 'tempo', 'I', '2014-07-24 00:00:00', '628|20141|20092|2|2', null);
INSERT INTO `bitacora` VALUES ('292', 'grupos', 'tempo', 'I', '2014-07-24 00:00:00', '629|20141|20092|2|2', null);
INSERT INTO `bitacora` VALUES ('293', 'grupos', 'tempo', 'I', '2014-07-24 00:00:00', '630|20141|20092|2|2', null);
INSERT INTO `bitacora` VALUES ('294', 'grupos', 'tempo', 'I', '2014-07-24 00:00:00', '631|20141|20092|2|3', null);
INSERT INTO `bitacora` VALUES ('295', 'grupos', 'tempo', 'I', '2014-07-24 00:00:00', '632|20141|20092|2|3', null);
INSERT INTO `bitacora` VALUES ('296', 'grupos', 'tempo', 'I', '2014-07-24 00:00:00', '633|20141|20092|2|3', null);
INSERT INTO `bitacora` VALUES ('297', 'grupos', 'tempo', 'I', '2014-07-24 00:00:00', '634|20141|20092|2|3', null);
INSERT INTO `bitacora` VALUES ('298', 'grupos', 'tempo', 'I', '2014-07-24 00:00:00', '635|20141|20092|2|3', null);
INSERT INTO `bitacora` VALUES ('299', 'grupos', 'tempo', 'I', '2014-07-24 00:00:00', '636|20141|20092|2|3', null);
INSERT INTO `bitacora` VALUES ('300', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '231|20141|11734|3', null);
INSERT INTO `bitacora` VALUES ('301', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '231|20141|11843|3', null);
INSERT INTO `bitacora` VALUES ('302', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '231|20141|11859|3', null);
INSERT INTO `bitacora` VALUES ('303', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '231|20141|12456|3', null);
INSERT INTO `bitacora` VALUES ('304', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '231|20141|12457|3', null);
INSERT INTO `bitacora` VALUES ('305', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '231|20141|12458|3', null);
INSERT INTO `bitacora` VALUES ('306', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '231|20141|12459|3', null);
INSERT INTO `bitacora` VALUES ('307', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '231|20141|12484|3', null);
INSERT INTO `bitacora` VALUES ('308', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '232|20141|11734|3', null);
INSERT INTO `bitacora` VALUES ('309', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '232|20141|11843|3', null);
INSERT INTO `bitacora` VALUES ('310', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '232|20141|11859|3', null);
INSERT INTO `bitacora` VALUES ('311', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '232|20141|12456|3', null);
INSERT INTO `bitacora` VALUES ('312', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '232|20141|12457|3', null);
INSERT INTO `bitacora` VALUES ('313', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '232|20141|12458|3', null);
INSERT INTO `bitacora` VALUES ('314', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '232|20141|12459|3', null);
INSERT INTO `bitacora` VALUES ('315', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '232|20141|12484|3', null);
INSERT INTO `bitacora` VALUES ('316', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '233|20141|11734|3', null);
INSERT INTO `bitacora` VALUES ('317', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '233|20141|11843|3', null);
INSERT INTO `bitacora` VALUES ('318', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '233|20141|11859|3', null);
INSERT INTO `bitacora` VALUES ('319', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '233|20141|12456|3', null);
INSERT INTO `bitacora` VALUES ('320', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '233|20141|12457|3', null);
INSERT INTO `bitacora` VALUES ('321', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '233|20141|12458|3', null);
INSERT INTO `bitacora` VALUES ('322', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '233|20141|12459|3', null);
INSERT INTO `bitacora` VALUES ('323', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '233|20141|12484|3', null);
INSERT INTO `bitacora` VALUES ('324', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '234|20141|11734|3', null);
INSERT INTO `bitacora` VALUES ('325', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '234|20141|11843|3', null);
INSERT INTO `bitacora` VALUES ('326', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '234|20141|11859|3', null);
INSERT INTO `bitacora` VALUES ('327', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '234|20141|12456|3', null);
INSERT INTO `bitacora` VALUES ('328', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '234|20141|12457|3', null);
INSERT INTO `bitacora` VALUES ('329', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '234|20141|12458|3', null);
INSERT INTO `bitacora` VALUES ('330', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '234|20141|12459|3', null);
INSERT INTO `bitacora` VALUES ('331', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '234|20141|12484|3', null);
INSERT INTO `bitacora` VALUES ('332', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '235|20141|11734|3', null);
INSERT INTO `bitacora` VALUES ('333', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '235|20141|11843|3', null);
INSERT INTO `bitacora` VALUES ('334', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '235|20141|11859|3', null);
INSERT INTO `bitacora` VALUES ('335', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '235|20141|12456|3', null);
INSERT INTO `bitacora` VALUES ('336', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '235|20141|12457|3', null);
INSERT INTO `bitacora` VALUES ('337', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '235|20141|12458|3', null);
INSERT INTO `bitacora` VALUES ('338', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '235|20141|12459|3', null);
INSERT INTO `bitacora` VALUES ('339', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '235|20141|12484|3', null);
INSERT INTO `bitacora` VALUES ('340', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '236|20141|11734|3', null);
INSERT INTO `bitacora` VALUES ('341', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '236|20141|11843|3', null);
INSERT INTO `bitacora` VALUES ('342', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '236|20141|11859|3', null);
INSERT INTO `bitacora` VALUES ('343', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '236|20141|12456|3', null);
INSERT INTO `bitacora` VALUES ('344', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '236|20141|12457|3', null);
INSERT INTO `bitacora` VALUES ('345', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '236|20141|12458|3', null);
INSERT INTO `bitacora` VALUES ('346', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '236|20141|12459|3', null);
INSERT INTO `bitacora` VALUES ('347', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '236|20141|12484|3', null);
INSERT INTO `bitacora` VALUES ('348', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '241|20141|11733|3', null);
INSERT INTO `bitacora` VALUES ('349', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '241|20141|11862|3', null);
INSERT INTO `bitacora` VALUES ('350', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '241|20141|12460|3', null);
INSERT INTO `bitacora` VALUES ('351', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '241|20141|12461|3', null);
INSERT INTO `bitacora` VALUES ('352', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '241|20141|12462|3', null);
INSERT INTO `bitacora` VALUES ('353', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '241|20141|12463|3', null);
INSERT INTO `bitacora` VALUES ('354', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '241|20141|12464|3', null);
INSERT INTO `bitacora` VALUES ('355', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '241|20141|12489|3', null);
INSERT INTO `bitacora` VALUES ('356', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '242|20141|11733|3', null);
INSERT INTO `bitacora` VALUES ('357', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '242|20141|11862|3', null);
INSERT INTO `bitacora` VALUES ('358', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '242|20141|12460|3', null);
INSERT INTO `bitacora` VALUES ('359', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '242|20141|12461|3', null);
INSERT INTO `bitacora` VALUES ('360', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '242|20141|12462|3', null);
INSERT INTO `bitacora` VALUES ('361', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '242|20141|12463|3', null);
INSERT INTO `bitacora` VALUES ('362', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '242|20141|12464|3', null);
INSERT INTO `bitacora` VALUES ('363', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '242|20141|12489|3', null);
INSERT INTO `bitacora` VALUES ('364', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '243|20141|11733|3', null);
INSERT INTO `bitacora` VALUES ('365', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '243|20141|11761|3', null);
INSERT INTO `bitacora` VALUES ('366', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '243|20141|11862|3', null);
INSERT INTO `bitacora` VALUES ('367', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '243|20141|12460|3', null);
INSERT INTO `bitacora` VALUES ('368', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '243|20141|12461|3', null);
INSERT INTO `bitacora` VALUES ('369', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '243|20141|12462|3', null);
INSERT INTO `bitacora` VALUES ('370', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '243|20141|12463|3', null);
INSERT INTO `bitacora` VALUES ('371', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '243|20141|12464|3', null);
INSERT INTO `bitacora` VALUES ('372', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '244|20141|11733|3', null);
INSERT INTO `bitacora` VALUES ('373', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '244|20141|11862|3', null);
INSERT INTO `bitacora` VALUES ('374', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '244|20141|12460|3', null);
INSERT INTO `bitacora` VALUES ('375', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '244|20141|12461|3', null);
INSERT INTO `bitacora` VALUES ('376', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '244|20141|12462|3', null);
INSERT INTO `bitacora` VALUES ('377', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '244|20141|12463|3', null);
INSERT INTO `bitacora` VALUES ('378', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '244|20141|12464|3', null);
INSERT INTO `bitacora` VALUES ('379', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '244|20141|12492|3', null);
INSERT INTO `bitacora` VALUES ('380', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '245|20141|11733|3', null);
INSERT INTO `bitacora` VALUES ('381', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '245|20141|11761|3', null);
INSERT INTO `bitacora` VALUES ('382', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '245|20141|11862|3', null);
INSERT INTO `bitacora` VALUES ('383', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '245|20141|12460|3', null);
INSERT INTO `bitacora` VALUES ('384', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '245|20141|12461|3', null);
INSERT INTO `bitacora` VALUES ('385', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '245|20141|12462|3', null);
INSERT INTO `bitacora` VALUES ('386', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '245|20141|12463|3', null);
INSERT INTO `bitacora` VALUES ('387', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '245|20141|12464|3', null);
INSERT INTO `bitacora` VALUES ('388', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '246|20141|11733|3', null);
INSERT INTO `bitacora` VALUES ('389', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '246|20141|11761|3', null);
INSERT INTO `bitacora` VALUES ('390', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '246|20141|11862|3', null);
INSERT INTO `bitacora` VALUES ('391', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '246|20141|12460|3', null);
INSERT INTO `bitacora` VALUES ('392', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '246|20141|12461|3', null);
INSERT INTO `bitacora` VALUES ('393', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '246|20141|12462|3', null);
INSERT INTO `bitacora` VALUES ('394', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '246|20141|12463|3', null);
INSERT INTO `bitacora` VALUES ('395', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '246|20141|12464|3', null);
INSERT INTO `bitacora` VALUES ('396', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '251|20141|11761|3', null);
INSERT INTO `bitacora` VALUES ('397', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '251|20141|12465|3', null);
INSERT INTO `bitacora` VALUES ('398', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '251|20141|12466|3', null);
INSERT INTO `bitacora` VALUES ('399', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '251|20141|12467|3', null);
INSERT INTO `bitacora` VALUES ('400', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '251|20141|12468|3', null);
INSERT INTO `bitacora` VALUES ('401', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '251|20141|12469|3', null);
INSERT INTO `bitacora` VALUES ('402', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '251|20141|12487|3', null);
INSERT INTO `bitacora` VALUES ('403', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '251|20141|12489|3', null);
INSERT INTO `bitacora` VALUES ('404', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '252|20141|11761|3', null);
INSERT INTO `bitacora` VALUES ('405', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '252|20141|12465|3', null);
INSERT INTO `bitacora` VALUES ('406', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '252|20141|12466|3', null);
INSERT INTO `bitacora` VALUES ('407', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '252|20141|12467|3', null);
INSERT INTO `bitacora` VALUES ('408', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '252|20141|12468|3', null);
INSERT INTO `bitacora` VALUES ('409', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '252|20141|12469|3', null);
INSERT INTO `bitacora` VALUES ('410', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '252|20141|12487|3', null);
INSERT INTO `bitacora` VALUES ('411', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '252|20141|12492|3', null);
INSERT INTO `bitacora` VALUES ('412', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '253|20141|11761|3', null);
INSERT INTO `bitacora` VALUES ('413', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '253|20141|12465|3', null);
INSERT INTO `bitacora` VALUES ('414', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '253|20141|12466|3', null);
INSERT INTO `bitacora` VALUES ('415', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '253|20141|12467|3', null);
INSERT INTO `bitacora` VALUES ('416', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '253|20141|12468|3', null);
INSERT INTO `bitacora` VALUES ('417', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '253|20141|12469|3', null);
INSERT INTO `bitacora` VALUES ('418', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '253|20141|12487|3', null);
INSERT INTO `bitacora` VALUES ('419', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '254|20141|11761|3', null);
INSERT INTO `bitacora` VALUES ('420', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '254|20141|12465|3', null);
INSERT INTO `bitacora` VALUES ('421', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '254|20141|12466|3', null);
INSERT INTO `bitacora` VALUES ('422', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '254|20141|12467|3', null);
INSERT INTO `bitacora` VALUES ('423', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '254|20141|12468|3', null);
INSERT INTO `bitacora` VALUES ('424', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '254|20141|12469|3', null);
INSERT INTO `bitacora` VALUES ('425', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '254|20141|12487|3', null);
INSERT INTO `bitacora` VALUES ('426', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '255|20141|11761|3', null);
INSERT INTO `bitacora` VALUES ('427', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '255|20141|12465|3', null);
INSERT INTO `bitacora` VALUES ('428', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '255|20141|12466|3', null);
INSERT INTO `bitacora` VALUES ('429', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '255|20141|12467|3', null);
INSERT INTO `bitacora` VALUES ('430', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '255|20141|12468|3', null);
INSERT INTO `bitacora` VALUES ('431', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '255|20141|12469|3', null);
INSERT INTO `bitacora` VALUES ('432', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '255|20141|12489|3', null);
INSERT INTO `bitacora` VALUES ('433', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '256|20141|11761|3', null);
INSERT INTO `bitacora` VALUES ('434', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '256|20141|12465|3', null);
INSERT INTO `bitacora` VALUES ('435', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '256|20141|12466|3', null);
INSERT INTO `bitacora` VALUES ('436', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '256|20141|12467|3', null);
INSERT INTO `bitacora` VALUES ('437', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '256|20141|12468|3', null);
INSERT INTO `bitacora` VALUES ('438', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '256|20141|12469|3', null);
INSERT INTO `bitacora` VALUES ('439', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '256|20141|12487|3', null);
INSERT INTO `bitacora` VALUES ('440', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '256|20141|12489|3', null);
INSERT INTO `bitacora` VALUES ('441', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '261|20141|12470|3', null);
INSERT INTO `bitacora` VALUES ('442', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '261|20141|12471|3', null);
INSERT INTO `bitacora` VALUES ('443', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '261|20141|12472|3', null);
INSERT INTO `bitacora` VALUES ('444', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '261|20141|12473|3', null);
INSERT INTO `bitacora` VALUES ('445', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '261|20141|12474|3', null);
INSERT INTO `bitacora` VALUES ('446', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '261|20141|12475|3', null);
INSERT INTO `bitacora` VALUES ('447', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '261|20141|12487|3', null);
INSERT INTO `bitacora` VALUES ('448', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '261|20141|12491|3', null);
INSERT INTO `bitacora` VALUES ('449', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '262|20141|12470|3', null);
INSERT INTO `bitacora` VALUES ('450', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '262|20141|12471|3', null);
INSERT INTO `bitacora` VALUES ('451', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '262|20141|12472|3', null);
INSERT INTO `bitacora` VALUES ('452', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '262|20141|12473|3', null);
INSERT INTO `bitacora` VALUES ('453', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '262|20141|12474|3', null);
INSERT INTO `bitacora` VALUES ('454', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '262|20141|12475|3', null);
INSERT INTO `bitacora` VALUES ('455', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '262|20141|12491|3', null);
INSERT INTO `bitacora` VALUES ('456', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '263|20141|12470|3', null);
INSERT INTO `bitacora` VALUES ('457', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '263|20141|12471|3', null);
INSERT INTO `bitacora` VALUES ('458', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '263|20141|12472|3', null);
INSERT INTO `bitacora` VALUES ('459', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '263|20141|12473|3', null);
INSERT INTO `bitacora` VALUES ('460', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '263|20141|12474|3', null);
INSERT INTO `bitacora` VALUES ('461', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '263|20141|12475|3', null);
INSERT INTO `bitacora` VALUES ('462', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '263|20141|12490|3', null);
INSERT INTO `bitacora` VALUES ('463', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '263|20141|12491|3', null);
INSERT INTO `bitacora` VALUES ('464', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '264|20141|12470|3', null);
INSERT INTO `bitacora` VALUES ('465', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '264|20141|12471|3', null);
INSERT INTO `bitacora` VALUES ('466', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '264|20141|12472|3', null);
INSERT INTO `bitacora` VALUES ('467', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '264|20141|12473|3', null);
INSERT INTO `bitacora` VALUES ('468', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '264|20141|12474|3', null);
INSERT INTO `bitacora` VALUES ('469', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '264|20141|12475|3', null);
INSERT INTO `bitacora` VALUES ('470', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '264|20141|12488|3', null);
INSERT INTO `bitacora` VALUES ('471', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '265|20141|11761|3', null);
INSERT INTO `bitacora` VALUES ('472', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '265|20141|12470|3', null);
INSERT INTO `bitacora` VALUES ('473', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '265|20141|12471|3', null);
INSERT INTO `bitacora` VALUES ('474', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '265|20141|12472|3', null);
INSERT INTO `bitacora` VALUES ('475', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '265|20141|12473|3', null);
INSERT INTO `bitacora` VALUES ('476', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '265|20141|12474|3', null);
INSERT INTO `bitacora` VALUES ('477', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '265|20141|12475|3', null);
INSERT INTO `bitacora` VALUES ('478', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '265|20141|12490|3', null);
INSERT INTO `bitacora` VALUES ('479', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '266|20141|12470|3', null);
INSERT INTO `bitacora` VALUES ('480', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '266|20141|12471|3', null);
INSERT INTO `bitacora` VALUES ('481', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '266|20141|12472|3', null);
INSERT INTO `bitacora` VALUES ('482', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '266|20141|12473|3', null);
INSERT INTO `bitacora` VALUES ('483', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '266|20141|12474|3', null);
INSERT INTO `bitacora` VALUES ('484', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '266|20141|12475|3', null);
INSERT INTO `bitacora` VALUES ('485', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '266|20141|12490|3', null);
INSERT INTO `bitacora` VALUES ('486', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '271|20141|11755|3', null);
INSERT INTO `bitacora` VALUES ('487', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '271|20141|12292|3', null);
INSERT INTO `bitacora` VALUES ('488', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '271|20141|12476|3', null);
INSERT INTO `bitacora` VALUES ('489', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '271|20141|12477|3', null);
INSERT INTO `bitacora` VALUES ('490', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '271|20141|12478|3', null);
INSERT INTO `bitacora` VALUES ('491', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '271|20141|12479|3', null);
INSERT INTO `bitacora` VALUES ('492', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '271|20141|12494|3', null);
INSERT INTO `bitacora` VALUES ('493', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '271|20141|12495|3', null);
INSERT INTO `bitacora` VALUES ('494', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '271|20141|12497|3', null);
INSERT INTO `bitacora` VALUES ('495', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '271|20141|12499|3', null);
INSERT INTO `bitacora` VALUES ('496', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '272|20141|11755|3', null);
INSERT INTO `bitacora` VALUES ('497', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '272|20141|12292|3', null);
INSERT INTO `bitacora` VALUES ('498', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '272|20141|12476|3', null);
INSERT INTO `bitacora` VALUES ('499', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '272|20141|12477|3', null);
INSERT INTO `bitacora` VALUES ('500', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '272|20141|12478|3', null);
INSERT INTO `bitacora` VALUES ('501', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '272|20141|12479|3', null);
INSERT INTO `bitacora` VALUES ('502', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '272|20141|12494|3', null);
INSERT INTO `bitacora` VALUES ('503', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '272|20141|12495|3', null);
INSERT INTO `bitacora` VALUES ('504', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '272|20141|12497|3', null);
INSERT INTO `bitacora` VALUES ('505', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '273|20141|11755|3', null);
INSERT INTO `bitacora` VALUES ('506', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '273|20141|12292|3', null);
INSERT INTO `bitacora` VALUES ('507', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '273|20141|12476|3', null);
INSERT INTO `bitacora` VALUES ('508', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '273|20141|12477|3', null);
INSERT INTO `bitacora` VALUES ('509', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '273|20141|12478|3', null);
INSERT INTO `bitacora` VALUES ('510', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '273|20141|12479|3', null);
INSERT INTO `bitacora` VALUES ('511', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '273|20141|12494|3', null);
INSERT INTO `bitacora` VALUES ('512', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '273|20141|12495|3', null);
INSERT INTO `bitacora` VALUES ('513', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '273|20141|12497|3', null);
INSERT INTO `bitacora` VALUES ('514', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '273|20141|12499|3', null);
INSERT INTO `bitacora` VALUES ('515', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '274|20141|11755|3', null);
INSERT INTO `bitacora` VALUES ('516', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '274|20141|12292|3', null);
INSERT INTO `bitacora` VALUES ('517', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '274|20141|12476|3', null);
INSERT INTO `bitacora` VALUES ('518', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '274|20141|12477|3', null);
INSERT INTO `bitacora` VALUES ('519', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '274|20141|12478|3', null);
INSERT INTO `bitacora` VALUES ('520', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '274|20141|12479|3', null);
INSERT INTO `bitacora` VALUES ('521', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '274|20141|12494|3', null);
INSERT INTO `bitacora` VALUES ('522', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '274|20141|12495|3', null);
INSERT INTO `bitacora` VALUES ('523', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '274|20141|12497|3', null);
INSERT INTO `bitacora` VALUES ('524', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '274|20141|12499|3', null);
INSERT INTO `bitacora` VALUES ('525', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '275|20141|11755|3', null);
INSERT INTO `bitacora` VALUES ('526', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '275|20141|12292|3', null);
INSERT INTO `bitacora` VALUES ('527', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '275|20141|12476|3', null);
INSERT INTO `bitacora` VALUES ('528', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '275|20141|12477|3', null);
INSERT INTO `bitacora` VALUES ('529', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '275|20141|12478|3', null);
INSERT INTO `bitacora` VALUES ('530', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '275|20141|12479|3', null);
INSERT INTO `bitacora` VALUES ('531', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '275|20141|12494|3', null);
INSERT INTO `bitacora` VALUES ('532', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '275|20141|12495|3', null);
INSERT INTO `bitacora` VALUES ('533', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '275|20141|12497|3', null);
INSERT INTO `bitacora` VALUES ('534', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '275|20141|12499|3', null);
INSERT INTO `bitacora` VALUES ('535', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '281|20141|12480|3', null);
INSERT INTO `bitacora` VALUES ('536', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '281|20141|12481|3', null);
INSERT INTO `bitacora` VALUES ('537', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '281|20141|12482|3', null);
INSERT INTO `bitacora` VALUES ('538', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '281|20141|12494|3', null);
INSERT INTO `bitacora` VALUES ('539', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '281|20141|12495|3', null);
INSERT INTO `bitacora` VALUES ('540', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '281|20141|12496|3', null);
INSERT INTO `bitacora` VALUES ('541', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '281|20141|12497|3', null);
INSERT INTO `bitacora` VALUES ('542', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '281|20141|12500|3', null);
INSERT INTO `bitacora` VALUES ('543', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '282|20141|12480|3', null);
INSERT INTO `bitacora` VALUES ('544', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '282|20141|12481|3', null);
INSERT INTO `bitacora` VALUES ('545', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '282|20141|12482|3', null);
INSERT INTO `bitacora` VALUES ('546', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '282|20141|12494|3', null);
INSERT INTO `bitacora` VALUES ('547', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '282|20141|12495|3', null);
INSERT INTO `bitacora` VALUES ('548', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '282|20141|12497|3', null);
INSERT INTO `bitacora` VALUES ('549', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '282|20141|12498|3', null);
INSERT INTO `bitacora` VALUES ('550', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '282|20141|12501|3', null);
INSERT INTO `bitacora` VALUES ('551', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '283|20141|12480|3', null);
INSERT INTO `bitacora` VALUES ('552', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '283|20141|12481|3', null);
INSERT INTO `bitacora` VALUES ('553', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '283|20141|12482|3', null);
INSERT INTO `bitacora` VALUES ('554', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '283|20141|12494|3', null);
INSERT INTO `bitacora` VALUES ('555', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '283|20141|12495|3', null);
INSERT INTO `bitacora` VALUES ('556', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '283|20141|12497|3', null);
INSERT INTO `bitacora` VALUES ('557', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '283|20141|12498|3', null);
INSERT INTO `bitacora` VALUES ('558', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '283|20141|12499|3', null);
INSERT INTO `bitacora` VALUES ('559', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '284|20141|12480|3', null);
INSERT INTO `bitacora` VALUES ('560', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '284|20141|12481|3', null);
INSERT INTO `bitacora` VALUES ('561', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '284|20141|12482|3', null);
INSERT INTO `bitacora` VALUES ('562', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '284|20141|12494|3', null);
INSERT INTO `bitacora` VALUES ('563', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '284|20141|12495|3', null);
INSERT INTO `bitacora` VALUES ('564', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '284|20141|12496|3', null);
INSERT INTO `bitacora` VALUES ('565', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '284|20141|12497|3', null);
INSERT INTO `bitacora` VALUES ('566', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '284|20141|12498|3', null);
INSERT INTO `bitacora` VALUES ('567', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '601|20141|11236|3', null);
INSERT INTO `bitacora` VALUES ('568', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '601|20141|11237|3', null);
INSERT INTO `bitacora` VALUES ('569', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '601|20141|11238|3', null);
INSERT INTO `bitacora` VALUES ('570', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '601|20141|11239|3', null);
INSERT INTO `bitacora` VALUES ('571', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '601|20141|11240|3', null);
INSERT INTO `bitacora` VALUES ('572', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '601|20141|11241|3', null);
INSERT INTO `bitacora` VALUES ('573', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '601|20141|11242|3', null);
INSERT INTO `bitacora` VALUES ('574', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '602|20141|11236|3', null);
INSERT INTO `bitacora` VALUES ('575', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '602|20141|11237|3', null);
INSERT INTO `bitacora` VALUES ('576', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '602|20141|11238|3', null);
INSERT INTO `bitacora` VALUES ('577', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '602|20141|11239|3', null);
INSERT INTO `bitacora` VALUES ('578', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '602|20141|11240|3', null);
INSERT INTO `bitacora` VALUES ('579', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '602|20141|11241|3', null);
INSERT INTO `bitacora` VALUES ('580', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '602|20141|11242|3', null);
INSERT INTO `bitacora` VALUES ('581', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '603|20141|11236|3', null);
INSERT INTO `bitacora` VALUES ('582', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '603|20141|11237|3', null);
INSERT INTO `bitacora` VALUES ('583', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '603|20141|11238|3', null);
INSERT INTO `bitacora` VALUES ('584', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '603|20141|11239|3', null);
INSERT INTO `bitacora` VALUES ('585', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '603|20141|11240|3', null);
INSERT INTO `bitacora` VALUES ('586', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '603|20141|11241|3', null);
INSERT INTO `bitacora` VALUES ('587', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '603|20141|11242|3', null);
INSERT INTO `bitacora` VALUES ('588', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '604|20141|11236|3', null);
INSERT INTO `bitacora` VALUES ('589', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '604|20141|11237|3', null);
INSERT INTO `bitacora` VALUES ('590', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '604|20141|11238|3', null);
INSERT INTO `bitacora` VALUES ('591', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '604|20141|11239|3', null);
INSERT INTO `bitacora` VALUES ('592', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '604|20141|11240|3', null);
INSERT INTO `bitacora` VALUES ('593', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '604|20141|11241|3', null);
INSERT INTO `bitacora` VALUES ('594', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '604|20141|11242|3', null);
INSERT INTO `bitacora` VALUES ('595', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '605|20141|11236|3', null);
INSERT INTO `bitacora` VALUES ('596', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '605|20141|11237|3', null);
INSERT INTO `bitacora` VALUES ('597', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '605|20141|11238|3', null);
INSERT INTO `bitacora` VALUES ('598', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '605|20141|11239|3', null);
INSERT INTO `bitacora` VALUES ('599', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '605|20141|11240|3', null);
INSERT INTO `bitacora` VALUES ('600', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '605|20141|11241|3', null);
INSERT INTO `bitacora` VALUES ('601', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '605|20141|11242|3', null);
INSERT INTO `bitacora` VALUES ('602', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '606|20141|11236|3', null);
INSERT INTO `bitacora` VALUES ('603', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '606|20141|11237|3', null);
INSERT INTO `bitacora` VALUES ('604', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '606|20141|11238|3', null);
INSERT INTO `bitacora` VALUES ('605', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '606|20141|11239|3', null);
INSERT INTO `bitacora` VALUES ('606', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '606|20141|11240|3', null);
INSERT INTO `bitacora` VALUES ('607', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '606|20141|11241|3', null);
INSERT INTO `bitacora` VALUES ('608', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '606|20141|11242|3', null);
INSERT INTO `bitacora` VALUES ('609', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '607|20141|11236|3', null);
INSERT INTO `bitacora` VALUES ('610', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '607|20141|11237|3', null);
INSERT INTO `bitacora` VALUES ('611', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '607|20141|11238|3', null);
INSERT INTO `bitacora` VALUES ('612', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '607|20141|11239|3', null);
INSERT INTO `bitacora` VALUES ('613', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '607|20141|11240|3', null);
INSERT INTO `bitacora` VALUES ('614', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '607|20141|11241|3', null);
INSERT INTO `bitacora` VALUES ('615', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '607|20141|11242|3', null);
INSERT INTO `bitacora` VALUES ('616', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '608|20141|11236|3', null);
INSERT INTO `bitacora` VALUES ('617', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '608|20141|11237|3', null);
INSERT INTO `bitacora` VALUES ('618', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '608|20141|11238|3', null);
INSERT INTO `bitacora` VALUES ('619', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '608|20141|11239|3', null);
INSERT INTO `bitacora` VALUES ('620', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '608|20141|11240|3', null);
INSERT INTO `bitacora` VALUES ('621', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '608|20141|11241|3', null);
INSERT INTO `bitacora` VALUES ('622', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '608|20141|11242|3', null);
INSERT INTO `bitacora` VALUES ('623', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '611|20141|11236|3', null);
INSERT INTO `bitacora` VALUES ('624', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '611|20141|11237|3', null);
INSERT INTO `bitacora` VALUES ('625', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '611|20141|11238|3', null);
INSERT INTO `bitacora` VALUES ('626', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '611|20141|11239|3', null);
INSERT INTO `bitacora` VALUES ('627', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '611|20141|11240|3', null);
INSERT INTO `bitacora` VALUES ('628', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '611|20141|11241|3', null);
INSERT INTO `bitacora` VALUES ('629', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '611|20141|11242|3', null);
INSERT INTO `bitacora` VALUES ('630', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '612|20141|11236|3', null);
INSERT INTO `bitacora` VALUES ('631', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '612|20141|11237|3', null);
INSERT INTO `bitacora` VALUES ('632', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '612|20141|11238|3', null);
INSERT INTO `bitacora` VALUES ('633', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '612|20141|11239|3', null);
INSERT INTO `bitacora` VALUES ('634', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '612|20141|11240|3', null);
INSERT INTO `bitacora` VALUES ('635', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '612|20141|11241|3', null);
INSERT INTO `bitacora` VALUES ('636', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '612|20141|11242|3', null);
INSERT INTO `bitacora` VALUES ('637', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '613|20141|11236|3', null);
INSERT INTO `bitacora` VALUES ('638', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '613|20141|11237|3', null);
INSERT INTO `bitacora` VALUES ('639', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '613|20141|11238|3', null);
INSERT INTO `bitacora` VALUES ('640', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '613|20141|11239|3', null);
INSERT INTO `bitacora` VALUES ('641', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '613|20141|11240|3', null);
INSERT INTO `bitacora` VALUES ('642', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '613|20141|11241|3', null);
INSERT INTO `bitacora` VALUES ('643', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '613|20141|11242|3', null);
INSERT INTO `bitacora` VALUES ('644', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '614|20141|11236|3', null);
INSERT INTO `bitacora` VALUES ('645', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '614|20141|11237|3', null);
INSERT INTO `bitacora` VALUES ('646', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '614|20141|11238|3', null);
INSERT INTO `bitacora` VALUES ('647', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '614|20141|11239|3', null);
INSERT INTO `bitacora` VALUES ('648', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '614|20141|11240|3', null);
INSERT INTO `bitacora` VALUES ('649', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '614|20141|11241|3', null);
INSERT INTO `bitacora` VALUES ('650', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '614|20141|11242|3', null);
INSERT INTO `bitacora` VALUES ('651', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '615|20141|11236|3', null);
INSERT INTO `bitacora` VALUES ('652', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '615|20141|11237|3', null);
INSERT INTO `bitacora` VALUES ('653', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '615|20141|11238|3', null);
INSERT INTO `bitacora` VALUES ('654', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '615|20141|11239|3', null);
INSERT INTO `bitacora` VALUES ('655', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '615|20141|11240|3', null);
INSERT INTO `bitacora` VALUES ('656', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '615|20141|11241|3', null);
INSERT INTO `bitacora` VALUES ('657', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '615|20141|11242|3', null);
INSERT INTO `bitacora` VALUES ('658', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '616|20141|11236|3', null);
INSERT INTO `bitacora` VALUES ('659', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '616|20141|11237|3', null);
INSERT INTO `bitacora` VALUES ('660', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '616|20141|11238|3', null);
INSERT INTO `bitacora` VALUES ('661', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '616|20141|11239|3', null);
INSERT INTO `bitacora` VALUES ('662', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '616|20141|11240|3', null);
INSERT INTO `bitacora` VALUES ('663', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '616|20141|11241|3', null);
INSERT INTO `bitacora` VALUES ('664', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '616|20141|11242|3', null);
INSERT INTO `bitacora` VALUES ('665', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '621|20141|11243|3', null);
INSERT INTO `bitacora` VALUES ('666', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '621|20141|11244|3', null);
INSERT INTO `bitacora` VALUES ('667', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '621|20141|11245|3', null);
INSERT INTO `bitacora` VALUES ('668', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '621|20141|11246|3', null);
INSERT INTO `bitacora` VALUES ('669', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '621|20141|11247|3', null);
INSERT INTO `bitacora` VALUES ('670', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '621|20141|11248|3', null);
INSERT INTO `bitacora` VALUES ('671', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '621|20141|11249|3', null);
INSERT INTO `bitacora` VALUES ('672', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '622|20141|11243|3', null);
INSERT INTO `bitacora` VALUES ('673', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '622|20141|11244|3', null);
INSERT INTO `bitacora` VALUES ('674', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '622|20141|11245|3', null);
INSERT INTO `bitacora` VALUES ('675', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '622|20141|11246|3', null);
INSERT INTO `bitacora` VALUES ('676', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '622|20141|11247|3', null);
INSERT INTO `bitacora` VALUES ('677', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '622|20141|11248|3', null);
INSERT INTO `bitacora` VALUES ('678', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '622|20141|11249|3', null);
INSERT INTO `bitacora` VALUES ('679', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '623|20141|11243|3', null);
INSERT INTO `bitacora` VALUES ('680', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '623|20141|11244|3', null);
INSERT INTO `bitacora` VALUES ('681', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '623|20141|11245|3', null);
INSERT INTO `bitacora` VALUES ('682', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '623|20141|11246|3', null);
INSERT INTO `bitacora` VALUES ('683', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '623|20141|11247|3', null);
INSERT INTO `bitacora` VALUES ('684', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '623|20141|11248|3', null);
INSERT INTO `bitacora` VALUES ('685', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '623|20141|11249|3', null);
INSERT INTO `bitacora` VALUES ('686', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '624|20141|11243|3', null);
INSERT INTO `bitacora` VALUES ('687', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '624|20141|11244|3', null);
INSERT INTO `bitacora` VALUES ('688', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '624|20141|11245|3', null);
INSERT INTO `bitacora` VALUES ('689', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '624|20141|11246|3', null);
INSERT INTO `bitacora` VALUES ('690', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '624|20141|11247|3', null);
INSERT INTO `bitacora` VALUES ('691', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '624|20141|11248|3', null);
INSERT INTO `bitacora` VALUES ('692', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '624|20141|11249|3', null);
INSERT INTO `bitacora` VALUES ('693', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '625|20141|11243|3', null);
INSERT INTO `bitacora` VALUES ('694', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '625|20141|11244|3', null);
INSERT INTO `bitacora` VALUES ('695', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '625|20141|11245|3', null);
INSERT INTO `bitacora` VALUES ('696', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '625|20141|11246|3', null);
INSERT INTO `bitacora` VALUES ('697', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '625|20141|11247|3', null);
INSERT INTO `bitacora` VALUES ('698', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '625|20141|11248|3', null);
INSERT INTO `bitacora` VALUES ('699', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '625|20141|11249|3', null);
INSERT INTO `bitacora` VALUES ('700', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '626|20141|11243|3', null);
INSERT INTO `bitacora` VALUES ('701', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '626|20141|11244|3', null);
INSERT INTO `bitacora` VALUES ('702', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '626|20141|11245|3', null);
INSERT INTO `bitacora` VALUES ('703', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '626|20141|11246|3', null);
INSERT INTO `bitacora` VALUES ('704', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '626|20141|11247|3', null);
INSERT INTO `bitacora` VALUES ('705', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '626|20141|11248|3', null);
INSERT INTO `bitacora` VALUES ('706', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '626|20141|11249|3', null);
INSERT INTO `bitacora` VALUES ('707', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '627|20141|11243|3', null);
INSERT INTO `bitacora` VALUES ('708', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '627|20141|11244|3', null);
INSERT INTO `bitacora` VALUES ('709', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '627|20141|11245|3', null);
INSERT INTO `bitacora` VALUES ('710', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '627|20141|11246|3', null);
INSERT INTO `bitacora` VALUES ('711', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '627|20141|11247|3', null);
INSERT INTO `bitacora` VALUES ('712', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '627|20141|11248|3', null);
INSERT INTO `bitacora` VALUES ('713', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '627|20141|11249|3', null);
INSERT INTO `bitacora` VALUES ('714', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '628|20141|11243|3', null);
INSERT INTO `bitacora` VALUES ('715', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '628|20141|11244|3', null);
INSERT INTO `bitacora` VALUES ('716', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '628|20141|11245|3', null);
INSERT INTO `bitacora` VALUES ('717', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '628|20141|11246|3', null);
INSERT INTO `bitacora` VALUES ('718', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '628|20141|11247|3', null);
INSERT INTO `bitacora` VALUES ('719', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '628|20141|11248|3', null);
INSERT INTO `bitacora` VALUES ('720', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '628|20141|11249|3', null);
INSERT INTO `bitacora` VALUES ('721', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '629|20141|11243|3', null);
INSERT INTO `bitacora` VALUES ('722', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '629|20141|11244|3', null);
INSERT INTO `bitacora` VALUES ('723', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '629|20141|11245|3', null);
INSERT INTO `bitacora` VALUES ('724', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '629|20141|11246|3', null);
INSERT INTO `bitacora` VALUES ('725', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '629|20141|11247|3', null);
INSERT INTO `bitacora` VALUES ('726', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '629|20141|11248|3', null);
INSERT INTO `bitacora` VALUES ('727', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '629|20141|11249|3', null);
INSERT INTO `bitacora` VALUES ('728', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '630|20141|11243|3', null);
INSERT INTO `bitacora` VALUES ('729', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '630|20141|11244|3', null);
INSERT INTO `bitacora` VALUES ('730', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '630|20141|11245|3', null);
INSERT INTO `bitacora` VALUES ('731', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '630|20141|11246|3', null);
INSERT INTO `bitacora` VALUES ('732', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '630|20141|11247|3', null);
INSERT INTO `bitacora` VALUES ('733', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '630|20141|11248|3', null);
INSERT INTO `bitacora` VALUES ('734', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '630|20141|11249|3', null);
INSERT INTO `bitacora` VALUES ('735', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '631|20141|11243|3', null);
INSERT INTO `bitacora` VALUES ('736', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '631|20141|11244|3', null);
INSERT INTO `bitacora` VALUES ('737', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '631|20141|11245|3', null);
INSERT INTO `bitacora` VALUES ('738', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '631|20141|11246|3', null);
INSERT INTO `bitacora` VALUES ('739', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '631|20141|11247|3', null);
INSERT INTO `bitacora` VALUES ('740', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '631|20141|11248|3', null);
INSERT INTO `bitacora` VALUES ('741', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '631|20141|11249|3', null);
INSERT INTO `bitacora` VALUES ('742', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '632|20141|11243|3', null);
INSERT INTO `bitacora` VALUES ('743', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '632|20141|11244|3', null);
INSERT INTO `bitacora` VALUES ('744', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '632|20141|11245|3', null);
INSERT INTO `bitacora` VALUES ('745', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '632|20141|11246|3', null);
INSERT INTO `bitacora` VALUES ('746', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '632|20141|11247|3', null);
INSERT INTO `bitacora` VALUES ('747', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '632|20141|11248|3', null);
INSERT INTO `bitacora` VALUES ('748', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '632|20141|11249|3', null);
INSERT INTO `bitacora` VALUES ('749', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '633|20141|11243|3', null);
INSERT INTO `bitacora` VALUES ('750', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '633|20141|11244|3', null);
INSERT INTO `bitacora` VALUES ('751', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '633|20141|11245|3', null);
INSERT INTO `bitacora` VALUES ('752', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '633|20141|11246|3', null);
INSERT INTO `bitacora` VALUES ('753', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '633|20141|11247|3', null);
INSERT INTO `bitacora` VALUES ('754', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '633|20141|11248|3', null);
INSERT INTO `bitacora` VALUES ('755', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '633|20141|11249|3', null);
INSERT INTO `bitacora` VALUES ('756', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '634|20141|11243|3', null);
INSERT INTO `bitacora` VALUES ('757', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '634|20141|11244|3', null);
INSERT INTO `bitacora` VALUES ('758', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '634|20141|11245|3', null);
INSERT INTO `bitacora` VALUES ('759', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '634|20141|11246|3', null);
INSERT INTO `bitacora` VALUES ('760', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '634|20141|11247|3', null);
INSERT INTO `bitacora` VALUES ('761', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '634|20141|11248|3', null);
INSERT INTO `bitacora` VALUES ('762', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '634|20141|11249|3', null);
INSERT INTO `bitacora` VALUES ('763', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '635|20141|11243|3', null);
INSERT INTO `bitacora` VALUES ('764', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '635|20141|11244|3', null);
INSERT INTO `bitacora` VALUES ('765', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '635|20141|11245|3', null);
INSERT INTO `bitacora` VALUES ('766', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '635|20141|11246|3', null);
INSERT INTO `bitacora` VALUES ('767', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '635|20141|11247|3', null);
INSERT INTO `bitacora` VALUES ('768', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '635|20141|11248|3', null);
INSERT INTO `bitacora` VALUES ('769', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '635|20141|11249|3', null);
INSERT INTO `bitacora` VALUES ('770', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '636|20141|11243|3', null);
INSERT INTO `bitacora` VALUES ('771', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '636|20141|11244|3', null);
INSERT INTO `bitacora` VALUES ('772', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '636|20141|11245|3', null);
INSERT INTO `bitacora` VALUES ('773', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '636|20141|11246|3', null);
INSERT INTO `bitacora` VALUES ('774', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '636|20141|11247|3', null);
INSERT INTO `bitacora` VALUES ('775', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '636|20141|11248|3', null);
INSERT INTO `bitacora` VALUES ('776', 'carga', 'tempo', 'I', '2014-07-24 00:00:00', '636|20141|11249|3', null);
INSERT INTO `bitacora` VALUES ('777', 'grupos', 'tempo', 'I', '2014-08-06 00:00:00', '231|20142|20101|4|1', null);
INSERT INTO `bitacora` VALUES ('778', 'grupos', 'tempo', 'I', '2014-08-06 00:00:00', '232|20142|20101|4|1', null);
INSERT INTO `bitacora` VALUES ('779', 'grupos', 'tempo', 'I', '2014-08-06 00:00:00', '243|20142|20092|4|1', null);
INSERT INTO `bitacora` VALUES ('780', 'grupos', 'tempo', 'I', '2014-08-06 00:00:00', '233|20142|20101|4|1', null);
INSERT INTO `bitacora` VALUES ('781', 'grupos', 'tempo', 'I', '2014-08-06 00:00:00', '111|20142|20101|4|1', null);
INSERT INTO `bitacora` VALUES ('782', 'grupos', 'tempo', 'I', '2014-08-06 00:00:00', '211|20142|20101|4|1', null);
INSERT INTO `bitacora` VALUES ('783', 'grupos', 'tempo', 'I', '2014-08-06 00:00:00', '311|20142|20101|4|1', null);
INSERT INTO `bitacora` VALUES ('784', 'grupos', 'tempo', 'I', '2014-08-06 00:00:00', '411|20142|20101|4|1', null);
INSERT INTO `bitacora` VALUES ('785', 'grupos', 'tempo', 'I', '2014-08-06 00:00:00', '511|20142|20101|4|1', null);
INSERT INTO `bitacora` VALUES ('786', 'carga', 'tempo', 'I', '2014-08-06 00:00:00', '111|20142|11249|3', null);
INSERT INTO `bitacora` VALUES ('787', 'carga', 'tempo', 'I', '2014-08-06 00:00:00', '111|20142|11251|3', null);
INSERT INTO `bitacora` VALUES ('788', 'carga', 'tempo', 'I', '2014-08-06 00:00:00', '111|20142|11252|3', null);
INSERT INTO `bitacora` VALUES ('789', 'carga', 'tempo', 'I', '2014-08-06 00:00:00', '211|20142|11249|3', null);
INSERT INTO `bitacora` VALUES ('790', 'carga', 'tempo', 'I', '2014-08-06 00:00:00', '211|20142|11251|3', null);
INSERT INTO `bitacora` VALUES ('791', 'carga', 'tempo', 'I', '2014-08-06 00:00:00', '211|20142|11252|3', null);
INSERT INTO `bitacora` VALUES ('792', 'carga', 'tempo', 'I', '2014-08-06 00:00:00', '311|20142|11249|3', null);
INSERT INTO `bitacora` VALUES ('793', 'carga', 'tempo', 'I', '2014-08-06 00:00:00', '311|20142|11251|3', null);
INSERT INTO `bitacora` VALUES ('794', 'carga', 'tempo', 'I', '2014-08-06 00:00:00', '311|20142|11252|3', null);
INSERT INTO `bitacora` VALUES ('795', 'carga', 'tempo', 'I', '2014-08-06 00:00:00', '231|20142|11235|3', null);
INSERT INTO `bitacora` VALUES ('796', 'carga', 'tempo', 'I', '2014-08-06 00:00:00', '231|20142|11257|3', null);
INSERT INTO `bitacora` VALUES ('797', 'carga', 'tempo', 'I', '2014-08-06 00:00:00', '231|20142|11258|3', null);
INSERT INTO `bitacora` VALUES ('798', 'carga', 'tempo', 'I', '2014-08-06 00:00:00', '231|20142|11259|3', null);
INSERT INTO `bitacora` VALUES ('799', 'carga', 'tempo', 'I', '2014-08-06 00:00:00', '231|20142|11260|3', null);
INSERT INTO `bitacora` VALUES ('800', 'carga', 'tempo', 'I', '2014-08-06 00:00:00', '232|20142|11235|3', null);
INSERT INTO `bitacora` VALUES ('801', 'carga', 'tempo', 'I', '2014-08-06 00:00:00', '232|20142|11257|3', null);
INSERT INTO `bitacora` VALUES ('802', 'carga', 'tempo', 'I', '2014-08-06 00:00:00', '232|20142|11258|3', null);
INSERT INTO `bitacora` VALUES ('803', 'carga', 'tempo', 'I', '2014-08-06 00:00:00', '232|20142|11259|3', null);
INSERT INTO `bitacora` VALUES ('804', 'carga', 'tempo', 'I', '2014-08-06 00:00:00', '232|20142|11260|3', null);
INSERT INTO `bitacora` VALUES ('805', 'grupos', 'tempo', 'I', '2014-08-06 00:00:00', '121|20142|20101|4|1', null);
INSERT INTO `bitacora` VALUES ('806', 'grupos', 'tempo', 'I', '2014-08-06 00:00:00', '222|20142|20101|4|1', null);
INSERT INTO `bitacora` VALUES ('807', 'grupos', 'tempo', 'I', '2014-08-06 00:00:00', '321|20142|20101|4|1', null);
INSERT INTO `bitacora` VALUES ('808', 'grupos', 'tempo', 'I', '2014-08-06 00:00:00', '421|20142|20101|4|1', null);
INSERT INTO `bitacora` VALUES ('809', 'carga', 'tempo', 'I', '2014-08-06 00:00:00', '121|20142|11235|3', null);
INSERT INTO `bitacora` VALUES ('810', 'carga', 'tempo', 'I', '2014-08-06 00:00:00', '121|20142|11237|3', null);
INSERT INTO `bitacora` VALUES ('811', 'carga', 'tempo', 'I', '2014-08-06 00:00:00', '121|20142|11238|3', null);
INSERT INTO `bitacora` VALUES ('812', 'carga', 'tempo', 'I', '2014-08-06 00:00:00', '121|20142|11240|3', null);
INSERT INTO `bitacora` VALUES ('813', 'carga', 'tempo', 'I', '2014-08-06 00:00:00', '121|20142|11249|3', null);
INSERT INTO `bitacora` VALUES ('814', 'carga', 'tempo', 'I', '2014-08-06 00:00:00', '121|20142|11251|3', null);
INSERT INTO `bitacora` VALUES ('815', 'carga', 'tempo', 'I', '2014-08-06 00:00:00', '222|20142|11235|3', null);
INSERT INTO `bitacora` VALUES ('816', 'carga', 'tempo', 'I', '2014-08-06 00:00:00', '222|20142|11237|3', null);
INSERT INTO `bitacora` VALUES ('817', 'carga', 'tempo', 'I', '2014-08-06 00:00:00', '222|20142|11238|3', null);
INSERT INTO `bitacora` VALUES ('818', 'carga', 'tempo', 'I', '2014-08-06 00:00:00', '222|20142|11240|3', null);
INSERT INTO `bitacora` VALUES ('819', 'carga', 'tempo', 'I', '2014-08-06 00:00:00', '222|20142|11249|3', null);
INSERT INTO `bitacora` VALUES ('820', 'carga', 'tempo', 'I', '2014-08-06 00:00:00', '222|20142|11251|3', null);
INSERT INTO `bitacora` VALUES ('821', 'carga', 'tempo', 'I', '2014-08-06 00:00:00', '321|20142|11235|3', null);
INSERT INTO `bitacora` VALUES ('822', 'carga', 'tempo', 'I', '2014-08-06 00:00:00', '321|20142|11237|3', null);
INSERT INTO `bitacora` VALUES ('823', 'carga', 'tempo', 'I', '2014-08-06 00:00:00', '321|20142|11238|3', null);
INSERT INTO `bitacora` VALUES ('824', 'carga', 'tempo', 'I', '2014-08-06 00:00:00', '321|20142|11240|3', null);
INSERT INTO `bitacora` VALUES ('825', 'carga', 'tempo', 'I', '2014-08-06 00:00:00', '321|20142|11249|3', null);
INSERT INTO `bitacora` VALUES ('826', 'carga', 'tempo', 'I', '2014-08-06 00:00:00', '321|20142|11251|3', null);
INSERT INTO `bitacora` VALUES ('827', 'carga', 'tempo', 'I', '2014-08-06 00:00:00', '421|20142|11235|3', null);
INSERT INTO `bitacora` VALUES ('828', 'carga', 'tempo', 'I', '2014-08-06 00:00:00', '421|20142|11237|3', null);
INSERT INTO `bitacora` VALUES ('829', 'carga', 'tempo', 'I', '2014-08-06 00:00:00', '421|20142|11238|3', null);
INSERT INTO `bitacora` VALUES ('830', 'carga', 'tempo', 'I', '2014-08-06 00:00:00', '421|20142|11240|3', null);
INSERT INTO `bitacora` VALUES ('831', 'carga', 'tempo', 'I', '2014-08-06 00:00:00', '421|20142|11249|3', null);
INSERT INTO `bitacora` VALUES ('832', 'carga', 'tempo', 'I', '2014-08-06 00:00:00', '421|20142|11251|3', null);

-- ----------------------------
-- Table structure for campus
-- ----------------------------
DROP TABLE IF EXISTS `campus`;
CREATE TABLE `campus` (
  `campus` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo campus',
  `descripcion` varchar(20) NOT NULL COMMENT 'Descripcion CAMPUS.',
  `direccion` varchar(60) DEFAULT NULL COMMENT 'Direccion CAMPUS',
  `ciudad` int(11) NOT NULL COMMENT 'Codigo ciudad',
  PRIMARY KEY (`campus`),
  UNIQUE KEY `CM_codigo_UNIQUE` (`campus`),
  KEY `fk_campus_ciudad1` (`ciudad`),
  CONSTRAINT `fk_campus_ciudad1` FOREIGN KEY (`ciudad`) REFERENCES `ciudad` (`ciudad`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COMMENT='<double-click to overwrite multiple objects>';

-- ----------------------------
-- Records of campus
-- ----------------------------
INSERT INTO `campus` VALUES ('1', 'TIJUANA UNIDAD OTAY', 'CALZADA UNIVERSIDAD 14418 PARQUE INDUSTRIAL INTERNACIONAL TI', '16');
INSERT INTO `campus` VALUES ('2', 'TIJUANA UNIDAD TECAT', 'CALZADA UNIVERSIDAD NO.1 FRACC. SAN FERNANDO. C.P. 21460', '16');
INSERT INTO `campus` VALUES ('3', 'TIJUANA UNIDAD ROSAR', 'BLVD. MARIANO VERDUGO NORTE ENTRE CALLE ISLA LOBO VERACRUZ Y', '16');
INSERT INTO `campus` VALUES ('4', 'TIJUANA UNIDAD VALLE', 'BLVD. UNIVERSITARIO #1000', '16');

-- ----------------------------
-- Table structure for caracter
-- ----------------------------
DROP TABLE IF EXISTS `caracter`;
CREATE TABLE `caracter` (
  `caracter` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Caracter de materia uaprendizaje (1,2)',
  `descripcion` varchar(15) NOT NULL COMMENT '1=Obligatoria/2=Optativa',
  PRIMARY KEY (`caracter`),
  UNIQUE KEY `CAR_codigo_UNIQUE` (`caracter`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COMMENT='<double-click to overwrite multiple objects>';

-- ----------------------------
-- Records of caracter
-- ----------------------------
INSERT INTO `caracter` VALUES ('1', 'OBLIGATORIA');
INSERT INTO `caracter` VALUES ('2', 'OPTATIVA');

-- ----------------------------
-- Table structure for carga
-- ----------------------------
DROP TABLE IF EXISTS `carga`;
CREATE TABLE `carga` (
  `grupo` int(11) NOT NULL COMMENT 'Código grupo',
  `periodo` int(11) NOT NULL COMMENT 'Periodo de trabajo(Año 4 digitos+ semestre o cuatrim) ej. 20091,20092',
  `uaprendizaje` int(11) NOT NULL COMMENT 'Código uaprendizaje (SOLO NUMERICOS)',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT 'Status carga grupo 1=Capturado,2=Completado,3 En proceso',
  PRIMARY KEY (`grupo`,`periodo`,`uaprendizaje`),
  KEY `fk_carga_grupos2` (`periodo`),
  KEY `fk_carga_uaprendizaje1` (`uaprendizaje`),
  KEY `fk_carga_status1` (`status`),
  CONSTRAINT `fk_carga_grupos1` FOREIGN KEY (`grupo`) REFERENCES `grupos` (`grupo`),
  CONSTRAINT `fk_carga_grupos2` FOREIGN KEY (`periodo`) REFERENCES `grupos` (`periodo`),
  CONSTRAINT `fk_carga_status1` FOREIGN KEY (`status`) REFERENCES `status` (`status`),
  CONSTRAINT `fk_carga_uaprendizaje1` FOREIGN KEY (`uaprendizaje`) REFERENCES `uaprendizaje` (`uaprendizaje`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of carga
-- ----------------------------
INSERT INTO `carga` VALUES ('111', '20142', '11249', '3');
INSERT INTO `carga` VALUES ('111', '20142', '11251', '3');
INSERT INTO `carga` VALUES ('111', '20142', '11252', '3');
INSERT INTO `carga` VALUES ('121', '20142', '11235', '3');
INSERT INTO `carga` VALUES ('121', '20142', '11237', '3');
INSERT INTO `carga` VALUES ('121', '20142', '11238', '3');
INSERT INTO `carga` VALUES ('121', '20142', '11240', '3');
INSERT INTO `carga` VALUES ('121', '20142', '11249', '3');
INSERT INTO `carga` VALUES ('121', '20142', '11251', '3');
INSERT INTO `carga` VALUES ('211', '20142', '11249', '3');
INSERT INTO `carga` VALUES ('211', '20142', '11251', '3');
INSERT INTO `carga` VALUES ('211', '20142', '11252', '3');
INSERT INTO `carga` VALUES ('222', '20142', '11235', '3');
INSERT INTO `carga` VALUES ('222', '20142', '11237', '3');
INSERT INTO `carga` VALUES ('222', '20142', '11238', '3');
INSERT INTO `carga` VALUES ('222', '20142', '11240', '3');
INSERT INTO `carga` VALUES ('222', '20142', '11249', '3');
INSERT INTO `carga` VALUES ('222', '20142', '11251', '3');
INSERT INTO `carga` VALUES ('231', '20142', '11235', '3');
INSERT INTO `carga` VALUES ('231', '20142', '11257', '3');
INSERT INTO `carga` VALUES ('231', '20142', '11258', '3');
INSERT INTO `carga` VALUES ('231', '20142', '11259', '3');
INSERT INTO `carga` VALUES ('231', '20142', '11260', '3');
INSERT INTO `carga` VALUES ('232', '20142', '11235', '3');
INSERT INTO `carga` VALUES ('232', '20142', '11257', '3');
INSERT INTO `carga` VALUES ('232', '20142', '11258', '3');
INSERT INTO `carga` VALUES ('232', '20142', '11259', '3');
INSERT INTO `carga` VALUES ('232', '20142', '11260', '3');
INSERT INTO `carga` VALUES ('311', '20142', '11249', '3');
INSERT INTO `carga` VALUES ('311', '20142', '11251', '3');
INSERT INTO `carga` VALUES ('311', '20142', '11252', '3');
INSERT INTO `carga` VALUES ('321', '20142', '11235', '3');
INSERT INTO `carga` VALUES ('321', '20142', '11237', '3');
INSERT INTO `carga` VALUES ('321', '20142', '11238', '3');
INSERT INTO `carga` VALUES ('321', '20142', '11240', '3');
INSERT INTO `carga` VALUES ('321', '20142', '11249', '3');
INSERT INTO `carga` VALUES ('321', '20142', '11251', '3');
INSERT INTO `carga` VALUES ('421', '20142', '11235', '3');
INSERT INTO `carga` VALUES ('421', '20142', '11237', '3');
INSERT INTO `carga` VALUES ('421', '20142', '11238', '3');
INSERT INTO `carga` VALUES ('421', '20142', '11240', '3');
INSERT INTO `carga` VALUES ('421', '20142', '11249', '3');
INSERT INTO `carga` VALUES ('421', '20142', '11251', '3');

-- ----------------------------
-- Table structure for ciudad
-- ----------------------------
DROP TABLE IF EXISTS `ciudad`;
CREATE TABLE `ciudad` (
  `ciudad` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo Ciudad',
  `descripcion` varchar(60) NOT NULL COMMENT 'Descripcion Ciudad',
  `estado` int(11) NOT NULL COMMENT 'Codigo estado',
  PRIMARY KEY (`ciudad`),
  UNIQUE KEY `CD_codigo_UNIQUE` (`ciudad`),
  KEY `fk_ciudad_estado1` (`estado`),
  CONSTRAINT `fk_ciudad_estado1` FOREIGN KEY (`estado`) REFERENCES `estado` (`estado`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=651 DEFAULT CHARSET=latin1 COMMENT='<double-click to overwrite multiple objects>';

-- ----------------------------
-- Records of ciudad
-- ----------------------------
INSERT INTO `ciudad` VALUES ('1', 'AGUASCALIENTES', '1');
INSERT INTO `ciudad` VALUES ('2', 'ASIENTOS', '1');
INSERT INTO `ciudad` VALUES ('3', 'CALVILLO', '1');
INSERT INTO `ciudad` VALUES ('4', 'COSÃO', '1');
INSERT INTO `ciudad` VALUES ('5', 'JESÃšS MARÃA', '1');
INSERT INTO `ciudad` VALUES ('6', 'PABELLÃ“N DE ARTEAGA', '1');
INSERT INTO `ciudad` VALUES ('7', 'RINCÃ“N DE ROMOS', '1');
INSERT INTO `ciudad` VALUES ('8', 'SAN FRANCISCO DE LOS ROMO', '1');
INSERT INTO `ciudad` VALUES ('9', 'TEPEZALÃ', '1');
INSERT INTO `ciudad` VALUES ('10', 'ENSENADA', '2');
INSERT INTO `ciudad` VALUES ('11', 'MEXICALI', '2');
INSERT INTO `ciudad` VALUES ('12', 'PLAYAS DE ROSARITO', '2');
INSERT INTO `ciudad` VALUES ('13', 'RODOLFO SÃNCHEZ T. (MANEADERO)', '2');
INSERT INTO `ciudad` VALUES ('14', 'SAN FELIPE', '2');
INSERT INTO `ciudad` VALUES ('15', 'TECATE', '2');
INSERT INTO `ciudad` VALUES ('16', 'TIJUANA', '2');
INSERT INTO `ciudad` VALUES ('17', 'CABO SAN LUCAS', '3');
INSERT INTO `ciudad` VALUES ('18', 'CIUDAD CONSTITUCIÃ“N', '3');
INSERT INTO `ciudad` VALUES ('19', 'GUERRERO NEGRO', '3');
INSERT INTO `ciudad` VALUES ('20', 'HEROICA MULEGÃ‰', '3');
INSERT INTO `ciudad` VALUES ('21', 'LA PAZ', '3');
INSERT INTO `ciudad` VALUES ('22', 'LORETO', '3');
INSERT INTO `ciudad` VALUES ('23', 'PUERTO ADOLFO LÃ“PEZ MATEOS', '3');
INSERT INTO `ciudad` VALUES ('24', 'SAN IGNACIO', '3');
INSERT INTO `ciudad` VALUES ('25', 'SAN JOSÃ‰ DEL CABO', '3');
INSERT INTO `ciudad` VALUES ('26', 'TODOS SANTOS', '3');
INSERT INTO `ciudad` VALUES ('27', 'VILLA ALBERTO ANDRÃ‰S ALVARADO ARÃMBURO', '3');
INSERT INTO `ciudad` VALUES ('28', 'CALKINI', '4');
INSERT INTO `ciudad` VALUES ('29', 'CANDELARIA', '4');
INSERT INTO `ciudad` VALUES ('30', 'CHAMPOTÃ“N', '4');
INSERT INTO `ciudad` VALUES ('31', 'CIUDAD DEL CARMEN', '4');
INSERT INTO `ciudad` VALUES ('32', 'ESCÃRCEGA', '4');
INSERT INTO `ciudad` VALUES ('33', 'HECELCHAKÃN', '4');
INSERT INTO `ciudad` VALUES ('34', 'HOPELCHÃ‰N', '4');
INSERT INTO `ciudad` VALUES ('35', 'POMUCH', '4');
INSERT INTO `ciudad` VALUES ('36', 'SABANCUY', '4');
INSERT INTO `ciudad` VALUES ('37', 'SAN FRANCISCO DE CAMPECHE', '4');
INSERT INTO `ciudad` VALUES ('38', 'ALLENDE', '5');
INSERT INTO `ciudad` VALUES ('39', 'ARTEAGA', '5');
INSERT INTO `ciudad` VALUES ('40', 'CASTAÃ‘OS', '5');
INSERT INTO `ciudad` VALUES ('41', 'CIUDAD ACUÃ‘A', '5');
INSERT INTO `ciudad` VALUES ('42', 'CIUDAD MELCHOR MÃšZQUIZ', '5');
INSERT INTO `ciudad` VALUES ('43', 'CUATRO CIÃ‰NEGAS DE CARRANZA', '5');
INSERT INTO `ciudad` VALUES ('44', 'FRANCISCO I. MADERO (CHÃVEZ)', '5');
INSERT INTO `ciudad` VALUES ('45', 'FRONTERA', '5');
INSERT INTO `ciudad` VALUES ('46', 'MATAMOROS', '5');
INSERT INTO `ciudad` VALUES ('47', 'MONCLOVA', '5');
INSERT INTO `ciudad` VALUES ('48', 'MORELOS', '5');
INSERT INTO `ciudad` VALUES ('49', 'NADADORES', '5');
INSERT INTO `ciudad` VALUES ('50', 'NAVA', '5');
INSERT INTO `ciudad` VALUES ('51', 'NUEVA ROSITA', '5');
INSERT INTO `ciudad` VALUES ('52', 'PARRAS DE LA FUENTE', '5');
INSERT INTO `ciudad` VALUES ('53', 'PIEDRAS NEGRAS', '5');
INSERT INTO `ciudad` VALUES ('54', 'RAMOS ARIZPE', '5');
INSERT INTO `ciudad` VALUES ('55', 'SABINAS', '5');
INSERT INTO `ciudad` VALUES ('56', 'SALTILLO', '5');
INSERT INTO `ciudad` VALUES ('57', 'SAN BUENAVENTURA', '5');
INSERT INTO `ciudad` VALUES ('58', 'SAN PEDRO', '5');
INSERT INTO `ciudad` VALUES ('59', 'TORREÃ“N', '5');
INSERT INTO `ciudad` VALUES ('60', 'VIESCA', '5');
INSERT INTO `ciudad` VALUES ('61', 'ZARAGOZA', '5');
INSERT INTO `ciudad` VALUES ('62', 'CIUDAD DE ARMERÃA', '6');
INSERT INTO `ciudad` VALUES ('63', 'CIUDAD DE VILLA DE ÃLVAREZ', '6');
INSERT INTO `ciudad` VALUES ('64', 'CIUDAD DE VILLA DE ÃLVAREZ', '6');
INSERT INTO `ciudad` VALUES ('65', 'COLIMA', '6');
INSERT INTO `ciudad` VALUES ('66', 'MANZANILLO', '6');
INSERT INTO `ciudad` VALUES ('67', 'TECOMAN', '6');
INSERT INTO `ciudad` VALUES ('68', 'ACALA', '7');
INSERT INTO `ciudad` VALUES ('69', 'ARRIAGA', '7');
INSERT INTO `ciudad` VALUES ('70', 'CACAHOATÃN', '7');
INSERT INTO `ciudad` VALUES ('71', 'CHIAPA DE CORZO', '7');
INSERT INTO `ciudad` VALUES ('72', 'CINTALAPA DE FIGUEROA', '7');
INSERT INTO `ciudad` VALUES ('73', 'COMITÃN DE DOMÃNGUEZ', '7');
INSERT INTO `ciudad` VALUES ('74', 'HUIXTLA', '7');
INSERT INTO `ciudad` VALUES ('75', 'JIQUIPILAS', '7');
INSERT INTO `ciudad` VALUES ('76', 'LAS MARGARITAS', '7');
INSERT INTO `ciudad` VALUES ('77', 'LAS ROSAS', '7');
INSERT INTO `ciudad` VALUES ('78', 'MAPASTEPEC', '7');
INSERT INTO `ciudad` VALUES ('79', 'MOTOZINTLA DE MENDOZA', '7');
INSERT INTO `ciudad` VALUES ('80', 'OCOSINGO', '7');
INSERT INTO `ciudad` VALUES ('81', 'OCOZOCOAUTLA DE ESPINOSA', '7');
INSERT INTO `ciudad` VALUES ('82', 'PALENQUE', '7');
INSERT INTO `ciudad` VALUES ('83', 'PICHUCALCO', '7');
INSERT INTO `ciudad` VALUES ('84', 'PIJIJIAPAN', '7');
INSERT INTO `ciudad` VALUES ('85', 'PUERTO MADERO (SAN BENITO)', '7');
INSERT INTO `ciudad` VALUES ('86', 'REFORMA', '7');
INSERT INTO `ciudad` VALUES ('87', 'SAN CRISTÃ“BAL DE LAS CASAS', '7');
INSERT INTO `ciudad` VALUES ('88', 'TAPACHULA DE CÃ“RDOVA Y ORDÃ“Ã‘EZ', '7');
INSERT INTO `ciudad` VALUES ('89', 'TONALÃ', '7');
INSERT INTO `ciudad` VALUES ('90', 'TUXTLA GUTIÃ‰RREZ', '7');
INSERT INTO `ciudad` VALUES ('91', 'VENUSTIANO CARRANZA', '7');
INSERT INTO `ciudad` VALUES ('92', 'VILLAFLORES', '7');
INSERT INTO `ciudad` VALUES ('93', 'BACHÃNIVA', '8');
INSERT INTO `ciudad` VALUES ('94', 'CHIHUAHUA', '8');
INSERT INTO `ciudad` VALUES ('95', 'COLONIA ANÃHUAC', '8');
INSERT INTO `ciudad` VALUES ('96', 'CUAUHTÃ‰MOC', '8');
INSERT INTO `ciudad` VALUES ('97', 'DELICIAS', '8');
INSERT INTO `ciudad` VALUES ('98', 'HIDALGO DEL PARRAL', '8');
INSERT INTO `ciudad` VALUES ('99', 'JOSÃ‰ MARIANO JIMÃ‰NEZ', '8');
INSERT INTO `ciudad` VALUES ('100', 'JUAN ALDAMA', '8');
INSERT INTO `ciudad` VALUES ('101', 'JUÃREZ', '8');
INSERT INTO `ciudad` VALUES ('102', 'MADERA', '8');
INSERT INTO `ciudad` VALUES ('103', 'MANUEL OJINAGA', '8');
INSERT INTO `ciudad` VALUES ('104', 'NUEVO CASAS GRANDES', '8');
INSERT INTO `ciudad` VALUES ('105', 'SANTA ROSALÃA DE CAMARGO', '8');
INSERT INTO `ciudad` VALUES ('106', 'SAUCILLO', '8');
INSERT INTO `ciudad` VALUES ('107', 'CIUDAD DE MÃ‰XICO', '9');
INSERT INTO `ciudad` VALUES ('108', 'CANATLÃN', '10');
INSERT INTO `ciudad` VALUES ('109', 'CIUDAD LERDO', '10');
INSERT INTO `ciudad` VALUES ('110', 'EL SALTO', '10');
INSERT INTO `ciudad` VALUES ('111', 'FRANCISCO I. MADERO', '10');
INSERT INTO `ciudad` VALUES ('112', 'GÃ“MEZ PALACIO', '10');
INSERT INTO `ciudad` VALUES ('113', 'NOMBRE DE DIOS', '10');
INSERT INTO `ciudad` VALUES ('114', 'PEÃ‘Ã“N BLANCO', '10');
INSERT INTO `ciudad` VALUES ('115', 'SAN JUAN DEL RÃO DEL CENTAURO DEL NORTE', '10');
INSERT INTO `ciudad` VALUES ('116', 'SANTA MARÃA DEL ORO', '10');
INSERT INTO `ciudad` VALUES ('117', 'SANTIAGO PAPASQUIARO', '10');
INSERT INTO `ciudad` VALUES ('118', 'VICENTE GUERRERO', '10');
INSERT INTO `ciudad` VALUES ('119', 'VICTORIA DE DURANGO', '10');
INSERT INTO `ciudad` VALUES ('120', 'ABASOLO', '11');
INSERT INTO `ciudad` VALUES ('121', 'ACÃMBARO', '11');
INSERT INTO `ciudad` VALUES ('122', 'APASEO EL ALTO', '11');
INSERT INTO `ciudad` VALUES ('123', 'APASEO EL GRANDE', '11');
INSERT INTO `ciudad` VALUES ('124', 'CELAYA', '11');
INSERT INTO `ciudad` VALUES ('125', 'CIUDAD MANUEL DOBLADO', '11');
INSERT INTO `ciudad` VALUES ('126', 'COMONFORT', '11');
INSERT INTO `ciudad` VALUES ('127', 'CORTAZAR', '11');
INSERT INTO `ciudad` VALUES ('128', 'CUERÃMARO', '11');
INSERT INTO `ciudad` VALUES ('129', 'DOCTOR MORA', '11');
INSERT INTO `ciudad` VALUES ('130', 'DOLORES HIDALGO CUNA DE LA INDEPENDENCIA NACIONAL', '11');
INSERT INTO `ciudad` VALUES ('131', 'EMPALME ESCOBEDO (ESCOBEDO)', '11');
INSERT INTO `ciudad` VALUES ('132', 'GUANAJUATO', '11');
INSERT INTO `ciudad` VALUES ('133', 'HUANÃMARO', '11');
INSERT INTO `ciudad` VALUES ('134', 'IRAPUATO', '11');
INSERT INTO `ciudad` VALUES ('135', 'JARAL DEL PROGRESO', '11');
INSERT INTO `ciudad` VALUES ('136', 'JERÃ‰CUARO', '11');
INSERT INTO `ciudad` VALUES ('137', 'LEÃ“N DE LOS ALDAMA', '11');
INSERT INTO `ciudad` VALUES ('138', 'MARFIL', '11');
INSERT INTO `ciudad` VALUES ('139', 'MOROLEÃ“N', '11');
INSERT INTO `ciudad` VALUES ('140', 'PÃ‰NJAMO', '11');
INSERT INTO `ciudad` VALUES ('141', 'PURÃSIMA DE BUSTOS', '11');
INSERT INTO `ciudad` VALUES ('142', 'RINCÃ“N DE TAMAYO', '11');
INSERT INTO `ciudad` VALUES ('143', 'ROMITA', '11');
INSERT INTO `ciudad` VALUES ('144', 'SALAMANCA', '11');
INSERT INTO `ciudad` VALUES ('145', 'SALVATIERRA', '11');
INSERT INTO `ciudad` VALUES ('146', 'SAN DIEGO DE LA UNIÃ“N', '11');
INSERT INTO `ciudad` VALUES ('147', 'SAN FRANCISCO DEL RINCÃ“N', '11');
INSERT INTO `ciudad` VALUES ('148', 'SAN JOSÃ‰ ITURBIDE', '11');
INSERT INTO `ciudad` VALUES ('149', 'SAN LUIS DE LA PAZ', '11');
INSERT INTO `ciudad` VALUES ('150', 'SAN MIGUEL DE ALLENDE', '11');
INSERT INTO `ciudad` VALUES ('151', 'SANTA CRUZ JUVENTINO ROSAS', '11');
INSERT INTO `ciudad` VALUES ('152', 'SANTIAGO MARAVATÃO', '11');
INSERT INTO `ciudad` VALUES ('153', 'SILAO', '11');
INSERT INTO `ciudad` VALUES ('154', 'TARANDACUAO', '11');
INSERT INTO `ciudad` VALUES ('155', 'URIANGATO', '11');
INSERT INTO `ciudad` VALUES ('156', 'VALLE DE SANTIAGO', '11');
INSERT INTO `ciudad` VALUES ('157', 'VILLAGRÃN', '11');
INSERT INTO `ciudad` VALUES ('158', 'YURIRIA', '11');
INSERT INTO `ciudad` VALUES ('159', 'ACAPULCO DE JUÃREZ', '12');
INSERT INTO `ciudad` VALUES ('160', 'ARCELIA', '12');
INSERT INTO `ciudad` VALUES ('161', 'ATOYAC DE ÃLVAREZ', '12');
INSERT INTO `ciudad` VALUES ('162', 'AYUTLA DE LOS LIBRES', '12');
INSERT INTO `ciudad` VALUES ('163', 'AZOYÃš', '12');
INSERT INTO `ciudad` VALUES ('164', 'BUENAVISTA DE CUELLAR', '12');
INSERT INTO `ciudad` VALUES ('165', 'CHILAPA DE ÃLVAREZ', '12');
INSERT INTO `ciudad` VALUES ('166', 'CHILPANCINGO DE LOS BRAVO', '12');
INSERT INTO `ciudad` VALUES ('167', 'CIUDAD ALTAMIRANO', '12');
INSERT INTO `ciudad` VALUES ('168', 'CIUDAD APAXTLA DE CASTREJÃ“N', '12');
INSERT INTO `ciudad` VALUES ('169', 'COPALA', '12');
INSERT INTO `ciudad` VALUES ('170', 'COYUCA DE BENÃTEZ', '12');
INSERT INTO `ciudad` VALUES ('171', 'COYUCA DE CATALÃN', '12');
INSERT INTO `ciudad` VALUES ('172', 'CRUZ GRANDE', '12');
INSERT INTO `ciudad` VALUES ('173', 'CUAJINICUILAPA', '12');
INSERT INTO `ciudad` VALUES ('174', 'CUTZAMALA DE PINZÃ“N', '12');
INSERT INTO `ciudad` VALUES ('175', 'HUAMUXTITLAN', '12');
INSERT INTO `ciudad` VALUES ('176', 'HUITZUCO', '12');
INSERT INTO `ciudad` VALUES ('177', 'IGUALA DE LA INDEPENDENCIA', '12');
INSERT INTO `ciudad` VALUES ('178', 'LA UNIÃ“N', '12');
INSERT INTO `ciudad` VALUES ('179', 'MARQUELIA', '12');
INSERT INTO `ciudad` VALUES ('180', 'OCOTITO', '12');
INSERT INTO `ciudad` VALUES ('181', 'OLINALÃ', '12');
INSERT INTO `ciudad` VALUES ('182', 'PETATLÃN', '12');
INSERT INTO `ciudad` VALUES ('183', 'SAN JERÃ“NIMO DE JUÃREZ', '12');
INSERT INTO `ciudad` VALUES ('184', 'SAN LUIS ACATLÃN', '12');
INSERT INTO `ciudad` VALUES ('185', 'SAN LUIS DE LA LOMA', '12');
INSERT INTO `ciudad` VALUES ('186', 'SAN LUIS SAN PEDRO', '12');
INSERT INTO `ciudad` VALUES ('187', 'SAN MARCOS', '12');
INSERT INTO `ciudad` VALUES ('188', 'TAXCO DE ALARCÃ“N', '12');
INSERT INTO `ciudad` VALUES ('189', 'TÃ‰CPAN DE GALEANA', '12');
INSERT INTO `ciudad` VALUES ('190', 'TELOLOAPAN', '12');
INSERT INTO `ciudad` VALUES ('191', 'TEPECOACUILCO DE TRUJANO', '12');
INSERT INTO `ciudad` VALUES ('192', 'TIERRA COLORADA', '12');
INSERT INTO `ciudad` VALUES ('193', 'TIXTLA DE GUERRERO', '12');
INSERT INTO `ciudad` VALUES ('194', 'TLALIXTAQUILLA', '12');
INSERT INTO `ciudad` VALUES ('195', 'TLAPA DE COMONFORT', '12');
INSERT INTO `ciudad` VALUES ('196', 'TLAPEHUALA', '12');
INSERT INTO `ciudad` VALUES ('197', 'ZIHUATANEJO', '12');
INSERT INTO `ciudad` VALUES ('198', 'ZUMPANGO DEL RÃO', '12');
INSERT INTO `ciudad` VALUES ('199', 'ACTOPAN', '13');
INSERT INTO `ciudad` VALUES ('200', 'APAN', '13');
INSERT INTO `ciudad` VALUES ('201', 'CIUDAD DE FRAY BERNARDINO DE SAHAGÃšN', '13');
INSERT INTO `ciudad` VALUES ('202', 'CRUZ AZUL', '13');
INSERT INTO `ciudad` VALUES ('203', 'HUEJUTLA DE REYES', '13');
INSERT INTO `ciudad` VALUES ('204', 'IXMIQUILPAN', '13');
INSERT INTO `ciudad` VALUES ('205', 'PACHUCA DE SOTO', '13');
INSERT INTO `ciudad` VALUES ('206', 'SANTIAGO TULANTEPEC', '13');
INSERT INTO `ciudad` VALUES ('207', 'TEPEAPULCO', '13');
INSERT INTO `ciudad` VALUES ('208', 'TEPEJI DEL RIO', '13');
INSERT INTO `ciudad` VALUES ('209', 'TIZAYUCA', '13');
INSERT INTO `ciudad` VALUES ('210', 'TLAXCOAPAN', '13');
INSERT INTO `ciudad` VALUES ('211', 'TULA DE ALLENDE', '13');
INSERT INTO `ciudad` VALUES ('212', 'TULANCINGO', '13');
INSERT INTO `ciudad` VALUES ('213', 'ZIMAPAN', '13');
INSERT INTO `ciudad` VALUES ('214', 'ACATLÃN DE JUÃREZ', '14');
INSERT INTO `ciudad` VALUES ('215', 'AHUALULCO DE MERCADO', '14');
INSERT INTO `ciudad` VALUES ('216', 'AJIJIC', '14');
INSERT INTO `ciudad` VALUES ('217', 'AMECA', '14');
INSERT INTO `ciudad` VALUES ('218', 'ARANDAS', '14');
INSERT INTO `ciudad` VALUES ('219', 'ATOTONILCO EL ALTO', '14');
INSERT INTO `ciudad` VALUES ('220', 'AUTLÃN DE NAVARRO', '14');
INSERT INTO `ciudad` VALUES ('221', 'CHAPALA', '14');
INSERT INTO `ciudad` VALUES ('222', 'CIHUATLÃN', '14');
INSERT INTO `ciudad` VALUES ('223', 'CIUDAD GUZMÃN', '14');
INSERT INTO `ciudad` VALUES ('224', 'COCULA', '14');
INSERT INTO `ciudad` VALUES ('225', 'COLOTLÃN', '14');
INSERT INTO `ciudad` VALUES ('226', 'EL GRULLO', '14');
INSERT INTO `ciudad` VALUES ('227', 'EL QUINCE (SAN JOSÃ‰ EL QUINCE)', '14');
INSERT INTO `ciudad` VALUES ('228', 'ETZATLÃN', '14');
INSERT INTO `ciudad` VALUES ('229', 'GUADALAJARA', '14');
INSERT INTO `ciudad` VALUES ('230', 'HUEJUQUILLA EL ALTO', '14');
INSERT INTO `ciudad` VALUES ('231', 'JALOSTOTITLÃN', '14');
INSERT INTO `ciudad` VALUES ('232', 'JAMAY', '14');
INSERT INTO `ciudad` VALUES ('233', 'JOCOTEPEC', '14');
INSERT INTO `ciudad` VALUES ('234', 'LA BARCA', '14');
INSERT INTO `ciudad` VALUES ('235', 'LA RESOLANA', '14');
INSERT INTO `ciudad` VALUES ('236', 'LAGOS DE MORENO', '14');
INSERT INTO `ciudad` VALUES ('237', 'LAS PINTITAS', '14');
INSERT INTO `ciudad` VALUES ('238', 'MAGDALENA', '14');
INSERT INTO `ciudad` VALUES ('239', 'OCOTLÃN', '14');
INSERT INTO `ciudad` VALUES ('240', 'PONCITLÃN', '14');
INSERT INTO `ciudad` VALUES ('241', 'PUERTO VALLARTA', '14');
INSERT INTO `ciudad` VALUES ('242', 'SAN DIEGO DE ALEJANDRÃA', '14');
INSERT INTO `ciudad` VALUES ('243', 'SAN IGNACIO CERRO GORDO', '14');
INSERT INTO `ciudad` VALUES ('244', 'SAN JOSÃ‰ EL VERDE (EL VERDE)', '14');
INSERT INTO `ciudad` VALUES ('245', 'SAN JUAN DE LOS LAGOS', '14');
INSERT INTO `ciudad` VALUES ('246', 'SAN JULIÃN', '14');
INSERT INTO `ciudad` VALUES ('247', 'SAN MIGUEL EL ALTO', '14');
INSERT INTO `ciudad` VALUES ('248', 'SAYULA', '14');
INSERT INTO `ciudad` VALUES ('249', 'TALA', '14');
INSERT INTO `ciudad` VALUES ('250', 'TALPA DE ALLENDE', '14');
INSERT INTO `ciudad` VALUES ('251', 'TAMAZULA DE GORDIANO', '14');
INSERT INTO `ciudad` VALUES ('252', 'TECALITLÃN', '14');
INSERT INTO `ciudad` VALUES ('253', 'TEOCALTICHE', '14');
INSERT INTO `ciudad` VALUES ('254', 'TEPATITLÃN DE MORELOS', '14');
INSERT INTO `ciudad` VALUES ('255', 'TEQUILA', '14');
INSERT INTO `ciudad` VALUES ('256', 'TLAJOMULCO DE ZÃšÃ‘IGA', '14');
INSERT INTO `ciudad` VALUES ('257', 'TLAQUEPAQUE', '14');
INSERT INTO `ciudad` VALUES ('258', 'TONALÃ', '14');
INSERT INTO `ciudad` VALUES ('259', 'TOTOTLÃN', '14');
INSERT INTO `ciudad` VALUES ('260', 'TUXPAN', '14');
INSERT INTO `ciudad` VALUES ('261', 'UNIÃ“N DE SAN ANTONIO', '14');
INSERT INTO `ciudad` VALUES ('262', 'VALLE DE GUADALUPE', '14');
INSERT INTO `ciudad` VALUES ('263', 'VILLA CORONA', '14');
INSERT INTO `ciudad` VALUES ('264', 'VILLA HIDALGO', '14');
INSERT INTO `ciudad` VALUES ('265', 'YAHUALICA DE GONZÃLEZ GALLO', '14');
INSERT INTO `ciudad` VALUES ('266', 'ZACOALCO DE TORRES', '14');
INSERT INTO `ciudad` VALUES ('267', 'ZAPOPAN', '14');
INSERT INTO `ciudad` VALUES ('268', 'ZAPOTILTIC', '14');
INSERT INTO `ciudad` VALUES ('269', 'ALMOLOYA DE JUÃREZ', '15');
INSERT INTO `ciudad` VALUES ('270', 'AMATEPEC', '15');
INSERT INTO `ciudad` VALUES ('271', 'CAPULHUAC', '15');
INSERT INTO `ciudad` VALUES ('272', 'CHALCO DE DÃAZ COVARRUBIAS', '15');
INSERT INTO `ciudad` VALUES ('273', 'CHICONCUAC', '15');
INSERT INTO `ciudad` VALUES ('274', 'CHIMALHUACÃN', '15');
INSERT INTO `ciudad` VALUES ('275', 'CIUDAD ADOLFO LÃ“PEZ MATEOS', '15');
INSERT INTO `ciudad` VALUES ('276', 'CIUDAD NEZAHUALCOYOTL', '15');
INSERT INTO `ciudad` VALUES ('277', 'COACALCO DE BERRIOZABAL', '15');
INSERT INTO `ciudad` VALUES ('278', 'CUAUTITLÃN', '15');
INSERT INTO `ciudad` VALUES ('279', 'CUAUTITLÃN IZCALLI', '15');
INSERT INTO `ciudad` VALUES ('280', 'ECATEPEC DE MORELOS', '15');
INSERT INTO `ciudad` VALUES ('281', 'HUIXQUILUCAN DE DEGOLLADO', '15');
INSERT INTO `ciudad` VALUES ('282', 'IXTAPALUCA', '15');
INSERT INTO `ciudad` VALUES ('283', 'JUCHITEPEC DE MARIANO RIVA PALACIO', '15');
INSERT INTO `ciudad` VALUES ('284', 'LOS REYES ACAQUILPAN (LA PAZ)', '15');
INSERT INTO `ciudad` VALUES ('285', 'MELCHOR OCAMPO', '15');
INSERT INTO `ciudad` VALUES ('286', 'METEPEC', '15');
INSERT INTO `ciudad` VALUES ('287', 'NAUCALPAN DE JUÃREZ', '15');
INSERT INTO `ciudad` VALUES ('288', 'OCOYOACAC', '15');
INSERT INTO `ciudad` VALUES ('289', 'SAN MATEO ATENCO', '15');
INSERT INTO `ciudad` VALUES ('290', 'SAN VICENTE CHICOLOAPAN DE JUÃREZ', '15');
INSERT INTO `ciudad` VALUES ('291', 'SANTA MARIA TULTEPEC', '15');
INSERT INTO `ciudad` VALUES ('292', 'TECAMAC DE FELIPE VILLANUEVA', '15');
INSERT INTO `ciudad` VALUES ('293', 'TEJUPILCO DE HIDALGO', '15');
INSERT INTO `ciudad` VALUES ('294', 'TEPOTZOTLÃN', '15');
INSERT INTO `ciudad` VALUES ('295', 'TEQUIXQUIAC', '15');
INSERT INTO `ciudad` VALUES ('296', 'TEXCOCO DE MORA', '15');
INSERT INTO `ciudad` VALUES ('297', 'TLALNEPANTLA DE BAZ', '15');
INSERT INTO `ciudad` VALUES ('298', 'TOLUCA DE LERDO', '15');
INSERT INTO `ciudad` VALUES ('299', 'TULTITLÃN DE MARIANO ESCOBEDO', '15');
INSERT INTO `ciudad` VALUES ('300', 'VALLE DE CHALCO SOLIDARIDAD', '15');
INSERT INTO `ciudad` VALUES ('301', 'VILLA NICOLÃS ROMERO', '15');
INSERT INTO `ciudad` VALUES ('302', 'XONACATLÃN', '15');
INSERT INTO `ciudad` VALUES ('303', 'ZUMPANGO', '15');
INSERT INTO `ciudad` VALUES ('304', 'APATZINGÃN DE LA CONSTITUCIÃ“N', '16');
INSERT INTO `ciudad` VALUES ('305', 'CIUDAD HIDALGO', '16');
INSERT INTO `ciudad` VALUES ('306', 'CIUDAD LÃZARO CÃRDENAS', '16');
INSERT INTO `ciudad` VALUES ('307', 'COTIJA DE LA PAZ', '16');
INSERT INTO `ciudad` VALUES ('308', 'CUITZEO DEL PORVENIR', '16');
INSERT INTO `ciudad` VALUES ('309', 'HEROICA ZITÃCUARO', '16');
INSERT INTO `ciudad` VALUES ('310', 'HUETAMO DE NÃšÃ‘EZ', '16');
INSERT INTO `ciudad` VALUES ('311', 'JACONA DE PLANCARTE', '16');
INSERT INTO `ciudad` VALUES ('312', 'JIQUILPAN DE JUÃREZ', '16');
INSERT INTO `ciudad` VALUES ('313', 'LA PIEDAD DE CABADAS', '16');
INSERT INTO `ciudad` VALUES ('314', 'LAS GUACAMAYAS', '16');
INSERT INTO `ciudad` VALUES ('315', 'LOS REYES DE SALGADO', '16');
INSERT INTO `ciudad` VALUES ('316', 'MARAVATÃO DE OCAMPO', '16');
INSERT INTO `ciudad` VALUES ('317', 'MORELIA', '16');
INSERT INTO `ciudad` VALUES ('318', 'NUEVA ITALIA DE RUIZ', '16');
INSERT INTO `ciudad` VALUES ('319', 'PARACHO DE VERDUZCO', '16');
INSERT INTO `ciudad` VALUES ('320', 'PÃTZCUARO', '16');
INSERT INTO `ciudad` VALUES ('321', 'PURUÃNDIRO', '16');
INSERT INTO `ciudad` VALUES ('322', 'SAHUAYO DE MORELOS', '16');
INSERT INTO `ciudad` VALUES ('323', 'TACÃMBARO DE CODALLOS', '16');
INSERT INTO `ciudad` VALUES ('324', 'TANGANCÃCUARO DE ARISTA', '16');
INSERT INTO `ciudad` VALUES ('325', 'TUXPAN', '16');
INSERT INTO `ciudad` VALUES ('326', 'URUAPAN', '16');
INSERT INTO `ciudad` VALUES ('327', 'YURÃ‰CUARO', '16');
INSERT INTO `ciudad` VALUES ('328', 'ZACAPU', '16');
INSERT INTO `ciudad` VALUES ('329', 'ZAMORA DE HIDALGO', '16');
INSERT INTO `ciudad` VALUES ('330', 'ZINAPÃ‰CUARO DE FIGUEROA', '16');
INSERT INTO `ciudad` VALUES ('331', 'CUAUTLA (CUAUTLA DE MORELOS)', '17');
INSERT INTO `ciudad` VALUES ('332', 'CUERNAVACA', '17');
INSERT INTO `ciudad` VALUES ('333', 'GALEANA', '17');
INSERT INTO `ciudad` VALUES ('334', 'JOJUTLA', '17');
INSERT INTO `ciudad` VALUES ('335', 'PUENTE DE IXTLA', '17');
INSERT INTO `ciudad` VALUES ('336', 'SANTA ROSA TREINTA', '17');
INSERT INTO `ciudad` VALUES ('337', 'TLAQUILTENANGO', '17');
INSERT INTO `ciudad` VALUES ('338', 'ZACATEPEC DE HIDALGO', '17');
INSERT INTO `ciudad` VALUES ('339', 'ACAPONETA', '18');
INSERT INTO `ciudad` VALUES ('340', 'AHUACATLÃN', '18');
INSERT INTO `ciudad` VALUES ('341', 'BUCERÃAS', '18');
INSERT INTO `ciudad` VALUES ('342', 'COMPOSTELA', '18');
INSERT INTO `ciudad` VALUES ('343', 'FRANCISCO I. MADERO (PUGA)', '18');
INSERT INTO `ciudad` VALUES ('344', 'IXTLÃN DEL RÃO', '18');
INSERT INTO `ciudad` VALUES ('345', 'JALA', '18');
INSERT INTO `ciudad` VALUES ('346', 'LA PEÃ‘ITA DE JALTEMBA', '18');
INSERT INTO `ciudad` VALUES ('347', 'LAS VARAS', '18');
INSERT INTO `ciudad` VALUES ('348', 'RUIZ', '18');
INSERT INTO `ciudad` VALUES ('349', 'SAN BLAS', '18');
INSERT INTO `ciudad` VALUES ('350', 'SAN PEDRO LAGUNILLAS', '18');
INSERT INTO `ciudad` VALUES ('351', 'SANTIAGO IXCUINTLA', '18');
INSERT INTO `ciudad` VALUES ('352', 'TECUALA', '18');
INSERT INTO `ciudad` VALUES ('353', 'TEPIC', '18');
INSERT INTO `ciudad` VALUES ('354', 'TUXPAN', '18');
INSERT INTO `ciudad` VALUES ('355', 'VILLA HIDALGO (EL NUEVO)', '18');
INSERT INTO `ciudad` VALUES ('356', 'XALISCO', '18');
INSERT INTO `ciudad` VALUES ('357', 'ANÃHUAC', '19');
INSERT INTO `ciudad` VALUES ('358', 'CADEREYTA JIMÃ‰NEZ', '19');
INSERT INTO `ciudad` VALUES ('359', 'CIÃ‰NEGA DE FLORES', '19');
INSERT INTO `ciudad` VALUES ('360', 'CIUDAD APODACA', '19');
INSERT INTO `ciudad` VALUES ('361', 'CIUDAD BENITO JUÃREZ', '19');
INSERT INTO `ciudad` VALUES ('362', 'CIUDAD GENERAL ESCOBEDO', '19');
INSERT INTO `ciudad` VALUES ('363', 'CIUDAD SABINAS HIDALGO', '19');
INSERT INTO `ciudad` VALUES ('364', 'CIUDAD SANTA CATARINA', '19');
INSERT INTO `ciudad` VALUES ('365', 'CIUDAD SANTA CATARINA', '19');
INSERT INTO `ciudad` VALUES ('366', 'DOCTOR ARROYO', '19');
INSERT INTO `ciudad` VALUES ('367', 'EL CERCADO', '19');
INSERT INTO `ciudad` VALUES ('368', 'GARCÃA', '19');
INSERT INTO `ciudad` VALUES ('369', 'GUADALUPE', '19');
INSERT INTO `ciudad` VALUES ('370', 'HUALAHUISES', '19');
INSERT INTO `ciudad` VALUES ('371', 'LINARES', '19');
INSERT INTO `ciudad` VALUES ('372', 'MONTEMORELOS', '19');
INSERT INTO `ciudad` VALUES ('373', 'MONTERREY', '19');
INSERT INTO `ciudad` VALUES ('374', 'SAN NICOLÃS DE LOS GARZA', '19');
INSERT INTO `ciudad` VALUES ('375', 'SAN PEDRO GARZA GARCÃA', '19');
INSERT INTO `ciudad` VALUES ('376', 'SANTIAGO', '19');
INSERT INTO `ciudad` VALUES ('377', 'ASUNCIÃ“N NOCHIXTLÃN', '20');
INSERT INTO `ciudad` VALUES ('378', 'BAHIAS DE HUATULCO', '20');
INSERT INTO `ciudad` VALUES ('379', 'CHAHUITES', '20');
INSERT INTO `ciudad` VALUES ('380', 'CIUDAD IXTEPEC', '20');
INSERT INTO `ciudad` VALUES ('381', 'COSOLAPA', '20');
INSERT INTO `ciudad` VALUES ('382', 'CUILÃPAM DE GUERRERO', '20');
INSERT INTO `ciudad` VALUES ('383', 'EL CAMARÃ“N', '20');
INSERT INTO `ciudad` VALUES ('384', 'EL ROSARIO', '20');
INSERT INTO `ciudad` VALUES ('385', 'HEROICA CIUDAD DE EJUTLA DE CRESPO', '20');
INSERT INTO `ciudad` VALUES ('386', 'HEROICA CIUDAD DE HUAJUAPAN DE LEÃ“N', '20');
INSERT INTO `ciudad` VALUES ('387', 'HEROICA CIUDAD DE TLAXIACO', '20');
INSERT INTO `ciudad` VALUES ('388', 'JUCHITÃN (JUCHITÃN DE ZARAGOZA)', '20');
INSERT INTO `ciudad` VALUES ('389', 'LAGUNAS', '20');
INSERT INTO `ciudad` VALUES ('390', 'LOMA BONITA', '20');
INSERT INTO `ciudad` VALUES ('391', 'MARISCALA DE JUÃREZ', '20');
INSERT INTO `ciudad` VALUES ('392', 'MATÃAS ROMERO AVENDAÃ‘O', '20');
INSERT INTO `ciudad` VALUES ('393', 'MIAHUATLÃN DE PORFIRIO DÃAZ', '20');
INSERT INTO `ciudad` VALUES ('394', 'NATIVIDAD', '20');
INSERT INTO `ciudad` VALUES ('395', 'OAXACA DE JUÃREZ', '20');
INSERT INTO `ciudad` VALUES ('396', 'OCOTLÃN DE MORELOS', '20');
INSERT INTO `ciudad` VALUES ('397', 'PUERTO ESCONDIDO', '20');
INSERT INTO `ciudad` VALUES ('398', 'PUTLA VILLA DE GUERRERO', '20');
INSERT INTO `ciudad` VALUES ('399', 'RÃO GRANDE O PIEDRA PARADA', '20');
INSERT INTO `ciudad` VALUES ('400', 'SALINA CRUZ', '20');
INSERT INTO `ciudad` VALUES ('401', 'SAN ANTONIO DE LA CAL', '20');
INSERT INTO `ciudad` VALUES ('402', 'SAN BLAS ATEMPA', '20');
INSERT INTO `ciudad` VALUES ('403', 'SAN FELIPE JALAPA DE DÃAZ', '20');
INSERT INTO `ciudad` VALUES ('404', 'SAN FRANCISCO IXHUATÃN', '20');
INSERT INTO `ciudad` VALUES ('405', 'SAN FRANCISCO TELIXTLAHUACA', '20');
INSERT INTO `ciudad` VALUES ('406', 'SAN JUAN BAUTISTA CUICATLÃN', '20');
INSERT INTO `ciudad` VALUES ('407', 'SAN JUAN BAUTISTA LO DE SOTO', '20');
INSERT INTO `ciudad` VALUES ('408', 'SAN JUAN BAUTISTA TUXTEPEC', '20');
INSERT INTO `ciudad` VALUES ('409', 'SAN JUAN BAUTISTA VALLE NACIONAL', '20');
INSERT INTO `ciudad` VALUES ('410', 'SAN JUAN CACAHUATEPEC', '20');
INSERT INTO `ciudad` VALUES ('411', 'SAN MIGUEL EL GRANDE', '20');
INSERT INTO `ciudad` VALUES ('412', 'SAN PABLO HUITZO', '20');
INSERT INTO `ciudad` VALUES ('413', 'SAN PABLO VILLA DE MITLA', '20');
INSERT INTO `ciudad` VALUES ('414', 'SAN PEDRO MIXTEPEC -DTO. 22-', '20');
INSERT INTO `ciudad` VALUES ('415', 'SAN PEDRO POCHUTLA', '20');
INSERT INTO `ciudad` VALUES ('416', 'SAN PEDRO TAPANATEPEC', '20');
INSERT INTO `ciudad` VALUES ('417', 'SAN PEDRO TOTOLAPA', '20');
INSERT INTO `ciudad` VALUES ('418', 'SAN SEBASTIÃN TECOMAXTLAHUACA', '20');
INSERT INTO `ciudad` VALUES ('419', 'SANTA CRUZ ITUNDUJIA', '20');
INSERT INTO `ciudad` VALUES ('420', 'SANTA LUCIA DEL CAMINO', '20');
INSERT INTO `ciudad` VALUES ('421', 'SANTA MARÃA HUATULCO', '20');
INSERT INTO `ciudad` VALUES ('422', 'SANTIAGO JAMILTEPEC', '20');
INSERT INTO `ciudad` VALUES ('423', 'SANTIAGO JUXTLAHUACA', '20');
INSERT INTO `ciudad` VALUES ('424', 'SANTIAGO PINOTEPA NACIONAL', '20');
INSERT INTO `ciudad` VALUES ('425', 'SANTIAGO SUCHILQUITONGO', '20');
INSERT INTO `ciudad` VALUES ('426', 'SANTO DOMINGO TEHUANTEPEC', '20');
INSERT INTO `ciudad` VALUES ('427', 'TEOTITLÃN DE FLORES MAGÃ“N', '20');
INSERT INTO `ciudad` VALUES ('428', 'TLACOLULA DE MATAMOROS', '20');
INSERT INTO `ciudad` VALUES ('429', 'UNIÃ“N HIDALGO', '20');
INSERT INTO `ciudad` VALUES ('430', 'VICENTE CAMALOTE', '20');
INSERT INTO `ciudad` VALUES ('431', 'VILLA DE TAMAZULÃPAM DEL PROGRESO', '20');
INSERT INTO `ciudad` VALUES ('432', 'VILLA DE ZAACHILA', '20');
INSERT INTO `ciudad` VALUES ('433', 'VILLA SOLA DE VEGA', '20');
INSERT INTO `ciudad` VALUES ('434', 'ZIMATLÃN DE ÃLVAREZ', '20');
INSERT INTO `ciudad` VALUES ('435', 'ACATLÃN DE OSORIO', '21');
INSERT INTO `ciudad` VALUES ('436', 'AMOZOC', '21');
INSERT INTO `ciudad` VALUES ('437', 'ATLIXCO', '21');
INSERT INTO `ciudad` VALUES ('438', 'CIUDAD SERDÃN', '21');
INSERT INTO `ciudad` VALUES ('439', 'CUAUTLANCINGO', '21');
INSERT INTO `ciudad` VALUES ('440', 'HUAUCHINANGO', '21');
INSERT INTO `ciudad` VALUES ('441', 'IZÃšCAR DE MATAMOROS', '21');
INSERT INTO `ciudad` VALUES ('442', 'PUEBLA (HEROICA PUEBLA)', '21');
INSERT INTO `ciudad` VALUES ('443', 'SAN ANDRÃ‰S CHOLULA', '21');
INSERT INTO `ciudad` VALUES ('444', 'SAN MARTÃN TEXMELUCAN DE LABASTIDA', '21');
INSERT INTO `ciudad` VALUES ('445', 'SAN PEDRO CHOLULA', '21');
INSERT INTO `ciudad` VALUES ('446', 'TECAMACHALCO', '21');
INSERT INTO `ciudad` VALUES ('447', 'TEHUACAN', '21');
INSERT INTO `ciudad` VALUES ('448', 'TEPEACA', '21');
INSERT INTO `ciudad` VALUES ('449', 'TEZIUTLAN', '21');
INSERT INTO `ciudad` VALUES ('450', 'XICOTEPEC', '21');
INSERT INTO `ciudad` VALUES ('451', 'ZACATLÃN', '21');
INSERT INTO `ciudad` VALUES ('452', 'EL PUEBLITO', '22');
INSERT INTO `ciudad` VALUES ('453', 'QUERÃ‰TARO', '22');
INSERT INTO `ciudad` VALUES ('454', 'SAN JUAN DEL RIO', '22');
INSERT INTO `ciudad` VALUES ('455', 'BACALAR', '23');
INSERT INTO `ciudad` VALUES ('456', 'CANCÃšN', '23');
INSERT INTO `ciudad` VALUES ('457', 'CHETUMAL', '23');
INSERT INTO `ciudad` VALUES ('458', 'COZUMEL', '23');
INSERT INTO `ciudad` VALUES ('459', 'FELIPE CARRILLO PUERTO', '23');
INSERT INTO `ciudad` VALUES ('460', 'ISLA MUJERES', '23');
INSERT INTO `ciudad` VALUES ('461', 'KANTUNILKÃN', '23');
INSERT INTO `ciudad` VALUES ('462', 'PLAYA DEL CARMEN', '23');
INSERT INTO `ciudad` VALUES ('463', 'CÃRDENAS', '24');
INSERT INTO `ciudad` VALUES ('464', 'CEDRAL', '24');
INSERT INTO `ciudad` VALUES ('465', 'CERRITOS', '24');
INSERT INTO `ciudad` VALUES ('466', 'CHARCAS', '24');
INSERT INTO `ciudad` VALUES ('467', 'CIUDAD DEL MAÃZ', '24');
INSERT INTO `ciudad` VALUES ('468', 'CIUDAD VALLES', '24');
INSERT INTO `ciudad` VALUES ('469', 'Ã‰BANO', '24');
INSERT INTO `ciudad` VALUES ('470', 'EL NARANJO', '24');
INSERT INTO `ciudad` VALUES ('471', 'FRACCIÃ“N EL REFUGIO', '24');
INSERT INTO `ciudad` VALUES ('472', 'MATEHUALA', '24');
INSERT INTO `ciudad` VALUES ('473', 'RIOVERDE', '24');
INSERT INTO `ciudad` VALUES ('474', 'SALINAS DE HIDALGO', '24');
INSERT INTO `ciudad` VALUES ('475', 'SAN LUIS POTOSÃ', '24');
INSERT INTO `ciudad` VALUES ('476', 'SANTA MARÃA DEL RÃO', '24');
INSERT INTO `ciudad` VALUES ('477', 'SOLEDAD DE GRACIANO SÃNCHEZ', '24');
INSERT INTO `ciudad` VALUES ('478', 'TAMASOPO', '24');
INSERT INTO `ciudad` VALUES ('479', 'TAMAZUNCHALE', '24');
INSERT INTO `ciudad` VALUES ('480', 'TAMUIN', '24');
INSERT INTO `ciudad` VALUES ('481', 'TIERRA NUEVA', '24');
INSERT INTO `ciudad` VALUES ('482', 'VILLA DE REYES', '24');
INSERT INTO `ciudad` VALUES ('483', 'AGUARUTO', '25');
INSERT INTO `ciudad` VALUES ('484', 'AHOME', '25');
INSERT INTO `ciudad` VALUES ('485', 'ANGOSTURA', '25');
INSERT INTO `ciudad` VALUES ('486', 'CHOIX', '25');
INSERT INTO `ciudad` VALUES ('487', 'COSALÃ', '25');
INSERT INTO `ciudad` VALUES ('488', 'CULIACÃN ROSALES', '25');
INSERT INTO `ciudad` VALUES ('489', 'EL ROSARIO', '25');
INSERT INTO `ciudad` VALUES ('490', 'ESCUINAPA DE HIDALGO', '25');
INSERT INTO `ciudad` VALUES ('491', 'ESTACIÃ“N NARANJO', '25');
INSERT INTO `ciudad` VALUES ('492', 'GUAMÃšCHIL', '25');
INSERT INTO `ciudad` VALUES ('493', 'GUASAVE', '25');
INSERT INTO `ciudad` VALUES ('494', 'HIGUERA DE ZARAGOZA', '25');
INSERT INTO `ciudad` VALUES ('495', 'LA CRUZ', '25');
INSERT INTO `ciudad` VALUES ('496', 'LIC. BENITO JUÃREZ (CAMPO GOBIERNO)', '25');
INSERT INTO `ciudad` VALUES ('497', 'LOS MOCHIS', '25');
INSERT INTO `ciudad` VALUES ('498', 'MAZATLÃN', '25');
INSERT INTO `ciudad` VALUES ('499', 'MOCORITO', '25');
INSERT INTO `ciudad` VALUES ('500', 'NAVOLATO', '25');
INSERT INTO `ciudad` VALUES ('501', 'QUILA', '25');
INSERT INTO `ciudad` VALUES ('502', 'SAN BLAS', '25');
INSERT INTO `ciudad` VALUES ('503', 'SAN IGNACIO', '25');
INSERT INTO `ciudad` VALUES ('504', 'SINALOA DE LEYVA', '25');
INSERT INTO `ciudad` VALUES ('505', 'TOPOLOBAMPO', '25');
INSERT INTO `ciudad` VALUES ('506', 'VILLA UNIÃ“N', '25');
INSERT INTO `ciudad` VALUES ('507', 'AGUA PRIETA', '26');
INSERT INTO `ciudad` VALUES ('508', 'CIUDAD OBREGÃ“N', '26');
INSERT INTO `ciudad` VALUES ('509', 'EMPALME', '26');
INSERT INTO `ciudad` VALUES ('510', 'HERMOSILLO', '26');
INSERT INTO `ciudad` VALUES ('511', 'HEROICA CABORCA', '26');
INSERT INTO `ciudad` VALUES ('512', 'HEROICA CIUDAD DE CANANEA', '26');
INSERT INTO `ciudad` VALUES ('513', 'HEROICA GUAYMAS', '26');
INSERT INTO `ciudad` VALUES ('514', 'HEROICA NOGALES', '26');
INSERT INTO `ciudad` VALUES ('515', 'HUATABAMPO', '26');
INSERT INTO `ciudad` VALUES ('516', 'MAGDALENA DE KINO', '26');
INSERT INTO `ciudad` VALUES ('517', 'NAVOJOA', '26');
INSERT INTO `ciudad` VALUES ('518', 'PUERTO PEÃ‘ASCO', '26');
INSERT INTO `ciudad` VALUES ('519', 'SAN LUIS RÃO COLORADO', '26');
INSERT INTO `ciudad` VALUES ('520', 'SONOITA', '26');
INSERT INTO `ciudad` VALUES ('521', 'CÃRDENAS', '27');
INSERT INTO `ciudad` VALUES ('522', 'COMALCALCO', '27');
INSERT INTO `ciudad` VALUES ('523', 'CUNDUACÃN', '27');
INSERT INTO `ciudad` VALUES ('524', 'EMILIANO ZAPATA', '27');
INSERT INTO `ciudad` VALUES ('525', 'FRONTERA', '27');
INSERT INTO `ciudad` VALUES ('526', 'HUIMANGUILLO', '27');
INSERT INTO `ciudad` VALUES ('527', 'JALPA DE MÃ‰NDEZ', '27');
INSERT INTO `ciudad` VALUES ('528', 'MACUSPANA', '27');
INSERT INTO `ciudad` VALUES ('529', 'PARAÃSO', '27');
INSERT INTO `ciudad` VALUES ('530', 'TEAPA', '27');
INSERT INTO `ciudad` VALUES ('531', 'TENOSIQUE DE PINO SUÃREZ', '27');
INSERT INTO `ciudad` VALUES ('532', 'VILLAHERMOSA', '27');
INSERT INTO `ciudad` VALUES ('533', 'ALTAMIRA', '28');
INSERT INTO `ciudad` VALUES ('534', 'CIUDAD CAMARGO', '28');
INSERT INTO `ciudad` VALUES ('535', 'CIUDAD GUSTAVO DÃAZ ORDAZ', '28');
INSERT INTO `ciudad` VALUES ('536', 'CIUDAD MADERO', '28');
INSERT INTO `ciudad` VALUES ('537', 'CIUDAD MANTE', '28');
INSERT INTO `ciudad` VALUES ('538', 'CIUDAD MIGUEL ALEMÃN', '28');
INSERT INTO `ciudad` VALUES ('539', 'CIUDAD RÃO BRAVO', '28');
INSERT INTO `ciudad` VALUES ('540', 'CIUDAD TULA', '28');
INSERT INTO `ciudad` VALUES ('541', 'CIUDAD VICTORIA', '28');
INSERT INTO `ciudad` VALUES ('542', 'ESTACIÃ“N MANUEL (ÃšRSULO GALVÃN)', '28');
INSERT INTO `ciudad` VALUES ('543', 'GONZÃLEZ', '28');
INSERT INTO `ciudad` VALUES ('544', 'HEROICA MATAMOROS', '28');
INSERT INTO `ciudad` VALUES ('545', 'JAUMAVE', '28');
INSERT INTO `ciudad` VALUES ('546', 'NUEVA CIUDAD GUERRERO', '28');
INSERT INTO `ciudad` VALUES ('547', 'NUEVO LAREDO', '28');
INSERT INTO `ciudad` VALUES ('548', 'REYNOSA', '28');
INSERT INTO `ciudad` VALUES ('549', 'SAN FERNANDO', '28');
INSERT INTO `ciudad` VALUES ('550', 'SOTO LA MARINA', '28');
INSERT INTO `ciudad` VALUES ('551', 'TAMPICO', '28');
INSERT INTO `ciudad` VALUES ('552', 'VALLE HERMOSO', '28');
INSERT INTO `ciudad` VALUES ('553', 'XICOTÃ‰NCATL', '28');
INSERT INTO `ciudad` VALUES ('554', 'APIZACO', '29');
INSERT INTO `ciudad` VALUES ('555', 'CALPULALPAN', '29');
INSERT INTO `ciudad` VALUES ('556', 'CHIAUTEMPAN', '29');
INSERT INTO `ciudad` VALUES ('557', 'HUAMANTLA', '29');
INSERT INTO `ciudad` VALUES ('558', 'TLAXCALA (TLAXCALA DE XICOTENCATL)', '29');
INSERT INTO `ciudad` VALUES ('559', 'VILLA VICENTE GUERRERO', '29');
INSERT INTO `ciudad` VALUES ('560', 'ACAYUCAN', '30');
INSERT INTO `ciudad` VALUES ('561', 'AGUA DULCE', '30');
INSERT INTO `ciudad` VALUES ('562', 'ALTOTONGA', '30');
INSERT INTO `ciudad` VALUES ('563', 'ALVARADO', '30');
INSERT INTO `ciudad` VALUES ('564', 'ÃNGEL R. CABADA', '30');
INSERT INTO `ciudad` VALUES ('565', 'ATOYAC', '30');
INSERT INTO `ciudad` VALUES ('566', 'BANDERILLA', '30');
INSERT INTO `ciudad` VALUES ('567', 'BOCA DEL RÃO', '30');
INSERT INTO `ciudad` VALUES ('568', 'CARLOS A. CARRILLO', '30');
INSERT INTO `ciudad` VALUES ('569', 'CATEMACO', '30');
INSERT INTO `ciudad` VALUES ('570', 'CAZONES DE HERRERA', '30');
INSERT INTO `ciudad` VALUES ('571', 'CERRO AZUL', '30');
INSERT INTO `ciudad` VALUES ('572', 'COATEPEC', '30');
INSERT INTO `ciudad` VALUES ('573', 'COATZACOALCOS', '30');
INSERT INTO `ciudad` VALUES ('574', 'COATZINTLA', '30');
INSERT INTO `ciudad` VALUES ('575', 'CÃ“RDOBA', '30');
INSERT INTO `ciudad` VALUES ('576', 'COSAMALOAPAN', '30');
INSERT INTO `ciudad` VALUES ('577', 'COSOLEACAQUE', '30');
INSERT INTO `ciudad` VALUES ('578', 'CUICHAPA', '30');
INSERT INTO `ciudad` VALUES ('579', 'CUITLÃHUAC', '30');
INSERT INTO `ciudad` VALUES ('580', 'EL HIGO', '30');
INSERT INTO `ciudad` VALUES ('581', 'FORTÃN DE LAS FLORES', '30');
INSERT INTO `ciudad` VALUES ('582', 'GENERAL MIGUEL ALEMÃN (POTRERO NUEVO)', '30');
INSERT INTO `ciudad` VALUES ('583', 'GUTIÃ‰RREZ ZAMORA', '30');
INSERT INTO `ciudad` VALUES ('584', 'HUATUSCO DE CHICUELLAR', '30');
INSERT INTO `ciudad` VALUES ('585', 'HUAYACOCOTLA', '30');
INSERT INTO `ciudad` VALUES ('586', 'HUILOAPAN DE CUAUHTÃ‰MOC', '30');
INSERT INTO `ciudad` VALUES ('587', 'ISLA', '30');
INSERT INTO `ciudad` VALUES ('588', 'IXTACZOQUITLÃN', '30');
INSERT INTO `ciudad` VALUES ('589', 'JÃLTIPAN DE MORELOS', '30');
INSERT INTO `ciudad` VALUES ('590', 'JOSÃ‰ CARDEL', '30');
INSERT INTO `ciudad` VALUES ('591', 'JUAN DÃAZ COVARRUBIAS', '30');
INSERT INTO `ciudad` VALUES ('592', 'JUAN RODRÃGUEZ CLARA', '30');
INSERT INTO `ciudad` VALUES ('593', 'LAS CHOAPAS', '30');
INSERT INTO `ciudad` VALUES ('594', 'LERDO DE TEJADA', '30');
INSERT INTO `ciudad` VALUES ('595', 'MINATITLÃN', '30');
INSERT INTO `ciudad` VALUES ('596', 'NARANJOS', '30');
INSERT INTO `ciudad` VALUES ('597', 'NOGALES', '30');
INSERT INTO `ciudad` VALUES ('598', 'ORIZABA', '30');
INSERT INTO `ciudad` VALUES ('599', 'PÃNUCO', '30');
INSERT INTO `ciudad` VALUES ('600', 'PAPANTLA DE OLARTE', '30');
INSERT INTO `ciudad` VALUES ('601', 'PARAJE NUEVO', '30');
INSERT INTO `ciudad` VALUES ('602', 'PASO DE OVEJAS', '30');
INSERT INTO `ciudad` VALUES ('603', 'PASO DEL MACHO', '30');
INSERT INTO `ciudad` VALUES ('604', 'PLATÃ“N SÃNCHEZ', '30');
INSERT INTO `ciudad` VALUES ('605', 'PLAYA VICENTE', '30');
INSERT INTO `ciudad` VALUES ('606', 'POZA RICA DE HIDALGO', '30');
INSERT INTO `ciudad` VALUES ('607', 'RÃO BLANCO', '30');
INSERT INTO `ciudad` VALUES ('608', 'SAN ANDRÃ‰S TUXTLA', '30');
INSERT INTO `ciudad` VALUES ('609', 'SAN RAFAEL', '30');
INSERT INTO `ciudad` VALUES ('610', 'SANTIAGO TUXTLA', '30');
INSERT INTO `ciudad` VALUES ('611', 'SIHUAPAN', '30');
INSERT INTO `ciudad` VALUES ('612', 'SOLEDAD DE DOBLADO', '30');
INSERT INTO `ciudad` VALUES ('613', 'TAMPICO ALTO', '30');
INSERT INTO `ciudad` VALUES ('614', 'TANTOYUCA', '30');
INSERT INTO `ciudad` VALUES ('615', 'TEMPOAL DE SÃNCHEZ', '30');
INSERT INTO `ciudad` VALUES ('616', 'TEZONAPA', '30');
INSERT INTO `ciudad` VALUES ('617', 'TIERRA BLANCA', '30');
INSERT INTO `ciudad` VALUES ('618', 'TIHUATLÃN', '30');
INSERT INTO `ciudad` VALUES ('619', 'TLACOJALPAN', '30');
INSERT INTO `ciudad` VALUES ('620', 'TLAPACOYAN', '30');
INSERT INTO `ciudad` VALUES ('621', 'TRES VALLES', '30');
INSERT INTO `ciudad` VALUES ('622', 'TÃšXPAM DE RODRÃGUEZ CANO', '30');
INSERT INTO `ciudad` VALUES ('623', 'VERACRUZ', '30');
INSERT INTO `ciudad` VALUES ('624', 'XALAPA-ENRÃQUEZ', '30');
INSERT INTO `ciudad` VALUES ('625', 'YECUATLA', '30');
INSERT INTO `ciudad` VALUES ('626', 'KANASÃN', '31');
INSERT INTO `ciudad` VALUES ('627', 'MÃ‰RIDA', '31');
INSERT INTO `ciudad` VALUES ('628', 'MOTUL DE CARRILLO PUERTO', '31');
INSERT INTO `ciudad` VALUES ('629', 'TICUL', '31');
INSERT INTO `ciudad` VALUES ('630', 'TIZIMÃN', '31');
INSERT INTO `ciudad` VALUES ('631', 'VALLADOLID', '31');
INSERT INTO `ciudad` VALUES ('632', 'CIUDAD CUAUHTÃ‰MOC', '32');
INSERT INTO `ciudad` VALUES ('633', 'FRESNILLO', '32');
INSERT INTO `ciudad` VALUES ('634', 'GUADALUPE', '32');
INSERT INTO `ciudad` VALUES ('635', 'JALPA', '32');
INSERT INTO `ciudad` VALUES ('636', 'JEREZ DE GARCÃA SALINAS', '32');
INSERT INTO `ciudad` VALUES ('637', 'JUAN ALDAMA', '32');
INSERT INTO `ciudad` VALUES ('638', 'LORETO', '32');
INSERT INTO `ciudad` VALUES ('639', 'LUIS MOYA', '32');
INSERT INTO `ciudad` VALUES ('640', 'MOYAHUA DE ESTRADA', '32');
INSERT INTO `ciudad` VALUES ('641', 'NOCHISTLÃN DE MEJÃA', '32');
INSERT INTO `ciudad` VALUES ('642', 'OJOCALIENTE', '32');
INSERT INTO `ciudad` VALUES ('643', 'RÃO GRANDE', '32');
INSERT INTO `ciudad` VALUES ('644', 'SOMBRERETE', '32');
INSERT INTO `ciudad` VALUES ('645', 'VALPARAÃSO', '32');
INSERT INTO `ciudad` VALUES ('646', 'VÃCTOR ROSALES', '32');
INSERT INTO `ciudad` VALUES ('647', 'VILLA DE COS', '32');
INSERT INTO `ciudad` VALUES ('648', 'VILLA HIDALGO', '32');
INSERT INTO `ciudad` VALUES ('649', 'VILLANUEVA', '32');
INSERT INTO `ciudad` VALUES ('650', 'ZACATECAS', '32');

-- ----------------------------
-- Table structure for coordinaciona
-- ----------------------------
DROP TABLE IF EXISTS `coordinaciona`;
CREATE TABLE `coordinaciona` (
  `coordinaciona` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id Coordinación',
  `descripcion` varchar(45) NOT NULL COMMENT 'Descripción Coordinación',
  `programaedu` int(11) NOT NULL COMMENT 'Codigo carrera',
  PRIMARY KEY (`coordinaciona`),
  UNIQUE KEY `CO_codigo_UNIQUE` (`coordinaciona`),
  KEY `fk_coordinaciona_programaedu1` (`programaedu`),
  CONSTRAINT `fk_coordinaciona_programaedu1` FOREIGN KEY (`programaedu`) REFERENCES `programaedu` (`programaedu`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of coordinaciona
-- ----------------------------
INSERT INTO `coordinaciona` VALUES ('1', 'CONTABILIDAD BASICA', '1');
INSERT INTO `coordinaciona` VALUES ('2', 'CONTABILIDAD AVANZADA', '1');
INSERT INTO `coordinaciona` VALUES ('3', 'CONTABILIDAD DE COSTOS', '1');
INSERT INTO `coordinaciona` VALUES ('4', 'FINANZAS', '1');
INSERT INTO `coordinaciona` VALUES ('5', 'AUDITORIA', '1');
INSERT INTO `coordinaciona` VALUES ('6', 'IMPUESTOS', '1');
INSERT INTO `coordinaciona` VALUES ('7', 'MERCADOTECNIA', '1');
INSERT INTO `coordinaciona` VALUES ('8', 'RECURSOS HUMANOS', '1');
INSERT INTO `coordinaciona` VALUES ('9', 'PRODUCCION', '1');
INSERT INTO `coordinaciona` VALUES ('10', 'ADMINISTRACION BASICA', '1');
INSERT INTO `coordinaciona` VALUES ('11', 'ADMINISTRACION AVANZADA', '1');
INSERT INTO `coordinaciona` VALUES ('12', 'INFORMATICA', '1');
INSERT INTO `coordinaciona` VALUES ('13', 'MATEMATICAS', '1');
INSERT INTO `coordinaciona` VALUES ('14', 'CIENCIAS COMPUTACIONALES', '1');
INSERT INTO `coordinaciona` VALUES ('15', 'SISTEMAS DE INFORMACION', '1');
INSERT INTO `coordinaciona` VALUES ('16', 'PROGRAMACION', '1');
INSERT INTO `coordinaciona` VALUES ('17', 'ECONOMIA', '1');
INSERT INTO `coordinaciona` VALUES ('18', 'COMERCIO EXTERIOR', '1');
INSERT INTO `coordinaciona` VALUES ('19', 'DERECHO', '1');
INSERT INTO `coordinaciona` VALUES ('20', 'EMPRENDEDORES', '1');
INSERT INTO `coordinaciona` VALUES ('21', 'ASIGNATURAS DE APOYO', '1');
INSERT INTO `coordinaciona` VALUES ('22', 'SIN COORDINACION', '1');

-- ----------------------------
-- Table structure for directivopuesto
-- ----------------------------
DROP TABLE IF EXISTS `directivopuesto`;
CREATE TABLE `directivopuesto` (
  `directivopuesto` int(11) NOT NULL AUTO_INCREMENT COMMENT '1,2,3',
  `descripcion` varchar(15) NOT NULL COMMENT 'Director,subdirector, administrador',
  PRIMARY KEY (`directivopuesto`),
  UNIQUE KEY `DI_directivopuesto_UNIQUE` (`directivopuesto`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COMMENT='<double-click to overwrite multiple objects>';

-- ----------------------------
-- Records of directivopuesto
-- ----------------------------
INSERT INTO `directivopuesto` VALUES ('1', 'DIRECTOR');
INSERT INTO `directivopuesto` VALUES ('2', 'SUBDIRECTOR');
INSERT INTO `directivopuesto` VALUES ('3', 'ADMINISTRADOR');

-- ----------------------------
-- Table structure for directivosua
-- ----------------------------
DROP TABLE IF EXISTS `directivosua`;
CREATE TABLE `directivosua` (
  `empleado` int(11) NOT NULL COMMENT 'No empleado UABC que tiene  ese puesto',
  `uacademica` int(11) NOT NULL COMMENT 'Codigo uacademica',
  `directivopuesto` int(11) NOT NULL COMMENT 'Codigo puestodirectivo',
  PRIMARY KEY (`empleado`),
  KEY `fk_directivosua_uacademica1` (`uacademica`),
  KEY `fk_directivosua_directivopuesto1` (`directivopuesto`),
  CONSTRAINT `fk_directivosua_directivopuesto1` FOREIGN KEY (`directivopuesto`) REFERENCES `directivopuesto` (`directivopuesto`) ON UPDATE CASCADE,
  CONSTRAINT `fk_directivosua_empleados1` FOREIGN KEY (`empleado`) REFERENCES `empleados` (`empleado`) ON UPDATE CASCADE,
  CONSTRAINT `fk_directivosua_uacademica1` FOREIGN KEY (`uacademica`) REFERENCES `uacademica` (`uacademica`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of directivosua
-- ----------------------------
INSERT INTO `directivosua` VALUES ('1', '1', '1');

-- ----------------------------
-- Table structure for empleados
-- ----------------------------
DROP TABLE IF EXISTS `empleados`;
CREATE TABLE `empleados` (
  `empleado` int(11) NOT NULL COMMENT 'Numero de empleado UABC',
  `nombres` varchar(20) DEFAULT NULL COMMENT 'Nombre',
  `paterno` varchar(20) DEFAULT NULL COMMENT 'Paterno',
  `materno` varchar(20) DEFAULT NULL COMMENT 'Materno',
  `status` int(11) DEFAULT NULL COMMENT 'Status',
  `fec_nac` date DEFAULT NULL COMMENT 'Fecha nacimiento',
  `fec_ing` date DEFAULT NULL COMMENT 'Fecha ingreso',
  `cel` varchar(45) DEFAULT NULL COMMENT 'Celular',
  `telofna` varchar(45) DEFAULT NULL COMMENT 'Tel oficina',
  `tipocon` int(11) DEFAULT NULL COMMENT 'Tipo Contrato',
  `telcasa` varchar(45) DEFAULT NULL COMMENT 'Tel casa',
  `email` varchar(30) DEFAULT NULL COMMENT 'Email',
  `hrstope` int(11) DEFAULT NULL COMMENT 'Tope en hrs clase',
  `sexo` char(1) DEFAULT NULL COMMENT 'Sexo',
  PRIMARY KEY (`empleado`),
  UNIQUE KEY `DO_codigo_UNIQUE` (`empleado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of empleados
-- ----------------------------
INSERT INTO `empleados` VALUES ('1', 'MARGARITA', 'RAMIREZ', 'RAMIREZ', '1', '2014-05-01', '2014-05-01', '044-666-6-34-02-36', '044-666-6-34-02-36', '1', '044-666-6-34-02-36', 'MAGUIRAM@UABC.EDU.MX', '40', 'F');
INSERT INTO `empleados` VALUES ('2', 'NORA DEL CARMEN', 'OZUNA', 'MILLAN', '1', '2014-05-01', '2014-05-01', '044-666-6-34-02-36', '044-666-6-34-02-36', '1', '044-666-6-34-02-36', 'NORA.OSUNA@UABC.EDU.MX', '40', 'F');
INSERT INTO `empleados` VALUES ('3', 'ESPERANZA', 'MANRIQUE', null, '1', '2014-05-01', '2014-05-01', '044-664-123-67-89', '044-664-123-67-89', '1', '044-664-123-67-89', 'EMANRIQUE@UABC.EDU.MX', '40', 'F');
INSERT INTO `empleados` VALUES ('4', 'EMMA SOFIA', 'CASTILLEJOS', 'CABALLERO', '1', '2014-05-01', '2014-05-01', 'O44-664-123-67-89', 'O44-664-123-67-89', '1', 'O44-664-123-67-89', 'EMA.CASTILLEJOS@UABC.EDU.MX', '40', 'F');
INSERT INTO `empleados` VALUES ('5', 'COORD. TRONCO COMUN', '', '', '1', '2014-05-01', '2014-05-01', '', '', '1', null, 'COORDINFORMATICA@UABC.EDU.MX', '0', 'F');
INSERT INTO `empleados` VALUES ('6', 'COORD. CONTADURIA', '', '', '1', '2014-05-01', '2014-05-01', '', '', '1', null, 'COORDINFORMATICA@UABC.EDU.MX', '0', 'F');
INSERT INTO `empleados` VALUES ('7', 'COORD. ADMON. DE EMP', '', '', '1', '2014-05-01', '2014-05-01', '', '', '1', null, 'COORDINFORMATICA@UABC.EDU.MX', '0', 'F');
INSERT INTO `empleados` VALUES ('8', 'COORD. INFORMATICA', '', '', '1', '2014-05-01', '2014-05-01', '', '', '1', null, 'COORDINFORMATICA@UABC.EDU.MX', '0', 'F');
INSERT INTO `empleados` VALUES ('9', 'COORD. NEGOCIOS INTE', '', '', '1', '2014-05-01', '2014-05-01', '', '', '1', null, 'COORDINFORMATICA@UABC.EDU.MX', '0', 'F');

-- ----------------------------
-- Table structure for esp_prog_edu
-- ----------------------------
DROP TABLE IF EXISTS `esp_prog_edu`;
CREATE TABLE `esp_prog_edu` (
  `especialidad` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo Especificación Nivel Programa (SOLO POSTGRADO)',
  `descripcion` varchar(45) NOT NULL COMMENT 'Descripción Especificación Nivel Programa',
  `status` char(1) NOT NULL COMMENT 'Status esp nivel programa\n1=Activo',
  PRIMARY KEY (`especialidad`),
  UNIQUE KEY `ENP_codigo_UNIQUE` (`especialidad`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COMMENT='<double-click to overwrite multiple objects>';

-- ----------------------------
-- Records of esp_prog_edu
-- ----------------------------
INSERT INTO `esp_prog_edu` VALUES ('1', 'MTIC', '1');
INSERT INTO `esp_prog_edu` VALUES ('2', 'MC', '1');

-- ----------------------------
-- Table structure for estado
-- ----------------------------
DROP TABLE IF EXISTS `estado`;
CREATE TABLE `estado` (
  `estado` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo estado',
  `descripcion` char(30) NOT NULL COMMENT 'Descripcion estado',
  `pais` int(11) NOT NULL COMMENT 'Codigo pais',
  PRIMARY KEY (`estado`),
  UNIQUE KEY `ES_codigo_UNIQUE` (`estado`),
  KEY `fk_estado_pais1` (`pais`),
  CONSTRAINT `fk_estado_pais1` FOREIGN KEY (`pais`) REFERENCES `pais` (`pais`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1 COMMENT='<double-click to overwrite multiple objects>';

-- ----------------------------
-- Records of estado
-- ----------------------------
INSERT INTO `estado` VALUES ('1', 'AGUASCALIENTES', '144');
INSERT INTO `estado` VALUES ('2', 'BAJA CALIFORNIA', '144');
INSERT INTO `estado` VALUES ('3', 'BAJA CALIFORNIA SUR', '144');
INSERT INTO `estado` VALUES ('4', 'CAMPECHE', '144');
INSERT INTO `estado` VALUES ('5', 'COAHUILA DE ZARAGOZA', '144');
INSERT INTO `estado` VALUES ('6', 'COLIMA', '144');
INSERT INTO `estado` VALUES ('7', 'CHIAPAS', '144');
INSERT INTO `estado` VALUES ('8', 'CHIHUAHUA', '144');
INSERT INTO `estado` VALUES ('9', 'DISTRITO FEDERAL', '144');
INSERT INTO `estado` VALUES ('10', 'DURANGO', '144');
INSERT INTO `estado` VALUES ('11', 'GUANAJUATO', '144');
INSERT INTO `estado` VALUES ('12', 'GUERRERO', '144');
INSERT INTO `estado` VALUES ('13', 'HIDALGO', '144');
INSERT INTO `estado` VALUES ('14', 'JALISCO', '144');
INSERT INTO `estado` VALUES ('15', 'MEXICO', '144');
INSERT INTO `estado` VALUES ('16', 'MICHOACAN DE OCAMPO', '144');
INSERT INTO `estado` VALUES ('17', 'MORELOS', '144');
INSERT INTO `estado` VALUES ('18', 'NAYARIT', '144');
INSERT INTO `estado` VALUES ('19', 'NUEVO LEON', '144');
INSERT INTO `estado` VALUES ('20', 'OAXACA', '144');
INSERT INTO `estado` VALUES ('21', 'PUEBLA', '144');
INSERT INTO `estado` VALUES ('22', 'QUERETARO', '144');
INSERT INTO `estado` VALUES ('23', 'QUINTANA ROO', '144');
INSERT INTO `estado` VALUES ('24', 'SAN LUIS POTOSI', '144');
INSERT INTO `estado` VALUES ('25', 'SINALOA', '144');
INSERT INTO `estado` VALUES ('26', 'SONORA', '144');
INSERT INTO `estado` VALUES ('27', 'TABASCO', '144');
INSERT INTO `estado` VALUES ('28', 'TAMAULIPAS', '144');
INSERT INTO `estado` VALUES ('29', 'TLAXCALA', '144');
INSERT INTO `estado` VALUES ('30', 'VERACRUZ', '144');
INSERT INTO `estado` VALUES ('31', 'YUCATAN', '144');
INSERT INTO `estado` VALUES ('32', 'ZACATECAS', '144');

-- ----------------------------
-- Table structure for etapas
-- ----------------------------
DROP TABLE IF EXISTS `etapas`;
CREATE TABLE `etapas` (
  `etapa` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código Etapa "B"/"D"/"T"',
  `descripcion` varchar(20) NOT NULL COMMENT 'Descripciónl plan',
  PRIMARY KEY (`etapa`),
  UNIQUE KEY `ET_codigo_UNIQUE` (`etapa`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of etapas
-- ----------------------------
INSERT INTO `etapas` VALUES ('1', 'BASICA');
INSERT INTO `etapas` VALUES ('2', 'DISCIPLINARIA');
INSERT INTO `etapas` VALUES ('3', 'TERMINAL');

-- ----------------------------
-- Table structure for grupos
-- ----------------------------
DROP TABLE IF EXISTS `grupos`;
CREATE TABLE `grupos` (
  `grupo` int(11) NOT NULL COMMENT 'Código Grupo',
  `periodo` int(11) NOT NULL COMMENT 'Periodo de trabajo(Año 4 digitos+ semestre o cuatrim) ej. 20091,20092',
  `plan` int(11) NOT NULL COMMENT 'Código Plan (Año+Semestre)',
  `programaedu` int(11) NOT NULL COMMENT 'Código Programa Educativo( Carrera)',
  `turno` int(11) NOT NULL COMMENT 'Turno',
  PRIMARY KEY (`grupo`,`periodo`),
  KEY `fk_grupos_periodos1` (`periodo`),
  KEY `fk_grupos_turnos1` (`turno`),
  KEY `fk_grupos_planestudio1` (`plan`),
  KEY `fk_grupos_planestudio2` (`programaedu`),
  CONSTRAINT `fk_grupos_periodos1` FOREIGN KEY (`periodo`) REFERENCES `periodos` (`periodo`),
  CONSTRAINT `fk_grupos_planestudio1` FOREIGN KEY (`plan`) REFERENCES `plan_programa` (`plan`),
  CONSTRAINT `fk_grupos_planestudio2` FOREIGN KEY (`programaedu`) REFERENCES `plan_programa` (`programaedu`),
  CONSTRAINT `fk_grupos_turnos1` FOREIGN KEY (`turno`) REFERENCES `turnos` (`turno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of grupos
-- ----------------------------
INSERT INTO `grupos` VALUES ('111', '20142', '20101', '4', '1');
INSERT INTO `grupos` VALUES ('121', '20142', '20101', '4', '1');
INSERT INTO `grupos` VALUES ('211', '20142', '20101', '4', '1');
INSERT INTO `grupos` VALUES ('222', '20142', '20101', '4', '1');
INSERT INTO `grupos` VALUES ('231', '20142', '20101', '4', '1');
INSERT INTO `grupos` VALUES ('232', '20142', '20101', '4', '1');
INSERT INTO `grupos` VALUES ('233', '20142', '20101', '4', '1');
INSERT INTO `grupos` VALUES ('243', '20142', '20092', '4', '1');
INSERT INTO `grupos` VALUES ('311', '20142', '20101', '4', '1');
INSERT INTO `grupos` VALUES ('321', '20142', '20101', '4', '1');
INSERT INTO `grupos` VALUES ('411', '20142', '20101', '4', '1');
INSERT INTO `grupos` VALUES ('421', '20142', '20101', '4', '1');
INSERT INTO `grupos` VALUES ('511', '20142', '20101', '4', '1');

-- ----------------------------
-- Table structure for nvprograma
-- ----------------------------
DROP TABLE IF EXISTS `nvprograma`;
CREATE TABLE `nvprograma` (
  `nivel` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Nivel (1,2,3)',
  `descripcion` varchar(15) NOT NULL COMMENT 'Licenciatura/Postgrado/doctorado',
  PRIMARY KEY (`nivel`),
  UNIQUE KEY `NV_codigo_UNIQUE` (`nivel`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COMMENT='<double-click to overwrite multiple objects>';

-- ----------------------------
-- Records of nvprograma
-- ----------------------------
INSERT INTO `nvprograma` VALUES ('1', 'LICENCIATURA');
INSERT INTO `nvprograma` VALUES ('2', 'POSTGRADO');
INSERT INTO `nvprograma` VALUES ('3', 'TECNICO');

-- ----------------------------
-- Table structure for pais
-- ----------------------------
DROP TABLE IF EXISTS `pais`;
CREATE TABLE `pais` (
  `pais` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo pais',
  `descripcion` varchar(60) NOT NULL COMMENT 'Descripción pais',
  PRIMARY KEY (`pais`),
  UNIQUE KEY `PA_codigo_UNIQUE` (`pais`)
) ENGINE=InnoDB AUTO_INCREMENT=238 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pais
-- ----------------------------
INSERT INTO `pais` VALUES ('1', 'AFGANISTAN');
INSERT INTO `pais` VALUES ('2', 'ALBANIA');
INSERT INTO `pais` VALUES ('3', 'ALEMANIA');
INSERT INTO `pais` VALUES ('4', 'ANDORRA');
INSERT INTO `pais` VALUES ('5', 'ANGOLA');
INSERT INTO `pais` VALUES ('6', 'ANGUILLA');
INSERT INTO `pais` VALUES ('7', 'ANTIGUA Y BARBUDA');
INSERT INTO `pais` VALUES ('8', 'ANTILLAS HOLANDESAS');
INSERT INTO `pais` VALUES ('9', 'ARABIA SAUDI');
INSERT INTO `pais` VALUES ('10', 'ARGELIA');
INSERT INTO `pais` VALUES ('11', 'ARGENTINA');
INSERT INTO `pais` VALUES ('12', 'ARMENIA');
INSERT INTO `pais` VALUES ('13', 'ARUBA');
INSERT INTO `pais` VALUES ('14', 'AUSTRALIA');
INSERT INTO `pais` VALUES ('15', 'AUSTRIA');
INSERT INTO `pais` VALUES ('16', 'AZERBAIYAN');
INSERT INTO `pais` VALUES ('17', 'BAHAMAS');
INSERT INTO `pais` VALUES ('18', 'BAHREIN');
INSERT INTO `pais` VALUES ('19', 'BANGLADESH');
INSERT INTO `pais` VALUES ('20', 'BARBADOS');
INSERT INTO `pais` VALUES ('22', 'BELGICA');
INSERT INTO `pais` VALUES ('23', 'BELICE');
INSERT INTO `pais` VALUES ('25', 'BERMUDAS');
INSERT INTO `pais` VALUES ('27', 'BOLIVIA');
INSERT INTO `pais` VALUES ('28', 'BOSNIA Y HERZEGOVINA');
INSERT INTO `pais` VALUES ('29', 'BOTSWANA');
INSERT INTO `pais` VALUES ('30', 'BRASIL');
INSERT INTO `pais` VALUES ('31', 'BRUNEI');
INSERT INTO `pais` VALUES ('32', 'BULGARIA');
INSERT INTO `pais` VALUES ('34', 'BURUNDI');
INSERT INTO `pais` VALUES ('35', 'CABO VERDE');
INSERT INTO `pais` VALUES ('36', 'CAMBOYA');
INSERT INTO `pais` VALUES ('37', 'CAMERUN');
INSERT INTO `pais` VALUES ('38', 'CANADA');
INSERT INTO `pais` VALUES ('40', 'CHILE');
INSERT INTO `pais` VALUES ('41', 'CHINA');
INSERT INTO `pais` VALUES ('42', 'CHIPRE');
INSERT INTO `pais` VALUES ('43', 'COLOMBIA');
INSERT INTO `pais` VALUES ('45', 'CONGO');
INSERT INTO `pais` VALUES ('46', 'COREA');
INSERT INTO `pais` VALUES ('47', 'COREA DEL NORTE ');
INSERT INTO `pais` VALUES ('48', 'COSTA DE MARFIL');
INSERT INTO `pais` VALUES ('49', 'COSTA RICA');
INSERT INTO `pais` VALUES ('50', 'CROACIA');
INSERT INTO `pais` VALUES ('51', 'CUBA');
INSERT INTO `pais` VALUES ('52', 'DINAMARCA');
INSERT INTO `pais` VALUES ('54', 'DOMINICA');
INSERT INTO `pais` VALUES ('55', 'ECUADOR');
INSERT INTO `pais` VALUES ('56', 'EGIPTO');
INSERT INTO `pais` VALUES ('57', 'EL SALVADOR');
INSERT INTO `pais` VALUES ('58', 'EMIRATOS ARABES UNIDOS');
INSERT INTO `pais` VALUES ('60', 'ESLOVENIA');
INSERT INTO `pais` VALUES ('61', 'ESPAÂ¥A');
INSERT INTO `pais` VALUES ('62', 'ESTADOS UNIDOS DE AMERICA');
INSERT INTO `pais` VALUES ('63', 'ESTONIA');
INSERT INTO `pais` VALUES ('64', 'ETIOPIA');
INSERT INTO `pais` VALUES ('65', 'FIJI');
INSERT INTO `pais` VALUES ('66', 'FILIPINAS');
INSERT INTO `pais` VALUES ('67', 'FINLANDIA');
INSERT INTO `pais` VALUES ('68', 'FRANCIA');
INSERT INTO `pais` VALUES ('69', 'GABON');
INSERT INTO `pais` VALUES ('70', 'GAMBIA');
INSERT INTO `pais` VALUES ('71', 'GEORGIA');
INSERT INTO `pais` VALUES ('72', 'GHANA');
INSERT INTO `pais` VALUES ('73', 'GIBRALTAR');
INSERT INTO `pais` VALUES ('74', 'GRANADA');
INSERT INTO `pais` VALUES ('75', 'GRECIA');
INSERT INTO `pais` VALUES ('76', 'GROENLANDIA');
INSERT INTO `pais` VALUES ('78', 'GUAM');
INSERT INTO `pais` VALUES ('79', 'GUATEMALA');
INSERT INTO `pais` VALUES ('80', 'GUAYANA FRANCESA');
INSERT INTO `pais` VALUES ('81', 'GUERNESEY');
INSERT INTO `pais` VALUES ('82', 'GUINEA');
INSERT INTO `pais` VALUES ('83', 'GUINEA ECUATORIAL');
INSERT INTO `pais` VALUES ('84', 'GUINEA-BISSAU');
INSERT INTO `pais` VALUES ('85', 'GUYANA');
INSERT INTO `pais` VALUES ('86', 'HAITI');
INSERT INTO `pais` VALUES ('87', 'HONDURAS');
INSERT INTO `pais` VALUES ('88', 'HONG KONG');
INSERT INTO `pais` VALUES ('89', 'HUNGRIA');
INSERT INTO `pais` VALUES ('90', 'INDIA');
INSERT INTO `pais` VALUES ('91', 'INDONESIA');
INSERT INTO `pais` VALUES ('92', 'IRAN');
INSERT INTO `pais` VALUES ('93', 'IRAQ');
INSERT INTO `pais` VALUES ('94', 'IRLANDA');
INSERT INTO `pais` VALUES ('95', 'ISLA DE MAN');
INSERT INTO `pais` VALUES ('96', 'ISLA NORFOLK');
INSERT INTO `pais` VALUES ('97', 'ISLANDIA');
INSERT INTO `pais` VALUES ('98', 'ISLAS ALAND');
INSERT INTO `pais` VALUES ('99', 'ISLAS CAIM?N');
INSERT INTO `pais` VALUES ('100', 'ISLAS COOK');
INSERT INTO `pais` VALUES ('101', 'ISLAS DEL CANAL');
INSERT INTO `pais` VALUES ('102', 'ISLAS FEROE');
INSERT INTO `pais` VALUES ('103', 'ISLAS MALVINAS');
INSERT INTO `pais` VALUES ('104', 'ISLAS MARIANAS DEL NORTE');
INSERT INTO `pais` VALUES ('105', 'ISLAS MARSHALL');
INSERT INTO `pais` VALUES ('106', 'ISLAS PITCAIRN');
INSERT INTO `pais` VALUES ('107', 'ISLAS SALOMON');
INSERT INTO `pais` VALUES ('108', 'ISLAS TURCAS Y CAICOS');
INSERT INTO `pais` VALUES ('109', 'ISLAS VIRGENES BRITANICAS');
INSERT INTO `pais` VALUES ('110', 'ISLAS V?RGENES DE LOS ESTADOS UNIDOS');
INSERT INTO `pais` VALUES ('111', 'ISRAEL');
INSERT INTO `pais` VALUES ('112', 'ITALIA');
INSERT INTO `pais` VALUES ('113', 'JAMAICA');
INSERT INTO `pais` VALUES ('114', 'JAPON');
INSERT INTO `pais` VALUES ('115', 'JERSEY');
INSERT INTO `pais` VALUES ('116', 'JORDANIA');
INSERT INTO `pais` VALUES ('117', 'KAZAJSTAN');
INSERT INTO `pais` VALUES ('118', 'KENIA');
INSERT INTO `pais` VALUES ('119', 'KIRGUISTAN');
INSERT INTO `pais` VALUES ('120', 'KIRIBATI');
INSERT INTO `pais` VALUES ('121', 'KUWAIT');
INSERT INTO `pais` VALUES ('122', 'LAOS');
INSERT INTO `pais` VALUES ('123', 'LESOTHO');
INSERT INTO `pais` VALUES ('124', 'LETONIA');
INSERT INTO `pais` VALUES ('125', 'LIBANO');
INSERT INTO `pais` VALUES ('126', 'LIBERIA');
INSERT INTO `pais` VALUES ('127', 'LIBIA');
INSERT INTO `pais` VALUES ('128', 'LIECHTENSTEIN');
INSERT INTO `pais` VALUES ('129', 'LITUANIA');
INSERT INTO `pais` VALUES ('130', 'LUXEMBURGO');
INSERT INTO `pais` VALUES ('131', 'MACAO');
INSERT INTO `pais` VALUES ('132', 'MACEDONIA ');
INSERT INTO `pais` VALUES ('133', 'MADAGASCAR');
INSERT INTO `pais` VALUES ('134', 'MALASIA');
INSERT INTO `pais` VALUES ('135', 'MALAWI');
INSERT INTO `pais` VALUES ('136', 'MALDIVAS');
INSERT INTO `pais` VALUES ('137', 'MALI');
INSERT INTO `pais` VALUES ('138', 'MALTA');
INSERT INTO `pais` VALUES ('139', 'MARRUECOS');
INSERT INTO `pais` VALUES ('140', 'MARTINICA');
INSERT INTO `pais` VALUES ('141', 'MAURICIO');
INSERT INTO `pais` VALUES ('142', 'MAURITANIA');
INSERT INTO `pais` VALUES ('143', 'MAYOTTE');
INSERT INTO `pais` VALUES ('144', 'MEXICO');
INSERT INTO `pais` VALUES ('145', 'MICRONESIA');
INSERT INTO `pais` VALUES ('146', 'MOLDAVIA');
INSERT INTO `pais` VALUES ('147', 'MONACO');
INSERT INTO `pais` VALUES ('148', 'MONGOLIA');
INSERT INTO `pais` VALUES ('149', 'MONTENEGRO');
INSERT INTO `pais` VALUES ('150', 'MONTSERRAT');
INSERT INTO `pais` VALUES ('151', 'MOZAMBIQUE');
INSERT INTO `pais` VALUES ('152', 'MYANMAR');
INSERT INTO `pais` VALUES ('153', 'NAMIBIA');
INSERT INTO `pais` VALUES ('154', 'NAURU');
INSERT INTO `pais` VALUES ('155', 'NEPAL');
INSERT INTO `pais` VALUES ('156', 'NICARAGUA');
INSERT INTO `pais` VALUES ('157', 'NIGER');
INSERT INTO `pais` VALUES ('158', 'NIGERIA');
INSERT INTO `pais` VALUES ('159', 'NIUE');
INSERT INTO `pais` VALUES ('160', 'NORUEGA');
INSERT INTO `pais` VALUES ('161', 'NUEVA CALEDONIA');
INSERT INTO `pais` VALUES ('162', 'NUEVA ZELANDA');
INSERT INTO `pais` VALUES ('163', 'OMAN');
INSERT INTO `pais` VALUES ('164', 'PAISES BAJOS');
INSERT INTO `pais` VALUES ('165', 'PAKISTAN');
INSERT INTO `pais` VALUES ('166', 'PALAOS');
INSERT INTO `pais` VALUES ('167', 'PALESTINA');
INSERT INTO `pais` VALUES ('168', 'PANAMA');
INSERT INTO `pais` VALUES ('169', 'PAPUA NUEVA GUINEA');
INSERT INTO `pais` VALUES ('170', 'PARAGUAY');
INSERT INTO `pais` VALUES ('171', 'PERU');
INSERT INTO `pais` VALUES ('172', 'POLINESIA FRANCESA');
INSERT INTO `pais` VALUES ('173', 'POLONIA');
INSERT INTO `pais` VALUES ('174', 'PORTUGAL');
INSERT INTO `pais` VALUES ('175', 'PUERTO RICO');
INSERT INTO `pais` VALUES ('176', 'QATAR');
INSERT INTO `pais` VALUES ('177', 'REINO UNIDO');
INSERT INTO `pais` VALUES ('178', 'REP.DEMOCRATICA DEL CONGO');
INSERT INTO `pais` VALUES ('179', 'REPUBLICA CENTROAFRICANA');
INSERT INTO `pais` VALUES ('180', 'REPUBLICA CHECA');
INSERT INTO `pais` VALUES ('181', 'REPUBLICA DOMINICANA');
INSERT INTO `pais` VALUES ('182', 'REPUBLICA ESLOVACA');
INSERT INTO `pais` VALUES ('183', 'REUNION');
INSERT INTO `pais` VALUES ('184', 'RUANDA');
INSERT INTO `pais` VALUES ('185', 'RUMANIA');
INSERT INTO `pais` VALUES ('186', 'RUSIA');
INSERT INTO `pais` VALUES ('187', 'SAHARA OCCIDENTAL');
INSERT INTO `pais` VALUES ('188', 'SAMOA');
INSERT INTO `pais` VALUES ('189', 'SAMOA AMERICANA');
INSERT INTO `pais` VALUES ('190', 'SAN BARTOLOME');
INSERT INTO `pais` VALUES ('191', 'SAN CRISTOBAL Y NIEVES');
INSERT INTO `pais` VALUES ('192', 'SAN MARINO');
INSERT INTO `pais` VALUES ('193', 'SAN MARTIN (PARTE FRANCESA)');
INSERT INTO `pais` VALUES ('194', 'SAN PEDRO Y MIQUELON ');
INSERT INTO `pais` VALUES ('195', 'SAN VICENTE Y LAS GRANADINAS');
INSERT INTO `pais` VALUES ('196', 'SANTA HELENA');
INSERT INTO `pais` VALUES ('197', 'SANTA LUCIA');
INSERT INTO `pais` VALUES ('198', 'SANTA SEDE');
INSERT INTO `pais` VALUES ('199', 'SANTO TOME Y PRINCIPE');
INSERT INTO `pais` VALUES ('200', 'SENEGAL');
INSERT INTO `pais` VALUES ('201', 'SERBIA');
INSERT INTO `pais` VALUES ('202', 'SEYCHELLES');
INSERT INTO `pais` VALUES ('203', 'SIERRA LEONA');
INSERT INTO `pais` VALUES ('204', 'SINGAPUR');
INSERT INTO `pais` VALUES ('205', 'SIRIA');
INSERT INTO `pais` VALUES ('206', 'SOMALIA');
INSERT INTO `pais` VALUES ('207', 'SRI LANKA');
INSERT INTO `pais` VALUES ('208', 'SUDAFRICA');
INSERT INTO `pais` VALUES ('209', 'SUDAN');
INSERT INTO `pais` VALUES ('210', 'SUECIA');
INSERT INTO `pais` VALUES ('211', 'SUIZA');
INSERT INTO `pais` VALUES ('212', 'SURINAM');
INSERT INTO `pais` VALUES ('213', 'SVALBARD Y JAN MAYEN');
INSERT INTO `pais` VALUES ('214', 'SWAZILANDIA');
INSERT INTO `pais` VALUES ('215', 'TADYIKISTAN');
INSERT INTO `pais` VALUES ('216', 'TAILANDIA');
INSERT INTO `pais` VALUES ('217', 'TANZANIA');
INSERT INTO `pais` VALUES ('218', 'TIMOR ORIENTAL');
INSERT INTO `pais` VALUES ('219', 'TOGO');
INSERT INTO `pais` VALUES ('220', 'TOKELAU');
INSERT INTO `pais` VALUES ('221', 'TONGA');
INSERT INTO `pais` VALUES ('222', 'TRINIDAD Y TOBAGO');
INSERT INTO `pais` VALUES ('223', 'TUNEZ');
INSERT INTO `pais` VALUES ('224', 'TURKMENISTAN');
INSERT INTO `pais` VALUES ('225', 'TURQUIA');
INSERT INTO `pais` VALUES ('226', 'TUVALU');
INSERT INTO `pais` VALUES ('227', 'UCRANIA');
INSERT INTO `pais` VALUES ('228', 'UGANDA');
INSERT INTO `pais` VALUES ('229', 'URUGUAY');
INSERT INTO `pais` VALUES ('230', 'UZBEKISTAN');
INSERT INTO `pais` VALUES ('231', 'VANUATU');
INSERT INTO `pais` VALUES ('232', 'VENEZUELA');
INSERT INTO `pais` VALUES ('233', 'VIETNAM');
INSERT INTO `pais` VALUES ('234', 'WALLIS Y FORTUNA');
INSERT INTO `pais` VALUES ('235', 'YEMEN');
INSERT INTO `pais` VALUES ('236', 'ZAMBIA');
INSERT INTO `pais` VALUES ('237', 'ZIMBABWE');

-- ----------------------------
-- Table structure for periodos
-- ----------------------------
DROP TABLE IF EXISTS `periodos`;
CREATE TABLE `periodos` (
  `periodo` int(11) NOT NULL COMMENT 'Periodo de trabajo(Año 4 digitos+ semestre o cuatrim) ej. 20091,20092',
  `periodo_pedu` int(11) NOT NULL DEFAULT '1' COMMENT 'Tipo: 1=semestral/2=cuatrimestral',
  `year` int(11) NOT NULL COMMENT 'Año preriodo',
  `mes` int(11) NOT NULL COMMENT 'Mes periodo',
  `descripcion` varchar(40) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL COMMENT 'Descripción',
  `inicio` date NOT NULL COMMENT 'Fecha inicio periodo',
  `fin` date DEFAULT NULL COMMENT 'Fecha fin periodo ',
  PRIMARY KEY (`periodo`),
  UNIQUE KEY `PR_periodo_UNIQUE` (`periodo`),
  KEY `fk_periodos_periodo_prog_edu1` (`periodo_pedu`),
  CONSTRAINT `periodos_ibfk_1` FOREIGN KEY (`periodo_pedu`) REFERENCES `periodo_prog_edu` (`periodo_pedu`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of periodos
-- ----------------------------
INSERT INTO `periodos` VALUES ('20141', '1', '2014', '1', 'PERIODO ENERO-JUNIO 2014', '2014-01-01', '2014-06-30');
INSERT INTO `periodos` VALUES ('20142', '1', '2014', '2', 'PERIODO SEPTIEMBRE-DICIEMBRE 2014', '2014-09-01', '2014-12-31');
INSERT INTO `periodos` VALUES ('20151', '1', '2015', '1', 'Periodo  Julio - Diciembre ', '2014-08-06', '2014-12-31');

-- ----------------------------
-- Table structure for periodo_prog_edu
-- ----------------------------
DROP TABLE IF EXISTS `periodo_prog_edu`;
CREATE TABLE `periodo_prog_edu` (
  `periodo_pedu` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Tipo: 1=semestral/2=cuatrimestral',
  `descripcion` varchar(15) NOT NULL COMMENT 'Descripcion: semestral, cuatrimestral',
  PRIMARY KEY (`periodo_pedu`),
  UNIQUE KEY `TP_codigo_UNIQUE` (`periodo_pedu`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of periodo_prog_edu
-- ----------------------------
INSERT INTO `periodo_prog_edu` VALUES ('1', 'SEMESTRAL');
INSERT INTO `periodo_prog_edu` VALUES ('2', 'CUATRIMESTRAL');
INSERT INTO `periodo_prog_edu` VALUES ('3', 'TRIMESTRAL');
INSERT INTO `periodo_prog_edu` VALUES ('4', 'SABATINO');

-- ----------------------------
-- Table structure for planestudio
-- ----------------------------
DROP TABLE IF EXISTS `planestudio`;
CREATE TABLE `planestudio` (
  `plan` int(11) NOT NULL COMMENT 'Codigo plan estudio',
  `descripcion` varchar(35) NOT NULL COMMENT 'Descripción plan  ("PLAN DE ESTUDIOS "+Año+" "+Semestre)',
  `credpracticas` int(11) NOT NULL COMMENT 'Total Créditos practicas',
  `feciniciovig` date NOT NULL COMMENT 'Fecha inicio Vigencia',
  `fecfinvig` date NOT NULL COMMENT 'Fecha Fin Vigencia',
  `nivel` int(11) NOT NULL,
  PRIMARY KEY (`plan`),
  KEY `fk_planestudiodesc_planestudio1` (`plan`),
  KEY `plan_nivel_fk` (`nivel`),
  CONSTRAINT `plan_nivel_fk` FOREIGN KEY (`nivel`) REFERENCES `nvprograma` (`nivel`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of planestudio
-- ----------------------------
INSERT INTO `planestudio` VALUES ('20091', 'Plan 2009-1', '400', '2014-07-01', '2014-07-31', '1');
INSERT INTO `planestudio` VALUES ('20092', 'Plan 2009 2', '200', '2014-06-19', '2015-02-10', '1');
INSERT INTO `planestudio` VALUES ('20101', 'Otro plan', '200', '2014-06-19', '2014-06-30', '2');

-- ----------------------------
-- Table structure for plan_programa
-- ----------------------------
DROP TABLE IF EXISTS `plan_programa`;
CREATE TABLE `plan_programa` (
  `plan` int(11) NOT NULL COMMENT 'Código Plan (Año+Semestre)',
  `programaedu` int(11) NOT NULL COMMENT 'Carrera',
  PRIMARY KEY (`plan`,`programaedu`),
  KEY `fk_planestudio_programaedu1` (`programaedu`),
  CONSTRAINT `plan_fk` FOREIGN KEY (`plan`) REFERENCES `planestudio` (`plan`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `programaedu_fk` FOREIGN KEY (`programaedu`) REFERENCES `programaedu` (`programaedu`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of plan_programa
-- ----------------------------
INSERT INTO `plan_programa` VALUES ('20091', '1');
INSERT INTO `plan_programa` VALUES ('20092', '1');
INSERT INTO `plan_programa` VALUES ('20101', '1');
INSERT INTO `plan_programa` VALUES ('20091', '2');
INSERT INTO `plan_programa` VALUES ('20092', '2');
INSERT INTO `plan_programa` VALUES ('20101', '2');
INSERT INTO `plan_programa` VALUES ('20091', '3');
INSERT INTO `plan_programa` VALUES ('20092', '3');
INSERT INTO `plan_programa` VALUES ('20101', '3');
INSERT INTO `plan_programa` VALUES ('20091', '4');
INSERT INTO `plan_programa` VALUES ('20092', '4');
INSERT INTO `plan_programa` VALUES ('20091', '5');
INSERT INTO `plan_programa` VALUES ('20092', '5');
INSERT INTO `plan_programa` VALUES ('20091', '6');
INSERT INTO `plan_programa` VALUES ('20092', '6');
INSERT INTO `plan_programa` VALUES ('20101', '6');
INSERT INTO `plan_programa` VALUES ('20091', '7');
INSERT INTO `plan_programa` VALUES ('20092', '7');
INSERT INTO `plan_programa` VALUES ('20091', '8');
INSERT INTO `plan_programa` VALUES ('20101', '8');

-- ----------------------------
-- Table structure for programaedu
-- ----------------------------
DROP TABLE IF EXISTS `programaedu`;
CREATE TABLE `programaedu` (
  `programaedu` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código Programa Educativo( Carrera)',
  `descripcion` varchar(60) NOT NULL COMMENT 'Descripción detallenivprog (carrera)',
  `status` int(11) NOT NULL COMMENT '1=Activa/0=Baja',
  `empleado` int(11) NOT NULL COMMENT 'No empl. coordinador',
  `uacademica` int(11) NOT NULL COMMENT 'Uacademica',
  `especialidad` int(11) DEFAULT NULL COMMENT 'Especialidad programa educativo',
  `nivel` int(11) NOT NULL COMMENT 'Codigo nivel pe (para especificar Licenciatura/Postgrado/doctorado)',
  `periodo_pedu` int(11) NOT NULL COMMENT 'Codigo periodo pe para especificar 1=semestral/2=cuatrimestral',
  PRIMARY KEY (`programaedu`),
  UNIQUE KEY `DNP_codigo_UNIQUE` (`programaedu`),
  KEY `fk_programaedu_empleados1` (`empleado`),
  KEY `fk_programaedu_uacademica1` (`uacademica`),
  KEY `fk_programaedu_nvprograma1` (`nivel`),
  KEY `fk_programaedu_periodo_prog_edu1` (`periodo_pedu`),
  KEY `fk_programaedu_esp_prog_edu1` (`especialidad`),
  CONSTRAINT `fk_programaedu_empleados1` FOREIGN KEY (`empleado`) REFERENCES `empleados` (`empleado`) ON UPDATE CASCADE,
  CONSTRAINT `fk_programaedu_esp_prog_edu1` FOREIGN KEY (`especialidad`) REFERENCES `esp_prog_edu` (`especialidad`) ON UPDATE CASCADE,
  CONSTRAINT `fk_programaedu_nvprograma1` FOREIGN KEY (`nivel`) REFERENCES `nvprograma` (`nivel`) ON UPDATE CASCADE,
  CONSTRAINT `fk_programaedu_periodo_prog_edu1` FOREIGN KEY (`periodo_pedu`) REFERENCES `periodo_prog_edu` (`periodo_pedu`) ON UPDATE CASCADE,
  CONSTRAINT `fk_programaedu_uacademica1` FOREIGN KEY (`uacademica`) REFERENCES `uacademica` (`uacademica`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COMMENT='<double-click to overwrite multiple objects>';

-- ----------------------------
-- Records of programaedu
-- ----------------------------
INSERT INTO `programaedu` VALUES ('1', 'ARTES', '1', '1', '1', null, '1', '1');
INSERT INTO `programaedu` VALUES ('2', 'CONTADURIA', '1', '2', '1', null, '1', '1');
INSERT INTO `programaedu` VALUES ('3', 'ADMON. DE EMPRESAS', '1', '3', '1', null, '1', '1');
INSERT INTO `programaedu` VALUES ('4', 'INFORMATICA', '1', '4', '1', null, '1', '1');
INSERT INTO `programaedu` VALUES ('5', 'NEGOCIOS INTERNACIONALES', '1', '5', '1', null, '1', '1');
INSERT INTO `programaedu` VALUES ('6', 'TRONCO COMUN', '1', '1', '1', '2', '2', '2');
INSERT INTO `programaedu` VALUES ('7', 'CIENCIAS COMPUTACIONALES', '1', '1', '1', '2', '2', '3');
INSERT INTO `programaedu` VALUES ('8', 'MEDICINA', '1', '1', '1', null, '1', '1');

-- ----------------------------
-- Table structure for p_ua
-- ----------------------------
DROP TABLE IF EXISTS `p_ua`;
CREATE TABLE `p_ua` (
  `programaedu` int(11) NOT NULL COMMENT 'Programa educativo',
  `uaprendizaje` int(11) NOT NULL COMMENT 'Unidad de aprendizaje',
  PRIMARY KEY (`programaedu`,`uaprendizaje`),
  KEY `fk_p_ua_programaedu1` (`programaedu`),
  KEY `fk_p_ua_uaprendizaje1` (`uaprendizaje`),
  CONSTRAINT `fk_p_ua_programaedu1` FOREIGN KEY (`programaedu`) REFERENCES `programaedu` (`programaedu`) ON UPDATE CASCADE,
  CONSTRAINT `fk_p_ua_uaprendizaje1` FOREIGN KEY (`uaprendizaje`) REFERENCES `uaprendizaje` (`uaprendizaje`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='<double-click to overwrite multiple objects>';

-- ----------------------------
-- Records of p_ua
-- ----------------------------
INSERT INTO `p_ua` VALUES ('1', '11236');
INSERT INTO `p_ua` VALUES ('1', '11237');
INSERT INTO `p_ua` VALUES ('1', '11238');
INSERT INTO `p_ua` VALUES ('1', '11239');
INSERT INTO `p_ua` VALUES ('1', '11240');
INSERT INTO `p_ua` VALUES ('1', '11249');
INSERT INTO `p_ua` VALUES ('1', '11250');
INSERT INTO `p_ua` VALUES ('1', '11251');
INSERT INTO `p_ua` VALUES ('1', '11252');
INSERT INTO `p_ua` VALUES ('1', '11290');
INSERT INTO `p_ua` VALUES ('1', '11291');
INSERT INTO `p_ua` VALUES ('2', '11236');
INSERT INTO `p_ua` VALUES ('2', '11237');
INSERT INTO `p_ua` VALUES ('2', '11238');
INSERT INTO `p_ua` VALUES ('2', '11239');
INSERT INTO `p_ua` VALUES ('2', '11240');
INSERT INTO `p_ua` VALUES ('2', '11249');
INSERT INTO `p_ua` VALUES ('2', '11250');
INSERT INTO `p_ua` VALUES ('2', '11251');
INSERT INTO `p_ua` VALUES ('2', '11290');
INSERT INTO `p_ua` VALUES ('2', '11291');
INSERT INTO `p_ua` VALUES ('3', '11236');
INSERT INTO `p_ua` VALUES ('3', '11237');
INSERT INTO `p_ua` VALUES ('3', '11238');
INSERT INTO `p_ua` VALUES ('3', '11239');
INSERT INTO `p_ua` VALUES ('3', '11240');
INSERT INTO `p_ua` VALUES ('3', '11249');
INSERT INTO `p_ua` VALUES ('3', '11250');
INSERT INTO `p_ua` VALUES ('3', '11251');
INSERT INTO `p_ua` VALUES ('3', '11252');
INSERT INTO `p_ua` VALUES ('3', '11290');
INSERT INTO `p_ua` VALUES ('3', '11291');
INSERT INTO `p_ua` VALUES ('4', '11290');
INSERT INTO `p_ua` VALUES ('4', '11291');
INSERT INTO `p_ua` VALUES ('5', '11290');
INSERT INTO `p_ua` VALUES ('5', '11291');
INSERT INTO `p_ua` VALUES ('6', '11235');
INSERT INTO `p_ua` VALUES ('6', '11257');
INSERT INTO `p_ua` VALUES ('6', '11258');
INSERT INTO `p_ua` VALUES ('6', '11259');
INSERT INTO `p_ua` VALUES ('6', '11260');
INSERT INTO `p_ua` VALUES ('6', '11290');
INSERT INTO `p_ua` VALUES ('6', '11291');
INSERT INTO `p_ua` VALUES ('7', '11290');
INSERT INTO `p_ua` VALUES ('7', '11291');
INSERT INTO `p_ua` VALUES ('8', '11236');
INSERT INTO `p_ua` VALUES ('8', '11237');
INSERT INTO `p_ua` VALUES ('8', '11238');
INSERT INTO `p_ua` VALUES ('8', '11239');
INSERT INTO `p_ua` VALUES ('8', '11240');
INSERT INTO `p_ua` VALUES ('8', '11249');
INSERT INTO `p_ua` VALUES ('8', '11250');
INSERT INTO `p_ua` VALUES ('8', '11251');
INSERT INTO `p_ua` VALUES ('8', '11252');

-- ----------------------------
-- Table structure for reqseriacion
-- ----------------------------
DROP TABLE IF EXISTS `reqseriacion`;
CREATE TABLE `reqseriacion` (
  `reqseriacion` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Reqseriacion ("O","C")',
  `descripcion` varchar(15) NOT NULL COMMENT 'Obligada/conveniente',
  PRIMARY KEY (`reqseriacion`),
  UNIQUE KEY `RS_codigo_UNIQUE` (`reqseriacion`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COMMENT='<double-click to overwrite multiple objects>';

-- ----------------------------
-- Records of reqseriacion
-- ----------------------------
INSERT INTO `reqseriacion` VALUES ('1', 'SIN SERIACION');
INSERT INTO `reqseriacion` VALUES ('2', 'OBLIGATORIA');
INSERT INTO `reqseriacion` VALUES ('3', 'SUGERIDA');

-- ----------------------------
-- Table structure for status
-- ----------------------------
DROP TABLE IF EXISTS `status`;
CREATE TABLE `status` (
  `status` int(11) NOT NULL COMMENT 'status (1,2,3)',
  `descripcion` varchar(45) CHARACTER SET latin1 COLLATE latin1_spanish_ci DEFAULT NULL COMMENT 'Descripción carga grupo 1=Completado,2=Capturado,3 En proces',
  PRIMARY KEY (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of status
-- ----------------------------
INSERT INTO `status` VALUES ('1', 'CAPTURADO');
INSERT INTO `status` VALUES ('2', 'COMPLETADO');
INSERT INTO `status` VALUES ('3', 'EN PROCESO');

-- ----------------------------
-- Table structure for turnos
-- ----------------------------
DROP TABLE IF EXISTS `turnos`;
CREATE TABLE `turnos` (
  `turno` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Turno  (1,2,3)',
  `descripcion` varchar(20) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL COMMENT 'Descripción: Matutino, Vespertino, Interturnos',
  PRIMARY KEY (`turno`),
  UNIQUE KEY `codigo_UNIQUE` (`turno`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of turnos
-- ----------------------------
INSERT INTO `turnos` VALUES ('1', 'MATUTINO');
INSERT INTO `turnos` VALUES ('2', 'VESPERTINO');
INSERT INTO `turnos` VALUES ('3', 'INTERTURNO');

-- ----------------------------
-- Table structure for uacademica
-- ----------------------------
DROP TABLE IF EXISTS `uacademica`;
CREATE TABLE `uacademica` (
  `uacademica` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo Facultad',
  `descripshort` varchar(10) NOT NULL COMMENT 'Descripcion (FCQ, FCA)',
  `descripcion` varchar(60) NOT NULL COMMENT 'Descripcion Facultad',
  `campus` int(11) NOT NULL COMMENT 'Codigo campus',
  PRIMARY KEY (`uacademica`),
  UNIQUE KEY `UAC_codigo_UNIQUE` (`uacademica`),
  KEY `fk_uacademica_campus1` (`campus`),
  CONSTRAINT `fk_uacademica_campus1` FOREIGN KEY (`campus`) REFERENCES `campus` (`campus`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of uacademica
-- ----------------------------
INSERT INTO `uacademica` VALUES ('1', 'FCA', 'FACULTAD DE CONTADURIA Y ADMINISTRACION', '1');
INSERT INTO `uacademica` VALUES ('2', 'FCQI', 'FACULTAD DE CIENCIAS QUIMICAS E INGENIERIA', '1');
INSERT INTO `uacademica` VALUES ('3', 'FHCS', 'FACULTAD DE HUMANIDADES Y CIENCIAS SOCIALES', '1');
INSERT INTO `uacademica` VALUES ('4', 'FD', 'FACULTAD DE DERECHO', '1');
INSERT INTO `uacademica` VALUES ('5', 'FERI', 'FACULTAD DE ECONOMIA Y RELACIONES INTERNACIONALES', '1');
INSERT INTO `uacademica` VALUES ('6', 'FIN', 'FACULTAD DE INGENIERIA Y NEGOCIOS', '1');
INSERT INTO `uacademica` VALUES ('7', 'FMP', 'FACULTAD DE MEDICINA Y PSICOLOGIA', '1');
INSERT INTO `uacademica` VALUES ('8', 'FO', 'FACULTAD DE ODONTOLOGIA', '1');
INSERT INTO `uacademica` VALUES ('9', 'FTM', 'FACULTAD DE TURISMO Y MERCADOTECNIA', '1');
INSERT INTO `uacademica` VALUES ('10', 'FA', 'FACULTAD DE ARTES', '1');

-- ----------------------------
-- Table structure for uaprendizaje
-- ----------------------------
DROP TABLE IF EXISTS `uaprendizaje`;
CREATE TABLE `uaprendizaje` (
  `uaprendizaje` int(11) NOT NULL COMMENT 'Código uaprendizaje (SOLO NUMERICOS)',
  `plan` int(11) NOT NULL COMMENT 'Codigo plan estudio',
  `descripcionmat` varchar(60) CHARACTER SET latin1 NOT NULL COMMENT 'Descripción  uaprendizaje',
  `HC` int(11) NOT NULL COMMENT 'Horas Clase',
  `HL` int(11) NOT NULL COMMENT 'Horas Laboratorio',
  `HT` int(11) NOT NULL COMMENT 'Horas Taller',
  `HPC` int(11) NOT NULL COMMENT 'Horas',
  `HCL` int(11) NOT NULL COMMENT 'Horas Clinica',
  `HE` int(11) NOT NULL COMMENT 'Horas Extra',
  `creditos` int(11) NOT NULL COMMENT 'Numero de Créditos\n1Hr Clase= 2c',
  `semestre` int(255) DEFAULT NULL,
  `fec_aut` date DEFAULT NULL COMMENT 'Fecha autorización',
  `observa` varchar(60) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Observaciones',
  `caracter` int(11) NOT NULL COMMENT 'Codigo caracter para especificar 1=Obligatoria/2=Optativa',
  `reqseriacion` int(11) NOT NULL COMMENT 'Codigo req seriacion para especificar Obligada/conveniente',
  `claveD` int(11) DEFAULT NULL COMMENT 'Clave materia dependiente.',
  `etapa` int(11) NOT NULL COMMENT 'Código etapa para especificar Basica, Disciplinario, Terminal',
  `coordinaciona` int(11) NOT NULL COMMENT 'Codigo coordinacion area',
  PRIMARY KEY (`uaprendizaje`),
  KEY `fk_uaprendizaje_caracter1` (`caracter`),
  KEY `fk_uaprendizaje_reqseriacion1` (`reqseriacion`),
  KEY `fk_uaprendizaje_etapas1` (`etapa`),
  KEY `fk_uaprendizaje_coordinaciona1` (`coordinaciona`),
  KEY `fk_uaprendizaje_planestudio1` (`plan`),
  KEY `fk_uaprendizaje_uaprendizaje1` (`claveD`),
  CONSTRAINT `fk_uaprendizaje_caracter1` FOREIGN KEY (`caracter`) REFERENCES `caracter` (`caracter`) ON UPDATE CASCADE,
  CONSTRAINT `fk_uaprendizaje_etapas1` FOREIGN KEY (`etapa`) REFERENCES `etapas` (`etapa`) ON UPDATE CASCADE,
  CONSTRAINT `fk_uaprendizaje_planestudio1` FOREIGN KEY (`plan`) REFERENCES `planestudio` (`plan`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_uaprendizaje_reqseriacion1` FOREIGN KEY (`reqseriacion`) REFERENCES `reqseriacion` (`reqseriacion`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='<double-click to overwrite multiple objects>';

-- ----------------------------
-- Records of uaprendizaje
-- ----------------------------
INSERT INTO `uaprendizaje` VALUES ('11235', '20101', 'TRONCO COMUN 0', '4', '4', '4', '4', '4', '4', '24', '1', '2014-07-18', 'vamos a ver', '1', '1', null, '1', '6');
INSERT INTO `uaprendizaje` VALUES ('11236', '20101', 'MATEMATICAS 15', '1', '1', '1', '1', '1', '1', '7', '1', '2014-07-09', null, '2', '1', '0', '1', '1');
INSERT INTO `uaprendizaje` VALUES ('11237', '20101', 'ESPAÑOL', '1', '1', '1', '1', '1', '1', '7', '1', '2014-07-09', null, '1', '1', '0', '1', '22');
INSERT INTO `uaprendizaje` VALUES ('11238', '20101', 'CIVISMO', '1', '1', '1', '1', '1', '1', '7', '1', '2014-07-16', null, '1', '1', '0', '2', '1');
INSERT INTO `uaprendizaje` VALUES ('11239', '20101', 'EDUCACION FISICA', '1', '1', '1', '1', '1', '1', '7', '1', '2014-07-16', null, '2', '1', '0', '3', '6');
INSERT INTO `uaprendizaje` VALUES ('11240', '20101', 'ESGRIMA', '1', '1', '1', '1', '1', '1', '7', '1', '2014-07-16', null, '1', '1', '0', '3', '7');
INSERT INTO `uaprendizaje` VALUES ('11249', '20101', 'GASTRONOMIA', '1', '1', '1', '1', '1', '1', '7', '1', '2014-07-16', null, '1', '1', '0', '2', '10');
INSERT INTO `uaprendizaje` VALUES ('11250', '20101', 'INGLES DE VERDAD', '1', '1', '1', '1', '1', '1', '7', '1', '2014-07-16', null, '2', '1', '0', '1', '1');
INSERT INTO `uaprendizaje` VALUES ('11251', '20101', 'MATERIA 81', '1', '1', '1', '1', '1', '1', '7', '1', '2014-07-16', null, '1', '1', '0', '2', '10');
INSERT INTO `uaprendizaje` VALUES ('11252', '20101', 'MATEBRUTICAS', '1', '1', '1', '1', '1', '1', '7', '1', '2014-07-16', null, '1', '1', '0', '3', '4');
INSERT INTO `uaprendizaje` VALUES ('11257', '20101', 'TRONCO COMUN I', '1', '1', '1', '1', '1', '1', '6', '1', '2014-07-18', 'VAMOS A VER QUE TEAL', '1', '1', null, '1', '5');
INSERT INTO `uaprendizaje` VALUES ('11258', '20101', 'TRONCO COMUN II', '3', '3', '3', '3', '3', '3', '18', '1', '2014-07-18', 'TODAS', '1', '1', null, '1', '6');
INSERT INTO `uaprendizaje` VALUES ('11259', '20101', 'TRONCO COMUN III', '3', '3', '3', '3', '3', '3', '18', '1', '2014-07-18', 'DOS DE TRES', '1', '1', null, '1', '5');
INSERT INTO `uaprendizaje` VALUES ('11260', '20101', 'TRONCO COMUN IV', '0', '0', '0', '0', '0', '0', '0', '1', '2014-07-18', 'TODAS', '1', '1', null, '1', '1');
INSERT INTO `uaprendizaje` VALUES ('11290', '20092', 'MATERIA 1', '3', '3', '3', '3', '3', '3', '21', '1', '2014-07-26', 'VAMOS A VER', '1', '1', null, '1', '7');
INSERT INTO `uaprendizaje` VALUES ('11291', '20092', 'MEDICINA CUANTICA', '3', '3', '3', '3', '3', '3', '21', '1', '2014-07-26', 'vamos a ver', '2', '1', null, '2', '7');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` int(11) NOT NULL,
  `campus` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `unidad` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ua` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `level` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `remember_token` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('8', 'Ivan', 'Duarte', 'wolfogan@gmail.com', 'Real de Calacoaya 7810-3B', '6450706', 'TIJUANA', 'ENSENADA', 'FCA', 'LoganX', '$2y$10$k8fT0GW/Obx8KgZU4hVufOt/stcuq3Y9Z8/9StZEMuLWOCmjfK1hO', '0', '2014-04-19 12:30:58', '2014-04-19 12:30:58', '');
INSERT INTO `users` VALUES ('9', 'Cynthia', 'Duarte', 'zyntya@hotmail.com', 'Col. Nueva Tijuana', '6233987', 'TIJUANA', 'VALLE DE LA TRINIDAD', 'FD', 'Tikita', '$2y$10$9qAw9XKA/BtqYRg5WS087.3WjqG.eH0P8.JiLsY7BF4nBAZAPJ752', '1', '2014-04-19 12:30:58', '2014-07-18 10:39:59', 'NVoIfffFK4wyEGXKWkvK4KTEPJMkAvkhpEq7hAisugLK4KwYAnCwap6LpmuW');
INSERT INTO `users` VALUES ('10', 'Raúl', 'Contreras', 'Raulito21@gmail.com', 'Calle 9 de julio #244', '52224799', 'TIJUANA', 'VALLE DE LAS PALMAS', 'FCA', 'ra21', '$2y$10$BCYlojviBdFVCG4jfpdcluYJWLW/2/gGIjDsgxPcKWRx09DpE1Oce', '0', '2014-04-19 12:31:10', '2014-04-19 12:31:10', '');
INSERT INTO `users` VALUES ('11', 'Juanelon', 'Rosado de la colina', 'paquito@gmail.com', 'Real de patito 50', '6457896', 'TIJUANA', 'HISTORICO', 'FHD', 'paquito', '$2y$10$NFJnp7SweU./sBw/YqBuM.Fg1mHuVjngo2e55Z/p9w.JxpliC6QlC', '0', '2014-04-21 08:08:27', '2014-04-21 10:03:15', '');
INSERT INTO `users` VALUES ('17', 'unice', 'unice', 'unice@gmail.com', 'nose donde vive', '2147483647', 'TIJUANA', 'HISTORICO', 'FD', 'uni', '$2y$10$T3ztXBdUMPxZGvOSyNk8wuSKCiX2gYu7WSLZ9ANkm5XVBda2Rm2Ye', '1', '2014-04-25 02:42:07', '2014-04-25 02:42:07', '');

-- ----------------------------
-- Procedure structure for SP_campus_1SEL
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_campus_1SEL`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_campus_1SEL`(
IN p_campus int(11))
BEGIN
-- -----------------------------------------------------
-- SP SELECCIONA 1 CAMPUS           uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
SELECT `campus`, `descripcion`, `direccion`, `ciudad`
FROM `campus`
WHERE `campus` = p_campus;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_caracter_1SEL
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_caracter_1SEL`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_caracter_1SEL`(
IN p_caracter int(11))
BEGIN
-- -----------------------------------------------------
-- SP Selecciona 1  CARACTER	      uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
SELECT `caracter`, `descripcion`
FROM `caracter`
WHERE `caracter` = p_caracter;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_carga_1SEL
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_carga_1SEL`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_carga_1SEL`(
IN p_grupo int(11), 
IN p_periodo int(11), 
IN p_uaprendizaje int(11))
BEGIN
-- -----------------------------------------------------
-- SP Celecciona 1 CARGA	            uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
SELECT `grupo`, `periodo`, `uaprendizaje`, `status`
FROM `carga`
WHERE `grupo` = p_grupo AND `periodo` = p_periodo AND `uaprendizaje` = p_uaprendizaje;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_categorias_1SEL
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_categorias_1SEL`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_categorias_1SEL`(
IN p_categoria int(11))
BEGIN
-- -----------------------------------------------------
-- SP Seleccion 1  CATEGORIAS	      uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
SELECT `categoria`, `descripcion`, `nivel`
FROM `categorias`
WHERE `categoria` = p_categoria;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_ciudad_1SEL
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_ciudad_1SEL`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ciudad_1SEL`(
IN p_ciudad int(11))
BEGIN
-- -----------------------------------------------------
-- SP Selecciona 1 CIUDAD           uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
SELECT `ciudad`, `descripcion`, `estado`
FROM `ciudad`
WHERE `ciudad` = p_ciudad;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_coordinaciona_1SEL
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_coordinaciona_1SEL`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_coordinaciona_1SEL`(
IN p_coordinaciona int(11))
BEGIN
-- -----------------------------------------------------
-- SP Selecciona 1 COORDINACION     uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
SELECT `coordinaciona`, `descripcion`, `programaedu`
FROM `coordinaciona`
WHERE `coordinaciona` = p_coordinaciona;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_DEL_campus
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_DEL_campus`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DEL_campus`(
IN p_campus int(11))
BEGIN
-- -----------------------------------------------------
-- SP BORRA CAMPUS	            uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
DELETE FROM `campus`
WHERE `campus` = p_campus;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_DEL_caracter
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_DEL_caracter`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DEL_caracter`(
IN p_caracter int(11))
BEGIN
-- -----------------------------------------------------
-- SP Borra CARACTER	            uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
DELETE FROM `caracter`
WHERE `caracter` = p_caracter;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_DEL_carga
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_DEL_carga`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DEL_carga`(
IN p_grupo int(11), 
IN p_periodo int(11), 
IN p_uaprendizaje int(11))
BEGIN
-- -----------------------------------------------------
-- SP Borra CARGA	                uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
DELETE FROM `carga`
WHERE `grupo` = p_grupo AND `periodo` = p_periodo AND `uaprendizaje` = p_uaprendizaje;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_DEL_categorias
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_DEL_categorias`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DEL_categorias`(
IN p_categoria int(11))
BEGIN
-- -----------------------------------------------------
-- SP Borra CATEGORIAS	           uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
DELETE FROM `categorias`
WHERE `categoria` = p_categoria;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_DEL_ciudad
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_DEL_ciudad`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DEL_ciudad`(
IN p_ciudad int(11))
BEGIN
-- -----------------------------------------------------
-- SP Borra CIUDAD                  uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
DELETE FROM `ciudad`
WHERE `ciudad` = p_ciudad;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_DEL_coordinaciona
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_DEL_coordinaciona`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DEL_coordinaciona`(
IN p_coordinaciona int(11))
BEGIN
-- -----------------------------------------------------
-- SP Borra COORDINACION            uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
DELETE FROM `coordinaciona`
WHERE `coordinaciona` = p_coordinaciona;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_DEL_directivopuesto
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_DEL_directivopuesto`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DEL_directivopuesto`(
IN p_directivopuesto int(11))
BEGIN
-- -----------------------------------------------------
-- SP Borra DIRECTIVOPUESTO         uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
DELETE FROM `directivopuesto`
WHERE `directivopuesto` = p_directivopuesto;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_DEL_directivosua
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_DEL_directivosua`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DEL_directivosua`(
IN p_empleado int(11))
BEGIN
-- -----------------------------------------------------
-- SP Borra DIRECTIVOSUA          uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
DELETE FROM `directivosua`
WHERE `empleado` = p_empleado;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_DEL_empleados
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_DEL_empleados`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DEL_empleados`(
IN p_empleado int(11))
BEGIN
-- -----------------------------------------------------
-- SP Borra EMPLEADOS	            uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
DELETE FROM `empleados`
WHERE `empleado` = p_empleado;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_DEL_esp_prog_edu
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_DEL_esp_prog_edu`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DEL_esp_prog_edu`(
IN p_especialidad int(11))
BEGIN
-- -----------------------------------------------------
-- SP Borra ESP_PROG_EDU	      uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
DELETE FROM `esp_prog_edu`
WHERE `especialidad` = p_especialidad;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_DEL_estado
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_DEL_estado`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DEL_estado`(
IN p_estado int(11))
BEGIN
-- -----------------------------------------------------
-- SP Borra ESTADO      	      uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
DELETE FROM `estado`
WHERE `estado` = p_estado;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_DEL_etapas
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_DEL_etapas`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DEL_etapas`(
IN p_etapa int(11))
BEGIN
-- -----------------------------------------------------
-- SP Borra ETAPAS      	 uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
DELETE FROM `etapas`
WHERE `etapa` = p_etapa;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_DEL_grupos
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_DEL_grupos`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DEL_grupos`(
IN p_grupo int(11), 
IN p_periodo int(11))
BEGIN
-- -----------------------------------------------------
-- SP Borra GRUPOS      	      uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
DELETE FROM `grupos`
WHERE `grupo` = p_grupo AND `periodo` = p_periodo;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_DEL_nvprograma
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_DEL_nvprograma`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DEL_nvprograma`(
IN p_nivel int(11))
BEGIN
-- -----------------------------------------------------
-- SP Borra NV_PROGRAMA             uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
DELETE FROM `nvprograma`
WHERE `nivel` = p_nivel;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_DEL_pais
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_DEL_pais`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DEL_pais`(
IN p_pais int(11))
BEGIN
-- -----------------------------------------------------
-- SP Borra PAIS                    uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
DELETE FROM `pais`
WHERE `pais` = p_pais;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_DEL_periodos
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_DEL_periodos`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DEL_periodos`(
IN p_periodo int(11))
BEGIN
-- -----------------------------------------------------
-- SP Borra PERIODOS                uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
DELETE FROM `periodos`
WHERE `periodo` = p_periodo;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_DEL_periodo_prog_edu
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_DEL_periodo_prog_edu`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DEL_periodo_prog_edu`(
IN p_periodo_pedu int(11))
BEGIN
-- -----------------------------------------------------
-- SP Borra PERIODO_PROG_EDU        uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
DELETE FROM `periodo_prog_edu`
WHERE `periodo_pedu` = p_periodo_pedu;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_DEL_planestudio
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_DEL_planestudio`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DEL_planestudio`(
IN p_plan int(11), 
IN p_programaedu int(11))
BEGIN
-- -----------------------------------------------------
-- SP Borra PLANESTUDIO             uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
DELETE FROM `planestudio`
WHERE `plan` = p_plan AND `programaedu` = p_programaedu;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_DEL_planestudiodesc
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_DEL_planestudiodesc`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DEL_planestudiodesc`(
IN p_plan int(11))
BEGIN
-- -----------------------------------------------------
-- SP Borra 1 PLANESTUDIODESC       uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
DELETE FROM `planestudiodesc`
WHERE `plan` = p_plan;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_DEL_programaedu
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_DEL_programaedu`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DEL_programaedu`(
IN p_programaedu int(11))
BEGIN
-- -----------------------------------------------------
-- SP Borra PROGRAMAEDU             uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
DELETE FROM `programaedu`
WHERE `programaedu` = p_programaedu;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_DEL_p_ua
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_DEL_p_ua`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DEL_p_ua`(
IN p_programaedu int(11), 
IN p_uaprendizaje int(11))
BEGIN
-- -----------------------------------------------------
-- SP Borra P_UA                    uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
DELETE FROM `p_ua`
WHERE `programaedu` = p_programaedu AND `uaprendizaje` = p_uaprendizaje;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_DEL_reqseriacion
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_DEL_reqseriacion`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DEL_reqseriacion`(
IN p_reqseriacion int(11))
BEGIN
-- -----------------------------------------------------
-- SP Borra REQSERIACION            uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
DELETE FROM `reqseriacion`
WHERE `reqseriacion` = p_reqseriacion;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_DEL_status
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_DEL_status`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DEL_status`(
IN p_status int(11))
BEGIN
-- -----------------------------------------------------
-- SP Borra STATUS                  uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
DELETE FROM `status`
WHERE `status` = p_status;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_DEL_turnos
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_DEL_turnos`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DEL_turnos`(
IN p_turno int(11))
BEGIN
-- -----------------------------------------------------
-- SP Borra TURNOS                  uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
DELETE FROM `turnos`
WHERE `turno` = p_turno;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_DEL_uacademica
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_DEL_uacademica`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DEL_uacademica`(
IN p_uacademica int(11))
BEGIN
-- -----------------------------------------------------
-- SP Borra UACADEMICA              uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
DELETE FROM `uacademica`
WHERE `uacademica` = p_uacademica;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_DEL_uaprendizaje
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_DEL_uaprendizaje`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DEL_uaprendizaje`(
IN p_uaprendizaje int(11))
BEGIN
-- -----------------------------------------------------
-- SP BorrA UAPRENDIZAJE            uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
DELETE FROM `uaprendizaje`
WHERE `uaprendizaje` = p_uaprendizaje;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_DEL_users
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_DEL_users`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DEL_users`(
IN p_id int(11))
BEGIN
-- -----------------------------------------------------
-- SP Borra USERS                   uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
DELETE FROM `users`
WHERE `id` = p_id;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_directivopuesto_1SEL
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_directivopuesto_1SEL`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_directivopuesto_1SEL`(
IN p_directivopuesto int(11))
BEGIN
-- -----------------------------------------------------
-- SP Selecciona 1 DIRECTIVOPUESTO  uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
SELECT `directivopuesto`, `descripcion`, `users_id`
FROM `directivopuesto`
WHERE `directivopuesto` = p_directivopuesto;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_directivosua_1SEL
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_directivosua_1SEL`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_directivosua_1SEL`(
IN p_empleado int(11))
BEGIN
-- -----------------------------------------------------
-- SP Selecciona 1 DIRECTIVOSUA       uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
SELECT `empleado`, `uacademica`, `directivopuesto`, `users_id`
FROM `directivosua`
WHERE `empleado` = p_empleado;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_empleados_1SEL
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_empleados_1SEL`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_empleados_1SEL`(
IN p_empleado int(11))
BEGIN
-- -----------------------------------------------------
-- SP Selecciona 1 EMPLEADO	      uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
SELECT `empleado`, `nombres`, `paterno`, `materno`, 
`status`, `sexo`, `rfc`, `fec_nac`, 
`fec_ing`, `email_vigente`, `email_alternat`, `hrstope`, 
`hrslic`, `hrspost`, `ciudad`, `calle`, 
`no_int`, `no_ext`, `colonia`, `cp`, 
`telofna`, `telcasa`, `telcel`, `directivopuesto`, 
`categoria`
FROM `empleados`
WHERE `empleado` = p_empleado;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_esp_prog_edu_1SEL
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_esp_prog_edu_1SEL`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_esp_prog_edu_1SEL`(
IN p_especialidad int(11))
BEGIN
-- -----------------------------------------------------
-- SP Selecciona 1 ESP_PROG_EDU	 uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
SELECT `especialidad`, `descripcion`, `status`
FROM `esp_prog_edu`
WHERE `especialidad` = p_especialidad;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_estado_1SEL
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_estado_1SEL`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_estado_1SEL`(
IN p_estado int(11))
BEGIN
-- -----------------------------------------------------
-- SP Selecciona 1 ESTADO      	 uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
SELECT `estado`, `descripcion`, `pais`
FROM `estado`
WHERE `estado` = p_estado;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_etapas_1SEL
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_etapas_1SEL`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_etapas_1SEL`(
IN p_etapa int(11))
BEGIN
-- -----------------------------------------------------
-- SP Selecciona 1 ETAPAS      	 uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
SELECT `etapa`, `descripcion`
FROM `etapas`
WHERE `etapa` = p_etapa;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_grupos_1SEL
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_grupos_1SEL`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_grupos_1SEL`(
IN p_grupo int(11), 
IN p_periodo int(11))
BEGIN
-- -----------------------------------------------------
-- SP Selecciona 1  GRUPO      	 uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
SELECT `grupo`, `periodo`, `plan`, `programaedu`, 
`turno`
FROM `grupos`
WHERE `grupo` = p_grupo AND `periodo` = p_periodo;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_INS_campus
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_INS_campus`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INS_campus`(
IN p_campus int(11), 
IN p_descripcion varchar(40), 
IN p_direccion varchar(60), 
IN p_ciudad int(11)
)
BEGIN
-- -----------------------------------------------------
-- SP inserta CAMPUS	            uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
INSERT INTO `campus`(`campus`, `descripcion`, `direccion`, `ciudad`) 
VALUES (p_campus, p_descripcion, p_direccion, p_ciudad);
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_INS_caracter
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_INS_caracter`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INS_caracter`(
IN p_caracter int(11), 
IN p_descripcion varchar(15)
)
BEGIN
-- -----------------------------------------------------
-- SP inserta CARACTER	            uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
INSERT INTO `caracter`(`caracter`, `descripcion`) 
VALUES (p_caracter, p_descripcion);
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_INS_carga
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_INS_carga`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INS_carga`(
IN p_grupo int(11), 
IN p_periodo int(11), 
IN p_uaprendizaje int(11), 
IN p_status int(11)
)
BEGIN
-- -----------------------------------------------------
-- SP inserta CARGA	            uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
INSERT INTO `carga`(`grupo`, `periodo`, `uaprendizaje`, `status`) 
VALUES (p_grupo, p_periodo, p_uaprendizaje, p_status);
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_INS_categorias
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_INS_categorias`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INS_categorias`(
IN p_categoria int(11), 
IN p_descripcion varchar(45), 
IN p_nivel char(1)
)
BEGIN
-- -----------------------------------------------------
-- SP inserta CATEGORIAS	            uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
INSERT INTO `categorias`(`categoria`, `descripcion`, `nivel`) 
VALUES (p_categoria, p_descripcion, p_nivel);
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_INS_ciudad
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_INS_ciudad`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INS_ciudad`(
IN p_ciudad int(11), 
IN p_descripcion varchar(60), 
IN p_estado int(11)
)
BEGIN
-- -----------------------------------------------------
-- SP inserta CIUDAD                uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
INSERT INTO `ciudad`(`ciudad`, `descripcion`, `estado`) 
VALUES (p_ciudad, p_descripcion, p_estado);
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_INS_coordinaciona
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_INS_coordinaciona`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INS_coordinaciona`(
IN p_coordinaciona int(11), 
IN p_descripcion varchar(70), 
IN p_programaedu int(11)
)
BEGIN
-- -----------------------------------------------------
-- SP inserta COORDINACION          uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
INSERT INTO `coordinaciona`(`coordinaciona`, `descripcion`, `programaedu`) 
VALUES (p_coordinaciona, p_descripcion, p_programaedu);
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_INS_directivopuesto
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_INS_directivopuesto`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INS_directivopuesto`(
IN p_directivopuesto int(11), 
IN p_descripcion varchar(15), 
IN p_users_id int(11)
)
BEGIN
-- -----------------------------------------------------
-- SP inserta DIRECTIVOPUESTO       uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
INSERT INTO `directivopuesto`(`directivopuesto`, `descripcion`, `users_id`) 
VALUES (p_directivopuesto, p_descripcion, p_users_id);
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_INS_directivosua
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_INS_directivosua`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INS_directivosua`(
IN p_empleado int(11), 
IN p_uacademica int(11), 
IN p_directivopuesto int(11), 
IN p_users_id int(11)
)
BEGIN
-- -----------------------------------------------------
-- SP inserta DIRECTIVOSUA          uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
INSERT INTO `directivosua`(`empleado`, `uacademica`, `directivopuesto`, `users_id`) 
VALUES (p_empleado, p_uacademica, p_directivopuesto, p_users_id);
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_INS_empleados
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_INS_empleados`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INS_empleados`(
IN p_empleado int(11), 
IN p_nombres varchar(30), 
IN p_paterno varchar(20), 
IN p_materno varchar(20), 
IN p_status int(11), 
IN p_sexo char(1), 
IN p_rfc varchar(13), 
IN p_fec_nac date, 
IN p_fec_ing date, 
IN p_email_vigente varchar(30), 
IN p_email_alternat varchar(45), 
IN p_hrstope int(11), 
IN p_hrslic int(11), 
IN p_hrspost int(11), 
IN p_ciudad int(11), 
IN p_calle varchar(45), 
IN p_no_int int(11), 
IN p_no_ext varchar(3), 
IN p_colonia varchar(45), 
IN p_cp int(11), 
IN p_telofna varchar(45), 
IN p_telcasa varchar(45), 
IN p_telcel varchar(45), 
IN p_directivopuesto int(11), 
IN p_categoria int(11)
)
BEGIN
-- -----------------------------------------------------
-- SP inserta EMPLEADOS	            uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
INSERT INTO `empleados`(`empleado`, `nombres`, `paterno`, `materno`, 
`status`, `sexo`, `rfc`, `fec_nac`, 
`fec_ing`, `email_vigente`, `email_alternat`, `hrstope`, 
`hrslic`, `hrspost`, `ciudad`, `calle`, 
`no_int`, `no_ext`, `colonia`, `cp`, 
`telofna`, `telcasa`, `telcel`, `directivopuesto`, 
`categoria`) 
VALUES (p_empleado, p_nombres, p_paterno, p_materno, 
p_status, p_sexo, p_rfc, p_fec_nac, 
p_fec_ing, p_email_vigente, p_email_alternat, p_hrstope, 
p_hrslic, p_hrspost, p_ciudad, p_calle, 
p_no_int, p_no_ext, p_colonia, p_cp, 
p_telofna, p_telcasa, p_telcel, p_directivopuesto, 
p_categoria);
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_INS_esp_prog_edu
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_INS_esp_prog_edu`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INS_esp_prog_edu`(
IN p_especialidad int(11), 
IN p_descripcion varchar(45), 
IN p_status char(1)
)
BEGIN
-- -----------------------------------------------------
-- SP inserta ESP_PROG_EDU	      uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
INSERT INTO `esp_prog_edu`(`especialidad`, `descripcion`, `status`) 
VALUES (p_especialidad, p_descripcion, p_status);
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_INS_estado
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_INS_estado`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INS_estado`(
IN p_estado int(11), 
IN p_descripcion char(30), 
IN p_pais int(11)
)
BEGIN
-- -----------------------------------------------------
-- SP inserta ESTADO      	      uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
INSERT INTO `estado`(`estado`, `descripcion`, `pais`) 
VALUES (p_estado, p_descripcion, p_pais);
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_INS_etapas
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_INS_etapas`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INS_etapas`(
IN p_etapa int(11), 
IN p_descripcion varchar(20)
)
BEGIN
-- -----------------------------------------------------
-- SP inserta ETAPAS      	      uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
INSERT INTO `etapas`(`etapa`, `descripcion`) 
VALUES (p_etapa, p_descripcion);
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_INS_grupos
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_INS_grupos`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INS_grupos`(
IN p_grupo int(11), 
IN p_periodo int(11), 
IN p_plan int(11), 
IN p_programaedu int(11), 
IN p_turno int(11)
)
BEGIN
-- -----------------------------------------------------
-- SP inserta GRUPOS      	      uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
INSERT INTO `grupos`(`grupo`, `periodo`, `plan`, `programaedu`, 
`turno`) 
VALUES (p_grupo, p_periodo, p_plan, p_programaedu, 
p_turno);
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_INS_nvprograma
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_INS_nvprograma`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INS_nvprograma`(
IN p_nivel int(11), 
IN p_descripcion varchar(15)
)
BEGIN
-- -----------------------------------------------------
-- SP inserta NV_PROGRAMA           uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
INSERT INTO `nvprograma`(`nivel`, `descripcion`) 
VALUES (p_nivel, p_descripcion);
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_INS_pais
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_INS_pais`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INS_pais`(
IN p_pais int(11), 
IN p_descripcion varchar(60)
)
BEGIN
-- -----------------------------------------------------
-- SP inserta PAIS                  uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
INSERT INTO `pais`(`pais`, `descripcion`) 
VALUES (p_pais, p_descripcion);
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_INS_periodos
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_INS_periodos`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INS_periodos`(
IN p_periodo int(11), 
IN p_periodo_pedu int(11), 
IN p_year int(11), 
IN p_mes int(11), 
IN p_descripcion varchar(40), 
IN p_inicio date, 
IN p_fin date, 
IN p_status int(11)
)
BEGIN
-- -----------------------------------------------------
-- SP Inserta PERIODOS              uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
INSERT INTO `periodos`(`periodo`, `periodo_pedu`, `year`, `mes`, 
`descripcion`, `inicio`, `fin`, `status`) 
VALUES (p_periodo, p_periodo_pedu, p_year, p_mes, 
p_descripcion, p_inicio, p_fin, p_status);
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_INS_periodo_prog_edu
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_INS_periodo_prog_edu`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INS_periodo_prog_edu`(
IN p_periodo_pedu int(11), 
IN p_descripcion varchar(15)
)
BEGIN
-- -----------------------------------------------------
-- SP inserta PERIODO_PROG_EDU      uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
INSERT INTO `periodo_prog_edu`(`periodo_pedu`, `descripcion`) 
VALUES (p_periodo_pedu, p_descripcion);
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_INS_planestudio
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_INS_planestudio`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INS_planestudio`(
IN p_plan int(11), 
IN p_programaedu int(11), 
IN p_users_id int(11)
)
BEGIN
-- -----------------------------------------------------
-- SP Inserta PLANESTUDIO           uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
INSERT INTO `planestudio`(`plan`, `programaedu`, `users_id`) 
VALUES (p_plan, p_programaedu, p_users_id);
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_INS_planestudiodesc
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_INS_planestudiodesc`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INS_planestudiodesc`(
IN p_plan int(11), 
IN p_descripcion varchar(35), 
IN p_credpracticas int(11), 
IN p_feciniciovig date, 
IN p_fecfinvig date, 
IN p_users_id int(11)
)
BEGIN
-- -----------------------------------------------------
-- SP Inserta PLANESTUDIODESC       uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
INSERT INTO `planestudiodesc`(`plan`, `descripcion`, `credpracticas`, `feciniciovig`, 
`fecfinvig`, `users_id`) 
VALUES (p_plan, p_descripcion, p_credpracticas, p_feciniciovig, 
p_fecfinvig, p_users_id);
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_INS_programaedu
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_INS_programaedu`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INS_programaedu`(
IN p_programaedu int(11), 
IN p_descripcion varchar(60), 
IN p_status int(11), 
IN p_empleado int(11), 
IN p_uacademica int(11), 
IN p_especialidad int(11), 
IN p_nivel int(11), 
IN p_periodo_pedu int(11), 
IN p_users_id int(11)
)
BEGIN
-- -----------------------------------------------------
-- SP Inserta PROGRAMAEDU           uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
INSERT INTO `programaedu`(`programaedu`, `descripcion`, `status`, `empleado`, 
`uacademica`, `especialidad`, `nivel`, `periodo_pedu`, 
`users_id`) 
VALUES (p_programaedu, p_descripcion, p_status, p_empleado, 
p_uacademica, p_especialidad, p_nivel, p_periodo_pedu, 
p_users_id);
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_INS_p_ua
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_INS_p_ua`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INS_p_ua`(
IN p_programaedu int(11), 
IN p_uaprendizaje int(11), 
IN p_users_id int(11)
)
BEGIN
-- -----------------------------------------------------
-- SP inserta P_UA                  uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
INSERT INTO `p_ua`(`programaedu`, `uaprendizaje`, `users_id`) 
VALUES (p_programaedu, p_uaprendizaje, p_users_id);
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_INS_reqseriacion
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_INS_reqseriacion`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INS_reqseriacion`(
IN p_reqseriacion int(11), 
IN p_descripcion varchar(15)
)
BEGIN
-- -----------------------------------------------------
-- SP Inserta REQSERIACION          uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
INSERT INTO `reqseriacion`(`reqseriacion`, `descripcion`) 
VALUES (p_reqseriacion, p_descripcion);
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_INS_status
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_INS_status`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INS_status`(
IN p_status int(11), 
IN p_descripcion varchar(45)
)
BEGIN
-- -----------------------------------------------------
-- SP Inserta STATUS             uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
INSERT INTO `status`(`status`, `descripcion`) 
VALUES (p_status, p_descripcion);
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_INS_turnos
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_INS_turnos`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INS_turnos`(
IN p_turno int(11), 
IN p_descripcion varchar(20)
)
BEGIN
-- -----------------------------------------------------
-- SP Inserta TURNOS                uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
INSERT INTO `turnos`(`turno`, `descripcion`) 
VALUES (p_turno, p_descripcion);
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_INS_uacademica
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_INS_uacademica`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INS_uacademica`(
IN p_uacademica int(11), 
IN p_descripshort varchar(10), 
IN p_descripcion varchar(60), 
IN p_campus int(11)
)
BEGIN
-- -----------------------------------------------------
-- SP Inserta UACADEMICA            uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
INSERT INTO `uacademica`(`uacademica`, `descripshort`, `descripcion`, `campus`) 
VALUES (p_uacademica, p_descripshort, p_descripcion, p_campus);
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_INS_uaprendizaje
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_INS_uaprendizaje`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INS_uaprendizaje`(
IN p_uaprendizaje int(11), 
IN p_descripcionmat varchar(60), 
IN p_HC int(11), 
IN p_HL int(11), 
IN p_HT int(11), 
IN p_HPC int(11), 
IN p_HCL int(11), 
IN p_HE int(11), 
IN p_creditos int(11), 
IN p_fec_aut date, 
IN p_observa varchar(60), 
IN p_semestre_sug int(11), 
IN p_caracter int(11), 
IN p_reqseriacion int(11), 
IN p_etapa int(11), 
IN p_coordinaciona int(11), 
IN p_claveD int(11), 
IN p_plan int(11), 
IN p_users_id int(11)
)
BEGIN
-- -----------------------------------------------------
-- SP Inserta UAPRENDIZAJE          uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
INSERT INTO `uaprendizaje`(`uaprendizaje`, `descripcionmat`, `HC`, `HL`, 
`HT`, `HPC`, `HCL`, `HE`, 
`creditos`, `fec_aut`, `observa`, `semestre_sug`, 
`caracter`, `reqseriacion`, `etapa`, `coordinaciona`, 
`claveD`, `plan`, `users_id`) 
VALUES (p_uaprendizaje, p_descripcionmat, p_HC, p_HL, 
p_HT, p_HPC, p_HCL, p_HE, 
p_creditos, p_fec_aut, p_observa, p_semestre_sug, 
p_caracter, p_reqseriacion, p_etapa, p_coordinaciona, 
p_claveD, p_plan, p_users_id);
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_INS_users
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_INS_users`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INS_users`(
IN p_id int(11), 
IN p_empleado int(11), 
IN p_name varchar(50), 
IN p_last_name varchar(255), 
IN p_email varchar(255), 
IN p_address varchar(255), 
IN p_phone int(11), 
IN p_unidad varchar(255), 
IN p_ua varchar(255), 
IN p_username varchar(255), 
IN p_password varchar(255), 
IN p_level tinyint(1), 
IN p_created_at datetime, 
IN p_updated_at datetime, 
IN p_remember_token varchar(100), 
IN p_uacademica int(11), 
IN p_campus int(11)
)
BEGIN
-- -----------------------------------------------------
-- SP Inserta USERS                 uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
INSERT INTO `users`(`id`, `empleado`, `name`, `last_name`, 
`email`, `address`, `phone`, `unidad`, 
`ua`, `username`, `password`, `level`, 
`created_at`, `updated_at`, `remember_token`, `uacademica`, 
`campus`) 
VALUES (p_id, p_empleado, p_name, p_last_name, 
p_email, p_address, p_phone, p_unidad, 
p_ua, p_username, p_password, p_level, 
p_created_at, p_updated_at, p_remember_token, p_uacademica, 
p_campus);
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_nvprograma_1SEL
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_nvprograma_1SEL`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_nvprograma_1SEL`(
IN p_nivel int(11))
BEGIN
-- -----------------------------------------------------
-- SP Selecciona 1 NV_PROGRAMA      uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
SELECT `nivel`, `descripcion`
FROM `nvprograma`
WHERE `nivel` = p_nivel;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_pais_1SEL
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_pais_1SEL`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_pais_1SEL`(
IN p_pais int(11))
BEGIN
-- -----------------------------------------------------
-- SP Selecciona 1 PAIS             uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
SELECT `pais`, `descripcion`
FROM `pais`
WHERE `pais` = p_pais;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_periodos_1SEL
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_periodos_1SEL`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_periodos_1SEL`(
IN p_periodo int(11))
BEGIN
-- -----------------------------------------------------
-- SP Selecciona 1 PERIODOS         uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
SELECT `periodo`, `periodo_pedu`, `year`, `mes`, 
`descripcion`, `inicio`, `fin`, `status`
FROM `periodos`
WHERE `periodo` = p_periodo;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_periodo_prog_edu_1SEL
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_periodo_prog_edu_1SEL`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_periodo_prog_edu_1SEL`(
IN p_periodo_pedu int(11))
BEGIN
-- -----------------------------------------------------
-- SP Selecciona 1 PERIODO_PROG_EDU uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
SELECT `periodo_pedu`, `descripcion`
FROM `periodo_prog_edu`
WHERE `periodo_pedu` = p_periodo_pedu;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_planestudiodesc_1SEL
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_planestudiodesc_1SEL`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_planestudiodesc_1SEL`(
IN p_plan int(11))
BEGIN
-- -----------------------------------------------------
-- SP Selecciona 1 PLANESTUDIODESC  uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
SELECT `plan`, `descripcion`, `credpracticas`, `feciniciovig`, 
`fecfinvig`, `users_id`
FROM `planestudiodesc`
WHERE `plan` = p_plan;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_planestudio_1SEL
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_planestudio_1SEL`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_planestudio_1SEL`(
IN p_plan int(11), 
IN p_programaedu int(11))
BEGIN
-- -----------------------------------------------------
-- SP Selecciona 1 PLANESTUDIO      uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
SELECT `plan`, `programaedu`, `users_id`
FROM `planestudio`
WHERE `plan` = p_plan AND `programaedu` = p_programaedu;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_programaedu_1SEL
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_programaedu_1SEL`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_programaedu_1SEL`(
IN p_programaedu int(11))
BEGIN
-- -----------------------------------------------------
-- SP Selecciona 1 PROGRAMAEDU      uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
SELECT `programaedu`, `descripcion`, `status`, `empleado`, 
`uacademica`, `especialidad`, `nivel`, `periodo_pedu`, 
`users_id`
FROM `programaedu`
WHERE `programaedu` = p_programaedu;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_p_ua_1SEL
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_p_ua_1SEL`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_p_ua_1SEL`(
IN p_programaedu int(11), 
IN p_uaprendizaje int(11))
BEGIN
-- -----------------------------------------------------
-- SP Selecciona 1 P_UA             uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
SELECT `programaedu`, `uaprendizaje`, `users_id`
FROM `p_ua`
WHERE `programaedu` = p_programaedu AND `uaprendizaje` = p_uaprendizaje;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_reqseriacion_1SEL
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_reqseriacion_1SEL`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_reqseriacion_1SEL`(
IN p_reqseriacion int(11))
BEGIN
-- -----------------------------------------------------
-- SP Selecciona 1 REQSERIACION     uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
SELECT `reqseriacion`, `descripcion`
FROM `reqseriacion`
WHERE `reqseriacion` = p_reqseriacion;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_SEL_campus
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_SEL_campus`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SEL_campus`()
BEGIN
-- -----------------------------------------------------
-- SP SELECCIONA CAMPUS	            uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
SELECT `campus`, `descripcion`, `direccion`, `ciudad`
FROM `campus`;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_SEL_caracter
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_SEL_caracter`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SEL_caracter`()
BEGIN
-- -----------------------------------------------------
-- SP selecciona CARACTER	      uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
SELECT `caracter`, `descripcion`
FROM `caracter`;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_SEL_carga
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_SEL_carga`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SEL_carga`()
BEGIN
-- -----------------------------------------------------
-- SP Selecciona CARGA	            uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
SELECT `grupo`, `periodo`, `uaprendizaje`, `status`
FROM `carga`;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_SEL_categorias
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_SEL_categorias`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SEL_categorias`()
BEGIN
-- -----------------------------------------------------
-- SP Selecciona CATEGORIAS         uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
SELECT `categoria`, `descripcion`, `nivel`
FROM `categorias`;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_SEL_ciudad
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_SEL_ciudad`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SEL_ciudad`()
BEGIN
-- -----------------------------------------------------
-- SP Selecciona CIUDAD             uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
SELECT `ciudad`, `descripcion`, `estado`
FROM `ciudad`;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_SEL_coordinaciona
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_SEL_coordinaciona`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SEL_coordinaciona`()
BEGIN
-- -----------------------------------------------------
-- SP Selecciona COORDINACION       uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
SELECT `coordinaciona`, `descripcion`, `programaedu`
FROM `coordinaciona`;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_SEL_directivopuesto
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_SEL_directivopuesto`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SEL_directivopuesto`()
BEGIN
-- -----------------------------------------------------
-- SP Selecciona DIRECTIVOPUESTO    uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
SELECT `directivopuesto`, `descripcion`, `users_id`
FROM `directivopuesto`;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_SEL_directivosua
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_SEL_directivosua`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SEL_directivosua`()
BEGIN
-- -----------------------------------------------------
-- SP Selecciona DIRECTIVOSUA       uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
SELECT `empleado`, `uacademica`, `directivopuesto`, `users_id`
FROM `directivosua`;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_SEL_empleados
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_SEL_empleados`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SEL_empleados`()
BEGIN
-- -----------------------------------------------------
-- SP Selecciona EMPLEADOS	      uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
SELECT `empleado`, `nombres`, `paterno`, `materno`, 
`status`, `sexo`, `rfc`, `fec_nac`, 
`fec_ing`, `email_vigente`, `email_alternat`, `hrstope`, 
`hrslic`, `hrspost`, `ciudad`, `calle`, 
`no_int`, `no_ext`, `colonia`, `cp`, 
`telofna`, `telcasa`, `telcel`, `directivopuesto`, 
`categoria`
FROM `empleados`;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_SEL_esp_prog_edu
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_SEL_esp_prog_edu`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SEL_esp_prog_edu`()
BEGIN
-- -----------------------------------------------------
-- SP Selecciona ESP_PROG_EDU	      uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
SELECT `especialidad`, `descripcion`, `status`
FROM `esp_prog_edu`;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_SEL_estado
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_SEL_estado`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SEL_estado`()
BEGIN
-- -----------------------------------------------------
-- SP Selecciona ESTADO      	      uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
SELECT `estado`, `descripcion`, `pais`
FROM `estado`;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_SEL_etapas
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_SEL_etapas`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SEL_etapas`()
BEGIN
-- -----------------------------------------------------
-- SP Selecciona ETAPAS      	      uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
SELECT `etapa`, `descripcion`
FROM `etapas`;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_SEL_grupos
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_SEL_grupos`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SEL_grupos`()
BEGIN
-- -----------------------------------------------------
-- SP Selecciona GRUPOS      	      uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
SELECT `grupo`, `periodo`, `plan`, `programaedu`, 
`turno`
FROM `grupos`;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_SEL_nvprograma
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_SEL_nvprograma`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SEL_nvprograma`()
BEGIN
-- -----------------------------------------------------
-- SP Selecciona NV_PROGRAMA        uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
SELECT `nivel`, `descripcion`
FROM `nvprograma`;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_SEL_pais
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_SEL_pais`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SEL_pais`()
BEGIN
-- -----------------------------------------------------
-- SP Selecciona PAIS               uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
SELECT `pais`, `descripcion`
FROM `pais`;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_SEL_periodos
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_SEL_periodos`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SEL_periodos`()
BEGIN
-- -----------------------------------------------------
-- SP Selecciona PERIODOS           uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
SELECT `periodo`, `periodo_pedu`, `year`, `mes`, 
`descripcion`, `inicio`, `fin`, `status`
FROM `periodos`;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_SEL_periodo_prog_edu
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_SEL_periodo_prog_edu`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SEL_periodo_prog_edu`()
BEGIN
-- -----------------------------------------------------
-- SP Selecciona PERIODO_PROG_EDU   uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
SELECT `periodo_pedu`, `descripcion`
FROM `periodo_prog_edu`;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_SEL_planestudio
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_SEL_planestudio`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SEL_planestudio`()
BEGIN
-- -----------------------------------------------------
-- SP Selecciona PLANESTUDIO        uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
SELECT `plan`, `programaedu`, `users_id`
FROM `planestudio`;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_SEL_planestudiodesc
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_SEL_planestudiodesc`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SEL_planestudiodesc`()
BEGIN
-- -----------------------------------------------------
-- SP Selecciona  PLANESTUDIODESC   uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
SELECT `plan`, `descripcion`, `credpracticas`, `feciniciovig`, 
`fecfinvig`, `users_id`
FROM `planestudiodesc`;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_SEL_programaedu
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_SEL_programaedu`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SEL_programaedu`()
BEGIN
-- -----------------------------------------------------
-- SP Selecciona PROGRAMAEDU        uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
SELECT `programaedu`, `descripcion`, `status`, `empleado`, 
`uacademica`, `especialidad`, `nivel`, `periodo_pedu`, 
`users_id`
FROM `programaedu`;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_SEL_p_ua
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_SEL_p_ua`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SEL_p_ua`()
BEGIN
-- -----------------------------------------------------
-- SP Selecciona P_UA               uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
SELECT `programaedu`, `uaprendizaje`, `users_id`
FROM `p_ua`;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_SEL_reqseriacion
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_SEL_reqseriacion`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SEL_reqseriacion`()
BEGIN
-- -----------------------------------------------------
-- SP Selecciona REQSERIACION       uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
SELECT `reqseriacion`, `descripcion`
FROM `reqseriacion`;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_SEL_status
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_SEL_status`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SEL_status`()
BEGIN
-- -----------------------------------------------------
-- SP Selecciona STATUS             uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
SELECT `status`, `descripcion`
FROM `status`;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_SEL_turnos
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_SEL_turnos`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SEL_turnos`()
BEGIN
-- -----------------------------------------------------
-- SP Selecciona TURNOS             uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
SELECT `turno`, `descripcion`
FROM `turnos`;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_SEL_uacademica
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_SEL_uacademica`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SEL_uacademica`()
BEGIN
-- -----------------------------------------------------
-- SP Selecciona UACADEMICA         uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
SELECT `uacademica`, `descripshort`, `descripcion`, `campus`
FROM `uacademica`;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_SEL_uaprendizaje
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_SEL_uaprendizaje`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SEL_uaprendizaje`()
BEGIN
-- -----------------------------------------------------
-- SP Selecciona UAPRENDIZAJE       uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
SELECT `uaprendizaje`, `descripcionmat`, `HC`, `HL`, 
`HT`, `HPC`, `HCL`, `HE`, 
`creditos`, `fec_aut`, `observa`, `semestre_sug`, 
`caracter`, `reqseriacion`, `etapa`, `coordinaciona`, 
`claveD`, `plan`, `users_id`
FROM `uaprendizaje`;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_SEL_users
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_SEL_users`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SEL_users`()
BEGIN
-- -----------------------------------------------------
-- SP Selecciona USERS              uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
SELECT `id`, `empleado`, `name`, `last_name`, 
`email`, `address`, `phone`, `unidad`, 
`ua`, `username`, `password`, `level`, 
`created_at`, `updated_at`, `remember_token`, `uacademica`, 
`campus`
FROM `users`;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_status_1SEL
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_status_1SEL`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_status_1SEL`(
IN p_status int(11))
BEGIN
-- -----------------------------------------------------
-- SP Selecciona 1 STATUS           uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
SELECT `status`, `descripcion`
FROM `status`
WHERE `status` = p_status;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_turnos_1SEL
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_turnos_1SEL`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_turnos_1SEL`(
IN p_turno int(11))
BEGIN
-- -----------------------------------------------------
-- SP Selecciona 1 TURNO            uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
SELECT `turno`, `descripcion`
FROM `turnos`
WHERE `turno` = p_turno;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_uacademica_1SEL
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_uacademica_1SEL`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_uacademica_1SEL`(
IN p_uacademica int(11))
BEGIN
-- -----------------------------------------------------
-- SP Selecciona 1 UACADEMICA       uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
SELECT `uacademica`, `descripshort`, `descripcion`, `campus`
FROM `uacademica`
WHERE `uacademica` = p_uacademica;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_uaprendizaje_1SEL
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_uaprendizaje_1SEL`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_uaprendizaje_1SEL`(
IN p_uaprendizaje int(11))
BEGIN
-- -----------------------------------------------------
-- SP Selecciona 1 UAPRENDIZAJE     uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
SELECT `uaprendizaje`, `descripcionmat`, `HC`, `HL`, 
`HT`, `HPC`, `HCL`, `HE`, 
`creditos`, `fec_aut`, `observa`, `semestre_sug`, 
`caracter`, `reqseriacion`, `etapa`, `coordinaciona`, 
`claveD`, `plan`, `users_id`
FROM `uaprendizaje`
WHERE `uaprendizaje` = p_uaprendizaje;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_UPD_campus
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_UPD_campus`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPD_campus`(
IN p_campus int(11), 
IN p_descripcion varchar(40), 
IN p_direccion varchar(60), 
IN p_ciudad int(11)
)
BEGIN
-- -----------------------------------------------------
-- SP ACTUALIZA CAMPUS	            uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
UPDATE `campus` 
SET `descripcion` = p_descripcion, `direccion` = p_direccion, `ciudad` = p_ciudad
WHERE `campus` = p_campus;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_UPD_caracter
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_UPD_caracter`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPD_caracter`(
IN p_caracter int(11), 
IN p_descripcion varchar(15)
)
BEGIN
-- -----------------------------------------------------
-- SP Actualiza CARACTER	            uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
UPDATE `caracter` 
SET `descripcion` = p_descripcion
WHERE `caracter` = p_caracter;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_UPD_carga
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_UPD_carga`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPD_carga`(
IN p_grupo int(11), 
IN p_periodo int(11), 
IN p_uaprendizaje int(11), 
IN p_status int(11)
)
BEGIN
-- -----------------------------------------------------
-- SP Actualiza CARGA	            uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
UPDATE `carga` 
SET `status` = p_status
WHERE `grupo` = p_grupo AND `periodo` = p_periodo AND `uaprendizaje` = p_uaprendizaje;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_UPD_categorias
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_UPD_categorias`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPD_categorias`(
IN p_categoria int(11), 
IN p_descripcion varchar(45), 
IN p_nivel char(1)
)
BEGIN
-- -----------------------------------------------------
-- SP Actualiza CATEGORIAS	      uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
UPDATE `categorias` 
SET `descripcion` = p_descripcion, `nivel` = p_nivel
WHERE `categoria` = p_categoria;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_UPD_ciudad
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_UPD_ciudad`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPD_ciudad`(
IN p_ciudad int(11), 
IN p_descripcion varchar(60), 
IN p_estado int(11)
)
BEGIN
-- -----------------------------------------------------
-- SP Actualiza CIUDAD              uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
UPDATE `ciudad` 
SET `descripcion` = p_descripcion, `estado` = p_estado
WHERE `ciudad` = p_ciudad;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_UPD_coordinaciona
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_UPD_coordinaciona`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPD_coordinaciona`(
IN p_coordinaciona int(11), 
IN p_descripcion varchar(70), 
IN p_programaedu int(11)
)
BEGIN
-- -----------------------------------------------------
-- SP Actualiza COORDINACION        uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
UPDATE `coordinaciona` 
SET `descripcion` = p_descripcion, `programaedu` = p_programaedu
WHERE `coordinaciona` = p_coordinaciona;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_UPD_directivopuesto
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_UPD_directivopuesto`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPD_directivopuesto`(
IN p_directivopuesto int(11), 
IN p_descripcion varchar(15), 
IN p_users_id int(11)
)
BEGIN
-- -----------------------------------------------------
-- SP Actualiza DIRECTIVOPUESTO     uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
UPDATE `directivopuesto` 
SET `descripcion` = p_descripcion, `users_id` = p_users_id
WHERE `directivopuesto` = p_directivopuesto;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_UPD_directivosua
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_UPD_directivosua`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPD_directivosua`(
IN p_empleado int(11), 
IN p_uacademica int(11), 
IN p_directivopuesto int(11), 
IN p_users_id int(11)
)
BEGIN
-- -----------------------------------------------------
-- SP Actualiza DIRECTIVOSUA          uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
UPDATE `directivosua` 
SET `uacademica` = p_uacademica, `directivopuesto` = p_directivopuesto, `users_id` = p_users_id
WHERE `empleado` = p_empleado;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_UPD_empleados
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_UPD_empleados`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPD_empleados`(
IN p_empleado int(11), 
IN p_nombres varchar(30), 
IN p_paterno varchar(20), 
IN p_materno varchar(20), 
IN p_status int(11), 
IN p_sexo char(1), 
IN p_rfc varchar(13), 
IN p_fec_nac date, 
IN p_fec_ing date, 
IN p_email_vigente varchar(30), 
IN p_email_alternat varchar(45), 
IN p_hrstope int(11), 
IN p_hrslic int(11), 
IN p_hrspost int(11), 
IN p_ciudad int(11), 
IN p_calle varchar(45), 
IN p_no_int int(11), 
IN p_no_ext varchar(3), 
IN p_colonia varchar(45), 
IN p_cp int(11), 
IN p_telofna varchar(45), 
IN p_telcasa varchar(45), 
IN p_telcel varchar(45), 
IN p_directivopuesto int(11), 
IN p_categoria int(11)
)
BEGIN
-- -----------------------------------------------------
-- SP Actualiza EMPLEADOS	      uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
UPDATE `empleados` 
SET `nombres` = p_nombres, `paterno` = p_paterno, `materno` = p_materno, `status` = p_status, 
`sexo` = p_sexo, `rfc` = p_rfc, `fec_nac` = p_fec_nac, `fec_ing` = p_fec_ing, 
`email_vigente` = p_email_vigente, `email_alternat` = p_email_alternat, `hrstope` = p_hrstope, `hrslic` = p_hrslic, 
`hrspost` = p_hrspost, `ciudad` = p_ciudad, `calle` = p_calle, `no_int` = p_no_int, 
`no_ext` = p_no_ext, `colonia` = p_colonia, `cp` = p_cp, `telofna` = p_telofna, 
`telcasa` = p_telcasa, `telcel` = p_telcel, `directivopuesto` = p_directivopuesto, `categoria` = p_categoria
WHERE `empleado` = p_empleado;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_UPD_esp_prog_edu
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_UPD_esp_prog_edu`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPD_esp_prog_edu`(
IN p_especialidad int(11), 
IN p_descripcion varchar(45), 
IN p_status char(1)
)
BEGIN
-- -----------------------------------------------------
-- SP Actualiza ESP_PROG_EDU	      uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
UPDATE `esp_prog_edu` 
SET `descripcion` = p_descripcion, `status` = p_status
WHERE `especialidad` = p_especialidad;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_UPD_estado
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_UPD_estado`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPD_estado`(
IN p_estado int(11), 
IN p_descripcion char(30), 
IN p_pais int(11)
)
BEGIN
-- -----------------------------------------------------
-- SP Actualiza ESTADO      	      uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
UPDATE `estado` 
SET `descripcion` = p_descripcion, `pais` = p_pais
WHERE `estado` = p_estado;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_UPD_etapas
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_UPD_etapas`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPD_etapas`(
IN p_etapa int(11), 
IN p_descripcion varchar(20)
)
BEGIN
-- -----------------------------------------------------
-- SP Actualiza ETAPAS      	      uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
UPDATE `etapas` 
SET `descripcion` = p_descripcion
WHERE `etapa` = p_etapa;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_UPD_grupos
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_UPD_grupos`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPD_grupos`(
IN p_grupo int(11), 
IN p_periodo int(11), 
IN p_plan int(11), 
IN p_programaedu int(11), 
IN p_turno int(11)
)
BEGIN
-- -----------------------------------------------------
-- SP Actualiza GRUPOS      	      uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
UPDATE `grupos` 
SET `plan` = p_plan, `programaedu` = p_programaedu, `turno` = p_turno
WHERE `grupo` = p_grupo AND `periodo` = p_periodo;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_UPD_nvprograma
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_UPD_nvprograma`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPD_nvprograma`(
IN p_nivel int(11), 
IN p_descripcion varchar(15)
)
BEGIN
-- -----------------------------------------------------
-- SP Actualiza NV_PROGRAMA         uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
UPDATE `nvprograma` 
SET `descripcion` = p_descripcion
WHERE `nivel` = p_nivel;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_UPD_pais
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_UPD_pais`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPD_pais`(
IN p_pais int(11), 
IN p_descripcion varchar(60)
)
BEGIN
-- -----------------------------------------------------
-- SP Actualiza PAIS                uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
UPDATE `pais` 
SET `descripcion` = p_descripcion
WHERE `pais` = p_pais;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_UPD_periodos
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_UPD_periodos`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPD_periodos`(
IN p_periodo int(11), 
IN p_periodo_pedu int(11), 
IN p_year int(11), 
IN p_mes int(11), 
IN p_descripcion varchar(40), 
IN p_inicio date, 
IN p_fin date, 
IN p_status int(11)
)
BEGIN
-- -----------------------------------------------------
-- SP Actualiza PERIODOS            uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
UPDATE `periodos` 
SET `periodo_pedu` = p_periodo_pedu, `year` = p_year, `mes` = p_mes, `descripcion` = p_descripcion, 
`inicio` = p_inicio, `fin` = p_fin, `status` = p_status
WHERE `periodo` = p_periodo;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_UPD_periodo_prog_edu
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_UPD_periodo_prog_edu`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPD_periodo_prog_edu`(
IN p_periodo_pedu int(11), 
IN p_descripcion varchar(15)
)
BEGIN
-- -----------------------------------------------------
-- SP Actualiza PERIODO_PROG_EDU   uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
UPDATE `periodo_prog_edu` 
SET `descripcion` = p_descripcion
WHERE `periodo_pedu` = p_periodo_pedu;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_UPD_planestudio
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_UPD_planestudio`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPD_planestudio`(
IN p_plan int(11), 
IN p_programaedu int(11), 
IN p_users_id int(11)
)
BEGIN
-- -----------------------------------------------------
-- SP Actualiza PLANESTUDIO         uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
UPDATE `planestudio` 
SET `users_id` = p_users_id
WHERE `plan` = p_plan AND `programaedu` = p_programaedu;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_UPD_planestudiodesc
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_UPD_planestudiodesc`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPD_planestudiodesc`(
IN p_plan int(11), 
IN p_descripcion varchar(35), 
IN p_credpracticas int(11), 
IN p_feciniciovig date, 
IN p_fecfinvig date, 
IN p_users_id int(11)
)
BEGIN
-- -----------------------------------------------------
-- SP Actualiza PLANESTUDIODESC     uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
UPDATE `planestudiodesc` 
SET `descripcion` = p_descripcion, `credpracticas` = p_credpracticas, `feciniciovig` = p_feciniciovig, `fecfinvig` = p_fecfinvig, 
`users_id` = p_users_id
WHERE `plan` = p_plan;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_UPD_programaedu
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_UPD_programaedu`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPD_programaedu`(
IN p_programaedu int(11), 
IN p_descripcion varchar(60), 
IN p_status int(11), 
IN p_empleado int(11), 
IN p_uacademica int(11), 
IN p_especialidad int(11), 
IN p_nivel int(11), 
IN p_periodo_pedu int(11), 
IN p_users_id int(11)
)
BEGIN
-- -----------------------------------------------------
-- SP Actualiza PROGRAMAEDU         uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
UPDATE `programaedu` 
SET `descripcion` = p_descripcion, `status` = p_status, `empleado` = p_empleado, `uacademica` = p_uacademica, 
`especialidad` = p_especialidad, `nivel` = p_nivel, `periodo_pedu` = p_periodo_pedu, `users_id` = p_users_id
WHERE `programaedu` = p_programaedu;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_UPD_p_ua
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_UPD_p_ua`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPD_p_ua`(
IN p_programaedu int(11), 
IN p_uaprendizaje int(11), 
IN p_users_id int(11)
)
BEGIN
-- -----------------------------------------------------
-- SP Actualiza P_UA                uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
UPDATE `p_ua` 
SET `users_id` = p_users_id
WHERE `programaedu` = p_programaedu AND `uaprendizaje` = p_uaprendizaje;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_UPD_reqseriacion
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_UPD_reqseriacion`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPD_reqseriacion`(
IN p_reqseriacion int(11), 
IN p_descripcion varchar(15)
)
BEGIN
-- -----------------------------------------------------
-- SP Actualiza REQSERIACION        uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
UPDATE `reqseriacion` 
SET `descripcion` = p_descripcion
WHERE `reqseriacion` = p_reqseriacion;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_UPD_status
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_UPD_status`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPD_status`(
IN p_status int(11), 
IN p_descripcion varchar(45)
)
BEGIN
-- -----------------------------------------------------
-- SP Actualiza STATUS              uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
UPDATE `status` 
SET `descripcion` = p_descripcion
WHERE `status` = p_status;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_UPD_turnos
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_UPD_turnos`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPD_turnos`(
IN p_turno int(11), 
IN p_descripcion varchar(20)
)
BEGIN
-- -----------------------------------------------------
-- SP Actualiza TURNOS              uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
UPDATE `turnos` 
SET `descripcion` = p_descripcion
WHERE `turno` = p_turno;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_UPD_uacademica
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_UPD_uacademica`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPD_uacademica`(
IN p_uacademica int(11), 
IN p_descripshort varchar(10), 
IN p_descripcion varchar(60), 
IN p_campus int(11)
)
BEGIN
-- -----------------------------------------------------
-- SP Actualiza UACADEMICA          uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
UPDATE `uacademica` 
SET `descripshort` = p_descripshort, `descripcion` = p_descripcion, `campus` = p_campus
WHERE `uacademica` = p_uacademica;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_UPD_uaprendizaje
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_UPD_uaprendizaje`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPD_uaprendizaje`(
IN p_uaprendizaje int(11), 
IN p_descripcionmat varchar(60), 
IN p_HC int(11), 
IN p_HL int(11), 
IN p_HT int(11), 
IN p_HPC int(11), 
IN p_HCL int(11), 
IN p_HE int(11), 
IN p_creditos int(11), 
IN p_fec_aut date, 
IN p_observa varchar(60), 
IN p_semestre_sug int(11), 
IN p_caracter int(11), 
IN p_reqseriacion int(11), 
IN p_etapa int(11), 
IN p_coordinaciona int(11), 
IN p_claveD int(11), 
IN p_plan int(11), 
IN p_users_id int(11)
)
BEGIN
-- -----------------------------------------------------
-- SP Actualiza UAPRENDIZAJE       uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
UPDATE `uaprendizaje` 
SET `descripcionmat` = p_descripcionmat, `HC` = p_HC, `HL` = p_HL, `HT` = p_HT, 
`HPC` = p_HPC, `HCL` = p_HCL, `HE` = p_HE, `creditos` = p_creditos, 
`fec_aut` = p_fec_aut, `observa` = p_observa, `semestre_sug` = p_semestre_sug, `caracter` = p_caracter, 
`reqseriacion` = p_reqseriacion, `etapa` = p_etapa, `coordinaciona` = p_coordinaciona, `claveD` = p_claveD, 
`plan` = p_plan, `users_id` = p_users_id
WHERE `uaprendizaje` = p_uaprendizaje;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_UPD_users
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_UPD_users`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPD_users`(
IN p_id int(11), 
IN p_empleado int(11), 
IN p_name varchar(50), 
IN p_last_name varchar(255), 
IN p_email varchar(255), 
IN p_address varchar(255), 
IN p_phone int(11), 
IN p_unidad varchar(255), 
IN p_ua varchar(255), 
IN p_username varchar(255), 
IN p_password varchar(255), 
IN p_level tinyint(1), 
IN p_created_at datetime, 
IN p_updated_at datetime, 
IN p_remember_token varchar(100), 
IN p_uacademica int(11), 
IN p_campus int(11)
)
BEGIN
-- -----------------------------------------------------
-- SP Actualiza USERS               uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
UPDATE `users` 
SET `empleado` = p_empleado, `name` = p_name, `last_name` = p_last_name, `email` = p_email, 
`address` = p_address, `phone` = p_phone, `unidad` = p_unidad, `ua` = p_ua, 
`username` = p_username, `password` = p_password, `level` = p_level, `created_at` = p_created_at, 
`updated_at` = p_updated_at, `remember_token` = p_remember_token, `uacademica` = p_uacademica, `campus` = p_campus
WHERE `id` = p_id;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_users_1SEL
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_users_1SEL`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_users_1SEL`(
IN p_id int(11))
BEGIN
-- -----------------------------------------------------
-- SP Selecciona 1  USER            uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Junio 2014 
-- -----------------------------------------------------
SELECT `id`, `empleado`, `name`, `last_name`, 
`email`, `address`, `phone`, `unidad`, 
`ua`, `username`, `password`, `level`, 
`created_at`, `updated_at`, `remember_token`, `uacademica`, 
`campus`
FROM `users`
WHERE `id` = p_id;
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
		('carga', 'tempo', 'I',curdate(),concat_WS('|',
          	NEW.grupo,
          	NEW.periodo,
          	NEW.uaprendizaje,
            NEW.status         
        ));   
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `bit_I_grupos`;
DELIMITER ;;
CREATE TRIGGER `bit_I_grupos` AFTER INSERT ON `grupos` FOR EACH ROW BEGIN
-- -----------------------------------------------------
-- Bitacora al INSERTAR REGISTRO en *grupos*
-- Uso: SIGAF UABC	
-- Autor:Delia Yadira Gambino       Tj. BC Julio 2014 
-- -----------------------------------------------------
	INSERT INTO  `bitacora`
		(tabla, usuario, operacion, fecha,registro) 
	VALUES 
		('grupos', 'tempo', 'I',curdate(),concat_WS('|',
          	NEW.grupo,
          	NEW.periodo,
          	NEW.plan,
            NEW.programaedu,
            NEW.turno
        ));   
END
;;
DELIMITER ;
