-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 10-09-2024 a las 17:49:34
-- Versión del servidor: 5.7.44-cll-lve
-- Versión de PHP: 8.1.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `edicione_adriana`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Administradores`
--

CREATE TABLE `Administradores` (
  `Codigo` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Direccion` varchar(30) NOT NULL,
  `Telefono1` varchar(10) NOT NULL,
  `Telefono2` varchar(10) DEFAULT NULL,
  `Telefono3` varchar(10) DEFAULT NULL,
  `Cargo` varchar(20) NOT NULL,
  `Habilitado` smallint(6) DEFAULT '1',
  `UsuarioCreacion` varchar(30) NOT NULL DEFAULT 'ADMIN',
  `FechaCreacion` datetime NOT NULL,
  `UsuarioModificacion` varchar(30) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Clientes`
--

CREATE TABLE `Clientes` (
  `Codigo` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `TipoDocumento` int(11) NOT NULL,
  `Documento` varchar(15) NOT NULL,
  `Direccion` int(11) NOT NULL,
  `Telefono1` varchar(10) NOT NULL,
  `Telefono2` varchar(10) DEFAULT NULL,
  `Telefono3` varchar(10) DEFAULT NULL,
  `Estado` int(11) NOT NULL,
  `Observaciones` varchar(5000) DEFAULT NULL,
  `Habilitado` smallint(6) DEFAULT '1',
  `UsuarioCreacion` varchar(30) NOT NULL DEFAULT 'ADMIN',
  `FechaCreacion` datetime NOT NULL,
  `UsuarioModificacion` varchar(30) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ClientesUsuarios`
--

CREATE TABLE `ClientesUsuarios` (
  `Codigo` int(11) NOT NULL,
  `Usuario` int(11) NOT NULL,
  `Cliente` int(11) NOT NULL,
  `Habilitado` smallint(6) DEFAULT '1',
  `UsuarioCreacion` varchar(30) NOT NULL DEFAULT 'ADMIN',
  `FechaCreacion` datetime NOT NULL,
  `UsuarioModificacion` varchar(30) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Cobradores`
--

CREATE TABLE `Cobradores` (
  `Codigo` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `TipoDocumento` int(11) NOT NULL,
  `Documento` varchar(15) NOT NULL,
  `Direccion` varchar(150) NOT NULL,
  `Telefono1` varchar(10) NOT NULL,
  `Telefono2` varchar(10) DEFAULT NULL,
  `Correo` varchar(100) DEFAULT NULL,
  `Estado` int(11) NOT NULL,
  `Habilitado` smallint(6) DEFAULT '1',
  `UsuarioCreacion` varchar(30) NOT NULL DEFAULT 'ADMIN',
  `FechaCreacion` datetime NOT NULL,
  `UsuarioModificacion` varchar(30) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Devoluciones`
--

CREATE TABLE `Devoluciones` (
  `Codigo` int(11) NOT NULL,
  `Pedido` int(11) NOT NULL,
  `Cliente` int(11) NOT NULL,
  `Saldo` int(11) NOT NULL,
  `Cuota` int(11) NOT NULL,
  `Tipo` varchar(50) DEFAULT NULL,
  `ValorDevol` int(11) DEFAULT NULL,
  `Cobrador` int(11) NOT NULL,
  `Observaciones` varchar(5000) DEFAULT NULL,
  `UsuarioCreacion` varchar(30) NOT NULL DEFAULT 'ADMIN',
  `FechaCreacion` datetime NOT NULL,
  `UsuarioModificacion` varchar(30) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `DevolucionLlamadas`
--

CREATE TABLE `DevolucionLlamadas` (
  `Codigo` int(11) NOT NULL,
  `Pedido` int(11) NOT NULL,
  `Cliente` int(11) NOT NULL,
  `Fecha` datetime NOT NULL,
  `Motivo` int(11) DEFAULT NULL,
  `FechaProgramada` datetime DEFAULT NULL,
  `Devolucion` int(11) DEFAULT '0',
  `Observaciones` varchar(5000) DEFAULT NULL,
  `UsuarioCreacion` varchar(30) NOT NULL DEFAULT 'ADMIN',
  `FechaCreacion` datetime NOT NULL,
  `UsuarioModificacion` varchar(30) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Direcciones`
--

CREATE TABLE `Direcciones` (
  `Codigo` int(11) NOT NULL,
  `Direccion` varchar(150) NOT NULL,
  `Etapa` varchar(10) NOT NULL,
  `Torre` varchar(10) NOT NULL,
  `Apartamento` varchar(10) NOT NULL,
  `Manzana` varchar(10) NOT NULL,
  `Interior` varchar(10) NOT NULL,
  `Casa` varchar(10) NOT NULL,
  `Barrio` varchar(30) NOT NULL,
  `TipoVivienda` int(11) NOT NULL,
  `Habilitado` smallint(6) DEFAULT '1',
  `UsuarioCreacion` varchar(30) NOT NULL DEFAULT 'ADMIN',
  `FechaCreacion` datetime NOT NULL,
  `UsuarioModificacion` varchar(30) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Estados`
--

CREATE TABLE `Estados` (
  `Codigo` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `TipoEstado` int(11) NOT NULL,
  `Habilitado` smallint(6) DEFAULT '1',
  `UsuarioCreacion` varchar(30) NOT NULL DEFAULT 'ADMIN',
  `FechaCreacion` datetime NOT NULL,
  `UsuarioModificacion` varchar(30) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Eventos`
--

CREATE TABLE `Eventos` (
  `Codigo` int(11) NOT NULL,
  `Vendedor` int(11) NOT NULL,
  `Iglesia` varchar(50) NOT NULL,
  `Barrio` varchar(50) NOT NULL,
  `Fecha` datetime NOT NULL,
  `Habilitado` smallint(6) DEFAULT '1',
  `UsuarioCreacion` varchar(30) NOT NULL DEFAULT 'ADMIN',
  `FechaCreacion` datetime NOT NULL,
  `UsuarioModificacion` varchar(30) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `HistorialPagos`
--

CREATE TABLE `HistorialPagos` (
  `Codigo` int(11) NOT NULL,
  `Pedido` int(11) NOT NULL,
  `Cliente` int(11) NOT NULL,
  `FechaHistorial` datetime NOT NULL,
  `Accion` varchar(50) NOT NULL,
  `SaldoAnterior` int(11) NOT NULL,
  `Cuota` int(11) NOT NULL,
  `Abono` int(11) NOT NULL,
  `SaldoNuevo` int(11) NOT NULL,
  `Observaciones` varchar(5000) DEFAULT NULL,
  `UsuarioCreacion` varchar(30) NOT NULL DEFAULT 'ADMIN',
  `FechaCreacion` datetime NOT NULL,
  `UsuarioModificacion` varchar(30) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Llamadas`
--

CREATE TABLE `Llamadas` (
  `Codigo` int(11) NOT NULL,
  `Pedido` int(11) NOT NULL,
  `Cliente` int(11) NOT NULL,
  `Fecha` datetime NOT NULL,
  `Motivo` int(11) NOT NULL,
  `FechaProgramada` datetime DEFAULT NULL,
  `Devolucion` int(11) DEFAULT '0',
  `Habilitado` smallint(6) DEFAULT NULL,
  `Observaciones` varchar(5000) DEFAULT NULL,
  `UsuarioCreacion` varchar(30) NOT NULL DEFAULT 'ADMIN',
  `FechaCreacion` datetime NOT NULL,
  `UsuarioModificacion` varchar(30) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Log`
--

CREATE TABLE `Log` (
  `Codigo` int(11) NOT NULL,
  `Modulo` varchar(50) NOT NULL,
  `Tabla` varchar(50) NOT NULL,
  `CodUsuario` int(11) NOT NULL,
  `Usuario` varchar(30) NOT NULL,
  `Fecha` datetime NOT NULL,
  `Accion` varchar(50) NOT NULL,
  `Llave` int(11) NOT NULL,
  `Datos` varchar(5000) DEFAULT NULL,
  `Observaciones` varchar(5000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `LogAccesosDenegados`
--

CREATE TABLE `LogAccesosDenegados` (
  `Codigo` int(11) NOT NULL,
  `Modulo` varchar(100) NOT NULL,
  `Usuario` varchar(30) NOT NULL,
  `Fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `MotivosLlamadas`
--

CREATE TABLE `MotivosLlamadas` (
  `Codigo` int(11) NOT NULL,
  `Nombre` varchar(30) NOT NULL,
  `Color` varchar(30) NOT NULL,
  `Habilitado` smallint(6) DEFAULT '1',
  `UsuarioCreacion` varchar(30) NOT NULL DEFAULT 'ADMIN',
  `FechaCreacion` datetime NOT NULL,
  `UsuarioModificacion` varchar(30) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Pagos`
--

CREATE TABLE `Pagos` (
  `Codigo` int(11) NOT NULL,
  `Cliente` int(11) NOT NULL,
  `Pedido` int(11) NOT NULL,
  `Cuota` int(11) NOT NULL,
  `Pago` int(11) NOT NULL,
  `Confirmacion` int(11) DEFAULT NULL,
  `FechaPago` datetime NOT NULL,
  `TotalPago` int(11) NOT NULL,
  `Cobrador` int(11) DEFAULT NULL,
  `Observaciones` varchar(5000) DEFAULT NULL,
  `Habilitado` smallint(6) DEFAULT '1',
  `UsuarioCreacion` varchar(30) NOT NULL DEFAULT 'ADMIN',
  `FechaCreacion` datetime NOT NULL,
  `UsuarioModificacion` varchar(30) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `PagosProgramados`
--

CREATE TABLE `PagosProgramados` (
  `Codigo` int(11) NOT NULL,
  `Pedido` int(11) NOT NULL,
  `Cuota` int(11) NOT NULL,
  `FechaProgramada` datetime NOT NULL,
  `Estado` int(11) NOT NULL,
  `Copias` int(11) NOT NULL DEFAULT '0',
  `FechaImpresion` datetime DEFAULT NULL,
  `Observaciones` varchar(5000) DEFAULT NULL,
  `Habilitado` smallint(6) DEFAULT '1',
  `UsuarioCreacion` varchar(30) NOT NULL DEFAULT 'ADMIN',
  `FechaCreacion` datetime NOT NULL,
  `UsuarioModificacion` varchar(30) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Pedidos`
--

CREATE TABLE `Pedidos` (
  `Codigo` int(11) NOT NULL,
  `Cliente` int(11) NOT NULL,
  `Valor` int(11) NOT NULL,
  `Tarifa` int(11) DEFAULT NULL,
  `DiaCobro` datetime DEFAULT NULL,
  `Estado` int(11) NOT NULL,
  `Evento` int(11) NOT NULL,
  `Vendedor` int(11) NOT NULL,
  `FechaPedido` datetime NOT NULL,
  `Saldo` int(11) DEFAULT NULL,
  `FechaUltimoPago` datetime DEFAULT NULL,
  `PaginaFisica` varchar(20) NOT NULL,
  `Observaciones` varchar(5000) DEFAULT NULL,
  `Habilitado` smallint(6) DEFAULT '1',
  `UsuarioCreacion` varchar(30) NOT NULL DEFAULT 'ADMIN',
  `FechaCreacion` datetime NOT NULL,
  `UsuarioModificacion` varchar(30) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Perfiles`
--

CREATE TABLE `Perfiles` (
  `Codigo` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Habilitado` smallint(6) DEFAULT '1',
  `UsuarioCreacion` varchar(30) NOT NULL DEFAULT 'ADMIN',
  `FechaCreacion` datetime NOT NULL,
  `UsuarioModificacion` varchar(30) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Permisos`
--

CREATE TABLE `Permisos` (
  `Codigo` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Tipo` int(11) NOT NULL,
  `Controlador` varchar(50) NOT NULL,
  `Habilitado` smallint(6) DEFAULT '1',
  `UsuarioCreacion` varchar(30) NOT NULL DEFAULT 'ADMIN',
  `FechaCreacion` datetime NOT NULL,
  `UsuarioModificacion` varchar(30) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `PermisosUsuarios`
--

CREATE TABLE `PermisosUsuarios` (
  `Codigo` int(11) NOT NULL,
  `Permiso` int(11) NOT NULL,
  `Usuario` int(11) NOT NULL,
  `Habilitado` smallint(6) DEFAULT '1',
  `UsuarioCreacion` varchar(30) NOT NULL DEFAULT 'ADMIN',
  `FechaCreacion` datetime NOT NULL,
  `UsuarioModificacion` varchar(30) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Productos`
--

CREATE TABLE `Productos` (
  `Codigo` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Valor` int(11) NOT NULL,
  `Habilitado` smallint(6) DEFAULT '1',
  `UsuarioCreacion` varchar(30) NOT NULL DEFAULT 'ADMIN',
  `FechaCreacion` datetime NOT NULL,
  `UsuarioModificacion` varchar(30) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ProductosPedidos`
--

CREATE TABLE `ProductosPedidos` (
  `Codigo` int(11) NOT NULL,
  `Pedido` int(11) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `Producto` int(11) NOT NULL,
  `Valor` int(11) NOT NULL,
  `Habilitado` smallint(6) DEFAULT '1',
  `UsuarioCreacion` varchar(30) NOT NULL DEFAULT 'ADMIN',
  `FechaCreacion` datetime NOT NULL,
  `UsuarioModificacion` varchar(30) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Referencias`
--

CREATE TABLE `Referencias` (
  `Codigo` int(11) NOT NULL,
  `Nombres` varchar(50) NOT NULL,
  `Telefono` varchar(30) NOT NULL,
  `Parentesco` varchar(20) NOT NULL,
  `Habilitado` smallint(6) DEFAULT '1',
  `UsuarioCreacion` varchar(30) NOT NULL DEFAULT 'ADMIN',
  `FechaCreacion` datetime NOT NULL,
  `UsuarioModificacion` varchar(30) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ReferenciasCliente`
--

CREATE TABLE `ReferenciasCliente` (
  `Codigo` int(11) NOT NULL,
  `Cliente` int(11) NOT NULL,
  `Referencia` int(11) NOT NULL,
  `Habilitado` smallint(6) DEFAULT '1',
  `UsuarioCreacion` varchar(30) NOT NULL DEFAULT 'ADMIN',
  `FechaCreacion` datetime NOT NULL,
  `UsuarioModificacion` varchar(30) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `SuperUsuarios`
--

CREATE TABLE `SuperUsuarios` (
  `Codigo` int(11) NOT NULL,
  `Usuario` varchar(30) NOT NULL,
  `Habilitado` smallint(6) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Tarifas`
--

CREATE TABLE `Tarifas` (
  `Codigo` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Producto` int(11) NOT NULL,
  `Valor` int(11) NOT NULL,
  `Cuotas` int(11) NOT NULL,
  `ValorCuota` int(11) NOT NULL,
  `Descuento` int(11) NOT NULL,
  `Habilitado` smallint(6) DEFAULT '1',
  `UsuarioCreacion` varchar(30) NOT NULL DEFAULT 'ADMIN',
  `FechaCreacion` datetime NOT NULL,
  `UsuarioModificacion` varchar(30) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TiposDocumentos`
--

CREATE TABLE `TiposDocumentos` (
  `Codigo` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Nemonico` varchar(5) NOT NULL,
  `Habilitado` smallint(6) DEFAULT '1',
  `UsuarioCreacion` varchar(30) NOT NULL DEFAULT 'ADMIN',
  `FechaCreacion` datetime NOT NULL,
  `UsuarioModificacion` varchar(30) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TiposEstados`
--

CREATE TABLE `TiposEstados` (
  `Codigo` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Habilitado` smallint(6) DEFAULT '1',
  `UsuarioCreacion` varchar(30) NOT NULL DEFAULT 'ADMIN',
  `FechaCreacion` datetime NOT NULL,
  `UsuarioModificacion` varchar(30) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TiposPermisos`
--

CREATE TABLE `TiposPermisos` (
  `Codigo` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Habilitado` smallint(6) DEFAULT '1',
  `UsuarioCreacion` varchar(30) NOT NULL DEFAULT 'ADMIN',
  `FechaCreacion` datetime NOT NULL,
  `UsuarioModificacion` varchar(30) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TiposViviendas`
--

CREATE TABLE `TiposViviendas` (
  `Codigo` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Habilitado` smallint(6) DEFAULT '1',
  `UsuarioCreacion` varchar(30) NOT NULL DEFAULT 'ADMIN',
  `FechaCreacion` datetime NOT NULL,
  `UsuarioModificacion` varchar(30) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Usuarios`
--

CREATE TABLE `Usuarios` (
  `Codigo` int(11) NOT NULL,
  `Usuario` varchar(30) NOT NULL,
  `Pass` varchar(100) NOT NULL,
  `Salt` varchar(100) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `TipoDocumento` int(11) NOT NULL,
  `Documento` varchar(15) NOT NULL,
  `Perfil` int(11) NOT NULL,
  `Administrador` int(11) NOT NULL,
  `Estado` int(11) NOT NULL,
  `CambioPass` smallint(6) DEFAULT '0',
  `Habilitado` smallint(6) DEFAULT '1',
  `UsuarioCreacion` varchar(30) NOT NULL DEFAULT 'ADMIN',
  `FechaCreacion` datetime NOT NULL,
  `UsuarioModificacion` varchar(30) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ValidacionDeudas`
--

CREATE TABLE `ValidacionDeudas` (
  `Codigo` int(11) NOT NULL,
  `Pedido` int(11) NOT NULL,
  `Cliente` int(11) NOT NULL,
  `FechaValidacion` datetime NOT NULL,
  `Dias` int(11) NOT NULL,
  `Estado` varchar(50) NOT NULL,
  `Observaciones` varchar(5000) DEFAULT NULL,
  `UsuarioCreacion` varchar(30) NOT NULL DEFAULT 'ADMIN',
  `FechaCreacion` datetime NOT NULL,
  `UsuarioModificacion` varchar(30) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Vendedores`
--

CREATE TABLE `Vendedores` (
  `Codigo` int(11) NOT NULL,
  `Usuario` varchar(30) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Estado` int(11) NOT NULL,
  `Habilitado` smallint(6) DEFAULT '1',
  `UsuarioCreacion` varchar(30) NOT NULL DEFAULT 'ADMIN',
  `FechaCreacion` datetime NOT NULL,
  `UsuarioModificacion` varchar(30) DEFAULT NULL,
  `FechaModificacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Administradores`
--
ALTER TABLE `Administradores`
  ADD PRIMARY KEY (`Codigo`);

--
-- Indices de la tabla `Clientes`
--
ALTER TABLE `Clientes`
  ADD PRIMARY KEY (`Codigo`),
  ADD KEY `FK_TipDoc_Cli` (`TipoDocumento`),
  ADD KEY `FK_Est_Cli` (`Estado`),
  ADD KEY `FK_Dir_Cli` (`Direccion`);

--
-- Indices de la tabla `ClientesUsuarios`
--
ALTER TABLE `ClientesUsuarios`
  ADD PRIMARY KEY (`Codigo`),
  ADD KEY `FK_Usu_CliUsu` (`Usuario`),
  ADD KEY `FK_Cli_CliUsu` (`Cliente`);

--
-- Indices de la tabla `Cobradores`
--
ALTER TABLE `Cobradores`
  ADD PRIMARY KEY (`Codigo`),
  ADD KEY `FK_Est_Cobr` (`Estado`),
  ADD KEY `FK_TipDoc_Cobr` (`TipoDocumento`);

--
-- Indices de la tabla `Devoluciones`
--
ALTER TABLE `Devoluciones`
  ADD PRIMARY KEY (`Codigo`),
  ADD KEY `FK_Ped_Devol` (`Pedido`),
  ADD KEY `FK_Cli_Devol` (`Cliente`),
  ADD KEY `FK_Cob_Devol` (`Cobrador`);

--
-- Indices de la tabla `DevolucionLlamadas`
--
ALTER TABLE `DevolucionLlamadas`
  ADD PRIMARY KEY (`Codigo`),
  ADD KEY `FK_Ped_DevLlam` (`Pedido`),
  ADD KEY `FK_Cli_DevLlam` (`Cliente`),
  ADD KEY `FK_MotLLamPro_DevLlam` (`Motivo`);

--
-- Indices de la tabla `Direcciones`
--
ALTER TABLE `Direcciones`
  ADD PRIMARY KEY (`Codigo`),
  ADD KEY `FK_TipViv_Dir` (`TipoVivienda`);

--
-- Indices de la tabla `Estados`
--
ALTER TABLE `Estados`
  ADD PRIMARY KEY (`Codigo`),
  ADD KEY `FK_TipEst_Est` (`TipoEstado`);

--
-- Indices de la tabla `Eventos`
--
ALTER TABLE `Eventos`
  ADD PRIMARY KEY (`Codigo`),
  ADD KEY `FK_Ven_Eve` (`Vendedor`);

--
-- Indices de la tabla `HistorialPagos`
--
ALTER TABLE `HistorialPagos`
  ADD PRIMARY KEY (`Codigo`),
  ADD KEY `FK_Ped_HisPag` (`Pedido`),
  ADD KEY `FK_Cli_HisPag` (`Cliente`);

--
-- Indices de la tabla `Llamadas`
--
ALTER TABLE `Llamadas`
  ADD PRIMARY KEY (`Codigo`),
  ADD KEY `FK_Ped_Llam` (`Pedido`),
  ADD KEY `FK_Cli_Llam` (`Cliente`),
  ADD KEY `FK_MotLLamPro_Llam` (`Motivo`);

--
-- Indices de la tabla `Log`
--
ALTER TABLE `Log`
  ADD PRIMARY KEY (`Codigo`),
  ADD KEY `FK_Usu_Log` (`CodUsuario`);

--
-- Indices de la tabla `LogAccesosDenegados`
--
ALTER TABLE `LogAccesosDenegados`
  ADD PRIMARY KEY (`Codigo`);

--
-- Indices de la tabla `MotivosLlamadas`
--
ALTER TABLE `MotivosLlamadas`
  ADD PRIMARY KEY (`Codigo`);

--
-- Indices de la tabla `Pagos`
--
ALTER TABLE `Pagos`
  ADD PRIMARY KEY (`Codigo`),
  ADD KEY `FK_Cli_Pag` (`Cliente`),
  ADD KEY `FK_Ped_Pag` (`Pedido`),
  ADD KEY `FK_PagProg_Pag` (`Confirmacion`),
  ADD KEY `FK_Cobr_Pag` (`Cobrador`);

--
-- Indices de la tabla `PagosProgramados`
--
ALTER TABLE `PagosProgramados`
  ADD PRIMARY KEY (`Codigo`),
  ADD KEY `FK_Ped_PagProg` (`Pedido`),
  ADD KEY `FK_Est_PagProg` (`Estado`);

--
-- Indices de la tabla `Pedidos`
--
ALTER TABLE `Pedidos`
  ADD PRIMARY KEY (`Codigo`),
  ADD KEY `FK_Cli_Ped` (`Cliente`),
  ADD KEY `FK_Est_Ped` (`Estado`),
  ADD KEY `FK_Tar_Ped` (`Tarifa`),
  ADD KEY `FK_Ven_Ped` (`Vendedor`),
  ADD KEY `FK_Eve_Ped` (`Evento`);

--
-- Indices de la tabla `Perfiles`
--
ALTER TABLE `Perfiles`
  ADD PRIMARY KEY (`Codigo`);

--
-- Indices de la tabla `Permisos`
--
ALTER TABLE `Permisos`
  ADD PRIMARY KEY (`Codigo`),
  ADD KEY `FK_TipPer_Per` (`Tipo`);

--
-- Indices de la tabla `PermisosUsuarios`
--
ALTER TABLE `PermisosUsuarios`
  ADD PRIMARY KEY (`Codigo`),
  ADD KEY `FK_Per_PerUsu` (`Permiso`),
  ADD KEY `FK_Usu_PerUsu` (`Usuario`);

--
-- Indices de la tabla `Productos`
--
ALTER TABLE `Productos`
  ADD PRIMARY KEY (`Codigo`);

--
-- Indices de la tabla `ProductosPedidos`
--
ALTER TABLE `ProductosPedidos`
  ADD PRIMARY KEY (`Codigo`),
  ADD KEY `FK_Ped_ProPed` (`Pedido`),
  ADD KEY `FK_Pro_ProPed` (`Producto`);

--
-- Indices de la tabla `Referencias`
--
ALTER TABLE `Referencias`
  ADD PRIMARY KEY (`Codigo`);

--
-- Indices de la tabla `ReferenciasCliente`
--
ALTER TABLE `ReferenciasCliente`
  ADD PRIMARY KEY (`Codigo`),
  ADD KEY `FK_Cli_RefCli` (`Cliente`),
  ADD KEY `FK_Ref_RefCli` (`Referencia`);

--
-- Indices de la tabla `SuperUsuarios`
--
ALTER TABLE `SuperUsuarios`
  ADD PRIMARY KEY (`Codigo`),
  ADD UNIQUE KEY `Usuario` (`Usuario`);

--
-- Indices de la tabla `Tarifas`
--
ALTER TABLE `Tarifas`
  ADD PRIMARY KEY (`Codigo`),
  ADD KEY `FK_Pro_Tar` (`Producto`);

--
-- Indices de la tabla `TiposDocumentos`
--
ALTER TABLE `TiposDocumentos`
  ADD PRIMARY KEY (`Codigo`),
  ADD UNIQUE KEY `Nemonico` (`Nemonico`);

--
-- Indices de la tabla `TiposEstados`
--
ALTER TABLE `TiposEstados`
  ADD PRIMARY KEY (`Codigo`);

--
-- Indices de la tabla `TiposPermisos`
--
ALTER TABLE `TiposPermisos`
  ADD PRIMARY KEY (`Codigo`);

--
-- Indices de la tabla `TiposViviendas`
--
ALTER TABLE `TiposViviendas`
  ADD PRIMARY KEY (`Codigo`);

--
-- Indices de la tabla `Usuarios`
--
ALTER TABLE `Usuarios`
  ADD PRIMARY KEY (`Codigo`),
  ADD UNIQUE KEY `Usuario` (`Usuario`),
  ADD KEY `FK_TipDoc_Usu` (`TipoDocumento`),
  ADD KEY `FK_Est_Usu` (`Estado`),
  ADD KEY `FK_Per_Usu` (`Perfil`),
  ADD KEY `FK_Adm_Usu` (`Administrador`);

--
-- Indices de la tabla `ValidacionDeudas`
--
ALTER TABLE `ValidacionDeudas`
  ADD PRIMARY KEY (`Codigo`),
  ADD KEY `FK_Ped_ValDeu` (`Pedido`),
  ADD KEY `FK_Cli_ValDeu` (`Cliente`);

--
-- Indices de la tabla `Vendedores`
--
ALTER TABLE `Vendedores`
  ADD PRIMARY KEY (`Codigo`),
  ADD KEY `FK_Est_Ven` (`Estado`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `Administradores`
--
ALTER TABLE `Administradores`
  MODIFY `Codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Clientes`
--
ALTER TABLE `Clientes`
  MODIFY `Codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ClientesUsuarios`
--
ALTER TABLE `ClientesUsuarios`
  MODIFY `Codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Cobradores`
--
ALTER TABLE `Cobradores`
  MODIFY `Codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Devoluciones`
--
ALTER TABLE `Devoluciones`
  MODIFY `Codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `DevolucionLlamadas`
--
ALTER TABLE `DevolucionLlamadas`
  MODIFY `Codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Direcciones`
--
ALTER TABLE `Direcciones`
  MODIFY `Codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Estados`
--
ALTER TABLE `Estados`
  MODIFY `Codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Eventos`
--
ALTER TABLE `Eventos`
  MODIFY `Codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `HistorialPagos`
--
ALTER TABLE `HistorialPagos`
  MODIFY `Codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Llamadas`
--
ALTER TABLE `Llamadas`
  MODIFY `Codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Log`
--
ALTER TABLE `Log`
  MODIFY `Codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `LogAccesosDenegados`
--
ALTER TABLE `LogAccesosDenegados`
  MODIFY `Codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `MotivosLlamadas`
--
ALTER TABLE `MotivosLlamadas`
  MODIFY `Codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Pagos`
--
ALTER TABLE `Pagos`
  MODIFY `Codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `PagosProgramados`
--
ALTER TABLE `PagosProgramados`
  MODIFY `Codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Pedidos`
--
ALTER TABLE `Pedidos`
  MODIFY `Codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Perfiles`
--
ALTER TABLE `Perfiles`
  MODIFY `Codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Permisos`
--
ALTER TABLE `Permisos`
  MODIFY `Codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `PermisosUsuarios`
--
ALTER TABLE `PermisosUsuarios`
  MODIFY `Codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Productos`
--
ALTER TABLE `Productos`
  MODIFY `Codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ProductosPedidos`
--
ALTER TABLE `ProductosPedidos`
  MODIFY `Codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Referencias`
--
ALTER TABLE `Referencias`
  MODIFY `Codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ReferenciasCliente`
--
ALTER TABLE `ReferenciasCliente`
  MODIFY `Codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `SuperUsuarios`
--
ALTER TABLE `SuperUsuarios`
  MODIFY `Codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Tarifas`
--
ALTER TABLE `Tarifas`
  MODIFY `Codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `TiposDocumentos`
--
ALTER TABLE `TiposDocumentos`
  MODIFY `Codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `TiposEstados`
--
ALTER TABLE `TiposEstados`
  MODIFY `Codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `TiposPermisos`
--
ALTER TABLE `TiposPermisos`
  MODIFY `Codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `TiposViviendas`
--
ALTER TABLE `TiposViviendas`
  MODIFY `Codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Usuarios`
--
ALTER TABLE `Usuarios`
  MODIFY `Codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ValidacionDeudas`
--
ALTER TABLE `ValidacionDeudas`
  MODIFY `Codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Vendedores`
--
ALTER TABLE `Vendedores`
  MODIFY `Codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Clientes`
--
ALTER TABLE `Clientes`
  ADD CONSTRAINT `FK_Dir_Cli` FOREIGN KEY (`Direccion`) REFERENCES `Direcciones` (`Codigo`),
  ADD CONSTRAINT `FK_Est_Cli` FOREIGN KEY (`Estado`) REFERENCES `Estados` (`Codigo`),
  ADD CONSTRAINT `FK_TipDoc_Cli` FOREIGN KEY (`TipoDocumento`) REFERENCES `TiposDocumentos` (`Codigo`);

--
-- Filtros para la tabla `ClientesUsuarios`
--
ALTER TABLE `ClientesUsuarios`
  ADD CONSTRAINT `FK_Cli_CliUsu` FOREIGN KEY (`Cliente`) REFERENCES `Clientes` (`Codigo`),
  ADD CONSTRAINT `FK_Usu_CliUsu` FOREIGN KEY (`Usuario`) REFERENCES `Usuarios` (`Codigo`);

--
-- Filtros para la tabla `Cobradores`
--
ALTER TABLE `Cobradores`
  ADD CONSTRAINT `FK_Est_Cobr` FOREIGN KEY (`Estado`) REFERENCES `Estados` (`Codigo`),
  ADD CONSTRAINT `FK_TipDoc_Cobr` FOREIGN KEY (`TipoDocumento`) REFERENCES `TiposDocumentos` (`Codigo`);

--
-- Filtros para la tabla `Devoluciones`
--
ALTER TABLE `Devoluciones`
  ADD CONSTRAINT `FK_Cli_Devol` FOREIGN KEY (`Cliente`) REFERENCES `Clientes` (`Codigo`),
  ADD CONSTRAINT `FK_Cob_Devol` FOREIGN KEY (`Cobrador`) REFERENCES `Cobradores` (`Codigo`),
  ADD CONSTRAINT `FK_Ped_Devol` FOREIGN KEY (`Pedido`) REFERENCES `Pedidos` (`Codigo`);

--
-- Filtros para la tabla `DevolucionLlamadas`
--
ALTER TABLE `DevolucionLlamadas`
  ADD CONSTRAINT `FK_Cli_DevLlam` FOREIGN KEY (`Cliente`) REFERENCES `Clientes` (`Codigo`),
  ADD CONSTRAINT `FK_MotLLamPro_DevLlam` FOREIGN KEY (`Motivo`) REFERENCES `MotivosLlamadas` (`Codigo`),
  ADD CONSTRAINT `FK_MotLLam_DevLlam` FOREIGN KEY (`Motivo`) REFERENCES `MotivosLlamadas` (`Codigo`),
  ADD CONSTRAINT `FK_Ped_DevLlam` FOREIGN KEY (`Pedido`) REFERENCES `Pedidos` (`Codigo`);

--
-- Filtros para la tabla `Direcciones`
--
ALTER TABLE `Direcciones`
  ADD CONSTRAINT `FK_TipViv_Dir` FOREIGN KEY (`TipoVivienda`) REFERENCES `TiposViviendas` (`Codigo`);

--
-- Filtros para la tabla `Estados`
--
ALTER TABLE `Estados`
  ADD CONSTRAINT `FK_TipEst_Est` FOREIGN KEY (`TipoEstado`) REFERENCES `TiposEstados` (`Codigo`);

--
-- Filtros para la tabla `Eventos`
--
ALTER TABLE `Eventos`
  ADD CONSTRAINT `FK_Ven_Eve` FOREIGN KEY (`Vendedor`) REFERENCES `Vendedores` (`Codigo`);

--
-- Filtros para la tabla `HistorialPagos`
--
ALTER TABLE `HistorialPagos`
  ADD CONSTRAINT `FK_Cli_HisPag` FOREIGN KEY (`Cliente`) REFERENCES `Clientes` (`Codigo`),
  ADD CONSTRAINT `FK_Ped_HisPag` FOREIGN KEY (`Pedido`) REFERENCES `Pedidos` (`Codigo`);

--
-- Filtros para la tabla `Llamadas`
--
ALTER TABLE `Llamadas`
  ADD CONSTRAINT `FK_Cli_Llam` FOREIGN KEY (`Cliente`) REFERENCES `Clientes` (`Codigo`),
  ADD CONSTRAINT `FK_MotLLamPro_Llam` FOREIGN KEY (`Motivo`) REFERENCES `MotivosLlamadas` (`Codigo`),
  ADD CONSTRAINT `FK_MotLLam_Llam` FOREIGN KEY (`Motivo`) REFERENCES `MotivosLlamadas` (`Codigo`),
  ADD CONSTRAINT `FK_Ped_Llam` FOREIGN KEY (`Pedido`) REFERENCES `Pedidos` (`Codigo`);

--
-- Filtros para la tabla `Log`
--
ALTER TABLE `Log`
  ADD CONSTRAINT `FK_Usu_Log` FOREIGN KEY (`CodUsuario`) REFERENCES `Usuarios` (`Codigo`);

--
-- Filtros para la tabla `Pagos`
--
ALTER TABLE `Pagos`
  ADD CONSTRAINT `FK_Cli_Pag` FOREIGN KEY (`Cliente`) REFERENCES `Clientes` (`Codigo`),
  ADD CONSTRAINT `FK_Cobr_Pag` FOREIGN KEY (`Cobrador`) REFERENCES `Cobradores` (`Codigo`),
  ADD CONSTRAINT `FK_PagProg_Pag` FOREIGN KEY (`Confirmacion`) REFERENCES `PagosProgramados` (`Codigo`),
  ADD CONSTRAINT `FK_Ped_Pag` FOREIGN KEY (`Pedido`) REFERENCES `Pedidos` (`Codigo`);

--
-- Filtros para la tabla `PagosProgramados`
--
ALTER TABLE `PagosProgramados`
  ADD CONSTRAINT `FK_Est_PagProg` FOREIGN KEY (`Estado`) REFERENCES `Estados` (`Codigo`),
  ADD CONSTRAINT `FK_Ped_PagProg` FOREIGN KEY (`Pedido`) REFERENCES `Pedidos` (`Codigo`);

--
-- Filtros para la tabla `Pedidos`
--
ALTER TABLE `Pedidos`
  ADD CONSTRAINT `FK_Cli_Ped` FOREIGN KEY (`Cliente`) REFERENCES `Clientes` (`Codigo`),
  ADD CONSTRAINT `FK_Est_Ped` FOREIGN KEY (`Estado`) REFERENCES `Estados` (`Codigo`),
  ADD CONSTRAINT `FK_Eve_Ped` FOREIGN KEY (`Evento`) REFERENCES `Eventos` (`Codigo`),
  ADD CONSTRAINT `FK_Tar_Ped` FOREIGN KEY (`Tarifa`) REFERENCES `Tarifas` (`Codigo`),
  ADD CONSTRAINT `FK_Ven_Ped` FOREIGN KEY (`Vendedor`) REFERENCES `Vendedores` (`Codigo`);

--
-- Filtros para la tabla `Permisos`
--
ALTER TABLE `Permisos`
  ADD CONSTRAINT `FK_TipPer_Per` FOREIGN KEY (`Tipo`) REFERENCES `TiposPermisos` (`Codigo`);

--
-- Filtros para la tabla `PermisosUsuarios`
--
ALTER TABLE `PermisosUsuarios`
  ADD CONSTRAINT `FK_Per_PerUsu` FOREIGN KEY (`Permiso`) REFERENCES `Permisos` (`Codigo`),
  ADD CONSTRAINT `FK_Usu_PerUsu` FOREIGN KEY (`Usuario`) REFERENCES `Usuarios` (`Codigo`);

--
-- Filtros para la tabla `ProductosPedidos`
--
ALTER TABLE `ProductosPedidos`
  ADD CONSTRAINT `FK_Ped_ProPed` FOREIGN KEY (`Pedido`) REFERENCES `Pedidos` (`Codigo`),
  ADD CONSTRAINT `FK_Pro_ProPed` FOREIGN KEY (`Producto`) REFERENCES `Productos` (`Codigo`);

--
-- Filtros para la tabla `ReferenciasCliente`
--
ALTER TABLE `ReferenciasCliente`
  ADD CONSTRAINT `FK_Cli_RefCli` FOREIGN KEY (`Cliente`) REFERENCES `Clientes` (`Codigo`),
  ADD CONSTRAINT `FK_Ref_RefCli` FOREIGN KEY (`Referencia`) REFERENCES `Referencias` (`Codigo`);

--
-- Filtros para la tabla `Tarifas`
--
ALTER TABLE `Tarifas`
  ADD CONSTRAINT `FK_Pro_Tar` FOREIGN KEY (`Producto`) REFERENCES `Productos` (`Codigo`);

--
-- Filtros para la tabla `Usuarios`
--
ALTER TABLE `Usuarios`
  ADD CONSTRAINT `FK_Adm_Usu` FOREIGN KEY (`Administrador`) REFERENCES `Administradores` (`Codigo`),
  ADD CONSTRAINT `FK_Est_Usu` FOREIGN KEY (`Estado`) REFERENCES `Estados` (`Codigo`),
  ADD CONSTRAINT `FK_Per_Usu` FOREIGN KEY (`Perfil`) REFERENCES `Perfiles` (`Codigo`),
  ADD CONSTRAINT `FK_TipDoc_Usu` FOREIGN KEY (`TipoDocumento`) REFERENCES `TiposDocumentos` (`Codigo`);

--
-- Filtros para la tabla `ValidacionDeudas`
--
ALTER TABLE `ValidacionDeudas`
  ADD CONSTRAINT `FK_Cli_ValDeu` FOREIGN KEY (`Cliente`) REFERENCES `Clientes` (`Codigo`),
  ADD CONSTRAINT `FK_Ped_ValDeu` FOREIGN KEY (`Pedido`) REFERENCES `Pedidos` (`Codigo`);

--
-- Filtros para la tabla `Vendedores`
--
ALTER TABLE `Vendedores`
  ADD CONSTRAINT `FK_Est_Ven` FOREIGN KEY (`Estado`) REFERENCES `Estados` (`Codigo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
