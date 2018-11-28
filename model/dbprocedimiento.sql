-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-11-2018 a las 05:59:16
-- Versión del servidor: 10.1.35-MariaDB
-- Versión de PHP: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dbprocedimiento`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `actLibro` (IN `pm_id` INT, IN `pm_titulo` VARCHAR(40), IN `pm_autor` VARCHAR(30), IN `pm_editorial` VARCHAR(20), IN `pm_precio` DECIMAL(10,2))  BEGIN
UPDATE `dbprocedimiento`.`libro`
SET
`titulo` = pm_titulo,
`autor` = pm_autor,
`editorial` = pm_editorial,
`precio` = pm_precio
WHERE `id` = pm_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `aumentarPrecio` (IN `pm_editorial` VARCHAR(20))  BEGIN
	/*
      obtener los libros y actualizar esos libros que encontró
    */
    
    UPDATE `dbprocedimiento`.`libro`
SET precio = (precio + (precio*0.10)) WHERE editorial = pm_editorial;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `crearlibro` (IN `pm_titulo` VARCHAR(40), IN `pm_autor` VARCHAR(30), IN `pm_editorial` VARCHAR(20), IN `pm_precio` DECIMAL(10,2))  BEGIN
INSERT INTO `libro`(`titulo`, `autor`, `editorial`, `precio`) VALUES (pm_titulo, pm_autor, pm_editorial, pm_precio);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `porcentajeAumento` (IN `pm_editorial` VARCHAR(20), IN `incremento` INT)  BEGIN

UPDATE libro
SET precio = IF (incremento <= 0, precio + (precio * 0.10), precio + (precio *(incremento/100))) WHERE editorial = pm_editorial;

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libro`
--

CREATE TABLE `libro` (
  `id` int(11) NOT NULL,
  `titulo` varchar(40) DEFAULT NULL,
  `autor` varchar(30) DEFAULT NULL,
  `editorial` varchar(20) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `libro`
--

INSERT INTO `libro` (`id`, `titulo`, `autor`, `editorial`, `precio`) VALUES
(2, 'Nuevo2', 'Nuevo2', 'Nuevo2', '1663.75');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login`
--

CREATE TABLE `login` (
  `id` int(10) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `login`
--

INSERT INTO `login` (`id`, `email`, `password`) VALUES
(1, 'admin@admin.com', 'd033e22ae348aeb5660fc2140aec35850c4da997');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `libro`
--
ALTER TABLE `libro`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `libro`
--
ALTER TABLE `libro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `login`
--
ALTER TABLE `login`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
