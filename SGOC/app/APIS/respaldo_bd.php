<?php
include('../../app/config.php');
$fecha = date('Y-m-d_H-i-s');
$backupFile = BD . "BD_$fecha.sql";

$conn = new mysqli($host, $user, $password, $database);
if ($conn->connect_error) {
    echo json_encode(['status' => 'error', 'message' => 'Conexión fallida.']);
    exit;
}

// Obtener todas las tablas de la base de datos
$tables = array();
$result = $conn->query("SHOW TABLES");
while ($row = $result->fetch_row()) {
    $tables[] = $row[0];
}

// Crear el respaldo
$sqlBackup = "";
foreach ($tables as $table) {
    $result = $conn->query("SELECT * FROM $table");
    $numFields = $result->field_count;

    $sqlBackup .= "DROP TABLE IF EXISTS $table;";
    $createTableResult = $conn->query("SHOW CREATE TABLE $table");
    $row2 = $createTableResult->fetch_row();
    $sqlBackup .= "\n\n" . $row2[1] . ";\n\n";

    while ($row = $result->fetch_row()) {
        $sqlBackup .= "INSERT INTO $table VALUES(";
        for ($j = 0; $j < $numFields; $j++) {
            $row[$j] = $row[$j] ? '"' . $conn->real_escape_string($row[$j]) . '"' : 'NULL';
            $sqlBackup .= $row[$j] . ",";
        }
        $sqlBackup = rtrim($sqlBackup, ',') . ");\n";
    }
    $sqlBackup .= "\n\n\n";
}

// Guardar el archivo
if (file_put_contents($backupFile, $sqlBackup)) {
    echo json_encode(['status' => 'success', 'message' => 'Backup completado!']);
} else {
    echo json_encode(['status' => 'error', 'message' => 'Error al crear el respaldo de la base de datos.']);
}

$conn->close();
?>
