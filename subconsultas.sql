USE `facturacion` ;
-- Listar todas las Facturas que hayan sido compradas por el cliente de nombre "Pandora" y apellido "Tate".
SELECT 
    *
FROM
    factura
WHERE
    nro_cliente IN (SELECT 
            nro_cliente
        FROM
            cliente
        WHERE
            nombre LIKE 'Pandora'
                AND apellido LIKE 'Tate');
                
                
-- Listar todas las Facturas que contengan productos de la marca "In Faucibus Inc.“
SELECT 
    *
FROM
    factura
WHERE
    nro_factura IN (SELECT 
            nro_factura
        FROM
            detalle_factura
        WHERE
            codigo_producto IN (SELECT 
                    codigo_producto
                FROM
                    producto
                WHERE
                    marca LIKE 'In Faucibus Inc.'));