-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-04-2025 a las 14:59:33
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `libre2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `ciudad` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombre`, `ciudad`) VALUES
(1, 'Ana', 'Bogotá'),
(2, 'Carlos', 'Medellín'),
(3, 'Luisa', 'Cali');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `id` int(11) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `área` varchar(50) DEFAULT NULL,
  `salario` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id`, `nombre`, `área`, `salario`) VALUES
(10001, 'Linda', 'IT', 1000000),
(10002, 'Francisco', 'RHH', 2000000),
(10003, 'Ana', 'Contaduria', 3000000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(11) DEFAULT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `producto` varchar(100) DEFAULT NULL,
  `total` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id`, `cliente_id`, `producto`, `total`) VALUES
(1, 1, 'Laptop', 3000),
(2, 2, 'Mouse', 50),
(3, 1, 'Teclado', 100);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_clientes`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_clientes` (
`nombre` varchar(100)
,`ciudad` varchar(50)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_clientes_bogota`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_clientes_bogota` (
`nombre` varchar(100)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_empleados`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_empleados` (
`nombre` varchar(100)
,`área` varchar(50)
,`salario` decimal(10,0)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_pedidos_clientes`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_pedidos_clientes` (
`nombre` varchar(100)
,`producto` varchar(100)
,`total` decimal(10,0)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_clientes`
--
DROP TABLE IF EXISTS `vista_clientes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_clientes`  AS SELECT `clientes`.`nombre` AS `nombre`, `clientes`.`ciudad` AS `ciudad` FROM `clientes` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_clientes_bogota`
--
DROP TABLE IF EXISTS `vista_clientes_bogota`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_clientes_bogota`  AS SELECT `clientes`.`nombre` AS `nombre` FROM `clientes` WHERE `clientes`.`ciudad` = 'Bogotá' ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_empleados`
--
DROP TABLE IF EXISTS `vista_empleados`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_empleados`  AS SELECT `empleados`.`nombre` AS `nombre`, `empleados`.`área` AS `área`, `empleados`.`salario` AS `salario` FROM `empleados` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_pedidos_clientes`
--
DROP TABLE IF EXISTS `vista_pedidos_clientes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_pedidos_clientes`  AS SELECT `c`.`nombre` AS `nombre`, `p`.`producto` AS `producto`, `p`.`total` AS `total` FROM (`clientes` `c` join `pedidos` `p` on(`c`.`id` = `p`.`cliente_id`)) ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
