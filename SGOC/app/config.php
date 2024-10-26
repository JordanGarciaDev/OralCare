<?php
define('BASE_URL', 'http://localhost/OralCare/SGOC'); //si es una persona ext debe colocar localhost
define('CONFIG_PATH', $_SERVER['DOCUMENT_ROOT'] . '/OralCare/SGOC/app');
define('LAYOUT', $_SERVER['DOCUMENT_ROOT'] . '/OralCare/SGOC/layouts');
define('API', BASE_URL . '/app/APIS/');
define('VIEW', $_SERVER['DOCUMENT_ROOT'] . '/OralCare/SGOC/vistas'); //Para agregar las vistas usar esto <?= BASE_URL .'/vistas/+nombre_archivo.php;?
define('ASSET_URL', BASE_URL . '/assets'); //Para agregar las imagenes usar esto <?= ASSET_URL? /img/
define('URL_AVATARS', ASSET_URL . '/img/avatars'); // Cambiar para usar ASSET_URL
define('TARGET_DIR', $_SERVER['DOCUMENT_ROOT'] . '/OralCare/SGOC/assets/img/avatars/'); // Carpeta donde se guardarán las fotos
define('BD', $_SERVER['DOCUMENT_ROOT'] . '/OralCare/SGOC/Backup/'); // Carpeta donde se guardarán las copias base de datos
define('UPLOAD', BASE_URL . '/uploads'); //Para agregar las imagenes usar esto <?= ASSET_URL? /img/

$host = 'localhost';
$user = 'root';
$password = ''; 
$database = 'sgoc';

$conn = new mysqli($host, $user, $password, $database);

if ($conn->connect_error) {
    die("La conexión ha fallado: " . $conn->connect_error);
}

$conn->set_charset("utf8");