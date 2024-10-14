-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-10-2024 a las 22:55:18
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sistema_desereth`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamentos`
--

CREATE TABLE `departamentos` (
  `idDepa` int(11) NOT NULL,
  `Departamento` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `departamentos`
--

INSERT INTO `departamentos` (`idDepa`, `Departamento`) VALUES
(1, 'LA PAZ'),
(2, 'COCHABAMBA'),
(3, 'SANTA CRUZ'),
(4, 'ORURO'),
(5, 'TARIJA'),
(6, 'POTOSI'),
(7, 'CHUQUISACA'),
(8, 'BENI'),
(9, 'PANDO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `distritos`
--

CREATE TABLE `distritos` (
  `idDist` int(11) NOT NULL,
  `Distrito` varchar(50) NOT NULL,
  `idProv` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `distritos`
--

INSERT INTO `distritos` (`idDist`, `Distrito`, `idProv`) VALUES
(1, 'EL ALTO', 1),
(2, 'SANTA CRUZ DE LA SIERRA', 2),
(3, 'COCHABAMBA (CENTRO)', 3),
(4, 'LA PAZ', 1),
(5, 'COTOCA', 2),
(6, 'MONTERO', 2),
(7, 'ORURO (CENTRO)', 4),
(8, 'TARIJA (CENTRO)', 5),
(9, 'ENTRE RIOS', 5),
(10, 'POTOSI (CENTRO)', 6),
(11, 'SUCRE', 7),
(12, 'TRINIDAD', 8),
(13, 'COBIJA', 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE `empresa` (
  `id_empresa` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `ubicacion` varchar(255) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT '',
  `correo` varchar(255) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`id_empresa`, `nombre`, `descripcion`, `ubicacion`, `telefono`, `correo`, `foto`) VALUES
(1, 'LOGISTICA DESERETH', 'Transporte Nacional y Local', 'La paz, Zona Pura pura, Av. Vasquez, N.245 (Oficina central)', '+591 75270926', 'logisticadesereth@gmail.com', 'logo.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `envio`
--

CREATE TABLE `envio` (
  `id_envio` int(11) NOT NULL,
  `numero_reg` varchar(255) DEFAULT NULL,
  `id_remitente` int(11) DEFAULT NULL,
  `id_receptor` int(11) DEFAULT NULL,
  `fecha_salida` datetime DEFAULT NULL,
  `fecha_recojo` datetime DEFAULT NULL,
  `desde_distrito` int(11) DEFAULT NULL,
  `desde_direccion` varchar(255) DEFAULT NULL,
  `hasta_distrito` int(11) DEFAULT NULL,
  `hasta_direccion` varchar(255) DEFAULT NULL,
  `cantidad` varchar(255) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` decimal(10,0) DEFAULT NULL,
  `pago_estado` tinyint(4) DEFAULT NULL,
  `envio_estado` int(11) DEFAULT NULL,
  `registrado_por` varchar(255) DEFAULT NULL,
  `recepcionado_por` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `envio`
--

INSERT INTO `envio` (`id_envio`, `numero_reg`, `id_remitente`, `id_receptor`, `fecha_salida`, `fecha_recojo`, `desde_distrito`, `desde_direccion`, `hasta_distrito`, `hasta_direccion`, `cantidad`, `descripcion`, `precio`, `pago_estado`, `envio_estado`, `registrado_por`, `recepcionado_por`) VALUES
(1, '1001', 1, 2, '2024-10-13 00:00:00', '0000-00-00 00:00:00', 4, 'AVENIDA VASQUES', 3, 'TERMINAL DE BUSES', '21', 'CAJAS CON CEREALES + SOBRE', 200, 1, 2, 'Osca', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_envio`
--

CREATE TABLE `estado_envio` (
  `id_estado_envio` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `estado_envio`
--

INSERT INTO `estado_envio` (`id_estado_envio`, `nombre`) VALUES
(1, 'recepcionado'),
(2, 'en transito'),
(3, 'en destino'),
(4, 'entregado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provincias`
--

CREATE TABLE `provincias` (
  `idProv` int(11) NOT NULL,
  `Provincia` varchar(50) NOT NULL,
  `idDepa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `provincias`
--

INSERT INTO `provincias` (`idProv`, `Provincia`, `idDepa`) VALUES
(1, 'MURILLO', 1),
(2, 'ANDREZ IBAÑES', 3),
(3, 'COCHABAMBA', 2),
(4, 'ORURO', 4),
(5, 'TARIJA', 5),
(6, 'POTOSI', 6),
(7, 'OROPEZA', 7),
(8, 'CERCADO', 8),
(9, 'NICOLAS SUAREZ', 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `receptor`
--

CREATE TABLE `receptor` (
  `id_receptor` int(11) NOT NULL,
  `dni` varchar(255) DEFAULT NULL,
  `nombre_razon_social` varchar(255) DEFAULT NULL,
  `departamento` int(11) DEFAULT NULL,
  `provincia` int(11) DEFAULT NULL,
  `distrito` int(11) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `receptor`
--

INSERT INTO `receptor` (`id_receptor`, `dni`, `nombre_razon_social`, `departamento`, `provincia`, `distrito`, `direccion`, `telefono`) VALUES
(1, '9932483', 'OSCAR QUENALLATA', NULL, NULL, NULL, NULL, '64101250'),
(2, '1234567', 'PRUEBA', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `remitente`
--

CREATE TABLE `remitente` (
  `id_remitente` int(11) NOT NULL,
  `dni` varchar(255) DEFAULT NULL,
  `nombre_razon_social` varchar(255) DEFAULT NULL,
  `departamento` int(11) DEFAULT NULL,
  `provincia` int(11) DEFAULT NULL,
  `distrito` int(11) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `remitente`
--

INSERT INTO `remitente` (`id_remitente`, `dni`, `nombre_razon_social`, `departamento`, `provincia`, `distrito`, `direccion`, `telefono`) VALUES
(1, '9932483', 'OSCAR QUENALLATA', NULL, NULL, NULL, NULL, '64101250');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursal`
--

CREATE TABLE `sucursal` (
  `id_sucursal` int(11) NOT NULL,
  `distrito` int(11) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `sucursal`
--

INSERT INTO `sucursal` (`id_sucursal`, `distrito`, `nombre`, `direccion`, `telefono`) VALUES
(101, 4, 'LP - AV VASQUEZ', 'PURA PURA, AVENIDA VASQUEZ, N. 245', '75270926'),
(102, 1, 'EL ALTO - EXTERMINAL', 'AVENIDA 6 DE MARZO, CALLE 6, N. 1502', '68125018'),
(103, 2, 'SC - TERMINAL', 'FRENTE AL TERMINAL BIMODAL, N. 32', '69861349'),
(104, 3, 'COCHA - TERMINAL', 'FRENTE AL TERMINAL DE BUSES, N. 451', '65214152');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `id_sucursal` int(11) DEFAULT NULL,
  `usuario` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nombres` varchar(255) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `correo` varchar(255) DEFAULT NULL,
  `codigo` varchar(255) DEFAULT NULL,
  `foto` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `id_sucursal`, `usuario`, `password`, `nombres`, `telefono`, `correo`, `codigo`, `foto`) VALUES
(10, NULL, 'Admin', '21232f297a57a5a743894a0e4a801fc3', 'Osca', '64101250', 'asdfuwjx@gmail.com', '136524', '10.jpg'),
(11, 101, 'LPSECRETARIA', '0e985f62e0ca39a4ec735a448efedb96', 'JOEL MAMANI', '78459655', 'joel@gmail.com', NULL, ''),
(12, 102, 'PRUEBA1', '6f3dd08f42f7d02bd01d7fc43da631e7', 'PRUEBA1', '77777777', 'prueba@gmail.com', NULL, ''),
(13, 103, 'PRUEBA2', '6e2b0f7188747c931fafd01c9843640a', 'PRUEBA2', '77777777', 'prueba2@gmail.com', NULL, ''),
(14, 104, 'PRUEBA3', 'd7b7bdacf5101ac0b1371bd0f0c8d51b', 'PRUEBA3', '77777777', 'prueba3@gmail.com', NULL, '');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`idDepa`);

--
-- Indices de la tabla `distritos`
--
ALTER TABLE `distritos`
  ADD PRIMARY KEY (`idDist`),
  ADD KEY `FK_idProv_Dist` (`idProv`);

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`id_empresa`);

--
-- Indices de la tabla `envio`
--
ALTER TABLE `envio`
  ADD PRIMARY KEY (`id_envio`),
  ADD KEY `fk1` (`id_remitente`),
  ADD KEY `fk2` (`id_receptor`),
  ADD KEY `fk3` (`desde_distrito`),
  ADD KEY `fk4` (`hasta_distrito`),
  ADD KEY `fk5` (`envio_estado`);

--
-- Indices de la tabla `estado_envio`
--
ALTER TABLE `estado_envio`
  ADD PRIMARY KEY (`id_estado_envio`);

--
-- Indices de la tabla `provincias`
--
ALTER TABLE `provincias`
  ADD PRIMARY KEY (`idProv`),
  ADD KEY `FK_idDepa_Prov` (`idDepa`);

--
-- Indices de la tabla `receptor`
--
ALTER TABLE `receptor`
  ADD PRIMARY KEY (`id_receptor`);

--
-- Indices de la tabla `remitente`
--
ALTER TABLE `remitente`
  ADD PRIMARY KEY (`id_remitente`);

--
-- Indices de la tabla `sucursal`
--
ALTER TABLE `sucursal`
  ADD PRIMARY KEY (`id_sucursal`),
  ADD KEY `fk` (`distrito`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `fk7` (`id_sucursal`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  MODIFY `idDepa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `distritos`
--
ALTER TABLE `distritos`
  MODIFY `idDist` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `empresa`
--
ALTER TABLE `empresa`
  MODIFY `id_empresa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `envio`
--
ALTER TABLE `envio`
  MODIFY `id_envio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `estado_envio`
--
ALTER TABLE `estado_envio`
  MODIFY `id_estado_envio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `provincias`
--
ALTER TABLE `provincias`
  MODIFY `idProv` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `receptor`
--
ALTER TABLE `receptor`
  MODIFY `id_receptor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `remitente`
--
ALTER TABLE `remitente`
  MODIFY `id_remitente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT de la tabla `sucursal`
--
ALTER TABLE `sucursal`
  MODIFY `id_sucursal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `distritos`
--
ALTER TABLE `distritos`
  ADD CONSTRAINT `distritos_ibfk_1` FOREIGN KEY (`idProv`) REFERENCES `provincias` (`idProv`);

--
-- Filtros para la tabla `envio`
--
ALTER TABLE `envio`
  ADD CONSTRAINT `fk1` FOREIGN KEY (`id_remitente`) REFERENCES `remitente` (`id_remitente`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk2` FOREIGN KEY (`id_receptor`) REFERENCES `receptor` (`id_receptor`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk3` FOREIGN KEY (`desde_distrito`) REFERENCES `distritos` (`idDist`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk4` FOREIGN KEY (`hasta_distrito`) REFERENCES `distritos` (`idDist`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk5` FOREIGN KEY (`envio_estado`) REFERENCES `estado_envio` (`id_estado_envio`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `provincias`
--
ALTER TABLE `provincias`
  ADD CONSTRAINT `provincias_ibfk_1` FOREIGN KEY (`idDepa`) REFERENCES `departamentos` (`idDepa`);

--
-- Filtros para la tabla `sucursal`
--
ALTER TABLE `sucursal`
  ADD CONSTRAINT `fk` FOREIGN KEY (`distrito`) REFERENCES `distritos` (`idDist`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk7` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursal` (`id_sucursal`) ON DELETE SET NULL ON UPDATE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
