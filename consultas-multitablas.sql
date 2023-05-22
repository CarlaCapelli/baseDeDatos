use facturacion;

-- Mostrar cada teléfono junto con los datos del cliente.
SELECT c.* , t.nro_telefono
FROM cliente c
INNER JOIN  telefono t 
ON c.nro_cliente = t.nro_cliente;

-- Mostrar todos los teléfonos del cliente número 30 junto con todos sus datos personales.
SELECT c.* , t.nro_telefono
FROM cliente c
INNER JOIN  telefono t 
ON c.nro_cliente = t.nro_cliente
WHERE c.nro_cliente=30;

-- Mostrar nombre y apellido de cada cliente junto con lo que gastó en total (con iva incluido).
SELECT c.nombre, c.apellido, SUM(f.total_con_iva)
FROM cliente  c
INNER JOIN factura f 
ON c.nro_cliente = f.nro_cliente
GROUP BY c.nro_cliente;

-- Ejemplo Left Join. •Devolver todos los clientes, con la cantidad de facturas que tienen registradas.
SELECT c.*, COUNT(f.nro_factura) AS cuenta
FROM cliente c 
LEFT JOIN factura f 
on c.nro_cliente = f.nro_cliente
GROUP BY c.nro_cliente
HAVING cuenta >1 ;


-- Ejemplo con Right Join
SELECT 
    c.*, COUNT(f.nro_factura) AS cuenta
FROM
    factura f
        RIGHT JOIN
    cliente c ON c.nro_cliente = f.nro_cliente
GROUP BY c.nro_cliente
HAVING cuenta > 1;

