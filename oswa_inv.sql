-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-09-2019 a las 07:22:16
-- Versión del servidor: 10.1.38-MariaDB
-- Versión de PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `oswa_inv`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(60) NOT NULL,
  `ShortName` varchar(20) NOT NULL,
  `Numbe` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id`, `name`, `ShortName`, `Numbe`) VALUES
(1, 'IMPLEMENTO DE SEGURIDAD', 'EPP', 12),
(2, 'MATERIAL DE LIMPIEZA', 'MLI', 13),
(3, 'EQUIPO DE COMPUTO', 'ECO', 14),
(4, 'MATERIAL DE CONSTRUCCION', 'MCO', 15),
(5, 'REPUESTOS MECANICOS', 'REPM', 16),
(6, 'MUEBLES', 'MBL', 17),
(7, 'UTILES DE ESCRITORIO', 'UES', 18),
(8, 'HERRAMIENTAS', 'HER', 19),
(9, 'COMBUSTIBLE', 'CMB', 20),
(10, 'MADERA', 'MAD', 21),
(11, 'ACEITE HIDRAULICO', 'HID', 22),
(12, 'ACTIVO FIJO', 'AF', 23),
(13, 'REPUESTOS ELECTRICOS', 'RELE', 24),
(14, 'HERRAMIENTAS DE GESTION', 'FORMATOS', 25),
(15, 'NEUMATICO', 'LLANTA', 26),
(16, 'MATERIAL PELIGROSO', 'MATPEL', 27),
(19, 'ABARROTES', 'ALIMENTO', 28),
(20, 'IMPLEMENTO DEPORTIVO', 'DEPORTE', 29),
(21, 'FERRETERIA', 'FERRETERIA', 30);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ceco`
--

