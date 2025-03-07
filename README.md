# Laworatory_Challenge
Este repositorio contiene el reto de backend propuesto por Laworatory. Se desarrolló un backend para un informe de ventas, utilizando PHP, MySQL, HTML y CSS, con enfoque en la gestión de datos de ventas, creación de rutas para la obtención de información y generación de reportes de manera eficiente.

Requisitos Previos:
    * Servidor local (Xampp)
    * PHP
    * MySQL Workbench

Configurar el Servidor Local:
    * Mueve la carpeta del proyecto a la ruta C:/xampp/htdocs/.
    * Abre XAMPP Control Panel y activa Apache

MySQL Workbench:
    * Ejecuta el siguiente comando:
    CREATE DATABASE ventas_2025;
    * Importa el archivo "insertar_ventas.sql" en la base de datos recién creada

Configurar la Conexión a MySQL:
    * En el archivo conexion.php, verifica que las credenciales sean correctas:
        $host = "localhost";
        $dbname = "ventas_2025";
        $username = "root";
        $password = ""; // Si tienes contraseña, agrégala aquí
        $port = "";


Solución de Problemas:

1. Si MySQL no inicia debido a un puerto ocupado:
    Abre xampp/mysql/bin/my.ini y cambia por un puerto libre:
        * port=3307