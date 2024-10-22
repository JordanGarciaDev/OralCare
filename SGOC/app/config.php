<?php
define('BASE_URL', 'http://interno.oralcare.com/OralCare/SGOC');
define('CONFIG_PATH', $_SERVER['DOCUMENT_ROOT'] . '/OralCare/SGOC/app');
define('LAYOUT', $_SERVER['DOCUMENT_ROOT'] . '/OralCare/SGOC/layouts');
define('VIEW', $_SERVER['DOCUMENT_ROOT'] . '/OralCare/SGOC/vistas'); //Para agregar las vistas usar esto <?= BASE_URL .'/vistas/+nombre_archivo.php;?
define('ASSET_URL', BASE_URL . '/assets'); //Para agregar las imagenes usar esto <?= ASSET_URL? /img/

$host = 'localhost';
$user = 'root';
$password = ''; 
$database = 'sgoc';

$conn = new mysqli($host, $user, $password, $database);

if ($conn->connect_error) {
    die("La conexión ha fallado: " . $conn->connect_error);
}

$conn->set_charset("utf8");