<?php
include('../../app/config.php');
header('Content-Type: application/json');

$action = isset($_GET['action']) ? $_GET['action'] : '';

// Obtener todos los documentos
if ($action == 'fetch') {
    $query = "SELECT *, p.id AS idDoc FROM documentos p INNER JOIN empleados em ON p.id = em.id INNER JOIN nombres_pruebas_tecnicas pt ON p.nombre_id = pt.id";
    $result = $conn->query($query);
    $data = array();

    while ($row = $result->fetch_assoc()) {
        $data[] = $row;
    }

    echo json_encode(array('data' => $data));
}

// Guardar un nuevo TITULO AQUI o actualizar uno existente
if ($action == 'save') {
    $id = isset($_POST['id']) ? $_POST['id'] : '';
    $nombre = $_POST['nombre'];
    $tdoc_id = $_POST['tdoc_id'];
    $empleado_id = $_POST['emp_id'];

    if ($id == '') {
        // Crear nuevo
        $query = "INSERT INTO documentos (empleado_id,nombre,tdoc_id) VALUES (?,?,?)";
        $stmt = $conn->prepare($query);
        $stmt->bind_param('isi', $empleado_id,$nombre,$tdoc_id);   //i = int  s=string, varchar, text
        $stmt->execute();
        $stmt->close();
    } else {
        // Actualizar existente
        $query = "UPDATE documentos SET empleado_id = ?, nombre = ?, tdoc_id = ? WHERE id = ?";
        $stmt = $conn->prepare($query);
        $stmt->bind_param('isii', $empleado_id, $nombre, $tdoc_id, $id);
        $stmt->execute();
        $stmt->close();
    }

    echo json_encode(array('status' => 'success'));
}

// Editar (obtener un TITULO AQUI por id)
if ($action == 'edit') {
    $id = $_GET['id'];
    $query = "SELECT *, p.id AS idDoc FROM documentos p INNER JOIN empleados em ON p.id = em.id INNER JOIN nombres_pruebas_tecnicas pt ON p.nombre_id =pt.id WHERE p.id = ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param('i', $id);
    $stmt->execute();
    $result = $stmt->get_result();
    $row = $result->fetch_assoc();

    echo json_encode($row);
}

// Eliminar
if ($action == 'delete') {
    $id = $_GET['id'];
    $query = "DELETE FROM documentos WHERE id = ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param('i', $id);
    $stmt->execute();

    echo json_encode(array('status' => 'success'));
}


// Obtener tipos de documentos
if ($action == 'tipos_documentos') {
    $query = "SELECT id, nombre FROM tipo_docs";
    $result = $conn->query($query);
    $data = array();

    if ($result) {
        while ($row = $result->fetch_assoc()) {
            $data[] = $row;
        }
        echo json_encode($data);
    } else {
        echo json_encode(array('error' => $conn->error));
    }
}

?>
