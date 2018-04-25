-- phpMyAdmin SQL Dump
-- version 4.0.10
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 19-04-2018 a las 15:08:04
-- Versión del servidor: 5.1.73-community
-- Versión de PHP: 5.3.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `imt_inventario`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ci_sessions`
--

CREATE TABLE IF NOT EXISTS `ci_sessions` (
  `id` varchar(128) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ci_sessions`
--

INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('005c033e0b3d0b205d99f3886afab6506522e5fc', '10.34.4.112', 1524172040, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532343137323033323b6c6f676765645f696e7c623a313b69645f7573756172696f7c733a313a2231223b757365726e616d657c733a383a2261646d696e494d54223b7469706f5f757c733a313a2231223b726f6c7c733a31333a2241646d696e6973747261646f72223b);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE IF NOT EXISTS `compras` (
  `id_compra` int(11) NOT NULL AUTO_INCREMENT,
  `id_licencia` int(11) DEFAULT NULL,
  `descripcion` varchar(180) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `fecha_compra` date NOT NULL,
  `id_proveedor` int(11) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date NOT NULL,
  `mantenimiento` varchar(5) NOT NULL,
  `soporte` varchar(5) NOT NULL,
  `monto` decimal(17,2) NOT NULL,
  `id_divisa` int(11) NOT NULL,
  `contrato_corporativo` varchar(100) DEFAULT NULL,
  `documento_anexo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_compra`),
  KEY `tcomras_tdivisas` (`id_divisa`),
  KEY `compras_proveedores` (`id_proveedor`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Tabla de Compras genéricas ' AUTO_INCREMENT=83 ;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`id_compra`, `id_licencia`, `descripcion`, `fecha_compra`, `id_proveedor`, `fecha_inicio`, `fecha_fin`, `mantenimiento`, `soporte`, `monto`, `id_divisa`, `contrato_corporativo`, `documento_anexo`) VALUES
(1, 1, '@RISK Pro Spanish', '2011-09-29', 1, '2011-10-27', '2012-10-31', 'Sí', 'No', '1495.00', 2, NULL, 'adc2a-contratacion-risk.pdf'),
(2, 2, 'ADOBE ACROBAT PROFESSIONAL XI SPANISH LICENCIA ELECTRÓNICA', '2014-06-18', 2, '2014-06-24', '0000-00-00', 'No', 'No', '37120.00', 1, NULL, 'adf6e-contratacion-adobe-acrobat.pdf'),
(3, 3, 'MANTENIMIENTO Y ACTUALIZACIÓN DE LA LICENCIA ANSYS MECHANICHAL', '2008-10-03', 3, '2008-10-16', '0000-00-00', 'Sí', 'No', '22816.00', 2, NULL, '16218-contratacion-mantenimiento-ansys.pdf'),
(4, 4, 'MANTENIMIENTO Y ACTUALIZACIÓN DEL SOFTWARE ARCGI SERVER ADVANCED STANDARD ESRI DATA Y MAPS', '2008-10-23', 4, '2008-10-23', '0000-00-00', 'Sí', 'No', '4255.00', 2, NULL, '474b4-contratacion-arcgi-server-advanced-standard.pdf'),
(5, 5, 'LICENCIA DE SOFTWARE ARCGIS DESKTOP BASIC (ARCGIS, ARCVIEW) FLOTANTE', '2014-07-09', 4, '2014-07-09', '0000-00-00', 'No', 'No', '2343.20', 2, NULL, 'c8851-contratacion-argi-desktop-basic.pdf'),
(7, 10, 'ACTUALIZACIÓN DE AUTOCAD MAP 2006 A CIVIL 3D 2008 CON SUSCRIPCION', '2007-12-11', 5, '2007-12-11', '0000-00-00', 'No', 'Sí', '317376.89', 1, NULL, 'c754f-contratacion-autocad-2008.pdf'),
(10, 11, 'RENOVACIÓN Y ACTUALIZACIÓN/CONTRATO MANTENIMIENTO DE AUTOCAD CIVIL 3D 2011', '2010-11-17', 6, '2010-11-19', '2011-11-18', 'Sí', 'No', '328477.20', 1, NULL, '18e47-contratacion-autocad-2011.pdf'),
(11, 3, 'MANTENIMIENTO ANUAL ANSYS MECHANICAL REV-14', '2014-03-21', 3, '2013-06-30', '2014-06-30', 'Sí', 'No', '8154.80', 2, NULL, 'b3296-contratacion-ansys-mechanical-rev-14.pdf'),
(15, 12, 'RENOVACIÓN DE CONTRATO DE SUBSCRIPCIÓN AUTOCAD CIVIL 3D 2013', '2013-11-13', 7, '2012-11-18', '0000-00-00', 'No', 'Sí', '216867.80', 1, NULL, 'cbb11-contratacion-de-renovacion-autocad.pdf'),
(16, 12, 'RENOVACIÓN DE CONTRATO DE SUBSCRIPCIÓN AUTOCAD CIVIL 3D', '2014-06-24', 7, '2013-11-18', '2015-11-18', 'No', 'Sí', '111081.60', 1, NULL, 'a9c83-contratacion-autocad-3d.pdf'),
(17, 14, 'ACTUALIZACIÓN DE AUTOTURN VERSIÓN 2.0 A LA MÁS RECIENTE', '2011-09-29', 9, '2011-09-29', '2012-07-31', 'No', 'No', '1860.00', 2, NULL, '7bcfd-contratacion-autoturn.pdf'),
(18, 20, 'ILLUMINATE LIVE VCLASS 25 PARTICIPANTES, LICENCIA INDIVIDUAL ELLUMINATE NEXT INCLUIDA, 1 GB ALMACENAMIENTO ADICIONAL', '2009-08-19', 17, '2009-08-19', '0000-00-00', 'No', 'Sí', '59742.50', 1, NULL, '2cbb2-contratacion-elluminate-25-participantes.pdf'),
(19, 24, 'FLEXSIM ACADÉMICO CON MÓDULO OPTIMIZACIÓN OPTQUEST  ', '2008-10-20', 13, '2008-10-31', '0000-00-00', 'No', 'No', '6325.00', 2, NULL, '95e08-contratacion-flexsim.pdf'),
(20, 26, 'LICENSE GRAPHER V10 UPGRADE/LICENSE SOLID CONVERTER/LICENSE PDF PASSWORD REMOVER', '2014-06-23', 14, '2014-06-23', '0000-00-00', 'No', 'No', '11078.00', 1, NULL, '9336f-contratacion-grapher.pdf'),
(21, 27, 'HVE SOFTWARE PACKAGE', '2011-10-25', 19, '2011-10-28', '2012-10-28', 'No', 'No', '12925.00', 2, NULL, '4700d-contratacion-hve-software-package.pdf'),
(23, 27, 'HVE SOFTWARE PACKAGE USP', '2013-02-18', 19, '2013-02-18', '2014-02-18', 'No', 'No', '5800.60', 2, NULL, '6c820-contratacion-hve-usp.pdf'),
(25, 27, 'HVE SOFTWARE PACKAGE USP', '2014-06-20', 19, '2014-06-20', '2015-06-20', 'No', 'No', '5980.00', 2, NULL, '427cc-contratacion-hve-h3d.pdf'),
(27, 86, 'ACTUALIZACIÓN A LA VERSIÓN 2014 DE LA LICENCIA LITPACK', '2014-06-13', 21, '2014-06-13', '0000-00-00', 'No', 'No', '38050.00', 3, NULL, '3985c-contratacion-litpack.pdf'),
(28, 87, 'LOGMEIN PRO2 ADD ON SUBSCRIPTION/RENEWAL SUBSCRIPTION', '2011-10-13', 22, '2011-10-13', '2012-10-14', 'No', 'No', '1598.00', 3, NULL, '4f14c-contratacion-logmein-pro2-add-on-subscription.pdf'),
(29, 87, 'LOGMEIN PRO 48 LICENCIAS Y CENTRAL 1 LICENCIA', '2014-05-22', 22, '2014-05-22', '2015-05-21', 'No', 'No', '1563.87', 3, NULL, '5a2dd-contratacion-logmein-pro-48.pdf'),
(30, 87, 'LOGMEIN PRO2 SUBSCRIPTION/CENTRAL SUBSCRIPTION', '2015-07-27', 22, '2015-08-13', '2016-08-12', 'No', 'No', '1499.00', 2, NULL, 'd28f3-contratacion-logmein-central-plus.pdf'),
(31, 39, 'MATLAB LIC. PERP., USU. 1, IND., LINUX/SERVICIOS Y GASTOS DIRECTOS', '2008-10-03', 23, '2008-10-15', '2009-11-01', 'No', 'No', '3228.05', 2, NULL, 'e89cb-contratacion-matlab-para-linux.pdf'),
(32, 40, 'MANTENIMIENTO MATLAB LIC. 326125, 326126, 326127, 326128 LIC. PERP., USU. 1, IND Y ADQUIRIR UN NUEVA', '2010-10-15', 23, '2007-10-01', '2011-10-01', 'Sí', 'No', '10008.48', 2, NULL, '626de-contratacion-mantenimiento-de-matlab.pdf'),
(33, 40, 'SOFTWARE  SOPORTE Y MANTENIMIENTO MATLAB &SIMULINK', '2012-10-01', 23, '2012-10-01', '2013-12-01', 'Sí', 'Sí', '144107.88', 1, NULL, 'ad54e-contratacion-matlab-simulink.pdf'),
(34, 41, 'MCAFEE ACTIVE VIRUSSCAN', '2008-11-03', 24, '2008-11-06', '0000-00-00', 'No', 'No', '21012.23', 1, NULL, '203f3-contratacion-mcafee-virusscan.pdf'),
(35, 45, 'ACTUALIZACIÓN DE LAS LICENCIAS A LA VERSIÓN 2014 DEL SOFTWARE MIKE21 Y LITPACK', '2014-06-13', 21, '2014-06-16', '0000-00-00', 'No', 'No', '38050.00', 3, NULL, 'af170-contratacion-mike-21-y-litpack.pdf'),
(38, 47, 'MINITAB V.13.3 CD HLOCK EN INGLES, LICENCIA PERPETUA INDIVIDUAL PARA WIN9X/NT/2K', '2001-12-21', 48, '2001-12-21', '0000-00-00', 'No', 'No', '49443.60', 1, NULL, '6e427-contratacion-minitab-v13.3.pdf'),
(39, 48, 'MINITAB VERSIÓN 10.5, IDIOMA INGLÉS', '2007-11-13', 26, '2007-11-15', '0000-00-00', 'No', 'No', '15745.00', 1, NULL, '17d3a-contratacion-mintab-10.5.pdf'),
(41, 54, 'PC*MILER WINDOWS V25.1 DVD-SET/SINGLE INSTALL LICENSE', '2011-09-29', 31, '2011-10-22', '2011-11-27', 'No', 'No', '1092.00', 2, NULL, '99126-contratacion-pcmiller.pdf'),
(42, 55, 'PFC2D VER. 4.0 PC LICENSE/KEY', '2008-10-21', 33, '2008-10-21', '0000-00-00', 'No', 'No', '6100.00', 2, NULL, 'cba5e-contratacion-pfc2d.pdf'),
(43, 56, 'LICENCIA PROJECT PRO 2003 WIN32 SPANISH', '2005-09-28', 17, '2005-10-26', '2007-10-31', 'No', 'No', '65116.15', 1, NULL, '3a2eb-contratacion-project-pro-2003-win32.pdf'),
(44, 58, 'PROJECT SERVER 2003 WIN 32 SPANISH', '2005-11-10', 17, '2005-11-24', '0000-00-00', 'No', 'No', '21258.44', 1, NULL, '09587-contratacion-project-server-win-32.pdf'),
(45, 59, 'SUM SAP2000 ADVANCED 1 AÑO, COMERCIAL, MCA. CSI, MANTENIMIENTO POR UN AÑO', '2014-06-26', 35, '2014-06-26', '2014-07-25', 'No', 'No', '32159.03', 1, NULL, '920bc-contratacion-sum-sap2000.pdf'),
(46, 60, 'SHIPMA EN RED 1 LICENCIA PARA 1 USUARIO', '2014-06-25', 36, '2014-07-15', '0000-00-00', 'No', 'No', '23750.00', 3, NULL, '9470f-contratacion-shipma.pdf'),
(47, 61, 'SOFTWARE SIABUC 8/GASTOS DE ENVÍO', '2010-11-30', 37, '2010-11-30', '0000-00-00', 'No', 'No', '6060.00', 1, NULL, 'ad864-contratacion-siabuc.pdf'),
(48, 62, 'SOLID CONVERTER PDF V6/SOFTWARE DE ENTREGA ELECTRÓNICA', '2010-09-27', 38, '2010-10-27', '0000-00-00', 'No', 'No', '2610.00', 1, NULL, '6a812-contratacion-solid-converter-6.pdf'),
(49, 65, 'SPSS STANDARD/BEYOND COMPARE PRO', '2014-02-24', 10, '2014-02-28', '0000-00-00', 'No', 'No', '101355.00', 1, NULL, '670b0-contratacion-spss-y-beyond-compare.pdf'),
(50, 65, 'IBM SPSS STATISTICS BUNDLE STANDARD ', '2013-11-07', 10, '2013-11-07', '0000-00-00', 'No', 'No', '98629.00', 1, NULL, '70f94-contratacion-spss-statistics.pdf'),
(51, 66, 'ACTUALIZACIÓN DE STATA SE/ACTUALIZACIÓN DE SOLID CONVERTER PDF', '2012-08-15', 40, '2012-08-15', '0000-00-00', 'No', 'No', '18971.80', 1, NULL, '7def5-contratacion-stata.pdf'),
(52, 68, 'SUPPORT TRANSCAD STANDARD - 1 YEAR', '2012-12-31', 41, '2012-12-31', '2013-12-31', 'No', 'No', '4800.00', 2, NULL, 'dcf71-contratacion-transcad.pdf'),
(53, 68, 'STANDARD TRANSCAD SOFTWARE SUPPORT ', '2013-12-31', 41, '2013-12-31', '2014-12-31', 'No', 'No', '4800.00', 2, NULL, '4dc9f-contratacion-standard-transcard.pdf'),
(54, 69, 'LICENCIA PARA 1 USUARIO Y LICENCIA ADICIONAL PARA 1 USUARIO TRUCK FILL V.2.06', '2010-11-19', 42, '2010-11-19', '0000-00-00', 'No', 'No', '5336.00', 2, NULL, '92c5f-contratacion-truckfill.pdf'),
(55, 70, 'VISIO PROFFESIONAL 2007 LICENCIA ACADÉMICA/OTROS PRODUCTOS', '2007-11-13', 14, '2007-12-13', '2009-12-31', 'No', 'No', '9752.00', 1, NULL, '61816-contratacion-visio-proffesional.pdf'),
(56, 72, 'WINDOWS SVR STD 2008 OLP NL GOVT', '2008-10-03', 17, '2008-11-07', '2009-10-31', 'No', 'No', '19568.34', 1, NULL, 'ed610-contratacion-windows-server-2008.pdf'),
(57, 73, 'ACTUALIZACIÓN DE LA SUITE VMWARE VSPHERE', '2014-02-27', 46, '2014-02-27', '2015-02-14', 'No', 'Sí', '119659.80', 1, NULL, 'f12ab-contratacion-vmware-vsphere.pdf'),
(58, 96, 'DESIGN WEB PREMIUM CS6 1 USER WIN ESP DVD', '2014-02-24', 14, '1969-12-31', '0000-00-00', 'No', 'No', '66120.00', 1, NULL, '2b919-contratacion-design-web-cs6.pdf'),
(59, 75, 'BREAKWAT FIRST USER', '2014-06-25', 43, '2014-07-08', '2015-09-11', 'Sí', 'Sí', '6500.00', 3, NULL, 'd018b-contratacion-breakwat.pdf'),
(60, 76, 'CAMTASIA STUDIO V8', '2014-02-26', 14, '2014-02-26', '0000-00-00', 'No', 'No', '12760.00', 1, NULL, '23bed-constancia-de-entrega-camtasia-studio.pdf'),
(61, 77, 'CAPE PACK', '2014-05-27', 49, '2014-05-27', '0000-00-00', 'Sí', 'Sí', '9976.00', 2, NULL, '0fada-contratacion-cape-pack.pdf'),
(62, 78, 'CLIP', '2014-10-30', 50, '2014-10-30', '0000-00-00', 'No', 'No', '5762.30', 3, NULL, '5b85c-contratacion-clip.pdf'),
(63, 78, 'PROGRAMA CLIP', '2015-01-27', 50, '2015-01-27', '0000-00-00', 'No', 'No', '5762.30', 3, NULL, 'bdee4-contratacion-programa-clip.pdf'),
(64, 79, 'CRYSTAL REPORTS 2011, WIN, VER.2011', '2012-08-22', 35, '2012-08-22', '0000-00-00', 'No', 'No', '19903.86', 1, NULL, 'c6631-contratacion-crystal-reports.pdf'),
(65, 83, 'FREE FOR FIRST USER LICENSE OF UNIBEST CL+,DE & TC', '2014-08-07', 43, '2014-08-07', '0000-00-00', 'Sí', 'Sí', '27000.00', 3, NULL, '76873-contratacion-unibest.pdf'),
(66, 84, 'FLIPPINGBOOK PUBLISHER BUSINESS', '2014-05-26', 14, '2014-06-03', '0000-00-00', 'No', 'No', '11020.00', 1, NULL, 'bcb35-contratacion-flippingbook.pdf'),
(67, 85, 'SOFTWARE ACTUALIZACIÓN DE NI SOUND AND VIBRATION TOOLKIT ', '2011-09-29', 20, '2011-11-03', '0000-00-00', 'No', 'No', '15622.30', 1, NULL, '233fe-contratacion-ni-sound-and-vibration.pdf'),
(68, 94, 'CAMTASIA STUDIO V8', '2014-02-26', 14, '2014-02-26', '0000-00-00', 'No', 'No', '12760.00', 1, NULL, 'ce72e-constancia-de-entrega-camtasia-studio.pdf'),
(69, 41, 'MCAFEE ENDPOINT PROTECTION', '2014-03-27', 14, '2014-03-27', '0000-00-00', 'Sí', 'Sí', '36598.00', 2, NULL, NULL),
(70, 103, ' MANTENIMIENTO MATLAB LIC. 326125, 326126, 326127, 326128 LIC. PERP., USU. 1, IND Y ADQUIRIR UN NUEVA', '2010-10-15', 23, '2007-10-01', '2011-10-01', 'Sí', 'No', '10008.48', 2, NULL, '1c868-contratacion-mantenimiento-de-matlab.pdf'),
(71, 104, 'MANTENIMIENTO MATLAB LIC. 326125, 326126, 326127, 326128 LIC. PERP., USU. 1, IND Y ADQUIRIR UN NUEVA', '2010-10-15', 23, '2007-10-01', '2011-10-01', 'Sí', 'No', '10008.48', 2, NULL, '18d16-contratacion-mantenimiento-de-matlab.pdf'),
(72, 105, 'MANTENIMIENTO MATLAB LIC. 326125, 326126, 326127, 326128 LIC. PERP., USU. 1, IND Y ADQUIRIR UN NUEVA', '2010-10-15', 23, '2007-10-01', '2011-10-01', 'Sí', 'No', '10008.48', 2, NULL, 'bb806-contratacion-mantenimiento-de-matlab.pdf'),
(73, 106, 'MANTENIMIENTO MATLAB LIC. 326125, 326126, 326127, 326128 LIC. PERP., USU. 1, IND Y ADQUIRIR UN NUEVA', '2010-10-15', 23, '2007-10-01', '2011-10-01', 'Sí', 'No', '10008.48', 2, NULL, 'a9668-contratacion-mantenimiento-de-matlab.pdf'),
(74, 103, 'SOFTWARE  SOPORTE Y MANTENIMIENTO MATLAB &SIMULINK', '2012-10-01', 23, '2012-10-01', '2013-12-01', 'Sí', 'Sí', '144107.88', 1, NULL, 'b7e03-contratacion-matlab-simulink.pdf'),
(76, 118, 'SUPPORT TRANSCAD STANDARD - 1 YEAR', '2012-12-31', 41, '2012-12-31', '2013-12-31', 'No', 'No', '4800.00', 2, NULL, 'd4bb5-contratacion-transcad.pdf'),
(77, 118, 'STANDARD TRANSCAD SOFTWARE SUPPORT ', '2013-12-31', 41, '2013-12-31', '2014-12-31', 'No', 'No', '4800.00', 2, NULL, '2f1cf-contratacion-standard-transcard.pdf'),
(78, 119, 'SUPPORT TRANSCAD STANDARD - 1 YEAR', '2012-12-31', 41, '2012-12-31', '2013-12-31', 'No', 'No', '4800.00', 2, NULL, '3cbaf-contratacion-transcad.pdf'),
(79, 119, 'STANDARD TRANSCAD SOFTWARE SUPPORT ', '2013-12-31', 41, '2013-12-31', '2014-12-31', 'No', 'No', '4800.00', 2, NULL, 'd4a4e-contratacion-standard-transcard.pdf'),
(80, 120, 'SUPPORT TRANSCAD STANDARD - 1 YEAR', '2012-12-31', 41, '2012-12-31', '2013-12-31', 'No', 'No', '4800.00', 2, NULL, '715a6-contratacion-transcad.pdf'),
(81, 120, 'STANDARD TRANSCAD SOFTWARE SUPPORT ', '2013-12-31', 41, '2013-12-31', '2014-12-31', 'No', 'No', '4800.00', 2, NULL, '0e24d-contratacion-standard-transcard.pdf'),
(82, 127, 'WINDOWS SVR STD 2008 OLP NL GOVT', '2008-10-03', 17, '2008-11-07', '2009-10-31', 'No', 'No', '19568.34', 1, NULL, 'dc41f-contratacion-windows-server-2008.pdf');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras_coordinacion_n_n`
--

CREATE TABLE IF NOT EXISTS `compras_coordinacion_n_n` (
  `id_compra` int(11) NOT NULL,
  `id_coordinacion` int(11) DEFAULT NULL,
  `id_usuario_b` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci COMMENT='Esta tabla es relacion n-n compras/coordinacion/usuarios_b';

--
-- Volcado de datos para la tabla `compras_coordinacion_n_n`
--

INSERT INTO `compras_coordinacion_n_n` (`id_compra`, `id_coordinacion`, `id_usuario_b`) VALUES
(4, 9, NULL),
(5, 5, NULL),
(6, 9, NULL),
(10, 3, NULL),
(11, 3, NULL),
(7, 3, NULL),
(15, 3, NULL),
(16, 3, NULL),
(17, 8, NULL),
(19, 5, NULL),
(20, 9, NULL),
(21, 3, NULL),
(23, 3, NULL),
(25, 3, NULL),
(27, 9, NULL),
(28, 9, NULL),
(28, 3, NULL),
(29, 9, NULL),
(29, 3, NULL),
(30, 9, NULL),
(30, 3, NULL),
(18, 12, NULL),
(31, 9, NULL),
(32, 9, NULL),
(33, 9, NULL),
(33, 3, NULL),
(34, 12, NULL),
(35, 9, NULL),
(38, 9, NULL),
(39, 9, NULL),
(41, 8, NULL),
(42, 4, NULL),
(43, 12, NULL),
(44, 12, NULL),
(45, 9, NULL),
(46, 9, NULL),
(47, 12, NULL),
(48, 9, NULL),
(49, 5, NULL),
(50, 5, NULL),
(51, 7, NULL),
(52, 9, NULL),
(52, 5, NULL),
(52, 8, NULL),
(53, 9, NULL),
(53, 5, NULL),
(53, 8, NULL),
(54, 5, NULL),
(55, 12, NULL),
(56, 12, NULL),
(57, 12, NULL),
(58, 12, NULL),
(59, 9, NULL),
(60, 12, NULL),
(61, 5, NULL),
(62, 8, NULL),
(63, 8, NULL),
(64, 12, NULL),
(65, 9, NULL),
(66, 5, NULL),
(67, 3, NULL),
(68, 12, NULL),
(69, 12, NULL),
(70, 9, NULL),
(71, 9, NULL),
(72, 9, NULL),
(73, 9, NULL),
(74, 9, NULL),
(74, 3, NULL),
(1, 3, NULL),
(2, 12, NULL),
(3, 3, NULL),
(76, 9, NULL),
(76, 5, NULL),
(76, 8, NULL),
(77, 9, NULL),
(77, 5, NULL),
(77, 8, NULL),
(78, 9, NULL),
(78, 5, NULL),
(78, 8, NULL),
(79, 9, NULL),
(79, 5, NULL),
(79, 8, NULL),
(80, 9, NULL),
(80, 5, NULL),
(80, 8, NULL),
(81, 9, NULL),
(81, 5, NULL),
(81, 8, NULL),
(82, 12, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras_divisas`
--

CREATE TABLE IF NOT EXISTS `compras_divisas` (
  `id_divisa` int(11) NOT NULL AUTO_INCREMENT,
  `nom_divisa` varchar(10) NOT NULL,
  PRIMARY KEY (`id_divisa`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `compras_divisas`
--

INSERT INTO `compras_divisas` (`id_divisa`, `nom_divisa`) VALUES
(1, 'MXN'),
(2, 'USD'),
(3, 'EUR');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consumibles`
--

CREATE TABLE IF NOT EXISTS `consumibles` (
  `id_consumible` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_consumible` varchar(50) DEFAULT NULL,
  `marca` varchar(50) DEFAULT NULL,
  `modelo` varchar(50) CHARACTER SET latin1 COLLATE latin1_spanish_ci DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `codigo_CABM` varchar(50) DEFAULT NULL,
  `descripcion` varchar(50) CHARACTER SET latin1 COLLATE latin1_spanish_ci DEFAULT NULL,
  `proveedor` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id_consumible`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Esta tabla almacena la información de los consumibles' AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `consumibles`
--

INSERT INTO `consumibles` (`id_consumible`, `nombre_consumible`, `marca`, `modelo`, `cantidad`, `codigo_CABM`, `descripcion`, `proveedor`) VALUES
(2, 'Toner', 'EPSON', '6987', 3, 'BGDTSR3245', NULL, 'MC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `coordinacion`
--

CREATE TABLE IF NOT EXISTS `coordinacion` (
  `id_coordinacion` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_coordinacion` varchar(60) NOT NULL,
  PRIMARY KEY (`id_coordinacion`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Esta tabla almacena los nombres de las áreas del IMT' AUTO_INCREMENT=13 ;

--
-- Volcado de datos para la tabla `coordinacion`
--

INSERT INTO `coordinacion` (`id_coordinacion`, `nombre_coordinacion`) VALUES
(1, 'Administración y Finanzas'),
(2, 'Ingeniería Estructural, Formación Posprofesional y'),
(3, 'Ingeniería Vehicular e Integridad Estructural'),
(4, 'Infraestructura'),
(5, 'Integración del Transporte'),
(6, 'Normativa para la Infraestructura del Transporte'),
(7, 'Economía de los Transportes y Desarrollo Regional'),
(8, 'Seguridad y Operación del Transporte'),
(9, 'Ingeniería Portuaria y Sistemas Geoespaciales'),
(10, 'Dirección General'),
(11, 'División de Telemática'),
(12, 'Unidad de Tecnologías de la Información y Comunicación');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados_federales`
--

CREATE TABLE IF NOT EXISTS `estados_federales` (
  `id_estado` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_estado` varchar(35) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=33 ;

--
-- Volcado de datos para la tabla `estados_federales`
--

INSERT INTO `estados_federales` (`id_estado`, `nombre_estado`) VALUES
(1, 'Aguascalientes'),
(2, 'Baja California'),
(3, 'Baja California Sur'),
(4, 'Campeche'),
(5, 'Chiapas'),
(6, 'Chihuahua'),
(7, 'Ciudad de México'),
(8, 'Coahuila'),
(9, 'Colima'),
(10, 'Durango'),
(11, 'Guanajuato'),
(12, 'Guerrero'),
(13, 'Hidalgo'),
(14, 'Jalisco'),
(15, 'México'),
(16, 'Michoacán'),
(17, 'Morelos'),
(18, 'Nayarit'),
(19, 'Nuevo León'),
(20, 'Oaxaca'),
(21, 'Puebla'),
(22, 'Querétaro'),
(23, 'Quintana Roo'),
(24, 'San Luis Potosí'),
(25, 'Sinaloa'),
(26, 'Sonora'),
(27, 'Tabasco'),
(28, 'Tamaulipas'),
(29, 'Tlaxcala'),
(30, 'Veracruz'),
(31, 'Yucatán'),
(32, 'Zacatecas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hardware`
--

CREATE TABLE IF NOT EXISTS `hardware` (
  `id_hard` int(11) NOT NULL AUTO_INCREMENT,
  `id_tipo_hardware` int(11) DEFAULT NULL,
  `marca` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `modelo` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `no_serie` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `no_inventario` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `ubicacion` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `id_coordinacion` int(11) DEFAULT NULL,
  `id_prov` int(11) DEFAULT NULL,
  `proveedor` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `id_mod` int(11) DEFAULT NULL,
  `id_usuario_b` int(11) DEFAULT NULL,
  `usuario_asignado` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_hard`),
  KEY `hardware_modalidad` (`id_mod`),
  KEY `hardware_coordinacion` (`id_coordinacion`),
  KEY `harware_usuarios_b_asignados` (`id_usuario_b`),
  KEY `thardware__thardware_tipos_hardware` (`id_tipo_hardware`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci COMMENT='Tabla de Hardware' AUTO_INCREMENT=43 ;

--
-- Volcado de datos para la tabla `hardware`
--

INSERT INTO `hardware` (`id_hard`, `id_tipo_hardware`, `marca`, `modelo`, `no_serie`, `no_inventario`, `ubicacion`, `id_coordinacion`, `id_prov`, `proveedor`, `id_mod`, `id_usuario_b`, `usuario_asignado`) VALUES
(39, 4, 'HP', 'HP SCANJET ENTERPRISE FLOW 7500', '445666', '111111', 'TELEMÁTICA', 11, NULL, 'HP', 2, 1031, NULL),
(40, 5, 'HP', 'OPTIPLEX', '260', NULL, 'Modulo 4', 11, NULL, NULL, 2, 1031, 'cc'),
(41, 4, 'Lenovo', '369854', 'lkjslk66', '0214', 'Telemática', 11, NULL, 'MC', 2, 741, NULL),
(42, 9, 'CISCO', 'ASA 98003', '32145879', '12', 'TELEMATICA', 10, NULL, 'CISCO', 2, 670, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hardware_modalidad`
--

CREATE TABLE IF NOT EXISTS `hardware_modalidad` (
  `id_mod` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_mod` varchar(50) NOT NULL,
  PRIMARY KEY (`id_mod`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `hardware_modalidad`
--

INSERT INTO `hardware_modalidad` (`id_mod`, `nombre_mod`) VALUES
(1, 'Arrendado'),
(2, 'Propiedad del IMT');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hardware_tipos_hardware`
--

CREATE TABLE IF NOT EXISTS `hardware_tipos_hardware` (
  `id_tipo_hardware` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_tipo` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`id_tipo_hardware`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci COMMENT='Esta tabla es el catalogo con todos los tipos de hardware ju' AUTO_INCREMENT=16 ;

--
-- Volcado de datos para la tabla `hardware_tipos_hardware`
--

INSERT INTO `hardware_tipos_hardware` (`id_tipo_hardware`, `nombre_tipo`) VALUES
(1, 'UPS'),
(2, 'Proyector'),
(3, 'Impresora'),
(4, 'Escáner'),
(5, 'Equipo de vídeo conferencia'),
(6, 'Multifuncional'),
(7, 'Conmutador'),
(9, 'Firewall'),
(10, 'Router'),
(11, 'Router Inalambrico'),
(12, 'Servidor'),
(13, 'Switch'),
(14, 'PC'),
(15, 'Laptop');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `licencias`
--

CREATE TABLE IF NOT EXISTS `licencias` (
  `id_licencia` int(11) NOT NULL AUTO_INCREMENT,
  `id_software` int(11) NOT NULL,
  `version` varchar(50) DEFAULT NULL,
  `id_tipo_licencia` int(11) NOT NULL,
  `id_esquema_licenciamiento` int(11) NOT NULL,
  `referencia` varchar(50) DEFAULT NULL,
  `serial` mediumtext CHARACTER SET latin1 COLLATE latin1_spanish_ci,
  `documento_anexo` varchar(150) CHARACTER SET latin1 COLLATE latin1_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_licencia`),
  KEY `software_licencias` (`id_software`),
  KEY `licencias_licencias_tipos` (`id_tipo_licencia`),
  KEY `licencias_esquema_licenciamiento` (`id_esquema_licenciamiento`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Esta tabla almacena licencias de software' AUTO_INCREMENT=142 ;

--
-- Volcado de datos para la tabla `licencias`
--

INSERT INTO `licencias` (`id_licencia`, `id_software`, `version`, `id_tipo_licencia`, `id_esquema_licenciamiento`, `referencia`, `serial`, `documento_anexo`) VALUES
(1, 1, '5.7.1', 1, 1, '5034921', '<p>\r\n	Activation ID: <strong>3E-5034921-60DE87-C5E</strong></p>\r\n', NULL),
(2, 2, '11.0', 1, 1, 'PENDIENTE', '<p>\r\n	SE CUENTA CON 6 LICENCIAS, QUEDA PENDIENTE CAPTURAR EL SERIAL.</p>\r\n', 'b4d94-certificado-de-licencia-adobe-acrobat.pdf'),
(3, 3, '--', 1, 1, 'PENDIENTE', '<p>\r\n	SE CUENTA CON 1 LICENCIA, QUEDA PENDIENTE CAPTURAR EL SERIAL.</p>\r\n', '30cf6-licencia-ansys.pdf'),
(4, 4, '9.3 ESRI DATA Y MAPS', 1, 1, 'PENDIENTE', '<p>\r\n	SE CUENTA CON 1 LICENCIA, QUEDA PENDIENTE CAPTURAR EL SERIAL.</p>\r\n', NULL),
(5, 4, '9.0 DESKTOP BASIC ARCVIEW', 1, 1, 'PENDIENTE', '<p>\r\n	SE CUENTA CON 1 LICENCIA, QUEDA PENDIENTE CAPTURAR EL SERIAL.</p>\r\n', NULL),
(8, 4, '10.0', 1, 1, 'PENDIENTE', '<p>\r\n	SE CUENTA CON 1 LICENCIA, QUEDA PENDIENTE CAPTURAR EL SERIAL.</p>\r\n', NULL),
(10, 10, '2008', 1, 5, '357-464', '<div>\r\n	SE CUENTA CON 10 LICENCIAS.</div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	<strong>357-46428321</strong></div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	<strong>357-46428420</strong></div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	<strong>357-46428519</strong></div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	<strong>357-46428816</strong></div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	<strong>357-46428717</strong></div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	<strong>357-46428222</strong></div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	<strong>357-46428113</strong></div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	<strong>357-46428014</strong></div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	<strong>357-46428618</strong></div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	<strong>357-46428915</strong></div>\r\n', NULL),
(11, 10, '2011', 1, 5, '357-464', '<div>\r\n	10 LICENCIAS:</div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	<strong>357-46428321</strong></div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	<strong>357-46428420</strong></div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	<strong>357-46428519</strong></div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	<strong>357-46428816</strong></div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	<strong>357-46428717</strong></div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	<strong>357-46428222</strong></div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	<strong>357-46428113</strong></div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	<strong>357-46428014</strong></div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	<strong>357-46428618</strong></div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	<strong>357-46428915</strong></div>\r\n', '61a68-certificado-de-suscripcion-autocad-2011.pdf'),
(12, 10, '2013', 1, 5, '550-437', '<p>\r\n	SE CUENTA CON 10 LICENCIAS.</p>\r\n<p>\r\n	<strong>550-43780743</strong></p>\r\n<p>\r\n	<strong>550-43780842</strong></p>\r\n<p>\r\n	<strong>550-43780941</strong></p>\r\n<p>\r\n	<strong>550-43781040</strong></p>\r\n<p>\r\n	<strong>550-43781139</strong></p>\r\n<p>\r\n	<strong>550-43781238</strong></p>\r\n<p>\r\n	<strong>550-43781337</strong></p>\r\n<p>\r\n	<strong>550-43781436</strong></p>\r\n<p>\r\n	<strong>550-43781535</strong></p>\r\n<p>\r\n	<strong>550-43781634</strong></p>\r\n', NULL),
(14, 13, '2.0', 1, 1, 'PZ7PFR7', '<p>\r\n	CD Key: <strong>8A3A9PZ7PFR7</strong></p>\r\n', '4c550-cd-key-autoturn.pdf'),
(15, 14, '3.0', 1, 1, 'PENDIENTE', '<p>\r\n	SE CUENTA CON 1 LICENCIA, QUEDA PENDIENTE CAPTURAR EL SERIAL.</p>\r\n<p>\r\n	&nbsp;</p>\r\n', 'b30fd-licencia-beyond-compare.pdf'),
(20, 19, '--', 1, 5, 'PENDIENTE', '<p>\r\n	SE CUENTA CON 25 LICENCIAS, QUEDA PENDIENTE CAPTURAR EL SERIAL.</p>\r\n', NULL),
(21, 20, '7.0', 1, 1, 'E56730F8', '<p>\r\n	Eviews 7 Standard Upgrade Single User</p>\r\n<p>\r\n	Serial # <strong>70A10098-23981B68-E56730F8</strong></p>\r\n', 'ce6ff-licencia-eviews.pdf'),
(22, 21, '11.0', 1, 4, '3KT77-V2237', '<p>\r\n	<strong>3M339-5NV28-64JK4-68TJ2-29M91-3KT77-V2237</strong></p>\r\n', '153f5-licencia-filemaker-server.pdf'),
(23, 22, '11.0', 1, 1, 'K8T86-8VKV9', '<p>\r\n	5 LICENCIAS</p>\r\n<p>\r\n	<strong>3MV1M-V8NX4-6JX86-22XN5-96J7V-K8T86-8VKV9</strong></p>\r\n', 'ca51d-licencia-filemaker-pro.pdf'),
(24, 23, '--', 1, 1, 'PENDIENTE', '<p>\r\n	SE CUENTA CON 30 LICENCIAS, QUEDA PENDIENTE CAPTURAR EL SERIAL.</p>\r\n', NULL),
(25, 24, '--', 1, 1, 'HF7R1EQ', '<p>\r\n	License Key (s):</p>\r\n<p>\r\n	<strong>JCPMPFSHHF7R1EQ</strong></p>\r\n', '10c30-licencias-google-earth.pdf'),
(26, 25, '10.0', 1, 1, '34-1142', '<p>\r\n	Serial Number (s): <strong>WG-061834-1142</strong></p>\r\n', '786ef-serial-grapher.pdf'),
(27, 26, '9.0', 1, 1, 'PENDIENTE', '<p>\r\n	SE CUENTA CON 1 LICENCIA, QUEDA PENDIENTE CAPTURAR EL SERIAL.</p>\r\n', NULL),
(28, 27, '9.0', 1, 1, '4F9JJJG', '<p>\r\n	<strong>K954F9JJJG</strong></p>\r\n', '99d47-serial-jmp.pdf'),
(37, 35, '13.0', 1, 1, '136901', '<p>\r\n	SERIAL #: <strong>LGPC3-136901&nbsp;</strong>/ INSTITUTO MEXICANO DEL TRANSPORTE</p>\r\n', '8b343-licencia-lingo-hyper.pdf'),
(39, 37, '7.7 LINUX', 1, 1, '1026298', '<p>\r\n	Activation Key: <strong>40754-11422-74264-98992-89269</strong></p>\r\n<p>\r\n	&nbsp;</p>\r\n', '5c260-codigo-activacion-matlab-7.7.pdf'),
(40, 37, 'SIMULINK', 1, 1, '326125', '<p>\r\n	Activation Key: <strong>99851-09461-30328-32414-08030</strong></p>\r\n', NULL),
(41, 39, '8.8', 1, 6, 'W9Y5C', '<p>\r\n	SE CUENTA CON 150 LICENCIAS, QUEDA PENDIENTE CAPTURAR EL SERIAL.</p>\r\n<p>\r\n	<strong>ePolicy Orchestrator: XJC7R-JBR4K-UHW8E-A6KEA-W9Y5C</strong></p>\r\n', 'e910c-licencia-mcafee.pdf'),
(45, 43, '21', 1, 1, 'PENDIENTE', '<p>\r\n	SE CUENTA CON 1 LICENCIA, QUEDA PENDIENTE CAPTURAR EL SERIAL.</p>\r\n', '7b746-licencia-mike-21-litpack.pdf'),
(47, 45, '13.3', 1, 1, 'PENDIENTE', '<p>\r\n	SE CUENTA CON 1 LICENCIA, QUEDA PENDIENTE CAPTURAR EL SERIAL.</p>\r\n', NULL),
(48, 45, '10.5', 1, 1, 'PENDIENTE', '<p>\r\n	SE CUENTA CON 1 LICENCIA, QUEDA PENDIENTE CAPTURAR EL SERIAL.</p>\r\n', NULL),
(50, 48, '2003 PRO', 1, 1, 'PENDIENTE', '<p>\r\n	SE CUENTA CON 12 LICENCIAS.</p>\r\n<p>\r\n	Office 2003 Aplications - <strong>BFF8V-8FD9R-D73JC-3TP2J-XB9VW</strong></p>\r\n<p>\r\n	Office 2003 Suites- <strong>RF9MD-RDYJK-WWBVV-266JY-7QBQ6</strong></p>\r\n', 'ababf-serial-office-pro-2003.pdf'),
(52, 48, '2010 PRO', 1, 1, '7V6XC', '<p>\r\n	Product Key: <strong>YHTX9-W7X87-DF366-89X63-7V6XC</strong></p>\r\n<p>\r\n	<strong>MX-05DFTV-01166-0AM-0085</strong></p>\r\n<p>\r\n	&nbsp;</p>\r\n', '568c9-serial-office-2010.pdf'),
(53, 51, '16', 1, 1, 'B2MD-VD', '<p>\r\n	Plataforma: Windows 200J/XP/Vista</p>\r\n<p>\r\n	<strong>2889E-K00-7MM0-B2MD-VD</strong></p>\r\n', 'e055a-licencia-omnipage.pdf'),
(54, 53, '25', 1, 1, 'PENDIENTE', '<p>\r\n	SE CUENTA CON 1 LICENCIA, QUEDA PENDIENTE CAPTURAR EL SERIAL.</p>\r\n', NULL),
(55, 54, '4.0', 1, 1, '16644', '<p>\r\n	<strong>261-052-0001-16644</strong></p>\r\n', '959d8-serial-pfc2d.pdf'),
(56, 55, 'PRO 2003', 1, 6, 'PENDIENTE', '<p>\r\n	SE CUENTA CON 14 LICENCIAS, QUEDA PENDIENTE CAPTURAR EL SERIAL.</p>\r\n', NULL),
(57, 55, 'SERVER 2010', 1, 4, 'VXR8K', '<p>\r\n	<strong>GBRGV-GCMWD-W2RTF-7BFYK-VXR8K</strong></p>\r\n', NULL),
(58, 55, 'SERVER 2003', 1, 4, 'PENDIENTE', '<p>\r\n	SE CUENTA CON 1 LICENCIA, QUEDA PENDIENTE CAPTURAR EL SERIAL.</p>\r\n', NULL),
(59, 60, '17', 1, 1, '38e53e7d', '<p>\r\n	<strong>1e50d311-6b09-4c97-b2aa-057038e53e7d</strong></p>\r\n', '43959-codigo-de-activacion-sap2000.pdf'),
(60, 61, '7.0', 1, 1, 'PENDIENTE', '<p>\r\n	SE CUENTA CON 1 LICENCIA, QUEDA PENDIENTE CAPTURAR EL SERIAL.</p>\r\n', NULL),
(61, 62, '8.0', 1, 4, 'PENDIENTE', '<p>\r\n	SE CUENTA CON 1 LICENCIA, QUEDA PENDIENTE CAPTURAR EL SERIAL.</p>\r\n', NULL),
(62, 64, '6.0', 1, 1, 'GPSG', '<p>\r\n	C&oacute;digo de desbloqueo:&nbsp; <strong>GPSG</strong></p>\r\n', '9e7a6-codigo-de-activacion-solid-converter-6.pdf'),
(63, 64, '7.0', 1, 1, 'PYXF', '<p>\r\n	C&oacute;digo de desbloqueo: <strong>PYXF</strong></p>\r\n', '02a14-codigo-de-activacion-solid-v7.pdf'),
(64, 64, '9.0', 1, 1, 'ZTHM', '<p>\r\n	C&oacute;digo de desbloqueo: <strong>ZTHM</strong></p>\r\n', 'b5c1c-codigo-de-desbloqueo-solid-converter-v9.pdf'),
(65, 67, 'STANDARD', 1, 1, 'PENDIENTE', '<p>\r\n	SE CUENTA CON 1 LICENCIA, QUEDA PENDIENTE CAPTURAR EL SERIAL.</p>\r\n', NULL),
(66, 71, '9.0', 1, 1, '81990525743', '<p>\r\n	STATA/SE 9.0</p>\r\n<p>\r\n	Code:<strong> $9eh f6ue $cp2 7deg hjou 5j</strong></p>\r\n<p>\r\n	Authorization key: <strong>og7q</strong></p>\r\n', '3e6b7-licencia-stata-9.pdf'),
(67, 71, '12.0', 1, 1, '40120577659', '<p>\r\n	STATA/SE 12</p>\r\n<p>\r\n	Code: <strong>c5ub mrri a1rg 6vf0 hzfx 4dva</strong></p>\r\n<p>\r\n	Authorization key: <strong>wsoj</strong></p>\r\n', 'c748b-licencia-stata-12.pdf'),
(68, 75, '--', 1, 1, 'TCS-174', '<p>\r\n	<strong>TCS-174-KBW-967-SHY</strong></p>\r\n', NULL),
(69, 76, '2.06', 1, 1, 'XB3S-8EQ4', '<p>\r\n	<strong>744A0ZF3-IJ16-B3F1-7YF9-XB3S-8EQ4</strong></p>\r\n', 'f1ab3-serial-truck-fill.pdf'),
(70, 77, '2007', 1, 1, 'PENDIENTE', '<p>\r\n	SE CUENTA CON 5 LICENCIAS, QUEDA PENDIENTE CAPTURAR EL SERIAL.</p>\r\n', NULL),
(71, 84, '--', 1, 5, 'FRUK3KP', '<p>\r\n	250 LICENCIAS</p>\r\n<p>\r\n	LICENCIA <strong>FRUK3KPKJNCQ6TJE</strong> - VENCE NOV. 20, 2009</p>\r\n<p>\r\n	LICENCIA <strong>FRUK3KPKJNCQ6TJE</strong> - VENCE NOV. 20, 2010</p>\r\n<p>\r\n	LICENCIA <strong>FRUK3KPKJNCQ6TJE </strong>- VENCE NOV. 20, 2011</p>\r\n<p>\r\n	&nbsp;</p>\r\n', 'd4e05-licenciamiento-websense.pdf'),
(72, 85, 'SERVER STANDARD 2008', 1, 4, '49248774-KMS', '<div>\r\n	CLAVE: <strong>VQ933-D7D32-G9K3V-YVGWV-YJT2G</strong></div>\r\n', NULL),
(73, 83, '5.0', 1, 4, 'PENDIENTE', '<p>\r\n	SE CUENTA CON 1 LICENCIA, QUEDA PENDIENTE CAPTURAR EL SERIAL.</p>\r\n', NULL),
(74, 16, 'WEB PREMIUM 3.0', 1, 1, 'PENDIENTE', '<p>\r\n	SE CUENTA CON 4 LICENCIAS, QUEDA PENDIENTE CAPTURAR EL SERIAL.</p>\r\n', NULL),
(75, 91, '3.0', 1, 1, 'PENDIENTE', '<p>\r\n	SE CUENTA CON 1 LICENCIA, QUEDA PENDIENTE CAPTURAR EL SERIAL.</p>\r\n', NULL),
(76, 92, '8.1', 1, 1, 'NMA97', '<p>\r\n	CLAVES/LICENSE KEY (FECHA: 14/11/2013)</p>\r\n<p>\r\n	<strong>A9PXV-E4CDC-5F4LU-M3PHP-NMA97</strong></p>\r\n<p>\r\n	&nbsp;</p>\r\n', 'efd22-licencia-camtasia-studio.pdf'),
(77, 93, '2.13', 1, 1, 'G2L7', '<p>\r\n	<strong>34V1-DCG9-9629-75S3-04E3-AE6N-G2L7</strong></p>\r\n', 'e2acc-codigo-activacion-cape-pack.pdf'),
(78, 94, '--', 1, 1, 'PENDIENTE', '<p>\r\n	SE CUENTA CON 1 LICENCIA, QUEDA PENDIENTE CAPTURAR EL SERIAL.</p>\r\n', NULL),
(79, 95, '2011', 1, 1, '3A60040-WE', '<p>\r\n	<strong>D720Z-ZA6F20S-BYNWP0J-3A60040-WE</strong></p>\r\n', 'b748e-codigo-crystal-reports-2011.pdf'),
(80, 96, '09', 1, 1, '87563', '<p>\r\n	THE REGISTRATION NUMBER IS <strong>87563</strong></p>\r\n', '2a09b-licencia-passer.pdf'),
(81, 97, '3.1', 1, 1, '611ET48', '<p>\r\n	<strong>55XSD52344553611ET48</strong></p>\r\n', '21508-licencia-password-remover.pdf'),
(82, 98, '12 PREMIUM', 1, 5, '526401', '<p>\r\n	<strong>09-31004-331256-526401</strong></p>\r\n', 'f0204-licencia-teamviewer.pdf'),
(83, 99, '7.0', 1, 1, 'PENDIENTE', '<p>\r\n	SE CUENTA CON 4 LICENCIAS, QUEDA PENDIENTE CAPTURAR EL SERIAL.</p>\r\n', NULL),
(84, 100, '--', 1, 1, 'PENDIENTE', '<p>\r\n	SE CUENTA CON 1 LICENCIA, QUEDA PENDIENTE CAPTURAR EL SERIAL.</p>\r\n', NULL),
(85, 101, '--', 1, 1, 'PENDIENTE', '<p>\r\n	SE CUENTA CON 1 LICENCIA, QUEDA PENDIENTE CAPTURAR EL SERIAL.</p>\r\n', NULL),
(86, 29, '--', 1, 1, 'PENDIENTE', '<p>\r\n	SE CUENTA CON 1 LICENCIA, QUEDA PENDIENTE CAPTURAR EL SERIAL.</p>\r\n', '3a2f3-licencia-mike-21-litpack.pdf'),
(87, 30, '2.0', 1, 6, 'PENDIENTE', '<p>\r\n	SE CUENTA CON 46 LICENCIAS, QUEDA PENDIENTE CAPTURAR EL SERIAL.</p>\r\n', NULL),
(90, 4, '9.0', 1, 1, 'PENDIENTE', '<p>\r\n	SE CUENTA CON 1 LICENCIA, QUEDA PENDIENTE CAPTURAR EL SERIAL.</p>\r\n', NULL),
(91, 4, '10  ARCPAD', 1, 1, '30d18707', '<p>\r\n	C&oacute;digo para ArcPAD Ver. 10: <strong>118030d18707</strong></p>\r\n', NULL),
(93, 4, 'ARCSIMS', 1, 1, 'PENDIENTE', '<p>\r\n	SE CUENTA CON 1 LICENCIA, QUEDA PENDIENTE CAPTURAR EL SERIAL.</p>\r\n', NULL),
(94, 92, '8.1', 1, 1, 'P344C', '<p>\r\n	CLAVES/LICENSE KEY (FECHA: 14/11/2013)</p>\r\n<p>\r\n	<strong>25MGH-FAMMK-CVA5H-XESYA-P344C</strong></p>\r\n', 'd1124-licencia-camtasia-studio.pdf'),
(95, 16, 'PREMIUM 6.0', 1, 1, '9436-0108', '<p>\r\n	<strong>1543-1004-8544-3365-9436-0108</strong></p>\r\n', NULL),
(97, 24, '--', 1, 1, 'UCNY62A', '<p>\r\n	License Key (s):</p>\r\n<p>\r\n	<strong>JCPMNBMJUCNY62A</strong></p>\r\n', '64b1e-licencias-google-earth.pdf'),
(98, 24, '--', 1, 1, 'R5PEVGW', '<p>\r\n	License Key (s):</p>\r\n<p>\r\n	<strong>JCPMSJ7MR5PEVGW</strong></p>\r\n', '86f39-licencias-google-earth.pdf'),
(99, 32, '--', 1, 6, 'PENDIENTE', '<p>\r\n	SE CUENTA CON 20 LICENCIAS, QUEDA PENDIENTE CAPTURAR EL SERIAL.</p>\r\n', NULL),
(100, 33, '--', 1, 1, 'PENDIENTE', '<p>\r\n	SE CUENTA CON 20 LICENCIAS, QUEDA PENDIENTE CAPTURAR EL SERIAL.</p>\r\n', NULL),
(101, 34, '--', 1, 1, 'PENDIENTE', '<p>\r\n	SE CUENTA CON 1 LICENCIA, QUEDA PENDIENTE CAPTURAR EL SERIAL.</p>\r\n', NULL),
(102, 28, '--', 1, 1, 'PENDIENTE', '<p>\r\n	SE CUENTA CON 1 LICENCIA, QUEDA PENDIENTE CAPTURAR EL SERIAL.</p>\r\n', NULL),
(103, 37, 'SIMULINK', 1, 1, '326126', '<p>\r\n	Activation Key: <strong>13944-76088-46895-62818-75135</strong></p>\r\n', NULL),
(104, 37, 'SIMULINK', 1, 1, '326127', '<p>\r\n	Activation Key: <strong>14833-49464-58120-10643-56934</strong></p>\r\n', NULL),
(105, 37, 'SIMULINK', 1, 1, '326128', '<p>\r\n	Activation Key:<strong> 65226-33572-98004-43399-01530</strong></p>\r\n', NULL),
(106, 37, 'SIMULINK', 1, 1, '666632', '<p>\r\n	Activation Key: <strong>61243-84054-13002-12776-21466</strong></p>\r\n', NULL),
(107, 52, '--', 1, 4, 'PENDIENTE', '<p>\r\n	SE CUENTA CON 2 LICENCIAS, QUEDA PENDIENTE CAPTURAR EL SERIAL.</p>\r\n', NULL),
(108, 88, '11.0', 1, 1, 'PENDIENTE', '<p>\r\n	SE CUENTA CON 1 LICENCIA, QUEDA PENDIENTE CAPTURAR EL SERIAL.</p>\r\n', NULL),
(109, 89, '--', 1, 1, 'PENDIENTE', '<p>\r\n	SE CUENTA CON 2 LICENCIAS, QUEDA PENDIENTE CAPTURAR EL SERIAL.</p>\r\n', NULL),
(110, 90, '--', 1, 1, 'PENDIENTE', '<p>\r\n	SE CUENTA CON 1 LICENCIA, QUEDA PENDIENTE CAPTURAR EL SERIAL.</p>\r\n', NULL),
(111, 55, 'PRO 2010', 1, 6, 'PENDIENTE', '<p>\r\n	SE CUENTA CON 55 LICENCIAS, QUEDA PENDIENTE CAPTURAR EL SERIAL.</p>\r\n', NULL),
(112, 63, '10.0', 1, 1, 'PENDIENTE', '<p>\r\n	SE CUENTA CON 1 LICENCIA, QUEDA PENDIENTE CAPTURAR EL SERIAL.</p>\r\n', NULL),
(113, 67, 'FAMILY V15', 1, 1, 'PENDIENTE', '<p>\r\n	SE CUENTA CON 1 LICENCIA, QUEDA PENDIENTE CAPTURAR EL SERIAL.</p>\r\n', NULL),
(114, 69, '2005', 1, 4, 'PENDIENTE', '<p>\r\n	SE CUENTA CON 1 LICENCIA, QUEDA PENDIENTE CAPTURAR EL SERIAL.</p>\r\n', NULL),
(115, 70, 'WINDOWS', 2, 1, 'PENDIENTE', '<p>\r\n	SE CUENTA CON 1 LICENCIA, QUEDA PENDIENTE CAPTURAR EL SERIAL.</p>\r\n', NULL),
(116, 73, '11.0', 1, 1, 'PENDIENTE', '<p>\r\n	SE CUENTA CON 1 LICENCIA, QUEDA PENDIENTE CAPTURAR EL SERIAL.</p>\r\n', NULL),
(117, 74, '--', 1, 1, 'PENDIENTE', '<p>\r\n	SE CUENTA CON 3 LICENCIAS, QUEDA PENDIENTE CAPTURAR EL SERIAL.</p>\r\n', NULL),
(118, 75, '--', 1, 1, 'TCS-290', '<p>\r\n	<strong>TCS-290-PBZ-710-DXK</strong></p>\r\n', NULL),
(119, 75, '--', 1, 1, 'TCS-927', '<p>\r\n	<strong>TCS-927-KMP-904-TWR</strong></p>\r\n', NULL),
(120, 75, '--', 1, 1, 'TCS-377', '<p>\r\n	<strong>TCS-377-FWQ-165-SUA</strong></p>\r\n', NULL),
(121, 78, '7.0', 1, 1, 'PENDIENTE', '<p>\r\n	SE CUENTA CON 1 LICENCIA, QUEDA PENDIENTE CAPTURAR EL SERIAL.</p>\r\n', NULL),
(122, 78, '5.3', 1, 1, 'PENDIENTE', '<p>\r\n	SE CUENTA CON 1 LICENCIA, QUEDA PENDIENTE CAPTURAR EL SERIAL.</p>\r\n', NULL),
(123, 82, '14', 1, 1, 'PENDIENTE', '<p>\r\n	SE CUENTA CON 3 LICENCIAS, QUEDA PENDIENTE CAPTURAR EL SERIAL.</p>\r\n', NULL),
(124, 80, '2005', 1, 1, 'PENDIENTE', '<p>\r\n	SE CUENTA CON 5 LICENCIAS, QUEDA PENDIENTE CAPTURAR EL SERIAL.</p>\r\n', NULL),
(125, 81, '2005 WIN 32', 1, 1, 'PENDIENTE', '<p>\r\n	SE CUENTA CON 5 LICENCIAS, QUEDA PENDIENTE CAPTURAR EL SERIAL.</p>\r\n', NULL),
(126, 85, '7', 1, 1, 'PENDIENTE', '<p>\r\n	SE CUENTA CON 5 LICENCIAS, QUEDA PENDIENTE CAPTURAR EL SERIAL.</p>\r\n', NULL),
(127, 85, 'SERVER STANDARD 2008', 1, 4, '49248774-MAK', '<div>\r\n	CLAVE: <strong>KBQDP-XTMHP-FCBBJ-KFXBV-W9P7W</strong></div>\r\n', NULL),
(128, 85, 'SERVER STANDARD 2008', 1, 4, '44767337-KMS', '<div>\r\n	CLAVE: <strong>PRQV6-98F2Y-VPRVQ-79KH3-64PPQ</strong></div>\r\n', NULL),
(129, 85, 'SERVER STANDARD 2008', 1, 4, '60790253-KMS', '<div>\r\n	CLAVE: <strong>6WFMM-VMYDW-FGQF3-MTMC4-WHCG2</strong></div>\r\n', NULL),
(130, 85, 'SERVER STANDARD 2008', 1, 4, '60790253-MAK', '<div>\r\n	CLAVE: <strong>BWHRC-MX4CH-K64Q2-KKJFJ-D8PWK</strong></div>\r\n', NULL),
(131, 85, 'XP PRO', 1, 1, 'PENDIENTE', '<p>\r\n	SE CUENTA CON 11&nbsp; LICENCIAS, QUEDA PENDIENTE CAPTURAR EL SERIAL.</p>\r\n', NULL),
(132, 18, '--', 1, 1, 'PENDIENTE', '<p>\r\n	SE CUENTA CON 5 LICENCIAS, QUEDA PENDIENTE CAPTURAR EL SERIAL.</p>\r\n', NULL),
(133, 15, 'X5', 1, 1, 'PENDIENTE', '<p>\r\n	SE CUENTA CON 2 LICENCIAS, QUEDA PENDIENTE CAPTURAR EL SERIAL.</p>\r\n', NULL),
(134, 16, 'PREMIUM 6.0', 1, 1, '6951-7085', '<p>\r\n	<strong>1543-1009-7172-8717-6951-7085</strong></p>\r\n', NULL),
(135, 31, '6.1', 1, 1, 'PENDIENTE', '<p>\r\n	SE CUENTA CON 1 LICENCIA, QUEDA PENDIENTE CAPTURAR EL SERIAL.</p>\r\n', NULL),
(137, 36, '8.0', 1, 1, 'PENDIENTE', '<p>\r\n	SE CUENTA CON 3 LICENCIAS, QUEDA PENDIENTE CAPTURAR EL SERIAL.</p>\r\n', NULL),
(138, 48, '2010 PRO', 1, 1, 'MVBB3', '<div>\r\n	Product Key: <strong>V62CH-W6RHH-9P7RV-HJMRV-MVBB3</strong></div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	<strong>MX-05DFTV-01166-0AM-007N</strong></div>\r\n', 'dcd3c-serial-office-2010.pdf'),
(139, 48, '2010 PRO', 1, 1, 'KP36V', '<div>\r\n	Product Key: <strong>D3YFF-QJWTX-MFKWD-F9VHB-KP36V</strong></div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	<strong>MX-05DFTV-01166-0AM-0081</strong></div>\r\n', 'f0b59-serial-office-2010.pdf'),
(140, 59, '2000', 1, 1, 'PENDIENTE', '<p>\r\n	SE CUENTA CON 1 LICENCIA, QUEDA PENDIENTE CAPTURAR EL SERIAL.</p>\r\n', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `licencias_esquema_licenciamiento`
--

CREATE TABLE IF NOT EXISTS `licencias_esquema_licenciamiento` (
  `id_esquema_licenciamiento` int(11) NOT NULL AUTO_INCREMENT,
  `nom_esquema_licenciamiento` varchar(50) NOT NULL,
  PRIMARY KEY (`id_esquema_licenciamiento`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Esta tabla es un catalogo de la tabla licencias' AUTO_INCREMENT=10 ;

--
-- Volcado de datos para la tabla `licencias_esquema_licenciamiento`
--

INSERT INTO `licencias_esquema_licenciamiento` (`id_esquema_licenciamiento`, `nom_esquema_licenciamiento`) VALUES
(1, 'Por Instancia'),
(2, 'Por Nube'),
(3, 'Por Procesador'),
(4, 'Por Servidor'),
(5, 'Por Usuarios Concurrentes'),
(6, 'Por Usuarios Nombrados'),
(7, 'Corporativo'),
(8, 'Único pago'),
(9, 'Otro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `licencias_hardware_n_n`
--

CREATE TABLE IF NOT EXISTS `licencias_hardware_n_n` (
  `id_licencia_hardware` int(11) NOT NULL AUTO_INCREMENT,
  `id_hard` int(11) DEFAULT NULL,
  `id_licencia` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_licencia_hardware`),
  KEY ` licencias_hardware_n_n_hardware` (`id_hard`),
  KEY ` licencias_hardware_n_n_licencias` (`id_licencia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Esta tabla es la relacion n-n entre licencias y hardware' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `licencias_tipos`
--

CREATE TABLE IF NOT EXISTS `licencias_tipos` (
  `id_tipo_licencia` int(11) NOT NULL AUTO_INCREMENT,
  `nom_tipo_licencia` varchar(35) NOT NULL,
  PRIMARY KEY (`id_tipo_licencia`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Esta tabla es un catalogo de la tabla licencias' AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `licencias_tipos`
--

INSERT INTO `licencias_tipos` (`id_tipo_licencia`, `nom_tipo_licencia`) VALUES
(1, 'Propietaria'),
(2, 'Libre'),
(3, 'Otro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `licencias_usuarios_b_n_n`
--

CREATE TABLE IF NOT EXISTS `licencias_usuarios_b_n_n` (
  `id_licencias_usuarios_b_n_n` int(11) NOT NULL AUTO_INCREMENT,
  `id_licencia` int(11) NOT NULL,
  `id_usuario_b` int(11) NOT NULL,
  PRIMARY KEY (`id_licencias_usuarios_b_n_n`),
  KEY `licencias_licencias_usuarios_b_n_n` (`id_licencia`),
  KEY `usuario_b_licencias_usuarios_b_n_n` (`id_usuario_b`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci COMMENT='Esta tabla es la relacion n-n entre licencias y usuarios_b' AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `licencias_usuarios_b_n_n`
--

INSERT INTO `licencias_usuarios_b_n_n` (`id_licencias_usuarios_b_n_n`, `id_licencia`, `id_usuario_b`) VALUES
(4, 1, 1031);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientos_consumibles`
--

CREATE TABLE IF NOT EXISTS `movimientos_consumibles` (
  `id_movimiento` int(11) NOT NULL AUTO_INCREMENT,
  `id_consumible` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `descripcion` varchar(180) NOT NULL,
  `id_coordinacion` int(11) DEFAULT NULL,
  `documento_anexo` varchar(180) DEFAULT NULL,
  PRIMARY KEY (`id_movimiento`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Esta tabla almacena los movimientos de los consumibles gasta' AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `movimientos_consumibles`
--

INSERT INTO `movimientos_consumibles` (`id_movimiento`, `id_consumible`, `cantidad`, `descripcion`, `id_coordinacion`, `documento_anexo`) VALUES
(3, 2, 2, 'xc', 1, NULL),
(4, 2, 1, 'PRUEBA2', NULL, NULL),
(5, 2, 1, '1', NULL, NULL),
(6, 2, 1, 'Leti', NULL, NULL);

--
-- Disparadores `movimientos_consumibles`
--
DROP TRIGGER IF EXISTS `consumibles_ajuste_cantidad`;
DELIMITER //
CREATE TRIGGER `consumibles_ajuste_cantidad` BEFORE INSERT ON `movimientos_consumibles`
 FOR EACH ROW BEGIN
IF NEW.cantidad <= (SELECT cantidad FROM consumibles WHERE id_consumible = NEW.id_consumible) THEN
UPDATE consumibles 
SET cantidad=cantidad-NEW.cantidad
WHERE id_consumible = NEW.id_consumible;
END IF;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE IF NOT EXISTS `proveedor` (
  `id_proveedor` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_contacto` varchar(35) COLLATE latin1_spanish_ci DEFAULT NULL,
  `nombre_empresa` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `id_tipo_proveedor` int(11) NOT NULL,
  `telefono` varchar(20) COLLATE latin1_spanish_ci DEFAULT NULL,
  `email` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `direccion` varchar(70) COLLATE latin1_spanish_ci DEFAULT NULL,
  `id_estado` int(11) DEFAULT NULL,
  `codigo_postal` int(10) DEFAULT NULL,
  `pais` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_proveedor`),
  KEY `tproveedor_tproveedor_tipos` (`id_tipo_proveedor`),
  KEY `proveedor_estado_federal` (`id_estado`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci COMMENT='Esta tabla almacena la informacion de los proveedores' AUTO_INCREMENT=52 ;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`id_proveedor`, `nombre_contacto`, `nombre_empresa`, `id_tipo_proveedor`, `telefono`, `email`, `direccion`, `id_estado`, `codigo_postal`, `pais`) VALUES
(1, 'Luis Ywama', 'PALISADE EUROPE', 1, '6272778000', 'sales@palisade.com', '798 Cascadilla Street Ithaca, NY', NULL, 14850, 'USA'),
(2, 'Diego Ricardo Hernández Guerrero', 'INFOTECNOLOGÍA CORPORATIVA S. C. ', 1, '4421928100', 'ventas.productos@icorp.com.mx', 'Acceso III 1, Benito Juárez', 22, 76120, 'MÉXICO'),
(3, 'Rogelio Cruz Rojas', 'GRUPO SSC SA DE CV', 1, '4151520547', 'rogelio.cruz@grupossc.com', 'Messones No. 1 Int. 9 y 10 Col. Centro, San Miguel de Allende', 11, 37700, 'MÉXICO'),
(4, NULL, 'SIGSA S.A DE C.V.', 1, '5555752190', NULL, 'San Francisco 1375, Tlacoquemecatl del Valle', 7, 3200, 'MÉXICO'),
(5, NULL, 'AUTODESK DE MÉXICO S.A. DE C.V.', 1, '5552496060', NULL, 'Paseo de las Palmas 405 Piso 9, Col. Lomas de Chapultepec', 15, 11000, 'MÉXICO'),
(6, 'Laura Garduño', 'DASOFT', 1, '5552643977', 'laura.garduno@dasoft.com.mx', 'Av. Coyoacán 1622, Col del Valle Centro', 7, 3100, 'MÉXICO'),
(7, NULL, 'CADLABS S.A. DE C.V.', 1, '5555748357', NULL, 'Edificio 2 Planta Baja, Av. Coyoacán 1622, Col del Valle Centro', 7, 3100, 'MÉXICO'),
(8, NULL, 'COMPUCAD S.A. DE C.V.', 1, '3336169415', NULL, 'Aurelio L. Gallardo 433 Col. Ladrón de Guevara', 14, 44600, 'MÉXICO'),
(9, NULL, 'TRANSOFT SOLUTIONS INC.', 1, '6042448387', 'sales@transoftsolutions.com', '13575 Commerce Pkwy, Richmond, BC V6V 2L1', NULL, 0, 'CANADÁ'),
(10, 'Armando Morales', 'RENTANET S.A. DE C.V.', 1, '4422157421', 'amorales@rentanet.com.mx', 'Panorama 2, San Pablo', 22, 76125, 'MÉXICO'),
(11, NULL, 'COGNOSONLINE S.A. DE.C.V.', 1, '5521676377', NULL, 'Calz. Gral. Mariano Escobedo 556, Anzures', 7, 11950, 'MÉXICO'),
(12, NULL, 'IHS EVIEWS', 1, '9498563368', 'sales@eviews.com', '4521 Campus Drive #336 Irvine CA 92612-2621', NULL, 0, 'USA'),
(13, 'Jorge Toucet', 'FLEXSIM MÉXICO S.A. DE C.V.', 1, '3336483503', 'JorgeToucet@flexsim.com.mx', 'Av. Prol. Americas 1551 Piso 1 Col. Providencia', 14, 44630, 'MÉXICO'),
(14, 'Raúl González Neira', 'M. C. MICROCUMPUTACIÓN S.A. DE C.V.', 1, '4422164444', 'rgonzalez@microcomp.com.mx', 'Av. Universidad 332 A Pte. Col. Centro', 22, 76000, 'MÉXICO'),
(15, NULL, 'TARGETWARE INFORMÁTICA S.A. DE C.V.', 1, '5555807868', 'comercial@software.com.mx', 'Av. Paseo de la Reforma #115 - Piso 4 Núm. 100 Col. Lomas de Chapultep', 15, 11000, 'MÉXICO'),
(16, NULL, 'LINDO SYSTEMS INC. ', 1, '3129887422', 'jrees@lindo.com', '1415 North Dayton Chicago, IL ', NULL, 60642, 'USA'),
(17, 'José Luis Torres López', 'ENTER COMPUTADORAS Y SERVICIOS S.A. DE C.V ', 1, '4421532700', 'jose.torres@entees.com.mx', 'Av. Universidad Ote. No. 104 Col. Santiago de Querétaro ', 22, 76000, 'MÉXICO'),
(18, NULL, 'LDI ASSOCIATS', 1, '5585952000', NULL, 'Av. Clavería 123, Claveria', 15, 2080, 'MÉXICO'),
(19, NULL, 'ENGINNERING DYNAMICS CORPORATION ', 1, '5036444500', 'info@edcorp.com', '8625 SW Cascade Blvd, Suite 200 Beaverton, Oregon', NULL, 97008, 'USA'),
(20, 'Juan Carlos Castillo Galván ', 'NATIONAL INSTRUMENTS DE MÉXICO S.A. DE C.V.', 1, '8000100793', NULL, 'Av Lincoln 1355-2 Fraccionamiento 32317, La Playa, Cd Juárez', 6, 0, 'MÉXICO'),
(21, NULL, 'SIGSA/ESRI', 1, '7223180316', 'contacto@setenal.info', 'Av. Hidalgo Oriente #608-1 Col. Santa Clara, Toluca', NULL, 50090, 'MÉXICO'),
(22, NULL, 'LOGMEIN', 1, '7818970640', NULL, '500 Unicorn Park Drive Woburn MA', NULL, 1801, 'USA'),
(23, 'Esther Aguilar', 'MultiON CONSULTING S.A. DE C.V.', 1, '5555594050', 'info@multion.com.mx', 'Insurgentes Sur 1236, Tlacoquemecatl del Valle, 03200 Benito Juárez', 7, 0, 'MÉXICO'),
(24, 'Ricardo García Zarate', 'ASIAMI S.A. DE C.V.', 1, '5558705185', 'asiami@prodigy.com.mx', 'Calzada de Guadalupe No. 442 P/A Cuautitlán Izcalli', 15, 54720, 'MÉXICO'),
(25, NULL, 'GRUPO CAPITEC S.A. DE C.V.', 1, '5556346782', 'capitec@grupocapitec.com', 'Auditores No.40 Col. Sifon', 15, 9400, 'MÉXICO'),
(26, 'Ignacio Bermúdez Molina', 'ALTA ELECTRÓNICA APLICADA DE MÉXICO S.A. DE C.V.', 1, '5555495035', NULL, 'Campestre Churubusco', 7, 4200, 'MÉXICO'),
(27, NULL, 'COMPUCARE DE MÉXICO S.A. DE C.V ', 1, '4421830836', NULL, 'Calle Alfonso Cravioto 175-6, Reforma Agraria 2da Secc', 22, 76147, 'MÉXICO'),
(28, NULL, 'NUANCE ESPAÑA', 1, '913515341', '1@2.com', 'Avenida Comunidad de Madrid 3 Portal 5, Bajo A ', NULL, 28224, 'ESPAÑA'),
(29, NULL, 'RESOURCE IT', 1, '4422151824', 'info@resourceit.com.mx', 'Edificio Órbita, Oficina 108, Ignacio Pérez Sur #28, Col. Centro', 22, 76000, 'MÉXICO'),
(30, NULL, 'MCTRANS', 1, '3523920378', 'mctrans@ce.ufl.edu', 'PO Box 116585, Gainesville, FL 32611-6585', NULL, 0, 'USA'),
(31, 'Shelly Greenberg', 'ALK TECHNOLOGIES INC.', 1, '6096830220', NULL, '1000 Herrotown Road Princeton, New Jersey', NULL, 8540, 'USA'),
(32, NULL, 'GEO INGENIERIA ALFVEN S.A. DE C.V.', 1, '4422127209', 'geoingenieriaalfven@hotmail.com', 'Circuito Jardín 356-8 Álamos 3a sección', 22, 76160, 'MÉXICO'),
(33, NULL, 'ITASCA CONSULTING GROUP INC.', 1, '6123714711', 'accounts@itascacg.com', '111 Third Avenue South, Suite 450 Minneapolis MN ', NULL, 55401, 'USA'),
(34, 'Syed Hasanain', 'COMPUTERS & STRUCTURES INC.', 1, '6492200', 'info@csiberkeley.com', '1995 University Avenue, Suite 540, CA', NULL, 94704, 'USA'),
(35, 'Francisco Jesús de la Mora López', 'SISTEMAS PHOENIX S. DE R.L.', 1, '5556020855', 'phoenix@sistemasphoenix.com.mx', 'Boulevard Adolfo López Mateos 1936 202 Tlacopac', 15, 1049, 'MÉXICO'),
(36, NULL, 'MARITIME RESEARCH INSTITUTE NETHERLANDS', 1, '31317493911', 'info@marin.nl', 'Haagsteeg 2, 6708 pm Wageningen, The Netherlands', NULL, 0, 'THE NETHERLANDS '),
(37, 'Evangelina Serrano', 'COMERCIALIZADORA UNIVERSIDAD DE COLIMA S.C.', 1, '3123138484', 'evaser@ucol.mx', 'Alfonso Sierra Partida No.314, Palma Baja B Col.Lomas de Vista Hermosa', 9, 28016, 'MÉXICO'),
(38, NULL, 'MEDESYS TECNOLOGÍA DE INFORMACIÓN S.A. DE C.V.', 1, '5555363023', 'info@medesys.com.mx', 'Porfirio Díaz No. 121 Col. del Valle', 15, 3100, 'MÉXICO'),
(39, 'Norma Sánchez', 'PASS PREDICTIVE ANALYTICAL SOFTWARE AND SOLUTIONS', 1, '5682179756', 'norma.sanchez@pass.mx', 'INSURGENTES SUR No. 933', 15, 3810, 'MÉXICO'),
(40, 'Ana Cecilia Ramos Calderón', 'SERVICIOS INFORMÁTICOS', 1, '5526524903', NULL, 'Santa Cecilia  11 Residencial Cafetales ', 15, 4909, 'MÉXICO'),
(41, NULL, 'CALIPER CORPORATION', 1, '6175274700', 'sales@caliper.com', '1172 Beacon Street, Suite 300 Newton, MA ', NULL, 2461, 'USA'),
(42, NULL, 'GRUPO EMPRESARIAL PALET S.A. DE C.V.', 1, '7223274405', NULL, 'Sagitario 206, Fracc. Loma Linda Villa Hermosa, Centro', 27, 86050, 'MÉXICO'),
(43, NULL, 'DELTARES', 1, '0883358273', 'info@deltares.nl', 'P.O. Box 177 2600 MH Delft', NULL, 0, 'THE NETHERLANDS'),
(44, 'Gerardo Morales', 'ONLINET S.A. DE C.V.', 1, '5555862613', NULL, 'Casma 594 Colonia Linda Vista Delegación Gustavo A. Madero', 15, 7300, 'MÉXICO'),
(45, NULL, 'GOLDEN SOFTWARE', 1, '3032791021', 'info@goldensoftware.com', '809 14th St Golden CO', NULL, 80401, 'USA'),
(46, 'Jorge González Turnbull', 'CORPORATIVO ISO S.A. DE C.V.', 1, '4777186898', NULL, 'Av. Haciendas el Rosario 401 Col. Real del Bosque, León de los Aldama', 11, 37178, 'MÉXICO'),
(47, NULL, 'SOILVISION SYSTEMS LTD', 1, '3064773324', 'contact@soilvision.com', '120-502 Wellman Crescent, Saskatoon, SK S7T 0J1', NULL, 0, 'CANADÁ'),
(48, NULL, 'SISTEMAS INFORMÁTICOS Y COMPUTACIONALES', 1, '5557056902', NULL, 'Berlín #27-A Col. Juárez ', 15, 6600, 'MÉXICO'),
(49, 'Domingo Palet Ejarque', 'GEN PACK S.A. DE C.V.', 1, '5557544377', 'dpalet@gepackmexico.com', 'Salaverry 988, Lindavista Nte.', 7, 7300, 'MÉXICO'),
(50, 'José Luis Sánchez de Jesús ', 'TOOL S.A.', 1, '5534210688', 'clip.jlsdj@gmail.com', 'Calle 19 No. 197 Col. las Águilas Nezahualcóyotl ', 15, 57900, 'MÉXICO'),
(51, NULL, 'TECHSMITH CORPORATION', 1, '5173812300', NULL, '2405 Woodlake Drive Okemos, MI 48864-5910', NULL, 0, 'USA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor_tipos`
--

CREATE TABLE IF NOT EXISTS `proveedor_tipos` (
  `id_tipo_proveedor` int(11) NOT NULL AUTO_INCREMENT,
  `nom_tipo_proveedor` varchar(35) NOT NULL,
  PRIMARY KEY (`id_tipo_proveedor`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Esta tabla es un catalogo de la tabla de proveedores' AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `proveedor_tipos`
--

INSERT INTO `proveedor_tipos` (`id_tipo_proveedor`, `nom_tipo_proveedor`) VALUES
(1, 'Software'),
(2, 'Hardware'),
(3, 'Consumibles'),
(4, 'Mixto');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `software`
--

CREATE TABLE IF NOT EXISTS `software` (
  `id_software` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_software` varchar(50) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `descripcion` varchar(200) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `id_fabricante` int(11) NOT NULL,
  PRIMARY KEY (`id_software`),
  KEY `tsoftware_tcategoria` (`id_categoria`),
  KEY `software_fabricante` (`id_fabricante`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=103 ;

--
-- Volcado de datos para la tabla `software`
--

INSERT INTO `software` (`id_software`, `nombre_software`, `descripcion`, `id_categoria`, `id_fabricante`) VALUES
(1, '@RISK  ', 'Realiza análisis de riesgo utilizando la simulación para mostrar múltiples resultados posibles en un modelo de hoja de cálculo, y le indica qué probabilidad hay de que se produzca.', 7, 1),
(2, 'ACROBAT ', 'Visualiza, crea y modifica archivos con el formato Portable Document Format (PDF).', 7, 2),
(3, 'ANSYS MECHANICAL', 'Es una potente solución para el análisis de estructuras bajo cargas lineales, no lineales y dinámicas. ', 4, 3),
(4, 'ARCGIS', 'Productos de software en el campo de los Sistemas de Información Geográfica.', 7, 4),
(10, 'AutoCAD Civil 3D', 'Herramienta de diseño y cálculo útil en el desarrollo de diseño de sitio, diseño urbanístico, carreteras, movimiento de tierras, cálculo topográfico, replanteo de información, etc.', 4, 5),
(13, 'AUTOTURN', 'Software de simulación de giro y análisis de rutas de barrido. ', 7, 6),
(14, 'BEYOND COMPARE ', 'Herramienta para comparar carpetas y ficheros de Windows o Linux. ', 7, 7),
(15, 'CORELDRAW ', 'Sirve para editar gráficos basados en vectores. También se utiliza para generar imágenes y gráficos desde cero, permite editar fotografías, dibujos y otro tipo de grafismos. ', 7, 8),
(16, 'CREATIVE SUITE', 'Paquete de aplicaciones dirigido especialmente al diseño y la publicación impresa pero con un poco de diseño web.', 7, 2),
(18, 'DRAGON NATURALLY SPEAKING  ', 'Paquete de software de reconocimiento de voz.', 7, 9),
(19, 'ELLUMINATE LIVE VCLASS', 'Herramienta para la educación, demostración, colaboración y conferencias por Web en tiempo real.', 11, 21),
(20, 'EVIEWS', 'Paquete estadístico para Microsoft Windows, permite manejar de forma rápida y eficiente datos, análisis estadísticos y ecométricos, generar proyecciones y modelos de simulación.', 7, 11),
(21, 'FILEMAKER SERVER', 'Software de servidor rápido y fiable utilizado para compartir datos de manera segura con grupos de usuarios de FileMaker Pro, FileMaker Go y FileMaker WebDirect.', 4, 12),
(22, 'FILEMAKER PRO', 'Forma parte de una plataforma unificada que permite crear apps personalizadas para entornos móviles, en la nube y en escritorio.', 7, 12),
(23, 'FLEXSIM', 'Software para la simulación de eventos discretos, que permite modelar, analizar, visualizar y optimizar cualquier proceso industrial.', 4, 13),
(24, 'GOOGLE EARTH', 'Herramienta que permite analizar terrenos, diseñar rutas o planear construcciones. ', 7, 14),
(25, 'GRAPHER', 'Programa de computación capaz de crear gráficos en 2D y 3D a partir de simples y complejas ecuaciones.', 7, 15),
(26, 'HVE', 'Entorno de simulación 3D para trabajo rutnario de ingenieros de diseño de vehículos, investigadores de seguridad y reconstructores de accidentes.', 7, 19),
(27, 'JMP ', 'Herramienta que combina potentes estadísticas con gráficos dinámicos tanto en memoria como en equipo de sobremesa. ', 7, 22),
(28, 'LABVIEW FULL ', 'Software de ingeniería diseñado para aplicaciones que requieren pruebas, medidas y control con acceso rápido a información de datos y hardware.', 7, 23),
(29, 'LITPACK ', 'Diseño e implementación de estrategias de gestión eficientes, requiere conocimiento de lo procesos físicos que controlan el transporte y sedimentación de materiales de playas.', 7, 24),
(30, 'LOGMEIN PRO', 'Herramienta de acceso remoto.', 14, 25),
(31, 'EASY RECOVERY PROFESSIONAL', 'Aplicación para recuperar archivos Kroll Ontrack de forma fácil y segura.', 7, 10),
(32, 'ERP INTELISIS', 'Software administrativo inteligente que integra, coordina y automatiza todas las áreas y los procesos de negocio.', 15, 16),
(33, 'HDM-4', 'Programa computacional que sirve como herramienta para el análisis, la planificación, gestión y evaluación del mantenimiento, mejora y la toma de decisiones relacionadas con inversión de carreteras.', 7, 42),
(34, 'HYPACK MAX', 'Software para recopilación de datos hidrogáficos, procesamiento y productos finales.', 7, 20),
(35, 'LINGO HYPER', 'Herramienta integral diseñada para construir y resolver modelos de optimización lineales, no lineales y enteros más rápido, más fácil y más eficiente. ', 7, 18),
(36, 'MACROMEDIA STUDIO', 'Plataforma multimedia que se utiliza para crear aplicaciones interactivas, animaciones independientes y en la web. ', 2, 2),
(37, 'MATLAB', 'Entorno de desarrollo integrado con lenguaje de programación propio, muy útil para "plotear" y desarrollar aplicaciones rápidamente.', 7, 26),
(39, 'MCAFFE VIRUSSCAN', 'Software antivirus. McAfee comprueba el software cortafuegos y antivirus del equipo y el estado de ellos. ', 12, 27),
(43, 'MIKE', 'Modelo de última generación en el campo de la modelación costera. Simula procesos físicos, químicos y biológicos en ambiente marino.', 7, 24),
(45, 'MINITAB ', 'Programa de computadora diseñado para ejecutar funciones estadísticas básicas y avanzadas.', 7, 39),
(48, 'OFFICE', 'Conjunto de aplicaciones o programas de software que se utilizan en el hogar para realizar presentaciones, documentos, cálculos, etc. ', 10, 38),
(51, 'OMNIPAGE STANDARD ESPAÑOL', 'Conversión de documentos ocasionales o escaneo dedicado a PC. ', 10, 9),
(52, 'ORACLE ESTÁNDAR', 'Ofrece una facilidad de uso, potencia y rendimiento para grupos de trabajo, departamentos y aplicaciones web.', 3, 41),
(53, 'PC*MILER ', 'Software para empresas de transporte que realiza un seguimiento de kilometraje y rutas de camionero. ', 7, 29),
(54, 'PFC2D', 'Programa para modelar el movimiento y la interacción de conjuntos de partículas de tamaño arbitrariamente circular.', 7, 35),
(55, 'PROJECT', 'Software de administración de proyectos para asistir a administradores de proyectos en el desarrollo de planes, asignación de recursos a tareas, dar seguimiento al progreso, etc. ', 7, 38),
(59, 'RECOVERY  SQL SERVER', 'Servidor de recuperación SQL.', 7, 40),
(60, 'SAP2000', 'Programa de cálculo de estructuras por elementos finitos que tiene implementada una gran variedad de códigos de diseño para todo tipo de estructuras metálicas y de hormigón.', 7, 31),
(61, 'SHIPMA', 'Simula el comportamiento de maniobras de barcos.', 7, 37),
(62, 'SIABUC ', 'Software auxiliar en labores cotidianas de un centro de información o biblioteca, ya sea universitaria, pública o particular.', 4, 48),
(63, 'SIGMAPLOT', 'Paquete de gráficos y visualización, con funcionalidades de análisis estadístico, que permite exportar los gráficos generados a Excel y Power Point.', 7, 46),
(64, 'SOLID CONVERTER PDF', 'Conversor de archivos PDF a documentos de word, excel.', 10, 44),
(67, 'SPSS', 'Software estadístico que ofrece técnicas de recolección de datos y analítica predictiva para solucionar múltiples problemas empresariales y de investigación.', 7, 34),
(69, 'SQL SERVER', 'Sistema de manejo de bases de datos del modelo relacional. ', 3, 38),
(70, 'STAN', 'Lenguaje de programación probabilístico para la inferencia estadística escrita en c++.', 7, 47),
(71, 'STATA', 'Paquete de software estadístico, permite la gestión de datos, trazado de gráficos y las simulaciones.', 7, 45),
(73, 'STUDIO MOVIEBOX PLUS ', 'Creación de películas.', 7, 17),
(74, 'SURFER', 'Programa para hacer mapas y trazar líneas de contorno en 3D para Windows únicamente.', 7, 15),
(75, 'TRANSCAD', 'Sistema de información geográfica diseñado para profesionales del transporte con el objetivo de permitirles almacenar, mostrar y analizar datos.', 7, 30),
(76, 'TRUCK FILL', 'Programa de optimización de cargas de contenedores y camiones, con productos de diferentes tamaños y formas.', 7, 32),
(77, 'VISIO PROFFESIONAL', 'Software de dibujo vectorial, las herramientas que lo componen permiten realizar diagramas de oficinas, bases de datos, diagramas de flujo, UML, etc. ', 7, 38),
(78, 'VISSIM', 'Software para el análisis de tránsito, planificación y gestión de datos basados en SIG.', 7, 43),
(80, 'VISUAL SOURCESAFE', 'Sistema de control de versiones en el nivel de archivos, que permite trabajar en distintas versiones de un proyecto al mismo tiempo.', 11, 38),
(81, 'VISUAL STUDIO PRO', 'Conjunto de herramientas y otras tecnologías de desarrollo de software basado en componentes para crear aplicaciones, así como otros servicios web.', 2, 38),
(82, 'VISUM', 'Software para el análisis de transito, planificación y gestión de datos basada en SIG.', 7, 43),
(83, 'VMWARE VSPHERE', 'Plataforma de virtualización para construir infraestructuras de cloud. ', 9, 49),
(84, 'WEBSENSE', 'Aplicación que se utiliza en redes corporativas para filtrar el tráfico de Internet entrante y saliente.', 12, 50),
(85, 'WINDOWS', 'Sistema operativo que se encarga de reconocer todos los dispositivos de la computadora y de iniciar todas las aplicaciones necesarias para el usuarios.', 1, 38),
(88, 'POWER TRANSLATOR PROFESSIONAL', 'Herramienta para traducir del inglés a cualquier otro idioma.', 7, 36),
(89, 'PREMIUM SOLVER PLATFORM', 'Resuelve todos los tipos de problemas de optimización para asignar mejor los recursos escasos.', 7, 33),
(90, 'PRO FORTRAN ', 'Compilador de alto rendimiento, herramienta ideal para desarrollar código de una manera rápida y automática.', 2, 28),
(91, 'BREAKWAT', 'Herramienta de diseño conceptual para varios tipos de estructuras costeras bajo carga de olas.', 7, 52),
(92, 'CAMTASIA STUDIO', 'Software que permite grabar todas las actividades que se realizan en el computador, pudiendo crear y compartir vídeos o tutoriales.', 10, 53),
(93, 'CAPE PACK', 'Suite modular de software de paletización, que ayuda a determinar el mejor tamaño de productos, cantidad de cajas, tamaño de caja y carga de palet.', 7, 54),
(94, 'CLIP', 'Sistema informático de diseño, evaluación y control de ejecución y construcción de trazados de obras lineales en tres dimensiones.', 7, 55),
(95, 'CRYSTAL REPORTS', 'Herramienta que ayuda a diseñar reportes capaces de transmitir sólo información pertinente después de extraerla de cualquier fuente de datos.', 20, 56),
(96, 'PASSER', 'Programa de cronometraje de señal, amigable para el uso de arterias e intersecciones de diamantes.', 7, 57),
(97, 'PDF PASSWORD REMOVER', 'Asistente para eliminar bloqueos de cualquier documento PDF en cuestión de segundos.', 7, 58),
(98, 'TEAMVIEWER PREMIUM', 'Software informático que permite conectarse remotamente a otro equipo.', 9, 59),
(99, 'UNIBEST CL+,TC+DE', 'Modelo de costa.', 7, 52),
(100, 'FLIPPINGBOOK PUBLISHER BUSINESS', 'Herramienta que permite editar libros digitales a través de documentos PDF para visualizarlos en un formato que simula al libro físico.', 10, 60),
(101, 'NI SOUND AND VIBRATION TOOLKIT ', 'Software interactivo para adquirir, analizar y registrar rápidamente mediciones acústicas y de vibración.', 7, 23);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `soft_categoria`
--

CREATE TABLE IF NOT EXISTS `soft_categoria` (
  `id_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `nom_cat` varchar(50) NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Volcado de datos para la tabla `soft_categoria`
--

INSERT INTO `soft_categoria` (`id_categoria`, `nom_cat`) VALUES
(1, 'Sistema Operativo'),
(2, 'Desarrollo de software'),
(3, 'Manejador de base de datos'),
(4, 'Servidor de aplicaciones'),
(5, 'Servidor web'),
(6, 'Inteligencia de negocio y Data warehouse'),
(7, 'Empaquetado de propósito específico '),
(8, 'Correo'),
(9, 'Soporte a la gestión de servicios de TIC'),
(10, 'Oficina'),
(11, 'Colaboración '),
(12, 'Seguridad'),
(13, 'Firma electrónica'),
(14, 'Telecomunicaciones '),
(15, 'GRP'),
(16, 'GRP-Recursos humanos'),
(17, 'GRP-Recursos financieros'),
(18, 'GRP-Recursos materiales'),
(19, 'CAD Diseño Asistido por Computadora'),
(20, 'Otros');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `soft_fabricante`
--

CREATE TABLE IF NOT EXISTS `soft_fabricante` (
  `id_fabricante` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_fabricante` varchar(50) NOT NULL,
  PRIMARY KEY (`id_fabricante`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Esta tabla es el catalogo de fabricantes de software' AUTO_INCREMENT=61 ;

--
-- Volcado de datos para la tabla `soft_fabricante`
--

INSERT INTO `soft_fabricante` (`id_fabricante`, `nombre_fabricante`) VALUES
(1, 'PALISADE'),
(2, 'ADOBE'),
(3, 'ANSYS, Inc.'),
(4, 'Esri'),
(5, 'Autodesk, Inc.'),
(6, 'Transoft Solutions '),
(7, 'Scooter Software'),
(8, 'COREL'),
(9, 'Nuance Communications, Inc.'),
(10, 'Kroll Ontrack Inc.'),
(11, 'Quantitative Micro Software '),
(12, 'FileMaker Inc.'),
(13, 'Flexsim Software Products, Inc.'),
(14, 'Google '),
(15, 'Golden Software'),
(16, 'Intelisis Aspel S.A de C.V.'),
(17, 'Pinnacle '),
(18, 'LINDO SYSTEMS INC '),
(19, 'Engineering Dynamics Corporation '),
(20, 'HYPACK, Inc.'),
(21, 'Illuminate Education, Inc.'),
(22, 'SAS'),
(23, 'National Instruments'),
(24, 'DHI'),
(25, 'LogMeIn'),
(26, 'MathWorks'),
(27, 'MCAFEE'),
(28, 'Absoft'),
(29, 'ALK Technologies Inc.'),
(30, 'Caliper Corporation'),
(31, 'Computers and Structures, Inc. (CSI)'),
(32, 'ESKO'),
(33, 'FrontlineSolvers'),
(34, 'IBM'),
(35, 'Itasca Consulting Group'),
(36, 'LEC'),
(37, 'Maritime Research Institute Netherlands (MARIN)'),
(38, 'MICROSOFT'),
(39, 'MINITAB'),
(40, 'OFFICE RECOVERY'),
(41, 'Oracle Corporation'),
(42, 'PIARC'),
(43, 'PTV Group'),
(44, 'Solid Documents'),
(45, 'StataCorp'),
(46, 'Systat Software Inc.'),
(47, 'TU Wien'),
(48, 'Universidad de Colima'),
(49, 'vSphere'),
(50, 'Websense, Inc.'),
(51, 'TOOL'),
(52, 'DELTARES'),
(53, 'TechSmith Corporation'),
(54, 'GE PACK S.A. DE C.V.'),
(55, 'Tool S.A. '),
(56, 'Crystal Decisions'),
(57, 'MCTRANS MOVING TECHNOLOGY'),
(58, 'VeryPDF'),
(59, 'TeamViewer GmbH'),
(60, 'FlippingBook');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidades_medida_cfdi`
--

CREATE TABLE IF NOT EXISTS `unidades_medida_cfdi` (
  `id_unidad_medida` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_unidad_medida` varchar(50) NOT NULL,
  PRIMARY KEY (`id_unidad_medida`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Esta tabla es un catalogo de unidades de medida' AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `unidades_medida_cfdi`
--

INSERT INTO `unidades_medida_cfdi` (`id_unidad_medida`, `nombre_unidad_medida`) VALUES
(1, 'Unidad'),
(2, 'Paquete'),
(3, 'Caja'),
(4, 'Metro'),
(5, 'Kilogramo'),
(6, 'Litro'),
(7, 'Galón'),
(8, 'Lote');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `id_tipo_usuario` int(11) NOT NULL,
  `nombre_usuario` varchar(50) NOT NULL,
  `username` varchar(15) NOT NULL,
  `password` varchar(15) NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `username` (`username`),
  KEY `usuario_tipo` (`id_tipo_usuario`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Tabla de Usuarios' AUTO_INCREMENT=25 ;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `id_tipo_usuario`, `nombre_usuario`, `username`, `password`) VALUES
(1, 1, 'Daniel Guzmán', 'adminIMT', 'adminIMT05'),
(17, 5, 'Leticia Cipriano', 'invitadoIMT', 'invitadoIMT05'),
(18, 3, 'Perla Vargas', 'perlaIMT', 'perlaIMT05'),
(19, 2, 'Carlos Ugalde', 'carlosIMT', 'carlosIMT05'),
(21, 4, 'Consumibles', 'consumIMT', 'consumIMT05'),
(22, 6, 'Asignaciones', 'asignIMT', 'asignIMT05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_b`
--

CREATE TABLE IF NOT EXISTS `usuarios_b` (
  `id_usuario_b` int(11) NOT NULL AUTO_INCREMENT,
  `ape_paterno` varchar(30) COLLATE latin1_spanish_ci DEFAULT NULL,
  `ape_materno` varchar(30) COLLATE latin1_spanish_ci DEFAULT NULL,
  `nombres` varchar(30) COLLATE latin1_spanish_ci DEFAULT NULL,
  `id_coordinacion` int(11) DEFAULT NULL,
  `activo` varchar(5) COLLATE latin1_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_usuario_b`),
  KEY `usuarios_b_coordinacion` (`id_coordinacion`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci COMMENT='Esta tabla almacena usuarios que se les asignan recursos' AUTO_INCREMENT=1124 ;

--
-- Volcado de datos para la tabla `usuarios_b`
--

INSERT INTO `usuarios_b` (`id_usuario_b`, `ape_paterno`, `ape_materno`, `nombres`, `id_coordinacion`, `activo`) VALUES
(664, 'ORTIZ', 'ROSAS', 'MARÍA REYES', 11, 'Sí'),
(665, 'ORDOÑEZ', 'CAMACHO', 'BLANCA MARGARITA', 11, 'No'),
(666, 'RAMÍREZ', 'SABAG', 'ABRAHAM', 10, 'No'),
(667, 'BUSTOS', 'ROSALES', 'AGUSTÍN', 5, NULL),
(668, 'REYES', 'RODRIGUEZ DE LA GALA', 'AGUSTIN', 9, NULL),
(669, 'GARCÍA', 'GARCÍA', 'AÍDA', 9, NULL),
(670, 'MARROQUÍN', 'ESPINOSA', 'ALBERTO', 1, NULL),
(671, 'MENDOZA', 'DIAZ', 'ALBERTO', 8, NULL),
(672, 'BLANCO', 'GONZÁLEZ', 'ALEJANDRO', 9, NULL),
(673, 'RIVERA', 'CONTRERAS', 'ALEJANDRO', 1, NULL),
(674, 'ALVAREZ MANILLA', 'ACEVES', 'ALFONSO', 4, NULL),
(675, 'BALBUENA', 'CRUZ', 'ALFONSO', 5, NULL),
(676, 'HERRERA', 'GARCÍA', 'ALFONSO', 5, NULL),
(677, 'ELIZONDO', 'RAMÍREZ', 'ALFONSO MAURICIO', 6, NULL),
(678, 'PEREZ', 'SALAZAR', 'ALFONSO', 4, NULL),
(679, 'LÓPEZ', 'LÓPEZ', 'JOSE ALFREDO', 3, NULL),
(680, 'CUEVAS', 'COLUNGA', 'ANA CECILIA', 8, NULL),
(681, 'TORRES', 'ACOSTA', 'ANDRÉS ANTONIO', 3, NULL),
(682, 'HERNÁNDEZ', 'GÚZMAN', 'ANDRÉS', 3, NULL),
(683, 'RAMIREZ', 'VALENCIA', 'ANDRÉS', 3, NULL),
(684, 'BECERRIL', 'CASAS', 'ANGEL', 9, NULL),
(685, 'DEL VALLE', 'MORENO', 'ANGELICA DE LOURDES', 3, NULL),
(686, 'MAURICIO', 'GONZÁLEZ', 'ANGÉLICA', 11, NULL),
(687, 'ARROYO', 'OSORNO', 'JOSE ANTONIO', 5, NULL),
(688, 'GARCIA', 'CHAVEZ', 'ANTONIO', 8, NULL),
(689, 'GOMEZ', 'LÓPEZ', 'JOSE ANTONIO', 4, NULL),
(690, 'ROMERO', 'NAVARRETE', 'JOSE ANTONIO', 3, NULL),
(691, 'RUEDA', 'SALAZAR', 'ANTONIO', 9, NULL),
(692, 'SOTELO', 'FLORES', 'APOLINAR', 9, NULL),
(693, 'VELAZQUEZ', 'SALAS', 'ARMANDO', 8, NULL),
(694, 'PEREZ', 'SÁNCHEZ', 'JOSE ARTURO', 5, NULL),
(695, 'MORENO', 'MARTINEZ', 'MARIA AURORA', 5, NULL),
(696, 'HERNÁNDEZ', 'SÁNCHEZ', 'BERNARDO', 11, NULL),
(697, 'FABELA', 'GALLEGOS', 'CARLOS ADRIAN', 3, NULL),
(698, 'BLAKE', 'CERVANTES', 'CARLOS', 3, NULL),
(699, 'MARTNER', 'PEYRELONGUE', 'CARLOS DANIEL', 5, NULL),
(700, 'MORALES', 'PEREZ', 'CARMEN GUADALUPE ERNESTINA', 5, NULL),
(701, 'PIÑA', 'RODRIGUEZ', 'J. CARMEN MOISES', 1, NULL),
(702, 'GOMEZ', 'BERMUDEZ', 'CESAR OGILVERT', 1, NULL),
(703, 'RIVERA', 'TRUJILLO', 'CESAR', 8, NULL),
(704, 'GONZÁLEZ', 'ZEA', 'CRISTINA', 1, NULL),
(705, 'NAJERA', 'MONTIEL', 'CRISTINA', 6, NULL),
(706, 'CUEVAS', 'MORA', 'DAVID', 9, NULL),
(707, 'VAZQUEZ', 'VEGA', 'DAVID', 3, NULL),
(708, 'AVILA', 'ARZANI', 'DORA LUZ', 9, NULL),
(709, 'JIMÉNEZ', 'SÁNCHEZ', 'JOSE ELÍAS', 5, NULL),
(710, 'MAYORAL', 'GRAJEDA', 'EMILIO FRANCISCO', 8, NULL),
(711, 'LIRA', 'CORTÉZ', 'ENRIQUE', 9, NULL),
(712, 'MÁRQUEZ', 'PARRA', 'ENRIQUE', 5, NULL),
(713, 'MORALES', 'GARCÍA', 'ENRIQUE', 9, NULL),
(714, 'ZAIZAR', 'CONTRERAS', 'ERENDIRA', 1, NULL),
(715, 'SERRANO', 'FLORES', 'ETELBERTO', 9, NULL),
(716, 'TREJO', 'FRANCO', 'FABIOLA', 2, NULL),
(717, 'SANJUAN', 'GARCIA', 'FAUSTINO', 9, NULL),
(718, 'RIVERA', 'GUERRA', 'FEDERICO ALBERTO', 8, NULL),
(719, 'VARGAS', 'CONTRERAS', 'FELIPE', 9, NULL),
(720, 'BUELNA', 'SANCHEZ', 'FERNANDO', 5, NULL),
(721, 'HEREDIA', 'ITURBE', 'FRANCISCO', 5, NULL),
(722, 'CARRIÓN', 'VIRAMONTES', 'FRANCISCO JAVIER', 3, NULL),
(723, 'QUINTERO', 'PEREDA', 'FRANCISCO LUIS', 8, NULL),
(724, 'DE JESÚS', ' ZEA', 'GABRIELA', 9, NULL),
(725, 'GARCÍA', 'ORTEGA', 'GABRIELA', 9, NULL),
(726, 'GONZÁLEZ', 'GUZMÁN', 'GENOVEVA', 10, NULL),
(727, 'GARCIA', 'SILVA', 'GERARDO MANUEL', 9, NULL),
(728, 'CABRERA', 'ANGULO', 'GERMAN', 1, NULL),
(729, 'RUIZ', 'LANG', 'GILBERTO J. TRISTAN BILA', 9, NULL),
(730, 'NUÑEZ', 'RODRÍGUEZ', 'GILBERTO', 9, NULL),
(731, 'MARTÍNEZ', ' PEÑA', 'GUADALUPE EVANGELINA ITANDEHUI', 4, NULL),
(732, 'HERNÁNDEZ', 'OLALDE', 'GUADALUPE', 9, NULL),
(733, 'LOMELÍ', 'GONZÁLEZ', 'MARIA GUADALUPE', 3, NULL),
(734, 'TORRES', 'VARGAS', 'GUILLERMO', 7, NULL),
(735, 'ARIAS', 'BRAVO', 'GUSTAVO HUMBERTO', 1, NULL),
(736, 'BONILLA', ' CUEVAS', 'HECTOR MANUEL', 6, NULL),
(737, 'MEZQUITA', 'NULL', 'HECTOR', 6, NULL),
(738, 'DEL CASTILLO', 'MEJIA', 'HERMILO', 2, NULL),
(739, 'TORRES', 'SUAREZ', 'HILDA', 1, NULL),
(740, 'VILLANUEVA', 'SANDOVAL', 'IGNACIO', 1, NULL),
(741, 'VILLANUEVA', 'CARVALLO', 'AARÓN ISAÍ', 11, NULL),
(742, 'LÓPEZ', 'BAZAN', 'ISLAM', 4, NULL),
(743, 'HERNÁNDEZ', 'PÉREZ', 'JAVIER', 3, NULL),
(744, 'VÁZQUEZ', 'MENDOZA', 'JAVIER', 1, NULL),
(745, 'SESMA', 'MARTÍNEZ', 'JESÚS ARMANDO', 4, NULL),
(746, 'CHAVARRIA', 'VEGA', 'JESÚS MANUEL', 8, NULL),
(747, 'FORTANELL', 'ROMERO', 'JESÚS MATEO', 3, NULL),
(748, 'ESPARZA', 'ALMANZA', 'JESÚS MAURICIO', 8, NULL),
(749, 'TREJO', 'HERNÁNDEZ', 'JESUS', 1, NULL),
(750, 'ARMENDÁRIZ', 'JIMÉNEZ', 'JORGE', 1, NULL),
(751, 'ACHA', ' DAZA', 'JORGE ARTEMIO', 5, NULL),
(752, 'CASANOVA', 'BUSTOS', 'JORGE', 1, NULL),
(753, 'MARTÍNEZ', ' ANTONIO', 'JORGE JERÓNIMO', 5, NULL),
(754, 'TERÁN', 'GUILLÉN', 'JORGE', 3, NULL),
(755, 'QUINTANA', 'RODRÍGUEZ', 'JUAN ANTONIO', 3, NULL),
(756, 'BAHENA', 'LÓPEZ', 'JUAN', 1, NULL),
(757, 'VÁZQUEZ', ' PAULINO', 'JUAN CARLOS', 9, NULL),
(758, 'OROZCO', ' Y OROZCO', 'JUAN JOSE', 6, NULL),
(759, 'OJEDA', 'CÁRDENAS', 'JUAN NARCISO', 5, NULL),
(760, 'VALADEZ', 'CASTRO', 'JUAN PABLO', 4, NULL),
(761, 'ESTRADA', 'CAMACHO', 'JUAN RAMÓN', 9, NULL),
(762, 'LEYVA', 'CASTRO', 'JUAN RAMÓN', 8, NULL),
(763, 'AYALA', 'MURILLO', 'JUANA', 4, NULL),
(764, 'LOZANO', ' RODRÍGUEZ', 'JUDITH ARACELI', 1, NULL),
(765, 'OCAÑA', 'ESPINOSA DE LOS MONTEROS', 'KARINA GRISELDA', 9, NULL),
(766, 'GARDUÑO', 'PUENTE', 'MARÍA LAURA', 10, NULL),
(767, 'PINEDA', 'EZQUIVEL', 'LEOPOLDO', 9, NULL),
(768, 'MUÑOZ', 'ILHUICATZI', 'LIBRADO SEBASTIÁN', 1, NULL),
(769, 'PÉREZ', 'CORTES', 'LUIS ALBERTO', 4, NULL),
(770, 'REYES', 'ÁVILA', 'LUIS ALFONSO', 11, NULL),
(771, 'BERMÚDEZ', 'Y MARES', 'LUIS', 5, NULL),
(772, 'SUÁREZ', ' Y ARAUJO', 'LUIS ENRIQUE', 4, NULL),
(773, 'MIRANDA', 'MORENO', 'LUIS FERNANDO', 5, NULL),
(774, 'GUTIÉRREZ', 'HERNÁNDEZ', 'JOSE LUIS', 8, NULL),
(775, 'MORALES', 'SILVERIO', 'LUIS MIGUEL', 5, NULL),
(776, 'MONTOYA', 'DOMÍNGUEZ', 'JOSE LUIS', 1, NULL),
(777, 'MOYA', 'RIVERA', 'JOSE LUIS', 2, NULL),
(778, 'PADILLA', 'Y GARCÍA', 'JOSE LUIS', 1, NULL),
(779, 'OLASCUAGA', 'SANVICENTE', 'MARÍA LUISA', 1, NULL),
(780, 'TORRES', 'HERNANDEZ', 'LUZ MARIA', 9, NULL),
(781, 'FABELA', ' GALLEGOS', 'MANUEL DE JESÚS', 3, NULL),
(782, 'GUILLERMO', 'HERRERA MUÑOZ', 'MANUEL', 9, NULL),
(783, 'MENDOZA', 'GRANDE', 'MANUEL', 9, NULL),
(784, 'SOLÍS', ' RODRÍGUEZ', 'MARCELA CAROLINA', 8, NULL),
(785, 'ANTONIO', 'DEL ANGEL LÓPEZ', 'MARCO', 1, NULL),
(786, 'CORTES', ' SÁNCHEZ', 'MARIA DE LA LUZ', 1, NULL),
(787, 'REYES', 'TORRES', 'MARINA', 1, NULL),
(788, 'LELIS', 'ZARAGOZA', 'MARTHA', 10, NULL),
(789, 'BARRERA', 'BUCIO', 'MAURICIO', 4, NULL),
(790, 'FLORES', 'FLORES', 'MAYRA', 4, NULL),
(791, 'RAFAEL', 'MORALES', 'MERCEDES YOLANDA', 3, NULL),
(792, 'BACKHOFF', 'POHLS', 'MIGUEL ANGEL', 9, NULL),
(793, 'CERVANTES', ' NIETO', 'MIGUEL ANGEL', 4, NULL),
(794, 'DE ALBA', 'ROSANO', 'MIGUEL', 8, NULL),
(795, 'JUAREZ', ' CASTRO', 'MIGUEL ANGEL', 8, NULL),
(796, 'FLORES', 'PUENTE', 'MIGUEL ANTONIO', 4, NULL),
(797, 'MARTÍNEZ', 'MADRID', 'MIGUEL', 3, NULL),
(798, 'MONTOYA', 'RODRÍGUEZ', 'JOSÉ MIGUEL', 9, NULL),
(799, 'PÉREZ', 'GARCÍA', 'NATALIA', 4, NULL),
(800, 'VILLEGAS', 'VILLEGAS', 'NOELIA', 8, NULL),
(801, 'MALAGÓN', ' PATIÑO', 'NORA ESPERANZA', 8, NULL),
(802, 'IRIONDO', 'HERRERO', 'NORA', 6, NULL),
(803, 'RASCÓN', 'CHÁVEZ', 'OCTAVIO A', 10, NULL),
(804, 'RICO', 'GALEANA', 'OSCAR ARMANDO', 7, NULL),
(805, 'FLORES', 'CENTENO', 'OSCAR', 3, NULL),
(806, 'SERRALDE', 'GONZÁLEZ', 'OSCAR', 6, NULL),
(807, 'GOMEZ', 'SOLIS', 'OSWALDO', 5, NULL),
(808, 'RAMÍREZ', 'CANO', 'OSWALDO', 3, NULL),
(809, 'OROZCO', 'Y OROZCO', 'PABLO RODRIGO', 3, NULL),
(810, 'GALLARDO', ' RODRÍGUEZ', 'PAOLA VANESA', 5, NULL),
(811, 'CHAINE', 'ANGULO', 'PATRICIA', 1, NULL),
(812, 'GARCÍA', 'PALACIOS', 'PATRICIA', 11, NULL),
(813, 'LÓPEZ', 'RODRÍGUEZ', 'PATRICIA', 8, NULL),
(814, 'GARNICA', 'ANGUAS', 'PAUL', 4, NULL),
(815, 'LEÓN', 'RUIZ', 'PORFIRIO JOAQUIN', 9, NULL),
(816, 'ABREU', 'LUCARIO', 'RAFAEL', 1, NULL),
(817, 'CERVANTES', 'BELTR', 'RAMÓN', 2, NULL),
(818, 'HERNÁNDEZ', 'JIMÉNEZ', 'JOSE RICARDO', 3, NULL),
(819, 'SOLORIO', 'MURILLO', 'JOSE RICARDO', 4, NULL),
(820, 'L.', 'HILDEBRAND', 'ROBERT', 3, NULL),
(821, 'AGUERREBERE', 'SALIDO', 'ROBERTO', 10, NULL),
(822, 'JIMÉNEZ', 'CERVANTES', 'RODOLFO', 3, NULL),
(823, 'TÉLLEZ', 'GUTIÉRREZ', 'RODOLFO', 4, NULL),
(824, 'ZEA', 'GONZÁLEZ', 'ROGELIA', 3, NULL),
(825, 'MADRID', 'MONTES DE OCA', 'ROLANDO', 9, NULL),
(826, 'CASTRELLÓN', 'VICTORINO', 'ROSA ANGÉLICA', 5, NULL),
(827, 'HERNÁNDEZ', 'GARCÍA', 'SALVADOR', 7, NULL),
(828, 'MEZA', 'ÁLVAREZ-TOSTADO', 'SAMANTHA VERÓNICA', 1, NULL),
(829, 'TORRAS', 'ORTIZ', 'SANDRA', 4, NULL),
(830, 'CÁRDENAS', 'RODRÍGUEZ', 'SANTA LUDINETTE', 4, NULL),
(831, 'GARCIA', 'ÁVILA', 'SILVINO', 4, NULL),
(832, 'ÁLVAREZ-TOSTADO', 'PADILLA', 'SOCORRO', 3, NULL),
(833, 'PÉREZ', 'QUIROZ', 'JOSÉ TRINIDAD', 3, NULL),
(834, 'JIMÉNEZ', 'MENDOZA', 'VERÓNICA', 9, NULL),
(835, 'ISLAS', 'RIVERA', 'VÍCTOR MANUEL', 7, NULL),
(836, 'GÓMEZ', 'MENDOZA', 'VIRGINIA', 1, NULL),
(837, 'BOTELLO', 'DE CAMILO', 'VIVIANA', 2, NULL),
(838, 'RODRÍGUEZ', 'JIMÉNEZ', 'ALICIA', 2, NULL),
(839, 'ALCOCER', 'PERALTA', 'CARLOS JACOBO', 2, NULL),
(840, 'ARIAS', 'PACHECO', 'MOISES URIEL', 2, NULL),
(841, 'CHAVEZ', 'CÁRDENAS', 'JULIO ALEJANDRO', 4, NULL),
(842, 'MALO', 'DEL CASTILLO', 'JESÚS', 6, NULL),
(843, 'CANALES', 'LÓPEZ', 'ANGÉLICA', 9, NULL),
(844, 'ITURBE', 'EK', 'VICTOR MANUEL', 9, NULL),
(845, 'RAMÍREZ', 'XICOTENCATL', 'RODOLFO', 9, NULL),
(846, 'ACOSTA', 'GALLEGOS', 'ISMAEL', 3, NULL),
(847, 'ALARCÓN', 'HORTA', 'HUMBERTO', 4, NULL),
(848, 'CABRERA', 'MEDINA', 'MARIANO', 3, NULL),
(849, 'HERNÁNDEZ', 'MONROY', 'JUAN ANTONIO', 3, NULL),
(850, 'HERNÁNDEZ', 'RIVERA', 'JUANCARLOS', 3, NULL),
(851, 'LEE', 'ORANTES', 'FRANCISCO', 3, NULL),
(852, 'LOPEZ', 'HERNÁNDEZ', 'LUIS ENRIQUE', 3, NULL),
(853, 'MARTÍNEZ', 'VARGAS', 'M. RODRIGO', 3, NULL),
(854, 'MELCHOR', 'GARCIA', 'ALFREDO', 3, NULL),
(855, 'NAVARRO', 'JIMÉNEZ', 'SERGIO A.', 3, NULL),
(856, 'PARRA', 'TORRES', 'MARIO ALBERTO', 8, NULL),
(857, 'PEDRAZA', 'ELÍAS', 'MARIA DEL RAYO', 3, NULL),
(858, 'PEREIRA', 'FONSECA', 'JORGE', 3, NULL),
(859, 'PÉREZ', 'BUENROSTRO', 'ISRAEL', 3, NULL),
(860, 'QUINTERO', 'PICHARDO', 'PABLO', 3, NULL),
(861, 'GARCIA', 'ROCHA', 'KARLA', 5, NULL),
(862, 'GONZÁLEZ', 'RUÍZ', 'GLORIA', 1, NULL),
(863, 'HERRERA', 'NUÑEZ', 'MARIA JESSICA', 3, NULL),
(864, 'MARTÍNEZ', 'URQUIZA', 'EMMANUEL', 3, NULL),
(865, 'VALENCIA', 'HERNÁNDEZ', 'MARCOS', 3, NULL),
(866, 'PALAZUELOS', 'MARTÍNEZ', 'CÉSAR', 3, NULL),
(867, 'ARIAS', 'ESPINOSA', 'EFRAIN HUMBERTO', NULL, NULL),
(868, 'AMPUDIA', 'LAMBARRI', 'BEATRIZ G.', 10, NULL),
(869, 'OROZCO', 'ESCOTO', 'RAUL VICENTE', 1, NULL),
(870, 'OSEGUERA', 'TORRES', 'AGUSTIN', 5, NULL),
(871, 'GARZA', 'ROCHA', 'VICTOR ADAM', 3, NULL),
(872, 'CENTRO DE COMPUTO', '.', 'ÁREA COMÚN', 2, NULL),
(873, 'MODULO I', '.', 'ÁREA COMÚN', NULL, NULL),
(874, 'MODULO II', '.', 'ÁREA COMÚN', NULL, NULL),
(875, 'MODULO III', '.', 'ÁREA COMÚN', NULL, NULL),
(876, 'MODULO IV', '.', 'ÁREA COMÚN', NULL, NULL),
(877, 'ADMINISTRACIÓN', 'PRIMER PISO', 'ÁREA COMÚN', NULL, NULL),
(878, 'ADMINISTRACIÓN', 'SEGUNDO PISO', 'ÁREA COMÚN', NULL, NULL),
(879, 'LAB. HIDRAULICA', '(NAVE)', 'ÁREA COMÚN', NULL, NULL),
(880, 'LAB. HIDRAULICA', '(MEZZANINE)', 'ÁREA COMÚN', NULL, NULL),
(881, 'LAB. EQUIPAMIENTO', '/NAVE)', 'ÁREA COMÚN', NULL, NULL),
(882, 'LAB.EQUIPAMIENTO', '(MEZZANINE)', 'ÁREA COMÚN', NULL, NULL),
(883, 'AULAS', '.', 'ÁREA COMÚN', NULL, NULL),
(884, 'CENTRO DE DOCUMENTACION', '.', 'ÁREA COMÚN', NULL, NULL),
(885, 'ALMACÉN', '.', 'ÁREA COMÚN', NULL, NULL),
(886, 'LAB. INFRAESTRUCTURA', '.', 'ÁREA COMÚN', NULL, NULL),
(887, 'VERDE', 'OROZCO', 'FRANCISCO', 9, NULL),
(888, 'MEXICO PRIMER PISO', NULL, 'ÁREA COMÚN', NULL, NULL),
(889, 'CENTENO', 'SAAD', 'AGUSTÍN GERARDO', 8, NULL),
(890, 'MÉXICO', '.', 'ÁREA DE SERVIDORES', 2, NULL),
(891, 'MÉXICO', '.', 'NORMAS', NULL, NULL),
(892, 'ZEA', 'GONZÁLEZ', 'ADRIANA', 4, NULL),
(893, 'CERVANTES', 'QUIROZ', 'JESSIE', 10, NULL),
(894, 'SORIA', 'ANGUIANO', 'VERONICA', 8, NULL),
(895, 'CERVANTES', 'QUIROZ', 'ANA LAURA', 2, NULL),
(896, 'VALDEZ', 'JAIMES', 'MÓNICA GABRIELA', 1, NULL),
(897, 'MEXICO', '2 PISO', 'NORMAS', NULL, NULL),
(898, 'BIBLIOTECA', '.', 'ÁREA COMUN', NULL, NULL),
(899, 'LASTRA', 'FALLAS', 'BERNARDO', 5, NULL),
(900, 'DEL ÁNGEL', 'LÓPEZ', 'MARCO ANTONIO', 1, NULL),
(901, 'JURIDICO', 'JURIDICO', 'JURIDICO', NULL, NULL),
(902, 'BAJA', 'BAJA', 'BAJA', NULL, NULL),
(903, 'OROZCO', 'Y OROZCO', 'PEDRO', 10, NULL),
(904, 'Y SERVICIOS', 'GENERALES', 'RECUSOS MATERIALES', NULL, NULL),
(905, 'DIAZ', 'OSORIO', 'HUMBERTO', 1, NULL),
(906, 'GALICIA', 'VALENCIA', 'JOSE ALFONSO', NULL, NULL),
(907, 'ANAYA', 'PACHECO', 'JUAN FRANCISCO', 1, NULL),
(908, 'BUSTAMANTE', 'ALTAMIRANO', 'JOEL', 4, NULL),
(909, 'HERNÁNDEZ', 'DOMINGUEZ', 'ROBERTO', 4, NULL),
(910, 'LOPEZ', 'CASTRO', 'MARCO ANTONIO', NULL, NULL),
(911, 'DELGADO', 'ALAMILLA', 'HORACIO', 4, NULL),
(912, 'PINEDA', 'ROJAS', 'RAÚL', 2, NULL),
(913, 'MAURICIO', 'DE JESÚS', 'ROGELIO', 1, NULL),
(914, 'CASTAÑEDA', 'GONZÁLEZ', 'ELIZABETH', 9, NULL),
(915, 'GUTIERREZ', 'SORIA', 'ALEJANDRA', 5, NULL),
(916, 'LOZANO', 'GAONA', 'ARI ROLANDO', 8, NULL),
(917, 'MAGAÑA', 'ALVAREZ', 'ABEL', 1, NULL),
(918, 'GUZM', 'TRUJILLO', 'BETSABE', 1, NULL),
(919, 'BOCANEGRA', 'LÓPEZ', 'HILDA LAURA', 8, NULL),
(920, 'GONZÁLEZ', 'MORENO', 'JONATHAN OMAR', 9, NULL),
(921, 'GRADILLA', 'HERNÁNDEZ', 'LUZ ANGÉLICA', 9, NULL),
(922, 'DUARTE', 'QUIROGA', 'PABLO', 9, NULL),
(923, 'SÁNCHEZ', 'LOO', 'MARÍA ARIADNA', 11, NULL),
(924, 'GENERAL', '', 'DIRECCIÓN', 10, NULL),
(925, 'Y FINANZAS', NULL, 'ADMINISTRACIÓN', 1, NULL),
(926, 'E INTEGRIDAD ESTRUCTURAL', NULL, 'INGENIERÍA VEHICULAR', 3, NULL),
(927, NULL, NULL, 'INFRAESTRUCTURA', 4, NULL),
(928, 'TRANSPORTE', NULL, 'INTEGRACIÓN DEL', 5, NULL),
(929, 'INFRAESTRUCTURA DEL', 'TRANSPORTE', 'NORMATIVA PARA LA', 6, NULL),
(930, 'TRANSPORTES Y', 'DESARROLLO REGIONAL', 'ECONOMÍA DE LOS', 7, NULL),
(931, 'OPERACIÓN DEL', 'TRANSPORTE', 'SEGURIDAD Y', 8, NULL),
(932, 'Y SISTEMAS', 'GEOESPACIALES', 'INGENIERÍA PORTUARIA', 9, NULL),
(933, 'DE LA TORRE', 'ROMERO', 'ELIZABETH', 5, NULL),
(934, 'ABARCA', 'PÉREZ', 'EMILIO', 8, NULL),
(935, 'COLIN', NULL, 'JOSÉ LUIS', 10, NULL),
(936, 'INGENIERÍA ESTRUCTURAL FORMACI', 'TELEMÁTICA', 'COODINACIÓN DE', 2, NULL),
(937, 'MORENO', 'QUINTERO', 'ERIC', 5, NULL),
(938, 'ZAMORA', 'DOMINGUEZ', 'ALMA ROSA', 5, NULL),
(939, 'ARREDONDO', 'ORTIZ', 'RICARDO', 5, NULL),
(940, 'BORTONI', 'ANZURES', 'LIBORIO', 3, NULL),
(941, 'OROZCO', 'ESCOTO', 'RAÚL VICENTE', 1, NULL),
(942, 'MACEDO', 'RODRÍGUEZ', 'DAVID', 1, NULL),
(943, 'REYES', 'LLAMAS', 'VERÓNICA', 10, NULL),
(944, 'ANDRADE', 'ORTÍZ', 'LUIS MARTÍN', 1, NULL),
(945, 'GARCÍA', 'BARRIENTOS', 'RAYMUNDO JORGE', 7, NULL),
(946, 'ÁLVAREZ', 'SOL', 'MARCO ANTONIO', 2, NULL),
(947, 'MONTOYA', 'ZAMORA', 'RICARDO', 8, NULL),
(948, 'SOTO', 'ESPITIA', 'RAFAEL', 8, NULL),
(949, 'CALIDAD', NULL, 'COMITÉ DE', 10, NULL),
(950, 'GARAY', 'CABRERA', 'HORACIO', 1, NULL),
(951, 'CASTILLO', 'MÁRQUEZ', 'BEATRIZ', 3, NULL),
(952, 'MORADO', 'FLORES', 'JONNATHAN', 5, NULL),
(953, 'NIEVES', 'AGUILAR', 'LUZ JOSEFINA', 9, NULL),
(954, 'SOLIS', 'CASTAÑEDA', 'EMMA AID', 2, NULL),
(955, 'GUERRERO', 'CORRALES', 'ALEJANDRO CANEK', 7, NULL),
(956, 'PÉREZ', 'CARDENAS', 'CARLOS ERNESTO', 8, NULL),
(957, 'JARAMILLO', 'GARC', 'MARCO ANTONIO', 2, NULL),
(958, 'GÓMEZ', 'GÓMEZ', 'YESSICA BEATRIZ', 2, NULL),
(959, 'HERNÁNDEZ', 'GARC', 'ROGELIO', 2, NULL),
(960, 'MOTTA', 'CHÁVEZ', 'MAURICIO', 9, NULL),
(961, 'ESTRADA', 'CAMACHO', 'JUAN RAMÓN', 9, NULL),
(962, 'SERVIN', 'LUGO', 'MARÍA DOLORES', 1, NULL),
(963, 'CANCINO', 'SUÁREZ', 'LETICIA', 1, NULL),
(964, 'MENDOZA', 'SÁNCHEZ', 'JUAN FERNANDO', 4, NULL),
(965, 'COL', 'GUTIÉRREZ', 'JOSÉ LUIS', 10, NULL),
(966, 'CERVANTES', 'QUIROZ', 'T JESSIE', 2, NULL),
(967, 'MAGALLANES', 'GONZÁLEZ', 'ROBERTO', 6, NULL),
(968, 'PEREZ', 'PERALES', 'MAR', 2, NULL),
(969, 'TEMPORAL', 'POR AUDITORIA', 'CUENTA', 2, NULL),
(970, 'VERGARA', 'OCAMPO', 'VICTOR', 1, NULL),
(971, 'VELAZCO', 'HERNÁNDEZ', 'ARTURO', 6, NULL),
(972, 'RANGEL', NULL, 'LILIANA ROCIO', 6, NULL),
(973, 'ROJAS', 'MARTÍNEZ', 'LUIS ALONSO', 6, NULL),
(974, 'CANALES', 'ÁLVARO', 'MARIO ALBERTO', 6, NULL),
(975, 'RIVAS', 'GUTIÉRREZ', 'ARMANDO RAÚL', 11, NULL),
(976, 'PÉREZ', 'GONZÁLEZ', 'MARIO ANTONIO', 4, NULL),
(977, 'RAMÍREZ', 'PÉREZ', 'ÁNGEL', 9, NULL),
(978, 'CARDENAS', 'MALDONADO', 'JESÚS', 9, NULL),
(979, 'JIMÉNEZ', 'GÓMEZ', 'REN', 1, NULL),
(980, 'AMARA', 'ÁLVAREZ', 'VIVIAN', 1, NULL),
(981, 'AGUILAR', 'BUCIO', 'GRACIELA', 1, NULL),
(982, 'LARES', NULL, 'RENE', 2, NULL),
(983, 'ROJAS', 'QUIROZ', 'JOSÉ AUGUSTO', 2, NULL),
(984, 'CALLEJAS', 'MARTÍNEZ', 'THALIA BRISEIDA', 4, NULL),
(985, 'HERNANDEZ', 'GARCIA', 'ROGELIO', 4, NULL),
(986, 'MORALES', 'SORIA', 'JOSUE', 9, NULL),
(987, 'HERNÁNDEZ', 'LÓPEZ', 'MIGUEL ÁNGEL', 2, NULL),
(988, 'DEL VALLE', 'MORENO', 'KARLA LILIANA', 1, NULL),
(989, 'BARRIENTOS', 'VILLALOBOS', 'CLAUDIA', 1, NULL),
(990, 'BLAS', 'LÓPEZ', 'LILIANA MICHELLE', 9, NULL),
(991, 'MORENO', 'QUINTERO', 'MARGARITA', 4, NULL),
(992, 'TOLEDANO', 'VEGA', 'NOE FABRICIO', 9, NULL),
(993, 'MORALES', 'BAUTISTA', 'ELSA MARÍA', 9, NULL),
(994, 'MARTÍNEZ', 'AHUMADA', 'LUIS MAURICIO', 8, NULL),
(995, 'REYNOSO', 'LEÓN', 'EFRAÍN A.', 8, NULL),
(996, 'RENDÓN', 'VALDEZ', 'CAMILO', 9, NULL),
(997, 'GUTIÉRREZ', 'OCAMPO', 'MA. DEL PILAR', 1, NULL),
(998, 'BUCIO', 'SILVA', 'GABRIELA', 1, NULL),
(999, 'MAURICIO', 'ZEA', 'MARÍA GUADALUPE', 7, NULL),
(1000, 'ABREU', 'NAVAS', 'CARLOS ROBERTO', 1, NULL),
(1001, 'MONTOYA', 'ORTEGA', 'OLIVER', 1, NULL),
(1002, 'LÓPEZ', 'VALD', 'DIANA BERENICE', 4, NULL),
(1003, 'ORTIZ', 'CASTRO', 'JUAN JOS', 1, NULL),
(1004, 'LÓPEZ', 'DOMINGUEZ', 'MARÍA GUADALUPE', 4, NULL),
(1005, 'VERDUZCO', 'GUZM', 'GRACIELA', 1, NULL),
(1006, 'MENDOZA', 'FLORES', 'IVÁN IGNACIO', 1, NULL),
(1007, 'CARDENAS', 'VERGARA', 'SARA', 10, NULL),
(1008, 'GALICIA', 'VALENCIA', 'JOSÉ ALFONSO', 1, NULL),
(1009, 'GONZÁLEZ', 'GUZMÁN', 'GLORIA', 5, NULL),
(1010, 'DÍAZ DE LEÓN', 'BENARD', 'ABRAHAM', 3, NULL),
(1011, 'UGALDE', 'CHEHIN', 'JOSÉ CARLOS', 11, NULL),
(1012, 'GARCÍA', 'MONTERDE', 'JONATAN', 1, NULL),
(1013, 'ASCENCIO', 'LAGUNA', 'ALEJANDRO', 5, NULL),
(1014, 'LÓPEZ', 'OCHOA', 'ANA MARÍA', 9, NULL),
(1015, 'POLA', 'VELÁZQUEZ', 'JULIO COSME', 4, NULL),
(1016, 'MORENO', 'JIMENEZ', 'JOSÉ LUIS', 3, NULL),
(1017, NULL, NULL, 'INVITADO', 2, NULL),
(1018, 'PER', 'ORDAZ', 'JOS', 9, NULL),
(1019, 'EUROZA', 'ARIAS', 'NAHIELY', 1, NULL),
(1020, 'MORENO', 'JIMÉNEZ', 'JOSÉ LUIS', 3, NULL),
(1021, 'ASDF', 'SF', 'SAFD', 1, NULL),
(1022, 'CONTRERAS', 'OLVERA', 'ANDRES', 8, NULL),
(1023, 'BARRÓN', 'BASTIDA', 'MARISOL', 5, NULL),
(1024, 'CASAS', 'VALENCIA', 'CINDY', 9, NULL),
(1025, 'HUERTA', 'MERINO', 'JORGE', 5, NULL),
(1026, 'GONZÁLEZ', 'GUZM', 'SANTIAGO', 4, NULL),
(1027, 'MONTOYA', 'ORTEGA', 'MONSERRAT', 4, NULL),
(1028, 'IBARRA', 'GUTIÉRREZ', 'ROCIO', 1, NULL),
(1029, 'PORRES', ' LÓPEZ', 'ADRIANA GUADALUPE', 1, NULL),
(1030, 'FLORES', 'ÁLVAREZ', 'JUAN ESTEBAN', 9, NULL),
(1031, 'VARGAS', 'CARRILLO', 'PERLA JASIVY', 1, 'Sí'),
(1032, 'RUVALCABA', 'MARTÍNEZ', 'JUAN IGNACIO', 1, NULL),
(1033, 'CHAVARRIA', 'VEGA', 'JESUS MANUEL', 8, NULL),
(1034, 'FLORES', 'ALVAREZ', 'JUAN ESTEBAN', 9, NULL),
(1035, 'BALDERAS', 'DÁVILA', 'JOSUE IVAN', 8, NULL),
(1036, 'PÉREZ', 'MENDOZA', 'RODRIGO', 8, NULL),
(1037, 'RANGEL', 'RESÉNDIZ', 'JESÚS DANIEL', 4, NULL),
(1038, 'GÓMEZ', 'GONZÁLEZ', 'NADIA', 8, NULL),
(1039, 'CRESPO', 'SÁNCHEZ', 'SAUL ENRIQUE', 3, NULL),
(1040, 'RENDÓN', 'BELMONTE', 'MARIELA', 3, NULL),
(1041, 'VELASCO', 'HERNÁNDEZ', 'ARTURO', 6, NULL),
(1042, 'HERNÁNDEZ', 'BOTELLO', 'YADIRA', 8, NULL),
(1043, 'VÁSQUEZ', 'LÓPEZ', 'JUAN PEDRO', 9, NULL),
(1044, 'MONTES', 'ZEA', 'MARIO', 3, NULL),
(1045, 'MOCTEZUMA', 'NAVARRO', 'EDUARDO MACARIO', 7, NULL),
(1046, 'ACOSTA', 'URREA', 'HÉCTOR JESÚS', 1, NULL),
(1047, 'GARCÍA', 'ORTEGA', 'MARÍA GABRIELA', 5, NULL),
(1048, 'SAUCEDO', 'ROJAS', 'MA GUADALUPE', 8, NULL),
(1049, 'KLEIN', 'ARENAS', 'EDUARDO', 1, NULL),
(1050, 'HERNÁNDEZ', 'HERNÁNDEZ', 'YESICA', 1, NULL),
(1051, 'GUTIERRZ', 'SOLIS', 'ALEJANDRA', 1, NULL),
(1052, 'GUTIERREZ', 'SOLIS', 'ALEJANDRA', 1, NULL),
(1053, '', '', 'ARTURO', 10, NULL),
(1054, 'CABAZOS', '', 'ARTURO', 1, NULL),
(1055, 'MARTÍNEZ', 'CABALLERO', 'ARTURO', 1, NULL),
(1056, 'VÁZQUEZ', 'MORALES', 'BRENDA', 1, NULL),
(1057, 'ROMERO', 'GONZÁLEZ', 'LUIS FELIPE', 4, NULL),
(1058, 'BUSTAMANTE', 'CANO', 'ANA KAREN', 5, NULL),
(1059, 'GRANADOS', 'YANES', 'SOLEY', 1, NULL),
(1060, 'MIRANDA', 'NIETO', 'ALINE', 1, NULL),
(1061, 'PÉREZ', 'CASTRO', 'JAIME GILLERMO', 8, NULL),
(1062, 'GONZÁLEZ', 'GARCÍA', 'JOSÉ ALEJANDRO', 7, NULL),
(1063, 'CÁRCAMO', 'PEÑA', 'JANNET', 9, NULL),
(1064, 'AUZA', 'TAGLE', 'GRACIELA', 1, NULL),
(1065, 'ERAZO', 'GARCÍA CANO', 'JUAN JOSÉ', 1, NULL),
(1066, 'VELÁZQUEZ', 'ZORRILLA', 'DAVID', 11, NULL),
(1067, 'CALLEJA', 'MARTÍNEZ', 'GERARDO GABRIEL', 1, NULL),
(1068, 'DEVESA', 'VARAS', 'HECTOR DANIEL', 1, NULL),
(1069, 'RANGEL', '', 'CAROLINA', 1, NULL),
(1070, '', '', 'HECTOR BONILLA', 1, NULL),
(1071, 'OROZCO', '', 'RAUL', 1, NULL),
(1072, 'ANDRADE', '', 'LUIS', 1, NULL),
(1073, 'RAMIREZ', '', 'ABRAHAM', 1, NULL),
(1074, 'SERRANO', 'FLORES', 'ETELBERTO', 9, NULL),
(1075, 'SAN MARTÍN', 'ROMERO', 'JOSÉ', 1, NULL),
(1076, 'SEGURA', 'QUIROZ', 'DAVID HUMBERTO', 9, NULL),
(1077, 'SUÁREZ', 'EVANGELISTA', 'GONZALO ISAAC', 1, NULL),
(1078, 'SEGURA', 'QUIROZ', 'DAVID HUMBERTO', 9, NULL),
(1079, 'SUÁREZ', 'EVANGELISTA', 'GONZALO ISSAC', 1, NULL),
(1081, 'CORDERO', 'KINNEY', 'ELENIA', 1, NULL),
(1082, 'JIMÉNEZ', 'CASTILLO', 'JOCELYN', 5, NULL),
(1083, 'CEDILLO', 'CAMPOS', 'MIGUEL GASTÓN', 10, NULL),
(1084, 'MAURICIO', 'ZEA', 'MARY TERESA', 3, NULL),
(1085, 'RANGEL', 'LANUZA', 'LILIANA ROCÍO', 6, NULL),
(1086, 'RANGEL', 'LANUZA', 'ANA CAROLINA', 6, NULL),
(1087, 'JUÁREZ', 'MORALES', 'SELENE EMIRETH', 6, NULL),
(1088, 'CRUZ', 'GONZÁLEZ', 'GABRIELA', 7, NULL),
(1089, 'SALAZAR', 'CORTEZ', 'ARMANDO', 4, NULL),
(1090, 'GASCA', 'ZAMORA', 'HÉCTOR MIGUEL', 3, NULL),
(1091, 'DORADO', ' PINEDA', 'MARCO', 8, NULL),
(1092, 'CRUZ', 'CASTRO', 'OSCAR', 9, NULL),
(1093, 'LÓPEZ', ' ROSAS', 'MARIA DEL CARMEN', 9, NULL),
(1094, ' JIMÉNEZ', 'CASTILLO', 'JOCELYN', 5, NULL),
(1095, 'HERNÁNDEZ', 'IZAGUIRRE', 'ALMA LILIA', 1, NULL),
(1096, 'RODRÍGUEZ', 'NARANJO', 'DANIEL', 3, NULL),
(1097, 'TELEMÁTICA', '', 'DIVISION', 1, NULL),
(1098, 'SERRANO', 'SÁNCHEZ', 'ANGÉLICA', 10, NULL),
(1099, 'SÁNCHEZ', 'VELA', 'LUIS GERARDO', 3, NULL),
(1100, 'BUENO', 'SOLANO', 'ALFREDO', 5, NULL),
(1101, 'TREJO', 'TREJO', 'JOSÉADRIÁN TREJO', 4, NULL),
(1102, 'TREJO', 'TREJO', 'JOSÉ ADRIÁN', 4, NULL),
(1103, 'GALVEZ', 'MONTES', 'ABEL', 9, NULL),
(1104, 'ITURBE', 'EK', 'VICTOR MANUEL', 9, NULL),
(1105, 'CORONA', 'ALLARD', 'ANDREA GEORGINA', 1, NULL),
(1106, 'HERNANDEZ', 'FIGUEROA', 'JORGE ALBERTO', 3, NULL),
(1107, 'CERVANTES', 'AUSTRIA', 'MELISA', 10, NULL),
(1108, 'RIOS', 'QUEZADA', 'GERARDO', 8, NULL),
(1109, 'LEDEZMA', 'MUNGUÍA', 'SANDRA', 10, NULL),
(1110, 'ÁLVAREZ', 'ESTRADA ', 'FAVIOLA', 1, NULL),
(1111, 'FERNÁNDEZ ', 'RICO', 'JOSÉ ANTONIO', 11, NULL),
(1112, 'MÉNDEZ', 'VALDIVIA', 'ANWAR JESUS', 1, NULL),
(1113, 'ARROYO', 'OLVERA', 'MAURA', 3, NULL),
(1114, 'MARCOS ', 'PALOMARES', 'OMAR ALEJANDRO', 4, NULL),
(1115, 'HERNANDEZ', 'RODRIGUEZ', 'LIDIA ITZEL', 1, NULL),
(1116, 'MOLANO', 'CLEMENTE', 'MARTIN JONATHAN', 3, NULL),
(1117, 'SERRANO', 'DIAZ', 'GUSTAVO', 1, NULL),
(1118, 'BIAIS', 'HERNANDEZ', 'ISRAEL', 1, NULL),
(1119, 'MONTALVO', 'LÓPEZ     ', 'MARÍA GUADALUPE    ', 1, NULL),
(1120, 'CADENGO', 'RAMIREZ', 'MARIA', 8, NULL),
(1121, 'CASANOVA', 'ZAVALA', 'WENDY ALEJANDRA', 8, NULL),
(1122, 'CASTRO', 'MONDRAGON', 'FEREDICO', 4, NULL),
(1123, 'PIÑA', 'BARCENAS', 'JARED', 5, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_b_n_n_hardware`
--

CREATE TABLE IF NOT EXISTS `usuarios_b_n_n_hardware` (
  `id_usuario_bnn` int(11) DEFAULT NULL,
  `id_hard` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Esta tabla es la relacion n-n entre hardware y usuarios_b';

--
-- Volcado de datos para la tabla `usuarios_b_n_n_hardware`
--

INSERT INTO `usuarios_b_n_n_hardware` (`id_usuario_bnn`, `id_hard`) VALUES
(13, 38),
(13, 37),
(664, 38),
(1031, 39);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_tipos`
--

CREATE TABLE IF NOT EXISTS `usuarios_tipos` (
  `id_tipo_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `perfil` varchar(50) NOT NULL,
  PRIMARY KEY (`id_tipo_usuario`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Perfiles de roles de usuarios' AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `usuarios_tipos`
--

INSERT INTO `usuarios_tipos` (`id_tipo_usuario`, `perfil`) VALUES
(1, 'Administrador'),
(2, 'Administrador Software'),
(3, 'Administrador Hardware'),
(4, 'Administrador Consumibles'),
(5, 'Invitado'),
(6, 'Administrador Asignaciones');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `view_hardware_licencias`
--
CREATE TABLE IF NOT EXISTS `view_hardware_licencias` (
`id_hard` int(11)
,`id_usuario_b` int(11)
,`id_licencia` int(11)
,`id_software` int(11)
,`nombre_software` varchar(50)
,`version` varchar(50)
);
-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `view_hardware_reportes`
--
CREATE TABLE IF NOT EXISTS `view_hardware_reportes` (
`tipo` varchar(50)
,`modalidad` varchar(50)
,`marca` varchar(50)
,`modelo` varchar(50)
,`no_serie` varchar(50)
,`no_inventario` varchar(50)
,`usuario_r` varchar(92)
,`proveedor` varchar(50)
,`id_coordinacion` int(11)
,`coordinacion` varchar(60)
,`ubicacion` varchar(50)
);
-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `view_licencias_software`
--
CREATE TABLE IF NOT EXISTS `view_licencias_software` (
`id_licencia` int(11)
,`id_software` int(11)
,`nombre_software` varchar(50)
,`version` varchar(50)
,`referencia` varchar(50)
);
-- --------------------------------------------------------

--
-- Estructura para la vista `view_hardware_licencias`
--
DROP TABLE IF EXISTS `view_hardware_licencias`;

CREATE ALGORITHM=UNDEFINED DEFINER=`inventimt`@`localhost` SQL SECURITY DEFINER VIEW `view_hardware_licencias` AS select `h`.`id_hard` AS `id_hard`,`h`.`id_usuario_b` AS `id_usuario_b`,`vls`.`id_licencia` AS `id_licencia`,`vls`.`id_software` AS `id_software`,`vls`.`nombre_software` AS `nombre_software`,`vls`.`version` AS `version` from ((`view_licencias_software` `vls` join `licencias_usuarios_b_n_n` `lunn` on((`vls`.`id_licencia` = `lunn`.`id_licencia`))) left join `hardware` `h` on((`lunn`.`id_usuario_b` = `h`.`id_usuario_b`)));

-- --------------------------------------------------------

--
-- Estructura para la vista `view_hardware_reportes`
--
DROP TABLE IF EXISTS `view_hardware_reportes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`inventimt`@`localhost` SQL SECURITY DEFINER VIEW `view_hardware_reportes` AS select `hth`.`nombre_tipo` AS `tipo`,`hm`.`nombre_mod` AS `modalidad`,`h`.`marca` AS `marca`,`h`.`modelo` AS `modelo`,`h`.`no_serie` AS `no_serie`,`h`.`no_inventario` AS `no_inventario`,concat(`ub`.`ape_paterno`,' ',`ub`.`ape_materno`,' ',`ub`.`nombres`) AS `usuario_r`,`h`.`proveedor` AS `proveedor`,`c`.`id_coordinacion` AS `id_coordinacion`,`c`.`nombre_coordinacion` AS `coordinacion`,`h`.`ubicacion` AS `ubicacion` from ((((`hardware` `h` join `hardware_modalidad` `hm` on((`h`.`id_mod` = `hm`.`id_mod`))) join `hardware_tipos_hardware` `hth` on((`h`.`id_tipo_hardware` = `hth`.`id_tipo_hardware`))) join `coordinacion` `c` on((`h`.`id_coordinacion` = `c`.`id_coordinacion`))) join `usuarios_b` `ub` on((`h`.`id_usuario_b` = `ub`.`id_usuario_b`)));

-- --------------------------------------------------------

--
-- Estructura para la vista `view_licencias_software`
--
DROP TABLE IF EXISTS `view_licencias_software`;

CREATE ALGORITHM=UNDEFINED DEFINER=`inventimt`@`localhost` SQL SECURITY DEFINER VIEW `view_licencias_software` AS select `licencias`.`id_licencia` AS `id_licencia`,`licencias`.`id_software` AS `id_software`,`software`.`nombre_software` AS `nombre_software`,`licencias`.`version` AS `version`,`licencias`.`referencia` AS `referencia` from (`software` left join `licencias` on((`licencias`.`id_software` = `software`.`id_software`))) where (`licencias`.`id_licencia` is not null);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `compras_proveedores` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tcomras_tdivisas` FOREIGN KEY (`id_divisa`) REFERENCES `compras_divisas` (`id_divisa`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `hardware`
--
ALTER TABLE `hardware`
  ADD CONSTRAINT `hardware_coordinacion` FOREIGN KEY (`id_coordinacion`) REFERENCES `coordinacion` (`id_coordinacion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `hardware_modalidad` FOREIGN KEY (`id_mod`) REFERENCES `hardware_modalidad` (`id_mod`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `harware_usuarios_b_asignados` FOREIGN KEY (`id_usuario_b`) REFERENCES `usuarios_b` (`id_usuario_b`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `thardware__thardware_tipos_hardware` FOREIGN KEY (`id_tipo_hardware`) REFERENCES `hardware_tipos_hardware` (`id_tipo_hardware`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `licencias`
--
ALTER TABLE `licencias`
  ADD CONSTRAINT `licencias_esquema_licenciamiento` FOREIGN KEY (`id_esquema_licenciamiento`) REFERENCES `licencias_esquema_licenciamiento` (`id_esquema_licenciamiento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `licencias_licencias_tipos` FOREIGN KEY (`id_tipo_licencia`) REFERENCES `licencias_tipos` (`id_tipo_licencia`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `software_licencias` FOREIGN KEY (`id_software`) REFERENCES `software` (`id_software`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `licencias_hardware_n_n`
--
ALTER TABLE `licencias_hardware_n_n`
  ADD CONSTRAINT ` licencias_hardware_n_n_hardware` FOREIGN KEY (`id_hard`) REFERENCES `hardware` (`id_hard`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT ` licencias_hardware_n_n_licencias` FOREIGN KEY (`id_licencia`) REFERENCES `licencias` (`id_licencia`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Filtros para la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD CONSTRAINT `proveedor_estado_federal` FOREIGN KEY (`id_estado`) REFERENCES `estados_federales` (`id_estado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tproveedor_tproveedor_tipos` FOREIGN KEY (`id_tipo_proveedor`) REFERENCES `proveedor_tipos` (`id_tipo_proveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `software`
--
ALTER TABLE `software`
  ADD CONSTRAINT `software_fabricante` FOREIGN KEY (`id_fabricante`) REFERENCES `soft_fabricante` (`id_fabricante`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tsoftware_tcategoria` FOREIGN KEY (`id_categoria`) REFERENCES `soft_categoria` (`id_categoria`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuario_tipo` FOREIGN KEY (`id_tipo_usuario`) REFERENCES `usuarios_tipos` (`id_tipo_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuarios_b`
--
ALTER TABLE `usuarios_b`
  ADD CONSTRAINT `usuarios_b_coordinacion` FOREIGN KEY (`id_coordinacion`) REFERENCES `coordinacion` (`id_coordinacion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
