USE `facturacion` ;

-- Insertar el producto "turron" de la empresa "misky" con un precio de 4$ y un stock de 100 unidades.
INSERT INTO
producto(codigo_producto,marca,
nombre,descripcion,precio,stock)
VALUES (102,"Misky","turron",
"turron de mani","4",100); 

-- Actualizar el código de área por "526" de los teléfonos que tenían código de área "551“
UPDATE telefono 
SET 
    codigo_area = 526
WHERE
    codigo_area = 551;
    
-- Borrar el producto insertado en 1
DELETE FROM producto 
WHERE
    nombre = 'turron' AND marca = 'misky';