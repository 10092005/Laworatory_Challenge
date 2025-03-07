<?php
include 'conexion.php';

try {
    $sql = "SELECT v.numero_factura, v.fecha_venta, v.comprador, v.articulos_vendidos, v.valor_total 
            FROM ventas v 
            WHERE v.id_empresa = 1
            ORDER BY v.fecha_venta DESC";
    
    $stmt = $pdo->query($sql);
    $ventas = $stmt->fetchAll(PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    die("Error en la consulta: " . $e->getMessage());
}
?>