CREATE TABLE `ceco` (
  `id` int(11) UNSIGNED NOT NULL,
  `codigo` varchar(15) NOT NULL,
  `Description` varchar(200) NOT NULL,
  `ShortName` varchar(200) NOT NULL,
  `DateRegistro` date NOT NULL,
  `DateInicio` date NOT NULL,
  `DateFin` date NOT NULL,
  `Contrato` varchar(100) NOT NULL,
  `Region` varchar(50) NOT NULL,
  `Distrito` varchar(50) NOT NULL,
  `reference` varchar(100) NOT NULL,
  `rubro` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ceco`
--

INSERT INTO `ceco` (`id`, `codigo`, `Description`, `ShortName`, `DateRegistro`, `DateInicio`, `DateFin`, `Contrato`, `Region`, `Distrito`, `reference`, `rubro`, `status`) VALUES
(1, '7000104', 'Canal de coronaciÃ³n unidad minera el provenir NEXA ROSOURCES', 'Canal de coronaciÃ³n tramo II', '2019-08-04', '2019-03-15', '2019-12-15', 'en proceso', 'Cerro de Pasco', 'SFA de Yarusyacan', 'San Juan de Milpo - Tingo Vado', 'Construccion', 1),
(10, '5000101', 'Medio ambiente unidad minera el porvenir NEXA RESOURCES', 'Medio ambiente', '2018-04-05', '2018-04-05', '2020-04-05', 'En revision', 'Cerro de Pasco', 'SFA de Yarusyacan', 'San Juan de Milpo - Nexa', 'Intermediacion laboral', 1),
(11, '5000143', 'ConstrucciÃ³n de pistas y veredas en san juan de milpo - obras por impuestos', 'Pistas y veredas', '0000-00-00', '0000-00-00', '0000-00-00', 'Anulado', 'Cerro de Pasco', 'SFA de Yarusyacan', 'San Juan de Milpo', 'Construccion', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contract`
--

CREATE TABLE `contract` (
  `id` int(11) UNSIGNED NOT NULL,
  `TypeContract` int(11) UNSIGNED NOT NULL,
  `Person` int(11) UNSIGNED DEFAULT NULL,
  `Provider` int(11) UNSIGNED DEFAULT NULL,
  `NumberContract` int(11) NOT NULL,
  `Organization` int(11) UNSIGNED NOT NULL,
  `DateBegin` int(11) NOT NULL,
  `DateFinish` int(11) NOT NULL,
  `SubCeco` int(10) UNSIGNED NOT NULL,
  `Montly` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departament`
--

CREATE TABLE `departament` (
  `id` int(11) UNSIGNED NOT NULL,
  `Name` varchar(50) NOT NULL,
  `DateCreation` date NOT NULL,
  `Organization` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `departament`
--

INSERT INTO `departament` (`id`, `Name`, `DateCreation`, `Organization`) VALUES
(1, 'ADMINISTRACION', '2019-08-04', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detailrq`
--

CREATE TABLE `detailrq` (
  `id` int(10) UNSIGNED NOT NULL,
  `RQ` int(10) UNSIGNED NOT NULL,
  `Products` int(10) UNSIGNED NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Enable1` varchar(100) DEFAULT NULL,
  `Enable2` varchar(100) DEFAULT NULL,
  `Enable3` varchar(100) DEFAULT NULL,
  `Enable4` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detailrq`
--

INSERT INTO `detailrq` (`id`, `RQ`, `Products`, `Quantity`, `Enable1`, `Enable2`, `Enable3`, `Enable4`) VALUES
(1, 1, 35, 3, '', '', '', ''),
(10, 139, 37, 2, NULL, NULL, NULL, NULL),
(11, 148, 37, 2, NULL, NULL, NULL, NULL),
(21, 148, 39, 2, NULL, NULL, NULL, NULL),
(22, 148, 37, 3, NULL, NULL, NULL, NULL),
(23, 150, 39, 12, NULL, NULL, NULL, NULL),
(24, 150, 39, 12, NULL, NULL, NULL, NULL),
(25, 150, 39, 12, NULL, NULL, NULL, NULL),
(26, 150, 37, 12, NULL, NULL, NULL, NULL),
(27, 150, 37, 12, NULL, NULL, NULL, NULL),
(28, 150, 37, 12, NULL, NULL, NULL, NULL),
(29, 150, 37, 12, NULL, NULL, NULL, NULL),
(30, 150, 37, 65, NULL, NULL, NULL, NULL),
(31, 150, 37, 65, NULL, NULL, NULL, NULL),
(32, 150, 37, 65, NULL, NULL, NULL, NULL),
(33, 150, 37, 65, NULL, NULL, NULL, NULL),
(34, 150, 37, 65, NULL, NULL, NULL, NULL),
(35, 150, 37, 65, NULL, NULL, NULL, NULL),
(36, 150, 37, 65, NULL, NULL, NULL, NULL),
(37, 150, 37, 65, NULL, NULL, NULL, NULL),
(38, 151, 36, 150, NULL, NULL, NULL, NULL),
(39, 151, 41, 45, NULL, NULL, NULL, NULL),
(40, 151, 41, 10, NULL, NULL, NULL, NULL),
(41, 151, 36, 850, NULL, NULL, NULL, NULL),
(42, 152, 36, 1, NULL, NULL, NULL, NULL),
(43, 152, 41, 2, NULL, NULL, NULL, NULL),
(44, 153, 37, 12, NULL, NULL, NULL, NULL),
(45, 153, 39, 12, NULL, NULL, NULL, NULL),
(46, 154, 36, 1, NULL, NULL, NULL, NULL),
(47, 154, 41, 2, NULL, NULL, NULL, NULL),
(48, 155, 37, 12, NULL, NULL, NULL, NULL),
(49, 155, 39, 45, NULL, NULL, NULL, NULL),
(50, 156, 37, 12, NULL, NULL, NULL, NULL),
(51, 157, 37, 12, NULL, NULL, NULL, NULL),
(52, 158, 37, 1, NULL, NULL, NULL, NULL),
(53, 159, 36, 1, NULL, NULL, NULL, NULL),
(54, 160, 37, 2, NULL, NULL, NULL, NULL),
(55, 160, 39, 4, NULL, NULL, NULL, NULL),
(56, 160, 39, 4, NULL, NULL, NULL, NULL),
(57, 160, 37, 3, NULL, NULL, NULL, NULL),
(58, 160, 37, 3, NULL, NULL, NULL, NULL),
(59, 161, 40, 5, NULL, NULL, NULL, NULL),
(60, 161, 40, 6, NULL, NULL, NULL, NULL),
(61, 162, 36, 15, NULL, NULL, NULL, NULL),
(62, 162, 41, 50, NULL, NULL, NULL, NULL),
(63, 162, 41, 50, NULL, NULL, NULL, NULL),
(64, 163, 36, 23, NULL, NULL, NULL, NULL),
(65, 163, 36, 23, NULL, NULL, NULL, NULL),
(66, 163, 36, 23, NULL, NULL, NULL, NULL),
(67, 163, 36, 23, NULL, NULL, NULL, NULL),
(68, 163, 36, 23, NULL, NULL, NULL, NULL),
(69, 163, 36, 23, NULL, NULL, NULL, NULL),
(70, 163, 36, 23, NULL, NULL, NULL, NULL),
(71, 163, 36, 23, NULL, NULL, NULL, NULL),
(72, 163, 36, 23, NULL, NULL, NULL, NULL),
(73, 163, 36, 23, NULL, NULL, NULL, NULL),
(74, 163, 36, 23, NULL, NULL, NULL, NULL),
(75, 163, 36, 23, NULL, NULL, NULL, NULL),
(76, 163, 36, 23, NULL, NULL, NULL, NULL),
(77, 163, 36, 23, NULL, NULL, NULL, NULL),
(78, 163, 36, 23, NULL, NULL, NULL, NULL),
(79, 163, 36, 23, NULL, NULL, NULL, NULL),
(80, 163, 36, 23, NULL, NULL, NULL, NULL),
(81, 163, 36, 23, NULL, NULL, NULL, NULL),
(82, 163, 36, 23, NULL, NULL, NULL, NULL),
(83, 163, 36, 23, NULL, NULL, NULL, NULL),
(84, 163, 36, 23, NULL, NULL, NULL, NULL),
(85, 163, 36, 23, NULL, NULL, NULL, NULL),
(86, 163, 36, 23, NULL, NULL, NULL, NULL),
(87, 163, 36, 23, NULL, NULL, NULL, NULL),
(88, 163, 36, 23, NULL, NULL, NULL, NULL),
(89, 163, 36, 23, NULL, NULL, NULL, NULL),
(90, 163, 36, 23, NULL, NULL, NULL, NULL),
(91, 163, 36, 23, NULL, NULL, NULL, NULL),
(92, 163, 36, 23, NULL, NULL, NULL, NULL),
(93, 164, 36, 2, NULL, NULL, NULL, NULL),
(94, 164, 36, 2, NULL, NULL, NULL, NULL),
(95, 164, 36, 2, NULL, NULL, NULL, NULL),
(96, 164, 36, 2, NULL, NULL, NULL, NULL),
(97, 164, 36, 2, NULL, NULL, NULL, NULL),
(98, 164, 36, 2, NULL, NULL, NULL, NULL),
(99, 164, 36, 2, NULL, NULL, NULL, NULL),
(100, 164, 36, 2, NULL, NULL, NULL, NULL),
(101, 164, 36, 2, NULL, NULL, NULL, NULL),
(102, 164, 36, 2, NULL, NULL, NULL, NULL),
(103, 164, 36, 2, NULL, NULL, NULL, NULL),
(104, 164, 36, 2, NULL, NULL, NULL, NULL),
(105, 164, 36, 2, NULL, NULL, NULL, NULL),
(106, 164, 36, 2, NULL, NULL, NULL, NULL),
(107, 164, 36, 2, NULL, NULL, NULL, NULL),
(108, 164, 36, 2, NULL, NULL, NULL, NULL),
(109, 164, 36, 2, NULL, NULL, NULL, NULL),
(110, 164, 36, 2, NULL, NULL, NULL, NULL),
(111, 164, 36, 2, NULL, NULL, NULL, NULL),
(112, 164, 36, 2, NULL, NULL, NULL, NULL),
(113, 164, 36, 2, NULL, NULL, NULL, NULL),
(114, 164, 36, 2, NULL, NULL, NULL, NULL),
(115, 164, 36, 2, NULL, NULL, NULL, NULL),
(116, 164, 36, 2, NULL, NULL, NULL, NULL),
(117, 164, 36, 2, NULL, NULL, NULL, NULL),
(118, 164, 36, 2, NULL, NULL, NULL, NULL),
(119, 164, 36, 2, NULL, NULL, NULL, NULL),
(120, 164, 36, 2, NULL, NULL, NULL, NULL),
(121, 164, 36, 2, NULL, NULL, NULL, NULL),
(122, 164, 36, 2, NULL, NULL, NULL, NULL),
(123, 164, 36, 2, NULL, NULL, NULL, NULL),
(124, 164, 36, 2, NULL, NULL, NULL, NULL),
(125, 164, 36, 2, NULL, NULL, NULL, NULL),
(126, 164, 36, 2, NULL, NULL, NULL, NULL),
(127, 164, 36, 2, NULL, NULL, NULL, NULL),
(128, 164, 36, 2, NULL, NULL, NULL, NULL),
(129, 164, 36, 2, NULL, NULL, NULL, NULL),
(130, 164, 36, 2, NULL, NULL, NULL, NULL),
(131, 164, 36, 2, NULL, NULL, NULL, NULL),
(132, 164, 36, 2, NULL, NULL, NULL, NULL),
(133, 164, 36, 2, NULL, NULL, NULL, NULL),
(134, 164, 36, 2, NULL, NULL, NULL, NULL),
(135, 164, 36, 2, NULL, NULL, NULL, NULL),
(136, 164, 36, 2, NULL, NULL, NULL, NULL),
(137, 164, 36, 2, NULL, NULL, NULL, NULL),
(138, 164, 36, 2, NULL, NULL, NULL, NULL),
(139, 164, 36, 2, NULL, NULL, NULL, NULL),
(140, 164, 36, 2, NULL, NULL, NULL, NULL),
(141, 164, 36, 2, NULL, NULL, NULL, NULL),
(142, 164, 36, 2, NULL, NULL, NULL, NULL),
(143, 164, 36, 2, NULL, NULL, NULL, NULL),
(144, 164, 36, 2, NULL, NULL, NULL, NULL),
(145, 164, 36, 2, NULL, NULL, NULL, NULL),
(146, 164, 36, 2, NULL, NULL, NULL, NULL),
(147, 164, 36, 2, NULL, NULL, NULL, NULL),
(148, 164, 36, 2, NULL, NULL, NULL, NULL),
(149, 164, 36, 2, NULL, NULL, NULL, NULL),
(150, 164, 36, 2, NULL, NULL, NULL, NULL),
(151, 164, 36, 2, NULL, NULL, NULL, NULL),
(152, 164, 36, 2, NULL, NULL, NULL, NULL),
(153, 164, 36, 2, NULL, NULL, NULL, NULL),
(154, 165, 36, 12, NULL, NULL, NULL, NULL),
(155, 166, 36, 1, NULL, NULL, NULL, NULL),
(156, 167, 36, 2, NULL, NULL, NULL, NULL),
(157, 168, 36, 2, NULL, NULL, NULL, NULL),
(158, 169, 37, 1, NULL, NULL, NULL, NULL),
(159, 169, 39, 5, NULL, NULL, NULL, NULL),
(160, 170, 36, 3, NULL, NULL, NULL, NULL),
(161, 170, 41, 4, NULL, NULL, NULL, NULL),
(162, 171, 36, 5, NULL, NULL, NULL, NULL),
(163, 172, 36, 4, NULL, NULL, NULL, NULL),
(164, 173, 36, 4, NULL, NULL, NULL, NULL),
(165, 174, 36, 3, NULL, NULL, NULL, NULL),
(166, 175, 36, 4, NULL, NULL, NULL, NULL),
(167, 176, 36, 2, NULL, NULL, NULL, NULL),
(168, 177, 36, 4, NULL, NULL, NULL, NULL),
(169, 178, 37, 5, NULL, NULL, NULL, NULL),
(170, 179, 36, 5, NULL, NULL, NULL, NULL),
(171, 180, 36, 4, NULL, NULL, NULL, NULL),
(172, 180, 41, 5, NULL, NULL, NULL, NULL),
(173, 181, 36, 200, NULL, NULL, NULL, NULL),
(174, 181, 41, 300, NULL, NULL, NULL, NULL),
(175, 182, 36, 3, NULL, NULL, NULL, NULL),
(176, 182, 41, 5, NULL, NULL, NULL, NULL),
(177, 182, 41, 5, NULL, NULL, NULL, NULL),
(178, 183, 36, 3, NULL, NULL, NULL, NULL),
(179, 183, 41, 6, NULL, NULL, NULL, NULL),
(180, 183, 41, 10, NULL, NULL, NULL, NULL),
(181, 184, 42, 30, NULL, NULL, NULL, NULL),
(182, 185, 261, 800, NULL, NULL, NULL, NULL),
(183, 185, 263, 2, NULL, NULL, NULL, NULL),
(184, 188, 69, 15, NULL, NULL, NULL, NULL),
(185, 188, 70, 15, NULL, NULL, NULL, NULL),
(186, 188, 71, 15, NULL, NULL, NULL, NULL),
(187, 188, 72, 10, NULL, NULL, NULL, NULL),
(188, 188, 73, 5, NULL, NULL, NULL, NULL),
(189, 188, 49, 2, NULL, NULL, NULL, NULL),
(190, 188, 50, 10, NULL, NULL, NULL, NULL),
(191, 188, 51, 15, NULL, NULL, NULL, NULL),
(192, 188, 52, 5, NULL, NULL, NULL, NULL),
(193, 188, 53, 3, NULL, NULL, NULL, NULL),
(194, 193, 36, 100, NULL, NULL, NULL, NULL),
(195, 193, 41, 50, NULL, NULL, NULL, NULL),
(196, 194, 40, 1, NULL, NULL, NULL, NULL),
(197, 194, 40, 2, NULL, NULL, NULL, NULL),
(198, 194, 40, 3, NULL, NULL, NULL, NULL),
(199, 195, 36, 12, NULL, NULL, NULL, NULL),
(200, 195, 41, 90, NULL, NULL, NULL, NULL),
(201, 195, 42, 60, NULL, NULL, NULL, NULL),
(202, 196, 43, 10, NULL, NULL, NULL, NULL),
(203, 197, 38, 12, NULL, NULL, NULL, NULL),
(204, 198, 43, 12, NULL, NULL, NULL, NULL),
(205, 199, 38, 1, NULL, NULL, NULL, NULL),
(206, 199, 43, 10, NULL, NULL, NULL, NULL),
(207, 200, 43, 10, NULL, NULL, NULL, NULL),
(211, 201, 38, 1, NULL, NULL, NULL, NULL),
(212, 201, 43, 5, NULL, NULL, NULL, NULL),
(216, 202, 44, 10, NULL, NULL, NULL, NULL),
(217, 202, 45, 3, NULL, NULL, NULL, NULL),
(218, 203, 38, 12, NULL, NULL, NULL, NULL),
(224, 205, 39, 8, NULL, NULL, NULL, NULL),
(225, 205, 37, 22, NULL, NULL, NULL, NULL),
(227, 207, 136, 1, NULL, NULL, NULL, NULL),
(228, 207, 179, 23, NULL, NULL, NULL, NULL),
(229, 207, 99, 23, NULL, NULL, NULL, NULL),
(230, 207, 112, 23, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `measure`
--

CREATE TABLE `measure` (
  `id` int(11) UNSIGNED NOT NULL,
  `NameMedida` varchar(50) NOT NULL,
  `ShortName` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `measure`
--

INSERT INTO `measure` (`id`, `NameMedida`, `ShortName`) VALUES
(1, 'KILOGRAMOS', 'KG'),
(2, 'GRAMOS', 'GR'),
(3, 'MILIGRAMOS', 'MGR'),
(4, 'TONELADAS', 'TN'),
(5, 'LITROS', 'LTR'),
(6, 'MILILITROS', 'MLT'),
(7, 'GALONES', 'GL'),
(8, 'METROS', 'MTR'),
(9, 'CENTRIMETROS', 'CM'),
(10, 'KILOMETROS', 'KM'),
(11, 'PAQUETES', 'PQT'),
(12, 'CAJAS', 'CJS'),
(13, 'UNIDADES', 'UND'),
(14, 'JUEGOS', 'JGO'),
(15, 'METROS CUBICOS', 'M3'),
(16, 'DOCENA', 'DOC'),
(18, 'MILLAR', 'MIL'),
(20, 'PARES', 'PAR'),
(22, 'PIE', 'PIE'),
(23, 'PULGADA', 'PLG'),
(24, 'BOLSAS', 'BLS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `media`
--

CREATE TABLE `media` (
  `id` int(11) UNSIGNED NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_type` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `media`
--

INSERT INTO `media` (`id`, `file_name`, `file_type`) VALUES
(1, 'filter.jpg', 'image/jpeg'),
(3, 'protect.png', 'image/png'),
(6, 'img.png', 'image/png'),
(7, '001-bloquear.png', 'image/png'),
(8, 'pelota-umbro.jpg', 'image/jpeg'),
(9, 'audifono_orejera.jpg', 'image/jpeg'),
(10, 'parlante_snoopy.jpg', 'image/jpeg'),
(11, 'fierro_corrugado.jpg', 'image/jpeg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `money`
--

CREATE TABLE `money` (
  `id` int(10) UNSIGNED NOT NULL,
  `moneda` varchar(30) NOT NULL,
  `simbolo` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `money`
--

INSERT INTO `money` (`id`, `moneda`, `simbolo`) VALUES
(1, 'SOLES PEN', 'S/.'),
(2, 'DOLARES AMERICANOS', '$'),
(3, 'EUROS', 'e');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `organization`
--

CREATE TABLE `organization` (
  `id` int(10) UNSIGNED NOT NULL,
  `Ruc` varchar(11) NOT NULL,
  `RazonSocial` varchar(200) NOT NULL,
  `Direction` varchar(200) NOT NULL,
  `Representante` int(11) UNSIGNED NOT NULL,
  `DateCreation` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `organization`
--

INSERT INTO `organization` (`id`, `Ruc`, `RazonSocial`, `Direction`, `Representante`, `DateCreation`) VALUES
(1, '20542579375', 'SERVICIOS MULTIPLES SAN JUAN DE MILPO S.A.', 'PLAZA PRINCIPAL SIN NUMERO ANEXO SAN JUAN DE MILPO', 3, '2019-08-04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persons`
--

CREATE TABLE `persons` (
  `id` int(10) UNSIGNED NOT NULL,
  `Codigo` varchar(15) NOT NULL,
  `Names` varchar(50) NOT NULL,
  `Apellidos` varchar(50) NOT NULL,
  `BirthDate` datetime NOT NULL,
  `Position` int(11) UNSIGNED NOT NULL,
  `TypeWorker` int(11) UNSIGNED NOT NULL,
  `Address` varchar(150) NOT NULL,
  `NumberDNI` int(8) NOT NULL,
  `CivilStatus` varchar(15) NOT NULL,
  `Photo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `persons`
--

INSERT INTO `persons` (`id`, `Codigo`, `Names`, `Apellidos`, `BirthDate`, `Position`, `TypeWorker`, `Address`, `NumberDNI`, `CivilStatus`, `Photo`) VALUES
(3, '45957467', 'yhonatan walter', 'quispe urzua', '0000-00-00 00:00:00', 1, 1, 'BARRIO SANTA ROSA S/N ANEXO SAN JUAN DE MILPO', 45957467, 'soltero', 'no hay foto'),
(4, '45957468', 'Nsermul2 ', 'Asermul2', '0000-00-00 00:00:00', 2, 1, 'BARRIO SANTA ROSA S/N ANEXO SAN JUAN DE MILPO', 45957468, 'casado', 'no hay foto'),
(5, '45957468', 'sermul2 ', 'sermul2', '0000-00-00 00:00:00', 2, 1, 'BARRIO SANTA ROSA S/N ANEXO SAN JUAN DE MILPO', 45957468, 'casado', 'no hay foto');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `position`
--

CREATE TABLE `position` (
  `id` int(10) UNSIGNED NOT NULL,
  `NamePosition` varchar(150) NOT NULL,
  `Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `position`
--

INSERT INTO `position` (`id`, `NamePosition`, `Date`) VALUES
(1, 'Presidente de directorio', '2019-08-03'),
(2, 'gerente general', '2019-08-03');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `price`
--

CREATE TABLE `price` (
  `id` int(11) UNSIGNED NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `date_price` date NOT NULL,
  `producto_id` int(11) UNSIGNED NOT NULL,
  `money` int(10) UNSIGNED NOT NULL,
  `tipo_cambio` int(10) UNSIGNED DEFAULT NULL,
  `Provider` int(11) UNSIGNED NOT NULL,
  `status` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `price`
--

INSERT INTO `price` (`id`, `price`, `date_price`, `producto_id`, `money`, `tipo_cambio`, `Provider`, `status`) VALUES
(1, '12.00', '2019-08-06', 35, 1, 20, 1, 0),
(2, '15.00', '2019-08-15', 34, 1, 18, 1, 0),
(3, '57.00', '2019-08-15', 35, 2, 17, 1, 0),
(17, '15.00', '2019-08-15', 34, 1, 18, 1, 0),
(19, '27.50', '2019-08-15', 35, 2, 17, 1, 0),
(20, '48.20', '2019-08-15', 35, 2, 17, 1, 0),
(21, '49.20', '2019-08-15', 35, 2, 17, 1, 0),
(22, '100.00', '2019-08-15', 35, 2, 17, 1, 0),
(23, '150.00', '2019-08-15', 34, 1, 18, 1, 0),
(24, '270.00', '2019-08-15', 35, 1, 17, 1, 0),
(25, '10.00', '2019-08-15', 34, 1, 18, 1, 0),
(26, '20.39', '2019-08-15', 34, 1, 18, 1, 0),
(27, '20.59', '2019-08-15', 34, 1, 18, 1, 0),
(28, '90.00', '2019-08-25', 35, 1, NULL, 1, 0),
(29, '80.00', '2019-08-25', 36, 1, NULL, 1, 0),
(34, '15.00', '2019-08-26', 36, 1, NULL, 1, 0),
(35, '55.00', '2019-08-25', 35, 1, NULL, 1, 0),
(36, '80.50', '2019-08-25', 35, 1, NULL, 1, 0),
(37, '80.50', '2019-08-25', 35, 1, NULL, 1, 0),
(38, '80.50', '2019-08-25', 35, 1, NULL, 1, 0),
(40, '23.00', '2019-08-11', 34, 1, NULL, 1, 0),
(41, '23.00', '2019-08-18', 34, 1, NULL, 1, 0),
(42, '25.00', '2019-08-25', 37, 2, NULL, 1, 0),
(43, '80.00', '2019-08-11', 37, 1, NULL, 1, 0),
(44, '23.00', '2019-08-26', 37, 2, NULL, 1, 0),
(45, '32.00', '2019-08-25', 34, 1, NULL, 1, 0),
(46, '23.00', '2019-08-12', 36, 2, NULL, 1, 0),
(47, '80.00', '2019-08-12', 34, 1, NULL, 1, 0),
(48, '23.00', '2019-08-26', 35, 1, NULL, 1, 0),
(49, '80.00', '2019-08-05', 35, 1, NULL, 1, 0),
(50, '80.00', '2019-08-12', 37, 2, NULL, 1, 0),
(51, '23.00', '2019-08-05', 34, 1, NULL, 1, 0),
(52, '60.00', '2019-08-04', 34, 1, NULL, 1, 0),
(53, '23.00', '2019-08-12', 37, 1, NULL, 1, 0),
(55, '80.00', '2019-08-31', 36, 1, NULL, 1, 0),
(56, '60.00', '2019-08-12', 34, 1, NULL, 1, 0),
(57, '50.29', '2019-08-26', 38, 1, NULL, 1, 0),
(58, '80.00', '2019-08-12', 38, 1, NULL, 1, 0),
(59, '21.00', '2019-08-19', 38, 3, NULL, 1, 0),
(60, '23.00', '2019-08-26', 34, 3, NULL, 1, 0),
(61, '23.00', '0000-00-00', 35, 3, NULL, 1, 0),
(62, '23.00', '2019-08-26', 36, 3, NULL, 1, 0),
(63, '23.00', '0000-00-00', 36, 3, NULL, 1, 0),
(64, '23.00', '2019-08-26', 37, 3, NULL, 1, 0),
(65, '45.00', '0000-00-00', 38, 1, NULL, 1, 0),
(66, '250.00', '2019-08-26', 34, 1, NULL, 1, 0),
(67, '14.20', '2019-08-26', 35, 1, NULL, 1, 0),
(68, '14.20', '2019-08-19', 38, 2, NULL, 1, 0),
(69, '45.00', '2019-08-26', 34, 1, NULL, 1, 0),
(70, '11.50', '2019-08-27', 38, 1, NULL, 1, 0),
(71, '12.03', '2019-08-27', 38, 1, NULL, 1, 0),
(72, '15.26', '0000-00-00', 38, 1, NULL, 1, 0),
(73, '10.99', '2019-08-28', 38, 2, NULL, 1, 0),
(74, '25.30', '2019-08-28', 38, 2, NULL, 1, 0),
(75, '21.00', '0000-00-00', 36, 2, NULL, 1, 0),
(76, '48.00', '2019-08-26', 35, 1, NULL, 1, 0),
(77, '23.00', '2019-08-28', 34, 1, NULL, 1, 0),
(78, '21.00', '2019-08-28', 34, 1, NULL, 1, 0),
(79, '22.00', '2019-08-28', 34, 1, NULL, 1, 0),
(80, '23.00', '2019-08-28', 34, 1, NULL, 1, 0),
(81, '23.00', '2019-08-28', 34, 1, NULL, 1, 0),
(82, '23.00', '2019-08-28', 34, 1, NULL, 1, 0),
(83, '23.00', '2019-08-28', 34, 1, NULL, 1, 0),
(84, '23.00', '2019-08-28', 34, 1, NULL, 1, 0),
(85, '24.00', '2019-08-28', 34, 1, NULL, 1, 0),
(86, '0.00', '0000-00-00', 34, 1, NULL, 1, 0),
(87, '24.00', '0000-00-00', 34, 1, NULL, 1, 0),
(88, '25.00', '2019-08-29', 38, 1, NULL, 1, 0),
(89, '24.00', '2019-08-29', 34, 1, NULL, 1, 0),
(90, '25.00', '2019-08-29', 38, 2, NULL, 1, 0),
(92, '23.00', '2019-08-29', 34, 1, NULL, 1, 0),
(93, '24.00', '2019-08-29', 34, 1, NULL, 1, 0),
(94, '24.99', '2019-08-29', 34, 1, NULL, 1, 0),
(95, '23.00', '2019-08-29', 34, 1, NULL, 1, 0),
(96, '23.00', '2019-08-29', 34, 2, NULL, 1, 0),
(97, '23.00', '2019-08-29', 34, 1, NULL, 1, 0),
(98, '23.00', '2019-08-29', 34, 1, NULL, 1, 0),
(99, '25.00', '2019-08-29', 34, 1, NULL, 1, 0),
(100, '23.00', '2019-09-02', 34, 1, NULL, 1, 0),
(101, '23.00', '2019-09-02', 34, 1, NULL, 1, 0),
(102, '23.00', '2019-09-03', 34, 1, NULL, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `codigo` varchar(50) NOT NULL,
  `marca` varchar(50) DEFAULT NULL,
  `modelo` varchar(100) DEFAULT NULL,
  `categorie_id` int(11) UNSIGNED NOT NULL,
  `media_id` int(11) UNSIGNED DEFAULT '0',
  `id_measure` int(11) UNSIGNED NOT NULL,
  `date` datetime NOT NULL,
  `parte` varchar(100) DEFAULT NULL,
  `serie` varchar(100) DEFAULT NULL,
  `color` varchar(20) DEFAULT NULL,
  `tipo` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `name`, `codigo`, `marca`, `modelo`, `categorie_id`, `media_id`, `id_measure`, `date`, `parte`, `serie`, `color`, `tipo`) VALUES
(34, 'PARLANTE DE ESCRITORIO SNOOPY', '14001', 'HALION', 'HAS33', 3, 10, 13, '2019-08-01 06:55:48', 'HAS33', 'HAS33', 'BLANCO', 4),
(35, 'AUDIFONO OREJERAS', '14002', 'SONY', 'OREJERAS', 3, 9, 13, '2019-08-01 07:18:42', '108-0075', '108-0075', 'NEGRO', 4),
(36, 'FIERRO CORRUGADO DE 1/2 ACEROS AREQUIPA', '15001', 'ACEROS AREQUIPA', 'FIERRO DE MEDIA', 4, 11, 13, '2019-08-16 16:57:47', '33457889', '123456532', 'PLOMO', 6),
(37, 'bussing delantero ', '16001', 'MITSUBISHI', 'X555Q', 5, 6, 13, '2019-08-26 06:41:57', '431456', '1234567890', 'NEGRO', 4),
(38, 'pelota umbro', '12015', 'umbro', 'umbro', 1, 8, 13, '2019-08-27 02:12:50', '321321', '123123', 'blanco/negro', 4),
(39, 'CRUCETA PARA CAMION HINO ', '16002', 'TOYOTA', 'TOYOTA', 5, 6, 13, '2019-09-09 03:58:51', '147895631', '12456790098765', 'BRILLANTE', 4),
(40, 'PINTURA ESMALTE C/ROJO', '27001', 'ANYPSA', 'ANYPSA', 16, 6, 7, '2019-09-12 00:33:35', 'ANYPSA', 'ANYPSA', 'ROJO BERMELLON', 6),
(41, 'CEMENTO ANDINO TIPO V', '15003', 'ANDINO', 'TIPO V', 4, 6, 24, '2019-09-12 02:12:38', 'TIPO V', 'TIPO V', 'NEGRO CON PLOMO', 7),
(42, 'CLAVO DE 1&quot; ACEROS AREQUIPA', '15002', 'ACEROS AREQUIPA', 'CLAVO DE 1&quot;', 4, 6, 1, '2019-09-12 08:12:39', 'CLAVO DE 1&quot;', 'CLAVO DE 1&quot;', 'ACERO', 6),
(43, 'BOTA NEGRO F/AZUL C/P ACERO T39', '12110', 'SEGUSA', 'SEGUSA', 1, 6, 20, '0000-00-00 00:00:00', 'SEGUSA', 'SEGUSA', 'NEGRO/AMARILLO', 6),
(44, 'BOTA NEGRO F/AZUL C/P ACERO T40', '12111', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(45, 'BOTA NEGRO F/AZUL C/P ACERO T41', '12112', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(46, 'BOTA NEGRO F/AZUL C/P ACERO T42', '12113', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(47, 'BOTA NEGRO F/AZUL C/P ACERO T43', '12114', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(48, 'BOTA NEGRO F/AZUL C/P ACERO T44', '12115', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(49, 'BOTA METATARSAL F/AZUL C/P ACERO T38', '12116', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(50, 'BOTA METATARSAL F/AZUL C/P ACERO T39', '12117', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(51, 'BOTA METATARSAL F/AZUL C/P ACERO T40', '12118', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(52, 'BOTA METATARSAL F/AZUL C/P ACERO T41', '12119', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(53, 'BOTA METATARSAL F/AZUL C/P ACERO T42', '12120', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(54, 'BOTA METATARSAL F/AZUL C/P ACERO T43', '12121', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(55, 'BOTA METATARSAL F/AZUL C/P ACERO T44', '12122', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(56, 'BOTA MUSLERA SEGUSA T38', '12123', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(57, 'BOTA MUSLERA SEGUSA T39', '12124', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(58, 'BOTA MUSLERA SEGUSA T40', '12125', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(59, 'BOTA MUSLERA SEGUSA T41', '12126', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(60, 'BOTA MUSLERA SEGUSA T42', '12127', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(61, 'BOTA MUSLERA SEGUSA T43', '12128', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(62, 'BOTA MUSLERA SEGUSA T44', '12129', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(63, 'OVEROL NARANJA DRILL C/CINTA REFLEXTIVA T:S', '12130', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(64, 'OVEROL NARANJA DRILL C/CINTA REFLEXTIVA T:M', '12131', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(65, 'OVEROL NARANJA DRILL C/CINTA REFLEXTIVA T:L', '12132', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(66, 'OVEROL NARANJA DRILL C/CINTA REFLEXTIVA T:XL', '12133', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(67, 'OVEROL NARANJA DRILL C/CINTA REFLEXTIVA T:XXL', '12134', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(68, 'LAMPARA', '12135', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(69, 'OVEROL NARANJA DRILL ACOLCHADO T:S', '12136', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(70, 'OVEROL NARANJA DRILL ACOLCHADO T:M', '12137', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(71, 'OVEROL NARANJA DRILL ACOLCHADO T:L', '12138', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(72, 'OVEROL NARANJA DRILL ACOLCHADO T:XL', '12139', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(73, 'OVEROL NARANJA DRILL ACOLCHADO T:XXL', '12140', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(74, 'GUANTE BADANA STELLPRO ', '12141', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(75, 'CACHITO PARA LAMPARA', '12142', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(76, 'FILTRO ANTIGAS  6003', '12143', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(77, 'PROTECTOR COLOR ROJO', '12144', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(78, 'ROPA TIVEX', '12145', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(79, 'ZAPATO C/P ACERO NEGRO T:35', '12146', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(80, 'ZAPATO C/P ACERO NEGRO T:36', '12147', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(81, 'ZAPATO C/P ACERO NEGRO T:37', '12148', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(82, 'ZAPATO C/P ACERO NEGRO T:38', '12149', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(83, 'ZAPATO C/P ACERO NEGRO T:39', '12150', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(84, 'ZAPATO C/P ACERO NEGRO T:40', '12151', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(85, 'ZAPATO C/P ACERO NEGRO T:41', '12152', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(86, 'ZAPATO C/P ACERO NEGRO T:42', '12153', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(87, 'ZAPATO C/P ACERO NEGRO T:43', '12154', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(88, 'ZAPATO C/P ACERO NEGRO T:44', '12155', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(89, 'CHALECO NARANJA DRILL C/CINTA RELFECTIVA T:S', '12156', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(90, 'CHALECO NARANJA DRILL C/CINTA RELFECTIVA T:M', '12157', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(91, 'CHALECO NARANJA DRILL C/CINTA RELFECTIVA T:L', '12158', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(92, 'CHALECO NARANJA DRILL C/CINTA RELFECTIVA T:XL', '12159', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(93, 'CHALECO NARANJA DRILL C/CINTA RELFECTIVA T:XXL', '12160', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(94, 'GUANTE HYCRON ', '12161', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(95, 'GUANTE DE JEBE PARA TARAJEO', '12162', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(96, 'GUANTE QUIRURJICO NITRILO', '12163', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(97, 'CORREA DE SEGURIDAD D/NYLON NEGRO/AMARILLO', '12164', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(98, 'TAFILETE PARA CASCO C/RACHET', '12165', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(99, 'MANDIL DE CUERO P/SOLDADOR CROMO', '12166', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(100, 'FILTROS  3M 2097', '12167', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(101, 'AGUA DE MESA 20L', '12168', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(102, 'SILVATO NEGRO', '12169', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(103, 'LINTERNA', '12170', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(104, 'CANDADO PELVISAL', '12171', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(105, 'CANDADO DE SEGURIDAD C/ROJO', '12172', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(106, 'BOTA NEGRO C/P AMARRILLA T35', '12173', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(107, 'BOTA NEGRO C/P AMARRILLA T36', '12174', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(108, 'BOTA NEGRO C/P AMARRILLA T37', '12175', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(109, 'BOTA NEGRO C/P AMARRILLA T38', '12176', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(110, 'BOTA NEGRO C/P AMARRILLA T39', '12177', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(111, 'BOTA NEGRO C/P AMARRILLA T40', '12178', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(112, 'CORREA DE SEGURIDAD D/CUERO NEGRO', '12179', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(113, 'CARETA TRANSPARENTE', '12180', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(114, 'RESPIRADOR MEDIA CARA', '12181', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(115, 'GUANTES PALMA DE GOMA', '12182', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(116, 'GUANTES DE HILO C/PUNTOS DE PVC', '12183', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(117, 'GUANTES DE NEOPRENE', '12184', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(118, 'GUANTES DE NITRILO', '12185', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(119, 'GUANTES DE SOLDADOR', '12186', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(120, 'MASCARRILA', '12187', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(121, 'CHALECO VERDE DRILL T:S', '12188', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(122, 'CHALECO VERDE DRILL T:M', '12189', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(123, 'CHALECO VERDE DRILL T:L', '12190', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(124, 'CHALECO VERDE DRILL T:XL', '12191', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(125, 'CHALECO VERDE DRILL T:XXL', '12192', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(126, 'CAPOTIN ANLUC', '12193', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(127, 'CONO 90CM C/NARANJA', '12194', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(128, 'CONO 70CM C/NARANJA', '12195', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(129, 'CONO 50CM C/NARANJA', '12196', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(130, 'GUANTES DE CUERO', '12197', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(131, 'OVEROL NARANJA DRILL S/CINTA REFLEXTIVA T:S', '12198', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(132, 'OVEROL NARANJA DRILL S/CINTA REFLEXTIVA T:M', '12199', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(133, 'OVEROL NARANJA DRILL S/CINTA REFLEXTIVA T:L', '12200', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(134, 'OVEROL NARANJA DRILL S/CINTA REFLEXTIVA T:XL', '12201', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(135, 'OVEROL NARANJA DRILL S/CINTA REFLEXTIVA T:XXL', '12202', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(136, 'PANTALON DE CUERO P/SOLDADOR CROMO', '12203', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(137, 'SOBRELENTES TRANSPARENTE CLUTE', '12204', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(138, 'CARETA DE SOLDAR', '12205', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(139, 'MICA TRANSPARENTE PARA CARETA', '12206', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(140, 'ARNES', '12207', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(141, 'LINEA DE ANCLAGE', '12208', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(142, 'BOTIQUIN DE 20 X 30CM  IMPLEMENTADO', '12209', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(143, 'CAMILLA METALICA', '12210', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(144, 'CAMILLA RIGIDA', '12211', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(145, 'PAQUETE DE GASA 15 X 15CM', '12212', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(146, 'VENDA ELASTICA ', '12213', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(147, 'TUBO DE UNG?ENTO (DICLOFENATO EN PASTA ) 20Grm', '12214', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(148, 'NACL X 1LT', '12215', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(149, 'FERULA DE MADERA 60CM X 7', '12216', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(150, 'FERULA DE MADERA 40CM X 7', '12217', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(151, 'FERULA DE MADERA 30CM X 7', '12218', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(152, 'PORTAEXTINTOR', '12219', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(153, 'BOTIQUIN DE 30 X 40CM  IMPLEMENTADO', '12220', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(154, 'PIGTORAMAS PARA EXTINTOR', '12221', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(155, 'LAMPARA DE EMERGENCIA', '12222', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(156, 'STIKER (ZONA SEGURA EN CASO DE SISMO)', '12223', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(157, 'CACHACO DE PLASTICO DE SEGUDIAD C/NARANJA', '12224', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(158, 'BARRERA DE SEGURIDAD PORTATIL EXTENSIBLE', '12225', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(159, 'BARRA RETRACTIL PARA CONO', '12226', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(160, 'FRASADA', '12227', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(161, 'COLCHON DE 1/2\" PLAZA', '12228', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(162, 'SOBRELENTES OSCURO CLUTE', '12229', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(163, 'BLOQUEADOR 3M 50 PSS', '12230', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(164, 'CARGADOR DE LAMPARA', '12231', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(165, 'PRESINTO (AMARRE DE PASTICO)', '12232', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(166, 'POLAR (CUBRE CAMA)', '12233', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(167, 'BOTA NEGRO F/NEGRO C/P ACERO C/ROJO T:36', '12234', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(168, 'BOTA NEGRO F/NEGRO C/P ACERO C/ROJO T:37', '12235', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(169, 'BOTA NEGRO F/NEGRO C/P ACERO C/ROJO T:38', '12236', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(170, 'BOTA NEGRO F/NEGRO C/P ACERO C/ROJO T:39', '12237', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(171, 'BOTA NEGRO F/NEGRO C/P ACERO C/ROJO T:40', '12238', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(172, 'BOTA NEGRO F/NEGRO C/P ACERO C/ROJO T:41', '12239', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(173, 'BOTA NEGRO F/NEGRO C/P ACERO C/ROJO T:42', '12240', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(174, 'BOTA NEGRO F/NEGRO C/P ACERO C/ROJO T:43', '12241', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(175, 'SOPORTE PARA EXTINTOR', '12242', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(176, 'SE?ALISACION DE SEGURIDAD (STIKER)', '12243', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(177, 'BLOQUEADOR BAHAMAS SPF 60?', '12244', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(178, 'ROPA DE AGUA ', '12245', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(179, 'GUANTES DE CUERO CON MANGA LARGA', '12246', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(180, 'RADIO PROFESIONAL VHF /UHF TL - 800', '12247', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(181, 'BOTA NEGRO C/P AMARRILLA T41', '12248', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(182, 'BAJALENGUA DE MADERA ESTERIL', '12249', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(183, 'VENDA ELASTICA 6\" X 5YARDAS 15CM X 4.57Mtrs', '12250', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(184, 'VENDA ELASTICA 4\" X 5YARDAS 10CM X 4.57Mtrs', '12251', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(185, 'VENDA ELASTICA 3\" X 5YARDAS 7.5CM X 4.57Mtrs', '12252', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(186, 'DICLOFENATO 1% (GEL T?PICO) 50G', '12253', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(187, 'YODO PROVIDONA 60 ml', '12254', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(188, 'JABON LIQUIDO 400 ml (ANTIBACTERIAL)', '12255', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(189, 'CURITA', '12256', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(190, 'GASA ESTERIL APOSITO 10CM X 20CM', '12257', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(191, 'BLOQUEADOR CREMA 50+ SPF 10G', '12258', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(192, 'GUANTES QUIRURJICO VERDE \"TOUCHNTUFF\" TAMA?O M 7.1/2 - 8', '12259', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(193, 'GUANTES QUIRURJICO VERDE \"TOUCHNTUFF\" TAMA?O M 6.1/2 - 7', '12260', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(194, 'GASA ESTERIL APOSITO 10CM X 10CM', '12261', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(195, 'ESPARATRAPO 2.5CM X 0.9m 1\" X 1 YRD', '12262', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(196, 'TIJERA PEQUE?A C/NARANJA', '12263', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(197, 'LOGO DE HORARIO PARA BANNER 1Mtrs x 1.20Mtrs', '12264', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(198, 'PALETA DE SEGURIDAD (SIGA - PARE)', '12265', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(199, 'BLOQUEADOR EN SACHET', '12266', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(200, 'CHALECO SALVAVIDAS', '12267', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(201, 'BOTA NEGRO F/NEGRO C/P ACERO T:36', '12268', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(202, 'BOTA NEGRO F/NEGRO C/P ACERO T:37', '12269', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(203, 'BALIZAS SE?ALIZACION VIAL ', '12270', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(204, 'OVEROL NARANJA TERMICO T:S', '12271', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(205, 'OVEROL NARANJA TERMICO T:M', '12272', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(206, 'OVEROL NARANJA TERMICO T:L', '12273', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(207, 'OVEROL NARANJA TERMICO T:XL', '12274', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(208, 'OVEROL NARANJA TERMICO T:XXL', '12275', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(209, 'OVEROL NARANJA TERMICO T:XXXL', '12276', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(210, 'RADIO MOTOROLA', '12277', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(211, 'CARGADOR DE RADIO', '12278', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(212, 'BOTA METATARZAL AFRICANO NEGRO/ROJO T:41', '12279', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(213, 'BOTA METATARZAL AFRICANO NEGRO/ROJO T:42', '12280', '', '', 1, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(214, 'ESCOBA DE PLASTICO', '13101', '', '', 2, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(215, 'BOLSA NEGRA', '13102', '', '', 2, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(216, 'RECOGEDOR DE PLASTICO ', '13103', '', '', 2, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(217, 'TRAPO INDUSTRIAL', '13104', '', '', 2, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(218, 'ESCOBA DE PAJA', '13105', '', '', 2, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(219, 'TACHO DE BASURA CON TAPA ', '13106', '', '', 2, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(220, 'TRAPEADOR', '13107', '', '', 2, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(221, 'AYUDIN EN BOTE DE 1/2 KG', '13108', '', '', 2, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(222, 'ESCOBA DE MADERA', '13109', '', '', 2, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(223, 'DESATORADOR PARA BA?O', '13110', '', '', 2, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(224, 'AMBIENTADOR', '13111', '', '', 2, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(225, 'ESCOBILLA PARA BA?O', '13112', '', '', 2, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(226, 'ESPONJA ', '13113', '', '', 2, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(227, 'KIT DE LIMPIEZA', '13114', '', '', 2, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(228, 'LIMPIADTODO ', '13115', '', '', 2, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(229, 'BALDE DE CA?O DE 10LT', '13116', '', '', 2, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(230, 'DETERGENTE 3.5KG', '13117', '', '', 2, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(231, 'ESCOBA PEQUE?A', '13118', '', '', 2, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(232, 'JUEGO DE TACHO DE BASURA', '13119', '', '', 2, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(233, 'BOLSA DE RESIDUOS SOLIDOS C/AZUL', '13120', '', '', 2, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(234, 'BOLSA DE RESIDUOS SOLIDOS C/NEGRO', '13121', '', '', 2, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(235, 'BOLSA DE RESIDUOS SOLIDOS C/BLANCO', '13122', '', '', 2, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(236, 'BOLSA DE RESIDUOS SOLIDOS C/ROJO', '13123', '', '', 2, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(237, 'BOLSA DE RESIDUOS SOLIDOS C/MARRON', '13124', '', '', 2, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(238, 'BOLSA DE RESIDUOS SOLIDOS C/CELESTE', '13125', '', '', 2, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(239, 'TRAPEADOR 1MTR X 0.80MTR', '13126', '', '', 2, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(240, 'DETERGENTE OPAL 1KG', '13127', '', '', 2, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(241, 'MONITOR LG', '14101', '', '', 3, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(242, 'CPU', '14102', '', '', 3, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(243, 'MOUSE', '14103', '', '', 3, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(244, 'CARGADOR DE LAPTOP', '14104', '', '', 3, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(245, 'PARLANTE 2 EN 1 ', '14105', '', '', 3, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(246, 'BATERIA DE LAPTOP', '14106', '', '', 3, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(247, 'TECLADO', '14107', '', '', 3, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(248, 'CABLE DE INETERNET', '14108', '', '', 3, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(249, 'CONECTORES DE CABLE DE INTERNET', '14109', '', '', 3, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(250, 'IMPRESORA CON TINTA CONTINUA HP', '14110', '', '', 3, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(251, 'LAPTOP HP', '14111', '', '', 3, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(252, 'ESCRITORIO CON VIDRIO', '14112', '', '', 3, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(253, 'ESCRITORIO CON ESTANTE', '14113', '', '', 3, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(254, 'CARTUCHO DE TOMER (ATRIDGE TN-3476)', '14114', '', '', 3, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(255, 'EXTENSION DE 4 TOMAS (HOME LISGT)', '14115', '', '', 3, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(256, 'ULTIMATE PERFECTION JUEGO (PROTEC C/FEET)', '14116', '', '', 3, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(257, 'CABLE GOLDEN (HOCHIT)', '14117', '', '', 3, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(258, 'MODEM DE INTERNET', '14118', '', '', 3, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(259, 'BATERIA DE ESTACION TOTAL (TYPE :GEB222', '14119', '', '', 3, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(260, 'LAPTOP THOSHIBA SATELITE I5 2 TB DD 4 RAM', '14120', '', '', 3, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(261, 'FIERRO CORRUGADO DE 1/2\"X9M', '15101', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(262, 'FIERRO CORRUGADO DE 1/4\"X9M', '15102', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(263, 'ALAMBRE #8 NEGRO AMARRE ', '15103', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(264, 'ALAMBRE #16 NEGRO AMARRE', '15104', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(265, 'CLAVOS  DE 1\"', '15105', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(266, 'CLAVOS DE 1/1/2\"', '15106', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(267, 'CLAVOS DE 2\"', '15107', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(268, 'CLAVOS 2/1/2\"', '15108', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(269, 'CLAVOS DE 3\"', '15109', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(270, 'CLAVOS DE 4\"', '15110', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(271, 'CLAVOS DE 5\"', '15111', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(272, 'CLAVOS PARA CALAMINA', '15112', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(273, 'PERNOS ESPARRAGO DIAM. 1/2\" X 6\"', '15113', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(274, 'PUERTA METALICA 1.22 X 2.14M', '15114', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(275, 'PUERTA METALICA 2.14 X 0.92;ABRIR A LA IZQ', '15115', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(276, 'VENTANA METALICA DE 1.00 X 1.11M', '15116', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(277, 'VENTANA METALICA  DE 1.53 X 1.09M', '15117', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(278, 'VIDRIOS SEMIDOBLE CATEDRAL', '15118', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(279, 'DIMENSIONES:0.165*0.83', '15119', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(280, 'DIMENSIONES:0.155*0.83', '15120', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(281, 'DIMENSIONES: 0.74*0.215', '15121', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(282, 'DIMENSIONES:0.65*0.21', '15122', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(283, 'DIMENSIONES:0.52*0.65', '15123', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(284, 'DIMENSIONES:0.51*0.645', '15124', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(285, 'DIMENSIONES:0.51*0.64', '15125', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(286, 'DIMENSIONES:0.49*0.21', '15126', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(287, 'DIMENSIONES:0.655*0.18', '15127', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(288, 'DIMENSIONES:0.20*0.645', '15128', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(289, 'DIMENSIONES:0.305*0.655', '15129', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(290, 'PUERTA CONTRAPLACADA .90X1.10M', '15130', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(291, 'TAPAJUNTAS 10?X2\"X5mm', '15131', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(292, 'VENTANA METALICA 1.27 X 1.07m', '15132', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(293, 'PUERTA CONTRAPLACADA .915X2.16', '15133', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(294, 'DIMENSIONES:074*0.19', '15134', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(295, 'DIMENSIONES:0.675*0.192', '15135', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(296, 'DIMENSIONES:0.66*0.535', '15136', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(297, 'DIMENSIONES:0.67*0.545', '15137', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(298, 'DIMENSIONES:0.44*0.215', '15138', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(299, 'DIMENSIONES:0.725*0.21', '15139', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(300, 'DIMENSIONES:0.60*0.212', '15140', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(301, 'DIMENSIONES:0.605*0.212', '15141', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(302, 'DIMENSIONES:0.605*0.505', '15142', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(303, 'DIMENSIONES:0.59*0.49', '15143', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(304, 'DIMENSIONES:0.59*0.205', '15144', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(305, 'DIMENSIONES:0.54*0.385', '15145', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(306, 'DIMENSIONES:0.585*0.37', '15146', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(307, 'DIMENSIONES:0.44*0.272', '15147', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(308, 'DIMENSIONES:0.44*0.315', '15148', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(309, 'TUVO DE 1 1/2\" METALICA', '15149', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(310, 'SILICONA SIKASIL', '15150', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(312, 'PINTURA AL AGUA COLOR MARON ', '15152', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(313, 'PEGAMENTO PVC DE 1/4GL', '15153', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(314, 'THINNER', '15154', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(315, 'PIEDRA BASE', '15155', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(316, 'PEGAMENTO P/MAYOLICA', '15156', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(317, 'PILETA SISNE', '15157', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(318, 'PLANCHA LISA', '15158', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(319, 'ARENA GRUESA SEGUNDA', '15159', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(320, 'PERNO DIAMANTADO DE 3\"', '15160', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(321, 'CABLE N?12', '15161', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(322, 'CABLE N?13', '15162', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(323, 'CABLE N?14', '15163', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(324, 'RAFIA COLOR NEGRO ', '15164', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(325, 'REGADOR DE DUCHA', '15165', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(326, 'FIERRO CUADRADO 2\"', '15166', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(327, 'ANGULO EN L 1\"X 1\" DE 3ml x 6mtrs', '15167', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(328, 'ANGULO EN L 1/2\"X 1/2\"', '15168', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(329, 'ANGULO EN T', '15169', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(330, 'BARILLA CUADRADA', '15170', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(331, 'BARILLA PLATINA', '15171', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(332, 'RECTIFICADORA', '15172', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(333, 'PINTURA BASE BLANCO', '15173', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(334, 'PINTURA ESMALTE COLOR NEGRO', '15174', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(335, 'TINNER', '15175', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(336, 'PINTURA ESMALTE COLOR ROSADO', '15176', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(337, 'PINTURA ESMALTE COLOR AZUL', '15177', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(338, 'ENCHUFES  DE ALTO VOLTAGE', '15178', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(339, 'CAJA TERMICO DE 4 LLAVES', '15179', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(340, 'CAJA TERMICO DE 8 LLAVES', '15180', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(341, 'CAJA TERMICO DE 2 LLAVES', '15181', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(342, 'TERMONAGNETICO DE 20A', '15182', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(343, 'TERMONAGNETICO DE 16A', '15183', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(344, 'TERMONAGNETICO DE 25A', '15184', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(345, 'TERMONAGNETICO DE 45A', '15185', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(346, 'TERMONAGNETICO DE 12A', '15186', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(347, 'TERMONAGNETICO DE 100A', '15187', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(348, 'CODO DE 1/2? X 45\" PVC', '15188', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(349, 'CODO DE 1/2? X 90\" PVC', '15189', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(350, 'CODO DE 2? X 45\" PVC', '15190', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(351, 'CODO DE 2? X 90\" PVC', '15191', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(352, 'CODO DE 4? X 45\" PVC', '15192', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(353, 'CODO DE 4? X 90\" PVC', '15193', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(354, 'TUVO DE 1/2\"PVC', '15194', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(355, 'TUVO DE 3/4\"PARA LUZ', '15195', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(356, 'TUVO DE 2\" PVC', '15196', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(357, 'TUVO DE 4\" PVC', '15197', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(358, 'TUVO DE 3\" PVC', '15198', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(359, 'COSTAL BLANCO', '15199', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(360, 'EMPATE DE 1/2\" PVC', '15200', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(361, 'EMPATE DE 2\" PVC', '15201', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(362, 'EMPATE DE 3\" PVC', '15202', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(363, 'EMPATE DE 4\" PVC', '15203', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(364, 'CODO GALVANIZADO 1/2? X 90\"', '15204', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(365, 'LIJA N?40', '15205', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(366, 'LIJA N?60', '15206', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(367, 'LIJA N?100', '15207', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(368, 'LIJA N?120', '15208', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(369, 'LIJA N?150', '15209', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(370, 'LIJA N?80', '15210', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(371, 'YESO DE 14KG', '15211', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(372, 'TOMA CORIENTE', '15212', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(373, 'ELECTRODO CELLOCORD (AWS-E 6011) 1/8\"', '15213', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(374, 'COSTAL DE ARENA FINA X 50KG', '15214', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(375, 'ELECTRODO SUPERCITO (AWS E 7018) 1/8\"', '15215', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(376, 'ELECTRODO INDURA  6011 1/8\"', '15216', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(377, 'PLASTICO COLOR AZUL', '15217', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(378, 'CALAMINA DE 1.80Mtrs', '15218', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(379, 'CALAMINA DE 3Mtrs', '15219', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(380, 'ABRASADERA DE TUVO DE 2\"', '15220', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(381, 'DISCO CORTE DE METAL DESBASTE PARA AMOLADORA', '15221', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(382, 'DISCO CORTE METAL  DE 1mm PARA AMOLADORA', '15222', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(383, 'DISCO CORTE METAL  DE 2mm PARA AMOLADORA', '15223', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(384, 'DISCO DE METAL CUTTING  DE 3mm PARA TROSADORA', '15224', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(385, 'SELLADORA PARA MADERA DE 1KG', '15225', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(386, 'CANALETA C/TAPA  ', '15226', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(387, 'CANALETA C/DRENAGE', '15227', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(388, 'GANCHO P/CANALETA', '15228', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(389, 'Yee DE 2\" PVC', '15229', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(390, 'Yee DE 3\" PVC', '15230', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(391, 'Yee DE 4\" PVC', '15231', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(392, 'Tee DE 2\" PVC', '15232', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(393, 'Tee DE 3\" PVC', '15233', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(394, 'Tee DE 4\" PVC', '15234', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(395, 'VISAGRA #3', '15235', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(396, 'REMACHE MR77 P/CALAMINA', '15236', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(397, 'ASFALTO RC 250', '15237', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(398, 'SILICONA SIKAFLEX - 11FC', '15238', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(399, 'PLANCHA LISA  DE CALAMINA', '15239', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(400, 'SOKETS ', '15240', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(401, 'FOCO DE 36W', '15241', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(402, 'FOCO DE 42W', '15242', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(403, 'CAJA RECTANGULAR PARA FLUIDO ELECTRICO', '15243', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(404, 'INTERUPTOR', '15244', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(405, 'ARENA FINA', '15245', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(406, 'DISCO PARA MAQUINA CIRCULAR  7 1/4\"', '15246', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(407, 'CODO DE 3/4\" PARA LUZ', '15247', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(408, 'CHAPA DE BOLA MARCA TRAVEX BQ-2300', '15248', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(409, 'ARANDELAS (GUASHA)', '15249', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(410, 'PERNOS (JIRAFONES)', '15250', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(411, 'CRUSETAS', '15251', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(412, 'MASILLA PARA MADERA ', '15252', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(413, 'ARENA SHOCRE', '15253', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(414, 'COLA SINTETICA ', '15254', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(415, 'PINTURA ESMALTE COLOR VERDE PETROLEO', '15255', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(416, 'PINTURA ESMALTE COLOR MARON', '15256', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(417, 'PINTURA ESMALTE COLOR BLANCO', '15257', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(418, 'PINTURA ESMALTE COLOR ROJO BERMELLON', '15258', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(419, 'PINTURA ESMALTE COLOR CELETE', '15259', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(420, 'PINTURA ESMALTE COLOR AMARILLO', '15260', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(421, 'PINTURA ESMALTE COLOR GRIS CLARO', '15261', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(422, 'PINTURA AL AGUA COLOR MARACUYA', '15262', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(423, 'PINTURA AL AGUA COLOR MARFIL', '15263', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(424, 'PINTURA AL AGUA COLOR BLANCO', '15264', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(425, 'PINTURA ESMALTE COLOR ROJO OXIDO', '15265', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(426, 'ENCHUFE PARA CABLE', '15266', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(427, 'OCTAGONAL', '15267', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(428, 'PINTURA AL AGUA COLOR CITRON', '15268', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(429, 'ASIENTO PARA INODORO', '15269', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(430, 'PERNOS PARA SOKETS', '15270', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(431, 'ESCOVAR , AFILAR E ESMERILHAR (MARCA BOSCH)', '15271', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(432, 'OCRE COLOR AMARILLO', '15272', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(433, 'OCRE COLOR ROJO', '15273', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(434, 'LACA SELLADORA', '15274', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(435, 'CABLE VULVANISADO MONOFASICO C/PLOMO', '15275', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(436, 'TERMOMAGNETICO 32A', '15276', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(437, 'ELECTRODO CELLOCORD (AWS-E 6011) 3/16', '15277', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(438, 'Yee de 4  A 2', '15278', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(439, 'Tee de 4 A 2', '15279', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(440, 'CODO SANITARIO 4 REDUCCION A 2', '15280', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(441, 'DISCO DE CORTE 1mm PARA CONCRETO PARA AMOLADORA', '15281', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(442, 'PINTURA ESMALTE COLOR ALUMINIO', '15282', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(443, 'CORDEL ', '15283', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(444, 'MAYOLICA C/CELESTE 30cm x 20cm', '15284', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(445, 'MAYOLICA CON FIGURA 10cm x 25cm', '15285', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(446, 'FRAGUA C/CELESTE', '15286', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(447, 'CODO DE 3? X 45\" PVC', '15287', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(449, 'VIDRIO 67.3 X 48', '15289', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(450, 'VIDRIO 66 X 47', '15290', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(451, 'VIDRIO 67.3 X 23', '15291', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(452, 'VIDRIO 72.5 X 19', '15292', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(453, 'VIDRIO 74 X 20', '15293', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(454, 'VIDRIO 39 X 26', '15294', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(455, 'LAVATORIO DE COCINA ', '15295', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(456, 'FIERRO CORRUGADO DE 3/8\"X9M', '15296', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(457, 'VENTANA METALICA 1.60Mtrs x 1.10Mtrs', '15297', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(458, 'VENTANA METALICA 1.52Mtrs x 1.10Mtrs', '15298', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(459, 'VENTANA DE ALUMINIO 1.53Mtrs X 1.10Mtrs', '15299', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(460, 'VENTANA DE ALUMINIO 1.50Mtrs X 1.10Mtrs', '15300', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(461, 'PUERTA BANDERA DE ALUMINIO QUE SE ABRA ALA IZQUIERDA (2.20Mtrs x 83CM) Y (1.45Mtrs X 1.10Mtrs)', '15301', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(462, 'PUERTA CONTRAPLACADA 2.10Mtrs X 76CM', '15302', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(463, 'VENTANA METALICA 1.47Mtrs x 1.10Mtrs', '15303', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(464, 'CALAMINA 1.80Mtrs N?25', '15304', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(465, 'VENTANA 1Mtrs x 1.08 Mtrs ', '15305', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(466, 'PUERTA CONTRAPLACADA  90 X 2.15 ', '15306', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(467, 'CAJA METALICA DE 6LLAVES', '15307', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(468, 'ARENA SEGUNDA REFINADA ', '15308', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(469, 'CINTA REFLECTIVA 3M ROJO BANCO 2\" X 45.7Mtrs', '15309', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(470, 'BLOKETAS DE 15 X 15 X 40CM', '15310', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(471, 'BLOKETAS DE 20 X 20 X 40CM', '15311', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(472, 'PUERTA INTERIOR 2.15mtrs x 90CM', '15312', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(473, 'CABLE DE ACERO DE 1/2\" C/NEGRO ', '15313', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(474, 'CODO DE 4\" REDUCCION A 2\" PVC', '15314', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(475, 'CODO DE 3\" A 2\" PVC', '15315', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(476, 'CANALETA C/TAPA Y C/DRINAGE', '15316', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(477, 'Tee DE 1/2\" PVC', '15317', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(478, 'CODO CACHIMBA PVC 1/2\" 90? TIPO ROSCA', '15318', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(479, 'VENTANA METALICA DE 1.50 MT x 1.08 MT', '15319', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(480, 'PUERTA METALICA DE 2.15 MT x 1.50 MT (doble hoja)', '15320', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(481, 'PUERTA METALICA DE 2.15 MT x 0.95 MT (ABRE IZQUIERDA)', '15321', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(482, 'PUERTA CONTRAPLACADA DE 2.15 MT x 0.9 MT (ABRE DERECHA)', '15322', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(483, 'BOTONERA DE ENCENDIDO/APAGADO', '15323', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(484, 'CALAMINA N?25 DE 3.60Mtrs x  83CM', '15324', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(485, 'CODO DE VENTILACION DE 4\" A 2\"', '15325', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(486, 'CODO DE 1\" PARA LUZ', '15326', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(487, 'LADRILLOS PARA TECHO DE 30 X 30 X 15', '15327', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(488, 'FIERRO CORRUGADO DE 3/4\"X9M', '15328', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(489, 'TUVO 1\" PVC', '15329', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(490, 'MAYOLICA 20 X 30CM C/MARON', '15330', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(491, 'TUVO DESAGUE DE 4\" PESADO PVC', '15331', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(492, 'PERNOS CON TUERCA DE 5\"X 1/4', '15332', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(493, 'TIERRA PARA COMPACTADOR', '15333', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(494, 'CAJA TERMICO DE 1 LLAVE', '15334', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(495, 'PUERTA METALICA 70CM X 2MTRS (QUE SE ABRA HACIA LA DERECHA)', '15335', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(496, 'VIDRIO AHUMADO SEMIDOBLE (4mm)', '15336', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(497, 'FIERRO CUADRADO  1/2\"', '15337', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(498, 'CHAPA DE 2 GOLPES', '15338', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(500, 'PUERTA METALICA 2.10 MTRS X 1.24MTRS DE DOBLE HOJA ', '15340', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(501, 'VIDRIO DE 20CM X 90CM (CATEDRAL)', '15341', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(502, 'CAJA METALICA DE 4LLAVES', '15342', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(503, 'PERNO 1/4 DE 6\"', '15343', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(504, 'ARANDELAS 1/4\"', '15344', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(505, 'TUVO DESAGUE DE 2\" PESADO PVC', '15345', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(506, 'PUERTA METALICA 2.15MTRS  X 90CM (QUE SE ABRA ALA IZQUIERA)', '15346', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(507, 'VENTANA METALICA 1MTRS X 1.5MTRS', '15347', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(508, 'FIERRO CORRUGADO DE 1\"X9M', '15348', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(509, 'VIDRIO DE PLASTICO 1.02Mtrs x 63.5Mtrs', '15349', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(510, 'VIDRIO DE PLASTICO 90cm x 63cm', '15350', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(511, 'VIDRIO 59.5cm x 38cm', '15351', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(512, 'VALVULA  P/CAJA DE AGUA ', '15352', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(513, 'VALVULA DE DUCHA', '15353', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(514, 'CABLE ACERADO 1/4\" C/NEGRO', '15354', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(515, 'CANCAMOS DE 1\" X 80CM', '15355', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(516, 'PINTURA SPRAY C/ROJO', '15356', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(517, 'CLAVOS DE 6\"', '15357', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(518, 'REMOVEDOR DE OXIDO', '15358', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(520, 'COPLE DE 1\" PVC', '15360', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(521, 'COPLE DE 2\" PVC', '15361', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(522, 'COPLE DE 3\" PVC', '15362', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(523, 'COPLE DE 4\" PVC', '15363', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(524, 'COPLE DE 1 1/2\" PVC', '15364', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(525, 'COPLE DE 2 1/2\" PVC', '15365', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(526, 'PINTURA ESMALTE COLOR VERDE CROMO', '15366', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(527, 'VIDRIO 67 X 49CM', '15367', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(528, 'VIDRIO 67 X 22CM', '15368', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(529, 'VIDRIO 73 X 19CM', '15369', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(530, 'VIDRIO 65.5 X 19CM', '15370', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(531, 'VIDRIO 40 X 25CM', '15371', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(532, 'VIDRIO 62 X 6CM', '15372', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(533, 'TEFLON', '15373', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(534, 'VIDRIO 22 1/2 X 39CM', '15374', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(535, 'VIDRIO 22 1/2 X 44CM', '15375', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4),
(536, 'VIDRIO 49 X 21CM', '15376', '', '', 4, 6, 13, '0000-00-00 00:00:00', '', '', '', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provider`
--

CREATE TABLE `provider` (
  `id` int(11) UNSIGNED NOT NULL,
  `Ruc` varchar(11) NOT NULL,
  `RazonSocial` varchar(100) NOT NULL,
  `Direccion` varchar(200) NOT NULL,
  `Representante` varchar(100) NOT NULL,
  `Telefono1` int(9) NOT NULL,
  `Telefono2` int(9) NOT NULL,
  `Cuenta` int(10) UNSIGNED NOT NULL,
  `Contrato` int(10) UNSIGNED NOT NULL,
  `Descripcion` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `provider`
--

INSERT INTO `provider` (`id`, `Ruc`, `RazonSocial`, `Direccion`, `Representante`, `Telefono1`, `Telefono2`, `Cuenta`, `Contrato`, `Descripcion`) VALUES
(1, '20542579375', 'sermulsjm s.a', 'milpo', 'gerente', 123456789, 987654321, 123456, 1234556, 'proveedor de fierros');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `requirements`
--

CREATE TABLE `requirements` (
  `id` int(11) UNSIGNED NOT NULL,
  `Categorie` int(11) UNSIGNED NOT NULL,
  `Ceco` int(11) UNSIGNED NOT NULL,
  `DateAtention` date NOT NULL,
  `DateCreation` date NOT NULL,
  `NumberRq` varchar(20) NOT NULL,
  `priority` varchar(20) NOT NULL,
  `status` varchar(20) NOT NULL,
  `User` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `requirements`
--

INSERT INTO `requirements` (`id`, `Categorie`, `Ceco`, `DateAtention`, `DateCreation`, `NumberRq`, `priority`, `status`, `User`) VALUES
(1, 1, 1, '2019-09-06', '2019-09-08', 'RQ-08092019521904', 'ALTA', 'creado', 6),
(2, 2, 1, '2019-09-14', '2019-09-08', 'RQ-08092019360405', 'MEDIA', 'creado', 6),
(3, 7, 10, '2019-09-28', '2019-09-08', 'RQ-08092019480307', 'BAJA', 'creado', 6),
(4, 3, 1, '2019-09-28', '2019-09-08', 'RQ-08092019210507', 'MEDIA', 'creado', 6),
(5, 21, 1, '2019-09-27', '2019-09-08', 'RQ-08092019222007', 'MEDIA', 'creado', 6),
(6, 20, 1, '2019-10-01', '2019-09-08', 'RQ-08092019122207', 'MEDIA', 'creado', 6),
(7, 14, 1, '2019-09-13', '2019-09-09', 'RQ-09092019503203', 'MEDIA', 'creado', 6),
(8, 11, 10, '2019-09-11', '2019-09-09', 'RQ-09092019113403', 'MEDIA', 'creado', 6),
(9, 16, 1, '2019-09-28', '2019-09-09', 'RQ-09092019203603', 'MEDIA', 'creado', 6),
(10, 12, 1, '2019-09-28', '2019-09-09', 'RQ-09092019183803', 'MEDIA', 'creado', 6),
(11, 1, 1, '2019-09-27', '2019-09-09', 'RQ-09092019094703', 'MEDIA', 'creado', 6),
(12, 14, 1, '2019-09-05', '2019-09-09', 'RQ-09092019175103', 'MEDIA', 'creado', 6),
(13, 5, 1, '2019-09-19', '2019-09-09', 'RQ-09092019285203', 'MEDIA', 'creado', 6),
(14, 5, 10, '2019-09-28', '2019-09-09', 'RQ-09092019285303', 'MEDIA', 'creado', 6),
(15, 5, 10, '2019-10-04', '2019-09-09', 'RQ-09092019185403', 'MEDIA', 'creado', 6),
(16, 5, 1, '2019-09-26', '2019-09-09', 'RQ-09092019005603', 'BAJA', 'creado', 6),
(17, 5, 10, '2019-10-03', '2019-09-09', 'RQ-09092019515603', 'MEDIA', 'creado', 6),
(18, 5, 1, '2019-09-26', '2019-09-09', 'RQ-09092019205903', 'MEDIA', 'creado', 6),
(19, 5, 1, '2019-09-24', '2019-09-09', 'RQ-09092019480104', 'MEDIA', 'creado', 6),
(20, 1, 1, '2019-09-10', '2019-09-09', 'RQ-09092019110204', 'ALTA', 'creado', 6),
(21, 4, 1, '2019-09-27', '2019-09-09', 'RQ-09092019571404', 'MEDIA', 'creado', 6),
(22, 4, 10, '2019-09-25', '2019-09-09', 'RQ-09092019021604', 'MEDIA', 'creado', 6),
(23, 4, 10, '2019-10-02', '2019-09-09', 'RQ-09092019242104', 'MEDIA', 'creado', 6),
(24, 15, 1, '2019-09-25', '2019-09-09', 'RQ-09092019092404', 'MEDIA', 'creado', 6),
(25, 4, 1, '2019-10-01', '2019-09-09', 'RQ-09092019442404', 'MEDIA', 'creado', 6),
(26, 5, 1, '2019-09-30', '2019-09-09', 'RQ-09092019162604', 'MEDIA', 'creado', 6),
(27, 13, 11, '2019-09-10', '2019-09-10', 'RQ-09092019183310', 'MEDIA', 'creado', 6),
(28, 1, 1, '2019-09-24', '2019-09-11', 'RQ-11092019042104', 'MEDIA', 'creado', 6),
(29, 2, 11, '2019-09-12', '2019-09-11', 'RQ-11092019264606', 'MEDIA', 'creado', 6),
(30, 4, 11, '2019-09-25', '2019-09-11', 'RQ-11092019034806', 'MEDIA', 'creado', 6),
(31, 3, 11, '2019-09-18', '2019-09-11', 'RQ-11092019390307', 'MEDIA', 'creado', 6),
(32, 6, 10, '2019-09-25', '2019-09-11', 'RQ-11092019031907', 'BAJA', 'creado', 6),
(33, 5, 1, '2019-09-26', '2019-09-11', 'RQ-11092019301907', 'MEDIA', 'creado', 6),
(34, 4, 11, '2019-09-27', '2019-09-11', 'RQ-11092019332207', 'ALTA', 'creado', 6),
(35, 4, 10, '2019-09-30', '2019-09-11', 'RQ-11092019592207', 'ALTA', 'creado', 6),
(36, 5, 11, '2019-09-18', '2019-09-11', 'RQ-11092019023908', 'MEDIA', 'creado', 6),
(37, 5, 10, '2019-09-18', '2019-09-11', 'RQ-11092019285108', 'MEDIA', 'creado', 6),
(38, 4, 10, '2019-09-26', '2019-09-11', 'RQ-11092019385208', 'MEDIA', 'creado', 6),
(39, 5, 11, '2019-09-19', '2019-09-11', 'RQ-11092019035408', 'ALTA', 'creado', 6),
(40, 5, 11, '2019-09-19', '2019-09-11', 'RQ-11092019385508', 'MEDIA', 'creado', 6),
(41, 5, 10, '2019-09-25', '2019-09-11', 'RQ-11092019585708', 'MEDIA', 'creado', 6),
(42, 4, 1, '2019-09-27', '2019-09-11', 'RQ-11092019505808', 'ALTA', 'creado', 6),
(43, 4, 11, '2019-09-19', '2019-09-11', 'RQ-11092019555908', 'BAJA', 'creado', 6),
(44, 5, 10, '2019-09-26', '2019-09-11', 'RQ-11092019200109', 'MEDIA', 'creado', 6),
(45, 5, 11, '2019-09-18', '2019-09-11', 'RQ-11092019450309', 'ALTA', 'creado', 6),
(46, 5, 11, '2019-09-26', '2019-09-11', 'RQ-11092019180409', 'MEDIA', 'creado', 6),
(47, 5, 10, '2019-09-18', '2019-09-11', 'RQ-11092019390409', 'MEDIA', 'creado', 6),
(48, 4, 10, '2019-09-26', '2019-09-11', 'RQ-11092019470509', 'MEDIA', 'creado', 6),
(49, 5, 10, '2019-09-19', '2019-09-11', 'RQ-11092019050709', 'MEDIA', 'creado', 6),
(50, 5, 1, '2019-09-19', '2019-09-11', 'RQ-11092019581309', 'MEDIA', 'creado', 6),
(51, 4, 10, '2019-09-26', '2019-09-11', 'RQ-11092019021709', 'BAJA', 'creado', 6),
(52, 5, 11, '2019-09-26', '2019-09-11', 'RQ-11092019501709', 'MEDIA', 'creado', 6),
(53, 5, 10, '2019-09-27', '2019-09-11', 'RQ-12092019501612', 'MEDIA', 'creado', 6),
(54, 16, 10, '2019-09-17', '2019-09-12', 'RQ-12092019013412', 'MEDIA', 'creado', 6),
(55, 16, 10, '2019-09-14', '2019-09-12', 'RQ-12092019163512', 'MEDIA', 'creado', 6),
(56, 16, 11, '2019-09-14', '2019-09-12', 'RQ-12092019403512', 'MEDIA', 'creado', 6),
(57, 5, 11, '2019-09-12', '2019-09-12', 'RQ-12092019113812', 'MEDIA', 'creado', 6),
(58, 5, 10, '2019-09-13', '2019-09-12', 'RQ-12092019503812', 'MEDIA', 'creado', 6),
(59, 16, 11, '2019-09-13', '2019-09-12', 'RQ-12092019374012', 'MEDIA', 'creado', 6),
(60, 4, 11, '2019-09-25', '2019-09-12', 'RQ-12092019254312', 'ALTA', 'creado', 6),
(61, 4, 11, '2019-09-12', '2019-09-12', 'RQ-12092019054412', 'MEDIA', 'creado', 6),
(62, 4, 10, '2019-09-12', '2019-09-12', 'RQ-12092019594512', 'ALTA', 'creado', 6),
(63, 5, 11, '2019-09-12', '2019-09-12', 'RQ-12092019354612', 'ALTA', 'creado', 6),
(64, 5, 10, '2019-09-12', '2019-09-12', 'RQ-12092019024712', 'ALTA', 'creado', 6),
(65, 5, 11, '2019-09-12', '2019-09-12', 'RQ-12092019384912', 'MEDIA', 'creado', 6),
(66, 5, 10, '2019-09-12', '2019-09-12', 'RQ-12092019355112', 'MEDIA', 'creado', 6),
(67, 5, 11, '2019-09-12', '2019-09-12', 'RQ-12092019215212', 'MEDIA', 'creado', 6),
(68, 5, 10, '2019-09-13', '2019-09-12', 'RQ-12092019295312', 'ALTA', 'creado', 6),
(69, 5, 10, '2019-09-13', '2019-09-12', 'RQ-12092019590501', 'MEDIA', 'creado', 6),
(70, 5, 1, '2019-09-13', '2019-09-12', 'RQ-12092019331001', 'MEDIA', 'creado', 6),
(71, 5, 1, '2019-09-13', '2019-09-12', 'RQ-12092019451801', 'MEDIA', 'creado', 6),
(72, 5, 10, '2019-09-14', '2019-09-12', 'RQ-12092019131901', 'MEDIA', 'creado', 6),
(73, 5, 10, '2019-09-14', '2019-09-12', 'RQ-12092019521901', 'MEDIA', 'creado', 6),
(74, 5, 11, '2019-09-14', '2019-09-12', 'RQ-12092019302001', 'MEDIA', 'creado', 6),
(75, 5, 10, '2019-09-14', '2019-09-12', 'RQ-12092019492001', 'ALTA', 'creado', 6),
(76, 5, 1, '2019-09-14', '2019-09-12', 'RQ-12092019252101', 'MEDIA', 'creado', 6),
(77, 5, 1, '2019-09-14', '2019-09-12', 'RQ-12092019052201', 'MEDIA', 'creado', 6),
(78, 5, 10, '2019-09-14', '2019-09-12', 'RQ-12092019432201', 'MEDIA', 'creado', 6),
(79, 5, 11, '2019-09-14', '2019-09-12', 'RQ-12092019522301', 'ALTA', 'creado', 6),
(80, 5, 10, '2019-09-14', '2019-09-12', 'RQ-12092019152401', 'MEDIA', 'creado', 6),
(81, 4, 10, '2019-09-20', '2019-09-12', 'RQ-12092019564401', 'ALTA', 'creado', 6),
(82, 5, 10, '2019-09-13', '2019-09-12', 'RQ-12092019484601', 'MEDIA', 'creado', 6),
(83, 5, 11, '2019-09-14', '2019-09-12', 'RQ-12092019234801', 'MEDIA', 'creado', 6),
(84, 5, 11, '2019-09-13', '2019-09-12', 'RQ-12092019305201', 'MEDIA', 'creado', 6),
(85, 5, 1, '2019-09-16', '2019-09-12', 'RQ-12092019575201', 'BAJA', 'creado', 6),
(86, 5, 11, '2019-09-27', '2019-09-12', 'RQ-12092019435301', 'MEDIA', 'creado', 6),
(87, 5, 11, '2019-09-14', '2019-09-12', 'RQ-12092019140502', 'MEDIA', 'creado', 6),
(88, 4, 10, '2019-09-14', '2019-09-12', 'RQ-12092019220902', 'MEDIA', 'creado', 6),
(89, 4, 1, '2019-09-12', '2019-09-12', 'RQ-12092019551202', 'MEDIA', 'creado', 6),
(90, 5, 10, '2019-09-14', '2019-09-12', 'RQ-12092019291702', 'BAJA', 'creado', 6),
(91, 5, 10, '2019-09-26', '2019-09-12', 'RQ-12092019211902', 'MEDIA', 'creado', 6),
(92, 4, 10, '2019-09-13', '2019-09-12', 'RQ-12092019272002', 'BAJA', 'creado', 6),
(93, 4, 11, '2019-09-14', '2019-09-12', 'RQ-12092019062102', 'ALTA', 'creado', 6),
(94, 5, 11, '2019-09-20', '2019-09-12', 'RQ-12092019362402', 'MEDIA', 'creado', 6),
(95, 5, 10, '2019-09-14', '2019-09-12', 'RQ-12092019093002', 'MEDIA', 'creado', 6),
(96, 5, 10, '2019-09-21', '2019-09-12', 'RQ-12092019153202', 'MEDIA', 'creado', 6),
(97, 5, 10, '2019-09-21', '2019-09-12', 'RQ-12092019043502', 'MEDIA', 'creado', 6),
(98, 4, 1, '2019-09-28', '2019-09-20', 'RQ-12092019323602', 'ALTA', 'creado', 6),
(99, 5, 1, '2019-09-28', '2019-09-12', 'RQ-12092019203702', 'MEDIA', 'creado', 6),
(100, 5, 10, '2019-09-28', '2019-09-12', 'RQ-12092019043802', 'MEDIA', 'creado', 6),
(101, 4, 10, '2019-10-01', '2019-09-12', 'RQ-12092019483902', 'BAJA', 'creado', 6),
(102, 5, 10, '2019-09-28', '2019-09-12', 'RQ-12092019494102', 'MEDIA', 'creado', 6),
(103, 5, 10, '2019-09-28', '2019-09-12', 'RQ-12092019104602', 'MEDIA', 'creado', 6),
(104, 5, 1, '2019-09-19', '2019-09-12', 'RQ-12092019045002', 'ALTA', 'creado', 6),
(105, 5, 1, '2019-09-27', '2019-09-12', 'RQ-12092019435002', 'MEDIA', 'creado', 6),
(106, 4, 10, '2019-09-25', '2019-09-12', 'RQ-12092019013503', 'MEDIA', 'creado', 6),
(107, 5, 10, '2019-09-07', '2019-09-12', 'RQ-12092019115503', 'MEDIA', 'creado', 6),
(108, 1, 11, '2019-09-28', '2019-09-12', 'RQ-12092019441904', 'MEDIA', 'creado', 6),
(109, 5, 1, '2019-09-28', '2019-09-12', 'RQ-12092019422104', 'MEDIA', 'creado', 6),
(110, 4, 1, '2019-09-28', '2019-09-12', 'RQ-12092019122204', 'MEDIA', 'creado', 6),
(111, 4, 10, '2019-09-21', '2019-09-12', 'RQ-12092019032404', 'BAJA', 'creado', 6),
(112, 4, 10, '2019-09-28', '2019-09-12', 'RQ-12092019122604', 'MEDIA', 'creado', 6),
(113, 4, 10, '2019-09-28', '2019-09-12', 'RQ-12092019442604', 'MEDIA', 'creado', 6),
(114, 4, 1, '2019-09-28', '2019-09-12', 'RQ-12092019433504', 'MEDIA', 'creado', 6),
(115, 5, 1, '2019-09-28', '2019-09-12', 'RQ-12092019363604', 'MEDIA', 'creado', 6),
(116, 4, 10, '2019-09-28', '2019-09-12', 'RQ-12092019573604', 'BAJA', 'creado', 6),
(117, 4, 10, '2019-09-26', '2019-09-12', 'RQ-12092019503804', 'ALTA', 'creado', 6),
(118, 4, 1, '2019-09-21', '2019-09-12', 'RQ-12092019024004', 'MEDIA', 'creado', 6),
(119, 4, 10, '2019-09-28', '2019-09-12', 'RQ-12092019284204', 'MEDIA', 'creado', 6),
(120, 5, 10, '2019-09-28', '2019-09-12', 'RQ-12092019174304', 'MEDIA', 'creado', 6),
(121, 5, 11, '2019-09-28', '2019-09-12', 'RQ-12092019004504', 'MEDIA', 'creado', 6),
(122, 5, 1, '2019-09-28', '2019-09-12', 'RQ-12092019494504', 'MEDIA', 'creado', 6),
(123, 4, 1, '2019-09-28', '2019-09-12', 'RQ-12092019434704', 'BAJA', 'creado', 6),
(124, 5, 1, '2019-09-21', '2019-09-12', 'RQ-12092019244904', 'ALTA', 'creado', 6),
(125, 5, 10, '2019-09-28', '2019-09-12', 'RQ-12092019544904', 'MEDIA', 'creado', 6),
(126, 5, 1, '2019-09-18', '2019-09-12', 'RQ-12092019435804', 'MEDIA', 'creado', 6),
(127, 5, 1, '2019-09-26', '2019-09-12', 'RQ-12092019362605', 'MEDIA', 'creado', 6),
(128, 4, 1, '2019-09-25', '2019-09-12', 'RQ-12092019592605', 'ALTA', 'creado', 6),
(129, 5, 1, '2019-09-25', '2019-09-12', 'RQ-12092019352705', 'MEDIA', 'creado', 6),
(130, 5, 1, '2019-09-25', '2019-09-12', 'RQ-12092019343005', 'ALTA', 'creado', 6),
(131, 5, 10, '2019-09-25', '2019-09-12', 'RQ-12092019243205', 'MEDIA', 'creado', 6),
(132, 1, 10, '2019-09-30', '2019-09-12', 'RQ-12092019363405', 'MEDIA', 'creado', 6),
(133, 5, 10, '2019-09-24', '2019-09-12', 'RQ-12092019363505', 'MEDIA', 'creado', 6),
(134, 4, 11, '2019-09-25', '2019-09-12', 'RQ-12092019373705', 'MEDIA', 'creado', 6),
(135, 5, 10, '2019-09-25', '2019-09-12', 'RQ-12092019534105', 'MEDIA', 'creado', 6),
(136, 4, 10, '2019-09-25', '2019-09-12', 'RQ-12092019364205', 'MEDIA', 'creado', 6),
(137, 4, 10, '2019-09-25', '2019-09-12', 'RQ-12092019014405', 'MEDIA', 'creado', 6),
(138, 5, 11, '2019-09-25', '2019-09-12', 'RQ-12092019254505', 'MEDIA', 'creado', 6),
(139, 5, 10, '2019-09-25', '2019-09-12', 'RQ-12092019024705', 'MEDIA', 'creado', 6),
(140, 4, 10, '2019-09-25', '2019-09-12', 'RQ-12092019135105', 'ALTA', 'creado', 6),
(141, 5, 10, '2019-09-25', '2019-09-12', 'RQ-12092019415305', 'ALTA', 'creado', 6),
(142, 5, 10, '2019-09-25', '2019-09-12', 'RQ-12092019045705', 'ALTA', 'creado', 6),
(143, 5, 11, '2019-09-18', '2019-09-12', 'RQ-12092019445805', 'MEDIA', 'creado', 6),
(144, 5, 1, '2019-09-30', '2019-09-12', 'RQ-12092019460806', 'MEDIA', 'creado', 6),
(145, 5, 11, '2019-09-18', '2019-09-12', 'RQ-12092019310906', 'MEDIA', 'creado', 6),
(146, 5, 10, '2019-09-25', '2019-09-12', 'RQ-12092019361206', 'MEDIA', 'creado', 6),
(147, 4, 11, '2019-09-28', '2019-09-12', 'RQ-12092019361306', 'ALTA', 'creado', 6),
(148, 5, 1, '2019-09-28', '2019-09-12', 'RQ-12092019351806', 'ALTA', 'creado', 6),
(149, 4, 10, '2019-09-28', '2019-09-12', 'RQ-12092019142106', 'MEDIA', 'creado', 6),
(150, 5, 1, '2019-09-21', '2019-09-12', 'RQ-12092019202806', 'MEDIA', 'creado', 6),
(151, 4, 1, '2019-09-28', '2019-09-12', 'RQ-12092019192906', 'ALTA', 'creado', 6),
(152, 4, 1, '2019-09-21', '2019-09-12', 'RQ-12092019555906', 'MEDIA', 'creado', 6),
(153, 5, 1, '2019-09-21', '2019-09-12', 'RQ-12092019150107', 'ALTA', 'creado', 6),
(154, 4, 10, '2019-09-28', '2019-09-12', 'RQ-12092019580307', 'MEDIA', 'creado', 6),
(155, 5, 11, '2019-09-28', '2019-09-12', 'RQ-12092019520407', 'ALTA', 'creado', 6),
(156, 5, 1, '2019-09-28', '2019-09-12', 'RQ-12092019210907', 'MEDIA', 'creado', 6),
(157, 5, 1, '2019-09-21', '2019-09-12', 'RQ-12092019031007', 'MEDIA', 'creado', 6),
(158, 5, 1, '2019-09-28', '2019-09-12', 'RQ-12092019461007', 'MEDIA', 'creado', 6),
(159, 4, 1, '2019-09-21', '2019-09-12', 'RQ-12092019261107', 'ALTA', 'creado', 6),
(160, 5, 10, '2019-09-28', '2019-09-12', 'RQ-12092019291907', 'ALTA', 'creado', 6),
(161, 16, 1, '2019-09-21', '2019-09-12', 'RQ-12092019032307', 'ALTA', 'creado', 6),
(162, 4, 1, '2019-09-28', '2019-09-12', 'RQ-12092019102607', 'ALTA', 'creado', 6),
(163, 4, 1, '2019-09-28', '2019-09-12', 'RQ-12092019222907', 'ALTA', 'creado', 6),
(164, 4, 10, '2019-09-30', '2019-09-12', 'RQ-12092019373107', 'MEDIA', 'creado', 6),
(165, 4, 1, '2019-09-28', '2019-09-12', 'RQ-12092019273407', 'ALTA', 'creado', 6),
(166, 4, 1, '2019-09-28', '2019-09-12', 'RQ-12092019443507', 'MEDIA', 'creado', 6),
(167, 4, 1, '2019-09-28', '2019-09-12', 'RQ-12092019563607', 'MEDIA', 'creado', 6),
(168, 4, 10, '2019-09-28', '2019-09-12', 'RQ-12092019233707', 'MEDIA', 'creado', 6),
(169, 5, 1, '2019-09-28', '2019-09-12', 'RQ-12092019533907', 'ALTA', 'creado', 6),
(170, 4, 1, '2019-09-28', '2019-09-12', 'RQ-12092019484007', 'MEDIA', 'creado', 6),
(171, 4, 1, '2019-09-28', '2019-09-12', 'RQ-12092019424107', 'MEDIA', 'creado', 6),
(172, 4, 1, '2019-09-28', '2019-09-12', 'RQ-12092019394207', 'ALTA', 'creado', 6),
(173, 4, 10, '2019-09-28', '2019-09-12', 'RQ-12092019154307', 'ALTA', 'creado', 6),
(174, 4, 1, '2019-09-28', '2019-09-12', 'RQ-12092019374407', 'ALTA', 'creado', 6),
(175, 4, 1, '2019-09-28', '2019-09-12', 'RQ-12092019024507', 'MEDIA', 'creado', 6),
(176, 4, 10, '2019-10-05', '2019-09-12', 'RQ-12092019405407', 'MEDIA', 'creado', 6),
(177, 4, 10, '2019-10-05', '2019-09-12', 'RQ-12092019565507', 'ALTA', 'creado', 6),
(178, 5, 1, '2019-09-21', '2019-09-12', 'RQ-12092019365607', 'MEDIA', 'creado', 6),
(179, 4, 10, '2019-09-21', '2019-09-12', 'RQ-12092019115807', 'MEDIA', 'creado', 6),
(180, 4, 10, '2019-10-05', '2019-09-12', 'RQ-12092019540208', 'MEDIA', 'creado', 6),
(181, 4, 1, '2019-09-27', '2019-09-12', 'RQ-12092019570308', 'ALTA', 'creado', 6),
(182, 4, 1, '2019-09-17', '2019-09-12', 'RQ-12092019510408', 'MEDIA', 'creado', 6),
(183, 4, 1, '2019-10-01', '2019-09-12', 'RQ-12092019030708', 'MEDIA', 'creado', 6),
(184, 4, 1, '2019-09-30', '2019-09-12', 'RQ-12092019241908', 'MEDIA', 'creado', 6),
(185, 4, 1, '2019-09-26', '2019-09-12', 'RQ-12092019075608', 'ALTA', 'creado', 6),
(186, 4, 1, '2019-09-25', '2019-09-12', 'RQ-12092019195908', 'BAJA', 'creado', 6),
(187, 5, 1, '2019-10-01', '2019-09-12', 'RQ-12092019090209', 'MEDIA', 'creado', 6),
(188, 1, 1, '2019-09-20', '2019-09-13', 'RQ-13092019355410', 'ALTA', 'creado', 6),
(189, 4, 1, '2019-09-30', '2019-09-13', 'RQ-13092019251311', 'BAJA', 'creado', 6),
(190, 2, 10, '2019-09-25', '2019-09-13', 'RQ-13092019541411', 'MEDIA', 'creado', 6),
(191, 2, 10, '2019-09-24', '2019-09-13', 'RQ-13092019241511', 'MEDIA', 'creado', 6),
(192, 1, 1, '2019-09-19', '2019-09-13', 'RQ-13092019191611', 'MEDIA', 'creado', 6),
(193, 4, 1, '2019-09-24', '2019-09-13', 'RQ-13092019532011', 'MEDIA', 'creado', 6),
(194, 16, 1, '2019-09-30', '2019-09-14', 'RQ-14092019192005', 'MEDIA', 'creado', 6),
(195, 4, 1, '2019-09-30', '2019-09-14', 'RQ-14092019352505', 'MEDIA', 'creado', 6),
(196, 1, 1, '2019-09-29', '2019-09-14', 'RQ-14092019113705', 'MEDIA', 'creado', 6),
(197, 1, 1, '2019-09-30', '2019-09-14', 'RQ-14092019373905', 'MEDIA', 'creado', 6),
(198, 1, 10, '2019-09-27', '2019-09-14', 'RQ-14092019184105', 'MEDIA', 'creado', 6),
(199, 1, 1, '2019-09-23', '2019-09-14', 'RQ-14092019324605', 'ALTA', 'creado', 6),
(200, 1, 1, '2019-09-29', '2019-09-14', 'RQ-14092019374705', 'MEDIA', 'creado', 6),
(201, 1, 1, '2019-09-29', '2019-09-14', 'RQ-14092019095005', 'MEDIA', 'creado', 6),
(202, 1, 1, '2019-09-30', '2019-09-14', 'RQ-14092019235405', 'ALTA', 'creado', 6),
(203, 1, 1, '2019-09-17', '2019-09-14', 'RQ-14092019053506', 'ALTA', 'creado', 6),
(204, 3, 1, '2019-09-29', '2019-09-14', 'RQ-14092019023806', 'MEDIA', 'creado', 6),
(205, 5, 1, '2019-09-25', '2019-09-15', 'RQ-15092019444404', 'MEDIA', 'creado', 6),
(206, 4, 1, '2019-09-30', '2019-09-15', 'RQ-15092019361605', 'MEDIA', 'creado', 6),
(207, 1, 10, '2019-09-25', '2019-09-17', 'RQ-17092019261907', 'ALTA', 'creado', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reuirements`
--
-- Error leyendo la estructura de la tabla oswa_inv.reuirements: #1932 - Table 'oswa_inv.reuirements' doesn't exist in engine
-- Error leyendo datos de la tabla oswa_inv.reuirements: #1064 - Algo está equivocado en su sintax cerca 'FROM `oswa_inv`.`reuirements`' en la linea 1

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sales`
--

CREATE TABLE `sales` (
  `id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL,
  `price` decimal(25,2) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stock`
--

CREATE TABLE `stock` (
  `id` int(11) NOT NULL,
  `product` int(10) UNSIGNED NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `stock`
--

INSERT INTO `stock` (`id`, `product`, `cantidad`) VALUES
(1, 36, 100),
(2, 35, 5),
(3, 37, 3),
(4, 34, 7),
(5, 38, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subceco`
--

CREATE TABLE `subceco` (
  `id` int(11) UNSIGNED NOT NULL,
  `Ceco` int(11) UNSIGNED NOT NULL,
  `Departament` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `subceco`
--

INSERT INTO `subceco` (`id`, `Ceco`, `Departament`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_cambio`
--

CREATE TABLE `tipo_cambio` (
  `id` int(10) UNSIGNED NOT NULL,
  `dia` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `compra` decimal(10,3) NOT NULL,
  `venta` decimal(10,3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_cambio`
--

INSERT INTO `tipo_cambio` (`id`, `dia`, `date`, `compra`, `venta`) VALUES
(17, 10, '2019-07-29 00:00:00', '3.000', '4.000'),
(18, 3, '2019-07-28 00:00:00', '3.000', '3.000'),
(19, 3, '2019-07-28 00:00:00', '3.000', '3.000'),
(20, 2, '2019-08-05 00:00:00', '3.285', '3.300');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `typecontract`
--

CREATE TABLE `typecontract` (
  `id` int(11) UNSIGNED NOT NULL,
  `TypeContract` int(11) NOT NULL,
  `Description` int(11) NOT NULL,
  `Date` int(11) NOT NULL,
  `Normativa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `typeworker`
--

CREATE TABLE `typeworker` (
  `id` int(10) UNSIGNED NOT NULL,
  `TypeWorker` varchar(150) NOT NULL,
  `Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `typeworker`
--

INSERT INTO `typeworker` (`id`, `TypeWorker`, `Date`) VALUES
(1, 'empleado', '2019-08-03'),
(2, 'obrero', '2019-08-03');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `typy`
--

CREATE TABLE `typy` (
  `id` int(10) UNSIGNED NOT NULL,
  `NameType` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `typy`
--

INSERT INTO `typy` (`id`, `NameType`) VALUES
(4, 'DURADEROS'),
(6, 'CONSUMIBLES'),
(7, 'ACTIVO FIJO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` int(11) UNSIGNED NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_level` int(11) NOT NULL,
  `image` varchar(255) DEFAULT 'no_image.jpg',
  `status` int(1) NOT NULL,
  `last_login` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `user_level`, `image`, `status`, `last_login`) VALUES
(6, 3, 'Sermul', 'a13018807377b11b7003303990b4716a7fd5a89e', 1, '6qg0qs546.png', 1, '2019-09-17 07:15:34'),
(12, 4, 'sermul2', 'acb2dc27254b7d226879b451076d2d8833f88cc1', 4, 'no_image.jpg', 1, '2019-09-09 22:22:55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_groups`
--

CREATE TABLE `user_groups` (
  `id` int(11) NOT NULL,
  `group_name` varchar(150) NOT NULL,
  `group_level` int(11) NOT NULL,
  `group_status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `user_groups`
--

INSERT INTO `user_groups` (`id`, `group_name`, `group_level`, `group_status`) VALUES
(4, 'Almacen', 4, 1),
(5, 'admin', 1, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `ceco`
--
ALTER TABLE `ceco`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `codigo_ceco` (`codigo`);

--
-- Indices de la tabla `contract`
--
ALTER TABLE `contract`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Person` (`Person`),
  ADD KEY `SubCeco` (`SubCeco`),
  ADD KEY `TypeContract` (`TypeContract`),
  ADD KEY `Organization` (`Organization`),
  ADD KEY `Provider` (`Provider`);

--
-- Indices de la tabla `departament`
--
ALTER TABLE `departament`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Organization` (`Organization`);

--
-- Indices de la tabla `detailrq`
--
ALTER TABLE `detailrq`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product` (`Products`),
  ADD KEY `rq` (`RQ`);

--
-- Indices de la tabla `measure`
--
ALTER TABLE `measure`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_measure` (`id`);

--
-- Indices de la tabla `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indices de la tabla `money`
--
ALTER TABLE `money`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `organization`
--
ALTER TABLE `organization`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Representante` (`Representante`);

--
-- Indices de la tabla `persons`
--
ALTER TABLE `persons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Position` (`Position`),
  ADD KEY `TypeWorker` (`TypeWorker`);

--
-- Indices de la tabla `position`
--
ALTER TABLE `position`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `price`
--
ALTER TABLE `price`
  ADD PRIMARY KEY (`id`),
  ADD KEY `producto_id` (`producto_id`) USING BTREE,
  ADD KEY `type_money` (`money`),
  ADD KEY `tipo_cambio` (`tipo_cambio`),
  ADD KEY `Provider` (`Provider`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `codigo` (`codigo`),
  ADD KEY `id_measure` (`id_measure`) USING BTREE,
  ADD KEY `categorie_id` (`categorie_id`) USING BTREE,
  ADD KEY `media_id` (`media_id`) USING BTREE,
  ADD KEY `tipo` (`tipo`);

--
-- Indices de la tabla `provider`
--
ALTER TABLE `provider`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `requirements`
--
ALTER TABLE `requirements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cecorq` (`Ceco`),
  ADD KEY `categorierq` (`Categorie`),
  ADD KEY `userrq` (`User`);

--
-- Indices de la tabla `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`) USING BTREE;

--
-- Indices de la tabla `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productstock` (`product`);

--
-- Indices de la tabla `subceco`
--
ALTER TABLE `subceco`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Ceco` (`Ceco`),
  ADD KEY `Departament` (`Departament`);

--
-- Indices de la tabla `tipo_cambio`
--
ALTER TABLE `tipo_cambio`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `typecontract`
--
ALTER TABLE `typecontract`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `typeworker`
--
ALTER TABLE `typeworker`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `typy`
--
ALTER TABLE `typy`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `user_level` (`user_level`),
  ADD KEY `name` (`name`);

--
-- Indices de la tabla `user_groups`
--
ALTER TABLE `user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `group_level` (`group_level`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `ceco`
--
ALTER TABLE `ceco`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `contract`
--
ALTER TABLE `contract`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `departament`
--
ALTER TABLE `departament`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `detailrq`
--
ALTER TABLE `detailrq`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=231;

--
-- AUTO_INCREMENT de la tabla `measure`
--
ALTER TABLE `measure`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `media`
--
ALTER TABLE `media`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `money`
--
ALTER TABLE `money`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `organization`
--
ALTER TABLE `organization`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `persons`
--
ALTER TABLE `persons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `position`
--
ALTER TABLE `position`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `price`
--
ALTER TABLE `price`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=537;

--
-- AUTO_INCREMENT de la tabla `requirements`
--
ALTER TABLE `requirements`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=208;

--
-- AUTO_INCREMENT de la tabla `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `stock`
--
ALTER TABLE `stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `subceco`
--
ALTER TABLE `subceco`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tipo_cambio`
--
ALTER TABLE `tipo_cambio`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `typecontract`
--
ALTER TABLE `typecontract`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `typeworker`
--
ALTER TABLE `typeworker`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `typy`
--
ALTER TABLE `typy`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `user_groups`
--
ALTER TABLE `user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `contract`
--
ALTER TABLE `contract`
  ADD CONSTRAINT `Organization` FOREIGN KEY (`Organization`) REFERENCES `organization` (`id`),
  ADD CONSTRAINT `Person` FOREIGN KEY (`Person`) REFERENCES `persons` (`id`),
  ADD CONSTRAINT `Provider` FOREIGN KEY (`Provider`) REFERENCES `provider` (`id`),
  ADD CONSTRAINT `SubCeco` FOREIGN KEY (`SubCeco`) REFERENCES `subceco` (`id`),
  ADD CONSTRAINT `TypeContract` FOREIGN KEY (`TypeContract`) REFERENCES `typecontract` (`id`);

--
-- Filtros para la tabla `departament`
--
ALTER TABLE `departament`
  ADD CONSTRAINT `departament_ibfk_1` FOREIGN KEY (`Organization`) REFERENCES `organization` (`id`);

--
-- Filtros para la tabla `detailrq`
--
ALTER TABLE `detailrq`
  ADD CONSTRAINT `product` FOREIGN KEY (`Products`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `rq` FOREIGN KEY (`RQ`) REFERENCES `requirements` (`id`);

--
-- Filtros para la tabla `organization`
--
ALTER TABLE `organization`
  ADD CONSTRAINT `Representante` FOREIGN KEY (`Representante`) REFERENCES `persons` (`id`);

--
-- Filtros para la tabla `persons`
--
ALTER TABLE `persons`
  ADD CONSTRAINT `Position` FOREIGN KEY (`Position`) REFERENCES `position` (`id`),
  ADD CONSTRAINT `TypeWorker` FOREIGN KEY (`TypeWorker`) REFERENCES `typeworker` (`id`);

--
-- Filtros para la tabla `price`
--
ALTER TABLE `price`
  ADD CONSTRAINT `price_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `tipo_cambio` FOREIGN KEY (`tipo_cambio`) REFERENCES `tipo_cambio` (`id`),
  ADD CONSTRAINT `type_money` FOREIGN KEY (`money`) REFERENCES `money` (`id`);

--
-- Filtros para la tabla `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `FK_products` FOREIGN KEY (`categorie_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`id_measure`) REFERENCES `measure` (`id`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`),
  ADD CONSTRAINT `tipo_fk` FOREIGN KEY (`tipo`) REFERENCES `typy` (`id`);

--
-- Filtros para la tabla `requirements`
--
ALTER TABLE `requirements`
  ADD CONSTRAINT `categorierq` FOREIGN KEY (`Categorie`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `cecorq` FOREIGN KEY (`Ceco`) REFERENCES `ceco` (`id`),
  ADD CONSTRAINT `userrq` FOREIGN KEY (`User`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `SK` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `stock`
--
ALTER TABLE `stock`
  ADD CONSTRAINT `productstock` FOREIGN KEY (`product`) REFERENCES `products` (`id`);

--
-- Filtros para la tabla `subceco`
--
ALTER TABLE `subceco`
  ADD CONSTRAINT `Ceco` FOREIGN KEY (`Ceco`) REFERENCES `ceco` (`id`),
  ADD CONSTRAINT `DepartamentFK` FOREIGN KEY (`Departament`) REFERENCES `departament` (`id`);

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `FK_user` FOREIGN KEY (`user_level`) REFERENCES `user_groups` (`group_level`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`name`) REFERENCES `persons` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
