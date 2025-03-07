CREATE TABLE `ventas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_empresa` int DEFAULT '1',
  `numero_factura` varchar(255) DEFAULT NULL,
  `fecha_venta` date DEFAULT NULL,
  `comprador` varchar(255) DEFAULT NULL,
  `articulos_vendidos` varchar(255) DEFAULT NULL,
  `valor_total` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
)