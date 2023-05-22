-- Crear la base de datos si no existe y usarla
CREATE SCHEMA IF NOT EXISTS `facturacion`;
USE `facturacion`;

-- Crear tabla de clientes
CREATE TABLE IF NOT EXISTS `cliente` (
  `nro_cliente` INT PRIMARY KEY,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45),
  `direccion` VARCHAR(45),
  `activo` TINYINT
);

-- Crear tabla de teléfonos
CREATE TABLE IF NOT EXISTS `telefono` (
  `codigo_area` INT NOT NULL,
  `nro_telefono` INT NOT NULL,
  `tipo` CHAR(1),
  `nro_cliente` INT,
  PRIMARY KEY (`codigo_area`, `nro_telefono`),
  FOREIGN KEY (`nro_cliente`) REFERENCES `cliente`(`nro_cliente`)
);

-- Crear tabla de facturas
CREATE TABLE IF NOT EXISTS `factura` (
  `nro_factura` INT PRIMARY KEY,
  `fecha` DATE,
  `total_sin_iva` DOUBLE,
  `iva` DOUBLE,
  `total_con_iva` DOUBLE,
  `nro_cliente` INT,
  FOREIGN KEY (`nro_cliente`) REFERENCES `cliente`(`nro_cliente`)
);

-- Crear tabla de productos
CREATE TABLE IF NOT EXISTS `producto` (
  `codigo_producto` INT PRIMARY KEY,
  `marca` VARCHAR(45),
  `nombre` VARCHAR(45),
  `descripcion` VARCHAR(45),
  `precio` FLOAT,
  `stock` INT
);

-- Crear tabla de detalles de facturas
CREATE TABLE IF NOT EXISTS `detalle_factura` (
  `nro_factura` INT,
  `nro_item` INT,
  `cantidad` FLOAT,
  `codigo_producto` INT,
  PRIMARY KEY (`nro_factura`, `nro_item`),
  FOREIGN KEY (`nro_factura`) REFERENCES `factura`(`nro_factura`),
  FOREIGN KEY (`codigo_producto`) REFERENCES `producto`(`codigo_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION
);