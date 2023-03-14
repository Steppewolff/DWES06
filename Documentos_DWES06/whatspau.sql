-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-11-2022 a las 13:30:12
-- Versión del servidor: 10.4.6-MariaDB-log
-- Versión de PHP: 7.3.9

CREATE DATABASE IF NOT EXISTS dwes06;

USE dwes06;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `whatspau`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `missatges`
--

CREATE TABLE `missatges` (
  `fecha` datetime NOT NULL,
  `id_sender` int(11) NOT NULL,
  `id_receiver` int(11) NOT NULL,
  `missatge` varchar(250) NOT NULL,
  `status` enum('send','received','read') NOT NULL DEFAULT 'send'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `missatges`
--

INSERT INTO `missatges` (`fecha`, `id_sender`, `id_receiver`, `missatge`, `status`) VALUES
('2022-08-30 00:00:00', 1, 2, 'Bon dia Marga', 'read'),
('2022-08-30 00:03:00', 2, 1, 'Bon dia Jose, que volies?', 'received'),
('2022-08-30 00:04:00', 1, 2, 'res', 'send'),
('2022-08-30 00:04:30', 1, 2, 'nomes saludar', 'send'),
('2022-08-30 12:03:00', 2, 1, 'pues vale', 'received'),
('2022-08-30 16:38:05', 1, 2, 'adeu Marga', 'send'),
('2022-11-10 18:37:49', 1, 2, 'adeu Marga', 'send'),
('2022-11-11 10:59:07', 2, 3, 'Ets per aqui?', 'send');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_base`
--

CREATE TABLE `users_base` (
  `id_user` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `users_base`
--

INSERT INTO `users_base` (`id_user`, `username`, `password`) VALUES
(1, 'Jose', 'mypassword'),
(2, 'Marga', '123456'),
(3, 'Pau', '654321');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `missatges`
--
ALTER TABLE `missatges`
  ADD PRIMARY KEY (`fecha`,`id_sender`),
  ADD KEY `missatges_ibfk_1` (`id_sender`),
  ADD KEY `id_receiver` (`id_receiver`);

--
-- Indices de la tabla `users_base`
--
ALTER TABLE `users_base`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `users_base`
--
ALTER TABLE `users_base`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `missatges`
--
ALTER TABLE `missatges`
  ADD CONSTRAINT `missatges_ibfk_1` FOREIGN KEY (`id_sender`) REFERENCES `users_base` (`id_user`),
  ADD CONSTRAINT `missatges_ibfk_2` FOREIGN KEY (`id_receiver`) REFERENCES `users_base` (`id_user`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
