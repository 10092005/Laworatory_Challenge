<?php include 'obtener_datos.php'; ?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reporte de Ventas</title>
    <link rel="stylesheet" href="styles.css">
    <!-- Importa jsPDF desde un CDN -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
</head>
<body>
    <h1>Reporte de Ventas</h1>
    <table id="ventasTable">
        <thead>
            <tr>
                <th>N° Factura</th>
                <th>Fecha</th>
                <th>Comprador</th>
                <th>Producto</th>
                <th>Valor Total (€)</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($ventas as $venta): ?>
                <tr>
                    <td><?= htmlspecialchars($venta['numero_factura']) ?></td>
                    <td><?= htmlspecialchars($venta['fecha_venta']) ?></td>
                    <td><?= htmlspecialchars($venta['comprador']) ?></td>
                    <td><?= htmlspecialchars($venta['articulos_vendidos']) ?></td>
                    <td><?= number_format($venta['valor_total'], 2, ',', '.') ?> €</td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </
