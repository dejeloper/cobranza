-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 10-09-2024 a las 19:34:20
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
-- Base de datos: `dejelope_cobranza`
--

--
-- Volcado de datos para la tabla `TiposDocumentos`
--

INSERT INTO `TiposDocumentos` (`Codigo`, `Nombre`, `Nemonico`, `Habilitado`, `UsuarioCreacion`, `FechaCreacion`, `UsuarioModificacion`, `FechaModificacion`) VALUES
(101, 'Cédula de Ciudadanía', 'CC', 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(102, 'Cédula de Extranjería', 'CE', 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(103, 'Pasaporte', 'PP', 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(104, 'Nit', 'NIT', 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL);

--
-- Volcado de datos para la tabla `TiposEstados`
--

INSERT INTO `TiposEstados` (`Codigo`, `Nombre`, `Habilitado`, `UsuarioCreacion`, `FechaCreacion`, `UsuarioModificacion`, `FechaModificacion`) VALUES
(101, 'Usuarios', 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(102, 'Clientes', 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(103, 'Vendedores', 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(104, 'Pedidos', 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(105, 'PagosProgramados', 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(106, 'Cobradores', 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL);

--
-- Volcado de datos para la tabla `TiposPermisos`
--

INSERT INTO `TiposPermisos` (`Codigo`, `Nombre`, `Habilitado`, `UsuarioCreacion`, `FechaCreacion`, `UsuarioModificacion`, `FechaModificacion`) VALUES
(101, 'Página', 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(102, 'Acción', 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(103, 'Botón', 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(104, 'Menú', 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL);

--
-- Volcado de datos para la tabla `TiposViviendas`
--

INSERT INTO `TiposViviendas` (`Codigo`, `Nombre`, `Habilitado`, `UsuarioCreacion`, `FechaCreacion`, `UsuarioModificacion`, `FechaModificacion`) VALUES
(101, 'Propia', 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(102, 'Familiar', 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(103, 'Arriendo', 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(104, 'Sin Especificar', 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL);

--
-- Volcado de datos para la tabla `Estados`
--

INSERT INTO `Estados` (`Codigo`, `Nombre`, `TipoEstado`, `Habilitado`, `UsuarioCreacion`, `FechaCreacion`, `UsuarioModificacion`, `FechaModificacion`) VALUES
(101, 'Activo', 101, 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(102, 'Inactivo', 101, 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(103, 'Bloqueado', 101, 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(104, 'Al día', 102, 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(105, 'Debe', 102, 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(106, 'Devolución', 102, 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(107, 'Activo', 103, 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(108, 'Vacaciones', 103, 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(109, 'Inactivo', 103, 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(110, 'Sin Pago', 104, 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(111, 'Al día', 104, 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(112, 'Deuda', 104, 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(113, 'Devolución', 104, 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(114, 'Paz y Salvo', 104, 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(115, 'DataCredito', 102, 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(116, 'Programado', 105, 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(117, 'Pagado', 105, 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(118, 'No Pagado', 105, 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(119, 'En Operación', 106, 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(120, 'Inactivo', 106, 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(121, 'Bloqueado', 106, 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(122, 'Descartado', 105, 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(123, 'Paz y Salvo', 102, 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(124, 'En Mora', 102, 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(125, 'DataCredito', 104, 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(126, 'Reportado', 102, 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(127, 'Reportado', 104, 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL);

--
-- Volcado de datos para la tabla `Administradores`
--

INSERT INTO `Administradores` (`Codigo`, `Nombre`, `Direccion`, `Telefono1`, `Telefono2`, `Telefono3`, `Cargo`, `Habilitado`, `UsuarioCreacion`, `FechaCreacion`, `UsuarioModificacion`, `FechaModificacion`) VALUES
(100, 'Jhonatan Guerrero', 'Cr 88 C 74-26 Sur', '3138227185', '5700426', NULL, 'Desarrollador', 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL);

--
-- Volcado de datos para la tabla `Cobradores`
--

INSERT INTO `Cobradores` (`Codigo`, `Nombre`, `TipoDocumento`, `Documento`, `Direccion`, `Telefono1`, `Telefono2`, `Correo`, `Estado`, `Habilitado`, `UsuarioCreacion`, `FechaCreacion`, `UsuarioModificacion`, `FechaModificacion`) VALUES  
(101, 'Nequi', 101, '0', '.', '0', NULL, NULL, 119, 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(102, 'Daviplata', 101, '0', '.', '0', NULL, NULL, 119, 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(103, 'Ahorro a la Mano', 101, '0', '.', '0', NULL, NULL, 119, 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL), 
(104, 'Servientrega', 101, '0', '.', '0', NULL, NULL, 119, 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(105, 'PAGATODO', 101, '0', '.', '0', NULL, NULL, 119, 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL);

--
-- Volcado de datos para la tabla `Direcciones`
--

INSERT INTO `Direcciones` (`Codigo`, `Direccion`, `Etapa`, `Torre`, `Apartamento`, `Manzana`, `Interior`, `Casa`, `Barrio`, `TipoVivienda`, `Habilitado`, `UsuarioCreacion`, `FechaCreacion`, `UsuarioModificacion`, `FechaModificacion`) VALUES
(1, 'Dirección Guia', '', '', '', '', '', '', '', 101, 1, 'ADMIN', '2018-08-21 07:00:00', NULL, NULL);   

--
-- Volcado de datos para la tabla `Vendedores`
--

INSERT INTO `Vendedores` (`Codigo`, `Usuario`, `Nombre`, `Estado`, `Habilitado`, `UsuarioCreacion`, `FechaCreacion`, `UsuarioModificacion`, `FechaModificacion`) VALUES
(1, 'Jhonatan', 'Jhonatan Guerrero', 107, 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL);
COMMIT;

--
-- Volcado de datos para la tabla `Eventos`
--

INSERT INTO `Eventos` (`Codigo`, `Vendedor`, `Iglesia`, `Barrio`, `Fecha`, `Habilitado`, `UsuarioCreacion`, `FechaCreacion`, `UsuarioModificacion`, `FechaModificacion`) VALUES
(1, 1, 'Evento Inicial', '', '0000-00-00 00:00:00', 1, 'ADMIN', '0000-00-00 00:00:00', NULL, NULL);  

--
-- Volcado de datos para la tabla `MotivosLlamadas`
--

INSERT INTO `MotivosLlamadas` (`Codigo`, `Nombre`, `Color`, `Habilitado`, `UsuarioCreacion`, `FechaCreacion`, `UsuarioModificacion`, `FechaModificacion`) VALUES
(100, 'Pendiente', '', 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(101, 'Pago Programado', 'green', 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(102, 'Cliente no Paga', 'red', 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(103, 'Llamar más tarde', 'orange', 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(104, 'Llamar otro día', 'black', 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL);

--
-- Volcado de datos para la tabla `Perfiles`
--

INSERT INTO `Perfiles` (`Codigo`, `Nombre`, `Habilitado`, `UsuarioCreacion`, `FechaCreacion`, `UsuarioModificacion`, `FechaModificacion`) VALUES
(100, 'Desarrollador', 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(101, 'Administrador', 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(102, 'Coordinador', 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(103, 'Auxiliar', 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL);

--
-- Volcado de datos para la tabla `Permisos`
--

INSERT INTO `Permisos` (`Codigo`, `Nombre`, `Tipo`, `Controlador`, `Habilitado`, `UsuarioCreacion`, `FechaCreacion`, `UsuarioModificacion`, `FechaModificacion`) VALUES
(1, 'Lista de Usuarios', 101, 'Usuarios', 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(2, 'Crear Usuario', 101, 'Usuarios', 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(3, 'Consultar Usuario', 101, 'Usuarios', 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(4, 'Resetear Contraseña', 102, 'Usuarios', 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(5, 'Log Usuario', 101, 'Log', 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(6, 'Eliminar Usuario', 101, 'Usuarios', 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(7, 'Lista Usuarios Eliminados', 101, 'Usuarios', 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(8, 'Lista Permisos', 101, 'Permisos', 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(9, 'Permisos Por Usuarios', 101, 'Permisos', 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(10, 'Asignar Permiso', 101, 'Permisos', 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(11, 'Lista Clientes', 101, 'Clientes', 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(12, 'Clientes Al día', 101, 'Clientes', 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(13, 'Clientes Morosos', 101, 'Clientes', 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(14, 'Clientes Datacredito', 101, 'Clientes', 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(15, 'Consultar Cliente', 101, 'Clientes', 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(16, 'Cambio Fecha Cobro Cliente', 101, 'Clientes', 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(17, 'Cambio Tarifa Cliente', 101, 'Clientes', 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(18, 'Lista Pagos Programados ', 101, 'Pagos', 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(19, 'Crear Pago Programado', 101, 'Pagos', 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(20, 'Consultar Pago Programado', 101, 'Pagos', 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(21, 'Confirmar Pago Programado', 101, 'Pagos', 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(22, 'Descartar Pago Programado', 101, 'Pagos', 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(23, 'Lista Pagos Por Cliente', 101, 'Pagos', 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(24, 'Consultar Pago', 101, 'Pagos', 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(25, 'Historial Pagos', 101, 'Pagos', 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(26, 'Log Cliente', 101, 'Log', 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(27, 'Llamadas del Día', 101, 'Pagos', 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(28, 'GestionHoy', 101, 'Cobradores', 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(29, 'Volver a Llamar', 101, 'Cobradores', 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(30, 'GestionDía', 101, 'Cobradores', 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(31, 'Visitas Programadas', 101, 'Pagos', 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(32, 'Imprimir Recibos', 101, 'Pagos', 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(33, 'Pagos Confirmados ', 101, 'Pagos', 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(34, 'Reversar Pagos', 101, 'Pagos', 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(35, 'Listado Devoluciones', 101, 'Pagos', 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(36, 'Reporte Contador Clientes ', 101, 'Clientes', 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(37, 'Reporte Contador Pagos', 101, 'Pagos', 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(38, 'Reporte Cartera Por Usuario', 101, 'Reportes', 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(39, 'Reporte Cartera Por Cobrador', 101, 'Reportes', 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(40, 'Reporte Cartera Por Día', 101, 'Reportes', 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(41, 'Reporte Clientes última Cuota', 101, 'Reportes', 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(42, 'Reporte Ventas (Reversar)', 101, 'Reportes', 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(43, 'Reporte Estadistica 1', 101, 'Reportes', 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(44, 'Reporte Estadistica 2', 101, 'Reportes', 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(45, 'Reporte Cartera Bruta y Neta', 101, 'Reportes', 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(46, 'Lista Productos', 101, 'Productos', 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(47, 'Crear Producto', 101, 'Productos', 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(48, 'Consultar Producto', 101, 'Productos', 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(49, 'Lista Tarifas', 101, 'Tarifas', 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(50, 'Crear Tarifa', 101, 'Tarifas', 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(51, 'Consultar Tarifa', 101, 'Tarifas', 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(52, 'Lista Cobradores', 101, 'Cobradores', 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(53, 'Crear Cobrador', 101, 'Cobradores', 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(54, 'Editar Cobrador', 101, 'Cobradores', 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(55, 'Lista Vendedores', 101, 'Vendedores', 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(56, 'Crear Vendedores', 101, 'Vendedores', 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(57, 'Editar Vendedores', 101, 'Vendedores', 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL),
(58, 'Listado De Permisos', 101, 'Permisos', 1, 'Desarrollador', '2018-09-01 07:00:00', NULL, NULL),
(59, 'Buscar Clientes', 103, 'Login', 1, 'Desarrollador', '2018-09-01 07:00:00', NULL, NULL),
(60, 'Llamadas Del Día', 103, 'Login', 1, 'Desarrollador', '2018-09-01 07:00:00', NULL, NULL),
(61, 'Recibos De Pago', 103, 'Login', 1, 'Desarrollador', '2018-09-01 07:00:00', NULL, NULL),
(62, 'Cartera Por Usuario', 103, 'Login', 1, 'Desarrollador', '2018-09-01 07:00:00', NULL, NULL),
(63, 'Clientes Master', 104, 'Menú', 1, 'Desarrollador', '2018-09-01 07:00:00', NULL, NULL),
(64, 'Clientes Al Día', 104, 'Menú', 1, 'Desarrollador', '2018-09-01 07:00:00', NULL, NULL),
(65, 'Clientes Morosos', 104, 'Menú', 1, 'Desarrollador', '2018-09-01 07:00:00', NULL, NULL),
(66, 'Clientes Datacrédito', 104, 'Menú', 1, 'Desarrollador', '2018-09-01 07:00:00', NULL, NULL),
(67, 'Buscar Clientes', 104, 'Menú', 1, 'Desarrollador', '2018-09-01 07:00:00', NULL, NULL),
(68, 'Clientes Asignados', 104, 'Menú', 1, 'Desarrollador', '2018-09-01 07:00:00', NULL, NULL),
(69, 'Gestión De Pagos Master', 104, 'Menú', 1, 'Desarrollador', '2018-09-01 07:00:00', NULL, NULL),
(70, 'Llamadas Del Día', 104, 'Menú', 1, 'Desarrollador', '2018-09-01 07:00:00', NULL, NULL),
(71, 'Clientes Sin Llamar', 104, 'Menú', 1, 'Desarrollador', '2018-09-01 07:00:00', NULL, NULL),
(72, 'Volver A Llamar', 104, 'Menú', 1, 'Desarrollador', '2018-09-01 07:00:00', NULL, NULL),
(73, 'Recibos De Pago', 104, 'Menú', 1, 'Desarrollador', '2018-09-01 07:00:00', NULL, NULL),
(74, 'Pagos Finalizados', 104, 'Menú', 1, 'Desarrollador', '2018-09-01 07:00:00', NULL, NULL),
(75, 'Devolución Master', 104, 'Menú', 1, 'Desarrollador', '2018-09-01 07:00:00', NULL, NULL),
(76, 'Listado De Devoluciones', 104, 'Menú', 1, 'Desarrollador', '2018-09-01 07:00:00', NULL, NULL),
(77, 'Reportes Master', 104, 'Menú', 1, 'Desarrollador', '2018-09-01 07:00:00', NULL, NULL),
(78, 'Reporte De Clientes', 104, 'Menú', 1, 'Desarrollador', '2018-09-01 07:00:00', NULL, NULL),
(79, 'Reporte De Pagos', 104, 'Menú', 1, 'Desarrollador', '2018-09-01 07:00:00', NULL, NULL),
(80, 'Cartera Por Usuario', 104, 'Menú', 1, 'Desarrollador', '2018-09-01 07:00:00', NULL, NULL),
(81, 'Listas Master', 104, 'Menú', 1, 'Desarrollador', '2018-09-01 07:00:00', NULL, NULL),
(82, 'Lista Productos', 104, 'Menú', 1, 'Desarrollador', '2018-09-01 07:00:00', NULL, NULL),
(83, 'Lista Tarifas', 104, 'Menú', 1, 'Desarrollador', '2018-09-01 07:00:00', NULL, NULL),
(84, 'Configuraciones Master', 104, 'Menú', 1, 'Desarrollador', '2018-09-01 07:00:00', NULL, NULL),
(85, 'Usuarios', 104, 'Menú', 1, 'Desarrollador', '2018-09-01 07:00:00', NULL, NULL),
(86, 'Permisos', 104, 'Menú', 1, 'Desarrollador', '2018-09-01 07:00:00', NULL, NULL),
(87, 'Lista Usuarios Eliminados', 103, 'Usuarios', 1, 'Desarrollador', '2018-09-01 07:00:00', NULL, NULL),
(88, 'Nuevo Cliente/Pedido', 101, 'Clientes', 1, 'Desarrollador', '2018-09-01 07:00:00', NULL, NULL),
(89, 'Importar Clientes', 103, 'Clientes', 1, 'Desarrollador', '2018-09-01 07:00:00', NULL, NULL),
(90, 'Popup Devoluciones', 101, 'Devolución', 1, 'Desarrollador', '2018-09-01 07:00:00', NULL, NULL),
(91, 'Crear Cliente', 102, 'Clientes', 1, 'Desarrollador', '2018-09-01 07:00:00', NULL, NULL),
(92, 'Modificar Clientes - Datos Personales', 102, 'Clientes', 1, 'Desarrollador', '2018-09-01 07:00:00', NULL, NULL),
(93, 'Modificar Clientes - Datos Adicionales', 102, 'Clientes', 1, 'Desarrollador', '2018-09-01 07:00:00', NULL, NULL),
(94, 'Lista De Productos', 103, 'Productos', 1, 'Desarrollador', '2018-09-01 07:00:00', NULL, NULL),
(95, 'Cambiar Fecha De Pago', 102, 'Clientes', 1, 'Desarrollador', '2018-09-01 07:00:00', NULL, NULL),
(96, 'Cambiar Tarifa', 102, 'Clientes', 1, 'Desarrollador', '2018-09-01 07:00:00', NULL, NULL),
(97, 'Hacer Devolución', 102, 'Devolución', 1, 'Desarrollador', '2018-09-01 07:00:00', NULL, NULL),
(98, 'Programar Pago', 102, 'Pagos', 1, 'Desarrollador', '2018-09-01 07:00:00', NULL, NULL),
(99, 'Asignar Clientes Nuevos', 102, 'Clientes', 1, 'Desarrollador', '2018-09-01 07:00:00', NULL, NULL),
(100, 'Hacer Recibo De Pago', 103, 'Pagos', 1, 'Desarrollador', '2018-09-01 07:00:00', NULL, NULL),
(101, 'Información Todos Los Clientes', 102, 'Clientes', 1, 'Desarrollador', '2018-09-01 07:00:00', NULL, NULL),
(102, 'Información Otros Clientes', 102, 'Clientes', 1, 'Desarrollador', '2018-09-01 07:00:00', NULL, NULL),
(103, 'Información Todos los Clientes', 102, 'Clientes', 1, 'Desarrollador', '2018-09-01 07:00:00', NULL, NULL),
(104, 'Información Ningún Cliente', 102, 'Clientes', 1, 'Desarrollador', '2018-09-01 07:00:00', NULL, NULL),
(105, 'Carta Datacrédito', 101, 'Pagos', 1, 'Desarrollador', '2018-09-01 07:00:00', NULL, NULL),
(106, 'Popup: Reportar a Datacrédito', 101, 'Pagos', 1, 'Desarrollador', '2018-09-01 07:00:00', NULL, NULL),
(107, 'Llamadas Solo Clientes Propios', 102, 'Pagos', 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL);

--
-- Volcado de datos para la tabla `Productos`
--

INSERT INTO `Productos` (`Codigo`, `Nombre`, `Valor`, `Habilitado`, `UsuarioCreacion`, `FechaCreacion`, `UsuarioModificacion`, `FechaModificacion`) VALUES
(1, 'Imagen', 1, 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL);

--
-- Volcado de datos para la tabla `SuperUsuarios`
--

INSERT INTO `SuperUsuarios` (`Codigo`, `Usuario`, `Habilitado`) VALUES
(1, 'Adriana', 1);

--
-- Volcado de datos para la tabla `Tarifas`
--

INSERT INTO `Tarifas` (`Codigo`, `Nombre`, `Producto`, `Valor`, `Cuotas`, `ValorCuota`, `Descuento`, `Habilitado`, `UsuarioCreacion`, `FechaCreacion`, `UsuarioModificacion`, `FechaModificacion`) VALUES
(1, 'Tarifa Importada sin Valor', 1, 0, 0, 0, 0, 0, 'ADMIN', '2018-05-30 07:00:00', NULL, NULL);

--
-- Volcado de datos para la tabla `Usuarios`
--

INSERT INTO `Usuarios` (`Codigo`, `Usuario`, `Pass`, `Salt`, `Nombre`, `TipoDocumento`, `Documento`, `Perfil`, `Administrador`, `Estado`, `CambioPass`, `Habilitado`, `UsuarioCreacion`, `FechaCreacion`, `UsuarioModificacion`, `FechaModificacion`) VALUES
(100, 'Desarrollador', '$2y$10$9g/9ajCbElCnpDYhuFqX7u7iRDR//JNW0x543uPsd7ZFegkPF5XD2', '$2y$10$9g/9ajCbElCnpDYhuFqX7u3.rS/pxw==$', 'Jhonatan Guerrero', 101, '1024526544', 100, 100, 101, 1, 1, 'ADMIN', '2018-09-01 07:00:00', NULL, NULL);
-- (101, 'Adriana', '$2y$10$NuzHvNwHi8LsCJeYILXyU.Bz6sMZYLkdtcwaWG83G76CmG7JnpM0a', '$2y$10$NuzHvNwHi8LsCJeYILXyUCjFlcTXsA==$', 'Adriana Suarez', 101, '000000000', 101, 101, 101, 1, 1, 'ADMIN', '2018-09-01 07:00:00', 'Adriana', '2024-05-06 21:08:38'),
-- (102, 'lorena.coji', '$2y$10$NuzHvNwHi8LsCJeYILXyU.UvPBUOGtnOVE7yDYNQ/eWiZ6FYBrgQO', '$2y$10$NuzHvNwHi8LsCJeYILXyUCjFlcTXsA==$', 'Maria', 101, '000000000', 103, 101, 101, 1, 1, 'ADMIN', '2018-09-01 07:00:00', 'Adriana', '2024-05-06 21:10:38'),
-- (103, 'oscar.fandino', '$2y$10$NuzHvNwHi8LsCJeYILXyU.Bz6sMZYLkdtcwaWG83G76CmG7JnpM0a', '$2y$10$NuzHvNwHi8LsCJeYILXyUCjFlcTXsA==$', 'Oscar Fandiño', 101, '000000000', 103, 101, 101, 0, 1, 'ADMIN', '2018-09-01 07:00:00', 'oscar.fandino', '2018-09-01 14:03:53'),
-- (104, 'lizeth.cortes', '$2y$10$NuzHvNwHi8LsCJeYILXyU.lnDW0MVf9.GFGhNQ7CoqNZB7LLOvAcK', '$2y$10$NuzHvNwHi8LsCJeYILXyUCjFlcTXsA==$', 'Lizeth Cortes', 101, '1010008673', 103, 101, 101, 0, 1, 'ADMIN', '2023-03-06 07:00:00', 'lizeth.cortes', '2023-03-07 07:53:27'),
-- (105, 'Maria.Medina', '$2y$10$h4zd0FlnaUBjpoC3mOm4RO8yOo0pxmma.MLRXZozBjn28y7W7a.7C', '$2y$10$h4zd0FlnaUBjpoC3mOm4RVXWsQhnzQ==$', 'Maria Medina', 101, '1063158004', 103, 101, 101, 1, 1, 'Adriana', '2024-05-06 21:12:38', NULL, NULL),
-- (106, 'Katerine.Mahecha', '$2y$10$9abLBNG5ADTc2rVszREH6OiqHep/5T1vBuMn0WhxSaMxWXR.bq8qW', '$2y$10$9abLBNG5ADTc2rVszREH6O3688iEXA==$', 'Katerine Mahecha', 101, '1002604505', 103, 100, 101, 1, 1, 'Adriana', '2024-05-06 21:22:30', NULL, NULL);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
