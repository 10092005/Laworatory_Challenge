CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarVentas`()
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE cliente VARCHAR(255);
    DECLARE producto VARCHAR(255);
    DECLARE fecha_venta DATE;
    DECLARE incremento_dia INT;

    -- Definir las listas de clientes y productos
    SET @clientes = '["Juan Pérez", "Ana Gómez", "Carlos López", "Sofía Martínez", "Luis Torres",
    "María Herrera", "Daniel Rojas", "Patricia Sánchez", "Fernando Castro", "Lorena Gutiérrez",
    "Pedro Ramírez", "Gabriela Díaz", "Héctor Paredes", "Silvia Ortega", "Ricardo Mendoza",
    "Natalia Pérez", "Javier Fernández", "Andrea Castro", "Miguel Solano", "Carmen Velázquez"]';
    
    SET @productos = '["Laptop", "Monitor", "Teclado Mecánico", "Mouse Inalámbrico", "Silla Gamer",
    "Impresora", "Disco Duro Externo", "Router Wi-Fi", "Cámara Web", "Tarjeta de Video",
    "Memoria RAM 16GB", "Fuente de Poder", "Case para PC", "SSD 1TB", "Monitor 4K",
    "Mousepad RGB", "Tablet", "Escritorio", "Auriculares Bluetooth", "Procesador Intel i7"]';
    
  
    SET fecha_venta = CURDATE();


    WHILE i <= 50 DO
        SET cliente = JSON_UNQUOTE(JSON_EXTRACT(@clientes, CONCAT('$[', FLOOR(RAND() * 20), ']')));
        SET producto = JSON_UNQUOTE(JSON_EXTRACT(@productos, CONCAT('$[', FLOOR(RAND() * 20), ']')));
        
        SET incremento_dia = FLOOR(RAND() * 5) + 1;
        
        SET fecha_venta = DATE_ADD(fecha_venta, INTERVAL incremento_dia DAY);

        INSERT INTO ventas (id_empresa, numero_factura, fecha_venta, comprador, articulos_vendidos, valor_total)
        VALUES (
            1, 
            CONCAT('F00', i), 
            fecha_venta, 
            cliente, 
            producto, 
            ROUND(RAND() * 1000 + 50, 2)
        );

    
        SET i = i + 1;
    END WHILE;

END