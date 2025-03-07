CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarVentas`()
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE cliente VARCHAR(255);
    DECLARE producto VARCHAR(255);
    
    -- Definir las listas de clientes y productos
    SET @clientes = '["Juan Pérez", "Ana Gómez", "Carlos López", "Sofía Martínez", "Luis Torres",
    "María Herrera", "Daniel Rojas", "Patricia Sánchez", "Fernando Castro", "Lorena Gutiérrez",
    "Pedro Ramírez", "Gabriela Díaz", "Héctor Paredes", "Silvia Ortega", "Ricardo Mendoza",
    "Natalia Pérez", "Javier Fernández", "Andrea Castro", "Miguel Solano", "Carmen Velázquez"]';
    
    SET @productos = '["Laptop", "Monitor", "Teclado Mecánico", "Mouse Inalámbrico", "Silla Gamer",
    "Impresora", "Disco Duro Externo", "Router Wi-Fi", "Cámara Web", "Tarjeta de Video",
    "Memoria RAM 16GB", "Fuente de Poder", "Case para PC", "SSD 1TB", "Monitor 4K",
    "Mousepad RGB", "Tablet", "Escritorio", "Auriculares Bluetooth", "Procesador Intel i7"]';

    -- Iniciar el ciclo WHILE para insertar las ventas
    WHILE i <= 20 DO
        -- Obtener un cliente y un producto aleatorio
        SET cliente = JSON_UNQUOTE(JSON_EXTRACT(@clientes, CONCAT('$[', FLOOR(RAND() * 20), ']')));
        SET producto = JSON_UNQUOTE(JSON_EXTRACT(@productos, CONCAT('$[', FLOOR(RAND() * 20), ']')));

        -- Insertar los datos en la tabla de ventas
        INSERT INTO ventas (id_empresa, numero_factura, fecha_venta, comprador, articulos_vendidos, valor_total)
        VALUES (
            1, 
            CONCAT('F00', i), 
            DATE_SUB(CURDATE(), INTERVAL FLOOR(RAND() * 30) DAY), 
            cliente, 
            producto, 
            ROUND(RAND() * 1000 + 50, 2)
        );

        -- Incrementar el contador
        SET i = i + 1;
    END WHILE;

END