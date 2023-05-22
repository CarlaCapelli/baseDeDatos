USE facturacion;

-- Obtener el número total de clientes que se encuentran registrados en la base de datos
SELECT count(*) FROM cliente;

-- Listar el precio promedio de cada marca
SELECT marca , AVG(precio)
FROM producto
GROUP BY marca;

-- Listar el nombre junto con el precio promedio de los 10 primeros productos ordenados alfabéticamente

SELECT nombre, AVG(precio)
FROM producto
GROUP BY nombre
ORDER BY nombre
LIMIT 10;

-- Listar lo que gastó cada cliente, mostrando el número de cliente y la suma total

SELECT nro_cliente, SUM(total_con_iva)
FROM factura
GROUP BY nro_cliente;

-- Listar las marcas cuyo promedio de precios sea mayor a 600$
SELECT 
    marca, AVG(precio)
FROM
    producto
GROUP BY marca
HAVING AVG(precio) > 600; 