<?php include 'obtener_datos.php'; ?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reporte de Ventas</title>
    <link rel="stylesheet" href="style.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>
</head>
<body>
    <h1>Reporte de Ventas</h1>
    <p class = "descripcion">Este informe presenta la tabla de ventas correspondientes al año 2025. La información mostrada refleja el desempeño de las ventas sin incluir un análisis adicional, y está organizada para proporcionar una visión clara de los resultados obtenidos durante el año.</p>
    
    <button id="descargarPDF">Descargar PDF</button>

    <table id="ventasTable" border="1">
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
    </table>

    <script>
        document.getElementById('descargarPDF').addEventListener('click', function() {
            const { jsPDF } = window.jspdf;
            const doc = new jsPDF();
            
            html2canvas(document.getElementById('ventasTable')).then(canvas => {
                const imgData = canvas.toDataURL('image/png');
                const imgWidth = 170; 
                const imgHeight = (canvas.height * imgWidth) / canvas.width;

                doc.text("Reporte de Ventas", 15, 10);
                doc.setFontSize(10);
                doc.text("Este informe presenta la tabla de ventas correspondientes al año 2025. La información mostrada refleja el desempeño de las ventas sin incluir un análisis adicional, y está organizada para proporcionar una visión clara de los resultados obtenidos durante el año.", 15, 20, {maxWidth: 180})
                
                
                doc.addImage(imgData, 'PNG', 20, 40, imgWidth, imgHeight);
                doc.save("reporte_ventas.pdf");
            });
        });
    </script>
</body>
</html>