-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-01-2024 a las 03:22:58
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ventas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caja`
--

CREATE TABLE `caja` (
  `caja_id` int(5) NOT NULL,
  `caja_numero` int(5) NOT NULL,
  `caja_nombre` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `caja_efectivo` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `caja`
--

INSERT INTO `caja` (`caja_id`, `caja_numero`, `caja_nombre`, `caja_efectivo`) VALUES
(1, 1, 'Caja Principal', 1665000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `categoria_id` int(7) NOT NULL,
  `categoria_nombre` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `categoria_ubicacion` varchar(150) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`categoria_id`, `categoria_nombre`, `categoria_ubicacion`) VALUES
(1, 'Amortiguadores', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `cliente_id` int(10) NOT NULL,
  `cliente_tipo_documento` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `cliente_numero_documento` varchar(35) COLLATE utf8_spanish2_ci NOT NULL,
  `cliente_nombre` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `cliente_apellido` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `cliente_provincia` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `cliente_ciudad` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `cliente_direccion` varchar(70) COLLATE utf8_spanish2_ci NOT NULL,
  `cliente_tipo_cliente` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `cliente_telefono` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `cliente_email` varchar(50) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`cliente_id`, `cliente_tipo_documento`, `cliente_numero_documento`, `cliente_nombre`, `cliente_apellido`, `cliente_provincia`, `cliente_ciudad`, `cliente_direccion`, `cliente_tipo_cliente`, `cliente_telefono`, `cliente_email`) VALUES
(1, 'Otro', 'N/A', 'Publico', 'General', 'N/A', 'N/A', 'N/A', 'Comun', 'N/A', 'N/A'),
(2, 'CC', '52026759', 'CLAUDA', 'PELAEZ', 'Risaralda', 'Pereira', 'Cra 11 # 34 - 14', 'Comun', '3203123214', 'claudiapelaez358@hotmail.com'),
(3, 'CC', '1005087', 'Yuliana', 'Ocampo', 'Risaralda', 'Pereira', 'Cra 11 # 33', 'Comun', '', ''),
(4, 'CC', '10100575', 'Sebastian', 'Aguirre', 'Risaralda', 'Pereira', 'Cra 11 # 33', 'Mayorista', '', 'gerencia@bltiendas.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE `empresa` (
  `empresa_id` int(11) NOT NULL,
  `empresa_nombre` varchar(90) COLLATE utf8_spanish2_ci NOT NULL,
  `empresa_telefono` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `empresa_email` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `empresa_direccion` varchar(100) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`empresa_id`, `empresa_nombre`, `empresa_telefono`, `empresa_email`, `empresa_direccion`) VALUES
(1, 'Pro Laps', '3217066338', 'hector.arenasya_88@hotmail.com', 'Carrera 8 # 15 - 20 Pereira R.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `producto_id` int(20) NOT NULL,
  `producto_codigo` varchar(77) COLLATE utf8_spanish2_ci NOT NULL,
  `producto_nombre` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `producto_talla` int(11) NOT NULL,
  `producto_stock_total` int(25) NOT NULL,
  `producto_tipo_unidad` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `producto_precio_compra` decimal(30,2) NOT NULL,
  `producto_precio_venta` decimal(30,2) NOT NULL,
  `producto_marca` varchar(35) COLLATE utf8_spanish2_ci NOT NULL,
  `producto_modelo` varchar(35) COLLATE utf8_spanish2_ci NOT NULL,
  `producto_estado` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `producto_foto` varchar(500) COLLATE utf8_spanish2_ci NOT NULL,
  `categoria_id` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`producto_id`, `producto_codigo`, `producto_nombre`, `producto_talla`, `producto_stock_total`, `producto_tipo_unidad`, `producto_precio_compra`, `producto_precio_venta`, `producto_marca`, `producto_modelo`, `producto_estado`, `producto_foto`, `categoria_id`) VALUES
(1, 'A001', 'Amortiguador trasero D-Max', 0, 4, 'Unidad', '150000.00', '230000.00', 'Udoshia', '0129', 'Habilitado', '', 1),
(2, 'A00111', 'Servicio cambio amortiguador', 0, 99996, 'Unidad', '100000.00', '100000.00', '', '', 'Habilitado', '', 1),
(3, '2312', 'Resorte', 37, 10, 'Unidad', '50000.00', '135000.00', '', '', 'Habilitado', '', 1),
(4, '2610', 'Tenis Jordan', 39, 3, 'Par', '50000.00', '80000.00', '', '', 'Habilitado', '', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `usuario_id` int(7) NOT NULL,
  `usuario_nombre` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `usuario_apellido` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `usuario_email` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `usuario_usuario` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `usuario_clave` varchar(535) COLLATE utf8_spanish2_ci NOT NULL,
  `usuario_foto` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `caja_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`usuario_id`, `usuario_nombre`, `usuario_apellido`, `usuario_email`, `usuario_usuario`, `usuario_clave`, `usuario_foto`, `caja_id`) VALUES
(1, 'Administrador', 'Principal', '', 'Administrador', '$2y$10$Jgm6xFb5Onz/BMdIkNK2Tur8yg/NYEMb/tdnhoV7kB1BwIG4R05D2', '', 1),
(2, 'Vendedor', 'Asesor', 'asesor1@mail.com', 'Asesor', '$2y$10$C93WKsSWDBLrsGFn4KhVmuHn9/AR4H0jbpf9G8APh44R0.xDdKmIW', '', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `venta_id` int(30) NOT NULL,
  `venta_codigo` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `venta_fecha` date NOT NULL,
  `venta_hora` varchar(17) COLLATE utf8_spanish2_ci NOT NULL,
  `venta_total` decimal(30,2) NOT NULL,
  `forma_pago` varchar(255) COLLATE utf8_spanish2_ci NOT NULL DEFAULT 'Efectivo',
  `venta_pagado` decimal(30,2) NOT NULL,
  `venta_descuento` decimal(30,2) NOT NULL,
  `venta_cambio` decimal(30,2) NOT NULL,
  `usuario_id` int(7) NOT NULL,
  `cliente_id` int(10) NOT NULL,
  `caja_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`venta_id`, `venta_codigo`, `venta_fecha`, `venta_hora`, `venta_total`, `forma_pago`, `venta_pagado`, `venta_descuento`, `venta_cambio`, `usuario_id`, `cliente_id`, `caja_id`) VALUES
(2, 'Y1B5G2V4L2-2', '2023-11-24', '10:27 pm', '560000.00', 'Efectivo', '600000.00', '10000.00', '50000.00', 1, 1, 1),
(3, 'R0C4Y8S8U4-3', '2024-01-24', '08:58 pm', '560000.00', 'Efectivo', '560000.00', '0.00', '0.00', 2, 1, 1),
(4, 'S4E5D3N0N9-4', '2024-01-26', '07:49 pm', '540000.00', 'Transferencia', '550000.00', '20000.00', '10000.00', 1, 4, 1),
(5, 'H7K4Z5O6A9-4', '2024-01-26', '10:40 pm', '365000.00', 'Efectivo', '370000.00', '0.00', '5000.00', 1, 1, 1),
(18, 'H5D5O7R2H9-5', '2024-01-29', '09:11 pm', '80000.00', 'Efectivo', '80000.00', '0.00', '0.00', 1, 4, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta_detalle`
--

CREATE TABLE `venta_detalle` (
  `venta_detalle_id` int(100) NOT NULL,
  `venta_detalle_cantidad` int(10) NOT NULL,
  `venta_detalle_precio_compra` decimal(30,2) NOT NULL,
  `venta_detalle_precio_venta` decimal(30,2) NOT NULL,
  `venta_detalle_total` decimal(30,2) NOT NULL,
  `venta_detalle_descripcion` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `venta_codigo` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `producto_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `venta_detalle`
--

INSERT INTO `venta_detalle` (`venta_detalle_id`, `venta_detalle_cantidad`, `venta_detalle_precio_compra`, `venta_detalle_precio_venta`, `venta_detalle_total`, `venta_detalle_descripcion`, `venta_codigo`, `producto_id`) VALUES
(2, 2, '150000.00', '230000.00', '460000.00', 'Amortiguador trasero D-Max', 'Y1B5G2V4L2-2', 1),
(3, 1, '100000.00', '100000.00', '100000.00', 'Servicio cambio amortiguador', 'Y1B5G2V4L2-2', 2),
(4, 1, '100000.00', '100000.00', '100000.00', 'Servicio cambio amortiguador', 'R0C4Y8S8U4-3', 2),
(5, 2, '150000.00', '230000.00', '460000.00', 'Amortiguador trasero D-Max', 'R0C4Y8S8U4-3', 1),
(6, 1, '100000.00', '100000.00', '100000.00', 'Servicio cambio amortiguador', 'S4E5D3N0N9-4', 2),
(7, 2, '150000.00', '230000.00', '460000.00', 'Amortiguador trasero D-Max', 'S4E5D3N0N9-4', 1),
(8, 1, '50000.00', '135000.00', '135000.00', 'Resorte', 'H7K4Z5O6A9-4', 3),
(9, 1, '150000.00', '230000.00', '230000.00', 'Amortiguador trasero D-Max', 'H7K4Z5O6A9-4', 1),
(23, 1, '50000.00', '80000.00', '80000.00', 'Tenis Jordan Talla 39', 'H5D5O7R2H9-5', 4);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `caja`
--
ALTER TABLE `caja`
  ADD PRIMARY KEY (`caja_id`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`categoria_id`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cliente_id`);

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`empresa_id`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`producto_id`),
  ADD KEY `categoria_id` (`categoria_id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`usuario_id`),
  ADD KEY `caja_id` (`caja_id`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`venta_id`),
  ADD UNIQUE KEY `venta_codigo` (`venta_codigo`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `cliente_id` (`cliente_id`),
  ADD KEY `caja_id` (`caja_id`);

--
-- Indices de la tabla `venta_detalle`
--
ALTER TABLE `venta_detalle`
  ADD PRIMARY KEY (`venta_detalle_id`),
  ADD KEY `venta_id` (`venta_codigo`),
  ADD KEY `producto_id` (`producto_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `caja`
--
ALTER TABLE `caja`
  MODIFY `caja_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `categoria_id` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `cliente_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `empresa`
--
ALTER TABLE `empresa`
  MODIFY `empresa_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `producto_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `usuario_id` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `venta_id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `venta_detalle`
--
ALTER TABLE `venta_detalle`
  MODIFY `venta_detalle_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`categoria_id`);

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`usuario_id`),
  ADD CONSTRAINT `venta_ibfk_2` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`cliente_id`),
  ADD CONSTRAINT `venta_ibfk_3` FOREIGN KEY (`caja_id`) REFERENCES `caja` (`caja_id`);

--
-- Filtros para la tabla `venta_detalle`
--
ALTER TABLE `venta_detalle`
  ADD CONSTRAINT `venta_detalle_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`producto_id`),
  ADD CONSTRAINT `venta_detalle_ibfk_3` FOREIGN KEY (`venta_codigo`) REFERENCES `venta` (`venta_codigo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
