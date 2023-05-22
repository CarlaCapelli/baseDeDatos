USE facturacion;
-- ¿Cuál es el nombre del cliente que ha realizado la mayor cantidad de compras?

SELECT 
    c.nombre
FROM
    factura f
        INNER JOIN
    cliente c ON f.nro_cliente = c.nro_cliente
GROUP BY f.nro_cliente
ORDER BY COUNT(f.nro_cliente) DESC
LIMIT 1;

-- ¿Cuál es el producto más facturado y cuántas unidades se han facturado en total?

SELECT 
    p.nombre, SUM(cantidad) AS cantidad
FROM
    detalle_factura df
        INNER JOIN
    producto p ON df.codigo_producto = p.codigo_producto
GROUP BY df.codigo_producto
ORDER BY cantidad DESC
LIMIT 1;

-- ¿Cuáles son los clientes que no tienen un número de teléfono registrado en la base de datos?

SELECT nombre
FROM cliente
WHERE nro_cliente NOT IN(
	SELECT nro_cliente
    FROM telefono);
-- ¿Cuáles son los productos que no han sido comprados por ningún cliente?.

SELECT nombre
FROM producto
WHERE codigo_producto NOT IN (
	SELECT codigo_producto
    FROM detalle_factura
);

-- ¿Cuáles son los productos que han sido vendidos en la “2016-08-22” fecha?
SELECT p.nombre
FROM producto p
WHERE p.codigo_producto IN (
	SELECT df.codigo_producto
	FROM factura f
	INNER JOIN detalle_factura df
	ON f.nro_factura = df.nro_factura
	WHERE f.fecha = '2016-08-22'
	);
    
    -- ¿Cuáles son los clientes que han comprado productos de la marca “Lectus Corporation”?
    
    SELECT 
    c.nombre
FROM
    cliente c
WHERE
    c.nro_cliente IN (SELECT 
            f.nro_cliente
        FROM
            factura f
                INNER JOIN
            detalle_factura df ON f.nro_factura = df.nro_factura
                INNER JOIN
            producto p ON df.codigo_producto = p.codigo_producto
        WHERE
            p.marca = 'Lectus Corporation');

-- ¿Cuáles son los productos que han sido comprados por el cliente con nombre "Merrill" y apellido “Allen”?

SELECT DISTINCT p.nombre
FROM producto p
INNER JOIN detalle_factura df ON p.codigo_producto = df.codigo_producto
INNER JOIN factura f ON f.nro_factura = df.nro_factura
INNER JOIN cliente c ON c.nro_cliente = f.nro_cliente
WHERE c.nombre = 'Merrill' AND c.apellido = 'Allen';

