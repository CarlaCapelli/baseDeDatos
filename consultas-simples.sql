USE `facturacion` ;

-- Obtener todos los datos de todos los clientes 
SELECT 
    *
FROM
    cliente;

 -- Obtener solo los nombres y apellidosde todos los clientes 
SELECT 
    nombre, apellido
FROM
    cliente;

-- Obtener los nombres nombres de los diferentes productos 
SELECT distinct nombre FROM producto;

-- Obtener los diferentes códigos de área de los teléfonos 
SELECT DISTINCT
    codigo_area
FROM
    telefono;
    
 --   Obtener el listado de todos los productos que tengan un stock mayor a 50 y menor a 200
SELECT codigo_producto, nombre
FROM producto
WHERE stock >50 AND stock<200;

-- Obtener los datos correspondientes al producto cuyo código es 50
 SELECT * FROM producto where codigo_producto=50;

-- Obtener los datos de las facturas cuyo total(con iva incluido) sea mayor a 400.000$ y lo haya realizado el cliente número 8
SELECT *
FROM factura
WHERE total_con_iva > 40000 AND nro_cliente = 8;

-- Obtener los datos del cliente cuyo nombre es “Ivor” y el apellido “Saunders”
SELECT *
FROM cliente
WHERE nombre LIKE 'Ivor' AND apellido LIKE 'Saunders';

-- Todas las Facturas pertenecientes al cliente número 10 
SELECT * FROM factura WHERE nro_cliente=10;

-- Todas las Facturas que superen los 50.000$
SELECT * FROM factura WHERE total_con_iva >50000;