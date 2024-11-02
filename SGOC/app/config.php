<?php
define('BASE_URL', 'http://localhost/OralCare/SGOC'); //si es una persona ext debe colocar localhost
define('CONFIG_PATH', $_SERVER['DOCUMENT_ROOT'] . '/app');
define('LAYOUT', $_SERVER['DOCUMENT_ROOT'] . '/OralCare/SGOC/layouts');
define('API', BASE_URL . '/app/APIS/');
define('VIEW', BASE_URL . '/vistas'); //Para agregar las vistas usar esto <?= VIEW .'/vistas/+nombre_archivo.php;?
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


class DBConnection {
    public $conn;

    public function __construct() {
        // Usar variables globales directamente en el constructor
        global $host, $user, $password, $database;

        $this->conn = new mysqli($host, $user, $password, $database);

        if ($this->conn->connect_error) {
            die('La conexión ha fallado: ' . $this->conn->connect_error);
        }
    }

    public function __destruct() {
        $this->conn->close();
    }
}

// Crear una instancia de DBConnection
$dbConnection = new DBConnection();

?>